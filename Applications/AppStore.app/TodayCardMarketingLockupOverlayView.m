@implementation TodayCardMarketingLockupOverlayView

- (_TtC8AppStore35TodayCardMarketingLockupOverlayView)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore35TodayCardMarketingLockupOverlayView *)sub_1002B4548(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore35TodayCardMarketingLockupOverlayView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1002B7C70();
}

- (void)dealloc
{
  objc_class *ObjectType;
  void *v4;
  _TtC8AppStore35TodayCardMarketingLockupOverlayView *v5;
  objc_super v6;

  ObjectType = (objc_class *)swift_getObjectType(self, a2);
  v4 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC8AppStore35TodayCardMarketingLockupOverlayView_tapGestureRecognizer);
  v5 = self;
  objc_msgSend(v4, "removeTarget:action:", v5, 0);
  v6.receiver = v5;
  v6.super_class = ObjectType;
  -[TodayCardMarketingLockupOverlayView dealloc](&v6, "dealloc");
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore35TodayCardMarketingLockupOverlayView_lockupView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore35TodayCardMarketingLockupOverlayView_tapGestureRecognizer));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore35TodayCardMarketingLockupOverlayView_materialBackground));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore35TodayCardMarketingLockupOverlayView_paragraphLabel));
  swift_weakDestroy((char *)self + OBJC_IVAR____TtC8AppStore35TodayCardMarketingLockupOverlayView_impressionsCalculator);
  sub_10003A350(*(uint64_t *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC8AppStore35TodayCardMarketingLockupOverlayView_impressionsUpdateBlock), *(_QWORD *)&self->lockupView[OBJC_IVAR____TtC8AppStore35TodayCardMarketingLockupOverlayView_impressionsUpdateBlock]);
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC8AppStore35TodayCardMarketingLockupOverlayView_otherOverlayToExchangeSubviewsWith);
  sub_10003A350(*(uint64_t *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC8AppStore35TodayCardMarketingLockupOverlayView_clickActionHandler), *(_QWORD *)&self->lockupView[OBJC_IVAR____TtC8AppStore35TodayCardMarketingLockupOverlayView_clickActionHandler]);
}

- (void)animationDidStart:(id)a3
{
  uint64_t v4;
  void *v5;
  id v6;
  _TtC8AppStore35TodayCardMarketingLockupOverlayView *v7;

  v4 = OBJC_IVAR____TtC8AppStore35TodayCardMarketingLockupOverlayView_lockupView;
  v5 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC8AppStore35TodayCardMarketingLockupOverlayView_lockupView);
  v6 = a3;
  v7 = self;
  if (objc_msgSend(v5, "isUserInteractionEnabled"))
    objc_msgSend(*(id *)((char *)&self->super.super.super.super.isa + v4), "setUserInteractionEnabled:", 0);

}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  uint64_t v5;
  void *v6;
  id v7;
  _TtC8AppStore35TodayCardMarketingLockupOverlayView *v8;

  v5 = OBJC_IVAR____TtC8AppStore35TodayCardMarketingLockupOverlayView_lockupView;
  v6 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC8AppStore35TodayCardMarketingLockupOverlayView_lockupView);
  v7 = a3;
  v8 = self;
  if ((objc_msgSend(v6, "isUserInteractionEnabled") & 1) == 0)
    objc_msgSend(*(id *)((char *)&self->super.super.super.super.isa + v5), "setUserInteractionEnabled:", 1);

}

- (void)willMoveToWindow:(id)a3
{
  char *v4;
  id v5;
  char *v6;
  char *Strong;
  char *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)swift_getObjectType();
  v4 = (char *)v9.receiver;
  v5 = a3;
  -[TodayCardMarketingLockupOverlayView willMoveToWindow:](&v9, "willMoveToWindow:", v5);
  v6 = &v4[OBJC_IVAR____TtC8AppStore35TodayCardMarketingLockupOverlayView_otherOverlayToExchangeSubviewsWith];
  Strong = (char *)swift_unknownObjectWeakLoadStrong(&v4[OBJC_IVAR____TtC8AppStore35TodayCardMarketingLockupOverlayView_otherOverlayToExchangeSubviewsWith]);
  if (Strong)
  {
    v8 = Strong;
    sub_1002B5590(Strong);

    swift_unknownObjectWeakAssign(v6, 0);
  }

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  _TtC8AppStore35TodayCardMarketingLockupOverlayView *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v5 = self;
  v6 = sub_1002B57EC(width, height);
  v8 = v7;

  v9 = v6;
  v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (void)layoutSubviews
{
  _TtC8AppStore35TodayCardMarketingLockupOverlayView *v2;

  v2 = self;
  sub_1002B5954();

}

- (double)_continuousCornerRadius
{
  double result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType(self, a2);
  -[TodayCardMarketingLockupOverlayView _continuousCornerRadius](&v3, "_continuousCornerRadius");
  return result;
}

- (void)_setContinuousCornerRadius:(double)a3
{
  char *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType(self, a2);
  v4 = (char *)v5.receiver;
  -[TodayCardMarketingLockupOverlayView _setContinuousCornerRadius:](&v5, "_setContinuousCornerRadius:", a3);
  objc_msgSend(*(id *)&v4[OBJC_IVAR____TtC8AppStore35TodayCardMarketingLockupOverlayView_materialBackground], "_setCornerRadius:continuous:maskedCorners:", 1, 12, a3, v5.receiver, v5.super_class);

}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  char *v5;
  id v6;
  id v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)swift_getObjectType();
  v4 = a3;
  v5 = (char *)v8.receiver;
  -[TodayCardMarketingLockupOverlayView traitCollectionDidChange:](&v8, "traitCollectionDidChange:", v4);
  v6 = *(id *)&v5[OBJC_IVAR____TtC8AppStore35TodayCardMarketingLockupOverlayView_lockupView];
  v7 = objc_msgSend(v5, "traitCollection", v8.receiver, v8.super_class);
  sub_100160FC8(v7);

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
  _TtC8AppStore35TodayCardMarketingLockupOverlayView *v8;
  BOOL v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = sub_1002B7D58(v7);

  return v9;
}

- (void)handleTapWithGestureRecognizer:(id)a3
{
  id v4;
  void (*v5)(__n128);
  uint64_t v6;
  __n128 v7;
  _TtC8AppStore35TodayCardMarketingLockupOverlayView *v8;

  v4 = a3;
  v8 = self;
  sub_1002B4D7C(1);
  v5 = *(void (**)(__n128))((char *)&v8->super.super.super.super.isa
                                     + OBJC_IVAR____TtC8AppStore35TodayCardMarketingLockupOverlayView_clickActionHandler);
  if (v5)
  {
    v6 = *(_QWORD *)&v8->lockupView[OBJC_IVAR____TtC8AppStore35TodayCardMarketingLockupOverlayView_clickActionHandler];
    v7 = swift_retain(v6);
    v5(v7);
    sub_10003A350((uint64_t)v5, v6);
  }

}

@end
