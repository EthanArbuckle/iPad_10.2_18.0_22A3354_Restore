@implementation ACAccount(DigitalSeparation)

- (id)ds_accountEmails
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v24;
  uint64_t v25;
  id obj;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "aa_primaryEmail");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(a1, "aa_primaryEmail");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "addObject:", v4);

  }
  objc_msgSend(a1, "username");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(a1, "username");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "addObject:", v6);

  }
  objc_msgSend(a1, "accountType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", *MEMORY[0x24BDB4000]);

  if (v9)
  {
    objc_msgSend(a1, "accountProperties");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("CalDAVPrincipals"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    obj = v11;
    v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    if (v25)
    {
      v24 = *(_QWORD *)v32;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v32 != v24)
            objc_enumerationMutation(obj);
          objc_msgSend(obj, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * v12));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("PreferredCalendarUserAddresses"));
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          v29 = 0u;
          v30 = 0u;
          v27 = 0u;
          v28 = 0u;
          v15 = v14;
          v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
          if (v16)
          {
            v17 = v16;
            v18 = *(_QWORD *)v28;
            do
            {
              v19 = 0;
              do
              {
                if (*(_QWORD *)v28 != v18)
                  objc_enumerationMutation(v15);
                objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * v19), "objectForKeyedSubscript:", CFSTR("packedCalendarUserAddressAddress"));
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend(v20, "hasPrefix:", CFSTR("mailto:")))
                {
                  objc_msgSend(v20, "substringFromIndex:", objc_msgSend(CFSTR("mailto:"), "length"));
                  v21 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v2, "addObject:", v21);

                }
                else
                {
                  objc_msgSend(v2, "addObject:", v20);
                }

                ++v19;
              }
              while (v17 != v19);
              v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
            }
            while (v17);
          }

          ++v12;
        }
        while (v12 != v25);
        v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
      }
      while (v25);
    }

  }
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithSet:", v2);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

@end
