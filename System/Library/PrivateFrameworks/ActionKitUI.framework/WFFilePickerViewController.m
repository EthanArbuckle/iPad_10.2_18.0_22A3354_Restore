@implementation WFFilePickerViewController

- (id)initForPickingFilesAtPath:(id)a3 service:(id)a4 allowsMultipleSelection:(BOOL)a5 completionHandler:(id)a6
{
  return -[WFFilePickerViewController initWithPath:selectedFiles:service:mode:allowsMultipleSelection:pickCompletionHandler:saveCompletionHandler:](self, "initWithPath:selectedFiles:service:mode:allowsMultipleSelection:pickCompletionHandler:saveCompletionHandler:", a3, 0, a4, 0, a5, a6, 0);
}

- (id)initForSavingFilesAtPath:(id)a3 service:(id)a4 completionHandler:(id)a5
{
  return -[WFFilePickerViewController initWithPath:selectedFiles:service:mode:allowsMultipleSelection:pickCompletionHandler:saveCompletionHandler:](self, "initWithPath:selectedFiles:service:mode:allowsMultipleSelection:pickCompletionHandler:saveCompletionHandler:", a3, 0, a4, 1, 0, 0, a5);
}

- (WFFilePickerViewController)initWithPath:(id)a3 selectedFiles:(id)a4 service:(id)a5 mode:(int64_t)a6 allowsMultipleSelection:(BOOL)a7 pickCompletionHandler:(id)a8 saveCompletionHandler:(id)a9
{
  __CFString *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  WFFilePickerViewController *v21;
  WFFilePickerViewController *v22;
  __CFString *v23;
  void *v24;
  void *v25;
  id pickCompletionHandler;
  void *v27;
  id saveCompletionHandler;
  WFFilePickerResultsViewController *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  WFFilePickerViewController *v35;
  void *v37;
  objc_super v38;

  v16 = (__CFString *)a3;
  v17 = a4;
  v18 = a5;
  v19 = a8;
  v20 = a9;
  if (!v18)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFFilePickerViewController.m"), 50, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("service"));

  }
  v38.receiver = self;
  v38.super_class = (Class)WFFilePickerViewController;
  v21 = -[WFFilePickerViewController initWithNibName:bundle:](&v38, sel_initWithNibName_bundle_, 0, 0);
  v22 = v21;
  if (v21)
  {
    if (v16)
      v23 = v16;
    else
      v23 = CFSTR("/");
    objc_storeStrong((id *)&v21->_path, v23);
    objc_storeStrong((id *)&v22->_service, a5);
    v22->_mode = a6;
    v22->_allowsMultipleSelection = a7;
    v24 = v17;
    if (!v17)
      v24 = (void *)objc_opt_new();
    objc_storeStrong((id *)&v22->_selectedFiles, v24);
    if (!v17)

    v25 = _Block_copy(v19);
    pickCompletionHandler = v22->_pickCompletionHandler;
    v22->_pickCompletionHandler = v25;

    v27 = _Block_copy(v20);
    saveCompletionHandler = v22->_saveCompletionHandler;
    v22->_saveCompletionHandler = v27;

    v29 = -[WFFilePickerResultsViewController initWithFileListDelegate:]([WFFilePickerResultsViewController alloc], "initWithFileListDelegate:", v22);
    v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD928]), "initWithSearchResultsController:", v29);
    objc_msgSend(v30, "setSearchResultsUpdater:", v22);
    objc_storeStrong((id *)&v22->_searchController, v30);
    if (-[NSString isEqualToString:](v22->_path, "isEqualToString:", CFSTR("/")))
    {
      -[WFFilePickerViewController service](v22, "service");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)objc_opt_class(), "serviceName");
    }
    else
    {
      -[WFFilePickerViewController path](v22, "path");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "lastPathComponent");
    }
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFFilePickerViewController setTitle:](v22, "setTitle:", v32);

    v33 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithBarButtonSystemItem:target:action:", 1, v22, sel_cancel);
    -[WFFilePickerViewController navigationItem](v22, "navigationItem");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setRightBarButtonItem:", v33);

    v35 = v22;
  }

  return v22;
}

- (void)loadView
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  WFRemoteFileListView *v14;
  void *v15;
  WFRemoteFileListView *v16;
  void *v17;
  WFRemoteFileStatusView *v18;
  void *v19;
  void *v20;
  objc_super v21;
  CGRect v22;

  v21.receiver = self;
  v21.super_class = (Class)WFFilePickerViewController;
  -[WFFilePickerViewController loadView](&v21, sel_loadView);
  -[WFFilePickerViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD4B8], "systemBackgroundColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", v4);

  objc_msgSend(v3, "bounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  -[WFFilePickerViewController files](self, "files");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = [WFRemoteFileListView alloc];
  objc_msgSend(MEMORY[0x24BEBD738], "currentCollation");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[WFRemoteFileListView initWithFrame:collation:](v14, "initWithFrame:collation:", v15, v6, v8, v10, v12);

  -[WFRemoteFileListView setAutoresizingMask:](v16, "setAutoresizingMask:", 18);
  -[WFRemoteFileListView setDelegate:](v16, "setDelegate:", self);
  -[WFRemoteFileListView setHidden:](v16, "setHidden:", 1);
  -[WFRemoteFileListView setFiles:](v16, "setFiles:", v13);
  objc_msgSend(v3, "addSubview:", v16);
  objc_storeWeak((id *)&self->_fileListView, v16);
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD500]), "initWithDelegate:", self);
  -[WFRemoteFileListView addInteraction:](v16, "addInteraction:", v17);
  v18 = -[WFRemoteFileStatusView initWithFrame:]([WFRemoteFileStatusView alloc], "initWithFrame:", v6, v8, v10, v12);
  -[WFRemoteFileStatusView setDelegate:](v18, "setDelegate:", self);
  -[WFRemoteFileStatusView setAutoresizingMask:](v18, "setAutoresizingMask:", 18);
  objc_msgSend(v3, "addSubview:", v18);
  objc_storeWeak((id *)&self->_statusView, v18);
  -[WFFilePickerViewController searchController](self, "searchController");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "searchBar");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v22.origin.x = v6;
  v22.origin.y = v8;
  v22.size.width = v10;
  v22.size.height = v12;
  objc_msgSend(v20, "setFrame:", 0.0, 0.0, CGRectGetWidth(v22), 56.0);
  objc_msgSend(v20, "setAutoresizingMask:", 2);
  objc_msgSend(v3, "addSubview:", v20);
  -[WFFilePickerViewController loadFiles](self, "loadFiles");
  -[WFFilePickerViewController updateStatusViewAnimated:](self, "updateStatusViewAnimated:", 0);
  -[WFFilePickerViewController updateToolbar](self, "updateToolbar");

}

- (void)viewWillLayoutSubviews
{
  _BOOL8 v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  void *v15;
  void *v16;
  double Height;
  void *v18;
  id v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  CGFloat v26;
  objc_super v27;
  CGRect v28;

  v27.receiver = self;
  v27.super_class = (Class)WFFilePickerViewController;
  -[WFFilePickerViewController viewWillLayoutSubviews](&v27, sel_viewWillLayoutSubviews);
  v3 = -[WFFilePickerViewController hideSearchBar](self, "hideSearchBar");
  -[WFFilePickerViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safeAreaInsets");
  v6 = v5;

  -[WFFilePickerViewController searchController](self, "searchController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "searchBar");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setHidden:", v3);
  objc_msgSend(v8, "frame");
  v10 = v9;
  v12 = v11;
  v14 = v13;
  objc_msgSend(v8, "superview");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFFilePickerViewController view](self, "view");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  Height = 0.0;
  if (!objc_msgSend(v15, "isEqual:", v16))
    v6 = 0.0;

  v18 = (void *)MEMORY[0x24BEBDB00];
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __52__WFFilePickerViewController_viewWillLayoutSubviews__block_invoke;
  v21[3] = &unk_24E342998;
  v22 = v8;
  v23 = v10;
  v24 = v6;
  v25 = v12;
  v26 = v14;
  v19 = v8;
  objc_msgSend(v18, "performWithoutAnimation:", v21);
  if (!v3)
  {
    v28.origin.x = v10;
    v28.origin.y = v6;
    v28.size.width = v12;
    v28.size.height = v14;
    Height = CGRectGetHeight(v28);
  }
  -[WFFilePickerViewController fileListView](self, "fileListView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setContentInset:", Height, 0.0, 0.0, 0.0);
  objc_msgSend(v20, "setVerticalScrollIndicatorInsets:", Height, 0.0, 0.0, 0.0);

}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)WFFilePickerViewController;
  -[WFFilePickerViewController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[WFFilePickerViewController updateToolbar](self, "updateToolbar");
}

- (void)setHideSearchBar:(BOOL)a3
{
  _BOOL4 hideSearchBar;
  id v5;

  hideSearchBar = self->_hideSearchBar;
  self->_hideSearchBar = a3;
  if (hideSearchBar != a3)
  {
    if (-[WFFilePickerViewController isViewLoaded](self, "isViewLoaded"))
    {
      -[WFFilePickerViewController view](self, "view");
      v5 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setNeedsLayout");

    }
  }
}

- (void)cancel
{
  uint64_t v3;
  void *v4;

  if (-[WFFilePickerViewController mode](self, "mode"))
    -[WFFilePickerViewController saveCompletionHandler](self, "saveCompletionHandler");
  else
    -[WFFilePickerViewController pickCompletionHandler](self, "pickCompletionHandler");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v3)
    (*(void (**)(uint64_t, _QWORD))(v3 + 16))(v3, 0);

  -[WFFilePickerViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)finish
{
  void (**v3)(_QWORD, _QWORD);
  void *v4;
  void *v5;

  if (-[WFFilePickerViewController mode](self, "mode"))
  {
    -[WFFilePickerViewController saveCompletionHandler](self, "saveCompletionHandler");
    v3 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      -[WFFilePickerViewController path](self, "path");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *))v3)[2](v3, v4);
LABEL_6:

    }
  }
  else
  {
    -[WFFilePickerViewController pickCompletionHandler](self, "pickCompletionHandler");
    v3 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      -[WFFilePickerViewController selectedFiles](self, "selectedFiles");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "array");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *))v3)[2](v3, v5);

      goto LABEL_6;
    }
  }

  -[WFFilePickerViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)loadFiles
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  WFFilePickerViewController *v9;

  if (!-[WFFilePickerViewController loading](self, "loading"))
  {
    -[WFFilePickerViewController files](self, "files");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v3)
    {
      -[WFFilePickerViewController setLoading:](self, "setLoading:", 1);
      -[WFFilePickerViewController setError:](self, "setError:", 0);
      -[WFFilePickerViewController updateStatusViewAnimated:](self, "updateStatusViewAnimated:", 0);
      -[WFFilePickerViewController service](self, "service");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFFilePickerViewController path](self, "path");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v7[0] = MEMORY[0x24BDAC760];
      v7[1] = 3221225472;
      v7[2] = __39__WFFilePickerViewController_loadFiles__block_invoke;
      v7[3] = &unk_24E3433A8;
      v8 = v4;
      v9 = self;
      v6 = v4;
      objc_msgSend(v6, "retrieveFilesAtPath:options:progress:completionHandler:", v5, 1, 0, v7);

    }
  }
}

- (void)updateStatusViewAnimated:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  _BOOL8 v9;
  int v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  double v21;
  _BOOL4 v22;
  _QWORD v23[4];
  id v24;
  id v25;
  id v26;
  BOOL v27;
  _QWORD v28[4];
  id v29;
  id v30;
  _QWORD aBlock[4];
  id v32;
  id v33;
  WFFilePickerViewController *v34;
  id v35;

  v22 = a3;
  -[WFFilePickerViewController error](self, "error");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFFilePickerViewController files](self, "files");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFFilePickerViewController statusView](self, "statusView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFFilePickerViewController fileListView](self, "fileListView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "count");
  v9 = v8 == 0;
  v10 = objc_msgSend(v6, "isHidden");
  v11 = MEMORY[0x24BDAC760];
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __55__WFFilePickerViewController_updateStatusViewAnimated___block_invoke;
  aBlock[3] = &unk_24E343AD0;
  v12 = v4;
  v32 = v12;
  v13 = v6;
  v33 = v13;
  v34 = self;
  v14 = v5;
  v35 = v14;
  v15 = _Block_copy(aBlock);
  v16 = v15;
  if ((((v8 != 0) ^ v10) & 1) != 0)
  {
    v17 = v7;
    if (v22)
    {
      v18 = v11;
      v19 = (void *)MEMORY[0x24BEBDB00];
      v20 = v18;
      v28[0] = v18;
      v28[1] = 3221225472;
      v28[2] = __55__WFFilePickerViewController_updateStatusViewAnimated___block_invoke_2;
      v28[3] = &unk_24E3439C0;
      v29 = v13;
      v30 = v7;
      v23[0] = v20;
      v23[1] = 3221225472;
      v23[2] = __55__WFFilePickerViewController_updateStatusViewAnimated___block_invoke_3;
      v23[3] = &unk_24E342A50;
      v24 = v29;
      v27 = v8 == 0;
      v25 = v30;
      v26 = v16;
      objc_msgSend(v19, "animateWithDuration:animations:completion:", v28, v23, 0.15);

    }
    else
    {
      (*((void (**)(void *))v15 + 2))(v15);
      objc_msgSend(v13, "setAlpha:", (double)v9);
      v21 = 0.0;
      if (v8)
        v21 = 1.0;
      objc_msgSend(v7, "setAlpha:", v21);
      objc_msgSend(v13, "setHidden:", v8 != 0);
      objc_msgSend(v7, "setHidden:", v9);
    }
  }
  else
  {
    (*((void (**)(void *))v15 + 2))(v15);
    v17 = v7;
  }

}

- (void)setStatusViewToEmpty
{
  _BOOL8 v3;
  id v4;

  v3 = -[WFFilePickerViewController mode](self, "mode") == 0;
  -[WFFilePickerViewController statusView](self, "statusView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEmptyWithLabel:", v3);

}

- (void)updateToolbar
{
  int64_t v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  __CFString *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[4];

  v17[3] = *MEMORY[0x24BDAC8D0];
  v3 = -[WFFilePickerViewController mode](self, "mode");
  if (v3 || -[WFFilePickerViewController allowsMultipleSelection](self, "allowsMultipleSelection"))
  {
    -[WFFilePickerViewController navigationController](self, "navigationController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isToolbarHidden");

    if (v5)
    {
      -[WFFilePickerViewController navigationController](self, "navigationController");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setToolbarHidden:animated:", 0, 0);

    }
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithBarButtonSystemItem:target:action:", 5, self, 0);
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithTitle:style:target:action:", 0, 0, self, sel_finish);
    objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithRed:green:blue:alpha:", 0.063, 0.478, 0.969, 1.0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setTintColor:", v9);

    if (v3)
    {
      v10 = CFSTR("Save Here");
    }
    else
    {
      -[WFFilePickerViewController selectedFiles](self, "selectedFiles");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "count");

      objc_msgSend(v8, "setEnabled:", v12 != 0);
      if (v12 != 1)
      {
        v15 = (void *)MEMORY[0x24BDD17C8];
        WFLocalizedString(CFSTR("Get Selected Files (%lu)"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "localizedStringWithFormat:", v13, v12);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setTitle:", v16);

        goto LABEL_10;
      }
      v10 = CFSTR("Get Selected File (1)");
    }
    WFLocalizedString(v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setTitle:", v13);
LABEL_10:

    v17[0] = v7;
    v17[1] = v8;
    v17[2] = v7;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v17, 3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFFilePickerViewController setToolbarItems:animated:](self, "setToolbarItems:animated:", v14, 0);

  }
}

- (BOOL)caseInsensitiveArray:(id)a3 isEqualToArray:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  BOOL v12;

  v5 = a3;
  v6 = a4;
  v7 = objc_msgSend(v5, "count");
  if (v7 == objc_msgSend(v6, "count"))
  {
    if (objc_msgSend(v5, "count"))
    {
      v8 = 0;
      while (1)
      {
        objc_msgSend(v5, "objectAtIndex:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "objectAtIndex:", v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v9, "localizedStandardCompare:", v10);
        v12 = v11 == 0;

        if (v11)
          break;
        if (++v8 >= (unint64_t)objc_msgSend(v5, "count"))
          goto LABEL_6;
      }
    }
    else
    {
LABEL_6:
      v12 = 1;
    }
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (void)navigateToSubdirectoryAtPath:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  void *v12;
  _BOOL4 v13;
  void *v14;
  unint64_t v15;
  void *v16;
  void *v17;
  WFFilePickerViewController *v18;
  void *v19;
  void *v20;
  int64_t v21;
  _BOOL8 v22;
  void *v23;
  WFFilePickerViewController *v24;
  void *v25;
  void *v26;
  WFFilePickerViewController *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;

  v35 = a3;
  -[WFFilePickerViewController navigationController](self, "navigationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "topViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFFilePickerViewController.m"), 307, CFSTR("View controller must be part of a navigation stack"));

  }
  objc_msgSend(v6, "path");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "pathComponents");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "stringByStandardizingPath");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "pathComponents");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v8, "count");
  if (v11 <= objc_msgSend(v10, "count"))
  {
    objc_msgSend(v10, "subarrayWithRange:", 0, objc_msgSend(v8, "count"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[WFFilePickerViewController caseInsensitiveArray:isEqualToArray:](self, "caseInsensitiveArray:isEqualToArray:", v12, v8);

    if (v13)
    {
      v32 = v7;
      v33 = v6;
      v34 = v5;
      v14 = (void *)objc_opt_new();
      v31 = v8;
      v15 = objc_msgSend(v8, "count");
      if (v15 < objc_msgSend(v10, "count"))
      {
        v36 = v14;
        do
        {
          v16 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(v10, "subarrayWithRange:", 0, ++v15);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "pathWithComponents:", v17);
          v37 = (void *)objc_claimAutoreleasedReturnValue();

          v18 = [WFFilePickerViewController alloc];
          -[WFFilePickerViewController selectedFiles](self, "selectedFiles");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          -[WFFilePickerViewController service](self, "service");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = -[WFFilePickerViewController mode](self, "mode");
          v22 = -[WFFilePickerViewController allowsMultipleSelection](self, "allowsMultipleSelection");
          -[WFFilePickerViewController pickCompletionHandler](self, "pickCompletionHandler");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          -[WFFilePickerViewController saveCompletionHandler](self, "saveCompletionHandler");
          v24 = self;
          v25 = v10;
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = -[WFFilePickerViewController initWithPath:selectedFiles:service:mode:allowsMultipleSelection:pickCompletionHandler:saveCompletionHandler:](v18, "initWithPath:selectedFiles:service:mode:allowsMultipleSelection:pickCompletionHandler:saveCompletionHandler:", v37, v19, v20, v21, v22, v23, v26);

          v10 = v25;
          self = v24;

          v14 = v36;
          objc_msgSend(v36, "addObject:", v27);

        }
        while (v15 < objc_msgSend(v10, "count"));
      }
      if (objc_msgSend(v14, "count") == 1)
      {
        objc_msgSend(v14, "firstObject");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = v34;
        objc_msgSend(v34, "pushViewController:animated:", v28, 1);
      }
      else
      {
        v5 = v34;
        objc_msgSend(v34, "viewControllers");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "arrayByAddingObjectsFromArray:", v14);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "setViewControllers:animated:", v29, 0);

      }
      v7 = v32;
      v6 = v33;

      v8 = v31;
    }
  }

}

- (void)fileListView:(id)a3 didSelectFile:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v7, "wfIsDirectory"))
  {
    -[WFFilePickerViewController searchController](self, "searchController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setActive:", 0);

    objc_msgSend(v7, "wfPath");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFFilePickerViewController navigateToSubdirectoryAtPath:](self, "navigateToSubdirectoryAtPath:", v9);

  }
  else if (-[WFFilePickerViewController mode](self, "mode") != 1)
  {
    if (-[WFFilePickerViewController allowsMultipleSelection](self, "allowsMultipleSelection"))
    {
      v21 = 0u;
      v22 = 0u;
      v19 = 0u;
      v20 = 0u;
      -[WFFilePickerViewController selectedFiles](self, "selectedFiles", 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)objc_msgSend(v10, "copy");

      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v20;
        while (2)
        {
          for (i = 0; i != v13; ++i)
          {
            if (*(_QWORD *)v20 != v14)
              objc_enumerationMutation(v11);
            v16 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
            if (objc_msgSend(v16, "wfIsEqualToFile:", v7))
            {
              -[WFFilePickerViewController selectedFiles](self, "selectedFiles");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "removeObject:", v16);

              goto LABEL_16;
            }
          }
          v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
          if (v13)
            continue;
          break;
        }
      }

      -[WFFilePickerViewController selectedFiles](self, "selectedFiles");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addObject:", v7);
LABEL_16:

      objc_msgSend(v6, "updateCheckmarkForFile:", v7);
      -[WFFilePickerViewController updateToolbar](self, "updateToolbar");
    }
    else
    {
      -[WFFilePickerViewController selectedFiles](self, "selectedFiles");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "addObject:", v7);

      -[WFFilePickerViewController finish](self, "finish");
    }
  }

}

- (BOOL)fileListView:(id)a3 shouldDisplayCheckmarkForFile:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[WFFilePickerViewController selectedFiles](self, "selectedFiles", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copy");

  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v7);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "wfIsEqualToFile:", v5) & 1) != 0)
        {
          LOBYTE(v8) = 1;
          goto LABEL_11;
        }
      }
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v8)
        continue;
      break;
    }
  }
LABEL_11:

  return v8;
}

- (BOOL)fileListView:(id)a3 shouldSelectFile:(id)a4
{
  return (objc_msgSend(a4, "wfIsDirectory", a3) & 1) != 0 || -[WFFilePickerViewController mode](self, "mode") == 0;
}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  double y;
  double x;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v13[4];
  id v14;
  WFFilePickerViewController *v15;

  y = a4.y;
  x = a4.x;
  -[WFFilePickerViewController fileListView](self, "fileListView", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "fileAtPoint:", x, y);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x24BEBD4F8];
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __84__WFFilePickerViewController_contextMenuInteraction_configurationForMenuAtLocation___block_invoke;
  v13[3] = &unk_24E342A78;
  v14 = v8;
  v15 = self;
  v10 = v8;
  objc_msgSend(v9, "configurationWithIdentifier:previewProvider:actionProvider:", v10, v13, &__block_literal_global_165);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)contextMenuInteraction:(id)a3 willPerformPreviewActionForMenuWithConfiguration:(id)a4 animator:(id)a5
{
  void *v6;
  void *v7;
  int v8;
  WFFilePickerViewController *v9;
  void *v10;
  void *v11;
  void *v12;
  int64_t v13;
  _BOOL8 v14;
  void *v15;
  void *v16;
  WFFilePickerViewController *v17;
  void *v18;
  void *v19;

  objc_msgSend(a4, "identifier", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v19 = v6;
    v8 = objc_msgSend(v6, "conformsToProtocol:", &unk_2554B5A70);
    v7 = v19;
    if (v8)
    {
      v9 = [WFFilePickerViewController alloc];
      objc_msgSend(v19, "wfPath");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFFilePickerViewController selectedFiles](self, "selectedFiles");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFFilePickerViewController service](self, "service");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = -[WFFilePickerViewController mode](self, "mode");
      v14 = -[WFFilePickerViewController allowsMultipleSelection](self, "allowsMultipleSelection");
      -[WFFilePickerViewController pickCompletionHandler](self, "pickCompletionHandler");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFFilePickerViewController saveCompletionHandler](self, "saveCompletionHandler");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = -[WFFilePickerViewController initWithPath:selectedFiles:service:mode:allowsMultipleSelection:pickCompletionHandler:saveCompletionHandler:](v9, "initWithPath:selectedFiles:service:mode:allowsMultipleSelection:pickCompletionHandler:saveCompletionHandler:", v10, v11, v12, v13, v14, v15, v16);

      -[WFFilePickerViewController navigationController](self, "navigationController");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "pushViewController:animated:", v17, 0);

      v7 = v19;
    }
  }

}

- (void)updateSearchResultsForSearchController:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id v15;

  v4 = a3;
  objc_msgSend(v4, "searchBar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "text");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "searchResultsController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "length"))
  {
    -[WFFilePickerViewController service](self, "service");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFFilePickerViewController path](self, "path");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __69__WFFilePickerViewController_updateSearchResultsForSearchController___block_invoke;
    v11[3] = &unk_24E342B30;
    v12 = v8;
    v13 = v5;
    v14 = v6;
    v15 = v7;
    v10 = v8;
    objc_msgSend(v10, "searchFiles:inPath:completionHandler:", v14, v9, v11);

  }
  else
  {
    objc_msgSend(v7, "setFiles:", 0);
  }

}

- (void)didPresentSearchController:(id)a3
{
  id v3;

  -[WFFilePickerViewController view](self, "view", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setNeedsLayout");

}

- (void)didDismissSearchController:(id)a3
{
  void *v4;
  id v5;

  objc_msgSend(a3, "searchBar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setText:", 0);

  -[WFFilePickerViewController view](self, "view");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setNeedsLayout");

}

- (WFFileStorageService)service
{
  return self->_service;
}

- (NSString)path
{
  return self->_path;
}

- (BOOL)hideSearchBar
{
  return self->_hideSearchBar;
}

- (int64_t)mode
{
  return self->_mode;
}

- (BOOL)allowsMultipleSelection
{
  return self->_allowsMultipleSelection;
}

- (id)pickCompletionHandler
{
  return self->_pickCompletionHandler;
}

- (id)saveCompletionHandler
{
  return self->_saveCompletionHandler;
}

- (NSArray)files
{
  return self->_files;
}

- (void)setFiles:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1016);
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1024);
}

- (BOOL)loading
{
  return self->_loading;
}

- (void)setLoading:(BOOL)a3
{
  self->_loading = a3;
}

- (NSMutableOrderedSet)selectedFiles
{
  return self->_selectedFiles;
}

- (void)setSelectedFiles:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1032);
}

- (UISearchController)searchController
{
  return self->_searchController;
}

- (WFRemoteFileListView)fileListView
{
  return (WFRemoteFileListView *)objc_loadWeakRetained((id *)&self->_fileListView);
}

- (WFRemoteFileStatusView)statusView
{
  return (WFRemoteFileStatusView *)objc_loadWeakRetained((id *)&self->_statusView);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_statusView);
  objc_destroyWeak((id *)&self->_fileListView);
  objc_storeStrong((id *)&self->_searchController, 0);
  objc_storeStrong((id *)&self->_selectedFiles, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_files, 0);
  objc_storeStrong(&self->_saveCompletionHandler, 0);
  objc_storeStrong(&self->_pickCompletionHandler, 0);
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_service, 0);
}

void __69__WFFilePickerViewController_updateSearchResultsForSearchController___block_invoke(id *a1, void *a2)
{
  void *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  id v11;

  v3 = (void *)MEMORY[0x24BE19390];
  v4 = a1[4];
  v5 = a2;
  objc_msgSend(v4, "associatedAppDescriptor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "locationWithAppDescriptor:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = a1[5];
  v9 = a1[6];
  v10 = a1[7];
  v11 = a1[4];
  WFContentCollectionFromStorageServiceResult();

}

void __69__WFFilePickerViewController_updateSearchResultsForSearchController___block_invoke_2(uint64_t a1, void *a2)
{
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id v9;

  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __69__WFFilePickerViewController_updateSearchResultsForSearchController___block_invoke_3;
  v6[3] = &unk_24E342AE0;
  v7 = *(id *)(a1 + 32);
  v8 = *(id *)(a1 + 40);
  v9 = *(id *)(a1 + 48);
  v4 = *(void **)(a1 + 56);
  v5 = a2;
  objc_msgSend(v5, "getObjectRepresentations:forClass:", v6, objc_msgSend(v4, "objectRepresentationClass"));

}

void __69__WFFilePickerViewController_updateSearchResultsForSearchController___block_invoke_3(id *a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;
  id v8;
  id v9;

  v3 = a2;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __69__WFFilePickerViewController_updateSearchResultsForSearchController___block_invoke_4;
  v5[3] = &unk_24E343AD0;
  v6 = a1[4];
  v7 = a1[5];
  v8 = a1[6];
  v9 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], v5);

}

void __69__WFFilePickerViewController_updateSearchResultsForSearchController___block_invoke_4(uint64_t a1)
{
  void *v2;
  int v3;

  objc_msgSend(*(id *)(a1 + 32), "text");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", *(_QWORD *)(a1 + 40));

  if (v3)
    objc_msgSend(*(id *)(a1 + 48), "setFiles:", *(_QWORD *)(a1 + 56));
}

WFFilePickerViewController *__84__WFFilePickerViewController_contextMenuInteraction_configurationForMenuAtLocation___block_invoke(uint64_t a1)
{
  WFFilePickerViewController *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  WFFilePickerViewController *v10;

  if (objc_msgSend(*(id *)(a1 + 32), "wfIsDirectory"))
  {
    v2 = [WFFilePickerViewController alloc];
    objc_msgSend(*(id *)(a1 + 32), "wfPath");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "selectedFiles");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "service");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(*(id *)(a1 + 40), "mode");
    v7 = objc_msgSend(*(id *)(a1 + 40), "allowsMultipleSelection");
    objc_msgSend(*(id *)(a1 + 40), "pickCompletionHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "saveCompletionHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[WFFilePickerViewController initWithPath:selectedFiles:service:mode:allowsMultipleSelection:pickCompletionHandler:saveCompletionHandler:](v2, "initWithPath:selectedFiles:service:mode:allowsMultipleSelection:pickCompletionHandler:saveCompletionHandler:", v3, v4, v5, v6, v7, v8, v9);

    -[WFFilePickerViewController setHideSearchBar:](v10, "setHideSearchBar:", 1);
  }
  else
  {
    v10 = 0;
  }
  return v10;
}

uint64_t __84__WFFilePickerViewController_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_2()
{
  return 0;
}

uint64_t __55__WFFilePickerViewController_updateStatusViewAnimated___block_invoke(uint64_t a1)
{
  uint64_t result;

  if (*(_QWORD *)(a1 + 32))
    return objc_msgSend(*(id *)(a1 + 40), "setError:");
  if (objc_msgSend(*(id *)(a1 + 48), "loading"))
    return objc_msgSend(*(id *)(a1 + 40), "setLoading");
  result = objc_msgSend(*(id *)(a1 + 56), "count");
  if (!result)
    return objc_msgSend(*(id *)(a1 + 48), "setStatusViewToEmpty");
  return result;
}

uint64_t __55__WFFilePickerViewController_updateStatusViewAnimated___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
  return objc_msgSend(*(id *)(a1 + 40), "setAlpha:", 0.0);
}

void __55__WFFilePickerViewController_updateStatusViewAnimated___block_invoke_3(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;
  char v6;

  objc_msgSend(*(id *)(a1 + 32), "setHidden:", *(_BYTE *)(a1 + 56) == 0);
  objc_msgSend(*(id *)(a1 + 40), "setHidden:", *(unsigned __int8 *)(a1 + 56));
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  v2 = (void *)MEMORY[0x24BEBDB00];
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __55__WFFilePickerViewController_updateStatusViewAnimated___block_invoke_4;
  v3[3] = &unk_24E343808;
  v4 = *(id *)(a1 + 32);
  v6 = *(_BYTE *)(a1 + 56);
  v5 = *(id *)(a1 + 40);
  objc_msgSend(v2, "animateWithDuration:animations:", v3, 0.15);

}

uint64_t __55__WFFilePickerViewController_updateStatusViewAnimated___block_invoke_4(uint64_t a1, double a2)
{
  double v3;

  LOBYTE(a2) = *(_BYTE *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "setAlpha:", (double)*(unint64_t *)&a2);
  v3 = 0.0;
  if (!*(_BYTE *)(a1 + 48))
    v3 = 1.0;
  return objc_msgSend(*(id *)(a1 + 40), "setAlpha:", v3);
}

void __39__WFFilePickerViewController_loadFiles__block_invoke(int8x16_t *a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  int8x16_t v9;

  v3 = (void *)MEMORY[0x24BE19390];
  v4 = (void *)a1[2].i64[0];
  v5 = a2;
  objc_msgSend(v4, "associatedAppDescriptor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "locationWithAppDescriptor:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = a1[2];
  v8 = (id)v9.i64[0];
  WFContentCollectionFromStorageServiceResult();

}

void __39__WFFilePickerViewController_loadFiles__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  _QWORD v9[5];
  _QWORD block[5];
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5)
  {
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __39__WFFilePickerViewController_loadFiles__block_invoke_4;
    v9[3] = &unk_24E342A00;
    v8 = *(void **)(a1 + 40);
    v9[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v5, "getObjectRepresentations:forClass:", v9, objc_msgSend(v8, "objectRepresentationClass"));
  }
  else
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __39__WFFilePickerViewController_loadFiles__block_invoke_3;
    block[3] = &unk_24E3439C0;
    block[4] = *(_QWORD *)(a1 + 32);
    v11 = v6;
    dispatch_async(MEMORY[0x24BDAC9B8], block);

  }
}

uint64_t __39__WFFilePickerViewController_loadFiles__block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setLoading:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setError:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "updateStatusViewAnimated:", 0);
}

void __39__WFFilePickerViewController_loadFiles__block_invoke_4(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a2;
  v7 = a4;
  if (objc_msgSend(*(id *)(a1 + 32), "mode") == 1)
  {
    objc_msgSend(v6, "if_objectsPassingTest:", &__block_literal_global_1550);
    v8 = objc_claimAutoreleasedReturnValue();

    v6 = (id)v8;
  }
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __39__WFFilePickerViewController_loadFiles__block_invoke_6;
  block[3] = &unk_24E3433F8;
  block[4] = *(_QWORD *)(a1 + 32);
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

uint64_t __39__WFFilePickerViewController_loadFiles__block_invoke_6(uint64_t a1)
{
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "setLoading:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setFiles:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "setError:", *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "fileListView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setFiles:", *(_QWORD *)(a1 + 40));

  objc_msgSend(*(id *)(a1 + 32), "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setNeedsLayout");

  return objc_msgSend(*(id *)(a1 + 32), "updateStatusViewAnimated:", 1);
}

uint64_t __39__WFFilePickerViewController_loadFiles__block_invoke_5(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "wfIsDirectory");
}

uint64_t __52__WFFilePickerViewController_viewWillLayoutSubviews__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

@end
