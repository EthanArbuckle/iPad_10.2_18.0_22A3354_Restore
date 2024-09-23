@implementation ArcadeShowcaseCollectionViewCell

- (_TtC20ProductPageExtension32ArcadeShowcaseCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtension32ArcadeShowcaseCollectionViewCell *)sub_100214B9C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC20ProductPageExtension32ArcadeShowcaseCollectionViewCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_100216C24();
}

- (void)layoutSubviews
{
  _TtC20ProductPageExtension32ArcadeShowcaseCollectionViewCell *v2;

  v2 = self;
  sub_10021542C();

}

- (void).cxx_destruct
{
  sub_100010F2C((uint64_t)self + OBJC_IVAR____TtC20ProductPageExtension32ArcadeShowcaseCollectionViewCell_itemLayoutContext, &qword_1008081F0);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension32ArcadeShowcaseCollectionViewCell_iconGridView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension32ArcadeShowcaseCollectionViewCell_wordmarkImageView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension32ArcadeShowcaseCollectionViewCell_descriptionLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension32ArcadeShowcaseCollectionViewCell_offerButton));
  sub_100010F2C((uint64_t)self + OBJC_IVAR____TtC20ProductPageExtension32ArcadeShowcaseCollectionViewCell_offerLabelPresenter, &qword_100808F20);
}

@end
