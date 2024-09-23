@implementation DKSyncRapportCommonStorage

void __45___DKSyncRapportCommonStorage_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedInstance_sharedInstance_3;
  sharedInstance_sharedInstance_3 = v0;

}

void __58___DKSyncRapportCommonStorage__additionalFlagsForInternal__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  int v7;
  void *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (os_variant_has_internal_content())
  {
    v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.CoreDuet"));
    objc_msgSend(v0, "stringForKey:", CFSTR("ForcedRapportConnectionType"));
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = v1;
    if (!v1)
    {
LABEL_17:

      return;
    }
    if ((objc_msgSend(v1, "isEqualToString:", CFSTR("Cloud")) & 1) != 0)
    {
      v3 = 0x10000000;
    }
    else if ((objc_msgSend(v2, "isEqualToString:", CFSTR("BLE")) & 1) != 0)
    {
      v3 = 0x8000;
    }
    else if ((objc_msgSend(v2, "isEqualToString:", CFSTR("AWDL")) & 1) != 0)
    {
      v3 = 0x20000;
    }
    else if ((objc_msgSend(v2, "isEqualToString:", CFSTR("USB")) & 1) != 0)
    {
      v3 = 0x40000;
    }
    else
    {
      if ((objc_msgSend(v2, "isEqualToString:", CFSTR("L2CAP")) & 1) == 0)
      {
        +[_CDLogging syncChannel](_CDLogging, "syncChannel");
        v6 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
          __58___DKSyncRapportCommonStorage__additionalFlagsForInternal__block_invoke_cold_1();

        if (!_additionalFlagsForInternal_flag)
          goto LABEL_17;
        goto LABEL_14;
      }
      v3 = 256;
    }
    _additionalFlagsForInternal_flag = v3;
LABEL_14:
    +[_CDLogging syncChannel](_CDLogging, "syncChannel");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      objc_msgSend((id)objc_opt_class(), "description");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 138543618;
      v8 = v5;
      v9 = 2112;
      v10 = v2;
      _os_log_impl(&dword_18DDBE000, v4, OS_LOG_TYPE_INFO, "%{public}@: Forcing rapport connections through %@", (uint8_t *)&v7, 0x16u);

    }
    goto LABEL_17;
  }
}

void __43___DKSyncRapportCommonStorage_startRapport__block_invoke(uint64_t a1)
{
  -[_DKSyncRapportCommonStorage handleInvalidation](*(_QWORD *)(a1 + 32));
}

void __43___DKSyncRapportCommonStorage_startRapport__block_invoke_2(uint64_t a1, void *a2)
{
  -[_DKSyncRapportCommonStorage handleDeviceFound:](*(void **)(a1 + 32), a2);
}

void __43___DKSyncRapportCommonStorage_startRapport__block_invoke_3(uint64_t a1, void *a2, int a3)
{
  -[_DKSyncRapportCommonStorage handleDeviceChanged:changes:](*(_QWORD **)(a1 + 32), a2, a3);
}

void __43___DKSyncRapportCommonStorage_startRapport__block_invoke_4(uint64_t a1, void *a2)
{
  -[_DKSyncRapportCommonStorage handleDeviceLost:](*(_QWORD **)(a1 + 32), a2);
}

void __43___DKSyncRapportCommonStorage_startRapport__block_invoke_5(uint64_t a1, void *a2)
{
  -[_DKSyncRapportCommonStorage handleActivateWithError:](*(_QWORD *)(a1 + 32), a2);
}

void __60___DKSyncRapportCommonStorage_registerRequestIDsWithClient___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  -[_DKSyncRapportCommonStorage handleBeaconWithRequest:options:responseHandler:](*(void **)(a1 + 32), a2, a3, a4);
}

void __60___DKSyncRapportCommonStorage_registerRequestIDsWithClient___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  -[_DKSyncRapportCommonStorage handleFetchSourceDeviceIDWithRequest:options:responseHandler:](*(void **)(a1 + 32), a2, a3, a4);
}

void __49___DKSyncRapportCommonStorage_handleInvalidation__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  -[_DKSyncRapportCommonStorage startRapport]();

}

void __65___DKSyncRapportCommonStorage_handshakeWithDuetSyncPeer_orError___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  _QWORD v4[5];
  id v5;
  id v6;
  id v7;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __65___DKSyncRapportCommonStorage_handshakeWithDuetSyncPeer_orError___block_invoke_2;
  v4[3] = &unk_1E26E6FD8;
  v4[4] = v2;
  v5 = *(id *)(a1 + 48);
  v6 = *(id *)(a1 + 40);
  v7 = *(id *)(a1 + 56);
  objc_msgSend(v2, "fetchSourceDeviceIDFromPeer:highPriority:completion:", v3, 1, v4);

}

void __65___DKSyncRapportCommonStorage_handshakeWithDuetSyncPeer_orError___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  NSObject *v14;
  int v15;
  __CFString *v16;
  const __CFString *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  int v25;
  __CFString *v26;
  const __CFString *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  const __CFString *v33;
  void *v34;
  void *v35;
  __CFString *v36;
  const __CFString *v37;
  void *v38;
  void *v39;
  uint8_t buf[4];
  void *v41;
  __int16 v42;
  const __CFString *v43;
  __int16 v44;
  id v45;
  __int16 v46;
  __CFString *v47;
  __int16 v48;
  void *v49;
  __int16 v50;
  uint64_t v51;
  __int16 v52;
  id v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[_DKSyncPowerlog recordWithSyncType:transportType:startDate:endDate:isEmpty:](_DKSyncPowerlog, "recordWithSyncType:transportType:startDate:endDate:isEmpty:", 0, objc_msgSend(*(id *)(a1 + 32), "transportType"), *(_QWORD *)(a1 + 40), v10, v7 == 0);
  if (v7)
  {
    objc_msgSend(v7, "UUIDString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(*(id *)(a1 + 48), "version");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v8, "isEqualToString:", v12);

      if ((v13 & 1) == 0)
      {
        +[_CDLogging syncChannel](_CDLogging, "syncChannel");
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          objc_msgSend((id)objc_opt_class(), "description");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 48), "version");
          v36 = (__CFString *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(*(id *)(a1 + 48), "me");
          v16 = &stru_1E26E9728;
          v17 = CFSTR("pseudo ");
          if (!v15)
            v17 = &stru_1E26E9728;
          v33 = v17;
          objc_msgSend(*(id *)(a1 + 48), "identifier");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 48), "model");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if (v18)
          {
            v19 = (void *)MEMORY[0x1E0CB3940];
            objc_msgSend(*(id *)(a1 + 48), "model");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "stringWithFormat:", CFSTR(" (%@)"), v32);
            v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          *(_DWORD *)buf = 138544642;
          v41 = v38;
          v42 = 2114;
          v43 = v36;
          v44 = 2114;
          v45 = v8;
          v46 = 2114;
          v47 = (__CFString *)v33;
          v48 = 2114;
          v49 = v35;
          v50 = 2114;
          v51 = (uint64_t)v16;
          _os_log_impl(&dword_18DDBE000, v14, OS_LOG_TYPE_INFO, "%{public}@: Will change version from %{public}@ to %{public}@ for %{public}@peer %{public}@%{public}@", buf, 0x3Eu);
          if (v18)
          {

          }
        }

      }
    }
    objc_msgSend(*(id *)(a1 + 56), "setSourceDeviceID:version:peer:", v11, v8, *(_QWORD *)(a1 + 48));
    objc_msgSend(*(id *)(a1 + 56), "addActiveTransports:toPeer:", objc_msgSend(*(id *)(a1 + 32), "transportType"), *(_QWORD *)(a1 + 48));
    v23 = *(void **)(a1 + 56);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setLastSeenDate:onPeer:", v24, *(_QWORD *)(a1 + 48));

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "addObject:", v11);
  }
  else
  {
    +[_CDLogging syncChannel](_CDLogging, "syncChannel");
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend((id)objc_opt_class(), "description");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(*(id *)(a1 + 48), "me");
      v26 = &stru_1E26E9728;
      v27 = CFSTR("pseudo ");
      if (!v25)
        v27 = &stru_1E26E9728;
      v37 = v27;
      objc_msgSend(*(id *)(a1 + 48), "identifier");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 48), "model");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      if (v29)
      {
        v30 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(*(id *)(a1 + 48), "model");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "stringWithFormat:", CFSTR(" (%@)"), v34);
        v26 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v9, "domain");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544898;
      v41 = v39;
      v42 = 2114;
      v43 = v37;
      v44 = 2114;
      v45 = v28;
      v46 = 2114;
      v47 = v26;
      v48 = 2114;
      v49 = v31;
      v50 = 2048;
      v51 = objc_msgSend(v9, "code");
      v52 = 2112;
      v53 = v9;
      _os_log_error_impl(&dword_18DDBE000, v20, OS_LOG_TYPE_ERROR, "%{public}@: Failed to fetch source device id from %{public}@peer %{public}@%{public}@: %{public}@:%lld (%@)", buf, 0x48u);

      if (v29)
      {

      }
    }

    if (objc_msgSend(v9, "code") == -6714)
    {
      objc_msgSend(v9, "domain");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "isEqualToString:", *MEMORY[0x1E0D83988]);

      if (v22)
        objc_msgSend(*(id *)(a1 + 56), "removeActiveTransports:fromPeer:", objc_msgSend(*(id *)(a1 + 32), "transportType"), *(_QWORD *)(a1 + 48));
    }
  }

}

void __65___DKSyncRapportCommonStorage_handshakeWithDuetSyncPeer_orError___block_invoke_127(id *a1)
{
  NSObject *v2;
  void *v3;
  __CFString *v4;
  const __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  uint8_t buf[4];
  void *v10;
  __int16 v11;
  const __CFString *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  __CFString *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  +[_CDLogging syncChannel](_CDLogging, "syncChannel");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    objc_msgSend((id)objc_opt_class(), "description");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = &stru_1E26E9728;
    if (objc_msgSend(a1[5], "me"))
      v5 = CFSTR("pseudo ");
    else
      v5 = &stru_1E26E9728;
    objc_msgSend(a1[5], "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[5], "model");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v8 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(a1[5], "model");
      a1 = (id *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "stringWithFormat:", CFSTR(" (%@)"), a1);
      v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    *(_DWORD *)buf = 138544130;
    v10 = v3;
    v11 = 2114;
    v12 = v5;
    v13 = 2114;
    v14 = v6;
    v15 = 2114;
    v16 = v4;
    _os_log_impl(&dword_18DDBE000, v2, OS_LOG_TYPE_INFO, "%{public}@: Throttled fetchSourceDeviceIDFromPeer for %{public}@peer %{public}@%{public}@", buf, 0x2Au);
    if (v7)
    {

    }
  }

}

void __55___DKSyncRapportCommonStorage_handleActivateWithError___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;

  v3 = a2;
  if (v3)
  {
    +[_CDLogging syncChannel](_CDLogging, "syncChannel");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __55___DKSyncRapportCommonStorage_handleActivateWithError___block_invoke_cold_2();

    +[_CDLogging syncChannel](_CDLogging, "syncChannel");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __55___DKSyncRapportCommonStorage_handleActivateWithError___block_invoke_cold_1(a1, v5);

  }
}

void __83___DKSyncRapportCommonStorage_fetchSourceDeviceIDFromPeer_highPriority_completion___block_invoke(void **a1, void *a2, void *a3, void *a4)
{
  -[_DKSyncRapportCommonStorage handleFetchSourceDeviceIDWithResponse:options:error:peer:plStartDate:completion:](a1[4], a2, a3, a4, a1[5], a1[6], a1[7]);
}

uint64_t __83___DKSyncRapportCommonStorage_fetchSourceDeviceIDFromPeer_highPriority_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD, uint64_t))(result + 16))(result, 0, 0, a2);
  return result;
}

void __95___DKSyncRapportCommonStorage_sendRequestID_request_peer_highPriority_options_responseHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  id v5;
  id v6;

  v6 = a2;
  -[_DKSyncRapportCommonStorage handleActivateCompanionLinkClient:forPeer:error:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40), *(void **)(a1 + 48), v6);
  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 40), "invalidate");
    v3 = *(_QWORD *)(a1 + 80);
    if (v3)
      (*(void (**)(uint64_t, _QWORD, _QWORD, id))(v3 + 16))(v3, 0, 0, v6);
  }
  else
  {
    v4 = *(id *)(a1 + 56);
    if (*(_BYTE *)(a1 + 88))
    {
      if (objc_msgSend(*(id *)(a1 + 56), "count"))
      {
        v5 = (id)objc_msgSend(*(id *)(a1 + 56), "mutableCopy");
        objc_msgSend(v5, "addEntriesFromDictionary:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
      }
      else
      {
        v5 = *(id *)(*(_QWORD *)(a1 + 32) + 16);
      }

      v4 = v5;
    }
    -[_DKSyncRapportCommonStorage sendRequestID:request:peer:client:options:responseHandler:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 64), *(void **)(a1 + 72), *(void **)(a1 + 48), *(void **)(a1 + 40), v4, *(void **)(a1 + 80));

  }
}

void __89___DKSyncRapportCommonStorage_sendRequestID_request_peer_client_options_responseHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  unsigned int v11;
  uint64_t v12;
  id v13;

  v13 = a2;
  v7 = a3;
  v8 = a4;
  +[_DKSyncSerializer underlyingQueue](_DKSyncSerializer, "underlyingQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v9);

  if (v8 && objc_msgSend(v8, "code") == -71156)
  {
    objc_msgSend(v8, "domain");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isEqualToString:", *MEMORY[0x1E0D83988]);

  }
  else
  {
    v11 = 0;
  }
  -[_DKEventTypeResultStatsCounter incrementCountWithTypeValue:success:](*(_QWORD *)(*(_QWORD *)(a1 + 32) + 24), *(void **)(a1 + 40), v11);
  v12 = *(_QWORD *)(a1 + 56);
  if (v12)
    (*(void (**)(uint64_t, id, id, id))(v12 + 16))(v12, v13, v7, v8);
  --*(_QWORD *)(*(_QWORD *)(a1 + 32) + 56);
  objc_msgSend(*(id *)(a1 + 48), "invalidate");
  usleep(0x186A0u);

}

void __58___DKSyncRapportCommonStorage__additionalFlagsForInternal__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  void *v2;
  uint8_t v3[12];
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  OUTLINED_FUNCTION_8_1();
  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)OUTLINED_FUNCTION_16(), "description");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  v4 = 2112;
  v5 = v1;
  _os_log_error_impl(&dword_18DDBE000, v0, OS_LOG_TYPE_ERROR, "%{public}@: Ignoring unexpected value for ForcedRapportConnectionType: %@", v3, 0x16u);

  OUTLINED_FUNCTION_7();
}

void __55___DKSyncRapportCommonStorage_handleActivateWithError___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)OUTLINED_FUNCTION_16(), "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_1(&dword_18DDBE000, a2, v4, "%{public}@: Rapport will not function correctly", v5);

  OUTLINED_FUNCTION_1();
}

void __55___DKSyncRapportCommonStorage_handleActivateWithError___block_invoke_cold_2()
{
  NSObject *v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint8_t v5[22];
  __int16 v6;
  uint64_t v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  OUTLINED_FUNCTION_8_1();
  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)OUTLINED_FUNCTION_16(), "description");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_19_0(), "domain");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "code");
  OUTLINED_FUNCTION_29_1();
  v6 = 2048;
  v7 = v4;
  v8 = 2112;
  v9 = v1;
  _os_log_error_impl(&dword_18DDBE000, v0, OS_LOG_TYPE_ERROR, "%{public}@: Failed to register sync with Rapport: %{public}@:%lld (%@)", v5, 0x2Au);

}

@end
