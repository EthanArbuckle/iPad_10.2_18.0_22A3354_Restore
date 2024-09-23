@implementation EditorialStoryCardCollectionViewCell

- (_TtC20ProductPageExtension36EditorialStoryCardCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtension36EditorialStoryCardCollectionViewCell *)sub_1001E19F4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC20ProductPageExtension36EditorialStoryCardCollectionViewCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1001E2804();
}

- (void)layoutSubviews
{
  _TtC20ProductPageExtension36EditorialStoryCardCollectionViewCell *v2;

  v2 = self;
  sub_1001E2234();

}

- (void)prepareForReuse
{
  _TtC20ProductPageExtension36EditorialStoryCardCollectionViewCell *v2;

  v2 = self;
  sub_1001E25A8();

}

- (void).cxx_destruct
{
  sub_1000119FC((uint64_t)self + OBJC_IVAR____TtC20ProductPageExtension36EditorialStoryCardCollectionViewCell_itemLayoutContext);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension36EditorialStoryCardCollectionViewCell_artworkView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension36EditorialStoryCardCollectionViewCell_headingLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension36EditorialStoryCardCollectionViewCell_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension36EditorialStoryCardCollectionViewCell_descriptionLabel));
  swift_unknownObjectRelease();
}

@end
