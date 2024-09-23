@implementation HUMatterConnectedEcosystemDetailViewController

- (HUMatterConnectedEcosystemDetailViewController)initWithConnectedEcosystem:(id)a3 connectedEcosystemItemProvider:(id)a4
{
  id v6;
  id v7;
  HUMatterConnectedEcosystemDetailItemManager *v8;
  HUMatterConnectedEcosystemDetailViewController *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  v8 = -[HUMatterConnectedEcosystemDetailItemManager initWithConnectedEcosystem:connectedEcosystemItemProvider:delegate:]([HUMatterConnectedEcosystemDetailItemManager alloc], "initWithConnectedEcosystem:connectedEcosystemItemProvider:delegate:", v6, v7, self);

  v13.receiver = self;
  v13.super_class = (Class)HUMatterConnectedEcosystemDetailViewController;
  v9 = -[HUItemTableViewController initWithItemManager:tableViewStyle:](&v13, sel_initWithItemManager_tableViewStyle_, v8, 1);
  if (v9)
  {
    objc_msgSend(v6, "vendor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "name");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUMatterConnectedEcosystemDetailViewController setTitle:](v9, "setTitle:", v11);

  }
  return v9;
}

- (Class)cellClassForItem:(id)a3 indexPath:(id)a4
{
  id v4;

  v4 = a3;
  objc_opt_class();
  objc_opt_isKindOfClass();

  return (Class)(id)objc_opt_class();
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  return 0;
}

- (void)setupCell:(id)a3 forItem:(id)a4 indexPath:(id)a5
{
  id v8;
  id v9;
  void *v10;
  objc_super v11;

  v8 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HUMatterConnectedEcosystemDetailViewController;
  -[HUItemTableViewController setupCell:forItem:indexPath:](&v11, sel_setupCell_forItem_indexPath_, v8, a4, a5);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = v8;
    objc_msgSend(v9, "setIconDisplayStyle:", 1);
    +[HUIconCellContentMetrics compactMetrics](HUIconCellContentMetrics, "compactMetrics");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setContentMetrics:", v10);

    objc_msgSend(v9, "setDisableContinuousIconAnimation:", 1);
    objc_msgSend(v9, "setHideDescription:", 1);

  }
}

- (BOOL)shouldHideHeaderAboveSection:(int64_t)a3
{
  return a3 == 0;
}

- (BOOL)shouldHideFooterBelowSection:(int64_t)a3
{
  return a3 == 0;
}

- (id)finishPresentation:(id)a3 animated:(BOOL)a4
{
  void *v4;
  id v5;

  -[HUMatterConnectedEcosystemDetailViewController navigationController](self, "navigationController", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v4, "popViewControllerAnimated:", 1);

  return (id)objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
}

@end
