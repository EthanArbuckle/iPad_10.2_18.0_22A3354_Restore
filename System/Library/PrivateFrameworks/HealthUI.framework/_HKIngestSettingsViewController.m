@implementation _HKIngestSettingsViewController

- (id)_initWithHealthStore:(id)a3 displayTypeController:(id)a4 useInsetStyling:(BOOL)a5
{
  _BOOL8 v5;
  id v9;
  id v10;
  _HKIngestSettingsViewController *v11;
  _HKIngestSettingsViewController *v12;
  uint64_t v13;
  HKHealthServicesManager *healthServicesManager;
  uint64_t v15;
  NSMutableArray *dataTypeNames;

  v5 = a5;
  v9 = a3;
  v10 = a4;
  v11 = -[HKTableViewController initWithUsingInsetStyling:](self, "initWithUsingInsetStyling:", v5);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_healthStore, a3);
    v13 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB6778]), "initWithHealthStore:", v9);
    healthServicesManager = v12->_healthServicesManager;
    v12->_healthServicesManager = (HKHealthServicesManager *)v13;

    objc_storeStrong((id *)&v12->_displayTypeController, a4);
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v15 = objc_claimAutoreleasedReturnValue();
    dataTypeNames = v12->_dataTypeNames;
    v12->_dataTypeNames = (NSMutableArray *)v15;

    v12->_deviceFound = 1;
  }

  return v12;
}

- (void)viewDidLoad
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_HKIngestSettingsViewController;
  -[HKTableViewController viewDidLoad](&v4, sel_viewDidLoad);
  -[_HKIngestSettingsViewController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setEstimatedRowHeight:", 44.0);

  -[_HKIngestSettingsViewController fetchEnabledStatusForPeripheral](self, "fetchEnabledStatusForPeripheral");
}

- (void)fetchEnabledStatusForPeripheral
{
  HKHealthServicesManager *healthServicesManager;
  NSUUID *deviceIdentifier;
  _QWORD v4[5];

  healthServicesManager = self->_healthServicesManager;
  deviceIdentifier = self->_deviceIdentifier;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __66___HKIngestSettingsViewController_fetchEnabledStatusForPeripheral__block_invoke;
  v4[3] = &unk_1E9C3FB40;
  v4[4] = self;
  -[HKHealthServicesManager getEnabledStatusForPeripheral:withCompletion:](healthServicesManager, "getEnabledStatusForPeripheral:withCompletion:", deviceIdentifier, v4);
}

- (void)reloadData:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  _QWORD block[5];
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (self->_deviceIdentifier)
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v15 != v8)
            objc_enumerationMutation(v5);
          -[HKDisplayTypeController displayTypeForObjectTypeUnifyingBloodPressureTypes:](self->_displayTypeController, "displayTypeForObjectTypeUnifyingBloodPressureTypes:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i));
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "localization");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "displayName");
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          if ((-[NSMutableArray containsObject:](self->_dataTypeNames, "containsObject:", v12) & 1) == 0)
            -[NSMutableArray addObject:](self->_dataTypeNames, "addObject:", v12);

        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v7);
    }
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __46___HKIngestSettingsViewController_reloadData___block_invoke;
    block[3] = &unk_1E9C3F0D0;
    block[4] = self;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }

}

- (void)switchCellValueChanged:(id)a3 value:(BOOL)a4
{
  id v5;
  uint64_t v6;
  HKHealthServicesManager *healthServicesManager;
  NSUUID *deviceIdentifier;
  _QWORD v9[4];
  id v10;
  char v11;
  id location;

  v5 = a3;
  v6 = objc_msgSend(v5, "isOn");
  objc_initWeak(&location, self);
  healthServicesManager = self->_healthServicesManager;
  deviceIdentifier = self->_deviceIdentifier;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __64___HKIngestSettingsViewController_switchCellValueChanged_value___block_invoke;
  v9[3] = &unk_1E9C42838;
  objc_copyWeak(&v10, &location);
  v11 = v6;
  -[HKHealthServicesManager setEnabledStatus:forPeripheral:withCompletion:](healthServicesManager, "setEnabledStatus:forPeripheral:withCompletion:", v6, deviceIdentifier, v9);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

}

- (void)_displayGuestModeAlertWithCompletion:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  _QWORD v16[4];
  id v17;

  v3 = a3;
  v4 = (void *)MEMORY[0x1E0DC3450];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("GUEST_MODE_CHANGE_AUTHORIZATION_TITLE"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("GUEST_MODE_CHANGE_AUTHORIZATION_DESCRIPTION"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "alertControllerWithTitle:message:preferredStyle:", v6, v8, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x1E0DC3448];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("SHARE_ALERT_OK"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __72___HKIngestSettingsViewController__displayGuestModeAlertWithCompletion___block_invoke;
  v16[3] = &unk_1E9C42860;
  v17 = v3;
  v13 = v3;
  objc_msgSend(v10, "actionWithTitle:style:handler:", v12, 0, v16);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "addAction:", v14);
  -[_HKIngestSettingsViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v9, 1, 0);

}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  if (a4 == 1)
    return -[NSMutableArray count](self->_dataTypeNames, "count", a3);
  else
    return a4 == 0;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  HKSwitchTableViewCell *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v5 = a4;
  v6 = objc_msgSend(v5, "section");
  -[_HKIngestSettingsViewController tableView](self, "tableView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    objc_msgSend(v7, "dequeueReusableCellWithIdentifier:", CFSTR("DeviceSourceDatatype"));
    v9 = (HKSwitchTableViewCell *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      v9 = (HKSwitchTableViewCell *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D50]), "initWithStyle:reuseIdentifier:", 0, CFSTR("DeviceSourceDatatype"));
      -[HKSwitchTableViewCell setSelectionStyle:](v9, "setSelectionStyle:", 0);
    }
    -[NSMutableArray objectAtIndexedSubscript:](self->_dataTypeNames, "objectAtIndexedSubscript:", objc_msgSend(v5, "row"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKSwitchTableViewCell textLabel](v9, "textLabel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setText:", v10);

  }
  else
  {
    objc_msgSend(v7, "dequeueReusableCellWithIdentifier:", CFSTR("DeviceSourceKillSwitch"));
    v9 = (HKSwitchTableViewCell *)objc_claimAutoreleasedReturnValue();

    if (!v9)
      v9 = -[HKSwitchTableViewCell initWithStyle:reuseIdentifier:]([HKSwitchTableViewCell alloc], "initWithStyle:reuseIdentifier:", 0, CFSTR("DeviceSourceKillSwitch"));
    -[HKSwitchTableViewCell setDelegate:](v9, "setDelegate:", self);
    -[HKSwitchTableViewCell setOn:](v9, "setOn:", self->_deviceEnabled);
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("UPDATE_HEALTH_DATA"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKSwitchTableViewCell setDisplayText:](v9, "setDisplayText:", v13);

    -[HKSwitchTableViewCell setEnabled:](v9, "setEnabled:", self->_deviceFound);
  }

  return v9;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 2;
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = a3;
  if (objc_msgSend(MEMORY[0x1E0CB6F18], "isAppleInternalInstall")
    && objc_msgSend(v6, "numberOfSections") - 1 == a4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("INTERNAL ONLY: %@, Legacy Bluetooth device with identifier:%@"), self, self->_deviceIdentifier);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (a4)
  {
    v7 = 0;
  }
  else
  {
    if (self->_deviceFound)
    {
      v8 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("ALLOW_DEVICE_DATA_UPDATES"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[_HKIngestSettingsViewController title](self, "title");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "stringWithFormat:", v10, v11);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("DEVICE_NOT_PAIRED"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  return v7;
}

- (NSUUID)deviceIdentifier
{
  return self->_deviceIdentifier;
}

- (void)setDeviceIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1056);
}

- (HKHealthStore)healthStore
{
  return self->_healthStore;
}

- (void)setHealthStore:(id)a3
{
  objc_storeStrong((id *)&self->_healthStore, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_healthStore, 0);
  objc_storeStrong((id *)&self->_deviceIdentifier, 0);
  objc_storeStrong((id *)&self->_dataTypeNames, 0);
  objc_storeStrong((id *)&self->_displayTypeController, 0);
  objc_storeStrong((id *)&self->_healthServicesManager, 0);
}

@end
