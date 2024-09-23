@implementation HUTVViewingProfilesEditorItemManager

- (HUTVViewingProfilesEditorItemManager)initWithDelegate:(id)a3 sourceItem:(id)a4
{
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithDelegate_home_);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUTVViewingProfilesEditorItemManager.m"), 19, CFSTR("%s is unavailable; use %@ instead"),
    "-[HUTVViewingProfilesEditorItemManager initWithDelegate:sourceItem:]",
    v7);

  return 0;
}

- (HUTVViewingProfilesEditorItemManager)initWithDelegate:(id)a3 userItem:(id)a4
{
  id v6;
  HUTVViewingProfilesEditorItemManager *v7;
  HUTVViewingProfilesDevicesItemModule *v8;
  HUTVViewingProfilesDevicesItemModule *tvpDevicesModule;
  objc_super v11;

  v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)HUTVViewingProfilesEditorItemManager;
  v7 = -[HFItemManager initWithDelegate:sourceItem:](&v11, sel_initWithDelegate_sourceItem_, a3, v6);
  if (v7)
  {
    v8 = -[HUTVViewingProfilesDevicesItemModule initWithItemUpdater:userItem:]([HUTVViewingProfilesDevicesItemModule alloc], "initWithItemUpdater:userItem:", v7, v6);
    tvpDevicesModule = v7->_tvpDevicesModule;
    v7->_tvpDevicesModule = v8;

  }
  return v7;
}

- (id)_buildItemProvidersForHome:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  -[HUTVViewingProfilesEditorItemManager tvpDevicesModule](self, "tvpDevicesModule", a3);
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
  -[HUTVViewingProfilesEditorItemManager tvpDevicesModule](self, "tvpDevicesModule");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "buildSectionsWithDisplayedItems:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)_registerForExternalUpdates
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HUTVViewingProfilesEditorItemManager;
  -[HFItemManager _registerForExternalUpdates](&v4, sel__registerForExternalUpdates);
  -[HUTVViewingProfilesEditorItemManager tvpDevicesModule](self, "tvpDevicesModule");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerForExternalUpdates");

}

- (void)_unregisterForExternalUpdates
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HUTVViewingProfilesEditorItemManager;
  -[HFItemManager _unregisterForExternalUpdates](&v4, sel__unregisterForExternalUpdates);
  -[HUTVViewingProfilesEditorItemManager tvpDevicesModule](self, "tvpDevicesModule");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unregisterForExternalUpdates");

}

- (HUTVViewingProfilesDevicesItemModule)tvpDevicesModule
{
  return self->_tvpDevicesModule;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tvpDevicesModule, 0);
}

@end
