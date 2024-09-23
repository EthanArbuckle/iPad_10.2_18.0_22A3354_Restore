@implementation AAFAnalyticsEvent(AuthKit)

+ (id)ak_analyticsEventWithEventName:()AuthKit error:
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a4;
  v7 = a3;
  +[AKAccountManager sharedInstance](AKAccountManager, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "primaryAuthKitAccount");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "ak_analyticsEventWithEventName:account:error:", v7, v9, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)ak_analyticsEventWithEventName:()AuthKit account:error:
{
  objc_class *v7;
  id v8;
  id v9;
  id v10;
  void *v11;

  v7 = (objc_class *)MEMORY[0x1E0CF0E68];
  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_msgSend([v7 alloc], "initWithEventName:eventCategory:initData:", v10, 0x1E2E9A280, 0);

  objc_msgSend(v11, "populateUnderlyingErrorsStartingWithRootError:", v8);
  objc_msgSend(v11, "ak_updateTelemetryIdWithAccount:", v9);

  return v11;
}

- (void)ak_updateTelemetryIdWithAccount:()AuthKit
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;

  v4 = a3;
  if (v4)
  {
    +[AKAccountManager sharedInstance](AKAccountManager, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "telemetryDeviceSessionIDForAccount:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "setObject:forKeyedSubscript:", v6, *MEMORY[0x1E0CF0ED8]);

  }
  else
  {
    _AKLogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      -[AAFAnalyticsEvent(AuthKit) ak_updateTelemetryIdWithAccount:].cold.1(v7);

  }
}

- (void)ak_updateWithAuthenticationResults:()AuthKit authContext:error:
{
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;

  v8 = a5;
  v18 = 0;
  v9 = a4;
  objc_msgSend(v9, "authKitAccount:", &v18);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v18;
  v12 = v11;
  if (!v10 || v11)
  {
    _AKLogSystem();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      -[AAFAnalyticsEvent(AuthKit) ak_updateWithAuthenticationResults:authContext:error:].cold.1((uint64_t)v8, v13);

  }
  objc_msgSend(a1, "ak_updateTelemetryIdWithAccount:", v10);
  objc_msgSend(v9, "telemetryFlowID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "setObject:forKeyedSubscript:", v14, *MEMORY[0x1E0CF0EF0]);
  v15 = *MEMORY[0x1E0CF0EE0];
  if (a3)
  {
    objc_msgSend(a1, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], v15);
  }
  else
  {
    objc_msgSend(a1, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], v15);
    objc_msgSend(a1, "populateUnderlyingErrorsStartingWithRootError:", v8);
  }
  +[AKAccountManager sharedInstance](AKAccountManager, "sharedInstance");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v16, "securityLevelForAccount:", v10));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setObject:forKeyedSubscript:", v17, CFSTR("securityLevel"));

}

- (void)ak_updateTelemetryIdWithAccount:()AuthKit .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_19202F000, log, OS_LOG_TYPE_DEBUG, "Not updating analytics event with nil account", v1, 2u);
}

- (void)ak_updateWithAuthenticationResults:()AuthKit authContext:error:.cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_fault_impl(&dword_19202F000, a2, OS_LOG_TYPE_FAULT, "Error getting account from context during auth for telemetry: %@", (uint8_t *)&v2, 0xCu);
}

@end
