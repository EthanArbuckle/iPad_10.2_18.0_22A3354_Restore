@implementation PrivacyDefinitionCollectionViewCell

- (_TtC8AppStore35PrivacyDefinitionCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore35PrivacyDefinitionCollectionViewCell *)sub_10008CF3C();
}

- (_TtC8AppStore35PrivacyDefinitionCollectionViewCell)initWithCoder:(id)a3
{
  char *v5;
  uint64_t v6;
  id v7;
  _TtC8AppStore35PrivacyDefinitionCollectionViewCell *result;

  v5 = (char *)self + OBJC_IVAR____TtC8AppStore35PrivacyDefinitionCollectionViewCell_itemLayoutContext;
  v6 = type metadata accessor for ItemLayoutContext(0, a2);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v5, 1, 1, v6);
  v7 = a3;

  result = (_TtC8AppStore35PrivacyDefinitionCollectionViewCell *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001006A63C0, "AppStore/PrivacyDefinitionCollectionViewCell.swift", 50, 2, 49, 0);
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  _TtC8AppStore35PrivacyDefinitionCollectionViewCell *v2;

  v2 = self;
  sub_10008CA0C();

}

- (void)prepareForReuse
{
  uint64_t v2;
  _TtC8AppStore35PrivacyDefinitionCollectionViewCell *v3;

  v3 = self;
  sub_10008CC78((uint64_t)v3, v2);

}

- (_TtC11AppStoreKit16DynamicTypeLabel)accessibilityTitleLabel
{
  return (_TtC11AppStoreKit16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                                        + OBJC_IVAR____TtC8AppStore35PrivacyDefinitionCollectionViewCell_titleLabel));
}

- (_TtC11AppStoreKit16DynamicTypeLabel)accessibilityDefinitionLabel
{
  return (_TtC11AppStoreKit16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                                        + OBJC_IVAR____TtC8AppStore35PrivacyDefinitionCollectionViewCell_definitionLabel));
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore35PrivacyDefinitionCollectionViewCell_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore35PrivacyDefinitionCollectionViewCell_definitionLabel));
  sub_10008D294((uint64_t)self + OBJC_IVAR____TtC8AppStore35PrivacyDefinitionCollectionViewCell_itemLayoutContext);
}

@end
