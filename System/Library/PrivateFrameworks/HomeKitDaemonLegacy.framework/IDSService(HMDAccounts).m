@implementation IDSService(HMDAccounts)

- (BOOL)hmd_isActive
{
  void *v1;
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a1, "iCloudAccount");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v1, "isActive"))
  {
    objc_msgSend(v1, "loginID");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v2 != 0;

  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (uint64_t)hmd_registrationStatus
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "iCloudAccount");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (int)objc_msgSend(v1, "registrationStatus");

  return v2;
}

- (uint64_t)hmd_registrationError
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "iCloudAccount");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (int)objc_msgSend(v1, "registrationError");

  return v2;
}

- (id)hmd_handles
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  objc_msgSend(a1, "accounts", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v7), "hmd_handles");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "addObjectsFromArray:", v8);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }

  objc_msgSend(v2, "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)hmd_preferredHandle
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  objc_msgSend(a1, "iCloudAccount");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "loginID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    +[HMDAccountHandleFormatter defaultFormatter](HMDAccountHandleFormatter, "defaultFormatter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "accountHandleFromString:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }

  objc_msgSend(a1, "hmd_handles");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");

  if (!objc_msgSend(v7, "containsObject:", v5))
    goto LABEL_6;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __46__IDSService_HMDAccounts__hmd_preferredHandle__block_invoke;
  v10[3] = &unk_1E89B2F20;
  v11 = v5;
  objc_msgSend(v7, "hmf_objectPassingTest:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
LABEL_6:
    objc_msgSend(v7, "sortWithOptions:usingComparator:", 16, &__block_literal_global_94651);
    objc_msgSend(v7, "lastObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

@end
