@implementation LargeGameCenterPlayerCollectionViewCell

- (_TtC8AppStore39LargeGameCenterPlayerCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore39LargeGameCenterPlayerCollectionViewCell *)sub_100507AF8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore39LargeGameCenterPlayerCollectionViewCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_10050857C();
}

- (void)layoutSubviews
{
  _TtC8AppStore39LargeGameCenterPlayerCollectionViewCell *v2;

  v2 = self;
  sub_100508120();

}

- (void).cxx_destruct
{
  sub_10008D294((uint64_t)self + OBJC_IVAR____TtC8AppStore39LargeGameCenterPlayerCollectionViewCell_itemLayoutContext);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore39LargeGameCenterPlayerCollectionViewCell_artworkView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore39LargeGameCenterPlayerCollectionViewCell_alias));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore39LargeGameCenterPlayerCollectionViewCell_displayName));
}

@end
