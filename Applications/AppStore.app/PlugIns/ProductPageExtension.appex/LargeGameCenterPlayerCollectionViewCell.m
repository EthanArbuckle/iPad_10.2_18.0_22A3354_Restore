@implementation LargeGameCenterPlayerCollectionViewCell

- (_TtC20ProductPageExtension39LargeGameCenterPlayerCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtension39LargeGameCenterPlayerCollectionViewCell *)sub_1001C67D0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC20ProductPageExtension39LargeGameCenterPlayerCollectionViewCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1001C7290();
}

- (void)layoutSubviews
{
  _TtC20ProductPageExtension39LargeGameCenterPlayerCollectionViewCell *v2;

  v2 = self;
  sub_1001C6DF8();

}

- (void).cxx_destruct
{
  sub_1000119FC((uint64_t)self + OBJC_IVAR____TtC20ProductPageExtension39LargeGameCenterPlayerCollectionViewCell_itemLayoutContext);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension39LargeGameCenterPlayerCollectionViewCell_artworkView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension39LargeGameCenterPlayerCollectionViewCell_alias));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension39LargeGameCenterPlayerCollectionViewCell_displayName));
}

@end
