@implementation NSMapTable(BaseBoard)

- (void)bs_each:()BaseBoard
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    v4 = a1;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v5)
    {
      v6 = *(_QWORD *)v11;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v11 != v6)
            objc_enumerationMutation(v4);
          v8 = *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i);
          objc_msgSend(v4, "objectForKey:", v8, (_QWORD)v10);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          (*(void (**)(uint64_t, uint64_t, void *))(a3 + 16))(a3, v8, v9);

        }
        v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v5);
    }

  }
}

- (id)bs_safeObjectForKey:()BaseBoard ofType:
{
  void *v1;
  id v2;

  objc_msgSend(a1, "objectForKey:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (v1 && (objc_opt_isKindOfClass() & 1) != 0)
    v2 = v1;
  else
    v2 = 0;

  return v2;
}

- (id)bs_filter:()BaseBoard
{
  void *v5;
  void *v6;
  _QWORD v8[4];
  id v9;
  uint64_t v10;

  v5 = (void *)objc_msgSend(a1, "copy");
  v6 = v5;
  if (a3)
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __35__NSMapTable_BaseBoard__bs_filter___block_invoke;
    v8[3] = &unk_1E1EBE5A0;
    v10 = a3;
    v9 = v5;
    objc_msgSend(a1, "bs_each:", v8);

  }
  return v6;
}

- (void)bs_setSafeObject:()BaseBoard forKey:
{
  if (a3)
  {
    if (a4)
      return (void *)objc_msgSend(a1, "setObject:forKey:");
  }
  return a1;
}

- (id)bs_takeObjectForKey:()BaseBoard
{
  void *v5;
  id v6;

  objc_msgSend(a1, "objectForKey:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(a1, "removeObjectForKey:", a3);
    v6 = v5;
  }

  return v5;
}

@end
