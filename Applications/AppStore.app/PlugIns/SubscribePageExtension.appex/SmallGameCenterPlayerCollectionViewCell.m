@implementation SmallGameCenterPlayerCollectionViewCell

- (_TtC22SubscribePageExtension39SmallGameCenterPlayerCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtension39SmallGameCenterPlayerCollectionViewCell *)sub_100061C34(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC22SubscribePageExtension39SmallGameCenterPlayerCollectionViewCell)initWithCoder:(id)a3
{
  id v3;
  __n128 v4;

  v3 = a3;
  sub_1000629A4(v4);
}

- (void)layoutSubviews
{
  _TtC22SubscribePageExtension39SmallGameCenterPlayerCollectionViewCell *v2;

  v2 = self;
  sub_100062410();

}

- (void).cxx_destruct
{
  sub_100028A60((uint64_t)self + OBJC_IVAR____TtC22SubscribePageExtension39SmallGameCenterPlayerCollectionViewCell_itemLayoutContext);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension39SmallGameCenterPlayerCollectionViewCell_artworkView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension39SmallGameCenterPlayerCollectionViewCell_alias));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension39SmallGameCenterPlayerCollectionViewCell_displayName));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension39SmallGameCenterPlayerCollectionViewCell_separatorView));
}

@end
