@implementation MessageListRecentSectionDataSource

void __72__MessageListRecentSectionDataSource__configureCell_atIndexPath_itemID___block_invoke_2(uint64_t a1, void *a2, unsigned int a3)
{
  id v5;
  id WeakRetained;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  unsigned int v24;

  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
  if (WeakRetained)
  {
    v7 = objc_loadWeakRetained((id *)(a1 + 88));
    if (v7)
    {
      v24 = a3;
      objc_msgSend(v5, "itemID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setItemID:", v8);

      if ((objc_msgSend(*(id *)(a1 + 40), "isOutgoingMailbox") & 1) != 0)
        v9 = 1;
      else
        v9 = objc_msgSend(*(id *)(a1 + 40), "containsFollowUpMailbox");
      objc_msgSend(*(id *)(a1 + 32), "setOutgoingMailbox:", v9);
      objc_msgSend(*(id *)(a1 + 32), "setInbox:", objc_msgSend(*(id *)(a1 + 40), "containsInbox"));
      objc_msgSend(*(id *)(a1 + 32), "setCanShowReadLaterDate:", objc_msgSend(*(id *)(a1 + 40), "canShowReadLaterDate"));
      objc_msgSend(*(id *)(a1 + 32), "setSearchResult:", objc_msgSend(*(id *)(a1 + 40), "isSearch"));
      objc_msgSend(WeakRetained, "collectionView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "setVisible:", objc_msgSend(v10, "mui_isIndexPathVisible:", *(_QWORD *)(a1 + 48)));

      objc_msgSend(WeakRetained, "threadHelper");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = v11;
      if (v11)
      {
        v12 = objc_msgSend(v11, "styleForMessageListItem:", v5, v11);
        if (v12 == 1)
        {
          objc_msgSend(v7, "setDisclosureDelegate:", WeakRetained);
          objc_msgSend(WeakRetained, "messageList");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "expandedThreadItemIDs");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "containsObject:", *(_QWORD *)(a1 + 56));

          v12 = 1;
          if (v15)
            objc_msgSend(*(id *)(a1 + 32), "setDisclosureEnabled:", 1);
        }
      }
      else
      {
        v12 = 0;
      }
      objc_msgSend(v5, "displayMessageObjectID", v22);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v16, "globalMessageID"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "snippetHintsByGlobalMessageID");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "objectForKeyedSubscript:", v17);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (void *)objc_msgSend(v19, "copy");

      objc_msgSend(WeakRetained, "log");
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
        __72__MessageListRecentSectionDataSource__configureCell_atIndexPath_itemID___block_invoke_2_cold_1((uint64_t)v20, (uint64_t)v17, v21);

      objc_msgSend(*(id *)(a1 + 32), "setMessageListItem:style:hintsBySnippetZone:", v5, v12, v20);
      objc_msgSend(*(id *)(a1 + 32), "setShouldDisplayUnreadAndVIP:", objc_msgSend(*(id *)(a1 + 40), "shouldDisplayUnreadAndVIP"));
      objc_msgSend(*(id *)(a1 + 32), "setShouldAnnotateReplyOrForward:", 0);
      objc_msgSend(*(id *)(a1 + 32), "setShowsAccessory:showingDetail:", objc_msgSend(*(id *)(a1 + 40), "isOutgoingMailbox") ^ 1, objc_msgSend(*(id *)(a1 + 64), "messageListRecentSectionDataSourceIsInExpandedEnvironment:", WeakRetained));
      (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
      objc_msgSend(*(id *)(a1 + 64), "messageListSectionDataSource:didConfigureCell:atIndexPath:item:itemWasCached:duration:", WeakRetained, v7, *(_QWORD *)(a1 + 48), v5, v24, CACurrentMediaTime() - *(double *)(a1 + 96));

    }
  }

}

- (NSDictionary)snippetHintsByGlobalMessageID
{
  return self->_snippetHintsByGlobalMessageID;
}

- (uint64_t)_needsFlushSeparatorForItemID:(void *)a3 snapshot:(char)a4 useSplitViewStyling:
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;

  v7 = a2;
  v8 = a3;
  v9 = 0;
  if (a1 && (a4 & 1) == 0)
  {
    objc_msgSend(a1, "threadHelper");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v10, "needsFlushSeparatorForItemID:snapshot:", v7, v8);

  }
  return v9;
}

void __72__MessageListRecentSectionDataSource__configureCell_atIndexPath_itemID___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  id v10;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v10 = WeakRetained;
    v3 = objc_loadWeakRetained((id *)(a1 + 56));
    if (v3)
    {
      objc_msgSend(v3, "setEditing:animated:", objc_msgSend(*(id *)(a1 + 32), "isEditing"), 0);
      objc_msgSend(v10, "selectionModelProvider");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "selectionModelForMessageListSectionDataSource:", v10);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      if ((objc_msgSend(v5, "isMultipleSelectionActive") & 1) == 0 && v5)
      {
        objc_msgSend(v5, "configureSelectionForItemID:", *(_QWORD *)(a1 + 40));
        objc_msgSend(v10, "provider");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "messageListSectionDataSource:indexPathForItemIdentifier:", v10, *(_QWORD *)(a1 + 40));
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        if (v7)
        {
          objc_msgSend(v10, "_indexPathsForSelectedItems");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v9 = objc_msgSend(v8, "containsObject:", v7);

        }
        else
        {
          v9 = 0;
        }
        objc_msgSend(v3, "setSelected:", objc_msgSend(v5, "isSelectedItemID:", *(_QWORD *)(a1 + 40)) | v9);
        objc_msgSend(v3, "setNeedsUpdateConfiguration");

      }
    }

    WeakRetained = v10;
  }

}

- (void)_configureCell:(id)a3 atIndexPath:(id)a4 itemID:(id)a5
{
  id v8;
  id v9;
  CFTimeInterval v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  id v24;
  id v25;
  void *v26;
  id v27;
  id v28;
  void (**v29)(_QWORD);
  void (**v30)(void *, void *, uint64_t);
  void *v31;
  void *v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  _QWORD v41[5];
  id v42;
  id v43;
  id v44;
  id v45;
  void (**v46)(void *, void *, uint64_t);
  _QWORD v47[4];
  id v48;
  id v49;
  id v50;
  id v51;
  id v52;
  id v53;
  id v54;
  id v55[2];
  _QWORD aBlock[4];
  id v57;
  id v58;
  id v59;
  id v60;
  id location;
  _BYTE buf[12];
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v36 = a4;
  v9 = a5;
  v10 = CACurrentMediaTime();
  -[MessageListSectionDataSource state](self, "state");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "cellHelper");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[MessageListSectionDataSource layoutValuesHelper](self, "layoutValuesHelper");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "cellView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setLayoutValuesHelper:", v13);

  objc_msgSend(v12, "setCompact:", objc_msgSend(v11, "isCompact"));
  objc_msgSend(v12, "setExpanded:", -[MessageListRecentSectionDataSource _isExpandedItemID:](self, v9));
  objc_msgSend(v12, "setHideFollowUp:", -[MessageListRecentSectionDataSource shouldHideFollowUp](self, "shouldHideFollowUp"));
  objc_msgSend(v12, "setLocalMailboxSearchScope:", -[MessageListRecentSectionDataSource isLocalMailboxSearchScope](self, "isLocalMailboxSearchScope"));
  -[MessageListSectionDataSource messageList](self, "messageList");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[MessageListSectionDataSource itemHelper](self, "itemHelper");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[MessageListSectionDataSource provider](self, "provider");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "snapshotForMessageListSectionDataSource:", self);
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  -[MessageListSectionDataSource messageList](self, "messageList");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v38, "cellGroupingForItemID:snapshot:isThreaded:", v9, v40, objc_msgSend(v16, "isThreaded"));

  objc_msgSend(v8, "setBackgroundViewConfigurationGrouping:", v17);
  if ((objc_msgSend(v11, "useSplitViewStyling") & 1) == 0)
    objc_msgSend(v8, "setNeedsFlushSeparator:", -[MessageListRecentSectionDataSource _needsFlushSeparatorForItemID:snapshot:useSplitViewStyling:](self, v9, v40, objc_msgSend(v11, "useSplitViewStyling")));
  objc_msgSend(v8, "messageListItemFuture");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    -[MessageListSectionDataSource log](self, "log");
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v8, "messageListItemFuture");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v20;
      _os_log_impl(&dword_1D5522000, v19, OS_LOG_TYPE_DEFAULT, "Canceling messageListItemFuture to prepare for re-use: %@", buf, 0xCu);

    }
    objc_msgSend(v8, "messageListItemFuture");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "cancel");

    objc_msgSend(v8, "setMessageListItemFuture:", 0);
  }
  -[MessageListSectionDataSource delegate](self, "delegate");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)buf = 0xAAAAAAAAAAAAAAAALL;
  objc_initWeak((id *)buf, self);
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, v8);
  v23 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __72__MessageListRecentSectionDataSource__configureCell_atIndexPath_itemID___block_invoke;
  aBlock[3] = &unk_1E99E1998;
  objc_copyWeak(&v59, (id *)buf);
  objc_copyWeak(&v60, &location);
  v24 = v11;
  v57 = v24;
  v25 = v9;
  v58 = v25;
  v26 = _Block_copy(aBlock);
  v47[0] = v23;
  v47[1] = 3221225472;
  v47[2] = __72__MessageListRecentSectionDataSource__configureCell_atIndexPath_itemID___block_invoke_2;
  v47[3] = &unk_1E99E19C0;
  objc_copyWeak(&v54, (id *)buf);
  objc_copyWeak(v55, &location);
  v35 = v12;
  v48 = v35;
  v34 = v24;
  v49 = v34;
  v37 = v36;
  v50 = v37;
  v27 = v25;
  v51 = v27;
  v28 = v22;
  v52 = v28;
  v29 = v26;
  v53 = v29;
  v55[1] = *(id *)&v10;
  v30 = (void (**)(void *, void *, uint64_t))_Block_copy(v47);
  objc_msgSend(v39, "messageListItemForItemID:", v27);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "resultIfAvailable");
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  if (v32)
  {
    v30[2](v30, v32, 1);
  }
  else
  {
    v29[2](v29);
    v41[0] = v23;
    v41[1] = 3221225472;
    v41[2] = __72__MessageListRecentSectionDataSource__configureCell_atIndexPath_itemID___block_invoke_14;
    v41[3] = &unk_1E99E19E8;
    v46 = v30;
    v41[4] = self;
    v42 = v27;
    v43 = v37;
    v44 = v39;
    v45 = v28;
    v33 = -[MessageListSectionDataSource messageListItemForItemID:indexPath:receiver:completion:](self, "messageListItemForItemID:indexPath:receiver:completion:", v42, v43, v8, v41);

  }
  objc_destroyWeak(v55);
  objc_destroyWeak(&v54);

  objc_destroyWeak(&v60);
  objc_destroyWeak(&v59);
  objc_destroyWeak(&location);
  objc_destroyWeak((id *)buf);

}

- (BOOL)shouldHideFollowUp
{
  return self->_hideFollowUp;
}

- (BOOL)isLocalMailboxSearchScope
{
  return self->_localMailboxSearchScope;
}

- (uint64_t)_isExpandedItemID:(void *)a1
{
  id v3;
  void *v4;
  uint64_t v5;

  v3 = a2;
  if (a1)
  {
    objc_msgSend(a1, "messageList");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "isThreaded"))
      v5 = objc_msgSend(v4, "anyExpandedThreadContainsItemID:", v3);
    else
      v5 = 0;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)setLocalMailboxSearchScope:(BOOL)a3
{
  self->_localMailboxSearchScope = a3;
}

- (void)setHideFollowUp:(BOOL)a3
{
  self->_hideFollowUp = a3;
}

- (void)collection:(id)a3 shouldHighlightSnippetHints:(id)a4
{
  id v5;
  int v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = _os_feature_enabled_impl();
  if (v5 && v6)
  {
    -[MessageListSectionDataSource log](self, "log");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = objc_msgSend(v5, "count");
      v9 = (void *)MEMORY[0x1E0D1EF48];
      objc_msgSend(v5, "allValues");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "firstObject");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "partiallyRedactedDictionary:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 134218242;
      v14 = v8;
      v15 = 2112;
      v16 = v12;
      _os_log_impl(&dword_1D5522000, v7, OS_LOG_TYPE_DEFAULT, "[Snippet Hints] [Committed Search] Received (%ld) items: %@", (uint8_t *)&v13, 0x16u);

    }
    -[MessageListRecentSectionDataSource setSnippetHintsByGlobalMessageID:](self, "setSnippetHintsByGlobalMessageID:", v5);
  }

}

- (MessageListRecentSectionDataSource)initWithIdentifier:(id)a3 section:(id)a4 collectionView:(id)a5 messageList:(id)a6 initialLoadCompletedPromise:(id)a7 layoutValuesHelper:(id)a8 state:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  MessageListRecentSectionDataSource *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  EFCancelable *hideFollowUpUserDefaultsObserver;
  void *v29;
  id v30;
  uint64_t v31;
  EFCancelable *localMailboxSearchScopeUserDefaultsObserver;
  uint64_t v33;
  UICollectionViewSupplementaryRegistration *headerRegistration;
  id v36;
  id v37;
  _QWORD v38[4];
  id v39;
  id v40;
  _QWORD v41[4];
  id v42;
  id v43;
  id location;
  objc_super v45;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v21 = a9;
  v45.receiver = self;
  v45.super_class = (Class)MessageListRecentSectionDataSource;
  v22 = -[MessageListSectionDataSource initWithIdentifier:section:collectionView:messageList:initialLoadCompletedPromise:layoutValuesHelper:state:](&v45, sel_initWithIdentifier_section_collectionView_messageList_initialLoadCompletedPromise_layoutValuesHelper_state_, v15, v16, v17, v18, v19, v20, v21);
  if (v22)
  {
    v36 = v16;
    v37 = v15;
    objc_msgSend(MEMORY[0x1E0C99EA0], "em_userDefaults");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = *MEMORY[0x1E0D1E020];
    -[MessageListRecentSectionDataSource setHideFollowUp:](v22, "setHideFollowUp:", objc_msgSend(v23, "BOOLForKey:", *MEMORY[0x1E0D1E020]));
    location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, v22);
    v25 = MEMORY[0x1E0C809B0];
    v41[0] = MEMORY[0x1E0C809B0];
    v41[1] = 3221225472;
    v41[2] = __145__MessageListRecentSectionDataSource_initWithIdentifier_section_collectionView_messageList_initialLoadCompletedPromise_layoutValuesHelper_state___block_invoke;
    v41[3] = &unk_1E99E1908;
    objc_copyWeak(&v43, &location);
    v26 = v23;
    v42 = v26;
    objc_msgSend(v26, "ef_observeKeyPath:options:autoCancelToken:usingBlock:", v24, 1, 1, v41);
    v27 = objc_claimAutoreleasedReturnValue();
    hideFollowUpUserDefaultsObserver = v22->_hideFollowUpUserDefaultsObserver;
    v22->_hideFollowUpUserDefaultsObserver = (EFCancelable *)v27;

    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[MessageListRecentSectionDataSource setLocalMailboxSearchScope:](v22, "setLocalMailboxSearchScope:", objc_msgSend(v29, "BOOLForKey:", CFSTR("LocalMailboxSearchOnly")));
    v38[0] = v25;
    v38[1] = 3221225472;
    v38[2] = __145__MessageListRecentSectionDataSource_initWithIdentifier_section_collectionView_messageList_initialLoadCompletedPromise_layoutValuesHelper_state___block_invoke_2;
    v38[3] = &unk_1E99E1908;
    objc_copyWeak(&v40, &location);
    v30 = v29;
    v39 = v30;
    objc_msgSend(v30, "ef_observeKeyPath:options:autoCancelToken:usingBlock:", CFSTR("LocalMailboxSearchOnly"), 1, 1, v38);
    v31 = objc_claimAutoreleasedReturnValue();
    localMailboxSearchScopeUserDefaultsObserver = v22->_localMailboxSearchScopeUserDefaultsObserver;
    v22->_localMailboxSearchScopeUserDefaultsObserver = (EFCancelable *)v31;

    if (_os_feature_enabled_impl() && EMIsGreymatterSupportedWithOverride())
    {
      objc_msgSend(MEMORY[0x1E0DC3640], "registrationWithSupplementaryClass:elementKind:configurationHandler:", objc_opt_class(), *MEMORY[0x1E0DC48A8], &__block_literal_global_5);
      v33 = objc_claimAutoreleasedReturnValue();
      headerRegistration = v22->_headerRegistration;
      v22->_headerRegistration = (UICollectionViewSupplementaryRegistration *)v33;

    }
    objc_destroyWeak(&v40);

    objc_destroyWeak(&v43);
    objc_destroyWeak(&location);

    v16 = v36;
    v15 = v37;
  }

  return v22;
}

void __145__MessageListRecentSectionDataSource_initWithIdentifier_section_collectionView_messageList_initialLoadCompletedPromise_layoutValuesHelper_state___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
    objc_msgSend(WeakRetained, "setHideFollowUp:", objc_msgSend(*(id *)(a1 + 32), "BOOLForKey:", *MEMORY[0x1E0D1E020]));

}

void __145__MessageListRecentSectionDataSource_initWithIdentifier_section_collectionView_messageList_initialLoadCompletedPromise_layoutValuesHelper_state___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
    objc_msgSend(WeakRetained, "setLocalMailboxSearchScope:", objc_msgSend(*(id *)(a1 + 32), "BOOLForKey:", CFSTR("LocalMailboxSearchOnly")));

}

- (MessageListRecentSectionDataSource)initWithConfiguration:(id)a3
{
  MessageListRecentSectionDataSource *v3;
  MessageListRecentSectionDataSource *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MessageListRecentSectionDataSource;
  v3 = -[MessageListSectionDataSource initWithConfiguration:](&v6, sel_initWithConfiguration_, a3);
  v4 = v3;
  if (v3)
  {
    -[MessageListRecentSectionDataSource cellRegistration](v3);

  }
  return v4;
}

- (_QWORD)cellRegistration
{
  _QWORD *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  _QWORD v9[4];
  id v10;
  id location;

  if (a1)
  {
    v1 = a1;
    v2 = (void *)a1[24];
    if (!v2)
    {
      objc_msgSend(a1, "delegate");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "sectionListCellClassForMessageListSectionDataSource:", v1);
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      location = (id)0xAAAAAAAAAAAAAAAALL;
      objc_initWeak(&location, v1);
      v5 = (void *)MEMORY[0x1E0DC35C8];
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __54__MessageListRecentSectionDataSource_cellRegistration__block_invoke;
      v9[3] = &unk_1E99E1970;
      objc_copyWeak(&v10, &location);
      objc_msgSend(v5, "registrationWithCellClass:configurationHandler:", v4, v9);
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = (void *)v1[24];
      v1[24] = v6;

      objc_destroyWeak(&v10);
      objc_destroyWeak(&location);

      v2 = (void *)v1[24];
    }
    a1 = v2;
  }
  return a1;
}

void __54__MessageListRecentSectionDataSource_cellRegistration__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id *v6;
  id v7;
  id v8;
  id v9;
  id WeakRetained;

  v6 = (id *)(a1 + 32);
  v7 = a4;
  v8 = a3;
  v9 = a2;
  WeakRetained = objc_loadWeakRetained(v6);
  objc_msgSend(WeakRetained, "_configureCell:atIndexPath:itemID:", v9, v8, v7);

}

- (id)configuredCollectionViewCellForCollectionView:(id)a3 indexPath:(id)a4 itemID:(id)a5 cellIdentifier:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;

  v9 = a5;
  v10 = a4;
  v11 = a3;
  -[MessageListRecentSectionDataSource cellRegistration](self);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "dequeueConfiguredReusableCellWithRegistration:forIndexPath:item:", v12, v10, v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

void __72__MessageListRecentSectionDataSource__configureCell_atIndexPath_itemID___block_invoke_14(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  int v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = v5;
  if (a2)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
  }
  else
  {
    v7 = objc_msgSend(v5, "ef_isCancelledError");
    objc_msgSend(*(id *)(a1 + 32), "log");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v7)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v10 = *(_QWORD *)(a1 + 40);
        objc_msgSend(*(id *)(a1 + 48), "ef_publicDescription");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "ef_publicDescription");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = 138543874;
        v14 = v10;
        v15 = 2114;
        v16 = v11;
        v17 = 2114;
        v18 = v12;
        _os_log_impl(&dword_1D5522000, v9, OS_LOG_TYPE_DEFAULT, "Cancel messageListItem for itemID=%{public}@, indexPath=%{public}@, error=%{public}@", (uint8_t *)&v13, 0x20u);

      }
    }
    else
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        __72__MessageListRecentSectionDataSource__configureCell_atIndexPath_itemID___block_invoke_14_cold_1(a1, v6, v9);

      objc_msgSend(*(id *)(a1 + 64), "messageListSectionDataSource:didFailToConfigureCellAtIndexPath:error:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48), v6);
    }
  }

}

- (id)_indexPathsForSelectedItems
{
  void *v2;
  void *v3;

  -[MessageListSectionDataSource collectionView](self, "collectionView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "indexPathsForSelectedItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)hasSupplementaryViewOfKind:(id)a3
{
  id v3;
  BOOL v4;

  v3 = a3;
  v4 = _os_feature_enabled_impl()
    && EMIsGreymatterSupportedWithOverride()
    && (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0DC48A8]) & 1) != 0;

  return v4;
}

- (id)configuredReusableSupplementaryViewForCollectionView:(id)a3 elementKind:(id)a4 indexPath:(id)a5
{
  id v8;
  id v9;
  id v10;
  UICollectionViewSupplementaryRegistration *headerRegistration;
  void *v12;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (_os_feature_enabled_impl()
    && EMIsGreymatterSupportedWithOverride()
    && objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0DC48A8]))
  {
    if (self)
      headerRegistration = self->_headerRegistration;
    else
      headerRegistration = 0;
    objc_msgSend(v8, "dequeueConfiguredReusableSupplementaryViewWithRegistration:forIndexPath:", headerRegistration, v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (void)setSnippetHintsByGlobalMessageID:(id)a3
{
  objc_storeStrong((id *)&self->_snippetHintsByGlobalMessageID, a3);
}

- (EFCancelable)hideFollowUpUserDefaultsObserver
{
  return self->_hideFollowUpUserDefaultsObserver;
}

- (void)setHideFollowUpUserDefaultsObserver:(id)a3
{
  objc_storeStrong((id *)&self->_hideFollowUpUserDefaultsObserver, a3);
}

- (EFCancelable)localMailboxSearchScopeUserDefaultsObserver
{
  return self->_localMailboxSearchScopeUserDefaultsObserver;
}

- (void)setLocalMailboxSearchScopeUserDefaultsObserver:(id)a3
{
  objc_storeStrong((id *)&self->_localMailboxSearchScopeUserDefaultsObserver, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localMailboxSearchScopeUserDefaultsObserver, 0);
  objc_storeStrong((id *)&self->_hideFollowUpUserDefaultsObserver, 0);
  objc_storeStrong((id *)&self->_snippetHintsByGlobalMessageID, 0);
  objc_storeStrong((id *)&self->_headerRegistration, 0);
  objc_storeStrong((id *)&self->_cellRegistration, 0);
}

void __72__MessageListRecentSectionDataSource__configureCell_atIndexPath_itemID___block_invoke_2_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D1EF48], "partiallyRedactedDictionary:", a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412546;
  v7 = v5;
  v8 = 2112;
  v9 = a2;
  _os_log_debug_impl(&dword_1D5522000, a3, OS_LOG_TYPE_DEBUG, "Found hints: %@, for id: %@", (uint8_t *)&v6, 0x16u);

}

void __72__MessageListRecentSectionDataSource__configureCell_atIndexPath_itemID___block_invoke_14_cold_1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 48), "ef_publicDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(a1 + 56);
  objc_msgSend(a2, "ef_publicDescription");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 138544130;
  v11 = v6;
  v12 = 2114;
  v13 = v7;
  v14 = 2048;
  v15 = v8;
  v16 = 2112;
  v17 = v9;
  _os_log_error_impl(&dword_1D5522000, a3, OS_LOG_TYPE_ERROR, "Failed to obtain messageListItem for itemID:%{public}@ at indexPath:%{public}@ in messageList:%p with error:%@", (uint8_t *)&v10, 0x2Au);

}

@end
