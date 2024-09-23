@implementation HUAccessorySettingsItemManager

- (HUAccessorySettingsItemManager)initWithDelegate:(id)a3 accessoryGroupItem:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HUAccessorySettingsItemManager *v9;
  uint64_t v10;
  HFAccessorySettingGroupItem *groupItem;
  HUAccessorySettingsItemModule *v12;
  void *v13;
  uint64_t v14;
  HUAccessorySettingsItemModule *accessorySettingsSectionItemModule;
  objc_super v17;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(v6, "copy");
  v17.receiver = self;
  v17.super_class = (Class)HUAccessorySettingsItemManager;
  v9 = -[HFItemManager initWithDelegate:sourceItem:](&v17, sel_initWithDelegate_sourceItem_, v7, v8);

  if (v9)
  {
    v10 = objc_msgSend(v6, "copy");
    groupItem = v9->_groupItem;
    v9->_groupItem = (HFAccessorySettingGroupItem *)v10;

    v12 = [HUAccessorySettingsItemModule alloc];
    -[HUAccessorySettingsItemManager groupItem](v9, "groupItem");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[HUAccessorySettingsItemModule initWithItemUpdater:settingGroupItem:usageOptions:](v12, "initWithItemUpdater:settingGroupItem:usageOptions:", v9, v13, 0);
    accessorySettingsSectionItemModule = v9->_accessorySettingsSectionItemModule;
    v9->_accessorySettingsSectionItemModule = (HUAccessorySettingsItemModule *)v14;

  }
  return v9;
}

- (id)_buildItemProvidersForHome:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  -[HUAccessorySettingsItemManager accessorySettingsSectionItemModule](self, "accessorySettingsSectionItemModule", a3);
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
    -[HUAccessorySettingsItemManager accessorySettingsSectionItemModule](self, "accessorySettingsSectionItemModule");
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

- (id)_itemsToHideInSet:(id)a3
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HUAccessorySettingsItemManager;
  -[HFItemManager _itemsToHideInSet:](&v6, sel__itemsToHideInSet_, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  return v4;
}

- (void)_registerForExternalUpdates
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HUAccessorySettingsItemManager;
  -[HFItemManager _registerForExternalUpdates](&v4, sel__registerForExternalUpdates);
  -[HUAccessorySettingsItemManager accessorySettingsSectionItemModule](self, "accessorySettingsSectionItemModule");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerForExternalUpdates");

}

- (void)_unregisterForExternalUpdates
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HUAccessorySettingsItemManager;
  -[HFItemManager _unregisterForExternalUpdates](&v4, sel__unregisterForExternalUpdates);
  -[HUAccessorySettingsItemManager accessorySettingsSectionItemModule](self, "accessorySettingsSectionItemModule");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unregisterForExternalUpdates");

}

- (HFAccessorySettingGroupItem)groupItem
{
  return self->_groupItem;
}

- (void)setGroupItem:(id)a3
{
  objc_storeStrong((id *)&self->_groupItem, a3);
}

- (HUAccessorySettingsItemModule)accessorySettingsSectionItemModule
{
  return self->_accessorySettingsSectionItemModule;
}

- (void)setAccessorySettingsSectionItemModule:(id)a3
{
  objc_storeStrong((id *)&self->_accessorySettingsSectionItemModule, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessorySettingsSectionItemModule, 0);
  objc_storeStrong((id *)&self->_groupItem, 0);
}

@end
