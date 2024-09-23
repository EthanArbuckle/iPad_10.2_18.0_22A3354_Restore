@implementation PrivacyFooterCollectionViewCell

- (_TtC8AppStore31PrivacyFooterCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore31PrivacyFooterCollectionViewCell *)sub_1002611D4();
}

- (_TtC8AppStore31PrivacyFooterCollectionViewCell)initWithCoder:(id)a3
{
  char *v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  id v9;
  _TtC8AppStore31PrivacyFooterCollectionViewCell *result;

  v5 = (char *)self + OBJC_IVAR____TtC8AppStore31PrivacyFooterCollectionViewCell_itemLayoutContext;
  v6 = type metadata accessor for ItemLayoutContext(0, a2);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v5, 1, 1, v6);
  v7 = (char *)self + OBJC_IVAR____TtC8AppStore31PrivacyFooterCollectionViewCell_bodyText;
  v8 = sub_10007B804(&qword_100837F18);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v7, 1, 1, v8);
  v9 = a3;

  result = (_TtC8AppStore31PrivacyFooterCollectionViewCell *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001006A63C0, "AppStore/PrivacyFooterCollectionViewCell.swift", 46, 2, 48, 0);
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  _TtC8AppStore31PrivacyFooterCollectionViewCell *v2;

  v2 = self;
  sub_100260D84();

}

- (_TtC8AppStore22DynamicTypeLinkedLabel)accessibilityBodyLabel
{
  return (_TtC8AppStore22DynamicTypeLinkedLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                                          + OBJC_IVAR____TtC8AppStore31PrivacyFooterCollectionViewCell_bodyLabel));
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore31PrivacyFooterCollectionViewCell_bodyLabel));
  sub_1000057AC((uint64_t)self + OBJC_IVAR____TtC8AppStore31PrivacyFooterCollectionViewCell_itemLayoutContext, &qword_10082D9A0);
  sub_1000057AC((uint64_t)self + OBJC_IVAR____TtC8AppStore31PrivacyFooterCollectionViewCell_bodyText, &qword_100837F20);
}

@end
