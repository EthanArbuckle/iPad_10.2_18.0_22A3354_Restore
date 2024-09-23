@implementation ATXModeEntityScorer

- (ATXModeEntityScorer)init
{
  void *v3;
  ATXModeEntityScorer *v4;

  v3 = (void *)objc_opt_new();
  v4 = -[ATXModeEntityScorer initWithModeEntityScorerClient:](self, "initWithModeEntityScorerClient:", v3);

  return v4;
}

- (ATXModeEntityScorer)initWithModeEntityScorerClient:(id)a3
{
  id v5;
  ATXModeEntityScorer *v6;
  ATXModeEntityScorer *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATXModeEntityScorer;
  v6 = -[ATXModeEntityScorer init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_modeEntityScorerClient, a3);

  return v7;
}

- (void)scoreApps:(id)a3 mode:(unint64_t)a4
{
  id v6;
  dispatch_semaphore_t v7;
  uint64_t v8;
  NSObject *v9;
  _QWORD v10[5];
  _QWORD v11[5];
  _QWORD v12[4];
  dispatch_semaphore_t v13;

  v6 = a3;
  v7 = dispatch_semaphore_create(0);
  v8 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __38__ATXModeEntityScorer_scoreApps_mode___block_invoke;
  v12[3] = &unk_1E4D59210;
  v13 = v7;
  v9 = v7;
  -[ATXModeEntityScorer scoreApps:mode:reply:](self, "scoreApps:mode:reply:", v6, a4, v12);

  v10[4] = self;
  v11[0] = v8;
  v11[1] = 3221225472;
  v11[2] = __38__ATXModeEntityScorer_scoreApps_mode___block_invoke_2;
  v11[3] = &unk_1E4D57590;
  v11[4] = self;
  v10[0] = v8;
  v10[1] = 3221225472;
  v10[2] = __38__ATXModeEntityScorer_scoreApps_mode___block_invoke_8;
  v10[3] = &unk_1E4D57590;
  objc_msgSend(MEMORY[0x1E0D81598], "waitForSemaphore:timeoutSeconds:onAcquire:onTimeout:", v9, v11, v10, 3.0);

}

intptr_t __38__ATXModeEntityScorer_scoreApps_mode___block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __38__ATXModeEntityScorer_scoreApps_mode___block_invoke_2()
{
  NSObject *v0;
  objc_class *v1;
  void *v2;
  int v3;
  void *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  __atxlog_handle_default();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    v1 = (objc_class *)objc_opt_class();
    NSStringFromClass(v1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = 138412290;
    v4 = v2;
    _os_log_impl(&dword_1A49EF000, v0, OS_LOG_TYPE_DEFAULT, "Successfully acquired semaphore in %@", (uint8_t *)&v3, 0xCu);

  }
}

void __38__ATXModeEntityScorer_scoreApps_mode___block_invoke_8()
{
  NSObject *v0;

  __atxlog_handle_notification_management();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    __38__ATXModeEntityScorer_scoreApps_mode___block_invoke_8_cold_1();

}

- (id)rankedAppsForMode:(unint64_t)a3
{
  dispatch_semaphore_t v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  id v9;
  _QWORD v11[5];
  _QWORD v12[5];
  _QWORD v13[4];
  NSObject *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__5;
  v20 = __Block_byref_object_dispose__5;
  v21 = 0;
  v5 = dispatch_semaphore_create(0);
  v6 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __41__ATXModeEntityScorer_rankedAppsForMode___block_invoke;
  v13[3] = &unk_1E4D59238;
  v15 = &v16;
  v7 = v5;
  v14 = v7;
  -[ATXModeEntityScorer rankedAppsForMode:reply:](self, "rankedAppsForMode:reply:", a3, v13);
  v11[4] = self;
  v12[0] = v6;
  v12[1] = 3221225472;
  v12[2] = __41__ATXModeEntityScorer_rankedAppsForMode___block_invoke_2;
  v12[3] = &unk_1E4D57590;
  v12[4] = self;
  v11[0] = v6;
  v11[1] = 3221225472;
  v11[2] = __41__ATXModeEntityScorer_rankedAppsForMode___block_invoke_10;
  v11[3] = &unk_1E4D57590;
  objc_msgSend(MEMORY[0x1E0D81598], "waitForSemaphore:timeoutSeconds:onAcquire:onTimeout:", v7, v12, v11, 3.0);
  v8 = (void *)v17[5];
  if (!v8)
    v8 = (void *)MEMORY[0x1E0C9AA60];
  v9 = v8;

  _Block_object_dispose(&v16, 8);
  return v9;
}

void __41__ATXModeEntityScorer_rankedAppsForMode___block_invoke(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

void __41__ATXModeEntityScorer_rankedAppsForMode___block_invoke_2()
{
  NSObject *v0;
  objc_class *v1;
  void *v2;
  int v3;
  void *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  __atxlog_handle_default();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    v1 = (objc_class *)objc_opt_class();
    NSStringFromClass(v1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = 138412290;
    v4 = v2;
    _os_log_impl(&dword_1A49EF000, v0, OS_LOG_TYPE_DEFAULT, "Successfully acquired semaphore in %@", (uint8_t *)&v3, 0xCu);

  }
}

void __41__ATXModeEntityScorer_rankedAppsForMode___block_invoke_10()
{
  NSObject *v0;

  __atxlog_handle_notification_management();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    __41__ATXModeEntityScorer_rankedAppsForMode___block_invoke_10_cold_1();

}

- (void)scoreUserNotifications:(id)a3 mode:(unint64_t)a4
{
  id v6;
  dispatch_semaphore_t v7;
  uint64_t v8;
  NSObject *v9;
  _QWORD v10[5];
  _QWORD v11[5];
  _QWORD v12[4];
  dispatch_semaphore_t v13;

  v6 = a3;
  v7 = dispatch_semaphore_create(0);
  v8 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __51__ATXModeEntityScorer_scoreUserNotifications_mode___block_invoke;
  v12[3] = &unk_1E4D59210;
  v13 = v7;
  v9 = v7;
  -[ATXModeEntityScorer scoreUserNotifications:mode:reply:](self, "scoreUserNotifications:mode:reply:", v6, a4, v12);

  v10[4] = self;
  v11[0] = v8;
  v11[1] = 3221225472;
  v11[2] = __51__ATXModeEntityScorer_scoreUserNotifications_mode___block_invoke_2;
  v11[3] = &unk_1E4D57590;
  v11[4] = self;
  v10[0] = v8;
  v10[1] = 3221225472;
  v10[2] = __51__ATXModeEntityScorer_scoreUserNotifications_mode___block_invoke_11;
  v10[3] = &unk_1E4D57590;
  objc_msgSend(MEMORY[0x1E0D81598], "waitForSemaphore:timeoutSeconds:onAcquire:onTimeout:", v9, v11, v10, 3.0);

}

intptr_t __51__ATXModeEntityScorer_scoreUserNotifications_mode___block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __51__ATXModeEntityScorer_scoreUserNotifications_mode___block_invoke_2()
{
  NSObject *v0;
  objc_class *v1;
  void *v2;
  int v3;
  void *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  __atxlog_handle_default();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    v1 = (objc_class *)objc_opt_class();
    NSStringFromClass(v1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = 138412290;
    v4 = v2;
    _os_log_impl(&dword_1A49EF000, v0, OS_LOG_TYPE_DEFAULT, "Successfully acquired semaphore in %@", (uint8_t *)&v3, 0xCu);

  }
}

void __51__ATXModeEntityScorer_scoreUserNotifications_mode___block_invoke_11()
{
  NSObject *v0;

  __atxlog_handle_notification_management();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    __51__ATXModeEntityScorer_scoreUserNotifications_mode___block_invoke_11_cold_1();

}

- (void)scoreNotifications:(id)a3 mode:(unint64_t)a4
{
  id v6;
  dispatch_semaphore_t v7;
  uint64_t v8;
  NSObject *v9;
  _QWORD v10[5];
  _QWORD v11[5];
  _QWORD v12[4];
  dispatch_semaphore_t v13;

  v6 = a3;
  v7 = dispatch_semaphore_create(0);
  v8 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __47__ATXModeEntityScorer_scoreNotifications_mode___block_invoke;
  v12[3] = &unk_1E4D59210;
  v13 = v7;
  v9 = v7;
  -[ATXModeEntityScorer scoreNotifications:mode:reply:](self, "scoreNotifications:mode:reply:", v6, a4, v12);

  v10[4] = self;
  v11[0] = v8;
  v11[1] = 3221225472;
  v11[2] = __47__ATXModeEntityScorer_scoreNotifications_mode___block_invoke_2;
  v11[3] = &unk_1E4D57590;
  v11[4] = self;
  v10[0] = v8;
  v10[1] = 3221225472;
  v10[2] = __47__ATXModeEntityScorer_scoreNotifications_mode___block_invoke_12;
  v10[3] = &unk_1E4D57590;
  objc_msgSend(MEMORY[0x1E0D81598], "waitForSemaphore:timeoutSeconds:onAcquire:onTimeout:", v9, v11, v10, 3.0);

}

intptr_t __47__ATXModeEntityScorer_scoreNotifications_mode___block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __47__ATXModeEntityScorer_scoreNotifications_mode___block_invoke_2()
{
  NSObject *v0;
  objc_class *v1;
  void *v2;
  int v3;
  void *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  __atxlog_handle_default();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    v1 = (objc_class *)objc_opt_class();
    NSStringFromClass(v1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = 138412290;
    v4 = v2;
    _os_log_impl(&dword_1A49EF000, v0, OS_LOG_TYPE_DEFAULT, "Successfully acquired semaphore in %@", (uint8_t *)&v3, 0xCu);

  }
}

void __47__ATXModeEntityScorer_scoreNotifications_mode___block_invoke_12()
{
  NSObject *v0;

  __atxlog_handle_notification_management();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    __51__ATXModeEntityScorer_scoreUserNotifications_mode___block_invoke_11_cold_1();

}

- (id)rankedNotificationsForMode:(unint64_t)a3
{
  dispatch_semaphore_t v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  id v9;
  _QWORD v11[5];
  _QWORD v12[5];
  _QWORD v13[4];
  NSObject *v14;
  uint64_t *v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__5;
  v21 = __Block_byref_object_dispose__5;
  v22 = 0;
  v5 = dispatch_semaphore_create(0);
  v6 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __50__ATXModeEntityScorer_rankedNotificationsForMode___block_invoke;
  v13[3] = &unk_1E4D59260;
  v16 = a3;
  v7 = v5;
  v14 = v7;
  v15 = &v17;
  -[ATXModeEntityScorer rankedNotificationsForMode:reply:](self, "rankedNotificationsForMode:reply:", a3, v13);
  v11[4] = self;
  v12[0] = v6;
  v12[1] = 3221225472;
  v12[2] = __50__ATXModeEntityScorer_rankedNotificationsForMode___block_invoke_13;
  v12[3] = &unk_1E4D57590;
  v12[4] = self;
  v11[0] = v6;
  v11[1] = 3221225472;
  v11[2] = __50__ATXModeEntityScorer_rankedNotificationsForMode___block_invoke_14;
  v11[3] = &unk_1E4D57590;
  objc_msgSend(MEMORY[0x1E0D81598], "waitForSemaphore:timeoutSeconds:onAcquire:onTimeout:", v7, v12, v11, 3.0);
  v8 = (void *)v18[5];
  if (!v8)
    v8 = (void *)MEMORY[0x1E0C9AA60];
  v9 = v8;

  _Block_object_dispose(&v17, 8);
  return v9;
}

void __50__ATXModeEntityScorer_rankedNotificationsForMode___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  NSObject *v8;

  v6 = a2;
  v7 = a3;
  if (v7)
  {
    __atxlog_handle_notification_management();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __50__ATXModeEntityScorer_rankedNotificationsForMode___block_invoke_cold_1();

  }
  else
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

void __50__ATXModeEntityScorer_rankedNotificationsForMode___block_invoke_13()
{
  NSObject *v0;
  objc_class *v1;
  void *v2;
  int v3;
  void *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  __atxlog_handle_default();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    v1 = (objc_class *)objc_opt_class();
    NSStringFromClass(v1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = 138412290;
    v4 = v2;
    _os_log_impl(&dword_1A49EF000, v0, OS_LOG_TYPE_DEFAULT, "Successfully acquired semaphore in %@", (uint8_t *)&v3, 0xCu);

  }
}

void __50__ATXModeEntityScorer_rankedNotificationsForMode___block_invoke_14()
{
  NSObject *v0;

  __atxlog_handle_notification_management();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    __50__ATXModeEntityScorer_rankedNotificationsForMode___block_invoke_14_cold_1();

}

- (id)rankedAppsForNotificationsForMode:(unint64_t)a3
{
  dispatch_semaphore_t v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  id v9;
  _QWORD v11[5];
  _QWORD v12[5];
  _QWORD v13[4];
  NSObject *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__5;
  v20 = __Block_byref_object_dispose__5;
  v21 = 0;
  v5 = dispatch_semaphore_create(0);
  v6 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __57__ATXModeEntityScorer_rankedAppsForNotificationsForMode___block_invoke;
  v13[3] = &unk_1E4D59238;
  v15 = &v16;
  v7 = v5;
  v14 = v7;
  -[ATXModeEntityScorer rankedAppsForNotificationsForMode:reply:](self, "rankedAppsForNotificationsForMode:reply:", a3, v13);
  v11[4] = self;
  v12[0] = v6;
  v12[1] = 3221225472;
  v12[2] = __57__ATXModeEntityScorer_rankedAppsForNotificationsForMode___block_invoke_2;
  v12[3] = &unk_1E4D57590;
  v12[4] = self;
  v11[0] = v6;
  v11[1] = 3221225472;
  v11[2] = __57__ATXModeEntityScorer_rankedAppsForNotificationsForMode___block_invoke_15;
  v11[3] = &unk_1E4D57590;
  objc_msgSend(MEMORY[0x1E0D81598], "waitForSemaphore:timeoutSeconds:onAcquire:onTimeout:", v7, v12, v11, 3.0);
  v8 = (void *)v17[5];
  if (!v8)
    v8 = (void *)MEMORY[0x1E0C9AA60];
  v9 = v8;

  _Block_object_dispose(&v16, 8);
  return v9;
}

void __57__ATXModeEntityScorer_rankedAppsForNotificationsForMode___block_invoke(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

void __57__ATXModeEntityScorer_rankedAppsForNotificationsForMode___block_invoke_2()
{
  NSObject *v0;
  objc_class *v1;
  void *v2;
  int v3;
  void *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  __atxlog_handle_default();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    v1 = (objc_class *)objc_opt_class();
    NSStringFromClass(v1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = 138412290;
    v4 = v2;
    _os_log_impl(&dword_1A49EF000, v0, OS_LOG_TYPE_DEFAULT, "Successfully acquired semaphore in %@", (uint8_t *)&v3, 0xCu);

  }
}

void __57__ATXModeEntityScorer_rankedAppsForNotificationsForMode___block_invoke_15()
{
  NSObject *v0;

  __atxlog_handle_notification_management();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    __57__ATXModeEntityScorer_rankedAppsForNotificationsForMode___block_invoke_15_cold_1();

}

- (id)rankedContactsForNotificationsForMode:(unint64_t)a3
{
  dispatch_semaphore_t v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  id v9;
  _QWORD v11[5];
  _QWORD v12[5];
  _QWORD v13[4];
  NSObject *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__5;
  v20 = __Block_byref_object_dispose__5;
  v21 = 0;
  v5 = dispatch_semaphore_create(0);
  v6 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __61__ATXModeEntityScorer_rankedContactsForNotificationsForMode___block_invoke;
  v13[3] = &unk_1E4D59238;
  v15 = &v16;
  v7 = v5;
  v14 = v7;
  -[ATXModeEntityScorer rankedContactsForNotificationsForMode:reply:](self, "rankedContactsForNotificationsForMode:reply:", a3, v13);
  v11[4] = self;
  v12[0] = v6;
  v12[1] = 3221225472;
  v12[2] = __61__ATXModeEntityScorer_rankedContactsForNotificationsForMode___block_invoke_2;
  v12[3] = &unk_1E4D57590;
  v12[4] = self;
  v11[0] = v6;
  v11[1] = 3221225472;
  v11[2] = __61__ATXModeEntityScorer_rankedContactsForNotificationsForMode___block_invoke_16;
  v11[3] = &unk_1E4D57590;
  objc_msgSend(MEMORY[0x1E0D81598], "waitForSemaphore:timeoutSeconds:onAcquire:onTimeout:", v7, v12, v11, 3.0);
  v8 = (void *)v17[5];
  if (!v8)
    v8 = (void *)MEMORY[0x1E0C9AA60];
  v9 = v8;

  _Block_object_dispose(&v16, 8);
  return v9;
}

void __61__ATXModeEntityScorer_rankedContactsForNotificationsForMode___block_invoke(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

void __61__ATXModeEntityScorer_rankedContactsForNotificationsForMode___block_invoke_2()
{
  NSObject *v0;
  objc_class *v1;
  void *v2;
  int v3;
  void *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  __atxlog_handle_default();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    v1 = (objc_class *)objc_opt_class();
    NSStringFromClass(v1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = 138412290;
    v4 = v2;
    _os_log_impl(&dword_1A49EF000, v0, OS_LOG_TYPE_DEFAULT, "Successfully acquired semaphore in %@", (uint8_t *)&v3, 0xCu);

  }
}

void __61__ATXModeEntityScorer_rankedContactsForNotificationsForMode___block_invoke_16()
{
  NSObject *v0;

  __atxlog_handle_notification_management();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    __61__ATXModeEntityScorer_rankedContactsForNotificationsForMode___block_invoke_16_cold_1();

}

- (id)modeEntityScoresFromCacheForModeEntityTypeIdentifier:(id)a3 modeIdentifier:(id)a4 modeConfigurationType:(int64_t)a5
{
  id v8;
  id v9;
  dispatch_semaphore_t v10;
  ATXModeEntityScorerInterface *modeEntityScorerClient;
  uint64_t v12;
  id v13;
  NSObject *v14;
  id v15;
  _QWORD v17[5];
  _QWORD v18[5];
  _QWORD v19[4];
  id v20;
  NSObject *v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;

  v8 = a3;
  v9 = a4;
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__5;
  v27 = __Block_byref_object_dispose__5;
  v28 = 0;
  v10 = dispatch_semaphore_create(0);
  modeEntityScorerClient = self->_modeEntityScorerClient;
  v12 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __113__ATXModeEntityScorer_modeEntityScoresFromCacheForModeEntityTypeIdentifier_modeIdentifier_modeConfigurationType___block_invoke;
  v19[3] = &unk_1E4D59288;
  v13 = v9;
  v20 = v13;
  v14 = v10;
  v21 = v14;
  v22 = &v23;
  -[ATXModeEntityScorerInterface modeEntityScoresFromCacheForModeEntityTypeIdentifier:modeIdentifier:modeConfigurationType:reply:](modeEntityScorerClient, "modeEntityScoresFromCacheForModeEntityTypeIdentifier:modeIdentifier:modeConfigurationType:reply:", v8, v13, a5, v19);
  v17[4] = self;
  v18[0] = v12;
  v18[1] = 3221225472;
  v18[2] = __113__ATXModeEntityScorer_modeEntityScoresFromCacheForModeEntityTypeIdentifier_modeIdentifier_modeConfigurationType___block_invoke_18;
  v18[3] = &unk_1E4D57590;
  v18[4] = self;
  v17[0] = v12;
  v17[1] = 3221225472;
  v17[2] = __113__ATXModeEntityScorer_modeEntityScoresFromCacheForModeEntityTypeIdentifier_modeIdentifier_modeConfigurationType___block_invoke_19;
  v17[3] = &unk_1E4D57590;
  objc_msgSend(MEMORY[0x1E0D81598], "waitForSemaphore:timeoutSeconds:onAcquire:onTimeout:", v14, v18, v17, 3.0);
  v15 = (id)v24[5];

  _Block_object_dispose(&v23, 8);
  return v15;
}

void __113__ATXModeEntityScorer_modeEntityScoresFromCacheForModeEntityTypeIdentifier_modeIdentifier_modeConfigurationType___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  NSObject *v8;

  v6 = a2;
  v7 = a3;
  if (v7)
  {
    __atxlog_handle_notification_management();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __113__ATXModeEntityScorer_modeEntityScoresFromCacheForModeEntityTypeIdentifier_modeIdentifier_modeConfigurationType___block_invoke_cold_1(a1, (uint64_t)v7, v8);

  }
  else
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a2);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));

}

void __113__ATXModeEntityScorer_modeEntityScoresFromCacheForModeEntityTypeIdentifier_modeIdentifier_modeConfigurationType___block_invoke_18()
{
  NSObject *v0;
  objc_class *v1;
  void *v2;
  int v3;
  void *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  __atxlog_handle_default();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    v1 = (objc_class *)objc_opt_class();
    NSStringFromClass(v1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = 138412290;
    v4 = v2;
    _os_log_impl(&dword_1A49EF000, v0, OS_LOG_TYPE_DEFAULT, "Successfully acquired semaphore in %@", (uint8_t *)&v3, 0xCu);

  }
}

void __113__ATXModeEntityScorer_modeEntityScoresFromCacheForModeEntityTypeIdentifier_modeIdentifier_modeConfigurationType___block_invoke_19()
{
  NSObject *v0;

  __atxlog_handle_notification_management();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    __113__ATXModeEntityScorer_modeEntityScoresFromCacheForModeEntityTypeIdentifier_modeIdentifier_modeConfigurationType___block_invoke_19_cold_1();

}

- (BOOL)assignModeEntityScores:(unint64_t)a3 entityTypeIdentifier:(id)a4 entityIdentifier:(id)a5 score:(double)a6 modeConfigurationType:(int64_t)a7
{
  id v12;
  id v13;
  dispatch_semaphore_t v14;
  ATXModeEntityScorerInterface *modeEntityScorerClient;
  uint64_t v16;
  NSObject *v17;
  _QWORD v19[5];
  _QWORD v20[5];
  _QWORD v21[4];
  NSObject *v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  char v27;

  v12 = a4;
  v13 = a5;
  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v27 = 0;
  v14 = dispatch_semaphore_create(0);
  modeEntityScorerClient = self->_modeEntityScorerClient;
  v16 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __112__ATXModeEntityScorer_assignModeEntityScores_entityTypeIdentifier_entityIdentifier_score_modeConfigurationType___block_invoke;
  v21[3] = &unk_1E4D592B0;
  v17 = v14;
  v22 = v17;
  v23 = &v24;
  -[ATXModeEntityScorerInterface assignModeEntityScores:entityTypeIdentifier:entityIdentifier:score:modeConfigurationType:reply:](modeEntityScorerClient, "assignModeEntityScores:entityTypeIdentifier:entityIdentifier:score:modeConfigurationType:reply:", a3, v12, v13, a7, v21, a6);
  v19[4] = self;
  v20[0] = v16;
  v20[1] = 3221225472;
  v20[2] = __112__ATXModeEntityScorer_assignModeEntityScores_entityTypeIdentifier_entityIdentifier_score_modeConfigurationType___block_invoke_21;
  v20[3] = &unk_1E4D57590;
  v20[4] = self;
  v19[0] = v16;
  v19[1] = 3221225472;
  v19[2] = __112__ATXModeEntityScorer_assignModeEntityScores_entityTypeIdentifier_entityIdentifier_score_modeConfigurationType___block_invoke_22;
  v19[3] = &unk_1E4D57590;
  objc_msgSend(MEMORY[0x1E0D81598], "waitForSemaphore:timeoutSeconds:onAcquire:onTimeout:", v17, v20, v19, 3.0);
  LOBYTE(self) = *((_BYTE *)v25 + 24);

  _Block_object_dispose(&v24, 8);
  return (char)self;
}

void __112__ATXModeEntityScorer_assignModeEntityScores_entityTypeIdentifier_entityIdentifier_score_modeConfigurationType___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;

  v5 = a3;
  if (v5)
  {
    __atxlog_handle_notification_management();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __112__ATXModeEntityScorer_assignModeEntityScores_entityTypeIdentifier_entityIdentifier_score_modeConfigurationType___block_invoke_cold_1();

  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

void __112__ATXModeEntityScorer_assignModeEntityScores_entityTypeIdentifier_entityIdentifier_score_modeConfigurationType___block_invoke_21()
{
  NSObject *v0;
  objc_class *v1;
  void *v2;
  int v3;
  void *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  __atxlog_handle_default();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    v1 = (objc_class *)objc_opt_class();
    NSStringFromClass(v1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = 138412290;
    v4 = v2;
    _os_log_impl(&dword_1A49EF000, v0, OS_LOG_TYPE_DEFAULT, "Successfully acquired semaphore in %@", (uint8_t *)&v3, 0xCu);

  }
}

void __112__ATXModeEntityScorer_assignModeEntityScores_entityTypeIdentifier_entityIdentifier_score_modeConfigurationType___block_invoke_22()
{
  NSObject *v0;

  __atxlog_handle_notification_management();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    __112__ATXModeEntityScorer_assignModeEntityScores_entityTypeIdentifier_entityIdentifier_score_modeConfigurationType___block_invoke_22_cold_1();

}

- (void)copyScoreMetadataFromEntities:(id)a3 toEntities:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  ATXModeEntityScore *v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  ATXModeEntityScore *v23;
  void *v24;
  id obj;
  uint64_t v26;
  uint64_t v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _QWORD v32[4];
  id v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_opt_new();
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __64__ATXModeEntityScorer_copyScoreMetadataFromEntities_toEntities___block_invoke;
  v32[3] = &unk_1E4D592D8;
  v8 = v7;
  v33 = v8;
  v24 = v5;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v32);
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  obj = v6;
  v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
  if (v27)
  {
    v26 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v27; ++i)
      {
        if (*(_QWORD *)v29 != v26)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        objc_msgSend(v10, "identifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectForKeyedSubscript:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12)
        {
          objc_msgSend(v10, "identifier");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "objectForKeyedSubscript:", v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          v15 = [ATXModeEntityScore alloc];
          objc_msgSend(v14, "scoreMetadata");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "score");
          v18 = v17;
          objc_msgSend(v14, "scoreMetadata");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "featureVector");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "scoreMetadata");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "uuid");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = -[ATXModeEntityScore initWithScore:featureVector:uuid:](v15, "initWithScore:featureVector:uuid:", v20, v22, v18);
          objc_msgSend(v10, "setScoreMetadata:", v23);

        }
      }
      v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
    }
    while (v27);
  }

}

void __64__ATXModeEntityScorer_copyScoreMetadataFromEntities_toEntities___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "identifier");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v3, v4);

}

- (void)copyScoreMetadataFromContactModeEntities:(id)a3 toContactModeEntities:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  ATXModeEntityScore *v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  ATXModeEntityScore *v23;
  void *v24;
  void *v25;
  id obj;
  uint64_t v27;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _QWORD v33[4];
  id v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_opt_new();
  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = __86__ATXModeEntityScorer_copyScoreMetadataFromContactModeEntities_toContactModeEntities___block_invoke;
  v33[3] = &unk_1E4D59300;
  v8 = v7;
  v34 = v8;
  v25 = v5;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v33);
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  obj = v6;
  v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
  if (v28)
  {
    v27 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v28; ++i)
      {
        if (*(_QWORD *)v30 != v27)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
        objc_msgSend(v10, "identifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectForKeyedSubscript:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12)
        {
          objc_msgSend(v10, "identifier");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "objectForKeyedSubscript:", v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          v15 = [ATXModeEntityScore alloc];
          objc_msgSend(v14, "scoreMetadata");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "score");
          v18 = v17;
          objc_msgSend(v14, "scoreMetadata");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "featureVector");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "scoreMetadata");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "uuid");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = -[ATXModeEntityScore initWithScore:featureVector:uuid:](v15, "initWithScore:featureVector:uuid:", v20, v22, v18);
          objc_msgSend(v10, "setScoreMetadata:", v23);

          objc_msgSend(v14, "stableContactIdentifier");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "setStableContactIdentifier:", v24);

        }
      }
      v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
    }
    while (v28);
  }

}

void __86__ATXModeEntityScorer_copyScoreMetadataFromContactModeEntities_toContactModeEntities___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a2;
  v3 = *(void **)(a1 + 32);
  objc_msgSend(v11, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, v4);

  objc_msgSend(v11, "cnContactId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = *(void **)(a1 + 32);
    objc_msgSend(v11, "cnContactId");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v11, v7);

  }
  objc_msgSend(v11, "rawIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = *(void **)(a1 + 32);
    objc_msgSend(v11, "rawIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v11, v10);

  }
}

- (void)scoreContacts:(id)a3 mode:(unint64_t)a4 reply:(id)a5
{
  id v8;
  id v9;
  ATXModeEntityScorerInterface *modeEntityScorerClient;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  unint64_t v16;

  v8 = a3;
  v9 = a5;
  modeEntityScorerClient = self->_modeEntityScorerClient;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __48__ATXModeEntityScorer_scoreContacts_mode_reply___block_invoke;
  v13[3] = &unk_1E4D59328;
  v15 = v9;
  v16 = a4;
  v13[4] = self;
  v14 = v8;
  v11 = v8;
  v12 = v9;
  -[ATXModeEntityScorerInterface scoreContacts:mode:reply:](modeEntityScorerClient, "scoreContacts:mode:reply:", v11, a4, v13);

}

void __48__ATXModeEntityScorer_scoreContacts_mode_reply___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  void (*v7)(void);

  v5 = a3;
  if (v5)
  {
    __atxlog_handle_notification_management();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __48__ATXModeEntityScorer_scoreContacts_mode_reply___block_invoke_cold_1();

    v7 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "copyScoreMetadataFromContactModeEntities:toContactModeEntities:", a2, *(_QWORD *)(a1 + 40));
    v7 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
  }
  v7();

}

- (void)rankedContactsForMode:(unint64_t)a3 reply:(id)a4
{
  id v6;
  ATXModeEntityScorerInterface *modeEntityScorerClient;
  id v8;
  _QWORD v9[4];
  id v10;
  unint64_t v11;

  v6 = a4;
  modeEntityScorerClient = self->_modeEntityScorerClient;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __51__ATXModeEntityScorer_rankedContactsForMode_reply___block_invoke;
  v9[3] = &unk_1E4D58DA0;
  v10 = v6;
  v11 = a3;
  v8 = v6;
  -[ATXModeEntityScorerInterface rankedContactsForMode:reply:](modeEntityScorerClient, "rankedContactsForMode:reply:", a3, v9);

}

void __51__ATXModeEntityScorer_rankedContactsForMode_reply___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  void (*v6)(void);

  v4 = a3;
  if (v4)
  {
    __atxlog_handle_notification_management();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __51__ATXModeEntityScorer_rankedContactsForMode_reply___block_invoke_cold_1();

    v6 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  else
  {
    v6 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  v6();

}

- (void)scoreApps:(id)a3 mode:(unint64_t)a4 reply:(id)a5
{
  id v8;
  id v9;
  ATXModeEntityScorerInterface *modeEntityScorerClient;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  unint64_t v16;

  v8 = a3;
  v9 = a5;
  modeEntityScorerClient = self->_modeEntityScorerClient;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __44__ATXModeEntityScorer_scoreApps_mode_reply___block_invoke;
  v13[3] = &unk_1E4D59328;
  v15 = v9;
  v16 = a4;
  v13[4] = self;
  v14 = v8;
  v11 = v8;
  v12 = v9;
  -[ATXModeEntityScorerInterface scoreApps:mode:reply:](modeEntityScorerClient, "scoreApps:mode:reply:", v11, a4, v13);

}

void __44__ATXModeEntityScorer_scoreApps_mode_reply___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  void (*v7)(void);

  v5 = a3;
  if (v5)
  {
    __atxlog_handle_notification_management();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __44__ATXModeEntityScorer_scoreApps_mode_reply___block_invoke_cold_1();

    v7 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "copyScoreMetadataFromEntities:toEntities:", a2, *(_QWORD *)(a1 + 40));
    v7 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
  }
  v7();

}

- (void)rankedAppsForMode:(unint64_t)a3 reply:(id)a4
{
  id v6;
  ATXModeEntityScorerInterface *modeEntityScorerClient;
  id v8;
  _QWORD v9[4];
  id v10;
  unint64_t v11;

  v6 = a4;
  modeEntityScorerClient = self->_modeEntityScorerClient;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __47__ATXModeEntityScorer_rankedAppsForMode_reply___block_invoke;
  v9[3] = &unk_1E4D58DA0;
  v10 = v6;
  v11 = a3;
  v8 = v6;
  -[ATXModeEntityScorerInterface rankedAppsForMode:reply:](modeEntityScorerClient, "rankedAppsForMode:reply:", a3, v9);

}

void __47__ATXModeEntityScorer_rankedAppsForMode_reply___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  void (*v6)(void);

  v4 = a3;
  if (v4)
  {
    __atxlog_handle_notification_management();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __47__ATXModeEntityScorer_rankedAppsForMode_reply___block_invoke_cold_1();

    v6 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  else
  {
    v6 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  v6();

}

- (void)rankedWidgetsForMode:(unint64_t)a3 reply:(id)a4
{
  id v6;
  ATXModeEntityScorerInterface *modeEntityScorerClient;
  id v8;
  _QWORD v9[4];
  id v10;
  unint64_t v11;

  v6 = a4;
  modeEntityScorerClient = self->_modeEntityScorerClient;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __50__ATXModeEntityScorer_rankedWidgetsForMode_reply___block_invoke;
  v9[3] = &unk_1E4D58DA0;
  v10 = v6;
  v11 = a3;
  v8 = v6;
  -[ATXModeEntityScorerInterface rankedWidgetsForMode:reply:](modeEntityScorerClient, "rankedWidgetsForMode:reply:", a3, v9);

}

void __50__ATXModeEntityScorer_rankedWidgetsForMode_reply___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  void (*v6)(void);

  v4 = a3;
  if (v4)
  {
    __atxlog_handle_notification_management();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __50__ATXModeEntityScorer_rankedWidgetsForMode_reply___block_invoke_cold_1();

    v6 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  else
  {
    v6 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  v6();

}

- (void)_attachNotificationEntityScores:(id)a3 toNotifications:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  ATXNotificationModeEntity *v20;
  void *v21;
  void *v22;
  ATXUserNotificationModelScore *v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  id obj;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_opt_new();
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v39;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v39 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
        objc_msgSend(v13, "identifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setObject:forKeyedSubscript:", v13, v14);

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
    }
    while (v10);
  }
  v32 = v8;

  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  obj = v6;
  v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v35;
    do
    {
      for (j = 0; j != v16; ++j)
      {
        if (*(_QWORD *)v35 != v17)
          objc_enumerationMutation(obj);
        v19 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * j);
        v20 = -[ATXNotificationModeEntity initWithUserNotification:]([ATXNotificationModeEntity alloc], "initWithUserNotification:", v19, v32);
        -[ATXNotificationModeEntity identifier](v20, "identifier");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "objectForKeyedSubscript:", v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        if (v22)
        {
          v23 = [ATXUserNotificationModelScore alloc];
          objc_msgSend(v22, "scoreMetadata");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "score");
          v26 = v25;
          objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
          v28 = v27;
          v29 = (void *)objc_opt_new();
          v30 = -[ATXUserNotificationModelScore initFromModelScoreData:modelVersion:score:scoreTimestamp:scoreUUID:scoreInfo:](v23, "initFromModelScoreData:modelVersion:score:scoreTimestamp:scoreUUID:scoreInfo:", CFSTR("ATXModeEntityScorer"), 0, v29, 0, v26, v28);

          objc_msgSend(v19, "derivedData");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "addScore:", v30);

        }
      }
      v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
    }
    while (v16);
  }

}

- (void)scoreUserNotifications:(id)a3 mode:(unint64_t)a4 reply:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  void *v12;
  _QWORD v13[5];
  id v14;
  id v15;
  id v16;

  v8 = a3;
  v9 = a5;
  if ((unint64_t)objc_msgSend(v8, "count") < 0xC351)
  {
    objc_msgSend(v8, "_pas_mappedArrayWithTransform:", &__block_literal_global_30);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __57__ATXModeEntityScorer_scoreUserNotifications_mode_reply___block_invoke_2;
    v13[3] = &unk_1E4D59370;
    v16 = v9;
    v13[4] = self;
    v14 = v12;
    v15 = v8;
    v11 = v12;
    -[ATXModeEntityScorer scoreNotifications:mode:reply:](self, "scoreNotifications:mode:reply:", v11, a4, v13);

  }
  else
  {
    __atxlog_handle_notification_management();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      -[ATXModeEntityScorer scoreUserNotifications:mode:reply:].cold.1(v10);

    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 28, 0);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, id))v9 + 2))(v9, v11);
  }

}

ATXNotificationModeEntity *__57__ATXModeEntityScorer_scoreUserNotifications_mode_reply___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  ATXNotificationModeEntity *v3;

  v2 = a2;
  objc_msgSend(v2, "bundleID");
  v3 = (ATXNotificationModeEntity *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v3 = -[ATXNotificationModeEntity initWithUserNotification:]([ATXNotificationModeEntity alloc], "initWithUserNotification:", v2);

  return v3;
}

uint64_t __57__ATXModeEntityScorer_scoreUserNotifications_mode_reply___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t (*v3)(void);

  if (a2)
  {
    v3 = *(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_attachNotificationEntityScores:toNotifications:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
    v3 = *(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16);
  }
  return v3();
}

- (void)scoreNotifications:(id)a3 mode:(unint64_t)a4 reply:(id)a5
{
  id v8;
  id v9;
  ATXModeEntityScorerInterface *modeEntityScorerClient;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  unint64_t v16;

  v8 = a3;
  v9 = a5;
  modeEntityScorerClient = self->_modeEntityScorerClient;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __53__ATXModeEntityScorer_scoreNotifications_mode_reply___block_invoke;
  v13[3] = &unk_1E4D59328;
  v15 = v9;
  v16 = a4;
  v13[4] = self;
  v14 = v8;
  v11 = v8;
  v12 = v9;
  -[ATXModeEntityScorerInterface scoreNotifications:mode:reply:](modeEntityScorerClient, "scoreNotifications:mode:reply:", v11, a4, v13);

}

void __53__ATXModeEntityScorer_scoreNotifications_mode_reply___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  void (*v7)(void);

  v5 = a3;
  if (v5)
  {
    __atxlog_handle_notification_management();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __53__ATXModeEntityScorer_scoreNotifications_mode_reply___block_invoke_cold_1();

    v7 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "copyScoreMetadataFromEntities:toEntities:", a2, *(_QWORD *)(a1 + 40));
    v7 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
  }
  v7();

}

- (void)rankedNotificationsForMode:(unint64_t)a3 reply:(id)a4
{
  id v6;
  ATXModeEntityScorerInterface *modeEntityScorerClient;
  id v8;
  _QWORD v9[4];
  id v10;
  unint64_t v11;

  v6 = a4;
  modeEntityScorerClient = self->_modeEntityScorerClient;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __56__ATXModeEntityScorer_rankedNotificationsForMode_reply___block_invoke;
  v9[3] = &unk_1E4D58DA0;
  v10 = v6;
  v11 = a3;
  v8 = v6;
  -[ATXModeEntityScorerInterface rankedNotificationsForMode:reply:](modeEntityScorerClient, "rankedNotificationsForMode:reply:", a3, v9);

}

void __56__ATXModeEntityScorer_rankedNotificationsForMode_reply___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  void (*v6)(void);

  v4 = a3;
  if (v4)
  {
    __atxlog_handle_notification_management();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __56__ATXModeEntityScorer_rankedNotificationsForMode_reply___block_invoke_cold_1();

    v6 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  else
  {
    v6 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  v6();

}

- (void)rankedAppsForNotificationsForMode:(unint64_t)a3 reply:(id)a4
{
  id v6;
  ATXModeEntityScorerInterface *modeEntityScorerClient;
  id v8;
  _QWORD v9[4];
  id v10;
  unint64_t v11;

  v6 = a4;
  modeEntityScorerClient = self->_modeEntityScorerClient;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __63__ATXModeEntityScorer_rankedAppsForNotificationsForMode_reply___block_invoke;
  v9[3] = &unk_1E4D58DA0;
  v10 = v6;
  v11 = a3;
  v8 = v6;
  -[ATXModeEntityScorerInterface rankedAppsForNotificationsForMode:reply:](modeEntityScorerClient, "rankedAppsForNotificationsForMode:reply:", a3, v9);

}

void __63__ATXModeEntityScorer_rankedAppsForNotificationsForMode_reply___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  void (*v6)(void);

  v4 = a3;
  if (v4)
  {
    __atxlog_handle_notification_management();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __63__ATXModeEntityScorer_rankedAppsForNotificationsForMode_reply___block_invoke_cold_1();

    v6 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  else
  {
    v6 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  v6();

}

- (void)rankedContactsForNotificationsForMode:(unint64_t)a3 reply:(id)a4
{
  id v6;
  ATXModeEntityScorerInterface *modeEntityScorerClient;
  id v8;
  _QWORD v9[4];
  id v10;
  unint64_t v11;

  v6 = a4;
  modeEntityScorerClient = self->_modeEntityScorerClient;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __67__ATXModeEntityScorer_rankedContactsForNotificationsForMode_reply___block_invoke;
  v9[3] = &unk_1E4D58DA0;
  v10 = v6;
  v11 = a3;
  v8 = v6;
  -[ATXModeEntityScorerInterface rankedContactsForNotificationsForMode:reply:](modeEntityScorerClient, "rankedContactsForNotificationsForMode:reply:", a3, v9);

}

void __67__ATXModeEntityScorer_rankedContactsForNotificationsForMode_reply___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  void (*v6)(void);

  v4 = a3;
  if (v4)
  {
    __atxlog_handle_notification_management();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __67__ATXModeEntityScorer_rankedContactsForNotificationsForMode_reply___block_invoke_cold_1();

    v6 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  else
  {
    v6 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  v6();

}

- (void)scoreAppsForDenyList:(id)a3 mode:(unint64_t)a4
{
  id v6;
  dispatch_semaphore_t v7;
  uint64_t v8;
  NSObject *v9;
  _QWORD v10[5];
  _QWORD v11[5];
  _QWORD v12[4];
  dispatch_semaphore_t v13;

  v6 = a3;
  v7 = dispatch_semaphore_create(0);
  v8 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __49__ATXModeEntityScorer_scoreAppsForDenyList_mode___block_invoke;
  v12[3] = &unk_1E4D59210;
  v13 = v7;
  v9 = v7;
  -[ATXModeEntityScorer scoreAppsForDenyList:mode:reply:](self, "scoreAppsForDenyList:mode:reply:", v6, a4, v12);

  v10[4] = self;
  v11[0] = v8;
  v11[1] = 3221225472;
  v11[2] = __49__ATXModeEntityScorer_scoreAppsForDenyList_mode___block_invoke_2;
  v11[3] = &unk_1E4D57590;
  v11[4] = self;
  v10[0] = v8;
  v10[1] = 3221225472;
  v10[2] = __49__ATXModeEntityScorer_scoreAppsForDenyList_mode___block_invoke_33;
  v10[3] = &unk_1E4D57590;
  objc_msgSend(MEMORY[0x1E0D81598], "waitForSemaphore:timeoutSeconds:onAcquire:onTimeout:", v9, v11, v10, 3.0);

}

intptr_t __49__ATXModeEntityScorer_scoreAppsForDenyList_mode___block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __49__ATXModeEntityScorer_scoreAppsForDenyList_mode___block_invoke_2()
{
  NSObject *v0;
  objc_class *v1;
  void *v2;
  int v3;
  void *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  __atxlog_handle_default();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    v1 = (objc_class *)objc_opt_class();
    NSStringFromClass(v1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = 138412290;
    v4 = v2;
    _os_log_impl(&dword_1A49EF000, v0, OS_LOG_TYPE_DEFAULT, "Successfully acquired semaphore in %@", (uint8_t *)&v3, 0xCu);

  }
}

void __49__ATXModeEntityScorer_scoreAppsForDenyList_mode___block_invoke_33()
{
  NSObject *v0;

  __atxlog_handle_notification_management();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    __49__ATXModeEntityScorer_scoreAppsForDenyList_mode___block_invoke_33_cold_1();

}

- (id)rankedAppsForDenyListForMode:(unint64_t)a3
{
  dispatch_semaphore_t v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  id v9;
  _QWORD v11[5];
  _QWORD v12[5];
  _QWORD v13[4];
  NSObject *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__5;
  v20 = __Block_byref_object_dispose__5;
  v21 = 0;
  v5 = dispatch_semaphore_create(0);
  v6 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __52__ATXModeEntityScorer_rankedAppsForDenyListForMode___block_invoke;
  v13[3] = &unk_1E4D59238;
  v15 = &v16;
  v7 = v5;
  v14 = v7;
  -[ATXModeEntityScorer rankedAppsForDenyListForMode:reply:](self, "rankedAppsForDenyListForMode:reply:", a3, v13);
  v11[4] = self;
  v12[0] = v6;
  v12[1] = 3221225472;
  v12[2] = __52__ATXModeEntityScorer_rankedAppsForDenyListForMode___block_invoke_2;
  v12[3] = &unk_1E4D57590;
  v12[4] = self;
  v11[0] = v6;
  v11[1] = 3221225472;
  v11[2] = __52__ATXModeEntityScorer_rankedAppsForDenyListForMode___block_invoke_34;
  v11[3] = &unk_1E4D57590;
  objc_msgSend(MEMORY[0x1E0D81598], "waitForSemaphore:timeoutSeconds:onAcquire:onTimeout:", v7, v12, v11, 3.0);
  v8 = (void *)v17[5];
  if (!v8)
    v8 = (void *)MEMORY[0x1E0C9AA60];
  v9 = v8;

  _Block_object_dispose(&v16, 8);
  return v9;
}

void __52__ATXModeEntityScorer_rankedAppsForDenyListForMode___block_invoke(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

void __52__ATXModeEntityScorer_rankedAppsForDenyListForMode___block_invoke_2()
{
  NSObject *v0;
  objc_class *v1;
  void *v2;
  int v3;
  void *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  __atxlog_handle_default();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    v1 = (objc_class *)objc_opt_class();
    NSStringFromClass(v1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = 138412290;
    v4 = v2;
    _os_log_impl(&dword_1A49EF000, v0, OS_LOG_TYPE_DEFAULT, "Successfully acquired semaphore in %@", (uint8_t *)&v3, 0xCu);

  }
}

void __52__ATXModeEntityScorer_rankedAppsForDenyListForMode___block_invoke_34()
{
  NSObject *v0;

  __atxlog_handle_notification_management();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    __52__ATXModeEntityScorer_rankedAppsForDenyListForMode___block_invoke_34_cold_1();

}

- (void)scoreAppsForDenyList:(id)a3 mode:(unint64_t)a4 reply:(id)a5
{
  id v8;
  id v9;
  ATXModeEntityScorerInterface *modeEntityScorerClient;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  unint64_t v16;

  v8 = a3;
  v9 = a5;
  modeEntityScorerClient = self->_modeEntityScorerClient;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __55__ATXModeEntityScorer_scoreAppsForDenyList_mode_reply___block_invoke;
  v13[3] = &unk_1E4D59328;
  v15 = v9;
  v16 = a4;
  v13[4] = self;
  v14 = v8;
  v11 = v8;
  v12 = v9;
  -[ATXModeEntityScorerInterface scoreAppsForDenyList:mode:reply:](modeEntityScorerClient, "scoreAppsForDenyList:mode:reply:", v11, a4, v13);

}

void __55__ATXModeEntityScorer_scoreAppsForDenyList_mode_reply___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  void (*v7)(void);

  v5 = a3;
  if (v5)
  {
    __atxlog_handle_notification_management();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __55__ATXModeEntityScorer_scoreAppsForDenyList_mode_reply___block_invoke_cold_1();

    v7 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "copyScoreMetadataFromEntities:toEntities:", a2, *(_QWORD *)(a1 + 40));
    v7 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
  }
  v7();

}

- (void)rankedAppsForDenyListForMode:(unint64_t)a3 reply:(id)a4
{
  id v6;
  ATXModeEntityScorerInterface *modeEntityScorerClient;
  id v8;
  _QWORD v9[4];
  id v10;
  unint64_t v11;

  v6 = a4;
  modeEntityScorerClient = self->_modeEntityScorerClient;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __58__ATXModeEntityScorer_rankedAppsForDenyListForMode_reply___block_invoke;
  v9[3] = &unk_1E4D58DA0;
  v10 = v6;
  v11 = a3;
  v8 = v6;
  -[ATXModeEntityScorerInterface rankedAppsForDenyListForMode:reply:](modeEntityScorerClient, "rankedAppsForDenyListForMode:reply:", a3, v9);

}

void __58__ATXModeEntityScorer_rankedAppsForDenyListForMode_reply___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  void (*v6)(void);

  v4 = a3;
  if (v4)
  {
    __atxlog_handle_notification_management();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __58__ATXModeEntityScorer_rankedAppsForDenyListForMode_reply___block_invoke_cold_1();

    v6 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  else
  {
    v6 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  v6();

}

- (void)scoreContactsForDenyList:(id)a3 mode:(unint64_t)a4
{
  id v6;
  dispatch_semaphore_t v7;
  uint64_t v8;
  NSObject *v9;
  _QWORD v10[5];
  _QWORD v11[5];
  _QWORD v12[4];
  dispatch_semaphore_t v13;

  v6 = a3;
  v7 = dispatch_semaphore_create(0);
  v8 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __53__ATXModeEntityScorer_scoreContactsForDenyList_mode___block_invoke;
  v12[3] = &unk_1E4D59210;
  v13 = v7;
  v9 = v7;
  -[ATXModeEntityScorer scoreContactsForDenyList:mode:reply:](self, "scoreContactsForDenyList:mode:reply:", v6, a4, v12);

  v10[4] = self;
  v11[0] = v8;
  v11[1] = 3221225472;
  v11[2] = __53__ATXModeEntityScorer_scoreContactsForDenyList_mode___block_invoke_2;
  v11[3] = &unk_1E4D57590;
  v11[4] = self;
  v10[0] = v8;
  v10[1] = 3221225472;
  v10[2] = __53__ATXModeEntityScorer_scoreContactsForDenyList_mode___block_invoke_35;
  v10[3] = &unk_1E4D57590;
  objc_msgSend(MEMORY[0x1E0D81598], "waitForSemaphore:timeoutSeconds:onAcquire:onTimeout:", v9, v11, v10, 3.0);

}

intptr_t __53__ATXModeEntityScorer_scoreContactsForDenyList_mode___block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __53__ATXModeEntityScorer_scoreContactsForDenyList_mode___block_invoke_2()
{
  NSObject *v0;
  objc_class *v1;
  void *v2;
  int v3;
  void *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  __atxlog_handle_default();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    v1 = (objc_class *)objc_opt_class();
    NSStringFromClass(v1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = 138412290;
    v4 = v2;
    _os_log_impl(&dword_1A49EF000, v0, OS_LOG_TYPE_DEFAULT, "Successfully acquired semaphore in %@", (uint8_t *)&v3, 0xCu);

  }
}

void __53__ATXModeEntityScorer_scoreContactsForDenyList_mode___block_invoke_35()
{
  NSObject *v0;

  __atxlog_handle_notification_management();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    __53__ATXModeEntityScorer_scoreContactsForDenyList_mode___block_invoke_35_cold_1();

}

- (id)rankedContactsForDenyListForMode:(unint64_t)a3
{
  return -[ATXModeEntityScorer rankedContactsForDenyListForMode:options:](self, "rankedContactsForDenyListForMode:options:", a3, 0);
}

- (id)rankedContactsForDenyListForMode:(unint64_t)a3 options:(unint64_t)a4
{
  dispatch_semaphore_t v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  id v11;
  _QWORD v13[5];
  _QWORD v14[5];
  _QWORD v15[4];
  NSObject *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__5;
  v22 = __Block_byref_object_dispose__5;
  v23 = 0;
  v7 = dispatch_semaphore_create(0);
  v8 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __64__ATXModeEntityScorer_rankedContactsForDenyListForMode_options___block_invoke;
  v15[3] = &unk_1E4D59238;
  v17 = &v18;
  v9 = v7;
  v16 = v9;
  -[ATXModeEntityScorer rankedContactsForDenyListForMode:options:reply:](self, "rankedContactsForDenyListForMode:options:reply:", a3, a4, v15);
  v13[4] = self;
  v14[0] = v8;
  v14[1] = 3221225472;
  v14[2] = __64__ATXModeEntityScorer_rankedContactsForDenyListForMode_options___block_invoke_2;
  v14[3] = &unk_1E4D57590;
  v14[4] = self;
  v13[0] = v8;
  v13[1] = 3221225472;
  v13[2] = __64__ATXModeEntityScorer_rankedContactsForDenyListForMode_options___block_invoke_36;
  v13[3] = &unk_1E4D57590;
  objc_msgSend(MEMORY[0x1E0D81598], "waitForSemaphore:timeoutSeconds:onAcquire:onTimeout:", v9, v14, v13, 3.0);
  v10 = (void *)v19[5];
  if (!v10)
    v10 = (void *)MEMORY[0x1E0C9AA60];
  v11 = v10;

  _Block_object_dispose(&v18, 8);
  return v11;
}

void __64__ATXModeEntityScorer_rankedContactsForDenyListForMode_options___block_invoke(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

void __64__ATXModeEntityScorer_rankedContactsForDenyListForMode_options___block_invoke_2()
{
  NSObject *v0;
  objc_class *v1;
  void *v2;
  int v3;
  void *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  __atxlog_handle_default();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    v1 = (objc_class *)objc_opt_class();
    NSStringFromClass(v1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = 138412290;
    v4 = v2;
    _os_log_impl(&dword_1A49EF000, v0, OS_LOG_TYPE_DEFAULT, "Successfully acquired semaphore in %@", (uint8_t *)&v3, 0xCu);

  }
}

void __64__ATXModeEntityScorer_rankedContactsForDenyListForMode_options___block_invoke_36()
{
  NSObject *v0;

  __atxlog_handle_notification_management();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    __64__ATXModeEntityScorer_rankedContactsForDenyListForMode_options___block_invoke_36_cold_1();

}

- (void)scoreContactsForDenyList:(id)a3 mode:(unint64_t)a4 reply:(id)a5
{
  id v8;
  id v9;
  ATXModeEntityScorerInterface *modeEntityScorerClient;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  unint64_t v16;

  v8 = a3;
  v9 = a5;
  modeEntityScorerClient = self->_modeEntityScorerClient;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __59__ATXModeEntityScorer_scoreContactsForDenyList_mode_reply___block_invoke;
  v13[3] = &unk_1E4D59328;
  v15 = v9;
  v16 = a4;
  v13[4] = self;
  v14 = v8;
  v11 = v8;
  v12 = v9;
  -[ATXModeEntityScorerInterface scoreContactsForDenyList:mode:reply:](modeEntityScorerClient, "scoreContactsForDenyList:mode:reply:", v11, a4, v13);

}

void __59__ATXModeEntityScorer_scoreContactsForDenyList_mode_reply___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  void (*v7)(void);

  v5 = a3;
  if (v5)
  {
    __atxlog_handle_notification_management();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __59__ATXModeEntityScorer_scoreContactsForDenyList_mode_reply___block_invoke_cold_1();

    v7 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "copyScoreMetadataFromEntities:toEntities:", a2, *(_QWORD *)(a1 + 40));
    v7 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
  }
  v7();

}

- (void)rankedContactsForDenyListForMode:(unint64_t)a3 reply:(id)a4
{
  -[ATXModeEntityScorer rankedContactsForDenyListForMode:options:reply:](self, "rankedContactsForDenyListForMode:options:reply:", a3, 0, a4);
}

- (void)rankedContactsForDenyListForMode:(unint64_t)a3 options:(unint64_t)a4 reply:(id)a5
{
  id v8;
  ATXModeEntityScorerInterface *modeEntityScorerClient;
  id v10;
  _QWORD v11[4];
  id v12;
  unint64_t v13;

  v8 = a5;
  modeEntityScorerClient = self->_modeEntityScorerClient;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __70__ATXModeEntityScorer_rankedContactsForDenyListForMode_options_reply___block_invoke;
  v11[3] = &unk_1E4D58DA0;
  v12 = v8;
  v13 = a3;
  v10 = v8;
  -[ATXModeEntityScorerInterface rankedContactsForDenyListForMode:options:reply:](modeEntityScorerClient, "rankedContactsForDenyListForMode:options:reply:", a3, a4, v11);

}

void __70__ATXModeEntityScorer_rankedContactsForDenyListForMode_options_reply___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  void (*v6)(void);

  v4 = a3;
  if (v4)
  {
    __atxlog_handle_notification_management();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __70__ATXModeEntityScorer_rankedContactsForDenyListForMode_options_reply___block_invoke_cold_1();

    v6 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  else
  {
    v6 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  v6();

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modeEntityScorerClient, 0);
}

void __38__ATXModeEntityScorer_scoreApps_mode___block_invoke_8_cold_1()
{
  objc_class *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v0 = (objc_class *)OUTLINED_FUNCTION_5_1();
  NSStringFromClass(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_6(&dword_1A49EF000, v2, v3, "%@ - timed out trying to set app mode entity scores", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_3();
}

void __41__ATXModeEntityScorer_rankedAppsForMode___block_invoke_10_cold_1()
{
  objc_class *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v0 = (objc_class *)OUTLINED_FUNCTION_5_1();
  NSStringFromClass(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_6(&dword_1A49EF000, v2, v3, "%@ - timed out trying to get rankedAppsForMode", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_3();
}

void __51__ATXModeEntityScorer_scoreUserNotifications_mode___block_invoke_11_cold_1()
{
  objc_class *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v0 = (objc_class *)OUTLINED_FUNCTION_5_1();
  NSStringFromClass(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_6(&dword_1A49EF000, v2, v3, "%@ - timed out trying to set notification mode entity scores", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_3();
}

void __50__ATXModeEntityScorer_rankedNotificationsForMode___block_invoke_cold_1()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_9();
  ATXModeToString(*(_QWORD *)(v0 + 48));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_1_3(&dword_1A49EF000, v2, v3, "Did not receive rankedNotifications for mode:%@ error:%@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_5_0();
}

void __50__ATXModeEntityScorer_rankedNotificationsForMode___block_invoke_14_cold_1()
{
  objc_class *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v0 = (objc_class *)OUTLINED_FUNCTION_5_1();
  NSStringFromClass(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_6(&dword_1A49EF000, v2, v3, "%@ - timed out trying to get rankedNotificationsForMode", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_3();
}

void __57__ATXModeEntityScorer_rankedAppsForNotificationsForMode___block_invoke_15_cold_1()
{
  objc_class *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v0 = (objc_class *)OUTLINED_FUNCTION_5_1();
  NSStringFromClass(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_6(&dword_1A49EF000, v2, v3, "%@ - timed out trying to get rankedAppsForNotificationsForMode", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_3();
}

void __61__ATXModeEntityScorer_rankedContactsForNotificationsForMode___block_invoke_16_cold_1()
{
  objc_class *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v0 = (objc_class *)OUTLINED_FUNCTION_5_1();
  NSStringFromClass(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_6(&dword_1A49EF000, v2, v3, "%@ - timed out trying to get rankedContactsForNotificationsForMode", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_3();
}

void __113__ATXModeEntityScorer_modeEntityScoresFromCacheForModeEntityTypeIdentifier_modeIdentifier_modeConfigurationType___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = 138412546;
  v5 = v3;
  v6 = 2112;
  v7 = a2;
  _os_log_error_impl(&dword_1A49EF000, log, OS_LOG_TYPE_ERROR, "Did not receive modeEntityScoresFromCache for mode:%@ error:%@", (uint8_t *)&v4, 0x16u);
}

void __113__ATXModeEntityScorer_modeEntityScoresFromCacheForModeEntityTypeIdentifier_modeIdentifier_modeConfigurationType___block_invoke_19_cold_1()
{
  objc_class *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v0 = (objc_class *)OUTLINED_FUNCTION_5_1();
  NSStringFromClass(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_6(&dword_1A49EF000, v2, v3, "%@ - timed out trying to get modeEntityScoresFromCacheForModeEntityTypeIdentifier", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_3();
}

void __112__ATXModeEntityScorer_assignModeEntityScores_entityTypeIdentifier_entityIdentifier_score_modeConfigurationType___block_invoke_cold_1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2_2();
  _os_log_error_impl(&dword_1A49EF000, v0, OS_LOG_TYPE_ERROR, "assignModeEntityScores error:%@", v1, 0xCu);
}

void __112__ATXModeEntityScorer_assignModeEntityScores_entityTypeIdentifier_entityIdentifier_score_modeConfigurationType___block_invoke_22_cold_1()
{
  objc_class *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v0 = (objc_class *)OUTLINED_FUNCTION_5_1();
  NSStringFromClass(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_6(&dword_1A49EF000, v2, v3, "%@ - timed out trying to assignModeEntityScores", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_3();
}

void __48__ATXModeEntityScorer_scoreContacts_mode_reply___block_invoke_cold_1()
{
  uint64_t v0;
  unint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_9();
  v1 = OUTLINED_FUNCTION_9_0(v0);
  ATXModeToString(v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_1_3(&dword_1A49EF000, v3, v4, "Did not score contacts for mode:%@ error:%@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_5_0();
}

void __51__ATXModeEntityScorer_rankedContactsForMode_reply___block_invoke_cold_1()
{
  uint64_t v0;
  unint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_9();
  v1 = OUTLINED_FUNCTION_8_0(v0);
  ATXModeToString(v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_1_3(&dword_1A49EF000, v3, v4, "Did not receive rankedContacts for mode:%@ error:%@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_5_0();
}

void __44__ATXModeEntityScorer_scoreApps_mode_reply___block_invoke_cold_1()
{
  uint64_t v0;
  unint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_9();
  v1 = OUTLINED_FUNCTION_9_0(v0);
  ATXModeToString(v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_1_3(&dword_1A49EF000, v3, v4, "Did not score apps for mode:%@ error:%@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_5_0();
}

void __47__ATXModeEntityScorer_rankedAppsForMode_reply___block_invoke_cold_1()
{
  uint64_t v0;
  unint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_9();
  v1 = OUTLINED_FUNCTION_8_0(v0);
  ATXModeToString(v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_1_3(&dword_1A49EF000, v3, v4, "Did not receive rankedApps for mode:%@ error:%@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_5_0();
}

void __50__ATXModeEntityScorer_rankedWidgetsForMode_reply___block_invoke_cold_1()
{
  uint64_t v0;
  unint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_9();
  v1 = OUTLINED_FUNCTION_8_0(v0);
  ATXModeToString(v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_1_3(&dword_1A49EF000, v3, v4, "Did not receive ranked widgets for mode:%@ error:%@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_5_0();
}

- (void)scoreUserNotifications:(os_log_t)log mode:reply:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1A49EF000, log, OS_LOG_TYPE_FAULT, "More than 50,000 notifications were passed for ranking", v1, 2u);
}

void __53__ATXModeEntityScorer_scoreNotifications_mode_reply___block_invoke_cold_1()
{
  uint64_t v0;
  unint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_9();
  v1 = OUTLINED_FUNCTION_9_0(v0);
  ATXModeToString(v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_1_3(&dword_1A49EF000, v3, v4, "Did not score notifications for mode:%@ error:%@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_5_0();
}

void __56__ATXModeEntityScorer_rankedNotificationsForMode_reply___block_invoke_cold_1()
{
  uint64_t v0;
  unint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_9();
  v1 = OUTLINED_FUNCTION_8_0(v0);
  ATXModeToString(v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_1_3(&dword_1A49EF000, v3, v4, "Did not receive rankedNotifications for mode:%@ error:%@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_5_0();
}

void __63__ATXModeEntityScorer_rankedAppsForNotificationsForMode_reply___block_invoke_cold_1()
{
  uint64_t v0;
  unint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_9();
  v1 = OUTLINED_FUNCTION_8_0(v0);
  ATXModeToString(v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_1_3(&dword_1A49EF000, v3, v4, "Did not receive rankedAppsForNotifications for mode:%@ error:%@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_5_0();
}

void __67__ATXModeEntityScorer_rankedContactsForNotificationsForMode_reply___block_invoke_cold_1()
{
  uint64_t v0;
  unint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_9();
  v1 = OUTLINED_FUNCTION_8_0(v0);
  ATXModeToString(v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_1_3(&dword_1A49EF000, v3, v4, "Did not receive rankedContactsForNotifications for mode:%@ error:%@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_5_0();
}

void __49__ATXModeEntityScorer_scoreAppsForDenyList_mode___block_invoke_33_cold_1()
{
  objc_class *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v0 = (objc_class *)OUTLINED_FUNCTION_5_1();
  NSStringFromClass(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_6(&dword_1A49EF000, v2, v3, "%@ - timed out trying to score apps for deny list", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_3();
}

void __52__ATXModeEntityScorer_rankedAppsForDenyListForMode___block_invoke_34_cold_1()
{
  objc_class *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v0 = (objc_class *)OUTLINED_FUNCTION_5_1();
  NSStringFromClass(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_6(&dword_1A49EF000, v2, v3, "%@ - timed out trying to get rankedAppsForDenyListForMode", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_3();
}

void __55__ATXModeEntityScorer_scoreAppsForDenyList_mode_reply___block_invoke_cold_1()
{
  uint64_t v0;
  unint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_9();
  v1 = OUTLINED_FUNCTION_9_0(v0);
  ATXModeToString(v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_1_3(&dword_1A49EF000, v3, v4, "Unable to score apps for deny list for mode:%@ error:%@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_5_0();
}

void __58__ATXModeEntityScorer_rankedAppsForDenyListForMode_reply___block_invoke_cold_1()
{
  uint64_t v0;
  unint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_9();
  v1 = OUTLINED_FUNCTION_8_0(v0);
  ATXModeToString(v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_1_3(&dword_1A49EF000, v3, v4, "Did not receive ranked apps for deny list for mode:%@ error:%@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_5_0();
}

void __53__ATXModeEntityScorer_scoreContactsForDenyList_mode___block_invoke_35_cold_1()
{
  objc_class *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v0 = (objc_class *)OUTLINED_FUNCTION_5_1();
  NSStringFromClass(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_6(&dword_1A49EF000, v2, v3, "%@ - timed out trying to score contacts for deny list", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_3();
}

void __64__ATXModeEntityScorer_rankedContactsForDenyListForMode_options___block_invoke_36_cold_1()
{
  objc_class *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v0 = (objc_class *)OUTLINED_FUNCTION_5_1();
  NSStringFromClass(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_6(&dword_1A49EF000, v2, v3, "%@ - timed out trying to get ranked contacts for denyl ist for mode", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_3();
}

void __59__ATXModeEntityScorer_scoreContactsForDenyList_mode_reply___block_invoke_cold_1()
{
  uint64_t v0;
  unint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_9();
  v1 = OUTLINED_FUNCTION_9_0(v0);
  ATXModeToString(v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_1_3(&dword_1A49EF000, v3, v4, "Unable to score contacts for deny list for mode:%@ error:%@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_5_0();
}

void __70__ATXModeEntityScorer_rankedContactsForDenyListForMode_options_reply___block_invoke_cold_1()
{
  uint64_t v0;
  unint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_9();
  v1 = OUTLINED_FUNCTION_8_0(v0);
  ATXModeToString(v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_1_3(&dword_1A49EF000, v3, v4, "Did not receive ranked contacts for deny list for mode:%@ error:%@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_5_0();
}

@end
