@implementation EMSectionedMessageList

- (EMSectionedMessageList)initWithMessageListSections:(id)a3
{
  id v4;
  EMSectionedMessageList *v5;
  uint64_t v6;
  EFOrderedDictionary *sections;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  EFLocked *sectionsAwaitingInitialLoad;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  EFLocked *sectionsAwaitingRemoteSearch;
  uint64_t v20;
  NSHashTable *changeObservers;
  objc_super v23;

  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)EMSectionedMessageList;
  v5 = -[EMSectionedMessageList init](&v23, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    sections = v5->_sections;
    v5->_sections = (EFOrderedDictionary *)v6;

    v8 = objc_alloc(MEMORY[0x1E0D1EEF0]);
    objc_msgSend(v4, "allKeys");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "set");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v10, "mutableCopy");
    v12 = objc_msgSend(v8, "initWithObject:", v11);
    sectionsAwaitingInitialLoad = v5->_sectionsAwaitingInitialLoad;
    v5->_sectionsAwaitingInitialLoad = (EFLocked *)v12;

    v14 = objc_alloc(MEMORY[0x1E0D1EEF0]);
    objc_msgSend(v4, "allKeys");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "set");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v16, "mutableCopy");
    v18 = objc_msgSend(v14, "initWithObject:", v17);
    sectionsAwaitingRemoteSearch = v5->_sectionsAwaitingRemoteSearch;
    v5->_sectionsAwaitingRemoteSearch = (EFLocked *)v18;

    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v20 = objc_claimAutoreleasedReturnValue();
    changeObservers = v5->_changeObservers;
    v5->_changeObservers = (NSHashTable *)v20;

  }
  return v5;
}

- (id)objectAtIndexedSubscript:(unint64_t)a3
{
  void *v5;

  if (-[EFOrderedDictionary count](self->_sections, "count") <= a3)
  {
    v5 = 0;
  }
  else
  {
    -[EFOrderedDictionary objectAtIndexedSubscript:](self->_sections, "objectAtIndexedSubscript:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (id)objectForKeyedSubscript:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  if (v4)
  {
    -[EFOrderedDictionary objectForKeyedSubscript:](self->_sections, "objectForKeyedSubscript:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)_sectionedItemIDForItemID:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;

  return v4;
}

- (id)_sectionedObjectIDForObjectID:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;

  return v4;
}

- (id)_sectionedMessageListItemForMessageListItem:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;

  return v4;
}

- (id)_itemIDsGroupedBySection:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "ef_compactMap:", &__block_literal_global_46);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ef_groupBy:", &__block_literal_global_9_0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __51__EMSectionedMessageList__itemIDsGroupedBySection___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;

  v2 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;

  return v3;
}

id __51__EMSectionedMessageList__itemIDsGroupedBySection___block_invoke_2(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "sectionID");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (unint64_t)_sectionIndexForCollection:(id)a3
{
  id v4;
  EFOrderedDictionary *sections;
  id v6;
  unint64_t v7;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0x7FFFFFFFFFFFFFFFLL;
  sections = self->_sections;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __53__EMSectionedMessageList__sectionIndexForCollection___block_invoke;
  v9[3] = &unk_1E70F5DC8;
  v10 = v4;
  v11 = &v12;
  v6 = v4;
  -[EFOrderedDictionary enumerateKeysAndObjectsUsingBlock:](sections, "enumerateKeysAndObjectsUsingBlock:", v9);
  v7 = v13[3];

  _Block_object_dispose(&v12, 8);
  return v7;
}

uint64_t __53__EMSectionedMessageList__sectionIndexForCollection___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "isEqual:", a4);
  if ((_DWORD)result)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
    *a5 = 1;
  }
  return result;
}

- (id)_boxItemIDForItemID:(id)a3 inSection:(id)a4
{
  id v5;
  id v6;
  void *v7;

  v5 = a3;
  v6 = a4;
  if (v5)
  {
    +[EMSectionedMessageListObjectConverter itemIDForItemID:inSection:](EMSectionedMessageListObjectConverter, "itemIDForItemID:inSection:", v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)_boxItemIDsForItemIDs:(id)a3 inSection:(id)a4
{
  id v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v5 = a4;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __58__EMSectionedMessageList__boxItemIDsForItemIDs_inSection___block_invoke;
  v9[3] = &unk_1E70F5DF0;
  v10 = v5;
  v6 = v5;
  objc_msgSend(a3, "ef_map:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id __58__EMSectionedMessageList__boxItemIDsForItemIDs_inSection___block_invoke(uint64_t a1, uint64_t a2)
{
  +[EMSectionedMessageListObjectConverter itemIDForItemID:inSection:](EMSectionedMessageListObjectConverter, "itemIDForItemID:inSection:", a2, *(_QWORD *)(a1 + 32));
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_lastItemIDOfSectionBeforeSection:(unint64_t)a3
{
  unint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v10;
  void *v11;

  if (!a3)
    return 0;
  v4 = a3 - 1;
  while (1)
  {
    -[EMSectionedMessageList objectAtIndexedSubscript:](self, "objectAtIndexedSubscript:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "allItemIDs");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "resultIfAvailable");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "lastObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
      break;
    if (--v4 == -1)
      return 0;
  }
  -[EFOrderedDictionary keyAtIndex:](self->_sections, "keyAtIndex:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[EMSectionedMessageList _boxItemIDForItemID:inSection:](self, "_boxItemIDForItemID:inSection:", v8, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)_firstItemIDOfSectionAfterSection:(unint64_t)a3
{
  unint64_t v4;
  EFOrderedDictionary *i;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3 + 1;
  for (i = self->_sections; ; i = self->_sections)
  {
    if (v4 >= -[EFOrderedDictionary count](i, "count"))
    {
      v10 = 0;
      return v10;
    }
    -[EMSectionedMessageList objectAtIndexedSubscript:](self, "objectAtIndexedSubscript:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "allItemIDs");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "resultIfAvailable");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "lastObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
      break;
    ++v4;
  }
  -[EFOrderedDictionary keyAtIndex:](self->_sections, "keyAtIndex:", v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[EMSectionedMessageList _boxItemIDForItemID:inSection:](self, "_boxItemIDForItemID:inSection:", v9, v11);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (NSString)ef_publicDescription
{
  void *v3;
  EFOrderedDictionary *sections;
  id v5;
  _QWORD v7[4];
  id v8;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithString:", CFSTR("Sectioned Message List:"));
  sections = self->_sections;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __46__EMSectionedMessageList_ef_publicDescription__block_invoke;
  v7[3] = &unk_1E70F5E18;
  v5 = v3;
  v8 = v5;
  -[EFOrderedDictionary enumerateKeysAndObjectsUsingBlock:](sections, "enumerateKeysAndObjectsUsingBlock:", v7);

  return (NSString *)v5;
}

uint64_t __46__EMSectionedMessageList_ef_publicDescription__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("\n  %@: %@"), a3, a4);
}

- (EFFuture)allItemIDs
{
  void *v3;
  EFOrderedDictionary *sections;
  id v5;
  void *v6;
  void *v7;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t, void *, void *);
  void *v12;
  EMSectionedMessageList *v13;
  id v14;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[EFOrderedDictionary count](self->_sections, "count"));
  sections = self->_sections;
  v9 = MEMORY[0x1E0C809B0];
  v10 = 3221225472;
  v11 = __36__EMSectionedMessageList_allItemIDs__block_invoke;
  v12 = &unk_1E70F5E68;
  v13 = self;
  v5 = v3;
  v14 = v5;
  -[EFOrderedDictionary enumerateKeysAndObjectsUsingBlock:](sections, "enumerateKeysAndObjectsUsingBlock:", &v9);
  objc_msgSend(MEMORY[0x1E0D1EEC0], "join:", v5, v9, v10, v11, v12, v13);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "then:", &__block_literal_global_19);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (EFFuture *)v7;
}

void __36__EMSectionedMessageList_allItemIDs__block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  id (*v12)(uint64_t, uint64_t);
  void *v13;
  uint64_t v14;
  id v15;

  v6 = a3;
  objc_msgSend(a4, "allItemIDs");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __36__EMSectionedMessageList_allItemIDs__block_invoke_2;
  v13 = &unk_1E70F5E40;
  v14 = *(_QWORD *)(a1 + 32);
  v8 = v6;
  v15 = v8;
  objc_msgSend(v7, "then:", &v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "addObject:", v9, v10, v11, v12, v13, v14);

}

id __36__EMSectionedMessageList_allItemIDs__block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "_boxItemIDsForItemIDs:inSection:", a2, *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D1EEC0], "futureWithResult:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __36__EMSectionedMessageList_allItemIDs__block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0D1EEC0];
  objc_msgSend(a2, "ef_flatten");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "futureWithResult:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)beginObserving:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[EMSectionedMessageList observerScheduler](self, "observerScheduler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __41__EMSectionedMessageList_beginObserving___block_invoke;
  v7[3] = &unk_1E70F2070;
  v7[4] = self;
  v6 = v4;
  v8 = v6;
  objc_msgSend(v5, "performBlock:", v7);

}

uint64_t __41__EMSectionedMessageList_beginObserving___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v7;
  _QWORD v8[5];
  _QWORD v9[5];

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "anyObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    objc_msgSend(*(id *)(v3 + 32), "addObject:", *(_QWORD *)(a1 + 40));
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 8);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __41__EMSectionedMessageList_beginObserving___block_invoke_3;
    v8[3] = &unk_1E70F5E18;
    v8[4] = v4;
    return objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v8);
  }
  else
  {
    v7 = *(void **)(v3 + 8);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __41__EMSectionedMessageList_beginObserving___block_invoke_2;
    v9[3] = &unk_1E70F5E18;
    v9[4] = v3;
    objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", v9);
    return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "addObject:", *(_QWORD *)(a1 + 40));
  }
}

uint64_t __41__EMSectionedMessageList_beginObserving___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  return objc_msgSend(a4, "beginObserving:", *(_QWORD *)(a1 + 32));
}

uint64_t __41__EMSectionedMessageList_beginObserving___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  return objc_msgSend(a4, "notifyNewChangeObserverAboutExistingState:", *(_QWORD *)(a1 + 32));
}

- (void)stopObserving:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[6];

  v4 = a3;
  -[EMSectionedMessageList observerScheduler](self, "observerScheduler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __40__EMSectionedMessageList_stopObserving___block_invoke;
  v6[3] = &unk_1E70F5630;
  v6[4] = self;
  v6[5] = v4;
  objc_msgSend(v5, "performBlock:", v6);

}

void __40__EMSectionedMessageList_stopObserving___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  char v4;
  uint64_t v5;
  int v6;
  uint64_t i;
  _BOOL4 v8;
  uint64_t v9;
  void *v10;
  _QWORD v11[5];
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (!v3)
  {

LABEL_12:
    v9 = *(_QWORD *)(a1 + 32);
    v10 = *(void **)(v9 + 8);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __40__EMSectionedMessageList_stopObserving___block_invoke_2;
    v11[3] = &unk_1E70F5E18;
    v11[4] = v9;
    objc_msgSend(v10, "enumerateKeysAndObjectsUsingBlock:", v11);
    return;
  }
  v4 = 0;
  v5 = *(_QWORD *)v13;
  v6 = 1;
  do
  {
    for (i = 0; i != v3; ++i)
    {
      if (*(_QWORD *)v13 != v5)
        objc_enumerationMutation(v2);
      v8 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i) == *(_QWORD *)(a1 + 40);
      v4 |= v8;
      v6 &= v8;
    }
    v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  }
  while (v3);

  if ((v4 & 1) != 0)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "removeObject:", *(_QWORD *)(a1 + 40));
    if (v6)
      goto LABEL_12;
  }
}

uint64_t __40__EMSectionedMessageList_stopObserving___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  return objc_msgSend(a4, "stopObserving:", *(_QWORD *)(a1 + 32));
}

- (void)refresh
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  _BYTE v10[128];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v6 = 0u;
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  -[EFOrderedDictionary allValues](self->_sections, "allValues", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v7;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v7 != v4)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v6 + 1) + 8 * v5++), "refresh");
      }
      while (v3 != v5);
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
    }
    while (v3);
  }

}

- (id)objectIDForItemID:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  -[EMSectionedMessageList _sectionedItemIDForItemID:](self, "_sectionedItemIDForItemID:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "sectionID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "underlyingItemID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[EMSectionedMessageList objectForKeyedSubscript:](self, "objectForKeyedSubscript:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectIDForItemID:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "sectionID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[EMSectionedMessageListObjectConverter objectIDForObjectID:inSection:](EMSectionedMessageListObjectConverter, "objectIDForObjectID:inSection:", v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (BOOL)containsItemID:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;

  -[EMSectionedMessageList _sectionedItemIDForItemID:](self, "_sectionedItemIDForItemID:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sectionID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[EMSectionedMessageList objectForKeyedSubscript:](self, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "underlyingItemID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "containsItemID:", v7);

  return v8;
}

- (BOOL)isThreaded
{
  void *v2;
  char v3;

  -[EFOrderedDictionary allValues](self->_sections, "allValues");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "ef_any:", &__block_literal_global_22);

  return v3;
}

uint64_t __36__EMSectionedMessageList_isThreaded__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isThreaded");
}

- (NSSet)expandedThreadItemIDs
{
  id v3;
  EFOrderedDictionary *sections;
  id v5;
  void *v6;
  NSSet *v7;
  _QWORD v9[5];
  id v10;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  sections = self->_sections;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __47__EMSectionedMessageList_expandedThreadItemIDs__block_invoke;
  v9[3] = &unk_1E70F5E68;
  v9[4] = self;
  v5 = v3;
  v10 = v5;
  -[EFOrderedDictionary enumerateKeysAndObjectsUsingBlock:](sections, "enumerateKeysAndObjectsUsingBlock:", v9);
  v6 = v10;
  v7 = (NSSet *)v5;

  return v7;
}

void __47__EMSectionedMessageList_expandedThreadItemIDs__block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  objc_msgSend(a4, "expandedThreadItemIDs", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v13;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(a1 + 32), "_boxItemIDForItemID:inSection:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v10), v6);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }

}

- (id)filteredMessageListWithPredicate:(id)a3 ignoredMessagesPredicate:(id)a4 userFiltered:(BOOL)a5
{
  id v8;
  id v9;
  EFOrderedDictionary *sections;
  id v11;
  id v12;
  EMSectionedMessageList *v13;
  EMSectionedMessageList *v14;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, uint64_t, void *, void *);
  void *v19;
  id v20;
  id v21;
  uint64_t *v22;
  BOOL v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;

  v8 = a3;
  v9 = a4;
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__13;
  v28 = __Block_byref_object_dispose__13;
  v29 = (id)0xAAAAAAAAAAAAAAAALL;
  v29 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D1EF10]), "initWithCapacity:", -[EFOrderedDictionary count](self->_sections, "count"));
  sections = self->_sections;
  v16 = MEMORY[0x1E0C809B0];
  v17 = 3221225472;
  v18 = __97__EMSectionedMessageList_filteredMessageListWithPredicate_ignoredMessagesPredicate_userFiltered___block_invoke;
  v19 = &unk_1E70F5ED0;
  v11 = v8;
  v20 = v11;
  v12 = v9;
  v23 = a5;
  v21 = v12;
  v22 = &v24;
  -[EFOrderedDictionary enumerateKeysAndObjectsUsingBlock:](sections, "enumerateKeysAndObjectsUsingBlock:", &v16);
  v13 = [EMSectionedMessageList alloc];
  v14 = -[EMSectionedMessageList initWithMessageListSections:](v13, "initWithMessageListSections:", v25[5], v16, v17, v18, v19);
  -[EMSectionedMessageList setUnfilteredMessageList:](v14, "setUnfilteredMessageList:", self);

  _Block_object_dispose(&v24, 8);
  return v14;
}

void __97__EMSectionedMessageList_filteredMessageListWithPredicate_ignoredMessagesPredicate_userFiltered___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  void *v6;
  id v7;

  v7 = a3;
  objc_msgSend(a4, "filteredMessageListWithPredicate:ignoredMessagesPredicate:userFiltered:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 56));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setOrAddObject:forKey:", v6, v7);

}

- (EMSectionedMessageList)unfilteredMessageList
{
  if (self->_unfilteredMessageList)
    self = self->_unfilteredMessageList;
  return self;
}

- (void)expandThreadsFromThreadItemIDs:(id)a3
{
  id v4;
  _QWORD v5[5];

  -[EMSectionedMessageList _itemIDsGroupedBySection:](self, "_itemIDsGroupedBySection:", a3);
  v5[1] = 3221225472;
  v5[2] = __57__EMSectionedMessageList_expandThreadsFromThreadItemIDs___block_invoke;
  v5[3] = &unk_1E70F5EF8;
  v5[4] = self;
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v5);

}

void __57__EMSectionedMessageList_expandThreadsFromThreadItemIDs___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  objc_msgSend(a3, "ef_mapSelector:", sel_underlyingItemID);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "expandThreadsFromThreadItemIDs:", v5);

}

- (void)expandThread:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[EMSectionedMessageList _sectionedMessageListItemForMessageListItem:](self, "_sectionedMessageListItemForMessageListItem:", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sectionID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[EMSectionedMessageList objectForKeyedSubscript:](self, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "underlyingItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "expandThread:", v6);

}

- (void)collapseThread:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[EMSectionedMessageList _sectionedMessageListItemForMessageListItem:](self, "_sectionedMessageListItemForMessageListItem:", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sectionID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[EMSectionedMessageList objectForKeyedSubscript:](self, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "underlyingItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "collapseThread:", v6);

}

- (BOOL)anyExpandedThreadContainsItemID:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;

  -[EMSectionedMessageList _sectionedItemIDForItemID:](self, "_sectionedItemIDForItemID:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sectionID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[EMSectionedMessageList objectForKeyedSubscript:](self, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "underlyingItemID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "anyExpandedThreadContainsItemID:", v7);

  return v8;
}

- (BOOL)recentlyCollapsedThreadContainsItemID:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;

  -[EMSectionedMessageList _sectionedItemIDForItemID:](self, "_sectionedItemIDForItemID:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sectionID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[EMSectionedMessageList objectForKeyedSubscript:](self, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "underlyingItemID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "recentlyCollapsedThreadContainsItemID:", v7);

  return v8;
}

- (void)clearRecentlyCollapsedThread
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  _BYTE v10[128];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v6 = 0u;
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  -[EFOrderedDictionary allValues](self->_sections, "allValues", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v7;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v7 != v4)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v6 + 1) + 8 * v5++), "clearRecentlyCollapsedThread");
      }
      while (v3 != v5);
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
    }
    while (v3);
  }

}

- (id)messageListItemForItemID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v13[4];
  id v14;

  v4 = a3;
  -[EMSectionedMessageList _sectionedItemIDForItemID:](self, "_sectionedItemIDForItemID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sectionID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[EMSectionedMessageList objectForKeyedSubscript:](self, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "underlyingItemID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "messageListItemForItemID:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __51__EMSectionedMessageList_messageListItemForItemID___block_invoke;
  v13[3] = &unk_1E70F5F20;
  v10 = v5;
  v14 = v10;
  objc_msgSend(v9, "then:", v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

id __51__EMSectionedMessageList_messageListItemForItemID___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "sectionID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[EMSectionedMessageListObjectConverter messageListItemForMessageListItem:inSection:](EMSectionedMessageListObjectConverter, "messageListItemForMessageListItem:inSection:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D1EEC0], "futureWithResult:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)messageListItemForItemID:(id)a3 ifAvailable:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  _QWORD v15[4];
  id v16;

  v4 = a4;
  v6 = a3;
  -[EMSectionedMessageList _sectionedItemIDForItemID:](self, "_sectionedItemIDForItemID:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sectionID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[EMSectionedMessageList objectForKeyedSubscript:](self, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "underlyingItemID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "messageListItemForItemID:ifAvailable:", v10, v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __63__EMSectionedMessageList_messageListItemForItemID_ifAvailable___block_invoke;
  v15[3] = &unk_1E70F5F20;
  v12 = v7;
  v16 = v12;
  objc_msgSend(v11, "then:", v15);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

id __63__EMSectionedMessageList_messageListItemForItemID_ifAvailable___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "sectionID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[EMSectionedMessageListObjectConverter messageListItemForMessageListItem:inSection:](EMSectionedMessageListObjectConverter, "messageListItemForMessageListItem:inSection:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D1EEC0], "futureWithResult:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)messageListItemsForItemIDs:(id)a3
{
  void *v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  _QWORD v10[5];
  id v11;

  -[EMSectionedMessageList _itemIDsGroupedBySection:](self, "_itemIDsGroupedBySection:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __53__EMSectionedMessageList_messageListItemsForItemIDs___block_invoke;
  v10[3] = &unk_1E70F5F48;
  v10[4] = self;
  v6 = v5;
  v11 = v6;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v10);
  v7 = v11;
  v8 = v6;

  return v8;
}

void __53__EMSectionedMessageList_messageListItemsForItemIDs___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v16[4];
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v15 = a3;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "messageListItemsForItemIDs:", v15);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v8 = v7;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v19;
    v11 = MEMORY[0x1E0C809B0];
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v19 != v10)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v12);
        v16[0] = v11;
        v16[1] = 3221225472;
        v16[2] = __53__EMSectionedMessageList_messageListItemsForItemIDs___block_invoke_2;
        v16[3] = &unk_1E70F5F20;
        v17 = v5;
        objc_msgSend(v13, "then:", v16);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "addObject:", v14);

        ++v12;
      }
      while (v9 != v12);
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v9);
  }

}

id __53__EMSectionedMessageList_messageListItemsForItemIDs___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;

  +[EMSectionedMessageListObjectConverter messageListItemForMessageListItem:inSection:](EMSectionedMessageListObjectConverter, "messageListItemForMessageListItem:inSection:", a2, *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D1EEC0], "futureWithResult:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)messageListItemsForItemIDs:(id)a3 ifAvailable:(BOOL)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v12[5];
  id v13;
  BOOL v14;

  -[EMSectionedMessageList _itemIDsGroupedBySection:](self, "_itemIDsGroupedBySection:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __65__EMSectionedMessageList_messageListItemsForItemIDs_ifAvailable___block_invoke;
  v12[3] = &unk_1E70F5F70;
  v12[4] = self;
  v14 = a4;
  v8 = v7;
  v13 = v8;
  objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v12);
  v9 = v13;
  v10 = v8;

  return v10;
}

void __65__EMSectionedMessageList_messageListItemsForItemIDs_ifAvailable___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v16[4];
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v15 = a3;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "messageListItemsForItemIDs:ifAvailable:", v15, *(unsigned __int8 *)(a1 + 48));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v8 = v7;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v19;
    v11 = MEMORY[0x1E0C809B0];
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v19 != v10)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v12);
        v16[0] = v11;
        v16[1] = 3221225472;
        v16[2] = __65__EMSectionedMessageList_messageListItemsForItemIDs_ifAvailable___block_invoke_2;
        v16[3] = &unk_1E70F5F20;
        v17 = v5;
        objc_msgSend(v13, "then:", v16);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "addObject:", v14);

        ++v12;
      }
      while (v9 != v12);
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v9);
  }

}

id __65__EMSectionedMessageList_messageListItemsForItemIDs_ifAvailable___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;

  +[EMSectionedMessageListObjectConverter messageListItemForMessageListItem:inSection:](EMSectionedMessageListObjectConverter, "messageListItemForMessageListItem:inSection:", a2, *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D1EEC0], "futureWithResult:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)itemIDOfMessageListItemWithDisplayMessage:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  -[EMSectionedMessageList _sectionedMessageListItemForMessageListItem:](self, "_sectionedMessageListItemForMessageListItem:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "sectionID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[EMSectionedMessageList objectForKeyedSubscript:](self, "objectForKeyedSubscript:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "underlyingItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "itemIDOfMessageListItemWithDisplayMessage:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "sectionID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[EMSectionedMessageListObjectConverter itemIDForItemID:inSection:](EMSectionedMessageListObjectConverter, "itemIDForItemID:inSection:", v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)itemIDOfFirstMessageListItemMatchingPredicate:(id)a3
{
  id v4;
  EFOrderedDictionary *sections;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__13;
  v16 = __Block_byref_object_dispose__13;
  v17 = 0;
  sections = self->_sections;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __72__EMSectionedMessageList_itemIDOfFirstMessageListItemMatchingPredicate___block_invoke;
  v9[3] = &unk_1E70F5DC8;
  v10 = v4;
  v11 = &v12;
  v6 = v4;
  -[EFOrderedDictionary enumerateKeysAndObjectsUsingBlock:](sections, "enumerateKeysAndObjectsUsingBlock:", v9);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __72__EMSectionedMessageList_itemIDOfFirstMessageListItemMatchingPredicate___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4, _BYTE *a5)
{
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;

  v13 = a3;
  v8 = a4;
  objc_msgSend(v8, "itemIDOfFirstMessageListItemMatchingPredicate:", *(_QWORD *)(a1 + 32));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    +[EMSectionedMessageListObjectConverter itemIDForItemID:inSection:](EMSectionedMessageListObjectConverter, "itemIDForItemID:inSection:", v9, v13);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v10;

    *a5 = 1;
  }

}

- (void)invalidateCacheForItemIDs:(id)a3
{
  id v4;
  _QWORD v5[5];

  -[EMSectionedMessageList _itemIDsGroupedBySection:](self, "_itemIDsGroupedBySection:", a3);
  v5[1] = 3221225472;
  v5[2] = __52__EMSectionedMessageList_invalidateCacheForItemIDs___block_invoke;
  v5[3] = &unk_1E70F5EF8;
  v5[4] = self;
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v5);

}

void __52__EMSectionedMessageList_invalidateCacheForItemIDs___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;

  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "invalidateCacheForItemIDs:", v6);

}

- (void)collection:(id)a3 addedItemIDs:(id)a4 after:(id)a5
{
  id v9;
  id v10;
  id v11;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  -[EMSectionedMessageList doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __assert_rtn("-[EMSectionedMessageList collection:addedItemIDs:after:]", "EMSectionedMessageList.m", 399, "0");
}

- (void)collection:(id)a3 addedItemIDs:(id)a4 before:(id)a5
{
  id v9;
  id v10;
  id v11;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  -[EMSectionedMessageList doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __assert_rtn("-[EMSectionedMessageList collection:addedItemIDs:before:]", "EMSectionedMessageList.m", 403, "0");
}

- (void)collection:(id)a3 addedItemIDs:(id)a4 toThreadWithItemID:(id)a5 after:(id)a6 unreadItemIDs:(id)a7
{
  -[EMSectionedMessageList _collection:addedItemIDs:toThreadWithItemID:before:existingItemID:unreadItemIDs:](self, "_collection:addedItemIDs:toThreadWithItemID:before:existingItemID:unreadItemIDs:", a3, a4, a5, 0, a6, a7);
}

- (void)collection:(id)a3 addedItemIDs:(id)a4 toThreadWithItemID:(id)a5 before:(id)a6 unreadItemIDs:(id)a7
{
  -[EMSectionedMessageList _collection:addedItemIDs:toThreadWithItemID:before:existingItemID:unreadItemIDs:](self, "_collection:addedItemIDs:toThreadWithItemID:before:existingItemID:unreadItemIDs:", a3, a4, a5, 1, a6, a7);
}

- (void)_collection:(id)a3 addedItemIDs:(id)a4 toThreadWithItemID:(id)a5 before:(BOOL)a6 existingItemID:(id)a7 unreadItemIDs:(id)a8
{
  _BOOL8 v9;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  _QWORD *v18;
  BOOL v19;
  _QWORD v20[5];
  id v21;

  v9 = a6;
  v14 = a8;
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x3032000000;
  v20[3] = __Block_byref_object_copy__13;
  v20[4] = __Block_byref_object_dispose__13;
  v21 = 0;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __106__EMSectionedMessageList__collection_addedItemIDs_toThreadWithItemID_before_existingItemID_unreadItemIDs___block_invoke;
  v16[3] = &unk_1E70F5F98;
  v17 = v14;
  v18 = v20;
  v16[4] = self;
  v19 = v9;
  v15 = v14;
  -[EMSectionedMessageList _collection:addedItemIDs:toThreadWithItemID:before:existingItemID:notifyObserverBlock:](self, "_collection:addedItemIDs:toThreadWithItemID:before:existingItemID:notifyObserverBlock:", a3, a4, a5, v9, a7, v16);

  _Block_object_dispose(v20, 8);
}

uint64_t __106__EMSectionedMessageList__collection_addedItemIDs_toThreadWithItemID_before_existingItemID_unreadItemIDs___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  char v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;

  v11 = a2;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = objc_opt_respondsToSelector();
  if ((v16 & 1) != 0)
  {
    if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
    {
      objc_msgSend(*(id *)(a1 + 32), "_boxItemIDsForItemIDs:inSection:", *(_QWORD *)(a1 + 40), v15);
      v17 = objc_claimAutoreleasedReturnValue();
      v18 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v19 = *(void **)(v18 + 40);
      *(_QWORD *)(v18 + 40) = v17;

    }
    v20 = *(_QWORD *)(a1 + 32);
    v21 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    if (*(_BYTE *)(a1 + 56))
      objc_msgSend(v11, "collection:addedItemIDs:toThreadWithItemID:before:unreadItemIDs:", v20, v12, v13, v14, v21);
    else
      objc_msgSend(v11, "collection:addedItemIDs:toThreadWithItemID:after:unreadItemIDs:", v20, v12, v13, v14, v21);
  }

  return v16 & 1;
}

- (void)_collection:(id)a3 addedItemIDs:(id)a4 toThreadWithItemID:(id)a5 before:(BOOL)a6 existingItemID:(id)a7 notifyObserverBlock:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  unint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  id v26;
  void *v27;
  id v28;
  id v29;
  id v30;
  _QWORD v31[5];
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  BOOL v37;

  v14 = a3;
  v15 = a4;
  v30 = a5;
  v16 = a7;
  v17 = a8;
  v18 = -[EMSectionedMessageList _sectionIndexForCollection:](self, "_sectionIndexForCollection:", v14);
  if (v18 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v28 = v16;
    v29 = v15;
    -[EFOrderedDictionary keyAtIndex:](self->_sections, "keyAtIndex:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[EMSectionedMessageList _boxItemIDsForItemIDs:inSection:](self, "_boxItemIDsForItemIDs:inSection:", v15, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[EMSectionedMessageList _boxItemIDForItemID:inSection:](self, "_boxItemIDForItemID:inSection:", v30, v19);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[EMSectionedMessageList _boxItemIDForItemID:inSection:](self, "_boxItemIDForItemID:inSection:", v16, v19);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[EMSectionedMessageList observerScheduler](self, "observerScheduler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = __112__EMSectionedMessageList__collection_addedItemIDs_toThreadWithItemID_before_existingItemID_notifyObserverBlock___block_invoke;
    v31[3] = &unk_1E70F5FC0;
    v31[4] = self;
    v36 = v17;
    v23 = v20;
    v32 = v23;
    v24 = v21;
    v33 = v24;
    v25 = v27;
    v34 = v25;
    v26 = v19;
    v35 = v26;
    v37 = a6;
    objc_msgSend(v22, "performBlock:", v31);

    v16 = v28;
    v15 = v29;
  }

}

void __112__EMSectionedMessageList__collection_addedItemIDs_toThreadWithItemID_before_existingItemID_notifyObserverBlock___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v12 != v4)
          objc_enumerationMutation(v2);
        v6 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        v7 = *(_QWORD *)(a1 + 72);
        if (!v7
          || ((*(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))(v7 + 16))(v7, *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64)) & 1) == 0)
        {
          v8 = *(_QWORD *)(a1 + 32);
          v9 = *(_QWORD *)(a1 + 40);
          v10 = *(_QWORD *)(a1 + 56);
          if (*(_BYTE *)(a1 + 80))
            objc_msgSend(v6, "collection:addedItemIDs:before:", v8, v9, v10);
          else
            objc_msgSend(v6, "collection:addedItemIDs:after:", v8, v9, v10, (_QWORD)v11);
        }
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v3);
  }

}

- (void)collection:(id)a3 movedItemIDs:(id)a4 after:(id)a5
{
  -[EMSectionedMessageList _collection:movedItemIDs:before:existingItemID:](self, "_collection:movedItemIDs:before:existingItemID:", a3, a4, 0, a5);
}

- (void)collection:(id)a3 movedItemIDs:(id)a4 before:(id)a5
{
  -[EMSectionedMessageList _collection:movedItemIDs:before:existingItemID:](self, "_collection:movedItemIDs:before:existingItemID:", a3, a4, 1, a5);
}

- (void)_collection:(id)a3 movedItemIDs:(id)a4 before:(BOOL)a5 existingItemID:(id)a6
{
  id v10;
  id v11;
  id v12;
  unint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  _QWORD v20[5];
  id v21;
  id v22;
  BOOL v23;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  v13 = -[EMSectionedMessageList _sectionIndexForCollection:](self, "_sectionIndexForCollection:", v10);
  if (v13 != 0x7FFFFFFFFFFFFFFFLL)
  {
    -[EFOrderedDictionary keyAtIndex:](self->_sections, "keyAtIndex:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[EMSectionedMessageList _boxItemIDsForItemIDs:inSection:](self, "_boxItemIDsForItemIDs:inSection:", v11, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[EMSectionedMessageList _boxItemIDForItemID:inSection:](self, "_boxItemIDForItemID:inSection:", v12, v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[EMSectionedMessageList observerScheduler](self, "observerScheduler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __73__EMSectionedMessageList__collection_movedItemIDs_before_existingItemID___block_invoke;
    v20[3] = &unk_1E70F34E0;
    v20[4] = self;
    v23 = a5;
    v18 = v15;
    v21 = v18;
    v19 = v16;
    v22 = v19;
    objc_msgSend(v17, "performBlock:", v20);

  }
}

void __73__EMSectionedMessageList__collection_movedItemIDs_before_existingItemID___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v11 != v4)
          objc_enumerationMutation(v2);
        v6 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
        v7 = *(_QWORD *)(a1 + 32);
        v8 = *(_QWORD *)(a1 + 40);
        v9 = *(_QWORD *)(a1 + 48);
        if (*(_BYTE *)(a1 + 56))
          objc_msgSend(v6, "collection:movedItemIDs:before:", v7, v8, v9);
        else
          objc_msgSend(v6, "collection:movedItemIDs:after:", v7, v8, v9, (_QWORD)v10);
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v3);
  }

}

- (void)collection:(id)a3 changedItemIDs:(id)a4
{
  id v7;
  id v8;

  v7 = a3;
  v8 = a4;
  -[EMSectionedMessageList doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __assert_rtn("-[EMSectionedMessageList collection:changedItemIDs:]", "EMSectionedMessageList.m", 486, "0");
}

- (void)collection:(id)a3 changedItemIDs:(id)a4 itemIDsWithCountChanges:(id)a5
{
  id v8;
  id v9;
  id v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  _QWORD v18[5];
  id v19;
  id v20;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = -[EMSectionedMessageList _sectionIndexForCollection:](self, "_sectionIndexForCollection:", v8);
  if (v11 != 0x7FFFFFFFFFFFFFFFLL)
  {
    -[EFOrderedDictionary keyAtIndex:](self->_sections, "keyAtIndex:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[EMSectionedMessageList _boxItemIDsForItemIDs:inSection:](self, "_boxItemIDsForItemIDs:inSection:", v9, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[EMSectionedMessageList _boxItemIDsForItemIDs:inSection:](self, "_boxItemIDsForItemIDs:inSection:", v10, v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[EMSectionedMessageList observerScheduler](self, "observerScheduler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __76__EMSectionedMessageList_collection_changedItemIDs_itemIDsWithCountChanges___block_invoke;
    v18[3] = &unk_1E70F2158;
    v18[4] = self;
    v16 = v13;
    v19 = v16;
    v17 = v14;
    v20 = v17;
    objc_msgSend(v15, "performBlock:", v18);

  }
}

void __76__EMSectionedMessageList_collection_changedItemIDs_itemIDsWithCountChanges___block_invoke(_QWORD *a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = *(id *)(a1[4] + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v11;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v11 != v4)
          objc_enumerationMutation(v2);
        v6 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * v5);
        v7 = objc_opt_respondsToSelector();
        v8 = a1[4];
        v9 = a1[5];
        if ((v7 & 1) != 0)
          objc_msgSend(v6, "collection:changedItemIDs:itemIDsWithCountChanges:", v8, v9, a1[6]);
        else
          objc_msgSend(v6, "collection:changedItemIDs:", v8, v9, (_QWORD)v10);
        ++v5;
      }
      while (v3 != v5);
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v3);
  }

}

- (void)collection:(id)a3 deletedItemIDs:(id)a4
{
  id v6;
  id v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[5];
  id v14;

  v6 = a3;
  v7 = a4;
  v8 = -[EMSectionedMessageList _sectionIndexForCollection:](self, "_sectionIndexForCollection:", v6);
  if (v8 != 0x7FFFFFFFFFFFFFFFLL)
  {
    -[EFOrderedDictionary keyAtIndex:](self->_sections, "keyAtIndex:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[EMSectionedMessageList _boxItemIDsForItemIDs:inSection:](self, "_boxItemIDsForItemIDs:inSection:", v7, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[EMSectionedMessageList observerScheduler](self, "observerScheduler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __52__EMSectionedMessageList_collection_deletedItemIDs___block_invoke;
    v13[3] = &unk_1E70F2070;
    v13[4] = self;
    v12 = v10;
    v14 = v12;
    objc_msgSend(v11, "performBlock:", v13);

  }
}

void __52__EMSectionedMessageList_collection_deletedItemIDs___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  _BYTE v10[128];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v6 = 0u;
  v7 = 0u;
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v7;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v7 != v4)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v6 + 1) + 8 * v5++), "collection:deletedItemIDs:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), (_QWORD)v6);
      }
      while (v3 != v5);
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
    }
    while (v3);
  }

}

- (void)collection:(id)a3 replacedExistingItemID:(id)a4 withNewItemID:(id)a5
{
  id v8;
  id v9;
  id v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  _QWORD v18[5];
  id v19;
  id v20;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = -[EMSectionedMessageList _sectionIndexForCollection:](self, "_sectionIndexForCollection:", v8);
  if (v11 != 0x7FFFFFFFFFFFFFFFLL)
  {
    -[EFOrderedDictionary keyAtIndex:](self->_sections, "keyAtIndex:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[EMSectionedMessageList _boxItemIDForItemID:inSection:](self, "_boxItemIDForItemID:inSection:", v9, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[EMSectionedMessageList _boxItemIDForItemID:inSection:](self, "_boxItemIDForItemID:inSection:", v10, v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[EMSectionedMessageList observerScheduler](self, "observerScheduler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __74__EMSectionedMessageList_collection_replacedExistingItemID_withNewItemID___block_invoke;
    v18[3] = &unk_1E70F2158;
    v18[4] = self;
    v16 = v13;
    v19 = v16;
    v17 = v14;
    v20 = v17;
    objc_msgSend(v15, "performBlock:", v18);

  }
}

void __74__EMSectionedMessageList_collection_replacedExistingItemID_withNewItemID___block_invoke(_QWORD *a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  _BYTE v10[128];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v6 = 0u;
  v7 = 0u;
  v2 = *(id *)(a1[4] + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v7;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v7 != v4)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v6 + 1) + 8 * v5++), "collection:replacedExistingItemID:withNewItemID:", a1[4], a1[5], a1[6], (_QWORD)v6);
      }
      while (v3 != v5);
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
    }
    while (v3);
  }

}

- (void)collection:(id)a3 didFinishInitialLoadForThreadWithItemID:(id)a4
{
  id v6;
  id v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[5];
  id v14;

  v6 = a3;
  v7 = a4;
  v8 = -[EMSectionedMessageList _sectionIndexForCollection:](self, "_sectionIndexForCollection:", v6);
  if (v8 != 0x7FFFFFFFFFFFFFFFLL)
  {
    -[EFOrderedDictionary keyAtIndex:](self->_sections, "keyAtIndex:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[EMSectionedMessageList _boxItemIDForItemID:inSection:](self, "_boxItemIDForItemID:inSection:", v7, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[EMSectionedMessageList observerScheduler](self, "observerScheduler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __77__EMSectionedMessageList_collection_didFinishInitialLoadForThreadWithItemID___block_invoke;
    v13[3] = &unk_1E70F2070;
    v13[4] = self;
    v12 = v10;
    v14 = v12;
    objc_msgSend(v11, "performBlock:", v13);

  }
}

void __77__EMSectionedMessageList_collection_didFinishInitialLoadForThreadWithItemID___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v7 = 0u;
  v8 = 0u;
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v8;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v2);
        v6 = *(void **)(*((_QWORD *)&v7 + 1) + 8 * v5);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v6, "collection:didFinishInitialLoadForThreadWithItemID:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), (_QWORD)v7);
        ++v5;
      }
      while (v3 != v5);
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v3);
  }

}

- (void)collection:(id)a3 oldestItemsUpdatedForMailboxes:(id)a4
{
  id v6;
  id v7;
  unint64_t v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[5];
  id v16;
  _QWORD v17[5];
  id v18;

  v6 = a3;
  v7 = a4;
  v8 = -[EMSectionedMessageList _sectionIndexForCollection:](self, "_sectionIndexForCollection:", v6);
  if (v8 != 0x7FFFFFFFFFFFFFFFLL)
  {
    -[EFOrderedDictionary keyAtIndex:](self->_sections, "keyAtIndex:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = MEMORY[0x1E0C809B0];
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __68__EMSectionedMessageList_collection_oldestItemsUpdatedForMailboxes___block_invoke;
    v17[3] = &unk_1E70F5FE8;
    v17[4] = self;
    v11 = v9;
    v18 = v11;
    objc_msgSend(v7, "ef_mapValues:", v17);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[EMSectionedMessageList observerScheduler](self, "observerScheduler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = v10;
    v15[1] = 3221225472;
    v15[2] = __68__EMSectionedMessageList_collection_oldestItemsUpdatedForMailboxes___block_invoke_2;
    v15[3] = &unk_1E70F2070;
    v15[4] = self;
    v14 = v12;
    v16 = v14;
    objc_msgSend(v13, "performBlock:", v15);

  }
}

id __68__EMSectionedMessageList_collection_oldestItemsUpdatedForMailboxes___block_invoke(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "_boxItemIDForItemID:inSection:", a2, *(_QWORD *)(a1 + 40));
  return (id)objc_claimAutoreleasedReturnValue();
}

void __68__EMSectionedMessageList_collection_oldestItemsUpdatedForMailboxes___block_invoke_2(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v7 = 0u;
  v8 = 0u;
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v8;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v2);
        v6 = *(void **)(*((_QWORD *)&v7 + 1) + 8 * v5);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v6, "collection:oldestItemsUpdatedForMailboxes:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), (_QWORD)v7);
        ++v5;
      }
      while (v3 != v5);
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v3);
  }

}

- (void)collection:(id)a3 shouldHighlightSnippetHints:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _QWORD v9[5];
  id v10;

  v6 = a3;
  v7 = a4;
  if (-[EMSectionedMessageList _sectionIndexForCollection:](self, "_sectionIndexForCollection:", v6) != 0x7FFFFFFFFFFFFFFFLL)
  {
    -[EMSectionedMessageList observerScheduler](self, "observerScheduler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __65__EMSectionedMessageList_collection_shouldHighlightSnippetHints___block_invoke;
    v9[3] = &unk_1E70F2070;
    v9[4] = self;
    v10 = v7;
    objc_msgSend(v8, "performBlock:", v9);

  }
}

void __65__EMSectionedMessageList_collection_shouldHighlightSnippetHints___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v7 = 0u;
  v8 = 0u;
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v8;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v2);
        v6 = *(void **)(*((_QWORD *)&v7 + 1) + 8 * v5);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v6, "collection:shouldHighlightSnippetHints:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), (_QWORD)v7);
        ++v5;
      }
      while (v3 != v5);
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v3);
  }

}

- (void)collectionDidFinishInitialLoad:(id)a3
{
  id v4;
  unint64_t v5;
  void *v6;
  EFLocked *sectionsAwaitingInitialLoad;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v12[5];
  id v13;
  _QWORD *v14;
  _QWORD v15[4];
  id v16;
  _QWORD *v17;
  _QWORD v18[3];
  char v19;

  v4 = a3;
  v5 = -[EMSectionedMessageList _sectionIndexForCollection:](self, "_sectionIndexForCollection:", v4);
  if (v5 != 0x7FFFFFFFFFFFFFFFLL)
  {
    -[EFOrderedDictionary keyAtIndex:](self->_sections, "keyAtIndex:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = 0;
    v18[1] = v18;
    v18[2] = 0x2020000000;
    v19 = 0;
    sectionsAwaitingInitialLoad = self->_sectionsAwaitingInitialLoad;
    v8 = MEMORY[0x1E0C809B0];
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __57__EMSectionedMessageList_collectionDidFinishInitialLoad___block_invoke;
    v15[3] = &unk_1E70F6010;
    v9 = v6;
    v16 = v9;
    v17 = v18;
    -[EFLocked performWhileLocked:](sectionsAwaitingInitialLoad, "performWhileLocked:", v15);
    -[EMSectionedMessageList observerScheduler](self, "observerScheduler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = v8;
    v12[1] = 3221225472;
    v12[2] = __57__EMSectionedMessageList_collectionDidFinishInitialLoad___block_invoke_2;
    v12[3] = &unk_1E70F6038;
    v12[4] = self;
    v11 = v9;
    v13 = v11;
    v14 = v18;
    objc_msgSend(v10, "performBlock:", v12);

    _Block_object_dispose(v18, 8);
  }

}

void __57__EMSectionedMessageList_collectionDidFinishInitialLoad___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_msgSend(v3, "removeObject:", *(_QWORD *)(a1 + 32));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v3, "count") == 0;

}

void __57__EMSectionedMessageList_collectionDidFinishInitialLoad___block_invoke_2(_QWORD *a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v7 = 0u;
  v8 = 0u;
  v2 = *(id *)(a1[4] + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v8;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v2);
        v6 = *(void **)(*((_QWORD *)&v7 + 1) + 8 * i);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v6, "collection:didFinishInitialLoadOfSection:", a1[4], a1[5], (_QWORD)v7);
        if (*(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) && (objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v6, "collectionDidFinishInitialLoad:", a1[4]);
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v3);
  }

}

- (void)didFinishRecoveryForCollection:(id)a3
{
  id v4;
  unint64_t v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  char v13;

  v4 = a3;
  v5 = -[EMSectionedMessageList _sectionIndexForCollection:](self, "_sectionIndexForCollection:", v4);
  if (v5 != 0x7FFFFFFFFFFFFFFFLL)
  {
    -[EFOrderedDictionary keyAtIndex:](self->_sections, "keyAtIndex:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[EFOrderedDictionary allValues](self->_sections, "allValues");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "ef_any:", &__block_literal_global_46);

    -[EMSectionedMessageList observerScheduler](self, "observerScheduler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __57__EMSectionedMessageList_didFinishRecoveryForCollection___block_invoke_2;
    v11[3] = &unk_1E70F6060;
    v11[4] = self;
    v10 = v6;
    v12 = v10;
    v13 = v8 ^ 1;
    objc_msgSend(v9, "performBlock:", v11);

  }
}

uint64_t __57__EMSectionedMessageList_didFinishRecoveryForCollection___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isRecovering");
}

void __57__EMSectionedMessageList_didFinishRecoveryForCollection___block_invoke_2(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v7 = 0u;
  v8 = 0u;
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v8;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v2);
        v6 = *(void **)(*((_QWORD *)&v7 + 1) + 8 * i);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v6, "collection:didFinishRecoveryForSection:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), (_QWORD)v7);
        if (*(_BYTE *)(a1 + 48) && (objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v6, "didFinishRecoveryForCollection:", *(_QWORD *)(a1 + 32));
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v3);
  }

}

- (void)didFinishRemoteSearchForCollection:(id)a3
{
  id v4;
  unint64_t v5;
  void *v6;
  EFLocked *sectionsAwaitingRemoteSearch;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v12[5];
  id v13;
  _QWORD *v14;
  _QWORD v15[4];
  id v16;
  _QWORD *v17;
  _QWORD v18[3];
  char v19;

  v4 = a3;
  v5 = -[EMSectionedMessageList _sectionIndexForCollection:](self, "_sectionIndexForCollection:", v4);
  if (v5 != 0x7FFFFFFFFFFFFFFFLL)
  {
    -[EFOrderedDictionary keyAtIndex:](self->_sections, "keyAtIndex:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = 0;
    v18[1] = v18;
    v18[2] = 0x2020000000;
    v19 = 0;
    sectionsAwaitingRemoteSearch = self->_sectionsAwaitingRemoteSearch;
    v8 = MEMORY[0x1E0C809B0];
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __61__EMSectionedMessageList_didFinishRemoteSearchForCollection___block_invoke;
    v15[3] = &unk_1E70F6010;
    v9 = v6;
    v16 = v9;
    v17 = v18;
    -[EFLocked performWhileLocked:](sectionsAwaitingRemoteSearch, "performWhileLocked:", v15);
    -[EMSectionedMessageList observerScheduler](self, "observerScheduler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = v8;
    v12[1] = 3221225472;
    v12[2] = __61__EMSectionedMessageList_didFinishRemoteSearchForCollection___block_invoke_2;
    v12[3] = &unk_1E70F6038;
    v12[4] = self;
    v11 = v9;
    v13 = v11;
    v14 = v18;
    objc_msgSend(v10, "performBlock:", v12);

    _Block_object_dispose(v18, 8);
  }

}

void __61__EMSectionedMessageList_didFinishRemoteSearchForCollection___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_msgSend(v3, "removeObject:", *(_QWORD *)(a1 + 32));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v3, "count") == 0;

}

void __61__EMSectionedMessageList_didFinishRemoteSearchForCollection___block_invoke_2(_QWORD *a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v7 = 0u;
  v8 = 0u;
  v2 = *(id *)(a1[4] + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v8;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v2);
        v6 = *(void **)(*((_QWORD *)&v7 + 1) + 8 * i);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v6, "collection:didFinishRemoteSearchForSection:", a1[4], a1[5], (_QWORD)v7);
        if (*(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) && (objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v6, "didFinishRemoteSearchForCollection:", a1[4]);
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v3);
  }

}

- (void)setUnfilteredMessageList:(id)a3
{
  objc_storeStrong((id *)&self->_unfilteredMessageList, a3);
}

- (EFScheduler)observerScheduler
{
  return self->_observerScheduler;
}

- (NSPredicate)filterPredicate
{
  return self->_filterPredicate;
}

- (void)setFilterPredicate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filterPredicate, 0);
  objc_storeStrong((id *)&self->_observerScheduler, 0);
  objc_storeStrong((id *)&self->_unfilteredMessageList, 0);
  objc_storeStrong((id *)&self->_changeObservers, 0);
  objc_storeStrong((id *)&self->_sectionsAwaitingRemoteSearch, 0);
  objc_storeStrong((id *)&self->_sectionsAwaitingInitialLoad, 0);
  objc_storeStrong((id *)&self->_sections, 0);
}

@end
