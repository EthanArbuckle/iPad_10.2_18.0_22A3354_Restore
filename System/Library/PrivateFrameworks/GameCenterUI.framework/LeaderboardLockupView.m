@implementation LeaderboardLockupView

- (_TtC12GameCenterUI21LeaderboardLockupView)initWithFrame:(CGRect)a3
{
  return (_TtC12GameCenterUI21LeaderboardLockupView *)sub_1AB7A96A8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC12GameCenterUI21LeaderboardLockupView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1AB7A98D4();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  _TtC12GameCenterUI21LeaderboardLockupView *v3;
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
  _TtC12GameCenterUI21LeaderboardLockupView *v5;
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
  double v17;
  JUMeasurements result;

  swift_unknownObjectRetain();
  v5 = self;
  sub_1AB7A9B04();
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  swift_unknownObjectRelease();

  v14 = v7;
  v15 = v9;
  v16 = v11;
  v17 = v13;
  result.var3 = v17;
  result.var2 = v16;
  result.var1 = v15;
  result.var0 = v14;
  return result;
}

- (void)layoutSubviews
{
  _TtC12GameCenterUI21LeaderboardLockupView *v2;

  v2 = self;
  sub_1AB7A9E88();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI21LeaderboardLockupView_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI21LeaderboardLockupView_subtitleLabel));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
