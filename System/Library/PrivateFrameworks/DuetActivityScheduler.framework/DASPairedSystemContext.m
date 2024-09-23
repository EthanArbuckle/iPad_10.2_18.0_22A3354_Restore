@implementation DASPairedSystemContext

uint64_t __52___DASPairedSystemContext_registerForContextChanges__block_invoke_6(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleAppStateChange");
}

void __47___DASPairedSystemContext_handleAppStateChange__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "onConditionsChange");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, _QWORD, _QWORD))v2 + 2))(v2, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 40));

}

void __52___DASPairedSystemContext_registerForContextChanges__block_invoke_3(uint64_t a1)
{
  NSObject *v2;
  _QWORD block[5];

  objc_msgSend(*(id *)(a1 + 32), "handlerQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52___DASPairedSystemContext_registerForContextChanges__block_invoke_4;
  block[3] = &unk_1E624B598;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_sync(v2, block);

}

uint64_t __52___DASPairedSystemContext_registerForContextChanges__block_invoke_5(uint64_t a1)
{
  NSObject *v2;
  _QWORD block[5];

  objc_msgSend(*(id *)(a1 + 32), "handlerQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52___DASPairedSystemContext_registerForContextChanges__block_invoke_6;
  block[3] = &unk_1E624B598;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_sync(v2, block);

  return 1;
}

uint64_t __52___DASPairedSystemContext_registerForContextChanges__block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleAppStateChange");
}

uint64_t __52___DASPairedSystemContext_registerForContextChanges__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleConditionChange");
}

void __52___DASPairedSystemContext_registerForContextChanges__block_invoke(uint64_t a1)
{
  NSObject *v2;
  _QWORD block[5];

  objc_msgSend(*(id *)(a1 + 32), "handlerQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52___DASPairedSystemContext_registerForContextChanges__block_invoke_2;
  block[3] = &unk_1E624B598;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_sync(v2, block);

}

void __48___DASPairedSystemContext_handleConditionChange__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "onConditionsChange");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, _QWORD, _QWORD))v1 + 2))(v1, 0, 0);

}

uint64_t __144___DASPairedSystemContext_initWithClientIdentifier_context_knowledgeStore_callbackQueue_systemConditionChangeCallback_trafficCancelationHander___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateAppUsageHistory");
}

uint64_t __144___DASPairedSystemContext_initWithClientIdentifier_context_knowledgeStore_callbackQueue_systemConditionChangeCallback_trafficCancelationHander___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "deleteRemoteHistogram");
}

void __125___DASPairedSystemContext_contextWithClientIdentifier_callbackQueue_systemConditionChangeCallback_trafficCancelationHandler___block_invoke(_QWORD *a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  v2 = objc_alloc((Class)objc_opt_class());
  v3 = a1[4];
  objc_msgSend(MEMORY[0x1E0D15C48], "userContext");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D15A58], "knowledgeStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v2, "initWithClientIdentifier:context:knowledgeStore:callbackQueue:systemConditionChangeCallback:trafficCancelationHander:", v3, v7, v4, a1[5], a1[6], a1[7]);
  v6 = (void *)contextWithClientIdentifier_callbackQueue_systemConditionChangeCallback_trafficCancelationHandler__pairedSystemContext;
  contextWithClientIdentifier_callbackQueue_systemConditionChangeCallback_trafficCancelationHandler__pairedSystemContext = v5;

}

void __48___DASPairedSystemContext_handleConditionChange__block_invoke_2(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "onConditionsChange");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, _QWORD, _QWORD))v1 + 2))(v1, 0, 0);

}

void __53___DASPairedSystemContext_handleWatchAppBackgrounded__block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v8;
  double v9;
  double v10;
  id v11;

  v11 = a2;
  v8 = a3;
  objc_msgSend(*(id *)(a1 + 32), "timeIntervalSinceDate:", v8);
  if (v9 <= 120.0)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "timeIntervalSinceDate:", v8);
    if (v10 > 0.0)
    {
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a3);
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    }
  }
  else
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }

}

void __54___DASPairedSystemContext_didHandleExclusiveAppChange__block_invoke(uint64_t a1)
{
  void (**v2)(id, _QWORD);

  objc_msgSend(*(id *)(a1 + 32), "onApplicationStateChange");
  v2 = (void (**)(id, _QWORD))objc_claimAutoreleasedReturnValue();
  v2[2](v2, *(_QWORD *)(a1 + 40));

}

void __54___DASPairedSystemContext_didHandleExclusiveAppChange__block_invoke_2(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "onConditionsChange");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, _QWORD, _QWORD))v1 + 2))(v1, 0, 0);

}

void __46___DASPairedSystemContext_isAnyThirdPartyApp___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  BOOL v9;
  NSObject *v10;
  _BOOL4 v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "log");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v17 = 138412290;
      v18 = v6;
      _os_log_impl(&dword_1B0DF4000, v7, OS_LOG_TYPE_INFO, "Error obtaining applications for remote device: %@", (uint8_t *)&v17, 0xCu);
    }
  }
  else
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0CF8848]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8 == 0;

    objc_msgSend(*(id *)(a1 + 32), "log");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = os_log_type_enabled(v10, OS_LOG_TYPE_INFO);
    if (v9)
    {
      if (v11)
      {
        v14 = *(void **)(a1 + 48);
        v17 = 138412290;
        v18 = v14;
        _os_log_impl(&dword_1B0DF4000, v10, OS_LOG_TYPE_INFO, "%@ IS NOT a WatchKit app", (uint8_t *)&v17, 0xCu);
      }
      v13 = 0;
    }
    else if (v11)
    {
      v12 = *(void **)(a1 + 48);
      v17 = 138412290;
      v18 = v12;
      v13 = 1;
      _os_log_impl(&dword_1B0DF4000, v10, OS_LOG_TYPE_INFO, "%@ IS a WatchKit app", (uint8_t *)&v17, 0xCu);
    }
    else
    {
      v13 = 1;
    }

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v13;
    objc_msgSend(*(id *)(a1 + 32), "watchKitAppStatus");
    v7 = objc_claimAutoreleasedReturnValue();
    objc_sync_enter(v7);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "watchKitAppStatus");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v15, *(_QWORD *)(a1 + 48));

    objc_sync_exit(v7);
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

@end
