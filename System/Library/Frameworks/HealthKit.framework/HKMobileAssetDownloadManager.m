@implementation HKMobileAssetDownloadManager

void __63___HKMobileAssetDownloadManager_downloadAssetsWithQueryParams___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "containsObject:", *(_QWORD *)(a1 + 40)) & 1) != 0)
  {
    _HKInitializeLogging();
    v2 = HKLogMobileAsset;
    if (os_log_type_enabled((os_log_t)HKLogMobileAsset, OS_LOG_TYPE_DEFAULT))
    {
      v3 = *(_QWORD *)(a1 + 32);
      v4 = *(_QWORD *)(a1 + 40);
      v8 = 138543618;
      v9 = v3;
      v10 = 2112;
      v11 = v4;
      _os_log_impl(&dword_19A0E6000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@: Load requested for queryParams already in progress: %@", (uint8_t *)&v8, 0x16u);
    }
  }
  else
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 32), *(id *)(a1 + 32));
    _HKInitializeLogging();
    v5 = HKLogMobileAsset;
    if (os_log_type_enabled((os_log_t)HKLogMobileAsset, OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(_QWORD *)(a1 + 32);
      v7 = *(_QWORD *)(a1 + 40);
      v8 = 138543618;
      v9 = v6;
      v10 = 2112;
      v11 = v7;
      _os_log_impl(&dword_19A0E6000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: Beginning load for queryParams: %@", (uint8_t *)&v8, 0x16u);
    }
    objc_msgSend(*(id *)(a1 + 32), "_queue_fetchAssetsWithLocalInformation:shouldRequery:queryParams:returnTypes:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 40), 1, *(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "addObject:", *(_QWORD *)(a1 + 40));
  }
}

void __93___HKMobileAssetDownloadManager_fetchAssetsWithQueryParams_onlyLocal_returnTypes_completion___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_generateAssetQueryFromQueryParams:returnTypes:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  _HKInitializeLogging();
  v3 = HKLogMobileAsset;
  if (os_log_type_enabled((os_log_t)HKLogMobileAsset, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v5 = 138543618;
    v6 = v4;
    v7 = 2112;
    v8 = v2;
    _os_log_impl(&dword_19A0E6000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: Beginning non-downloading fetch for query: %@", (uint8_t *)&v5, 0x16u);
  }
  objc_msgSend(*(id *)(a1 + 32), "_queue_fetchAssetsWithQuery:onlyLocal:completion:", v2, *(unsigned __int8 *)(a1 + 64), *(_QWORD *)(a1 + 48));

}

uint64_t __65___HKMobileAssetDownloadManager_downloadMobileAssets_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  NSObject *v5;
  int v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  _HKInitializeLogging();
  v2 = (void *)HKLogMobileAsset;
  if (os_log_type_enabled((os_log_t)HKLogMobileAsset, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v3 = *(void **)(a1 + 40);
    v5 = v2;
    v7 = 138543618;
    v8 = v4;
    v9 = 2048;
    v10 = objc_msgSend(v3, "count");
    _os_log_impl(&dword_19A0E6000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: Beginning download operation for %ld assets", (uint8_t *)&v7, 0x16u);

  }
  return objc_msgSend(*(id *)(a1 + 32), "_queue_downloadAssets:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void __63___HKMobileAssetDownloadManager_removeMobileAssets_completion___block_invoke(_QWORD *a1, void *a2)
{
  uint64_t v3;
  id v4;

  v4 = a2;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1[4] + 24));
  if (!*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24))
  {
    v3 = a1[5];
    if (v3)
      (*(void (**)(uint64_t, _QWORD, id))(v3 + 16))(v3, *(unsigned __int8 *)(*(_QWORD *)(a1[7] + 8) + 24), v4);
  }

}

void __63___HKMobileAssetDownloadManager_removeMobileAssets_completion___block_invoke_195(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  _QWORD v11[6];
  id v12;
  int8x16_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v2 = *(id *)(a1 + 32);
    v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v3)
    {
      v4 = v3;
      v5 = *(_QWORD *)v15;
      v6 = MEMORY[0x1E0C809B0];
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v15 != v5)
            objc_enumerationMutation(v2);
          v8 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v7);
          if (objc_msgSend(v8, "state") == 2 || objc_msgSend(v8, "state") == 3 || objc_msgSend(v8, "state") == 6)
          {
            v11[0] = v6;
            v11[1] = 3221225472;
            v11[2] = __63___HKMobileAssetDownloadManager_removeMobileAssets_completion___block_invoke_2;
            v11[3] = &unk_1E37F6B50;
            v13 = vextq_s8(*(int8x16_t *)(a1 + 56), *(int8x16_t *)(a1 + 56), 8uLL);
            v9 = *(void **)(a1 + 48);
            v11[4] = *(_QWORD *)(a1 + 40);
            v11[5] = v8;
            v12 = v9;
            objc_msgSend(v8, "purge:", v11);

          }
          else
          {
            --*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
            (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
          }
          ++v7;
        }
        while (v4 != v7);
        v10 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        v4 = v10;
      }
      while (v10);
    }

  }
  else
  {
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), 0);
  }
}

void __63___HKMobileAssetDownloadManager_removeMobileAssets_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  BOOL v5;
  char v6;
  NSObject *v7;
  uint64_t v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;

  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "_errorWithDomain:code:", CFSTR("MAPurgeResult"), a2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  if (v3)
    v5 = 1;
  else
    v5 = *(_BYTE *)(v4 + 24) == 0;
  v6 = !v5;
  *(_BYTE *)(v4 + 24) = v6;
  --*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
  _HKInitializeLogging();
  v7 = HKLogMobileAsset;
  if (v3)
  {
    if (os_log_type_enabled((os_log_t)HKLogMobileAsset, OS_LOG_TYPE_ERROR))
      __63___HKMobileAssetDownloadManager_removeMobileAssets_completion___block_invoke_2_cold_2((uint64_t)v3, a1, v7);
  }
  else if (os_log_type_enabled((os_log_t)HKLogMobileAsset, OS_LOG_TYPE_DEBUG))
  {
    __63___HKMobileAssetDownloadManager_removeMobileAssets_completion___block_invoke_2_cold_1(a1, v7, v8);
  }
  v9 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 24);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __63___HKMobileAssetDownloadManager_removeMobileAssets_completion___block_invoke_196;
  v12[3] = &unk_1E37E6D40;
  v10 = *(id *)(a1 + 48);
  v13 = v3;
  v14 = v10;
  v11 = v3;
  dispatch_async(v9, v12);

}

uint64_t __63___HKMobileAssetDownloadManager_removeMobileAssets_completion___block_invoke_196(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __82___HKMobileAssetDownloadManager__queue_fetchAssetsWithQuery_onlyLocal_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "_errorWithDomain:code:", CFSTR("MADownloadResult"), a2);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __82___HKMobileAssetDownloadManager__queue_fetchAssetsWithQuery_onlyLocal_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t *v3;
  void *v4;
  _QWORD v5[5];
  id v6;
  id v7;
  uint64_t v8;

  v3 = (uint64_t *)(a1 + 56);
  v2 = *(_QWORD *)(a1 + 56);
  if (*(_QWORD *)(*(_QWORD *)(v2 + 8) + 40))
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)HKLogMobileAsset, OS_LOG_TYPE_ERROR))
      __82___HKMobileAssetDownloadManager__queue_fetchAssetsWithQuery_onlyLocal_completion___block_invoke_2_cold_1();
    v2 = *v3;
  }
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __82___HKMobileAssetDownloadManager__queue_fetchAssetsWithQuery_onlyLocal_completion___block_invoke_199;
  v5[3] = &unk_1E37F6BF0;
  v4 = *(void **)(a1 + 40);
  v5[4] = *(_QWORD *)(a1 + 32);
  v8 = v2;
  v7 = *(id *)(a1 + 48);
  v6 = *(id *)(a1 + 40);
  objc_msgSend(v4, "queryMetaData:", v5);

}

void __82___HKMobileAssetDownloadManager__queue_fetchAssetsWithQuery_onlyLocal_completion___block_invoke_199(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  NSObject *v4;
  id v5;
  __int128 v6;
  _QWORD block[5];
  id v8;
  __int128 v9;
  uint64_t v10;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(NSObject **)(v3 + 24);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __82___HKMobileAssetDownloadManager__queue_fetchAssetsWithQuery_onlyLocal_completion___block_invoke_2_200;
  block[3] = &unk_1E37F6BC8;
  v10 = a2;
  block[4] = v3;
  v6 = *(_OWORD *)(a1 + 48);
  v5 = (id)v6;
  v9 = v6;
  v8 = *(id *)(a1 + 40);
  dispatch_async(v4, block);

}

void __82___HKMobileAssetDownloadManager__queue_fetchAssetsWithQuery_onlyLocal_completion___block_invoke_2_200(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  id v6;

  if (*(_QWORD *)(a1 + 64))
  {
    objc_msgSend(*(id *)(a1 + 32), "_errorWithDomain:code:", CFSTR("MAQueryResult"));
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = v2;

  }
  v5 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 40), "results");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, _QWORD))(v5 + 16))(v5, v6, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));

}

void __110___HKMobileAssetDownloadManager__queue_fetchAssetsWithLocalInformation_shouldRequery_queryParams_returnTypes___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "_errorWithDomain:code:", CFSTR("MADownloadResult"), a2);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __110___HKMobileAssetDownloadManager__queue_fetchAssetsWithLocalInformation_shouldRequery_queryParams_returnTypes___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  id *v4;
  id *v5;
  void *v6;
  id v7;
  id v8;
  __int128 v9;
  _QWORD v10[5];
  id v11;
  __int128 v12;
  uint64_t v13;
  __int16 v14;

  v2 = a1 + 48;
  v3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  v5 = (id *)(a1 + 32);
  v4 = *(id **)(a1 + 32);
  if (v3)
  {
    objc_msgSend(v4[2], "removeObject:", *(_QWORD *)(a1 + 40));
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)HKLogMobileAsset, OS_LOG_TYPE_ERROR))
      __110___HKMobileAssetDownloadManager__queue_fetchAssetsWithLocalInformation_shouldRequery_queryParams_returnTypes___block_invoke_2_cold_1();
    objc_msgSend(*v5, "_callErrorHandlerWithError:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)v2 + 8) + 40));
  }
  else
  {
    objc_msgSend(v4, "_generateAssetQueryFromQueryParams:returnTypes:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __110___HKMobileAssetDownloadManager__queue_fetchAssetsWithLocalInformation_shouldRequery_queryParams_returnTypes___block_invoke_201;
    v10[3] = &unk_1E37F6C90;
    v10[4] = *(_QWORD *)(a1 + 32);
    v11 = v6;
    v14 = *(_WORD *)(a1 + 64);
    v9 = *(_OWORD *)(a1 + 40);
    v7 = (id)v9;
    v12 = v9;
    v13 = *(_QWORD *)(a1 + 56);
    v8 = v6;
    objc_msgSend(v8, "queryMetaData:", v10);

  }
}

void __110___HKMobileAssetDownloadManager__queue_fetchAssetsWithLocalInformation_shouldRequery_queryParams_returnTypes___block_invoke_201(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  void *v4;
  NSObject *v5;
  id v6;
  uint64_t v7;
  _QWORD block[5];
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int16 v14;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(a1 + 40);
  v5 = *(NSObject **)(v3 + 24);
  block[0] = MEMORY[0x1E0C809B0];
  block[2] = __110___HKMobileAssetDownloadManager__queue_fetchAssetsWithLocalInformation_shouldRequery_queryParams_returnTypes___block_invoke_2_202;
  block[3] = &unk_1E37F6C68;
  block[1] = 3221225472;
  v11 = *(_QWORD *)(a1 + 56);
  v12 = a2;
  block[4] = v3;
  v9 = v4;
  v14 = *(_WORD *)(a1 + 72);
  v6 = *(id *)(a1 + 48);
  v7 = *(_QWORD *)(a1 + 64);
  v10 = v6;
  v13 = v7;
  dispatch_async(v5, block);

}

void __110___HKMobileAssetDownloadManager__queue_fetchAssetsWithLocalInformation_shouldRequery_queryParams_returnTypes___block_invoke_2_202(uint64_t a1)
{
  id *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  unsigned __int8 *v7;
  int v8;
  void *v9;
  NSObject *v10;
  const __CFString *v11;
  _QWORD v12[5];
  id v13;
  uint8_t buf[4];
  const __CFString *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 64))
  {
    v2 = (id *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 32), "_errorWithDomain:code:", CFSTR("MAQueryResult"));
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)HKLogMobileAsset, OS_LOG_TYPE_ERROR))
      __110___HKMobileAssetDownloadManager__queue_fetchAssetsWithLocalInformation_shouldRequery_queryParams_returnTypes___block_invoke_2_202_cold_1();
    objc_msgSend(*v2, "_callErrorHandlerWithError:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
  }
  objc_msgSend(*(id *)(a1 + 40), "results");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {

    goto LABEL_7;
  }
  if (!*(_BYTE *)(a1 + 80))
  {
LABEL_7:
    v7 = *(unsigned __int8 **)(a1 + 32);
    v8 = v7[41];
    objc_msgSend(*(id *)(a1 + 40), "results");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __110___HKMobileAssetDownloadManager__queue_fetchAssetsWithLocalInformation_shouldRequery_queryParams_returnTypes___block_invoke_207;
      v12[3] = &unk_1E37F6C40;
      v12[4] = *(_QWORD *)(a1 + 32);
      v13 = *(id *)(a1 + 48);
      objc_msgSend(v7, "_queue_downloadAssets:completion:", v9, v12);

    }
    else
    {
      objc_msgSend(v7, "_callDownloadCompletionHandlerWithAssets:queryParams:", v9, *(_QWORD *)(a1 + 48));

    }
    return;
  }
  _HKInitializeLogging();
  v10 = HKLogMobileAsset;
  if (os_log_type_enabled((os_log_t)HKLogMobileAsset, OS_LOG_TYPE_DEFAULT))
  {
    if (*(_BYTE *)(a1 + 81))
      v11 = CFSTR("remote");
    else
      v11 = CFSTR("local");
    *(_DWORD *)buf = 138543362;
    v15 = v11;
    _os_log_impl(&dword_19A0E6000, v10, OS_LOG_TYPE_DEFAULT, "Unable to fetch assets, fetching %{public}@ results.", buf, 0xCu);
  }
  objc_msgSend(*(id *)(a1 + 32), "_queue_fetchAssetsWithLocalInformation:shouldRequery:queryParams:returnTypes:", *(_BYTE *)(a1 + 81) == 0, 0, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 72));
}

uint64_t __110___HKMobileAssetDownloadManager__queue_fetchAssetsWithLocalInformation_shouldRequery_queryParams_returnTypes___block_invoke_207(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_callDownloadCompletionHandlerWithAssets:queryParams:", a2, *(_QWORD *)(a1 + 40));
}

_QWORD *__66___HKMobileAssetDownloadManager__queue_downloadAssets_completion___block_invoke(_QWORD *result)
{
  uint64_t v1;

  if (!*(_QWORD *)(*(_QWORD *)(result[5] + 8) + 24))
  {
    v1 = result[4];
    if (v1)
      return (_QWORD *)(*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(v1 + 16))(result[4], *(_QWORD *)(*(_QWORD *)(result[6] + 8) + 40), *(_QWORD *)(*(_QWORD *)(result[7] + 8) + 40));
  }
  return result;
}

void __66___HKMobileAssetDownloadManager__queue_downloadAssets_completion___block_invoke_2(_QWORD *a1, uint64_t a2, int a3, void *a4)
{
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  id *v15;
  uint64_t v16;
  id v17;

  v17 = a4;
  objc_msgSend(*(id *)(a1[4] + 8), "removeObject:", a2);
  if (a3)
  {
    v8 = *(_QWORD *)(a1[7] + 8);
    v9 = *(void **)(v8 + 40);
    if (v9)
    {
      v10 = v9;
      v11 = *(void **)(v8 + 40);
      *(_QWORD *)(v8 + 40) = v10;
    }
    else
    {
      v12 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v13 = *(_QWORD *)(a1[7] + 8);
      v11 = *(void **)(v13 + 40);
      *(_QWORD *)(v13 + 40) = v12;
    }

    objc_msgSend(*(id *)(*(_QWORD *)(a1[7] + 8) + 40), "addObject:", a1[5]);
  }
  --*(_QWORD *)(*(_QWORD *)(a1[8] + 8) + 24);
  v14 = *(_QWORD *)(a1[9] + 8);
  v16 = *(_QWORD *)(v14 + 40);
  v15 = (id *)(v14 + 40);
  if (!v16)
    objc_storeStrong(v15, a4);
  (*(void (**)(void))(a1[6] + 16))();

}

void __86___HKMobileAssetDownloadManager__callDownloadCompletionHandlerWithAssets_queryParams___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1[4] + 16), "removeObject:", a1[5]);
  v2 = _Block_copy(*(const void **)(a1[4] + 88));
  v5 = v2;
  if (v2)
    (*((void (**)(void *, _QWORD))v2 + 2))(v2, a1[6]);
  if (!objc_msgSend(*(id *)(a1[4] + 8), "count"))
  {
    v3 = a1[4];
    v4 = *(void **)(v3 + 32);
    *(_QWORD *)(v3 + 32) = 0;

  }
}

void __60___HKMobileAssetDownloadManager__callErrorHandlerWithError___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  v2 = _Block_copy(*(const void **)(*(_QWORD *)(a1 + 32) + 64));
  if (v2)
  {
    v3 = v2;
    (*((void (**)(void *, _QWORD))v2 + 2))(v2, *(_QWORD *)(a1 + 40));
    v2 = v3;
  }

}

void __63___HKMobileAssetDownloadManager_removeMobileAssets_completion___block_invoke_2_cold_1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 40);
  v4 = 138412290;
  v5 = v3;
  OUTLINED_FUNCTION_4_5(&dword_19A0E6000, a2, a3, "Purged asset (%@)", (uint8_t *)&v4);
  OUTLINED_FUNCTION_3();
}

void __63___HKMobileAssetDownloadManager_removeMobileAssets_completion___block_invoke_2_cold_2(uint64_t a1, uint64_t a2, NSObject *a3)
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 138543618;
  *(_QWORD *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 2112;
  *(_QWORD *)&v3[14] = *(_QWORD *)(a2 + 40);
  OUTLINED_FUNCTION_0(&dword_19A0E6000, a2, a3, "Failed to purge asset with error: %{public}@\n(%@)", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16]);
  OUTLINED_FUNCTION_3();
}

void __82___HKMobileAssetDownloadManager__queue_fetchAssetsWithQuery_onlyLocal_completion___block_invoke_2_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_3_6();
  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_0(&dword_19A0E6000, v0, v1, "%{public}@: Error querying remote assets: %{public}@, returning local assets.");
  OUTLINED_FUNCTION_3();
}

void __110___HKMobileAssetDownloadManager__queue_fetchAssetsWithLocalInformation_shouldRequery_queryParams_returnTypes___block_invoke_2_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_3_6();
  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_0(&dword_19A0E6000, v0, v1, "%{public}@: Error downloading catalog: %{public}@");
  OUTLINED_FUNCTION_3();
}

void __110___HKMobileAssetDownloadManager__queue_fetchAssetsWithLocalInformation_shouldRequery_queryParams_returnTypes___block_invoke_2_202_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_3_6();
  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_0(&dword_19A0E6000, v0, v1, "%{public}@: Error querying metadata: %{public}@");
  OUTLINED_FUNCTION_3();
}

@end
