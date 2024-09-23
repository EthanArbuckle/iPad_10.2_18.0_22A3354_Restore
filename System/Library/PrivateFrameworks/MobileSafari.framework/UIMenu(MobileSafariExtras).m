@implementation UIMenu(MobileSafariExtras)

+ (uint64_t)safari_menuWithTitle:()MobileSafariExtras uncachedChildrenProvider:
{
  return objc_msgSend(a1, "safari_menuWithTitle:image:identifier:options:uncachedChildrenProvider:", a3, 0, 0, 0, a4);
}

+ (id)safari_menuWithTitle:()MobileSafariExtras image:identifier:options:uncachedChildrenProvider:
{
  id v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v22[4];
  id v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v11 = a7;
  v12 = (void *)MEMORY[0x1E0DC36F8];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __101__UIMenu_MobileSafariExtras__safari_menuWithTitle_image_identifier_options_uncachedChildrenProvider___block_invoke;
  v22[3] = &unk_1E21E73D8;
  v23 = v11;
  v13 = v11;
  v14 = a5;
  v15 = a4;
  v16 = a3;
  objc_msgSend(v12, "elementWithUncachedProvider:", v22);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)MEMORY[0x1E0DC39D0];
  v24[0] = v17;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "menuWithTitle:image:identifier:options:children:", v16, v15, v14, a6, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

+ (uint64_t)safari_menuWithUncachedChildrenProvider:()MobileSafariExtras
{
  return objc_msgSend(a1, "safari_menuWithTitle:image:identifier:options:uncachedChildrenProvider:", &stru_1E21FE780, 0, 0, 0, a3);
}

+ (uint64_t)sf_tabMenu
{
  return objc_msgSend(a1, "sf_tabMenuWithAdditionalChildrenProvider:", 0);
}

+ (id)sf_tabMenuWithAdditionalChildrenProvider:()MobileSafariExtras
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v3 = a3;
  v4 = (void *)MEMORY[0x1E0DC39D0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __71__UIMenu_MobileSafariExtras__sf_tabMenuWithAdditionalChildrenProvider___block_invoke;
  v8[3] = &unk_1E21E7440;
  v9 = v3;
  v5 = v3;
  objc_msgSend(v4, "safari_menuWithTitle:image:identifier:options:cachedChildrenProvider:", &stru_1E21FE780, 0, 0, 1, v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)safari_menuWithTitle:()MobileSafariExtras image:identifier:options:cachedChildrenProvider:
{
  id v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v22[4];
  id v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v11 = a7;
  v12 = (void *)MEMORY[0x1E0DC36F8];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __99__UIMenu_MobileSafariExtras__safari_menuWithTitle_image_identifier_options_cachedChildrenProvider___block_invoke;
  v22[3] = &unk_1E21E73D8;
  v23 = v11;
  v13 = v11;
  v14 = a5;
  v15 = a4;
  v16 = a3;
  objc_msgSend(v12, "elementWithProvider:", v22);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)MEMORY[0x1E0DC39D0];
  v24[0] = v17;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "menuWithTitle:image:identifier:options:children:", v16, v15, v14, a6, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

+ (uint64_t)sf_bookmarkMenu
{
  return objc_msgSend(MEMORY[0x1E0DC39D0], "safari_menuWithTitle:image:identifier:options:cachedChildrenProvider:", &stru_1E21FE780, 0, 0, 1, &__block_literal_global_63);
}

+ (uint64_t)safari_menuWithCachedChildrenProvider:()MobileSafariExtras
{
  return objc_msgSend(a1, "safari_menuWithTitle:image:identifier:options:cachedChildrenProvider:", &stru_1E21FE780, 0, 0, 0, a3);
}

+ (uint64_t)safari_menuWithTitle:()MobileSafariExtras cachedChildrenProvider:
{
  return objc_msgSend(a1, "safari_menuWithTitle:image:identifier:options:cachedChildrenProvider:", a3, 0, 0, 0, a4);
}

+ (id)sf_bookmarkMenuChildrenProvider
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v13;
  _QWORD v14[4];

  v14[3] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0DC3678];
  _WBSLocalizedString();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("eyeglasses"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "commandWithTitle:image:action:propertyList:", v13, v1, sel_addToReadingList_, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v2;
  v3 = (void *)MEMORY[0x1E0DC3678];
  _WBSLocalizedString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("book"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "commandWithTitle:image:action:propertyList:", v4, v5, sel_addToBookmarks_, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v6;
  v7 = (void *)MEMORY[0x1E0DC3678];
  _WBSLocalizedString();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("book"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "commandWithTitle:image:action:propertyList:", v8, v9, sel_addAllTabsToBookmarks_, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[2] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

@end
