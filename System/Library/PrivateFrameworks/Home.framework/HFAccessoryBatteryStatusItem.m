@implementation HFAccessoryBatteryStatusItem

- (id)defaultTitleForRepresentedHomeKitObjects:(id)a3
{
  return _HFLocalizedStringWithDefaultValue(CFSTR("HFStatusTitleAccessoryLowBattery"), CFSTR("HFStatusTitleAccessoryLowBattery"), 1);
}

- (id)_subclass_updateWithOptions:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  _QWORD v20[4];
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;
  id v25;
  id location;
  _QWORD v27[5];
  const __CFString *v28;
  _QWORD v29[2];

  v29[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", HFItemUpdateOptionFastInitialUpdate);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  if (v6)
  {
    v7 = (void *)MEMORY[0x1E0D519C0];
    v28 = CFSTR("hidden");
    v29[0] = MEMORY[0x1E0C9AAB0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, &v28, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[HFItemUpdateOutcome outcomeWithResults:](HFItemUpdateOutcome, "outcomeWithResults:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "futureWithResult:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[HFStatusItem home](self, "home");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "accessories");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = MEMORY[0x1E0C809B0];
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __60__HFAccessoryBatteryStatusItem__subclass_updateWithOptions___block_invoke;
    v27[3] = &unk_1EA727840;
    v27[4] = self;
    objc_msgSend(v12, "na_filter:", v27);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_initWeak(&location, self);
    v15 = (void *)MEMORY[0x1E0D519C0];
    v23[0] = v13;
    v23[1] = 3221225472;
    v23[2] = __60__HFAccessoryBatteryStatusItem__subclass_updateWithOptions___block_invoke_3;
    v23[3] = &unk_1EA73CFE8;
    objc_copyWeak(&v25, &location);
    v24 = v4;
    objc_msgSend(v14, "na_map:", v23);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "combineAllFutures:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v20[0] = v13;
    v20[1] = 3221225472;
    v20[2] = __60__HFAccessoryBatteryStatusItem__subclass_updateWithOptions___block_invoke_4;
    v20[3] = &unk_1EA73A878;
    objc_copyWeak(&v22, &location);
    v18 = v14;
    v21 = v18;
    objc_msgSend(v17, "flatMap:", v20);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_destroyWeak(&v22);
    objc_destroyWeak(&v25);
    objc_destroyWeak(&location);

  }
  return v10;
}

uint64_t __60__HFAccessoryBatteryStatusItem__subclass_updateWithOptions___block_invoke(id *a1, void *a2)
{
  void *v2;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v4 = a2;
  objc_msgSend(a1[4], "room");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(a1[4], "room");
    a1 = (id *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "room");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(a1, "isEqual:", v2))
    {
      v6 = 0;
LABEL_5:

      goto LABEL_6;
    }
  }
  objc_msgSend(v4, "services");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v7, "na_any:", &__block_literal_global_195);

  if (v5)
    goto LABEL_5;
LABEL_6:

  return v6;
}

BOOL __60__HFAccessoryBatteryStatusItem__subclass_updateWithOptions___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  _BOOL8 v4;
  void *v5;

  v2 = a2;
  objc_msgSend(v2, "serviceType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0CB99B8]) & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    objc_msgSend(v2, "hf_characteristicOfType:", *MEMORY[0x1E0CB87B8]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v5 != 0;

  }
  return v4;
}

id __60__HFAccessoryBatteryStatusItem__subclass_updateWithOptions___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  HFAccessoryBatteryLevelItem *v7;
  HFAccessoryBatteryLevelItem *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "batteryLevelItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "uniqueIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (HFAccessoryBatteryLevelItem *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    v8 = [HFAccessoryBatteryLevelItem alloc];
    objc_msgSend(WeakRetained, "valueSource");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[HFAccessoryBatteryLevelItem initWithAccessory:valueSource:](v8, "initWithAccessory:valueSource:", v3, v9);

    objc_msgSend(WeakRetained, "batteryLevelItems");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "uniqueIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v7, v11);

  }
  v12 = (void *)objc_msgSend(*(id *)(a1 + 32), "mutableCopy");
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("batteryLow"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v13, CFSTR("accessoryBatteryDesiredKeys"));

  -[HFItem updateWithOptions:](v7, "updateWithOptions:", v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

id __60__HFAccessoryBatteryStatusItem__subclass_updateWithOptions___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  HFImageIconDescriptor *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(uint64_t, void *, uint64_t);
  void *v26;
  id v27;
  id v28;
  id v29;
  const __CFString *v30;
  _QWORD v31[2];

  v31[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(void **)(a1 + 32);
    v23 = MEMORY[0x1E0C809B0];
    v24 = 3221225472;
    v25 = __60__HFAccessoryBatteryStatusItem__subclass_updateWithOptions___block_invoke_5;
    v26 = &unk_1EA73D010;
    v27 = v3;
    v8 = v5;
    v28 = v8;
    v9 = v6;
    v29 = v9;
    objc_msgSend(v7, "enumerateObjectsUsingBlock:", &v23);
    v10 = (void *)objc_opt_new();
    if (objc_msgSend(v8, "count", v23, v24, v25, v26))
    {
      objc_msgSend(WeakRetained, "defaultTitleForRepresentedHomeKitObjects:", v8);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setObject:forKeyedSubscript:", v11, CFSTR("title"));

      objc_msgSend(MEMORY[0x1E0CEA650], "configurationWithPointSize:", 24.0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = -[HFImageIconDescriptor initWithSystemImageNamed:configuration:]([HFImageIconDescriptor alloc], "initWithSystemImageNamed:configuration:", CFSTR("battery.25"), v12);
      objc_msgSend(v10, "setObject:forKeyedSubscript:", v13, CFSTR("icon"));

      objc_msgSend(v10, "setObject:forKeyedSubscript:", &unk_1EA7CD168, CFSTR("statusItemCategory"));
      objc_msgSend(v10, "setObject:forKeyedSubscript:", v8, CFSTR("representedHomeKitObjects"));

    }
    else
    {
      objc_msgSend(v10, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("hidden"));
    }
    _HFLocalizedStringWithDefaultValue(CFSTR("HFStatusSortKeyAccessoryLowBattery"), CFSTR("HFStatusSortKeyAccessoryLowBattery"), 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v18, CFSTR("sortKey"));

    objc_msgSend(v10, "setObject:forKeyedSubscript:", &unk_1EA7CD180, CFSTR("priority"));
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v9, CFSTR("dependentHomeKitObjects"));
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v19, CFSTR("dependentHomeKitClasses"));

    v20 = (void *)MEMORY[0x1E0D519C0];
    +[HFItemUpdateOutcome outcomeWithResults:](HFItemUpdateOutcome, "outcomeWithResults:", v10);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "futureWithResult:", v21);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v14 = (void *)MEMORY[0x1E0D519C0];
    v30 = CFSTR("hidden");
    v31[0] = MEMORY[0x1E0C9AAB0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, &v30, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[HFItemUpdateOutcome outcomeWithResults:](HFItemUpdateOutcome, "outcomeWithResults:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "futureWithResult:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v17;
}

void __60__HFAccessoryBatteryStatusItem__subclass_updateWithOptions___block_invoke_5(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("batteryLow"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "BOOLValue");

  if (v7)
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v10);
  v8 = *(void **)(a1 + 48);
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("dependentHomeKitObjects"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "unionSet:", v9);

}

- (NSMutableDictionary)batteryLevelItems
{
  return self->_batteryLevelItems;
}

- (void)setBatteryLevelItems:(id)a3
{
  objc_storeStrong((id *)&self->_batteryLevelItems, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_batteryLevelItems, 0);
}

@end
