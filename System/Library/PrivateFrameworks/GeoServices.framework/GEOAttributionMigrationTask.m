@implementation GEOAttributionMigrationTask

uint64_t __73___GEOAttributionMigrationTask_startWithCompletionHandler_callbackQueue___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_startWithCompletionHandler:callbackQueue:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
}

GEODataRequest *__74___GEOAttributionMigrationTask__startWithCompletionHandler_callbackQueue___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  GEODataRequest *v6;

  v2 = a2;
  +[GEORequestCounter sharedCounter](GEORequestCounter, "sharedCounter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[GEOApplicationAuditToken currentProcessAuditToken](GEOApplicationAuditToken, "currentProcessAuditToken");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "requestCounterTicketForType:auditToken:traits:", 4, v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[GEODataRequest initWithKind:URL:auditToken:timeoutInterval:additionalHTTPHeaders:bodyData:userAgent:entityTag:cachedData:requestCounterTicket:multipathServiceType:multipathAlternatePort:throttleToken:options:]([GEODataRequest alloc], "initWithKind:URL:auditToken:timeoutInterval:additionalHTTPHeaders:bodyData:userAgent:entityTag:cachedData:requestCounterTicket:multipathServiceType:multipathAlternatePort:throttleToken:options:", 4, v2, 0, 0, 0, 0, 0.0, 0, 0, v5, 0, 0, 0, 0);
  return v6;
}

id __74___GEOAttributionMigrationTask__startWithCompletionHandler_callbackQueue___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  double v5;
  void *v6;

  v3 = a2;
  +[GEODataURLSession sharedDataURLSession](GEODataURLSession, "sharedDataURLSession");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v5) = 1.0;
  objc_msgSend(v4, "downloadTaskWithRequest:priority:delegate:delegateQueue:", v3, *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

void __49___GEOAttributionMigrationTask__finishWithError___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  NSObject *v14;
  id v15;
  id WeakRetained;
  uint64_t v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t);
  void *v20;
  id v21;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "setCompletedUnitCount:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "totalUnitCount"));
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 88);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 88);
  *(_QWORD *)(v3 + 88) = 0;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "setCompletedUnitCount:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "totalUnitCount"));
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v5 = v2;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v24;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v24 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * v9++), "cancel");
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v7);
  }

  v10 = (void *)MEMORY[0x18D765024](*(_QWORD *)(*(_QWORD *)(a1 + 32) + 120));
  v11 = *(_QWORD *)(a1 + 32);
  v12 = *(void **)(v11 + 120);
  *(_QWORD *)(v11 + 120) = 0;

  v13 = *(void **)(a1 + 40);
  v14 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 112);
  v17 = MEMORY[0x1E0C809B0];
  v18 = 3221225472;
  v19 = __49___GEOAttributionMigrationTask__finishWithError___block_invoke_2;
  v20 = &unk_1E1BFF970;
  v22 = v10;
  v21 = v13;
  v15 = v10;
  dispatch_async(v14, &v17);
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(WeakRetained, "_removeRunningTask:", *(_QWORD *)(a1 + 32), v17, v18, v19, v20);

}

uint64_t __49___GEOAttributionMigrationTask__finishWithError___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __38___GEOAttributionMigrationTask_cancel__block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:", -2);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_finishWithError:", v2);

}

@end
