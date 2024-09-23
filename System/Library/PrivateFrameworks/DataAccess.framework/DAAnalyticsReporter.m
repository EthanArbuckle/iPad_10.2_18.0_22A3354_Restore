@implementation DAAnalyticsReporter

+ (void)startDailyAnalyticsReporter
{
  NSObject *v3;
  os_log_type_t v4;
  void *v5;
  _QWORD handler[5];
  uint8_t buf[16];

  DALoggingwithCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_BYTE *)(MEMORY[0x1E0D1C448] + 6);
  if (os_log_type_enabled(v3, v4))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B51E4000, v3, v4, "starting daily Analytics reporter", buf, 2u);
  }

  v5 = (void *)*MEMORY[0x1E0C80748];
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __50__DAAnalyticsReporter_startDailyAnalyticsReporter__block_invoke;
  handler[3] = &__block_descriptor_40_e33_v16__0__NSObject_OS_xpc_object__8l;
  handler[4] = a1;
  xpc_activity_register("com.apple.dataaccess.dataaccessd.dailyAnalytics", v5, handler);
}

void __50__DAAnalyticsReporter_startDailyAnalyticsReporter__block_invoke(uint64_t a1, void *a2)
{
  _xpc_activity_s *v3;
  xpc_activity_state_t state;
  NSObject *v5;
  xpc_object_t v6;
  NSObject *v7;
  os_log_type_t v8;
  _QWORD block[5];
  uint8_t buf[16];

  v3 = a2;
  state = xpc_activity_get_state(v3);
  if (state == 2)
  {
    dataaccess_get_global_queue();
    v5 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __50__DAAnalyticsReporter_startDailyAnalyticsReporter__block_invoke_1;
    block[3] = &__block_descriptor_40_e5_v8__0l;
    block[4] = *(_QWORD *)(a1 + 32);
    dispatch_async(v5, block);
LABEL_10:

    goto LABEL_11;
  }
  if (!state)
  {
    v5 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_BOOL(v5, (const char *)*MEMORY[0x1E0C80898], 1);
    xpc_dictionary_set_int64(v5, (const char *)*MEMORY[0x1E0C80760], *MEMORY[0x1E0C807B8]);
    xpc_dictionary_set_int64(v5, (const char *)*MEMORY[0x1E0C80790], *MEMORY[0x1E0C807C0]);
    v6 = xpc_activity_copy_criteria(v3);
    if (!v6 || !xpc_equal(v5, v6))
    {
      DALoggingwithCategory();
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = *(_BYTE *)(MEMORY[0x1E0D1C448] + 6);
      if (os_log_type_enabled(v7, v8))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B51E4000, v7, v8, "Updating criteria for daily Analytics xpc activity.", buf, 2u);
      }

      xpc_activity_set_criteria(v3, v5);
    }

    goto LABEL_10;
  }
LABEL_11:

}

uint64_t __50__DAAnalyticsReporter_startDailyAnalyticsReporter__block_invoke_1(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "reportActiveExchangeOAuthAccountsCount");
}

+ (void)endDailyAnalyticsReporter
{
  NSObject *v2;
  os_log_type_t v3;
  uint8_t v4[16];

  xpc_activity_unregister("com.apple.dataaccess.dataaccessd.dailyAnalytics");
  DALoggingwithCategory();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_BYTE *)(MEMORY[0x1E0D1C448] + 6);
  if (os_log_type_enabled(v2, v3))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1B51E4000, v2, v3, "unregistering daily Analytics reporter", v4, 2u);
  }

}

+ (void)reportActiveExchangeOAuthAccountsCount
{
  NSObject *v2;
  os_log_type_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t buf[16];
  const __CFString *v21;
  void *v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  DALoggingwithCategory();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_BYTE *)(MEMORY[0x1E0D1C448] + 6);
  if (os_log_type_enabled(v2, v3))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B51E4000, v2, v3, "Reporting Exchange OAuth accounts count", buf, 2u);
  }

  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "accountTypeWithAccountTypeIdentifier:", *MEMORY[0x1E0C8F080]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v4, "accountsWithAccountType:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v23, 16);
    if (v7)
    {
      v8 = v7;
      v9 = 0;
      v10 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v17 != v10)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * i), "objectForKeyedSubscript:", CFSTR("DAExchangeOAuthSupportedKey"));
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          if (v12)
            ++v9;
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v23, 16);
      }
      while (v8);
    }
    else
    {
      v9 = 0;
    }
    v21 = CFSTR("count");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v13;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    AnalyticsSendEvent();

    DALoggingwithCategory();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, v3))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B51E4000, v15, v3, "Reported Exchange OAuth accounts count", buf, 2u);
    }

  }
}

@end
