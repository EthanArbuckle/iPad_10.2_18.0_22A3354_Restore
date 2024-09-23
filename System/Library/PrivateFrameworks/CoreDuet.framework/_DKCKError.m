@implementation _DKCKError

+ (uint64_t)isIgnorableError:(uint64_t)a1
{
  id v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  char v8;
  uint64_t v9;

  v2 = a2;
  v3 = objc_opt_self();
  if (!+[_DKCKError isOperationCancelledError:](v3, v2))
    goto LABEL_9;
  objc_msgSend(v2, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CB3388]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "domain");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0C947D8]))
  {
    v7 = objc_msgSend(v5, "code");

    if (v7 == 130 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
      +[_DKCKError isIgnorableError:].cold.1();
  }
  else
  {

  }
  v8 = +[_DKCKError isShouldDeferError:](v3, v2);

  if ((v8 & 1) != 0)
    v9 = 1;
  else
LABEL_9:
    v9 = 0;

  return v9;
}

+ (uint64_t)isOperationCancelledError:(uint64_t)a1
{
  id v2;
  void *v3;
  uint64_t v4;

  v2 = a2;
  objc_opt_self();
  if (objc_msgSend(v2, "code") == 20)
  {
    objc_msgSend(v2, "domain");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0C947D8]);

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (uint64_t)isShouldDeferError:(uint64_t)a1
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v2 = a2;
  v3 = objc_opt_self();
  v4 = objc_msgSend(v2, "code");
  if (+[_DKCKError isOperationCancelledError:](v3, v2))
  {
    objc_msgSend(v2, "userInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0CB3388]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v6, "code") == 131)
    {
      objc_msgSend(v6, "domain");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0C947D8]);

    }
    else
    {
      v8 = 0;
    }
  }
  else
  {
    if (v4 != 131)
    {
      v8 = 0;
      goto LABEL_9;
    }
    objc_msgSend(v2, "domain");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0C947D8]);
  }

LABEL_9:
  return v8;
}

+ (uint64_t)isChangeTokenExpiredError:(uint64_t)a1
{
  id v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = objc_opt_self();
  if (+[_DKCKError isPartialError:](v3, v2))
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    +[_DKCKError _allPartialErrorsFromError:](v3, v2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v12;
      while (2)
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v12 != v7)
            objc_enumerationMutation(v4);
          if ((+[_DKCKError isChangeTokenExpiredError:](v3, *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v8)) & 1) != 0)
          {
            v9 = 1;
            goto LABEL_15;
          }
          ++v8;
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
        if (v6)
          continue;
        break;
      }
    }

  }
  if (objc_msgSend(v2, "code", (_QWORD)v11) == 21)
  {
    objc_msgSend(v2, "domain");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0C947D8]);
LABEL_15:

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (uint64_t)isPartialError:(uint64_t)a1
{
  id v2;
  void *v3;
  uint64_t v4;

  v2 = a2;
  objc_opt_self();
  if (objc_msgSend(v2, "code") == 2)
  {
    objc_msgSend(v2, "domain");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0C947D8]);

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)_allPartialErrorsFromError:(uint64_t)a1
{
  id v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = a2;
  objc_opt_self();
  objc_msgSend(v2, "userInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E0C94940]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (uint64_t)isUnrecoverableDecryptionError:(uint64_t)a1
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  char v11;
  uint64_t v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = objc_opt_self();
  v4 = objc_msgSend(v2, "code");
  if (+[_DKCKError isPartialError:](v3, v2))
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    +[_DKCKError _allPartialErrorsFromError:](v3, v2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v15;
      while (2)
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v15 != v8)
            objc_enumerationMutation(v5);
          if ((+[_DKCKError isUnrecoverableDecryptionError:](v3, *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v9)) & 1) != 0)
          {

            goto LABEL_15;
          }
          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        if (v7)
          continue;
        break;
      }
    }

  }
  else if (v4 == 112)
  {
    objc_msgSend(v2, "domain");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isEqualToString:", *MEMORY[0x1E0C947D8]);

    if ((v11 & 1) != 0)
    {
LABEL_15:
      v12 = 1;
      goto LABEL_16;
    }
  }
  v12 = 0;
LABEL_16:

  return v12;
}

+ (id)zoneIDsWithUnrecoverableDecryptionError:(uint64_t)a1
{
  id v2;
  uint64_t v3;
  void *v4;

  v2 = a2;
  v3 = objc_opt_self();
  v4 = (void *)objc_opt_new();
  +[_DKCKError _populateZoneIDs:fromUnrecoverableDecryptionError:itemID:](v3, v4, v2, 0);

  return v4;
}

+ (void)_populateZoneIDs:(void *)a3 fromUnrecoverableDecryptionError:(void *)a4 itemID:
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  uint64_t v34;
  __int16 v35;
  id v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a3;
  v8 = a4;
  v9 = objc_opt_self();
  if (+[_DKCKError isPartialError:](v9, v7))
  {
    v24 = v8;
    objc_msgSend(v7, "userInfo");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKey:", *MEMORY[0x1E0C94940]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v25, v37, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v26;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v26 != v14)
            objc_enumerationMutation(v11);
          v16 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i);
          objc_msgSend(v11, "objectForKeyedSubscript:", v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          +[_DKCKError _populateZoneIDs:fromUnrecoverableDecryptionError:itemID:](v9, v6, v17, v16);

        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v25, v37, 16);
      }
      while (v13);
    }

    v8 = v24;
  }
  else if (objc_msgSend(v7, "code") == 112)
  {
    objc_msgSend(v7, "domain");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "isEqualToString:", *MEMORY[0x1E0C947D8]);

    if (v19)
    {
      if (v8)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v8, "zoneID");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "addObject:", v20);

          goto LABEL_22;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v6, "addObject:", v8);
          goto LABEL_22;
        }
        +[_CDLogging syncChannel](_CDLogging, "syncChannel");
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          +[_DKCKError _populateZoneIDs:fromUnrecoverableDecryptionError:itemID:].cold.1(v9, v7, v21);
      }
      else
      {
        +[_CDLogging syncChannel](_CDLogging, "syncChannel");
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
        {
          objc_msgSend((id)objc_opt_class(), "description");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "domain");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544130;
          v30 = v22;
          v31 = 2114;
          v32 = v23;
          v33 = 2048;
          v34 = objc_msgSend(v7, "code");
          v35 = 2112;
          v36 = v7;
          _os_log_impl(&dword_18DDBE000, v21, OS_LOG_TYPE_INFO, "%{public}@: Missing zone id for Manatee identity failure: %{public}@:%lld (%@)", buf, 0x2Au);

        }
      }

    }
  }
LABEL_22:

}

+ (id)errorMinusUnrecoverableDecryptionErrorsFromPartialError:(uint64_t)a1
{
  id v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = objc_opt_self();
  if (+[_DKCKError isPartialError:](v3, v2))
  {
    objc_msgSend(v2, "userInfo");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = *MEMORY[0x1E0C94940];
    objc_msgSend(v4, "objectForKeyedSubscript:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_opt_new();
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v7 = v5;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v22 != v10)
            objc_enumerationMutation(v7);
          v12 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i);
          objc_msgSend(v7, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if ((+[_DKCKError isUnrecoverableDecryptionError:](v3, v13) & 1) == 0)
            objc_msgSend(v6, "setObject:forKeyedSubscript:", v13, v12);

        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v9);
    }

    if (objc_msgSend(v6, "count"))
    {
      v14 = (void *)objc_msgSend(v4, "mutableCopy");
      v15 = (void *)objc_msgSend(v6, "copy");
      objc_msgSend(v14, "setObject:forKeyedSubscript:", v15, v20);

      v16 = (void *)MEMORY[0x1E0CB35C8];
      objc_msgSend(v2, "domain");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "errorWithDomain:code:userInfo:", v17, objc_msgSend(v2, "code"), v14);
      v18 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v18 = 0;
    }

  }
  else
  {
    v18 = v2;
  }

  return v18;
}

+ (void)isIgnorableError:.cold.1()
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_fault_impl(&dword_18DDBE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Unexpected xpc_activity state.", v0, 2u);
}

+ (void)_populateZoneIDs:(uint64_t)a1 fromUnrecoverableDecryptionError:(void *)a2 itemID:(NSObject *)a3 .cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  void *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  void *v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)objc_opt_class(), "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "domain");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138544130;
  v8 = v5;
  v9 = 2114;
  v10 = v6;
  v11 = 2048;
  v12 = objc_msgSend(a2, "code");
  v13 = 2112;
  v14 = a2;
  _os_log_error_impl(&dword_18DDBE000, a3, OS_LOG_TYPE_ERROR, "%{public}@: Unexpected error itemID key: %{public}@:%lld (%@)", (uint8_t *)&v7, 0x2Au);

}

@end
