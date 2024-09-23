@implementation UIMenu

id __99__UIMenu_RecentlyClosedTabs__safari_recentlyClosedTabsMenuForProfile_showProfileTitle_openHandler___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;

  objc_msgSend(MEMORY[0x1E0DC39D0], "safari_recentlyClosedTabsMenuItemsForProfile:openHandler:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "safari_mapAndFilterObjectsUsingBlock:", &__block_literal_global_7);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

id __99__UIMenu_RecentlyClosedTabs__safari_recentlyClosedTabsMenuForProfile_showProfileTitle_openHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v2 = a2;
  v3 = (void *)MEMORY[0x1E0DC3428];
  objc_msgSend(v2, "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __99__UIMenu_RecentlyClosedTabs__safari_recentlyClosedTabsMenuForProfile_showProfileTitle_openHandler___block_invoke_3;
  v9[3] = &unk_1E9CF3058;
  v10 = v2;
  v5 = v2;
  objc_msgSend(v3, "actionWithTitle:image:identifier:handler:", v4, 0, 0, v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "subtitle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDiscoverabilityTitle:", v7);

  return v6;
}

void __99__UIMenu_RecentlyClosedTabs__safari_recentlyClosedTabsMenuForProfile_showProfileTitle_openHandler___block_invoke_3(uint64_t a1)
{
  void *v2;
  void (**v3)(void);

  objc_msgSend(*(id *)(a1 + 32), "action");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "action");
    v3 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v3[2]();

  }
}

MenuItemModel *__87__UIMenu_RecentlyClosedTabs__safari_recentlyClosedTabsMenuItemsForProfile_openHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  MenuItemModel *v9;
  void *v10;
  void *v11;
  MenuItemModel *v12;
  _QWORD v14[4];
  id v15;
  id v16;

  v3 = a2;
  objc_msgSend(v3, "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(v3, "url");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "safari_URLWithDataAsString:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "safari_stringForListDisplay");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "length") || objc_msgSend(v8, "length"))
  {
    v9 = [MenuItemModel alloc];
    if (objc_msgSend(v4, "length"))
      v10 = v4;
    else
      v10 = v8;
    if (objc_msgSend(v4, "length"))
      v11 = v8;
    else
      v11 = 0;
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __87__UIMenu_RecentlyClosedTabs__safari_recentlyClosedTabsMenuItemsForProfile_openHandler___block_invoke_2;
    v14[3] = &unk_1E9CF26B8;
    v15 = v3;
    v16 = *(id *)(a1 + 32);
    v12 = -[MenuItemModel initWithTitle:subtitle:payload:action:](v9, "initWithTitle:subtitle:payload:action:", v10, v11, v15, v14);

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

uint64_t __87__UIMenu_RecentlyClosedTabs__safari_recentlyClosedTabsMenuItemsForProfile_openHandler___block_invoke_2(uint64_t a1)
{
  void *v2;

  objc_msgSend(MEMORY[0x1E0D4EF28], "sharedBrowserSavedState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "loadSessionStateDataAndRemoveRecentlyClosedTab:", *(_QWORD *)(a1 + 32));

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

@end
