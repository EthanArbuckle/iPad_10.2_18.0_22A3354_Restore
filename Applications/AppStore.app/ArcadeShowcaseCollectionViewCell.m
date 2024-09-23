@implementation ArcadeShowcaseCollectionViewCell

- (_TtC8AppStore32ArcadeShowcaseCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore32ArcadeShowcaseCollectionViewCell *)sub_100149208(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore32ArcadeShowcaseCollectionViewCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_10014B290();
}

- (void)layoutSubviews
{
  _TtC8AppStore32ArcadeShowcaseCollectionViewCell *v2;

  v2 = self;
  sub_100149A98();

}

- (void).cxx_destruct
{
  sub_1000057AC((uint64_t)self + OBJC_IVAR____TtC8AppStore32ArcadeShowcaseCollectionViewCell_itemLayoutContext, &qword_10082D9A0);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore32ArcadeShowcaseCollectionViewCell_iconGridView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore32ArcadeShowcaseCollectionViewCell_wordmarkImageView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore32ArcadeShowcaseCollectionViewCell_descriptionLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore32ArcadeShowcaseCollectionViewCell_offerButton));
  sub_1000057AC((uint64_t)self + OBJC_IVAR____TtC8AppStore32ArcadeShowcaseCollectionViewCell_offerLabelPresenter, (uint64_t *)&unk_10082B490);
}

@end
