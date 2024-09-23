@implementation ArtworkCollectionViewCell

- (_TtC20ProductPageExtension25ArtworkCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtension25ArtworkCollectionViewCell *)sub_100331B34(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC20ProductPageExtension25ArtworkCollectionViewCell)initWithCoder:(id)a3
{
  char *v5;
  uint64_t v6;
  id v7;
  _TtC20ProductPageExtension25ArtworkCollectionViewCell *result;

  v5 = (char *)self + OBJC_IVAR____TtC20ProductPageExtension25ArtworkCollectionViewCell_itemLayoutContext;
  v6 = type metadata accessor for ItemLayoutContext(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v5, 1, 1, v6);
  v7 = a3;

  result = (_TtC20ProductPageExtension25ArtworkCollectionViewCell *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000100685560, "ProductPageExtension/ArtworkCollectionViewCell.swift", 52, 2, 28, 0);
  __break(1u);
  return result;
}

- (void)prepareForReuse
{
  char *v2;
  id v3;
  Swift::Bool v4;
  objc_super v5;
  UIImage_optional v6;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for ArtworkCollectionViewCell(0);
  v2 = (char *)v5.receiver;
  -[ArtworkCollectionViewCell prepareForReuse](&v5, "prepareForReuse");
  v3 = *(id *)&v2[OBJC_IVAR____TtC20ProductPageExtension25ArtworkCollectionViewCell_artworkView];
  v6.value.super.isa = 0;
  v6.is_nil = 0;
  ArtworkView.setImage(image:animated:)(v6, v4);

}

- (void)layoutSubviews
{
  id v2;
  id v3;
  uint64_t v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for ArtworkCollectionViewCell(0);
  v2 = v5.receiver;
  -[ArtworkCollectionViewCell layoutSubviews](&v5, "layoutSubviews");
  v3 = objc_msgSend(v2, "contentView", v5.receiver, v5.super_class);
  objc_msgSend(v3, "frame");

  ArtworkView.frame.setter(v4);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension25ArtworkCollectionViewCell_artworkView));
  sub_1000119FC((uint64_t)self + OBJC_IVAR____TtC20ProductPageExtension25ArtworkCollectionViewCell_itemLayoutContext);
}

@end
