@implementation LeaderboardHeroLockupView

- (_TtC12GameCenterUI25LeaderboardHeroLockupView)initWithFrame:(CGRect)a3
{
  return (_TtC12GameCenterUI25LeaderboardHeroLockupView *)sub_1AB513114(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC12GameCenterUI25LeaderboardHeroLockupView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1AB513534();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  _TtC12GameCenterUI25LeaderboardHeroLockupView *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  v3 = self;
  sub_1AB4941F0();
  v5 = v4;
  v7 = v6;

  v8 = v5;
  v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4
{
  _TtC12GameCenterUI25LeaderboardHeroLockupView *v5;
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
  v6 = sub_1AB513778();
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
  _TtC12GameCenterUI25LeaderboardHeroLockupView *v2;

  v2 = self;
  sub_1AB513964();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI25LeaderboardHeroLockupView_gradientBackground));
  OUTLINED_FUNCTION_5_2(OBJC_IVAR____TtC12GameCenterUI25LeaderboardHeroLockupView_headingLabel);
  OUTLINED_FUNCTION_5_2(OBJC_IVAR____TtC12GameCenterUI25LeaderboardHeroLockupView_detailLabel);
  OUTLINED_FUNCTION_5_2(OBJC_IVAR____TtC12GameCenterUI25LeaderboardHeroLockupView_scoreLabel);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI25LeaderboardHeroLockupView_avatarView));
}

@end
