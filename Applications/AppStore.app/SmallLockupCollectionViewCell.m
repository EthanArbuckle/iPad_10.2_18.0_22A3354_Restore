@implementation SmallLockupCollectionViewCell

- (_TtC8AppStore29SmallLockupCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore29SmallLockupCollectionViewCell *)sub_10027DE18(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore29SmallLockupCollectionViewCell)initWithCoder:(id)a3
{
  id v3;
  uint64_t v4;

  v3 = a3;
  sub_10027F068((uint64_t)v3, v4);
}

- (void)layoutSubviews
{
  _TtC8AppStore29SmallLockupCollectionViewCell *v2;

  v2 = self;
  sub_10027E6DC();

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
  v3 = objc_retain(*(id *)(*(_QWORD *)&v2[OBJC_IVAR____TtC8AppStore29SmallLockupCollectionViewCell_lockupView]
                         + OBJC_IVAR____TtC8AppStore14BaseLockupView_artworkView));
  v6.value.super.isa = 0;
  v6.is_nil = 0;
  ArtworkView.setImage(image:animated:)(v6, v4);

}

- (_TtC8AppStore15SmallLockupView)accessibilityLockupView
{
  return (_TtC8AppStore15SmallLockupView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                                   + OBJC_IVAR____TtC8AppStore29SmallLockupCollectionViewCell_lockupView));
}

- (void).cxx_destruct
{
  sub_1000057AC((uint64_t)self + OBJC_IVAR____TtC8AppStore29SmallLockupCollectionViewCell_itemLayoutContext, &qword_10082D9A0);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore29SmallLockupCollectionViewCell_lockupView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore29SmallLockupCollectionViewCell_separatorView));
  sub_1000057AC((uint64_t)self + OBJC_IVAR____TtC8AppStore29SmallLockupCollectionViewCell_separator, (uint64_t *)&unk_10084CE60);
}

@end
