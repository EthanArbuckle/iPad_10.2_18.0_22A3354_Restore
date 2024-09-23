@implementation SmallGameCenterPlayerCollectionViewCell

- (_TtC20ProductPageExtension39SmallGameCenterPlayerCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtension39SmallGameCenterPlayerCollectionViewCell *)sub_10012E80C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC20ProductPageExtension39SmallGameCenterPlayerCollectionViewCell)initWithCoder:(id)a3
{
  id v3;
  __n128 v4;

  v3 = a3;
  sub_10012F5EC(v4);
}

- (void)layoutSubviews
{
  _TtC20ProductPageExtension39SmallGameCenterPlayerCollectionViewCell *v2;

  v2 = self;
  sub_10012EFE8();

}

- (void).cxx_destruct
{
  sub_1000119FC((uint64_t)self + OBJC_IVAR____TtC20ProductPageExtension39SmallGameCenterPlayerCollectionViewCell_itemLayoutContext);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension39SmallGameCenterPlayerCollectionViewCell_artworkView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension39SmallGameCenterPlayerCollectionViewCell_alias));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension39SmallGameCenterPlayerCollectionViewCell_displayName));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension39SmallGameCenterPlayerCollectionViewCell_separatorView));
}

@end
