@implementation MixedMediaLockupCollectionViewCell

- (_TtC20ProductPageExtension34MixedMediaLockupCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtension34MixedMediaLockupCollectionViewCell *)sub_1001DC540(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC20ProductPageExtension34MixedMediaLockupCollectionViewCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1001DD144();
}

- (void)layoutSubviews
{
  _TtC20ProductPageExtension34MixedMediaLockupCollectionViewCell *v2;

  v2 = self;
  sub_1001DC914();

}

- (_TtC20ProductPageExtension15SmallLockupView)accessibilityLockupView
{
  return (_TtC20ProductPageExtension15SmallLockupView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                                                + OBJC_IVAR____TtC20ProductPageExtension34MixedMediaLockupCollectionViewCell_lockupView));
}

- (_TtC11AppStoreKit16DynamicTypeLabel)accessibilityTaglineLabel
{
  return (_TtC11AppStoreKit16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                                        + OBJC_IVAR____TtC20ProductPageExtension34MixedMediaLockupCollectionViewCell_taglineLabel));
}

- (_TtC20ProductPageExtension9VideoView)accessibilityVideoView
{
  return (_TtC20ProductPageExtension9VideoView *)(id)swift_unknownObjectWeakLoadStrong(*(char **)((char *)&self->super.super.super.super.super.isa+ OBJC_IVAR____TtC20ProductPageExtension34MixedMediaLockupCollectionViewCell_mediaView)+ OBJC_IVAR____TtC20ProductPageExtension15LockupMediaView_videoView);
}

- (_TtC20ProductPageExtension15LockupMediaView)accessibilityMediaView
{
  return (_TtC20ProductPageExtension15LockupMediaView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                                                + OBJC_IVAR____TtC20ProductPageExtension34MixedMediaLockupCollectionViewCell_mediaView));
}

- (void)prepareForReuse
{
  char *v2;
  id v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for MixedMediaLockupCollectionViewCell(0);
  v2 = (char *)v4.receiver;
  -[MixedMediaLockupCollectionViewCell prepareForReuse](&v4, "prepareForReuse");
  v3 = *(id *)&v2[OBJC_IVAR____TtC20ProductPageExtension34MixedMediaLockupCollectionViewCell_mediaView];
  sub_10048E89C();

}

- (void).cxx_destruct
{
  sub_100010F2C((uint64_t)self + OBJC_IVAR____TtC20ProductPageExtension34MixedMediaLockupCollectionViewCell_itemLayoutContext, &qword_1008081F0);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension34MixedMediaLockupCollectionViewCell_lockupView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension34MixedMediaLockupCollectionViewCell_mediaView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension34MixedMediaLockupCollectionViewCell_taglineLabel));
  swift_unknownObjectRelease();
  sub_100010F2C((uint64_t)self + OBJC_IVAR____TtC20ProductPageExtension34MixedMediaLockupCollectionViewCell_overrideLockupPosition, &qword_100814E60);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension34MixedMediaLockupCollectionViewCell_searchAdTransparencyButton));
}

@end
