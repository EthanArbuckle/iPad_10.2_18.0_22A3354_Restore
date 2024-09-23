@implementation C2Logging

+ (void)printToLog:(id)a3 withDescription:(id)a4 array:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;

  v8 = a3;
  v9 = a4;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __46__C2Logging_printToLog_withDescription_array___block_invoke;
  v12[3] = &unk_1E9898A80;
  v14 = v8;
  v15 = a1;
  v13 = v9;
  v10 = v8;
  v11 = v9;
  objc_msgSend(a5, "enumerateObjectsUsingBlock:", v12);

}

void __46__C2Logging_printToLog_withDescription_array___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  uint64_t v6;
  id v7;
  id v8;

  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = *(_QWORD *)(a1 + 32);
  v7 = a2;
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@:%llu"), v6, a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "printToLog:withDescription:object:", *(_QWORD *)(a1 + 40), v8, v7);

}

+ (void)printToLog:(id)a3 withDescription:(id)a4 dictionary:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;

  v8 = a3;
  v9 = a4;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __51__C2Logging_printToLog_withDescription_dictionary___block_invoke;
  v12[3] = &unk_1E9898AA8;
  v14 = v8;
  v15 = a1;
  v13 = v9;
  v10 = v8;
  v11 = v9;
  objc_msgSend(a5, "enumerateKeysAndObjectsUsingBlock:", v12);

}

void __51__C2Logging_printToLog_withDescription_dictionary___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  uint64_t v6;
  id v7;
  id v8;

  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = *(_QWORD *)(a1 + 32);
  v7 = a3;
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@/%@"), v6, a2);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "printToLog:withDescription:object:", *(_QWORD *)(a1 + 40), v8, v7);

}

+ (void)printToLog:(id)a3 withDescription:(id)a4 error:(id)a5
{
  NSObject *v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  os_log_type_t v12;
  const __CFDictionary *v13;
  const __CFDictionary *v14;
  _BOOL4 v15;
  _BOOL4 v16;
  __CFDictionary *MutableCopy;
  __CFDictionary *v18;
  void *v19;
  uint8_t buf[4];
  id v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(v9, "domain");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "code");
  if (v10)
  {
    if ((objc_msgSend((id)*MEMORY[0x1E0CB32E8], "isEqual:", v10) & (v11 != -999)) != 0)
      v12 = OS_LOG_TYPE_ERROR;
    else
      v12 = OS_LOG_TYPE_DEFAULT;
  }
  else
  {
    v12 = OS_LOG_TYPE_DEFAULT;
  }
  if (os_log_type_enabled(v7, v12))
  {
    *(_DWORD *)buf = 138543874;
    v21 = v8;
    v22 = 2114;
    v23 = v10;
    v24 = 2048;
    v25 = v11;
    _os_log_impl(&dword_1D4DC3000, v7, v12, "%{public}@ %{public}@/%ld", buf, 0x20u);
  }
  objc_msgSend(v9, "userInfo");
  v13 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = v13;
    if (CFDictionaryContainsKey(v13, (const void *)*MEMORY[0x1E0C9AFB0]))
      v15 = CFDictionaryContainsKey(v14, (const void *)*MEMORY[0x1E0C9AFE0]) != 0;
    else
      v15 = 0;
    if (CFDictionaryContainsKey(v14, CFSTR("NSErrorFailingURLStringKey")))
      v16 = CFDictionaryContainsKey(v14, CFSTR("NSErrorFailingURLKey")) != 0;
    else
      v16 = 0;
    MutableCopy = CFDictionaryCreateMutableCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, v14);
    if (MutableCopy)
    {
      v18 = MutableCopy;
      if (v15)
        CFDictionaryRemoveValue(MutableCopy, (const void *)*MEMORY[0x1E0C9AFE0]);
      if (v16)
        CFDictionaryRemoveValue(v18, CFSTR("NSErrorFailingURLStringKey"));

    }
    else
    {
      v18 = v14;
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@, %@/%ld"), v8, v10, v11);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "printToLog:withDescription:object:", v7, v19, v18);

  }
}

+ (void)printToLog:(id)a3 withDescription:(id)a4 object:(id)a5
{
  NSObject *v7;
  id v8;
  id v9;
  int v10;
  id v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend((id)objc_opt_class(), "printToLog:withDescription:dictionary:", v7, v8, v9);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend((id)objc_opt_class(), "printToLog:withDescription:array:", v7, v8, v9);
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend((id)objc_opt_class(), "printToLog:withDescription:error:", v7, v8, v9);
      }
      else if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        v10 = 138543618;
        v11 = v8;
        v12 = 2114;
        v13 = v9;
        _os_log_impl(&dword_1D4DC3000, v7, OS_LOG_TYPE_INFO, "%{public}@ %{public}@", (uint8_t *)&v10, 0x16u);
      }
    }
  }

}

@end
