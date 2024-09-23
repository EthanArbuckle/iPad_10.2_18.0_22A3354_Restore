@implementation TodayCardChinSingleLockupView

- (void)layoutSubviews
{
  _TtC8AppStore29TodayCardChinSingleLockupView *v2;

  v2 = self;
  sub_10003A698();

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width;
  _TtC8AppStore29TodayCardChinSingleLockupView *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  width = a3.width;
  v4 = self;
  v5 = sub_100041384(width);
  v7 = v6;

  v8 = v5;
  v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (_TtC8AppStore29TodayCardChinSingleLockupView)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore29TodayCardChinSingleLockupView *)sub_100025FD0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore29TodayCardChinSingleLockupView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1005D7234();
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  uint64_t v5;

  v5 = objc_opt_self(UIPanGestureRecognizer);
  return swift_dynamicCastObjCClass(a4, v5) == 0;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v6;
  id v7;
  _TtC8AppStore29TodayCardChinSingleLockupView *v8;
  BOOL v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = sub_1005D72F8(v7);

  return v9;
}

- (void)handleTap
{
  void (*v2)(uint64_t);
  uint64_t v3;
  uint64_t v4;
  _TtC8AppStore29TodayCardChinSingleLockupView *v5;

  v2 = *(void (**)(uint64_t))((char *)&self->super.super.super.super.isa
                                      + OBJC_IVAR____TtC8AppStore29TodayCardChinSingleLockupView_clickActionHandler);
  if (v2)
  {
    v3 = *(_QWORD *)&self->lockupView[OBJC_IVAR____TtC8AppStore29TodayCardChinSingleLockupView_clickActionHandler];
    v5 = self;
    v4 = sub_10003A340((uint64_t)v2, v3);
    v2(v4);
    sub_10003A350((uint64_t)v2, v3);

  }
}

- (NSArray)accessibilityElements
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;
  Class isa;

  v3 = sub_10007B804(&qword_10082A460);
  v4 = swift_allocObject(v3, 64, 7);
  *(_OWORD *)(v4 + 16) = xmmword_100661A30;
  v5 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC8AppStore29TodayCardChinSingleLockupView_lockupView);
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
  _TtC8AppStore29TodayCardChinSingleLockupView *v7;
  double v8;
  _TtC8AppStore29TodayCardChinSingleLockupView *v9;
  objc_super v10;

  ObjectType = (objc_class *)swift_getObjectType();
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
  -[TodayCardChinSingleLockupView setAccessibilityElements:](&v10, "setAccessibilityElements:", isa, v8);

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore29TodayCardChinSingleLockupView_lockupView));
  swift_weakDestroy((char *)self + OBJC_IVAR____TtC8AppStore29TodayCardChinSingleLockupView_impressionsCalculator);
  sub_10003A350(*(uint64_t *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC8AppStore29TodayCardChinSingleLockupView_impressionsUpdateBlock), *(_QWORD *)&self->lockupView[OBJC_IVAR____TtC8AppStore29TodayCardChinSingleLockupView_impressionsUpdateBlock]);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore29TodayCardChinSingleLockupView_tapGestureRecognizer));
  sub_10003A350(*(uint64_t *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC8AppStore29TodayCardChinSingleLockupView_clickActionHandler), *(_QWORD *)&self->lockupView[OBJC_IVAR____TtC8AppStore29TodayCardChinSingleLockupView_clickActionHandler]);
}

@end
