@implementation AFConversation

- (AFConversation)initWithIdentifier:(id)a3 languageCode:(id)a4 rootNode:(id)a5
{
  id v8;
  id v9;
  id v10;
  AFConversation *v11;
  uint64_t v12;
  NSUUID *identifier;
  uint64_t v14;
  NSString *languageCode;
  objc_super v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)AFConversation;
  v11 = -[AFConversation init](&v17, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    identifier = v11->_identifier;
    v11->_identifier = (NSUUID *)v12;

    objc_storeStrong((id *)&v11->_rootNode, a5);
    v14 = objc_msgSend(v9, "copy");
    languageCode = v11->_languageCode;
    v11->_languageCode = (NSString *)v14;

    v11->_synchronizedWithServer = 1;
  }

  return v11;
}

- (AFConversation)initWithIdentifier:(id)a3 languageCode:(id)a4
{
  id v6;
  id v7;
  AFTreeNode *v8;
  AFConversation *v9;

  v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init(AFTreeNode);
  v9 = -[AFConversation initWithIdentifier:languageCode:rootNode:](self, "initWithIdentifier:languageCode:rootNode:", v7, v6, v8);

  return v9;
}

- (AFConversation)initWithLanguageCode:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  AFConversation *v7;

  v4 = (void *)MEMORY[0x1E0CB3A28];
  v5 = a3;
  objc_msgSend(v4, "UUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[AFConversation initWithIdentifier:languageCode:](self, "initWithIdentifier:languageCode:", v6, v5);

  return v7;
}

- (id)_nodeAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[AFConversation _rootNode](self, "_rootNode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "nodeAtIndexPath:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_itemAtIndexPath:(id)a3
{
  void *v3;
  void *v4;

  -[AFConversation _nodeAtIndexPath:](self, "_nodeAtIndexPath:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "item");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)_removeNodes:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void (**v9)(_QWORD, _QWORD);
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void (**v16)(_QWORD, _QWORD);
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  AFConversation *v23;
  id v24;
  id v25;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _QWORD v31[5];
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _QWORD v37[4];
  id v38;
  AFConversation *v39;
  id v40;
  id v41;
  _BYTE v42[128];
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = MEMORY[0x1E0C809B0];
    v37[0] = MEMORY[0x1E0C809B0];
    v37[1] = 3221225472;
    v37[2] = __31__AFConversation__removeNodes___block_invoke;
    v37[3] = &unk_1E3A2F5B0;
    v26 = v5;
    v38 = v26;
    v39 = self;
    v23 = self;
    v25 = v6;
    v40 = v25;
    v24 = v7;
    v41 = v24;
    v9 = (void (**)(_QWORD, _QWORD))MEMORY[0x1A1AC0C3C](v37);
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v10 = v4;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v33, v43, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v34;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v34 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
          ((void (**)(_QWORD, void *))v9)[2](v9, v15);
          v31[0] = v8;
          v31[1] = 3221225472;
          v31[2] = __31__AFConversation__removeNodes___block_invoke_2;
          v31[3] = &unk_1E3A2F5D8;
          v16 = v9;
          v31[4] = v15;
          v32 = v16;
          objc_msgSend(v15, "enumerateDescendentNodesUsingBlock:", v31);

        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v33, v43, 16);
      }
      while (v12);
    }

    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v17 = v10;
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v27, v42, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v28;
      do
      {
        for (j = 0; j != v19; ++j)
        {
          if (*(_QWORD *)v28 != v20)
            objc_enumerationMutation(v17);
          objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * j), "removeFromParentNode", v23);
        }
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v27, v42, 16);
      }
      while (v19);
    }

    if (objc_msgSend(v26, "count"))
    {
      -[AFConversation delegate](v23, "delegate");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "conversation:didRemoveItemsWithIdentifiers:atIndexPaths:parentItemIdentifiers:", v23, v26, v25, v24);

    }
  }

}

- (id)_childOfNode:(id)a3 withItemWhichCanBeUpdatedWithAceObject:(id)a4 inDialogPhase:(id)a5
{
  id v8;
  id v9;
  id v10;
  char v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  _QWORD v17[4];
  id v18;
  uint64_t *v19;
  char v20;
  _QWORD v21[4];
  id v22;
  char v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__10581;
  v28 = __Block_byref_object_dispose__10582;
  v29 = 0;
  if (-[AFConversation _nodeContainsProvisionalItems:](self, "_nodeContainsProvisionalItems:", v8))
    v11 = objc_msgSend(v10, "isConfirmedDialogPhase");
  else
    v11 = 0;
  v12 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __84__AFConversation__childOfNode_withItemWhichCanBeUpdatedWithAceObject_inDialogPhase___block_invoke;
  v21[3] = &unk_1E3A2F600;
  v23 = v11;
  v13 = v9;
  v22 = v13;
  v17[0] = v12;
  v17[1] = 3221225472;
  v17[2] = __84__AFConversation__childOfNode_withItemWhichCanBeUpdatedWithAceObject_inDialogPhase___block_invoke_2;
  v17[3] = &unk_1E3A2F628;
  v20 = v11;
  v14 = (id)MEMORY[0x1A1AC0C3C](v21);
  v18 = v14;
  v19 = &v24;
  objc_msgSend(v8, "enumerateChildNodesWithOptions:usingBlock:", 2, v17);
  v15 = (id)v25[5];

  _Block_object_dispose(&v24, 8);
  return v15;
}

- (void)_processInsertions:(id)a3 inDialogPhase:(id)a4
{
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  AFConversation *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  id *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  id *v33;
  void *v34;
  id obj;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  _QWORD v41[6];
  id v42;
  id v43;
  id v44;
  uint64_t v45;
  _QWORD v46[4];
  id v47;
  _QWORD v48[4];
  id v49;
  _QWORD v50[4];
  id v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _QWORD v56[5];
  id v57;
  uint8_t v58[128];
  uint8_t buf[4];
  const char *v60;
  __int16 v61;
  id v62;
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v40 = a3;
  v6 = a4;
  if (!v6)
  {
    +[AFDialogPhase completionDialogPhase](AFDialogPhase, "completionDialogPhase");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    v7 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v60 = "-[AFConversation _processInsertions:inDialogPhase:]";
      v61 = 2112;
      v62 = v6;
      _os_log_impl(&dword_19AF50000, v7, OS_LOG_TYPE_INFO, "%s No dialog phase provided for conversation insertions; defaulting to %@",
        buf,
        0x16u);
    }
  }
  if ((objc_msgSend(v6, "isConfirmationDialogPhase") & 1) != 0
    || objc_msgSend(v6, "isClarificationDialogPhase"))
  {
    v8 = 2;
  }
  else
  {
    v8 = 1;
  }
  objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x1E0C809B0];
  v56[0] = MEMORY[0x1E0C809B0];
  v56[1] = 3221225472;
  v56[2] = __51__AFConversation__processInsertions_inDialogPhase___block_invoke;
  v56[3] = &unk_1E3A2F650;
  v12 = self;
  v56[4] = self;
  v13 = v10;
  v57 = v13;
  objc_msgSend(v40, "enumerateObjectsUsingBlock:", v56);
  v54 = 0u;
  v55 = 0u;
  v52 = 0u;
  v53 = 0u;
  v37 = v13;
  objc_msgSend(v13, "keyEnumerator");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v58, 16);
  v38 = v9;
  if (v14)
  {
    v15 = v14;
    v33 = &v49;
    v16 = *(_QWORD *)v53;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v53 != v16)
          objc_enumerationMutation(obj);
        v18 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * v17);
        objc_msgSend(v37, "objectForKey:", v18, v33);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "af_mappedArray:", &__block_literal_global_10599);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v6, "isExpository") & 1) == 0
          && (objc_msgSend(v6, "isConfirmedDialogPhase") & 1) == 0
          && ((objc_msgSend(v20, "containsObject:", &unk_1E3AA60A0) & 1) != 0
           || (objc_msgSend(v20, "containsObject:", &unk_1E3AA60B8) & 1) != 0
           || objc_msgSend(v20, "containsObject:", &unk_1E3AA60D0))
          && -[AFConversation _nodeContainsProvisionalItems:](v12, "_nodeContainsProvisionalItems:", v18))
        {
          if ((objc_msgSend(v6, "isConfirmationDialogPhase") & 1) != 0
            || objc_msgSend(v6, "isClarificationDialogPhase"))
          {
            v50[0] = v11;
            v50[1] = 3221225472;
            v50[2] = __51__AFConversation__processInsertions_inDialogPhase___block_invoke_16;
            v50[3] = &unk_1E3A2F6B8;
            v51 = v36;
            objc_msgSend(v18, "enumerateChildNodesUsingBlock:", v50);
            v21 = &v51;
          }
          else
          {
            if ((objc_msgSend(v6, "isSummaryDialogPhase") & 1) != 0)
              goto LABEL_23;
            v48[0] = v11;
            v48[1] = 3221225472;
            v48[2] = __51__AFConversation__processInsertions_inDialogPhase___block_invoke_2_17;
            v48[3] = &unk_1E3A2F6B8;
            v49 = v34;
            objc_msgSend(v18, "enumerateChildNodesWithOptions:usingBlock:", 2, v48);
            v21 = v33;
          }

        }
LABEL_23:
        if ((objc_msgSend(v20, "containsObject:", &unk_1E3AA60A0) & 1) != 0
          || objc_msgSend(v20, "containsObject:", &unk_1E3AA60B8))
        {
          v46[0] = v11;
          v46[1] = 3221225472;
          v46[2] = __51__AFConversation__processInsertions_inDialogPhase___block_invoke_3;
          v46[3] = &unk_1E3A2F6B8;
          v47 = v36;
          objc_msgSend(v18, "enumerateChildNodesUsingBlock:", v46);

        }
        v41[0] = v11;
        v41[1] = 3221225472;
        v41[2] = __51__AFConversation__processInsertions_inDialogPhase___block_invoke_4;
        v41[3] = &unk_1E3A2F6E0;
        v41[4] = v12;
        v41[5] = v18;
        v42 = v6;
        v45 = v8;
        v9 = v38;
        v43 = v38;
        v44 = v39;
        objc_msgSend(v19, "enumerateObjectsUsingBlock:", v41);

        ++v17;
      }
      while (v15 != v17);
      v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v58, 16);
      v15 = v22;
    }
    while (v22);
  }

  if (objc_msgSend(v9, "count"))
  {
    objc_msgSend(v9, "array");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    +[AFTreeNode absoluteIndexPathsForTreeNodes:](AFTreeNode, "absoluteIndexPathsForTreeNodes:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v24 = 0;
  }
  if (objc_msgSend(v39, "count"))
  {
    objc_msgSend(v39, "array");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    +[AFTreeNode absoluteIndexPathsForTreeNodes:](AFTreeNode, "absoluteIndexPathsForTreeNodes:", v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v26 = 0;
  }
  if (objc_msgSend(v34, "count"))
  {
    objc_msgSend(v34, "array");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[AFConversation _changePresentationStateForNodes:](v12, "_changePresentationStateForNodes:", v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v28 = 0;
  }
  -[AFConversation notifyDelegateOfUpdates:inserts:presentationChanges:](v12, "notifyDelegateOfUpdates:inserts:presentationChanges:", v24, v26, v28);
  if (objc_msgSend(v36, "count"))
  {
    objc_msgSend(v36, "array");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[AFConversation _removeNodes:](v12, "_removeNodes:", v29);

  }
  v30 = (void *)AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    v31 = v30;
    -[AFConversation _rootNode](v12, "_rootNode");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v60 = "-[AFConversation _processInsertions:inDialogPhase:]";
    v61 = 2112;
    v62 = v32;
    _os_log_impl(&dword_19AF50000, v31, OS_LOG_TYPE_INFO, "%s rootNode=%@", buf, 0x16u);

  }
}

- (void)_addItemsForAceViews:(id)a3 withDialogPhase:(id)a4 fromCommandWithIdentifier:(id)a5 atIndexPaths:(id)a6 isSupplemental:(BOOL)a7 isImmersiveExperience:(BOOL)a8 isPersistentAcrossInvocations:(BOOL)a9
{
  id v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  BOOL v28;
  BOOL v29;
  BOOL v30;

  v15 = a5;
  v16 = a6;
  v17 = (void *)MEMORY[0x1E0C99DE8];
  v18 = a4;
  v19 = a3;
  objc_msgSend(v17, "arrayWithCapacity:", objc_msgSend(v19, "count"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __161__AFConversation__addItemsForAceViews_withDialogPhase_fromCommandWithIdentifier_atIndexPaths_isSupplemental_isImmersiveExperience_isPersistentAcrossInvocations___block_invoke;
  v24[3] = &unk_1E3A2F708;
  v25 = v16;
  v26 = v20;
  v27 = v15;
  v28 = a7;
  v29 = a8;
  v30 = a9;
  v21 = v15;
  v22 = v20;
  v23 = v16;
  objc_msgSend(v19, "enumerateObjectsUsingBlock:", v24);

  -[AFConversation _processInsertions:inDialogPhase:](self, "_processInsertions:inDialogPhase:", v22, v18);
}

- (id)_indexPathsForAddingItemsWithCount:(int64_t)a3 asChildrenOfItemWithIdentifier:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  int64_t v9;
  int64_t v10;
  int64_t v11;
  void *v12;

  v6 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AFConversation indexPathForItemWithIdentifier:](self, "indexPathForItemWithIdentifier:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[AFConversation numberOfChildrenForItemAtIndexPath:](self, "numberOfChildrenForItemAtIndexPath:", v8);
  if (a3 >= 1)
  {
    v10 = v9;
    v11 = v9 + a3;
    do
    {
      objc_msgSend(v8, "indexPathByAddingIndex:", v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObject:", v12);

      ++v10;
    }
    while (v10 < v11);
  }

  return v7;
}

- (void)_addItemsForAceViews:(id)a3 withDialogPhase:(id)a4 fromCommandWithIdentifier:(id)a5 atIndexPaths:(id)a6
{
  uint64_t v6;

  LOBYTE(v6) = 0;
  -[AFConversation _addItemsForAceViews:withDialogPhase:fromCommandWithIdentifier:atIndexPaths:isSupplemental:isImmersiveExperience:isPersistentAcrossInvocations:](self, "_addItemsForAceViews:withDialogPhase:fromCommandWithIdentifier:atIndexPaths:isSupplemental:isImmersiveExperience:isPersistentAcrossInvocations:", a3, a4, a5, a6, 0, 0, v6);
}

- (void)_addItemsForAceViews:(id)a3 withDialogPhase:(id)a4 fromCommandWithIdentifier:(id)a5 asChildrenOfItemWithIdentifier:(id)a6 isSupplemental:(BOOL)a7 isImmersiveExperience:(BOOL)a8 isPersistentAcrossInvocations:(BOOL)a9
{
  _BOOL8 v9;
  _BOOL8 v10;
  id v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  id v20;

  v9 = a8;
  v10 = a7;
  v15 = a6;
  v16 = a5;
  v17 = a4;
  v18 = a3;
  -[AFConversation _indexPathsForAddingItemsWithCount:asChildrenOfItemWithIdentifier:](self, "_indexPathsForAddingItemsWithCount:asChildrenOfItemWithIdentifier:", objc_msgSend(v18, "count"), v15);
  v20 = (id)objc_claimAutoreleasedReturnValue();

  LOBYTE(v19) = a9;
  -[AFConversation _addItemsForAceViews:withDialogPhase:fromCommandWithIdentifier:atIndexPaths:isSupplemental:isImmersiveExperience:isPersistentAcrossInvocations:](self, "_addItemsForAceViews:withDialogPhase:fromCommandWithIdentifier:atIndexPaths:isSupplemental:isImmersiveExperience:isPersistentAcrossInvocations:", v18, v17, v16, v20, v10, v9, v19);

}

- (void)_addItemsForAceViews:(id)a3 withDialogPhase:(id)a4 fromCommandWithIdentifier:(id)a5 asChildrenOfItemWithIdentifier:(id)a6
{
  uint64_t v6;

  LOBYTE(v6) = 0;
  -[AFConversation _addItemsForAceViews:withDialogPhase:fromCommandWithIdentifier:asChildrenOfItemWithIdentifier:isSupplemental:isImmersiveExperience:isPersistentAcrossInvocations:](self, "_addItemsForAceViews:withDialogPhase:fromCommandWithIdentifier:asChildrenOfItemWithIdentifier:isSupplemental:isImmersiveExperience:isPersistentAcrossInvocations:", a3, a4, a5, a6, 0, 0, v6);
}

- (void)insertItemsForAceViews:(id)a3 withDialogPhase:(id)a4 atIndexPaths:(id)a5
{
  -[AFConversation _addItemsForAceViews:withDialogPhase:fromCommandWithIdentifier:atIndexPaths:](self, "_addItemsForAceViews:withDialogPhase:fromCommandWithIdentifier:atIndexPaths:", a3, a4, 0, a5);
}

- (void)addItemsForAceViews:(id)a3 withDialogPhase:(id)a4 asChildrenOfItemWithIdentifier:(id)a5
{
  -[AFConversation _addItemsForAceViews:withDialogPhase:fromCommandWithIdentifier:asChildrenOfItemWithIdentifier:](self, "_addItemsForAceViews:withDialogPhase:fromCommandWithIdentifier:asChildrenOfItemWithIdentifier:", a3, a4, 0, a5);
}

- (void)addItemsForAddViewsCommand:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  id v12;

  v4 = a3;
  objc_msgSend(v4, "dialogPhase");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[AFDialogPhase dialogPhaseForAceDialogPhase:](AFDialogPhase, "dialogPhaseForAceDialogPhase:", v5);
  v12 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "views");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "aceId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v4, "supplemental");
  v9 = objc_msgSend(v4, "immersiveExperience");
  v10 = objc_msgSend(v4, "persistentAcrossInvocations");

  LOBYTE(v11) = v10;
  -[AFConversation _addItemsForAceViews:withDialogPhase:fromCommandWithIdentifier:asChildrenOfItemWithIdentifier:isSupplemental:isImmersiveExperience:isPersistentAcrossInvocations:](self, "_addItemsForAceViews:withDialogPhase:fromCommandWithIdentifier:asChildrenOfItemWithIdentifier:isSupplemental:isImmersiveExperience:isPersistentAcrossInvocations:", v6, v12, v7, 0, v8, v9, v11);

}

- (void)_addItemsForAceObjects:(id)a3 type:(int64_t)a4 aceCommandIdentifier:(id)a5 dialogPhase:(id)a6 asChildrenOfItemWithIdentifier:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  id v22;
  _QWORD v23[4];
  id v24;
  id v25;
  id v26;
  int64_t v27;

  v12 = a5;
  v13 = a7;
  v14 = a6;
  v15 = a3;
  v16 = objc_msgSend(v15, "count");
  -[AFConversation _indexPathsForAddingItemsWithCount:asChildrenOfItemWithIdentifier:](self, "_indexPathsForAddingItemsWithCount:asChildrenOfItemWithIdentifier:", v16, v13);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __110__AFConversation__addItemsForAceObjects_type_aceCommandIdentifier_dialogPhase_asChildrenOfItemWithIdentifier___block_invoke;
  v23[3] = &unk_1E3A2F730;
  v24 = v17;
  v25 = v12;
  v26 = v18;
  v27 = a4;
  v19 = v18;
  v20 = v12;
  v22 = v17;
  objc_msgSend(v15, "enumerateObjectsUsingBlock:", v23);

  v21 = (void *)objc_msgSend(v19, "copy");
  -[AFConversation _processInsertions:inDialogPhase:](self, "_processInsertions:inDialogPhase:", v21, v14);

}

- (void)addItemsForAceObjects:(id)a3 type:(int64_t)a4 dialogPhase:(id)a5 asChildrenOfItemWithIdentifier:(id)a6
{
  -[AFConversation _addItemsForAceObjects:type:aceCommandIdentifier:dialogPhase:asChildrenOfItemWithIdentifier:](self, "_addItemsForAceObjects:type:aceCommandIdentifier:dialogPhase:asChildrenOfItemWithIdentifier:", a3, a4, 0, a5, a6);
}

- (void)addItemForSpeechRecognizedCommand:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "refId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AFConversation _rootNode](self, "_rootNode");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __52__AFConversation_addItemForSpeechRecognizedCommand___block_invoke;
  v14[3] = &unk_1E3A2F758;
  v8 = v6;
  v15 = v8;
  v9 = v4;
  v16 = v9;
  v10 = v5;
  v17 = v10;
  objc_msgSend(v7, "enumerateDescendentNodesUsingBlock:", v14);

  if (objc_msgSend(v10, "count"))
  {
    -[AFConversation notifyDelegateOfUpdates:inserts:presentationChanges:](self, "notifyDelegateOfUpdates:inserts:presentationChanges:", v10, 0, 0);
  }
  else
  {
    v18[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "aceId");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[AFDialogPhase userRequestDialogPhase](AFDialogPhase, "userRequestDialogPhase");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[AFConversation _addItemsForAceObjects:type:aceCommandIdentifier:dialogPhase:asChildrenOfItemWithIdentifier:](self, "_addItemsForAceObjects:type:aceCommandIdentifier:dialogPhase:asChildrenOfItemWithIdentifier:", v11, 1, v12, v13, 0);

  }
}

- (void)addAdditionalSpeechInterpretation:(id)a3 refId:(id)a4
{
  id v6;
  id v7;
  NSMutableDictionary *additionalInterpretationsForRefId;
  NSMutableDictionary *v9;
  NSMutableDictionary *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, void *);
  void *v19;
  id v20;
  id v21;
  uint8_t buf[4];
  const char *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v7)
  {
    additionalInterpretationsForRefId = self->_additionalInterpretationsForRefId;
    if (!additionalInterpretationsForRefId)
    {
      v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      v10 = self->_additionalInterpretationsForRefId;
      self->_additionalInterpretationsForRefId = v9;

      additionalInterpretationsForRefId = self->_additionalInterpretationsForRefId;
    }
    -[NSMutableDictionary objectForKey:](additionalInterpretationsForRefId, "objectForKey:", v7);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    if (!v11)
    {
      v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      -[NSMutableDictionary setValue:forKey:](self->_additionalInterpretationsForRefId, "setValue:forKey:", v11, v7);
    }
    objc_msgSend(v11, "addObject:", v6);
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[AFConversation _rootNode](self, "_rootNode");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = MEMORY[0x1E0C809B0];
    v17 = 3221225472;
    v18 = __58__AFConversation_addAdditionalSpeechInterpretation_refId___block_invoke;
    v19 = &unk_1E3A2F780;
    v20 = v7;
    v14 = v12;
    v21 = v14;
    objc_msgSend(v13, "enumerateDescendentNodesUsingBlock:", &v16);

    if (objc_msgSend(v14, "count", v16, v17, v18, v19))
      -[AFConversation notifyDelegateOfUpdates:inserts:presentationChanges:](self, "notifyDelegateOfUpdates:inserts:presentationChanges:", v14, 0, 0);

  }
  else
  {
    v15 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v23 = "-[AFConversation addAdditionalSpeechInterpretation:refId:]";
      _os_log_error_impl(&dword_19AF50000, v15, OS_LOG_TYPE_ERROR, "%s Unable to add additional speech interpretation, invalid refId", buf, 0xCu);
    }
  }

}

- (id)additionalSpeechInterpretationsForRefId:(id)a3
{
  void *v3;
  void *v4;

  -[NSMutableDictionary objectForKey:](self->_additionalInterpretationsForRefId, "objectForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  return v4;
}

- (void)addRecognitionUpdateWithPhrases:(id)a3 utterances:(id)a4 refId:(id)a5
{
  id v8;
  id v9;
  NSMutableDictionary *v10;
  NSMutableDictionary *updatedUserUtteranceForRefId;
  AFUserUtterance *v12;
  id v13;

  v13 = a3;
  v8 = a4;
  v9 = a5;
  if (!self->_updatedUserUtteranceForRefId)
  {
    v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    updatedUserUtteranceForRefId = self->_updatedUserUtteranceForRefId;
    self->_updatedUserUtteranceForRefId = v10;

  }
  v12 = -[AFUserUtterance initWithPhrases:utterances:]([AFUserUtterance alloc], "initWithPhrases:utterances:", v13, v8);
  -[NSMutableDictionary setObject:forKey:](self->_updatedUserUtteranceForRefId, "setObject:forKey:", v12, v9);

}

- (id)updatedUserUtteranceForRefId:(id)a3
{
  return (id)-[NSMutableDictionary objectForKey:](self->_updatedUserUtteranceForRefId, "objectForKey:", a3);
}

- (void)addItemForPartialResultCommand:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "refId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AFConversation _rootNode](self, "_rootNode");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __49__AFConversation_addItemForPartialResultCommand___block_invoke;
  v14[3] = &unk_1E3A2F758;
  v8 = v6;
  v15 = v8;
  v9 = v4;
  v16 = v9;
  v10 = v5;
  v17 = v10;
  objc_msgSend(v7, "enumerateDescendentNodesUsingBlock:", v14);

  if (objc_msgSend(v10, "count"))
  {
    -[AFConversation notifyDelegateOfUpdates:inserts:presentationChanges:](self, "notifyDelegateOfUpdates:inserts:presentationChanges:", v10, 0, 0);
  }
  else
  {
    v18[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "aceId");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[AFDialogPhase userRequestDialogPhase](AFDialogPhase, "userRequestDialogPhase");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[AFConversation _addItemsForAceObjects:type:aceCommandIdentifier:dialogPhase:asChildrenOfItemWithIdentifier:](self, "_addItemsForAceObjects:type:aceCommandIdentifier:dialogPhase:asChildrenOfItemWithIdentifier:", v11, 2, v12, v13, 0);

  }
}

- (void)addItemsForShowHelpCommand:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  AFConversationInsertion *v11;
  void *v12;
  AFConversationInsertion *v13;
  AFConversationInsertion *v14;
  void *v15;
  void *v16;
  AFConversationInsertion *v17;
  void *v18;
  uint64_t v19;
  id v20;

  v20 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AFConversation _indexPathsForAddingItemsWithCount:asChildrenOfItemWithIdentifier:](self, "_indexPathsForAddingItemsWithCount:asChildrenOfItemWithIdentifier:", 2, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  objc_msgSend(v20, "text");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = objc_alloc_init(MEMORY[0x1E0D88508]);
    objc_msgSend(v8, "setText:", v7);
    objc_msgSend(v20, "speakableText");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setSpeakableText:", v9);

    objc_msgSend(v6, "firstObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeObjectAtIndex:", 0);
    v11 = [AFConversationInsertion alloc];
    objc_msgSend(v20, "aceId");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v19) = 0;
    v13 = -[AFConversationInsertion initWithConversationItemType:aceObject:aceCommandIdentifier:transient:supplemental:immersiveExperience:persistentAcrossInvocations:indexPath:](v11, "initWithConversationItemType:aceObject:aceCommandIdentifier:transient:supplemental:immersiveExperience:persistentAcrossInvocations:indexPath:", 3, v8, v12, 0, 0, 0, v19, v10);
    objc_msgSend(v4, "addObject:", v13);

  }
  v14 = [AFConversationInsertion alloc];
  objc_msgSend(v20, "aceId");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v19) = 0;
  v17 = -[AFConversationInsertion initWithConversationItemType:aceObject:aceCommandIdentifier:transient:supplemental:immersiveExperience:persistentAcrossInvocations:indexPath:](v14, "initWithConversationItemType:aceObject:aceCommandIdentifier:transient:supplemental:immersiveExperience:persistentAcrossInvocations:indexPath:", 4, v20, v15, 0, 0, 0, v19, v16);
  objc_msgSend(v4, "addObject:", v17);

  +[AFDialogPhase completionDialogPhase](AFDialogPhase, "completionDialogPhase");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[AFConversation _processInsertions:inDialogPhase:](self, "_processInsertions:inDialogPhase:", v4, v18);

}

- (void)addItemForMusicStartSessionCommand:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v4 = (void *)MEMORY[0x1E0C99D20];
  v5 = a3;
  objc_msgSend(v4, "arrayWithObjects:count:", &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "aceId", v9, v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[AFDialogPhase reflectionDialogPhase](AFDialogPhase, "reflectionDialogPhase");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[AFConversation _addItemsForAceObjects:type:aceCommandIdentifier:dialogPhase:asChildrenOfItemWithIdentifier:](self, "_addItemsForAceObjects:type:aceCommandIdentifier:dialogPhase:asChildrenOfItemWithIdentifier:", v6, 5, v7, v8, 0);
}

- (void)addSelectionResponse:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v4 = (void *)MEMORY[0x1E0C99D20];
  v5 = a3;
  objc_msgSend(v4, "arrayWithObjects:count:", &v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[AFDialogPhase userRequestDialogPhase](AFDialogPhase, "userRequestDialogPhase", v8, v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[AFConversation addItemsForAceViews:withDialogPhase:asChildrenOfItemWithIdentifier:](self, "addItemsForAceViews:withDialogPhase:asChildrenOfItemWithIdentifier:", v6, v7, 0);
}

- (void)updateWithUpdateViewsCommand:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id obj;
  _QWORD v15[5];
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v13 = v4;
  objc_msgSend(v4, "views");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v18;
    v9 = MEMORY[0x1E0C809B0];
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(obj);
        v11 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v10);
        -[AFConversation _rootNode](self, "_rootNode");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v15[0] = v9;
        v15[1] = 3221225472;
        v15[2] = __47__AFConversation_updateWithUpdateViewsCommand___block_invoke;
        v15[3] = &unk_1E3A2F780;
        v15[4] = v11;
        v16 = v5;
        objc_msgSend(v12, "enumerateDescendentNodesUsingBlock:", v15);

        ++v10;
      }
      while (v7 != v10);
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v7);
  }

  -[AFConversation notifyDelegateOfUpdates:inserts:presentationChanges:](self, "notifyDelegateOfUpdates:inserts:presentationChanges:", v5, 0, 0);
}

- (void)removeItemsWithIdentifiers:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
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
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        -[AFConversation indexPathForItemWithIdentifier:](self, "indexPathForItemWithIdentifier:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v10), (_QWORD)v12);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }

  -[AFConversation removeItemsAtIndexPaths:](self, "removeItemsAtIndexPaths:", v5);
}

- (void)removeItemsAtIndexPaths:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
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
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        -[AFConversation _nodeAtIndexPath:](self, "_nodeAtIndexPath:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v10), (_QWORD)v12);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }

  -[AFConversation _removeNodes:](self, "_removeNodes:", v5);
}

- (void)removeItemsFollowingItemAtIndexPath:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t, uint64_t, _BYTE *);
  void *v13;
  id v14;
  uint64_t v15;

  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v6 = objc_msgSend(v4, "indexAtPosition:", objc_msgSend(v4, "length") - 1);
    objc_msgSend(v4, "indexPathByRemovingLastIndex");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[AFConversation _nodeAtIndexPath:](self, "_nodeAtIndexPath:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = MEMORY[0x1E0C809B0];
    v11 = 3221225472;
    v12 = __54__AFConversation_removeItemsFollowingItemAtIndexPath___block_invoke;
    v13 = &unk_1E3A2F7A8;
    v14 = v5;
    v15 = v6;
    v9 = v5;
    objc_msgSend(v8, "enumerateChildNodesWithOptions:usingBlock:", 2, &v10);
    -[AFConversation _removeNodes:](self, "_removeNodes:", v9, v10, v11, v12, v13);

  }
}

- (void)removeTransientItems
{
  void *v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AFConversation _rootNode](self, "_rootNode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __38__AFConversation_removeTransientItems__block_invoke;
  v6[3] = &unk_1E3A2F7D0;
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "enumerateDescendentNodesUsingBlock:", v6);

  -[AFConversation _removeNodes:](self, "_removeNodes:", v5);
}

- (void)cancelItemWithIdentifier:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  -[AFConversation _indexPathForItemWithIdentifier:ignoreNonExistent:](self, "_indexPathForItemWithIdentifier:ignoreNonExistent:", a3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AFConversation _itemAtIndexPath:](self, "_itemAtIndexPath:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "presentationState") != 3)
  {
    objc_msgSend(v5, "setPresentationState:", 3);
    v7[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[AFConversation notifyDelegateOfUpdates:inserts:presentationChanges:](self, "notifyDelegateOfUpdates:inserts:presentationChanges:", 0, 0, v6);

  }
}

- (BOOL)containsItemWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  -[AFConversation _rootNode](self, "_rootNode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __45__AFConversation_containsItemWithIdentifier___block_invoke;
  v8[3] = &unk_1E3A2F7F8;
  v6 = v4;
  v9 = v6;
  v10 = &v11;
  objc_msgSend(v5, "enumerateDescendentNodesUsingBlock:", v8);

  LOBYTE(v5) = *((_BYTE *)v12 + 24);
  _Block_object_dispose(&v11, 8);

  return (char)v5;
}

- (id)identifierOfItemAtIndexPath:(id)a3
{
  void *v3;
  void *v4;

  -[AFConversation _itemAtIndexPath:](self, "_itemAtIndexPath:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)indexPathForItemWithIdentifier:(id)a3
{
  return -[AFConversation _indexPathForItemWithIdentifier:ignoreNonExistent:](self, "_indexPathForItemWithIdentifier:ignoreNonExistent:", a3, 0);
}

- (id)_indexPathForItemWithIdentifier:(id)a3 ignoreNonExistent:(BOOL)a4
{
  id v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t *v11;
  id v12;
  void *v14;
  _QWORD v15[4];
  id v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v7 = a3;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__10581;
  v22 = __Block_byref_object_dispose__10582;
  v23 = 0;
  if (v7)
  {
    -[AFConversation _rootNode](self, "_rootNode");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __68__AFConversation__indexPathForItemWithIdentifier_ignoreNonExistent___block_invoke;
    v15[3] = &unk_1E3A2F7F8;
    v16 = v7;
    v17 = &v18;
    objc_msgSend(v8, "enumerateDescendentNodesUsingBlock:", v15);

    v9 = v16;
  }
  else
  {
    v10 = objc_alloc_init(MEMORY[0x1E0CB36B0]);
    v9 = (void *)v19[5];
    v19[5] = (uint64_t)v10;
  }

  v11 = v19;
  if (!a4 && !v19[5])
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("AFConversation.m"), 726, CFSTR("Cannot return an index path to an item that is not contained in the conversation"));

    v11 = v19;
  }
  v12 = (id)v11[5];
  _Block_object_dispose(&v18, 8);

  return v12;
}

- (BOOL)hasItemWithIdentifier:(id)a3
{
  void *v3;
  BOOL v4;

  -[AFConversation _indexPathForItemWithIdentifier:ignoreNonExistent:](self, "_indexPathForItemWithIdentifier:ignoreNonExistent:", a3, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (id)itemWithIdentifier:(id)a3
{
  void *v4;
  void *v5;

  -[AFConversation indexPathForItemWithIdentifier:](self, "indexPathForItemWithIdentifier:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AFConversation itemAtIndexPath:](self, "itemAtIndexPath:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)parentOfItemWithIdentifier:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  -[AFConversation indexPathForItemWithIdentifier:](self, "indexPathForItemWithIdentifier:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "indexPathByRemovingLastIndex");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AFConversation _itemAtIndexPath:](self, "_itemAtIndexPath:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)itemAtIndexPath:(id)a3
{
  void *v3;
  void *v4;

  -[AFConversation _itemAtIndexPath:](self, "_itemAtIndexPath:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  return v4;
}

- (id)lastItem
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = objc_alloc_init(MEMORY[0x1E0CB36B0]);
  v4 = -[AFConversation numberOfChildrenForItemAtIndexPath:](self, "numberOfChildrenForItemAtIndexPath:", v3);

  if (v4 < 1)
  {
    v6 = 0;
  }
  else
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36B0]), "initWithIndex:", v4 - 1);
    -[AFConversation _itemAtIndexPath:](self, "_itemAtIndexPath:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

- (int64_t)typeForItemAtIndexPath:(id)a3
{
  void *v3;
  int64_t v4;

  -[AFConversation _itemAtIndexPath:](self, "_itemAtIndexPath:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "type");

  return v4;
}

- (id)dialogPhaseForItemAtIndexPath:(id)a3
{
  void *v3;
  void *v4;

  -[AFConversation _itemAtIndexPath:](self, "_itemAtIndexPath:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dialogPhase");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)aceObjectForItemAtIndexPath:(id)a3
{
  void *v3;
  void *v4;

  -[AFConversation _itemAtIndexPath:](self, "_itemAtIndexPath:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "aceObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (int64_t)presentationStateForItemAtIndexPath:(id)a3
{
  void *v3;
  int64_t v4;

  -[AFConversation _itemAtIndexPath:](self, "_itemAtIndexPath:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "presentationState");

  return v4;
}

- (int64_t)numberOfChildrenForItemWithIdentifier:(id)a3
{
  void *v4;
  int64_t v5;

  -[AFConversation indexPathForItemWithIdentifier:](self, "indexPathForItemWithIdentifier:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[AFConversation numberOfChildrenForItemAtIndexPath:](self, "numberOfChildrenForItemAtIndexPath:", v4);

  return v5;
}

- (int64_t)numberOfChildrenForItemAtIndexPath:(id)a3
{
  void *v3;
  int64_t v4;

  -[AFConversation _nodeAtIndexPath:](self, "_nodeAtIndexPath:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "numberOfChildNodes");

  return v4;
}

- (id)aceCommandIdentifierForItemAtIndexPath:(id)a3
{
  void *v3;
  void *v4;

  -[AFConversation _itemAtIndexPath:](self, "_itemAtIndexPath:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "aceCommandIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)itemAtIndexPathIsVirgin:(id)a3
{
  void *v3;
  char v4;

  -[AFConversation _itemAtIndexPath:](self, "_itemAtIndexPath:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isVirgin");

  return v4;
}

- (void)_enumerateItemsUsingBlock:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  -[AFConversation _rootNode](self, "_rootNode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __44__AFConversation__enumerateItemsUsingBlock___block_invoke;
  v7[3] = &unk_1E3A2F820;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "enumerateDescendentNodesUsingBlock:", v7);

}

- (BOOL)containsItemForAceViewWithIdentifier:(id)a3
{
  id v4;
  id v5;
  _QWORD v7[4];
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v4 = a3;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __55__AFConversation_containsItemForAceViewWithIdentifier___block_invoke;
  v7[3] = &unk_1E3A2F848;
  v5 = v4;
  v8 = v5;
  v9 = &v10;
  -[AFConversation _enumerateItemsUsingBlock:](self, "_enumerateItemsUsingBlock:", v7);
  LOBYTE(self) = *((_BYTE *)v11 + 24);

  _Block_object_dispose(&v10, 8);
  return (char)self;
}

- (BOOL)_nodeContainsProvisionalItems:(id)a3
{
  id v3;
  char v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v3 = a3;
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __48__AFConversation__nodeContainsProvisionalItems___block_invoke;
  v6[3] = &unk_1E3A2F870;
  v6[4] = &v7;
  objc_msgSend(v3, "enumerateChildNodesWithOptions:usingBlock:", 2, v6);
  v4 = *((_BYTE *)v8 + 24);
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (id)_changePresentationStateForNodes:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v5 = v3;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v15 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
          objc_msgSend(v10, "parentNode", (_QWORD)v14);
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          if (v11)
          {
            objc_msgSend(v10, "absoluteIndexPath");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "addObject:", v12);

          }
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v7);
    }

  }
  return v4;
}

- (id)propertyListRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  AFTreeNodePropertyListSerialization *v8;
  void *v9;
  void *v10;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", &unk_1E3AA60E8, CFSTR("Version"));
  -[AFConversation identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("Identifier"));

  -[AFConversation languageCode](self, "languageCode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("LanguageCode"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[AFConversation isSynchronizedWithServer](self, "isSynchronizedWithServer"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("SynchronizedWithServer"));

  v8 = objc_alloc_init(AFTreeNodePropertyListSerialization);
  -[AFConversation _rootNode](self, "_rootNode");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[AFTreeNodePropertyListSerialization propertyListWithTreeNode:itemPropertyListCreation:](v8, "propertyListWithTreeNode:itemPropertyListCreation:", v9, &__block_literal_global_48);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("RootNode"));
  return v3;
}

- (AFConversation)initWithPropertyListRepresentation:(id)a3
{
  id v4;
  AFDictionarySchema *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  AFCoercion *v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  AFConversation *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  NSObject *v27;
  id v29;
  uint8_t buf[4];
  const char *v31;
  __int16 v32;
  uint64_t v33;
  __int16 v34;
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(AFDictionarySchema);
  +[AFCoercion stringToUUIDCoercion](AFCoercion, "stringToUUIDCoercion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AFDictionarySchema setObjectCoercion:forKey:](v5, "setObjectCoercion:forKey:", v6, CFSTR("Identifier"));

  +[AFCoercion typeAssertionWithClass:](AFCoercion, "typeAssertionWithClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AFDictionarySchema setObjectCoercion:forKey:](v5, "setObjectCoercion:forKey:", v7, CFSTR("Version"));

  +[AFCoercion typeAssertionWithClass:](AFCoercion, "typeAssertionWithClass:", objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[AFDictionarySchema setObjectCoercion:forKey:](v5, "setObjectCoercion:forKey:", v8, CFSTR("LanguageCode"));

  +[AFCoercion typeAssertionWithClass:](AFCoercion, "typeAssertionWithClass:", objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[AFDictionarySchema setObjectCoercion:forKey:](v5, "setObjectCoercion:forKey:", v9, CFSTR("SynchronizedWithServer"));

  v10 = -[AFCoercion initWithBlock:]([AFCoercion alloc], "initWithBlock:", &__block_literal_global_53);
  -[AFDictionarySchema setObjectCoercion:forKey:](v5, "setObjectCoercion:forKey:", v10, CFSTR("RootNode"));

  v29 = 0;
  -[AFDictionarySchema coerceObject:error:](v5, "coerceObject:error:", v4, &v29);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v29;
  if (!v11)
  {
    v24 = (void *)AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      v25 = v24;
      objc_msgSend(v12, "localizedFailureReason");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v31 = "-[AFConversation initWithPropertyListRepresentation:]";
      v32 = 2112;
      v33 = (uint64_t)v26;
      v34 = 2114;
      v35 = v4;
      _os_log_error_impl(&dword_19AF50000, v25, OS_LOG_TYPE_ERROR, "%s passed invalid property list (%@): %{public}@", buf, 0x20u);

    }
    goto LABEL_10;
  }
  objc_msgSend(v11, "objectForKey:", CFSTR("Version"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "integerValue");

  if (v14 != 1)
  {
    v27 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v31 = "-[AFConversation initWithPropertyListRepresentation:]";
      v32 = 2050;
      v33 = v14;
      _os_log_error_impl(&dword_19AF50000, v27, OS_LOG_TYPE_ERROR, "%s Unable to create conversation from property list with version %{public}ld", buf, 0x16u);
    }
LABEL_10:
    v23 = 0;
    goto LABEL_11;
  }
  objc_msgSend(v11, "objectForKey:", CFSTR("Identifier"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKey:", CFSTR("LanguageCode"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKey:", CFSTR("SynchronizedWithServer"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "BOOLValue");

  objc_msgSend(v11, "objectForKey:", CFSTR("RootNode"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  self = -[AFConversation initWithIdentifier:languageCode:rootNode:](self, "initWithIdentifier:languageCode:rootNode:", v15, v16, v19);
  -[AFConversation setSynchronizedWithServer:](self, "setSynchronizedWithServer:", v18);
  v20 = (void *)AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    v21 = v20;
    -[AFConversation _rootNode](self, "_rootNode");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v31 = "-[AFConversation initWithPropertyListRepresentation:]";
    v32 = 2112;
    v33 = (uint64_t)v22;
    _os_log_impl(&dword_19AF50000, v21, OS_LOG_TYPE_INFO, "%s rootNode=%@", buf, 0x16u);

  }
  v23 = self;
LABEL_11:

  return v23;
}

- (void)notifyDelegateOfUpdates:(id)a3 inserts:(id)a4 presentationChanges:(id)a5
{
  id v8;
  id v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  AFConversationTransaction *v19;
  void *v20;
  char v21;
  void *v22;
  id v23;

  v23 = a3;
  v8 = a4;
  v9 = a5;
  if (objc_msgSend(v23, "count"))
  {
    -[AFConversation delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_opt_respondsToSelector();

    if ((v11 & 1) != 0)
    {
      -[AFConversation delegate](self, "delegate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "conversation:didUpdateItemsAtIndexPaths:", self, v23);

    }
  }
  if (objc_msgSend(v8, "count"))
  {
    -[AFConversation delegate](self, "delegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_opt_respondsToSelector();

    if ((v14 & 1) != 0)
    {
      -[AFConversation delegate](self, "delegate");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "conversation:didInsertItemsAtIndexPaths:", self, v8);

    }
  }
  if (objc_msgSend(v9, "count"))
  {
    -[AFConversation delegate](self, "delegate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_opt_respondsToSelector();

    if ((v17 & 1) != 0)
    {
      -[AFConversation delegate](self, "delegate");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "conversation:presentationStateDidChangeForItemsAtIndexPaths:", self, v9);

    }
  }
  if (objc_msgSend(v23, "count") || objc_msgSend(v8, "count") || objc_msgSend(v9, "count"))
  {
    v19 = -[AFConversationTransaction initWithUpdatedItemIndexPaths:insertedItemIndexPaths:presentationStateChangedItemIndexPaths:]([AFConversationTransaction alloc], "initWithUpdatedItemIndexPaths:insertedItemIndexPaths:presentationStateChangedItemIndexPaths:", v23, v8, v9);
    -[AFConversation delegate](self, "delegate");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_opt_respondsToSelector();

    if ((v21 & 1) != 0)
    {
      -[AFConversation delegate](self, "delegate");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "conversation:didChangeWithTransaction:", self, v19);

    }
  }

}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (NSString)languageCode
{
  return self->_languageCode;
}

- (BOOL)isSynchronizedWithServer
{
  return self->_synchronizedWithServer;
}

- (void)setSynchronizedWithServer:(BOOL)a3
{
  self->_synchronizedWithServer = a3;
}

- (AFConversationDelegate)delegate
{
  return (AFConversationDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (AFTreeNode)_rootNode
{
  return self->_rootNode;
}

- (void)_setRootNode:(id)a3
{
  objc_storeStrong((id *)&self->_rootNode, a3);
}

- (AFConversationStorable)lastRestoredItem
{
  return self->_lastRestoredItem;
}

- (void)_setLastRestoredItem:(id)a3
{
  objc_storeStrong((id *)&self->_lastRestoredItem, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastRestoredItem, 0);
  objc_storeStrong((id *)&self->_rootNode, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_languageCode, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_updatedUserUtteranceForRefId, 0);
  objc_storeStrong((id *)&self->_additionalInterpretationsForRefId, 0);
}

id __53__AFConversation_initWithPropertyListRepresentation___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v4;
  AFTreeNodePropertyListSerialization *v5;
  void *v6;

  v4 = a2;
  v5 = objc_alloc_init(AFTreeNodePropertyListSerialization);
  -[AFTreeNodePropertyListSerialization treeNodeWithPropertyList:error:itemCreation:](v5, "treeNodeWithPropertyList:error:itemCreation:", v4, a3, &__block_literal_global_54);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

AFMutableConversationItem *__53__AFConversation_initWithPropertyListRepresentation___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  AFMutableConversationItem *v3;

  v2 = a2;
  v3 = -[AFMutableConversationItem initWithPropertyListRepresentation:]([AFMutableConversationItem alloc], "initWithPropertyListRepresentation:", v2);

  return v3;
}

uint64_t __44__AFConversation_propertyListRepresentation__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "propertyListRepresentation");
}

void __48__AFConversation__nodeContainsProvisionalItems___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;

  objc_msgSend(a2, "item");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "presentationState") == 2)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;
  }

}

void __55__AFConversation_containsItemForAceViewWithIdentifier___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  BOOL v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  id v10;

  v10 = a2;
  v5 = objc_msgSend(v10, "type") == 3;
  v6 = v10;
  if (v5)
  {
    objc_msgSend(v10, "aceObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "viewId");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isEqualToString:", *(_QWORD *)(a1 + 32));

    if (v9)
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
      *a3 = 1;
    }

    v6 = v10;
  }

}

void __44__AFConversation__enumerateItemsUsingBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4;
  id v5;

  v4 = *(_QWORD *)(a1 + 32);
  objc_msgSend(a2, "item");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, uint64_t))(v4 + 16))(v4, v5, a3);

}

void __68__AFConversation__indexPathForItemWithIdentifier_ignoreNonExistent___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;

  v11 = a2;
  objc_msgSend(v11, "item");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(void **)(a1 + 32);
  objc_msgSend(v5, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v6) = objc_msgSend(v6, "isEqual:", v7);

  if ((_DWORD)v6)
  {
    objc_msgSend(v11, "absoluteIndexPath");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;

    *a3 = 1;
  }

}

void __45__AFConversation_containsItemWithIdentifier___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  void *v5;
  int v6;
  id v7;

  objc_msgSend(a2, "item");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqual:", *(_QWORD *)(a1 + 32));

  if (v6)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    *a3 = 1;
  }

}

void __38__AFConversation_removeTransientItems__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  objc_msgSend(v4, "item");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isTransient"))
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v4);

}

uint64_t __54__AFConversation_removeItemsFollowingItemAtIndexPath___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  if (*(_QWORD *)(result + 40) < a3)
    return objc_msgSend(*(id *)(result + 32), "addObject:", a2);
  *a4 = 1;
  return result;
}

void __47__AFConversation_updateWithUpdateViewsCommand___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  objc_msgSend(v10, "item");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "type") == 3)
  {
    objc_msgSend(v3, "aceObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "viewId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "viewId");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isEqualToString:", v6);

    if (v7)
    {
      objc_msgSend(v3, "setAceObject:", *(_QWORD *)(a1 + 32));
      v8 = *(void **)(a1 + 40);
      objc_msgSend(v10, "absoluteIndexPath");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addObject:", v9);

    }
  }

}

void __49__AFConversation_addItemForPartialResultCommand___block_invoke(_QWORD *a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  objc_msgSend(v9, "item");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "type") == 2)
  {
    objc_msgSend(v3, "aceObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "refId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isEqualToString:", a1[4]);

    if (v6)
    {
      objc_msgSend(v3, "setAceObject:", a1[5]);
      v7 = (void *)a1[6];
      objc_msgSend(v9, "absoluteIndexPath");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObject:", v8);

    }
  }

}

void __58__AFConversation_addAdditionalSpeechInterpretation_refId___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  objc_msgSend(v9, "item");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "aceObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "refId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", *(_QWORD *)(a1 + 32));

  if (v6)
  {
    v7 = *(void **)(a1 + 40);
    objc_msgSend(v9, "absoluteIndexPath");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v8);

  }
}

void __52__AFConversation_addItemForSpeechRecognizedCommand___block_invoke(_QWORD *a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  v8 = a2;
  objc_msgSend(v8, "item");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "aceObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "refId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "isEqualToString:", a1[4]))
  {

    goto LABEL_5;
  }
  v6 = objc_msgSend(v3, "type");

  if (v6 == 2)
  {
    objc_msgSend(v3, "setAceObject:", a1[5]);
    objc_msgSend(v3, "setType:", 1);
    v7 = (void *)a1[6];
    objc_msgSend(v8, "absoluteIndexPath");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v4);
LABEL_5:

  }
}

void __110__AFConversation__addItemsForAceObjects_type_aceCommandIdentifier_dialogPhase_asChildrenOfItemWithIdentifier___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  AFConversationInsertion *v7;
  uint64_t v8;
  id v9;

  v5 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(v5, "objectAtIndex:", a3);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  LOBYTE(v8) = 0;
  v7 = -[AFConversationInsertion initWithConversationItemType:aceObject:aceCommandIdentifier:transient:supplemental:immersiveExperience:persistentAcrossInvocations:indexPath:]([AFConversationInsertion alloc], "initWithConversationItemType:aceObject:aceCommandIdentifier:transient:supplemental:immersiveExperience:persistentAcrossInvocations:indexPath:", *(_QWORD *)(a1 + 56), v6, *(_QWORD *)(a1 + 40), 0, 0, 0, v8, v9);

  objc_msgSend(*(id *)(a1 + 48), "addObject:", v7);
}

void __161__AFConversation__addItemsForAceViews_withDialogPhase_fromCommandWithIdentifier_atIndexPaths_isSupplemental_isImmersiveExperience_isPersistentAcrossInvocations___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  void *v7;
  AFConversationInsertion *v8;
  uint64_t v9;
  uint64_t v10;
  AFConversationInsertion *v11;
  uint64_t v12;
  id v13;

  v5 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(v5, "objectAtIndex:", a3);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  v7 = *(void **)(a1 + 40);
  v8 = [AFConversationInsertion alloc];
  v9 = *(_QWORD *)(a1 + 48);
  v10 = objc_msgSend(v6, "isTransient");
  LOBYTE(v12) = *(_BYTE *)(a1 + 58);
  v11 = -[AFConversationInsertion initWithConversationItemType:aceObject:aceCommandIdentifier:transient:supplemental:immersiveExperience:persistentAcrossInvocations:indexPath:](v8, "initWithConversationItemType:aceObject:aceCommandIdentifier:transient:supplemental:immersiveExperience:persistentAcrossInvocations:indexPath:", 3, v6, v9, v10, *(unsigned __int8 *)(a1 + 56), *(unsigned __int8 *)(a1 + 57), v12, v13);

  objc_msgSend(v7, "addObject:", v11);
}

void __51__AFConversation__processInsertions_inDialogPhase___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  objc_msgSend(v8, "indexPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 32);
  objc_msgSend(v3, "indexPathByRemovingLastIndex");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_nodeAtIndexPath:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", v7, v6);
  }
  objc_msgSend(v7, "addObject:", v8);

}

void __51__AFConversation__processInsertions_inDialogPhase___block_invoke_16(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  char v5;
  id v6;

  v6 = a2;
  objc_msgSend(v6, "item");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "presentationState") == 2)
  {
    objc_msgSend(v3, "aceObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "af_isUtterance");

    if ((v5 & 1) == 0)
      objc_msgSend(*(id *)(a1 + 32), "addObject:", v6);
  }

}

void __51__AFConversation__processInsertions_inDialogPhase___block_invoke_2_17(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  void *v7;
  void *v8;
  char isKindOfClass;
  id v10;

  v10 = a2;
  objc_msgSend(v10, "item");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dialogPhase");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "isConfirmationDialogPhase") & 1) != 0)
  {
    objc_msgSend(v6, "aceObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
    {
      if (objc_msgSend(v6, "presentationState") == 2)
      {
        objc_msgSend(v6, "setPresentationState:", 3);
        objc_msgSend(*(id *)(a1 + 32), "addObject:", v10);
      }
      *a4 = 1;
    }
  }
  else
  {

  }
}

void __51__AFConversation__processInsertions_inDialogPhase___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  objc_msgSend(v4, "item");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isTransient"))
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v4);

}

void __51__AFConversation__processInsertions_inDialogPhase___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  AFTreeNode *v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  AFMutableConversationItem *v16;
  uint64_t v17;
  uint64_t v18;
  AFDataStore *v19;
  char v20;
  AFDataStore *v21;
  uint64_t v22;
  AFMutableConversationItem *v23;
  NSObject *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  unsigned int v28;
  void *v29;
  uint8_t buf[4];
  const char *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  AFTreeNode *v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "indexPath");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "aceObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "conversationItemType");
  objc_msgSend(v3, "aceCommandIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v3, "isTransient");
  v8 = objc_msgSend(v3, "isSupplemental");
  v9 = objc_msgSend(v3, "isImmersiveExperience");
  v28 = objc_msgSend(v3, "isPersistentAcrossInvocations");

  objc_msgSend(*(id *)(a1 + 32), "_childOfNode:withItemWhichCanBeUpdatedWithAceObject:inDialogPhase:", *(_QWORD *)(a1 + 40), v4, *(_QWORD *)(a1 + 48));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v31 = "-[AFConversation _processInsertions:inDialogPhase:]_block_invoke_4";
    v32 = 2112;
    v33 = v4;
    _os_log_impl(&dword_19AF50000, v11, OS_LOG_TYPE_INFO, "%s ACE object: %@", buf, 0x16u);
  }
  if (v10)
  {
    objc_msgSend(v10, "item");
    v12 = (AFTreeNode *)objc_claimAutoreleasedReturnValue();
    v13 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      v14 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 136315906;
      v31 = "-[AFConversation _processInsertions:inDialogPhase:]_block_invoke";
      v32 = 2112;
      v33 = v14;
      v34 = 2112;
      v35 = v12;
      v36 = 2112;
      v37 = v29;
      _os_log_impl(&dword_19AF50000, v13, OS_LOG_TYPE_INFO, "%s %@: updating item %@ at %@ from ACE object.", buf, 0x2Au);
    }
    -[AFTreeNode setAceObject:](v12, "setAceObject:", v4);
    -[AFTreeNode setDialogPhase:](v12, "setDialogPhase:", *(_QWORD *)(a1 + 48));
    -[AFTreeNode setPresentationState:](v12, "setPresentationState:", *(_QWORD *)(a1 + 72));
    -[AFTreeNode setAceCommandIdentifier:](v12, "setAceCommandIdentifier:", v6);
    -[AFTreeNode setTransient:](v12, "setTransient:", v7);
    -[AFTreeNode setSupplemental:](v12, "setSupplemental:", v8);
    -[AFTreeNode setImmersiveExperience:](v12, "setImmersiveExperience:", v9);
    -[AFTreeNode setPersistentAcrossInvocations:](v12, "setPersistentAcrossInvocations:", v28);
    objc_msgSend(*(id *)(a1 + 56), "addObject:", v10);
  }
  else
  {
    v12 = objc_alloc_init(AFTreeNode);
    objc_msgSend(*(id *)(a1 + 40), "addChildNode:", v12);
    v15 = v5;
    v16 = [AFMutableConversationItem alloc];
    v27 = v6;
    v17 = *(_QWORD *)(a1 + 48);
    v18 = *(_QWORD *)(a1 + 72);
    v19 = objc_alloc_init(AFDataStore);
    v20 = v8;
    v21 = v19;
    BYTE3(v26) = v28;
    BYTE2(v26) = v9;
    BYTE1(v26) = v20;
    LOBYTE(v26) = v7;
    v22 = v17;
    v6 = v27;
    v23 = -[AFMutableConversationItem initWithType:aceObject:dialogPhase:presentationState:aceCommandIdentifier:virgin:transient:supplemental:immersiveExperience:persistentAcrossInvocations:associatedDataStore:](v16, "initWithType:aceObject:dialogPhase:presentationState:aceCommandIdentifier:virgin:transient:supplemental:immersiveExperience:persistentAcrossInvocations:associatedDataStore:", v15, v4, v22, v18, v27, 1, v26, v19);

    -[AFTreeNode setItem:](v12, "setItem:", v23);
    v24 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      v25 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 136315906;
      v31 = "-[AFConversation _processInsertions:inDialogPhase:]_block_invoke";
      v32 = 2112;
      v33 = v25;
      v34 = 2112;
      v35 = (AFTreeNode *)v23;
      v36 = 2112;
      v37 = v29;
      _os_log_impl(&dword_19AF50000, v24, OS_LOG_TYPE_INFO, "%s %@: adding new item %@ at %@ for ACE object.", buf, 0x2Au);
    }
    objc_msgSend(*(id *)(a1 + 64), "addObject:", v12);

    v10 = 0;
  }

}

uint64_t __51__AFConversation__processInsertions_inDialogPhase___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(a2, "conversationItemType"));
}

uint64_t __84__AFConversation__childOfNode_withItemWhichCanBeUpdatedWithAceObject_inDialogPhase___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  int v7;
  int v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unsigned int v14;

  v3 = a2;
  objc_msgSend(v3, "dialogPhase");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "presentationState");
  objc_msgSend(v3, "aceObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v4, "isExpository");
  v8 = v7;
  if (v5 == 2)
  {
    if (*(_BYTE *)(a1 + 40))
      v8 = 1;
    else
      v8 = v7;
  }
  if ((objc_msgSend(v4, "isConfirmationDialogPhase") & 1) != 0
    || objc_msgSend(v4, "isClarificationDialogPhase"))
  {
    v9 = objc_msgSend(*(id *)(a1 + 32), "af_isUtterance") ^ 1;
  }
  else
  {
    v9 = 1;
  }
  objc_msgSend(*(id *)(a1 + 32), "encodedClassName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodedClassName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "isEqualToString:", v11))
  {
    objc_msgSend(*(id *)(a1 + 32), "groupIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "groupIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v12, "isEqualToString:", v13);

  }
  else
  {
    v14 = 0;
  }

  return v9 & v8 & v14;
}

void __84__AFConversation__childOfNode_withItemWhichCanBeUpdatedWithAceObject_inDialogPhase___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  void *v8;
  void *v9;
  char v10;
  id v11;

  v11 = a2;
  objc_msgSend(v11, "item");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!*(_BYTE *)(a1 + 48))
  {
    objc_msgSend(v7, "dialogPhase");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isUserRequestDialogPhase");

    if ((v10 & 1) != 0)
      goto LABEL_5;
  }
  if ((*(unsigned int (**)(void))(*(_QWORD *)(a1 + 32) + 16))())
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
LABEL_5:
    *a4 = 1;
  }

}

void __31__AFConversation__removeNodes___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a2;
  objc_msgSend(v14, "item");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 32);
  objc_msgSend(v3, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = objc_msgSend(v4, "containsObject:", v5);

  if ((v4 & 1) == 0)
  {
    objc_msgSend(v14, "parentNode");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "_rootNode");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6 == v7)
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v6, "item");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "identifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

    }
    if (v9)
    {
      v10 = *(void **)(a1 + 32);
      objc_msgSend(v3, "identifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addObject:", v11);

      v12 = *(void **)(a1 + 48);
      objc_msgSend(v14, "absoluteIndexPath");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addObject:", v13);

      objc_msgSend(*(id *)(a1 + 56), "addObject:", v9);
    }

  }
}

uint64_t __31__AFConversation__removeNodes___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

@end
