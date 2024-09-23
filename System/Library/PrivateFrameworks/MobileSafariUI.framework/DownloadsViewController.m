@implementation DownloadsViewController

+ (id)tableViewCellForSizeEstimation
{
  return +[DownloadTableViewCell tableViewCellForSizeEstimation](DownloadTableViewCell, "tableViewCellForSizeEstimation");
}

- (DownloadsViewController)initWithStyle:(int64_t)a3
{
  DownloadsViewController *v3;
  uint64_t v4;
  _SFDownloadManager *downloadManager;
  void *v6;
  uint64_t v7;
  NSMutableArray *downloads;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  DownloadsViewController *v16;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)DownloadsViewController;
  v3 = -[DownloadsViewController initWithStyle:](&v18, sel_initWithStyle_, 0);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CD56A8], "sharedManager");
    v4 = objc_claimAutoreleasedReturnValue();
    downloadManager = v3->_downloadManager;
    v3->_downloadManager = (_SFDownloadManager *)v4;

    -[_SFDownloadManager downloads](v3->_downloadManager, "downloads");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "mutableCopy");
    downloads = v3->_downloads;
    v3->_downloads = (NSMutableArray *)v7;

    -[DownloadsViewController navigationItem](v3, "navigationItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    _WBSLocalizedString();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setTitle:", v10);

    v11 = objc_alloc(MEMORY[0x1E0DC34F0]);
    _WBSLocalizedString();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v11, "initWithTitle:style:target:action:", v12, 0, v3, sel__clearAllDownloads);
    objc_msgSend(v9, "setRightBarButtonItem:", v13);

    objc_msgSend(v9, "rightBarButtonItem");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setAccessibilityIdentifier:", CFSTR("ClearDownloads"));

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObserver:selector:name:object:", v3, sel__downloadsDidChange_, *MEMORY[0x1E0CD58B8], 0);

    v16 = v3;
  }

  return v3;
}

- (void)_clearAllDownloads
{
  _SFDownloadManager *downloadManager;
  void *v3;
  id v4;

  downloadManager = self->_downloadManager;
  -[_SFDownloadManager downloads](downloadManager, "downloads");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safari_filterObjectsUsingBlock:", &__block_literal_global_17);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_SFDownloadManager removeDownloads:](downloadManager, "removeDownloads:", v3);

}

uint64_t __45__DownloadsViewController__clearAllDownloads__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isIdle");
}

- (int64_t)minimumNumberOfRows
{
  return 1;
}

- (int64_t)maximumNumberOfRows
{
  void *v2;
  void *v3;
  int64_t v4;

  -[DownloadsViewController presentingViewController](self, "presentingViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "horizontalSizeClass") == 2)
    v4 = 10;
  else
    v4 = 5;

  return v4;
}

- (void)viewDidLoad
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)DownloadsViewController;
  -[SFPopoverSizingTableViewController viewDidLoad](&v4, sel_viewDidLoad);
  -[DownloadsViewController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("DownloadCell"));
  objc_msgSend(v3, "setDragDelegate:", self);
  objc_msgSend(v3, "setAccessibilityIdentifier:", CFSTR("Downloads"));

}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)DownloadsViewController;
  -[SFPopoverSizingTableViewController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[DownloadsViewController _updateDoneButton](self, "_updateDoneButton");
  -[_SFDownloadManager didBeginViewingDownloads](self->_downloadManager, "didBeginViewingDownloads");
}

- (void)viewWillDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)DownloadsViewController;
  -[DownloadsViewController viewWillDisappear:](&v4, sel_viewWillDisappear_, a3);
  -[_SFDownloadManager didEndViewingDownloads](self->_downloadManager, "didEndViewingDownloads");
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)DownloadsViewController;
  -[SFPopoverSizingTableViewController viewWillTransitionToSize:withTransitionCoordinator:](&v5, sel_viewWillTransitionToSize_withTransitionCoordinator_, a4, a3.width, a3.height);
  -[DownloadsViewController _updateDoneButton](self, "_updateDoneButton");
}

- (CGSize)preferredContentSize
{
  double v2;
  double v3;
  objc_super v4;
  CGSize result;

  v4.receiver = self;
  v4.super_class = (Class)DownloadsViewController;
  -[SFPopoverSizingTableViewController preferredContentSize](&v4, sel_preferredContentSize);
  v3 = 360.0;
  result.height = v2;
  result.width = v3;
  return result;
}

- (void)_updateDoneButton
{
  char v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  v3 = -[DownloadsViewController _isInPopoverPresentation](self, "_isInPopoverPresentation");
  -[DownloadsViewController navigationItem](self, "navigationItem");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "leftBarButtonItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if ((v3 & 1) != 0)
  {
    if (v4)
      objc_msgSend(v8, "setLeftBarButtonItem:", 0);
  }
  else if (!v4)
  {
    v5 = objc_alloc(MEMORY[0x1E0DC34F0]);
    v6 = (void *)objc_msgSend(v5, "initWithBarButtonSystemItem:target:action:", objc_msgSend(MEMORY[0x1E0DC34F0], "_sf_popoverDoneButtonItem"), self, sel__dismiss);
    objc_msgSend(v8, "setLeftBarButtonItem:", v6);

    objc_msgSend(v8, "leftBarButtonItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setAccessibilityIdentifier:", CFSTR("DoneButton"));

  }
}

- (void)_dismiss
{
  id v2;

  -[DownloadsViewController presentingViewController](self, "presentingViewController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (void)_downloadsDidChange:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  DownloadsViewController *v18;
  id v19;

  -[_SFDownloadManager downloads](self->_downloadManager, "downloads", a3);
  v14 = (id)objc_claimAutoreleasedReturnValue();
  v4 = (void *)-[NSMutableArray copy](self->_downloads, "copy");
  if (objc_msgSend(v14, "count"))
  {
    -[DownloadsViewController tableView](self, "tableView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "differenceFromArray:withOptions:", v4, 4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __47__DownloadsViewController__downloadsDidChange___block_invoke;
    v15[3] = &unk_1E9CF2AF8;
    v16 = v6;
    v17 = v5;
    v18 = self;
    v19 = v14;
    v7 = v5;
    v8 = v6;
    objc_msgSend(v7, "performBatchUpdates:completion:", v15, 0);
    -[DownloadsViewController preferredContentSize](self, "preferredContentSize");
    v10 = v9;
    v12 = v11;
    -[DownloadsViewController navigationController](self, "navigationController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setPreferredContentSize:", v10, v12);

  }
  else
  {
    -[DownloadsViewController _dismiss](self, "_dismiss");
  }

}

void __47__DownloadsViewController__downloadsDidChange___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  void *v31;
  _BYTE v32[128];
  void *v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "insertions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v27, v34, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v28 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        if (objc_msgSend(v7, "associatedIndex") == 0x7FFFFFFFFFFFFFFFLL)
        {
          v8 = *(void **)(a1 + 40);
          objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", objc_msgSend(v7, "index"), 0);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = v9;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v33, 1);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "insertRowsAtIndexPaths:withRowAnimation:", v10, 100);
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", objc_msgSend(v7, "associatedIndex"), 0);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", objc_msgSend(v7, "index"), 0);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 40), "moveRowAtIndexPath:toIndexPath:", v9, v10);
        }

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v27, v34, 16);
    }
    while (v4);
  }

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "removals", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v32, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v24;
    do
    {
      for (j = 0; j != v13; ++j)
      {
        if (*(_QWORD *)v24 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * j);
        if (objc_msgSend(v16, "associatedIndex") == 0x7FFFFFFFFFFFFFFFLL)
        {
          v17 = *(void **)(a1 + 40);
          objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", objc_msgSend(v16, "index"), 0);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = v18;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v31, 1);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "deleteRowsAtIndexPaths:withRowAnimation:", v19, 100);

        }
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v32, 16);
    }
    while (v13);
  }

  v20 = objc_msgSend(*(id *)(a1 + 56), "mutableCopy");
  v21 = *(_QWORD *)(a1 + 48);
  v22 = *(void **)(v21 + 1064);
  *(_QWORD *)(v21 + 1064) = v20;

}

- (id)quickLookTransitionViewForDownload:(id)a3
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = -[NSMutableArray indexOfObject:](self->_downloads, "indexOfObject:", a3);
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v5 = 0;
  }
  else
  {
    v6 = v4;
    -[DownloadsViewController tableView](self, "tableView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", v6, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "cellForRowAtIndexPath:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "iconView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (BOOL)safari_prefersHalfHeightSheetPresentationWithLoweredBar
{
  return 1;
}

- (void)cancelDownload:(id)a3
{
  objc_msgSend(a3, "cancel");
}

- (void)revealDownload:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a3;
  objc_msgSend(v3, "reveal");
  objc_msgSend(MEMORY[0x1E0D89B98], "sharedLogger");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mimeType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "uti");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "didRevealDownloadWithMIMEType:uti:result:", v4, v5, 0);
}

- (void)resumeDownload:(id)a3
{
  id v3;
  void *v4;
  id v5;

  v3 = a3;
  +[Application sharedApplication](Application, "sharedApplication");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "defaultProcessPool");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "resumeInProcessPool:", v5);
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return -[NSMutableArray count](self->_downloads, "count", a3, a4);
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSMutableArray *downloads;
  uint64_t v11;
  void *v12;
  void *v13;

  v6 = a4;
  objc_msgSend(a3, "dequeueReusableCellWithIdentifier:", CFSTR("DownloadCell"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[DownloadsViewController _isInPopoverPresentation](self, "_isInPopoverPresentation");
  if ((v8 & 1) != 0)
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  else
    objc_msgSend(MEMORY[0x1E0DC3658], "tableCellPlainBackgroundColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBackgroundColor:", v9);

  objc_msgSend(v7, "sf_setUsesVibrantSelection:", v8);
  downloads = self->_downloads;
  v11 = objc_msgSend(v6, "row");

  -[NSMutableArray objectAtIndexedSubscript:](downloads, "objectAtIndexedSubscript:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[_SFDownloadManager iconCache](self->_downloadManager, "iconCache");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setIconCache:", v13);

  objc_msgSend(v7, "setDownload:", v12);
  objc_msgSend(v7, "setDelegate:", self);

  return v7;
}

- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4
{
  void *v4;
  BOOL v5;

  -[NSMutableArray objectAtIndexedSubscript:](self->_downloads, "objectAtIndexedSubscript:", objc_msgSend(a4, "row", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "state") != 1;

  return v5;
}

- (id)tableView:(id)a3 titleForDeleteConfirmationButtonForRowAtIndexPath:(id)a4
{
  return (id)_WBSLocalizedString();
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  void *v6;
  _SFDownloadManager *downloadManager;
  void *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  -[NSMutableArray objectAtIndexedSubscript:](self->_downloads, "objectAtIndexedSubscript:", objc_msgSend(a5, "row", a3, a4));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  downloadManager = self->_downloadManager;
  v9[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[_SFDownloadManager removeDownloads:](downloadManager, "removeDownloads:", v8);

}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  void *v4;
  BOOL v5;

  -[NSMutableArray objectAtIndexedSubscript:](self->_downloads, "objectAtIndexedSubscript:", objc_msgSend(a4, "row", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "state") == 4;

  return v5;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  NSMutableArray *downloads;
  id v7;
  id v8;
  id WeakRetained;
  id v10;

  downloads = self->_downloads;
  v7 = a4;
  v8 = a3;
  -[NSMutableArray objectAtIndexedSubscript:](downloads, "objectAtIndexedSubscript:", objc_msgSend(v7, "row"));
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "deselectRowAtIndexPath:animated:", v7, 1);

  WeakRetained = objc_loadWeakRetained((id *)&self->_downloadOpenHandler);
  objc_msgSend(WeakRetained, "openDownload:", v10);

}

- (void)tableView:(id)a3 didEndDisplayingCell:(id)a4 forRowAtIndexPath:(id)a5
{
  objc_msgSend(a4, "setDownload:", 0);
}

- (id)tableView:(id)a3 itemsForBeginningDragSession:(id)a4 atIndexPath:(id)a5
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  _QWORD v13[4];
  id v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  -[NSMutableArray objectAtIndexedSubscript:](self->_downloads, "objectAtIndexedSubscript:", objc_msgSend(a5, "row", a3, a4));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "state") == 4)
  {
    v6 = objc_alloc_init(MEMORY[0x1E0CB36C8]);
    objc_msgSend(v5, "filename");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setSuggestedName:", v7);

    objc_msgSend(v5, "uti");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __78__DownloadsViewController_tableView_itemsForBeginningDragSession_atIndexPath___block_invoke;
    v13[3] = &unk_1E9CF51A8;
    v9 = v5;
    v14 = v9;
    objc_msgSend(v6, "registerFileRepresentationForTypeIdentifier:fileOptions:visibility:loadHandler:", v8, 1, 0, v13);

    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3758]), "initWithItemProvider:", v6);
    objc_msgSend(v10, "setLocalObject:", v9);
    v15[0] = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v11;
}

uint64_t __78__DownloadsViewController_tableView_itemsForBeginningDragSession_atIndexPath___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  unsigned __int8 v6;

  v6 = 0;
  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "completedFileURL:", &v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, void *, _QWORD, _QWORD))v3 + 2))(v3, v4, v6, 0);

  return 0;
}

- (void)tableView:(id)a3 dragSessionWillBegin:(id)a4
{
  id v4;

  objc_msgSend(MEMORY[0x1E0D89B98], "sharedLogger", a3, a4);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "didStartDragWithDragContentType:", 7);

}

- (id)tableView:(id)a3 dragPreviewParametersForRowAtIndexPath:(id)a4
{
  id v4;
  void *v5;

  v4 = objc_alloc_init(MEMORY[0x1E0DC3768]);
  objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v5);

  return v4;
}

- (id)tableView:(id)a3 itemsForAddingToDragSession:(id)a4 atIndexPath:(id)a5 point:(CGPoint)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  -[NSMutableArray objectAtIndexedSubscript:](self->_downloads, "objectAtIndexedSubscript:", objc_msgSend(v11, "row"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  objc_msgSend(v10, "items", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v22;
    while (2)
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v22 != v16)
          objc_enumerationMutation(v13);
        objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * v17), "localObject");
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        if (v18 == v12)
        {

          v19 = (void *)MEMORY[0x1E0C9AA60];
          goto LABEL_11;
        }
        ++v17;
      }
      while (v15 != v17);
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      if (v15)
        continue;
      break;
    }
  }

  -[DownloadsViewController tableView:itemsForBeginningDragSession:atIndexPath:](self, "tableView:itemsForBeginningDragSession:atIndexPath:", v9, v10, v11);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_11:

  return v19;
}

- (int64_t)_tableView:(id)a3 dataOwnerForDragSession:(id)a4 atIndexPath:(id)a5
{
  void *v5;
  int64_t v6;

  -[NSMutableArray objectAtIndexedSubscript:](self->_downloads, "objectAtIndexedSubscript:", objc_msgSend(a5, "row", a3, a4));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "dataOwner");

  return v6;
}

- (DownloadOpenHandler)downloadOpenHandler
{
  return (DownloadOpenHandler *)objc_loadWeakRetained((id *)&self->_downloadOpenHandler);
}

- (void)setDownloadOpenHandler:(id)a3
{
  objc_storeWeak((id *)&self->_downloadOpenHandler, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_downloadOpenHandler);
  objc_storeStrong((id *)&self->_downloads, 0);
  objc_storeStrong((id *)&self->_downloadManager, 0);
}

@end
