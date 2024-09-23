@implementation LargeGameCenterPlayerCollectionViewCell

- (_TtC22SubscribePageExtension39LargeGameCenterPlayerCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtension39LargeGameCenterPlayerCollectionViewCell *)sub_1005FF420(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC22SubscribePageExtension39LargeGameCenterPlayerCollectionViewCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1005FFEA4();
}

- (void)layoutSubviews
{
  _TtC22SubscribePageExtension39LargeGameCenterPlayerCollectionViewCell *v2;

  v2 = self;
  sub_1005FFA48();

}

- (void).cxx_destruct
{
  sub_100028A60((uint64_t)self + OBJC_IVAR____TtC22SubscribePageExtension39LargeGameCenterPlayerCollectionViewCell_itemLayoutContext);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension39LargeGameCenterPlayerCollectionViewCell_artworkView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension39LargeGameCenterPlayerCollectionViewCell_alias));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension39LargeGameCenterPlayerCollectionViewCell_displayName));
}

@end
