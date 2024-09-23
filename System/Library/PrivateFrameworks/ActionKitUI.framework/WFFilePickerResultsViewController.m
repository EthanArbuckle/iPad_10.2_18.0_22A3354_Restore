@implementation WFFilePickerResultsViewController

- (WFFilePickerResultsViewController)initWithFileListDelegate:(id)a3
{
  id v4;
  WFFilePickerResultsViewController *v5;
  WFFilePickerResultsViewController *v6;
  void *v7;
  WFFilePickerResultsViewController *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WFFilePickerResultsViewController;
  v5 = -[WFFilePickerResultsViewController initWithNibName:bundle:](&v10, sel_initWithNibName_bundle_, 0, 0);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObserver:selector:name:object:", v6, sel_updateContentInset, *MEMORY[0x24BEC2F58], 0);

    v8 = v6;
  }

  return v6;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BEC2F58], 0);

  v4.receiver = self;
  v4.super_class = (Class)WFFilePickerResultsViewController;
  -[WFFilePickerResultsViewController dealloc](&v4, sel_dealloc);
}

- (void)loadView
{
  void *v3;
  void *v4;
  WFRemoteFileListView *v5;
  WFRemoteFileListView *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)WFFilePickerResultsViewController;
  -[WFFilePickerResultsViewController loadView](&v8, sel_loadView);
  -[WFFilePickerResultsViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFFilePickerResultsViewController files](self, "files");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = [WFRemoteFileListView alloc];
  objc_msgSend(v3, "bounds");
  v6 = -[WFRemoteFileListView initWithFrame:collation:](v5, "initWithFrame:collation:", 0);
  -[WFRemoteFileListView setAutoresizingMask:](v6, "setAutoresizingMask:", 18);
  -[WFFilePickerResultsViewController delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFRemoteFileListView setDelegate:](v6, "setDelegate:", v7);

  -[WFRemoteFileListView setFiles:](v6, "setFiles:", v4);
  objc_msgSend(v3, "addSubview:", v6);
  objc_storeWeak((id *)&self->_fileListView, v6);

}

- (void)updateContentInset
{
  void *v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  double MaxY;
  void *v14;
  id v15;
  CGRect v16;
  CGRect v17;
  CGRect v18;

  -[WFFilePickerResultsViewController view](self, "view");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEC2EF8], "sharedKeyboard");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "keyboardFrameInView:", v15);
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v12 = 0.0;
  if (objc_msgSend(v3, "isVisible"))
  {
    v16.origin.x = v5;
    v16.origin.y = v7;
    v16.size.width = v9;
    v16.size.height = v11;
    if (!CGRectIsNull(v16))
    {
      objc_msgSend(v15, "bounds");
      MaxY = CGRectGetMaxY(v17);
      v18.origin.x = v5;
      v18.origin.y = v7;
      v18.size.width = v9;
      v18.size.height = v11;
      v12 = MaxY - CGRectGetMinY(v18);
    }
  }
  -[WFFilePickerResultsViewController fileListView](self, "fileListView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setContentInset:", 64.0, 0.0, v12, 0.0);
  objc_msgSend(v14, "setVerticalScrollIndicatorInsets:", 64.0, 0.0, v12, 0.0);

}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)WFFilePickerResultsViewController;
  -[WFFilePickerResultsViewController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[WFFilePickerResultsViewController updateContentInset](self, "updateContentInset");
}

- (void)viewWillLayoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WFFilePickerResultsViewController;
  -[WFFilePickerResultsViewController viewWillLayoutSubviews](&v3, sel_viewWillLayoutSubviews);
  -[WFFilePickerResultsViewController updateContentInset](self, "updateContentInset");
}

- (void)setFiles:(id)a3
{
  id v5;
  void *v6;

  objc_storeStrong((id *)&self->_files, a3);
  v5 = a3;
  -[WFFilePickerResultsViewController fileListView](self, "fileListView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setFiles:", v5);

  -[WFFilePickerResultsViewController updateContentInset](self, "updateContentInset");
}

- (NSArray)files
{
  return self->_files;
}

- (WFRemoteFileListViewDelegate)delegate
{
  return (WFRemoteFileListViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (WFRemoteFileListView)fileListView
{
  return (WFRemoteFileListView *)objc_loadWeakRetained((id *)&self->_fileListView);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_fileListView);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_files, 0);
}

@end
