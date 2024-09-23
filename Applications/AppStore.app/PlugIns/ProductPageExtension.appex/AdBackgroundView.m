@implementation AdBackgroundView

- (_TtC20ProductPageExtension16AdBackgroundView)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtension16AdBackgroundView *)sub_100301C88(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC20ProductPageExtension16AdBackgroundView)initWithCoder:(id)a3
{
  id v4;
  _TtC20ProductPageExtension16AdBackgroundView *result;

  *((_BYTE *)&self->super.super.super.super.isa + OBJC_IVAR____TtC20ProductPageExtension16AdBackgroundView_isBorderHidden) = 0;
  v4 = a3;

  result = (_TtC20ProductPageExtension16AdBackgroundView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000100685560, "ProductPageExtension/AdBackgroundView.swift", 43, 2, 48, 0);
  __break(1u);
  return result;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC20ProductPageExtension16AdBackgroundView *v6;

  v5 = a3;
  v6 = self;
  sub_100301FF0(a3);

}

@end
