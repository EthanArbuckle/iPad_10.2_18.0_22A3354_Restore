@implementation AppDelegateService

- (AppDelegateService)init
{
  AppDelegateService *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AppDelegateService;
  v2 = -[AppDelegateService init](&v5, "init");
  if (v2)
  {
    GKUISetRemote(1);
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[GKDaemonProxy daemonProxy](GKDaemonProxy, "daemonProxy"));
    objc_msgSend(v3, "setDataUpdateDelegate:", v2);

  }
  return v2;
}

- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4
{
  return 1;
}

- (void)refreshContentsForDataType:(unsigned int)a3 userInfo:(id)a4
{
  id v4;

  if (a3 == 12)
  {
    v4 = (id)objc_claimAutoreleasedReturnValue(+[GKPreferences shared](GKPreferences, "shared", *(_QWORD *)&a3, a4));
    objc_msgSend(v4, "synchronize");

  }
}

- (void)setLocalPlayer:(id)a3
{
  id v3;
  id v4;

  if (a3)
  {
    v3 = a3;
    v4 = (id)objc_claimAutoreleasedReturnValue(+[GKLocalPlayer localPlayer](GKLocalPlayer, "localPlayer"));
    objc_msgSend(v4, "updateFromLocalPlayer:", v3);

  }
}

@end
