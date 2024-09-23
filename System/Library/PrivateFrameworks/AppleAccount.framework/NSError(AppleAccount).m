@implementation NSError(AppleAccount)

+ (uint64_t)aa_errorWithCode:()AppleAccount
{
  return objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.AppleAccount.Error"), a3, 0);
}

+ (uint64_t)aa_errorWithCode:()AppleAccount userInfo:
{
  return objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.AppleAccount.Error"), a3, a4);
}

+ (id)aa_errorWithCode:()AppleAccount underlyingError:
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  if (a4)
  {
    v11 = *MEMORY[0x1E0CB3388];
    v12[0] = a4;
    v6 = (void *)MEMORY[0x1E0C99D80];
    v7 = a4;
    objc_msgSend(v6, "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }
  objc_msgSend(a1, "aa_errorWithCode:userInfo:", a3, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)aa_errorWithServerResponse:()AppleAccount
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v17;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("NSError+AppleAccount.m"), 52, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("serverResponse"));

  }
  v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_opt_class();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("localizedError"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;

  if (v8)
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v8, CFSTR("AAServerDescription"));
  objc_opt_class();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("protocolVersion"));
  v9 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v10 = v9;
  else
    v10 = 0;

  if (v10)
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v10, CFSTR("AAServerProtocolVersion"));
  objc_opt_class();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("message"));
  v11 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v12 = v11;
  else
    v12 = 0;

  if (v12)
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v12, *MEMORY[0x1E0CB2D50]);
  v13 = (void *)MEMORY[0x1E0CB35C8];
  v14 = (void *)objc_msgSend(v6, "copy");
  objc_msgSend(v13, "aa_errorWithCode:userInfo:", -4402, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)_aa_userReadableError
{
  id v1;
  void *v2;
  void *v3;
  int v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;

  v1 = a1;
  objc_msgSend(v1, "domain");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isEqualToString:", *MEMORY[0x1E0C930A8]))
  {

    goto LABEL_4;
  }
  objc_msgSend(v1, "domain");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0CB32E8]);

  if (v4)
  {
LABEL_4:
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AppleAccount"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("NETWORK_ERROR_GENERIC"), 0, CFSTR("Localizable"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = objc_msgSend(v1, "code");
    if (v7 <= -1002)
    {
      if (v7 == -1012)
      {
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AppleAccount"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v8;
        v10 = CFSTR("INVALID_PASSWORD");
        goto LABEL_18;
      }
      if (v7 != -1009 && v7 != -1005)
        goto LABEL_19;
    }
    else
    {
      if (v7 > 306)
      {
        if (v7 != 310 && v7 != 307)
          goto LABEL_19;
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AppleAccount"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v8;
        v10 = CFSTR("NETWORK_ERROR_PROXY");
        goto LABEL_18;
      }
      if (v7 == -1001)
      {
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AppleAccount"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v8;
        v10 = CFSTR("NETWORK_ERROR_TIMEOUT");
        goto LABEL_18;
      }
      if (v7 != 302)
        goto LABEL_19;
    }
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AppleAccount"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    v10 = CFSTR("NETWORK_ERROR_NOT_CONNECTED");
LABEL_18:
    objc_msgSend(v8, "localizedStringForKey:value:table:", v10, 0, CFSTR("Localizable"));
    v11 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v11;
LABEL_19:
    objc_msgSend(v1, "userInfo");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v12, "mutableCopy");

    objc_msgSend(v13, "setObject:forKeyedSubscript:", v6, *MEMORY[0x1E0CB2D50]);
    v14 = (void *)MEMORY[0x1E0CB35C8];
    objc_msgSend(v1, "domain");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "errorWithDomain:code:userInfo:", v15, objc_msgSend(v1, "code"), v13);
    v16 = objc_claimAutoreleasedReturnValue();

    v1 = (id)v16;
  }
  return v1;
}

- (BOOL)aa_isAAErrorWithCode:()AppleAccount
{
  void *v5;
  _BOOL8 v6;

  objc_msgSend(a1, "domain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.AppleAccount.Error")))
    v6 = objc_msgSend(a1, "code") == a3;
  else
    v6 = 0;

  return v6;
}

- (BOOL)aa_isAASignInErrorWithCode:()AppleAccount
{
  void *v5;
  _BOOL8 v6;

  objc_msgSend(a1, "domain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("AASignInErrors")))
    v6 = objc_msgSend(a1, "code") == a3;
  else
    v6 = 0;

  return v6;
}

- (uint64_t)aa_isAACustodianRecoveryError
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "domain");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "isEqualToString:", CFSTR("AACustodianRecoveryErrors"));

  return v2;
}

- (BOOL)aa_isAACustodianRecoveryErrorWithCode:()AppleAccount
{
  void *v5;
  _BOOL8 v6;

  objc_msgSend(a1, "domain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("AACustodianRecoveryErrors")))
    v6 = objc_msgSend(a1, "code") == a3;
  else
    v6 = 0;

  return v6;
}

- (uint64_t)aa_isAARecoverableError
{
  void *v2;
  uint64_t v4;

  objc_msgSend(a1, "domain");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isEqualToString:", *MEMORY[0x1E0CB32E8]))
  {
    if (objc_msgSend(a1, "code") == -997 || objc_msgSend(a1, "code") == -1005 || objc_msgSend(a1, "code") == -1001)
    {

      return 1;
    }
    v4 = objc_msgSend(a1, "code");

    if (v4 == -1009)
      return 1;
  }
  else
  {

  }
  return 0;
}

- (uint64_t)aa_isXPCError
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "domain");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isEqualToString:", *MEMORY[0x1E0CB28A8]))
  {
    v3 = objc_msgSend(a1, "code");

    if (v3 == 4097)
      return 1;
  }
  else
  {

  }
  return 0;
}

- (id)aa_partialErrorsByName
{
  void *v2;
  id v3;
  id v4;

  if (objc_msgSend(a1, "aa_isAAErrorWithCode:", -4408))
  {
    objc_opt_class();
    objc_msgSend(a1, "userInfo");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("AAPartialErrorsByNameKey"));
    v3 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v4 = v3;
    else
      v4 = 0;

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

@end
