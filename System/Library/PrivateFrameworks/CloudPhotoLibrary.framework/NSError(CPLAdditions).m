@implementation NSError(CPLAdditions)

- (uint64_t)isCPLErrorWithCode:()CPLAdditions
{
  void *v4;
  uint64_t v5;

  if (objc_msgSend(a1, "code") != a3)
    return 0;
  objc_msgSend(a1, "domain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqual:", CFSTR("CloudPhotoLibraryErrorDomain"));

  return v5;
}

- (uint64_t)isCPLError
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "domain");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "isEqual:", CFSTR("CloudPhotoLibraryErrorDomain"));

  return v2;
}

- (uint64_t)isCPLOperationCancelledError
{
  void *v2;
  uint64_t v3;

  if (objc_msgSend(a1, "code") != 3072)
    return 0;
  objc_msgSend(a1, "domain");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", *MEMORY[0x1E0CB28A8]);

  return v3;
}

- (uint64_t)isCPLOperationDeferredError
{
  return objc_msgSend(a1, "isCPLErrorWithCode:", 257);
}

- (BOOL)isCPLThrottlingError
{
  void *v2;
  int v3;

  objc_msgSend(a1, "domain");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("CloudPhotoLibraryErrorDomain"));

  return v3 && (objc_msgSend(a1, "code") & 0xFFFFFFFFFFFFFFFBLL) == 1000;
}

- (BOOL)isCPLEncryptionError
{
  void *v2;
  int v3;

  objc_msgSend(a1, "domain");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("CloudPhotoLibraryErrorDomain"));

  return v3 && objc_msgSend(a1, "code") == 70;
}

- (id)cplUnderlyingPOSIXError
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  char v5;
  void *v6;
  uint64_t v7;

  v1 = a1;
  v2 = *MEMORY[0x1E0CB2FE0];
  v3 = *MEMORY[0x1E0CB3388];
  do
  {
    objc_msgSend(v1, "domain");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isEqual:", v2);

    if ((v5 & 1) != 0)
      break;
    objc_msgSend(v1, "userInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", v3);
    v7 = objc_claimAutoreleasedReturnValue();

    v1 = (id)v7;
  }
  while (v7);
  return v1;
}

- (id)cplUnderlyingError
{
  id v1;
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v1 = a1;
  objc_msgSend(v1, "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *MEMORY[0x1E0CB3388];
  objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x1E0CB3388]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    do
    {
      objc_msgSend(v1, "userInfo");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "objectForKeyedSubscript:", v3);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v6, "userInfo");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKeyedSubscript:", v3);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      v1 = v6;
    }
    while (v8);
  }
  else
  {
    v6 = v1;
  }
  return v6;
}

- (__CFString)cplShortDomainDescription
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  __CFString *v6;

  if (cplShortDomainDescription_onceToken != -1)
    dispatch_once(&cplShortDomainDescription_onceToken, &__block_literal_global_8979);
  objc_msgSend(a1, "domain");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend((id)cplShortDomainDescription_wellKnownDomainToShortDomain, "objectForKey:", v2);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)v3;
    if (v3)
      v5 = (void *)v3;
    else
      v5 = v2;
    v6 = v5;

  }
  else
  {
    v6 = CFSTR("unknown");
  }

  return v6;
}

- (id)_cplSafeUserInfoForXPCDidChange:()CPLAdditions
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");
  v6 = *MEMORY[0x1E0CB2D50];
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0CB2D50]);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (!v5 || v5 == 1 && v7)
  {
    *a3 = 0;
    v9 = v4;
  }
  else
  {
    *a3 = 1;
    if (_cplSafeUserInfoForXPCDidChange__onceToken != -1)
      dispatch_once(&_cplSafeUserInfoForXPCDidChange__onceToken, &__block_literal_global_152_8978);
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", v5);
    v9 = v10;
    if (v8)
      objc_msgSend(v10, "setObject:forKey:", v8, v6);
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v11 = (id)_cplSafeUserInfoForXPCDidChange__safeKeys;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v27 != v14)
            objc_enumerationMutation(v11);
          v16 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * i);
          objc_msgSend(v4, "objectForKey:", v16, (_QWORD)v26);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          if (v17)
            objc_msgSend(v9, "setObject:forKey:", v17, v16);

        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      }
      while (v13);
    }

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("CPLErrorRetryAfterDate"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (v18)
    {
      v20 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v18, "timeIntervalSinceReferenceDate");
      objc_msgSend(v20, "numberWithDouble:");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v21, CFSTR("CPLErrorRetryAfterDate"));

    }
    v22 = *MEMORY[0x1E0CB3388];
    objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0CB3388], (_QWORD)v26);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "cplSafeErrorForXPC");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24)
      objc_msgSend(v9, "setObject:forKey:", v24, v22);

  }
  return v9;
}

- (id)cplSafeErrorForXPC
{
  void *v2;
  uint64_t v3;
  void *v5;
  void *v6;
  id v7;
  char v9;

  v9 = 0;
  objc_msgSend(a1, "_cplSafeUserInfoForXPCDidChange:", &v9);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_class();
  if (v3 == objc_opt_class() && v9 == 0)
  {
    v7 = a1;
  }
  else
  {
    v5 = (void *)MEMORY[0x1E0CB35C8];
    objc_msgSend(a1, "domain");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "errorWithDomain:code:userInfo:", v6, objc_msgSend(a1, "code"), v2);
    v7 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

- (id)_cplReinflatedUserInfoForXPCDidChange:()CPLAdditions
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(a1, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("CPLErrorRetryAfterDate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithDictionary:", v4);
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("CPLErrorRetryAfterDate"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)MEMORY[0x1E0C99D68];
    objc_msgSend(v7, "doubleValue");
    objc_msgSend(v8, "dateWithTimeIntervalSinceReferenceDate:");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v9, CFSTR("CPLErrorRetryAfterDate"));

    *a3 = 1;
  }
  else
  {
    *a3 = 0;
    v6 = v4;
  }

  return v6;
}

- (id)cplReinflatedErrorForXPC
{
  void *v2;
  uint64_t v3;
  void *v5;
  void *v6;
  id v7;
  char v9;

  v9 = 0;
  objc_msgSend(a1, "_cplReinflatedUserInfoForXPCDidChange:", &v9);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_class();
  if (v3 == objc_opt_class() && v9 == 0)
  {
    v7 = a1;
  }
  else
  {
    v5 = (void *)MEMORY[0x1E0CB35C8];
    objc_msgSend(a1, "domain");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "errorWithDomain:code:userInfo:", v6, objc_msgSend(a1, "code"), v2);
    v7 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

- (uint64_t)cplReturnCode
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "cplUnderlyingPOSIXError");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (v1)
    v3 = objc_msgSend(v1, "code");
  else
    v3 = 0xFFFFFFFFLL;

  return v3;
}

@end
