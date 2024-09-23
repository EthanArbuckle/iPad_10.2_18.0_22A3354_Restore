@implementation SACriticalNotification

- (SACriticalNotification)initWithBundleManager:(id)a3
{
  id v5;
  SACriticalNotification *v6;
  SACriticalNotification *v7;
  uint64_t v8;
  UNUserNotificationCenter *center;
  void *v10;
  UNUserNotificationCenter *v11;
  void *v12;
  objc_super v14;

  v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SACriticalNotification;
  v6 = -[SACriticalNotification init](&v14, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_bundleManager, a3);
    v8 = objc_msgSend(objc_alloc(MEMORY[0x24BDF88B8]), "initWithBundleIdentifier:", CFSTR("com.apple.sosd.usernotification"));
    center = v7->_center;
    v7->_center = (UNUserNotificationCenter *)v8;

    -[UNUserNotificationCenter setDelegate:](v7->_center, "setDelegate:", v7);
    -[UNUserNotificationCenter setWantsNotificationResponsesDelivered](v7->_center, "setWantsNotificationResponsesDelivered");
    objc_msgSend(MEMORY[0x24BDF8838], "categoryWithIdentifier:actions:intentIdentifiers:options:", CFSTR("CRASH"), MEMORY[0x24BDBD1A8], MEMORY[0x24BDBD1A8], 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v7->_center;
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNUserNotificationCenter setNotificationCategories:](v11, "setNotificationCategories:", v12);

  }
  return v7;
}

- (void)sendNotificationWithCompletionHandler:(id)a3
{
  void *v4;
  void *v5;
  void (**v6)(id, void *);

  v6 = (void (**)(id, void *))a3;
  -[SACriticalNotification _createNotification](self, "_createNotification");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    +[SAError errorWithCode:](SAError, "errorWithCode:", 4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6[2](v6, v5);

  }
  -[UNUserNotificationCenter addNotificationRequest:withCompletionHandler:](self->_center, "addNotificationRequest:withCompletionHandler:", v4, v6);

}

- (id)_createNotification
{
  void *v2;
  void *v3;
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

  +[SAAuthorization approvedBundleId](SAAuthorization, "approvedBundleId");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    v5 = 0;
    goto LABEL_5;
  }
  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    objc_msgSend(v3, "objectForInfoDictionaryKey:", CFSTR("CFBundleName"));
    v5 = objc_claimAutoreleasedReturnValue();

LABEL_5:
    v6 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("NOTIFICATION_TITLE"), &stru_2505B3B28, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setTitle:", v8);

    v9 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("NOTIFICATION_BODY"), &stru_2505B3B28, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringWithFormat:", v10, v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setBody:", v11);

    objc_msgSend(MEMORY[0x24BDF8870], "defaultSound");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setSound:", v12);

    objc_msgSend(v6, "setCategoryIdentifier:", CFSTR("CRASH"));
    objc_msgSend(v6, "setShouldBackgroundDefaultAction:", 1);
    objc_msgSend(v6, "setShouldShowSubordinateIcon:", 1);
    objc_msgSend(v6, "setShouldIgnoreDoNotDisturb:", 1);
    objc_msgSend(MEMORY[0x24BDF8850], "iconForApplicationIdentifier:", v2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setIcon:", v13);

    objc_msgSend(MEMORY[0x24BDF8858], "requestWithIdentifier:content:trigger:", CFSTR("SACriticalNotification"), v6, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_9;
  }
  sa_default_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    -[SACriticalNotification _createNotification].cold.1(v5);
  v14 = 0;
LABEL_9:

  return v14;
}

- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5
{
  id v7;
  void (**v8)(_QWORD);
  NSObject *v9;
  void *v10;
  int v11;
  NSObject *v12;
  uint8_t v13[16];

  v7 = a4;
  v8 = (void (**)(_QWORD))a5;
  sa_default_log();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    -[SACriticalNotification userNotificationCenter:didReceiveNotificationResponse:withCompletionHandler:].cold.1(v7, v9);

  objc_msgSend(v7, "actionIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("com.apple.UNNotificationDefaultActionIdentifier"));

  if (v11)
  {
    sa_default_log();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_23457A000, v12, OS_LOG_TYPE_DEFAULT, "Launching app in foreground because of 3P notification interaction", v13, 2u);
    }

    -[SABundleManager wakeApprovedAppsWithReason:completion:](self->_bundleManager, "wakeApprovedAppsWithReason:completion:", 2, 0);
  }
  v8[2](v8);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleManager, 0);
  objc_storeStrong((id *)&self->_center, 0);
}

- (void)_createNotification
{
  int v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v1 = 138412290;
  v2 = 0;
  _os_log_error_impl(&dword_23457A000, log, OS_LOG_TYPE_ERROR, "Unable to get Bundle for currently authorized app: %@", (uint8_t *)&v1, 0xCu);
}

- (void)userNotificationCenter:(void *)a1 didReceiveNotificationResponse:(NSObject *)a2 withCompletionHandler:.cold.1(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "actionIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = v3;
  _os_log_debug_impl(&dword_23457A000, a2, OS_LOG_TYPE_DEBUG, "Notification response: %@", (uint8_t *)&v4, 0xCu);

}

@end
