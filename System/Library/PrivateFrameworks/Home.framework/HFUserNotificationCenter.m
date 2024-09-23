@implementation HFUserNotificationCenter

+ (id)sharedInstance
{
  if (_MergedGlobals_261 != -1)
    dispatch_once(&_MergedGlobals_261, &__block_literal_global_3_7);
  return (id)qword_1ED379180;
}

- (void)addObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HFUserNotificationCenter observers](self, "observers");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v4);

}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void)removeObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HFUserNotificationCenter observers](self, "observers");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObject:", v4);

}

- (void)setPresentationHandler:(id)a3
{
  objc_storeWeak((id *)&self->_presentationHandler, a3);
}

void __42__HFUserNotificationCenter_sharedInstance__block_invoke_2()
{
  HFUserNotificationCenter *v0;
  void *v1;

  v0 = objc_alloc_init(HFUserNotificationCenter);
  v1 = (void *)qword_1ED379180;
  qword_1ED379180 = (uint64_t)v0;

}

- (HFUserNotificationCenter)init
{
  HFUserNotificationCenter *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)HFUserNotificationCenter;
  v2 = -[HFUserNotificationCenter init](&v13, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFUserNotificationCenter setObservers:](v2, "setObservers:", v3);

    +[HFExecutionEnvironment sharedInstance](HFExecutionEnvironment, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "hostProcess");

    if (v5)
    {
      v6 = objc_alloc(MEMORY[0x1E0CEC7A0]);
      HFHomeAppBundleID();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)objc_msgSend(v6, "initWithBundleIdentifier:", v7);
      -[HFUserNotificationCenter setUserNotificationCenter:](v2, "setUserNotificationCenter:", v8);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEC7A0], "currentNotificationCenter");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[HFUserNotificationCenter setUserNotificationCenter:](v2, "setUserNotificationCenter:", v7);
    }

    -[HFUserNotificationCenter userNotificationCenter](v2, "userNotificationCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setDelegate:", v2);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObserver:selector:name:object:", v2, sel__applicationDidEnterBackground, *MEMORY[0x1E0CEB288], 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObserver:selector:name:object:", v2, sel__applicationWillEnterForeground, *MEMORY[0x1E0CEB350], 0);

  }
  return v2;
}

- (UNUserNotificationCenter)userNotificationCenter
{
  return self->_userNotificationCenter;
}

- (void)setUserNotificationCenter:(id)a3
{
  objc_storeStrong((id *)&self->_userNotificationCenter, a3);
}

- (void)setObservers:(id)a3
{
  objc_storeStrong((id *)&self->_observers, a3);
}

- (void)_applicationDidEnterBackground
{
  -[HFUserNotificationCenter setNotificationSettingsFuture:](self, "setNotificationSettingsFuture:", 0);
}

- (void)_applicationWillEnterForeground
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[HFUserNotificationCenter observers](self, "observers", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * v7);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v8, "settingsInvalidatedForNotificationCenter:", self);
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

}

- (void)userNotificationCenter:(id)a3 willPresentNotification:(id)a4 withCompletionHandler:(id)a5
{
  (*((void (**)(id, uint64_t))a5 + 2))(a5, 27);
}

- (id)notificationSettings
{
  void *v3;
  id v4;
  void *v5;
  _QWORD v7[5];

  -[HFUserNotificationCenter notificationSettingsFuture](self, "notificationSettingsFuture");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0D519C0]);
    -[HFUserNotificationCenter setNotificationSettingsFuture:](self, "setNotificationSettingsFuture:", v4);

    -[HFUserNotificationCenter userNotificationCenter](self, "userNotificationCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __48__HFUserNotificationCenter_notificationSettings__block_invoke;
    v7[3] = &unk_1EA7345A0;
    v7[4] = self;
    objc_msgSend(v5, "getNotificationSettingsWithCompletionHandler:", v7);

  }
  -[HFUserNotificationCenter notificationSettingsFuture](self, "notificationSettingsFuture");
  return (id)objc_claimAutoreleasedReturnValue();
}

void __48__HFUserNotificationCenter_notificationSettings__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  uint8_t v7[16];

  v3 = a2;
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "notificationSettingsFuture");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "finishWithResult:", v3);
  }
  else
  {
    HFLogForCategory(0x30uLL);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v7 = 0;
      _os_log_error_impl(&dword_1DD34E000, v5, OS_LOG_TYPE_ERROR, "Failed to fetch user notification settings. Perhaps this process is missing the necessary entitlement (in which case it probably shouldn't be using this API).", v7, 2u);
    }

    objc_msgSend(*(id *)(a1 + 32), "notificationSettingsFuture");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB35C8], "na_genericError");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "finishWithError:", v6);

  }
}

- (void)userNotificationCenter:(id)a3 openSettingsForNotification:(id)a4
{
  id v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  HFUserNotificationCenter *v10;

  v5 = a4;
  objc_msgSend(MEMORY[0x1E0D519E8], "mainThreadScheduler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __79__HFUserNotificationCenter_userNotificationCenter_openSettingsForNotification___block_invoke;
  v8[3] = &unk_1EA727188;
  v9 = v5;
  v10 = self;
  v7 = v5;
  objc_msgSend(v6, "performBlock:", v8);

}

void __79__HFUserNotificationCenter_userNotificationCenter_openSettingsForNotification___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "request");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "content");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "defaultActionURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  HFLogForCategory(0x30uLL);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = *(_QWORD *)(a1 + 32);
    v8 = 138412546;
    v9 = v6;
    v10 = 2112;
    v11 = v4;
    _os_log_impl(&dword_1DD34E000, v5, OS_LOG_TYPE_DEFAULT, "Received request to open settings for notification: %@ (object URL: %@)", (uint8_t *)&v8, 0x16u);
  }

  objc_msgSend(*(id *)(a1 + 40), "presentationHandler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "notificationCenter:presentCustomSettingsForNotificationWithObjectURL:", *(_QWORD *)(a1 + 40), v4);

}

- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  HFUserNotificationCenter *v15;
  id v16;
  SEL v17;

  v8 = a4;
  v9 = a5;
  objc_msgSend(MEMORY[0x1E0D519E8], "mainThreadScheduler");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __104__HFUserNotificationCenter_userNotificationCenter_didReceiveNotificationResponse_withCompletionHandler___block_invoke;
  v13[3] = &unk_1EA7345F0;
  v14 = v8;
  v15 = self;
  v16 = v9;
  v17 = a2;
  v11 = v9;
  v12 = v8;
  objc_msgSend(v10, "performBlock:", v13);

}

void __104__HFUserNotificationCenter_userNotificationCenter_didReceiveNotificationResponse_withCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  _QWORD v32[4];
  id v33;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  uint64_t v39;
  _QWORD v40[3];

  v40[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "notification");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "request");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "content");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  HFLogForCategory(0x30uLL);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "notification");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v35 = v7;
    v36 = 2112;
    v37 = v5;
    _os_log_impl(&dword_1DD34E000, v6, OS_LOG_TYPE_DEFAULT, "didReceiveNotificationResponse for notification: %@, userInfo:%@", buf, 0x16u);

  }
  objc_msgSend(*(id *)(a1 + 32), "notification");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "request");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "content");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "categoryIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v11, "isEqualToString:", CFSTR("HomeAppBulletinAudioNotificationCategory")))
  {
    +[HFURLComponents dropInURLComponents](HFURLComponents, "dropInURLComponents");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_alloc(MEMORY[0x1E0CB39D8]);
    objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0CB8388]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v13, "initWithName:value:", CFSTR("homeId"), v14);

    v16 = objc_alloc(MEMORY[0x1E0CB39D8]);
    objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0CB8378]);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(v16, "initWithName:value:", CFSTR("accessoryId"), v17);

    v40[0] = v15;
    v40[1] = v18;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v40, 2);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setQueryItems:", v19);

    objc_msgSend(v12, "URL");
    v20 = objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v20 = 0;
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0CB9FA0]);
  v21 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0CB8358]);
  v22 = objc_claimAutoreleasedReturnValue();
  v23 = (void *)v22;
  if (v21 | v20)
  {
    if (v22)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("&%@=%@"), CFSTR("cameraClip"), v22);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v21, "stringByAppendingString:", v24);
      v25 = objc_claimAutoreleasedReturnValue();

      v21 = v25;
    }
    if (!v20)
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v21);
      v20 = objc_claimAutoreleasedReturnValue();
    }
    HFLogForCategory(0x30uLL);
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      v27 = *(void **)(a1 + 40);
      NSStringFromSelector(*(SEL *)(a1 + 56));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v35 = v27;
      v36 = 2112;
      v37 = v28;
      v38 = 2112;
      v39 = v20;
      _os_log_impl(&dword_1DD34E000, v26, OS_LOG_TYPE_DEFAULT, "%@: %@ Notification URL %@", buf, 0x20u);

    }
    objc_msgSend(*(id *)(a1 + 40), "presentationHandler");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "notificationCenter:presentNotificationWithObjectURL:", *(_QWORD *)(a1 + 40), v20);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 3221225472;
    v32[2] = __104__HFUserNotificationCenter_userNotificationCenter_didReceiveNotificationResponse_withCompletionHandler___block_invoke_27;
    v32[3] = &unk_1EA7345C8;
    v33 = *(id *)(a1 + 48);
    v31 = (id)objc_msgSend(v30, "addCompletionBlock:", v32);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

uint64_t __104__HFUserNotificationCenter_userNotificationCenter_didReceiveNotificationResponse_withCompletionHandler___block_invoke_27(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (HFUserNotificationPresentationHandling)presentationHandler
{
  return (HFUserNotificationPresentationHandling *)objc_loadWeakRetained((id *)&self->_presentationHandler);
}

- (NAFuture)notificationSettingsFuture
{
  return self->_notificationSettingsFuture;
}

- (void)setNotificationSettingsFuture:(id)a3
{
  objc_storeStrong((id *)&self->_notificationSettingsFuture, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_notificationSettingsFuture, 0);
  objc_destroyWeak((id *)&self->_presentationHandler);
  objc_storeStrong((id *)&self->_userNotificationCenter, 0);
}

@end
