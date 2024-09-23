@implementation InstallPagePreInstallPaidOfferView

- (_TtC8AppStore34InstallPagePreInstallPaidOfferView)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore34InstallPagePreInstallPaidOfferView *)sub_100632C1C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore34InstallPagePreInstallPaidOfferView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_100633E30();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  _TtC8AppStore34InstallPagePreInstallPaidOfferView *v5;
  uint64_t v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v5 = self;
  v7 = sub_10063375C(width, height, (uint64_t)v5, v6);
  v9 = v8;

  v10 = v7;
  v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (void)layoutSubviews
{
  _TtC8AppStore34InstallPagePreInstallPaidOfferView *v2;

  v2 = self;
  sub_1006339EC();

}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR____TtC8AppStore34InstallPagePreInstallPaidOfferView_metrics;
  v4 = type metadata accessor for InstallPagePreInstallPaidLayout.Metrics(0, a2);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore34InstallPagePreInstallPaidOfferView_inAppPurchaseView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore34InstallPagePreInstallPaidOfferView_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore34InstallPagePreInstallPaidOfferView_descriptionLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore34InstallPagePreInstallPaidOfferView_divider));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore34InstallPagePreInstallPaidOfferView_messageLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore34InstallPagePreInstallPaidOfferView_lockupView));
}

@end
