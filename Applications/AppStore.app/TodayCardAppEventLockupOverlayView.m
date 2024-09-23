@implementation TodayCardAppEventLockupOverlayView

- (_TtC8AppStore34TodayCardAppEventLockupOverlayView)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore34TodayCardAppEventLockupOverlayView *)sub_1003496A4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore34TodayCardAppEventLockupOverlayView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_10034B834();
}

- (void)dealloc
{
  objc_class *ObjectType;
  void *v4;
  _TtC8AppStore34TodayCardAppEventLockupOverlayView *v5;
  objc_super v6;

  ObjectType = (objc_class *)swift_getObjectType(self, a2);
  v4 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC8AppStore34TodayCardAppEventLockupOverlayView_tapGestureRecognizer);
  v5 = self;
  objc_msgSend(v4, "removeTarget:action:", v5, 0);
  v6.receiver = v5;
  v6.super_class = ObjectType;
  -[TodayCardAppEventLockupOverlayView dealloc](&v6, "dealloc");
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore34TodayCardAppEventLockupOverlayView_separatorView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore34TodayCardAppEventLockupOverlayView_lockupView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore34TodayCardAppEventLockupOverlayView_tapGestureRecognizer));
  swift_weakDestroy((char *)self + OBJC_IVAR____TtC8AppStore34TodayCardAppEventLockupOverlayView_impressionsCalculator);
  sub_10003A350(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC8AppStore34TodayCardAppEventLockupOverlayView_impressionsUpdateBlock), *(_QWORD *)&self->separatorView[OBJC_IVAR____TtC8AppStore34TodayCardAppEventLockupOverlayView_impressionsUpdateBlock]);
  sub_10003A350(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC8AppStore34TodayCardAppEventLockupOverlayView_clickActionHandler), *(_QWORD *)&self->separatorView[OBJC_IVAR____TtC8AppStore34TodayCardAppEventLockupOverlayView_clickActionHandler]);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  _TtC8AppStore34TodayCardAppEventLockupOverlayView *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v5 = self;
  v6 = sub_100349ECC(width, height);
  v8 = v7;

  v9 = v6;
  v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (void)layoutSubviews
{
  _TtC8AppStore34TodayCardAppEventLockupOverlayView *v2;

  v2 = self;
  sub_10034A054();

}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC8AppStore34TodayCardAppEventLockupOverlayView *v6;

  v5 = a3;
  v6 = self;
  sub_10034A2E8(a3);

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
  _TtC8AppStore34TodayCardAppEventLockupOverlayView *v8;
  BOOL v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = sub_10034B908(v7);

  return v9;
}

- (void)handleTapWithGestureRecognizer:(id)a3
{
  void (*v3)(uint64_t);
  uint64_t v5;
  id v6;
  uint64_t v7;
  _TtC8AppStore34TodayCardAppEventLockupOverlayView *v8;

  v3 = *(void (**)(uint64_t))((char *)&self->super.super.super.isa
                                      + OBJC_IVAR____TtC8AppStore34TodayCardAppEventLockupOverlayView_clickActionHandler);
  if (v3)
  {
    v5 = *(_QWORD *)&self->separatorView[OBJC_IVAR____TtC8AppStore34TodayCardAppEventLockupOverlayView_clickActionHandler];
    v6 = a3;
    v8 = self;
    v7 = sub_10003A340((uint64_t)v3, v5);
    v3(v7);
    sub_10003A350((uint64_t)v3, v5);

  }
}

@end
