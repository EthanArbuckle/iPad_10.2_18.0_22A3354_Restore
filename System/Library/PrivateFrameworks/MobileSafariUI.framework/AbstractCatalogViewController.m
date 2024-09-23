@implementation AbstractCatalogViewController

- (void)updatePreferredContentSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  id v8;

  -[AbstractCatalogViewController requiredContentWidth](self, "requiredContentWidth");
  v4 = v3;
  -[AbstractCatalogViewController maxContentHeight](self, "maxContentHeight");
  v6 = v5;
  -[AbstractCatalogViewController foregroundChildViewController](self, "foregroundChildViewController");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "preferredContentSize");
  -[AbstractCatalogViewController setPreferredContentSize:](self, "setPreferredContentSize:", v4, fmin(v6, v7));

}

- (UIViewController)foregroundChildViewController
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  -[AbstractCatalogViewController completionsViewControllerIfLoaded](self, "completionsViewControllerIfLoaded");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[AbstractCatalogViewController isResponsibleForLayoutOfViewController:](self, "isResponsibleForLayoutOfViewController:", v3))
  {
    v4 = v3;
  }
  else
  {
    -[AbstractCatalogViewController universalSearchFirstTimeExperienceViewController](self, "universalSearchFirstTimeExperienceViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[AbstractCatalogViewController isResponsibleForLayoutOfViewController:](self, "isResponsibleForLayoutOfViewController:", v5))
    {
      v4 = v5;
    }
    else
    {
      -[AbstractCatalogViewController startPageViewController](self, "startPageViewController");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[AbstractCatalogViewController isResponsibleForLayoutOfViewController:](self, "isResponsibleForLayoutOfViewController:", v6))
      {
        v4 = v6;
      }
      else
      {
        v4 = 0;
      }

    }
  }

  return (UIViewController *)v4;
}

- (BOOL)isResponsibleForLayoutOfViewController:(id)a3
{
  AbstractCatalogViewController *v4;
  BOOL v5;

  if (!a3)
    return 0;
  objc_msgSend(a3, "parentViewController");
  v4 = (AbstractCatalogViewController *)objc_claimAutoreleasedReturnValue();
  v5 = v4 == self;

  return v5;
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AbstractCatalogViewController;
  -[AbstractCatalogViewController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[AbstractCatalogViewController updatePreferredContentSize](self, "updatePreferredContentSize");
}

- (void)takeOwnershipOfStartPageViewController
{
  void *v3;
  _BOOL4 v4;

  -[AbstractCatalogViewController startPageViewController](self, "startPageViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[AbstractCatalogViewController _takeOwnershipOfViewController:](self, "_takeOwnershipOfViewController:", v3);

  if (v4)
    -[AbstractCatalogViewController didGainOwnershipOfStartPageViewController](self, "didGainOwnershipOfStartPageViewController");
}

- (BOOL)_takeOwnershipOfViewController:(id)a3
{
  id v4;
  void *v5;
  AbstractCatalogViewController *v6;
  void *v7;
  void *v8;
  id v9;
  BOOL v10;
  _QWORD v12[5];
  id v13;
  id v14;

  v4 = a3;
  v5 = v4;
  if (!v4
    || (objc_msgSend(v4, "parentViewController"),
        v6 = (AbstractCatalogViewController *)objc_claimAutoreleasedReturnValue(),
        v6,
        v6 == self))
  {
    v10 = 0;
  }
  else
  {
    -[AbstractCatalogViewController view](self, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "layoutIfNeeded");
    v8 = (void *)MEMORY[0x1E0DC3F10];
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __64__AbstractCatalogViewController__takeOwnershipOfViewController___block_invoke;
    v12[3] = &unk_1E9CF2990;
    v12[4] = self;
    v13 = v5;
    v14 = v7;
    v9 = v7;
    objc_msgSend(v8, "performWithoutAnimation:", v12);

    v10 = 1;
  }

  return v10;
}

uint64_t __64__AbstractCatalogViewController__takeOwnershipOfViewController___block_invoke(id *a1)
{
  id v2;
  void *v3;

  objc_msgSend(a1[4], "_relinquishOwnershipOfViewControllerFromCurrentParent:", a1[5]);
  objc_msgSend(a1[4], "addChildViewController:", a1[5]);
  v2 = a1[6];
  objc_msgSend(a1[5], "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addSubview:", v3);

  objc_msgSend(a1[5], "didMoveToParentViewController:", a1[4]);
  objc_msgSend(a1[4], "setForegroundChildViewControllerNeedsUpdate");
  return objc_msgSend(a1[6], "layoutIfNeeded");
}

- (void)setForegroundChildViewControllerNeedsUpdate
{
  id v2;

  -[AbstractCatalogViewController viewIfLoaded](self, "viewIfLoaded");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsLayout");

}

- (void)_relinquishOwnershipOfViewControllerFromCurrentParent:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;

  v3 = a3;
  v4 = v3;
  if (v3
    && (objc_msgSend(v3, "parentViewController"), v5 = (void *)objc_claimAutoreleasedReturnValue(), v5, v5))
  {
    objc_msgSend(v4, "parentViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend(v4, "willMoveToParentViewController:", 0);
      objc_msgSend(v4, "view");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "removeFromSuperview");

      objc_msgSend(v4, "removeFromParentViewController");
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v6, "setForegroundChildViewControllerNeedsUpdate");
      }
      else
      {
        v10 = WBS_LOG_CHANNEL_PREFIXOther();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          -[AbstractCatalogViewController _relinquishOwnershipOfViewControllerFromCurrentParent:].cold.2(v10);
      }
    }
  }
  else
  {
    objc_msgSend(v4, "viewIfLoaded");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "window");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v9 = WBS_LOG_CHANNEL_PREFIXOther();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        -[AbstractCatalogViewController _relinquishOwnershipOfViewControllerFromCurrentParent:].cold.1(v9, (uint64_t)v4, v6);
      objc_msgSend(v6, "removeFromSuperview");
    }
  }

}

- (void)viewWillLayoutSubviews
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  _BOOL8 v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  objc_super v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v16.receiver = self;
  v16.super_class = (Class)AbstractCatalogViewController;
  -[AbstractCatalogViewController viewWillLayoutSubviews](&v16, sel_viewWillLayoutSubviews);
  -[AbstractCatalogViewController foregroundChildViewController](self, "foregroundChildViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[AbstractCatalogViewController childViewControllers](self, "childViewControllers", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v8);
        v10 = v9 != v3;
        objc_msgSend(v9, "view");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setHidden:", v10);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
    }
    while (v6);
  }

}

- (double)requiredContentWidth
{
  return 0.0;
}

- (double)maxContentHeight
{
  return 0.0;
}

- (CompletionListTableViewController)completionsViewController
{
  return 0;
}

- (CompletionListTableViewController)completionsViewControllerIfLoaded
{
  return 0;
}

- (void)takeOwnershipOfCompletionsViewController
{
  void *v3;
  _BOOL4 v4;

  -[AbstractCatalogViewController completionsViewController](self, "completionsViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[AbstractCatalogViewController _takeOwnershipOfViewController:](self, "_takeOwnershipOfViewController:", v3);

  if (v4)
    -[AbstractCatalogViewController didGainOwnershipOfCompletionsViewController](self, "didGainOwnershipOfCompletionsViewController");
}

- (void)relinquishOwnershipOfCompletionsViewControllerFromCurrentParent
{
  id v3;

  -[AbstractCatalogViewController completionsViewController](self, "completionsViewController");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[AbstractCatalogViewController _relinquishOwnershipOfViewControllerFromCurrentParent:](self, "_relinquishOwnershipOfViewControllerFromCurrentParent:", v3);

}

- (SFStartPageViewController)startPageViewController
{
  return 0;
}

- (void)relinquishOwnershipOfStartPageViewControllerFromCurrentParent
{
  id v3;

  -[AbstractCatalogViewController startPageViewController](self, "startPageViewController");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[AbstractCatalogViewController _relinquishOwnershipOfViewControllerFromCurrentParent:](self, "_relinquishOwnershipOfViewControllerFromCurrentParent:", v3);

}

- (UniversalSearchFirstTimeExperienceViewController)universalSearchFirstTimeExperienceViewController
{
  return 0;
}

- (void)takeOwnershipOfUniversalSearchFirstTimeExperienceViewController
{
  void *v3;
  _BOOL4 v4;

  -[AbstractCatalogViewController universalSearchFirstTimeExperienceViewController](self, "universalSearchFirstTimeExperienceViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[AbstractCatalogViewController _takeOwnershipOfViewController:](self, "_takeOwnershipOfViewController:", v3);

  if (v4)
    -[AbstractCatalogViewController didGainOwnershipOfUniversalSearchFirstTimeExperienceViewController](self, "didGainOwnershipOfUniversalSearchFirstTimeExperienceViewController");
}

- (void)relinquishOwnershipOfUniversalSearchFirstTimeExperienceViewControllerFromCurrentParent
{
  id v3;

  -[AbstractCatalogViewController universalSearchFirstTimeExperienceViewController](self, "universalSearchFirstTimeExperienceViewController");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[AbstractCatalogViewController _relinquishOwnershipOfViewControllerFromCurrentParent:](self, "_relinquishOwnershipOfViewControllerFromCurrentParent:", v3);

}

- (void)_relinquishOwnershipOfViewControllerFromCurrentParent:(void *)a3 .cold.1(void *a1, uint64_t a2, void *a3)
{
  id v4;
  objc_class *v5;
  void *v6;
  void *v7;
  objc_class *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;

  v4 = a1;
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a3, "superview");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (objc_class *)objc_opt_class();
  NSStringFromClass(v8);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_4(&dword_1D7CA3000, v9, v10, "View controller %{public}@ has no parent but its view is installed in %{public}@. Removing view.", v11, v12, v13, v14, 2u);

  OUTLINED_FUNCTION_1_2();
}

- (void)_relinquishOwnershipOfViewControllerFromCurrentParent:(void *)a1 .cold.2(void *a1)
{
  id v1;
  objc_class *v2;
  void *v3;
  objc_class *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;

  v1 = a1;
  v2 = (objc_class *)objc_opt_class();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_4(&dword_1D7CA3000, v5, v6, "Unable to relinquish ownership of %{public}@ from %{public}@ because it is not an instance of AbstractCatalogViewController", v7, v8, v9, v10, 2u);

  OUTLINED_FUNCTION_1_2();
}

@end
