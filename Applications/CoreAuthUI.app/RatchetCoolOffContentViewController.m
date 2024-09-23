@implementation RatchetCoolOffContentViewController

- (_TtC10CoreAuthUI35RatchetCoolOffContentViewController)initWithCoder:(id)a3
{
  id v4;
  objc_class *v5;
  _TtC10CoreAuthUI35RatchetCoolOffContentViewController *result;

  v4 = a3;
  if (((unint64_t)&_swiftEmptyArrayStorage & 0xC000000000000000) != 0
    && _CocoaArrayWrapper.endIndex.getter(&_swiftEmptyArrayStorage))
  {
    v5 = (objc_class *)sub_10002FBA8((uint64_t)&_swiftEmptyArrayStorage);
  }
  else
  {
    v5 = (objc_class *)&_swiftEmptySetSingleton;
  }
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC10CoreAuthUI35RatchetCoolOffContentViewController_cancellables) = v5;

  result = (_TtC10CoreAuthUI35RatchetCoolOffContentViewController *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0x6C706D6920746F4ELL, 0xEF6465746E656D65, "CoreAuthUI/RatchetCoolOffContentViewController.swift", 52, 2, 22, 0);
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  id v2;
  id v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType(self);
  v2 = v5.receiver;
  -[RatchetCoolOffContentViewController viewDidLoad](&v5, "viewDidLoad");
  v3 = objc_msgSend(v2, "interactivePopGestureRecognizer", v5.receiver, v5.super_class);
  if (v3)
  {
    v4 = v3;
    objc_msgSend(v3, "setEnabled:", 0);

  }
  objc_msgSend(v2, "setNavigationBarHidden:animated:", 1, 0);
  sub_10002EBD4();

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (_TtC10CoreAuthUI35RatchetCoolOffContentViewController)initWithNavigationBarClass:(Class)a3 toolbarClass:(Class)a4
{
  _TtC10CoreAuthUI35RatchetCoolOffContentViewController *result;

  result = (_TtC10CoreAuthUI35RatchetCoolOffContentViewController *)_swift_stdlib_reportUnimplementedInitializer("CoreAuthUI.RatchetCoolOffContentViewController", 46, "init(navigationBarClass:toolbarClass:)", 38, 0);
  __break(1u);
  return result;
}

- (_TtC10CoreAuthUI35RatchetCoolOffContentViewController)initWithRootViewController:(id)a3
{
  id v3;
  _TtC10CoreAuthUI35RatchetCoolOffContentViewController *result;

  v3 = a3;
  result = (_TtC10CoreAuthUI35RatchetCoolOffContentViewController *)_swift_stdlib_reportUnimplementedInitializer("CoreAuthUI.RatchetCoolOffContentViewController", 46, "init(rootViewController:)", 25, 0);
  __break(1u);
  return result;
}

- (_TtC10CoreAuthUI35RatchetCoolOffContentViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC10CoreAuthUI35RatchetCoolOffContentViewController *result;

  v4 = a4;
  result = (_TtC10CoreAuthUI35RatchetCoolOffContentViewController *)_swift_stdlib_reportUnimplementedInitializer("CoreAuthUI.RatchetCoolOffContentViewController", 46, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.super.super.super.isa
                                      + OBJC_IVAR____TtC10CoreAuthUI35RatchetCoolOffContentViewController_viewModel));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.isa
                                     + OBJC_IVAR____TtC10CoreAuthUI35RatchetCoolOffContentViewController_cancellables));
}

- (void)didMoveToParent:(id)a3
{
  -[RatchetCoolOffContentViewController didMoveToParentViewController:](self, "didMoveToParentViewController:", a3);
}

- (void)willMoveToParent:(id)a3
{
  id v4;
  _TtC10CoreAuthUI35RatchetCoolOffContentViewController *v5;

  v4 = a3;
  v5 = self;
  objc_msgSend(v4, "addChildViewController:", v5);
  -[RatchetCoolOffContentViewController willMoveToParentViewController:](v5, "willMoveToParentViewController:", v4);

}

- (void)setCoolOffDuration:(double)a3
{
  uint64_t v5;
  uint64_t ObjectType;
  void (*v7)(uint64_t, uint64_t, double);
  _TtC10CoreAuthUI35RatchetCoolOffContentViewController *v8;

  v5 = *(_QWORD *)&self->viewModel[OBJC_IVAR____TtC10CoreAuthUI35RatchetCoolOffContentViewController_viewModel];
  ObjectType = swift_getObjectType(*(Class *)((char *)&self->super.super.super.super.isa
                                            + OBJC_IVAR____TtC10CoreAuthUI35RatchetCoolOffContentViewController_viewModel));
  v7 = *(void (**)(uint64_t, uint64_t, double))(v5 + 24);
  v8 = self;
  v7(ObjectType, v5, a3);

}

@end
