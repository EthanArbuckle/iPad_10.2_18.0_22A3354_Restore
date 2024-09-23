@implementation LeaderboardPlayerLockupView

- (_TtC12GameCenterUI27LeaderboardPlayerLockupView)initWithFrame:(CGRect)a3
{
  return (_TtC12GameCenterUI27LeaderboardPlayerLockupView *)sub_1AB4939E4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC12GameCenterUI27LeaderboardPlayerLockupView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1AB493DF4();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  _TtC12GameCenterUI27LeaderboardPlayerLockupView *v3;
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
  double height;
  double width;
  _TtC12GameCenterUI27LeaderboardPlayerLockupView *v7;
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

  height = a3.height;
  width = a3.width;
  swift_unknownObjectRetain();
  v7 = self;
  v8 = sub_1AB494254((uint64_t)v7, width, height);
  v10 = v9;
  v12 = v11;
  swift_unknownObjectRelease();

  v13 = 0.0;
  v14 = v8;
  v15 = v10;
  v16 = v12;
  result.var3 = v13;
  result.var2 = v16;
  result.var1 = v15;
  result.var0 = v14;
  return result;
}

- (void)layoutSubviews
{
  _TtC12GameCenterUI27LeaderboardPlayerLockupView *v2;

  v2 = self;
  sub_1AB49436C();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI27LeaderboardPlayerLockupView_movementArrowView));
  OUTLINED_FUNCTION_5_2(OBJC_IVAR____TtC12GameCenterUI27LeaderboardPlayerLockupView_ordinalLabel);
  OUTLINED_FUNCTION_5_2(OBJC_IVAR____TtC12GameCenterUI27LeaderboardPlayerLockupView_avatarView);
  OUTLINED_FUNCTION_5_2(OBJC_IVAR____TtC12GameCenterUI27LeaderboardPlayerLockupView_playerHandleLabel);
  OUTLINED_FUNCTION_5_2(OBJC_IVAR____TtC12GameCenterUI27LeaderboardPlayerLockupView_detailLabel);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI27LeaderboardPlayerLockupView_separatorView));
}

@end
