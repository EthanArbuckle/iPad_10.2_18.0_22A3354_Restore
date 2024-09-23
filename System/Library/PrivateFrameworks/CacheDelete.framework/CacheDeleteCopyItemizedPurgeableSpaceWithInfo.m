@implementation CacheDeleteCopyItemizedPurgeableSpaceWithInfo

void __CacheDeleteCopyItemizedPurgeableSpaceWithInfo_block_invoke(uint64_t a1, void *a2)
{
  id v4;
  __int128 v5;
  _QWORD v6[4];
  __int128 v7;
  uint64_t v8;

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __CacheDeleteCopyItemizedPurgeableSpaceWithInfo_block_invoke_2;
  v6[3] = &unk_1E4A324A8;
  v5 = *(_OWORD *)(a1 + 32);
  v4 = (id)v5;
  v7 = v5;
  v8 = *(_QWORD *)(a1 + 48);
  objc_msgSend(a2, "clientUnifiedPurgeableSpace:queryType:replyBlock:", v4, 3, v6);

}

void __CacheDeleteCopyItemizedPurgeableSpaceWithInfo_block_invoke_2(uint64_t a1, void *a2)
{
  void *v4;
  char v5;
  void *v6;
  char v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;

  v13 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("CACHE_DELETE_INVALIDATE_CACHE"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = evaluateBoolProperty(v4);

    if ((v5 & 1) == 0)
    {
      +[CDPurgeableResultCache sharedPurgeableResultsCache](CDPurgeableResultCache, "sharedPurgeableResultsCache");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "absorbRecentInfo:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
      daemonCachedResults(*(void **)(a1 + 32), v9);
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v12 = *(void **)(v11 + 40);
      *(_QWORD *)(v11 + 40) = v10;

      goto LABEL_6;
    }
  }
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("CACHE_DELETE_INVALIDATE_CACHE"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = evaluateBoolProperty(v6);

  if ((v7 & 1) == 0)
  {
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = &unk_1E4A38EB0;
LABEL_6:

  }
}

void __CacheDeleteCopyItemizedPurgeableSpaceWithInfo_block_invoke_3(uint64_t a1, void *a2)
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
    _os_log_error_impl(&dword_1A3662000, v4, OS_LOG_TYPE_ERROR, "Failed to copy itemized purgeable space: %@", buf, 0xCu);
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
