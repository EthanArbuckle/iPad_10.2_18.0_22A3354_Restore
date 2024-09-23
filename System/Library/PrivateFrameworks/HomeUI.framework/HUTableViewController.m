@implementation HUTableViewController

- (HUTableViewController)initWithStyle:(int64_t)a3
{
  HUTableViewController *v3;
  uint64_t v4;
  NSMapTable *installedChildViewControllersKeyedByCell;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HUTableViewController;
  v3 = -[HUTableViewController initWithStyle:](&v7, sel_initWithStyle_, a3);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3748], "weakToWeakObjectsMapTable");
    v4 = objc_claimAutoreleasedReturnValue();
    installedChildViewControllersKeyedByCell = v3->_installedChildViewControllersKeyedByCell;
    v3->_installedChildViewControllersKeyedByCell = (NSMapTable *)v4;

    v3->_sectionContentInsetFollowsLayoutMargins = 1;
  }
  return v3;
}

- (HUTableViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithStyle_);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUTableViewController.m"), 41, CFSTR("%s is unavailable; use %@ instead"),
    "-[HUTableViewController initWithNibName:bundle:]",
    v7);

  return 0;
}

- (HUTableViewController)initWithCoder:(id)a3
{
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithStyle_);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUTableViewController.m"), 46, CFSTR("%s is unavailable; use %@ instead"),
    "-[HUTableViewController initWithCoder:]",
    v6);

  return 0;
}

- (void)viewDidLoad
{
  void *v3;
  double v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HUTableViewController;
  -[HUTableViewController viewDidLoad](&v8, sel_viewDidLoad);
  -[HUTableViewController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setEstimatedRowHeight:", 44.0);

  v4 = *MEMORY[0x1E0CEBC10];
  -[HUTableViewController tableView](self, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setRowHeight:", v4);

  -[HUTableViewController tableView](self, "tableView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setKeyboardDismissMode:", 1);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObserver:selector:name:object:", self, sel_contentSizeCategoryDidChange, *MEMORY[0x1E0CEB3F0], 0);

}

- (void)contentSizeCategoryDidChange
{
  id v2;

  -[HUTableViewController tableView](self, "tableView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsLayout");

}

- (BOOL)shouldAutomaticallyForwardAppearanceMethods
{
  return 0;
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  objc_super v18;
  uint8_t v19[128];
  uint8_t buf[4];
  HUTableViewController *v21;
  uint64_t v22;

  v3 = a3;
  v22 = *MEMORY[0x1E0C80C00];
  v18.receiver = self;
  v18.super_class = (Class)HUTableViewController;
  -[HUTableViewController viewWillAppear:](&v18, sel_viewWillAppear_);
  HFLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v21 = self;
    _os_log_impl(&dword_1B8E1E000, v5, OS_LOG_TYPE_DEFAULT, "%@: viewWillAppear", buf, 0xCu);
  }

  -[HUTableViewController setChildViewControllersAtViewWillDisappearTime:](self, "setChildViewControllersAtViewWillDisappearTime:", 0);
  objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUTableViewController setChildViewControllersAtViewWillAppearTime:](self, "setChildViewControllersAtViewWillAppearTime:", v6);

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[HUTableViewController childViewControllers](self, "childViewControllers", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v11);
        -[HUTableViewController childViewControllersAtViewWillAppearTime](self, "childViewControllersAtViewWillAppearTime");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "addObject:", v12);

        objc_msgSend(v12, "beginAppearanceTransition:animated:", 1, v3);
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
    }
    while (v9);
  }

}

- (void)viewDidAppear:(BOOL)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  objc_super v16;
  uint8_t v17[128];
  uint8_t buf[4];
  HUTableViewController *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v16.receiver = self;
  v16.super_class = (Class)HUTableViewController;
  -[HUTableViewController viewDidAppear:](&v16, sel_viewDidAppear_, a3);
  HFLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v19 = self;
    v20 = 2112;
    v21 = v6;
    _os_log_impl(&dword_1B8E1E000, v5, OS_LOG_TYPE_DEFAULT, "%@: %@", buf, 0x16u);

  }
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[HUTableViewController childViewControllersAtViewWillAppearTime](self, "childViewControllersAtViewWillAppearTime", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v13;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v11++), "endAppearanceTransition");
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
    }
    while (v9);
  }

}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  objc_super v18;
  uint8_t v19[128];
  uint8_t buf[4];
  HUTableViewController *v21;
  uint64_t v22;

  v3 = a3;
  v22 = *MEMORY[0x1E0C80C00];
  v18.receiver = self;
  v18.super_class = (Class)HUTableViewController;
  -[HUTableViewController viewWillDisappear:](&v18, sel_viewWillDisappear_);
  HFLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v21 = self;
    _os_log_impl(&dword_1B8E1E000, v5, OS_LOG_TYPE_DEFAULT, "%@: viewWillDisappear", buf, 0xCu);
  }

  -[HUTableViewController setChildViewControllersAtViewWillAppearTime:](self, "setChildViewControllersAtViewWillAppearTime:", 0);
  objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUTableViewController setChildViewControllersAtViewWillDisappearTime:](self, "setChildViewControllersAtViewWillDisappearTime:", v6);

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[HUTableViewController childViewControllers](self, "childViewControllers", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v11);
        -[HUTableViewController childViewControllersAtViewWillDisappearTime](self, "childViewControllersAtViewWillDisappearTime");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "addObject:", v12);

        objc_msgSend(v12, "beginAppearanceTransition:animated:", 0, v3);
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
    }
    while (v9);
  }

}

- (void)viewDidDisappear:(BOOL)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  objc_super v16;
  uint8_t v17[128];
  uint8_t buf[4];
  HUTableViewController *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v16.receiver = self;
  v16.super_class = (Class)HUTableViewController;
  -[HUTableViewController viewDidDisappear:](&v16, sel_viewDidDisappear_, a3);
  HFLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v19 = self;
    v20 = 2112;
    v21 = v6;
    _os_log_impl(&dword_1B8E1E000, v5, OS_LOG_TYPE_DEFAULT, "%@: %@", buf, 0x16u);

  }
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[HUTableViewController childViewControllersAtViewWillDisappearTime](self, "childViewControllersAtViewWillDisappearTime", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v13;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v11++), "endAppearanceTransition");
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
    }
    while (v9);
  }

}

- (void)viewWillLayoutSubviews
{
  _BOOL8 v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HUTableViewController;
  -[HUTableViewController viewWillLayoutSubviews](&v5, sel_viewWillLayoutSubviews);
  v3 = -[HUTableViewController sectionContentInsetFollowsLayoutMargins](self, "sectionContentInsetFollowsLayoutMargins");
  -[HUTableViewController tableView](self, "tableView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_setSectionContentInsetFollowsLayoutMargins:", v3);

  -[HUTableViewController setViewLayingOut:](self, "setViewLayingOut:", 1);
}

- (void)viewDidLayoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HUTableViewController;
  -[HUTableViewController viewDidLayoutSubviews](&v3, sel_viewDidLayoutSubviews);
  -[HUTableViewController setViewLayingOut:](self, "setViewLayingOut:", 0);
}

- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  int v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!-[HUTableViewController isViewLayingOut](self, "isViewLayingOut"))
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    -[HUTableViewController installedChildViewControllersKeyedByCell](self, "installedChildViewControllersKeyedByCell", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "keyEnumerator");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v15;
      while (2)
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v15 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "viewController");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "isEqual:", v4);

          if (v12)
          {
            -[HUTableViewController tableView](self, "tableView");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "reloadData");

            goto LABEL_12;
          }
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        if (v8)
          continue;
        break;
      }
    }
LABEL_12:

  }
}

- (void)setSectionContentInsetFollowsLayoutMargins:(BOOL)a3
{
  id v3;

  if (self->_sectionContentInsetFollowsLayoutMargins != a3)
  {
    self->_sectionContentInsetFollowsLayoutMargins = a3;
    -[HUTableViewController tableView](self, "tableView");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setNeedsLayout");

  }
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  uint64_t i;
  id v16;
  void *v17;
  void *v18;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id obj;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = v6;
    objc_msgSend(v7, "viewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v27 = 0u;
      v28 = 0u;
      v25 = 0u;
      v26 = 0u;
      -[HUTableViewController installedChildViewControllersKeyedByCell](self, "installedChildViewControllersKeyedByCell");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)objc_msgSend(v9, "copy");

      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      if (v11)
      {
        v12 = v11;
        v23 = v6;
        obj = v10;
        v13 = 0;
        v14 = *(_QWORD *)v26;
        do
        {
          for (i = 0; i != v12; ++i)
          {
            if (*(_QWORD *)v26 != v14)
              objc_enumerationMutation(obj);
            v16 = *(id *)(*((_QWORD *)&v25 + 1) + 8 * i);
            -[HUTableViewController installedChildViewControllersKeyedByCell](self, "installedChildViewControllersKeyedByCell", v23);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "objectForKey:", v16);
            v18 = (void *)objc_claimAutoreleasedReturnValue();

            if (v18 == v8 && v16 != v7)
            {
              -[HUTableViewController installedChildViewControllersKeyedByCell](self, "installedChildViewControllersKeyedByCell");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v20, "removeObjectForKey:", v16);

              objc_msgSend(v16, "setViewController:", 0);
              v13 = 1;
            }
          }
          v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
        }
        while (v12);

        v6 = v23;
        if ((v13 & 1) != 0)
        {
          objc_msgSend(v7, "addToParentViewController:", self);
          -[HUTableViewController installedChildViewControllersKeyedByCell](self, "installedChildViewControllersKeyedByCell");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "setObject:forKey:", v8, v7);

          goto LABEL_19;
        }
      }
      else
      {

      }
      objc_msgSend(v8, "beginAppearanceTransition:animated:", 1, 0);
      objc_msgSend(v7, "addToParentViewController:", self);
      -[HUTableViewController installedChildViewControllersKeyedByCell](self, "installedChildViewControllersKeyedByCell");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setObject:forKey:", v8, v7);

      objc_msgSend(v8, "endAppearanceTransition");
    }
LABEL_19:

  }
}

- (void)tableView:(id)a3 didEndDisplayingCell:(id)a4 forRowAtIndexPath:(id)a5
{
  char isKindOfClass;
  void *v7;
  id v8;
  void *v9;
  HUTableViewController *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a4;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v7 = v14;
  if ((isKindOfClass & 1) != 0)
  {
    v8 = v14;
    objc_msgSend(v8, "viewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "parentViewController");
    v10 = (HUTableViewController *)objc_claimAutoreleasedReturnValue();
    if (v10 == self)
    {
      -[HUTableViewController installedChildViewControllersKeyedByCell](self, "installedChildViewControllersKeyedByCell");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectForKey:", v8);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12 == v9)
      {
        objc_msgSend(v9, "beginAppearanceTransition:animated:", 0, 0);
        objc_msgSend(v8, "removeFromParentViewController");
        -[HUTableViewController installedChildViewControllersKeyedByCell](self, "installedChildViewControllersKeyedByCell");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "removeObjectForKey:", v8);

        objc_msgSend(v9, "endAppearanceTransition");
      }
    }
    else
    {

    }
    v7 = v14;
  }

}

- (void)didUpdateRequiredHeightForCell:(id)a3
{
  void *v4;
  id v5;

  if (!-[HUTableViewController isViewLayingOut](self, "isViewLayingOut", a3))
  {
    -[HUTableViewController tableView](self, "tableView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "beginUpdates");

    -[HUTableViewController tableView](self, "tableView");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "endUpdates");

  }
}

- (BOOL)sectionContentInsetFollowsLayoutMargins
{
  return self->_sectionContentInsetFollowsLayoutMargins;
}

- (NSHashTable)childViewControllersAtViewWillAppearTime
{
  return self->_childViewControllersAtViewWillAppearTime;
}

- (void)setChildViewControllersAtViewWillAppearTime:(id)a3
{
  objc_storeStrong((id *)&self->_childViewControllersAtViewWillAppearTime, a3);
}

- (NSHashTable)childViewControllersAtViewWillDisappearTime
{
  return self->_childViewControllersAtViewWillDisappearTime;
}

- (void)setChildViewControllersAtViewWillDisappearTime:(id)a3
{
  objc_storeStrong((id *)&self->_childViewControllersAtViewWillDisappearTime, a3);
}

- (NSMapTable)installedChildViewControllersKeyedByCell
{
  return self->_installedChildViewControllersKeyedByCell;
}

- (void)setInstalledChildViewControllersKeyedByCell:(id)a3
{
  objc_storeStrong((id *)&self->_installedChildViewControllersKeyedByCell, a3);
}

- (BOOL)isViewLayingOut
{
  return self->_viewLayingOut;
}

- (void)setViewLayingOut:(BOOL)a3
{
  self->_viewLayingOut = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_installedChildViewControllersKeyedByCell, 0);
  objc_storeStrong((id *)&self->_childViewControllersAtViewWillDisappearTime, 0);
  objc_storeStrong((id *)&self->_childViewControllersAtViewWillAppearTime, 0);
}

@end
