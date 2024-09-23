@implementation TitledParagraphCollectionViewCell

- (_TtC22SubscribePageExtension33TitledParagraphCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtension33TitledParagraphCollectionViewCell *)sub_100288884(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC22SubscribePageExtension33TitledParagraphCollectionViewCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_10028A6B4();
}

- (void)layoutSubviews
{
  _TtC22SubscribePageExtension33TitledParagraphCollectionViewCell *v2;

  v2 = self;
  sub_100289230();

}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC22SubscribePageExtension33TitledParagraphCollectionViewCell *v6;

  v5 = a3;
  v6 = self;
  sub_10028A114((uint64_t)a3);

}

- (_TtC11AppStoreKit16DynamicTypeLabel)accessibilitytPrimarySubtitleLabel
{
  return (_TtC11AppStoreKit16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                                        + OBJC_IVAR____TtC22SubscribePageExtension33TitledParagraphCollectionViewCell_primarySubtitleLabel));
}

- (_TtC22SubscribePageExtension18ExpandableTextView)accessibilityExpandableTextView
{
  return (_TtC22SubscribePageExtension18ExpandableTextView *)*(id *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC22SubscribePageExtension33TitledParagraphCollectionViewCell_bodyTextView);
}

- (_TtC11AppStoreKit16DynamicTypeLabel)accessibilitySecondarySubtitleLabel
{
  return (_TtC11AppStoreKit16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                                        + OBJC_IVAR____TtC22SubscribePageExtension33TitledParagraphCollectionViewCell_secondarySubtitleLabel));
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension33TitledParagraphCollectionViewCell_separatorView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension33TitledParagraphCollectionViewCell_bodyTextView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension33TitledParagraphCollectionViewCell_primarySubtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension33TitledParagraphCollectionViewCell_secondarySubtitleLabel));
  sub_100028A60((uint64_t)self + OBJC_IVAR____TtC22SubscribePageExtension33TitledParagraphCollectionViewCell_itemLayoutContext);
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.super.super.super.super.isa
                                      + OBJC_IVAR____TtC22SubscribePageExtension33TitledParagraphCollectionViewCell_pageTraits));
}

@end
