@implementation PrivacyDefinitionCollectionViewCell

- (_TtC20ProductPageExtension35PrivacyDefinitionCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtension35PrivacyDefinitionCollectionViewCell *)sub_1002FD954();
}

- (_TtC20ProductPageExtension35PrivacyDefinitionCollectionViewCell)initWithCoder:(id)a3
{
  char *v5;
  uint64_t v6;
  id v7;
  _TtC20ProductPageExtension35PrivacyDefinitionCollectionViewCell *result;

  v5 = (char *)self + OBJC_IVAR____TtC20ProductPageExtension35PrivacyDefinitionCollectionViewCell_itemLayoutContext;
  v6 = type metadata accessor for ItemLayoutContext(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v5, 1, 1, v6);
  v7 = a3;

  result = (_TtC20ProductPageExtension35PrivacyDefinitionCollectionViewCell *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000100685560, "ProductPageExtension/PrivacyDefinitionCollectionViewCell.swift", 62, 2, 49, 0);
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  _TtC20ProductPageExtension35PrivacyDefinitionCollectionViewCell *v2;

  v2 = self;
  sub_1002FD58C();

}

- (void)prepareForReuse
{
  _TtC20ProductPageExtension35PrivacyDefinitionCollectionViewCell *v2;

  v2 = self;
  sub_1002FD0D0();

}

- (_TtC11AppStoreKit16DynamicTypeLabel)accessibilityTitleLabel
{
  return (_TtC11AppStoreKit16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                                        + OBJC_IVAR____TtC20ProductPageExtension35PrivacyDefinitionCollectionViewCell_titleLabel));
}

- (_TtC11AppStoreKit16DynamicTypeLabel)accessibilityDefinitionLabel
{
  return (_TtC11AppStoreKit16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                                        + OBJC_IVAR____TtC20ProductPageExtension35PrivacyDefinitionCollectionViewCell_definitionLabel));
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension35PrivacyDefinitionCollectionViewCell_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension35PrivacyDefinitionCollectionViewCell_definitionLabel));
  sub_1000119FC((uint64_t)self + OBJC_IVAR____TtC20ProductPageExtension35PrivacyDefinitionCollectionViewCell_itemLayoutContext);
}

@end
