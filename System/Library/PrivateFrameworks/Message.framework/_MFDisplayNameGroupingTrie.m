@implementation _MFDisplayNameGroupingTrie

- (_MFDisplayNameGroupingTrie)init
{
  _MFDisplayNameGroupingTrie *v2;
  _MFDisplayNameGroupingTrieNode *v3;
  _MFDisplayNameGroupingTrieNode *root;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_MFDisplayNameGroupingTrie;
  v2 = -[_MFDisplayNameGroupingTrie init](&v6, sel_init);
  if (v2)
  {
    v3 = -[_MFDisplayNameGroupingTrieNode initWithValue:]([_MFDisplayNameGroupingTrieNode alloc], "initWithValue:", 0);
    root = v2->_root;
    v2->_root = v3;

  }
  return v2;
}

- (void)insertDisplayName:(id)a3 addressID:(int64_t)a4
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  id v23;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  id v29;
  _BYTE v30[128];
  _QWORD v31[4];

  v31[2] = *MEMORY[0x1E0C80C00];
  v23 = a3;
  objc_msgSend(v23, "lowercaseString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0;
  objc_msgSend(v5, "ef_wordComponentsForLocale:minimumWordLength:componentLimit:remainingString:", 0, 0, 50, &v29);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v29;

  if (v24)
  {
    v31[0] = v6;
    v31[1] = v24;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "ef_flatten");
    v8 = objc_claimAutoreleasedReturnValue();

    _ef_log_MFMailMessageLibraryBusinessCommonPrefixGroupingUpgradeStep();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[_MFDisplayNameGroupingTrie insertDisplayName:addressID:].cold.1(v9, v10, v11);

    v6 = (void *)v8;
  }
  if (objc_msgSend(v6, "count"))
  {
    -[_MFDisplayNameGroupingTrie root](self, "root");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v13 = v6;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    if (v14)
    {
      v15 = *(_QWORD *)v26;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v26 != v15)
            objc_enumerationMutation(v13);
          v17 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * v16);
          objc_msgSend(v12, "children");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "objectForKeyedSubscript:", v17);
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          if (v19)
          {
            v20 = v19;

            if (objc_msgSend(v20, "isEndOfName"))
            {
              objc_msgSend(v20, "addAddressID:", a4);

              goto LABEL_18;
            }
          }
          else
          {
            objc_msgSend(v12, "addChild:", v17);
            objc_msgSend(v12, "children");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "objectForKeyedSubscript:", v17);
            v20 = (id)objc_claimAutoreleasedReturnValue();

          }
          v12 = v20;

          ++v16;
        }
        while (v14 != v16);
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
      }
      while (v14);
    }

    objc_msgSend(v12, "setIsEndOfName:", 1);
    objc_msgSend(v12, "addAddressID:", a4);
    v20 = v12;
LABEL_18:

  }
}

- (id)findGroups
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  -[_MFDisplayNameGroupingTrie root](self, "root");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MFDisplayNameGroupingTrie _findTopLevelGroupsForStart:](self, "_findTopLevelGroupsForStart:", v3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = v15;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v17 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v9, "addressIDs");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "firstIndex");

        if (v11 != 0x7FFFFFFFFFFFFFFFLL)
        {
          -[_MFDisplayNameGroupingTrie _addressesInGroupWithRoot:](self, "_addressesInGroupWithRoot:", v9);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v11);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "setObject:forKeyedSubscript:", v12, v13);

        }
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v6);
  }

  return v4;
}

- (id)_addressesInGroupWithRoot:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:", v3, 0);
  v5 = objc_alloc_init(MEMORY[0x1E0D1EF08]);
  while (objc_msgSend(v4, "count"))
  {
    objc_msgSend(v4, "ef_popElement");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (!v6)
      break;
    if (objc_msgSend(v6, "isEndOfName"))
    {
      objc_msgSend(v7, "addressIDs");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addIndexes:", v8);

    }
    objc_msgSend(v7, "children");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "allValues");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObjectsFromArray:", v10);

  }
  return v5;
}

- (id)_findTopLevelGroupsForStart:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:", v3, 0);
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  while (objc_msgSend(v4, "count"))
  {
    objc_msgSend(v4, "ef_popElement");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (!v6)
      break;
    if ((objc_msgSend(v6, "isEndOfName") & 1) != 0)
    {
      objc_msgSend(v5, "addObject:", v7);
    }
    else
    {
      objc_msgSend(v7, "children");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "allValues");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObjectsFromArray:", v9);

    }
  }

  return v5;
}

- (_MFDisplayNameGroupingTrieNode)root
{
  return self->_root;
}

- (void)setRoot:(id)a3
{
  objc_storeStrong((id *)&self->_root, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_root, 0);
}

- (void)insertDisplayName:(uint64_t)a3 addressID:.cold.1(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 134217984;
  v4 = 50;
  OUTLINED_FUNCTION_0_1(&dword_1A4F90000, a1, a3, "Display name contains over %lu tokens. Truncating.", (uint8_t *)&v3);
}

@end
