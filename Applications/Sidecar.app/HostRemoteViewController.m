@implementation HostRemoteViewController

- (void)viewServiceDidTerminateWithError:(id)a3
{
  HostRemoteViewController *v4;
  id v5;

  v4 = self;
  v5 = a3;
  sub_1000063C8();

}

+ (id)exportedInterface
{
  return sub_1000064A0(&protocolRef_SidecarServiceHostInterface);
}

+ (id)serviceViewControllerInterface
{
  return sub_1000064A0(&protocolRef_SidecarServiceServiceInterface);
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (HostRemoteViewController)initWithNibName:(id)a3 bundle:(id)a4
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
  return (HostRemoteViewController *)sub_100006500(v5, v7, a4);
}

- (HostRemoteViewController)initWithCoder:(id)a3
{
  return (HostRemoteViewController *)sub_1000065F0(a3);
}

- (void).cxx_destruct
{
  swift_weakDestroy(&self->_UIRemoteViewController_opaque[OBJC_IVAR___HostRemoteViewController_serviceExtension], a2);
}

- (void)sidecarServiceViewControllerAnimate:(int64_t)a3 completion:(id)a4
{
  void *v6;
  HostRemoteViewController *v7;

  v6 = _Block_copy(a4);
  _Block_copy(v6);
  v7 = self;
  sub_1000066CC(a3, (uint64_t)v7, (void (**)(_QWORD))v6);
  _Block_release(v6);

}

- (void)sidecarServiceViewControllerWantsVolumeButtonEvents:(BOOL)a3
{
  HostRemoteViewController *v4;

  v4 = self;
  sub_1000067F0(a3);

}

- (void)sidecarServiceViewControllerBackgroundStyle:(int64_t)a3
{
  HostRemoteViewController *v4;

  v4 = self;
  sub_1000068A8(a3);

}

- (void)sidecarServiceOrientationChanged
{
  HostRemoteViewController *v2;

  v2 = self;
  sub_10000695C();

}

- (void)sidecarServiceDisableDisplaySleep:(BOOL)a3
{
  HostRemoteViewController *v4;

  v4 = self;
  sub_100006A04(a3);

}

@end
