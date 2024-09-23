@implementation DEDUserNotificationNotifier

- (DEDUserNotificationNotifier)initWithConfiguration:(id)a3 session:(id)a4
{
  id v6;
  id v7;
  DEDUserNotificationNotifier *v8;
  void *v9;
  uint64_t v10;
  NSString *bugSessionIdentifier;
  uint64_t v12;
  UNUserNotificationCenter *center;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)DEDUserNotificationNotifier;
  v8 = -[DEDUserNotificationNotifier init](&v15, sel_init);
  if (v8)
  {
    objc_msgSend(v6, "notifierConfiguration");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)&v8->_config, v9);

    objc_msgSend(v7, "identifier");
    v10 = objc_claimAutoreleasedReturnValue();
    bugSessionIdentifier = v8->_bugSessionIdentifier;
    v8->_bugSessionIdentifier = (NSString *)v10;

    -[DEDUserNotificationNotifier createNotificationCenter](v8, "createNotificationCenter");
    v12 = objc_claimAutoreleasedReturnValue();
    center = v8->_center;
    v8->_center = (UNUserNotificationCenter *)v12;

  }
  return v8;
}

- (id)createNotificationCenter
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
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
  void *v19;
  void *v20;
  id v21;
  _QWORD v23[4];
  id v24;
  id v25;
  id location;

  v3 = objc_alloc(MEMORY[0x24BDF88B8]);
  -[DEDUserNotificationNotifier config](self, "config");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hostAppIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithBundleIdentifier:", v5);

  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", 2);
  -[DEDUserNotificationNotifier config](self, "config");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "reviewActionLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = (void *)MEMORY[0x24BDF8820];
    -[DEDUserNotificationNotifier config](self, "config");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "reviewActionLabel");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "actionWithIdentifier:title:options:", CFSTR("com.apple.diagnosticextensionsd.notifier.review"), v12, 4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "addObject:", v13);
  }
  -[DEDUserNotificationNotifier config](self, "config");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "sendActionLabel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    v16 = (void *)MEMORY[0x24BDF8820];
    -[DEDUserNotificationNotifier config](self, "config");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "sendActionLabel");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "actionWithIdentifier:title:options:", CFSTR("com.apple.diagnosticextensionsd.notifier.send"), v18, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "addObject:", v19);
  }
  objc_msgSend(MEMORY[0x24BDF8838], "categoryWithIdentifier:actions:intentIdentifiers:options:", CFSTR("com.apple.diagnosticextensionsd.notifier"), v7, MEMORY[0x24BDBD1A8], 4);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v23[0] = MEMORY[0x24BDAC760];
  v23[1] = 3221225472;
  v23[2] = __55__DEDUserNotificationNotifier_createNotificationCenter__block_invoke;
  v23[3] = &unk_24D1E62A0;
  objc_copyWeak(&v25, &location);
  v21 = v20;
  v24 = v21;
  objc_msgSend(v6, "getNotificationCategoriesWithCompletionHandler:", v23);
  objc_msgSend(v6, "requestAuthorizationWithOptions:completionHandler:", 7, &__block_literal_global_21);

  objc_destroyWeak(&v25);
  objc_destroyWeak(&location);

  return v6;
}

void __55__DEDUserNotificationNotifier_createNotificationCenter__block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  void *v5;
  void *v6;
  id WeakRetained;

  v3 = (id *)(a1 + 40);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "center");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setByAddingObject:", *(_QWORD *)(a1 + 32));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setNotificationCategories:", v6);
}

void __55__DEDUserNotificationNotifier_createNotificationCenter__block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v4;
  NSObject *v5;
  uint8_t v6[16];

  v4 = a3;
  if (v4)
  {
    Log_6();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __55__DEDUserNotificationNotifier_createNotificationCenter__block_invoke_2_cold_1(v4, v5);
  }
  else
  {
    if ((a2 & 1) != 0)
      goto LABEL_5;
    Log_6();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_21469E000, v5, OS_LOG_TYPE_DEFAULT, "The user denied notification privileges.", v6, 2u);
    }
  }

LABEL_5:
}

- (void)presentNotificationForSession:(id)a3
{
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD v17[4];
  id v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  -[DEDUserNotificationNotifier identifier](self, "identifier", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  Log_6();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    -[DEDUserNotificationNotifier bugSessionIdentifier](self, "bugSessionIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v20 = v4;
    v21 = 2114;
    v22 = v6;
    _os_log_impl(&dword_21469E000, v5, OS_LOG_TYPE_DEFAULT, "Scheduling user notification: %{public}@ for bug session [%{public}@]", buf, 0x16u);

  }
  v7 = (void *)objc_opt_new();
  -[DEDUserNotificationNotifier config](self, "config");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedNotificationTitle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTitle:", v9);

  -[DEDUserNotificationNotifier config](self, "config");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedNotificationBody");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBody:", v11);

  -[DEDUserNotificationNotifier config](self, "config");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v11) = objc_msgSend(v12, "userNotificationShouldPlaySound");

  if ((_DWORD)v11)
  {
    objc_msgSend(MEMORY[0x24BDF8870], "defaultSound");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setSound:", v13);

  }
  objc_msgSend(v7, "setCategoryIdentifier:", CFSTR("com.apple.diagnosticextensionsd.notifier"));
  objc_msgSend(MEMORY[0x24BDF8858], "requestWithIdentifier:content:trigger:", v4, v7, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[DEDUserNotificationNotifier center](self, "center");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __61__DEDUserNotificationNotifier_presentNotificationForSession___block_invoke;
  v17[3] = &unk_24D1E6138;
  v18 = v4;
  v16 = v4;
  objc_msgSend(v15, "addNotificationRequest:withCompletionHandler:", v14, v17);

}

void __61__DEDUserNotificationNotifier_presentNotificationForSession___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  if (v3)
  {
    Log_6();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __61__DEDUserNotificationNotifier_presentNotificationForSession___block_invoke_cold_1(a1, v3, v4);

  }
}

- (void)removeNotificationForSession:(id)a3
{
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  -[DEDUserNotificationNotifier identifier](self, "identifier", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  Log_6();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    -[DEDUserNotificationNotifier bugSessionIdentifier](self, "bugSessionIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v14 = v4;
    v15 = 2114;
    v16 = v6;
    _os_log_impl(&dword_21469E000, v5, OS_LOG_TYPE_DEFAULT, "Cancelling user notification: %{public}@ for bug session [%{public}@]", buf, 0x16u);

  }
  -[DEDUserNotificationNotifier center](self, "center");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v12, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeDeliveredNotificationsWithIdentifiers:", v8);

  -[DEDUserNotificationNotifier center](self, "center");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v11, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "removePendingNotificationRequestsWithIdentifiers:", v10);

}

+ (id)archivedClasses
{
  void *v2;
  uint64_t v3;
  uint64_t v4;

  v2 = (void *)MEMORY[0x24BDBCF20];
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  return (id)objc_msgSend(v2, "setWithObjects:", v3, v4, objc_opt_class(), 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DEDUserNotificationNotifier)initWithCoder:(id)a3
{
  id v4;
  DEDUserNotificationNotifier *v5;
  void *v6;
  uint64_t v7;
  NSString *bugSessionIdentifier;
  uint64_t v9;
  UNUserNotificationCenter *center;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)DEDUserNotificationNotifier;
  v5 = -[DEDUserNotificationNotifier init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("config"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)&v5->_config, v6);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bugSessionIdentifier"));
    v7 = objc_claimAutoreleasedReturnValue();
    bugSessionIdentifier = v5->_bugSessionIdentifier;
    v5->_bugSessionIdentifier = (NSString *)v7;

    -[DEDUserNotificationNotifier createNotificationCenter](v5, "createNotificationCenter");
    v9 = objc_claimAutoreleasedReturnValue();
    center = v5->_center;
    v5->_center = (UNUserNotificationCenter *)v9;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[DEDUserNotificationNotifier config](self, "config");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("config"));

  -[DEDUserNotificationNotifier bugSessionIdentifier](self, "bugSessionIdentifier");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("bugSessionIdentifier"));

}

+ (void)forceRemoveNotificationWithIdentifier:(id)a3 hostIdentifier:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  id v12;
  id v13;
  uint8_t buf[4];
  id v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  Log_6();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v15 = v5;
    v16 = 2114;
    v17 = v6;
    _os_log_impl(&dword_21469E000, v7, OS_LOG_TYPE_DEFAULT, "Will force remove notification with identifier [%{public}@] for app [%{public}@]", buf, 0x16u);
  }

  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF88B8]), "initWithBundleIdentifier:", v6);
  v13 = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v13, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeDeliveredNotificationsWithIdentifiers:", v9);

  v12 = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v12, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removePendingNotificationRequestsWithIdentifiers:", v10);

  Log_6();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v15 = v5;
    v16 = 2114;
    v17 = v6;
    _os_log_impl(&dword_21469E000, v11, OS_LOG_TYPE_DEFAULT, "Removed notification with identifier [%{public}@] for app [%{public}@]", buf, 0x16u);
  }

}

- (DEDNotifierConfiguration)config
{
  return (DEDNotifierConfiguration *)objc_loadWeakRetained((id *)&self->_config);
}

- (void)setConfig:(id)a3
{
  objc_storeWeak((id *)&self->_config, a3);
}

- (NSString)bugSessionIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setBugSessionIdentifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (UNUserNotificationCenter)center
{
  return (UNUserNotificationCenter *)objc_getProperty(self, a2, 24, 1);
}

- (void)setCenter:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (OS_os_log)log
{
  return (OS_os_log *)objc_getProperty(self, a2, 32, 1);
}

- (void)setLog:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_center, 0);
  objc_storeStrong((id *)&self->_bugSessionIdentifier, 0);
  objc_destroyWeak((id *)&self->_config);
}

void __55__DEDUserNotificationNotifier_createNotificationCenter__block_invoke_2_cold_1(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138543362;
  v5 = v3;
  _os_log_error_impl(&dword_21469E000, a2, OS_LOG_TYPE_ERROR, "Error requesting authorization\nPlease make sure you read instructions in DEDUserNotificationNotifier.h\n[error info] %{public}@", (uint8_t *)&v4, 0xCu);

}

void __61__DEDUserNotificationNotifier_presentNotificationForSession___block_invoke_cold_1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v4;
  void *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v4 = *(_QWORD *)(a1 + 32);
  objc_msgSend(a2, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138543618;
  v7 = v4;
  v8 = 2114;
  v9 = v5;
  _os_log_error_impl(&dword_21469E000, a3, OS_LOG_TYPE_ERROR, "Error scheduling notification: %{public}@\nError info: %{public}@", (uint8_t *)&v6, 0x16u);

}

@end
