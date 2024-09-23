@implementation PrivacyHeaderCollectionViewCell

- (_TtC20ProductPageExtension31PrivacyHeaderCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtension31PrivacyHeaderCollectionViewCell *)sub_1000DC30C();
}

- (_TtC20ProductPageExtension31PrivacyHeaderCollectionViewCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1000DC770();
}

- (void)layoutSubviews
{
  _TtC20ProductPageExtension31PrivacyHeaderCollectionViewCell *v2;

  v2 = self;
  sub_1000DB8E4();

}

- (void)prepareForReuse
{
  _TtC20ProductPageExtension31PrivacyHeaderCollectionViewCell *v2;

  v2 = self;
  sub_1000DBC44();

}

- (_TtC20ProductPageExtension22DynamicTypeLinkedLabel)accessibilityBodyLabel
{
  return (_TtC20ProductPageExtension22DynamicTypeLinkedLabel *)*(id *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC20ProductPageExtension31PrivacyHeaderCollectionViewCell_bodyLabel);
}

- (NSArray)accessibilitySupplementaryItemLabels
{
  uint64_t *v2;
  uint64_t v3;
  Class isa;
  _BYTE v6[24];

  v2 = (uint64_t *)((char *)self
                 + OBJC_IVAR____TtC20ProductPageExtension31PrivacyHeaderCollectionViewCell_supplementaryItemLabels);
  swift_beginAccess((char *)self + OBJC_IVAR____TtC20ProductPageExtension31PrivacyHeaderCollectionViewCell_supplementaryItemLabels, v6, 0, 0);
  v3 = *v2;
  type metadata accessor for DynamicTypeLinkedLabel(0);
  swift_bridgeObjectRetain(v3);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v3);
  return (NSArray *)isa;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension31PrivacyHeaderCollectionViewCell_bodyLabel));
  sub_100010F2C((uint64_t)self + OBJC_IVAR____TtC20ProductPageExtension31PrivacyHeaderCollectionViewCell_itemLayoutContext, &qword_1008081F0);
  sub_100010F2C((uint64_t)self + OBJC_IVAR____TtC20ProductPageExtension31PrivacyHeaderCollectionViewCell_bodyText, &qword_10080B5B0);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.super.isa
                                     + OBJC_IVAR____TtC20ProductPageExtension31PrivacyHeaderCollectionViewCell_supplementaryItemLabels));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.super.isa
                                     + OBJC_IVAR____TtC20ProductPageExtension31PrivacyHeaderCollectionViewCell_supplementaryItems));
  v3 = (char *)self + OBJC_IVAR____TtC20ProductPageExtension31PrivacyHeaderCollectionViewCell_supplementaryItemReusePool;
  v4 = sub_10000DAF8(&qword_10080E750);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension31PrivacyHeaderCollectionViewCell_topSeparatorView));
  sub_100010F2C((uint64_t)self + OBJC_IVAR____TtC20ProductPageExtension31PrivacyHeaderCollectionViewCell_topSeparator, (uint64_t *)&unk_10080B170);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension31PrivacyHeaderCollectionViewCell_middleSeparatorView));
  sub_100010F2C((uint64_t)self + OBJC_IVAR____TtC20ProductPageExtension31PrivacyHeaderCollectionViewCell_middleSeparator, (uint64_t *)&unk_10080B170);
}

@end
