@implementation TitledButtonStackCollectionViewCell

- (_TtC20ProductPageExtension35TitledButtonStackCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtension35TitledButtonStackCollectionViewCell *)sub_100197CCC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC20ProductPageExtension35TitledButtonStackCollectionViewCell)initWithCoder:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  unint64_t v14;
  _TtC20ProductPageExtension35TitledButtonStackCollectionViewCell *result;
  uint64_t v16;

  v5 = sub_10000DAF8(&qword_100812F48);
  __chkstk_darwin(v5);
  v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = (char *)self + OBJC_IVAR____TtC20ProductPageExtension35TitledButtonStackCollectionViewCell_itemLayoutContext;
  v9 = type metadata accessor for ItemLayoutContext(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 56))(v8, 1, 1, v9);
  v10 = (char *)self + OBJC_IVAR____TtC20ProductPageExtension35TitledButtonStackCollectionViewCell_lineBreaks;
  v11 = sub_10000DAF8(&qword_100812F38);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v10, 1, 1, v11);
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC20ProductPageExtension35TitledButtonStackCollectionViewCell_buttons) = (Class)_swiftEmptyArrayStorage;
  v12 = type metadata accessor for RoundedTitledButton(0);
  v13 = a3;
  ViewRecycler.init()(v12);
  v14 = sub_100198DC4();
  ReusePool.init(recycler:limit:)(v7, 4, v5, v14);

  result = (_TtC20ProductPageExtension35TitledButtonStackCollectionViewCell *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000100685560, "ProductPageExtension/TitledButtonStackCollectionViewCell.swift", 62, 2, 55, 0);
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  _TtC20ProductPageExtension35TitledButtonStackCollectionViewCell *v2;

  v2 = self;
  sub_10019883C();

}

- (void)prepareForReuse
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for TitledButtonStackCollectionViewCell(0);
  v2 = v3.receiver;
  -[TitledButtonStackCollectionViewCell prepareForReuse](&v3, "prepareForReuse");
  sub_10019801C();

}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  sub_100010F2C((uint64_t)self + OBJC_IVAR____TtC20ProductPageExtension35TitledButtonStackCollectionViewCell_itemLayoutContext, &qword_1008081F0);
  sub_100010F2C((uint64_t)self + OBJC_IVAR____TtC20ProductPageExtension35TitledButtonStackCollectionViewCell_lineBreaks, (uint64_t *)&unk_100812F58);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.super.isa
                                     + OBJC_IVAR____TtC20ProductPageExtension35TitledButtonStackCollectionViewCell_buttons));
  v3 = (char *)self + OBJC_IVAR____TtC20ProductPageExtension35TitledButtonStackCollectionViewCell_reusePool;
  v4 = sub_10000DAF8(&qword_100812F80);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
}

@end
