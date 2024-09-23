@implementation TodayCardInfoLayerView

- (_TtC22SubscribePageExtension22TodayCardInfoLayerView)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtension22TodayCardInfoLayerView *)sub_10048A92C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC22SubscribePageExtension22TodayCardInfoLayerView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_10048D45C();
}

- (double)_continuousCornerRadius
{
  double result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  -[TodayCardInfoLayerView _continuousCornerRadius](&v3, "_continuousCornerRadius");
  return result;
}

- (void)_setContinuousCornerRadius:(double)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  v4 = v5.receiver;
  -[TodayCardInfoLayerView _setContinuousCornerRadius:](&v5, "_setContinuousCornerRadius:", a3);
  sub_10048AE64();

}

- (void)layoutSubviews
{
  _TtC22SubscribePageExtension22TodayCardInfoLayerView *v2;

  v2 = self;
  sub_10048BC10();

}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v8;
  _TtC22SubscribePageExtension22TodayCardInfoLayerView *v9;
  id v10;

  y = a3.y;
  x = a3.x;
  v8 = a4;
  v9 = self;
  v10 = sub_10048C270((uint64_t)a4, x, y);

  return v10;
}

- (NSString)accessibilityLabel
{
  _TtC22SubscribePageExtension22TodayCardInfoLayerView *v2;
  uint64_t v3;
  uint64_t v4;
  NSString v5;

  v2 = self;
  sub_100562A54();
  v4 = v3;

  if (v4)
  {
    v5 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v4);
  }
  else
  {
    v5 = 0;
  }
  return (NSString *)v5;
}

- (void)setAccessibilityLabel:(id)a3
{
  objc_class *ObjectType;
  uint64_t v6;
  uint64_t v7;
  _TtC22SubscribePageExtension22TodayCardInfoLayerView *v8;
  _TtC22SubscribePageExtension22TodayCardInfoLayerView *v9;
  objc_super v10;

  ObjectType = (objc_class *)swift_getObjectType();
  if (a3)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v7 = v6;
    v8 = self;
    a3 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v7);
  }
  else
  {
    v9 = self;
  }
  v10.receiver = self;
  v10.super_class = ObjectType;
  -[TodayCardInfoLayerView setAccessibilityLabel:](&v10, "setAccessibilityLabel:", a3);

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension22TodayCardInfoLayerView_labelsView));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC22SubscribePageExtension22TodayCardInfoLayerView_labelsArtworkFetchKey));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension22TodayCardInfoLayerView_gradientBlurView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension22TodayCardInfoLayerView_overlayContainer));
  sub_100019310(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC22SubscribePageExtension22TodayCardInfoLayerView_protectionUpdateBlock), *(_QWORD *)&self->labelsView[OBJC_IVAR____TtC22SubscribePageExtension22TodayCardInfoLayerView_protectionUpdateBlock]);
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                      + OBJC_IVAR____TtC22SubscribePageExtension22TodayCardInfoLayerView_overlay));
  swift_weakDestroy((char *)self + OBJC_IVAR____TtC22SubscribePageExtension22TodayCardInfoLayerView_overlayReusePool);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension22TodayCardInfoLayerView_preferredGradientType));
}

@end
