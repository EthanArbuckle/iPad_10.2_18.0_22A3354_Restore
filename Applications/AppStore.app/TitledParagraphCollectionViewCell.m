@implementation TitledParagraphCollectionViewCell

- (_TtC8AppStore33TitledParagraphCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore33TitledParagraphCollectionViewCell *)sub_10029FB0C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore33TitledParagraphCollectionViewCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1002A122C();
}

- (void)layoutSubviews
{
  _TtC8AppStore33TitledParagraphCollectionViewCell *v2;

  v2 = self;
  sub_1002A04B8();

}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC8AppStore33TitledParagraphCollectionViewCell *v6;

  v5 = a3;
  v6 = self;
  sub_1002A0C8C((uint64_t)a3);

}

- (_TtC11AppStoreKit16DynamicTypeLabel)accessibilitytPrimarySubtitleLabel
{
  return (_TtC11AppStoreKit16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                                        + OBJC_IVAR____TtC8AppStore33TitledParagraphCollectionViewCell_primarySubtitleLabel));
}

- (_TtC8AppStore18ExpandableTextView)accessibilityExpandableTextView
{
  return (_TtC8AppStore18ExpandableTextView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                                      + OBJC_IVAR____TtC8AppStore33TitledParagraphCollectionViewCell_bodyTextView));
}

- (_TtC11AppStoreKit16DynamicTypeLabel)accessibilitySecondarySubtitleLabel
{
  return (_TtC11AppStoreKit16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                                        + OBJC_IVAR____TtC8AppStore33TitledParagraphCollectionViewCell_secondarySubtitleLabel));
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore33TitledParagraphCollectionViewCell_separatorView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore33TitledParagraphCollectionViewCell_bodyTextView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore33TitledParagraphCollectionViewCell_primarySubtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore33TitledParagraphCollectionViewCell_secondarySubtitleLabel));
  sub_10008D294((uint64_t)self + OBJC_IVAR____TtC8AppStore33TitledParagraphCollectionViewCell_itemLayoutContext);
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.super.super.super.super.isa
                                      + OBJC_IVAR____TtC8AppStore33TitledParagraphCollectionViewCell_pageTraits));
}

@end
