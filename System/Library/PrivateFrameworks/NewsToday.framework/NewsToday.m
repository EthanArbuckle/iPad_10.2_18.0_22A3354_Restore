uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void NTPossiblySimulateCrashWithError(void *a1)
{
  id v1;
  NSObject *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  if (!v1 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    NTPossiblySimulateCrashWithError_cold_1();
  if ((FCShouldErrorBeExcludedFromSimulatedCrashes() & 1) == 0)
  {
    NTSharedLog();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v1, "description");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138412290;
      v13 = v3;
      _os_log_impl(&dword_2197E6000, v2, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v12, 0xCu);

    }
    NTSharedLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v1, "description");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138412290;
      v13 = v5;
      _os_log_impl(&dword_2197E6000, v4, OS_LOG_TYPE_INFO, "%@", (uint8_t *)&v12, 0xCu);

    }
    v6 = objc_alloc_init(MEMORY[0x24BDD16F0]);
    objc_msgSend(v6, "setNumberStyle:", 5);
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEA0]), "initWithLocaleIdentifier:", CFSTR("en_US"));
    objc_msgSend(v6, "setLocale:", v7);
    NTSharedLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      objc_msgSend(v1, "domain");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v1, "code"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "stringFromNumber:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543618;
      v13 = v9;
      v14 = 2114;
      v15 = v11;
      _os_log_impl(&dword_2197E6000, v8, OS_LOG_TYPE_FAULT, "%{public}@-%{public}@", (uint8_t *)&v12, 0x16u);

    }
  }

}

void sub_2197EA40C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_list va;

  va_start(va, a16);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __Block_byref_object_dispose_(uint64_t a1)
{

}

void __Block_byref_object_dispose__0(uint64_t a1)
{

}

void __Block_byref_object_dispose__1(uint64_t a1)
{

}

id NTSharedLog()
{
  if (NTSharedLog_once != -1)
    dispatch_once(&NTSharedLog_once, &__block_literal_global_0);
  return (id)NTSharedLog_result;
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, int a3, const char *a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint8_t buf)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &buf, 0x26u);
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x26u);
}

void OUTLINED_FUNCTION_0_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x26u);
}

void NTDeleteOnDiskAssets(void *a1)
{
  id v1;
  void *v2;
  id v3;
  _QWORD v4[4];
  id v5;

  v1 = a1;
  if (!v1 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    NTDeleteOnDiskAssets_cold_1();
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __NTDeleteOnDiskAssets_block_invoke;
  v4[3] = &unk_24DB5E560;
  v5 = v2;
  v3 = v2;
  objc_msgSend(v1, "enumerateObjectsUsingBlock:", v4);

}

id NTPBTodaySectionConfigGenerateArticle(void *a1, BOOL *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v14;

  v3 = a1;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x24BE6C700]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    NTPBTodaySectionConfigGenerateArticle_cold_1();
  objc_msgSend(v4, "setArticleID:", v5);
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x24BE6C708]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDisplayDateString:", v6);
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x24BE6C738]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setStoryType:", v7);
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x24BE6C730]);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v8)
  {
    v14 = 0;
    NTPBTodaySectionConfigGenerateArticle(v8, &v14);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
      objc_msgSend(v4, "setPaidArticle:", v10);

  }
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x24BE6C740]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTitle:", v11);
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x24BE6C6F8]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setActionURLString:", v12);

  if (a2)
    *a2 = v5 != 0;

  return v4;
}

id NTPBTodaySectionConfigGenerateArticles(void *a1, _BYTE *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v7[4];
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v3 = a1;
  if (!v3 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    NTPBTodaySectionConfigGenerateArticles_cold_1();
  v4 = (void *)objc_opt_new();
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 1;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __NTPBTodaySectionConfigGenerateArticles_block_invoke;
  v7[3] = &unk_24DB5E770;
  v5 = v4;
  v8 = v5;
  v9 = &v10;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v7);
  if (a2)
    *a2 = *((_BYTE *)v11 + 24);

  _Block_object_dispose(&v10, 8);
  return v5;
}

void sub_2197EEDA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id NTPBTodaySectionConfigGenerateItems(void *a1, void *a2, _BYTE *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;

  v5 = a1;
  v6 = a2;
  if (!v5 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    NTPBTodaySectionConfigGenerateItems_cold_1();
  v7 = (void *)objc_opt_new();
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 1;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __NTPBTodaySectionConfigGenerateItems_block_invoke;
  v10[3] = &unk_24DB5E770;
  v8 = v7;
  v11 = v8;
  v12 = &v13;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v10);
  if (a3)
    *a3 = *((_BYTE *)v14 + 24);

  _Block_object_dispose(&v13, 8);
  return v8;
}

void sub_2197EEF4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2197F1468(_Unwind_Exception *a1)
{
  _Block_object_dispose(&STACK[0x2A0], 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_2(void *a1, NSObject *a2, uint64_t a3, const char *a4)
{
  uint8_t *v4;

  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, v4, 0x26u);
}

uint64_t OUTLINED_FUNCTION_1_1@<X0>(uint64_t result@<X0>, int a2@<W8>)
{
  uint64_t v2;

  *(_DWORD *)(v2 + 24) = a2;
  *(_WORD *)(v2 + 28) = 2114;
  *(_QWORD *)(v2 + 30) = result;
  return result;
}

void OUTLINED_FUNCTION_2_0(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 14) = a1;
  *(_WORD *)(v1 + 22) = 1024;
}

void OUTLINED_FUNCTION_3_1(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 4) = a1;
  *(_WORD *)(v1 + 12) = 2080;
}

void OUTLINED_FUNCTION_4_1(void *a1, NSObject *a2, os_log_type_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, a3, a4, a5, 0x26u);
}

id OUTLINED_FUNCTION_5_0(id a1)
{
  return a1;
}

void OUTLINED_FUNCTION_0_3(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

id OUTLINED_FUNCTION_8(id a1)
{
  return a1;
}

id NNSetupCompanionSyncLog()
{
  if (NNSetupCompanionSyncLog_onceToken != -1)
    dispatch_once(&NNSetupCompanionSyncLog_onceToken, &__block_literal_global_3);
  return (id)NNSetupCompanionSyncLog_log;
}

id NNNanoSoloLog()
{
  if (NNNanoSoloLog_onceToken != -1)
    dispatch_once(&NNNanoSoloLog_onceToken, &__block_literal_global_4);
  return (id)NNNanoSoloLog_log;
}

id NNHeadlineSyncableResultFromResult(void *a1, int a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sync_expirationDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("sync_expirationDate"));
  objc_msgSend(v3, "sync_sections");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copy");

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v20 = v4;
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v7, "count"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v9 = v7;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v22;
      while (2)
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v22 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
          if (!objc_msgSend(v14, "conformsToProtocol:", &unk_2550AF348))
          {
            v4 = v20;
            goto LABEL_14;
          }
          NNHeadlineSyncableSectionFromSection(v14, a2);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "addObject:", v15);

        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
        if (v11)
          continue;
        break;
      }
    }

    v9 = (id)objc_msgSend(v8, "copy");
    v4 = v20;
    objc_msgSend(v20, "setObject:forKeyedSubscript:", v9, CFSTR("sync_sections"));
LABEL_14:

  }
  v16 = objc_msgSend(v3, "sync_headlineCount");
  if (v16 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v17, CFSTR("sync_headlineCount"));

  }
  v18 = (void *)objc_msgSend(v4, "copy");

  return v18;
}

id NNHeadlineSyncableSectionFromSection(void *a1, int a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  unint64_t v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v26;
  void *v27;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t v33[128];
  uint8_t buf[4];
  id v35;
  __int16 v36;
  unint64_t v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sync_identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("sync_identifier"));
  objc_msgSend(v3, "sync_name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, CFSTR("sync_name"));
  NNSetupCompanionSyncLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v35 = v8;
    v36 = 2112;
    v37 = (unint64_t)v6;
    _os_log_impl(&dword_2197E6000, v9, OS_LOG_TYPE_INFO, "Creating Syncable Section with name=%@ and ID = %@…", buf, 0x16u);
  }

  v10 = objc_msgSend(v3, "sync_type");
  if (v10 > 5)
  {
    NNSetupCompanionSyncLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v35 = v3;
      v36 = 2048;
      v37 = v10;
      _os_log_impl(&dword_2197E6000, v11, OS_LOG_TYPE_INFO, "Didn't know what this section type was: %@ %lu", buf, 0x16u);
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v10);
    v11 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v11, CFSTR("sync_type"));
  }

  objc_msgSend(v3, "sync_colorHexString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v12, "copy");

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v13, CFSTR("sync_colorHexString"));
  objc_msgSend(v3, "sync_headlines");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v14, "copy");

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v26 = v13;
    v27 = v8;
    v28 = v6;
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v15, "count"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v17 = v15;
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v30;
LABEL_16:
      v21 = 0;
      while (1)
      {
        if (*(_QWORD *)v30 != v20)
          objc_enumerationMutation(v17);
        v22 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * v21);
        if (!objc_msgSend(v22, "conformsToProtocol:", &unk_2550AF3A8))
          break;
        NNHeadlineSyncableResultFromHeadline(v22, a2);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "addObject:", v23);

        if (v19 == ++v21)
        {
          v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
          if (v19)
            goto LABEL_16;
          goto LABEL_22;
        }
      }
    }
    else
    {
LABEL_22:

      v17 = (id)objc_msgSend(v16, "copy");
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v17, CFSTR("sync_headlines"));
    }

    v8 = v27;
    v6 = v28;
    v13 = v26;
  }
  v24 = (void *)objc_msgSend(v4, "copy");

  return v24;
}

id NNHeadlineSyncableResultFromHeadline(void *a1, int a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v15;

  v3 = a1;
  objc_msgSend(v3, "sync_identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sync_title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sync_excerpt");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = a2;
  if (a2)
  {
    objc_msgSend(v3, "sync_thumbnailImageData");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "sync_publisherLogoImageData");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
    v8 = 0;
  }
  objc_msgSend(v3, "sync_publisherName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sync_publisherIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sync_NewsURLString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v4;
  NNCreateHeadlineSyncableHeadline(v4, v5, v6, v7, v8, v9, v10, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {

  }
  return v13;
}

id NNCreateHeadlineSyncableHeadline(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  id v38;
  id v39;

  v15 = a2;
  v39 = a3;
  v16 = a4;
  v17 = a5;
  v38 = a6;
  v37 = a7;
  v18 = a8;
  v19 = (void *)MEMORY[0x24BDBCED8];
  v20 = a1;
  objc_msgSend(v19, "dictionary");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v20, "copy");

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v21, "setObject:forKeyedSubscript:", v22, CFSTR("sync_identifier"));
  v33 = (void *)v22;
  v36 = v15;
  v23 = (void *)objc_msgSend(v15, "copy");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v21, "setObject:forKeyedSubscript:", v23, CFSTR("sync_title"));
  v24 = (void *)objc_msgSend(v39, "copy");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v21, "setObject:forKeyedSubscript:", v24, CFSTR("sync_excerpt"));
  v34 = v18;
  v25 = (void *)objc_msgSend(v18, "copy");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v21, "setObject:forKeyedSubscript:", v25, CFSTR("sync_NewsURLString"));
  v35 = v16;
  v26 = (void *)objc_msgSend(v16, "copy");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v21, "setObject:forKeyedSubscript:", v26, CFSTR("sync_thumbnailImageData"));
  v27 = v17;
  v28 = (void *)objc_msgSend(v17, "copy");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v21, "setObject:forKeyedSubscript:", v28, CFSTR("sync_publisherLogoImageData"));
  v29 = (void *)objc_msgSend(v38, "copy");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v21, "setObject:forKeyedSubscript:", v29, CFSTR("sync_publisherName"));
  v30 = (void *)objc_msgSend(v37, "copy");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v21, "setObject:forKeyedSubscript:", v30, CFSTR("sync_publisherIdentifier"));
  v31 = (void *)objc_msgSend(v21, "copy");

  return v31;
}

void sub_2197F4508(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

NTCatchUpOperationArticleIDsRequest *NTArticleIDsRequestWithArticles(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  id v4;
  id v5;
  NTCatchUpOperationArticleIDsRequest *v6;
  NTCatchUpOperationArticleIDsRequest *v7;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, void *);
  void *v12;
  id v13;
  id v14;

  v1 = a1;
  if (!v1 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    NTArticleIDsRequestWithArticles_cold_1();
  v2 = (void *)objc_opt_new();
  v3 = (void *)objc_opt_new();
  v9 = MEMORY[0x24BDAC760];
  v10 = 3221225472;
  v11 = __NTArticleIDsRequestWithArticles_block_invoke;
  v12 = &unk_24DB5E930;
  v13 = v2;
  v14 = v3;
  v4 = v3;
  v5 = v2;
  objc_msgSend(v1, "enumerateObjectsUsingBlock:", &v9);
  v6 = [NTCatchUpOperationArticleIDsRequest alloc];
  v7 = -[NTCatchUpOperationArticleIDsRequest initWithArticleIDs:overrideHeadlineMetadataByArticleID:](v6, "initWithArticleIDs:overrideHeadlineMetadataByArticleID:", v5, v4, v9, v10, v11, v12);

  return v7;
}

uint64_t FCConsumedArticleFilterMethodForReadArticlesFilterMethod(int a1)
{
  if (a1 == 1)
    return 1;
  else
    return 2 * (a1 == 0);
}

uint64_t FCConsumedArticleFilterMethodForSeenArticlesFilterMethod(int a1)
{
  if (a1 == 1)
    return 1;
  else
    return 2 * (a1 == 2);
}

void sub_2197F5D10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2197F6C64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,char a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,char a49)
{
  uint64_t v49;

  _Block_object_dispose(&a37, 8);
  _Block_object_dispose(&a43, 8);
  _Block_object_dispose(&a49, 8);
  _Block_object_dispose((const void *)(v49 - 240), 8);
  _Block_object_dispose((const void *)(v49 - 192), 8);
  _Block_object_dispose((const void *)(v49 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_2197FAF1C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2197FC1F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_list va;

  va_start(va, a6);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2197FE2E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  uint64_t v12;
  va_list va;

  va_start(va, a12);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v12 - 120), 8);
  _Unwind_Resume(a1);
}

void sub_2197FEEE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2197FF010(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_219803560(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t NTDesiredHeadlineFieldAssetOptionsWithAssetSizes(unint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  if (a1 > 3)
    v2 = 0;
  else
    v2 = qword_219821DE8[a1];
  v3 = v2 | 0x20;
  v4 = v2 | 0x80020;
  if (!a2)
    v2 |= 0x10uLL;
  if (a2 == 1)
    v2 = v4;
  if (a2 == 2)
    return v3;
  else
    return v2;
}

uint64_t NTDesiredHeadlineFieldOptionsWithAssetOptions(uint64_t a1)
{
  return a1 | 1;
}

void sub_2198044DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  id *v18;

  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

double NTHeadlineThumbnailLengthFromThumbnailSizePreset(unint64_t a1)
{
  double result;

  result = 0.0;
  if (a1 <= 3)
    return dbl_219821E08[a1];
  return result;
}

double NTHeadlineSourceNameImageHeightFromNameImageSizePreset(unint64_t a1)
{
  double result;

  result = 0.0;
  if (a1 <= 2)
    return dbl_219821E28[a1];
  return result;
}

void sub_219806C90(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 96));
  _Unwind_Resume(a1);
}

void sub_219808B6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id NTAssetFileURL(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;

  v1 = a1;
  if (!v1 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    NTAssetFileURL_cold_1();
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "URLByAppendingPathComponent:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id NTAssetFileURLWithData(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;

  v3 = a1;
  v4 = a2;
  if (!v3 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    NTAssetFileURLWithData_cold_2();
    if (v4)
      goto LABEL_6;
  }
  else if (v4)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    NTAssetFileURLWithData_cold_1();
LABEL_6:
  NTAssetFileURL(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "writeToURL:atomically:", v5, 1);

  return v5;
}

id NTAssetFileURLWithFile(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;

  v3 = a1;
  v4 = a2;
  if (!v3 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    NTAssetFileURLWithFile_cold_2();
    if (v4)
      goto LABEL_6;
  }
  else if (v4)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    NTAssetFileURLWithFile_cold_1();
LABEL_6:
  NTAssetFileURL(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "copyItemAtURL:toURL:error:", v3, v5, 0);

  return v5;
}

BOOL NTIsUserInExperiment(void *a1, double a2, double a3)
{
  unint64_t v5;
  unint64_t v6;

  if (a1)
    v5 = objc_msgSend(a1, "hash") % 0x64uLL;
  else
    v5 = 0;
  v6 = vcvtmd_u64_f64(a3 * 100.0);
  return v5 >= vcvtmd_u64_f64(a2 * 100.0) && v5 < v6;
}

unint64_t NTSectionFeedItemsLimit(int a1, void *a2, unint64_t a3, double a4)
{
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  unint64_t v14;
  double v15;

  v7 = a2;
  if (!v7 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    NTSectionFeedItemsLimit_cold_2();
  if (a4 < 0.0 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    NTSectionFeedItemsLimit_cold_1();
  v8 = 0.0;
  if (a1)
    objc_msgSend(v7, "sectionTitleSlotCost", 0.0);
  v9 = a4 - v8;
  objc_msgSend(v7, "sectionFooterSlotCost");
  v11 = v9 - v10;
  objc_msgSend(v7, "headlineSlotCost");
  v13 = v11 - v12;
  if (v13 >= 0.0)
  {
    objc_msgSend(v7, "headlineSlotCost");
    v14 = (unint64_t)(floor(v13 / v15) + 1.0);
  }
  else
  {
    v14 = 0;
  }
  if (v14 < a3)
    a3 = v14;

  return a3;
}

id NTCKRecordFromArticleJSONDictionary(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v1 = (void *)*MEMORY[0x24BE6C6B8];
  v2 = a1;
  NTNewsEdgeArticleRecordOverrideKeys();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  NTNewsEdgeArticleEncodedFields();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NTNewsEdgeArticleDateFields();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NTCKRecordFromJSONDictionary(v2, v1, v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id NTCKRecordFromJSONDictionary(void *a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v24;
  void *v25;
  _QWORD v26[4];
  id v27;
  id v28;
  id v29;
  id v30;

  v9 = a1;
  v10 = a2;
  v11 = a3;
  v12 = a4;
  v13 = a5;
  FCAppConfigurationStringValue();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  FCAppConfigurationStringValue();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  FCAppConfigurationStringValue();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  if (v14 && v15)
  {
    v18 = objc_alloc(MEMORY[0x24BDB91F8]);
    v24 = (void *)objc_msgSend(v18, "initWithZoneName:ownerName:", *MEMORY[0x24BDB8F38], *MEMORY[0x24BDB8E88]);
    v19 = v10;
    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDB91E8]), "initWithRecordName:zoneID:", v14, v24);
    v25 = v19;
    v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDB91D8]), "initWithRecordType:recordID:", v19, v20);
    objc_msgSend(v21, "setEtag:", v15);
    if (v16)
      objc_msgSend(MEMORY[0x24BDBCE60], "fc_dateFromStringWithISO8601Format:", v16);
    else
      objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setModificationDate:", v22);

    v26[0] = MEMORY[0x24BDAC760];
    v26[1] = 3221225472;
    v26[2] = __NTCKRecordFromJSONDictionary_block_invoke;
    v26[3] = &unk_24DB5FA70;
    v27 = v11;
    v28 = v12;
    v17 = v21;
    v29 = v17;
    v30 = v13;
    objc_msgSend(v9, "enumerateKeysAndObjectsUsingBlock:", v26);

    v10 = v25;
  }

  return v17;
}

id NTNewsEdgeArticleRecordOverrideKeys()
{
  if (NTNewsEdgeArticleRecordOverrideKeys_onceToken != -1)
    dispatch_once(&NTNewsEdgeArticleRecordOverrideKeys_onceToken, &__block_literal_global_14);
  return (id)NTNewsEdgeArticleRecordOverrideKeys_result;
}

id NTNewsEdgeArticleEncodedFields()
{
  if (NTNewsEdgeArticleEncodedFields_onceToken != -1)
    dispatch_once(&NTNewsEdgeArticleEncodedFields_onceToken, &__block_literal_global_24_0);
  return (id)NTNewsEdgeArticleEncodedFields_result;
}

id NTNewsEdgeArticleDateFields()
{
  if (NTNewsEdgeArticleDateFields_onceToken != -1)
    dispatch_once(&NTNewsEdgeArticleDateFields_onceToken, &__block_literal_global_27);
  return (id)NTNewsEdgeArticleDateFields_result;
}

id NTCKRecordFromTagJSONDictionary(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  void *v4;
  void *v5;

  v1 = (void *)*MEMORY[0x24BE6C6F0];
  v2 = a1;
  NTNewsEdgeTagRecordOverrideKeys();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  NTNewsEdgeTagEncodedFields();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NTCKRecordFromJSONDictionary(v2, v1, v3, v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id NTNewsEdgeTagRecordOverrideKeys()
{
  if (NTNewsEdgeTagRecordOverrideKeys_onceToken != -1)
    dispatch_once(&NTNewsEdgeTagRecordOverrideKeys_onceToken, &__block_literal_global_23);
  return (id)NTNewsEdgeTagRecordOverrideKeys_result;
}

id NTNewsEdgeTagEncodedFields()
{
  if (NTNewsEdgeTagEncodedFields_onceToken != -1)
    dispatch_once(&NTNewsEdgeTagEncodedFields_onceToken, &__block_literal_global_28_0);
  return (id)NTNewsEdgeTagEncodedFields_result;
}

id NTCKRecordFromArticleListJSONDictionary(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  void *v4;

  v1 = (void *)*MEMORY[0x24BE6C6A0];
  v2 = a1;
  NTNewsEdgeArticleListRecordOverrideKeys();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  NTCKRecordFromJSONDictionary(v2, v1, v3, 0, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id NTNewsEdgeArticleListRecordOverrideKeys()
{
  if (NTNewsEdgeArticleListRecordOverrideKeys_onceToken != -1)
    dispatch_once(&NTNewsEdgeArticleListRecordOverrideKeys_onceToken, &__block_literal_global_22_0);
  return (id)NTNewsEdgeArticleListRecordOverrideKeys_result;
}

id NTHeadlineThumbnailFromFCHeadline(void *a1, uint64_t a2)
{
  id v3;
  uint64_t v4;
  void *v5;

  v3 = a1;
  if (!v3 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    NTHeadlineThumbnailFromFCHeadline_cold_1();
  switch(a2)
  {
    case 0:
      objc_msgSend(v3, "thumbnailWidgetLQ");
      v4 = objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    case 1:
      objc_msgSend(v3, "thumbnailWidget");
      v4 = objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    case 2:
      objc_msgSend(v3, "thumbnailWidgetHQ");
      v4 = objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    case 3:
      FCThumbnailForHeadlineMinimumSizeInPixels();
      v4 = objc_claimAutoreleasedReturnValue();
LABEL_10:
      v5 = (void *)v4;
      break;
    default:
      v5 = 0;
      break;
  }

  return v5;
}

id NTHeadlineSourceNameImageMaskAssetHandleFromFCHeadline(void *a1, uint64_t a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v3 = a1;
  if (!v3 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    NTHeadlineSourceNameImageMaskAssetHandleFromFCHeadline_cold_1();
  objc_msgSend(v3, "sourceChannel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (a2 == 2)
    goto LABEL_10;
  if (a2 == 1)
  {
    objc_msgSend(v4, "nameImageCompactAssetHandle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(v5, "nameImageCompactAssetHandle");
      v6 = objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    }
LABEL_10:
    objc_msgSend(v5, "nameImageMaskWidgetHQAssetHandle");
    v6 = objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }
  if (a2)
  {
    v8 = 0;
    goto LABEL_13;
  }
  objc_msgSend(v4, "nameImageMaskWidgetLQAssetHandle");
  v6 = objc_claimAutoreleasedReturnValue();
LABEL_11:
  v8 = (void *)v6;
LABEL_13:

  return v8;
}

id NTHeadlineAdElementFromFCHeadline(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;

  v1 = a1;
  if (!v1 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    NTHeadlineAdElementFromFCHeadline_cold_1();
  v2 = (void *)objc_opt_new();
  objc_msgSend(v1, "articleID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setArticleID:", v3);

  objc_msgSend(v1, "primaryAudience");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setArticleRating:", v4);

  objc_msgSend(v2, "setPaidArticle:", objc_msgSend(v1, "isPaid"));
  objc_msgSend(v2, "setSponsoredArticle:", objc_msgSend(v1, "isSponsored"));
  objc_msgSend(v2, "setDraftArticle:", objc_msgSend(v1, "isDraft"));
  objc_msgSend(v1, "sourceChannel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "primaryAudience");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setChannelRating:", v6);

  objc_msgSend(v1, "sourceChannel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setChannelID:", v8);

  objc_msgSend(v1, "iAdCategories");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "mutableCopy");
  objc_msgSend(v2, "setArticleIAdCategories:", v10);

  objc_msgSend(v1, "iAdKeywords");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "mutableCopy");
  objc_msgSend(v2, "setArticleIAdKeywords:", v12);

  objc_msgSend(v1, "iAdSectionIDs");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "mutableCopy");
  objc_msgSend(v2, "setArticleIAdSectionIDs:", v14);

  objc_msgSend(v1, "sourceChannel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "iAdKeywords");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v16, "mutableCopy");
  objc_msgSend(v2, "setChannelIAdKeywords:", v17);

  objc_msgSend(v1, "sourceChannel");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "iAdCategories");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v19, "mutableCopy");
  objc_msgSend(v2, "setChannelIAdCategories:", v20);

  objc_msgSend(v1, "sourceChannel");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setChannelContentProviderID:", objc_msgSend(v21, "contentProvider"));

  return v2;
}

id NTHeadlineAnalyticsElementFromFCHeadline(void *a1, int a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = a1;
  if (!v3 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    NTHeadlineAnalyticsElementFromFCHeadline_cold_1();
  objc_msgSend(v3, "articleID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x219A339D0](v3);
  if (a2 == 2)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@-%lld"), v4, v5);
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (a2 != 1)
    {
      v7 = 0;
      goto LABEL_10;
    }
    v6 = objc_msgSend(v4, "copy");
  }
  v7 = (void *)v6;
LABEL_10:
  v8 = (void *)objc_opt_new();
  objc_msgSend(v8, "setArticleID:", v4);
  objc_msgSend(v8, "setArticleVersion:", v5);
  objc_msgSend(v8, "setNeedsSeenStateTracking:", v7 != 0);
  objc_msgSend(v3, "sourceChannel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setChannelID:", v10);

  objc_msgSend(v8, "setPreseenCountTrackingIdentifier:", v7);
  return v8;
}

id NTHeadlineBackingElementFromFCHeadline(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;

  v1 = a1;
  v2 = (void *)objc_opt_new();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v1, "backingArticleRecordData");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setArticleRecordData:", v3);

  }
  objc_msgSend(v1, "sourceChannel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    objc_msgSend(v1, "sourceChannel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "backingTagRecordData");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setSourceChannelRecordData:", v7);

  }
  return v2;
}

NTHeadline *NTHeadlineFromFCHeadline(void *a1, void *a2, void *a3, uint64_t a4, uint64_t a5, void *a6, void *a7, void *a8, void *a9, void *a10, void *a11)
{
  id v17;
  id v18;
  id v19;
  NTHeadline *v20;
  void *v21;
  NTHeadline *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  void *v35;
  void *v36;
  void *v37;
  double v38;
  double v39;
  double v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  const __CFString *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  int v76;
  id v77;
  NTHeadlinePersonalizationMetadata *v78;
  void *v79;
  void *v80;
  NTHeadlinePersonalizationMetadata *v81;
  void *v82;
  void *v84;
  void *v85;
  void *v87;
  id v88;
  id v89;
  id v90;
  id v91;
  id v92;
  id v93;
  id v94;
  id v95;
  _QWORD v96[4];
  id v97;
  int v98;
  _QWORD v99[4];
  id v100;
  id v101;
  char v102;

  v17 = a1;
  v95 = a2;
  v91 = a3;
  v94 = a6;
  v93 = a7;
  v92 = a8;
  v90 = a9;
  v18 = a10;
  v19 = a11;
  if (!v17 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    NTHeadlineFromFCHeadline_cold_1();
  v20 = [NTHeadline alloc];
  objc_msgSend(v17, "identifier");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = -[NTHeadline initWithIdentifier:](v20, "initWithIdentifier:", v21);

  objc_msgSend(v17, "title");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTHeadline setTitle:](v22, "setTitle:", v23);

  objc_msgSend(v17, "titleCompact");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTHeadline setTitleCompact:](v22, "setTitleCompact:", v24);

  objc_msgSend(v17, "shortExcerpt");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTHeadline setShortExcerpt:](v22, "setShortExcerpt:", v25);

  v99[0] = MEMORY[0x24BDAC760];
  v99[1] = 3221225472;
  v99[2] = __NTHeadlineFromFCHeadline_block_invoke;
  v99[3] = &unk_24DB5FB80;
  v102 = 1;
  v89 = v19;
  v100 = v89;
  v88 = v18;
  v101 = v88;
  v26 = MEMORY[0x219A33CDC](v99);
  NTHeadlineThumbnailFromFCHeadline(v17, a4);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "thumbnailAssetHandle");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  (*(void (**)(uint64_t, void *))(v26 + 16))(v26, v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTHeadline setThumbnailRemoteURL:](v22, "setThumbnailRemoteURL:", v29);

  v85 = v28;
  objc_msgSend(v28, "uniqueKey");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTHeadline setThumbnailIdentifier:](v22, "setThumbnailIdentifier:", v30);

  -[NTHeadline setThumbnailSizePreset:](v22, "setThumbnailSizePreset:", a4);
  if (a4 == 3)
  {
    objc_msgSend(v17, "thumbnailFocalFrame");
  }
  else
  {
    v31 = 0.0;
    v32 = 0.0;
    v33 = 1.0;
    v34 = 1.0;
  }
  -[NTHeadline setThumbnailFocalFrame:](v22, "setThumbnailFocalFrame:", v31, v32, v33, v34);
  NTHeadlineSourceNameImageMaskAssetHandleFromFCHeadline(v17, a5);
  v87 = (void *)v26;
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t))(v26 + 16))(v26);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTHeadline setSourceNameImageRemoteURL:](v22, "setSourceNameImageRemoteURL:", v35);

  objc_msgSend(v17, "sourceChannel");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "theme");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "bannerImageScale");
  v39 = v38;

  if (fabs(v39) >= 0.1)
    v40 = v39;
  else
    v40 = 1.0;
  -[NTHeadline setSourceNameImageScale:](v22, "setSourceNameImageScale:", v40);
  objc_msgSend(v36, "theme");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "bannerImageForMask");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "assetHandle");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "remoteURL");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTHeadline setCompactSourceNameImageRemoteURL:](v22, "setCompactSourceNameImageRemoteURL:", v44);

  objc_msgSend(v36, "name");
  v45 = objc_claimAutoreleasedReturnValue();
  v46 = (void *)v45;
  if (v45)
    v47 = (const __CFString *)v45;
  else
    v47 = &stru_24DB606B8;
  -[NTHeadline setSourceName:](v22, "setSourceName:", v47);

  objc_msgSend(v36, "nameCompact");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTHeadline setCompactSourceName:](v22, "setCompactSourceName:", v48);

  objc_msgSend(v17, "sourceChannel");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "identifier");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTHeadline setSourceTagID:](v22, "setSourceTagID:", v50);

  objc_msgSend(v17, "language");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTHeadline setLanguage:](v22, "setLanguage:", v51);

  objc_msgSend(v17, "displayDate");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  if (v52)
  {
    -[NTHeadline setAgeDisplayDate:](v22, "setAgeDisplayDate:", v52);
  }
  else
  {
    objc_msgSend(v17, "publishDate");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTHeadline setAgeDisplayDate:](v22, "setAgeDisplayDate:", v53);

  }
  if (v95)
  {
    -[NTHeadline setNewsURL:](v22, "setNewsURL:", v95);
  }
  else
  {
    objc_msgSend(v17, "routeURL");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    if (v54)
    {
      -[NTHeadline setNewsURL:](v22, "setNewsURL:", v54);
    }
    else
    {
      v55 = (void *)MEMORY[0x24BDBCF48];
      objc_msgSend(v17, "articleID");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "fc_NewsURLForArticleID:hardPaywall:", v56, 1);
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      -[NTHeadline setNewsURL:](v22, "setNewsURL:", v57);

    }
  }
  objc_msgSend(v17, "storyStyle");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "storyStyle");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "label");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTHeadline setStoryType:](v22, "setStoryType:", v60);

  objc_msgSend(v58, "foreground_color");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "hex");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTHeadline setStoryTypeColorLight:](v22, "setStoryTypeColorLight:", v62);

  objc_msgSend(v58, "dark_style_foreground_color");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "hex");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTHeadline setStoryTypeColorDark:](v22, "setStoryTypeColorDark:", v64);

  objc_msgSend(v17, "topicIDs");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTHeadline setTopicIDs:](v22, "setTopicIDs:", v65);

  -[NTHeadline setAnalyticsElement:](v22, "setAnalyticsElement:", v93);
  -[NTHeadline setAdElement:](v22, "setAdElement:", v94);
  -[NTHeadline setBackingElement:](v22, "setBackingElement:", v92);
  -[NTHeadline setSupportsSavingForLater:](v22, "setSupportsSavingForLater:", 1);
  -[NTHeadline setHiddenFromAutoFavorites:](v22, "setHiddenFromAutoFavorites:", objc_msgSend(v17, "isHiddenFromAutoFavorites"));
  objc_msgSend(v17, "contentWithContext:", v91);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "anfContent");
  v67 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v67, "anfDocumentAssetHandles");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "firstObject");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "remoteURL");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTHeadline setFlintDocumentURL:](v22, "setFlintDocumentURL:", v70);

  objc_msgSend(v17, "videoCallToActionTitle");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTHeadline setVideoCallToActionTitle:](v22, "setVideoCallToActionTitle:", v71);

  objc_msgSend(v17, "videoCallToActionURL");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTHeadline setVideoCallToActionURL:](v22, "setVideoCallToActionURL:", v72);

  v73 = (void *)objc_opt_new();
  objc_msgSend(v90, "purchasedTagIDs");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "sourceChannelID");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  v76 = objc_msgSend(v74, "containsObject:", v75);

  v96[0] = MEMORY[0x24BDAC760];
  v96[1] = 3221225472;
  v96[2] = __NTHeadlineFromFCHeadline_block_invoke_18;
  v96[3] = &unk_24DB5FBA8;
  v98 = v76;
  v97 = v73;
  v77 = v73;
  objc_msgSend(v17, "enumerateTopicCohortsWithBlock:", v96);
  v78 = [NTHeadlinePersonalizationMetadata alloc];
  objc_msgSend(v17, "articleID");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "publisherID");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  v81 = -[NTHeadlinePersonalizationMetadata initWithArticleID:publisherID:scoredTopicIDs:](v78, "initWithArticleID:publisherID:scoredTopicIDs:", v79, v80, v77);
  -[NTHeadline setPersonalizationMetadata:](v22, "setPersonalizationMetadata:", v81);

  objc_msgSend(v90, "bundleSubscription");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTHeadline setIsBundlePaid:](v22, "setIsBundlePaid:", objc_msgSend(v82, "containsHeadline:", v17));

  return v22;
}

void sub_21980CF94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,char a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  char a64;
  uint64_t v64;

  _Block_object_dispose(&a58, 8);
  _Block_object_dispose(&a64, 8);
  _Block_object_dispose((const void *)(v64 - 232), 8);
  _Unwind_Resume(a1);
}

void sub_21980D8E8(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 208), 8);
  _Unwind_Resume(a1);
}

void NTDeleteOnDiskAssets_cold_1()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2197E6000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"assetFileURLs", v6, 2u);

  OUTLINED_FUNCTION_2();
}

void NTPBTodaySectionConfigGenerateArticle_cold_1()
{
  void *v0;
  int v1;
  const char *v2;
  __int16 v3;
  char *v4;
  __int16 v5;
  int v6;
  __int16 v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("articleIDs section config articles JSON requires an articleID for every article"));
  v1 = 136315906;
  v2 = "NTPBTodaySectionConfigArticle *NTPBTodaySectionConfigGenerateArticle(NSDictionary<NSString *,id> *__strong, BOOL *)";
  v3 = 2080;
  v4 = "NTPBTodaySectionConfig+NTAdditions.m";
  v5 = 1024;
  v6 = 29;
  v7 = 2114;
  v8 = v0;
  OUTLINED_FUNCTION_4_1(&dword_2197E6000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v1);

}

void NTPBTodaySectionConfigGenerateArticles_cold_1()
{
  void *v0;
  int v1[10];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "articleDictionaries");
  v1[0] = 136315906;
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4_1(&dword_2197E6000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)v1);

  OUTLINED_FUNCTION_2();
}

void NTPBTodaySectionConfigGenerateItems_cold_1()
{
  void *v0;
  int v1[10];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "itemDictionaries");
  v1[0] = 136315906;
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4_1(&dword_2197E6000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)v1);

  OUTLINED_FUNCTION_2();
}

void NTArticleIDsRequestWithArticles_cold_1()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2197E6000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"articles", v6, 2u);

  OUTLINED_FUNCTION_2();
}

void NTPossiblySimulateCrashWithError_cold_1()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2197E6000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"error", v6, 2u);

  OUTLINED_FUNCTION_2();
}

void NTAssetFileURL_cold_1()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2197E6000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"assetsDirectoryFileURL", v6, 2u);

  OUTLINED_FUNCTION_2();
}

void NTAssetFileURLWithData_cold_1()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2197E6000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"assetsDirectoryFileURL", v6, 2u);

  OUTLINED_FUNCTION_2();
}

void NTAssetFileURLWithData_cold_2()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2197E6000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"data", v6, 2u);

  OUTLINED_FUNCTION_2();
}

void NTAssetFileURLWithFile_cold_1()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2197E6000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"assetsDirectoryFileURL", v6, 2u);

  OUTLINED_FUNCTION_2();
}

void NTAssetFileURLWithFile_cold_2()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2197E6000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"fileURL", v6, 2u);

  OUTLINED_FUNCTION_2();
}

void NTSectionFeedItemsLimit_cold_1()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2197E6000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"slotsLimit >= 0", v6, 2u);

  OUTLINED_FUNCTION_2();
}

void NTSectionFeedItemsLimit_cold_2()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2197E6000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"costInfo", v6, 2u);

  OUTLINED_FUNCTION_2();
}

void NTHeadlineThumbnailFromFCHeadline_cold_1()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2197E6000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"headline", v6, 2u);

  OUTLINED_FUNCTION_2();
}

void NTHeadlineSourceNameImageMaskAssetHandleFromFCHeadline_cold_1()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2197E6000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"headline", v6, 2u);

  OUTLINED_FUNCTION_2();
}

void NTHeadlineAdElementFromFCHeadline_cold_1()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2197E6000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"headline", v6, 2u);

  OUTLINED_FUNCTION_2();
}

void NTHeadlineAnalyticsElementFromFCHeadline_cold_1()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2197E6000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"headline", v6, 2u);

  OUTLINED_FUNCTION_2();
}

void NTHeadlineFromFCHeadline_cold_1()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2197E6000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"headline", v6, 2u);

  OUTLINED_FUNCTION_2();
}

uint64_t FCAppConfigurationDictionaryValue()
{
  return MEMORY[0x24BE6C660]();
}

uint64_t FCAppConfigurationStringValue()
{
  return MEMORY[0x24BE6C668]();
}

uint64_t FCBundle()
{
  return MEMORY[0x24BE6C678]();
}

uint64_t FCCheckedDynamicCast()
{
  return MEMORY[0x24BE6C960]();
}

uint64_t FCClamp()
{
  return MEMORY[0x24BE6C968]();
}

uint64_t FCDispatchGroupWrap()
{
  return MEMORY[0x24BE6C988]();
}

uint64_t FCDispatchQueueForQualityOfService()
{
  return MEMORY[0x24BE6C990]();
}

uint64_t FCDynamicCast()
{
  return MEMORY[0x24BE6C998]();
}

uint64_t FCFeedTransformationItemReadingHistoryArticleVersion()
{
  return MEMORY[0x24BE6C9B8]();
}

uint64_t FCInferRelativePriorityFromQualityOfService()
{
  return MEMORY[0x24BE6C9C8]();
}

uint64_t FCPerformIfNonNil()
{
  return MEMORY[0x24BE6C9F8]();
}

uint64_t FCRandom()
{
  return MEMORY[0x24BE6CA10]();
}

uint64_t FCShouldErrorBeExcludedFromSimulatedCrashes()
{
  return MEMORY[0x24BE6CA20]();
}

uint64_t FCThumbnailForHeadlineMinimumSizeInPixels()
{
  return MEMORY[0x24BE6CA38]();
}

uint64_t FCURLForTodayDropbox()
{
  return MEMORY[0x24BE6CA58]();
}

uint64_t FCURLForTodayPersonalizationUpdateStore()
{
  return MEMORY[0x24BE6CA60]();
}

uint64_t FCURLForTodayPrivateDataTransactionQueue()
{
  return MEMORY[0x24BE6CA68]();
}

uint64_t FCXPCSuitableError()
{
  return MEMORY[0x24BE6CA80]();
}

uint64_t NDTodayFeedServiceXPCConnection()
{
  return MEMORY[0x24BE6CDF0]();
}

uint64_t NFInternalBuild()
{
  return MEMORY[0x24BE6CF48]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
}

uint64_t NewsCoreSensitiveUserDefaults()
{
  return MEMORY[0x24BE6CA88]();
}

uint64_t NewsCoreUserDefaults()
{
  return MEMORY[0x24BE6CA90]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB68](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADC60](when, queue, block);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x24BDADDC8]();
}

void dispatch_group_enter(dispatch_group_t group)
{
  MEMORY[0x24BDADDD0](group);
}

void dispatch_group_leave(dispatch_group_t group)
{
  MEMORY[0x24BDADDD8](group);
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADDE0](group, queue, block);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x24BDADFF8](when, delta);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x24BEDCFA8](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x24BEDD030](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x24BEDD038](location);
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

void objc_exception_throw(id exception)
{
  MEMORY[0x24BEDD078](exception);
}

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x24BEDD080](object, key);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x24BEDD0B0](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x24BEDD0C0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x24BEDD0E8](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x24BEDD138]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x24BEDD148]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x24BEDD160]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x24BEDD2A8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x24BEDD2C0](a1);
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3E0](self, _cmd, newValue, offset);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD408](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

