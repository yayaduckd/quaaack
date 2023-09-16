const std = @import("std");
const stdin = std.io.getStdIn().reader();

const stdout_file = std.io.getStdOut().writer();
var bw = std.io.bufferedWriter(stdout_file);
const stdout = bw.writer();

fn nextInputWord() !?[]u8 {
    var buf: [1000]u8 = undefined;

    std.debug.print("Input please:", .{});
    const receivedInput: ?[]u8 = try stdin.readUntilDelimiterOrEof(buf[0..], ' ');

    return receivedInput;
}

pub fn main() !void {
    var word: ?[]u8 = try nextInputWord();

    if (word) |actualWord| {
        std.debug.print("{s} 🦆\n", .{actualWord});
    }

    try bw.flush(); // don't forget to flush!
}

test "simple test" {
    var list = std.ArrayList(i32).init(std.testing.allocator);
    defer list.deinit(); // try commenting this out and see if zig detects the memory leak!
    try list.append(42);
    try std.testing.expectEqual(@as(i32, 42), list.pop());
}
