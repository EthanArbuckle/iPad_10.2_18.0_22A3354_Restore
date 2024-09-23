@implementation SearchActionCollectionViewCell

- (_TtC20ProductPageExtension30SearchActionCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtension30SearchActionCollectionViewCell *)sub_1003FD77C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC20ProductPageExtension30SearchActionCollectionViewCell)initWithCoder:(id)a3
{
  char *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  id v9;
  _TtC20ProductPageExtension30SearchActionCollectionViewCell *result;

  v5 = (char *)self + OBJC_IVAR____TtC20ProductPageExtension30SearchActionCollectionViewCell_itemLayoutContext;
  v6 = type metadata accessor for ItemLayoutContext(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v5, 1, 1, v6);
  v7 = OBJC_IVAR____TtC20ProductPageExtension30SearchActionCollectionViewCell_actionContentView;
  v8 = objc_allocWithZone((Class)type metadata accessor for SearchActionContentView(0));
  v9 = a3;
  *(Class *)((char *)&self->super.super.super.super.super.isa + v7) = (Class)objc_msgSend(v8, "initWithFrame:", 0.0, 0.0, 0.0, 0.0);

  result = (_TtC20ProductPageExtension30SearchActionCollectionViewCell *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000100685560, "ProductPageExtension/SearchActionCollectionViewCell.swift", 57, 2, 32, 0);
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  char *v2;
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for SearchActionCollectionViewCell(0);
  v2 = (char *)v4.receiver;
  -[SearchActionCollectionViewCell layoutSubviews](&v4, "layoutSubviews");
  v3 = *(void **)&v2[OBJC_IVAR____TtC20ProductPageExtension30SearchActionCollectionViewCell_actionContentView];
  objc_msgSend(v2, "bounds", v4.receiver, v4.super_class);
  objc_msgSend(v3, "setFrame:");

}

- (void)prepareForReuse
{
  char *v2;
  uint64_t v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for SearchActionCollectionViewCell(0);
  v2 = (char *)v4.receiver;
  -[SearchActionCollectionViewCell prepareForReuse](&v4, "prepareForReuse");
  v3 = *(_QWORD *)&v2[OBJC_IVAR____TtC20ProductPageExtension30SearchActionCollectionViewCell_actionContentView];
  ArtworkView.image.setter(0);
  objc_msgSend(*(id *)(v3 + OBJC_IVAR____TtC20ProductPageExtension23SearchActionContentView_linkLabel), "setText:", 0, v4.receiver, v4.super_class);

}

- (_TtC5JetUI12DynamicLabel)accessibilityTextLabel
{
  return (_TtC5JetUI12DynamicLabel *)objc_retainAutoreleaseReturnValue(*(id *)(*(char **)((char *)&self->super.super.super.super.super.isa
                                                                                        + OBJC_IVAR____TtC20ProductPageExtension30SearchActionCollectionViewCell_actionContentView)
                                                                             + OBJC_IVAR____TtC20ProductPageExtension23SearchActionContentView_linkLabel));
}

- (void).cxx_destruct
{
  sub_1000119FC((uint64_t)self + OBJC_IVAR____TtC20ProductPageExtension30SearchActionCollectionViewCell_itemLayoutContext);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension30SearchActionCollectionViewCell_actionContentView));
}

@end
