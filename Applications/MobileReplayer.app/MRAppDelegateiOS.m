@implementation MRAppDelegateiOS

- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  CGColorSpace *DeviceRGB;
  CGColor *v11;
  id v12;
  id v13;
  void *v14;
  UIWindow *v15;
  void *v16;
  _OWORD v18[2];
  _BYTE v19[40];

  v5 = a3;
  sub_100004098((uint64_t)v19, 1, 1);
  v6 = objc_alloc((Class)UIWindow);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v7, "bounds");
  v8 = objc_msgSend(v6, "initWithFrame:");
  v9 = *(void **)(&self->super._shouldCreateViewController + 1);
  *(_QWORD *)(&self->super._shouldCreateViewController + 1) = v8;

  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  v18[0] = xmmword_100005EF0;
  v18[1] = unk_100005F00;
  v11 = CGColorCreate(DeviceRGB, (const CGFloat *)v18);
  v12 = objc_alloc((Class)UIView);
  objc_msgSend(*(id *)(&self->super._shouldCreateViewController + 1), "bounds");
  v13 = objc_msgSend(v12, "initWithFrame:");
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "layer"));
  objc_msgSend(v14, "setBackgroundColor:", v11);

  CGColorRelease(v11);
  CGColorSpaceRelease(DeviceRGB);
  objc_msgSend(v5, "setIdleTimerDisabled:", 1);
  objc_msgSend(v5, "setIdleTimerDisabled:", 1);
  v15 = (UIWindow *)objc_alloc_init((Class)UIViewController);
  v16 = *(UIWindow **)((char *)&self->_window + 1);
  *(UIWindow **)((char *)&self->_window + 1) = v15;

  objc_msgSend(*(id *)((char *)&self->_window + 1), "setView:", v13);
  objc_msgSend(*(id *)(&self->super._shouldCreateViewController + 1), "setRootViewController:", *(UIWindow **)((char *)&self->_window + 1));
  objc_msgSend(*(id *)(&self->super._shouldCreateViewController + 1), "makeKeyAndVisible");

  sub_100004160((uint64_t)v19);
  -[MRAppDelegate startupAndCreateViewController:](self, "startupAndCreateViewController:", 1);

  return 1;
}

- (void)applicationWillTerminate:(id)a3
{
  -[MRAppDelegate shutdown](self, "shutdown", a3);
}

- (void)setViewController:(id)a3
{
  id v4;
  _BYTE v5[40];

  v4 = a3;
  sub_100004098((uint64_t)v5, 1, 1);
  if (v4)
    objc_msgSend(*(id *)(&self->super._shouldCreateViewController + 1), "setRootViewController:", v4);
  else
    objc_msgSend(*(id *)(&self->super._shouldCreateViewController + 1), "setRootViewController:", *(UIWindow **)((char *)&self->_window + 1));
  sub_100004160((uint64_t)v5);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)((char *)&self->_window + 1), 0);
  objc_storeStrong((id *)(&self->super._shouldCreateViewController + 1), 0);
}

@end
