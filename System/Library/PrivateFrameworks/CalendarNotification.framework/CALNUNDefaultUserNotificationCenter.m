@implementation CALNUNDefaultUserNotificationCenter

- (CALNUNDefaultUserNotificationCenter)initWithBundleIdentifier:(id)a3
{
  id v4;
  CALNUNDefaultUserNotificationCenter *v5;
  uint64_t v6;
  UNUserNotificationCenter *userNotificationCenter;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CALNUNDefaultUserNotificationCenter;
  v5 = -[CALNUNDefaultUserNotificationCenter init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(objc_alloc(MEMORY[0x24BDF88B8]), "initWithBundleIdentifier:", v4);
    userNotificationCenter = v5->_userNotificationCenter;
    v5->_userNotificationCenter = (UNUserNotificationCenter *)v6;

  }
  return v5;
}

- (void)setDelegate:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CALNUNDefaultUserNotificationCenter userNotificationCenter](self, "userNotificationCenter");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDelegate:", v4);

}

- (UNUserNotificationCenterDelegate)delegate
{
  void *v2;
  void *v3;

  -[CALNUNDefaultUserNotificationCenter userNotificationCenter](self, "userNotificationCenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UNUserNotificationCenterDelegate *)v3;
}

- (void)setNotificationCategories:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CALNUNDefaultUserNotificationCenter userNotificationCenter](self, "userNotificationCenter");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setNotificationCategories:", v4);

}

- (id)notificationCategories
{
  void *v2;
  void *v3;

  -[CALNUNDefaultUserNotificationCenter userNotificationCenter](self, "userNotificationCenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "notificationCategories");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)addNotificationRequest:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  id v7;
  _QWORD v9[4];
  id v10;

  v5 = a3;
  -[CALNUNDefaultUserNotificationCenter userNotificationCenter](self, "userNotificationCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __68__CALNUNDefaultUserNotificationCenter_addNotificationRequest_error___block_invoke;
  v9[3] = &unk_24D484710;
  v10 = v5;
  v7 = v5;
  objc_msgSend(v6, "addNotificationRequest:withCompletionHandler:", v7, v9);

  return 1;
}

void __68__CALNUNDefaultUserNotificationCenter_addNotificationRequest_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  if (v3)
  {
    +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __68__CALNUNDefaultUserNotificationCenter_addNotificationRequest_error___block_invoke_cold_1((uint64_t)v3, a1, v4);

  }
}

- (BOOL)replaceContentForRequestWithIdentifier:(id)a3 replacementContent:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v12[4];
  id v13;

  v7 = a3;
  v8 = a4;
  -[CALNUNDefaultUserNotificationCenter userNotificationCenter](self, "userNotificationCenter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __103__CALNUNDefaultUserNotificationCenter_replaceContentForRequestWithIdentifier_replacementContent_error___block_invoke;
  v12[3] = &unk_24D484710;
  v13 = v7;
  v10 = v7;
  objc_msgSend(v9, "replaceContentForRequestWithIdentifier:replacementContent:completionHandler:", v10, v8, v12);

  return 1;
}

void __103__CALNUNDefaultUserNotificationCenter_replaceContentForRequestWithIdentifier_replacementContent_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  if (v3)
  {
    +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __103__CALNUNDefaultUserNotificationCenter_replaceContentForRequestWithIdentifier_replacementContent_error___block_invoke_cold_1((uint64_t)v3, a1, v4);

  }
}

- (id)deliveredNotifications
{
  void *v2;
  void *v3;

  -[CALNUNDefaultUserNotificationCenter userNotificationCenter](self, "userNotificationCenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "deliveredNotifications");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)removeDeliveredNotificationsWithIdentifiers:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CALNUNDefaultUserNotificationCenter userNotificationCenter](self, "userNotificationCenter");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeDeliveredNotificationsWithIdentifiers:", v4);

}

- (void)removeAllDeliveredNotifications
{
  id v2;

  -[CALNUNDefaultUserNotificationCenter userNotificationCenter](self, "userNotificationCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeAllDeliveredNotifications");

}

- (void)removeAllPendingNotificationRequests
{
  id v2;

  -[CALNUNDefaultUserNotificationCenter userNotificationCenter](self, "userNotificationCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeAllPendingNotificationRequests");

}

- (void)setWantsNotificationResponsesDelivered
{
  id v2;

  -[CALNUNDefaultUserNotificationCenter userNotificationCenter](self, "userNotificationCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWantsNotificationResponsesDelivered");

}

- (id)notificationSettings
{
  void *v2;
  void *v3;

  -[CALNUNDefaultUserNotificationCenter userNotificationCenter](self, "userNotificationCenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "notificationSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)notificationSettingsForTopics
{
  void *v2;
  void *v3;

  -[CALNUNDefaultUserNotificationCenter userNotificationCenter](self, "userNotificationCenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "notificationSettingsForTopics");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (UNUserNotificationCenter)userNotificationCenter
{
  return self->_userNotificationCenter;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userNotificationCenter, 0);
}

void __68__CALNUNDefaultUserNotificationCenter_addNotificationRequest_error___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a2 + 32), "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138412546;
  v8 = a1;
  v9 = 2114;
  v10 = v5;
  OUTLINED_FUNCTION_0_2(&dword_215D9B000, a3, v6, "Error adding notification request, error = %@, request identifier = %{public}@", (uint8_t *)&v7);

}

void __103__CALNUNDefaultUserNotificationCenter_replaceContentForRequestWithIdentifier_replacementContent_error___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(a2 + 32);
  v4 = 138412546;
  v5 = a1;
  v6 = 2114;
  v7 = v3;
  OUTLINED_FUNCTION_0_2(&dword_215D9B000, a3, (uint64_t)a3, "Error replacing content for notification request, error = %@, identifier = %{public}@", (uint8_t *)&v4);
}

@end
