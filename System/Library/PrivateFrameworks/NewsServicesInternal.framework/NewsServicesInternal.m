id NSSNTPBAnalyticsOsVersionValue()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "systemVersion");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

void NSSDestroyUserDefaultsDataWithItems(void *a1)
{
  id v1;

  v1 = a1;
  if (!v1 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    NSSDestroyUserDefaultsDataWithItems_cold_1();
  objc_msgSend(v1, "enumerateObjectsUsingBlock:", &__block_literal_global);

}

id NSSDestroyDataContainersWithItems(void *a1)
{
  id v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  if (!v1 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    NSSDestroyDataContainersWithItems_cold_1();
  v2 = (void *)objc_opt_new();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v3 = v1;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        v9 = objc_msgSend(v8, "identifier");
        objc_msgSend(v8, "containerClass");
        container_create_or_lookup_for_current_user();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", container_delete_all_container_content() == 1);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "setObject:forKeyedSubscript:", v10, v11);

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v5);
  }

  return v2;
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, int a3, const char *a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint8_t buf)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &buf, 0x26u);
}

void sub_1D711B3B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  uint64_t v17;
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v17 - 128), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{

}

void OUTLINED_FUNCTION_2_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x26u);
}

id NSSNewsWidgetMessageForStaticNewsSection()
{
  void *v0;
  void *v1;

  NSSBundleInternal();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "localizedStringForKey:value:table:", CFSTR("Editors’ Picks"), &stru_1E9BDD2E8, 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

id NSSNewsWidgetMessageForStaticNewsHeadlineTitle()
{
  void *v0;
  void *v1;

  NSSBundleInternal();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "localizedStringForKey:value:table:", CFSTR("New Planets Found"), &stru_1E9BDD2E8, 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

id NSSNewsTagWidgetPlaceholderName()
{
  void *v0;
  void *v1;

  NSSBundleInternal();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "localizedStringForKey:value:table:", CFSTR("Topic"), &stru_1E9BDD2E8, 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

id NSSNewsWidgetIntentsTopHitHeaderName()
{
  void *v0;
  void *v1;

  NSSBundleInternal();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "localizedStringForKey:value:table:", CFSTR("Top Hit"), &stru_1E9BDD2E8, 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

id NSSNewsWidgetIntentsTopicsHeaderName()
{
  void *v0;
  void *v1;

  NSSBundleInternal();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "localizedStringForKey:value:table:", CFSTR("Topics"), &stru_1E9BDD2E8, 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

id NSSNewsWidgetIntentsFollowingHeaderName()
{
  void *v0;
  void *v1;

  NSSBundleInternal();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "localizedStringForKey:value:table:", CFSTR("Following"), &stru_1E9BDD2E8, 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

id NSSNewsWidgetIntentsSuggestedByNewsHeaderName()
{
  void *v0;
  void *v1;

  NSSBundleInternal();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "localizedStringForKey:value:table:", CFSTR("Suggested"), &stru_1E9BDD2E8, 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

id NSSNewsWidgetIntentsSuggestedBySiriHeaderName()
{
  void *v0;
  void *v1;

  NSSBundleInternal();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "localizedStringForKey:value:table:", CFSTR("Suggested by Siri"), &stru_1E9BDD2E8, 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

id NSSNewsAnalyticsPBEventAccumulatorLog()
{
  if (NSSNewsAnalyticsPBEventAccumulatorLog_once != -1)
    dispatch_once(&NSSNewsAnalyticsPBEventAccumulatorLog_once, &__block_literal_global_0);
  return (id)NSSNewsAnalyticsPBEventAccumulatorLog_result;
}

id NSSNTPBAnalyticsUUIDData()
{
  void *v0;
  void *v1;
  void *v2;

  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "UUIDString");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  FCUUIDStringToUUIDBytes();
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

id NSSNTPBAnalyticsAppBuildNumberValue()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  NewsCoreUserDefaults();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "objectForKey:", *MEMORY[0x1E0D583D8]);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v1, "length"))
  {
    objc_msgSend(CFSTR("999"), "stringByAppendingString:", v1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForInfoDictionaryKey:", CFSTR("CFBundleVersion"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringValue");
    v2 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v2;
}

id NSSNTPBAnalyticsAppVersionValue()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "objectForInfoDictionaryKey:", CFSTR("CFBundleShortVersionString"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

uint64_t NSSNTPBAnalyticsContentEnvironmentValue()
{
  unint64_t EndpointEnvironment;

  EndpointEnvironment = FCDefaultsReadEndpointEnvironment();
  if (EndpointEnvironment > 9)
    return 1;
  else
    return dword_1D7123720[EndpointEnvironment];
}

uint64_t NSSNTPBAnalyticsCellularRadioAccessTechnologyValue()
{
  void *v0;
  uint64_t v1;

  objc_msgSend(MEMORY[0x1E0D58CD0], "sharedNetworkReachability");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "cellularRadioAccessTechnology");

  return v1;
}

id NSSNTPBAnalyticsCountryCodeValue()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "objectForKey:", *MEMORY[0x1E0C997B0]);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

id NSSNTPBAnalyticsDevicePlatformValue()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "systemName");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

id NSSNTPBAnalyticsLanguageCodeValue()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0D58928], "sharedAccount");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "primaryLanguageCode");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

uint64_t NSSNTPBAnalyticsOsInstallVariantValue()
{
  if (NFInternalBuild())
    return 1;
  else
    return 2;
}

uint64_t NSSNTPBAnalyticsReachabilityStatusValue()
{
  void *v0;
  uint64_t v1;

  objc_msgSend(MEMORY[0x1E0D58CD0], "sharedNetworkReachability");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "reachabilityStatus");

  return v1;
}

uint64_t NSSNTPBAnalyticsUtcOffsetValue()
{
  void *v0;
  uint64_t v1;

  objc_msgSend(MEMORY[0x1E0C99E80], "localTimeZone");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "secondsFromGMT");

  return v1;
}

uint64_t NSSNTPBAnalyticsPrivateDataSyncOnValue()
{
  void *v0;
  uint64_t v1;

  objc_msgSend(MEMORY[0x1E0D58928], "sharedAccount");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "isPrivateDataSyncingEnabled");

  return v1;
}

uint64_t NSSNTPBAnalyticsSignedIntoIcloudValue()
{
  void *v0;
  uint64_t v1;

  objc_msgSend(MEMORY[0x1E0D58928], "sharedAccount");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "isUserSignedInToiCloud");

  return v1;
}

id NSSNTPBAnalyticsUserStorefrontIdValue()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0D58928], "sharedAccount");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "contentStoreFrontID");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

id NSSBundleInternal()
{
  if (NSSBundleInternal_onceToken != -1)
    dispatch_once(&NSSBundleInternal_onceToken, &__block_literal_global_1);
  return (id)NSSBundleInternal_sNSSBundle;
}

void NSSTerminateNewsWithCompletion(void *a1)
{
  void *v1;
  id v2;

  v2 = a1;
  SFKillProcessNamed();
  SFKillProcessNamed();
  v1 = v2;
  if (v2)
  {
    (*((void (**)(id, uint64_t, void *))v2 + 2))(v2, 1, &__block_literal_global_2);
    v1 = v2;
  }

}

void NSSTerminateAppsAndAllPluginsWithBundleIDs(void *a1, void *a2)
{
  id v3;
  void (**v4)(id, id, uint64_t);
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;

  v3 = a1;
  v4 = a2;
  if (!v3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    NSSTerminateAppsAndAllPluginsWithBundleIDs_cold_1();
  v5 = (void *)objc_opt_new();
  v6 = (void *)objc_opt_new();
  v7 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __NSSTerminateAppsAndAllPluginsWithBundleIDs_block_invoke;
  v15[3] = &unk_1E9BDCD80;
  v8 = v5;
  v16 = v8;
  v9 = v6;
  v17 = v9;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v15);
  v13[0] = v7;
  v13[1] = 3221225472;
  v13[2] = __NSSTerminateAppsAndAllPluginsWithBundleIDs_block_invoke_3;
  v13[3] = &unk_1E9BDCDA8;
  v14 = v9;
  v10 = v9;
  v11 = MEMORY[0x1D8292448](v13);
  v12 = (void *)v11;
  if (v4)
    v4[2](v4, v8, v11);
  else
    (*(void (**)(uint64_t))(v11 + 16))(v11);

}

void NSSTerminateNewsd(void *a1)
{
  void (**v1)(id, uint64_t, void *);

  v1 = a1;
  if (!v1 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    NSSTerminateNewsd_cold_1();
  SFKillProcessNamed();
  v1[2](v1, 1, &__block_literal_global_43);

}

void NSSTerminateNewsProcessesWithItems(void *a1, void *a2)
{
  id v3;
  void (**v4)(id, _QWORD, uint64_t);
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  _QWORD v11[6];
  _QWORD v12[6];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  char v22;

  v3 = a1;
  v4 = a2;
  if (!v3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    NSSTerminateNewsProcessesWithItems_cold_1();
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 1;
  objc_msgSend(v3, "fc_dictionaryOfSortedObjectsWithKeyBlock:", &__block_literal_global_46);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", &unk_1E9BE0CC8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fc_setByTransformingWithBlock:", &__block_literal_global_49);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__0;
  v17 = __Block_byref_object_dispose__0;
  v18 = &__block_literal_global_51;
  v8 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __NSSTerminateNewsProcessesWithItems_block_invoke_2;
  v12[3] = &unk_1E9BDCE70;
  v12[4] = &v13;
  v12[5] = &v19;
  NSSTerminateAppsAndAllPluginsWithBundleIDs(v7, v12);
  objc_msgSend(v5, "objectForKeyedSubscript:", &unk_1E9BE0CE0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  if (v10)
  {
    v11[0] = v8;
    v11[1] = 3221225472;
    v11[2] = __NSSTerminateNewsProcessesWithItems_block_invoke_54;
    v11[3] = &unk_1E9BDCE98;
    v11[4] = &v13;
    v11[5] = &v19;
    NSSTerminateNewsd(v11);
  }
  if (v4)
    v4[2](v4, *((unsigned __int8 *)v20 + 24), v14[5]);
  else
    (*(void (**)(void))(v14[5] + 16))();
  _Block_object_dispose(&v13, 8);

  _Block_object_dispose(&v19, 8);
}

void sub_1D711F8E4(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 112), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__0(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = MEMORY[0x1D8292448](*(_QWORD *)(a2 + 40));
  *(_QWORD *)(a1 + 40) = result;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{

}

void sub_1D711FE8C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D7120020(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t NTPBExternalAnalyticsEventTypeFromExternalEventURLQueryParameter(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("articleView")) & 1) != 0)
  {
    v2 = 2;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("streamView")) & 1) != 0)
  {
    v2 = 5;
  }
  else if (objc_msgSend(v1, "isEqualToString:", CFSTR("widgetView")))
  {
    v2 = 6;
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

void NSSDestroyUserDefaultsDataWithItems_cold_1()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D7116000, MEMORY[0x1E0C81028], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"items", v6, 2u);

  OUTLINED_FUNCTION_2();
}

void NSSDestroyDataContainersWithItems_cold_1()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D7116000, MEMORY[0x1E0C81028], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"items", v6, 2u);

  OUTLINED_FUNCTION_2();
}

void NSSTerminateAppsAndAllPluginsWithBundleIDs_cold_1()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D7116000, MEMORY[0x1E0C81028], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"bundleIDs", v6, 2u);

  OUTLINED_FUNCTION_2();
}

void NSSTerminateNewsd_cold_1()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D7116000, MEMORY[0x1E0C81028], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"completion", v6, 2u);

  OUTLINED_FUNCTION_2();
}

void NSSTerminateNewsProcessesWithItems_cold_1()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D7116000, MEMORY[0x1E0C81028], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"items", v6, 2u);

  OUTLINED_FUNCTION_2();
}

CFDictionaryRef CFNetworkCopySystemProxySettings(void)
{
  return (CFDictionaryRef)MEMORY[0x1E0C928C8]();
}

CGFloat CGRectGetHeight(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D580]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5A8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5B0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5D0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGRect CGRectIntegral(CGRect rect)
{
  double v1;
  double v2;
  double v3;
  double v4;
  CGRect result;

  MEMORY[0x1E0C9D5F0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.height = v4;
  result.size.width = v3;
  result.origin.y = v2;
  result.origin.x = v1;
  return result;
}

uint64_t FCBlockConjunction()
{
  return MEMORY[0x1E0D582C8]();
}

uint64_t FCDefaultsReadEndpointEnvironment()
{
  return MEMORY[0x1E0D583F8]();
}

uint64_t FCUUIDStringToUUIDBytes()
{
  return MEMORY[0x1E0D58868]();
}

uint64_t NFDevicePlatform()
{
  return MEMORY[0x1E0D60AA0]();
}

uint64_t NFInternalBuild()
{
  return MEMORY[0x1E0D60AB0]();
}

uint64_t NewsCoreUserDefaults()
{
  return MEMORY[0x1E0D588F0]();
}

uint64_t SFKillProcessNamed()
{
  return MEMORY[0x1E0D8D670]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81038](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t container_create_or_lookup_for_current_user()
{
  return MEMORY[0x1E0C82810]();
}

uint64_t container_delete_all_container_content()
{
  return MEMORY[0x1E0C82848]();
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C00](queue, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1E0C82D00](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1E0DE7BA8](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1E0DE7BB8]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7BD0](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7BE8](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1E0DE7BF8]();
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x1E0DE7C38](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x1E0DE7C60](location);
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x1E0DE7C90](obj);
}

void objc_exception_throw(id exception)
{
  MEMORY[0x1E0DE7CA0](exception);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1E0DE7CE0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1E0DE7D08](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D30](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1E0DE7D38]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1E0DE7D40]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1E0DE7D48]();
}

void objc_release(id a1)
{
  MEMORY[0x1E0DE7D78](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1E0DE7E50](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E60](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1E0DE7E70](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7FA0](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x1E0DE7FB0](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1E0DE7FB8](location, obj);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1E0C84728](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

