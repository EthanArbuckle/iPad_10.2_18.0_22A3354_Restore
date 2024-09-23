@implementation UnknownPartViewController

- (UnknownPartViewController)initWithComponent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  UnknownPartViewController *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  objc_super v23;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", v4, &stru_10000C368, CFSTR("RepairSummaryPlugin-Release")));

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("UNKOWN_PART_TITLE"), &stru_10000C368, CFSTR("RepairSummaryPlugin-Release")));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v8, v6));

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[UnknownPartViewController navigationItem](self, "navigationItem"));
  objc_msgSend(v10, "setHidesBackButton:", 1);

  -[UnknownPartViewController setScrollingDisabled:](self, "setScrollingDisabled:", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemYellowColor](UIColor, "systemYellowColor"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithHierarchicalColor:](UIImageSymbolConfiguration, "configurationWithHierarchicalColor:", v11));

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("exclamationmark.triangle")));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "imageByApplyingSymbolConfiguration:", v12));

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("UNKOWN_PART_DETAIL_TEXT"), &stru_10000C368, CFSTR("RepairSummaryPlugin-Release")));

  v23.receiver = self;
  v23.super_class = (Class)UnknownPartViewController;
  v17 = -[UnknownPartViewController initWithTitle:detailText:icon:](&v23, "initWithTitle:detailText:icon:", v9, v16, v14);
  if (v17)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[OBBoldTrayButton boldButton](OBBoldTrayButton, "boldButton"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("CONTINUE"), &stru_10000C368, CFSTR("RepairSummaryPlugin-Release")));
    objc_msgSend(v18, "setTitle:forState:", v20, 0);

    objc_msgSend(v18, "addTarget:action:forControlEvents:", v17, "_continueTapped", 64);
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[UnknownPartViewController buttonTray](v17, "buttonTray"));
    objc_msgSend(v21, "addButton:", v18);

  }
  return v17;
}

- (void)_continueTapped
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  uint8_t v6[16];

  v3 = handleForCategory(0);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Continue button tapped", v6, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[UnknownPartViewController coordinator](self, "coordinator"));
  objc_msgSend(v5, "moveToNextViewController");

}

- (RepairSummaryNavigationCoordinator)coordinator
{
  return (RepairSummaryNavigationCoordinator *)objc_loadWeakRetained((id *)&self->_coordinator);
}

- (void)setCoordinator:(id)a3
{
  objc_storeWeak((id *)&self->_coordinator, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_coordinator);
}

@end
