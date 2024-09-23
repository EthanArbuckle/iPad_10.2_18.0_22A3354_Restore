@implementation TitledParagraphCollectionViewCell

- (_TtC20ProductPageExtension33TitledParagraphCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtension33TitledParagraphCollectionViewCell *)sub_10031DC90(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC20ProductPageExtension33TitledParagraphCollectionViewCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_10031F3B0();
}

- (void)layoutSubviews
{
  _TtC20ProductPageExtension33TitledParagraphCollectionViewCell *v2;

  v2 = self;
  sub_10031E63C();

}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC20ProductPageExtension33TitledParagraphCollectionViewCell *v6;

  v5 = a3;
  v6 = self;
  sub_10031EE10((uint64_t)a3);

}

- (_TtC11AppStoreKit16DynamicTypeLabel)accessibilitytPrimarySubtitleLabel
{
  return (_TtC11AppStoreKit16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                                        + OBJC_IVAR____TtC20ProductPageExtension33TitledParagraphCollectionViewCell_primarySubtitleLabel));
}

- (_TtC20ProductPageExtension18ExpandableTextView)accessibilityExpandableTextView
{
  return (_TtC20ProductPageExtension18ExpandableTextView *)*(id *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC20ProductPageExtension33TitledParagraphCollectionViewCell_bodyTextView);
}

- (_TtC11AppStoreKit16DynamicTypeLabel)accessibilitySecondarySubtitleLabel
{
  return (_TtC11AppStoreKit16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                                        + OBJC_IVAR____TtC20ProductPageExtension33TitledParagraphCollectionViewCell_secondarySubtitleLabel));
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension33TitledParagraphCollectionViewCell_separatorView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension33TitledParagraphCollectionViewCell_bodyTextView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension33TitledParagraphCollectionViewCell_primarySubtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension33TitledParagraphCollectionViewCell_secondarySubtitleLabel));
  sub_1000119FC((uint64_t)self + OBJC_IVAR____TtC20ProductPageExtension33TitledParagraphCollectionViewCell_itemLayoutContext);
  swift_unknownObjectRelease();
}

@end
