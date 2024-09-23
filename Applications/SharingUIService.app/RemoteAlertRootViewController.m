@implementation RemoteAlertRootViewController

- (unint64_t)supportedInterfaceOrientations
{
  return 2;
}

- (int64_t)preferredInterfaceOrientationForPresentation
{
  return 1;
}

- (_TtC16SharingUIServiceP33_65937B382845EE4CD6EFBB00702BD9F229RemoteAlertRootViewController)initWithCoder:(id)a3
{
  id v5;
  _TtC16SharingUIServiceP33_65937B382845EE4CD6EFBB00702BD9F229RemoteAlertRootViewController *result;

  swift_unknownObjectWeakInit((char *)self+ OBJC_IVAR____TtC16SharingUIServiceP33_65937B382845EE4CD6EFBB00702BD9F229RemoteAlertRootViewController_remoteAlertScene, 0);
  v5 = a3;

  result = (_TtC16SharingUIServiceP33_65937B382845EE4CD6EFBB00702BD9F229RemoteAlertRootViewController *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000100029E30, "SharingUIService/RemoteAlertSceneDelegate.swift", 47, 2, 159, 0);
  __break(1u);
  return result;
}

- (void)dismissViewControllerAnimated:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  void *v6;
  uint64_t v7;
  _QWORD *v8;
  void *v9;
  _QWORD *v10;
  _TtC16SharingUIServiceP33_65937B382845EE4CD6EFBB00702BD9F229RemoteAlertRootViewController *v11;
  uint64_t v12;
  objc_super v13;
  _QWORD aBlock[5];
  _QWORD *v15;

  v4 = a3;
  v6 = _Block_copy(a4);
  if (v6)
  {
    v7 = swift_allocObject(&unk_100035AE8, 24, 7);
    *(_QWORD *)(v7 + 16) = v6;
    v6 = sub_100015B2C;
  }
  else
  {
    v7 = 0;
  }
  v8 = (_QWORD *)swift_allocObject(&unk_100035A98, 40, 7);
  v8[2] = v6;
  v8[3] = v7;
  v8[4] = self;
  aBlock[4] = sub_100015AC4;
  v15 = v8;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1000081BC;
  aBlock[3] = &unk_100035AB0;
  v9 = _Block_copy(aBlock);
  v10 = v15;
  v11 = self;
  sub_100015AE8((uint64_t)v6, v7);
  swift_release(v10);
  v13.receiver = v11;
  v13.super_class = (Class)type metadata accessor for RemoteAlertRootViewController(0, v12);
  -[RemoteAlertRootViewController dismissViewControllerAnimated:completion:](&v13, "dismissViewControllerAnimated:completion:", v4, v9);
  _Block_release(v9);
  sub_100015AF8((uint64_t)v6, v7);

}

+ (BOOL)_isSecureForRemoteViewService
{
  return 1;
}

- (int64_t)preferredStatusBarStyle
{
  return 0;
}

- (_TtC16SharingUIServiceP33_65937B382845EE4CD6EFBB00702BD9F229RemoteAlertRootViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC16SharingUIServiceP33_65937B382845EE4CD6EFBB00702BD9F229RemoteAlertRootViewController *result;

  v4 = a4;
  result = (_TtC16SharingUIServiceP33_65937B382845EE4CD6EFBB00702BD9F229RemoteAlertRootViewController *)_swift_stdlib_reportUnimplementedInitializer("SharingUIService.RemoteAlertRootViewController", 46, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy((char *)self+ OBJC_IVAR____TtC16SharingUIServiceP33_65937B382845EE4CD6EFBB00702BD9F229RemoteAlertRootViewController_remoteAlertScene);
}

@end
