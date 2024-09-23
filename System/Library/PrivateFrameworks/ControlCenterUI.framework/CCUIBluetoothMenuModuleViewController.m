@implementation CCUIBluetoothMenuModuleViewController

- (CCUIBluetoothMenuModuleViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  CCUIBluetoothMenuModuleViewController *v4;
  CCUIBluetoothMenuModuleViewController *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSMutableSet *v11;
  NSMutableSet *busyIdentifiers;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)CCUIBluetoothMenuModuleViewController;
  v4 = -[CCUIAlwaysExpandedMenuModuleViewController initWithNibName:bundle:](&v14, sel_initWithNibName_bundle_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[CCUIButtonModuleViewController setExpanded:](v4, "setExpanded:", 1);
    -[CCUIMenuModuleViewController setMinimumMenuItems:](v5, "setMinimumMenuItems:", 6);
    -[CCUIMenuModuleViewController setShouldProvideOwnPlatter:](v5, "setShouldProvideOwnPlatter:", 1);
    -[CCUIMenuModuleViewController setIndentation:](v5, "setIndentation:", 1);
    -[CCUIMenuModuleViewController setUseTrailingInset:](v5, "setUseTrailingInset:", 1);
    -[CCUIMenuModuleViewController setVisibleMenuItems:](v5, "setVisibleMenuItems:", 5.5);
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("CONTROL_CENTER_STATUS_BLUETOOTH_NAME"), &stru_1E8D00320, CFSTR("ControlCenterUI+SystemModules"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CCUIMenuModuleViewController setTitle:](v5, "setTitle:", v7);

    v8 = (void *)MEMORY[0x1E0D14768];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "descriptionForPackageNamed:inBundle:", CFSTR("Bluetooth"), v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[CCUIMenuModuleViewController setGlyphPackageDescription:](v5, "setGlyphPackageDescription:", v10);
    -[CCUIButtonModuleViewController setGlyphState:](v5, "setGlyphState:", CFSTR("associated"));
    v11 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    busyIdentifiers = v5->_busyIdentifiers;
    v5->_busyIdentifiers = v11;

  }
  return v5;
}

- (void)viewDidLoad
{
  _QWORD v3[5];
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CCUIBluetoothMenuModuleViewController;
  -[CCUIMenuModuleViewController viewDidLoad](&v4, sel_viewDidLoad);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __52__CCUIBluetoothMenuModuleViewController_viewDidLoad__block_invoke;
  v3[3] = &unk_1E8CFC3D0;
  v3[4] = self;
  objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v3);
}

void __52__CCUIBluetoothMenuModuleViewController_viewDidLoad__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  id location;

  objc_initWeak(&location, *(id *)(a1 + 32));
  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("CONTROL_CENTER_STATUS_BLUETOOTH_SETTINGS"), &stru_1E8D00320, CFSTR("ControlCenterUI+SystemModules"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __52__CCUIBluetoothMenuModuleViewController_viewDidLoad__block_invoke_2;
  v5[3] = &unk_1E8CFCA68;
  objc_copyWeak(&v6, &location);
  objc_msgSend(v2, "setFooterButtonTitle:handler:", v4, v5);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

uint64_t __52__CCUIBluetoothMenuModuleViewController_viewDidLoad__block_invoke_2(uint64_t a1)
{
  void *v2;
  id WeakRetained;
  void *v4;

  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("prefs:root=Bluetooth"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "contentModuleContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "openURL:completionHandler:", v2, 0);

  return 0;
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CCUIBluetoothMenuModuleViewController;
  -[CCUIAlwaysExpandedMenuModuleViewController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[CCUIBluetoothMenuModuleViewController _startScanning](self, "_startScanning");
}

- (void)viewWillDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CCUIBluetoothMenuModuleViewController;
  -[CCUIAlwaysExpandedMenuModuleViewController viewWillDisappear:](&v4, sel_viewWillDisappear_, a3);
  -[CCUIBluetoothMenuModuleViewController _stopScanning](self, "_stopScanning");
}

- (void)_startScanning
{
  id v3;
  void *v4;
  CBCentralManager *v5;
  CBCentralManager *centralManager;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[5];
  uint64_t v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0C97728]);
  v14 = *MEMORY[0x1E0C97648];
  v15[0] = MEMORY[0x1E0C9AAA0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (CBCentralManager *)objc_msgSend(v3, "initWithDelegate:queue:options:", self, 0, v4);
  centralManager = self->_centralManager;
  self->_centralManager = v5;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObserver:selector:name:object:", self, sel__bluetoothDeviceConnectionStatusDidChange_, *MEMORY[0x1E0D033B0], 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObserver:selector:name:object:", self, sel__bluetoothDeviceConnectionStatusDidChange_, *MEMORY[0x1E0D033A8], 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObserver:selector:name:object:", self, sel__bluetoothDeviceConnectionStatusDidChange_, *MEMORY[0x1E0D033C0], 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObserver:selector:name:object:", self, sel__bluetoothDeviceConnectionStatusDidChange_, *MEMORY[0x1E0D033B8], 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addObserver:selector:name:object:", self, sel__bluetoothAvailabilityChanged_, *MEMORY[0x1E0D03390], 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addObserver:selector:name:object:", self, sel__bluetoothDeviceRemoved_, *MEMORY[0x1E0D033C8], 0);

  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __55__CCUIBluetoothMenuModuleViewController__startScanning__block_invoke;
  v13[3] = &unk_1E8CFC3D0;
  v13[4] = self;
  objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v13);
}

uint64_t __55__CCUIBluetoothMenuModuleViewController__startScanning__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateBluetoothMenuItems");
}

- (void)_stopScanning
{
  CBCentralManager *centralManager;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  -[CBCentralManager setDelegate:](self->_centralManager, "setDelegate:", 0);
  centralManager = self->_centralManager;
  self->_centralManager = 0;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:name:object:", self, *MEMORY[0x1E0D033B0], 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:name:object:", self, *MEMORY[0x1E0D033A8], 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObserver:name:object:", self, *MEMORY[0x1E0D033C0], 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeObserver:name:object:", self, *MEMORY[0x1E0D033B8], 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeObserver:name:object:", self, *MEMORY[0x1E0D03390], 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "removeObserver:name:object:", self, *MEMORY[0x1E0D033C8], 0);

}

- (void)centralManager:(id)a3 didUpdatePeripheralConnectionState:(id)a4
{
  void *v5;
  void *v6;
  id v7;

  v7 = a4;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  objc_msgSend(v7, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "state") == 1 || objc_msgSend(v7, "state") == 3)
  {
    if ((-[NSMutableSet containsObject:](self->_busyIdentifiers, "containsObject:", v6) & 1) == 0)
    {
      -[NSMutableSet addObject:](self->_busyIdentifiers, "addObject:", v6);
LABEL_7:
      -[CCUIBluetoothMenuModuleViewController _updateBluetoothMenuItems](self, "_updateBluetoothMenuItems");
    }
  }
  else if (-[NSMutableSet containsObject:](self->_busyIdentifiers, "containsObject:", v6))
  {
    -[NSMutableSet removeObject:](self->_busyIdentifiers, "removeObject:", v6);
    goto LABEL_7;
  }

}

- (void)_updateBluetoothMenuItems
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t k;
  void *v28;
  void *v29;
  void *v30;
  BOOL v31;
  void *v32;
  void *v33;
  id obj;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  _BYTE v48[128];
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  objc_msgSend(MEMORY[0x1E0D03410], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pairedDevices");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v43, v49, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v44;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v44 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * i);
        -[CCUIBluetoothMenuModuleViewController _menuItemForBluetoothDevice:](self, "_menuItemForBluetoothDevice:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v12);
        objc_msgSend(v11, "address");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v13);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v43, v49, 16);
    }
    while (v8);
  }

  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  -[CBCentralManager sharedPairingAgent](self->_centralManager, "sharedPairingAgent");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "retrievePairedPeers");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v39, v48, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v40;
    do
    {
      for (j = 0; j != v17; ++j)
      {
        if (*(_QWORD *)v40 != v18)
          objc_enumerationMutation(v15);
        v20 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * j);
        if (!-[CCUIBluetoothMenuModuleViewController _shouldHideBluetoothPeripheral:](self, "_shouldHideBluetoothPeripheral:", v20))
        {
          -[CCUIBluetoothMenuModuleViewController _menuItemForBluetoothPeripheral:](self, "_menuItemForBluetoothPeripheral:", v20);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "addObject:", v21);

        }
        objc_msgSend(v20, "identifier");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "UUIDString");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v23);

      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v39, v48, 16);
    }
    while (v17);
  }

  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  -[CBCentralManager retrieveConnectedPeripheralsWithServices:allowAll:](self->_centralManager, "retrieveConnectedPeripheralsWithServices:allowAll:", MEMORY[0x1E0C9AA60], 1);
  obj = (id)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v47, 16);
  if (v24)
  {
    v25 = v24;
    v26 = *(_QWORD *)v36;
    do
    {
      for (k = 0; k != v25; ++k)
      {
        if (*(_QWORD *)v36 != v26)
          objc_enumerationMutation(obj);
        v28 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * k);
        objc_msgSend(v28, "identifier");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "UUIDString");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v4, "containsObject:", v30) & 1) != 0)
        {

        }
        else
        {
          v31 = -[CCUIBluetoothMenuModuleViewController _shouldHideBluetoothPeripheral:](self, "_shouldHideBluetoothPeripheral:", v28);

          if (v31)
            goto LABEL_27;
          -[CCUIBluetoothMenuModuleViewController _menuItemForBluetoothPeripheral:](self, "_menuItemForBluetoothPeripheral:", v28);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "addObject:", v29);
        }

LABEL_27:
        objc_msgSend(v28, "identifier");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "UUIDString");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v33);

      }
      v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v47, 16);
    }
    while (v25);
  }

  objc_msgSend(v3, "sortUsingComparator:", &__block_literal_global_5);
  -[CCUIMenuModuleViewController setMenuItems:](self, "setMenuItems:", v3);

}

uint64_t __66__CCUIBluetoothMenuModuleViewController__updateBluetoothMenuItems__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "localizedStandardCompare:", v6);
  return v7;
}

- (id)_menuItemForBluetoothDevice:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t);
  void *v16;
  id v17;
  id v18;
  id v19;
  id location;

  v4 = a3;
  objc_msgSend(v4, "address");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v6 = objc_alloc(MEMORY[0x1E0D147B8]);
  objc_msgSend(v4, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x1E0C809B0];
  v14 = 3221225472;
  v15 = __69__CCUIBluetoothMenuModuleViewController__menuItemForBluetoothDevice___block_invoke;
  v16 = &unk_1E8CFCAD0;
  objc_copyWeak(&v19, &location);
  v8 = v4;
  v17 = v8;
  v9 = v5;
  v18 = v9;
  v10 = (void *)objc_msgSend(v6, "initWithTitle:identifier:handler:", v7, v9, &v13);

  objc_msgSend(v10, "setBusy:", -[NSMutableSet containsObject:](self->_busyIdentifiers, "containsObject:", v9, v13, v14, v15, v16));
  -[CCUIBluetoothMenuModuleViewController _subtitleForConnected:](self, "_subtitleForConnected:", objc_msgSend(v8, "connected"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setSubtitle:", v11);

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);

  return v10;
}

uint64_t __69__CCUIBluetoothMenuModuleViewController__menuItemForBluetoothDevice___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  int v3;
  void *v4;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v3 = objc_msgSend(*(id *)(a1 + 32), "connected");
    objc_msgSend(WeakRetained[156], "addObject:", *(_QWORD *)(a1 + 40));
    objc_msgSend(WeakRetained, "_updateBluetoothMenuItems");
    v4 = *(void **)(a1 + 32);
    if (v3)
      objc_msgSend(v4, "disconnect");
    else
      objc_msgSend(v4, "connect");
  }

  return 0;
}

- (id)_menuItemForBluetoothPeripheral:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  _QWORD v13[4];
  id v14;
  id v15;
  id location;

  v4 = a3;
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak(&location, self->_centralManager);
  if (objc_msgSend(v4, "hasTag:", CFSTR("DA_ASK_RETAIN_DEVICE")))
    objc_msgSend(v4, "customProperty:", CFSTR("ASK_DISPLAY_NAME"));
  else
    objc_msgSend(v4, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_alloc(MEMORY[0x1E0D147B8]);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __73__CCUIBluetoothMenuModuleViewController__menuItemForBluetoothPeripheral___block_invoke;
  v13[3] = &unk_1E8CFCAF8;
  v9 = v4;
  v14 = v9;
  objc_copyWeak(&v15, &location);
  v10 = (void *)objc_msgSend(v8, "initWithTitle:identifier:handler:", v7, v6, v13);
  objc_msgSend(v10, "setBusy:", -[NSMutableSet containsObject:](self->_busyIdentifiers, "containsObject:", v6));
  -[CCUIBluetoothMenuModuleViewController _subtitleForConnected:](self, "_subtitleForConnected:", objc_msgSend(v9, "isConnectedToSystem"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setSubtitle:", v11);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

  return v10;
}

uint64_t __73__CCUIBluetoothMenuModuleViewController__menuItemForBluetoothPeripheral___block_invoke(uint64_t a1)
{
  int v2;
  id WeakRetained;
  void *v4;
  uint64_t v5;

  v2 = objc_msgSend(*(id *)(a1 + 32), "isConnectedToSystem");
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = WeakRetained;
  v5 = *(_QWORD *)(a1 + 32);
  if (v2)
    objc_msgSend(WeakRetained, "cancelPeripheralConnection:", v5);
  else
    objc_msgSend(WeakRetained, "connectPeripheral:options:", v5, 0);

  return 0;
}

- (BOOL)_shouldHideBluetoothPeripheral:(id)a3
{
  id v4;
  void *v5;
  int v6;

  v4 = a3;
  if (objc_msgSend(v4, "connectedTransport") == 2)
  {
    -[CBCentralManager sharedPairingAgent](self->_centralManager, "sharedPairingAgent");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v5, "isPeerCloudPaired:", v4) & 1) != 0)
      LOBYTE(v6) = 1;
    else
      v6 = objc_msgSend(v4, "visibleInSettings") ^ 1;

  }
  else
  {
    LOBYTE(v6) = 1;
  }

  return v6;
}

- (id)_subtitleForConnected:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
    v6 = CFSTR("CONTROL_CENTER_STATUS_BLUETOOTH_CONNECTED");
  else
    v6 = CFSTR("CONTROL_CENTER_STATUS_BLUETOOTH_DISCONNECTED");
  objc_msgSend(v4, "localizedStringForKey:value:table:", v6, &stru_1E8D00320, CFSTR("ControlCenterUI+SystemModules"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)_bluetoothDeviceConnectionStatusDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  NSMutableSet *busyIdentifiers;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  objc_msgSend(v4, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)*MEMORY[0x1E0D146A8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D146A8], OS_LOG_TYPE_DEFAULT))
  {
    v7 = v6;
    objc_msgSend(v5, "name");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543362;
    v12 = v8;
    _os_log_impl(&dword_1CFB7D000, v7, OS_LOG_TYPE_DEFAULT, "Bluetooth connection status changed: %{public}@", (uint8_t *)&v11, 0xCu);

  }
  busyIdentifiers = self->_busyIdentifiers;
  objc_msgSend(v5, "address");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableSet removeObject:](busyIdentifiers, "removeObject:", v10);

  -[CCUIBluetoothMenuModuleViewController _updateBluetoothMenuItems](self, "_updateBluetoothMenuItems");
}

- (void)_bluetoothAvailabilityChanged:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  _DWORD v8[2];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  objc_msgSend(v4, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)*MEMORY[0x1E0D146A8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D146A8], OS_LOG_TYPE_DEFAULT))
  {
    v7 = v6;
    v8[0] = 67109120;
    v8[1] = objc_msgSend(v5, "BOOLValue");
    _os_log_impl(&dword_1CFB7D000, v7, OS_LOG_TYPE_DEFAULT, "Bluetooth device availability changed: %{BOOL}d", (uint8_t *)v8, 8u);

  }
  -[CCUIBluetoothMenuModuleViewController _updateBluetoothMenuItems](self, "_updateBluetoothMenuItems");

}

- (void)_bluetoothDeviceRemoved:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  objc_msgSend(v4, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)*MEMORY[0x1E0D146A8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D146A8], OS_LOG_TYPE_DEFAULT))
  {
    v7 = v6;
    objc_msgSend(v5, "name");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543362;
    v10 = v8;
    _os_log_impl(&dword_1CFB7D000, v7, OS_LOG_TYPE_DEFAULT, "Bluetooth device removed: %{public}@", (uint8_t *)&v9, 0xCu);

  }
  -[CCUIBluetoothMenuModuleViewController _updateBluetoothMenuItems](self, "_updateBluetoothMenuItems");

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_centralManager, 0);
  objc_storeStrong((id *)&self->_busyIdentifiers, 0);
}

@end
