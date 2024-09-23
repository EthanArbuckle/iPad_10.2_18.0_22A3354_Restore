@implementation SearchHeadingView

- (_TtC22SubscribePageExtension17SearchHeadingView)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtension17SearchHeadingView *)sub_1001800A0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC22SubscribePageExtension17SearchHeadingView)initWithCoder:(id)a3
{
  _QWORD *v4;
  _QWORD *v5;
  id v6;
  _TtC22SubscribePageExtension17SearchHeadingView *result;

  v4 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC22SubscribePageExtension17SearchHeadingView_metrics);
  v4[3] = &type metadata for CGFloat;
  v4[4] = &protocol witness table for CGFloat;
  *v4 = 0;
  v4[8] = &type metadata for CGFloat;
  v4[9] = &protocol witness table for CGFloat;
  v4[5] = 0;
  v5 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC22SubscribePageExtension17SearchHeadingView_detailButtonHandler);
  *v5 = 0;
  v5[1] = 0;
  v6 = a3;

  result = (_TtC22SubscribePageExtension17SearchHeadingView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x800000010062E5C0, "SubscribePageExtension/SearchHeadingView.swift", 46, 2, 69, 0);
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  _TtC22SubscribePageExtension17SearchHeadingView *v2;

  v2 = self;
  sub_100180790();

}

- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4
{
  double height;
  double width;
  _TtC22SubscribePageExtension17SearchHeadingView *v8;
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
  v9 = sub_1001809FC(a4, width, height);
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

- (void)didPressWithDetailButton:(id)a3
{
  void (*v3)(uint64_t);
  uint64_t v5;
  id v6;
  uint64_t v7;
  _TtC22SubscribePageExtension17SearchHeadingView *v8;

  v3 = *(void (**)(uint64_t))((char *)&self->super.super.super.isa
                                      + OBJC_IVAR____TtC22SubscribePageExtension17SearchHeadingView_detailButtonHandler);
  if (v3)
  {
    v5 = *(_QWORD *)&self->headingLabel[OBJC_IVAR____TtC22SubscribePageExtension17SearchHeadingView_detailButtonHandler];
    v6 = a3;
    v8 = self;
    v7 = sub_100019320((uint64_t)v3, v5);
    v3(v7);
    sub_100019310((uint64_t)v3, v5);

  }
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension17SearchHeadingView_headingLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension17SearchHeadingView_detailButton));
  sub_100182338((Class *)((char *)&self->super.super.super.isa
                        + OBJC_IVAR____TtC22SubscribePageExtension17SearchHeadingView_metrics));
  sub_100019310(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC22SubscribePageExtension17SearchHeadingView_detailButtonHandler), *(_QWORD *)&self->headingLabel[OBJC_IVAR____TtC22SubscribePageExtension17SearchHeadingView_detailButtonHandler]);
}

@end
