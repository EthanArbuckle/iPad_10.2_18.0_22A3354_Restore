@implementation CALNUNUserNotificationCenter

- (CALNUNUserNotificationCenter)initWithBundleIdentifier:(id)a3 userNotificationCenterFactory:(id)a4 storage:(id)a5 notificationIconCache:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  CALNUNUserNotificationCenter *v14;
  void *v15;
  CALNUNUserNotificationCenterProtocol *userNotificationCenter;
  id v17;
  CALNUNNotificationIconMapper *v18;
  CALNUNNotificationContentMapper *v19;
  CALNUNNotificationContentMapper *notificationContentMapper;
  CALNUNNotificationRequestMapper *v21;
  CALNUNNotificationRequestMapper *notificationRequestMapper;
  CALNUNNotificationMapper *v23;
  CALNUNNotificationMapper *notificationMapper;
  CALNUNNotificationResponseMapper *v25;
  CALNUNNotificationResponseMapper *notificationResponseMapper;
  objc_super v28;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v28.receiver = self;
  v28.super_class = (Class)CALNUNUserNotificationCenter;
  v14 = -[CALNUNUserNotificationCenter init](&v28, sel_init);
  if (v14)
  {
    objc_msgSend(v11, "userNotificationCenterWithBundleIdentifier:", v10);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setDelegate:", v14);
    userNotificationCenter = v14->_userNotificationCenter;
    v14->_userNotificationCenter = (CALNUNUserNotificationCenterProtocol *)v15;
    v17 = v15;

    objc_storeStrong((id *)&v14->_storage, a5);
    v18 = -[CALNUNNotificationIconMapper initWithNotificationIconCache:]([CALNUNNotificationIconMapper alloc], "initWithNotificationIconCache:", v13);
    v19 = -[CALNUNNotificationContentMapper initWithNotificationIconMapper:]([CALNUNNotificationContentMapper alloc], "initWithNotificationIconMapper:", v18);
    notificationContentMapper = v14->_notificationContentMapper;
    v14->_notificationContentMapper = v19;

    v21 = -[CALNUNNotificationRequestMapper initWithNotificationContentMapper:notificationIconMapper:]([CALNUNNotificationRequestMapper alloc], "initWithNotificationContentMapper:notificationIconMapper:", v14->_notificationContentMapper, v18);
    notificationRequestMapper = v14->_notificationRequestMapper;
    v14->_notificationRequestMapper = v21;

    v23 = -[CALNUNNotificationMapper initWithNotificationRequestMapper:]([CALNUNNotificationMapper alloc], "initWithNotificationRequestMapper:", v14->_notificationRequestMapper);
    notificationMapper = v14->_notificationMapper;
    v14->_notificationMapper = v23;

    v25 = -[CALNUNNotificationResponseMapper initWithNotificationMapper:]([CALNUNNotificationResponseMapper alloc], "initWithNotificationMapper:", v14->_notificationMapper);
    notificationResponseMapper = v14->_notificationResponseMapper;
    v14->_notificationResponseMapper = v25;

  }
  return v14;
}

- (void)activate
{
  void *v3;

  -[CALNUNUserNotificationCenter userNotificationCenter](self, "userNotificationCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWantsNotificationResponsesDelivered");

  -[CALNUNUserNotificationCenter setActive:](self, "setActive:", 1);
}

- (void)deactivate
{
  -[CALNUNUserNotificationCenter setActive:](self, "setActive:", 0);
}

- (BOOL)addNotificationRequest:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  id v15;
  int v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  int v24;
  void *v25;
  __int16 v26;
  id v27;
  __int16 v28;
  void *v29;
  _QWORD v30[3];
  _QWORD v31[4];

  v31[3] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if (-[CALNUNUserNotificationCenter isActive](self, "isActive"))
  {
    +[CALNNotificationMapper notificationRecordFromNotificationRequest:](CALNNotificationMapper, "notificationRecordFromNotificationRequest:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      -[CALNUNUserNotificationCenter storage](self, "storage");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addNotificationRecord:", v7);

      +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v7, "sourceIdentifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "sourceClientIdentifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = 138543874;
        v25 = v10;
        v26 = 2114;
        v27 = v11;
        v28 = 2112;
        v29 = v7;
        _os_log_impl(&dword_215D9B000, v9, OS_LOG_TYPE_INFO, "Added notification record to storage. Notification record source identifier = %{public}@, source client identifier = %{public}@, record = %@", (uint8_t *)&v24, 0x20u);

      }
    }
    else
    {
      +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        -[CALNUNUserNotificationCenter addNotificationRequest:error:].cold.1();
    }

    -[CALNUNUserNotificationCenter notificationRequestMapper](self, "notificationRequestMapper");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "unNotificationRequestFromCALNNotificationRequest:", v6);
    v15 = (id)objc_claimAutoreleasedReturnValue();

    +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v15, "identifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 138543618;
      v25 = v19;
      v26 = 2112;
      v27 = v15;
      _os_log_impl(&dword_215D9B000, v18, OS_LOG_TYPE_DEFAULT, "Adding unNotificationRequest with identifier = %{public}@, request = %@", (uint8_t *)&v24, 0x16u);

    }
    -[CALNUNUserNotificationCenter userNotificationCenter](self, "userNotificationCenter");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v20, "addNotificationRequest:error:", v15, a4);

    if (v16)
    {
      +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v15, "identifier");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = 138543362;
        v25 = v22;
        _os_log_impl(&dword_215D9B000, v21, OS_LOG_TYPE_DEFAULT, "Added unNotificationRequest with identifier = %{public}@", (uint8_t *)&v24, 0xCu);

      }
    }
  }
  else
  {
    +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[CALNUNUserNotificationCenter addNotificationRequest:error:].cold.2();

    v13 = *MEMORY[0x24BDD0FD8];
    v30[0] = *MEMORY[0x24BDD0FC8];
    v30[1] = v13;
    v31[0] = CFSTR("Could not add notification request.");
    v31[1] = CFSTR("User notification center is inactive.");
    v30[2] = *MEMORY[0x24BDD0FF0];
    v31[2] = CFSTR("Activate the user notification center before adding a notification request.");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v31, v30, 3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("CALNUNUserNotificationCenterErrorDomain"), 0, v7);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (a4)
    {
      v15 = objc_retainAutorelease(v14);
      LOBYTE(v16) = 0;
      *a4 = v15;
    }
    else
    {
      LOBYTE(v16) = 0;
    }
  }

  return v16;
}

- (id)deliveredNotifications
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[CALNUNUserNotificationCenter userNotificationCenter](self, "userNotificationCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "deliveredNotifications");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[CALNUNUserNotificationCenter notificationMapper](self, "notificationMapper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "calnNotificationsFromUNNotifications:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)notificationCategories
{
  void *v2;
  void *v3;
  void *v4;

  -[CALNUNUserNotificationCenter userNotificationCenter](self, "userNotificationCenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "notificationCategories");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  +[CALNUNNotificationCategoryMapper calnNotificationCategoriesFromUNNotificationCategories:](CALNUNNotificationCategoryMapper, "calnNotificationCategoriesFromUNNotificationCategories:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)removeAllDeliveredNotifications
{
  void *v3;
  id v4;

  -[CALNUNUserNotificationCenter storage](self, "storage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeNotificationRecordsPassingTest:", &__block_literal_global_5);

  -[CALNUNUserNotificationCenter userNotificationCenter](self, "userNotificationCenter");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeAllDeliveredNotifications");

}

uint64_t __63__CALNUNUserNotificationCenter_removeAllDeliveredNotifications__block_invoke()
{
  return 1;
}

- (void)removeDeliveredNotificationsWithIdentifiers:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  -[CALNUNUserNotificationCenter storage](self, "storage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __76__CALNUNUserNotificationCenter_removeDeliveredNotificationsWithIdentifiers___block_invoke;
  v8[3] = &unk_24D484908;
  v9 = v4;
  v6 = v4;
  objc_msgSend(v5, "removeNotificationRecordsPassingTest:", v8);

  -[CALNUNUserNotificationCenter userNotificationCenter](self, "userNotificationCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeDeliveredNotificationsWithIdentifiers:", v6);

}

uint64_t __76__CALNUNUserNotificationCenter_removeDeliveredNotificationsWithIdentifiers___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  CALNNotificationIdentifier *v4;
  void *v5;
  void *v6;
  CALNNotificationIdentifier *v7;
  void *v8;
  uint64_t v9;

  v3 = a2;
  v4 = [CALNNotificationIdentifier alloc];
  objc_msgSend(v3, "sourceIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sourceClientIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[CALNNotificationIdentifier initWithSourceIdentifier:sourceClientIdentifier:](v4, "initWithSourceIdentifier:sourceClientIdentifier:", v5, v6);
  if (v7)
  {
    -[CALNNotificationIdentifier stringRepresentation](v7, "stringRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(*(id *)(a1 + 32), "containsObject:", v8);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)removeAllPendingNotificationRequests
{
  id v2;

  -[CALNUNUserNotificationCenter userNotificationCenter](self, "userNotificationCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeAllPendingNotificationRequests");

}

- (BOOL)replaceNotificationRequest:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  NSObject *v19;
  void *v20;
  int v22;
  void *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  NSObject *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  +[CALNNotificationMapper notificationRecordFromNotificationRequest:](CALNNotificationMapper, "notificationRecordFromNotificationRequest:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[CALNUNUserNotificationCenter _updatedRecord:](self, "_updatedRecord:", v7);
    v8 = objc_claimAutoreleasedReturnValue();
    -[CALNUNUserNotificationCenter storage](self, "storage");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addNotificationRecord:", v8);

    +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      -[NSObject sourceIdentifier](v8, "sourceIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject sourceClientIdentifier](v8, "sourceClientIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 138543874;
      v23 = v11;
      v24 = 2114;
      v25 = v12;
      v26 = 2112;
      v27 = v8;
      _os_log_impl(&dword_215D9B000, v10, OS_LOG_TYPE_INFO, "Added updated notification record to storage. Notification record source identifier = %{public}@, source client identifier = %{public}@, record = %@", (uint8_t *)&v22, 0x20u);

    }
  }
  else
  {
    +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[CALNUNUserNotificationCenter replaceNotificationRequest:error:].cold.1(v6, v8);
  }

  -[CALNUNUserNotificationCenter notificationContentMapper](self, "notificationContentMapper");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "content");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "unNotificationContentFromCALNNotificationContent:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  -[CALNUNUserNotificationCenter userNotificationCenter](self, "userNotificationCenter");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v16, "replaceContentForRequestWithIdentifier:replacementContent:error:", v17, v15, a4);

  if (v18)
  {
    +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v6, "identifier");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 138543618;
      v23 = v20;
      v24 = 2112;
      v25 = v15;
      _os_log_impl(&dword_215D9B000, v19, OS_LOG_TYPE_DEFAULT, "Replaced request with identifier = %{public}@, unNotificationContent = %@", (uint8_t *)&v22, 0x16u);

    }
  }

  return v18;
}

- (void)setNotificationCategories:(id)a3
{
  void *v4;
  id v5;

  +[CALNUNNotificationCategoryMapper unNotificationCategoriesFromCALNNotificationCategories:](CALNUNNotificationCategoryMapper, "unNotificationCategoriesFromCALNNotificationCategories:", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[CALNUNUserNotificationCenter userNotificationCenter](self, "userNotificationCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setNotificationCategories:", v5);

}

- (void)userNotificationCenter:(id)a3 willPresentNotification:(id)a4 withCompletionHandler:(id)a5
{
  id v7;
  void (**v8)(id, _QWORD);
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void (**v16)(id, _QWORD);
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  v8 = (void (**)(id, _QWORD))a5;
  -[CALNUNUserNotificationCenter delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v7, "request");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v22 = v12;
    v23 = 2112;
    v24 = v7;
    _os_log_impl(&dword_215D9B000, v10, OS_LOG_TYPE_DEFAULT, "Will present notification with identifier = %{public}@, notification = %@", buf, 0x16u);

  }
  if (!v9)
  {
    +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[CALNUNUserNotificationCenter userNotificationCenter:willPresentNotification:withCompletionHandler:].cold.1();

    v8[2](v8, 0);
  }
  -[CALNUNUserNotificationCenter notificationMapper](self, "notificationMapper");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "calnNotificationFromUNNotification:", v7);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __101__CALNUNUserNotificationCenter_userNotificationCenter_willPresentNotification_withCompletionHandler___block_invoke;
  v18[3] = &unk_24D484930;
  v19 = v15;
  v20 = v8;
  v16 = v8;
  v17 = v15;
  objc_msgSend(v9, "userNotificationCenter:willPresentNotification:withCompletionHandler:", self, v17, v18);

}

uint64_t __101__CALNUNUserNotificationCenter_userNotificationCenter_willPresentNotification_withCompletionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  unint64_t v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = +[CALNUNNotificationPresentationOptionsMapper unNotificationPresentationOptionsFromCALNNotificationPresentationOptions:](CALNUNNotificationPresentationOptionsMapper, "unNotificationPresentationOptionsFromCALNNotificationPresentationOptions:", a2);
  +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "request");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543618;
    v10 = v5;
    v11 = 2114;
    v12 = v7;
    _os_log_impl(&dword_215D9B000, v4, OS_LOG_TYPE_DEFAULT, "Invoking callback with options = %{public}@, notification identifier = %{public}@", (uint8_t *)&v9, 0x16u);

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5
{
  id v7;
  void (**v8)(_QWORD);
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  v8 = (void (**)(_QWORD))a5;
  +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v7, "notification");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "request");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 138543618;
    v18 = v12;
    v19 = 2112;
    v20 = v7;
    _os_log_impl(&dword_215D9B000, v9, OS_LOG_TYPE_DEFAULT, "Did receive notification response. identifier = %{public}@, response = %@", (uint8_t *)&v17, 0x16u);

  }
  -[CALNUNUserNotificationCenter delegate](self, "delegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13)
  {
    +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[CALNUNUserNotificationCenter userNotificationCenter:didReceiveNotificationResponse:withCompletionHandler:].cold.1();

    v8[2](v8);
  }
  -[CALNUNUserNotificationCenter notificationResponseMapper](self, "notificationResponseMapper");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "calnNotificationResponseFromUNNotificationResponse:", v7);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "userNotificationCenter:didReceiveNotificationResponse:withCompletionHandler:", self, v16, v8);
}

- (id)_updatedRecord:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  int v18;
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(v3, "content");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "date");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = v6;
    if (v5)
    {
      v8 = v6;
      if ((objc_msgSend(v5, "isEqualToDate:", v6) & 1) == 0)
      {
        v8 = v5;

      }
    }
  }
  else
  {
    if (v5)
    {
      v9 = v5;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v9 = (id)objc_claimAutoreleasedReturnValue();
    }
    v8 = v9;
  }
  +[CALNLogSubsystem defaultCategory](CALNLogSubsystem, "defaultCategory");
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    -[CALNUNUserNotificationCenter _updatedRecord:].cold.1(v3, (uint64_t)v8, v10);

  v11 = (void *)objc_msgSend(v3, "mutableCopy");
  objc_msgSend(v11, "setDate:", v8);
  v12 = (void *)objc_msgSend(v11, "copy");
  +[CALNLogSubsystem defaultCategory](CALNLogSubsystem, "defaultCategory");
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v3, "sourceIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "sourceClientIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "date");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 138544130;
    v19 = v14;
    v20 = 2114;
    v21 = v15;
    v22 = 2114;
    v23 = v16;
    v24 = 2112;
    v25 = v12;
    _os_log_impl(&dword_215D9B000, v13, OS_LOG_TYPE_DEFAULT, "Updated record. Source identifier = %{public}@, source client identifier = %{public}@, date = %{public}@, record = %@", (uint8_t *)&v18, 0x2Au);

  }
  return v12;
}

- (void)collectSettingsStats:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;

  v4 = a3;
  -[CALNUNUserNotificationCenter userNotificationCenter](self, "userNotificationCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "notificationSettings");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v10, "authorizationStatus"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("CalendarNotificationsAuthorization"));

  -[CALNUNUserNotificationCenter userNotificationCenter](self, "userNotificationCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "notificationSettingsForTopics");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __53__CALNUNUserNotificationCenter_collectSettingsStats___block_invoke;
  v11[3] = &unk_24D484958;
  v11[4] = self;
  v12 = v4;
  v9 = v4;
  objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v11);

}

void __53__CALNUNUserNotificationCenter_collectSettingsStats___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
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
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  id v30;

  v5 = a3;
  v6 = a2;
  v7 = (void *)objc_opt_class();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v5, "authorizationStatus"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_addSettingName:value:toStatsPayload:forTopicIdentifier:", CFSTR("authorizationStatus"), v8, *(_QWORD *)(a1 + 40), v6);

  v9 = (void *)objc_opt_class();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v5, "soundSetting"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_addSettingName:value:toStatsPayload:forTopicIdentifier:", CFSTR("soundSetting"), v10, *(_QWORD *)(a1 + 40), v6);

  v11 = (void *)objc_opt_class();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v5, "badgeSetting"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "_addSettingName:value:toStatsPayload:forTopicIdentifier:", CFSTR("badgeSetting"), v12, *(_QWORD *)(a1 + 40), v6);

  v13 = (void *)objc_opt_class();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v5, "alertSetting"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "_addSettingName:value:toStatsPayload:forTopicIdentifier:", CFSTR("alertSetting"), v14, *(_QWORD *)(a1 + 40), v6);

  v15 = (void *)objc_opt_class();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v5, "notificationCenterSetting"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "_addSettingName:value:toStatsPayload:forTopicIdentifier:", CFSTR("notificationCenterSetting"), v16, *(_QWORD *)(a1 + 40), v6);

  v17 = (void *)objc_opt_class();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v5, "lockScreenSetting"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "_addSettingName:value:toStatsPayload:forTopicIdentifier:", CFSTR("lockScreenSetting"), v18, *(_QWORD *)(a1 + 40), v6);

  v19 = (void *)objc_opt_class();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v5, "carPlaySetting"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "_addSettingName:value:toStatsPayload:forTopicIdentifier:", CFSTR("carPlaySetting"), v20, *(_QWORD *)(a1 + 40), v6);

  v21 = (void *)objc_opt_class();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v5, "alertStyle"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "_addSettingName:value:toStatsPayload:forTopicIdentifier:", CFSTR("alertStyle"), v22, *(_QWORD *)(a1 + 40), v6);

  v23 = (void *)objc_opt_class();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v5, "showPreviewsSetting"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "_addSettingName:value:toStatsPayload:forTopicIdentifier:", CFSTR("showPreviewsSetting"), v24, *(_QWORD *)(a1 + 40), v6);

  v25 = (void *)objc_opt_class();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v5, "timeSensitiveSetting"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "_addSettingName:value:toStatsPayload:forTopicIdentifier:", CFSTR("timeSensitiveSetting"), v26, *(_QWORD *)(a1 + 40), v6);

  v27 = (void *)objc_opt_class();
  v28 = (void *)MEMORY[0x24BDD16E0];
  v29 = objc_msgSend(v5, "scheduledDeliverySetting");

  objc_msgSend(v28, "numberWithInteger:", v29);
  v30 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "_addSettingName:value:toStatsPayload:forTopicIdentifier:", CFSTR("scheduledDeliverySetting"), v30, *(_QWORD *)(a1 + 40), v6);

}

+ (void)_addSettingName:(id)a3 value:(id)a4 toStatsPayload:(id)a5 forTopicIdentifier:(id)a6
{
  id v10;
  id v11;
  id v12;

  v10 = a5;
  v11 = a4;
  objc_msgSend(a1, "_statsPayloadKeyForSettingName:topicIdentifier:", a3, a6);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v11, v12);

}

+ (id)_statsPayloadKeyForSettingName:(id)a3 topicIdentifier:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = a4;
  v6 = a3;
  if (objc_msgSend(v5, "hasPrefix:", CFSTR("com.apple.mobilecal.bulletin-subsection.")))
  {
    objc_msgSend(v5, "substringFromIndex:", objc_msgSend(CFSTR("com.apple.mobilecal.bulletin-subsection."), "length"));
    v7 = objc_claimAutoreleasedReturnValue();

    v5 = (id)v7;
  }
  objc_msgSend(MEMORY[0x24BDD14A8], "characterSetWithCharactersInString:", CFSTR("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz_"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "invertedSet");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "stringByReplacingCharactersInSet:withString:", v9, CFSTR("_"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("notifications_%@_%@"), v10, v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (CALNUserNotificationCenterDelegate)delegate
{
  return (CALNUserNotificationCenterDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (CALNUNUserNotificationCenterProtocol)userNotificationCenter
{
  return self->_userNotificationCenter;
}

- (CALNNotificationStorage)storage
{
  return self->_storage;
}

- (CALNUNNotificationMapper)notificationMapper
{
  return self->_notificationMapper;
}

- (CALNUNNotificationRequestMapper)notificationRequestMapper
{
  return self->_notificationRequestMapper;
}

- (CALNUNNotificationContentMapper)notificationContentMapper
{
  return self->_notificationContentMapper;
}

- (CALNUNNotificationResponseMapper)notificationResponseMapper
{
  return self->_notificationResponseMapper;
}

- (BOOL)isActive
{
  return self->_active;
}

- (void)setActive:(BOOL)a3
{
  self->_active = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationResponseMapper, 0);
  objc_storeStrong((id *)&self->_notificationContentMapper, 0);
  objc_storeStrong((id *)&self->_notificationRequestMapper, 0);
  objc_storeStrong((id *)&self->_notificationMapper, 0);
  objc_storeStrong((id *)&self->_storage, 0);
  objc_storeStrong((id *)&self->_userNotificationCenter, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)addNotificationRequest:error:.cold.1()
{
  id v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_3_1();
  objc_msgSend(v0, "identifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_0(&dword_215D9B000, v2, v3, "Could not add notification record to storage since notification record is nil. Notification request identifier = %{public}@, request = %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1();
}

- (void)addNotificationRequest:error:.cold.2()
{
  id v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_3_1();
  objc_msgSend(v0, "identifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_0(&dword_215D9B000, v2, v3, "Cannot add request to inactive user notification center. Request identifier = %{public}@, request = %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1();
}

- (void)replaceNotificationRequest:(void *)a1 error:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138543362;
  v5 = v3;
  _os_log_error_impl(&dword_215D9B000, a2, OS_LOG_TYPE_ERROR, "Could not add updated notification record to storage since notification record is nil. Notification request identifier = %{public}@", (uint8_t *)&v4, 0xCu);

}

- (void)userNotificationCenter:willPresentNotification:withCompletionHandler:.cold.1()
{
  NSObject *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  int v5;
  void *v6;
  __int16 v7;
  void *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  OUTLINED_FUNCTION_3_1();
  v11 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "request");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138543874;
  v6 = v2;
  v7 = 2114;
  v8 = v4;
  v9 = 2112;
  v10 = v1;
  _os_log_error_impl(&dword_215D9B000, v0, OS_LOG_TYPE_ERROR, "Delegate is unexpectedly nil. Invoking callback with options = %{public}@, notification identifier = %{public}@, notification = %@", (uint8_t *)&v5, 0x20u);

}

- (void)userNotificationCenter:didReceiveNotificationResponse:withCompletionHandler:.cold.1()
{
  id v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_3_1();
  objc_msgSend(v0, "notification");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "request");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_0(&dword_215D9B000, v4, v5, "Delegate is unexpectedly nil. notification response identifier = %{public}@, response = %@", v6, v7, v8, v9, v10);

}

- (void)_updatedRecord:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  void *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "sourceIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "sourceClientIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138544130;
  v9 = v6;
  v10 = 2114;
  v11 = v7;
  v12 = 2114;
  v13 = a2;
  v14 = 2112;
  v15 = a1;
  _os_log_debug_impl(&dword_215D9B000, a3, OS_LOG_TYPE_DEBUG, "Updating record with date. Record source identifier = %{public}@, source client identifier = %{public}@, date = %{public}@, record = %@", (uint8_t *)&v8, 0x2Au);

}

@end
