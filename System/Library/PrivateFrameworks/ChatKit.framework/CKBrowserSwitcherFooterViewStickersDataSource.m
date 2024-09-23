@implementation CKBrowserSwitcherFooterViewStickersDataSource

- (CKBrowserSwitcherFooterViewStickersDataSource)init
{
  CKBrowserSwitcherFooterViewStickersDataSource *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CKBrowserSwitcherFooterViewStickersDataSource;
  v2 = -[CKBrowserSwitcherFooterViewStickersDataSource init](&v5, sel_init);
  if (v2)
  {
    +[CKBalloonPluginManager sharedInstance](CKBalloonPluginManager, "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "updateAppInstallations");

  }
  return v2;
}

- (unint64_t)numberOfPluginsInSwitcherView:(id)a3 forSection:(unint64_t)a4
{
  void *v4;
  void *v5;
  unint64_t v6;

  if (a4)
    return 0;
  -[CKBrowserSwitcherFooterViewStickersDataSource pluginManager](self, "pluginManager", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "combinedStickerApps");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  return v6;
}

- (id)switcherView:(id)a3 modelAtIndexPath:(id)a4 type:(int64_t *)a5
{
  id v7;
  void *v8;
  void *v9;
  unint64_t v10;
  void *v11;
  int64_t v12;
  id v13;

  v7 = a4;
  -[CKBrowserSwitcherFooterViewStickersDataSource pluginManager](self, "pluginManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "orderedCombinedStickerApps");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v7, "item");
  if (v10 >= objc_msgSend(v9, "count"))
  {
    v12 = 0;
    v13 = 0;
    if (!a5)
      goto LABEL_12;
    goto LABEL_11;
  }
  objc_msgSend(v9, "objectAtIndexedSubscript:", objc_msgSend(v7, "item"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v12 = 1;
LABEL_8:
    v13 = v11;
    goto LABEL_10;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v12 = 2;
    goto LABEL_8;
  }
  v12 = 0;
  v13 = 0;
LABEL_10:

  if (a5)
LABEL_11:
    *a5 = v12;
LABEL_12:

  return v13;
}

- (id)switcherView:(id)a3 indexPathOfModelWithIdentifier:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;

  v5 = a4;
  -[CKBrowserSwitcherFooterViewStickersDataSource pluginManager](self, "pluginManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "combinedStickersAppsIndexPathMap");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = v8;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", 0x7FFFFFFFFFFFFFFFLL, 0x7FFFFFFFFFFFFFFFLL);
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  v10 = v9;

  return v10;
}

- (id)pluginManager
{
  return +[CKBalloonPluginManager sharedInstance](CKBalloonPluginManager, "sharedInstance");
}

@end
