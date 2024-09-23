@implementation WDDeviceSourcesListTableViewSection

- (void)setSourceListDataSource:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)WDDeviceSourcesListTableViewSection;
  -[WDSourcesListTableViewSection setSourceListDataSource:](&v4, sel_setSourceListDataSource_, a3);
  -[WDDeviceSourcesListTableViewSection reloadDevices](self, "reloadDevices");
}

- (void)dataSourceDidUpdate
{
  void *v3;
  void *v4;
  void *v5;

  -[WDSourcesListTableViewSection dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sources");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "orderedDeviceSources");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDDeviceSourcesListTableViewSection setSources:devices:](self, "setSources:devices:", v5, self->_devices);

  -[WDDeviceSourcesListTableViewSection reloadDevices](self, "reloadDevices");
}

- (void)reloadDevices
{
  void *v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  WDDeviceSourcesListTableViewSection *v8;
  _QWORD *v9;
  id v10;
  id location;
  _QWORD v12[5];
  id v13;

  v12[0] = 0;
  v12[1] = v12;
  v12[2] = 0x3032000000;
  v12[3] = __Block_byref_object_copy__2;
  v12[4] = __Block_byref_object_dispose__2;
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  -[WDSourcesListTableViewSection dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "healthStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __52__WDDeviceSourcesListTableViewSection_reloadDevices__block_invoke;
  v6[3] = &unk_24D38E678;
  v9 = v12;
  v5 = v4;
  v7 = v5;
  objc_copyWeak(&v10, &location);
  v8 = self;
  objc_msgSend(v5, "healthPeripheralsWithCustomProperties:withCompletion:", &unk_24D3A6380, v6);
  objc_destroyWeak(&v10);

  objc_destroyWeak(&location);
  _Block_object_dispose(v12, 8);

}

void __52__WDDeviceSourcesListTableViewSection_reloadDevices__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  os_log_t *v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  id v26;
  _QWORD v27[4];
  id v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint8_t v36[128];
  uint8_t buf[4];
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v25 = v5;
  v26 = a3;
  if (v26)
  {
    _HKInitializeLogging();
    v6 = *MEMORY[0x24BDD3070];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3070], OS_LOG_TYPE_ERROR))
      __52__WDDeviceSourcesListTableViewSection_reloadDevices__block_invoke_cold_1((uint64_t)v26, v6, v7, v8, v9, v10, v11, v12);
  }
  else if (v5 && objc_msgSend(v5, "count", v5, 0))
  {
    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    v13 = v5;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    if (v14)
    {
      v15 = *(_QWORD *)v33;
      v16 = (os_log_t *)MEMORY[0x24BDD3070];
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v33 != v15)
            objc_enumerationMutation(v13);
          v18 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
          v19 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
          objc_msgSend(v18, "identifier");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "UUIDString");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "addObject:", v21);

          _HKInitializeLogging();
          v22 = *v16;
          if (os_log_type_enabled(*v16, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v38 = v18;
            _os_log_impl(&dword_215814000, v22, OS_LOG_TYPE_INFO, "Bluetooth devices retrieved: %@", buf, 0xCu);
          }
        }
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
      }
      while (v14);
    }

  }
  else
  {
    _HKInitializeLogging();
    v23 = *MEMORY[0x24BDD3070];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3070], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v38 = 0;
      _os_log_impl(&dword_215814000, v23, OS_LOG_TYPE_DEFAULT, "Bluetooth devices not returned, %{public}@", buf, 0xCu);
    }
  }
  v24 = *(void **)(a1 + 32);
  v27[0] = MEMORY[0x24BDAC760];
  v27[1] = 3221225472;
  v27[2] = __52__WDDeviceSourcesListTableViewSection_reloadDevices__block_invoke_211;
  v27[3] = &unk_24D38E678;
  v30 = *(_QWORD *)(a1 + 48);
  v28 = v24;
  objc_copyWeak(&v31, (id *)(a1 + 56));
  v29 = *(_QWORD *)(a1 + 40);
  objc_msgSend(v28, "healthPeripheralsWithFilter:handler:", 1, v27);
  objc_destroyWeak(&v31);

}

void __52__WDDeviceSourcesListTableViewSection_reloadDevices__block_invoke_211(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD v25[5];
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v7 = v5;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v28 != v9)
            objc_enumerationMutation(v7);
          v11 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
          if (!objc_msgSend(v11, "type"))
          {
            v12 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
            objc_msgSend(v11, "identifier");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "UUIDString");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "addObject:", v14);

          }
        }
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      }
      while (v8);
    }

  }
  else
  {
    _HKInitializeLogging();
    v15 = *MEMORY[0x24BDD3070];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3070], OS_LOG_TYPE_ERROR))
      __52__WDDeviceSourcesListTableViewSection_reloadDevices__block_invoke_211_cold_1((uint64_t)v6, v15, v16, v17, v18, v19, v20, v21);
  }
  v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD3B28]), "initWithHealthStore:", *(_QWORD *)(a1 + 32));
  v23 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  v25[0] = MEMORY[0x24BDAC760];
  v25[1] = 3221225472;
  v25[2] = __52__WDDeviceSourcesListTableViewSection_reloadDevices__block_invoke_213;
  v25[3] = &unk_24D38E650;
  objc_copyWeak(&v26, (id *)(a1 + 56));
  v24 = *MEMORY[0x24BDD2B70];
  v25[4] = *(_QWORD *)(a1 + 40);
  objc_msgSend(v22, "fetchGymkitAndBluetoothDevicesMatchingValues:forProperty:completion:", v23, v24, v25);
  objc_destroyWeak(&v26);

}

void __52__WDDeviceSourcesListTableViewSection_reloadDevices__block_invoke_213(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD block[5];
  id v6;
  id v7;

  v3 = a2;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __52__WDDeviceSourcesListTableViewSection_reloadDevices__block_invoke_2;
  block[3] = &unk_24D38E628;
  objc_copyWeak(&v7, (id *)(a1 + 40));
  block[4] = *(_QWORD *)(a1 + 32);
  v6 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

  objc_destroyWeak(&v7);
}

void __52__WDDeviceSourcesListTableViewSection_reloadDevices__block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v2 = *(void **)(a1 + 40);
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56);
  objc_msgSend(v2, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "setSources:devices:", v3, v4);

}

- (void)setSources:(id)a3 devices:(id)a4
{
  id v7;
  id v8;
  void *v9;
  NSArray *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  char v18;
  WDSource *v19;
  NSMutableSet *identifiers;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  void *v28;
  void *v29;
  char v30;
  NSMutableSet *v31;
  void *v32;
  WDSource *v33;
  NSArray *list;
  void *v35;
  void *v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  objc_storeStrong((id *)&self->_sources, a3);
  objc_storeStrong((id *)&self->_devices, a4);
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDDeviceSourcesListTableViewSection setIdentifiers:](self, "setIdentifiers:", v9);

  v10 = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v8, "count") + objc_msgSend(v7, "count"));
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v11 = v7;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v42;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v42 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
        objc_msgSend(v16, "source");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "_isConnectedGymSource");

        if ((v18 & 1) == 0)
        {
          v19 = -[WDSource initWithSource:device:]([WDSource alloc], "initWithSource:device:", v16, 0);
          -[NSArray addObject:](v10, "addObject:", v19);

          identifiers = self->_identifiers;
          objc_msgSend(v16, "source");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "bundleIdentifier");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableSet addObject:](identifiers, "addObject:", v22);

        }
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
    }
    while (v13);
  }
  v36 = v11;

  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v23 = v8;
  v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
  if (v24)
  {
    v25 = v24;
    v26 = *(_QWORD *)v38;
    do
    {
      for (j = 0; j != v25; ++j)
      {
        if (*(_QWORD *)v38 != v26)
          objc_enumerationMutation(v23);
        v28 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * j);
        objc_msgSend(MEMORY[0x24BDD3AF8], "localDevice");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = objc_msgSend(v28, "isEqual:", v29);

        if ((v30 & 1) == 0
          && (!objc_msgSend(v28, "_isAppleManufacturer")
           || !objc_msgSend(v28, "_isAppleModel")
           || (objc_msgSend(v28, "_isAppleHardwareVersion") & 1) == 0))
        {
          v31 = self->_identifiers;
          objc_msgSend(v28, "localIdentifier");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          LOBYTE(v31) = -[NSMutableSet containsObject:](v31, "containsObject:", v32);

          if ((v31 & 1) == 0)
          {
            v33 = -[WDSource initWithSource:device:]([WDSource alloc], "initWithSource:device:", 0, v28);
            -[NSArray addObject:](v10, "addObject:", v33);

          }
        }
      }
      v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
    }
    while (v25);
  }

  -[NSArray sortUsingComparator:](v10, "sortUsingComparator:", &__block_literal_global_14);
  list = self->_list;
  self->_list = v10;

  -[WDTableViewSection delegate](self, "delegate");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "reloadTable");

}

uint64_t __58__WDDeviceSourcesListTableViewSection_setSources_devices___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "localizedCaseInsensitiveCompare:", v6);
  return v7;
}

- (id)_sourceForRow:(int64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_list, "objectAtIndexedSubscript:", a3);
}

- (void)applicationWillEnterForeground
{
  objc_super v3;

  -[WDDeviceSourcesListTableViewSection reloadDevices](self, "reloadDevices");
  v3.receiver = self;
  v3.super_class = (Class)WDDeviceSourcesListTableViewSection;
  -[WDTableViewSection applicationWillEnterForeground](&v3, sel_applicationWillEnterForeground);
}

- (unint64_t)numberOfRows
{
  unint64_t result;

  result = -[NSArray count](self->_list, "count");
  if (result <= 1)
    return 1;
  return result;
}

- (id)titleForHeader
{
  void *v2;
  void *v3;

  WDBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("DEVICES_LIST_HEADER"), &stru_24D38E7C8, CFSTR("WellnessDashboard-Localizable"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)titleForFooter
{
  return 0;
}

- (id)noneString
{
  void *v2;
  void *v3;

  WDBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("DEVICES_NONE"), &stru_24D38E7C8, CFSTR("WellnessDashboard-Localizable"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)cellForRow:(unint64_t)a3 table:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = a4;
  -[WDDeviceSourcesListTableViewSection identifiers](self, "identifiers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    if (-[NSArray count](self->_list, "count"))
      -[WDDeviceSourcesListTableViewSection _sourceCellForRow:tableView:](self, "_sourceCellForRow:tableView:", a3, v6);
    else
      -[WDSourcesListTableViewSection noneCellForTableView:](self, "noneCellForTableView:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[WDSpinnerTableViewCell defaultReuseIdentifier](WDSpinnerTableViewCell, "defaultReuseIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dequeueReusableCellWithIdentifier:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v9;
}

- (id)_sourceCellForRow:(unint64_t)a3 tableView:(id)a4
{
  id v6;
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
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  id v27;
  id v28;
  _QWORD v30[4];
  id v31;
  id v32;
  id v33;
  id v34;
  _QWORD v35[4];
  id v36;
  id location;

  v6 = a4;
  objc_msgSend(v6, "dequeueReusableCellWithIdentifier:", CFSTR("WDSourcesListTableViewSectionSource"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6E60]), "initWithStyle:reuseIdentifier:", 0, CFSTR("WDSourcesListTableViewSectionSource"));
    objc_msgSend(v7, "setAccessoryType:", 1);
  }
  -[WDDeviceSourcesListTableViewSection _sourceForRow:](self, "_sourceForRow:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "name");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "textLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setText:", v9);

  objc_msgSend(MEMORY[0x24BDF6A70], "hk_preferredFontForTextStyle:", *MEMORY[0x24BDF77B0]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "textLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setFont:", v11);

  objc_msgSend(v8, "device");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_msgSend(MEMORY[0x24BE4A2B0], "sharedImageManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "device");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "iconForDevice:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "imageView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setImage:", v16);

  }
  else
  {
    objc_msgSend(v8, "sourceModel");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "icon");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "sourceModel");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v20;
    if (v19)
    {
      objc_msgSend(v20, "icon");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "imageView");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setImage:", v22);

    }
    else
    {
      objc_msgSend(v20, "source");
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      objc_initWeak(&location, self);
      objc_msgSend(MEMORY[0x24BE4A2B0], "sharedImageManager");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = MEMORY[0x24BDAC760];
      v35[0] = MEMORY[0x24BDAC760];
      v35[1] = 3221225472;
      v35[2] = __67__WDDeviceSourcesListTableViewSection__sourceCellForRow_tableView___block_invoke;
      v35[3] = &unk_24D38CF38;
      v27 = v7;
      v36 = v27;
      v30[0] = v26;
      v30[1] = 3221225472;
      v30[2] = __67__WDDeviceSourcesListTableViewSection__sourceCellForRow_tableView___block_invoke_2;
      v30[3] = &unk_24D38CF88;
      objc_copyWeak(&v34, &location);
      v28 = v24;
      v31 = v28;
      v32 = v27;
      v33 = v6;
      objc_msgSend(v25, "loadIconForSource:syncHandler:asyncHandler:", v28, v35, v30);

      objc_destroyWeak(&v34);
      objc_destroyWeak(&location);

    }
  }

  return v7;
}

void __67__WDDeviceSourcesListTableViewSection__sourceCellForRow_tableView___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "imageView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setImage:", v3);

}

void __67__WDDeviceSourcesListTableViewSection__sourceCellForRow_tableView___block_invoke_2(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;

  v5 = a2;
  v6 = a3;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __67__WDDeviceSourcesListTableViewSection__sourceCellForRow_tableView___block_invoke_3;
  v9[3] = &unk_24D38CF60;
  objc_copyWeak(&v15, a1 + 7);
  v10 = v5;
  v11 = a1[4];
  v12 = a1[5];
  v13 = a1[6];
  v14 = v6;
  v7 = v6;
  v8 = v5;
  dispatch_async(MEMORY[0x24BDAC9B8], v9);

  objc_destroyWeak(&v15);
}

void __67__WDDeviceSourcesListTableViewSection__sourceCellForRow_tableView___block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  objc_msgSend(WeakRetained, "_handleReturnedImage:forSource:cell:tableView:fetchError:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));

}

- (void)_handleReturnedImage:(id)a3 forSource:(id)a4 cell:(id)a5 tableView:(id)a6 fetchError:(id)a7
{
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v19 = a3;
  v12 = a5;
  if (v19 && !a7)
  {
    v13 = a4;
    objc_msgSend(a6, "indexPathForCell:", v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[WDDeviceSourcesListTableViewSection _sourceForRow:](self, "_sourceForRow:", objc_msgSend(v14, "row"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "sourceModel");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "source");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    LODWORD(v15) = objc_msgSend(v17, "isEqual:", v13);
    if ((_DWORD)v15)
    {
      objc_msgSend(v12, "imageView");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setImage:", v19);

    }
  }

}

- (id)willSelectRow:(id)a3
{
  return a3;
}

- (void)didSelectRow:(unint64_t)a3 representedByCell:(id)a4 withCompletion:(id)a5
{
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  __objc2_class *v12;
  void *v13;
  void *v14;
  WDDeviceStoredDataViewController *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  const __CFString *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  void (**v37)(id, uint64_t, _QWORD);

  v37 = (void (**)(id, uint64_t, _QWORD))a5;
  -[WDDeviceSourcesListTableViewSection list](self, "list");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v8 > a3)
  {
    -[WDDeviceSourcesListTableViewSection _sourceForRow:](self, "_sourceForRow:", a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "sourceModel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "source");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v11)
    {
      objc_msgSend(v9, "device");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v13;
      if (v13 && objc_msgSend(v13, "_isConnectedGymDevice"))
      {
        v15 = -[HKTableViewController initWithUsingInsetStyling:]([WDDeviceStoredDataViewController alloc], "initWithUsingInsetStyling:", 1);
        -[WDDeviceStoredDataViewController setDevice:](v15, "setDevice:", v14);
        objc_msgSend(v14, "_connectedGymDeviceFullName");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[WDDeviceStoredDataViewController setDisplayName:](v15, "setDisplayName:", v16);

        -[WDTableViewSection delegate](self, "delegate");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "profile");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[WDStoredDataByCategoryViewController setProfile:](v15, "setProfile:", v18);

        -[WDTableViewSection delegate](self, "delegate");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "pushViewController:", v15);
      }
      else
      {
        v15 = -[HKTableViewController initWithUsingInsetStyling:]([WDDeviceStoredDataViewController alloc], "initWithUsingInsetStyling:", 1);
        -[WDDeviceStoredDataViewController setDevice:](v15, "setDevice:", v14);
        objc_msgSend(v14, "name");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        if (v22)
        {
          -[WDDeviceStoredDataViewController setDisplayName:](v15, "setDisplayName:", v22);
        }
        else
        {
          objc_msgSend(v14, "model");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          if (v28)
          {
            -[WDDeviceStoredDataViewController setDisplayName:](v15, "setDisplayName:", v28);
          }
          else
          {
            objc_msgSend(v14, "manufacturer");
            v29 = objc_claimAutoreleasedReturnValue();
            v30 = (void *)v29;
            if (v29)
              v31 = (const __CFString *)v29;
            else
              v31 = &stru_24D38E7C8;
            -[WDDeviceStoredDataViewController setDisplayName:](v15, "setDisplayName:", v31);

          }
        }

        -[WDTableViewSection delegate](self, "delegate");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "profile");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        -[WDStoredDataByCategoryViewController setProfile:](v15, "setProfile:", v33);

        v34 = objc_alloc(MEMORY[0x24BDD1880]);
        objc_msgSend(v14, "localIdentifier");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = (void *)objc_msgSend(v34, "initWithUUIDString:", v35);

        if (v19)
          -[WDStoredDataByCategoryViewController setIsBluetoothDevice:](v15, "setIsBluetoothDevice:", 1);
        -[WDStoredDataByCategoryViewController setDeviceIdentifier:](v15, "setDeviceIdentifier:", v19);
        -[WDTableViewSection delegate](self, "delegate");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "pushViewController:", v15);

      }
      goto LABEL_27;
    }
    if (objc_msgSend(v11, "_isAppleWatch"))
    {
      v12 = WDWatchStoredDataViewController;
    }
    else
    {
      if (!objc_msgSend(v11, "_hasFirstPartyBundleID"))
      {
        v23 = objc_alloc(MEMORY[0x24BE4A890]);
        -[WDTableViewSection delegate](self, "delegate");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "profile");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "healthStore");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        -[WDTableViewSection delegate](self, "delegate");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "profile");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "displayTypeController");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = (void *)objc_msgSend(v23, "initWithHealthStore:displayTypeController:source:useInsetStyling:", v24, v27, v11, 1);

        goto LABEL_15;
      }
      v12 = WDLocalDeviceStoredDataViewController;
    }
    v14 = (void *)objc_msgSend([v12 alloc], "initWithUsingInsetStyling:", 1);
    objc_msgSend(v14, "setSource:", v11);
    -[WDTableViewSection delegate](self, "delegate");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "profile");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setProfile:", v21);
LABEL_15:

    -[WDTableViewSection delegate](self, "delegate");
    v15 = (WDDeviceStoredDataViewController *)objc_claimAutoreleasedReturnValue();
    -[WDDeviceStoredDataViewController pushViewController:](v15, "pushViewController:", v14);
LABEL_27:

    v37[2](v37, 1, 0);
    goto LABEL_28;
  }
  v37[2](v37, 1, 1);
LABEL_28:

}

- (NSArray)list
{
  return self->_list;
}

- (void)setList:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSArray)sources
{
  return self->_sources;
}

- (void)setSources:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSArray)devices
{
  return self->_devices;
}

- (void)setDevices:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSMutableSet)identifiers
{
  return self->_identifiers;
}

- (void)setIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_identifiers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifiers, 0);
  objc_storeStrong((id *)&self->_devices, 0);
  objc_storeStrong((id *)&self->_sources, 0);
  objc_storeStrong((id *)&self->_list, 0);
}

void __52__WDDeviceSourcesListTableViewSection_reloadDevices__block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_215814000, a2, a3, "Unable to retrieve Bluetooth devices, %{public}@", a5, a6, a7, a8, 2u);
}

void __52__WDDeviceSourcesListTableViewSection_reloadDevices__block_invoke_211_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_215814000, a2, a3, "BTLE services not returned, %{public}@", a5, a6, a7, a8, 2u);
}

@end
