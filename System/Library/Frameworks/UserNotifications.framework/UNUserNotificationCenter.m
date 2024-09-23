@implementation UNUserNotificationCenter

- (id)badgeNumber
{
  void *v3;
  void *v4;

  +[UNUserNotificationServiceConnection sharedInstance](UNUserNotificationServiceConnection, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "badgeNumberForBundleIdentifier:", self->_bundleIdentifier);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)requestAuthorizationWithOptions:(UNAuthorizationOptions)options completionHandler:(void *)completionHandler
{
  void *v6;
  id v7;

  v6 = completionHandler;
  +[UNUserNotificationServiceConnection sharedInstance](UNUserNotificationServiceConnection, "sharedInstance");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "requestAuthorizationWithOptions:forBundleIdentifier:completionHandler:", options, self->_bundleIdentifier, v6);

}

- (id)notificationSettings
{
  void *v3;
  void *v4;

  +[UNUserNotificationServiceConnection sharedInstance](UNUserNotificationServiceConnection, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "notificationSettingsForBundleIdentifier:", self->_bundleIdentifier);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)setBadgeNumber:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  +[UNUserNotificationServiceConnection sharedInstance](UNUserNotificationServiceConnection, "sharedInstance");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setBadgeNumber:forBundleIdentifier:withCompletionHandler:", v7, self->_bundleIdentifier, v6);

}

- (void)getNotificationSettingsWithCompletionHandler:(void *)completionHandler
{
  void *v4;
  id v5;

  v4 = completionHandler;
  +[UNUserNotificationServiceConnection sharedInstance](UNUserNotificationServiceConnection, "sharedInstance");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "getNotificationSettingsForBundleIdentifier:withCompletionHandler:", self->_bundleIdentifier, v4);

}

- (void)setDelegate:(id)delegate
{
  objc_storeWeak((id *)&self->_delegate, delegate);
}

+ (UNUserNotificationCenter)currentNotificationCenter
{
  _QWORD v3[6];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __53__UNUserNotificationCenter_currentNotificationCenter__block_invoke;
  v3[3] = &__block_descriptor_48_e5_v8__0l;
  v3[4] = a2;
  v3[5] = a1;
  if (currentNotificationCenter_onceToken != -1)
    dispatch_once(&currentNotificationCenter_onceToken, v3);
  return (UNUserNotificationCenter *)(id)currentNotificationCenter___sharedInstance;
}

void __53__UNUserNotificationCenter_currentNotificationCenter__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  int v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  UNUserNotificationCenter *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  id v27;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), CFSTR("UNUserNotificationCenter.m"), 41, CFSTR("mainBundle is nil"));

  }
  objc_msgSend(v2, "objectForInfoDictionaryKey:", CFSTR("CFBundlePackageType"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v3, "isEqualToString:", CFSTR("APPL")))
  {
    objc_msgSend(v2, "bundleURL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 0;
    v10 = objc_msgSend(v9, "getResourceValue:forKey:error:", &v27, *MEMORY[0x1E0C999C0], 0);
    v11 = v27;
    v12 = v11;
    if (!v10)
    {
LABEL_18:

      goto LABEL_19;
    }
    if (objc_msgSend(v11, "BOOLValue"))
    {
      objc_msgSend(v2, "bundleIdentifier");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v4)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), CFSTR("UNUserNotificationCenter.m"), 56, CFSTR("UNUserNotificationCenter could not determine bundleIdentifier of the application: bundleURL=%@"), v9);
LABEL_17:

        goto LABEL_18;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CA5890], "bundleProxyForCurrentProcess");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v13)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = *(_QWORD *)(a1 + 32);
        v20 = *(_QWORD *)(a1 + 40);
        objc_msgSend(v2, "bundleURL");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", v19, v20, CFSTR("UNUserNotificationCenter.m"), 63, CFSTR("bundleProxyForCurrentProcess is nil: mainBundle.bundleURL %@"), v21);

      }
      objc_msgSend(v13, "un_applicationBundleIdentifier");
      v14 = objc_claimAutoreleasedReturnValue();
      if (!v14)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = *(_QWORD *)(a1 + 32);
        v23 = *(_QWORD *)(a1 + 40);
        v25 = objc_opt_class();
        objc_msgSend(v13, "bundleIdentifier");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", v24, v23, CFSTR("UNUserNotificationCenter.m"), 66, CFSTR("application bundle identifier for %@ with bundle identifier %@"), v25, v26);

        goto LABEL_17;
      }
      v4 = (void *)v14;

    }
    goto LABEL_15;
  }
  objc_msgSend(v2, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
LABEL_15:
    v15 = -[UNUserNotificationCenter initWithBundleIdentifier:]([UNUserNotificationCenter alloc], "initWithBundleIdentifier:", v4);
    v16 = (void *)currentNotificationCenter___sharedInstance;
    currentNotificationCenter___sharedInstance = (uint64_t)v15;

    goto LABEL_19;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 40);
  objc_msgSend(v2, "bundleURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", v7, v6, CFSTR("UNUserNotificationCenter.m"), 47, CFSTR("mainBundle.bundleIdentifier is nil: mainBundle.bundleURL %@"), v8);

LABEL_19:
}

- (UNUserNotificationCenter)initWithBundleIdentifier:(id)a3 queue:(id)a4
{
  id v7;
  id v8;
  UNUserNotificationCenter *v9;
  NSObject *v10;
  uint64_t v11;
  NSString *bundleIdentifier;
  void *v14;
  objc_super v15;
  uint8_t buf[4];
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UNUserNotificationCenter.m"), 101, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("bundleIdentifier != nil"));

  }
  v15.receiver = self;
  v15.super_class = (Class)UNUserNotificationCenter;
  v9 = -[UNUserNotificationCenter init](&v15, sel_init);
  if (v9)
  {
    UNRegisterUserNotificationsLogging();
    v10 = UNLogConnections;
    if (os_log_type_enabled((os_log_t)UNLogConnections, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v17 = v7;
      _os_log_impl(&dword_1AA8E4000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@] Creating a user notification center", buf, 0xCu);
    }
    v11 = objc_msgSend(v7, "copy");
    bundleIdentifier = v9->_bundleIdentifier;
    v9->_bundleIdentifier = (NSString *)v11;

    objc_storeStrong((id *)&v9->_queue, a4);
  }

  return v9;
}

- (UNUserNotificationCenter)initWithBundleIdentifier:(id)a3
{
  return -[UNUserNotificationCenter initWithBundleIdentifier:queue:](self, "initWithBundleIdentifier:queue:", a3, MEMORY[0x1E0C80D38]);
}

- (void)removePendingNotificationRequestsWithIdentifiers:(NSArray *)identifiers
{
  NSArray *v4;
  id v5;

  v4 = identifiers;
  +[UNUserNotificationServiceConnection sharedInstance](UNUserNotificationServiceConnection, "sharedInstance");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removePendingNotificationRequestsWithIdentifiers:forBundleIdentifier:completionHandler:", v4, self->_bundleIdentifier, 0);

}

- (void)removeDeliveredNotificationsWithIdentifiers:(NSArray *)identifiers
{
  NSArray *v4;
  id v5;

  v4 = identifiers;
  +[UNUserNotificationServiceConnection sharedInstance](UNUserNotificationServiceConnection, "sharedInstance");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeDeliveredNotificationsWithIdentifiers:forBundleIdentifier:completionHandler:", v4, self->_bundleIdentifier, 0);

}

- (void)setNotificationCategories:(NSSet *)categories
{
  NSSet *v4;
  id v5;

  v4 = categories;
  +[UNUserNotificationServiceConnection sharedInstance](UNUserNotificationServiceConnection, "sharedInstance");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setNotificationCategories:forBundleIdentifier:", v4, self->_bundleIdentifier);

}

+ (BOOL)supportsContentExtensions
{
  return 1;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_privateDelegate);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)getPendingNotificationRequestsWithCompletionHandler:(void *)completionHandler
{
  void *v4;
  id v5;

  v4 = completionHandler;
  +[UNUserNotificationServiceConnection sharedInstance](UNUserNotificationServiceConnection, "sharedInstance");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "getPendingNotificationRequestsForBundleIdentifier:withCompletionHandler:", self->_bundleIdentifier, v4);

}

- (void)getNotificationSettingsForTopicsWithCompletionHandler:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  +[UNUserNotificationServiceConnection sharedInstance](UNUserNotificationServiceConnection, "sharedInstance");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "getNotificationSettingsForTopicsWithBundleIdentifier:withCompletionHandler:", self->_bundleIdentifier, v4);

}

- (void)setPrivateDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_privateDelegate, a3);
}

- (id)notificationCategories
{
  void *v3;
  void *v4;

  +[UNUserNotificationServiceConnection sharedInstance](UNUserNotificationServiceConnection, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "notificationCategoriesForBundleIdentifier:", self->_bundleIdentifier);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)getDeliveredNotificationsWithCompletionHandler:(void *)completionHandler
{
  void *v4;
  id v5;

  v4 = completionHandler;
  +[UNUserNotificationServiceConnection sharedInstance](UNUserNotificationServiceConnection, "sharedInstance");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "getDeliveredNotificationsForBundleIdentifier:withCompletionHandler:", self->_bundleIdentifier, v4);

}

- (void)removeAllPendingNotificationRequests
{
  id v3;

  +[UNUserNotificationServiceConnection sharedInstance](UNUserNotificationServiceConnection, "sharedInstance");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAllPendingNotificationRequestsForBundleIdentifier:completionHandler:", self->_bundleIdentifier, 0);

}

- (BOOL)supportsContentExtensions
{
  return objc_msgSend((id)objc_opt_class(), "supportsContentExtensions");
}

- (void)getNotificationCategoriesWithCompletionHandler:(void *)completionHandler
{
  void *v4;
  id v5;

  v4 = completionHandler;
  +[UNUserNotificationServiceConnection sharedInstance](UNUserNotificationServiceConnection, "sharedInstance");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "getNotificationCategoriesForBundleIdentifier:withCompletionHandler:", self->_bundleIdentifier, v4);

}

- (void)setBadgeCount:(NSInteger)newBadgeCount withCompletionHandler:(void *)completionHandler
{
  void *v6;
  void *v7;
  NSString *bundleIdentifier;
  void (**v9)(id, void *);

  v9 = completionHandler;
  +[UNUserNotificationServiceConnection sharedInstance](UNUserNotificationServiceConnection, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((newBadgeCount & 0x8000000000000000) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", newBadgeCount);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setBadgeCount:forBundleIdentifier:withCompletionHandler:", v7, self->_bundleIdentifier, v9);
LABEL_5:

    goto LABEL_6;
  }
  bundleIdentifier = self->_bundleIdentifier;
  UNLogToDeveloper((uint64_t)CFSTR("-[UNUserNotificationCenter setBadgeCount:(NSInteger) error:(NSError *)]"), (uint64_t)CFSTR("[%{public}@] Error received an invalid badge count. %{public}lu"));
  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "un_errorWithUNErrorCode:userInfo:", 1600, 0, bundleIdentifier, newBadgeCount);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9[2](v9, v7);
    goto LABEL_5;
  }
LABEL_6:

}

void __46__UNUserNotificationCenter_didChangeSettings___block_invoke(uint64_t a1)
{
  id WeakRetained;
  char v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 32));
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    v4 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 32));
    objc_msgSend(v4, "userNotificationCenter:didChangeSettings:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

  }
}

- (void)setNotificationTopics:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  +[UNUserNotificationServiceConnection sharedInstance](UNUserNotificationServiceConnection, "sharedInstance");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setNotificationTopics:forBundleIdentifier:withCompletionHandler:", v7, self->_bundleIdentifier, v6);

}

- (void)setWantsNotificationResponsesDelivered
{
  id v3;

  +[UNUserNotificationCenterDelegateConnectionListener sharedInstance](UNUserNotificationCenterDelegateConnectionListener, "sharedInstance");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDelegate:forBundleIdentifier:", self, self->_bundleIdentifier);

}

- (void)didChangeSettings:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __46__UNUserNotificationCenter_didChangeSettings___block_invoke;
  v7[3] = &unk_1E57EFBA8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (id)notificationSettingsForTopics
{
  void *v3;
  void *v4;

  +[UNUserNotificationServiceConnection sharedInstance](UNUserNotificationServiceConnection, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "notificationSettingsForTopicsWithBundleIdentifier:", self->_bundleIdentifier);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)deliveredNotifications
{
  void *v3;
  void *v4;

  +[UNUserNotificationServiceConnection sharedInstance](UNUserNotificationServiceConnection, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "deliveredNotificationsForBundleIdentifier:", self->_bundleIdentifier);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (UNUserNotificationCenter)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UNUserNotificationCenter.m"), 92, CFSTR("use +currentNotificationCenter"));

  return 0;
}

- (void)requestRemoveAuthorizationWithCompletionHandler:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  +[UNUserNotificationServiceConnection sharedInstance](UNUserNotificationServiceConnection, "sharedInstance");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "requestRemoveAuthorizationForBundleIdentifier:completionHandler:", self->_bundleIdentifier, v4);

}

- (id)pendingNotificationRequests
{
  void *v3;
  void *v4;

  +[UNUserNotificationServiceConnection sharedInstance](UNUserNotificationServiceConnection, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pendingNotificationRequestsForBundleIdentifier:", self->_bundleIdentifier);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)addNotificationRequest:(id)a3
{
  -[UNUserNotificationCenter addNotificationRequest:withCompletionHandler:](self, "addNotificationRequest:withCompletionHandler:", a3, 0);
}

- (void)addNotificationRequest:(UNNotificationRequest *)request withCompletionHandler:(void *)completionHandler
{
  UNNotificationRequest *v6;
  void *v7;
  void *v8;
  NSString *bundleIdentifier;
  id v10;
  UNNotificationRequest *v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, void *);
  void *v15;
  UNNotificationRequest *v16;
  id v17;

  v6 = request;
  v7 = completionHandler;
  +[UNUserNotificationServiceConnection sharedInstance](UNUserNotificationServiceConnection, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UNNotificationRequest addSecurityScope:](v6, "addSecurityScope:", CFSTR("com.apple.app-sandbox.read-write"));
  bundleIdentifier = self->_bundleIdentifier;
  v12 = MEMORY[0x1E0C809B0];
  v13 = 3221225472;
  v14 = __73__UNUserNotificationCenter_addNotificationRequest_withCompletionHandler___block_invoke;
  v15 = &unk_1E57EFF58;
  v16 = v6;
  v17 = v7;
  v10 = v7;
  v11 = v6;
  objc_msgSend(v8, "addNotificationRequest:forBundleIdentifier:withCompletionHandler:", v11, bundleIdentifier, &v12);
  -[UNNotificationRequest removeSecurityScope](v11, "removeSecurityScope", v12, v13, v14, v15);

}

void __73__UNUserNotificationCenter_addNotificationRequest_withCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (*(_QWORD *)(a1 + 32))
  {
    v6[0] = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[UNAttachmentUtilities deleteAttachmentFilesInRequestsIfNecessary:](UNAttachmentUtilities, "deleteAttachmentFilesInRequestsIfNecessary:", v4);

  }
  v5 = *(_QWORD *)(a1 + 40);
  if (v5)
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);

}

- (void)replaceContentForRequestWithIdentifier:(id)a3 replacementContent:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NSString *bundleIdentifier;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, void *);
  void *v18;
  id v19;
  id v20;

  v8 = a4;
  v9 = a5;
  v10 = a3;
  +[UNUserNotificationServiceConnection sharedInstance](UNUserNotificationServiceConnection, "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addSecurityScope:", CFSTR("com.apple.app-sandbox.read-write"));
  bundleIdentifier = self->_bundleIdentifier;
  v15 = MEMORY[0x1E0C809B0];
  v16 = 3221225472;
  v17 = __104__UNUserNotificationCenter_replaceContentForRequestWithIdentifier_replacementContent_completionHandler___block_invoke;
  v18 = &unk_1E57EFF58;
  v19 = v8;
  v20 = v9;
  v13 = v9;
  v14 = v8;
  objc_msgSend(v11, "replaceContentForRequestWithIdentifier:bundleIdentifier:replacementContent:completionHandler:", v10, bundleIdentifier, v14, &v15);

  objc_msgSend(v14, "removeSecurityScope", v15, v16, v17, v18);
}

void __104__UNUserNotificationCenter_replaceContentForRequestWithIdentifier_replacementContent_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (*(_QWORD *)(a1 + 32))
  {
    v6[0] = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[UNAttachmentUtilities deleteAttachmentFilesInContentsIfNecessary:](UNAttachmentUtilities, "deleteAttachmentFilesInContentsIfNecessary:", v4);

  }
  v5 = *(_QWORD *)(a1 + 40);
  if (v5)
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);

}

- (void)setNotificationRequests:(id)a3
{
  -[UNUserNotificationCenter setNotificationRequests:completionHandler:](self, "setNotificationRequests:completionHandler:", a3, 0);
}

- (void)setNotificationRequests:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSString *bundleIdentifier;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, void *);
  void *v15;
  id v16;
  id v17;

  v6 = a3;
  v7 = a4;
  +[UNUserNotificationServiceConnection sharedInstance](UNUserNotificationServiceConnection, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", &__block_literal_global_8);
  bundleIdentifier = self->_bundleIdentifier;
  v12 = MEMORY[0x1E0C809B0];
  v13 = 3221225472;
  v14 = __70__UNUserNotificationCenter_setNotificationRequests_completionHandler___block_invoke_2;
  v15 = &unk_1E57EFF58;
  v16 = v6;
  v17 = v7;
  v10 = v7;
  v11 = v6;
  objc_msgSend(v8, "setNotificationRequests:forBundleIdentifier:completionHandler:", v11, bundleIdentifier, &v12);
  objc_msgSend(v11, "enumerateObjectsUsingBlock:", &__block_literal_global_31, v12, v13, v14, v15);

}

uint64_t __70__UNUserNotificationCenter_setNotificationRequests_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "addSecurityScope:", CFSTR("com.apple.app-sandbox.read-write"));
}

void __70__UNUserNotificationCenter_setNotificationRequests_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;

  v3 = a2;
  v5 = v3;
  if (*(_QWORD *)(a1 + 32))
  {
    +[UNAttachmentUtilities deleteAttachmentFilesInRequestsIfNecessary:](UNAttachmentUtilities, "deleteAttachmentFilesInRequestsIfNecessary:");
    v3 = v5;
  }
  v4 = *(_QWORD *)(a1 + 40);
  if (v4)
  {
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v5);
    v3 = v5;
  }

}

uint64_t __70__UNUserNotificationCenter_setNotificationRequests_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "removeSecurityScope");
}

- (void)removeSimilarNotificationRequests:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  +[UNUserNotificationServiceConnection sharedInstance](UNUserNotificationServiceConnection, "sharedInstance");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeSimilarNotificationRequests:forBundleIdentifier:completionHandler:", v4, self->_bundleIdentifier, 0);

}

- (void)removeAllDeliveredNotifications
{
  id v3;

  +[UNUserNotificationServiceConnection sharedInstance](UNUserNotificationServiceConnection, "sharedInstance");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAllDeliveredNotificationsForBundleIdentifier:completionHandler:", self->_bundleIdentifier, 0);

}

- (void)getBadgeNumberWithCompletionHandler:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  +[UNUserNotificationServiceConnection sharedInstance](UNUserNotificationServiceConnection, "sharedInstance");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "getBadgeNumberForBundleIdentifier:withCompletionHandler:", self->_bundleIdentifier, v4);

}

- (void)setBadgeString:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  +[UNUserNotificationServiceConnection sharedInstance](UNUserNotificationServiceConnection, "sharedInstance");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setBadgeString:forBundleIdentifier:withCompletionHandler:", v7, self->_bundleIdentifier, v6);

}

- (void)didReceiveNotificationResponse:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __81__UNUserNotificationCenter_didReceiveNotificationResponse_withCompletionHandler___block_invoke;
  block[3] = &unk_1E57EFB80;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, block);

}

void __81__UNUserNotificationCenter_didReceiveNotificationResponse_withCompletionHandler___block_invoke(_QWORD *a1)
{
  id WeakRetained;
  char v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 8));
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    v4 = objc_loadWeakRetained((id *)(a1[4] + 8));
    objc_msgSend(v4, "userNotificationCenter:didReceiveNotificationResponse:withCompletionHandler:", a1[4], a1[5], a1[6]);

  }
  else
  {
    (*(void (**)(void))(a1[6] + 16))();
  }
}

- (void)didOpenApplicationForResponse:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __58__UNUserNotificationCenter_didOpenApplicationForResponse___block_invoke;
  v7[3] = &unk_1E57EFBA8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

void __58__UNUserNotificationCenter_didOpenApplicationForResponse___block_invoke(uint64_t a1)
{
  id WeakRetained;
  char v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 32));
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    v4 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 32));
    objc_msgSend(v4, "userNotificationCenter:didOpenApplicationForResponse:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

  }
}

- (void)getNotificationTopicsWithCompletionHandler:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  +[UNUserNotificationServiceConnection sharedInstance](UNUserNotificationServiceConnection, "sharedInstance");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "getNotificationTopicsForBundleIdentifier:withCompletionHandler:", self->_bundleIdentifier, v4);

}

- (id)notificationTopics
{
  void *v3;
  void *v4;

  +[UNUserNotificationServiceConnection sharedInstance](UNUserNotificationServiceConnection, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "notificationTopicsForBundleIdentifier:", self->_bundleIdentifier);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)clearedInfoForDataProviderMigration
{
  void *v3;
  void *v4;

  +[UNUserNotificationServiceConnection sharedInstance](UNUserNotificationServiceConnection, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "clearedInfoForBundleIdentifier:", self->_bundleIdentifier);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)delegate
{
  return objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (UNUserNotificationCenterDelegatePrivate)privateDelegate
{
  return (UNUserNotificationCenterDelegatePrivate *)objc_loadWeakRetained((id *)&self->_privateDelegate);
}

@end
