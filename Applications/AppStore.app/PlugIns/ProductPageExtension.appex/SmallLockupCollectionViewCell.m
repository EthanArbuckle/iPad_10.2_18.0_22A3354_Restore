@implementation SmallLockupCollectionViewCell

- (_TtC20ProductPageExtension29SmallLockupCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtension29SmallLockupCollectionViewCell *)sub_100248280(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC20ProductPageExtension29SmallLockupCollectionViewCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1002494E8();
}

- (void)layoutSubviews
{
  _TtC20ProductPageExtension29SmallLockupCollectionViewCell *v2;

  v2 = self;
  sub_100248B44();

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
  v3 = objc_retain(*(id *)(*(_QWORD *)&v2[OBJC_IVAR____TtC20ProductPageExtension29SmallLockupCollectionViewCell_lockupView]
                         + OBJC_IVAR____TtC20ProductPageExtension14BaseLockupView_artworkView));
  v6.value.super.isa = 0;
  v6.is_nil = 0;
  ArtworkView.setImage(image:animated:)(v6, v4);

}

- (_TtC20ProductPageExtension15SmallLockupView)accessibilityLockupView
{
  return (_TtC20ProductPageExtension15SmallLockupView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                                                + OBJC_IVAR____TtC20ProductPageExtension29SmallLockupCollectionViewCell_lockupView));
}

- (void).cxx_destruct
{
  sub_100010F2C((uint64_t)self + OBJC_IVAR____TtC20ProductPageExtension29SmallLockupCollectionViewCell_itemLayoutContext, &qword_1008081F0);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension29SmallLockupCollectionViewCell_lockupView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension29SmallLockupCollectionViewCell_separatorView));
  sub_100010F2C((uint64_t)self + OBJC_IVAR____TtC20ProductPageExtension29SmallLockupCollectionViewCell_separator, (uint64_t *)&unk_10080B170);
}

@end
