@implementation ProductTapToRateView

- (_TtC20ProductPageExtension20ProductTapToRateView)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtension20ProductTapToRateView *)sub_1003B8458(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC20ProductPageExtension20ProductTapToRateView)initWithCoder:(id)a3
{
  char *v5;
  uint64_t v6;
  id v7;
  _TtC20ProductPageExtension20ProductTapToRateView *result;

  v5 = (char *)self + OBJC_IVAR____TtC20ProductPageExtension20ProductTapToRateView_rateAction;
  v6 = sub_10000DAF8(&qword_10080CE48);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v5, 1, 1, v6);
  *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR____TtC20ProductPageExtension20ProductTapToRateView_isSingleColumn) = 0;
  v7 = a3;

  result = (_TtC20ProductPageExtension20ProductTapToRateView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000100685560, "ProductPageExtension/ProductTapToRateView.swift", 47, 2, 59, 0);
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  id v13;
  uint64_t v14[3];
  uint64_t v15;
  uint64_t v16;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)swift_getObjectType();
  v2 = v17.receiver;
  -[ProductTapToRateView layoutSubviews](&v17, "layoutSubviews");
  sub_1003B8C58(v14);
  v3 = v15;
  v4 = v16;
  sub_100010F08(v14, v15);
  objc_msgSend(v2, "bounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v13 = objc_msgSend(v2, "traitCollection");
  dispatch thunk of Placeable.place(at:with:)(v13, v3, v4, v6, v8, v10, v12);

  _s20ProductPageExtension22AutoAdjustingPlaceableVwxx_0(v14);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  _TtC20ProductPageExtension20ProductTapToRateView *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  uint64_t v14[3];
  uint64_t v15;
  uint64_t v16;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v5 = self;
  sub_1003B8C58(v14);
  v6 = v15;
  v7 = v16;
  sub_100010F08(v14, v15);
  v8 = -[ProductTapToRateView traitCollection](v5, "traitCollection");
  v9 = dispatch thunk of Placeable.measure(toFit:with:)(v8, v6, v7, width, height);
  v11 = v10;

  _s20ProductPageExtension22AutoAdjustingPlaceableVwxx_0(v14);
  v12 = v9;
  v13 = v11;
  result.height = v13;
  result.width = v12;
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension20ProductTapToRateView_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension20ProductTapToRateView_ratingControl));
  sub_100010F2C((uint64_t)self + OBJC_IVAR____TtC20ProductPageExtension20ProductTapToRateView_rateAction, &qword_10080CE40);
}

@end
