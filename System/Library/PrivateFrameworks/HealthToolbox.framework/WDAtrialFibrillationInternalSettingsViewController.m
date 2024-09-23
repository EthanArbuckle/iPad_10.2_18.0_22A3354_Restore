@implementation WDAtrialFibrillationInternalSettingsViewController

- (WDAtrialFibrillationInternalSettingsViewController)initWithHealthStore:(id)a3
{
  id v5;
  WDAtrialFibrillationInternalSettingsViewController *v6;
  WDAtrialFibrillationInternalSettingsViewController *v7;
  id v8;
  uint64_t v9;
  HKKeyValueDomain *keyValueDomain;
  NSArray *sections;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)WDAtrialFibrillationInternalSettingsViewController;
  v6 = -[WDAtrialFibrillationInternalSettingsViewController initWithStyle:](&v13, sel_initWithStyle_, 1);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_healthStore, a3);
    v8 = objc_alloc(MEMORY[0x24BDD3C98]);
    v9 = objc_msgSend(v8, "initWithCategory:domainName:healthStore:", 0, *MEMORY[0x24BDD4678], v5);
    keyValueDomain = v7->_keyValueDomain;
    v7->_keyValueDomain = (HKKeyValueDomain *)v9;

    sections = v7->_sections;
    v7->_sections = (NSArray *)&unk_24D3A62A8;

  }
  return v7;
}

- (id)makeFeatureStateViewControllerForFeatureIdentifier:(id)a3
{
  return objc_alloc_init(MEMORY[0x24BDF6F98]);
}

- (void)_showFeatureStateViewControllerForFeatureIdentifier:(id)a3
{
  id v4;

  -[WDAtrialFibrillationInternalSettingsViewController makeFeatureStateViewControllerForFeatureIdentifier:](self, "makeFeatureStateViewControllerForFeatureIdentifier:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[WDAtrialFibrillationInternalSettingsViewController showViewController:sender:](self, "showViewController:sender:", v4, self);

}

- (id)_buttonCellForTableView:(id)a3 text:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = a4;
  objc_msgSend(a3, "dequeueReusableCellWithIdentifier:", CFSTR("ButtonCell"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6E60]), "initWithStyle:reuseIdentifier:", 0, CFSTR("ButtonCell"));
    objc_msgSend(MEMORY[0x24BDF6950], "hk_appKeyColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "textLabel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setTextColor:", v7);

  }
  objc_msgSend(v6, "textLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setText:", v5);

  return v6;
}

- (void)_resetOnboarding
{
  void *v3;
  NSObject *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  _QWORD v10[5];
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  _HKInitializeLogging();
  v3 = (void *)*MEMORY[0x24BDD3010];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3010], OS_LOG_TYPE_DEFAULT))
  {
    v4 = v3;
    *(_DWORD *)buf = 138543362;
    v12 = (id)objc_opt_class();
    v5 = v12;
    _os_log_impl(&dword_215814000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: Resetting onboarding", buf, 0xCu);

  }
  v6 = objc_alloc(MEMORY[0x24BDD3BE0]);
  v7 = *MEMORY[0x24BDD2E00];
  -[WDAtrialFibrillationInternalSettingsViewController healthStore](self, "healthStore");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v6, "initWithFeatureIdentifier:healthStore:", v7, v8);

  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __70__WDAtrialFibrillationInternalSettingsViewController__resetOnboarding__block_invoke;
  v10[3] = &unk_24D38CFB0;
  v10[4] = self;
  objc_msgSend(v9, "resetOnboardingWithCompletion:", v10);

}

void __70__WDAtrialFibrillationInternalSettingsViewController__resetOnboarding__block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  _QWORD v10[5];
  _QWORD v11[5];

  v5 = a3;
  if ((a2 & 1) == 0)
  {
    _HKInitializeLogging();
    v6 = (void *)*MEMORY[0x24BDD3010];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3010], OS_LOG_TYPE_ERROR))
      __70__WDAtrialFibrillationInternalSettingsViewController__resetOnboarding__block_invoke_cold_1(a1, v6);
  }
  objc_msgSend(*(id *)(a1 + 32), "keyValueDomain");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", *MEMORY[0x24BDD4688]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x24BDAC760];
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __70__WDAtrialFibrillationInternalSettingsViewController__resetOnboarding__block_invoke_192;
  v11[3] = &unk_24D38CFB0;
  v11[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v7, "removeValuesForKeys:completion:", v8, v11);

  v10[0] = v9;
  v10[1] = 3221225472;
  v10[2] = __70__WDAtrialFibrillationInternalSettingsViewController__resetOnboarding__block_invoke_194;
  v10[3] = &unk_24D38D000;
  v10[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x24BDAC9B8], v10);

}

void __70__WDAtrialFibrillationInternalSettingsViewController__resetOnboarding__block_invoke_192(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;

  v5 = a3;
  if ((a2 & 1) == 0)
  {
    _HKInitializeLogging();
    v6 = (void *)*MEMORY[0x24BDD3010];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3010], OS_LOG_TYPE_ERROR))
      __70__WDAtrialFibrillationInternalSettingsViewController__resetOnboarding__block_invoke_192_cold_1(a1, v6);
  }

}

void __70__WDAtrialFibrillationInternalSettingsViewController__resetOnboarding__block_invoke_194(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "tableView");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "reloadData");

}

- (void)_deleteAllNotifications
{
  void *v3;
  NSObject *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[5];
  void *v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  _HKInitializeLogging();
  v3 = (void *)*MEMORY[0x24BDD3010];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3010], OS_LOG_TYPE_DEFAULT))
  {
    v4 = v3;
    *(_DWORD *)buf = 138543362;
    v12 = (id)objc_opt_class();
    v5 = v12;
    _os_log_impl(&dword_215814000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: Deleting all notifications", buf, 0xCu);

  }
  -[WDAtrialFibrillationInternalSettingsViewController setDeletingSamples:](self, "setDeletingSamples:", 1);
  -[WDAtrialFibrillationInternalSettingsViewController healthStore](self, "healthStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD3990], "atrialFibrillationEventType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v7;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v10, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __77__WDAtrialFibrillationInternalSettingsViewController__deleteAllNotifications__block_invoke;
  v9[3] = &unk_24D38CFB0;
  v9[4] = self;
  objc_msgSend(v6, "deleteAllSamplesWithTypes:sourceBundleIdentifier:options:completion:", v8, 0, 2, v9);

}

void __77__WDAtrialFibrillationInternalSettingsViewController__deleteAllNotifications__block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  _QWORD block[5];

  v5 = a3;
  if ((a2 & 1) == 0)
  {
    _HKInitializeLogging();
    v6 = (void *)*MEMORY[0x24BDD3010];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3010], OS_LOG_TYPE_ERROR))
      __77__WDAtrialFibrillationInternalSettingsViewController__deleteAllNotifications__block_invoke_cold_1(a1, v6);
  }
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __77__WDAtrialFibrillationInternalSettingsViewController__deleteAllNotifications__block_invoke_198;
  block[3] = &unk_24D38D000;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

uint64_t __77__WDAtrialFibrillationInternalSettingsViewController__deleteAllNotifications__block_invoke_198(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setDeletingSamples:", 0);
}

- (void)_deleteAllNotificationsAndTachograms
{
  void *v3;
  NSObject *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[5];
  _QWORD v11[2];
  uint8_t buf[4];
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  _HKInitializeLogging();
  v3 = (void *)*MEMORY[0x24BDD3010];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3010], OS_LOG_TYPE_DEFAULT))
  {
    v4 = v3;
    *(_DWORD *)buf = 138543362;
    v13 = (id)objc_opt_class();
    v5 = v13;
    _os_log_impl(&dword_215814000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: Deleting all atrial fibrillation event and tachogram samples", buf, 0xCu);

  }
  objc_msgSend(MEMORY[0x24BDD3990], "atrialFibrillationEventType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v6;
  objc_msgSend(MEMORY[0x24BDD3F28], "heartbeatSeriesType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v7;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[WDAtrialFibrillationInternalSettingsViewController setDeletingSamples:](self, "setDeletingSamples:", 1);
  -[WDAtrialFibrillationInternalSettingsViewController healthStore](self, "healthStore");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __90__WDAtrialFibrillationInternalSettingsViewController__deleteAllNotificationsAndTachograms__block_invoke;
  v10[3] = &unk_24D38CFB0;
  v10[4] = self;
  objc_msgSend(v9, "deleteAllSamplesWithTypes:sourceBundleIdentifier:options:completion:", v8, 0, 2, v10);

}

void __90__WDAtrialFibrillationInternalSettingsViewController__deleteAllNotificationsAndTachograms__block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  _QWORD block[5];

  v5 = a3;
  if ((a2 & 1) == 0)
  {
    _HKInitializeLogging();
    v6 = (void *)*MEMORY[0x24BDD3010];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3010], OS_LOG_TYPE_ERROR))
      __90__WDAtrialFibrillationInternalSettingsViewController__deleteAllNotificationsAndTachograms__block_invoke_cold_1(a1, v6);
  }
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __90__WDAtrialFibrillationInternalSettingsViewController__deleteAllNotificationsAndTachograms__block_invoke_200;
  block[3] = &unk_24D38D000;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

uint64_t __90__WDAtrialFibrillationInternalSettingsViewController__deleteAllNotificationsAndTachograms__block_invoke_200(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setDeletingSamples:", 0);
}

- (void)_fakeNewAnalyzedSample
{
  void *v2;
  id v3;

  -[WDAtrialFibrillationInternalSettingsViewController keyValueDomain](self, "keyValueDomain");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDate:forKey:completion:", v2, *MEMORY[0x24BDD4688], &__block_literal_global_5);

}

- (void)_addNewSample
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  HKHealthStore *healthStore;
  id v10;
  _QWORD v11[5];
  id v12;

  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dateByAddingTimeInterval:", 0.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x24BDD3988];
  objc_msgSend(MEMORY[0x24BDD3990], "atrialFibrillationEventType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD3AF8], "localDevice");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "categorySampleWithType:value:startDate:endDate:device:metadata:", v6, 0, v4, v3, v7, MEMORY[0x24BDBD1B8]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  healthStore = self->_healthStore;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __67__WDAtrialFibrillationInternalSettingsViewController__addNewSample__block_invoke;
  v11[3] = &unk_24D38DA38;
  v11[4] = self;
  v12 = v8;
  v10 = v8;
  -[HKHealthStore saveObject:withCompletion:](healthStore, "saveObject:withCompletion:", v10, v11);

}

void __67__WDAtrialFibrillationInternalSettingsViewController__addNewSample__block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  _BOOL4 v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  int v18;
  id v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if ((a2 & 1) != 0)
  {
    _HKInitializeLogging();
    v6 = (void *)*MEMORY[0x24BDD3010];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3010], OS_LOG_TYPE_DEFAULT))
    {
      v7 = v6;
      v8 = (void *)objc_opt_class();
      v9 = *(void **)(a1 + 40);
      v10 = v8;
      objc_msgSend(v9, "UUID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138543618;
      v19 = v8;
      v20 = 2114;
      v21 = v11;
      _os_log_impl(&dword_215814000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: Saved AFib event with UUID %{public}@", (uint8_t *)&v18, 0x16u);

LABEL_9:
    }
  }
  else
  {
    _HKInitializeLogging();
    v12 = (void *)*MEMORY[0x24BDD3010];
    v13 = os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3010], OS_LOG_TYPE_DEFAULT);
    if (v5)
    {
      if (v13)
      {
        v7 = v12;
        v14 = (void *)objc_opt_class();
        v15 = v14;
        objc_msgSend(v5, "localizedDescription");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = 138543618;
        v19 = v14;
        v20 = 2114;
        v21 = v16;
        _os_log_impl(&dword_215814000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: Failed to save AFib event with error: %{public}@", (uint8_t *)&v18, 0x16u);

        goto LABEL_9;
      }
    }
    else if (v13)
    {
      v7 = v12;
      v18 = 138543362;
      v19 = (id)objc_opt_class();
      v17 = v19;
      _os_log_impl(&dword_215814000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: Failed to save AFib event", (uint8_t *)&v18, 0xCu);

      goto LABEL_9;
    }
  }

}

- (id)_featureAvailabilityStatusString
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v29;
  id v30;
  id v31;
  id v32;

  v3 = objc_alloc(MEMORY[0x24BDD3BE0]);
  v4 = *MEMORY[0x24BDD2E00];
  -[WDAtrialFibrillationInternalSettingsViewController healthStore](self, "healthStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFeatureIdentifier:healthStore:", v4, v5);

  v32 = 0;
  objc_msgSend(v6, "onboardedCountryCodeSupportedStateWithError:", &v32);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v32;
  v9 = objc_alloc(MEMORY[0x24BDD3BE0]);
  v10 = *MEMORY[0x24BDD2E08];
  -[WDAtrialFibrillationInternalSettingsViewController healthStore](self, "healthStore");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v9, "initWithFeatureIdentifier:healthStore:", v10, v11);

  v31 = v8;
  objc_msgSend(v12, "onboardedCountryCodeSupportedStateWithError:", &v31);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v31;

  v15 = objc_alloc(MEMORY[0x24BDD3BE0]);
  v16 = *MEMORY[0x24BDD2E10];
  -[WDAtrialFibrillationInternalSettingsViewController healthStore](self, "healthStore");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v15, "initWithFeatureIdentifier:healthStore:", v16, v17);

  v30 = v14;
  objc_msgSend(v18, "onboardedCountryCodeSupportedStateWithError:", &v30);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v30;

  if (v20)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Error determining feature state: %@"), v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[WDAtrialFibrillationInternalSettingsViewController _featureAvailabilityStringForFeatureName:onboardedCountryCodeSupportedState:](self, "_featureAvailabilityStringForFeatureName:onboardedCountryCodeSupportedState:", CFSTR("IRN (Combined)"), v7);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[WDAtrialFibrillationInternalSettingsViewController _featureAvailabilityStringForFeatureName:onboardedCountryCodeSupportedState:](self, "_featureAvailabilityStringForFeatureName:onboardedCountryCodeSupportedState:", CFSTR("IRN 1.0"), v13);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[WDAtrialFibrillationInternalSettingsViewController _featureAvailabilityStringForFeatureName:onboardedCountryCodeSupportedState:](self, "_featureAvailabilityStringForFeatureName:onboardedCountryCodeSupportedState:", CFSTR("IRN 2.0"), v19);
    v29 = v12;
    v24 = v13;
    v25 = v6;
    v26 = v7;
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@\n%@\n%@"), v22, v23, v27);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = v26;
    v6 = v25;
    v13 = v24;
    v12 = v29;

  }
  return v21;
}

- (id)_featureAvailabilityStringForFeatureName:(id)a3 onboardedCountryCodeSupportedState:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  if (a4)
  {
    v5 = a3;
    objc_msgSend(a4, "integerValue");
    NSStringFromHKFeatureAvailabilityOnboardedCountrySupportedState();
    v6 = (id)objc_claimAutoreleasedReturnValue();
    v7 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v6, "lowercaseString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", CFSTR("%@ is %@."), v5, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = (void *)MEMORY[0x24BDD17C8];
    v6 = a3;
    objc_msgSend(v10, "stringWithFormat:", CFSTR("%@: Unknown state."), v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return -[NSArray count](self->_sections, "count", a3);
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v4;
  uint64_t v5;
  int64_t v6;

  -[NSArray objectAtIndexedSubscript:](self->_sections, "objectAtIndexedSubscript:", a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "integerValue");

  v6 = 3;
  if (v5 != 1)
    v6 = 0;
  if (v5)
    return v6;
  else
    return 5;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  const __CFString *v10;
  uint64_t v11;
  objc_class *v12;
  void *v13;
  void *v14;

  v6 = a3;
  v7 = a4;
  -[NSArray objectAtIndexedSubscript:](self->_sections, "objectAtIndexedSubscript:", objc_msgSend(v7, "section"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "integerValue");

  if (v9 != 1)
  {
    if (!v9)
    {
      switch(objc_msgSend(v7, "row"))
      {
        case 0:
          v10 = CFSTR("Reset Onboarding");
          goto LABEL_16;
        case 1:
          v10 = CFSTR("Delete All IRN Samples");
          goto LABEL_16;
        case 2:
          v10 = CFSTR("Delete All IRN and Tachogram Samples");
          goto LABEL_16;
        case 3:
          v10 = CFSTR("Analyze New Sample");
          goto LABEL_16;
        case 4:
          v10 = CFSTR("Add New Sample");
          goto LABEL_16;
        default:
          goto LABEL_5;
      }
    }
    goto LABEL_9;
  }
LABEL_5:
  v11 = objc_msgSend(v7, "row");
  switch(v11)
  {
    case 2:
      v10 = CFSTR("IRN 2.0 Feature State");
      goto LABEL_16;
    case 1:
      v10 = CFSTR("IRN 1.0 Feature State");
      goto LABEL_16;
    case 0:
      v10 = CFSTR("IRN (Combined) Feature State");
LABEL_16:
      -[WDAtrialFibrillationInternalSettingsViewController _buttonCellForTableView:text:](self, "_buttonCellForTableView:text:", v6, v10);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_17;
  }
LABEL_9:
  v12 = (objc_class *)objc_opt_class();
  NSStringFromClass(v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  HKErrorTableViewCell();
  v14 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_17:
  return v14;
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  id v5;
  _BOOL4 v6;

  v5 = a4;
  if (objc_msgSend(v5, "section") == 1)
  {
    LOBYTE(v6) = 1;
  }
  else
  {
    LOBYTE(v6) = 1;
    switch(objc_msgSend(v5, "row"))
    {
      case 0:
      case 4:
        break;
      case 1:
      case 2:
      case 3:
        v6 = !-[WDAtrialFibrillationInternalSettingsViewController deletingSamples](self, "deletingSamples");
        break;
      default:
        LOBYTE(v6) = 0;
        break;
    }
  }

  return v6;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  id v12;

  v12 = a4;
  -[WDAtrialFibrillationInternalSettingsViewController tableView](self, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "deselectRowAtIndexPath:animated:", v12, 1);

  -[NSArray objectAtIndexedSubscript:](self->_sections, "objectAtIndexedSubscript:", objc_msgSend(v12, "section"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "integerValue");

  if (v7 == 1)
  {
    v10 = objc_msgSend(v12, "row");
    if (v10 == 2)
    {
      v11 = (_QWORD *)MEMORY[0x24BDD2E10];
    }
    else if (v10 == 1)
    {
      v11 = (_QWORD *)MEMORY[0x24BDD2E08];
    }
    else
    {
      v8 = v12;
      if (v10)
        goto LABEL_13;
      v11 = (_QWORD *)MEMORY[0x24BDD2E00];
    }
    -[WDAtrialFibrillationInternalSettingsViewController _showFeatureStateViewControllerForFeatureIdentifier:](self, "_showFeatureStateViewControllerForFeatureIdentifier:", *v11);
LABEL_12:
    v8 = v12;
  }
  else
  {
    v8 = v12;
    if (!v7)
    {
      v9 = objc_msgSend(v12, "row");
      v8 = v12;
      switch(v9)
      {
        case 0:
          -[WDAtrialFibrillationInternalSettingsViewController _resetOnboarding](self, "_resetOnboarding");
          goto LABEL_12;
        case 1:
          -[WDAtrialFibrillationInternalSettingsViewController _deleteAllNotifications](self, "_deleteAllNotifications");
          goto LABEL_12;
        case 2:
          -[WDAtrialFibrillationInternalSettingsViewController _deleteAllNotificationsAndTachograms](self, "_deleteAllNotificationsAndTachograms");
          goto LABEL_12;
        case 3:
          -[WDAtrialFibrillationInternalSettingsViewController _fakeNewAnalyzedSample](self, "_fakeNewAnalyzedSample");
          goto LABEL_12;
        case 4:
          -[WDAtrialFibrillationInternalSettingsViewController _addNewSample](self, "_addNewSample");
          goto LABEL_12;
        default:
          break;
      }
    }
  }
LABEL_13:

}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  void *v5;
  uint64_t v6;
  void *v7;

  -[NSArray objectAtIndexedSubscript:](self->_sections, "objectAtIndexedSubscript:", a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "integerValue");

  if (v6 == 1)
  {
    -[WDAtrialFibrillationInternalSettingsViewController _featureAvailabilityStatusString](self, "_featureAvailabilityStatusString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (HKHealthStore)healthStore
{
  return self->_healthStore;
}

- (HKKeyValueDomain)keyValueDomain
{
  return self->_keyValueDomain;
}

- (BOOL)deletingSamples
{
  return self->_deletingSamples;
}

- (void)setDeletingSamples:(BOOL)a3
{
  self->_deletingSamples = a3;
}

- (NSArray)sections
{
  return self->_sections;
}

- (void)setSections:(id)a3
{
  objc_storeStrong((id *)&self->_sections, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sections, 0);
  objc_storeStrong((id *)&self->_keyValueDomain, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);
}

void __70__WDAtrialFibrillationInternalSettingsViewController__resetOnboarding__block_invoke_cold_1(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  OUTLINED_FUNCTION_2_0(a1, a2);
  v3 = (void *)OUTLINED_FUNCTION_2();
  v4 = OUTLINED_FUNCTION_0_0(v3);
  OUTLINED_FUNCTION_0(&dword_215814000, v5, v6, "%{public}@: Error resetting IRN onboarding: %{public}@", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_1();
}

void __70__WDAtrialFibrillationInternalSettingsViewController__resetOnboarding__block_invoke_192_cold_1(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  OUTLINED_FUNCTION_2_0(a1, a2);
  v3 = (void *)OUTLINED_FUNCTION_2();
  v4 = OUTLINED_FUNCTION_0_0(v3);
  OUTLINED_FUNCTION_0(&dword_215814000, v5, v6, "%{public}@: Error deleting last analyzed sample date: %{public}@", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_1();
}

void __77__WDAtrialFibrillationInternalSettingsViewController__deleteAllNotifications__block_invoke_cold_1(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  OUTLINED_FUNCTION_2_0(a1, a2);
  v3 = (void *)OUTLINED_FUNCTION_2();
  v4 = OUTLINED_FUNCTION_0_0(v3);
  OUTLINED_FUNCTION_0(&dword_215814000, v5, v6, "%{public}@: Error deleting atrial fibrillation event samples: %{public}@", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_1();
}

void __90__WDAtrialFibrillationInternalSettingsViewController__deleteAllNotificationsAndTachograms__block_invoke_cold_1(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  OUTLINED_FUNCTION_2_0(a1, a2);
  v3 = (void *)OUTLINED_FUNCTION_2();
  v4 = OUTLINED_FUNCTION_0_0(v3);
  OUTLINED_FUNCTION_0(&dword_215814000, v5, v6, "%{public}@: Error deleting atrial fibrillation event and tachogram samples: %{public}@", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_1();
}

@end
