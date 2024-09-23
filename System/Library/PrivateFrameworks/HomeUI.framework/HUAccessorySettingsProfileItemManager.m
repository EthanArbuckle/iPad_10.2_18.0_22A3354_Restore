@implementation HUAccessorySettingsProfileItemManager

- (HUAccessorySettingsProfileItemManager)initWithDelegate:(id)a3 accessoryGroupItem:(id)a4
{
  id v6;
  HUAccessorySettingsProfileItemManager *v7;
  HUAccessorySettingsProfileModule *v8;
  HUAccessorySettingsProfileModule *profileModule;
  objc_super v11;

  v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)HUAccessorySettingsProfileItemManager;
  v7 = -[HFItemManager initWithDelegate:sourceItem:](&v11, sel_initWithDelegate_sourceItem_, a3, v6);
  if (v7)
  {
    v8 = -[HUAccessorySettingsProfileModule initWithItemUpdater:settingGroupItem:]([HUAccessorySettingsProfileModule alloc], "initWithItemUpdater:settingGroupItem:", v7, v6);
    profileModule = v7->_profileModule;
    v7->_profileModule = v8;

  }
  return v7;
}

- (id)_buildItemProvidersForHome:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  -[HUAccessorySettingsProfileItemManager profileModule](self, "profileModule", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "itemProviders");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_buildSectionsWithDisplayedItems:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    -[HUAccessorySettingsProfileItemManager profileModule](self, "profileModule");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "buildSectionsWithDisplayedItems:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v6;
}

- (HUAccessorySettingsProfileModule)profileModule
{
  return self->_profileModule;
}

- (void)setProfileModule:(id)a3
{
  objc_storeStrong((id *)&self->_profileModule, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_profileModule, 0);
}

@end
