@implementation ArcadeShowcaseCollectionViewCell

- (_TtC22SubscribePageExtension32ArcadeShowcaseCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtension32ArcadeShowcaseCollectionViewCell *)sub_1001C2730(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC22SubscribePageExtension32ArcadeShowcaseCollectionViewCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1001C47B8();
}

- (void)layoutSubviews
{
  _TtC22SubscribePageExtension32ArcadeShowcaseCollectionViewCell *v2;

  v2 = self;
  sub_1001C2FC0();

}

- (void).cxx_destruct
{
  sub_100011088((uint64_t)self + OBJC_IVAR____TtC22SubscribePageExtension32ArcadeShowcaseCollectionViewCell_itemLayoutContext, &qword_1007F4A50);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension32ArcadeShowcaseCollectionViewCell_iconGridView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension32ArcadeShowcaseCollectionViewCell_wordmarkImageView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension32ArcadeShowcaseCollectionViewCell_descriptionLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension32ArcadeShowcaseCollectionViewCell_offerButton));
  sub_100011088((uint64_t)self + OBJC_IVAR____TtC22SubscribePageExtension32ArcadeShowcaseCollectionViewCell_offerLabelPresenter, &qword_1007F6E90);
}

@end
