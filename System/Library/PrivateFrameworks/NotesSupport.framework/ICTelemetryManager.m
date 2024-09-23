@implementation ICTelemetryManager

+ (id)sharedManager
{
  if (sharedManager_onceToken != -1)
    dispatch_once(&sharedManager_onceToken, &__block_literal_global_20);
  return (id)sharedManager_manager;
}

void __35__ICTelemetryManager_sharedManager__block_invoke()
{
  ICTelemetryManager *v0;
  void *v1;

  v0 = objc_alloc_init(ICTelemetryManager);
  v1 = (void *)sharedManager_manager;
  sharedManager_manager = (uint64_t)v0;

}

+ (id)telemetryTuples
{
  if (telemetryTuples_onceToken != -1)
    dispatch_once(&telemetryTuples_onceToken, &__block_literal_global_8_0);
  return (id)telemetryTuples_tuples;
}

void __37__ICTelemetryManager_telemetryTuples__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[4];
  _QWORD v3[5];

  v3[4] = *MEMORY[0x1E0C80C00];
  v2[0] = &unk_1EA8322C8;
  v2[1] = &unk_1EA832310;
  v3[0] = &unk_1EA832540;
  v3[1] = &unk_1EA832558;
  v2[2] = &unk_1EA832328;
  v2[3] = &unk_1EA832358;
  v3[2] = &unk_1EA832570;
  v3[3] = &unk_1EA832588;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 4);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)telemetryTuples_tuples;
  telemetryTuples_tuples = v0;

}

- (void)postOneTimeTelemetryEvent:(unint64_t)a3 serviceName:(id)a4 payload:(id)a5 token:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  id v24;
  __int16 v25;
  unint64_t v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v11 = a5;
  v12 = a6;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringArrayForKey:", CFSTR("ICRTCTelemetryServiceOneTimeEventTokens"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v14, "containsObject:", v12))
  {
    objc_msgSend((id)objc_opt_class(), "telemetryTuples");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectForKeyedSubscript:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = os_log_create("com.apple.notes", "Telemetry");
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v17, "objectAtIndexedSubscript:", 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "objectAtIndexedSubscript:", 1);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 138413314;
      v24 = v10;
      v25 = 2048;
      v26 = a3;
      v27 = 2112;
      v28 = v21;
      v29 = 2112;
      v30 = v22;
      v31 = 2112;
      v32 = v11;
      _os_log_debug_impl(&dword_1DDAA5000, v18, OS_LOG_TYPE_DEBUG, "Not posting repeat telemetry for event (S: %@, E:%lu, C:%@, T:%@) with payload: %@", (uint8_t *)&v23, 0x34u);

    }
  }
  else
  {
    -[ICTelemetryManager postTelemetryEvent:serviceName:payload:](self, "postTelemetryEvent:serviceName:payload:", a3, v10, v11);
    objc_msgSend(v14, "arrayByAddingObject:", v12);
    v19 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setObject:forKey:", v19, CFSTR("ICRTCTelemetryServiceOneTimeEventTokens"));

    v14 = (void *)v19;
  }

}

- (void)postTelemetryEvent:(unint64_t)a3 serviceName:(id)a4 payload:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  unsigned __int16 v24;
  void *v25;
  id v26;
  NSObject *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  id v31;
  uint8_t buf[4];
  id v33;
  __int16 v34;
  unint64_t v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  id v41;
  _QWORD v42[2];
  _QWORD v43[2];
  _QWORD v44[6];
  _QWORD v45[8];

  v45[6] = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a5;
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bundleIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v10, "length"))
  {
    v11 = *MEMORY[0x1E0D83888];
    v44[0] = *MEMORY[0x1E0D83880];
    v44[1] = v11;
    v45[0] = &unk_1EA832370;
    v45[1] = &unk_1EA8322E0;
    v44[2] = *MEMORY[0x1E0D838A8];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", arc4random());
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = *MEMORY[0x1E0D83870];
    v45[2] = v12;
    v45[3] = MEMORY[0x1E0C9AAB0];
    v14 = *MEMORY[0x1E0D83890];
    v44[3] = v13;
    v44[4] = v14;
    v44[5] = *MEMORY[0x1E0D83878];
    v45[4] = MEMORY[0x1E0C9AAA0];
    v45[5] = v10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v45, v44, 6);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = *MEMORY[0x1E0D838B8];
    v42[0] = *MEMORY[0x1E0D838B0];
    v42[1] = v16;
    v43[0] = CFSTR("notes");
    v43[1] = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v43, v42, 2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "telemetryTuples");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "objectForKeyedSubscript:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      if (objc_msgSend(v20, "count") == 2)
      {
        v21 = os_log_create("com.apple.notes", "Telemetry");
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(v20, "objectAtIndexedSubscript:", 0);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "objectAtIndexedSubscript:", 1);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138413314;
          v33 = v7;
          v34 = 2048;
          v35 = a3;
          v36 = 2112;
          v37 = v28;
          v38 = 2112;
          v39 = v29;
          v40 = 2112;
          v41 = v8;
          _os_log_debug_impl(&dword_1DDAA5000, v21, OS_LOG_TYPE_DEBUG, "Posting telemetry for event (S: %@, E:%lu, C:%@, T:%@) with payload: %@", buf, 0x34u);

        }
        v22 = (void *)MEMORY[0x1E0D83848];
        objc_msgSend(v20, "objectAtIndexedSubscript:", 0);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v23, "unsignedIntValue");
        objc_msgSend(v20, "objectAtIndexedSubscript:", 1);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = 0;
        objc_msgSend(v22, "sendOneMessageWithSessionInfo:userInfo:category:type:payload:error:", v15, v17, v24, (unsigned __int16)objc_msgSend(v25, "unsignedIntValue"), v8, &v31);
        v26 = v31;

        if (v26)
        {
          v27 = os_log_create("com.apple.notes", "Telemetry");
          if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
            -[ICTelemetryManager postTelemetryEvent:serviceName:payload:].cold.1((uint64_t)v26, v27);

        }
      }
      else
      {
        +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "-[ICTelemetryManager postTelemetryEvent:serviceName:payload:]", 1, 0, CFSTR("Invalid tuple argument count (%lu) for event: %lu"), objc_msgSend(v20, "count"), a3);
      }
    }
    else
    {
      +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "-[ICTelemetryManager postTelemetryEvent:serviceName:payload:]", 1, 0, CFSTR("No event tuple defined for event: %lu"), a3, v30);
    }

  }
  else
  {
    +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "-[ICTelemetryManager postTelemetryEvent:serviceName:payload:]", 1, 0, CFSTR("Unable to find valid bundle ID for telemetry"));
  }

}

+ (void)postFullSyncTelemetryWithReason:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v4 = a3;
  objc_msgSend(a1, "telemetryQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __54__ICTelemetryManager_postFullSyncTelemetryWithReason___block_invoke;
  v7[3] = &unk_1EA824C30;
  v8 = v4;
  v9 = a1;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __54__ICTelemetryManager_postFullSyncTelemetryWithReason___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 40), "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v5 = CFSTR("reason");
  v6[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postTelemetryEvent:serviceName:payload:", 0, CFSTR("general"), v4);

}

+ (void)postFetchDatabaseChangesTelemetryWithReason:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v4 = a3;
  objc_msgSend(a1, "telemetryQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __66__ICTelemetryManager_postFetchDatabaseChangesTelemetryWithReason___block_invoke;
  v7[3] = &unk_1EA824C30;
  v8 = v4;
  v9 = a1;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __66__ICTelemetryManager_postFetchDatabaseChangesTelemetryWithReason___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 40), "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v5 = CFSTR("reason");
  v6[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postTelemetryEvent:serviceName:payload:", 1, CFSTR("general"), v4);

}

+ (void)postFetchZoneChangesTelemetryWithReason:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v4 = a3;
  objc_msgSend(a1, "telemetryQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __62__ICTelemetryManager_postFetchZoneChangesTelemetryWithReason___block_invoke;
  v7[3] = &unk_1EA824C30;
  v8 = v4;
  v9 = a1;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __62__ICTelemetryManager_postFetchZoneChangesTelemetryWithReason___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 40), "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v5 = CFSTR("reason");
  v6[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postTelemetryEvent:serviceName:payload:", 2, CFSTR("general"), v4);

}

+ (void)postBasicEvent:(unint64_t)a3
{
  NSObject *v5;
  _QWORD v6[6];

  objc_msgSend(a1, "telemetryQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __37__ICTelemetryManager_postBasicEvent___block_invoke;
  v6[3] = &__block_descriptor_48_e5_v8__0l;
  v6[4] = a1;
  v6[5] = a3;
  dispatch_async(v5, v6);

}

void __37__ICTelemetryManager_postBasicEvent___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = CFSTR("code");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "postTelemetryEvent:serviceName:payload:", 3, CFSTR("basic"), v4);
}

+ (void)postOneTimeBasicEvent:(unint64_t)a3
{
  NSObject *v5;
  _QWORD v6[6];

  objc_msgSend(a1, "telemetryQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __44__ICTelemetryManager_postOneTimeBasicEvent___block_invoke;
  v6[3] = &__block_descriptor_48_e5_v8__0l;
  v6[4] = a1;
  v6[5] = a3;
  dispatch_async(v5, v6);

}

void __44__ICTelemetryManager_postOneTimeBasicEvent___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = CFSTR("code");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 40));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@-%@"), CFSTR("basic"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "postOneTimeTelemetryEvent:serviceName:payload:token:", 3, CFSTR("basic"), v4, v7);
}

+ (id)telemetryQueue
{
  if (telemetryQueue_onceToken != -1)
    dispatch_once(&telemetryQueue_onceToken, &__block_literal_global_46_0);
  return (id)telemetryQueue_queue;
}

void __36__ICTelemetryManager_telemetryQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_qos_class(MEMORY[0x1E0C80D50], QOS_CLASS_BACKGROUND, 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("com.apple.notes.telemetry", v2);
  v1 = (void *)telemetryQueue_queue;
  telemetryQueue_queue = (uint64_t)v0;

}

+ (void)waitUntilAllPendingTelemetryHasBeenSent
{
  OUTLINED_FUNCTION_0_2(&dword_1DDAA5000, a1, a3, "Blocking thread until all pending telemetry has been sent", a5, a6, a7, a8, 0);
}

void __61__ICTelemetryManager_waitUntilAllPendingTelemetryHasBeenSent__block_invoke()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v0 = os_log_create("com.apple.notes", "Telemetry");
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG))
    __61__ICTelemetryManager_waitUntilAllPendingTelemetryHasBeenSent__block_invoke_cold_1(v0, v1, v2, v3, v4, v5, v6, v7);

}

- (void)postTelemetryEvent:(uint64_t)a1 serviceName:(NSObject *)a2 payload:.cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1DDAA5000, a2, OS_LOG_TYPE_ERROR, "Error reporting telemetry: %@", (uint8_t *)&v2, 0xCu);
}

void __61__ICTelemetryManager_waitUntilAllPendingTelemetryHasBeenSent__block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DDAA5000, a1, a3, "Finished waiting for all pending telemetry to be sent", a5, a6, a7, a8, 0);
}

@end
