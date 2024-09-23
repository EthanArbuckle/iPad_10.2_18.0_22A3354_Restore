@implementation InstallPageInstallingOfferView

- (_TtC22SubscribePageExtension30InstallPageInstallingOfferView)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtension30InstallPageInstallingOfferView *)sub_10051FE70(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC22SubscribePageExtension30InstallPageInstallingOfferView)initWithCoder:(id)a3
{
  _QWORD *v4;
  id v5;
  _TtC22SubscribePageExtension30InstallPageInstallingOfferView *result;

  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC22SubscribePageExtension30InstallPageInstallingOfferView_progressView) = 0;
  v4 = (Class *)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR____TtC22SubscribePageExtension30InstallPageInstallingOfferView_animationCompletionHandler);
  *v4 = 0;
  v4[1] = 0;
  v5 = a3;

  result = (_TtC22SubscribePageExtension30InstallPageInstallingOfferView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x800000010062E5C0, "SubscribePageExtension/InstallPageInstallingOfferView.swift", 59, 2, 120, 0);
  __break(1u);
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  CGFloat width;
  _TtC22SubscribePageExtension30InstallPageInstallingOfferView *v5;
  __n128 v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v5 = self;
  v6.n128_f64[0] = width;
  v7 = sub_1005204A8(v6, height);
  v9 = v8;

  v10 = v7;
  v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (void)layoutSubviews
{
  _TtC22SubscribePageExtension30InstallPageInstallingOfferView *v2;

  v2 = self;
  sub_100520750();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension30InstallPageInstallingOfferView_iconView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension30InstallPageInstallingOfferView_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension30InstallPageInstallingOfferView_subtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension30InstallPageInstallingOfferView_descriptionLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension30InstallPageInstallingOfferView_offerButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension30InstallPageInstallingOfferView_ageRatingView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension30InstallPageInstallingOfferView_progressView));
  sub_100019310(*(uint64_t *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC22SubscribePageExtension30InstallPageInstallingOfferView_animationCompletionHandler), *(_QWORD *)&self->iconView[OBJC_IVAR____TtC22SubscribePageExtension30InstallPageInstallingOfferView_animationCompletionHandler]);
}

@end
