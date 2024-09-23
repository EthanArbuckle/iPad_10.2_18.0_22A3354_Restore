@implementation NSError(Accounts)

- (uint64_t)ac_isUnrecoverableDatabaseError
{
  void *v2;
  uint64_t v3;
  int v4;
  _QWORD *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;

  objc_msgSend(a1, "domain");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *MEMORY[0x1E0C979C8];
  v4 = objc_msgSend(v2, "isEqualToString:", *MEMORY[0x1E0C979C8]);

  v5 = (_QWORD *)MEMORY[0x1E0CB28A8];
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(a1, "code"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
LABEL_8:
      v12 = 0;
      goto LABEL_11;
    }
  }
  else
  {
    objc_msgSend(a1, "domain");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v6, "isEqualToString:", *v5))
    {
      v12 = 0;
      goto LABEL_10;
    }
    objc_msgSend(a1, "userInfo");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", v3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
      goto LABEL_8;
    v9 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(a1, "userInfo");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", v3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "numberWithInteger:", objc_msgSend(v11, "integerValue"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
      goto LABEL_8;
  }
  v12 = objc_msgSend(&unk_1E48A1950, "containsObject:", v6);
LABEL_10:

LABEL_11:
  objc_msgSend(a1, "domain");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "isEqualToString:", *v5))
  {
    v14 = objc_msgSend(a1, "code");

    if (v14 == 259)
      return 1;
    else
      return v12;
  }
  else
  {

  }
  return v12;
}

- (uint64_t)ac_isDiskFullSQLError
{
  void *v2;
  uint64_t v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;

  objc_msgSend(a1, "domain");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *MEMORY[0x1E0C979C8];
  v4 = objc_msgSend(v2, "isEqualToString:", *MEMORY[0x1E0C979C8]);

  if (!v4)
  {
    objc_msgSend(a1, "domain");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0CB28A8]))
    {
      v11 = 0;
      goto LABEL_10;
    }
    objc_msgSend(a1, "userInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
      return 0;
    v8 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(a1, "userInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", v3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "numberWithInteger:", objc_msgSend(v10, "integerValue"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
      return 0;
LABEL_7:
    v11 = objc_msgSend(&unk_1E48A1968, "containsObject:", v5);
LABEL_10:

    return v11;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(a1, "code"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    goto LABEL_7;
  return 0;
}

- (id)ac_sanitizeObject:()Accounts
{
  id v4;
  id v5;
  void *v6;
  NSObject *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t k;
  uint64_t v23;
  void *v24;
  void *v25;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  _BYTE v40[128];
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((objc_msgSend(v4, "conformsToProtocol:", &unk_1EE6B1DB8) & 1) != 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v4, "ac_secureCodingError");
      v5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_4:
      v6 = v5;
      goto LABEL_41;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = (void *)objc_opt_new();
      v35 = 0u;
      v36 = 0u;
      v37 = 0u;
      v38 = 0u;
      v8 = v4;
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v36;
        do
        {
          for (i = 0; i != v10; ++i)
          {
            if (*(_QWORD *)v36 != v11)
              objc_enumerationMutation(v8);
            objc_msgSend(a1, "ac_sanitizeObject:", *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * i));
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            if (v13)
              objc_msgSend(v6, "addObject:", v13);

          }
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
        }
        while (v10);
      }
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v6 = (void *)objc_opt_new();
        v31 = 0u;
        v32 = 0u;
        v33 = 0u;
        v34 = 0u;
        v8 = v4;
        v14 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v31, v40, 16);
        if (v14)
        {
          v15 = v14;
          v16 = *(_QWORD *)v32;
          do
          {
            for (j = 0; j != v15; ++j)
            {
              if (*(_QWORD *)v32 != v16)
                objc_enumerationMutation(v8);
              objc_msgSend(a1, "ac_sanitizeObject:", *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * j));
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              if (v18)
                objc_msgSend(v6, "addObject:", v18);

            }
            v15 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v31, v40, 16);
          }
          while (v15);
        }
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v5 = v4;
          goto LABEL_4;
        }
        v6 = (void *)objc_opt_new();
        v27 = 0u;
        v28 = 0u;
        v29 = 0u;
        v30 = 0u;
        v8 = v4;
        v19 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v27, v39, 16);
        if (v19)
        {
          v20 = v19;
          v21 = *(_QWORD *)v28;
          do
          {
            for (k = 0; k != v20; ++k)
            {
              if (*(_QWORD *)v28 != v21)
                objc_enumerationMutation(v8);
              v23 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * k);
              objc_msgSend(v8, "objectForKeyedSubscript:", v23, (_QWORD)v27);
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(a1, "ac_sanitizeObject:", v24);
              v25 = (void *)objc_claimAutoreleasedReturnValue();

              if (v25)
                objc_msgSend(v6, "setObject:forKey:", v25, v23);

            }
            v20 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v27, v39, 16);
          }
          while (v20);
        }
      }
    }

    goto LABEL_41;
  }
  _ACLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[NSError(Accounts) ac_sanitizeObject:].cold.1((uint64_t)v4, v7);

  v6 = 0;
LABEL_41:

  return v6;
}

- (id)ac_secureCodingError
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = (void *)MEMORY[0x1E0CB35C8];
  objc_msgSend(a1, "domain");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(a1, "code");
  objc_msgSend(a1, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "ac_sanitizeObject:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "errorWithDomain:code:userInfo:", v3, v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)ac_sanitizeObject:()Accounts .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_1A2BCD000, a2, OS_LOG_TYPE_DEBUG, "\"Removing object %@ error userInfo because it is not NSSecureCoding.\", (uint8_t *)&v2, 0xCu);
}

@end
