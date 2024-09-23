@implementation NSError(FCAdditions)

- (BOOL)fc_isOperationThrottledError
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a1, "domain");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isEqualToString:", CFSTR("FCErrorDomain")))
    v3 = objc_msgSend(a1, "code") == 12;
  else
    v3 = 0;

  return v3;
}

- (id)fc_errorWithMaximumRetryAfter:()FCAdditions
{
  void *v4;
  void *v5;
  void *v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v15[5];

  if (a2 == 0.0)
  {
    v13 = a1;
  }
  else
  {
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __54__NSError_FCAdditions__fc_errorWithMaximumRetryAfter___block_invoke_2;
    v15[3] = &unk_1E463ADC8;
    v15[4] = a1;
    __54__NSError_FCAdditions__fc_errorWithMaximumRetryAfter___block_invoke_2((uint64_t)v15);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      objc_msgSend(a1, "userInfo");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "objectForKeyedSubscript:", v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v6, "doubleValue");
      if (v7 <= a2)
      {
        v13 = a1;
      }
      else
      {
        objc_msgSend(a1, "userInfo");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = (void *)objc_msgSend(v8, "mutableCopy");

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a2);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setObject:forKeyedSubscript:", v10, v4);

        v11 = (void *)MEMORY[0x1E0CB35C8];
        objc_msgSend(a1, "domain");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "errorWithDomain:code:userInfo:", v12, objc_msgSend(a1, "code"), v9);
        v13 = (id)objc_claimAutoreleasedReturnValue();

      }
    }
    else
    {
      v13 = a1;
    }

  }
  return v13;
}

- (uint64_t)fc_shouldRetry
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "userInfo");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("NSErrorFCAdditionsShouldRetry"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (uint64_t)fc_isNetworkUnavailableError
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "userInfo");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("NSErrorFCAdditionsIsNetworkUnavailable"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (uint64_t)fc_isCancellationError
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;

  objc_msgSend(a1, "domain");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isEqualToString:", *MEMORY[0x1E0C947D8]) && objc_msgSend(a1, "code") == 20)
  {
    v3 = 1;
  }
  else
  {
    objc_msgSend(a1, "domain");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0CB32E8]) && objc_msgSend(a1, "code") == -999)
    {
      v3 = 1;
    }
    else
    {
      objc_msgSend(a1, "domain");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v5, "isEqualToString:", CFSTR("FCErrorDomain")) && objc_msgSend(a1, "code") == 1)
        v3 = 1;
      else
        v3 = objc_msgSend(a1, "fc_hasUnderlyingErrorPassingTest:", &__block_literal_global_150);

    }
  }

  return v3;
}

- (BOOL)fc_isRequestDroppedError
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a1, "domain");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isEqualToString:", CFSTR("FCErrorDomain")))
    v3 = objc_msgSend(a1, "code") == 2;
  else
    v3 = 0;

  return v3;
}

- (uint64_t)fc_isServiceUnavailableError
{
  void *v2;
  uint64_t v3;
  _BOOL8 v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(a1, "domain");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isEqualToString:", *MEMORY[0x1E0C947D8]))
  {
    v3 = objc_msgSend(a1, "code");

    if (v3 == 6)
      return 1;
  }
  else
  {

  }
  objc_msgSend(a1, "domain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("FCErrorDomain")))
  {
    objc_msgSend(a1, "userInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("FCErrorHTTPStatusCode"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v7, "unsignedIntegerValue") == 503;

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (uint64_t)fc_isOfflineError
{
  return objc_msgSend(a1, "fc_isOfflineErrorOfflineReason:", 0);
}

- (uint64_t)fc_isOfflineErrorOfflineReason:()FCAdditions
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD v16[5];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;

  objc_msgSend(a1, "domain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(a1, "code");
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("FCErrorDomain")))
  {
    if (v6 == 10)
    {
      objc_msgSend(a1, "userInfo");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("FCErrorOfflineReasonKey"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      v9 = objc_msgSend(v8, "unsignedIntegerValue");
      v18[3] = v9;

      goto LABEL_15;
    }
LABEL_20:
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __55__NSError_FCAdditions__fc_isOfflineErrorOfflineReason___block_invoke;
    v16[3] = &unk_1E4648BC0;
    v16[4] = &v17;
    v14 = objc_msgSend(a1, "fc_hasUnderlyingErrorPassingTest:", v16);
    goto LABEL_21;
  }
  if ((objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0C947D8]) & 1) != 0)
  {
    if ((unint64_t)(v6 - 3) >= 2)
      goto LABEL_20;
  }
  else
  {
    if (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0CB32E8]))
    {
      v10 = objc_msgSend(a1, "code");
      if ((unint64_t)(v10 + 1018) > 0x13)
        goto LABEL_20;
      v11 = 1 << (v10 - 6);
      v12 = 664065;
    }
    else
    {
      if (!objc_msgSend(v5, "isEqual:", *MEMORY[0x1E0C930A8]))
        goto LABEL_20;
      v13 = objc_msgSend(a1, "code");
      if (v13 > 0)
      {
        if (v13 != 1 && v13 != 302 && v13 != 310)
          goto LABEL_20;
        goto LABEL_15;
      }
      if ((unint64_t)(v13 + 1020) > 0x13)
        goto LABEL_20;
      v11 = 1 << (v13 - 4);
      v12 = 772103;
    }
    if ((v11 & v12) == 0)
      goto LABEL_20;
  }
LABEL_15:
  v14 = 1;
  if (!v18[3])
    v18[3] = 1;
LABEL_21:
  if (a3)
    *a3 = v18[3];
  _Block_object_dispose(&v17, 8);

  return v14;
}

- (BOOL)fc_isBlockedInStoreFrontError
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a1, "domain");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isEqualToString:", CFSTR("FCErrorDomain")))
    v3 = objc_msgSend(a1, "code") == 20;
  else
    v3 = 0;

  return v3;
}

- (BOOL)fc_isAVUnauthorizedError
{
  void *v2;
  int v3;

  objc_msgSend(a1, "domain");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("FCErrorDomain"));

  if (!v3)
    return 0;
  if (objc_msgSend(a1, "code") == 34)
    return 1;
  return objc_msgSend(a1, "code") == 35;
}

- (BOOL)fc_isHTTPNotFoundError
{
  void *v2;
  int v3;
  void *v4;
  void *v5;
  _BOOL8 v6;

  objc_msgSend(a1, "domain");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("FCErrorDomain"));

  if (!v3 || objc_msgSend(a1, "code") != 4)
    return 0;
  objc_msgSend(a1, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("FCErrorHTTPStatusCode"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    v6 = objc_msgSend(v5, "unsignedIntegerValue") == 404;
  else
    v6 = 0;

  return v6;
}

- (uint64_t)fc_isAuthenticationUserCancelled
{
  void *v2;
  uint64_t v3;
  _BOOL8 v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(a1, "domain");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isEqualToString:", *MEMORY[0x1E0CFD808]))
  {
    v3 = objc_msgSend(a1, "code");

    if (v3 == 6)
      return 1;
  }
  else
  {

  }
  objc_msgSend(a1, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x1E0CB3388];
  objc_msgSend(v5, "objectForKey:", *MEMORY[0x1E0CB3388]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "userInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v7, "code") == -7003 || objc_msgSend(v9, "code") == -7003;
  return v4;
}

- (uint64_t)fc_failedDueToTaskConstraints
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(a1, "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x1E0CB3310]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    v4 = 1;
  else
    v4 = objc_msgSend(a1, "fc_hasUnderlyingErrorPassingTest:", &__block_literal_global_13_0);

  return v4;
}

- (BOOL)fc_hasUnderlyingErrorPassingTest:()FCAdditions
{
  uint64_t (**v4)(id, _QWORD);
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  _BOOL8 v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(a1, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2F70]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v17;
    while (2)
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v7);
        if ((v4[2](v4, *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v11)) & 1) != 0)
        {
          v14 = 1;
          v13 = v7;
          goto LABEL_14;
        }
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v9)
        continue;
      break;
    }
  }

  objc_msgSend(a1, "userInfo", (_QWORD)v16);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x1E0CB3388]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = v13 && (((uint64_t (**)(id, void *))v4)[2](v4, v13) & 1) != 0;
LABEL_14:

  return v14;
}

@end
