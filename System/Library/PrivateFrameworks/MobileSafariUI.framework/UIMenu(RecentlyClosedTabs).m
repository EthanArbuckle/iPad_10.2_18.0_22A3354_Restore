@implementation UIMenu(RecentlyClosedTabs)

+ (id)safari_recentlyClosedTabsMenuForProfile:()RecentlyClosedTabs showProfileTitle:openHandler:
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  _QWORD v19[4];
  id v20;
  id v21;

  v7 = a3;
  v8 = a5;
  _WBSLocalizedString();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (a4)
  {
    v10 = (void *)MEMORY[0x1E0CB3940];
    _WBSLocalizedString();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "title");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringWithFormat:", v11, v12);
    v13 = objc_claimAutoreleasedReturnValue();

    v9 = (void *)v13;
  }
  v14 = (void *)MEMORY[0x1E0DC39D0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __99__UIMenu_RecentlyClosedTabs__safari_recentlyClosedTabsMenuForProfile_showProfileTitle_openHandler___block_invoke;
  v19[3] = &unk_1E9CF3080;
  v20 = v7;
  v21 = v8;
  v15 = v8;
  v16 = v7;
  objc_msgSend(v14, "safari_menuWithTitle:image:identifier:options:uncachedChildrenProvider:", v9, 0, 0, 9, v19);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

+ (id)safari_recentlyClosedTabsMenuItemsForProfile:()RecentlyClosedTabs openHandler:
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  _QWORD v14[4];
  id v15;

  v5 = a4;
  v6 = (void *)MEMORY[0x1E0D4EF28];
  v7 = a3;
  objc_msgSend(v6, "sharedBrowserSavedState");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "recentlyClosedTabsForProfileWithIdentifier:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __87__UIMenu_RecentlyClosedTabs__safari_recentlyClosedTabsMenuItemsForProfile_openHandler___block_invoke;
  v14[3] = &unk_1E9CF30A8;
  v15 = v5;
  v11 = v5;
  objc_msgSend(v10, "safari_mapAndFilterObjectsUsingBlock:", v14);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

@end
