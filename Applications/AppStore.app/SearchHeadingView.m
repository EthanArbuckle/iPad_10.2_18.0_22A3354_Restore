@implementation SearchHeadingView

- (_TtC8AppStore17SearchHeadingView)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore17SearchHeadingView *)sub_100396E00(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore17SearchHeadingView)initWithCoder:(id)a3
{
  _QWORD *v4;
  _QWORD *v5;
  id v6;
  _TtC8AppStore17SearchHeadingView *result;

  v4 = (Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8AppStore17SearchHeadingView_metrics);
  v4[3] = &type metadata for CGFloat;
  v4[4] = &protocol witness table for CGFloat;
  *v4 = 0;
  v4[8] = &type metadata for CGFloat;
  v4[9] = &protocol witness table for CGFloat;
  v4[5] = 0;
  v5 = (Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8AppStore17SearchHeadingView_detailButtonHandler);
  *v5 = 0;
  v5[1] = 0;
  v6 = a3;

  result = (_TtC8AppStore17SearchHeadingView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001006A63C0, "AppStore/SearchHeadingView.swift", 32, 2, 69, 0);
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  _TtC8AppStore17SearchHeadingView *v2;

  v2 = self;
  sub_1003974F0();

}

- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4
{
  double height;
  double width;
  _TtC8AppStore17SearchHeadingView *v8;
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
  v9 = sub_10039775C(a4, width, height);
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
  _TtC8AppStore17SearchHeadingView *v8;

  v3 = *(void (**)(uint64_t))((char *)&self->super.super.super.isa
                                      + OBJC_IVAR____TtC8AppStore17SearchHeadingView_detailButtonHandler);
  if (v3)
  {
    v5 = *(_QWORD *)&self->headingLabel[OBJC_IVAR____TtC8AppStore17SearchHeadingView_detailButtonHandler];
    v6 = a3;
    v8 = self;
    v7 = sub_10003A340((uint64_t)v3, v5);
    v3(v7);
    sub_10003A350((uint64_t)v3, v5);

  }
}

- (void).cxx_destruct
{

  sub_10039907C((Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8AppStore17SearchHeadingView_metrics));
  sub_10003A350(*(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8AppStore17SearchHeadingView_detailButtonHandler), *(_QWORD *)&self->headingLabel[OBJC_IVAR____TtC8AppStore17SearchHeadingView_detailButtonHandler]);
}

@end
