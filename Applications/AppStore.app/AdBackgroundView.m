@implementation AdBackgroundView

- (_TtC8AppStore16AdBackgroundView)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore16AdBackgroundView *)sub_100449550(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore16AdBackgroundView)initWithCoder:(id)a3
{
  id v4;
  _TtC8AppStore16AdBackgroundView *result;

  *((_BYTE *)&self->super.super.super.super.isa + OBJC_IVAR____TtC8AppStore16AdBackgroundView_isBorderHidden) = 0;
  v4 = a3;

  result = (_TtC8AppStore16AdBackgroundView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001006A63C0, "AppStore/AdBackgroundView.swift", 31, 2, 48, 0);
  __break(1u);
  return result;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC8AppStore16AdBackgroundView *v6;

  v5 = a3;
  v6 = self;
  sub_100449788(a3);

}

@end
