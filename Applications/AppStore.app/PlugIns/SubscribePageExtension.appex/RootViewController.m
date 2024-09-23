@implementation RootViewController

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  objc_super v8;

  v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)swift_getObjectType();
  v4 = (char *)v8.receiver;
  -[RootViewController viewWillAppear:](&v8, "viewWillAppear:", v3);
  v5 = *(_QWORD *)&v4[OBJC_IVAR____TtC22SubscribePageExtension18RootViewController_childViewController];
  if (v5)
  {
    v6 = objc_opt_self(UINavigationController);
    v7 = (void *)swift_dynamicCastObjCClass(v5, v6);
    if (v7)
      objc_msgSend(v7, "setNavigationBarHidden:", 1, v8.receiver, v8.super_class);
  }

}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  objc_class *ObjectType;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  _TtC22SubscribePageExtension18RootViewController *v10;
  uint64_t v11;
  _BOOL8 v12;
  _TtC22SubscribePageExtension18RootViewController *v13;
  objc_super v14;

  v3 = a3;
  ObjectType = (objc_class *)swift_getObjectType();
  v6 = type metadata accessor for BootstrapPhase(0);
  v7 = *(_QWORD *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14.receiver = self;
  v14.super_class = ObjectType;
  v10 = self;
  -[RootViewController viewDidAppear:](&v14, "viewDidAppear:", v3);
  v11 = swift_allocObject(&unk_1007454D8, 24, 7);
  *(_QWORD *)(v11 + 16) = v10;
  (*(void (**)(char *, _QWORD, uint64_t))(v7 + 104))(v9, enum case for BootstrapPhase.initialBootstrap(_:), v6);
  v12 = *(Class *)((char *)&v10->super.super.super.isa
                 + OBJC_IVAR____TtC22SubscribePageExtension18RootViewController_flowController) != 0;
  v13 = v10;
  BootstrapPendingClosuresHandler.performClosure(after:priority:canPerformImmediately:closure:)(v9, 0, v12, sub_1004CEF88, v11);
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);

  swift_release(v11);
}

- (id)presentationControllerForPresentedViewController:(id)a3 presentingViewController:(id)a4 sourceViewController:(id)a5
{
  return objc_msgSend(objc_allocWithZone((Class)type metadata accessor for SubscribePagePresentationController()), "initWithPresentedViewController:presentingViewController:", a3, a4);
}

- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5
{
  id v9;
  id v10;
  id v11;
  id v12;
  _TtC22SubscribePageExtension18RootViewController *v13;
  id v14;

  v9 = objc_allocWithZone((Class)type metadata accessor for FadeInPresentationAnimator());
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = self;
  v14 = objc_msgSend(v9, "init");

  return v14;
}

- (id)animationControllerForDismissedController:(id)a3
{
  id v5;
  id v6;
  _TtC22SubscribePageExtension18RootViewController *v7;
  id v8;

  v5 = objc_allocWithZone((Class)type metadata accessor for FadeOutDismissalAnimator());
  v6 = a3;
  v7 = self;
  v8 = objc_msgSend(v5, "init");

  return v8;
}

- (_TtC22SubscribePageExtension18RootViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  if (a3)
  {
    v5 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v7 = v6;
  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  v8 = a4;
  return (_TtC22SubscribePageExtension18RootViewController *)sub_1004CEC40(v5, v7, a4);
}

- (_TtC22SubscribePageExtension18RootViewController)initWithCoder:(id)a3
{
  return (_TtC22SubscribePageExtension18RootViewController *)sub_1004CEDB4(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension18RootViewController_childViewController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension18RootViewController_flowController));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC22SubscribePageExtension18RootViewController_objectGraph));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC22SubscribePageExtension18RootViewController_bootstrapPendingClosuresHandler));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC22SubscribePageExtension18RootViewController_actionRunner));
  sub_100019310(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC22SubscribePageExtension18RootViewController_dismissalCompletionHandler), *(_QWORD *)&self->childViewController[OBJC_IVAR____TtC22SubscribePageExtension18RootViewController_dismissalCompletionHandler]);
}

@end
