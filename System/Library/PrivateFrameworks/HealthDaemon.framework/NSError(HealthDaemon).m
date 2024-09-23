@implementation NSError(HealthDaemon)

- (id)hd_cloudKitErrorRequiringUserAction
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint8_t v35[128];
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  void *v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a1, "hk_isHealthKitError"))
  {
    if (objc_msgSend(a1, "hk_isHealthKitErrorWithCode:", 703))
      return a1;
    if (objc_msgSend(a1, "code") == 711)
    {
      v33 = 0u;
      v34 = 0u;
      v31 = 0u;
      v32 = 0u;
      objc_msgSend(a1, "userInfo");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "objectForKeyedSubscript:", 0x1E6D3D138);
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v31, v40, 16);
      if (v5)
      {
        v6 = v5;
        v7 = *(_QWORD *)v32;
LABEL_7:
        v8 = 0;
        while (1)
        {
          if (*(_QWORD *)v32 != v7)
            objc_enumerationMutation(v4);
          objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * v8), "hd_cloudKitErrorRequiringUserAction");
          v9 = (id)objc_claimAutoreleasedReturnValue();
          if (v9)
            break;
          if (v6 == ++v8)
          {
            v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v31, v40, 16);
            if (v6)
              goto LABEL_7;
            goto LABEL_13;
          }
        }
LABEL_19:
        v17 = v9;
LABEL_20:

        return v17;
      }
LABEL_13:

      goto LABEL_33;
    }
    objc_msgSend(a1, "userInfo");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *MEMORY[0x1E0CB3388];
    objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x1E0CB3388]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      objc_msgSend(a1, "userInfo");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "objectForKeyedSubscript:", v11);
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v4, "hd_cloudKitErrorRequiringUserAction");
      v9 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_19;
    }
  }
  objc_msgSend(a1, "domain");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "isEqualToString:", *MEMORY[0x1E0C947D8]);

  if (v15)
  {
    -[NSError _hd_cloudKitErrorRequiringUserActionFromCKErrorDomain](a1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v16;
    if (v16)
    {
      v9 = v16;
      goto LABEL_19;
    }
    if (objc_msgSend(a1, "code") == 2)
    {
      objc_msgSend(a1, "userInfo");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "objectForKeyedSubscript:", *MEMORY[0x1E0C94940]);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      _HKInitializeLogging();
      v20 = *MEMORY[0x1E0CB5370];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v37 = a1;
        v38 = 2114;
        v39 = v19;
        _os_log_impl(&dword_1B7802000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@ partial error: %{public}@", buf, 0x16u);
      }
      v29 = 0u;
      v30 = 0u;
      v27 = 0u;
      v28 = 0u;
      objc_msgSend(v19, "allValues", 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
      if (v22)
      {
        v23 = v22;
        v24 = *(_QWORD *)v28;
        while (2)
        {
          for (i = 0; i != v23; ++i)
          {
            if (*(_QWORD *)v28 != v24)
              objc_enumerationMutation(v21);
            v26 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
            if (objc_msgSend(v26, "code") != 22)
            {
              -[NSError _hd_cloudKitErrorRequiringUserActionFromCKErrorDomain](v26);
              v17 = (void *)objc_claimAutoreleasedReturnValue();

              goto LABEL_20;
            }
          }
          v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
          if (v23)
            continue;
          break;
        }
      }

    }
  }
LABEL_33:
  v17 = 0;
  return v17;
}

- (uint64_t)hd_isManateeIdentityLossError
{
  void *v2;
  int v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  char v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "domain");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", *MEMORY[0x1E0C947D8]);

  if (!v3)
    return 0;
  if (objc_msgSend(a1, "code") == 112)
    return 1;
  if (objc_msgSend(a1, "code") != 2)
    return 0;
  objc_msgSend(a1, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0C94940]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v7 = v6;
  v4 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v4)
  {
    v8 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v7);
        objc_msgSend(v7, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i), (_QWORD)v13);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "hd_isManateeIdentityLossError");

        if ((v11 & 1) != 0)
        {
          v4 = 1;
          goto LABEL_17;
        }
      }
      v4 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_17:

  return v4;
}

- (uint64_t)hd_shouldPreventCloudKitCacheUpdate
{
  void *v2;
  int v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  char v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "domain");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", *MEMORY[0x1E0C947D8]);

  if (!v3)
    return 0;
  if (objc_msgSend(a1, "code") == 111)
    return 1;
  if (objc_msgSend(a1, "code") != 2)
    return 0;
  objc_msgSend(a1, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0C94940]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v7 = v6;
  v4 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v4)
  {
    v8 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v7);
        objc_msgSend(v7, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i), (_QWORD)v13);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "hd_shouldPreventCloudKitCacheUpdate");

        if ((v11 & 1) != 0)
        {
          v4 = 1;
          goto LABEL_17;
        }
      }
      v4 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_17:

  return v4;
}

- (uint64_t)hd_errorStrippingExpectedCloudKitPartialFailures
{
  return objc_msgSend(a1, "hd_errorStrippingCloudKitPartialFailuresWithShouldIgnoreBlock:", &__block_literal_global_181);
}

- (id)hd_errorStrippingCloudKitPartialFailuresWithShouldIgnoreBlock:()HealthDaemon
{
  uint64_t (**v4)(id, void *);
  void *v5;
  char v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  void *v19;
  void *v20;
  NSObject *v21;
  id v22;
  void *v23;
  id v24;
  void *v25;
  uint64_t v27;
  void *v28;
  char v29;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint8_t buf[4];
  uint64_t v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  uint64_t v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(a1, "domain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0C947D8]);

  if ((v6 & 1) == 0)
    goto LABEL_20;
  if (objc_msgSend(a1, "code") == 2)
  {
    v30 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(a1, "userInfo");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *MEMORY[0x1E0C94940];
    objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0C94940]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    _HKInitializeLogging();
    v10 = (void *)*MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
    {
      v11 = v10;
      *(_DWORD *)buf = 134217984;
      v36 = objc_msgSend(v9, "count");
      _os_log_impl(&dword_1B7802000, v11, OS_LOG_TYPE_DEFAULT, "%ld partial errors", buf, 0xCu);

    }
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    objc_msgSend(v9, "allKeys");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v31, v41, 16);
    if (v13)
    {
      v14 = v13;
      v27 = v8;
      v28 = a1;
      v15 = 0;
      v16 = *(_QWORD *)v32;
      v29 = 1;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v32 != v16)
            objc_enumerationMutation(v12);
          v18 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * i);
          v19 = v9;
          objc_msgSend(v9, "objectForKeyedSubscript:", v18, v27);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          _HKInitializeLogging();
          v21 = *MEMORY[0x1E0CB5370];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134218498;
            v36 = v15 + i + 1;
            v37 = 2114;
            v38 = v20;
            v39 = 2114;
            v40 = v18;
            _os_log_impl(&dword_1B7802000, v21, OS_LOG_TYPE_DEFAULT, "     %2ld: Partial error: %{public}@, ID: %{public}@", buf, 0x20u);
          }
          if ((v4[2](v4, v20) & 1) == 0)
          {
            objc_msgSend(v30, "setObject:forKeyedSubscript:", v20, v18);
            v29 = 0;
          }

          v9 = v19;
        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v31, v41, 16);
        v15 += i;
      }
      while (v14);

      if ((v29 & 1) != 0)
      {
        v22 = 0;
LABEL_24:

        goto LABEL_25;
      }
      objc_msgSend(v28, "userInfo");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)objc_msgSend(v23, "mutableCopy");

      objc_msgSend(v12, "setObject:forKeyedSubscript:", v30, v27);
      v24 = objc_alloc(MEMORY[0x1E0CB35C8]);
      objc_msgSend(v28, "domain");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = (id)objc_msgSend(v24, "initWithDomain:code:userInfo:", v25, objc_msgSend(v28, "code"), v12);

    }
    else
    {
      v22 = 0;
    }

    goto LABEL_24;
  }
  if ((v4[2](v4, a1) & 1) != 0)
    v22 = 0;
  else
LABEL_20:
    v22 = a1;
LABEL_25:

  return v22;
}

- (uint64_t)hd_isCorruptionError
{
  id v1;
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;

  v1 = a1;
  if (!v1)
    return 0;
  v2 = v1;
  v3 = *MEMORY[0x1E0CB3388];
  while ((objc_msgSend(v2, "hk_isHealthKitErrorWithCode:", 106) & 1) == 0
       && (objc_msgSend(v2, "hd_isDatabaseCorruptionError") & 1) == 0
       && (objc_msgSend(v2, "hd_isNotADatabaseError") & 1) == 0)
  {
    objc_msgSend(v2, "userInfo");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", v3);
    v5 = objc_claimAutoreleasedReturnValue();

    v2 = (void *)v5;
    if (!v5)
    {
      v6 = 0;
      goto LABEL_9;
    }
  }
  v6 = 1;
LABEL_9:

  return v6;
}

- (id)hd_errorSurfacingFatalCloudKitPartialFailure
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0C947D8];
  if (objc_msgSend(a1, "hk_isErrorInDomain:code:", *MEMORY[0x1E0C947D8], 2))
  {
    objc_msgSend(a1, "userInfo");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0C94940]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    objc_msgSend(v4, "allValues", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v15;
      while (2)
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(_QWORD *)v15 != v7)
            objc_enumerationMutation(v5);
          v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
          if (objc_msgSend(v9, "code") != 11 && objc_msgSend(v9, "code") != 22)
          {
            v6 = v9;
            goto LABEL_17;
          }
        }
        v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        if (v6)
          continue;
        break;
      }
    }
LABEL_17:

    return v6;
  }
  else if (objc_msgSend(a1, "hk_isInternalFailureError")
         && (objc_msgSend(a1, "hk_underlyingErrorWithDomain:", v2),
             (v10 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    v11 = v10;
    objc_msgSend(v10, "hd_errorSurfacingFatalCloudKitPartialFailure");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    return v12;
  }
  else
  {
    return a1;
  }
}

- (id)hd_errorSurfacingFatalCloudKitPartialFailureForAnalytics
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0C947D8];
  if (objc_msgSend(a1, "hk_isErrorInDomain:code:", *MEMORY[0x1E0C947D8], 2))
  {
    objc_msgSend(a1, "userInfo");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0C94940]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    objc_msgSend(v4, "allValues", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v15;
      while (2)
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(_QWORD *)v15 != v7)
            objc_enumerationMutation(v5);
          v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
          if (objc_msgSend(v9, "code") != 22)
          {
            v6 = v9;
            goto LABEL_16;
          }
        }
        v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        if (v6)
          continue;
        break;
      }
    }
LABEL_16:

    return v6;
  }
  else if (objc_msgSend(a1, "hk_isInternalFailureError")
         && (objc_msgSend(a1, "hk_underlyingErrorWithDomain:", v2),
             (v10 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    v11 = v10;
    objc_msgSend(v10, "hd_errorSurfacingFatalCloudKitPartialFailureForAnalytics");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    return v12;
  }
  else
  {
    return a1;
  }
}

- (id)hd_errorForAnalytics
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  int v25;
  void *v26;
  uint64_t v27;
  int v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v34;
  _QWORD v35[2];

  v35[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x1E0CB4E18]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v3)
  {
    v16 = *MEMORY[0x1E0CB3388];
    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CB3388]);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v17)
    {
      v15 = a1;
      goto LABEL_25;
    }
    if (objc_msgSend(a1, "hk_isInternalFailureError"))
      v18 = v17;
    else
      v18 = a1;
    v19 = v18;
    objc_msgSend(v19, "userInfo");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "objectForKeyedSubscript:", v16);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21)
    {
      objc_msgSend(v19, "domain");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v22, "isEqualToString:", *MEMORY[0x1E0CB28A8]))
      {
        if (objc_msgSend(v19, "code") == 256)
        {

LABEL_20:
          v23 = v21;
          goto LABEL_23;
        }
        v32 = objc_msgSend(v19, "code");

        if (v32 == 512)
          goto LABEL_20;
      }
      else
      {

      }
      objc_msgSend(v19, "domain");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v24, "isEqualToString:", *MEMORY[0x1E0C947D8]);

      if (v25)
      {
        objc_msgSend(v19, "hd_errorSurfacingFatalCloudKitPartialFailure");
        v23 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_msgSend(a1, "domain");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v26, "isEqualToString:", *MEMORY[0x1E0D297C0]))
        {
          v27 = objc_msgSend(a1, "code");

          if (v27 == 2)
          {
            v28 = objc_msgSend(a1, "hd_sqliteExtendedErrorCode");
            v29 = (void *)MEMORY[0x1E0CB35C8];
            objc_msgSend(v21, "domain");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "userInfo");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "errorWithDomain:code:userInfo:", v30, v28, v31);
            v15 = (id)objc_claimAutoreleasedReturnValue();

LABEL_24:
            goto LABEL_25;
          }
        }
        else
        {

        }
        v23 = a1;
      }
    }
    else
    {
      v23 = v19;
    }
LABEL_23:
    v15 = v23;
    goto LABEL_24;
  }
  objc_msgSend(v4, "hk_filter:", &__block_literal_global_196_0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_alloc(MEMORY[0x1E0CB35C8]);
  objc_msgSend(a1, "domain");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithDomain:code:userInfo:", v8, objc_msgSend(a1, "code"), v6);
  objc_msgSend(v9, "hd_errorForAnalytics");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v10, "localizedDescription");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringWithFormat:", CFSTR("%@: %@"), v3, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v34 = *MEMORY[0x1E0CB2D50];
  v35[0] = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v35, &v34, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "hk_errorByAddingEntriesToUserInfo:", v14);
  v15 = (id)objc_claimAutoreleasedReturnValue();

LABEL_25:
  return v15;
}

- (void)hd_enumerateCloudKitPartialErrorsWithHandler:()HealthDaemon
{
  void (**v4)(id, uint64_t, char *);
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  char v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(a1, "domain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0C947D8]);

  if (v6)
  {
    if (objc_msgSend(a1, "code") == 2)
    {
      objc_msgSend(a1, "userInfo");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0C94940]);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      v17 = 0u;
      v18 = 0u;
      v15 = 0u;
      v16 = 0u;
      objc_msgSend(v8, "allValues", 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v16;
LABEL_5:
        v13 = 0;
        while (1)
        {
          if (*(_QWORD *)v16 != v12)
            objc_enumerationMutation(v9);
          v14 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v13);
          v19 = 0;
          v4[2](v4, v14, &v19);
          if (v19)
            break;
          if (v11 == ++v13)
          {
            v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
            if (v11)
              goto LABEL_5;
            break;
          }
        }
      }

    }
    else
    {
      v19 = 0;
      v4[2](v4, (uint64_t)a1, &v19);
    }
  }

}

- (void)hd_enumerateCloudKitPartialErrorsByKeyWithHandler:()HealthDaemon
{
  void (**v4)(id, uint64_t, void *, char *);
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  char v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(a1, "domain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0C947D8]);

  if (v6)
  {
    if (objc_msgSend(a1, "code") == 2)
    {
      objc_msgSend(a1, "userInfo");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0C94940]);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      v18 = 0u;
      v19 = 0u;
      v16 = 0u;
      v17 = 0u;
      objc_msgSend(v8, "allKeys", 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v17;
LABEL_5:
        v13 = 0;
        while (1)
        {
          if (*(_QWORD *)v17 != v12)
            objc_enumerationMutation(v9);
          v14 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v13);
          v20 = 0;
          objc_msgSend(v8, "objectForKeyedSubscript:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v4[2](v4, v14, v15, &v20);

          if (v20)
            break;
          if (v11 == ++v13)
          {
            v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
            if (v11)
              goto LABEL_5;
            break;
          }
        }
      }

    }
    else
    {
      v20 = 0;
      v4[2](v4, 0, a1, &v20);
    }
  }

}

- (double)hd_cloudKitRetryDelay
{
  void *v2;
  uint64_t v3;
  int v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  double v19;
  double v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "domain");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *MEMORY[0x1E0C947D8];
  v4 = objc_msgSend(v2, "isEqualToString:", *MEMORY[0x1E0C947D8]);

  if (v4
    && (objc_msgSend(a1, "userInfo"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0C94808]),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v5,
        v6))
  {
    objc_msgSend(v6, "doubleValue");
    v8 = v7;

  }
  else
  {
    v9 = objc_msgSend(a1, "hk_isErrorInDomain:code:", v3, 2);
    objc_msgSend(a1, "userInfo");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v9)
    {
      objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x1E0C94940]);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      v24 = 0u;
      v25 = 0u;
      v22 = 0u;
      v23 = 0u;
      objc_msgSend(v12, "allValues", 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      if (v14)
      {
        v15 = v14;
        v16 = *(_QWORD *)v23;
        v8 = 0.0;
        do
        {
          for (i = 0; i != v15; ++i)
          {
            if (*(_QWORD *)v23 != v16)
              objc_enumerationMutation(v13);
            v18 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
            if (objc_msgSend(v18, "code") != 11 && objc_msgSend(v18, "code") != 22)
            {
              objc_msgSend(v18, "hd_cloudKitRetryDelay");
              if (v8 < v19)
                v8 = v19;
            }
          }
          v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
        }
        while (v15);
      }
      else
      {
        v8 = 0.0;
      }

    }
    else
    {
      objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x1E0CB3388]);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
      {
        objc_msgSend(v12, "hd_cloudKitRetryDelay");
        v8 = v20;
      }
      else
      {
        v8 = 0.0;
      }
    }

  }
  return v8;
}

@end
