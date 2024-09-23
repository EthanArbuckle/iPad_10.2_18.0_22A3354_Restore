@implementation SearchResultsContextCardCollectionViewCell

- (_TtC20ProductPageExtension42SearchResultsContextCardCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtension42SearchResultsContextCardCollectionViewCell *)sub_100332044(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC20ProductPageExtension42SearchResultsContextCardCollectionViewCell)initWithCoder:(id)a3
{
  char *v5;
  uint64_t v6;
  id v7;
  _TtC20ProductPageExtension42SearchResultsContextCardCollectionViewCell *result;

  v5 = (char *)self
     + OBJC_IVAR____TtC20ProductPageExtension42SearchResultsContextCardCollectionViewCell_itemLayoutContext;
  v6 = type metadata accessor for ItemLayoutContext(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v5, 1, 1, v6);
  v7 = a3;

  result = (_TtC20ProductPageExtension42SearchResultsContextCardCollectionViewCell *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000100685560, "ProductPageExtension/SearchResultsContextCardCollectionViewCell.swift", 69, 2, 31, 0);
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  char *v2;
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)swift_getObjectType();
  v2 = (char *)v4.receiver;
  -[SearchResultsContextCardCollectionViewCell layoutSubviews](&v4, "layoutSubviews");
  v3 = *(void **)&v2[OBJC_IVAR____TtC20ProductPageExtension42SearchResultsContextCardCollectionViewCell_content];
  objc_msgSend(v2, "bounds", v4.receiver, v4.super_class);
  objc_msgSend(v3, "setFrame:");

}

- (void)prepareForReuse
{
  _TtC20ProductPageExtension42SearchResultsContextCardCollectionViewCell *v2;

  v2 = self;
  sub_100332398();

}

- (void).cxx_destruct
{
  sub_1000119FC((uint64_t)self + OBJC_IVAR____TtC20ProductPageExtension42SearchResultsContextCardCollectionViewCell_itemLayoutContext);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension42SearchResultsContextCardCollectionViewCell_content));
}

@end
