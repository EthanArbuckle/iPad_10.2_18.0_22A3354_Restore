@implementation DOCAXIdentifier

+ (id)sortByMenuButtonForSortIdentifier:(id)a3 ascending:(BOOL)a4 active:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  void *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v5 = a5;
  v6 = a4;
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithObject:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v5)
  {
    if (v6)
      v10 = CFSTR("ascending");
    else
      v10 = CFSTR("descending");
    objc_msgSend(v8, "addObject:", v10);
  }
  objc_msgSend(a1, "idBase");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  composedID(v11, CFSTR("sortMenuButton"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "componentsJoinedByString:", CFSTR("."));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  composedID(v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (id)idBase
{
  return CFSTR("DOC");
}

+ (NSString)fullNavBar
{
  return (NSString *)CFSTR("FullDocumentManagerViewControllerNavigationBar");
}

+ (NSString)browsingModeTabBar
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "idBase");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  composedID(v2, CFSTR("browsingModeTabBar"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

+ (id)browsingRootIdentifierForSourceIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = (void *)MEMORY[0x24BDBCEB8];
  objc_msgSend(a1, "browsingRoot");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "arrayWithObject:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "length"))
    objc_msgSend(v7, "addObject:", v4);
  objc_msgSend(v7, "componentsJoinedByString:", CFSTR(" "));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (NSString)browsingRoot
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "idBase");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  composedID(v2, CFSTR("browsingRoot"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

+ (id)itemCollectionMenuButtonShowing:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  objc_msgSend(a1, "idBase");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  composedID(v5, CFSTR("itemCollectionMenuButton"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  composedID(v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (Class)sidebar
{
  return (Class)objc_opt_class();
}

+ (Class)itemInfoView
{
  return (Class)objc_opt_class();
}

+ (Class)viewStyleSelector
{
  return (Class)objc_opt_class();
}

+ (Class)navBarButton
{
  return (Class)objc_opt_class();
}

+ (NSString)itemCollectionView
{
  return (NSString *)CFSTR("File View");
}

+ (id)searchMenuButtonShowing:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a1, "idBase");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  composedID(v5, CFSTR("searchMenuButton"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    composedID(v6, v4);
    v7 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v7;
  }

  return v6;
}

+ (id)sortByHeaderButtonForSortIdentifier:(id)a3 ascending:(BOOL)a4 active:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  void *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v5 = a5;
  v6 = a4;
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithObject:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v5)
  {
    if (v6)
      v10 = CFSTR("ascending");
    else
      v10 = CFSTR("descending");
    objc_msgSend(v8, "addObject:", v10);
  }
  objc_msgSend(a1, "idBase");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  composedID(v11, CFSTR("sortHeaderButton"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "componentsJoinedByString:", CFSTR("."));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  composedID(v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (NSString)sizeSettingMenuButton
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "sizeSettingPrefix");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  composedID(CFSTR("DOCMenuPresentingButton"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

+ (id)sizeSettingMenuItemForSize:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  objc_msgSend(a1, "idBase");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  composedID(v5, CFSTR("sizeSettingMenuItemButton"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  composedID(v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (NSString)groupByMenuButton
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "groupByPrefix");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  composedID(CFSTR("DOCMenuPresentingButton"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

+ (id)groupByMenuItemForGrouping:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  objc_msgSend(a1, "idBase");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  composedID(v5, CFSTR("groupMenuItemButton"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  composedID(v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (NSString)sortByMenuButton
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "sortByPrefix");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  composedID(CFSTR("DOCMenuPresentingButton"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

+ (id)sortByMenuItemForSortMode:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  objc_msgSend(a1, "idBase");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  composedID(v5, CFSTR("sortMenuItemButton"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  composedID(v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (NSString)inlineRenameField
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "idBase");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  composedID(v2, CFSTR("inlineRenameField"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

+ (NSString)itemInfoNavigationRoot
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "idBase");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  composedID(v2, CFSTR("itemInfoNavigationRoot"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

+ (NSString)tagEditorContainer
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "idBase");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  composedID(v2, CFSTR("tagEditorContainer"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

+ (NSString)viewOptionsRoot
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "idBase");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  composedID(v2, CFSTR("viewOptionsRoot"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

+ (NSString)showFilenameExtensions
{
  return (NSString *)CFSTR("Show All Filename Extensions");
}

+ (id)sortByPrefix
{
  return CFSTR("Sort By");
}

+ (id)groupByPrefix
{
  return CFSTR("Group By");
}

+ (id)sizeSettingPrefix
{
  return CFSTR("Icon and List Size");
}

@end
