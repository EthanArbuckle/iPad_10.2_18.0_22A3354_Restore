@implementation EditorialStoryCardCollectionViewCell

- (_TtC22SubscribePageExtension36EditorialStoryCardCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtension36EditorialStoryCardCollectionViewCell *)sub_10029C6C8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC22SubscribePageExtension36EditorialStoryCardCollectionViewCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_10029D4D8();
}

- (void)layoutSubviews
{
  _TtC22SubscribePageExtension36EditorialStoryCardCollectionViewCell *v2;

  v2 = self;
  sub_10029CF08();

}

- (void)prepareForReuse
{
  _TtC22SubscribePageExtension36EditorialStoryCardCollectionViewCell *v2;

  v2 = self;
  sub_10029D27C();

}

- (void).cxx_destruct
{
  sub_100028A60((uint64_t)self + OBJC_IVAR____TtC22SubscribePageExtension36EditorialStoryCardCollectionViewCell_itemLayoutContext);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension36EditorialStoryCardCollectionViewCell_artworkView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension36EditorialStoryCardCollectionViewCell_headingLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension36EditorialStoryCardCollectionViewCell_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension36EditorialStoryCardCollectionViewCell_descriptionLabel));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.super.super.super.super.isa
                                      + OBJC_IVAR____TtC22SubscribePageExtension36EditorialStoryCardCollectionViewCell_pageTraits));
}

@end
