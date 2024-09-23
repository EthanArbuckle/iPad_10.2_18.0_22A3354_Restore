@implementation LinkableHeaderView

- (_TtC22SubscribePageExtension18LinkableHeaderView)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtension18LinkableHeaderView *)sub_1004913CC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC22SubscribePageExtension18LinkableHeaderView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_100491F88();
}

- (void)layoutSubviews
{
  _TtC22SubscribePageExtension18LinkableHeaderView *v2;

  v2 = self;
  sub_1004917E0();

}

- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4
{
  double height;
  double width;
  _TtC22SubscribePageExtension18LinkableHeaderView *v8;
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
  double v19;
  JUMeasurements result;

  height = a3.height;
  width = a3.width;
  swift_unknownObjectRetain(a4);
  v8 = self;
  v9 = sub_10049198C((uint64_t)a4, width, height);
  v11 = v10;
  v13 = v12;
  v15 = v14;
  swift_unknownObjectRelease(a4);

  v16 = v9;
  v17 = v11;
  v18 = v13;
  v19 = v15;
  result.var3 = v19;
  result.var2 = v18;
  result.var1 = v17;
  result.var0 = v16;
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension18LinkableHeaderView_label));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension18LinkableHeaderView_topDivider));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension18LinkableHeaderView_bottomDivider));
}

@end
