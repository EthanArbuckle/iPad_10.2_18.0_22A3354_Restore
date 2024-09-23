@implementation HUNetworkRouterManualReconfigurationViewController

- (HUNetworkRouterManualReconfigurationViewController)initWithItemManager:(id)a3 tableViewStyle:(int64_t)a4
{
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithHome_);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUNetworkRouterManualReconfigurationViewController.m"), 27, CFSTR("%s is unavailable; use %@ instead"),
    "-[HUNetworkRouterManualReconfigurationViewController initWithItemManager:tableViewStyle:]",
    v7);

  return 0;
}

- (HUNetworkRouterManualReconfigurationViewController)initWithHome:(id)a3
{
  id v4;
  HUNetworkRouterManualReconfigurationItemManager *v5;
  HUNetworkRouterManualReconfigurationViewController *v6;
  objc_super v8;

  v4 = a3;
  v5 = -[HUNetworkRouterManualReconfigurationItemManager initWithHome:delegate:]([HUNetworkRouterManualReconfigurationItemManager alloc], "initWithHome:delegate:", v4, self);

  v8.receiver = self;
  v8.super_class = (Class)HUNetworkRouterManualReconfigurationViewController;
  v6 = -[HUItemTableViewController initWithItemManager:tableViewStyle:](&v8, sel_initWithItemManager_tableViewStyle_, v5, 1);

  return v6;
}

- (Class)cellClassForItem:(id)a3 indexPath:(id)a4
{
  id v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;

  v6 = a3;
  -[HUItemTableViewController itemManager](self, "itemManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isItemNetworkConfigurationItem:", v6);

  if (v8)
  {
    objc_opt_class();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUNetworkRouterManualReconfigurationViewController.m"), 41, CFSTR("Couldn't find a cell class for item: %@"), v6);

    v9 = 0;
  }

  return (Class)v9;
}

- (void)setupCell:(id)a3 forItem:(id)a4 indexPath:(id)a5
{
  id v8;
  id v9;
  void *v10;
  objc_super v11;

  v8 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HUNetworkRouterManualReconfigurationViewController;
  v9 = a4;
  -[HUItemTableViewController setupCell:forItem:indexPath:](&v11, sel_setupCell_forItem_indexPath_, v8, v9, a5);
  -[HUItemTableViewController itemManager](self, "itemManager", v11.receiver, v11.super_class);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(self) = objc_msgSend(v10, "isItemNetworkConfigurationItem:", v9);

  if ((_DWORD)self)
    objc_msgSend(v8, "setHideIcon:", 1);

}

- (void)updateCell:(id)a3 forItem:(id)a4 indexPath:(id)a5 animated:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  objc_super v23;

  v6 = a6;
  v10 = a3;
  v11 = a4;
  v23.receiver = self;
  v23.super_class = (Class)HUNetworkRouterManualReconfigurationViewController;
  -[HUItemTableViewController updateCell:forItem:indexPath:animated:](&v23, sel_updateCell_forItem_indexPath_animated_, v10, v11, a5, v6);
  -[HUItemTableViewController itemManager](self, "itemManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(a5) = objc_msgSend(v12, "isItemNetworkConfigurationItem:", v11);

  if ((_DWORD)a5)
  {
    v13 = objc_opt_class();
    v14 = v11;
    if (v14)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v15 = v14;
      else
        v15 = 0;
      v16 = v14;
      if (v15)
        goto LABEL_9;
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "handleFailureInFunction:file:lineNumber:description:", v18, CFSTR("NSObject+NAAdditions.h"), 54, CFSTR("Expected class of %@ but was %@"), v13, objc_opt_class());

    }
    v16 = 0;
LABEL_9:

    v19 = v10;
    objc_msgSend(v16, "accessory");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "room");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "name");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setDescriptionText:", v22);

  }
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  BOOL v12;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  -[HUItemTableViewController itemManager](self, "itemManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "displayedItemAtIndexPath:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUItemTableViewController itemManager](self, "itemManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isItemNetworkConfigurationItem:", v9);

  if ((v11 & 1) != 0)
  {
    v12 = 0;
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)HUNetworkRouterManualReconfigurationViewController;
    v12 = -[HUItemTableViewController tableView:shouldHighlightRowAtIndexPath:](&v14, sel_tableView_shouldHighlightRowAtIndexPath_, v6, v7);
  }

  return v12;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v5;
  id v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HUNetworkRouterManualReconfigurationViewController;
  v5 = a4;
  v6 = a3;
  -[HUItemTableViewController tableView:didSelectRowAtIndexPath:](&v7, sel_tableView_didSelectRowAtIndexPath_, v6, v5);
  objc_msgSend(v6, "deselectRowAtIndexPath:animated:", v5, 1, v7.receiver, v7.super_class);

}

@end
