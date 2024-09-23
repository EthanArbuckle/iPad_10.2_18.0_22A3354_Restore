@implementation AlertActionTrailingImageView

- (_TtC20ProductPageExtension28AlertActionTrailingImageView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1004E4E74();
}

- (void)layoutSubviews
{
  _TtC20ProductPageExtension28AlertActionTrailingImageView *v2;

  v2 = self;
  sub_1004E46D8();

}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for AlertActionTrailingImageView();
  v4 = v8.receiver;
  v5 = a3;
  -[AlertActionTrailingImageView traitCollectionDidChange:](&v8, "traitCollectionDidChange:", v5);
  v6 = objc_msgSend(v4, "traitCollection", v8.receiver, v8.super_class);
  v7 = objc_msgSend(v6, "layoutDirection");

  if (!v5 || v7 != objc_msgSend(v5, "layoutDirection"))
    objc_msgSend(v4, "setNeedsLayout");

}

- (void)tintColorDidChange
{
  char *v2;
  void *v3;
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for AlertActionTrailingImageView();
  v2 = (char *)v5.receiver;
  -[AlertActionTrailingImageView tintColorDidChange](&v5, "tintColorDidChange");
  v3 = *(void **)&v2[OBJC_IVAR____TtC20ProductPageExtension28AlertActionTrailingImageView_label];
  v4 = objc_msgSend(v2, "tintColor", v5.receiver, v5.super_class);
  objc_msgSend(v3, "setTextColor:", v4);

}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  -[AlertActionTrailingImageView sizeThatFits:](self, "sizeThatFits:", UIViewNoIntrinsicMetric, 1.79769313e308);
  result.height = v3;
  result.width = v2;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width;
  _TtC20ProductPageExtension28AlertActionTrailingImageView *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  width = a3.width;
  v4 = self;
  v5 = sub_1004E4C3C(width);
  v7 = v6;

  v8 = v5;
  v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (_TtC11AppStoreKit16DynamicTypeLabel)accessibilityAlertActionLabel
{
  return (_TtC11AppStoreKit16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                        + OBJC_IVAR____TtC20ProductPageExtension28AlertActionTrailingImageView_label));
}

- (_TtC20ProductPageExtension28AlertActionTrailingImageView)initWithFrame:(CGRect)a3
{
  _TtC20ProductPageExtension28AlertActionTrailingImageView *result;

  result = (_TtC20ProductPageExtension28AlertActionTrailingImageView *)_swift_stdlib_reportUnimplementedInitializer("ProductPageExtension.AlertActionTrailingImageView", 49, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension28AlertActionTrailingImageView_label));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension28AlertActionTrailingImageView_imageView));
}

@end
