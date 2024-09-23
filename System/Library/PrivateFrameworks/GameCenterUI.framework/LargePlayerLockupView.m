@implementation LargePlayerLockupView

- (_TtC12GameCenterUI21LargePlayerLockupView)initWithFrame:(CGRect)a3
{
  return (_TtC12GameCenterUI21LargePlayerLockupView *)sub_1AB68393C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC12GameCenterUI21LargePlayerLockupView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1AB683D08();
}

- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4
{
  _TtC12GameCenterUI21LargePlayerLockupView *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  JUMeasurements result;

  swift_unknownObjectRetain();
  v5 = self;
  v6 = sub_1AB684210();
  v8 = v7;
  v10 = v9;
  v12 = v11;
  swift_unknownObjectRelease();

  v13 = v6;
  v14 = v8;
  v15 = v10;
  v16 = v12;
  result.var3 = v16;
  result.var2 = v15;
  result.var1 = v14;
  result.var0 = v13;
  return result;
}

- (void)layoutSubviews
{
  _TtC12GameCenterUI21LargePlayerLockupView *v2;

  v2 = self;
  sub_1AB68499C();

}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC12GameCenterUI21LargePlayerLockupView *v6;

  v5 = a3;
  v6 = self;
  sub_1AB684FB4((uint64_t)a3);

}

- (_TtC12GameCenterUI16DynamicTypeLabel)accessibilityTitleLabel
{
  return (_TtC12GameCenterUI16DynamicTypeLabel *)sub_1AB6857F8();
}

- (_TtC12GameCenterUI16DynamicTypeLabel)accessibilitySubtitleLabel
{
  return (_TtC12GameCenterUI16DynamicTypeLabel *)sub_1AB685824();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI21LargePlayerLockupView_avatarView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI21LargePlayerLockupView_artworkView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI21LargePlayerLockupView_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI21LargePlayerLockupView_subtitleLabel));
}

@end
