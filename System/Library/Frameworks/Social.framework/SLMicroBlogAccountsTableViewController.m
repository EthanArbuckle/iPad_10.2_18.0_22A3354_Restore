@implementation SLMicroBlogAccountsTableViewController

- (SLMicroBlogAccountsTableViewController)initWithStyle:(int64_t)a3
{
  SLMicroBlogAccountsTableViewController *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SLMicroBlogAccountsTableViewController;
  v3 = -[SLMicroBlogAccountsTableViewController initWithStyle:](&v7, sel_initWithStyle_, a3);
  if (v3)
  {
    SLSocialFrameworkBundle();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("ACCOUNT_PICKER_TITLE"), &stru_1E7592238, CFSTR("Localizable"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SLMicroBlogAccountsTableViewController setTitle:](v3, "setTitle:", v5);

  }
  return v3;
}

- (id)_blankImage
{
  UIImage *blankImage;
  CGContext *CurrentContext;
  UIImage *v5;
  UIImage *v6;
  CGSize v8;

  blankImage = self->_blankImage;
  if (!blankImage)
  {
    v8.width = 50.0;
    v8.height = 50.0;
    UIGraphicsBeginImageContext(v8);
    CurrentContext = UIGraphicsGetCurrentContext();
    UIGraphicsPushContext(CurrentContext);
    UIGraphicsPopContext();
    UIGraphicsGetImageFromCurrentImageContext();
    v5 = (UIImage *)objc_claimAutoreleasedReturnValue();
    v6 = self->_blankImage;
    self->_blankImage = v5;

    UIGraphicsEndImageContext();
    blankImage = self->_blankImage;
  }
  return blankImage;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)SLMicroBlogAccountsTableViewController;
  -[SLMicroBlogAccountsTableViewController viewDidLoad](&v17, sel_viewDidLoad);
  -[SLMicroBlogAccountsTableViewController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "backgroundView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setOpaque:", 0);

  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SLMicroBlogAccountsTableViewController tableView](self, "tableView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "backgroundView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBackgroundColor:", v5);

  -[SLMicroBlogAccountsTableViewController tableView](self, "tableView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setOpaque:", 0);

  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SLMicroBlogAccountsTableViewController tableView](self, "tableView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setBackgroundColor:", v9);

  v11 = *MEMORY[0x1E0CEBC10];
  -[SLMicroBlogAccountsTableViewController tableView](self, "tableView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setRowHeight:", v11);

  objc_msgSend(MEMORY[0x1E0CEA5E8], "preferredFontForTextStyle:", *MEMORY[0x1E0CEB538]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "lineHeight");
  v15 = v14 + v14;
  -[SLMicroBlogAccountsTableViewController tableView](self, "tableView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setEstimatedRowHeight:", v15);

}

- (void)cancelButtonTapped:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_selectionDelegate);
  objc_msgSend(WeakRetained, "accountsViewController:didSelectAccountUserRecord:", self, self->_selectedAccountUserRecord);

}

- (void)setSelectionDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_selectionDelegate, a3);
}

- (void)setAccountUserRecords:(id)a3
{
  void *v4;
  id v5;

  objc_storeStrong((id *)&self->_accountUserRecords, a3);
  -[SLMicroBlogAccountsTableViewController tableView](self, "tableView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reloadData");

  -[SLMicroBlogAccountsTableViewController tableView](self, "tableView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "contentSize");
  -[SLMicroBlogAccountsTableViewController setPreferredContentSize:](self, "setPreferredContentSize:", 320.0);

}

- (void)setCurrentAccountUserRecord:(id)a3
{
  objc_storeStrong((id *)&self->_selectedAccountUserRecord, a3);
}

- (void)didUpdateAccountUserRecord:(id)a3
{
  NSUInteger v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = -[NSArray indexOfObject:](self->_accountUserRecords, "indexOfObject:", a3);
  if (v4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v5 = (void *)MEMORY[0x1E0C99D20];
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", v4, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "arrayWithObject:", v6);
    v8 = (id)objc_claimAutoreleasedReturnValue();

    -[SLMicroBlogAccountsTableViewController tableView](self, "tableView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "reloadRowsAtIndexPaths:withRowAnimation:", v8, 100);

  }
}

- (id)_accountUserRecordForIndexPath:(id)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_accountUserRecords, "objectAtIndexedSubscript:", objc_msgSend(a3, "row"));
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return -[NSArray count](self->_accountUserRecords, "count", a3, a4);
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;

  v6 = a4;
  objc_msgSend(a3, "dequeueReusableCellWithIdentifier:", CFSTR("Cell"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAA60]), "initWithStyle:reuseIdentifier:", 0, CFSTR("Cell"));
  -[SLMicroBlogAccountsTableViewController _accountUserRecordForIndexPath:](self, "_accountUserRecordForIndexPath:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "screen_name");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "textLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setText:", v9);

  objc_msgSend(v8, "profileImageCache");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
    objc_msgSend(v8, "profileImageCache");
  else
    -[SLMicroBlogAccountsTableViewController _blankImage](self, "_blankImage");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "imageView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setImage:", v12);

  -[SLMicroBlogUserRecord screen_name](self->_selectedAccountUserRecord, "screen_name");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "screen_name");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v13) = objc_msgSend(v14, "isEqualToString:", v15);

  if ((_DWORD)v13)
    v16 = 3;
  else
    v16 = 0;
  objc_msgSend(v7, "setAccessoryType:", v16);

  return v7;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v5;
  id v6;

  v5 = a4;
  objc_msgSend(v5, "setOpaque:", 0);
  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBackgroundColor:", v6);

}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  dispatch_time_t v16;
  id v17;
  _QWORD v18[5];
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  -[SLMicroBlogAccountsTableViewController _accountUserRecordForIndexPath:](self, "_accountUserRecordForIndexPath:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SLMicroBlogAccountsTableViewController tableView](self, "tableView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "deselectRowAtIndexPath:animated:", v5, 1);

  objc_storeStrong((id *)&self->_selectedAccountUserRecord, v6);
  -[SLMicroBlogAccountsTableViewController tableView](self, "tableView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "cellForRowAtIndexPath:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  -[SLMicroBlogAccountsTableViewController tableView](self, "tableView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "visibleCells");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v21;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v21 != v14)
          objc_enumerationMutation(v11);
        objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * v15++), "setAccessoryType:", 0);
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v13);
  }

  objc_msgSend(v9, "setAccessoryType:", 3);
  v16 = dispatch_time(0, 400000000);
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __76__SLMicroBlogAccountsTableViewController_tableView_didSelectRowAtIndexPath___block_invoke;
  v18[3] = &unk_1E7590CC8;
  v18[4] = self;
  v19 = v6;
  v17 = v6;
  dispatch_after(v16, MEMORY[0x1E0C80D38], v18);

}

void __76__SLMicroBlogAccountsTableViewController_tableView_didSelectRowAtIndexPath___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 1032));
  objc_msgSend(WeakRetained, "accountsViewController:didSelectAccountUserRecord:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_blankImage, 0);
  objc_destroyWeak((id *)&self->_selectionDelegate);
  objc_storeStrong((id *)&self->_selectedAccountUserRecord, 0);
  objc_storeStrong((id *)&self->_accountUserRecords, 0);
}

@end
