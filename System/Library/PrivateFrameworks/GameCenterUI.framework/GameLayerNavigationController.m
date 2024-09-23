@implementation GameLayerNavigationController

- (_TtC12GameCenterUI29GameLayerNavigationController)initWithRootViewController:(id)a3
{
  return (_TtC12GameCenterUI29GameLayerNavigationController *)GameLayerNavigationController.init(rootViewController:)(a3);
}

- (_TtC12GameCenterUI29GameLayerNavigationController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1AB52C0F8();
}

- (CGSize)preferredContentSize
{
  _TtC12GameCenterUI29GameLayerNavigationController *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  CGSize result;

  v2 = self;
  sub_1AB52C1C8((uint64_t)v2);
  v4 = v3;

  v5 = 0.0;
  v6 = v4;
  result.height = v5;
  result.width = v6;
  return result;
}

- (void)viewDidLoad
{
  _TtC12GameCenterUI29GameLayerNavigationController *v2;

  v2 = self;
  sub_1AB52C564();

}

- (void)viewDidAppear:(BOOL)a3
{
  _TtC12GameCenterUI29GameLayerNavigationController *v4;

  v4 = self;
  sub_1AB52C628(a3);

}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (void)navigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5
{
  id v7;
  id v8;
  _TtC12GameCenterUI29GameLayerNavigationController *v9;

  v7 = a3;
  v8 = a4;
  v9 = self;
  sub_1AB52C6A8();

}

- (id)presentationControllerForPresentedViewController:(id)a3 presentingViewController:(id)a4 sourceViewController:(id)a5
{
  id v8;
  id v9;
  id v10;
  _TtC12GameCenterUI29GameLayerNavigationController *v11;
  uint64_t v12;
  void *v13;
  void *v14;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  sub_1AB52C94C(v8, v12, v10);
  v14 = v13;

  return v14;
}

- (BOOL)_requiresCustomPresentationController
{
  return 1;
}

- (void)didTapDone
{
  _TtC12GameCenterUI29GameLayerNavigationController *v2;

  v2 = self;
  sub_1AB52CAA8();

}

- (_TtC12GameCenterUI29GameLayerNavigationController)initWithNavigationBarClass:(Class)a3 toolbarClass:(Class)a4
{
  GameLayerNavigationController.init(navigationBarClass:toolbarClass:)();
}

- (_TtC12GameCenterUI29GameLayerNavigationController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v5;

  if (a3)
    sub_1AB7DAF90();
  v5 = a4;
  GameLayerNavigationController.init(nibName:bundle:)();
}

- (void).cxx_destruct
{
  sub_1AB46A9C4(*(uint64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR____TtC12GameCenterUI29GameLayerNavigationController_doneHandler));
}

@end
