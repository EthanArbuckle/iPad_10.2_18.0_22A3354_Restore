@implementation IMBJITAppKitBubbleView

- (_TtC8Business22IMBJITAppKitBubbleView)initWithCoder:(id)a3
{
  id v4;
  _TtC8Business22IMBJITAppKitBubbleView *result;

  *((_BYTE *)&self->super.super.super.super.isa + OBJC_IVAR____TtC8Business22IMBJITAppKitBubbleView_bubbleState) = 1;
  v4 = a3;

  result = (_TtC8Business22IMBJITAppKitBubbleView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001000B3DA0, "Business/IMBJITAppKitBubbleView.swift", 37, 2, 36, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  uint64_t v2;
  void *v3;

  v3 = *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC8Business22IMBJITAppKitBubbleView_model);
  v2 = *(_QWORD *)&self->super.touchDelay[OBJC_IVAR____TtC8Business22IMBJITAppKitBubbleView_model];

  swift_release(v2);
}

@end
