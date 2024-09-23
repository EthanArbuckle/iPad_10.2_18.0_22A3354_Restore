@implementation SPUIApplication

- (BOOL)runTest:(id)a3 options:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  unsigned __int8 v10;
  BOOL v11;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[SPUISearchViewControllerHolder sharedInstance](SPUISearchViewControllerHolder, "sharedInstance"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "searchViewController"));
  v10 = objc_msgSend(v9, "runTest:options:", v6, v7);

  if ((v10 & 1) != 0)
  {
    v11 = 1;
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)SPUIApplication;
    v11 = -[SPUIApplication runTest:options:](&v13, "runTest:options:", v6, v7);
  }

  return v11;
}

- (void)startedTest:(id)a3
{
  id v4;
  unsigned int v5;
  void *v6;
  void *v7;
  void *v8;
  dispatch_time_t v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SPUIApplication;
  v4 = a3;
  -[SPUIApplication startedTest:](&v10, "startedTest:", v4);
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("launch"), v10.receiver, v10.super_class);

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[SPUIApplication _extendLaunchTest](self, "_extendLaunchTest"));
    -[SPUIApplication runTest:options:](self, "runTest:options:", v6, 0);

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[SPUISearchViewControllerHolder sharedInstance](SPUISearchViewControllerHolder, "sharedInstance"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "searchViewController"));
    objc_msgSend(v8, "searchViewWillPresentFromSource:", 1);

    v9 = dispatch_time(0, 50000000);
    dispatch_after(v9, (dispatch_queue_t)&_dispatch_main_q, &stru_10000C3C0);
  }
}

- (id)_extendLaunchTest
{
  return SPUIExtendedLaunchConstant;
}

- (BOOL)shouldRecordExtendedLaunchTime
{
  return 1;
}

@end
