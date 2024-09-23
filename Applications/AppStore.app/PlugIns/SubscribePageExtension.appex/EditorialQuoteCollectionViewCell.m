@implementation EditorialQuoteCollectionViewCell

- (_TtC22SubscribePageExtension32EditorialQuoteCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtension32EditorialQuoteCollectionViewCell *)sub_1002A0958(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC22SubscribePageExtension32EditorialQuoteCollectionViewCell)initWithCoder:(id)a3
{
  char *v5;
  uint64_t v6;
  id v7;
  _TtC22SubscribePageExtension32EditorialQuoteCollectionViewCell *result;

  v5 = (char *)self + OBJC_IVAR____TtC22SubscribePageExtension32EditorialQuoteCollectionViewCell_itemLayoutContext;
  v6 = type metadata accessor for ItemLayoutContext(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v5, 1, 1, v6);
  v7 = a3;

  result = (_TtC22SubscribePageExtension32EditorialQuoteCollectionViewCell *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x800000010062E5C0, "SubscribePageExtension/EditorialQuoteCollectionViewCell.swift", 61, 2, 68, 0);
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  _TtC22SubscribePageExtension32EditorialQuoteCollectionViewCell *v2;

  v2 = self;
  sub_1002A0DE4();

}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC22SubscribePageExtension32EditorialQuoteCollectionViewCell *v6;

  v5 = a3;
  v6 = self;
  sub_1002A1050((uint64_t)a3);

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension32EditorialQuoteCollectionViewCell_quoteLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension32EditorialQuoteCollectionViewCell_attributionLabel));
  sub_100028A60((uint64_t)self + OBJC_IVAR____TtC22SubscribePageExtension32EditorialQuoteCollectionViewCell_itemLayoutContext);
}

@end
