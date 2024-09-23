@implementation NSError(HFAdditions)

- (BOOL)hf_isHFErrorWithCode:()HFAdditions
{
  void *v5;
  _BOOL8 v6;

  objc_msgSend(a1, "domain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("HFErrorDomain")))
    v6 = objc_msgSend(a1, "code") == a3;
  else
    v6 = 0;

  return v6;
}

- (uint64_t)hf_isHomeKitNamingError
{
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;

  if (_MergedGlobals_327 != -1)
    dispatch_once(&_MergedGlobals_327, &__block_literal_global_2_36);
  v2 = (id)qword_1ED379EA8;
  objc_msgSend(a1, "domain");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0CB8C70]))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(a1, "code"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v2, "containsObject:", v4);

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (uint64_t)hf_isHomeKitUnreachableError
{
  int v2;

  v2 = objc_msgSend(a1, "hf_isHFErrorWithCode:", 35);
  return v2 | objc_msgSend(a1, "hf_isHMErrorWithCode:", 4);
}

- (BOOL)hf_isHMErrorWithCode:()HFAdditions
{
  void *v5;
  _BOOL8 v6;

  objc_msgSend(a1, "domain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0CB8C70]))
    v6 = objc_msgSend(a1, "code") == a3;
  else
    v6 = 0;

  return v6;
}

- (BOOL)hf_isHMErrorWithCodePrivate:()HFAdditions
{
  void *v5;
  _BOOL8 v6;

  objc_msgSend(a1, "domain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0CB8C70]))
    v6 = objc_msgSend(a1, "code") == a3;
  else
    v6 = 0;

  return v6;
}

- (BOOL)hf_isHMHomeWalletKeyErrorWithCode:()HFAdditions
{
  void *v5;
  _BOOL8 v6;

  objc_msgSend(a1, "domain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0CB9328]))
    v6 = objc_msgSend(a1, "code") == a3;
  else
    v6 = 0;

  return v6;
}

- (BOOL)hf_isPublicHMError
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a1, "domain");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isEqualToString:", *MEMORY[0x1E0CB8C70]))
    v3 = objc_msgSend(a1, "code") < 2001;
  else
    v3 = 0;

  return v3;
}

- (id)hf_errorWithAddedUserInfo:()HFAdditions
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = a3;
  objc_msgSend(a1, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");
  v7 = v6;
  if (v6)
  {
    v8 = v6;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;

  objc_msgSend(v9, "addEntriesFromDictionary:", v4);
  v10 = (void *)MEMORY[0x1E0CB35C8];
  objc_msgSend(a1, "domain");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "errorWithDomain:code:userInfo:", v11, objc_msgSend(a1, "code"), v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (BOOL)hf_isThreadNetworkRequiredError
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a1, "domain");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isEqualToString:", *MEMORY[0x1E0CB8C70]))
    v3 = objc_msgSend(a1, "code") == 2009 || objc_msgSend(a1, "code") == 2010;
  else
    v3 = 0;

  return v3;
}

- (BOOL)hf_isAlreadyPairedError
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a1, "domain");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isEqualToString:", *MEMORY[0x1E0CB8C70]))
    v3 = objc_msgSend(a1, "code") == 13 || objc_msgSend(a1, "code") == 11;
  else
    v3 = 0;

  return v3;
}

@end
