@implementation IDSAccount(HMDAccounts)

- (id)hmd_handles
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  void *v12;
  HMDAccountHandle *v13;
  void *v14;
  HMDAccountHandle *v15;
  void *v16;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "handles");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v2, "count"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v3 = v2;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v20;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v20 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v7);
        if (!a1 || !v8)
          goto LABEL_11;
        v9 = __shouldFilterHandle_onceToken;
        v10 = v8;
        if (v9 != -1)
          dispatch_once(&__shouldFilterHandle_onceToken, &__block_literal_global_1796);
        v11 = __shouldFilterHandle_blacklistedURIs;
        objc_msgSend(v10, "URI");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v11) = objc_msgSend((id)v11, "containsObject:", v12);

        if ((v11 & 1) == 0)
        {
LABEL_11:
          if (objc_msgSend(v8, "validationStatus") >= 3)
          {
            v13 = [HMDAccountHandle alloc];
            objc_msgSend(v8, "URI");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = -[HMDAccountHandle initWithURI:local:](v13, "initWithURI:local:", v14, objc_msgSend(v8, "isUserVisible") ^ 1);

            if (v15)
              objc_msgSend(v18, "addObject:", v15);

          }
        }
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v5);
  }

  v16 = (void *)objc_msgSend(v18, "copy");
  return v16;
}

@end
