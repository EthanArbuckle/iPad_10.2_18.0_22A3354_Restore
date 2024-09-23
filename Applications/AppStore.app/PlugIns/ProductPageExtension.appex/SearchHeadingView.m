@implementation SearchHeadingView

- (_TtC20ProductPageExtension17SearchHeadingView)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtension17SearchHeadingView *)sub_100550374(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC20ProductPageExtension17SearchHeadingView)initWithCoder:(id)a3
{
  _QWORD *v4;
  _QWORD *v5;
  id v6;
  _TtC20ProductPageExtension17SearchHeadingView *result;

  v4 = (Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC20ProductPageExtension17SearchHeadingView_metrics);
  v4[3] = &type metadata for CGFloat;
  v4[4] = &protocol witness table for CGFloat;
  *v4 = 0;
  v4[8] = &type metadata for CGFloat;
  v4[9] = &protocol witness table for CGFloat;
  v4[5] = 0;
  v5 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC20ProductPageExtension17SearchHeadingView_detailButtonHandler);
  *v5 = 0;
  v5[1] = 0;
  v6 = a3;

  result = (_TtC20ProductPageExtension17SearchHeadingView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000100685560, "ProductPageExtension/SearchHeadingView.swift", 44, 2, 69, 0);
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  _TtC20ProductPageExtension17SearchHeadingView *v2;

  v2 = self;
  sub_100550A64();

}

- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4
{
  double height;
  double width;
  _TtC20ProductPageExtension17SearchHeadingView *v8;
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
  v9 = sub_100550CD0(a4, width, height);
  v11 = v10;
  v13 = v12;
  v15 = v14;
  swift_unknownObjectRelease();

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
  _TtC20ProductPageExtension17SearchHeadingView *v8;

  v3 = *(void (**)(uint64_t))((char *)&self->super.super.super.isa
                                      + OBJC_IVAR____TtC20ProductPageExtension17SearchHeadingView_detailButtonHandler);
  if (v3)
  {
    v5 = *(_QWORD *)&self->headingLabel[OBJC_IVAR____TtC20ProductPageExtension17SearchHeadingView_detailButtonHandler];
    v6 = a3;
    v8 = self;
    v7 = sub_100018918((uint64_t)v3, v5);
    v3(v7);
    sub_100018908((uint64_t)v3, v5);

  }
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension17SearchHeadingView_headingLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension17SearchHeadingView_detailButton));
  sub_100552554((Class *)((char *)&self->super.super.super.isa
                        + OBJC_IVAR____TtC20ProductPageExtension17SearchHeadingView_metrics));
  sub_100018908(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC20ProductPageExtension17SearchHeadingView_detailButtonHandler), *(_QWORD *)&self->headingLabel[OBJC_IVAR____TtC20ProductPageExtension17SearchHeadingView_detailButtonHandler]);
}

@end
