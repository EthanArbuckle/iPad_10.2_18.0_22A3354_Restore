@implementation SmallLockupCollectionViewCell

- (_TtC22SubscribePageExtension29SmallLockupCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtension29SmallLockupCollectionViewCell *)sub_1001DDD34(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC22SubscribePageExtension29SmallLockupCollectionViewCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1001DEFE4();
}

- (void)layoutSubviews
{
  _TtC22SubscribePageExtension29SmallLockupCollectionViewCell *v2;

  v2 = self;
  sub_1001DE5F8();

}

- (void)prepareForReuse
{
  char *v2;
  id v3;
  Swift::Bool v4;
  objc_super v5;
  UIImage_optional v6;

  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType(self, a2);
  v2 = (char *)v5.receiver;
  -[SmallLockupCollectionViewCell prepareForReuse](&v5, "prepareForReuse");
  v3 = objc_retain(*(id *)(*(_QWORD *)&v2[OBJC_IVAR____TtC22SubscribePageExtension29SmallLockupCollectionViewCell_lockupView]
                         + OBJC_IVAR____TtC22SubscribePageExtension14BaseLockupView_artworkView));
  v6.value.super.isa = 0;
  v6.is_nil = 0;
  ArtworkView.setImage(image:animated:)(v6, v4);

}

- (_TtC22SubscribePageExtension15SmallLockupView)accessibilityLockupView
{
  return (_TtC22SubscribePageExtension15SmallLockupView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                                                  + OBJC_IVAR____TtC22SubscribePageExtension29SmallLockupCollectionViewCell_lockupView));
}

- (void).cxx_destruct
{
  sub_100011088((uint64_t)self + OBJC_IVAR____TtC22SubscribePageExtension29SmallLockupCollectionViewCell_itemLayoutContext, &qword_1007F4A50);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension29SmallLockupCollectionViewCell_lockupView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension29SmallLockupCollectionViewCell_separatorView));
  sub_100011088((uint64_t)self + OBJC_IVAR____TtC22SubscribePageExtension29SmallLockupCollectionViewCell_separator, &qword_100806180);
}

@end
