@implementation HKCDADocumentDetailViewController

- (HKCDADocumentDetailViewController)initWithReportData:(id)a3
{
  id v4;
  HKCDADocumentDetailViewController *v5;
  HKCDADocumentDetailViewController *v6;
  UIStackView *stackView;
  _HKReportSegmentControl *reportSegmentControl;
  HKCDADocumentReportViewController *v9;
  HKCDADocumentReportViewController *formattedReportController;
  HKLargePlainTextViewController *v11;
  HKLargePlainTextViewController *plainTextReportController;
  UIBarButtonItem *searchButton;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)HKCDADocumentDetailViewController;
  v5 = -[HKCDADocumentDetailViewController init](&v15, sel_init);
  v6 = v5;
  if (v5)
  {
    stackView = v5->_stackView;
    v5->_stackView = 0;

    reportSegmentControl = v6->_reportSegmentControl;
    v6->_reportSegmentControl = 0;

    v9 = -[HKCDADocumentReportViewController initWithDocumentData:]([HKCDADocumentReportViewController alloc], "initWithDocumentData:", v4);
    formattedReportController = v6->_formattedReportController;
    v6->_formattedReportController = v9;

    v11 = -[HKLargePlainTextViewController initWithData:]([HKLargePlainTextViewController alloc], "initWithData:", v4);
    plainTextReportController = v6->_plainTextReportController;
    v6->_plainTextReportController = v11;

    searchButton = v6->_searchButton;
    v6->_searchButton = 0;

    -[HKCDADocumentDetailViewController addChildViewController:](v6, "addChildViewController:", v6->_formattedReportController);
    -[HKCDADocumentDetailViewController addChildViewController:](v6, "addChildViewController:", v6->_plainTextReportController);
  }

  return v6;
}

- (void)viewDidLoad
{
  id v3;
  UIStackView *v4;
  UIStackView *stackView;
  void *v6;
  void *v7;
  void *v8;
  HKBarButtonItemControl *v9;
  HKBarButtonItemControl *searchInSegmentControl;
  void *v11;
  _HKReportSegmentControl *v12;
  _HKReportSegmentControl *reportSegmentControl;
  void *v14;
  UIStackView *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  int v20;
  HKVerticalMarginView *v21;
  void *v22;
  UIBarButtonItem *v23;
  UIBarButtonItem *searchButton;
  void *v25;
  void *v26;
  void *v27;
  objc_super v28;

  v28.receiver = self;
  v28.super_class = (Class)HKCDADocumentDetailViewController;
  -[HKCDADocumentDetailViewController viewDidLoad](&v28, sel_viewDidLoad);
  v3 = objc_alloc(MEMORY[0x1E0DC3CA8]);
  v4 = (UIStackView *)objc_msgSend(v3, "initWithArrangedSubviews:", MEMORY[0x1E0C9AA60]);
  stackView = self->_stackView;
  self->_stackView = v4;

  -[UIStackView setAxis:](self->_stackView, "setAxis:", 1);
  objc_msgSend(MEMORY[0x1E0DC3658], "secondarySystemBackgroundColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKCDADocumentDetailViewController navigationController](self, "navigationController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "navigationBar");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setBackgroundColor:", v6);

  v9 = -[HKBarButtonItemControl initWithSystemItem:preferredHeight:collapseHeight:]([HKBarButtonItemControl alloc], "initWithSystemItem:preferredHeight:collapseHeight:", 12, 1, 0.0);
  searchInSegmentControl = self->_searchInSegmentControl;
  self->_searchInSegmentControl = v9;

  -[HKBarButtonItemControl setHorizontalMargin:](self->_searchInSegmentControl, "setHorizontalMargin:", 5.0);
  -[HKBarButtonItemControl setBackgroundColor:](self->_searchInSegmentControl, "setBackgroundColor:", v6);
  -[HKBarButtonItemControl addTarget:action:forControlEvents:](self->_searchInSegmentControl, "addTarget:action:forControlEvents:", self, sel_searchButtonAction_, 64);
  -[HKBarButtonItemControl setHidden:](self->_searchInSegmentControl, "setHidden:", 1);
  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[_HKReportSegmentControl initWithBackgroundColor:dividerColor:rightControl:]([_HKReportSegmentControl alloc], "initWithBackgroundColor:dividerColor:rightControl:", v6, v11, self->_searchInSegmentControl);
  reportSegmentControl = self->_reportSegmentControl;
  self->_reportSegmentControl = v12;

  -[_HKReportSegmentControl segmentControl](self->_reportSegmentControl, "segmentControl");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addTarget:action:forControlEvents:", self, sel_changeReportDisplayed_, 4096);

  -[UIStackView addArrangedSubview:](self->_stackView, "addArrangedSubview:", self->_reportSegmentControl);
  v15 = self->_stackView;
  -[HKCDADocumentReportViewController view](self->_formattedReportController, "view");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIStackView addArrangedSubview:](v15, "addArrangedSubview:", v16);

  objc_msgSend(MEMORY[0x1E0CB6F18], "sharedBehavior");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v17, "isiPad"))
  {

    v18 = 7;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB6F18], "sharedBehavior");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "isRealityDevice");

    if (v20)
      v18 = 7;
    else
      v18 = 15;
  }
  v21 = -[HKVerticalMarginView initWithSubview:offsetOptions:]([HKVerticalMarginView alloc], "initWithSubview:offsetOptions:", self->_stackView, v18);
  -[HKCDADocumentDetailViewController setView:](self, "setView:", v21);
  -[HKCDADocumentDetailViewController navigationItem](self, "navigationItem");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (UIBarButtonItem *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 12, self, sel_searchButtonAction_);
  searchButton = self->_searchButton;
  self->_searchButton = v23;

  objc_msgSend(v22, "setRightBarButtonItem:", self->_searchButton);
  -[HKCDADocumentDetailViewController tabBarController](self, "tabBarController");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "tabBar");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setHidden:", 1);

  -[HKCDADocumentDetailViewController view](self, "view");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setNeedsLayout");

  -[_HKReportSegmentControl setNeedsLayout](self->_reportSegmentControl, "setNeedsLayout");
}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HKCDADocumentDetailViewController;
  -[HKCDADocumentDetailViewController viewWillDisappear:](&v7, sel_viewWillDisappear_, a3);
  -[HKCDADocumentDetailViewController tabBarController](self, "tabBarController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "tabBar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHidden:", 0);

  -[HKCDADocumentDetailViewController navigationController](self, "navigationController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setNavigationBarHidden:animated:", 0, 1);

}

- (unint64_t)supportedInterfaceOrientations
{
  return 2;
}

- (void)_replaceLastArrangedViewWith:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[UIStackView arrangedSubviews](self->_stackView, "arrangedSubviews");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count") == 2)
  {
    objc_msgSend(v4, "lastObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeFromSuperview");
    -[UIStackView addArrangedSubview:](self->_stackView, "addArrangedSubview:", v6);

  }
}

- (void)changeReportDisplayed:(id)a3
{
  void *v4;
  uint64_t v5;
  int *v6;
  void *v7;
  id v8;

  -[_HKReportSegmentControl segmentControl](self->_reportSegmentControl, "segmentControl", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "selectedSegmentIndex");

  if (!v5)
  {
    v6 = &OBJC_IVAR___HKCDADocumentDetailViewController__formattedReportController;
    goto LABEL_5;
  }
  if (v5 == 1)
  {
    v6 = &OBJC_IVAR___HKCDADocumentDetailViewController__plainTextReportController;
LABEL_5:
    objc_msgSend(*(id *)((char *)&self->super.super.super.isa + *v6), "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKCDADocumentDetailViewController _replaceLastArrangedViewWith:](self, "_replaceLastArrangedViewWith:", v7);

  }
  -[HKCDADocumentDetailViewController view](self, "view");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setNeedsLayout");

}

- (void)searchButtonAction:(id)a3
{
  void *v4;
  uint64_t v5;
  int *v6;
  id v7;

  -[_HKReportSegmentControl segmentControl](self->_reportSegmentControl, "segmentControl", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "selectedSegmentIndex");

  if (v5 == 1)
  {
    v6 = &OBJC_IVAR___HKCDADocumentDetailViewController__plainTextReportController;
    goto LABEL_5;
  }
  if (!v5)
  {
    v6 = &OBJC_IVAR___HKCDADocumentDetailViewController__formattedReportController;
LABEL_5:
    objc_msgSend(*(id *)((char *)&self->super.super.super.isa + *v6), "startIncrementalSearch");
  }
  -[HKCDADocumentDetailViewController view](self, "view");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setNeedsLayout");

}

- (void)traitCollectionDidChange:(id)a3
{
  void *v4;
  uint64_t v5;
  HKBarButtonItemControl *searchInSegmentControl;
  void *v7;
  uint64_t v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)HKCDADocumentDetailViewController;
  -[HKCDADocumentDetailViewController traitCollectionDidChange:](&v10, sel_traitCollectionDidChange_, a3);
  -[HKCDADocumentDetailViewController traitCollection](self, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "verticalSizeClass");
  searchInSegmentControl = self->_searchInSegmentControl;
  if (v5 == 1)
  {
    -[HKBarButtonItemControl setHidden:](searchInSegmentControl, "setHidden:", 0);
    -[HKCDADocumentDetailViewController navigationController](self, "navigationController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setNavigationBarHidden:animated:", 1, 1);
    v8 = 0;
  }
  else
  {
    -[HKBarButtonItemControl setHidden:](searchInSegmentControl, "setHidden:", 1);
    -[HKCDADocumentDetailViewController navigationController](self, "navigationController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setNavigationBarHidden:animated:", 0, 1);
    v8 = 15;
  }

  -[HKCDADocumentDetailViewController setEdgesForExtendedLayout:](self, "setEdgesForExtendedLayout:", v8);
  -[HKCDADocumentDetailViewController view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setNeedsLayout");

}

- (void)viewControllerWillEnterAdaptiveModal
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  void *v11;
  id v12;
  id location;

  objc_initWeak(&location, self);
  v3 = objc_alloc(MEMORY[0x1E0DC34F0]);
  v4 = (void *)MEMORY[0x1E0DC3428];
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __73__HKCDADocumentDetailViewController_viewControllerWillEnterAdaptiveModal__block_invoke;
  v11 = &unk_1E9C40D30;
  objc_copyWeak(&v12, &location);
  objc_msgSend(v4, "actionWithHandler:", &v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithBarButtonSystemItem:primaryAction:", 0, v5, v8, v9, v10, v11);

  -[HKCDADocumentDetailViewController navigationItem](self, "navigationItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setLeftBarButtonItem:", v6);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __73__HKCDADocumentDetailViewController_viewControllerWillEnterAdaptiveModal__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (void)viewControllerDidLeaveAdaptiveModal
{
  id v2;

  -[HKCDADocumentDetailViewController navigationItem](self, "navigationItem");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setLeftBarButtonItem:", 0);

}

- (UIStackView)stackView
{
  return self->_stackView;
}

- (_HKReportSegmentControl)reportSegmentControl
{
  return self->_reportSegmentControl;
}

- (HKCDADocumentReportViewController)formattedReportController
{
  return self->_formattedReportController;
}

- (HKLargePlainTextViewController)plainTextReportController
{
  return self->_plainTextReportController;
}

- (UIBarButtonItem)searchButton
{
  return self->_searchButton;
}

- (HKBarButtonItemControl)searchInSegmentControl
{
  return self->_searchInSegmentControl;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchInSegmentControl, 0);
  objc_storeStrong((id *)&self->_searchButton, 0);
  objc_storeStrong((id *)&self->_plainTextReportController, 0);
  objc_storeStrong((id *)&self->_formattedReportController, 0);
  objc_storeStrong((id *)&self->_reportSegmentControl, 0);
  objc_storeStrong((id *)&self->_stackView, 0);
}

@end
