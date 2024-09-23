@implementation NSError(HomeKitCKError)

- (id)hmd_actualCKErrorFromCKErrorPartialFailure:()HomeKitCKError
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  if (!objc_msgSend(a1, "hmd_isCKError"))
    goto LABEL_4;
  if (objc_msgSend(a1, "code") != 2)
    goto LABEL_4;
  objc_msgSend(a1, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", *MEMORY[0x24BDB8EE8]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v4);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (!v7)
LABEL_4:
    v7 = a1;

  return v7;
}

- (id)hmd_conciseCKError
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  if ((objc_msgSend(a1, "hmd_isCKError") & 1) == 0)
    return a1;
  objc_msgSend(a1, "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "mutableCopy");

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend(a1, "userInfo", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
        if ((objc_msgSend((id)ckErrorUserInfoKeys, "containsObject:", v10) & 1) == 0)
          objc_msgSend(v3, "removeObjectForKey:", v10);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v7);
  }

  v11 = (void *)MEMORY[0x24BDD1540];
  objc_msgSend(a1, "domain");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(a1, "code");
  v14 = (void *)objc_msgSend(v3, "copy");
  objc_msgSend(v11, "errorWithDomain:code:userInfo:", v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)hmd_hmErrorFromCKError
{
  uint64_t v2;
  uint64_t v3;

  if ((objc_msgSend(a1, "hmd_isCKError") & 1) == 0)
    return a1;
  v2 = objc_msgSend(a1, "code");
  if ((unint64_t)(v2 - 3) < 2)
    goto LABEL_5;
  if (v2 == 9)
  {
    v3 = 1010;
  }
  else
  {
    if (v2 == 23)
    {
LABEL_5:
      v3 = 78;
      goto LABEL_9;
    }
    v3 = 52;
  }
LABEL_9:
  objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:description:reason:suggestion:underlyingError:", v3, 0, 0, 0, a1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (uint64_t)hmd_isCKError
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "domain");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "isEqualToString:", *MEMORY[0x24BDB8EA8]);

  return v2;
}

- (uint64_t)hmd_isUnderlyingCKError
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "domain");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "isEqualToString:", *MEMORY[0x24BDB8FB8]);

  return v2;
}

- (uint64_t)hmd_isNonRecoverableCKError
{
  uint64_t result;
  unint64_t v3;

  result = objc_msgSend(a1, "hmd_isCKError");
  if ((_DWORD)result)
  {
    v3 = objc_msgSend(a1, "code");
    result = 1;
    if (v3 > 0x12 || ((1 << v3) & 0x4932A) == 0)
      return v3 == 131;
  }
  return result;
}

- (id)hmd_convertedCKError
{
  id v2;
  void *v3;
  void *v4;

  if (objc_msgSend(a1, "hmd_isCKError"))
  {
    v2 = a1;
  }
  else
  {
    objc_msgSend(a1, "userInfo");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKey:", *MEMORY[0x24BDD1398]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4 && objc_msgSend(v4, "hmd_isCKError"))
      v2 = v4;
    else
      v2 = 0;

  }
  return v2;
}

- (id)hmd_retryAfterCKError
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  if ((objc_msgSend(a1, "hmd_isCKError") & 1) != 0 || (objc_msgSend(a1, "hmd_isUnderlyingCKError") & 1) != 0)
  {
    if (objc_msgSend(a1, "code") == 2)
    {
      objc_msgSend(a1, "userInfo");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x24BDB8EE8]);
      v3 = (void *)objc_claimAutoreleasedReturnValue();

      v19 = 0u;
      v20 = 0u;
      v17 = 0u;
      v18 = 0u;
      objc_msgSend(v3, "allValues", 0);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v5)
      {
        v6 = v5;
        v7 = *(_QWORD *)v18;
        while (2)
        {
          v8 = 0;
          do
          {
            if (*(_QWORD *)v18 != v7)
              objc_enumerationMutation(v4);
            objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v8), "hmd_retryAfterCKError");
            v9 = objc_claimAutoreleasedReturnValue();
            if (v9)
            {
              v15 = (void *)v9;

              return v15;
            }
            ++v8;
          }
          while (v6 != v8);
          v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
          if (v6)
            continue;
          break;
        }
      }

    }
    objc_msgSend(a1, "userInfo");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "hmf_numberForKey:", *MEMORY[0x24BDB8EB8]);
    v11 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(a1, "userInfo");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x24BDD1398]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v14 = v13;
    else
      v14 = 0;
    v10 = v14;

    if (!v10)
    {
      v15 = 0;
      goto LABEL_20;
    }
    objc_msgSend(v10, "hmd_retryAfterCKError");
    v11 = objc_claimAutoreleasedReturnValue();
  }
  v15 = (void *)v11;
LABEL_20:

  return v15;
}

- (uint64_t)hmd_isRecordConflictCKError
{
  uint64_t result;
  uint64_t v3;

  result = objc_msgSend(a1, "hmd_isCKError");
  if ((_DWORD)result)
  {
    v3 = objc_msgSend(a1, "code");
    return v3 == 14 || v3 == 11;
  }
  return result;
}

@end
