@implementation HUFirmwareUpdateItemModule

- (HUFirmwareUpdateItemModule)initWithItemUpdater:(id)a3
{
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithItemUpdater_home_);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUFirmwareUpdateItemModule.m"), 32, CFSTR("%s is unavailable; use %@ instead"),
    "-[HUFirmwareUpdateItemModule initWithItemUpdater:]",
    v6);

  return 0;
}

- (HUFirmwareUpdateItemModule)initWithItemUpdater:(id)a3 home:(id)a4
{
  id v7;
  HUFirmwareUpdateItemModule *v8;
  HUFirmwareUpdateItemModule *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)HUFirmwareUpdateItemModule;
  v8 = -[HFItemModule initWithItemUpdater:](&v11, sel_initWithItemUpdater_, a3);
  v9 = v8;
  if (v8)
    objc_storeStrong((id *)&v8->_home, a4);

  return v9;
}

- (id)buildItemProviders
{
  HUFirmwareUpdateItemProvider *v3;
  void *v4;
  HUFirmwareUpdateItemProvider *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = [HUFirmwareUpdateItemProvider alloc];
  -[HUFirmwareUpdateItemModule home](self, "home");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[HUFirmwareUpdateItemProvider initWithHome:style:](v3, "initWithHome:style:", v4, 2);
  -[HUFirmwareUpdateItemModule setFirmwareUpdateItemProvider:](self, "setFirmwareUpdateItemProvider:", v5);

  v6 = (void *)MEMORY[0x1E0C99E60];
  -[HUFirmwareUpdateItemModule firmwareUpdateItemProvider](self, "firmwareUpdateItemProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "na_setWithSafeObject:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)buildSectionsWithDisplayedItems:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31570]), "initWithIdentifier:", CFSTR("thirdPartyUpdates"));
  -[HUFirmwareUpdateItemModule firmwareUpdateItemProvider](self, "firmwareUpdateItemProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "items");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "allObjects");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D314B0], "defaultItemComparator");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sortedArrayUsingComparator:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setItems:", v11);

  -[HUFirmwareUpdateItemModule home](self, "home");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v7) = objc_msgSend(v12, "hf_hasAccessoriesSupportingSoftwareUpdate");

  if ((_DWORD)v7)
  {
    _HULocalizedStringWithDefaultValue(CFSTR("HUSoftwareUpdateLegacyThirdPartyUpdatesSectionHeader"), CFSTR("HUSoftwareUpdateLegacyThirdPartyUpdatesSectionHeader"), 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setHeaderTitle:", v13);

  }
  objc_msgSend(v5, "addObject:", v6);
  objc_msgSend(MEMORY[0x1E0D314B0], "filterSections:toDisplayedItems:", v5, v4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)transformedUpdateOutcomeForItem:(id)a3 proposedOutcome:(id)a4
{
  id v5;
  id v6;
  void *v7;
  char isKindOfClass;
  id v9;
  void *v10;
  __CFString *v11;
  void *v12;
  void *v13;

  v5 = a3;
  v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (objc_msgSend(v5, "sourceItem"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        isKindOfClass = objc_opt_isKindOfClass(),
        v7,
        (isKindOfClass & 1) != 0))
  {
    v9 = (id)objc_msgSend(v6, "mutableCopy");
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("HFResultApplicationIsInstalled"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "BOOLValue"))
      v11 = CFSTR("HUDownloadButtonTitle_Open");
    else
      v11 = CFSTR("HUDownloadButtonTitle_View");
    _HULocalizedStringWithDefaultValue(v11, v11, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v12, *MEMORY[0x1E0D30BC0]);

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("HFResultApplicationPublisher"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v13, *MEMORY[0x1E0D30C08]);

  }
  else
  {
    v9 = v6;
  }

  return v9;
}

- (HMHome)home
{
  return self->_home;
}

- (HUFirmwareUpdateItemProvider)firmwareUpdateItemProvider
{
  return self->_firmwareUpdateItemProvider;
}

- (void)setFirmwareUpdateItemProvider:(id)a3
{
  objc_storeStrong((id *)&self->_firmwareUpdateItemProvider, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_firmwareUpdateItemProvider, 0);
  objc_storeStrong((id *)&self->_home, 0);
}

@end
