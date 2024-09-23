@implementation TSSIMUnlockListViewController

- (TSSIMUnlockListViewController)initWithSubscriptionContexts:(id)a3 subscriptionActions:(id)a4 suppressCancellation:(BOOL)a5 delegate:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  TSSIMUnlockListViewController *v15;
  TSSIMUnlockListViewController *v16;
  CoreTelephonyClient *v17;
  CoreTelephonyClient *telephonyClient;
  NSMutableArray *v19;
  NSMutableArray *subscriptionContexts;
  NSMutableDictionary *v21;
  NSMutableDictionary *subscriptionActions;
  objc_super v24;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  if (sub_10000CED8())
  {
    v13 = sub_10000CE68();
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      sub_10000F900(v14);

  }
  v24.receiver = self;
  v24.super_class = (Class)TSSIMUnlockListViewController;
  v15 = -[TSSIMUnlockListViewController init](&v24, "init");
  v16 = v15;
  if (v15)
  {
    v15->_suppressCancellation = a5;
    v17 = (CoreTelephonyClient *)objc_msgSend(objc_alloc((Class)CoreTelephonyClient), "initWithQueue:", &_dispatch_main_q);
    telephonyClient = v16->_telephonyClient;
    v16->_telephonyClient = v17;

    v19 = (NSMutableArray *)objc_msgSend(v10, "mutableCopy");
    subscriptionContexts = v16->_subscriptionContexts;
    v16->_subscriptionContexts = v19;

    v21 = (NSMutableDictionary *)objc_msgSend(v11, "mutableCopy");
    subscriptionActions = v16->_subscriptionActions;
    v16->_subscriptionActions = v21;

    objc_storeWeak((id *)&v16->_delegate, v12);
    v16->_isEsimExist = -[TSSIMUnlockListViewController _anESIMExistsInSubscriptionContexts](v16, "_anESIMExistsInSubscriptionContexts");
  }

  return v16;
}

- (void)loadView
{
  id v3;
  void *v4;
  TSSIMUnlockListContainerView *v5;

  v5 = objc_alloc_init(TSSIMUnlockListContainerView);
  -[TSSIMUnlockListContainerView setAutoresizingMask:](v5, "setAutoresizingMask:", 18);
  -[TSSIMUnlockListViewController setView:](self, "setView:", v5);
  v3 = objc_msgSend(objc_alloc((Class)UISwipeGestureRecognizer), "initWithTarget:action:", self, "_cancelButtonItemPressed:");
  objc_msgSend(v3, "setDirection:", 8);
  objc_msgSend(v3, "setDelegate:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TSSIMUnlockListViewController view](self, "view"));
  objc_msgSend(v4, "addGestureRecognizer:", v3);

}

- (void)viewDidLoad
{
  TSSIMUnlockListHeaderView *v3;
  TSSIMUnlockListHeaderView *headerView;
  void *v5;
  UITableView *v6;
  UITableView *tableView;
  void *v8;
  void *v9;
  TSSIMUnlockListTableFooterView *v10;
  TSSIMUnlockListTableFooterView *tableFooterView;
  TSSIMUnlockListFooterView *v12;
  TSSIMUnlockListFooterView *footerView;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)TSSIMUnlockListViewController;
  -[TSSIMUnlockListViewController viewDidLoad](&v18, "viewDidLoad");
  v3 = objc_alloc_init(TSSIMUnlockListHeaderView);
  headerView = self->_headerView;
  self->_headerView = v3;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TSSIMUnlockListViewController _containerView](self, "_containerView"));
  objc_msgSend(v5, "setHeaderView:", self->_headerView);

  v6 = (UITableView *)objc_msgSend(objc_alloc((Class)UITableView), "initWithFrame:style:", 1, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  tableView = self->_tableView;
  self->_tableView = v6;

  -[UITableView setDelegate:](self->_tableView, "setDelegate:", self);
  -[UITableView setDataSource:](self->_tableView, "setDataSource:", self);
  -[UITableView setScrollEnabled:](self->_tableView, "setScrollEnabled:", 0);
  -[UITableView setTableFooterView:](self->_tableView, "setTableFooterView:", self->_tableFooterView);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor"));
  -[UITableView setBackgroundColor:](self->_tableView, "setBackgroundColor:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[TSSIMUnlockListViewController _containerView](self, "_containerView"));
  objc_msgSend(v9, "setTableView:", self->_tableView);

  if (!self->_isEsimExist && (unint64_t)-[NSMutableArray count](self->_subscriptionContexts, "count") >= 2)
  {
    v10 = objc_alloc_init(TSSIMUnlockListTableFooterView);
    tableFooterView = self->_tableFooterView;
    self->_tableFooterView = v10;

    -[UITableView setTableFooterView:](self->_tableView, "setTableFooterView:", self->_tableFooterView);
  }
  v12 = -[TSSIMUnlockListFooterView initWithDelegate:]([TSSIMUnlockListFooterView alloc], "initWithDelegate:", self);
  footerView = self->_footerView;
  self->_footerView = v12;

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor"));
  -[TSSIMUnlockListFooterView setBackgroundColor:](self->_footerView, "setBackgroundColor:", v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[TSSIMUnlockListViewController _containerView](self, "_containerView"));
  objc_msgSend(v15, "setFooterView:", self->_footerView);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[TSSIMUnlockListViewController _containerView](self, "_containerView"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor"));
  objc_msgSend(v16, "setBackgroundColor:", v17);

  -[TSSIMUnlockListViewController setEdgesForExtendedLayout:](self, "setEdgesForExtendedLayout:", 0);
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)TSSIMUnlockListViewController;
  -[TSSIMUnlockListViewController viewWillAppear:](&v4, "viewWillAppear:", a3);
  -[TSSIMUnlockListViewController _configureAncillaryViews](self, "_configureAncillaryViews");
}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)TSSIMUnlockListViewController;
  -[TSSIMUnlockListViewController viewWillDisappear:](&v6, "viewWillDisappear:");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[UITableView indexPathForSelectedRow](self->_tableView, "indexPathForSelectedRow"));
  if (v5)
    -[UITableView deselectRowAtIndexPath:animated:](self->_tableView, "deselectRowAtIndexPath:animated:", v5, v3);

}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  const __CFString *v37;
  void *v38;
  id v39;
  id v40;
  void *v41;
  void *v42;
  id v44;
  void *v45;
  id v46;
  void *v47;
  void *v48;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](self->_subscriptionContexts, "objectAtIndexedSubscript:", objc_msgSend(a4, "row")));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "uuid"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_subscriptionActions, "objectForKeyedSubscript:", v8));
  if (objc_msgSend(v9, "actionType"))
  {
    v48 = v8;
    if (objc_msgSend(v9, "actionType") == (id)1
      && (v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "carrierName")),
          v11 = objc_msgSend(v10, "length"),
          v10,
          v11))
    {
      v45 = v7;
      v46 = v6;
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dequeueReusableCellWithIdentifier:", CFSTR("SIMUnlockListUnlockedCellIdentifier")));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "carrierName"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "phoneNumber"));
      v15 = v12;
      v16 = v13;
      v17 = v15;
      v44 = v15;
      if (!v15)
        v17 = objc_msgSend(objc_alloc((Class)UITableViewCell), "initWithStyle:reuseIdentifier:", 3, CFSTR("SIMUnlockListUnlockedCellIdentifier"));
      v18 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "defaultContentConfiguration"));
      objc_msgSend(v18, "setText:", v16);
      v47 = v16;
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleBody));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "textProperties"));
      objc_msgSend(v20, "setFont:", v19);

      objc_msgSend(v18, "setSecondaryText:", v14);
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleFootnote));
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "secondaryTextProperties"));
      objc_msgSend(v22, "setFont:", v21);

      v23 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor lightGrayColor](UIColor, "lightGrayColor"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "secondaryTextProperties"));
      objc_msgSend(v24, "setColor:", v23);

      objc_msgSend(v17, "setContentConfiguration:", v18);
      v25 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("chevron.forward")));
      v26 = objc_msgSend(objc_alloc((Class)UIImageView), "initWithImage:", v25);
      v27 = objc_alloc((Class)UIView);
      objc_msgSend(v26, "frame");
      v28 = objc_msgSend(v27, "initWithFrame:");
      objc_msgSend(v17, "setAccessoryView:", v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "localizedStringForKey:value:table:", CFSTR("SIM_UNLOCKED"), &stru_10001CAA0, CFSTR("Localizable")));
      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "contentView"));
      sub_100009250(v30, v31);

      v7 = v45;
      v6 = v46;
      v8 = v48;
      v32 = v44;
    }
    else
    {
      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dequeueReusableCellWithIdentifier:", CFSTR("SIMUnlockListLockedCellIdentifier")));
      v34 = (void *)objc_claimAutoreleasedReturnValue(-[TSSIMUnlockListViewController _nameForSIMWithSubscriptionContext:](self, "_nameForSIMWithSubscriptionContext:", v7));
      switch((unint64_t)objc_msgSend(v9, "actionType"))
      {
        case 1uLL:
          v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
          v36 = v35;
          v37 = CFSTR("SIM_UNLOCKED");
          goto LABEL_14;
        case 2uLL:
          v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
          v36 = v35;
          v37 = CFSTR("PIN_LOCKED");
          goto LABEL_14;
        case 3uLL:
          v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
          v36 = v35;
          v37 = CFSTR("PUK_LOCKED");
          goto LABEL_14;
        case 4uLL:
          v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
          v36 = v35;
          v37 = CFSTR("PERMANENTLY_LOCKED");
LABEL_14:
          v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "localizedStringForKey:value:table:", v37, &stru_10001CAA0, CFSTR("Localizable")));

          break;
        default:
          v38 = 0;
          break;
      }
      v39 = v33;
      v40 = v34;
      v18 = v38;
      v17 = v39;
      v32 = v39;
      if (!v39)
        v17 = objc_msgSend(objc_alloc((Class)UITableViewCell), "initWithStyle:reuseIdentifier:", 0, CFSTR("SIMUnlockListLockedCellIdentifier"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "defaultContentConfiguration"));
      objc_msgSend(v25, "setText:", v40);
      v41 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleHeadline));
      v47 = v40;
      v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "textProperties"));
      objc_msgSend(v42, "setFont:", v41);

      objc_msgSend(v17, "setContentConfiguration:", v25);
      objc_msgSend(v17, "setAccessoryType:", 1);
      v26 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "contentView"));
      sub_100009250(v18, v26);
      v14 = v18;
      v8 = v48;
    }

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](self->_subscriptionContexts, "objectAtIndexedSubscript:", objc_msgSend(a4, "row", a3)));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "uuid"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_subscriptionActions, "objectForKeyedSubscript:", v6));
  v8 = (char *)objc_msgSend(v7, "actionType") - 2 < (char *)3;

  return v8;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return (int64_t)-[NSMutableArray count](self->_subscriptionContexts, "count", a3, a4);
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  return 60.0;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  TSSIMUnlockDetailViewController *v8;
  void *v9;
  id v10;

  v10 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](self->_subscriptionContexts, "objectAtIndexedSubscript:", objc_msgSend(a4, "row", a3)));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "uuid"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_subscriptionActions, "objectForKeyedSubscript:", v5));
  if ((char *)objc_msgSend(v6, "actionType") - 2 <= (char *)2)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[TSSIMUnlockListViewController _nameForSIMWithSubscriptionContext:](self, "_nameForSIMWithSubscriptionContext:", v10));
    v8 = -[TSSIMUnlockDetailViewController initWithSubscriptionContext:subscriptionAction:lockedSIMName:delegate:]([TSSIMUnlockDetailViewController alloc], "initWithSubscriptionContext:subscriptionAction:lockedSIMName:delegate:", v10, v6, v7, self);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[TSSIMUnlockListViewController navigationController](self, "navigationController"));
    objc_msgSend(v9, "pushViewController:animated:", v8, 1);

  }
}

- (void)unlockDetailViewController:(id)a3 didCompleteWithResult:(int64_t)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  id v9;

  if (sub_10000CED8())
  {
    v6 = sub_10000CE68();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      sub_10000F980();

  }
  if ((unint64_t)a4 < 4 || a4 == 6)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[TSSIMUnlockListViewController navigationController](self, "navigationController"));
    v9 = objc_msgSend(v8, "popToViewController:animated:", self, 1);

  }
}

- (void)unlockListFooterViewContinueButtonWasPressed:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "unlockListViewControllerDidComplete:", self);

}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 1;
}

- (void)addSubscriptionContext:(id)a3 withSubscriptionAction:(id)a4 atIndex:(unint64_t)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  UITableView *tableView;
  void *v15;
  uint64_t v16;
  const __CFString *v17;
  void *v18;
  void *v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  unint64_t v27;
  __int16 v28;
  const char *v29;

  v8 = a3;
  v9 = a4;
  if (sub_10000CED8())
  {
    v10 = sub_10000CE68();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      v16 = CTSubscriptionSlotAsString(objc_msgSend(v8, "slotID"));
      v17 = sub_100006F6C((unint64_t)objc_msgSend(v9, "actionType"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
      *(_DWORD *)buf = 136316162;
      v21 = "-[TSSIMUnlockListViewController addSubscriptionContext:withSubscriptionAction:atIndex:]";
      v22 = 2080;
      v23 = v16;
      v24 = 2112;
      v25 = v18;
      v26 = 2048;
      v27 = a5;
      v28 = 2080;
      v29 = "-[TSSIMUnlockListViewController addSubscriptionContext:withSubscriptionAction:atIndex:]";
      _os_log_debug_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "[Db] %s: context %s, action %@, index %ld @%s", buf, 0x34u);

    }
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "uuid"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_subscriptionActions, "setObject:forKeyedSubscript:", v9, v12);
  -[NSMutableArray insertObject:atIndex:](self->_subscriptionContexts, "insertObject:atIndex:", v8, a5);
  if (-[TSSIMUnlockListViewController isViewLoaded](self, "isViewLoaded"))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", a5, 0));
    tableView = self->_tableView;
    v19 = v13;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v19, 1));
    -[UITableView insertRowsAtIndexPaths:withRowAnimation:](tableView, "insertRowsAtIndexPaths:withRowAnimation:", v15, 100);

    -[TSSIMUnlockListViewController _configureAncillaryViews](self, "_configureAncillaryViews");
  }

}

- (void)updateSubscriptionContext:(id)a3 withSubscriptionAction:(id)a4 atIndex:(unint64_t)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  UITableView *tableView;
  void *v15;
  uint64_t v16;
  const __CFString *v17;
  void *v18;
  void *v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  unint64_t v27;
  __int16 v28;
  const char *v29;

  v8 = a3;
  v9 = a4;
  if (sub_10000CED8())
  {
    v10 = sub_10000CE68();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      v16 = CTSubscriptionSlotAsString(objc_msgSend(v8, "slotID"));
      v17 = sub_100006F6C((unint64_t)objc_msgSend(v9, "actionType"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
      *(_DWORD *)buf = 136316162;
      v21 = "-[TSSIMUnlockListViewController updateSubscriptionContext:withSubscriptionAction:atIndex:]";
      v22 = 2080;
      v23 = v16;
      v24 = 2112;
      v25 = v18;
      v26 = 2048;
      v27 = a5;
      v28 = 2080;
      v29 = "-[TSSIMUnlockListViewController updateSubscriptionContext:withSubscriptionAction:atIndex:]";
      _os_log_debug_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "[Db] %s: context %s, action %@, index %ld @%s", buf, 0x34u);

    }
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "uuid"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_subscriptionActions, "setObject:forKeyedSubscript:", v9, v12);
  -[NSMutableArray replaceObjectAtIndex:withObject:](self->_subscriptionContexts, "replaceObjectAtIndex:withObject:", a5, v8);
  if (-[TSSIMUnlockListViewController isViewLoaded](self, "isViewLoaded"))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", a5, 0));
    tableView = self->_tableView;
    v19 = v13;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v19, 1));
    -[UITableView reloadRowsAtIndexPaths:withRowAnimation:](tableView, "reloadRowsAtIndexPaths:withRowAnimation:", v15, 100);

    -[TSSIMUnlockListViewController _configureAncillaryViews](self, "_configureAncillaryViews");
  }

}

- (void)removeSubscriptionContextAtIndex:(unint64_t)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  UITableView *tableView;
  void *v11;
  void *v12;

  if (sub_10000CED8())
  {
    v5 = sub_10000CE68();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      sub_10000F9F0();

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](self->_subscriptionContexts, "objectAtIndexedSubscript:", a3));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "uuid"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_subscriptionActions, "setObject:forKeyedSubscript:", 0, v8);
  -[NSMutableArray removeObjectAtIndex:](self->_subscriptionContexts, "removeObjectAtIndex:", a3);
  if (-[TSSIMUnlockListViewController isViewLoaded](self, "isViewLoaded"))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", a3, 0));
    tableView = self->_tableView;
    v12 = v9;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v12, 1));
    -[UITableView deleteRowsAtIndexPaths:withRowAnimation:](tableView, "deleteRowsAtIndexPaths:withRowAnimation:", v11, 100);

    -[TSSIMUnlockListViewController _configureAncillaryViews](self, "_configureAncillaryViews");
  }

}

- (void)_configureAncillaryViews
{
  -[TSSIMUnlockListViewController _configureNavigationItem](self, "_configureNavigationItem");
  -[TSSIMUnlockListViewController _configureHeaderView](self, "_configureHeaderView");
  -[TSSIMUnlockListViewController _configureTableFooterView](self, "_configureTableFooterView");
  -[TSSIMUnlockListViewController _configureFooterView](self, "_configureFooterView");
}

- (void)_configureNavigationItem
{
  id v3;
  UIBarButtonItem *v4;
  UIBarButtonItem *cancelButtonItem;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  if (self->_suppressCancellation
    || (v3 = -[NSMutableArray count](self->_subscriptionContexts, "count"),
        v3 != (id)-[TSSIMUnlockListViewController _numberOfLockedSubscriptionContexts](self, "_numberOfLockedSubscriptionContexts")))
  {
    cancelButtonItem = self->_cancelButtonItem;
    if (cancelButtonItem)
    {
      self->_cancelButtonItem = 0;
      goto LABEL_7;
    }
  }
  else if (!self->_cancelButtonItem)
  {
    v4 = (UIBarButtonItem *)objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithBarButtonSystemItem:target:action:", 1, self, "_cancelButtonItemPressed:");
    cancelButtonItem = self->_cancelButtonItem;
    self->_cancelButtonItem = v4;
LABEL_7:

  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TSSIMUnlockListViewController navigationItem](self, "navigationItem"));
  objc_msgSend(v6, "setLeftBarButtonItem:", self->_cancelButtonItem);

  v9 = (id)objc_claimAutoreleasedReturnValue(+[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TSSIMUnlockListViewController navigationController](self, "navigationController"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "view"));
  objc_msgSend(v8, "setBackgroundColor:", v9);

}

- (void)_configureHeaderView
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[2];
  _QWORD v7[2];

  v6[0] = CFSTR("NumOfSimsAvailKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[NSMutableArray count](self->_subscriptionContexts, "count")));
  v7[0] = v3;
  v6[1] = CFSTR("kPhysicalSimExists");
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[TSSIMUnlockListViewController _doesPhysicalSimExist](self, "_doesPhysicalSimExist")));
  v7[1] = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v7, v6, 2));

  -[TSSIMUnlockListHeaderView setNumberOfSIMsToUnlockAndanESIMExists:](self->_headerView, "setNumberOfSIMsToUnlockAndanESIMExists:", v5);
}

- (void)_configureTableFooterView
{
  double v3;
  double v4;
  double v5;
  double v6;

  if (self->_tableFooterView)
  {
    -[UITableView bounds](self->_tableView, "bounds");
    -[TSSIMUnlockListTableFooterView sizeThatFits:](self->_tableFooterView, "sizeThatFits:", v3, v4);
    v6 = v5;
    -[TSSIMUnlockListTableFooterView frame](self->_tableFooterView, "frame");
    -[TSSIMUnlockListTableFooterView setFrame:](self->_tableFooterView, "setFrame:");
    -[UITableView _tableFooterHeightDidChangeToHeight:](self->_tableView, "_tableFooterHeightDidChangeToHeight:", v6);
  }
}

- (void)_configureFooterView
{
  id v3;
  TSSIMUnlockListFooterView *footerView;
  uint64_t v5;

  v3 = -[TSSIMUnlockListViewController _numberOfLockedSubscriptionContexts](self, "_numberOfLockedSubscriptionContexts");
  footerView = self->_footerView;
  if (v3 == -[NSMutableArray count](self->_subscriptionContexts, "count"))
    v5 = 2;
  else
    v5 = 1;
  -[TSSIMUnlockListFooterView setMode:](footerView, "setMode:", v5);
}

- (unint64_t)_numberOfLockedSubscriptionContexts
{
  void *v2;
  id v3;
  id v4;
  unint64_t v5;
  uint64_t v6;
  void *i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_subscriptionActions, "allValues", 0));
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v2);
        if (((unint64_t)objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)i), "actionType") & 0xFFFFFFFFFFFFFFFELL) == 2)
          ++v5;
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)_cancelButtonItemPressed:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "unlockListViewControllerDidComplete:", self);

}

- (BOOL)_anESIMExistsInSubscriptionContexts
{
  NSMutableArray *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  id v9;
  BOOL v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v3 = self->_subscriptionContexts;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v3);
        v8 = (void *)objc_claimAutoreleasedReturnValue(-[CoreTelephonyClient getSimHardwareInfo:error:](self->_telephonyClient, "getSimHardwareInfo:error:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i), 0, (_QWORD)v12));
        v9 = objc_msgSend(v8, "hardwareType");

        if (v9 == (id)2)
        {
          v10 = 1;
          goto LABEL_11;
        }
      }
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v5)
        continue;
      break;
    }
  }
  v10 = 0;
LABEL_11:

  return v10;
}

- (BOOL)_doesPhysicalSimExist
{
  NSMutableArray *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  id v9;
  BOOL v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v3 = self->_subscriptionContexts;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v3);
        v8 = (void *)objc_claimAutoreleasedReturnValue(-[CoreTelephonyClient getSimHardwareInfo:error:](self->_telephonyClient, "getSimHardwareInfo:error:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i), 0, (_QWORD)v12));
        v9 = objc_msgSend(v8, "hardwareType");

        if (v9 != (id)2)
        {
          v10 = 1;
          goto LABEL_11;
        }
      }
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v5)
        continue;
      break;
    }
  }
  v10 = 0;
LABEL_11:

  return v10;
}

- (BOOL)_doTwoEsimsExist
{
  BOOL v3;
  NSMutableArray *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  id v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  if (!self->_isEsimExist || (unint64_t)-[NSMutableDictionary count](self->_subscriptionActions, "count") < 2)
    return 0;
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = self->_subscriptionContexts;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[CoreTelephonyClient getSimHardwareInfo:error:](self->_telephonyClient, "getSimHardwareInfo:error:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i), 0, (_QWORD)v12));
        v10 = objc_msgSend(v9, "hardwareType");

        if (v10 != (id)2)
        {
          v3 = 0;
          goto LABEL_14;
        }
      }
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v6)
        continue;
      break;
    }
  }
  v3 = 1;
LABEL_14:

  return v3;
}

- (id)_nameForSIMWithSubscriptionContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  uint64_t v13;
  id v14;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CoreTelephonyClient getSimLabel:error:](self->_telephonyClient, "getSimLabel:error:", v4, 0));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CoreTelephonyClient getSimHardwareInfo:error:](self->_telephonyClient, "getSimHardwareInfo:error:", v4, 0));
  if (v5 && objc_msgSend(v5, "didSetup"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "text"));
    v8 = objc_msgSend(v7, "length") != 0;

  }
  else
  {
    v8 = 0;
  }
  if (!self->_isEsimExist && -[NSMutableArray count](self->_subscriptionContexts, "count") != (id)1)
  {
    v14 = objc_msgSend(v6, "simLocation");
    if (v14 == (id)2)
    {
      if (!v8)
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v10 = v9;
        v11 = CFSTR("HARDWARE_SLOT_TWO_NAME");
        goto LABEL_17;
      }
      goto LABEL_27;
    }
    if (v14 == (id)1)
    {
      if (!v8)
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v10 = v9;
        v11 = CFSTR("HARDWARE_SLOT_ONE_NAME");
        goto LABEL_17;
      }
      goto LABEL_27;
    }
LABEL_25:
    v12 = 0;
    goto LABEL_29;
  }
  if (objc_msgSend(v6, "hardwareType") == (id)2)
  {
    if (!-[TSSIMUnlockListViewController _doTwoEsimsExist](self, "_doTwoEsimsExist"))
    {
      if (!v8)
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v10 = v9;
        v11 = CFSTR("COMBINATION_SIMS_ESIM_NAME");
        goto LABEL_17;
      }
LABEL_27:
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "text"));
      v13 = objc_claimAutoreleasedReturnValue(+[NSString stringWithString:](NSString, "stringWithString:", v10));
      goto LABEL_28;
    }
    if (objc_msgSend(v4, "slotID") == (id)1)
    {
      if (!v8)
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v10 = v9;
        v11 = CFSTR("COMBINATION_SIMS_ESIM_1_NAME");
LABEL_17:
        v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedStringForKey:value:table:", v11, &stru_10001CAA0, CFSTR("Localizable")));
LABEL_28:
        v12 = (void *)v13;

        goto LABEL_29;
      }
      goto LABEL_27;
    }
    if (objc_msgSend(v4, "slotID") == (id)2)
    {
      if (!v8)
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v10 = v9;
        v11 = CFSTR("COMBINATION_SIMS_ESIM_2_NAME");
        goto LABEL_17;
      }
      goto LABEL_27;
    }
    goto LABEL_25;
  }
  if (!v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v10 = v9;
    v11 = CFSTR("COMBINATION_SIMS_PHYSICAL_NAME");
    goto LABEL_17;
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "text"));
LABEL_29:

  return v12;
}

- (NSMutableArray)subscriptionContexts
{
  return self->_subscriptionContexts;
}

- (NSMutableDictionary)subscriptionActions
{
  return self->_subscriptionActions;
}

- (TSSIMUnlockListViewControllerDelegate)delegate
{
  return (TSSIMUnlockListViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)isEsimExist
{
  return self->_isEsimExist;
}

- (void)setIsEsimExist:(BOOL)a3
{
  self->_isEsimExist = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_subscriptionActions, 0);
  objc_storeStrong((id *)&self->_subscriptionContexts, 0);
  objc_storeStrong((id *)&self->_tableFooterView, 0);
  objc_storeStrong((id *)&self->_footerView, 0);
  objc_storeStrong((id *)&self->_headerView, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_cancelButtonItem, 0);
  objc_storeStrong((id *)&self->_telephonyClient, 0);
}

@end
