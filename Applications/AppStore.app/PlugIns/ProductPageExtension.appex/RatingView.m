@implementation RatingView

- (_TtC20ProductPageExtension10RatingView)initWithCoder:(id)a3
{
  char *v4;
  id v5;
  _TtC20ProductPageExtension10RatingView *result;

  *(_DWORD *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC20ProductPageExtension10RatingView_rating) = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC20ProductPageExtension10RatingView_emptyStarColor) = 0;
  v4 = (char *)self + OBJC_IVAR____TtC20ProductPageExtension10RatingView_starPadding;
  *(_QWORD *)v4 = 0;
  v4[8] = 1;
  v5 = a3;

  result = (_TtC20ProductPageExtension10RatingView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000100685560, "ProductPageExtension/RatingView.swift", 37, 2, 156, 0);
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  uint64_t v2;
  _TtC20ProductPageExtension10RatingView *v3;

  v3 = self;
  sub_100067D90((uint64_t)v3, v2);

}

- (CGSize)intrinsicContentSize
{
  _TtC20ProductPageExtension10RatingView *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGSize result;

  v2 = self;
  v3 = sub_100068030();
  v5 = v4;

  v6 = v3;
  v7 = v5;
  result.height = v7;
  result.width = v6;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  _TtC20ProductPageExtension10RatingView *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  v3 = self;
  v4 = sub_100068030();
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4
{
  _TtC20ProductPageExtension10RatingView *v6;
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

  swift_unknownObjectRetain(a4);
  v6 = self;
  v7 = sub_10006974C(a4);
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

- (double)accessibilityRating
{
  return *(float *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC20ProductPageExtension10RatingView_rating);
}

- (_TtC20ProductPageExtension10RatingView)initWithFrame:(CGRect)a3
{
  sub_100068FF4((uint64_t)self, (uint64_t)a2, (uint64_t)"ProductPageExtension.RatingView", 31);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension10RatingView_starColor));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension10RatingView_emptyStarColor));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension10RatingView_emptyStarRowView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension10RatingView_filledStarRowView));
}

@end
