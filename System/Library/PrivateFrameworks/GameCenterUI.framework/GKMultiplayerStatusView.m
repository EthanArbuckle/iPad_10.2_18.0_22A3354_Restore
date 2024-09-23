@implementation GKMultiplayerStatusView

- (_TtC12GameCenterUI23GKMultiplayerStatusView)initWithCoder:(id)a3
{
  sub_1AB58FEE4();
}

- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4
{
  _TtC12GameCenterUI23GKMultiplayerStatusView *v5;
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
  GKMultiplayerStatusView.measurements(fitting:in:)();
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
  _TtC12GameCenterUI23GKMultiplayerStatusView *v2;

  v2 = self;
  GKMultiplayerStatusView.layoutSubviews()();

}

- (_TtC12GameCenterUI16DynamicTypeLabel)accessibilityStatusLabel
{
  return (_TtC12GameCenterUI16DynamicTypeLabel *)sub_1AB5903D4();
}

- (_TtC12GameCenterUI23GKMultiplayerStatusView)initWithFrame:(CGRect)a3
{
  GKMultiplayerStatusView.init(frame:)();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI23GKMultiplayerStatusView_label));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI23GKMultiplayerStatusView_accessoryView));
}

@end
