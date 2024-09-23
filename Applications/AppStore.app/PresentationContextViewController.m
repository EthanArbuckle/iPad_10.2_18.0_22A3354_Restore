@implementation PresentationContextViewController

- (_TtC8AppStore33PresentationContextViewController)initWithCoder:(id)a3
{
  char *v4;
  _QWORD *v5;
  id v6;
  _TtC8AppStore33PresentationContextViewController *result;

  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC8AppStore33PresentationContextViewController_contextViewController) = 0;
  *((_BYTE *)&self->super.super.super.isa
  + OBJC_IVAR____TtC8AppStore33PresentationContextViewController_hasPresentedViewController) = 0;
  v4 = (char *)self + OBJC_IVAR____TtC8AppStore33PresentationContextViewController_flowController;
  *(_OWORD *)v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *((_QWORD *)v4 + 4) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC8AppStore33PresentationContextViewController_actionRunner) = 0;
  v5 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC8AppStore33PresentationContextViewController_dismissOverride);
  *v5 = 0;
  v5[1] = 0;
  v6 = a3;

  result = (_TtC8AppStore33PresentationContextViewController *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001006A63C0, "AppStore/PresentationContextViewController.swift", 48, 2, 73, 0);
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  _TtC8AppStore33PresentationContextViewController *v2;

  v2 = self;
  sub_10009F990();

}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  id v5;
  id v6;
  objc_super v7;

  v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for PresentationContextViewController();
  v4 = v7.receiver;
  -[PresentationContextViewController viewWillAppear:](&v7, "viewWillAppear:", v3);
  v5 = objc_msgSend(v4, "presentationController", v7.receiver, v7.super_class);
  if (v5)
  {
    v6 = v5;
    objc_msgSend(v5, "_setContainerIgnoresDirectTouchEvents:", 1);

    v4 = v6;
  }

}

- (void)viewDidAppear:(BOOL)a3
{
  _TtC8AppStore33PresentationContextViewController *v4;

  v4 = self;
  sub_10009FB30(a3);

}

- (void)dismissViewControllerWithTransition:(int)a3 completion:(id)a4
{
  uint64_t v4;
  void *v6;
  uint64_t v7;
  _TtC8AppStore33PresentationContextViewController *v8;

  v4 = *(_QWORD *)&a3;
  v6 = _Block_copy(a4);
  if (v6)
  {
    v7 = swift_allocObject(&unk_100757BB8, 24, 7);
    *(_QWORD *)(v7 + 16) = v6;
    v6 = sub_1000A01A4;
  }
  else
  {
    v7 = 0;
  }
  v8 = self;
  sub_10009FDC8(v4, (uint64_t)v6, v7);
  sub_10003A350((uint64_t)v6, v7);

}

- (_TtC8AppStore33PresentationContextViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC8AppStore33PresentationContextViewController *result;

  v4 = a4;
  result = (_TtC8AppStore33PresentationContextViewController *)_swift_stdlib_reportUnimplementedInitializer("AppStore.PresentationContextViewController", 42, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore33PresentationContextViewController_contextViewController));
  sub_1000A01F0((uint64_t)self + OBJC_IVAR____TtC8AppStore33PresentationContextViewController_flowController);
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC8AppStore33PresentationContextViewController_actionRunner));
  sub_10003A350(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC8AppStore33PresentationContextViewController_dismissOverride), *(_QWORD *)&self->contextViewController[OBJC_IVAR____TtC8AppStore33PresentationContextViewController_dismissOverride]);
}

@end
