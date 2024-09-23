@implementation HFAccessorySettingDataAnalyticsAdapter

- (HFAccessorySettingDataAnalyticsAdapter)initWithHomeKitSettingsVendor:(id)a3 mode:(unint64_t)a4
{
  id v7;
  void *v8;
  HFAccessorySettingDataAnalyticsAdapter *v9;
  void *v11;
  objc_super v12;

  v7 = a3;
  if (a4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFAccessorySettingDataAnalyticsAdapter.m"), 21, CFSTR("Data Analytics adapter does not do what you think it does."));

  }
  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12.receiver = self;
  v12.super_class = (Class)HFAccessorySettingDataAnalyticsAdapter;
  v9 = -[HFAccessorySettingAdapter initWithHomeKitSettingsVendor:keyPaths:mode:updateHandler:](&v12, sel_initWithHomeKitSettingsVendor_keyPaths_mode_updateHandler_, v7, v8, a4, 0);

  return v9;
}

- (BOOL)shouldShowSettingsEntity:(id)a3
{
  void *v4;
  BOOL v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;

  -[HFAccessorySettingAdapter homeKitSettingsVendor](self, "homeKitSettingsVendor", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isItemGroup") & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    -[HFAccessorySettingAdapter homeKitSettingsVendor](self, "homeKitSettingsVendor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "conformsToProtocol:", &unk_1F0449888))
      v7 = v6;
    else
      v7 = 0;
    v8 = v7;

    objc_msgSend(v8, "hf_idsDeviceIdentifierWithError:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = v9 != 0;
  }

  return v5;
}

- (id)customizeSections:(id)a3 forEntity:(id)a4
{
  id v5;
  id v6;
  void *v7;
  int v8;
  void *v9;
  id v10;
  HFMutableItemSection *v11;
  HFMutableItemSection *v12;
  void *v13;
  id v14;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, void *);
  void *v19;
  id v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "keyPath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("root.general.analytics"));

  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 0;
    v23 = &v22;
    v24 = 0x3032000000;
    v25 = __Block_byref_object_copy__3;
    v26 = __Block_byref_object_dispose__3;
    v27 = 0;
    v16 = MEMORY[0x1E0C809B0];
    v17 = 3221225472;
    v18 = __70__HFAccessorySettingDataAnalyticsAdapter_customizeSections_forEntity___block_invoke;
    v19 = &unk_1EA7295E0;
    v10 = v9;
    v20 = v10;
    v21 = &v22;
    objc_msgSend(v5, "na_each:", &v16);
    if (v23[5])
    {
      v11 = [HFMutableItemSection alloc];
      v12 = -[HFItemSection initWithIdentifier:](v11, "initWithIdentifier:", CFSTR("COLLECT_SYSDIAGNOSE_SECTION"), v16, v17, v18, v19);
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v23[5]);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[HFItemSection setItems:](v12, "setItems:", v13);

      objc_msgSend(v10, "addObject:", v12);
    }
    v14 = v10;

    _Block_object_dispose(&v22, 8);
    v5 = v14;
  }

  return v5;
}

void __70__HFAccessorySettingDataAnalyticsAdapter_customizeSections_forEntity___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id obj;
  _QWORD v9[4];
  id v10;

  v3 = a2;
  objc_msgSend(v3, "items");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "na_firstObjectPassingTest:", &__block_literal_global_24);
  obj = (id)objc_claimAutoreleasedReturnValue();

  if (obj)
  {
    v5 = (void *)objc_msgSend(v3, "mutableCopy");

    objc_msgSend(v5, "items");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __70__HFAccessorySettingDataAnalyticsAdapter_customizeSections_forEntity___block_invoke_3;
    v9[3] = &unk_1EA7295B8;
    v10 = obj;
    objc_msgSend(v6, "na_filter:", v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setItems:", v7);

    objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);

    v3 = v5;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);
  }

}

uint64_t __70__HFAccessorySettingDataAnalyticsAdapter_customizeSections_forEntity___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "latestResults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("HFAccessorySettingGroupKeyPathKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("root.general.analytics.sysdiagnose"));

  return v4;
}

BOOL __70__HFAccessorySettingDataAnalyticsAdapter_customizeSections_forEntity___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return *(_QWORD *)(a1 + 32) != a2;
}

@end
