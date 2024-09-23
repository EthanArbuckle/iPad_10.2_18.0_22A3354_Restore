@implementation _SFBookmarkInfoViewController

- (_SFBookmarkInfoViewController)initWithBookmark:(id)a3 childBookmarks:(id)a4 inCollection:(id)a5 addingBookmark:(BOOL)a6 toFavorites:(BOOL)a7 willBeDisplayedModally:(BOOL)a8
{
  _BOOL4 v8;
  id v14;
  id v15;
  id v16;
  _SFBookmarkInfoViewController *v17;
  uint64_t v18;
  WebBookmark *bookmark;
  WebBookmark *v20;
  uint64_t v21;
  WebBookmark *parentBookmark;
  void *v23;
  id v24;
  void *v25;
  id v26;
  void *v27;
  uint64_t v28;
  UIBarButtonItem *saveButton;
  UISwitch *v30;
  UISwitch *showTitleSwitch;
  void *v32;
  _SFBookmarkInfoViewController *v33;
  objc_super v35;

  v8 = a8;
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v35.receiver = self;
  v35.super_class = (Class)_SFBookmarkInfoViewController;
  v17 = -[_SFBookmarkInfoViewController initWithStyle:](&v35, sel_initWithStyle_, 2);
  if (v17)
  {
    v18 = objc_msgSend(v14, "copy");
    bookmark = v17->_bookmark;
    v17->_bookmark = (WebBookmark *)v18;

    objc_storeStrong((id *)&v17->_childBookmarks, a4);
    v17->_addingBookmark = a6;
    v17->_addingToFavorites = a7;
    v17->_enableAddFolder = objc_msgSend(v14, "isFolder") ^ 1;
    v20 = v17->_bookmark;
    if (v20)
    {
      objc_msgSend(v16, "bookmarkWithID:", -[WebBookmark parentID](v20, "parentID"));
      v21 = objc_claimAutoreleasedReturnValue();
      parentBookmark = v17->_parentBookmark;
      v17->_parentBookmark = (WebBookmark *)v21;

      v20 = v17->_bookmark;
    }
    if (-[WebBookmark subtype](v20, "subtype") == 1)
      v17->_lastSelectedSyntheticFolderID = -[WebBookmark parentID](v17->_bookmark, "parentID");
    objc_storeStrong((id *)&v17->_collection, a5);
    -[_SFBookmarkInfoViewController navigationItem](v17, "navigationItem");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[_SFBookmarkInfoViewController _updateNavigationTitle](v17, "_updateNavigationTitle");
    if (v8)
    {
      v24 = objc_alloc(MEMORY[0x1E0DC34F0]);
      v25 = (void *)objc_msgSend(v24, "initWithBarButtonSystemItem:target:action:", objc_msgSend(MEMORY[0x1E0DC34F0], "_sf_popoverCancelButtonItem"), v17, sel_cancel);
      objc_msgSend(v25, "setAccessibilityIdentifier:", CFSTR("BookmarkInfoCancelButton"));
      objc_msgSend(v23, "setLeftBarButtonItem:", v25);
      v26 = objc_alloc(MEMORY[0x1E0DC34F0]);
      _WBSLocalizedString();
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v26, "initWithTitle:style:target:action:", v27, 2, v17, sel__saveButtonPressed);
      saveButton = v17->_saveButton;
      v17->_saveButton = (UIBarButtonItem *)v28;

      -[UIBarButtonItem setAccessibilityIdentifier:](v17->_saveButton, "setAccessibilityIdentifier:", CFSTR("BookmarkInfoSaveButton"));
      objc_msgSend(v23, "setRightBarButtonItem:", v17->_saveButton);

    }
    v30 = (UISwitch *)objc_alloc_init(MEMORY[0x1E0DC3D18]);
    showTitleSwitch = v17->_showTitleSwitch;
    v17->_showTitleSwitch = v30;

    -[UISwitch setOn:](v17->_showTitleSwitch, "setOn:", -[WebBookmark showIconOnly](v17->_bookmark, "showIconOnly") ^ 1);
    -[UISwitch addTarget:action:forControlEvents:](v17->_showTitleSwitch, "addTarget:action:forControlEvents:", v17, sel__showTitleSwitchPressed_, 64);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "addObserver:selector:name:object:", v17, sel__bookmarksDidReload_, *MEMORY[0x1E0DCCC00], 0);

    v17->_editingField = -1;
    v33 = v17;

  }
  return v17;
}

- (_SFBookmarkInfoViewController)initWithBookmark:(id)a3 inCollection:(id)a4 addingBookmark:(BOOL)a5
{
  return -[_SFBookmarkInfoViewController initWithBookmark:childBookmarks:inCollection:addingBookmark:toFavorites:willBeDisplayedModally:](self, "initWithBookmark:childBookmarks:inCollection:addingBookmark:toFavorites:willBeDisplayedModally:", a3, 0, a4, a5, 0, a5);
}

- (void)_updateNavigationTitle
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _BOOL4 addingBookmark;
  void *v8;
  void *v9;
  id v10;

  -[_SFBookmarkInfoViewController navigationItem](self, "navigationItem");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (self->_addingToFavorites)
  {
    -[SFSyntheticBookmarkFolder title](self->_syntheticParentBookmarkFolder, "title");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "length"))
    {
      v4 = (void *)MEMORY[0x1E0CB3940];
      _WBSLocalizedString();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "stringWithFormat:", v5, v3);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setTitle:", v6);

    }
    else
    {
      _WBSLocalizedString();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setTitle:", v5);
    }

    goto LABEL_9;
  }
  addingBookmark = self->_addingBookmark;
  -[WebBookmark isFolder](self->_bookmark, "isFolder");
  if (addingBookmark)
  {
    _WBSLocalizedString();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setTitle:", v3);
LABEL_9:

    v9 = v10;
    goto LABEL_10;
  }
  _WBSLocalizedString();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTitle:", v8);

  v9 = v10;
  self->_saveWhenDismissed = 1;
LABEL_10:

}

- (void)_saveButtonPressed
{
  id WeakRetained;

  -[_SFBookmarkInfoViewController saveChanges](self, "saveChanges");
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "bookmarkInfoViewController:didFinishWithResult:", self, 1);

}

- (void)cancel
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "bookmarkInfoViewController:didFinishWithResult:", self, 0);

}

- (void)_returnWasPressedInTextField:(id)a3
{
  void *v4;
  _QWORD v5[5];

  if (-[_SFBookmarkInfoViewController _sf_canEditFields](self, "_sf_canEditFields", a3))
  {
    -[_SFBookmarkInfoViewController _saveButtonPressed](self, "_saveButtonPressed");
    v4 = (void *)*MEMORY[0x1E0DC4730];
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __62___SFBookmarkInfoViewController__returnWasPressedInTextField___block_invoke;
    v5[3] = &unk_1E4ABFE00;
    v5[4] = self;
    objc_msgSend(v4, "_performBlockAfterCATransactionCommits:", v5);
  }
}

- (void)_showTitleSwitchPressed:(id)a3
{
  -[WebBookmark setShowIconOnly:](self->_bookmark, "setShowIconOnly:", -[WebBookmark showIconOnly](self->_bookmark, "showIconOnly", a3) ^ 1);
}

- (UIEdgeInsets)_cellInset
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  UIEdgeInsets result;

  -[_SFBookmarkInfoViewController tableView](self, "tableView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "separatorInset");
  v4 = v3 + 15.0 + 60.0;
  v5 = *MEMORY[0x1E0DC53D8];

  v6 = 0.0;
  v7 = 0.0;
  v8 = v4;
  v9 = v5;
  result.right = v9;
  result.bottom = v7;
  result.left = v8;
  result.top = v6;
  return result;
}

- (void)_createCellsIfNeeded
{
  _SFBookmarkTextEntryTableViewCell *v3;
  _SFBookmarkTextEntryTableViewCell *titleCell;
  void *v5;
  void *v6;
  void *v7;
  _SFBookmarkTextEntryTableViewCell *v8;
  _SFBookmarkTextEntryTableViewCell *addressCell;
  void *v10;
  id v11;

  if (!self->_titleCell)
  {
    v3 = -[_SFBookmarkTextEntryTableViewCell initWithText:autocapitalizationType:autocorrectionType:]([_SFBookmarkTextEntryTableViewCell alloc], "initWithText:autocapitalizationType:autocorrectionType:", 0, 2, 0);
    titleCell = self->_titleCell;
    self->_titleCell = v3;

    -[_SFBookmarkTextEntryTableViewCell editableTextField](self->_titleCell, "editableTextField");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    _WBSLocalizedString();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setPlaceholder:", v6);

    objc_msgSend(v5, "setAccessibilityIdentifier:", CFSTR("BookmarkInfoTitleTextField"));
    objc_msgSend(v5, "textInputTraits");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setEnablesReturnKeyOnNonWhiteSpaceContent:", 1);

    objc_msgSend(v5, "addTarget:action:forControlEvents:", self, sel__didBeginEditingTextField_, 0x10000);
    objc_msgSend(v5, "addTarget:action:forControlEvents:", self, sel__didChangeEditingTextField_, 0x20000);

  }
  if (!self->_addressCell)
  {
    v8 = -[_SFBookmarkTextEntryTableViewCell initWithText:autocapitalizationType:autocorrectionType:]([_SFBookmarkTextEntryTableViewCell alloc], "initWithText:autocapitalizationType:autocorrectionType:", 0, 0, 1);
    addressCell = self->_addressCell;
    self->_addressCell = v8;

    -[_SFBookmarkTextEntryTableViewCell editableTextField](self->_addressCell, "editableTextField");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setKeyboardType:", 3);
    _WBSLocalizedString();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setPlaceholder:", v10);

    objc_msgSend(v11, "setAccessibilityIdentifier:", CFSTR("BookmarkInfoAddressTextField"));
    objc_msgSend(v11, "addTarget:action:forControlEvents:", self, sel__didBeginEditingTextField_, 0x10000);
    objc_msgSend(v11, "addTarget:action:forControlEvents:", self, sel__didChangeEditingTextField_, 0x20000);

  }
}

- (void)loadView
{
  void *v3;
  id v4;
  _SFSiteIconView *v5;
  _SFSiteIconView *iconImageView;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_SFBookmarkInfoViewController;
  -[_SFBookmarkInfoViewController loadView](&v8, sel_loadView);
  -[_SFBookmarkInfoViewController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityIdentifier:", CFSTR("BookmarkInfoTableView"));
  objc_msgSend(v3, "setRowHeight:", *MEMORY[0x1E0DC53D8]);
  objc_msgSend(v3, "setEstimatedRowHeight:", 44.0);
  objc_msgSend(v3, "setEstimatedSectionHeaderHeight:", 0.0);
  objc_msgSend(v3, "setEstimatedSectionFooterHeight:", 0.0);
  if ((-[WebBookmark isFolder](self->_bookmark, "isFolder") & 1) == 0)
  {
    v4 = objc_alloc(MEMORY[0x1E0D4EF80]);
    v5 = (_SFSiteIconView *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), 60.0, 60.0);
    iconImageView = self->_iconImageView;
    self->_iconImageView = v5;

    -[_SFSiteIconView layer](self->_iconImageView, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setZPosition:", 1.0);

    objc_msgSend(v3, "addSubview:", self->_iconImageView);
    -[_SFSiteIconView setBookmark:](self->_iconImageView, "setBookmark:", self->_bookmark);
  }
  -[_SFBookmarkInfoViewController reloadData](self, "reloadData");

}

- (id)_titleCell
{
  void *v2;
  void *v3;
  void *v4;

  -[_SFBookmarkInfoViewController tableView](self, "tableView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", 0, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cellForRowAtIndexPath:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_SFBookmarkInfoViewController;
  -[SFPopoverSizingTableViewController viewWillAppear:](&v6, sel_viewWillAppear_, a3);
  -[_SFBookmarkInfoViewController tableView](self, "tableView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reloadData");

  -[_SFBookmarkTextEntryTableViewCell editableTextField](self->_addressCell, "editableTextField");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setEnabled:", !self->_addingBookmark);

  if (self->_folderPickerExpanded)
    -[_SFBookmarkInfoViewController _setFolderPickerExpanded:animated:](self, "_setFolderPickerExpanded:animated:", 0, 0);
}

- (void)viewWillDisappear:(BOOL)a3
{
  id WeakRetained;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_SFBookmarkInfoViewController;
  -[_SFBookmarkInfoViewController viewWillDisappear:](&v5, sel_viewWillDisappear_, a3);
  -[_SFBookmarkInfoViewController _removeActionsForTextFields](self, "_removeActionsForTextFields");
  if (self->_saveWhenDismissed
    && ((-[_SFBookmarkInfoViewController isBeingDismissed](self, "isBeingDismissed") & 1) != 0
     || -[_SFBookmarkInfoViewController isMovingFromParentViewController](self, "isMovingFromParentViewController")))
  {
    -[_SFBookmarkInfoViewController saveChanges](self, "saveChanges");
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(WeakRetained, "bookmarkInfoViewController:didFinishWithResult:", self, 1);

  }
}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  objc_super v7;

  v3 = a3;
  -[_SFBookmarkInfoViewController _addActionsForTextFields](self, "_addActionsForTextFields");
  if ((-[_SFBookmarkInfoViewController _isInPopoverPresentation](self, "_isInPopoverPresentation") & 1) != 0
    || -[_SFBookmarkInfoViewController _sf_canEditFields](self, "_sf_canEditFields"))
  {
    -[_SFBookmarkInfoViewController _titleCell](self, "_titleCell");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "editableTextField");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "becomeFirstResponder");

  }
  v7.receiver = self;
  v7.super_class = (Class)_SFBookmarkInfoViewController;
  -[SFPopoverSizingTableViewController viewDidAppear:](&v7, sel_viewDidAppear_, v3);
}

- (void)viewDidLayoutSubviews
{
  UITextField *textFieldToRestoreFirstResponder;
  UITextField *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_SFBookmarkInfoViewController;
  -[SFPopoverSizingTableViewController viewDidLayoutSubviews](&v5, sel_viewDidLayoutSubviews);
  textFieldToRestoreFirstResponder = self->_textFieldToRestoreFirstResponder;
  if (textFieldToRestoreFirstResponder)
  {
    -[UITextField becomeFirstResponder](textFieldToRestoreFirstResponder, "becomeFirstResponder");
    v4 = self->_textFieldToRestoreFirstResponder;
    self->_textFieldToRestoreFirstResponder = 0;

  }
}

- (void)didRotateFromInterfaceOrientation:(int64_t)a3
{
  void *v4;
  id v5;

  if ((-[_SFBookmarkInfoViewController _sf_canEditFields](self, "_sf_canEditFields", a3) & 1) != 0)
  {
    -[_SFBookmarkInfoViewController _titleCell](self, "_titleCell");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "editableTextField");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "becomeFirstResponder");

  }
  else
  {
    -[_SFBookmarkInfoViewController firstResponder](self, "firstResponder");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "resignFirstResponder");
  }

}

- (void)_bookmarksDidReload:(id)a3
{
  WebBookmark *v4;
  WebBookmarkCollection *collection;
  void *v6;
  WebBookmark *v7;
  WebBookmark *parentBookmark;
  WebBookmark *v9;
  WebBookmark *v10;
  WebBookmark *v11;

  v4 = self->_parentBookmark;
  collection = self->_collection;
  v11 = v4;
  -[WebBookmark UUID](v4, "UUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WebBookmarkCollection bookmarkWithUUID:](collection, "bookmarkWithUUID:", v6);
  v7 = (WebBookmark *)objc_claimAutoreleasedReturnValue();
  parentBookmark = self->_parentBookmark;
  self->_parentBookmark = v7;

  if (!self->_parentBookmark)
  {
    -[WebBookmarkCollection rootBookmark](self->_collection, "rootBookmark");
    v9 = (WebBookmark *)objc_claimAutoreleasedReturnValue();
    v10 = self->_parentBookmark;
    self->_parentBookmark = v9;

  }
  -[_SFBookmarkInfoViewController reloadData](self, "reloadData");

}

- (BOOL)titleCellHasText
{
  void *v2;
  void *v3;
  BOOL v4;

  -[_SFBookmarkTextEntryTableViewCell editableTextField](self->_titleCell, "editableTextField");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length") != 0;

  return v4;
}

- (void)reloadData
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  -[_SFBookmarkInfoViewController _createCellsIfNeeded](self, "_createCellsIfNeeded");
  -[_SFBookmarkTextEntryTableViewCell editableTextField](self->_titleCell, "editableTextField");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WebBookmark localizedTitle](self->_bookmark, "localizedTitle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setText:", v4);

  -[_SFBookmarkTextEntryTableViewCell editableTextField](self->_addressCell, "editableTextField");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0C99E98];
  -[WebBookmark address](self->_bookmark, "address");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "safari_URLWithDataAsString:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "safari_userVisibleString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setText:", v9);

  if ((-[WebBookmark isFolder](self->_bookmark, "isFolder") & 1) == 0)
    -[_SFBookmarkInfoViewController updateBookmarkIcon](self, "updateBookmarkIcon");
  -[_SFBookmarkInfoViewController _reloadFolderInfoForced:](self, "_reloadFolderInfoForced:", 1);
  -[_SFBookmarkInfoViewController _updateCellValues](self, "_updateCellValues");
  -[_SFBookmarkInfoViewController tableView](self, "tableView");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "reloadData");

}

- (void)updateLastSelectedSyntheticFolder
{
  void *v3;
  void *v4;
  int v5;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringForKey:", *MEMORY[0x1E0D4F6B0]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "integerValue");

  if (v5)
  {
    self->_lastSelectedSyntheticFolderID = v5;
    -[_SFBookmarkInfoViewController reloadData](self, "reloadData");
  }
}

- (CGPoint)_centerForIconView
{
  void *v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  int v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  CGPoint result;
  CGRect v25;

  -[_SFBookmarkInfoViewController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "rectForSection:", 0);
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  objc_msgSend(v3, "rectForHeaderInSection:", 0);
  v13 = v12;
  objc_msgSend(v3, "rectForFooterInSection:", 0);
  v15 = v14;
  -[_SFBookmarkInfoViewController view](self, "view");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "_sf_usesLeftToRightLayout");

  if (v17)
  {
    objc_msgSend(v3, "_sectionContentInset");
    objc_msgSend(v3, "separatorInset");
  }
  else
  {
    objc_msgSend(v3, "separatorInset");
    objc_msgSend(v3, "_sectionContentInset");
  }
  v25.size.height = v11 - v13 - v15;
  v25.origin.x = v5;
  v25.origin.y = v7;
  v25.size.width = v9;
  CGRectGetMidY(v25);
  _SFRoundPointToPixels();
  v19 = v18;
  v21 = v20;

  v22 = v19;
  v23 = v21;
  result.y = v23;
  result.x = v22;
  return result;
}

- (void)_updateIconViewFrame
{
  _SFSiteIconView *iconImageView;

  iconImageView = self->_iconImageView;
  -[_SFBookmarkInfoViewController _centerForIconView](self, "_centerForIconView");
  -[_SFSiteIconView setCenter:](iconImageView, "setCenter:");
}

- (void)updateBookmarkIcon
{
  -[_SFSiteIconView updateBookmarkData](self->_iconImageView, "updateBookmarkData");
}

- (void)_updateCellValues
{
  void *v3;
  _SFBookmarkTextEntryTableViewCell *v4;
  void *v5;
  uint64_t v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  _SFBookmarkTextEntryTableViewCell *v15;

  v15 = self->_titleCell;
  -[_SFBookmarkTextEntryTableViewCell editableTextField](v15, "editableTextField");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = self->_addressCell;
  -[_SFBookmarkTextEntryTableViewCell editableTextField](v4, "editableTextField");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((-[_SFBookmarkInfoViewController _sf_canEditFields](self, "_sf_canEditFields") & 1) != 0)
  {
    objc_msgSend(v3, "setUserInteractionEnabled:", 1);
    objc_msgSend(v5, "setUserInteractionEnabled:", 1);
    -[_SFBookmarkTextEntryTableViewCell setAccessoryType:](v15, "setAccessoryType:", 0);
    -[_SFBookmarkTextEntryTableViewCell setAccessoryType:](v4, "setAccessoryType:", 0);
    -[_SFBookmarkTextEntryTableViewCell setSelectionStyle:](v15, "setSelectionStyle:", 0);
    v6 = 0;
  }
  else
  {
    objc_msgSend(v3, "setUserInteractionEnabled:", 0);
    objc_msgSend(v5, "setUserInteractionEnabled:", 0);
    -[_SFBookmarkTextEntryTableViewCell setAccessoryType:](v15, "setAccessoryType:", 1);
    -[_SFBookmarkTextEntryTableViewCell setAccessoryType:](v4, "setAccessoryType:", !self->_addingBookmark);
    -[_SFBookmarkTextEntryTableViewCell setSelectionStyle:](v15, "setSelectionStyle:", 2);
    v6 = 2 * !self->_addingBookmark;
  }
  -[_SFBookmarkTextEntryTableViewCell setSelectionStyle:](v4, "setSelectionStyle:", v6);
  if ((-[WebBookmark isFolder](self->_bookmark, "isFolder") & 1) == 0)
  {
    -[_SFBookmarkInfoViewController _cellInset](self, "_cellInset");
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v14 = v13;
    -[_SFBookmarkTextEntryTableViewCell setSeparatorInset:](v15, "setSeparatorInset:");
    -[_SFBookmarkTextEntryTableViewCell setSeparatorInset:](v4, "setSeparatorInset:", v8, v10, v12, v14);
  }
  -[_SFBookmarkInfoViewController _updateSaveButton](self, "_updateSaveButton");

}

- (void)setBookmark:(id)a3
{
  WebBookmark *v4;
  WebBookmark *v5;
  WebBookmark *bookmark;
  void *v7;
  WebBookmark *v8;

  v4 = (WebBookmark *)a3;
  if (self->_bookmark != v4)
  {
    v8 = v4;
    v5 = (WebBookmark *)-[WebBookmark copy](v4, "copy");
    bookmark = self->_bookmark;
    self->_bookmark = v5;

    -[WebBookmarkCollection bookmarkWithID:](self->_collection, "bookmarkWithID:", -[WebBookmark parentID](self->_bookmark, "parentID"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[_SFBookmarkInfoViewController setParent:syntheticParentFolder:](self, "setParent:syntheticParentFolder:", v7, self->_syntheticParentBookmarkFolder);

    if (-[WebBookmark subtype](self->_bookmark, "subtype") == 1)
    {
      self->_lastSelectedSyntheticFolderID = -[WebBookmark parentID](self->_bookmark, "parentID");
      -[_SFBookmarkInfoViewController _reloadFolderInfoForced:](self, "_reloadFolderInfoForced:", 1);
    }
    -[_SFSiteIconView setBookmark:](self->_iconImageView, "setBookmark:", v8);
    -[_SFBookmarkInfoViewController reloadData](self, "reloadData");
    v4 = v8;
  }

}

- (void)setParent:(id)a3 syntheticParentFolder:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  char v10;
  id v11;

  v11 = a3;
  v7 = a4;
  -[WebBookmark UUID](self->_parentBookmark, "UUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "UUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "isEqual:", v9))
  {
    v10 = WBSIsEqual();

    if ((v10 & 1) != 0)
      goto LABEL_6;
  }
  else
  {

  }
  objc_storeStrong((id *)&self->_parentBookmark, a3);
  objc_storeStrong((id *)&self->_syntheticParentBookmarkFolder, a4);
  self->_didSelectFolder = 1;
  -[_SFBookmarkInfoViewController _updateNavigationTitle](self, "_updateNavigationTitle");
LABEL_6:

}

- (void)saveChanges
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id WeakRetained;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  WebBookmark *v20;
  void *v21;
  id v22;
  uint64_t v23;
  void *v24;
  WebBookmark *v25;
  WebBookmark *bookmark;
  void *v27;
  int v28;
  int v29;
  int v30;
  void *v31;
  void *v32;
  uint64_t v33;
  NSArray *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t i;
  uint64_t v39;
  WebBookmarkCollection *collection;
  void *v41;
  int v42;
  void *v43;
  void *v44;
  void *v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  self->_saveWhenDismissed = 0;
  if (-[_SFBookmarkInfoViewController canSaveChanges](self, "canSaveChanges"))
  {
    -[_SFBookmarkTextEntryTableViewCell editableTextField](self->_titleCell, "editableTextField");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "resignFirstResponder");

    -[_SFBookmarkTextEntryTableViewCell editableTextField](self->_titleCell, "editableTextField");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "text");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_web_stringByTrimmingWhitespace");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[WebBookmark setTitle:](self->_bookmark, "setTitle:", v6);
    -[_SFBookmarkTextEntryTableViewCell editableTextField](self->_addressCell, "editableTextField");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "text");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[WebBookmark setAddress:](self->_bookmark, "setAddress:", v8);
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "syntheticBookmarkProviderForBookmarkInfoViewController:", self);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = -[WebBookmark subtype](self->_bookmark, "subtype");
    -[SFSyntheticBookmarkFolder bookmarkList](self->_syntheticParentBookmarkFolder, "bookmarkList");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "folderID");
    if (v11 == 1)
    {
      if (-[WebBookmark parentID](self->_bookmark, "parentID") == (_DWORD)v13)
      {
        -[WebBookmark UUID](self->_bookmark, "UUID");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "updateScopedBookmarkWithUUID:title:address:", v14, v6, v8);

LABEL_43:
        return;
      }
      if (v12)
        goto LABEL_8;
      v41 = v10;
      -[WebBookmark UUID](self->_bookmark, "UUID");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_alloc(MEMORY[0x1E0DCCB98]);
      v23 = -[WebBookmark identifier](self->_parentBookmark, "identifier");
      -[WebBookmarkCollection configuration](self->_collection, "configuration");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = (WebBookmark *)objc_msgSend(v22, "initWithTitle:address:parentID:collectionType:", v6, v8, v23, objc_msgSend(v24, "collectionType"));
      bookmark = self->_bookmark;
      self->_bookmark = v25;

    }
    else
    {
      if (v12)
      {
LABEL_8:
        v44 = v12;
        v15 = objc_alloc(MEMORY[0x1E0DCCB98]);
        objc_msgSend(v10, "deviceIdentifier");
        v16 = v10;
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[WebBookmarkCollection configuration](self->_collection, "configuration");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = (void *)objc_msgSend(v15, "initWithTitle:address:parentID:subtype:deviceIdentifier:collectionType:", v6, v8, v13, 1, v17, objc_msgSend(v18, "collectionType"));

        v10 = v16;
        objc_msgSend(v16, "insertPerTabGroupBookmark:inPerTabGroupBookmarkFolderWithID:", v19, v13);
        -[_SFBookmarkInfoViewController _updateLastSelectedFolder](self, "_updateLastSelectedFolder");
        v20 = self->_bookmark;
        if (v11 == 1)
        {
          -[WebBookmark UUID](v20, "UUID");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "deleteScopedBookmarkWithUUID:completionHandler:", v21, 0);

        }
        else if (-[WebBookmark isInserted](v20, "isInserted"))
        {
          -[WebBookmarkCollection deleteBookmark:](self->_collection, "deleteBookmark:", self->_bookmark);
        }

LABEL_42:
        v12 = v44;
        goto LABEL_43;
      }
      v41 = v10;
      v43 = 0;
    }
    v44 = 0;
    v42 = objc_msgSend(MEMORY[0x1E0DCCBA0], "isLockedSync");
    v45 = v8;
    if ((v42 & 1) != 0
      || (objc_msgSend(MEMORY[0x1E0DCCBA0], "lockSync") & 1) != 0
      || (-[WebBookmark isInserted](self->_bookmark, "isInserted") & 1) != 0
      || (objc_msgSend(MEMORY[0x1E0D4EC80], "sharedFeatureManager"),
          v27 = (void *)objc_claimAutoreleasedReturnValue(),
          v28 = objc_msgSend(v27, "isInMemoryBookmarkChangeTrackingAvailable"),
          v27,
          !v28))
    {
      v30 = -[WebBookmark identifier](self->_parentBookmark, "identifier");
      if (v30 != -[WebBookmark parentID](self->_bookmark, "parentID"))
        -[WebBookmarkCollection moveBookmark:toFolderWithID:](self->_collection, "moveBookmark:toFolderWithID:", self->_bookmark, -[WebBookmark identifier](self->_parentBookmark, "identifier"));
      v29 = 0;
    }
    else
    {
      v29 = 1;
    }
    v31 = v6;
    if ((-[WebBookmarkCollection shouldFetchIconForBookmark:](self->_collection, "shouldFetchIconForBookmark:", self->_bookmark) & 1) == 0)
    {
      -[WebBookmark setIconData:](self->_bookmark, "setIconData:", 0);
      -[WebBookmark _sf_setIconKeyColor:](self->_bookmark, "_sf_setIconKeyColor:", 0);
      -[WebBookmark setFetchedIconData:](self->_bookmark, "setFetchedIconData:", 0);
    }
    if (v29)
    {
      -[WebBookmarkCollection addBookmarkInMemory:toFolderWithID:](self->_collection, "addBookmarkInMemory:toFolderWithID:", self->_bookmark, -[WebBookmark identifier](self->_parentBookmark, "identifier"));
      objc_msgSend(MEMORY[0x1E0D8A758], "sharedLogger");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "didAddNumberOfBookmarksInMemory:", -[NSArray count](self->_childBookmarks, "count") + 1);

    }
    else
    {
      -[WebBookmarkCollection saveBookmark:](self->_collection, "saveBookmark:", self->_bookmark);
    }
    if (v43)
      objc_msgSend(v41, "deleteScopedBookmarkWithUUID:completionHandler:", v43, 0);
    v33 = -[WebBookmark identifier](self->_bookmark, "identifier");
    v46 = 0u;
    v47 = 0u;
    v48 = 0u;
    v49 = 0u;
    v34 = self->_childBookmarks;
    v35 = -[NSArray countByEnumeratingWithState:objects:count:](v34, "countByEnumeratingWithState:objects:count:", &v46, v50, 16);
    if (v35)
    {
      v36 = v35;
      v37 = *(_QWORD *)v47;
      do
      {
        for (i = 0; i != v36; ++i)
        {
          if (*(_QWORD *)v47 != v37)
            objc_enumerationMutation(v34);
          v39 = *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * i);
          collection = self->_collection;
          if (v29)
            -[WebBookmarkCollection addBookmarkInMemory:toFolderWithID:](collection, "addBookmarkInMemory:toFolderWithID:", v39, v33);
          else
            -[WebBookmarkCollection saveAndMoveBookmark:toFolderID:](collection, "saveAndMoveBookmark:toFolderID:", v39, v33);
        }
        v36 = -[NSArray countByEnumeratingWithState:objects:count:](v34, "countByEnumeratingWithState:objects:count:", &v46, v50, 16);
      }
      while (v36);
    }

    if (((v42 | v29) & 1) == 0)
      objc_msgSend(MEMORY[0x1E0DCCBA0], "unlockSync");
    -[_SFBookmarkInfoViewController _updateLastSelectedFolder](self, "_updateLastSelectedFolder");

    v6 = v31;
    v8 = v45;
    v10 = v41;
    goto LABEL_42;
  }
}

- (void)_updateLastSelectedFolder
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  if (self->_didSelectFolder)
  {
    -[WebBookmark UUID](self->_parentBookmark, "UUID");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    if (-[WebBookmarkCollection bookmarkIsFavoritesFolder:](self->_collection, "bookmarkIsFavoritesFolder:", self->_parentBookmark))
    {
      v3 = (id)*MEMORY[0x1E0D4F6B8];

      v8 = v3;
    }
    -[SFSyntheticBookmarkFolder bookmarkList](self->_syntheticParentBookmarkFolder, "bookmarkList");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d"), objc_msgSend(v4, "folderID"));
      v6 = objc_claimAutoreleasedReturnValue();

      v8 = (id)v6;
    }
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v8, *MEMORY[0x1E0D4F6B0]);

  }
}

- (void)_updateSaveButton
{
  -[UIBarButtonItem setEnabled:](self->_saveButton, "setEnabled:", -[_SFBookmarkInfoViewController canSaveChanges](self, "canSaveChanges"));
}

- (BOOL)canSaveChanges
{
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  BOOL v10;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0
    && !objc_msgSend(WeakRetained, "bookmarkInfoViewControllerCanSaveBookmarkChanges:", self))
  {
    v10 = 0;
  }
  else
  {
    -[_SFBookmarkTextEntryTableViewCell editableTextField](self->_titleCell, "editableTextField");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "text");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_web_stringByTrimmingWhitespace");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[_SFBookmarkTextEntryTableViewCell editableTextField](self->_addressCell, "editableTextField");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "text");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_web_stringByTrimmingWhitespace");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v6, "length"))
      v10 = (-[WebBookmark isFolder](self->_bookmark, "isFolder") & 1) != 0 || objc_msgSend(v9, "length") != 0;
    else
      v10 = 0;

  }
  return v10;
}

- (void)_editField:(unint64_t)a3
{
  WebBookmark *bookmark;
  void *v5;
  void *v6;
  _SFBookmarkTextEntryTableViewController *v7;
  void *v8;
  _SFBookmarkTextEntryTableViewController *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  _SFBookmarkTextEntryTableViewController *v14;
  void *v15;
  _SFBookmarkTextEntryTableViewController *v16;

  self->_editingField = a3;
  if (a3 == 1)
  {
    v14 = [_SFBookmarkTextEntryTableViewController alloc];
    -[WebBookmark address](self->_bookmark, "address");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v14;
    v10 = 1;
    v11 = v8;
    v12 = 0;
    v13 = 1;
  }
  else
  {
    if (a3)
    {
      v16 = 0;
      goto LABEL_7;
    }
    bookmark = self->_bookmark;
    -[_SFBookmarkTextEntryTableViewCell editableTextField](self->_titleCell, "editableTextField");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "text");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[WebBookmark setTitle:](bookmark, "setTitle:", v6);

    v7 = [_SFBookmarkTextEntryTableViewController alloc];
    -[WebBookmark localizedTitle](self->_bookmark, "localizedTitle");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v7;
    v10 = 0;
    v11 = v8;
    v12 = 2;
    v13 = 0;
  }
  v16 = -[_SFBookmarkTextEntryTableViewController initWithBookmarkInfoViewField:text:autocapitalizationType:autocorrectionType:delegate:](v9, "initWithBookmarkInfoViewField:text:autocapitalizationType:autocorrectionType:delegate:", v10, v11, v12, v13, self);

LABEL_7:
  -[_SFBookmarkInfoViewController navigationController](self, "navigationController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "pushViewController:animated:", v16, 1);

}

- (void)_createNewFolder
{
  id v3;
  uint64_t v4;
  void *v5;
  _SFBookmarkInfoViewController *v6;
  void *v7;
  id v8;

  v3 = objc_alloc(MEMORY[0x1E0DCCB98]);
  v4 = -[WebBookmark parentID](self->_bookmark, "parentID");
  -[WebBookmarkCollection configuration](self->_collection, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v3, "initFolderWithParentID:collectionType:", v4, objc_msgSend(v5, "collectionType"));

  v6 = -[_SFBookmarkInfoViewController initWithBookmark:inCollection:addingBookmark:]([_SFBookmarkInfoViewController alloc], "initWithBookmark:inCollection:addingBookmark:", v8, self->_collection, 1);
  -[_SFBookmarkInfoViewController setDelegate:](v6, "setDelegate:", self);
  -[_SFBookmarkInfoViewController navigationController](self, "navigationController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "pushViewController:animated:", v6, 1);

}

- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  if (objc_msgSend(v5, "section") != 1
    && ((-[_SFBookmarkInfoViewController _sf_canEditFields](self, "_sf_canEditFields") & 1) != 0
     || objc_msgSend(v5, "row") && self->_addingBookmark))
  {
    v6 = 0;
  }
  else
  {
    v6 = v5;
  }

  return v6;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _SFBookmarkInfoViewController *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;

  v20 = a3;
  v6 = a4;
  v7 = objc_msgSend(v6, "section");
  v8 = objc_msgSend(v6, "row");
  v9 = v8;
  if (v7 != 1)
  {
    if (v8 == 1)
    {
      v10 = self;
      v11 = 1;
    }
    else
    {
      if (v8)
        goto LABEL_12;
      v10 = self;
      v11 = 0;
    }
    -[_SFBookmarkInfoViewController _editField:](v10, "_editField:", v11);
    goto LABEL_12;
  }
  if (-[_SFBookmarkInfoViewController _isIndexPathForNewFolderRow:](self, "_isIndexPathForNewFolderRow:", v6))
  {
    -[_SFBookmarkInfoViewController _createNewFolder](self, "_createNewFolder");
  }
  else
  {
    if (self->_folderPickerExpanded)
    {
      objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", self->_selectedFolderIndex, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "cellForRowAtIndexPath:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setAccessoryType:", 0);

      objc_msgSend(v20, "cellForRowAtIndexPath:", v6);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setAccessoryType:", 3);

      -[NSArray objectAtIndexedSubscript:](self->_folders, "objectAtIndexedSubscript:", v9);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "bookmark");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "syntheticFolder");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFBookmarkInfoViewController setParent:syntheticParentFolder:](self, "setParent:syntheticParentFolder:", v16, v17);

    }
    -[_SFBookmarkTextEntryTableViewCell editableTextField](self->_titleCell, "editableTextField");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "resignFirstResponder");

    -[_SFBookmarkTextEntryTableViewCell editableTextField](self->_addressCell, "editableTextField");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "resignFirstResponder");

    -[_SFBookmarkInfoViewController _setFolderPickerExpanded:animated:](self, "_setFolderPickerExpanded:animated:", !self->_folderPickerExpanded, 1);
  }
LABEL_12:

}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  uint64_t v3;

  if (self->_addingToFavorites)
    v3 = 2;
  else
    v3 = 3;
  return v3
       - (-[_SFBookmarkInfoViewController _showBookmarkAppearanceSwitch](self, "_showBookmarkAppearanceSwitch", a3) ^ 1);
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v6;
  int64_t v7;

  v6 = a3;
  if (a4 == 2)
  {
    v7 = -[_SFBookmarkInfoViewController _showBookmarkAppearanceSwitch](self, "_showBookmarkAppearanceSwitch");
  }
  else if (a4 == 1)
  {
    if (self->_folderPickerExpanded)
      v7 = -[_SFBookmarkInfoViewController _numberOfExpandedFolderPickerRows](self, "_numberOfExpandedFolderPickerRows");
    else
      v7 = 1;
  }
  else if (a4)
  {
    v7 = 0;
  }
  else if (-[WebBookmark isFolder](self->_bookmark, "isFolder"))
  {
    v7 = 1;
  }
  else
  {
    v7 = 2;
  }

  return v7;
}

- (int64_t)_numberOfExpandedFolderPickerRows
{
  return -[NSArray count](self->_folders, "count") + self->_enableAddFolder;
}

- (BOOL)_isIndexPathForNewFolderRow:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  BOOL v7;

  v4 = a3;
  v5 = v4;
  if (self->_folderPickerExpanded && objc_msgSend(v4, "section") == 1)
  {
    v6 = objc_msgSend(v5, "row");
    v7 = v6 == -[NSArray count](self->_folders, "count");
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  int *v10;
  void *v11;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v7, "section"))
  {
    if (objc_msgSend(v7, "section") == 2)
    {
      -[_SFBookmarkInfoViewController _cellForShowTitleSwitch:](self, "_cellForShowTitleSwitch:", v6);
      v8 = (id)objc_claimAutoreleasedReturnValue();
    }
    else if (-[_SFBookmarkInfoViewController _isIndexPathForNewFolderRow:](self, "_isIndexPathForNewFolderRow:", v7))
    {
      -[_SFBookmarkInfoViewController _cellForNewFolderRowWithTableView:](self, "_cellForNewFolderRowWithTableView:", v6);
      v8 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (self->_folderPickerExpanded)
        -[_SFBookmarkInfoViewController _cellForExpandedFolderAtIndex:withTableView:](self, "_cellForExpandedFolderAtIndex:withTableView:", objc_msgSend(v7, "row"), v6);
      else
        -[_SFBookmarkInfoViewController _cellForParentBookmarkWithTableView:](self, "_cellForParentBookmarkWithTableView:", v6);
      v8 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v9 = objc_msgSend(v7, "row");
    v10 = &OBJC_IVAR____SFBookmarkInfoViewController__addressCell;
    if (!v9)
      v10 = &OBJC_IVAR____SFBookmarkInfoViewController__titleCell;
    v8 = *(id *)((char *)&self->super.super.super.super.super.isa + *v10);
  }
  v11 = v8;

  return v11;
}

- (id)_dequeueFolderPickerCellFromTableView:(id)a3
{
  void *v3;
  _SFFolderPickerTableViewCellLayoutManager *v4;
  void *v5;
  void *v6;

  objc_msgSend(a3, "dequeueReusableCellWithIdentifier:", CFSTR("BookmarkFolderItemTableViewCell"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D50]), "initWithStyle:reuseIdentifier:", 0, CFSTR("BookmarkFolderItemTableViewCell"));
    +[_SFFolderPickerTableViewCellLayoutManager indentationWidth](_SFFolderPickerTableViewCellLayoutManager, "indentationWidth");
    objc_msgSend(v3, "setIndentationWidth:");
    v4 = objc_alloc_init(_SFFolderPickerTableViewCellLayoutManager);
    objc_msgSend(v3, "setLayoutManager:", v4);

    objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithTextStyle:scale:", *MEMORY[0x1E0DC4A88], 3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "imageView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setPreferredSymbolConfiguration:", v5);

  }
  return v3;
}

- (id)_cellForShowTitleSwitch:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a3, "dequeueReusableCellWithIdentifier:", CFSTR("BookmarkShowTitleSwitch"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D50]), "initWithStyle:reuseIdentifier:", 0, CFSTR("BookmarkShowTitleSwitch"));
  _WBSLocalizedString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "textLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setText:", v5);

  objc_msgSend(v4, "setAccessoryView:", self->_showTitleSwitch);
  -[UISwitch setAccessibilityIdentifier:](self->_showTitleSwitch, "setAccessibilityIdentifier:", CFSTR("BookmarkShowTitleSwitch"));
  return v4;
}

- (id)_cellForNewFolderRowWithTableView:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[_SFBookmarkInfoViewController _dequeueFolderPickerCellFromTableView:](self, "_dequeueFolderPickerCellFromTableView:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _WBSLocalizedString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "textLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setText:", v4);

  objc_msgSend(MEMORY[0x1E0DC3658], "sf_safariAccentColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "textLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTextColor:", v6);

  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("plus"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "imageView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setImage:", v8);

  objc_msgSend(v3, "setIndentationLevel:", 0);
  objc_msgSend(v3, "setAccessoryType:", 1);
  objc_msgSend(v3, "setTintAdjustmentMode:", 0);
  objc_msgSend(v3, "setAccessibilityIdentifier:", CFSTR("BookmarkInfoLocationNewFolder"));
  objc_msgSend(v3, "setUserInteractionEnabled:", 1);
  return v3;
}

- (id)_cellForExpandedFolderAtIndex:(int64_t)a3 withTableView:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int64_t selectedFolderIndex;
  BOOL v21;
  _BOOL4 v22;
  uint64_t v23;

  v6 = a4;
  -[NSArray objectAtIndexedSubscript:](self->_folders, "objectAtIndexedSubscript:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "syntheticFolder");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "bookmarkList");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
      v11 = -[WebBookmark isFolder](self->_bookmark, "isFolder") ^ 1;
    else
      v11 = 0;

  }
  else
  {
    v11 = 1;
  }
  -[_SFBookmarkInfoViewController _dequeueFolderPickerCellFromTableView:](self, "_dequeueFolderPickerCellFromTableView:", v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "title");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "textLabel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setText:", v13);

  if ((_DWORD)v11)
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  else
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "textLabel");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setTextColor:", v15);

  objc_msgSend(v7, "bookmark");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[_SFBookmarkInfoViewController _iconForViewCellGivenBookmark:syntheticFolder:](self, "_iconForViewCellGivenBookmark:syntheticFolder:", v17, v9);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "imageView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setImage:", v18);

  objc_msgSend(v12, "setIndentationLevel:", objc_msgSend(v7, "depth"));
  selectedFolderIndex = self->_selectedFolderIndex;
  v21 = selectedFolderIndex == a3;
  v22 = selectedFolderIndex != a3;
  if (v21)
    v23 = 3;
  else
    v23 = 0;
  objc_msgSend(v12, "setAccessoryType:", v23);
  objc_msgSend(v12, "setTintAdjustmentMode:", 2 * v22);
  objc_msgSend(v12, "setAccessibilityIdentifier:", CFSTR("BookmarkInfoLocationFolderChoice"));
  objc_msgSend(v12, "setUserInteractionEnabled:", v11);

  return v12;
}

- (id)_cellForParentBookmarkWithTableView:(id)a3
{
  void *v3;
  void *v5;
  SFSyntheticBookmarkFolder *syntheticParentBookmarkFolder;
  void *v7;
  uint64_t v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;
  void *v13;
  WebBookmark *parentBookmark;
  void *v15;
  void *v16;
  void *v17;

  -[_SFBookmarkInfoViewController _dequeueFolderPickerCellFromTableView:](self, "_dequeueFolderPickerCellFromTableView:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  syntheticParentBookmarkFolder = self->_syntheticParentBookmarkFolder;
  if (syntheticParentBookmarkFolder)
    goto LABEL_4;
  if (self->_parentBookmark)
  {
    syntheticParentBookmarkFolder = 0;
LABEL_4:
    v7 = 0;
    goto LABEL_5;
  }
  -[NSArray objectAtIndexedSubscript:](self->_folders, "objectAtIndexedSubscript:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  syntheticParentBookmarkFolder = self->_syntheticParentBookmarkFolder;
LABEL_5:
  -[SFSyntheticBookmarkFolder title](syntheticParentBookmarkFolder, "title");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v8)
  {
    v10 = 0;
    v11 = (void *)v8;
  }
  else
  {
    -[WebBookmark localizedTitle](self->_parentBookmark, "localizedTitle");
    v12 = objc_claimAutoreleasedReturnValue();
    v3 = (void *)v12;
    if (v12)
    {
      v10 = 0;
      v11 = (void *)v12;
    }
    else
    {
      objc_msgSend(v7, "title");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 1;
    }
  }
  objc_msgSend(v5, "textLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setText:", v11);

  if (v10)
  if (!v9)

  parentBookmark = self->_parentBookmark;
  v15 = parentBookmark;
  if (!parentBookmark)
  {
    objc_msgSend(v7, "bookmark");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[_SFBookmarkInfoViewController _iconForViewCellGivenBookmark:syntheticFolder:](self, "_iconForViewCellGivenBookmark:syntheticFolder:", v15, self->_syntheticParentBookmarkFolder);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "imageView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setImage:", v16);

  if (!parentBookmark)
  objc_msgSend(v5, "setIndentationLevel:", 0);
  objc_msgSend(v5, "setAccessoryType:", 0);
  objc_msgSend(v5, "setTintAdjustmentMode:", 0);
  objc_msgSend(v5, "setAccessibilityIdentifier:", CFSTR("BookmarkInfoLocationFolderPicker"));
  objc_msgSend(v5, "setUserInteractionEnabled:", 1);

  return v5;
}

- (id)_iconForViewCellGivenBookmark:(id)a3 syntheticFolder:(id)a4
{
  id v6;
  NSString *v7;
  void *v8;
  NSString *v9;
  NSComparisonResult v10;
  void *v11;
  const __CFString *v12;
  void *v13;

  v6 = a3;
  v7 = (NSString *)*MEMORY[0x1E0DC48F0];
  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "preferredContentSizeCategory");
  v9 = (NSString *)objc_claimAutoreleasedReturnValue();
  v10 = UIContentSizeCategoryCompareToCategory(v7, v9);

  if (v10 == NSOrderedAscending)
  {
    v13 = 0;
  }
  else
  {
    v11 = (void *)MEMORY[0x1E0DC3870];
    if (a4)
    {
      v12 = CFSTR("star.square.on.square");
    }
    else if (-[_SFBookmarkInfoViewController _bookmarkIsInFavoritesFolder:](self, "_bookmarkIsInFavoritesFolder:", v6))
    {
      v12 = CFSTR("star");
    }
    else
    {
      v12 = CFSTR("folder");
    }
    objc_msgSend(v11, "systemImageNamed:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v13;
}

- (BOOL)_bookmarkIsInFavoritesFolder:(id)a3
{
  WebBookmarkCollection *collection;
  id v4;
  void *v5;
  char v6;

  collection = self->_collection;
  v4 = a3;
  -[WebBookmarkCollection bookmarksBarBookmark](collection, "bookmarksBarBookmark");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqual:", v4);

  return v6;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  id v6;

  v6 = a3;
  if (a4)
  {
    if (a4 == 2)
    {
      if (!-[_SFBookmarkInfoViewController _showBookmarkAppearanceSwitch](self, "_showBookmarkAppearanceSwitch"))
      {
        a4 = 0;
        goto LABEL_9;
      }
    }
    else if (a4 != 1)
    {
      a4 = (int64_t)&stru_1E4AC8470;
      goto LABEL_9;
    }
    _WBSLocalizedString();
    a4 = objc_claimAutoreleasedReturnValue();
  }
LABEL_9:

  return (id)a4;
}

- (BOOL)tableView:(id)a3 canFocusRowAtIndexPath:(id)a4
{
  return objc_msgSend(a4, "section", a3) == 1;
}

- (BOOL)_showBookmarkAppearanceSwitch
{
  char v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  if (!_SFDeviceIsPad() || self->_addingBookmark)
    return 0;
  objc_msgSend(MEMORY[0x1E0C99EA0], "safari_browserDefaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "integerForKey:", *MEMORY[0x1E0D4EFD8]))
  {
    v3 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "safari_browserDefaults");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "BOOLForKey:", *MEMORY[0x1E0D4EFB8]))
    {
      -[NSArray objectAtIndexedSubscript:](self->_folders, "objectAtIndexedSubscript:", self->_selectedFolderIndex);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "bookmark");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[_SFBookmarkInfoViewController _bookmarkIsInFavoritesFolder:](self, "_bookmarkIsInFavoritesFolder:", v8))
      {
        if (-[WebBookmark isFolder](self->_bookmark, "isFolder"))
        {
          -[WebBookmark title](self->_bookmark, "title");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = (void *)MEMORY[0x1E0DC3F10];
          -[_SFBookmarkInfoViewController view](self, "view");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v3 = objc_msgSend(v9, "safari_hasLeadingEmojiSafariIsRightToLeft:", objc_msgSend(v10, "_sf_usesLeftToRightLayoutOnView:", v11) ^ 1);

        }
        else
        {
          v3 = 1;
        }
      }
      else
      {
        v3 = 0;
      }

    }
    else
    {
      v3 = 0;
    }

  }
  return v3;
}

- (void)_didBeginEditingTextField:(id)a3
{
  -[_SFBookmarkInfoViewController _setFolderPickerExpanded:animated:](self, "_setFolderPickerExpanded:animated:", 0, 1);
}

- (void)_didChangeEditingTextField:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a3;
  -[_SFBookmarkTextEntryTableViewCell editableTextField](self->_titleCell, "editableTextField");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  if (v4 == v9)
  {
    v7 = 0;
LABEL_6:
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", v7, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  -[_SFBookmarkTextEntryTableViewCell editableTextField](self->_addressCell, "editableTextField");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v9)
  {
    v7 = 1;
    goto LABEL_6;
  }
  v6 = 0;
LABEL_7:
  -[_SFBookmarkInfoViewController _setFolderPickerExpanded:animated:](self, "_setFolderPickerExpanded:animated:", 0, 1);
  -[_SFBookmarkInfoViewController tableView](self, "tableView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "scrollToRowAtIndexPath:atScrollPosition:animated:", v6, 0, 1);

}

- (void)_setFolderPickerExpanded:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int64_t v11;
  int64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  _BOOL4 v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[5];
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  if (self->_folderPickerExpanded != a3)
  {
    v4 = a4;
    self->_folderPickerExpanded = a3;
    -[_SFBookmarkInfoViewController _reloadFolderInfoForced:](self, "_reloadFolderInfoForced:", 0);
    -[_SFBookmarkInfoViewController tableView](self, "tableView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v4)
    {
      objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", 0, 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v23[0] = v8;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = -[_SFBookmarkInfoViewController _numberOfExpandedFolderPickerRows](self, "_numberOfExpandedFolderPickerRows");
      if (v11)
      {
        v12 = v11;
        for (i = 0; i != v12; ++i)
        {
          objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", i, 1);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "addObject:", v14);

        }
      }
      objc_msgSend(v7, "beginUpdates");
      if (self->_folderPickerExpanded)
        v15 = v9;
      else
        v15 = v10;
      objc_msgSend(v7, "deleteRowsAtIndexPaths:withRowAnimation:", v15, 0);
      if (self->_folderPickerExpanded)
        v16 = v10;
      else
        v16 = v9;
      objc_msgSend(v7, "insertRowsAtIndexPaths:withRowAnimation:", v16, 0);
      v17 = objc_msgSend(v7, "numberOfSections") < 3;
      if (((v17 ^ -[_SFBookmarkInfoViewController _showBookmarkAppearanceSwitch](self, "_showBookmarkAppearanceSwitch")) & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", 2);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (-[_SFBookmarkInfoViewController _showBookmarkAppearanceSwitch](self, "_showBookmarkAppearanceSwitch"))
          objc_msgSend(v7, "insertSections:withRowAnimation:", v18, 0);
        else
          objc_msgSend(v7, "deleteSections:withRowAnimation:", v18, 0);

      }
      objc_msgSend(v7, "endUpdates");

    }
    else
    {
      objc_msgSend(v6, "reloadData");
    }
    if (self->_folderPickerExpanded)
    {
      objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", self->_selectedFolderIndex, 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "scrollToRowAtIndexPath:atScrollPosition:animated:", v19, 0, 1);

    }
    -[_SFBookmarkInfoViewController sheetPresentationController](self, "sheetPresentationController");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v20;
    if (v4 && v20)
    {
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __67___SFBookmarkInfoViewController__setFolderPickerExpanded_animated___block_invoke;
      v22[3] = &unk_1E4ABFE00;
      v22[4] = self;
      objc_msgSend(v20, "animateChanges:", v22);
    }
    else
    {
      -[SFPopoverSizingTableViewController updatePreferredContentSize](self, "updatePreferredContentSize");
    }

  }
}

- (void)_reloadFolderInfoForced:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  SFFolderPickerList *v7;
  id WeakRetained;
  void *v9;
  NSArray *v10;
  NSArray *folders;
  NSArray *v12;
  uint64_t v13;
  int64_t v14;
  NSArray *v15;
  _QWORD v16[5];
  _QWORD v17[5];

  if (a3 || self->_folderPickerExpanded && !self->_folders)
  {
    if (-[WebBookmark isFolder](self->_bookmark, "isFolder"))
    {
      v4 = (void *)MEMORY[0x1E0C99E60];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[WebBookmark identifier](self->_bookmark, "identifier"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setWithObject:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v6 = 0;
    }
    v7 = -[SFFolderPickerList initWithBookmarkCollection:style:]([SFFolderPickerList alloc], "initWithBookmarkCollection:style:", self->_collection, 0);
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "syntheticBookmarkProviderForBookmarkInfoViewController:", self);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFFolderPickerList setSyntheticBookmarkProvider:](v7, "setSyntheticBookmarkProvider:", v9);

    -[SFFolderPickerList folderListItemsIgnoringIdentifiers:](v7, "folderListItemsIgnoringIdentifiers:", v6);
    v10 = (NSArray *)objc_claimAutoreleasedReturnValue();
    folders = self->_folders;
    self->_folders = v10;

  }
  v12 = self->_folders;
  v13 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __57___SFBookmarkInfoViewController__reloadFolderInfoForced___block_invoke;
  v17[3] = &unk_1E4AC45E0;
  v17[4] = self;
  v14 = -[NSArray indexOfObjectPassingTest:](v12, "indexOfObjectPassingTest:", v17);
  if (v14 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v15 = self->_folders;
    v16[0] = v13;
    v16[1] = 3221225472;
    v16[2] = __57___SFBookmarkInfoViewController__reloadFolderInfoForced___block_invoke_2;
    v16[3] = &unk_1E4AC45E0;
    v16[4] = self;
    v14 = -[NSArray indexOfObjectPassingTest:](v15, "indexOfObjectPassingTest:", v16);
  }
  self->_selectedFolderIndex = v14;
}

- (BOOL)isEditingField
{
  return self->_editingField != -1;
}

- (void)_valuesChanged
{
  if (!-[_SFBookmarkInfoViewController isEditingField](self, "isEditingField"))
    -[_SFBookmarkInfoViewController _updateSaveButton](self, "_updateSaveButton");
}

- (void)_addActionsForTextFields
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[_SFBookmarkTextEntryTableViewCell editableTextField](self->_titleCell, "editableTextField");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addTarget:action:forControlEvents:", self, sel__returnWasPressedInTextField_, 0x80000);

  -[_SFBookmarkTextEntryTableViewCell editableTextField](self->_addressCell, "editableTextField");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addTarget:action:forControlEvents:", self, sel__returnWasPressedInTextField_, 0x80000);

  -[_SFBookmarkTextEntryTableViewCell editableTextField](self->_titleCell, "editableTextField");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addTarget:action:forControlEvents:", self, sel__valuesChanged, 0x20000);

  -[_SFBookmarkTextEntryTableViewCell editableTextField](self->_addressCell, "editableTextField");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addTarget:action:forControlEvents:", self, sel__valuesChanged, 0x20000);

}

- (void)_removeActionsForTextFields
{
  void *v3;
  id v4;

  -[_SFBookmarkTextEntryTableViewCell editableTextField](self->_titleCell, "editableTextField");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeTarget:action:forControlEvents:", self, 0, 0xFFFFFFFFLL);

  -[_SFBookmarkTextEntryTableViewCell editableTextField](self->_addressCell, "editableTextField");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeTarget:action:forControlEvents:", self, 0, 0xFFFFFFFFLL);

}

- (void)bookmarkTextEntryTableViewController:(id)a3 dismissedWithText:(id)a4
{
  id v6;
  unint64_t editingField;
  id v8;

  v8 = a3;
  v6 = a4;
  editingField = self->_editingField;
  if (editingField == 1)
  {
    -[WebBookmark setAddress:](self->_bookmark, "setAddress:", v6);
  }
  else if (!editingField)
  {
    -[WebBookmark setTitle:](self->_bookmark, "setTitle:", v6);
  }
  -[_SFBookmarkInfoViewController reloadData](self, "reloadData");
  self->_editingField = -1;

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)_SFBookmarkInfoViewController;
  -[_SFBookmarkInfoViewController dealloc](&v4, sel_dealloc);
}

- (void)viewWillLayoutSubviews
{
  if ((-[WebBookmark isFolder](self->_bookmark, "isFolder") & 1) == 0)
    -[_SFBookmarkInfoViewController _updateIconViewFrame](self, "_updateIconViewFrame");
  -[_SFBookmarkInfoViewController _updateCellValues](self, "_updateCellValues");
}

- (BOOL)hasTranslucentAppearance
{
  id WeakRetained;
  BOOL v4;
  objc_super v6;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0
    && (objc_msgSend(WeakRetained, "bookmarkInfoViewControllerShouldUseTranslucentAppearance:", self) & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)_SFBookmarkInfoViewController;
    v4 = -[SFPopoverSizingTableViewController hasTranslucentAppearance](&v6, sel_hasTranslucentAppearance);
  }

  return v4;
}

- (void)updateTranslucentAppearance
{
  uint64_t v3;
  void *v4;
  int v5;
  void *v6;
  int v7;
  UITextField *v8;
  UITextField *textFieldToRestoreFirstResponder;
  objc_super v10;

  v3 = 1104;
  -[_SFBookmarkTextEntryTableViewCell editableTextField](self->_titleCell, "editableTextField");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isFirstResponder");

  if (v5
    || (v3 = 1112,
        -[_SFBookmarkTextEntryTableViewCell editableTextField](self->_addressCell, "editableTextField"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v6, "isFirstResponder"),
        v6,
        v7))
  {
    objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + v3), "editableTextField");
    v8 = (UITextField *)objc_claimAutoreleasedReturnValue();
    textFieldToRestoreFirstResponder = self->_textFieldToRestoreFirstResponder;
    self->_textFieldToRestoreFirstResponder = v8;

  }
  v10.receiver = self;
  v10.super_class = (Class)_SFBookmarkInfoViewController;
  -[SFPopoverSizingTableViewController updateTranslucentAppearance](&v10, sel_updateTranslucentAppearance);
}

- (id)backgroundColorUsingTranslucentAppearance:(BOOL)a3
{
  void *v3;
  objc_super v5;

  if (a3)
  {
    v5.receiver = self;
    v5.super_class = (Class)_SFBookmarkInfoViewController;
    -[SFPopoverSizingTableViewController backgroundColorUsingTranslucentAppearance:](&v5, sel_backgroundColorUsingTranslucentAppearance_, 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "systemGroupedBackgroundColor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  id v6;
  unsigned __int8 v7;
  id WeakRetained;
  char v9;
  objc_super v11;

  v6 = a4;
  if (sel_cancelKeyPressed == a3)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v9 = objc_opt_respondsToSelector();

  }
  else
  {
    if (sel_saveKeyPressed == a3)
    {
      v7 = -[_SFBookmarkInfoViewController canSaveChanges](self, "canSaveChanges");
    }
    else
    {
      v11.receiver = self;
      v11.super_class = (Class)_SFBookmarkInfoViewController;
      v7 = -[_SFBookmarkInfoViewController canPerformAction:withSender:](&v11, sel_canPerformAction_withSender_, a3, v6);
    }
    v9 = v7;
  }

  return v9 & 1;
}

- (void)validateCommand:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)_SFBookmarkInfoViewController;
  -[_SFBookmarkInfoViewController validateCommand:](&v6, sel_validateCommand_, v4);
  if ((char *)objc_msgSend(v4, "action") == sel_saveKeyPressed)
  {
    _WBSLocalizedString();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setDiscoverabilityTitle:", v5);

  }
}

- (void)bookmarkInfoViewController:(id)a3 didFinishWithResult:(BOOL)a4
{
  id *v5;
  WebBookmark *v6;
  WebBookmark *parentBookmark;
  void *v8;
  id v9;
  id v10;

  if (a4)
  {
    v5 = (id *)a3;
    objc_msgSend(v5, "bookmark");
    v6 = (WebBookmark *)objc_claimAutoreleasedReturnValue();
    parentBookmark = self->_parentBookmark;
    self->_parentBookmark = v6;

    objc_storeStrong((id *)&self->_syntheticParentBookmarkFolder, v5[134]);
    self->_didSelectFolder = 1;
    self->_folderPickerExpanded = 0;
    -[_SFBookmarkInfoViewController _reloadFolderInfoForced:](self, "_reloadFolderInfoForced:", 1);
    -[_SFBookmarkInfoViewController tableView](self, "tableView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "reloadData");

  }
  -[_SFBookmarkInfoViewController navigationController](self, "navigationController", a3);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v10, "popViewControllerAnimated:", 1);

}

- (BOOL)bookmarkInfoViewControllerCanSaveBookmarkChanges:(id)a3
{
  id WeakRetained;
  char v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v5 = objc_msgSend(WeakRetained, "bookmarkInfoViewControllerCanSaveBookmarkChanges:", self);
  else
    v5 = 1;

  return v5;
}

- (BOOL)bookmarkInfoViewControllerShouldUseTranslucentAppearance:(id)a3
{
  id WeakRetained;
  char v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v5 = objc_msgSend(WeakRetained, "bookmarkInfoViewControllerShouldUseTranslucentAppearance:", self);
  else
    v5 = 0;

  return v5;
}

- (id)syntheticBookmarkProviderForBookmarkInfoViewController:(id)a3
{
  id WeakRetained;
  void *v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "syntheticBookmarkProviderForBookmarkInfoViewController:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (_SFBookmarkInfoViewControllerDelegate)delegate
{
  return (_SFBookmarkInfoViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (WebBookmark)bookmark
{
  return self->_bookmark;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bookmark, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_showTitleSwitch, 0);
  objc_storeStrong((id *)&self->_saveButton, 0);
  objc_storeStrong((id *)&self->_textFieldToRestoreFirstResponder, 0);
  objc_storeStrong((id *)&self->_folders, 0);
  objc_storeStrong((id *)&self->_iconImageView, 0);
  objc_storeStrong((id *)&self->_addressCell, 0);
  objc_storeStrong((id *)&self->_titleCell, 0);
  objc_storeStrong((id *)&self->_childBookmarks, 0);
  objc_storeStrong((id *)&self->_syntheticParentBookmarkFolder, 0);
  objc_storeStrong((id *)&self->_parentBookmark, 0);
  objc_storeStrong((id *)&self->_collection, 0);
}

@end
