@implementation MFNavigationController

- (BOOL)prefersStatusBarHidden
{
  return 1;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (_TtC16MagnifierSupport22MFNavigationController)initWithNavigationBarClass:(Class)a3 toolbarClass:(Class)a4
{
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for MFNavigationController();
  return -[MFNavigationController initWithNavigationBarClass:toolbarClass:](&v7, sel_initWithNavigationBarClass_toolbarClass_, a3, a4);
}

- (_TtC16MagnifierSupport22MFNavigationController)initWithRootViewController:(id)a3
{
  uint64_t v3;

  return (_TtC16MagnifierSupport22MFNavigationController *)sub_22751BDB0(self, (uint64_t)a2, (uint64_t)a3, v3, (uint64_t (*)(uint64_t))type metadata accessor for MFNavigationController, (SEL *)&selRef_initWithRootViewController_);
}

- (_TtC16MagnifierSupport22MFNavigationController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v6;
  void *v7;
  id v8;
  _TtC16MagnifierSupport22MFNavigationController *v9;
  objc_super v11;

  if (a3)
  {
    sub_22758E1E4();
    v6 = a4;
    v7 = (void *)sub_22758E1B4();
    swift_bridgeObjectRelease();
  }
  else
  {
    v8 = a4;
    v7 = 0;
  }
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for MFNavigationController();
  v9 = -[MFNavigationController initWithNibName:bundle:](&v11, sel_initWithNibName_bundle_, v7, a4);

  return v9;
}

- (_TtC16MagnifierSupport22MFNavigationController)initWithCoder:(id)a3
{
  uint64_t v3;

  return (_TtC16MagnifierSupport22MFNavigationController *)sub_22751BE80(self, (uint64_t)a2, (uint64_t)a3, v3, (uint64_t (*)(uint64_t))type metadata accessor for MFNavigationController);
}

@end
