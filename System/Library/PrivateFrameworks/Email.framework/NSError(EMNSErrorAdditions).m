@implementation NSError(EMNSErrorAdditions)

+ (id)em_internalErrorWithReason:()EMNSErrorAdditions userInfo:
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  const __CFString *v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (_registerEMErrorDomainUserInfoValueProvider_onceToken == -1)
  {
    if (v7)
    {
LABEL_3:
      v9 = (id)objc_msgSend(v8, "mutableCopy");
      goto LABEL_6;
    }
  }
  else
  {
    dispatch_once(&_registerEMErrorDomainUserInfoValueProvider_onceToken, &__block_literal_global_36);
    if (v8)
      goto LABEL_3;
  }
  v9 = objc_alloc_init(MEMORY[0x1E0C99E08]);
LABEL_6:
  v10 = v9;
  v11 = *MEMORY[0x1E0D1EDF0];
  objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E0D1EDF0]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(v10, "objectForKeyedSubscript:", v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v13, "mutableCopy");

    objc_msgSend(v14, "setObject:forKeyedSubscript:", v6, CFSTR("reason"));
    v10 = v14;
  }
  else
  {
    v18 = CFSTR("reason");
    v19[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v15, v11);

  }
  objc_msgSend(a1, "errorWithDomain:code:userInfo:", CFSTR("EMErrorDomain"), 1, v10);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

+ (id)em_itemNotFoundErrorWithItemID:()EMNSErrorAdditions
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v9;
  void *v10;
  const __CFString *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (_registerEMErrorDomainUserInfoValueProvider_onceToken != -1)
    dispatch_once(&_registerEMErrorDomainUserInfoValueProvider_onceToken, &__block_literal_global_36);
  if (v4)
  {
    v11 = CFSTR("itemID");
    v12[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = CFSTR("itemID");
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v6;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v10, &v9, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(a1, "errorWithDomain:code:userInfo:", CFSTR("EMErrorDomain"), 1024, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (uint64_t)em_itemTimeoutError
{
  if (_registerEMErrorDomainUserInfoValueProvider_onceToken != -1)
    dispatch_once(&_registerEMErrorDomainUserInfoValueProvider_onceToken, &__block_literal_global_36);
  return objc_msgSend(a1, "errorWithDomain:code:userInfo:", CFSTR("EMErrorDomain"), 1026, 0);
}

+ (id)em_internalErrorWithReason:()EMNSErrorAdditions
{
  objc_msgSend(MEMORY[0x1E0CB35C8], "em_internalErrorWithReason:userInfo:", a3, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (uint64_t)em_isItemNotFoundError
{
  uint64_t (**v1)(_QWORD, _QWORD, _QWORD);
  uint64_t v2;

  objc_msgSend(a1, "ef_match");
  v1 = (uint64_t (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  v2 = ((uint64_t (**)(_QWORD, const __CFString *, uint64_t))v1)[2](v1, CFSTR("EMErrorDomain"), 1024);

  return v2;
}

- (uint64_t)em_isInternalError
{
  uint64_t (**v1)(_QWORD, _QWORD, _QWORD);
  uint64_t v2;

  objc_msgSend(a1, "ef_match");
  v1 = (uint64_t (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  v2 = ((uint64_t (**)(_QWORD, const __CFString *, uint64_t))v1)[2](v1, CFSTR("EMErrorDomain"), 1);

  return v2;
}

@end
