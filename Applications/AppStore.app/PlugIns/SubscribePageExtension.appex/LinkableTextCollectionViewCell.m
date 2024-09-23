@implementation LinkableTextCollectionViewCell

- (_TtC22SubscribePageExtension30LinkableTextCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtension30LinkableTextCollectionViewCell *)sub_1002F0610();
}

- (_TtC22SubscribePageExtension30LinkableTextCollectionViewCell)initWithCoder:(id)a3
{
  char *v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  id v9;
  _TtC22SubscribePageExtension30LinkableTextCollectionViewCell *result;

  v5 = (char *)self + OBJC_IVAR____TtC22SubscribePageExtension30LinkableTextCollectionViewCell_itemLayoutContext;
  v6 = type metadata accessor for ItemLayoutContext(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v5, 1, 1, v6);
  v7 = (char *)self + OBJC_IVAR____TtC22SubscribePageExtension30LinkableTextCollectionViewCell_bodyText;
  v8 = sub_10000DF3C(&qword_1007FC090);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v7, 1, 1, v8);
  v9 = a3;

  result = (_TtC22SubscribePageExtension30LinkableTextCollectionViewCell *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x800000010062E5C0, "SubscribePageExtension/LinkableTextCollectionViewCell.swift", 59, 2, 43, 0);
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  _TtC22SubscribePageExtension30LinkableTextCollectionViewCell *v2;

  v2 = self;
  sub_1002F0310();

}

- (_TtC22SubscribePageExtension22DynamicTypeLinkedLabel)accessibilityBodyLabel
{
  return (_TtC22SubscribePageExtension22DynamicTypeLinkedLabel *)*(id *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC22SubscribePageExtension30LinkableTextCollectionViewCell_bodyLabel);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension30LinkableTextCollectionViewCell_bodyLabel));
  sub_100011088((uint64_t)self + OBJC_IVAR____TtC22SubscribePageExtension30LinkableTextCollectionViewCell_itemLayoutContext, &qword_1007F4A50);
  sub_100011088((uint64_t)self + OBJC_IVAR____TtC22SubscribePageExtension30LinkableTextCollectionViewCell_bodyText, &qword_1007FC098);
}

@end
