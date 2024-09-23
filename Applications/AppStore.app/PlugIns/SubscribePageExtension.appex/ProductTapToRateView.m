@implementation ProductTapToRateView

- (_TtC22SubscribePageExtension20ProductTapToRateView)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtension20ProductTapToRateView *)sub_100031BE4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC22SubscribePageExtension20ProductTapToRateView)initWithCoder:(id)a3
{
  char *v5;
  uint64_t v6;
  id v7;
  _TtC22SubscribePageExtension20ProductTapToRateView *result;

  v5 = (char *)self + OBJC_IVAR____TtC22SubscribePageExtension20ProductTapToRateView_rateAction;
  v6 = sub_10000DF3C(&qword_1007F4EE0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v5, 1, 1, v6);
  *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR____TtC22SubscribePageExtension20ProductTapToRateView_isSingleColumn) = 0;
  v7 = a3;

  result = (_TtC22SubscribePageExtension20ProductTapToRateView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x800000010062E5C0, "SubscribePageExtension/ProductTapToRateView.swift", 49, 2, 59, 0);
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
  id v7;
  uint64_t v8[3];
  uint64_t v9;
  uint64_t v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)swift_getObjectType();
  v2 = v11.receiver;
  -[ProductTapToRateView layoutSubviews](&v11, "layoutSubviews");
  sub_1000323E4(v8);
  v3 = v9;
  v4 = v10;
  sub_100011064(v8, v9);
  objc_msgSend(v2, "bounds");
  v6 = v5;
  v7 = objc_msgSend(v2, "traitCollection");
  dispatch thunk of Placeable.place(at:with:)(v7, v3, v4, v6);

  _s22SubscribePageExtension38ProductRatingsCompactProductPageLayoutV7MetricsVwxx_0(v8);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  _TtC22SubscribePageExtension20ProductTapToRateView *v5;
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
  sub_1000323E4(v14);
  v6 = v15;
  v7 = v16;
  sub_100011064(v14, v15);
  v8 = -[ProductTapToRateView traitCollection](v5, "traitCollection");
  v9 = dispatch thunk of Placeable.measure(toFit:with:)(v8, v6, v7, width, height);
  v11 = v10;

  _s22SubscribePageExtension38ProductRatingsCompactProductPageLayoutV7MetricsVwxx_0(v14);
  v12 = v9;
  v13 = v11;
  result.height = v13;
  result.width = v12;
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension20ProductTapToRateView_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension20ProductTapToRateView_ratingControl));
  sub_100011088((uint64_t)self + OBJC_IVAR____TtC22SubscribePageExtension20ProductTapToRateView_rateAction, (uint64_t *)&unk_1007F4EF0);
}

@end
