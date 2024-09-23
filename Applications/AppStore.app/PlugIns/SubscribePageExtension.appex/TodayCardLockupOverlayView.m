@implementation TodayCardLockupOverlayView

- (_TtC22SubscribePageExtension26TodayCardLockupOverlayView)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtension26TodayCardLockupOverlayView *)sub_10046F7B4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC22SubscribePageExtension26TodayCardLockupOverlayView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1004720B4();
}

- (void)dealloc
{
  objc_class *ObjectType;
  void *v4;
  _TtC22SubscribePageExtension26TodayCardLockupOverlayView *v5;
  objc_super v6;

  ObjectType = (objc_class *)swift_getObjectType();
  v4 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC22SubscribePageExtension26TodayCardLockupOverlayView_tapGestureRecognizer);
  v5 = self;
  objc_msgSend(v4, "removeTarget:action:", v5, 0);
  v6.receiver = v5;
  v6.super_class = ObjectType;
  -[TodayCardLockupOverlayView dealloc](&v6, "dealloc");
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension26TodayCardLockupOverlayView_lockupView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension26TodayCardLockupOverlayView_tapGestureRecognizer));
  swift_weakDestroy((char *)self + OBJC_IVAR____TtC22SubscribePageExtension26TodayCardLockupOverlayView_impressionsCalculator);
  sub_100019310(*(uint64_t *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC22SubscribePageExtension26TodayCardLockupOverlayView_impressionsUpdateBlock), *(_QWORD *)&self->lockupView[OBJC_IVAR____TtC22SubscribePageExtension26TodayCardLockupOverlayView_impressionsUpdateBlock]);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension26TodayCardLockupOverlayView_separatorView));
  sub_100019310(*(uint64_t *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC22SubscribePageExtension26TodayCardLockupOverlayView_clickActionHandler), *(_QWORD *)&self->lockupView[OBJC_IVAR____TtC22SubscribePageExtension26TodayCardLockupOverlayView_clickActionHandler]);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  _TtC22SubscribePageExtension26TodayCardLockupOverlayView *v11;
  id v12;
  double v13;
  double v14;
  double v15;
  double v16;
  uint64_t v17;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v6 = type metadata accessor for SmallLockupLayout.Metrics(0);
  v7 = *(_QWORD *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = *(Class *)((char *)&self->super.super.super.super.isa
                 + OBJC_IVAR____TtC22SubscribePageExtension26TodayCardLockupOverlayView_lockupView);
  v11 = self;
  sub_1001B721C((uint64_t)v9);
  objc_msgSend(v10, "layoutMargins");
  v12 = objc_msgSend(v10, "traitCollection");
  sub_1001934E0((uint64_t)v9, (uint64_t)v12, width, height);
  v14 = v13;

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  v15 = fmax(v14, 79.0);
  v16 = width;
  result.height = v15;
  result.width = v16;
  return result;
}

- (void)layoutSubviews
{
  _TtC22SubscribePageExtension26TodayCardLockupOverlayView *v2;

  v2 = self;
  sub_10046FFCC();

}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  id v5;
  id v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)swift_getObjectType();
  v4 = a3;
  v5 = v7.receiver;
  -[TodayCardLockupOverlayView traitCollectionDidChange:](&v7, "traitCollectionDidChange:", v4);
  v6 = objc_msgSend(v5, "traitCollection", v7.receiver, v7.super_class);
  sub_1001B6544(v6);

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
  _TtC22SubscribePageExtension26TodayCardLockupOverlayView *v8;
  BOOL v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = sub_1004721A4(v7);

  return v9;
}

- (void)handleTapWithGestureRecognizer:(id)a3
{
  void (*v3)(uint64_t);
  uint64_t v5;
  id v6;
  uint64_t v7;
  _TtC22SubscribePageExtension26TodayCardLockupOverlayView *v8;

  v3 = *(void (**)(uint64_t))((char *)&self->super.super.super.super.isa
                                      + OBJC_IVAR____TtC22SubscribePageExtension26TodayCardLockupOverlayView_clickActionHandler);
  if (v3)
  {
    v5 = *(_QWORD *)&self->lockupView[OBJC_IVAR____TtC22SubscribePageExtension26TodayCardLockupOverlayView_clickActionHandler];
    v6 = a3;
    v8 = self;
    v7 = sub_100019320((uint64_t)v3, v5);
    v3(v7);
    sub_100019310((uint64_t)v3, v5);

  }
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
  v5 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC22SubscribePageExtension26TodayCardLockupOverlayView_lockupView);
  *(_QWORD *)(v4 + 56) = type metadata accessor for CrossLinkLockupView();
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
  _TtC22SubscribePageExtension26TodayCardLockupOverlayView *v7;
  _TtC22SubscribePageExtension26TodayCardLockupOverlayView *v8;
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
  -[TodayCardLockupOverlayView setAccessibilityElements:](&v9, "setAccessibilityElements:", isa);

}

@end
