@implementation CNACTStewieFacade

- (CNACTStewieFacade)init
{
  NSObject *v3;
  dispatch_queue_t v4;
  void *v5;
  void *v6;
  CNACTStewieFacade *v7;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = dispatch_queue_create("com.apple.contacts.autocomplete.core-telephony", v3);

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA6E38]), "initWithQueue:", v4);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA6E20]), "initWithDelegate:queue:", self, v4);
  v7 = -[CNACTStewieFacade initWithCoreTelephonyClient:stateMonitor:](self, "initWithCoreTelephonyClient:stateMonitor:", v5, v6);

  return v7;
}

- (CNACTStewieFacade)initWithCoreTelephonyClient:(id)a3 stateMonitor:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  CNACTStewieFacade *v10;
  CNACTStewieFacade *v11;
  CNACTStewieFacade *v12;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  if (!v8)
  {
    if (CNGuardOSLog_cn_once_token_0 != -1)
      dispatch_once(&CNGuardOSLog_cn_once_token_0, &__block_literal_global_21);
    v9 = CNGuardOSLog_cn_once_object_0;
    if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0, OS_LOG_TYPE_FAULT))
      -[CNACTStewieFacade initWithCoreTelephonyClient:stateMonitor:].cold.1(v9);
  }
  v14.receiver = self;
  v14.super_class = (Class)CNACTStewieFacade;
  v10 = -[CNACTStewieFacade init](&v14, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_coreTelephonyClient, a3);
    objc_storeStrong((id *)&v11->_stateMonitor, a4);
    v12 = v11;
  }

  return v11;
}

- (NSString)description
{
  void *v3;
  id v4;
  id v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0D13A08], "descriptionBuilderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("Stewie terms"), self->_emergencyMemo);
  v5 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("Avocet terms"), self->_avocetMemo);
  objc_msgSend(v3, "build");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (void)startMonitoring
{
  OUTLINED_FUNCTION_2(&dword_1B9950000, a1, a3, "Failed to start Stewie Monitor", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_4();
}

+ (BOOL)isMemoValid:(id)a3
{
  double v3;

  objc_msgSend(a1, "ageOfMemo:", a3);
  return v3 < 5.0;
}

+ (double)ageOfMemo:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;

  if (!a3)
    return 978307200.0;
  v3 = (void *)MEMORY[0x1E0D13A38];
  v4 = a3;
  objc_msgSend(v3, "currentEnvironment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timeProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "timestamp");
  v8 = v7;
  objc_msgSend(v4, "timestamp");
  v10 = v9;

  v11 = v8 - v10;
  return v11;
}

- (NSArray)emergencyTerms
{
  CNACTStewieFacade *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  CNTimestamped *emergencyMemo;
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  v2 = self;
  objc_sync_enter(v2);
  if (-[CNACTStewieFacade withLock_isEmergencyEnabled](v2, "withLock_isEmergencyEnabled"))
  {
    if (objc_msgSend((id)objc_opt_class(), "isMemoValid:", v2->_emergencyMemo))
    {
      -[CNTimestamped value](v2->_emergencyMemo, "value");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend((id)objc_opt_class(), "localizedEmergencyPhrases");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNACTStewieFacade numbers](v2, "numbers");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v16[0] = v4;
      v16[1] = v5;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 2);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "_cn_flatten");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "_cn_distinctObjects");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      contactSearchLog();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        -[CNACTStewieFacade emergencyTerms].cold.1();

      v10 = (void *)MEMORY[0x1E0D13BC0];
      objc_msgSend(MEMORY[0x1E0D13A38], "currentEnvironment");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "timeProvider");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "timestamp");
      objc_msgSend(v10, "timestampedWithValue:timestamp:", v8);
      v13 = objc_claimAutoreleasedReturnValue();
      emergencyMemo = v2->_emergencyMemo;
      v2->_emergencyMemo = (CNTimestamped *)v13;

      -[CNTimestamped value](v2->_emergencyMemo, "value");
      v3 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v3 = (void *)MEMORY[0x1E0C9AA60];
  }
  objc_sync_exit(v2);

  return (NSArray *)v3;
}

- (BOOL)isEmergencyEnabled
{
  CNACTStewieFacade *v2;
  BOOL v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = -[CNACTStewieFacade withLock_isEmergencyEnabled](v2, "withLock_isEmergencyEnabled");
  objc_sync_exit(v2);

  return v3;
}

- (BOOL)withLock_isEmergencyEnabled
{
  int v3;
  void *v4;
  char v5;

  v3 = objc_msgSend((id)objc_opt_class(), "isMessagesApp");
  if (v3)
  {
    -[CTStewieStateMonitor getState](self->_stateMonitor, "getState");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isAllowedService:", 1);

    LOBYTE(v3) = v5;
  }
  return v3;
}

- (NSArray)avocetTerms
{
  CNACTStewieFacade *v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  CNTimestamped *avocetMemo;

  v2 = self;
  objc_sync_enter(v2);
  if (-[CNACTStewieFacade withLock_isAvocetEnabled](v2, "withLock_isAvocetEnabled"))
  {
    if (objc_msgSend((id)objc_opt_class(), "isMemoValid:", v2->_avocetMemo))
    {
      -[CNTimestamped value](v2->_avocetMemo, "value");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend((id)objc_opt_class(), "localizedAvocetPhrases");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "_cn_distinctObjects");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      contactSearchLog();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
        -[CNACTStewieFacade avocetTerms].cold.1();

      v7 = (void *)MEMORY[0x1E0D13BC0];
      objc_msgSend(MEMORY[0x1E0D13A38], "currentEnvironment");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "timeProvider");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "timestamp");
      objc_msgSend(v7, "timestampedWithValue:timestamp:", v5);
      v10 = objc_claimAutoreleasedReturnValue();
      avocetMemo = v2->_avocetMemo;
      v2->_avocetMemo = (CNTimestamped *)v10;

      -[CNTimestamped value](v2->_avocetMemo, "value");
      v3 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v3 = (void *)MEMORY[0x1E0C9AA60];
  }
  objc_sync_exit(v2);

  return (NSArray *)v3;
}

- (BOOL)isAvocetEnabled
{
  CNACTStewieFacade *v2;
  BOOL v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = -[CNACTStewieFacade withLock_isAvocetEnabled](v2, "withLock_isAvocetEnabled");
  objc_sync_exit(v2);

  return v3;
}

- (BOOL)withLock_isAvocetEnabled
{
  int v3;
  void *v4;
  char v5;

  v3 = objc_msgSend((id)objc_opt_class(), "isMessagesApp");
  if (v3)
  {
    -[CTStewieStateMonitor getState](self->_stateMonitor, "getState");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isAllowedService:", 8);

    LOBYTE(v3) = v5;
  }
  return v3;
}

+ (BOOL)isMessagesApp
{
  void *v2;
  void *v3;
  char v4;

  objc_msgSend(MEMORY[0x1E0D13A38], "currentEnvironment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "mainBundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0C965D8]);

  return v4;
}

+ (id)localizedEmergencyPhrases
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0D13A38], "currentEnvironment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizationServices");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:bundleForClass:comment:", CFSTR("STEWIE_SEARCH_PHRASES"), &stru_1E70E0E70, CFSTR("Localized-Stewie"), objc_opt_class(), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "componentsSeparatedByString:", CFSTR("|"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)localizedAvocetPhrases
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0D13A38], "currentEnvironment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizationServices");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:bundleForClass:comment:", CFSTR("AVOCET_SEARCH_PHRASES"), &stru_1E70E0E70, CFSTR("Localized-Avocet"), objc_opt_class(), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "componentsSeparatedByString:", CFSTR("|"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)numbers
{
  CoreTelephonyClient *coreTelephonyClient;
  void *v3;
  id v4;
  id v5;
  void *v6;
  NSObject *v7;
  id v9;

  coreTelephonyClient = self->_coreTelephonyClient;
  v9 = 0;
  -[CoreTelephonyClient getAllEmergencyNumbersWithError:](coreTelephonyClient, "getAllEmergencyNumbersWithError:", &v9);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v9;
  v5 = v3;
  v6 = v5;
  if (!v5)
  {
    contactSearchLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      -[CNACTStewieFacade numbers].cold.1();

    v6 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v6;
}

- (void)stateChanged:(id)a3
{
  id v4;
  CNACTStewieFacade *v5;
  NSObject *v6;
  CNTimestamped *emergencyMemo;
  CNTimestamped *avocetMemo;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  contactSearchLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[CNACTStewieFacade stateChanged:].cold.1();

  emergencyMemo = v5->_emergencyMemo;
  v5->_emergencyMemo = 0;

  avocetMemo = v5->_avocetMemo;
  v5->_avocetMemo = 0;

  objc_sync_exit(v5);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_avocetMemo, 0);
  objc_storeStrong((id *)&self->_emergencyMemo, 0);
  objc_storeStrong((id *)&self->_stateMonitor, 0);
  objc_storeStrong((id *)&self->_coreTelephonyClient, 0);
}

- (void)initWithCoreTelephonyClient:(os_log_t)log stateMonitor:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1B9950000, log, OS_LOG_TYPE_FAULT, "parameter ‘monitor’ must be nonnull", v1, 2u);
  OUTLINED_FUNCTION_4();
}

- (void)emergencyTerms
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_1B9950000, v0, v1, "Stewie terms: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)avocetTerms
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_1B9950000, v0, v1, "Avocet terms: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)numbers
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_1B9950000, v0, v1, "Failed to fetch Stewie numbers %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)stateChanged:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_1B9950000, v0, v1, "Clearing cached state because state changed: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

@end
