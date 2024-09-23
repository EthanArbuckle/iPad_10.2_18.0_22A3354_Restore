@implementation EditorialStoryCardCollectionViewCell

- (_TtC8AppStore36EditorialStoryCardCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore36EditorialStoryCardCollectionViewCell *)sub_1005854A0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore36EditorialStoryCardCollectionViewCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1005862A0();
}

- (void)layoutSubviews
{
  _TtC8AppStore36EditorialStoryCardCollectionViewCell *v2;

  v2 = self;
  sub_100585CE0();

}

- (void)prepareForReuse
{
  _TtC8AppStore36EditorialStoryCardCollectionViewCell *v2;

  v2 = self;
  sub_100586054();

}

- (void).cxx_destruct
{
  sub_10008D294((uint64_t)self + OBJC_IVAR____TtC8AppStore36EditorialStoryCardCollectionViewCell_itemLayoutContext);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore36EditorialStoryCardCollectionViewCell_artworkView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore36EditorialStoryCardCollectionViewCell_headingLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore36EditorialStoryCardCollectionViewCell_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore36EditorialStoryCardCollectionViewCell_descriptionLabel));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.super.super.super.super.isa
                                      + OBJC_IVAR____TtC8AppStore36EditorialStoryCardCollectionViewCell_pageTraits));
}

@end
