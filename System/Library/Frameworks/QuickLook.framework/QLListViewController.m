@implementation QLListViewController

- (QLListViewController)initWithPreviewItemStore:(id)a3 currentPreviewItem:(id)a4
{
  id v7;
  id v8;
  QLListViewController *v9;
  uint64_t v10;
  QLListCellManager *cellManager;
  uint64_t v12;
  UITableViewController *tableViewController;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  QLListViewController *v22;
  objc_super v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v24.receiver = self;
  v24.super_class = (Class)QLListViewController;
  v9 = -[QLListViewController init](&v24, sel_init);
  if (v9)
  {
    v10 = objc_opt_new();
    cellManager = v9->_cellManager;
    v9->_cellManager = (QLListCellManager *)v10;

    objc_storeStrong((id *)&v9->_previewItemStore, a3);
    objc_storeStrong((id *)&v9->_currentPreviewItem, a4);
    v12 = objc_msgSend(objc_alloc(MEMORY[0x24BEBDA00]), "initWithStyle:", 0);
    tableViewController = v9->_tableViewController;
    v9->_tableViewController = (UITableViewController *)v12;

    -[UITableViewController tableView](v9->_tableViewController, "tableView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setDataSource:", v9);

    -[UITableViewController tableView](v9->_tableViewController, "tableView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setDelegate:", v9);

    -[QLItem previewItemTitle](v9->_currentPreviewItem, "previewItemTitle");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITableViewController setTitle:](v9->_tableViewController, "setTitle:", v16);

    v17 = objc_alloc(MEMORY[0x24BEBD410]);
    QLLocalizedString();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_msgSend(v17, "initWithTitle:style:target:action:", v18, 2, v9, sel__dismiss);

    -[UITableViewController navigationItem](v9->_tableViewController, "navigationItem");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setRightBarButtonItem:", v19);

    v25[0] = v9->_tableViewController;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v25, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[QLListViewController setViewControllers:](v9, "setViewControllers:", v21);

    -[QLListViewController setModalPresentationStyle:](v9, "setModalPresentationStyle:", 0);
    if (-[QLPreviewItemStore isArchive](v9->_previewItemStore, "isArchive"))
      -[QLListViewController _generateItemsAndFolders](v9, "_generateItemsAndFolders");
    v22 = v9;

  }
  return v9;
}

- (void)_dismiss
{
  -[QLListViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)_updateNavigationBarVisibilityForPresentationStyle:(int64_t)a3
{
  -[QLListViewController setNavigationBarHidden:](self, "setNavigationBarHidden:", a3 == 7);
}

- (void)setBarButton:(id)a3
{
  id WeakRetained;
  id v5;
  void *v6;
  void *v7;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_barButton);

  if (WeakRetained != obj)
  {
    v5 = objc_storeWeak((id *)&self->_barButton, obj);

    if (obj)
    {
      -[QLListViewController setModalPresentationStyle:](self, "setModalPresentationStyle:", 7);
      -[QLListViewController popoverPresentationController](self, "popoverPresentationController");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setBarButtonItem:", obj);
      objc_msgSend(MEMORY[0x24BEBD4B8], "systemBackgroundColor");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setBackgroundColor:", v7);

      objc_msgSend(v6, "setDelegate:", self);
      objc_msgSend(v6, "setPermittedArrowDirections:", 15);

    }
  }

}

- (void)prepareForPopoverPresentation:(id)a3
{
  -[QLListViewController _updateNavigationBarVisibilityForPresentationStyle:](self, "_updateNavigationBarVisibilityForPresentationStyle:", objc_msgSend(a3, "presentationStyle"));
}

- (id)presentationController:(id)a3 viewControllerForAdaptivePresentationStyle:(int64_t)a4
{
  -[QLListViewController _updateNavigationBarVisibilityForPresentationStyle:](self, "_updateNavigationBarVisibilityForPresentationStyle:", a4);
  return 0;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  if (self->_itemsWithFolders)
    return -[NSArray count](self->_itemsWithFolders, "count", a3, a4);
  else
    return -[QLPreviewItemStore numberOfItems](self->_previewItemStore, "numberOfItems", a3, a4);
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSArray *itemsWithFolders;
  void *v10;
  void *v11;
  void *v12;
  QLPreviewItemStore *previewItemStore;
  uint64_t v14;
  _QWORD v16[5];
  uint64_t v17;
  id *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "dequeueReusableCellWithIdentifier:", kQLArchiveCellIdentifier);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    +[QLListCell listCell](QLListCell, "listCell");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v17 = 0;
  v18 = (id *)&v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__3;
  v21 = __Block_byref_object_dispose__3;
  v22 = 0;
  itemsWithFolders = self->_itemsWithFolders;
  if (itemsWithFolders)
  {
    -[NSArray objectAtIndexedSubscript:](itemsWithFolders, "objectAtIndexedSubscript:", objc_msgSend(v7, "item"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_storeStrong(v18 + 5, v10);
      objc_msgSend(v10, "relativePath");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "pathComponents");
    }
    else
    {
      objc_msgSend(v10, "lastPathComponent");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setFolderName:", v11);
      objc_msgSend(v10, "pathComponents");
    }
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setFileDepthLevel:", objc_msgSend(v12, "count"));

  }
  else
  {
    previewItemStore = self->_previewItemStore;
    v14 = objc_msgSend(v7, "item");
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __56__QLListViewController_tableView_cellForRowAtIndexPath___block_invoke;
    v16[3] = &unk_24C724C10;
    v16[4] = &v17;
    -[QLPreviewItemStore previewItemAtIndex:withCompletionHandler:](previewItemStore, "previewItemAtIndex:withCompletionHandler:", v14, v16);
  }
  if (v18[5])
  {
    objc_msgSend(v8, "setItem:");
    -[QLListCellManager setupCell:withItem:atIndex:](self->_cellManager, "setupCell:withItem:atIndex:", v8, v18[5], objc_msgSend(v7, "item"));
  }
  _Block_object_dispose(&v17, 8);

  return v8;
}

void __56__QLListViewController_tableView_cellForRowAtIndexPath___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4
{
  return 54.0;
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  NSArray *itemsWithFolders;
  void *v5;
  char isKindOfClass;
  char v7;

  itemsWithFolders = self->_itemsWithFolders;
  if (itemsWithFolders)
  {
    -[NSArray objectAtIndexedSubscript:](itemsWithFolders, "objectAtIndexedSubscript:", objc_msgSend(a4, "item", a3));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    v7 = isKindOfClass ^ 1;
  }
  else
  {
    v7 = 1;
  }
  return v7 & 1;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSArray *itemsWithFolders;
  uint64_t v10;
  void *v11;
  QLPreviewItemStore *previewItemStore;
  uint64_t v13;
  void *v14;
  _QWORD v15[5];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__3;
  v20 = __Block_byref_object_dispose__3;
  v21 = 0;
  itemsWithFolders = self->_itemsWithFolders;
  if (itemsWithFolders)
  {
    -[NSArray objectAtIndexedSubscript:](itemsWithFolders, "objectAtIndexedSubscript:", objc_msgSend(v7, "item"));
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v17[5];
    v17[5] = v10;

  }
  else
  {
    previewItemStore = self->_previewItemStore;
    v13 = objc_msgSend(v7, "item");
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __58__QLListViewController_tableView_didSelectRowAtIndexPath___block_invoke;
    v15[3] = &unk_24C724C10;
    v15[4] = &v16;
    -[QLPreviewItemStore previewItemAtIndex:withCompletionHandler:](previewItemStore, "previewItemAtIndex:withCompletionHandler:", v13, v15);
  }
  -[QLListViewController archiveDelegate](self, "archiveDelegate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "didSelectPreviewItem:", v17[5]);

  -[QLListViewController _dismiss](self, "_dismiss");
  _Block_object_dispose(&v16, 8);

}

void __58__QLListViewController_tableView_didSelectRowAtIndexPath___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (void)_generateItemsAndFolders
{
  NSArray *v3;
  unint64_t v4;
  uint64_t v5;
  QLPreviewItemStore *previewItemStore;
  NSArray *itemsWithFolders;
  _QWORD v8[5];
  NSArray *v9;

  v3 = (NSArray *)objc_opt_new();
  if (-[QLPreviewItemStore numberOfItems](self->_previewItemStore, "numberOfItems"))
  {
    v4 = 0;
    v5 = MEMORY[0x24BDAC760];
    do
    {
      previewItemStore = self->_previewItemStore;
      v8[0] = v5;
      v8[1] = 3221225472;
      v8[2] = __48__QLListViewController__generateItemsAndFolders__block_invoke;
      v8[3] = &unk_24C725008;
      v8[4] = self;
      v9 = v3;
      -[QLPreviewItemStore previewItemAtIndex:withCompletionHandler:](previewItemStore, "previewItemAtIndex:withCompletionHandler:", v4, v8);

      ++v4;
    }
    while (-[QLPreviewItemStore numberOfItems](self->_previewItemStore, "numberOfItems") > v4);
  }
  itemsWithFolders = self->_itemsWithFolders;
  self->_itemsWithFolders = v3;

}

void __48__QLListViewController__generateItemsAndFolders__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  id v5;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "relativePath");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_addPath:fromPreviewItem:intoArray:", v5, v4, *(_QWORD *)(a1 + 40));

}

- (void)_addPath:(id)a3 fromPreviewItem:(id)a4 intoArray:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;

  v14 = a3;
  v8 = a4;
  v9 = a5;
  if (v14
    && (objc_msgSend(v14, "isEqualToString:", &stru_24C72A1F8) & 1) == 0
    && (objc_msgSend(v14, "isEqualToString:", CFSTR("/")) & 1) == 0)
  {
    objc_msgSend(v14, "stringByDeletingLastPathComponent");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[QLListViewController _addPath:fromPreviewItem:intoArray:](self, "_addPath:fromPreviewItem:intoArray:", v10, v8, v9);

    objc_msgSend(v8, "relativePath");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v10) = objc_msgSend(v14, "isEqualToString:", v11);

    v12 = v9;
    if ((_DWORD)v10)
    {
      v13 = v8;
LABEL_8:
      objc_msgSend(v12, "addObject:", v13);
      goto LABEL_9;
    }
    if ((objc_msgSend(v9, "containsObject:", v14) & 1) == 0)
    {
      v12 = v9;
      v13 = v14;
      goto LABEL_8;
    }
  }
LABEL_9:

}

- (QLListViewControllerDelegate)archiveDelegate
{
  return (QLListViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_archiveDelegate);
}

- (void)setArchiveDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_archiveDelegate, a3);
}

- (UIBarButtonItem)barButton
{
  return (UIBarButtonItem *)objc_loadWeakRetained((id *)&self->_barButton);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_barButton);
  objc_destroyWeak((id *)&self->_archiveDelegate);
  objc_storeStrong((id *)&self->_itemsWithFolders, 0);
  objc_storeStrong((id *)&self->_cellManager, 0);
  objc_storeStrong((id *)&self->_previewItemStore, 0);
  objc_storeStrong((id *)&self->_currentPreviewItem, 0);
  objc_storeStrong((id *)&self->_tableViewController, 0);
  objc_storeStrong((id *)&self->_presentationController, 0);
}

@end
