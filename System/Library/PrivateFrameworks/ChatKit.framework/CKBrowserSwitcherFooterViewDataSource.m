@implementation CKBrowserSwitcherFooterViewDataSource

- (CKBrowserSwitcherFooterViewDataSource)init
{
  CKBrowserSwitcherFooterViewDataSource *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CKBrowserSwitcherFooterViewDataSource;
  v2 = -[CKBrowserSwitcherFooterViewDataSource init](&v5, sel_init);
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
  id v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;

  v6 = a3;
  if (a4)
  {
    if (a4 != 1)
    {
      v10 = 0;
      goto LABEL_7;
    }
    -[CKBrowserSwitcherFooterViewDataSource pluginManager](self, "pluginManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "visibleRecentAppStripPlugins");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[CKBrowserSwitcherFooterViewDataSource pluginManager](self, "pluginManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "visibleFavoriteAppStripPlugins");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;
  v10 = objc_msgSend(v8, "count");

LABEL_7:
  return v10;
}

- (id)switcherView:(id)a3 modelAtIndexPath:(id)a4 type:(int64_t *)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  unint64_t v13;
  void *v14;
  int64_t v15;
  id v16;

  v7 = a4;
  -[CKBrowserSwitcherFooterViewDataSource pluginManager](self, "pluginManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "visibleFavoriteAppStripPlugins");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "visibleRecentAppStripPlugins");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "section"))
    v11 = v10;
  else
    v11 = v9;
  v12 = v11;
  v13 = objc_msgSend(v7, "item");
  if (v13 >= objc_msgSend(v12, "count"))
  {
    v15 = 0;
    v16 = 0;
    if (!a5)
      goto LABEL_15;
    goto LABEL_14;
  }
  objc_msgSend(v12, "objectAtIndexedSubscript:", objc_msgSend(v7, "item"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v15 = 1;
LABEL_11:
    v16 = v14;
    goto LABEL_13;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v15 = 2;
    goto LABEL_11;
  }
  v15 = 0;
  v16 = 0;
LABEL_13:

  if (a5)
LABEL_14:
    *a5 = v15;
LABEL_15:

  return v16;
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
  -[CKBrowserSwitcherFooterViewDataSource pluginManager](self, "pluginManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pluginIndexPathMap");
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
