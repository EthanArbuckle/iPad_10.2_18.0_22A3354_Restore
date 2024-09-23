@implementation HMMediaProfile(HFIncludedContextProtocol)

- (uint64_t)hf_isOnForContextType:()HFIncludedContextProtocol
{
  void *v4;
  uint64_t v5;

  objc_msgSend(a1, "accessory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hf_isOnForContextType:", a3);

  return v5;
}

- (uint64_t)hf_hasSetForContextType:()HFIncludedContextProtocol
{
  void *v4;
  uint64_t v5;

  objc_msgSend(a1, "accessory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hf_hasSetForContextType:", a3);

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
  void *v4;
  uint64_t v5;

  if ((unint64_t)(a3 - 2) < 2)
    return objc_msgSend(a1, "isContainedWithinItemGroup");
  if (a3 == 1)
  {
    objc_msgSend(a1, "accessory");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "hf_shouldHideForContextType:", 1);

    return v5;
  }
  else
  {
    if (!a3)
      return objc_msgSend(a1, "isContainedWithinItemGroup");
    return 0;
  }
}

- (id)hf_updateValue:()HFIncludedContextProtocol forContextType:
{
  NSObject *v7;
  void *v8;
  void *v9;
  int v11;
  void *v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  HFLogForCategory(0);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 138413058;
    v12 = a1;
    v13 = 2080;
    v14 = "-[HMMediaProfile(HFIncludedContextProtocol) hf_updateValue:forContextType:]";
    v15 = 1024;
    v16 = a3;
    v17 = 2048;
    v18 = a4;
    _os_log_impl(&dword_1DD34E000, v7, OS_LOG_TYPE_DEFAULT, "(%@:%s) Updating value to %{BOOL}d for context %lu", (uint8_t *)&v11, 0x26u);
  }

  objc_msgSend(a1, "accessory");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "hf_updateValue:forContextType:", a3, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

@end
