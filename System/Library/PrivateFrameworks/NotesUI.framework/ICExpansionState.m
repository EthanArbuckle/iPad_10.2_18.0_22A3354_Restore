@implementation ICExpansionState

- (void)applyArchiveDictionary:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  void *v17;
  void *v18;
  id obj;
  uint64_t v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
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
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  _BYTE v42[128];
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v21 = a3;
  objc_msgSend(v21, "allKeys");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
  if (v22)
  {
    v20 = *(_QWORD *)v38;
    do
    {
      v4 = 0;
      do
      {
        if (*(_QWORD *)v38 != v20)
          objc_enumerationMutation(obj);
        v23 = v4;
        v5 = *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * v4);
        objc_msgSend(v21, "objectForKeyedSubscript:", v5);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = 0u;
        v34 = 0u;
        v35 = 0u;
        v36 = 0u;
        v26 = v6;
        objc_msgSend(v6, "allKeys");
        v24 = (id)objc_claimAutoreleasedReturnValue();
        v27 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v33, v42, 16);
        if (v27)
        {
          v25 = *(_QWORD *)v34;
          do
          {
            v7 = 0;
            do
            {
              if (*(_QWORD *)v34 != v25)
                objc_enumerationMutation(v24);
              v28 = v7;
              v8 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * v7);
              objc_msgSend(v26, "objectForKeyedSubscript:", v8);
              v9 = (void *)objc_claimAutoreleasedReturnValue();
              v10 = ICExpansionStateItemTypeFromString(v8);
              v29 = 0u;
              v30 = 0u;
              v31 = 0u;
              v32 = 0u;
              objc_msgSend(v9, "allKeys");
              v11 = (void *)objc_claimAutoreleasedReturnValue();
              v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v29, v41, 16);
              if (v12)
              {
                v13 = v12;
                v14 = *(_QWORD *)v30;
                do
                {
                  for (i = 0; i != v13; ++i)
                  {
                    if (*(_QWORD *)v30 != v14)
                      objc_enumerationMutation(v11);
                    v16 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * i);
                    -[ICExpansionState identifierForArchivableIdentifier:itemType:](self, "identifierForArchivableIdentifier:itemType:", v16, v10);
                    v17 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v9, "objectForKeyedSubscript:", v16);
                    v18 = (void *)objc_claimAutoreleasedReturnValue();
                    -[ICExpansionState setExpanded:itemIdentifier:itemType:context:](self, "setExpanded:itemIdentifier:itemType:context:", objc_msgSend(v18, "BOOLValue"), v17, v10, v5);

                  }
                  v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v29, v41, 16);
                }
                while (v13);
              }

              v7 = v28 + 1;
            }
            while (v28 + 1 != v27);
            v27 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v33, v42, 16);
          }
          while (v27);
        }

        v4 = v23 + 1;
      }
      while (v23 + 1 != v22);
      v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
    }
    while (v22);
  }

}

void __40__ICExpansionState_sharedExpansionState__block_invoke()
{
  ICExpansionState *v0;
  void *v1;

  v0 = objc_alloc_init(ICExpansionState);
  v1 = (void *)sharedExpansionState_instance;
  sharedExpansionState_instance = (uint64_t)v0;

}

- (ICExpansionState)init
{
  ICExpansionState *v2;
  uint64_t v3;
  NSMutableDictionary *expansionState;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ICExpansionState;
  v2 = -[ICExpansionState init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v3 = objc_claimAutoreleasedReturnValue();
    expansionState = v2->_expansionState;
    v2->_expansionState = (NSMutableDictionary *)v3;

  }
  return v2;
}

+ (ICExpansionState)sharedExpansionState
{
  if (sharedExpansionState_onceToken != -1)
    dispatch_once(&sharedExpansionState_onceToken, &__block_literal_global_18);
  return (ICExpansionState *)(id)sharedExpansionState_instance;
}

- (id)expandedObjectIDsInContext:(id)a3
{
  void *v3;
  void *v4;

  -[ICExpansionState expandedItemIdentifiersWithItemType:context:](self, "expandedItemIdentifiersWithItemType:context:", 0, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ic_objectsOfClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)expandedItemIdentifiersWithItemType:(int64_t)a3 context:(id)a4
{
  return -[ICExpansionState itemIdentifiersExpanded:itemType:context:](self, "itemIdentifiersExpanded:itemType:context:", 1, a3, a4);
}

- (BOOL)isSectionIdentiferExpanded:(id)a3 inContext:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;

  v6 = a3;
  -[ICExpansionState normalizedContext:](self, "normalizedContext:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICExpansionState expansionState](self, "expansionState");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("ICExpansionStateItemTypeSectionIdentifier"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "expansionStateContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "objectForKeyedSubscript:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
    v13 = objc_msgSend(v12, "BOOLValue");
  else
    v13 = 1;

  return v13;
}

- (id)itemIdentifiersExpanded:(BOOL)a3 itemType:(int64_t)a4 context:(id)a5
{
  int v6;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  uint64_t v20;
  void *v21;
  int v22;
  void *v23;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v6 = a3;
  v31 = *MEMORY[0x1E0C80C00];
  -[ICExpansionState normalizedContext:](self, "normalizedContext:", a5);
  v8 = objc_claimAutoreleasedReturnValue();
  -[ICExpansionState expansionState](self, "expansionState");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (void *)v8;
  objc_msgSend(v9, "objectForKeyedSubscript:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if ((unint64_t)a4 > 2)
    v12 = CFSTR("ICExpansionStateItemTypeUnknown");
  else
    v12 = off_1E5C1EB88[a4];
  objc_msgSend(v10, "objectForKeyedSubscript:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  objc_msgSend(v13, "allKeys");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v27 != v18)
          objc_enumerationMutation(v15);
        v20 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * i);
        objc_msgSend(v13, "objectForKeyedSubscript:", v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v21, "BOOLValue");

        if (v22 == v6)
          objc_msgSend(v14, "addObject:", v20);
      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v17);
  }

  v23 = (void *)objc_msgSend(v14, "copy");
  return v23;
}

- (id)normalizedContext:(id)a3
{
  if (a3)
    return a3;
  else
    return CFSTR("ICExpansionStateGlobalContext");
}

- (NSMutableDictionary)expansionState
{
  return self->_expansionState;
}

- (NSDictionary)archiveDictionary
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id obj;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  uint64_t v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  _BYTE v49[128];
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  -[ICExpansionState expansionState](self, "expansionState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v4;
  v27 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v44, v50, 16);
  if (v27)
  {
    v25 = *(_QWORD *)v45;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v45 != v25)
          objc_enumerationMutation(obj);
        v29 = v5;
        v6 = *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * v5);
        -[ICExpansionState expansionState](self, "expansionState");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = v6;
        objc_msgSend(v7, "objectForKeyedSubscript:", v6);
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = v8;
        v40 = 0u;
        v41 = 0u;
        v42 = 0u;
        v43 = 0u;
        objc_msgSend(v8, "allKeys");
        v30 = (id)objc_claimAutoreleasedReturnValue();
        v34 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v40, v49, 16);
        if (v34)
        {
          v31 = *(_QWORD *)v41;
          do
          {
            for (i = 0; i != v34; ++i)
            {
              if (*(_QWORD *)v41 != v31)
                objc_enumerationMutation(v30);
              v35 = *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * i);
              objc_msgSend(v33, "objectForKeyedSubscript:");
              v10 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
              v11 = (void *)objc_claimAutoreleasedReturnValue();
              v36 = 0u;
              v37 = 0u;
              v38 = 0u;
              v39 = 0u;
              objc_msgSend(v10, "allKeys");
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v36, v48, 16);
              if (v13)
              {
                v14 = v13;
                v15 = *(_QWORD *)v37;
                do
                {
                  for (j = 0; j != v14; ++j)
                  {
                    if (*(_QWORD *)v37 != v15)
                      objc_enumerationMutation(v12);
                    v17 = *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * j);
                    -[ICExpansionState archivableIdentifierForItemIdentifier:](self, "archivableIdentifierForItemIdentifier:", v17);
                    v18 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v10, "objectForKeyedSubscript:", v17);
                    v19 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v11, "setObject:forKeyedSubscript:", v19, v18);

                  }
                  v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v36, v48, 16);
                }
                while (v14);
              }

              v20 = (void *)objc_msgSend(v11, "copy");
              objc_msgSend(v32, "setObject:forKeyedSubscript:", v20, v35);

            }
            v34 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v40, v49, 16);
          }
          while (v34);
        }

        v21 = (void *)objc_msgSend(v32, "copy");
        objc_msgSend(v26, "setObject:forKeyedSubscript:", v21, v28);

        v5 = v29 + 1;
      }
      while (v29 + 1 != v27);
      v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v50, 16);
    }
    while (v27);
  }

  v22 = (void *)objc_msgSend(v26, "copy");
  return (NSDictionary *)v22;
}

- (id)collapsedObjectIDsInContext:(id)a3
{
  void *v3;
  void *v4;

  -[ICExpansionState collapsedItemIdentifiersWithItemType:context:](self, "collapsedItemIdentifiersWithItemType:context:", 0, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ic_objectsOfClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)collapsedItemIdentifiersWithItemType:(int64_t)a3 context:(id)a4
{
  return -[ICExpansionState itemIdentifiersExpanded:itemType:context:](self, "itemIdentifiersExpanded:itemType:context:", 0, a3, a4);
}

- (void)expandItemIdentifier:(id)a3 itemType:(int64_t)a4 context:(id)a5
{
  -[ICExpansionState setExpanded:itemIdentifier:itemType:context:](self, "setExpanded:itemIdentifier:itemType:context:", 1, a3, a4, a5);
}

- (void)expandItemIdentifier:(id)a3 context:(id)a4
{
  -[ICExpansionState expandItemIdentifier:itemType:context:](self, "expandItemIdentifier:itemType:context:", a3, -1, a4);
}

- (void)expandItemIdentifiers:(id)a3 itemType:(int64_t)a4 context:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v15;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v15 != v12)
          objc_enumerationMutation(v8);
        -[ICExpansionState expandItemIdentifier:itemType:context:](self, "expandItemIdentifier:itemType:context:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v13++), a4, v9);
      }
      while (v11 != v13);
      v11 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v11);
  }

}

- (void)collapseItemIdentifier:(id)a3 itemType:(int64_t)a4 context:(id)a5
{
  -[ICExpansionState setExpanded:itemIdentifier:itemType:context:](self, "setExpanded:itemIdentifier:itemType:context:", 0, a3, a4, a5);
}

- (void)collapseItemIdentifier:(id)a3 context:(id)a4
{
  -[ICExpansionState collapseItemIdentifier:itemType:context:](self, "collapseItemIdentifier:itemType:context:", a3, -1, a4);
}

- (void)collapseItemIdentifiers:(id)a3 itemType:(int64_t)a4 context:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v15;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v15 != v12)
          objc_enumerationMutation(v8);
        -[ICExpansionState collapseItemIdentifier:itemType:context:](self, "collapseItemIdentifier:itemType:context:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v13++), a4, v9);
      }
      while (v11 != v13);
      v11 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v11);
  }

}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICExpansionState archiveDictionary](self, "archiveDictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@[%@]"), v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)setExpanded:(BOOL)a3 itemIdentifier:(id)a4 itemType:(int64_t)a5 context:(id)a6
{
  _BOOL8 v8;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  const __CFString *v18;
  void *v19;
  id v20;

  v8 = a3;
  v20 = a4;
  -[ICExpansionState normalizedContext:](self, "normalizedContext:", a6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICExpansionState expansionState](self, "expansionState");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICExpansionState expansionState](self, "expansionState");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v12, v10);

  }
  if (a5 == -1)
    a5 = -[ICExpansionState itemTypeForItemIdentifier:](self, "itemTypeForItemIdentifier:", v20);
  -[ICExpansionState normalizedItemIdentifier:](self, "normalizedItemIdentifier:", v20);
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = (void *)v14;
  if (a5 != -1 && v14)
  {
    if ((unint64_t)a5 > 2)
      v16 = CFSTR("ICExpansionStateItemTypeUnknown");
    else
      v16 = off_1E5C1EB88[a5];
    objc_msgSend(v12, "objectForKeyedSubscript:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v17)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if ((unint64_t)a5 > 2)
        v18 = CFSTR("ICExpansionStateItemTypeUnknown");
      else
        v18 = off_1E5C1EB88[a5];
      objc_msgSend(v12, "setObject:forKeyedSubscript:", v17, v18);
    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v8);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setObject:forKeyedSubscript:", v19, v15);

  }
}

- (int64_t)itemTypeForItemIdentifier:(id)a3
{
  id v3;
  int64_t v4;

  v3 = a3;
  if ((objc_msgSend(v3, "conformsToProtocol:", &unk_1EECCB670) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isMemberOfClass:", objc_opt_class()))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)normalizedItemIdentifier:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = v3;
  if (objc_msgSend(v3, "conformsToProtocol:", &unk_1EECCB670))
  {
    objc_msgSend(v3, "expansionStateContext");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

- (id)archivableIdentifierForItemIdentifier:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "URIRepresentation");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "absoluteString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = v3;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), v3);
      v6 = (id)objc_claimAutoreleasedReturnValue();
    }
    v5 = v6;
  }

  return v5;
}

- (id)identifierForArchivableIdentifier:(id)a3 itemType:(int64_t)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0D63BC8], "sharedContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "persistentStoreCoordinator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D629F0], "persistentStoreCoordinator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (a4)
  {
    v9 = v5;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      objc_msgSend(v7, "ic_managedObjectIDForURIRepresentation:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      if (v11)
      {
        v13 = v11;
      }
      else
      {
        objc_msgSend(v8, "ic_managedObjectIDForURIRepresentation:", v10);
        v13 = (id)objc_claimAutoreleasedReturnValue();
      }
      v9 = v13;

    }
    else
    {
      v9 = 0;
    }

  }
  return v9;
}

- (void)setExpansionState:(id)a3
{
  objc_storeStrong((id *)&self->_expansionState, a3);
}

- (NSManagedObjectContext)modernViewContext
{
  return self->_modernViewContext;
}

- (void)setModernViewContext:(id)a3
{
  objc_storeStrong((id *)&self->_modernViewContext, a3);
}

- (NSManagedObjectContext)legacyViewContext
{
  return self->_legacyViewContext;
}

- (void)setLegacyViewContext:(id)a3
{
  objc_storeStrong((id *)&self->_legacyViewContext, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_legacyViewContext, 0);
  objc_storeStrong((id *)&self->_modernViewContext, 0);
  objc_storeStrong((id *)&self->_expansionState, 0);
}

@end
