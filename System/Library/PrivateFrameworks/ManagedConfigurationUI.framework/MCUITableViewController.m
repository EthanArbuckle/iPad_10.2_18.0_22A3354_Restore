@implementation MCUITableViewController

- (MCUITableViewController)init
{
  MCUITableViewController *v2;
  MCUITableViewController *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MCUITableViewController;
  v2 = -[MCUITableViewController init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    -[MCUITableViewController tableView](v2, "tableView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setCellLayoutMarginsFollowReadableWidth:", 1);

  }
  return v3;
}

- (MCUITableViewController)initWithStyle:(int64_t)a3
{
  MCUITableViewController *v3;
  MCUITableViewController *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MCUITableViewController;
  v3 = -[MCUITableViewController initWithStyle:](&v7, sel_initWithStyle_, a3);
  v4 = v3;
  if (v3)
  {
    -[MCUITableViewController tableView](v3, "tableView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setCellLayoutMarginsFollowReadableWidth:", 1);

  }
  return v4;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)MCUITableViewController;
  -[MCUITableViewController dealloc](&v4, sel_dealloc);
}

- (BOOL)canBeShownFromSuspendedState
{
  return 1;
}

- (void)updateExtendedLayoutIncludesOpaqueBars
{
  id v3;

  objc_msgSend(MEMORY[0x1E0D804B8], "appearance");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[MCUITableViewController setExtendedLayoutIncludesOpaqueBars:](self, "setExtendedLayoutIncludesOpaqueBars:", objc_msgSend(v3, "extendedLayoutIncludesOpaqueBars"));

}

- (void)reloadTableOnContentSizeCategoryChange
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__contentSizeCategoryDidChangeNotification_, *MEMORY[0x1E0CEB3F0], 0);

}

- (void)_contentSizeCategoryDidChangeNotification:(id)a3
{
  id v3;

  -[MCUITableViewController tableView](self, "tableView", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "reloadData");

}

@end
