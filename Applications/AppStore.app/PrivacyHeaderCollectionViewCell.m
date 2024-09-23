@implementation PrivacyHeaderCollectionViewCell

- (_TtC8AppStore31PrivacyHeaderCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore31PrivacyHeaderCollectionViewCell *)sub_10040077C();
}

- (_TtC8AppStore31PrivacyHeaderCollectionViewCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_100400BE0();
}

- (void)layoutSubviews
{
  _TtC8AppStore31PrivacyHeaderCollectionViewCell *v2;

  v2 = self;
  sub_1003FFDCC();

}

- (void)prepareForReuse
{
  _TtC8AppStore31PrivacyHeaderCollectionViewCell *v2;

  v2 = self;
  sub_1003FEFB8();

}

- (_TtC8AppStore22DynamicTypeLinkedLabel)accessibilityBodyLabel
{
  return (_TtC8AppStore22DynamicTypeLinkedLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                                          + OBJC_IVAR____TtC8AppStore31PrivacyHeaderCollectionViewCell_bodyLabel));
}

- (NSArray)accessibilitySupplementaryItemLabels
{
  uint64_t *v2;
  uint64_t v3;
  Class isa;
  _BYTE v6[24];

  v2 = (uint64_t *)((char *)self + OBJC_IVAR____TtC8AppStore31PrivacyHeaderCollectionViewCell_supplementaryItemLabels);
  swift_beginAccess((char *)self + OBJC_IVAR____TtC8AppStore31PrivacyHeaderCollectionViewCell_supplementaryItemLabels, v6, 0, 0);
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
                     + OBJC_IVAR____TtC8AppStore31PrivacyHeaderCollectionViewCell_bodyLabel));
  sub_1000057AC((uint64_t)self + OBJC_IVAR____TtC8AppStore31PrivacyHeaderCollectionViewCell_itemLayoutContext, &qword_10082D9A0);
  sub_1000057AC((uint64_t)self + OBJC_IVAR____TtC8AppStore31PrivacyHeaderCollectionViewCell_bodyText, &qword_100837F20);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.super.isa
                                     + OBJC_IVAR____TtC8AppStore31PrivacyHeaderCollectionViewCell_supplementaryItemLabels));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.super.isa
                                     + OBJC_IVAR____TtC8AppStore31PrivacyHeaderCollectionViewCell_supplementaryItems));
  v3 = (char *)self + OBJC_IVAR____TtC8AppStore31PrivacyHeaderCollectionViewCell_supplementaryItemReusePool;
  v4 = sub_10007B804(&qword_1008438C8);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore31PrivacyHeaderCollectionViewCell_topSeparatorView));
  sub_1000057AC((uint64_t)self + OBJC_IVAR____TtC8AppStore31PrivacyHeaderCollectionViewCell_topSeparator, (uint64_t *)&unk_10084CE60);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore31PrivacyHeaderCollectionViewCell_middleSeparatorView));
  sub_1000057AC((uint64_t)self + OBJC_IVAR____TtC8AppStore31PrivacyHeaderCollectionViewCell_middleSeparator, (uint64_t *)&unk_10084CE60);
}

@end
