@implementation NSError(MSErrorUtilities)

- (id)_MSVerboseDescriptionRecursionCount:()MSErrorUtilities
{
  void *v3;
  void *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  if (a3 < 20)
  {
    v6 = (void *)MEMORY[0x1E0CB37A0];
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", CFSTR("%@:\n"), v8);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1, "domain");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("Domain  : %@\nCode    : %ld\n"), v9, objc_msgSend(a1, "code"));

    objc_msgSend(a1, "userInfo");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "localizedDescription");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)v11;
    if (v11)
      objc_msgSend(v3, "appendFormat:", CFSTR("Desc    : %@\n"), v11);
    objc_msgSend(a1, "localizedRecoverySuggestion");
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)v13;
    if (v13)
      objc_msgSend(v3, "appendFormat:", CFSTR("Sugg    : %@\n"), v13);
    if (objc_msgSend(v10, "count"))
      objc_msgSend(v3, "appendFormat:", CFSTR("UserInfo: %@\n"), v10);
    objc_msgSend(a1, "userInfo");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectForKey:", *MEMORY[0x1E0CB3388]);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      objc_msgSend(v16, "_MSVerboseDescriptionRecursionCount:", (a3 + 1));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "appendFormat:", CFSTR("...Underlying error:\n%@"), v17);

    }
  }
  else
  {
    _logRecursiveError();
    v3 = 0;
  }
  return v3;
}

- (uint64_t)MSVerboseDescription
{
  return objc_msgSend(a1, "_MSVerboseDescriptionRecursionCount:", 10);
}

- (id)MSMakePrimaryError
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(a1, "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "mutableCopy");

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("MSErrorIsPrimary"));

  v5 = (void *)MEMORY[0x1E0CB35C8];
  objc_msgSend(a1, "domain");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "errorWithDomain:code:userInfo:", v6, objc_msgSend(a1, "code"), v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)MSFindPrimaryError
{
  void *v1;
  uint64_t v2;
  void *v3;
  unsigned int v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;

  objc_msgSend(a1, "userInfo");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = *MEMORY[0x1E0CB3388];
  objc_msgSend(v1, "objectForKey:", *MEMORY[0x1E0CB3388]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = -1;
    do
    {
      objc_msgSend(v3, "userInfo");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "objectForKey:", CFSTR("MSErrorIsPrimary"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          if (objc_msgSend(v6, "BOOLValue"))
          {
            v8 = v3;

            v9 = v8;
            goto LABEL_12;
          }
        }
      }
      ++v4;
      objc_msgSend(v3, "userInfo");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKey:", v2);
      v8 = (id)objc_claimAutoreleasedReturnValue();

      if (!v8)
        break;
      v3 = v8;
    }
    while (v4 < 0x13);
    if (v4 >= 0x13)
      _logRecursiveError();
  }
  else
  {
    v8 = 0;
  }
  v9 = 0;
LABEL_12:

  return v9;
}

- (void)_MSApplyBlock:()MSErrorUtilities
{
  unsigned int (**v4)(id, void *);
  id v5;
  void *v6;
  unsigned int v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  unsigned int v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = a1;
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *MEMORY[0x1E0D46768];
    v9 = *MEMORY[0x1E0CB3388];
    do
    {
      if (!v4[2](v4, v6))
      {
        v18 = v6;
        goto LABEL_22;
      }
      objc_msgSend(v6, "userInfo");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectForKey:", v8);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v11, "count"))
      {
        v23 = 0u;
        v24 = 0u;
        v21 = 0u;
        v22 = 0u;
        v12 = v11;
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
        if (v13)
        {
          v14 = v13;
          v15 = *(_QWORD *)v22;
          while (2)
          {
            for (i = 0; i != v14; ++i)
            {
              if (*(_QWORD *)v22 != v15)
                objc_enumerationMutation(v12);
              if ((((uint64_t (*)(id, _QWORD))v4[2])(v4, *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i)) & 1) != 0)
              {

                v19 = v7;
                v18 = v6;
                goto LABEL_19;
              }
            }
            v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
            if (v14)
              continue;
            break;
          }
        }

      }
      objc_msgSend(v6, "userInfo");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "objectForKey:", v9);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      v19 = v7 + 1;
      if (!v18)
        break;
      v6 = v18;
    }
    while (v7++ < 0x13);
LABEL_19:
    if (v19 >= 0x14)
      _logRecursiveError();
  }
  else
  {
    v18 = 0;
  }
LABEL_22:

}

- (uint64_t)MSIsTemporaryNetworkError
{
  uint64_t v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  char v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v7 = 0;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __54__NSError_MSErrorUtilities__MSIsTemporaryNetworkError__block_invoke;
  v3[3] = &unk_1E95BBE48;
  v3[4] = &v4;
  objc_msgSend(a1, "_MSApplyBlock:", v3);
  v1 = *((unsigned __int8 *)v5 + 24);
  _Block_object_dispose(&v4, 8);
  return v1;
}

- (uint64_t)MSASStateMachineIsCanceledError
{
  return objc_msgSend(a1, "MSContainsErrorWithDomain:code:", CFSTR("MSASStateMachineErrorDomain"), 0);
}

- (uint64_t)MSCanBeIgnored
{
  return objc_msgSend(a1, "MSContainsErrorWithDomain:code:", *MEMORY[0x1E0D46750], 4);
}

- (uint64_t)MSNeedsBackoff
{
  uint64_t v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  char v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v7 = 0;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __43__NSError_MSErrorUtilities__MSNeedsBackoff__block_invoke;
  v3[3] = &unk_1E95BBE48;
  v3[4] = &v4;
  objc_msgSend(a1, "_MSApplyBlock:", v3);
  v1 = *((unsigned __int8 *)v5 + 24);
  _Block_object_dispose(&v4, 8);
  return v1;
}

- (uint64_t)MSIsCounted
{
  uint64_t v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  char v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v7 = 1;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __40__NSError_MSErrorUtilities__MSIsCounted__block_invoke;
  v3[3] = &unk_1E95BBE48;
  v3[4] = &v4;
  objc_msgSend(a1, "_MSApplyBlock:", v3);
  v1 = *((unsigned __int8 *)v5 + 24);
  _Block_object_dispose(&v4, 8);
  return v1;
}

- (uint64_t)MSIsFatal
{
  uint64_t v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  char v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v7 = 0;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __38__NSError_MSErrorUtilities__MSIsFatal__block_invoke;
  v3[3] = &unk_1E95BBE48;
  v3[4] = &v4;
  objc_msgSend(a1, "_MSApplyBlock:", v3);
  v1 = *((unsigned __int8 *)v5 + 24);
  _Block_object_dispose(&v4, 8);
  return v1;
}

- (uint64_t)MSIsAuthError
{
  uint64_t v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  char v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v7 = 0;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __42__NSError_MSErrorUtilities__MSIsAuthError__block_invoke;
  v3[3] = &unk_1E95BBE48;
  v3[4] = &v4;
  objc_msgSend(a1, "_MSApplyBlock:", v3);
  v1 = *((unsigned __int8 *)v5 + 24);
  _Block_object_dispose(&v4, 8);
  return v1;
}

- (uint64_t)MSIsBadTokenError
{
  uint64_t v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  char v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v7 = 0;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __46__NSError_MSErrorUtilities__MSIsBadTokenError__block_invoke;
  v3[3] = &unk_1E95BBE48;
  v3[4] = &v4;
  objc_msgSend(a1, "_MSApplyBlock:", v3);
  v1 = *((unsigned __int8 *)v5 + 24);
  _Block_object_dispose(&v4, 8);
  return v1;
}

- (uint64_t)MSContainsErrorWithDomain:()MSErrorUtilities code:
{
  id v6;
  id v7;
  uint64_t v8;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;

  v6 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __60__NSError_MSErrorUtilities__MSContainsErrorWithDomain_code___block_invoke;
  v10[3] = &unk_1E95BAB08;
  v7 = v6;
  v12 = &v14;
  v13 = a4;
  v11 = v7;
  objc_msgSend(a1, "_MSApplyBlock:", v10);
  v8 = *((unsigned __int8 *)v15 + 24);

  _Block_object_dispose(&v14, 8);
  return v8;
}

- (uint64_t)MSIsQuotaError
{
  uint64_t v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  char v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v7 = 0;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __43__NSError_MSErrorUtilities__MSIsQuotaError__block_invoke;
  v3[3] = &unk_1E95BBE48;
  v3[4] = &v4;
  objc_msgSend(a1, "_MSApplyBlock:", v3);
  v1 = *((unsigned __int8 *)v5 + 24);
  _Block_object_dispose(&v4, 8);
  return v1;
}

- (uint64_t)MSIsRegistrationError
{
  return objc_msgSend(a1, "MSContainsErrorWithDomain:code:", *MEMORY[0x1E0D46750], 27);
}

- (id)MSMMCSRetryAfterDate
{
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t, uint64_t);
  void (*v8)(uint64_t);
  id v9;

  v4 = 0;
  v5 = &v4;
  v6 = 0x3032000000;
  v7 = __Block_byref_object_copy_;
  v8 = __Block_byref_object_dispose_;
  v9 = 0;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __49__NSError_MSErrorUtilities__MSMMCSRetryAfterDate__block_invoke;
  v3[3] = &unk_1E95BBE48;
  v3[4] = &v4;
  objc_msgSend(a1, "_MSApplyBlock:", v3);
  v1 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return v1;
}

+ (uint64_t)MSErrorWithDomain:()MSErrorUtilities code:description:
{
  return objc_msgSend(a1, "MSErrorWithDomain:code:description:suggestion:", a3, a4, a5, 0);
}

+ (id)MSErrorWithDomain:()MSErrorUtilities code:description:suggestion:
{
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;

  v9 = (void *)MEMORY[0x1E0CB35C8];
  v10 = (void *)MEMORY[0x1E0C99D80];
  v11 = *MEMORY[0x1E0CB2D50];
  v12 = *MEMORY[0x1E0CB2D80];
  v13 = a3;
  objc_msgSend(v10, "dictionaryWithObjectsAndKeys:", a5, v11, a6, v12, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "errorWithDomain:code:userInfo:", v13, a4, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

+ (uint64_t)MSErrorWithDomain:()MSErrorUtilities code:description:underlyingError:
{
  return objc_msgSend(MEMORY[0x1E0CB35C8], "MSErrorWithDomain:code:description:underlyingError:additionalUserInfo:", a3, a4, a5, a6, 0);
}

+ (id)MSErrorWithDomain:()MSErrorUtilities code:description:underlyingError:additionalUserInfo:
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  v11 = a3;
  v12 = a5;
  v13 = a6;
  v14 = a7;
  objc_msgSend(v13, "MSFindPrimaryError");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (!v15)
    v15 = v13;
  objc_msgSend(v15, "localizedDescription");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    v18 = (void *)objc_msgSend(v14, "mutableCopy");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v19 = v18;
  if (v12)
    objc_msgSend(v18, "setObject:forKey:", v12, *MEMORY[0x1E0CB2D50]);
  if (v13)
    objc_msgSend(v19, "setObject:forKey:", v13, *MEMORY[0x1E0CB3388]);
  if (v17)
    objc_msgSend(v19, "setObject:forKey:", v17, *MEMORY[0x1E0CB2D80]);
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", v11, a4, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

@end
