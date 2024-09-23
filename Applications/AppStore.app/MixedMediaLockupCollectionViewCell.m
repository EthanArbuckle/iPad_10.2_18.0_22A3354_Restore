@implementation MixedMediaLockupCollectionViewCell

- (_TtC8AppStore34MixedMediaLockupCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore34MixedMediaLockupCollectionViewCell *)sub_100114D74(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore34MixedMediaLockupCollectionViewCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_100115CB0();
}

- (void)layoutSubviews
{
  _TtC8AppStore34MixedMediaLockupCollectionViewCell *v2;

  v2 = self;
  sub_100115310();

}

- (_TtC8AppStore15SmallLockupView)accessibilityLockupView
{
  return (_TtC8AppStore15SmallLockupView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                                   + OBJC_IVAR____TtC8AppStore34MixedMediaLockupCollectionViewCell_lockupView));
}

- (_TtC11AppStoreKit16DynamicTypeLabel)accessibilityTaglineLabel
{
  return (_TtC11AppStoreKit16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                                        + OBJC_IVAR____TtC8AppStore34MixedMediaLockupCollectionViewCell_taglineLabel));
}

- (_TtC8AppStore9VideoView)accessibilityVideoView
{
  return (_TtC8AppStore9VideoView *)(id)swift_unknownObjectWeakLoadStrong(*(char **)((char *)&self->super.super.super.super.super.isa+ OBJC_IVAR____TtC8AppStore34MixedMediaLockupCollectionViewCell_mediaView)+ OBJC_IVAR____TtC8AppStore15LockupMediaView_videoView);
}

- (_TtC8AppStore15LockupMediaView)accessibilityMediaView
{
  return (_TtC8AppStore15LockupMediaView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                                   + OBJC_IVAR____TtC8AppStore34MixedMediaLockupCollectionViewCell_mediaView));
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
  v3 = *(id *)&v2[OBJC_IVAR____TtC8AppStore34MixedMediaLockupCollectionViewCell_mediaView];
  sub_1001BED40();

}

- (void).cxx_destruct
{
  sub_1000057AC((uint64_t)self + OBJC_IVAR____TtC8AppStore34MixedMediaLockupCollectionViewCell_itemLayoutContext, &qword_10082D9A0);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore34MixedMediaLockupCollectionViewCell_lockupView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore34MixedMediaLockupCollectionViewCell_mediaView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore34MixedMediaLockupCollectionViewCell_taglineLabel));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.super.super.super.super.isa
                                      + OBJC_IVAR____TtC8AppStore34MixedMediaLockupCollectionViewCell_pageTraits));
  sub_1000057AC((uint64_t)self + OBJC_IVAR____TtC8AppStore34MixedMediaLockupCollectionViewCell_overrideLockupPosition, &qword_10082D170);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore34MixedMediaLockupCollectionViewCell_searchAdTransparencyButton));
}

@end
