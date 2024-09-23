@implementation SFPopoverSizingTableViewController

+ (void)initialize
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  if ((id)objc_opt_class() == a1)
  {
    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = (void *)estimatedRowHeightCache;
    estimatedRowHeightCache = v2;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    v4 = *MEMORY[0x1E0DC48E8];
    objc_msgSend(MEMORY[0x1E0CB3828], "mainQueue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObserverForName:object:queue:usingBlock:", v4, 0, v5, &__block_literal_global_42);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)estimatedRowHeightCacheInvalidationToken;
    estimatedRowHeightCacheInvalidationToken = v6;

  }
}

uint64_t __48__SFPopoverSizingTableViewController_initialize__block_invoke()
{
  return objc_msgSend((id)estimatedRowHeightCache, "removeAllObjects");
}

+ (double)bottomContentPadding
{
  return 12.0;
}

+ (UITableViewCell)tableViewCellForSizeEstimation
{
  void *v2;
  void *v3;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D50]), "initWithStyle:reuseIdentifier:", 0, 0);
  objc_msgSend(v2, "textLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setText:", CFSTR("A"));

  return (UITableViewCell *)v2;
}

- (int64_t)minimumNumberOfRows
{
  return 5;
}

- (int64_t)maximumNumberOfRows
{
  return 12;
}

+ (double)caculateHeightForTableView:(id)a3 targetGlobalRow:(int64_t)a4 outGlobalRow:(int64_t *)a5
{
  id v7;
  uint64_t v8;
  double MaxY;
  uint64_t v10;
  int64_t v11;
  BOOL v12;
  int64_t v13;
  void *v14;
  int64_t v15;
  uint64_t v16;
  int64_t v17;
  uint64_t v18;
  CGFloat Height;
  double v20;
  double v21;
  double v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  double v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  CGRect v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;

  v7 = a3;
  v8 = objc_msgSend(v7, "numberOfSections");
  if (objc_msgSend(v7, "style"))
  {
    MaxY = 0.0;
    if (v8 >= 1)
    {
      v10 = 0;
      v11 = 0;
      do
      {
        v11 += objc_msgSend(v7, "numberOfRowsInSection:", v10++);
        v12 = v11 <= a4 && v10 < v8;
      }
      while (v12);
      if (v11)
      {
        if (v11 - 1 >= a4)
          v13 = a4;
        else
          v13 = v11 - 1;
        if (a5)
          *a5 = v13;
        if (v11 - 1 <= a4)
        {
          if (v8 == v10)
          {
            objc_msgSend(v7, "_contentSize", v13);
            MaxY = v27;
          }
          else
          {
            objc_msgSend(v7, "rectForFooterInSection:", v10 - 1);
            MaxY = CGRectGetMaxY(v38) + 20.0;
          }
        }
        else
        {
          objc_msgSend(v7, "indexPathForRowAtGlobalRow:", v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "rectForRowAtIndexPath:", v14);
          MaxY = CGRectGetMaxY(v33);

        }
      }
    }
  }
  else if (a4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (a5)
    {
      if (objc_msgSend(v7, "numberOfSections") < 1)
      {
        v15 = 0;
      }
      else
      {
        v15 = 0;
        v16 = 0;
        do
          v15 += objc_msgSend(v7, "numberOfRowsInSection:", v16++);
        while (v16 < objc_msgSend(v7, "numberOfSections"));
      }
      *a5 = v15;
    }
    objc_msgSend(v7, "contentSize");
    v30 = v29;
    objc_msgSend((id)objc_opt_class(), "bottomContentPadding");
    MaxY = v30 + v31;
  }
  else if (objc_msgSend(v7, "numberOfSections") < 1)
  {
    v17 = 0;
    MaxY = 0.0;
LABEL_40:
    if (a5)
      *a5 = v17;
  }
  else
  {
    v17 = 0;
    v18 = 0;
    MaxY = 0.0;
    while (1)
    {
      objc_msgSend(v7, "rectForHeaderInSection:", v18);
      Height = CGRectGetHeight(v34);
      v20 = Height + 22.0;
      v12 = Height <= 0.0;
      v21 = -0.0;
      if (!v12)
        v21 = v20;
      v22 = MaxY + v21;
      objc_msgSend(v7, "rectForFooterInSection:", v18);
      MaxY = CGRectGetHeight(v35) + v22;
      v23 = objc_msgSend(v7, "numberOfRowsInSection:", v18);
      if (v23 >= 1)
        break;
LABEL_30:
      if (++v18 >= objc_msgSend(v7, "numberOfSections"))
        goto LABEL_40;
    }
    v24 = v23;
    v25 = 0;
    while (1)
    {
      objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", v25, v18);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "rectForRowAtIndexPath:", v26);
      MaxY = MaxY + CGRectGetHeight(v36);
      if (a4 - 1 == v17)
        break;

      ++v25;
      ++v17;
      if (v24 == v25)
        goto LABEL_30;
    }
    if (v25 + 1 < v24)
    {
      objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "rectForRowAtIndexPath:", v28);
      MaxY = MaxY + CGRectGetHeight(v37) * 0.5;

    }
    if (a5)
      *a5 = a4;

  }
  return MaxY;
}

- (CGSize)preferredContentSize
{
  int64_t v3;
  int64_t v4;
  void *v5;
  double v6;
  double v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  uint64_t v18;
  CGSize result;

  v3 = -[SFPopoverSizingTableViewController maximumNumberOfRows](self, "maximumNumberOfRows");
  v4 = v3;
  if (v3 >= -[SFPopoverSizingTableViewController minimumNumberOfRows](self, "minimumNumberOfRows"))
    v4 = -[SFPopoverSizingTableViewController minimumNumberOfRows](self, "minimumNumberOfRows");
  -[SFPopoverSizingTableViewController tableView](self, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -1;
  +[SFPopoverSizingTableViewController caculateHeightForTableView:targetGlobalRow:outGlobalRow:](SFPopoverSizingTableViewController, "caculateHeightForTableView:targetGlobalRow:outGlobalRow:", v5, v3, &v18);
  v7 = v6;
  v8 = v4 - v18;
  if (v4 > v18)
  {
    v9 = (void *)objc_opt_class();
    objc_msgSend((id)estimatedRowHeightCache, "objectForKey:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
      objc_msgSend(v9, "tableViewCellForSizeEstimation");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v11, "systemLayoutSizeFittingSize:", *MEMORY[0x1E0DC4FF8], *(double *)(MEMORY[0x1E0DC4FF8] + 8));
      objc_msgSend(v12, "numberWithDouble:", v13);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)estimatedRowHeightCache, "setObject:forKey:", v10, v9);

    }
    objc_msgSend(v10, "doubleValue");
    v15 = v14;

    v7 = v7 + v15 * (double)v8;
  }
  if (!objc_msgSend(v5, "style"))
    v7 = v7 - _SFOnePixel();

  v16 = 0.0;
  v17 = v7;
  result.height = v17;
  result.width = v16;
  return result;
}

- (void)updatePreferredContentSize
{
  -[SFPopoverSizingTableViewController preferredContentSize](self, "preferredContentSize");
  -[SFPopoverSizingTableViewController setPreferredContentSize:](self, "setPreferredContentSize:");
}

- (void)viewDidLoad
{
  void *v3;
  id v4;
  objc_super v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v5.receiver = self;
  v5.super_class = (Class)SFPopoverSizingTableViewController;
  -[SFPopoverSizingTableViewController viewDidLoad](&v5, sel_viewDidLoad);
  v6[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)-[SFPopoverSizingTableViewController registerForTraitChanges:withTarget:action:](self, "registerForTraitChanges:withTarget:action:", v3, self, sel_setNeedsUpdatePreferredContentSize);

}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SFPopoverSizingTableViewController;
  -[SFPopoverSizingTableViewController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[SFPopoverSizingTableViewController _updateTranslucentAppearanceIfNeeded](self, "_updateTranslucentAppearanceIfNeeded");
  -[SFPopoverSizingTableViewController updatePreferredContentSize](self, "updatePreferredContentSize");
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SFPopoverSizingTableViewController;
  -[SFPopoverSizingTableViewController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  -[SFPopoverSizingTableViewController _updateTranslucentAppearanceIfNeeded](self, "_updateTranslucentAppearanceIfNeeded");
}

- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4
{
  id v6;
  _QWORD v7[5];
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SFPopoverSizingTableViewController;
  v6 = a4;
  -[SFPopoverSizingTableViewController willTransitionToTraitCollection:withTransitionCoordinator:](&v8, sel_willTransitionToTraitCollection_withTransitionCoordinator_, a3, v6);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __96__SFPopoverSizingTableViewController_willTransitionToTraitCollection_withTransitionCoordinator___block_invoke;
  v7[3] = &unk_1E21E5C20;
  v7[4] = self;
  objc_msgSend(v6, "animateAlongsideTransition:completion:", v7, 0);

}

uint64_t __96__SFPopoverSizingTableViewController_willTransitionToTraitCollection_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateTranslucentAppearanceIfNeeded");
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  _QWORD v8[5];
  objc_super v9;

  height = a3.height;
  width = a3.width;
  v9.receiver = self;
  v9.super_class = (Class)SFPopoverSizingTableViewController;
  v7 = a4;
  -[SFPopoverSizingTableViewController viewWillTransitionToSize:withTransitionCoordinator:](&v9, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __89__SFPopoverSizingTableViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v8[3] = &unk_1E21E5C20;
  v8[4] = self;
  objc_msgSend(v7, "animateAlongsideTransition:completion:", v8, 0);

}

uint64_t __89__SFPopoverSizingTableViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateTranslucentAppearanceIfNeeded");
}

- (void)willMoveToParentViewController:(id)a3
{
  int v5;
  _QWORD block[5];
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SFPopoverSizingTableViewController;
  -[SFPopoverSizingTableViewController willMoveToParentViewController:](&v7, sel_willMoveToParentViewController_);
  v5 = -[SFPopoverSizingTableViewController _isInPopoverPresentation](self, "_isInPopoverPresentation");
  if (a3)
  {
    if (v5)
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __69__SFPopoverSizingTableViewController_willMoveToParentViewController___block_invoke;
      block[3] = &unk_1E21E2050;
      block[4] = self;
      dispatch_async(MEMORY[0x1E0C80D38], block);
    }
  }
}

uint64_t __69__SFPopoverSizingTableViewController_willMoveToParentViewController___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateTranslucentAppearanceIfNeeded");
}

- (void)didMoveToParentViewController:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SFPopoverSizingTableViewController;
  -[SFPopoverSizingTableViewController didMoveToParentViewController:](&v5, sel_didMoveToParentViewController_);
  if (a3)
    -[SFPopoverSizingTableViewController updatePreferredContentSize](self, "updatePreferredContentSize");
}

- (void)setNeedsUpdatePreferredContentSize
{
  self->_updatePreferredContentSizeAfterNextLayout = 1;
}

- (void)viewDidLayoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v9;
  _QWORD v10[5];
  _QWORD v11[5];
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)SFPopoverSizingTableViewController;
  -[SFPopoverSizingTableViewController viewDidLayoutSubviews](&v12, sel_viewDidLayoutSubviews);
  if (self->_updatePreferredContentSizeAfterNextLayout)
  {
    self->_updatePreferredContentSizeAfterNextLayout = 0;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __59__SFPopoverSizingTableViewController_viewDidLayoutSubviews__block_invoke;
    v11[3] = &unk_1E21E2050;
    v11[4] = self;
    objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v11);
  }
  else
  {
    -[SFPopoverSizingTableViewController tableView](self, "tableView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "contentSize");
    v5 = v4;
    v7 = v6;

    if (self->_lastLayoutContentSize.width != v5 || self->_lastLayoutContentSize.height != v7)
    {
      self->_lastLayoutContentSize.width = v5;
      self->_lastLayoutContentSize.height = v7;
      v9 = (void *)*MEMORY[0x1E0DC4730];
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __59__SFPopoverSizingTableViewController_viewDidLayoutSubviews__block_invoke_2;
      v10[3] = &unk_1E21E2050;
      v10[4] = self;
      objc_msgSend(v9, "_performBlockAfterCATransactionCommits:", v10);
    }
  }
}

uint64_t __59__SFPopoverSizingTableViewController_viewDidLayoutSubviews__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updatePreferredContentSize");
}

uint64_t __59__SFPopoverSizingTableViewController_viewDidLayoutSubviews__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updatePreferredContentSize");
}

- (void)_updateTranslucentAppearanceIfNeeded
{
  if (-[SFPopoverSizingTableViewController _needsTranslucentAppearanceUpdate](self, "_needsTranslucentAppearanceUpdate"))
  {
    -[SFPopoverSizingTableViewController updateTranslucentAppearance](self, "updateTranslucentAppearance");
  }
}

- (BOOL)_needsTranslucentAppearanceUpdate
{
  _BOOL4 didHaveTranslucentAppearance;
  UIBlurEffect *v4;
  UIBlurEffect *v5;
  BOOL v6;

  if (!self->_didUpdateTranslucentAppearanceAtLeastOnce)
    return 1;
  didHaveTranslucentAppearance = self->_didHaveTranslucentAppearance;
  if (didHaveTranslucentAppearance != -[SFPopoverSizingTableViewController hasTranslucentAppearance](self, "hasTranslucentAppearance"))return 1;
  -[SFPopoverSizingTableViewController _backgroundBlurEffect](self, "_backgroundBlurEffect");
  v4 = (UIBlurEffect *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  v6 = v4 != self->_backgroundBlurEffect && !-[UIBlurEffect isEqual:](v4, "isEqual:");

  return v6;
}

- (BOOL)hasTranslucentAppearance
{
  int v3;

  v3 = -[SFPopoverSizingTableViewController _isInPopoverPresentation](self, "_isInPopoverPresentation");
  if (v3)
    LOBYTE(v3) = !-[UIViewController safari_isPresentedByActivityViewController](self, "safari_isPresentedByActivityViewController");
  return v3;
}

- (void)updateTranslucentAppearance
{
  _BOOL8 v3;
  void *v4;
  UIBlurEffect *v5;
  UIBlurEffect *backgroundBlurEffect;
  void *v7;
  id v8;

  self->_didUpdateTranslucentAppearanceAtLeastOnce = 1;
  -[SFPopoverSizingTableViewController tableView](self, "tableView");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v3 = -[SFPopoverSizingTableViewController hasTranslucentAppearance](self, "hasTranslucentAppearance");
  self->_didHaveTranslucentAppearance = v3;
  -[SFPopoverSizingTableViewController backgroundColorUsingTranslucentAppearance:](self, "backgroundColorUsingTranslucentAppearance:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setBackgroundColor:", v4);

  -[SFPopoverSizingTableViewController _backgroundBlurEffect](self, "_backgroundBlurEffect");
  v5 = (UIBlurEffect *)objc_claimAutoreleasedReturnValue();
  backgroundBlurEffect = self->_backgroundBlurEffect;
  self->_backgroundBlurEffect = v5;

  if (self->_backgroundBlurEffect)
  {
    objc_msgSend(MEMORY[0x1E0DC3F08], "effectForBlurEffect:");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setSeparatorEffect:", v7);

  }
  else
  {
    objc_msgSend(v8, "setSeparatorEffect:");
  }
  objc_msgSend(v8, "reloadData");

}

- (id)_backgroundBlurEffect
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  _BOOL4 v8;

  -[SFPopoverSizingTableViewController traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sf_backgroundBlurEffect");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    -[SFPopoverSizingTableViewController tableView](self, "tableView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "style"))
    {

    }
    else
    {
      v8 = -[SFPopoverSizingTableViewController hasTranslucentAppearance](self, "hasTranslucentAppearance");

      if (v8)
      {
        objc_msgSend(MEMORY[0x1E0DC3510], "_sf_defaultPopoverBackgroundEffect");
        v5 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_3;
      }
    }
    v6 = 0;
    goto LABEL_9;
  }
  v5 = v4;
LABEL_3:
  v6 = v5;
LABEL_9:

  return v6;
}

- (id)backgroundColorUsingTranslucentAppearance:(BOOL)a3
{
  if (a3)
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  else
    objc_msgSend(MEMORY[0x1E0DC3658], "tableBackgroundColor");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)cancelKeyPressed
{
  -[SFPopoverSizingTableViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundBlurEffect, 0);
}

@end
