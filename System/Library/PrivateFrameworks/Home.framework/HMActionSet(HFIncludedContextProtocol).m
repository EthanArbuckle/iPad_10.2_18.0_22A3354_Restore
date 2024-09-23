@implementation HMActionSet(HFIncludedContextProtocol)

- (uint64_t)hf_shouldBeOnForContextType:()HFIncludedContextProtocol
{
  NSObject *v5;
  void *v6;
  uint64_t v7;
  int v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (a3 != 3)
  {
    if (a3 == 2)
    {
      HFLogForCategory(0);
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        v8 = 136315138;
        v9 = "-[HMActionSet(HFIncludedContextProtocol) hf_shouldBeOnForContextType:]";
        _os_log_error_impl(&dword_1DD34E000, v5, OS_LOG_TYPE_ERROR, "(%s) Favoriting is not applicable to ActionSets", (uint8_t *)&v8, 0xCu);
      }

    }
    else if (!a3)
    {
      if ((objc_msgSend(a1, "hf_isOnForContextType:") & 1) == 0)
        return objc_msgSend(a1, "hf_hasSetForContextType:", 0) ^ 1;
      return 1;
    }
    return 0;
  }
  if (objc_msgSend(a1, "hf_hasSetForContextType:"))
  {
    v6 = a1;
    v7 = 3;
    return objc_msgSend(v6, "hf_isOnForContextType:", v7);
  }
  if (objc_msgSend(a1, "hf_hasSetForContextType:", 0))
  {
    v6 = a1;
    v7 = 0;
    return objc_msgSend(v6, "hf_isOnForContextType:", v7);
  }
  return 1;
}

- (BOOL)hf_hasSetForContextType:()HFIncludedContextProtocol
{
  void *v3;
  void *v4;
  const __CFString *v5;
  void *v6;
  _BOOL8 v7;
  NSObject *v8;
  int v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (a3 == 3)
  {
    objc_msgSend(a1, "applicationData");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    v5 = CFSTR("HFApplicationDataActionSetShowInHomeDashboard");
    goto LABEL_6;
  }
  if (a3 == 2)
  {
    HFLogForCategory(0);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v10 = 136315138;
      v11 = "-[HMActionSet(HFIncludedContextProtocol) hf_hasSetForContextType:]";
      _os_log_error_impl(&dword_1DD34E000, v8, OS_LOG_TYPE_ERROR, "(%s) Action sets are not favoritable. Returning NO.", (uint8_t *)&v10, 0xCu);
    }

    return 0;
  }
  if (a3)
    return 0;
  objc_msgSend(a1, "applicationData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  v5 = CFSTR("HFApplicationDataActionSetIsFavoriteKey");
LABEL_6:
  objc_msgSend(v3, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6 != 0;

  return v7;
}

- (uint64_t)hf_isOnForContextType:()HFIncludedContextProtocol
{
  void *v3;
  void *v4;
  const __CFString *v5;
  void *v6;
  uint64_t v7;
  NSObject *v9;
  int v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  switch(a3)
  {
    case 3:
      objc_msgSend(a1, "applicationData");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("HFApplicationDataActionSetShowInHomeDashboard");
      goto LABEL_6;
    case 2:
      HFLogForCategory(0);
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        v10 = 136315138;
        v11 = "-[HMActionSet(HFIncludedContextProtocol) hf_isOnForContextType:]";
        _os_log_error_impl(&dword_1DD34E000, v9, OS_LOG_TYPE_ERROR, "(%s) Action sets are not favoritable", (uint8_t *)&v10, 0xCu);
      }

      break;
    case 0:
      objc_msgSend(a1, "applicationData");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("HFApplicationDataActionSetIsFavoriteKey");
LABEL_6:
      objc_msgSend(v3, "objectForKeyedSubscript:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "BOOLValue");

      return v7;
  }
  return 0;
}

- (BOOL)hf_shouldHideForContextType:()HFIncludedContextProtocol
{
  return (unint64_t)(a3 - 1) < 2;
}

- (id)hf_updateValue:()HFIncludedContextProtocol forContextType:
{
  NSObject *v7;
  void *v8;
  void *v9;
  __CFString *v10;
  _QWORD v12[5];
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  HFLogForCategory(0);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413058;
    v14 = a1;
    v15 = 2080;
    v16 = "-[HMActionSet(HFIncludedContextProtocol) hf_updateValue:forContextType:]";
    v17 = 1024;
    v18 = a3;
    v19 = 2048;
    v20 = a4;
    _os_log_impl(&dword_1DD34E000, v7, OS_LOG_TYPE_DEFAULT, "(%@:%s) Updating value to %{BOOL}d for context %lu", buf, 0x26u);
  }

  switch(a4)
  {
    case 0:
      objc_msgSend(a1, "applicationData");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = CFSTR("HFApplicationDataActionSetIsFavoriteKey");
      goto LABEL_9;
    case 1:
      NSLog(CFSTR("Action sets cannot be included in status"));
      break;
    case 2:
      NSLog(CFSTR("Action sets are not favoritable"));
      break;
    case 3:
      objc_msgSend(a1, "applicationData");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = CFSTR("HFApplicationDataActionSetShowInHomeDashboard");
LABEL_9:
      HFAppDataSetValueIfChanged(v8, v10, v9);

      break;
    default:
      break;
  }
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __72__HMActionSet_HFIncludedContextProtocol__hf_updateValue_forContextType___block_invoke;
  v12[3] = &unk_1EA7268C8;
  v12[4] = a1;
  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithErrorOnlyHandlerAdapterBlock:", v12);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
