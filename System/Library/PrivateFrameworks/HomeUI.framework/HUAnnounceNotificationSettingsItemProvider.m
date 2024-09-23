@implementation HUAnnounceNotificationSettingsItemProvider

- (HUAnnounceNotificationSettingsItemProvider)initWithHome:(id)a3
{
  id v5;
  HUAnnounceNotificationSettingsItemProvider *v6;
  HUAnnounceNotificationSettingsItemProvider *v7;
  uint64_t v8;
  NSMutableSet *items;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HUAnnounceNotificationSettingsItemProvider;
  v6 = -[HFItemProvider init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_home, a3);
    v8 = objc_opt_new();
    items = v7->_items;
    v7->_items = (NSMutableSet *)v8;

  }
  return v7;
}

- (HUAnnounceNotificationSettingsItemProvider)init
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithUser_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUAnnounceNotificationSettingsItemProvider.m"), 98, CFSTR("%s is unavailable; use %@ instead"),
    "-[HUAnnounceNotificationSettingsItemProvider init]",
    v5);

  return 0;
}

- (HMUser)user
{
  void *v2;
  void *v3;

  -[HUAnnounceNotificationSettingsItemProvider home](self, "home");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentUser");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (HMUser *)v3;
}

- (id)reloadItems
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;
  id location;

  objc_initWeak(&location, self);
  -[HUAnnounceNotificationSettingsItemProvider _notificationModes](self, "_notificationModes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __57__HUAnnounceNotificationSettingsItemProvider_reloadItems__block_invoke_3;
  v10[3] = &unk_1E6F4EC68;
  objc_copyWeak(&v11, &location);
  -[HFItemProvider reloadItemsWithObjects:keyAdaptor:itemAdaptor:filter:itemMap:](self, "reloadItemsWithObjects:keyAdaptor:itemAdaptor:filter:itemMap:", v3, &__block_literal_global_31, &__block_literal_global_50, 0, v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v4;
  v8[1] = 3221225472;
  v8[2] = __57__HUAnnounceNotificationSettingsItemProvider_reloadItems__block_invoke_5;
  v8[3] = &unk_1E6F4D2C8;
  objc_copyWeak(&v9, &location);
  objc_msgSend(v5, "flatMap:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_destroyWeak(&v9);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
  return v6;
}

id __57__HUAnnounceNotificationSettingsItemProvider_reloadItems__block_invoke(uint64_t a1, void *a2)
{
  return a2;
}

uint64_t __57__HUAnnounceNotificationSettingsItemProvider_reloadItems__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(a2, "notificationMode"));
}

HUAnnounceNotificationSettingsItem *__57__HUAnnounceNotificationSettingsItemProvider_reloadItems__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  id v6;
  HUAnnounceNotificationSettingsItem *v7;
  HUAnnounceNotificationSettingsItem *v8;
  uint64_t v9;
  void *v10;
  _QWORD v12[4];
  id v13;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "items");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __57__HUAnnounceNotificationSettingsItemProvider_reloadItems__block_invoke_4;
  v12[3] = &unk_1E6F4DAD8;
  v6 = v3;
  v13 = v6;
  objc_msgSend(v5, "na_firstObjectPassingTest:", v12);
  v7 = (HUAnnounceNotificationSettingsItem *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    v8 = [HUAnnounceNotificationSettingsItem alloc];
    v9 = objc_msgSend(v6, "unsignedIntegerValue");
    objc_msgSend(WeakRetained, "user");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[HUAnnounceNotificationSettingsItem initWithNotificationMode:user:](v8, "initWithNotificationMode:user:", v9, v10);

  }
  return v7;
}

BOOL __57__HUAnnounceNotificationSettingsItemProvider_reloadItems__block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  _BOOL8 v8;

  v3 = a2;
  objc_opt_class();
  v4 = v3;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  if (v6)
  {
    v7 = objc_msgSend(v6, "notificationMode");
    v8 = v7 == objc_msgSend(*(id *)(a1 + 32), "unsignedIntegerValue");
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

id __57__HUAnnounceNotificationSettingsItemProvider_reloadItems__block_invoke_5(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "items");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addedItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unionSet:", v6);

  objc_msgSend(WeakRetained, "items");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removedItems");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "minusSet:", v8);

  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)invalidationReasons
{
  void *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HUAnnounceNotificationSettingsItemProvider;
  -[HFItemProvider invalidationReasons](&v5, sel_invalidationReasons);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setByAddingObject:", *MEMORY[0x1E0D308F0]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_notificationModes
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", &unk_1E7040618);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D314E0], "sharedDispatcher");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "authorizationStatus");

  if (HFLocationServicesAvailableForAuthorizationStatus())
  {
    objc_msgSend(v3, "addObject:", &unk_1E7040630);
    -[HUAnnounceNotificationSettingsItemProvider home](self, "home");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUAnnounceNotificationSettingsItemProvider user](self, "user");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "homeAccessControlForUser:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isRemoteAccessAllowed");

    if (v8)
      objc_msgSend(v3, "addObject:", &unk_1E7040648);
  }
  v9 = (void *)objc_msgSend(v3, "copy");

  return v9;
}

- (NSMutableSet)items
{
  return self->_items;
}

- (HMHome)home
{
  return self->_home;
}

- (void)setHome:(id)a3
{
  objc_storeStrong((id *)&self->_home, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_home, 0);
  objc_storeStrong((id *)&self->_items, 0);
}

@end
