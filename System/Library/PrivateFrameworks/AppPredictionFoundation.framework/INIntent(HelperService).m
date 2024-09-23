@implementation INIntent(HelperService)

- (uint64_t)atx_titleLengthWithoutLocalizing
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "atx_titleWithoutLocalizing");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "length");

  return v2;
}

- (__CFString)atx_titleWithoutLocalizing
{
  uint64_t v2;
  void *v3;
  __CFString *v4;
  __CFString *v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  _QWORD v10[6];
  _QWORD v11[6];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  __CFString *v17;

  if (shouldDenyConnectionForCurrentProcess())
  {
    objc_msgSend(a1, "_titleWithLocalizer:fromBundleURL:", 0, 0);
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = (void *)v2;
    v4 = &stru_1E82C0108;
    if (v2)
      v4 = (__CFString *)v2;
    v5 = v4;
  }
  else
  {
    prepareXPCConnection();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 0;
    v13 = &v12;
    v14 = 0x3032000000;
    v15 = __Block_byref_object_copy_;
    v16 = __Block_byref_object_dispose_;
    v17 = &stru_1E82C0108;
    v6 = MEMORY[0x1E0C809B0];
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __53__INIntent_HelperService__atx_titleWithoutLocalizing__block_invoke;
    v11[3] = &unk_1E82BF5B8;
    v11[4] = a1;
    v11[5] = &v12;
    objc_msgSend(v3, "synchronousRemoteObjectProxyWithErrorHandler:", v11);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = v6;
    v10[1] = 3221225472;
    v10[2] = __53__INIntent_HelperService__atx_titleWithoutLocalizing__block_invoke_6;
    v10[3] = &unk_1E82BF5E0;
    v10[4] = a1;
    v10[5] = &v12;
    objc_msgSend(v7, "titleForIntentNoLocalization:withReply:", a1, v10);

    objc_msgSend(v3, "invalidate");
    __atxlog_handle_intents_helper();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      -[INIntent(HelperService) atx_titleWithoutLocalizing].cold.1();

    v5 = (__CFString *)(id)v13[5];
    _Block_object_dispose(&v12, 8);

  }
  return v5;
}

- (id)atx_titleWithEfficientLocalization
{
  id v2;
  void *v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  _QWORD v8[6];
  _QWORD v9[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  __CFString *v15;

  if (shouldDenyConnectionForCurrentProcess())
  {
    objc_msgSend(a1, "_title");
    v2 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    prepareXPCConnection();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 0;
    v11 = &v10;
    v12 = 0x3032000000;
    v13 = __Block_byref_object_copy_;
    v14 = __Block_byref_object_dispose_;
    v15 = &stru_1E82C0108;
    v4 = MEMORY[0x1E0C809B0];
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __61__INIntent_HelperService__atx_titleWithEfficientLocalization__block_invoke;
    v9[3] = &unk_1E82BF5B8;
    v9[4] = a1;
    v9[5] = &v10;
    objc_msgSend(v3, "synchronousRemoteObjectProxyWithErrorHandler:", v9);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = v4;
    v8[1] = 3221225472;
    v8[2] = __61__INIntent_HelperService__atx_titleWithEfficientLocalization__block_invoke_8;
    v8[3] = &unk_1E82BF5E0;
    v8[4] = a1;
    v8[5] = &v10;
    objc_msgSend(v5, "titleForIntent:withReply:", a1, v8);

    objc_msgSend(v3, "invalidate");
    __atxlog_handle_intents_helper();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      -[INIntent(HelperService) atx_titleWithEfficientLocalization].cold.1();

    v2 = (id)v11[5];
    _Block_object_dispose(&v10, 8);

  }
  return v2;
}

- (id)atx_subtitleWithEfficientLocalization
{
  id v2;
  void *v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  _QWORD v8[6];
  _QWORD v9[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  __CFString *v15;

  if (shouldDenyConnectionForCurrentProcess())
  {
    objc_msgSend(a1, "_subtitle");
    v2 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    prepareXPCConnection();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 0;
    v11 = &v10;
    v12 = 0x3032000000;
    v13 = __Block_byref_object_copy_;
    v14 = __Block_byref_object_dispose_;
    v15 = &stru_1E82C0108;
    v4 = MEMORY[0x1E0C809B0];
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __64__INIntent_HelperService__atx_subtitleWithEfficientLocalization__block_invoke;
    v9[3] = &unk_1E82BF5B8;
    v9[4] = a1;
    v9[5] = &v10;
    objc_msgSend(v3, "synchronousRemoteObjectProxyWithErrorHandler:", v9);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = v4;
    v8[1] = 3221225472;
    v8[2] = __64__INIntent_HelperService__atx_subtitleWithEfficientLocalization__block_invoke_9;
    v8[3] = &unk_1E82BF5E0;
    v8[4] = a1;
    v8[5] = &v10;
    objc_msgSend(v5, "subtitleForIntent:withReply:", a1, v8);

    objc_msgSend(v3, "invalidate");
    __atxlog_handle_intents_helper();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      -[INIntent(HelperService) atx_subtitleWithEfficientLocalization].cold.1();

    v2 = (id)v11[5];
    _Block_object_dispose(&v10, 8);

  }
  return v2;
}

- (uint64_t)atx_indexingHash
{
  void *v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  _QWORD v8[6];
  _QWORD v9[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  if (shouldDenyConnectionForCurrentProcess())
    return objc_msgSend(a1, "_indexingHash");
  prepareXPCConnection();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  v4 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __43__INIntent_HelperService__atx_indexingHash__block_invoke;
  v9[3] = &unk_1E82BF5B8;
  v9[4] = a1;
  v9[5] = &v10;
  objc_msgSend(v3, "synchronousRemoteObjectProxyWithErrorHandler:", v9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v4;
  v8[1] = 3221225472;
  v8[2] = __43__INIntent_HelperService__atx_indexingHash__block_invoke_10;
  v8[3] = &unk_1E82BF608;
  v8[4] = a1;
  v8[5] = &v10;
  objc_msgSend(v5, "indexingHashForIntent:withReply:", a1, v8);

  objc_msgSend(v3, "invalidate");
  __atxlog_handle_intents_helper();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[INIntent(HelperService) atx_indexingHash].cold.1();

  v7 = v11[3];
  _Block_object_dispose(&v10, 8);

  return v7;
}

- (uint64_t)atx_isEligibleForWidgets
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD v14[6];
  _QWORD v15[6];
  uint64_t v16;
  _QWORD v17[2];
  char v18;

  if (shouldDenyConnectionForCurrentProcess())
  {
    objc_msgSend(a1, "_codableDescription");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "isEligibleForWidgets");
  }
  else
  {
    prepareXPCConnection();
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0;
    v17[0] = &v16;
    v17[1] = 0x2020000000;
    v18 = 0;
    v4 = MEMORY[0x1E0C809B0];
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __51__INIntent_HelperService__atx_isEligibleForWidgets__block_invoke;
    v15[3] = &unk_1E82BF5B8;
    v15[4] = a1;
    v15[5] = &v16;
    objc_msgSend(v2, "synchronousRemoteObjectProxyWithErrorHandler:", v15);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v4;
    v14[1] = 3221225472;
    v14[2] = __51__INIntent_HelperService__atx_isEligibleForWidgets__block_invoke_12;
    v14[3] = &unk_1E82BF630;
    v14[4] = a1;
    v14[5] = &v16;
    objc_msgSend(v5, "eligibleForWidgetsForIntent:withReply:", a1, v14);

    objc_msgSend(v2, "invalidate");
    __atxlog_handle_intents_helper();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      -[INIntent(HelperService) atx_isEligibleForWidgets].cold.1((uint64_t)v17, v6, v7, v8, v9, v10, v11, v12);

    v3 = *(unsigned __int8 *)(v17[0] + 24);
    _Block_object_dispose(&v16, 8);
  }

  return v3;
}

- (uint64_t)atx_supportsBackgroundExecution
{
  void *v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD v14[6];
  _QWORD v15[6];
  uint64_t v16;
  _QWORD v17[2];
  char v18;

  if (shouldDenyConnectionForCurrentProcess())
    return objc_msgSend(a1, "_supportsBackgroundExecution");
  prepareXPCConnection();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  v17[0] = &v16;
  v17[1] = 0x2020000000;
  v18 = 0;
  v4 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __58__INIntent_HelperService__atx_supportsBackgroundExecution__block_invoke;
  v15[3] = &unk_1E82BF5B8;
  v15[4] = a1;
  v15[5] = &v16;
  objc_msgSend(v3, "synchronousRemoteObjectProxyWithErrorHandler:", v15);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v4;
  v14[1] = 3221225472;
  v14[2] = __58__INIntent_HelperService__atx_supportsBackgroundExecution__block_invoke_14;
  v14[3] = &unk_1E82BF630;
  v14[4] = a1;
  v14[5] = &v16;
  objc_msgSend(v5, "supportsBackgroundExecutionForIntent:withReply:", a1, v14);

  objc_msgSend(v3, "invalidate");
  __atxlog_handle_intents_helper();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[INIntent(HelperService) atx_supportsBackgroundExecution].cold.1((uint64_t)v17, v6, v7, v8, v9, v10, v11, v12);

  v13 = *(unsigned __int8 *)(v17[0] + 24);
  _Block_object_dispose(&v16, 8);

  return v13;
}

+ (id)atx_createIntentWithIntentType:()HelperService intentData:
{
  id v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  void *v12;
  NSObject *v13;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, void *, void *);
  void *v18;
  id v19;
  id v20;
  uint64_t *v21;
  _QWORD v22[4];
  id v23;
  id v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;

  v5 = a3;
  v6 = a4;
  if (shouldDenyConnectionForCurrentProcess())
  {
    INIntentCreate();
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    prepareXPCConnection();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 0;
    v27 = &v26;
    v28 = 0x3032000000;
    v29 = __Block_byref_object_copy_;
    v30 = __Block_byref_object_dispose_;
    v9 = MEMORY[0x1E0C809B0];
    v31 = 0;
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __69__INIntent_HelperService__atx_createIntentWithIntentType_intentData___block_invoke;
    v22[3] = &unk_1E82BF658;
    v25 = &v26;
    v10 = v5;
    v23 = v10;
    v11 = v6;
    v24 = v11;
    objc_msgSend(v8, "synchronousRemoteObjectProxyWithErrorHandler:", v22);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v9;
    v16 = 3221225472;
    v17 = __69__INIntent_HelperService__atx_createIntentWithIntentType_intentData___block_invoke_15;
    v18 = &unk_1E82BF680;
    v21 = &v26;
    v19 = v10;
    v20 = v11;
    objc_msgSend(v12, "createIntentWithIntentType:intentData:withReply:", v19, v20, &v15);

    objc_msgSend(v8, "invalidate", v15, v16, v17, v18);
    __atxlog_handle_intents_helper();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      +[INIntent(HelperService) atx_createIntentWithIntentType:intentData:].cold.1();

    v7 = (id)v27[5];
    _Block_object_dispose(&v26, 8);

  }
  return v7;
}

+ (id)atx_createEventIntentWithStartDate:()HelperService endDate:
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v5 = a3;
  v6 = a4;
  if ((shouldDenyConnectionForCurrentProcess() & 1) != 0)
  {
    v7 = 0;
  }
  else
  {
    prepareXPCConnection();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 0;
    v14 = &v13;
    v15 = 0x3032000000;
    v16 = __Block_byref_object_copy_;
    v17 = __Block_byref_object_dispose_;
    v18 = 0;
    objc_msgSend(v8, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __70__INIntent_HelperService__atx_createEventIntentWithStartDate_endDate___block_invoke_17;
    v12[3] = &unk_1E82BF6C8;
    v12[4] = &v13;
    objc_msgSend(v9, "createEventIntentWithStartDate:endDate:withReply:", v5, v6, v12);

    objc_msgSend(v8, "invalidate");
    __atxlog_handle_intents_helper();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      +[INIntent(HelperService) atx_createEventIntentWithStartDate:endDate:].cold.1();

    v7 = (id)v14[5];
    _Block_object_dispose(&v13, 8);

  }
  return v7;
}

- (void)atx_titleWithoutLocalizing
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_2_1(&dword_1C99CA000, v0, v1, "atx_titleWithoutLocalizing returning: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_10();
}

- (void)atx_titleWithEfficientLocalization
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_2_1(&dword_1C99CA000, v0, v1, "atx_titleWithEfficientLocalization returning: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_10();
}

- (void)atx_subtitleWithEfficientLocalization
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_2_1(&dword_1C99CA000, v0, v1, "atx_subtitleWithEfficientLocalization returning: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_10();
}

- (void)atx_indexingHash
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_2_1(&dword_1C99CA000, v0, v1, "atx_indexingHash returning: %lld", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_10();
}

- (void)atx_isEligibleForWidgets
{
  OUTLINED_FUNCTION_7_0(&dword_1C99CA000, a2, a3, "atx_isEligibleForWidgets returning: %u", a5, a6, a7, a8, 0);
}

- (void)atx_supportsBackgroundExecution
{
  OUTLINED_FUNCTION_7_0(&dword_1C99CA000, a2, a3, "atx_supportsBackgroundExecution returning: %u", a5, a6, a7, a8, 0);
}

+ (void)atx_createIntentWithIntentType:()HelperService intentData:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_2_1(&dword_1C99CA000, v0, v1, "createdIntentWithIntentType returning: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_10();
}

+ (void)atx_createEventIntentWithStartDate:()HelperService endDate:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_2_1(&dword_1C99CA000, v0, v1, "createEventIntentWithCurrentDate returning: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_10();
}

@end
