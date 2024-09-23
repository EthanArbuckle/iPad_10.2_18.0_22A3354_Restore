@implementation NSMutableDictionary(FCAdditions)

- (void)fc_safelySetObject:()FCAdditions forKey:
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v7)
  {
    if (v6)
    {
      objc_msgSend(a1, "setObject:forKey:", v6, v7);
      goto LABEL_10;
    }
LABEL_7:
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("nil value trying to be assigned to %@"), v7);
      *(_DWORD *)buf = 136315906;
      v11 = "-[NSMutableDictionary(FCAdditions) fc_safelySetObject:forKey:]";
      v12 = 2080;
      v13 = "NSDictionary+FCAdditions.m";
      v14 = 1024;
      v15 = 389;
      v16 = 2114;
      v17 = v9;
      _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

      if (!v7)
        goto LABEL_10;
    }
    else if (!v7)
    {
      goto LABEL_10;
    }
    objc_msgSend(a1, "removeObjectForKey:", v7);
    goto LABEL_10;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("nil key trying to be associated with %@"), v6);
    *(_DWORD *)buf = 136315906;
    v11 = "-[NSMutableDictionary(FCAdditions) fc_safelySetObject:forKey:]";
    v12 = 2080;
    v13 = "NSDictionary+FCAdditions.m";
    v14 = 1024;
    v15 = 388;
    v16 = 2114;
    v17 = v8;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  if (!v6)
    goto LABEL_7;
LABEL_10:

}

- (void)fc_removeObjectsForKeysNotInSet:()FCAdditions
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  objc_msgSend(a1, "allKeys", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i);
        if ((objc_msgSend(v4, "containsObject:", v11) & 1) == 0)
          objc_msgSend(a1, "removeObjectForKey:", v11);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }

}

- (void)fc_safelySetObjectAllowingNil:()FCAdditions forKeyAllowingNil:
{
  id v6;
  id v7;

  v7 = a3;
  v6 = a4;
  if (v6)
  {
    if (v7)
      objc_msgSend(a1, "setObject:forKey:", v7, v6);
    else
      objc_msgSend(a1, "removeObjectForKey:", v6);
  }

}

- (void)fc_transformValuesWithKeyAndValueBlock:()FCAdditions
{
  void (**v4)(id, _QWORD, void *);
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  objc_msgSend(a1, "allKeys", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(a1, "objectForKeyedSubscript:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v4[2](v4, v11, v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
          objc_msgSend(a1, "setObject:forKeyedSubscript:", v13, v11);
        else
          objc_msgSend(a1, "removeObjectForKey:", 0);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

}

- (void)fc_safelySetObjectAllowingNil:()FCAdditions forKey:
{
  id v6;
  id v7;
  void *v8;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v7)
  {
    if (v6)
      objc_msgSend(a1, "setObject:forKey:", v6, v7);
    else
      objc_msgSend(a1, "removeObjectForKey:", v7);
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("invalid nil value for '%s'"), "key");
    *(_DWORD *)buf = 136315906;
    v10 = "-[NSMutableDictionary(FCAdditions) fc_safelySetObjectAllowingNil:forKey:]";
    v11 = 2080;
    v12 = "NSDictionary+FCAdditions.m";
    v13 = 1024;
    v14 = 438;
    v15 = 2114;
    v16 = v8;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
}

- (void)fc_removeObjectsForKeysNotInArray:()FCAdditions
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  objc_msgSend(a1, "allKeys", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i);
        if ((objc_msgSend(v4, "containsObject:", v11) & 1) == 0)
          objc_msgSend(a1, "removeObjectForKey:", v11);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }

}

- (void)fc_removeObjectsForKeysPassingTest:()FCAdditions
{
  unsigned int (**v4)(id, _QWORD, void *);
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(a1, "allKeys", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(a1, "objectForKey:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v4[2](v4, v11, v12))
          objc_msgSend(a1, "removeObjectForKey:", v11);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

}

- (void)fc_mergeWithDictionary:()FCAdditions withValueCombiner:
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v6 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __77__NSMutableDictionary_FCAdditions__fc_mergeWithDictionary_withValueCombiner___block_invoke;
  v8[3] = &unk_1E4648030;
  v8[4] = a1;
  v9 = v6;
  v7 = v6;
  objc_msgSend(a3, "enumerateKeysAndObjectsUsingBlock:", v8);

}

@end
