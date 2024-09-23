@implementation GCNotificationManager

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_1 != -1)
    dispatch_once(&sharedInstance_onceToken_1, &__block_literal_global_22);
  return (id)sharedInstance_sharedManager_0;
}

void __39__GCNotificationManager_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedInstance_sharedManager_0;
  sharedInstance_sharedManager_0 = v0;

}

- (GCNotificationManager)init
{
  GCNotificationManager *v2;
  int IsGameControllerDaemon;
  uint64_t v4;
  UNUserNotificationCenter *userNotificationCenter;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GCNotificationManager;
  v2 = -[GCNotificationManager init](&v7, sel_init);
  if (v2)
  {
    IsGameControllerDaemon = currentProcessIsGameControllerDaemon();
    if (IsGameControllerDaemon)
    {
      v4 = objc_msgSend(objc_alloc((Class)&off_254E02DC0), "initWithBundleIdentifier:", CFSTR("com.apple.GameControllerNotifications"));
    }
    else
    {
      +[UNUserNotificationCenter currentNotificationCenter](&off_254E02DC0, "currentNotificationCenter");
      v4 = objc_claimAutoreleasedReturnValue();
    }
    userNotificationCenter = v2->_userNotificationCenter;
    v2->_userNotificationCenter = (UNUserNotificationCenter *)v4;

    v2->_isPermissionGranted = IsGameControllerDaemon;
  }
  return v2;
}

- (void)requestNotificationImpl:(id)a3 withReply:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  uint64_t v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if (self->_isPermissionGranted)
  {
    v7 = a4;
    v8 = objc_alloc_init((Class)&off_254E03E50);
    objc_msgSend(v6, "title");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setTitle:", v9);

    objc_msgSend(v6, "body");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setBody:", v10);

    objc_msgSend(v8, "setShouldIgnoreDoNotDisturb:", 1);
    objc_msgSend(v6, "threadID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setThreadIdentifier:", v11);

    objc_msgSend(v6, "categoryID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    unk_254E0416C(&off_254E04BA0, "categoryWithIdentifier:actions:intentIdentifiers:options:", v12, MEMORY[0x24BDBD1A8], MEMORY[0x24BDBD1A8], 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    -[UNUserNotificationCenter notificationCategories](self->_userNotificationCenter, "notificationCategories");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setByAddingObject:", v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNUserNotificationCenter setNotificationCategories:](self->_userNotificationCenter, "setNotificationCategories:", v15);

    objc_msgSend(v6, "categoryID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setCategoryIdentifier:", v16);

    objc_msgSend(v6, "categoryID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    +[UNNotificationRequest requestWithIdentifier:content:trigger:](&off_254E04F10, "requestWithIdentifier:content:trigger:", v17, v8, 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    -[UNUserNotificationCenter addNotificationRequest:withCompletionHandler:](self->_userNotificationCenter, "addNotificationRequest:withCompletionHandler:", v18, v7);
  }
  else
  {
    v22 = *MEMORY[0x24BDD0FC8];
    v23[0] = CFSTR("Permission not granted");
    v19 = a4;
    +[NSDictionary dictionaryWithObjects:forKeys:count:](&off_254DEBCC0, "dictionaryWithObjects:forKeys:count:", v23, &v22, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    +[NSError errorWithDomain:code:userInfo:](&off_254DF2E50, "errorWithDomain:code:userInfo:", CFSTR("GCNotificationManager"), 0, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))a4 + 2))(v19, v21);

  }
}

- (void)requestNotification:(id)a3 withReply:(id)a4
{
  id v6;
  id v7;
  UNUserNotificationCenter *userNotificationCenter;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;
  id location;

  v6 = a3;
  v7 = a4;
  if (self->_isPermissionGranted)
  {
    -[GCNotificationManager requestNotificationImpl:withReply:](self, "requestNotificationImpl:withReply:", v6, v7);
  }
  else
  {
    objc_initWeak(&location, self);
    userNotificationCenter = self->_userNotificationCenter;
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __55__GCNotificationManager_requestNotification_withReply___block_invoke;
    v9[3] = &unk_24D2B4F98;
    v11 = v7;
    objc_copyWeak(&v12, &location);
    v10 = v6;
    -[UNUserNotificationCenter requestAuthorizationWithOptions:completionHandler:](userNotificationCenter, "requestAuthorizationWithOptions:completionHandler:", 7, v9);

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }

}

void __55__GCNotificationManager_requestNotification_withReply___block_invoke(uint64_t a1, char a2, uint64_t a3)
{
  id WeakRetained;
  _BYTE *v6;

  if (a3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));

    if (WeakRetained)
    {
      v6 = objc_loadWeakRetained((id *)(a1 + 48));
      v6[16] = a2;
      objc_msgSend(v6, "requestNotificationImpl:withReply:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

    }
    else
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userNotificationCenter, 0);
}

@end
