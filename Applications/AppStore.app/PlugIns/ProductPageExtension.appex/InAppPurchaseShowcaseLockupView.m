@implementation InAppPurchaseShowcaseLockupView

- (_TtC20ProductPageExtension31InAppPurchaseShowcaseLockupView)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtension31InAppPurchaseShowcaseLockupView *)sub_10039CE8C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC20ProductPageExtension31InAppPurchaseShowcaseLockupView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_10039DA30();
}

- (void)layoutSubviews
{
  _TtC20ProductPageExtension31InAppPurchaseShowcaseLockupView *v2;

  v2 = self;
  sub_10039D43C();

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  _TtC20ProductPageExtension31InAppPurchaseShowcaseLockupView *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v5 = self;
  v6 = sub_10039D6F8(width, height);
  v8 = v7;

  v9 = v6;
  v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension31InAppPurchaseShowcaseLockupView_iconView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension31InAppPurchaseShowcaseLockupView_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension31InAppPurchaseShowcaseLockupView_subtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension31InAppPurchaseShowcaseLockupView_descriptionLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension31InAppPurchaseShowcaseLockupView_offerButton));
}

@end
