@implementation BookmarkFolderLibraryItemController

- (BookmarkFolderLibraryItemController)initWithConfiguration:(id)a3 sectionController:(id)a4 folder:(id)a5
{
  id v9;
  BookmarkFolderLibraryItemController *v10;
  BookmarkFolderLibraryItemController *v11;
  BookmarkFolderLibraryItemController *v12;
  objc_super v14;

  v9 = a5;
  v14.receiver = self;
  v14.super_class = (Class)BookmarkFolderLibraryItemController;
  v10 = -[LibraryItemController initWithConfiguration:sectionController:](&v14, sel_initWithConfiguration_sectionController_, a3, a4);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_folder, a5);
    v11->_allowsEditing = 1;
    v12 = v11;
  }

  return v11;
}

- (unint64_t)hash
{
  return -[WebBookmark hash](self->_folder, "hash");
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  WebBookmark *folder;
  void *v6;
  char v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    folder = self->_folder;
    objc_msgSend(v4, "folder");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[WebBookmark isEqualToBookmark:](folder, "isEqualToBookmark:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  +[Application sharedApplication](Application, "sharedApplication");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "tabGroupManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeTabGroupObserver:", self);

  v6.receiver = self;
  v6.super_class = (Class)BookmarkFolderLibraryItemController;
  -[BookmarkFolderLibraryItemController dealloc](&v6, sel_dealloc);
}

- (void)updateListContentConfiguration:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  const __CFString *v7;
  int v8;
  void *v9;
  int v10;
  void *v11;
  id v12;

  v12 = a3;
  -[WebBookmark localizedTitle](self->_folder, "localizedTitle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setText:", v4);

  v5 = -[WebBookmark specialID](self->_folder, "specialID");
  if (v5 == *MEMORY[0x1E0DCCB08])
  {
    v6 = (void *)MEMORY[0x1E0DC3870];
    v7 = CFSTR("bookmark");
  }
  else
  {
    v8 = -[WebBookmark identifier](self->_folder, "identifier");
    -[WebBookmarkCollection favoritesFolder](self->_collection, "favoritesFolder");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "identifier");

    v6 = (void *)MEMORY[0x1E0DC3870];
    if (v8 == v10)
      v7 = CFSTR("star");
    else
      v7 = CFSTR("folder");
  }
  objc_msgSend(v6, "systemImageNamed:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setImage:", v11);

}

- (id)viewController
{
  BookmarksTableViewController *viewController;
  BookmarksTableViewController *v4;
  BookmarksTableViewController *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  viewController = self->_viewController;
  if (!viewController)
  {
    v4 = -[BookmarksTableViewController initWithFolder:inCollection:]([BookmarksTableViewController alloc], "initWithFolder:inCollection:", self->_folder, self->_collection);
    v5 = self->_viewController;
    self->_viewController = v4;

    -[BookmarksTableViewController setDelegate:](self->_viewController, "setDelegate:", self);
    -[BookmarkFolderLibraryItemController linkPreviewProvider](self, "linkPreviewProvider");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[BookmarksTableViewController setLinkPreviewProvider:](self->_viewController, "setLinkPreviewProvider:", v6);

    -[BookmarksTableViewController setNavigationIntentHandler:](self->_viewController, "setNavigationIntentHandler:", self);
    -[BookmarksTableViewController navigationItem](self->_viewController, "navigationItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setLargeTitleDisplayMode:", 2);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObserver:selector:name:object:", self, sel__folderContentsDidChange_, *MEMORY[0x1E0DCCC10], 0);

    +[Application sharedApplication](Application, "sharedApplication");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "tabGroupManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addTabGroupObserver:", self);

    viewController = self->_viewController;
  }
  return viewController;
}

- (BOOL)selectionFollowsFocus
{
  return 0;
}

- (void)updateToolbarIfNeeded
{
  void *v3;
  void *v4;
  void *v5;

  -[BookmarkFolderLibraryItemController topViewController](self, "topViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BookmarkFolderLibraryItemController topViewController](self, "topViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BookmarkFolderLibraryItemController _toolbarItemsForViewController:](self, "_toolbarItemsForViewController:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setToolbarItems:animated:", v5, 0);

  -[BookmarkFolderLibraryItemController _createToolbarItemsIfNecessary](self, "_createToolbarItemsIfNecessary");
}

- (id)topViewController
{
  void *v3;
  BookmarksTableViewController *v4;
  char isKindOfClass;
  BookmarksTableViewController *viewController;
  BookmarksTableViewController *v7;

  -[BookmarksTableViewController navigationController](self->_viewController, "navigationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "topViewController");
  v4 = (BookmarksTableViewController *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  viewController = v4;
  if ((isKindOfClass & 1) == 0)
    viewController = self->_viewController;
  v7 = viewController;

  return v7;
}

- (void)_folderContentsDidChange:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "valueForKey:", *MEMORY[0x1E0DCCBE8]);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  v5 = v6;
  if (v6)
  {
    -[BookmarkFolderLibraryItemController _reloadFolderContentsForFolderIDIfNeeded:](self, "_reloadFolderContentsForFolderIDIfNeeded:", objc_msgSend(v6, "intValue"));
    v5 = v6;
  }

}

- (void)_reloadFolderContentsForFolderIDIfNeeded:(int)a3
{
  id v4;

  -[BookmarkFolderLibraryItemController topViewController](self, "topViewController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "folderID") == a3)
    objc_msgSend(v4, "reloadBookmarks");

}

- (void)_didPressEditingDoneButton
{
  -[BookmarkFolderLibraryItemController _setEditingFromToolbarButton:](self, "_setEditingFromToolbarButton:", 0);
}

- (void)_didPressEditButton
{
  -[BookmarkFolderLibraryItemController _setEditingFromToolbarButton:](self, "_setEditingFromToolbarButton:", 1);
}

- (void)toggleEditBookmarks
{
  -[BookmarkFolderLibraryItemController _setEditingFromToolbarButton:](self, "_setEditingFromToolbarButton:", !self->_isEditing);
}

- (void)_didPressNewFolderButton
{
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  -[BookmarkFolderLibraryItemController topViewController](self, "topViewController");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DCCBA0], "mainBookmarkCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc(MEMORY[0x1E0DCCB98]);
  v5 = objc_msgSend(v10, "folderID");
  objc_msgSend(v3, "configuration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "initFolderWithParentID:collectionType:", v5, objc_msgSend(v6, "collectionType"));

  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CD5660]), "initWithBookmark:inCollection:addingBookmark:", v7, v3, 0);
  objc_msgSend(v8, "setDelegate:", self);
  objc_msgSend(v10, "navigationController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "pushViewController:animated:", v8, 1);

}

- (void)_createToolbarItemsIfNecessary
{
  id v3;
  void *v4;
  UIBarButtonItem *v5;
  UIBarButtonItem *createFolderButtonItem;
  UIBarButtonItem *v7;
  UIBarButtonItem *editButtonItem;
  UIBarButtonItem *v9;
  UIBarButtonItem *editingDoneButtonItem;
  UIBarButtonItem *v11;
  UIBarButtonItem *flexibleSpaceItem;

  if (!self->_createFolderButtonItem)
  {
    v3 = objc_alloc(MEMORY[0x1E0DC34F0]);
    _WBSLocalizedString();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (UIBarButtonItem *)objc_msgSend(v3, "initWithTitle:style:target:action:", v4, 0, self, sel__didPressNewFolderButton);
    createFolderButtonItem = self->_createFolderButtonItem;
    self->_createFolderButtonItem = v5;

    -[UIBarButtonItem setAccessibilityIdentifier:](self->_createFolderButtonItem, "setAccessibilityIdentifier:", CFSTR("BookmarksNewFolderButton"));
    v7 = (UIBarButtonItem *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 2, self, sel__didPressEditButton);
    editButtonItem = self->_editButtonItem;
    self->_editButtonItem = v7;

    -[UIBarButtonItem setAccessibilityIdentifier:](self->_editButtonItem, "setAccessibilityIdentifier:", CFSTR("BookmarksEditButton"));
    v9 = (UIBarButtonItem *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 0, self, sel__didPressEditingDoneButton);
    editingDoneButtonItem = self->_editingDoneButtonItem;
    self->_editingDoneButtonItem = v9;

    -[UIBarButtonItem setAccessibilityIdentifier:](self->_editingDoneButtonItem, "setAccessibilityIdentifier:", CFSTR("BookmarksDoneButton"));
    v11 = (UIBarButtonItem *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 5, 0, 0);
    flexibleSpaceItem = self->_flexibleSpaceItem;
    self->_flexibleSpaceItem = v11;

  }
}

- (id)_toolbarItemsForViewController:(id)a3
{
  id v4;
  void *v5;
  int v6;
  UIBarButtonItem *flexibleSpaceItem;
  void *v8;
  UIBarButtonItem **p_createFolderButtonItem;
  uint64_t v10;
  void *v11;
  UIBarButtonItem *v12;
  UIBarButtonItem *editButtonItem;
  UIBarButtonItem *v15;
  UIBarButtonItem *v16;
  UIBarButtonItem *v17;
  UIBarButtonItem *v18;
  UIBarButtonItem *createFolderButtonItem;
  UIBarButtonItem *v20;
  UIBarButtonItem *editingDoneButtonItem;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[BookmarkFolderLibraryItemController _createToolbarItemsIfNecessary](self, "_createToolbarItemsIfNecessary");
  +[FeatureManager sharedFeatureManager](FeatureManager, "sharedFeatureManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isBookmarksAvailable");

  if (v6)
  {
    if (self->_isEditing && objc_msgSend(v4, "canCreateNewFolder"))
    {
      flexibleSpaceItem = self->_flexibleSpaceItem;
      createFolderButtonItem = self->_createFolderButtonItem;
      v20 = flexibleSpaceItem;
      editingDoneButtonItem = self->_editingDoneButtonItem;
      v8 = (void *)MEMORY[0x1E0C99D20];
      p_createFolderButtonItem = &createFolderButtonItem;
      v10 = 3;
    }
    else
    {
      if (objc_msgSend(v4, "isEditing"))
      {
        v12 = self->_editingDoneButtonItem;
        v17 = self->_flexibleSpaceItem;
        v18 = v12;
        v8 = (void *)MEMORY[0x1E0C99D20];
        p_createFolderButtonItem = &v17;
      }
      else
      {
        editButtonItem = self->_editButtonItem;
        v15 = self->_flexibleSpaceItem;
        v16 = editButtonItem;
        v8 = (void *)MEMORY[0x1E0C99D20];
        p_createFolderButtonItem = &v15;
      }
      v10 = 2;
    }
    objc_msgSend(v8, "arrayWithObjects:count:", p_createFolderButtonItem, v10, v15, v16, v17, v18, createFolderButtonItem, v20, editingDoneButtonItem, v22);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v11;
}

- (void)_updateToolbarItemsForViewController:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  id v7;

  if (self->_allowsEditing)
  {
    v4 = a4;
    v6 = a3;
    -[BookmarkFolderLibraryItemController _toolbarItemsForViewController:](self, "_toolbarItemsForViewController:", v6);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setToolbarItems:animated:", v7, v4);

  }
}

- (void)_setEditingFromToolbarButton:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0D4EBD8], "sharedCoordinator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v5;
  if (!v3)
  {
    objc_msgSend(v5, "unlockBookmarksSoon");
    -[BookmarkFolderLibraryItemController topViewController](self, "topViewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "navigationController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "navigationBar");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setNeedsLayout");

    goto LABEL_5;
  }
  if ((objc_msgSend(v5, "lockBookmarks") & 1) != 0)
  {
LABEL_5:
    -[BookmarkFolderLibraryItemController topViewController](self, "topViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    self->_isEditing = v3;
    objc_msgSend(v8, "setEditing:animated:", v3, 1);
    goto LABEL_6;
  }
  v6 = (void *)MEMORY[0x1E0D4EBD8];
  -[BookmarkFolderLibraryItemController topViewController](self, "topViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "showLockedDatabaseAlertForAction:fromViewController:", 0, v7);

  objc_msgSend(MEMORY[0x1E0D89B98], "sharedLogger");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "didPreventBookmarkActionWithBookmarkType:actionType:", 0, 2);
LABEL_6:

}

- (BOOL)bookmarkInfoViewControllerShouldUseTranslucentAppearance:(id)a3
{
  return 0;
}

- (BOOL)panelViewControllerShouldUseSearchControllerInNavigationItem:(id)a3
{
  return 1;
}

- (void)panelViewControllerDidBeginEditing:(id)a3
{
  id v4;

  -[BookmarkFolderLibraryItemController topViewController](self, "topViewController", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[BookmarkFolderLibraryItemController _updateToolbarItemsForViewController:animated:](self, "_updateToolbarItemsForViewController:animated:", v4, 1);

}

- (void)panelViewControllerDidEndEditing:(id)a3
{
  id v4;

  -[BookmarkFolderLibraryItemController topViewController](self, "topViewController", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[BookmarkFolderLibraryItemController _updateToolbarItemsForViewController:animated:](self, "_updateToolbarItemsForViewController:animated:", v4, 1);

}

- (UIEdgeInsets)separatorInsetForBookmarksTableViewController:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  UIEdgeInsets result;

  v3 = *MEMORY[0x1E0DC49E8];
  v4 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
  v5 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
  v6 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

- (UIEdgeInsets)contentInsetForBookmarksTableViewController:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  UIEdgeInsets result;

  v3 = *MEMORY[0x1E0DC49E8];
  v4 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
  v5 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
  v6 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

- (BOOL)bookmarksTableViewShouldDispatchNavigationIntent:(id)a3 forSelectedBookmark:(id)a4
{
  return 1;
}

- (BOOL)bookmarksTableViewIsReadOnly:(id)a3
{
  return 0;
}

- (void)bookmarksTableViewControllerWillDisappear:(id)a3
{
  id v4;

  if (self->_isEditing)
  {
    v4 = a3;
    -[BookmarkFolderLibraryItemController _setEditingFromToolbarButton:](self, "_setEditingFromToolbarButton:", 0);
    objc_msgSend(v4, "setEditing:", 0);

  }
}

- (id)syntheticBookmarkProviderForBookmarkInfoViewController:(id)a3
{
  return objc_loadWeakRetained((id *)&self->_tabGroupProvider);
}

- (TabGroupProvider)tabGroupProvider
{
  return (TabGroupProvider *)objc_loadWeakRetained((id *)&self->_tabGroupProvider);
}

- (void)handleNavigationIntent:(id)a3 completion:(id)a4
{
  _SFNavigationIntentHandling **p_navigationIntentHandler;
  id v6;
  id v7;
  id WeakRetained;

  p_navigationIntentHandler = &self->_navigationIntentHandler;
  v6 = a4;
  v7 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_navigationIntentHandler);
  objc_msgSend(WeakRetained, "handleNavigationIntent:completion:", v7, v6);

}

- (void)dispatchNavigationIntent:(id)a3
{
  id v4;
  id WeakRetained;

  v4 = a3;
  objc_msgSend(v4, "setShouldDismissSidebarOnLoad:", 1);
  WeakRetained = objc_loadWeakRetained((id *)&self->_navigationIntentHandler);
  objc_msgSend(WeakRetained, "dispatchNavigationIntent:", v4);

}

- (BOOL)isSpringLoaded
{
  return 1;
}

- (unint64_t)dropOperationForSession:(id)a3
{
  return objc_msgSend(MEMORY[0x1E0DCCB98], "_sf_operationForDropSession:", a3);
}

- (int64_t)dropIntentForSession:(id)a3
{
  return 2;
}

- (void)performDropWithProposal:(id)a3 session:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  WebBookmarkCollection *collection;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[5];
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = objc_msgSend(a3, "operation");
  if (v7 == 2)
  {
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __71__BookmarkFolderLibraryItemController_performDropWithProposal_session___block_invoke;
    v17[3] = &unk_1E9CF1C48;
    v17[4] = self;
    objc_msgSend(MEMORY[0x1E0DCCB98], "_sf_webBookmarksFromDropSession:completionHandler:", v6, v17);
    goto LABEL_6;
  }
  if (v7 != 3)
  {
LABEL_6:
    objc_msgSend(MEMORY[0x1E0D89B98], "sharedLogger");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "didUseSidebarAction:", 19);

    goto LABEL_7;
  }
  objc_msgSend(v6, "items");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_sf_localBookmark");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    collection = self->_collection;
    v18[0] = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[WebBookmark identifier](self->_folder, "identifier");
    -[LibraryItemController sectionController](self, "sectionController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "presentingViewController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[WebBookmarkCollection dropBookmarks:inFolderWithID:presentingViewController:isAddingBookmark:](collection, v12, v13, v15, 0);

    goto LABEL_6;
  }
LABEL_7:

}

void __71__BookmarkFolderLibraryItemController_performDropWithProposal_session___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 104);
  v5 = *(void **)(v3 + 96);
  v6 = a2;
  v7 = objc_msgSend(v5, "identifier");
  objc_msgSend(*(id *)(a1 + 32), "sectionController");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "presentingViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[WebBookmarkCollection dropBookmarks:inFolderWithID:presentingViewController:isAddingBookmark:](v4, v6, v7, v8, 1);

}

- (void)tabGroupManagerDidUpdateTabGroups:(id)a3
{
  id v3;

  -[BookmarkFolderLibraryItemController topViewController](self, "topViewController", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "reloadAllSyntheticFolders");

}

- (void)tabGroupManager:(id)a3 didRemoveTabGroupWithUUID:(id)a4
{
  id v4;

  -[BookmarkFolderLibraryItemController topViewController](self, "topViewController", a3, a4);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reloadAllSyntheticFolders");

}

- (void)tabGroupManager:(id)a3 didUpdateTabGroupWithUUID:(id)a4
{
  id v4;

  -[BookmarkFolderLibraryItemController topViewController](self, "topViewController", a3, a4);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reloadAllSyntheticFolders");

}

- (void)tabGroupManager:(id)a3 didUpdateScopedBookmarkList:(id)a4
{
  -[BookmarkFolderLibraryItemController _reloadFolderContentsForFolderIDIfNeeded:](self, "_reloadFolderContentsForFolderIDIfNeeded:", objc_msgSend(a4, "folderID", a3));
}

- (id)accessibilityIdentifier
{
  return CFSTR("BookmarksLibraryItem");
}

- (WebBookmark)folder
{
  return self->_folder;
}

- (WebBookmarkCollection)collection
{
  return self->_collection;
}

- (void)setCollection:(id)a3
{
  objc_storeStrong((id *)&self->_collection, a3);
}

- (WBBookmarkProvider)bookmarkProvider
{
  return self->_bookmarkProvider;
}

- (void)setBookmarkProvider:(id)a3
{
  objc_storeStrong((id *)&self->_bookmarkProvider, a3);
}

- (OS_dispatch_queue)bookmarkProviderQueue
{
  return self->_bookmarkProviderQueue;
}

- (void)setBookmarkProviderQueue:(id)a3
{
  objc_storeStrong((id *)&self->_bookmarkProviderQueue, a3);
}

- (_SFNavigationIntentHandling)navigationIntentHandler
{
  return (_SFNavigationIntentHandling *)objc_loadWeakRetained((id *)&self->_navigationIntentHandler);
}

- (void)setNavigationIntentHandler:(id)a3
{
  objc_storeWeak((id *)&self->_navigationIntentHandler, a3);
}

- (LinkPreviewProvider)linkPreviewProvider
{
  return (LinkPreviewProvider *)objc_loadWeakRetained((id *)&self->_linkPreviewProvider);
}

- (void)setLinkPreviewProvider:(id)a3
{
  objc_storeWeak((id *)&self->_linkPreviewProvider, a3);
}

- (void)setTabGroupProvider:(id)a3
{
  objc_storeWeak((id *)&self->_tabGroupProvider, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_tabGroupProvider);
  objc_destroyWeak((id *)&self->_linkPreviewProvider);
  objc_destroyWeak((id *)&self->_navigationIntentHandler);
  objc_storeStrong((id *)&self->_bookmarkProviderQueue, 0);
  objc_storeStrong((id *)&self->_bookmarkProvider, 0);
  objc_storeStrong((id *)&self->_collection, 0);
  objc_storeStrong((id *)&self->_folder, 0);
  objc_storeStrong((id *)&self->_flexibleSpaceItem, 0);
  objc_storeStrong((id *)&self->_editingDoneButtonItem, 0);
  objc_storeStrong((id *)&self->_editButtonItem, 0);
  objc_storeStrong((id *)&self->_createFolderButtonItem, 0);
  objc_storeStrong((id *)&self->_viewController, 0);
}

@end
