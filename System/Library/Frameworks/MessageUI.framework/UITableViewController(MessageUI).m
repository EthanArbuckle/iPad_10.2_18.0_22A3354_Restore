@implementation UITableViewController(MessageUI)

- (id)mf_updatePreferredContentSizeBasedOnTableView
{
  void *v2;
  id v3;
  void *v4;
  _QWORD v6[4];
  id v7;
  id v8;
  id location;

  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, val);
  objc_msgSend(val, "tableView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __81__UITableViewController_MessageUI__mf_updatePreferredContentSizeBasedOnTableView__block_invoke;
  v6[3] = &unk_1E5A69EE0;
  objc_copyWeak(&v8, &location);
  v7 = v2;
  v3 = v2;
  objc_msgSend(v3, "ef_observeKeyPath:options:autoCancelToken:usingBlock:", CFSTR("contentSize"), 1, 1, v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
  return v4;
}

- (uint64_t)mf_supportsPopoverPresentation
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  objc_msgSend(a1, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "window");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    objc_msgSend(a1, "presentingViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "window");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
      goto LABEL_4;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("UITableViewController+MessageUI.m"), 30, CFSTR("view must have a window"));
    v5 = 0;
  }

LABEL_4:
  objc_msgSend(v5, "traitCollection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "mf_supportsPopoverPresentation");

  return v9;
}

- (void)mf_updateTableViewBackgroundColorForPopover
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(a1, "mf_supportsPopoverPresentation");
  if ((v2 & 1) != 0)
  {
    v3 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "systemGroupedBackgroundColor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(a1, "tableView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v3);

  if ((v2 & 1) == 0)
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  objc_msgSend(a1, "tableView", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "visibleCells");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "mf_updateBackgroundColorForPopover:", v2);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

@end
