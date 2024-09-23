@implementation CKConversationListCollectionViewController

void __82__CKConversationListCollectionViewController_updateConversationNamesForNicknames___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = a2;
  v8 = v3;
  if (*(_BYTE *)(a1 + 40))
  {
    objc_msgSend(v3, "resetNameCaches");
  }
  else
  {
    v4 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(v3, "handles");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "__imArrayByApplyingBlock:", &__block_literal_global_700_0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setWithArray:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(*(id *)(a1 + 32), "intersectsSet:", v7))
      objc_msgSend(v8, "resetNameCaches");

  }
}

- (void)_ensureCellLayoutOnCell:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  objc_class *v8;
  void *v9;
  id v10;

  v5 = a3;
  -[CKConversationListCollectionViewController cellLayout](self, "cellLayout");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CKConversationListCollectionViewController+DataSource.m"), 1260, CFSTR("%@ needs a cell layout."), v9);

  }
  -[CKConversationListCollectionViewController cellLayout](self, "cellLayout");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCellLayout:", v10);

}

- (CKConversationListCellLayout)cellLayout
{
  return self->_cellLayout;
}

- (double)widthForDeterminingAvatarVisibility
{
  void *v2;
  double v3;
  double v4;

  -[CKConversationListCollectionViewController collectionView](self, "collectionView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bounds");
  v4 = v3;

  return v4;
}

uint64_t __60__CKConversationListCollectionViewController_viewDidAppear___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  if (objc_msgSend(*(id *)(a1 + 32), "filterMode") == 3 || objc_msgSend(*(id *)(a1 + 32), "filterMode") == 2)
  {
    objc_msgSend(*(id *)(a1 + 32), "conversationList");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "updateConversationsWasKnownSender");

    objc_msgSend(*(id *)(a1 + 32), "conversationList");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "beginWasKnownSenderHold");

  }
  return objc_msgSend(*(id *)(a1 + 32), "viewDidAppearDeferredSetup");
}

- (void)_updateContentUnavailableConfigurationUsingState:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;

  -[CKConversationListCollectionViewController delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isCollapsed");

  if ((v5 & 1) == 0
    || -[CKConversationListCollectionViewController filterMode](self, "filterMode") == 7
    || -[CKConversationListCollectionViewController filterMode](self, "filterMode") == 9
    || (-[CKConversationListCollectionViewController dataSource](self, "dataSource"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v6, "snapshot"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "numberOfItems"),
        v7,
        v6,
        v8 >= 1))
  {
    -[CKConversationListCollectionViewController _setContentUnavailableConfiguration:](self, "_setContentUnavailableConfiguration:", 0);
  }
  else
  {
    -[CKConversationListCollectionViewController _defaultEmptyStateConfiguration](self, "_defaultEmptyStateConfiguration");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    -[CKConversationListCollectionViewController _setContentUnavailableConfiguration:](self, "_setContentUnavailableConfiguration:", v9);

  }
}

id __87__CKConversationListCollectionViewController_DataSource__dataSourceWithCollectionView___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id *v6;
  id v7;
  id v8;
  id v9;
  id WeakRetained;
  void *v11;

  v6 = (id *)(a1 + 32);
  v7 = a4;
  v8 = a3;
  v9 = a2;
  WeakRetained = objc_loadWeakRetained(v6);
  objc_msgSend(WeakRetained, "cellForIndexPath:inCollectionView:withItemIdentifier:", v8, v9, v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)cellForIndexPath:(id)a3 inCollectionView:(id)a4 withItemIdentifier:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  int v14;
  id v15;
  void *v16;
  int v17;
  void *v18;
  int v19;
  void *v20;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  switch(objc_msgSend(v8, "section"))
  {
    case 0:
      if (-[CKConversationListCollectionViewController isBelowMacSnapToMinWidth](self, "isBelowMacSnapToMinWidth"))
        -[CKConversationListCollectionViewController cellForCollapsedSidebarFocusFilterCellInCollectionView:atIndexPath:](self, "cellForCollapsedSidebarFocusFilterCellInCollectionView:atIndexPath:", v9, v8);
      else
        -[CKConversationListCollectionViewController cellForFocusFilterInCollectionView:atIndexPath:](self, "cellForFocusFilterInCollectionView:atIndexPath:", v9, v8);
      v11 = objc_claimAutoreleasedReturnValue();
      goto LABEL_22;
    case 1:
      -[CKConversationListCollectionViewController cellForPinningOnboardingTitleViewCollectionView:atIndexPath:](self, "cellForPinningOnboardingTitleViewCollectionView:atIndexPath:", v9, v8);
      v11 = objc_claimAutoreleasedReturnValue();
      goto LABEL_22;
    case 2:
      +[CKPinnedConversationDropTargetCollectionViewCell uniqueIdentifier](CKPinnedConversationDropTargetCollectionViewCell, "uniqueIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v10, "isEqualToString:", v12))
      {

LABEL_13:
        -[CKConversationListCollectionViewController cellForPinnedConversationDropTargetInCollectionView:atIndexPath:](self, "cellForPinnedConversationDropTargetInCollectionView:atIndexPath:", v9, v8);
        v11 = objc_claimAutoreleasedReturnValue();
        goto LABEL_22;
      }
      +[CKPinnedConversationDropTargetCollectionViewCell uniqueIdentifierForDropTargetAtItemIndex:](CKPinnedConversationDropTargetCollectionViewCell, "uniqueIdentifierForDropTargetAtItemIndex:", objc_msgSend(v8, "item"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v10, "isEqualToString:", v16);

      if (v17)
        goto LABEL_13;
      if (-[CKConversationListCollectionViewController isBelowMacSnapToMinWidth](self, "isBelowMacSnapToMinWidth"))
      {
LABEL_19:
        -[CKConversationListCollectionViewController cellForStandardConversationWithItemIdentifier:inCollectionView:atIndexPath:](self, "cellForStandardConversationWithItemIdentifier:inCollectionView:atIndexPath:", v10, v9, v8);
        v15 = (id)objc_claimAutoreleasedReturnValue();
LABEL_20:
        v20 = v15;
        -[CKConversationListCollectionViewController _ensureCellLayoutOnCell:](self, "_ensureCellLayoutOnCell:", v15);
      }
      else
      {
        -[CKConversationListCollectionViewController cellForPinnedConversationWithItemIdentifier:inCollectionView:atIndexPath:](self, "cellForPinnedConversationWithItemIdentifier:inCollectionView:atIndexPath:", v10, v9, v8);
        v11 = objc_claimAutoreleasedReturnValue();
LABEL_22:
        v20 = (void *)v11;
      }
LABEL_23:

      return v20;
    case 3:
      +[CKTipKitOnboardingCollectionViewCell reuseIdentifier](CKTipKitOnboardingCollectionViewCell, "reuseIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v10, "isEqualToString:", v13);

      if (v14)
      {
        -[CKConversationListCollectionViewController tipKitOnboardingCollectionView:atIndexPath:](self, "tipKitOnboardingCollectionView:atIndexPath:", v9, v8);
        v11 = objc_claimAutoreleasedReturnValue();
        goto LABEL_22;
      }
      +[CKTipCollectionViewCell reuseIdentifier](_TtC7ChatKit23CKTipCollectionViewCell, "reuseIdentifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v10, "isEqualToString:", v18);

      if (v19)
      {
        -[CKConversationListCollectionViewController tipCollectionViewCell:atIndexPath:](self, "tipCollectionViewCell:atIndexPath:", v9, v8);
        v11 = objc_claimAutoreleasedReturnValue();
        goto LABEL_22;
      }
LABEL_16:
      v20 = 0;
      goto LABEL_23;
    case 4:
      v15 = -[CKConversationListCollectionViewController newMessageCellInCollectionView:atIndexPath:](self, "newMessageCellInCollectionView:atIndexPath:", v9, v8);
      goto LABEL_20;
    case 5:
      goto LABEL_19;
    case 6:
      -[CKConversationListCollectionViewController cellForRecoverableConversationWithItemIdentifier:inCollectionView:atIndexPath:](self, "cellForRecoverableConversationWithItemIdentifier:inCollectionView:atIndexPath:", v10, v9, v8);
      v15 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_20;
    default:
      goto LABEL_16;
  }
}

- (id)cellForStandardConversationWithItemIdentifier:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (-[CKConversationListCollectionViewController filterMode](self, "filterMode") == 9)
  {
    -[CKConversationListCollectionViewController cellForRecoverableConversationWithItemIdentifier:inCollectionView:atIndexPath:](self, "cellForRecoverableConversationWithItemIdentifier:inCollectionView:atIndexPath:", v8, v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[CKConversationListCollectionViewConversationCell reuseIdentifier](CKConversationListCollectionViewConversationCell, "reuseIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", v12, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[CKConversationListCollectionViewController standardCellLayout](self, "standardCellLayout");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKConversationListCollectionViewController setCellLayout:](self, "setCellLayout:", v13);

    -[CKConversationListCollectionViewController _ensureCellLayoutOnCell:](self, "_ensureCellLayoutOnCell:", v11);
    -[CKConversationListCollectionViewController configureConversationCell:forItemIdentifier:](self, "configureConversationCell:forItemIdentifier:", v11, v8);
  }

  return v11;
}

- (CKConversationListCellLayout)standardCellLayout
{
  CKConversationListCellLayout *standardCellLayout;
  CKConversationListCellLayout *v4;
  CKConversationListCellLayout *v5;

  standardCellLayout = self->_standardCellLayout;
  if (!standardCellLayout)
  {
    v4 = (CKConversationListCellLayout *)objc_opt_new();
    v5 = self->_standardCellLayout;
    self->_standardCellLayout = v4;

    standardCellLayout = self->_standardCellLayout;
  }
  return standardCellLayout;
}

- (void)setCellLayout:(id)a3
{
  objc_storeStrong((id *)&self->_cellLayout, a3);
}

- (void)setCompletedDeferredSetup:(BOOL)a3
{
  self->_completedDeferredSetup = a3;
}

- (id)itemIdentifiersForConversations:(id)a3 inSection:(unint64_t)a4
{
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  __int128 v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t buf[4];
  unint64_t v25;
  __int16 v26;
  uint64_t v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E10]), "initWithCapacity:", objc_msgSend(v6, "count"));
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
  if (v9)
  {
    v11 = *(_QWORD *)v21;
    *(_QWORD *)&v10 = 138412546;
    v19 = v10;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v21 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i);
        -[CKConversationListCollectionViewController itemIdentifierForConversation:inSection:](self, "itemIdentifierForConversation:inSection:", v13, a4, v19);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v14, "length"))
        {
          if (!IMOSLoggingEnabled())
            goto LABEL_16;
          OSLogHandleForIMFoundationCategory();
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 134218242;
            v25 = a4;
            v26 = 2112;
            v27 = v13;
            _os_log_impl(&dword_18DFCD000, v16, OS_LOG_TYPE_INFO, "Conversation has a nil item identifier for section: %ld, conversation: %@", buf, 0x16u);
          }
          goto LABEL_15;
        }
        v15 = objc_msgSend(v7, "count");
        objc_msgSend(v7, "addObject:", v14);
        if (v15 == objc_msgSend(v7, "count") && IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = v19;
            v25 = (unint64_t)v14;
            v26 = 2112;
            v27 = v13;
            _os_log_impl(&dword_18DFCD000, v16, OS_LOG_TYPE_INFO, "Conversation list contains duplicate chat guids. Offending identifier: %@, conversation: %@", buf, 0x16u);
          }
LABEL_15:

        }
LABEL_16:

      }
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
    }
    while (v9);
  }

  objc_msgSend(v7, "array");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (id)itemIdentifierForConversation:(id)a3 inSection:(unint64_t)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v11;

  v6 = a3;
  v7 = v6;
  switch(a4)
  {
    case 0uLL:
    case 1uLL:
    case 3uLL:
      objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("Invalid section identifier"), 0);
      v11 = (id)objc_claimAutoreleasedReturnValue();
      objc_exception_throw(v11);
    case 2uLL:
      objc_msgSend(v6, "conversationListCollectionViewPinnedItemIdentifier");
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    case 4uLL:
      +[CKConversationListNewMessageCollectionViewCell reuseIdentifier](CKConversationListNewMessageCollectionViewCell, "reuseIdentifier");
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    case 5uLL:
      if (-[CKConversationListCollectionViewController filterMode](self, "filterMode") == 9)
        objc_msgSend(v7, "conversationListCollectionViewJunkItemIdentifier");
      else
        objc_msgSend(v7, "conversationListCollectionViewListItemIdentifier");
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    case 6uLL:
      objc_msgSend(v6, "conversationListCollectionViewRecentlyDeletedListItemIdentifier");
      v8 = objc_claimAutoreleasedReturnValue();
LABEL_10:
      v9 = (void *)v8;
      break;
    default:
      v9 = 0;
      break;
  }

  return v9;
}

- (unint64_t)filterMode
{
  return self->_filterMode;
}

- (void)updateContentsOfAllCellsAnimated:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  os_signpost_id_t v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  NSObject *v16;
  NSObject *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[8];
  _BYTE v23[128];
  uint64_t v24;

  v3 = a3;
  v24 = *MEMORY[0x1E0C80C00];
  -[CKConversationListCollectionViewController conversationListCollectionViewControllerLogHandle](self, "conversationListCollectionViewControllerLogHandle");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_signpost_id_generate(v5);

  -[CKConversationListCollectionViewController conversationListCollectionViewControllerLogHandle](self, "conversationListCollectionViewControllerLogHandle");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_18DFCD000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "updateContentsOfAllCells", ", buf, 2u);
  }

  -[CKConversationListCollectionViewController collectionView](self, "collectionView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "indexPathsForVisibleItems");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v11 = v10;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v19 != v14)
          objc_enumerationMutation(v11);
        -[CKConversationListCollectionViewController updateContentsOfCellWithIndexPath:animated:](self, "updateContentsOfCellWithIndexPath:animated:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i), v3, (_QWORD)v18);
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    }
    while (v13);
  }

  -[CKConversationListCollectionViewController conversationListCollectionViewControllerLogHandle](self, "conversationListCollectionViewControllerLogHandle");
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_18DFCD000, v17, OS_SIGNPOST_INTERVAL_END, v6, "updateContentsOfAllCells", ", buf, 2u);
  }

}

- (void)updateContentsOfCellWithIndexPath:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  void *v7;
  id v8;

  v4 = a4;
  v8 = a3;
  -[CKConversationListCollectionViewController dataSource](self, "dataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "itemIdentifierForIndexPath:", v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    -[CKConversationListCollectionViewController updateContentsOfCellWithItemIdentifier:indexPath:animated:](self, "updateContentsOfCellWithItemIdentifier:indexPath:animated:", v7, v8, v4);

}

- (UICollectionViewDiffableDataSource)dataSource
{
  return self->_dataSource;
}

- (void)updateContentsOfCellWithItemIdentifier:(id)a3 indexPath:(id)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  void *v9;
  void *v10;
  id v11;

  v5 = a5;
  v11 = a3;
  v8 = a4;
  -[CKConversationListCollectionViewController collectionView](self, "collectionView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "cellForItemAtIndexPath:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
    -[CKConversationListCollectionViewController updateContentsOfCell:withItemIdentifier:atIndexPath:animated:](self, "updateContentsOfCell:withItemIdentifier:atIndexPath:animated:", v10, v11, v8, v5);

}

- (void)updateContentsOfCell:(id)a3 withItemIdentifier:(id)a4 atIndexPath:(id)a5 animated:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  objc_class *v15;
  void *v16;
  int v17;
  void *v18;
  uint64_t v19;

  v6 = a6;
  v19 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[CKConversationListCollectionViewController configurePinnedConversationCell:forItemIdentifier:indexPath:animated:](self, "configurePinnedConversationCell:forItemIdentifier:indexPath:animated:", v10, v11, v12, v6);
    goto LABEL_12;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[CKConversationListCollectionViewController configureDropTargetCell:](self, "configureDropTargetCell:", v10);
    goto LABEL_12;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v13 = v10;
    -[CKConversationListCollectionViewController _ensureCellLayoutOnCell:](self, "_ensureCellLayoutOnCell:", v13);
    -[CKConversationListCollectionViewController configureNewMessageCell:](self, "configureNewMessageCell:", v13);
LABEL_11:

    goto LABEL_12;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v13 = v10;
    -[CKConversationListCollectionViewController _ensureCellLayoutOnCell:](self, "_ensureCellLayoutOnCell:", v13);
    -[CKConversationListCollectionViewController configureRecoverableConversationCell:forItemIdentifier:](self, "configureRecoverableConversationCell:forItemIdentifier:", v13, v11);
    goto LABEL_11;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v13 = v10;
    -[CKConversationListCollectionViewController _ensureCellLayoutOnCell:](self, "_ensureCellLayoutOnCell:", v13);
    -[CKConversationListCollectionViewController configureConversationCell:forItemIdentifier:](self, "configureConversationCell:forItemIdentifier:", v13, v11);
    goto LABEL_11;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[CKConversationListCollectionViewController configureTipKitOnboardingCell:](self, "configureTipKitOnboardingCell:", v10);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[CKConversationListCollectionViewController configureTipCollectionViewCell:](self, "configureTipCollectionViewCell:", v10);
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        -[CKConversationListCollectionViewController configureOnboardingTitleCell:](self, "configureOnboardingTitleCell:", v10);
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          -[CKConversationListCollectionViewController configureFocusFilterCell:](self, "configureFocusFilterCell:", v10);
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            -[CKConversationListCollectionViewController configureFocusFilterCollapsedCell:](self, "configureFocusFilterCollapsedCell:", v10);
          }
          else if (IMOSLoggingEnabled())
          {
            OSLogHandleForIMFoundationCategory();
            v14 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
            {
              v15 = (objc_class *)objc_opt_class();
              NSStringFromClass(v15);
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              v17 = 138412290;
              v18 = v16;
              _os_log_impl(&dword_18DFCD000, v14, OS_LOG_TYPE_INFO, "Unhandled cell of class %@ in -[updateContentsOfCell:withItemIdentifier:atIndexPath:animated:].", (uint8_t *)&v17, 0xCu);

            }
          }
        }
      }
    }
  }
LABEL_12:

}

- (void)configureConversationCell:(id)a3 forItemIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v6 = a4;
  v7 = a3;
  -[CKConversationListCollectionViewController conversationForItemIdentifier:](self, "conversationForItemIdentifier:", v6);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  -[CKConversationListCollectionViewController _ensureCellLayoutOnCell:](self, "_ensureCellLayoutOnCell:", v7);
  objc_msgSend(v7, "updateContentsForConversation:fastPreview:", v11, -[CKConversationListCollectionViewController shouldUseFastPreviewText](self, "shouldUseFastPreviewText"));
  objc_msgSend(v7, "leadingEditingAccessoryConfigurationsForEditingMode:", -[CKConversationListCollectionViewController editingMode](self, "editingMode"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setLeadingEditingAccessoryConfigurations:", v8);

  objc_msgSend(v7, "trailingEditingAccessoryConfigurationsForEditingMode:", -[CKConversationListCollectionViewController editingMode](self, "editingMode"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTrailingEditingAccessoryConfigurations:", v9);

  -[CKConversationListCollectionViewController delegate](self, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setShouldUseSidebarBackgroundConfiguration:", objc_msgSend(v10, "isCollapsed") ^ 1);

  objc_msgSend(v7, "setEditingMode:", -[CKConversationListCollectionViewController editingMode](self, "editingMode"));
  objc_msgSend(v7, "setEmbeddedCellDelegate:", self);
  -[CKConversationListCollectionViewController _configureAvatarViewInConversationCell:forItemIdentifier:](self, "_configureAvatarViewInConversationCell:forItemIdentifier:", v7, v6);
  -[CKConversationListCollectionViewController _configureInteractiveAvatarInConversationCell:forItemIdentifier:](self, "_configureInteractiveAvatarInConversationCell:forItemIdentifier:", v7, v6);

}

- (unint64_t)editingMode
{
  return self->_editingMode;
}

- (id)conversationForItemIdentifier:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  __CFString *v9;
  void *v10;
  NSObject *v11;
  uint8_t v13[16];

  v4 = a3;
  +[CKConversationListNewMessageCollectionViewCell reuseIdentifier](CKConversationListNewMessageCollectionViewCell, "reuseIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqualToString:", v5);

  if (!v6)
  {
    v9 = CFSTR("pinned-");
    if ((objc_msgSend(v4, "hasPrefix:", CFSTR("pinned-")) & 1) != 0
      || (v9 = CFSTR("list-"), (objc_msgSend(v4, "hasPrefix:", CFSTR("list-")) & 1) != 0)
      || (v9 = CFSTR("junk-"), (objc_msgSend(v4, "hasPrefix:", CFSTR("junk-")) & 1) != 0)
      || (v9 = CFSTR("recoverable-"), (objc_msgSend(v4, "hasPrefix:", CFSTR("recoverable-")) & 1) != 0))
    {
      objc_msgSend(v4, "substringFromIndex:", -[__CFString length](v9, "length"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v7, "length"))
      {
        -[CKConversationListCollectionViewController conversationList](self, "conversationList");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "conversationForExistingChatWithGUID:", v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_15;
      }
    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v13 = 0;
          _os_log_impl(&dword_18DFCD000, v11, OS_LOG_TYPE_INFO, "Invalid conversation itemIdentifier. Lacks section prefix.", v13, 2u);
        }

      }
      v7 = 0;
    }
    v8 = 0;
    goto LABEL_15;
  }
  -[CKConversationListCollectionViewController conversationList](self, "conversationList");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "pendingConversation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_15:

  return v8;
}

- (id)conversationList
{
  return +[CKConversationList sharedConversationList](CKConversationList, "sharedConversationList");
}

- (CKConversationListControllerDelegate)delegate
{
  return (CKConversationListControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (BOOL)shouldUseFastPreviewText
{
  return self->_shouldUseFastPreviewText;
}

- (void)_configureInteractiveAvatarInConversationCell:(id)a3 forItemIdentifier:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  _CKCollectionViewTapGestureRecognizer *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v6 = a4;
  objc_msgSend(v12, "avatarView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setUserInteractionEnabled:", 1);
  objc_msgSend(v7, "setForcePressView:", v7);
  objc_msgSend(v12, "avatarViewTapGestureRecognizer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    v9 = -[_CKCollectionViewTapGestureRecognizer initWithTarget:action:]([_CKCollectionViewTapGestureRecognizer alloc], "initWithTarget:action:", self, sel_avatarViewTapped_);
    objc_msgSend(v12, "setAvatarViewTapGestureRecognizer:", v9);

    objc_msgSend(v12, "avatarViewTapGestureRecognizer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addGestureRecognizer:", v10);

  }
  objc_msgSend(v12, "avatarViewTapGestureRecognizer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setOriginatingItemIdentifier:", v6);

}

- (void)_configureAvatarViewInConversationCell:(id)a3 forItemIdentifier:(id)a4
{
  id v5;
  id v6;

  v5 = a3;
  objc_msgSend(v5, "setDelegate:", self);
  objc_msgSend(v5, "avatarView");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setPresentingViewController:", self);
}

- (OS_os_log)conversationListCollectionViewControllerLogHandle
{
  return (OS_os_log *)objc_msgSend((id)objc_opt_class(), "conversationListCollectionViewControllerLogHandle");
}

+ (id)conversationListCollectionViewControllerLogHandle
{
  if (conversationListCollectionViewControllerLogHandle_onceToken != -1)
    dispatch_once(&conversationListCollectionViewControllerLogHandle_onceToken, &__block_literal_global_740_0);
  return (id)conversationListCollectionViewControllerLogHandle_sLogHandle;
}

void __61__CKConversationListCollectionViewController_viewWillAppear___block_invoke_2(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "conversationList");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "updateRecoverableConversationList");

}

- (void)scrollViewDidScroll:(id)a3
{
  id v4;
  void *v5;
  _BOOL4 v6;
  id v7;

  v7 = a3;
  -[CKConversationListCollectionViewController collectionView](self, "collectionView");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  v5 = v7;
  if (v4 == v7)
  {
    -[CKConversationListCollectionViewController updateBannerConstraintsForScrollViewDidScroll:](self, "updateBannerConstraintsForScrollViewDidScroll:", v7);
    v6 = -[CKConversationListCollectionViewController hasActivePinnedConversationDropSession](self, "hasActivePinnedConversationDropSession");
    v5 = v7;
    if (v6)
    {
      -[CKConversationListCollectionViewController _ck_setNeedsUpdateOfMultitaskingDragExclusionRects](self, "_ck_setNeedsUpdateOfMultitaskingDragExclusionRects");
      v5 = v7;
    }
  }

}

- (void)updateBannerConstraintsForScrollViewDidScroll:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CKConversationListCollectionViewController collectionView](self, "collectionView");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
  {
    -[CKConversationListCollectionViewController _updateBannerLayoutConstraints](self, "_updateBannerLayoutConstraints");
    -[CKConversationListCollectionViewController _updateScrollEdgeAppearanceProgress](self, "_updateScrollEdgeAppearanceProgress");
  }
}

- (void)_updateBannerLayoutConstraints
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  double v7;
  double v8;
  double v9;
  double v10;
  BOOL v11;
  double v12;
  double v13;
  double v14;
  id v15;

  -[CKConversationListCollectionViewController bannerTopConstraint](self, "bannerTopConstraint");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v15 = v3;
    -[CKConversationListCollectionViewController collectionView](self, "collectionView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKConversationListCollectionViewController navigationItem](self, "navigationItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "largeTitleDisplayMode");

    objc_msgSend(v4, "contentOffset");
    v8 = v7;
    objc_msgSend(v4, "adjustedContentInset");
    v10 = v8 + v9;
    v11 = v10 < 0.0 && v6 == 0;
    v12 = -v10;
    if (v11)
      v13 = v12;
    else
      v13 = 0.0;
    objc_msgSend(v15, "constant");
    if (v13 != v14)
      objc_msgSend(v15, "setConstant:", v13);

    v3 = v15;
  }

}

- (void)performResumeDeferredSetup
{
  void *v3;
  char v4;

  if (-[CKConversationListCollectionViewController shouldUseFastPreviewText](self, "shouldUseFastPreviewText"))
  {
    -[CKConversationListCollectionViewController setShouldUseFastPreviewText:](self, "setShouldUseFastPreviewText:", 0);
    -[CKConversationListCollectionViewController updateContentsOfAllCellsAnimated:](self, "updateContentsOfAllCellsAnimated:", 0);
  }
  -[CKConversationListCollectionViewController updateSyncProgressIfNeeded](self, "updateSyncProgressIfNeeded");
  objc_msgSend(MEMORY[0x1E0D357A0], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isStewieActive");

  if ((v4 & 1) == 0)
    -[CKConversationListCollectionViewController _presentSatelliteConnectionBannerIfNecessaryWithConversation:withReason:](self, "_presentSatelliteConnectionBannerIfNecessaryWithConversation:withReason:", 0, CFSTR("AppResume"));
  -[CKConversationListCollectionViewController setCompletedDeferredSetup:](self, "setCompletedDeferredSetup:", 1);
}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  const __CFString *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  id *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  const __CFString *v24;
  const __CFString *v25;
  _QWORD v26[4];
  id v27;
  _QWORD block[5];
  objc_super v29;
  uint8_t buf[4];
  const char *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  const __CFString *v37;
  uint64_t v38;

  v3 = a3;
  v38 = *MEMORY[0x1E0C80C00];
  if (IMOSLoggingEnabled())
  {
    CKLogCStringForType(32);
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      v6 = CFSTR("NO");
      if (v3)
        v6 = CFSTR("YES");
      *(_DWORD *)buf = 138412290;
      v31 = (const char *)v6;
      _os_log_impl(&dword_18DFCD000, v5, OS_LOG_TYPE_DEBUG, "viewDidAppear, animated=%@", buf, 0xCu);
    }

  }
  if (os_log_shim_legacy_logging_enabled() && _CKShouldLog())
  {
    v7 = CFSTR("NO");
    if (v3)
      v7 = CFSTR("YES");
    v25 = v7;
    _CKLog();
  }
  v29.receiver = self;
  v29.super_class = (Class)CKConversationListCollectionViewController;
  -[CKConversationListCollectionViewController viewDidAppear:](&v29, sel_viewDidAppear_, v3, v25);
  -[CKConversationListCollectionViewController collectionView](self, "collectionView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "flashScrollIndicators");

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObserver:selector:name:object:", self, sel__keyboardWillShow_, *MEMORY[0x1E0CEB978], 0);
  objc_msgSend(v9, "addObserver:selector:name:object:", self, sel__keyboardWillHide_, *MEMORY[0x1E0CEB970], 0);
  if (__CurrentTestName
    && (objc_msgSend((id)__CurrentTestName, "rangeOfString:", CFSTR("ShowMessages")) != 0x7FFFFFFFFFFFFFFFLL
     || (objc_msgSend((id)__CurrentTestName, "isEqualToString:", CFSTR("ScrollTranscript")) & 1) != 0
     || (objc_msgSend((id)__CurrentTestName, "isEqualToString:", CFSTR("ScrollTranscriptWebView")) & 1) != 0
     || (objc_msgSend((id)__CurrentTestName, "isEqualToString:", CFSTR("ScrollTranscriptEmoji")) & 1) != 0
     || objc_msgSend((id)__CurrentTestName, "isEqualToString:", CFSTR("ScrollTranscriptFullScreen"))))
  {
    v10 = (id *)MEMORY[0x1E0CEB258];
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(*v10, "didShowTranscriptList");
  }
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "conversationListHidesSearchBarWhenScrolling");
  -[CKConversationListCollectionViewController navigationItem](self, "navigationItem");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setHidesSearchBarWhenScrolling:", v12);

  -[CKConversationListCollectionViewController setIsAppearing:](self, "setIsAppearing:", 0);
  -[CKConversationListCollectionViewController updateSyncProgressIfNeeded](self, "updateSyncProgressIfNeeded");
  -[CKConversationListCollectionViewController updateBannerVisualEffectGroup](self, "updateBannerVisualEffectGroup");
  v14 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__CKConversationListCollectionViewController_viewDidAppear___block_invoke;
  block[3] = &unk_1E274A208;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
  -[CKConversationListCollectionViewController deferredSearchQuery](self, "deferredSearchQuery");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    -[CKConversationListCollectionViewController deferredSearchQuery](self, "deferredSearchQuery");
    v26[0] = v14;
    v26[1] = 3221225472;
    v26[2] = __60__CKConversationListCollectionViewController_viewDidAppear___block_invoke_2;
    v26[3] = &unk_1E274A208;
    v27 = (id)objc_claimAutoreleasedReturnValue();
    v16 = v27;
    -[CKConversationListCollectionViewController performSearch:completion:](self, "performSearch:completion:", v16, v26);
    -[CKConversationListCollectionViewController setDeferredSearchQuery:](self, "setDeferredSearchQuery:", 0);

  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(MEMORY[0x1E0CEAC18], "keyWindow");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CEAC18], "keyWindow");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "firstResponder");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CEAC18], "keyWindow");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "firstResponder");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "_isPinningInputViews");
      v24 = CFSTR("NO");
      *(_DWORD *)buf = 136315906;
      v31 = "-[CKConversationListCollectionViewController viewDidAppear:]";
      v32 = 2112;
      v33 = v18;
      if (v23)
        v24 = CFSTR("YES");
      v34 = 2112;
      v35 = v20;
      v36 = 2112;
      v37 = v24;
      _os_log_impl(&dword_18DFCD000, v17, OS_LOG_TYPE_INFO, "[%s] Is UIWindow.keyWindow: %@, firstResponder: %@, pinning input views: %@", buf, 0x2Au);

    }
  }

}

- (void)updateSyncProgressIfNeeded
{
  NSObject *v2;
  void *v3;
  uint8_t v4[16];

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_18DFCD000, v2, OS_LOG_TYPE_INFO, "-updateSyncProgressIfNeeded invoked in response to a change to the view or event lifecycle.", v4, 2u);
    }

  }
  objc_msgSend(MEMORY[0x1E0D357B8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fetchSyncState");

}

- (void)updateBannerVisualEffectGroup
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[CKConversationListCollectionViewController navigationController](self, "navigationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "navigationBar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_backdropViewLayerGroupName");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  -[CKConversationListCollectionViewController presentedBanner](self, "presentedBanner");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setScrollEdgeAppearanceBackdropGroupName:", v6);

}

- (void)_updateScrollEdgeAppearanceProgress
{
  double v3;
  double v4;
  void *v5;
  id v6;

  -[CKConversationListCollectionViewController navigationItem](self, "navigationItem");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_manualScrollEdgeAppearanceProgress");
  v4 = v3;
  -[CKConversationListCollectionViewController presentedBanner](self, "presentedBanner");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setScrollEdgeAppearanceProgress:", v4);

}

- (CKConversationListCollectionViewControllerBannerProtocol)presentedBanner
{
  return self->_presentedBanner;
}

- (void)setShouldUseFastPreviewText:(BOOL)a3
{
  self->_shouldUseFastPreviewText = a3;
}

- (NSString)deferredSearchQuery
{
  return self->_deferredSearchQuery;
}

- (NSLayoutConstraint)bannerTopConstraint
{
  return self->_bannerTopConstraint;
}

- (void)reasonTrackingUpdater:(id)a3 didBeginHoldingUpdatesWithInitialReason:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = 138412290;
      v10 = v7;
      _os_log_impl(&dword_18DFCD000, v8, OS_LOG_TYPE_INFO, "Freezing conversations with initial reason for freeze: %@", (uint8_t *)&v9, 0xCu);
    }

  }
  -[CKConversationListCollectionViewController _freezeConversations](self, "_freezeConversations");

}

- (void)reasonTrackingUpdater:(id)a3 didEndHoldingUpdatesWithFinalReason:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = 138412290;
      v10 = v7;
      _os_log_impl(&dword_18DFCD000, v8, OS_LOG_TYPE_INFO, "Unfreezing conversations with final reason for unfreeze: %@", (uint8_t *)&v9, 0xCu);
    }

  }
  -[CKConversationListCollectionViewController _unfreezeConversations](self, "_unfreezeConversations");

}

- (void)setFrozenConversations:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1456);
}

- (void)_unfreezeConversations
{
  -[CKConversationListCollectionViewController setFrozenPinnedConversations:](self, "setFrozenPinnedConversations:", 0);
  -[CKConversationListCollectionViewController setFrozenConversations:](self, "setFrozenConversations:", 0);
}

- (void)_freezeConversations
{
  id v3;
  void *v4;
  id v5;

  -[CKConversationListCollectionViewController pinnedConversations](self, "pinnedConversations");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (!v3)
    v3 = objc_alloc_init(MEMORY[0x1E0C99D20]);
  v5 = v3;
  -[CKConversationListCollectionViewController setFrozenPinnedConversations:](self, "setFrozenPinnedConversations:", v3);
  -[CKConversationListCollectionViewController activeConversations](self, "activeConversations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKConversationListCollectionViewController setFrozenConversations:](self, "setFrozenConversations:", v4);

}

- (void)setFrozenPinnedConversations:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1448);
}

- (BOOL)_shouldAllowLargeTitles
{
  void *v3;
  char v4;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "converastionListAlwaysSupportsLargeTitles");

  if ((v4 & 1) != 0
    || !-[CKConversationListCollectionViewController shouldShowPinnedConversations](self, "shouldShowPinnedConversations"))
  {
    return 1;
  }
  if (-[CKConversationListCollectionViewController numberOfPinnedConversations](self, "numberOfPinnedConversations")
    || -[CKConversationListCollectionViewController hasActivePinnedConversationDropSession](self, "hasActivePinnedConversationDropSession"))
  {
    return 0;
  }
  return !-[CKConversationListCollectionViewController isShowingPinningOnboarding](self, "isShowingPinningOnboarding");
}

- (BOOL)hasActivePinnedConversationDropSession
{
  return self->_hasActivePinnedConversationDropSession;
}

- (void)reasonTrackingUpdater:(id)a3 needsUpdateForReasons:(id)a4 followingHoldForReason:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  _BOOL8 v12;
  void *v13;
  void *v14;
  int v15;
  id v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v15 = 138412546;
      v16 = v9;
      v17 = 2112;
      v18 = v10;
      _os_log_impl(&dword_18DFCD000, v11, OS_LOG_TYPE_INFO, "Updating conversation list for reasons: %@ following hold for reason: %@", (uint8_t *)&v15, 0x16u);
    }

  }
  v12 = -[CKConversationListCollectionViewController _shouldAnimatePinningChangesForUpdateFollowingHoldForReason:](self, "_shouldAnimatePinningChangesForUpdateFollowingHoldForReason:", v10);
  -[CKConversationListCollectionViewController conversationList](self, "conversationList");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "resort");

  -[CKConversationListCollectionViewController _updateConversationListsAndSortIfEnabled](self, "_updateConversationListsAndSortIfEnabled");
  -[CKConversationListCollectionViewController updateSnapshotAnimatingDifferences:](self, "updateSnapshotAnimatingDifferences:", 0);
  -[CKConversationListCollectionViewController updateContentsOfAllCellsAnimated:](self, "updateContentsOfAllCellsAnimated:", v12);
  -[CKConversationListCollectionViewController updateConversationSelectionPreservingLastSelectedItemIdentifier](self, "updateConversationSelectionPreservingLastSelectedItemIdentifier");
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v13) = objc_msgSend(v14, "showsNoMessagesDialog");

  if ((_DWORD)v13)
    -[CKConversationListCollectionViewController updateNoMessagesDialog](self, "updateNoMessagesDialog");
  -[CKConversationListCollectionViewController _setNeedsUpdateContentUnavailableConfiguration](self, "_setNeedsUpdateContentUnavailableConfiguration");
  -[CKConversationListCollectionViewController _configureCatalystFiltersNavigation](self, "_configureCatalystFiltersNavigation");

}

- (void)updateConversationNamesForNicknames:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  BOOL v12;

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("handleIDs"));
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v9, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v9);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  +[CKConversationList sharedConversationList](CKConversationList, "sharedConversationList");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "conversations");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __82__CKConversationListCollectionViewController_updateConversationNamesForNicknames___block_invoke;
  v10[3] = &unk_1E2757DB8;
  v12 = v5 == 0;
  v11 = v5;
  v8 = v5;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v10);

  -[CKConversationListCollectionViewController updateContentsOfAllCellsAnimated:](self, "updateContentsOfAllCellsAnimated:", 0);
}

- (void)updateSnapshotAnimatingDifferences:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  id v6;
  id v7;

  v4 = a3;
  v6 = a4;
  -[CKConversationListCollectionViewController generateSnapshot](self, "generateSnapshot");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[CKConversationListCollectionViewController applyConversationListSnapshot:animatingDifferences:completion:](self, "applyConversationListSnapshot:animatingDifferences:completion:", v7, v4, v6);

}

- (id)generateSnapshot
{
  NSObject *v3;
  NSObject *v4;
  NSObject *v5;
  unint64_t v6;
  id v7;
  void *v8;
  int v9;
  unint64_t v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  _BOOL4 v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  NSObject *v36;
  NSObject *v37;
  os_signpost_id_t spid;
  os_signpost_id_t spida;
  void *v41;
  uint8_t buf[4];
  _BOOL4 v43;
  uint64_t v44;
  void *v45;
  _QWORD v46[2];

  v46[1] = *MEMORY[0x1E0C80C00];
  -[CKConversationListCollectionViewController conversationListCollectionViewControllerLogHandle](self, "conversationListCollectionViewControllerLogHandle");
  v3 = objc_claimAutoreleasedReturnValue();
  spid = os_signpost_id_generate(v3);

  -[CKConversationListCollectionViewController conversationListCollectionViewControllerLogHandle](self, "conversationListCollectionViewControllerLogHandle");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  v6 = spid - 1;
  if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_18DFCD000, v5, OS_SIGNPOST_INTERVAL_BEGIN, spid, "generateSnapshot", ", buf, 2u);
  }

  v7 = objc_alloc_init(MEMORY[0x1E0CEA210]);
  objc_msgSend(v7, "appendSectionsWithIdentifiers:", &unk_1E286F628);
  objc_msgSend(MEMORY[0x1E0D39850], "sharedManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "shouldDisplayFocusFilterBanner");

  v10 = -[CKConversationListCollectionViewController filterMode](self, "filterMode");
  if (v10 == 7)
    v11 = 0;
  else
    v11 = v9;
  if (v11 == 1)
  {
    +[CKFocusFilterBannerCollectionViewCell itemIdentifier](CKFocusFilterBannerCollectionViewCell, "itemIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v46[0] = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v46, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "appendItemsWithIdentifiers:", v13);

  }
  objc_msgSend(v7, "appendSectionsWithIdentifiers:", &unk_1E286F640, spid);
  if (-[CKConversationListCollectionViewController isShowingPinningOnboarding](self, "isShowingPinningOnboarding"))
    objc_msgSend(v7, "appendItemsWithIdentifiers:", &unk_1E286F658);
  objc_msgSend(v7, "appendSectionsWithIdentifiers:", &unk_1E286F670);
  if (-[CKConversationListCollectionViewController isShowingPinnedChatDropTarget](self, "isShowingPinnedChatDropTarget"))
  {
    +[CKPinnedConversationDropTargetCollectionViewCell uniqueIdentifier](CKPinnedConversationDropTargetCollectionViewCell, "uniqueIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = v14;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v45, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "appendItemsWithIdentifiers:", v15);

  }
  -[CKConversationListCollectionViewController pinnedConversations](self, "pinnedConversations");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v16, "count"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[CKConversationListCollectionViewController shouldShowPinnedConversations](self, "shouldShowPinnedConversations")&& objc_msgSend(v16, "count"))
  {
    -[CKConversationListCollectionViewController itemIdentifiersForConversations:inSection:](self, "itemIdentifiersForConversations:inSection:", v16, 2);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "appendItemsWithIdentifiers:", v18);
    objc_msgSend(v17, "addObjectsFromArray:", v16);

  }
  objc_msgSend(v7, "appendSectionsWithIdentifiers:", &unk_1E286F688);
  if (-[CKConversationListCollectionViewController shouldShowTipKitContent](self, "shouldShowTipKitContent"))
  {
    -[CKConversationListCollectionViewController tipManager](self, "tipManager");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "presentedTip");

    if ((unint64_t)(v20 - 1) <= 4)
    {
      -[__objc2_class reuseIdentifier](*(&off_1E27552C8)[v20 - 1], "reuseIdentifier");
      v21 = objc_claimAutoreleasedReturnValue();
      v22 = (void *)v21;
      if (v21)
      {
        v44 = v21;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v44, 1);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "appendItemsWithIdentifiers:", v23);

      }
    }
  }
  objc_msgSend(v7, "appendSectionsWithIdentifiers:", &unk_1E286F6A0);
  v24 = -[CKConversationListCollectionViewController shouldShowPendingCell](self, "shouldShowPendingCell");
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      v43 = v24;
      _os_log_impl(&dword_18DFCD000, v25, OS_LOG_TYPE_INFO, "snapshot contains new message identifier: %{BOOL}d", buf, 8u);
    }

  }
  if (v24)
  {
    +[CKConversationListNewMessageCollectionViewCell reuseIdentifier](CKConversationListNewMessageCollectionViewCell, "reuseIdentifier");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = v26;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v41, 1);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "appendItemsWithIdentifiers:", v27);

  }
  objc_msgSend(v7, "appendSectionsWithIdentifiers:", &unk_1E286F6B8);
  if (-[CKConversationListCollectionViewController isShowingPinningOnboarding](self, "isShowingPinningOnboarding"))
  {
    -[CKConversationListCollectionViewController recommendedPinningConversations](self, "recommendedPinningConversations");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKConversationListCollectionViewController itemIdentifiersForConversations:inSection:](self, "itemIdentifiersForConversations:inSection:", v28, 5);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (!-[CKConversationListCollectionViewController isCurrentlyAnimatingPinningOnboardingSuggestions](self, "isCurrentlyAnimatingPinningOnboardingSuggestions"))
    {
      -[CKConversationListCollectionViewController itemIdentifiersForConversations:inSection:](self, "itemIdentifiersForConversations:inSection:", v17, 5);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "arrayByExcludingObjectsInArray:", v30);
      v31 = objc_claimAutoreleasedReturnValue();

      v29 = (void *)v31;
    }
    objc_msgSend(v7, "appendItemsWithIdentifiers:", v29);
    objc_msgSend(v17, "addObjectsFromArray:", v28);

  }
  if (v10 == 7)
  {
    objc_msgSend(v7, "appendSectionsWithIdentifiers:", &unk_1E286F6D0);
    -[CKConversationListCollectionViewController _appendRecentlyDeletedIdentifersToSnapshot:](self, "_appendRecentlyDeletedIdentifersToSnapshot:", v7);
  }
  else
  {
    -[CKConversationListCollectionViewController activeConversations](self, "activeConversations");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKConversationListCollectionViewController itemIdentifiersForConversations:inSection:](self, "itemIdentifiersForConversations:inSection:", v32, 5);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v33, "count"))
    {
      -[CKConversationListCollectionViewController itemIdentifiersForConversations:inSection:](self, "itemIdentifiersForConversations:inSection:", v17, 5);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "arrayByExcludingObjectsInArray:", v34);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "appendItemsWithIdentifiers:", v35);

    }
    objc_msgSend(v7, "appendSectionsWithIdentifiers:", &unk_1E286F6D0);
  }
  -[CKConversationListCollectionViewController conversationListCollectionViewControllerLogHandle](self, "conversationListCollectionViewControllerLogHandle");
  v36 = objc_claimAutoreleasedReturnValue();
  v37 = v36;
  if (v6 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v36))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_18DFCD000, v37, OS_SIGNPOST_INTERVAL_END, spida, "generateSnapshot", ", buf, 2u);
  }

  return v7;
}

- (BOOL)isShowingPinningOnboarding
{
  return self->_isShowingPinningOnboarding;
}

- (id)pinnedConversations
{
  _BOOL4 v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = -[CKConversationListCollectionViewController shouldShowPinnedConversations](self, "shouldShowPinnedConversations");
  v4 = (id)MEMORY[0x1E0C9AA60];
  if (v3)
  {
    -[CKConversationListCollectionViewController frozenPinnedConversations](self, "frozenPinnedConversations");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      v4 = v5;
    }
    else
    {
      -[CKConversationListCollectionViewController conversationList](self, "conversationList");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "pinnedConversations");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
        v9 = v8;
      else
        v9 = v4;
      v4 = v9;

    }
  }
  return v4;
}

- (BOOL)shouldShowPinnedConversations
{
  int v3;

  v3 = objc_msgSend(MEMORY[0x1E0D358C8], "processSupportsPinnedConversations");
  if (v3)
    LOBYTE(v3) = -[CKConversationListCollectionViewController filterMode](self, "filterMode") < 3;
  return v3;
}

- (NSArray)frozenPinnedConversations
{
  return self->_frozenPinnedConversations;
}

- (id)activeConversations
{
  void *v3;
  void *v4;
  id v5;
  unint64_t v6;
  void *v7;

  -[CKConversationListCollectionViewController frozenConversations](self, "frozenConversations");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    v6 = -[CKConversationListCollectionViewController filterMode](self, "filterMode");
    -[CKConversationListCollectionViewController conversationList](self, "conversationList");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "conversationsForFilterMode:", v6);
    v5 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (NSArray)frozenConversations
{
  return self->_frozenConversations;
}

- (BOOL)shouldShowPendingCell
{
  void *v3;
  int v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "showPendingInConversationList");

  if (!v4)
    return 0;
  -[CKConversationListCollectionViewController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isCollapsed");

  if ((v6 & 1) != 0)
    return 0;
  -[CKConversationListCollectionViewController conversationList](self, "conversationList");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "pendingConversation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
    return 0;
  if (-[CKConversationListCollectionViewController editingMode](self, "editingMode"))
    return CKIsRunningInMacCatalyst() != 0;
  return 1;
}

- (void)applyConversationListSnapshot:(id)a3 animatingDifferences:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  void (**v12)(_QWORD);
  NSObject *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  os_signpost_id_t v20;
  NSObject *v21;
  NSObject *v22;
  unint64_t v23;
  void *v24;
  void *v25;
  int v26;
  NSObject *v27;
  NSObject *v28;
  void *v29;
  NSObject *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  os_signpost_id_t spid;
  uint8_t v42[16];
  _QWORD aBlock[4];
  id v44;
  id v45;
  uint8_t buf[8];

  v6 = a4;
  v8 = a3;
  v9 = a5;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  if (!-[CKConversationListCollectionViewController isCommitingDiffableDataSourceTransaction](self, "isCommitingDiffableDataSourceTransaction"))
  {
    *(_QWORD *)buf = 0;
    objc_initWeak((id *)buf, self);
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __120__CKConversationListCollectionViewController_DataSource__applyConversationListSnapshot_animatingDifferences_completion___block_invoke;
    aBlock[3] = &unk_1E274C6B8;
    objc_copyWeak(&v45, (id *)buf);
    v11 = v9;
    v44 = v11;
    v12 = (void (**)(_QWORD))_Block_copy(aBlock);
    if (-[CKConversationListCollectionViewController isApplyingSnapshot](self, "isApplyingSnapshot"))
    {
      IMLogHandleForCategory();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
        -[CKConversationListCollectionViewController(DataSource) applyConversationListSnapshot:animatingDifferences:completion:].cold.1(v13);

      v14 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v15 = v14;
      if (v8)
        objc_msgSend(v14, "setObject:forKey:", v8, CFSTR("CKBlockedSnapshotApplicationSnapshotKey"));
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v6);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setObject:forKey:", v16, CFSTR("CKBlockedSnapshotApplicationAnimateDifferencesKey"));

      if (v11)
      {
        v17 = _Block_copy(v11);
        objc_msgSend(v15, "setObject:forKey:", v17, CFSTR("CKBlockedSnapshotApplicationCompletionKey"));

      }
      v18 = (void *)objc_msgSend(v15, "copy");
      -[CKConversationListCollectionViewController setBlockedSnapshotInfo:](self, "setBlockedSnapshotInfo:", v18);
      goto LABEL_39;
    }
    -[CKConversationListCollectionViewController setIsApplyingSnapshot:](self, "setIsApplyingSnapshot:", 1);
    -[CKConversationListCollectionViewController conversationListCollectionViewControllerLogHandle](self, "conversationListCollectionViewControllerLogHandle");
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = os_signpost_id_generate(v19);

    -[CKConversationListCollectionViewController conversationListCollectionViewControllerLogHandle](self, "conversationListCollectionViewControllerLogHandle");
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = v21;
    spid = v20;
    v23 = v20 - 1;
    if (v23 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
    {
      *(_WORD *)v42 = 0;
      _os_signpost_emit_with_name_impl(&dword_18DFCD000, v22, OS_SIGNPOST_INTERVAL_BEGIN, spid, "applySnapshot", ", v42, 2u);
    }

    if (-[CKConversationListCollectionViewController haveAppliedInitialSnapshot](self, "haveAppliedInitialSnapshot"))
    {
      -[CKConversationListCollectionViewController dataSource](self, "dataSource");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "snapshot");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v25, "isEqual:", v8);

      if (v26)
      {
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v27 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)v42 = 0;
            _os_log_impl(&dword_18DFCD000, v27, OS_LOG_TYPE_INFO, "Skipping application of snapshot update with no changes", v42, 2u);
          }

        }
        if (v12)
          v12[2](v12);
        goto LABEL_32;
      }
      -[CKConversationListCollectionViewController dataSource](self, "dataSource");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "applySnapshot:animatingDifferences:completion:", v8, v6, v12);
    }
    else
    {
      -[CKConversationListCollectionViewController setHaveAppliedInitialSnapshot:](self, "setHaveAppliedInitialSnapshot:", 1);
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v42 = 0;
          _os_log_impl(&dword_18DFCD000, v28, OS_LOG_TYPE_INFO, "Applying initial snapshot", v42, 2u);
        }

      }
      -[CKConversationListCollectionViewController dataSource](self, "dataSource");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "applySnapshot:animatingDifferences:completion:", v8, 0, v12);
    }

LABEL_32:
    -[CKConversationListCollectionViewController conversationListCollectionViewControllerLogHandle](self, "conversationListCollectionViewControllerLogHandle");
    v30 = objc_claimAutoreleasedReturnValue();
    v31 = v30;
    if (v23 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v30))
    {
      *(_WORD *)v42 = 0;
      _os_signpost_emit_with_name_impl(&dword_18DFCD000, v31, OS_SIGNPOST_INTERVAL_END, spid, "applySnapshot", ", v42, 2u);
    }

    -[CKConversationListCollectionViewController setIsApplyingSnapshot:](self, "setIsApplyingSnapshot:", 0);
    -[CKConversationListCollectionViewController blockedSnapshotInfo](self, "blockedSnapshotInfo");
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    if (v32)
    {
      -[CKConversationListCollectionViewController blockedSnapshotInfo](self, "blockedSnapshotInfo");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "objectForKey:", CFSTR("CKBlockedSnapshotApplicationSnapshotKey"));
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      -[CKConversationListCollectionViewController blockedSnapshotInfo](self, "blockedSnapshotInfo");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "objectForKey:", CFSTR("CKBlockedSnapshotApplicationAnimateDifferencesKey"));
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = objc_msgSend(v36, "BOOLValue");

      -[CKConversationListCollectionViewController blockedSnapshotInfo](self, "blockedSnapshotInfo");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "objectForKey:", CFSTR("CKBlockedSnapshotApplicationCompletionKey"));
      v39 = (void *)objc_claimAutoreleasedReturnValue();

      -[CKConversationListCollectionViewController setBlockedSnapshotInfo:](self, "setBlockedSnapshotInfo:", 0);
      -[CKConversationListCollectionViewController applyConversationListSnapshot:animatingDifferences:completion:](self, "applyConversationListSnapshot:animatingDifferences:completion:", v34, v37, v39);

    }
    if (-[CKConversationListCollectionViewController filterMode](self, "filterMode") != 7)
      goto LABEL_40;
    -[CKConversationListCollectionViewController delegate](self, "delegate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKConversationListCollectionViewController collectionView](self, "collectionView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "indexPathsForSelectedItems");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "conversationListUpdatedSelectedIndexPathCount:", objc_msgSend(v40, "count"));

LABEL_39:
LABEL_40:

    objc_destroyWeak(&v45);
    objc_destroyWeak((id *)buf);
    goto LABEL_41;
  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18DFCD000, v10, OS_LOG_TYPE_INFO, "Skipping application of snapshot update while we are commiting a diffable data source transaction", buf, 2u);
    }

  }
LABEL_41:

}

- (void)setIsApplyingSnapshot:(BOOL)a3
{
  self->_isApplyingSnapshot = a3;
}

- (BOOL)shouldShowTipKitContent
{
  int64_t v3;
  void *v4;
  unint64_t v5;

  v3 = -[CKConversationListTipManager presentedTip](self->_tipManager, "presentedTip");
  if (v3)
  {
    if (-[CKConversationListCollectionViewController editingMode](self, "editingMode"))
    {
LABEL_3:
      LOBYTE(v3) = 0;
      return v3;
    }
    if (-[CKConversationListTipManager presentedTip](self->_tipManager, "presentedTip") != 2)
    {
LABEL_9:
      LOBYTE(v3) = 1;
      return v3;
    }
    LODWORD(v3) = -[CKConversationListCollectionViewController shouldShowPinnedConversations](self, "shouldShowPinnedConversations");
    if ((_DWORD)v3)
    {
      LODWORD(v3) = -[CKConversationListCollectionViewController canShowSuggestedPinningOnboardingCell](self, "canShowSuggestedPinningOnboardingCell");
      if ((_DWORD)v3)
      {
        -[CKConversationListCollectionViewController recommendedPinningConversations](self, "recommendedPinningConversations");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = objc_msgSend(v4, "count");

        if (v5 < 3
          || -[CKConversationListCollectionViewController numberOfPinnedConversations](self, "numberOfPinnedConversations") > 0)
        {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
  }
  return v3;
}

- (BOOL)isShowingPinnedChatDropTarget
{
  return self->_isShowingPinnedChatDropTarget;
}

- (BOOL)isCommitingDiffableDataSourceTransaction
{
  return self->_isCommitingDiffableDataSourceTransaction;
}

- (BOOL)isApplyingSnapshot
{
  return self->_isApplyingSnapshot;
}

- (BOOL)haveAppliedInitialSnapshot
{
  return self->_haveAppliedInitialSnapshot;
}

- (NSDictionary)blockedSnapshotInfo
{
  return self->_blockedSnapshotInfo;
}

uint64_t __120__CKConversationListCollectionViewController_DataSource__applyConversationListSnapshot_animatingDifferences_completion___block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t result;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_ck_setNeedsUpdateOfMultitaskingDragExclusionRects");

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)_ck_setNeedsUpdateOfMultitaskingDragExclusionRects
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[CKConversationListCollectionViewController _setNeedsUpdateOfMultitaskingDragExclusionRects](self, "_setNeedsUpdateOfMultitaskingDragExclusionRects");
}

- (void)_updateConversationListsAndSortIfEnabled
{
  id v2;

  -[CKConversationListCollectionViewController conversationList](self, "conversationList");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateConversationListsAndSortIfEnabled");

}

- (void)updateConversationSelectionPreservingLastSelectedItemIdentifier
{
  void *v3;
  int v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  NSObject *v19;
  NSObject *v20;
  NSObject *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  NSObject *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  int v30;
  void *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  if (-[CKConversationListCollectionViewController _shouldUpdateConversationSelection](self, "_shouldUpdateConversationSelection"))
  {
    -[CKConversationListCollectionViewController delegate](self, "delegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isShowingComposeChatController");

    if (v4)
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v5 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
        {
          LOWORD(v30) = 0;
          _os_log_impl(&dword_18DFCD000, v5, OS_LOG_TYPE_INFO, "multi-select: Currently showing compose chat controller. updating selection to compose cell", (uint8_t *)&v30, 2u);
        }

      }
      -[CKConversationListCollectionViewController updateConversationSelectionToNewCompose](self, "updateConversationSelectionToNewCompose");
    }
    else
    {
      -[CKConversationListCollectionViewController delegate](self, "delegate");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "currentlyShownConversation");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7)
      {
        if (-[CKConversationListCollectionViewController shouldShowPinnedConversations](self, "shouldShowPinnedConversations"))
        {
          v8 = objc_msgSend(v7, "isPinned");
          if (v8)
            v9 = 2;
          else
            v9 = 5;
        }
        else
        {
          v8 = 0;
          v9 = 5;
        }
        -[CKConversationListCollectionViewController itemIdentifierForConversation:inSection:](self, "itemIdentifierForConversation:inSection:", v7, v9);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
        {
          -[CKConversationListCollectionViewController dataSource](self, "dataSource");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "indexPathForItemIdentifier:", v13);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          if (v15)
          {
            -[CKConversationListCollectionViewController collectionView](self, "collectionView");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "indexPathsForSelectedItems");
            v17 = (void *)objc_claimAutoreleasedReturnValue();

            LODWORD(v16) = objc_msgSend(v17, "containsObject:", v15);
            v18 = IMOSLoggingEnabled();
            if ((_DWORD)v16)
            {
              if (v18)
              {
                OSLogHandleForIMFoundationCategory();
                v19 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
                {
                  LOWORD(v30) = 0;
                  _os_log_impl(&dword_18DFCD000, v19, OS_LOG_TYPE_INFO, "multi-select: not updating selection, already selected", (uint8_t *)&v30, 2u);
                }

              }
            }
            else
            {
              if (v18)
              {
                OSLogHandleForIMFoundationCategory();
                v27 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
                {
                  v30 = 138412290;
                  v31 = v15;
                  _os_log_impl(&dword_18DFCD000, v27, OS_LOG_TYPE_INFO, "multi-select: selecting item at target indexPath: %@", (uint8_t *)&v30, 0xCu);
                }

              }
              -[CKConversationListCollectionViewController collectionView](self, "collectionView");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              -[CKConversationListCollectionViewController _deselectSelectedIndexPathsInCollectionView:animated:](self, "_deselectSelectedIndexPathsInCollectionView:animated:", v28, 0);

              -[CKConversationListCollectionViewController collectionView](self, "collectionView");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v29, "selectItemAtIndexPath:animated:scrollPosition:", v15, 0, 0);

              -[CKConversationListCollectionViewController setLastSelectedConversationItemIdentifier:](self, "setLastSelectedConversationItemIdentifier:", v13);
            }
          }
          else
          {
            if (IMOSLoggingEnabled())
            {
              OSLogHandleForIMFoundationCategory();
              v21 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
              {
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v9);
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                v30 = 138412802;
                v31 = v22;
                v32 = 2112;
                v33 = v7;
                v34 = 2112;
                v35 = v13;
                _os_log_impl(&dword_18DFCD000, v21, OS_LOG_TYPE_INFO, "CKConversationListCollectionViewController | multi-select: failed to find indexPath in section: %@ for currentConversation: %@, itemIdentifier: %@, trying opposing section lookup", (uint8_t *)&v30, 0x20u);

              }
            }
            if (v8)
              v23 = 5;
            else
              v23 = 2;
            -[CKConversationListCollectionViewController itemIdentifierForConversation:inSection:](self, "itemIdentifierForConversation:inSection:", v7, v23);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            -[CKConversationListCollectionViewController dataSource](self, "dataSource");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "indexPathForItemIdentifier:", v17);
            v15 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v15)
            {
              if (IMOSLoggingEnabled())
              {
                OSLogHandleForIMFoundationCategory();
                v25 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
                {
                  v30 = 138412546;
                  v31 = v7;
                  v32 = 2112;
                  v33 = v13;
                  _os_log_impl(&dword_18DFCD000, v25, OS_LOG_TYPE_INFO, "CKConversationListCollectionViewController | multi-select: failed to find indexPath for currentConversation: %@, itemIdentifier: %@, showing selection view controller to gracefully compensate.", (uint8_t *)&v30, 0x16u);
                }

              }
              -[CKConversationListCollectionViewController delegate](self, "delegate");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v26, "conversationListFailedToSelectShownConversation");

            }
          }

        }
        else
        {
          if (IMOSLoggingEnabled())
          {
            OSLogHandleForIMFoundationCategory();
            v20 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
            {
              v30 = 138412290;
              v31 = v7;
              _os_log_impl(&dword_18DFCD000, v20, OS_LOG_TYPE_INFO, "CKConversationListCollectionViewController | multi-select: failed to find itemIdentifier for currentConversation: %@, showing selection view controller to gracefully compensate.", (uint8_t *)&v30, 0xCu);
            }

          }
          -[CKConversationListCollectionViewController delegate](self, "delegate");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "conversationListFailedToSelectShownConversation");
        }

      }
      else
      {
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v10 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
          {
            -[CKConversationListCollectionViewController collectionView](self, "collectionView");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "indexPathsForSelectedItems");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v30 = 138412290;
            v31 = v12;
            _os_log_impl(&dword_18DFCD000, v10, OS_LOG_TYPE_INFO, "multi-select: No currently shown conversation. Updating selected index path delegate. SelectedIndexPaths: %@", (uint8_t *)&v30, 0xCu);

          }
        }
        -[CKConversationListCollectionViewController _updatedSelectedIndexPathCount](self, "_updatedSelectedIndexPathCount");
        -[CKConversationListCollectionViewController delegate](self, "delegate");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "conversationListFailedToSelectShownConversation");
      }

    }
  }
}

- (BOOL)_shouldAnimatePinningChangesForUpdateFollowingHoldForReason:(id)a3
{
  return objc_msgSend(a3, "isEqualToString:", CFSTR("viewVisiblity")) ^ 1;
}

- (void)updateFocusFilterBannerWithAnimation:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  v3 = a3;
  -[CKConversationListCollectionViewController updateSnapshotAnimatingDifferences:](self, "updateSnapshotAnimatingDifferences:");
  +[CKFocusFilterBannerCollectionViewCell itemIdentifier](CKFocusFilterBannerCollectionViewCell, "itemIdentifier");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[CKConversationListCollectionViewController updateContentsOfCellWithItemIdentifier:animated:](self, "updateContentsOfCellWithItemIdentifier:animated:", v5, v3);

}

- (void)updateSnapshotAnimatingDifferences:(BOOL)a3
{
  -[CKConversationListCollectionViewController updateSnapshotAnimatingDifferences:completion:](self, "updateSnapshotAnimatingDifferences:completion:", a3, 0);
}

- (void)updateContentsOfCellWithItemIdentifier:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  void *v7;
  id v8;

  v4 = a4;
  v8 = a3;
  -[CKConversationListCollectionViewController dataSource](self, "dataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "indexPathForItemIdentifier:", v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    -[CKConversationListCollectionViewController updateContentsOfCellWithItemIdentifier:indexPath:animated:](self, "updateContentsOfCellWithItemIdentifier:indexPath:animated:", v8, v7, v4);

}

void __81__CKConversationListCollectionViewController__configureCloudTipViewModelIfNeeded__block_invoke_2()
{
  NSObject *v0;
  uint8_t v1[16];

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v0 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v1 = 0;
      _os_log_impl(&dword_18DFCD000, v0, OS_LOG_TYPE_INFO, "Completed cloud tip configuration", v1, 2u);
    }

  }
}

- (int64_t)numberOfPinnedConversations
{
  void *v2;
  int64_t v3;

  -[CKConversationListCollectionViewController pinnedConversations](self, "pinnedConversations");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (void)setHaveAppliedInitialSnapshot:(BOOL)a3
{
  self->_haveAppliedInitialSnapshot = a3;
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a4;
  v7 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v11, "willDisplayCell");
  -[CKConversationListCollectionViewController _infiniteScrollReachedIndexPath:](self, "_infiniteScrollReachedIndexPath:", v7);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v11;
    -[CKConversationListCollectionViewController dataSource](self, "dataSource");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "itemIdentifierForIndexPath:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKConversationListCollectionViewController configureAppEntityForConversationCell:forItemIdentifier:](self, "configureAppEntityForConversationCell:forItemIdentifier:", v8, v10);

  }
}

- (void)_infiniteScrollReachedIndexPath:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  if (objc_msgSend(v13, "section") == 5)
  {
    -[CKConversationListCollectionViewController conversationAtIndexPath:](self, "conversationAtIndexPath:", v13);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      -[CKConversationListCollectionViewController dataSource](self, "dataSource");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKConversationListCollectionViewController collectionView](self, "collectionView");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v5, "collectionView:numberOfItemsInSection:", v6, objc_msgSend(v13, "section"));
      v8 = v7 - objc_msgSend(v13, "row");

      -[CKConversationListCollectionViewController conversationList](self, "conversationList");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "scrollingController");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "chat");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "lastFinishedMessageDate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "reachedConversationWithLastMessageDate:filterMode:remainingRows:", v12, -[CKConversationListCollectionViewController filterMode](self, "filterMode"), v8);

    }
  }

}

- (id)conversationAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[CKConversationListCollectionViewController dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "itemIdentifierForIndexPath:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[CKConversationListCollectionViewController conversationForItemIdentifier:](self, "conversationForItemIdentifier:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CKConversationListCollectionViewController;
  -[CKConversationListCollectionViewController traitCollectionDidChange:](&v14, sel_traitCollectionDidChange_, v4);
  objc_msgSend(v4, "displayScale");
  v6 = v5;
  -[CKConversationListCollectionViewController traitCollection](self, "traitCollection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "displayScale");
  v9 = v8;

  if (v6 != v9)
    -[CKConversationListCollectionViewController invalidateCellLayout](self, "invalidateCellLayout");
  v10 = objc_msgSend(v4, "userInterfaceStyle");
  -[CKConversationListCollectionViewController traitCollection](self, "traitCollection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "userInterfaceStyle");

  if (v10 != v12)
  {
    +[CKDualSIMUtilities sharedUtilities](CKDualSIMUtilities, "sharedUtilities");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "updateConversationListSIMLabelImagesDictionary");

  }
}

- (void)invalidateCellLayout
{
  void *v3;
  _BOOL8 v4;
  void *v5;
  void *v6;
  double Width;
  void *v8;
  void *v9;
  _BOOL8 v10;
  void *v11;
  void *v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  CGRect v18;
  CGRect v19;

  -[CKConversationListCollectionViewController junkCellLayout](self, "junkCellLayout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  v4 = -[CKConversationListCollectionViewController _cellsShouldShowChevron](self, "_cellsShouldShowChevron");
  -[CKConversationListCollectionViewController junkCellLayout](self, "junkCellLayout");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setShouldShowChevron:", v4);

  -[CKConversationListCollectionViewController collectionView](self, "collectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  Width = CGRectGetWidth(v18);
  -[CKConversationListCollectionViewController junkCellLayout](self, "junkCellLayout");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTableViewWidth:", Width);

  -[CKConversationListCollectionViewController standardCellLayout](self, "standardCellLayout");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "invalidate");

  v10 = -[CKConversationListCollectionViewController _cellsShouldShowChevron](self, "_cellsShouldShowChevron");
  -[CKConversationListCollectionViewController standardCellLayout](self, "standardCellLayout");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setShouldShowChevron:", v10);

  -[CKConversationListCollectionViewController collectionView](self, "collectionView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "bounds");
  v13 = CGRectGetWidth(v19);
  -[CKConversationListCollectionViewController standardCellLayout](self, "standardCellLayout");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setTableViewWidth:", v13);

  -[CKConversationListCollectionViewController conversationLayout](self, "conversationLayout");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "updatePinnedConversationViewLayoutStyle");

  -[CKConversationListCollectionViewController updateContentsOfAllCellsAnimated:](self, "updateContentsOfAllCellsAnimated:", 0);
  -[CKConversationListCollectionViewController collectionView](self, "collectionView");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "collectionViewLayout");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "invalidateLayout");

}

- (void)viewDidLayoutSubviews
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  int v10;
  int v11;
  void *v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  _QWORD block[5];
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)CKConversationListCollectionViewController;
  -[CKConversationListCollectionViewController viewDidLayoutSubviews](&v19, sel_viewDidLayoutSubviews);
  -[CKConversationListCollectionViewController cellLayout](self, "cellLayout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "tableViewWidth");
  v5 = v4;

  -[CKConversationListCollectionViewController collectionView](self, "collectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  v8 = v7;

  -[CKConversationListCollectionViewController cellLayout](self, "cellLayout");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "shouldShowChevron");
  v11 = -[CKConversationListCollectionViewController _cellsShouldShowChevron](self, "_cellsShouldShowChevron");

  if (!self->_isInitialAppearance && (vabdd_f64(v5, v8) >= 0.1 || v10 != v11))
    -[CKConversationListCollectionViewController invalidateCellLayout](self, "invalidateCellLayout");
  if (CKIsRunningInMacCatalyst())
  {
    -[CKConversationListCollectionViewController view](self, "view");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "frame");
    v15 = v14;

    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "snapToMinConversationListWidth");
    -[CKConversationListCollectionViewController setIsBelowMacSnapToMinWidth:](self, "setIsBelowMacSnapToMinWidth:", v15 < v17);

  }
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __67__CKConversationListCollectionViewController_viewDidLayoutSubviews__block_invoke;
  block[3] = &unk_1E274A208;
  block[4] = self;
  if (viewDidLayoutSubviews_showConversationIfNecessaryToken != -1)
    dispatch_once(&viewDidLayoutSubviews_showConversationIfNecessaryToken, block);
  -[CKConversationListCollectionViewController _updateNavbarLayoutIfNeeded](self, "_updateNavbarLayoutIfNeeded");
}

- (BOOL)_cellsShouldShowChevron
{
  id WeakRetained;
  char v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v3 = objc_msgSend(WeakRetained, "isCollapsed");

  return v3;
}

- (void)_updateNavbarLayoutIfNeeded
{
  if (CKIsRunningInMacCatalyst())
    -[CKConversationListCollectionViewController _macosUpdateNavbarLayoutIfNeeded](self, "_macosUpdateNavbarLayoutIfNeeded");
  else
    -[CKConversationListCollectionViewController _iosUpdateNavbarLayoutIfNeeded](self, "_iosUpdateNavbarLayoutIfNeeded");
}

- (CKConversationListCellLayout)junkCellLayout
{
  CKConversationListCellLayout *junkCellLayout;
  CKConversationListCellLayout *v4;
  CKConversationListCellLayout *v5;

  junkCellLayout = self->_junkCellLayout;
  if (!junkCellLayout)
  {
    v4 = (CKConversationListCellLayout *)objc_opt_new();
    v5 = self->_junkCellLayout;
    self->_junkCellLayout = v4;

    junkCellLayout = self->_junkCellLayout;
  }
  return junkCellLayout;
}

- (void)setPinnedConversationViewLayoutStyle:(int64_t)a3
{
  -[CKConversationListCollectionViewController _setPinnedConversationViewLayoutStyle:shouldInvalidateLayout:](self, "_setPinnedConversationViewLayoutStyle:shouldInvalidateLayout:", a3, 1);
}

- (void)_setPinnedConversationViewLayoutStyle:(int64_t)a3 shouldInvalidateLayout:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  id v7;

  if (self->_pinnedConversationViewLayoutStyle != a3)
  {
    v4 = a4;
    self->_pinnedConversationViewLayoutStyle = a3;
    -[CKConversationListCollectionViewController updateContentsOfAllCellsAnimated:](self, "updateContentsOfAllCellsAnimated:", 0);
    if (v4)
    {
      -[CKConversationListCollectionViewController collectionView](self, "collectionView");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "collectionViewLayout");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "invalidateLayout");

    }
  }
}

- (CKConversationListCollectionViewLayout)conversationLayout
{
  return self->_conversationLayout;
}

- (int64_t)preferredStatusBarStyle
{
  void *v2;
  void *v3;
  int64_t v4;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "theme");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "statusBarStyle");

  return v4;
}

- (void)focusStateDidChange
{
  -[CKConversationListCollectionViewController setNeedsConversationListUpdateForFocusStateChange](self, "setNeedsConversationListUpdateForFocusStateChange");
  -[CKConversationListCollectionViewController updateFocusFilterBannerWithAnimation:](self, "updateFocusFilterBannerWithAnimation:", 1);
}

- (void)setNeedsConversationListUpdateForFocusStateChange
{
  id v2;

  -[CKConversationListCollectionViewController updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsDeferredUpdateWithReason:", CFSTR("focusStateChanged"));

}

- (void)loadView
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
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  CKConversationListCollectionViewDragFeedbackGenerator *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  uint64_t v51;
  void *v52;
  void *v53;
  uint64_t v54;
  void *v55;
  void *v56;
  uint64_t v57;
  void *v58;
  void *v59;
  uint64_t v60;
  void *v61;
  void *v62;
  void *v63;
  uint64_t v64;
  void *v65;
  void *v66;
  void *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  void *v72;
  void *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  int v85;
  void *v86;
  char v87;
  void *v88;
  id v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  CKConversationListTipManager *v95;
  CKConversationListTipManager *tipManager;
  void *v97;
  NSObject *v98;
  void *v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  objc_super v108;
  uint8_t buf[4];
  void *v110;
  _BYTE v111[128];
  _BYTE v112[128];
  uint64_t v113;

  v113 = *MEMORY[0x1E0C80C00];
  self->_isInitialAppearance = 1;
  self->_shouldUseFastPreviewText = !-[CKConversationListCollectionViewController completedDeferredSetup](self, "completedDeferredSetup");
  v108.receiver = self;
  v108.super_class = (Class)CKConversationListCollectionViewController;
  -[CKConversationListCollectionViewController loadView](&v108, sel_loadView);
  -[CKConversationListCollectionViewController conversationLayout](self, "conversationLayout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "updatePinnedConversationViewLayoutStyle");

  -[CKConversationListCollectionViewController collectionView](self, "collectionView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKConversationListCollectionViewController dataSourceWithCollectionView:](self, "dataSourceWithCollectionView:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKConversationListCollectionViewController setDataSource:](self, "setDataSource:", v5);

  -[CKConversationListCollectionViewController dataSource](self, "dataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKConversationListCollectionViewController collectionView](self, "collectionView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDataSource:", v6);

  -[CKConversationListCollectionViewController collectionView](self, "collectionView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAutoresizingMask:", 18);

  -[CKConversationListCollectionViewController collectionView](self, "collectionView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setDelegate:", self);

  -[CKConversationListCollectionViewController collectionView](self, "collectionView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setDragInteractionEnabled:", 1);

  -[CKConversationListCollectionViewController collectionView](self, "collectionView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setDragDelegate:", self);

  -[CKConversationListCollectionViewController collectionView](self, "collectionView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setDropDelegate:", self);

  -[CKConversationListCollectionViewController collectionView](self, "collectionView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setAlwaysBounceVertical:", 1);

  -[CKConversationListCollectionViewController collectionView](self, "collectionView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setPreservesSuperviewLayoutMargins:", 1);

  -[CKConversationListCollectionViewController collectionView](self, "collectionView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setAllowsFocus:", 0);

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "theme");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "scrollIndicatorStyle");
  -[CKConversationListCollectionViewController collectionView](self, "collectionView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setIndicatorStyle:", v18);

  -[CKConversationListCollectionViewController collectionView](self, "collectionView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setShowsHorizontalScrollIndicator:", 0);

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v18) = objc_msgSend(v21, "darkUIEnabled");
  -[CKConversationListCollectionViewController collectionView](self, "collectionView");
  v22 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v22, "setShowsVerticalScrollIndicator:", v18 ^ 1);

  -[CKConversationListCollectionViewController collectionView](self, "collectionView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setAccessibilityIdentifier:", CFSTR("ConversationList"));

  -[CKConversationListCollectionViewController collectionView](self, "collectionView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v22) = objc_opt_respondsToSelector();

  if ((v22 & 1) != 0)
  {
    -[CKConversationListCollectionViewController collectionView](self, "collectionView");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "_setDelaysUserInitiatedItemSelection:", 1);

  }
  v26 = objc_alloc_init(CKConversationListCollectionViewDragFeedbackGenerator);
  -[CKConversationListCollectionViewController collectionView](self, "collectionView");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "_setReorderFeedbackGenerator:", v26);

  -[CKConversationListCollectionViewController collectionView](self, "collectionView");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "_setPreferredDragDestinationVisualStyle:", 1);

  -[CKConversationListCollectionViewController collectionView](self, "collectionView");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_opt_class();
  +[CKFocusFilterBannerCollectionViewCell reuseIdentifier](CKFocusFilterBannerCollectionViewCell, "reuseIdentifier");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "registerClass:forCellWithReuseIdentifier:", v30, v31);

  -[CKConversationListCollectionViewController collectionView](self, "collectionView");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_opt_class();
  +[CKFocusFilterBannerCollapsedCollectionViewCell reuseIdentifier](CKFocusFilterBannerCollapsedCollectionViewCell, "reuseIdentifier");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "registerClass:forCellWithReuseIdentifier:", v33, v34);

  -[CKConversationListCollectionViewController collectionView](self, "collectionView");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = objc_opt_class();
  +[CKPinningOnboardingTitleCell reuseIdentifier](CKPinningOnboardingTitleCell, "reuseIdentifier");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "registerClass:forCellWithReuseIdentifier:", v36, v37);

  -[CKConversationListCollectionViewController collectionView](self, "collectionView");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = objc_opt_class();
  +[CKPinnedConversationCollectionViewCell reuseIdentifier](CKPinnedConversationCollectionViewCell, "reuseIdentifier");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "registerClass:forCellWithReuseIdentifier:", v39, v40);

  -[CKConversationListCollectionViewController collectionView](self, "collectionView");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = objc_opt_class();
  +[CKPinnedConversationDropTargetCollectionViewCell reuseIdentifier](CKPinnedConversationDropTargetCollectionViewCell, "reuseIdentifier");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "registerClass:forCellWithReuseIdentifier:", v42, v43);

  -[CKConversationListCollectionViewController collectionView](self, "collectionView");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = objc_opt_class();
  +[CKConversationListNewMessageCollectionViewCell reuseIdentifier](CKConversationListNewMessageCollectionViewCell, "reuseIdentifier");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "registerClass:forCellWithReuseIdentifier:", v45, v46);

  -[CKConversationListCollectionViewController collectionView](self, "collectionView");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = objc_opt_class();
  +[CKConversationListEmbeddedStandardTableViewCell reuseIdentifier](CKConversationListEmbeddedStandardTableViewCell, "reuseIdentifier");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "registerClass:forCellWithReuseIdentifier:", v48, v49);

  -[CKConversationListCollectionViewController collectionView](self, "collectionView");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = objc_opt_class();
  +[CKConversationListEmbeddedLargeTextTableViewCell reuseIdentifier](CKConversationListEmbeddedLargeTextTableViewCell, "reuseIdentifier");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "registerClass:forCellWithReuseIdentifier:", v51, v52);

  -[CKConversationListCollectionViewController collectionView](self, "collectionView");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = objc_opt_class();
  +[CKTipKitOnboardingCollectionViewCell reuseIdentifier](CKTipKitOnboardingCollectionViewCell, "reuseIdentifier");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "registerClass:forCellWithReuseIdentifier:", v54, v55);

  -[CKConversationListCollectionViewController collectionView](self, "collectionView");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = objc_opt_class();
  +[CKTipCollectionViewCell reuseIdentifier](_TtC7ChatKit23CKTipCollectionViewCell, "reuseIdentifier");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "registerClass:forCellWithReuseIdentifier:", v57, v58);

  -[CKConversationListCollectionViewController collectionView](self, "collectionView");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = objc_opt_class();
  +[CKPinnedSectionSeparatorView reuseIdentifier](CKPinnedSectionSeparatorView, "reuseIdentifier");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKPinnedSectionSeparatorView reuseIdentifier](CKPinnedSectionSeparatorView, "reuseIdentifier");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "registerClass:forSupplementaryViewOfKind:withReuseIdentifier:", v60, v61, v62);

  -[CKConversationListCollectionViewController collectionView](self, "collectionView");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v64 = objc_opt_class();
  +[CKRecoverableSectionDisclosureView reuseIdentifier](CKRecoverableSectionDisclosureView, "reuseIdentifier");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKRecoverableSectionDisclosureView reuseIdentifier](CKRecoverableSectionDisclosureView, "reuseIdentifier");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "registerClass:forSupplementaryViewOfKind:withReuseIdentifier:", v64, v65, v66);

  v106 = 0u;
  v107 = 0u;
  v104 = 0u;
  v105 = 0u;
  +[CKConversationListCollectionViewRecoverableConversationCell reuseIdentifiers](CKConversationListCollectionViewRecentlyDeletedConversationCell, "reuseIdentifiers");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v68 = objc_msgSend(v67, "countByEnumeratingWithState:objects:count:", &v104, v112, 16);
  if (v68)
  {
    v69 = *(_QWORD *)v105;
    do
    {
      v70 = 0;
      do
      {
        if (*(_QWORD *)v105 != v69)
          objc_enumerationMutation(v67);
        v71 = *(_QWORD *)(*((_QWORD *)&v104 + 1) + 8 * v70);
        -[CKConversationListCollectionViewController collectionView](self, "collectionView");
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v72, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), v71);

        ++v70;
      }
      while (v68 != v70);
      v68 = objc_msgSend(v67, "countByEnumeratingWithState:objects:count:", &v104, v112, 16);
    }
    while (v68);
  }

  v102 = 0u;
  v103 = 0u;
  v100 = 0u;
  v101 = 0u;
  +[CKConversationListCollectionViewRecoverableConversationCell reuseIdentifiers](CKConversationListCollectionViewJunkConversationCell, "reuseIdentifiers", 0);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  v74 = objc_msgSend(v73, "countByEnumeratingWithState:objects:count:", &v100, v111, 16);
  if (v74)
  {
    v75 = *(_QWORD *)v101;
    do
    {
      v76 = 0;
      do
      {
        if (*(_QWORD *)v101 != v75)
          objc_enumerationMutation(v73);
        v77 = *(_QWORD *)(*((_QWORD *)&v100 + 1) + 8 * v76);
        -[CKConversationListCollectionViewController collectionView](self, "collectionView");
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v78, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), v77);

        ++v76;
      }
      while (v74 != v76);
      v74 = objc_msgSend(v73, "countByEnumeratingWithState:objects:count:", &v100, v111, 16);
    }
    while (v74);
  }

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v79, "theme");
  v80 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v80, "conversationListBackgroundColor");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  if (v81)
  {

  }
  else if (!CKIsRunningInMacCatalyst()
         || (objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags"),
             v84 = (void *)objc_claimAutoreleasedReturnValue(),
             v85 = objc_msgSend(v84, "macApplicationMetricsGatheringEnabled"),
             v84,
             !v85))
  {
    -[CKConversationListCollectionViewController collectionView](self, "collectionView");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v80, "conversationListCollectionViewBackgroundColor");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v82, "setBackgroundColor:", v83);
    goto LABEL_23;
  }
  -[CKConversationListCollectionViewController collectionView](self, "collectionView");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v80, "conversationListBackgroundColor");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "setBackgroundColor:", v83);
LABEL_23:

  if (!CKIsRunningInMacCatalyst()
    || (objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags"),
        v86 = (void *)objc_claimAutoreleasedReturnValue(),
        v87 = objc_msgSend(v86, "macApplicationMetricsGatheringEnabled"),
        v86,
        (v87 & 1) == 0))
  {
    -[CKConversationListCollectionViewController collectionView](self, "collectionView");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    v89 = objc_alloc(MEMORY[0x1E0CEABB0]);
    -[CKConversationListCollectionViewController collectionView](self, "collectionView");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v90, "bounds");
    v91 = (void *)objc_msgSend(v89, "initWithFrame:");
    objc_msgSend(v88, "setBackgroundView:", v91);

  }
  -[CKConversationListCollectionViewController navigationController](self, "navigationController");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v92, "navigationBar");
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v93, "setBackgroundColor:", v94);

  -[CKConversationListCollectionViewController updateNavigationItems](self, "updateNavigationItems");
  if (!self->_tipManager)
  {
    v95 = -[CKConversationListTipManager initWithConversationListController:]([CKConversationListTipManager alloc], "initWithConversationListController:", self);
    tipManager = self->_tipManager;
    self->_tipManager = v95;

  }
  -[CKConversationListCollectionViewController updater](self, "updater");
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v97, "setNeedsDeferredUpdateWithReason:", CFSTR("viewLoaded"));

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v98 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v98, OS_LOG_TYPE_INFO))
    {
      -[CKConversationListCollectionViewController collectionView](self, "collectionView");
      v99 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v110 = v99;
      _os_log_impl(&dword_18DFCD000, v98, OS_LOG_TYPE_INFO, "loadView, collectionView initialized as:%@", buf, 0xCu);

    }
  }

}

- (id)dataSourceWithCollectionView:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  _QWORD v9[4];
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;
  id location;

  v4 = a3;
  location = 0;
  objc_initWeak(&location, self);
  v5 = objc_alloc(MEMORY[0x1E0CEA440]);
  v6 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __87__CKConversationListCollectionViewController_DataSource__dataSourceWithCollectionView___block_invoke;
  v13[3] = &unk_1E2750800;
  objc_copyWeak(&v14, &location);
  v7 = (void *)objc_msgSend(v5, "initWithCollectionView:cellProvider:", v4, v13);
  v11[0] = v6;
  v11[1] = 3221225472;
  v11[2] = __87__CKConversationListCollectionViewController_DataSource__dataSourceWithCollectionView___block_invoke_2;
  v11[3] = &unk_1E2750828;
  objc_copyWeak(&v12, &location);
  objc_msgSend(v7, "setSupplementaryViewProvider:", v11);
  objc_msgSend(v7, "_setCanReorderItemHandler:", &__block_literal_global_104);
  v9[0] = v6;
  v9[1] = 3221225472;
  v9[2] = __87__CKConversationListCollectionViewController_DataSource__dataSourceWithCollectionView___block_invoke_4;
  v9[3] = &unk_1E2755238;
  objc_copyWeak(&v10, &location);
  objc_msgSend(v7, "_setDidReorderItemsHandler:", v9);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

  return v7;
}

- (void)setDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_dataSource, a3);
}

- (BOOL)completedDeferredSetup
{
  return self->_completedDeferredSetup;
}

void __67__CKConversationListCollectionViewController_viewDidLayoutSubviews__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  CKAppExtensionDevelopmentTargetBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "length");

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "conversationList");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "conversations");
    v7 = (id)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v7, "count"))
    {
      objc_msgSend(*(id *)(a1 + 32), "delegate");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "firstObject");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "showConversation:animate:", v6, 0);

    }
  }
}

void __95__CKConversationListCollectionViewController_registerForCloudKitEventsWithDelayedRegistration___block_invoke()
{
  void *v0;
  uint64_t v1;
  NSObject *v2;
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "integerForKey:", CFSTR("cloudkit-sync-ui-tests"));

  if (v1 >= 1)
  {
    registerForCloudKitEventsWithDelayedRegistration__sRegistrationDelay = 0x3FF0000000000000;
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v2 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
      {
        v3 = 134218240;
        v4 = 0x3FF0000000000000;
        v5 = 2048;
        v6 = 0x4014000000000000;
        _os_log_impl(&dword_18DFCD000, v2, OS_LOG_TYPE_INFO, "registration delay artificially set to %f from %f for runtime tests only", (uint8_t *)&v3, 0x16u);
      }

    }
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  const __CFString *v6;
  int64_t v7;
  id v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  int v32;
  void *v33;
  int v34;
  NSObject *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t i;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  NSObject *v55;
  void *v56;
  char v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  uint64_t v66;
  _QWORD v67[5];
  _QWORD v68[5];
  _QWORD block[5];
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  _QWORD v74[5];
  objc_super v75;
  uint8_t v76[128];
  uint8_t buf[4];
  const __CFString *v78;
  __int16 v79;
  int64_t v80;
  __int16 v81;
  id v82;
  __int16 v83;
  void *v84;
  uint64_t v85;

  v3 = a3;
  v85 = *MEMORY[0x1E0C80C00];
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      if (v3)
        v6 = CFSTR("YES");
      else
        v6 = CFSTR("NO");
      v7 = -[CKConversationListCollectionViewController numberOfConversations](self, "numberOfConversations");
      CKConversationListFilterModeStringValue(-[CKConversationListCollectionViewController filterMode](self, "filterMode"));
      v8 = (id)objc_claimAutoreleasedReturnValue();
      -[CKConversationListCollectionViewController collectionView](self, "collectionView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      v78 = v6;
      v79 = 2048;
      v80 = v7;
      v81 = 2112;
      v82 = v8;
      v83 = 2112;
      v84 = v9;
      _os_log_impl(&dword_18DFCD000, v5, OS_LOG_TYPE_INFO, "viewWillAppear, animated=%@, numberOfChats:%tu filterMode:%@, collectionView:%@", buf, 0x2Au);

    }
  }
  v75.receiver = self;
  v75.super_class = (Class)CKConversationListCollectionViewController;
  -[CKConversationListCollectionViewController viewWillAppear:](&v75, sel_viewWillAppear_, v3);
  -[CKConversationListCollectionViewController setIsAppearing:](self, "setIsAppearing:", 1);
  -[CKConversationListCollectionViewController macToolbarController](self, "macToolbarController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = -[CKConversationListCollectionViewController conformsToProtocol:](self, "conformsToProtocol:", &unk_1EE1607D8);

    if (v11)
    {
      -[CKConversationListCollectionViewController macToolbarController](self, "macToolbarController");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setPrimaryItemProvider:", self);

      -[CKConversationListCollectionViewController macToolbarController](self, "macToolbarController");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setShouldDrawPrimaryBlur:", 0);

    }
  }
  if (self->_isInitialAppearance)
  {
    -[CKConversationListCollectionViewController searchController](self, "searchController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "searchBar");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "setDelegate:", self);
    CKFrameworkBundle();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("SEARCH"), &stru_1E276D870, CFSTR("ChatKit"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setPlaceholder:", v17);

    objc_msgSend(v15, "sizeToFit");
    -[CKConversationListCollectionViewController navigationItem](self, "navigationItem");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKConversationListCollectionViewController searchController](self, "searchController");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setSearchController:", v19);

    -[CKConversationListCollectionViewController invalidateCellLayout](self, "invalidateCellLayout");
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v19) = objc_msgSend(v20, "conversationListShowsSearchOnAppear");

    if ((_DWORD)v19)
    {
      -[CKConversationListCollectionViewController navigationItem](self, "navigationItem");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setHidesSearchBarWhenScrolling:", 0);
    }
    else
    {
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "conversationListHidesSearchBarWhenScrolling");
      -[CKConversationListCollectionViewController navigationItem](self, "navigationItem");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setHidesSearchBarWhenScrolling:", v22);

    }
    if (!CKIsRunningInMacCatalyst())
    {
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v24, "conversationListSearchHidesNavigationBarDuringPresentation");
      -[CKConversationListCollectionViewController searchController](self, "searchController");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setHidesNavigationBarDuringPresentation:", v25);

      -[CKConversationListCollectionViewController navigationController](self, "navigationController");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "navigationBar");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "setPrefersLargeTitles:", 1);

      -[CKConversationListCollectionViewController navigationItem](self, "navigationItem");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKConversationListCollectionViewController transparentNavBarAppearance](self, "transparentNavBarAppearance");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "setScrollEdgeAppearance:", v30);

    }
  }
  self->_isVisible = 1;
  -[CKConversationListCollectionViewController splitViewController](self, "splitViewController", 1015);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v31, "isCollapsed");

  if (v32)
  {
    if (-[CKConversationListCollectionViewController compositionWasSent](self, "compositionWasSent"))
    {
      -[CKConversationListCollectionViewController searchController](self, "searchController");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = objc_msgSend(v33, "isActive");

      if (v34)
      {
        v74[0] = MEMORY[0x1E0C809B0];
        v74[1] = 3221225472;
        v74[2] = __61__CKConversationListCollectionViewController_viewWillAppear___block_invoke;
        v74[3] = &unk_1E274A208;
        v74[4] = self;
        objc_msgSend(MEMORY[0x1E0CEABB0], "performWithoutAnimation:", v74);
      }
    }
  }
  -[CKConversationListCollectionViewController setCompositionWasSent:](self, "setCompositionWasSent:", 0);
  -[CKConversationListCollectionViewController _endHoldingUpdatesOnViewWillAppear](self, "_endHoldingUpdatesOnViewWillAppear");
  if (-[CKConversationListCollectionViewController isShowingSwipeDeleteConfirmation](self, "isShowingSwipeDeleteConfirmation"))
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18DFCD000, v35, OS_LOG_TYPE_INFO, "isShowingSwipeDeleteConfirmation is YES on viewWillAppear. This is an unexpected state", buf, 2u);
      }

    }
    -[CKConversationListCollectionViewController setIsShowingSwipeDeleteConfirmation:](self, "setIsShowingSwipeDeleteConfirmation:", 0);
    -[CKConversationListCollectionViewController updateNavigationItems](self, "updateNavigationItems");
  }
  if (!-[CKConversationListCollectionViewController _shouldKeepSelection](self, "_shouldKeepSelection"))
  {
    -[CKConversationListCollectionViewController lastSelectedConversationItemIdentifier](self, "lastSelectedConversationItemIdentifier");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKConversationListCollectionViewController dataSource](self, "dataSource");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "indexPathForItemIdentifier:", v36);
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    -[CKConversationListCollectionViewController setLastSelectedConversationItemIdentifier:](self, "setLastSelectedConversationItemIdentifier:", 0);
    if (v38)
    {
      if (objc_msgSend(v38, "section") == 2)
      {
        -[CKConversationListCollectionViewController collectionView](self, "collectionView");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "cellForItemAtIndexPath:", v38);
        v40 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v40, "pinnedConversationView");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "setDimmed:", 0);

      }
      -[CKConversationListCollectionViewController collectionView](self, "collectionView");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "deselectItemAtIndexPath:animated:", v38, 0);

    }
    v72 = 0u;
    v73 = 0u;
    v71 = 0u;
    v70 = 0u;
    -[CKConversationListCollectionViewController collectionView](self, "collectionView");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "indexPathsForSelectedItems");
    v44 = (void *)objc_claimAutoreleasedReturnValue();

    v45 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v70, v76, 16);
    if (v45)
    {
      v46 = *(_QWORD *)v71;
      do
      {
        for (i = 0; i != v45; ++i)
        {
          if (*(_QWORD *)v71 != v46)
            objc_enumerationMutation(v44);
          v48 = *(void **)(*((_QWORD *)&v70 + 1) + 8 * i);
          if ((objc_msgSend(v48, "isEqual:", v38) & 1) == 0)
          {
            -[CKConversationListCollectionViewController collectionView](self, "collectionView");
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v49, "deselectItemAtIndexPath:animated:", v48, v3);

            if (objc_msgSend(v48, "section") == 2)
            {
              -[CKConversationListCollectionViewController collectionView](self, "collectionView");
              v50 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v50, "cellForItemAtIndexPath:", v48);
              v51 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v51, "pinnedConversationView");
              v52 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v52, "setDimmed:", 0);

            }
          }
        }
        v45 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v70, v76, 16);
      }
      while (v45);
    }

  }
  if (!*((_BYTE *)&self->super.super.super.super.isa + v66)
    && -[CKConversationListCollectionViewController _shouldResizeNavigationBar](self, "_shouldResizeNavigationBar"))
  {
    -[CKConversationListCollectionViewController navigationController](self, "navigationController");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "navigationBar");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "sizeToFit");

  }
  -[CKConversationListCollectionViewController tipKitQueue](self, "tipKitQueue");
  v55 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61__CKConversationListCollectionViewController_viewWillAppear___block_invoke_469;
  block[3] = &unk_1E274A208;
  block[4] = self;
  dispatch_async(v55, block);

  objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = objc_msgSend(v56, "isSuspended");

  if ((v57 & 1) == 0)
    -[CKConversationListCollectionViewController startTipCellAnimatingIfNecessary](self, "startTipCellAnimatingIfNecessary");
  -[CKConversationListCollectionViewController navigationController](self, "navigationController");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "navigationBar");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "theme");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "setBarStyle:", objc_msgSend(v61, "navBarStyle"));

  -[CKConversationListCollectionViewController setNeedsStatusBarAppearanceUpdate](self, "setNeedsStatusBarAppearanceUpdate");
  -[CKConversationListCollectionViewController _updateInsets](self, "_updateInsets");
  -[CKConversationListCollectionViewController _updateNavbarLayoutIfNeeded](self, "_updateNavbarLayoutIfNeeded");
  -[CKConversationListCollectionViewController _updateLargeTitleDisplayModeWithAnimation:](self, "_updateLargeTitleDisplayModeWithAnimation:", 0);
  if (self->_searchResultsController)
  {
    -[CKConversationListCollectionViewController searchResultsController](self, "searchResultsController");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "viewWillAppear:", v3);

  }
  objc_msgSend(MEMORY[0x1E0D35798], "sharedRegistry");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v68[0] = MEMORY[0x1E0C809B0];
  v68[1] = 3221225472;
  v68[2] = __61__CKConversationListCollectionViewController_viewWillAppear___block_invoke_2;
  v68[3] = &unk_1E274A208;
  v68[4] = self;
  objc_msgSend(v63, "updateRecoverableMessagesMetadataSynchronously:completionHandler:", 0, v68);

  if (-[CKConversationListCollectionViewController filterMode](self, "filterMode") == 7)
  {
    -[CKConversationListCollectionViewController recentlyDeletedViewWillAppear:](self, "recentlyDeletedViewWillAppear:", v3);
  }
  else if (-[CKConversationListCollectionViewController filterMode](self, "filterMode") == 9)
  {
    -[CKConversationListCollectionViewController oscarViewWillAppear:](self, "oscarViewWillAppear:", v3);
  }
  else
  {
    -[CKConversationListCollectionViewController setEditingMode:](self, "setEditingMode:", 0);
  }
  -[CKConversationListCollectionViewController _configureCatalystFiltersNavigation](self, "_configureCatalystFiltersNavigation");
  v67[0] = MEMORY[0x1E0C809B0];
  v67[1] = 3221225472;
  v67[2] = __61__CKConversationListCollectionViewController_viewWillAppear___block_invoke_3;
  v67[3] = &unk_1E274A208;
  v67[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], v67);
  -[CKConversationListCollectionViewController navigationController](self, "navigationController");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "navigationBar");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "setTintColor:", 0);

}

- (void)_iosUpdateNavbarLayoutIfNeeded
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;

  -[CKConversationListCollectionViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "_shouldReverseLayoutDirection");

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKConversationListCollectionViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "layoutMargins");
  objc_msgSend(v5, "contentInsetsForConversationListSearchBarForLayoutMargins:isRTL:", v4);
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "contentRectEdgeForConversationListSearchBarInsetsWithRTL:", v4);

  -[CKConversationListCollectionViewController searchController](self, "searchController");
  v18 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "searchBar");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "_setOverrideContentInsets:forRectEdges:", v16, v8, v10, v12, v14);

}

- (void)_configureNavbarButtonsForNavigationItem:(id)a3
{
  id v4;
  void *v5;
  char v6;
  _BOOL4 v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void **v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  _QWORD v37[2];
  void *v38;
  void *v39;
  _QWORD v40[2];

  v40[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "setHidesBackButton:", -[CKConversationListCollectionViewController _hidesBackButton](self, "_hidesBackButton"));
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "supportsConversationListEditing");

  if ((v6 & 1) != 0)
  {
    v7 = -[CKConversationListCollectionViewController _shouldShowInboxView](self, "_shouldShowInboxView");
    v8 = -[CKConversationListCollectionViewController editingMode](self, "editingMode");
    switch(v8)
    {
      case 2uLL:
        if (-[CKConversationListCollectionViewController isShowingPinningOnboarding](self, "isShowingPinningOnboarding"))
        {
          -[CKConversationListCollectionViewController cancelButtonItem](self, "cancelButtonItem");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = v15;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v28, 1);
          v10 = (void *)objc_claimAutoreleasedReturnValue();

          -[CKConversationListCollectionViewController doneButtonItem](self, "doneButtonItem");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = v11;
          v12 = (void *)MEMORY[0x1E0C99D20];
          v13 = &v27;
          goto LABEL_30;
        }
        -[CKConversationListCollectionViewController doneButtonItem](self, "doneButtonItem");
        v19 = objc_claimAutoreleasedReturnValue();
        v11 = (void *)v19;
        if (v7)
        {
          v25 = v19;
          v17 = (void *)MEMORY[0x1E0C99D20];
          v18 = &v25;
          goto LABEL_18;
        }
        v26 = v19;
        v21 = (void *)MEMORY[0x1E0C99D20];
        v22 = &v26;
        break;
      case 1uLL:
        if (-[CKConversationListCollectionViewController shouldShowPinnedConversations](self, "shouldShowPinnedConversations"))
        {
          -[CKConversationListCollectionViewController doneButtonItem](self, "doneButtonItem");
          v16 = objc_claimAutoreleasedReturnValue();
          v11 = (void *)v16;
          if (v7)
          {
            v33 = v16;
            v17 = (void *)MEMORY[0x1E0C99D20];
            v18 = &v33;
            goto LABEL_18;
          }
          v34 = v16;
          v21 = (void *)MEMORY[0x1E0C99D20];
          v22 = &v34;
        }
        else
        {
          if (-[CKConversationListCollectionViewController filterMode](self, "filterMode") == 7)
          {
            if (!-[CKConversationListCollectionViewController isRecentlyDeletedModal](self, "isRecentlyDeletedModal"))
              goto LABEL_19;
            -[CKConversationListCollectionViewController closeButtonItem](self, "closeButtonItem");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            v32 = v11;
            v17 = (void *)MEMORY[0x1E0C99D20];
            v18 = (uint64_t *)&v32;
LABEL_18:
            objc_msgSend(v17, "arrayWithObjects:count:", v18, 1, v25);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_22:
            v10 = 0;
LABEL_31:

            goto LABEL_32;
          }
          if (!-[CKConversationListCollectionViewController isOscarModal](self, "isOscarModal"))
          {
            -[CKConversationListCollectionViewController selectAllButtonItem](self, "selectAllButtonItem");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v30 = v24;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v30, 1);
            v10 = (void *)objc_claimAutoreleasedReturnValue();

            -[CKConversationListCollectionViewController doneButtonItem](self, "doneButtonItem");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            v29 = v11;
            v12 = (void *)MEMORY[0x1E0C99D20];
            v13 = &v29;
            goto LABEL_30;
          }
          -[CKConversationListCollectionViewController doneButtonItem](self, "doneButtonItem");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = v11;
          v21 = (void *)MEMORY[0x1E0C99D20];
          v22 = (uint64_t *)&v31;
        }
        break;
      case 0uLL:
        if (-[CKConversationListCollectionViewController isOscarModal](self, "isOscarModal"))
        {
          -[CKConversationListCollectionViewController editOscarButtonItem](self, "editOscarButtonItem");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v39 = v9;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v39, 1);
          v10 = (void *)objc_claimAutoreleasedReturnValue();

          -[CKConversationListCollectionViewController closeButtonItem](self, "closeButtonItem");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v38 = v11;
          v12 = (void *)MEMORY[0x1E0C99D20];
          v13 = &v38;
LABEL_30:
          objc_msgSend(v12, "arrayWithObjects:count:", v13, 1);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_31;
        }
        if (!v7)
        {
          -[CKConversationListCollectionViewController editButtonItem](self, "editButtonItem");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v36 = v23;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v36, 1);
          v10 = (void *)objc_claimAutoreleasedReturnValue();

          -[CKConversationListCollectionViewController composeButtonItem](self, "composeButtonItem");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = v11;
          v12 = (void *)MEMORY[0x1E0C99D20];
          v13 = &v35;
          goto LABEL_30;
        }
        -[CKConversationListCollectionViewController composeButtonItem](self, "composeButtonItem");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v37[0] = v11;
        -[CKConversationListCollectionViewController optionsButtonItem](self, "optionsButtonItem");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v37[1] = v20;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 2);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_22;
      default:
LABEL_19:
        v10 = 0;
        v14 = 0;
LABEL_32:
        objc_msgSend(v4, "setLeftBarButtonItems:animated:", v10, 1);
        goto LABEL_33;
    }
    objc_msgSend(v21, "arrayWithObjects:count:", v22, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 0;
    goto LABEL_31;
  }
  objc_msgSend(v4, "setLeftBarButtonItems:animated:", 0, 1);
  -[CKConversationListCollectionViewController composeButtonItem](self, "composeButtonItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v40[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v40, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_33:
  objc_msgSend(v4, "setRightBarButtonItems:animated:", v14, 1);

}

- (UISearchController)searchController
{
  UISearchController *v3;
  UISearchController *searchController;
  void *v5;
  int v6;
  Class *v7;
  UISearchController *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  UISearchController *v16;

  if (-[CKConversationListCollectionViewController isRecentlyDeletedModal](self, "isRecentlyDeletedModal")
    || -[CKConversationListCollectionViewController isOscarModal](self, "isOscarModal"))
  {
    v3 = 0;
  }
  else
  {
    searchController = self->_searchController;
    if (!searchController)
    {
      -[CKConversationListCollectionViewController searchResultsController](self, "searchResultsController");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = CKIsRunningInMacCatalyst();
      v7 = (Class *)0x1E0CEA980;
      if (v6)
        v7 = (Class *)off_1E2733660;
      v8 = (UISearchController *)objc_msgSend(objc_alloc(*v7), "initWithSearchResultsController:", v5);
      -[UISearchController setSearchResultsUpdater:](v8, "setSearchResultsUpdater:", v5);
      -[UISearchController setDelegate:](v8, "setDelegate:", self);
      -[UISearchController searchBar](v8, "searchBar");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "theme");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setBarStyle:", objc_msgSend(v11, "defaultBarStyle"));

      -[UISearchController searchBar](v8, "searchBar");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "theme");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setKeyboardAppearance:", objc_msgSend(v14, "keyboardAppearance"));

      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[UISearchController setObscuresBackgroundDuringPresentation:](v8, "setObscuresBackgroundDuringPresentation:", objc_msgSend(v15, "searchControllerObscuresConversationList"));

      v16 = self->_searchController;
      self->_searchController = v8;

      searchController = self->_searchController;
    }
    v3 = searchController;
  }
  return v3;
}

- (BOOL)isOscarModal
{
  return self->_oscarModal;
}

- (BOOL)isRecentlyDeletedModal
{
  return self->_recentlyDeletedModal;
}

- (BOOL)_shouldShowInboxView
{
  return CKShouldShowInboxView() != 0;
}

- (UIBarButtonItem)editButtonItem
{
  UIBarButtonItem *editButtonItem;
  UIBarButtonItem *v4;
  UIBarButtonItem *v5;
  BOOL v6;
  UIBarButtonItem *v7;
  uint64_t v9;
  uint64_t v10;
  id (*v11)(uint64_t);
  void *v12;
  id v13;
  id location;

  editButtonItem = self->_editButtonItem;
  if (!editButtonItem)
  {
    v4 = (UIBarButtonItem *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA380]), "initWithBarButtonSystemItem:primaryAction:", 2, 0);
    v5 = self->_editButtonItem;
    self->_editButtonItem = v4;

    -[UIBarButtonItem setAccessibilityIdentifier:](self->_editButtonItem, "setAccessibilityIdentifier:", CFSTR("optionsButton"));
    v6 = -[CKConversationListCollectionViewController hasActivePinnedConversationDropSession](self, "hasActivePinnedConversationDropSession");
    editButtonItem = self->_editButtonItem;
    if (!v6)
    {
      -[UIBarButtonItem setSpringLoaded:](editButtonItem, "setSpringLoaded:", 1);
      location = 0;
      objc_initWeak(&location, self);
      v7 = self->_editButtonItem;
      v9 = MEMORY[0x1E0C809B0];
      v10 = 3221225472;
      v11 = __60__CKConversationListCollectionViewController_editButtonItem__block_invoke;
      v12 = &unk_1E2757C38;
      objc_copyWeak(&v13, &location);
      -[UIBarButtonItem _setSecondaryActionsProvider:](v7, "_setSecondaryActionsProvider:", &v9);
      -[UIBarButtonItem setSecondaryActionsArePrimary:](self->_editButtonItem, "setSecondaryActionsArePrimary:", 1, v9, v10, v11, v12);
      objc_destroyWeak(&v13);
      objc_destroyWeak(&location);
      editButtonItem = self->_editButtonItem;
    }
  }
  return editButtonItem;
}

- (UIBarButtonItem)composeButtonItem
{
  UIBarButtonItem *composeButtonItem;
  void *v4;
  UIBarButtonItem *v5;
  UIBarButtonItem *v6;
  void *v7;

  composeButtonItem = self->_composeButtonItem;
  if (!composeButtonItem)
  {
    objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:", CFSTR("square.and.pencil"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (UIBarButtonItem *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA380]), "initWithImage:style:target:action:", v4, 0, self, sel_composeButtonClicked_);
    v6 = self->_composeButtonItem;
    self->_composeButtonItem = v5;

    -[UIBarButtonItem setAccessibilityIdentifier:](self->_composeButtonItem, "setAccessibilityIdentifier:", CFSTR("composeButton"));
    if (CKIsRunningInMacCatalyst())
    {
      objc_msgSend(MEMORY[0x1E0CEA478], "labelColor");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIBarButtonItem setTintColor:](self->_composeButtonItem, "setTintColor:", v7);

    }
    -[UIBarButtonItem setSpringLoaded:](self->_composeButtonItem, "setSpringLoaded:", 1);

    composeButtonItem = self->_composeButtonItem;
  }
  return composeButtonItem;
}

- (BOOL)_hidesBackButton
{
  unint64_t v3;

  if (-[CKConversationListCollectionViewController _shouldShowInboxView](self, "_shouldShowInboxView"))
  {
    v3 = -[CKConversationListCollectionViewController editingMode](self, "editingMode");
    if (v3)
      LOBYTE(v3) = -[CKConversationListCollectionViewController filterMode](self, "filterMode") != 7;
  }
  else
  {
    LOBYTE(v3) = 1;
  }
  return v3;
}

- (BOOL)_shouldUpdateConversationSelection
{
  void *v3;
  int v4;
  void *v5;
  int v6;
  int v7;
  NSObject *v8;
  const char *v9;
  uint8_t *v10;
  __int16 v12;
  uint8_t buf[2];
  __int16 v14;
  __int16 v15;

  if (-[CKConversationListCollectionViewController _shouldKeepSelection](self, "_shouldKeepSelection"))
  {
    if (-[CKConversationListCollectionViewController isVisible](self, "isVisible"))
    {
      if (-[CKConversationListCollectionViewController haveAppliedInitialSnapshot](self, "haveAppliedInitialSnapshot"))
      {
        -[CKConversationListCollectionViewController searchController](self, "searchController");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        v4 = objc_msgSend(v3, "isActive");

        if (v4)
        {
          -[CKConversationListCollectionViewController collectionView](self, "collectionView");
          v5 = (void *)objc_claimAutoreleasedReturnValue();
          -[CKConversationListCollectionViewController _deselectSelectedIndexPathsInCollectionView:animated:](self, "_deselectSelectedIndexPathsInCollectionView:animated:", v5, 0);

          v6 = IMOSLoggingEnabled();
          LOBYTE(v7) = 0;
          if (v6)
          {
            OSLogHandleForIMFoundationCategory();
            v8 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
            {
              v12 = 0;
              v9 = "multi-select: deselecting all indexPaths because searchController is active";
              v10 = (uint8_t *)&v12;
LABEL_17:
              _os_log_impl(&dword_18DFCD000, v8, OS_LOG_TYPE_INFO, v9, v10, 2u);
              goto LABEL_18;
            }
            goto LABEL_18;
          }
        }
        else
        {
          LOBYTE(v7) = 1;
        }
      }
      else
      {
        v7 = IMOSLoggingEnabled();
        if (v7)
        {
          OSLogHandleForIMFoundationCategory();
          v8 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            v9 = "multi-select: Not updating conversation selection because dataSource has not updated before.";
            v10 = buf;
            goto LABEL_17;
          }
          goto LABEL_18;
        }
      }
    }
    else
    {
      v7 = IMOSLoggingEnabled();
      if (v7)
      {
        OSLogHandleForIMFoundationCategory();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
        {
          v14 = 0;
          v9 = "multi-select: Not updating conversation selection because view is not visible";
          v10 = (uint8_t *)&v14;
          goto LABEL_17;
        }
        goto LABEL_18;
      }
    }
  }
  else
  {
    v7 = IMOSLoggingEnabled();
    if (v7)
    {
      OSLogHandleForIMFoundationCategory();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        v15 = 0;
        v9 = "multi-select: Not updating conversation selection because current configuration does not show selection.";
        v10 = (uint8_t *)&v15;
        goto LABEL_17;
      }
LABEL_18:

      LOBYTE(v7) = 0;
    }
  }
  return v7;
}

- (BOOL)_shouldKeepSelection
{
  void *v3;
  char v4;
  int v5;
  void *v6;
  void *v7;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "alwaysShowSelectionInConversationList");

  if ((v4 & 1) != 0)
  {
    LOBYTE(v5) = 1;
  }
  else
  {
    -[CKConversationListCollectionViewController splitViewController](self, "splitViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      -[CKConversationListCollectionViewController splitViewController](self, "splitViewController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v7, "isCollapsed") ^ 1;

    }
    else
    {
      LOBYTE(v5) = 0;
    }

  }
  return v5;
}

- (CKSearchViewController)searchResultsController
{
  CKSearchViewController *searchResultsController;
  CKSearchViewController *v4;
  void *v5;
  CKSearchViewController *v6;
  CKSearchViewController *v7;

  searchResultsController = self->_searchResultsController;
  if (!searchResultsController)
  {
    v4 = [CKSearchViewController alloc];
    +[CKSpotlightQueryUtilities defaultSearchControllers](CKSpotlightQueryUtilities, "defaultSearchControllers");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[CKSearchViewController initWithSearchControllerClasses:](v4, "initWithSearchControllerClasses:", v5);

    -[CKSearchViewController setDelegate:](v6, "setDelegate:", self);
    v7 = self->_searchResultsController;
    self->_searchResultsController = v6;

    searchResultsController = self->_searchResultsController;
  }
  return searchResultsController;
}

void __61__CKConversationListCollectionViewController_viewWillAppear___block_invoke_3(uint64_t a1)
{
  _BYTE *v2;
  void *v3;
  void *v4;
  char v5;
  id v6;

  v2 = *(_BYTE **)(a1 + 32);
  if (v2[1015])
  {
    objc_msgSend(v2, "collectionView");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "indexPathsForSelectedItems");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "count"))
    {
LABEL_5:

      return;
    }
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "isCollapsed"))
    {

      goto LABEL_5;
    }
    v5 = objc_msgSend(*(id *)(a1 + 32), "isShowingConversationFromCatalystOpenURL");

    if ((v5 & 1) == 0 && (objc_msgSend(*(id *)(a1 + 32), "isRecentlyDeletedModal") & 1) == 0)
      objc_msgSend(*(id *)(a1 + 32), "selectDefaultConversationAnimated:", 0);
  }
}

- (id)transparentNavBarAppearance
{
  id v2;

  v2 = objc_alloc_init(MEMORY[0x1E0CEA7B0]);
  objc_msgSend(v2, "configureWithTransparentBackground");
  return v2;
}

- (OS_dispatch_queue)tipKitQueue
{
  OS_dispatch_queue *tipKitQueue;
  OS_dispatch_queue *v4;
  OS_dispatch_queue *v5;

  tipKitQueue = self->_tipKitQueue;
  if (!tipKitQueue)
  {
    v4 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.messages.chatkit.tipkit", 0);
    v5 = self->_tipKitQueue;
    self->_tipKitQueue = v4;

    tipKitQueue = self->_tipKitQueue;
  }
  return tipKitQueue;
}

- (void)startTipCellAnimatingIfNecessary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[CKConversationListCollectionViewController dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKTipKitOnboardingCollectionViewCell reuseIdentifier](CKTipKitOnboardingCollectionViewCell, "reuseIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "indexPathForItemIdentifier:", v4);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  -[CKConversationListCollectionViewController collectionView](self, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cellForItemAtIndexPath:", v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && -[CKConversationListCollectionViewController isVisible](self, "isVisible"))
    objc_msgSend(v6, "willDisplayCell");

}

- (void)setLastSelectedConversationItemIdentifier:(id)a3
{
  id v5;
  NSString **p_lastSelectedConversationItemIdentifier;
  void *v7;
  NSObject *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  p_lastSelectedConversationItemIdentifier = &self->_lastSelectedConversationItemIdentifier;
  if (!-[NSString isEqualToString:](self->_lastSelectedConversationItemIdentifier, "isEqualToString:", v5))
  {
    objc_storeStrong((id *)&self->_lastSelectedConversationItemIdentifier, a3);
    if (-[NSString length](*p_lastSelectedConversationItemIdentifier, "length")
      && !-[CKConversationListCollectionViewController _isRunningPPT](self, "_isRunningPPT"))
    {
      objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:forKey:inDomain:", *p_lastSelectedConversationItemIdentifier, CFSTR("CKLastSelectedItemIdentifier"), CFSTR("com.apple.MobileSMS"));

    }
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        v9 = 138412290;
        v10 = v5;
        _os_log_impl(&dword_18DFCD000, v8, OS_LOG_TYPE_INFO, "multi-select: set last selected conversation item identifier: %@", (uint8_t *)&v9, 0xCu);
      }

    }
  }

}

- (void)setEditingMode:(unint64_t)a3 animated:(BOOL)a4
{
  -[CKConversationListCollectionViewController setEditingMode:animated:shouldUpdate:](self, "setEditingMode:animated:shouldUpdate:", a3, a4, 1);
}

- (void)setEditingMode:(unint64_t)a3
{
  -[CKConversationListCollectionViewController setEditingMode:animated:](self, "setEditingMode:animated:", a3, 0);
}

- (void)setCompositionWasSent:(BOOL)a3
{
  self->_compositionWasSent = a3;
}

- (CKMacToolbarController)macToolbarController
{
  return (CKMacToolbarController *)objc_loadWeakRetained((id *)&self->_macToolbarController);
}

- (NSString)lastSelectedConversationItemIdentifier
{
  return self->_lastSelectedConversationItemIdentifier;
}

- (BOOL)isShowingSwipeDeleteConfirmation
{
  return self->_isShowingSwipeDeleteConfirmation;
}

- (BOOL)compositionWasSent
{
  return self->_compositionWasSent;
}

void __72__CKConversationListCollectionViewController_viewDidAppearDeferredSetup__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "traitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  CKPrewarmBalloonViewMaskAndPunchOutCacheIfNeeded(v2);

  CKPrewarmBalloonViewCacheIfNeeded();
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v2) = objc_msgSend(v3, "isCollapsed");

  if ((_DWORD)v2)
    CKPrewarmCKMessageEntryView();
}

- (void)viewWillLayoutSubviews
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CKConversationListCollectionViewController;
  -[CKConversationListCollectionViewController viewWillLayoutSubviews](&v8, sel_viewWillLayoutSubviews);
  if (CKIsRunningInMacCatalyst())
  {
    -[CKConversationListCollectionViewController view](self, "view");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "frame");
    v5 = v4;

    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "snapToMinConversationListWidth");
    -[CKConversationListCollectionViewController setIsBelowMacSnapToMinWidth:](self, "setIsBelowMacSnapToMinWidth:", v5 < v7);

  }
}

- (void)updateNavigationItems
{
  id v3;

  -[CKConversationListCollectionViewController navigationItem](self, "navigationItem");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (!CKIsRunningForDevelopmentOnSimulator() || CKIsRunningUITests())
    -[CKConversationListCollectionViewController _configureNavbarButtonsForNavigationItem:](self, "_configureNavbarButtonsForNavigationItem:", v3);
  -[CKConversationListCollectionViewController _updateSearchControllerForConversationListBelowMacSnapWidth:](self, "_updateSearchControllerForConversationListBelowMacSnapWidth:", -[CKConversationListCollectionViewController isBelowMacSnapToMinWidth](self, "isBelowMacSnapToMinWidth"));

}

- (BOOL)isBelowMacSnapToMinWidth
{
  return self->_isBelowMacSnapToMinWidth;
}

- (void)_updateSearchControllerForConversationListBelowMacSnapWidth:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v3 = a3;
  if (CKIsRunningInMacCatalyst())
  {
    -[CKConversationListCollectionViewController searchController](self, "searchController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "searchBar");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setHidden:", -[CKConversationListCollectionViewController isBelowMacSnapToMinWidth](self, "isBelowMacSnapToMinWidth"));

    if (v3)
    {
      -[CKConversationListCollectionViewController navigationItem](self, "navigationItem");
      v10 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setSearchController:", 0);
LABEL_4:

    }
  }
  else if (!self->_isInitialAppearance)
  {
    -[CKConversationListCollectionViewController navigationItem](self, "navigationItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "searchController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
      -[CKConversationListCollectionViewController navigationItem](self, "navigationItem");
      v10 = (id)objc_claimAutoreleasedReturnValue();
      -[CKConversationListCollectionViewController searchController](self, "searchController");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setSearchController:", v9);

      goto LABEL_4;
    }
  }
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (id)_newCollectionViewWithFrame:(CGRect)a3 collectionViewLayout:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v8;
  CKConversationListCollectionView *v9;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = a4;
  v9 = -[CKConversationListCollectionView initWithFrame:collectionViewLayout:]([CKConversationListCollectionView alloc], "initWithFrame:collectionViewLayout:", v8, x, y, width, height);

  return v9;
}

- (void)_updateInsets
{
  char v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  char v12;
  double v13;
  id WeakRetained;
  void *v15;
  double v16;
  void *v17;
  int v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  int v24;
  double v25;
  void *v26;
  double v27;
  double v28;
  void *v29;
  double v30;
  double v31;
  void *v32;
  double v33;
  double v34;
  void *v35;
  double v36;
  double v37;
  void *v38;
  void *v39;
  id v40;

  if (!self->_willRotate)
  {
    objc_msgSend(MEMORY[0x1E0CEA828], "sharedInstance");
    v40 = (id)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v40, "isUndocked");
    -[CKConversationListCollectionViewController collectionView](self, "collectionView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "contentInset");
    v6 = v5;
    v8 = v7;
    v10 = v9;

    -[CKConversationListCollectionViewController delegate](self, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isCollapsed");

    v13 = 0.0;
    if ((v12 & 1) == 0 && (v3 & 1) == 0)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(WeakRetained, "chatController");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v15, "accessoryViewHeight");
      v13 = -v16;

    }
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "conversationListShouldManuallyApplyBottomSafeAreaInsetForIsRecentlyDeletedModal:", -[CKConversationListCollectionViewController isRecentlyDeletedModal](self, "isRecentlyDeletedModal"));

    if (v18)
    {
      -[CKConversationListCollectionViewController view](self, "view");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "safeAreaInsets");
      v13 = v20;

    }
    -[CKConversationListCollectionViewController bannerHeight](self, "bannerHeight");
    v22 = v21;
    -[CKConversationListCollectionViewController syncStatusView](self, "syncStatusView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "isVisibleInViewHierarchy");

    v25 = v13;
    if (v24)
    {
      -[CKConversationListCollectionViewController view](self, "view");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "bounds");
      v28 = v27;
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "syncBarFooterHeight");
      v31 = v30;

      -[CKConversationListCollectionViewController syncStatusView](self, "syncStatusView");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "systemLayoutSizeFittingSize:", v28, v31);
      v34 = v33;

      -[CKConversationListCollectionViewController syncStatusView](self, "syncStatusView");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "safeAreaInsets");
      v37 = v36;

      v25 = v13 + v34 - v37;
    }
    -[CKConversationListCollectionViewController collectionView](self, "collectionView");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "setContentInset:", v22, v8, v25, v10);

    -[CKConversationListCollectionViewController collectionView](self, "collectionView");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "setScrollIndicatorInsets:", v6, v8, v13, v10);

  }
}

- (CKCloudSyncStatusView)syncStatusView
{
  return self->_syncStatusView;
}

- (double)bannerHeight
{
  return self->_bannerHeight;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  _BOOL8 v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  objc_super v11;
  uint8_t buf[4];
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v11.receiver = self;
  v11.super_class = (Class)CKConversationListCollectionViewController;
  -[CKConversationListCollectionViewController viewDidLoad](&v11, sel_viewDidLoad);
  if (!CKIsRunningInMacCatalyst())
  {
    -[CKConversationListCollectionViewController setClearsSelectionOnViewWillAppear:](self, "setClearsSelectionOnViewWillAppear:", 0);
    -[CKConversationListCollectionViewController collectionView](self, "collectionView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setAllowsSelectionDuringEditing:", 1);

    -[CKConversationListCollectionViewController collectionView](self, "collectionView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setAllowsMultipleSelectionDuringEditing:", 1);

  }
  v5 = CKIsRunningInMacCatalyst() != 0;
  -[CKConversationListCollectionViewController collectionView](self, "collectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAllowsMultipleSelection:", v5);

  -[CKConversationListCollectionViewController setDefinesPresentationContext:](self, "setDefinesPresentationContext:", 1);
  objc_msgSend(MEMORY[0x1E0D357B8], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setProgressPollingInterval:", 60.0);

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(MEMORY[0x1E0D357B8], "sharedInstance");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "progressPollingInterval");
      *(_DWORD *)buf = 134217984;
      v13 = v10;
      _os_log_impl(&dword_18DFCD000, v8, OS_LOG_TYPE_INFO, "set progress polling interval to %f", buf, 0xCu);

    }
  }
  -[CKConversationListCollectionViewController registerForCloudKitEventsWithDelayedRegistration:](self, "registerForCloudKitEventsWithDelayedRegistration:", 1);
  -[CKConversationListCollectionViewController _configureCloudTipViewModelIfNeeded](self, "_configureCloudTipViewModelIfNeeded");
  -[CKConversationListCollectionViewController updateBackButton](self, "updateBackButton");
}

- (void)updateBackButton
{
  void *v3;
  uint64_t v4;
  void *v5;
  CKBackBarButtonItem *v6;

  if (IMEnableTranscriptChromelessNavBar())
  {
    -[CKConversationListCollectionViewController conversationList](self, "conversationList");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "unreadCountForFilterMode:", 1);

    v6 = -[CKBackBarButtonItem initWithUnreadCount:]([CKBackBarButtonItem alloc], "initWithUnreadCount:", v4);
    -[CKConversationListCollectionViewController navigationItem](self, "navigationItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setBackBarButtonItem:", v6);

  }
}

- (void)registerForCloudKitEventsWithDelayedRegistration:(BOOL)a3
{
  _BOOL4 v3;
  double v5;
  NSObject *v6;
  dispatch_time_t v7;
  _QWORD block[4];
  id v9;
  _BYTE buf[24];
  uint64_t v11;

  v3 = a3;
  v11 = *MEMORY[0x1E0C80C00];
  if (registerForCloudKitEventsWithDelayedRegistration__onceToken != -1)
    dispatch_once(&registerForCloudKitEventsWithDelayedRegistration__onceToken, &__block_literal_global_640_1);
  if (v3)
    v5 = *(double *)&registerForCloudKitEventsWithDelayedRegistration__sRegistrationDelay;
  else
    v5 = 1.0;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      *(double *)&buf[4] = v5;
      _os_log_impl(&dword_18DFCD000, v6, OS_LOG_TYPE_INFO, "registering for cloudkit events with delay: %f", buf, 0xCu);
    }

  }
  *(_QWORD *)buf = 0;
  objc_initWeak((id *)buf, self);
  v7 = dispatch_time(0, (uint64_t)(v5 * 1000000000.0));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __95__CKConversationListCollectionViewController_registerForCloudKitEventsWithDelayedRegistration___block_invoke_641;
  block[3] = &unk_1E274B548;
  objc_copyWeak(&v9, (id *)buf);
  dispatch_after(v7, MEMORY[0x1E0C80D38], block);
  objc_destroyWeak(&v9);
  objc_destroyWeak((id *)buf);
}

- (void)_configureCloudTipViewModelIfNeeded
{
  void *v3;
  int v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  _QWORD v8[4];
  id v9;
  uint8_t buf[8];

  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isMessagesInICloudNewUIEnabled");

  if (v4)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18DFCD000, v5, OS_LOG_TYPE_INFO, "Configuring the CKCloudTipViewModel handler.", buf, 2u);
      }

    }
    *(_QWORD *)buf = 0;
    objc_initWeak((id *)buf, self);
    +[CKCloudTipViewModel sharedInstance](_TtC7ChatKit19CKCloudTipViewModel, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __81__CKConversationListCollectionViewController__configureCloudTipViewModelIfNeeded__block_invoke;
    v8[3] = &unk_1E2757E08;
    objc_copyWeak(&v9, (id *)buf);
    objc_msgSend(v6, "setOnCloudTipChanged:", v8);

    dispatch_get_global_queue(0, 0);
    v7 = objc_claimAutoreleasedReturnValue();
    dispatch_async(v7, &__block_literal_global_706_0);

    objc_destroyWeak(&v9);
    objc_destroyWeak((id *)buf);
  }
}

- (CKConversationListCollectionViewController)init
{
  CKConversationListCollectionViewLayout *v3;
  void *v4;
  CKConversationListCollectionViewController *v5;
  CKConversationListCollectionViewController *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  CoreTelephonyClient *v11;
  CoreTelephonyClient *coreTelephonyClient;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  int v17;
  void *v18;
  uint64_t v19;
  CNContactStore *contactStore;
  objc_super v22;

  v3 = objc_alloc_init(CKConversationListCollectionViewLayout);
  -[CKConversationListCollectionViewLayout conversationListLayout](v3, "conversationListLayout");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v22.receiver = self;
  v22.super_class = (Class)CKConversationListCollectionViewController;
  v5 = -[CKConversationListCollectionViewController initWithCollectionViewLayout:](&v22, sel_initWithCollectionViewLayout_, v4);
  v6 = v5;
  if (v5)
  {
    v5->_isInitialAppearance = 1;
    -[CKConversationListCollectionViewController standardCellLayout](v5, "standardCellLayout");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKConversationListCollectionViewController setCellLayout:](v6, "setCellLayout:", v7);

    -[CKConversationListCollectionViewLayout setConversationListController:](v3, "setConversationListController:", v6);
    -[CKConversationListCollectionViewController setConversationLayout:](v6, "setConversationLayout:", v3);
    -[CKConversationListCollectionViewController setNextPinnedConversationListUpdateShouldTriggerUnanimatedSnapshotUpdate:](v6, "setNextPinnedConversationListUpdateShouldTriggerUnanimatedSnapshotUpdate:", 1);
    -[CKConversationListCollectionViewController setInstallsStandardGestureForInteractiveMovement:](v6, "setInstallsStandardGestureForInteractiveMovement:", 0);
    -[CKConversationListCollectionViewController setFilterMode:](v6, "setFilterMode:", 0);
    +[CKConversationListCollectionViewController updaterLogHandle](CKConversationListCollectionViewController, "updaterLogHandle");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D399C8]), "initWithLogHandle:delegate:", v8, v6);
    -[CKConversationListCollectionViewController setUpdater:](v6, "setUpdater:", v9);

    -[CKConversationListCollectionViewController updater](v6, "updater");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "beginHoldingUpdatesForReason:", CFSTR("viewVisiblity"));

    -[CKConversationListCollectionViewController _updateConversationListsAndSortIfEnabled](v6, "_updateConversationListsAndSortIfEnabled");
    v11 = (CoreTelephonyClient *)objc_alloc_init(MEMORY[0x1E0CA6E38]);
    coreTelephonyClient = v6->_coreTelephonyClient;
    v6->_coreTelephonyClient = v11;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObserver:selector:name:object:", v6, sel__chatItemsDidChange_, *MEMORY[0x1E0D35328], 0);
    objc_msgSend(v13, "addObserver:selector:name:object:", v6, sel__chatWatermarkDidChange_, *MEMORY[0x1E0D354F0], 0);
    objc_msgSend(v13, "addObserver:selector:name:object:", v6, sel__conversationListDidFinishLoadingConversations_, CFSTR("CKConversationListFinishedLoadingNotification"), 0);
    objc_msgSend(v13, "addObserver:selector:name:object:", v6, sel__contactStoreDidFinishLoadingNotification_, *MEMORY[0x1E0D37C38], 0);
    -[CKConversationListCollectionViewController conversationList](v6, "conversationList");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObserver:selector:name:object:", v6, sel__conversationListDidChange_, CFSTR("CKConversationListChangedNotification"), v14);

    objc_msgSend(v13, "addObserver:selector:name:object:", v6, sel__chatUnreadCountDidChange_, *MEMORY[0x1E0D354E0], 0);
    objc_msgSend(v13, "addObserver:selector:name:object:", v6, sel__chatUnreadCountDidChange_, *MEMORY[0x1E0D354A0], 0);
    objc_msgSend(v13, "addObserver:selector:name:object:", v6, sel__chatParticipantsChangedNotification_, *MEMORY[0x1E0D35418], 0);
    objc_msgSend(v13, "addObserver:selector:name:object:", v6, sel__contentSizeCategoryDidChange_, *MEMORY[0x1E0CEB3F0], 0);
    objc_msgSend(v13, "addObserver:selector:name:object:", v6, sel__increaseContrastDidChange_, *MEMORY[0x1E0CEAFF0], 0);
    objc_msgSend(v13, "addObserver:selector:name:object:", v6, sel__adaptiveImageGlyphWasGeneratedNotification_, CFSTR("CKAdaptiveImageGlyphGeneratedNotification"), 0);
    objc_msgSend(v13, "addObserver:selector:name:object:", v6, sel__conversationIsFilteredChangedNotification_, *MEMORY[0x1E0D35320], 0);
    objc_msgSend(v13, "addObserver:selector:name:object:", v6, sel__conversationDisplayNameChangedNotification_, *MEMORY[0x1E0D352F0], 0);
    objc_msgSend(v13, "addObserver:selector:name:object:", v6, sel__conversationMuteDidChangeNotification_, *MEMORY[0x1E0D38AF8], 0);
    objc_msgSend(v13, "addObserver:selector:name:object:", v6, sel__conversationFilteringStateChangedNotification_, CKMessageFilteringChangedNotification[0], 0);
    objc_msgSend(v13, "addObserver:selector:name:object:", v6, sel__conversationSpamFilteringStateChangedNotification_, CKMessageSpamFilteringChangedNotification, 0);
    objc_msgSend(v13, "addObserver:selector:name:object:", v6, sel__conversationContactPhotosEnabledChangedNotification_, CKConversationListContactPhotosEnabledNotification, 0);
    objc_msgSend(v13, "addObserver:selector:name:object:", v6, sel__didReceiveSummaries_, CFSTR("CKConversationListDidReceiveSummaries"), 0);
    if (IMIsOscarEnabled())
      objc_msgSend(v13, "addObserver:selector:name:object:", v6, sel_updateConversationList, CFSTR("CKConversationListDidRecoverJunkConversationsNotification"), 0);
    objc_msgSend(v13, "addObserver:selector:name:object:", v6, sel__multiWayCallStateChanged_, *MEMORY[0x1E0D35410], 0);
    objc_msgSend(v13, "addObserver:selector:name:object:", v6, sel__reloadVisibleConversationList_, CFSTR("CKConversationListUpdateVisibleConversationsNotification"), 0);
    objc_msgSend(v13, "addObserver:selector:name:object:", v6, sel__downtimeStateChanged_, *MEMORY[0x1E0D35548], 0);
    objc_msgSend(v13, "addObserver:selector:name:object:", v6, sel__chatAllowedByScreenTimeChanged_, *MEMORY[0x1E0D352D8], 0);
    objc_msgSend(v13, "addObserver:selector:name:object:", v6, sel_updateConversationNamesForNicknames_, *MEMORY[0x1E0D355F0], 0);
    objc_msgSend(v13, "addObserver:selector:name:object:", v6, sel_updateConversationNamesForNicknames_, *MEMORY[0x1E0D355F8], 0);
    objc_msgSend(v13, "addObserver:selector:name:object:", v6, sel__conversationListPinnedConversationsDidChange_, CFSTR("CKConversationListPinnedConversationsChangedNotification"), 0);
    objc_msgSend(v13, "addObserver:selector:name:object:", v6, sel__refreshConversationListCellForGroupPhotoUpdate_, CFSTR("CKConversationListAvatarUpdateNotification"), 0);
    objc_msgSend(v13, "addObserver:selector:name:object:", v6, sel__handleAccountRegistrationChange_, *MEMORY[0x1E0D35710], 0);
    v15 = *MEMORY[0x1E0D35298];
    objc_msgSend(v13, "addObserver:selector:name:object:", v6, sel__handleAccountRegistrationChange_, *MEMORY[0x1E0D35298], 0);
    objc_msgSend(v13, "addObserver:selector:name:object:", v6, sel__handleAccountRegistrationChange_, *MEMORY[0x1E0D35260], 0);
    objc_msgSend(v13, "addObserver:selector:name:object:", v6, sel__handingPendingConversationDidChange_, CFSTR("CKConversationListPendingConversationChangedNotification"), 0);
    objc_msgSend(v13, "addObserver:selector:name:object:", v6, sel__reloadRecoverableMetadataForNotification_, *MEMORY[0x1E0D35478], 0);
    objc_msgSend(v13, "addObserver:selector:name:object:", v6, sel__handleDidRecoverMessagesInChatsNotification_, *MEMORY[0x1E0D35488], 0);
    objc_msgSend(v13, "addObserver:selector:name:object:", v6, sel__updateAccountRegistrationFailureNotification, v15, 0);
    objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "isCarrierPigeonEnabled");

    if (v17)
    {
      objc_msgSend(v13, "addObserver:selector:name:object:", v6, sel__updateRefreshControlVisibility, *MEMORY[0x1E0D35500], 0);
      objc_msgSend(v13, "addObserver:selector:name:object:", v6, sel__satelliteMonitorStarted, *MEMORY[0x1E0D354F8], 0);
      objc_msgSend(v13, "addObserver:selector:name:object:", v6, sel__pendingSatelliteCountChanged, *MEMORY[0x1E0D35420], 0);
      objc_msgSend(v13, "addObserver:selector:name:object:", v6, sel__isDownloadingPendingSatelliteMessagesChanged, *MEMORY[0x1E0D35318], 0);
    }
    -[CKConversationListCollectionViewController registerForFocusStateChanges](v6, "registerForFocusStateChanges");
    -[CKConversationListCollectionViewController setUseLayoutToLayoutNavigationTransitions:](v6, "setUseLayoutToLayoutNavigationTransitions:", 0);
    objc_msgSend(MEMORY[0x1E0D397A8], "sharedInstance");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "getContactStore");
    v19 = objc_claimAutoreleasedReturnValue();
    contactStore = v6->_contactStore;
    v6->_contactStore = (CNContactStore *)v19;

  }
  return v6;
}

- (void)registerForFocusStateChanges
{
  id v3;

  objc_msgSend(MEMORY[0x1E0D39850], "sharedManager");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addDelegate:", self);
  objc_msgSend(v3, "updateFocusStateForCurrentFocusFilterActionAsync");
  -[CKConversationListCollectionViewController updateFocusFilterBannerWithAnimation:](self, "updateFocusFilterBannerWithAnimation:", 0);

}

- (void)setUpdater:(id)a3
{
  objc_storeStrong((id *)&self->_updater, a3);
}

- (void)setNextPinnedConversationListUpdateShouldTriggerUnanimatedSnapshotUpdate:(BOOL)a3
{
  self->_nextPinnedConversationListUpdateShouldTriggerUnanimatedSnapshotUpdate = a3;
}

- (void)setFilterMode:(unint64_t)a3
{
  unint64_t *p_filterMode;
  unint64_t filterMode;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  NSObject *v11;
  id v12;
  _BOOL4 v13;
  uint64_t v14;
  void *v15;
  const __CFString *v16;
  int v17;
  id v18;
  __int16 v19;
  const __CFString *v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  p_filterMode = &self->_filterMode;
  filterMode = self->_filterMode;
  self->_filterMode = -[CKConversationListCollectionViewController _sanitizedFilterMode:](self, "_sanitizedFilterMode:");
  -[CKConversationListCollectionViewController delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "updatedFilterMode:previousFilterMode:", *p_filterMode, filterMode);

  -[CKConversationListCollectionViewController _configureForFilterMode:](self, "_configureForFilterMode:", *p_filterMode);
  if (filterMode == 7)
    -[CKConversationListCollectionViewController setEditingMode:](self, "setEditingMode:", 0);
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isCarrierPigeonEnabled");

  if (v9 && filterMode != a3)
    -[CKConversationListCollectionViewController _updateRefreshControlVisibility](self, "_updateRefreshControlVisibility");
  -[CKConversationListCollectionViewController _getTitleForCurrentFilterMode](self, "_getTitleForCurrentFilterMode");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKConversationListCollectionViewController setTitle:](self, "setTitle:", v10);
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      CKConversationListFilterModeStringValue(-[CKConversationListCollectionViewController filterMode](self, "filterMode"));
      v12 = (id)objc_claimAutoreleasedReturnValue();
      v13 = -[CKConversationListCollectionViewController _messageUnknownFilteringEnabled](self, "_messageUnknownFilteringEnabled");
      CKConversationListFilterModeStringValue(self->_filterMode);
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = (void *)v14;
      v16 = CFSTR("NO");
      v17 = 138412802;
      v18 = v12;
      v19 = 2112;
      if (v13)
        v16 = CFSTR("YES");
      v20 = v16;
      v21 = 2112;
      v22 = v14;
      _os_log_impl(&dword_18DFCD000, v11, OS_LOG_TYPE_INFO, "ConversationListController: setFilterMode called with filterMode: %@ when messageFilteringEnabled: %@. FilterMode is set to: %@", (uint8_t *)&v17, 0x20u);

    }
  }

}

- (void)setConversationLayout:(id)a3
{
  objc_storeStrong((id *)&self->_conversationLayout, a3);
}

- (unint64_t)_sanitizedFilterModeForFilterUnknownDisabled:(unint64_t)a3
{
  if (a3 == 9)
  {
    if (-[CKConversationListCollectionViewController isOscarModal](self, "isOscarModal")
      || CKIsRunningInMacCatalyst())
    {
      return 9;
    }
  }
  else if (a3 == 7
         && (-[CKConversationListCollectionViewController isRecentlyDeletedModal](self, "isRecentlyDeletedModal")
          || CKIsRunningInMacCatalyst()))
  {
    return 7;
  }
  return 0;
}

- (unint64_t)_sanitizedFilterMode:(unint64_t)a3
{
  if (-[CKConversationListCollectionViewController _messageUnknownFilteringEnabled](self, "_messageUnknownFilteringEnabled"))
  {
    return -[CKConversationListCollectionViewController _sanitizedFilterModeForFilterUnknownEnabled:](self, "_sanitizedFilterModeForFilterUnknownEnabled:", a3);
  }
  else
  {
    return -[CKConversationListCollectionViewController _sanitizedFilterModeForFilterUnknownDisabled:](self, "_sanitizedFilterModeForFilterUnknownDisabled:", a3);
  }
}

- (BOOL)_messageUnknownFilteringEnabled
{
  return CKMessageUnknownFilteringEnabled() != 0;
}

- (id)_getTitleForCurrentFilterMode
{
  unint64_t filterMode;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  unint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  _BOOL4 v19;
  void *v20;
  _BOOL4 v21;
  void *v22;
  _BOOL4 v23;
  void *v24;
  _BOOL4 v25;
  void *v26;
  NSObject *v27;
  unint64_t v28;
  _BOOL4 v29;
  _BOOL4 v30;
  void *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint8_t buf[4];
  unint64_t v37;
  __int16 v38;
  _BOOL4 v39;
  __int16 v40;
  _BOOL4 v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  if (-[CKConversationListCollectionViewController isShowingPinningOnboarding](self, "isShowingPinningOnboarding"))
    return &stru_1E276D870;
  filterMode = self->_filterMode;
  if (filterMode == 9)
  {
    CKFrameworkBundle();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("OSCAR"), &stru_1E276D870, CFSTR("ChatKit"));
    v6 = objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  if (filterMode == 7)
  {
    CKFrameworkBundle();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("RECENTLY_DELETED"), &stru_1E276D870, CFSTR("ChatKit"));
    v6 = objc_claimAutoreleasedReturnValue();
LABEL_7:
    v7 = (void *)v6;

    return v7;
  }
  if (!CKIsRunningInMacCatalyst()
    && !-[CKConversationListCollectionViewController _shouldShowInboxView](self, "_shouldShowInboxView"))
  {
    CKFrameworkBundle();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("MESSAGES"), &stru_1E276D870, CFSTR("ChatKit"));
    v6 = objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  if (-[CKConversationListCollectionViewController filterMode](self, "filterMode") >= 0x10)
  {
    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    objc_msgSend(MEMORY[0x1E0D399F8], "fetchSMSFilterExtensionParams", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v32, v42, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v33;
      while (2)
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v33 != v10)
            objc_enumerationMutation(v8);
          v12 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
          v13 = -[CKConversationListCollectionViewController filterMode](self, "filterMode");
          if (v13 == objc_msgSend(v12, "filterMode"))
          {
            IMSharedUtilitiesFrameworkBundle();
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "folderName");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "localizedStringForKey:value:table:", v17, &stru_1E276D870, CFSTR("IMSharedUtilities"));
            v18 = (void *)objc_claimAutoreleasedReturnValue();

            return v18;
          }
        }
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v32, v42, 16);
        if (v9)
          continue;
        break;
      }
    }

  }
  switch(-[CKConversationListCollectionViewController filterMode](self, "filterMode"))
  {
    case 1uLL:
      goto LABEL_21;
    case 2uLL:
      v19 = CKIsRunningInMacCatalyst() == 0;
      CKFrameworkBundle();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v20;
      if (v19)
        objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("KNOWN"), &stru_1E276D870, CFSTR("ChatKit"));
      else
        objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("KNOWN_SENDERS"), &stru_1E276D870, CFSTR("ChatKit"));
      goto LABEL_35;
    case 3uLL:
      v21 = CKIsRunningInMacCatalyst() == 0;
      CKFrameworkBundle();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v22;
      if (v21)
        objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("UNKNOWN"), &stru_1E276D870, CFSTR("ChatKit"));
      else
        objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("UNKNOWN_SENDERS"), &stru_1E276D870, CFSTR("ChatKit"));
      goto LABEL_35;
    case 4uLL:
      CKFrameworkBundle();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("TRANSACTIONAL_SENDER_TITLE"), &stru_1E276D870, CFSTR("ChatKit"));
      v15 = objc_claimAutoreleasedReturnValue();
      break;
    case 5uLL:
      CKFrameworkBundle();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("PROMOTIONAL_SENDER_TITLE"), &stru_1E276D870, CFSTR("ChatKit"));
      v15 = objc_claimAutoreleasedReturnValue();
      break;
    case 6uLL:
      v23 = CKIsBlackholeEnabled();
      CKFrameworkBundle();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v24;
      if (v23)
        objc_msgSend(v24, "localizedStringForKey:value:table:", CFSTR("JUNK_BLACKHOLE_SENDER_TITLE"), &stru_1E276D870, CFSTR("ChatKit"));
      else
        objc_msgSend(v24, "localizedStringForKey:value:table:", CFSTR("JUNK_SENDER_TITLE"), &stru_1E276D870, CFSTR("ChatKit"));
      goto LABEL_35;
    case 7uLL:
      CKFrameworkBundle();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("RECENTLY_DELETED"), &stru_1E276D870, CFSTR("ChatKit"));
      v15 = objc_claimAutoreleasedReturnValue();
      break;
    case 8uLL:
      v25 = CKIsRunningInMacCatalyst() == 0;
      CKFrameworkBundle();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v26;
      if (v25)
        objc_msgSend(v26, "localizedStringForKey:value:table:", CFSTR("UNREAD"), &stru_1E276D870, CFSTR("ChatKit"));
      else
        objc_msgSend(v26, "localizedStringForKey:value:table:", CFSTR("UNREAD_MESSAGES"), &stru_1E276D870, CFSTR("ChatKit"));
LABEL_35:
      v15 = objc_claimAutoreleasedReturnValue();
      break;
    case 9uLL:
      CKFrameworkBundle();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("OSCAR"), &stru_1E276D870, CFSTR("ChatKit"));
      v15 = objc_claimAutoreleasedReturnValue();
      break;
    default:
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
        {
          v28 = -[CKConversationListCollectionViewController filterMode](self, "filterMode");
          v29 = -[CKConversationListCollectionViewController _messageUnknownFilteringEnabled](self, "_messageUnknownFilteringEnabled");
          v30 = -[CKConversationListCollectionViewController _shouldShowInboxView](self, "_shouldShowInboxView");
          *(_DWORD *)buf = 134218496;
          v37 = v28;
          v38 = 1024;
          v39 = v29;
          v40 = 1024;
          v41 = v30;
          _os_log_impl(&dword_18DFCD000, v27, OS_LOG_TYPE_INFO, "unknown filterMode %ld with filtering state %d and inbox view state %d", buf, 0x18u);
        }

      }
LABEL_21:
      CKFrameworkBundle();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("MESSAGES"), &stru_1E276D870, CFSTR("ChatKit"));
      v15 = objc_claimAutoreleasedReturnValue();
      break;
  }
  v31 = (void *)v15;

  return v31;
}

- (void)_endHoldingUpdatesOnViewWillAppear
{
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  -[CKConversationListCollectionViewController updater](self, "updater");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setNeedsDeferredUpdateWithReason:", CFSTR("viewWillAppear"));

  -[CKConversationListCollectionViewController updater](self, "updater");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "endAllHoldsOnUpdatesForReason:updateTriggeredIfNotHeldShouldBeDeferred:", CFSTR("viewVisiblity"), 0);

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      -[CKConversationListCollectionViewController updater](self, "updater");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 138412290;
      v8 = v6;
      _os_log_impl(&dword_18DFCD000, v5, OS_LOG_TYPE_INFO, "Conversation list end holding updates, _updater is: %@", (uint8_t *)&v7, 0xCu);

    }
  }
}

- (IMReasonTrackingUpdater)updater
{
  return self->_updater;
}

- (void)_configureForFilterMode:(unint64_t)a3
{
  void *v4;
  void *v5;
  _BOOL4 v6;
  id v7;

  if (a3 == 9)
  {
    -[CKConversationListCollectionViewController configureForOscarFilter](self, "configureForOscarFilter");
  }
  else if (a3 == 7)
  {
    -[CKConversationListCollectionViewController configureForRecentlyDeletedFilter](self, "configureForRecentlyDeletedFilter");
  }
  else
  {
    if (!self->_isInitialAppearance)
    {
      -[CKConversationListCollectionViewController searchController](self, "searchController");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKConversationListCollectionViewController navigationItem](self, "navigationItem");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setSearchController:", v4);

      -[CKConversationListCollectionViewController configureSearchBarEnabled:](self, "configureSearchBarEnabled:", 1);
    }
    v6 = -[CKConversationListCollectionViewController _shouldShowToolbar](self, "_shouldShowToolbar");
    -[CKConversationListCollectionViewController navigationController](self, "navigationController");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setToolbarHidden:animated:", !v6, 0);

  }
}

- (BOOL)_shouldShowToolbar
{
  unint64_t v3;

  if (CKIsRunningInMacCatalyst())
  {
    LOBYTE(v3) = 0;
  }
  else
  {
    v3 = -[CKConversationListCollectionViewController editingMode](self, "editingMode");
    if (v3 != 1)
      LOBYTE(v3) = -[CKConversationListCollectionViewController filterMode](self, "filterMode") == 9;
  }
  return v3;
}

+ (id)updaterLogHandle
{
  if (updaterLogHandle_onceToken != -1)
    dispatch_once(&updaterLogHandle_onceToken, &__block_literal_global_189);
  return (id)updaterLogHandle_sLogHandle;
}

void __95__CKConversationListCollectionViewController_conversationListCollectionViewControllerLogHandle__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Messages", "ConversationListCollectionViewController");
  v1 = (void *)conversationListCollectionViewControllerLogHandle_sLogHandle;
  conversationListCollectionViewControllerLogHandle_sLogHandle = (uint64_t)v0;

}

void __62__CKConversationListCollectionViewController_updaterLogHandle__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Messages", "ConversationListViewControllerUpdater");
  v1 = (void *)updaterLogHandle_sLogHandle;
  updaterLogHandle_sLogHandle = (uint64_t)v0;

}

- (void)viewLayoutMarginsDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CKConversationListCollectionViewController;
  -[CKConversationListCollectionViewController viewLayoutMarginsDidChange](&v3, sel_viewLayoutMarginsDidChange);
  -[CKConversationListCollectionViewController _updateNavbarLayoutIfNeeded](self, "_updateNavbarLayoutIfNeeded");
}

- (void)viewDidAppearDeferredSetup
{
  int v3;
  uint64_t v4;
  dispatch_time_t v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  _QWORD v10[4];
  id v11;
  _QWORD block[5];

  self->_isInitialAppearance = 0;
  -[CKConversationListCollectionViewController setIsAppearing:](self, "setIsAppearing:", 0);
  v3 = CKIsRunningInMessages();
  v4 = MEMORY[0x1E0C809B0];
  if (v3)
  {
    v5 = dispatch_time(0, 500000000);
    block[0] = v4;
    block[1] = 3221225472;
    block[2] = __72__CKConversationListCollectionViewController_viewDidAppearDeferredSetup__block_invoke;
    block[3] = &unk_1E274A208;
    block[4] = self;
    dispatch_after(v5, MEMORY[0x1E0C80D38], block);
  }
  objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!__CurrentTestName)
    goto LABEL_6;
  objc_msgSend(v6, "_launchTestName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v7, "isRunningTest:", v8))
  {
LABEL_7:

    goto LABEL_8;
  }
  v9 = objc_msgSend(v7, "shouldRecordExtendedLaunchTime");

  if (v9)
  {
LABEL_6:
    v10[0] = v4;
    v10[1] = 3221225472;
    v10[2] = __72__CKConversationListCollectionViewController_viewDidAppearDeferredSetup__block_invoke_2;
    v10[3] = &unk_1E274A208;
    v11 = v7;
    dispatch_async(MEMORY[0x1E0C80D38], v10);
    v8 = v11;
    goto LABEL_7;
  }
LABEL_8:

}

- (void)setEditingMode:(unint64_t)a3 animated:(BOOL)a4 shouldUpdate:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL8 v6;
  unint64_t v8;
  unint64_t editingMode;
  unint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  uint8_t v24[8];
  _QWORD v25[6];
  BOOL v26;

  v5 = a5;
  v6 = a4;
  v8 = -[CKConversationListCollectionViewController _preferredEditingMode:](self, "_preferredEditingMode:", a3);
  editingMode = self->_editingMode;
  if (editingMode != v8)
  {
    v10 = v8;
    if (!v8
      && -[CKConversationListCollectionViewController isShowingPinningOnboarding](self, "isShowingPinningOnboarding")
      && !-[CKConversationListCollectionViewController isCurrentlyAnimatingPinningOnboardingSuggestions](self, "isCurrentlyAnimatingPinningOnboardingSuggestions"))
    {
      -[CKConversationListCollectionViewController setIsShowingPinningOnboarding:](self, "setIsShowingPinningOnboarding:", 0);
    }
    self->_editingMode = v10;
    -[CKConversationListCollectionViewController collectionView](self, "collectionView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "visibleCells");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v12, "_copyForEnumerating");

    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __83__CKConversationListCollectionViewController_setEditingMode_animated_shouldUpdate___block_invoke;
    v25[3] = &unk_1E2757C60;
    v25[4] = self;
    v25[5] = v10;
    v26 = v6;
    objc_msgSend(v13, "enumerateObjectsUsingBlock:", v25);
    if (v5)
      -[CKConversationListCollectionViewController updateSnapshotAnimatingDifferences:](self, "updateSnapshotAnimatingDifferences:", v6);
    -[CKConversationListCollectionViewController collectionView](self, "collectionView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setAllowsSelectionDuringEditing:", v10 != 2);

    -[CKConversationListCollectionViewController collectionView](self, "collectionView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setAllowsMultipleSelectionDuringEditing:", v10 != 2);

    if (v10 == 2)
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v24 = 0;
          _os_log_impl(&dword_18DFCD000, v21, OS_LOG_TYPE_INFO, "Editing mode changed to CKConversationListControllerEditingModePin", v24, 2u);
        }

      }
      -[CKConversationListCollectionViewController _freezeConversations](self, "_freezeConversations");
      -[CKConversationListCollectionViewController _getTitleForCurrentFilterMode](self, "_getTitleForCurrentFilterMode");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKConversationListCollectionViewController setTitle:](self, "setTitle:", v22);

      -[CKConversationListCollectionViewController _updateNavbarLayoutIfNeeded](self, "_updateNavbarLayoutIfNeeded");
    }
    else
    {
      if (v10 != 1)
      {
        if (v10)
        {
LABEL_33:
          -[CKConversationListCollectionViewController delegate](self, "delegate");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "conversationListWillBeginEditing:", -[CKConversationListCollectionViewController editingMode](self, "editingMode") != 0);

          return;
        }
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)v24 = 0;
            _os_log_impl(&dword_18DFCD000, v16, OS_LOG_TYPE_INFO, "Editing mode changed to CKConversationListControllerEditingModeNone", v24, 2u);
          }

        }
        if (!CKIsRunningInMacCatalyst())
        {
          -[CKConversationListCollectionViewController collectionView](self, "collectionView");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "setAllowsMultipleSelection:", 0);

        }
        if (editingMode == 2)
        {
          -[CKConversationListCollectionViewController _unfreezeConversations](self, "_unfreezeConversations");
          if (v5)
            -[CKConversationListCollectionViewController updateSnapshotAnimatingDifferences:](self, "updateSnapshotAnimatingDifferences:", 1);
          -[CKConversationListCollectionViewController _getTitleForCurrentFilterMode](self, "_getTitleForCurrentFilterMode");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          -[CKConversationListCollectionViewController setTitle:](self, "setTitle:", v18);

          -[CKConversationListCollectionViewController _updateNavbarLayoutIfNeeded](self, "_updateNavbarLayoutIfNeeded");
        }
        v19 = 0;
LABEL_32:
        -[CKConversationListCollectionViewController setEditing:animated:](self, "setEditing:animated:", v19, v6);
        goto LABEL_33;
      }
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v24 = 0;
          _os_log_impl(&dword_18DFCD000, v20, OS_LOG_TYPE_INFO, "Editing mode changed to CKConversationListControllerEditingModeManage", v24, 2u);
        }

      }
    }
    v19 = 1;
    goto LABEL_32;
  }
}

- (unint64_t)_preferredEditingMode:(unint64_t)a3
{
  if (-[CKConversationListCollectionViewController filterMode](self, "filterMode") == 7)
    return 1;
  else
    return a3;
}

- (void)_updateLargeTitleDisplayModeWithAnimation:(BOOL)a3
{
  _BOOL4 v3;
  _BOOL4 v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  char v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  char v41;
  void *v43;
  void *v44;
  float v45;
  void *v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  uint64_t v55;
  _QWORD v56[4];
  id v57;
  _QWORD v58[5];
  id v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;

  v3 = a3;
  v5 = -[CKConversationListCollectionViewController _shouldAllowLargeTitles](self, "_shouldAllowLargeTitles");
  -[CKConversationListCollectionViewController navigationItem](self, "navigationItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "largeTitleDisplayMode");

  if (v5)
    v8 = 0;
  else
    v8 = 2;
  if (v7 != v8)
  {
    -[CKConversationListCollectionViewController collectionView](self, "collectionView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "contentInset");
    v11 = v10;

    if (v3)
    {
      -[CKConversationListCollectionViewController navigationController](self, "navigationController");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "navigationBar");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v13, "_restingHeights");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "snapshotViewAfterScreenUpdates:", 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKConversationListCollectionViewController collectionView](self, "collectionView");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "backgroundColor");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setBackgroundColor:", v17);

      objc_msgSend(v13, "frame");
      objc_msgSend(v15, "setFrame:");
      -[CKConversationListCollectionViewController navigationController](self, "navigationController");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "view");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "addSubview:", v15);

    }
    else
    {
      v14 = 0;
      v15 = 0;
    }
    -[CKConversationListCollectionViewController navigationItem](self, "navigationItem");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setLargeTitleDisplayMode:", v8);

    -[CKConversationListCollectionViewController navigationItem](self, "navigationItem");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "searchController");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "isActive");

    if ((v23 & 1) == 0)
    {
      -[CKConversationListCollectionViewController navigationItem](self, "navigationItem");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "searchController");
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      -[CKConversationListCollectionViewController navigationItem](self, "navigationItem");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setSearchController:", 0);

      -[CKConversationListCollectionViewController navigationController](self, "navigationController");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "navigationBar");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "setNeedsLayout");

      -[CKConversationListCollectionViewController navigationController](self, "navigationController");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "navigationBar");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "sizeToFit");

      -[CKConversationListCollectionViewController navigationItem](self, "navigationItem");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "setSearchController:", v25);

    }
    if (!v3)
      goto LABEL_23;
    -[CKConversationListCollectionViewController collectionView](self, "collectionView");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "contentInset");
    v34 = v33;
    v36 = v35;
    v38 = v37;
    v40 = v39;

    if (v7)
      v41 = 1;
    else
      v41 = v5;
    if ((v41 & 1) != 0)
    {
      if (v7 != 2 || !v5)
        goto LABEL_22;
      objc_msgSend(v14, "firstObject");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v14, "lastObject");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v44 = v43;
    objc_msgSend(v43, "floatValue");
    v34 = v45;

LABEL_22:
    -[CKConversationListCollectionViewController collectionView](self, "collectionView");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "setContentInset:", v34, v36, v38, v40);

    -[CKConversationListCollectionViewController collectionView](self, "collectionView");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "contentInset");
    v49 = v48;
    v51 = v50;
    v53 = v52;

    v54 = (void *)MEMORY[0x1E0CEABB0];
    v55 = MEMORY[0x1E0C809B0];
    v58[0] = MEMORY[0x1E0C809B0];
    v58[1] = 3221225472;
    v58[2] = __88__CKConversationListCollectionViewController__updateLargeTitleDisplayModeWithAnimation___block_invoke;
    v58[3] = &unk_1E2755EA0;
    v58[4] = self;
    v60 = v11;
    v61 = v49;
    v62 = v51;
    v63 = v53;
    v59 = v15;
    v56[0] = v55;
    v56[1] = 3221225472;
    v56[2] = __88__CKConversationListCollectionViewController__updateLargeTitleDisplayModeWithAnimation___block_invoke_2;
    v56[3] = &unk_1E274A1B8;
    v57 = v59;
    objc_msgSend(v54, "animateWithDuration:delay:options:animations:completion:", 0, v58, v56, 0.300000012, 0.0);

LABEL_23:
  }
}

- (void)startEndSuggestedPinsAnimation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id location;

  location = 0;
  objc_initWeak(&location, self);
  -[CKConversationListCollectionViewController navigationController](self, "navigationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "snapshotViewAfterScreenUpdates:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[CKConversationListCollectionViewController navigationController](self, "navigationController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addSubview:", v5);

  -[CKConversationListCollectionViewController setIsShowingPinningOnboarding:](self, "setIsShowingPinningOnboarding:", 0);
  -[CKConversationListCollectionViewController setEditingMode:animated:shouldUpdate:](self, "setEditingMode:animated:shouldUpdate:", 0, 0, 0);
  -[CKConversationListCollectionViewController setCanShowSuggestedPinningOnboardingCell:](self, "setCanShowSuggestedPinningOnboardingCell:", 0);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __88__CKConversationListCollectionViewController_Onboarding__startEndSuggestedPinsAnimation__block_invoke;
  v9[3] = &unk_1E274D5D0;
  objc_copyWeak(&v11, &location);
  v8 = v5;
  v10 = v8;
  -[CKConversationListCollectionViewController updateSnapshotAnimatingDifferences:completion:](self, "updateSnapshotAnimatingDifferences:completion:", 0, v9);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __88__CKConversationListCollectionViewController_Onboarding__startEndSuggestedPinsAnimation__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "animateOutBackgroundSnapshotView:", *(_QWORD *)(a1 + 32));

}

- (void)startCompletePinningOnboardingAnimation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11[2];
  id location;

  location = 0;
  objc_initWeak(&location, self);
  -[CKConversationListCollectionViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "snapshotViewAfterScreenUpdates:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[CKConversationListCollectionViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addSubview:", v4);

  -[CKConversationListCollectionViewController animationDistanceForCompletingOnboarding](self, "animationDistanceForCompletingOnboarding");
  v7 = v6;
  -[CKConversationListCollectionViewController setIsShowingPinningOnboarding:](self, "setIsShowingPinningOnboarding:", 0);
  -[CKConversationListCollectionViewController commitPinnedConversationsForEditingPins](self, "commitPinnedConversationsForEditingPins");
  -[CKConversationListCollectionViewController setEditingMode:animated:shouldUpdate:](self, "setEditingMode:animated:shouldUpdate:", 0, 0, 0);
  -[CKConversationListCollectionViewController setCanShowSuggestedPinningOnboardingCell:](self, "setCanShowSuggestedPinningOnboardingCell:", 0);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __97__CKConversationListCollectionViewController_Onboarding__startCompletePinningOnboardingAnimation__block_invoke;
  v9[3] = &unk_1E274D400;
  objc_copyWeak(v11, &location);
  v8 = v4;
  v10 = v8;
  v11[1] = v7;
  -[CKConversationListCollectionViewController updateSnapshotAnimatingDifferences:completion:](self, "updateSnapshotAnimatingDifferences:completion:", 0, v9);

  objc_destroyWeak(v11);
  objc_destroyWeak(&location);
}

void __97__CKConversationListCollectionViewController_Onboarding__startCompletePinningOnboardingAnimation__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  v3 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(v3, "collectionView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "animateInCollectionView:aboveBackgroundSnapshotView:enteringOnboarding:animationDistance:", v2, *(_QWORD *)(a1 + 32), 0, *(double *)(a1 + 48));

}

- (void)startSuggestedPinsAnimation
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id location;

  location = 0;
  objc_initWeak(&location, self);
  -[CKConversationListCollectionViewController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isCollapsed");

  if ((v4 & 1) == 0)
  {
    -[CKConversationListCollectionViewController delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "showConversation:animate:", 0, 0);

  }
  -[CKConversationListCollectionViewController navigationController](self, "navigationController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setUserInteractionEnabled:", 0);

  -[CKConversationListCollectionViewController navigationController](self, "navigationController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "snapshotViewAfterScreenUpdates:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[CKConversationListCollectionViewController view](self, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addSubview:", v10);

  -[CKConversationListCollectionViewController navigationItem](self, "navigationItem");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setSearchController:", 0);

  -[CKConversationListCollectionViewController setIsShowingPinningOnboarding:](self, "setIsShowingPinningOnboarding:", 1);
  -[CKConversationListCollectionViewController setEditingMode:animated:shouldUpdate:](self, "setEditingMode:animated:shouldUpdate:", 2, 0, 0);
  -[CKConversationListCollectionViewController setCanShowSuggestedPinningOnboardingCell:](self, "setCanShowSuggestedPinningOnboardingCell:", 0);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __85__CKConversationListCollectionViewController_Onboarding__startSuggestedPinsAnimation__block_invoke;
  v14[3] = &unk_1E274D5D0;
  objc_copyWeak(&v16, &location);
  v13 = v10;
  v15 = v13;
  -[CKConversationListCollectionViewController updateSnapshotAnimatingDifferences:completion:](self, "updateSnapshotAnimatingDifferences:completion:", 0, v14);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

void __85__CKConversationListCollectionViewController_Onboarding__startSuggestedPinsAnimation__block_invoke(uint64_t a1)
{
  id *v2;
  id v3;
  void *v4;
  id WeakRetained;
  _QWORD v6[4];
  id v7;

  v2 = (id *)(a1 + 40);
  v3 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(v3, "collectionView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "animateInCollectionView:aboveBackgroundSnapshotView:enteringOnboarding:animationDistance:", v4, *(_QWORD *)(a1 + 32), 1, 150.0);

  WeakRetained = objc_loadWeakRetained(v2);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __85__CKConversationListCollectionViewController_Onboarding__startSuggestedPinsAnimation__block_invoke_2;
  v6[3] = &unk_1E274DBB0;
  objc_copyWeak(&v7, v2);
  objc_msgSend(WeakRetained, "pinConversationsWithCompletion:", v6);

  objc_destroyWeak(&v7);
}

void __85__CKConversationListCollectionViewController_Onboarding__startSuggestedPinsAnimation__block_invoke_2(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;
  id v5;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "animateInPinsToFinalPosition");

  v5 = objc_loadWeakRetained(v2);
  objc_msgSend(v5, "removeNewlyPinnedSuggestionCells:", v3);

}

- (double)animationDistanceForCompletingOnboarding
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double MaxY;
  CGRect v13;

  -[CKConversationListCollectionViewController dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "snapshot");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "itemIdentifiersInSectionWithIdentifier:", &unk_1E28705A0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[CKConversationListCollectionViewController dataSource](self, "dataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "indexPathForItemIdentifier:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[CKConversationListCollectionViewController collectionView](self, "collectionView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "cellForItemAtIndexPath:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v10, "frame");
    MaxY = CGRectGetMaxY(v13);
  }
  else
  {
    MaxY = 150.0;
  }

  return MaxY;
}

- (void)animateInCollectionView:(id)a3 aboveBackgroundSnapshotView:(id)a4 enteringOnboarding:(BOOL)a5 animationDistance:(double)a6
{
  _BOOL4 v7;
  id v10;
  id v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  double v19;
  void *v20;
  id v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  void *v28;
  void *v29;
  double v30;
  void *v31;
  double v32;
  double v33;
  double v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  double v43;
  void *v44;
  id v45;
  id v46;
  void *v47;
  void *v48;
  id v49;
  void *v50;
  id v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  uint64_t v62;
  id v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  double v79;
  void *v80;
  double v81;
  void *v82;
  double v83;
  double v84;
  double v85;
  double v86;
  id v87;
  double v88;
  double v89;
  double v90;
  double v91;
  double v92;
  void *v93;
  _QWORD v94[4];
  id v95;
  id v96;
  id v97;
  _QWORD v98[3];

  v7 = a5;
  v98[1] = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v11 = a3;
  objc_msgSend(v11, "layer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "position");
  v14 = v13;
  v90 = v13;
  v16 = v15;
  v92 = v15;

  v91 = v16 + a6;
  objc_msgSend(v11, "layer");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setPosition:", v14, v16 + a6);

  objc_msgSend(v11, "layer");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v19) = 0;
  objc_msgSend(v18, "setOpacity:", v19);

  -[CKConversationListCollectionViewController view](self, "view");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "bringSubviewToFront:", v11);

  v21 = objc_alloc(MEMORY[0x1E0CEABB0]);
  objc_msgSend(v11, "origin");
  v23 = v22;
  objc_msgSend(v11, "bounds");
  v25 = v24;
  objc_msgSend(v11, "origin");
  v27 = (void *)objc_msgSend(v21, "initWithFrame:", v23, 0.0, v25, v26);
  objc_msgSend(v11, "backgroundColor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setBackgroundColor:", v28);

  objc_msgSend(v27, "layer");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v30) = 0;
  objc_msgSend(v29, "setOpacity:", v30);

  objc_msgSend(v27, "layer");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "position");
  v89 = v32;
  v34 = v33;

  v88 = v34 - a6;
  -[CKConversationListCollectionViewController view](self, "view");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "insertSubview:belowSubview:", v27, v11);

  objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2C88]);
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v93, "setValue:forKeyPath:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0CD2D70]);
  v36 = objc_alloc_init(MEMORY[0x1E0CD2708]);
  -[CKConversationListCollectionViewController view](self, "view");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "layer");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "bounds");
  objc_msgSend(v36, "setFrame:");

  v98[0] = v93;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v98, 1);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setFilters:", v39);

  -[CKConversationListCollectionViewController view](self, "view");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "layer");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "layer");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "insertSublayer:below:", v36, v42);

  v43 = CACurrentMediaTime();
  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  v44 = (void *)MEMORY[0x1E0CD28B0];
  v94[0] = MEMORY[0x1E0C809B0];
  v94[1] = 3221225472;
  v94[2] = __147__CKConversationListCollectionViewController_Onboarding__animateInCollectionView_aboveBackgroundSnapshotView_enteringOnboarding_animationDistance___block_invoke;
  v94[3] = &unk_1E274A0B8;
  v95 = v27;
  v96 = v36;
  v97 = v10;
  v87 = v10;
  v45 = v36;
  v46 = v27;
  objc_msgSend(v44, "setCompletionBlock:", v94);
  objc_msgSend(MEMORY[0x1E0CD2848], "animationWithKeyPath:", CFSTR("backgroundColor"));
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "setBeginTime:", v43);
  objc_msgSend(v11, "backgroundColor");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "colorWithAlphaComponent:", 0.0);
  v49 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v47, "setFromValue:", objc_msgSend(v49, "CGColor"));

  objc_msgSend(v11, "backgroundColor");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "colorWithAlphaComponent:", 1.0);
  v51 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v47, "setToValue:", objc_msgSend(v51, "CGColor"));

  if (v7)
    v52 = 1.255;
  else
    v52 = 0.8;
  if (v7)
    v53 = 14.7146;
  else
    v53 = 50.0;
  if (v7)
    v54 = 54.1299;
  else
    v54 = 300.0;
  if (v7)
    v55 = 0.02;
  else
    v55 = 0.0;
  if (v7)
    v56 = 78.8239;
  else
    v56 = 309.319;
  if (v7)
    v57 = 17.7566;
  else
    v57 = 35.1749;
  if (v7)
    v58 = 1.04;
  else
    v58 = 0.525;
  v59 = 16.788;
  if (v7)
    v59 = 15.3252;
  v85 = v59;
  v60 = 70.4594;
  if (v7)
    v60 = 58.7152;
  v84 = v60;
  v61 = 1.1;
  if (v7)
    v61 = 1.205;
  v86 = v61;
  objc_msgSend(v47, "setDuration:", v52);
  objc_msgSend(v47, "setMass:", 1.0);
  objc_msgSend(v47, "setDamping:", v53);
  objc_msgSend(v47, "setStiffness:", v54);
  v62 = *MEMORY[0x1E0CD2B50];
  objc_msgSend(v47, "setFillMode:", *MEMORY[0x1E0CD2B50]);
  objc_msgSend(v45, "addAnimation:forKey:", v47, CFSTR("backgroundColor"));
  objc_msgSend(v11, "backgroundColor");
  v63 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v45, "setBackgroundColor:", objc_msgSend(v63, "CGColor"));

  objc_msgSend(MEMORY[0x1E0CD2848], "animationWithKeyPath:", CFSTR("filters.gaussianBlur.inputRadius"));
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "setBeginTime:", v43);
  objc_msgSend(v64, "setFromValue:", &unk_1E28705B8);
  objc_msgSend(v64, "setToValue:", &unk_1E28705D0);
  objc_msgSend(v64, "setDuration:", v52);
  objc_msgSend(v64, "setMass:", 1.0);
  objc_msgSend(v64, "setDamping:", v53);
  objc_msgSend(v64, "setStiffness:", v54);
  objc_msgSend(v64, "setFillMode:", v62);
  objc_msgSend(v45, "addAnimation:forKey:", v64, CFSTR("filters.gaussianBlur.inputRadius"));
  objc_msgSend(v45, "setValue:forKeyPath:", &unk_1E28705D0, CFSTR("filters.gaussianBlur.inputRadius"));
  objc_msgSend(MEMORY[0x1E0CD2848], "animationWithKeyPath:", CFSTR("opacity"));
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "setBeginTime:", v55 + v43);
  objc_msgSend(v65, "setStiffness:", v56);
  objc_msgSend(v65, "setDamping:", v57);
  objc_msgSend(v65, "setFromValue:", &unk_1E2871240);
  objc_msgSend(v65, "setToValue:", &unk_1E2871250);
  objc_msgSend(v65, "setDuration:", v58);
  objc_msgSend(v65, "setFillMode:", v62);
  objc_msgSend(v11, "layer");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "addAnimation:forKey:", v65, CFSTR("opacity"));

  objc_msgSend(v46, "layer");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "addAnimation:forKey:", v65, CFSTR("opacity"));

  objc_msgSend(MEMORY[0x1E0CD2848], "animationWithKeyPath:", CFSTR("position"));
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "setBeginTime:", v43);
  objc_msgSend(v68, "setDamping:", v85);
  objc_msgSend(v68, "setStiffness:", v84);
  objc_msgSend(v68, "setFillMode:", v62);
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", v90, v91);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "setFromValue:", v69);

  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", v90, v92);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "setToValue:", v70);

  objc_msgSend(v68, "setDuration:", v86);
  objc_msgSend(v11, "layer");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "addAnimation:forKey:", v68, CFSTR("position"));

  objc_msgSend(MEMORY[0x1E0CD2848], "animationWithKeyPath:", CFSTR("position"));
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "setBeginTime:", v43);
  objc_msgSend(v72, "setDamping:", v85);
  objc_msgSend(v72, "setStiffness:", v84);
  objc_msgSend(v72, "setFillMode:", v62);
  v73 = (void *)MEMORY[0x1E0CB3B18];
  objc_msgSend(v46, "position");
  objc_msgSend(v73, "valueWithCGPoint:");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "setFromValue:", v74);

  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", v89, v88);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "setToValue:", v75);

  objc_msgSend(v72, "setDuration:", v86);
  objc_msgSend(v46, "layer");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "addAnimation:forKey:", v72, CFSTR("position"));

  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
  objc_msgSend(v11, "layer");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v77, "setPosition:", v90, v92);

  objc_msgSend(v11, "layer");
  v78 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v79) = 1.0;
  objc_msgSend(v78, "setOpacity:", v79);

  objc_msgSend(v46, "layer");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v81) = 1.0;
  objc_msgSend(v80, "setOpacity:", v81);

  objc_msgSend(v46, "layer");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "setPosition:", v89, v88);

  LODWORD(v83) = 1.0;
  objc_msgSend(v45, "setOpacity:", v83);

}

uint64_t __147__CKConversationListCollectionViewController_Onboarding__animateInCollectionView_aboveBackgroundSnapshotView_enteringOnboarding_animationDistance___block_invoke(id *a1)
{
  objc_msgSend(a1[4], "removeFromSuperview");
  objc_msgSend(a1[5], "removeFromSuperlayer");
  return objc_msgSend(a1[6], "removeFromSuperview");
}

- (void)animateOutBackgroundSnapshotView:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  id v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  double v30;
  void *v31;
  id v32;
  id v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  double v50;
  void *v51;
  double v52;
  void *v53;
  void *v54;
  _QWORD v55[4];
  id v56;
  id v57;
  _QWORD v58[2];

  v58[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "position");
  v7 = v6;
  v9 = v8;

  v10 = objc_alloc(MEMORY[0x1E0CEABB0]);
  objc_msgSend(v4, "origin");
  v12 = v11;
  objc_msgSend(v4, "bounds");
  v13 = (void *)objc_msgSend(v10, "initWithFrame:", v12, -150.0);
  -[CKConversationListCollectionViewController collectionView](self, "collectionView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "backgroundColor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setBackgroundColor:", v15);

  objc_msgSend(v13, "layer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v17) = 1.0;
  objc_msgSend(v16, "setOpacity:", v17);

  objc_msgSend(v13, "layer");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "position");
  v20 = v19;
  v22 = v21;

  v23 = v22 + 150.0;
  -[CKConversationListCollectionViewController navigationController](self, "navigationController");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "view");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "insertSubview:belowSubview:", v13, v4);

  objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2C88]);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "setValue:forKeyPath:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0CD2D70]);
  v26 = objc_alloc_init(MEMORY[0x1E0CD2708]);
  objc_msgSend(v4, "layer");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "bounds");
  objc_msgSend(v26, "setFrame:");

  v58[0] = v54;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v58, 1);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setFilters:", v28);

  objc_msgSend(v4, "layer");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "addSublayer:", v26);

  v30 = CACurrentMediaTime();
  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  v31 = (void *)MEMORY[0x1E0CD28B0];
  v55[0] = MEMORY[0x1E0C809B0];
  v55[1] = 3221225472;
  v55[2] = __91__CKConversationListCollectionViewController_Onboarding__animateOutBackgroundSnapshotView___block_invoke;
  v55[3] = &unk_1E274A108;
  v56 = v26;
  v57 = v4;
  v32 = v4;
  v33 = v26;
  objc_msgSend(v31, "setCompletionBlock:", v55);
  objc_msgSend(MEMORY[0x1E0CD2848], "animationWithKeyPath:", CFSTR("filters.gaussianBlur.inputRadius"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setBeginTime:", v30);
  objc_msgSend(v34, "setFromValue:", &unk_1E28705B8);
  objc_msgSend(v34, "setToValue:", &unk_1E28705D0);
  objc_msgSend(v34, "setDuration:", 0.8);
  objc_msgSend(v34, "setMass:", 1.0);
  objc_msgSend(v34, "setDamping:", 50.0);
  objc_msgSend(v34, "setStiffness:", 300.0);
  v35 = *MEMORY[0x1E0CD2B50];
  objc_msgSend(v34, "setFillMode:", *MEMORY[0x1E0CD2B50]);
  objc_msgSend(v33, "addAnimation:forKey:", v34, CFSTR("filters.gaussianBlur.inputRadius"));
  objc_msgSend(v33, "setValue:forKeyPath:", &unk_1E28705D0, CFSTR("filters.gaussianBlur.inputRadius"));
  objc_msgSend(MEMORY[0x1E0CD2848], "animationWithKeyPath:", CFSTR("opacity"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setBeginTime:", v30);
  objc_msgSend(v36, "setStiffness:", 309.319);
  objc_msgSend(v36, "setDamping:", 35.1749);
  objc_msgSend(v36, "setFromValue:", &unk_1E2871250);
  objc_msgSend(v36, "setToValue:", &unk_1E2871240);
  objc_msgSend(v36, "setDuration:", 0.525);
  objc_msgSend(v36, "setFillMode:", v35);
  objc_msgSend(v32, "layer");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "addAnimation:forKey:", v36, CFSTR("opacity"));

  objc_msgSend(v13, "layer");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "addAnimation:forKey:", v36, CFSTR("opacity"));

  objc_msgSend(MEMORY[0x1E0CD2848], "animationWithKeyPath:", CFSTR("position"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setBeginTime:", v30);
  objc_msgSend(v39, "setDamping:", 16.788);
  objc_msgSend(v39, "setStiffness:", 70.4594);
  objc_msgSend(v39, "setFillMode:", v35);
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", v7, v9);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setFromValue:", v40);

  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", v7, v9 + 150.0);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setToValue:", v41);

  objc_msgSend(v39, "setDuration:", 1.1);
  objc_msgSend(v32, "layer");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "addAnimation:forKey:", v39, CFSTR("position"));

  objc_msgSend(MEMORY[0x1E0CD2848], "animationWithKeyPath:", CFSTR("position"));
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "setBeginTime:", v30);
  objc_msgSend(v43, "setDamping:", 16.788);
  objc_msgSend(v43, "setStiffness:", 70.4594);
  objc_msgSend(v43, "setFillMode:", v35);
  v44 = (void *)MEMORY[0x1E0CB3B18];
  objc_msgSend(v13, "position");
  objc_msgSend(v44, "valueWithCGPoint:");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "setFromValue:", v45);

  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", v20, v23);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "setToValue:", v46);

  objc_msgSend(v43, "setDuration:", 1.1);
  objc_msgSend(v13, "layer");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "addAnimation:forKey:", v43, CFSTR("position"));

  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
  objc_msgSend(v32, "layer");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "setPosition:", v7, v9 + 150.0);

  objc_msgSend(v32, "layer");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v50) = 0;
  objc_msgSend(v49, "setOpacity:", v50);

  objc_msgSend(v13, "layer");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v52) = 0;
  objc_msgSend(v51, "setOpacity:", v52);

  objc_msgSend(v13, "layer");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "setPosition:", v20, v23);

}

uint64_t __91__CKConversationListCollectionViewController_Onboarding__animateOutBackgroundSnapshotView___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "removeFromSuperlayer");
  return objc_msgSend(*(id *)(a1 + 40), "removeFromSuperview");
}

- (void)pinConversationsWithCompletion:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[CKConversationListCollectionViewController recommendedPinningConversations](self, "recommendedPinningConversations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6 >= 3)
    v7 = 3;
  else
    v7 = v6;
  -[CKConversationListCollectionViewController recommendedPinningConversations](self, "recommendedPinningConversations");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "subarrayWithRange:", 0, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[CKConversationListCollectionViewController setHoldPinningUpdatesForOnboardingAnimation:](self, "setHoldPinningUpdatesForOnboardingAnimation:", 1);
  -[CKConversationListCollectionViewController setHidePinsForAnimation:](self, "setHidePinsForAnimation:", 1);
  -[CKConversationListCollectionViewController setIsCurrentlyAnimatingPinningOnboardingSuggestions:](self, "setIsCurrentlyAnimatingPinningOnboardingSuggestions:", 1);
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v10 = v9;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v22;
    v14 = *MEMORY[0x1E0D35628];
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v22 != v13)
          objc_enumerationMutation(v10);
        -[CKConversationListCollectionViewController togglePinStateForConversation:withReason:](self, "togglePinStateForConversation:withReason:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i), v14);
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v12);
  }

  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __89__CKConversationListCollectionViewController_Onboarding__pinConversationsWithCompletion___block_invoke;
  v18[3] = &unk_1E274DA38;
  v19 = v10;
  v20 = v4;
  v16 = v10;
  v17 = v4;
  -[CKConversationListCollectionViewController updateSnapshotAnimatingDifferences:completion:](self, "updateSnapshotAnimatingDifferences:completion:", 0, v18);

}

uint64_t __89__CKConversationListCollectionViewController_Onboarding__pinConversationsWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (BOOL)shouldAnimatePositionForRecommendedItemIdentifiers:(id)a3 pinnedItemIdentifiers:(id)a4
{
  id v6;
  id v7;
  id v8;
  _QWORD v10[4];
  id v11;
  CKConversationListCollectionViewController *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;

  v6 = a3;
  v7 = a4;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 1;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __131__CKConversationListCollectionViewController_Onboarding__shouldAnimatePositionForRecommendedItemIdentifiers_pinnedItemIdentifiers___block_invoke;
  v10[3] = &unk_1E274F7B8;
  v8 = v6;
  v11 = v8;
  v12 = self;
  v13 = &v14;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v10);
  LOBYTE(self) = *((_BYTE *)v15 + 24);

  _Block_object_dispose(&v14, 8);
  return (char)self;
}

void __131__CKConversationListCollectionViewController_Onboarding__shouldAnimatePositionForRecommendedItemIdentifiers_pinnedItemIdentifiers___block_invoke(uint64_t a1, uint64_t a2, unint64_t a3, _BYTE *a4)
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  int v15;
  id v16;

  if (objc_msgSend(*(id *)(a1 + 32), "count") <= a3)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
    *a4 = 1;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "dataSource");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "indexPathForItemIdentifier:", v8);
    v16 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 40), "collectionView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "cellForItemAtIndexPath:", v16);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 40), "collectionView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "indexPathsForVisibleItems");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "containsObject:", v16);

    if (!v13
      || !v10
      || (objc_msgSend(v10, "avatarView"),
          v14 = (void *)objc_claimAutoreleasedReturnValue(),
          v15 = objc_msgSend(v14, "isHidden"),
          v14,
          v15))
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
      *a4 = 1;
    }

  }
}

- (void)animateInPinsToFinalPosition
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  CFTimeInterval v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  CKConversationListCollectionViewController *v14;
  id v15;
  id v16[2];
  char v17;
  id location;

  -[CKConversationListCollectionViewController dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "snapshot");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "itemIdentifiersInSectionWithIdentifier:", &unk_1E28705E8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[CKConversationListCollectionViewController dataSource](self, "dataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "snapshot");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "itemIdentifiersInSectionWithIdentifier:", &unk_1E2870600);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v7) = -[CKConversationListCollectionViewController shouldAnimatePositionForRecommendedItemIdentifiers:pinnedItemIdentifiers:](self, "shouldAnimatePositionForRecommendedItemIdentifiers:pinnedItemIdentifiers:", v8, v5);
  v9 = CACurrentMediaTime();
  location = 0;
  objc_initWeak(&location, self);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __86__CKConversationListCollectionViewController_Onboarding__animateInPinsToFinalPosition__block_invoke;
  v12[3] = &unk_1E274F808;
  v10 = v8;
  v13 = v10;
  v14 = self;
  v17 = (char)v7;
  v16[1] = *(id *)&v9;
  v11 = v5;
  v15 = v11;
  objc_copyWeak(v16, &location);
  objc_msgSend(v11, "enumerateObjectsUsingBlock:", v12);
  objc_destroyWeak(v16);

  objc_destroyWeak(&location);
}

void __86__CKConversationListCollectionViewController_Onboarding__animateInPinsToFinalPosition__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  double v28;
  CGFloat v29;
  double v30;
  CGFloat v31;
  double v32;
  CGFloat v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  void *v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  CGFloat v50;
  double v51;
  CGFloat v52;
  double v53;
  CGFloat v54;
  double v55;
  CGFloat v56;
  double MidY;
  double v58;
  double v59;
  void *v60;
  void *v61;
  double v62;
  double v63;
  void *v64;
  void *v65;
  double v66;
  double v67;
  void *v68;
  void *v69;
  double v70;
  double v71;
  double v72;
  void *v73;
  void *v74;
  void *v75;
  int v76;
  int v77;
  void *v78;
  void *v79;
  void *v80;
  int v81;
  void *v82;
  void *v83;
  void *v84;
  int v85;
  void *v86;
  void *v87;
  void *v88;
  int v89;
  void *v90;
  double v91;
  void *v92;
  void *v93;
  void *v94;
  double v95;
  void *v96;
  void *v97;
  void *v98;
  double v99;
  void *v100;
  void *v101;
  void *v102;
  double v103;
  void *v104;
  void *v105;
  void *v106;
  double v107;
  void *v108;
  double v109;
  void *v110;
  void *v111;
  uint64_t v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  double v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  double v139;
  void *v140;
  double v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  double v147;
  void *v148;
  void *v149;
  void *v150;
  double v151;
  void *v152;
  void *v153;
  void *v154;
  double v155;
  void *v156;
  void *v157;
  void *v158;
  double v159;
  __int128 v160;
  __int128 v161;
  __int128 v162;
  __int128 v163;
  __int128 v164;
  __int128 v165;
  __int128 v166;
  __int128 v167;
  int v168;
  void *v169;
  void *v170;
  int v171;
  int v172;
  double MidX;
  _OWORD v174[8];
  CATransform3D v175;
  CATransform3D v176;
  CATransform3D v177;
  _QWORD v178[4];
  id v179;
  id v180[2];
  CATransform3D v181;
  CATransform3D v182;
  CGRect v183;
  CGRect v184;
  CGRect v185;
  CGRect v186;

  v5 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "count") > (unint64_t)a3)
  {
    objc_msgSend(*(id *)(a1 + 40), "dataSource");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "indexPathForItemIdentifier:", v5);
    v7 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 40), "collectionView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "cellForItemAtIndexPath:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "contentView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setAlpha:", 1.0);

    objc_msgSend(*(id *)(a1 + 40), "collectionView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "bringSubviewToFront:", v9);

    objc_msgSend(*(id *)(a1 + 40), "dataSource");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", a3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "indexPathForItemIdentifier:", v13);
    v14 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 40), "collectionView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "cellForItemAtIndexPath:", v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (*(_BYTE *)(a1 + 72) && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      objc_msgSend(v16, "avatarView");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setHidden:", 1);

      objc_msgSend(v16, "avatarView");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "frame");
      v20 = v19;
      v22 = v21;
      v24 = v23;
      v26 = v25;
      objc_msgSend(*(id *)(a1 + 40), "collectionView");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "convertRect:toView:", v27, v20, v22, v24, v26);
      v29 = v28;
      v31 = v30;
      v33 = v32;
      v35 = v34;
    }
    else
    {
      objc_msgSend(v9, "pinnedConversationView");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "avatarView");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "frame");
      v37 = v36;
      v39 = v38;
      v41 = v40;
      v43 = v42;
      objc_msgSend(*(id *)(a1 + 40), "collectionView");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "convertRect:toView:", v44, v37, v39, v41, v43);
      v29 = v45;
      v31 = v46;
      v33 = v47;
      v35 = v48;

    }
    objc_msgSend(v9, "frame");
    v50 = v49;
    v52 = v51;
    v54 = v53;
    v56 = v55;
    v183.origin.x = v29;
    v183.origin.y = v31;
    v183.size.width = v33;
    v183.size.height = v35;
    MidX = CGRectGetMidX(v183);
    v184.origin.x = v29;
    v184.origin.y = v31;
    v184.size.width = v33;
    v184.size.height = v35;
    MidY = CGRectGetMidY(v184);
    v185.origin.x = v50;
    v185.origin.y = v52;
    v185.size.width = v54;
    v185.size.height = v56;
    v58 = CGRectGetMidX(v185);
    v186.origin.x = v50;
    v186.origin.y = v52;
    v186.size.width = v54;
    v186.size.height = v56;
    v59 = CGRectGetMidY(v186);
    objc_msgSend(v9, "pinnedConversationView");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "avatarView");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "bounds");
    v63 = v35 / v62;

    memset(&v182, 0, sizeof(v182));
    objc_msgSend(v9, "layer");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v65 = v64;
    if (v64)
      objc_msgSend(v64, "transform");
    else
      memset(&v181, 0, sizeof(v181));
    CATransform3DScale(&v182, &v181, v63, v63, 1.0);

    objc_msgSend(v9, "frame");
    v67 = v66;
    objc_msgSend(v9, "pinnedConversationView");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "avatarView");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "frame");
    v71 = v70;

    v72 = *(double *)(a1 + 64);
    objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
    v73 = (void *)MEMORY[0x1E0CD28B0];
    v178[0] = MEMORY[0x1E0C809B0];
    v178[1] = 3221225472;
    v178[2] = __86__CKConversationListCollectionViewController_Onboarding__animateInPinsToFinalPosition__block_invoke_2;
    v178[3] = &unk_1E274F7E0;
    v180[1] = a3;
    v179 = *(id *)(a1 + 48);
    objc_copyWeak(v180, (id *)(a1 + 56));
    objc_msgSend(v73, "setCompletionBlock:", v178);
    objc_msgSend(v9, "unpinAccessoryView");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "layer");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "opacity");
    v77 = v76;

    objc_msgSend(v9, "pinnedConversationView");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v78, "titleLabel");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "layer");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v80, "opacity");
    v172 = v81;

    objc_msgSend(v9, "pinnedConversationView");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v82, "unreadIndicator");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v83, "layer");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v84, "opacity");
    v171 = v85;
    v169 = v16;
    v170 = (void *)v14;

    objc_msgSend(v9, "pinnedConversationView");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v86, "radiantShadowImageView");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v87, "layer");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v88, "opacity");
    v168 = v89;

    objc_msgSend(v9, "layer");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    v91 = MidY + v63 * (v67 * 0.5 - v71 * 0.5) * 0.5;
    objc_msgSend(v90, "setPosition:", MidX, v91);

    v177 = v182;
    objc_msgSend(v9, "layer");
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    v176 = v177;
    objc_msgSend(v92, "setTransform:", &v176);

    objc_msgSend(v9, "unpinAccessoryView");
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v93, "layer");
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v95) = 0;
    objc_msgSend(v94, "setOpacity:", v95);

    objc_msgSend(v9, "pinnedConversationView");
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v96, "titleLabel");
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v97, "layer");
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v99) = 0;
    objc_msgSend(v98, "setOpacity:", v99);

    objc_msgSend(v9, "pinnedConversationView");
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v100, "unreadIndicator");
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v101, "layer");
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v103) = 0;
    objc_msgSend(v102, "setOpacity:", v103);

    objc_msgSend(v9, "pinnedConversationView");
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v104, "radiantShadowImageView");
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v105, "layer");
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v107) = 0;
    objc_msgSend(v106, "setOpacity:", v107);

    objc_msgSend(MEMORY[0x1E0CD2848], "animationWithKeyPath:", CFSTR("transform"));
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v108, "setMass:", 2.0);
    objc_msgSend(v108, "setStiffness:", 300.0);
    objc_msgSend(v108, "setDamping:", 50.0);
    v109 = v72 + 0.49 + (double)(unint64_t)a3 * 0.1;
    objc_msgSend(v108, "setBeginTime:", v109);
    v175 = v182;
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCATransform3D:", &v175);
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v108, "setFromValue:", v110);

    v166 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 80);
    v167 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 64);
    *(_OWORD *)&v175.m31 = v167;
    *(_OWORD *)&v175.m33 = v166;
    v164 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 112);
    v165 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 96);
    *(_OWORD *)&v175.m41 = v165;
    *(_OWORD *)&v175.m43 = v164;
    v162 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 16);
    v163 = *MEMORY[0x1E0CD2610];
    *(_OWORD *)&v175.m11 = *MEMORY[0x1E0CD2610];
    *(_OWORD *)&v175.m13 = v162;
    v160 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 48);
    v161 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 32);
    *(_OWORD *)&v175.m21 = v161;
    *(_OWORD *)&v175.m23 = v160;
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCATransform3D:", &v175);
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v108, "setToValue:", v111);

    v112 = *MEMORY[0x1E0CD2B50];
    objc_msgSend(v108, "setFillMode:", *MEMORY[0x1E0CD2B50]);
    objc_msgSend(v108, "setDuration:", 0.8);
    objc_msgSend(v9, "layer");
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v113, "addAnimation:forKey:", v108, CFSTR("transform"));

    objc_msgSend(v9, "unpinAccessoryView");
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v114, "layer");
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v115, "addAnimation:forKey:", v108, CFSTR("transform"));

    v116 = (void *)v7;
    if (*(_BYTE *)(a1 + 72))
    {
      objc_msgSend(MEMORY[0x1E0CD2848], "animationWithKeyPath:", CFSTR("position.x"));
      v117 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v117, "setMass:", 1.0);
      objc_msgSend(v117, "setStiffness:", 63.633);
      objc_msgSend(v117, "setDamping:", 15.9541);
      objc_msgSend(v117, "setBeginTime:", v109);
      objc_msgSend(v117, "setDuration:", 1.1575);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", MidX);
      v118 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v117, "setFromValue:", v118);

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v58);
      v119 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v117, "setToValue:", v119);

      objc_msgSend(v117, "setFillMode:", v112);
      objc_msgSend(v9, "layer");
      v120 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v120, "addAnimation:forKey:", v117, CFSTR("position.x"));

      objc_msgSend(MEMORY[0x1E0CD2848], "animationWithKeyPath:", CFSTR("position.y"));
      v121 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v121, "setMass:", 1.0);
      objc_msgSend(v121, "setStiffness:", 41.8381);
      objc_msgSend(v121, "setDamping:", 12.9365);
      objc_msgSend(v121, "setBeginTime:", v109 + 0.1);
      objc_msgSend(v121, "setDuration:", 1.4275);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v91);
      v122 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v121, "setFromValue:", v122);

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v59);
      v123 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v121, "setToValue:", v123);

      objc_msgSend(v121, "setFillMode:", v112);
      objc_msgSend(v9, "layer");
      v124 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v124, "addAnimation:forKey:", v121, CFSTR("position.y"));

      objc_msgSend(MEMORY[0x1E0CD2848], "animationWithKeyPath:", CFSTR("opacity"));
      v125 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v125, "setMass:", 2.0);
      objc_msgSend(v125, "setStiffness:", 300.0);
      objc_msgSend(v125, "setDamping:", 50.0);
      objc_msgSend(v125, "setBeginTime:", v109);
      LODWORD(v126) = 0;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v126);
      v127 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v125, "setFromValue:", v127);

      objc_msgSend(v125, "setDuration:", 0.8);
      objc_msgSend(v125, "setFillMode:", v112);
      objc_msgSend(v9, "unpinAccessoryView");
      v128 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v128, "layer");
      v129 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v129, "addAnimation:forKey:", v125, CFSTR("opacity"));

      objc_msgSend(v9, "pinnedConversationView");
      v130 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v130, "titleLabel");
      v131 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v131, "layer");
      v132 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v132, "addAnimation:forKey:", v125, CFSTR("opacity"));

      objc_msgSend(v9, "pinnedConversationView");
      v133 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v133, "unreadIndicator");
      v134 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v134, "layer");
      v135 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v135, "addAnimation:forKey:", v125, CFSTR("opacity"));

      objc_msgSend(v9, "pinnedConversationView");
      v136 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v136, "radiantShadowImageView");
      v137 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v137, "layer");
      v138 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v138, "addAnimation:forKey:", v125, CFSTR("opacity"));

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CD2848], "animationWithKeyPath:", CFSTR("opacity"));
      v117 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v117, "setMass:", 2.0);
      objc_msgSend(v117, "setStiffness:", 300.0);
      objc_msgSend(v117, "setDamping:", 50.0);
      objc_msgSend(v117, "setBeginTime:", v109);
      LODWORD(v139) = 0;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v139);
      v140 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v117, "setFromValue:", v140);

      LODWORD(v141) = 1.0;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v141);
      v142 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v117, "setToValue:", v142);

      objc_msgSend(v117, "setFillMode:", v112);
      objc_msgSend(v117, "setDuration:", 1.5);
      objc_msgSend(v9, "layer");
      v121 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v121, "addAnimation:forKey:", v117, CFSTR("opacity"));
    }

    objc_msgSend(v9, "layer");
    v143 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v143, "setPosition:", v58, v59);

    objc_msgSend(v9, "layer");
    v144 = (void *)objc_claimAutoreleasedReturnValue();
    v174[4] = v167;
    v174[5] = v166;
    v174[6] = v165;
    v174[7] = v164;
    v174[0] = v163;
    v174[1] = v162;
    v174[2] = v161;
    v174[3] = v160;
    objc_msgSend(v144, "setTransform:", v174);

    objc_msgSend(v9, "unpinAccessoryView");
    v145 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v145, "layer");
    v146 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v147) = v77;
    objc_msgSend(v146, "setOpacity:", v147);

    objc_msgSend(v9, "pinnedConversationView");
    v148 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v148, "titleLabel");
    v149 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v149, "layer");
    v150 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v151) = v172;
    objc_msgSend(v150, "setOpacity:", v151);

    objc_msgSend(v9, "pinnedConversationView");
    v152 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v152, "unreadIndicator");
    v153 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v153, "layer");
    v154 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v155) = v171;
    objc_msgSend(v154, "setOpacity:", v155);

    objc_msgSend(v9, "pinnedConversationView");
    v156 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v156, "radiantShadowImageView");
    v157 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v157, "layer");
    v158 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v159) = v168;
    objc_msgSend(v158, "setOpacity:", v159);

    objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
    objc_destroyWeak(v180);

  }
}

void __86__CKConversationListCollectionViewController_Onboarding__animateInPinsToFinalPosition__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  id WeakRetained;

  v2 = *(_QWORD *)(a1 + 48);
  if (v2 == objc_msgSend(*(id *)(a1 + 32), "count") - 1)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(WeakRetained, "completeAnimation");

  }
}

- (void)removeNewlyPinnedSuggestionCells:(id)a3
{
  dispatch_time_t v3;
  _QWORD v4[4];
  id v5;
  id location;

  location = 0;
  objc_initWeak(&location, self);
  v3 = dispatch_time(0, 800000000);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __91__CKConversationListCollectionViewController_Onboarding__removeNewlyPinnedSuggestionCells___block_invoke;
  v4[3] = &unk_1E274B548;
  objc_copyWeak(&v5, &location);
  dispatch_after(v3, MEMORY[0x1E0C80D38], v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __91__CKConversationListCollectionViewController_Onboarding__removeNewlyPinnedSuggestionCells___block_invoke(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  void *v3;
  _QWORD v4[4];
  id v5;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setIsCurrentlyAnimatingPinningOnboardingSuggestions:", 0);

  v3 = (void *)MEMORY[0x1E0CEABB0];
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __91__CKConversationListCollectionViewController_Onboarding__removeNewlyPinnedSuggestionCells___block_invoke_2;
  v4[3] = &unk_1E274B548;
  objc_copyWeak(&v5, v1);
  objc_msgSend(v3, "_animateUsingSpringWithDuration:delay:options:mass:stiffness:damping:initialVelocity:animations:completion:", 0, v4, 0, 0.9775, 0.0, 1.0, 89.2259, 18.8919, 0.0);
  objc_destroyWeak(&v5);
}

void __91__CKConversationListCollectionViewController_Onboarding__removeNewlyPinnedSuggestionCells___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "updateSnapshotAnimatingDifferences:", 1);

}

- (void)completeAnimation
{
  void *v3;
  id v4;

  -[CKConversationListCollectionViewController setHoldPinningUpdatesForOnboardingAnimation:](self, "setHoldPinningUpdatesForOnboardingAnimation:", 0);
  -[CKConversationListCollectionViewController setHidePinsForAnimation:](self, "setHidePinsForAnimation:", 0);
  -[CKConversationListCollectionViewController navigationController](self, "navigationController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setUserInteractionEnabled:", 1);

}

- (void)removeBanner:(id)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  CKConversationListCollectionViewController *v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  CKConversationListCollectionViewController *v22;
  double v23;

  v4 = a4;
  v6 = a3;
  -[CKConversationListCollectionViewController bannerHeight](self, "bannerHeight");
  v8 = v7;
  -[CKConversationListCollectionViewController bannerTopConstraint](self, "bannerTopConstraint");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[CKConversationListCollectionViewController view](self, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "layoutIfNeeded");
    v11 = (void *)MEMORY[0x1E0CEABB0];
    v12 = MEMORY[0x1E0C809B0];
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __77__CKConversationListCollectionViewController_Banners__removeBanner_animated___block_invoke;
    v18[3] = &unk_1E274FBA0;
    v19 = v6;
    v23 = v8;
    v20 = v9;
    v21 = v10;
    v22 = self;
    v14[0] = v12;
    v14[1] = 3221225472;
    v14[2] = __77__CKConversationListCollectionViewController_Banners__removeBanner_animated___block_invoke_2;
    v14[3] = &unk_1E274FBC8;
    v15 = v19;
    v16 = v20;
    v17 = self;
    v13 = v10;
    objc_msgSend(v11, "animateWithDuration:animations:completion:", v18, v14, 0.3);

  }
  else
  {
    objc_msgSend(v6, "removeConstraint:", v9);
    -[CKConversationListCollectionViewController setBannerTopConstraint:](self, "setBannerTopConstraint:", 0);
    -[CKConversationListCollectionViewController setBannerHeight:](self, "setBannerHeight:", 0.0);
    -[CKConversationListCollectionViewController setPresentedBanner:](self, "setPresentedBanner:", 0);
    objc_msgSend(v6, "removeFromSuperview");
    -[CKConversationListCollectionViewController _updateCollectionViewOffsetRemovingBannerViewHeight:](self, "_updateCollectionViewOffsetRemovingBannerViewHeight:", v8);
  }

}

uint64_t __77__CKConversationListCollectionViewController_Banners__removeBanner_animated___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
  objc_msgSend(*(id *)(a1 + 40), "setConstant:", -*(double *)(a1 + 64));
  objc_msgSend(*(id *)(a1 + 32), "setNeedsUpdateConstraints");
  objc_msgSend(*(id *)(a1 + 48), "layoutIfNeeded");
  objc_msgSend(*(id *)(a1 + 56), "setBannerHeight:", 0.0);
  return objc_msgSend(*(id *)(a1 + 56), "_updateCollectionViewOffsetRemovingBannerViewHeight:", *(double *)(a1 + 64));
}

uint64_t __77__CKConversationListCollectionViewController_Banners__removeBanner_animated___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "removeConstraint:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 48), "setBannerTopConstraint:", 0);
  objc_msgSend(*(id *)(a1 + 48), "setPresentedBanner:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
}

- (void)addBanner:(id)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  _QWORD v33[4];
  id v34;
  CKConversationListCollectionViewController *v35;
  id v36;
  double v37;

  v4 = a4;
  v6 = a3;
  -[CKConversationListCollectionViewController presentedBanner](self, "presentedBanner");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[CKConversationListCollectionViewController presentedBanner](self, "presentedBanner");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKConversationListCollectionViewController removeBanner:animated:](self, "removeBanner:animated:", v8, 0);

  }
  objc_msgSend(v6, "superview");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    -[CKConversationListCollectionViewController removeBanner:animated:](self, "removeBanner:animated:", v6, 0);
  -[CKConversationListCollectionViewController view](self, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    -[CKConversationListCollectionViewController setPresentedBanner:](self, "setPresentedBanner:", v6);
    objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 1);
    objc_msgSend(v10, "bounds");
    v12 = v11;
    LODWORD(v11) = 1148846080;
    LODWORD(v13) = 1112014848;
    objc_msgSend(v6, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", v12, 1.79769313e308, v11, v13);
    v15 = v14;
    -[CKConversationListCollectionViewController setBannerHeight:](self, "setBannerHeight:", v14);
    objc_msgSend(v6, "heightAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKConversationListCollectionViewController bannerHeight](self, "bannerHeight");
    objc_msgSend(v16, "constraintEqualToConstant:");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setActive:", 1);

    objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v10, "addSubview:", v6);
    objc_msgSend(v6, "leadingAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "leadingAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "constraintEqualToAnchor:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setActive:", 1);

    objc_msgSend(v6, "trailingAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "trailingAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "constraintEqualToAnchor:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setActive:", 1);

    -[CKConversationListCollectionViewController updateBannerVisualEffectGroup](self, "updateBannerVisualEffectGroup");
    -[CKConversationListCollectionViewController _updateScrollEdgeAppearanceProgress](self, "_updateScrollEdgeAppearanceProgress");
    objc_msgSend(v6, "topAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "safeAreaLayoutGuide");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "topAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      objc_msgSend(v24, "constraintEqualToAnchor:constant:", v26, -v15);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKConversationListCollectionViewController setBannerTopConstraint:](self, "setBannerTopConstraint:", v27);

      -[CKConversationListCollectionViewController bannerTopConstraint](self, "bannerTopConstraint");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "setActive:", 1);

      objc_msgSend(v6, "setAlpha:", 0.0);
      objc_msgSend(v10, "layoutIfNeeded");
      v29 = (void *)MEMORY[0x1E0CEABB0];
      v33[0] = MEMORY[0x1E0C809B0];
      v33[1] = 3221225472;
      v33[2] = __74__CKConversationListCollectionViewController_Banners__addBanner_animated___block_invoke;
      v33[3] = &unk_1E274FBF0;
      v34 = v6;
      v35 = self;
      v36 = v10;
      v37 = v15;
      objc_msgSend(v29, "animateWithDuration:animations:", v33, 0.3);

    }
    else
    {
      objc_msgSend(v24, "constraintEqualToAnchor:constant:", v26, 0.0);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKConversationListCollectionViewController setBannerTopConstraint:](self, "setBannerTopConstraint:", v31);

      -[CKConversationListCollectionViewController bannerTopConstraint](self, "bannerTopConstraint");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "setActive:", 1);

      -[CKConversationListCollectionViewController _updateCollectionViewOffsetAddingBannerViewHeight:](self, "_updateCollectionViewOffsetAddingBannerViewHeight:", v15);
    }
  }
  else
  {
    IMLogHandleForCategory();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      -[CKConversationListCollectionViewController(Banners) addBanner:animated:].cold.1(v6, v30);

  }
}

uint64_t __74__CKConversationListCollectionViewController_Banners__addBanner_animated___block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
  objc_msgSend(*(id *)(a1 + 40), "bannerTopConstraint");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setConstant:", 0.0);

  objc_msgSend(*(id *)(a1 + 32), "setNeedsUpdateConstraints");
  objc_msgSend(*(id *)(a1 + 48), "layoutIfNeeded");
  return objc_msgSend(*(id *)(a1 + 40), "_updateCollectionViewOffsetAddingBannerViewHeight:", *(double *)(a1 + 56));
}

- (id)initForOscarModal
{
  CKConversationListCollectionViewController *v2;
  CKConversationListCollectionViewController *v3;

  v2 = -[CKConversationListCollectionViewController init](self, "init");
  v3 = v2;
  if (v2)
  {
    -[CKConversationListCollectionViewController setOscarModal:](v2, "setOscarModal:", 1);
    -[CKConversationListCollectionViewController setFilterMode:](v3, "setFilterMode:", 9);
  }
  return v3;
}

- (void)oscarViewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  if (-[CKConversationListCollectionViewController isOscarModal](self, "isOscarModal", a3))
  {
    -[CKConversationListCollectionViewController navigationItem](self, "navigationItem");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setLargeTitleDisplayMode:", 2);

  }
  -[CKConversationListCollectionViewController collectionView](self, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "collectionViewLayout");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "invalidateLayout");

  -[CKConversationListCollectionViewController configureForOscarFilter](self, "configureForOscarFilter");
  objc_msgSend(MEMORY[0x1E0D39B48], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sendJunkInboxOpenedEvent");

  objc_msgSend(MEMORY[0x1E0D39958], "sharedInstance");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "trackiMessageJunkEvent:", 3);

}

- (id)toolbarItemsForJunkFilterHasConversations:(BOOL)a3 hasSelectedConversations:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[4];

  v4 = a4;
  v5 = a3;
  v12[3] = *MEMORY[0x1E0C80C00];
  -[CKConversationListCollectionViewController toggleReadButtonItem](self, "toggleReadButtonItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA380]), "initWithBarButtonSystemItem:target:action:", 5, 0, 0);
  -[CKConversationListCollectionViewController _permanentDeleteButtonToUseForSelectedJunkConversations:](self, "_permanentDeleteButtonToUseForSelectedJunkConversations:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setEnabled:", v5);
  v12[0] = v7;
  v12[1] = v8;
  v12[2] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)configureForOscarFilter
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  if (!CKIsRunningInMacCatalyst())
  {
    -[CKConversationListCollectionViewController navigationItem](self, "navigationItem");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setSearchController:", 0);

  }
  -[CKConversationListCollectionViewController setEditingMode:animated:](self, "setEditingMode:animated:", 0, 0);
  -[CKConversationListCollectionViewController _updateForCurrentEditingStateAnimated:](self, "_updateForCurrentEditingStateAnimated:", 0);
  +[CKConversationList sharedConversationList](CKConversationList, "sharedConversationList");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "conversationsForFilterMode:", 9);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  +[CKConversationList sharedConversationList](CKConversationList, "sharedConversationList");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updateEarliestMessageDateForConversations:", v6);

  -[CKConversationListCollectionViewController _setNeedsUpdateContentUnavailableConfiguration](self, "_setNeedsUpdateContentUnavailableConfiguration");
}

- (id)showOscarModalAction
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[5];

  v3 = (void *)MEMORY[0x1E0CEA2A8];
  CKFrameworkBundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("SHOW_OSCAR"), &stru_1E276D870, CFSTR("ChatKit"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:", CFSTR("xmark.bin"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __73__CKConversationListCollectionViewController_Oscar__showOscarModalAction__block_invoke;
  v9[3] = &unk_1E274B178;
  v9[4] = self;
  objc_msgSend(v3, "actionWithTitle:image:identifier:handler:", v5, v6, 0, v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

uint64_t __73__CKConversationListCollectionViewController_Oscar__showOscarModalAction__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_showOscarModalActionTapped");
}

- (void)_showOscarModalActionTapped
{
  id v3;

  v3 = -[CKMessagesController initAsOscarModal]([CKMessagesController alloc], "initAsOscarModal");
  objc_msgSend(v3, "setModalPresentationStyle:", 2);
  objc_msgSend(v3, "setPreferredDisplayMode:", 1);
  -[CKConversationListCollectionViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v3, 1, &__block_literal_global_80);

}

void __80__CKConversationListCollectionViewController_Oscar___showOscarModalActionTapped__block_invoke()
{
  NSObject *v0;
  uint8_t v1[16];

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v0 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v1 = 0;
      _os_log_impl(&dword_18DFCD000, v0, OS_LOG_TYPE_INFO, "Presented modal navigation controller", v1, 2u);
    }

  }
}

- (id)_permanentDeleteButtonToUseForSelectedJunkConversations:(BOOL)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;

  if (a3)
  {
    -[CKConversationListCollectionViewController permanentDeleteSelectedJunkButtonItem](self, "permanentDeleteSelectedJunkButtonItem");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v4)
    {
      v5 = objc_alloc(MEMORY[0x1E0CEA380]);
      CKFrameworkBundle();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("DELETE"), &stru_1E276D870, CFSTR("ChatKit"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)objc_msgSend(v5, "initWithTitle:style:target:action:", v7, 0, self, sel__permanentDeleteSelectedJunkButtonTapped_);

      objc_msgSend(v8, "accessibilitySetIdentification:", CFSTR("deleteSelectedJunkButton"));
      -[CKConversationListCollectionViewController setPermanentDeleteSelectedJunkButtonItem:](self, "setPermanentDeleteSelectedJunkButtonItem:", v8);

    }
    -[CKConversationListCollectionViewController permanentDeleteSelectedJunkButtonItem](self, "permanentDeleteSelectedJunkButtonItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[CKConversationListCollectionViewController permanentDeleteAllJunkButtonItem](self, "permanentDeleteAllJunkButtonItem");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
    {
      v11 = objc_alloc(MEMORY[0x1E0CEA380]);
      CKFrameworkBundle();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("DELETE_ALL"), &stru_1E276D870, CFSTR("ChatKit"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)objc_msgSend(v11, "initWithTitle:style:target:action:", v13, 0, self, sel__permanentDeleteAllJunkButtonTapped_);

      objc_msgSend(v14, "accessibilitySetIdentification:", CFSTR("deleteAllJunkButton"));
      -[CKConversationListCollectionViewController setPermanentDeleteAllJunkButtonItem:](self, "setPermanentDeleteAllJunkButtonItem:", v14);

    }
    -[CKConversationListCollectionViewController permanentDeleteAllJunkButtonItem](self, "permanentDeleteAllJunkButtonItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v9;
}

- (void)_permanentDeleteSelectedJunkButtonTapped:(id)a3
{
  id v4;

  -[CKConversationListCollectionViewController selectedConversations](self, "selectedConversations", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CKConversationListCollectionViewController presentPermanentJunkConversationDeletionConfirmation:](self, "presentPermanentJunkConversationDeletionConfirmation:", v4);

}

- (void)_permanentDeleteAllJunkButtonTapped:(id)a3
{
  void *v4;
  id v5;

  +[CKConversationList sharedConversationList](CKConversationList, "sharedConversationList", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "conversationsForFilterMode:", 9);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  -[CKConversationListCollectionViewController presentPermanentJunkConversationDeletionConfirmation:](self, "presentPermanentJunkConversationDeletionConfirmation:", v5);
}

- (void)presentPermanentJunkConversationDeletionConfirmation:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t);
  void *v10;
  CKConversationListCollectionViewController *v11;
  id v12;

  v4 = a3;
  v7 = MEMORY[0x1E0C809B0];
  v8 = 3221225472;
  v9 = __106__CKConversationListCollectionViewController_Oscar__presentPermanentJunkConversationDeletionConfirmation___block_invoke;
  v10 = &unk_1E274A108;
  v11 = self;
  v12 = v4;
  v5 = v4;
  v6 = _Block_copy(&v7);
  -[CKConversationListCollectionViewController presentPermanentJunkConversationDeletionConfirmation:alertsCompletedBlock:cancelBlock:](self, "presentPermanentJunkConversationDeletionConfirmation:alertsCompletedBlock:cancelBlock:", v5, v6, 0, v7, v8, v9, v10, v11);

}

uint64_t __106__CKConversationListCollectionViewController_Oscar__presentPermanentJunkConversationDeletionConfirmation___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isCollapsed");

  if ((v3 & 1) == 0)
  {
    v4 = *(void **)(a1 + 32);
    objc_msgSend(v4, "collectionView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_deselectSelectedIndexPathsInCollectionView:animated:", v5, 1);

  }
  objc_msgSend(*(id *)(a1 + 32), "setEditingMode:animated:", 0, 1);
  +[CKConversationList sharedConversationList](CKConversationList, "sharedConversationList");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "deleteConversations:", *(_QWORD *)(a1 + 40));

  return objc_msgSend(*(id *)(a1 + 32), "leaveJunkFilterIfNeeded");
}

- (void)presentPermanentJunkConversationDeletionConfirmation:(id)a3 alertsCompletedBlock:(id)a4 cancelBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_opt_new();
  location = 0;
  v12 = objc_initWeak(&location, self);
  v13 = objc_loadWeakRetained(&location);
  objc_msgSend(v11, "presentPermanentJunkDeletionConfirmationFromViewController:forConversations:alertControllerStyle:alertsCompletedBlock:cancelBlock:", self, v8, objc_msgSend(v13, "_alertControllerStyle"), v9, v10);

  objc_destroyWeak(&location);
}

- (void)presentJunkConversationRecoveryConfirmation:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  _QWORD aBlock[4];
  id v10;
  CKConversationListCollectionViewController *v11;
  id location;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  location = 0;
  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __97__CKConversationListCollectionViewController_Oscar__presentJunkConversationRecoveryConfirmation___block_invoke;
  aBlock[3] = &unk_1E274A108;
  v6 = v4;
  v10 = v6;
  v11 = self;
  v7 = _Block_copy(aBlock);
  v8 = objc_loadWeakRetained(&location);
  objc_msgSend(v5, "presentRecoverJunkConversationsConfirmationFromViewController:forConversations:alertControllerStyle:alertsCompletedBlock:cancelBlock:", v8, v6, objc_msgSend(v8, "_alertControllerStyle"), v7, 0);

  objc_destroyWeak(&location);
}

uint64_t __97__CKConversationListCollectionViewController_Oscar__presentJunkConversationRecoveryConfirmation___block_invoke(uint64_t a1)
{
  void *v2;

  +[CKConversationList sharedConversationList](CKConversationList, "sharedConversationList");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "recoverJunkMessagesInConversations:", *(_QWORD *)(a1 + 32));

  return objc_msgSend(*(id *)(a1 + 40), "leaveJunkFilterIfNeeded");
}

- (void)leaveJunkFilterIfNeeded
{
  unint64_t v3;
  int v4;
  NSObject *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  _BOOL4 v9;
  char **v10;
  NSObject *v11;
  uint8_t v12[16];
  uint8_t buf[16];
  uint8_t v14[16];

  v3 = -[CKConversationListCollectionViewController filterMode](self, "filterMode");
  v4 = IMOSLoggingEnabled();
  if (v3 == 9)
  {
    if (v4)
    {
      OSLogHandleForIMFoundationCategory();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18DFCD000, v5, OS_LOG_TYPE_INFO, "Checking if we need to leave the junk inbox", buf, 2u);
      }

    }
    -[CKConversationListCollectionViewController _updateCollectionViewImmediatelyIfNeeded](self, "_updateCollectionViewImmediatelyIfNeeded");
    -[CKConversationListCollectionViewController dataSource](self, "dataSource");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "snapshot");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v7, "numberOfItemsInSection:", &unk_1E2870660) <= 0)
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v12 = 0;
          _os_log_impl(&dword_18DFCD000, v8, OS_LOG_TYPE_INFO, "Junk filtering | Leaving junk filter because no items left in activeConversationSection", v12, 2u);
        }

      }
      v9 = -[CKConversationListCollectionViewController isOscarModal](self, "isOscarModal");
      v10 = &selRef__dismissPresentedNavController_;
      if (!v9)
        v10 = &selRef__popToInbox;
      -[CKConversationListCollectionViewController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", *v10, 0, 0.35);
    }

  }
  else if (v4)
  {
    OSLogHandleForIMFoundationCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v14 = 0;
      _os_log_impl(&dword_18DFCD000, v11, OS_LOG_TYPE_INFO, "CKConversationListCollectionViewController Warning: Not viewing junk conversation controller. Not performing any action", v14, 2u);
    }

  }
}

- (id)junkConversationMenu:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[CKConversationListCollectionViewController _removeFromJunkAction:](self, "_removeFromJunkAction:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKConversationListCollectionViewController _permanentDeleteJunkAction:](self, "_permanentDeleteJunkAction:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v10[0] = v5;
  v10[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA740], "menuWithTitle:image:identifier:options:children:", &stru_1E276D870, 0, 0, 1, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_removeFromJunkAction:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD v12[5];
  id v13;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:", CFSTR("arrow.up.bin"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0CEA2A8];
  CKFrameworkBundle();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("REMOVE_FROM_JUNK"), &stru_1E276D870, CFSTR("ChatKit"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __75__CKConversationListCollectionViewController_Oscar___removeFromJunkAction___block_invoke;
  v12[3] = &unk_1E274F768;
  v12[4] = self;
  v13 = v4;
  v9 = v4;
  objc_msgSend(v6, "actionWithTitle:image:identifier:handler:", v8, v5, 0, v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

uint64_t __75__CKConversationListCollectionViewController_Oscar___removeFromJunkAction___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "presentJunkConversationRecoveryConfirmation:", *(_QWORD *)(a1 + 40));
}

- (id)_permanentDeleteJunkAction:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t);
  void *v15;
  CKConversationListCollectionViewController *v16;
  id v17;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:", CFSTR("trash"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0CEA2A8];
  CKFrameworkBundle();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("DELETE"), &stru_1E276D870, CFSTR("ChatKit"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x1E0C809B0];
  v13 = 3221225472;
  v14 = __80__CKConversationListCollectionViewController_Oscar___permanentDeleteJunkAction___block_invoke;
  v15 = &unk_1E274F768;
  v16 = self;
  v17 = v4;
  v9 = v4;
  objc_msgSend(v6, "actionWithTitle:image:identifier:handler:", v8, v5, 0, &v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!CKIsRunningInMacCatalyst())
    objc_msgSend(v10, "setAttributes:", 2, v12, v13, v14, v15, v16, v17);

  return v10;
}

uint64_t __80__CKConversationListCollectionViewController_Oscar___permanentDeleteJunkAction___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "presentPermanentJunkConversationDeletionConfirmation:", *(_QWORD *)(a1 + 40));
}

id __87__CKConversationListCollectionViewController_DataSource__dataSourceWithCollectionView___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id *v6;
  id v7;
  id v8;
  id v9;
  id WeakRetained;
  void *v11;

  v6 = (id *)(a1 + 32);
  v7 = a4;
  v8 = a3;
  v9 = a2;
  WeakRetained = objc_loadWeakRetained(v6);
  objc_msgSend(WeakRetained, "supplementaryViewForIndexPath:inCollectionView:withKind:", v7, v9, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

uint64_t __87__CKConversationListCollectionViewController_DataSource__dataSourceWithCollectionView___block_invoke_3()
{
  return 0;
}

void __87__CKConversationListCollectionViewController_DataSource__dataSourceWithCollectionView___block_invoke_4(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "didReorderConversationsWithTransaction:", v3);

}

- (id)supplementaryViewForIndexPath:(id)a3 inCollectionView:(id)a4 withKind:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (-[CKConversationListCollectionViewController filterMode](self, "filterMode") == 7)
  {
    +[CKRecoverableSectionDisclosureView reuseIdentifier](CKRecoverableSectionDisclosureView, "reuseIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "dequeueReusableSupplementaryViewOfKind:withReuseIdentifier:forIndexPath:", v10, v11, v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "configureForRecentlyDeleted");
  }
  else if (-[CKConversationListCollectionViewController filterMode](self, "filterMode") == 9)
  {
    +[CKRecoverableSectionDisclosureView reuseIdentifier](CKRecoverableSectionDisclosureView, "reuseIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "dequeueReusableSupplementaryViewOfKind:withReuseIdentifier:forIndexPath:", v10, v13, v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "configureForJunkFiltering");
  }
  else
  {
    +[CKPinnedSectionSeparatorView reuseIdentifier](CKPinnedSectionSeparatorView, "reuseIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "dequeueReusableSupplementaryViewOfKind:withReuseIdentifier:forIndexPath:", v10, v14, v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v12;
}

- (id)cellForPinningOnboardingTitleViewCollectionView:(id)a3 atIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  +[CKPinningOnboardingTitleCell reuseIdentifier](CKPinningOnboardingTitleCell, "reuseIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", v8, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[CKConversationListCollectionViewController configureOnboardingTitleCell:](self, "configureOnboardingTitleCell:", v9);
  return v9;
}

- (void)configureOnboardingTitleCell:(id)a3
{
  id v4;
  int64_t v5;
  id v6;

  v4 = a3;
  v5 = -[CKConversationListCollectionViewController pinnedConversationViewLayoutStyle](self, "pinnedConversationViewLayoutStyle");
  -[CKConversationListCollectionViewController delegate](self, "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPinnedConversationViewLayoutStyle:collapsedState:", v5, objc_msgSend(v6, "isCollapsed"));

}

- (id)cellForCollapsedSidebarFocusFilterCellInCollectionView:(id)a3 atIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  +[CKFocusFilterBannerCollapsedCollectionViewCell reuseIdentifier](CKFocusFilterBannerCollapsedCollectionViewCell, "reuseIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", v8, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[CKConversationListCollectionViewController configureFocusFilterCollapsedCell:](self, "configureFocusFilterCollapsedCell:", v9);
  return v9;
}

- (id)cellForFocusFilterInCollectionView:(id)a3 atIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  +[CKFocusFilterBannerCollectionViewCell reuseIdentifier](CKFocusFilterBannerCollectionViewCell, "reuseIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", v8, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[CKConversationListCollectionViewController configureFocusFilterCell:](self, "configureFocusFilterCell:", v9);
  return v9;
}

- (id)tipKitOnboardingCollectionView:(id)a3 atIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  +[CKTipKitOnboardingCollectionViewCell reuseIdentifier](CKTipKitOnboardingCollectionViewCell, "reuseIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", v8, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[CKConversationListCollectionViewController configureTipKitOnboardingCell:](self, "configureTipKitOnboardingCell:", v9);
  return v9;
}

- (id)tipCollectionViewCell:(id)a3 atIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  +[CKTipCollectionViewCell reuseIdentifier](_TtC7ChatKit23CKTipCollectionViewCell, "reuseIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", v8, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[CKConversationListCollectionViewController configureTipCollectionViewCell:](self, "configureTipCollectionViewCell:", v9);
  return v9;
}

- (void)configureTipKitOnboardingCell:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[CKConversationListCollectionViewController tipManager](self, "tipManager");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "miniTipUIView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKConversationListCollectionViewController recommendedPinningConversations](self, "recommendedPinningConversations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTipUIView:withRecommendedPinningConversations:", v5, v6);

}

- (void)configureTipCollectionViewCell:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[CKConversationListCollectionViewController tipManager](self, "tipManager");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "miniTipUIView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTipHostingView:", v5);

}

- (id)cellForPinnedConversationWithItemIdentifier:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v8 = a3;
  v9 = a5;
  v10 = a4;
  +[CKPinnedConversationCollectionViewCell reuseIdentifier](CKPinnedConversationCollectionViewCell, "reuseIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", v11, v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[CKConversationListCollectionViewController conversationForItemIdentifier:](self, "conversationForItemIdentifier:", v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKConversationListCollectionViewController previousPinnedConversationActivitySnapshotForConversation:](self, "previousPinnedConversationActivitySnapshotForConversation:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    objc_msgSend(v12, "pinnedConversationView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "reapplyPreviouslyDisplayedActivitySnapshot:", v14);

  }
  -[CKConversationListCollectionViewController _configurePinnedConversationCell:forConversation:itemIdentifier:indexPath:animated:](self, "_configurePinnedConversationCell:forConversation:itemIdentifier:indexPath:animated:", v12, v13, v8, v9, v14 != 0);

  return v12;
}

- (void)configurePinnedConversationCell:(id)a3 forItemIdentifier:(id)a4 indexPath:(id)a5 animated:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  id v12;
  id v13;

  v6 = a6;
  v10 = a5;
  v11 = a4;
  v12 = a3;
  -[CKConversationListCollectionViewController conversationForItemIdentifier:](self, "conversationForItemIdentifier:", v11);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  -[CKConversationListCollectionViewController _configurePinnedConversationCell:forConversation:itemIdentifier:indexPath:animated:](self, "_configurePinnedConversationCell:forConversation:itemIdentifier:indexPath:animated:", v12, v13, v11, v10, v6);

  objc_msgSend(v12, "configureAppEntityForConversation:", v13);
}

- (void)_configurePinnedConversationCell:(id)a3 forConversation:(id)a4 itemIdentifier:(id)a5 indexPath:(id)a6 animated:(BOOL)a7
{
  _BOOL8 v7;
  id v12;
  id v13;
  id v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  void *v24;
  unint64_t v25;
  void *v26;
  void *v27;
  int v28;
  void *v29;
  void *v30;
  char v31;
  void *v32;
  int v33;
  void *v34;
  void *v35;
  uint64_t v36;
  double v37;
  void *v38;
  id v39;

  v7 = a7;
  v39 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  objc_msgSend(v39, "pinnedConversationView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setDelegate:", self);
  objc_msgSend(v15, "setShowsLiveActivity:", 1);
  objc_msgSend(v15, "setActivityItemOriginationDirection:", -[CKConversationListCollectionViewController _activityItemOriginationDirectionForItemIdentifier:conversation:](self, "_activityItemOriginationDirectionForItemIdentifier:conversation:", v13, v12));
  objc_msgSend(v15, "setLayoutStyle:", -[CKConversationListCollectionViewController pinnedConversationViewLayoutStyle](self, "pinnedConversationViewLayoutStyle"));
  -[CKConversationListCollectionViewController _activityItemTopInsetForIndexPath:](self, "_activityItemTopInsetForIndexPath:", v14);
  v17 = v16;

  objc_msgSend(v15, "setActivityItemTopInset:", v17);
  -[CKConversationListCollectionViewController delegate](self, "delegate");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setShowsBackgroundViewWhenSelected:", objc_msgSend(v18, "isCollapsed") ^ 1);

  -[CKConversationListCollectionViewController delegate](self, "delegate");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setAllowActivitySuppressionWhenSelected:", objc_msgSend(v19, "isCollapsed") ^ 1);

  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "conversationPinningUsesLastNameForDuplicatesEnabled");

  if (v21)
  {
    -[CKConversationListCollectionViewController _pinnedConversationShortNames](self, "_pinnedConversationShortNames");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "pinnedConversationDisplayNamePreferringShortName:", 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setPreferShortConversationName:", objc_msgSend(v22, "countForObject:", v23) < 2);

  }
  else
  {
    objc_msgSend(v15, "setPreferShortConversationName:", 1);
  }
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "messageCountToLoadForPinnedConversationsIfNecessary");

  if (!objc_msgSend(v12, "hasUnreadMessages") || v25 <= objc_msgSend(v12, "limitToLoad"))
    goto LABEL_12;
  objc_msgSend(v12, "chat");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "lastIncomingFinishedMessage");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v12, "isGroupConversation"))
  {
    v28 = objc_msgSend(v12, "isAdHocGroupConversation") ^ 1;
    if (!v27)
      goto LABEL_11;
LABEL_10:
    if (!v28)
      goto LABEL_12;
    goto LABEL_11;
  }
  v28 = 0;
  if (v27)
    goto LABEL_10;
LABEL_11:
  objc_msgSend(v12, "setLoadedMessageCount:", v25);
LABEL_12:
  -[CKConversationListCollectionViewController _recentMessagesInPinnedConversations](self, "_recentMessagesInPinnedConversations");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setConversation:", v12);
  objc_msgSend(v15, "setRecentMessagesInPinnedConversations:", v29);
  objc_msgSend(v12, "chat");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(v30, "allowedByScreenTime");

  if ((v31 & 1) != 0)
    objc_msgSend(v15, "endSuppressingActivityWithReason:animated:completion:", CFSTR("ScreenTime"), v7, 0);
  else
    objc_msgSend(v15, "beginSuppressingActivityWithReason:animated:completion:", CFSTR("ScreenTime"), v7, 0);
  -[CKConversationListCollectionViewController itemIdentifiersForVisibleContextMenuInteractions](self, "itemIdentifiersForVisibleContextMenuInteractions");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend(v32, "containsObject:", v13);

  if (v33)
  {
    objc_msgSend(v39, "pinnedConversationView");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setDimmed:", 0);

    objc_msgSend(v15, "beginSuppressingActivityWithReason:animated:completion:", CFSTR("ContextMenuInteraction"), v7, 0);
  }
  else
  {
    objc_msgSend(v15, "endSuppressingActivityWithReason:animated:completion:", CFSTR("ContextMenuInteraction"), v7, 0);
  }
  objc_msgSend(MEMORY[0x1E0D39850], "sharedManager");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v35, "shouldFilterConversationsByFocus"))
    v36 = objc_msgSend(v12, "allowedByPersonListInActiveFocus") ^ 1;
  else
    v36 = 0;
  objc_msgSend(v15, "setIsFilteredByFocus:animated:", v36, v7);
  objc_msgSend(v39, "setDelegate:", self);
  objc_msgSend(v39, "setEditingMode:animated:", -[CKConversationListCollectionViewController editingMode](self, "editingMode"), v7);
  if (-[CKConversationListCollectionViewController hidePinsForAnimation](self, "hidePinsForAnimation"))
    v37 = 0.0;
  else
    v37 = 1.0;
  objc_msgSend(v39, "contentView");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setAlpha:", v37);

  objc_msgSend(v15, "updateActivityViewAnimated:completion:", v7, 0);
}

- (double)_activityItemTopInsetForIndexPath:(id)a3
{
  id v3;
  double v4;

  v3 = a3;
  if (CKIsRunningInMacCatalyst())
  {
    if ((unint64_t)(objc_msgSend(v3, "item") + 2) >= 5)
      v4 = 0.0;
    else
      v4 = 5.0;
  }
  else
  {
    v4 = 0.0;
  }

  return v4;
}

- (int64_t)_activityItemOriginationDirectionForItemIdentifier:(id)a3 conversation:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  int64_t v14;

  v6 = a3;
  v7 = a4;
  -[CKConversationListCollectionViewController dataSource](self, "dataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "snapshot");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "numberOfItemsInSection:", &unk_1E28707E0);

  -[CKConversationListCollectionViewController dataSource](self, "dataSource");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "indexPathForItemIdentifier:", v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10 < 2)
    goto LABEL_4;
  v13 = objc_msgSend(v12, "item");
  if (v10 != 2)
  {
    if (v13 % 3 != 1)
      goto LABEL_4;
LABEL_6:
    v14 = -[CKConversationListCollectionViewController _isOnlyActivityItemInRowForConversation:itemIdentifier:](self, "_isOnlyActivityItemInRowForConversation:itemIdentifier:", v7, v6) ^ 1;
    goto LABEL_7;
  }
  if (v13 == 1)
    goto LABEL_6;
LABEL_4:
  v14 = 0;
LABEL_7:

  return v14;
}

- (BOOL)_conversationHasActivityItem:(id)a3
{
  id v3;
  char v4;
  void *v5;
  void *v6;

  v3 = a3;
  if ((objc_msgSend(v3, "hasUnreadMessages") & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    objc_msgSend(v3, "chat");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "lastIncomingMessage");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v6, "isTypingMessage");

  }
  return v4;
}

- (BOOL)_isOnlyActivityItemInRowForConversation:(id)a3 itemIdentifier:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  BOOL v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (-[CKConversationListCollectionViewController _conversationHasActivityItem:](self, "_conversationHasActivityItem:", a3))
  {
    -[CKConversationListCollectionViewController _conversationsInRowOfItemIdentifier:](self, "_conversationsInRowOfItemIdentifier:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v8)
    {
      v9 = v8;
      v10 = 0;
      v11 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v16 != v11)
            objc_enumerationMutation(v7);
          v10 += -[CKConversationListCollectionViewController _conversationHasActivityItem:](self, "_conversationHasActivityItem:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i));
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v9);
      v13 = v10 == 1;
    }
    else
    {
      v13 = 0;
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)_conversationsInRowOfItemIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[CKConversationListCollectionViewController dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "indexPathForItemIdentifier:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "item");
  -[CKConversationListCollectionViewController dataSource](self, "dataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "snapshot");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "itemIdentifiersInSectionWithIdentifier:", &unk_1E28707E0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v10, "count");
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "conversationListLayoutPinnedSectionNumberOfColumns");

  v14 = v7 / v13 * v13;
  if (v13 >= (unint64_t)(v11 - v14))
    v15 = v11 - v14;
  else
    v15 = v13;
  objc_msgSend(v10, "subarrayWithRange:", v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v18 = v16;
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v27;
    do
    {
      v22 = 0;
      do
      {
        if (*(_QWORD *)v27 != v21)
          objc_enumerationMutation(v18);
        -[CKConversationListCollectionViewController conversationForItemIdentifier:](self, "conversationForItemIdentifier:", *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * v22), (_QWORD)v26);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        if (v23)
          objc_msgSend(v17, "addObject:", v23);

        ++v22;
      }
      while (v20 != v22);
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v20);
  }

  v24 = (void *)objc_msgSend(v17, "copy");
  return v24;
}

- (id)_recentMessagesInPinnedConversations
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[CKConversationListCollectionViewController pinnedConversations](self, "pinnedConversations", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v8), "chat");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "lastIncomingFinishedMessage");
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (v10 && (objc_msgSend(v10, "isRead") & 1) == 0)
          objc_msgSend(v3, "addObject:", v10);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

  objc_msgSend(v3, "sortUsingComparator:", &__block_literal_global_72_2);
  v11 = (void *)objc_msgSend(v3, "copy");

  return v11;
}

uint64_t __94__CKConversationListCollectionViewController_DataSource___recentMessagesInPinnedConversations__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  return objc_msgSend(a2, "compare:comparisonType:", a3, 3);
}

- (id)_pinnedConversationShortNames
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0CB3550]);
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[CKConversationListCollectionViewController pinnedConversations](self, "pinnedConversations", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v8), "pinnedConversationDisplayNamePreferringShortName:", 1);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
          objc_msgSend(v3, "addObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  return v3;
}

- (id)cellForPinnedConversationDropTargetInCollectionView:(id)a3 atIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  +[CKPinnedConversationDropTargetCollectionViewCell reuseIdentifier](CKPinnedConversationDropTargetCollectionViewCell, "reuseIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", v8, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[CKConversationListCollectionViewController configureDropTargetCell:](self, "configureDropTargetCell:", v9);
  return v9;
}

- (void)configureDropTargetCell:(id)a3
{
  unint64_t v4;
  _BOOL8 v5;
  id v6;

  v6 = a3;
  objc_msgSend(v6, "setLayoutStyle:", -[CKConversationListCollectionViewController pinnedConversationViewLayoutStyle](self, "pinnedConversationViewLayoutStyle"));
  v4 = -[CKConversationListCollectionViewController editingMode](self, "editingMode");
  v5 = v4 == 2;
  objc_msgSend(v6, "setShouldAnimateCircle:", v4 != 2);
  objc_msgSend(v6, "setShouldHideLabel:", v5);

}

- (id)newMessageCellInCollectionView:(id)a3 atIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  +[CKConversationListNewMessageCollectionViewCell reuseIdentifier](CKConversationListNewMessageCollectionViewCell, "reuseIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", v8, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[CKConversationListCollectionViewController configureNewMessageCell:](self, "configureNewMessageCell:", v9);
  return v9;
}

- (void)configureNewMessageCell:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[CKConversationListCollectionViewController delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setShouldUseSidebarBackgroundConfiguration:", objc_msgSend(v4, "isCollapsed") ^ 1);

  objc_msgSend(v7, "setDelegate:", self);
  objc_msgSend(v7, "updateFontSize");
  if (v7)
  {
    -[CKConversationListCollectionViewController conversationList](self, "conversationList");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "pendingConversation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "updateContentsForConversation:", v6);

  }
}

- (id)cellPinningOnboardingItemIdentifier:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  +[CKConversationListCollectionViewConversationCell reuseIdentifier](CKConversationListCollectionViewConversationCell, "reuseIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", v11, v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[CKConversationListCollectionViewController _ensureCellLayoutOnCell:](self, "_ensureCellLayoutOnCell:", v12);
  -[CKConversationListCollectionViewController configureConversationCell:forItemIdentifier:](self, "configureConversationCell:forItemIdentifier:", v12, v10);

  return v12;
}

- (id)cellForRecoverableConversationWithItemIdentifier:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  __objc2_class **v12;
  void *v13;
  void *v14;

  v8 = a4;
  v9 = a5;
  v10 = a3;
  if (-[CKConversationListCollectionViewController filterMode](self, "filterMode") == 9)
  {
    -[CKConversationListCollectionViewController junkCellLayout](self, "junkCellLayout");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = off_1E2732F40;
  }
  else
  {
    if (-[CKConversationListCollectionViewController filterMode](self, "filterMode") != 7)
    {
      v14 = 0;
      goto LABEL_7;
    }
    -[CKConversationListCollectionViewController standardCellLayout](self, "standardCellLayout");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = off_1E2732F50;
  }
  -[CKConversationListCollectionViewController setCellLayout:](self, "setCellLayout:", v11);

  -[__objc2_class reuseIdentifier](*v12, "reuseIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", v13, v9);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_7:
  -[CKConversationListCollectionViewController _ensureCellLayoutOnCell:](self, "_ensureCellLayoutOnCell:", v14);
  -[CKConversationListCollectionViewController configureRecoverableConversationCell:forItemIdentifier:](self, "configureRecoverableConversationCell:forItemIdentifier:", v14, v10);

  return v14;
}

- (void)configureAppEntityForConversationCell:(id)a3 forItemIdentifier:(id)a4
{
  id v6;
  id v7;

  v6 = a3;
  -[CKConversationListCollectionViewController conversationForItemIdentifier:](self, "conversationForItemIdentifier:", a4);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "configureAppEntityForConversation:", v7);

}

- (void)configureRecoverableConversationCell:(id)a3 forItemIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  -[CKConversationListCollectionViewController _ensureCellLayoutOnCell:](self, "_ensureCellLayoutOnCell:", v7);
  -[CKConversationListCollectionViewController conversationForItemIdentifier:](self, "conversationForItemIdentifier:", v6);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setEmbeddedCellDelegate:", self);
  objc_msgSend(v7, "updateContentsForConversation:fastPreview:", v9, -[CKConversationListCollectionViewController shouldUseFastPreviewText](self, "shouldUseFastPreviewText"));
  -[CKConversationListCollectionViewController delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setShouldUseSidebarBackgroundConfiguration:", objc_msgSend(v8, "isCollapsed") ^ 1);

  objc_msgSend(v7, "setEditingMode:", -[CKConversationListCollectionViewController editingMode](self, "editingMode"));
  objc_msgSend(v7, "setDelegate:", self);

}

- (void)avatarViewTapped:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  -[CKConversationListCollectionViewController collectionView](self, "collectionView");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "originatingItemIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[CKConversationListCollectionViewController dataSource](self, "dataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "indexPathForItemIdentifier:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "selectItemAtIndexPath:animated:scrollPosition:", v7, 0, 0);
  objc_msgSend(v9, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "collectionView:didSelectItemAtIndexPath:", v9, v7);

}

- (id)pinnedConversationIdentifiers
{
  void *v2;
  void *v3;

  -[CKConversationListCollectionViewController pinnedConversations](self, "pinnedConversations");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "arrayByApplyingSelector:", sel_pinningIdentifier);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_allFrozenConversations
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  -[CKConversationListCollectionViewController frozenPinnedConversations](self, "frozenPinnedConversations");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKConversationListCollectionViewController frozenConversations](self, "frozenConversations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3 && v4)
  {
    objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v4);
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else if (v3)
  {
    v6 = v3;
  }
  else
  {
    if (!v4)
    {
      v7 = 0;
      goto LABEL_9;
    }
    v6 = v4;
  }
  v7 = v6;
LABEL_9:

  return v7;
}

- (void)_removeConversationsFromFrozenConversations:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0CB3880];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __102__CKConversationListCollectionViewController_DataSource___removeConversationsFromFrozenConversations___block_invoke;
  v12[3] = &unk_1E2755280;
  v13 = v4;
  v6 = v4;
  objc_msgSend(v5, "predicateWithBlock:", v12);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKConversationListCollectionViewController frozenPinnedConversations](self, "frozenPinnedConversations");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "filteredArrayUsingPredicate:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[CKConversationListCollectionViewController setFrozenPinnedConversations:](self, "setFrozenPinnedConversations:", v9);
  -[CKConversationListCollectionViewController frozenConversations](self, "frozenConversations");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "filteredArrayUsingPredicate:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[CKConversationListCollectionViewController setFrozenConversations:](self, "setFrozenConversations:", v11);
}

uint64_t __102__CKConversationListCollectionViewController_DataSource___removeConversationsFromFrozenConversations___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  char v12;
  uint64_t v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "chat");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "guid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = *(id *)(a1 + 32);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    while (2)
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v9), "chat", (_QWORD)v15);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "guid");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isEqualToString:", v4);

        if ((v12 & 1) != 0)
        {
          v13 = 0;
          goto LABEL_11;
        }
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v7)
        continue;
      break;
    }
  }
  v13 = 1;
LABEL_11:

  return v13;
}

- (id)conversationsAtIndexPaths:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        -[CKConversationListCollectionViewController conversationAtIndexPath:](self, "conversationAtIndexPath:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v10), (_QWORD)v14);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
          objc_msgSend(v5, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  v12 = (void *)objc_msgSend(v5, "copy");
  return v12;
}

- (BOOL)_messageSpamFilteringEnabled
{
  return CKMessageSpamFilteringEnabled() != 0;
}

- (void)_appendRecentlyDeletedIdentifersToSnapshot:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[CKConversationListCollectionViewController conversationList](self, "conversationList");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "conversationsForFilterMode:", 7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[CKConversationListCollectionViewController itemIdentifiersForConversations:inSection:](self, "itemIdentifiersForConversations:inSection:", v5, 6);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count"))
    objc_msgSend(v7, "appendItemsWithIdentifiers:", v6);

}

- (void)updateContentsOfCellsWithItemIdentifiers:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
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

  v4 = a4;
  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        -[CKConversationListCollectionViewController updateContentsOfCellWithItemIdentifier:animated:](self, "updateContentsOfCellWithItemIdentifier:animated:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v10++), v4);
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

- (id)pinnedConversationsFromSnapshot:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v17 = v4;
  objc_msgSend(v4, "itemIdentifiersInSectionWithIdentifier:", &unk_1E28707E0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v19;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v19 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v10);
        +[CKPinnedConversationDropTargetCollectionViewCell uniqueIdentifier](CKPinnedConversationDropTargetCollectionViewCell, "uniqueIdentifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v11, "isEqualToString:", v12);

        if ((v13 & 1) == 0)
        {
          -[CKConversationListCollectionViewController conversationForItemIdentifier:](self, "conversationForItemIdentifier:", v11);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (v14)
            objc_msgSend(v5, "addObject:", v14);

        }
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v8);
  }
  v15 = (void *)objc_msgSend(v5, "copy");

  return v15;
}

- (BOOL)itemIdentifierIsFromPinnedSection:(id)a3
{
  return objc_msgSend(a3, "hasPrefix:", CFSTR("pinned-"));
}

- (id)conversationsForItemIdentifiers:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        -[CKConversationListCollectionViewController conversationForItemIdentifier:](self, "conversationForItemIdentifier:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v10), (_QWORD)v14);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
          objc_msgSend(v5, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  v12 = (void *)objc_msgSend(v5, "copy");
  return v12;
}

- (double)yCoordinateForBorderBetweenPinnedAndActiveSectionExcludingConversations:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double MinY;
  void *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  void *j;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  uint8_t v32[16];
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
  uint64_t v43;
  CGRect v44;
  CGRect v45;

  v43 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[CKConversationListCollectionViewController dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "snapshot");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  MinY = 0.0;
  if (objc_msgSend(v6, "indexOfSectionIdentifier:", &unk_1E2870858) == 0x7FFFFFFFFFFFFFFFLL)
    goto LABEL_22;
  objc_msgSend(v6, "itemIdentifiersInSectionWithIdentifier:", &unk_1E2870858);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKConversationListCollectionViewController itemIdentifiersForConversations:inSection:](self, "itemIdentifiersForConversations:inSection:", v4, 5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v10 = v8;
  v11 = (id)objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v38;
    while (2)
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v38 != v12)
          objc_enumerationMutation(v10);
        v14 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * (_QWORD)i);
        if ((objc_msgSend(v9, "containsObject:", v14) & 1) == 0)
        {
          v11 = v14;
          goto LABEL_12;
        }
      }
      v11 = (id)objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
      if (v11)
        continue;
      break;
    }
  }
LABEL_12:

  if (objc_msgSend(v11, "length"))
  {
    -[CKConversationListCollectionViewController dataSource](self, "dataSource");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "indexPathForItemIdentifier:", v11);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      -[CKConversationListCollectionViewController collectionView](self, "collectionView");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "layoutAttributesForItemAtIndexPath:", v16);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (v18)
      {
        objc_msgSend(v18, "frame");
        MinY = CGRectGetMinY(v44);
      }
      else
      {
        MinY = 0.0;
      }

    }
    else
    {
      MinY = 0.0;
    }

  }
  else
  {
    MinY = 0.0;
  }

  if (MinY == 0.0)
  {
LABEL_22:
    if (objc_msgSend(v6, "indexOfSectionIdentifier:", &unk_1E28707E0) != 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(v6, "itemIdentifiersInSectionWithIdentifier:", &unk_1E28707E0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKConversationListCollectionViewController itemIdentifiersForConversations:inSection:](self, "itemIdentifiersForConversations:inSection:", v4, 2);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = 0u;
      v36 = 0u;
      v33 = 0u;
      v34 = 0u;
      objc_msgSend(v19, "reverseObjectEnumerator");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = (id)objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
      if (v22)
      {
        v23 = *(_QWORD *)v34;
        while (2)
        {
          for (j = 0; j != v22; j = (char *)j + 1)
          {
            if (*(_QWORD *)v34 != v23)
              objc_enumerationMutation(v21);
            v25 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * (_QWORD)j);
            if ((objc_msgSend(v20, "containsObject:", v25) & 1) == 0)
            {
              v22 = v25;
              goto LABEL_33;
            }
          }
          v22 = (id)objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
          if (v22)
            continue;
          break;
        }
      }
LABEL_33:

      if (objc_msgSend(v22, "length"))
      {
        -[CKConversationListCollectionViewController dataSource](self, "dataSource");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "indexPathForItemIdentifier:", v22);
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        if (v27)
        {
          -[CKConversationListCollectionViewController collectionView](self, "collectionView");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "layoutAttributesForItemAtIndexPath:", v27);
          v29 = (void *)objc_claimAutoreleasedReturnValue();

          if (v29)
          {
            objc_msgSend(v29, "frame");
            MinY = CGRectGetMaxY(v45);
          }

        }
      }

    }
  }
  if (MinY == 0.0 && IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v32 = 0;
      _os_log_impl(&dword_18DFCD000, v30, OS_LOG_TYPE_INFO, "Could not determine yCoordinateForBorderBetweenPinnedAndActiveSection.", v32, 2u);
    }

  }
  return MinY;
}

- (CGRect)pinnedConversationMultitaskingDragExclusionRect
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  CGRect result;

  v3 = *MEMORY[0x1E0C9D648];
  v4 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v5 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v6 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  -[CKConversationListCollectionViewController yCoordinateForBorderBetweenPinnedAndActiveSectionExcludingConversations:](self, "yCoordinateForBorderBetweenPinnedAndActiveSectionExcludingConversations:", MEMORY[0x1E0C9AA60]);
  if (v7 != 0.0)
  {
    v8 = v7;
    -[CKConversationListCollectionViewController collectionView](self, "collectionView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "contentInset");
    v11 = v8 - v10;
    if (v11 > 0.0)
    {
      v12 = v10;
      objc_msgSend(v9, "bounds");
      v14 = v13;
      objc_msgSend(v9, "bounds");
      v16 = v15;
      -[CKConversationListCollectionViewController view](self, "view");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKConversationListCollectionViewController collectionView](self, "collectionView");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "convertRect:fromView:", v18, v14, v12, v16, v11);
      v3 = v19;
      v4 = v20;
      v5 = v21;
      v6 = v22;

    }
  }
  v23 = v3;
  v24 = v4;
  v25 = v5;
  v26 = v6;
  result.size.height = v26;
  result.size.width = v25;
  result.origin.y = v24;
  result.origin.x = v23;
  return result;
}

- (id)nextSequentialIndexPathForIndexPath:(id)a3 descending:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t j;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];
  _BYTE v51[128];
  uint64_t v52;

  v4 = a4;
  v52 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[CKConversationListCollectionViewController dataSource](self, "dataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "snapshot");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    v44 = 0uLL;
    v45 = 0uLL;
    *((_QWORD *)&v42 + 1) = 0;
    v43 = 0uLL;
    objc_msgSend(&unk_1E286F6E8, "reverseObjectEnumerator", 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v42, v50, 16);
    if (!v19)
      goto LABEL_26;
    v20 = v19;
    v21 = *(_QWORD *)v43;
    while (1)
    {
      for (i = 0; i != v20; ++i)
      {
        if (*(_QWORD *)v43 != v21)
          objc_enumerationMutation(v18);
        v23 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
        v24 = objc_msgSend(v8, "numberOfItemsInSection:", v23);
        v25 = v24 - 1;
        if (v24 >= 1)
        {
          v26 = objc_msgSend(v6, "section");
          if (v26 >= objc_msgSend(v23, "integerValue"))
          {
            v27 = objc_msgSend(v6, "section");
            if (v27 != objc_msgSend(v23, "integerValue"))
            {
              v28 = (void *)MEMORY[0x1E0CB36B0];
              v29 = objc_msgSend(v23, "integerValue");
              v30 = v28;
              v31 = v25;
LABEL_35:
              objc_msgSend(v30, "indexPathForItem:inSection:", v31, v29);
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              goto LABEL_36;
            }
            if (objc_msgSend(v6, "item") >= 1)
            {
              v38 = objc_msgSend(v6, "item");
              if (v38 - 1 >= v25)
                v39 = v25;
              else
                v39 = v38 - 1;
              v40 = (void *)MEMORY[0x1E0CB36B0];
              v29 = objc_msgSend(v23, "integerValue");
              v30 = v40;
              v31 = v39;
              goto LABEL_35;
            }
          }
        }
      }
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v42, v50, 16);
      if (!v20)
      {
LABEL_26:
        v17 = 0;
LABEL_36:

        goto LABEL_37;
      }
    }
  }
  v48 = 0uLL;
  v49 = 0uLL;
  v46 = 0uLL;
  v47 = 0uLL;
  v9 = objc_msgSend(&unk_1E286F6E8, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
  if (!v9)
  {
    v17 = 0;
    goto LABEL_37;
  }
  v10 = v9;
  v11 = *(_QWORD *)v47;
  while (2)
  {
    for (j = 0; j != v10; ++j)
    {
      if (*(_QWORD *)v47 != v11)
        objc_enumerationMutation(&unk_1E286F6E8);
      v13 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * j);
      v14 = objc_msgSend(v8, "numberOfItemsInSection:", v13);
      v15 = objc_msgSend(v6, "section");
      if (v15 <= objc_msgSend(v13, "integerValue"))
      {
        v16 = objc_msgSend(v6, "section");
        if (v16 == objc_msgSend(v13, "integerValue"))
        {
          if (objc_msgSend(v6, "item") < v14 - 1)
          {
            v32 = (void *)MEMORY[0x1E0CB36B0];
            v33 = objc_msgSend(v6, "item") + 1;
            v34 = objc_msgSend(v13, "integerValue");
            v35 = v32;
            v36 = v33;
LABEL_30:
            objc_msgSend(v35, "indexPathForItem:inSection:", v36, v34);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            goto LABEL_37;
          }
        }
        else if (v14 >= 1)
        {
          v37 = (void *)MEMORY[0x1E0CB36B0];
          v34 = objc_msgSend(v13, "integerValue");
          v35 = v37;
          v36 = 0;
          goto LABEL_30;
        }
      }
    }
    v10 = objc_msgSend(&unk_1E286F6E8, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
    v17 = 0;
    if (v10)
      continue;
    break;
  }
LABEL_37:

  return v17;
}

- (int64_t)distanceBetweenConversationIndexPath:(id)a3 andIndexPath:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v6, "section");
  if (v8 == objc_msgSend(v7, "section"))
  {
    v9 = objc_msgSend(v7, "item");
    v10 = objc_msgSend(v6, "item");
    if (v9 - v10 >= 0)
      v11 = v9 - v10;
    else
      v11 = v10 - v9;
  }
  else
  {
    v12 = objc_msgSend(v6, "section");
    v13 = objc_msgSend(v7, "section");
    if (v12 >= v13)
      v14 = v7;
    else
      v14 = v6;
    if (v12 >= v13)
      v15 = v6;
    else
      v15 = v7;
    v16 = v14;
    v17 = v15;
    -[CKConversationListCollectionViewController dataSource](self, "dataSource");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "snapshot");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = objc_msgSend(v16, "section");
    if (v20 <= objc_msgSend(v17, "section"))
    {
      v11 = 0;
      do
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v19, "numberOfItemsInSection:", v21);

        if (v20 == objc_msgSend(v16, "section"))
          v11 = v22 + v11 - objc_msgSend(v16, "item");
        if (v20 == objc_msgSend(v17, "section"))
          v22 = objc_msgSend(v17, "item");
        v11 += v22;
      }
      while (v20++ < objc_msgSend(v17, "section"));
    }
    else
    {
      v11 = 0;
    }

  }
  return v11;
}

- (int64_t)numberOfConversations
{
  void *v2;
  int64_t v3;

  -[CKConversationListCollectionViewController activeConversations](self, "activeConversations");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (id)selectedConversations
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v13[5];
  id v14;

  v3 = (void *)MEMORY[0x1E0C99DE8];
  -[CKConversationListCollectionViewController collectionView](self, "collectionView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "indexPathsForSelectedItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayWithCapacity:", objc_msgSend(v5, "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[CKConversationListCollectionViewController collectionView](self, "collectionView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "indexPathsForSelectedItems");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __79__CKConversationListCollectionViewController_DataSource__selectedConversations__block_invoke;
  v13[3] = &unk_1E27552A8;
  v13[4] = self;
  v9 = v6;
  v14 = v9;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", v13);

  v10 = v14;
  v11 = v9;

  return v11;
}

void __79__CKConversationListCollectionViewController_DataSource__selectedConversations__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "conversationAtIndexPath:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v4);
  }
  else if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6 = 138412290;
      v7 = v3;
      _os_log_impl(&dword_18DFCD000, v5, OS_LOG_TYPE_INFO, "CKConversationListCollectionViewController | No conversation for selected index path: %@", (uint8_t *)&v6, 0xCu);
    }

  }
}

- (void)pinnedConversationView:(id)a3 didUpdateWithActivitySnapshot:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v6 = a4;
  -[CKConversationListCollectionViewController cacheForLastDisplayedActivitySnapshotByConversation](self, "cacheForLastDisplayedActivitySnapshotByConversation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    v8 = objc_alloc_init(MEMORY[0x1E0C99D38]);
    -[CKConversationListCollectionViewController setCacheForLastDisplayedActivitySnapshotByConversation:](self, "setCacheForLastDisplayedActivitySnapshotByConversation:", v8);

  }
  objc_msgSend(v13, "conversation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKConversationListCollectionViewController _lastDisplayedActivitySnapshotCacheKeyForConversation:](self, "_lastDisplayedActivitySnapshotCacheKeyForConversation:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v6 && objc_msgSend(v10, "length"))
  {
    -[CKConversationListCollectionViewController cacheForLastDisplayedActivitySnapshotByConversation](self, "cacheForLastDisplayedActivitySnapshotByConversation");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKey:", v6, v11);

  }
}

- (id)previousPinnedConversationActivitySnapshotForConversation:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  -[CKConversationListCollectionViewController _lastDisplayedActivitySnapshotCacheKeyForConversation:](self, "_lastDisplayedActivitySnapshotCacheKeyForConversation:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "length"))
  {
    -[CKConversationListCollectionViewController cacheForLastDisplayedActivitySnapshotByConversation](self, "cacheForLastDisplayedActivitySnapshotByConversation");
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

- (id)_lastDisplayedActivitySnapshotCacheKeyForConversation:(id)a3
{
  return (id)objc_msgSend(a3, "pinningIdentifier");
}

- (id)initForRecentlyDeletedModal
{
  CKConversationListCollectionViewController *v2;
  CKConversationListCollectionViewController *v3;

  v2 = -[CKConversationListCollectionViewController init](self, "init");
  v3 = v2;
  if (v2)
  {
    -[CKConversationListCollectionViewController setRecentlyDeletedModal:](v2, "setRecentlyDeletedModal:", 1);
    -[CKConversationListCollectionViewController setFilterMode:](v3, "setFilterMode:", 7);
    -[CKConversationListCollectionViewController setEditingMode:animated:](v3, "setEditingMode:animated:", 1, 0);
  }
  return v3;
}

- (void)recentlyDeletedViewWillAppear:(BOOL)a3
{
  void *v4;

  if (-[CKConversationListCollectionViewController isRecentlyDeletedModal](self, "isRecentlyDeletedModal", a3))
  {
    -[CKConversationListCollectionViewController navigationItem](self, "navigationItem");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setLargeTitleDisplayMode:", 2);

  }
  -[CKConversationListCollectionViewController configureForRecentlyDeletedFilter](self, "configureForRecentlyDeletedFilter");
}

- (void)configureForRecentlyDeletedFilter
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[5];

  -[CKConversationListCollectionViewController setEditingMode:animated:](self, "setEditingMode:animated:", 1, 0);
  -[CKConversationListCollectionViewController _updateForCurrentEditingStateAnimated:](self, "_updateForCurrentEditingStateAnimated:", 0);
  if (CKIsRunningInMacCatalyst())
  {
    -[CKConversationListCollectionViewController _configureCatalystFiltersNavigation](self, "_configureCatalystFiltersNavigation");
  }
  else
  {
    -[CKConversationListCollectionViewController navigationItem](self, "navigationItem");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setSearchController:", 0);

  }
  -[CKConversationListCollectionViewController _setNeedsUpdateContentUnavailableConfiguration](self, "_setNeedsUpdateContentUnavailableConfiguration");
  objc_msgSend(MEMORY[0x1E0D35798], "sharedRegistry");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __96__CKConversationListCollectionViewController_RecentlyDeleted__configureForRecentlyDeletedFilter__block_invoke;
  v6[3] = &unk_1E274A208;
  v6[4] = self;
  objc_msgSend(v4, "updateRecoverableMessagesMetadataSynchronously:loadChats:completionHandler:", 0, 1, v6);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObserver:selector:name:object:", self, sel__reloadRecoverableMetadataForNotification_, *MEMORY[0x1E0D35480], 0);
  objc_msgSend(v5, "addObserver:selector:name:object:", self, sel__reloadRecoverableMetadataForNotification_, *MEMORY[0x1E0D35470], 0);

}

uint64_t __96__CKConversationListCollectionViewController_RecentlyDeleted__configureForRecentlyDeletedFilter__block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "conversationList");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateRecoverableConversationList");

  objc_msgSend(*(id *)(a1 + 32), "updateSnapshotAnimatingDifferences:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "_setNeedsUpdateContentUnavailableConfiguration");
}

- (void)viewSafeAreaInsetsDidChange
{
  void *v3;
  int v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CKConversationListCollectionViewController;
  -[CKConversationListCollectionViewController viewSafeAreaInsetsDidChange](&v5, sel_viewSafeAreaInsetsDidChange);
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "conversationListShouldManuallyApplyBottomSafeAreaInsetForIsRecentlyDeletedModal:", -[CKConversationListCollectionViewController isRecentlyDeletedModal](self, "isRecentlyDeletedModal"));

  if (v4)
    -[CKConversationListCollectionViewController _updateInsets](self, "_updateInsets");
}

- (void)presentRecoverableDeleteConfirmationsWithConversations:(id)a3 collapsedAppearance:(BOOL)a4 alertsCompletedBlock:(id)a5 cancelBlock:(id)a6
{
  _BOOL8 v8;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  id location;

  v8 = a4;
  v10 = a3;
  v11 = a5;
  v12 = a6;
  location = 0;
  objc_initWeak(&location, self);
  v13 = (void *)objc_opt_new();
  v14 = objc_loadWeakRetained(&location);
  objc_msgSend(v13, "presentRecoverableDeletionConfirmationsFromViewController:forConversations:alertControllerStyle:alertsCompletedBlock:cancelBlock:", v14, v10, -[CKConversationListCollectionViewController _alertControllerStyleForCollapsedState:](self, "_alertControllerStyleForCollapsedState:", v8), v11, v12);

  objc_destroyWeak(&location);
}

- (void)_performRecoverableDeletionForConversations:(id)a3 deleteDate:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  _QWORD v11[5];
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18DFCD000, v8, OS_LOG_TYPE_INFO, "[Recently Deleted] Recoverable deletion confirmed", buf, 2u);
    }

  }
  -[CKConversationListCollectionViewController _removeConversationsFromFrozenConversations:](self, "_removeConversationsFromFrozenConversations:", v6);
  -[CKConversationListCollectionViewController delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "conversationListIsDeletingConversations:", v6);

  -[CKConversationListCollectionViewController conversationList](self, "conversationList");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __118__CKConversationListCollectionViewController_RecentlyDeleted___performRecoverableDeletionForConversations_deleteDate___block_invoke;
  v11[3] = &unk_1E274A208;
  v11[4] = self;
  objc_msgSend(v10, "recoverableDeleteForConversations:deleteDate:synchronousQuery:completionHandler:", v6, v7, 0, v11);

  -[CKConversationListCollectionViewController updateSnapshotAnimatingDifferences:](self, "updateSnapshotAnimatingDifferences:", 1);
}

void __118__CKConversationListCollectionViewController_RecentlyDeleted___performRecoverableDeletionForConversations_deleteDate___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "conversationList");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "updateConversationListsAndSortIfEnabled");

}

- (void)_presentPermanentDeletionConfirmationsForConversations:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  int64_t v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id location;

  v4 = a3;
  -[CKConversationListCollectionViewController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isCollapsed");

  location = 0;
  objc_initWeak(&location, self);
  v7 = (void *)objc_opt_new();
  v8 = objc_loadWeakRetained(&location);
  v9 = -[CKConversationListCollectionViewController _alertControllerStyleForCollapsedState:](self, "_alertControllerStyleForCollapsedState:", v6);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __118__CKConversationListCollectionViewController_RecentlyDeleted___presentPermanentDeletionConfirmationsForConversations___block_invoke;
  v11[3] = &unk_1E274D5D0;
  objc_copyWeak(&v13, &location);
  v10 = v4;
  v12 = v10;
  objc_msgSend(v7, "presentPermanentDeletionConfirmationFromViewController:forConversations:alertControllerStyle:alertsCompletedBlock:cancelBlock:", v8, v10, v9, v11, 0);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

}

void __118__CKConversationListCollectionViewController_RecentlyDeleted___presentPermanentDeletionConfirmationsForConversations___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_permanentDeletionConfirmedForConversations:", *(_QWORD *)(a1 + 32));

}

- (void)_permanentDeletionConfirmedForConversations:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  _QWORD v8[5];
  uint8_t buf[16];

  v4 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18DFCD000, v5, OS_LOG_TYPE_INFO, "[Recently Deleted] Permanent deletion confirmed", buf, 2u);
    }

  }
  -[CKConversationListCollectionViewController _removeConversationsFromFrozenConversations:](self, "_removeConversationsFromFrozenConversations:", v4);
  -[CKConversationListCollectionViewController delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "conversationListIsDeletingConversations:", v4);

  -[CKConversationListCollectionViewController conversationList](self, "conversationList");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __107__CKConversationListCollectionViewController_RecentlyDeleted___permanentDeletionConfirmedForConversations___block_invoke;
  v8[3] = &unk_1E274A208;
  v8[4] = self;
  objc_msgSend(v7, "permanentlyDeleteRecoverableMessagesInConversations:synchronousQuery:completionHandler:", v4, 0, v8);

}

uint64_t __107__CKConversationListCollectionViewController_RecentlyDeleted___permanentDeletionConfirmedForConversations___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v5[5];

  objc_msgSend(*(id *)(a1 + 32), "conversationList");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateRecoverableConversationList");

  v3 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __107__CKConversationListCollectionViewController_RecentlyDeleted___permanentDeletionConfirmedForConversations___block_invoke_2;
  v5[3] = &unk_1E274A208;
  v5[4] = v3;
  return objc_msgSend(v3, "updateSnapshotAnimatingDifferences:completion:", 1, v5);
}

uint64_t __107__CKConversationListCollectionViewController_RecentlyDeleted___permanentDeletionConfirmedForConversations___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_removalCompleted");
}

- (void)_presentRecoverConfirmationsForConversations:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  int64_t v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id location;

  v4 = a3;
  -[CKConversationListCollectionViewController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isCollapsed");

  location = 0;
  objc_initWeak(&location, self);
  v7 = (void *)objc_opt_new();
  v8 = objc_loadWeakRetained(&location);
  v9 = -[CKConversationListCollectionViewController _alertControllerStyleForCollapsedState:](self, "_alertControllerStyleForCollapsedState:", v6);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __108__CKConversationListCollectionViewController_RecentlyDeleted___presentRecoverConfirmationsForConversations___block_invoke;
  v11[3] = &unk_1E274D5D0;
  objc_copyWeak(&v13, &location);
  v10 = v4;
  v12 = v10;
  objc_msgSend(v7, "presentRecoverDeletedConversationsConfirmationFromViewController:forConversations:alertControllerStyle:alertsCompletedBlock:cancelBlock:", v8, v10, v9, v11, 0);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

}

void __108__CKConversationListCollectionViewController_RecentlyDeleted___presentRecoverConfirmationsForConversations___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_recoverConfirmedForConversations:", *(_QWORD *)(a1 + 32));

}

- (void)_recoverConfirmedForConversations:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  _QWORD v16[5];
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t buf[8];
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18DFCD000, v5, OS_LOG_TYPE_INFO, "[Recently Deleted] Recovery confirmed", buf, 2u);
    }

  }
  -[CKConversationListCollectionViewController _removeConversationsFromFrozenConversations:](self, "_removeConversationsFromFrozenConversations:", v4);
  -[CKConversationListCollectionViewController delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "conversationListIsDeletingConversations:", v4);

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = v4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v7);
        v11 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v11, "chat");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "isDeletingIncomingMessages");

        if (v13)
        {
          objc_msgSend(v11, "chat");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "setDeletingIncomingMessages:", 0);

        }
      }
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
    }
    while (v8);
  }

  -[CKConversationListCollectionViewController conversationList](self, "conversationList");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __97__CKConversationListCollectionViewController_RecentlyDeleted___recoverConfirmedForConversations___block_invoke;
  v16[3] = &unk_1E274A208;
  v16[4] = self;
  objc_msgSend(v15, "recoverDeletedMessagesInConversations:synchronousQuery:completionHandler:", v7, 0, v16);

}

uint64_t __97__CKConversationListCollectionViewController_RecentlyDeleted___recoverConfirmedForConversations___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v5[5];

  objc_msgSend(*(id *)(a1 + 32), "conversationList");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateConversationListsAndSortIfEnabled");

  v3 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __97__CKConversationListCollectionViewController_RecentlyDeleted___recoverConfirmedForConversations___block_invoke_2;
  v5[3] = &unk_1E274A208;
  v5[4] = v3;
  return objc_msgSend(v3, "updateSnapshotAnimatingDifferences:completion:", 1, v5);
}

uint64_t __97__CKConversationListCollectionViewController_RecentlyDeleted___recoverConfirmedForConversations___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_removalCompleted");
}

- (void)_removalCompleted
{
  NSObject *v3;
  void *v4;
  void *v5;
  _BOOL4 v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      LOWORD(v13) = 0;
      _os_log_impl(&dword_18DFCD000, v3, OS_LOG_TYPE_INFO, "Recently Deleted | removal completed", (uint8_t *)&v13, 2u);
    }

  }
  -[CKConversationListCollectionViewController dataSource](self, "dataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "snapshot");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "indexOfSectionIdentifier:", &unk_1E28708E8) == 0x7FFFFFFFFFFFFFFFLL;

  if (v6)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        LOWORD(v13) = 0;
        _os_log_impl(&dword_18DFCD000, v7, OS_LOG_TYPE_INFO, "Recently Deleted | recently deleted section is not in the converesation. Early returning.", (uint8_t *)&v13, 2u);
      }

    }
  }
  else
  {
    -[CKConversationListCollectionViewController dataSource](self, "dataSource");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "snapshot");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "numberOfItemsInSection:", &unk_1E28708E8);

    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = 138412290;
        v14 = v12;
        _os_log_impl(&dword_18DFCD000, v11, OS_LOG_TYPE_INFO, "Recently Deleted | Viewing recently deleted section of %@ items", (uint8_t *)&v13, 0xCu);

      }
    }
    if (!v10)
    {
      if (-[CKConversationListCollectionViewController isRecentlyDeletedModal](self, "isRecentlyDeletedModal"))
        -[CKConversationListCollectionViewController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__dismissPresentedNavController_, 0, 0.35);
      else
        -[CKConversationListCollectionViewController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__popToInbox, 0, 0.35);
    }
  }
}

- (void)_popToInbox
{
  id v2;

  -[CKConversationListCollectionViewController delegate](self, "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dismissConversationListAnimated:", 1);

}

- (id)showRecentlyDeletedModalAction
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[5];

  v3 = (void *)MEMORY[0x1E0CEA2A8];
  CKFrameworkBundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("SHOW_RECENTLY_DELETED"), &stru_1E276D870, CFSTR("ChatKit"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA638], "_systemImageNamed:", CFSTR("trash"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __93__CKConversationListCollectionViewController_RecentlyDeleted__showRecentlyDeletedModalAction__block_invoke;
  v9[3] = &unk_1E274B178;
  v9[4] = self;
  objc_msgSend(v3, "actionWithTitle:image:identifier:handler:", v5, v6, 0, v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

uint64_t __93__CKConversationListCollectionViewController_RecentlyDeleted__showRecentlyDeletedModalAction__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_showRecentlyDeletedModalActionTapped");
}

- (void)_performRecentlyDeletedMultiSelectCleanUp
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[CKConversationListCollectionViewController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isCollapsed");

  if ((v4 & 1) == 0)
  {
    -[CKConversationListCollectionViewController collectionView](self, "collectionView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKConversationListCollectionViewController _deselectSelectedIndexPathsInCollectionView:animated:](self, "_deselectSelectedIndexPathsInCollectionView:animated:", v5, 1);

    -[CKConversationListCollectionViewController delegate](self, "delegate");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    -[CKConversationListCollectionViewController collectionView](self, "collectionView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "indexPathsForSelectedItems");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "conversationListUpdatedSelectedIndexPathCount:", objc_msgSend(v7, "count"));

  }
}

- (void)_moveToRecentlyDeletedButtonTapped:(id)a3
{
  id v4;
  NSObject *v5;
  uint8_t v6[16];

  v4 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_18DFCD000, v5, OS_LOG_TYPE_INFO, "[Recently Deleted] Recoverable deletion requested", v6, 2u);
    }

  }
  -[CKConversationListCollectionViewController recoverableDeleteSelectedConversations](self, "recoverableDeleteSelectedConversations");

}

- (void)_permanentDeleteSelectedButtonTapped:(id)a3
{
  id v4;
  NSObject *v5;
  uint8_t v6[16];

  v4 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_18DFCD000, v5, OS_LOG_TYPE_INFO, "[Recently Deleted] Permanent deletion on selected requested", v6, 2u);
    }

  }
  -[CKConversationListCollectionViewController _permanentDeleteSelectedConversations](self, "_permanentDeleteSelectedConversations");

}

- (void)_permanentDeleteSelectedConversations
{
  id v3;

  -[CKConversationListCollectionViewController _selectedConversationsInRecentlyDeletedSection](self, "_selectedConversationsInRecentlyDeletedSection");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[CKConversationListCollectionViewController _presentPermanentDeletionConfirmationsForConversations:](self, "_presentPermanentDeletionConfirmationsForConversations:", v3);

}

- (void)_permanentDeleteAllButtonTapped:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint8_t v8[16];

  v4 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_18DFCD000, v5, OS_LOG_TYPE_INFO, "[Recently Deleted] Permanent deletion on all requested", v8, 2u);
    }

  }
  -[CKConversationListCollectionViewController conversationList](self, "conversationList");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "conversationsForFilterMode:", 7);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[CKConversationListCollectionViewController _presentPermanentDeletionConfirmationsForConversations:](self, "_presentPermanentDeletionConfirmationsForConversations:", v7);
}

- (void)_recoverSelectedButtonTapped:(id)a3
{
  id v4;
  NSObject *v5;
  uint8_t v6[16];

  v4 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_18DFCD000, v5, OS_LOG_TYPE_INFO, "[Recently Deleted] Recover selected requested", v6, 2u);
    }

  }
  -[CKConversationListCollectionViewController _recoverSelectedConversations](self, "_recoverSelectedConversations");

}

- (void)_recoverSelectedConversations
{
  id v3;

  -[CKConversationListCollectionViewController _selectedConversationsInRecentlyDeletedSection](self, "_selectedConversationsInRecentlyDeletedSection");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[CKConversationListCollectionViewController _presentRecoverConfirmationsForConversations:](self, "_presentRecoverConfirmationsForConversations:", v3);

}

- (void)_recoverAllButtonTapped:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint8_t v8[16];

  v4 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_18DFCD000, v5, OS_LOG_TYPE_INFO, "[Recently Deleted] Recover all requested", v8, 2u);
    }

  }
  -[CKConversationListCollectionViewController conversationList](self, "conversationList");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "conversationsForFilterMode:", 7);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[CKConversationListCollectionViewController _presentRecoverConfirmationsForConversations:](self, "_presentRecoverConfirmationsForConversations:", v7);
}

- (void)_showRecentlyDeletedModalActionTapped
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v3 = -[CKConversationListCollectionViewController initForRecentlyDeletedModal]([CKConversationListCollectionViewController alloc], "initForRecentlyDeletedModal");
  -[CKConversationListCollectionViewController delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDelegate:", v4);

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA7B8]), "initWithRootViewController:", v3);
  objc_msgSend(v5, "navigationBar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPrefersLargeTitles:", 1);

  objc_msgSend(v5, "setModalPresentationStyle:", 2);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __100__CKConversationListCollectionViewController_RecentlyDeleted___showRecentlyDeletedModalActionTapped__block_invoke;
  v8[3] = &unk_1E274A208;
  v9 = v5;
  v7 = v5;
  -[CKConversationListCollectionViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v7, 1, v8);

}

void __100__CKConversationListCollectionViewController_RecentlyDeleted___showRecentlyDeletedModalActionTapped__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      v3 = *(_QWORD *)(a1 + 32);
      v4 = 138412290;
      v5 = v3;
      _os_log_impl(&dword_18DFCD000, v2, OS_LOG_TYPE_INFO, "Presented modal navigation controller: %@", (uint8_t *)&v4, 0xCu);
    }

  }
}

- (void)recoverableDeleteSelectedConversations
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  void *v13;
  id *v14;
  NSObject *v15;
  _QWORD aBlock[5];
  id v17;
  id v18;
  id v19;
  char v20;
  uint8_t buf[16];

  -[CKConversationListCollectionViewController collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "indexPathsForSelectedItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_127);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "filteredArrayUsingPredicate:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "count"))
  {
    -[CKConversationListCollectionViewController conversationsAtIndexPaths:](self, "conversationsAtIndexPaths:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKConversationListCollectionViewController delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isCollapsed");

    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __101__CKConversationListCollectionViewController_RecentlyDeleted__recoverableDeleteSelectedConversations__block_invoke_54;
    aBlock[3] = &unk_1E2755D50;
    aBlock[4] = self;
    v11 = v7;
    v17 = v11;
    v12 = v8;
    v18 = v12;
    v20 = v10;
    v19 = v6;
    v13 = _Block_copy(aBlock);
    -[CKConversationListCollectionViewController presentRecoverableDeleteConfirmationsWithConversations:collapsedAppearance:alertsCompletedBlock:cancelBlock:](self, "presentRecoverableDeleteConfirmationsWithConversations:collapsedAppearance:alertsCompletedBlock:cancelBlock:", v11, v10, v13, 0);
    if (objc_msgSend((id)__CurrentTestName, "isEqualToString:", CFSTR("UITestDeleteTopChat")))
    {
      v14 = (id *)MEMORY[0x1E0CEB258];
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(*v14, "didDeleteChat");
    }

  }
  else if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18DFCD000, v15, OS_LOG_TYPE_INFO, "Delete requested for selectedIndexPaths count of 0", buf, 2u);
    }

  }
}

BOOL __101__CKConversationListCollectionViewController_RecentlyDeleted__recoverableDeleteSelectedConversations__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  _BOOL8 v3;

  v2 = a2;
  v3 = objc_msgSend(v2, "section") == 5 || objc_msgSend(v2, "section") == 2;

  return v3;
}

uint64_t __101__CKConversationListCollectionViewController_RecentlyDeleted__recoverableDeleteSelectedConversations__block_invoke_54(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  if (objc_msgSend(*(id *)(a1 + 32), "_isNewComposeSelected"))
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "conversationListControllerTappedDeleteNewMessage:", *(_QWORD *)(a1 + 32));

  }
  objc_msgSend(*(id *)(a1 + 32), "_performRecoverableDeletionForConversations:deleteDate:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  if (!*(_BYTE *)(a1 + 64))
  {
    v3 = *(void **)(a1 + 32);
    objc_msgSend(v3, "collectionView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_deselectSelectedIndexPathsInCollectionView:animated:", v4, 1);

    v5 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 56), "lastObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "selectConversationClosestToDeletedIndex:", v6);

  }
  return objc_msgSend(*(id *)(a1 + 32), "setEditingMode:animated:", 0, 1);
}

- (BOOL)_isNewComposeSelected
{
  void *v2;
  void *v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  -[CKConversationListCollectionViewController collectionView](self, "collectionView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "indexPathsForSelectedItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __84__CKConversationListCollectionViewController_RecentlyDeleted___isNewComposeSelected__block_invoke;
  v5[3] = &unk_1E2755D78;
  v5[4] = &v6;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v5);

  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

uint64_t __84__CKConversationListCollectionViewController_RecentlyDeleted___isNewComposeSelected__block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(a2, "section");
  if (result == 4)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

- (id)recentlyDeletedConversationMenu:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[CKConversationListCollectionViewController _recoverRecentlyDeletedAction:](self, "_recoverRecentlyDeletedAction:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKConversationListCollectionViewController _permanentDeleteRecentlyDeletedAction:](self, "_permanentDeleteRecentlyDeletedAction:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v10[0] = v5;
  v10[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA740], "menuWithTitle:image:identifier:options:children:", &stru_1E276D870, 0, 0, 1, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_recoverRecentlyDeletedAction:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD v12[5];
  id v13;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:", CFSTR("arrow.up.bin"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0CEA2A8];
  CKFrameworkBundle();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("RECOVER"), &stru_1E276D870, CFSTR("ChatKit"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __93__CKConversationListCollectionViewController_RecentlyDeleted___recoverRecentlyDeletedAction___block_invoke;
  v12[3] = &unk_1E274F768;
  v12[4] = self;
  v13 = v4;
  v9 = v4;
  objc_msgSend(v6, "actionWithTitle:image:identifier:handler:", v8, v5, 0, v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

uint64_t __93__CKConversationListCollectionViewController_RecentlyDeleted___recoverRecentlyDeletedAction___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_presentRecoverConfirmationsForConversations:", *(_QWORD *)(a1 + 40));
}

- (id)_permanentDeleteRecentlyDeletedAction:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t);
  void *v15;
  CKConversationListCollectionViewController *v16;
  id v17;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:", CFSTR("trash"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0CEA2A8];
  CKFrameworkBundle();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("DELETE"), &stru_1E276D870, CFSTR("ChatKit"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x1E0C809B0];
  v13 = 3221225472;
  v14 = __101__CKConversationListCollectionViewController_RecentlyDeleted___permanentDeleteRecentlyDeletedAction___block_invoke;
  v15 = &unk_1E274F768;
  v16 = self;
  v17 = v4;
  v9 = v4;
  objc_msgSend(v6, "actionWithTitle:image:identifier:handler:", v8, v5, 0, &v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!CKIsRunningInMacCatalyst())
    objc_msgSend(v10, "setAttributes:", 2, v12, v13, v14, v15, v16, v17);

  return v10;
}

uint64_t __101__CKConversationListCollectionViewController_RecentlyDeleted___permanentDeleteRecentlyDeletedAction___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_presentPermanentDeletionConfirmationsForConversations:", *(_QWORD *)(a1 + 40));
}

- (id)toolbarItemsForRecentlyDeletedFilterHasConversations:(BOOL)a3 hasSelectedConversations:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a4;
  v5 = a3;
  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[CKConversationListCollectionViewController _permanentDeletebuttonToUseForSelectedConversations:](self, "_permanentDeletebuttonToUseForSelectedConversations:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA380]), "initWithBarButtonSystemItem:target:action:", 5, 0, 0);
  -[CKConversationListCollectionViewController _recoverButtonToUseForSelectedConversations:](self, "_recoverButtonToUseForSelectedConversations:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setEnabled:", v5);
  objc_msgSend(v10, "setEnabled:", v5);
  objc_msgSend(v7, "addObject:", v8);
  objc_msgSend(v7, "addObject:", v9);
  objc_msgSend(v7, "addObject:", v10);

  return v7;
}

- (id)_permanentDeletebuttonToUseForSelectedConversations:(BOOL)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;

  if (a3)
  {
    -[CKConversationListCollectionViewController permanentDeleteSelectedButtonItem](self, "permanentDeleteSelectedButtonItem");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v4)
    {
      v5 = objc_alloc(MEMORY[0x1E0CEA380]);
      CKFrameworkBundle();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("DELETE"), &stru_1E276D870, CFSTR("ChatKit"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)objc_msgSend(v5, "initWithTitle:style:target:action:", v7, 0, self, sel__permanentDeleteSelectedButtonTapped_);

      objc_msgSend(v8, "accessibilitySetIdentification:", CFSTR("deleteButton"));
      -[CKConversationListCollectionViewController setPermanentDeleteSelectedButtonItem:](self, "setPermanentDeleteSelectedButtonItem:", v8);

    }
    -[CKConversationListCollectionViewController permanentDeleteSelectedButtonItem](self, "permanentDeleteSelectedButtonItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[CKConversationListCollectionViewController permanentDeleteAllButtonItem](self, "permanentDeleteAllButtonItem");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
    {
      v11 = objc_alloc(MEMORY[0x1E0CEA380]);
      CKFrameworkBundle();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("DELETE_ALL"), &stru_1E276D870, CFSTR("ChatKit"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)objc_msgSend(v11, "initWithTitle:style:target:action:", v13, 0, self, sel__permanentDeleteAllButtonTapped_);

      objc_msgSend(v14, "accessibilitySetIdentification:", CFSTR("deleteButton"));
      -[CKConversationListCollectionViewController setPermanentDeleteAllButtonItem:](self, "setPermanentDeleteAllButtonItem:", v14);

    }
    -[CKConversationListCollectionViewController permanentDeleteAllButtonItem](self, "permanentDeleteAllButtonItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v9;
}

- (id)_recoverButtonToUseForSelectedConversations:(BOOL)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;

  if (a3)
  {
    -[CKConversationListCollectionViewController recoverSelectedButtonItem](self, "recoverSelectedButtonItem");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v4)
    {
      v5 = objc_alloc(MEMORY[0x1E0CEA380]);
      CKFrameworkBundle();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("RECOVER"), &stru_1E276D870, CFSTR("ChatKit"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)objc_msgSend(v5, "initWithTitle:style:target:action:", v7, 0, self, sel__recoverSelectedButtonTapped_);

      objc_msgSend(v8, "accessibilitySetIdentification:", CFSTR("recoverButton"));
      -[CKConversationListCollectionViewController setRecoverSelectedButtonItem:](self, "setRecoverSelectedButtonItem:", v8);

    }
    -[CKConversationListCollectionViewController recoverSelectedButtonItem](self, "recoverSelectedButtonItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[CKConversationListCollectionViewController recoverAllButtonItem](self, "recoverAllButtonItem");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
    {
      v11 = objc_alloc(MEMORY[0x1E0CEA380]);
      CKFrameworkBundle();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("RECOVER_ALL"), &stru_1E276D870, CFSTR("ChatKit"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)objc_msgSend(v11, "initWithTitle:style:target:action:", v13, 0, self, sel__recoverAllButtonTapped_);

      objc_msgSend(v14, "accessibilitySetIdentification:", CFSTR("recoverButton"));
      -[CKConversationListCollectionViewController setRecoverAllButtonItem:](self, "setRecoverAllButtonItem:", v14);

    }
    -[CKConversationListCollectionViewController recoverAllButtonItem](self, "recoverAllButtonItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v9;
}

- (id)_selectedConversationsInRecentlyDeletedSection
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[CKConversationListCollectionViewController collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "indexPathsForSelectedItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_86_0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "filteredArrayUsingPredicate:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[CKConversationListCollectionViewController conversationsAtIndexPaths:](self, "conversationsAtIndexPaths:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

BOOL __109__CKConversationListCollectionViewController_RecentlyDeleted___selectedConversationsInRecentlyDeletedSection__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "section") == 6;
}

- (unint64_t)_numberOfRecoverableMessagesInConversations:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "chat");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v6 += objc_msgSend(v9, "recoverableMessagesCount");

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)_reloadRecoverableMetadataForNotification:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  _QWORD v8[5];
  uint8_t buf[4];
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v4, "name");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v10 = v6;
      _os_log_impl(&dword_18DFCD000, v5, OS_LOG_TYPE_INFO, "Recently Deleted | Reloading recoverable message metadata for notification %@", buf, 0xCu);

    }
  }
  objc_msgSend(MEMORY[0x1E0D35798], "sharedRegistry");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __105__CKConversationListCollectionViewController_RecentlyDeleted___reloadRecoverableMetadataForNotification___block_invoke;
  v8[3] = &unk_1E274A208;
  v8[4] = self;
  objc_msgSend(v7, "updateRecoverableMessagesMetadataSynchronously:loadChats:completionHandler:", 0, 1, v8);

}

uint64_t __105__CKConversationListCollectionViewController_RecentlyDeleted___reloadRecoverableMetadataForNotification___block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "conversationList");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateConversationListsAndSortIfEnabled");

  objc_msgSend(*(id *)(a1 + 32), "updateSnapshotAnimatingDifferences:", 1);
  return objc_msgSend(*(id *)(a1 + 32), "updateContentsOfAllCellsAnimated:", 1);
}

- (void)_handleChatRegistryDidPermanentlyDeleteRecoverableMessages:(id)a3
{
  void *v4;
  _QWORD v5[5];

  objc_msgSend(MEMORY[0x1E0D35798], "sharedRegistry", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __122__CKConversationListCollectionViewController_RecentlyDeleted___handleChatRegistryDidPermanentlyDeleteRecoverableMessages___block_invoke;
  v5[3] = &unk_1E274A208;
  v5[4] = self;
  objc_msgSend(v4, "updateRecoverableMessagesMetadataSynchronously:loadChats:completionHandler:", 0, 1, v5);

}

uint64_t __122__CKConversationListCollectionViewController_RecentlyDeleted___handleChatRegistryDidPermanentlyDeleteRecoverableMessages___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v5[5];

  objc_msgSend(*(id *)(a1 + 32), "conversationList");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateConversationListsAndSortIfEnabled");

  v3 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __122__CKConversationListCollectionViewController_RecentlyDeleted___handleChatRegistryDidPermanentlyDeleteRecoverableMessages___block_invoke_2;
  v5[3] = &unk_1E274A208;
  v5[4] = v3;
  return objc_msgSend(v3, "updateSnapshotAnimatingDifferences:completion:", 1, v5);
}

uint64_t __122__CKConversationListCollectionViewController_RecentlyDeleted___handleChatRegistryDidPermanentlyDeleteRecoverableMessages___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_removalCompleted");
}

- (void)_handleDidRecoverMessagesInChatsNotification:(id)a3
{
  void *v4;
  _QWORD v5[5];

  objc_msgSend(MEMORY[0x1E0D35798], "sharedRegistry", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __108__CKConversationListCollectionViewController_RecentlyDeleted___handleDidRecoverMessagesInChatsNotification___block_invoke;
  v5[3] = &unk_1E274A208;
  v5[4] = self;
  objc_msgSend(v4, "updateRecoverableMessagesMetadataSynchronously:loadChats:completionHandler:", 0, 1, v5);

}

uint64_t __108__CKConversationListCollectionViewController_RecentlyDeleted___handleDidRecoverMessagesInChatsNotification___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v5[5];

  objc_msgSend(*(id *)(a1 + 32), "conversationList");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateConversationListsAndSortIfEnabled");

  v3 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __108__CKConversationListCollectionViewController_RecentlyDeleted___handleDidRecoverMessagesInChatsNotification___block_invoke_2;
  v5[3] = &unk_1E274A208;
  v5[4] = v3;
  return objc_msgSend(v3, "updateSnapshotAnimatingDifferences:completion:", 1, v5);
}

uint64_t __108__CKConversationListCollectionViewController_RecentlyDeleted___handleDidRecoverMessagesInChatsNotification___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_removalCompleted");
}

- (id)_recentlyDeletedDisclosureLabelText
{
  void *v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  __CFString *v22;
  void *v23;
  void *v24;
  void *v25;
  const __CFString *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  __CFString *v37;

  -[CKConversationListCollectionViewController _selectedConversationsInRecentlyDeletedSection](self, "_selectedConversationsInRecentlyDeletedSection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    v4 = -[CKConversationListCollectionViewController _numberOfRecoverableMessagesInConversations:](self, "_numberOfRecoverableMessagesInConversations:", v3);
    v5 = -[CKConversationListCollectionViewController _minNumberOfDaysUntilDeletionInConversations:](self, "_minNumberOfDaysUntilDeletionInConversations:", v3);
    if ((unint64_t)objc_msgSend(v3, "count") < 2)
      v6 = 0;
    else
      v6 = -[CKConversationListCollectionViewController _maxNumberOfDaysUntilDeletionInConversations:](self, "_maxNumberOfDaysUntilDeletionInConversations:", v3);
    v9 = (void *)MEMORY[0x1E0CB3940];
    CKFrameworkBundle();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("RECENTLY_DELETED_MESSAGES_SELECTED"), &stru_1E276D870, CFSTR("ChatKit"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedStringWithFormat:", v11, v4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "userInterfaceLayoutDirection");

    if (v14 == 1)
      v15 = CFSTR("\u200F");
    else
      v15 = CFSTR("\u200E");
    -[__CFString stringByAppendingString:](v15, "stringByAppendingString:", v12);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v3, "count") == 1 || v5 == v6)
    {
      v23 = (void *)MEMORY[0x1E0CB3940];
      CKFrameworkBundle();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = v24;
      if (v4 == 1)
        v26 = CFSTR("RECENTLY_DELETED_IT_WILL_BE_DELETED");
      else
        v26 = CFSTR("RECENTLY_DELETED_THEY_WILL_BE_DELETED");
      objc_msgSend(v24, "localizedStringForKey:value:table:", v26, &stru_1E276D870, CFSTR("ChatKit"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "localizedStringWithFormat:", v27, v5);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v28, "userInterfaceLayoutDirection");

      if (v29 == 1)
        v22 = CFSTR("\u200F");
      else
        v22 = CFSTR("\u200E");
    }
    else
    {
      v16 = (void *)MEMORY[0x1E0CB3940];
      CKFrameworkBundle();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("RECENTLY_DELETED_RANGED_DATES_DETAILS"), &stru_1E276D870, CFSTR("ChatKit"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "localizedStringWithFormat:", v18, v5, v6);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "userInterfaceLayoutDirection");

      if (v21 == 1)
        v22 = CFSTR("\u200F");
      else
        v22 = CFSTR("\u200E");
    }
    -[__CFString stringByAppendingString:](v22, "stringByAppendingString:", v19);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    v31 = (void *)MEMORY[0x1E0CB3940];
    CKFrameworkBundle();
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "localizedStringForKey:value:table:", CFSTR("MESSAGES_SELECTED_JOIN_THEY_WILL_BE_DELETED"), &stru_1E276D870, CFSTR("ChatKit"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "stringWithFormat:", v33, v7, v30);
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v35, "userInterfaceLayoutDirection");

    if (v36 == 1)
      v37 = CFSTR("\u200F");
    else
      v37 = CFSTR("\u200E");
    -[__CFString stringByAppendingString:](v37, "stringByAppendingString:", v34);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    CKFrameworkBundle();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("RECENTLY_DELETED_DISCLOSURE_TEXT"), &stru_1E276D870, CFSTR("ChatKit"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

- (unint64_t)_minNumberOfDaysUntilDeletionInConversations:(id)a3
{
  id v3;
  unint64_t v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v3 = a3;
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = -1;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __108__CKConversationListCollectionViewController_RecentlyDeleted___minNumberOfDaysUntilDeletionInConversations___block_invoke;
  v6[3] = &unk_1E2755DA0;
  v6[4] = &v7;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v6);
  if ((unint64_t)v8[3] <= 1)
    v4 = 1;
  else
    v4 = v8[3];
  v8[3] = v4;
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __108__CKConversationListCollectionViewController_RecentlyDeleted___minNumberOfDaysUntilDeletionInConversations___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;

  objc_msgSend(a2, "chat");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "earliestRecoverableMessageDeletionDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = +[CKUtilities daysUntilRecentlyDeletedDeletionForDate:](CKUtilities, "daysUntilRecentlyDeletedDeletionForDate:", v4);

  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v7 = *(_QWORD *)(v6 + 24);
  if (v7 >= v5)
    v7 = v5;
  *(_QWORD *)(v6 + 24) = v7;
}

- (unint64_t)_maxNumberOfDaysUntilDeletionInConversations:(id)a3
{
  id v3;
  unint64_t v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v3 = a3;
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 1;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __108__CKConversationListCollectionViewController_RecentlyDeleted___maxNumberOfDaysUntilDeletionInConversations___block_invoke;
  v6[3] = &unk_1E2755DA0;
  v6[4] = &v7;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v6);
  v4 = v8[3];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __108__CKConversationListCollectionViewController_RecentlyDeleted___maxNumberOfDaysUntilDeletionInConversations___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;

  objc_msgSend(a2, "chat");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "earliestRecoverableMessageDeletionDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = +[CKUtilities daysUntilRecentlyDeletedDeletionForDate:](CKUtilities, "daysUntilRecentlyDeletedDeletionForDate:", v4);

  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v7 = *(_QWORD *)(v6 + 24);
  if (v7 <= v5)
    v7 = v5;
  *(_QWORD *)(v6 + 24) = v7;
}

- (id)_defaultEmptyStateConfiguration
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CEA4A8], "emptyExtraProminentConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  CKFrameworkBundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("NO_MESSAGES"), &stru_1E276D870, CFSTR("ChatKit"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setText:", v5);

  -[CKConversationListCollectionViewController _secondaryTextForFilterMode:](self, "_secondaryTextForFilterMode:", -[CKConversationListCollectionViewController filterMode](self, "filterMode"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSecondaryText:", v6);

  objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:", CFSTR("message.fill"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setImage:", v7);

  return v3;
}

- (id)_secondaryTextForFilterMode:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  __CFString *v18;
  void *v19;
  id v20;
  _BOOL4 v21;

  if (a3 >= 0x10)
  {
    IMSharedUtilitiesFrameworkBundle();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D399F8], "smsFilterParamForFilterMode:", a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "folderName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringForKey:value:table:", v10, &stru_1E276D870, CFSTR("IMSharedUtilities"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = (void *)MEMORY[0x1E0CB3940];
    CKFrameworkBundle();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("NO_SUBFOLDER_MESSAGE_DESCRIPTION"), &stru_1E276D870, CFSTR("ChatKit"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringWithFormat:", v14, v11);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "userInterfaceLayoutDirection");

    if (v17 == 1)
      v18 = CFSTR("\u200F");
    else
      v18 = CFSTR("\u200E");
    -[__CFString stringByAppendingString:](v18, "stringByAppendingString:", v15);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = v19;
  }
  else
  {
    v4 = 0;
    switch(a3)
    {
      case 2uLL:
        CKFrameworkBundle();
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = v5;
        v7 = CFSTR("NO_KNOWN_MESSAGES_DESCRIPTION");
        goto LABEL_15;
      case 3uLL:
        CKFrameworkBundle();
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = v5;
        v7 = CFSTR("NO_UNKNOWN_MESSAGES_DESCRIPTION");
        goto LABEL_15;
      case 4uLL:
        CKFrameworkBundle();
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = v5;
        v7 = CFSTR("NO_TRANSACTIONS_MESSAGE_DESCRIPTION");
        goto LABEL_15;
      case 5uLL:
        CKFrameworkBundle();
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = v5;
        v7 = CFSTR("NO_PROMOTIONAL_MESSAGE_DESCRIPTION");
        goto LABEL_15;
      case 6uLL:
        v21 = CKIsBlackholeEnabled();
        CKFrameworkBundle();
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = v5;
        if (v21)
          v7 = CFSTR("NO_SMS_JUNK_MESSAGES_DESCRIPTION");
        else
          v7 = CFSTR("NO_JUNK_MESSAGES_DESCRIPTION");
        goto LABEL_15;
      case 7uLL:
        goto LABEL_16;
      case 8uLL:
        CKFrameworkBundle();
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = v5;
        v7 = CFSTR("NO_UNREAD_MESSAGES_DESCRIPTION");
        goto LABEL_15;
      default:
        CKFrameworkBundle();
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = v5;
        v7 = CFSTR("NO_MESSAGES_DESCRIPTION");
LABEL_15:
        objc_msgSend(v5, "localizedStringForKey:value:table:", v7, &stru_1E276D870, CFSTR("ChatKit"));
        v4 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_16:
        v20 = v4;
        break;
    }
  }

  return v20;
}

- (id)updaterLogHandle
{
  return (id)objc_msgSend((id)objc_opt_class(), "updaterLogHandle");
}

- (void)_refreshConversationListCellForGroupPhotoUpdate:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint8_t v10[16];

  v4 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_18DFCD000, v5, OS_LOG_TYPE_INFO, "Notification to refresh the cell for avatar view update.", v10, 2u);
    }

  }
  objc_msgSend(v4, "userInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "valueForKey:", CFSTR("conversation"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setNeedsUpdatedGroupPhotoForVisualIdentity");
  if (objc_msgSend(v7, "isPinned"))
    v8 = 2;
  else
    v8 = 5;
  -[CKConversationListCollectionViewController itemIdentifierForConversation:inSection:](self, "itemIdentifierForConversation:inSection:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKConversationListCollectionViewController updateContentsOfCellWithItemIdentifier:animated:](self, "updateContentsOfCellWithItemIdentifier:animated:", v9, 0);

}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  -[UISearchController setDelegate:](self->_searchController, "setDelegate:", 0);
  -[UISearchController setSearchResultsUpdater:](self->_searchController, "setSearchResultsUpdater:", 0);
  -[CKSearchViewController setDelegate:](self->_searchResultsController, "setDelegate:", 0);
  -[CKConversationListCollectionViewController collectionView](self, "collectionView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDataSource:", 0);

  -[CKConversationListCollectionViewController collectionView](self, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDelegate:", 0);

  -[CKConversationListCollectionViewController collectionView](self, "collectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDragDelegate:", 0);

  -[CKConversationListCollectionViewController collectionView](self, "collectionView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDropDelegate:", 0);

  -[CKConversationListCollectionViewController refreshControlTimer](self, "refreshControlTimer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[CKConversationListCollectionViewController refreshControlTimer](self, "refreshControlTimer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "invalidate");

    -[CKConversationListCollectionViewController setRefreshControlTimer:](self, "setRefreshControlTimer:", 0);
  }
  v10.receiver = self;
  v10.super_class = (Class)CKConversationListCollectionViewController;
  -[CKConversationListCollectionViewController dealloc](&v10, sel_dealloc);
}

- (void)_dismissPresentedNavController:(id)a3
{
  id v3;

  -[CKConversationListCollectionViewController navigationController](self, "navigationController", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (_PSMessagesPinningSuggester)pinnedConversationSuggester
{
  _PSMessagesPinningSuggester *pinnedConversationSuggester;
  _PSMessagesPinningSuggester *v4;
  _PSMessagesPinningSuggester *v5;

  pinnedConversationSuggester = self->_pinnedConversationSuggester;
  if (!pinnedConversationSuggester)
  {
    v4 = (_PSMessagesPinningSuggester *)objc_alloc_init(MEMORY[0x1E0D70988]);
    v5 = self->_pinnedConversationSuggester;
    self->_pinnedConversationSuggester = v4;

    pinnedConversationSuggester = self->_pinnedConversationSuggester;
  }
  return pinnedConversationSuggester;
}

- (id)indexPathOfFirstSelectedItem
{
  void *v2;
  void *v3;
  void *v4;

  -[CKConversationListCollectionViewController collectionView](self, "collectionView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "indexPathsForSelectedItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)significantTimeChange
{
  -[CKConversationListCollectionViewController updateSnapshotAnimatingDifferences:](self, "updateSnapshotAnimatingDifferences:", 0);
  -[CKConversationListCollectionViewController updateConversationSelection](self, "updateConversationSelection");
}

- (void)_updateCollectionViewImmediatelyIfNeeded
{
  id v2;

  -[CKConversationListCollectionViewController updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateImmediatelyIfNeeded");

}

- (void)compositionSent
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  id v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  -[CKConversationListCollectionViewController splitViewController](self, "splitViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isCollapsed");

  if (v4)
  {
    -[CKConversationListCollectionViewController setCompositionWasSent:](self, "setCompositionWasSent:", 1);
    -[CKConversationListCollectionViewController navigationController](self, "navigationController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "viewControllers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v7 = v6;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
    v9 = v7;
    if (v8)
    {
      v10 = v8;
      v11 = *(_QWORD *)v18;
LABEL_4:
      v12 = 0;
      while (1)
      {
        if (*(_QWORD *)v18 != v11)
          objc_enumerationMutation(v7);
        v13 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v12);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          break;
        if (v10 == ++v12)
        {
          v10 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
          if (v10)
            goto LABEL_4;
          v9 = v7;
          goto LABEL_13;
        }
      }
      v9 = v13;

      if (!v9)
        goto LABEL_14;
      v21 = v9;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v21, 1, (_QWORD)v17);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "arrayByExcludingObjectsInArray:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      -[CKConversationListCollectionViewController navigationController](self, "navigationController");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setViewControllers:", v15);

    }
LABEL_13:

LABEL_14:
  }
}

- (void)_showConversation:(id)a3 withComposition:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;

  v6 = a4;
  v7 = a3;
  if (objc_msgSend(v7, "isPinned"))
    v8 = 2;
  else
    v8 = 5;
  -[CKConversationListCollectionViewController itemIdentifierForConversation:inSection:](self, "itemIdentifierForConversation:inSection:", v7, v8);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  -[CKConversationListCollectionViewController dataSource](self, "dataSource");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "indexPathForItemIdentifier:", v11);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[CKConversationListCollectionViewController _showConversationWithComposition:atIndexPath:](self, "_showConversationWithComposition:atIndexPath:", v6, v10);
}

- (void)_showConversationWithComposition:(id)a3 atIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  _BOOL4 v11;
  _BOOL4 v12;
  id v13;
  CKConversationListControllerDelegate **p_delegate;
  id WeakRetained;
  char v16;
  id v17;
  id v18;
  char v19;
  char v20;
  void *v21;
  id v22;
  _QWORD v23[5];
  id v24;

  v6 = a3;
  v7 = a4;
  if ((-[CKConversationListCollectionViewController isEditing](self, "isEditing") & 1) == 0)
  {
    -[CKConversationListCollectionViewController conversationAtIndexPath:](self, "conversationAtIndexPath:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKConversationListCollectionViewController delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "currentlyShownConversation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = -[CKConversationListCollectionViewController _shouldKeepSelection](self, "_shouldKeepSelection");
    v12 = v8 == v10 && v11;
    objc_msgSend(v8, "unsentComposition");
    v13 = (id)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v7, "section") == 4)
    {
      p_delegate = &self->_delegate;
      WeakRetained = objc_loadWeakRetained((id *)p_delegate);
      v16 = objc_msgSend(WeakRetained, "isComposingMessage");

      v17 = objc_loadWeakRetained((id *)p_delegate);
      v18 = v17;
      if ((v16 & 1) == 0)
      {
        objc_msgSend(v17, "showNewMessageCompositionPanelAppendingToExistingDraft:animated:", v6, 1);
        goto LABEL_15;
      }
    }
    else
    {
      v19 = !v12;
      if (!v6)
        v19 = 1;
      if ((v19 & 1) != 0 || v13 == v6)
      {
        if (v8)
          v20 = v12;
        else
          v20 = 1;
        if ((v20 & 1) == 0)
        {
          -[CKConversationListCollectionViewController updater](self, "updater");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "beginHoldingUpdatesForReason:", CFSTR("chatItemChangeSuppression"));

          objc_msgSend(v8, "updateUnsentCompositionByAppendingComposition:", v6);
          v22 = objc_loadWeakRetained((id *)&self->_delegate);
          objc_msgSend(v22, "showConversation:animate:userInitiated:", v8, 1, 1);

          v23[0] = MEMORY[0x1E0C809B0];
          v23[1] = 3221225472;
          v23[2] = __91__CKConversationListCollectionViewController__showConversationWithComposition_atIndexPath___block_invoke;
          v23[3] = &unk_1E274A108;
          v23[4] = self;
          v24 = v8;
          dispatch_async(MEMORY[0x1E0C80D38], v23);

          goto LABEL_16;
        }
        if (!v12)
        {
LABEL_16:

          goto LABEL_17;
        }
        v18 = objc_loadWeakRetained((id *)&self->_delegate);
        objc_msgSend(v18, "chatControllerDidReselectConversation:", v8);
LABEL_15:

        goto LABEL_16;
      }
      v17 = objc_loadWeakRetained((id *)&self->_delegate);
      v18 = v17;
    }
    objc_msgSend(v17, "updateCompositionInEntryViewWithComposition:", v6);
    goto LABEL_15;
  }
  -[CKConversationListCollectionViewController _updateToolbarItems](self, "_updateToolbarItems");
LABEL_17:

}

uint64_t __91__CKConversationListCollectionViewController__showConversationWithComposition_atIndexPath___block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "updater");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "endHoldingUpdatesForReason:updateTriggeredIfNotHeldShouldBeDeferred:", CFSTR("chatItemChangeSuppression"), 1);

  return objc_msgSend(*(id *)(a1 + 32), "_presentSatelliteConnectionBannerIfNecessaryWithConversation:withReason:", *(_QWORD *)(a1 + 40), CFSTR("OpenChat"));
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  void (**v12)(_QWORD);
  _QWORD block[4];
  void (**v14)(_QWORD);
  _QWORD aBlock[5];
  id v16;
  uint8_t buf[4];
  id v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[CKConversationListCollectionViewController collectionView](self, "collectionView");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8 == v6)
  {
    -[CKConversationListCollectionViewController _updateToolbarItems](self, "_updateToolbarItems");
    v11 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __86__CKConversationListCollectionViewController_collectionView_didSelectItemAtIndexPath___block_invoke;
    aBlock[3] = &unk_1E274A108;
    aBlock[4] = self;
    v16 = v7;
    v12 = (void (**)(_QWORD))_Block_copy(aBlock);
    objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__updatedSelectedIndexPathCount, 0);
    if (CKIsRunningInMacCatalyst())
    {
      block[0] = v11;
      block[1] = 3221225472;
      block[2] = __86__CKConversationListCollectionViewController_collectionView_didSelectItemAtIndexPath___block_invoke_207;
      block[3] = &unk_1E274AED0;
      v14 = v12;
      dispatch_async(MEMORY[0x1E0C80D38], block);

    }
    else
    {
      v12[2](v12);
    }

  }
  else if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      -[CKConversationListCollectionViewController collectionView](self, "collectionView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v18 = v6;
      v19 = 2112;
      v20 = v10;
      _os_log_impl(&dword_18DFCD000, v9, OS_LOG_TYPE_INFO, "CKConversationListCollectionViewController: processing didSelectItemAtIndexPath on an unexpected collectionView: %@. Expected: %@", buf, 0x16u);

    }
  }

}

void __86__CKConversationListCollectionViewController_collectionView_didSelectItemAtIndexPath___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _BOOL4 v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(*(id *)(a1 + 32), "collectionView");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "indexPathsForSelectedItems");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138412290;
      v13 = v4;
      _os_log_impl(&dword_18DFCD000, v2, OS_LOG_TYPE_INFO, "multi-select: didSelectItemAtIndexPath. SelectedIndexPaths: %@", (uint8_t *)&v12, 0xCu);

    }
  }
  if (objc_msgSend(*(id *)(a1 + 32), "filterMode") == 7
    || (objc_msgSend(*(id *)(a1 + 32), "collectionView"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v5, "indexPathsForSelectedItems"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v6, "count") == 1,
        v6,
        v5,
        !v7))
  {
    objc_msgSend(*(id *)(a1 + 32), "_updatedSelectedIndexPathCount");
  }
  else
  {
    if (CKIsRunningInMacCatalyst())
      objc_msgSend(*(id *)(a1 + 32), "setEditingMode:animated:", 0, 0);
    v9 = *(void **)(a1 + 32);
    v8 = a1 + 32;
    objc_msgSend(v9, "_performTranscriptPushForItemAtIndexPath:userInitiated:", *(_QWORD *)(v8 + 8), 1);
    objc_msgSend(*(id *)v8, "dataSource");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "itemIdentifierForIndexPath:", *(_QWORD *)(v8 + 8));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)v8, "setLastSelectedConversationItemIdentifier:", v11);

  }
}

uint64_t __86__CKConversationListCollectionViewController_collectionView_didSelectItemAtIndexPath___block_invoke_207(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4
{
  id v5;
  BOOL v6;

  v5 = a4;
  v6 = !-[CKConversationListCollectionViewController isAppearing](self, "isAppearing")
    && -[CKConversationListCollectionViewController sectionHasSelectableConversations:](self, "sectionHasSelectableConversations:", objc_msgSend(v5, "section"));

  return v6;
}

- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4
{
  return -[CKConversationListCollectionViewController sectionHasSelectableConversations:](self, "sectionHasSelectableConversations:", objc_msgSend(a4, "section", a3));
}

- (BOOL)cellAtIndexPath:(id)a3 isVisibleInCollectionView:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  double v14;
  CGFloat v15;
  double v16;
  id v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  id WeakRetained;
  void *v34;
  double v35;
  BOOL v36;
  double v38;
  double v39;
  double v40;
  CGFloat rect1;
  CGPoint v42;
  CGRect v43;
  CGRect v44;

  v6 = a4;
  objc_msgSend(v6, "cellForItemAtIndexPath:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "bounds");
    objc_msgSend(v6, "convertRect:fromView:", v8);
    v10 = v9;
    v12 = v11;
    rect1 = v13;
    v15 = v14;
    v16 = v11 + v14;
    v17 = objc_alloc(MEMORY[0x1E0CEABB0]);
    objc_msgSend(v6, "bounds");
    v18 = (void *)objc_msgSend(v17, "initWithFrame:", 0.0, v16);
    objc_msgSend(MEMORY[0x1E0CEA478], "blueColor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setBackgroundColor:", v19);

    objc_msgSend(v6, "bounds");
    v39 = v21;
    v40 = v20;
    v38 = v22;
    v24 = v23;
    objc_msgSend(v6, "adjustedContentInset");
    v26 = v25;
    v28 = v27;
    v30 = v29;
    v32 = v24 - (v25 + v31);
    if (!self->_keyboardIsShowing)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(WeakRetained, "chatController");
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v34, "accessoryViewHeight");
      v32 = v32 + v35;

    }
    v43.origin.x = v10;
    v43.origin.y = v12;
    v43.size.width = rect1;
    v43.size.height = v15;
    v36 = 0;
    if (!CGRectEqualToRect(v43, *MEMORY[0x1E0C9D648]))
    {
      v44.origin.x = v40 + v28;
      v44.origin.y = v39 + v26;
      v44.size.width = v38 - (v28 + v30);
      v44.size.height = v32;
      v42.x = v10;
      v42.y = v16;
      if (CGRectContainsPoint(v44, v42))
        v36 = 1;
    }

  }
  else
  {
    v36 = 0;
  }

  return v36;
}

- (id)complimentaryIndexPathForConversationAtIndexPath:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  if (objc_msgSend(v4, "section") == 5)
  {
    v5 = 2;
  }
  else
  {
    if (objc_msgSend(v4, "section") != 2)
    {
      v11 = 0;
      goto LABEL_7;
    }
    v5 = 5;
  }
  -[CKConversationListCollectionViewController dataSource](self, "dataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "itemIdentifierForIndexPath:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[CKConversationListCollectionViewController conversationForItemIdentifier:](self, "conversationForItemIdentifier:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKConversationListCollectionViewController itemIdentifierForConversation:inSection:](self, "itemIdentifierForConversation:inSection:", v8, v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKConversationListCollectionViewController dataSource](self, "dataSource");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "indexPathForItemIdentifier:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_7:
  return v11;
}

- (void)_performTranscriptPushForItemAtIndexPath:(id)a3 userInitiated:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  NSObject *v7;
  void *v8;
  unint64_t v9;
  BOOL v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  double v26;
  double v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  int v33;
  void *v34;
  uint64_t v35;

  v4 = a4;
  v35 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (-[CKConversationListCollectionViewController hasActivePinnedConversationDropSession](self, "hasActivePinnedConversationDropSession"))
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        LOWORD(v33) = 0;
        _os_log_impl(&dword_18DFCD000, v7, OS_LOG_TYPE_INFO, "User attempted to select a converstion, but they are already dragging another conversation. Ignoring.", (uint8_t *)&v33, 2u);
      }

    }
    -[CKConversationListCollectionViewController collectionView](self, "collectionView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "deselectItemAtIndexPath:animated:", v6, 0);

    goto LABEL_38;
  }
  v9 = -[CKConversationListCollectionViewController editingMode](self, "editingMode");
  v10 = objc_msgSend(v6, "section") == 4 || objc_msgSend(v6, "section") == 2 || objc_msgSend(v6, "section") == 5;
  if (v9 == 2)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[CKConversationListCollectionViewController editingMode](self, "editingMode"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = 138412290;
        v34 = v12;
        _os_log_impl(&dword_18DFCD000, v11, OS_LOG_TYPE_INFO, "multi-select: not showing conversation - currently under editing mode: %@", (uint8_t *)&v33, 0xCu);

      }
    }
    goto LABEL_38;
  }
  if (v10)
  {
    -[CKConversationListCollectionViewController lastSelectedConversationItemIdentifier](self, "lastSelectedConversationItemIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKConversationListCollectionViewController dataSource](self, "dataSource");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "indexPathForItemIdentifier:", v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v6, "isEqual:", v15) & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "postNotificationName:object:", CFSTR("CKConversationListSelectionDidChangeNotification"), self);

      if (objc_msgSend(MEMORY[0x1E0D39858], "messageSummarizationEnabled"))
      {
        -[CKConversationListCollectionViewController splitViewController](self, "splitViewController");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "isCollapsed");

        if (v18)
          v19 = v6;
        else
          v19 = v15;
        -[CKConversationListCollectionViewController _consumeSummaryForConversationAtIndexPathIfNeeded:](self, "_consumeSummaryForConversationAtIndexPathIfNeeded:", v19);
      }
    }
    -[CKConversationListCollectionViewController dataSource](self, "dataSource");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "itemIdentifierForIndexPath:", v6);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (CKIsRunningInMacCatalyst())
    {
      -[CKConversationListCollectionViewController lastUserSelectedConversationTime](self, "lastUserSelectedConversationTime");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (v22)
      {
        -[CKConversationListCollectionViewController lastUserSelectedConversationItemIdentifier](self, "lastUserSelectedConversationItemIdentifier");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v21, "isEqualToString:", v23);

        if (v24)
        {
          -[CKConversationListCollectionViewController lastUserSelectedConversationTime](self, "lastUserSelectedConversationTime");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "timeIntervalSinceNow");
          v27 = v26;

          if (fabs(v27) < cellDoubleClickInterval())
          {
            -[CKConversationListCollectionViewController conversationAtIndexPath:](self, "conversationAtIndexPath:", v6);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            -[CKConversationListCollectionViewController delegate](self, "delegate");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "showConversationInNewWindow:", v28);

          }
        }
      }
      if (!v4)
      {
        -[CKConversationListCollectionViewController _showConversationWithComposition:atIndexPath:](self, "_showConversationWithComposition:atIndexPath:", 0, v6);
        -[CKConversationListCollectionViewController setLastSelectedConversationItemIdentifier:](self, "setLastSelectedConversationItemIdentifier:", v21);
LABEL_37:

        goto LABEL_38;
      }
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKConversationListCollectionViewController setLastUserSelectedConversationTime:](self, "setLastUserSelectedConversationTime:", v30);

    }
    -[CKConversationListCollectionViewController _showConversationWithComposition:atIndexPath:](self, "_showConversationWithComposition:atIndexPath:", 0, v6);
    -[CKConversationListCollectionViewController setLastSelectedConversationItemIdentifier:](self, "setLastSelectedConversationItemIdentifier:", v21);
    if (v4)
      -[CKConversationListCollectionViewController setLastUserSelectedConversationItemIdentifier:](self, "setLastUserSelectedConversationItemIdentifier:", v21);
    goto LABEL_37;
  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v6, "section"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = 138412290;
      v34 = v32;
      _os_log_impl(&dword_18DFCD000, v31, OS_LOG_TYPE_INFO, "multi-select: not showing conversation - section is invalid: %@", (uint8_t *)&v33, 0xCu);

    }
  }
LABEL_38:

}

- (void)_consumeSummaryForConversationAtIndexPathIfNeeded:(id)a3
{
  void *v3;
  void *v4;
  id v5;

  -[CKConversationListCollectionViewController conversationAtIndexPath:](self, "conversationAtIndexPath:", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "chat");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "chatSummary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    objc_msgSend(v3, "consumeSummaryIfNeeded");

}

- (void)_consumeSummaryOnUnreadCountChangeForChatIfNeeded:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  id v7;

  v7 = a3;
  if (!objc_msgSend(v7, "unreadMessageCount"))
  {
    -[CKConversationListCollectionViewController splitViewController](self, "splitViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isCollapsed");

    if (v5)
    {
      objc_msgSend(v7, "chatSummary");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6)
        objc_msgSend(v7, "consumeSummaryIfNeeded");
    }
  }

}

- (void)collectionView:(id)a3 didDeselectItemAtIndexPath:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      -[CKConversationListCollectionViewController collectionView](self, "collectionView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "indexPathsForSelectedItems");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138412290;
      v12 = v10;
      _os_log_impl(&dword_18DFCD000, v8, OS_LOG_TYPE_INFO, "multi-select: didDeselectItemAtIndexPath. SelectedIndexPaths: %@", (uint8_t *)&v11, 0xCu);

    }
  }
  -[CKConversationListCollectionViewController _updateToolbarItems](self, "_updateToolbarItems");
  objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__updatedSelectedIndexPathCount, 0);
  -[CKConversationListCollectionViewController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__updatedSelectedIndexPathCount, 0, 0.0);

}

- (void)_updatedSelectedIndexPathCount
{
  void *v3;
  void *v4;
  id v5;

  -[CKConversationListCollectionViewController delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[CKConversationListCollectionViewController collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "indexPathsForSelectedItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "conversationListUpdatedSelectedIndexPathCount:", objc_msgSend(v4, "count"));

}

- (BOOL)collectionView:(id)a3 shouldBeginMultipleSelectionInteractionAtIndexPath:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  const char *v9;
  uint8_t *v10;
  BOOL v11;
  __int16 v13;
  uint8_t buf[2];
  __int16 v15;

  v6 = a3;
  v7 = a4;
  if (-[CKConversationListCollectionViewController hasActivePinnedConversationDropSession](self, "hasActivePinnedConversationDropSession"))
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        v15 = 0;
        v9 = "Not allowing the collection view to begin multiple selection interaction as we have an active pinned conver"
             "sation drop session";
        v10 = (uint8_t *)&v15;
LABEL_13:
        _os_log_impl(&dword_18DFCD000, v8, OS_LOG_TYPE_INFO, v9, v10, 2u);
        goto LABEL_14;
      }
      goto LABEL_14;
    }
  }
  else if (objc_msgSend(v7, "section") == 5)
  {
    if (-[CKConversationListCollectionViewController editingMode](self, "editingMode") != 2)
    {
      v11 = 1;
      goto LABEL_16;
    }
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        v13 = 0;
        v9 = "Not allowing the collection view to begin multiple selection interaction as we are pin edit mode";
        v10 = (uint8_t *)&v13;
        goto LABEL_13;
      }
LABEL_14:

    }
  }
  else if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      v9 = "Not allowing the collection view to begin multiple selection interaction as the interaction is not on the act"
           "ive conversations section";
      v10 = buf;
      goto LABEL_13;
    }
    goto LABEL_14;
  }
  v11 = 0;
LABEL_16:

  return v11;
}

- (void)collectionView:(id)a3 didBeginMultipleSelectionInteractionAtIndexPath:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a4;
  if (-[CKConversationListCollectionViewController sectionHasSelectableConversations:](self, "sectionHasSelectableConversations:", objc_msgSend(v9, "section"))&& (-[CKConversationListCollectionViewController isEditing](self, "isEditing") & 1) == 0&& !-[CKConversationListCollectionViewController hasActivePinnedConversationDropSession](self, "hasActivePinnedConversationDropSession"))
  {
    -[CKConversationListCollectionViewController setEditingMode:animated:](self, "setEditingMode:animated:", 1, CKIsRunningInMacCatalyst() == 0);
    -[CKConversationListCollectionViewController collectionView](self, "collectionView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "selectItemAtIndexPath:animated:scrollPosition:", v9, 0, 0);

    -[CKConversationListCollectionViewController delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKConversationListCollectionViewController collectionView](self, "collectionView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "indexPathsForSelectedItems");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "conversationListDidBeginMultipleSelectionWithInitialSelectedCount:", objc_msgSend(v8, "count"));

  }
}

- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5
{
  void *v5;
  id v6;

  v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v6, "pinnedConversationView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "didEndDisplaying");

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(v6, "didEndDisplaying");
  }

}

- (BOOL)isSearchActive
{
  void *v2;
  char v3;

  -[CKConversationListCollectionViewController searchController](self, "searchController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isActive");

  return v3;
}

- (BOOL)isSearchActiveAndDisplayingResultsForSearchText
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  char v8;

  if (!-[CKConversationListCollectionViewController isSearchActive](self, "isSearchActive"))
    return 0;
  -[CKConversationListCollectionViewController searchController](self, "searchController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "searchBar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length");

  if (!v6)
    return 0;
  -[CKConversationListCollectionViewController searchResultsController](self, "searchResultsController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "conversationSearchHasResult");

  return v8;
}

- (void)performSearch:(id)a3 completion:(id)a4
{
  void (**v6)(_QWORD);
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  v6 = (void (**)(_QWORD))a4;
  if (v14)
  {
    -[CKConversationListCollectionViewController collectionView](self, "collectionView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "__ck_scrollToTop:", 1);

    -[CKConversationListCollectionViewController searchController](self, "searchController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setActive:", 1);

    -[CKConversationListCollectionViewController searchController](self, "searchController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "searchBar");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setText:", v14);

    if (v6)
      v6[2](v6);
  }
  else
  {
    -[CKConversationListCollectionViewController searchController](self, "searchController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "searchBar");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setText:", 0);

    -[CKConversationListCollectionViewController searchController](self, "searchController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setActive:", 0);

    ck_dispatch_main_after_seconds(v6, 0.0);
  }

}

- (id)preferredFocusEnvironments
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKConversationListCollectionViewController _itemIdentifierOfDefaultConversation](self, "_itemIdentifierOfDefaultConversation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKConversationListCollectionViewController lastSelectedConversationItemIdentifier](self, "lastSelectedConversationItemIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "length"))
    v6 = v5;
  else
    v6 = v4;
  v7 = v6;
  if (objc_msgSend(v7, "length"))
  {
    -[CKConversationListCollectionViewController dataSource](self, "dataSource");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "indexPathForItemIdentifier:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[CKConversationListCollectionViewController collectionView](self, "collectionView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "cellForItemAtIndexPath:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
      objc_msgSend(v3, "addObject:", v11);

  }
  return v3;
}

- (BOOL)sectionHasSelectableConversations:(unint64_t)a3
{
  return (a3 < 7) & (0x74u >> a3);
}

- (BOOL)sectionHasActionableConversations:(unint64_t)a3
{
  if (a3 - 5 < 2)
    return 1;
  if (a3 == 4)
    return CKIsRunningInMacCatalyst() != 0;
  return a3 == 2;
}

- (BOOL)contextMenuInteractionShouldBeginAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;
  NSObject *v10;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((!objc_msgSend(MEMORY[0x1E0D35808], "isContactLimitsFeatureEnabled")
     || (-[CKConversationListCollectionViewController conversationAtIndexPath:](self, "conversationAtIndexPath:", v4),
         v5 = (void *)objc_claimAutoreleasedReturnValue(),
         objc_msgSend(v5, "chat"),
         v6 = (void *)objc_claimAutoreleasedReturnValue(),
         v5,
         LODWORD(v5) = objc_msgSend(v6, "allowedByScreenTime"),
         v6,
         (_DWORD)v5))
    && -[CKConversationListCollectionViewController sectionHasActionableConversations:](self, "sectionHasActionableConversations:", objc_msgSend(v4, "section")))
  {
    +[CKAdaptivePresentationController sharedInstance](CKAdaptivePresentationController, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "presentedViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = v8 == 0;
    if (v8 && IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        v12 = 138412290;
        v13 = v8;
        _os_log_impl(&dword_18DFCD000, v10, OS_LOG_TYPE_INFO, "Not presenting context menu because presenting viewController: %@", (uint8_t *)&v12, 0xCu);
      }

    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)collectionView:(id)a3 contextMenuConfigurationForItemsAtIndexPaths:(id)a4 point:(CGPoint)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  _QWORD aBlock[4];
  id v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  objc_msgSend(v8, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[CKConversationListCollectionViewController contextMenuInteractionShouldBeginAtIndexPath:](self, "contextMenuInteractionShouldBeginAtIndexPath:", v9))
  {
    -[CKConversationListCollectionViewController dataSource](self, "dataSource");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "itemIdentifierForIndexPath:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[CKConversationListCollectionViewController conversationForItemIdentifier:](self, "conversationForItemIdentifier:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      if ((unint64_t)objc_msgSend(v8, "count") >= 2 && objc_msgSend(v8, "containsObject:", v9))
      {
        -[CKConversationListCollectionViewController selectedConversations](self, "selectedConversations");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[CKConversationListCollectionViewController _topLevelMenuForMultipleSelectedConversations:](self, "_topLevelMenuForMultipleSelectedConversations:", v13);
        v14 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v16 = objc_msgSend(v9, "section");
        -[CKConversationListCollectionViewController collectionView](self, "collectionView");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "cellForItemAtIndexPath:", v9);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        -[CKConversationListCollectionViewController _topLevelMenuForItemIdentifier:inSection:withCell:](self, "_topLevelMenuForItemIdentifier:inSection:withCell:", v11, v16, v13);
        v14 = objc_claimAutoreleasedReturnValue();
      }
      v18 = (void *)v14;

      if (v18)
      {
        -[CKConversationListCollectionViewController _previewProviderForConversation:](self, "_previewProviderForConversation:", v12);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        aBlock[0] = MEMORY[0x1E0C809B0];
        aBlock[1] = 3221225472;
        aBlock[2] = __112__CKConversationListCollectionViewController_collectionView_contextMenuConfigurationForItemsAtIndexPaths_point___block_invoke;
        aBlock[3] = &unk_1E274B290;
        v24 = v18;
        v20 = _Block_copy(aBlock);
        objc_msgSend(MEMORY[0x1E0CEA4B0], "configurationWithIdentifier:previewProvider:actionProvider:", v11, v19, v20);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v15 = 0;
      }

    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          v26 = v9;
          v27 = 2112;
          v28 = v11;
          _os_log_impl(&dword_18DFCD000, v21, OS_LOG_TYPE_INFO, "CKConversationListCollectionViewController: Warning: expected conversation to create context menu for indexPath: %@, itemIdentifier: %@, returning nil context menu", buf, 0x16u);
        }

      }
      v15 = 0;
    }

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

id __112__CKConversationListCollectionViewController_collectionView_contextMenuConfigurationForItemsAtIndexPaths_point___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (id)_previewProviderForConversation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  unsigned int v8;
  void *v9;
  unint64_t v10;
  void *v11;
  unint64_t v12;
  unint64_t v13;
  void *v14;
  _QWORD v16[5];
  id v17;

  v4 = a3;
  if (-[CKConversationListCollectionViewController filterMode](self, "filterMode") == 7)
  {
    v5 = 0;
  }
  else
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "supportsOrbPreviewsInConversationList");

    if (v7)
    {
      v8 = objc_msgSend(v4, "limitToLoad");
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "defaultConversationViewingMessageCount");

      if (v10 >= v8)
        v10 = v8;
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "initialConversationViewingMessageCount");

      if (v10 <= v12)
        v13 = v12;
      else
        v13 = v10;
      objc_msgSend(v4, "setLoadedMessageCount:", v13);
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __78__CKConversationListCollectionViewController__previewProviderForConversation___block_invoke;
      v16[3] = &unk_1E2757AC0;
      v16[4] = self;
      v17 = v4;
      v14 = _Block_copy(v16);

    }
    else
    {
      v14 = 0;
    }
    v5 = _Block_copy(v14);

  }
  return v5;
}

CKTranscriptPreviewController *__78__CKConversationListCollectionViewController__previewProviderForConversation___block_invoke(uint64_t a1)
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  uint64_t v14;
  double v15;

  objc_msgSend(*(id *)(a1 + 32), "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "frame");
  v4 = v3;

  objc_msgSend(*(id *)(a1 + 32), "systemMinimumLayoutMargins");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  objc_msgSend(*(id *)(a1 + 32), "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "effectiveUserInterfaceLayoutDirection");
  if (v14)
    v15 = v12;
  else
    v15 = v8;
  if (!v14)
    v8 = v12;

  return -[CKTranscriptPreviewController initWithConversation:transcriptWidth:layoutMargins:]([CKTranscriptPreviewController alloc], "initWithConversation:transcriptWidth:layoutMargins:", *(_QWORD *)(a1 + 40), v4, v6, v15, v10, v8);
}

- (void)_deselectSelectedIndexPathsInCollectionView:(id)a3 animated:(BOOL)a4
{
  id v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  BOOL v10;

  v5 = a3;
  objc_msgSend(v5, "indexPathsForSelectedItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __99__CKConversationListCollectionViewController__deselectSelectedIndexPathsInCollectionView_animated___block_invoke;
  v8[3] = &unk_1E2757AE8;
  v9 = v5;
  v10 = a4;
  v7 = v5;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v8);

}

uint64_t __99__CKConversationListCollectionViewController__deselectSelectedIndexPathsInCollectionView_animated___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "deselectItemAtIndexPath:animated:", a2, *(unsigned __int8 *)(a1 + 40));
}

- (id)_previewForHighlightingOrDismissingContextMenuWithConfiguration:(id)a3 indexPath:(id)a4 collectionView:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  char isKindOfClass;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  uint8_t v30[16];
  uint8_t buf[16];

  v7 = a3;
  v8 = a4;
  v9 = a5;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v10, "supportsOrbPreviewsInConversationList") & 1) != 0)
  {
    objc_msgSend(v7, "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(v9, "cellForItemAtIndexPath:", v8);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v13)
      {
        if (objc_msgSend(v8, "section") == 2)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v14 = v13;
            objc_msgSend(v14, "pinnedConversationView");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "avatarView");
            v16 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v16, "_window");
            v17 = (void *)objc_claimAutoreleasedReturnValue();

            if (v17)
            {
              v18 = objc_alloc_init(MEMORY[0x1E0CEA8B8]);
              objc_msgSend(MEMORY[0x1E0CEA390], "bezierPath");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "setShadowPath:", v19);

              objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "setBackgroundColor:", v20);

              v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAA98]), "initWithView:parameters:", v16, v18);
              if (v21)
              {
LABEL_23:

                goto LABEL_24;
              }
            }
            else
            {
              if (IMOSLoggingEnabled())
              {
                OSLogHandleForIMFoundationCategory();
                v22 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_18DFCD000, v22, OS_LOG_TYPE_INFO, "Not using the avatar view as the context menu preview because the avatar view is not in a window", buf, 2u);
                }

              }
            }
          }
        }
        objc_msgSend(v13, "_window");
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        if (v23)
        {
          v24 = objc_alloc_init(MEMORY[0x1E0CEA8B8]);
          +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "theme");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "conversationListCellPreviewBackgroundColor");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "setBackgroundColor:", v27);

          v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAA98]), "initWithView:parameters:", v13, v24);
          goto LABEL_23;
        }
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v28 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)v30 = 0;
            _os_log_impl(&dword_18DFCD000, v28, OS_LOG_TYPE_INFO, "Returning nil for context menu preview because the cell is not in a window", v30, 2u);
          }

        }
      }
      v21 = 0;
      goto LABEL_23;
    }
  }
  else
  {

  }
  v21 = 0;
LABEL_24:

  return v21;
}

- (id)collectionView:(id)a3 contextMenuConfiguration:(id)a4 highlightPreviewForItemAtIndexPath:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  objc_msgSend(v9, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKConversationListCollectionViewController itemIdentifiersForVisibleContextMenuInteractions](self, "itemIdentifiersForVisibleContextMenuInteractions");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    v13 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    -[CKConversationListCollectionViewController setItemIdentifiersForVisibleContextMenuInteractions:](self, "setItemIdentifiersForVisibleContextMenuInteractions:", v13);

  }
  -[CKConversationListCollectionViewController itemIdentifiersForVisibleContextMenuInteractions](self, "itemIdentifiersForVisibleContextMenuInteractions");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addObject:", v11);

  -[CKConversationListCollectionViewController updateContentsOfCellWithItemIdentifier:animated:](self, "updateContentsOfCellWithItemIdentifier:animated:", v11, 1);
  -[CKConversationListCollectionViewController _previewForHighlightingOrDismissingContextMenuWithConfiguration:indexPath:collectionView:](self, "_previewForHighlightingOrDismissingContextMenuWithConfiguration:indexPath:collectionView:", v9, v8, v10);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)collectionView:(id)a3 contextMenuConfiguration:(id)a4 dismissalPreviewForItemAtIndexPath:(id)a5
{
  return -[CKConversationListCollectionViewController _previewForHighlightingOrDismissingContextMenuWithConfiguration:indexPath:collectionView:](self, "_previewForHighlightingOrDismissingContextMenuWithConfiguration:indexPath:collectionView:", a4, a5, a3);
}

- (void)collectionView:(id)a3 willPerformPreviewActionForMenuWithConfiguration:(id)a4 animator:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  BOOL v16;
  uint64_t v17;
  id v18;
  id v19;
  id v20;
  _QWORD v21[5];
  _QWORD v22[4];
  id v23;
  CKConversationListCollectionViewController *v24;
  id v25;
  id v26;
  id v27;
  BOOL v28;
  char v29;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v10, "previewViewController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  location = 0;
  objc_initWeak(&location, self);
  objc_msgSend(v11, "childViewControllers");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "count");

  if (v13)
  {
    v14 = -[CKConversationListCollectionViewController editingMode](self, "editingMode");
    v15 = -[CKConversationListCollectionViewController editingMode](self, "editingMode");
    v16 = v14 == 1;
    LODWORD(v13) = v15 == 0;
  }
  else
  {
    v16 = 0;
  }
  v17 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __119__CKConversationListCollectionViewController_collectionView_willPerformPreviewActionForMenuWithConfiguration_animator___block_invoke;
  v22[3] = &unk_1E2757B10;
  v28 = v16;
  v18 = v9;
  v23 = v18;
  v24 = self;
  v19 = v8;
  v25 = v19;
  objc_copyWeak(&v27, &location);
  v29 = v13;
  v20 = v11;
  v26 = v20;
  objc_msgSend(v10, "addAnimations:", v22);
  v21[0] = v17;
  v21[1] = 3221225472;
  v21[2] = __119__CKConversationListCollectionViewController_collectionView_willPerformPreviewActionForMenuWithConfiguration_animator___block_invoke_2;
  v21[3] = &unk_1E274A208;
  v21[4] = self;
  objc_msgSend(v10, "addCompletion:", v21);
  objc_msgSend(v10, "setPreferredCommitStyle:", v13);

  objc_destroyWeak(&v27);
  objc_destroyWeak(&location);

}

void __119__CKConversationListCollectionViewController_collectionView_willPerformPreviewActionForMenuWithConfiguration_animator___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id WeakRetained;
  void *v5;
  id v6;

  if (*(_BYTE *)(a1 + 72))
  {
    objc_msgSend(*(id *)(a1 + 32), "identifier");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "dataSource");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "indexPathForItemIdentifier:", v6);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 48), "selectItemAtIndexPath:animated:scrollPosition:", v3, 1, 0);
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
    objc_msgSend(WeakRetained, "_updateToolbarItems");
  }
  else
  {
    if (!*(_BYTE *)(a1 + 73))
      return;
    objc_msgSend(*(id *)(a1 + 56), "childViewControllers");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "firstObject");
    v6 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "conversation");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 1048));
    objc_msgSend(WeakRetained, "showConversation:animate:", v3, 1);
  }

}

void __119__CKConversationListCollectionViewController_collectionView_willPerformPreviewActionForMenuWithConfiguration_animator___block_invoke_2(uint64_t a1)
{
  dispatch_time_t v2;
  _QWORD block[5];

  v2 = dispatch_time(0, 300000000);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __119__CKConversationListCollectionViewController_collectionView_willPerformPreviewActionForMenuWithConfiguration_animator___block_invoke_3;
  block[3] = &unk_1E274A208;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_after(v2, MEMORY[0x1E0C80D38], block);
}

void __119__CKConversationListCollectionViewController_collectionView_willPerformPreviewActionForMenuWithConfiguration_animator___block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  char isKindOfClass;
  id v5;
  id v6;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 1048));
  objc_msgSend(WeakRetained, "chatController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    v5 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 1048));
    objc_msgSend(v5, "chatController");
    v6 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "showKeyboardForReply");
  }
}

- (void)collectionView:(id)a3 willDisplayContextMenuWithConfiguration:(id)a4 animator:(id)a5
{
  void *v6;
  id v7;
  void *v8;
  id v9;

  objc_msgSend(a4, "identifier", a3);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[CKConversationListCollectionViewController itemIdentifiersForVisibleContextMenuInteractions](self, "itemIdentifiersForVisibleContextMenuInteractions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    v7 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    -[CKConversationListCollectionViewController setItemIdentifiersForVisibleContextMenuInteractions:](self, "setItemIdentifiersForVisibleContextMenuInteractions:", v7);

  }
  -[CKConversationListCollectionViewController itemIdentifiersForVisibleContextMenuInteractions](self, "itemIdentifiersForVisibleContextMenuInteractions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObject:", v9);

  -[CKConversationListCollectionViewController updateContentsOfCellWithItemIdentifier:animated:](self, "updateContentsOfCellWithItemIdentifier:animated:", v9, 1);
}

- (void)collectionView:(id)a3 willEndContextMenuInteractionWithConfiguration:(id)a4 animator:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  _QWORD aBlock[4];
  id v15;
  id v16;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  location = 0;
  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __117__CKConversationListCollectionViewController_collectionView_willEndContextMenuInteractionWithConfiguration_animator___block_invoke_2;
  aBlock[3] = &unk_1E274D388;
  v11 = v9;
  v15 = v11;
  objc_copyWeak(&v16, &location);
  v12 = _Block_copy(aBlock);
  v13 = v12;
  if (v10)
  {
    objc_msgSend(v10, "addAnimations:", &__block_literal_global_233_0);
    objc_msgSend(v10, "addCompletion:", v13);
  }
  else
  {
    (*((void (**)(void *))v12 + 2))(v12);
  }

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

}

void __117__CKConversationListCollectionViewController_collectionView_willEndContextMenuInteractionWithConfiguration_animator___block_invoke_2(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  id v5;
  id v6;
  void *v7;
  _QWORD *v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  id v19;

  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v19 = (id)objc_claimAutoreleasedReturnValue();
  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "itemIdentifiersForVisibleContextMenuInteractions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObject:", v19);

  v5 = objc_loadWeakRetained(v2);
  objc_msgSend(v5, "updateContentsOfCellWithItemIdentifier:animated:", v19, 1);

  if (!CKIsRunningInMacCatalyst())
  {
    v6 = objc_loadWeakRetained(v2);
    objc_msgSend(v6, "conversationToUnpinPendingOrbDismissal");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = (_QWORD *)MEMORY[0x1E0D35618];
    if (v7)
    {
      v9 = objc_loadWeakRetained(v2);
      objc_msgSend(v9, "setPinningInteractionMethod:", 4);

      v10 = objc_loadWeakRetained(v2);
      objc_msgSend(v10, "conversationToUnpinPendingOrbDismissal");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "unpinConversation:withReason:", v11, *v8);

      v12 = objc_loadWeakRetained(v2);
      objc_msgSend(v12, "setConversationToUnpinPendingOrbDismissal:", 0);

    }
    v13 = objc_loadWeakRetained(v2);
    objc_msgSend(v13, "conversationToPinPendingOrbDismissal");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      v15 = objc_loadWeakRetained(v2);
      objc_msgSend(v15, "setPinningInteractionMethod:", 4);

      v16 = objc_loadWeakRetained(v2);
      objc_msgSend(v16, "conversationToPinPendingOrbDismissal");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "pinConversation:withReason:", v17, *v8);

      v18 = objc_loadWeakRetained(v2);
      objc_msgSend(v18, "setConversationToPinPendingOrbDismissal:", 0);

    }
  }

}

- (id)_topLevelMenuForMultipleSelectedConversations:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  int v17;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[CKConversationListCollectionViewController filterMode](self, "filterMode") == 7)
  {
    -[CKConversationListCollectionViewController recentlyDeletedConversationMenu:](self, "recentlyDeletedConversationMenu:", v4);
    v5 = objc_claimAutoreleasedReturnValue();
LABEL_5:
    v6 = (void *)v5;
    goto LABEL_21;
  }
  if (-[CKConversationListCollectionViewController filterMode](self, "filterMode") == 9)
  {
    -[CKConversationListCollectionViewController junkConversationMenu:](self, "junkConversationMenu:", v4);
    v5 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKConversationListCollectionViewController _markAsActionForConversations:](self, "_markAsActionForConversations:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKConversationListCollectionViewController _muteActionConversations:](self, "_muteActionConversations:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKConversationListCollectionViewController _deleteActionForSelectedConversations:](self, "_deleteActionForSelectedConversations:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    objc_msgSend(v7, "addObject:", v8);
  if (v9)
    objc_msgSend(v7, "addObject:", v9);
  if (v10)
  {
    v11 = (void *)MEMORY[0x1E0CEA740];
    v19[0] = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "menuWithTitle:image:identifier:options:children:", &stru_1E276D870, 0, 0, 1, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "addObject:", v13);
  }
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "BOOLForKey:", CFSTR("CKInternalInstallShouldHideDebugMenu"));

  objc_msgSend(MEMORY[0x1E0D36A50], "sharedInstance");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v16, "isInternalInstall") || (v15 & 1) != 0)
    goto LABEL_16;
  v17 = CKIsRunningInMacCatalyst();

  if (!v17)
  {
    -[CKConversationListCollectionViewController _internalMenuForSelectedConversations:](self, "_internalMenuForSelectedConversations:", v4);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v16);
LABEL_16:

  }
  if (objc_msgSend(v7, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CEA740], "menuWithTitle:children:", &stru_1E276D870, v7);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

LABEL_21:
  return v6;
}

- (id)_topLevelMenuForItemIdentifier:(id)a3 inSection:(unint64_t)a4 withCell:(id)a5
{
  void *v5;
  void *v6;

  -[CKConversationListCollectionViewController _conversationActionMenusForItemIdentifier:inSection:withCell:forSearch:](self, "_conversationActionMenusForItemIdentifier:inSection:withCell:forSearch:", a3, a4, a5, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CEA740], "menuWithTitle:children:", &stru_1E276D870, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)_conversationActionMenusForItemIdentifier:(id)a3 inSection:(unint64_t)a4 withCell:(id)a5 forSearch:(BOOL)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void **v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  CKConversationListControllerDelegate **p_delegate;
  id WeakRetained;
  void *v33;
  char isKindOfClass;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v42;
  void *v43;
  int v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  char v51;
  int v52;
  void *v53;
  void *v54;
  void *v55;
  id v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  uint64_t v64;
  void *v65;
  void *v66;
  void *v67;
  _QWORD v68[2];

  v68[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a5;
  -[CKConversationListCollectionViewController conversationForItemIdentifier:](self, "conversationForItemIdentifier:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v68[0] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v68, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[CKConversationListCollectionViewController filterMode](self, "filterMode") != 7)
  {
    if (-[CKConversationListCollectionViewController filterMode](self, "filterMode") == 9)
    {
      -[CKConversationListCollectionViewController junkConversationMenu:](self, "junkConversationMenu:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v66 = v14;
      v15 = (void *)MEMORY[0x1E0C99D20];
      v16 = &v66;
      goto LABEL_5;
    }
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", MEMORY[0x1E0C9AA60]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKConversationListCollectionViewController _deleteConversationActionForItemIdentifier:withCell:](self, "_deleteConversationActionForItemIdentifier:withCell:", v10, v11);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    if (a4 == 4
      && -[CKConversationListCollectionViewController sectionHasActionableConversations:](self, "sectionHasActionableConversations:", 4))
    {
      v18 = (void *)MEMORY[0x1E0CEA740];
      v65 = v63;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v65, 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "menuWithTitle:image:identifier:options:children:", &stru_1E276D870, 0, 0, 1, v19);
      v20 = objc_claimAutoreleasedReturnValue();

      v21 = (void *)v20;
      objc_msgSend(v14, "addObject:", v20);
      v17 = (void *)objc_msgSend(v14, "copy");
LABEL_28:

      goto LABEL_29;
    }
    -[CKConversationListCollectionViewController _pinActionForItemIdentifier:](self, "_pinActionForItemIdentifier:", v10);
    v22 = objc_claimAutoreleasedReturnValue();
    -[CKConversationListCollectionViewController _markAsActionForConversations:](self, "_markAsActionForConversations:", v13);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKConversationListCollectionViewController _muteActionConversations:](self, "_muteActionConversations:", v13);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKConversationListCollectionViewController _openConversationInNewWindowActionForItemIdentifier:](self, "_openConversationInNewWindowActionForItemIdentifier:", v10);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = (void *)v22;
    if (CKIsRunningInMacCatalyst())
    {
      if (v22)
      {
        v23 = (void *)MEMORY[0x1E0CEA740];
        v64 = v22;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v64, 1);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "menuWithTitle:image:identifier:options:children:", &stru_1E276D870, 0, 0, 1, v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v14, "addObject:", v25);
      }
      v26 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v27 = v26;
      if (v62)
        objc_msgSend(v26, "addObject:");
      if (v61)
        objc_msgSend(v27, "addObject:");
      objc_msgSend(MEMORY[0x1E0CEA740], "menuWithTitle:image:identifier:options:children:", &stru_1E276D870, 0, 0, 1, v27);
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "addObject:");
      objc_msgSend(v27, "removeAllObjects");
      -[CKConversationListCollectionViewController _conversationDetailsActionForItemIdentifier:withCell:](self, "_conversationDetailsActionForItemIdentifier:withCell:", v10, v11);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      if (v60)
        objc_msgSend(v27, "addObject:");
      if (v28 && !a6)
        objc_msgSend(v27, "addObject:", v28);
      objc_msgSend(MEMORY[0x1E0CEA740], "menuWithTitle:image:identifier:options:children:", &stru_1E276D870, 0, 0, 1, v27);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "addObject:", v29);
      objc_msgSend(v27, "removeAllObjects");
      if (v63)
        objc_msgSend(v27, "addObject:", v63);
      objc_msgSend(MEMORY[0x1E0CEA740], "menuWithTitle:image:identifier:options:children:", &stru_1E276D870, 0, 0, 1, v27);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "addObject:", v30);

    }
    else
    {
      v42 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v27 = v42;
      if (v22)
        objc_msgSend(v42, "addObject:", v22);
      if (v62)
        objc_msgSend(v27, "addObject:");
      if (v61)
        objc_msgSend(v27, "addObject:");
      if (v60)
        objc_msgSend(v27, "addObject:", v60);
      if (v63)
        objc_msgSend(v27, "addObject:", v63);
      objc_msgSend(MEMORY[0x1E0CEA740], "menuWithTitle:image:identifier:options:children:", &stru_1E276D870, 0, 0, 1, v27);
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "addObject:");
      objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = objc_msgSend(v43, "isInboxSummaryEnabled");

      if (v44)
      {
        objc_msgSend(v12, "chat");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "chatSummary");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        if (v46)
        {
          v54 = (void *)MEMORY[0x1E0CEA740];
          v56 = v46;
          CKFrameworkBundle();
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v55, "localizedStringForKey:value:table:", CFSTR("FEEDBACK"), &stru_1E276D870, CFSTR("ChatKit"));
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "chat");
          v57 = v45;
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          -[CKConversationListCollectionViewController feedbackMenuElementsFor:](self, "feedbackMenuElementsFor:", v47);
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v54, "menuWithTitle:image:identifier:options:children:", v53, 0, 0, 1, v48);
          v49 = (void *)objc_claimAutoreleasedReturnValue();

          v45 = v57;
          objc_msgSend(v14, "addObject:", v49);

          v46 = v56;
        }

      }
      objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = objc_msgSend(v50, "BOOLForKey:", CFSTR("CKInternalInstallShouldHideDebugMenu"));

      objc_msgSend(MEMORY[0x1E0D36A50], "sharedInstance");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v28, "isInternalInstall") && (v51 & 1) == 0)
      {
        v52 = CKIsRunningInMacCatalyst();

        if (v52)
          goto LABEL_25;
        -[CKConversationListCollectionViewController _internalMenuForSelectedConversation:](self, "_internalMenuForSelectedConversation:", v12);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "addObject:", v28);
      }
    }

LABEL_25:
    p_delegate = &self->_delegate;
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "chatController");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      v35 = objc_loadWeakRetained((id *)p_delegate);
      objc_msgSend(v35, "chatController");
      v36 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v36, "entryView");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "contentView");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "textView");
      v39 = (void *)objc_claimAutoreleasedReturnValue();

      v40 = (void *)objc_opt_new();
      objc_msgSend(v39, "setPasteConfiguration:", v40);

    }
    v17 = (void *)objc_msgSend(v14, "copy");

    v21 = v59;
    goto LABEL_28;
  }
  -[CKConversationListCollectionViewController recentlyDeletedConversationMenu:](self, "recentlyDeletedConversationMenu:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v67 = v14;
  v15 = (void *)MEMORY[0x1E0C99D20];
  v16 = &v67;
LABEL_5:
  objc_msgSend(v15, "arrayWithObjects:count:", v16, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_29:

  return v17;
}

- (id)_internalMenuForSelectedConversation:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v4 = (void *)MEMORY[0x1E0C99D20];
  v5 = a3;
  objc_msgSend(v4, "arrayWithObjects:count:", &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[CKConversationListCollectionViewController _internalMenuForSelectedConversations:customMenuElements:](self, "_internalMenuForSelectedConversations:customMenuElements:", v6, 0, v9, v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_internalMenuForSelectedConversations:(id)a3
{
  return -[CKConversationListCollectionViewController _internalMenuForSelectedConversations:customMenuElements:](self, "_internalMenuForSelectedConversations:customMenuElements:", a3, 0);
}

- (id)_internalMenuForSelectedConversations:(id)a3 customMenuElements:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v19[4];
  id v20;
  id v21;
  id location;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  location = 0;
  objc_initWeak(&location, self);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0CEA2A8];
  objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:", CFSTR("info.circle"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __103__CKConversationListCollectionViewController__internalMenuForSelectedConversations_customMenuElements___block_invoke;
  v19[3] = &unk_1E274B010;
  objc_copyWeak(&v21, &location);
  v11 = v6;
  v20 = v11;
  objc_msgSend(v9, "actionWithTitle:image:identifier:handler:", CFSTR("Conversation Details"), v10, 0, v19);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "addObject:", v12);
  if (v7)
    objc_msgSend(v8, "addObjectsFromArray:", v7);
  objc_msgSend(MEMORY[0x1E0CEA740], "menuWithTitle:image:identifier:options:children:", &stru_1E276D870, 0, 0, 1, v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)MEMORY[0x1E0CEA740];
  objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:", CFSTR("apple.logo"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "menuWithTitle:image:identifier:options:children:", CFSTR("Internal"), v15, 0, 128, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);

  return v17;
}

void __103__CKConversationListCollectionViewController__internalMenuForSelectedConversations_customMenuElements___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "windowScene");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v6, "showInspectorViewForConversations:", *(_QWORD *)(a1 + 32));

}

- (id)_markAsActionForConversations:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;
  void *v7;
  unint64_t v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  unint64_t v12;
  void *v13;
  void *v14;
  _QWORD v16[4];
  id v17;
  id v18;
  BOOL v19;
  id location;

  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    -[CKConversationListCollectionViewController _conversationsEligibleForReadStateToggle:](self, "_conversationsEligibleForReadStateToggle:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "count"))
    {
      v6 = -[CKConversationListCollectionViewController _hasReadAllConversations:](self, "_hasReadAllConversations:", v5);
      if (v6)
      {
        objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:", CFSTR("message.badge"));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v5, "count");
        CKFrameworkBundle();
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v8 > 1)
          v10 = CFSTR("MARK_AS_UNREAD_PLURAL");
        else
          v10 = CFSTR("MARK_AS_UNREAD");
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:", CFSTR("checkmark.message"));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v5, "count");
        CKFrameworkBundle();
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12 >= 2)
          v10 = CFSTR("MARK_AS_READ_PLURAL");
        else
          v10 = CFSTR("MARK_AS_READ");
      }
      objc_msgSend(v9, "localizedStringForKey:value:table:", v10, &stru_1E276D870, CFSTR("ChatKit"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      location = 0;
      objc_initWeak(&location, self);
      v14 = (void *)MEMORY[0x1E0CEA2A8];
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __76__CKConversationListCollectionViewController__markAsActionForConversations___block_invoke;
      v16[3] = &unk_1E2757B58;
      objc_copyWeak(&v18, &location);
      v17 = v4;
      v19 = v6;
      objc_msgSend(v14, "actionWithTitle:image:identifier:handler:", v13, v7, 0, v16);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_destroyWeak(&v18);
      objc_destroyWeak(&location);

    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

void __76__CKConversationListCollectionViewController__markAsActionForConversations___block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  id v4;

  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_updateConversations:asRead:", *(_QWORD *)(a1 + 32), *(_BYTE *)(a1 + 48) == 0);

  v4 = objc_loadWeakRetained(v2);
  objc_msgSend(v4, "updateContentsOfAllCellsAnimated:", 1);

}

- (BOOL)_hasReadAllConversations:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  BOOL v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = a3;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "hasUnreadMessages", (_QWORD)v10) & 1) != 0)
        {
          v8 = 0;
          goto LABEL_11;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v5)
        continue;
      break;
    }
  }
  v8 = 1;
LABEL_11:

  return v8;
}

- (id)_conversationsEligibleForReadStateToggle:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  _QWORD v8[4];
  id v9;

  v3 = (void *)MEMORY[0x1E0C99DE8];
  v4 = a3;
  objc_msgSend(v3, "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __87__CKConversationListCollectionViewController__conversationsEligibleForReadStateToggle___block_invoke;
  v8[3] = &unk_1E274C638;
  v6 = v5;
  v9 = v6;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v8);

  return v6;
}

void __87__CKConversationListCollectionViewController__conversationsEligibleForReadStateToggle___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(v3, "canReadStateBeToggled"))
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

}

- (void)_updateConversations:(id)a3 asRead:(BOOL)a4
{
  _QWORD v4[4];
  BOOL v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __74__CKConversationListCollectionViewController__updateConversations_asRead___block_invoke;
  v4[3] = &__block_descriptor_33_e31_v32__0__CKConversation_8Q16_B24l;
  v5 = a4;
  objc_msgSend(a3, "enumerateObjectsUsingBlock:", v4);
}

uint64_t __74__CKConversationListCollectionViewController__updateConversations_asRead___block_invoke(uint64_t a1, void *a2)
{
  if (*(_BYTE *)(a1 + 32))
    return objc_msgSend(a2, "markAllMessagesAsRead");
  else
    return objc_msgSend(a2, "markLastMessageAsUnread");
}

- (id)_pinActionForItemIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  int v9;
  NSObject *v10;
  void *v11;
  void *v12;
  const __CFString *v13;
  const __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v20[4];
  id v21;
  id v22;
  char v23;
  id location;

  v4 = a3;
  if (-[CKConversationListCollectionViewController shouldShowPinnedConversations](self, "shouldShowPinnedConversations"))
  {
    -[CKConversationListCollectionViewController conversationForItemIdentifier:](self, "conversationForItemIdentifier:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      -[CKConversationListCollectionViewController dataSource](self, "dataSource");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "indexPathForItemIdentifier:", v4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      v8 = objc_msgSend(v7, "section");
      v9 = v8 == 2;
      if (v9 != objc_msgSend(v5, "isPinned"))
      {
        IMLogHandleForCategory();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          -[CKConversationListCollectionViewController _pinActionForItemIdentifier:].cold.1(v5, v8 == 2, v10);

      }
      CKFrameworkBundle();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      if (v8 == 2)
        v13 = CFSTR("UNPIN_ACTION");
      else
        v13 = CFSTR("PIN_ACTION");
      if (v8 == 2)
        v14 = CFSTR("pin.slash");
      else
        v14 = CFSTR("pin");
      objc_msgSend(v11, "localizedStringForKey:value:table:", v13, &stru_1E276D870, CFSTR("ChatKit"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:", v14);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      location = 0;
      objc_initWeak(&location, self);
      v17 = (void *)MEMORY[0x1E0CEA2A8];
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __74__CKConversationListCollectionViewController__pinActionForItemIdentifier___block_invoke;
      v20[3] = &unk_1E2757B58;
      objc_copyWeak(&v22, &location);
      v23 = v9;
      v21 = v5;
      objc_msgSend(v17, "actionWithTitle:image:identifier:handler:", v15, v16, 0, v20);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      objc_destroyWeak(&v22);
      objc_destroyWeak(&location);

    }
    else
    {
      v18 = 0;
    }

  }
  else
  {
    v18 = 0;
  }

  return v18;
}

void __74__CKConversationListCollectionViewController__pinActionForItemIdentifier___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  id v8;
  id v9;

  if (CKIsRunningInMacCatalyst())
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(WeakRetained, "setPinningInteractionMethod:", 4);

    LODWORD(WeakRetained) = *(unsigned __int8 *)(a1 + 48);
    v3 = objc_loadWeakRetained((id *)(a1 + 40));
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *MEMORY[0x1E0D35618];
    v9 = v3;
    if ((_DWORD)WeakRetained)
      objc_msgSend(v3, "unpinConversation:withReason:", v4, v5);
    else
      objc_msgSend(v3, "pinConversation:withReason:", v4, v5);
  }
  else
  {
    v6 = *(unsigned __int8 *)(a1 + 48);
    v7 = *(_QWORD *)(a1 + 32);
    v8 = objc_loadWeakRetained((id *)(a1 + 40));
    v9 = v8;
    if (v6)
      objc_msgSend(v8, "setConversationToUnpinPendingOrbDismissal:", v7);
    else
      objc_msgSend(v8, "setConversationToPinPendingOrbDismissal:", v7);
  }

}

- (id)_muteActionConversations:(id)a3
{
  id v4;
  void *v5;
  _BOOL4 v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t);
  void *v20;
  id v21;
  id v22;
  BOOL v23;
  id location;

  v4 = a3;
  -[CKConversationListCollectionViewController _conversationsEligibleForMute:](self, "_conversationsEligibleForMute:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "count"))
  {
    v11 = 0;
    goto LABEL_14;
  }
  v6 = -[CKConversationListCollectionViewController _hasAlertsEnabledForAllConversations:](self, "_hasAlertsEnabledForAllConversations:", v5);
  v7 = CKIsRunningInMacCatalyst();
  CKFrameworkBundle();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v7)
  {
    objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("CONVERSATION_LIST_CONTEXT_MENU_MAC_HIDE_ALERTS_TOGGLE_ACTION_TITLE"), &stru_1E276D870, CFSTR("ChatKit"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
      goto LABEL_10;
  }
  else
  {
    if (!v6)
    {
      objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("CONVERSATION_LIST_CONTEXT_MENU_SHOW_ALERTS_ACTION_TITLE"), &stru_1E276D870, CFSTR("ChatKit"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_10:
      v12 = CFSTR("bell");
      goto LABEL_11;
    }
    objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("CONVERSATION_LIST_CONTEXT_MENU_HIDE_ALERTS_ACTION_TITLE"), &stru_1E276D870, CFSTR("ChatKit"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v12 = CFSTR("bell.slash");
LABEL_11:
  objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  location = 0;
  objc_initWeak(&location, self);
  v14 = (void *)MEMORY[0x1E0CEA2A8];
  v17 = MEMORY[0x1E0C809B0];
  v18 = 3221225472;
  v19 = __71__CKConversationListCollectionViewController__muteActionConversations___block_invoke;
  v20 = &unk_1E2757B58;
  objc_copyWeak(&v22, &location);
  v21 = v5;
  v23 = v6;
  objc_msgSend(v14, "actionWithTitle:image:identifier:handler:", v10, v13, 0, &v17);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (CKIsRunningInMacCatalyst())
    objc_msgSend(v15, "setState:", !v6, v17, v18, v19, v20);
  v11 = v15;

  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);

LABEL_14:
  return v11;
}

void __71__CKConversationListCollectionViewController__muteActionConversations___block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  id v4;

  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_updateConversations:alertsHidden:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 48));

  v4 = objc_loadWeakRetained(v2);
  objc_msgSend(v4, "updateContentsOfAllCellsAnimated:", 1);

}

- (BOOL)_hasAlertsEnabledForAllConversations:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  BOOL v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = a3;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "isMuted", (_QWORD)v10) & 1) != 0)
        {
          v8 = 0;
          goto LABEL_11;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v5)
        continue;
      break;
    }
  }
  v8 = 1;
LABEL_11:

  return v8;
}

- (id)_conversationsEligibleForMute:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  _QWORD v8[4];
  id v9;

  v3 = (void *)MEMORY[0x1E0C99DE8];
  v4 = a3;
  objc_msgSend(v3, "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __76__CKConversationListCollectionViewController__conversationsEligibleForMute___block_invoke;
  v8[3] = &unk_1E274C638;
  v6 = v5;
  v9 = v6;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v8);

  return v6;
}

void __76__CKConversationListCollectionViewController__conversationsEligibleForMute___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(v3, "canMuteStateBeToggled"))
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

}

- (void)_updateConversations:(id)a3 alertsHidden:(BOOL)a4
{
  _QWORD v4[4];
  BOOL v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __80__CKConversationListCollectionViewController__updateConversations_alertsHidden___block_invoke;
  v4[3] = &__block_descriptor_33_e31_v32__0__CKConversation_8Q16_B24l;
  v5 = a4;
  objc_msgSend(a3, "enumerateObjectsUsingBlock:", v4);
}

void __80__CKConversationListCollectionViewController__updateConversations_alertsHidden___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  if (*(_BYTE *)(a1 + 32))
  {
    v2 = (void *)MEMORY[0x1E0C99D68];
    v3 = a2;
    objc_msgSend(v2, "distantFuture");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setMutedUntilDate:");

  }
  else
  {
    v4 = a2;
    objc_msgSend(v4, "unmute");
  }

}

- (id)_deleteConversationActionForItemIdentifier:(id)a3 withCell:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t);
  void *v22;
  id v23;
  id v24;
  id v25;
  id location;

  v6 = a3;
  v7 = a4;
  -[CKConversationListCollectionViewController conversationForItemIdentifier:](self, "conversationForItemIdentifier:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8 && objc_msgSend(v8, "isUserDeletable"))
  {
    v10 = CKIsRunningInMacCatalyst();
    CKFrameworkBundle();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v10)
      v13 = CFSTR("DELETE_ELLIPSIS");
    else
      v13 = CFSTR("DELETE");
    objc_msgSend(v11, "localizedStringForKey:value:table:", v13, &stru_1E276D870, CFSTR("ChatKit"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:", CFSTR("trash"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    location = 0;
    objc_initWeak(&location, self);
    v16 = (void *)MEMORY[0x1E0CEA2A8];
    v19 = MEMORY[0x1E0C809B0];
    v20 = 3221225472;
    v21 = __98__CKConversationListCollectionViewController__deleteConversationActionForItemIdentifier_withCell___block_invoke;
    v22 = &unk_1E2757BA0;
    objc_copyWeak(&v25, &location);
    v23 = v6;
    v24 = v7;
    objc_msgSend(v16, "actionWithTitle:image:identifier:handler:", v14, v15, 0, &v19);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (!CKIsRunningInMacCatalyst())
      objc_msgSend(v17, "setAttributes:", 2, v19, v20, v21, v22, v23);

    objc_destroyWeak(&v25);
    objc_destroyWeak(&location);

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

void __98__CKConversationListCollectionViewController__deleteConversationActionForItemIdentifier_withCell___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "deleteButtonTappedForItemIdentifier:completionHandler:cellToUpdate:", *(_QWORD *)(a1 + 32), 0, *(_QWORD *)(a1 + 40));

}

- (id)_deleteActionForSelectedConversations:(id)a3
{
  id v4;
  int v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  _QWORD v15[4];
  id v16;
  id location[2];

  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    v5 = CKIsRunningInMacCatalyst();
    CKFrameworkBundle();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v5)
      v8 = CFSTR("DELETE_ELLIPSIS");
    else
      v8 = CFSTR("DELETE");
    objc_msgSend(v6, "localizedStringForKey:value:table:", v8, &stru_1E276D870, CFSTR("ChatKit"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:", CFSTR("trash"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    location[0] = 0;
    objc_initWeak(location, self);
    v11 = (void *)MEMORY[0x1E0CEA2A8];
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __84__CKConversationListCollectionViewController__deleteActionForSelectedConversations___block_invoke;
    v15[3] = &unk_1E274A4C0;
    objc_copyWeak(&v16, location);
    objc_msgSend(v11, "actionWithTitle:image:identifier:handler:", v9, v10, 0, v15);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!CKIsRunningInMacCatalyst())
      objc_msgSend(v12, "setAttributes:", 2);
    objc_destroyWeak(&v16);
    objc_destroyWeak(location);

  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        LOWORD(location[0]) = 0;
        _os_log_impl(&dword_18DFCD000, v13, OS_LOG_TYPE_INFO, "No conversations to perform delete on.", (uint8_t *)location, 2u);
      }

    }
    v12 = 0;
  }

  return v12;
}

void __84__CKConversationListCollectionViewController__deleteActionForSelectedConversations___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "recoverableDeleteSelectedConversations");

}

- (id)_openConversationInNewWindowActionForItemIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id location;

  v4 = a3;
  if ((IMSharedHelperDeviceIsiPad() & 1) != 0 || CKIsRunningInMacCatalyst())
  {
    -[CKConversationListCollectionViewController conversationForItemIdentifier:](self, "conversationForItemIdentifier:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5 && (objc_msgSend(v5, "isPending") & 1) == 0)
    {
      if (CKIsRunningInMacCatalyst())
      {
        location = 0;
        objc_initWeak(&location, self);
        v8 = (void *)MEMORY[0x1E0CEA2A8];
        CKFrameworkBundle();
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("OPEN_IN_NEW_WINDOW"), &stru_1E276D870, CFSTR("ChatKit"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v19[0] = MEMORY[0x1E0C809B0];
        v19[1] = 3221225472;
        v19[2] = __98__CKConversationListCollectionViewController__openConversationInNewWindowActionForItemIdentifier___block_invoke;
        v19[3] = &unk_1E274B010;
        objc_copyWeak(&v21, &location);
        v20 = v6;
        objc_msgSend(v8, "actionWithTitle:image:identifier:handler:", v10, 0, 0, v19);
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        objc_destroyWeak(&v21);
        objc_destroyWeak(&location);
      }
      else
      {
        objc_msgSend(v6, "activityForNewScene");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
        {
          objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:", CFSTR("rectangle.badge.plus"));
          v12 = objc_claimAutoreleasedReturnValue();
          v13 = (void *)MEMORY[0x1E0CEA2A8];
          CKFrameworkBundle();
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("OPEN_IN_NEW_WINDOW"), &stru_1E276D870, CFSTR("ChatKit"));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v17[0] = MEMORY[0x1E0C809B0];
          v17[1] = 3221225472;
          v17[2] = __98__CKConversationListCollectionViewController__openConversationInNewWindowActionForItemIdentifier___block_invoke_2;
          v17[3] = &unk_1E274B178;
          v18 = v11;
          objc_msgSend(v13, "actionWithTitle:image:identifier:handler:", v15, v12, 0, v17);
          v7 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          IMLogHandleForCategory();
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
            -[CKConversationListCollectionViewController _openConversationInNewWindowActionForItemIdentifier:].cold.1();
          v7 = 0;
        }

      }
    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

void __98__CKConversationListCollectionViewController__openConversationInNewWindowActionForItemIdentifier___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "showConversationInNewWindow:", *(_QWORD *)(a1 + 32));

}

void __98__CKConversationListCollectionViewController__openConversationInNewWindowActionForItemIdentifier___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;

  v3 = objc_alloc_init(MEMORY[0x1E0CEAC30]);
  objc_msgSend(v3, "setPreferredPresentationStyle:", 2);
  objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "requestSceneSessionActivation:userActivity:options:errorHandler:", 0, *(_QWORD *)(a1 + 32), v3, 0);

}

- (id)_conversationDetailsActionForItemIdentifier:(id)a3 withCell:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  id location;

  v6 = a3;
  v7 = a4;
  -[CKConversationListCollectionViewController conversationForItemIdentifier:](self, "conversationForItemIdentifier:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "chat");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    location = 0;
    objc_initWeak(&location, self);
    v10 = (void *)MEMORY[0x1E0CEA2A8];
    CKFrameworkBundle();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("SHOW_DETAILS"), &stru_1E276D870, CFSTR("ChatKit"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __99__CKConversationListCollectionViewController__conversationDetailsActionForItemIdentifier_withCell___block_invoke;
    v14[3] = &unk_1E2757BA0;
    objc_copyWeak(&v17, &location);
    v15 = v6;
    v16 = v7;
    objc_msgSend(v10, "actionWithTitle:image:identifier:handler:", v12, 0, 0, v14);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }

  return v9;
}

void __99__CKConversationListCollectionViewController__conversationDetailsActionForItemIdentifier_withCell___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "presentDetailsForItemIdentifier:fromView:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)presentDetailsForItemIdentifier:(id)a3 fromView:(id)a4
{
  id v6;
  void *v7;
  CKDetailsControllerAdapter *v8;
  CKDetailsNavigationController *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  _QWORD aBlock[4];
  id v35;
  _QWORD v36[2];

  v36[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  -[CKConversationListCollectionViewController conversationForItemIdentifier:](self, "conversationForItemIdentifier:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[CKDetailsControllerAdapter initWithConversation:]([CKDetailsControllerAdapter alloc], "initWithConversation:", v7);
  v9 = -[CKDetailsNavigationController initWithNavigationBarClass:toolbarClass:]([CKDetailsNavigationController alloc], "initWithNavigationBarClass:toolbarClass:", objc_opt_class(), 0);
  -[CKDetailsNavigationController setDetailsAdapter:](v9, "setDetailsAdapter:", v8);
  -[CKDetailsControllerAdapter detailsController](v8, "detailsController");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  if (v10)
  {
    v36[0] = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKDetailsNavigationController setViewControllers:](v9, "setViewControllers:", v12);

  }
  else
  {
    -[CKDetailsNavigationController setViewControllers:](v9, "setViewControllers:", MEMORY[0x1E0C9AA60]);
  }
  -[CKDetailsNavigationController setModalPresentationStyle:](v9, "setModalPresentationStyle:", 7);
  -[CKDetailsNavigationController setDelegate:](v9, "setDelegate:", v11);
  -[CKDetailsNavigationController popoverPresentationController](v9, "popoverPresentationController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setSourceView:", v6);

  objc_msgSend(v6, "bounds");
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;
  objc_msgSend(v6, "layoutMargins");
  v23 = v15 + v22;
  v25 = v17 + v24;
  v27 = v19 - (v22 + v26);
  v29 = v21 - (v24 + v28);
  -[CKDetailsNavigationController popoverPresentationController](v9, "popoverPresentationController");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setSourceRect:", v23, v25, v27, v29);

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __87__CKConversationListCollectionViewController_presentDetailsForItemIdentifier_fromView___block_invoke;
  aBlock[3] = &unk_1E274B4F8;
  v35 = v6;
  v31 = v6;
  v32 = _Block_copy(aBlock);
  +[CKAdaptivePresentationController sharedInstance](CKAdaptivePresentationController, "sharedInstance");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "presentViewController:fromViewController:presentationHandler:dismissalHandler:animated:completion:", v9, self, v32, 0, 1, 0);

}

id __87__CKConversationListCollectionViewController_presentDetailsForItemIdentifier_fromView___block_invoke(uint64_t a1, double *a2, _QWORD *a3)
{
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  id result;

  objc_msgSend(*(id *)(a1 + 32), "bounds");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  objc_msgSend(*(id *)(a1 + 32), "layoutMargins");
  *a2 = v7 + v14;
  a2[1] = v9 + v15;
  a2[2] = v11 - (v14 + v16);
  a2[3] = v13 - (v15 + v17);
  result = objc_retainAutorelease(*(id *)(a1 + 32));
  *a3 = result;
  return result;
}

- (void)unpinButtonTappedForCell:(id)a3 withConversation:(id)a4
{
  id v5;

  v5 = a4;
  -[CKConversationListCollectionViewController setPinningInteractionMethod:](self, "setPinningInteractionMethod:", 2);
  -[CKConversationListCollectionViewController unpinConversation:withReason:](self, "unpinConversation:withReason:", v5, *MEMORY[0x1E0D35630]);

}

- (CGRect)collectionViewBoundsForPinnedConversationCollectionViewCell:(id)a3
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGRect result;

  -[CKConversationListCollectionViewController collectionView](self, "collectionView", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v12 = v5;
  v13 = v7;
  v14 = v9;
  v15 = v11;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (BOOL)isDetailsNavigationControllerDetached
{
  void *v2;
  char v3;

  -[CKConversationListCollectionViewController delegate](self, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isDetailsNavigationControllerDetached");

  return v3;
}

- (BOOL)hasDetailsNavigationController
{
  void *v2;
  char v3;

  -[CKConversationListCollectionViewController delegate](self, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasDetailsNavigationController");

  return v3;
}

- (void)dismissDetailsNavigationController
{
  id v2;

  +[CKAdaptivePresentationController sharedInstance](CKAdaptivePresentationController, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (void)dismissDetailsViewAndShowConversationList
{
  id v2;

  -[CKConversationListCollectionViewController delegate](self, "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dismissDetailsControllerAnimated:", 1);

}

- (void)detailsAdapter:(id)a3 wantsToStageComposition:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  if (CKIsRunningInMacCatalyst())
  {
    -[CKConversationListCollectionViewController delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dismissDetailsControllerAnimated:", 1);

    objc_msgSend(v9, "conversation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKConversationListCollectionViewController _showConversation:withComposition:](self, "_showConversation:withComposition:", v8, v6);

  }
}

- (void)detailsAdapterDidDismiss:(id)a3
{
  if (-[CKConversationListCollectionViewController _shouldRestoreFirstResponderAfterDetailsViewDismiss](self, "_shouldRestoreFirstResponderAfterDetailsViewDismiss", a3))
  {
    -[CKConversationListCollectionViewController becomeFirstResponder](self, "becomeFirstResponder");
  }
}

- (void)detailsAdapterWantsToPresentKTContactVerificationUI:(id)a3
{
  void *v4;
  id v5;

  objc_msgSend(a3, "conversation");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "chat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKKeyTransparencyErrorUtilities showKTContactVerificationUIForIMChat:fromViewController:](CKKeyTransparencyErrorUtilities, "showKTContactVerificationUIForIMChat:fromViewController:", v4, self);

}

- (void)detailsAdapterWantsToPresentReportToAppleUI:(id)a3
{
  +[CKKeyTransparencyErrorUtilities showReportToAppleUIFromViewController:](CKKeyTransparencyErrorUtilities, "showReportToAppleUIFromViewController:", self);
}

- (BOOL)_shouldRestoreFirstResponderAfterDetailsViewDismiss
{
  return 0;
}

- (void)pinButtonTappedForCell:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[CKConversationListCollectionViewController collectionView](self, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "indexPathForCell:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[CKConversationListCollectionViewController conversationAtIndexPath:](self, "conversationAtIndexPath:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[CKConversationListCollectionViewController pinConversation:withReason:](self, "pinConversation:withReason:", v7, *MEMORY[0x1E0D35630]);
  }
  else if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = 138412290;
      v10 = v6;
      _os_log_impl(&dword_18DFCD000, v8, OS_LOG_TYPE_INFO, "The user tapped the pin button, but the conversation at index path %@ was nil.", (uint8_t *)&v9, 0xCu);
    }

  }
}

- (void)avatarHeaderWasTappedForConversation:(id)a3
{
  id v4;
  CKDetailsControllerAdapter *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[CKDetailsControllerAdapter initWithConversation:]([CKDetailsControllerAdapter alloc], "initWithConversation:", v4);

  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA7B8]), "initWithNavigationBarClass:toolbarClass:", objc_opt_class(), 0);
  -[CKDetailsControllerAdapter detailsController](v5, "detailsController");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v7)
  {
    v13[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setViewControllers:", v9);

  }
  else
  {
    objc_msgSend(v6, "setViewControllers:", MEMORY[0x1E0C9AA60]);
  }
  objc_msgSend(v6, "setModalPresentationStyle:", 6);
  objc_msgSend(v6, "setDelegate:", v8);
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA380]), "initWithBarButtonSystemItem:target:action:", 0, self, sel__dismissPresentedNavController_);
  objc_msgSend(v8, "navigationItem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setRightBarButtonItem:", v10);

  -[CKConversationListCollectionViewController navigationController](self, "navigationController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "presentViewController:animated:completion:", v6, 1, 0);

}

- (BOOL)listCellIsBeingDisplayedAsGhostedCellInPinnedSection:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  BOOL v9;

  v4 = a3;
  -[CKConversationListCollectionViewController collectionView](self, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "indexPathForCell:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = 0;
  if (v6)
  {
    objc_msgSend(v5, "presentationIndexPathForDataSourceIndexPath:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "section");

    if (v8 == 2)
      v9 = 1;
  }

  return v9;
}

- (void)selectedDeleteButtonForConversation:(id)a3 inCell:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a4;
  -[CKConversationListCollectionViewController collectionView](self, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "indexPathForCell:", v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "section") == 4)
  {
    -[CKConversationListCollectionViewController delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "conversationListControllerTappedDeleteNewMessage:", self);
  }
  else
  {
    -[CKConversationListCollectionViewController dataSource](self, "dataSource");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "itemIdentifierForIndexPath:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[CKConversationListCollectionViewController deleteButtonTappedForItemIdentifier:completionHandler:cellToUpdate:](self, "deleteButtonTappedForItemIdentifier:completionHandler:cellToUpdate:", v7, 0, v9);
  }

}

- (void)togglePinStateForConversation:(id)a3 withReason:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;

  v6 = a3;
  v7 = a4;
  if ((objc_msgSend(MEMORY[0x1E0D358C8], "processSupportsPinnedConversations") & 1) != 0)
  {
    -[CKConversationListCollectionViewController frozenPinnedConversations](self, "frozenPinnedConversations");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      if ((objc_msgSend(v8, "containsObject:", v6) & 1) != 0)
      {
LABEL_4:
        -[CKConversationListCollectionViewController unpinConversation:withReason:](self, "unpinConversation:withReason:", v6, v7);
LABEL_10:

        goto LABEL_11;
      }
    }
    else if (objc_msgSend(v6, "isPinned"))
    {
      goto LABEL_4;
    }
    -[CKConversationListCollectionViewController pinConversation:withReason:](self, "pinConversation:withReason:", v6, v7);
    goto LABEL_10;
  }
  IMLogHandleForCategory();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    -[CKConversationListCollectionViewController togglePinStateForConversation:withReason:].cold.1();

LABEL_11:
}

- (void)unpinConversation:(id)a3 withReason:(id)a4
{
  id v6;
  id v7;
  int v8;
  NSObject *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  id v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _QWORD v34[4];
  id v35;
  uint8_t v36[128];
  uint8_t buf[4];
  id v38;
  __int16 v39;
  id v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if ((objc_msgSend(MEMORY[0x1E0D358C8], "processSupportsPinnedConversations") & 1) != 0)
  {
    if (v6)
    {
      -[CKConversationListCollectionViewController frozenPinnedConversations](self, "frozenPinnedConversations");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = IMOSLoggingEnabled();
      if (v29)
      {
        if (v8)
        {
          OSLogHandleForIMFoundationCategory();
          v9 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v38 = v6;
            _os_log_impl(&dword_18DFCD000, v9, OS_LOG_TYPE_INFO, "-[unpinConversation:] Pinned conversations are frozen. Removing conversation from frozenPinnedConversations: %@", buf, 0xCu);
          }

        }
        v34[0] = MEMORY[0x1E0C809B0];
        v34[1] = 3221225472;
        v34[2] = __75__CKConversationListCollectionViewController_unpinConversation_withReason___block_invoke;
        v34[3] = &unk_1E274C580;
        v35 = v6;
        objc_msgSend(v29, "__imArrayByFilteringWithBlock:", v34);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[CKConversationListCollectionViewController setFrozenPinnedConversations:](self, "setFrozenPinnedConversations:", v10);

        -[CKConversationListCollectionViewController _updateLargeTitleDisplayModeWithAnimation:](self, "_updateLargeTitleDisplayModeWithAnimation:", 1);
        -[CKConversationListCollectionViewController updateSnapshotAnimatingDifferences:](self, "updateSnapshotAnimatingDifferences:", 1);
        v11 = v35;
        goto LABEL_39;
      }
      if (v8)
      {
        OSLogHandleForIMFoundationCategory();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          v38 = v7;
          v39 = 2112;
          v40 = v6;
          _os_log_impl(&dword_18DFCD000, v14, OS_LOG_TYPE_INFO, "-[unpinConversation:] reason: %@, conversation: %@", buf, 0x16u);
        }

      }
      -[CKConversationListCollectionViewController dataSource](self, "dataSource");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "snapshot");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      -[CKConversationListCollectionViewController pinnedConversationsFromSnapshot:](self, "pinnedConversationsFromSnapshot:", v11);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = (void *)objc_msgSend(v16, "mutableCopy");

      objc_msgSend(v6, "pinningIdentifier");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v27, "length"))
      {
        v17 = objc_msgSend(v28, "count");
        objc_msgSend(v28, "removeObject:", v6);
        if (v17 != objc_msgSend(v28, "count"))
        {
          v19 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          v32 = 0u;
          v33 = 0u;
          v30 = 0u;
          v31 = 0u;
          v20 = v28;
          v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
          if (v21)
          {
            v22 = *(_QWORD *)v31;
            do
            {
              for (i = 0; i != v21; ++i)
              {
                if (*(_QWORD *)v31 != v22)
                  objc_enumerationMutation(v20);
                objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * i), "chat");
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v19, "addObject:", v24);

              }
              v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
            }
            while (v21);
          }

          objc_msgSend(MEMORY[0x1E0D358C8], "sharedInstance");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = (void *)objc_msgSend(v19, "copy");
          objc_msgSend(v25, "setPinnedChats:withUpdateReason:", v26, v7);

          goto LABEL_38;
        }
        if (!IMOSLoggingEnabled())
        {
LABEL_38:

LABEL_39:
          goto LABEL_40;
        }
        OSLogHandleForIMFoundationCategory();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v38 = v6;
          _os_log_impl(&dword_18DFCD000, v18, OS_LOG_TYPE_INFO, "Attempted to unpin conversation with identifier that was not in the pinned conversation identifier list. Ignoring. Conversation: %@", buf, 0xCu);
        }
      }
      else
      {
        if (!IMOSLoggingEnabled())
          goto LABEL_38;
        OSLogHandleForIMFoundationCategory();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v38 = v6;
          _os_log_impl(&dword_18DFCD000, v18, OS_LOG_TYPE_INFO, "Attempted to unpin conversation with nil identifier. Ignoring. Conversation: %@", buf, 0xCu);
        }
      }

      goto LABEL_38;
    }
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18DFCD000, v13, OS_LOG_TYPE_INFO, "Tried to unpin a nil conversation.", buf, 2u);
      }

    }
  }
  else
  {
    IMLogHandleForCategory();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[CKConversationListCollectionViewController unpinConversation:withReason:].cold.1();

  }
LABEL_40:

}

uint64_t __75__CKConversationListCollectionViewController_unpinConversation_withReason___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "pinningIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "pinningIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqualToString:", v4) ^ 1;

  return v5;
}

- (void)pinConversation:(id)a3 withReason:(id)a4
{
  id v6;
  id v7;
  void *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  NSObject *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  id v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t j;
  void *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  uint8_t v47[128];
  uint8_t buf[4];
  id v49;
  __int16 v50;
  id v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if ((objc_msgSend(MEMORY[0x1E0D358C8], "processSupportsPinnedConversations") & 1) != 0)
  {
    if (v6)
    {
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "maximumNumberOfPinnedConversations");

      -[CKConversationListCollectionViewController frozenPinnedConversations](self, "frozenPinnedConversations");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      if (v10)
      {
        if (objc_msgSend(v10, "count") >= v9)
        {
          -[CKConversationListCollectionViewController showCannotPinMoreConversationsAlert](self, "showCannotPinMoreConversationsAlert");
        }
        else
        {
          if (IMOSLoggingEnabled())
          {
            OSLogHandleForIMFoundationCategory();
            v12 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              v49 = v6;
              _os_log_impl(&dword_18DFCD000, v12, OS_LOG_TYPE_INFO, "-[pinConversation:] Pinned conversations are frozen. Adding conversation to frozenPinnedConversations: %@", buf, 0xCu);
            }

          }
          objc_msgSend(v11, "arrayByAddingObject:", v6);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[CKConversationListCollectionViewController setFrozenPinnedConversations:](self, "setFrozenPinnedConversations:", v13);

          if (!-[CKConversationListCollectionViewController holdPinningUpdatesForOnboardingAnimation](self, "holdPinningUpdatesForOnboardingAnimation"))
          {
            -[CKConversationListCollectionViewController _updateLargeTitleDisplayModeWithAnimation:](self, "_updateLargeTitleDisplayModeWithAnimation:", 1);
            -[CKConversationListCollectionViewController updateSnapshotAnimatingDifferences:](self, "updateSnapshotAnimatingDifferences:", 1);
          }
        }
      }
      else
      {
        -[CKConversationListCollectionViewController dataSource](self, "dataSource");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "snapshot");
        v37 = (void *)objc_claimAutoreleasedReturnValue();

        -[CKConversationListCollectionViewController pinnedConversationsFromSnapshot:](self, "pinnedConversationsFromSnapshot:", v37);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "mutableCopy");
        v19 = (void *)v18;
        v20 = (void *)MEMORY[0x1E0C9AA60];
        if (v18)
          v20 = (void *)v18;
        v21 = v20;

        v36 = v21;
        if (objc_msgSend(v21, "count") >= v9)
        {
          -[CKConversationListCollectionViewController showCannotPinMoreConversationsAlert](self, "showCannotPinMoreConversationsAlert");
        }
        else
        {
          if (IMOSLoggingEnabled())
          {
            OSLogHandleForIMFoundationCategory();
            v22 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412546;
              v49 = v7;
              v50 = 2112;
              v51 = v6;
              _os_log_impl(&dword_18DFCD000, v22, OS_LOG_TYPE_INFO, "-[pinConversation:] reason: %@, conversation: %@", buf, 0x16u);
            }

          }
          v44 = 0u;
          v45 = 0u;
          v42 = 0u;
          v43 = 0u;
          v23 = v21;
          v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
          if (v24)
          {
            v25 = *(_QWORD *)v43;
            while (2)
            {
              for (i = 0; i != v24; ++i)
              {
                if (*(_QWORD *)v43 != v25)
                  objc_enumerationMutation(v23);
                if (*(id *)(*((_QWORD *)&v42 + 1) + 8 * i) == v6)
                {

                  if (IMOSLoggingEnabled())
                  {
                    OSLogHandleForIMFoundationCategory();
                    v35 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
                    {
                      *(_DWORD *)buf = 138412290;
                      v49 = v6;
                      _os_log_impl(&dword_18DFCD000, v35, OS_LOG_TYPE_INFO, "Attempted to pin conversation with identifier that was already in the pinned conversation identifier list. Ignoring. Conversation: %@", buf, 0xCu);
                    }

                  }
                  goto LABEL_47;
                }
              }
              v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
              if (v24)
                continue;
              break;
            }
          }

          objc_msgSend(v23, "addObject:", v6);
          v27 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          v40 = 0u;
          v41 = 0u;
          v38 = 0u;
          v39 = 0u;
          v28 = v23;
          v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
          if (v29)
          {
            v30 = *(_QWORD *)v39;
            do
            {
              for (j = 0; j != v29; ++j)
              {
                if (*(_QWORD *)v39 != v30)
                  objc_enumerationMutation(v28);
                objc_msgSend(*(id *)(*((_QWORD *)&v38 + 1) + 8 * j), "chat");
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v27, "addObject:", v32);

              }
              v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
            }
            while (v29);
          }

          objc_msgSend(MEMORY[0x1E0D358C8], "sharedInstance");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = (void *)objc_msgSend(v27, "copy");
          objc_msgSend(v33, "setPinnedChats:withUpdateReason:", v34, v7);

        }
LABEL_47:

      }
    }
    else if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18DFCD000, v15, OS_LOG_TYPE_INFO, "Tried to pin a nil conversation.", buf, 2u);
      }

    }
  }
  else
  {
    IMLogHandleForCategory();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[CKConversationListCollectionViewController pinConversation:withReason:].cold.1();

  }
}

- (void)showCannotPinMoreConversationsAlert
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_18DFCD000, v0, v1, "Ignoring request to show 'cannot pin conversation' alert from a process that does not support pinned conversations.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)_toggleUnreadStateForSelectedConversations:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _QWORD v15[5];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __89__CKConversationListCollectionViewController__toggleUnreadStateForSelectedConversations___block_invoke;
  v15[3] = &unk_1E2755DA0;
  v15[4] = &v16;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v15);
  -[CKConversationListCollectionViewController updater](self, "updater");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "beginHoldingUpdatesForReason:", CFSTR("markAsRead"));

  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v20, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        if (*((_BYTE *)v17 + 24))
          objc_msgSend(v10, "markAllMessagesAsRead");
        else
          objc_msgSend(v10, "markLastMessageAsUnread");
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v20, 16);
    }
    while (v7);
  }

  -[CKConversationListCollectionViewController setEditingMode:animated:](self, "setEditingMode:animated:", 0, 1);
  im_dispatch_after();
  _Block_object_dispose(&v16, 8);

}

uint64_t __89__CKConversationListCollectionViewController__toggleUnreadStateForSelectedConversations___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(a2, "hasUnreadMessages");
  if ((_DWORD)result)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

void __89__CKConversationListCollectionViewController__toggleUnreadStateForSelectedConversations___block_invoke_2(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "updater");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "endHoldingUpdatesForReason:updateTriggeredIfNotHeldShouldBeDeferred:", CFSTR("markAsRead"), 1);

}

- (void)_markAllConversationsAsRead
{
  NSObject *v3;
  void *v4;
  void *v5;
  int v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  unint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint8_t buf[4];
  unint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18DFCD000, v3, OS_LOG_TYPE_INFO, "Marking all conversations as read, none were selected", buf, 2u);
    }

  }
  objc_msgSend(MEMORY[0x1E0D39850], "sharedManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "shouldFilterConversationsByFocus"))
  {

LABEL_8:
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18DFCD000, v7, OS_LOG_TYPE_INFO, "In focus mode or assistive access, only grabbing the ones in the list as a workaround for incomplete database queries", buf, 2u);
      }

    }
    -[CKConversationListCollectionViewController dataSource](self, "dataSource");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "snapshot");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(v9, "itemIdentifiersInSectionWithIdentifier:", &unk_1E2870AF8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObjectsFromArray:", v11);
    objc_msgSend(v9, "itemIdentifiersInSectionWithIdentifier:", &unk_1E2870B10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObjectsFromArray:", v12);
    -[CKConversationListCollectionViewController conversationsForItemIdentifiers:](self, "conversationsForItemIdentifiers:", v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKConversationListCollectionViewController _toggleUnreadStateForSelectedConversations:](self, "_toggleUnreadStateForSelectedConversations:", v13);

    goto LABEL_18;
  }
  objc_msgSend(MEMORY[0x1E0D396C0], "sharedManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "shouldFilterIncomingMessages");

  if (v6)
    goto LABEL_8;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      v15 = -[CKConversationListCollectionViewController filterMode](self, "filterMode");
      *(_DWORD *)buf = 134217984;
      v20 = v15;
      _os_log_impl(&dword_18DFCD000, v14, OS_LOG_TYPE_INFO, "Not in a focus mode, mark as read using the database queries with filter mode (%lu)", buf, 0xCu);
    }

  }
  -[CKConversationListCollectionViewController updater](self, "updater");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "beginHoldingUpdatesForReason:", CFSTR("markAsRead"));

  -[CKConversationListCollectionViewController conversationList](self, "conversationList");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "_chatPredicateForFilterMode:", -[CKConversationListCollectionViewController filterMode](self, "filterMode"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D35798], "sharedRegistry");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "markChatsAsReadFilteredUsingPredicate:", v9);

  -[CKConversationListCollectionViewController setEditingMode:animated:](self, "setEditingMode:animated:", 0, 1);
  im_dispatch_after();
LABEL_18:

}

void __73__CKConversationListCollectionViewController__markAllConversationsAsRead__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "updater");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "endHoldingUpdatesForReason:updateTriggeredIfNotHeldShouldBeDeferred:", CFSTR("markAsRead"), 1);

}

- (void)toggleReadButtonTapped:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  uint8_t v9[16];

  v4 = a3;
  -[CKConversationListCollectionViewController collectionView](self, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "indexPathsForSelectedItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "count"))
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v9 = 0;
        _os_log_impl(&dword_18DFCD000, v7, OS_LOG_TYPE_INFO, "Marking conversations as read", v9, 2u);
      }

    }
    -[CKConversationListCollectionViewController conversationsAtIndexPaths:](self, "conversationsAtIndexPaths:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKConversationListCollectionViewController _toggleUnreadStateForSelectedConversations:](self, "_toggleUnreadStateForSelectedConversations:", v8);

  }
  else
  {
    -[CKConversationListCollectionViewController _markAllConversationsAsRead](self, "_markAllConversationsAsRead");
  }

}

- (void)muteConversationButtonTappedForConversationWithItemIdentifier:(id)a3 setMuted:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  id v7;

  v4 = a4;
  -[CKConversationListCollectionViewController conversationForItemIdentifier:](self, "conversationForItemIdentifier:", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setMutedUntilDate:", v6);

  }
  else
  {
    objc_msgSend(v7, "unmute");
  }
  -[CKConversationListCollectionViewController setEditingMode:animated:](self, "setEditingMode:animated:", 0, 1);

}

- (BOOL)hasTransparentSideBar
{
  void *v3;
  char v4;

  if (!CKIsRunningInMacCatalyst()
    || !-[CKConversationListCollectionViewController macShouldShowZKWSearch](self, "macShouldShowZKWSearch"))
  {
    return 0;
  }
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "macApplicationMetricsGatheringEnabled");

  return v4;
}

- (void)_configureSearchBarClearButton:(BOOL)a3 searchController:(id)a4
{
  _BOOL8 v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  v9 = a4;
  v5 = CKIsRunningInMacCatalyst();
  v6 = v9;
  if (v5)
  {
    objc_msgSend(v9, "searchBar");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "searchTextField");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v8, "_setAlwaysShowsClearButtonWhenEmpty:", v4);

    v6 = v9;
  }

}

- (void)willPresentSearchController:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[CKConversationListCollectionViewController searchResultsController](self, "searchResultsController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDismissingSearchController:", 0);

  if (-[CKConversationListCollectionViewController hasTransparentSideBar](self, "hasTransparentSideBar"))
  {
    -[CKConversationListCollectionViewController view](self, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setHidden:", 1);

  }
  -[CKConversationListCollectionViewController _configureSearchBarClearButton:searchController:](self, "_configureSearchBarClearButton:searchController:", 1, v7);
  -[CKConversationListCollectionViewController delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "conversationListControllerWillPresentSearchResultsController");

  -[CKConversationListCollectionViewController _configureCatalystFiltersNavigation](self, "_configureCatalystFiltersNavigation");
}

- (void)willDismissSearchController:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[5];

  v4 = a3;
  -[CKConversationListCollectionViewController searchResultsController](self, "searchResultsController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDismissingSearchController:", 1);

  if (-[CKConversationListCollectionViewController hasTransparentSideBar](self, "hasTransparentSideBar"))
  {
    -[CKConversationListCollectionViewController view](self, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setHidden:", 0);

  }
  -[CKConversationListCollectionViewController delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "conversationListControllerWillDismissSearchResultsController");

  if (objc_msgSend(v4, "isActive"))
    -[CKConversationListCollectionViewController reloadInputViews](self, "reloadInputViews");
  -[CKConversationListCollectionViewController navigationItem](self, "navigationItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setBackButtonTitle:", 0);

  if (CKIsRunningInMacCatalyst() && objc_msgSend(v4, "isActive"))
  {
    -[CKConversationListCollectionViewController transitionCoordinator](self, "transitionCoordinator");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __74__CKConversationListCollectionViewController_willDismissSearchController___block_invoke;
      v11[3] = &unk_1E274B4D0;
      v11[4] = self;
      objc_msgSend(v9, "animateAlongsideTransition:completion:", v11, 0);
    }

  }
}

void __74__CKConversationListCollectionViewController_willDismissSearchController___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "updateNavigationItems");
  objc_msgSend(*(id *)(a1 + 32), "_configureCatalystFiltersNavigation");
  objc_msgSend(*(id *)(a1 + 32), "collectionView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsLayout");

  objc_msgSend(*(id *)(a1 + 32), "collectionView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layoutIfNeeded");

}

- (void)didDismissSearchController:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[CKConversationListCollectionViewController searchResultsController](self, "searchResultsController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDismissingSearchController:", 0);

  -[CKConversationListCollectionViewController searchResultsController](self, "searchResultsController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "searchEnded");

  -[CKConversationListCollectionViewController _configureSearchBarClearButton:searchController:](self, "_configureSearchBarClearButton:searchController:", 0, v4);
  if (CKIsRunningInMacCatalyst())
  {
    -[CKConversationListCollectionViewController setMacShouldShowZKWSearch:](self, "setMacShouldShowZKWSearch:", 0);
    -[CKConversationListCollectionViewController _configureCatalystFiltersNavigation](self, "_configureCatalystFiltersNavigation");
  }
  -[CKConversationListCollectionViewController updateConversationSelection](self, "updateConversationSelection");
  -[CKConversationListCollectionViewController updateNavigationItems](self, "updateNavigationItems");
}

- (BOOL)searchBarShouldBeginEditing:(id)a3
{
  return 1;
}

- (void)searchBarTextDidBeginEditing:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _BOOL4 v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  const char *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v21 = 136315138;
      v22 = "-[CKConversationListCollectionViewController searchBarTextDidBeginEditing:]";
      _os_log_impl(&dword_18DFCD000, v5, OS_LOG_TYPE_INFO, "%s", (uint8_t *)&v21, 0xCu);
    }

  }
  -[CKConversationListCollectionViewController navigationItem](self, "navigationItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  CKFrameworkBundle();
  v7 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v7, "localizedStringForKey:value:table:", CFSTR("SEARCH"), &stru_1E276D870, CFSTR("ChatKit"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBackButtonTitle:", v8);

  -[CKConversationListCollectionViewController searchController](self, "searchController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v7) = objc_msgSend(v9, "showsSearchResultsController");

  if ((v7 & 1) == 0)
  {
    if (!CKIsRunningInMacCatalyst())
    {
      -[CKConversationListCollectionViewController searchController](self, "searchController");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setShowsSearchResultsController:", 1);

    }
    -[CKConversationListCollectionViewController searchController](self, "searchController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "searchBar");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "text");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "length") == 0;

    if (v14)
    {
      -[CKConversationListCollectionViewController searchResultsController](self, "searchResultsController");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "searchWithText:", &stru_1E276D870);

    }
  }
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "isSearchTokensEnabled");

  if (v17)
  {
    -[CKConversationListCollectionViewController searchResultsController](self, "searchResultsController");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setCanShowTokenSuggestions:", 1);

  }
  -[CKConversationListCollectionViewController collectionView](self, "collectionView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKConversationListCollectionViewController indexPathOfFirstSelectedItem](self, "indexPathOfFirstSelectedItem");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "deselectItemAtIndexPath:animated:", v20, 0);

}

- (void)searchBar:(id)a3 textDidChange:(id)a4
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  if (objc_msgSend(a4, "length", a3))
  {
    if (!CKIsRunningInMacCatalyst())
      return;
    goto LABEL_6;
  }
  -[CKConversationListCollectionViewController searchResultsController](self, "searchResultsController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "searchEnded");

  if (CKIsRunningInMacCatalyst())
  {
    if (!-[CKConversationListCollectionViewController macShouldShowZKWSearch](self, "macShouldShowZKWSearch"))
    {
      v7 = 0;
      goto LABEL_9;
    }
LABEL_6:
    -[CKConversationListCollectionViewController searchController](self, "searchController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isActive");

LABEL_9:
    -[CKConversationListCollectionViewController view](self, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setHidden:", v7);

    -[CKConversationListCollectionViewController searchController](self, "searchController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setShowsSearchResultsController:", v7);

    -[CKConversationListCollectionViewController _configureCatalystFiltersNavigation](self, "_configureCatalystFiltersNavigation");
  }
}

- (void)searchBarTextDidEndEditing:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[5];

  v4 = a3;
  if (CKIsRunningInMacCatalyst()
    && !-[CKConversationListCollectionViewController macShouldShowZKWSearch](self, "macShouldShowZKWSearch"))
  {
    objc_msgSend(v4, "text");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "length")
      || (-[CKConversationListCollectionViewController presentedViewController](self, "presentedViewController"),
          (v8 = objc_claimAutoreleasedReturnValue()) == 0))
    {

    }
    else
    {
      v9 = (void *)v8;
      -[CKConversationListCollectionViewController presentedViewController](self, "presentedViewController");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKConversationListCollectionViewController searchController](self, "searchController");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10 == v11)
      {
        -[CKConversationListCollectionViewController searchController](self, "searchController");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[CKConversationListCollectionViewController willDismissSearchController:](self, "willDismissSearchController:", v12);

        v13[0] = MEMORY[0x1E0C809B0];
        v13[1] = 3221225472;
        v13[2] = __73__CKConversationListCollectionViewController_searchBarTextDidEndEditing___block_invoke;
        v13[3] = &unk_1E274A208;
        v13[4] = self;
        -[CKConversationListCollectionViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 0, v13);
      }
    }
  }
  -[CKConversationListCollectionViewController delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "chatController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "becomeFirstResponder");
}

void __73__CKConversationListCollectionViewController_searchBarTextDidEndEditing___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(v1, "searchController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "didDismissSearchController:", v2);

}

- (void)searchBarSearchButtonClicked:(id)a3
{
  void *v4;
  int v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isSearchTokensEnabled");

  if (v5)
  {
    -[CKConversationListCollectionViewController searchResultsController](self, "searchResultsController");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setCanShowTokenSuggestions:", 0);

  }
}

- (id)searchController:(id)a3 conversationForChatGUID:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a4;
  -[CKConversationListCollectionViewController conversationList](self, "conversationList");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "conversationForExistingChatWithGUID:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)searchController:(id)a3 conversationsForExistingChatsWithGUIDs:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a4;
  -[CKConversationListCollectionViewController conversationList](self, "conversationList");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "conversationsForExistingChatsWithGUIDs:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)searchBarForSearchViewController:(id)a3
{
  void *v3;
  void *v4;

  -[CKConversationListCollectionViewController searchController](self, "searchController", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "searchBar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)searchController:(id)a3 didSelectItem:(id)a4 inChat:(id)a5
{
  CKConversationListControllerDelegate **p_delegate;
  id v8;
  id v9;
  id WeakRetained;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  p_delegate = &self->_delegate;
  v8 = a5;
  v9 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "showConversationAndMessageForChatGUID:messageGUID:animate:", v8, v9, 1);

  -[CKConversationListCollectionViewController delegate](self, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "chatController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "becomeFirstResponder");

  -[CKConversationListCollectionViewController delegate](self, "delegate");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "chatController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "reloadInputViews");

}

- (void)searchControllerDidBeginDragging:(id)a3
{
  void *v3;
  id v4;

  -[CKConversationListCollectionViewController searchController](self, "searchController", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "searchBar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "resignFirstResponder");

}

- (void)searchViewController:(id)a3 requestsPushOfSearchController:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  -[CKConversationListCollectionViewController navigationController](self, "navigationController");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pushViewController:animated:", v5, 1);

}

- (BOOL)shouldInsetResultsForSearchController:(id)a3
{
  void *v3;
  char v4;

  -[CKConversationListCollectionViewController delegate](self, "delegate", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isCollapsed");

  return v4;
}

- (id)contextMenusForConversation:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;

  -[CKConversationListCollectionViewController itemIdentifierForConversation:inSection:](self, "itemIdentifierForConversation:inSection:", a3, 5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKConversationListCollectionViewController dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "indexPathForItemIdentifier:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = objc_msgSend(v6, "section");
    -[CKConversationListCollectionViewController collectionView](self, "collectionView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "cellForItemAtIndexPath:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[CKConversationListCollectionViewController _conversationActionMenusForItemIdentifier:inSection:withCell:forSearch:](self, "_conversationActionMenusForItemIdentifier:inSection:withCell:forSearch:", v4, v7, v9, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v10;
}

- (void)_contentSizeCategoryDidChange:(id)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __76__CKConversationListCollectionViewController__contentSizeCategoryDidChange___block_invoke;
  block[3] = &unk_1E274A208;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __76__CKConversationListCollectionViewController__contentSizeCategoryDidChange___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "invalidateCellLayout");
  objc_msgSend(*(id *)(a1 + 32), "searchController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isActive");

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "searchController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setActive:", 0);

  }
  objc_msgSend(*(id *)(a1 + 32), "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "reloadData");

  objc_msgSend(*(id *)(a1 + 32), "updateConversationSelection");
  +[CKDualSIMUtilities sharedUtilities](CKDualSIMUtilities, "sharedUtilities");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "updateConversationListSIMLabelImagesDictionary");

}

- (void)_increaseContrastDidChange:(id)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __73__CKConversationListCollectionViewController__increaseContrastDidChange___block_invoke;
  block[3] = &unk_1E274A208;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __73__CKConversationListCollectionViewController__increaseContrastDidChange___block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "collectionView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "reloadData");

  return objc_msgSend(*(id *)(a1 + 32), "updateConversationSelection");
}

- (void)_chatItemsDidChange:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  BOOL v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  int v25;
  const char *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v4, "name");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 136315394;
      v26 = "-[CKConversationListCollectionViewController _chatItemsDidChange:]";
      v27 = 2112;
      v28 = v6;
      _os_log_impl(&dword_18DFCD000, v5, OS_LOG_TYPE_INFO, "ConversationListController: %s, notification.name: %@", (uint8_t *)&v25, 0x16u);

    }
  }
  objc_msgSend(v4, "object");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKConversationListCollectionViewController conversationList](self, "conversationList");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "guid");
  v9 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "conversationForExistingChatWithGUID:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[CKConversationListCollectionViewController conversationList](self, "conversationList");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v9) = objc_msgSend(v11, "loadingConversations");

  if ((v9 & 1) == 0)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        LOWORD(v25) = 0;
        _os_log_impl(&dword_18DFCD000, v12, OS_LOG_TYPE_INFO, "Not loading all conversations, updating the conversation list", (uint8_t *)&v25, 2u);
      }

    }
    if (__CurrentTestName)
    {
      -[CKConversationListCollectionViewController updateConversationList](self, "updateConversationList");
    }
    else if (-[CKConversationListCollectionViewController _updateAddsTypingChatItem:](self, "_updateAddsTypingChatItem:", v4)|| (objc_msgSend(v4, "userInfo"), v13 = (void *)objc_claimAutoreleasedReturnValue(), v14 = -[CKConversationListCollectionViewController _updateRemovesTypingChatItem:](self, "_updateRemovesTypingChatItem:", v13), v13, v14))
    {
      -[CKConversationListCollectionViewController updateContentsOfCellForConversation:animated:](self, "updateContentsOfCellForConversation:animated:", v10, 1);
    }
    else
    {
      -[CKConversationListCollectionViewController updater](self, "updater");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setNeedsDeferredUpdateWithReason:", CFSTR("chatItemsChanged"));

    }
  }
  objc_msgSend(v10, "resetCaches");
  if (objc_msgSend(v10, "isAdHocGroupConversation"))
  {
    objc_msgSend(v4, "userInfo");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (!v16)
    {
LABEL_28:

      goto LABEL_29;
    }
    objc_msgSend(v16, "valueForKey:", *MEMORY[0x1E0D35330]);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v18, "count"))
    {
LABEL_27:

      goto LABEL_28;
    }
    objc_msgSend(v10, "chat");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "chatItems");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "lastObject");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    v22 = (void *)objc_opt_class();
    if ((objc_msgSend(v22, "isSubclassOfClass:", objc_opt_class()) & 1) != 0)
    {
      LOBYTE(v23) = 0;
      if (!v21)
        goto LABEL_26;
    }
    else
    {
      v24 = (void *)objc_opt_class();
      v23 = objc_msgSend(v24, "isSubclassOfClass:", objc_opt_class()) ^ 1;
      if (!v21)
      {
LABEL_26:

        goto LABEL_27;
      }
    }
    if ((v23 & 1) == 0 && (objc_msgSend(v21, "isFromMe") & 1) == 0)
    {
      objc_msgSend(v10, "setNeedsUpdatedContactOrderForVisualIdentity");
      -[CKConversationListCollectionViewController updateContentsOfCellForConversation:animated:](self, "updateContentsOfCellForConversation:animated:", v10, 1);
    }
    goto LABEL_26;
  }
LABEL_29:

}

- (BOOL)_updateAddsTypingChatItem:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  NSObject *v12;
  uint8_t v14[16];
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0D35330]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "count") == 1)
  {
    objc_msgSend(v3, "object");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    objc_msgSend(v6, "chatItems");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectsAtIndexes:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v16;
      while (2)
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v16 != v10)
            objc_enumerationMutation(v8);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            if (IMOSLoggingEnabled())
            {
              OSLogHandleForIMFoundationCategory();
              v12 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)v14 = 0;
                _os_log_impl(&dword_18DFCD000, v12, OS_LOG_TYPE_INFO, "Chat item update only adds typing indicator, do not resort conversation list.", v14, 2u);
              }

            }
            LOBYTE(v9) = 1;
            goto LABEL_17;
          }
        }
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        if (v9)
          continue;
        break;
      }
    }
LABEL_17:

  }
  else
  {
    LOBYTE(v9) = 0;
  }

  return v9;
}

- (BOOL)_updateRemovesTypingChatItem:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char isKindOfClass;
  NSObject *v9;
  BOOL v10;
  uint8_t v12[16];

  v3 = a3;
  objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E0D35340]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E0D35358]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count") != 1)
    goto LABEL_8;
  objc_msgSend(v4, "objectsAtIndexes:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lastObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v12 = 0;
        _os_log_impl(&dword_18DFCD000, v9, OS_LOG_TYPE_INFO, "Chat item update only removes typing indicator, do not resort conversation list.", v12, 2u);
      }

    }
    v10 = 1;
  }
  else
  {
LABEL_8:
    v10 = 0;
  }

  return v10;
}

- (void)_chatUnreadCountDidChange:(id)a3
{
  void *v4;
  void *v5;
  char isKindOfClass;
  void *v7;
  id v8;

  v8 = a3;
  -[CKConversationListCollectionViewController updater](self, "updater");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setNeedsDeferredUpdateWithReason:", CFSTR("unreadCountChanged"));

  objc_msgSend(v8, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v8, "object");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKConversationListCollectionViewController _consumeSummaryOnUnreadCountChangeForChatIfNeeded:](self, "_consumeSummaryOnUnreadCountChangeForChatIfNeeded:", v7);

  }
}

- (void)_chatParticipantsChangedNotification:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(a3, "object");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[CKConversationListCollectionViewController conversationList](self, "conversationList");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "guid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "conversationForExistingChatWithGUID:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "resetCaches");
  if (objc_msgSend(v6, "isGroupConversation"))
    objc_msgSend(v6, "setNeedsUpdatedContactOrderForVisualIdentity");
  if (objc_msgSend(v6, "isAdHocGroupConversation"))
    -[CKConversationListCollectionViewController updateContentsOfCellForConversation:animated:](self, "updateContentsOfCellForConversation:animated:", v6, 0);

}

- (void)updateContentsOfCellForConversation:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  char v7;
  uint64_t v8;
  void *v9;
  id v10;

  v4 = a4;
  v10 = a3;
  -[CKConversationListCollectionViewController updater](self, "updater");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isHoldingUpdates");

  if ((v7 & 1) == 0)
  {
    if (objc_msgSend(v10, "isPinned"))
      v8 = 2;
    else
      v8 = 5;
    -[CKConversationListCollectionViewController itemIdentifierForConversation:inSection:](self, "itemIdentifierForConversation:inSection:", v10, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKConversationListCollectionViewController updateContentsOfCellWithItemIdentifier:animated:](self, "updateContentsOfCellWithItemIdentifier:animated:", v9, v4);

  }
}

- (void)_conversationIsFilteredChangedNotification:(id)a3
{
  id v3;

  -[CKConversationListCollectionViewController updater](self, "updater", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setNeedsDeferredUpdateWithReason:", CFSTR("conversationIsFilteredChanged"));

}

- (void)_conversationDisplayNameChangedNotification:(id)a3
{
  id v3;

  -[CKConversationListCollectionViewController updater](self, "updater", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setNeedsDeferredUpdateWithReason:", CFSTR("conversationDisplayNameChanged"));

}

- (void)_conversationMuteDidChangeNotification:(id)a3
{
  id v3;

  -[CKConversationListCollectionViewController updater](self, "updater", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setNeedsDeferredUpdateWithReason:", CFSTR("conversationMuteDidChanged"));

}

- (void)_conversationFilteringStateChangedNotification:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  uint8_t v8[16];

  v4 = a3;
  if (-[CKConversationListCollectionViewController isRecentlyDeletedModal](self, "isRecentlyDeletedModal")
    || -[CKConversationListCollectionViewController isOscarModal](self, "isOscarModal"))
  {
    -[CKConversationListCollectionViewController navigationController](self, "navigationController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dismissViewControllerAnimated:completion:", 1, 0);

  }
  else
  {
    if (v4
      || CKIsFilterCategory(-[CKConversationListCollectionViewController filterMode](self, "filterMode"))
      && !-[CKConversationListCollectionViewController _messageSpamFilteringEnabled](self, "_messageSpamFilteringEnabled"))
    {
      -[CKConversationListCollectionViewController setFilterMode:](self, "setFilterMode:", 1);
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v6 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v8 = 0;
          _os_log_impl(&dword_18DFCD000, v6, OS_LOG_TYPE_INFO, "Conversation Filtering state changed, resetting SIM Filter state cache and SIM Filter Preference", v8, 2u);
        }

      }
      -[CKConversationListCollectionViewController _resetSimFilteringToDefaultState](self, "_resetSimFilteringToDefaultState");
    }
    -[CKConversationListCollectionViewController updater](self, "updater");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setNeedsDeferredUpdateWithReason:", CFSTR("filteringStateChanged"));

    -[CKConversationListCollectionViewController updateNavigationItems](self, "updateNavigationItems");
  }

}

- (void)_conversationSpamFilteringStateChangedNotification:(id)a3
{
  -[CKConversationListCollectionViewController updateSMSSpamConversationsDisplayName](self, "updateSMSSpamConversationsDisplayName", a3);
  -[CKConversationListCollectionViewController _conversationFilteringStateChangedNotification:](self, "_conversationFilteringStateChangedNotification:", 0);
}

- (void)_conversationContactPhotosEnabledChangedNotification:(id)a3
{
  id v4;

  -[CKConversationListCollectionViewController invalidateCellLayout](self, "invalidateCellLayout", a3);
  -[CKConversationListCollectionViewController updater](self, "updater");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setNeedsDeferredUpdateWithReason:", CFSTR("contactPhotosEnabled"));

}

- (void)_adaptiveImageGlyphWasGeneratedNotification:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  NSObject *v19;
  _BOOL4 v20;
  void *v21;
  void *v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "transferGUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "length"))
    {
      v23 = v4;
      -[CKConversationListCollectionViewController conversationList](self, "conversationList");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "conversations");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v24 = 0u;
      v25 = 0u;
      v26 = 0u;
      v27 = 0u;
      v8 = v6;
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v25;
        do
        {
          for (i = 0; i != v10; ++i)
          {
            if (*(_QWORD *)v25 != v11)
              objc_enumerationMutation(v8);
            v13 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
            if (objc_msgSend(v13, "shouldReloadPreviewTextForGeneratedAdaptiveImageGlyphWithFileTransferGUID:", v5))
            {
              if (objc_msgSend(v13, "isPinned"))
                v14 = 2;
              else
                v14 = 5;
              -[CKConversationListCollectionViewController itemIdentifierForConversation:inSection:](self, "itemIdentifierForConversation:inSection:", v13, v14);
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              if (v15)
                objc_msgSend(v7, "addObject:", v15);

            }
          }
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
        }
        while (v10);
      }

      v16 = (void *)objc_msgSend(v7, "copy");
      -[CKConversationListCollectionViewController updater](self, "updater");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "isHoldingUpdates");

      IMLogHandleForCategory();
      v19 = objc_claimAutoreleasedReturnValue();
      v20 = os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG);
      if (v18)
      {
        if (v20)
          -[CKConversationListCollectionViewController _adaptiveImageGlyphWasGeneratedNotification:].cold.1((uint64_t)v5, v19);

        -[CKConversationListCollectionViewController updater](self, "updater");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "setNeedsDeferredUpdateWithReason:", CFSTR("adaptiveImageGlyphGenerated"));

        v4 = v23;
      }
      else
      {
        if (v20)
          -[CKConversationListCollectionViewController _adaptiveImageGlyphWasGeneratedNotification:].cold.2(v16, (uint64_t)v5, v19);

        v4 = v23;
        if (objc_msgSend(v16, "count"))
          -[CKConversationListCollectionViewController updateContentsOfCellsWithItemIdentifiers:animated:](self, "updateContentsOfCellsWithItemIdentifiers:animated:", v16, 0);
      }

    }
  }

}

- (void)_multiWayCallStateChanged:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  char v7;
  NSObject *v8;
  void *v9;
  uint8_t v10[16];
  uint8_t buf[16];

  v4 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18DFCD000, v5, OS_LOG_TYPE_INFO, "ConversationListController: _multiWayCallStateChanged", buf, 2u);
    }

  }
  -[CKConversationListCollectionViewController conversationList](self, "conversationList");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "loadingConversations");

  if ((v7 & 1) == 0)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v10 = 0;
        _os_log_impl(&dword_18DFCD000, v8, OS_LOG_TYPE_INFO, "Not loading all conversations, updating the conversation list", v10, 2u);
      }

    }
    -[CKConversationListCollectionViewController updater](self, "updater");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setNeedsDeferredUpdateWithReason:", CFSTR("multiWayCallStateChanged"));

  }
}

- (void)_chatWatermarkDidChange:(id)a3
{
  id v3;

  -[CKConversationListCollectionViewController updater](self, "updater", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setNeedsDeferredUpdateWithReason:", CFSTR("chatWatermarkDidChange"));

}

- (void)_conversationListDidFinishLoadingConversations:(id)a3
{
  void *v4;
  void *v5;
  int v6;

  -[CKConversationListCollectionViewController updater](self, "updater", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setNeedsDeferredUpdateWithReason:", CFSTR("didFinishLoadingConversations"));

  -[CKConversationListCollectionViewController _updateConversationListsAndSortIfEnabled](self, "_updateConversationListsAndSortIfEnabled");
  -[CKConversationListCollectionViewController conversationList](self, "conversationList");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "loadedConversations");

  if (v6)
    -[CKConversationListCollectionViewController updateSnapshotAnimatingDifferences:](self, "updateSnapshotAnimatingDifferences:", 0);
}

- (void)_contactStoreDidFinishLoadingNotification:(id)a3
{
  id v3;

  -[CKConversationListCollectionViewController updater](self, "updater", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setNeedsDeferredUpdateWithReason:", CFSTR("contactStoreDidFinishLoading"));

}

- (void)_conversationListDidChange:(id)a3
{
  id v3;

  -[CKConversationListCollectionViewController updater](self, "updater", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setNeedsDeferredUpdateWithReason:", CFSTR("conversationListDidChange"));

}

- (void)_conversationMessageWasSent:(id)a3
{
  id v3;

  -[CKConversationListCollectionViewController updater](self, "updater", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setNeedsDeferredUpdateWithReason:", CFSTR("messageWasSent"));

}

- (unint64_t)_sanitizedFilterModeForFilterUnknownEnabled:(unint64_t)a3
{
  unint64_t result;
  BOOL v6;
  int v7;

  result = 1;
  switch(a3)
  {
    case 0uLL:
    case 0xAuLL:
      return result;
    case 4uLL:
    case 5uLL:
    case 6uLL:
      v6 = !-[CKConversationListCollectionViewController _messageSpamFilteringEnabled](self, "_messageSpamFilteringEnabled");
      goto LABEL_3;
    case 7uLL:
      if (!-[CKConversationListCollectionViewController isRecentlyDeletedModal](self, "isRecentlyDeletedModal")
        && !CKShouldShowInboxView())
      {
        CKIsRunningInMacCatalyst();
      }
      result = 7;
      break;
    default:
      if (a3 >= 0x10)
      {
        v7 = objc_msgSend(MEMORY[0x1E0D399F8], "isValidActiveFilterAction:subAction:", a3 & 0xF, a3 >> 4);
        v6 = (-[CKConversationListCollectionViewController _messageSpamFilteringEnabled](self, "_messageSpamFilteringEnabled") & v7) == 0;
LABEL_3:
        if (v6)
          result = 1;
        else
          result = a3;
      }
      else
      {
        result = a3;
      }
      break;
  }
  return result;
}

- (void)updateSMSSpamConversationsDisplayName
{
  void *v2;
  id v3;

  +[CKConversationList sharedConversationList](CKConversationList, "sharedConversationList");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "conversations");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "enumerateObjectsUsingBlock:", &__block_literal_global_371_2);

}

uint64_t __83__CKConversationListCollectionViewController_updateSMSSpamConversationsDisplayName__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "updateDisplayNameIfSMSSpam");
}

- (void)_handingPendingConversationDidChange:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  char isKindOfClass;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  objc_msgSend(v11, "object");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    objc_msgSend(v11, "object");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      -[CKConversationListCollectionViewController conversationList](self, "conversationList");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "pendingConversation");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKConversationListCollectionViewController itemIdentifierForConversation:inSection:](self, "itemIdentifierForConversation:inSection:", v9, 4);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      -[CKConversationListCollectionViewController updateContentsOfCellWithItemIdentifier:animated:](self, "updateContentsOfCellWithItemIdentifier:animated:", v10, 0);
    }
  }

}

- (void)_resetMessageFiltering
{
  id v2;

  CKResetBlackholeEnabledCache();
  CKResetFilteringSettings();
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CKMessageFilteringChangedNotification[0], 0);

}

- (id)collectionView:(id)a3 sceneActivationConfigurationForItemAtIndexPath:(id)a4 point:(CGPoint)a5
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = a4;
  -[CKConversationListCollectionViewController dataSource](self, "dataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "itemIdentifierForIndexPath:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[CKConversationListCollectionViewController conversationForItemIdentifier:](self, "conversationForItemIdentifier:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "activityForNewScene");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAC28]), "initWithUserActivity:", v10);
  else
    v11 = 0;

  return v11;
}

void __61__CKConversationListCollectionViewController_viewWillAppear___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "searchController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isActive");

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "searchController");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setActive:", 0);

  }
}

uint64_t __61__CKConversationListCollectionViewController_viewWillAppear___block_invoke_469(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1496), "conversationListControllerDidAppear");
}

- (BOOL)isShowingConversationFromCatalystOpenURL
{
  return 0;
}

void __60__CKConversationListCollectionViewController_viewDidAppear___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      v3 = *(_QWORD *)(a1 + 32);
      v4 = 138412290;
      v5 = v3;
      _os_log_impl(&dword_18DFCD000, v2, OS_LOG_TYPE_INFO, "Performed deferred (viewDidAppear:) search with query: %@", (uint8_t *)&v4, 0xCu);
    }

  }
}

void __72__CKConversationListCollectionViewController_viewDidAppearDeferredSetup__block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_launchTestName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "finishedTest:extraResults:", v2, 0);

}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  const __CFString *v6;
  const __CFString *v7;
  void *v8;
  NSObject *v9;
  const __CFString *v10;
  objc_super v11;
  _QWORD block[5];
  uint8_t buf[4];
  const __CFString *v14;
  uint64_t v15;

  v3 = a3;
  v15 = *MEMORY[0x1E0C80C00];
  if (IMOSLoggingEnabled())
  {
    CKLogCStringForType(32);
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      v6 = CFSTR("NO");
      if (v3)
        v6 = CFSTR("YES");
      *(_DWORD *)buf = 138412290;
      v14 = v6;
      _os_log_impl(&dword_18DFCD000, v5, OS_LOG_TYPE_DEBUG, "viewWillDisappear, animated=%@", buf, 0xCu);
    }

  }
  if (os_log_shim_legacy_logging_enabled() && _CKShouldLog())
  {
    v7 = CFSTR("NO");
    if (v3)
      v7 = CFSTR("YES");
    v10 = v7;
    _CKLog();
  }
  if (self->_isVisible)
  {
    -[CKConversationListCollectionViewController updater](self, "updater");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "beginHoldingUpdatesForReason:", CFSTR("viewVisiblity"));

  }
  self->_isVisible = 0;
  -[CKConversationListCollectionViewController tipKitQueue](self, "tipKitQueue", v10);
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64__CKConversationListCollectionViewController_viewWillDisappear___block_invoke;
  block[3] = &unk_1E274A208;
  block[4] = self;
  dispatch_async(v9, block);

  -[CKConversationListCollectionViewController stopTipCellAnimatingIfNecessary](self, "stopTipCellAnimatingIfNecessary");
  v11.receiver = self;
  v11.super_class = (Class)CKConversationListCollectionViewController;
  -[CKConversationListCollectionViewController viewWillDisappear:](&v11, sel_viewWillDisappear_, v3);
}

uint64_t __64__CKConversationListCollectionViewController_viewWillDisappear___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1496), "conversationListControllerDidDisappear");
}

- (void)applicationWillSuspend
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CKConversationListCollectionViewController;
  -[CKConversationListCollectionViewController applicationWillSuspend](&v7, sel_applicationWillSuspend);
  if (!CKIsRunningInMacCatalyst())
  {
    -[CKConversationListCollectionViewController searchController](self, "searchController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isActive");

    if (v4)
    {
      -[CKConversationListCollectionViewController searchController](self, "searchController");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setActive:", 0);

    }
    -[CKConversationListCollectionViewController searchResultsController](self, "searchResultsController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "cancelCurrentQuery");

  }
}

- (void)stopTipCellAnimatingIfNecessary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[CKConversationListCollectionViewController dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKTipKitOnboardingCollectionViewCell reuseIdentifier](CKTipKitOnboardingCollectionViewCell, "reuseIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "indexPathForItemIdentifier:", v4);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  -[CKConversationListCollectionViewController collectionView](self, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cellForItemAtIndexPath:", v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v6, "didEndDisplaying");

}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  _QWORD v12[5];
  _QWORD v13[5];
  objc_super v14;

  height = a3.height;
  width = a3.width;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CKConversationListCollectionViewController;
  -[CKConversationListCollectionViewController viewWillTransitionToSize:withTransitionCoordinator:](&v14, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  -[CKConversationListCollectionViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "frame");
  v10 = v9;

  if (vabdd_f64(width, v10) >= 0.001)
  {
    self->_willRotate = 1;
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "usesPopovers");

    v12[4] = self;
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __97__CKConversationListCollectionViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
    v13[3] = &unk_1E274B4D0;
    v13[4] = self;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __97__CKConversationListCollectionViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2;
    v12[3] = &unk_1E274B4D0;
    objc_msgSend(v7, "animateAlongsideTransition:completion:", v13, v12);
  }

}

uint64_t __97__CKConversationListCollectionViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1016) = 0;
  return objc_msgSend(*(id *)(a1 + 32), "invalidateCellLayout");
}

uint64_t __97__CKConversationListCollectionViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1016) = 0;
  return objc_msgSend(*(id *)(a1 + 32), "invalidateCellLayout");
}

- (void)_keyboardWillShow:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  double v15;
  double v16;

  v4 = a3;
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", *MEMORY[0x1E0CEB888]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "CGRectValue");
  v8 = v7;

  objc_msgSend(v4, "userInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "objectForKey:", *MEMORY[0x1E0CEB890]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "CGRectValue");
  v12 = v11;

  -[CKConversationListCollectionViewController view](self, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "window");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "bounds");
  v16 = v15;

  if (-[CKConversationListCollectionViewController editingMode](self, "editingMode"))
  {
    if (v8 > v12 && v8 != v16)
      -[CKConversationListCollectionViewController setEditingMode:animated:](self, "setEditingMode:animated:", 0, 1);
  }
  -[CKConversationListCollectionViewController _updateInsets](self, "_updateInsets");
  self->_keyboardIsShowing = 1;
}

- (void)_keyboardWillHide:(id)a3
{
  -[CKConversationListCollectionViewController _updateInsets](self, "_updateInsets", a3);
  self->_keyboardIsShowing = 0;
}

- (void)scrollToFirstSelectedItemIfNecessary
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  -[CKConversationListCollectionViewController collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "indexPathsForSelectedItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    if (objc_msgSend(v8, "section") != 4)
    {
      -[CKConversationListCollectionViewController collectionView](self, "collectionView");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "numberOfItemsInSection:", objc_msgSend(v8, "section"));

      if (v6)
      {
        if (-[CKConversationListCollectionViewController shouldScrollCollectionViewForCellSelection:](self, "shouldScrollCollectionViewForCellSelection:", v8))
        {
          -[CKConversationListCollectionViewController collectionView](self, "collectionView");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "scrollToItemAtIndexPath:atScrollPosition:animated:", v8, 1, 1);

        }
      }
    }
  }

}

- (BOOL)shouldScrollCollectionViewForCellSelection:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  BOOL v9;
  void *v10;

  v4 = a3;
  -[CKConversationListCollectionViewController lastVisibleIndexPathInCollectionView](self, "lastVisibleIndexPathInCollectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKConversationListCollectionViewController firstVisibleIndexPathInCollectionView](self, "firstVisibleIndexPathInCollectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[CKConversationListCollectionViewController distanceBetweenConversationIndexPath:andIndexPath:](self, "distanceBetweenConversationIndexPath:andIndexPath:", v4, v5);
  v8 = -[CKConversationListCollectionViewController distanceBetweenConversationIndexPath:andIndexPath:](self, "distanceBetweenConversationIndexPath:andIndexPath:", v4, v6);
  if (v7 < 2 || v8 <= 1)
  {
    -[CKConversationListCollectionViewController collectionView](self, "collectionView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v10, "numberOfItemsInSection:", objc_msgSend(v4, "section")) > 0;

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)lastVisibleIndexPathInCollectionView
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[CKConversationListCollectionViewController collectionView](self, "collectionView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "indexPathsForVisibleItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sortedArrayUsingSelector:", sel_compare_);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "lastObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)firstVisibleIndexPathInCollectionView
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[CKConversationListCollectionViewController collectionView](self, "collectionView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "indexPathsForVisibleItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sortedArrayUsingSelector:", sel_compare_);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_multitaskingDragExclusionRects
{
  id v3;
  double x;
  double y;
  double width;
  double height;
  void *v8;
  void *v9;
  CGRect v11;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[CKConversationListCollectionViewController pinnedConversationMultitaskingDragExclusionRect](self, "pinnedConversationMultitaskingDragExclusionRect");
  x = v11.origin.x;
  y = v11.origin.y;
  width = v11.size.width;
  height = v11.size.height;
  if (!CGRectIsEmpty(v11))
  {
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:", x, y, width, height);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v8);

  }
  v9 = (void *)objc_msgSend(v3, "copy");

  return v9;
}

uint64_t __88__CKConversationListCollectionViewController__updateLargeTitleDisplayModeWithAnimation___block_invoke(uint64_t a1)
{
  double v2;
  double v3;
  double v4;
  double v5;
  void *v6;

  v2 = *(double *)(a1 + 48);
  v3 = *(double *)(a1 + 56);
  v4 = *(double *)(a1 + 64);
  v5 = *(double *)(a1 + 72);
  objc_msgSend(*(id *)(a1 + 32), "collectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setContentInset:", v2, v3, v4, v5);

  return objc_msgSend(*(id *)(a1 + 40), "setAlpha:", 0.0);
}

uint64_t __88__CKConversationListCollectionViewController__updateLargeTitleDisplayModeWithAnimation___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
}

- (BOOL)_shouldResizeNavigationBar
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;

  -[CKConversationListCollectionViewController navigationController](self, "navigationController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "navigationBar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "bounds");
  objc_msgSend(v3, "sizeThatFits:", v4, v5);
  v7 = v6;
  objc_msgSend(v3, "bounds");
  LOBYTE(v2) = v7 < v8;

  return (char)v2;
}

- (void)commitPinnedConversationsForEditingPins
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_18DFCD000, v0, v1, "Ignoring request to commit changes to pinned conversation from a process that does not support pinned conversations.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (BOOL)_canShowCatalystFiltersNavigation
{
  void *v3;
  char v4;
  unint64_t v5;

  -[CKConversationListCollectionViewController searchController](self, "searchController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "showsSearchResultsController");

  if ((v4 & 1) != 0
    || -[CKConversationListCollectionViewController isBelowMacSnapToMinWidth](self, "isBelowMacSnapToMinWidth"))
  {
    LOBYTE(v5) = 0;
  }
  else
  {
    v5 = -[CKConversationListCollectionViewController filterMode](self, "filterMode");
    if (v5)
      LOBYTE(v5) = -[CKConversationListCollectionViewController filterMode](self, "filterMode") != 1;
  }
  return v5;
}

- (void)catalystFiltersNavigationBackButtonTapped:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CKConversationListCollectionViewController delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "catalystFiltersNavigationBackButtonTapped:", v4);

}

- (void)doneButtonTapped:(id)a3
{
  if (-[CKConversationListCollectionViewController editingMode](self, "editingMode", a3) == 2)
  {
    -[CKConversationListCollectionViewController _submitFeedbackIfNecessaryForSuggestedPinnedConversationsFollowingOnboardingCompletedSuccessfully:](self, "_submitFeedbackIfNecessaryForSuggestedPinnedConversationsFollowingOnboardingCompletedSuccessfully:", 1);
    if (-[CKConversationListCollectionViewController isShowingPinningOnboarding](self, "isShowingPinningOnboarding"))
      -[CKConversationListCollectionViewController startCompletePinningOnboardingAnimation](self, "startCompletePinningOnboardingAnimation");
    else
      -[CKConversationListCollectionViewController commitPinnedConversationsForEditingPins](self, "commitPinnedConversationsForEditingPins");
  }
  -[CKConversationListCollectionViewController setEditingMode:animated:](self, "setEditingMode:animated:", 0, 1);
}

- (void)cancelButtonTapped:(id)a3
{
  if (-[CKConversationListCollectionViewController editingMode](self, "editingMode", a3) == 2)
    -[CKConversationListCollectionViewController _submitFeedbackIfNecessaryForSuggestedPinnedConversationsFollowingOnboardingCompletedSuccessfully:](self, "_submitFeedbackIfNecessaryForSuggestedPinnedConversationsFollowingOnboardingCompletedSuccessfully:", 0);
  if (-[CKConversationListCollectionViewController isShowingPinningOnboarding](self, "isShowingPinningOnboarding"))
    -[CKConversationListCollectionViewController startEndSuggestedPinsAnimation](self, "startEndSuggestedPinsAnimation");
  else
    -[CKConversationListCollectionViewController setEditingMode:animated:](self, "setEditingMode:animated:", 0, 1);
}

- (void)selectAllButtonTapped:(id)a3
{
  void *v4;
  uint64_t v5;
  int64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  _BOOL8 v19;
  void *v20;
  id v21;

  -[CKConversationListCollectionViewController collectionView](self, "collectionView", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "indexPathsForSelectedItems");
  v21 = (id)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v21, "count");
  v6 = -[CKConversationListCollectionViewController numberOfConversations](self, "numberOfConversations");
  -[CKConversationListCollectionViewController collectionView](self, "collectionView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "numberOfItemsInSection:", 5);

  if (v5 == v6)
  {
    if (v8 >= 1)
    {
      v14 = 0;
      do
      {
        -[CKConversationListCollectionViewController collectionView](self, "collectionView");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", v14, 5);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "deselectItemAtIndexPath:animated:", v16, 0);

        ++v14;
        -[CKConversationListCollectionViewController collectionView](self, "collectionView");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "numberOfItemsInSection:", 5);

      }
      while (v14 < v18);
    }
  }
  else if (v8 >= 1)
  {
    v9 = 0;
    do
    {
      -[CKConversationListCollectionViewController collectionView](self, "collectionView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", v9, 5);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "selectItemAtIndexPath:animated:scrollPosition:", v11, 0, 0);

      ++v9;
      -[CKConversationListCollectionViewController collectionView](self, "collectionView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "numberOfItemsInSection:", 5);

    }
    while (v9 < v13);
  }
  v19 = v5 != v6;
  -[CKConversationListCollectionViewController selectAllButtonItem](self, "selectAllButtonItem");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKConversationListCollectionViewController configureSelectionBarButtonItem:usingStyle:](self, "configureSelectionBarButtonItem:usingStyle:", v20, v19);

  -[CKConversationListCollectionViewController _updateToolbarItems](self, "_updateToolbarItems");
}

- (void)configureSelectionBarButtonItem:(id)a3 usingStyle:(unint64_t)a4
{
  void *v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  id v9;

  v9 = a3;
  if (a4 == 1)
  {
    CKFrameworkBundle();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    v7 = CFSTR("DESELECT_ALL_BUTTON");
    goto LABEL_5;
  }
  if (!a4)
  {
    CKFrameworkBundle();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    v7 = CFSTR("SELECT_ALL_BUTTON");
LABEL_5:
    objc_msgSend(v5, "localizedStringForKey:value:table:", v7, &stru_1E276D870, CFSTR("ChatKit"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setTitle:", v8);

  }
}

- (void)backButtonPressed
{
  void *v3;
  void *v4;
  unint64_t v5;
  id v6;
  id v7;

  -[CKConversationListCollectionViewController navigationController](self, "navigationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "viewControllers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5 >= 2)
  {
    -[CKConversationListCollectionViewController navigationController](self, "navigationController");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    v6 = (id)objc_msgSend(v7, "popViewControllerAnimated:", 1);

  }
}

- (UIButton)macVirtualComposeButton
{
  void *v3;
  int v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  UIButton *macVirtualComposeButton;
  void *v10;
  char v11;
  UIButton *v12;
  UIButton *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  void *v18;
  double v19;
  void *v20;
  void *v21;
  UIButton *v22;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "useMacToolbar");

  if (v4)
    v5 = 3;
  else
    v5 = 2;
  v6 = (void *)MEMORY[0x1E0CEA638];
  objc_msgSend(MEMORY[0x1E0CEA650], "configurationWithScale:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "systemImageNamed:withConfiguration:", CFSTR("square.and.pencil"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  macVirtualComposeButton = self->_macVirtualComposeButton;
  if (!macVirtualComposeButton)
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "useMacToolbar");

    if ((v11 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CEA3A0], "buttonWithType:", 0);
      v12 = (UIButton *)objc_claimAutoreleasedReturnValue();
      v13 = self->_macVirtualComposeButton;
      self->_macVirtualComposeButton = v12;

      -[UIButton setContentMode:](self->_macVirtualComposeButton, "setContentMode:", 4);
      objc_msgSend(MEMORY[0x1E0CEA478], "labelColor");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIButton setTintColor:](self->_macVirtualComposeButton, "setTintColor:", v14);

      -[UIButton setBackgroundColor:](self->_macVirtualComposeButton, "setBackgroundColor:", 0);
      -[UIButton imageView](self->_macVirtualComposeButton, "imageView");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setContentMode:", 1);

      -[UIButton layer](self->_macVirtualComposeButton, "layer");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v17) = 1036831949;
      objc_msgSend(v16, "setShadowOpacity:", v17);

      -[UIButton layer](self->_macVirtualComposeButton, "layer");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setShadowRadius:", 1.0);

      if (v4)
        v19 = 5.0;
      else
        v19 = 3.0;
      -[UIButton layer](self->_macVirtualComposeButton, "layer");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setCornerRadius:", v19);

      -[UIButton layer](self->_macVirtualComposeButton, "layer");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setShadowOffset:", 0.0, 1.0);

    }
    -[UIButton addTarget:action:forControlEvents:](self->_macVirtualComposeButton, "addTarget:action:forControlEvents:", self, sel_composeButtonClicked_, 64);
    macVirtualComposeButton = self->_macVirtualComposeButton;
  }
  -[UIButton setImage:forState:](macVirtualComposeButton, "setImage:forState:", v8, 0);
  v22 = self->_macVirtualComposeButton;

  return v22;
}

- (UIBarButtonItem)catalystFiltersNavigationBackButton
{
  return self->_catalystFiltersNavigationBackButton;
}

- (id)_editNicknameMenu:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t);
  void *v12;
  id v13;
  id location;

  v4 = a3;
  location = 0;
  objc_initWeak(&location, self);
  +[CKNameAndPhotoMenuElement menuElementWithNickname:](CKNameAndPhotoMenuElement, "menuElementWithNickname:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v10 = 3221225472;
  v11 = __64__CKConversationListCollectionViewController__editNicknameMenu___block_invoke;
  v12 = &unk_1E2757BC8;
  objc_copyWeak(&v13, &location);
  objc_msgSend(v5, "setPrimaryActionHandler:", &v9);
  v6 = (void *)objc_opt_new();
  objc_msgSend(v6, "addObject:", v5, v9, v10, v11, v12);
  objc_msgSend(MEMORY[0x1E0CEA740], "menuWithTitle:image:identifier:options:children:", &stru_1E276D870, 0, 0, 1, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

  return v7;
}

void __64__CKConversationListCollectionViewController__editNicknameMenu___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "editNameAndPhotoMenuItemSelected");

}

- (id)editButtonDropdownMenu
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  char v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  int v37;
  __CFString *v38;
  __CFString *v39;
  __CFString *v40;
  __CFString *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  int v46;
  void *v47;
  int v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v68;
  uint64_t v69;
  void *v70;
  _QWORD v71[4];
  id v72;
  _QWORD v73[4];
  id v74;
  _QWORD v75[4];
  id v76;
  id from;
  _QWORD v78[4];
  id v79;
  _QWORD v80[4];
  id v81;
  _QWORD v82[4];
  id v83;
  id location[2];

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  location[0] = 0;
  objc_initWeak(location, self);
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isNameAndPhotoC3Enabled");

  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0D398E8], "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "sharingEnabled");

    if (v7)
    {
      if (IMSharedHelperNickNameEnabled())
      {
        objc_msgSend(MEMORY[0x1E0D358A8], "sharedInstance");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "fetchPersonalNicknameWithCompletion:", &__block_literal_global_516_0);

        objc_msgSend(MEMORY[0x1E0D358A8], "sharedInstance");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "personalNickname");
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v10, "firstName");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v11, "length"))
        {

        }
        else
        {
          objc_msgSend(v10, "lastName");
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          v69 = objc_msgSend(v68, "length");

          if (!v69)
          {
            v12 = 0;
            goto LABEL_31;
          }
        }
        -[CKConversationListCollectionViewController _editNicknameMenu:](self, "_editNicknameMenu:", v10);
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v70);

        v12 = 1;
LABEL_31:

        goto LABEL_7;
      }
    }
  }
  v12 = 0;
LABEL_7:
  if (-[CKConversationListCollectionViewController numberOfConversations](self, "numberOfConversations") > 0
    || -[CKConversationListCollectionViewController numberOfPinnedConversations](self, "numberOfPinnedConversations") >= 1)
  {
    v13 = (void *)MEMORY[0x1E0CEA2A8];
    CKFrameworkBundle();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("MANAGE_MESSAGES"), &stru_1E276D870, CFSTR("ChatKit"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:", CFSTR("checkmark.circle"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v82[0] = MEMORY[0x1E0C809B0];
    v82[1] = 3221225472;
    v82[2] = __68__CKConversationListCollectionViewController_editButtonDropdownMenu__block_invoke_2;
    v82[3] = &unk_1E274A4C0;
    objc_copyWeak(&v83, location);
    objc_msgSend(v13, "actionWithTitle:image:identifier:handler:", v15, v16, 0, v82);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "addObject:", v17);
    if (-[CKConversationListCollectionViewController shouldShowPinnedConversations](self, "shouldShowPinnedConversations"))
    {
      v18 = (void *)MEMORY[0x1E0CEA2A8];
      CKFrameworkBundle();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("EDIT_PINS"), &stru_1E276D870, CFSTR("ChatKit"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:", CFSTR("pin"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v80[0] = MEMORY[0x1E0C809B0];
      v80[1] = 3221225472;
      v80[2] = __68__CKConversationListCollectionViewController_editButtonDropdownMenu__block_invoke_3;
      v80[3] = &unk_1E274A4C0;
      objc_copyWeak(&v81, location);
      objc_msgSend(v18, "actionWithTitle:image:identifier:handler:", v20, v21, 0, v80);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v3, "addObject:", v22);
      objc_destroyWeak(&v81);
    }

    objc_destroyWeak(&v83);
  }
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v12 & objc_msgSend(v23, "isNameAndPhotoC3Enabled");

  if ((v24 & 1) == 0 && IMSharedHelperNickNameEnabled())
  {
    v25 = (void *)MEMORY[0x1E0CEA2A8];
    CKFrameworkBundle();
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "localizedStringForKey:value:table:", CFSTR("EDIT_PROFILE"), &stru_1E276D870, CFSTR("ChatKit"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:", CFSTR("person.crop.circle"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v78[0] = MEMORY[0x1E0C809B0];
    v78[1] = 3221225472;
    v78[2] = __68__CKConversationListCollectionViewController_editButtonDropdownMenu__block_invoke_4;
    v78[3] = &unk_1E274A4C0;
    objc_copyWeak(&v79, location);
    objc_msgSend(v25, "actionWithTitle:image:identifier:handler:", v27, v28, 0, v78);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "addObject:", v29);
    objc_destroyWeak(&v79);
  }
  if (!-[CKConversationListCollectionViewController _shouldShowInboxView](self, "_shouldShowInboxView"))
    -[CKConversationListCollectionViewController _configureSecondarySubMenuInParentMenuItems:](self, "_configureSecondarySubMenuInParentMenuItems:", v3);
  if (-[CKConversationListCollectionViewController _shouldShowInboxView](self, "_shouldShowInboxView")
    && CKMessageSIMFilteringEnabled())
  {
    -[CKConversationListCollectionViewController _simFilterSubMenu](self, "_simFilterSubMenu");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v30);

  }
  if (-[CKConversationListCollectionViewController shouldShowInternalDebugMenu](self, "shouldShowInternalDebugMenu"))
  {
    from = 0;
    objc_initWeak(&from, self);
    v31 = (void *)MEMORY[0x1E0CEA2A8];
    objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:", CFSTR("ant"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v75[0] = MEMORY[0x1E0C809B0];
    v75[1] = 3221225472;
    v75[2] = __68__CKConversationListCollectionViewController_editButtonDropdownMenu__block_invoke_5;
    v75[3] = &unk_1E274A4C0;
    objc_copyWeak(&v76, &from);
    objc_msgSend(v31, "actionWithTitle:image:identifier:handler:", CFSTR("Debug"), v32, 0, v75);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "addObject:", v33);
    v34 = (void *)MEMORY[0x1E0CEA2A8];
    objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:", CFSTR("flag"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "actionWithTitle:image:identifier:handler:", CFSTR("Feature Flags"), v35, 0, &__block_literal_global_535_0);
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "addObject:", v36);
    v37 = IMGetDomainBoolForKey();
    v38 = CFSTR("eye.slash");
    if (v37)
    {
      v38 = CFSTR("eye");
      v39 = CFSTR("Show Sensitive UI");
    }
    else
    {
      v39 = CFSTR("Hide Sensitive UI");
    }
    v40 = v38;
    v41 = v39;
    v42 = (void *)MEMORY[0x1E0CEA2A8];
    objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:", v40);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v73[0] = MEMORY[0x1E0C809B0];
    v73[1] = 3221225472;
    v73[2] = __68__CKConversationListCollectionViewController_editButtonDropdownMenu__block_invoke_7;
    v73[3] = &unk_1E274A4C0;
    objc_copyWeak(&v74, &from);
    objc_msgSend(v42, "actionWithTitle:image:identifier:handler:", v41, v43, 0, v73);
    v44 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "addObject:", v44);
    objc_destroyWeak(&v74);

    objc_destroyWeak(&v76);
    objc_destroyWeak(&from);
  }
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = objc_msgSend(v45, "isCarrierPigeonEnabled");

  if (v46)
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = objc_msgSend(v47, "BOOLForKey:", CFSTR("ShowCarrierPigeonNotificationHelpers"));

    if (v48)
    {
      v49 = (void *)MEMORY[0x1E0CEA2A8];
      CKFrameworkBundle();
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "localizedStringForKey:value:table:", CFSTR("Connect"), &stru_1E276D870, CFSTR("ChatKit"));
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:", CFSTR("antenna.radiowaves.left.and.right"));
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "actionWithTitle:image:identifier:handler:", v51, v52, 0, &__block_literal_global_556);
      v53 = (void *)objc_claimAutoreleasedReturnValue();

      v54 = (void *)MEMORY[0x1E0CEA2A8];
      CKFrameworkBundle();
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "localizedStringForKey:value:table:", CFSTR("Update count"), &stru_1E276D870, CFSTR("ChatKit"));
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:", CFSTR("number.circle"));
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "actionWithTitle:image:identifier:handler:", v56, v57, 0, &__block_literal_global_561_0);
      v58 = (void *)objc_claimAutoreleasedReturnValue();

      from = 0;
      objc_initWeak(&from, self);
      v59 = (void *)MEMORY[0x1E0CEA2A8];
      CKFrameworkBundle();
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "localizedStringForKey:value:table:", CFSTR("Remove invited handles"), &stru_1E276D870, CFSTR("ChatKit"));
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:", CFSTR("delete.left"));
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      v71[0] = MEMORY[0x1E0C809B0];
      v71[1] = 3221225472;
      v71[2] = __68__CKConversationListCollectionViewController_editButtonDropdownMenu__block_invoke_10;
      v71[3] = &unk_1E274A4C0;
      objc_copyWeak(&v72, &from);
      objc_msgSend(v59, "actionWithTitle:image:identifier:handler:", v61, v62, 0, v71);
      v63 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v3, "addObject:", v53);
      objc_msgSend(v3, "addObject:", v58);
      objc_msgSend(v3, "addObject:", v63);

      objc_destroyWeak(&v72);
      objc_destroyWeak(&from);

    }
  }
  v64 = (void *)MEMORY[0x1E0CEA740];
  v65 = (void *)objc_msgSend(v3, "copy");
  objc_msgSend(v64, "menuWithTitle:children:", &stru_1E276D870, v65);
  v66 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(location);
  return v66;
}

void __68__CKConversationListCollectionViewController_editButtonDropdownMenu__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setEditingMode:animated:", 1, 1);

}

void __68__CKConversationListCollectionViewController_editButtonDropdownMenu__block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setEditingMode:animated:", 2, 1);

}

void __68__CKConversationListCollectionViewController_editButtonDropdownMenu__block_invoke_4(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "editNameAndPhotoMenuItemSelected");

}

void __68__CKConversationListCollectionViewController_editButtonDropdownMenu__block_invoke_5(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "delegate");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "showDebugMenu");

}

void __68__CKConversationListCollectionViewController_editButtonDropdownMenu__block_invoke_6()
{
  void *v0;
  id v1;

  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("prefs:root=INTERNAL_SETTINGS&path=Feature%20Flags/Messages"));
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "openSensitiveURL:withOptions:", v1, 0);

}

void __68__CKConversationListCollectionViewController_editButtonDropdownMenu__block_invoke_7(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "delegate");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "toggleSensitiveUI");

}

void __68__CKConversationListCollectionViewController_editButtonDropdownMenu__block_invoke_8()
{
  id v0;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "__mainThreadPostNotificationName:object:", *MEMORY[0x1E0D35500], 0);

}

void __68__CKConversationListCollectionViewController_editButtonDropdownMenu__block_invoke_9()
{
  id v0;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "__mainThreadPostNotificationName:object:", *MEMORY[0x1E0D35420], 0);

}

void __68__CKConversationListCollectionViewController_editButtonDropdownMenu__block_invoke_10(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  _QWORD v5[4];
  id v6;

  v3 = a2;
  objc_msgSend(MEMORY[0x1E0D39998], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __68__CKConversationListCollectionViewController_editButtonDropdownMenu__block_invoke_11;
  v5[3] = &unk_1E2757C10;
  objc_copyWeak(&v6, (id *)(a1 + 32));
  objc_msgSend(v4, "removeAllInvitedHandlesWithCompletion:", v5);

  objc_destroyWeak(&v6);
}

void __68__CKConversationListCollectionViewController_editButtonDropdownMenu__block_invoke_11(uint64_t a1, char a2, void *a3)
{
  id v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  char v10;

  v5 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __68__CKConversationListCollectionViewController_editButtonDropdownMenu__block_invoke_12;
  block[3] = &unk_1E274F490;
  v10 = a2;
  v8 = v5;
  v6 = v5;
  objc_copyWeak(&v9, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x1E0C80D38], block);
  objc_destroyWeak(&v9);

}

void __68__CKConversationListCollectionViewController_editButtonDropdownMenu__block_invoke_12(uint64_t a1)
{
  __CFString *v2;
  __CFString *v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id WeakRetained;
  __CFString *v11;
  id v12;

  if (*(_BYTE *)(a1 + 48))
    v2 = CFSTR("Success");
  else
    v2 = CFSTR("Removing invited handles failed.");
  v3 = v2;
  v4 = v3;
  if (*(_QWORD *)(a1 + 32))
  {
    v11 = v3;
    -[__CFString stringByAppendingString:](v3, "stringByAppendingString:");
    v5 = objc_claimAutoreleasedReturnValue();

    v4 = (id)v5;
  }
  v12 = v4;
  +[CKAlertController alertControllerWithTitle:message:preferredStyle:](CKAlertController, "alertControllerWithTitle:message:preferredStyle:", CFSTR("Remove invited handles"), v4, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  CKFrameworkBundle();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_1E276D870, CFSTR("ChatKit"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKAlertAction actionWithTitle:style:handler:](CKAlertAction, "actionWithTitle:style:handler:", v8, 1, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "addAction:", v9);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "presentViewController:animated:completion:", v6, 1, 0);

}

- (BOOL)shouldShowInternalDebugMenu
{
  void *v2;
  int v3;
  void *v4;
  char v5;

  objc_msgSend(MEMORY[0x1E0D36A50], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isInternalInstall");

  if (!v3)
    return 0;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLForKey:", CFSTR("showDebugMenu"));

  return v5;
}

- (void)_configureSecondarySubMenuInParentMenuItems:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  v4 = (void *)objc_opt_new();
  -[CKConversationListCollectionViewController conversationList](self, "conversationList");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "conversationsForFilterMode:", 9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v7)
  {
    -[CKConversationListCollectionViewController showOscarModalAction](self, "showOscarModalAction");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v8);

  }
  -[CKConversationListCollectionViewController conversationList](self, "conversationList");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "conversationsForFilterMode:", 7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");

  if (v11)
  {
    -[CKConversationListCollectionViewController showRecentlyDeletedModalAction](self, "showRecentlyDeletedModalAction");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v12);

  }
  if (objc_msgSend(v4, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CEA740], "menuWithTitle:image:identifier:options:children:", &stru_1E276D870, 0, 0, 1, v4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObject:", v13);

  }
}

- (void)editNameAndPhotoMenuItemSelected
{
  void *v3;
  char v4;
  void *v5;
  int v6;
  void *v7;
  id v8;

  objc_msgSend(MEMORY[0x1E0D358A8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "iCloudSignedInToUseNicknames");

  if ((v4 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v5, "isAllowMultiplePhoneNumbersSNaPEnabled") & 1) != 0)
    {

LABEL_8:
      -[CKConversationListCollectionViewController showMeCardViewController](self, "showMeCardViewController");
      goto LABEL_9;
    }
    v6 = objc_msgSend(MEMORY[0x1E0D358A8], "multiplePhoneNumbersTiedToAppleID");

    if (!v6)
      goto LABEL_8;
    -[CKConversationListCollectionViewController showMultiplePhoneNumbersAlertForNicknames](self, "showMultiplePhoneNumbersAlertForNicknames");
  }
  else
  {
    -[CKConversationListCollectionViewController showiCloudNotSignedInAlertForNicknames](self, "showiCloudNotSignedInAlertForNicknames");
  }
  -[CKConversationListCollectionViewController _meCardSharingState](self, "_meCardSharingState");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setSharingEnabled:", 0);

LABEL_9:
  objc_msgSend(MEMORY[0x1E0D39958], "sharedInstance");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "trackEvent:", *MEMORY[0x1E0D38590]);

}

- (id)_simFilterSubMenu
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t);
  void *v19;
  id v20;
  id location;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  location = 0;
  objc_initWeak(&location, self);
  v4 = (void *)MEMORY[0x1E0CEA2A8];
  CKFrameworkBundle();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("SIM_FILTER_ALL_LINES"), &stru_1E276D870, CFSTR("ChatKit"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:", CFSTR("simcard.2"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = MEMORY[0x1E0C809B0];
  v17 = 3221225472;
  v18 = __63__CKConversationListCollectionViewController__simFilterSubMenu__block_invoke;
  v19 = &unk_1E274A4C0;
  objc_copyWeak(&v20, &location);
  objc_msgSend(v4, "actionWithTitle:image:identifier:handler:", v6, v7, 0, &v16);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[CKConversationListCollectionViewController conversationList](self, "conversationList", v16, v17, v18, v19);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "simFilterIndex");

  if (v10 == -1)
    objc_msgSend(v8, "setState:", 1);
  objc_msgSend(v3, "addObject:", v8);
  -[CKConversationListCollectionViewController _simFilterActionsForActiveSubscriptions](self, "_simFilterActionsForActiveSubscriptions");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v11);

  v12 = (void *)MEMORY[0x1E0CEA740];
  v13 = (void *)objc_msgSend(v3, "copy");
  objc_msgSend(v12, "menuWithTitle:image:identifier:options:children:", &stru_1E276D870, 0, 0, 1, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);

  return v14;
}

void __63__CKConversationListCollectionViewController__simFilterSubMenu__block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "updateSIMFilterIndexAndReloadData:", -1);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -1);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  IMSetDomainValueForKey();

}

- (id)_simFilterActionsForActiveSubscriptions
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id obj;
  id v21;
  _QWORD v22[5];
  id v23;
  id location;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v21 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(MEMORY[0x1E0D39738], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ctSubscriptionInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "subscriptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  obj = v5;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v26 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        if (objc_msgSend(v9, "slotID"))
        {
          CKFrameworkBundle();
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "label");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "localizedStringForKey:value:table:", v11, &stru_1E276D870, CFSTR("ChatKit"));
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          location = 0;
          objc_initWeak(&location, self);
          v13 = (void *)MEMORY[0x1E0CEA2A8];
          v22[0] = MEMORY[0x1E0C809B0];
          v22[1] = 3221225472;
          v22[2] = __85__CKConversationListCollectionViewController__simFilterActionsForActiveSubscriptions__block_invoke;
          v22[3] = &unk_1E274B010;
          objc_copyWeak(&v23, &location);
          v22[4] = v9;
          objc_msgSend(v13, "actionWithTitle:image:identifier:handler:", v12, 0, 0, v22);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          -[CKConversationListCollectionViewController conversationList](self, "conversationList");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "setState:", objc_msgSend(v15, "simFilterIndex") == objc_msgSend(v9, "slotID"));

          CKLocalizedShortNameForContext(v9);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CEA638], "__ck_actionImageForSubscriptionShortName:isFilled:", v16, 0);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "setImage:", v17);

          objc_msgSend(v21, "addObject:", v14);
          objc_destroyWeak(&v23);
          objc_destroyWeak(&location);

        }
      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v6);
  }

  v18 = (void *)objc_msgSend(v21, "copy");
  return v18;
}

void __85__CKConversationListCollectionViewController__simFilterActionsForActiveSubscriptions__block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "updateSIMFilterIndexAndReloadData:", objc_msgSend(*(id *)(a1 + 32), "slotID"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "slotID"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  IMSetDomainValueForKey();

}

- (void)editButtonMenuWillShow
{
  void *v3;
  id v4;

  -[CKConversationListCollectionViewController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dismissKeyboardIfVisible");

  if (-[CKConversationListCollectionViewController isShowingSwipeDeleteConfirmation](self, "isShowingSwipeDeleteConfirmation"))
  {
    -[CKConversationListCollectionViewController setEditingMode:animated:](self, "setEditingMode:animated:", 0, 1);
  }
  objc_msgSend(MEMORY[0x1E0D39958], "sharedInstance");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "trackEvent:", *MEMORY[0x1E0D38708]);

}

id __60__CKConversationListCollectionViewController_editButtonItem__block_invoke(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  id v3;
  void *v4;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "editButtonMenuWillShow");

  v3 = objc_loadWeakRetained(v1);
  objc_msgSend(v3, "editButtonDropdownMenu");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (UIBarButtonItem)editOscarButtonItem
{
  UIBarButtonItem *editOscarButtonItem;
  UIBarButtonItem *v4;
  UIBarButtonItem *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t);
  void *v15;
  id v16;
  id location;

  editOscarButtonItem = self->_editOscarButtonItem;
  if (!editOscarButtonItem)
  {
    v4 = (UIBarButtonItem *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA380]), "initWithBarButtonSystemItem:primaryAction:", 2, 0);
    v5 = self->_editOscarButtonItem;
    self->_editOscarButtonItem = v4;

    -[UIBarButtonItem setAccessibilityIdentifier:](self->_editOscarButtonItem, "setAccessibilityIdentifier:", CFSTR("editJunkButton"));
    location = 0;
    objc_initWeak(&location, self);
    v6 = (void *)MEMORY[0x1E0CEA2A8];
    CKFrameworkBundle();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("MANAGE_MESSAGES"), &stru_1E276D870, CFSTR("ChatKit"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:", CFSTR("checkmark.circle"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = MEMORY[0x1E0C809B0];
    v13 = 3221225472;
    v14 = __65__CKConversationListCollectionViewController_editOscarButtonItem__block_invoke;
    v15 = &unk_1E274A4C0;
    objc_copyWeak(&v16, &location);
    objc_msgSend(v6, "actionWithTitle:image:identifier:handler:", v8, v9, 0, &v12);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIBarButtonItem setPrimaryAction:](self->_editOscarButtonItem, "setPrimaryAction:", v10, v12, v13, v14, v15);

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
    editOscarButtonItem = self->_editOscarButtonItem;
  }
  return editOscarButtonItem;
}

void __65__CKConversationListCollectionViewController_editOscarButtonItem__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setEditingMode:animated:", 1, 1);

}

- (UIBarButtonItem)optionsButtonItem
{
  UIBarButtonItem *optionsButtonItem;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  UIBarButtonItem *v8;
  UIBarButtonItem *v9;
  uint64_t v11;
  uint64_t v12;
  id (*v13)(uint64_t);
  void *v14;
  id v15;
  id location;

  optionsButtonItem = self->_optionsButtonItem;
  if (!optionsButtonItem)
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "conversationListOptionsButtonImageName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = objc_alloc(MEMORY[0x1E0CEA380]);
    objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (UIBarButtonItem *)objc_msgSend(v6, "initWithImage:style:target:action:", v7, 0, self, 0);
    v9 = self->_optionsButtonItem;
    self->_optionsButtonItem = v8;

    -[UIBarButtonItem setAccessibilityIdentifier:](self->_optionsButtonItem, "setAccessibilityIdentifier:", CFSTR("optionsButton"));
    if (!-[CKConversationListCollectionViewController hasActivePinnedConversationDropSession](self, "hasActivePinnedConversationDropSession"))
    {
      -[UIBarButtonItem setSpringLoaded:](self->_optionsButtonItem, "setSpringLoaded:", 1);
      location = 0;
      objc_initWeak(&location, self);
      v11 = MEMORY[0x1E0C809B0];
      v12 = 3221225472;
      v13 = __63__CKConversationListCollectionViewController_optionsButtonItem__block_invoke;
      v14 = &unk_1E2757C38;
      objc_copyWeak(&v15, &location);
      -[UIBarButtonItem _setSecondaryActionsProvider:](self->_optionsButtonItem, "_setSecondaryActionsProvider:", &v11);
      -[UIBarButtonItem setSecondaryActionsArePrimary:](self->_optionsButtonItem, "setSecondaryActionsArePrimary:", 1, v11, v12, v13, v14);
      objc_destroyWeak(&v15);
      objc_destroyWeak(&location);
    }

    optionsButtonItem = self->_optionsButtonItem;
  }
  return optionsButtonItem;
}

id __63__CKConversationListCollectionViewController_optionsButtonItem__block_invoke(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  id v3;
  void *v4;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "editButtonMenuWillShow");

  v3 = objc_loadWeakRetained(v1);
  objc_msgSend(v3, "editButtonDropdownMenu");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (UIBarButtonItem)cancelButtonItem
{
  UIBarButtonItem *cancelButtonItem;
  UIBarButtonItem *v4;
  UIBarButtonItem *v5;

  cancelButtonItem = self->_cancelButtonItem;
  if (!cancelButtonItem)
  {
    v4 = (UIBarButtonItem *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA380]), "initWithBarButtonSystemItem:target:action:", 1, self, sel_cancelButtonTapped_);
    v5 = self->_cancelButtonItem;
    self->_cancelButtonItem = v4;

    -[UIBarButtonItem setSpringLoaded:](self->_cancelButtonItem, "setSpringLoaded:", 1);
    cancelButtonItem = self->_cancelButtonItem;
  }
  return cancelButtonItem;
}

- (UIBarButtonItem)doneButtonItem
{
  UIBarButtonItem *doneButtonItem;
  UIBarButtonItem *v4;
  UIBarButtonItem *v5;

  doneButtonItem = self->_doneButtonItem;
  if (!doneButtonItem)
  {
    v4 = (UIBarButtonItem *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA380]), "initWithBarButtonSystemItem:target:action:", 0, self, sel_doneButtonTapped_);
    v5 = self->_doneButtonItem;
    self->_doneButtonItem = v4;

    -[UIBarButtonItem setSpringLoaded:](self->_doneButtonItem, "setSpringLoaded:", 1);
    doneButtonItem = self->_doneButtonItem;
  }
  return doneButtonItem;
}

- (UIBarButtonItem)selectAllButtonItem
{
  id v3;
  void *v4;
  void *v5;
  UIBarButtonItem *v6;
  UIBarButtonItem *selectAllButtonItem;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  if (!self->_selectAllButtonItem)
  {
    v3 = objc_alloc(MEMORY[0x1E0CEA380]);
    CKFrameworkBundle();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("SELECT_ALL_BUTTON"), &stru_1E276D870, CFSTR("ChatKit"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (UIBarButtonItem *)objc_msgSend(v3, "initWithTitle:style:target:action:", v5, 0, self, sel_selectAllButtonTapped_);
    selectAllButtonItem = self->_selectAllButtonItem;
    self->_selectAllButtonItem = v6;

    v8 = objc_alloc(MEMORY[0x1E0C99E60]);
    CKFrameworkBundle();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("SELECT_ALL_BUTTON"), &stru_1E276D870, CFSTR("ChatKit"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v10;
    CKFrameworkBundle();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("DESELECT_ALL_BUTTON"), &stru_1E276D870, CFSTR("ChatKit"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v16[1] = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v8, "initWithArray:", v13);
    -[UIBarButtonItem setPossibleTitles:](self->_selectAllButtonItem, "setPossibleTitles:", v14);

    -[UIBarButtonItem setAccessibilityIdentifier:](self->_selectAllButtonItem, "setAccessibilityIdentifier:", CFSTR("selectAllButton"));
    -[UIBarButtonItem setSpringLoaded:](self->_selectAllButtonItem, "setSpringLoaded:", 1);
  }
  -[CKConversationListCollectionViewController _updateSelectAllButtonItemTitle](self, "_updateSelectAllButtonItemTitle");
  return self->_selectAllButtonItem;
}

- (UIBarButtonItem)moveSelectedToRecentlyDeletedButtonItem
{
  UIBarButtonItem *moveSelectedToRecentlyDeletedButtonItem;
  void *v4;
  UIBarButtonItem *v5;
  UIBarButtonItem *v6;

  moveSelectedToRecentlyDeletedButtonItem = self->_moveSelectedToRecentlyDeletedButtonItem;
  if (!moveSelectedToRecentlyDeletedButtonItem)
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "conversationListMoveSelectedToRecentlyDeletedButtonItemWithTarget:action:", self, sel__moveToRecentlyDeletedButtonTapped_);
    v5 = (UIBarButtonItem *)objc_claimAutoreleasedReturnValue();

    -[UIBarButtonItem accessibilitySetIdentification:](v5, "accessibilitySetIdentification:", CFSTR("deleteButton"));
    v6 = self->_moveSelectedToRecentlyDeletedButtonItem;
    self->_moveSelectedToRecentlyDeletedButtonItem = v5;

    moveSelectedToRecentlyDeletedButtonItem = self->_moveSelectedToRecentlyDeletedButtonItem;
  }
  return moveSelectedToRecentlyDeletedButtonItem;
}

- (UIBarButtonItem)closeButtonItem
{
  UIBarButtonItem *closeButtonItem;
  UIBarButtonItem *v4;
  UIBarButtonItem *v5;

  closeButtonItem = self->_closeButtonItem;
  if (!closeButtonItem)
  {
    v4 = (UIBarButtonItem *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA380]), "initWithBarButtonSystemItem:target:action:", 0, self, sel__dismissPresentedNavController_);
    v5 = self->_closeButtonItem;
    self->_closeButtonItem = v4;

    closeButtonItem = self->_closeButtonItem;
  }
  return closeButtonItem;
}

void __83__CKConversationListCollectionViewController_setEditingMode_animated_shouldUpdate___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  char v10;
  void *v11;
  id v12;

  v12 = a2;
  objc_msgSend(*(id *)(a1 + 32), "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "indexPathForCell:", v12);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "section") == 5)
  {
    v5 = *(void **)(a1 + 32);
    v6 = v12;
    objc_msgSend(v5, "_ensureCellLayoutOnCell:", v6);
    objc_msgSend(v6, "setEditingMode:animated:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));
LABEL_8:

    goto LABEL_9;
  }
  if (objc_msgSend(v4, "section") == 2)
  {
    objc_msgSend(*(id *)(a1 + 32), "dataSource");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "itemIdentifierForIndexPath:", v4);
    v6 = (id)objc_claimAutoreleasedReturnValue();

    +[CKPinnedConversationDropTargetCollectionViewCell uniqueIdentifier](CKPinnedConversationDropTargetCollectionViewCell, "uniqueIdentifier");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v6, "isEqualToString:", v8) & 1) == 0)
    {
      +[CKPinnedConversationDropTargetCollectionViewCell uniqueIdentifierForDropTargetAtItemIndex:](CKPinnedConversationDropTargetCollectionViewCell, "uniqueIdentifierForDropTargetAtItemIndex:", objc_msgSend(v4, "item"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v6, "isEqualToString:", v9);

      if ((v10 & 1) != 0)
        goto LABEL_8;
      v11 = *(void **)(a1 + 32);
      v8 = v12;
      objc_msgSend(v8, "setEditingMode:animated:", objc_msgSend(v11, "editingMode"), *(unsigned __int8 *)(a1 + 48));
    }

    goto LABEL_8;
  }
LABEL_9:

}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  id WeakRetained;
  void *v8;
  int v9;
  void *v10;
  objc_super v11;

  v4 = a4;
  v5 = a3;
  if (-[CKConversationListCollectionViewController isEditing](self, "isEditing") != a3)
  {
    v11.receiver = self;
    v11.super_class = (Class)CKConversationListCollectionViewController;
    -[CKConversationListCollectionViewController setEditing:animated:](&v11, sel_setEditing_animated_, v5, v4);
    if (!v5 && -[CKConversationListCollectionViewController editingMode](self, "editingMode"))
      -[CKConversationListCollectionViewController setEditingMode:animated:](self, "setEditingMode:animated:", 0, 0);
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "setEditing:animated:", v5, v4);

    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "selectNewConversationOnDeletion");

    if (v9 && !v5)
      -[CKConversationListCollectionViewController updateConversationSelection](self, "updateConversationSelection");
    if (v5)
    {
      -[CKConversationListCollectionViewController updater](self, "updater");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "beginHoldingUpdatesForReason:", CFSTR("editMode"));

    }
    else
    {
      -[CKConversationListCollectionViewController _endHoldingUpdatesForBatchEditing:](self, "_endHoldingUpdatesForBatchEditing:", v4);
      -[CKConversationListCollectionViewController updateSyncProgressIfNeeded](self, "updateSyncProgressIfNeeded");
    }
    -[CKConversationListCollectionViewController _updateForCurrentEditingStateAnimated:](self, "_updateForCurrentEditingStateAnimated:", v4);
  }
}

- (void)_updateForCurrentEditingStateAnimated:(BOOL)a3
{
  _BOOL8 v3;
  _BOOL8 v5;
  _BOOL4 v6;
  void *v7;
  int v8;
  uint64_t v9;
  void *v10;

  v3 = a3;
  if (-[CKConversationListCollectionViewController filterMode](self, "filterMode") == 7
    || -[CKConversationListCollectionViewController filterMode](self, "filterMode") == 9)
  {
    v5 = 0;
  }
  else
  {
    -[CKConversationListCollectionViewController _updateLargeTitleDisplayModeWithAnimation:](self, "_updateLargeTitleDisplayModeWithAnimation:", v3);
    if (-[CKConversationListCollectionViewController isEditing](self, "isEditing"))
      v5 = CKIsRunningInMacCatalyst() != 0;
    else
      v5 = 1;
  }
  -[CKConversationListCollectionViewController configureSearchBarEnabled:](self, "configureSearchBarEnabled:", v5);
  v6 = -[CKConversationListCollectionViewController _shouldShowToolbar](self, "_shouldShowToolbar");
  if (v6)
    -[CKConversationListCollectionViewController _updateToolbarItems](self, "_updateToolbarItems");
  -[CKConversationListCollectionViewController syncStatusView](self, "syncStatusView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isVisibleInViewHierarchy");

  v9 = v8 ^ 1u;
  -[CKConversationListCollectionViewController navigationController](self, "navigationController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setToolbarHidden:animated:", !v6, v9);

  -[CKConversationListCollectionViewController updateNavigationItems](self, "updateNavigationItems");
  -[CKConversationListCollectionViewController invalidateCellLayout](self, "invalidateCellLayout");
}

- (void)configureSearchBarEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = a3;
  -[CKConversationListCollectionViewController navigationItem](self, "navigationItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "searchController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "searchBar");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "searchTextField");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setEnabled:", v3);

}

- (void)_updateToolbarItems
{
  void *v3;
  void *v4;
  void *v5;

  -[CKConversationListCollectionViewController toolbarItems](self, "toolbarItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKConversationListCollectionViewController navigationController](self, "navigationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "toolbar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setItems:", v3);

  -[CKConversationListCollectionViewController updateSyncProgressIfNeeded](self, "updateSyncProgressIfNeeded");
}

- (void)_endHoldingUpdatesForBatchEditing:(BOOL)a3
{
  dispatch_time_t v4;
  id v5;
  _QWORD block[5];

  if (a3)
  {
    -[CKConversationListCollectionViewController updateNavigationItems](self, "updateNavigationItems");
    v4 = dispatch_time(0, 300000000);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __80__CKConversationListCollectionViewController__endHoldingUpdatesForBatchEditing___block_invoke;
    block[3] = &unk_1E274A208;
    block[4] = self;
    dispatch_after(v4, MEMORY[0x1E0C80D38], block);
  }
  else
  {
    -[CKConversationListCollectionViewController updater](self, "updater");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "endAllHoldsOnUpdatesForReason:updateTriggeredIfNotHeldShouldBeDeferred:", CFSTR("editMode"), 1);

  }
}

void __80__CKConversationListCollectionViewController__endHoldingUpdatesForBatchEditing___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "updater");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "endAllHoldsOnUpdatesForReason:updateTriggeredIfNotHeldShouldBeDeferred:", CFSTR("editMode"), 1);

}

- (void)composeButtonClicked:(id)a3
{
  id v4;
  void *v5;
  id WeakRetained;
  int v7;
  NSObject *v8;
  const char *v9;
  uint8_t *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  __int16 v15;
  __int16 v16;

  v4 = a3;
  -[CKConversationListCollectionViewController setEditingMode:animated:](self, "setEditingMode:animated:", 0, 0);
  if (-[CKConversationListCollectionViewController filterMode](self, "filterMode") == 7
    || -[CKConversationListCollectionViewController filterMode](self, "filterMode") == 9)
  {
    -[CKConversationListCollectionViewController delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "catalystFiltersNavigationBackButtonTapped:", v4);

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v7 = objc_msgSend(WeakRetained, "isAnimatingMessageSend");

  if (v7)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        v16 = 0;
        v9 = "Compose button selected during an active message send animation, ignoring.";
        v10 = (uint8_t *)&v16;
LABEL_12:
        _os_log_impl(&dword_18DFCD000, v8, OS_LOG_TYPE_INFO, v9, v10, 2u);
        goto LABEL_17;
      }
      goto LABEL_17;
    }
  }
  else if (-[CKConversationListCollectionViewController hasActivePinnedConversationDropSession](self, "hasActivePinnedConversationDropSession"))
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        v15 = 0;
        v9 = "Compose button selected during an active conversation drag and drop session, ignoring.";
        v10 = (uint8_t *)&v15;
        goto LABEL_12;
      }
LABEL_17:

    }
  }
  else
  {
    if (-[CKConversationListCollectionViewController _wantsThreeColumnLayout](self, "_wantsThreeColumnLayout"))
    {
      -[CKConversationListCollectionViewController splitViewController](self, "splitViewController");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "hideColumn:", 0);

    }
    +[CKDraftManager sharedInstance](CKDraftManager, "sharedInstance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setDraftForPendingConversation:withRecipients:", 0, 0);

    +[CKDraftManager sharedInstance](CKDraftManager, "sharedInstance");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "saveCompositionAndFlushCache:", 0);

    v14 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v14, "showNewMessageCompositionPanelWithRecipients:composition:animated:", 0, 0, 1);

    -[CKConversationListCollectionViewController dismissCatalystSearch](self, "dismissCatalystSearch");
    if (-[CKConversationListCollectionViewController _shouldKeepSelection](self, "_shouldKeepSelection"))
    {
      -[CKConversationListCollectionViewController collectionView](self, "collectionView");
      v8 = objc_claimAutoreleasedReturnValue();
      -[NSObject __ck_scrollToTop:](v8, "__ck_scrollToTop:", 1);
      goto LABEL_17;
    }
  }

}

- (void)dismissCatalystSearch
{
  void *v3;
  int v4;
  void *v5;
  id v6;

  if (CKIsRunningInMacCatalyst())
  {
    -[CKConversationListCollectionViewController searchController](self, "searchController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isActive");

    if (v4)
    {
      -[CKConversationListCollectionViewController searchController](self, "searchController");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setActive:", 0);

      -[CKConversationListCollectionViewController searchController](self, "searchController");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setShowsSearchResultsController:", 0);

    }
  }
}

- (void)showiCloudNotSignedInAlertForNicknames
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
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v3 = (void *)MEMORY[0x1E0CEA2E8];
  CKFrameworkBundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("NICKNAME_FEATURE_NOT_AVAILABLE_TITLE"), &stru_1E276D870, CFSTR("ChatKit"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  CKFrameworkBundle();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("NICKNAME_APPLEID_ICLOUD_MISMATCH_MESSAGE"), &stru_1E276D870, CFSTR("ChatKit"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "alertControllerWithTitle:message:preferredStyle:", v5, v7, 1);
  v18 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = objc_msgSend(v8, "isNameAndPhotoC3Enabled");

  if ((_DWORD)v4)
  {
    v9 = (void *)MEMORY[0x1E0CEA2E8];
    CKFrameworkBundle();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("NICKNAME_FEATURE_NOT_AVAILABLE_TITLE"), &stru_1E276D870, CFSTR("ChatKit"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    CKFrameworkBundle();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("NICKNAME_ICLOUD_NOT_SIGNED_IN_MESSAGE"), &stru_1E276D870, CFSTR("ChatKit"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "alertControllerWithTitle:message:preferredStyle:", v11, v13, 1);
    v14 = objc_claimAutoreleasedReturnValue();

    v18 = (id)v14;
  }
  CKFrameworkBundle();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_1E276D870, CFSTR("ChatKit"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKAlertAction actionWithTitle:style:handler:](CKAlertAction, "actionWithTitle:style:handler:", v16, 0, 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "addAction:", v17);

  -[CKConversationListCollectionViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v18, 1, 0);
}

- (void)showMultiplePhoneNumbersAlertForNicknames
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v3 = (void *)MEMORY[0x1E0CEA2E8];
  CKFrameworkBundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("NICKNAME_FEATURE_NOT_AVAILABLE_TITLE"), &stru_1E276D870, CFSTR("ChatKit"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  CKFrameworkBundle();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("NICKNAME_MULTIPLE_PHONE_NUMBERS_MESSAGE"), &stru_1E276D870, CFSTR("ChatKit"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "alertControllerWithTitle:message:preferredStyle:", v5, v7, 1);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  CKFrameworkBundle();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_1E276D870, CFSTR("ChatKit"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKAlertAction actionWithTitle:style:handler:](CKAlertAction, "actionWithTitle:style:handler:", v9, 0, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addAction:", v10);

  -[CKConversationListCollectionViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v11, 1, 0);
}

- (void)deleteButtonTappedForItemIdentifier:(id)a3 completionHandler:(id)a4 cellToUpdate:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  int v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[CKConversationListCollectionViewController conversationForItemIdentifier:](self, "conversationForItemIdentifier:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    -[CKConversationListCollectionViewController conversationList](self, "conversationList");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "pendingConversation");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = IMOSLoggingEnabled();
    if (v11 == v13)
    {
      if (v14)
      {
        OSLogHandleForIMFoundationCategory();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          v18 = 138412290;
          v19 = v8;
          _os_log_impl(&dword_18DFCD000, v17, OS_LOG_TYPE_INFO, "Delete action triggered for pending conversation with identifier: [%@].", (uint8_t *)&v18, 0xCu);
        }

      }
      -[CKConversationListCollectionViewController performDeletionForPendingConversationCell:completionHandler:](self, "performDeletionForPendingConversationCell:completionHandler:", v10, v9);
    }
    else
    {
      if (v14)
      {
        OSLogHandleForIMFoundationCategory();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          v18 = 138412290;
          v19 = v8;
          _os_log_impl(&dword_18DFCD000, v15, OS_LOG_TYPE_INFO, "Delete action triggered for active conversation with identifier: [%@].", (uint8_t *)&v18, 0xCu);
        }

      }
      -[CKConversationListCollectionViewController performDeletionForActiveConversation:itemIdentifier:completionHandler:cellToUpdate:](self, "performDeletionForActiveConversation:itemIdentifier:completionHandler:cellToUpdate:", v11, v8, v9, v10);
    }
  }
  else if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      v18 = 138412290;
      v19 = v8;
      _os_log_impl(&dword_18DFCD000, v16, OS_LOG_TYPE_INFO, "Tried to delete item identifier [%@] which does not exist.", (uint8_t *)&v18, 0xCu);
    }

  }
}

- (BOOL)_shouldSelectConversationAfterDeletingIndexPath:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  BOOL v17;

  v4 = a3;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "selectNewConversationOnDeletion");

  if (!v6)
    goto LABEL_7;
  -[CKConversationListCollectionViewController delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isCollapsed");

  if ((v8 & 1) != 0)
    goto LABEL_7;
  -[CKConversationListCollectionViewController dataSource](self, "dataSource");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "snapshot");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "itemIdentifiers");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "count");

  if (v12)
  {
    v13 = (void *)MEMORY[0x1E0C99E20];
    -[CKConversationListCollectionViewController collectionView](self, "collectionView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "indexPathsForSelectedItems");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setWithArray:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
      objc_msgSend(v16, "removeObject:", v4);
    v17 = objc_msgSend(v16, "count") == 0;

  }
  else
  {
LABEL_7:
    v17 = 0;
  }

  return v17;
}

- (void)performDeletionForActiveConversation:(id)a3 itemIdentifier:(id)a4 completionHandler:(id)a5 cellToUpdate:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  id v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  id v29;
  _QWORD v30[5];
  id v31;
  _QWORD v32[4];
  id v33;
  id v34;
  _QWORD aBlock[5];
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  uint8_t buf[4];
  id v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v29 = a4;
  v11 = a5;
  v12 = a6;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v42 = v10;
      _os_log_impl(&dword_18DFCD000, v13, OS_LOG_TYPE_INFO, "[Recently Deleted] Initiating deletion on conversation: %@", buf, 0xCu);
    }

  }
  -[CKConversationListCollectionViewController delegate](self, "delegate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "isCollapsed");

  -[CKConversationListCollectionViewController dataSource](self, "dataSource");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "indexPathForItemIdentifier:", v29);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  -[CKConversationListCollectionViewController updater](self, "updater");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "beginHoldingUpdatesForReason:", CFSTR("swipeToDelete"));

  v19 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __129__CKConversationListCollectionViewController_performDeletionForActiveConversation_itemIdentifier_completionHandler_cellToUpdate___block_invoke;
  aBlock[3] = &unk_1E2757C88;
  aBlock[4] = self;
  v20 = v10;
  v36 = v20;
  v21 = v17;
  v37 = v21;
  v22 = v12;
  v38 = v22;
  v32[0] = v19;
  v32[1] = 3221225472;
  v32[2] = __129__CKConversationListCollectionViewController_performDeletionForActiveConversation_itemIdentifier_completionHandler_cellToUpdate___block_invoke_3;
  v32[3] = &unk_1E27548B0;
  v23 = _Block_copy(aBlock);
  v33 = v23;
  v24 = v11;
  v34 = v24;
  v25 = _Block_copy(v32);
  v30[0] = v19;
  v30[1] = 3221225472;
  v30[2] = __129__CKConversationListCollectionViewController_performDeletionForActiveConversation_itemIdentifier_completionHandler_cellToUpdate___block_invoke_4;
  v30[3] = &unk_1E274C2E0;
  v30[4] = self;
  v26 = v24;
  v31 = v26;
  v27 = _Block_copy(v30);
  if (-[CKConversationListCollectionViewController filterMode](self, "filterMode") == 9)
  {
    v40 = v20;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v40, 1);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKConversationListCollectionViewController presentPermanentJunkConversationDeletionConfirmation:alertsCompletedBlock:cancelBlock:](self, "presentPermanentJunkConversationDeletionConfirmation:alertsCompletedBlock:cancelBlock:", v28, v25, v27);
  }
  else
  {
    v39 = v20;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v39, 1);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKConversationListCollectionViewController presentRecoverableDeleteConfirmationsWithConversations:collapsedAppearance:alertsCompletedBlock:cancelBlock:](self, "presentRecoverableDeleteConfirmationsWithConversations:collapsedAppearance:alertsCompletedBlock:cancelBlock:", v28, v15, v25, v27);
  }

}

void __129__CKConversationListCollectionViewController_performDeletionForActiveConversation_itemIdentifier_completionHandler_cellToUpdate___block_invoke(uint64_t a1, void *a2)
{
  void (**v3)(id, uint64_t);
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  _QWORD v24[5];
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "conversationList");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeConversation:", *(_QWORD *)(a1 + 40));

  v5 = *(void **)(a1 + 32);
  v28[0] = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_removeConversationsFromFrozenConversations:", v6);

  if (objc_msgSend(*(id *)(a1 + 40), "isPinned"))
    objc_msgSend(*(id *)(a1 + 32), "setHoldPinningUpdatesForConversationDeletion:", 1);
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v27, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "conversationListIsDeletingConversations:", v8);

  v9 = objc_msgSend(*(id *)(a1 + 32), "filterMode");
  objc_msgSend(*(id *)(a1 + 32), "conversationList");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9 == 9)
  {
    v26 = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v26, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "deleteConversations:", v11);
  }
  else
  {
    v25 = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v25, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __129__CKConversationListCollectionViewController_performDeletionForActiveConversation_itemIdentifier_completionHandler_cellToUpdate___block_invoke_2;
    v24[3] = &unk_1E274A208;
    v24[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v10, "recoverableDeleteForConversations:deleteDate:synchronousQuery:completionHandler:", v11, v12, 0, v24);

  }
  objc_msgSend(*(id *)(a1 + 32), "updateSnapshotAnimatingDifferences:", 1);
  objc_msgSend(*(id *)(a1 + 32), "updater");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "endAllHoldsOnUpdatesForReason:updateTriggeredIfNotHeldShouldBeDeferred:", CFSTR("swipeToDelete"), 1);

  objc_msgSend(*(id *)(a1 + 32), "conversationList");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "conversations");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "count");

  if (!v16)
    objc_msgSend(*(id *)(a1 + 32), "updateNavigationItems");
  if (objc_msgSend(*(id *)(a1 + 32), "_shouldSelectConversationAfterDeletingIndexPath:", *(_QWORD *)(a1 + 48)))
  {
    v17 = *(void **)(a1 + 32);
    if (*(_QWORD *)(a1 + 48))
      objc_msgSend(v17, "selectConversationClosestToDeletedIndex:");
    else
      objc_msgSend(v17, "selectDefaultConversationAnimated:", 1);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v18, "isCollapsed"))
    {
      objc_msgSend(*(id *)(a1 + 32), "collectionView");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "indexPathsForSelectedItems");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "count");

      if (v21)
        goto LABEL_16;
      objc_msgSend(*(id *)(a1 + 32), "delegate");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "updateForNoConversationSelected");
    }

  }
LABEL_16:
  objc_msgSend(*(id *)(a1 + 32), "leaveJunkFilterIfNeeded");
  if (objc_msgSend(*(id *)(a1 + 56), "conformsToProtocol:", &unk_1EE1AFDB8))
    objc_msgSend(*(id *)(a1 + 56), "updateContentsForConversation:", 0);
  objc_msgSend(*(id *)(a1 + 40), "deviceIndependentID");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  CKTextInputIdentifier(v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (v23)
    objc_msgSend(MEMORY[0x1E0CEA900], "clearTextInputContextIdentifier:", v23);
  if (v3)
    v3[2](v3, 1);

}

void __129__CKConversationListCollectionViewController_performDeletionForActiveConversation_itemIdentifier_completionHandler_cellToUpdate___block_invoke_2(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "conversationList");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "updateConversationListsAndSortIfEnabled");

}

uint64_t __129__CKConversationListCollectionViewController_performDeletionForActiveConversation_itemIdentifier_completionHandler_cellToUpdate___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

uint64_t __129__CKConversationListCollectionViewController_performDeletionForActiveConversation_itemIdentifier_completionHandler_cellToUpdate___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_cancelDeletion:", *(_QWORD *)(a1 + 40));
}

- (void)performDeletionForPendingConversationCell:(id)a3 completionHandler:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a4;
  -[CKConversationListCollectionViewController updater](self, "updater");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "beginHoldingUpdatesForReason:", CFSTR("swipeToDelete"));

  -[CKConversationListCollectionViewController delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "conversationListControllerTappedDeleteNewMessage:", self);

  -[CKConversationListCollectionViewController updater](self, "updater");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "endAllHoldsOnUpdatesForReason:updateTriggeredIfNotHeldShouldBeDeferred:", CFSTR("swipeToDelete"), 1);

  v8 = v9;
  if (v9)
  {
    (*((void (**)(id, uint64_t))v9 + 2))(v9, 1);
    v8 = v9;
  }

}

- (void)_cancelDeletion:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[CKConversationListCollectionViewController updater](self, "updater");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "endAllHoldsOnUpdatesForReason:updateTriggeredIfNotHeldShouldBeDeferred:", CFSTR("swipeToDelete"), 1);

  v5 = v6;
  if (v6)
  {
    (*((void (**)(id, _QWORD))v6 + 2))(v6, 0);
    v5 = v6;
  }

}

- (BOOL)_canShowSyncProgressFooter
{
  void *v3;
  int v4;
  void *v5;
  char v6;
  int v7;
  void *v8;
  int v9;

  objc_msgSend(MEMORY[0x1E0D397E8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "getBoolFromDomain:forKey:defaultValue:", *MEMORY[0x1E0D37950], CFSTR("cksync-always-show-progress"), 0);

  objc_msgSend(MEMORY[0x1E0D357C0], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEnabled");

  if ((v6 & 1) != 0 || (LOBYTE(v7) = 0, v4))
  {
    objc_msgSend(MEMORY[0x1E0D397E8], "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "getBoolFromDomain:forKey:defaultValue:", CFSTR("com.apple.MobileSMS"), CFSTR("MiCShowProgressFooter"), 1);

    if (!v9
      || -[CKConversationListCollectionViewController filterMode](self, "filterMode") == 7
      || -[CKConversationListCollectionViewController filterMode](self, "filterMode") == 9)
    {
      goto LABEL_8;
    }
    v7 = -[CKConversationListCollectionViewController isVisible](self, "isVisible");
    if (v7)
    {
      if (-[CKConversationListCollectionViewController isBelowMacSnapToMinWidth](self, "isBelowMacSnapToMinWidth"))
      {
LABEL_8:
        LOBYTE(v7) = 0;
        return v7;
      }
      LOBYTE(v7) = -[CKConversationListCollectionViewController isEditing](self, "isEditing") ^ 1;
    }
  }
  return v7;
}

- (void)_updateSyncStatusViewWithSyncState:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  NSObject *v9;
  void *v10;
  int v11;
  NSObject *v12;
  char v13;
  int v14;
  _BOOL4 v15;
  int v16;
  void *v17;
  int v18;
  NSObject *v19;
  const __CFString *v20;
  int v21;
  CKCloudSyncStatusView *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  _BOOL4 v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  int v41;
  NSObject *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  __CFString *v53;
  _QWORD v54[3];
  uint8_t buf[4];
  const __CFString *v56;
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "syncJobState");
  IMStringFromIMCloudKitSyncJobState();
  v53 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v56 = v53;
      _os_log_impl(&dword_18DFCD000, v5, OS_LOG_TYPE_INFO, "Updating sync footer for syncJobState = %@.", buf, 0xCu);
    }

  }
  if (-[CKConversationListCollectionViewController _canShowSyncProgressFooter](self, "_canShowSyncProgressFooter"))
  {
    -[CKConversationListCollectionViewController syncStatusView](self, "syncStatusView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      -[CKConversationListCollectionViewController syncStatusView](self, "syncStatusView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "isVisibleInViewHierarchy");

    }
    else
    {
      v8 = 0;
    }

    if (v4)
    {
      if (objc_msgSend(v4, "hasNotSyncedInLastSevenDays"))
      {
        if (objc_msgSend(v4, "accountStatus") == 2)
          v13 = 1;
        else
          v13 = objc_msgSend(v4, "accountNeedsRepair");
      }
      else
      {
        v13 = 0;
      }
      if (objc_msgSend(v4, "syncType") && objc_msgSend(v4, "syncType") != 1)
      {
        if (objc_msgSend(v4, "syncType") == 2)
          v14 = objc_msgSend(v4, "hasNotSyncedInLastSevenDays");
        else
          v14 = 0;
      }
      else
      {
        v14 = 1;
      }
      v15 = objc_msgSend(v4, "syncJobState") == 2
         || objc_msgSend(v4, "syncJobState") == 3
         || objc_msgSend(v4, "syncJobState") == 4
         || objc_msgSend(v4, "syncJobState") == 5;
      v16 = objc_msgSend(v4, "isBetweenInitialAndFullSync");
      objc_msgSend(MEMORY[0x1E0D397E8], "sharedInstance");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "getBoolFromDomain:forKey:defaultValue:", *MEMORY[0x1E0D37950], CFSTR("cksync-always-show-progress"), 0);

      if ((v13 & 1) != 0)
        v8 = 1;
      else
        v8 = v14 & v15 | v16 | v18;
    }
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        v20 = CFSTR("NO");
        if (v8)
          v20 = CFSTR("YES");
        *(_DWORD *)buf = 138412290;
        v56 = v20;
        _os_log_impl(&dword_18DFCD000, v19, OS_LOG_TYPE_INFO, "Sync Toolbar Needed? {%@}", buf, 0xCu);
      }

    }
    if (self->_syncStatusView)
      v21 = 0;
    else
      v21 = v8;
    if (v21 == 1)
    {
      v22 = objc_alloc_init(CKCloudSyncStatusView);
      -[CKCloudSyncStatusView setTranslatesAutoresizingMaskIntoConstraints:](v22, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      objc_storeStrong((id *)&self->_syncStatusView, v22);
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_18DFCD000, v23, OS_LOG_TYPE_INFO, "Lazily created CKCloudSyncStatusView.", buf, 2u);
        }

      }
    }
    if (v4)
      -[CKCloudSyncStatusView updateWithSyncState:](self->_syncStatusView, "updateWithSyncState:", v4);
    -[CKConversationListCollectionViewController syncStatusView](self, "syncStatusView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v24;
    if ((v8 & 1) != 0)
    {
      objc_msgSend(v24, "superview");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = v26 == 0;

      if (v27)
      {
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v28 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_18DFCD000, v28, OS_LOG_TYPE_INFO, "Sync footer is needed; adding Sync footer to view hierarchy.",
              buf,
              2u);
          }

        }
        -[CKConversationListCollectionViewController view](self, "view");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        -[CKConversationListCollectionViewController syncStatusView](self, "syncStatusView");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "addSubview:", v30);

        -[CKConversationListCollectionViewController view](self, "view");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        -[CKConversationListCollectionViewController syncStatusView](self, "syncStatusView");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "bringSubviewToFront:", v32);

        v44 = (void *)MEMORY[0x1E0CB3718];
        -[CKConversationListCollectionViewController syncStatusView](self, "syncStatusView");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v52, "leadingAnchor");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        -[CKConversationListCollectionViewController view](self, "view");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "leadingAnchor");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "constraintEqualToAnchor:", v49);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        v54[0] = v48;
        -[CKConversationListCollectionViewController syncStatusView](self, "syncStatusView");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "trailingAnchor");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        -[CKConversationListCollectionViewController view](self, "view");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "trailingAnchor");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "constraintEqualToAnchor:", v33);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v54[1] = v34;
        -[CKConversationListCollectionViewController syncStatusView](self, "syncStatusView");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "bottomAnchor");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        -[CKConversationListCollectionViewController view](self, "view");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "bottomAnchor");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "constraintEqualToAnchor:", v38);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v54[2] = v39;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v54, 3);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "activateConstraints:", v40);

        -[CKConversationListCollectionViewController _updateInsets](self, "_updateInsets");
      }
      goto LABEL_65;
    }
    v41 = objc_msgSend(v24, "isVisibleInViewHierarchy");

    if (!v41)
      goto LABEL_65;
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v42 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18DFCD000, v42, OS_LOG_TYPE_INFO, "Removing Sync footer from view hierarchy as it's no longer needed.", buf, 2u);
      }

    }
LABEL_64:
    -[CKConversationListCollectionViewController syncStatusView](self, "syncStatusView");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "removeFromSuperview");

    -[CKConversationListCollectionViewController setSyncStatusView:](self, "setSyncStatusView:", 0);
    -[CKConversationListCollectionViewController _updateInsets](self, "_updateInsets");
    goto LABEL_65;
  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18DFCD000, v9, OS_LOG_TYPE_INFO, "Cloud Sync footer cannot be shown.", buf, 2u);
    }

  }
  -[CKConversationListCollectionViewController syncStatusView](self, "syncStatusView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isVisibleInViewHierarchy");

  if (v11)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18DFCD000, v12, OS_LOG_TYPE_INFO, "Removing Sync footer from view hierarchy.", buf, 2u);
      }

    }
    goto LABEL_64;
  }
LABEL_65:

}

- (void)registerForCloudKitEventsImmediately
{
  -[CKConversationListCollectionViewController registerForCloudKitEventsWithDelayedRegistration:](self, "registerForCloudKitEventsWithDelayedRegistration:", 0);
}

void __95__CKConversationListCollectionViewController_registerForCloudKitEventsWithDelayedRegistration___block_invoke_641(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  void *v3;
  void *v4;
  uint8_t v5[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v2 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v5 = 0;
        _os_log_impl(&dword_18DFCD000, v2, OS_LOG_TYPE_INFO, "registered for cloud kit events", v5, 2u);
      }

    }
    objc_msgSend(MEMORY[0x1E0D357B8], "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addEventHandler:", WeakRetained);

    objc_msgSend(MEMORY[0x1E0D357B8], "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "fetchSyncState");

  }
}

- (void)unregisterForCloudKitEvents
{
  void *v3;
  char v4;
  NSObject *v5;
  void *v6;
  uint8_t v7[16];

  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isMessagesIniCloudVersion2");

  if ((v4 & 1) == 0)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v7 = 0;
        _os_log_impl(&dword_18DFCD000, v5, OS_LOG_TYPE_INFO, "unregistered for cloudkit events", v7, 2u);
      }

    }
    objc_msgSend(MEMORY[0x1E0D357B8], "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeEventHandler:", self);

  }
}

- (void)cloudKitEventNotificationManager:(id)a3 syncStateDidChange:(id)a4
{
  -[CKConversationListCollectionViewController _updateSyncStatusViewWithSyncState:](self, "_updateSyncStatusViewWithSyncState:", a4);
}

- (BOOL)_isRunningPPT
{
  return __CurrentTestName != 0;
}

- (id)_itemIdentifierOfDefaultConversation
{
  id WeakRetained;
  void *v4;
  __CFString *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  void *v27;
  void *v28;
  __CFString *v29;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint8_t buf[8];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "currentConversation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 && (objc_msgSend(v4, "isPending") & 1) == 0)
  {
    if (objc_msgSend(v4, "isPinned"))
      v6 = 2;
    else
      v6 = 5;
    -[CKConversationListCollectionViewController itemIdentifierForConversation:inSection:](self, "itemIdentifierForConversation:inSection:", v4, v6);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = &stru_1E276D870;
  }
  if (!-[__CFString length](v5, "length"))
  {
    -[CKConversationListCollectionViewController dataSource](self, "dataSource");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "snapshot");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "indexOfSectionIdentifier:", &unk_1E2870B28);

    if (v9 == 0x7FFFFFFFFFFFFFFFLL)
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_18DFCD000, v10, OS_LOG_TYPE_INFO, "Unable to find new conversation section in current snapshot", buf, 2u);
        }

      }
    }
    else
    {
      -[CKConversationListCollectionViewController dataSource](self, "dataSource");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "snapshot");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "itemIdentifiersInSectionWithIdentifier:", &unk_1E2870B28);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "firstObject");
      v14 = objc_claimAutoreleasedReturnValue();

      v5 = (__CFString *)v14;
    }
  }
  if (!-[__CFString length](v5, "length"))
  {
    -[CKConversationListCollectionViewController dataSource](self, "dataSource");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "snapshot");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "indexOfSectionIdentifier:", &unk_1E2870B10);

    if (v17 == 0x7FFFFFFFFFFFFFFFLL)
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_18DFCD000, v18, OS_LOG_TYPE_INFO, "Unable to find active conversation section in current snapshot", buf, 2u);
        }

      }
    }
    else
    {
      -[CKConversationListCollectionViewController dataSource](self, "dataSource");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "snapshot");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "itemIdentifiersInSectionWithIdentifier:", &unk_1E2870B10);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      v33 = 0u;
      v34 = 0u;
      v31 = 0u;
      v32 = 0u;
      v22 = v21;
      v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
      if (v23)
      {
        v24 = *(_QWORD *)v32;
        while (2)
        {
          for (i = 0; i != v23; ++i)
          {
            if (*(_QWORD *)v32 != v24)
              objc_enumerationMutation(v22);
            v26 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
            -[CKConversationListCollectionViewController conversationForItemIdentifier:](self, "conversationForItemIdentifier:", v26, (_QWORD)v31);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v28 = v27;
            if (v27 && (objc_msgSend(v27, "hasUnreadMessages") & 1) == 0)
            {
              v29 = v26;

              v5 = v29;
              goto LABEL_32;
            }

          }
          v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
          if (v23)
            continue;
          break;
        }
      }
LABEL_32:

    }
  }

  return v5;
}

- (id)_indexPathOfDefaultConversation
{
  void *v3;
  void *v4;
  void *v5;

  -[CKConversationListCollectionViewController _itemIdentifierOfDefaultConversation](self, "_itemIdentifierOfDefaultConversation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "length"))
  {
    -[CKConversationListCollectionViewController dataSource](self, "dataSource");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "indexPathForItemIdentifier:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)_selectConversationAtIndexPath:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  NSObject *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id WeakRetained;
  int v15;
  id v16;
  __int16 v17;
  const __CFString *v18;
  uint64_t v19;

  v4 = a4;
  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = CFSTR("NO");
      if (v4)
        v8 = CFSTR("YES");
      v15 = 138412546;
      v16 = v6;
      v17 = 2112;
      v18 = v8;
      _os_log_impl(&dword_18DFCD000, v7, OS_LOG_TYPE_INFO, "Selecting conversation at indexPath: %@  animated:%@", (uint8_t *)&v15, 0x16u);
    }

  }
  -[CKConversationListCollectionViewController setEditingMode:animated:](self, "setEditingMode:animated:", 0, CKIsRunningInMacCatalyst() == 0);
  -[CKConversationListCollectionViewController collectionView](self, "collectionView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v6)
  {
    -[CKConversationListCollectionViewController collectionView](self, "collectionView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKConversationListCollectionViewController _deselectSelectedIndexPathsInCollectionView:animated:](self, "_deselectSelectedIndexPathsInCollectionView:animated:", v11, v4);

    objc_msgSend(v10, "selectItemAtIndexPath:animated:scrollPosition:", v6, v4, 0);
    objc_msgSend(v10, "scrollToItemAtIndexPath:atScrollPosition:animated:", v6, 0, v4);
    -[CKConversationListCollectionViewController _performTranscriptPushForItemAtIndexPath:userInitiated:](self, "_performTranscriptPushForItemAtIndexPath:userInitiated:", v6, 0);
  }
  else
  {
    objc_msgSend(v9, "indexPathsForSelectedItems");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "firstObject");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "deselectItemAtIndexPath:animated:", v13, v4);

    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "showConversation:animate:", 0, v4);

  }
}

- (void)deleteSelectedConversation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  -[CKConversationListCollectionViewController collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "indexPathsForSelectedItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[CKConversationListCollectionViewController collectionView](self, "collectionView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "indexPathsForSelectedItems");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectAtIndex:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v13 = 138412290;
      v14 = v7;
      _os_log_impl(&dword_18DFCD000, v8, OS_LOG_TYPE_INFO, "Deleting selected conversation (index path %@)", (uint8_t *)&v13, 0xCu);
    }

  }
  if (v7)
  {
    -[CKConversationListCollectionViewController collectionView](self, "collectionView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "cellForItemAtIndexPath:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[CKConversationListCollectionViewController dataSource](self, "dataSource");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "itemIdentifierForIndexPath:", v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    -[CKConversationListCollectionViewController deleteButtonTappedForItemIdentifier:completionHandler:cellToUpdate:](self, "deleteButtonTappedForItemIdentifier:completionHandler:cellToUpdate:", v12, 0, v10);
  }

}

- (void)removePendingConversationCell
{
  -[CKConversationListCollectionViewController updateSnapshotAnimatingDifferences:](self, "updateSnapshotAnimatingDifferences:", 0);
}

- (void)selectDefaultConversationAnimated:(BOOL)a3 removingPendingConversationCell:(BOOL)a4
{
  _BOOL8 v4;

  v4 = a3;
  if (a4)
    -[CKConversationListCollectionViewController removePendingConversationCell](self, "removePendingConversationCell");
  -[CKConversationListCollectionViewController selectDefaultConversationAnimated:shouldUsePreviousySelectedIndexPath:](self, "selectDefaultConversationAnimated:shouldUsePreviousySelectedIndexPath:", v4, 0);
}

- (void)selectDefaultConversationAnimated:(BOOL)a3 shouldUsePreviousySelectedIndexPath:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL8 v5;
  NSObject *v7;
  const __CFString *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  int v17;
  const __CFString *v18;
  uint64_t v19;

  v4 = a4;
  v5 = a3;
  v19 = *MEMORY[0x1E0C80C00];
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = CFSTR("NO");
      if (v5)
        v8 = CFSTR("YES");
      v17 = 138412290;
      v18 = v8;
      _os_log_impl(&dword_18DFCD000, v7, OS_LOG_TYPE_INFO, "Selecting default conversation, animated:%@", (uint8_t *)&v17, 0xCu);
    }

  }
  -[CKConversationListCollectionViewController _indexPathOfDefaultConversation](self, "_indexPathOfDefaultConversation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = CKIsRunningInMacCatalyst();
  if (v4 && v10)
  {
    -[CKConversationListCollectionViewController lastSelectedConversationItemIdentifier](self, "lastSelectedConversationItemIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v11, "length"))
    {
      objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectForKey:inDomain:", CFSTR("CKLastSelectedItemIdentifier"), CFSTR("com.apple.MobileSMS"));
      v13 = objc_claimAutoreleasedReturnValue();

      v11 = (void *)v13;
    }
    -[CKConversationListCollectionViewController dataSource](self, "dataSource");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "indexPathForItemIdentifier:", v11);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      v16 = v15;

      v9 = v16;
    }

  }
  -[CKConversationListCollectionViewController _selectConversationAtIndexPath:animated:](self, "_selectConversationAtIndexPath:animated:", v9, v5);

}

- (void)selectDefaultConversationAnimated:(BOOL)a3
{
  -[CKConversationListCollectionViewController selectDefaultConversationAnimated:shouldUsePreviousySelectedIndexPath:](self, "selectDefaultConversationAnimated:shouldUsePreviousySelectedIndexPath:", a3, 1);
}

- (void)selectNextSequentialConversation:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  _BOOL4 v11;
  CKConversationListControllerDelegate **p_delegate;
  id WeakRetained;
  char v14;
  id v15;
  id v16;

  v3 = a3;
  -[CKConversationListCollectionViewController collectionView](self, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "indexPathsForSelectedItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v16 = (id)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    -[CKConversationListCollectionViewController nextSequentialIndexPathForIndexPath:descending:](self, "nextSequentialIndexPathForIndexPath:descending:", v16, v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      -[CKConversationListCollectionViewController _selectConversationAtIndexPath:animated:](self, "_selectConversationAtIndexPath:animated:", v7, 0);
    }
    else if (!v3)
    {
      +[CKConversationList sharedConversationList](CKConversationList, "sharedConversationList");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "pendingConversation");
      v9 = objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        v10 = (void *)v9;
        v11 = -[CKConversationListCollectionViewController shouldShowPendingCell](self, "shouldShowPendingCell");

        if (v11)
        {
          -[CKConversationListCollectionViewController setEditingMode:animated:](self, "setEditingMode:animated:", 0, 0);
          p_delegate = &self->_delegate;
          WeakRetained = objc_loadWeakRetained((id *)p_delegate);
          v14 = objc_msgSend(WeakRetained, "isComposingMessage");

          if ((v14 & 1) == 0)
          {
            v15 = objc_loadWeakRetained((id *)p_delegate);
            objc_msgSend(v15, "showNewMessageCompositionPanelWithRecipients:composition:animated:", 0, 0, 1);

          }
        }
      }
      else
      {

      }
    }

  }
  else
  {
    -[CKConversationListCollectionViewController selectDefaultConversationAnimated:](self, "selectDefaultConversationAnimated:");
  }

}

- (void)selectPinnedConversationForItem:(int64_t)a3
{
  void *v5;
  void *v6;
  unint64_t v7;
  id v8;

  if (!-[CKConversationListCollectionViewController hasActivePinnedConversationDropSession](self, "hasActivePinnedConversationDropSession"))
  {
    -[CKConversationListCollectionViewController dataSource](self, "dataSource");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "snapshot");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "numberOfItemsInSection:", &unk_1E2870AF8);

    NSLog(CFSTR("numerOfChats: %ld, chatNumber: %ld"), v7, a3);
    if (v7 >= a3)
    {
      objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", a3 - 1, 2);
      v8 = (id)objc_claimAutoreleasedReturnValue();
      -[CKConversationListCollectionViewController _selectConversationAtIndexPath:animated:](self, "_selectConversationAtIndexPath:animated:", v8, 1);

    }
  }
}

- (void)selectFirstActiveConversation
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", 0, 5);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[CKConversationListCollectionViewController _selectConversationAtIndexPath:animated:](self, "_selectConversationAtIndexPath:animated:", v3, 1);

}

- (void)selectConversationClosestToDeletedIndex:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v7 = 134217984;
      v8 = MEMORY[0x1E0C83948];
      _os_log_impl(&dword_18DFCD000, v5, OS_LOG_TYPE_INFO, "Selecting conversation closest to deleted index: %lu", (uint8_t *)&v7, 0xCu);
    }

  }
  -[CKConversationListCollectionViewController nextSequentialIndexPathForIndexPath:descending:](self, "nextSequentialIndexPathForIndexPath:descending:", v4, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6
    || (-[CKConversationListCollectionViewController nextSequentialIndexPathForIndexPath:descending:](self, "nextSequentialIndexPathForIndexPath:descending:", v4, 1), (v6 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    -[CKConversationListCollectionViewController _selectConversationAtIndexPath:animated:](self, "_selectConversationAtIndexPath:animated:", v6, 1);

  }
  else
  {
    -[CKConversationListCollectionViewController selectDefaultConversationAnimated:](self, "selectDefaultConversationAnimated:", 1);
  }

}

- (void)updateConversationSelection
{
  if (-[CKConversationListCollectionViewController _shouldKeepSelection](self, "_shouldKeepSelection"))
    -[CKConversationListCollectionViewController updateConversationSelectionPreservingLastSelectedItemIdentifier](self, "updateConversationSelectionPreservingLastSelectedItemIdentifier");
  else
    -[CKConversationListCollectionViewController setLastSelectedConversationItemIdentifier:](self, "setLastSelectedConversationItemIdentifier:", 0);
}

- (void)updateConversationSelectionToNewCompose
{
  void *v3;
  char v4;
  int v5;
  NSObject *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  _BOOL4 v16;
  int v17;
  NSObject *v18;
  void *v19;
  NSObject *v20;
  int v21;
  NSObject *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (-[CKConversationListCollectionViewController _shouldUpdateConversationSelection](self, "_shouldUpdateConversationSelection"))
  {
    if (-[CKConversationListCollectionViewController shouldShowPendingCell](self, "shouldShowPendingCell"))
    {
      -[CKConversationListCollectionViewController delegate](self, "delegate");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = objc_msgSend(v3, "isShowingComposeChatController");

      v5 = IMOSLoggingEnabled();
      if ((v4 & 1) != 0)
      {
        if (v5)
        {
          OSLogHandleForIMFoundationCategory();
          v6 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
          {
            LOWORD(v21) = 0;
            _os_log_impl(&dword_18DFCD000, v6, OS_LOG_TYPE_INFO, "multi-select: updating selection to new compose cell", (uint8_t *)&v21, 2u);
          }

        }
        -[CKConversationListCollectionViewController dataSource](self, "dataSource");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        +[CKConversationListNewMessageCollectionViewCell reuseIdentifier](CKConversationListNewMessageCollectionViewCell, "reuseIdentifier");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "indexPathForItemIdentifier:", v8);
        v9 = objc_claimAutoreleasedReturnValue();

        if (v9)
        {
          -[CKConversationListCollectionViewController collectionView](self, "collectionView");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "indexPathsForSelectedItems");
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          if ((objc_msgSend(v11, "containsObject:", v9) & 1) == 0)
          {
            -[CKConversationListCollectionViewController collectionView](self, "collectionView");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            -[CKConversationListCollectionViewController _deselectSelectedIndexPathsInCollectionView:animated:](self, "_deselectSelectedIndexPathsInCollectionView:animated:", v12, 0);

            -[CKConversationListCollectionViewController collectionView](self, "collectionView");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "selectItemAtIndexPath:animated:scrollPosition:", v9, 0, 0);

          }
          +[CKConversationListNewMessageCollectionViewCell reuseIdentifier](CKConversationListNewMessageCollectionViewCell, "reuseIdentifier");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          -[CKConversationListCollectionViewController setLastSelectedConversationItemIdentifier:](self, "setLastSelectedConversationItemIdentifier:", v14);

          if (IMOSLoggingEnabled())
          {
            OSLogHandleForIMFoundationCategory();
            v15 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
            {
              v21 = 138412290;
              v22 = v9;
              _os_log_impl(&dword_18DFCD000, v15, OS_LOG_TYPE_INFO, "multi-select: selected new compose indexPath: %@", (uint8_t *)&v21, 0xCu);
            }

          }
        }
        else
        {
          v16 = -[CKConversationListCollectionViewController shouldShowPendingCell](self, "shouldShowPendingCell");
          v17 = IMOSLoggingEnabled();
          if (v16)
          {
            if (v17)
            {
              OSLogHandleForIMFoundationCategory();
              v18 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
              {
                LOWORD(v21) = 0;
                _os_log_impl(&dword_18DFCD000, v18, OS_LOG_TYPE_INFO, "multi-select: snapshot does not contain compose cell. Updating conversation list", (uint8_t *)&v21, 2u);
              }

            }
            -[CKConversationListCollectionViewController updater](self, "updater");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "setNeedsDeferredUpdateWithReason:", CFSTR("showingNewCompose"));

          }
          else if (v17)
          {
            OSLogHandleForIMFoundationCategory();
            v20 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
            {
              LOWORD(v21) = 0;
              _os_log_impl(&dword_18DFCD000, v20, OS_LOG_TYPE_INFO, "multi-select: new compose cell is not shown for current state. Bailing to preserve current selection and to prevent recursive loop", (uint8_t *)&v21, 2u);
            }

          }
        }
      }
      else
      {
        if (!v5)
          return;
        OSLogHandleForIMFoundationCategory();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          LOWORD(v21) = 0;
          _os_log_impl(&dword_18DFCD000, v9, OS_LOG_TYPE_INFO, "multi-select: Not showing compose chatController. Bailing to preserve current selection", (uint8_t *)&v21, 2u);
        }
      }
    }
    else
    {
      if (!IMOSLoggingEnabled())
        return;
      OSLogHandleForIMFoundationCategory();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        LOWORD(v21) = 0;
        _os_log_impl(&dword_18DFCD000, v9, OS_LOG_TYPE_INFO, "multi-select: new compose cell is not shown for current state. Bailing to preserve current selection", (uint8_t *)&v21, 2u);
      }
    }
  }
  else
  {
    if (!IMOSLoggingEnabled())
      return;
    OSLogHandleForIMFoundationCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      LOWORD(v21) = 0;
      _os_log_impl(&dword_18DFCD000, v9, OS_LOG_TYPE_INFO, "multi-select: did not update selection to new compose cell - selection not allowed", (uint8_t *)&v21, 2u);
    }
  }

}

- (int64_t)_alertControllerStyle
{
  void *v3;
  int64_t v4;

  -[CKConversationListCollectionViewController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[CKConversationListCollectionViewController _alertControllerStyleForCollapsedState:](self, "_alertControllerStyleForCollapsedState:", objc_msgSend(v3, "isCollapsed"));

  return v4;
}

- (int64_t)_alertControllerStyleForCollapsedState:(BOOL)a3
{
  return !a3;
}

- (void)prepareForSuspend
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  char isKindOfClass;
  void *v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _QWORD v26[4];

  v26[3] = *MEMORY[0x1E0C80C00];
  if (!CKIsRunningInMacCatalyst())
  {
    -[CKConversationListCollectionViewController searchController](self, "searchController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isActive");

    if (v4)
    {
      -[CKConversationListCollectionViewController searchController](self, "searchController");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setActive:", 0);

    }
    -[CKConversationListCollectionViewController searchResultsController](self, "searchResultsController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "cancelCurrentQuery");

    +[CKPluginExtensionStateObserver sharedInstance](CKPluginExtensionStateObserver, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "passKitUIPresented");

    if ((v8 & 1) == 0)
    {
      v26[0] = CFSTR("swipeToDelete");
      v26[1] = CFSTR("markAsRead");
      v26[2] = CFSTR("chatItemChangeSuppression");
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 3);
      v21 = 0u;
      v22 = 0u;
      v23 = 0u;
      v24 = 0u;
      v9 = (id)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v22;
        do
        {
          v13 = 0;
          do
          {
            if (*(_QWORD *)v22 != v12)
              objc_enumerationMutation(v9);
            v14 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v13);
            -[CKConversationListCollectionViewController updater](self, "updater", (_QWORD)v21);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "endAllHoldsOnUpdatesForReason:updateTriggeredIfNotHeldShouldBeDeferred:", v14, 1);

            ++v13;
          }
          while (v11 != v13);
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
        }
        while (v11);
      }

    }
    +[CKAdaptivePresentationController sharedInstance](CKAdaptivePresentationController, "sharedInstance", (_QWORD)v21);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "presentedViewController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
    {
      +[CKAdaptivePresentationController sharedInstance](CKAdaptivePresentationController, "sharedInstance");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "dismissViewControllerAnimated:completion:", 1, 0);

      +[CKAdaptivePresentationController sharedInstance](CKAdaptivePresentationController, "sharedInstance");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "dismissViewControllerAnimated:completion:", 1, 0);

    }
  }
}

- (void)_presentSatelliteConnectionBannerIfNecessaryWithConversation:(id)a3 withReason:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  _QWORD *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  id v20;
  void *v21;
  CoreTelephonyClient *coreTelephonyClient;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v26[5];
  _QWORD v27[2];
  _QWORD v28[2];
  uint8_t buf[4];
  uint64_t v30;
  __int16 v31;
  uint64_t v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isCarrierPigeonEnabled");

  if (v9 && (!v6 || objc_msgSend(v6, "isSatelliteMessagingCompatible")))
  {
    objc_msgSend(MEMORY[0x1E0D34E78], "sharedInstanceForBagType:", 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKey:", CFSTR("when-to-first-show-OTG-banner"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKey:", CFSTR("how-often-to-show-OTG-banner"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKey:", CFSTR("when-to-stop-showing-OTG-banner"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99EA0], "messagesAppDomain");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (_QWORD *)MEMORY[0x1E0D38C08];
    v13 = objc_msgSend(v11, "integerForKey:", *MEMORY[0x1E0D38C08]);

    objc_msgSend(MEMORY[0x1E0C99EA0], "messagesAppDomain");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "integerForKey:", *MEMORY[0x1E0D39448]);

    objc_msgSend(MEMORY[0x1E0D357A0], "sharedInstance");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "getState");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v17, "allowedServices") & 0x3D) != 0)
    {
      objc_msgSend(MEMORY[0x1E0C99EA0], "messagesAppDomain");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setInteger:forKey:", v13 + 1, *v12);

      if (objc_msgSend(v25, "integerValue") >= 1 && v15 >= objc_msgSend(v25, "integerValue"))
      {
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 134218240;
            v30 = objc_msgSend(v25, "integerValue");
            v31 = 2048;
            v32 = v15;
            _os_log_impl(&dword_18DFCD000, v19, OS_LOG_TYPE_INFO, "Not showing satellite connection banner. Limit has been reached. Limit: %ld, number of times shown: %ld", buf, 0x16u);
          }
          goto LABEL_21;
        }
      }
      else if (objc_msgSend(v24, "integerValue") && v13 % objc_msgSend(v24, "integerValue"))
      {
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 134218240;
            v30 = objc_msgSend(v24, "integerValue");
            v31 = 2048;
            v32 = v15;
            _os_log_impl(&dword_18DFCD000, v19, OS_LOG_TYPE_INFO, "Not showing satellite connection banner. Only showing banner on every %ld attempt. number of times attempted: %ld", buf, 0x16u);
          }
LABEL_21:

        }
      }
      else
      {
        if (objc_msgSend(v23, "integerValue") - 1 <= v13)
        {
          v20 = objc_alloc_init(MEMORY[0x1E0CA6E08]);
          objc_msgSend(v20, "setReason:", 8);
          v27[0] = CFSTR("offer");
          v27[1] = CFSTR("offerReason");
          v28[0] = MEMORY[0x1E0C9AAB0];
          v28[1] = v7;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, v27, 2);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "setMetadata:", v21);

          coreTelephonyClient = self->_coreTelephonyClient;
          v26[0] = MEMORY[0x1E0C809B0];
          v26[1] = 3221225472;
          v26[2] = __118__CKConversationListCollectionViewController__presentSatelliteConnectionBannerIfNecessaryWithConversation_withReason___block_invoke;
          v26[3] = &__block_descriptor_40_e17_v16__0__NSError_8l;
          v26[4] = v15;
          -[CoreTelephonyClient requestStewieWithContext:completion:](coreTelephonyClient, "requestStewieWithContext:completion:", v20, v26);

          goto LABEL_23;
        }
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 134218240;
            v30 = objc_msgSend(v23, "integerValue");
            v31 = 2048;
            v32 = v13;
            _os_log_impl(&dword_18DFCD000, v19, OS_LOG_TYPE_INFO, "Not showing satellite connection banner. Only showing banner on after %ld attempts. Number of attempts: %ld", buf, 0x16u);
          }
          goto LABEL_21;
        }
      }
    }
LABEL_23:

  }
}

void __118__CKConversationListCollectionViewController__presentSatelliteConnectionBannerIfNecessaryWithConversation_withReason___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint8_t v6[16];

  v3 = a2;
  if (v3)
  {
    IMLogHandleForCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __118__CKConversationListCollectionViewController__presentSatelliteConnectionBannerIfNecessaryWithConversation_withReason___block_invoke_cold_1(v3, v4);
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v6 = 0;
        _os_log_impl(&dword_18DFCD000, v5, OS_LOG_TYPE_INFO, "Presenting satellite connection banner", v6, 2u);
      }

    }
    objc_msgSend(MEMORY[0x1E0C99EA0], "messagesAppDomain");
    v4 = objc_claimAutoreleasedReturnValue();
    -[NSObject setInteger:forKey:](v4, "setInteger:forKey:", *(_QWORD *)(a1 + 32) + 1, *MEMORY[0x1E0D39448]);
  }

}

- (void)_conversationListPinnedConversationsDidChange:(id)a3
{
  void *v4;
  _BOOL8 v5;
  id v6;

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("previousPinnedConversationIdentifiers"));
  v6 = (id)objc_claimAutoreleasedReturnValue();

  -[CKConversationListCollectionViewController _submitFeedbackIfNecessaryForPinsChangedWithPreviousPinnedConversationIdentifiers:](self, "_submitFeedbackIfNecessaryForPinsChangedWithPreviousPinnedConversationIdentifiers:", v6);
  if (-[CKConversationListCollectionViewController holdPinningUpdatesForConversationDeletion](self, "holdPinningUpdatesForConversationDeletion"))
  {
    -[CKConversationListCollectionViewController setHoldPinningUpdatesForConversationDeletion:](self, "setHoldPinningUpdatesForConversationDeletion:", 0);
  }
  else
  {
    if (-[CKConversationListCollectionViewController nextPinnedConversationListUpdateShouldTriggerUnanimatedSnapshotUpdate](self, "nextPinnedConversationListUpdateShouldTriggerUnanimatedSnapshotUpdate"))
    {
      v5 = -[CKConversationListCollectionViewController isShowingPinningOnboarding](self, "isShowingPinningOnboarding");
    }
    else
    {
      v5 = 1;
    }
    -[CKConversationListCollectionViewController setNextPinnedConversationListUpdateShouldTriggerUnanimatedSnapshotUpdate:](self, "setNextPinnedConversationListUpdateShouldTriggerUnanimatedSnapshotUpdate:", 0);
    -[CKConversationListCollectionViewController updateSnapshotAnimatingDifferences:](self, "updateSnapshotAnimatingDifferences:", v5);
    -[CKConversationListCollectionViewController updateContentsOfAllCellsAnimated:](self, "updateContentsOfAllCellsAnimated:", v5);
    -[CKConversationListCollectionViewController _updateLargeTitleDisplayModeWithAnimation:](self, "_updateLargeTitleDisplayModeWithAnimation:", v5);
    -[CKConversationListTipManager userDidPinConversation](self->_tipManager, "userDidPinConversation");
  }

}

- (void)setHasActivePinnedConversationDropSession:(BOOL)a3
{
  if (self->_hasActivePinnedConversationDropSession != a3)
  {
    self->_hasActivePinnedConversationDropSession = a3;
    -[CKConversationListCollectionViewController setEditButtonItem:](self, "setEditButtonItem:", 0);
    -[CKConversationListCollectionViewController setOptionsButtonItem:](self, "setOptionsButtonItem:", 0);
    -[CKConversationListCollectionViewController updateNavigationItems](self, "updateNavigationItems");
    -[CKConversationListCollectionViewController updateContentsOfAllCellsAnimated:](self, "updateContentsOfAllCellsAnimated:", 1);
  }
}

- (void)setIsShowingPinningOnboarding:(BOOL)a3
{
  void *v5;
  id v6;

  if (self->_isShowingPinningOnboarding != a3)
    self->_isShowingPinningOnboarding = a3;
  if (a3)
  {
    v6 = 0;
  }
  else
  {
    -[CKConversationListCollectionViewController searchController](self, "searchController");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  -[CKConversationListCollectionViewController navigationItem](self, "navigationItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSearchController:", v6);

  if (!a3)
}

- (void)_satelliteMonitorStarted
{
  void *v3;
  char v4;

  objc_msgSend(MEMORY[0x1E0D357A0], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isStewieActive");

  if ((v4 & 1) == 0)
    -[CKConversationListCollectionViewController _presentSatelliteConnectionBannerIfNecessaryWithConversation:withReason:](self, "_presentSatelliteConnectionBannerIfNecessaryWithConversation:withReason:", 0, CFSTR("AppOpen"));
}

- (void)_updateRefreshControlVisibility
{
  void *v3;
  int v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isCarrierPigeonEnabled");

  if (v4)
  {
    if (-[CKConversationListCollectionViewController filterMode](self, "filterMode") == 7)
      goto LABEL_6;
    objc_msgSend(MEMORY[0x1E0D357A0], "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isSatelliteConnectionActive");

    if ((v6 & 1) == 0)
      goto LABEL_6;
    objc_msgSend(MEMORY[0x1E0D357A0], "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v7, "isStewieActive") & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0D357A0], "sharedInstance");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "isMessagingActiveOverSatellite");

      if ((v9 & 1) == 0)
      {
LABEL_6:
        -[CKConversationListCollectionViewController _removeRefreshControl](self, "_removeRefreshControl");
        return;
      }
    }
    else
    {

    }
    -[CKConversationListCollectionViewController collectionViewRefreshControl](self, "collectionViewRefreshControl");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
    {
      v11 = objc_alloc_init(MEMORY[0x1E0CEA8F8]);
      -[CKConversationListCollectionViewController setCollectionViewRefreshControl:](self, "setCollectionViewRefreshControl:", v11);

    }
    -[CKConversationListCollectionViewController collectionViewRefreshControl](self, "collectionViewRefreshControl");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addTarget:action:forControlEvents:", self, sel__didPullToRefresh_, 4096);

    -[CKConversationListCollectionViewController collectionView](self, "collectionView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKConversationListCollectionViewController collectionViewRefreshControl](self, "collectionViewRefreshControl");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setRefreshControl:", v14);

    -[CKConversationListCollectionViewController collectionViewRefreshControl](self, "collectionViewRefreshControl");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "beginRefreshing");

    -[CKConversationListCollectionViewController navigationController](self, "navigationController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "_scrollToRevealNavigationBarPart:animated:", 8, 1);

    -[CKConversationListCollectionViewController _startRefreshControlTimer](self, "_startRefreshControlTimer");
  }
}

- (void)_pendingSatelliteCountChanged
{
  void *v3;

  -[CKConversationListCollectionViewController collectionViewRefreshControl](self, "collectionViewRefreshControl");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "endRefreshing");

  -[CKConversationListCollectionViewController updateContentsOfAllCellsAnimated:](self, "updateContentsOfAllCellsAnimated:", 1);
}

- (void)_isDownloadingPendingSatelliteMessagesChanged
{
  -[CKConversationListCollectionViewController updateContentsOfAllCellsAnimated:](self, "updateContentsOfAllCellsAnimated:", 1);
}

- (void)_removeRefreshControl
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[CKConversationListCollectionViewController refreshControlTimer](self, "refreshControlTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[CKConversationListCollectionViewController refreshControlTimer](self, "refreshControlTimer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "invalidate");

    -[CKConversationListCollectionViewController setRefreshControlTimer:](self, "setRefreshControlTimer:", 0);
  }
  -[CKConversationListCollectionViewController collectionViewRefreshControl](self, "collectionViewRefreshControl");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[CKConversationListCollectionViewController collectionViewRefreshControl](self, "collectionViewRefreshControl");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "endRefreshing");

    -[CKConversationListCollectionViewController setCollectionViewRefreshControl:](self, "setCollectionViewRefreshControl:", 0);
    -[CKConversationListCollectionViewController collectionView](self, "collectionView");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setRefreshControl:", 0);

  }
}

- (void)_didPullToRefresh:(id)a3
{
  objc_msgSend(a3, "beginRefreshing");
  -[CKConversationListCollectionViewController _startRefreshControlTimer](self, "_startRefreshControlTimer");
}

- (void)_startRefreshControlTimer
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t, void *);
  void *v8;
  id v9;
  id location;

  location = 0;
  objc_initWeak(&location, self);
  v3 = (void *)MEMORY[0x1E0C99E88];
  v5 = MEMORY[0x1E0C809B0];
  v6 = 3221225472;
  v7 = __71__CKConversationListCollectionViewController__startRefreshControlTimer__block_invoke;
  v8 = &unk_1E2757590;
  objc_copyWeak(&v9, &location);
  objc_msgSend(v3, "scheduledTimerWithTimeInterval:repeats:block:", 0, &v5, 30.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKConversationListCollectionViewController setRefreshControlTimer:](self, "setRefreshControlTimer:", v4, v5, v6, v7, v8);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __71__CKConversationListCollectionViewController__startRefreshControlTimer__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id WeakRetained;
  void *v6;
  uint8_t v7[16];

  v3 = a2;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_18DFCD000, v4, OS_LOG_TYPE_INFO, "Timed out waiting on message summary / pending count change. Stopping refresh control.", v7, 2u);
    }

  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "collectionViewRefreshControl");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "endRefreshing");

}

- (void)_updateAccountRegistrationFailureNotification
{
  NSObject *v3;
  uint8_t v4[16];

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_18DFCD000, v3, OS_LOG_TYPE_INFO, "Update Tip manager", v4, 2u);
    }

  }
  -[CKConversationListTipManager updateKtTipRules](self->_tipManager, "updateKtTipRules");
}

- (id)leadingSwipeActionsConfigurationForIndexPath:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;

  v4 = a3;
  if (objc_msgSend(v4, "section") == 5)
  {
    v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    -[CKConversationListCollectionViewController _markUnreadSwipeActionForIndexPath:](self, "_markUnreadSwipeActionForIndexPath:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      objc_msgSend(v5, "addObject:", v6);
    objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isPinActionEnabled");

    if (v8)
    {
      -[CKConversationListCollectionViewController _pinConversationSwipeActionForIndexPath:](self, "_pinConversationSwipeActionForIndexPath:", v4);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
        objc_msgSend(v5, "addObject:", v9);

    }
    if (objc_msgSend(v5, "count"))
    {
      objc_msgSend(MEMORY[0x1E0CEAA28], "configurationWithActions:", v5);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setPerformsFirstActionWithFullSwipe:", 1);
    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)trailingSwipeActionsConfigurationForIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (CKIsRunningInMacCatalyst() && objc_msgSend(v4, "section") == 4)
  {
    -[CKConversationListCollectionViewController _deleteSwipeActionForIndexPath:](self, "_deleteSwipeActionForIndexPath:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      objc_msgSend(v5, "addObject:", v6);
  }
  else
  {
    if (objc_msgSend(v4, "section") != 5)
      goto LABEL_13;
    -[CKConversationListCollectionViewController _deleteSwipeActionForIndexPath:](self, "_deleteSwipeActionForIndexPath:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      objc_msgSend(v5, "addObject:", v6);
    if (-[CKConversationListCollectionViewController filterMode](self, "filterMode") != 9)
    {
      -[CKConversationListCollectionViewController _dndSwipeActionForIndexPath:](self, "_dndSwipeActionForIndexPath:", v4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
        objc_msgSend(v5, "addObject:", v7);

    }
  }

LABEL_13:
  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CEAA28], "configurationWithActions:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)_markUnreadSwipeActionForIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t, uint64_t, uint64_t, void *);
  void *v23;
  id v24;
  id v25;
  CKConversationListCollectionViewController *v26;
  id v27;
  char v28;
  id location;

  v4 = a3;
  -[CKConversationListCollectionViewController dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "itemIdentifierForIndexPath:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[CKConversationListCollectionViewController conversationForItemIdentifier:](self, "conversationForItemIdentifier:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hasUnreadMessages");
  location = 0;
  objc_initWeak(&location, self);
  CKFrameworkBundle();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("MARK_AS_READ"), &stru_1E276D870, CFSTR("ChatKit"));
  else
    objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("MARK_AS_UNREAD"), &stru_1E276D870, CFSTR("ChatKit"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)MEMORY[0x1E0CEA4C0];
  v20 = MEMORY[0x1E0C809B0];
  v21 = 3221225472;
  v22 = __81__CKConversationListCollectionViewController__markUnreadSwipeActionForIndexPath___block_invoke;
  v23 = &unk_1E2757CD0;
  objc_copyWeak(&v27, &location);
  v12 = v4;
  v24 = v12;
  v13 = v6;
  v25 = v13;
  v26 = self;
  v28 = v8;
  objc_msgSend(v11, "contextualActionWithStyle:title:handler:", 0, v10, &v20);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:", CFSTR("checkmark.message.fill"), v20, v21, v22, v23, v24);
  else
    objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:", CFSTR("message.badge.fill"), v20, v21, v22, v23, v24);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setImage:", v15);

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "theme");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "unreadIndicatorColor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setBackgroundColor:", v18);

  objc_destroyWeak(&v27);
  objc_destroyWeak(&location);

  return v14;
}

void __81__CKConversationListCollectionViewController__markUnreadSwipeActionForIndexPath___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id WeakRetained;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void (**v11)(id, uint64_t);

  v11 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "collectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "cellForItemAtIndexPath:", *(_QWORD *)(a1 + 32));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = objc_loadWeakRetained((id *)(a1 + 56));
    objc_msgSend(v8, "conversationForItemIdentifier:", *(_QWORD *)(a1 + 40));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = v7;
    objc_msgSend(*(id *)(a1 + 48), "_ensureCellLayoutOnCell:", v10);
    objc_msgSend(v10, "forceUnreadIndicatorVisibility:forConversation:animated:", *(_BYTE *)(a1 + 64) == 0, v9, 1);
    if (*(_BYTE *)(a1 + 64))
      objc_msgSend(v9, "markAllMessagesAsRead");
    else
      objc_msgSend(v9, "markLastMessageAsUnread");
    v11[2](v11, 1);

  }
  else
  {
    v11[2](v11, 0);
  }

}

- (id)_pinConversationSwipeActionForIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, uint64_t, uint64_t, void *);
  void *v19;
  id v20;
  id v21;
  id v22;
  id location;

  v4 = a3;
  -[CKConversationListCollectionViewController dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "itemIdentifierForIndexPath:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  location = 0;
  objc_initWeak(&location, self);
  v7 = (void *)MEMORY[0x1E0CEA4C0];
  CKFrameworkBundle();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("PIN"), &stru_1E276D870, CFSTR("ChatKit"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = MEMORY[0x1E0C809B0];
  v17 = 3221225472;
  v18 = __86__CKConversationListCollectionViewController__pinConversationSwipeActionForIndexPath___block_invoke;
  v19 = &unk_1E2757CF8;
  objc_copyWeak(&v22, &location);
  v10 = v4;
  v20 = v10;
  v11 = v6;
  v21 = v11;
  objc_msgSend(v7, "contextualActionWithStyle:title:handler:", 0, v9, &v16);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:", CFSTR("pin.fill"), v16, v17, v18, v19);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setImage:", v13);

  objc_msgSend(MEMORY[0x1E0CEA478], "systemYellowColor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setBackgroundColor:", v14);

  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);

  return v12;
}

void __86__CKConversationListCollectionViewController__pinConversationSwipeActionForIndexPath___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id *v5;
  id WeakRetained;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  void (**v13)(id, uint64_t);

  v13 = a4;
  v5 = (id *)(a1 + 48);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "collectionView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "cellForItemAtIndexPath:", *(_QWORD *)(a1 + 32));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = objc_loadWeakRetained((id *)(a1 + 48));
    objc_msgSend(v9, "conversationForItemIdentifier:", *(_QWORD *)(a1 + 40));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = objc_loadWeakRetained(v5);
    objc_msgSend(v11, "setPinningInteractionMethod:", 3);

    v12 = objc_loadWeakRetained(v5);
    objc_msgSend(v12, "togglePinStateForConversation:withReason:", v10, *MEMORY[0x1E0D35638]);

    v13[2](v13, 1);
  }
  else
  {
    v13[2](v13, 0);
  }

}

- (id)_deleteSwipeActionForIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[4];
  id v16;
  CKConversationListCollectionViewController *v17;
  id v18;
  id v19;
  id location;

  v4 = a3;
  -[CKConversationListCollectionViewController dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "itemIdentifierForIndexPath:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[CKConversationListCollectionViewController conversationForItemIdentifier:](self, "conversationForItemIdentifier:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7 && objc_msgSend(v7, "isUserDeletable"))
  {
    location = 0;
    objc_initWeak(&location, self);
    v9 = (void *)MEMORY[0x1E0CEA4C0];
    CKFrameworkBundle();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("DELETE"), &stru_1E276D870, CFSTR("ChatKit"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __77__CKConversationListCollectionViewController__deleteSwipeActionForIndexPath___block_invoke;
    v15[3] = &unk_1E2757D20;
    v16 = v4;
    v17 = self;
    objc_copyWeak(&v19, &location);
    v18 = v6;
    objc_msgSend(v9, "contextualActionWithStyle:title:handler:", 1, v11, v15);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:", CFSTR("trash.fill"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setImage:", v13);

    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

void __77__CKConversationListCollectionViewController__deleteSwipeActionForIndexPath___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id WeakRetained;
  int v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v11 = *(_QWORD *)(a1 + 32);
      v15 = 138412290;
      v16 = v11;
      _os_log_impl(&dword_18DFCD000, v10, OS_LOG_TYPE_INFO, "[Recently Deleted] Swipe-Deleting indexPath: %@", (uint8_t *)&v15, 0xCu);
    }

  }
  objc_msgSend(*(id *)(a1 + 40), "collectionView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "cellForItemAtIndexPath:", *(_QWORD *)(a1 + 32));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "deleteButtonTappedForItemIdentifier:completionHandler:cellToUpdate:", *(_QWORD *)(a1 + 48), v9, v13);

}

- (id)_dndSwipeActionForIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t, uint64_t, uint64_t, void *);
  void *v23;
  id v24;
  id v25;
  char v26;
  id location;

  v4 = a3;
  -[CKConversationListCollectionViewController dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "itemIdentifierForIndexPath:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[CKConversationListCollectionViewController conversationForItemIdentifier:](self, "conversationForItemIdentifier:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "chat");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isStewieChat");

  v10 = 0;
  if ((v9 & 1) == 0 && v6 && v7)
  {
    v11 = objc_msgSend(v7, "isMuted");
    CKFrameworkBundle();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v11)
      v14 = CFSTR("UNMUTE_ACTION");
    else
      v14 = CFSTR("MUTE_ACTION");
    objc_msgSend(v12, "localizedStringForKey:value:table:", v14, &stru_1E276D870, CFSTR("ChatKit"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    location = 0;
    objc_initWeak(&location, self);
    v16 = (void *)MEMORY[0x1E0CEA4C0];
    v20 = MEMORY[0x1E0C809B0];
    v21 = 3221225472;
    v22 = __74__CKConversationListCollectionViewController__dndSwipeActionForIndexPath___block_invoke;
    v23 = &unk_1E2757D48;
    objc_copyWeak(&v25, &location);
    v24 = v6;
    v26 = v11;
    objc_msgSend(v16, "contextualActionWithStyle:title:handler:", 0, v15, &v20);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA478], "systemIndigoColor", v20, v21, v22, v23);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setBackgroundColor:", v17);

    if (v11)
      objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:", CFSTR("bell.fill"));
    else
      objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:", CFSTR("bell.slash.fill"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setImage:", v18);

    objc_destroyWeak(&v25);
    objc_destroyWeak(&location);

  }
  return v10;
}

void __74__CKConversationListCollectionViewController__dndSwipeActionForIndexPath___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id *v5;
  id WeakRetained;
  void (**v7)(id, uint64_t);

  v5 = (id *)(a1 + 40);
  v7 = a4;
  WeakRetained = objc_loadWeakRetained(v5);
  objc_msgSend(WeakRetained, "muteConversationButtonTappedForConversationWithItemIdentifier:setMuted:", *(_QWORD *)(a1 + 32), *(_BYTE *)(a1 + 48) == 0);

  v7[2](v7, 1);
}

- (void)reloadData
{
  -[CKConversationListCollectionViewController updateSnapshotAnimatingDifferences:](self, "updateSnapshotAnimatingDifferences:", 0);
  -[CKConversationListCollectionViewController updateContentsOfAllCellsAnimated:](self, "updateContentsOfAllCellsAnimated:", 0);
}

- (void)updateConfigurationStateForSelectedCell
{
  void *v3;
  void *v4;
  id v5;

  -[CKConversationListCollectionViewController indexPathOfFirstSelectedItem](self, "indexPathOfFirstSelectedItem");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[CKConversationListCollectionViewController collectionView](self, "collectionView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "cellForItemAtIndexPath:", v5);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      objc_msgSend(v4, "_setNeedsConfigurationStateUpdate");

    }
  }

}

- (void)_updateConversationFilteredFlagsAndReportSpam
{
  id v2;

  -[CKConversationListCollectionViewController conversationList](self, "conversationList");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateConversationFilteredFlagsAndReportSpam");

}

- (void)updateConversationListForMessageSentToConversation:(id)a3
{
  id WeakRetained;
  id v5;
  BOOL v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  char v23;
  uint64_t v24;
  void *v25;
  id v26;

  v26 = a3;
  -[CKConversationListCollectionViewController updateConversationList](self, "updateConversationList");
  if (-[CKConversationListCollectionViewController _shouldKeepSelection](self, "_shouldKeepSelection"))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "currentConversation");
    v5 = (id)objc_claimAutoreleasedReturnValue();

    if (v5)
      v6 = v5 == v26;
    else
      v6 = 0;
    if (v6)
    {
      if (objc_msgSend(v26, "isPending"))
      {
        -[CKConversationListCollectionViewController dataSource](self, "dataSource");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "snapshot");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "itemIdentifiersInSectionWithIdentifier:", &unk_1E2870B28);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "firstObject");
        v7 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        if (objc_msgSend(v26, "isPinned"))
          v11 = 2;
        else
          v11 = 5;
        -[CKConversationListCollectionViewController itemIdentifierForConversation:inSection:](self, "itemIdentifierForConversation:inSection:", v26, v11);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v7 = 0;
    }
    if (objc_msgSend(v7, "length"))
    {
      -[CKConversationListCollectionViewController dataSource](self, "dataSource");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "indexPathForItemIdentifier:", v7);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
      {
        -[CKConversationListCollectionViewController dataSource](self, "dataSource");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[CKConversationListCollectionViewController collectionView](self, "collectionView");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v14, "numberOfSectionsInCollectionView:", v15);
        if (v16 <= objc_msgSend(v13, "section"))
        {

        }
        else
        {
          -[CKConversationListCollectionViewController dataSource](self, "dataSource");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          -[CKConversationListCollectionViewController collectionView](self, "collectionView");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v17, "collectionView:numberOfItemsInSection:", v18, objc_msgSend(v13, "section"));
          v20 = objc_msgSend(v13, "row");

          if (v19 <= v20)
            goto LABEL_23;
          -[CKConversationListCollectionViewController collectionView](self, "collectionView");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "indexPathsForVisibleItems");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = objc_msgSend(v22, "containsObject:", v13);

          if ((v23 & 1) != 0)
            goto LABEL_23;
          v24 = objc_msgSend(v13, "section");
          -[CKConversationListCollectionViewController collectionView](self, "collectionView");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = v25;
          if (v24 == 2)
            objc_msgSend(v25, "__ck_scrollToTop:", 1);
          else
            objc_msgSend(v25, "scrollToItemAtIndexPath:atScrollPosition:animated:", v13, 1, 1);
        }

      }
    }
    else
    {
      v13 = 0;
    }
LABEL_23:

  }
}

- (void)userDeletedJunkConversationFromTranscript
{
  void *v3;

  -[CKConversationListCollectionViewController updater](self, "updater");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "endHoldingUpdatesForReason:updateTriggeredIfNotHeldShouldBeDeferred:", CFSTR("viewVisiblity"), 0);

  -[CKConversationListCollectionViewController leaveJunkFilterIfNeeded](self, "leaveJunkFilterIfNeeded");
}

- (void)updateConversationList
{
  id v2;

  -[CKConversationListCollectionViewController updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsDeferredUpdateWithReason:", CFSTR("externalChange"));

}

- (void)beginHoldingConversationListUpdatesForPPTTests
{
  id v2;

  -[CKConversationListCollectionViewController updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "beginHoldingUpdatesForReason:", CFSTR("pptTest"));

}

- (void)endHoldingConversationListUpdatesForPPTTests
{
  id v2;

  -[CKConversationListCollectionViewController updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "endHoldingUpdatesForReason:updateTriggeredIfNotHeldShouldBeDeferred:", CFSTR("pptTest"), 1);

}

- (void)_reloadVisibleConversationList:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  char v10;
  int v11;
  NSObject *v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t v29[128];
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v24 = a3;
  objc_msgSend(v24, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("uid"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[CKConversationListCollectionViewController collectionView](self, "collectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "indexPathsForVisibleItems");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "length"))
  {
    -[CKConversationListCollectionViewController _indexPaths:containingHandleWithUID:](self, "_indexPaths:containingHandleWithUID:", v7, v5);
    v8 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v8;
  }
  if (objc_msgSend(v7, "count"))
  {
    -[CKConversationListCollectionViewController updater](self, "updater");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isHoldingUpdates");

    v11 = IMOSLoggingEnabled();
    if ((v10 & 1) != 0)
    {
      if (v11)
      {
        OSLogHandleForIMFoundationCategory();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          -[CKConversationListCollectionViewController updater](self, "updater");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v31 = v13;
          _os_log_impl(&dword_18DFCD000, v12, OS_LOG_TYPE_INFO, "***NOT*** Updating visible portion of conversation list, _updater is: %@", buf, 0xCu);

        }
      }
      -[CKConversationListCollectionViewController updater](self, "updater");
      v14 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setNeedsDeferredUpdateWithReason:", CFSTR("updateVisibleConversationsNotification"));
    }
    else
    {
      if (v11)
      {
        OSLogHandleForIMFoundationCategory();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          -[CKConversationListCollectionViewController updater](self, "updater");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v31 = v16;
          v32 = 2112;
          v33 = v7;
          _os_log_impl(&dword_18DFCD000, v15, OS_LOG_TYPE_INFO, "Reloading visible portion of conversation list, _updater is: %@, indexPaths: %@", buf, 0x16u);

        }
      }
      v14 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v27 = 0u;
      v28 = 0u;
      v25 = 0u;
      v26 = 0u;
      v17 = v7;
      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      if (v18)
      {
        v19 = *(_QWORD *)v26;
        do
        {
          v20 = 0;
          do
          {
            if (*(_QWORD *)v26 != v19)
              objc_enumerationMutation(v17);
            v21 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * v20);
            -[CKConversationListCollectionViewController dataSource](self, "dataSource");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "itemIdentifierForIndexPath:", v21);
            v23 = (void *)objc_claimAutoreleasedReturnValue();

            if (v23)
              objc_msgSend(v14, "addObject:", v23);

            ++v20;
          }
          while (v18 != v20);
          v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
        }
        while (v18);
      }

      -[CKConversationListCollectionViewController updateContentsOfCellsWithItemIdentifiers:animated:](self, "updateContentsOfCellsWithItemIdentifiers:animated:", v14, 0);
    }

  }
}

- (id)_indexPaths:(id)a3 containingHandleWithUID:(id)a4
{
  id v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void *v16;
  CKConversationListCollectionViewController *v17;
  id v18;

  v6 = a4;
  v7 = (void *)MEMORY[0x1E0CB3880];
  v13 = MEMORY[0x1E0C809B0];
  v14 = 3221225472;
  v15 = __82__CKConversationListCollectionViewController__indexPaths_containingHandleWithUID___block_invoke;
  v16 = &unk_1E2757D70;
  v17 = self;
  v18 = v6;
  v8 = v6;
  v9 = a3;
  objc_msgSend(v7, "predicateWithBlock:", &v13);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "filteredArrayUsingPredicate:", v10, v13, v14, v15, v16, v17);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

uint64_t __82__CKConversationListCollectionViewController__indexPaths_containingHandleWithUID___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(*(id *)(a1 + 32), "conversationAtIndexPath:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "containsHandleWithUID:", *(_QWORD *)(a1 + 40));

  return v4;
}

- (void)updateNoMessagesDialog
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  -[CKConversationListCollectionViewController dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "snapshot");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "numberOfItems");

  if (v5 >= 1)
  {
    -[CKConversationListCollectionViewController noMessagesDialogView](self, "noMessagesDialogView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeFromSuperview");

    -[CKConversationListCollectionViewController setNoMessagesDialogView:](self, "setNoMessagesDialogView:", 0);
    -[CKConversationListCollectionViewController collectionView](self, "collectionView");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setScrollEnabled:", 1);

  }
}

- (void)_didReceiveSummaries:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t buf[8];
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(MEMORY[0x1E0D39858], "messageSummarizationEnabled"))
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18DFCD000, v5, OS_LOG_TYPE_INFO, "Received new summary, updating conversation list.", buf, 2u);
      }

    }
    objc_msgSend(v4, "userInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0D354B8]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v16;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v16 != v9)
            objc_enumerationMutation(v7);
          v11 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v10);
          -[CKConversationListCollectionViewController conversationList](self, "conversationList");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "conversationForExistingChatWithGUID:", v11);
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          -[CKConversationListCollectionViewController itemIdentifierForConversation:inSection:](self, "itemIdentifierForConversation:inSection:", v13, 5);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          -[CKConversationListCollectionViewController updateContentsOfCellWithItemIdentifier:animated:](self, "updateContentsOfCellWithItemIdentifier:animated:", v14, 1);

          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
      }
      while (v8);
    }

  }
}

uint64_t __82__CKConversationListCollectionViewController_updateConversationNamesForNicknames___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "ID");
}

void __81__CKConversationListCollectionViewController__configureCloudTipViewModelIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _QWORD v4[5];
  id v5;
  _QWORD v6[5];
  id v7;

  v6[0] = 0;
  v6[1] = v6;
  v6[2] = 0x3032000000;
  v6[3] = __Block_byref_object_copy__56;
  v6[4] = __Block_byref_object_dispose__56;
  v7 = a2;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __81__CKConversationListCollectionViewController__configureCloudTipViewModelIfNeeded__block_invoke_703;
  v4[3] = &unk_1E2757DE0;
  v4[4] = v6;
  v3 = v7;
  objc_copyWeak(&v5, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x1E0C80D38], v4);
  objc_destroyWeak(&v5);
  _Block_object_dispose(v6, 8);

}

void __81__CKConversationListCollectionViewController__configureCloudTipViewModelIfNeeded__block_invoke_703(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  id WeakRetained;
  void *v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      v3 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "tipType");
      v6 = 134217984;
      v7 = v3;
      _os_log_impl(&dword_18DFCD000, v2, OS_LOG_TYPE_INFO, "Conversation list needs to update for tip %ld", (uint8_t *)&v6, 0xCu);
    }

  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "tipManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updateCloudTipRulesForDescriptor:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));

}

void __81__CKConversationListCollectionViewController__configureCloudTipViewModelIfNeeded__block_invoke_705()
{
  id v0;

  +[CKCloudTipViewModel sharedInstance](_TtC7ChatKit19CKCloudTipViewModel, "sharedInstance");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "configureCloudTipManagerWithCompletionHandler:", &__block_literal_global_707_0);

}

- (void)pinningTipActionTapped
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __68__CKConversationListCollectionViewController_pinningTipActionTapped__block_invoke;
  block[3] = &unk_1E274A208;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __68__CKConversationListCollectionViewController_pinningTipActionTapped__block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1496), "miniTipUIView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
    objc_msgSend(*(id *)(a1 + 32), "startSuggestedPinsAnimation");
}

- (void)micCloudTipUpdated
{
  -[CKConversationListCollectionViewController updateSnapshotAnimatingDifferences:](self, "updateSnapshotAnimatingDifferences:", 1);
}

- (void)trackSIMFilterUpdateEventFromOldSIMFilterIndex:(int64_t)a3 toSelectedSIMFilterIndex:(int64_t)a4
{
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v13;
  void *v14;
  id v15;

  objc_msgSend(MEMORY[0x1E0D39958], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  v8 = *MEMORY[0x1E0D387E0];
  if (a3 == a4)
    v9 = &unk_1E2871D58;
  else
    v9 = &unk_1E2871D80;
  objc_msgSend(v6, "trackEvent:withDictionary:", *MEMORY[0x1E0D387E0], v9);

  if (a3 == -1 && a4 != -1)
  {
    objc_msgSend(MEMORY[0x1E0D39958], "sharedInstance");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = &unk_1E2871DA8;
LABEL_20:
    v15 = v13;
    objc_msgSend(v13, "trackEvent:withDictionary:", v8, v14);

    return;
  }
  if (a3 != -1 && a4 == -1)
  {
    objc_msgSend(MEMORY[0x1E0D39958], "sharedInstance");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = &unk_1E2871DD0;
    goto LABEL_20;
  }
  if (a3 != a4 && a3 != -1 && a4 != -1)
  {
    objc_msgSend(MEMORY[0x1E0D39958], "sharedInstance");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = &unk_1E2871DF8;
    goto LABEL_20;
  }
}

- (void)updateSIMFilterIndexAndReloadData:(int64_t)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  int64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      -[CKConversationListCollectionViewController conversationList](self, "conversationList");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 134218240;
      v11 = objc_msgSend(v6, "simFilterIndex");
      v12 = 2048;
      v13 = a3;
      _os_log_impl(&dword_18DFCD000, v5, OS_LOG_TYPE_INFO, "Updating SIM Filter Index from %ld to : %ld", (uint8_t *)&v10, 0x16u);

    }
  }
  -[CKConversationListCollectionViewController conversationList](self, "conversationList");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKConversationListCollectionViewController trackSIMFilterUpdateEventFromOldSIMFilterIndex:toSelectedSIMFilterIndex:](self, "trackSIMFilterUpdateEventFromOldSIMFilterIndex:toSelectedSIMFilterIndex:", objc_msgSend(v7, "simFilterIndex"), a3);

  -[CKConversationListCollectionViewController conversationList](self, "conversationList");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setSimFilterIndex:", a3);

  -[CKConversationListCollectionViewController updater](self, "updater");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setNeedsDeferredUpdateWithReason:", CFSTR("simFilterChanged"));

}

- (void)_resetSimFilteringToDefaultState
{
  void *v3;
  id v4;

  CKResetMessageSIMFilteringEnabledCache();
  -[CKConversationListCollectionViewController conversationList](self, "conversationList");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSimFilterIndex:", -1);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -1);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  IMSetDomainValueForKey();

}

- (void)showMeCardViewController
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  _BOOL4 v7;
  void *v8;
  int v9;
  BOOL v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  _QWORD aBlock[5];

  v3 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __70__CKConversationListCollectionViewController_showMeCardViewController__block_invoke;
  aBlock[3] = &unk_1E2757E50;
  aBlock[4] = self;
  v4 = _Block_copy(aBlock);
  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "userInterfaceIdiom"))
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "userInterfaceIdiom") == 1;

  }
  else
  {
    v7 = 1;
  }

  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isNameAndPhotoC3Enabled");

  if (v9)
    v10 = !v7;
  else
    v10 = 1;
  if (v10)
  {
    -[CKConversationListCollectionViewController nicknameController](self, "nicknameController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v3;
    v13[1] = 3221225472;
    v13[2] = __70__CKConversationListCollectionViewController_showMeCardViewController__block_invoke_2;
    v13[3] = &unk_1E27557E0;
    v14 = v4;
    objc_msgSend(v11, "fetchPersonalNicknameWithCompletion:", v13);

    v12 = v14;
  }
  else
  {
    -[CKConversationListCollectionViewController onboardingController](self, "onboardingController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "presentNicknameOnboardingOrEditFlow");
  }

}

void __70__CKConversationListCollectionViewController_showMeCardViewController__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  if (a2)
  {
    objc_msgSend(v2, "showMeCardViewControllerWithNickname:", a2);
  }
  else
  {
    objc_msgSend(v2, "onboardingController");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "presentNicknameSharingSetupFlowWithMemoji:forUserInitiatedEdit:", 1, 1);

  }
}

void __70__CKConversationListCollectionViewController_showMeCardViewController__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __70__CKConversationListCollectionViewController_showMeCardViewController__block_invoke_3;
  v6[3] = &unk_1E274DA38;
  v4 = *(id *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

uint64_t __70__CKConversationListCollectionViewController_showMeCardViewController__block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (id)_avatarProviderFromNickname:(id)a3
{
  id v3;
  CKMeCardSharingNicknameAvatarProvider *v4;
  void *v5;
  void *v6;
  CKMeCardSharingNicknameAvatarProvider *v7;

  v3 = a3;
  v4 = [CKMeCardSharingNicknameAvatarProvider alloc];
  objc_msgSend(v3, "avatar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "imageData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[CKMeCardSharingNicknameAvatarProvider initWithImageData:](v4, "initWithImageData:", v6);

  return v7;
}

- (void)showMeCardViewControllerWithNickname:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _BOOL8 v7;
  unint64_t v8;
  void *v9;
  void *v10;
  CKMeCardNavigationController *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;

  v4 = a3;
  -[CKConversationListCollectionViewController _meContact](self, "_meContact");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  +[CKMeCardSharingNameProvider nameProviderForNickname:](CKMeCardSharingNameProvider, "nameProviderForNickname:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKConversationListCollectionViewController _contactStore](self, "_contactStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[CKConversationListCollectionViewController _meCardSharingEnabled](self, "_meCardSharingEnabled");
  v8 = -[CKConversationListCollectionViewController _meCardSharingAudience](self, "_meCardSharingAudience");
  -[CKConversationListCollectionViewController _avatarProviderFromNickname:](self, "_avatarProviderFromNickname:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v15) = 1;
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97510]), "initWithContactStore:contact:avatarProvider:nameProvider:sharingEnabled:selectedSharingAudience:showsWallpaperSuggestionsGalleryPicker:headerMode:", v6, v16, v9, v5, v7, v8, v15, 1);
  objc_msgSend(v10, "setDelegate:", self);
  v11 = -[CKMeCardNavigationController initWithRootViewController:]([CKMeCardNavigationController alloc], "initWithRootViewController:", v10);
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA380]), "initWithBarButtonSystemItem:target:action:", 0, self, sel__dismissPresentedNavController_);
  objc_msgSend(v10, "navigationItem");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setRightBarButtonItem:", v12);

  -[CKConversationListCollectionViewController navigationController](self, "navigationController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "presentViewController:animated:completion:", v11, 1, 0);

}

- (id)nicknameController
{
  return (id)objc_msgSend(MEMORY[0x1E0D358A8], "sharedInstance");
}

- (id)_contactStore
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0D397A8], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getContactStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_meContact
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0D397A8], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D397A8], "keysForNicknameHandling");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fetchMeContactWithKeys:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_meCardSharingNameProviderWithContact:(id)a3
{
  void *v3;

  +[CKMeCardSharingNameProvider nameProviderForContact:](CKMeCardSharingNameProvider, "nameProviderForContact:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    +[CKMeCardSharingNameProvider nameProviderForPrimaryAccount](CKMeCardSharingNameProvider, "nameProviderForPrimaryAccount");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (id)_meCardSharingState
{
  return (id)objc_msgSend(MEMORY[0x1E0D398E8], "sharedInstance");
}

- (BOOL)_meCardSharingEnabled
{
  void *v2;
  char v3;

  -[CKConversationListCollectionViewController _meCardSharingState](self, "_meCardSharingState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "sharingEnabled");

  return v3;
}

- (unint64_t)_meCardSharingAudience
{
  void *v2;
  unint64_t v3;

  -[CKConversationListCollectionViewController _meCardSharingState](self, "_meCardSharingState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "sharingAudience");

  return v3;
}

- (BOOL)_imageForkedFromMeCard
{
  void *v2;
  char v3;

  -[CKConversationListCollectionViewController _meCardSharingState](self, "_meCardSharingState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "imageForkedFromMeCard");

  return v3;
}

- (void)sharingSettingsViewController:(id)a3 didUpdateSharingState:(BOOL)a4
{
  _BOOL8 v4;
  id v5;

  v4 = a4;
  -[CKConversationListCollectionViewController _meCardSharingState](self, "_meCardSharingState", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSharingEnabled:", v4);

}

- (void)sharingSettingsViewController:(id)a3 didSelectSharingAudience:(unint64_t)a4
{
  id v5;

  -[CKConversationListCollectionViewController _meCardSharingState](self, "_meCardSharingState", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSharingAudience:", a4);

}

- (void)sharingSettingsViewController:(id)a3 didUpdateWithSharingResult:(id)a4
{
  void *v4;
  id v5;
  id v6;

  v4 = (void *)MEMORY[0x1E0D358A8];
  v5 = a4;
  objc_msgSend(v4, "sharedInstance");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "updatePersonalNicknameIfNecessaryWithMeCardSharingResult:", v5);

}

- (CKOnboardingController)onboardingController
{
  CKOnboardingController *onboardingController;
  CKOnboardingController *v4;
  CKOnboardingController *v5;

  onboardingController = self->_onboardingController;
  if (!onboardingController)
  {
    v4 = objc_alloc_init(CKOnboardingController);
    v5 = self->_onboardingController;
    self->_onboardingController = v4;

    -[CKOnboardingController setDelegate:](self->_onboardingController, "setDelegate:", self);
    onboardingController = self->_onboardingController;
  }
  return onboardingController;
}

- (id)presentingViewControllerForOnboardingController:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  CKConversationListCollectionViewController *v7;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[CKConversationListCollectionViewController onboardingController](self, "onboardingController");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
  {
    v7 = self;
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        v9 = 138412290;
        v10 = v4;
        _os_log_impl(&dword_18DFCD000, v6, OS_LOG_TYPE_INFO, "Unexpected instance of onboardingController %@", (uint8_t *)&v9, 0xCu);
      }

    }
    v7 = 0;
  }

  return v7;
}

- (void)onboardingControllerDidFinish:(id)a3
{
  -[CKConversationListCollectionViewController setOnboardingController:](self, "setOnboardingController:", 0);
}

- (void)_downtimeStateChanged:(id)a3
{
  -[CKConversationListCollectionViewController updateSnapshotAnimatingDifferences:](self, "updateSnapshotAnimatingDifferences:", 0);
}

- (void)_chatAllowedByScreenTimeChanged:(id)a3
{
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v11 = a3;
  v4 = objc_msgSend(MEMORY[0x1E0D35808], "isContactLimitsFeatureEnabled");
  v5 = v11;
  if (v4)
  {
    objc_msgSend(v11, "object");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKConversationListCollectionViewController conversationList](self, "conversationList");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "conversationForExistingChat:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v8, "resetNameCaches");
      if (objc_msgSend(v8, "isPinned"))
        v9 = 2;
      else
        v9 = 5;
      -[CKConversationListCollectionViewController itemIdentifierForConversation:inSection:](self, "itemIdentifierForConversation:inSection:", v8, v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKConversationListCollectionViewController updateContentsOfCellWithItemIdentifier:animated:](self, "updateContentsOfCellWithItemIdentifier:animated:", v10, 0);

    }
    v5 = v11;
  }

}

- (void)configureWithToolbarController:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  int v8;
  void *v9;
  id v10;

  v10 = a3;
  -[CKConversationListCollectionViewController macToolbarController](self, "macToolbarController");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  if (v4 != v10)
    -[CKConversationListCollectionViewController setMacToolbarController:](self, "setMacToolbarController:", v10);
  -[CKConversationListCollectionViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "window");
  v6 = objc_claimAutoreleasedReturnValue();
  if (!v6)
    goto LABEL_6;
  v7 = (void *)v6;
  v8 = -[CKConversationListCollectionViewController conformsToProtocol:](self, "conformsToProtocol:", &unk_1EE1607D8);

  if (v8)
  {
    -[CKConversationListCollectionViewController macToolbarController](self, "macToolbarController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setPrimaryItemProvider:", self);

    -[CKConversationListCollectionViewController macToolbarController](self, "macToolbarController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setShouldDrawPrimaryBlur:", 0);
LABEL_6:

  }
}

- (void)providerWillBeRemovedFromToolbarController:(id)a3
{
  -[CKConversationListCollectionViewController setMacToolbarController:](self, "setMacToolbarController:", 0);
}

- (BOOL)itemProviderDisablesTouches
{
  return 0;
}

- (double)virtualToolbarPreferredHeight
{
  void *v2;
  double v3;
  double v4;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "macAppKitToolbarHeight");
  v4 = v3;

  return v4;
}

- (void)setIsBelowMacSnapToMinWidth:(BOOL)a3
{
  if (self->_isBelowMacSnapToMinWidth != a3)
    self->_isBelowMacSnapToMinWidth = a3;
}

- (CKMacToolbarItem)composeToolbarItem
{
  CKMacToolbarItem *composeToolbarItem;

  composeToolbarItem = self->_composeToolbarItem;
  if (!composeToolbarItem)
  {
    -[CKConversationListCollectionViewController composeButtonItem](self, "composeButtonItem");

    composeToolbarItem = self->_composeToolbarItem;
  }
  return composeToolbarItem;
}

- (id)toolbarItemForIdentifier:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  if (-[CKConversationListCollectionViewController isBelowMacSnapToMinWidth](self, "isBelowMacSnapToMinWidth")
    || !objc_msgSend(v4, "isEqualToString:", CFSTR("CKMacToolbarNewComposeItemIdentifier")))
  {
    v5 = 0;
  }
  else
  {
    -[CKConversationListCollectionViewController composeToolbarItem](self, "composeToolbarItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

- (void)fetchPinningSuggestions
{
  NSObject *v3;
  int64_t v4;
  void *v5;
  NSObject *v6;
  _QWORD block[4];
  id v8;
  CKConversationListCollectionViewController *v9;
  int64_t v10;
  uint8_t buf[16];

  if (-[CKConversationListCollectionViewController numberOfPinnedConversations](self, "numberOfPinnedConversations") < 1)
  {
    v4 = -[CKConversationListCollectionViewController numberOfConversations](self, "numberOfConversations");
    -[CKConversationListCollectionViewController pinnedConversationSuggester](self, "pinnedConversationSuggester");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    dispatch_get_global_queue(0, 0);
    v6 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __69__CKConversationListCollectionViewController_fetchPinningSuggestions__block_invoke;
    block[3] = &unk_1E274A420;
    v9 = self;
    v10 = v4;
    v8 = v5;
    v3 = v5;
    dispatch_async(v6, block);

  }
  else
  {
    if (!IMOSLoggingEnabled())
      return;
    OSLogHandleForIMFoundationCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18DFCD000, v3, OS_LOG_TYPE_INFO, "Already have pinned conversations, not fetching conversations.", buf, 2u);
    }
  }

}

void __69__CKConversationListCollectionViewController_fetchPinningSuggestions__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;

  v2 = (void *)MEMORY[0x1E0C99E40];
  objc_msgSend(*(id *)(a1 + 32), "chatGuidsForMessagesPinningWithMaxSuggestions:", *(_QWORD *)(a1 + 48));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "orderedSetWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __69__CKConversationListCollectionViewController_fetchPinningSuggestions__block_invoke_2;
  v7[3] = &unk_1E274A108;
  v5 = *(_QWORD *)(a1 + 40);
  v8 = v4;
  v9 = v5;
  v6 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v7);

}

void __69__CKConversationListCollectionViewController_fetchPinningSuggestions__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  int v5;
  uint64_t v6;
  unint64_t v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  id *v15;
  void *v16;
  _QWORD v17[5];
  uint8_t buf[4];
  unint64_t v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __69__CKConversationListCollectionViewController_fetchPinningSuggestions__block_invoke_3;
  v17[3] = &unk_1E2757E78;
  v17[4] = *(_QWORD *)(a1 + 40);
  objc_msgSend(v2, "__imArrayByApplyingBlock:", v17);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D36A50], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v4, "isInternalInstall"))
  {
LABEL_11:

    goto LABEL_12;
  }
  v5 = IMGetCachedDomainBoolForKeyWithDefaultValue();

  if (v5)
  {
    v6 = objc_msgSend(v3, "count");
    if (v6 != 3)
    {
      v7 = 3 - v6;
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 134217984;
          v19 = v7;
          _os_log_impl(&dword_18DFCD000, v8, OS_LOG_TYPE_INFO, "Populating (%lu) remaining onboarding conversations.", buf, 0xCu);
        }

      }
      objc_msgSend(*(id *)(a1 + 40), "conversationList");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "conversations");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v10, "count") >= v7)
      {
        objc_msgSend(v10, "subarrayWithRange:", 0, v7);
        v4 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v4);
        v11 = objc_claimAutoreleasedReturnValue();

        v3 = (void *)v11;
      }
      else
      {
        v4 = v10;
      }
      goto LABEL_11;
    }
  }
LABEL_12:
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v13 = objc_msgSend(*(id *)(a1 + 32), "count");
      v14 = objc_msgSend(v3, "count");
      *(_DWORD *)buf = 134218240;
      v19 = v13;
      v20 = 2048;
      v21 = v14;
      _os_log_impl(&dword_18DFCD000, v12, OS_LOG_TYPE_INFO, "We were asked to show onboarding tip. Suggestions: (%lu) Conversations: (%lu)", buf, 0x16u);
    }

  }
  if ((unint64_t)objc_msgSend(v3, "count") >= 3)
  {
    v16 = *(void **)(a1 + 40);
    v15 = (id *)(a1 + 40);
    objc_msgSend(v16, "setRecommendedPinningConversations:", v3);
    objc_msgSend(*v15, "setCanShowSuggestedPinningOnboardingCell:", 1);
    objc_msgSend(*v15, "updateSnapshotAnimatingDifferences:", 1);
  }

}

id __69__CKConversationListCollectionViewController_fetchPinningSuggestions__block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "conversationList");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "conversationForExistingChatWithGUID:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)siriTipUpdated
{
  -[CKConversationListCollectionViewController updateSnapshotAnimatingDifferences:](self, "updateSnapshotAnimatingDifferences:", 1);
}

- (void)pinningTipUpdated
{
  if (-[CKConversationListTipManager presentedTip](self->_tipManager, "presentedTip") == 2)
  {
    -[CKConversationListCollectionViewController fetchPinningSuggestions](self, "fetchPinningSuggestions");
  }
  else
  {
    -[CKConversationListCollectionViewController setCanShowSuggestedPinningOnboardingCell:](self, "setCanShowSuggestedPinningOnboardingCell:", 0);
    -[CKConversationListCollectionViewController updateSnapshotAnimatingDifferences:](self, "updateSnapshotAnimatingDifferences:", 1);
  }
}

- (void)ktFailureTipUpdated
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      v4 = (void *)MEMORY[0x1E0CB37E8];
      -[CKConversationListCollectionViewController tipManager](self, "tipManager");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "numberWithInteger:", objc_msgSend(v5, "presentedTip"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 138412290;
      v8 = v6;
      _os_log_impl(&dword_18DFCD000, v3, OS_LOG_TYPE_INFO, "Update KT Failure tip to present: %@", (uint8_t *)&v7, 0xCu);

    }
  }
  -[CKConversationListCollectionViewController updateSnapshotAnimatingDifferences:](self, "updateSnapshotAnimatingDifferences:", 1);
}

- (id)_userDefaults
{
  return (id)objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
}

- (void)_submitFeedbackIfNecessaryForSuggestedPinnedConversationsFollowingOnboardingCompletedSuccessfully:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v3 = a3;
  if (-[CKConversationListCollectionViewController isShowingPinningOnboarding](self, "isShowingPinningOnboarding"))
  {
    -[CKConversationListCollectionViewController recommendedPinningConversations](self, "recommendedPinningConversations");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    -[CKConversationListCollectionViewController _pinningSuggestionsForConversations:](self, "_pinningSuggestionsForConversations:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      -[CKConversationListCollectionViewController frozenPinnedConversations](self, "frozenPinnedConversations");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKConversationListCollectionViewController _pinningSuggestionsForConversations:](self, "_pinningSuggestionsForConversations:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D70980], "acceptedWithActualPinnings:OnboardingSuggestions:", v7, v5);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D70980], "skipOnboardingWithOnboardingSuggestions:", v5);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    -[CKConversationListCollectionViewController pinnedConversationSuggester](self, "pinnedConversationSuggester");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "provideMessagesPinningFeedback:", v8);

  }
}

- (void)_submitFeedbackIfNecessaryForPinsChangedWithPreviousPinnedConversationIdentifiers:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int64_t v11;
  uint64_t v12;
  void *v13;
  id v14;

  v14 = a3;
  -[CKConversationListCollectionViewController conversationList](self, "conversationList");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "loadedPinnedConversations");

  v6 = v14;
  if (v5)
  {
    -[CKConversationListCollectionViewController conversationList](self, "conversationList");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "pinnedConversations");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[CKConversationListCollectionViewController _pinningSuggestionsForConversations:](self, "_pinningSuggestionsForConversations:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D70980], "pinsChangedWithNowCurrentPins:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[CKConversationListCollectionViewController _feedbackPinningInteractionMethod](self, "_feedbackPinningInteractionMethod");
    objc_msgSend(v10, "setInteractionMethod:", v11);
    if (!v11)
    {
      v12 = objc_msgSend(v14, "count");
      if (v12 == objc_msgSend(v8, "count"))
        objc_msgSend(v10, "setActionType:", 3);
    }
    -[CKConversationListCollectionViewController pinnedConversationSuggester](self, "pinnedConversationSuggester");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "provideMessagesPinningFeedback:", v10);

    -[CKConversationListCollectionViewController setPinningInteractionMethod:](self, "setPinningInteractionMethod:", 0);
    v6 = v14;
  }

}

- (id)_pinningSuggestionsForConversations:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v9), "chat", (_QWORD)v15);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "guid");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v11, "length"))
        {
          v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D70990]), "initWithChatGuid:", v11);
          if (v12)
            objc_msgSend(v4, "addObject:", v12);

        }
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }

  v13 = (void *)objc_msgSend(v4, "copy");
  return v13;
}

- (int64_t)_feedbackPinningInteractionMethod
{
  int64_t v2;

  v2 = -[CKConversationListCollectionViewController pinningInteractionMethod](self, "pinningInteractionMethod");
  if ((unint64_t)(v2 - 1) >= 4)
    return 4;
  else
    return v2 - 1;
}

- (BOOL)_wantsThreeColumnLayout
{
  void *v2;
  char v3;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "wantsUniversalThreeColumn");

  return v3;
}

- (void)_updateSelectAllButtonItemTitle
{
  void *v3;
  void *v4;
  uint64_t v5;
  int64_t v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  id v10;

  -[CKConversationListCollectionViewController collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "indexPathsForSelectedItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  v6 = -[CKConversationListCollectionViewController numberOfConversations](self, "numberOfConversations");
  CKFrameworkBundle();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v7;
  if (v5 == v6)
    v8 = CFSTR("DESELECT_ALL_BUTTON");
  else
    v8 = CFSTR("SELECT_ALL_BUTTON");
  objc_msgSend(v7, "localizedStringForKey:value:table:", v8, &stru_1E276D870, CFSTR("ChatKit"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIBarButtonItem setTitle:](self->_selectAllButtonItem, "setTitle:", v9);

}

- (void)_performMultiSelectCleanUp
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  if (-[CKConversationListCollectionViewController filterMode](self, "filterMode") == 7)
  {
    -[CKConversationListCollectionViewController _performRecentlyDeletedMultiSelectCleanUp](self, "_performRecentlyDeletedMultiSelectCleanUp");
  }
  else
  {
    -[CKConversationListCollectionViewController delegate](self, "delegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isCollapsed");

    if ((v4 & 1) == 0)
    {
      -[CKConversationListCollectionViewController collectionView](self, "collectionView");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "indexPathsForSelectedItems");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "count");

      if (v7 == 1)
      {
        -[CKConversationListCollectionViewController dataSource](self, "dataSource");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[CKConversationListCollectionViewController collectionView](self, "collectionView");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "indexPathsForSelectedItems");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "firstObject");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "itemIdentifierForIndexPath:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[CKConversationListCollectionViewController setLastSelectedConversationItemIdentifier:](self, "setLastSelectedConversationItemIdentifier:", v12);

      }
      -[CKConversationListCollectionViewController dataSource](self, "dataSource");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKConversationListCollectionViewController lastSelectedConversationItemIdentifier](self, "lastSelectedConversationItemIdentifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "indexPathForItemIdentifier:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      -[CKConversationListCollectionViewController _selectConversationAtIndexPath:animated:](self, "_selectConversationAtIndexPath:animated:", v15, CKIsRunningInMacCatalyst() == 0);
    }
    if (-[CKConversationListCollectionViewController filterMode](self, "filterMode") != 7)
      -[CKConversationListCollectionViewController setEditingMode:](self, "setEditingMode:", 0);
  }
}

- (unint64_t)_numberOfSelectedConversations
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[CKConversationListCollectionViewController collectionView](self, "collectionView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "indexPathsForSelectedItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "count");
  return v4;
}

- (id)toolbarItems
{
  unint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[4];

  v13[3] = *MEMORY[0x1E0C80C00];
  if ((-[CKConversationListCollectionViewController isEditing](self, "isEditing") & 1) == 0
    && -[CKConversationListCollectionViewController filterMode](self, "filterMode") != 9)
  {
    return MEMORY[0x1E0C9AA60];
  }
  v3 = -[CKConversationListCollectionViewController _numberOfSelectedConversations](self, "_numberOfSelectedConversations");
  -[CKConversationListCollectionViewController dataSource](self, "dataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "snapshot");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "numberOfItems");

  if (-[CKConversationListCollectionViewController filterMode](self, "filterMode") == 7)
  {
    -[CKConversationListCollectionViewController toolbarItemsForRecentlyDeletedFilterHasConversations:hasSelectedConversations:](self, "toolbarItemsForRecentlyDeletedFilterHasConversations:hasSelectedConversations:", v6 > 0, v3 != 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    return v7;
  }
  if (-[CKConversationListCollectionViewController filterMode](self, "filterMode") == 9)
  {
    -[CKConversationListCollectionViewController toolbarItemsForJunkFilterHasConversations:hasSelectedConversations:](self, "toolbarItemsForJunkFilterHasConversations:hasSelectedConversations:", v6 > 0, v3 != 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    return v7;
  }
  -[CKConversationListCollectionViewController toggleReadButtonItem](self, "toggleReadButtonItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA380]), "initWithBarButtonSystemItem:target:action:", 5, 0, 0);
  if (v3)
    v3 = -[CKConversationListCollectionViewController _hasStewieConversationSelected](self, "_hasStewieConversationSelected") ^ 1;
  -[CKConversationListCollectionViewController moveSelectedToRecentlyDeletedButtonItem](self, "moveSelectedToRecentlyDeletedButtonItem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setEnabled:", v3);
  v13[0] = v9;
  v13[1] = v10;
  v13[2] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (BOOL)_hasStewieConversationSelected
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  BOOL v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D357A0], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isStewieActive");

  if (!v4)
    return 0;
  -[CKConversationListCollectionViewController collectionView](self, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "indexPathsForSelectedItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v20;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v20 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i);
        -[CKConversationListCollectionViewController dataSource](self, "dataSource", (_QWORD)v19);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "itemIdentifierForIndexPath:", v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        -[CKConversationListCollectionViewController conversationForItemIdentifier:](self, "conversationForItemIdentifier:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "isStewieConversation");

        if ((v16 & 1) != 0)
        {
          v17 = 1;
          goto LABEL_13;
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      if (v9)
        continue;
      break;
    }
  }
  v17 = 0;
LABEL_13:

  return v17;
}

- (id)toggleReadButtonItem
{
  void *v3;
  void *v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  uint64_t v9;
  void *v10;

  CKFrameworkBundle();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("READ_ALL"), &stru_1E276D870, CFSTR("ChatKit"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[CKConversationListCollectionViewController _numberOfSelectedConversations](self, "_numberOfSelectedConversations"))
  {
    v5 = -[CKConversationListCollectionViewController _hasUnreadConversation](self, "_hasUnreadConversation");
    CKFrameworkBundle();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v5)
      v8 = CFSTR("MARK_AS_READ_BUTTON");
    else
      v8 = CFSTR("MARK_AS_UNREAD_BUTTON");
    objc_msgSend(v6, "localizedStringForKey:value:table:", v8, &stru_1E276D870, CFSTR("ChatKit"));
    v9 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v9;
  }
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA380]), "initWithTitle:style:target:action:", v4, 0, self, sel_toggleReadButtonTapped_);
  objc_msgSend(v10, "setEnabled:", 1);
  objc_msgSend(v10, "accessibilitySetIdentification:", CFSTR("toggleReadButton"));

  return v10;
}

- (BOOL)_hasUnreadConversation
{
  CKConversationListCollectionViewController *v2;
  void *v3;
  void *v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v2 = self;
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  -[CKConversationListCollectionViewController collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "indexPathsForSelectedItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __68__CKConversationListCollectionViewController__hasUnreadConversation__block_invoke;
  v6[3] = &unk_1E2757EC0;
  v6[4] = v2;
  v6[5] = &v7;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v6);
  LOBYTE(v2) = *((_BYTE *)v8 + 24);

  _Block_object_dispose(&v7, 8);
  return (char)v2;
}

void __68__CKConversationListCollectionViewController__hasUnreadConversation__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "conversationAtIndexPath:", a2);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "hasUnreadMessages"))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }

}

- (BOOL)isVisible
{
  return self->_isVisible;
}

- (void)setDeferredSearchQuery:(id)a3
{
  objc_storeStrong((id *)&self->_deferredSearchQuery, a3);
}

- (BOOL)hidePinsForAnimation
{
  return self->_hidePinsForAnimation;
}

- (void)setHidePinsForAnimation:(BOOL)a3
{
  self->_hidePinsForAnimation = a3;
}

- (CKPinnedConversationCollectionViewCell)prototypePinnedConversationCollectionViewCell
{
  return self->_prototypePinnedConversationCollectionViewCell;
}

- (void)setPrototypePinnedConversationCollectionViewCell:(id)a3
{
  objc_storeStrong((id *)&self->_prototypePinnedConversationCollectionViewCell, a3);
}

- (NSDate)lastUserSelectedConversationTime
{
  return self->_lastUserSelectedConversationTime;
}

- (void)setLastUserSelectedConversationTime:(id)a3
{
  objc_storeStrong((id *)&self->_lastUserSelectedConversationTime, a3);
}

- (NSString)lastUserSelectedConversationItemIdentifier
{
  return self->_lastUserSelectedConversationItemIdentifier;
}

- (void)setLastUserSelectedConversationItemIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_lastUserSelectedConversationItemIdentifier, a3);
}

- (UIView)noMessagesDialogView
{
  return self->_noMessagesDialogView;
}

- (void)setNoMessagesDialogView:(id)a3
{
  objc_storeStrong((id *)&self->_noMessagesDialogView, a3);
}

- (void)setSearchController:(id)a3
{
  objc_storeStrong((id *)&self->_searchController, a3);
}

- (CNContact)meContact
{
  return self->_meContact;
}

- (void)setMeContact:(id)a3
{
  objc_storeStrong((id *)&self->_meContact, a3);
}

- (BOOL)holdPinningUpdatesForConversationDeletion
{
  return self->_holdPinningUpdatesForConversationDeletion;
}

- (void)setHoldPinningUpdatesForConversationDeletion:(BOOL)a3
{
  self->_holdPinningUpdatesForConversationDeletion = a3;
}

- (BOOL)keyboardIsShowing
{
  return self->_keyboardIsShowing;
}

- (void)setKeyboardIsShowing:(BOOL)a3
{
  self->_keyboardIsShowing = a3;
}

- (void)setSearchResultsController:(id)a3
{
  objc_storeStrong((id *)&self->_searchResultsController, a3);
}

- (void)setMacVirtualComposeButton:(id)a3
{
  objc_storeStrong((id *)&self->_macVirtualComposeButton, a3);
}

- (void)setComposeButtonItem:(id)a3
{
  objc_storeStrong((id *)&self->_composeButtonItem, a3);
}

- (void)setEditButtonItem:(id)a3
{
  objc_storeStrong((id *)&self->_editButtonItem, a3);
}

- (void)setEditOscarButtonItem:(id)a3
{
  objc_storeStrong((id *)&self->_editOscarButtonItem, a3);
}

- (void)setOptionsButtonItem:(id)a3
{
  objc_storeStrong((id *)&self->_optionsButtonItem, a3);
}

- (void)setCancelButtonItem:(id)a3
{
  objc_storeStrong((id *)&self->_cancelButtonItem, a3);
}

- (void)setDoneButtonItem:(id)a3
{
  objc_storeStrong((id *)&self->_doneButtonItem, a3);
}

- (void)setSelectAllButtonItem:(id)a3
{
  objc_storeStrong((id *)&self->_selectAllButtonItem, a3);
}

- (void)setMoveSelectedToRecentlyDeletedButtonItem:(id)a3
{
  objc_storeStrong((id *)&self->_moveSelectedToRecentlyDeletedButtonItem, a3);
}

- (void)setCloseButtonItem:(id)a3
{
  objc_storeStrong((id *)&self->_closeButtonItem, a3);
}

- (void)setCatalystFiltersNavigationBackButton:(id)a3
{
  objc_storeStrong((id *)&self->_catalystFiltersNavigationBackButton, a3);
}

- (UIBarButtonItem)permanentDeleteSelectedButtonItem
{
  return self->_permanentDeleteSelectedButtonItem;
}

- (void)setPermanentDeleteSelectedButtonItem:(id)a3
{
  objc_storeStrong((id *)&self->_permanentDeleteSelectedButtonItem, a3);
}

- (UIBarButtonItem)permanentDeleteAllButtonItem
{
  return self->_permanentDeleteAllButtonItem;
}

- (void)setPermanentDeleteAllButtonItem:(id)a3
{
  objc_storeStrong((id *)&self->_permanentDeleteAllButtonItem, a3);
}

- (UIBarButtonItem)recoverSelectedButtonItem
{
  return self->_recoverSelectedButtonItem;
}

- (void)setRecoverSelectedButtonItem:(id)a3
{
  objc_storeStrong((id *)&self->_recoverSelectedButtonItem, a3);
}

- (UIBarButtonItem)recoverAllButtonItem
{
  return self->_recoverAllButtonItem;
}

- (void)setRecoverAllButtonItem:(id)a3
{
  objc_storeStrong((id *)&self->_recoverAllButtonItem, a3);
}

- (UIBarButtonItem)permanentDeleteSelectedJunkButtonItem
{
  return self->_permanentDeleteSelectedJunkButtonItem;
}

- (void)setPermanentDeleteSelectedJunkButtonItem:(id)a3
{
  objc_storeStrong((id *)&self->_permanentDeleteSelectedJunkButtonItem, a3);
}

- (UIBarButtonItem)permanentDeleteAllJunkButtonItem
{
  return self->_permanentDeleteAllJunkButtonItem;
}

- (void)setPermanentDeleteAllJunkButtonItem:(id)a3
{
  objc_storeStrong((id *)&self->_permanentDeleteAllJunkButtonItem, a3);
}

- (void)setSyncStatusView:(id)a3
{
  objc_storeStrong((id *)&self->_syncStatusView, a3);
}

- (BOOL)isInitialAppearance
{
  return self->_isInitialAppearance;
}

- (void)setIsInitialAppearance:(BOOL)a3
{
  self->_isInitialAppearance = a3;
}

- (BOOL)willRotate
{
  return self->_willRotate;
}

- (void)setWillRotate:(BOOL)a3
{
  self->_willRotate = a3;
}

- (CKConversation)conversationToUnpinPendingOrbDismissal
{
  return self->_conversationToUnpinPendingOrbDismissal;
}

- (void)setConversationToUnpinPendingOrbDismissal:(id)a3
{
  objc_storeStrong((id *)&self->_conversationToUnpinPendingOrbDismissal, a3);
}

- (CKConversation)conversationToPinPendingOrbDismissal
{
  return self->_conversationToPinPendingOrbDismissal;
}

- (void)setConversationToPinPendingOrbDismissal:(id)a3
{
  objc_storeStrong((id *)&self->_conversationToPinPendingOrbDismissal, a3);
}

- (CNContactStore)contactStore
{
  return self->_contactStore;
}

- (void)setContactStore:(id)a3
{
  objc_storeStrong((id *)&self->_contactStore, a3);
}

- (void)setOnboardingController:(id)a3
{
  objc_storeStrong((id *)&self->_onboardingController, a3);
}

- (void)setPinnedConversationSuggester:(id)a3
{
  objc_storeStrong((id *)&self->_pinnedConversationSuggester, a3);
}

- (BOOL)macShouldShowZKWSearch
{
  return self->_macShouldShowZKWSearch;
}

- (void)setMacShouldShowZKWSearch:(BOOL)a3
{
  self->_macShouldShowZKWSearch = a3;
}

- (void)setMacToolbarController:(id)a3
{
  objc_storeWeak((id *)&self->_macToolbarController, a3);
}

- (void)setComposeToolbarItem:(id)a3
{
  objc_storeStrong((id *)&self->_composeToolbarItem, a3);
}

- (void)setTipKitQueue:(id)a3
{
  objc_storeStrong((id *)&self->_tipKitQueue, a3);
}

- (void)setStandardCellLayout:(id)a3
{
  objc_storeStrong((id *)&self->_standardCellLayout, a3);
}

- (void)setJunkCellLayout:(id)a3
{
  objc_storeStrong((id *)&self->_junkCellLayout, a3);
}

- (BOOL)isAppearing
{
  return self->_isAppearing;
}

- (void)setIsAppearing:(BOOL)a3
{
  self->_isAppearing = a3;
}

- (CoreTelephonyClient)coreTelephonyClient
{
  return self->_coreTelephonyClient;
}

- (void)setCoreTelephonyClient:(id)a3
{
  objc_storeStrong((id *)&self->_coreTelephonyClient, a3);
}

- (UIRefreshControl)collectionViewRefreshControl
{
  return self->_collectionViewRefreshControl;
}

- (void)setCollectionViewRefreshControl:(id)a3
{
  objc_storeStrong((id *)&self->_collectionViewRefreshControl, a3);
}

- (NSTimer)refreshControlTimer
{
  return self->_refreshControlTimer;
}

- (void)setRefreshControlTimer:(id)a3
{
  objc_storeStrong((id *)&self->_refreshControlTimer, a3);
}

- (void)setOscarModal:(BOOL)a3
{
  self->_oscarModal = a3;
}

- (void)setRecentlyDeletedModal:(BOOL)a3
{
  self->_recentlyDeletedModal = a3;
}

- (BOOL)holdPinningUpdatesForOnboardingAnimation
{
  return self->_holdPinningUpdatesForOnboardingAnimation;
}

- (void)setHoldPinningUpdatesForOnboardingAnimation:(BOOL)a3
{
  self->_holdPinningUpdatesForOnboardingAnimation = a3;
}

- (BOOL)nextPinnedConversationListUpdateShouldTriggerUnanimatedSnapshotUpdate
{
  return self->_nextPinnedConversationListUpdateShouldTriggerUnanimatedSnapshotUpdate;
}

- (void)setIsShowingPinnedChatDropTarget:(BOOL)a3
{
  self->_isShowingPinnedChatDropTarget = a3;
}

- (void)setPresentedBanner:(id)a3
{
  objc_storeStrong((id *)&self->_presentedBanner, a3);
}

- (void)setBannerTopConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_bannerTopConstraint, a3);
}

- (void)setBannerHeight:(double)a3
{
  self->_bannerHeight = a3;
}

- (void)setIsShowingSwipeDeleteConfirmation:(BOOL)a3
{
  self->_isShowingSwipeDeleteConfirmation = a3;
}

- (int64_t)pinningInteractionMethod
{
  return self->_pinningInteractionMethod;
}

- (void)setPinningInteractionMethod:(int64_t)a3
{
  self->_pinningInteractionMethod = a3;
}

- (int64_t)pinnedConversationViewLayoutStyle
{
  return self->_pinnedConversationViewLayoutStyle;
}

- (void)setIsCommitingDiffableDataSourceTransaction:(BOOL)a3
{
  self->_isCommitingDiffableDataSourceTransaction = a3;
}

- (void)setBlockedSnapshotInfo:(id)a3
{
  objc_storeStrong((id *)&self->_blockedSnapshotInfo, a3);
}

- (NSMutableSet)itemIdentifiersForVisibleContextMenuInteractions
{
  return self->_itemIdentifiersForVisibleContextMenuInteractions;
}

- (void)setItemIdentifiersForVisibleContextMenuInteractions:(id)a3
{
  objc_storeStrong((id *)&self->_itemIdentifiersForVisibleContextMenuInteractions, a3);
}

- (BOOL)isCheckingIfPinningOnboardingNeeded
{
  return self->_isCheckingIfPinningOnboardingNeeded;
}

- (void)setIsCheckingIfPinningOnboardingNeeded:(BOOL)a3
{
  self->_isCheckingIfPinningOnboardingNeeded = a3;
}

- (BOOL)canShowSuggestedPinningOnboardingCell
{
  return self->_canShowSuggestedPinningOnboardingCell;
}

- (void)setCanShowSuggestedPinningOnboardingCell:(BOOL)a3
{
  self->_canShowSuggestedPinningOnboardingCell = a3;
}

- (BOOL)isCurrentlyAnimatingPinningOnboardingSuggestions
{
  return self->_isCurrentlyAnimatingPinningOnboardingSuggestions;
}

- (void)setIsCurrentlyAnimatingPinningOnboardingSuggestions:(BOOL)a3
{
  self->_isCurrentlyAnimatingPinningOnboardingSuggestions = a3;
}

- (NSArray)recommendedPinningConversations
{
  return self->_recommendedPinningConversations;
}

- (void)setRecommendedPinningConversations:(id)a3
{
  objc_storeStrong((id *)&self->_recommendedPinningConversations, a3);
}

- (CKConversationListTipManager)tipManager
{
  return self->_tipManager;
}

- (void)setTipManager:(id)a3
{
  objc_storeStrong((id *)&self->_tipManager, a3);
}

- (NSCache)cacheForLastDisplayedActivitySnapshotByConversation
{
  return self->_cacheForLastDisplayedActivitySnapshotByConversation;
}

- (void)setCacheForLastDisplayedActivitySnapshotByConversation:(id)a3
{
  objc_storeStrong((id *)&self->_cacheForLastDisplayedActivitySnapshotByConversation, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cacheForLastDisplayedActivitySnapshotByConversation, 0);
  objc_storeStrong((id *)&self->_tipManager, 0);
  objc_storeStrong((id *)&self->_recommendedPinningConversations, 0);
  objc_storeStrong((id *)&self->_itemIdentifiersForVisibleContextMenuInteractions, 0);
  objc_storeStrong((id *)&self->_blockedSnapshotInfo, 0);
  objc_storeStrong((id *)&self->_frozenConversations, 0);
  objc_storeStrong((id *)&self->_frozenPinnedConversations, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_bannerTopConstraint, 0);
  objc_storeStrong((id *)&self->_presentedBanner, 0);
  objc_storeStrong((id *)&self->_refreshControlTimer, 0);
  objc_storeStrong((id *)&self->_collectionViewRefreshControl, 0);
  objc_storeStrong((id *)&self->_coreTelephonyClient, 0);
  objc_storeStrong((id *)&self->_junkCellLayout, 0);
  objc_storeStrong((id *)&self->_standardCellLayout, 0);
  objc_storeStrong((id *)&self->_cellLayout, 0);
  objc_storeStrong((id *)&self->_tipKitQueue, 0);
  objc_storeStrong((id *)&self->_composeToolbarItem, 0);
  objc_destroyWeak((id *)&self->_macToolbarController);
  objc_storeStrong((id *)&self->_pinnedConversationSuggester, 0);
  objc_storeStrong((id *)&self->_onboardingController, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
  objc_storeStrong((id *)&self->_conversationToPinPendingOrbDismissal, 0);
  objc_storeStrong((id *)&self->_conversationToUnpinPendingOrbDismissal, 0);
  objc_storeStrong((id *)&self->_syncStatusView, 0);
  objc_storeStrong((id *)&self->_permanentDeleteAllJunkButtonItem, 0);
  objc_storeStrong((id *)&self->_permanentDeleteSelectedJunkButtonItem, 0);
  objc_storeStrong((id *)&self->_recoverAllButtonItem, 0);
  objc_storeStrong((id *)&self->_recoverSelectedButtonItem, 0);
  objc_storeStrong((id *)&self->_permanentDeleteAllButtonItem, 0);
  objc_storeStrong((id *)&self->_permanentDeleteSelectedButtonItem, 0);
  objc_storeStrong((id *)&self->_catalystFiltersNavigationBackButton, 0);
  objc_storeStrong((id *)&self->_closeButtonItem, 0);
  objc_storeStrong((id *)&self->_moveSelectedToRecentlyDeletedButtonItem, 0);
  objc_storeStrong((id *)&self->_selectAllButtonItem, 0);
  objc_storeStrong((id *)&self->_doneButtonItem, 0);
  objc_storeStrong((id *)&self->_cancelButtonItem, 0);
  objc_storeStrong((id *)&self->_optionsButtonItem, 0);
  objc_storeStrong((id *)&self->_editOscarButtonItem, 0);
  objc_storeStrong((id *)&self->_editButtonItem, 0);
  objc_storeStrong((id *)&self->_composeButtonItem, 0);
  objc_storeStrong((id *)&self->_macVirtualComposeButton, 0);
  objc_storeStrong((id *)&self->_searchResultsController, 0);
  objc_storeStrong((id *)&self->_meContact, 0);
  objc_storeStrong((id *)&self->_searchController, 0);
  objc_storeStrong((id *)&self->_noMessagesDialogView, 0);
  objc_storeStrong((id *)&self->_updater, 0);
  objc_storeStrong((id *)&self->_lastUserSelectedConversationItemIdentifier, 0);
  objc_storeStrong((id *)&self->_lastUserSelectedConversationTime, 0);
  objc_storeStrong((id *)&self->_lastSelectedConversationItemIdentifier, 0);
  objc_storeStrong((id *)&self->_conversationLayout, 0);
  objc_storeStrong((id *)&self->_prototypePinnedConversationCollectionViewCell, 0);
  objc_storeStrong((id *)&self->_deferredSearchQuery, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (id)collectionView:(id)a3 itemsForBeginningDragSession:(id)a4 atIndexPath:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  int v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (-[CKConversationListCollectionViewController editingMode](self, "editingMode") == 1)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        LOWORD(v15) = 0;
        _os_log_impl(&dword_18DFCD000, v11, OS_LOG_TYPE_INFO, "Not creating items for a new drag session as the collection view is frozen for bulk editing", (uint8_t *)&v15, 2u);
      }
LABEL_12:

      goto LABEL_13;
    }
    goto LABEL_13;
  }
  if (!-[CKConversationListCollectionViewController sectionHasActionableConversations:](self, "sectionHasActionableConversations:", objc_msgSend(v10, "section")))
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        v15 = 134217984;
        v16 = objc_msgSend(v10, "section");
        _os_log_impl(&dword_18DFCD000, v11, OS_LOG_TYPE_INFO, "Not creating items for a new drag session for a drag from a non-actionable section: %ld", (uint8_t *)&v15, 0xCu);
      }
      goto LABEL_12;
    }
LABEL_13:
    v13 = (void *)MEMORY[0x1E0C9AA60];
    goto LABEL_16;
  }
  -[CKConversationListCollectionViewController conversationAtIndexPath:](self, "conversationAtIndexPath:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    objc_msgSend(v9, "setLocalContext:", CFSTR("CKConversationListDragContext"));
    -[CKConversationListCollectionViewController _dragItemsForConversation:indexPath:inCollectionView:](self, "_dragItemsForConversation:indexPath:inCollectionView:", v12, v10, v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = (void *)MEMORY[0x1E0C9AA60];
  }

LABEL_16:
  return v13;
}

- (id)collectionView:(id)a3 itemsForAddingToDragSession:(id)a4 atIndexPath:(id)a5 point:(CGPoint)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  NSObject *v16;
  NSObject *v18;
  int v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!objc_msgSend(v10, "hasItemsConformingToTypeIdentifiers:", &unk_1E286FB50))
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        LOWORD(v19) = 0;
        _os_log_impl(&dword_18DFCD000, v16, OS_LOG_TYPE_INFO, "Not creating additional drag items for a non-conversation pinning drag session", (uint8_t *)&v19, 2u);
      }
      goto LABEL_17;
    }
    goto LABEL_18;
  }
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "conversationPinningMultiDragEnabled");

  if ((v13 & 1) == 0)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        LOWORD(v19) = 0;
        _os_log_impl(&dword_18DFCD000, v16, OS_LOG_TYPE_INFO, "User attempted to add drag items to an existing pinning drag session. This is not permitted.", (uint8_t *)&v19, 2u);
      }
      goto LABEL_17;
    }
LABEL_18:
    v15 = (void *)MEMORY[0x1E0C9AA60];
    goto LABEL_19;
  }
  if (!-[CKConversationListCollectionViewController sectionHasActionableConversations:](self, "sectionHasActionableConversations:", objc_msgSend(v11, "section")))
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        v19 = 134217984;
        v20 = objc_msgSend(v11, "section");
        _os_log_impl(&dword_18DFCD000, v16, OS_LOG_TYPE_INFO, "Not creating items to addd to a drag session for a drag from a non-actionable section: %ld", (uint8_t *)&v19, 0xCu);
      }
LABEL_17:

      goto LABEL_18;
    }
    goto LABEL_18;
  }
  -[CKConversationListCollectionViewController conversationAtIndexPath:](self, "conversationAtIndexPath:", v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    -[CKConversationListCollectionViewController _dragItemsForConversation:indexPath:inCollectionView:](self, "_dragItemsForConversation:indexPath:inCollectionView:", v14, v11, v9);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        LOWORD(v19) = 0;
        _os_log_impl(&dword_18DFCD000, v18, OS_LOG_TYPE_INFO, "Could not find conversation to add drag items to drag session", (uint8_t *)&v19, 2u);
      }

    }
    v15 = (void *)MEMORY[0x1E0C9AA60];
  }

LABEL_19:
  return v15;
}

- (id)_dragItemsForConversation:(id)a3 indexPath:(id)a4 inCollectionView:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v18;
  uint64_t v19;
  id (*v20)(uint64_t);
  void *v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  _BYTE buf[12];
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_alloc_init(MEMORY[0x1E0CB36C8]);
  objc_msgSend(v11, "registerObject:visibility:", v8, 3);
  objc_msgSend(v8, "activityForNewSceneCreatedViaDrag:", 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v12, "userInfo");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)&buf[4] = v12;
        v27 = 2112;
        v28 = v14;
        _os_log_impl(&dword_18DFCD000, v13, OS_LOG_TYPE_INFO, "Creating conversation list drag item with user activity: %@, userInfo: %@", buf, 0x16u);

      }
    }
    objc_msgSend(v11, "registerObject:visibility:", v12, 1);
  }
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA558]), "initWithItemProvider:", v11);
  objc_msgSend(v15, "setLocalObject:", v8);
  if (-[CKConversationListCollectionViewController _shouldUsePreviewProviderForDragItemAtIndexPath:](self, "_shouldUsePreviewProviderForDragItemAtIndexPath:", v9))
  {
    *(_QWORD *)buf = 0;
    objc_initWeak((id *)buf, self);
    v18 = MEMORY[0x1E0C809B0];
    v19 = 3221225472;
    v20 = __112__CKConversationListCollectionViewController_DragAndDrop___dragItemsForConversation_indexPath_inCollectionView___block_invoke;
    v21 = &unk_1E2758B90;
    objc_copyWeak(&v24, (id *)buf);
    v22 = v8;
    v23 = v10;
    objc_msgSend(v15, "setPreviewProvider:", &v18);

    objc_destroyWeak(&v24);
    objc_destroyWeak((id *)buf);
  }
  v25 = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v25, 1, v18, v19, v20, v21);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

id __112__CKConversationListCollectionViewController_DragAndDrop___dragItemsForConversation_indexPath_inCollectionView___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "dragPreviewViewForPinnedConversation:inCollectionView:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_alloc_init(MEMORY[0x1E0CEA568]);
  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v5);

  objc_msgSend(MEMORY[0x1E0CEA390], "bezierPath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setShadowPath:", v6);

  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA560]), "initWithView:parameters:", v3, v4);
  return v7;
}

- (BOOL)_shouldUsePreviewProviderForDragItemAtIndexPath:(id)a3
{
  id v3;
  BOOL v4;

  v3 = a3;
  if (CKIsRunningInMacCatalyst())
    v4 = 1;
  else
    v4 = objc_msgSend(v3, "section") != 2;

  return v4;
}

- (id)dragPreviewViewForPinnedConversation:(id)a3 inCollectionView:(id)a4
{
  id v6;
  id v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  CKPinnedConversationView *v17;
  void *v18;

  v6 = a4;
  v7 = a3;
  -[CKConversationListCollectionViewController _snapshotOfAvatarViewForConversation:](self, "_snapshotOfAvatarViewForConversation:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  v10 = v9;
  v12 = v11;

  -[CKConversationListCollectionViewController conversationLayout](self, "conversationLayout");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "widthForPinnedConversationCellInCollectionViewOfSize:numberOfItems:", objc_msgSend(v14, "maximumNumberOfPinnedConversations"), v10, v12);
  v16 = v15;

  v17 = -[CKPinnedConversationView initWithFrame:]([CKPinnedConversationView alloc], "initWithFrame:", 0.0, 0.0, v16, v16);
  -[CKPinnedConversationView setShowsLiveActivity:](v17, "setShowsLiveActivity:", 0);
  -[CKPinnedConversationView setConversation:](v17, "setConversation:", v7);

  -[CKPinnedConversationView setAvatarSnapshot:](v17, "setAvatarSnapshot:", v8);
  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKPinnedConversationView setBackgroundColor:](v17, "setBackgroundColor:", v18);

  -[CKPinnedConversationView setLayoutStyle:](v17, "setLayoutStyle:", -[CKConversationListCollectionViewController pinnedConversationViewLayoutStyle](self, "pinnedConversationViewLayoutStyle"));
  -[CKPinnedConversationView sizeToFit](v17, "sizeToFit");

  return v17;
}

- (id)_snapshotOfAvatarViewForConversation:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  CGFloat v15;
  CGFloat v16;
  CGSize v18;

  v4 = a3;
  if (objc_msgSend(v4, "isPinned"))
    v5 = 2;
  else
    v5 = 5;
  -[CKConversationListCollectionViewController itemIdentifierForConversation:inSection:](self, "itemIdentifierForConversation:inSection:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[CKConversationListCollectionViewController dataSource](self, "dataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "indexPathForItemIdentifier:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[CKConversationListCollectionViewController collectionView](self, "collectionView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "cellForItemAtIndexPath:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v10, "pinnedConversationView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "avatarView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v14 = 0;
LABEL_16:

        goto LABEL_17;
      }
      objc_msgSend(v10, "avatarView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }

    if (v12)
    {
      objc_msgSend(v12, "contentImage");
      v13 = objc_claimAutoreleasedReturnValue();
      if (v13)
      {
        v14 = (void *)v13;
      }
      else
      {
        objc_msgSend(v12, "bounds");
        v18.width = v15;
        v18.height = v16;
        UIGraphicsBeginImageContextWithOptions(v18, 0, 0.0);
        objc_msgSend(v12, "bounds");
        objc_msgSend(v12, "drawViewHierarchyInRect:afterScreenUpdates:", 1);
        UIGraphicsGetImageFromCurrentImageContext();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        UIGraphicsEndImageContext();
      }
      v10 = v12;
      goto LABEL_16;
    }
  }
  v14 = 0;
LABEL_17:

  return v14;
}

- (id)dragOrDropPreviewParametersForItemAtIndexPath:(id)a3 inCollectionView:(id)a4
{
  id v4;
  void *v5;
  void *v6;

  if (objc_msgSend(a3, "section") == 2)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0CEA568]);
    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setBackgroundColor:", v5);

    objc_msgSend(MEMORY[0x1E0CEA390], "bezierPath");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setShadowPath:", v6);

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)collectionView:(id)a3 dropPreviewParametersForItemAtIndexPath:(id)a4
{
  return -[CKConversationListCollectionViewController dragOrDropPreviewParametersForItemAtIndexPath:inCollectionView:](self, "dragOrDropPreviewParametersForItemAtIndexPath:inCollectionView:", a4, a3);
}

- (id)collectionView:(id)a3 dragPreviewParametersForItemAtIndexPath:(id)a4
{
  return -[CKConversationListCollectionViewController dragOrDropPreviewParametersForItemAtIndexPath:inCollectionView:](self, "dragOrDropPreviewParametersForItemAtIndexPath:inCollectionView:", a4, a3);
}

- (unint64_t)_destinationSectionForDropSession:(id)a3 destinationIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  unint64_t v17;
  NSObject *v18;
  uint8_t v20[16];

  v6 = a3;
  v7 = a4;
  -[CKConversationListCollectionViewController dataSource](self, "dataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "snapshot");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "numberOfItemsInSection:", &unk_1E2870D38);

  if (v7 && objc_msgSend(v7, "section") == 2 && objc_msgSend(v7, "item") <= v10)
  {
    v17 = 2;
  }
  else
  {
    -[CKConversationListCollectionViewController _conversationsFromLocalDropSession:](self, "_conversationsFromLocalDropSession:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKConversationListCollectionViewController yCoordinateForBorderBetweenPinnedAndActiveSectionExcludingConversations:](self, "yCoordinateForBorderBetweenPinnedAndActiveSectionExcludingConversations:", v11);
    if (v12 == 0.0)
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v20 = 0;
          _os_log_impl(&dword_18DFCD000, v18, OS_LOG_TYPE_INFO, "Could not determine destinationSectionForDropSession", v20, 2u);
        }

      }
      v17 = 5;
    }
    else
    {
      v13 = v12;
      -[CKConversationListCollectionViewController collectionView](self, "collectionView");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "locationInView:", v14);
      v16 = v15;

      if (v16 <= v13)
        v17 = 2;
      else
        v17 = 5;
    }

  }
  return v17;
}

- (id)collectionView:(id)a3 dropSessionDidUpdate:(id)a4 withDestinationIndexPath:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  int v16;
  id v17;
  uint64_t v18;
  void *v19;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(v9, "hasItemsConformingToTypeIdentifiers:", &unk_1E286FB68))
  {
    -[CKConversationListCollectionViewController _conversationDropProposalForCollectionView:dropSession:withDestinationIndexPath:](self, "_conversationDropProposalForCollectionView:dropSession:withDestinationIndexPath:", v8, v9, v10);
    v11 = objc_claimAutoreleasedReturnValue();
LABEL_9:
    v19 = (void *)v11;
    goto LABEL_10;
  }
  v21[0] = *MEMORY[0x1E0CA5BA0];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v9, "hasItemsConformingToTypeIdentifiers:", v12);

  if (!v13)
  {
    v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEA448]), "initWithDropOperation:", 0);
    goto LABEL_9;
  }
  -[CKConversationListCollectionViewController conversationAtIndexPath:](self, "conversationAtIndexPath:", v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "unsentComposition");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "isAudioComposition");
  v17 = objc_alloc(MEMORY[0x1E0CEA448]);
  if (v16)
    v18 = 0;
  else
    v18 = 2;
  v19 = (void *)objc_msgSend(v17, "initWithDropOperation:intent:", v18, 2);

LABEL_10:
  return v19;
}

- (id)_conversationDropProposalForCollectionView:(id)a3 dropSession:(id)a4 withDestinationIndexPath:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  unint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  unint64_t v22;
  void *v23;
  _BOOL4 v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t j;
  NSObject *v30;
  NSObject *v31;
  uint64_t v32;
  NSObject *v33;
  void *v34;
  NSObject *v35;
  NSObject *v36;
  _BOOL4 v37;
  int v38;
  NSObject *v39;
  uint64_t v40;
  uint64_t v41;
  NSObject *v42;
  NSObject *v43;
  id v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  uint8_t v54[128];
  uint8_t buf[4];
  uint64_t v56;
  __int16 v57;
  uint64_t v58;
  _BYTE v59[128];
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v45 = a3;
  v8 = a4;
  v9 = a5;
  -[CKConversationListCollectionViewController _conversationsFromLocalDropSession:](self, "_conversationsFromLocalDropSession:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_alloc_init(MEMORY[0x1E0C99E10]);
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  v12 = v10;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v50, v59, 16);
  if (v13)
  {
    v14 = *(_QWORD *)v51;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v51 != v14)
          objc_enumerationMutation(v12);
        objc_msgSend(*(id *)(*((_QWORD *)&v50 + 1) + 8 * i), "pinningIdentifier");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v16, "length"))
          objc_msgSend(v11, "addObject:", v16);

      }
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v50, v59, 16);
    }
    while (v13);
  }

  -[CKConversationListCollectionViewController pinnedConversationIdentifiers](self, "pinnedConversationIdentifiers");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[CKConversationListCollectionViewController _destinationSectionForDropSession:destinationIndexPath:](self, "_destinationSectionForDropSession:destinationIndexPath:", v8, v9);
  if (v18 == 5)
  {
    v48 = 0u;
    v49 = 0u;
    v46 = 0u;
    v47 = 0u;
    v26 = v11;
    v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
    if (v27)
    {
      v28 = *(_QWORD *)v47;
      while (2)
      {
        for (j = 0; j != v27; ++j)
        {
          if (*(_QWORD *)v47 != v28)
            objc_enumerationMutation(v26);
          if ((objc_msgSend(v17, "containsObject:", *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * j)) & 1) != 0)
          {

            if (IMOSLoggingEnabled())
            {
              OSLogHandleForIMFoundationCategory();
              v33 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_18DFCD000, v33, OS_LOG_TYPE_INFO, "Dragging pinned conversation to the non pinned section, returning unspecific move drop proposal", buf, 2u);
              }

            }
            goto LABEL_36;
          }
        }
        v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
        if (v27)
          continue;
        break;
      }
    }

    if ((IMOSLoggingEnabled() & 1) != 0)
    {
      OSLogHandleForIMFoundationCategory();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18DFCD000, v30, OS_LOG_TYPE_INFO, "Dragging unpinned conversations over the unpinned section, return unspecified move drop proposal to work around collection view issue, should be cancel", buf, 2u);
      }

    }
LABEL_36:
    v32 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEA448]), "initWithDropOperation:intent:", 3, 0);
  }
  else
  {
    if (v18 == 2)
    {
      v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E10]), "initWithArray:", v17);
      objc_msgSend(v11, "array");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "removeObjectsInArray:", v20);

      objc_msgSend(v11, "array");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "addObjectsFromArray:", v21);

      v22 = objc_msgSend(v19, "count");
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v22 > objc_msgSend(v23, "maximumNumberOfPinnedConversations");

      if (v24)
      {
        v25 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEA448]), "initWithDropOperation:intent:", 1, 0);
      }
      else
      {
        if ((unint64_t)objc_msgSend(v12, "count") < 2)
        {
          if (-[CKConversationListCollectionViewController isShowingPinnedChatDropTarget](self, "isShowingPinnedChatDropTarget"))
          {
            if (IMOSLoggingEnabled())
            {
              OSLogHandleForIMFoundationCategory();
              v36 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_18DFCD000, v36, OS_LOG_TYPE_INFO, "Dragging item to the drop target, returning unspecified move drop proposal", buf, 2u);
              }

            }
          }
          else if (v9)
          {
            v37 = objc_msgSend(v9, "section") == 2;
            v38 = IMOSLoggingEnabled();
            if (v37)
            {
              if (v38)
              {
                OSLogHandleForIMFoundationCategory();
                v39 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
                {
                  v40 = objc_msgSend(v9, "section");
                  v41 = objc_msgSend(v9, "item");
                  *(_DWORD *)buf = 134218240;
                  v56 = v40;
                  v57 = 2048;
                  v58 = v41;
                  _os_log_impl(&dword_18DFCD000, v39, OS_LOG_TYPE_INFO, "Dragging item to a specific location in the pinned section (%ld,%ld), returning InsertAtDestinationIndexPath drop proposal", buf, 0x16u);
                }

              }
              v25 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEA448]), "initWithDropOperation:intent:", 3, 1);
              goto LABEL_67;
            }
            if (v38)
            {
              OSLogHandleForIMFoundationCategory();
              v43 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_18DFCD000, v43, OS_LOG_TYPE_INFO, "Dragging item to pinned section with an invalid destination index path, returning unspecified move drop proposal", buf, 2u);
              }

            }
          }
          else if (IMOSLoggingEnabled())
          {
            OSLogHandleForIMFoundationCategory();
            v42 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_18DFCD000, v42, OS_LOG_TYPE_INFO, "Dragging item to pinned section without a valid destination index path, returning unspecified move drop proposal", buf, 2u);
            }

          }
        }
        else if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v35 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_18DFCD000, v35, OS_LOG_TYPE_INFO, "Dragging multiple items to the pinned section, returning unspecified move drop proposal", buf, 2u);
          }

        }
        v25 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEA448]), "initWithDropOperation:intent:", 3, 0);
      }
LABEL_67:
      v34 = (void *)v25;

      goto LABEL_68;
    }
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18DFCD000, v31, OS_LOG_TYPE_INFO, "Dragging conversations to a secion other than the pinned or list section, returning UIDropOperationCancel proposal", buf, 2u);
      }

    }
    v32 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEA448]), "initWithDropOperation:intent:", 0, 0);
  }
  v34 = (void *)v32;
LABEL_68:
  objc_msgSend(v34, "setPrefersFullSizePreview:", 1);

  return v34;
}

- (BOOL)_isDropForSession:(id)a3 toLeadingEdgeOfView:(id)a4
{
  id v5;
  double v6;
  double v7;
  double MidX;
  CGRect v10;

  v5 = a4;
  objc_msgSend(a3, "locationInView:", v5);
  v7 = v6;
  objc_msgSend(v5, "bounds");
  MidX = CGRectGetMidX(v10);
  LODWORD(a3) = objc_msgSend(v5, "_shouldReverseLayoutDirection");

  if ((_DWORD)a3)
    return v7 > MidX;
  else
    return v7 < MidX;
}

- (void)collectionView:(id)a3 dropSessionDidEnter:(id)a4
{
  if (objc_msgSend(a4, "hasItemsConformingToTypeIdentifiers:", &unk_1E286FB80))
  {
    -[CKConversationListCollectionViewController setHasActivePinnedConversationDropSession:](self, "setHasActivePinnedConversationDropSession:", 1);
    -[CKConversationListCollectionViewController _updateLargeTitleDisplayModeWithAnimation:](self, "_updateLargeTitleDisplayModeWithAnimation:", 1);
    if (!-[CKConversationListCollectionViewController numberOfPinnedConversations](self, "numberOfPinnedConversations"))
    {
      if (-[CKConversationListCollectionViewController shouldShowPinnedConversations](self, "shouldShowPinnedConversations"))
      {
        -[CKConversationListCollectionViewController setIsShowingPinnedChatDropTarget:](self, "setIsShowingPinnedChatDropTarget:", 1);
        -[CKConversationListCollectionViewController updateSnapshotAnimatingDifferences:](self, "updateSnapshotAnimatingDifferences:", 1);
      }
    }
  }
}

- (void)collectionView:(id)a3 dropSessionDidExit:(id)a4
{
  -[CKConversationListCollectionViewController setIsShowingPinnedChatDropTarget:](self, "setIsShowingPinnedChatDropTarget:", 0, a4);
  -[CKConversationListCollectionViewController updateSnapshotAnimatingDifferences:](self, "updateSnapshotAnimatingDifferences:", 1);
}

- (void)collectionView:(id)a3 dropSessionDidEnd:(id)a4
{
  if (objc_msgSend(a4, "hasItemsConformingToTypeIdentifiers:", &unk_1E286FB98))
  {
    -[CKConversationListCollectionViewController setHasActivePinnedConversationDropSession:](self, "setHasActivePinnedConversationDropSession:", 0);
    if (-[CKConversationListCollectionViewController isShowingPinnedChatDropTarget](self, "isShowingPinnedChatDropTarget"))
    {
      -[CKConversationListCollectionViewController setIsShowingPinnedChatDropTarget:](self, "setIsShowingPinnedChatDropTarget:", 0);
      -[CKConversationListCollectionViewController _updateLargeTitleDisplayModeWithAnimation:](self, "_updateLargeTitleDisplayModeWithAnimation:", 1);
      -[CKConversationListCollectionViewController updateSnapshotAnimatingDifferences:](self, "updateSnapshotAnimatingDifferences:", 0);
    }
    else
    {
      -[CKConversationListCollectionViewController _updateLargeTitleDisplayModeWithAnimation:](self, "_updateLargeTitleDisplayModeWithAnimation:", 1);
    }
  }
}

- (BOOL)collectionView:(id)a3 canHandleDropSession:(id)a4
{
  id v4;
  char v5;
  void *v6;
  char v7;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v4 = a4;
  v5 = objc_msgSend(v4, "hasItemsConformingToTypeIdentifiers:", &unk_1E286FBB0);
  v9[0] = *MEMORY[0x1E0CA5BA0];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "hasItemsConformingToTypeIdentifiers:", v6);

  LOBYTE(v6) = objc_msgSend(MEMORY[0x1E0D39B18], "dropSessionIsRepositioningSticker:", v4);
  return (v5 | v7) & ~(_BYTE)v6;
}

- (id)_conversationFromDragItem:(id)a3
{
  void *v3;
  id v4;

  objc_msgSend(a3, "localObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;

  return v4;
}

- (id)_conversationsFromLocalDropSession:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "localDragSession");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "items");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v7);
        -[CKConversationListCollectionViewController _conversationFromDragItem:](self, "_conversationFromDragItem:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v11), (_QWORD)v15);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
          objc_msgSend(v6, "addObject:", v12);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v9);
  }

  v13 = (void *)objc_msgSend(v6, "copy");
  return v13;
}

- (id)_conversationAfterDropDestination:(id)a3 fromDiffableDataSource:(id)a4 snapshot:(id)a5 excludingDraggedConversation:(id)a6
{
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  char v28;
  void *v30;
  void *v31;
  CKConversationListCollectionViewController *v32;
  void *v33;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  v13 = objc_msgSend(a5, "numberOfItemsInSection:", &unk_1E2870D38);
  if (objc_msgSend(v12, "isPinned"))
    v14 = 2;
  else
    v14 = 5;
  v32 = self;
  v33 = v12;
  -[CKConversationListCollectionViewController itemIdentifierForConversation:inSection:](self, "itemIdentifierForConversation:inSection:", v12, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    objc_msgSend(v11, "indexPathForItemIdentifier:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (v16)
    {
      if (objc_msgSend(v16, "section") == 2)
      {
        v18 = objc_msgSend(v17, "item");
        if (v18 < objc_msgSend(v10, "item"))
        {
          v19 = objc_msgSend(v10, "item") + 1;
          goto LABEL_11;
        }
      }
    }
  }
  else
  {
    v17 = 0;
  }
  v19 = objc_msgSend(v10, "item");
LABEL_11:
  if (v19 >= v13)
  {
    v25 = 0;
  }
  else
  {
    v30 = v17;
    v31 = v15;
    while (1)
    {
      v20 = v13;
      v21 = v10;
      objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v19, objc_msgSend(v10, "section", v30, v31));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = v11;
      objc_msgSend(v11, "itemIdentifierForIndexPath:", v22);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKConversationListCollectionViewController conversationForItemIdentifier:](v32, "conversationForItemIdentifier:", v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "pinningIdentifier");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "pinningIdentifier");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v26, "isEqualToString:", v27);

      if ((v28 & 1) == 0)
        break;

      ++v19;
      v13 = v20;
      v10 = v21;
      v11 = v23;
      if (v20 == v19)
      {
        v25 = 0;
        goto LABEL_18;
      }
    }

    v10 = v21;
    v11 = v23;
LABEL_18:
    v17 = v30;
    v15 = v31;
  }

  return v25;
}

- (void)collectionView:(id)a3 performDropWithCoordinator:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  int v13;
  uint8_t v14[16];
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v14 = 0;
      _os_log_impl(&dword_18DFCD000, v8, OS_LOG_TYPE_INFO, "Performing drop using non-diffable reordering (performDropWithCoordinator:)", v14, 2u);
    }

  }
  objc_msgSend(v7, "session");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "hasItemsConformingToTypeIdentifiers:", &unk_1E286FBC8);

  if (v10)
  {
    -[CKConversationListCollectionViewController _performConversationDropWithCollectionView:dropCoordinator:](self, "_performConversationDropWithCollectionView:dropCoordinator:", v6, v7);
  }
  else
  {
    objc_msgSend(v7, "session");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = *MEMORY[0x1E0CA5BA0];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v11, "hasItemsConformingToTypeIdentifiers:", v12);

    if (v13)
      -[CKConversationListCollectionViewController _performItemDropWithCollectionView:dropCoordinator:](self, "_performItemDropWithCollectionView:dropCoordinator:", v6, v7);
  }

}

- (void)_performConversationDropWithCollectionView:(id)a3 dropCoordinator:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  uint64_t v19;
  void *v20;
  unint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  BOOL v25;
  void *v26;
  char v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  BOOL v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t j;
  uint64_t v42;
  void *v43;
  void *v44;
  CKConversationListCollectionViewController *v45;
  unint64_t v46;
  void *v47;
  id v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  id v53;
  void *v54;
  void *v55;
  void *v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  _QWORD v61[5];
  id v62;
  _QWORD v63[5];
  id v64;
  id v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  _BYTE v70[128];
  void *v71;
  _BYTE v72[128];
  uint64_t v73;

  v73 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "proposal");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "operation");

  if (v9 != 3)
    goto LABEL_40;
  objc_msgSend(v7, "session");
  v10 = objc_claimAutoreleasedReturnValue();
  -[CKConversationListCollectionViewController _conversationsFromLocalDropSession:](self, "_conversationsFromLocalDropSession:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_alloc_init(MEMORY[0x1E0C99E10]);
  v66 = 0u;
  v67 = 0u;
  v68 = 0u;
  v69 = 0u;
  v13 = v11;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v66, v72, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v67;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v67 != v16)
          objc_enumerationMutation(v13);
        objc_msgSend(*(id *)(*((_QWORD *)&v66 + 1) + 8 * i), "pinningIdentifier");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v18, "length"))
          objc_msgSend(v12, "addObject:", v18);

      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v66, v72, 16);
    }
    while (v15);
  }
  v53 = v6;

  objc_msgSend(v7, "destinationIndexPath");
  v19 = v10;
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = -[CKConversationListCollectionViewController _destinationSectionForDropSession:destinationIndexPath:](self, "_destinationSectionForDropSession:destinationIndexPath:", v10);
  -[CKConversationListCollectionViewController dataSource](self, "dataSource");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "snapshot");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKPinnedConversationDropTargetCollectionViewCell uniqueIdentifier](CKPinnedConversationDropTargetCollectionViewCell, "uniqueIdentifier");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v71 = v23;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v71, 1);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = v22;
  objc_msgSend(v22, "deleteItemsWithIdentifiers:", v24);

  v25 = -[CKConversationListCollectionViewController isShowingPinnedChatDropTarget](self, "isShowingPinnedChatDropTarget");
  -[CKConversationListCollectionViewController setIsShowingPinnedChatDropTarget:](self, "setIsShowingPinnedChatDropTarget:", 0);
  v52 = v13;
  if (v21 == 5)
  {
    v61[0] = MEMORY[0x1E0C809B0];
    v61[1] = 3221225472;
    v61[2] = __118__CKConversationListCollectionViewController_DragAndDrop___performConversationDropWithCollectionView_dropCoordinator___block_invoke_2;
    v61[3] = &unk_1E274C4F8;
    v61[4] = self;
    v62 = v22;
    objc_msgSend(v13, "enumerateObjectsUsingBlock:", v61);

    v26 = (void *)v19;
  }
  else
  {
    v26 = (void *)v19;
    if (v21 == 2)
    {
      v27 = objc_msgSend(v13, "count") != 1 || v25;
      if ((v27 & 1) != 0)
      {
LABEL_17:
        v28 = 0;
LABEL_29:
        v63[0] = MEMORY[0x1E0C809B0];
        v63[1] = 3221225472;
        v63[2] = __118__CKConversationListCollectionViewController_DragAndDrop___performConversationDropWithCollectionView_dropCoordinator___block_invoke;
        v63[3] = &unk_1E2758BB8;
        v63[4] = self;
        v64 = v54;
        v65 = v28;
        v35 = v28;
        objc_msgSend(v13, "enumerateObjectsWithOptions:usingBlock:", 2, v63);

        goto LABEL_30;
      }
      if (v20 && objc_msgSend(v20, "section") == 2)
      {
        objc_msgSend(v13, "firstObject");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        -[CKConversationListCollectionViewController _conversationAfterDropDestination:fromDiffableDataSource:snapshot:excludingDraggedConversation:](self, "_conversationAfterDropDestination:fromDiffableDataSource:snapshot:excludingDraggedConversation:", v20, v56, v54, v29);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v30 = objc_msgSend(v54, "numberOfItemsInSection:", &unk_1E2870D38);
        -[CKConversationListCollectionViewController conversationLayout](self, "conversationLayout");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = objc_msgSend(v31, "numberOfPinnedConversationColumnsForLayoutStyle:", -[CKConversationListCollectionViewController pinnedConversationViewLayoutStyle](self, "pinnedConversationViewLayoutStyle"));

        v28 = 0;
        if (v30 < 1)
        {
          v13 = v52;
          goto LABEL_29;
        }
        v33 = v30 < v32;
        v13 = v52;
        if (!v33)
          goto LABEL_29;
        if (!-[CKConversationListCollectionViewController _isDropForSession:toLeadingEdgeOfView:](self, "_isDropForSession:toLeadingEdgeOfView:", v19, v53))goto LABEL_17;
        objc_msgSend(v54, "itemIdentifiersInSectionWithIdentifier:", &unk_1E2870D38);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "firstObject");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        -[CKConversationListCollectionViewController conversationForItemIdentifier:](self, "conversationForItemIdentifier:", v34);
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        v13 = v52;
      }

      goto LABEL_29;
    }
  }
LABEL_30:
  v50 = v12;
  v51 = v26;
  -[CKConversationListCollectionViewController commitPinnedConversationsFromSnapshot:](self, "commitPinnedConversationsFromSnapshot:", v54, v20);
  v59 = 0u;
  v60 = 0u;
  v57 = 0u;
  v58 = 0u;
  v55 = v7;
  objc_msgSend(v7, "session");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "items");
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v57, v70, 16);
  if (v38)
  {
    v39 = v38;
    v40 = *(_QWORD *)v58;
    do
    {
      for (j = 0; j != v39; ++j)
      {
        if (*(_QWORD *)v58 != v40)
          objc_enumerationMutation(v37);
        v42 = *(_QWORD *)(*((_QWORD *)&v57 + 1) + 8 * j);
        -[CKConversationListCollectionViewController _conversationFromDragItem:](self, "_conversationFromDragItem:", v42);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        if (v43)
        {
          -[CKConversationListCollectionViewController itemIdentifierForConversation:inSection:](self, "itemIdentifierForConversation:inSection:", v43, v21);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v56, "indexPathForItemIdentifier:", v44);
          v45 = self;
          v46 = v21;
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          v48 = (id)objc_msgSend(v55, "dropItem:toItemAtIndexPath:", v42, v47);

          v21 = v46;
          self = v45;

        }
      }
      v39 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v57, v70, 16);
    }
    while (v39);
  }

  v6 = v53;
  v7 = v55;
LABEL_40:

}

void __118__CKConversationListCollectionViewController_DragAndDrop___performConversationDropWithCollectionView_dropCoordinator___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "itemIdentifierForConversation:inSection:", v3, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "itemIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v4);

  v7 = *(void **)(a1 + 32);
  if (v6)
  {
    objc_msgSend(v7, "setNextPinnedConversationListUpdateShouldTriggerUnanimatedSnapshotUpdate:", 1);
    v8 = *(_QWORD *)(a1 + 48);
    if (v8)
    {
      objc_msgSend(*(id *)(a1 + 32), "itemIdentifierForConversation:inSection:", v8, 2);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "moveItemWithIdentifier:beforeItemWithIdentifier:", v4, v9);
    }
    else
    {
      v16 = *(void **)(a1 + 40);
      v21[0] = v4;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "appendItemsWithIdentifiers:intoSectionWithIdentifier:", v9, &unk_1E2870D38);
    }
  }
  else
  {
    objc_msgSend(v7, "itemIdentifierForConversation:inSection:", v3, 5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *(void **)(a1 + 40);
    v20 = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v20, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "deleteItemsWithIdentifiers:", v11);

    v12 = *(_QWORD *)(a1 + 48);
    if (v12)
    {
      objc_msgSend(*(id *)(a1 + 32), "itemIdentifierForConversation:inSection:", v12, 2);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = *(void **)(a1 + 40);
      v19 = v4;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v19, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "insertItemsWithIdentifiers:beforeItemWithIdentifier:", v15, v13);

    }
    else
    {
      v17 = *(void **)(a1 + 40);
      v18 = v4;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v18, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "appendItemsWithIdentifiers:intoSectionWithIdentifier:", v13, &unk_1E2870D38);
    }

  }
}

void __118__CKConversationListCollectionViewController_DragAndDrop___performConversationDropWithCollectionView_dropCoordinator___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "itemIdentifierForConversation:inSection:", a2, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 40);
  v6[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "deleteItemsWithIdentifiers:", v5);

}

- (void)didReorderConversationsWithTransaction:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint8_t v7[16];

  v4 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_18DFCD000, v5, OS_LOG_TYPE_INFO, "Performing drop using diffable reordering", v7, 2u);
    }

  }
  -[CKConversationListCollectionViewController setIsCommitingDiffableDataSourceTransaction:](self, "setIsCommitingDiffableDataSourceTransaction:", 1);
  objc_msgSend(v4, "finalSnapshot");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKConversationListCollectionViewController commitPinnedConversationsFromSnapshot:](self, "commitPinnedConversationsFromSnapshot:", v6);
  -[CKConversationListCollectionViewController setIsCommitingDiffableDataSourceTransaction:](self, "setIsCommitingDiffableDataSourceTransaction:", 0);

}

- (void)commitPinnedConversationsFromSnapshot:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(MEMORY[0x1E0D358C8], "processSupportsPinnedConversations"))
  {
    -[CKConversationListCollectionViewController pinnedConversationsFromSnapshot:](self, "pinnedConversationsFromSnapshot:", v4);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)v5;
    v7 = (void *)MEMORY[0x1E0C9AA60];
    if (v5)
      v8 = (void *)v5;
    else
      v8 = (void *)MEMORY[0x1E0C9AA60];
    v9 = v8;

    -[CKConversationListCollectionViewController pinnedConversations](self, "pinnedConversations");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v10;
    if (v10)
      v12 = (void *)v10;
    else
      v12 = v7;
    v13 = v12;

    if ((objc_msgSend(v13, "isEqualToArray:", v9) & 1) != 0)
    {
      -[CKConversationListCollectionViewController updateSnapshotAnimatingDifferences:](self, "updateSnapshotAnimatingDifferences:", 1);
    }
    else
    {
      -[CKConversationListCollectionViewController _allFrozenConversations](self, "_allFrozenConversations");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14)
      {
        -[CKConversationListCollectionViewController setFrozenPinnedConversations:](self, "setFrozenPinnedConversations:", v9);
        -[CKConversationListCollectionViewController _updateLargeTitleDisplayModeWithAnimation:](self, "_updateLargeTitleDisplayModeWithAnimation:", 1);
        -[CKConversationListCollectionViewController updateSnapshotAnimatingDifferences:](self, "updateSnapshotAnimatingDifferences:", 1);
      }
      else
      {
        -[CKConversationListCollectionViewController setPinningInteractionMethod:](self, "setPinningInteractionMethod:", 1);
        v15 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v24 = 0u;
        v25 = 0u;
        v26 = 0u;
        v27 = 0u;
        v16 = v9;
        v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
        if (v17)
        {
          v18 = v17;
          v19 = *(_QWORD *)v25;
          do
          {
            for (i = 0; i != v18; ++i)
            {
              if (*(_QWORD *)v25 != v19)
                objc_enumerationMutation(v16);
              objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * i), "chat");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v15, "addObject:", v21);

            }
            v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
          }
          while (v18);
        }

        objc_msgSend(MEMORY[0x1E0D358C8], "sharedInstance");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = (void *)objc_msgSend(v15, "copy");
        objc_msgSend(v22, "setPinnedChats:withUpdateReason:", v23, *MEMORY[0x1E0D35620]);

        v14 = 0;
      }

    }
    -[CKConversationListCollectionViewController updateContentsOfAllCellsAnimated:](self, "updateContentsOfAllCellsAnimated:", 1);

  }
}

- (void)_performItemDropWithCollectionView:(id)a3 dropCoordinator:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id location;
  _QWORD v19[4];
  id v20;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "destinationIndexPath");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[CKConversationListCollectionViewController conversationAtIndexPath:](self, "conversationAtIndexPath:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "unsentComposition");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v10, "isAudioComposition") & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "items");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = MEMORY[0x1E0C809B0];
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __110__CKConversationListCollectionViewController_DragAndDrop___performItemDropWithCollectionView_dropCoordinator___block_invoke;
      v19[3] = &unk_1E2758BE0;
      v14 = v11;
      v20 = v14;
      objc_msgSend(v12, "enumerateObjectsUsingBlock:", v19);

      location = 0;
      objc_initWeak(&location, self);
      if (objc_msgSend(v14, "count"))
      {
        v15[0] = v13;
        v15[1] = 3221225472;
        v15[2] = __110__CKConversationListCollectionViewController_DragAndDrop___performItemDropWithCollectionView_dropCoordinator___block_invoke_2;
        v15[3] = &unk_1E274D998;
        objc_copyWeak(&v17, &location);
        v16 = v8;
        +[CKComposition requestCompositionFromItemProviders:completion:](CKComposition, "requestCompositionFromItemProviders:completion:", v14, v15);

        objc_destroyWeak(&v17);
      }
      objc_destroyWeak(&location);

    }
  }

}

void __110__CKConversationListCollectionViewController_DragAndDrop___performItemDropWithCollectionView_dropCoordinator___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "dragItem");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "itemProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

void __110__CKConversationListCollectionViewController_DragAndDrop___performItemDropWithCollectionView_dropCoordinator___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD block[4];
  id v6;
  id v7;
  id v8;

  v3 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __110__CKConversationListCollectionViewController_DragAndDrop___performItemDropWithCollectionView_dropCoordinator___block_invoke_3;
  block[3] = &unk_1E274CB00;
  objc_copyWeak(&v8, (id *)(a1 + 40));
  v6 = v3;
  v7 = *(id *)(a1 + 32);
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v8);
}

void __110__CKConversationListCollectionViewController_DragAndDrop___performItemDropWithCollectionView_dropCoordinator___block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_showConversationWithComposition:atIndexPath:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)configureFocusFilterCell:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "setFocusFilterBannerDelegate:", self);
  objc_msgSend(MEMORY[0x1E0D39850], "sharedManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setIsFocusFilterEnabled:", objc_msgSend(v4, "userSwitchForFocusFilteringIsEnabled"));

  objc_msgSend(v5, "setUseFullWidthKeylines:", -[CKConversationListCollectionViewController _focusFilterBannerShouldUseFullWidthKeylines](self, "_focusFilterBannerShouldUseFullWidthKeylines"));
}

- (void)configureFocusFilterCollapsedCell:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  objc_msgSend(v4, "setFocusFilterBannerDelegate:", self);
  objc_msgSend(MEMORY[0x1E0D39850], "sharedManager");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIsFocusFilterEnabled:", objc_msgSend(v5, "userSwitchForFocusFilteringIsEnabled"));

}

- (BOOL)_focusFilterBannerShouldUseFullWidthKeylines
{
  void *v2;
  void *v3;
  BOOL v4;

  -[CKConversationListCollectionViewController dataSource](self, "dataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "snapshot");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "numberOfSections")
    && objc_msgSend(v3, "numberOfItems")
    && objc_msgSend(v3, "numberOfItemsInSection:", &unk_1E2871050) <= 0
    && (objc_msgSend(v3, "numberOfItemsInSection:", &unk_1E2871068) > 0
     || objc_msgSend(v3, "numberOfItemsInSection:", &unk_1E2871080) > 0
     || objc_msgSend(v3, "numberOfItemsInSection:", &unk_1E2871098) > 0);

  return v4;
}

- (void)focusFilterBannerEnabledStateDidChange:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  id v7;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0D39850], "sharedManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setUserSwitchForFocusFilteringIsEnabled:", v3);

  -[CKConversationListCollectionViewController collectionView](self, "collectionView");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "collectionViewLayout");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "invalidateLayout");

}

- (id)feedbackMenuElementsFor:(id)a3
{
  id v4;
  CKConversationListCollectionViewController *v5;
  void *v6;

  v4 = a3;
  v5 = self;
  CKConversationListCollectionViewController.feedbackMenuElements(for:)(v4);

  sub_18E00F31C(0, (unint64_t *)&unk_1EE109A60);
  v6 = (void *)sub_18E768AC8();
  swift_bridgeObjectRelease();
  return v6;
}

- (void)_pinActionForItemIdentifier:(NSObject *)a3 .cold.1(void *a1, char a2, NSObject *a3)
{
  const __CFString *v6;
  const __CFString *v7;
  void *v8;
  int v9;
  const __CFString *v10;
  __int16 v11;
  const __CFString *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a1, "isPinned"))
    v6 = CFSTR("YES");
  else
    v6 = CFSTR("NO");
  if ((a2 & 1) != 0)
    v7 = CFSTR("YES");
  else
    v7 = CFSTR("NO");
  objc_msgSend(a1, "chat");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 138412802;
  v10 = v6;
  v11 = 2112;
  v12 = v7;
  v13 = 2112;
  v14 = v8;
  _os_log_error_impl(&dword_18DFCD000, a3, OS_LOG_TYPE_ERROR, "conversation.isPinned == %@, but isPinned (in UI) == %@ conversation.chat: %@", (uint8_t *)&v9, 0x20u);

}

- (void)_openConversationInNewWindowActionForItemIdentifier:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_18DFCD000, v0, v1, "Unexpectedly received a nil NSUserActivity from the CKConversation instance. Not including this UIAction.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)togglePinStateForConversation:withReason:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_18DFCD000, v0, v1, "Ignoring request to toggle pin state for conversation from a process that does not support pinned conversations.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)unpinConversation:withReason:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_18DFCD000, v0, v1, "Ignoring request to unpin conversation from a process that does not support pinned conversations.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)pinConversation:withReason:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_18DFCD000, v0, v1, "Ignoring request to pin conversation from a process that does not support pinned conversations.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)_adaptiveImageGlyphWasGeneratedNotification:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_18DFCD000, a2, OS_LOG_TYPE_DEBUG, "Adding deferred update of conversation list for generated adaptive image glyph: %@", (uint8_t *)&v2, 0xCu);
}

- (void)_adaptiveImageGlyphWasGeneratedNotification:(NSObject *)a3 .cold.2(void *a1, uint64_t a2, NSObject *a3)
{
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v5 = 134218242;
  v6 = objc_msgSend(a1, "count");
  v7 = 2112;
  v8 = a2;
  _os_log_debug_impl(&dword_18DFCD000, a3, OS_LOG_TYPE_DEBUG, "Updating %ld conversations previews for generated adaptive image glyph: %@", (uint8_t *)&v5, 0x16u);
  OUTLINED_FUNCTION_1_0();
}

void __118__CKConversationListCollectionViewController__presentSatelliteConnectionBannerIfNecessaryWithConversation_withReason___block_invoke_cold_1(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "localizedDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = v3;
  _os_log_error_impl(&dword_18DFCD000, a2, OS_LOG_TYPE_ERROR, "Request Satellite error: %@", (uint8_t *)&v4, 0xCu);

  OUTLINED_FUNCTION_1_0();
}

@end
