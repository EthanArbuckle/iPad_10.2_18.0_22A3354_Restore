@implementation ACAccountStore(AppleID)

- (id)accountsWithAccountType:()AppleID appleID:
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v22;
  id obj;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v22 = v6;
  objc_msgSend(a1, "accountsWithAccountType:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v7)
  {
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v10)
    {
      v11 = v10;
      v12 = 0;
      v13 = *(_QWORD *)v25;
      obj = v9;
      while (1)
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v25 != v13)
            objc_enumerationMutation(obj);
          v15 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
          objc_msgSend(v15, "username");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v7, "caseInsensitiveCompare:", v16))
          {
            objc_msgSend(v15, "accountProperties");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("originalUsername"));
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = objc_msgSend(v7, "caseInsensitiveCompare:", v18);

            if (v19)
              continue;
            if (v12)
            {
LABEL_10:
              objc_msgSend(v12, "arrayByAddingObject:", v15);
              v20 = objc_claimAutoreleasedReturnValue();

              v12 = (void *)v20;
              continue;
            }
          }
          else
          {

            if (v12)
              goto LABEL_10;
          }
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v15);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
        }
        v9 = obj;
        v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
        if (!v11)
          goto LABEL_17;
      }
    }
  }
  v12 = 0;
LABEL_17:

  return v12;
}

- (id)accountWithAppleID:()AppleID
{
  id v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  char v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(a1, "accountTypeWithAccountTypeIdentifier:", *MEMORY[0x1E0C8F030]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "accountsWithAccountType:", v5);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v10, "username", (_QWORD)v14);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isEqualToString:", v4);

        if ((v12 & 1) != 0)
        {
          v7 = v10;
          goto LABEL_11;
        }
      }
      v7 = (id)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_11:

  return v7;
}

@end
