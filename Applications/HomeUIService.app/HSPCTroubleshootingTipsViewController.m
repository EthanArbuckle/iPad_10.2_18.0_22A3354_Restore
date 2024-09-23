@implementation HSPCTroubleshootingTipsViewController

- (HSPCTroubleshootingTipsViewController)initWithCoordinator:(id)a3 config:(id)a4
{
  id v7;
  id v8;
  id v9;
  id v10;
  HSPCTroubleshootingTipsViewController *v11;
  HSPCTroubleshootingTipsViewController *v12;
  id v13;
  id WeakRetained;
  id v15;
  void *v16;
  id v17;
  id v18;
  objc_super v20;

  v7 = a3;
  v8 = a4;
  v9 = objc_msgSend(objc_alloc((Class)UITableView), "initWithFrame:style:", 0, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  v10 = objc_msgSend(objc_alloc((Class)PRXScrollableContentView), "initWithCardStyle:scrollView:", 0, v9);
  v20.receiver = self;
  v20.super_class = (Class)HSPCTroubleshootingTipsViewController;
  v11 = -[HSPCTroubleshootingTipsViewController initWithContentView:](&v20, "initWithContentView:", v10);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_coordinator, a3);
    objc_storeStrong((id *)&v12->_config, a4);
    v13 = objc_storeWeak((id *)&v12->_tableView, v9);
    objc_msgSend(v9, "setAllowsSelection:", 0);

    WeakRetained = objc_loadWeakRetained((id *)&v12->_tableView);
    objc_msgSend(WeakRetained, "setDataSource:", v12);

    v15 = objc_loadWeakRetained((id *)&v12->_tableView);
    objc_msgSend(v15, "setDelegate:", v12);

    v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    v17 = objc_loadWeakRetained((id *)&v12->_tableView);
    objc_msgSend(v17, "setSeparatorColor:", v16);

    v18 = -[HSPCTroubleshootingTipsViewController addProminentDismissButtonWithTitleKey:](v12, "addProminentDismissButtonWithTitleKey:", CFSTR("HUDoneTitle"));
  }

  return v12;
}

- (void)setPage:(unint64_t)a3
{
  __CFString *v4;
  id v5;
  id v6;

  self->_page = a3;
  if (a3)
  {
    if (a3 != 1)
      return;
    v4 = CFSTR("HSTroubleshootingTipCantScanCodePageTitle");
  }
  else
  {
    v4 = CFSTR("HSTroubleshootingTipAccessoryNotShownPageTitle");
  }
  v5 = sub_1000593D8(v4);
  v6 = (id)objc_claimAutoreleasedReturnValue(v5);
  -[HSPCTroubleshootingTipsViewController setTitle:](self, "setTitle:", v6);

}

- (id)commitConfiguration
{
  return +[NAFuture futureWithResult:](NAFuture, "futureWithResult:", &off_1000A8320);
}

- (void)viewDidLoad
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HSPCTroubleshootingTipsViewController;
  -[HSPCTroubleshootingTipsViewController viewDidLoad](&v4, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCTroubleshootingTipsViewController tableView](self, "tableView"));
  objc_msgSend(v3, "reloadData");

}

- (void)actionInvokedForTip:(unint64_t)a3
{
  uint64_t v4;
  NSObject *v5;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  uint8_t buf[4];
  unint64_t v12;

  if (a3)
  {
    v4 = HFLogForCategory(58, a2);
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v12 = a3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Unknown action to invoke for tip %lu", buf, 0xCu);
    }

  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCTroubleshootingTipsViewController coordinator](self, "coordinator"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "didReceiveSetupCode:fromViewController:", 0, self));
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100032258;
    v10[3] = &unk_1000A22E0;
    v10[4] = self;
    v9 = objc_msgSend(v8, "addCompletionBlock:", v10);

  }
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return -[HSPCTroubleshootingTipsViewController _tipCount](self, "_tipCount", a3, a4);
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  HSSetupTroubleshootingTipCell *v7;

  v6 = a4;
  v7 = (HSSetupTroubleshootingTipCell *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "dequeueReusableCellWithIdentifier:", CFSTR("Cell")));
  if (!v7)
    v7 = -[HSSetupTroubleshootingTipCell initWithStyle:reuseIdentifier:]([HSSetupTroubleshootingTipCell alloc], "initWithStyle:reuseIdentifier:", 0, CFSTR("Cell"));
  -[HSSetupTroubleshootingTipCell setTip:](v7, "setTip:", -[HSPCTroubleshootingTipsViewController _tipForIndexPath:](self, "_tipForIndexPath:", v6));
  -[HSSetupTroubleshootingTipCell setDelegate:](v7, "setDelegate:", self);

  return v7;
}

- (unint64_t)_tipForIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCTroubleshootingTipsViewController _tips](self, "_tips"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndexedSubscript:", -[HSPCTroubleshootingTipsViewController page](self, "page")));
  v7 = objc_msgSend(v4, "row");

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndexedSubscript:", v7));
  v9 = objc_msgSend(v8, "unsignedIntegerValue");

  return (unint64_t)v9;
}

- (unint64_t)_tipCount
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCTroubleshootingTipsViewController _tips](self, "_tips"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectAtIndexedSubscript:", -[HSPCTroubleshootingTipsViewController page](self, "page")));
  v5 = objc_msgSend(v4, "count");

  return (unint64_t)v5;
}

- (HSProxCardCoordinator)coordinator
{
  return (HSProxCardCoordinator *)objc_getProperty(self, a2, 8, 1);
}

- (void)setCoordinator:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (HSSetupStateMachineConfiguration)config
{
  return (HSSetupStateMachineConfiguration *)objc_getProperty(self, a2, 16, 1);
}

- (void)setConfig:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (unint64_t)page
{
  return self->_page;
}

- (UITableView)tableView
{
  return (UITableView *)objc_loadWeakRetained((id *)&self->_tableView);
}

- (void)setTableView:(id)a3
{
  objc_storeWeak((id *)&self->_tableView, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_tableView);
  objc_storeStrong((id *)&self->_config, 0);
  objc_storeStrong((id *)&self->_coordinator, 0);
}

@end
