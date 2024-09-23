@implementation MSTrackListViewController

- (MSTrackListViewController)init
{
  MSTrackListViewController *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MSTrackListViewController;
  v2 = -[MSStructuredPageViewController init](&v5, sel_init);
  if (v2)
  {
    -[SUStructuredPageViewController setDataSourceClass:](v2, "setDataSourceClass:", objc_opt_class());
    -[SUTableViewController setTableViewStyle:](v2, "setTableViewStyle:", 0);
    v3 = (void *)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel__restrictionsChangedNotification_, *MEMORY[0x24BE63740], 0);
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel__webViewsLoaded_, *MEMORY[0x24BEC8E88], 0);
  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BE63740], 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BEC8E88], 0);
  -[MSTrackListHeaderView setDelegate:](self->_headerView, "setDelegate:", 0);

  self->_headerView = 0;
  v4.receiver = self;
  v4.super_class = (Class)MSTrackListViewController;
  -[MSStructuredPageViewController dealloc](&v4, sel_dealloc);
}

- (id)newTermsAndConditionsFooter
{
  return 0;
}

- (void)loadView
{
  UITableView *v3;
  MSTrackListHeaderView *headerView;
  double v5;
  double v6;
  double v7;
  double v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MSTrackListViewController;
  -[SUTableViewController loadView](&v9, sel_loadView);
  v3 = -[SUTableViewController tableView](self, "tableView");
  -[UITableView setBackgroundColor:](v3, "setBackgroundColor:", MSGetTrackListOddRowColor());
  -[UITableView setSeparatorColor:](v3, "setSeparatorColor:", MSGetTrackListBorderColor());
  -[UITableView setSeparatorStyle:](v3, "setSeparatorStyle:", 0);
  headerView = self->_headerView;
  if (headerView)
  {
    -[MSTrackListHeaderView frame](headerView, "frame");
    v6 = v5;
    v8 = v7;
    -[UITableView frame](v3, "frame");
    -[MSTrackListHeaderView setFrame:](self->_headerView, "setFrame:", v6, v8);
    -[UITableView setTableHeaderView:](v3, "setTableHeaderView:", self->_headerView);
  }
}

- (void)reloadData
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  objc_super v10;

  v3 = (void *)objc_msgSend((id)objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.super.super.super.super.isa+ (int)*MEMORY[0x24BEC8E38]), "structuredPage"), "itemList");
  v4 = (void *)-[SUStructuredPage item](-[SUStructuredPageViewController structuredPage](self, "structuredPage"), "item");
  v5 = (void *)objc_msgSend(v4, "firstItemLinkForType:", 9);
  if (objc_msgSend(v5, "URL"))
  {
    v6 = objc_alloc_init(MEMORY[0x24BEC8D18]);
    objc_msgSend(v6, "setItemDisplayType:", 10000);
    objc_msgSend(v6, "setItemType:", 3);
    objc_msgSend(v6, "setReviewStatistics:", objc_msgSend(v4, "reviewStatistics"));
    v7 = (void *)objc_msgSend(v5, "copy");
    objc_msgSend(v7, "setLinkType:", 0);
    objc_msgSend(v6, "setItemLinks:", objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObject:", v7));

    if (objc_msgSend(v3, "numberOfItems")
      && objc_msgSend((id)objc_msgSend((id)objc_msgSend(v3, "itemsForSectionAtIndex:", 0), "objectAtIndex:", 0), "itemDisplayType") == 10000)
    {
      v8 = objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", 0, 0);
      objc_msgSend(v3, "replaceItemAtIndexPath:withItems:", v8, objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObject:", v6));
    }
    else
    {
      v9 = objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObject:", v6);
      objc_msgSend(v3, "insertItems:atIndexPath:", v9, objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", 0, 0));
    }

  }
  v10.receiver = self;
  v10.super_class = (Class)MSTrackListViewController;
  -[SUStructuredPageViewController reloadData](&v10, sel_reloadData);
  -[UITableView setSeparatorStyle:](-[SUTableViewController tableView](self, "tableView"), "setSeparatorStyle:", objc_msgSend(v3, "numberOfItems") > 0);
  -[MSTrackListViewController _reloadHeaderView](self, "_reloadHeaderView");
  -[MSTrackListViewController _reloadFooterView](self, "_reloadFooterView");
}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BEDCDF0], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__delayedReloadForWebViews, 0);
  v5.receiver = self;
  v5.super_class = (Class)MSTrackListViewController;
  -[MSStructuredPageViewController viewWillDisappear:](&v5, sel_viewWillDisappear_, v3);
}

- (void)operation:(id)a3 finishedWithOutput:(id)a4
{
  objc_super v7;

  if (objc_msgSend((id)objc_msgSend(-[MSTrackListViewController _headerArtworkItemImage](self, "_headerArtworkItemImage"), "URL"), "isEqual:", objc_msgSend((id)objc_msgSend(a3, "requestProperties"), "URL")))
  {
    -[MSTrackListHeaderView setArtworkImage:](self->_headerView, "setArtworkImage:", a4);
    -[MSTrackListHeaderView reloadView](self->_headerView, "reloadView");
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)MSTrackListViewController;
    -[SUStructuredPageViewController operation:finishedWithOutput:](&v7, sel_operation_finishedWithOutput_, a3, a4);
  }
}

- (id)purchasableItemsForHeaderView:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v5 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.super.super.super.super.isa+ (int)*MEMORY[0x24BEC8E38]), "structuredPage"), "itemList"), "copyItems");
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v10, "isDownloadable"))
          objc_msgSend(v4, "addObject:", v10);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  return v4;
}

- (void)_delayedReloadForWebViews
{
  objc_msgSend(MEMORY[0x24BEDCDF0], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, a2, 0);
  -[MSTrackListViewController reloadData](self, "reloadData");
}

- (void)_restrictionsChangedNotification:(id)a3
{
  objc_msgSend((id)-[MSTrackListViewController mainThreadProxy](self, "mainThreadProxy", a3), "reloadData");
}

- (void)_webViewsLoaded:(id)a3
{
  objc_msgSend(MEMORY[0x24BEDCDF0], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__delayedReloadForWebViews, 0);
  -[MSTrackListViewController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__delayedReloadForWebViews, 0, 0.0);
}

- (id)_headerArtworkImage
{
  UIImage *v3;
  id v4;
  BOOL v5;
  void *v7;
  id v8;
  id v9;
  void *v10;

  v3 = -[MSTrackListHeaderView artworkImage](self->_headerView, "artworkImage");
  v4 = -[MSTrackListViewController _headerArtworkItemImage](self, "_headerArtworkItemImage");
  if (v3)
    v5 = 1;
  else
    v5 = v4 == 0;
  if (v5)
  {
    if (v3)
      return v3;
  }
  else
  {
    v7 = v4;
    v8 = objc_alloc_init(MEMORY[0x24BEC8C30]);
    v9 = -[MSTrackListViewController _newImageDataProvider](self, "_newImageDataProvider");
    objc_msgSend(v7, "imageScale");
    objc_msgSend(v9, "setInputImageScale:");
    objc_msgSend(v8, "setDataProvider:", v9);
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB2008]), "initWithURL:", objc_msgSend(v7, "URL"));
    objc_msgSend(v8, "setRequestProperties:", v10);

    -[SUViewController trackOperation:cancelOnDealloc:](self, "trackOperation:cancelOnDealloc:", v8, 1);
    objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x24BEC8CE8], "sharedController"), "imageOperationPool"), "addOperation:withFlags:", v8, 1);

  }
  return -[MSTrackListViewController _newPlaceholderImage](self, "_newPlaceholderImage");
}

- (id)_headerArtworkItemImage
{
  return (id)objc_msgSend((id)objc_msgSend((id)-[SUStructuredPage item](-[SUStructuredPageViewController structuredPage](self, "structuredPage"), "item"), "itemImageCollection"), "bestImageForSize:", 88.0, 88.0);
}

- (id)_newImageDataProvider
{
  id v2;
  id v3;
  id v4;
  id v5;

  v2 = objc_alloc_init(MEMORY[0x24BEC8D10]);
  objc_msgSend(v2, "setFillColor:", objc_msgSend(MEMORY[0x24BDF6950], "whiteColor"));
  objc_msgSend(v2, "setFinalSize:", 88.0, 88.0);
  v3 = objc_alloc_init(MEMORY[0x24BEC8DC0]);
  objc_msgSend(v3, "setEdgeInsets:", 1.0, 1.0, 1.0, 1.0);
  objc_msgSend(v3, "setStrokeColor:", objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 0.0, 0.200000003));
  v4 = objc_alloc_init(MEMORY[0x24BEC8D00]);
  objc_msgSend(v4, "setShouldSizeDownToFit:", 1);
  objc_msgSend(v4, "setSizingMask:", 45);
  v5 = objc_alloc_init(MEMORY[0x24BEC8CC8]);
  objc_msgSend(v5, "setModifiers:", objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", v4, v3, 0));
  objc_msgSend(v2, "setModifier:", v5);

  return v2;
}

- (id)_newPlaceholderImage
{
  id v2;
  void *v3;

  v2 = -[MSTrackListViewController _newImageDataProvider](self, "_newImageDataProvider");
  v3 = (void *)objc_msgSend(v2, "newImageFromImage:", objc_msgSend(MEMORY[0x24BDF6AC8], "imageNamed:inBundle:", CFSTR("PlaceholderBig.png"), objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class())));

  return v3;
}

- (void)_reloadFooterView
{
  SUStructuredPage *v3;
  uint64_t v4;
  MSTrackListCopyrightFooterView *v5;
  MSTrackListCopyrightFooterView *v6;

  v3 = -[SUStructuredPageViewController structuredPage](self, "structuredPage");
  v4 = objc_msgSend((id)-[SUStructuredPage item](v3, "item"), "copyrightString");
  if (v4 || (v4 = objc_msgSend((id)-[SUStructuredPage protocol](v3, "protocol"), "copyright")) != 0)
  {
    v5 = [MSTrackListCopyrightFooterView alloc];
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen"), "bounds");
    v6 = -[MSTrackListCopyrightFooterView initWithFrame:](v5, "initWithFrame:", 0.0, 0.0);
    -[MSTrackListCopyrightFooterView setBackgroundColor:](v6, "setBackgroundColor:", MSGetTrackListOddRowColor());
    -[MSTrackListCopyrightFooterView setText:](v6, "setText:", v4);
    -[MSTrackListCopyrightFooterView sizeToFit](v6, "sizeToFit");
    -[UITableView setTableFooterView:](-[SUTableViewController tableView](self, "tableView"), "setTableFooterView:", v6);

  }
  else
  {
    -[UITableView setTableFooterView:](-[SUTableViewController tableView](self, "tableView"), "setTableFooterView:", 0);
  }
}

- (void)_reloadHeaderView
{
  uint64_t v3;
  UITableView *v4;
  MSTrackListHeaderView *headerView;
  MSTrackListHeaderView *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  MSTrackListHeaderView *v11;
  MSTrackListHeaderView *v12;

  v3 = -[SUStructuredPage item](-[SUStructuredPageViewController structuredPage](self, "structuredPage"), "item");
  v4 = -[SUTableViewController tableView](self, "tableView");
  headerView = self->_headerView;
  if (v3)
  {
    if (headerView)
      goto LABEL_14;
    v6 = [MSTrackListHeaderView alloc];
    if (v4)
    {
      -[UITableView bounds](v4, "bounds");
    }
    else
    {
      v7 = *MEMORY[0x24BDBF090];
      v8 = *(double *)(MEMORY[0x24BDBF090] + 8);
      v9 = *(double *)(MEMORY[0x24BDBF090] + 16);
      v10 = *(double *)(MEMORY[0x24BDBF090] + 24);
    }
    v11 = -[MSTrackListHeaderView initWithFrame:](v6, "initWithFrame:", v7, v8, v9, v10);
    self->_headerView = v11;
    -[MSTrackListHeaderView setAutoresizingMask:](v11, "setAutoresizingMask:", 2);
    -[MSTrackListHeaderView setBackgroundColor:](self->_headerView, "setBackgroundColor:", MSGetTrackListOddRowColor());
    -[MSTrackListHeaderView setClipsToBounds:](self->_headerView, "setClipsToBounds:", 1);
    -[MSTrackListHeaderView setDelegate:](self->_headerView, "setDelegate:", self);
    if (self->_headerView)
    {
LABEL_14:
      -[MSTrackListHeaderView setArtworkImage:](self->_headerView, "setArtworkImage:", -[MSTrackListViewController _headerArtworkImage](self, "_headerArtworkImage"));
      -[MSTrackListHeaderView setItem:](self->_headerView, "setItem:", v3);
      -[MSTrackListHeaderView reloadView](self->_headerView, "reloadView");
      -[MSTrackListHeaderView sizeToFit](self->_headerView, "sizeToFit");
      v12 = self->_headerView;
      if (v12)
        goto LABEL_11;
    }
  }
  else
  {
    -[MSTrackListHeaderView setDelegate:](headerView, "setDelegate:", 0);

    self->_headerView = 0;
  }
  -[UITableView tableHeaderView](v4, "tableHeaderView");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    return;
  v12 = self->_headerView;
LABEL_11:
  -[UITableView setTableHeaderView:](v4, "setTableHeaderView:", v12);
}

@end
