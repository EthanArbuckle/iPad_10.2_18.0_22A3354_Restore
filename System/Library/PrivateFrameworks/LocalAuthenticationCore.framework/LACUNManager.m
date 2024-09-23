@implementation LACUNManager

- (LACUNManager)initWithBundleIdentifier:(id)a3
{
  return -[LACUNManager initWithBundleIdentifier:categories:](self, "initWithBundleIdentifier:categories:", a3, MEMORY[0x24BDBD1A8]);
}

- (LACUNManager)initWithBundleIdentifier:(id)a3 categories:(id)a4
{
  id v6;
  id v7;
  LACUNManager *v8;
  LACUNManager *v9;
  uint64_t v10;
  UNUserNotificationCenter *notificationCenter;
  _QWORD v13[4];
  id v14;
  LACUNManager *v15;
  id v16;
  objc_super v17;

  v6 = a3;
  v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)LACUNManager;
  v8 = -[LACUNManager init](&v17, sel_init);
  if (v8)
  {
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __52__LACUNManager_initWithBundleIdentifier_categories___block_invoke;
    v13[3] = &unk_2510C1260;
    v14 = v6;
    v9 = v8;
    v15 = v9;
    v16 = v7;
    __52__LACUNManager_initWithBundleIdentifier_categories___block_invoke((uint64_t)v13);
    v10 = objc_claimAutoreleasedReturnValue();
    notificationCenter = v9->_notificationCenter;
    v9->_notificationCenter = (UNUserNotificationCenter *)v10;

  }
  return v8;
}

id __52__LACUNManager_initWithBundleIdentifier_categories___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id UNNotificationActionClass;
  void *v18;
  void *v19;
  uint64_t v20;
  id UNNotificationCategoryClass;
  void *v22;
  void *v23;
  void *v24;
  void *v26;
  id obj;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  if (getUNMutableNotificationContentClass()
    && getUNNotificationActionClass()
    && getUNNotificationCategoryClass()
    && getUNNotificationIconClass()
    && getUNNotificationRequestClass()
    && getUNTimeIntervalNotificationTriggerClass()
    && getUNUserNotificationCenterClass())
  {
    v2 = (void *)objc_msgSend(objc_alloc((Class)getUNUserNotificationCenterClass()), "initWithBundleIdentifier:", *(_QWORD *)(a1 + 32));
    objc_msgSend(v2, "setDelegate:", *(_QWORD *)(a1 + 40));
    v26 = v2;
    objc_msgSend(v2, "setWantsNotificationResponsesDelivered");
    v3 = (void *)objc_opt_new();
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    obj = *(id *)(a1 + 48);
    v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
    if (v30)
    {
      v28 = *(_QWORD *)v38;
      v29 = v3;
      do
      {
        v4 = 0;
        do
        {
          if (*(_QWORD *)v38 != v28)
            objc_enumerationMutation(obj);
          v32 = v4;
          v5 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * v4);
          v6 = (void *)objc_opt_new();
          v33 = 0u;
          v34 = 0u;
          v35 = 0u;
          v36 = 0u;
          v31 = v5;
          objc_msgSend(v5, "actions");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
          if (v8)
          {
            v9 = v8;
            v10 = *(_QWORD *)v34;
            do
            {
              for (i = 0; i != v9; ++i)
              {
                if (*(_QWORD *)v34 != v10)
                  objc_enumerationMutation(v7);
                v12 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
                if (objc_msgSend(v12, "isTitleLocalized"))
                {
                  objc_msgSend(v12, "title");
                  v13 = (void *)objc_claimAutoreleasedReturnValue();
                }
                else
                {
                  v14 = (void *)MEMORY[0x24BDD17C8];
                  objc_msgSend(v12, "title");
                  v15 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v14, "localizedUserNotificationStringForKey:arguments:", v15, 0);
                  v13 = (void *)objc_claimAutoreleasedReturnValue();

                }
                if (objc_msgSend(v12, "isDestructive"))
                  v16 = 2;
                else
                  v16 = 0;
                UNNotificationActionClass = getUNNotificationActionClass();
                objc_msgSend(v12, "identifier");
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(UNNotificationActionClass, "actionWithIdentifier:title:options:", v18, v13, v16);
                v19 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(v6, "addObject:", v19);
              }
              v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
            }
            while (v9);
          }

          if (objc_msgSend(v31, "hiddenPreviewShowsTitle"))
            v20 = 4;
          else
            v20 = 0;
          UNNotificationCategoryClass = getUNNotificationCategoryClass();
          objc_msgSend(v31, "identifier");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(UNNotificationCategoryClass, "categoryWithIdentifier:actions:intentIdentifiers:options:", v22, v6, MEMORY[0x24BDBD1A8], v20);
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          v3 = v29;
          objc_msgSend(v29, "addObject:", v23);

          v4 = v32 + 1;
        }
        while (v32 + 1 != v30);
        v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
      }
      while (v30);
    }

    v24 = v26;
    if (objc_msgSend(v3, "count"))
      objc_msgSend(v26, "setNotificationCategories:", v3);

  }
  else
  {
    v24 = 0;
  }
  return v24;
}

- (void)postNotification:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void (**v8)(_QWORD, _QWORD);
  void *v9;
  UNUserNotificationCenter *notificationCenter;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  __int16 v19;
  void *v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = (void (**)(_QWORD, _QWORD))v7;
  if (self->_notificationCenter)
  {
    objc_msgSend(v6, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      notificationCenter = self->_notificationCenter;
      objc_msgSend(v6, "identifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v21[0] = v11;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v21, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[UNUserNotificationCenter removePendingNotificationRequestsWithIdentifiers:](notificationCenter, "removePendingNotificationRequestsWithIdentifiers:", v12);

    }
    -[LACUNManager _makeNotificationRequestWithConfiguration:](self, "_makeNotificationRequestWithConfiguration:", v6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNUserNotificationCenter addNotificationRequest:withCompletionHandler:](self->_notificationCenter, "addNotificationRequest:withCompletionHandler:", v13, v8);
    LACLogNotifications();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v13, "content");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "identifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138412546;
      v18 = v15;
      v19 = 2112;
      v20 = v16;
      _os_log_impl(&dword_2409DC000, v14, OS_LOG_TYPE_DEFAULT, "Posted notification with content: (%@) identifier: %@)", (uint8_t *)&v17, 0x16u);

    }
    goto LABEL_9;
  }
  if (v7)
  {
    +[LACError errorWithCode:debugDescription:](LACError, "errorWithCode:debugDescription:", -1020, CFSTR("UNUserNotificationCenter instance is nil"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v8)[2](v8, v13);
LABEL_9:

  }
}

- (void)cancelNotificationsWithIdentifiers:(id)a3 scheduledOnly:(BOOL)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(_QWORD, _QWORD);
  NSObject *v11;
  void *v12;
  int v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  v10 = (void (**)(_QWORD, _QWORD))v9;
  if (self->_notificationCenter)
  {
    LACLogNotifications();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 138412290;
      v14 = v8;
      _os_log_impl(&dword_2409DC000, v11, OS_LOG_TYPE_DEFAULT, "Cancelling notifications with identifiers: (%@)", (uint8_t *)&v13, 0xCu);
    }

    -[UNUserNotificationCenter removePendingNotificationRequestsWithIdentifiers:](self->_notificationCenter, "removePendingNotificationRequestsWithIdentifiers:", v8);
    if (!a4)
      -[UNUserNotificationCenter removeDeliveredNotificationsWithIdentifiers:](self->_notificationCenter, "removeDeliveredNotificationsWithIdentifiers:", v8);
    if (v10)
      v10[2](v10, 0);
  }
  else if (v9)
  {
    +[LACError errorWithCode:debugDescription:](LACError, "errorWithCode:debugDescription:", -1020, CFSTR("UNUserNotificationCenter instance is nil"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v10)[2](v10, v12);

  }
}

- (void)cancelAllNotificationsWithCompletion:(id)a3
{
  id v4;
  void (**v5)(_QWORD, _QWORD);
  NSObject *v6;
  void *v7;
  uint8_t v8[16];

  v4 = a3;
  v5 = (void (**)(_QWORD, _QWORD))v4;
  if (self->_notificationCenter)
  {
    LACLogNotifications();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_2409DC000, v6, OS_LOG_TYPE_DEFAULT, "Cancelling all notifications", v8, 2u);
    }

    -[UNUserNotificationCenter removeAllDeliveredNotifications](self->_notificationCenter, "removeAllDeliveredNotifications");
    -[UNUserNotificationCenter removeAllPendingNotificationRequests](self->_notificationCenter, "removeAllPendingNotificationRequests");
    if (v5)
      v5[2](v5, 0);
  }
  else if (v4)
  {
    +[LACError errorWithCode:debugDescription:](LACError, "errorWithCode:debugDescription:", -1020, CFSTR("UNUserNotificationCenter instance is nil"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v5)[2](v5, v7);

  }
}

- (id)_makeNotificationRequestWithConfiguration:(id)a3
{
  id v3;
  id v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  id UNNotificationIconClass;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  id UNTimeIntervalNotificationTriggerClass;
  void *v24;
  id UNNotificationRequestClass;
  void *v26;
  void *v27;

  v3 = a3;
  v4 = objc_alloc_init((Class)getUNMutableNotificationContentClass());
  objc_msgSend(v3, "withdrawInterval");
  if (v5 > 20.0)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "now");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "withdrawInterval");
    objc_msgSend(v6, "dateByAddingTimeInterval:");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "setExpirationDate:", v7);
  }
  objc_msgSend(v3, "systemIconName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    UNNotificationIconClass = getUNNotificationIconClass();
    objc_msgSend(v3, "systemIconName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(UNNotificationIconClass, "iconForSystemImageNamed:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setIcon:", v11);

  }
  if (objc_msgSend(v3, "isTitleLocalized"))
  {
    objc_msgSend(v3, "title");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setTitle:", v12);
  }
  else
  {
    v13 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v3, "title");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "localizedUserNotificationStringForKey:arguments:", v12, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setTitle:", v14);

  }
  if (objc_msgSend(v3, "isBodyLocalized"))
  {
    objc_msgSend(v3, "body");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setBody:", v15);
  }
  else
  {
    v16 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v3, "body");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "localizedUserNotificationStringForKey:arguments:", v15, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setBody:", v17);

  }
  if (objc_msgSend(v3, "isTimeSensitive"))
  {
    objc_msgSend(v4, "setInterruptionLevel:", 2);
    objc_msgSend(v4, "setShouldIgnoreDoNotDisturb:", 1);
  }
  objc_msgSend(v3, "defaultActionURL");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    objc_msgSend(v4, "setHasDefaultAction:", 1);
    objc_msgSend(v3, "defaultActionURL");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setDefaultActionURL:", v19);

    objc_msgSend(v4, "setShouldBackgroundDefaultAction:", 1);
  }
  else
  {
    objc_msgSend(v4, "setShouldSuppressDefaultAction:", 1);
  }
  if (objc_msgSend(v3, "shouldDisplayActionsInline"))
    objc_msgSend(v4, "setShouldDisplayActionsInline:", 1);
  objc_msgSend(v3, "categoryIdentifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    objc_msgSend(v3, "categoryIdentifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setCategoryIdentifier:", v21);

  }
  objc_msgSend(v3, "triggerInterval");
  if (v22 <= 0.0)
  {
    v24 = 0;
  }
  else
  {
    UNTimeIntervalNotificationTriggerClass = getUNTimeIntervalNotificationTriggerClass();
    objc_msgSend(v3, "triggerInterval");
    objc_msgSend(UNTimeIntervalNotificationTriggerClass, "triggerWithTimeInterval:repeats:", 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
  }
  UNNotificationRequestClass = getUNNotificationRequestClass();
  objc_msgSend(v3, "identifier");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(UNNotificationRequestClass, "requestWithIdentifier:content:trigger:", v26, v4, v24);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  return v27;
}

- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5
{
  id v7;
  void (**v8)(_QWORD);
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  LACUNManager *v32;
  void (**v33)(_QWORD);
  _QWORD v34[4];
  _QWORD v35[4];
  uint8_t buf[4];
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  v8 = (void (**)(_QWORD))a5;
  objc_msgSend(v7, "notification");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "request");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "notification");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "request");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "content");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "categoryIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "actionIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  LACLogNotifications();
  v17 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    goto LABEL_16;
  v34[0] = CFSTR("identifier");
  v18 = (uint64_t)v11;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v18 = objc_claimAutoreleasedReturnValue();
  }
  v30 = (void *)v18;
  v35[0] = v18;
  v34[1] = CFSTR("category");
  v19 = (uint64_t)v15;
  if (!v15)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v19 = objc_claimAutoreleasedReturnValue();
  }
  v32 = self;
  v29 = (void *)v19;
  v35[1] = v19;
  v34[2] = CFSTR("action");
  v20 = (uint64_t)v16;
  if (!v16)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v20 = objc_claimAutoreleasedReturnValue();
  }
  v33 = v8;
  v35[2] = v20;
  v34[3] = CFSTR("url");
  objc_msgSend(v7, "notification", v20);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "request");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "content");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "defaultActionURL");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v23;
  if (!v23)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v35[3] = v24;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v35, v34, 4);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)buf = 138543362;
  v37 = v25;
  _os_log_impl(&dword_2409DC000, v17, OS_LOG_TYPE_DEFAULT, "Did receive response for notification %{public}@", buf, 0xCu);

  if (!v23)
  v8 = v33;
  if (!v16)

  self = v32;
  if (v15)
  {
    if (v11)
      goto LABEL_16;
  }
  else
  {

    if (v11)
      goto LABEL_16;
  }

LABEL_16:
  -[LACUNManager delegate](self, "delegate");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (v26)
  {
    -[LACUNManager delegate](self, "delegate");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "notificationManager:didRespondToNotification:fromCategory:withAction:completionHandler:", self, v11, v15, v16, v8);

  }
  else
  {
    v8[2](v8);
  }

}

- (LACUNManagerDelegate)delegate
{
  return (LACUNManagerDelegate *)objc_loadWeakRetained((id *)&self->delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->delegate);
  objc_storeStrong((id *)&self->_notificationCenter, 0);
}

@end
