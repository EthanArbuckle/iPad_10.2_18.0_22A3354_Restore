@implementation PopoverCatalogViewController

- (id)universalSearchFirstTimeExperienceViewController
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_primaryCatalogViewController);
  objc_msgSend(WeakRetained, "universalSearchFirstTimeExperienceViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)startPageViewController
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_primaryCatalogViewController);
  objc_msgSend(WeakRetained, "startPageViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (double)requiredContentWidth
{
  id WeakRetained;
  double v3;
  double v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_primaryCatalogViewController);
  objc_msgSend(WeakRetained, "requiredContentWidth");
  v4 = v3;

  return v4;
}

- (double)maxContentHeight
{
  id WeakRetained;
  double v3;
  double v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_primaryCatalogViewController);
  objc_msgSend(WeakRetained, "maxContentHeight");
  v4 = v3;

  return v4;
}

- (id)completionsViewControllerIfLoaded
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_primaryCatalogViewController);
  objc_msgSend(WeakRetained, "completionsViewControllerIfLoaded");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setPrimaryCatalogViewController:(id)a3
{
  objc_storeWeak((id *)&self->_primaryCatalogViewController, a3);
}

- (PopoverCatalogViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  PopoverCatalogViewController *v4;
  PopoverCatalogViewController *v5;
  void *v6;
  PopoverCatalogViewController *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PopoverCatalogViewController;
  v4 = -[PopoverCatalogViewController initWithNibName:bundle:](&v9, sel_initWithNibName_bundle_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[PopoverCatalogViewController traitOverrides](v4, "traitOverrides");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setNSIntegerValue:forTrait:", 1, objc_opt_class());

    v7 = v5;
  }

  return v5;
}

- (void)viewWillLayoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  _BOOL4 v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)PopoverCatalogViewController;
  -[AbstractCatalogViewController viewWillLayoutSubviews](&v20, sel_viewWillLayoutSubviews);
  -[PopoverCatalogViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[PopoverCatalogViewController completionsViewControllerIfLoaded](self, "completionsViewControllerIfLoaded");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[AbstractCatalogViewController isResponsibleForLayoutOfViewController:](self, "isResponsibleForLayoutOfViewController:", v12))
  {
    objc_msgSend(v12, "tableView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setFrame:", v5, v7, v9, v11);
    objc_msgSend(v12, "updateContentInsets");
    objc_msgSend(v13, "setScrollIndicatorInsets:", *MEMORY[0x1E0DC49E8], *(double *)(MEMORY[0x1E0DC49E8] + 8), *(double *)(MEMORY[0x1E0DC49E8] + 16), *(double *)(MEMORY[0x1E0DC49E8] + 24));

  }
  -[PopoverCatalogViewController startPageViewController](self, "startPageViewController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[AbstractCatalogViewController isResponsibleForLayoutOfViewController:](self, "isResponsibleForLayoutOfViewController:", v14);

  if (v15)
  {
    -[PopoverCatalogViewController startPageViewController](self, "startPageViewController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "view");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v17, "setFrame:", v5, v7, v9, v11);
    UIEdgeInsetsMakeWithEdges();
    objc_msgSend(v17, "setLayoutMargins:");

  }
  -[PopoverCatalogViewController universalSearchFirstTimeExperienceViewController](self, "universalSearchFirstTimeExperienceViewController");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[AbstractCatalogViewController isResponsibleForLayoutOfViewController:](self, "isResponsibleForLayoutOfViewController:", v18))
  {
    objc_msgSend(v18, "view");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setFrame:", v5, v7, v9, v11);

  }
}

- (void)updateStartPagePreferredContentSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  id v7;

  -[PopoverCatalogViewController requiredContentWidth](self, "requiredContentWidth");
  v4 = v3;
  -[PopoverCatalogViewController _preferredHeightForStartPage](self, "_preferredHeightForStartPage");
  v6 = v5;
  -[PopoverCatalogViewController startPageViewController](self, "startPageViewController");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPreferredContentSize:", v4, v6);

}

- (void)resetStartPagePreferredHeight
{
  self->_startPagePreferredHeight = 0.0;
}

- (double)_preferredHeightForStartPage
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  double v7;
  double startPagePreferredHeight;

  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");

  -[PopoverCatalogViewController primaryCatalogViewController](self, "primaryCatalogViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "catalogViewControllerPresentingInPortraitAspectRatio:", v4);

  if (v6)
  {
    objc_msgSend(v4, "navigationBarHeight");
    _SFRoundFloatToPixels();
    startPagePreferredHeight = v7;
  }
  else
  {
    startPagePreferredHeight = self->_startPagePreferredHeight;
  }

  return startPagePreferredHeight;
}

- (id)completionsViewController
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_primaryCatalogViewController);
  objc_msgSend(WeakRetained, "completionsViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)didGainOwnershipOfCompletionsViewController
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[PopoverCatalogViewController completionsViewController](self, "completionsViewController");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setShowsWebSearchTipIfExists:", 1);
  objc_msgSend(v7, "tableView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0DC3F08];
  objc_msgSend(MEMORY[0x1E0DC3510], "_sf_defaultPopoverBackgroundEffect");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_effectForBlurEffect:vibrancyStyle:", v4, 120);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setSeparatorEffect:", v5);

  objc_msgSend(v2, "indexPathsForVisibleRows");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "reloadRowsAtIndexPaths:withRowAnimation:", v6, 5);

}

- (void)didGainOwnershipOfStartPageViewController
{
  id WeakRetained;
  void *v4;
  id v5;

  -[PopoverCatalogViewController startPageViewController](self, "startPageViewController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAdditionalSafeAreaInsets:", *MEMORY[0x1E0DC49E8], *(double *)(MEMORY[0x1E0DC49E8] + 8), *(double *)(MEMORY[0x1E0DC49E8] + 16), *(double *)(MEMORY[0x1E0DC49E8] + 24));
  objc_msgSend(v5, "setBackgroundDisplayMode:", 1);
  WeakRetained = objc_loadWeakRetained((id *)&self->_primaryCatalogViewController);
  objc_msgSend(WeakRetained, "startPageController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setShowingAsPopover:", 1);

}

- (void)didGainOwnershipOfUniversalSearchFirstTimeExperienceViewController
{
  void *v2;
  void *v3;
  id v4;

  -[PopoverCatalogViewController universalSearchFirstTimeExperienceViewController](self, "universalSearchFirstTimeExperienceViewController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", v2);

}

- (CatalogViewController)primaryCatalogViewController
{
  return (CatalogViewController *)objc_loadWeakRetained((id *)&self->_primaryCatalogViewController);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_primaryCatalogViewController);
}

@end
