@implementation LACDTONotificationManager

- (LACDTONotificationManager)initWithReplyQueue:(id)a3
{
  id v4;
  LACDTONotificationFactory *v5;
  LACDTONotificationManager *v6;

  v4 = a3;
  v5 = objc_alloc_init(LACDTONotificationFactory);
  v6 = -[LACDTONotificationManager initWithReplyQueue:notificationFactory:](self, "initWithReplyQueue:notificationFactory:", v4, v5);

  return v6;
}

- (LACDTONotificationManager)initWithReplyQueue:(id)a3 notificationFactory:(id)a4
{
  id v7;
  id v8;
  LACDTONotificationManager *v9;
  LACDTONotificationManager *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)LACDTONotificationManager;
  v9 = -[LACDTONotificationManager init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_replyQueue, a3);
    objc_storeStrong((id *)&v10->_notificationFactory, a4);
  }

  return v10;
}

- (void)setDelegate:(id)a3
{
  id v4;

  objc_storeWeak((id *)&self->_delegate, a3);
  -[LACDTONotificationManager _securityDelayManager](self, "_securityDelayManager");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDelegate:", self);

}

- (void)scheduleSecurityDelayFinishedNotificationForPendingEvaluation:(id)a3 after:(double)a4 validity:(double)a5 completion:(id)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  NSObject *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  id v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a6;
  -[LACDTONotificationManager _securityDelayManager](self, "_securityDelayManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[LACDTONotificationFactory securityDelayEndedNotificationForPendingEvaluation:after:validity:](self->_notificationFactory, "securityDelayEndedNotificationForPendingEvaluation:after:validity:", v10, a4, a5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  LACLogDTONotifications();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v25 = v13;
    v26 = 2114;
    v27 = v10;
    _os_log_impl(&dword_2409DC000, v14, OS_LOG_TYPE_DEFAULT, "Will schedule notification %{public}@ for %{public}@", buf, 0x16u);
  }

  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __117__LACDTONotificationManager_scheduleSecurityDelayFinishedNotificationForPendingEvaluation_after_validity_completion___block_invoke;
  v19[3] = &unk_2510C2190;
  v20 = v13;
  v21 = v10;
  v22 = v12;
  v23 = v11;
  v15 = v12;
  v16 = v11;
  v17 = v10;
  v18 = v13;
  objc_msgSend(v15, "postNotification:completion:", v18, v19);

}

void __117__LACDTONotificationManager_scheduleSecurityDelayFinishedNotificationForPendingEvaluation_after_validity_completion___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  LACLogDTONotifications();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __117__LACDTONotificationManager_scheduleSecurityDelayFinishedNotificationForPendingEvaluation_after_validity_completion___block_invoke_cold_1();
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = a1[4];
    v7 = a1[5];
    v8 = 138543618;
    v9 = v6;
    v10 = 2114;
    v11 = v7;
    _os_log_impl(&dword_2409DC000, v5, OS_LOG_TYPE_DEFAULT, "Did schedule notification %{public}@ for %{public}@", (uint8_t *)&v8, 0x16u);
  }

  (*(void (**)(void))(a1[7] + 16))();
}

- (void)postNewSecurityDelayRequiredNotificationWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  uint8_t buf[4];
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[LACDTONotificationManager _securityDelayManager](self, "_securityDelayManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[LACDTONotificationFactory newSecurityDelayRequiredNotification](self->_notificationFactory, "newSecurityDelayRequiredNotification");
  LACLogDTONotifications();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v16 = v6;
    _os_log_impl(&dword_2409DC000, v7, OS_LOG_TYPE_DEFAULT, "Will post notification %{public}@", buf, 0xCu);
  }

  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __84__LACDTONotificationManager_postNewSecurityDelayRequiredNotificationWithCompletion___block_invoke;
  v11[3] = &unk_2510C1988;
  v13 = v5;
  v14 = v4;
  v12 = v6;
  v8 = v5;
  v9 = v4;
  v10 = v6;
  objc_msgSend(v8, "postNotification:completion:", v10, v11);

}

void __84__LACDTONotificationManager_postNewSecurityDelayRequiredNotificationWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  LACLogDTONotifications();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __84__LACDTONotificationManager_postNewSecurityDelayRequiredNotificationWithCompletion___block_invoke_cold_1();
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = *(_QWORD *)(a1 + 32);
    v7 = 138543362;
    v8 = v6;
    _os_log_impl(&dword_2409DC000, v5, OS_LOG_TYPE_DEFAULT, "Did post notification %{public}@", (uint8_t *)&v7, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (void)cancelPreviousSecurityDelayFinishedNotificationForPendingEvaluation:(id)a3 scheduledOnly:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  _QWORD v18[2];

  v5 = a4;
  v18[1] = *MEMORY[0x24BDAC8D0];
  v8 = a5;
  v9 = a3;
  -[LACDTONotificationManager _securityDelayManager](self, "_securityDelayManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v18[0] = v11;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v18, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __122__LACDTONotificationManager_cancelPreviousSecurityDelayFinishedNotificationForPendingEvaluation_scheduledOnly_completion___block_invoke;
  v15[3] = &unk_2510C2130;
  v16 = v10;
  v17 = v8;
  v13 = v10;
  v14 = v8;
  objc_msgSend(v13, "cancelNotificationsWithIdentifiers:scheduledOnly:completion:", v12, v5, v15);

}

uint64_t __122__LACDTONotificationManager_cancelPreviousSecurityDelayFinishedNotificationForPendingEvaluation_scheduledOnly_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)cancelPreviousNewSecurityDelayRequiredNotificationWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[LACDTONotificationManager _securityDelayManager](self, "_securityDelayManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = CFSTR("com.apple.coreauthd.notifications.newSecurityDelayRequired");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __94__LACDTONotificationManager_cancelPreviousNewSecurityDelayRequiredNotificationWithCompletion___block_invoke;
  v9[3] = &unk_2510C2130;
  v10 = v5;
  v11 = v4;
  v7 = v5;
  v8 = v4;
  objc_msgSend(v7, "cancelNotificationsWithIdentifiers:scheduledOnly:completion:", v6, 0, v9);

}

uint64_t __94__LACDTONotificationManager_cancelPreviousNewSecurityDelayRequiredNotificationWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)notificationManager:(id)a3 didRespondToNotification:(id)a4 fromCategory:(id)a5 withAction:(id)a6 completionHandler:(id)a7
{
  id v11;
  id v12;
  void (**v13)(_QWORD);
  void *v14;
  NSObject *v15;
  int v16;
  LACDTONotificationManager *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v11 = a4;
  v12 = a6;
  v13 = (void (**)(_QWORD))a7;
  if ((objc_msgSend(a5, "isEqualToString:", CFSTR("com.apple.coreauthd.notifications.category.securityDelay.required")) & 1) != 0)
  {
    -[LACDTONotificationManager delegate](self, "delegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "notificationManager:didReceiveUserAction:completionHandler:", self, v12, v13);

  }
  else
  {
    LACLogDTONotifications();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = 138543618;
      v17 = self;
      v18 = 2114;
      v19 = v11;
      _os_log_impl(&dword_2409DC000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@ - not handling notification %{public}@", (uint8_t *)&v16, 0x16u);
    }

    v13[2](v13);
  }

}

- (id)_securityDelayManager
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x24BDAC8D0];
  v3 = +[LACDTOMutableNotificationCategory newSecurityDelayRequiredCategory](LACDTOMutableNotificationCategory, "newSecurityDelayRequiredCategory");
  v9[0] = v3;
  +[LACDTOMutableNotificationCategory securityDelayEndedCategory](LACDTOMutableNotificationCategory, "securityDelayEndedCategory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v9, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  +[LACUNManagerProvider sharedInstance](LACUNManagerProvider, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sharedInstanceWithBundleIdentifier:categories:replyQueue:", CFSTR("com.apple.CoreAuthUI"), v5, self->_replyQueue);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (LACDTONotificationManagerDelegate)delegate
{
  return (LACDTONotificationManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_notificationFactory, 0);
  objc_storeStrong((id *)&self->_replyQueue, 0);
}

void __117__LACDTONotificationManager_scheduleSecurityDelayFinishedNotificationForPendingEvaluation_after_validity_completion___block_invoke_cold_1()
{
  uint64_t v0;
  __int16 v1;
  uint64_t v2;
  os_log_t v3;
  uint8_t v4[14];
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_0_5();
  v5 = v0;
  v6 = v1;
  v7 = v2;
  _os_log_error_impl(&dword_2409DC000, v3, OS_LOG_TYPE_ERROR, "Could not schedule notification %{public}@ for %{public}@ (error:=%{public}@)", v4, 0x20u);
}

void __84__LACDTONotificationManager_postNewSecurityDelayRequiredNotificationWithCompletion___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[14];
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_0_5();
  v3 = v0;
  _os_log_error_impl(&dword_2409DC000, v1, OS_LOG_TYPE_ERROR, "Could not post notification %{public}@ (error:=%{public}@)", v2, 0x16u);
}

@end
