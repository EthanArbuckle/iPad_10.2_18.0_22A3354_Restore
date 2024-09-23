@implementation CheckoutContainerView

- (UIStackView)verticalTextStackView
{
  return (UIStackView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                + OBJC_IVAR____TtC11AssetViewer21CheckoutContainerView_verticalTextStackView));
}

- (UILabel)titleLabel
{
  return (UILabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                            + OBJC_IVAR____TtC11AssetViewer21CheckoutContainerView_titleLabel));
}

- (_TtC11AssetViewer21CheckoutContainerView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1D94C2D18();
}

- (void)layoutSubviews
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for CheckoutContainerView();
  v2 = v3.receiver;
  -[CheckoutContainerView layoutSubviews](&v3, sel_layoutSubviews);
  sub_1D94C1228();

}

- (void)contentSizeCategoryDidChangeWithNotification:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  void *v9;
  _TtC11AssetViewer21CheckoutContainerView *v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;

  v4 = sub_1D94D1018();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1D94D1000();
  v8 = *(uint64_t *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC11AssetViewer21CheckoutContainerView_traitManager);
  v9 = (void *)objc_opt_self();
  v10 = self;
  v11 = objc_msgSend(v9, sel_currentTraitCollection);
  v12 = objc_msgSend(v11, sel_preferredContentSizeCategory);

  v13 = *(void **)(v8 + 24);
  *(_QWORD *)(v8 + 24) = v12;

  sub_1D94C1228();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (_TtC11AssetViewer21CheckoutContainerView)initWithFrame:(CGRect)a3
{
  _TtC11AssetViewer21CheckoutContainerView *result;

  result = (_TtC11AssetViewer21CheckoutContainerView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11AssetViewer21CheckoutContainerView_parentStackView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11AssetViewer21CheckoutContainerView_verticalTextStackView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11AssetViewer21CheckoutContainerView_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11AssetViewer21CheckoutContainerView_subTitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11AssetViewer21CheckoutContainerView_tertiaryTitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11AssetViewer21CheckoutContainerView_ctaButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11AssetViewer21CheckoutContainerView_applePayButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11AssetViewer21CheckoutContainerView_rightParentStackViewConstraint));
}

@end
