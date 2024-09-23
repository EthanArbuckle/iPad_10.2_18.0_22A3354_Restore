@implementation ImageHeadingView

- (_TtC8AppStore16ImageHeadingView)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore16ImageHeadingView *)sub_1005B24A0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore16ImageHeadingView)initWithCoder:(id)a3
{
  _QWORD *v4;
  id v5;
  _TtC8AppStore16ImageHeadingView *result;

  v4 = (Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8AppStore16ImageHeadingView_metrics);
  v4[3] = &type metadata for Double;
  v4[4] = &protocol witness table for Double;
  *v4 = 0;
  v5 = a3;

  result = (_TtC8AppStore16ImageHeadingView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001006A63C0, "AppStore/ImageHeadingView.swift", 31, 2, 53, 0);
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  _TtC8AppStore16ImageHeadingView *v2;

  v2 = self;
  sub_1005B2870();

}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC8AppStore16ImageHeadingView *v6;

  v5 = a3;
  v6 = self;
  sub_1005B313C(a3);

}

- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4
{
  double height;
  double width;
  _TtC8AppStore16ImageHeadingView *v8;
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
  v9 = sub_1005B348C((uint64_t)a4, width, height);
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

  sub_10012C1A4((Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8AppStore16ImageHeadingView_metrics));
}

@end
