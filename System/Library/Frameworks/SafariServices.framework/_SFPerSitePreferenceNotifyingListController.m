@implementation _SFPerSitePreferenceNotifyingListController

- (_SFPerSitePreferenceNotifyingListController)init
{
  _SFPerSitePreferenceNotifyingListController *v2;
  void *v3;
  void *v4;
  _SFPerSitePreferenceNotifyingListController *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_SFPerSitePreferenceNotifyingListController;
  v2 = -[_SFPerSitePreferenceNotifyingListController init](&v7, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserver:selector:name:object:suspensionBehavior:", v2, sel__didUpdatePerSitePreferenceNotificationReceived_, *MEMORY[0x1E0D4F638], 0, 3);

    objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObserver:selector:name:object:suspensionBehavior:", v2, sel__didUpdatePerSitePreferenceRemotely_, *MEMORY[0x1E0D8B3A0], 0, 3);

    v5 = v2;
  }

  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)_SFPerSitePreferenceNotifyingListController;
  -[_SFPerSitePreferenceNotifyingListController dealloc](&v4, sel_dealloc);
}

- (void)notifyPerSitePreferenceValueDidChange
{
  objc_msgSend(MEMORY[0x1E0CB35B0], "_sf_postPerSitePreferencesDidChangeDistributedNotification");
}

- (void)_didUpdatePerSitePreferenceNotificationReceived:(id)a3
{
  if (objc_msgSend(a3, "_sf_perSitePreferenceNotificationWasSentFromAnotherProcess"))
    -[_SFPerSitePreferenceNotifyingListController perSitePreferenceValueDidChange](self, "perSitePreferenceValueDidChange");
}

@end
