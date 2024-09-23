@implementation MediumAdLockupWithScreenshotsBackgroundView

- (_TtC22SubscribePageExtension43MediumAdLockupWithScreenshotsBackgroundView)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtension43MediumAdLockupWithScreenshotsBackgroundView *)sub_1000737D4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC22SubscribePageExtension43MediumAdLockupWithScreenshotsBackgroundView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_100075D84();
}

- (void)layoutSubviews
{
  char *v2;
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)swift_getObjectType();
  v2 = (char *)v4.receiver;
  -[MediumAdLockupWithScreenshotsBackgroundView layoutSubviews](&v4, "layoutSubviews");
  sub_100074310();
  sub_100074544();
  v3 = *(void **)&v2[OBJC_IVAR____TtC22SubscribePageExtension43MediumAdLockupWithScreenshotsBackgroundView_baseGradientView];
  objc_msgSend(v2, "bounds", v4.receiver, v4.super_class);
  objc_msgSend(v3, "setFrame:");

}

- (NSArray)accessibilityElements
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;
  Class isa;

  v3 = sub_10000DF3C((uint64_t *)&unk_1007F7C40);
  v4 = swift_allocObject(v3, 64, 7);
  *(_OWORD *)(v4 + 16) = xmmword_10066FBA0;
  v5 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC22SubscribePageExtension43MediumAdLockupWithScreenshotsBackgroundView_lockupView);
  *(_QWORD *)(v4 + 56) = type metadata accessor for TodayCardLockupView();
  *(_QWORD *)(v4 + 32) = v5;
  v6 = v5;
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v4);
  return (NSArray *)isa;
}

- (void)setAccessibilityElements:(id)isa
{
  objc_class *ObjectType;
  uint64_t v6;
  _TtC22SubscribePageExtension43MediumAdLockupWithScreenshotsBackgroundView *v7;
  _TtC22SubscribePageExtension43MediumAdLockupWithScreenshotsBackgroundView *v8;
  objc_super v9;

  ObjectType = (objc_class *)swift_getObjectType(self, a2);
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
  -[MediumAdLockupWithScreenshotsBackgroundView setAccessibilityElements:](&v9, "setAccessibilityElements:", isa);

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension43MediumAdLockupWithScreenshotsBackgroundView_baseGradientView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension43MediumAdLockupWithScreenshotsBackgroundView_riverContainerView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension43MediumAdLockupWithScreenshotsBackgroundView_riverView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension43MediumAdLockupWithScreenshotsBackgroundView_joeColorGradientOverlayContainer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension43MediumAdLockupWithScreenshotsBackgroundView_joeColorGradientOverlaySolidView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension43MediumAdLockupWithScreenshotsBackgroundView_joeColorGradientOverlayGradientView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension43MediumAdLockupWithScreenshotsBackgroundView_topOverlayGradientView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension43MediumAdLockupWithScreenshotsBackgroundView_lockupView));
}

@end
