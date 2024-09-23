@implementation NSError(FCCKAdditions)

- (uint64_t)fc_isCKErrorWithCode:()FCCKAdditions
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __47__NSError_FCCKAdditions__fc_isCKErrorWithCode___block_invoke;
  v4[3] = &__block_descriptor_40_e8_B16__0q8l;
  v4[4] = a3;
  return objc_msgSend(a1, "fc_isCKErrorWithCodePassingTest:", v4);
}

- (uint64_t)fc_isCKErrorWithCodePassingTest:()FCCKAdditions
{
  unsigned int (**v4)(id, uint64_t);
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(a1, "domain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0C947D8]);

  if ((_DWORD)v6)
  {
    if ((((uint64_t (*)(id, uint64_t))v4[2])(v4, objc_msgSend(a1, "code")) & 1) != 0)
    {
      v6 = 1;
    }
    else if (objc_msgSend(a1, "code") == 2)
    {
      objc_msgSend(a1, "userInfo");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKey:", *MEMORY[0x1E0C94940]);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      v15 = 0u;
      v16 = 0u;
      v13 = 0u;
      v14 = 0u;
      objc_msgSend(v8, "allValues", 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
      {
        v10 = *(_QWORD *)v14;
        while (2)
        {
          v11 = 0;
          do
          {
            if (*(_QWORD *)v14 != v10)
              objc_enumerationMutation(v9);
            if (!v4[2](v4, objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v11), "code")))
            {
              v6 = 0;
              goto LABEL_16;
            }
            ++v11;
          }
          while (v6 != v11);
          v6 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
          if (v6)
            continue;
          break;
        }
        v6 = 1;
      }
LABEL_16:

    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

- (uint64_t)fc_isCKUnknownItemError
{
  return objc_msgSend(a1, "fc_isCKErrorWithCode:", 11);
}

- (uint64_t)fc_isMissingZoneError
{
  if ((objc_msgSend(a1, "fc_isCKErrorWithCode:", 26) & 1) != 0)
    return 1;
  else
    return objc_msgSend(a1, "fc_isCKErrorWithCode:", 28);
}

- (uint64_t)fc_isTemporaryNetworkOrServerError
{
  return objc_msgSend(a1, "fc_hasCKErrorWithCodePassingTest:", &__block_literal_global_12);
}

- (uint64_t)fc_hasIdentityStillSyncingError
{
  return objc_msgSend(a1, "fc_hasCKErrorWithCodePassingTest:", &__block_literal_global_1);
}

- (uint64_t)fc_hasIdentityLostError
{
  return objc_msgSend(a1, "fc_hasCKErrorWithCodePassingTest:", &__block_literal_global_2);
}

- (uint64_t)fc_hasXPCInterruptedOrInvalidError
{
  return objc_msgSend(a1, "fc_hasUnderlyingErrorPassingTest:", &__block_literal_global_4_0);
}

- (uint64_t)fc_hasCKErrorWithCodePassingTest:()FCCKAdditions
{
  uint64_t (**v4)(id, uint64_t);
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t i;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(a1, "domain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0C947D8]);

  if ((_DWORD)v6)
  {
    if ((v4[2](v4, objc_msgSend(a1, "code")) & 1) != 0)
    {
      v6 = 1;
    }
    else if (objc_msgSend(a1, "code") == 2)
    {
      objc_msgSend(a1, "userInfo");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKey:", *MEMORY[0x1E0C94940]);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      v15 = 0u;
      v16 = 0u;
      v13 = 0u;
      v14 = 0u;
      objc_msgSend(v8, "allValues", 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
      {
        v10 = *(_QWORD *)v14;
        while (2)
        {
          for (i = 0; i != v6; ++i)
          {
            if (*(_QWORD *)v14 != v10)
              objc_enumerationMutation(v9);
            if ((v4[2](v4, objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "code")) & 1) != 0)
            {
              v6 = 1;
              goto LABEL_16;
            }
          }
          v6 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
          if (v6)
            continue;
          break;
        }
      }
LABEL_16:

    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

- (id)fc_underlyingCKErrorUserInfoValueForKey:()FCCKAdditions forItemID:
{
  id v6;
  id v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v6 = a3;
  v7 = a4;
  objc_msgSend(a1, "domain");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0C947D8]);

  if (!v9)
    goto LABEL_5;
  objc_msgSend(a1, "userInfo");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKey:", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    if (objc_msgSend(a1, "code") == 2)
    {
      objc_msgSend(a1, "userInfo");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectForKey:", *MEMORY[0x1E0C94940]);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v13, "objectForKey:", v7);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "userInfo");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "objectForKey:", v6);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_6;
    }
LABEL_5:
    v11 = 0;
  }
LABEL_6:

  return v11;
}

@end
