@implementation HSPCGuestAccessTableViewController

- (HSPCGuestAccessTableViewController)initWithCoordinator:(id)a3 config:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  HSPCGuestAccessItemManager *v12;
  void *v13;
  void *v14;
  HSPCGuestAccessItemManager *v15;
  HSPCGuestAccessTableViewController *v16;
  HSPCGuestAccessTableViewController *v17;
  NAFuture *commitInProgress;
  objc_super v20;

  v7 = a3;
  v8 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "home"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "pinCodeManagerForHome:", v10));

  v12 = [HSPCGuestAccessItemManager alloc];
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "home"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "addedAccessory"));
  v15 = -[HSPCGuestAccessItemManager initWithPinCodeManager:delegate:home:forAccessory:](v12, "initWithPinCodeManager:delegate:home:forAccessory:", v11, self, v13, v14);

  v20.receiver = self;
  v20.super_class = (Class)HSPCGuestAccessTableViewController;
  v16 = -[HSPCGuestAccessTableViewController initWithItemManager:tableViewStyle:](&v20, "initWithItemManager:tableViewStyle:", v15, 2);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_config, a4);
    objc_storeStrong((id *)&v17->_coordinator, a3);
    commitInProgress = v17->_commitInProgress;
    v17->_commitInProgress = 0;

  }
  return v17;
}

- (HSPCGuestAccessTableViewController)init
{
  void *v4;
  NSString *v5;
  void *v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
  v5 = NSStringFromSelector("initWithCoordinator:config:");
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HSPCGuestAccessTableViewController.m"), 56, CFSTR("%s is unavailable; use %@ instead"),
    "-[HSPCGuestAccessTableViewController init]",
    v6);

  return 0;
}

- (HSPCGuestAccessTableViewController)initWithItemManager:(id)a3 tableViewStyle:(int64_t)a4
{
  void *v6;
  NSString *v7;
  void *v8;

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler", a3, a4));
  v7 = NSStringFromSelector("initWithCoordinator:config:");
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HSPCGuestAccessTableViewController.m"), 62, CFSTR("%s is unavailable; use %@ instead"),
    "-[HSPCGuestAccessTableViewController initWithItemManager:tableViewStyle:]",
    v8);

  return 0;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)HSPCGuestAccessTableViewController;
  -[HSPCGuestAccessTableViewController viewDidLoad](&v10, "viewDidLoad");
  -[HSPCGuestAccessTableViewController setWantsPreferredContentSize:](self, "setWantsPreferredContentSize:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCGuestAccessTableViewController tableView](self, "tableView"));
  objc_msgSend(v3, "setAllowsMultipleSelection:", 1);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCGuestAccessTableViewController tableView](self, "tableView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "layer"));
  objc_msgSend(v5, "setMasksToBounds:", 1);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCGuestAccessTableViewController tableView](self, "tableView"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "layer"));
  objc_msgSend(v7, "setCornerRadius:", 20.0);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCGuestAccessTableViewController tableView](self, "tableView"));
  objc_msgSend(v8, "setEstimatedRowHeight:", 88.0);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCGuestAccessTableViewController tableView](self, "tableView"));
  objc_msgSend(v9, "setRowHeight:", UITableViewAutomaticDimension);

}

- (id)_enableAccessIncludingGuestPinCodeItems:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = a3;
  v6 = objc_opt_class(HSPCGuestAccessItemManager, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCGuestAccessTableViewController itemManager](self, "itemManager"));
  if ((objc_opt_isKindOfClass(v7, v6) & 1) != 0)
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "pinCodeManager"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCGuestAccessTableViewController config](self, "config"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "addedAccessory"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "enablePinCodesForNewAccessory:forGuestItems:", v12, v4));

  return v13;
}

- (void)_updateCellInTableView:(id)a3 atIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCGuestAccessTableViewController itemManager](self, "itemManager"));
  v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "displayedItemAtIndexPath:", v6));

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "cellForRowAtIndexPath:", v6));
  -[HSPCGuestAccessTableViewController updateCell:forItem:indexPath:animated:](self, "updateCell:forItem:indexPath:animated:", v9, v10, v6, 1);

}

- (id)commitConfiguration
{
  uint64_t v3;
  void *v4;
  void *v5;
  unsigned __int8 v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *i;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  _QWORD v30[5];
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];

  v3 = objc_claimAutoreleasedReturnValue(-[HSPCGuestAccessTableViewController commitInProgress](self, "commitInProgress"));
  if (v3)
  {
    v4 = (void *)v3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCGuestAccessTableViewController commitInProgress](self, "commitInProgress"));
    v6 = objc_msgSend(v5, "isFinished");

    if ((v6 & 1) == 0)
      return (id)objc_claimAutoreleasedReturnValue(+[NAFuture futureWithResult:](NAFuture, "futureWithResult:", &off_1000A7EB8));
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCGuestAccessTableViewController tableView](self, "tableView"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "indexPathsForSelectedRows"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v10 = v8;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(_QWORD *)v32 != v13)
          objc_enumerationMutation(v10);
        v15 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * (_QWORD)i);
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCGuestAccessTableViewController itemManager](self, "itemManager"));
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "displayedItemAtIndexPath:", v15));

        v19 = objc_opt_class(HFPinCodeItem, v18);
        v20 = v17;
        if ((objc_opt_isKindOfClass(v20, v19) & 1) != 0)
          v21 = v20;
        else
          v21 = 0;
        v22 = v21;

        objc_msgSend(v9, "na_safeAddObject:", v22);
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    }
    while (v12);
  }

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCGuestAccessTableViewController _enableAccessIncludingGuestPinCodeItems:](self, "_enableAccessIncludingGuestPinCodeItems:", v9));
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_1000047E4;
  v30[3] = &unk_1000A0D90;
  v30[4] = self;
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "addCompletionBlock:", v30));
  -[HSPCGuestAccessTableViewController setCommitInProgress:](self, "setCommitInProgress:", v24);

  v25 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCGuestAccessTableViewController itemManager](self, "itemManager"));
  objc_msgSend(v25, "disableExternalUpdatesWithReason:", CFSTR("setupGuestAccessTableViewControllerUpdatesDisabledReason "));

  v26 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCGuestAccessTableViewController commitInProgress](self, "commitInProgress"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "flatMap:", &stru_1000A0DD0));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "recover:", &stru_1000A0E10));

  return v28;
}

- (BOOL)shouldHideHeaderAboveSection:(int64_t)a3
{
  return 1;
}

- (BOOL)shouldHideFooterBelowSection:(int64_t)a3
{
  return 1;
}

- (Class)cellClassForItem:(id)a3 indexPath:(id)a4
{
  return (Class)objc_opt_class(UITableViewCell, a2, a3, a4);
}

- (void)setupCell:(id)a3 forItem:(id)a4 indexPath:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  objc_super v21;

  v8 = a3;
  v9 = a4;
  v21.receiver = self;
  v21.super_class = (Class)HSPCGuestAccessTableViewController;
  -[HSPCGuestAccessTableViewController setupCell:forItem:indexPath:](&v21, "setupCell:forItem:indexPath:", v8, v9, a5);
  v11 = objc_opt_class(HFPinCodeItem, v10);
  v12 = v9;
  if ((objc_opt_isKindOfClass(v12, v11) & 1) != 0)
    v13 = v12;
  else
    v13 = 0;
  v14 = v13;

  if (v14)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIListContentConfiguration cellConfiguration](UIListContentConfiguration, "cellConfiguration"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[HUListContentConfigurationUtilities labelConfiguration:forItem:](HUListContentConfigurationUtilities, "labelConfiguration:forItem:", v15, v14));

    objc_msgSend(v16, "setPrefersSideBySideTextAndSecondaryText:", 0);
    v17 = HUDefaultAvatarSize;
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "imageProperties"));
    objc_msgSend(v18, "setReservedLayoutSize:", v17, v17);

    v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemGray2Color](UIColor, "systemGray2Color"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "imageProperties"));
    objc_msgSend(v20, "setTintColor:", v19);

    objc_msgSend(v16, "setAxesPreservingSuperviewLayoutMargins:", 2);
    objc_msgSend(v8, "setContentConfiguration:", v16);

  }
}

- (void)updateCell:(id)a3 forItem:(id)a4 indexPath:(id)a5 animated:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  void *v21;
  id v22;
  uint64_t v23;
  BOOL v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  void *v28;
  void *v29;
  NSObject *v30;
  const __CFString *v32;
  void *v33;
  id v34;
  void *v35;
  objc_super v36;
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  const char *v40;
  __int16 v41;
  id v42;
  __int16 v43;
  id v44;

  v6 = a6;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v36.receiver = self;
  v36.super_class = (Class)HSPCGuestAccessTableViewController;
  -[HSPCGuestAccessTableViewController updateCell:forItem:indexPath:animated:](&v36, "updateCell:forItem:indexPath:animated:", v10, v11, v12, v6);
  v14 = objc_opt_class(UITableViewCell, v13);
  v15 = v10;
  if ((objc_opt_isKindOfClass(v15, v14) & 1) != 0)
    v16 = v15;
  else
    v16 = 0;
  v17 = v16;

  v19 = objc_opt_class(HFPinCodeItem, v18);
  v20 = v11;
  if ((objc_opt_isKindOfClass(v20, v19) & 1) != 0)
    v21 = v20;
  else
    v21 = 0;
  v22 = v21;

  if (v22)
    v24 = v17 == 0;
  else
    v24 = 1;
  if (v24)
  {
    v25 = HFLogForCategory(50, v23);
    v30 = objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      v27 = objc_msgSend((id)objc_opt_class(self, v26), "description");
      v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
      *(_DWORD *)buf = 138413058;
      v38 = v28;
      v39 = 2080;
      v40 = "-[HSPCGuestAccessTableViewController updateCell:forItem:indexPath:animated:]";
      v41 = 2112;
      v42 = v15;
      v43 = 2112;
      v44 = v20;
      _os_log_error_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "(%@:%s) cell %@ should be UITableViewCell, and item %@ should be HFPinCodeItem", buf, 0x2Au);

    }
  }
  else
  {
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCGuestAccessTableViewController tableView](self, "tableView"));
    v30 = objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "indexPathsForSelectedRows"));

    if (-[NSObject containsObject:](v30, "containsObject:", v12))
      v32 = CFSTR("checkmark.circle.fill");
    else
      v32 = CFSTR("circle");
    v33 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", v32));
    v34 = objc_msgSend(objc_alloc((Class)UIImageView), "initWithImage:", v33);

    objc_msgSend(v17, "setAccessoryView:", v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    objc_msgSend(v17, "setBackgroundColor:", v35);

    objc_msgSend(v17, "setSelectionStyle:", 0);
  }

}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HSPCGuestAccessTableViewController;
  v6 = a4;
  v7 = a3;
  -[HSPCGuestAccessTableViewController tableView:didSelectRowAtIndexPath:](&v8, "tableView:didSelectRowAtIndexPath:", v7, v6);
  -[HSPCGuestAccessTableViewController _updateCellInTableView:atIndexPath:](self, "_updateCellInTableView:atIndexPath:", v7, v6, v8.receiver, v8.super_class);

}

- (HSSetupStateMachineConfiguration)config
{
  return (HSSetupStateMachineConfiguration *)objc_getProperty(self, a2, 8, 1);
}

- (void)setConfig:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (HSProxCardCoordinator)coordinator
{
  return (HSProxCardCoordinator *)objc_getProperty(self, a2, 16, 1);
}

- (void)setCoordinator:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NAFuture)commitInProgress
{
  return self->_commitInProgress;
}

- (void)setCommitInProgress:(id)a3
{
  objc_storeStrong((id *)&self->_commitInProgress, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_commitInProgress, 0);
  objc_storeStrong((id *)&self->_coordinator, 0);
  objc_storeStrong((id *)&self->_config, 0);
}

@end
