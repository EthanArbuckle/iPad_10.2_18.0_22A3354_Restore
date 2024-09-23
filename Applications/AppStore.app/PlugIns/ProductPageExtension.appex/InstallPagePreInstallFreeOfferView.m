@implementation InstallPagePreInstallFreeOfferView

- (_TtC20ProductPageExtension34InstallPagePreInstallFreeOfferView)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtension34InstallPagePreInstallFreeOfferView *)sub_1000BE00C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC20ProductPageExtension34InstallPagePreInstallFreeOfferView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1000BF48C();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  _TtC20ProductPageExtension34InstallPagePreInstallFreeOfferView *v5;
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
  v7 = sub_1000BED50(width, height, (uint64_t)v5, v6);
  v9 = v8;

  v10 = v7;
  v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (void)layoutSubviews
{
  _TtC20ProductPageExtension34InstallPagePreInstallFreeOfferView *v2;

  v2 = self;
  sub_1000BEFD8();

}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR____TtC20ProductPageExtension34InstallPagePreInstallFreeOfferView_metrics;
  v4 = type metadata accessor for InstallPagePreInstallFreeLayout.Metrics(0, a2);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension34InstallPagePreInstallFreeOfferView_inAppPurchaseView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension34InstallPagePreInstallFreeOfferView_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension34InstallPagePreInstallFreeOfferView_parentTitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension34InstallPagePreInstallFreeOfferView_subtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension34InstallPagePreInstallFreeOfferView_descriptionLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension34InstallPagePreInstallFreeOfferView_offerButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension34InstallPagePreInstallFreeOfferView_ageRatingBadge));
}

@end
