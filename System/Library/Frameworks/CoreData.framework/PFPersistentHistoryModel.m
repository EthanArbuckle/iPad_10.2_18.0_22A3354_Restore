@implementation PFPersistentHistoryModel

void __58___PFPersistentHistoryModel__retainedTombstonesForEntity___block_invoke(void *a1, void *a2)
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _BYTE *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x18D76B4E4]();
  v5 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1, "entityDescription"), "userInfo"), "objectForKey:", CFSTR("NSPersistentHistoryTombstoneAttributes"));
  if (objc_msgSend(v5, "isNSString"))
  {
    v6 = (void *)objc_msgSend(v5, "componentsSeparatedByString:", CFSTR(","));
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v23;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v23 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(a2, "addObject:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v10++));
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
      }
      while (v8);
    }
  }
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v11 = (void *)objc_msgSend(a1, "attributeColumns", 0);
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v19;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v19 != v14)
          objc_enumerationMutation(v11);
        v16 = *(_BYTE **)(*((_QWORD *)&v18 + 1) + 8 * v15);
        v17 = (void *)MEMORY[0x18D76B4E4]();
        if (v16
          && v16[24] == 1
          && objc_msgSend((id)objc_msgSend(v16, "attributeDescription"), "preservesValueInHistoryOnDeletion"))
        {
          objc_msgSend(a2, "addObject:", objc_msgSend((id)objc_msgSend(v16, "attributeDescription"), "_qualifiedName"));
        }
        objc_autoreleasePoolPop(v17);
        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
    }
    while (v13);
  }
  objc_autoreleasePoolPop(v4);
}

uint64_t __57___PFPersistentHistoryModel__tombstonesColumnsForEntity___block_invoke(id *a1, void *a2)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t result;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1, "entityDescription"), "userInfo"), "objectForKey:", CFSTR("NSPersistentHistoryTombstoneAttributes")), "componentsSeparatedByString:", CFSTR(","));
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v24;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v24 != v7)
          objc_enumerationMutation(v4);
        if (a1)
          v9 = (void *)objc_msgSend(a1[5], "objectForKey:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v8));
        else
          v9 = 0;
        objc_msgSend(a2, "addObject:", objc_msgSend(v9, "columnName"));
        ++v8;
      }
      while (v6 != v8);
      v10 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
      v6 = v10;
    }
    while (v10);
  }
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v11 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1, "entityDescription", 0), "attributesByName"), "allValues");
  result = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
  if (result)
  {
    v13 = result;
    v14 = *(_QWORD *)v20;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v20 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v15);
        if (objc_msgSend(v16, "preservesValueInHistoryOnDeletion"))
        {
          v17 = objc_msgSend(v16, "name");
          if (a1)
            v18 = (void *)objc_msgSend(a1[5], "objectForKey:", v17);
          else
            v18 = 0;
          objc_msgSend(a2, "addObject:", objc_msgSend(v18, "columnName"));
        }
        ++v15;
      }
      while (v13 != v15);
      result = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
      v13 = result;
    }
    while (result);
  }
  return result;
}

@end
