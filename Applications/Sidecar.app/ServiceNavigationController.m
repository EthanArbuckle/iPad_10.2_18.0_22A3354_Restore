@implementation ServiceNavigationController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (BOOL)shouldAutorotate
{
  _TtC7Sidecar27ServiceNavigationController *v2;
  char v3;

  v2 = self;
  v3 = sub_10000F560();

  return v3 & 1;
}

- (unint64_t)supportedInterfaceOrientations
{
  _TtC7Sidecar27ServiceNavigationController *v2;
  unint64_t v3;
  unint64_t v4;

  v2 = self;
  sub_10000F5E8();
  v4 = v3;

  return v4;
}

- (UIViewController)childViewControllerForStatusBarStyle
{
  _TtC7Sidecar27ServiceNavigationController *v2;
  id v3;

  v2 = self;
  v3 = sub_10000F66C();

  return (UIViewController *)v3;
}

- (_TtC7Sidecar27ServiceNavigationController)initWithNavigationBarClass:(Class)a3 toolbarClass:(Class)a4
{
  uint64_t ObjCClassMetadata;
  uint64_t v6;
  _TtC7Sidecar27ServiceNavigationController *result;

  if (!a3)
  {
    ObjCClassMetadata = 0;
    if (a4)
      goto LABEL_3;
LABEL_5:
    v6 = 0;
    goto LABEL_6;
  }
  ObjCClassMetadata = swift_getObjCClassMetadata(a3);
  if (!a4)
    goto LABEL_5;
LABEL_3:
  v6 = swift_getObjCClassMetadata(a4);
LABEL_6:
  sub_10000F690(ObjCClassMetadata, v6);
  return result;
}

- (_TtC7Sidecar27ServiceNavigationController)initWithRootViewController:(id)a3
{
  _TtC7Sidecar27ServiceNavigationController *result;

  sub_10000F760(a3, type metadata accessor for ServiceNavigationController, (SEL *)&selRef_initWithRootViewController_);
  return result;
}

- (_TtC7Sidecar27ServiceNavigationController)initWithNibName:(id)a3 bundle:(id)a4
{
  return (_TtC7Sidecar27ServiceNavigationController *)sub_10000F874((uint64_t)self, (uint64_t)a2, (uint64_t)a3, a4, (uint64_t (*)(uint64_t))type metadata accessor for ServiceNavigationController);
}

- (_TtC7Sidecar27ServiceNavigationController)initWithCoder:(id)a3
{
  return (_TtC7Sidecar27ServiceNavigationController *)sub_10000F8E4(a3, type metadata accessor for ServiceNavigationController);
}

@end
