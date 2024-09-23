@implementation InstallPageInstallingOfferView

- (_TtC20ProductPageExtension30InstallPageInstallingOfferView)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtension30InstallPageInstallingOfferView *)sub_1001E363C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC20ProductPageExtension30InstallPageInstallingOfferView)initWithCoder:(id)a3
{
  _QWORD *v4;
  id v5;
  _TtC20ProductPageExtension30InstallPageInstallingOfferView *result;

  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC20ProductPageExtension30InstallPageInstallingOfferView_progressView) = 0;
  v4 = (Class *)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR____TtC20ProductPageExtension30InstallPageInstallingOfferView_animationCompletionHandler);
  *v4 = 0;
  v4[1] = 0;
  v5 = a3;

  result = (_TtC20ProductPageExtension30InstallPageInstallingOfferView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000100685560, "ProductPageExtension/InstallPageInstallingOfferView.swift", 57, 2, 120, 0);
  __break(1u);
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  _TtC20ProductPageExtension30InstallPageInstallingOfferView *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v5 = self;
  v6 = sub_1001E3C74(width, height);
  v8 = v7;

  v9 = v6;
  v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (void)layoutSubviews
{
  _TtC20ProductPageExtension30InstallPageInstallingOfferView *v2;

  v2 = self;
  sub_1001E3F1C();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension30InstallPageInstallingOfferView_iconView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension30InstallPageInstallingOfferView_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension30InstallPageInstallingOfferView_subtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension30InstallPageInstallingOfferView_descriptionLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension30InstallPageInstallingOfferView_offerButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension30InstallPageInstallingOfferView_ageRatingView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension30InstallPageInstallingOfferView_progressView));
  sub_100018908(*(uint64_t *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC20ProductPageExtension30InstallPageInstallingOfferView_animationCompletionHandler), *(_QWORD *)&self->iconView[OBJC_IVAR____TtC20ProductPageExtension30InstallPageInstallingOfferView_animationCompletionHandler]);
}

@end
