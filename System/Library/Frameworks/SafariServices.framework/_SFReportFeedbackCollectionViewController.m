@implementation _SFReportFeedbackCollectionViewController

- (_SFReportFeedbackCollectionViewController)initWithBrowserContentController:(id)a3
{
  id v4;
  void *v5;
  _SFReportFeedbackCollectionViewController *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _SFReportFeedbackCollectionViewController *v15;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t);
  void *v20;
  id v21;
  id location;
  objc_super v23;

  v4 = a3;
  -[_SFReportFeedbackCollectionViewController _createCollectionViewLayout](self, "_createCollectionViewLayout");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v23.receiver = self;
  v23.super_class = (Class)_SFReportFeedbackCollectionViewController;
  v6 = -[_SFReportFeedbackCollectionViewController initWithCollectionViewLayout:](&v23, sel_initWithCollectionViewLayout_, v5);

  if (v6)
  {
    objc_initWeak(&location, v6);
    v7 = objc_alloc(MEMORY[0x1E0DC34F0]);
    v8 = (void *)MEMORY[0x1E0DC3428];
    v17 = MEMORY[0x1E0C809B0];
    v18 = 3221225472;
    v19 = __78___SFReportFeedbackCollectionViewController_initWithBrowserContentController___block_invoke;
    v20 = &unk_1E4ABFFC0;
    objc_copyWeak(&v21, &location);
    objc_msgSend(v8, "actionWithTitle:image:identifier:handler:", &stru_1E4AC8470, 0, 0, &v17);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v7, "initWithBarButtonSystemItem:primaryAction:", 24, v9, v17, v18, v19, v20);
    -[_SFReportFeedbackCollectionViewController navigationItem](v6, "navigationItem");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setRightBarButtonItem:", v10);

    objc_storeWeak((id *)&v6->_browserContentController, v4);
    -[_SFReportFeedbackCollectionViewController view](v6, "view");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setAccessibilityIdentifier:", CFSTR("ReportIssueView"));

    -[_SFReportFeedbackCollectionViewController collectionView](v6, "collectionView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setDelegate:", v6);

    -[_SFReportFeedbackCollectionViewController collectionView](v6, "collectionView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setDataSource:", v6);

    v15 = v6;
    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }

  return v6;
}

- (id)_createCollectionViewLayout
{
  void *v2;
  id v3;
  id v4;
  void *v5;
  _QWORD v7[4];
  id v8;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC35A8]), "initWithAppearance:", 2);
  objc_msgSend(v2, "setFooterMode:", 0);
  objc_msgSend(v2, "setHeaderMode:", 0);
  v3 = objc_alloc(MEMORY[0x1E0DC35D0]);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __72___SFReportFeedbackCollectionViewController__createCollectionViewLayout__block_invoke;
  v7[3] = &unk_1E4AC0DC0;
  v8 = v2;
  v4 = v2;
  v5 = (void *)objc_msgSend(v3, "initWithSectionProvider:", v7);

  return v5;
}

- (void)viewDidLoad
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)_SFReportFeedbackCollectionViewController;
  -[_SFReportFeedbackCollectionViewController viewDidLoad](&v17, sel_viewDidLoad);
  -[_SFReportFeedbackCollectionViewController collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_class();
  +[_SFCheckableItemCollectionViewListCell reuseIdentifier](_SFCheckableItemCollectionViewListCell, "reuseIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerClass:forCellWithReuseIdentifier:", v4, v5);

  -[_SFReportFeedbackCollectionViewController collectionView](self, "collectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_class();
  v8 = *MEMORY[0x1E0DC48A0];
  +[_SFReportIssueFooter reuseIdentifier](_SFReportIssueFooter, "reuseIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "registerClass:forSupplementaryViewOfKind:withReuseIdentifier:", v7, v8, v9);

  -[_SFReportFeedbackCollectionViewController collectionView](self, "collectionView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_opt_class();
  v12 = *MEMORY[0x1E0DC48A8];
  +[_SFReportFeedbackIssueHeader reuseIdentifier](_SFReportFeedbackIssueHeader, "reuseIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "registerClass:forSupplementaryViewOfKind:withReuseIdentifier:", v11, v12, v13);

  -[_SFReportFeedbackCollectionViewController collectionView](self, "collectionView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_opt_class();
  +[_SFButtonCollectionViewListCell reuseIdentifier](_SFButtonCollectionViewListCell, "reuseIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "registerClass:forCellWithReuseIdentifier:", v15, v16);

}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  if (a4)
    return 1;
  else
    return -[_SFReportFeedbackCollectionViewController _numberOfIssueCategories](self, "_numberOfIssueCategories", a3);
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  return 2;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  NSIndexPath *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _BOOL8 v13;

  v6 = (NSIndexPath *)a4;
  v7 = a3;
  if (-[NSIndexPath section](v6, "section"))
  {
    +[_SFButtonCollectionViewListCell reuseIdentifier](_SFButtonCollectionViewListCell, "reuseIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", v8, v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "setDelegate:", self);
    _WBSLocalizedString();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setTitle:", v10);

    objc_msgSend(v9, "setEnabled:", self->_isIssueChecked);
  }
  else
  {
    +[_SFCheckableItemCollectionViewListCell reuseIdentifier](_SFCheckableItemCollectionViewListCell, "reuseIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", v11, v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[_SFReportFeedbackCollectionViewController _issueStringForRowAtIndexPath:](self, "_issueStringForRowAtIndexPath:", v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setText:", v12);

    v13 = self->_checkedIssueIndexPath == v6;
    objc_msgSend(v9, "setChecked:", v13);
  }
  return v9;
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v8 = *MEMORY[0x1E0DC48A8];
  v9 = a5;
  v10 = a4;
  v11 = a3;
  if (objc_msgSend(v10, "isEqualToString:", v8))
  {
    +[_SFReportFeedbackIssueHeader reuseIdentifier](_SFReportFeedbackIssueHeader, "reuseIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "dequeueReusableSupplementaryViewOfKind:withReuseIdentifier:forIndexPath:", v10, v12, v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    -[_SFReportFeedbackCollectionViewController _headerText](self, "_headerText");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setText:", v14);

  }
  else
  {
    +[_SFReportIssueFooter reuseIdentifier](_SFReportIssueFooter, "reuseIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "dequeueReusableSupplementaryViewOfKind:withReuseIdentifier:forIndexPath:", v10, v15, v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    -[_SFReportFeedbackCollectionViewController _footerText](self, "_footerText");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setFooterText:", v16);

    objc_msgSend(v13, "setDelegate:", self);
  }
  return v13;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  NSIndexPath *v6;
  void *v7;
  int isIssueChecked;
  NSIndexPath *checkedIssueIndexPath;
  BOOL v10;
  NSIndexPath *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  v6 = (NSIndexPath *)a4;
  if (-[NSIndexPath section](v6, "section") != 1)
  {
    objc_msgSend(v15, "cellForItemAtIndexPath:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setChecked:", objc_msgSend(v7, "isChecked") ^ 1);
    isIssueChecked = objc_msgSend(v7, "isChecked");
    self->_isIssueChecked = isIssueChecked;
    checkedIssueIndexPath = self->_checkedIssueIndexPath;
    if (checkedIssueIndexPath)
      v10 = checkedIssueIndexPath == v6;
    else
      v10 = 1;
    if (!v10)
    {
      -[_SFReportFeedbackCollectionViewController collectionView:didDeselectItemAtIndexPath:](self, "collectionView:didDeselectItemAtIndexPath:", v15);
      isIssueChecked = self->_isIssueChecked;
    }
    if (isIssueChecked)
      v11 = v6;
    else
      v11 = 0;
    objc_storeStrong((id *)&self->_checkedIssueIndexPath, v11);
    -[_SFReportFeedbackCollectionViewController collectionView](self, "collectionView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", 0, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "cellForItemAtIndexPath:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "setEnabled:", self->_isIssueChecked);
  }

}

- (void)collectionView:(id)a3 didDeselectItemAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  NSIndexPath *checkedIssueIndexPath;
  id v9;

  v9 = a3;
  v6 = a4;
  if (objc_msgSend(v6, "section") != 1)
  {
    objc_msgSend(v9, "cellForItemAtIndexPath:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    checkedIssueIndexPath = self->_checkedIssueIndexPath;
    self->_checkedIssueIndexPath = 0;

    objc_msgSend(v7, "setChecked:", 0);
  }

}

- (void)collectionViewListCellButtonPressed:(id)a3
{
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", 0, 1);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[_SFReportFeedbackCollectionViewController collectionView](self, "collectionView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "deselectItemAtIndexPath:animated:", v5, 1);

  -[_SFReportFeedbackCollectionViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
  -[_SFReportFeedbackCollectionViewController _reportFeedbackForSelectedRowIndex:](self, "_reportFeedbackForSelectedRowIndex:", -[NSIndexPath row](self->_checkedIssueIndexPath, "row"));

}

- (void)presentLearnMoreViewController:(id)a3
{
  id v4;
  id WeakRetained;

  v4 = a3;
  -[_SFReportFeedbackCollectionViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
  WeakRetained = objc_loadWeakRetained((id *)&self->_browserContentController);
  objc_msgSend(WeakRetained, "presentModalViewController:completion:", v4, 0);

}

- (id)_issueStringForRowAtIndexPath:(id)a3
{
  return &stru_1E4AC8470;
}

- (int64_t)_numberOfIssueCategories
{
  return 0;
}

- (id)_headerText
{
  return &stru_1E4AC8470;
}

- (id)_footerText
{
  return &stru_1E4AC8470;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_checkedIssueIndexPath, 0);
  objc_destroyWeak((id *)&self->_browserContentController);
}

@end
