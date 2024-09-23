@implementation HFHomePodAlarmItemManager

- (HFHomePodAlarmItemManager)initWithDelegate:(id)a3 mediaProfileContainer:(id)a4
{
  id v7;
  HFHomePodAlarmItemManager *v8;
  HFHomePodAlarmItemManager *v9;
  HFHomePodAlarmItemModule *v10;
  HFHomePodAlarmItemModule *alarmItemModule;
  objc_super v13;

  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)HFHomePodAlarmItemManager;
  v8 = -[HFItemManager initWithDelegate:sourceItem:](&v13, sel_initWithDelegate_sourceItem_, a3, 0);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_mediaProfileContainer, a4);
    v10 = -[HFHomePodAlarmItemModule initWithItemUpdater:mediaProfileContainer:]([HFHomePodAlarmItemModule alloc], "initWithItemUpdater:mediaProfileContainer:", v9, v7);
    alarmItemModule = v9->_alarmItemModule;
    v9->_alarmItemModule = v10;

  }
  return v9;
}

- (id)_buildItemProvidersForHome:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  -[HFHomePodAlarmItemManager alarmItemModule](self, "alarmItemModule", a3);
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
    -[HFHomePodAlarmItemManager alarmItemModule](self, "alarmItemModule");
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

- (void)_registerForExternalUpdates
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HFHomePodAlarmItemManager;
  -[HFItemManager _registerForExternalUpdates](&v4, sel__registerForExternalUpdates);
  -[HFHomePodAlarmItemManager alarmItemModule](self, "alarmItemModule");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerForExternalUpdates");

}

- (void)_unregisterForExternalUpdates
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HFHomePodAlarmItemManager;
  -[HFItemManager _unregisterForExternalUpdates](&v4, sel__unregisterForExternalUpdates);
  -[HFHomePodAlarmItemManager alarmItemModule](self, "alarmItemModule");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unregisterForExternalUpdates");

}

- (HFMediaProfileContainer)mediaProfileContainer
{
  return self->_mediaProfileContainer;
}

- (HFHomePodAlarmItemModule)alarmItemModule
{
  return self->_alarmItemModule;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alarmItemModule, 0);
  objc_storeStrong((id *)&self->_mediaProfileContainer, 0);
}

@end
