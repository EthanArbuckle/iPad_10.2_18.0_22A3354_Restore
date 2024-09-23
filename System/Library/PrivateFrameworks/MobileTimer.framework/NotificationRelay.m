@implementation NotificationRelay

+ (id)sharedRelay
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __32__NotificationRelay_sharedRelay__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedRelay_onceToken != -1)
    dispatch_once(&sharedRelay_onceToken, block);
  return (id)sharedRelay_sharedRelay;
}

void __32__NotificationRelay_sharedRelay__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  if (!sharedRelay_sharedRelay)
  {
    v1 = objc_alloc_init(*(Class *)(a1 + 32));
    v2 = (void *)sharedRelay_sharedRelay;
    sharedRelay_sharedRelay = (uint64_t)v1;

  }
}

- (NotificationRelay)init
{
  NotificationRelay *v2;
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)NotificationRelay;
  v2 = -[NotificationRelay init](&v7, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel_relayFrameworkNotification_, CFSTR("com.apple.mobiletimer-framework.preferences-and-notifications-changed-externally"), 0);

    objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObserver:selector:name:object:", v2, sel_relayFrameworkNotification_, CFSTR("com.apple.mobiletimer-framework.preferences-changed-externally"), 0);

    objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:selector:name:object:", v2, sel_relayFrameworkNotification_, CFSTR("com.apple.mobiletimer-framework.local-notifications-changed-externally"), 0);

  }
  return v2;
}

- (void)relayFrameworkNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  id v15;

  v4 = a3;
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("bundleIdentifier"));
  v15 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bundleIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v15, "isEqualToString:", v8);

  if ((v9 & 1) != 0)
    goto LABEL_10;
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.mobiletimer-framework.preferences-and-notifications-changed-externally")))
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "postNotificationName:object:", CFSTR("com.apple.mobiletimer-framework.preferences-and-notifications-changed"), 0);
    v11 = 1;
LABEL_6:
    v14 = 1;
LABEL_7:

    goto LABEL_8;
  }
  v12 = objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.mobiletimer-framework.preferences-changed-externally"));
  v13 = objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.mobiletimer-framework.local-notifications-changed-externally"));
  v11 = v13;
  if (v12)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "postNotificationName:object:", CFSTR("com.apple.mobiletimer-framework.preferences-changed"), 0);
    goto LABEL_6;
  }
  if ((_DWORD)v13)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "postNotificationName:object:", CFSTR("com.apple.mobiletimer-framework.local-notifications-changed"), 0);
    v14 = 0;
    v11 = 1;
    goto LABEL_7;
  }
  v14 = 0;
LABEL_8:
  if (-[NotificationRelay refreshManagers](self, "refreshManagers"))
    -[NotificationRelay refreshManagersForPreferences:localNotifications:](self, "refreshManagersForPreferences:localNotifications:", v14, v11);
LABEL_10:

}

- (void)refreshManagersForPreferences:(BOOL)a3 localNotifications:(BOOL)a4
{
  if (a3)
    +[ClockManager loadUserPreferences](ClockManager, "loadUserPreferences", a3, a4);
}

- (BOOL)refreshManagers
{
  return self->_refreshManagers;
}

- (void)setRefreshManagers:(BOOL)a3
{
  self->_refreshManagers = a3;
}

@end
