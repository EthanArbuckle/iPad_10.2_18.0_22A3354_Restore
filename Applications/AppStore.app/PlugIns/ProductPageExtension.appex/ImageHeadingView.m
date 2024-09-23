@implementation ImageHeadingView

- (_TtC20ProductPageExtension16ImageHeadingView)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtension16ImageHeadingView *)sub_1004B190C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC20ProductPageExtension16ImageHeadingView)initWithCoder:(id)a3
{
  _QWORD *v4;
  id v5;
  _TtC20ProductPageExtension16ImageHeadingView *result;

  v4 = (Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC20ProductPageExtension16ImageHeadingView_metrics);
  v4[3] = &type metadata for Double;
  v4[4] = &protocol witness table for Double;
  *v4 = 0;
  v5 = a3;

  result = (_TtC20ProductPageExtension16ImageHeadingView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000100685560, "ProductPageExtension/ImageHeadingView.swift", 43, 2, 53, 0);
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  _TtC20ProductPageExtension16ImageHeadingView *v2;

  v2 = self;
  sub_1004B1CDC();

}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC20ProductPageExtension16ImageHeadingView *v6;

  v5 = a3;
  v6 = self;
  sub_1004B25A8(a3);

}

- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4
{
  double height;
  double width;
  _TtC20ProductPageExtension16ImageHeadingView *v8;
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
  v9 = sub_1004B28F8((uint64_t)a4, width, height);
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

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension16ImageHeadingView_imageView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension16ImageHeadingView_headingLabel));
  sub_1001A114C((Class *)((char *)&self->super.super.super.isa
                        + OBJC_IVAR____TtC20ProductPageExtension16ImageHeadingView_metrics));
}

@end
