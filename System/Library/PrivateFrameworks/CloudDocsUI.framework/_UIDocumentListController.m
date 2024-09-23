@implementation _UIDocumentListController

- (void)_commonInitWithModel:(id)a3
{
  _UIDocumentPickerContainerViewController *v4;
  id v5;

  v5 = a3;
  v4 = -[_UIDocumentPickerContainerViewController initWithModel:]([_UIDocumentPickerContainerViewController alloc], "initWithModel:", v5);
  -[_UIDocumentListController _setContainerViewController:](self, "_setContainerViewController:", v4);
  -[_UIDocumentListController setRestorationClass:](self, "setRestorationClass:", objc_opt_class());
  -[_UIDocumentListController setRestorationIdentifier:](self, "setRestorationIdentifier:", CFSTR("DocumentList"));
  -[_UIDocumentListController setAvailableActions:](self, "setAvailableActions:", 7);
  -[_UIDocumentListController setEdgesForExtendedLayout:](self, "setEdgesForExtendedLayout:", 0);
  -[_UIDocumentListController updateTitle](self, "updateTitle");
  if (!-[_UIDocumentListController hideSearchField](self, "hideSearchField"))
    -[_UIDocumentListController createSearchControllerWithModel:](self, "createSearchControllerWithModel:", v5);

}

- (_UIDocumentListController)init
{
  return -[_UIDocumentListController initWithURL:](self, "initWithURL:", 0);
}

- (_UIDocumentListController)initWithURL:(id)a3
{
  id v4;
  _UIDocumentListController *v5;
  int v6;
  id v7;
  void *v8;
  _UIDocumentPickerURLContainerModel *v9;
  void *v10;
  _UIDocumentPickerRootContainerModel *v11;
  _UIDocumentListController *v12;
  _UIDocumentPickerRootContainerModel *v13;
  id v15;
  objc_super v16;
  uint64_t v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)_UIDocumentListController;
  v5 = -[_UIDocumentListController initWithNibName:bundle:](&v16, sel_initWithNibName_bundle_, 0, 0);
  if (!v5)
    goto LABEL_9;
  if (!v4)
  {
    v13 = [_UIDocumentPickerRootContainerModel alloc];
    v17 = *MEMORY[0x24BDC17B8];
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v17, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[_UIDocumentPickerRootContainerModel initWithPickableTypes:mode:](v13, "initWithPickableTypes:mode:", v8, 1);
    goto LABEL_8;
  }
  v15 = 0;
  v6 = objc_msgSend(v4, "getPromisedItemResourceValue:forKey:error:", &v15, *MEMORY[0x24BDBCC60], 0);
  v7 = v15;
  v8 = v7;
  if (v6 && objc_msgSend(v7, "BOOLValue"))
  {
    v9 = [_UIDocumentPickerURLContainerModel alloc];
    v18[0] = *MEMORY[0x24BDC17B8];
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v18, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[_UIDocumentPickerURLContainerModel initWithURL:pickableTypes:mode:](v9, "initWithURL:pickableTypes:mode:", v4, v10, 1);

LABEL_8:
    -[_UIDocumentListController _commonInitWithModel:](v5, "_commonInitWithModel:", v11);

LABEL_9:
    v12 = v5;
    goto LABEL_10;
  }

  v12 = 0;
LABEL_10:

  return v12;
}

- (_UIDocumentListController)initWithModel:(id)a3
{
  id v4;
  _UIDocumentListController *v5;
  _UIDocumentListController *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_UIDocumentListController;
  v5 = -[_UIDocumentListController initWithNibName:bundle:](&v8, sel_initWithNibName_bundle_, 0, 0);
  v6 = v5;
  if (v5)
    -[_UIDocumentListController _commonInitWithModel:](v5, "_commonInitWithModel:", v4);

  return v6;
}

- (_UIDocumentListController)initWithCoder:(id)a3
{
  return -[_UIDocumentListController initWithModel:](self, "initWithModel:", 0);
}

- (void)createSearchControllerWithModel:(id)a3
{
  id v4;
  _UIDocumentPickerSearchContainerModel *v5;
  void *v6;
  uint64_t v7;
  _UIDocumentSearchListController *v8;
  _UIDocumentSearchListController *searchController;
  _UIDocumentPickerSearchContainerModel *v10;

  v4 = a3;
  v5 = [_UIDocumentPickerSearchContainerModel alloc];
  objc_msgSend(v4, "pickableTypes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "pickerMode");

  v10 = -[_UIDocumentPickerSearchContainerModel initWithPickableTypes:mode:](v5, "initWithPickableTypes:mode:", v6, v7);
  v8 = -[_UIDocumentSearchListController initWithModel:]([_UIDocumentSearchListController alloc], "initWithModel:", v10);
  searchController = self->_searchController;
  self->_searchController = v8;

  -[_UIDocumentListController setRootListController:](self->_searchController, "setRootListController:", self);
  -[_UIDocumentPickerContainerViewController setResultsController:](self->_containerViewController, "setResultsController:", self->_searchController);

}

- (void)setHideSearchField:(BOOL)a3
{
  _UIDocumentSearchListController *searchController;
  id v5;

  if (self->_hideSearchField != a3)
  {
    self->_hideSearchField = a3;
    if (a3)
    {
      searchController = self->_searchController;
      self->_searchController = 0;

      -[_UIDocumentPickerContainerViewController setResultsController:](self->_containerViewController, "setResultsController:", 0);
    }
    else
    {
      -[_UIDocumentPickerContainerViewController model](self->_containerViewController, "model");
      v5 = (id)objc_claimAutoreleasedReturnValue();
      -[_UIDocumentListController createSearchControllerWithModel:](self, "createSearchControllerWithModel:", v5);

    }
  }
}

- (void)_setContainerViewController:(id)a3
{
  _UIDocumentPickerContainerViewController **p_containerViewController;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  p_containerViewController = &self->_containerViewController;
  objc_storeStrong((id *)&self->_containerViewController, a3);
  v11 = a3;
  -[_UIDocumentPickerContainerViewController beginAppearanceTransition:animated:](*p_containerViewController, "beginAppearanceTransition:animated:", 1, 0);
  -[_UIDocumentPickerContainerViewController view](*p_containerViewController, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIDocumentListController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bounds");
  objc_msgSend(v6, "setFrame:");

  -[_UIDocumentListController addChildViewController:](self, "addChildViewController:", *p_containerViewController);
  -[_UIDocumentPickerContainerViewController view](*p_containerViewController, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAutoresizingMask:", 18);

  -[_UIDocumentPickerContainerViewController setServiceViewController:](*p_containerViewController, "setServiceViewController:", self);
  -[_UIDocumentListController view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIDocumentPickerContainerViewController view](*p_containerViewController, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addSubview:", v10);

  -[_UIDocumentPickerContainerViewController didMoveToParentViewController:](*p_containerViewController, "didMoveToParentViewController:", self);
  -[_UIDocumentPickerContainerViewController endAppearanceTransition](*p_containerViewController, "endAppearanceTransition");

}

- (void)updateTitle
{
  void *v3;
  id v4;

  -[_UIDocumentPickerContainerViewController model](self->_containerViewController, "model");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "displayTitle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIDocumentListController setTitle:](self, "setTitle:", v3);

}

- (void)startSearchWithQueryString:(id)a3 becomeFirstResponder:(BOOL)a4
{
  -[_UIDocumentPickerContainerViewController _startSearchWithQueryString:becomeFirstResponder:](self->_containerViewController, "_startSearchWithQueryString:becomeFirstResponder:", a3, a4);
}

- (void)setDelegate:(id)a3
{
  void *v4;
  void *v5;
  id obj;

  obj = a3;
  -[_UIDocumentListController rootListController](self, "rootListController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[_UIDocumentListController rootListController](self, "rootListController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setDelegate:", obj);

  }
  else
  {
    objc_storeWeak((id *)&self->_delegateIfNotDeferred, obj);
  }

}

- (_UIDocumentListControllerDelegate)delegate
{
  void *v3;
  void *v4;
  void *WeakRetained;

  -[_UIDocumentListController rootListController](self, "rootListController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[_UIDocumentListController rootListController](self, "rootListController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "delegate");
    WeakRetained = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegateIfNotDeferred);
  }

  return (_UIDocumentListControllerDelegate *)WeakRetained;
}

- (void)setSortOrder:(int)a3
{
  uint64_t v3;
  void *v5;
  id v6;

  v3 = *(_QWORD *)&a3;
  -[_UIDocumentListController rootListController](self, "rootListController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[_UIDocumentListController rootListController](self, "rootListController");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setSortOrder:", v3);

  }
  else
  {
    self->_sortOrderIfNotDeferred = v3;
  }
}

- (int)sortOrder
{
  void *v3;
  void *v4;
  int sortOrderIfNotDeferred;

  -[_UIDocumentListController rootListController](self, "rootListController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[_UIDocumentListController rootListController](self, "rootListController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    sortOrderIfNotDeferred = objc_msgSend(v4, "sortOrder");

  }
  else
  {
    sortOrderIfNotDeferred = self->_sortOrderIfNotDeferred;
  }

  return sortOrderIfNotDeferred;
}

- (void)setDisplayMode:(int64_t)a3
{
  void *v5;
  id v6;

  -[_UIDocumentListController rootListController](self, "rootListController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[_UIDocumentListController rootListController](self, "rootListController");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setDisplayMode:", a3);

  }
  else
  {
    self->_displayModeIfNotDeferred = a3;
  }
}

- (int64_t)displayMode
{
  void *v3;
  void *v4;
  uint64_t displayModeIfNotDeferred;

  -[_UIDocumentListController rootListController](self, "rootListController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[_UIDocumentListController rootListController](self, "rootListController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    displayModeIfNotDeferred = objc_msgSend(v4, "displayMode");

  }
  else
  {
    displayModeIfNotDeferred = self->_displayModeIfNotDeferred;
  }

  return displayModeIfNotDeferred;
}

- (void)setAvailableActions:(int64_t)a3
{
  void *v5;
  id v6;

  -[_UIDocumentListController rootListController](self, "rootListController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[_UIDocumentListController rootListController](self, "rootListController");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setAvailableActions:", a3);

  }
  else
  {
    self->_availableActionsIfNotDeferred = a3;
  }
}

- (int64_t)availableActions
{
  void *v3;
  void *v4;
  uint64_t availableActionsIfNotDeferred;

  -[_UIDocumentListController rootListController](self, "rootListController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[_UIDocumentListController rootListController](self, "rootListController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    availableActionsIfNotDeferred = objc_msgSend(v4, "availableActions");

  }
  else
  {
    availableActionsIfNotDeferred = self->_availableActionsIfNotDeferred;
  }

  return availableActionsIfNotDeferred;
}

- (BOOL)shouldHighlightItem:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  char v9;

  v4 = a3;
  -[_UIDocumentListController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[_UIDocumentListController delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "urlInLocalContainer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "documentListController:shouldHighlightItemAtURL:", self, v8);

  }
  else
  {
    v9 = 1;
  }

  return v9;
}

- (void)didHighlightItem:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[_UIDocumentListController delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[_UIDocumentListController delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "urlInLocalContainer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "documentListController:didHighlightItemAtURL:", self, v7);

  }
}

- (void)didUnhighlightItem:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[_UIDocumentListController delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[_UIDocumentListController delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "urlInLocalContainer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "documentListController:didUnhighlightItemAtURL:", self, v7);

  }
}

- (BOOL)shouldSelectItem:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  char v9;

  v4 = a3;
  -[_UIDocumentListController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[_UIDocumentListController delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "urlInLocalContainer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "documentListController:shouldSelectItemAtURL:", self, v8);

  }
  else
  {
    v9 = 1;
  }

  return v9;
}

- (void)didSelectItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  _UIDocumentListController *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  if (objc_msgSend(v13, "type") == 1 || objc_msgSend(v13, "type") == 2)
  {
    objc_msgSend(v13, "incrementModelDisplayCount");
    v4 = objc_alloc(-[_UIDocumentListController _classForChildren](self, "_classForChildren"));
    objc_msgSend(v13, "model");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v4, "initWithModel:", v5);

    objc_msgSend(v13, "decrementModelDisplayCount");
    -[_UIDocumentListController delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setDelegate:", v7);

    -[_UIDocumentListController rootListController](self, "rootListController");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v8;
    if (v8)
      v10 = (_UIDocumentListController *)v8;
    else
      v10 = self;
    objc_msgSend(v6, "setRootListController:", v10);

    -[_UIDocumentListController delegate](self, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      -[_UIDocumentListController delegate](self, "delegate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "documentListController:didSelectContainerWithViewController:", self, v6);
    }
    else
    {
      -[_UIDocumentListController navigationController](self, "navigationController");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "pushViewController:animated:", v6, 1);
    }
  }
  else
  {
    -[_UIDocumentListController delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "urlInLocalContainer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "documentListController:didSelectItemAtURL:", self, v12);
  }

}

- (void)performAction:(int64_t)a3 item:(id)a4 view:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  -[_UIDocumentListController delegate](self, "delegate");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "urlInLocalContainer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "documentListController:performAction:URL:originatingView:completion:", self, a3, v13, v11, v10);
}

- (BOOL)shouldShowAction:(int64_t)a3
{
  return ((1 << a3) & (unint64_t)~-[_UIDocumentListController availableActions](self, "availableActions")) == 0;
}

- (void)itemsOrSelectionDidChange:(BOOL)a3
{
  void *v4;
  char v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  if (a3)
  {
    -[_UIDocumentListController delegate](self, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_opt_respondsToSelector();

    if ((v5 & 1) != 0)
    {
      cdui_default_log();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
        -[_UIDocumentListController itemsOrSelectionDidChange:].cold.2(v6, v7, v8, v9, v10, v11, v12, v13);

      -[_UIDocumentListController delegate](self, "delegate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "documentListControllerItemsChanged:", self);

    }
  }
  -[_UIDocumentListController updateTitle](self, "updateTitle");
  -[_UIDocumentListController model](self, "model");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "url");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {

LABEL_12:
    goto LABEL_13;
  }
  -[_UIDocumentListController delegate](self, "delegate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_opt_respondsToSelector();

  if ((v18 & 1) != 0)
  {
    cdui_default_log();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      -[_UIDocumentListController itemsOrSelectionDidChange:].cold.1(v19, v20, v21, v22, v23, v24, v25, v26);

    -[_UIDocumentListController delegate](self, "delegate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "documentListControllerURLWasRemoved:", self);
    goto LABEL_12;
  }
LABEL_13:
  -[_UIDocumentListController _updateScrollPositionForStateRestoration](self, "_updateScrollPositionForStateRestoration");
}

- (id)previewViewControllerForItem:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  -[_UIDocumentListController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[_UIDocumentListController delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "url");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "documentListController:viewControllerForPreviewingItemAtURL:", self, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)model
{
  return -[_UIDocumentPickerContainerViewController model](self->_containerViewController, "model");
}

- (NSURL)presentedURL
{
  void *v2;
  void *v3;

  -[_UIDocumentListController model](self, "model");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "url");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v3;
}

- (NSArray)containedItems
{
  void *v2;
  void *v3;
  void *v4;

  -[_UIDocumentListController model](self, "model");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "modelObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueForKey:", CFSTR("urlInLocalContainer"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  objc_super v7;

  v4 = a4;
  v5 = a3;
  -[_UIDocumentPickerContainerViewController setEditing:animated:](self->_containerViewController, "setEditing:animated:");
  v7.receiver = self;
  v7.super_class = (Class)_UIDocumentListController;
  -[_UIDocumentListController setEditing:animated:](&v7, sel_setEditing_animated_, v5, v4);
}

- (NSArray)selectedItems
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
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

  v19 = *MEMORY[0x24BDAC8D0];
  -[_UIDocumentListController model](self, "model");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "modelObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1698], "indexSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[_UIDocumentPickerContainerViewController indexPathsForSelectedItems](self->_containerViewController, "indexPathsForSelectedItems", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
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
        objc_msgSend(v5, "addIndex:", objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v10++), "row"));
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  objc_msgSend(v4, "objectsAtIndexes:", v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "valueForKey:", CFSTR("urlInLocalContainer"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v12;
}

- (void)setSelectedItems:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIDocumentListController containedItems](self, "containedItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = v4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v7);
        v12 = objc_msgSend(v6, "indexOfObject:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v11), (_QWORD)v14);
        if (v12 != 0x7FFFFFFFFFFFFFFFLL)
        {
          objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", v12, 0);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v13);

        }
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v9);
  }

  -[_UIDocumentPickerContainerViewController setIndexPathsForSelectedItems:](self->_containerViewController, "setIndexPathsForSelectedItems:", v5);
}

- (void)_performScrollTest:(id)a3 iterations:(int)a4 delta:(int)a5 listMode:(int64_t)a6
{
  uint64_t v7;
  uint64_t v8;
  _UIDocumentPickerContainerViewController *containerViewController;
  id v11;
  void *v12;
  void *v13;
  id v14;

  v7 = *(_QWORD *)&a5;
  v8 = *(_QWORD *)&a4;
  containerViewController = self->_containerViewController;
  v11 = a3;
  -[_UIDocumentPickerContainerViewController childViewControllers](containerViewController, "childViewControllers");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "firstObject");
  v14 = (id)objc_claimAutoreleasedReturnValue();

  -[_UIDocumentPickerContainerViewController setExplicitDisplayMode:](self->_containerViewController, "setExplicitDisplayMode:", a6);
  -[_UIDocumentPickerContainerViewController displayModeChanged](self->_containerViewController, "displayModeChanged");
  objc_msgSend(v14, "scrollView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "_performScrollTest:iterations:delta:", v11, v8, v7);

}

- (void)encodeRestorableStateWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id WeakRetained;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)_UIDocumentListController;
  v4 = a3;
  -[_UIDocumentListController encodeRestorableStateWithCoder:](&v9, sel_encodeRestorableStateWithCoder_, v4);
  -[_UIDocumentListController model](self, "model", v9.receiver, v9.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "url");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("url"));

  objc_msgSend(v4, "encodeInteger:forKey:", -[_UIDocumentListController availableActions](self, "availableActions"), CFSTR("AvailableActions"));
  -[_UIDocumentPickerContainerViewController contentOffset](self->_containerViewController, "contentOffset");
  objc_msgSend(v4, "encodeCGPoint:forKey:", CFSTR("ContentOffset"));
  WeakRetained = objc_loadWeakRetained((id *)&self->_rootListController);
  objc_msgSend(v4, "encodeObject:forKey:", WeakRetained, CFSTR("Root"));

  -[_UIDocumentListController delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("Delegate"));

}

- (void)decodeRestorableStateWithCoder:(id)a3
{
  id v4;
  void *v5;
  CGFloat v6;
  CGFloat v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)_UIDocumentListController;
  v4 = a3;
  -[_UIDocumentListController decodeRestorableStateWithCoder:](&v9, sel_decodeRestorableStateWithCoder_, v4);
  objc_msgSend(v4, "decodeObjectForKey:", CFSTR("Root"), v9.receiver, v9.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeWeak((id *)&self->_rootListController, v5);

  objc_msgSend(v4, "decodeCGPointForKey:", CFSTR("ContentOffset"));
  self->_stateRestoredContentOffset.x = v6;
  self->_stateRestoredContentOffset.y = v7;
  -[_UIDocumentListController setAvailableActions:](self, "setAvailableActions:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("AvailableActions")));
  objc_msgSend(v4, "decodeObjectForKey:", CFSTR("Delegate"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[_UIDocumentListController setDelegate:](self, "setDelegate:", v8);
}

- (void)_updateScrollPositionForStateRestoration
{
  void *v3;
  void *v4;
  CGPoint *v5;

  -[_UIDocumentListController model](self, "model");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "modelObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = (CGPoint *)MEMORY[0x24BDBEFB0];
    if (self->_stateRestoredContentOffset.x != *MEMORY[0x24BDBEFB0]
      || self->_stateRestoredContentOffset.y != *(double *)(MEMORY[0x24BDBEFB0] + 8))
    {
      -[_UIDocumentPickerContainerViewController setContentOffset:](self->_containerViewController, "setContentOffset:");
      self->_stateRestoredContentOffset = *v5;
    }
  }
}

+ (id)viewControllerWithRestorationIdentifierPath:(id)a3 coder:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;

  objc_msgSend(a4, "decodeObjectForKey:", CFSTR("url"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "path");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "fileExistsAtPath:", v7);

  if (v8)
    v9 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithURL:", v5);
  else
    v9 = 0;

  return v9;
}

+ (id)_listControllerHierarchyForURL:(id)a3 withConstructorBlock:(id)a4
{
  id v5;
  void (**v6)(id, id);
  uint64_t v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v25;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  id v31;
  id v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = (void (**)(id, id))a4;
  v32 = 0;
  v7 = *MEMORY[0x24BDBCC60];
  v31 = 0;
  objc_msgSend(v5, "getPromisedItemResourceValue:forKey:error:", &v32, v7, &v31);
  v8 = v32;
  v9 = v31;
  v10 = 0;
  if (objc_msgSend(v8, "BOOLValue"))
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v5;
    if ((objc_msgSend(v12, "br_isDocumentsContainer") & 1) != 0)
    {
      v13 = v12;
    }
    else
    {
      do
      {
        v6[2](v6, v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "insertObject:atIndex:", v14, 0);

        objc_msgSend(v12, "URLByDeletingLastPathComponent");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        v12 = v13;
      }
      while (!objc_msgSend(v13, "br_isDocumentsContainer"));
    }
    objc_msgSend(v13, "br_pathRelativeToMobileDocuments");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v25, "isEqualToString:", *MEMORY[0x24BE17558]) & 1) == 0)
    {
      v6[2](v6, v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "insertObject:atIndex:", v15, 0);

    }
    objc_msgSend(MEMORY[0x24BDBCF48], "ui_cloudDocsContainerURL");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      v6[2](v6, v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "insertObject:atIndex:", v17, 0);

    }
    v26 = v9;
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v10 = v11;
    v18 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
    if (v18)
    {
      v19 = v18;
      v20 = 0;
      v21 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v28 != v21)
            objc_enumerationMutation(v10);
          v23 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
          if (v20)
            objc_msgSend(v23, "setRootListController:", v20);
          else
            v20 = v23;
        }
        v19 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
      }
      while (v19);
    }
    else
    {
      v20 = 0;
    }

    v9 = v26;
  }

  return v10;
}

+ (id)listControllerHierarchyForURL:(id)a3
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __59___UIDocumentListController_listControllerHierarchyForURL___block_invoke;
  v4[3] = &__block_descriptor_40_e42____UIDocumentListController_16__0__NSURL_8l;
  v4[4] = a1;
  objc_msgSend(a1, "_listControllerHierarchyForURL:withConstructorBlock:", a3, v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  -[_UIDocumentListController model](self, "model");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "url");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, %@>"), v4, self, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (BOOL)hideSearchField
{
  return self->_hideSearchField;
}

- (BOOL)editing
{
  return self->_editing;
}

- (void)setEditing:(BOOL)a3
{
  self->_editing = a3;
}

- (_UIDocumentListController)rootListController
{
  return (_UIDocumentListController *)objc_loadWeakRetained((id *)&self->_rootListController);
}

- (void)setRootListController:(id)a3
{
  objc_storeWeak((id *)&self->_rootListController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchController, 0);
  objc_destroyWeak((id *)&self->_delegateIfNotDeferred);
  objc_storeStrong((id *)&self->_containerViewController, 0);
  objc_destroyWeak((id *)&self->_rootListController);
}

- (void)itemsOrSelectionDidChange:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_21F506000, a1, a3, "[DEBUG] folder was removed, informing delegate", a5, a6, a7, a8, 0);
}

- (void)itemsOrSelectionDidChange:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_21F506000, a1, a3, "[DEBUG] folder was changed, informing delegate", a5, a6, a7, a8, 0);
}

@end
