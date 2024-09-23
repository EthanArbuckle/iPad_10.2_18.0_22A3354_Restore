@implementation HFHomePodAlarmItemProvider

- (HFHomePodAlarmItemProvider)initWithMediaProfileContainer:(id)a3
{
  id v5;
  HFHomePodAlarmItemProvider *v6;
  HFHomePodAlarmItemProvider *v7;
  void *v8;
  uint64_t v9;
  HFAccessorySettingMobileTimerAdapter *mobileTimerAdapter;
  uint64_t v11;
  NSMutableSet *alarmItems;
  uint64_t v13;
  NSMutableDictionary *alarmIDToItemMap;
  objc_super v16;

  v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)HFHomePodAlarmItemProvider;
  v6 = -[HFItemProvider init](&v16, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_mediaProfileContainer, a3);
    objc_msgSend(v5, "hf_settingsAdapterManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "adapterForIdentifier:", CFSTR("MobileTimerAdapter"));
    v9 = objc_claimAutoreleasedReturnValue();
    mobileTimerAdapter = v7->_mobileTimerAdapter;
    v7->_mobileTimerAdapter = (HFAccessorySettingMobileTimerAdapter *)v9;

    v11 = objc_opt_new();
    alarmItems = v7->_alarmItems;
    v7->_alarmItems = (NSMutableSet *)v11;

    v13 = objc_opt_new();
    alarmIDToItemMap = v7->_alarmIDToItemMap;
    v7->_alarmIDToItemMap = (NSMutableDictionary *)v13;

  }
  return v7;
}

- (id)items
{
  void *v2;
  void *v3;

  -[HFHomePodAlarmItemProvider alarmItems](self, "alarmItems");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return v3;
}

- (id)reloadItems
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[4];
  id v22;
  _QWORD v23[4];
  id v24;
  id v25;
  id location;

  objc_initWeak(&location, self);
  if (_os_feature_enabled_impl())
  {
    v3 = objc_alloc_init(MEMORY[0x1E0D519C0]);
    -[HFHomePodAlarmItemProvider mobileTimerAdapter](self, "mobileTimerAdapter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "allAlarmsFuture");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = MEMORY[0x1E0C809B0];
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __41__HFHomePodAlarmItemProvider_reloadItems__block_invoke;
    v23[3] = &unk_1EA731800;
    objc_copyWeak(&v25, &location);
    v7 = v3;
    v24 = v7;
    v8 = (id)objc_msgSend(v5, "addSuccessBlock:", v23);
    v21[0] = v6;
    v21[1] = 3221225472;
    v21[2] = __41__HFHomePodAlarmItemProvider_reloadItems__block_invoke_7;
    v21[3] = &unk_1EA726968;
    v9 = v7;
    v22 = v9;
    v10 = (id)objc_msgSend(v5, "addFailureBlock:", v21);
    v11 = v22;
    v12 = v9;

    objc_destroyWeak(&v25);
  }
  else
  {
    -[HFHomePodAlarmItemProvider mobileTimerAdapter](self, "mobileTimerAdapter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "allAlarms");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = MEMORY[0x1E0C809B0];
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __41__HFHomePodAlarmItemProvider_reloadItems__block_invoke_10;
    v19[3] = &unk_1EA73BF60;
    objc_copyWeak(&v20, &location);
    -[HFItemProvider reloadItemsWithObjects:keyAdaptor:itemAdaptor:filter:itemMap:](self, "reloadItemsWithObjects:keyAdaptor:itemAdaptor:filter:itemMap:", v13, &__block_literal_global_13_14, &__block_literal_global_14_12, 0, v19);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = v14;
    v17[1] = 3221225472;
    v17[2] = __41__HFHomePodAlarmItemProvider_reloadItems__block_invoke_11;
    v17[3] = &unk_1EA726E30;
    objc_copyWeak(&v18, &location);
    objc_msgSend(v15, "flatMap:", v17);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_destroyWeak(&v18);

    objc_destroyWeak(&v20);
  }

  objc_destroyWeak(&location);
  return v12;
}

void __41__HFHomePodAlarmItemProvider_reloadItems__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __41__HFHomePodAlarmItemProvider_reloadItems__block_invoke_4;
  v13[3] = &unk_1EA73BF60;
  objc_copyWeak(&v14, (id *)(a1 + 40));
  objc_msgSend(WeakRetained, "reloadItemsWithObjects:keyAdaptor:itemAdaptor:filter:itemMap:", v3, &__block_literal_global_185, &__block_literal_global_6_11, 0, v13);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v5;
  v11[1] = 3221225472;
  v11[2] = __41__HFHomePodAlarmItemProvider_reloadItems__block_invoke_5;
  v11[3] = &unk_1EA726E30;
  objc_copyWeak(&v12, (id *)(a1 + 40));
  objc_msgSend(v6, "flatMap:", v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v5;
  v9[1] = 3221225472;
  v9[2] = __41__HFHomePodAlarmItemProvider_reloadItems__block_invoke_6;
  v9[3] = &unk_1EA72CBB8;
  v10 = *(id *)(a1 + 32);
  v8 = (id)objc_msgSend(v7, "addCompletionBlock:", v9);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&v14);

}

uint64_t __41__HFHomePodAlarmItemProvider_reloadItems__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "alarmID");
}

id __41__HFHomePodAlarmItemProvider_reloadItems__block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "alarm");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "alarmID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

HFHomePodAlarmItem *__41__HFHomePodAlarmItemProvider_reloadItems__block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  HFHomePodAlarmItem *v10;
  HFHomePodAlarmItem *v11;
  void *v12;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "alarmIDToItemMap");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "alarmID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(WeakRetained, "alarmIDToItemMap");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "alarmID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", v9);
    v10 = (HFHomePodAlarmItem *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = [HFHomePodAlarmItem alloc];
    objc_msgSend(WeakRetained, "mediaProfileContainer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[HFHomePodAlarmItem initWithMediaProfileContainer:alarm:](v11, "initWithMediaProfileContainer:alarm:", v12, v3);

    objc_msgSend(WeakRetained, "alarmIDToItemMap");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "alarmID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v10, v9);
  }

  return v10;
}

id __41__HFHomePodAlarmItemProvider_reloadItems__block_invoke_5(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "alarmItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addedItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unionSet:", v6);

  objc_msgSend(WeakRetained, "alarmItems");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removedItems");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "minusSet:", v8);

  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

uint64_t __41__HFHomePodAlarmItemProvider_reloadItems__block_invoke_6(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;

  v3 = *(void **)(a1 + 32);
  if (a3)
    return objc_msgSend(v3, "finishWithError:");
  else
    return objc_msgSend(v3, "finishWithResult:", a2);
}

uint64_t __41__HFHomePodAlarmItemProvider_reloadItems__block_invoke_7(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithError:", a2);
}

uint64_t __41__HFHomePodAlarmItemProvider_reloadItems__block_invoke_8(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "alarmID");
}

id __41__HFHomePodAlarmItemProvider_reloadItems__block_invoke_9(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "alarm");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "alarmID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

HFHomePodAlarmItem *__41__HFHomePodAlarmItemProvider_reloadItems__block_invoke_10(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  HFHomePodAlarmItem *v10;
  HFHomePodAlarmItem *v11;
  void *v12;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "alarmIDToItemMap");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "alarmID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(WeakRetained, "alarmIDToItemMap");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "alarmID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", v9);
    v10 = (HFHomePodAlarmItem *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = [HFHomePodAlarmItem alloc];
    objc_msgSend(WeakRetained, "mediaProfileContainer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[HFHomePodAlarmItem initWithMediaProfileContainer:alarm:](v11, "initWithMediaProfileContainer:alarm:", v12, v3);

    objc_msgSend(WeakRetained, "alarmIDToItemMap");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "alarmID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v10, v9);
  }

  return v10;
}

id __41__HFHomePodAlarmItemProvider_reloadItems__block_invoke_11(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "alarmItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addedItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unionSet:", v6);

  objc_msgSend(WeakRetained, "alarmItems");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removedItems");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "minusSet:", v8);

  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (HFMediaProfileContainer)mediaProfileContainer
{
  return self->_mediaProfileContainer;
}

- (HFAccessorySettingMobileTimerAdapter)mobileTimerAdapter
{
  return self->_mobileTimerAdapter;
}

- (NSMutableDictionary)alarmIDToItemMap
{
  return self->_alarmIDToItemMap;
}

- (NSMutableSet)alarmItems
{
  return self->_alarmItems;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alarmItems, 0);
  objc_storeStrong((id *)&self->_alarmIDToItemMap, 0);
  objc_storeStrong((id *)&self->_mobileTimerAdapter, 0);
  objc_storeStrong((id *)&self->_mediaProfileContainer, 0);
}

@end
