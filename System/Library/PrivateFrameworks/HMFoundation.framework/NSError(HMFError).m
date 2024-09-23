@implementation NSError(HMFError)

+ (id)hmf_errorWithException:()HMFError
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
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5)
  {
    objc_msgSend(v3, "name");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringForKey:value:table:", v8, &stru_1E3B39EC0, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v9, *MEMORY[0x1E0CB2D50]);

  }
  else
  {
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("Exception."), &stru_1E3B39EC0, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, *MEMORY[0x1E0CB2D50]);
  }

  objc_msgSend(v3, "reason");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "reason");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "localizedStringForKey:value:table:", v12, &stru_1E3B39EC0, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v13, *MEMORY[0x1E0CB2D68]);

  }
  objc_msgSend(v3, "debugDescription");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v14, *MEMORY[0x1E0CB2938]);

  v15 = (void *)MEMORY[0x1E0CB35C8];
  v16 = (void *)objc_msgSend(v4, "copy");
  objc_msgSend(v15, "hmfErrorWithCode:userInfo:", 16, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

+ (uint64_t)hmfErrorWithCode:()HMFError
{
  return objc_msgSend(a1, "hmfErrorWithCode:reason:", a3, 0);
}

+ (uint64_t)hmfErrorWithCode:()HMFError reason:
{
  return objc_msgSend(a1, "hmfErrorWithCode:reason:suggestion:", a3, a4, 0);
}

+ (uint64_t)hmfErrorWithCode:()HMFError reason:suggestion:
{
  return objc_msgSend(a1, "hmfErrorWithCode:reason:suggestion:underlyingError:", a3, a4, a5, 0);
}

+ (id)hmfErrorWithCode:()HMFError reason:suggestion:underlyingError:
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  __CFString *v14;
  __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;

  v9 = a4;
  v10 = a5;
  v11 = a6;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)(a3 - 1) > 0x12)
    v14 = CFSTR("Unknown error");
  else
    v14 = off_1E3B37F48[a3 - 1];
  v15 = v14;
  objc_msgSend(v13, "localizedStringForKey:value:table:", v15, &stru_1E3B39EC0, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v16, *MEMORY[0x1E0CB2D50]);

  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "localizedStringForKey:value:table:", v9, &stru_1E3B39EC0, 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v18, *MEMORY[0x1E0CB2D68]);

  }
  if (v10)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "localizedStringForKey:value:table:", v10, &stru_1E3B39EC0, 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v20, *MEMORY[0x1E0CB2D80]);

  }
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v11, *MEMORY[0x1E0CB3388]);
  objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:userInfo:", a3, v12);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

+ (uint64_t)hmfErrorWithCode:()HMFError userInfo:
{
  return objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("HMFErrorDomain"), a3, a4);
}

+ (id)hmfUnspecifiedError
{
  if (_MergedGlobals_59 != -1)
    dispatch_once(&_MergedGlobals_59, &__block_literal_global_7);
  return (id)qword_1ED013138;
}

- (uint64_t)isHMFError
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "domain");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "isEqualToString:", CFSTR("HMFErrorDomain"));

  return v2;
}

@end
