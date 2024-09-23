@implementation PrivacyHeaderCollectionViewCell

- (_TtC22SubscribePageExtension31PrivacyHeaderCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtension31PrivacyHeaderCollectionViewCell *)sub_1003289C4();
}

- (_TtC22SubscribePageExtension31PrivacyHeaderCollectionViewCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_100328E28();
}

- (void)layoutSubviews
{
  _TtC22SubscribePageExtension31PrivacyHeaderCollectionViewCell *v2;

  v2 = self;
  sub_100328040();

}

- (void)prepareForReuse
{
  _TtC22SubscribePageExtension31PrivacyHeaderCollectionViewCell *v2;

  v2 = self;
  sub_1003283A0();

}

- (_TtC22SubscribePageExtension22DynamicTypeLinkedLabel)accessibilityBodyLabel
{
  return (_TtC22SubscribePageExtension22DynamicTypeLinkedLabel *)*(id *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC22SubscribePageExtension31PrivacyHeaderCollectionViewCell_bodyLabel);
}

- (NSArray)accessibilitySupplementaryItemLabels
{
  uint64_t *v2;
  uint64_t v3;
  Class isa;
  _BYTE v6[24];

  v2 = (uint64_t *)((char *)self
                 + OBJC_IVAR____TtC22SubscribePageExtension31PrivacyHeaderCollectionViewCell_supplementaryItemLabels);
  swift_beginAccess((char *)self + OBJC_IVAR____TtC22SubscribePageExtension31PrivacyHeaderCollectionViewCell_supplementaryItemLabels, v6, 0, 0);
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
                     + OBJC_IVAR____TtC22SubscribePageExtension31PrivacyHeaderCollectionViewCell_bodyLabel));
  sub_100011088((uint64_t)self + OBJC_IVAR____TtC22SubscribePageExtension31PrivacyHeaderCollectionViewCell_itemLayoutContext, &qword_1007F4A50);
  sub_100011088((uint64_t)self + OBJC_IVAR____TtC22SubscribePageExtension31PrivacyHeaderCollectionViewCell_bodyText, &qword_1007FC098);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.super.isa
                                     + OBJC_IVAR____TtC22SubscribePageExtension31PrivacyHeaderCollectionViewCell_supplementaryItemLabels));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.super.isa
                                     + OBJC_IVAR____TtC22SubscribePageExtension31PrivacyHeaderCollectionViewCell_supplementaryItems));
  v3 = (char *)self
     + OBJC_IVAR____TtC22SubscribePageExtension31PrivacyHeaderCollectionViewCell_supplementaryItemReusePool;
  v4 = sub_10000DF3C(&qword_1008082F8);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension31PrivacyHeaderCollectionViewCell_topSeparatorView));
  sub_100011088((uint64_t)self + OBJC_IVAR____TtC22SubscribePageExtension31PrivacyHeaderCollectionViewCell_topSeparator, &qword_100806180);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension31PrivacyHeaderCollectionViewCell_middleSeparatorView));
  sub_100011088((uint64_t)self + OBJC_IVAR____TtC22SubscribePageExtension31PrivacyHeaderCollectionViewCell_middleSeparator, &qword_100806180);
}

@end
