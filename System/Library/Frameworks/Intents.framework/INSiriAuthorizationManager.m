@implementation INSiriAuthorizationManager

void __75___INSiriAuthorizationManager__siriAuthorizationStatusForAppID_intentSlot___block_invoke_10(_QWORD *a1)
{
  id v2;
  void (**v3)(_QWORD);
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  double v8;
  double v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  __int128 v15;
  _QWORD v16[4];
  __int128 v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  uint8_t buf[4];
  const char *v27;
  __int16 v28;
  uint64_t v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__50547;
  v24 = __Block_byref_object_dispose__50548;
  objc_msgSend((id)_siriAuthorizationStatusForAppID_intentSlot__cachedAuthorizationStatusDictionary, "objectForKeyedSubscript:", a1[4]);
  v25 = (id)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __75___INSiriAuthorizationManager__siriAuthorizationStatusForAppID_intentSlot___block_invoke_11;
  v16[3] = &unk_1E228D7B0;
  v19 = a1[6];
  v15 = *((_OWORD *)a1 + 2);
  v2 = (id)v15;
  v17 = v15;
  v18 = &v20;
  v3 = (void (**)(_QWORD))MEMORY[0x18D7812C4](v16);
  v4 = (void *)v21[5];
  if (v4)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("_INSiriAuthorizationManagerLastAuthorizationCheckDateKey"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v21[5], "objectForKeyedSubscript:", CFSTR("_INSiriAuthorizationManagerAuthorizationStatusKey"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "integerValue");

    objc_msgSend(v5, "timeIntervalSinceNow");
    v9 = v8;
    v10 = (id)INSiriLogContextIntents;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v11 = a1[4];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v9);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v27 = "+[_INSiriAuthorizationManager _siriAuthorizationStatusForAppID:intentSlot:]_block_invoke";
      v28 = 2112;
      v29 = v11;
      v30 = 2112;
      v31 = v12;
      _os_log_impl(&dword_18BEBC000, v10, OS_LOG_TYPE_INFO, "%s Found cached authorization status for appID: %@, last authorization check time interval since now: %@", buf, 0x20u);

    }
    if (v7 == 3 && v9 >= -180.0)
    {
      v13 = INSiriLogContextIntents;
      if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
      {
        v14 = a1[4];
        *(_DWORD *)buf = 136315394;
        v27 = "+[_INSiriAuthorizationManager _siriAuthorizationStatusForAppID:intentSlot:]_block_invoke";
        v28 = 2112;
        v29 = v14;
        _os_log_impl(&dword_18BEBC000, v13, OS_LOG_TYPE_INFO, "%s Returning cached authorization status for appID: %@", buf, 0x16u);
      }
      *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = 3;
    }
    else
    {
      v3[2](v3);
    }

  }
  else
  {
    v3[2](v3);
  }

  _Block_object_dispose(&v20, 8);
}

uint64_t __75___INSiriAuthorizationManager__siriAuthorizationStatusForAppID_intentSlot___block_invoke_11(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  _QWORD v9[2];
  _QWORD v10[2];
  uint8_t buf[4];
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = INSiriLogContextIntents;
  if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v12 = "+[_INSiriAuthorizationManager _siriAuthorizationStatusForAppID:intentSlot:]_block_invoke";
    _os_log_impl(&dword_18BEBC000, v2, OS_LOG_TYPE_INFO, "%s Getting raw authorization status", buf, 0xCu);
  }
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(*(id *)(a1 + 56), "_rawSiriAuthorizationStatusForAppID:", *(_QWORD *)(a1 + 32));
  objc_msgSend(MEMORY[0x1E0C99D68], "date", CFSTR("_INSiriAuthorizationManagerLastAuthorizationCheckDateKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = CFSTR("_INSiriAuthorizationManagerAuthorizationStatusKey");
  v10[0] = v3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  return objc_msgSend((id)_siriAuthorizationStatusForAppID_intentSlot__cachedAuthorizationStatusDictionary, "setObject:forKeyedSubscript:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), *(_QWORD *)(a1 + 32));
}

void __75___INSiriAuthorizationManager__siriAuthorizationStatusForAppID_intentSlot___block_invoke()
{
  uint64_t v0;
  void *v1;
  dispatch_queue_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  int v10;
  const char *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_siriAuthorizationStatusForAppID_intentSlot__cachedAuthorizationStatusDictionary;
  _siriAuthorizationStatusForAppID_intentSlot__cachedAuthorizationStatusDictionary = v0;

  v2 = dispatch_queue_create("_INSiriAuthorizationManagerTCCQueue", 0);
  v3 = (void *)_siriAuthorizationStatusForAppID_intentSlot__queue;
  _siriAuthorizationStatusForAppID_intentSlot__queue = (uint64_t)v2;

  v4 = notify_register_dispatch("com.apple.tcc.access.changed", (int *)&_siriAuthorizationStatusForAppID_intentSlot__registrationToken, (dispatch_queue_t)_siriAuthorizationStatusForAppID_intentSlot__queue, &__block_literal_global_8_50559);
  if ((_DWORD)v4)
  {
    v5 = v4;
    v6 = (void *)INSiriLogContextIntents;
    if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
    {
      v7 = (void *)MEMORY[0x1E0CB37E8];
      v8 = v6;
      objc_msgSend(v7, "numberWithUnsignedInt:", v5);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 136315394;
      v11 = "+[_INSiriAuthorizationManager _siriAuthorizationStatusForAppID:intentSlot:]_block_invoke";
      v12 = 2112;
      v13 = v9;
      _os_log_error_impl(&dword_18BEBC000, v8, OS_LOG_TYPE_ERROR, "%s Error registering for TCC notification: %@", (uint8_t *)&v10, 0x16u);

    }
  }
}

uint64_t __75___INSiriAuthorizationManager__siriAuthorizationStatusForAppID_intentSlot___block_invoke_2()
{
  return objc_msgSend((id)_siriAuthorizationStatusForAppID_intentSlot__cachedAuthorizationStatusDictionary, "removeAllObjects");
}

void __68___INSiriAuthorizationManager__requestSiriAuthorization_auditToken___block_invoke(uint64_t a1)
{
  __int128 v2;
  char v3;
  _QWORD v4[4];
  id v5;
  char v6;
  __int128 v7;
  __int128 v8;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v9 = *MEMORY[0x1E0DB1088];
  v10[0] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v2 = *(_OWORD *)(a1 + 56);
  v7 = *(_OWORD *)(a1 + 40);
  v8 = v2;
  v3 = TCCAccessCheckAuditToken();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __68___INSiriAuthorizationManager__requestSiriAuthorization_auditToken___block_invoke_2;
  v4[3] = &unk_1E228D700;
  v5 = *(id *)(a1 + 32);
  v6 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v4);

}

uint64_t __68___INSiriAuthorizationManager__requestSiriAuthorization_auditToken___block_invoke_2(uint64_t a1)
{
  uint64_t v1;

  if (*(_BYTE *)(a1 + 40))
    v1 = 3;
  else
    v1 = 2;
  return (*(uint64_t (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), v1);
}

@end
