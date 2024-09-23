@implementation _SFBookmarkTextEntryTableViewController

- (_SFBookmarkTextEntryTableViewController)initWithBookmarkInfoViewField:(unint64_t)a3 text:(id)a4 autocapitalizationType:(int64_t)a5 autocorrectionType:(int64_t)a6 delegate:(id)a7
{
  id v12;
  id v13;
  _SFBookmarkTextEntryTableViewController *v14;
  _SFBookmarkTextEntryTableViewController *v15;
  uint64_t v16;
  NSString *initialText;
  void *v18;
  void *v19;
  _SFBookmarkTextEntryTableViewController *v20;
  objc_super v22;

  v12 = a4;
  v13 = a7;
  v22.receiver = self;
  v22.super_class = (Class)_SFBookmarkTextEntryTableViewController;
  v14 = -[_SFBookmarkTextEntryTableViewController initWithStyle:](&v22, sel_initWithStyle_, 1);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_delegate, a7);
    v16 = objc_msgSend(v12, "copy");
    initialText = v15->_initialText;
    v15->_initialText = (NSString *)v16;

    v15->_autocapitalizationType = a5;
    v15->_autocorrectionType = a6;
    if (a3 <= 1)
    {
      _WBSLocalizedString();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFBookmarkTextEntryTableViewController navigationItem](v15, "navigationItem");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setTitle:", v18);

    }
    v20 = v15;
  }

  return v15;
}

- (void)loadView
{
  _SFBookmarkTextEntryTableViewCell *v3;
  _SFBookmarkTextEntryTableViewCell *textEntryCell;
  void *v5;
  double v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)_SFBookmarkTextEntryTableViewController;
  -[_SFBookmarkTextEntryTableViewController loadView](&v9, sel_loadView);
  v3 = -[_SFBookmarkTextEntryTableViewCell initWithText:autocapitalizationType:autocorrectionType:]([_SFBookmarkTextEntryTableViewCell alloc], "initWithText:autocapitalizationType:autocorrectionType:", self->_initialText, self->_autocapitalizationType, self->_autocorrectionType);
  textEntryCell = self->_textEntryCell;
  self->_textEntryCell = v3;

  -[_SFBookmarkTextEntryTableViewCell editableTextField](self->_textEntryCell, "editableTextField");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addTarget:action:forControlEvents:", self, sel__returnWasPressedInTextField_, 0x80000);

  v6 = *MEMORY[0x1E0DC53D8];
  -[_SFBookmarkTextEntryTableViewController tableView](self, "tableView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setRowHeight:", v6);

  -[_SFBookmarkTextEntryTableViewController tableView](self, "tableView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setEstimatedRowHeight:", 44.0);

}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return 1;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  return self->_textEntryCell;
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)_SFBookmarkTextEntryTableViewController;
  -[_SFBookmarkTextEntryTableViewController viewWillAppear:](&v10, sel_viewWillAppear_, a3);
  -[_SFBookmarkTextEntryTableViewController tableView](self, "tableView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reloadData");
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", 0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cellForRowAtIndexPath:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "editableTextField");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "becomeFirstResponder");

  if (-[_SFBookmarkTextEntryTableViewControllerDelegate bookmarkTextEntryTableViewControllerShouldUseTranslucentAppearance:](self->_delegate, "bookmarkTextEntryTableViewControllerShouldUseTranslucentAppearance:", self))
  {
    -[_SFBookmarkTextEntryTableViewController view](self, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setBackgroundColor:", v9);

  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  _SFBookmarkTextEntryTableViewControllerDelegate *delegate;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_SFBookmarkTextEntryTableViewController;
  -[_SFBookmarkTextEntryTableViewController viewWillDisappear:](&v7, sel_viewWillDisappear_, a3);
  delegate = self->_delegate;
  -[_SFBookmarkTextEntryTableViewCell editableTextField](self->_textEntryCell, "editableTextField");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "text");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_SFBookmarkTextEntryTableViewControllerDelegate bookmarkTextEntryTableViewController:dismissedWithText:](delegate, "bookmarkTextEntryTableViewController:dismissedWithText:", self, v6);

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[_SFBookmarkTextEntryTableViewCell editableTextField](self->_textEntryCell, "editableTextField");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeTarget:action:forControlEvents:", self, 0, 0xFFFFFFFFLL);

  v4.receiver = self;
  v4.super_class = (Class)_SFBookmarkTextEntryTableViewController;
  -[_SFBookmarkTextEntryTableViewController dealloc](&v4, sel_dealloc);
}

- (void)_returnWasPressedInTextField:(id)a3
{
  void *v3;
  id v4;
  id v5;

  -[_SFBookmarkTextEntryTableViewController navigationController](self, "navigationController", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v5 = v3;
    v4 = (id)objc_msgSend(v3, "popViewControllerAnimated:", 1);
    v3 = v5;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textEntryCell, 0);
  objc_storeStrong((id *)&self->_initialText, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
}

@end
