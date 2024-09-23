@implementation RemoteAlertRootViewController

- (unint64_t)supportedInterfaceOrientations
{
  return 2;
}

- (int64_t)preferredInterfaceOrientationForPresentation
{
  return 1;
}

- (_TtC9AirDropUIP33_C1270FA1C3C759CC3C2C305DD7D2022129RemoteAlertRootViewController)initWithCoder:(id)a3
{
  id v5;
  _TtC9AirDropUIP33_C1270FA1C3C759CC3C2C305DD7D2022129RemoteAlertRootViewController *result;

  swift_unknownObjectWeakInit((char *)self+ OBJC_IVAR____TtC9AirDropUIP33_C1270FA1C3C759CC3C2C305DD7D2022129RemoteAlertRootViewController_remoteAlertScene, 0);
  v5 = a3;

  result = (_TtC9AirDropUIP33_C1270FA1C3C759CC3C2C305DD7D2022129RemoteAlertRootViewController *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001000F05A0, "AirDropUI/RemoteAlertSceneDelegate.swift", 40, 2, 147, 0);
  __break(1u);
  return result;
}

- (void)dismissViewControllerAnimated:(BOOL)a3 completion:(id)a4
{
  void *v6;
  uint64_t v7;
  _TtC9AirDropUIP33_C1270FA1C3C759CC3C2C305DD7D2022129RemoteAlertRootViewController *v8;

  v6 = _Block_copy(a4);
  if (v6)
  {
    v7 = swift_allocObject(&unk_100125580, 24, 7);
    *(_QWORD *)(v7 + 16) = v6;
    v6 = sub_100026FB4;
  }
  else
  {
    v7 = 0;
  }
  v8 = self;
  sub_1000269E4(a3, (uint64_t)v6, v7);
  sub_100026F80((uint64_t)v6, v7);

}

+ (BOOL)_isSecureForRemoteViewService
{
  return 1;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (int64_t)preferredStatusBarStyle
{
  return 3;
}

- (_TtC9AirDropUIP33_C1270FA1C3C759CC3C2C305DD7D2022129RemoteAlertRootViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC9AirDropUIP33_C1270FA1C3C759CC3C2C305DD7D2022129RemoteAlertRootViewController *result;

  v4 = a4;
  result = (_TtC9AirDropUIP33_C1270FA1C3C759CC3C2C305DD7D2022129RemoteAlertRootViewController *)_swift_stdlib_reportUnimplementedInitializer("AirDropUI.RemoteAlertRootViewController", 39, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy((char *)self+ OBJC_IVAR____TtC9AirDropUIP33_C1270FA1C3C759CC3C2C305DD7D2022129RemoteAlertRootViewController_remoteAlertScene, a2);
}

@end
