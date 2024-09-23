@implementation ContinuePlayingEmbeddedView

- (_TtC12GameCenterUI27ContinuePlayingEmbeddedView)initWithFrame:(CGRect)a3
{
  return (_TtC12GameCenterUI27ContinuePlayingEmbeddedView *)sub_1AB47AA80(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC12GameCenterUI27ContinuePlayingEmbeddedView)initWithCoder:(id)a3
{
  sub_1AB47ABCC();
}

- (void)layoutSubviews
{
  _TtC12GameCenterUI27ContinuePlayingEmbeddedView *v2;

  v2 = self;
  sub_1AB47AC30();

}

- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4
{
  double width;
  _TtC12GameCenterUI27ContinuePlayingEmbeddedView *v7;
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
  v7 = self;
  v8 = sub_1AB47ACD4(a4, width);
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

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI27ContinuePlayingEmbeddedView_gridView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI27ContinuePlayingEmbeddedView_emptyStateView));
}

@end
