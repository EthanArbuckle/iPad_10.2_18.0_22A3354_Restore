@implementation HFAccessoryInfoDetailsItemProvider

+ (id)preferredCharacteristicOrderArray
{
  if (qword_1ED378638 != -1)
    dispatch_once(&qword_1ED378638, &__block_literal_global_79);
  return (id)_MergedGlobals_3_0;
}

void __71__HFAccessoryInfoDetailsItemProvider_preferredCharacteristicOrderArray__block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[7];

  v4[6] = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0CB8A20];
  v4[0] = *MEMORY[0x1E0CB8948];
  v4[1] = v0;
  v4[2] = *MEMORY[0x1E0CB8950];
  v4[3] = CFSTR("HFAccessoryInfoTypeNetworkPreferredOrderKey");
  v1 = *MEMORY[0x1E0CB8A40];
  v4[4] = *MEMORY[0x1E0CB88C8];
  v4[5] = v1;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 6);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)_MergedGlobals_3_0;
  _MergedGlobals_3_0 = v2;

}

- (HFAccessoryInfoDetailsItemProvider)init
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithHome_accessory_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFAccessoryInfoDetailsItemProvider.m"), 59, CFSTR("%s is unavailable; use %@ instead"),
    "-[HFAccessoryInfoDetailsItemProvider init]",
    v5);

  return 0;
}

- (HFAccessoryInfoDetailsItemProvider)initWithHome:(id)a3 accessory:(id)a4
{
  id v7;
  id v8;
  HFAccessoryInfoDetailsItemProvider *v9;
  HFAccessoryInfoDetailsItemProvider *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HFAccessoryInfoDetailsItemProvider;
  v9 = -[HFItemProvider init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_home, a3);
    objc_storeStrong((id *)&v10->_accessory, a4);
  }

  return v10;
}

- (BOOL)supportsWiFiStrengthDisplay:(id)a3
{
  id v4;
  id v5;
  void *v7;
  char v8;

  v4 = a3;
  -[HFAccessoryInfoDetailsItemProvider networkItem](self, "networkItem");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 != v4)
    return 0;
  -[HFAccessoryInfoDetailsItemProvider networkItem](self, "networkItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "supportsWiFiStrengthDisplay");

  return v8;
}

- (BOOL)canToggleAccessoryInfoItem:(id)a3
{
  id v4;
  void *v5;
  int v6;
  id v7;
  BOOL v8;

  v4 = a3;
  -[HFAccessoryInfoDetailsItemProvider items](self, "items");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v4);

  if (v6)
  {
    -[HFAccessoryInfoDetailsItemProvider networkItem](self, "networkItem");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    v8 = v7 == v4;

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)toggleAccessoryInfoItem:(id)a3
{
  void *v4;
  int v5;
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  -[HFAccessoryInfoDetailsItemProvider items](self, "items");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "containsObject:", v8);

  if (v5)
  {
    -[HFAccessoryInfoDetailsItemProvider networkItem](self, "networkItem");
    v6 = (id)objc_claimAutoreleasedReturnValue();

    if (v6 == v8)
    {
      -[HFAccessoryInfoDetailsItemProvider networkItem](self, "networkItem");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "toggleNetworkInfoType");

    }
  }

}

- (HFCharacteristicValueSource)valueSource
{
  HFCharacteristicValueSource *valueSource;
  HFCharacteristicValueSource *v3;
  void *v4;

  valueSource = self->_valueSource;
  if (valueSource)
  {
    v3 = valueSource;
  }
  else
  {
    -[HFAccessoryInfoDetailsItemProvider home](self, "home");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "hf_characteristicValueManager");
    v3 = (HFCharacteristicValueSource *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (id)reloadItems
{
  void *v3;
  void *v4;
  HFItemProviderReloadResults *v5;
  void *v6;
  HFItemProviderReloadResults *v7;
  void *v8;

  -[HFAccessoryInfoDetailsItemProvider accessoryInfoDetailItems](self, "accessoryInfoDetailItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFAccessoryInfoDetailsItemProvider accessoryInfoDetailItems](self, "accessoryInfoDetailItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = [HFItemProviderReloadResults alloc];
  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HFItemProviderReloadResults initWithAddedItems:removedItems:existingItems:](v5, "initWithAddedItems:removedItems:existingItems:", v3, v6, v4);

  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)invalidationReasons
{
  void *v2;
  void *v3;
  void *v4;
  objc_super v6;
  _QWORD v7[4];

  v7[3] = *MEMORY[0x1E0C80C00];
  v6.receiver = self;
  v6.super_class = (Class)HFAccessoryInfoDetailsItemProvider;
  -[HFItemProvider invalidationReasons](&v6, sel_invalidationReasons);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = CFSTR("service");
  v7[1] = CFSTR("accessory");
  v7[2] = CFSTR("room");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setByAddingObjectsFromArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)accessoryInfoServiceDetailComparator
{
  return &__block_literal_global_17_3;
}

uint64_t __74__HFAccessoryInfoDetailsItemProvider_accessoryInfoServiceDetailComparator__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v4 = a3;
  objc_msgSend(a2, "latestResults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("accessoryInfoDetailPreferredOrder"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "latestResults");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("accessoryInfoDetailPreferredOrder"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    v9 = -1;
  else
    v9 = v8 != 0;
  if (v6 && v8)
    v9 = objc_msgSend(v6, "compare:", v8);

  return v9;
}

- (NSMutableSet)accessoryInfoDetailItems
{
  NSMutableSet *accessoryInfoDetailItems;
  NSMutableSet *v3;
  HFAccessoryInfoItem *v5;
  void *v6;
  void *v7;
  HFAccessoryInfoItem *v8;
  HFAccessoryInfoItem *firmwareItem;
  HFAccessoryInfoItem *v10;
  void *v11;
  void *v12;
  HFAccessoryInfoItem *v13;
  HFAccessoryInfoItem *softwareItem;
  HFAccessoryNetworkInfoItem *v15;
  void *v16;
  void *v17;
  HFAccessoryNetworkInfoItem *v18;
  HFAccessoryNetworkInfoItem *networkItem;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  id v24;
  void (**v25)(void *, _QWORD, void *);
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  HFStaticItem *v34;
  void *v35;
  HFStaticItem *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  HFStaticItem *v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  HFStaticItem *v47;
  void *v48;
  HFStaticItem *v49;
  HFStaticItem *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  NSMutableSet *v55;
  NSMutableSet *v56;
  void *v58;
  HFStaticItem *v59;
  HFStaticItem *v60;
  void *v61;
  void *v62;
  _QWORD v63[4];
  id v64;
  _QWORD aBlock[4];
  id v66;
  id v67;
  id location[2];

  accessoryInfoDetailItems = self->_accessoryInfoDetailItems;
  if (!accessoryInfoDetailItems)
  {
    v5 = [HFAccessoryInfoItem alloc];
    -[HFAccessoryInfoDetailsItemProvider accessory](self, "accessory");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFAccessoryInfoDetailsItemProvider home](self, "home");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[HFAccessoryInfoItem initWithAccessory:infoType:home:](v5, "initWithAccessory:infoType:home:", v6, 1, v7);
    firmwareItem = self->_firmwareItem;
    self->_firmwareItem = v8;

    v10 = [HFAccessoryInfoItem alloc];
    -[HFAccessoryInfoDetailsItemProvider accessory](self, "accessory");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFAccessoryInfoDetailsItemProvider home](self, "home");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[HFAccessoryInfoItem initWithAccessory:infoType:home:](v10, "initWithAccessory:infoType:home:", v11, 2, v12);
    softwareItem = self->_softwareItem;
    self->_softwareItem = v13;

    v15 = [HFAccessoryNetworkInfoItem alloc];
    -[HFAccessoryInfoDetailsItemProvider accessory](self, "accessory");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFAccessoryInfoDetailsItemProvider home](self, "home");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[HFAccessoryNetworkInfoItem initWithAccessory:home:](v15, "initWithAccessory:home:", v16, v17);
    networkItem = self->_networkItem;
    self->_networkItem = v18;

    -[HFAccessoryInfoDetailsItemProvider accessory](self, "accessory");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "services");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    v58 = v21;
    objc_msgSend(v21, "na_firstObjectPassingTest:", &__block_literal_global_22_3);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(location, self);
    v23 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __62__HFAccessoryInfoDetailsItemProvider_accessoryInfoDetailItems__block_invoke_2;
    aBlock[3] = &unk_1EA731788;
    objc_copyWeak(&v67, location);
    v24 = v22;
    v66 = v24;
    v25 = (void (**)(void *, _QWORD, void *))_Block_copy(aBlock);
    v26 = (void *)objc_opt_class();
    -[HFAccessoryInfoDetailsItemProvider accessory](self, "accessory");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "manufacturer");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = *MEMORY[0x1E0CB8948];
    objc_msgSend(v26, "_displayValueForCachedValue:characteristicType:accessoryInfoService:", v28, *MEMORY[0x1E0CB8948], v24);
    v62 = (void *)objc_claimAutoreleasedReturnValue();

    v30 = (void *)objc_opt_class();
    -[HFAccessoryInfoDetailsItemProvider accessory](self, "accessory");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "model");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = *MEMORY[0x1E0CB8950];
    objc_msgSend(v30, "_displayValueForCachedValue:characteristicType:accessoryInfoService:", v32, *MEMORY[0x1E0CB8950], v24);
    v61 = (void *)objc_claimAutoreleasedReturnValue();

    v34 = [HFStaticItem alloc];
    v25[2](v25, v29, v62);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = -[HFStaticItem initWithResultsBlock:](v34, "initWithResultsBlock:", v35);

    v36 = [HFStaticItem alloc];
    v25[2](v25, v33, v61);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = -[HFStaticItem initWithResultsBlock:](v36, "initWithResultsBlock:", v37);

    -[HFAccessoryInfoDetailsItemProvider accessory](self, "accessory");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v38, "supportsCHIP") & 1) != 0)
    {
      -[HFAccessoryInfoDetailsItemProvider accessory](self, "accessory");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "serialNumber");
      v40 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v40)
      {
        v41 = 0;
LABEL_8:
        v49 = [HFStaticItem alloc];
        v63[0] = v23;
        v63[1] = 3221225472;
        v63[2] = __62__HFAccessoryInfoDetailsItemProvider_accessoryInfoDetailItems__block_invoke_4;
        v63[3] = &unk_1EA7317B0;
        objc_copyWeak(&v64, location);
        v50 = -[HFStaticItem initWithResultsBlock:](v49, "initWithResultsBlock:", v63);
        v51 = (void *)MEMORY[0x1E0C99E20];
        -[HFAccessoryInfoDetailsItemProvider firmwareItem](self, "firmwareItem");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        -[HFAccessoryInfoDetailsItemProvider softwareItem](self, "softwareItem");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        -[HFAccessoryInfoDetailsItemProvider networkItem](self, "networkItem");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "setWithObjects:", v60, v59, v52, v53, v54, v50, 0);
        v55 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
        v56 = self->_accessoryInfoDetailItems;
        self->_accessoryInfoDetailItems = v55;

        -[NSMutableSet na_safeAddObject:](self->_accessoryInfoDetailItems, "na_safeAddObject:", v41);
        v3 = self->_accessoryInfoDetailItems;

        objc_destroyWeak(&v64);
        objc_destroyWeak(&v67);
        objc_destroyWeak(location);

        return v3;
      }
    }
    else
    {

    }
    v42 = (void *)objc_opt_class();
    -[HFAccessoryInfoDetailsItemProvider accessory](self, "accessory");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "serialNumber");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = *MEMORY[0x1E0CB8A20];
    objc_msgSend(v42, "_displayValueForCachedValue:characteristicType:accessoryInfoService:", v44, *MEMORY[0x1E0CB8A20], v24);
    v46 = (void *)objc_claimAutoreleasedReturnValue();

    v47 = [HFStaticItem alloc];
    v25[2](v25, v45, v46);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = -[HFStaticItem initWithResultsBlock:](v47, "initWithResultsBlock:", v48);

    goto LABEL_8;
  }
  v3 = accessoryInfoDetailItems;
  return v3;
}

uint64_t __62__HFAccessoryInfoDetailsItemProvider_accessoryInfoDetailItems__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "serviceType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", *MEMORY[0x1E0CB99A0]);

  return v3;
}

id __62__HFAccessoryInfoDetailsItemProvider_accessoryInfoDetailItems__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id v15;

  v5 = a2;
  v6 = a3;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __62__HFAccessoryInfoDetailsItemProvider_accessoryInfoDetailItems__block_invoke_3;
  v11[3] = &unk_1EA731760;
  objc_copyWeak(&v15, (id *)(a1 + 40));
  v12 = *(id *)(a1 + 32);
  v13 = v5;
  v14 = v6;
  v7 = v6;
  v8 = v5;
  v9 = _Block_copy(v11);

  objc_destroyWeak(&v15);
  return v9;
}

id __62__HFAccessoryInfoDetailsItemProvider_accessoryInfoDetailItems__block_invoke_3(uint64_t a1)
{
  id WeakRetained;
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
  uint64_t v13;
  unsigned int v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", *MEMORY[0x1E0CB99A0]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("dependentServiceTypes"));

  v5 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0CB7EF8]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("AccessoryDetails.%@"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("HFResultDisplayAccessibilityIDKey"));

  v8 = *(void **)(a1 + 32);
  if (v8)
  {
    objc_msgSend(v8, "hf_characteristicOfType:", *(_QWORD *)(a1 + 40));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[HFAccessoryInfoItem accessibilityStringForCharacteristic:](HFAccessoryInfoItem, "accessibilityStringForCharacteristic:", *(_QWORD *)(a1 + 40));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("HFResultDisplayAccessibilityIDKey"));

    objc_msgSend(MEMORY[0x1E0C99E20], "setWithObject:", *(_QWORD *)(a1 + 32));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "na_safeAddObject:", v9);
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("dependentHomeKitObjects"));

  }
  +[HFAccessoryInfoItem localizedStringForCharacteristic:](HFAccessoryInfoItem, "localizedStringForCharacteristic:", *(_QWORD *)(a1 + 40));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("title"));

  objc_msgSend(v3, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 48), CFSTR("description"));
  v13 = *(_QWORD *)(a1 + 48);
  v14 = _os_feature_enabled_impl();
  if (v13)
    v15 = v14;
  else
    v15 = 1;
  if (v14 && v13)
  {
    objc_msgSend(WeakRetained, "home");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v16, "hf_currentUserIsRestrictedGuest");

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("hidden"));

  +[HFAccessoryInfoDetailsItemProvider preferredCharacteristicOrderArray](HFAccessoryInfoDetailsItemProvider, "preferredCharacteristicOrderArray");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "indexOfObject:", *(_QWORD *)(a1 + 40));

  if (v19 == 0x7FFFFFFFFFFFFFFFLL)
  {
    +[HFAccessoryInfoDetailsItemProvider preferredCharacteristicOrderArray](HFAccessoryInfoDetailsItemProvider, "preferredCharacteristicOrderArray");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v20, "count");

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v19);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("accessoryInfoDetailPreferredOrder"));

  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v3);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

id __62__HFAccessoryInfoDetailsItemProvider_accessoryInfoDetailItems__block_invoke_4(uint64_t a1)
{
  void *v2;
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint8_t v19[16];

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "accessory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(WeakRetained, "accessory");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setWithObject:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v7, CFSTR("dependentHomeKitObjects"));

  }
  else
  {
    HFLogForCategory(0);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v19 = 0;
      _os_log_error_impl(&dword_1DD34E000, v8, OS_LOG_TYPE_ERROR, "Unable to populate the uncertified static item properly since the accessory is missing.", v19, 2u);
    }

  }
  objc_msgSend(WeakRetained, "accessory");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "certificationStatus");

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v10 != 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v11, CFSTR("hidden"));

  if (v10 == 1)
  {
    _HFLocalizedStringWithDefaultValue(CFSTR("HFAccessoryInfoDetailsCertification"), CFSTR("HFAccessoryInfoDetailsCertification"), 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v12, CFSTR("title"));

    objc_msgSend(v2, "setObject:forKeyedSubscript:", CFSTR("AccessoryDetails.HomeKitCertified"), CFSTR("HFResultDisplayAccessibilityIDKey"));
    +[HFFormatterManager sharedInstance](HFFormatterManager, "sharedInstance");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "BOOLeanFormatter");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringForObjectValue:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v16, CFSTR("description"));

  }
  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

+ (id)_displayValueForCachedValue:(id)a3 characteristicType:(id)a4 accessoryInfoService:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  __CFString *v11;
  NSObject *v13;
  void *v14;
  int v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (!v7
    && +[HFUtilities isInternalInstall](HFUtilities, "isInternalInstall")
    && ((objc_msgSend(v9, "hf_characteristicOfType:", v8),
         v10 = (void *)objc_claimAutoreleasedReturnValue(),
         v10,
         !v9)
     || v10))
  {
    HFLogForCategory(0x29uLL);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CBA458], "localizedDescriptionForCharacteristicType:", v8);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138412290;
      v16 = v14;
      _os_log_error_impl(&dword_1DD34E000, v13, OS_LOG_TYPE_ERROR, "Missing cached value for accessory information characteristic %@!", (uint8_t *)&v15, 0xCu);

    }
    v11 = CFSTR("(null - file a radar!)");
  }
  else
  {
    v11 = (__CFString *)v7;
  }

  return v11;
}

- (HMHome)home
{
  return self->_home;
}

- (void)setValueSource:(id)a3
{
  objc_storeStrong((id *)&self->_valueSource, a3);
}

- (void)setAccessoryInfoDetailItems:(id)a3
{
  objc_storeStrong((id *)&self->_accessoryInfoDetailItems, a3);
}

- (HMAccessory)accessory
{
  return self->_accessory;
}

- (void)setAccessory:(id)a3
{
  objc_storeStrong((id *)&self->_accessory, a3);
}

- (HFAccessoryInfoItem)firmwareItem
{
  return self->_firmwareItem;
}

- (HFAccessoryInfoItem)softwareItem
{
  return self->_softwareItem;
}

- (HFAccessoryNetworkInfoItem)networkItem
{
  return self->_networkItem;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_networkItem, 0);
  objc_storeStrong((id *)&self->_softwareItem, 0);
  objc_storeStrong((id *)&self->_firmwareItem, 0);
  objc_storeStrong((id *)&self->_accessory, 0);
  objc_storeStrong((id *)&self->_accessoryInfoDetailItems, 0);
  objc_storeStrong((id *)&self->_valueSource, 0);
  objc_storeStrong((id *)&self->_home, 0);
}

@end
