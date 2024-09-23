@implementation HUAccessorySceneListViewController

- (HUAccessorySceneListViewController)initWithServiceLikeItem:(id)a3
{
  id v4;
  HUAccessorySceneListItemManager *v5;
  HUAccessorySceneListViewController *v6;
  HUAccessorySceneListContentViewController *v7;
  HUAccessorySceneListContentViewController *existingSceneListContentViewController;
  HUAccessorySceneListContentViewController *v9;
  HUAccessorySceneListContentViewController *suggestedSceneListContentViewController;
  void *v11;
  objc_super v13;

  v4 = a3;
  v5 = -[HUAccessorySceneListItemManager initWithDelegate:serviceLikeItem:]([HUAccessorySceneListItemManager alloc], "initWithDelegate:serviceLikeItem:", self, v4);
  v13.receiver = self;
  v13.super_class = (Class)HUAccessorySceneListViewController;
  v6 = -[HUItemTableViewController initWithItemManager:tableViewStyle:](&v13, sel_initWithItemManager_tableViewStyle_, v5, 1);
  if (v6)
  {
    v7 = -[HUAccessorySceneListContentViewController initWithServiceLikeItem:contentSource:selectionType:]([HUAccessorySceneListContentViewController alloc], "initWithServiceLikeItem:contentSource:selectionType:", v4, 0, 0);
    existingSceneListContentViewController = v6->_existingSceneListContentViewController;
    v6->_existingSceneListContentViewController = v7;

    -[HUAccessorySceneListContentViewController setIncludeTopMargin:](v6->_existingSceneListContentViewController, "setIncludeTopMargin:", 0);
    -[HUAccessorySceneListContentViewController setAnalyticsPresentationContext:](v6->_suggestedSceneListContentViewController, "setAnalyticsPresentationContext:", CFSTR("accessory-scene-list"));
    v9 = -[HUAccessorySceneListContentViewController initWithServiceLikeItem:contentSource:selectionType:]([HUAccessorySceneListContentViewController alloc], "initWithServiceLikeItem:contentSource:selectionType:", v4, 1, 0);
    suggestedSceneListContentViewController = v6->_suggestedSceneListContentViewController;
    v6->_suggestedSceneListContentViewController = v9;

    -[HUAccessorySceneListContentViewController setIncludeTopMargin:](v6->_suggestedSceneListContentViewController, "setIncludeTopMargin:", 0);
    -[HUAccessorySceneListContentViewController setAnalyticsPresentationContext:](v6->_suggestedSceneListContentViewController, "setAnalyticsPresentationContext:", CFSTR("accessory-scene-list"));
    _HULocalizedStringWithDefaultValue(CFSTR("HUAccessorySceneListViewTitle"), CFSTR("HUAccessorySceneListViewTitle"), 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUAccessorySceneListViewController setTitle:](v6, "setTitle:", v11);

  }
  return v6;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HUAccessorySceneListViewController;
  -[HUItemTableViewController viewDidLoad](&v8, sel_viewDidLoad);
  -[HUAccessorySceneListViewController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSeparatorStyle:", 0);

  -[HUAccessorySceneListViewController existingSceneListContentViewController](self, "existingSceneListContentViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setScrollEnabled:", 0);

  -[HUAccessorySceneListViewController suggestedSceneListContentViewController](self, "suggestedSceneListContentViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "collectionView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setScrollEnabled:", 0);

}

- (Class)cellClassForItem:(id)a3 indexPath:(id)a4
{
  id v4;

  v4 = a3;
  objc_opt_class();
  objc_opt_isKindOfClass();

  return (Class)(id)objc_opt_class();
}

- (void)updateCell:(id)a3 forItem:(id)a4 indexPath:(id)a5 animated:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  objc_super v25;

  v6 = a6;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v13 = v10;
    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setBackgroundColor:", v14);

    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "contentView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setBackgroundColor:", v15);

    -[HUItemTableViewController itemManager](self, "itemManager");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "existingScenesContentItem");
    v18 = (id)objc_claimAutoreleasedReturnValue();

    if (v18 == v11)
    {
      -[HUAccessorySceneListViewController existingSceneListContentViewController](self, "existingSceneListContentViewController");
      v21 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[HUItemTableViewController itemManager](self, "itemManager");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "suggestedScenesContentItem");
      v20 = (id)objc_claimAutoreleasedReturnValue();

      if (v20 != v11)
      {
LABEL_7:
        objc_msgSend(v11, "latestResults");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "objectForKeyedSubscript:", *MEMORY[0x1E0D30BA0]);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setAccessibilityIdentifier:", v24);

        goto LABEL_8;
      }
      -[HUAccessorySceneListViewController suggestedSceneListContentViewController](self, "suggestedSceneListContentViewController");
      v21 = objc_claimAutoreleasedReturnValue();
    }
    v22 = (void *)v21;
    objc_msgSend(v13, "setViewController:", v21);

    goto LABEL_7;
  }
LABEL_8:
  v25.receiver = self;
  v25.super_class = (Class)HUAccessorySceneListViewController;
  -[HUItemTableViewController updateCell:forItem:indexPath:animated:](&v25, sel_updateCell_forItem_indexPath_animated_, v10, v11, v12, v6);

}

- (id)childViewControllersToPreload
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_opt_new();
  -[HUAccessorySceneListViewController existingSceneListContentViewController](self, "existingSceneListContentViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "na_safeAddObject:", v4);

  -[HUAccessorySceneListViewController suggestedSceneListContentViewController](self, "suggestedSceneListContentViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "na_safeAddObject:", v5);

  return v3;
}

- (HUAccessorySceneListContentViewController)existingSceneListContentViewController
{
  return self->_existingSceneListContentViewController;
}

- (void)setExistingSceneListContentViewController:(id)a3
{
  objc_storeStrong((id *)&self->_existingSceneListContentViewController, a3);
}

- (HUAccessorySceneListContentViewController)suggestedSceneListContentViewController
{
  return self->_suggestedSceneListContentViewController;
}

- (void)setSuggestedSceneListContentViewController:(id)a3
{
  objc_storeStrong((id *)&self->_suggestedSceneListContentViewController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestedSceneListContentViewController, 0);
  objc_storeStrong((id *)&self->_existingSceneListContentViewController, 0);
}

@end
