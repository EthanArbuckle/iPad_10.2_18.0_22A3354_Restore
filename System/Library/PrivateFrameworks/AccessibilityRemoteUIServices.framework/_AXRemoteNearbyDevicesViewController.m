@implementation _AXRemoteNearbyDevicesViewController

+ (id)presentNearbyDevicesViewControllerWithConnectionHandler:(id)a3 dismissalHandler:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  _QWORD v12[4];
  id v13;
  id v14;

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_opt_class();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __113___AXRemoteNearbyDevicesViewController_presentNearbyDevicesViewControllerWithConnectionHandler_dismissalHandler___block_invoke;
  v12[3] = &unk_24F4F6B80;
  v13 = v6;
  v14 = v5;
  v8 = v5;
  v9 = v6;
  objc_msgSend(v7, "requestViewController:fromServiceWithBundleIdentifier:connectionHandler:", CFSTR("NearbyDevicesRemoteViewController"), CFSTR("com.apple.AXRemoteViewService"), v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)exportedInterface
{
  return (id)objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_255B56140);
}

+ (id)serviceViewControllerInterface
{
  return (id)objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_255B67050);
}

- (void)viewServiceDidTerminateWithError:(id)a3
{
  id v4;
  void *v5;
  void (**v6)(_QWORD, _QWORD);
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)_AXRemoteNearbyDevicesViewController;
  -[_UIRemoteViewController viewServiceDidTerminateWithError:](&v7, sel_viewServiceDidTerminateWithError_, v4);
  -[_AXRemoteNearbyDevicesViewController dismissHandler](self, "dismissHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[_AXRemoteNearbyDevicesViewController dismissHandler](self, "dismissHandler");
    v6 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id))v6)[2](v6, v4);

  }
}

- (id)dismissHandler
{
  return self->_dismissHandler;
}

- (void)setDismissHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1472);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_dismissHandler, 0);
}

@end
