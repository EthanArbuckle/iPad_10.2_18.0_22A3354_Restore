@implementation ProductDescriptionCollectionViewCell

- (_TtC20ProductPageExtension36ProductDescriptionCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtension36ProductDescriptionCollectionViewCell *)sub_10026B218(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC20ProductPageExtension36ProductDescriptionCollectionViewCell)initWithCoder:(id)a3
{
  char *v5;
  uint64_t v6;
  id v7;
  _TtC20ProductPageExtension36ProductDescriptionCollectionViewCell *result;

  v5 = (char *)self + OBJC_IVAR____TtC20ProductPageExtension36ProductDescriptionCollectionViewCell_itemLayoutContext;
  v6 = type metadata accessor for ItemLayoutContext(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v5, 1, 1, v6);
  v7 = a3;

  result = (_TtC20ProductPageExtension36ProductDescriptionCollectionViewCell *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000100685560, "ProductPageExtension/ProductDescriptionCollectionViewCell.swift", 63, 2, 62, 0);
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  _TtC20ProductPageExtension36ProductDescriptionCollectionViewCell *v2;

  v2 = self;
  sub_10026B670();

}

- (void).cxx_destruct
{
  sub_100010F2C((uint64_t)self + OBJC_IVAR____TtC20ProductPageExtension36ProductDescriptionCollectionViewCell_itemLayoutContext, &qword_1008081F0);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension36ProductDescriptionCollectionViewCell_bodyTextView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension36ProductDescriptionCollectionViewCell_developerLinkView));
}

@end
