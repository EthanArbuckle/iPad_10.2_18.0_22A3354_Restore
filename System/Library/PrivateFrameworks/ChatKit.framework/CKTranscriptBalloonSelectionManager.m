@implementation CKTranscriptBalloonSelectionManager

- (CKTranscriptBalloonSelectionManager)init
{
  CKTranscriptBalloonSelectionManager *v2;
  uint64_t v3;
  NSMutableOrderedSet *selectedMessageGuids;
  uint64_t v5;
  NSMutableDictionary *selectedStates;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CKTranscriptBalloonSelectionManager;
  v2 = -[CKTranscriptBalloonSelectionManager init](&v8, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
    v3 = objc_claimAutoreleasedReturnValue();
    selectedMessageGuids = v2->_selectedMessageGuids;
    v2->_selectedMessageGuids = (NSMutableOrderedSet *)v3;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v5 = objc_claimAutoreleasedReturnValue();
    selectedStates = v2->_selectedStates;
    v2->_selectedStates = (NSMutableDictionary *)v5;

  }
  return v2;
}

- (id)_chatItemForGUID:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[CKTranscriptBalloonSelectionManager chatItems](self, "chatItems");
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "IMChatItem", (_QWORD)v14);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "guid");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v4, "isEqualToString:", v11);

        if ((v12 & 1) != 0)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (NSArray)chatItems
{
  void *v3;
  void *v4;

  -[CKTranscriptBalloonSelectionManager dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "selectionManagerChatItems:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

- (int64_t)indexOfGuid:(id)a3 inChatItems:(id)a4
{
  id v5;
  id v6;
  id v7;
  int64_t v8;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;

  v5 = a3;
  v6 = a4;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0x7FFFFFFFFFFFFFFFLL;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __63__CKTranscriptBalloonSelectionManager_indexOfGuid_inChatItems___block_invoke;
  v10[3] = &unk_1E274C218;
  v7 = v5;
  v11 = v7;
  v12 = &v13;
  objc_msgSend(v6, "enumerateObjectsWithOptions:usingBlock:", 2, v10);
  v8 = v14[3];

  _Block_object_dispose(&v13, 8);
  return v8;
}

void __63__CKTranscriptBalloonSelectionManager_indexOfGuid_inChatItems___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  id v8;

  objc_msgSend(a2, "IMChatItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "guid");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "isEqualToString:", *(_QWORD *)(a1 + 32)))
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a3;
    *a4 = 1;
  }

}

- (void)addSelectedMessageGuid:(id)a3 selectionState:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int64_t v9;
  int64_t v10;
  void *v11;
  NSMutableOrderedSet *selectedMessageGuids;
  id v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t (*v19)(uint64_t, uint64_t, uint64_t, _BYTE *);
  void *v20;
  CKTranscriptBalloonSelectionManager *v21;
  id v22;
  id v23;
  id v24;
  uint64_t *v25;
  int64_t v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  char v30;

  v6 = a3;
  v7 = a4;
  if (v6)
  {
    -[CKTranscriptBalloonSelectionManager chatItems](self, "chatItems");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[CKTranscriptBalloonSelectionManager indexOfGuid:inChatItems:](self, "indexOfGuid:inChatItems:", v6, v8);
    if (v9 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v10 = v9;
      objc_msgSend(v8, "objectAtIndexedSubscript:", v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v11, "canBeSelectedInEditMode"))
      {
        v27 = 0;
        v28 = &v27;
        v29 = 0x2020000000;
        v30 = 0;
        selectedMessageGuids = self->_selectedMessageGuids;
        v17 = MEMORY[0x1E0C809B0];
        v18 = 3221225472;
        v19 = __77__CKTranscriptBalloonSelectionManager_addSelectedMessageGuid_selectionState___block_invoke;
        v20 = &unk_1E27592A8;
        v21 = self;
        v22 = v8;
        v26 = v10;
        v13 = v6;
        v23 = v13;
        v14 = v7;
        v24 = v14;
        v25 = &v27;
        -[NSMutableOrderedSet enumerateObjectsUsingBlock:](selectedMessageGuids, "enumerateObjectsUsingBlock:", &v17);
        if (!*((_BYTE *)v28 + 24))
        {
          -[NSMutableOrderedSet addObject:](self->_selectedMessageGuids, "addObject:", v13, v17, v18, v19, v20, v21, v22, v23);
          -[NSMutableDictionary setObject:forKey:](self->_selectedStates, "setObject:forKey:", v14, v13);
        }
        -[CKTranscriptBalloonSelectionManager delegate](self, "delegate", v17, v18, v19, v20, v21);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[CKTranscriptBalloonSelectionManager _chatItemForGUID:](self, "_chatItemForGUID:", v13);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "selectionManager:didAddChatItem:selectionState:", self, v16, v14);

        _Block_object_dispose(&v27, 8);
      }

    }
  }

}

unint64_t __77__CKTranscriptBalloonSelectionManager_addSelectedMessageGuid_selectionState___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  unint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "indexOfGuid:inChatItems:", a2, *(_QWORD *)(a1 + 40));
  if (result != 0x7FFFFFFFFFFFFFFFLL && *(_QWORD *)(a1 + 72) < result)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "insertObject:atIndex:", *(_QWORD *)(a1 + 48), a3);
    result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "setObject:forKey:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48));
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

- (void)removeSelectedMessageGuid:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  if (objc_msgSend(v8, "length"))
  {
    -[CKTranscriptBalloonSelectionManager selectedMessageGuids](self, "selectedMessageGuids");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeObject:", v8);

    -[CKTranscriptBalloonSelectionManager selectedStates](self, "selectedStates");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeObjectForKey:", v8);

    -[CKTranscriptBalloonSelectionManager delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKTranscriptBalloonSelectionManager _chatItemForGUID:](self, "_chatItemForGUID:", v8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "selectionManager:didRemoveChatItem:", self, v7);

  }
}

- (void)removeAllSelectedMessageGuids
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  -[CKTranscriptBalloonSelectionManager setTrackedGuid:](self, "setTrackedGuid:", 0);
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[CKTranscriptBalloonSelectionManager selectedMessageGuids](self, "selectedMessageGuids", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v15;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v15 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v7);
        -[CKTranscriptBalloonSelectionManager delegate](self, "delegate");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[CKTranscriptBalloonSelectionManager _chatItemForGUID:](self, "_chatItemForGUID:", v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "selectionManager:didRemoveChatItem:", self, v10);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v5);
  }

  -[CKTranscriptBalloonSelectionManager selectedMessageGuids](self, "selectedMessageGuids");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "removeAllObjects");

  -[CKTranscriptBalloonSelectionManager selectedStates](self, "selectedStates");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "removeAllObjects");

  -[CKTranscriptBalloonSelectionManager delegate](self, "delegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "selectionManagerDidRemoveAllSelectedChatItems:", self);

}

- (BOOL)isMessageGuidSelected:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;

  v4 = a3;
  -[CKTranscriptBalloonSelectionManager selectedMessageGuids](self, "selectedMessageGuids");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "containsObject:", v4) & 1) != 0)
  {
    v6 = 1;
  }
  else
  {
    -[CKTranscriptBalloonSelectionManager trackedGuid](self, "trackedGuid");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v7, "isEqualToString:", v4);

  }
  return v6;
}

- (unint64_t)selectedGuidCount
{
  void *v2;
  unint64_t v3;

  -[CKTranscriptBalloonSelectionManager selectedMessageGuids](self, "selectedMessageGuids");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (id)selectedGuidAtIndex:(unint64_t)a3
{
  void *v4;
  void *v5;

  -[CKTranscriptBalloonSelectionManager selectedMessageGuids](self, "selectedMessageGuids");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndex:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)removeAllSelectedMessageGuidsExceptTrackedGuid
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  -[CKTranscriptBalloonSelectionManager trackedGuid](self, "trackedGuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  -[CKTranscriptBalloonSelectionManager selectedMessageGuids](self, "selectedMessageGuids");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v21 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        if ((objc_msgSend(v10, "isEqualToString:", v3) & 1) == 0)
          objc_msgSend(v4, "addObject:", v10);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    }
    while (v7);
  }

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v11 = v4;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v17;
    do
    {
      for (j = 0; j != v13; ++j)
      {
        if (*(_QWORD *)v17 != v14)
          objc_enumerationMutation(v11);
        -[CKTranscriptBalloonSelectionManager removeSelectedMessageGuid:](self, "removeSelectedMessageGuid:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * j), (_QWORD)v16);
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
    }
    while (v13);
  }

}

- (void)trackSelectedGuid:(id)a3 selectionState:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  v7 = a3;
  -[CKTranscriptBalloonSelectionManager setTrackedGuid:](self, "setTrackedGuid:", v7);
  -[CKTranscriptBalloonSelectionManager addSelectedMessageGuid:selectionState:](self, "addSelectedMessageGuid:selectionState:", v7, v6);

}

- (id)selectedStateForGuid:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  if (a3)
  {
    v4 = a3;
    -[CKTranscriptBalloonSelectionManager selectedStates](self, "selectedStates");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (void)removeTrackedGuid
{
  void *v3;

  -[CKTranscriptBalloonSelectionManager trackedGuid](self, "trackedGuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKTranscriptBalloonSelectionManager removeSelectedMessageGuid:](self, "removeSelectedMessageGuid:", v3);

  -[CKTranscriptBalloonSelectionManager setTrackedGuid:](self, "setTrackedGuid:", 0);
}

- (void)setSelectedGuids:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t k;
  uint64_t v24;
  void *v25;
  __int128 v26;
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
  _BYTE v38[128];
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[CKTranscriptBalloonSelectionManager trackedGuid](self, "trackedGuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  -[CKTranscriptBalloonSelectionManager selectedMessageGuids](self, "selectedMessageGuids");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v35;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v35 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
        objc_msgSend(v4, "objectForKey:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
        {

        }
        else if (!v5 || (objc_msgSend(v12, "isEqualToString:", v5) & 1) == 0)
        {
          objc_msgSend(v6, "addObject:", v12);
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
    }
    while (v9);
  }

  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v14 = v6;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v30, v39, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v31;
    do
    {
      for (j = 0; j != v16; ++j)
      {
        if (*(_QWORD *)v31 != v17)
          objc_enumerationMutation(v14);
        -[CKTranscriptBalloonSelectionManager removeSelectedMessageGuid:](self, "removeSelectedMessageGuid:", *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * j));
      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v30, v39, 16);
    }
    while (v16);
  }

  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v19 = v4;
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v26, v38, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v27;
    do
    {
      for (k = 0; k != v21; ++k)
      {
        if (*(_QWORD *)v27 != v22)
          objc_enumerationMutation(v19);
        v24 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * k);
        if (!-[CKTranscriptBalloonSelectionManager isMessageGuidSelected:](self, "isMessageGuidSelected:", v24, (_QWORD)v26))
        {
          objc_msgSend(v19, "objectForKey:", v24);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          -[CKTranscriptBalloonSelectionManager addSelectedMessageGuid:selectionState:](self, "addSelectedMessageGuid:selectionState:", v24, v25);

        }
      }
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v26, v38, 16);
    }
    while (v21);
  }

}

- (CKTranscriptBalloonSelectionManagerDelegate)delegate
{
  return (CKTranscriptBalloonSelectionManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (CKTranscriptBalloonSelectionManagerDataSource)dataSource
{
  return (CKTranscriptBalloonSelectionManagerDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (void)setDataSource:(id)a3
{
  objc_storeWeak((id *)&self->_dataSource, a3);
}

- (NSString)trackedGuid
{
  return self->_trackedGuid;
}

- (void)setTrackedGuid:(id)a3
{
  objc_storeStrong((id *)&self->_trackedGuid, a3);
}

- (NSMutableOrderedSet)selectedMessageGuids
{
  return self->_selectedMessageGuids;
}

- (void)setSelectedMessageGuids:(id)a3
{
  objc_storeStrong((id *)&self->_selectedMessageGuids, a3);
}

- (NSMutableDictionary)selectedStates
{
  return self->_selectedStates;
}

- (void)setSelectedStates:(id)a3
{
  objc_storeStrong((id *)&self->_selectedStates, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedStates, 0);
  objc_storeStrong((id *)&self->_selectedMessageGuids, 0);
  objc_storeStrong((id *)&self->_trackedGuid, 0);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
