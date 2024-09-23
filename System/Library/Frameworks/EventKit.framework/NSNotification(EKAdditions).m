@implementation NSNotification(EKAdditions)

- (uint64_t)cal_changeMayAffectAnyObjectOfType:()EKAdditions
{
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("EKEventStoreChangedObjectIDsUserInfoKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v6 = v5;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v14;
      while (2)
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v14 != v9)
            objc_enumerationMutation(v6);
          if (objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v10), "entityType", (_QWORD)v13) == a3)
          {
            v11 = 1;
            goto LABEL_12;
          }
          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        if (v8)
          continue;
        break;
      }
    }
    v11 = 0;
LABEL_12:

  }
  else
  {
    v11 = 1;
  }

  return v11;
}

- (uint64_t)cal_changeMayAffectCalendarsOrSources
{
  void *v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  uint64_t v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "userInfo");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("EKEventStoreChangedObjectIDsUserInfoKey"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v3 = v2;
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v13;
      while (2)
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v13 != v6)
            objc_enumerationMutation(v3);
          v8 = objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "entityType", (_QWORD)v12);
          if (v8 == 1 || v8 == 6)
          {
            v10 = 1;
            goto LABEL_17;
          }
        }
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        v10 = 0;
        if (v5)
          continue;
        break;
      }
    }
    else
    {
      v10 = 0;
    }
LABEL_17:

  }
  else
  {
    v10 = 1;
  }

  return v10;
}

@end
