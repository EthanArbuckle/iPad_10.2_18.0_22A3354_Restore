@implementation NSError(AuthKit)

- (id)ak_errorByAppendingUserInfo:()AuthKit
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;

  v4 = a3;
  objc_msgSend(a1, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");
  v7 = v6;
  if (v6)
    v8 = v6;
  else
    v8 = (id)objc_opt_new();
  v9 = v8;

  objc_msgSend(v9, "addEntriesFromDictionary:", v4);
  v10 = (void *)MEMORY[0x1E0CB35C8];
  objc_msgSend(a1, "domain");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(a1, "code");
  v13 = (void *)objc_msgSend(v9, "copy");
  objc_msgSend(v10, "errorWithDomain:code:userInfo:", v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (uint64_t)ak_errorWithCode:()AuthKit
{
  return objc_msgSend(a1, "ak_errorWithCode:userInfo:", a3, 0);
}

+ (uint64_t)ak_errorWithCode:()AuthKit userInfo:
{
  return objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("AKAuthenticationError"), a3, a4);
}

+ (id)ak_errorWithCode:()AuthKit underlyingError:
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = v5;
  if (v5)
  {
    v10 = *MEMORY[0x1E0CB3388];
    v11[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "ak_errorWithCode:userInfo:", a3, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)ak_anisetteErrorWithCode:()AuthKit underlyingError:
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = v5;
  if (v5)
  {
    v10 = *MEMORY[0x1E0CB3388];
    v11[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("AKAnisetteError"), a3, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)ak_generalErrorWithCode:()AuthKit errorDomain:underlyingError:
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a5;
  v9 = v8;
  if (v8)
  {
    v13 = *MEMORY[0x1E0CB3388];
    v14[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", v7, a3, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)ak_wrappedAnisetteError:()AuthKit underlyingADIErrorCode:
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("AKUnderlyingADIErrors"), a4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0CB35C8];
  v10 = *MEMORY[0x1E0CB3388];
  v11[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "errorWithDomain:code:userInfo:", CFSTR("AKAnisetteError"), a3, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (uint64_t)ak_wrappedAnisetteError:()AuthKit
{
  return objc_msgSend(MEMORY[0x1E0CB35C8], "ak_wrappedAnisetteError:underlyingADIErrorCode:", -8004, a3);
}

+ (uint64_t)ak_passkeyErrorWithCode:()AuthKit
{
  return objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("AKAppleIDPasskeyError"), a3, 0);
}

+ (uint64_t)ak_deviceListErrorWithCode:()AuthKit
{
  return objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("AKDeviceListError"), a3, 0);
}

- (uint64_t)ak_isUserCancelError
{
  uint64_t result;

  result = objc_msgSend(a1, "ak_isAuthenticationError");
  if ((_DWORD)result)
    return objc_msgSend(a1, "code") == -7003;
  return result;
}

- (uint64_t)ak_isUserSkippedError
{
  uint64_t result;

  result = objc_msgSend(a1, "ak_isAuthenticationError");
  if ((_DWORD)result)
    return objc_msgSend(a1, "code") == -7038;
  return result;
}

- (uint64_t)ak_isUserTryAgainError
{
  uint64_t result;

  result = objc_msgSend(a1, "ak_isAuthenticationError");
  if ((_DWORD)result)
    return objc_msgSend(a1, "code") == -7062;
  return result;
}

- (uint64_t)ak_isUserInitiatedError
{
  if ((objc_msgSend(a1, "ak_isUserCancelError") & 1) != 0)
    return 1;
  else
    return objc_msgSend(a1, "ak_isUserSkippedError");
}

- (uint64_t)ak_isServiceError
{
  uint64_t result;

  result = objc_msgSend(a1, "ak_isAuthenticationError");
  if ((_DWORD)result)
    return objc_msgSend(a1, "code") == -7029 || objc_msgSend(a1, "code") == -7005;
  return result;
}

- (uint64_t)ak_isXPCServiceError
{
  void *v2;
  uint64_t v3;

  if (objc_msgSend(a1, "code") != 4099 && objc_msgSend(a1, "code") != 4097)
    return 0;
  objc_msgSend(a1, "domain");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", *MEMORY[0x1E0CB28A8]);

  return v3;
}

- (uint64_t)ak_isUnableToPromptError
{
  uint64_t result;

  result = objc_msgSend(a1, "ak_isAuthenticationError");
  if ((_DWORD)result)
    return objc_msgSend(a1, "code") == -7013;
  return result;
}

- (uint64_t)ak_isSurrogateAuthAlreadyInProgressError
{
  uint64_t result;

  result = objc_msgSend(a1, "ak_isAuthenticationError");
  if ((_DWORD)result)
    return objc_msgSend(a1, "code") == -7045;
  return result;
}

- (uint64_t)ak_isIncompatibleDevicesError
{
  uint64_t result;

  result = objc_msgSend(a1, "ak_isAuthenticationError");
  if ((_DWORD)result)
    return objc_msgSend(a1, "code") == -7095;
  return result;
}

- (uint64_t)ak_isAuthenticationErrorWithCode:()AuthKit
{
  uint64_t result;

  result = objc_msgSend(a1, "ak_isAuthenticationError");
  if ((_DWORD)result)
    return objc_msgSend(a1, "code") == a3;
  return result;
}

- (uint64_t)ak_isAuthenticationError
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "domain");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "isEqualToString:", CFSTR("AKAuthenticationError"));

  return v2;
}

- (BOOL)ak_isLAUserCancelError
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a1, "domain");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isEqualToString:", *MEMORY[0x1E0CC1278]))
    v3 = objc_msgSend(a1, "code") == -2;
  else
    v3 = 0;

  return v3;
}

- (uint64_t)ak_isServerThrottlingError
{
  uint64_t result;

  result = objc_msgSend(a1, "ak_isAuthenticationError");
  if ((_DWORD)result)
    return objc_msgSend(a1, "code") == -7120;
  return result;
}

- (uint64_t)ak_isEligibleForProxiedAuthFallback
{
  uint64_t v2;
  NSObject *v3;
  const __CFString *v4;
  int v6;
  const __CFString *v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(a1, "ak_isUnableToPromptError");
  _AKLogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = CFSTR("NO");
    if ((_DWORD)v2)
      v4 = CFSTR("YES");
    v6 = 138412546;
    v7 = v4;
    v8 = 2112;
    v9 = a1;
    _os_log_impl(&dword_19202F000, v3, OS_LOG_TYPE_DEFAULT, "Proxied auth fallback eligibility: %@, %@", (uint8_t *)&v6, 0x16u);
  }

  return v2;
}

- (id)ak_allUnderlyingErrorsWithMaxDepth:()AuthKit
{
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v12;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = a1;
  if (v6 && a3 >= 1)
  {
    v7 = *MEMORY[0x1E0CB3388];
    v8 = 1;
    do
    {
      v9 = v6;
      objc_msgSend(v5, "addObject:", v6);
      objc_msgSend(v6, "userInfo");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectForKeyedSubscript:", v7);
      v6 = (id)objc_claimAutoreleasedReturnValue();

      if (!v6)
        break;
    }
    while (v8++ < a3);
  }
  v12 = (void *)objc_msgSend(v5, "copy");

  return v12;
}

- (uint64_t)ak_allUnderlyingErrors
{
  return objc_msgSend(a1, "ak_allUnderlyingErrorsWithMaxDepth:", 10);
}

- (id)errorDescriptionIncludingUnderlyingErrorsWithMaxDepth:()AuthKit
{
  void *v1;
  void *v2;
  id v3;
  void *v4;
  _QWORD v6[4];
  id v7;

  objc_msgSend(a1, "ak_allUnderlyingErrorsWithMaxDepth:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v1, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __74__NSError_AuthKit__errorDescriptionIncludingUnderlyingErrorsWithMaxDepth___block_invoke;
    v6[3] = &unk_1E2E5FF80;
    v7 = v2;
    v3 = v2;
    objc_msgSend(v1, "enumerateObjectsUsingBlock:", v6);
    objc_msgSend(v3, "componentsJoinedByString:", CFSTR(","));
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)isAccountNotProvisioned
{
  BOOL v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(a1, "code") == -45061 || objc_msgSend(a1, "code") == -45059;
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  objc_msgSend(a1, "underlyingErrors", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
        if (objc_msgSend(v8, "code") == -45061 || objc_msgSend(v8, "code") == -45059)
          v2 = 1;
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

  return v2;
}

@end
