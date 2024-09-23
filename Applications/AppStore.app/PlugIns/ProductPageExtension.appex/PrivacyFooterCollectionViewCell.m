@implementation PrivacyFooterCollectionViewCell

- (_TtC20ProductPageExtension31PrivacyFooterCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtension31PrivacyFooterCollectionViewCell *)sub_1005B449C();
}

- (_TtC20ProductPageExtension31PrivacyFooterCollectionViewCell)initWithCoder:(id)a3
{
  char *v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  id v9;
  _TtC20ProductPageExtension31PrivacyFooterCollectionViewCell *result;

  v5 = (char *)self + OBJC_IVAR____TtC20ProductPageExtension31PrivacyFooterCollectionViewCell_itemLayoutContext;
  v6 = type metadata accessor for ItemLayoutContext(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v5, 1, 1, v6);
  v7 = (char *)self + OBJC_IVAR____TtC20ProductPageExtension31PrivacyFooterCollectionViewCell_bodyText;
  v8 = sub_10000DAF8(&qword_10080B5A8);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v7, 1, 1, v8);
  v9 = a3;

  result = (_TtC20ProductPageExtension31PrivacyFooterCollectionViewCell *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000100685560, "ProductPageExtension/PrivacyFooterCollectionViewCell.swift", 58, 2, 48, 0);
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  _TtC20ProductPageExtension31PrivacyFooterCollectionViewCell *v2;

  v2 = self;
  sub_1005B3F2C();

}

- (_TtC20ProductPageExtension22DynamicTypeLinkedLabel)accessibilityBodyLabel
{
  return (_TtC20ProductPageExtension22DynamicTypeLinkedLabel *)*(id *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC20ProductPageExtension31PrivacyFooterCollectionViewCell_bodyLabel);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension31PrivacyFooterCollectionViewCell_bodyLabel));
  sub_100010F2C((uint64_t)self + OBJC_IVAR____TtC20ProductPageExtension31PrivacyFooterCollectionViewCell_itemLayoutContext, &qword_1008081F0);
  sub_100010F2C((uint64_t)self + OBJC_IVAR____TtC20ProductPageExtension31PrivacyFooterCollectionViewCell_bodyText, &qword_10080B5B0);
}

@end
