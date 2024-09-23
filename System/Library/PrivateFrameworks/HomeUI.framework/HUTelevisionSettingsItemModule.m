@implementation HUTelevisionSettingsItemModule

+ (id)_powerModeSelectionCharacteristicForAccessory:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "hf_serviceOfType:", *MEMORY[0x1E0CB9AF0]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hf_characteristicOfType:", *MEMORY[0x1E0CB89C0]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (BOOL)_supportsAccessory:(id)a3
{
  void *v3;
  BOOL v4;

  objc_msgSend(a1, "_powerModeSelectionCharacteristicForAccessory:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (HUTelevisionSettingsItemModule)initWithItemUpdater:(id)a3 home:(id)a4 accessory:(id)a5
{
  id v8;
  id v9;
  id v10;
  HUTelevisionSettingsItemModule *v11;
  id *p_isa;
  HUTelevisionSettingsItemModule *v13;
  objc_super v15;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend((id)objc_opt_class(), "_supportsAccessory:", v10))
  {
    v15.receiver = self;
    v15.super_class = (Class)HUTelevisionSettingsItemModule;
    v11 = -[HFItemModule initWithItemUpdater:](&v15, sel_initWithItemUpdater_, v8);
    p_isa = (id *)&v11->super.super.isa;
    if (v11)
    {
      objc_storeStrong((id *)&v11->_home, a4);
      objc_storeStrong(p_isa + 7, a5);
      objc_msgSend(p_isa, "_createItemProviders");
    }
    self = p_isa;
    v13 = self;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (void)_createItemProviders
{
  id v3;
  HFItem *v4;
  HFItem *showPowerModeSelectionItem;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSSet *v11;
  NSSet *itemProviders;
  uint64_t v13;
  uint64_t v14;
  id (*v15)(uint64_t);
  void *v16;
  id v17;
  id location;

  objc_initWeak(&location, self);
  v3 = objc_alloc(MEMORY[0x1E0D31840]);
  v13 = MEMORY[0x1E0C809B0];
  v14 = 3221225472;
  v15 = __54__HUTelevisionSettingsItemModule__createItemProviders__block_invoke;
  v16 = &unk_1E6F4C4E8;
  objc_copyWeak(&v17, &location);
  v4 = (HFItem *)objc_msgSend(v3, "initWithResultsBlock:", &v13);
  showPowerModeSelectionItem = self->_showPowerModeSelectionItem;
  self->_showPowerModeSelectionItem = v4;

  v6 = objc_alloc(MEMORY[0x1E0D31848]);
  v7 = (void *)MEMORY[0x1E0C99E60];
  -[HUTelevisionSettingsItemModule showPowerModeSelectionItem](self, "showPowerModeSelectionItem", v13, v14, v15, v16);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWithObject:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v6, "initWithItems:", v9);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v10);
  v11 = (NSSet *)objc_claimAutoreleasedReturnValue();
  itemProviders = self->_itemProviders;
  self->_itemProviders = v11;

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

id __54__HUTelevisionSettingsItemModule__createItemProviders__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[2];
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = (void *)MEMORY[0x1E0D519C0];
  v10[0] = *MEMORY[0x1E0D30D18];
  _HULocalizedStringWithDefaultValue(CFSTR("HUTelevisionSettingPowerModeSelectionButtonTitle"), CFSTR("HUTelevisionSettingPowerModeSelectionButtonTitle"), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v3;
  v10[1] = *MEMORY[0x1E0D30C80];
  v4 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(WeakRetained, "accessory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "numberWithInt:", objc_msgSend(v5, "hf_canSyncExternalSettings") ^ 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "futureWithResult:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)buildSectionsWithDisplayedItems:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31570]), "initWithIdentifier:", CFSTR("TVSettings"));
  _HULocalizedStringWithDefaultValue(CFSTR("HUTelevisionSettingPowerModeSelectionSectionFooterTitle"), CFSTR("HUTelevisionSettingPowerModeSelectionSectionFooterTitle"), 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFooterTitle:", v5);

  -[HUTelevisionSettingsItemModule showPowerModeSelectionItem](self, "showPowerModeSelectionItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setItems:", v7);

  v10 = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v10, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)showPowerModeSelection
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)objc_opt_class();
  -[HUTelevisionSettingsItemModule accessory](self, "accessory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_powerModeSelectionCharacteristicForAccessory:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    -[HUTelevisionSettingsItemModule accessory](self, "accessory");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "hf_prettyDescription");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("Missing power mode selction characteristic on accessory %@!"), v7);

  }
  -[HUTelevisionSettingsItemModule home](self, "home");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "hf_characteristicValueManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "writeValue:forCharacteristic:", &unk_1E7041CB0, v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)itemProviders
{
  return self->_itemProviders;
}

- (HMHome)home
{
  return self->_home;
}

- (HMAccessory)accessory
{
  return self->_accessory;
}

- (HFItem)showPowerModeSelectionItem
{
  return self->_showPowerModeSelectionItem;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_showPowerModeSelectionItem, 0);
  objc_storeStrong((id *)&self->_accessory, 0);
  objc_storeStrong((id *)&self->_home, 0);
  objc_storeStrong((id *)&self->_itemProviders, 0);
}

@end
