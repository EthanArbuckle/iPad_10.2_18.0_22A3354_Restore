@implementation AXRNearbyDevicesViewController

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)AXRNearbyDevicesViewController;
  -[AXRNearbyDevicesViewController viewDidLoad](&v8, sel_viewDidLoad);
  objc_msgSend(MEMORY[0x24BDFF738], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXRNearbyDevicesViewController setDiscoveryManager:](self, "setDiscoveryManager:", v3);

  -[AXRNearbyDevicesViewController discoveryManager](self, "discoveryManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:", self);

  -[AXRNearbyDevicesViewController discoveryManager](self, "discoveryManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cachedDiscoveredDevices");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXRNearbyDevicesViewController setDiscoveredDevices:](self, "setDiscoveredDevices:", v6);

  -[AXRNearbyDevicesViewController tableView](self, "tableView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("NearbyDeviceCell"));

}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AXRNearbyDevicesViewController;
  -[AXRNearbyDevicesViewController viewDidAppear:](&v3, sel_viewDidAppear_, a3);
}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AXRNearbyDevicesViewController;
  -[AXRNearbyDevicesViewController viewDidDisappear:](&v3, sel_viewDidDisappear_, a3);
}

- (void)_connectToDevice:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __51__AXRNearbyDevicesViewController__connectToDevice___block_invoke;
  v6[3] = &unk_24F4F6BA8;
  objc_copyWeak(&v8, &location);
  v5 = v4;
  v7 = v5;
  objc_msgSend(v5, "connectIfNecessary:", v6);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);

}

void __51__AXRNearbyDevicesViewController__connectToDevice___block_invoke(uint64_t a1, int a2)
{
  id WeakRetained;
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (a2)
    objc_msgSend(WeakRetained, "_showActiveDeviceConnectionAlertWithDevice:", *(_QWORD *)(a1 + 32));
  else
    objc_msgSend(WeakRetained, "_showFailedToConnectAlert");

}

- (void)_showActiveDeviceConnectionAlertWithDevice:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  AXRConnectedDeviceViewController *v8;

  v4 = a3;
  v8 = -[AXRConnectedDeviceViewController initWithRemoteDevice:]([AXRConnectedDeviceViewController alloc], "initWithRemoteDevice:", v4);

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6860]), "initWithBarButtonSystemItem:target:action:", 24, self, sel__dismissPresentedViewController);
  -[AXRConnectedDeviceViewController navigationItem](v8, "navigationItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setRightBarButtonItem:", v5);

  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6BF8]), "initWithRootViewController:", v8);
  -[AXRNearbyDevicesViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v7, 1, &__block_literal_global);

}

- (void)_dismissPresentedViewController
{
  id v2;

  -[AXRNearbyDevicesViewController presentedViewController](self, "presentedViewController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (void)_showFailedToConnectAlert
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = (void *)MEMORY[0x24BDF67F0];
  AXRLocalizedStringForKey();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "alertControllerWithTitle:message:preferredStyle:", v4, 0, 0);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  v5 = (void *)MEMORY[0x24BDF67E8];
  AXRLocalizedStringForKey();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "actionWithTitle:style:handler:", v6, 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addAction:", v7);

  -[AXRNearbyDevicesViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v8, 1, 0);
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)deviceDiscoveryManager:(id)a3 updatedDevices:(id)a4
{
  id v5;

  -[AXRNearbyDevicesViewController setDiscoveredDevices:](self, "setDiscoveredDevices:", a4);
  -[AXRNearbyDevicesViewController tableView](self, "tableView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "reloadData");

}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v5;
  uint64_t v6;
  void *v7;
  int64_t v8;

  -[AXRNearbyDevicesViewController discoveredDevices](self, "discoveredDevices", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (!v6)
    return 1;
  -[AXRNearbyDevicesViewController discoveredDevices](self, "discoveredDevices");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  return v8;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  unint64_t v10;
  void *v11;
  unint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  v6 = a4;
  objc_msgSend(a3, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("NearbyDeviceCell"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setHidden:", 0);
  -[AXRNearbyDevicesViewController discoveredDevices](self, "discoveredDevices");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (v9)
  {
    v10 = objc_msgSend(v6, "item");
    -[AXRNearbyDevicesViewController discoveredDevices](self, "discoveredDevices");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "count");

    if (v10 >= v12)
    {
      objc_msgSend(v7, "textLabel");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setText:", 0);

      objc_msgSend(v7, "setHidden:", 1);
    }
    else
    {
      -[AXRNearbyDevicesViewController discoveredDevices](self, "discoveredDevices");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "objectAtIndexedSubscript:", objc_msgSend(v6, "item"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v14, "displayName");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "textLabel");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setText:", v15);

    }
  }
  else
  {
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF67D0]), "initWithActivityIndicatorStyle:", 100);
    objc_msgSend(v17, "startAnimating");
    objc_msgSend(v7, "setAccessoryView:", v17);
    AXRLocalizedStringForKey();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "textLabel");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setText:", v18);

  }
  return v7;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  return (id)AXRLocalizedStringForKey();
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  unint64_t v7;
  void *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v6 = a4;
  v7 = objc_msgSend(v6, "row");
  -[AXRNearbyDevicesViewController discoveredDevices](self, "discoveredDevices");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (v7 < v9)
  {
    -[AXRNearbyDevicesViewController discoveredDevices](self, "discoveredDevices");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectAtIndexedSubscript:", objc_msgSend(v6, "row"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[AXRNearbyDevicesViewController _connectToDevice:](self, "_connectToDevice:", v11);
  }
  objc_msgSend(v12, "deselectRowAtIndexPath:animated:", v6, 1);

}

- (AXRDeviceDiscoveryManager)discoveryManager
{
  return self->_discoveryManager;
}

- (void)setDiscoveryManager:(id)a3
{
  objc_storeStrong((id *)&self->_discoveryManager, a3);
}

- (NSArray)discoveredDevices
{
  return self->_discoveredDevices;
}

- (void)setDiscoveredDevices:(id)a3
{
  objc_storeStrong((id *)&self->_discoveredDevices, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_discoveredDevices, 0);
  objc_storeStrong((id *)&self->_discoveryManager, 0);
}

@end
