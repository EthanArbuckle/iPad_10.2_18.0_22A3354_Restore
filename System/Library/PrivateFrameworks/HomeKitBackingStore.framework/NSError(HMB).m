@implementation NSError(HMB)

- (BOOL)hmbIsSQLiteConstraintError
{
  void *v1;
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a1, "userInfo");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "hmf_numberForKey:", CFSTR("extcode"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerValue") == 19;

  return v3;
}

- (BOOL)hmbIsSQLiteDatabaseCorruptedError
{
  void *v2;
  void *v3;
  _BOOL8 v4;
  void *v5;
  void *v6;

  objc_msgSend(a1, "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hmf_numberForKey:", CFSTR("extcode"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "integerValue") == 26)
  {
    v4 = 1;
  }
  else
  {
    objc_msgSend(a1, "userInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "hmf_numberForKey:", CFSTR("extcode"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v6, "integerValue") == 11;

  }
  return v4;
}

- (uint64_t)hmbIsCloudKitError
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "domain");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "isEqualToString:", *MEMORY[0x1E0C947D8]);

  return v2;
}

- (uint64_t)hmbIsCloudKitUnderlyingError
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "domain");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "isEqualToString:", *MEMORY[0x1E0C94B20]);

  return v2;
}

- (id)hmbCKUnderlyingError
{
  void *v1;
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(a1, "userInfo");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKeyedSubscript:", *MEMORY[0x1E0CB3388]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v2, "hmbIsCloudKitUnderlyingError"))
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

- (double)hmbCloudKitRetryDelay
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  double v16;
  double v17;
  double result;
  unint64_t v19;
  double v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(a1, "hmbIsCloudKitError") & 1) == 0)
  {
    objc_msgSend(a1, "hmbDefaultCloudKitRetryDelay");
    return result;
  }
  objc_msgSend(a1, "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x1E0C94808]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  if (!v5 || (objc_msgSend(v5, "doubleValue"), v7 = v6, v6 < 0.0))
  {
    if (objc_msgSend(a1, "hmbIsCKPartialFailureError"))
    {
      objc_msgSend(a1, "userInfo");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0C94940]);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      v23 = 0u;
      v24 = 0u;
      v21 = 0u;
      v22 = 0u;
      v10 = v9;
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v22;
        v7 = -1.0;
LABEL_10:
        v14 = 0;
        while (1)
        {
          if (*(_QWORD *)v22 != v13)
            objc_enumerationMutation(v10);
          objc_msgSend(v10, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v14), (_QWORD)v21);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "hmbCloudKitRetryDelay");
          v17 = v16;

          if (v17 == -1.0)
            break;
          if (v12 == ++v14)
          {
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
            if (v12)
              goto LABEL_10;
            v7 = v17;
            break;
          }
        }
      }
      else
      {
        v7 = -1.0;
      }

      goto LABEL_24;
    }
    v19 = objc_msgSend(a1, "code");
    v7 = -1.0;
    if (v19 <= 0x17)
    {
      if (((1 << v19) & 0x9000D8) == 0)
      {
        if (v19 != 14 || !objc_msgSend(a1, "_hmbHasCKUnderlyingErrorWithCode:", 2037))
          goto LABEL_24;
        goto LABEL_21;
      }
      if ((objc_msgSend(a1, "_hmbHasCKUnderlyingErrorWithCode:", 3006) & 1) == 0)
      {
LABEL_21:
        objc_msgSend(a1, "hmbDefaultCloudKitRetryDelay");
        v7 = v20;
      }
    }
  }
LABEL_24:

  return v7;
}

- (double)hmbDefaultCloudKitRetryDelay
{
  void *v0;
  double v1;

  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v0, "isLowPowerModeEnabled"))
    v1 = 600.0;
  else
    v1 = 60.0;

  return v1;
}

- (uint64_t)hmbIsCKZoneDeletedError
{
  return objc_msgSend(a1, "_hmbIsCKErrorOrHasPartialFailurePassingFilter:", &__block_literal_global_6220);
}

- (uint64_t)hmbIsCKChangeTokenExpiredError
{
  return objc_msgSend(a1, "_hmbIsCKErrorWithCode:", 21);
}

- (uint64_t)hmbIsCKPartialFailureError
{
  return objc_msgSend(a1, "_hmbIsCKErrorWithCode:", 2);
}

- (uint64_t)hmbIsCKMissingManateeIdentityError
{
  return objc_msgSend(a1, "_hmbIsCKErrorOrHasPartialFailureWithCode:", 112);
}

- (uint64_t)hmbIsCKLimitExceededError
{
  return objc_msgSend(a1, "_hmbIsCKErrorOrHasPartialFailureWithCode:", 27);
}

- (uint64_t)hmbIsCKManateeUnavailableError
{
  return objc_msgSend(a1, "_hmbIsCKErrorOrHasPartialFailureWithCode:", 110);
}

- (uint64_t)hmbIsCKUnsyncedKeychainError
{
  return objc_msgSend(a1, "_hmbIsCKErrorOrHasPartialFailureWithCode:", 111);
}

- (uint64_t)hmbIsCKNotAuthenticatedError
{
  return objc_msgSend(a1, "_hmbIsCKErrorOrHasPartialFailureWithCode:", 9);
}

- (uint64_t)hmbIsCKZoneDisabledError
{
  void *v2;
  void *v3;
  uint64_t v4;

  if (!objc_msgSend(a1, "_hmbIsCKErrorWithCode:", 15)
    || !objc_msgSend(a1, "_hmbHasCKUnderlyingErrorWithCode:", 2000))
  {
    return 0;
  }
  objc_msgSend(a1, "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x1E0C94810]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("User modifications not allowed in disabled zone"));

  return v4;
}

- (uint64_t)_hmbIsCKErrorWithCode:()HMB
{
  uint64_t result;

  result = objc_msgSend(a1, "hmbIsCloudKitError");
  if ((_DWORD)result)
    return objc_msgSend(a1, "code") == a3;
  return result;
}

- (uint64_t)_hmbIsCKUnderlyingErrorWithCode:()HMB
{
  uint64_t result;

  result = objc_msgSend(a1, "hmbIsCloudKitUnderlyingError");
  if ((_DWORD)result)
    return objc_msgSend(a1, "code") == a3;
  return result;
}

- (uint64_t)_hmbIsCKErrorOrHasPartialFailureWithCode:()HMB
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __57__NSError_HMB___hmbIsCKErrorOrHasPartialFailureWithCode___block_invoke;
  v4[3] = &__block_descriptor_40_e17_B16__0__NSError_8l;
  v4[4] = a3;
  return objc_msgSend(a1, "_hmbIsCKErrorOrHasPartialFailurePassingFilter:", v4);
}

- (uint64_t)_hmbIsCKErrorOrHasPartialFailurePassingFilter:()HMB
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  if (objc_msgSend(a1, "hmbIsCKPartialFailureError"))
  {
    objc_msgSend(a1, "userInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0C94940]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "allValues");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __62__NSError_HMB___hmbIsCKErrorOrHasPartialFailurePassingFilter___block_invoke;
    v10[3] = &unk_1E89337F0;
    v11 = v4;
    v8 = objc_msgSend(v7, "na_any:", v10);

  }
  else
  {
    v8 = (*((uint64_t (**)(id, void *))v4 + 2))(v4, a1);
  }

  return v8;
}

- (uint64_t)_hmbHasCKUnderlyingErrorWithCode:()HMB
{
  uint64_t v5;
  void *v6;
  void *v7;

  if ((objc_msgSend(a1, "_hmbIsCKUnderlyingErrorWithCode:") & 1) != 0)
    return 1;
  objc_msgSend(a1, "hmbCKUnderlyingError");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
    v5 = objc_msgSend(v6, "_hmbHasCKUnderlyingErrorWithCode:", a3);
  else
    v5 = 0;

  return v5;
}

@end
