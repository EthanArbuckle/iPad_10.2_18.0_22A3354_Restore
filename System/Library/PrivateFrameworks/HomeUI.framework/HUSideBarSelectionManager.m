@implementation HUSideBarSelectionManager

+ (id)sharedManager
{
  return (id)sharedManager;
}

- (HUSideBarSelectionManager)initWithSideBarViewController:(id)a3 sideBarItemManager:(id)a4 delegate:(id)a5
{
  id v9;
  id v10;
  id v11;
  HUSideBarSelectionManager *v12;
  HUSideBarSelectionManager *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  objc_super v19;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)HUSideBarSelectionManager;
  v12 = -[HUSideBarSelectionManager init](&v19, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_sideBarViewController, a3);
    objc_storeStrong((id *)&v13->_sideBarItemManager, a4);
    objc_storeStrong((id *)&v13->_delegate, a5);
    objc_msgSend(MEMORY[0x1E0D31838], "sharedInstance");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "selectedHomeAppTabIdentifier");
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = (void *)v15;
    if (v15)
      v17 = (void *)v15;
    else
      v17 = (void *)*MEMORY[0x1E0D306D0];
    objc_storeStrong((id *)&v13->_currentTabIdentifier, v17);

    objc_storeStrong((id *)&sharedManager, v13);
  }

  return v13;
}

- (void)updateWithSideBarViewController:(id)a3 sideBarItemManager:(id)a4
{
  HUSideBarViewController *v6;
  HUSideBarItemManager *v7;
  HUSideBarViewController *sideBarViewController;
  HUSideBarViewController *v9;
  HUSideBarItemManager *sideBarItemManager;

  v6 = (HUSideBarViewController *)a3;
  v7 = (HUSideBarItemManager *)a4;
  sideBarViewController = self->_sideBarViewController;
  self->_sideBarViewController = v6;
  v9 = v6;

  sideBarItemManager = self->_sideBarItemManager;
  self->_sideBarItemManager = v7;

  -[HUSideBarSelectionManager _updateAppearanceForSidebar](self, "_updateAppearanceForSidebar");
}

- (id)initForTest
{
  HUSideBarSelectionManager *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HUSideBarSelectionManager;
  v2 = -[HUSideBarSelectionManager init](&v4, sel_init);
  if (v2)
    objc_storeStrong((id *)&sharedManager, v2);
  return v2;
}

- (HFHomeKitObject)dashboarHomeKitObject
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[HUSideBarSelectionManager currentContext](self, "currentContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "room");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUSideBarSelectionManager currentContext](self, "currentContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
    objc_msgSend(v5, "room");
  else
    objc_msgSend(v5, "home");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (HFHomeKitObject *)v7;
}

- (void)setCurrentTabIdentifier:(id)a3
{
  id v5;

  v5 = a3;
  if (!-[NSString isEqualToString:](self->_currentTabIdentifier, "isEqualToString:"))
  {
    objc_storeStrong((id *)&self->_currentTabIdentifier, a3);
    -[HUSideBarSelectionManager _updateSidebarSelection](self, "_updateSidebarSelection");
  }

}

- (void)setCurrentContext:(id)a3
{
  id v5;

  v5 = a3;
  if (!-[HUDashboardContext isEqual:](self->_currentContext, "isEqual:"))
  {
    objc_storeStrong((id *)&self->_currentContext, a3);
    -[HUSideBarSelectionManager _updateSidebarSelection](self, "_updateSidebarSelection");
  }

}

- (HFItem)currentSelectedItem
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;

  -[HUSideBarSelectionManager currentTabIdentifier](self, "currentTabIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D306D8]);

  if (v4)
  {
    -[HUSideBarSelectionManager sideBarItemManager](self, "sideBarItemManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "automationItem");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[HUSideBarSelectionManager currentTabIdentifier](self, "currentTabIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0D306C8]);

    if (!v8)
    {
      -[HUSideBarSelectionManager currentContext](self, "currentContext");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "room");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
      {
        -[HUSideBarSelectionManager sideBarItemManager](self, "sideBarItemManager");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        -[HUSideBarSelectionManager currentContext](self, "currentContext");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "room");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "roomItemForRoom:", v13);
        v14 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        -[HUSideBarSelectionManager currentContext](self, "currentContext");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "accessoryTypeGroup");
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        -[HUSideBarSelectionManager sideBarItemManager](self, "sideBarItemManager");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = v17;
        if (!v16)
        {
          objc_msgSend(v17, "homeItem");
          v6 = objc_claimAutoreleasedReturnValue();
          goto LABEL_5;
        }
        -[HUSideBarSelectionManager currentContext](self, "currentContext");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "accessoryTypeGroup");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "categoryItemForCategory:", v13);
        v14 = objc_claimAutoreleasedReturnValue();
      }
      v9 = (void *)v14;

      goto LABEL_11;
    }
    -[HUSideBarSelectionManager sideBarItemManager](self, "sideBarItemManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "discoverItem");
    v6 = objc_claimAutoreleasedReturnValue();
  }
LABEL_5:
  v9 = (void *)v6;
LABEL_11:

  return (HFItem *)v9;
}

- (void)_updateSidebarSelection
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  -[HUSideBarSelectionManager _updateAppearanceForSidebar](self, "_updateAppearanceForSidebar");
  -[HUSideBarSelectionManager delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contextDidUpdate");

  -[HUSideBarSelectionManager currentTabIdentifier](self, "currentTabIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0D306D8]);

  if (v5)
  {
    -[HUSideBarSelectionManager _didUpdateToAutomationTab](self, "_didUpdateToAutomationTab");
    return;
  }
  -[HUSideBarSelectionManager currentTabIdentifier](self, "currentTabIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0D306C8]);

  if (v7)
  {
    -[HUSideBarSelectionManager _didUpdateToDiscoverTab](self, "_didUpdateToDiscoverTab");
    return;
  }
  -[HUSideBarSelectionManager currentContext](self, "currentContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "accessoryTypeGroup");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUSideBarSelectionManager currentContext](self, "currentContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v10;
  if (v9)
  {
    objc_msgSend(v10, "accessoryTypeGroup");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUSideBarSelectionManager _didUpdateToTabForCategory:](self, "_didUpdateToTabForCategory:", v11);
LABEL_9:

    return;
  }
  objc_msgSend(v10, "room");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[HUSideBarSelectionManager currentContext](self, "currentContext");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "room");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUSideBarSelectionManager _didUpdateToTabForRoom:](self, "_didUpdateToTabForRoom:", v11);
    goto LABEL_9;
  }
  -[HUSideBarSelectionManager _didUpdateToHomeTab](self, "_didUpdateToHomeTab");
}

- (void)_didUpdateToHomeTab
{
  void *v3;
  void *v4;
  id v5;

  -[HUSideBarSelectionManager sideBarItemManager](self, "sideBarItemManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "homeItem");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  -[HUSideBarSelectionManager sideBarViewController](self, "sideBarViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "updateSelectionToItem:", v5);

}

- (void)_didUpdateToTabForCategory:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[HUSideBarSelectionManager sideBarItemManager](self, "sideBarItemManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "categoryItemForCategory:", v4);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  -[HUSideBarSelectionManager sideBarViewController](self, "sideBarViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "updateSelectionToItem:", v7);

}

- (void)_didUpdateToTabForRoom:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[HUSideBarSelectionManager sideBarItemManager](self, "sideBarItemManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "roomItemForRoom:", v4);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  -[HUSideBarSelectionManager sideBarViewController](self, "sideBarViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "updateSelectionToItem:", v7);

}

- (void)_didUpdateToDiscoverTab
{
  void *v3;
  void *v4;
  id v5;

  -[HUSideBarSelectionManager sideBarItemManager](self, "sideBarItemManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "discoverItem");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  -[HUSideBarSelectionManager sideBarViewController](self, "sideBarViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "updateSelectionToItem:", v5);

}

- (void)_didUpdateToAutomationTab
{
  void *v3;
  void *v4;
  id v5;

  -[HUSideBarSelectionManager sideBarItemManager](self, "sideBarItemManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "automationItem");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  -[HUSideBarSelectionManager sideBarViewController](self, "sideBarViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "updateSelectionToItem:", v5);

}

- (void)_updateAppearanceForSidebar
{
  uint64_t v3;
  void *v4;
  id v5;

  -[HUSideBarSelectionManager currentTabIdentifier](self, "currentTabIdentifier");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0D306D0]);
  -[HUSideBarSelectionManager sideBarViewController](self, "sideBarViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setShouldUseDashboardEffects:", v3);

}

- (NSString)currentTabIdentifier
{
  return self->_currentTabIdentifier;
}

- (HUDashboardContext)currentContext
{
  return self->_currentContext;
}

- (HUSideBarViewController)sideBarViewController
{
  return self->_sideBarViewController;
}

- (void)setSideBarViewController:(id)a3
{
  objc_storeStrong((id *)&self->_sideBarViewController, a3);
}

- (HUSideBarItemManager)sideBarItemManager
{
  return self->_sideBarItemManager;
}

- (void)setSideBarItemManager:(id)a3
{
  objc_storeStrong((id *)&self->_sideBarItemManager, a3);
}

- (HUSideBarSelectionManagerDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_sideBarItemManager, 0);
  objc_storeStrong((id *)&self->_sideBarViewController, 0);
  objc_storeStrong((id *)&self->_currentContext, 0);
  objc_storeStrong((id *)&self->_currentTabIdentifier, 0);
}

@end
