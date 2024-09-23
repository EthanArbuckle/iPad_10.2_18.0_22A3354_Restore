@implementation InAppPurchaseShowcaseLockupView

- (_TtC22SubscribePageExtension31InAppPurchaseShowcaseLockupView)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtension31InAppPurchaseShowcaseLockupView *)sub_1001F43E8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC22SubscribePageExtension31InAppPurchaseShowcaseLockupView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1001F5614();
}

- (void)layoutSubviews
{
  _TtC22SubscribePageExtension31InAppPurchaseShowcaseLockupView *v2;

  v2 = self;
  sub_1001F4998();

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  _TtC22SubscribePageExtension31InAppPurchaseShowcaseLockupView *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v5 = self;
  v6 = sub_1001F4C54(width, height);
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
                     + OBJC_IVAR____TtC22SubscribePageExtension31InAppPurchaseShowcaseLockupView_iconView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension31InAppPurchaseShowcaseLockupView_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension31InAppPurchaseShowcaseLockupView_subtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension31InAppPurchaseShowcaseLockupView_descriptionLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension31InAppPurchaseShowcaseLockupView_offerButton));
}

@end
