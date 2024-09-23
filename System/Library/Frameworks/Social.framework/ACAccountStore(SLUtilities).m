@implementation ACAccountStore(SLUtilities)

+ (uint64_t)SLDuplicateAccountExistsForAccount:()SLUtilities withTypeIdentifier:andAccountPropertyIDKey:
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  void *v22;
  void *v23;
  id v24;
  id obj;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = (void *)objc_opt_new();
  objc_msgSend(v10, "accountTypeWithAccountTypeIdentifier:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "accountsWithAccountType:", v11);
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v12)
  {
    v22 = v11;
    v23 = v10;
    v24 = v8;
    v13 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v27 != v13)
          objc_enumerationMutation(obj);
        v15 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        objc_msgSend(v15, "accountPropertyForKey:", v9, v22, v23, v24);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "accountPropertyForKey:", v9);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "identifier");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "identifier");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v18, "isEqualToString:", v19) & 1) != 0 || !v16)
        {

        }
        else
        {
          v20 = objc_msgSend(v16, "isEqualToString:", v17);

          if ((v20 & 1) != 0)
          {

            v12 = 1;
            goto LABEL_13;
          }
        }

      }
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v12);
LABEL_13:
    v10 = v23;
    v8 = v24;
    v11 = v22;
  }

  return v12;
}

@end
