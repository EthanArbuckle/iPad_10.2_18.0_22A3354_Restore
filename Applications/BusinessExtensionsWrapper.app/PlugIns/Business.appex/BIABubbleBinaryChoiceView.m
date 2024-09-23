@implementation BIABubbleBinaryChoiceView

- (_TtC8Business25BIABubbleBinaryChoiceView)initWithFrame:(CGRect)a3
{
  return (_TtC8Business25BIABubbleBinaryChoiceView *)sub_100053460(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8Business25BIABubbleBinaryChoiceView)initWithCoder:(id)a3
{
  _QWORD *v4;
  id v5;
  _TtC8Business25BIABubbleBinaryChoiceView *result;

  v4 = (Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8Business25BIABubbleBinaryChoiceView_delegate);
  *v4 = 0;
  v4[1] = 0;
  v5 = a3;

  result = (_TtC8Business25BIABubbleBinaryChoiceView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000032, 0x80000001000B80C0, "Business/BIABubbleBinaryChoiceView.swift", 40, 2, 98, 0);
  __break(1u);
  return result;
}

- (void)handleLeftButtonTap
{
  sub_100053968((char *)self, (uint64_t)a2, 0);
}

- (void)handleRightButtonTap
{
  sub_100053968((char *)self, (uint64_t)a2, 1);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Business25BIABubbleBinaryChoiceView_leftButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Business25BIABubbleBinaryChoiceView_rightButton));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                      + OBJC_IVAR____TtC8Business25BIABubbleBinaryChoiceView_delegate));
}

@end
