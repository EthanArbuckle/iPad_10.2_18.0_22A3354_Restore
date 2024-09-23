@implementation CacheDeleteRequestCacheableSpaceGuidance

void __CacheDeleteRequestCacheableSpaceGuidance_block_invoke(uint64_t a1, void *a2)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v10[4];
  id v11;
  __int128 v12;
  uint64_t v13;
  uint64_t v14;

  v4 = *(void **)(a1 + 32);
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[2] = __CacheDeleteRequestCacheableSpaceGuidance_block_invoke_2;
  v10[3] = &unk_1E4A328E0;
  v6 = *(_QWORD *)(v5 + 40);
  v10[1] = 3221225472;
  v12 = *(_OWORD *)(a1 + 48);
  v7 = v4;
  v8 = *(_QWORD *)(a1 + 64);
  v11 = v7;
  v9 = *(_QWORD *)(a1 + 40);
  v13 = v8;
  v14 = v9;
  objc_msgSend(a2, "clientUnifiedPurgeableSpace:queryType:replyBlock:", v6, 4, v10);

}

void __CacheDeleteRequestCacheableSpaceGuidance_block_invoke_2(_QWORD *a1, void *a2)
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  uint8_t v15[16];

  v4 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(a1[5] + 8) + 40), a2);
  if (*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40))
  {
    +[CDPurgeableResultCache sharedPurgeableResultsCache](CDPurgeableResultCache, "sharedPurgeableResultsCache");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "absorbRecentInfo:", *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40));
    objc_msgSend(v5, "thresholdsForVolume:", a1[4]);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1[6] + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

    daemonCachedResults(*(void **)(*(_QWORD *)(a1[8] + 8) + 40), v5);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(a1[7] + 8);
    v11 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v9;

  }
  else
  {
    CDGetLogHandle((uint64_t)"client");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v15 = 0;
      _os_log_error_impl(&dword_1A3662000, v12, OS_LOG_TYPE_ERROR, "Falied to update the client cache", v15, 2u);
    }

    v13 = *(_QWORD *)(a1[7] + 8);
    v14 = *(void **)(v13 + 40);
    *(_QWORD *)(v13 + 40) = &unk_1E4A38ED8;

  }
}

void __CacheDeleteRequestCacheableSpaceGuidance_block_invoke_139(uint64_t a1, void *a2)
{
  void *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  uint8_t buf[4];
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  CDGetLogHandle((uint64_t)"client");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v11 = v3;
    _os_log_error_impl(&dword_1A3662000, v4, OS_LOG_TYPE_ERROR, "Failed to request cacheable space guidance: %@", buf, 0xCu);
  }

  v8 = CFSTR("CACHE_DELETE_ERROR");
  v9 = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v9, &v8, 1);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

@end
