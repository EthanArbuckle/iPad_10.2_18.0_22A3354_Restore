@implementation NSError(AppleMediaServices)

- (id)ams_title
{
  void *v1;
  void *v2;
  id v3;

  objc_msgSend(a1, "userInfo");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("AMSDescription"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;

  return v3;
}

- (id)ams_sanitizedForSecureCoding
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  objc_msgSend(a1, "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(a1, "userInfo");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "ams_sanitizedForSecureCoding");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = objc_alloc(MEMORY[0x1E0CB35C8]);
    objc_msgSend(a1, "domain");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(a1, "code");
    if (objc_msgSend(v4, "count"))
      v8 = v4;
    else
      v8 = 0;
    v9 = (id)objc_msgSend(v5, "initWithDomain:code:userInfo:", v6, v7, v8);

  }
  else
  {
    v9 = a1;
  }
  return v9;
}

- (id)ams_message
{
  void *v1;
  void *v2;
  id v3;

  objc_msgSend(a1, "userInfo");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("AMSFailureReason"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;

  return v3;
}

- (uint64_t)ams_hasDomain:()AppleMediaServices code:
{
  id v6;
  void *v7;
  uint64_t v8;

  v6 = a3;
  if (objc_msgSend(a1, "code") == a4)
  {
    objc_msgSend(a1, "domain");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqualToString:", v6);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)ams_underlyingError
{
  void *v1;
  void *v2;
  id v3;

  objc_msgSend(a1, "userInfo");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKeyedSubscript:", *MEMORY[0x1E0CB3388]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;

  return v3;
}

- (uint64_t)ams_isTimeoutError
{
  return objc_msgSend(a1, "ams_hasDomain:code:", CFSTR("AMSErrorDomain"), 1);
}

- (uint64_t)ams_isUserCancelledError
{
  return objc_msgSend(a1, "ams_hasDomain:code:", *MEMORY[0x1E0CB28A8], 3072);
}

- (id)_ams_firstUnderlyingErrorPassingTest:()AppleMediaServices
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(a1, "underlyingErrors");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "ams_firstObjectPassingTest:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)ams_errorByAddingToMultipleUnderlyingErrors:()AppleMediaServices
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(a1, "ams_multipleUnderlyingErrors");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(a1, "ams_multipleUnderlyingErrors");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "arrayByAddingObjectsFromArray:", v4);
    v7 = objc_claimAutoreleasedReturnValue();

    v4 = (id)v7;
  }
  v11 = *MEMORY[0x1E0CB2F70];
  v12[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "ams_errorByAddingUserInfo:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)ams_errorByAddingUserInfo:()AppleMediaServices
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;

  v4 = a3;
  objc_msgSend(a1, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");
  v7 = v6;
  if (v6)
    v8 = v6;
  else
    v8 = objc_alloc_init(MEMORY[0x1E0C99D80]);
  v9 = v8;

  objc_msgSend(v9, "addEntriesFromDictionary:", v4);
  v10 = objc_alloc(MEMORY[0x1E0CB35C8]);
  objc_msgSend(a1, "domain");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v10, "initWithDomain:code:userInfo:", v11, objc_msgSend(a1, "code"), v9);

  return v12;
}

- (id)ams_errorWithMultipleUnderlyingErrors:()AppleMediaServices
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v9 = *MEMORY[0x1E0CB2F70];
  v10[0] = a3;
  v4 = (void *)MEMORY[0x1E0C99D80];
  v5 = a3;
  objc_msgSend(v4, "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "ams_errorByAddingUserInfo:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)ams_errorWithUnderlyingError:()AppleMediaServices
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v9 = *MEMORY[0x1E0CB3388];
  v10[0] = a3;
  v4 = (void *)MEMORY[0x1E0C99D80];
  v5 = a3;
  objc_msgSend(v4, "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "ams_errorByAddingUserInfo:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (uint64_t)ams_hasDomain:()AppleMediaServices
{
  id v4;
  void *v5;
  uint64_t v6;

  v4 = a3;
  objc_msgSend(a1, "domain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", v4);

  return v6;
}

- (BOOL)ams_recursiveHasDomain:()AppleMediaServices code:
{
  id v6;
  _BOOL8 v7;
  void *v8;

  v6 = a3;
  if ((objc_msgSend(a1, "ams_hasDomain:code:", v6, a4) & 1) != 0)
  {
    v7 = 1;
  }
  else
  {
    objc_msgSend(a1, "ams_underlyingErrorWithDomain:code:", v6, a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v8 != 0;

  }
  return v7;
}

- (id)ams_underlyingErrorWithDomain:()AppleMediaServices
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __61__NSError_AppleMediaServices__ams_underlyingErrorWithDomain___block_invoke;
  v8[3] = &unk_1E2547A28;
  v9 = v4;
  v5 = v4;
  objc_msgSend(a1, "_ams_firstUnderlyingErrorPassingTest:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)ams_underlyingErrorWithDomain:()AppleMediaServices code:
{
  id v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;
  uint64_t v12;

  v6 = a3;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __66__NSError_AppleMediaServices__ams_underlyingErrorWithDomain_code___block_invoke;
  v10[3] = &unk_1E2547A50;
  v11 = v6;
  v12 = a4;
  v7 = v6;
  objc_msgSend(a1, "_ams_firstUnderlyingErrorPassingTest:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

@end
