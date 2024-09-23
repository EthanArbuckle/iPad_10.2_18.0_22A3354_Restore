@implementation DSEmergencyResetController

+ (void)initialize
{
  os_log_t v2;
  void *v3;

  if ((id)objc_opt_class() == a1)
  {
    v2 = os_log_create("com.apple.DigitalSeparation", "DSEmergencyResetController");
    v3 = (void *)DSLogSafetyResetAll;
    DSLogSafetyResetAll = (uint64_t)v2;

  }
}

- (DSEmergencyResetController)init
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  DSEmergencyResetController *v9;
  objc_super v11;

  v3 = (void *)MEMORY[0x24BEBD660];
  objc_msgSend(MEMORY[0x24BEBD4B8], "systemBlueColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "configurationWithHierarchicalColor:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  DSUILocStringForKey(CFSTR("RESET_PEOPLE_APPS"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  DSUILocStringForKey(CFSTR("RESET_PEOPLE_APPS_DETAIL"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD640], "systemImageNamed:withConfiguration:", CFSTR("person.2.gobackward"), v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11.receiver = self;
  v11.super_class = (Class)DSEmergencyResetController;
  v9 = -[DSEmergencyResetController initWithTitle:detailText:icon:](&v11, sel_initWithTitle_detailText_icon_, v6, v7, v8);

  return v9;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  SPBeaconManager *v5;
  SPBeaconManager *beaconManager;
  id v7;
  DSAppSharing *v8;
  DSAppSharing *appSharing;
  DSWifiSyncStore *v10;
  DSWifiSyncStore *wifiSyncStore;
  DSContinuityStore *v12;
  DSContinuityStore *continuityStore;
  dispatch_queue_t v14;
  _QWORD v15[5];
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)DSEmergencyResetController;
  -[DSOBWelcomeController viewDidLoad](&v16, sel_viewDidLoad);
  DSUILocStringForKey(CFSTR("RESET_PEOPLE_APPS_BUTTON"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[DSUIUtilities setUpBoldButtonForController:title:target:selector:](DSUIUtilities, "setUpBoldButtonForController:title:target:selector:", self, v3, self, sel_safetyResetAllPressed);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[DSEmergencyResetController setBoldButton:](self, "setBoldButton:", v4);

  -[DSEmergencyResetController setResetError:](self, "setResetError:", 0);
  v5 = (SPBeaconManager *)objc_alloc_init(MEMORY[0x24BE82BD0]);
  beaconManager = self->_beaconManager;
  self->_beaconManager = v5;

  v7 = objc_alloc_init(MEMORY[0x24BE2CC90]);
  v8 = (DSAppSharing *)objc_msgSend(objc_alloc(MEMORY[0x24BE2CC50]), "initWithTCCStore:", v7);
  appSharing = self->_appSharing;
  self->_appSharing = v8;

  v10 = (DSWifiSyncStore *)objc_alloc_init(MEMORY[0x24BE2CCA0]);
  wifiSyncStore = self->_wifiSyncStore;
  self->_wifiSyncStore = v10;

  v12 = (DSContinuityStore *)objc_alloc_init(MEMORY[0x24BE2CC58]);
  continuityStore = self->_continuityStore;
  self->_continuityStore = v12;

  self->_userDidPressReset = 0;
  self->_isFetching = 1;
  v14 = dispatch_queue_create("SafetyResetAllControllerWork", 0);
  -[DSEmergencyResetController setWorkQueue:](self, "setWorkQueue:", v14);

  -[DSEmergencyResetController initializeEmergencyResetActions](self, "initializeEmergencyResetActions");
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __41__DSEmergencyResetController_viewDidLoad__block_invoke;
  v15[3] = &unk_24EFF33A0;
  v15[4] = self;
  -[DSEmergencyResetController fetchSharingPermissions:](self, "fetchSharingPermissions:", v15);

}

void __41__DSEmergencyResetController_viewDidLoad__block_invoke(uint64_t a1)
{
  _QWORD block[5];

  objc_msgSend(*(id *)(a1 + 32), "setIsFetching:", 0);
  if (objc_msgSend(*(id *)(a1 + 32), "userDidPressReset"))
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __41__DSEmergencyResetController_viewDidLoad__block_invoke_2;
    block[3] = &unk_24EFF33A0;
    block[4] = *(_QWORD *)(a1 + 32);
    dispatch_async(MEMORY[0x24BDAC9B8], block);
  }
}

uint64_t __41__DSEmergencyResetController_viewDidLoad__block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "updateProgressBar");
  return objc_msgSend(*(id *)(a1 + 32), "safetyResetAll");
}

- (void)viewWillAppear:(BOOL)a3
{
  if (!self->_isFetching)
    -[DSEmergencyResetController hideProgressBar](self, "hideProgressBar", a3);
}

- (void)fetchSharingPermissions:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id location;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x24BE2CC78]);
  -[DSEmergencyResetController setPermissions:](self, "setPermissions:", v5);

  objc_initWeak(&location, self);
  -[DSEmergencyResetController permissions](self, "permissions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x24BDAC9B8];
  v8 = MEMORY[0x24BDAC9B8];
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __54__DSEmergencyResetController_fetchSharingPermissions___block_invoke;
  v10[3] = &unk_24EFF3850;
  objc_copyWeak(&v12, &location);
  v9 = v4;
  v11 = v9;
  objc_msgSend(v6, "fetchPermissionsOnQueue:completion:", v7, v10);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

}

void __54__DSEmergencyResetController_fetchSharingPermissions___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t i;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  id WeakRetained;
  uint64_t v27;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  void *v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3)
  {
    v4 = DSLogSafetyResetAll;
    if (os_log_type_enabled((os_log_t)DSLogSafetyResetAll, OS_LOG_TYPE_ERROR))
      __54__DSEmergencyResetController_fetchSharingPermissions___block_invoke_cold_1((uint64_t)v3, v4, v5, v6, v7, v8, v9, v10);
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v28 = v3;
    objc_msgSend(v3, "underlyingErrors", a1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v30;
      v15 = *MEMORY[0x24BE2CC18];
      v16 = (_QWORD *)MEMORY[0x24BE2CC08];
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v30 != v14)
            objc_enumerationMutation(v11);
          v18 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
          objc_msgSend(v18, "domain");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v19, "isEqualToString:", *v16);

          if (v20)
          {
            objc_msgSend(v18, "userInfo");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "objectForKeyedSubscript:", v15);
            v22 = (void *)objc_claimAutoreleasedReturnValue();

            v23 = (void *)DSLogSafetyResetAll;
            if (os_log_type_enabled((os_log_t)DSLogSafetyResetAll, OS_LOG_TYPE_ERROR))
            {
              v24 = v23;
              objc_msgSend(v18, "underlyingErrors");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v34 = v22;
              v35 = 2114;
              v36 = v25;
              _os_log_error_impl(&dword_2278DF000, v24, OS_LOG_TYPE_ERROR, "Failed to fetch permissions for source %{public}@, underlying errors: %{public}@", buf, 0x16u);

            }
          }
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
      }
      while (v13);
    }

    a1 = v27;
    v3 = v28;
  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "setResetError:", v3);

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)safetyResetAllPressed
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[5];
  _QWORD v17[5];

  v3 = (void *)MEMORY[0x24BEBD3B0];
  DSUILocStringForKey(CFSTR("RESET_ALERT_BODY"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "alertControllerWithTitle:message:preferredStyle:", 0, v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x24BEBD3A8];
  DSUILocStringForKey(CFSTR("RESET_CANCEL"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "actionWithTitle:style:handler:", v7, 1, &__block_literal_global_4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x24BEBD3A8];
  DSUILocStringForKey(CFSTR("RESET_CONFIRM"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x24BDAC760];
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __51__DSEmergencyResetController_safetyResetAllPressed__block_invoke_2;
  v17[3] = &unk_24EFF3418;
  v17[4] = self;
  objc_msgSend(v9, "actionWithTitle:style:handler:", v10, 2, v17);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)MEMORY[0x24BEBD3A8];
  DSUILocStringForKey(CFSTR("RESET_CUSTOMIZE"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v11;
  v16[1] = 3221225472;
  v16[2] = __51__DSEmergencyResetController_safetyResetAllPressed__block_invoke_3;
  v16[3] = &unk_24EFF3418;
  v16[4] = self;
  objc_msgSend(v13, "actionWithTitle:style:handler:", v14, 0, v16);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "addAction:", v12);
  objc_msgSend(v5, "addAction:", v8);
  objc_msgSend(v5, "addAction:", v15);
  -[DSEmergencyResetController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v5, 1, 0);

}

uint64_t __51__DSEmergencyResetController_safetyResetAllPressed__block_invoke_2(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "setUserDidPressReset:", 1);
  objc_msgSend(*(id *)(a1 + 32), "showProgressBar");
  result = objc_msgSend(*(id *)(a1 + 32), "isFetching");
  if ((result & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "updateProgressBar");
    return objc_msgSend(*(id *)(a1 + 32), "safetyResetAll");
  }
  return result;
}

void __51__DSEmergencyResetController_safetyResetAllPressed__block_invoke_3(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "goToCustomizeSharing");

}

- (void)initializeEmergencyResetActions
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSArray *v11;
  NSArray *emergencyResetSteps;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[5];
  _QWORD v18[5];
  _QWORD v19[5];
  _QWORD v20[5];
  _QWORD v21[5];
  _QWORD v22[5];
  _QWORD v23[5];
  _QWORD v24[5];
  _QWORD v25[5];
  _QWORD v26[6];

  v3 = MEMORY[0x24BDAC760];
  v16 = (void *)MEMORY[0x24BDBCE30];
  v26[0] = MEMORY[0x24BDAC760];
  v26[1] = 3221225472;
  v26[2] = __61__DSEmergencyResetController_initializeEmergencyResetActions__block_invoke;
  v26[3] = &unk_24EFF38C0;
  v26[4] = self;
  v15 = (void *)objc_msgSend(v26, "copy");
  v25[0] = v3;
  v25[1] = 3221225472;
  v25[2] = __61__DSEmergencyResetController_initializeEmergencyResetActions__block_invoke_2;
  v25[3] = &unk_24EFF38C0;
  v25[4] = self;
  v14 = (void *)objc_msgSend(v25, "copy");
  v24[0] = v3;
  v24[1] = 3221225472;
  v24[2] = __61__DSEmergencyResetController_initializeEmergencyResetActions__block_invoke_2_235;
  v24[3] = &unk_24EFF38C0;
  v24[4] = self;
  v13 = (void *)objc_msgSend(v24, "copy");
  v23[0] = v3;
  v23[1] = 3221225472;
  v23[2] = __61__DSEmergencyResetController_initializeEmergencyResetActions__block_invoke_2_239;
  v23[3] = &unk_24EFF38C0;
  v23[4] = self;
  v4 = (void *)objc_msgSend(v23, "copy");
  v22[0] = v3;
  v22[1] = 3221225472;
  v22[2] = __61__DSEmergencyResetController_initializeEmergencyResetActions__block_invoke_2_243;
  v22[3] = &unk_24EFF38C0;
  v22[4] = self;
  v5 = (void *)objc_msgSend(v22, "copy");
  v21[0] = v3;
  v21[1] = 3221225472;
  v21[2] = __61__DSEmergencyResetController_initializeEmergencyResetActions__block_invoke_2_248;
  v21[3] = &unk_24EFF38C0;
  v21[4] = self;
  v6 = (void *)objc_msgSend(v21, "copy");
  v20[0] = v3;
  v20[1] = 3221225472;
  v20[2] = __61__DSEmergencyResetController_initializeEmergencyResetActions__block_invoke_2_252;
  v20[3] = &unk_24EFF38C0;
  v20[4] = self;
  v7 = (void *)objc_msgSend(v20, "copy");
  v19[0] = v3;
  v19[1] = 3221225472;
  v19[2] = __61__DSEmergencyResetController_initializeEmergencyResetActions__block_invoke_3;
  v19[3] = &unk_24EFF38C0;
  v19[4] = self;
  v8 = (void *)objc_msgSend(v19, "copy");
  v18[0] = v3;
  v18[1] = 3221225472;
  v18[2] = __61__DSEmergencyResetController_initializeEmergencyResetActions__block_invoke_2_260;
  v18[3] = &unk_24EFF38C0;
  v18[4] = self;
  v9 = (void *)objc_msgSend(v18, "copy");
  v17[0] = v3;
  v17[1] = 3221225472;
  v17[2] = __61__DSEmergencyResetController_initializeEmergencyResetActions__block_invoke_3_265;
  v17[3] = &unk_24EFF38C0;
  v17[4] = self;
  v10 = (void *)objc_msgSend(v17, "copy");
  objc_msgSend(v16, "arrayWithObjects:", v15, v14, v13, v4, v5, v6, v7, v8, v9, v10, 0);
  v11 = (NSArray *)objc_claimAutoreleasedReturnValue();
  emergencyResetSteps = self->_emergencyResetSteps;
  self->_emergencyResetSteps = v11;

}

void __61__DSEmergencyResetController_initializeEmergencyResetActions__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  uint8_t buf[16];

  v3 = a2;
  v4 = DSLogSafetyResetAll;
  if (os_log_type_enabled((os_log_t)DSLogSafetyResetAll, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2278DF000, v4, OS_LOG_TYPE_INFO, "Emergency Reset: started resetting first party sharing", buf, 2u);
  }
  v5 = *(void **)(a1 + 32);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __61__DSEmergencyResetController_initializeEmergencyResetActions__block_invoke_228;
  v7[3] = &unk_24EFF3898;
  v8 = v3;
  v6 = v3;
  objc_msgSend(v5, "resetAllFirstPartySharing:", v7);

}

uint64_t __61__DSEmergencyResetController_initializeEmergencyResetActions__block_invoke_228(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __61__DSEmergencyResetController_initializeEmergencyResetActions__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  uint8_t buf[16];

  v3 = a2;
  v4 = DSLogSafetyResetAll;
  if (os_log_type_enabled((os_log_t)DSLogSafetyResetAll, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2278DF000, v4, OS_LOG_TYPE_INFO, "Emergency Reset: started resetting third party permissions", buf, 2u);
  }
  v5 = *(void **)(a1 + 32);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __61__DSEmergencyResetController_initializeEmergencyResetActions__block_invoke_232;
  v7[3] = &unk_24EFF3898;
  v8 = v3;
  v6 = v3;
  objc_msgSend(v5, "resetAllThirdPartyTCCs:", v7);

}

uint64_t __61__DSEmergencyResetController_initializeEmergencyResetActions__block_invoke_232(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __61__DSEmergencyResetController_initializeEmergencyResetActions__block_invoke_2_235(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  uint8_t buf[16];

  v3 = a2;
  v4 = DSLogSafetyResetAll;
  if (os_log_type_enabled((os_log_t)DSLogSafetyResetAll, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2278DF000, v4, OS_LOG_TYPE_INFO, "Emergency Reset: started resetting necessary first party permissions", buf, 2u);
  }
  v5 = *(void **)(a1 + 32);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __61__DSEmergencyResetController_initializeEmergencyResetActions__block_invoke_236;
  v7[3] = &unk_24EFF3898;
  v8 = v3;
  v6 = v3;
  objc_msgSend(v5, "resetNecessaryFirstPartyPermissions:", v7);

}

uint64_t __61__DSEmergencyResetController_initializeEmergencyResetActions__block_invoke_236(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __61__DSEmergencyResetController_initializeEmergencyResetActions__block_invoke_2_239(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  uint8_t buf[4];
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)DSLogSafetyResetAll;
  if (os_log_type_enabled((os_log_t)DSLogSafetyResetAll, OS_LOG_TYPE_INFO))
  {
    v5 = *(void **)(a1 + 32);
    v6 = v4;
    objc_msgSend(v5, "appSharing");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134217984;
    v13 = v7;
    _os_log_impl(&dword_2278DF000, v6, OS_LOG_TYPE_INFO, "Emergency Reset: started resetting shortcuts automation timer. DSAppSharing: %p", buf, 0xCu);

  }
  objc_msgSend(*(id *)(a1 + 32), "appSharing");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __61__DSEmergencyResetController_initializeEmergencyResetActions__block_invoke_240;
  v10[3] = &unk_24EFF38E8;
  v11 = v3;
  v9 = v3;
  objc_msgSend(v8, "resetShortcutsAutomationTimer:handler:", MEMORY[0x24BDAC9B8], v10);

}

uint64_t __61__DSEmergencyResetController_initializeEmergencyResetActions__block_invoke_240(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __61__DSEmergencyResetController_initializeEmergencyResetActions__block_invoke_2_243(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)DSLogSafetyResetAll;
  if (os_log_type_enabled((os_log_t)DSLogSafetyResetAll, OS_LOG_TYPE_INFO))
  {
    v5 = *(void **)(a1 + 32);
    v6 = v4;
    objc_msgSend(v5, "appSharing");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134217984;
    v14 = v7;
    _os_log_impl(&dword_2278DF000, v6, OS_LOG_TYPE_INFO, "Emergency Reset: started resetting background app refresh. DSAppSharing: %p", buf, 0xCu);

  }
  objc_msgSend(*(id *)(a1 + 32), "appSharing");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE2CC98], "allUserVisibleApps");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __61__DSEmergencyResetController_initializeEmergencyResetActions__block_invoke_245;
  v11[3] = &unk_24EFF3898;
  v12 = v3;
  v10 = v3;
  objc_msgSend(v8, "resetBackgroundAppRefresh:queue:handler:", v9, MEMORY[0x24BDAC9B8], v11);

}

uint64_t __61__DSEmergencyResetController_initializeEmergencyResetActions__block_invoke_245(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __61__DSEmergencyResetController_initializeEmergencyResetActions__block_invoke_2_248(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  uint8_t buf[16];

  v3 = a2;
  v4 = DSLogSafetyResetAll;
  if (os_log_type_enabled((os_log_t)DSLogSafetyResetAll, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2278DF000, v4, OS_LOG_TYPE_INFO, "Emergency Reset: started resetting synced devices.", buf, 2u);
  }
  v5 = *(void **)(a1 + 32);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __61__DSEmergencyResetController_initializeEmergencyResetActions__block_invoke_249;
  v7[3] = &unk_24EFF38E8;
  v8 = v3;
  v6 = v3;
  objc_msgSend(v5, "removeAllPairedDevicesOnQueue:completion:", MEMORY[0x24BDAC9B8], v7);

}

uint64_t __61__DSEmergencyResetController_initializeEmergencyResetActions__block_invoke_249(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __61__DSEmergencyResetController_initializeEmergencyResetActions__block_invoke_2_252(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  uint8_t buf[4];
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)DSLogSafetyResetAll;
  if (os_log_type_enabled((os_log_t)DSLogSafetyResetAll, OS_LOG_TYPE_INFO))
  {
    v5 = *(void **)(a1 + 32);
    v6 = v4;
    objc_msgSend(v5, "beaconManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134217984;
    v13 = v7;
    _os_log_impl(&dword_2278DF000, v6, OS_LOG_TYPE_INFO, "Emergency Reset: started resetting FindMy acknowledgement. BeaconManager: %p", buf, 0xCu);

  }
  objc_msgSend(*(id *)(a1 + 32), "beaconManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __61__DSEmergencyResetController_initializeEmergencyResetActions__block_invoke_253;
  v10[3] = &unk_24EFF3898;
  v11 = v3;
  v9 = v3;
  objc_msgSend(v8, "setUserHasAcknowledgedFindMy:completion:", 0, v10);

}

void __61__DSEmergencyResetController_initializeEmergencyResetActions__block_invoke_253(uint64_t a1)
{
  _QWORD block[4];
  id v2;

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __61__DSEmergencyResetController_initializeEmergencyResetActions__block_invoke_2_254;
  block[3] = &unk_24EFF3898;
  v2 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

uint64_t __61__DSEmergencyResetController_initializeEmergencyResetActions__block_invoke_2_254(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __61__DSEmergencyResetController_initializeEmergencyResetActions__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  uint8_t buf[16];

  v3 = a2;
  v4 = DSLogSafetyResetAll;
  if (os_log_type_enabled((os_log_t)DSLogSafetyResetAll, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2278DF000, v4, OS_LOG_TYPE_INFO, "Emergency Reset: started resetting IDFA for all apps.", buf, 2u);
  }
  v5 = *(void **)(a1 + 32);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __61__DSEmergencyResetController_initializeEmergencyResetActions__block_invoke_257;
  v7[3] = &unk_24EFF3898;
  v8 = v3;
  v6 = v3;
  objc_msgSend(v5, "resetIDFA:", v7);

}

uint64_t __61__DSEmergencyResetController_initializeEmergencyResetActions__block_invoke_257(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __61__DSEmergencyResetController_initializeEmergencyResetActions__block_invoke_2_260(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  uint8_t buf[16];

  v3 = a2;
  v4 = DSLogSafetyResetAll;
  if (os_log_type_enabled((os_log_t)DSLogSafetyResetAll, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2278DF000, v4, OS_LOG_TYPE_INFO, "Emergency Reset: started resetting App Distribution.", buf, 2u);
  }
  v5 = *(void **)(a1 + 32);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __61__DSEmergencyResetController_initializeEmergencyResetActions__block_invoke_261;
  v7[3] = &unk_24EFF3898;
  v8 = v3;
  v6 = v3;
  objc_msgSend(v5, "resetAppDistribution:", v7);

}

void __61__DSEmergencyResetController_initializeEmergencyResetActions__block_invoke_261(uint64_t a1)
{
  _QWORD block[4];
  id v2;

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __61__DSEmergencyResetController_initializeEmergencyResetActions__block_invoke_2_262;
  block[3] = &unk_24EFF3898;
  v2 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

uint64_t __61__DSEmergencyResetController_initializeEmergencyResetActions__block_invoke_2_262(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __61__DSEmergencyResetController_initializeEmergencyResetActions__block_invoke_3_265(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  uint8_t buf[16];

  v3 = a2;
  v4 = DSLogSafetyResetAll;
  if (os_log_type_enabled((os_log_t)DSLogSafetyResetAll, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2278DF000, v4, OS_LOG_TYPE_INFO, "Emergency Reset: started resetting Continuity pairing.", buf, 2u);
  }
  v5 = *(void **)(a1 + 32);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __61__DSEmergencyResetController_initializeEmergencyResetActions__block_invoke_266;
  v7[3] = &unk_24EFF3898;
  v8 = v3;
  v6 = v3;
  objc_msgSend(v5, "unpairContinuityDevices:", v7);

}

void __61__DSEmergencyResetController_initializeEmergencyResetActions__block_invoke_266(uint64_t a1)
{
  _QWORD block[4];
  id v2;

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __61__DSEmergencyResetController_initializeEmergencyResetActions__block_invoke_2_267;
  block[3] = &unk_24EFF3898;
  v2 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

uint64_t __61__DSEmergencyResetController_initializeEmergencyResetActions__block_invoke_2_267(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)safetyResetAll
{
  NSObject *v3;
  dispatch_group_t v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  NSArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD block[5];
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _QWORD aBlock[5];
  NSObject *v20;
  uint8_t buf[8];
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v3 = DSLogSafetyResetAll;
  if (os_log_type_enabled((os_log_t)DSLogSafetyResetAll, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2278DF000, v3, OS_LOG_TYPE_INFO, "User initiated an Emergency Reset", buf, 2u);
  }
  -[DSEmergencyResetController setUserDidPressReset:](self, "setUserDidPressReset:", 0);
  v4 = dispatch_group_create();
  v5 = MEMORY[0x24BDAC760];
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __44__DSEmergencyResetController_safetyResetAll__block_invoke;
  aBlock[3] = &unk_24EFF3910;
  aBlock[4] = self;
  v6 = v4;
  v20 = v6;
  v7 = _Block_copy(aBlock);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v8 = self->_emergencyResetSteps;
  v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v15, v22, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v12);
        dispatch_group_enter(v6);
        (*(void (**)(uint64_t, void *))(v13 + 16))(v13, v7);
        ++v12;
      }
      while (v10 != v12);
      v10 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v15, v22, 16);
    }
    while (v10);
  }

  -[DSEmergencyResetController setDigitalSeparationTipsFlag](self, "setDigitalSeparationTipsFlag");
  block[0] = v5;
  block[1] = 3221225472;
  block[2] = __44__DSEmergencyResetController_safetyResetAll__block_invoke_271;
  block[3] = &unk_24EFF33A0;
  block[4] = self;
  dispatch_group_notify(v6, MEMORY[0x24BDAC9B8], block);

}

void __44__DSEmergencyResetController_safetyResetAll__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "updateProgressBar");
  v4 = (void *)DSLogSafetyResetAll;
  if (os_log_type_enabled((os_log_t)DSLogSafetyResetAll, OS_LOG_TYPE_INFO))
  {
    v5 = objc_retainAutorelease(v3);
    v6 = v4;
    v7 = 136315138;
    v8 = objc_msgSend(v5, "UTF8String");
    _os_log_impl(&dword_2278DF000, v6, OS_LOG_TYPE_INFO, "%s", (uint8_t *)&v7, 0xCu);

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));

}

uint64_t __44__DSEmergencyResetController_safetyResetAll__block_invoke_271(uint64_t a1)
{
  NSObject *v1;
  uint8_t v3[16];

  objc_msgSend(*(id *)(a1 + 32), "handleErrorsAndMoveToNextPane");
  v1 = DSLogSafetyResetAll;
  if (os_log_type_enabled((os_log_t)DSLogSafetyResetAll, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_2278DF000, v1, OS_LOG_TYPE_INFO, "Emergency Reset complete", v3, 2u);
  }
  return AnalyticsSendEventLazy();
}

uint64_t __44__DSEmergencyResetController_safetyResetAll__block_invoke_274()
{
  return 0;
}

- (void)showProgressBar
{
  void *v3;
  void *v4;
  void *v5;
  UIStackView *v6;
  UIStackView *progressStackView;
  void *v8;
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
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  UIProgressView *v31;
  UIProgressView *progressView;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;

  -[DSEmergencyResetController headerView](self, "headerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDetailText:", &stru_24EFF4790);

  -[DSEmergencyResetController buttonTray](self, "buttonTray");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[DSEmergencyResetController boldButton](self, "boldButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeButton:", v5);

  -[DSEmergencyResetController setBoldButton:](self, "setBoldButton:", 0);
  v6 = (UIStackView *)objc_alloc_init(MEMORY[0x24BEBD978]);
  progressStackView = self->_progressStackView;
  self->_progressStackView = v6;

  -[DSEmergencyResetController progressStackView](self, "progressStackView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[DSEmergencyResetController progressStackView](self, "progressStackView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAxis:", 1);

  -[DSEmergencyResetController progressStackView](self, "progressStackView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setAlignment:", 3);

  -[DSEmergencyResetController progressStackView](self, "progressStackView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setSpacing:", 20.0);

  -[DSEmergencyResetController contentView](self, "contentView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[DSEmergencyResetController progressStackView](self, "progressStackView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addSubview:", v13);

  -[DSEmergencyResetController progressStackView](self, "progressStackView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "topAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[DSEmergencyResetController contentView](self, "contentView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "topAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "constraintEqualToAnchor:constant:", v17, 20.0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setActive:", 1);

  -[DSEmergencyResetController progressStackView](self, "progressStackView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "widthAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[DSEmergencyResetController contentView](self, "contentView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "widthAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "constraintEqualToAnchor:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setActive:", 1);

  v41 = objc_alloc_init(MEMORY[0x24BEBD708]);
  objc_msgSend(v41, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  DSUILocStringForKey(CFSTR("PROGRESS_TEXT"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "setText:", v24);

  objc_msgSend(MEMORY[0x24BEBD4B8], "secondaryLabelColor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "setTextColor:", v25);

  objc_msgSend(v41, "setTextAlignment:", 1);
  -[DSEmergencyResetController progressStackView](self, "progressStackView");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "addArrangedSubview:", v41);

  objc_msgSend(v41, "widthAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[DSEmergencyResetController progressStackView](self, "progressStackView");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "widthAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "constraintEqualToAnchor:", v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setActive:", 1);

  v31 = (UIProgressView *)objc_alloc_init(MEMORY[0x24BEBD8A0]);
  progressView = self->_progressView;
  self->_progressView = v31;

  -[DSEmergencyResetController progressView](self, "progressView");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[DSEmergencyResetController progressStackView](self, "progressStackView");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[DSEmergencyResetController progressView](self, "progressView");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "addArrangedSubview:", v35);

  -[DSEmergencyResetController progressView](self, "progressView");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "widthAnchor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[DSEmergencyResetController progressStackView](self, "progressStackView");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "widthAnchor");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "constraintEqualToAnchor:constant:", v39, -20.0);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "setActive:", 1);

}

- (void)hideProgressBar
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[DSEmergencyResetController progressStackView](self, "progressStackView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeFromSuperview");

  -[DSEmergencyResetController headerView](self, "headerView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  DSUILocStringForKey(CFSTR("RESET_PEOPLE_APPS_DETAIL"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDetailText:", v5);

  -[DSEmergencyResetController boldButton](self, "boldButton");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    DSUILocStringForKey(CFSTR("RESET_PEOPLE_APPS_BUTTON"));
    v8 = (id)objc_claimAutoreleasedReturnValue();
    +[DSUIUtilities setUpBoldButtonForController:title:target:selector:](DSUIUtilities, "setUpBoldButtonForController:title:target:selector:", self, v8, self, sel_safetyResetAllPressed);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[DSEmergencyResetController setBoldButton:](self, "setBoldButton:", v7);

  }
}

- (void)updateProgressBar
{
  void *v3;
  float v4;
  float v5;
  float v6;
  float v7;
  double v8;
  id v9;

  -[DSEmergencyResetController progressView](self, "progressView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "progress");
  v5 = v4;
  v6 = 1.0 / (double)(-[NSArray count](self->_emergencyResetSteps, "count") + 1);
  v7 = v5 + v6;

  if (v7 >= 1.0)
    v7 = v7 + -0.1;
  -[DSEmergencyResetController progressView](self, "progressView");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  *(float *)&v8 = v7;
  objc_msgSend(v9, "setProgress:", v8);

}

- (void)setDigitalSeparationTipsFlag
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  BiomeLibrary();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "Discoverability");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "Signals");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "source");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc(MEMORY[0x24BE0C3A0]);
  objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "operatingSystemVersionString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v5, "initWithContentIdentifier:context:osBuild:userInfo:", CFSTR("com.apple.DigitalSeparation.safety-reset"), 0, v7, 0);

  objc_msgSend(v4, "sendEvent:", v8);
}

- (void)handleErrorsAndMoveToNextPane
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  _QWORD v22[5];
  _QWORD v23[5];
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  -[DSEmergencyResetController resetError](self, "resetError");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[DSEmergencyResetController resetError](self, "resetError");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "underlyingErrors");
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v5 = (id)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v25;
      while (2)
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v25 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
          if (objc_msgSend(v10, "code") == 7 || objc_msgSend(v10, "code") == 8 || objc_msgSend(v10, "code") == 6)
          {

            v17 = (void *)MEMORY[0x24BEBD3B0];
            DSUILocStringForKey(CFSTR("RESET_ALL_FAILED_RESTRICTIONS_TITLE"));
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            DSUILocStringForKey(CFSTR("RESET_ALL_FAILED_RESTRICTIONS"));
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "alertControllerWithTitle:message:preferredStyle:", v18, v19, 1);
            v13 = (void *)objc_claimAutoreleasedReturnValue();

            v14 = (void *)MEMORY[0x24BEBD3A8];
            DSUILocStringForKey(CFSTR("OK"));
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v23[0] = MEMORY[0x24BDAC760];
            v23[1] = 3221225472;
            v23[2] = __59__DSEmergencyResetController_handleErrorsAndMoveToNextPane__block_invoke;
            v23[3] = &unk_24EFF3418;
            v23[4] = self;
            v16 = v23;
            goto LABEL_14;
          }
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
        if (v7)
          continue;
        break;
      }
    }

    v11 = (void *)MEMORY[0x24BEBD3B0];
    -[DSEmergencyResetController resetError](self, "resetError");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "ds_alertControllerWithStopSharingError:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = (void *)MEMORY[0x24BEBD3A8];
    DSUILocStringForKey(CFSTR("OK"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = MEMORY[0x24BDAC760];
    v22[1] = 3221225472;
    v22[2] = __59__DSEmergencyResetController_handleErrorsAndMoveToNextPane__block_invoke_2;
    v22[3] = &unk_24EFF3418;
    v22[4] = self;
    v16 = v22;
LABEL_14:
    objc_msgSend(v14, "actionWithTitle:style:handler:", v15, 1, v16);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addAction:", v20);

    -[DSEmergencyResetController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v13, 1, 0);
  }
  else
  {
    -[DSEmergencyResetController delegate](self, "delegate");
    v21 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "pushNextPane");

  }
}

void __59__DSEmergencyResetController_handleErrorsAndMoveToNextPane__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "pushNextPane");

}

void __59__DSEmergencyResetController_handleErrorsAndMoveToNextPane__block_invoke_2(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "pushNextPane");

}

- (void)resetAllFirstPartySharing:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[DSEmergencyResetController permissions](self, "permissions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __56__DSEmergencyResetController_resetAllFirstPartySharing___block_invoke;
  v7[3] = &unk_24EFF3978;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "stopAllSharingOnQueue:completion:", MEMORY[0x24BDAC9B8], v7);

}

void __56__DSEmergencyResetController_resetAllFirstPartySharing___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  id v5;

  v5 = a3;
  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(MEMORY[0x24BE2CC68], "errorWithCode:underlyingErrors:", 2, v5);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setResetError:", v4);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)resetAllThirdPartyTCCs:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;

  v4 = a3;
  -[DSEmergencyResetController appSharing](self, "appSharing");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x24BDBCF20];
  objc_msgSend(MEMORY[0x24BE2CC98], "tccServices");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setWithArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE2CC98], "allApps");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __53__DSEmergencyResetController_resetAllThirdPartyTCCs___block_invoke;
  v11[3] = &unk_24EFF39A0;
  v11[4] = self;
  v12 = v4;
  v10 = v4;
  objc_msgSend(v5, "resetPermissions:forApps:queue:handler:", v8, v9, MEMORY[0x24BDAC9B8], v11);

}

void __53__DSEmergencyResetController_resetAllThirdPartyTCCs___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  if (objc_msgSend(v4, "count"))
  {
    objc_msgSend(MEMORY[0x24BE2CC68], "errorWithCode:underlyingErrors:", 4, v4);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setResetError:", v3);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)removeAllPairedDevicesOnQueue:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[DSEmergencyResetController wifiSyncStore](self, "wifiSyncStore");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeAllPairedDevicesOnQueue:completion:", v7, v6);

}

- (void)resetNecessaryFirstPartyPermissions:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  -[DSEmergencyResetController appSharing](self, "appSharing");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", CFSTR("DSLocationAlways"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", CFSTR("com.apple.shortcuts"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __66__DSEmergencyResetController_resetNecessaryFirstPartyPermissions___block_invoke;
  v9[3] = &unk_24EFF39A0;
  v9[4] = self;
  v10 = v4;
  v8 = v4;
  objc_msgSend(v5, "resetPermissions:forApps:queue:handler:", v6, v7, MEMORY[0x24BDAC9B8], v9);

}

void __66__DSEmergencyResetController_resetNecessaryFirstPartyPermissions___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  if (objc_msgSend(v4, "count"))
  {
    objc_msgSend(MEMORY[0x24BE2CC68], "errorWithCode:underlyingErrors:", 4, v4);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setResetError:", v3);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)resetIDFA:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  -[DSEmergencyResetController appSharing](self, "appSharing");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", CFSTR("kTCCServiceUserTracking"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE2CC98], "allApps");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __40__DSEmergencyResetController_resetIDFA___block_invoke;
  v9[3] = &unk_24EFF39A0;
  v9[4] = self;
  v10 = v4;
  v8 = v4;
  objc_msgSend(v5, "resetPermissions:forApps:queue:handler:", v6, v7, MEMORY[0x24BDAC9B8], v9);

}

void __40__DSEmergencyResetController_resetIDFA___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  if (objc_msgSend(v4, "count"))
  {
    objc_msgSend(MEMORY[0x24BE2CC68], "errorWithCode:underlyingErrors:", 4, v4);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setResetError:", v3);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)resetAppDistribution:(id)a3
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;

  v3 = a3;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __51__DSEmergencyResetController_resetAppDistribution___block_invoke;
  v5[3] = &unk_24EFF38E8;
  v6 = v3;
  v4 = v3;
  +[AppDistributorWrapper handleEmergencyResetWithCompletionHandler:](_TtC19DigitalSeparationUI21AppDistributorWrapper, "handleEmergencyResetWithCompletionHandler:", v5);

}

void __51__DSEmergencyResetController_resetAppDistribution___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = a2;
  if (v3)
  {
    v4 = DSLogSafetyResetAll;
    if (os_log_type_enabled((os_log_t)DSLogSafetyResetAll, OS_LOG_TYPE_ERROR))
      __51__DSEmergencyResetController_resetAppDistribution___block_invoke_cold_1((uint64_t)v3, v4, v5, v6, v7, v8, v9, v10);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)unpairContinuityDevices:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  -[DSEmergencyResetController continuityStore](self, "continuityStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __54__DSEmergencyResetController_unpairContinuityDevices___block_invoke;
  v7[3] = &unk_24EFF38E8;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "unpairAllDevicesWithCompletion:", v7);

}

void __54__DSEmergencyResetController_unpairContinuityDevices___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = a2;
  if (v3)
  {
    v4 = DSLogSafetyResetAll;
    if (os_log_type_enabled((os_log_t)DSLogSafetyResetAll, OS_LOG_TYPE_ERROR))
      __54__DSEmergencyResetController_unpairContinuityDevices___block_invoke_cold_1((uint64_t)v3, v4, v5, v6, v7, v8, v9, v10);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (DSNavigationDelegate)delegate
{
  return (DSNavigationDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (DSSharingPermissions)permissions
{
  return self->_permissions;
}

- (void)setPermissions:(id)a3
{
  objc_storeStrong((id *)&self->_permissions, a3);
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setWorkQueue:(id)a3
{
  objc_storeStrong((id *)&self->_workQueue, a3);
}

- (DSAppSharing)appSharing
{
  return self->_appSharing;
}

- (void)setAppSharing:(id)a3
{
  objc_storeStrong((id *)&self->_appSharing, a3);
}

- (OBBoldTrayButton)boldButton
{
  return self->_boldButton;
}

- (void)setBoldButton:(id)a3
{
  objc_storeStrong((id *)&self->_boldButton, a3);
}

- (NSError)resetError
{
  return self->_resetError;
}

- (void)setResetError:(id)a3
{
  objc_storeStrong((id *)&self->_resetError, a3);
}

- (BOOL)isFetching
{
  return self->_isFetching;
}

- (void)setIsFetching:(BOOL)a3
{
  self->_isFetching = a3;
}

- (SPBeaconManager)beaconManager
{
  return self->_beaconManager;
}

- (void)setBeaconManager:(id)a3
{
  objc_storeStrong((id *)&self->_beaconManager, a3);
}

- (UIStackView)progressStackView
{
  return self->_progressStackView;
}

- (void)setProgressStackView:(id)a3
{
  objc_storeStrong((id *)&self->_progressStackView, a3);
}

- (UIProgressView)progressView
{
  return self->_progressView;
}

- (void)setProgressView:(id)a3
{
  objc_storeStrong((id *)&self->_progressView, a3);
}

- (BOOL)userDidPressReset
{
  return self->_userDidPressReset;
}

- (void)setUserDidPressReset:(BOOL)a3
{
  self->_userDidPressReset = a3;
}

- (DSWifiSyncStore)wifiSyncStore
{
  return self->_wifiSyncStore;
}

- (void)setWifiSyncStore:(id)a3
{
  objc_storeStrong((id *)&self->_wifiSyncStore, a3);
}

- (DSContinuityStore)continuityStore
{
  return self->_continuityStore;
}

- (void)setContinuityStore:(id)a3
{
  objc_storeStrong((id *)&self->_continuityStore, a3);
}

- (NSArray)emergencyResetSteps
{
  return self->_emergencyResetSteps;
}

- (void)setEmergencyResetSteps:(id)a3
{
  objc_storeStrong((id *)&self->_emergencyResetSteps, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_emergencyResetSteps, 0);
  objc_storeStrong((id *)&self->_continuityStore, 0);
  objc_storeStrong((id *)&self->_wifiSyncStore, 0);
  objc_storeStrong((id *)&self->_progressView, 0);
  objc_storeStrong((id *)&self->_progressStackView, 0);
  objc_storeStrong((id *)&self->_beaconManager, 0);
  objc_storeStrong((id *)&self->_resetError, 0);
  objc_storeStrong((id *)&self->_boldButton, 0);
  objc_storeStrong((id *)&self->_appSharing, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_permissions, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __54__DSEmergencyResetController_fetchSharingPermissions___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_2278DF000, a2, a3, "Failed to fetch permissions because %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_0_0();
}

void __51__DSEmergencyResetController_resetAppDistribution___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_2278DF000, a2, a3, "Failed to reset App Distribution because of error: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_0_0();
}

void __54__DSEmergencyResetController_unpairContinuityDevices___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_2278DF000, a2, a3, "Failed to reset Continuity pairs because of error: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_0_0();
}

@end
