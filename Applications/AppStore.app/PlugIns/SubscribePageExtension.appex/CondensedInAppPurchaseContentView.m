@implementation CondensedInAppPurchaseContentView

- (_TtC22SubscribePageExtension33CondensedInAppPurchaseContentView)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtension33CondensedInAppPurchaseContentView *)sub_1000D94A4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC22SubscribePageExtension33CondensedInAppPurchaseContentView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1000DC1A0();
}

- (void)layoutSubviews
{
  _TtC22SubscribePageExtension33CondensedInAppPurchaseContentView *v2;

  v2 = self;
  CondensedInAppPurchaseContentView.layoutSubviews()();

}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC22SubscribePageExtension33CondensedInAppPurchaseContentView *v6;
  _TtC22SubscribePageExtension33CondensedInAppPurchaseContentView *v7;
  UITraitCollection_optional v8;

  v5 = a3;
  v6 = self;
  v8.is_nil = (char)v6;
  v7 = v6;
  v8.value.super.isa = (Class)a3;
  CondensedInAppPurchaseContentView.traitCollectionDidChange(_:)(v8);

}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension33CondensedInAppPurchaseContentView_headerLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension33CondensedInAppPurchaseContentView_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension33CondensedInAppPurchaseContentView_subtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension33CondensedInAppPurchaseContentView_offerButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension33CondensedInAppPurchaseContentView_inAppPurchaseView));
  v3 = (char *)self + OBJC_IVAR____TtC22SubscribePageExtension33CondensedInAppPurchaseContentView_metrics;
  v4 = type metadata accessor for CondensedSearchInAppPurchaseCardLayout.Metrics(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
}

@end
