@implementation NSArray(UserNotifications)

- (id)un_map:()UserNotifications
{
  id v4;
  void *v5;
  void *v6;
  _QWORD v8[4];
  id v9;
  id v10;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __37__NSArray_UserNotifications__un_map___block_invoke;
    v8[3] = &unk_1E57F0010;
    v9 = v5;
    v10 = v4;
    objc_msgSend(a1, "un_each:", v8);

  }
  else
  {
    objc_msgSend(v5, "addObjectsFromArray:", a1);
  }

  return v6;
}

- (void)un_each:()UserNotifications
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  if (v4)
  {
    v6[1] = 3221225472;
    v6[2] = __38__NSArray_UserNotifications__un_each___block_invoke;
    v6[3] = &unk_1E57EFFE8;
    v5 = v4;
    v6[0] = MEMORY[0x1E0C809B0];
    v7 = v4;
    objc_msgSend(a1, "enumerateObjectsUsingBlock:", v6);

    v4 = v5;
  }

}

- (id)un_filter:()UserNotifications
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __40__NSArray_UserNotifications__un_filter___block_invoke;
    v9[3] = &unk_1E57EFFC0;
    v10 = v4;
    objc_msgSend(a1, "indexesOfObjectsPassingTest:", v9);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "objectsAtIndexes:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = (void *)objc_msgSend(a1, "copy");
  }

  return v7;
}

- (id)un_nonEmptyCopy
{
  void *v2;

  v2 = (void *)objc_msgSend(a1, "count");
  if (v2)
    v2 = (void *)objc_msgSend(a1, "copy");
  return v2;
}

- (id)un_safeArrayContainingClass:()UserNotifications
{
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = a1;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(v5, "un_safeAddObject:class:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10++), a3, (_QWORD)v13);
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  v11 = (void *)objc_msgSend(v5, "copy");
  return v11;
}

- (id)un_safeArrayContainingClasses:()UserNotifications
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = a1;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(v5, "un_safeAddObject:classes:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10++), v4, (_QWORD)v13);
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  v11 = (void *)objc_msgSend(v5, "copy");
  return v11;
}

@end
