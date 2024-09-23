@implementation GKProfilePrivacyTableViewController

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[5];
  id v8;
  id location;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)GKProfilePrivacyTableViewController;
  -[GKProfilePrivacyTableViewController viewDidLoad](&v10, sel_viewDidLoad);
  GKGameCenterUIFrameworkBundle();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  GKGetLocalizedStringFromTableInBundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKProfilePrivacyTableViewController setTitle:](self, "setTitle:", v4);

  -[GKProfilePrivacyTableViewController setIsSendingRequest:](self, "setIsSendingRequest:", 0);
  -[GKProfilePrivacyTableViewController updateTableViewLayoutMargins](self, "updateTableViewLayoutMargins");
  objc_initWeak(&location, self);
  objc_msgSend(MEMORY[0x1E0D25298], "proxyForLocalPlayer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "profileServicePrivate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __50__GKProfilePrivacyTableViewController_viewDidLoad__block_invoke;
  v7[3] = &unk_1E59C4F38;
  objc_copyWeak(&v8, &location);
  v7[4] = self;
  objc_msgSend(v6, "getProfilePrivacyWithHandler:", v7);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __50__GKProfilePrivacyTableViewController_viewDidLoad__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id WeakRetained;

  v3 = a1;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "setCurrentPrivacySettings:", a2);
  objc_msgSend(WeakRetained, "setInitialPrivacySettings:", objc_msgSend(*(id *)(v3 + 32), "currentPrivacySettings"));
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "setAvailblePrivacySettings:", v4);

  objc_msgSend(MEMORY[0x1E0D25330], "local");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend(v5, "isUnderage");

  if ((v3 & 1) != 0)
  {
    if (!objc_msgSend(WeakRetained, "currentPrivacySettings"))
      objc_msgSend(WeakRetained, "setCurrentPrivacySettings:", 2);
  }
  else
  {
    objc_msgSend(WeakRetained, "availblePrivacySettings");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", &unk_1E5A5DD58);

  }
  objc_msgSend(WeakRetained, "availblePrivacySettings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", &unk_1E5A5DD70);

  objc_msgSend(WeakRetained, "availblePrivacySettings");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObject:", &unk_1E5A5DD88);

  objc_msgSend(WeakRetained, "tableView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "reloadData");

}

- (void)updateTableViewLayoutMargins
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  char v8;
  double v9;
  double v10;
  double v11;
  double v12;
  id v13;

  -[GKProfilePrivacyTableViewController traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "verticalSizeClass") == 1)
  {

    if (!_os_feature_enabled_impl())
      goto LABEL_6;
  }
  else
  {
    -[GKProfilePrivacyTableViewController traitCollection](self, "traitCollection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "userInterfaceIdiom");

    if ((_os_feature_enabled_impl() & 1) == 0)
    {
      if (v5 == 1)
        goto LABEL_6;
LABEL_8:
      v11 = *MEMORY[0x1E0DC49E8];
      v9 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
      v10 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
      v12 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
      goto LABEL_9;
    }
  }
  v6 = (void *)objc_opt_new();
  objc_msgSend(v6, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = PSShouldInsetListView();

  if ((v8 & 1) == 0)
    goto LABEL_8;
LABEL_6:
  v9 = 20.0;
  v10 = 0.0;
  v11 = 0.0;
  v12 = 20.0;
LABEL_9:
  -[GKProfilePrivacyTableViewController tableView](self, "tableView");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "_setSectionContentInset:", v11, v9, v10, v12);

}

- (void)traitCollectionDidChange:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)GKProfilePrivacyTableViewController;
  -[GKProfilePrivacyTableViewController traitCollectionDidChange:](&v4, sel_traitCollectionDidChange_, a3);
  -[GKProfilePrivacyTableViewController updateTableViewLayoutMargins](self, "updateTableViewLayoutMargins");
}

- (id)titleForPrivacy:(int)a3
{
  void *v3;
  __CFString *v4;

  if (a3 > 2)
  {
    v4 = &stru_1E59EB978;
  }
  else
  {
    GKGameCenterUIFrameworkBundle();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    GKGetLocalizedStringFromTableInBundle();
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

- (id)tableFooterForPrivacy:(int)a3
{
  void *v3;
  void *v4;

  GKGameCenterUIFrameworkBundle();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  GKGetLocalizedStringFromTableInBundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)setIsSendingRequest:(BOOL)a3
{
  _BOOL8 v4;
  uint64_t v5;
  void *v6;
  void *v7;
  _BOOL8 v8;
  void *v9;
  id v10;

  self->_isSendingRequest = a3;
  v4 = !a3;
  -[GKProfilePrivacyTableViewController navigationController](self, "navigationController");
  v5 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v5, "navigationBar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setUserInteractionEnabled:", v4);

  -[GKProfilePrivacyTableViewController navigationController](self, "navigationController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v5) = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    v8 = !self->_isSendingRequest;
    -[GKProfilePrivacyTableViewController navigationController](self, "navigationController");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "interactivePopGestureRecognizer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setEnabled:", v8);

  }
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  return *MEMORY[0x1E0DC53D8];
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return -[NSMutableArray count](self->_availblePrivacySettings, "count", a3, a4);
}

- (void)updateCell:(id)a3 withCheckmark:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  id v11;

  v4 = a4;
  v5 = a3;
  v11 = v5;
  if (v4)
  {
    objc_msgSend(v5, "setAccessoryType:", 3);
    objc_msgSend(v11, "setAccessoryView:", 0);
    v6 = v11;
  }
  else
  {
    objc_msgSend(v5, "setAccessoryType:", 0);
    v7 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x1E0DC37F8], "defaultMetrics");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "scaledValueForValue:", 20.0);
    v10 = v9;

    objc_msgSend(v7, "setFrame:", 0.0, 0.0, v10, 20.0);
    objc_msgSend(v11, "setAccessoryView:", v7);

    v6 = v7;
  }

}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v6 = a4;
  objc_msgSend(a3, "dequeueReusableCellWithIdentifier:", CFSTR("GKProfilePrivacyTableCell"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D50]), "initWithStyle:reuseIdentifier:", 3, CFSTR("GKProfilePrivacyTableCell"));
    objc_msgSend(v7, "detailTextLabel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setNumberOfLines:", 0);

    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "detailTextLabel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setTextColor:", v9);

  }
  -[NSMutableArray objectAtIndexedSubscript:](self->_availblePrivacySettings, "objectAtIndexedSubscript:", objc_msgSend(v6, "row"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "intValue");

  -[GKProfilePrivacyTableViewController titleForPrivacy:](self, "titleForPrivacy:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "textLabel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setText:", v13);

  -[GKProfilePrivacyTableViewController tableFooterForPrivacy:](self, "tableFooterForPrivacy:", v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "detailTextLabel");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setText:", v15);

  -[GKProfilePrivacyTableViewController updateCell:withCheckmark:](self, "updateCell:withCheckmark:", v7, -[GKProfilePrivacyTableViewController currentPrivacySettings](self, "currentPrivacySettings") == (_DWORD)v12);
  return v7;
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  return !-[GKProfilePrivacyTableViewController isSendingRequest](self, "isSendingRequest", a3, a4);
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  NSString *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  _QWORD v26[5];
  int v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  -[NSMutableArray objectAtIndexedSubscript:](self->_availblePrivacySettings, "objectAtIndexedSubscript:", objc_msgSend(v5, "row"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "intValue");

  if ((_DWORD)v7 == -[GKProfilePrivacyTableViewController currentPrivacySettings](self, "currentPrivacySettings"))
  {
    -[GKProfilePrivacyTableViewController tableView](self, "tableView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "deselectRowAtIndexPath:animated:", v5, 0);

  }
  else
  {
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    -[GKProfilePrivacyTableViewController tableView](self, "tableView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "visibleCells");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v29;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v29 != v13)
            objc_enumerationMutation(v10);
          -[GKProfilePrivacyTableViewController updateCell:withCheckmark:](self, "updateCell:withCheckmark:", *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * v14++), 0);
        }
        while (v12 != v14);
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      }
      while (v12);
    }

    -[GKProfilePrivacyTableViewController traitCollection](self, "traitCollection");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "preferredContentSizeCategory");
    v16 = (NSString *)objc_claimAutoreleasedReturnValue();
    if (UIContentSizeCategoryIsAccessibilityCategory(v16))
      v17 = 101;
    else
      v17 = 100;

    -[GKProfilePrivacyTableViewController tableView](self, "tableView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "cellForRowAtIndexPath:", v5);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3438]), "initWithActivityIndicatorStyle:", v17);
    objc_msgSend(v20, "startAnimating");
    objc_msgSend(MEMORY[0x1E0DC37F8], "defaultMetrics");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "scaledValueForValue:", 20.0);
    v23 = v22;

    objc_msgSend(v20, "frame");
    objc_msgSend(v20, "setFrame:", 0.0, 0.0, v23);
    objc_msgSend(v19, "setAccessoryView:", v20);
    objc_msgSend(v19, "setAccessoryType:", 0);
    -[GKProfilePrivacyTableViewController setIsSendingRequest:](self, "setIsSendingRequest:", 1);
    objc_msgSend(MEMORY[0x1E0D25298], "proxyForLocalPlayer");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "profileServicePrivate");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __73__GKProfilePrivacyTableViewController_tableView_didSelectRowAtIndexPath___block_invoke;
    v26[3] = &unk_1E59C4F60;
    v26[4] = self;
    v27 = v7;
    objc_msgSend(v25, "setProfilePrivacy:handler:", v7, v26);

  }
}

void __73__GKProfilePrivacyTableViewController_tableView_didSelectRowAtIndexPath___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[2];
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "setIsSendingRequest:", 0);
  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "tableView");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "reloadData");

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D253C0], "reporter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *MEMORY[0x1E0D250B8];
    v6 = *MEMORY[0x1E0D251E0];
    v14[0] = *MEMORY[0x1E0D251E8];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(*(id *)(a1 + 32), "initialPrivacySettings"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = v7;
    v14[1] = *MEMORY[0x1E0D251F0];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(*(id *)(a1 + 32), "currentPrivacySettings"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v15[1] = v8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "reportEvent:type:payload:", v5, v6, v9);

    objc_msgSend(*(id *)(a1 + 32), "setCurrentPrivacySettings:", *(unsigned int *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 32), "tableView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "reloadData");

    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      objc_msgSend(*(id *)(a1 + 32), "delegate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "didUpdateProfilePrivacy:", 0);

    }
  }
}

- (GKLocalPlayer)localPlayer
{
  return self->_localPlayer;
}

- (void)setLocalPlayer:(id)a3
{
  objc_storeStrong((id *)&self->_localPlayer, a3);
}

- (GKProfilePrivacyTableViewControllerDelegate)delegate
{
  return (GKProfilePrivacyTableViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (int)currentPrivacySettings
{
  return self->_currentPrivacySettings;
}

- (void)setCurrentPrivacySettings:(int)a3
{
  self->_currentPrivacySettings = a3;
}

- (int)initialPrivacySettings
{
  return self->_initialPrivacySettings;
}

- (void)setInitialPrivacySettings:(int)a3
{
  self->_initialPrivacySettings = a3;
}

- (NSMutableArray)availblePrivacySettings
{
  return self->_availblePrivacySettings;
}

- (void)setAvailblePrivacySettings:(id)a3
{
  objc_storeStrong((id *)&self->_availblePrivacySettings, a3);
}

- (BOOL)isSendingRequest
{
  return self->_isSendingRequest;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_availblePrivacySettings, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_localPlayer, 0);
}

@end
