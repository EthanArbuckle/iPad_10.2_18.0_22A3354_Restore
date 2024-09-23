@implementation InAppPurchaseLockupCollectionViewCell

- (_TtC8AppStore37InAppPurchaseLockupCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore37InAppPurchaseLockupCollectionViewCell *)sub_1000B2CAC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore37InAppPurchaseLockupCollectionViewCell)initWithCoder:(id)a3
{
  char *v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  id v9;
  _TtC8AppStore37InAppPurchaseLockupCollectionViewCell *result;

  v5 = (char *)self + OBJC_IVAR____TtC8AppStore37InAppPurchaseLockupCollectionViewCell_itemLayoutContext;
  v6 = type metadata accessor for ItemLayoutContext(0, a2);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v5, 1, 1, v6);
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC8AppStore37InAppPurchaseLockupCollectionViewCell_spotlightView) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC8AppStore37InAppPurchaseLockupCollectionViewCell_separatorView) = 0;
  v7 = (char *)self + OBJC_IVAR____TtC8AppStore37InAppPurchaseLockupCollectionViewCell_separator;
  v8 = type metadata accessor for Separator(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v7, 1, 1, v8);
  *((_BYTE *)&self->super.super.super.super.super.isa
  + OBJC_IVAR____TtC8AppStore37InAppPurchaseLockupCollectionViewCell_isPartOfSpotlightShelf) = 0;
  v9 = a3;

  result = (_TtC8AppStore37InAppPurchaseLockupCollectionViewCell *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001006A63C0, "AppStore/InAppPurchaseLockupCollectionViewCell.swift", 52, 2, 39, 0);
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  _TtC8AppStore37InAppPurchaseLockupCollectionViewCell *v2;

  v2 = self;
  sub_1000B3658();

}

- (_TtC8AppStore23InAppPurchaseLockupView)accessibilityLockupView
{
  return (_TtC8AppStore23InAppPurchaseLockupView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                                           + OBJC_IVAR____TtC8AppStore37InAppPurchaseLockupCollectionViewCell_lockupView));
}

- (void).cxx_destruct
{
  sub_1000057AC((uint64_t)self + OBJC_IVAR____TtC8AppStore37InAppPurchaseLockupCollectionViewCell_itemLayoutContext, &qword_10082D9A0);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore37InAppPurchaseLockupCollectionViewCell_lockupView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore37InAppPurchaseLockupCollectionViewCell_spotlightView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore37InAppPurchaseLockupCollectionViewCell_separatorView));
  sub_1000057AC((uint64_t)self + OBJC_IVAR____TtC8AppStore37InAppPurchaseLockupCollectionViewCell_separator, (uint64_t *)&unk_10084CE60);
}

@end
