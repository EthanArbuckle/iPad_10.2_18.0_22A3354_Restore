@implementation CKStickerDetailViewController

- (CKStickerDetailViewController)initWithEmojiImageMediaObjects:(id)a3
{
  id v4;
  CKStickerDetailViewController *v5;
  uint64_t v6;
  NSArray *stickerDetailsItems;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CKStickerDetailViewController;
  v5 = -[CKStickerDetailViewController initWithNibName:bundle:](&v9, sel_initWithNibName_bundle_, 0, 0);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    stickerDetailsItems = v5->_stickerDetailsItems;
    v5->_stickerDetailsItems = (NSArray *)v6;

    v5->_stickerDetailsItemType = 1;
  }

  return v5;
}

- (CKStickerDetailViewController)initWithStickerChatItems:(id)a3
{
  id v4;
  CKStickerDetailViewController *v5;
  uint64_t v6;
  NSArray *stickerDetailsItems;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CKStickerDetailViewController;
  v5 = -[CKStickerDetailViewController initWithNibName:bundle:](&v9, sel_initWithNibName_bundle_, 0, 0);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    stickerDetailsItems = v5->_stickerDetailsItems;
    v5->_stickerDetailsItems = (NSArray *)v6;

    v5->_stickerDetailsItemType = 0;
  }

  return v5;
}

- (void)loadView
{
  void *v3;
  void *v4;
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)CKStickerDetailViewController;
  -[CKStickerDetailViewController loadView](&v19, sel_loadView);
  -[CKStickerDetailViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setLayoutMarginsFollowReadableWidth:", 1);

  -[CKStickerDetailViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", 0);

  v5 = objc_alloc(MEMORY[0x1E0CEAA58]);
  v6 = *MEMORY[0x1E0C9D648];
  v7 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v8 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v9 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v10 = (void *)objc_msgSend(v5, "initWithFrame:style:", 0, *MEMORY[0x1E0C9D648], v7, v8, v9);
  objc_msgSend(v10, "setDataSource:", self);
  objc_msgSend(v10, "setDelegate:", self);
  objc_msgSend(v10, "setAutoresizingMask:", 18);
  objc_msgSend(v10, "setRowHeight:", *MEMORY[0x1E0CEBC10]);
  -[CKStickerDetailViewController setTableView:](self, "setTableView:", v10);
  -[CKStickerDetailViewController view](self, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addSubview:", v10);

  if (CKIsRunningInMacCatalyst())
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setBackgroundColor:", v12);

  }
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEABB0]), "initWithFrame:", v6, v7, v8, v9);
  objc_msgSend(v10, "setTableFooterView:", v13);
  v14 = objc_opt_class();
  +[CKStickerDetailCell identifier](CKStickerDetailCell, "identifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "registerClass:forCellReuseIdentifier:", v14, v15);

  objc_msgSend(v10, "__ck_scrollToTop:", 0);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addObserver:selector:name:object:", self, sel__previewDidChangeNotification_, CFSTR("CKPreviewDidChangeNotification"), 0);
  objc_msgSend(v16, "addObserver:selector:name:object:", self, sel__adaptiveImageGlyphWasGeneratedNotification_, CFSTR("CKAdaptiveImageGlyphGeneratedNotification"), 0);
  if (!CKIsRunningInMacCatalyst())
  {
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA380]), "initWithBarButtonSystemItem:target:action:", 0, self, sel_stickerDetailViewControllerCloseButtonPressed_);
    -[CKStickerDetailViewController navigationItem](self, "navigationItem");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setRightBarButtonItem:", v17);

  }
}

- (void)viewDidLayoutSubviews
{
  void *v3;
  void *v4;
  int64_t stickerDetailsItemType;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)CKStickerDetailViewController;
  -[CKStickerDetailViewController viewDidLayoutSubviews](&v11, sel_viewDidLayoutSubviews);
  -[CKStickerDetailViewController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKStickerDetailViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  objc_msgSend(v3, "setFrame:");

  stickerDetailsItemType = self->_stickerDetailsItemType;
  if (stickerDetailsItemType)
  {
    if (stickerDetailsItemType != 1)
    {
      v9 = 0;
      goto LABEL_7;
    }
    CKFrameworkBundle();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    v8 = CFSTR("EMOJI_DETAILS_NAVIGATION_BAR_TITLE");
  }
  else
  {
    CKFrameworkBundle();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    v8 = CFSTR("STICKER_TITLE");
  }
  objc_msgSend(v6, "localizedStringForKey:value:table:", v8, &stru_1E276D870, CFSTR("ChatKit"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_7:
  -[CKStickerDetailViewController navigationItem](self, "navigationItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTitle:", v9);

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CKStickerDetailViewController;
  -[CKStickerDetailViewController viewWillAppear:](&v5, sel_viewWillAppear_, a3);
  -[CKStickerDetailViewController tableView](self, "tableView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "__ck_scrollToTop:", 0);

}

- (BOOL)shouldAutorotate
{
  return 0;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return -[NSArray count](self->_stickerDetailsItems, "count", a3, a4);
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;

  v6 = a4;
  v7 = a3;
  +[CKStickerDetailCell identifier](CKStickerDetailCell, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dequeueReusableCellWithIdentifier:forIndexPath:", v8, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setDelegate:", self);
  v10 = objc_msgSend(v6, "item");

  -[NSArray objectAtIndex:](self->_stickerDetailsItems, "objectAtIndex:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stickerDetailsPreview");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setStickerPreview:", v12);
  objc_msgSend(v11, "stickerDetailsTitleText");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTitleText:", v13);
  objc_msgSend(v11, "stickerDetailsSubtitleText");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setSubtitleText:", v14);

  if (-[CKStickerDetailViewController canSaveStickerForItem:](self, "canSaveStickerForItem:", v11))
    v15 = 2;
  else
    v15 = -[CKStickerDetailViewController canViewStickerPackForItem:](self, "canViewStickerPackForItem:", v11);
  objc_msgSend(v9, "setAdditionalActionType:", v15);
  objc_msgSend(v11, "stickerDetailsDateAdded");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTimestampDate:", v16);

  return v9;
}

- (BOOL)tableView:(id)a3 shouldDrawTopSeparatorForSection:(int64_t)a4
{
  return 0;
}

- (BOOL)tableView:(id)a3 shouldDrawBottomSeparatorForSection:(int64_t)a4
{
  return 1;
}

- (BOOL)shouldHideViewButtonInStickerDetailsForIdentifier:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D374D0]) & 1) != 0)
    v4 = 1;
  else
    v4 = objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D37560]);

  return v4;
}

- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4
{
  void *v4;
  char v5;

  -[NSArray objectAtIndex:](self->_stickerDetailsItems, "objectAtIndex:", objc_msgSend(a4, "item", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "canDeleteFromStickerDetails");

  return v5;
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  if (a4 == 1)
    -[CKStickerDetailViewController deleteStickerSelectedAtIndexPath:](self, "deleteStickerSelectedAtIndexPath:", a5);
}

- (void)deleteStickerSelectedAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id WeakRetained;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  dispatch_time_t v13;
  _QWORD block[5];
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[NSArray objectAtIndex:](self->_stickerDetailsItems, "objectAtIndex:", objc_msgSend(v4, "item"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stickerDetailsTransferGUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "stickerDetailViewController:deletedStickerWithTransferGUID:", self, v6);

  -[CKStickerDetailViewController stickerDetailsItems](self, "stickerDetailsItems");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "mutableCopy");

  objc_msgSend(v9, "removeObject:", v5);
  v10 = (void *)objc_msgSend(v9, "copy");
  -[CKStickerDetailViewController setStickerDetailsItems:](self, "setStickerDetailsItems:", v10);

  -[CKStickerDetailViewController tableView](self, "tableView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "deleteRowsAtIndexPaths:withRowAnimation:", v12, 100);

  if (!-[NSArray count](self->_stickerDetailsItems, "count"))
  {
    v13 = dispatch_time(0, 400000000);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __66__CKStickerDetailViewController_deleteStickerSelectedAtIndexPath___block_invoke;
    block[3] = &unk_1E274A208;
    block[4] = self;
    dispatch_after(v13, MEMORY[0x1E0C80D38], block);
  }

}

uint64_t __66__CKStickerDetailViewController_deleteStickerSelectedAtIndexPath___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "stickerDetailViewControllerCloseButtonPressed:", 0);
}

- (void)saveStickerButtonSelectedAtIndexPath:(id)a3
{
  id v4;
  id WeakRetained;
  char v6;
  id v7;
  id v8;

  -[NSArray objectAtIndex:](self->_stickerDetailsItems, "objectAtIndex:", objc_msgSend(a3, "item"));
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[CKStickerDetailViewController dismissModalViewControllerAnimated:](self, "dismissModalViewControllerAnimated:", 1);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = v8;
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v6 = objc_opt_respondsToSelector();

    if ((v6 & 1) != 0)
    {
      v7 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v7, "saveStickerFromDetailViewController:chatItemContainingSticker:", self, v4);
LABEL_6:

    }
  }
  else
  {
    objc_msgSend(v8, "saveableSticker");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v7 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v7, "stickerDetailViewController:didRequestSaveSticker:", self, v4);
      goto LABEL_6;
    }
  }

}

- (void)viewStickerAppButtonSelectedAtIndexPath:(id)a3
{
  void *v4;
  id WeakRetained;
  id v6;

  -[NSArray objectAtIndex:](self->_stickerDetailsItems, "objectAtIndex:", objc_msgSend(a3, "item"));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[CKStickerDetailViewController _adamIDForStickersDetailItem:](self, "_adamIDForStickersDetailItem:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "stickerDetailViewController:selectedStickerPackWithAdamID:", self, v4);

  }
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  return 0;
}

- (BOOL)wantsWindowedPresentation
{
  self->_wantsWindowedPresentation = 1;
  return 1;
}

- (BOOL)preserveModalPresentationStyle
{
  self->_preserveModalPresentationStyle = 1;
  return 1;
}

- (BOOL)constrainToPresentingVCBounds
{
  return 1;
}

- (id)tableView:(id)a3 trailingSwipeActionsConfigurationForRowAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  -[NSArray objectAtIndex:](self->_stickerDetailsItems, "objectAtIndex:", objc_msgSend(v5, "item"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "canDeleteFromStickerDetails"))
  {
    -[CKStickerDetailViewController _deleteSwipeActionForIndexPath:](self, "_deleteSwipeActionForIndexPath:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)MEMORY[0x1E0CEAA28];
    v12[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "configurationWithActions:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "setPerformsFirstActionWithFullSwipe:", 1);
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)_deleteSwipeActionForIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t);
  void *v15;
  CKStickerDetailViewController *v16;
  id v17;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0CEA4C0];
  CKFrameworkBundle();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("DELETE"), &stru_1E276D870, CFSTR("ChatKit"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x1E0C809B0];
  v13 = 3221225472;
  v14 = __64__CKStickerDetailViewController__deleteSwipeActionForIndexPath___block_invoke;
  v15 = &unk_1E2755EF0;
  v16 = self;
  v17 = v4;
  v8 = v4;
  objc_msgSend(v5, "contextualActionWithStyle:title:handler:", 1, v7, &v12);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:", CFSTR("trash.fill"), v12, v13, v14, v15, v16);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setImage:", v10);

  return v9;
}

uint64_t __64__CKStickerDetailViewController__deleteSwipeActionForIndexPath___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "deleteStickerSelectedAtIndexPath:", *(_QWORD *)(a1 + 40));
}

- (id)_adamIDForStickersDetailItem:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  objc_msgSend(a3, "stickerDetailsTransferGUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "length"))
  {
    objc_msgSend(MEMORY[0x1E0D35820], "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "transferForGUID:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      objc_msgSend(v5, "attributionInfo");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0D37F18]);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      if (v8 && objc_msgSend(v8, "integerValue"))
        v10 = v9;
      else
        v10 = 0;

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

- (BOOL)canViewStickerPackForItem:(id)a3
{
  void *v3;
  BOOL v4;

  -[CKStickerDetailViewController _adamIDForStickersDetailItem:](self, "_adamIDForStickersDetailItem:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (BOOL)canSaveStickerForItem:(id)a3
{
  void *v3;
  BOOL v4;

  objc_msgSend(a3, "saveableSticker");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (void)stickerDetailViewControllerCloseButtonPressed:(id)a3
{
  -[CKStickerDetailViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (id)_indexPathForTransferGUID:(id)a3
{
  id v4;
  NSArray *stickerDetailsItems;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, void *, uint64_t, _BYTE *);
  void *v13;
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;

  v4 = a3;
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0x7FFFFFFFFFFFFFFFLL;
  stickerDetailsItems = self->_stickerDetailsItems;
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __59__CKStickerDetailViewController__indexPathForTransferGUID___block_invoke;
  v13 = &unk_1E2755F18;
  v6 = v4;
  v14 = v6;
  v15 = &v16;
  -[NSArray enumerateObjectsUsingBlock:](stickerDetailsItems, "enumerateObjectsUsingBlock:", &v10);
  v7 = v17[3];
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v8 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", v7, 0, v10, v11, v12, v13);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  _Block_object_dispose(&v16, 8);
  return v8;
}

void __59__CKStickerDetailViewController__indexPathForTransferGUID___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;

  objc_msgSend(a2, "stickerDetailsTransferGUID");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:"))
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a3;
    *a4 = 1;
  }

}

- (void)_reloadCellWithTransferGUID:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  -[CKStickerDetailViewController _indexPathForTransferGUID:](self, "_indexPathForTransferGUID:", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v4)
  {
    v7[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITableView reloadRowsAtIndexPaths:withRowAnimation:](self->_tableView, "reloadRowsAtIndexPaths:withRowAnimation:", v6, 5);

  }
}

- (void)_adaptiveImageGlyphWasGeneratedNotification:(id)a3
{
  void *v4;
  id v5;

  objc_msgSend(a3, "object");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v5, "transferGUID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKStickerDetailViewController _reloadCellWithTransferGUID:](self, "_reloadCellWithTransferGUID:", v4);

  }
}

- (void)_previewDidChangeNotification:(id)a3
{
  void *v4;
  id v5;

  objc_msgSend(a3, "object");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v5, "transferGUID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKStickerDetailViewController _reloadCellWithTransferGUID:](self, "_reloadCellWithTransferGUID:", v4);

  }
}

+ (id)stickerBundleIDFromFileTransfer:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;

  v3 = a3;
  objc_msgSend(v3, "attributionInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D37F30]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "componentsSeparatedByString:", CFSTR(":"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lastObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v7, "length"))
  {
    objc_msgSend(v3, "stickerUserInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0D39310]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "componentsSeparatedByString:", CFSTR(":"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "lastObject");
    v11 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v11;
  }

  return v7;
}

+ (BOOL)isGenmojiBundleIDFromFileTransfer:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(a1, "stickerBundleIDFromFileTransfer:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D375B8]);

  return v4;
}

+ (id)localizedAppNameForStickerDetailsFromFileTransfer:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  int v11;
  int v12;
  id v13;
  void *v14;
  void *v15;
  const __CFString *v16;
  void *v17;

  v4 = a3;
  objc_msgSend(v4, "attributionInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D37F20]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "stickerBundleIDFromFileTransfer:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CA5860], "bundleProxyForIdentifier:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }
  v10 = objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0D37600]);
  v11 = objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0D375B8]);
  v12 = objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0D37590]);
  if (!v10)
  {
    if (v11)
    {
      CKFrameworkBundle();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v14;
      v16 = CFSTR("GENMOJI");
    }
    else
    {
      if (!v12)
      {
        if (!objc_msgSend(v9, "length"))
        {
          if (objc_msgSend(v6, "length"))
            goto LABEL_6;
          goto LABEL_17;
        }
LABEL_14:
        v13 = v9;
        goto LABEL_15;
      }
      CKFrameworkBundle();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v14;
      v16 = CFSTR("EMOJI");
    }
LABEL_18:
    objc_msgSend(v14, "localizedStringForKey:value:table:", v16, &stru_1E276D870, CFSTR("ChatKit"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_19;
  }
  if (!objc_msgSend(v6, "length"))
  {
    if (!objc_msgSend(v9, "length"))
    {
LABEL_17:
      CKFrameworkBundle();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v14;
      v16 = CFSTR("GENERIC_STICKERS_APP_SHORT_TITLE");
      goto LABEL_18;
    }
    goto LABEL_14;
  }
LABEL_6:
  v13 = v6;
LABEL_15:
  v17 = v13;
LABEL_19:

  return v17;
}

- (void)setWantsWindowedPresentation:(BOOL)a3
{
  self->_wantsWindowedPresentation = a3;
}

- (void)setPreserveModalPresentationStyle:(BOOL)a3
{
  self->_preserveModalPresentationStyle = a3;
}

- (CKStickerDetailViewControllerDelegate)delegate
{
  return (CKStickerDetailViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSArray)stickerDetailsItems
{
  return self->_stickerDetailsItems;
}

- (void)setStickerDetailsItems:(id)a3
{
  objc_storeStrong((id *)&self->_stickerDetailsItems, a3);
}

- (int64_t)stickerDetailsItemType
{
  return self->_stickerDetailsItemType;
}

- (void)setStickerDetailsItemType:(int64_t)a3
{
  self->_stickerDetailsItemType = a3;
}

- (UITableView)tableView
{
  return self->_tableView;
}

- (void)setTableView:(id)a3
{
  objc_storeStrong((id *)&self->_tableView, a3);
}

- (UIVisualEffectView)visualEffectView
{
  return self->_visualEffectView;
}

- (void)setVisualEffectView:(id)a3
{
  objc_storeStrong((id *)&self->_visualEffectView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visualEffectView, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_stickerDetailsItems, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
