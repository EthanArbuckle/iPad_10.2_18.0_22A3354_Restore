@implementation SmallGameCenterPlayerCollectionViewCell

- (_TtC8AppStore39SmallGameCenterPlayerCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore39SmallGameCenterPlayerCollectionViewCell *)sub_1003C8C5C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore39SmallGameCenterPlayerCollectionViewCell)initWithCoder:(id)a3
{
  id v3;
  __n128 v4;

  v3 = a3;
  sub_1003C99CC(v4);
}

- (void)layoutSubviews
{
  _TtC8AppStore39SmallGameCenterPlayerCollectionViewCell *v2;

  v2 = self;
  sub_1003C9438();

}

- (void).cxx_destruct
{
  sub_10008D294((uint64_t)self + OBJC_IVAR____TtC8AppStore39SmallGameCenterPlayerCollectionViewCell_itemLayoutContext);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore39SmallGameCenterPlayerCollectionViewCell_artworkView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore39SmallGameCenterPlayerCollectionViewCell_alias));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore39SmallGameCenterPlayerCollectionViewCell_displayName));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore39SmallGameCenterPlayerCollectionViewCell_separatorView));
}

@end
