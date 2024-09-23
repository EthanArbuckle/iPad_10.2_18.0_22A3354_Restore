@implementation CKDetailsSearchViewController

- (CKDetailsSearchViewController)initWithSearchControllerClasses:(id)a3
{
  CKDetailsSearchViewController *v3;
  CKDetailsSearchViewController *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CKDetailsSearchViewController;
  v3 = -[CKSearchViewController initWithSearchControllerClasses:](&v6, sel_initWithSearchControllerClasses_, a3);
  v4 = v3;
  if (v3)
    -[CKSearchViewController setDelegate:](v3, "setDelegate:", v3);
  return v4;
}

- (void)loadView
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  char v12;
  void *v13;
  unint64_t v14;
  _BOOL8 v15;
  _BOOL8 v16;
  void *v17;
  void *v18;
  void *v19;
  unint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  objc_super v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  -[CKDetailsSearchViewController conversation](self, "conversation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isGroupConversation");

  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  -[CKSearchViewController searchControllers](self, "searchControllers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
  if (v6)
  {
    v7 = v6;
    v8 = v4 ^ 1u;
    v9 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v32 != v9)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * i), "setSuppressAvatars:", v8);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    }
    while (v7);
  }

  v30.receiver = self;
  v30.super_class = (Class)CKDetailsSearchViewController;
  -[CKSearchViewController loadView](&v30, sel_loadView);
  if (CKIsRunningInMacCatalyst())
  {
    -[CKSearchViewController collectionView](self, "collectionView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_opt_respondsToSelector();

    if ((v12 & 1) != 0)
    {
      -[CKSearchViewController collectionView](self, "collectionView");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "_setShouldDeriveVisibleBoundsFromContainingScrollView:", 1);

    }
  }
  v14 = -[CKSearchViewController mode](self, "mode");
  v15 = v14 != 4;
  v16 = v14 == 4;
  -[CKSearchViewController collectionView](self, "collectionView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setScrollEnabled:", v16);

  -[CKSearchViewController collectionView](self, "collectionView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setShowsVerticalScrollIndicator:", CKIsRunningInMacCatalyst() == 0);

  -[CKSearchViewController collectionView](self, "collectionView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setLockContentOffset:", v15);

  v20 = -[CKSearchViewController mode](self, "mode");
  -[CKSearchViewController collectionView](self, "collectionView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "theme");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v23;
  if (v20 == 4)
    objc_msgSend(v23, "spotlightSearchBackgroundColor");
  else
    objc_msgSend(v23, "detailsCollectionViewBackgroundColor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setBackgroundColor:", v25);

  -[CKSearchViewController collectionView](self, "collectionView");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setContentInsetAdjustmentBehavior:", 2);

  -[CKSearchViewController collectionView](self, "collectionView");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setAllowsMultipleSelection:", 1);

  -[CKSearchViewController collectionView](self, "collectionView");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "collectionViewLayout");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "registerClass:forDecorationViewOfKind:", objc_opt_class(), CFSTR("backgroundDecorationView"));

}

- (void)viewDidLayoutSubviews
{
  _BOOL8 v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  double MaxY;
  void *v15;
  objc_super v16;
  CGRect v17;

  v16.receiver = self;
  v16.super_class = (Class)CKDetailsSearchViewController;
  -[CKSearchViewController viewDidLayoutSubviews](&v16, sel_viewDidLayoutSubviews);
  v3 = -[CKSearchViewController mode](self, "mode") == 4;
  -[CKSearchViewController collectionView](self, "collectionView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setScrollEnabled:", v3);

  -[CKSearchViewController collectionView](self, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "adjustedContentInset");
  v7 = v6;
  v9 = v8;
  v11 = v10;

  -[CKDetailsSearchViewController navigationController](self, "navigationController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "navigationBar");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "bounds");
  MaxY = CGRectGetMaxY(v17);

  -[CKSearchViewController collectionView](self, "collectionView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setContentInset:", MaxY, v7, v9, v11);

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CKDetailsSearchViewController;
  -[CKSearchViewController viewWillAppear:](&v10, sel_viewWillAppear_, a3);
  if (-[CKSearchViewController mode](self, "mode") == 4)
  {
    -[CKDetailsSearchViewController selectButton](self, "selectButton");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v4)
    {
      v5 = objc_alloc(MEMORY[0x1E0CEA380]);
      CKFrameworkBundle();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("SELECT"), &stru_1E276D870, CFSTR("ChatKit"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)objc_msgSend(v5, "initWithTitle:style:target:action:", v7, 0, self, sel__selectButtonTapped_);

      -[CKDetailsSearchViewController navigationItem](self, "navigationItem");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setRightBarButtonItem:", v8);

      -[CKDetailsSearchViewController setSelectButton:](self, "setSelectButton:", v8);
    }
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CKDetailsSearchViewController;
  -[CKViewController viewWillDisappear:](&v4, sel_viewWillDisappear_, a3);
  if (-[CKSearchViewController mode](self, "mode") == 4)
    -[CKDetailsSearchViewController setEditing:](self, "setEditing:", 0);
}

- (void)rekickZKWSearchForAttachmentBatchUpdate
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  +[CKSpotlightQueryUtilities detailsSearchControllers](CKSpotlightQueryUtilities, "detailsSearchControllers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKSearchViewController searchControllers](self, "searchControllers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");
  v6 = objc_msgSend(v3, "count");

  if (v5 != v6)
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v3, "count"));
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v8 = v3;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v16;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v16 != v11)
            objc_enumerationMutation(v8);
          v13 = objc_alloc_init(*(Class *)(*((_QWORD *)&v15 + 1) + 8 * v12));
          v14 = v13;
          if (v13)
          {
            objc_msgSend(v13, "setDelegate:", self, (_QWORD)v15);
            objc_msgSend(v7, "addObject:", v14);
          }

          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v10);
    }

    -[CKSearchViewController setSearchControllers:](self, "setSearchControllers:", v7);
  }
  -[CKSearchViewController _searchImmediately](self, "_searchImmediately", (_QWORD)v15);

}

- (void)reloadData
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CKDetailsSearchViewController;
  -[CKSearchViewController reloadData](&v4, sel_reloadData);
  -[CKDetailsSearchViewController detailsDelegate](self, "detailsDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "detailsSearchControllerContentDidChange:", self);

}

- (void)handleSpacePressed
{
  void *v3;
  void *v4;
  id v5;

  -[CKSearchViewController collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "indexPathsForSelectedItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  -[CKDetailsSearchViewController presentQuickLookView:](self, "presentQuickLookView:", v5);
}

- (void)presentQuickLookView:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  CKQLPreviewControllerDataSource *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;

  v4 = a3;
  if (v4)
  {
    v21 = v4;
    v5 = objc_msgSend(v4, "section");
    -[CKSearchViewController searchControllers](self, "searchControllers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectAtIndex:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "results");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectAtIndex:", objc_msgSend(v21, "row"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend((id)objc_opt_class(), "supportsQuicklookForResult:", v9))
    {
      v10 = objc_alloc_init(CKQLPreviewControllerDataSource);
      -[CKDetailsSearchViewController setQlPreviewDataSource:](self, "setQlPreviewDataSource:", v10);

      -[CKDetailsSearchViewController previewController](self, "previewController");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKDetailsSearchViewController qlPreviewDataSource](self, "qlPreviewDataSource");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setDataSource:", v12);

      -[CKDetailsSearchViewController previewController](self, "previewController");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setDelegate:", self);

      -[CKDetailsSearchViewController qlPreviewDataSource](self, "qlPreviewDataSource");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "results");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setPreviewItems:", v15);

      -[CKDetailsSearchViewController previewController](self, "previewController");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "reloadData");

      -[CKDetailsSearchViewController previewController](self, "previewController");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setCurrentPreviewItemIndex:", objc_msgSend(v21, "row"));

      -[CKDetailsSearchViewController previewController](self, "previewController");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "refreshCurrentPreviewItem");

      if (CKIsRunningInMacCatalyst())
      {
        -[CKDetailsSearchViewController previewController](self, "previewController");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "presentPreview");
      }
      else
      {
        -[CKDetailsSearchViewController navigationController](self, "navigationController");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[CKDetailsSearchViewController previewController](self, "previewController");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "pushViewController:animated:", v20, 1);

      }
    }

    v4 = v21;
  }

}

- (BOOL)wantsSpaceKeyCommandActive
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;

  -[CKSearchViewController collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "indexPathsForSelectedItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = objc_msgSend(v5, "section");
    -[CKSearchViewController searchControllers](self, "searchControllers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectAtIndex:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "results");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectAtIndex:", objc_msgSend(v5, "row"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = objc_msgSend((id)objc_opt_class(), "supportsQuicklookForResult:", v10);
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)previewController:(id)a3 transitionViewForPreviewItem:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  objc_class *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  NSObject *v16;
  id v17;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(uint64_t, void *, uint64_t, _BYTE *);
  void *v25;
  id v26;
  __int128 *p_buf;
  uint8_t v28[4];
  uint64_t v29;
  __int16 v30;
  void *v31;
  __int128 buf;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = (objc_class *)objc_opt_class();
      NSStringFromClass(v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v10;
      _os_log_impl(&dword_18DFCD000, v8, OS_LOG_TYPE_INFO, "QuickLook did request preview view for transition to item of class %@", (uint8_t *)&buf, 0xCu);

    }
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v11 = v7;
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v33 = 0x3032000000;
    v34 = __Block_byref_object_copy__75;
    v35 = __Block_byref_object_dispose__75;
    v36 = 0;
    -[CKSearchViewController searchControllers](self, "searchControllers");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = MEMORY[0x1E0C809B0];
    v23 = 3221225472;
    v24 = __80__CKDetailsSearchViewController_previewController_transitionViewForPreviewItem___block_invoke;
    v25 = &unk_1E2759EA0;
    v13 = v11;
    v26 = v13;
    p_buf = &buf;
    objc_msgSend(v12, "enumerateObjectsUsingBlock:", &v22);

    if (*(_QWORD *)(*((_QWORD *)&buf + 1) + 40))
    {
      -[CKSearchViewController collectionView](self, "collectionView", v22, v23, v24, v25);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "cellForItemAtIndexPath:", *(_QWORD *)(*((_QWORD *)&buf + 1) + 40));
      v15 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v15 = 0;
    }
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        v19 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 40);
        *(_DWORD *)v28 = 138412546;
        v29 = v19;
        v30 = 2112;
        v31 = v15;
        _os_log_impl(&dword_18DFCD000, v18, OS_LOG_TYPE_INFO, "> For an item at indexPath {%@}, we are returning preview view {%@}.", v28, 0x16u);
      }

    }
    v20 = v26;
    v17 = v15;

    _Block_object_dispose(&buf, 8);
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        LOWORD(buf) = 0;
        _os_log_impl(&dword_18DFCD000, v16, OS_LOG_TYPE_INFO, "> Item is not of type CKSpotlightQueryResult. Returning nil.", (uint8_t *)&buf, 2u);
      }

    }
    v17 = 0;
  }

  return v17;
}

void __80__CKDetailsSearchViewController_previewController_transitionViewForPreviewItem___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;

  objc_msgSend(a2, "results");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v11, "indexOfObject:", *(_QWORD *)(a1 + 32));
  if (v7 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v7, a3);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;

    *a4 = 1;
  }

}

- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4
{
  return 1;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  unint64_t v9;
  void *v10;
  _BOOL4 v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  unint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint8_t buf[4];
  id v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v42 = v7;
      _os_log_impl(&dword_18DFCD000, v8, OS_LOG_TYPE_INFO, "Did select item at index path %@", buf, 0xCu);
    }

  }
  v9 = objc_msgSend(v7, "section");
  -[CKSearchViewController searchControllers](self, "searchControllers");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v9 < objc_msgSend(v10, "count");

  if (v11)
  {
    objc_msgSend(v6, "cellForItemAtIndexPath:", v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKSearchViewController collectionView](self, "collectionView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "_ck_isEditing");

    if (v14)
    {
      -[CKDetailsSearchViewController _updateToolbar](self, "_updateToolbar");
LABEL_35:

      goto LABEL_36;
    }
    -[CKSearchViewController searchControllers](self, "searchControllers");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectAtIndex:", v9);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v16, "results");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectAtIndex:", objc_msgSend(v7, "row"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (!CKIsRunningInMacCatalyst()
      || !objc_msgSend((id)objc_opt_class(), "supportsMacSelection"))
    {
      v31 = objc_msgSend(v7, "row");
      objc_msgSend(v16, "results");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v31) = v31 < objc_msgSend(v32, "count");

      if ((_DWORD)v31)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v12, "linkMetadata");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "setLinkMetadata:", v33);

        }
        if ((objc_msgSend(v16, "handleSelectionForResult:", v18) & 1) == 0
          && objc_msgSend((id)objc_opt_class(), "supportsMenuInteraction"))
        {
          objc_msgSend(v16, "previewViewControllerForResult:", v18);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          if (v34)
          {
            if (objc_msgSend((id)objc_opt_class(), "previewControllerPresentsModally"))
              -[CKDetailsSearchViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v34, 1, 0);
            else
              -[CKDetailsSearchViewController _presentResult:withFullScreenViewController:](self, "_presentResult:withFullScreenViewController:", v18, v34);
          }

        }
      }
      goto LABEL_34;
    }
    -[CKDetailsSearchViewController lastUserSelectedCellTime](self, "lastUserSelectedCellTime");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v19)
      goto LABEL_33;
    -[CKDetailsSearchViewController lastUserSelectedCell](self, "lastUserSelectedCell");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v12, "isEqual:", v20);

    if (!v21
      || (-[CKDetailsSearchViewController lastUserSelectedCellTime](self, "lastUserSelectedCellTime"),
          v22 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v22, "timeIntervalSinceNow"),
          v24 = v23,
          v22,
          fabs(v24) >= cellDoubleClickInterval()))
    {
LABEL_33:
      objc_msgSend(MEMORY[0x1E0C99D68], "date", v39);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKDetailsSearchViewController setLastUserSelectedCellTime:](self, "setLastUserSelectedCellTime:", v38);

      -[CKDetailsSearchViewController setLastUserSelectedCell:](self, "setLastUserSelectedCell:", v12);
LABEL_34:

      goto LABEL_35;
    }
    objc_msgSend(v18, "item");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "attributeSet");
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v26, "messageType");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v40, "isEqualToString:", CFSTR("lnk")))
    {
      objc_msgSend(v18, "item");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "attributeSet");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "URL");
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      if (v29)
      {
        objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "openURL:withCompletionHandler:", v29, 0);
LABEL_31:

      }
    }
    else
    {
      objc_msgSend(v26, "contentURL");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      if (v29)
      {
        -[CKSearchViewController searchControllers](self, "searchControllers");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "objectAtIndex:", objc_msgSend(v7, "section"));
        v30 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v30, "results");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "objectAtIndex:", objc_msgSend(v7, "row"));
        v39 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend((id)objc_opt_class(), "supportsQuicklookForResult:", v39))
        {
          -[CKDetailsSearchViewController presentQuickLookView:](self, "presentQuickLookView:", v7);
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "openURL:configuration:completionHandler:", v29, 0, 0);

        }
        goto LABEL_31;
      }
    }

    goto LABEL_33;
  }
LABEL_36:

}

- (void)_presentResult:(id)a3 withFullScreenViewController:(id)a4
{
  id v5;

  v5 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v5, "setDelegate:", self);
    objc_msgSend(v5, "setModalPresentationStyle:", 0);
    -[CKDetailsSearchViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v5, 1, 0);
  }

}

- (id)layoutSectionForController:(id)a3 withEnvironment:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  objc_super v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x1E0C80C00];
  v29.receiver = self;
  v29.super_class = (Class)CKDetailsSearchViewController;
  -[CKSearchViewController layoutSectionForController:withEnvironment:](&v29, sel_layoutSectionForController_withEnvironment_, a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA1B8], "backgroundDecorationItemWithElementKind:", CFSTR("backgroundDecorationView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[CKSearchViewController mode](self, "mode") != 4)
  {
    v30[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setDecorationItems:", v7);

  }
  if (-[CKSearchViewController mode](self, "mode") == 4
    && (-[CKSearchViewController searchControllers](self, "searchControllers"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = objc_msgSend(v8, "count"),
        v8,
        v9))
  {
    -[CKSearchViewController searchControllers](self, "searchControllers");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "firstObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "additionalGroupInsets");
    v13 = v12;
    v15 = v14;
    v17 = v16;
    v19 = v18;
    if (objc_msgSend(v11, "applyLayoutMarginsToLayoutGroup"))
    {
      -[CKSearchViewController collectionView](self, "collectionView");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "marginInsets");
      v15 = v15 + v21;

      -[CKSearchViewController collectionView](self, "collectionView");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "marginInsets");
      v19 = v19 + v23;

    }
  }
  else
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "searchDetailsResultsInsets");
    v13 = v24;
    v15 = v25;
    v17 = v26;
    v19 = v27;
  }

  objc_msgSend(v5, "setContentInsets:", v13, v15, v17, v19);
  return v5;
}

- (UIEdgeInsets)parentMarginInsetsForSearchController:(id)a3
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
  UIEdgeInsets result;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "searchDetailsSectionMarginInsets");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v12 = v5;
  v13 = v7;
  v14 = v9;
  v15 = v11;
  result.right = v15;
  result.bottom = v14;
  result.left = v13;
  result.top = v12;
  return result;
}

- (void)collectionView:(id)a3 didDeselectItemAtIndexPath:(id)a4
{
  void *v5;
  int v6;

  -[CKSearchViewController collectionView](self, "collectionView", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "_ck_isEditing");

  if (v6)
    -[CKDetailsSearchViewController _updateToolbar](self, "_updateToolbar");
}

- (void)searchWithText:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  -[CKDetailsSearchViewController setSearchComplete:](self, "setSearchComplete:", 0);
  v5.receiver = self;
  v5.super_class = (Class)CKDetailsSearchViewController;
  -[CKSearchViewController searchWithText:](&v5, sel_searchWithText_, v4);

}

- (void)searchEnded
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  uint8_t buf[8];
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18DFCD000, v3, OS_LOG_TYPE_INFO, "Search ended", buf, 2u);
    }

  }
  -[CKSearchViewController setSearchInProgress:](self, "setSearchInProgress:", 0);
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  -[CKSearchViewController searchControllers](self, "searchControllers", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v14, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v4);
        v8 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * i);
        objc_msgSend(v8, "cancelCurrentSearch");
        objc_msgSend(v8, "searchEnded");
      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v14, 16);
    }
    while (v5);
  }

}

- (void)searchControllerContentsDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unint64_t v7;
  void *v8;
  unint64_t v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  uint64_t v24;
  __int16 v25;
  id v26;
  __int16 v27;
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel_reloadData, 0);
  -[CKSearchViewController searchCompleteControllerSet](self, "searchCompleteControllerSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", objc_opt_class());

  -[CKSearchViewController searchCompleteControllerSet](self, "searchCompleteControllerSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  -[CKSearchViewController searchControllers](self, "searchControllers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (v7 >= v9)
  {
    -[CKDetailsSearchViewController setSearchComplete:](self, "setSearchComplete:", 1);
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        -[CKSearchViewController searchCompleteControllerSet](self, "searchCompleteControllerSet");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "count");
        v18 = (id)objc_opt_class();
        -[CKSearchViewController searchControllers](self, "searchControllers");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = 134218498;
        v24 = v17;
        v25 = 2112;
        v26 = v18;
        v27 = 2048;
        v28 = objc_msgSend(v19, "count");
        _os_log_impl(&dword_18DFCD000, v15, OS_LOG_TYPE_INFO, "%lu (%@) of %lu controllers checked in, updating now", (uint8_t *)&v23, 0x20u);

      }
    }
    -[CKSearchViewController collectionViewLayout](self, "collectionViewLayout");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKDetailsSearchViewController globalLayoutConfiguration](self, "globalLayoutConfiguration");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)objc_msgSend(v21, "copy");
    objc_msgSend(v20, "setConfiguration:", v22);

    -[CKDetailsSearchViewController reloadData](self, "reloadData");
  }
  else if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      -[CKSearchViewController searchCompleteControllerSet](self, "searchCompleteControllerSet");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "count");
      v13 = (id)objc_opt_class();
      -[CKSearchViewController searchControllers](self, "searchControllers");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 134218498;
      v24 = v12;
      v25 = 2112;
      v26 = v13;
      v27 = 2048;
      v28 = objc_msgSend(v14, "count");
      _os_log_impl(&dword_18DFCD000, v10, OS_LOG_TYPE_INFO, "%lu (%@) of %lu controllers checked in, not updating", (uint8_t *)&v23, 0x20u);

    }
  }

}

- (void)_registerCells
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)CKDetailsSearchViewController;
  -[CKSearchViewController _registerCells](&v11, sel__registerCells);
  -[CKSearchViewController collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_class();
  +[CKDetailsSearchResultsTitleHeaderCell supplementaryViewType](CKDetailsSearchResultsTitleHeaderCell, "supplementaryViewType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKDetailsSearchResultsTitleHeaderCell reuseIdentifier](CKDetailsSearchResultsTitleHeaderCell, "reuseIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerClass:forSupplementaryViewOfKind:withReuseIdentifier:", v4, v5, v6);

  -[CKSearchViewController collectionView](self, "collectionView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_class();
  +[CKDetailsSearchResultsFooterCell supplementaryViewType](CKDetailsSearchResultsFooterCell, "supplementaryViewType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKDetailsSearchResultsFooterCell reuseIdentifier](CKDetailsSearchResultsFooterCell, "reuseIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "registerClass:forSupplementaryViewOfKind:withReuseIdentifier:", v8, v9, v10);

}

- (id)_newSnapshotForCurrentControllerState
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  _QWORD v23[5];
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (-[CKSearchViewController mode](self, "mode") == 4)
  {
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    -[CKSearchViewController searchControllers](self, "searchControllers");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v26;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v26 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend((id)objc_opt_class(), "sectionIdentifier");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObject:", v10);

        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
      }
      while (v7);
    }
  }
  else
  {
    -[CKSearchViewController searchControllers](self, "searchControllers");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v11, "mutableCopy");

    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    -[CKSearchViewController searchControllers](self, "searchControllers");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v30;
      do
      {
        for (j = 0; j != v14; ++j)
        {
          if (*(_QWORD *)v30 != v15)
            objc_enumerationMutation(v12);
          v17 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * j);
          if (objc_msgSend(v17, "hasMoreResults"))
          {
            objc_msgSend((id)objc_opt_class(), "sectionIdentifier");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "addObject:", v18);

          }
          else
          {
            objc_msgSend(v5, "removeObject:", v17);
          }
        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
      }
      while (v14);
    }

    -[CKSearchViewController setSearchControllers:](self, "setSearchControllers:", v5);
  }

  objc_msgSend(v3, "appendSectionsWithIdentifiers:", v4);
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __70__CKDetailsSearchViewController__newSnapshotForCurrentControllerState__block_invoke;
  v23[3] = &unk_1E2755FA8;
  v23[4] = self;
  v19 = v3;
  v24 = v19;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v23);
  v20 = v24;
  v21 = v19;

  return v21;
}

void __70__CKDetailsSearchViewController__newSnapshotForCurrentControllerState__block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  id v5;
  void *v6;
  unint64_t v7;
  NSObject *v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  NSObject *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t buf[4];
  id v24;
  __int16 v25;
  void *v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  objc_msgSend(*(id *)(a1 + 32), "searchControllers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v7 >= a3)
  {
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    objc_msgSend(*(id *)(a1 + 32), "searchControllers", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (id)objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v20;
      while (2)
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(_QWORD *)v20 != v11)
            objc_enumerationMutation(v9);
          v13 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)i);
          objc_msgSend((id)objc_opt_class(), "sectionIdentifier");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "isEqualToString:", v5);

          if (v15)
          {
            v10 = v13;
            goto LABEL_16;
          }
        }
        v10 = (id)objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
        if (v10)
          continue;
        break;
      }
    }
LABEL_16:

    objc_msgSend(v10, "results");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v16, "count"))
    {
      objc_msgSend(*(id *)(a1 + 32), "_identifiersToAppendForResults:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          v24 = v5;
          v25 = 2112;
          v26 = v17;
          _os_log_impl(&dword_18DFCD000, v18, OS_LOG_TYPE_INFO, "Section %@ appending %@", buf, 0x16u);
        }

      }
      objc_msgSend(*(id *)(a1 + 40), "appendItemsWithIdentifiers:intoSectionWithIdentifier:", v17, v5);

    }
  }
  else if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18DFCD000, v8, OS_LOG_TYPE_INFO, "CKSearchController - Allocated search controllers and section counts do not match!!", buf, 2u);
    }

  }
}

- (id)sizeAttributeForController:(id)a3 sizingAttribute:(id)a4
{
  id v6;
  id v7;
  CKPhotosSearchResultsModeHeaderReusableView *v8;
  CKPhotosSearchResultsModeHeaderReusableView *v9;
  void *v10;
  CKPhotosSearchResultsTitleHeaderCell *v11;
  CKPhotosSearchResultsTitleHeaderCell *v12;
  void *v13;
  uint64_t v14;

  v6 = a3;
  v7 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v6, "headerOverrideClass"))
  {
    v8 = objc_alloc_init(CKPhotosSearchResultsModeHeaderReusableView);
  }
  else
  {
    -[CKDetailsSearchViewController titleSizingCell](self, "titleSizingCell");
    v8 = (CKPhotosSearchResultsModeHeaderReusableView *)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;
  -[CKPhotosSearchResultsModeHeaderReusableView preferredLayoutAttributesFittingAttributes:](v8, "preferredLayoutAttributesFittingAttributes:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (CKIsRunningInMacCatalyst())
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = [CKPhotosSearchResultsTitleHeaderCell alloc];
      v12 = -[CKPhotosSearchResultsTitleHeaderCell initWithFrame:](v11, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
      objc_msgSend((id)objc_opt_class(), "sectionTitle");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKPhotosSearchResultsTitleHeaderCell setTitle:](v12, "setTitle:", v13);

      -[CKPhotosSearchResultsTitleHeaderCell preferredLayoutAttributesFittingAttributes:](v12, "preferredLayoutAttributesFittingAttributes:", v7);
      v14 = objc_claimAutoreleasedReturnValue();

      v10 = (void *)v14;
    }
  }

  return v10;
}

- (id)headerBoundryItemsForController:(id)a3 withEnvironment:(id)a4
{
  id v5;
  id v6;
  void *v7;
  double Width;
  void *v9;
  void *v10;
  double Height;
  void *v12;
  void *v13;
  void *v14;
  objc_class *v15;
  void *v16;
  void *v17;
  void *v18;
  CGRect v20;
  CGRect v21;

  v5 = a3;
  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (objc_msgSend(v5, "wantsHeaderSection"))
  {
    -[CKDetailsSearchViewController view](self, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bounds");
    Width = CGRectGetWidth(v20);

    v9 = (void *)objc_opt_new();
    objc_msgSend(v9, "setFrame:", 0.0, 0.0, Width, 1.79769313e308);
    -[CKDetailsSearchViewController sizeAttributeForController:sizingAttribute:](self, "sizeAttributeForController:sizingAttribute:", v5, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "frame");
    Height = CGRectGetHeight(v21);
    objc_msgSend(MEMORY[0x1E0CEA1C0], "fractionalWidthDimension:", 1.0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA1C0], "absoluteDimension:", Height);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA1F0], "sizeWithWidthDimension:heightDimension:", v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "headerOverrideClass"))
      v15 = (objc_class *)objc_msgSend(v5, "headerOverrideClass");
    else
      v15 = -[CKDetailsSearchViewController _searchResultsHeaderClass](self, "_searchResultsHeaderClass");
    v16 = (void *)MEMORY[0x1E0CEA1B0];
    -[objc_class supplementaryViewType](v15, "supplementaryViewType");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "boundarySupplementaryItemWithLayoutSize:elementKind:alignment:", v14, v17, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "addObject:", v18);
  }

  return v6;
}

- (id)footerBoundryItemsForController:(id)a3 withEnvironment:(id)a4
{
  return 0;
}

- (id)globalLayoutConfiguration
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  int v9;
  _BOOL4 v10;
  unint64_t v11;
  int v12;
  uint64_t v13;
  void *v14;
  double Width;
  void *v16;
  void *v17;
  void *v18;
  double Height;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  void *v32;
  _BYTE v33[128];
  uint64_t v34;
  CGRect v35;
  CGRect v36;

  v34 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CEA430], "defaultConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  -[CKSearchViewController searchControllers](self, "searchControllers", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v29;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v29 != v7)
          objc_enumerationMutation(v4);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * i), "hasMoreResults") & 1) != 0)
        {
          v9 = 0;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
      if (v6)
        continue;
      break;
    }
  }
  v9 = 1;
LABEL_11:

  if (-[CKSearchViewController _needsIndexing](self, "_needsIndexing"))
    v10 = -[CKDetailsSearchViewController searchComplete](self, "searchComplete");
  else
    v10 = 0;
  v11 = -[CKSearchViewController mode](self, "mode");
  if (v11 == 4)
    v12 = 1;
  else
    v12 = v9;
  if (v10 && v12)
  {
    if (v11 == 4)
      v13 = 5;
    else
      v13 = 1;
    -[CKDetailsSearchViewController view](self, "view");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "bounds");
    Width = CGRectGetWidth(v35);

    v16 = (void *)objc_opt_new();
    objc_msgSend(v16, "setFrame:", 0.0, 0.0, Width, 1.79769313e308);
    -[CKDetailsSearchViewController sizingIndexingFooterCell](self, "sizingIndexingFooterCell");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "preferredLayoutAttributesFittingAttributes:", v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v18, "frame");
    Height = CGRectGetHeight(v36);
    objc_msgSend(MEMORY[0x1E0CEA1C0], "fractionalWidthDimension:", 1.0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA1C0], "absoluteDimension:", Height);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA1F0], "sizeWithWidthDimension:heightDimension:", v20, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)MEMORY[0x1E0CEA1B0];
    +[CKSearchIndexingFooterCell supplementaryViewType](CKSearchIndexingFooterCell, "supplementaryViewType");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "boundarySupplementaryItemWithLayoutSize:elementKind:alignment:", v22, v24, v13);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    v32 = v25;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v32, 1);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setBoundarySupplementaryItems:", v26);

  }
  objc_msgSend(v3, "setInterSectionSpacing:", 16.0);
  return v3;
}

- (void)_configureIndexingCell:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  objc_msgSend(v10, "setTitleLabelHidden:", 1);
  if (-[CKSearchViewController _needsIndexing](self, "_needsIndexing"))
  {
    if (-[CKSearchViewController mode](self, "mode") == 3)
    {
      CKFrameworkBundle();
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("DETAILS_INDEXING_MESSAGE"), &stru_1E276D870, CFSTR("ChatKit"));
    }
    else
    {
      -[CKSearchViewController searchControllers](self, "searchControllers");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "firstObject");
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend((id)objc_opt_class(), "indexingString");
    }
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  objc_msgSend(v10, "setSubtitleString:", v5);
  if (-[CKSearchViewController mode](self, "mode") != 4)
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "theme");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "spotlightSearchBackgroundColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setBackgroundColor:", v9);

  }
}

- (CKDetailsSearchResultsTitleHeaderCell)titleSizingCell
{
  CKDetailsSearchResultsTitleHeaderCell *titleSizingCell;
  CKDetailsSearchResultsTitleHeaderCell *v4;
  CKDetailsSearchResultsTitleHeaderCell *v5;
  CKDetailsSearchResultsTitleHeaderCell *v6;

  titleSizingCell = self->_titleSizingCell;
  if (!titleSizingCell)
  {
    v4 = [CKDetailsSearchResultsTitleHeaderCell alloc];
    v5 = -[CKDetailsSearchResultsTitleHeaderCell initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    v6 = self->_titleSizingCell;
    self->_titleSizingCell = v5;

    titleSizingCell = self->_titleSizingCell;
  }
  return titleSizingCell;
}

- (CKDetailsSearchResultsFooterCell)footerSizingCell
{
  CKDetailsSearchResultsFooterCell *footerSizingCell;
  CKDetailsSearchResultsFooterCell *v4;
  CKDetailsSearchResultsFooterCell *v5;
  CKDetailsSearchResultsFooterCell *v6;

  footerSizingCell = self->_footerSizingCell;
  if (!footerSizingCell)
  {
    v4 = [CKDetailsSearchResultsFooterCell alloc];
    v5 = -[CKDetailsSearchResultsFooterCell initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    v6 = self->_footerSizingCell;
    self->_footerSizingCell = v5;

    -[CKDetailsSearchResultsFooterCell setTitle:](self->_footerSizingCell, "setTitle:", CFSTR("Test"));
    footerSizingCell = self->_footerSizingCell;
  }
  return footerSizingCell;
}

- (CKSearchIndexingFooterCell)sizingIndexingFooterCell
{
  CKSearchIndexingFooterCell *sizingIndexingFooterCell;
  CKSearchIndexingFooterCell *v4;
  CKSearchIndexingFooterCell *v5;
  CKSearchIndexingFooterCell *v6;

  sizingIndexingFooterCell = self->_sizingIndexingFooterCell;
  if (!sizingIndexingFooterCell)
  {
    v4 = [CKSearchIndexingFooterCell alloc];
    v5 = -[CKSearchIndexingFooterCell initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    v6 = self->_sizingIndexingFooterCell;
    self->_sizingIndexingFooterCell = v5;

    -[CKDetailsSearchViewController _configureIndexingCell:](self, "_configureIndexingCell:", self->_sizingIndexingFooterCell);
    sizingIndexingFooterCell = self->_sizingIndexingFooterCell;
  }
  return sizingIndexingFooterCell;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  id v12;
  double v13;
  void *v14;
  uint64_t v15;
  void *v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  void *v25;
  double v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  double v32;
  uint64_t j;
  double MaxY;
  double v35;
  double v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  _BYTE v46[128];
  uint64_t v47;
  CGSize result;
  CGRect v49;
  CGRect v50;
  CGRect v51;

  height = a3.height;
  width = a3.width;
  v47 = *MEMORY[0x1E0C80C00];
  if (-[CKDetailsSearchViewController searchComplete](self, "searchComplete"))
  {
    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    -[CKSearchViewController searchControllers](self, "searchControllers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v42;
      while (2)
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v42 != v9)
            objc_enumerationMutation(v6);
          if ((objc_msgSend(*(id *)(*((_QWORD *)&v41 + 1) + 8 * i), "hasMoreResults") & 1) != 0)
          {

            goto LABEL_14;
          }
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
        if (v8)
          continue;
        break;
      }
    }

    -[CKDetailsSearchViewController globalLayoutConfiguration](self, "globalLayoutConfiguration");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    v13 = 0.0;
    if (v11)
    {
      objc_msgSend(v11, "boundarySupplementaryItems");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "count");

      if (v15)
      {
        -[CKDetailsSearchViewController view](self, "view");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "bounds");
        v17 = CGRectGetWidth(v49);

        v18 = (void *)objc_opt_new();
        objc_msgSend(v18, "setFrame:", 0.0, 0.0, v17, 1.79769313e308);
        -[CKDetailsSearchViewController sizingIndexingFooterCell](self, "sizingIndexingFooterCell");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "preferredLayoutAttributesFittingAttributes:", v18);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v20, "frame");
        v13 = CGRectGetHeight(v50);

      }
    }
  }
  else
  {
LABEL_14:
    -[CKSearchViewController collectionView](self, "collectionView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setNeedsLayout");

    -[CKSearchViewController collectionView](self, "collectionView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "layoutIfNeeded");

    -[CKSearchViewController collectionView](self, "collectionView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "contentSize");
    v13 = v24;

    if (v13 == 0.0)
    {
      -[CKSearchViewController collectionView](self, "collectionView");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "sizeThatFits:", width, height);
      v13 = v26;

    }
    -[CKSearchViewController collectionView](self, "collectionView");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    +[CKDetailsSearchResultsFooterCell supplementaryViewType](CKDetailsSearchResultsFooterCell, "supplementaryViewType");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "visibleSupplementaryViewsOfKind:", v28);
    v12 = (id)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v12, "count"))
    {
      v39 = 0u;
      v40 = 0u;
      v37 = 0u;
      v38 = 0u;
      v12 = v12;
      v29 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
      if (v29)
      {
        v30 = v29;
        v31 = *(_QWORD *)v38;
        v32 = 0.0;
        do
        {
          for (j = 0; j != v30; ++j)
          {
            if (*(_QWORD *)v38 != v31)
              objc_enumerationMutation(v12);
            objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * j), "frame", (_QWORD)v37);
            MaxY = CGRectGetMaxY(v51);
            if (MaxY >= v32)
              v32 = MaxY;
          }
          v30 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
        }
        while (v30);
      }
      else
      {
        v32 = 0.0;
      }

      if (v32 < v13)
        v13 = v32;
    }
  }

  v35 = width;
  v36 = v13;
  result.height = v36;
  result.width = v35;
  return result;
}

- (Class)_searchResultsHeaderClass
{
  return (Class)objc_opt_class();
}

- (void)collectionView:(id)a3 willDisplaySupplementaryView:(id)a4 forElementKind:(id)a5 atIndexPath:(id)a6
{
  id v10;
  objc_super v11;

  v10 = a4;
  v11.receiver = self;
  v11.super_class = (Class)CKDetailsSearchViewController;
  -[CKSearchViewController collectionView:willDisplaySupplementaryView:forElementKind:atIndexPath:](&v11, sel_collectionView_willDisplaySupplementaryView_forElementKind_atIndexPath_, a3, v10, a5, a6);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v10, "setDelegate:", self);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(v10, "setDetailsViewDelegate:", self);
  }

}

- (void)searchResultsTitleCellShowAllButtonTapped:(id)a3
{
  id v4;

  v4 = a3;
  if (CKIsRunningInMacCatalyst())
    -[CKDetailsSearchViewController _searchResultHeaderButtonTapped:](self, "_searchResultHeaderButtonTapped:", v4);

}

- (void)searchDetailsFooterCellShowAllTapped:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  NSObject *v9;
  void *v10;
  int v11;
  NSObject *v12;
  id v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  id v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  objc_msgSend(v13, "sectionIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[CKSearchViewController searchControllers](self, "searchControllers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v6)
          objc_enumerationMutation(v4);
        v8 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v9 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v20 = v8;
            _os_log_impl(&dword_18DFCD000, v9, OS_LOG_TYPE_INFO, "Controller check %@", buf, 0xCu);
          }

        }
        objc_msgSend((id)objc_opt_class(), "sectionIdentifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqualToString:", v3);

        if (v11)
        {
          v5 = v8;
          goto LABEL_15;
        }
      }
      v5 = (id)objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
      if (v5)
        continue;
      break;
    }
  }
LABEL_15:

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v20 = v3;
      v21 = 2112;
      v22 = v5;
      _os_log_impl(&dword_18DFCD000, v12, OS_LOG_TYPE_INFO, "Section id %@ controller %@", buf, 0x16u);
    }

  }
  if (v5)
    -[CKDetailsSearchViewController setupDetailsSearchController:](self, "setupDetailsSearchController:", v5);

}

- (void)searchDetailsShowAllButtonTapped:(id)a3
{
  unint64_t v4;
  void *v5;
  unint64_t v6;
  void *v7;
  id v8;

  v4 = objc_msgSend(a3, "sectionIndex");
  -[CKSearchViewController searchControllers](self, "searchControllers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v4 < v6)
  {
    -[CKSearchViewController searchControllers](self, "searchControllers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectAtIndex:", v4);
    v8 = (id)objc_claimAutoreleasedReturnValue();

    -[CKDetailsSearchViewController setupDetailsSearchController:](self, "setupDetailsSearchController:", v8);
  }
}

- (void)setupDetailsSearchController:(id)a3
{
  id v4;
  void *v5;
  CKDetailsSearchViewController *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v11[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[CKDetailsSearchViewController initWithSearchControllerClasses:]([CKDetailsSearchViewController alloc], "initWithSearchControllerClasses:", v5);
  -[CKDetailsSearchViewController conversation](self, "conversation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKDetailsSearchViewController setConversation:](v6, "setConversation:", v7);

  -[CKSearchViewController setMode:](v6, "setMode:", 4);
  -[CKSearchViewController delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKSearchViewController setDelegate:](v6, "setDelegate:", v8);

  -[CKDetailsSearchViewController detailsDelegate](self, "detailsDelegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKDetailsSearchViewController setDetailsDelegate:](v6, "setDetailsDelegate:", v9);

  -[CKDetailsSearchViewController setAssociatedDetailsSubsectionSearchController:](v6, "setAssociatedDetailsSubsectionSearchController:", v4);
  -[CKDetailsSearchViewController detailsDelegate](self, "detailsDelegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "detailsSearchController:requestsPushOfSearchController:", self, v6);

  -[CKDetailsSearchViewController searchWithText:](v6, "searchWithText:", &stru_1E276D870);
}

- (void)deleteTransferGUID:(id)a3
{
  id v4;
  BOOL v5;
  int v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  objc_super v12;
  id v13;
  uint8_t buf[4];
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CKDetailsSearchViewController;
  -[CKSearchViewController deleteTransferGUID:](&v12, sel_deleteTransferGUID_, v4);
  v5 = objc_msgSend(v4, "length") == 0;
  v6 = IMOSLoggingEnabled();
  if (v5)
  {
    if (v6)
    {
      OSLogHandleForIMFoundationCategory();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v15 = v4;
        _os_log_impl(&dword_18DFCD000, v11, OS_LOG_TYPE_INFO, "Unable to find transfer guid to delete: %@", buf, 0xCu);
      }

    }
  }
  else
  {
    if (v6)
    {
      OSLogHandleForIMFoundationCategory();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v15 = v4;
        _os_log_impl(&dword_18DFCD000, v7, OS_LOG_TYPE_INFO, "Found transfer guid to delete: %@", buf, 0xCu);
      }

    }
    -[CKDetailsSearchViewController conversation](self, "conversation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "chat");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v13, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "deleteTransfers:", v10);

  }
}

- (void)deleteChatItemWithTransferGUID:(id)a3 fromMessageItem:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  id v12;
  uint8_t buf[4];
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!objc_msgSend(v6, "length"))
  {
    if (!IMOSLoggingEnabled())
      goto LABEL_12;
    OSLogHandleForIMFoundationCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18DFCD000, v11, OS_LOG_TYPE_INFO, "CKDetailsSearchViewController: Transfer guid is nil. Transfer deletion will not continue.", buf, 2u);
    }
LABEL_11:

    goto LABEL_12;
  }
  if (!v7)
  {
    if (!IMOSLoggingEnabled())
      goto LABEL_12;
    OSLogHandleForIMFoundationCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v14 = v6;
      _os_log_impl(&dword_18DFCD000, v11, OS_LOG_TYPE_INFO, "CKDetailsSearchViewController: messageItem not provided. Transfer deletion will not continue for guid: %@", buf, 0xCu);
    }
    goto LABEL_11;
  }
  -[CKDetailsSearchViewController conversation](self, "conversation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "chat");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v12, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "deleteChatItemsWithTransferGUIDs:fromMessageItem:", v10, v7);

LABEL_12:
}

- (void)deleteMessageItem:(id)a3
{
  id v4;
  int v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  objc_super v11;
  id v12;
  uint8_t buf[4];
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CKDetailsSearchViewController;
  -[CKSearchViewController deleteMessageItem:](&v11, sel_deleteMessageItem_, v4);
  v5 = IMOSLoggingEnabled();
  if (v4)
  {
    if (v5)
    {
      OSLogHandleForIMFoundationCategory();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v14 = v4;
        _os_log_impl(&dword_18DFCD000, v6, OS_LOG_TYPE_INFO, "Found message to delete: %@", buf, 0xCu);
      }

    }
    -[CKDetailsSearchViewController conversation](self, "conversation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "chat");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v12, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "deleteIMMessageItems:", v9);

  }
  else if (v5)
  {
    OSLogHandleForIMFoundationCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18DFCD000, v10, OS_LOG_TYPE_INFO, "Unable to find message to delete.", buf, 2u);
    }

  }
}

- (id)searchController:(id)a3 conversationsForExistingChatsWithGUIDs:(id)a4
{
  uint64_t v4;
  void *v5;
  void *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  -[CKDetailsSearchViewController conversation](self, "conversation", a3, a4);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v4)
  {
    v8[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v6;
}

- (void)searchViewController:(id)a3 requestsPushOfSearchController:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  -[CKDetailsSearchViewController navigationController](self, "navigationController");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pushViewController:animated:", v5, 1);

}

- (id)searchBarForSearchViewController:(id)a3
{
  return 0;
}

- (BOOL)shouldInsetResultsForSearchController:(id)a3
{
  return 0;
}

- (void)searchController:(id)a3 requestsItemDeletionAtIndexPath:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (a4)
  {
    v8 = a4;
    v5 = (void *)MEMORY[0x1E0C99D20];
    v6 = a4;
    objc_msgSend(v5, "arrayWithObjects:count:", &v8, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[CKDetailsSearchViewController _deleteAttachmentsAtIndexPaths:](self, "_deleteAttachmentsAtIndexPaths:", v7, v8, v9);
  }
}

- (id)searchControllerChatGUIDsForDetailsSearch:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[CKDetailsSearchViewController chatGUIDs](self, "chatGUIDs", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    -[CKDetailsSearchViewController conversation](self, "conversation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "chat");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D35798], "sharedRegistry");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "allGUIDsForChat:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[CKDetailsSearchViewController setChatGUIDs:](self, "setChatGUIDs:", v8);
  }
  return -[CKDetailsSearchViewController chatGUIDs](self, "chatGUIDs");
}

- (void)setEditing:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  UIBarButtonItem *v15;
  UIBarButtonItem *saveButton;
  id v17;
  void *v18;
  void *v19;
  UIBarButtonItem *v20;
  UIBarButtonItem *deleteButton;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;

  v3 = a3;
  -[CKSearchViewController collectionView](self, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "_ck_isEditing");

  if (v6 != v3)
  {
    -[CKSearchViewController collectionView](self, "collectionView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_ck_setEditing:", v3);

    -[CKSearchViewController collectionView](self, "collectionView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "reloadData");

    if (-[CKSearchViewController mode](self, "mode") == 4)
    {
      -[CKDetailsSearchViewController navigationItem](self, "navigationItem");
      v29 = (id)objc_claimAutoreleasedReturnValue();
      if (!v3)
      {
LABEL_4:
        -[CKDetailsSearchViewController navigationController](self, "navigationController");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setToolbarHidden:animated:", 1, 1);

        -[CKDetailsSearchViewController selectButton](self, "selectButton");
        v10 = objc_claimAutoreleasedReturnValue();
LABEL_14:
        v28 = (void *)v10;
        objc_msgSend(v29, "setRightBarButtonItem:animated:", v10, 1);

        -[CKDetailsSearchViewController _updateToolbar](self, "_updateToolbar");
        return;
      }
    }
    else
    {
      -[CKDetailsSearchViewController parentViewController](self, "parentViewController");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "navigationItem");
      v29 = (id)objc_claimAutoreleasedReturnValue();

      if (!v3)
        goto LABEL_4;
    }
    if (!self->_saveButton)
    {
      v12 = objc_alloc(MEMORY[0x1E0CEA380]);
      CKFrameworkBundle();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("SEARCH_SAVE"), &stru_1E276D870, CFSTR("ChatKit"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (UIBarButtonItem *)objc_msgSend(v12, "initWithTitle:style:target:action:", v14, 0, self, sel__saveSelectedAttachments_);
      saveButton = self->_saveButton;
      self->_saveButton = v15;

    }
    if (!self->_deleteButton)
    {
      v17 = objc_alloc(MEMORY[0x1E0CEA380]);
      CKFrameworkBundle();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("DELETE"), &stru_1E276D870, CFSTR("ChatKit"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (UIBarButtonItem *)objc_msgSend(v17, "initWithTitle:style:target:action:", v19, 0, self, sel__deleteSelectedAttachments_);
      deleteButton = self->_deleteButton;
      self->_deleteButton = v20;

    }
    -[CKDetailsSearchViewController navigationController](self, "navigationController");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setToolbarHidden:animated:", 0, 1);

    -[CKDetailsSearchViewController cancelButton](self, "cancelButton");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v23)
    {
      v24 = objc_alloc(MEMORY[0x1E0CEA380]);
      CKFrameworkBundle();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_1E276D870, CFSTR("ChatKit"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = (void *)objc_msgSend(v24, "initWithTitle:style:target:action:", v26, 0, self, sel__cancelEditing_);

      -[CKDetailsSearchViewController setCancelButton:](self, "setCancelButton:", v27);
    }
    -[CKDetailsSearchViewController cancelButton](self, "cancelButton");
    v10 = objc_claimAutoreleasedReturnValue();
    goto LABEL_14;
  }
}

- (id)_selectedIndexPaths
{
  void *v2;
  void *v3;

  -[CKSearchViewController collectionView](self, "collectionView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "indexPathsForSelectedItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_updateToolbar
{
  void *v3;
  uint64_t v4;
  void *v5;
  _BOOL8 v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char isKindOfClass;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[2];
  _QWORD v20[4];

  v20[3] = *MEMORY[0x1E0C80C00];
  -[CKDetailsSearchViewController _selectedIndexPaths](self, "_selectedIndexPaths");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");
  -[CKDetailsSearchViewController saveButton](self, "saveButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4 != 0;
  objc_msgSend(v5, "setEnabled:", v6);

  -[CKDetailsSearchViewController deleteButton](self, "deleteButton");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setEnabled:", v6);

  -[CKDetailsSearchViewController flexibleItem](self, "flexibleItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA380]), "initWithBarButtonSystemItem:target:action:", 5, 0, 0);
    -[CKDetailsSearchViewController setFlexibleItem:](self, "setFlexibleItem:", v9);

  }
  -[CKSearchViewController searchControllers](self, "searchControllers");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "firstObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  -[CKDetailsSearchViewController navigationController](self, "navigationController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "toolbar");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if ((isKindOfClass & 1) != 0)
  {
    -[CKDetailsSearchViewController saveButton](self, "saveButton");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = v15;
    -[CKDetailsSearchViewController flexibleItem](self, "flexibleItem");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v20[1] = v16;
    -[CKDetailsSearchViewController deleteButton](self, "deleteButton");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v20[2] = v17;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 3);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setItems:", v18);

  }
  else
  {
    -[CKDetailsSearchViewController flexibleItem](self, "flexibleItem");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKDetailsSearchViewController deleteButton](self, "deleteButton", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v19[1] = v16;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setItems:", v17);
  }

}

- (void)_selectButtonTapped:(id)a3
{
  -[CKDetailsSearchViewController setEditing:](self, "setEditing:", 1);
}

- (void)_cancelEditing:(id)a3
{
  -[CKDetailsSearchViewController setEditing:](self, "setEditing:", 0);
}

- (void)_saveSelectedAttachments:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  unint64_t v11;
  void *v12;
  unint64_t v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[CKDetailsSearchViewController _selectedIndexPaths](self, "_selectedIndexPaths", a3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v17 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        -[CKDetailsSearchViewController _searchControllerForIndexPath:](self, "_searchControllerForIndexPath:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
        {
          v11 = objc_msgSend(v9, "row");
          objc_msgSend(v10, "results");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "count");

          if (v11 < v13)
          {
            objc_msgSend(v10, "results");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "objectAtIndex:", objc_msgSend(v9, "row"));
            v15 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v10, "saveAttachmentForResult:", v15);
          }
        }

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v6);
  }

  -[CKDetailsSearchViewController setEditing:](self, "setEditing:", 0);
}

- (void)_deleteSelectedAttachments:(id)a3
{
  id v4;

  -[CKDetailsSearchViewController _selectedIndexPaths](self, "_selectedIndexPaths", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CKDetailsSearchViewController _deleteAttachmentsAtIndexPaths:](self, "_deleteAttachmentsAtIndexPaths:", v4);

}

- (void)_deleteAttachmentsAtIndexPaths:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  char isKindOfClass;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  __CFString *v19;
  void *v20;
  void *v21;
  void *v22;
  const __CFString *v23;
  void *v24;
  void *v25;
  const __CFString *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  __CFString *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  _QWORD v47[4];
  id v48;
  _QWORD v49[4];
  id v50;
  _QWORD aBlock[4];
  id v52;
  CKDetailsSearchViewController *v53;

  v4 = a3;
  if (!objc_msgSend(v4, "count"))
    goto LABEL_34;
  CKFrameworkBundle();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_1E276D870, CFSTR("ChatKit"));
  v6 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "firstObject");
  v7 = objc_claimAutoreleasedReturnValue();
  -[CKDetailsSearchViewController _searchControllerForIndexPath:](self, "_searchControllerForIndexPath:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if ((unint64_t)objc_msgSend(v4, "count") >= 2)
    {
      isKindOfClass = 1;
      goto LABEL_6;
    }
    goto LABEL_13;
  }
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  if ((unint64_t)objc_msgSend(v4, "count") <= 1)
  {
    if ((isKindOfClass & 1) == 0)
    {
      CKFrameworkBundle();
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "localizedStringForKey:value:table:", CFSTR("DELETE_ATTACHMENT"), &stru_1E276D870, CFSTR("ChatKit"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (CKIsRunningInMacCatalyst())
      {
        CKFrameworkBundle();
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = v25;
        v26 = CFSTR("DELETE_SINGLE_ATTACHMENT");
        goto LABEL_24;
      }
LABEL_35:
      v32 = 0;
      goto LABEL_26;
    }
LABEL_13:
    CKFrameworkBundle();
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "localizedStringForKey:value:table:", CFSTR("DELETE_LINK"), &stru_1E276D870, CFSTR("ChatKit"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (CKIsRunningInMacCatalyst())
    {
      CKFrameworkBundle();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v25;
      v26 = CFSTR("DELETE_SINGLE_LINK");
LABEL_24:
      objc_msgSend(v25, "localizedStringForKey:value:table:", v26, &stru_1E276D870, CFSTR("ChatKit"));
      v32 = objc_claimAutoreleasedReturnValue();
      goto LABEL_25;
    }
    goto LABEL_35;
  }
LABEL_6:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v4, "count"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  CKLocalizedStringForNumber(v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)MEMORY[0x1E0CB3940];
  CKFrameworkBundle();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if ((isKindOfClass & 1) == 0)
  {
    objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("DELETE_ATTACHMENTS"), &stru_1E276D870, CFSTR("ChatKit"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringWithFormat:", v27, v11);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v29, "userInterfaceLayoutDirection");

    if (v30 == 1)
      v31 = CFSTR("\u200F");
    else
      v31 = CFSTR("\u200E");
    -[__CFString stringByAppendingString:](v31, "stringByAppendingString:", v28);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (CKIsRunningInMacCatalyst())
    {
      CKFrameworkBundle();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = v21;
      v23 = CFSTR("DELETE_MULTIPLE_ATTACHMENTS");
      goto LABEL_20;
    }
LABEL_21:
    v32 = 0;
    goto LABEL_25;
  }
  objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("DELETE_LINKS"), &stru_1E276D870, CFSTR("ChatKit"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringWithFormat:", v15, v11);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "userInterfaceLayoutDirection");

  if (v18 == 1)
    v19 = CFSTR("\u200F");
  else
    v19 = CFSTR("\u200E");
  -[__CFString stringByAppendingString:](v19, "stringByAppendingString:", v16);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (!CKIsRunningInMacCatalyst())
    goto LABEL_21;
  CKFrameworkBundle();
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v21;
  v23 = CFSTR("DELETE_MULTIPLE_LINKS");
LABEL_20:
  objc_msgSend(v21, "localizedStringForKey:value:table:", v23, &stru_1E276D870, CFSTR("ChatKit"));
  v32 = objc_claimAutoreleasedReturnValue();

LABEL_25:
LABEL_26:
  v46 = (void *)v7;
  if (CKIsRunningInMacCatalyst())
  {
    CKFrameworkBundle();
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "localizedStringForKey:value:table:", CFSTR("DELETE_WARNING"), &stru_1E276D870, CFSTR("ChatKit"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    v36 = 1;
  }
  else
  {
    v36 = 0;
    v35 = 0;
  }
  v37 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __64__CKDetailsSearchViewController__deleteAttachmentsAtIndexPaths___block_invoke;
  aBlock[3] = &unk_1E274A108;
  v52 = v4;
  v53 = self;
  v38 = _Block_copy(aBlock);
  v45 = (void *)v32;
  +[CKAlertController alertControllerWithTitle:message:preferredStyle:](CKAlertController, "alertControllerWithTitle:message:preferredStyle:", v32, v35, v36);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  if (!CKIsRunningInMacCatalyst())
  {
    v40 = v6;
    v49[0] = v37;
    v49[1] = 3221225472;
    v49[2] = __64__CKDetailsSearchViewController__deleteAttachmentsAtIndexPaths___block_invoke_2;
    v49[3] = &unk_1E274B330;
    v50 = v38;
    +[CKAlertAction actionWithTitle:style:handler:](CKAlertAction, "actionWithTitle:style:handler:", v20, 2, v49);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "addAction:", v41);

    v6 = v40;
  }
  v42 = (void *)v6;
  +[CKAlertAction actionWithTitle:style:handler:](CKAlertAction, "actionWithTitle:style:handler:", v6, 1, &__block_literal_global_240);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "addAction:", v43);

  if (CKIsRunningInMacCatalyst())
  {
    v47[0] = v37;
    v47[1] = 3221225472;
    v47[2] = __64__CKDetailsSearchViewController__deleteAttachmentsAtIndexPaths___block_invoke_4;
    v47[3] = &unk_1E274B330;
    v48 = v38;
    +[CKAlertAction actionWithTitle:style:handler:](CKAlertAction, "actionWithTitle:style:handler:", v20, 2, v47);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "addAction:", v44);

  }
  -[CKDetailsSearchViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v39, 1, 0);

LABEL_34:
}

uint64_t __64__CKDetailsSearchViewController__deleteAttachmentsAtIndexPaths___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  unint64_t v9;
  void *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v17 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(*(id *)(a1 + 40), "_searchControllerForIndexPath:", v7, (_QWORD)v16);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (v8)
        {
          v9 = objc_msgSend(v7, "row");
          objc_msgSend(v8, "results");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v10, "count");

          if (v9 < v11)
          {
            objc_msgSend(v8, "results");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "objectAtIndex:", objc_msgSend(v7, "row"));
            v13 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v8, "deleteAttachmentForResult:", v13);
            objc_msgSend(*(id *)(a1 + 40), "associatedDetailsSubsectionSearchController");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "deleteAttachmentForResult:", v13);

          }
        }

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v4);
  }

  return objc_msgSend(*(id *)(a1 + 40), "setEditing:", 0);
}

uint64_t __64__CKDetailsSearchViewController__deleteAttachmentsAtIndexPaths___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __64__CKDetailsSearchViewController__deleteAttachmentsAtIndexPaths___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)_searchControllerForIndexPath:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v4 = a3;
  -[CKSearchViewController searchControllers](self, "searchControllers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "section");

  objc_msgSend(v5, "objectAtIndexedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (CKQLPreviewController)previewController
{
  CKQLPreviewController *previewController;
  CKQLPreviewController *v4;
  CKQLPreviewController *v5;

  previewController = self->_previewController;
  if (!previewController)
  {
    if (!CKIsRunningInMacCatalyst())
    {
      v4 = objc_alloc_init(CKQLPreviewController);
      v5 = self->_previewController;
      self->_previewController = v4;

    }
    -[QLPreviewController setDelegate:](self->_previewController, "setDelegate:", self);
    previewController = self->_previewController;
  }
  return previewController;
}

- (CKDetailsSearchControllerDelegate)detailsDelegate
{
  return (CKDetailsSearchControllerDelegate *)objc_loadWeakRetained((id *)&self->_detailsDelegate);
}

- (void)setDetailsDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_detailsDelegate, a3);
}

- (CKConversation)conversation
{
  return self->_conversation;
}

- (void)setConversation:(id)a3
{
  objc_storeStrong((id *)&self->_conversation, a3);
}

- (BOOL)searchComplete
{
  return self->_searchComplete;
}

- (void)setSearchComplete:(BOOL)a3
{
  self->_searchComplete = a3;
}

- (CKSearchController)associatedDetailsSubsectionSearchController
{
  return self->_associatedDetailsSubsectionSearchController;
}

- (void)setAssociatedDetailsSubsectionSearchController:(id)a3
{
  objc_storeStrong((id *)&self->_associatedDetailsSubsectionSearchController, a3);
}

- (NSArray)chatGUIDs
{
  return self->_chatGUIDs;
}

- (void)setChatGUIDs:(id)a3
{
  objc_storeStrong((id *)&self->_chatGUIDs, a3);
}

- (CKQLPreviewControllerDataSource)qlPreviewDataSource
{
  return self->_qlPreviewDataSource;
}

- (void)setQlPreviewDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_qlPreviewDataSource, a3);
}

- (void)setPreviewController:(id)a3
{
  objc_storeStrong((id *)&self->_previewController, a3);
}

- (void)setTitleSizingCell:(id)a3
{
  objc_storeStrong((id *)&self->_titleSizingCell, a3);
}

- (void)setFooterSizingCell:(id)a3
{
  objc_storeStrong((id *)&self->_footerSizingCell, a3);
}

- (void)setSizingIndexingFooterCell:(id)a3
{
  objc_storeStrong((id *)&self->_sizingIndexingFooterCell, a3);
}

- (UIBarButtonItem)selectButton
{
  return self->_selectButton;
}

- (void)setSelectButton:(id)a3
{
  objc_storeStrong((id *)&self->_selectButton, a3);
}

- (UIBarButtonItem)cancelButton
{
  return self->_cancelButton;
}

- (void)setCancelButton:(id)a3
{
  objc_storeStrong((id *)&self->_cancelButton, a3);
}

- (UIBarButtonItem)flexibleItem
{
  return self->_flexibleItem;
}

- (void)setFlexibleItem:(id)a3
{
  objc_storeStrong((id *)&self->_flexibleItem, a3);
}

- (UIBarButtonItem)saveButton
{
  return self->_saveButton;
}

- (void)setSaveButton:(id)a3
{
  objc_storeStrong((id *)&self->_saveButton, a3);
}

- (UIBarButtonItem)deleteButton
{
  return self->_deleteButton;
}

- (void)setDeleteButton:(id)a3
{
  objc_storeStrong((id *)&self->_deleteButton, a3);
}

- (NSDate)lastUserSelectedCellTime
{
  return self->_lastUserSelectedCellTime;
}

- (void)setLastUserSelectedCellTime:(id)a3
{
  objc_storeStrong((id *)&self->_lastUserSelectedCellTime, a3);
}

- (UICollectionViewCell)lastUserSelectedCell
{
  return self->_lastUserSelectedCell;
}

- (void)setLastUserSelectedCell:(id)a3
{
  objc_storeStrong((id *)&self->_lastUserSelectedCell, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastUserSelectedCell, 0);
  objc_storeStrong((id *)&self->_lastUserSelectedCellTime, 0);
  objc_storeStrong((id *)&self->_deleteButton, 0);
  objc_storeStrong((id *)&self->_saveButton, 0);
  objc_storeStrong((id *)&self->_flexibleItem, 0);
  objc_storeStrong((id *)&self->_cancelButton, 0);
  objc_storeStrong((id *)&self->_selectButton, 0);
  objc_storeStrong((id *)&self->_sizingIndexingFooterCell, 0);
  objc_storeStrong((id *)&self->_footerSizingCell, 0);
  objc_storeStrong((id *)&self->_titleSizingCell, 0);
  objc_storeStrong((id *)&self->_previewController, 0);
  objc_storeStrong((id *)&self->_qlPreviewDataSource, 0);
  objc_storeStrong((id *)&self->_chatGUIDs, 0);
  objc_storeStrong((id *)&self->_associatedDetailsSubsectionSearchController, 0);
  objc_storeStrong((id *)&self->_conversation, 0);
  objc_destroyWeak((id *)&self->_detailsDelegate);
}

@end
