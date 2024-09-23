@implementation HMServiceGroup(HFIncludedContextProtocol)

- (uint64_t)hf_isOnForContextType:()HFIncludedContextProtocol
{
  void *v4;
  uint64_t v5;
  _QWORD v7[5];

  objc_msgSend(a1, "services");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __67__HMServiceGroup_HFIncludedContextProtocol__hf_isOnForContextType___block_invoke;
  v7[3] = &__block_descriptor_40_e19_B16__0__HMService_8l;
  v7[4] = a3;
  v5 = objc_msgSend(v4, "na_any:", v7);

  return v5;
}

- (uint64_t)hf_hasSetForContextType:()HFIncludedContextProtocol
{
  void *v4;
  uint64_t v5;
  _QWORD v7[5];

  objc_msgSend(a1, "services");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __69__HMServiceGroup_HFIncludedContextProtocol__hf_hasSetForContextType___block_invoke;
  v7[3] = &__block_descriptor_40_e19_B16__0__HMService_8l;
  v7[4] = a3;
  v5 = objc_msgSend(v4, "na_any:", v7);

  return v5;
}

- (uint64_t)hf_shouldBeOnForContextType:()HFIncludedContextProtocol
{
  void *v4;
  uint64_t v5;

  v4 = a1;
  if (a2 < 2)
  {
    if ((objc_msgSend(a1, "hf_isOnForContextType:", a2) & 1) == 0)
    {
      a3 = objc_msgSend(v4, "hf_hasSetForContextType:", a2) ^ 1;
      return a3 & 1;
    }
    goto LABEL_7;
  }
  if (a2 == 2)
  {
    v5 = 2;
    return objc_msgSend(a1, "hf_isOnForContextType:", v5);
  }
  if (a2 == 3)
  {
    if (objc_msgSend(a1, "hf_hasSetForContextType:", 3))
    {
      a1 = v4;
      v5 = 3;
      return objc_msgSend(a1, "hf_isOnForContextType:", v5);
    }
LABEL_7:
    a3 = 1;
  }
  return a3 & 1;
}

- (uint64_t)hf_shouldHideForContextType:()HFIncludedContextProtocol
{
  void *v3;
  uint64_t v4;
  _QWORD v6[5];

  if (a3 != 1)
    return 0;
  objc_msgSend(a1, "services");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __73__HMServiceGroup_HFIncludedContextProtocol__hf_shouldHideForContextType___block_invoke;
  v6[3] = &__block_descriptor_40_e19_B16__0__HMService_8l;
  v6[4] = 1;
  v4 = objc_msgSend(v3, "na_all:", v6);

  return v4;
}

- (id)hf_updateValue:()HFIncludedContextProtocol forContextType:
{
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t v23[128];
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  int v29;
  __int16 v30;
  uint64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  HFLogForCategory(0);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413058;
    v25 = a1;
    v26 = 2080;
    v27 = "-[HMServiceGroup(HFIncludedContextProtocol) hf_updateValue:forContextType:]";
    v28 = 1024;
    v29 = a3;
    v30 = 2048;
    v31 = a4;
    _os_log_impl(&dword_1DD34E000, v7, OS_LOG_TYPE_DEFAULT, "(%@:%s) Updating value to %{BOOL}d for context %lu", buf, 0x26u);
  }

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  objc_msgSend(a1, "services", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v20;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v20 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v13), "hf_updateValue:forContextType:", a3, a4);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObject:", v14);

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v11);
  }

  v15 = (void *)MEMORY[0x1E0D519C0];
  objc_msgSend(MEMORY[0x1E0D519E8], "mainThreadScheduler");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "combineAllFutures:ignoringErrors:scheduler:", v8, 0, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

@end
