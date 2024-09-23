@implementation GEONetworkDefaultsLocalProxy

void __55___GEONetworkDefaultsLocalProxy__updateNetworkDefaults__block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  uint8_t buf[4];
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "_incompleteTaskMetrics");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v12 = *(void **)(v11 + 40);
  *(_QWORD *)(v11 + 40) = 0;

  v13 = v9;
  if (v8)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      GEOGetNetworkDefaultsLog();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v19 = objc_opt_class();
        _os_log_impl(&dword_1885A9000, v14, OS_LOG_TYPE_ERROR, "Invalid response class: %{public}@", buf, 0xCu);
      }

      if (!v13)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:", -11);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = 0;
        goto LABEL_8;
      }
      v7 = 0;
    }
  }
  v15 = v13;
LABEL_8:
  objc_msgSend(*(id *)(a1 + 32), "requestCompleted:", v15);
  objc_msgSend(*(id *)(a1 + 40), "_processNetworkDefaultsResponse:data:error:request:", v8, v7, v13, *(_QWORD *)(a1 + 48));
  objc_msgSend(v10, "_geo_clientMetrics");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  GEOApplicationIdentifierOrProcessName();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[GEONetworkEventDataRecorder recordNetworkEventDataForDataRequestKind:usedBackgroundURL:requestAppIdentifier:appMajorVersion:appMinorVersion:error:clientMetrics:additionalStates:](GEONetworkEventDataRecorder, "recordNetworkEventDataForDataRequestKind:usedBackgroundURL:requestAppIdentifier:appMajorVersion:appMinorVersion:error:clientMetrics:additionalStates:", 6, MEMORY[0x1E0C9AAA0], v17, 0, 0, v13, v16, 0);

  objc_msgSend(*(id *)(a1 + 56), "invalidateAndCancel");
}

uint64_t __66___GEONetworkDefaultsLocalProxy__callCompletionHandlersWithError___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t result;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "removeAllObjects");
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 52) = 0;
  return result;
}

void __83___GEONetworkDefaultsLocalProxy_updateNetworkDefaultsWithReason_completionHandler___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = *(_BYTE *)(a1[4] + 52);
  v2 = (void *)a1[5];
  if (v2)
  {
    v3 = *(void **)(a1[4] + 24);
    if (!v3)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 1);
      v4 = objc_claimAutoreleasedReturnValue();
      v5 = a1[4];
      v6 = *(void **)(v5 + 24);
      *(_QWORD *)(v5 + 24) = v4;

      v2 = (void *)a1[5];
      v3 = *(void **)(a1[4] + 24);
    }
    v7 = (id)objc_msgSend(v2, "copy");
    objc_msgSend(v3, "addObject:", v7);

  }
}

uint64_t __55___GEONetworkDefaultsLocalProxy__updateNetworkDefaults__block_invoke(uint64_t result)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(result + 40) + 8);
  if (*(_BYTE *)(*(_QWORD *)(result + 32) + 52))
  {
    *(_BYTE *)(v1 + 24) = 1;
  }
  else
  {
    *(_BYTE *)(v1 + 24) = 0;
    *(_BYTE *)(*(_QWORD *)(result + 32) + 52) = 1;
  }
  return result;
}

void __37___GEONetworkDefaultsLocalProxy_init__block_invoke(uint64_t a1)
{
  id global_queue;
  __int128 v3;
  __int128 v4;
  __int128 v5;

  global_queue = (id)geo_get_global_queue();
  _GEOConfigAddDelegateListenerForKey(GeoServicesConfig_UseProductionURLs, (uint64_t)off_1EDF4E868, global_queue, *(void **)(a1 + 32));
  v4 = 0u;
  v5 = 0u;
  v3 = 0u;
  _recordForType(0, (uint64_t)&v3);
  _GEOConfigAddDelegateListenerForKey(*((uint64_t *)&v3 + 1), v4, global_queue, *(void **)(a1 + 32));

}

uint64_t __83___GEONetworkDefaultsLocalProxy_updateNetworkDefaultsWithReason_completionHandler___block_invoke_94(uint64_t a1)
{
  atomic_store(0, (unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 53));
  return objc_msgSend(*(id *)(a1 + 32), "updateNetworkDefaultsWithReason:completionHandler:", 5, 0);
}

uint64_t __83___GEONetworkDefaultsLocalProxy_updateNetworkDefaultsWithReason_completionHandler___block_invoke_95(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateNetworkDefaults");
}

void __60___GEONetworkDefaultsLocalProxy_captureStatePlistWithHints___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  int v5;
  id v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  id v11;
  id v12;

  v12 = 0;
  readNetworkDefaultsFromFile((uint64_t *)&v12);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v12;
  if (v2)
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v2, CFSTR("CurrentValues"));
  +[GEOFilePaths urlFor:](GEOFilePaths, "urlFor:", 23);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  v5 = objc_msgSend(v4, "getResourceValue:forKey:error:", &v11, *MEMORY[0x1E0C998D8], 0);
  v6 = v11;

  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "timeIntervalSinceDate:", v6);
    v9 = v8;

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v10, CFSTR("Age"));

  }
}

@end
