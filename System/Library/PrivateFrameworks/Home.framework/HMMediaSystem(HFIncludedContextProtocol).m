@implementation HMMediaSystem(HFIncludedContextProtocol)

- (uint64_t)hf_isOnForContextType:()HFIncludedContextProtocol
{
  void *v4;
  uint64_t v5;
  _QWORD v7[5];

  objc_msgSend(a1, "accessories");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __66__HMMediaSystem_HFIncludedContextProtocol__hf_isOnForContextType___block_invoke;
  v7[3] = &__block_descriptor_40_e21_B16__0__HMAccessory_8l;
  v7[4] = a3;
  v5 = objc_msgSend(v4, "na_any:", v7);

  return v5;
}

- (uint64_t)hf_hasSetForContextType:()HFIncludedContextProtocol
{
  void *v4;
  uint64_t v5;
  _QWORD v7[5];

  objc_msgSend(a1, "accessories");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __68__HMMediaSystem_HFIncludedContextProtocol__hf_hasSetForContextType___block_invoke;
  v7[3] = &__block_descriptor_40_e21_B16__0__HMAccessory_8l;
  v7[4] = a3;
  v5 = objc_msgSend(v4, "na_all:", v7);

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
  char v3;
  void *v5;
  _QWORD v6[5];

  if ((unint64_t)(a3 - 2) < 2)
    return objc_msgSend(a1, "isContainedWithinItemGroup");
  if (a3 == 1)
  {
    objc_msgSend(a1, "accessories");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __72__HMMediaSystem_HFIncludedContextProtocol__hf_shouldHideForContextType___block_invoke;
    v6[3] = &__block_descriptor_40_e21_B16__0__HMAccessory_8l;
    v6[4] = 1;
    v3 = objc_msgSend(v5, "na_all:", v6);

  }
  else if (!a3)
  {
    return objc_msgSend(a1, "isContainedWithinItemGroup");
  }
  return v3 & 1;
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
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t v24[128];
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  int v30;
  __int16 v31;
  uint64_t v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  HFLogForCategory(0);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413058;
    v26 = a1;
    v27 = 2080;
    v28 = "-[HMMediaSystem(HFIncludedContextProtocol) hf_updateValue:forContextType:]";
    v29 = 1024;
    v30 = a3;
    v31 = 2048;
    v32 = a4;
    _os_log_impl(&dword_1DD34E000, v7, OS_LOG_TYPE_DEFAULT, "(%@:%s) Updating value to %{BOOL}d for context %lu", buf, 0x26u);
  }

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  objc_msgSend(a1, "accessories", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v21;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v21 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v13);
        if (a4 != 1 || (objc_msgSend(a1, "hf_shouldHideForContextType:", 1) & 1) == 0)
        {
          objc_msgSend(v14, "hf_updateValue:forContextType:", a3, a4);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "addObject:", v15);

        }
        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v11);
  }

  v16 = (void *)MEMORY[0x1E0D519C0];
  objc_msgSend(MEMORY[0x1E0D519E8], "mainThreadScheduler");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "combineAllFutures:ignoringErrors:scheduler:", v8, 0, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

@end
