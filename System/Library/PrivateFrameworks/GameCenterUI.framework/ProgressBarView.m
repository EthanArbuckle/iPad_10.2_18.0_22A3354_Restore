@implementation ProgressBarView

- (_TtC12GameCenterUI15ProgressBarView)initWithFrame:(CGRect)a3
{
  return (_TtC12GameCenterUI15ProgressBarView *)sub_1AB751B00(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC12GameCenterUI15ProgressBarView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1AB751E40();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  _TtC12GameCenterUI15ProgressBarView *v3;
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
  double width;
  _TtC12GameCenterUI15ProgressBarView *v6;
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
  double v18;
  JUMeasurements result;

  width = a3.width;
  swift_unknownObjectRetain();
  v6 = self;
  sub_1AB752020(width);
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  swift_unknownObjectRelease();

  v15 = v8;
  v16 = v10;
  v17 = v12;
  v18 = v14;
  result.var3 = v18;
  result.var2 = v17;
  result.var1 = v16;
  result.var0 = v15;
  return result;
}

- (void)layoutSubviews
{
  _TtC12GameCenterUI15ProgressBarView *v2;

  v2 = self;
  sub_1AB75223C();

}

- (void).cxx_destruct
{

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI15ProgressBarView_progressFillView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI15ProgressBarView_progressTrackView));
}

@end
