@implementation CountBadgeView

- (_TtC20ProductPageExtension14CountBadgeView)initWithCoder:(id)a3
{
  id v4;
  _TtC20ProductPageExtension14CountBadgeView *result;

  *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR____TtC20ProductPageExtension14CountBadgeView_size) = 1;
  v4 = a3;

  result = (_TtC20ProductPageExtension14CountBadgeView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000100685560, "ProductPageExtension/CountBadgeView.swift", 41, 2, 76, 0);
  __break(1u);
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  _TtC20ProductPageExtension14CountBadgeView *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  v3 = self;
  sub_100214A94();
  v5 = v4;
  v7 = v6;

  v8 = v5;
  v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (void)layoutSubviews
{
  objc_class *v3;
  _TtC20ProductPageExtension14CountBadgeView *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGFloat v13;
  objc_super v14;
  CGRect v15;
  CGRect v16;

  v3 = (objc_class *)type metadata accessor for CountBadgeView();
  v14.receiver = self;
  v14.super_class = v3;
  v4 = self;
  -[CountBadgeView layoutSubviews](&v14, "layoutSubviews");
  v5 = *(Class *)((char *)&v4->super.super.super.isa + OBJC_IVAR____TtC20ProductPageExtension14CountBadgeView_countLabel);
  -[CountBadgeView bounds](v4, "bounds", v14.receiver, v14.super_class);
  objc_msgSend(v5, "sizeThatFits:", v6, v7);
  v9 = v8;
  v11 = v10;
  v12 = v10 * 0.5;
  v15.origin.x = LayoutMarginsAware<>.layoutFrame.getter(v3);
  v13 = CGRectGetMidX(v15) - v9 * 0.5;
  v16.origin.x = LayoutMarginsAware<>.layoutFrame.getter(v3);
  objc_msgSend(v5, "setFrame:", v13, CGRectGetMidY(v16) - v12, v9, v11);

}

- (_TtC11AppStoreKit16DynamicTypeLabel)accessibilityCountLabel
{
  return (_TtC11AppStoreKit16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                        + OBJC_IVAR____TtC20ProductPageExtension14CountBadgeView_countLabel));
}

- (_TtC20ProductPageExtension14CountBadgeView)initWithFrame:(CGRect)a3
{
  _TtC20ProductPageExtension14CountBadgeView *result;

  result = (_TtC20ProductPageExtension14CountBadgeView *)_swift_stdlib_reportUnimplementedInitializer("ProductPageExtension.CountBadgeView", 35, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension14CountBadgeView_countLabel));
}

@end
