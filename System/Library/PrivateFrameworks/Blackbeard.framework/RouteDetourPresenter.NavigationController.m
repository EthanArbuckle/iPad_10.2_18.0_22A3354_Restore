@implementation RouteDetourPresenter.NavigationController

- (unint64_t)supportedInterfaceOrientations
{
  return *(unint64_t *)((char *)&self->super.super.super.super.isa
                             + OBJC_IVAR____TtCC10Blackbeard20RouteDetourPresenter20NavigationController_supportedOrientations);
}

- (void)dealloc
{
  _TtCC10Blackbeard20RouteDetourPresenter20NavigationController *v2;

  v2 = self;
  sub_2370809CC();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtCC10Blackbeard20RouteDetourPresenter20NavigationController_menuGestureRecognizer));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtCC10Blackbeard20RouteDetourPresenter20NavigationController_activityIndicatorView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtCC10Blackbeard20RouteDetourPresenter20NavigationController_blurBackgroundView));
  swift_release();
  swift_release();
  swift_release();
}

- (_TtCC10Blackbeard20RouteDetourPresenter20NavigationController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_237081B3C();
}

- (void)viewDidLoad
{
  _TtCC10Blackbeard20RouteDetourPresenter20NavigationController *v2;

  v2 = self;
  sub_237080C5C();

}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  v4 = v5.receiver;
  -[RouteDetourPresenter.NavigationController viewDidAppear:](&v5, sel_viewDidAppear_, v3);
  sub_237080F84();

}

- (_TtCC10Blackbeard20RouteDetourPresenter20NavigationController)initWithNavigationBarClass:(Class)a3 toolbarClass:(Class)a4
{
  _TtCC10Blackbeard20RouteDetourPresenter20NavigationController *result;

  result = (_TtCC10Blackbeard20RouteDetourPresenter20NavigationController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtCC10Blackbeard20RouteDetourPresenter20NavigationController)initWithRootViewController:(id)a3
{
  id v3;
  _TtCC10Blackbeard20RouteDetourPresenter20NavigationController *result;

  v3 = a3;
  result = (_TtCC10Blackbeard20RouteDetourPresenter20NavigationController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtCC10Blackbeard20RouteDetourPresenter20NavigationController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtCC10Blackbeard20RouteDetourPresenter20NavigationController *result;

  v4 = a4;
  result = (_TtCC10Blackbeard20RouteDetourPresenter20NavigationController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
