@implementation ATXInterruptingNotificationsAccumulator

- (ATXInterruptingNotificationsAccumulator)init
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  ATXInterruptingNotificationsAccumulator *v14;

  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", -2419200.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  BiomeLibrary();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "Notification");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "Usage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  BiomeLibrary();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "App");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "InFocus");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026F0]), "initWithStartDate:endDate:maxEvents:lastN:reversed:", v3, 0, 0, 0, 0);
  v11 = *MEMORY[0x1E0CF9398];
  objc_msgSend(v6, "publisherWithUseCase:options:", *MEMORY[0x1E0CF9398], v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "publisherWithUseCase:options:", v11, v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[ATXInterruptingNotificationsAccumulator initWithNotificationPublisher:appLaunchPublisher:](self, "initWithNotificationPublisher:appLaunchPublisher:", v12, v13);

  return v14;
}

- (ATXInterruptingNotificationsAccumulator)initWithNotificationPublisher:(id)a3 appLaunchPublisher:(id)a4
{
  id v7;
  id v8;
  ATXInterruptingNotificationsAccumulator *v9;
  uint64_t v10;
  ATXInterruptingNotificationsHelper *interruptingNotifications;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)ATXInterruptingNotificationsAccumulator;
  v9 = -[ATXInterruptingNotificationsAccumulator init](&v13, sel_init);
  if (v9)
  {
    v10 = objc_opt_new();
    interruptingNotifications = v9->_interruptingNotifications;
    v9->_interruptingNotifications = (ATXInterruptingNotificationsHelper *)v10;

    objc_storeStrong((id *)&v9->_notificationPublisher, a3);
    objc_storeStrong((id *)&v9->_appLaunchPublisher, a4);
  }

  return v9;
}

- (BOOL)successfullyAccumulatedInterruptingSessions
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  NSObject *p_super;
  NSObject *v12;
  NSArray *v13;
  _QWORD v15[4];
  id v16;
  ATXInterruptingNotificationsAccumulator *v17;
  _QWORD v18[5];
  uint64_t v19;
  _QWORD v20[4];
  id v21;
  uint8_t buf[4];
  const char *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0C99E20]);
  +[_ATXAppIconState sharedInstance](_ATXAppIconState, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allInstalledAppsKnownToSpringBoard");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithArray:", v5);

  -[BPSPublisher orderedMergeWithOther:comparator:](self->_notificationPublisher, "orderedMergeWithOther:comparator:", self->_appLaunchPublisher, &__block_literal_global_179);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0;
  v20[0] = &v19;
  v20[1] = 0x3032000000;
  v20[2] = __Block_byref_object_copy__82;
  v20[3] = __Block_byref_object_dispose__82;
  v21 = 0;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __86__ATXInterruptingNotificationsAccumulator_successfullyAccumulatedInterruptingSessions__block_invoke_9;
  v18[3] = &unk_1E82DB658;
  v18[4] = &v19;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __86__ATXInterruptingNotificationsAccumulator_successfullyAccumulatedInterruptingSessions__block_invoke_2;
  v15[3] = &unk_1E82DCD98;
  v8 = v6;
  v16 = v8;
  v17 = self;
  v9 = (id)objc_msgSend(v7, "sinkWithCompletion:receiveInput:", v18, v15);
  v10 = *(_QWORD *)(v20[0] + 40);
  if (v10)
  {
    __atxlog_handle_usage_insights();
    p_super = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
      -[ATXInterruptingNotificationsAccumulator successfullyAccumulatedInterruptingSessions].cold.1((uint64_t)v20, p_super);
  }
  else
  {
    __atxlog_handle_usage_insights();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v23 = "-[ATXInterruptingNotificationsAccumulator successfullyAccumulatedInterruptingSessions]";
      _os_log_impl(&dword_1C9A3B000, v12, OS_LOG_TYPE_INFO, "%s: Successfully accumulated interrupting app session events", buf, 0xCu);
    }

    -[ATXInterruptingNotificationsHelper interruptingAppsessions](self->_interruptingNotifications, "interruptingAppsessions");
    v13 = (NSArray *)objc_claimAutoreleasedReturnValue();
    p_super = &self->_allInterruptingAppSessions->super;
    self->_allInterruptingAppSessions = v13;
  }

  _Block_object_dispose(&v19, 8);
  return v10 == 0;
}

uint64_t __86__ATXInterruptingNotificationsAccumulator_successfullyAccumulatedInterruptingSessions__block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  uint64_t v11;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  v5 = a3;
  objc_msgSend(a2, "timestamp");
  objc_msgSend(v4, "numberWithDouble:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v5, "timestamp");
  v9 = v8;

  objc_msgSend(v7, "numberWithDouble:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v6, "compare:", v10);

  return v11;
}

void __86__ATXInterruptingNotificationsAccumulator_successfullyAccumulatedInterruptingSessions__block_invoke_9(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(a2, "error");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __86__ATXInterruptingNotificationsAccumulator_successfullyAccumulatedInterruptingSessions__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  char isKindOfClass;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a2;
  objc_msgSend(v12, "eventBody");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  objc_msgSend(v12, "eventBody");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if ((isKindOfClass & 1) != 0)
  {
    v7 = *(void **)(a1 + 32);
    objc_msgSend(v5, "bundleID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v7) = objc_msgSend(v7, "containsObject:", v8);

    if ((_DWORD)v7 && objc_msgSend(v6, "usageType") == 17)
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "checkNotificationEvent:", v6);
LABEL_11:

    goto LABEL_12;
  }
  objc_opt_class();
  v9 = objc_opt_isKindOfClass();

  if ((v9 & 1) != 0)
  {
    objc_msgSend(v12, "eventBody");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *(void **)(a1 + 32);
    objc_msgSend(v6, "bundleID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v10) = objc_msgSend(v10, "containsObject:", v11);

    if ((_DWORD)v10)
    {
      if (objc_msgSend(v6, "starting"))
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "checkAppLaunchStartEvent:", v6);
      if ((objc_msgSend(v6, "starting") & 1) == 0)
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "checkAppLaunchEndEvent:", v6);
    }
    goto LABEL_11;
  }
LABEL_12:

}

- (NSArray)allInterruptingAppSessions
{
  return self->_allInterruptingAppSessions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allInterruptingAppSessions, 0);
  objc_storeStrong((id *)&self->_appLaunchPublisher, 0);
  objc_storeStrong((id *)&self->_notificationPublisher, 0);
  objc_storeStrong((id *)&self->_interruptingNotifications, 0);
}

- (void)successfullyAccumulatedInterruptingSessions
{
  uint64_t v2;
  int v3;
  const char *v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(*(_QWORD *)a1 + 40);
  v3 = 136315394;
  v4 = "-[ATXInterruptingNotificationsAccumulator successfullyAccumulatedInterruptingSessions]";
  v5 = 2112;
  v6 = v2;
  _os_log_error_impl(&dword_1C9A3B000, a2, OS_LOG_TYPE_ERROR, "%s: Error with reading merged notifications and app launch streams: %@", (uint8_t *)&v3, 0x16u);
}

@end
