@implementation MediumAdLockupWithScreenshotsBackgroundTodayCardCollectionViewCell

- (_TtC22SubscribePageExtension66MediumAdLockupWithScreenshotsBackgroundTodayCardCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtension66MediumAdLockupWithScreenshotsBackgroundTodayCardCollectionViewCell *)sub_10039C294(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)layoutSubviews
{
  char *v2;
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)swift_getObjectType();
  v2 = (char *)v4.receiver;
  -[BaseTodayCardCollectionViewCell layoutSubviews](&v4, "layoutSubviews");
  v3 = *(void **)&v2[OBJC_IVAR____TtC22SubscribePageExtension66MediumAdLockupWithScreenshotsBackgroundTodayCardCollectionViewCell_mediumAdLockupWithScreenshotsBackgroundView];
  objc_msgSend(v2, "bounds", v4.receiver, v4.super_class);
  objc_msgSend(v3, "setFrame:");

}

- (void)prepareForReuse
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)swift_getObjectType();
  -[BaseTodayCardCollectionViewCell prepareForReuse](&v2, "prepareForReuse");
}

- (NSArray)accessibilityElements
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  Class isa;

  v3 = sub_10000DF3C((uint64_t *)&unk_1007F7C40);
  v4 = swift_allocObject(v3, 64, 7);
  v5 = *(uint64_t *)((char *)&self->super.super.super.super.super.super.isa
                  + OBJC_IVAR____TtC22SubscribePageExtension66MediumAdLockupWithScreenshotsBackgroundTodayCardCollectionViewCell_mediumAdLockupWithScreenshotsBackgroundView);
  *(_OWORD *)(v4 + 16) = xmmword_10066FBA0;
  v6 = *(void **)(v5 + OBJC_IVAR____TtC22SubscribePageExtension43MediumAdLockupWithScreenshotsBackgroundView_lockupView);
  *(_QWORD *)(v4 + 56) = type metadata accessor for TodayCardLockupView();
  *(_QWORD *)(v4 + 32) = v6;
  v7 = v6;
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v4);
  return (NSArray *)isa;
}

- (void)setAccessibilityElements:(id)isa
{
  objc_class *ObjectType;
  uint64_t v6;
  _TtC22SubscribePageExtension66MediumAdLockupWithScreenshotsBackgroundTodayCardCollectionViewCell *v7;
  _TtC22SubscribePageExtension66MediumAdLockupWithScreenshotsBackgroundTodayCardCollectionViewCell *v8;
  objc_super v9;

  ObjectType = (objc_class *)swift_getObjectType();
  if (isa)
  {
    v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)(isa, (char *)&type metadata for Any + 8);
    v7 = self;
    isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v6);
  }
  else
  {
    v8 = self;
  }
  v9.receiver = self;
  v9.super_class = ObjectType;
  -[MediumAdLockupWithScreenshotsBackgroundTodayCardCollectionViewCell setAccessibilityElements:](&v9, "setAccessibilityElements:", isa);

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension66MediumAdLockupWithScreenshotsBackgroundTodayCardCollectionViewCell_mediumAdLockupWithScreenshotsBackgroundView));
}

@end
