@implementation LeaderboardMovementLockupView

- (_TtC12GameCenterUI29LeaderboardMovementLockupView)initWithFrame:(CGRect)a3
{
  return (_TtC12GameCenterUI29LeaderboardMovementLockupView *)sub_1AB686120(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC12GameCenterUI29LeaderboardMovementLockupView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1AB686470();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  _TtC12GameCenterUI29LeaderboardMovementLockupView *v3;
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
  _TtC12GameCenterUI29LeaderboardMovementLockupView *v5;
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
  v6 = sub_1AB686660();
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
  _TtC12GameCenterUI29LeaderboardMovementLockupView *v2;

  v2 = self;
  sub_1AB687088();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI29LeaderboardMovementLockupView_gradientBackground));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI29LeaderboardMovementLockupView_headingLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI29LeaderboardMovementLockupView_detailLabel));
  swift_bridgeObjectRelease();
}

@end
