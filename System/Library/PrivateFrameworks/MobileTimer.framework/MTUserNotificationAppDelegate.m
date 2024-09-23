@implementation MTUserNotificationAppDelegate

- (MTUserNotificationAppDelegate)init
{
  MTUserNotificationAppDelegate *v2;
  uint64_t v3;
  UNUserNotificationCenter *notificationCenter;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MTUserNotificationAppDelegate;
  v2 = -[MTUserNotificationAppDelegate init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CEC7A0], "currentNotificationCenter");
    v3 = objc_claimAutoreleasedReturnValue();
    notificationCenter = v2->_notificationCenter;
    v2->_notificationCenter = (UNUserNotificationCenter *)v3;

    -[UNUserNotificationCenter setDelegate:](v2->_notificationCenter, "setDelegate:", v2);
  }
  return v2;
}

- (void)userNotificationCenter:(id)a3 willPresentNotification:(id)a4 withCompletionHandler:(id)a5
{
  void (**v7)(id, uint64_t);
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  int v15;
  MTUserNotificationAppDelegate *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v7 = (void (**)(id, uint64_t))a5;
  v8 = a4;
  MTLogForCategory(3);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v15 = 138543362;
    v16 = self;
    _os_log_impl(&dword_19AC4E000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ received willPresentNotification", (uint8_t *)&v15, 0xCu);
  }

  objc_msgSend(v8, "request");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "content");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "categoryIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v12, "isEqualToString:", CFSTR("AlarmSnoozeCountdown")))
  {
    if (v7)
    {
      MTLogForCategory(3);
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v15 = 138543618;
        v16 = self;
        v17 = 2114;
        v18 = v12;
        _os_log_impl(&dword_19AC4E000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ completing with UNNotificationPresentationOptionAlert for %{public}@", (uint8_t *)&v15, 0x16u);
      }
      v14 = 4;
LABEL_12:

      v7[2](v7, v14);
    }
  }
  else if (v7)
  {
    MTLogForCategory(3);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v15 = 138543618;
      v16 = self;
      v17 = 2114;
      v18 = v12;
      _os_log_impl(&dword_19AC4E000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ completing with UNNotificationPresentationOptionAlert|UNNotificationPresentationOptionSound for %{public}@", (uint8_t *)&v15, 0x16u);
    }
    v14 = 6;
    goto LABEL_12;
  }

}

- (UNUserNotificationCenter)notificationCenter
{
  return self->_notificationCenter;
}

- (void)setNotificationCenter:(id)a3
{
  objc_storeStrong((id *)&self->_notificationCenter, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationCenter, 0);
}

@end
