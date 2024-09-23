@implementation BMDistributedContextUtilities

+ (void)updateDescriptionForError:(id *)a3 withErrorCode:(int64_t)a4
{
  void *v6;
  const __CFString *v7;
  id v8;

  if (a3)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)a4 > 5)
    {
      a4 = 0;
      v7 = CFSTR("Unknown Error");
    }
    else
    {
      v7 = *(&off_24D278A78 + a4);
    }
    v8 = v6;
    objc_msgSend(v6, "setValue:forKey:", v7, *MEMORY[0x24BDD0FC8]);
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("ContextSyncErrorDomain"), a4, v8);
    *a3 = (id)objc_claimAutoreleasedReturnValue();

  }
}

+ (BOOL)isSupportEnabledForBMDSL:(id)a3 useCase:(id)a4 withError:(id *)a5
{
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t v33[128];
  uint8_t buf[4];
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  if (a3)
  {
    objc_msgSend(a3, "streamPublishers");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    __biome_log_for_category();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v35 = v8;
      _os_log_impl(&dword_214A1F000, v9, OS_LOG_TYPE_INFO, "isSupportEnabledForBMDSL: streamPublishers: %@", buf, 0xCu);
    }

    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v11 = v8;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v30;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v30 != v14)
            objc_enumerationMutation(v11);
          objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * i), "identifier", (_QWORD)v29);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "addObject:", v16);

        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
      }
      while (v13);
    }

    v17 = (void *)MEMORY[0x24BE0C080];
    objc_msgSend(MEMORY[0x24BE0C0A0], "current");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "policyForProcess:connectionFlags:useCase:", v18, 0, v7);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = objc_msgSend(v19, "allowsAccessToContextSyncStreams:", v10);
    if ((v20 & 1) == 0)
    {
      __biome_log_for_category();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        +[BMDistributedContextUtilities isSupportEnabledForBMDSL:useCase:withError:].cold.1((uint64_t)v10, v21, v22, v23, v24, v25, v26, v27);

      +[BMDistributedContextUtilities updateDescriptionForError:withErrorCode:](BMDistributedContextUtilities, "updateDescriptionForError:withErrorCode:", a5, 4);
    }

  }
  else
  {
    v20 = 0;
  }

  return v20;
}

+ (id)currentBootSessionUUID
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1880], "bm_bootSessionUUID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (void)isSupportEnabledForBMDSL:(uint64_t)a3 useCase:(uint64_t)a4 withError:(uint64_t)a5 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_214A1F000, a2, a3, "Process does not have entitlements for %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

@end
