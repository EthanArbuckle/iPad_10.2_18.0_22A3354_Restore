@implementation SUSUIRemoteScheduleUpdateContainerController

- (SUSUIRemoteScheduleUpdateContainerController)init
{
  SUSUIRemoteScheduleUpdateContainerController *v3;
  SUSUIRemoteScheduleUpdateContainerController *v4;
  id v5;
  objc_super v6;
  SEL v7;
  SUSUIRemoteScheduleUpdateContainerController *v8;

  v7 = a2;
  v8 = 0;
  v6.receiver = self;
  v6.super_class = (Class)SUSUIRemoteScheduleUpdateContainerController;
  v4 = -[SUSUIRemoteLaggardsUIHostingController init](&v6, "init");
  v8 = v4;
  objc_storeStrong((id *)&v8, v4);
  if (v4)
  {
    -[SUSUIRemoteLaggardsUIHostingController setUseNavigationController:](v8, "setUseNavigationController:", 1);
    -[SUSUIRemoteLaggardsUIHostingController setAllowCancel:](v8, "setAllowCancel:", 1);
    v5 = -[SUSUIRemoteScheduleUpdateContainerController _remoteViewControllerProxy](v8, "_remoteViewControllerProxy");
    objc_msgSend(v5, "setAllowsSiri:", 0);
    objc_storeStrong(&v5, 0);
  }
  v3 = v8;
  objc_storeStrong((id *)&v8, 0);
  return v3;
}

- (id)laggardsUIViewControllerForAction:(id)a3
{
  SUSUIScheduleUpdateViewController *v4;
  id v5;
  SUSUIScheduleUpdateViewController *v6;
  id location[2];
  SUSUIRemoteScheduleUpdateContainerController *v8;

  v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  -[SUSUIRemoteLaggardsUIHostingController setUseNavigationController:](v8, "setUseNavigationController:", 1);
  -[SUSUIRemoteLaggardsUIHostingController setAllowCancel:](v8, "setAllowCancel:", 1);
  v4 = [SUSUIScheduleUpdateViewController alloc];
  v5 = objc_msgSend(location[0], "descriptor");
  v6 = -[SUSUIScheduleUpdateViewController initWithDescriptor:](v4, "initWithDescriptor:");

  objc_storeStrong(location, 0);
  return v6;
}

@end
