@implementation TodayCardChinSingleLockupView

- (_TtC20ProductPageExtension29TodayCardChinSingleLockupView)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtension29TodayCardChinSingleLockupView *)sub_10020AB98(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC20ProductPageExtension29TodayCardChinSingleLockupView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_10020CBA8();
}

- (void)layoutSubviews
{
  _TtC20ProductPageExtension29TodayCardChinSingleLockupView *v2;

  v2 = self;
  sub_10020BE00();

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width;
  _TtC20ProductPageExtension29TodayCardChinSingleLockupView *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  width = a3.width;
  v4 = self;
  v5 = sub_10020BFD0(width);
  v7 = v6;

  v8 = v5;
  v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
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
  _TtC20ProductPageExtension29TodayCardChinSingleLockupView *v8;
  BOOL v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = sub_10020CC6C(v7);

  return v9;
}

- (void)handleTap
{
  void (*v2)(uint64_t);
  uint64_t v3;
  uint64_t v4;
  _TtC20ProductPageExtension29TodayCardChinSingleLockupView *v5;

  v2 = *(void (**)(uint64_t))((char *)&self->super.super.super.super.isa
                                      + OBJC_IVAR____TtC20ProductPageExtension29TodayCardChinSingleLockupView_clickActionHandler);
  if (v2)
  {
    v3 = *(_QWORD *)&self->lockupView[OBJC_IVAR____TtC20ProductPageExtension29TodayCardChinSingleLockupView_clickActionHandler];
    v5 = self;
    v4 = sub_100018918((uint64_t)v2, v3);
    v2(v4);
    sub_100018908((uint64_t)v2, v3);

  }
}

- (NSArray)accessibilityElements
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;
  Class isa;

  v3 = sub_10000DAF8(&qword_1008091A0);
  v4 = swift_allocObject(v3, 64, 7);
  *(_OWORD *)(v4 + 16) = xmmword_100640720;
  v5 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC20ProductPageExtension29TodayCardChinSingleLockupView_lockupView);
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
  _TtC20ProductPageExtension29TodayCardChinSingleLockupView *v7;
  _TtC20ProductPageExtension29TodayCardChinSingleLockupView *v8;
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
  -[TodayCardChinSingleLockupView setAccessibilityElements:](&v9, "setAccessibilityElements:", isa);

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension29TodayCardChinSingleLockupView_lockupView));
  swift_weakDestroy((char *)self + OBJC_IVAR____TtC20ProductPageExtension29TodayCardChinSingleLockupView_impressionsCalculator);
  sub_100018908(*(uint64_t *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC20ProductPageExtension29TodayCardChinSingleLockupView_impressionsUpdateBlock), *(_QWORD *)&self->lockupView[OBJC_IVAR____TtC20ProductPageExtension29TodayCardChinSingleLockupView_impressionsUpdateBlock]);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension29TodayCardChinSingleLockupView_tapGestureRecognizer));
  sub_100018908(*(uint64_t *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC20ProductPageExtension29TodayCardChinSingleLockupView_clickActionHandler), *(_QWORD *)&self->lockupView[OBJC_IVAR____TtC20ProductPageExtension29TodayCardChinSingleLockupView_clickActionHandler]);
}

@end
