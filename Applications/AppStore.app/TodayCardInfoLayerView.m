@implementation TodayCardInfoLayerView

- (void)layoutSubviews
{
  _TtC8AppStore22TodayCardInfoLayerView *v2;

  v2 = self;
  sub_1000411B8();

}

- (_TtC8AppStore22TodayCardInfoLayerView)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore22TodayCardInfoLayerView *)sub_10002C23C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore22TodayCardInfoLayerView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1000F4BF4();
}

- (double)_continuousCornerRadius
{
  double result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType(self, a2);
  -[TodayCardInfoLayerView _continuousCornerRadius](&v3, "_continuousCornerRadius");
  return result;
}

- (void)_setContinuousCornerRadius:(double)a3
{
  id v4;
  id v5;
  uint64_t v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)swift_getObjectType();
  v4 = v7.receiver;
  v5 = -[TodayCardInfoLayerView _setContinuousCornerRadius:](&v7, "_setContinuousCornerRadius:", a3);
  sub_1000F2824((uint64_t)v5, v6);

}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v8;
  _TtC8AppStore22TodayCardInfoLayerView *v9;
  uint64_t v10;
  id v11;

  y = a3.y;
  x = a3.x;
  v8 = a4;
  v9 = self;
  v11 = sub_1000F3CEC((uint64_t)a4, v10, x, y);

  return v11;
}

- (NSString)accessibilityLabel
{
  _TtC8AppStore22TodayCardInfoLayerView *v2;
  uint64_t v3;
  uint64_t v4;
  NSString v5;

  v2 = self;
  sub_10004B590();
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
  _TtC8AppStore22TodayCardInfoLayerView *v8;
  _TtC8AppStore22TodayCardInfoLayerView *v9;
  objc_super v10;

  ObjectType = (objc_class *)swift_getObjectType(self, a2);
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
                     + OBJC_IVAR____TtC8AppStore22TodayCardInfoLayerView_labelsView));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC8AppStore22TodayCardInfoLayerView_labelsArtworkFetchKey));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore22TodayCardInfoLayerView_gradientBlurView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore22TodayCardInfoLayerView_overlayContainer));
  sub_10003A350(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC8AppStore22TodayCardInfoLayerView_protectionUpdateBlock), *(_QWORD *)&self->labelsView[OBJC_IVAR____TtC8AppStore22TodayCardInfoLayerView_protectionUpdateBlock]);
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                      + OBJC_IVAR____TtC8AppStore22TodayCardInfoLayerView_overlay));
  swift_weakDestroy((char *)self + OBJC_IVAR____TtC8AppStore22TodayCardInfoLayerView_overlayReusePool);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore22TodayCardInfoLayerView_preferredGradientType));
}

@end
