@implementation CacheDeleteCopyAvailableSpaceForVolume

void __CacheDeleteCopyAvailableSpaceForVolume_block_invoke_2(uint64_t a1, void *a2)
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
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a2);
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    +[CDPurgeableResultCache sharedPurgeableResultsCache](CDPurgeableResultCache, "sharedPurgeableResultsCache");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "absorbRecentInfo:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
    daemonCachedResults(*(void **)(a1 + 32), v5);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

    objc_msgSend(v5, "thresholdsForVolume:", *(_QWORD *)(a1 + 40));
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
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
      _os_log_error_impl(&dword_1A3662000, v12, OS_LOG_TYPE_ERROR, "Falied to query the client cache", v15, 2u);
    }

    v13 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v14 = *(void **)(v13 + 40);
    *(_QWORD *)(v13 + 40) = &unk_1E4A38E60;

  }
}

void __CacheDeleteCopyAvailableSpaceForVolume_block_invoke(uint64_t a1, void *a2)
{
  void *v4;
  id v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  id v9;
  __int128 v10;
  uint64_t v11;

  v4 = *(void **)(a1 + 32);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __CacheDeleteCopyAvailableSpaceForVolume_block_invoke_2;
  v7[3] = &unk_1E4A32738;
  v10 = *(_OWORD *)(a1 + 48);
  v5 = v4;
  v6 = *(_QWORD *)(a1 + 64);
  v8 = v5;
  v11 = v6;
  v9 = *(id *)(a1 + 40);
  objc_msgSend(a2, "clientUnifiedPurgeableSpace:queryType:replyBlock:", v5, 2, v7);

}

void __CacheDeleteCopyAvailableSpaceForVolume_block_invoke_91(uint64_t a1, void *a2)
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  if (v4)
  {
    CDGetLogHandle((uint64_t)"client");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v4, "description");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 138412290;
      v8 = v6;
      _os_log_error_impl(&dword_1A3662000, v5, OS_LOG_TYPE_ERROR, "Failed to copy avaliable space: %@", (uint8_t *)&v7, 0xCu);

    }
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  }

}

@end
