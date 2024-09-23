@implementation HUDashboardPresentationManager

- (void)navigationController:(id)a3 willPushItem:(id)a4
{
  id v6;
  id v7;
  HUDashboardPresentationManager *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_1B8E65120(v6, v7);

}

+ (HUDashboardPresentationManager)sharedManager
{
  if (qword_1ED57E840 != -1)
    swift_once();
  return (HUDashboardPresentationManager *)(id)qword_1ED57E760;
}

- (void)navigationController:(id)a3 didPushItem:(id)a4
{
  id v6;
  id v7;
  HUDashboardPresentationManager *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_1B8E65330(v6, v7);

}

- (HUDashboardPresentationManager)init
{
  char *v3;
  objc_class *v4;
  objc_super v6;

  v3 = (char *)self + OBJC_IVAR___HUDashboardPresentationManager_delegate;
  v4 = (objc_class *)type metadata accessor for DashboardPresentationManager();
  *(_OWORD *)v3 = 0u;
  *((_OWORD *)v3 + 1) = 0u;
  *((_QWORD *)v3 + 4) = 0;
  v6.receiver = self;
  v6.super_class = v4;
  return -[HUDashboardPresentationManager init](&v6, sel_init);
}

- (void)navigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5
{
  UINavigationController *v8;
  UIViewController *v9;
  HUDashboardPresentationManager *v10;

  v8 = (UINavigationController *)a3;
  v9 = (UIViewController *)a4;
  v10 = self;
  DashboardPresentationManager.navigationController(_:willShow:animated:)(v8, v9, a5);

}

- (void)navigationController:(id)a3 didUpdatePreferredPaletteHeight:(double)a4
{
  id v6;
  HUDashboardPresentationManager *v7;

  v6 = a3;
  v7 = self;
  sub_1B8E6EE74(v6, a4);

}

- (void)navigationController:(id)a3 willPresent:(id)a4 animated:(BOOL)a5
{
  id v8;
  id v9;
  HUDashboardPresentationManager *v10;

  v8 = a3;
  v9 = a4;
  v10 = self;
  sub_1B9007260((uint64_t)v8, (uint64_t)v9, a5);

}

- (void).cxx_destruct
{
  sub_1B9007804((uint64_t)self + OBJC_IVAR___HUDashboardPresentationManager_delegate);
}

- (id)navigationController:(id)a3 animationControllerForOperation:(int64_t)a4 fromViewController:(id)a5 toViewController:(id)a6
{
  id v10;
  id v11;
  id v12;
  HUDashboardPresentationManager *v13;
  id v14;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  v13 = self;
  v14 = _s6HomeUI28DashboardPresentationManagerC20navigationController_09animationG3For4from2toSo06UIViewG21AnimatedTransitioning_pSgSo012UINavigationG0C_So0oG9OperationVSo0lG0CAOtF_0(v10, a4, v11, v12);

  return v14;
}

- (BOOL)_navigationControllerShouldUseBuiltinInteractionController:(id)a3
{
  return 1;
}

@end
