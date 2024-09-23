@implementation INVocabularyStoreManager

void __73___INVocabularyStoreManager__iterateVocabularyWithSummary_optionalBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void (**v5)(id, _QWORD);
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  id v22;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  id v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    v6 = *(void **)(a1 + 32);
    v22 = 0;
    objc_msgSend(v6, "contentsOfDirectoryAtPath:error:", a2, &v22);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v22;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v9 = v7;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v27, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v19;
      while (2)
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v19 != v12)
            objc_enumerationMutation(v9);
          v14 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
          if ((objc_msgSend(*(id *)(a1 + 40), "containsObject:", v14, (_QWORD)v18) & 1) == 0)
          {
            v5[2](v5, v14);
            if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
            {

              goto LABEL_19;
            }
          }
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v27, 16);
        if (v11)
          continue;
        break;
      }
    }

    if (!v8)
      goto LABEL_19;
    objc_msgSend(v8, "domain");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v15, "isEqualToString:", *MEMORY[0x1E0CB28A8]))
    {
      v16 = objc_msgSend(v8, "code");

      if (v16 == 260)
      {
LABEL_19:

        goto LABEL_20;
      }
    }
    else
    {

    }
    v17 = INSiriLogContextIntents;
    if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v24 = "+[_INVocabularyStoreManager _iterateVocabularyWithSummary:optionalBlock:]_block_invoke";
      v25 = 2114;
      v26 = v8;
      _os_log_error_impl(&dword_18BEBC000, v17, OS_LOG_TYPE_ERROR, "%s Error listing user-vocabulary directories %{public}@", buf, 0x16u);
    }
    goto LABEL_19;
  }
LABEL_20:

}

void __81___INVocabularyStoreManager_writeLatestVocabularyItems_forIntentSlot_completion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  _INVocabularyStringTypeFromSlotName(*(void **)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 40), "_writeLatestVocabularyItems:forIntentSlot:completion:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56));
  }
  else
  {
    v3 = *(_QWORD *)(a1 + 56);
    v4 = (void *)MEMORY[0x1E0CB35C8];
    v5 = *MEMORY[0x1E0CB28A8];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unknown sync slot '%@'"), *(_QWORD *)(a1 + 32), CFSTR("reason"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "errorWithDomain:code:userInfo:", v5, 514, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v3 + 16))(v3, 0, v8);

  }
}

uint64_t __69___INVocabularyStoreManager_checkIfSyncSlot_isAllowedWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __73___INVocabularyStoreManager__iterateVocabularyWithSummary_optionalBlock___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  char v11;
  NSObject *v12;
  id v13;
  char v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (!objc_msgSend(*(id *)(a1 + 32), "containsObject:", v3))
  {
    objc_msgSend(*(id *)(a1 + 48), "stringByAppendingPathComponent:", v3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = INSiriLogContextIntents;
    if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v16 = "+[_INVocabularyStoreManager _iterateVocabularyWithSummary:optionalBlock:]_block_invoke";
      v17 = 2114;
      v18 = v8;
      _os_log_error_impl(&dword_18BEBC000, v9, OS_LOG_TYPE_ERROR, "%s Removing invalid user-vocabulary directory %{public}@", buf, 0x16u);
    }
    v10 = *(void **)(a1 + 64);
    v13 = 0;
    v11 = objc_msgSend(v10, "removeItemAtPath:error:", v8, &v13);
    v7 = v13;
    if ((v11 & 1) == 0)
    {
      v12 = INSiriLogContextIntents;
      if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v16 = "+[_INVocabularyStoreManager _iterateVocabularyWithSummary:optionalBlock:]_block_invoke";
        v17 = 2114;
        v18 = v7;
        _os_log_error_impl(&dword_18BEBC000, v12, OS_LOG_TYPE_ERROR, "%s Error removing invalid user-vocabulary directory %{public}@", buf, 0x16u);
      }
    }

    goto LABEL_10;
  }
  objc_msgSend(*(id *)(a1 + 40), "addObject:", v3);
  if (*(_QWORD *)(a1 + 72))
  {
    _INVocabularyStringTypeFromSlotName(v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "unsignedIntegerValue");

    v5 = *(void **)(a1 + 88);
    objc_msgSend(*(id *)(a1 + 48), "stringByAppendingPathComponent:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_latestVocabularyStringsAt:", v6);
    v7 = (id)objc_claimAutoreleasedReturnValue();

    v14 = 0;
    (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
LABEL_10:

  }
}

void __73___INVocabularyStoreManager__iterateVocabularyWithSummary_optionalBlock___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, void *);
  void *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  uint64_t v22;
  uint64_t v23;

  objc_msgSend(*(id *)(a1 + 32), "stringByAppendingPathComponent:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (*(_QWORD *)(a1 + 40))
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 48), "count"));
  else
    v4 = 0;
  v5 = *(_QWORD *)(a1 + 72);
  v12 = MEMORY[0x1E0C809B0];
  v13 = 3221225472;
  v14 = __73___INVocabularyStoreManager__iterateVocabularyWithSummary_optionalBlock___block_invoke_3;
  v15 = &unk_1E2289D60;
  v16 = *(id *)(a1 + 48);
  v6 = v4;
  v17 = v6;
  v7 = *(id *)(a1 + 80);
  v8 = *(_QWORD *)(a1 + 96);
  v21 = v7;
  v23 = v8;
  v9 = v3;
  v18 = v9;
  v10 = *(id *)(a1 + 56);
  v11 = *(_QWORD *)(a1 + 88);
  v19 = v10;
  v22 = v11;
  v20 = *(id *)(a1 + 64);
  (*(void (**)(uint64_t, id, uint64_t *))(v5 + 16))(v5, v9, &v12);
  if (objc_msgSend(v6, "count", v12, v13, v14, v15))
    objc_msgSend(*(id *)(a1 + 40), "setValue:forKey:", v6, *(_QWORD *)(a1 + 56));

}

void __68___INVocabularyStoreManager_deleteAllUserVocabularyFromAllAppsAsync__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_customVocabularyDirectory");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  INRemoveItemAtPath(v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = INSiriLogContextIntents;
  if (v2)
  {
    if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
    {
      v4 = 136315394;
      v5 = "+[_INVocabularyStoreManager deleteAllUserVocabularyFromAllAppsAsync]_block_invoke";
      v6 = 2114;
      v7 = v2;
      _os_log_error_impl(&dword_18BEBC000, v3, OS_LOG_TYPE_ERROR, "%s Failed to delete all user vocabulary with error %{public}@", (uint8_t *)&v4, 0x16u);
    }
  }
  else if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
  {
    v4 = 136315138;
    v5 = "+[_INVocabularyStoreManager deleteAllUserVocabularyFromAllAppsAsync]_block_invoke";
    _os_log_impl(&dword_18BEBC000, v3, OS_LOG_TYPE_INFO, "%s Finished deleting all user vocabulary", (uint8_t *)&v4, 0xCu);
  }

}

void __73___INVocabularyStoreManager__iterateVocabularyWithSummary_optionalBlock___block_invoke_39(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void (*v6)(uint64_t, id, _QWORD *);
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  __int128 v17;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "stringByAppendingPathComponent:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1 + 64);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __73___INVocabularyStoreManager__iterateVocabularyWithSummary_optionalBlock___block_invoke_2;
  v9[3] = &unk_1E2289D88;
  v10 = v4;
  v11 = *(id *)(a1 + 40);
  v12 = *(id *)(a1 + 48);
  v15 = *(id *)(a1 + 64);
  v16 = *(id *)(a1 + 72);
  v13 = v3;
  v17 = *(_OWORD *)(a1 + 80);
  v14 = *(id *)(a1 + 56);
  v6 = *(void (**)(uint64_t, id, _QWORD *))(v5 + 16);
  v7 = v3;
  v8 = v4;
  v6(v5, v8, v9);

}

void __46___INVocabularyStoreManager__globalClassQueue__block_invoke(uint64_t a1)
{
  dispatch_queue_t v1;
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.global"), *(_QWORD *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = dispatch_queue_create((const char *)objc_msgSend(v3, "UTF8String"), 0);
  v2 = (void *)_globalClassQueue_stGlobalClassQueue;
  _globalClassQueue_stGlobalClassQueue = (uint64_t)v1;

}

@end
