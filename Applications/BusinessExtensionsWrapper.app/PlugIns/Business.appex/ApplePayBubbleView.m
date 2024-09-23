@implementation ApplePayBubbleView

- (_TtC8Business18ApplePayBubbleView)initWithCoder:(id)a3
{
  id v4;
  _TtC8Business18ApplePayBubbleView *result;

  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC8Business18ApplePayBubbleView_applePayButtonWidthConstraint) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC8Business18ApplePayBubbleView____lazy_storage___applePayButton) = 0;
  v4 = a3;

  result = (_TtC8Business18ApplePayBubbleView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001000B3DA0, "Business/ApplePayBubbleView.swift", 33, 2, 58, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8Business18ApplePayBubbleView_applePayManager));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8Business18ApplePayBubbleView_applePayButtonWidthConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8Business18ApplePayBubbleView____lazy_storage___applePayButton));
}

@end
