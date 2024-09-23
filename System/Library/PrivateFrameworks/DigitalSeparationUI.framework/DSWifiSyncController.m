@implementation DSWifiSyncController

- (DSWifiSyncController)init
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  DSWifiSyncController *v8;
  id v9;
  id v10;
  id v11;
  os_log_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  objc_super v24;

  v3 = (void *)MEMORY[0x24BEBD660];
  objc_msgSend(MEMORY[0x24BEBD4B8], "systemBlueColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "configurationWithHierarchicalColor:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BEBD640], "systemImageNamed:withConfiguration:", CFSTR("arrow.triangle.2.circlepath.circle.fill"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "imageWithRenderingMode:", 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v24.receiver = self;
  v24.super_class = (Class)DSWifiSyncController;
  v8 = -[DSTableWelcomeController initWithTitle:detailText:icon:shouldShowSearchBar:](&v24, sel_initWithTitle_detailText_icon_shouldShowSearchBar_, &stru_24EFF4790, &stru_24EFF4790, v7, 0);
  if (v8)
  {
    v9 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    -[DSWifiSyncController setSelectedPairedComputers:](v8, "setSelectedPairedComputers:", v9);

    v10 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    -[DSWifiSyncController setPairedComputers:](v8, "setPairedComputers:", v10);

    v11 = objc_alloc_init(MEMORY[0x24BE2CCA0]);
    -[DSWifiSyncController setWifiSyncStore:](v8, "setWifiSyncStore:", v11);

    v12 = os_log_create("com.apple.DigitalSeparation", "DSWifiSyncController");
    v13 = (void *)DSLog_9;
    DSLog_9 = (uint64_t)v12;

    -[DSWifiSyncController headerView](v8, "headerView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    DSUILocStringForKey(CFSTR("WIFI_SYNC_TITLE"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setTitle:", v15);

    -[DSWifiSyncController headerView](v8, "headerView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[DSWifiSyncController localizedDetailText](v8, "localizedDetailText");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setDetailText:", v17);

    DSUILocStringForKey(CFSTR("SKIP"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[DSWifiSyncController delegate](v8, "delegate");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    +[DSUIUtilities setUpBoldButtonForController:title:target:selector:](DSUIUtilities, "setUpBoldButtonForController:title:target:selector:", v8, v18, v19, sel_pushNextPane);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[DSTableWelcomeController setBoldButton:](v8, "setBoldButton:", v20);

    DSUILocStringForKey(CFSTR("WIFI_SYNC_REMOVE_ALL"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    +[DSUIUtilities setUpLinkButtonForController:title:target:selector:](DSUIUtilities, "setUpLinkButtonForController:title:target:selector:", v8, v21, v8, sel_removeAllPairedDevicesAndPushNextPane);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[DSTableWelcomeController setLinkButton:](v8, "setLinkButton:", v22);

  }
  return v8;
}

- (void)addPairedDevices:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[NSMutableArray removeAllObjects](self->_pairedComputers, "removeAllObjects");
  -[DSWifiSyncController wifiSyncStore](self, "wifiSyncStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __41__DSWifiSyncController_addPairedDevices___block_invoke;
  v7[3] = &unk_24EFF4188;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "fetchPairedDevicesOnQueue:completion:", MEMORY[0x24BDAC9B8], v7);

}

void __41__DSWifiSyncController_addPairedDevices___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  char v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  v5 = a3;
  if (v9)
  {
    v6 = objc_msgSend(*(id *)(a1 + 32), "isViewLoaded");
    v7 = *(void **)(a1 + 32);
    if ((v6 & 1) != 0)
      objc_msgSend(v7, "presentFetchedErrorAlert");
    else
      objc_msgSend(v7, "setFetchError:", v9);
  }
  objc_msgSend(*(id *)(a1 + 32), "pairedComputers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObjectsFromArray:", v5);

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)shouldShowWithCompletion:(id)a3
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
  v6[2] = __49__DSWifiSyncController_shouldShowWithCompletion___block_invoke;
  v6[3] = &unk_24EFF4030;
  objc_copyWeak(&v8, &location);
  v5 = v4;
  v7 = v5;
  -[DSWifiSyncController addPairedDevices:](self, "addPairedDevices:", v6);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);

}

void __49__DSWifiSyncController_shouldShowWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  id *WeakRetained;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  (*(void (**)(_QWORD, BOOL))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), objc_msgSend(WeakRetained[162], "count") != 0);
  objc_msgSend(WeakRetained, "reloadDetailText");
  objc_msgSend(WeakRetained, "tableView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "reloadData");

}

- (void)removeAllPairedDevicesAndPushNextPane
{
  void *v3;
  void *v4;
  id v5;
  _QWORD v6[5];
  id v7;

  -[DSWifiSyncController pairedComputers](self, "pairedComputers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[DSWifiSyncController wifiSyncStore](self, "wifiSyncStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __61__DSWifiSyncController_removeAllPairedDevicesAndPushNextPane__block_invoke;
  v6[3] = &unk_24EFF3EF0;
  v6[4] = self;
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "removeAllPairedDevicesOnQueue:completion:", MEMORY[0x24BDAC9B8], v6);

}

void __61__DSWifiSyncController_removeAllPairedDevicesAndPushNextPane__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[5];
  _QWORD v10[4];
  uint64_t v11;

  v3 = a2;
  if (v3)
  {
    v4 = DSLog_9;
    if (os_log_type_enabled((os_log_t)DSLog_9, OS_LOG_TYPE_ERROR))
      __61__DSWifiSyncController_removeAllPairedDevicesAndPushNextPane__block_invoke_cold_1((uint64_t)v3, v4);
    v5 = *(void **)(a1 + 32);
    DSUILocStringForKey(CFSTR("WIFI_SYNC_REMOVE_ERROR_TITLE"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    DSUILocStringForKey(CFSTR("WIFI_SYNC_REMOVE_ERROR_DETAIL"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __61__DSWifiSyncController_removeAllPairedDevicesAndPushNextPane__block_invoke_218;
    v10[3] = &unk_24EFF3418;
    v11 = *(_QWORD *)(a1 + 32);
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __61__DSWifiSyncController_removeAllPairedDevicesAndPushNextPane__block_invoke_2;
    v9[3] = &unk_24EFF3418;
    v9[4] = v11;
    objc_msgSend(v5, "presentErrorAlertWithTitle:message:continueHandler:tryAgainHandler:", v6, v7, v10, v9);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "reportUnpairedComputers:", *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "pushNextPane");

  }
}

void __61__DSWifiSyncController_removeAllPairedDevicesAndPushNextPane__block_invoke_218(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "pushNextPane");

}

uint64_t __61__DSWifiSyncController_removeAllPairedDevicesAndPushNextPane__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeAllPairedDevicesAndPushNextPane");
}

- (void)reloadDetailText
{
  void *v3;
  id v4;

  -[DSWifiSyncController headerView](self, "headerView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[DSWifiSyncController localizedDetailText](self, "localizedDetailText");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDetailText:", v3);

}

- (id)localizedDetailText
{
  unint64_t v3;
  void *v4;
  char v5;
  int v6;
  const __CFString *v7;
  const __CFString *v8;
  __CFString *v9;

  v3 = -[NSMutableArray count](self->_pairedComputers, "count");
  -[DSWifiSyncController wifiSyncStore](self, "wifiSyncStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "fetchWifiSyncStatus");

  if ((v5 & 1) != 0)
  {
    v6 = MGGetBoolAnswer();
    v7 = CFSTR("WIFI_SYNC_DETAIL_MULTIPLE");
    if (v3 < 2)
      v7 = CFSTR("WIFI_SYNC_DETAIL_SINGLE");
    v8 = CFSTR("WLAN_SYNC_DETAIL_SINGLE");
    if (v3 >= 2)
      v8 = CFSTR("WLAN_SYNC_DETAIL_MULTIPLE");
    if (v6)
      v9 = (__CFString *)v8;
    else
      v9 = (__CFString *)v7;
  }
  else if (v3 >= 2)
  {
    v9 = CFSTR("CABLE_SYNC_DETAIL_MULTIPLE");
  }
  else
  {
    v9 = CFSTR("CABLE_SYNC_DETAIL_SINGLE");
  }
  DSUILocStringForKey(v9);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)learnMoreWifiSyncPressed
{
  void *v3;
  id v4;

  -[DSWifiSyncController delegate](self, "delegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  DSUILocStringForKey(CFSTR("WIFI_SYNC_LEARN_MORE_URL"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "learnMorePressedForController:withURL:", self, v3);

}

- (void)presentFetchedErrorAlert
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v3 = (void *)MEMORY[0x24BEBD3B0];
  DSUILocStringForKey(CFSTR("WIFI_SYNC_FETCH_ERROR_TITLE"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  DSUILocStringForKey(CFSTR("WIFI_SYNC_FETCH_ERROR_DETAIL"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "alertControllerWithTitle:message:preferredStyle:", v4, v5, 1);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  -[DSTableWelcomeController presentErrorAlertController:](self, "presentErrorAlertController:", v6);
}

- (void)presentRemoveErrorAlert:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;

  v4 = (void *)MEMORY[0x24BEBD3B0];
  DSUILocStringForKey(CFSTR("WIFI_SYNC_REMOVE_ERROR_TITLE"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  DSUILocStringForKey(CFSTR("WIFI_SYNC_REMOVE_ERROR_DETAIL"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "alertControllerWithTitle:message:preferredStyle:", v5, v6, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __48__DSWifiSyncController_presentRemoveErrorAlert___block_invoke;
  v9[3] = &unk_24EFF3A78;
  v9[4] = self;
  v10 = v7;
  v8 = v7;
  dispatch_async(MEMORY[0x24BDAC9B8], v9);

}

uint64_t __48__DSWifiSyncController_presentRemoveErrorAlert___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "presentErrorAlertController:", *(_QWORD *)(a1 + 40));
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  NSError *fetchError;
  _QWORD v7[4];
  id v8;
  id location;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)DSWifiSyncController;
  -[DSTableWelcomeController viewDidLoad](&v10, sel_viewDidLoad);
  objc_msgSend(MEMORY[0x24BE6E400], "accessoryButton");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  DSUILocStringForKey(CFSTR("LEARN_MORE"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTitle:forState:", v4, 0);

  objc_msgSend(v3, "addTarget:action:forControlEvents:", self, sel_learnMoreWifiSyncPressed, 64);
  -[DSWifiSyncController headerView](self, "headerView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addAccessoryButton:", v3);

  if (self->_fetchError)
  {
    -[DSWifiSyncController presentFetchedErrorAlert](self, "presentFetchedErrorAlert");
    fetchError = self->_fetchError;
    self->_fetchError = 0;

  }
  else if (!-[NSMutableArray count](self->_pairedComputers, "count"))
  {
    objc_initWeak(&location, self);
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __35__DSWifiSyncController_viewDidLoad__block_invoke;
    v7[3] = &unk_24EFF3670;
    objc_copyWeak(&v8, &location);
    -[DSWifiSyncController addPairedDevices:](self, "addPairedDevices:", v7);
    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }

}

void __35__DSWifiSyncController_viewDidLoad__block_invoke(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "reloadDetailText");
  objc_msgSend(WeakRetained, "tableView");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "reloadData");

}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return -[NSMutableArray count](self->_pairedComputers, "count", a3, a4);
}

- (id)titleForPairedComputer:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  int v10;
  __CFString *v11;

  v3 = a3;
  objc_msgSend(v3, "deviceName");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4
    && (v5 = (void *)v4,
        objc_msgSend(v3, "deviceName"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v6, "length"),
        v6,
        v5,
        v7))
  {
    objc_msgSend(v3, "deviceName");
    v8 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v3, "marketingName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("Windows PC"));

    if (!v10)
    {
      v11 = &stru_24EFF4790;
      goto LABEL_8;
    }
    DSUILocStringForKey(CFSTR("WINDOWS_PC"));
    v8 = objc_claimAutoreleasedReturnValue();
  }
  v11 = (__CFString *)v8;
LABEL_8:

  return v11;
}

- (id)dateDescription:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  if (a3)
  {
    v3 = (objc_class *)MEMORY[0x24BDD1500];
    v4 = a3;
    v5 = objc_alloc_init(v3);
    objc_msgSend(v5, "setDateStyle:", 1);
    objc_msgSend(v5, "stringFromDate:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = (void *)MEMORY[0x24BDD17C8];
    DSUILocStringForKey(CFSTR("WIFI_SYNC_TIME_SYNCED"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringWithFormat:", v8, v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }
  return v9;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v17;

  v5 = a4;
  -[NSMutableArray objectAtIndexedSubscript:](self->_pairedComputers, "objectAtIndexedSubscript:", objc_msgSend(v5, "row"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBTableWelcomeController tableView](self, "tableView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[DSWifiSyncController titleForPairedComputer:](self, "titleForPairedComputer:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "datePaired");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[DSWifiSyncController dateDescription:](self, "dateDescription:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[DSIconTableViewCell iconTableViewCellFromTableView:withText:detail:icon:](DSIconTableViewCell, "iconTableViewCellFromTableView:withText:detail:icon:", v7, v8, v10, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "datePaired");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12 || (objc_msgSend(v6, "serialNumber"), (v12 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {

LABEL_4:
    objc_msgSend(v11, "setEditingAccessoryType:", 4);
    goto LABEL_5;
  }
  objc_msgSend(v6, "marketingName");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
    goto LABEL_4;
LABEL_5:
  -[DSWifiSyncController selectedPairedComputers](self, "selectedPairedComputers");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "containsObject:", v6);

  if (v14)
  {
    -[OBTableWelcomeController tableView](self, "tableView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "selectRowAtIndexPath:animated:scrollPosition:", v5, 1, 0);

  }
  return v11;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  NSMutableArray *pairedComputers;
  uint64_t v8;
  void *v9;

  v5 = a4;
  -[DSWifiSyncController selectedPairedComputers](self, "selectedPairedComputers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  pairedComputers = self->_pairedComputers;
  v8 = objc_msgSend(v5, "row");

  -[NSMutableArray objectAtIndex:](pairedComputers, "objectAtIndex:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v9);

  -[DSWifiSyncController _updateButtons](self, "_updateButtons");
}

- (void)tableView:(id)a3 didDeselectRowAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  NSMutableArray *pairedComputers;
  uint64_t v8;
  void *v9;

  v5 = a4;
  -[DSWifiSyncController selectedPairedComputers](self, "selectedPairedComputers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  pairedComputers = self->_pairedComputers;
  v8 = objc_msgSend(v5, "row");

  -[NSMutableArray objectAtIndex:](pairedComputers, "objectAtIndex:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObject:", v9);

  -[DSWifiSyncController _updateButtons](self, "_updateButtons");
}

- (void)removeSelectedPairedDevicesAndPushNextPane
{
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  DSWifiSyncController *v10;
  id v11;
  id location;

  -[DSWifiSyncController selectedPairedComputers](self, "selectedPairedComputers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  -[DSWifiSyncController wifiSyncStore](self, "wifiSyncStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x24BDAC9B8];
  v6 = MEMORY[0x24BDAC9B8];
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __66__DSWifiSyncController_removeSelectedPairedDevicesAndPushNextPane__block_invoke;
  v8[3] = &unk_24EFF41B0;
  objc_copyWeak(&v11, &location);
  v7 = v3;
  v9 = v7;
  v10 = self;
  objc_msgSend(v4, "removePairedDevices:onQueue:withCompletion:", v7, v5, v8);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

}

void __66__DSWifiSyncController_removeSelectedPairedDevicesAndPushNextPane__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  _QWORD v7[5];

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v5 = WeakRetained;
  if (v3)
  {
    objc_msgSend(WeakRetained, "presentRemoveErrorAlert:", v3);
  }
  else
  {
    objc_msgSend(WeakRetained, "reportUnpairedComputers:", *(_QWORD *)(a1 + 32));
    objc_msgSend(v5, "selectedPairedComputers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeAllObjects");

    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __66__DSWifiSyncController_removeSelectedPairedDevicesAndPushNextPane__block_invoke_2;
    v7[3] = &unk_24EFF33A0;
    v7[4] = *(_QWORD *)(a1 + 40);
    objc_msgSend(v5, "addPairedDevices:", v7);
  }

}

uint64_t __66__DSWifiSyncController_removeSelectedPairedDevicesAndPushNextPane__block_invoke_2(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "tableView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "reloadData");

  return objc_msgSend(*(id *)(a1 + 32), "finalizeComputerReviewAndPushNextPane");
}

- (void)_updateButtons
{
  uint64_t v3;
  BOOL v4;
  __CFString *v5;
  char **v6;
  char *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v3 = -[NSMutableArray count](self->_selectedPairedComputers, "count");
  v4 = v3 == 0;
  if (v3)
    v5 = CFSTR("WIFI_SYNC_REMOVE");
  else
    v5 = CFSTR("SKIP");
  if (v4)
    v6 = &selRef_finalizeComputerReviewAndPushNextPane;
  else
    v6 = &selRef_removeSelectedPairedDevicesAndPushNextPane;
  DSUILocStringForKey(v5);
  v14 = (id)objc_claimAutoreleasedReturnValue();
  v7 = *v6;
  -[DSTableWelcomeController boldButton](self, "boldButton");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeTarget:action:forControlEvents:", 0, 0, 0xFFFFFFFFLL);

  -[DSTableWelcomeController boldButton](self, "boldButton");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTitle:forState:", v14, 0);

  -[DSTableWelcomeController boldButton](self, "boldButton");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addTarget:action:forControlEvents:", self, v7, 64);

  -[DSTableWelcomeController linkButton](self, "linkButton");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  DSUILocStringForKey(CFSTR("WIFI_SYNC_REMOVE_ALL"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setTitle:forState:", v12, 0);

  -[DSTableWelcomeController linkButton](self, "linkButton");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addTarget:action:forControlEvents:", self, sel_removeAllPairedDevicesAndPushNextPane, 64);

}

- (void)tableView:(id)a3 accessoryButtonTappedForRowWithIndexPath:(id)a4
{
  void *v5;
  DSWifiSyncDetailController *v6;
  void *v7;
  void *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  -[NSMutableArray objectAtIndexedSubscript:](self->_pairedComputers, "objectAtIndexedSubscript:", objc_msgSend(a4, "row", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[DSWifiSyncDetailController initWithPairedComputer:]([DSWifiSyncDetailController alloc], "initWithPairedComputer:", v5);
  -[DSWifiSyncDetailController setDelegate:](v6, "setDelegate:", self);
  v9[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v9, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[DSWifiSyncController reportReviewedComputers:](self, "reportReviewedComputers:", v7);

  -[DSWifiSyncController navigationController](self, "navigationController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "pushViewController:animated:", v6, 1);

}

- (void)removeDetailViewControllerFromStack
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[DSWifiSyncController navigationController](self, "navigationController", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "viewControllers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v9);
        v11 = objc_opt_class();
        if (v11 != objc_opt_class())
          objc_msgSend(v3, "addObject:", v10);
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  -[DSWifiSyncController navigationController](self, "navigationController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setViewControllers:", v3);

}

- (void)returnFromDetailAndRemoveComputer:(id)a3
{
  id v4;
  DSWifiSyncStore *wifiSyncStore;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  wifiSyncStore = self->_wifiSyncStore;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObject:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __58__DSWifiSyncController_returnFromDetailAndRemoveComputer___block_invoke;
  v8[3] = &unk_24EFF3EF0;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  -[DSWifiSyncStore removePairedDevices:onQueue:withCompletion:](wifiSyncStore, "removePairedDevices:onQueue:withCompletion:", v6, MEMORY[0x24BDAC9B8], v8);

}

void __58__DSWifiSyncController_returnFromDetailAndRemoveComputer___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id location;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  if (v3)
  {
    objc_msgSend(v4, "presentRemoveErrorAlert:", v3);
  }
  else
  {
    objc_msgSend(v4, "selectedPairedComputers");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeAllObjects");

    objc_initWeak(&location, *(id *)(a1 + 32));
    v6 = *(void **)(a1 + 32);
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __58__DSWifiSyncController_returnFromDetailAndRemoveComputer___block_invoke_2;
    v7[3] = &unk_24EFF3708;
    objc_copyWeak(&v9, &location);
    v8 = *(id *)(a1 + 40);
    objc_msgSend(v6, "addPairedDevices:", v7);

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }

}

void __58__DSWifiSyncController_returnFromDetailAndRemoveComputer___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_updateButtons");
  objc_msgSend(WeakRetained, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "reloadData");

  objc_msgSend(WeakRetained, "pairedComputers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5)
  {
    objc_msgSend(WeakRetained, "navigationController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (id)objc_msgSend(v6, "popViewControllerAnimated:", 1);

  }
  else
  {
    objc_msgSend(WeakRetained, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "pushNextPane");

    v10[0] = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v10, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "reportUnpairedComputers:", v9);

    objc_msgSend(WeakRetained, "removeDetailViewControllerFromStack");
  }

}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)DSWifiSyncController;
  -[OBTableWelcomeController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[DSWifiSyncController _updateButtons](self, "_updateButtons");
}

- (void)finalizeComputerReviewAndPushNextPane
{
  id v3;

  -[DSWifiSyncController finalizePairingReviewReport](self, "finalizePairingReviewReport");
  -[DSWifiSyncController delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pushNextPane");

}

- (void)finalizePairingReviewReport
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  -[DSWifiSyncController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v3, "unpairedComputers");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "count");

    if (v5)
    {
      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 0u;
      v17 = 0u;
      v18 = 0u;
      v19 = 0u;
      -[DSWifiSyncController pairedComputers](self, "pairedComputers", 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v17;
        do
        {
          for (i = 0; i != v9; ++i)
          {
            if (*(_QWORD *)v17 != v10)
              objc_enumerationMutation(v7);
            v12 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
            objc_msgSend(v12, "lockdownFrameworkKey");
            v13 = (void *)objc_claimAutoreleasedReturnValue();

            if (v13)
            {
              objc_msgSend(v12, "lockdownFrameworkKey");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v6, "addObject:", v14);

            }
          }
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        }
        while (v9);
      }

      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v3, "reviewedComputers");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "addObjectsFromArray:", v6);

      }
    }
  }

}

- (void)reportUnpairedComputers:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  uint64_t v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[DSWifiSyncController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v7 = v4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v28 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        objc_msgSend(v12, "lockdownFrameworkKey");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13)
        {
          objc_msgSend(v12, "lockdownFrameworkKey");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "addObject:", v14);

        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    }
    while (v9);
  }

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v5, "unpairedComputers");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObjectsFromArray:", v6);

  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v16 = v6;
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v24;
      do
      {
        for (j = 0; j != v18; ++j)
        {
          if (*(_QWORD *)v24 != v19)
            objc_enumerationMutation(v16);
          v21 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * j);
          objc_msgSend(v5, "reviewedComputers", (_QWORD)v23);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "removeObject:", v21);

        }
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
      }
      while (v18);
    }

  }
}

- (void)reportReviewedComputers:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[DSWifiSyncController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v7 = v4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v12, "lockdownFrameworkKey", (_QWORD)v16);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13)
        {
          objc_msgSend(v12, "lockdownFrameworkKey");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "addObject:", v14);

        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v9);
  }

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v5, "reviewedComputers");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObjectsFromArray:", v6);

  }
}

- (DSNavigationDelegate)delegate
{
  return (DSNavigationDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSError)fetchError
{
  return self->_fetchError;
}

- (void)setFetchError:(id)a3
{
  objc_storeStrong((id *)&self->_fetchError, a3);
}

- (NSMutableArray)pairedComputers
{
  return self->_pairedComputers;
}

- (void)setPairedComputers:(id)a3
{
  objc_storeStrong((id *)&self->_pairedComputers, a3);
}

- (NSMutableArray)selectedPairedComputers
{
  return self->_selectedPairedComputers;
}

- (void)setSelectedPairedComputers:(id)a3
{
  objc_storeStrong((id *)&self->_selectedPairedComputers, a3);
}

- (DSWifiSyncStore)wifiSyncStore
{
  return self->_wifiSyncStore;
}

- (void)setWifiSyncStore:(id)a3
{
  objc_storeStrong((id *)&self->_wifiSyncStore, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wifiSyncStore, 0);
  objc_storeStrong((id *)&self->_selectedPairedComputers, 0);
  objc_storeStrong((id *)&self->_pairedComputers, 0);
  objc_storeStrong((id *)&self->_fetchError, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __61__DSWifiSyncController_removeAllPairedDevicesAndPushNextPane__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_2278DF000, a2, OS_LOG_TYPE_ERROR, "Failed to remove all paired devices with error %@", (uint8_t *)&v2, 0xCu);
}

@end
