@implementation LinkableTextCollectionViewCell

- (_TtC20ProductPageExtension30LinkableTextCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtension30LinkableTextCollectionViewCell *)sub_1000808B8();
}

- (_TtC20ProductPageExtension30LinkableTextCollectionViewCell)initWithCoder:(id)a3
{
  char *v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  id v9;
  _TtC20ProductPageExtension30LinkableTextCollectionViewCell *result;

  v5 = (char *)self + OBJC_IVAR____TtC20ProductPageExtension30LinkableTextCollectionViewCell_itemLayoutContext;
  v6 = type metadata accessor for ItemLayoutContext(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v5, 1, 1, v6);
  v7 = (char *)self + OBJC_IVAR____TtC20ProductPageExtension30LinkableTextCollectionViewCell_bodyText;
  v8 = sub_10000DAF8(&qword_10080B5A8);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v7, 1, 1, v8);
  v9 = a3;

  result = (_TtC20ProductPageExtension30LinkableTextCollectionViewCell *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000100685560, "ProductPageExtension/LinkableTextCollectionViewCell.swift", 57, 2, 43, 0);
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  _TtC20ProductPageExtension30LinkableTextCollectionViewCell *v2;

  v2 = self;
  sub_100080480();

}

- (_TtC20ProductPageExtension22DynamicTypeLinkedLabel)accessibilityBodyLabel
{
  return (_TtC20ProductPageExtension22DynamicTypeLinkedLabel *)*(id *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC20ProductPageExtension30LinkableTextCollectionViewCell_bodyLabel);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension30LinkableTextCollectionViewCell_bodyLabel));
  sub_100010F2C((uint64_t)self + OBJC_IVAR____TtC20ProductPageExtension30LinkableTextCollectionViewCell_itemLayoutContext, &qword_1008081F0);
  sub_100010F2C((uint64_t)self + OBJC_IVAR____TtC20ProductPageExtension30LinkableTextCollectionViewCell_bodyText, &qword_10080B5B0);
}

@end
