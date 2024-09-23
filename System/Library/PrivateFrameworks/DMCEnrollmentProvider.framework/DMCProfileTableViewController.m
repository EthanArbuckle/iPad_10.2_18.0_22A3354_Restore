@implementation DMCProfileTableViewController

- (DMCProfileTableViewController)init
{
  DMCProfileTableViewController *v2;
  DMCProfileTableViewController *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)DMCProfileTableViewController;
  v2 = -[DMCProfileTableViewController init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    -[DMCProfileTableViewController tableView](v2, "tableView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setCellLayoutMarginsFollowReadableWidth:", 1);

  }
  return v3;
}

- (DMCProfileTableViewController)initWithStyle:(int64_t)a3
{
  DMCProfileTableViewController *v3;
  DMCProfileTableViewController *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)DMCProfileTableViewController;
  v3 = -[DMCProfileTableViewController initWithStyle:](&v7, sel_initWithStyle_, a3);
  v4 = v3;
  if (v3)
  {
    -[DMCProfileTableViewController tableView](v3, "tableView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setCellLayoutMarginsFollowReadableWidth:", 1);

  }
  return v4;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)DMCProfileTableViewController;
  -[DMCProfileTableViewController dealloc](&v4, sel_dealloc);
}

- (BOOL)canBeShownFromSuspendedState
{
  return 1;
}

- (void)updateExtendedLayoutIncludesOpaqueBars
{
  id v3;

  objc_msgSend(MEMORY[0x24BE75530], "appearance");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[DMCProfileTableViewController setExtendedLayoutIncludesOpaqueBars:](self, "setExtendedLayoutIncludesOpaqueBars:", objc_msgSend(v3, "extendedLayoutIncludesOpaqueBars"));

}

- (void)reloadTableOnContentSizeCategoryChange
{
  id v3;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__contentSizeCategoryDidChangeNotification_, *MEMORY[0x24BDF7670], 0);

}

- (void)_contentSizeCategoryDidChangeNotification:(id)a3
{
  id v3;

  -[DMCProfileTableViewController tableView](self, "tableView", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "reloadData");

}

- (void)presentViewController:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[DMCProfileTableViewController navigationController](self, "navigationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[DMCProfileTableViewController navigationController](self, "navigationController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "pushViewController:animated:", v6, 1);

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[DMCProfileTableViewController pushViewController:animated:](self, "pushViewController:animated:", v6, 1);
    else
      -[DMCProfileTableViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v6, 1, 0);
  }

}

- (void)showProgressInNavBar
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  objc_msgSend(MEMORY[0x24BDD17C8], "DMCMakeUUID");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithPointer:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  viewControllerPointerToIdentifierMap();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, v3);

  objc_msgSend(MEMORY[0x24BE75558], "sharedSpinnerManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[DMCProfileTableViewController navigationItem](self, "navigationItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "startAnimatingInNavItem:forIdentifier:hideBackButton:", v6, v8, 1);

  -[DMCProfileTableViewController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setUserInteractionEnabled:", 0);

}

- (void)hideProgressInNavBarShowBackButton:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithPointer:", self);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  viewControllerPointerToIdentifierMap();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    viewControllerPointerToIdentifierMap();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeObjectForKey:", v11);

    objc_msgSend(MEMORY[0x24BE75558], "sharedSpinnerManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stopAnimatingForIdentifier:", v6);

    if (v3)
    {
      -[DMCProfileTableViewController navigationItem](self, "navigationItem");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setHidesBackButton:animated:", 0, 1);

    }
  }
  -[DMCProfileTableViewController view](self, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setUserInteractionEnabled:", 1);

}

@end
