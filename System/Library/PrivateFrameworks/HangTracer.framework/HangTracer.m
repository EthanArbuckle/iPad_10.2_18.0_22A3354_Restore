void __connectToHangTracer_block_invoke()
{
  NSObject *v0;
  xpc_connection_t mach_service;
  void *v2;

  if (!hangTracerConnection)
  {
    HTConnectionQueue();
    v0 = objc_claimAutoreleasedReturnValue();
    mach_service = xpc_connection_create_mach_service("com.apple.hangtracerd", v0, 0);
    v2 = (void *)hangTracerConnection;
    hangTracerConnection = (uint64_t)mach_service;

    xpc_connection_set_event_handler((xpc_connection_t)hangTracerConnection, &__block_literal_global_101);
    xpc_connection_resume((xpc_connection_t)hangTracerConnection);
  }
}

void __connectToHangTracer_block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  uint64_t v4;
  NSObject *v5;
  NSObject *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = (void *)MEMORY[0x1B5DFA050]();
  v4 = MEMORY[0x1B5DFA0BC](v2);

  if (v4 != MEMORY[0x1E0C81310])
  {
    shared_ht_log_handle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 136315138;
      v8 = (uint64_t)v3;
      _os_log_impl(&dword_1AF62F000, v5, OS_LOG_TYPE_DEFAULT, "Received unhandled event from daemon: %s", (uint8_t *)&v7, 0xCu);
    }
LABEL_8:

    goto LABEL_9;
  }
  if (hangTracerConnection)
  {
    shared_ht_log_handle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 134218242;
      v8 = hangTracerConnection;
      v9 = 2080;
      v10 = v3;
      _os_log_impl(&dword_1AF62F000, v6, OS_LOG_TYPE_DEFAULT, "XPC Error when we still had a connection (%p): %s", (uint8_t *)&v7, 0x16u);
    }

    v5 = hangTracerConnection;
    hangTracerConnection = 0;
    goto LABEL_8;
  }
LABEL_9:
  free(v3);
}

void HTHangEventAddUserActionCaptureCallback(uint64_t a1, uint64_t a2)
{
  int v4;
  NSObject *v5;
  _BOOL4 v6;
  const char *v7;
  uint8_t *v8;
  uint8_t v9[16];
  uint8_t buf[2];
  __int16 v11;

  if (!a1 || !a2)
  {
    shared_ht_log_handle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 0;
      v7 = "User action capture callback not set";
      v8 = (uint8_t *)&v11;
LABEL_11:
      _os_log_impl(&dword_1AF62F000, v5, OS_LOG_TYPE_DEFAULT, v7, v8, 2u);
    }
LABEL_12:

    return;
  }
  v4 = *(unsigned __int8 *)(a1 + 30);
  shared_ht_log_handle();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (!v4)
  {
    if (v6)
    {
      *(_WORD *)buf = 0;
      v7 = "Skip setting user action callback for 3rd party apps";
      v8 = buf;
      goto LABEL_11;
    }
    goto LABEL_12;
  }
  if (v6)
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_1AF62F000, v5, OS_LOG_TYPE_DEFAULT, "User action capture callback set", v9, 2u);
  }

  *(_QWORD *)(a1 + 376) = a2;
}

void __handleSettingChange_block_invoke(uint64_t a1)
{
  xpc_object_t v2;
  uint64_t i;
  xpc_object_t v4[4];
  char *keys[2];
  __int128 v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (hangTracerConnection)
  {
    *(_OWORD *)keys = xmmword_1E5FAA4A8;
    v6 = *(_OWORD *)off_1E5FAA4B8;
    v4[0] = xpc_int64_create(1);
    v4[1] = xpc_string_create((const char *)(*(_QWORD *)(a1 + 32) + 52));
    v4[2] = xpc_string_create((const char *)(*(_QWORD *)(a1 + 32) + 116));
    v4[3] = xpc_shmem_create(*(void **)(a1 + 40), 0x1028uLL);
    v2 = xpc_dictionary_create((const char *const *)keys, v4, 4uLL);
    xpc_connection_send_message((xpc_connection_t)hangTracerConnection, v2);

    for (i = 3; i != -1; --i)
  }
}

void __connectToHTMonitorProcess_block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  uint64_t v4;
  NSObject *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = (void *)MEMORY[0x1B5DFA050]();
  v4 = MEMORY[0x1B5DFA0BC](v2);

  if (v4 != MEMORY[0x1E0C81310])
  {
    shared_ht_log_handle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 136315138;
      v7 = v3;
      _os_log_impl(&dword_1AF62F000, v5, OS_LOG_TYPE_DEFAULT, "HangTraceMonitor:Received unhandled event from daemon: %s", (uint8_t *)&v6, 0xCu);
    }

  }
  free(v3);
}

void HTSuspendHangTracing(uint64_t a1)
{
  _opaque_pthread_t *v2;
  unsigned int *v3;
  unsigned int v4;

  if (a1)
  {
    v2 = *(_opaque_pthread_t **)(a1 + 32);
    if ((_DWORD)v2 == -1 || v2 == pthread_self())
    {
      v3 = (unsigned int *)(a1 + 24);
      do
        v4 = __ldaxr(v3);
      while (__stlxr(v4 + 1, v3));
      if (!v4)
        checkForHang(a1);
    }
  }
}

uint64_t HTResumeHangTracing(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  unsigned int *v3;
  int v4;
  NSObject *v5;

  if (result)
  {
    v1 = result;
    v2 = *(_QWORD *)(result + 32);
    if ((_DWORD)v2 == -1 || (result = (uint64_t)pthread_self(), v2 == result))
    {
      result = mach_absolute_time();
      *(_QWORD *)v1 = result;
      *(_BYTE *)(v1 + 372) = 0;
      v3 = (unsigned int *)(v1 + 24);
      do
        v4 = __ldaxr(v3);
      while (__stlxr(v4 - 1, v3));
      if (v4 <= 0)
      {
        shared_ht_log_handle();
        v5 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
          HTResumeHangTracing_cold_1(v4, v5);

        return HTAggdAddValueForScalarKey(CFSTR("com.apple.hangtracer.HTResume.OverResumed"), 1);
      }
    }
  }
  return result;
}

uint64_t HTUpdateHangTracing(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;

  if (result)
  {
    v1 = result;
    v2 = *(_QWORD *)(result + 32);
    if ((_DWORD)v2 == -1 || (result = (uint64_t)pthread_self(), v2 == result))
    {
      if (!atomic_load((unsigned int *)(v1 + 24)))
      {
        checkForHang(v1);
        result = mach_absolute_time();
        *(_QWORD *)v1 = result;
        *(_BYTE *)(v1 + 372) = 0;
      }
    }
  }
  return result;
}

void checkForHang(uint64_t a1)
{
  uint64_t v2;

  if (GetSharedPage_onceToken != -1)
    dispatch_once(&GetSharedPage_onceToken, &__block_literal_global_67);
  if (GetSharedPage__sharedPage)
    v2 = GetSharedPage__sharedPage + 3080;
  else
    v2 = 0;
  checkForHangWithUserMovedAwayAndRecentAssertions(a1, 0, v2);
}

void checkForHangWithUserMovedAwayAndRecentAssertions(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t v6;
  os_signpost_id_t v7;
  double v8;
  _BOOL4 v9;
  unint64_t v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  int v16;
  NSObject *v17;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  BOOL v24;
  double v25;
  double v26;
  BOOL v27;
  NSObject *v28;
  const __CFString *v29;
  __CFString *v30;
  NSObject *v31;
  const __CFString *v32;
  const __CFString *v33;
  uint64_t v34;
  const __CFData *Data;
  const __CFData *v36;
  NSObject *v37;
  double v38;
  uint64_t v39;
  char v40;
  const __CFString *v41;
  const __CFData *v42;
  BOOL v43;
  _QWORD block[12];
  char v45;
  BOOL v46;
  uint64_t v47;
  uint64_t v48;
  id (*v49)(uint64_t);
  void *v50;
  NSObject *v51;
  uint64_t v52;
  double v53;
  uint8_t buf[4];
  double v55;
  __int16 v56;
  const __CFString *v57;
  __int16 v58;
  const __CFString *v59;
  __int16 v60;
  const __CFString *v61;
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  if (!*(_BYTE *)(a1 + 372))
  {
    v6 = mach_absolute_time();
    v7 = *(_QWORD *)a1;
    v8 = MATU_TO_MS((unint64_t)((double)v6 - (double)*(unint64_t *)a1));
    if (v8 > 100.0)
      kdebug_trace();
    if (*(_BYTE *)(a1 + 29))
      v9 = v8 > (double)*(unint64_t *)(a1 + 8);
    else
      v9 = 0;
    if (v8 < 250.0 && !v9)
    {
      if (!a2)
        return;
      shared_ht_log_handle();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        v16 = *(_DWORD *)(a1 + 48);
        *(_DWORD *)buf = 67109120;
        LODWORD(v55) = v16;
        _os_log_impl(&dword_1AF62F000, v12, OS_LOG_TYPE_INFO, "checkForHang:Hang is not detected for pid @%u during user switched away from App", buf, 8u);
      }
      goto LABEL_68;
    }
    v11 = 1;
    if (a2)
    {
      *(_BYTE *)(a1 + 372) = 1;
      v11 = 10;
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a1 + 116);
    v12 = objc_claimAutoreleasedReturnValue();
    if (isAppBeingDebugged(*(_DWORD *)(a1 + 48)))
    {
      shared_ht_log_handle();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        v55 = v8 / 1000.0;
        _os_log_impl(&dword_1AF62F000, v13, OS_LOG_TYPE_DEFAULT, "Hang detected: %.2fs (debugger attached, not reporting)", buf, 0xCu);
      }

      HTAggdPushValueForDistributionKey(objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.ht_debugger_attached.%s.%s"), a1 + 52, a1 + 116), v8);
      HTCreateAnalyticsEventForAlwaysOnHang(6, v12, v8);
      alwaysOnSignpost();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      signpostHangInterval(CFSTR("Debugger Attached Runloop Hang"), v12, v7, v6, v14);

      if (!*(_BYTE *)(a1 + 29))
        goto LABEL_68;
      v47 = MEMORY[0x1E0C809B0];
      v48 = 3221225472;
      v49 = __checkForHangWithUserMovedAwayAndRecentAssertions_block_invoke;
      v50 = &unk_1E5FAA638;
      v52 = 6;
      v51 = v12;
      v53 = v8;
      AnalyticsSendEventLazy();
      v15 = v51;
LABEL_67:

LABEL_68:
      return;
    }
    if ((a2 & 1) == 0 && alm_app_measurement_ongoing())
    {
      shared_ht_log_handle();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        v55 = v8 / 1000.0;
        _os_log_impl(&dword_1AF62F000, v17, OS_LOG_TYPE_DEFAULT, "Hang detected: %.2fs (overlaps extended launch)", buf, 0xCu);
      }

      HTAggdPushValueForDistributionKey(objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.ht_extended_launch_overlap.%s.%s"), a1 + 52, a1 + 116), v8);
      v11 = 7;
    }
    if (a3 && checkForAssertionOverlap(v7, v6, a3, 1))
    {
      shared_ht_log_handle();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        v55 = v8 / 1000.0;
        _os_log_impl(&dword_1AF62F000, v18, OS_LOG_TYPE_DEFAULT, "Hang detected: %.2fs (overlaps with non-responsive assertion)", buf, 0xCu);
      }

      HTAggdPushValueForDistributionKey(objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.ht_assertion_overlap.%s.%s"), a1 + 52, a1 + 116), v8);
      v11 = 9;
      HTCreateAnalyticsEventForAlwaysOnHang(9, v12, v8);
    }
    else
    {
      shared_ht_log_handle();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        v55 = v8 / 1000.0;
        _os_log_impl(&dword_1AF62F000, v19, OS_LOG_TYPE_DEFAULT, "Hang detected: %.2fs (always-on hang reporting)", buf, 0xCu);
      }

      HTAggdPushValueForDistributionKey(objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.ht_always_on.%s.%s"), a1 + 52, a1 + 116), v8);
      HTCreateAnalyticsEventForAlwaysOnHang(v11, v12, v8);
      getStringForSubtype(v11);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a1 + 116);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      alwaysOnSignpost();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      signpostHangInterval(v20, v21, v7, v6, v22);

      if (v8 < 250.0)
      {
        shared_ht_log_handle();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
          checkForHangWithUserMovedAwayAndRecentAssertions_cold_1(v23, v8);

      }
    }
    if (!*(_BYTE *)(a1 + 29))
      goto LABEL_68;
    v24 = v9;
    if (v8 < 250.0)
      v24 = 1;
    if (v24 || !*(_BYTE *)(a1 + 30))
    {
      v27 = 0;
    }
    else
    {
      v25 = (double)arc4random_uniform(0xFFFFFFFF) * 100.0 / 4294967300.0;
      v26 = *(double *)(a1 + 16);
      v27 = v25 < v26;
      shared_ht_log_handle();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        v41 = *(const __CFString **)(a1 + 16);
        if (v25 >= v26)
          v29 = CFSTR("(diceRoll over threshold)");
        else
          v29 = CFSTR("(diceRoll under threshold)");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v25 < v26);
        v30 = (__CFString *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218754;
        v55 = v25;
        v56 = 2048;
        v57 = v41;
        v58 = 2112;
        v59 = v30;
        v60 = 2112;
        v61 = v29;
        _os_log_impl(&dword_1AF62F000, v28, OS_LOG_TYPE_INFO, "Micro Hang Sampling: random sampling diceRoll=%.2f samplingPercent=%.2f%% -> shouldCapture=%@ %@", buf, 0x2Au);

        v27 = v25 < v26;
      }

    }
    if (v8 < 250.0)
      goto LABEL_68;
    shared_ht_log_handle();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      v32 = CFSTR("(over capture threshold)");
      if (!v9)
        v32 = CFSTR("(not over capture threshold)");
      *(_DWORD *)buf = 134218498;
      v55 = v8 / 1000.0;
      v56 = 2112;
      v57 = v32;
      if (!v9 && v27)
        v33 = CFSTR(", (capture microhang)");
      else
        v33 = &stru_1E5FAD688;
      v58 = 2112;
      v59 = v33;
      _os_log_impl(&dword_1AF62F000, v31, OS_LOG_TYPE_DEFAULT, "Hang detected: %.2fs %@ %@", buf, 0x20u);
    }

    v43 = v27;
    if ((a2 & 1) != 0)
    {
      v42 = 0;
      v34 = 13;
    }
    else
    {
      Data = (const __CFData *)hangEventCaptureUserActionCreateData(a1);
      if (Data)
      {
        v36 = Data;
        if (CFDataGetLength(Data) <= 0x20000)
        {
          v34 = 3;
          v42 = v36;
          goto LABEL_66;
        }
        shared_ht_log_handle();
        v37 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
        {
          v38 = COERCE_DOUBLE(CFDataGetLength(v36));
          *(_DWORD *)buf = 134217984;
          v55 = v38;
          _os_log_impl(&dword_1AF62F000, v37, OS_LOG_TYPE_DEFAULT, "User action data size %ld exceeding limit", buf, 0xCu);
        }

        CFRelease(v36);
      }
      v42 = 0;
      v34 = 3;
    }
LABEL_66:
    v39 = *(_QWORD *)(a1 + 40);
    v40 = *(_BYTE *)(a1 + 28);
    HTConnectionQueue();
    v15 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __checkForHangWithUserMovedAwayAndRecentAssertions_block_invoke_124;
    block[3] = &__block_descriptor_98_e5_v8__0l;
    block[4] = v34;
    block[5] = a1 + 52;
    block[6] = v39;
    block[7] = v7;
    v45 = v40;
    block[8] = v6;
    block[9] = v11;
    v46 = v43;
    block[10] = a1;
    block[11] = v42;
    dispatch_async(v15, block);
    goto LABEL_67;
  }
}

double MATU_TO_MS(unint64_t a1)
{
  if (timebaseConversionFactor_onceToken != -1)
    dispatch_once(&timebaseConversionFactor_onceToken, &__block_literal_global_2);
  return *(double *)&timebaseConversionFactor_timebaseConversion * (double)a1;
}

id shared_ht_log_handle()
{
  if (shared_ht_log_handle_onceToken != -1)
    dispatch_once(&shared_ht_log_handle_onceToken, &__block_literal_global_6);
  return (id)shared_ht_log_handle___ht_log_handle;
}

void signpostHangInterval(void *a1, void *a2, os_signpost_id_t a3, uint64_t a4, void *a5)
{
  __CFString *v9;
  __CFString *v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  const __CFString *v14;
  const __CFString *v15;
  _BYTE buf[12];
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  const __CFString *v20;
  __int16 v21;
  const __CFString *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v9 = a1;
  v10 = a2;
  v11 = a5;
  *(_QWORD *)buf = 0;
  mach_get_times();
  if (os_signpost_enabled(v11))
  {
    v12 = v11;
    v13 = v12;
    if (a3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
    {
      v14 = CFSTR("Unknown");
      *(_DWORD *)buf = 134349826;
      *(_QWORD *)&buf[4] = a3;
      if (v10)
        v15 = v10;
      else
        v15 = CFSTR("Unknown");
      v17 = 2050;
      v18 = a4;
      v19 = 2114;
      if (v9)
        v14 = v9;
      v20 = v15;
      v21 = 2114;
      v22 = v14;
      _os_signpost_emit_with_name_impl(&dword_1AF62F000, v13, OS_SIGNPOST_EVENT, a3, "HangInterval", "%{public, signpost.description:begin_time}llu, %{public, signpost.description:end_time}llu, BundleIdOverride=%{public, signpost.description:attribute}@ type=%{public, signpost.telemetry:string2}@ enableTelemetry=YES ", buf, 0x2Au);
    }

  }
}

uint64_t isAppBeingDebugged(int a1)
{
  void *v2;
  void *v3;
  void *v4;
  int v5;
  NSObject *v6;
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;
  int v11;
  NSObject *v12;
  __int16 v13;
  int v14;
  uint8_t buf[16];
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "environment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("HT_DISABLE_DEBUGGER_CHECK"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  if (v5)
  {
    shared_ht_log_handle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AF62F000, v6, OS_LOG_TYPE_DEFAULT, "Check for app is being debugged is disabled", buf, 2u);
    }

    return 0;
  }
  v17 = 0u;
  v18 = 0u;
  *(_OWORD *)buf = 0u;
  v16 = 0u;
  if (!proc_pidinfo(a1, 13, 1uLL, buf, 64))
  {
    shared_ht_log_handle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      LOWORD(v11) = 0;
      _os_log_impl(&dword_1AF62F000, v8, OS_LOG_TYPE_INFO, "Failed to check if app is being debugged", (uint8_t *)&v11, 2u);
    }
    v7 = 0;
    goto LABEL_18;
  }
  if ((v17 & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", &v16);
    v8 = objc_claimAutoreleasedReturnValue();
    if ((-[NSObject isEqualToString:](v8, "isEqualToString:", CFSTR("xctest")) & 1) != 0
      || (-[NSObject isEqualToString:](v8, "isEqualToString:", CFSTR("hangman")) & 1) != 0
      || -[NSObject hasSuffix:](v8, "hasSuffix:", CFSTR("-Runner")))
    {
      shared_ht_log_handle();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v11 = 138543618;
        v12 = v8;
        v13 = 1024;
        v14 = a1;
        _os_log_impl(&dword_1AF62F000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ [%d] is a test process, isAppBeingDebugged returning NO", (uint8_t *)&v11, 0x12u);
      }
      v7 = 0;
    }
    else
    {
      shared_ht_log_handle();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v11) = 0;
        _os_log_impl(&dword_1AF62F000, v9, OS_LOG_TYPE_DEFAULT, "App is being debugged, do not track this hang", (uint8_t *)&v11, 2u);
      }
      v7 = 1;
    }

LABEL_18:
    return v7;
  }
  return 0;
}

void *hangEventCaptureUserActionCreateData(uint64_t a1)
{
  void (*v1)(void);
  void *v2;
  NSObject *v3;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v1 = *(void (**)(void))(a1 + 376);
  if (!v1)
    return 0;
  v1();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  shared_ht_log_handle();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 134217984;
    v6 = objc_msgSend(v2, "length");
    _os_log_impl(&dword_1AF62F000, v3, OS_LOG_TYPE_DEFAULT, "User action data captured with size: %lu", (uint8_t *)&v5, 0xCu);
  }

  return v2;
}

__CFString *getStringForSubtype(unint64_t a1)
{
  if (a1 <= 0xA)
    a1 = *off_1E5FAAE28[a1];
  return (__CFString *)(id)a1;
}

uint64_t checkForAssertionOverlap(unint64_t a1, unint64_t a2, uint64_t a3, int a4)
{
  uint64_t v7;
  int v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  NSObject *v13;
  double v14;
  double v15;
  uint64_t v16;
  NSObject *v17;
  NSObject *v18;
  const char *v19;
  uint32_t v20;
  double v21;
  NSObject *v22;
  double v23;
  double v24;
  double v25;
  NSObject *v26;
  NSObject *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  NSObject *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  unint64_t v44;
  uint64_t v46;
  unint64_t v47;
  uint8_t v48[4];
  double v49;
  uint8_t buf[4];
  double v51;
  __int16 v52;
  double v53;
  __int16 v54;
  double v55;
  __int16 v56;
  uint64_t v57;
  __int16 v58;
  unint64_t v59;
  __int16 v60;
  unint64_t v61;
  uint64_t v62;

  v7 = 0;
  v47 = 0;
  v8 = 0;
  v62 = *MEMORY[0x1E0C80C00];
  v44 = a2 - a1;
  v46 = a3 + 32;
  do
  {
    if (*(_QWORD *)(a3 + v7))
    {
      ++v8;
      v9 = a3 + v7;
      v10 = *(_QWORD *)(a3 + v7 + 24);
      if (v10 >= *(_QWORD *)(a3 + v7 + 16))
        v10 = *(_QWORD *)(a3 + v7 + 16);
      v11 = *(_QWORD *)(a3 + v7 + 8) <= a1 ? a1 : *(_QWORD *)(a3 + v7 + 8);
      v12 = v10 >= a2 ? a2 : v10;
      if (v12 > v11)
      {
        shared_ht_log_handle();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          v14 = *(double *)(a3 + v7);
          v15 = *(double *)(v9 + 8);
          v16 = *(_QWORD *)(v9 + 24);
          *(_DWORD *)buf = 134219266;
          v51 = v14;
          v52 = 2080;
          *(_QWORD *)&v53 = v46 + v7;
          v54 = 2048;
          v55 = v15;
          v56 = 2048;
          v57 = v16;
          v58 = 2048;
          v59 = a1;
          v60 = 2048;
          v61 = a2;
          _os_log_impl(&dword_1AF62F000, v13, OS_LOG_TYPE_INFO, "HTAssertion: checkOverlap: hang overlaps with assertion, assertionid=%llu assertionname=(%s) start=%llu end=%llu, hangstart=%llu, hangend=%llu)", buf, 0x3Eu);
        }

        if (*(_BYTE *)(a3 + v7 + 96))
        {
          if (*(_QWORD *)(v9 + 24) < a2)
          {
            shared_ht_log_handle();
            v17 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              v18 = v17;
              v19 = "HTAssertion: checkOverlap: not ignoring hang during screen turning on";
LABEL_21:
              v20 = 2;
LABEL_22:
              _os_log_impl(&dword_1AF62F000, v18, OS_LOG_TYPE_INFO, v19, buf, v20);
              goto LABEL_23;
            }
            goto LABEL_23;
          }
          if (*(_QWORD *)(v9 + 8) > a1)
          {
            shared_ht_log_handle();
            v17 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              v18 = v17;
              v19 = "HTAssertion: checkOverlap: not ignoring hang during screen turning off";
              goto LABEL_21;
            }
LABEL_23:

            goto LABEL_30;
          }
          v21 = MATU_TO_MS(v44);
          shared_ht_log_handle();
          v22 = objc_claimAutoreleasedReturnValue();
          v17 = v22;
          if (v21 >= 1000.0)
          {
            if (!os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
              goto LABEL_23;
            v23 = MATU_TO_MS(v44);
            *(_DWORD *)buf = 134217984;
            v51 = v23;
            v18 = v17;
            v19 = "HTAssertion: checkOverlap: not ignoring hang during screen off with duration %.0fms";
            v20 = 12;
            goto LABEL_22;
          }
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
            checkForAssertionOverlap_cold_3(v48, v44, &v49, v17);

        }
        v47 += v12 - v11;
        if (a4)
          AnalyticsSendEventLazy();
      }
    }
LABEL_30:
    v7 += 104;
  }
  while (v7 != 1040);
  if (!v8)
  {
    shared_ht_log_handle();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
      checkForAssertionOverlap_cold_1(v28, v29, v30, v31, v32, v33, v34, v35);
    goto LABEL_48;
  }
  v24 = MATU_TO_MS(v47);
  v25 = MATU_TO_MS(v44) - v24;
  if (v25 >= 250.0)
  {
    shared_ht_log_handle();
    v36 = objc_claimAutoreleasedReturnValue();
    v28 = v36;
    if (v47)
    {
      if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134217984;
        v51 = v25;
        _os_log_impl(&dword_1AF62F000, v28, OS_LOG_TYPE_INFO, "HTAssertion: checkOverlap: hang partially overlaps assertions, since hangDurationWithoutOverlap=%fms does not qualify as assertion overlap", buf, 0xCu);
      }
    }
    else if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
    {
      checkForAssertionOverlap_cold_2(v28, v37, v38, v39, v40, v41, v42, v43);
    }
LABEL_48:

    return 0;
  }
  shared_ht_log_handle();
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218496;
    v51 = v24;
    v52 = 2048;
    v53 = (double)v47 * 100.0 / (double)v44;
    v54 = 2048;
    v55 = v25;
    _os_log_impl(&dword_1AF62F000, v26, OS_LOG_TYPE_DEFAULT, "HTAssertion: checkOverlap: hang overlaps assertion for %f ms (%f %%), hangDurationWithoutOverlap=%fms -> qualifies as assertion overlap", buf, 0x20u);
  }

  if (a4)
  {
    HTAggdPushValueForDistributionKey(CFSTR("com.apple.ht_assertion_stats.hang_overlap_ms"), v24);
    HTAggdPushValueForDistributionKey(CFSTR("com.apple.ht_assertion_stats.hang_overlap_percent"), (double)v47 * 100.0 / (double)v44);
    AnalyticsSendEventLazy();
  }
  return 1;
}

id alwaysOnSignpost()
{
  if (alwaysOnSignpost_onceToken != -1)
    dispatch_once(&alwaysOnSignpost_onceToken, &__block_literal_global_12);
  return (id)alwaysOnSignpost_signpostLog;
}

void HTCreateAnalyticsEventForAlwaysOnHang(uint64_t a1, void *a2, double a3)
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD block[4];
  id v9;
  uint64_t v10;
  double v11;

  v5 = a2;
  HTCAQueue();
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __HTCreateAnalyticsEventForAlwaysOnHang_block_invoke;
  block[3] = &unk_1E5FAA6C8;
  v9 = v5;
  v10 = a1;
  v11 = a3;
  v7 = v5;
  dispatch_async(v6, block);

}

id HTCAQueue()
{
  if (HTCAQueue_onceToken != -1)
    dispatch_once(&HTCAQueue_onceToken, &__block_literal_global_0);
  return (id)HTCAQueue_caQueue;
}

uint64_t HTAppActivationEvent()
{
  return 0;
}

uint64_t HTAppActivationGenerateAppIdentifier()
{
  return 0;
}

void sub_1AF632C10(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
  id *v33;
  uint64_t v34;

  objc_destroyWeak(v33);
  _Block_object_dispose(&a25, 8);
  _Block_object_dispose(&a29, 8);
  _Block_object_dispose(&a33, 8);
  _Block_object_dispose((const void *)(v34 - 208), 8);
  _Block_object_dispose((const void *)(v34 - 176), 8);
  _Block_object_dispose((const void *)(v34 - 144), 8);
  objc_destroyWeak((id *)(v34 - 104));
  _Unwind_Resume(a1);
}

uint64_t HTHangEventCreate(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = HTHangEventCreateWithBundleID(a1, v3);
  return v4;
}

uint64_t HTHangEventCreateWithBundleID(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  unsigned int v5;
  uint64_t v6;
  uint64_t v7;
  pthread_t v8;
  _opaque_pthread_t *v9;
  NSObject *v10;
  id v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  BOOL v15;
  char v16;
  uint64_t v17;
  NSObject *v18;
  _BOOL4 v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  uint64_t v27;
  void *v28;
  NSObject *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  id v33;
  _QWORD v35[5];
  _QWORD block[5];
  uint8_t buf[8];
  uint64_t v38;
  void (*v39)(_QWORD *, void *);
  void *v40;
  id v41;
  id v42;
  id v43;

  v3 = a2;
  os_unfair_lock_lock((os_unfair_lock_t)&frameworkLock);
  if (GetSharedPage_onceToken != -1)
    dispatch_once(&GetSharedPage_onceToken, &__block_literal_global_67);
  v4 = GetSharedPage__sharedPage;
  if (GetSharedPage__sharedPage && (v5 = *(_DWORD *)(GetSharedPage__sharedPage + 4), v5 != 8))
  {
    *(_DWORD *)(GetSharedPage__sharedPage + 4) = v5 + 1;
    v7 = v4 + 384 * v5;
    atomic_store(0, (unsigned int *)(v7 + 32));
    *(_QWORD *)(v7 + 8) = mach_absolute_time();
    v6 = v7 + 8;
    *(_BYTE *)(v7 + 380) = 0;
    v8 = pthread_self();
    *(_QWORD *)(v7 + 48) = 0;
    v7 += 48;
    *(_QWORD *)(v7 - 8) = v8;
    *(_DWORD *)(v7 + 8) = getpid();
    *(_WORD *)(v7 - 12) = 0;
    *(_QWORD *)(v7 - 32) = -1;
    *(_QWORD *)(v7 - 24) = 0;
    *(_QWORD *)(v7 + 336) = 0;
    v9 = pthread_self();
    pthread_threadid_np(v9, (__uint64_t *)v7);
    if (a1)
    {
      __strlcpy_chk();
    }
    else
    {
      shared_ht_log_handle();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1AF62F000, v10, OS_LOG_TYPE_DEFAULT, "ServiceName == NULL", buf, 2u);
      }

    }
    v11 = objc_retainAutorelease(v3);
    if (objc_msgSend(v11, "cStringUsingEncoding:", 1))
    {
      __strlcpy_chk();
    }
    else
    {
      shared_ht_log_handle();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1AF62F000, v12, OS_LOG_TYPE_DEFAULT, "Failed to get bundle id", buf, 2u);
      }

    }
    v13 = objc_msgSend(v11, "rangeOfString:options:", CFSTR("com.apple."), 1);
    if (v14)
      v15 = v13 == 0;
    else
      v15 = 0;
    v16 = v15;
    *(_BYTE *)(v4 + 384 * v5 + 38) = v16;
    os_unfair_lock_lock((os_unfair_lock_t)&gHTWatchdogLock);
    v17 = gHTWatchdogMonitor;
    shared_ht_log_handle();
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG);
    v20 = MEMORY[0x1E0C809B0];
    if (v17)
    {
      if (v19)
        HTHangEventCreateWithBundleID_cold_2();
    }
    else
    {
      if (v19)
        HTHangEventCreateWithBundleID_cold_1();

      v21 = (void *)MEMORY[0x1E0D87DA0];
      objc_msgSend(MEMORY[0x1E0D87D70], "identifierForCurrentProcess");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "predicateMatchingIdentifier:", v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0D87DC0], "descriptor");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setValues:", 2);
      v25 = (void *)MEMORY[0x1E0D87D90];
      *(_QWORD *)buf = v20;
      v38 = 3221225472;
      v39 = __StartMonitoringWatchdogDisablement_block_invoke_93;
      v40 = &unk_1E5FAA570;
      v41 = v23;
      v42 = v24;
      v43 = &__block_literal_global_88;
      v18 = v23;
      v26 = v24;
      objc_msgSend(v25, "monitorWithConfiguration:", buf);
      v27 = objc_claimAutoreleasedReturnValue();
      v28 = (void *)gHTWatchdogMonitor;
      gHTWatchdogMonitor = v27;

    }
    os_unfair_lock_unlock((os_unfair_lock_t)&gHTWatchdogLock);
    if (objc_msgSend(v11, "isEqualToString:", CFSTR("com.apple.springboard")))
    {
      *(_DWORD *)buf = 0;
      v29 = dispatch_queue_create("com.apple.hangtracer.display.notification", 0);
      notify_register_dispatch("com.apple.iokit.hid.displayStatus", (int *)buf, v29, &__block_literal_global_23);

    }
    os_unfair_lock_unlock((os_unfair_lock_t)&frameworkLock);
    HTPrefsQueue();
    v30 = objc_claimAutoreleasedReturnValue();
    block[0] = v20;
    block[1] = 3221225472;
    block[2] = __HTHangEventCreateWithBundleID_block_invoke_24;
    block[3] = &__block_descriptor_40_e5_v8__0l;
    block[4] = v6;
    dispatch_async(v30, block);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3828], "mainQueue");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v35[0] = v20;
    v35[1] = 3221225472;
    v35[2] = __HTHangEventCreateWithBundleID_block_invoke_2;
    v35[3] = &__block_descriptor_40_e24_v16__0__NSNotification_8l;
    v35[4] = v6;
    v33 = (id)objc_msgSend(v31, "addObserverForName:object:queue:usingBlock:", CFSTR("com.apple.hangtracer.daemonstate"), 0, v32, v35);

    HTConnectToHTMonitor(v6, v4);
  }
  else
  {
    os_unfair_lock_unlock((os_unfair_lock_t)&frameworkLock);
    v6 = 0;
  }

  return v6;
}

void HTConnectToHTMonitor(uint64_t a1, uint64_t a2)
{
  _QWORD v2[6];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __HTConnectToHTMonitor_block_invoke;
  v2[3] = &__block_descriptor_48_e5_v8__0l;
  v2[4] = a1;
  v2[5] = a2;
  if (HTConnectToHTMonitor_onceToken != -1)
    dispatch_once(&HTConnectToHTMonitor_onceToken, v2);
}

double timebaseConversionFactor()
{
  if (timebaseConversionFactor_onceToken != -1)
    dispatch_once(&timebaseConversionFactor_onceToken, &__block_literal_global_2);
  return *(double *)&timebaseConversionFactor_timebaseConversion;
}

void handleSettingChange(uint64_t a1)
{
  int v2;
  void *v3;
  int v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;
  _QWORD *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  _QWORD v14[6];

  v2 = *(unsigned __int8 *)(a1 + 29);
  +[HTPrefs sharedPrefs](HTPrefs, "sharedPrefs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hangtracerDaemonEnabled");

  if (!v4)
  {
    *(_BYTE *)(a1 + 28) = 0;
    *(_QWORD *)(a1 + 8) = -1;
    *(_QWORD *)(a1 + 16) = 0;
    if (v2)
    {
      HTConnectionQueue();
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = v8;
      v10 = &__block_literal_global_74;
LABEL_12:
      dispatch_async(v8, v10);

      goto LABEL_13;
    }
    goto LABEL_13;
  }
  if (!*(_BYTE *)(a1 + 30))
  {
    +[HTPrefs sharedPrefs](HTPrefs, "sharedPrefs");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_BYTE *)(a1 + 28) = objc_msgSend(v11, "thirdPartyRunLoopHangLogsEnabled");

    +[HTPrefs sharedPrefs](HTPrefs, "sharedPrefs");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)(a1 + 8) = objc_msgSend(v12, "runloopHangThirdPartyDurationThresholdMSec");

    *(_QWORD *)(a1 + 16) = 0;
    if (!v2)
      goto LABEL_8;
LABEL_13:
    *(_BYTE *)(a1 + 29) = v4;
    return;
  }
  *(_BYTE *)(a1 + 28) = 1;
  +[HTPrefs sharedPrefs](HTPrefs, "sharedPrefs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(a1 + 8) = objc_msgSend(v5, "runloopHangDurationThresholdMSec");

  +[HTPrefs sharedPrefs](HTPrefs, "sharedPrefs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "samplingPercentForMicroHangs");
  *(_QWORD *)(a1 + 16) = v7;

  if (v2)
    goto LABEL_13;
LABEL_8:
  connectToHangTracer();
  if (GetSharedPage_onceToken != -1)
    dispatch_once(&GetSharedPage_onceToken, &__block_literal_global_67);
  v13 = GetSharedPage__sharedPage;
  if (GetSharedPage__sharedPage)
  {
    HTConnectionQueue();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = v8;
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __handleSettingChange_block_invoke;
    v14[3] = &__block_descriptor_48_e5_v8__0l;
    v14[4] = a1;
    v14[5] = v13;
    v10 = v14;
    goto LABEL_12;
  }
}

uint64_t ht_fence_start(uint64_t a1)
{
  void *v2;
  char v3;
  void *v4;
  char v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  NSObject *v10;
  uint64_t v11;

  if (setupPrefs_onceToken != -1)
    dispatch_once(&setupPrefs_onceToken, &__block_literal_global_96);
  +[HTPrefs sharedPrefs](HTPrefs, "sharedPrefs");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hangtracerDaemonEnabled");

  if ((v3 & 1) == 0)
  {
    shared_ht_log_handle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      ht_fence_start_cold_4();
    goto LABEL_14;
  }
  +[HTPrefs sharedPrefs](HTPrefs, "sharedPrefs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "fenceTrackingEnabled");

  if ((v5 & 1) == 0)
  {
    shared_ht_log_handle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      ht_fence_start_cold_3();
    goto LABEL_14;
  }
  v6 = mach_absolute_time();
  v7 = (char *)__recentCAFences;
  if (!__recentCAFences)
  {
    v7 = (char *)malloc_type_malloc(0x190uLL, 0x1000040451B5BE8uLL);
    __recentCAFences = (uint64_t)v7;
    if (!v7)
    {
      shared_ht_log_handle();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
        ht_fence_start_cold_1();
LABEL_14:
      v11 = 0;
      goto LABEL_15;
    }
  }
  v8 = __nextFenceIndex;
  __nextFenceIndex = (__nextFenceIndex + 1) % 25;
  v9 = &v7[16 * v8];
  *(_QWORD *)v9 = a1;
  *((_QWORD *)v9 + 1) = v6;
  shared_ht_log_handle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    ht_fence_start_cold_2();
  v11 = 1;
LABEL_15:

  return v11;
}

void connectToHangTracer()
{
  NSObject *v0;

  HTConnectionQueue();
  v0 = objc_claimAutoreleasedReturnValue();
  dispatch_async(v0, &__block_literal_global_98);

}

void __shared_ht_log_handle_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.hangtracer", "");
  v1 = (void *)shared_ht_log_handle___ht_log_handle;
  shared_ht_log_handle___ht_log_handle = (uint64_t)v0;

}

double __timebaseConversionFactor_block_invoke()
{
  double result;
  mach_timebase_info info;

  info = 0;
  mach_timebase_info(&info);
  result = (float)((float)((float)info.numer * 0.000001) / (float)info.denom);
  *(double *)&timebaseConversionFactor_timebaseConversion = result;
  return result;
}

void __alwaysOnSignpost_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.hangtracer", "always_on_hang");
  v1 = (void *)alwaysOnSignpost_signpostLog;
  alwaysOnSignpost_signpostLog = (uint64_t)v0;

}

id HTGetHomeDirectoryURL()
{
  void *v0;
  void *v1;

  NSHomeDirectoryForUser(CFSTR("mobile"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  if (v0)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v0, 1);
    v1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v1 = 0;
  }

  return v1;
}

__CFString *exitNamespaceString(unsigned int a1)
{
  if (a1 < 0x2A)
    return off_1E5FA9A08[(char)a1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

__CFString *exitNamespaceDisplayString(unsigned int a1)
{
  char v1;
  void *v2;
  __CFString *v3;

  v1 = a1 - 4;
  if (a1 - 4 < 0x26 && ((0x3789044BDDuLL >> v1) & 1) != 0)
  {
    v3 = off_1E5FA9B58[v1];
  }
  else
  {
    exitNamespaceString(a1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "capitalizedString");
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

__CFString *exitReasonStringForNamespaceSignal(uint64_t a1)
{
  if ((a1 - 1) < 0x1F)
    return off_1E5FA9C88[(int)a1 - 1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SIG%d"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

__CFString *exitReasonStringForNamespaceJetsam(uint64_t a1)
{
  if (a1 < 0x10)
    return off_1E5FA9D80[(int)a1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

__CFString *exitReasonDisplayStringForNamespaceJetsam(uint64_t a1)
{
  int v1;
  void *v2;
  __CFString *v3;

  v1 = a1 - 2;
  if ((a1 - 2) < 0xE && ((0x2655u >> v1) & 1) != 0)
  {
    v3 = off_1E5FA9E00[v1];
  }
  else
  {
    exitReasonStringForNamespaceJetsam(a1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "capitalizedString");
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

__CFString *exitReasonStringForNamespaceSpringBoard(uint64_t a1)
{
  __CFString *v1;

  if (a1 > 3221229822)
  {
    if (a1 <= 3306925314)
    {
      switch(a1)
      {
        case 3221229823:
          return CFSTR("thermal pressure");
        case 3306925313:
          return CFSTR("cpu violation");
        case 3306925314:
          return CFSTR("walltime violation");
      }
    }
    else if (a1 > 3735943696)
    {
      if (a1 == 3735943697)
        return CFSTR("user quit");
      if (a1 == 4227595259)
        return CFSTR("force quit");
    }
    else
    {
      if (a1 == 3306925315)
        return CFSTR("system busy");
      if (a1 == 3735883980)
        return CFSTR("resource exclusion");
    }
    goto LABEL_36;
  }
  if (a1 <= 1539435072)
  {
    switch(a1)
    {
      case 95805101:
        return CFSTR("application assertion");
      case 439025681:
        return CFSTR("input ui scene");
      case 732775916:
        return CFSTR("secure draw violation");
    }
    goto LABEL_36;
  }
  if (a1 > 1539435076)
  {
    if (a1 == 1539435077)
      return CFSTR("legacy clear the board");
    if (a1 == 2343432205)
      return CFSTR("watchdog");
    goto LABEL_36;
  }
  if (a1 == 1539435073)
    return CFSTR("languages changed");
  if (a1 != 1539435076)
  {
LABEL_36:
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%#llx"), a1);
    v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
    return v1;
  }
  v1 = CFSTR("clear the board");
  return v1;
}

__CFString *exitReasonDisplayStringForNamespaceSpringBoard(uint64_t a1)
{
  __CFString *v1;
  void *v2;

  if (a1 > 1539435076)
  {
    if (a1 == 1539435077)
    {
      v1 = CFSTR("Legacy Clear the Board");
      return v1;
    }
    if (a1 == 3306925313)
    {
      v1 = CFSTR("CPU Violation");
      return v1;
    }
LABEL_8:
    exitReasonStringForNamespaceSpringBoard(a1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "capitalizedString");
    v1 = (__CFString *)objc_claimAutoreleasedReturnValue();

    return v1;
  }
  if (a1 == 439025681)
  {
    v1 = CFSTR("InputUI Scene");
    return v1;
  }
  if (a1 != 1539435076)
    goto LABEL_8;
  v1 = CFSTR("Clear the Board");
  return v1;
}

__CFString *exitReasonStringForNamespaceCodeSigning(uint64_t a1)
{
  if ((a1 - 1) < 4)
    return off_1E5FA9E70[(int)a1 - 1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

id exitReasonDisplayStringForNamespaceCodeSigning(uint64_t a1)
{
  void *v1;
  void *v2;

  exitReasonStringForNamespaceCodeSigning(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "capitalizedString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

__CFString *exitReasonStringForNamespaceExec(uint64_t a1)
{
  if ((a1 - 1) < 0x13)
    return off_1E5FA9E90[(int)a1 - 1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

__CFString *exitReasonDisplayStringForNamespaceExec(uint64_t a1)
{
  int v1;
  void *v2;
  __CFString *v3;

  v1 = a1 - 1;
  if ((a1 - 1) < 0x13 && ((0x55F7Fu >> v1) & 1) != 0)
  {
    v3 = off_1E5FA9F28[v1];
  }
  else
  {
    exitReasonStringForNamespaceExec(a1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "capitalizedString");
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

__CFString *exitReasonStringForNamespaceGuard(uint64_t a1)
{
  if ((a1 - 1) < 5)
    return off_1E5FA9FC0[(int)a1 - 1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

__CFString *exitReasonDisplayStringForNamespaceGuard(uint64_t a1)
{
  __CFString *v1;
  void *v2;

  if ((_DWORD)a1 == 5)
  {
    v1 = CFSTR("JIT");
  }
  else
  {
    exitReasonStringForNamespaceGuard(a1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "capitalizedString");
    v1 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  return v1;
}

__CFString *exitReasonStringForNamespaceLibXPC(uint64_t a1)
{
  if ((a1 - 1) < 9)
    return off_1E5FA9FE8[(int)a1 - 1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%u"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

__CFString *exitReasonDisplayStringForNamespaceLibXPC(uint64_t a1)
{
  __CFString *v1;
  void *v2;

  switch((_DWORD)a1)
  {
    case 2:
      v1 = CFSTR("Unknown IPC");
      break;
    case 6:
      v1 = CFSTR("Sandbox Filtered IPC");
      break;
    case 4:
      v1 = CFSTR("SIGTERM Timeout");
      break;
    default:
      exitReasonStringForNamespaceLibXPC(a1);
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "capitalizedString");
      v1 = (__CFString *)objc_claimAutoreleasedReturnValue();

      break;
  }
  return v1;
}

__CFString *exitReasonStringForNamespaceDYLD(uint64_t a1)
{
  uint64_t v1;
  __CFString *v2;

  v1 = a1 - 1;
  if ((unint64_t)(a1 - 1) < 9 && ((0x17Fu >> v1) & 1) != 0)
  {
    v2 = off_1E5FAA030[v1];
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%llu"), a1);
    v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

__CFString *exitReasonDisplayStringForNamespaceDYLD(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  __CFString *v3;

  v1 = a1 - 1;
  if ((unint64_t)(a1 - 1) < 7 && ((0x47u >> v1) & 1) != 0)
  {
    v3 = off_1E5FAA078[v1];
  }
  else
  {
    exitReasonStringForNamespaceDYLD(a1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "capitalizedString");
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

__CFString *exitReasonStringForNamespaceRunningBoard(uint64_t a1)
{
  __CFString *v1;

  if (a1 <= 2343432204)
  {
    if (a1 <= 562215633)
    {
      if (a1)
      {
        if (a1 == 97132013)
        {
          return CFSTR("conditions changed");
        }
        else
        {
          if (a1 != 562215597)
            goto LABEL_37;
          return CFSTR("assertion timeout");
        }
      }
      else
      {
        return CFSTR("none");
      }
    }
    else if (a1 > 562215635)
    {
      if (a1 == 562215636)
      {
        return CFSTR("background fetch completion timeout");
      }
      else
      {
        if (a1 != 732775916)
          goto LABEL_37;
        return CFSTR("security violation");
      }
    }
    else if (a1 == 562215634)
    {
      return CFSTR("background task assertion timeout");
    }
    else
    {
      return CFSTR("background url session completion timeout");
    }
  }
  else if (a1 > 3490524076)
  {
    if (a1 > 3735905537)
    {
      if (a1 == 3735905538)
      {
        return CFSTR("termination assertion");
      }
      else
      {
        if (a1 != 3735943697)
          goto LABEL_37;
        return CFSTR("user initiated quit");
      }
    }
    else if (a1 == 3490524077)
    {
      return CFSTR("max assertions violation");
    }
    else
    {
      if (a1 != 3735883980)
        goto LABEL_37;
      return CFSTR("resource exclusion");
    }
  }
  else if (a1 > 2970726672)
  {
    if (a1 == 2970726673)
    {
      return CFSTR("process exited");
    }
    else
    {
      if (a1 != 3221229823)
        goto LABEL_37;
      return CFSTR("thermal pressure");
    }
  }
  else
  {
    if (a1 != 2343432205)
    {
      if (a1 == 2970405393)
      {
        v1 = CFSTR("max states violation");
        return v1;
      }
LABEL_37:
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%#llx"), a1);
      v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
      return v1;
    }
    return CFSTR("watchdog violation");
  }
}

__CFString *exitReasonDisplayStringForNamespaceRunningBoard(uint64_t a1)
{
  __CFString *v1;
  void *v2;

  if (a1 <= 2970405392)
  {
    if (!a1)
    {
      v1 = CFSTR("None Provided");
      return v1;
    }
    if (a1 == 562215635)
    {
      v1 = CFSTR("Background URL Session Completion Timeout");
      return v1;
    }
LABEL_12:
    exitReasonStringForNamespaceRunningBoard(a1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "capitalizedString");
    v1 = (__CFString *)objc_claimAutoreleasedReturnValue();

    return v1;
  }
  if (a1 == 2970405393)
  {
    v1 = CFSTR("Maximum States Violation");
    return v1;
  }
  if (a1 == 3490524077)
  {
    v1 = CFSTR("Maximum Assertions Violation");
    return v1;
  }
  if (a1 != 3735943697)
    goto LABEL_12;
  v1 = CFSTR("User-Initiated Quit");
  return v1;
}

__CFString *exitReasonStringForNamespaceLibSystem(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) < 5)
    return off_1E5FAA0B0[a1 - 1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%llu"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

__CFString *exitReasonDisplayStringForNamespaceLibSystem(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  __CFString *v3;

  v1 = a1 - 1;
  if ((unint64_t)(a1 - 1) < 5 && ((0x1Du >> v1) & 1) != 0)
  {
    v3 = off_1E5FAA0D8[v1];
  }
  else
  {
    exitReasonStringForNamespaceLibSystem(a1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "capitalizedString");
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

__CFString *exitReasonStringForNamespaceEndpointSecurity(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) < 3)
    return off_1E5FAA100[a1 - 1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%llu"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

id exitReasonDisplayStringForNamespaceEndpointSecurity(uint64_t a1)
{
  void *v1;
  void *v2;

  exitReasonStringForNamespaceEndpointSecurity(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "capitalizedString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

__CFString *exitReasonStringForNamespaceWatchdog(uint64_t a1)
{
  __CFString *v1;

  switch(a1)
  {
    case 1:
      return CFSTR("service timeout");
    case 1001:
      return CFSTR("chronokit");
    case 2:
      v1 = CFSTR("timeout no diags");
      break;
    default:
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%llu"), a1);
      v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
      break;
  }
  return v1;
}

__CFString *exitReasonDisplayStringForNamespaceWatchdog(uint64_t a1)
{
  __CFString *v1;
  void *v2;

  if (a1 == 2)
  {
    v1 = CFSTR("Service Timeout Diagnostics Unavailable");
  }
  else if (a1 == 1001)
  {
    v1 = CFSTR("ChronoKit");
  }
  else
  {
    exitReasonStringForNamespaceWatchdog(a1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "capitalizedString");
    v1 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  return v1;
}

__CFString *exitReasonStringForNamespaceWatchKit(uint64_t a1)
{
  __CFString *v1;

  if (a1 == 1)
    return CFSTR("api violation");
  if (a1 == 2)
  {
    v1 = CFSTR("internal error");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%llu"), a1);
    v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v1;
}

__CFString *exitReasonDisplayStringForNamespaceWatchKit(uint64_t a1)
{
  __CFString *v1;
  void *v2;

  if (a1 == 1)
  {
    v1 = CFSTR("API Violation");
  }
  else
  {
    exitReasonStringForNamespaceWatchKit(a1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "capitalizedString");
    v1 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  return v1;
}

__CFString *exitReasonStringForNamespaceBacklightServices(uint64_t a1)
{
  uint64_t v1;
  __CFString *v2;

  v1 = a1 - 1;
  if ((unint64_t)(a1 - 1) < 0x15 && ((0x183FFFu >> v1) & 1) != 0)
  {
    v2 = off_1E5FAA118[v1];
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%llu"), a1);
    v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

__CFString *exitReasonDisplayStringForNamespaceBacklightServices(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  __CFString *v3;

  v1 = a1 - 11;
  if ((unint64_t)(a1 - 11) < 0xB && ((0x60Fu >> v1) & 1) != 0)
  {
    v3 = off_1E5FAA1C0[v1];
  }
  else
  {
    exitReasonStringForNamespaceBacklightServices(a1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "capitalizedString");
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

id exitReasonString(int a1, uint64_t a2)
{
  void *v2;

  switch(a1)
  {
    case 1:
      exitReasonStringForNamespaceJetsam(a2);
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 2:
      exitReasonStringForNamespaceSignal(a2);
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 3:
      exitReasonStringForNamespaceCodeSigning(a2);
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 6:
      exitReasonStringForNamespaceDYLD(a2);
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 7:
      exitReasonStringForNamespaceLibXPC(a2);
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 9:
      exitReasonStringForNamespaceExec(a2);
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 10:
      exitReasonStringForNamespaceSpringBoard(a2);
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 15:
      exitReasonStringForNamespaceRunningBoard(a2);
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 18:
      exitReasonDisplayStringForNamespaceLibSystem(a2);
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 20:
      exitReasonStringForNamespaceWatchdog(a2);
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 22:
      exitReasonStringForNamespaceWatchKit(a2);
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 23:
      exitReasonStringForNamespaceGuard(a2);
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 27:
      exitReasonStringForNamespaceEndpointSecurity(a2);
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 32:
      exitReasonStringForNamespaceBacklightServices(a2);
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%llu"), a2);
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      break;
  }
  return v2;
}

id exitReasonDisplayString(int a1, uint64_t a2)
{
  void *v2;

  switch(a1)
  {
    case 1:
      exitReasonDisplayStringForNamespaceJetsam(a2);
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 2:
      exitReasonStringForNamespaceSignal(a2);
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 3:
      exitReasonDisplayStringForNamespaceCodeSigning(a2);
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 6:
      exitReasonDisplayStringForNamespaceDYLD(a2);
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 7:
      exitReasonDisplayStringForNamespaceLibXPC(a2);
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 9:
      exitReasonDisplayStringForNamespaceExec(a2);
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 10:
      exitReasonDisplayStringForNamespaceSpringBoard(a2);
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 15:
      exitReasonDisplayStringForNamespaceRunningBoard(a2);
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 18:
      exitReasonDisplayStringForNamespaceLibSystem(a2);
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 20:
      exitReasonDisplayStringForNamespaceWatchdog(a2);
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 22:
      exitReasonDisplayStringForNamespaceWatchKit(a2);
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 23:
      exitReasonDisplayStringForNamespaceGuard(a2);
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 27:
      exitReasonDisplayStringForNamespaceEndpointSecurity(a2);
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 32:
      exitReasonDisplayStringForNamespaceBacklightServices(a2);
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%#llx"), a2);
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      break;
  }
  return v2;
}

void OUTLINED_FUNCTION_0(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x20u);
}

void HTEndNonResponsiveTask(os_signpost_id_t a1)
{
  uint64_t v2;

  v2 = mach_absolute_time();
  HTEndNonResponsiveTaskAtTime(a1, v2);
}

id HTPrefsQueue()
{
  if (HTPrefsQueue_onceToken != -1)
    dispatch_once(&HTPrefsQueue_onceToken, &__block_literal_global_68);
  return (id)HTPrefsQueue__htPrefsQueue;
}

uint64_t HTStartHangTracing(uint64_t a1)
{
  return HTHangEventCreate(a1);
}

uint64_t HTAllowAnyThread(uint64_t result)
{
  if (result)
    *(_QWORD *)(result + 32) = -1;
  return result;
}

os_signpost_id_t HTBeginNonResponsiveTaskWithNameAndExpirationAtTime(const char *a1, unint64_t a2, double a3)
{
  return _HTBeginNonResponsiveAssertionAtStartTime(a1, a2, 0, 0, a3);
}

os_signpost_id_t _HTBeginNonResponsiveAssertionAtStartTime(const char *a1, unint64_t a2, int a3, int a4, double a5)
{
  NSObject *v10;
  uint64_t v11;
  os_signpost_id_t v12;
  double v13;
  NSObject *v14;
  int v15;
  uint64_t v16;
  os_signpost_id_t *v17;
  unint64_t v18;
  uint64_t v19;
  NSObject *v20;
  uint64_t v21;
  NSObject *v22;
  _BOOL4 v23;
  NSObject *v24;
  NSObject *v25;
  uint8_t buf[4];
  double v28;
  __int16 v29;
  double v30;
  __int16 v31;
  _BYTE v32[10];
  uint64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  shared_ht_log_handle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315906;
    v28 = *(double *)&a1;
    v29 = 2048;
    v30 = a5;
    v31 = 1024;
    *(_DWORD *)v32 = a3;
    *(_WORD *)&v32[4] = 1024;
    *(_DWORD *)&v32[6] = a4;
    _os_log_debug_impl(&dword_1AF62F000, v10, OS_LOG_TYPE_DEBUG, "name=%s timeout=%f screenOffAssertion=%{BOOL}i noTimeout=%{BOOL}i", buf, 0x22u);
  }

  if (GetSharedPage_onceToken != -1)
    dispatch_once(&GetSharedPage_onceToken, &__block_literal_global_67);
  v11 = GetSharedPage__sharedPage;
  if (!GetSharedPage__sharedPage)
    return 0;
  v12 = *(_QWORD *)(GetSharedPage__sharedPage + 4128);
  *(_QWORD *)(GetSharedPage__sharedPage + 4128) = v12 + 1;
  v13 = a5;
  if (a5 > 120.0)
  {
    shared_ht_log_handle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218240;
      v28 = a5;
      v29 = 2048;
      v30 = 120.0;
      _os_log_impl(&dword_1AF62F000, v14, OS_LOG_TYPE_DEFAULT, "HTAssertion: desired timeout (%f) is greater than max allowed timeout (%f), using max allowed timeout", buf, 0x16u);
    }

    v13 = 120.0;
  }
  v15 = *(_DWORD *)(v11 + 4120);
  *(_DWORD *)(v11 + 4120) = (v15 + 1) % 10;
  v16 = v11 + 104 * v15;
  v17 = (os_signpost_id_t *)(v16 + 3080);
  *(_QWORD *)(v16 + 3080) = 0;
  *(_QWORD *)(v16 + 3088) = a2;
  v18 = -1;
  *(_QWORD *)(v16 + 3104) = -1;
  *(_BYTE *)(v16 + 3176) = a3;
  if ((a4 & 1) == 0)
    v18 = (unint64_t)(SEC_TO_MATU(v13) + (double)a2);
  v19 = v11 + 104 * v15;
  *(_QWORD *)(v19 + 3096) = v18;
  strncpy((char *)(v19 + 3112), a1, 0x3FuLL);
  *(_BYTE *)(v19 + 3175) = 0;
  *v17 = v12;
  shared_ht_log_handle();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    v21 = *(_QWORD *)(v19 + 3096);
    *(_DWORD *)buf = 134218754;
    v28 = *(double *)&v12;
    v29 = 2080;
    *(_QWORD *)&v30 = v19 + 3112;
    v31 = 2048;
    *(_QWORD *)v32 = a2;
    *(_WORD *)&v32[8] = 2048;
    v33 = v21;
    _os_log_impl(&dword_1AF62F000, v20, OS_LOG_TYPE_DEFAULT, "HTAssertion: HTBeginAssertion: track assertionId=%llu assertionname=(%s) starttime=%llu expirationTime=%llu", buf, 0x2Au);
  }

  assertionSignpost();
  v22 = objc_claimAutoreleasedReturnValue();
  v23 = os_signpost_enabled(v22);

  if (v23)
  {
    assertionSignpost();
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = v24;
    if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
    {
      *(_DWORD *)buf = 136446466;
      *(_QWORD *)&v28 = v19 + 3112;
      v29 = 2050;
      v30 = v13;
      _os_signpost_emit_with_name_impl(&dword_1AF62F000, v25, OS_SIGNPOST_INTERVAL_BEGIN, v12, "HTNonResponsiveTaskAssertion", "name=%{public, signpost.description:attribute}s appliedTimeoutSecs=%{public, signpost.telemetry:number1}f", buf, 0x16u);
    }

  }
  AnalyticsSendEventLazy();
  return v12;
}

os_signpost_id_t HTBeginNonResponsiveTaskWithNameAndExpiration(const char *a1, double a2)
{
  uint64_t v4;

  v4 = mach_absolute_time();
  return _HTBeginNonResponsiveAssertionAtStartTime(a1, v4, 0, 0, a2);
}

void HTEndNonResponsiveTaskAtTime(os_signpost_id_t a1, uint64_t a2)
{
  uint64_t v4;
  int v5;
  NSObject *v6;
  int v7;
  int v8;
  int v9;
  uint64_t v10;
  unint64_t *v11;
  uint64_t v12;
  NSObject *v13;
  unint64_t v14;
  unint64_t *v15;
  unint64_t v16;
  NSObject *v17;
  double v18;
  NSObject *v19;
  _BOOL4 v20;
  unint64_t v21;
  NSObject *v22;
  NSObject *v23;
  const char *v24;
  NSObject *v25;
  os_signpost_id_t v26;
  uint32_t v27;
  NSObject *v28;
  uint64_t v29;
  uint8_t buf[4];
  os_signpost_id_t v31;
  __int16 v32;
  uint64_t v33;
  __int16 v34;
  double v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    if (GetSharedPage_onceToken != -1)
      dispatch_once(&GetSharedPage_onceToken, &__block_literal_global_67);
    v4 = GetSharedPage__sharedPage;
    if (GetSharedPage__sharedPage)
    {
      if (*(_QWORD *)(GetSharedPage__sharedPage + 4128))
      {
        if (*(_DWORD *)(GetSharedPage__sharedPage + 4120))
          v5 = *(_DWORD *)(GetSharedPage__sharedPage + 4120) - 1;
        else
          v5 = 9;
        v7 = 0;
        while (1)
        {
          v8 = (v5 + v7) % 10;
          if (*(_QWORD *)(GetSharedPage__sharedPage + 104 * v8 + 3080) == a1)
            break;
          if (++v7 == 10)
          {
            shared_ht_log_handle();
            v6 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
              HTEndNonResponsiveTaskAtTime_cold_2();
            goto LABEL_16;
          }
        }
        v9 = (v5 + v7) % 10;
        v10 = GetSharedPage__sharedPage + 104 * v8;
        v11 = (unint64_t *)(v10 + 3104);
        *(_QWORD *)(v10 + 3104) = a2;
        v12 = v10 + 3112;
        shared_ht_log_handle();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218498;
          v31 = a1;
          v32 = 2080;
          v33 = v12;
          v34 = 2048;
          v35 = *(double *)&a2;
          _os_log_impl(&dword_1AF62F000, v13, OS_LOG_TYPE_DEFAULT, "HTAssertions: HTEndAssertion: update assertionId=%llu assertionname=(%s) endTime is now=%llu", buf, 0x20u);
        }

        v14 = *v11;
        v15 = (unint64_t *)(v4 + 104 * v9 + 3096);
        v16 = *v15;
        if (*v11 > *v15)
        {
          shared_ht_log_handle();
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            v18 = MATU_TO_MS(*v11 - *v15);
            *(_DWORD *)buf = 134218498;
            v31 = a1;
            v32 = 2080;
            v33 = v12;
            v34 = 2048;
            v35 = v18;
            _os_log_impl(&dword_1AF62F000, v17, OS_LOG_TYPE_DEFAULT, "HTAssertions: HTEndAssertion: assertionId=%llu assertionname=(%s) missed timeout (endTime was %fms after timeout)!", buf, 0x20u);
          }

        }
        assertionSignpost();
        v19 = objc_claimAutoreleasedReturnValue();
        v20 = os_signpost_enabled(v19);

        if (!v20)
        {
LABEL_33:
          AnalyticsSendEventLazy();
          return;
        }
        if (v14 <= v16)
        {
          assertionSignpost();
          v28 = objc_claimAutoreleasedReturnValue();
          v23 = v28;
          if (a1 == -1 || !os_signpost_enabled(v28))
            goto LABEL_32;
          *(_DWORD *)buf = 67240192;
          LODWORD(v31) = 0;
          v24 = "missedTimeout=%{public, signpost.telemetry:number2}i";
          v25 = v23;
          v26 = a1;
          v27 = 8;
        }
        else
        {
          v29 = mach_continuous_time();
          v21 = *v15;
          assertionSignpost();
          v22 = objc_claimAutoreleasedReturnValue();
          v23 = v22;
          if (a1 == -1 || !os_signpost_enabled(v22))
            goto LABEL_32;
          *(_DWORD *)buf = 134349312;
          v31 = v29 - a2 + v21;
          v32 = 1026;
          LODWORD(v33) = 1;
          v24 = "%{public, signpost.description:end_time}llu missedTimeout=%{public, signpost.telemetry:number2}i";
          v25 = v23;
          v26 = a1;
          v27 = 18;
        }
        _os_signpost_emit_with_name_impl(&dword_1AF62F000, v25, OS_SIGNPOST_INTERVAL_END, v26, "HTNonResponsiveTaskAssertion", v24, buf, v27);
LABEL_32:

        goto LABEL_33;
      }
      shared_ht_log_handle();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
        HTEndNonResponsiveTaskAtTime_cold_1();
LABEL_16:

    }
  }
}

id HTConnectionQueue()
{
  if (HTConnectionQueue_onceToken != -1)
    dispatch_once(&HTConnectionQueue_onceToken, &__block_literal_global_102);
  return (id)HTConnectionQueue__htConnectionQueue;
}

uint64_t ht_fence_timeout(uint64_t a1)
{
  void *v2;
  char v3;
  void *v4;
  char v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  _QWORD block[7];
  uint8_t buf[4];
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (setupPrefs_onceToken != -1)
    dispatch_once(&setupPrefs_onceToken, &__block_literal_global_96);
  +[HTPrefs sharedPrefs](HTPrefs, "sharedPrefs");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hangtracerDaemonEnabled");

  if ((v3 & 1) == 0)
  {
    shared_ht_log_handle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      ht_fence_timeout_cold_3();
    goto LABEL_26;
  }
  +[HTPrefs sharedPrefs](HTPrefs, "sharedPrefs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "fenceTrackingEnabled");

  if ((v5 & 1) == 0)
  {
    shared_ht_log_handle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      ht_fence_timeout_cold_2();
    goto LABEL_26;
  }
  v6 = mach_absolute_time();
  shared_ht_log_handle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218240;
    v17 = a1;
    v18 = 2048;
    v19 = v6;
    _os_log_impl(&dword_1AF62F000, v7, OS_LOG_TYPE_DEFAULT, "HT CA Fence Tracking: ca fence blown, fence=%llu blown_timestamp=%llu", buf, 0x16u);
  }

  connectToHangTracer();
  if (!__recentCAFences)
  {
    shared_ht_log_handle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AF62F000, v10, OS_LOG_TYPE_DEFAULT, "HT CA Fence Tracking: recent fence array has not been malloc'ed yet", buf, 2u);
    }
    goto LABEL_26;
  }
  if (__nextFenceIndex)
    LODWORD(v8) = __nextFenceIndex - 1;
  else
    LODWORD(v8) = 24;
  if (*(_QWORD *)(__recentCAFences + 16 * (int)v8) == a1)
  {
    v8 = (int)v8;
  }
  else
  {
    v8 = 0;
    v12 = (uint64_t *)__recentCAFences;
    while (1)
    {
      v13 = *v12;
      v12 += 2;
      if (v13 == a1)
        break;
      if (++v8 == 25)
        goto LABEL_24;
    }
  }
  v9 = *(_QWORD *)(__recentCAFences + 16 * v8 + 8);
  if (v9 == -1)
  {
LABEL_24:
    shared_ht_log_handle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      ht_fence_timeout_cold_1();
LABEL_26:
    v11 = 0;
    goto LABEL_27;
  }
  HTConnectionQueue();
  v10 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __ht_fence_timeout_block_invoke;
  block[3] = &__block_descriptor_56_e5_v8__0l;
  block[4] = a1;
  block[5] = v9;
  block[6] = v6;
  dispatch_async(v10, block);
  v11 = 1;
LABEL_27:

  return v11;
}

void __ht_fence_timeout_block_invoke(uint64_t *a1)
{
  xpc_object_t v2;
  uint64_t i;
  xpc_object_t v4[4];
  char *keys[2];
  __int128 v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (hangTracerConnection)
  {
    *(_OWORD *)keys = xmmword_1E5FAA3D8;
    v6 = *(_OWORD *)off_1E5FAA3E8;
    v4[0] = xpc_int64_create(10);
    v4[1] = xpc_uint64_create(a1[4]);
    v4[2] = xpc_uint64_create(a1[5]);
    v4[3] = xpc_uint64_create(a1[6]);
    v2 = xpc_dictionary_create((const char *const *)keys, v4, 4uLL);
    xpc_connection_send_message((xpc_connection_t)hangTracerConnection, v2);

    for (i = 3; i != -1; --i)
  }
}

void HTCollectHangLogsBundle(void *a1, char a2)
{
  id v3;
  id v4;
  void *v5;
  NSObject *v6;
  _QWORD v7[4];
  id v8;
  char v9;

  v3 = a1;
  connectToHangTracer();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __HTCollectHangLogsBundle_block_invoke;
  v7[3] = &unk_1E5FAA438;
  v8 = v3;
  v9 = a2;
  v4 = v3;
  v5 = (void *)MEMORY[0x1B5DF9E70](v7);
  HTConnectionQueue();
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_sync(v6, v5);

}

void HTReportHangLogsProcessed(void *a1)
{
  id v1;
  id v2;
  void *v3;
  NSObject *v4;
  _QWORD v5[4];
  id v6;

  v1 = a1;
  connectToHangTracer();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __HTReportHangLogsProcessed_block_invoke;
  v5[3] = &unk_1E5FAA390;
  v6 = v1;
  v2 = v1;
  v3 = (void *)MEMORY[0x1B5DF9E70](v5);
  HTConnectionQueue();
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_sync(v4, v3);

}

void HTCheckForHangForHTMonitor(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  int v5;
  _DWORD v6[2];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  shared_ht_log_handle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = *(_DWORD *)(a1 + 48);
    v6[0] = 67109120;
    v6[1] = v5;
    _os_log_impl(&dword_1AF62F000, v4, OS_LOG_TYPE_INFO, "HTCheckForHangForHTMonitor: check hang for  pid=%u ", (uint8_t *)v6, 8u);
  }

  checkForHangWithUserMovedAwayAndRecentAssertions(a1, 1, a2);
}

void HTTestingResetNumOfHangEventsInSharedPage()
{
  NSObject *v0;

  if (GetSharedPage_onceToken != -1)
    dispatch_once(&GetSharedPage_onceToken, &__block_literal_global_67);
  if (GetSharedPage__sharedPage && *(_DWORD *)(GetSharedPage__sharedPage + 4) == 8)
  {
    *(_DWORD *)(GetSharedPage__sharedPage + 4) = 0;
    shared_ht_log_handle();
    v0 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG))
      HTTestingResetNumOfHangEventsInSharedPage_cold_1();

  }
}

void __handleSettingChange_block_invoke_2()
{
  xpc_object_t v0;
  xpc_object_t values;
  char *keys[2];

  keys[1] = *(char **)MEMORY[0x1E0C80C00];
  if (hangTracerConnection)
  {
    keys[0] = "command";
    values = xpc_int64_create(2);
    v0 = xpc_dictionary_create((const char *const *)keys, &values, 1uLL);
    xpc_connection_send_message((xpc_connection_t)hangTracerConnection, v0);

  }
}

void __setupPrefs_block_invoke()
{
  dispatch_queue_t v0;
  NSObject *v1;
  _QWORD block[4];
  dispatch_queue_t v3;

  v0 = dispatch_queue_create("com.apple.hangtracer.fencePrefs", 0);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __setupPrefs_block_invoke_2;
  block[3] = &unk_1E5FAA390;
  v3 = v0;
  v1 = v0;
  dispatch_async(v1, block);

}

void __setupPrefs_block_invoke_2(uint64_t a1)
{
  id v2;

  +[HTPrefs sharedPrefs](HTPrefs, "sharedPrefs");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setupPrefsWithQueue:", *(_QWORD *)(a1 + 32));

}

id __checkForHangWithUserMovedAwayAndRecentAssertions_block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  _QWORD v7[4];
  _QWORD v8[5];

  v8[4] = *MEMORY[0x1E0C80C00];
  v8[0] = kHTCoreAnalyticsDaemonEnabled;
  v7[0] = kHTCoreAnalyticsMode;
  v7[1] = kHTCoreAnalyticsHangType;
  getStringForSubtype(*(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v8[1] = v2;
  v8[2] = v3;
  v7[2] = kHTCoreAnalyticsHangBundleID;
  v7[3] = kHTCoreAnalyticsHangDuration;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 48));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[3] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

void __checkForHangWithUserMovedAwayAndRecentAssertions_block_invoke_124(uint64_t a1)
{
  xpc_object_t v2;
  const __CFData *v3;
  const UInt8 *BytePtr;
  size_t Length;
  xpc_object_t v6;
  uint64_t i;
  const void *v8;
  xpc_object_t values[9];
  char *keys[2];
  __int128 v11;
  __int128 v12;
  __int128 v13;
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (hangTracerConnection)
  {
    v12 = xmmword_1E5FAA678;
    v13 = *(_OWORD *)off_1E5FAA688;
    v14 = "saveMicroHang";
    *(_OWORD *)keys = xmmword_1E5FAA658;
    v11 = *(_OWORD *)&off_1E5FAA668;
    values[0] = xpc_int64_create(*(_QWORD *)(a1 + 32));
    values[1] = xpc_string_create(*(const char **)(a1 + 40));
    values[2] = xpc_int64_create(*(_QWORD *)(a1 + 48));
    values[3] = xpc_int64_create(*(_QWORD *)(a1 + 56));
    values[4] = xpc_int64_create(*(_QWORD *)(a1 + 64));
    values[5] = xpc_BOOL_create(*(_BYTE *)(a1 + 96) != 0);
    values[6] = xpc_int64_create(*(_QWORD *)(a1 + 72));
    values[7] = xpc_int64_create(*(int *)(*(_QWORD *)(a1 + 80) + 48));
    values[8] = xpc_BOOL_create(*(_BYTE *)(a1 + 97));
    v2 = xpc_dictionary_create((const char *const *)keys, values, 9uLL);
    v3 = *(const __CFData **)(a1 + 88);
    if (v3)
    {
      BytePtr = CFDataGetBytePtr(v3);
      Length = CFDataGetLength(*(CFDataRef *)(a1 + 88));
      v6 = xpc_data_create(BytePtr, Length);
      xpc_dictionary_set_value(v2, "userActionData", v6);

    }
    xpc_connection_send_message((xpc_connection_t)hangTracerConnection, v2);

    for (i = 8; i != -1; --i)
  }
  v8 = *(const void **)(a1 + 88);
  if (v8)
    CFRelease(v8);
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_3_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 2u);
}

id HTPrefsKeysToRestoreForPrefix(void *a1)
{
  void *v1;
  _QWORD v3[3];

  v3[2] = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a1, "isEqualToString:", CFSTR("HTThirdPartyDevSupport")))
  {
    v3[0] = CFSTR("HangTracerHUDThresholdMSec");
    v3[1] = CFSTR("HangTracerThirdPartyHangThreshold");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 2);
    v1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v1 = (void *)MEMORY[0x1E0C9AA60];
  }
  return v1;
}

id pathForPid()
{
  int v0;
  void *v1;
  NSObject *v2;
  _BYTE buffer[4096];
  uint64_t v5;

  v0 = MEMORY[0x1E0C80A78]();
  v5 = *MEMORY[0x1E0C80C00];
  bzero(buffer, 0x1000uLL);
  if (proc_pidpath(v0, buffer, 0x1000u))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", buffer);
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v1)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", buffer, 1);
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      shared_ht_log_handle();
      v2 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT))
        pathForPid_cold_1((uint64_t)v1, v2);

    }
  }
  else
  {
    v1 = 0;
  }
  return v1;
}

__CFString *bundleIDFromPath(void *a1)
{
  __CFString *v1;
  CFURLRef v2;
  CFURLRef v3;
  __CFBundle *v4;
  __CFBundle *v5;
  __CFString *v6;

  v1 = a1;
  if (v1 && (v2 = CFURLCreateWithFileSystemPath(0, v1, kCFURLPOSIXPathStyle, 1u)) != 0)
  {
    v3 = v2;
    v4 = (__CFBundle *)_CFBundleCreateWithExecutableURLIfLooksLikeBundle();
    if (v4)
    {
      v5 = v4;
      CFBundleGetIdentifier(v4);
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
      CFRelease(v5);
    }
    else
    {
      v6 = &stru_1E5FAD688;
    }
    CFRelease(v3);
  }
  else
  {
    v6 = &stru_1E5FAD688;
  }

  return v6;
}

id STYErrorWithCode(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0CB35C8];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", a2, *MEMORY[0x1E0CB2D50]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "errorWithDomain:code:userInfo:", CFSTR("SentryTailspinError"), a1, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t ensureDirectoryExists(void *a1, int a2)
{
  id v3;
  void *v4;
  BOOL v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  unsigned int v11;
  NSObject *v12;
  _BOOL4 v13;
  const char *v14;
  NSObject *v15;
  uint32_t v16;
  id v18;
  char v19;
  uint8_t buf[4];
  id v21;
  __int16 v22;
  id v23;
  uint64_t v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  v3 = a1;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0;
  if (objc_msgSend(v4, "fileExistsAtPath:isDirectory:", v3, &v19))
    v5 = v19 == 0;
  else
    v5 = 1;
  if (v5)
  {
    shared_ht_log_handle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v21 = v3;
      _os_log_impl(&dword_1AF62F000, v6, OS_LOG_TYPE_INFO, "Directory doesn't exist -> trying to create directory at path: %@", buf, 0xCu);
    }

    if (a2)
    {
      v24 = *MEMORY[0x1E0CB2A98];
      v25[0] = CFSTR("mobile");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, &v24, 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = 0;
    }
    v18 = 0;
    objc_msgSend(v4, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v3, 1, v7, &v18);
    v9 = v18;
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "fileExistsAtPath:isDirectory:", v3, &v19);

    if (v19)
      v8 = v11;
    else
      v8 = 0;
    shared_ht_log_handle();
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
    if ((_DWORD)v8 == 1)
    {
      if (v13)
      {
        *(_DWORD *)buf = 138412290;
        v21 = v3;
        v14 = "Successfully created directory at path %@";
        v15 = v12;
        v16 = 12;
LABEL_19:
        _os_log_impl(&dword_1AF62F000, v15, OS_LOG_TYPE_DEFAULT, v14, buf, v16);
      }
    }
    else if (v13)
    {
      *(_DWORD *)buf = 138412546;
      v21 = v3;
      v22 = 2112;
      v23 = v9;
      v14 = "Error: error creating directory at path %@ %@";
      v15 = v12;
      v16 = 22;
      goto LABEL_19;
    }

    goto LABEL_21;
  }
  v8 = 1;
LABEL_21:

  return v8;
}

void cleanupDiagnosticLogsDirectory(void *a1)
{
  id v1;
  void *v2;
  NSObject *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  char v12;
  id v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[4];
  uint64_t v23;
  __int16 v24;
  id v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  shared_ht_log_handle();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    cleanupDiagnosticLogsDirectory_cold_1((uint64_t)v1, v3);

  v16 = v1;
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v4, 0, 0, &__block_literal_global_1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v19 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
        v17 = 0;
        v12 = objc_msgSend(v2, "removeItemAtURL:error:", v11, &v17);
        v13 = v17;
        shared_ht_log_handle();
        v14 = objc_claimAutoreleasedReturnValue();
        v15 = v14;
        if ((v12 & 1) != 0)
        {
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v23 = v11;
            _os_log_debug_impl(&dword_1AF62F000, v15, OS_LOG_TYPE_DEBUG, "Successfully deleted file at %@", buf, 0xCu);
          }
        }
        else if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          v23 = v11;
          v24 = 2112;
          v25 = v13;
          _os_log_impl(&dword_1AF62F000, v15, OS_LOG_TYPE_DEFAULT, "Failed to delete file at %@ : %@", buf, 0x16u);
        }

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
    }
    while (v8);
  }

}

uint64_t __cleanupDiagnosticLogsDirectory_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  NSObject *v6;
  int v8;
  id v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v5 = a3;
  shared_ht_log_handle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412546;
    v9 = v4;
    v10 = 2112;
    v11 = v5;
    _os_log_impl(&dword_1AF62F000, v6, OS_LOG_TYPE_DEFAULT, "Failed to enumerate file at %@ : %@", (uint8_t *)&v8, 0x16u);
  }

  return 1;
}

void persistAndUnredactLogs()
{
  NSObject *v0;
  uint8_t v1[16];

  shared_ht_log_handle();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1AF62F000, v0, OS_LOG_TYPE_DEFAULT, "persistAndUnredactLogs not supported", v1, 2u);
  }

}

uint64_t getTimeBetweenAbsoluteAndContinuousTime()
{
  mach_get_times();
  return 0;
}

id legacySignpost()
{
  if (legacySignpost_onceToken != -1)
    dispatch_once(&legacySignpost_onceToken, &__block_literal_global_9);
  return (id)legacySignpost_signpostLog;
}

void __legacySignpost_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.hangtracer", "signpost_hang");
  v1 = (void *)legacySignpost_signpostLog;
  legacySignpost_signpostLog = (uint64_t)v0;

}

id tailspinConversionSignpost()
{
  if (tailspinConversionSignpost_onceToken != -1)
    dispatch_once(&tailspinConversionSignpost_onceToken, &__block_literal_global_14);
  return (id)tailspinConversionSignpost_signpostLog;
}

void __tailspinConversionSignpost_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.hangtracer", "hangreporter_tailspin_conversion");
  v1 = (void *)tailspinConversionSignpost_signpostLog;
  tailspinConversionSignpost_signpostLog = (uint64_t)v0;

}

id assertionSignpost()
{
  if (assertionSignpost_onceToken != -1)
    dispatch_once(&assertionSignpost_onceToken, &__block_literal_global_18);
  return (id)assertionSignpost_signpostLog;
}

void __assertionSignpost_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.hangtracer", "non_responsive_assertion");
  v1 = (void *)assertionSignpost_signpostLog;
  assertionSignpost_signpostLog = (uint64_t)v0;

}

__CFString *getStringForRequestType(unint64_t a1)
{
  if (a1 > 4)
    return CFSTR("Unknown");
  else
    return *off_1E5FAAE00[a1];
}

BOOL isFenceHang(uint64_t a1)
{
  return (unint64_t)(a1 - 3) < 3;
}

const __CFString *getTailspinCaptureFailReasonString(unint64_t a1)
{
  if (a1 > 0xE)
    return CFSTR("tailspin capture failed for unknown reason");
  else
    return off_1E5FAAE80[a1];
}

const __CFString *getSpindumpConversionFailReasonString(unint64_t a1)
{
  if (a1 > 0xB)
    return CFSTR("failed due to unknown reason");
  else
    return off_1E5FAAEF8[a1];
}

uint64_t getHTBugType(int a1, int a2, double a3)
{
  void *v4;
  double v5;
  void *v6;
  double v7;

  if (a1)
  {
    +[HTPrefs sharedPrefs](HTPrefs, "sharedPrefs");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (double)(unint64_t)objc_msgSend(v4, "runloopLongHangDurationThresholdMSec");

    if (v5 <= a3)
    {
      return 222;
    }
    else
    {
      +[HTPrefs sharedPrefs](HTPrefs, "sharedPrefs");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (double)(unint64_t)objc_msgSend(v6, "runloopHangDurationThresholdMSec");

      if (v7 <= a3)
        return 223;
      else
        return 310;
    }
  }
  else if (a2)
  {
    return 328;
  }
  else
  {
    return 228;
  }
}

uint64_t HTEventTypeFromServiceName(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if ((objc_msgSend(v1, "containsString:", CFSTR("UIKit-runloop")) & 1) != 0)
  {
    v2 = 0;
  }
  else if ((objc_msgSend(v1, "containsString:", CFSTR("Fence-hang")) & 1) != 0)
  {
    v2 = 1;
  }
  else if ((objc_msgSend(v1, "containsString:", CFSTR("Slow-Launch")) & 1) != 0)
  {
    v2 = 2;
  }
  else if ((objc_msgSend(v1, "containsString:", CFSTR("Sentry")) & 1) != 0)
  {
    v2 = 3;
  }
  else if (objc_msgSend(v1, "containsString:", CFSTR("Force-Quit")))
  {
    v2 = 4;
  }
  else
  {
    v2 = 5;
  }

  return v2;
}

uint64_t isM9Watch()
{
  void *v0;
  uint64_t v1;

  v0 = (void *)MGCopyAnswer();
  v1 = objc_msgSend(v0, "isEqualToString:", CFSTR("t8006"));

  return v1;
}

double getWallTimeForMachAbsTime(unint64_t a1)
{
  double v2;
  double v3;

  mach_get_times();
  v2 = (double)0 - *MEMORY[0x1E0C9ADF8] + (double)0 / 1000000000.0;
  v3 = MATU_TO_MS(0) / 1000.0;
  return v2 + MATU_TO_MS(a1) / 1000.0 - v3;
}

id getFirstHangInfoDict(void *a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  unint64_t v10;
  void *v11;
  id v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v2)
  {
    v3 = v2;
    v4 = 0;
    v5 = *(_QWORD *)v15;
    v6 = -1;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v15 != v5)
          objc_enumerationMutation(v1);
        v8 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("StartTime"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "longLongValue");

        if (v6 > v10)
        {
          objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("StartTime"));
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v6 = objc_msgSend(v11, "longLongValue");

          v12 = v8;
          v4 = v12;
        }
      }
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v3);
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

uint64_t HTGetNSDateFromMachAbsoluteTime(uint64_t a1, void *a2, unint64_t a3)
{
  double v5;
  double v6;

  objc_msgSend(a2, "timeIntervalSinceReferenceDate");
  v6 = MS_TO_MATU((unint64_t)(v5 * 1000.0));
  return objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", MATU_TO_SEC((unint64_t)(v6 - (double)a3) + a1));
}

BOOL checkForHUDUpdateForHangEvent(unint64_t a1, uint64_t a2, double *a3)
{
  unsigned int v3;
  unint64_t v5;
  double v6;
  double v7;
  _BOOL8 result;

  v3 = atomic_load((unsigned int *)(a2 + 24));
  result = 0;
  if (!v3)
  {
    v5 = *(_QWORD *)a2;
    v6 = MATU_TO_MS(a1);
    v7 = v6 - MATU_TO_MS(v5);
    *a3 = v7;
    if (v7 > 100.0)
      return 1;
  }
  return result;
}

double MATU_TO_SEC(unint64_t a1)
{
  if (timebaseConversionFactor_onceToken != -1)
    dispatch_once(&timebaseConversionFactor_onceToken, &__block_literal_global_2);
  return *(double *)&timebaseConversionFactor_timebaseConversion * (double)a1 / 1000.0;
}

double MS_TO_MATU(unint64_t a1)
{
  if (timebaseConversionFactor_onceToken != -1)
    dispatch_once(&timebaseConversionFactor_onceToken, &__block_literal_global_2);
  return (double)a1 / *(double *)&timebaseConversionFactor_timebaseConversion;
}

double SEC_TO_MATU(double a1)
{
  if (timebaseConversionFactor_onceToken != -1)
    dispatch_once(&timebaseConversionFactor_onceToken, &__block_literal_global_2);
  return (double)(unint64_t)(a1 * 1000.0) / *(double *)&timebaseConversionFactor_timebaseConversion;
}

uint64_t machTimebaseForLiveMachine()
{
  if (machTimebaseForLiveMachine_once != -1)
    dispatch_once(&machTimebaseForLiveMachine_once, &__block_literal_global_1);
  return machTimebaseForLiveMachine_timebase;
}

uint64_t __machTimebaseForLiveMachine_block_invoke()
{
  return mach_timebase_info((mach_timebase_info_t)&machTimebaseForLiveMachine_timebase);
}

uint64_t applyTailspinConfig()
{
  NSObject *v0;
  uint8_t v2[16];

  shared_ht_log_handle();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl(&dword_1AF62F000, v0, OS_LOG_TYPE_DEFAULT, "ApplyTailspinConfig: configureTailspin not supported", v2, 2u);
  }

  return 0;
}

uint64_t configureTailspinForSelfEnableConfig()
{
  NSObject *v0;
  uint8_t v2[16];

  shared_ht_log_handle();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl(&dword_1AF62F000, v0, OS_LOG_TYPE_DEFAULT, "configureTailspinForSelfEnableConfig not supported", v2, 2u);
  }

  return 0;
}

uint64_t configureTailspinForEPL()
{
  NSObject *v0;
  uint8_t v2[16];

  shared_ht_log_handle();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl(&dword_1AF62F000, v0, OS_LOG_TYPE_DEFAULT, "configureTailspinForEPL not supported", v2, 2u);
  }

  return 0;
}

uint64_t configureTailspinForThirdPartyDevelopment()
{
  NSObject *v0;
  uint8_t v2[16];

  shared_ht_log_handle();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl(&dword_1AF62F000, v0, OS_LOG_TYPE_DEFAULT, "configureTailspinForThirdPartyDevelopment not supported", v2, 2u);
  }

  return 0;
}

uint64_t HTTelemetryHasRunThisBoot()
{
  sem_t *v0;
  NSObject *v2;
  int v3;
  _DWORD v4[2];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v0 = sem_open("hangtelemetryd.onceatboot", 0);
  if (v0 == (sem_t *)-1)
  {
    if (*__error() == 2)
      return 0;
    shared_ht_log_handle();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v3 = *__error();
      v4[0] = 67109120;
      v4[1] = v3;
      _os_log_impl(&dword_1AF62F000, v2, OS_LOG_TYPE_DEFAULT, "sem_open() failed: %{errno}d", (uint8_t *)v4, 8u);
    }

  }
  else
  {
    sem_close(v0);
  }
  return 1;
}

void HTTelemetryCheckForUpdates(void *a1)
{
  id v1;
  uint64_t v2;
  id v3;
  _QWORD block[4];
  id v5;

  v1 = a1;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __HTTelemetryCheckForUpdates_block_invoke;
  block[3] = &unk_1E5FAA390;
  v5 = v1;
  v2 = HTTelemetryCheckForUpdates_onceToken;
  v3 = v1;
  if (v2 != -1)
    dispatch_once(&HTTelemetryCheckForUpdates_onceToken, block);

}

void HTInitializeHangTracerMonitor()
{
  NSObject *v0;
  uint8_t v1[16];

  shared_ht_log_handle();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1AF62F000, v0, OS_LOG_TYPE_INFO, "HTInitializeHangTracerMonitor: HT Monitor is monitoring Hang Event", v1, 2u);
  }

  if (HTInitializeHangTracerMonitor_onceToken != -1)
    dispatch_once(&HTInitializeHangTracerMonitor_onceToken, &__block_literal_global_4);
}

void HTUserSwitchedAwayFromApp(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  _DWORD v5[2];
  __int16 v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  shared_ht_log_handle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5[0] = 67109378;
    v5[1] = a1;
    v6 = 2112;
    v7 = v3;
    _os_log_impl(&dword_1AF62F000, v4, OS_LOG_TYPE_INFO, "HTUserSwitchedAwayFromApp for pid %d reason %@", (uint8_t *)v5, 0x12u);
  }

  +[HTMonitorPidHangEvent checkHangForPid:](HTMonitorPidHangEvent, "checkHangForPid:", a1);
}

uint64_t keyWithPrefix(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), a2, a1);
}

id arrayOfCFPrefsWithPrefix(const __CFString *a1, void *a2, uint64_t a3)
{
  __CFString *v5;
  void *v6;
  id v7;
  CFArrayRef v8;
  const __CFArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@."), a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v8 = CFPreferencesCopyKeyList(a1, v5, (CFStringRef)*MEMORY[0x1E0C9B230]);
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v9 = v8;
  v10 = -[__CFArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v17 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        if (objc_msgSend(v14, "hasPrefix:", v6))
          objc_msgSend(v7, "addObject:", v14);
      }
      v11 = -[__CFArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v11);
  }

  return v7;
}

id getPrefWithOverrideProfile(void *a1, void *a2)
{
  __CFString *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;

  v3 = a1;
  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = a2;
  objc_msgSend(v4, "stringWithFormat:", CFSTR("HTProfile.%@"), v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v8 = v7;
  }
  else
  {
    v9 = (void *)CFPreferencesCopyValue(v3, CFSTR("com.apple.da"), CFSTR("mobile"), (CFStringRef)*MEMORY[0x1E0C9B230]);
    if (v9 && (objc_opt_respondsToSelector() & 1) != 0)
      v8 = v9;
    else
      v8 = 0;

  }
  return v8;
}

id __checkForAssertionOverlap_block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[2];
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  v6[0] = CFSTR("assertionOverlapMs");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a1[4] - a1[5]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[1] = CFSTR("assertionOverlapName");
  v7[0] = v2;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a1[6]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __checkForAssertionOverlap_block_invoke_12(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[2];
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  v6[0] = CFSTR("hangDurationOverlapMs");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[1] = CFSTR("hangDurationOverlapPercent");
  v7[0] = v2;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id HTTerminationAllAvailableReasons()
{
  if (HTTerminationAllAvailableReasons_onceToken != -1)
    dispatch_once(&HTTerminationAllAvailableReasons_onceToken, &__block_literal_global_5);
  return (id)HTTerminationAllAvailableReasons_allReasons;
}

void HTHangEventCreateWithBundleID_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1AF62F000, v0, v1, "Watchdog monitoring: starting monitor", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void HTHangEventCreateWithBundleID_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1AF62F000, v0, v1, "Watchdog monitoring: already started", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void HTResumeHangTracing_cold_1(int a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 67109120;
  v2[1] = a1 - 1;
  _os_log_fault_impl(&dword_1AF62F000, a2, OS_LOG_TYPE_FAULT, "HangTracer: HTResumeHangTracing over resumed! decremented suspendCount to %u\n", (uint8_t *)v2, 8u);
  OUTLINED_FUNCTION_1_0();
}

void HTEndNonResponsiveTaskAtTime_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3_0(&dword_1AF62F000, v0, v1, "HTAssertions: HTEndAssertion:assertionCounter is 0", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void HTEndNonResponsiveTaskAtTime_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3_0(&dword_1AF62F000, v0, v1, "HTAssertions: HTEndAssertion: assertionId not found in recent array", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void ht_fence_start_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3_0(&dword_1AF62F000, v0, v1, "HT CA Fence Tracking: recent fence array not malloc'ed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void ht_fence_start_cold_2()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_4();
  _os_log_debug_impl(&dword_1AF62F000, v0, OS_LOG_TYPE_DEBUG, "HT CA Fence Tracking: ca fence=%llu with timestamp=%llu", v1, 0x16u);
  OUTLINED_FUNCTION_5();
}

void ht_fence_start_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1AF62F000, v0, v1, "Hangtracer fence start: Fence tracking is disabled, not creating object for HT fence tracking.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void ht_fence_start_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1AF62F000, v0, v1, "Hangtracer fence start: Daemon Mode HangTracing is disabled, not creating object for HT fence tracking.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void ht_fence_timeout_cold_1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_4();
  _os_log_fault_impl(&dword_1AF62F000, v0, OS_LOG_TYPE_FAULT, "HT CA Fence Tracking: unable to find start timestamp for blown fence, fence=%llu blown_timestamp=%llu", v1, 0x16u);
  OUTLINED_FUNCTION_5();
}

void ht_fence_timeout_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1AF62F000, v0, v1, "Hangtracer fenceTimeout: Fence tracking is disabled, not creating object for HT fence tracking.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void ht_fence_timeout_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1AF62F000, v0, v1, "Hangtracer fenceTimeout: Daemon Mode HangTracing is disabled, not creating object for HT fence tracking.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void checkForHangWithUserMovedAwayAndRecentAssertions_cold_1(os_log_t log, double a2)
{
  int v2;
  double v3;
  __int16 v4;
  int v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = 134218240;
  v3 = a2;
  v4 = 1024;
  v5 = 250;
  _os_log_fault_impl(&dword_1AF62F000, log, OS_LOG_TYPE_FAULT, "Hang detected below aggd threshold: hang duration = %.2fms, aggd treshold = %.2dms", (uint8_t *)&v2, 0x12u);
  OUTLINED_FUNCTION_5();
}

void HTTestingResetNumOfHangEventsInSharedPage_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1AF62F000, v0, v1, "Reset Num Of HangEvents In SharedPage", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void pathForPid_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_fault_impl(&dword_1AF62F000, a2, OS_LOG_TYPE_FAULT, "HangTracer: pathForPid was found invalid UTF8 string, trying ascii encoding = %@", (uint8_t *)&v2, 0xCu);
}

void cleanupDiagnosticLogsDirectory_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_1AF62F000, a2, OS_LOG_TYPE_DEBUG, "Cleaning up %@", (uint8_t *)&v2, 0xCu);
}

void checkForAssertionOverlap_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1AF62F000, a1, a3, "HTAssertion: checkOverlap: no assertions have been tracked", a5, a6, a7, a8, 0);
}

void checkForAssertionOverlap_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1AF62F000, a1, a3, "HTAssertion: checkOverlap: hang does not overlap any assertions", a5, a6, a7, a8, 0);
}

void checkForAssertionOverlap_cold_3(uint8_t *a1, unint64_t a2, double *a3, NSObject *a4)
{
  double v7;

  v7 = MATU_TO_MS(a2);
  *(_DWORD *)a1 = 134217984;
  *a3 = v7;
  _os_log_debug_impl(&dword_1AF62F000, a4, OS_LOG_TYPE_DEBUG, "HTAssertion: checkOverlap: ignoring hang during screen off with duration %.0fms", a1, 0xCu);
}

uint64_t ADClientAddValueForScalarKey()
{
  return MEMORY[0x1E0CF63A0]();
}

uint64_t ADClientPushValueForDistributionKey()
{
  return MEMORY[0x1E0CF63C0]();
}

uint64_t ADClientSetValueForScalarKey()
{
  return MEMORY[0x1E0CF63D8]();
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x1E0D15428]();
}

CFStringRef CFBundleGetIdentifier(CFBundleRef bundle)
{
  return (CFStringRef)MEMORY[0x1E0C98120](bundle);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x1E0C983E0](theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x1E0C983F8](theData);
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return MEMORY[0x1E0C98A30](applicationID);
}

CFArrayRef CFPreferencesCopyKeyList(CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFArrayRef)MEMORY[0x1E0C98A50](applicationID, userName, hostName);
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFPropertyListRef)MEMORY[0x1E0C98A60](key, applicationID, userName, hostName);
}

void CFPreferencesSetValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  MEMORY[0x1E0C98A90](key, value, applicationID, userName, hostName);
}

Boolean CFPreferencesSynchronize(CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return MEMORY[0x1E0C98A98](applicationID, userName, hostName);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

CFURLRef CFURLCreateWithFileSystemPath(CFAllocatorRef allocator, CFStringRef filePath, CFURLPathStyle pathStyle, Boolean isDirectory)
{
  return (CFURLRef)MEMORY[0x1E0C99420](allocator, filePath, pathStyle, isDirectory);
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1E0DE2B20]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x1E0DE2B50]();
}

NSString *__cdecl NSHomeDirectoryForUser(NSString *userName)
{
  return (NSString *)MEMORY[0x1E0CB2C08](userName);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

uint64_t _CFBundleCreateWithExecutableURLIfLooksLikeBundle()
{
  return MEMORY[0x1E0C99FF8]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x1E0C80A58](a1, a2, *(_QWORD *)&a3, a4);
}

int *__error(void)
{
  return (int *)MEMORY[0x1E0C80AC0]();
}

uint64_t __strlcpy_chk()
{
  return MEMORY[0x1E0C80C48]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81020](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81040](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C810D0](dso, log, type, spid, name, format, buf, *(_QWORD *)&size);
}

uint64_t alm_app_measurement_ongoing()
{
  return MEMORY[0x1E0DE3BA8]();
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return MEMORY[0x1E0C81588](*(_QWORD *)&__upper_bound);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
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

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E28](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E38](attr, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E48](label, attr);
}

dispatch_queue_t dispatch_queue_create_with_target_V2(const char *label, dispatch_queue_attr_t attr, dispatch_queue_t target)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E50](label, attr, target);
}

void dispatch_resume(dispatch_object_t object)
{
  MEMORY[0x1E0C82EA0](object);
}

void dispatch_source_cancel(dispatch_source_t source)
{
  MEMORY[0x1E0C82F10](source);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1E0C82F20](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x1E0C82F58](source, handler);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82F90](queue, block);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

pid_t getpid(void)
{
  return MEMORY[0x1E0C83760]();
}

uint64_t kdebug_trace()
{
  return MEMORY[0x1E0C83A20]();
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x1E0C83C50]();
}

uint64_t mach_continuous_time(void)
{
  return MEMORY[0x1E0C83C70]();
}

uint64_t mach_get_times()
{
  return MEMORY[0x1E0C83C88]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x1E0C83DB8](info);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F00](size, type_id);
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return (void *)MEMORY[0x1E0C841D8](a1, a2, *(_QWORD *)&a3, *(_QWORD *)&a4, *(_QWORD *)&a5, a6);
}

int munmap(void *a1, size_t a2)
{
  return MEMORY[0x1E0C84220](a1, a2);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return MEMORY[0x1E0C843E8](*(_QWORD *)&token, state64);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x1E0C84408](name, out_token, queue, handler);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1E0DE7BA8](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1E0DE7BB8]();
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

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1E0DE7CD0](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1E0DE7CE0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1E0DE7D08](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D20](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D30](a1, a2);
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1E0DE7D50]();
}

void objc_release(id a1)
{
  MEMORY[0x1E0DE7D78](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1E0DE7E50](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7E58](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E60](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1E0DE7E70](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7F88](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x1E0DE7FB0](location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7FE0](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1E0C84728](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x1E0C84920](log);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C84998](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C849B0](lock);
}

int proc_pidinfo(int pid, int flavor, uint64_t arg, void *buffer, int buffersize)
{
  return MEMORY[0x1E0C84C40](*(_QWORD *)&pid, *(_QWORD *)&flavor, arg, buffer, *(_QWORD *)&buffersize);
}

int proc_pidpath(int pid, void *buffer, uint32_t buffersize)
{
  return MEMORY[0x1E0C84C50](*(_QWORD *)&pid, buffer, *(_QWORD *)&buffersize);
}

pthread_t pthread_self(void)
{
  return (pthread_t)MEMORY[0x1E0C84ED8]();
}

int pthread_threadid_np(pthread_t a1, __uint64_t *a2)
{
  return MEMORY[0x1E0C84F38](a1, a2);
}

int sem_close(sem_t *a1)
{
  return MEMORY[0x1E0C85290](a1);
}

sem_t *sem_open(const char *a1, int a2, ...)
{
  return (sem_t *)MEMORY[0x1E0C852A8](a1, *(_QWORD *)&a2);
}

int statfs(const char *a1, statfs *a2)
{
  return MEMORY[0x1E0C854E0](a1, a2);
}

char *__cdecl strncpy(char *__dst, const char *__src, size_t __n)
{
  return (char *)MEMORY[0x1E0C855B0](__dst, __src, __n);
}

xpc_object_t xpc_BOOL_create(BOOL value)
{
  return (xpc_object_t)MEMORY[0x1E0C85EF0](value);
}

void xpc_connection_activate(xpc_connection_t connection)
{
  MEMORY[0x1E0C85F50](connection);
}

void xpc_connection_cancel(xpc_connection_t connection)
{
  MEMORY[0x1E0C85F68](connection);
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x1E0C85FB0](name, targetq, flags);
}

pid_t xpc_connection_get_pid(xpc_connection_t connection)
{
  return MEMORY[0x1E0C86008](connection);
}

void xpc_connection_resume(xpc_connection_t connection)
{
  MEMORY[0x1E0C86018](connection);
}

void xpc_connection_send_barrier(xpc_connection_t connection, dispatch_block_t barrier)
{
  MEMORY[0x1E0C86020](connection, barrier);
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
  MEMORY[0x1E0C86030](connection, message);
}

xpc_object_t xpc_connection_send_message_with_reply_sync(xpc_connection_t connection, xpc_object_t message)
{
  return (xpc_object_t)MEMORY[0x1E0C86048](connection, message);
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
  MEMORY[0x1E0C86080](connection, handler);
}

void xpc_connection_set_target_queue(xpc_connection_t connection, dispatch_queue_t targetq)
{
  MEMORY[0x1E0C860C8](connection, targetq);
}

char *__cdecl xpc_copy_description(xpc_object_t object)
{
  return (char *)MEMORY[0x1E0C86108](object);
}

xpc_object_t xpc_data_create(const void *bytes, size_t length)
{
  return (xpc_object_t)MEMORY[0x1E0C86178](bytes, length);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x1E0C86208](keys, values, count);
}

xpc_object_t xpc_dictionary_create_empty(void)
{
  return (xpc_object_t)MEMORY[0x1E0C86218]();
}

int64_t xpc_dictionary_get_int64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1E0C862A0](xdict, key);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x1E0C862C8](xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x1E0C862E0](xdict, key);
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
  MEMORY[0x1E0C86398](xdict, key, value);
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
  MEMORY[0x1E0C863B8](xdict, key, value);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x1E0C86520](object);
}

xpc_object_t xpc_int64_create(int64_t value)
{
  return (xpc_object_t)MEMORY[0x1E0C86568](value);
}

xpc_object_t xpc_shmem_create(void *region, size_t length)
{
  return (xpc_object_t)MEMORY[0x1E0C866F0](region, length);
}

size_t xpc_shmem_map(xpc_object_t xshmem, void **region)
{
  return MEMORY[0x1E0C86700](xshmem, region);
}

xpc_object_t xpc_string_create(const char *string)
{
  return (xpc_object_t)MEMORY[0x1E0C86720](string);
}

xpc_object_t xpc_uint64_create(uint64_t value)
{
  return (xpc_object_t)MEMORY[0x1E0C867B0](value);
}

