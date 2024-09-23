@implementation BCActionsListViewController

- (BCActionsListViewController)initWithActionItems:(id)a3 brandedHeaderDelegate:(id)a4
{
  id v7;
  id v8;
  BCActionsListViewController *v9;
  BCActionsListViewController *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)BCActionsListViewController;
  v9 = -[BCActionsListViewController initWithStyle:](&v12, "initWithStyle:", 0);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_actionItems, a3);
    objc_storeWeak((id *)&v10->_brandedHeaderDelegate, v8);
  }

  return v10;
}

- (BCActionsListViewController)initWithStyle:(int64_t)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)BCActionsListViewController;
  return -[BCActionsListViewController initWithStyle:](&v4, "initWithStyle:", a3);
}

- (BCActionsListViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BCActionsListViewController;
  return -[BCActionsListViewController initWithNibName:bundle:](&v5, "initWithNibName:bundle:", a3, a4);
}

- (BCActionsListViewController)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)BCActionsListViewController;
  return -[BCActionsListViewController initWithCoder:](&v4, "initWithCoder:", a3);
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BCActionsListViewController traitChangeRegistration](self, "traitChangeRegistration"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[BCActionsListViewController traitChangeRegistration](self, "traitChangeRegistration"));
    -[BCActionsListViewController unregisterForTraitChanges:](self, "unregisterForTraitChanges:", v4);

  }
  v5.receiver = self;
  v5.super_class = (Class)BCActionsListViewController;
  -[BCActionsListViewController dealloc](&v5, "dealloc");
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)BCActionsListViewController;
  -[BCActionsListViewController viewWillAppear:](&v4, "viewWillAppear:", a3);
  -[BCActionsListViewController _sizeAndLoadTable](self, "_sizeAndLoadTable");
}

- (void)viewDidLoad
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  objc_super v25;
  _QWORD v26[2];

  v25.receiver = self;
  v25.super_class = (Class)BCActionsListViewController;
  -[BCActionsListViewController viewDidLoad](&v25, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BCActionsListViewController tableView](self, "tableView"));
  v5 = objc_opt_class(BCAlertHeaderTableViewCell, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[BCAlertHeaderTableViewCell reuseIdentifier](BCAlertHeaderTableViewCell, "reuseIdentifier"));
  objc_msgSend(v3, "registerClass:forCellReuseIdentifier:", v5, v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BCActionsListViewController tableView](self, "tableView"));
  objc_msgSend(v7, "registerClass:forCellReuseIdentifier:", objc_opt_class(BCAlertActionTableViewCell, v8), CFSTR("CellWithTitleAndIcon"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BCActionsListViewController tableView](self, "tableView"));
  objc_msgSend(v9, "registerClass:forCellReuseIdentifier:", objc_opt_class(BCAlertActionTableViewCell, v10), CFSTR("CellWithTitleSubTitleAndIcon"));

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[BCActionsListViewController tableView](self, "tableView"));
  objc_msgSend(v11, "setScrollEnabled:", 1);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[BCActionsListViewController tableView](self, "tableView"));
  objc_msgSend(v12, "setShowsVerticalScrollIndicator:", 1);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[BCActionsListViewController tableView](self, "tableView"));
  objc_msgSend(v13, "setUserInteractionEnabled:", 1);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[BCActionsListViewController tableView](self, "tableView"));
  objc_msgSend(v14, "setBounces:", 0);

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[BCActionsListViewController tableView](self, "tableView"));
  objc_msgSend(v16, "setBackgroundColor:", v15);

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[BCActionsListViewController tableView](self, "tableView"));
  objc_msgSend(v17, "setRowHeight:", UITableViewAutomaticDimension);

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[BCActionsListViewController tableView](self, "tableView"));
  objc_msgSend(v18, "setEstimatedRowHeight:", UITableViewAutomaticDimension);

  v19 = objc_opt_self(UITraitHorizontalSizeClass);
  v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
  v26[0] = v20;
  v21 = objc_opt_self(UITraitVerticalSizeClass);
  v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
  v26[1] = v22;
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v26, 2));
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[BCActionsListViewController registerForTraitChanges:withAction:](self, "registerForTraitChanges:withAction:", v23, "_handleSizeClassDidChange"));
  -[BCActionsListViewController setTraitChangeRegistration:](self, "setTraitChangeRegistration:", v24);

  -[BCActionsListViewController _handleSizeClassDidChange](self, "_handleSizeClassDidChange");
}

- (void)_sizeAndLoadTable
{
  id v3;

  -[BCActionsListViewController contentSize](self, "contentSize");
  -[BCActionsListViewController setPreferredContentSize:](self, "setPreferredContentSize:");
  v3 = (id)objc_claimAutoreleasedReturnValue(-[BCActionsListViewController tableView](self, "tableView"));
  objc_msgSend(v3, "reloadData");

}

- (void)_handleSizeClassDidChange
{
  if (-[BCActionsListViewController initialTableLoadCompleted](self, "initialTableLoadCompleted"))
  {
    +[NSObject cancelPreviousPerformRequestsWithTarget:selector:object:](NSObject, "cancelPreviousPerformRequestsWithTarget:selector:object:", self, "_sizeAndLoadTable", 0);
    -[BCActionsListViewController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", "_sizeAndLoadTable", 0, 0.1);
  }
  else
  {
    -[BCActionsListViewController setInitialTableLoadCompleted:](self, "setInitialTableLoadCompleted:", 1);
    -[BCActionsListViewController _sizeAndLoadTable](self, "_sizeAndLoadTable");
  }
}

- (void)_computeMaxHeights
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  double v10;
  double v11;
  void *i;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BCActionsListViewController tableView](self, "tableView"));
  objc_msgSend(v3, "frame");
  v5 = v4;

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BCActionsListViewController actionItems](self, "actionItems", 0));
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v19;
    v10 = 0.0;
    v11 = 0.0;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v19 != v9)
          objc_enumerationMutation(v6);
        v13 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v13, "actionType") == (id)1)
        {
          v14 = (void *)objc_claimAutoreleasedReturnValue(-[BCActionsListViewController businessItem](self, "businessItem"));
          +[BCAlertHeaderTableViewCell heightForBusinessItem:forWidth:](BCAlertHeaderTableViewCell, "heightForBusinessItem:forWidth:", v14, v5);
          v16 = v15;

          if (v16 > v10)
            v10 = v16;
        }
        else if (objc_msgSend(v13, "actionType") == (id)2)
        {
          +[BCAlertActionTableViewCell heightForActionItem:forWidth:](BCAlertActionTableViewCell, "heightForActionItem:forWidth:", v13, v5);
          if (v17 > v11)
            v11 = v17;
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v8);
  }
  else
  {
    v10 = 0.0;
    v11 = 0.0;
  }

  self->_maxHeaderCellHeight = v10;
  self->_maxActionCellHeight = v11;
}

- (CGSize)contentSize
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  double v10;
  void *i;
  void *v12;
  id v13;
  int *v14;
  id v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  unsigned int v20;
  double v21;
  double v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  CGSize result;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BCActionsListViewController tableView](self, "tableView"));
  objc_msgSend(v3, "frame");
  v5 = v4;

  -[BCActionsListViewController _computeMaxHeights](self, "_computeMaxHeights");
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BCActionsListViewController actionItems](self, "actionItems", 0));
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v24;
    v10 = 0.0;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v24 != v9)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)i);
        v13 = objc_msgSend(v12, "actionType");
        v14 = &OBJC_IVAR___BCActionsListViewController__maxHeaderCellHeight;
        if (v13 == (id)1
          || (v15 = objc_msgSend(v12, "actionType"),
              v16 = 0.0,
              v14 = &OBJC_IVAR___BCActionsListViewController__maxActionCellHeight,
              v15 == (id)2))
        {
          v16 = *(double *)((char *)&self->super.super.super.super.isa + *v14);
        }
        v10 = v10 + v16;
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v8);
  }
  else
  {
    v10 = 0.0;
  }

  -[BCActionsListViewController cellSeparatorHeight](self, "cellSeparatorHeight");
  v18 = v17;
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[BCActionsListViewController actionItems](self, "actionItems"));
  v20 = objc_msgSend(v19, "count");

  v21 = v10 - v18 * (double)(int)(v20 - 1);
  v22 = v5;
  result.height = v21;
  result.width = v22;
  return result;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  _QWORD v8[5];
  _QWORD v9[5];
  objc_super v10;

  height = a3.height;
  width = a3.width;
  v10.receiver = self;
  v10.super_class = (Class)BCActionsListViewController;
  v7 = a4;
  -[BCActionsListViewController viewWillTransitionToSize:withTransitionCoordinator:](&v10, "viewWillTransitionToSize:withTransitionCoordinator:", v7, width, height);
  v8[4] = self;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100003D00;
  v9[3] = &unk_100010378;
  v9[4] = self;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100003D08;
  v8[3] = &unk_100010378;
  objc_msgSend(v7, "animateAlongsideTransition:completion:", v9, v8);

}

- (double)cellSeparatorHeight
{
  void *v2;
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BCActionsListViewController tableView](self, "tableView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "window"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "screen"));
  objc_msgSend(v4, "scale");
  v6 = v5;

  if (v6 > 0.0)
    return 1.0 / v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v7, "scale");
  v9 = v8;

  return v9;
}

- (void)reloadHeader
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", 0, 0));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BCActionsListViewController actionItems](self, "actionItems"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectAtIndex:", objc_msgSend(v3, "row")));

  if (objc_msgSend(v5, "actionType") == (id)1)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BCActionsListViewController tableView](self, "tableView"));
    v8 = v3;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v8, 1));
    objc_msgSend(v6, "reloadRowsAtIndexPaths:withRowAnimation:", v7, 5);

  }
}

- (void)reloadHeaderIcon
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BCActionsListViewController actionItems](self, "actionItems"));
  v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "firstObject"));

  v4 = v9;
  if (v9)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BCActionsListViewController actionItems](self, "actionItems"));
    v6 = objc_msgSend(v5, "count");

    v4 = v9;
    if ((unint64_t)v6 >= 2)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "icon"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[BCActionsListViewController headerImageView](self, "headerImageView"));
      objc_msgSend(v8, "setImage:", v7);

      v4 = v9;
    }
  }

}

- (void)replaceLastActionItem:(id)a3 reloadRowImmediately:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;

  v4 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BCActionsListViewController actionItems](self, "actionItems"));
  -[BCActionsListViewController _replaceActionItem:atIndex:reloadRowImmediately:](self, "_replaceActionItem:atIndex:reloadRowImmediately:", v6, (char *)objc_msgSend(v7, "count") - 1, v4);

  -[BCActionsListViewController setLastActionItemPendingUpdate:](self, "setLastActionItemPendingUpdate:", 1);
}

- (void)_replaceActionItem:(id)a3 atIndex:(unint64_t)a4 reloadRowImmediately:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v5 = a5;
  v8 = a3;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BCActionsListViewController actionItems](self, "actionItems"));
  v10 = objc_msgSend(v9, "mutableCopy");

  if ((unint64_t)objc_msgSend(v10, "count") > a4)
    objc_msgSend(v10, "replaceObjectAtIndex:withObject:", a4, v8);
  v11 = objc_msgSend(v10, "copy");
  -[BCActionsListViewController setActionItems:](self, "setActionItems:", v11);

  -[BCActionsListViewController contentSize](self, "contentSize");
  -[BCActionsListViewController setPreferredContentSize:](self, "setPreferredContentSize:");
  if (v5)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", a4, 0));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[BCActionsListViewController tableView](self, "tableView"));
    v15 = v12;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v15, 1));
    objc_msgSend(v13, "reloadRowsAtIndexPaths:withRowAnimation:", v14, 0);

  }
}

- (void)updateContentIfNecessary
{
  -[BCActionsListViewController contentSize](self, "contentSize");
  -[BCActionsListViewController setPreferredContentSize:](self, "setPreferredContentSize:");
}

- (void)addActionItems:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BCActionsListViewController actionItems](self, "actionItems"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "arrayByAddingObjectsFromArray:", v5));
  -[BCActionsListViewController setActionItems:](self, "setActionItems:", v6);

  -[BCActionsListViewController setItemsToAdd:](self, "setItemsToAdd:", v4);
  -[BCActionsListViewController updateContentIfNecessary](self, "updateContentIfNecessary");
}

- (void)setBusinessItem:(id)a3
{
  id v5;
  id v6;

  v5 = a3;
  if (v5 && !self->_businessItem)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_businessItem, a3);
    -[BCActionsListViewController updateContentIfNecessary](self, "updateContentIfNecessary");
    v5 = v6;
  }

}

- (void)updateLastActionItemWithAnimationIfNecessary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  if (-[BCActionsListViewController lastActionItemPendingUpdate](self, "lastActionItemPendingUpdate"))
  {
    -[BCActionsListViewController setLastActionItemPendingUpdate:](self, "setLastActionItemPendingUpdate:", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[BCActionsListViewController actionItems](self, "actionItems"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", (char *)objc_msgSend(v3, "count") - 1, 0));

    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BCActionsListViewController tableView](self, "tableView"));
    v7 = v4;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v7, 1));
    objc_msgSend(v5, "reloadRowsAtIndexPaths:withRowAnimation:", v6, 0);

  }
}

- (void)updateActionListViewWithAnimation
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  unint64_t v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BCActionsListViewController itemsToAdd](self, "itemsToAdd"));
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BCActionsListViewController itemsToAdd](self, "itemsToAdd"));
    v13 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v5, "count")));

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BCActionsListViewController itemsToAdd](self, "itemsToAdd"));
    v7 = objc_msgSend(v6, "count");

    if (v7)
    {
      v8 = 0;
      do
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", v8, 0));
        objc_msgSend(v13, "addObject:", v9);

        ++v8;
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[BCActionsListViewController itemsToAdd](self, "itemsToAdd"));
        v11 = objc_msgSend(v10, "count");

      }
      while (v8 < (unint64_t)v11);
    }
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[BCActionsListViewController tableView](self, "tableView"));
    objc_msgSend(v12, "insertRowsAtIndexPaths:withRowAnimation:", v13, 0);

    -[BCActionsListViewController setItemsToAdd:](self, "setItemsToAdd:", 0);
  }
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v4;
  id v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BCActionsListViewController actionItems](self, "actionItems", a3, a4));
  v5 = objc_msgSend(v4, "count");

  return (int64_t)v5;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BCActionsListViewController actionItems](self, "actionItems"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndex:", objc_msgSend(v7, "row")));

  if (objc_msgSend(v9, "actionType") == (id)2)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[BCAlertActionTableViewCell reuseIdentifierForItem:](BCAlertActionTableViewCell, "reuseIdentifierForItem:", v9));
    v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dequeueReusableCellWithIdentifier:forIndexPath:", v10, v7));

    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "title"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "titleLabel"));
    objc_msgSend(v13, "setText:", v12);

    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "subTitle"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "subTitleLabel"));
    objc_msgSend(v15, "setText:", v14);

    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "icon"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "mainImageView"));
    objc_msgSend(v17, "setImage:", v16);

  }
  else if (objc_msgSend(v9, "actionType") == (id)1)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[BCAlertHeaderTableViewCell reuseIdentifier](BCAlertHeaderTableViewCell, "reuseIdentifier"));
    v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dequeueReusableCellWithIdentifier:forIndexPath:", v18, v7));

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[BCActionsListViewController businessItem](self, "businessItem"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[BCActionsListViewController brandedHeaderDelegate](self, "brandedHeaderDelegate"));
    objc_msgSend(v11, "updateContentViewUsingBusinessItem:brandedHeaderDelegate:", v19, v20);

    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "mainImageView"));
    -[BCActionsListViewController setHeaderImageView:](self, "setHeaderImageView:", v21);

  }
  else
  {
    v11 = objc_msgSend(objc_alloc((Class)UITableViewCell), "initWithStyle:reuseIdentifier:", 0, CFSTR("defaultCellIdentifier"));
  }

  return v11;
}

- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4
{
  return 0;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void (**v9)(_QWORD, _QWORD);
  id v10;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BCActionsListViewController actionItems](self, "actionItems"));
  v7 = objc_msgSend(v5, "row");

  v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndex:", v7));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "handler"));

  if (v8)
  {
    v9 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "handler"));
    ((void (**)(_QWORD, id))v9)[2](v9, v10);

  }
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  _BOOL4 v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  double v16;
  void *v17;
  double v18;
  double v19;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BCActionsListViewController tableView](self, "tableView"));
  objc_msgSend(v6, "frame");
  v8 = v7;

  -[BCActionsListViewController maxHeaderCellHeight](self, "maxHeaderCellHeight");
  if (v9 == 0.0)
  {
    v11 = 0;
  }
  else
  {
    -[BCActionsListViewController maxActionCellHeight](self, "maxActionCellHeight");
    v11 = v10 != 0.0;
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[BCActionsListViewController actionItems](self, "actionItems"));
  v13 = objc_msgSend(v5, "row");

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectAtIndex:", v13));
  if (objc_msgSend(v14, "actionType") == (id)1)
  {
    if (!v11)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[BCActionsListViewController businessItem](self, "businessItem"));
      +[BCAlertHeaderTableViewCell heightForBusinessItem:forWidth:](BCAlertHeaderTableViewCell, "heightForBusinessItem:forWidth:", v17, v8);
      v16 = v18;

      goto LABEL_13;
    }
    v15 = 56;
    goto LABEL_10;
  }
  v16 = 0.0;
  if (objc_msgSend(v14, "actionType") == (id)2)
  {
    if (!v11)
    {
      +[BCAlertActionTableViewCell heightForActionItem:forWidth:](BCAlertActionTableViewCell, "heightForActionItem:forWidth:", v14, v8);
      v16 = v19;
      goto LABEL_13;
    }
    v15 = 64;
LABEL_10:
    v16 = *(double *)((char *)&self->super.super.super.super.isa + v15);
  }
LABEL_13:

  return v16;
}

- (NSArray)actionItems
{
  return self->_actionItems;
}

- (void)setActionItems:(id)a3
{
  objc_storeStrong((id *)&self->_actionItems, a3);
}

- (BCSBusinessItem)businessItem
{
  return self->_businessItem;
}

- (NSArray)itemsToAdd
{
  return self->_itemsToAdd;
}

- (void)setItemsToAdd:(id)a3
{
  objc_storeStrong((id *)&self->_itemsToAdd, a3);
}

- (BOOL)lastActionItemPendingUpdate
{
  return self->_lastActionItemPendingUpdate;
}

- (void)setLastActionItemPendingUpdate:(BOOL)a3
{
  self->_lastActionItemPendingUpdate = a3;
}

- (UIImageView)headerImageView
{
  return self->_headerImageView;
}

- (void)setHeaderImageView:(id)a3
{
  objc_storeStrong((id *)&self->_headerImageView, a3);
}

- (BOOL)initialTableLoadCompleted
{
  return self->_initialTableLoadCompleted;
}

- (void)setInitialTableLoadCompleted:(BOOL)a3
{
  self->_initialTableLoadCompleted = a3;
}

- (UITraitChangeRegistration)traitChangeRegistration
{
  return self->_traitChangeRegistration;
}

- (void)setTraitChangeRegistration:(id)a3
{
  objc_storeStrong((id *)&self->_traitChangeRegistration, a3);
}

- (double)maxHeaderCellHeight
{
  return self->_maxHeaderCellHeight;
}

- (void)setMaxHeaderCellHeight:(double)a3
{
  self->_maxHeaderCellHeight = a3;
}

- (double)maxActionCellHeight
{
  return self->_maxActionCellHeight;
}

- (void)setMaxActionCellHeight:(double)a3
{
  self->_maxActionCellHeight = a3;
}

- (BCBrandedHeaderViewControllerDelegate)brandedHeaderDelegate
{
  return (BCBrandedHeaderViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_brandedHeaderDelegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_brandedHeaderDelegate);
  objc_storeStrong((id *)&self->_traitChangeRegistration, 0);
  objc_storeStrong((id *)&self->_headerImageView, 0);
  objc_storeStrong((id *)&self->_itemsToAdd, 0);
  objc_storeStrong((id *)&self->_businessItem, 0);
  objc_storeStrong((id *)&self->_actionItems, 0);
}

@end
