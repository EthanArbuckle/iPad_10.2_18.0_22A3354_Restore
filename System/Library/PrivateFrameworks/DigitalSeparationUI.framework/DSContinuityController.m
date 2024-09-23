@implementation DSContinuityController

- (DSContinuityController)init
{
  void *v3;
  void *v4;
  void *v5;
  DSContinuityController *v6;
  os_log_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  objc_super v18;

  DSUILocStringForKey(CFSTR("CONTINUITY_TITLE"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  DSUILocStringForKey(CFSTR("CONTINUITY_DETAIL"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD640], "systemImageNamed:", CFSTR("macbook.and.iphone"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v18.receiver = self;
  v18.super_class = (Class)DSContinuityController;
  v6 = -[DSTableWelcomeController initWithTitle:detailText:icon:shouldShowSearchBar:](&v18, sel_initWithTitle_detailText_icon_shouldShowSearchBar_, v3, v4, v5, 0);

  if (v6)
  {
    v7 = os_log_create("com.apple.DigitalSeparation", "DSContinuityController");
    v8 = (void *)DSLog_4;
    DSLog_4 = (uint64_t)v7;

    DSUILocStringForKey(CFSTR("SKIP"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[DSContinuityController delegate](v6, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[DSUIUtilities setUpBoldButtonForController:title:target:selector:](DSUIUtilities, "setUpBoldButtonForController:title:target:selector:", v6, v9, v10, sel_pushNextPane);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[DSTableWelcomeController setBoldButton:](v6, "setBoldButton:", v11);

    DSUILocStringForKey(CFSTR("CONTINUITY_STOP_ALL"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[DSUIUtilities setUpLinkButtonForController:title:target:selector:](DSUIUtilities, "setUpLinkButtonForController:title:target:selector:", v6, v12, v6, sel_presentRemoveAllDevicesAlert);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[DSTableWelcomeController setLinkButton:](v6, "setLinkButton:", v13);

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[DSContinuityController setSelectedDevices:](v6, "setSelectedDevices:", v14);

    v15 = objc_alloc_init(MEMORY[0x24BE2CC58]);
    -[DSContinuityController setContinuityStore:](v6, "setContinuityStore:", v15);

    +[DSDeviceManager sharedInstance](DSDeviceManager, "sharedInstance");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "refresh");

  }
  return v6;
}

- (void)viewWillAppear:(BOOL)a3
{
  _QWORD v4[5];
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)DSContinuityController;
  -[OBTableWelcomeController viewWillAppear:](&v5, sel_viewWillAppear_, a3);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __41__DSContinuityController_viewWillAppear___block_invoke;
  v4[3] = &unk_24EFF33A0;
  v4[4] = self;
  -[DSContinuityController getDevicesWithCompletion:](self, "getDevicesWithCompletion:", v4);
}

uint64_t __41__DSContinuityController_viewWillAppear___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateButtons");
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)DSContinuityController;
  -[DSTableWelcomeController viewDidLoad](&v6, sel_viewDidLoad);
  objc_msgSend(MEMORY[0x24BE6E400], "accessoryButton");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  DSUILocStringForKey(CFSTR("LEARN_MORE"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTitle:forState:", v4, 0);

  objc_msgSend(v3, "addTarget:action:forControlEvents:", self, sel_presentLearnMore, 64);
  -[DSContinuityController headerView](self, "headerView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addAccessoryButton:", v3);

}

- (void)shouldShowWithCompletion:(id)a3
{
  id v4;
  _QWORD v5[5];
  id v6;

  v4 = a3;
  if (_os_feature_enabled_impl())
  {
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __51__DSContinuityController_shouldShowWithCompletion___block_invoke;
    v5[3] = &unk_24EFF3B40;
    v5[4] = self;
    v6 = v4;
    -[DSContinuityController getDevicesWithCompletion:](self, "getDevicesWithCompletion:", v5);

  }
  else
  {
    (*((void (**)(id, _QWORD))v4 + 2))(v4, 0);
  }

}

void __51__DSContinuityController_shouldShowWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "continuityDevices");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, BOOL))(v1 + 16))(v1, objc_msgSend(v2, "count") != 0);

}

- (void)getDevicesWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[DSContinuityController continuityStore](self, "continuityStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __51__DSContinuityController_getDevicesWithCompletion___block_invoke;
  v7[3] = &unk_24EFF3E60;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "fetchPairedDevicesWithCompletion:", v7);

}

void __51__DSContinuityController_getDevicesWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  id obj;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  _QWORD block[4];
  id v37;
  uint8_t buf[16];
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
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = DSLog_4;
    if (os_log_type_enabled((os_log_t)DSLog_4, OS_LOG_TYPE_ERROR))
      __51__DSContinuityController_getDevicesWithCompletion___block_invoke_cold_1((uint64_t)v6, v7, v8, v9, v10, v11, v12, v13);
  }
  else
  {
    +[DSDeviceManager sharedInstance](DSDeviceManager, "sharedInstance");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = 0u;
    v44 = 0u;
    v45 = 0u;
    v46 = 0u;
    v30 = v5;
    obj = v5;
    v34 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
    if (v34)
    {
      v32 = *(_QWORD *)v44;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v44 != v32)
            objc_enumerationMutation(obj);
          v35 = v14;
          v15 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * v14);
          objc_msgSend(v33, "iconForDevice:", v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "setDeviceImage:", v16);

          v41 = 0u;
          v42 = 0u;
          v39 = 0u;
          v40 = 0u;
          objc_msgSend(v33, "remoteDevices");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
          if (v18)
          {
            v19 = v18;
            v20 = *(_QWORD *)v40;
            do
            {
              for (i = 0; i != v19; ++i)
              {
                if (*(_QWORD *)v40 != v20)
                  objc_enumerationMutation(v17);
                v22 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
                objc_msgSend(v15, "pushToken");
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v22, "pushToken");
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                v25 = objc_msgSend(v23, "isEqualToString:", v24);

                if (v25)
                {
                  v26 = DSLog_4;
                  if (os_log_type_enabled((os_log_t)DSLog_4, OS_LOG_TYPE_INFO))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl(&dword_2278DF000, v26, OS_LOG_TYPE_INFO, "Continuity: matched AK devices by push token.", buf, 2u);
                  }
                  objc_msgSend(v22, "serialNumber");
                  v27 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v15, "setSerialNumber:", v27);

                  objc_msgSend(v22, "model");
                  v28 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v15, "setModel:", v28);

                }
              }
              v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
            }
            while (v19);
          }

          v14 = v35 + 1;
        }
        while (v35 + 1 != v34);
        v34 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
      }
      while (v34);
    }

    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithArray:", obj);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setContinuityDevices:", v29);

    v6 = 0;
    v5 = v30;
  }
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __51__DSContinuityController_getDevicesWithCompletion___block_invoke_237;
  block[3] = &unk_24EFF3898;
  v37 = *(id *)(a1 + 40);
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

uint64_t __51__DSContinuityController_getDevicesWithCompletion___block_invoke_237(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)presentRemoveAllDevicesAlert
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[5];

  v3 = (void *)MEMORY[0x24BEBD3B0];
  DSUILocStringForKey(CFSTR("CONTINUITY_DISCONNECT_TITLE"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  DSUILocStringForKey(CFSTR("CONTINUITY_DISCONNECT_CONFIRMATION"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "alertControllerWithTitle:message:preferredStyle:", v4, v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x24BEBD3A8];
  DSUILocStringForKey(CFSTR("CANCEL"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "actionWithTitle:style:handler:", v8, 1, &__block_literal_global_10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x24BEBD3A8];
  DSUILocStringForKey(CFSTR("CONTINUITY_DISCONNECT_ACTION"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __54__DSContinuityController_presentRemoveAllDevicesAlert__block_invoke_2;
  v13[3] = &unk_24EFF3418;
  v13[4] = self;
  objc_msgSend(v10, "actionWithTitle:style:handler:", v11, 2, v13);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "addAction:", v12);
  objc_msgSend(v6, "addAction:", v9);
  -[DSContinuityController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v6, 1, 0);

}

uint64_t __54__DSContinuityController_presentRemoveAllDevicesAlert__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeAllPairedDevicesAndPushNextPane");
}

- (void)presentRemoveSelectedDevicesAlert
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[5];

  v3 = (void *)MEMORY[0x24BEBD3B0];
  DSUILocStringForKey(CFSTR("CONTINUITY_DISCONNECT_TITLE"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  DSUILocStringForKey(CFSTR("CONTINUITY_DISCONNECT_CONFIRMATION"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "alertControllerWithTitle:message:preferredStyle:", v4, v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x24BEBD3A8];
  DSUILocStringForKey(CFSTR("CANCEL"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "actionWithTitle:style:handler:", v8, 1, &__block_literal_global_250);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x24BEBD3A8];
  DSUILocStringForKey(CFSTR("CONTINUITY_DISCONNECT_ACTION"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __59__DSContinuityController_presentRemoveSelectedDevicesAlert__block_invoke_2;
  v13[3] = &unk_24EFF3418;
  v13[4] = self;
  objc_msgSend(v10, "actionWithTitle:style:handler:", v11, 2, v13);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "addAction:", v12);
  objc_msgSend(v6, "addAction:", v9);
  -[DSContinuityController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v6, 1, 0);

}

uint64_t __59__DSContinuityController_presentRemoveSelectedDevicesAlert__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeSelectedPairedDevicesAndPushNextPane");
}

- (void)presentUnpairErrorAlert:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  id v15;

  v4 = a3;
  v5 = DSLog_4;
  if (os_log_type_enabled((os_log_t)DSLog_4, OS_LOG_TYPE_ERROR))
    -[DSContinuityController presentUnpairErrorAlert:].cold.1((uint64_t)v4, v5, v6, v7, v8, v9, v10, v11);
  objc_msgSend(MEMORY[0x24BEBD3B0], "ds_alertControllerContinuityUnpairError:", v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __50__DSContinuityController_presentUnpairErrorAlert___block_invoke;
  v14[3] = &unk_24EFF3A78;
  v14[4] = self;
  v15 = v12;
  v13 = v12;
  dispatch_async(MEMORY[0x24BDAC9B8], v14);

}

uint64_t __50__DSContinuityController_presentUnpairErrorAlert___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "tableView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "reloadData");

  objc_msgSend(*(id *)(a1 + 32), "boldButton");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hidesBusyIndicator");

  return objc_msgSend(*(id *)(a1 + 32), "presentErrorAlertController:", *(_QWORD *)(a1 + 40));
}

- (void)removeSelectedPairedDevicesAndPushNextPane
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[5];

  -[DSContinuityController selectedDevices](self, "selectedDevices");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[DSTableWelcomeController boldButton](self, "boldButton");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "showsBusyIndicator");

  -[DSContinuityController continuityStore](self, "continuityStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __68__DSContinuityController_removeSelectedPairedDevicesAndPushNextPane__block_invoke;
  v6[3] = &unk_24EFF3EC8;
  v6[4] = self;
  objc_msgSend(v5, "unpairDevicesWithIDs:completion:", v3, v6);

}

void __68__DSContinuityController_removeSelectedPairedDevicesAndPushNextPane__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  _QWORD v6[5];

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "selectedDevices");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeAllObjects");

  v5 = *(void **)(a1 + 32);
  if (v3)
  {
    objc_msgSend(v5, "presentUnpairErrorAlert:", v3);
  }
  else
  {
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __68__DSContinuityController_removeSelectedPairedDevicesAndPushNextPane__block_invoke_2;
    v6[3] = &unk_24EFF33A0;
    v6[4] = v5;
    objc_msgSend(v5, "getDevicesWithCompletion:", v6);
  }

}

void __68__DSContinuityController_removeSelectedPairedDevicesAndPushNextPane__block_invoke_2(uint64_t a1)
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __68__DSContinuityController_removeSelectedPairedDevicesAndPushNextPane__block_invoke_3;
  block[3] = &unk_24EFF33A0;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

void __68__DSContinuityController_removeSelectedPairedDevicesAndPushNextPane__block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "tableView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "reloadData");

  objc_msgSend(*(id *)(a1 + 32), "boldButton");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hidesBusyIndicator");

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pushNextPane");

}

- (void)removeAllPairedDevicesAndPushNextPane
{
  void *v3;
  void *v4;
  _QWORD v5[5];

  -[DSTableWelcomeController boldButton](self, "boldButton");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "showsBusyIndicator");

  -[DSContinuityController continuityStore](self, "continuityStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __63__DSContinuityController_removeAllPairedDevicesAndPushNextPane__block_invoke;
  v5[3] = &unk_24EFF3EC8;
  v5[4] = self;
  objc_msgSend(v4, "unpairAllDevicesWithCompletion:", v5);

}

void __63__DSContinuityController_removeAllPairedDevicesAndPushNextPane__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  _QWORD block[5];

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "selectedDevices");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeAllObjects");

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "presentUnpairErrorAlert:", v3);
  }
  else
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __63__DSContinuityController_removeAllPairedDevicesAndPushNextPane__block_invoke_2;
    block[3] = &unk_24EFF33A0;
    block[4] = *(_QWORD *)(a1 + 32);
    dispatch_async(MEMORY[0x24BDAC9B8], block);
  }

}

void __63__DSContinuityController_removeAllPairedDevicesAndPushNextPane__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "tableView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "reloadData");

  objc_msgSend(*(id *)(a1 + 32), "boldButton");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hidesBusyIndicator");

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pushNextPane");

}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v4;
  int64_t v5;

  -[DSContinuityController continuityDevices](self, "continuityDevices", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  return v5;
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
  void *v14;
  void *v15;
  void *v16;
  void *v18;

  v5 = a4;
  -[DSContinuityController continuityDevices](self, "continuityDevices");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectAtIndexedSubscript:", objc_msgSend(v5, "row"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[OBTableWelcomeController tableView](self, "tableView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "name");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "marketingName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "deviceImage");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[DSIconTableViewCell iconTableViewCellFromTableView:withText:detail:icon:](DSIconTableViewCell, "iconTableViewCellFromTableView:withText:detail:icon:", v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[DSContinuityController selectedDevices](self, "selectedDevices");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "deviceID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v10) = objc_msgSend(v13, "containsObject:", v14);

  if ((_DWORD)v10)
  {
    -[OBTableWelcomeController tableView](self, "tableView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "selectRowAtIndexPath:animated:scrollPosition:", v5, 1, 0);

  }
  objc_msgSend(v7, "initialDiscoveryDate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16
    || (objc_msgSend(v7, "serialNumber"), (v16 = (void *)objc_claimAutoreleasedReturnValue()) != 0)
    || (objc_msgSend(v7, "model"), (v16 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {

  }
  else
  {
    objc_msgSend(v7, "marketingName");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v18)
      goto LABEL_8;
  }
  objc_msgSend(v12, "setEditingAccessoryType:", 4);
LABEL_8:

  return v12;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  v5 = a4;
  -[DSContinuityController selectedDevices](self, "selectedDevices");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[DSContinuityController continuityDevices](self, "continuityDevices");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "row");

  objc_msgSend(v7, "objectAtIndex:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "deviceID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v10);

  -[DSContinuityController _updateButtons](self, "_updateButtons");
}

- (void)tableView:(id)a3 didDeselectRowAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  v5 = a4;
  -[DSContinuityController selectedDevices](self, "selectedDevices");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[DSContinuityController continuityDevices](self, "continuityDevices");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "row");

  objc_msgSend(v7, "objectAtIndex:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "deviceID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObject:", v10);

  -[DSContinuityController _updateButtons](self, "_updateButtons");
}

- (void)tableView:(id)a3 accessoryButtonTappedForRowWithIndexPath:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  __CFString *v20;
  DSContinuityDetailController *v21;
  void *v22;
  id v23;

  v5 = a4;
  -[DSContinuityController continuityDevices](self, "continuityDevices");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "row");

  objc_msgSend(v6, "objectAtIndexedSubscript:", v7);
  v23 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v23, "lastSessionStartDate");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8
    && (v9 = (void *)v8,
        objc_msgSend(v23, "lastSessionEndDate"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v10,
        v9,
        v10))
  {
    -[DSContinuityController continuityStore](self, "continuityStore");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "lastSessionStartDate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "formattedStartDate:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    -[DSContinuityController continuityStore](self, "continuityStore");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "lastSessionStartDate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "lastSessionEndDate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "formattedDurationFromStart:toEnd:", v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = (void *)MEMORY[0x24BDD17C8];
    DSUILocStringForKey(CFSTR("CONTINUITY_SESSION_DETAIL"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "stringWithFormat:", v19, v13, v17);
    v20 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v20 = &stru_24EFF4790;
  }
  v21 = -[DSContinuityDetailController initWithContinuityDevice:detailText:]([DSContinuityDetailController alloc], "initWithContinuityDevice:detailText:", v23, v20);
  -[DSContinuityDetailController setDelegate:](v21, "setDelegate:", self);
  -[DSContinuityController navigationController](self, "navigationController");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "pushViewController:animated:", v21, 1);

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
  -[DSContinuityController navigationController](self, "navigationController", 0);
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

  -[DSContinuityController navigationController](self, "navigationController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setViewControllers:", v3);

}

- (void)returnFromDetailAndRemoveDevice:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[DSTableWelcomeController boldButton](self, "boldButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "showsBusyIndicator");

  -[DSContinuityController continuityStore](self, "continuityStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "deviceID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v7;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __58__DSContinuityController_returnFromDetailAndRemoveDevice___block_invoke;
  v10[3] = &unk_24EFF3EF0;
  v10[4] = self;
  v11 = v4;
  v9 = v4;
  objc_msgSend(v6, "unpairDevicesWithIDs:completion:", v8, v10);

}

void __58__DSContinuityController_returnFromDetailAndRemoveDevice___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[5];

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "selectedDevices");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "deviceID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObject:", v5);

  v6 = *(void **)(a1 + 32);
  if (v3)
  {
    objc_msgSend(v6, "presentUnpairErrorAlert:", v3);
  }
  else
  {
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __58__DSContinuityController_returnFromDetailAndRemoveDevice___block_invoke_2;
    v7[3] = &unk_24EFF33A0;
    v7[4] = v6;
    objc_msgSend(v6, "getDevicesWithCompletion:", v7);
  }

}

void __58__DSContinuityController_returnFromDetailAndRemoveDevice___block_invoke_2(uint64_t a1)
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __58__DSContinuityController_returnFromDetailAndRemoveDevice___block_invoke_3;
  block[3] = &unk_24EFF33A0;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

void __58__DSContinuityController_returnFromDetailAndRemoveDevice___block_invoke_3(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  objc_msgSend(*(id *)(a1 + 32), "continuityDevices");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  v4 = *(void **)(a1 + 32);
  if (v3)
  {
    objc_msgSend(v4, "tableView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "reloadData");

    objc_msgSend(*(id *)(a1 + 32), "_updateButtons");
    objc_msgSend(*(id *)(a1 + 32), "boldButton");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "hidesBusyIndicator");

    objc_msgSend(*(id *)(a1 + 32), "navigationController");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    v7 = (id)objc_msgSend(v10, "popViewControllerAnimated:", 1);

  }
  else
  {
    objc_msgSend(v4, "boldButton");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "hidesBusyIndicator");

    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "pushNextPane");

    objc_msgSend(*(id *)(a1 + 32), "removeDetailViewControllerFromStack");
  }
}

- (void)_updateButtons
{
  DSContinuityController *v2;
  void *v3;
  uint64_t v4;
  char *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v2 = self;
  -[DSContinuityController selectedDevices](v2, "selectedDevices");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    DSUILocStringForKey(CFSTR("CONTINUITY_STOP"));
    v13 = (id)objc_claimAutoreleasedReturnValue();
    v5 = sel_presentRemoveSelectedDevicesAlert;
    v6 = v2;
  }
  else
  {
    DSUILocStringForKey(CFSTR("SKIP"));
    v13 = (id)objc_claimAutoreleasedReturnValue();
    v5 = sel_pushNextPane;
    -[DSContinuityController delegate](v2, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  -[DSTableWelcomeController boldButton](v2, "boldButton");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeTarget:action:forControlEvents:", 0, 0, 0xFFFFFFFFLL);

  -[DSTableWelcomeController boldButton](v2, "boldButton");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTitle:forState:", v13, 0);

  -[DSTableWelcomeController boldButton](v2, "boldButton");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addTarget:action:forControlEvents:", v6, v5, 64);

  -[DSTableWelcomeController linkButton](v2, "linkButton");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  DSUILocStringForKey(CFSTR("CONTINUITY_STOP_ALL"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTitle:forState:", v11, 0);

  -[DSTableWelcomeController linkButton](v2, "linkButton");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addTarget:action:forControlEvents:", v2, sel_presentRemoveAllDevicesAlert, 64);

}

- (void)presentLearnMore
{
  void *v3;
  id v4;

  -[DSContinuityController delegate](self, "delegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  DSUILocStringForKey(CFSTR("CONTINUITY_LEARN_MORE_URL"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "learnMorePressedForController:withURL:", self, v3);

}

- (void)remoteDeviceListModified:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __51__DSContinuityController_remoteDeviceListModified___block_invoke;
  v3[3] = &unk_24EFF33A0;
  v3[4] = self;
  -[DSContinuityController getDevicesWithCompletion:](self, "getDevicesWithCompletion:", v3);
}

void __51__DSContinuityController_remoteDeviceListModified___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint8_t v4[16];

  v2 = DSLog_4;
  if (os_log_type_enabled((os_log_t)DSLog_4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_2278DF000, v2, OS_LOG_TYPE_DEFAULT, "Completed fetch for remote device list modification", v4, 2u);
  }
  objc_msgSend(*(id *)(a1 + 32), "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "reloadData");

}

- (DSNavigationDelegate)delegate
{
  return (DSNavigationDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSMutableArray)selectedDevices
{
  return self->_selectedDevices;
}

- (void)setSelectedDevices:(id)a3
{
  objc_storeStrong((id *)&self->_selectedDevices, a3);
}

- (NSMutableArray)continuityDevices
{
  return self->_continuityDevices;
}

- (void)setContinuityDevices:(id)a3
{
  objc_storeStrong((id *)&self->_continuityDevices, a3);
}

- (DSContinuityStore)continuityStore
{
  return self->_continuityStore;
}

- (void)setContinuityStore:(id)a3
{
  objc_storeStrong((id *)&self->_continuityStore, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_continuityStore, 0);
  objc_storeStrong((id *)&self->_continuityDevices, 0);
  objc_storeStrong((id *)&self->_selectedDevices, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __51__DSContinuityController_getDevicesWithCompletion___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_2278DF000, a2, a3, "Failed to fetch devices from continuity store, error: %{public}@", a5, a6, a7, a8, 2u);
}

- (void)presentUnpairErrorAlert:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_2278DF000, a2, a3, "Failed to unpair device(s), error: %{public}@", a5, a6, a7, a8, 2u);
}

@end
