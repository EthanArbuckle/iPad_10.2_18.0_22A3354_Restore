@implementation MediumAdLockupWithScreenshotsBackgroundTodayCardCollectionViewCell

- (void)layoutSubviews
{
  char *v2;
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)swift_getObjectType(self, a2);
  v2 = (char *)v4.receiver;
  -[BaseTodayCardCollectionViewCell layoutSubviews](&v4, "layoutSubviews");
  v3 = *(void **)&v2[OBJC_IVAR____TtC8AppStore66MediumAdLockupWithScreenshotsBackgroundTodayCardCollectionViewCell_mediumAdLockupWithScreenshotsBackgroundView];
  objc_msgSend(v2, "bounds", v4.receiver, v4.super_class);
  objc_msgSend(v3, "setFrame:");

}

- (_TtC8AppStore66MediumAdLockupWithScreenshotsBackgroundTodayCardCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore66MediumAdLockupWithScreenshotsBackgroundTodayCardCollectionViewCell *)sub_10001AA5C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)prepareForReuse
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)swift_getObjectType(self, a2);
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

  v3 = sub_10007B804(&qword_10082A460);
  v4 = swift_allocObject(v3, 64, 7);
  v5 = *(uint64_t *)((char *)&self->super.super.super.super.super.super.isa
                  + OBJC_IVAR____TtC8AppStore66MediumAdLockupWithScreenshotsBackgroundTodayCardCollectionViewCell_mediumAdLockupWithScreenshotsBackgroundView);
  *(_OWORD *)(v4 + 16) = xmmword_100661A30;
  v6 = *(void **)(v5 + OBJC_IVAR____TtC8AppStore43MediumAdLockupWithScreenshotsBackgroundView_lockupView);
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
  _TtC8AppStore66MediumAdLockupWithScreenshotsBackgroundTodayCardCollectionViewCell *v7;
  double v8;
  _TtC8AppStore66MediumAdLockupWithScreenshotsBackgroundTodayCardCollectionViewCell *v9;
  objc_super v10;

  ObjectType = (objc_class *)swift_getObjectType(self, a2);
  if (isa)
  {
    v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)(isa, (char *)&type metadata for Any + 8);
    v7 = self;
    isa = Array._bridgeToObjectiveC()().super.isa;
    *(_QWORD *)&v8 = swift_bridgeObjectRelease(v6).n128_u64[0];
  }
  else
  {
    v9 = self;
  }
  v10.receiver = self;
  v10.super_class = ObjectType;
  -[MediumAdLockupWithScreenshotsBackgroundTodayCardCollectionViewCell setAccessibilityElements:](&v10, "setAccessibilityElements:", isa, v8);

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore66MediumAdLockupWithScreenshotsBackgroundTodayCardCollectionViewCell_mediumAdLockupWithScreenshotsBackgroundView));
}

@end
