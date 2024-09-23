@implementation MTCFUserNotificationPoster

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_2 != -1)
    dispatch_once(&sharedInstance_onceToken_2, &__block_literal_global_51);
  return (id)sharedInstance___sharedInstance;
}

void __44__MTCFUserNotificationPoster_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedInstance___sharedInstance;
  sharedInstance___sharedInstance = v0;

}

- (MTCFUserNotificationPoster)init
{
  MTCFUserNotificationPoster *v2;
  uint64_t v3;
  NSMutableDictionary *notifications;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MTCFUserNotificationPoster;
  v2 = -[MTCFUserNotificationPoster init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    notifications = v2->_notifications;
    v2->_notifications = (NSMutableDictionary *)v3;

  }
  return v2;
}

+ (void)postNotificationWithIdentifier:(id)a3 title:(id)a4 message:(id)a5 defaultButtonTitle:(id)a6 otherButtonTitle:(id)a7 bypassDND:(BOOL)a8 handler:(id)a9
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  const __CFDictionary *v21;
  CFUserNotificationRef v22;
  _BOOL4 v23;
  NSObject *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  __CFRunLoopSource *RunLoopSource;
  __CFRunLoop *Main;
  id obj;
  id v33;
  SInt32 error;
  uint8_t buf[4];
  id v36;
  __int16 v37;
  id v38;
  _QWORD v39[4];
  _QWORD v40[5];

  v40[4] = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v33 = a9;
  v19 = *MEMORY[0x1E0C9B810];
  v39[0] = *MEMORY[0x1E0C9B800];
  v39[1] = v19;
  v40[0] = v15;
  v40[1] = v16;
  v20 = *MEMORY[0x1E0C9B830];
  v39[2] = *MEMORY[0x1E0C9B838];
  v39[3] = v20;
  v40[2] = v17;
  v40[3] = v18;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v40, v39, 4);
  v21 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  error = 0;
  v22 = CFUserNotificationCreate(0, 0.0, 3uLL, &error, v21);
  if (v22)
  {
    v23 = error == 0;
    MTLogForCategory(3);
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = v24;
    if (v23)
    {
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v36 = a1;
        v37 = 2114;
        v38 = v14;
        _os_log_impl(&dword_19AC4E000, v25, OS_LOG_TYPE_DEFAULT, "%{public}@ posting CFUserNotification for %{public}@", buf, 0x16u);
      }

      CFRetain(v22);
      +[MTCFUserNotificationPoster sharedInstance](MTCFUserNotificationPoster, "sharedInstance");
      obj = (id)objc_claimAutoreleasedReturnValue();
      objc_sync_enter(obj);
      v26 = (void *)objc_opt_new();
      objc_msgSend(v26, "setIdentifier:", v14);
      objc_msgSend(v26, "setHandler:", v33);
      +[MTOSTransaction transactionWithDescription:timeout:](MTOSTransaction, "transactionWithDescription:timeout:", v14, 1800.0);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setTransaction:", v27);

      objc_msgSend(v26, "setNotification:", v22);
      +[MTCFUserNotificationPoster sharedInstance](MTCFUserNotificationPoster, "sharedInstance");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "notifications");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "setObject:forKeyedSubscript:", v26, v14);

      objc_sync_exit(obj);
      RunLoopSource = CFUserNotificationCreateRunLoopSource(0, v22, (CFUserNotificationCallBack)_CFUserNotificationCallback, 0);
      Main = CFRunLoopGetMain();
      CFRunLoopAddSource(Main, RunLoopSource, (CFRunLoopMode)*MEMORY[0x1E0C9B270]);
      CFRelease(RunLoopSource);
    }
    else
    {
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        +[MTCFUserNotificationPoster postNotificationWithIdentifier:title:message:defaultButtonTitle:otherButtonTitle:bypassDND:handler:].cold.1((uint64_t)a1, v25);

    }
    CFRelease(v22);
  }

}

+ (void)cancelNotificationsWithIdentifiers:(id)a3
{
  void *v4;
  id v5;
  _QWORD v6[5];

  v5 = a3;
  +[MTCFUserNotificationPoster sharedInstance](MTCFUserNotificationPoster, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v4);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __65__MTCFUserNotificationPoster_cancelNotificationsWithIdentifiers___block_invoke;
  v6[3] = &__block_descriptor_40_e18_v16__0__NSString_8l;
  v6[4] = a1;
  objc_msgSend(v5, "na_each:", v6);
  objc_sync_exit(v4);

}

void __65__MTCFUserNotificationPoster_cancelNotificationsWithIdentifiers___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  +[MTCFUserNotificationPoster sharedInstance](MTCFUserNotificationPoster, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "notifications");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    MTLogForCategory(3);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(_QWORD *)(a1 + 32);
      objc_msgSend(v6, "identifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543618;
      v13 = v8;
      v14 = 2114;
      v15 = v9;
      _os_log_impl(&dword_19AC4E000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ cancelling CFUserNotification for %{public}@", (uint8_t *)&v12, 0x16u);

    }
    CFUserNotificationCancel((CFUserNotificationRef)objc_msgSend(v6, "notification"));
    +[MTCFUserNotificationPoster sharedInstance](MTCFUserNotificationPoster, "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "notifications");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "removeObjectForKey:", v3);

  }
}

- (NSMutableDictionary)notifications
{
  return self->_notifications;
}

- (void)setNotifications:(id)a3
{
  objc_storeStrong((id *)&self->_notifications, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notifications, 0);
}

+ (void)postNotificationWithIdentifier:(uint64_t)a1 title:(NSObject *)a2 message:defaultButtonTitle:otherButtonTitle:bypassDND:handler:.cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_19AC4E000, a2, OS_LOG_TYPE_ERROR, "%{public}@ failed to post CFUserNotification", (uint8_t *)&v2, 0xCu);
}

@end
