@implementation MixedMediaLockupCollectionViewCell

- (_TtC22SubscribePageExtension34MixedMediaLockupCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtension34MixedMediaLockupCollectionViewCell *)sub_1002F86AC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC22SubscribePageExtension34MixedMediaLockupCollectionViewCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1002F95E8();
}

- (void)layoutSubviews
{
  _TtC22SubscribePageExtension34MixedMediaLockupCollectionViewCell *v2;

  v2 = self;
  sub_1002F8C48();

}

- (_TtC22SubscribePageExtension15SmallLockupView)accessibilityLockupView
{
  return (_TtC22SubscribePageExtension15SmallLockupView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                                                  + OBJC_IVAR____TtC22SubscribePageExtension34MixedMediaLockupCollectionViewCell_lockupView));
}

- (_TtC11AppStoreKit16DynamicTypeLabel)accessibilityTaglineLabel
{
  return (_TtC11AppStoreKit16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                                        + OBJC_IVAR____TtC22SubscribePageExtension34MixedMediaLockupCollectionViewCell_taglineLabel));
}

- (_TtC22SubscribePageExtension9VideoView)accessibilityVideoView
{
  return (_TtC22SubscribePageExtension9VideoView *)(id)swift_unknownObjectWeakLoadStrong(*(char **)((char *)&self->super.super.super.super.super.isa+ OBJC_IVAR____TtC22SubscribePageExtension34MixedMediaLockupCollectionViewCell_mediaView)+ OBJC_IVAR____TtC22SubscribePageExtension15LockupMediaView_videoView);
}

- (_TtC22SubscribePageExtension15LockupMediaView)accessibilityMediaView
{
  return (_TtC22SubscribePageExtension15LockupMediaView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                                                  + OBJC_IVAR____TtC22SubscribePageExtension34MixedMediaLockupCollectionViewCell_mediaView));
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
  v3 = *(id *)&v2[OBJC_IVAR____TtC22SubscribePageExtension34MixedMediaLockupCollectionViewCell_mediaView];
  sub_10052DDD4();

}

- (void).cxx_destruct
{
  sub_100011088((uint64_t)self + OBJC_IVAR____TtC22SubscribePageExtension34MixedMediaLockupCollectionViewCell_itemLayoutContext, &qword_1007F4A50);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension34MixedMediaLockupCollectionViewCell_lockupView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension34MixedMediaLockupCollectionViewCell_mediaView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension34MixedMediaLockupCollectionViewCell_taglineLabel));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.super.super.super.super.isa
                                      + OBJC_IVAR____TtC22SubscribePageExtension34MixedMediaLockupCollectionViewCell_pageTraits));
  sub_100011088((uint64_t)self + OBJC_IVAR____TtC22SubscribePageExtension34MixedMediaLockupCollectionViewCell_overrideLockupPosition, &qword_1007F4C98);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension34MixedMediaLockupCollectionViewCell_searchAdTransparencyButton));
}

@end
