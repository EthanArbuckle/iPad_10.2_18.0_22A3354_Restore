@implementation FooterLockupView

- (_TtC8AppStore16FooterLockupView)init
{
  return (_TtC8AppStore16FooterLockupView *)sub_10020B9D4();
}

- (_TtC8AppStore16FooterLockupView)initWithCoder:(id)a3
{
  _QWORD *v4;
  id v5;
  _TtC8AppStore16FooterLockupView *result;

  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC8AppStore16FooterLockupView_lockupView) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC8AppStore16FooterLockupView_arcadeLockupView) = 0;
  v4 = (Class *)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR____TtC8AppStore16FooterLockupView_clickActionHandler);
  *v4 = 0;
  v4[1] = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC8AppStore16FooterLockupView_tapGestureRecognizer) = 0;
  v5 = a3;

  result = (_TtC8AppStore16FooterLockupView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001006A63C0, "AppStore/FooterLockupView.swift", 31, 2, 83, 0);
  __break(1u);
  return result;
}

- (void)clickActionHandlerTrampoline
{
  void (*v2)(uint64_t);
  uint64_t v3;
  uint64_t v4;
  _TtC8AppStore16FooterLockupView *v5;

  v2 = *(void (**)(uint64_t))((char *)&self->super.super.super.super.isa
                                      + OBJC_IVAR____TtC8AppStore16FooterLockupView_clickActionHandler);
  if (v2)
  {
    v3 = *(_QWORD *)&self->lockupView[OBJC_IVAR____TtC8AppStore16FooterLockupView_clickActionHandler];
    v5 = self;
    v4 = sub_10003A340((uint64_t)v2, v3);
    v2(v4);
    sub_10003A350((uint64_t)v2, v3);

  }
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v6;
  id v7;
  _TtC8AppStore16FooterLockupView *v8;
  char v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = sub_10020C9D0(v7);

  return v9 & 1;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  _TtC8AppStore16FooterLockupView *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v5 = self;
  v6 = sub_10020BFEC(width, height);
  v8 = v7;

  v9 = v6;
  v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (void)layoutSubviews
{
  uint64_t v2;
  _TtC8AppStore16FooterLockupView *v3;

  v3 = self;
  sub_10020C184((uint64_t)v3, v2);

}

- (void)traitCollectionDidChange:(id)a3
{
  char *v4;
  id v5;
  void *v6;
  id v7;
  char *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)swift_getObjectType();
  v4 = (char *)v9.receiver;
  v5 = a3;
  -[FooterLockupView traitCollectionDidChange:](&v9, "traitCollectionDidChange:", v5);
  v6 = *(void **)&v4[OBJC_IVAR____TtC8AppStore16FooterLockupView_lockupView];
  if (v6)
  {
    v7 = v6;
    v8 = (char *)objc_msgSend(v4, "traitCollection", v9.receiver, v9.super_class);
    sub_100160FC8(v8);

    v5 = v7;
    v4 = v8;
  }

}

- (_TtC8AppStore16FooterLockupView)initWithEffect:(id)a3
{
  id v3;
  _TtC8AppStore16FooterLockupView *result;

  v3 = a3;
  result = (_TtC8AppStore16FooterLockupView *)_swift_stdlib_reportUnimplementedInitializer("AppStore.FooterLockupView", 25, "init(effect:)", 13, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore16FooterLockupView_lockupView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore16FooterLockupView_arcadeLockupView));
  sub_10003A350(*(uint64_t *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC8AppStore16FooterLockupView_clickActionHandler), *(_QWORD *)&self->lockupView[OBJC_IVAR____TtC8AppStore16FooterLockupView_clickActionHandler]);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore16FooterLockupView_tapGestureRecognizer));
}

@end
