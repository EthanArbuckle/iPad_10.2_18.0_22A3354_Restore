@implementation VibrancyHostView

- (_TtC12GameCenterUI16VibrancyHostView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1AB798B28();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width;
  _TtC12GameCenterUI16VibrancyHostView *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  width = a3.width;
  v4 = self;
  sub_1AB798BBC(width);
  v6 = v5;
  v8 = v7;

  v9 = v6;
  v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (void)layoutSubviews
{
  _TtC12GameCenterUI16VibrancyHostView *v2;

  v2 = self;
  sub_1AB798C6C();

}

- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4
{
  _TtC12GameCenterUI16VibrancyHostView *v6;
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

  swift_unknownObjectRetain();
  v6 = self;
  sub_1AB798DA4((uint64_t)a4);
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

- (_TtC12GameCenterUI16VibrancyHostView)initWithEffect:(id)a3
{
  id v3;

  v3 = a3;
  sub_1AB798E4C();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI16VibrancyHostView_embeddedView));
}

@end
