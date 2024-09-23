@implementation HSPCSuggestedAutomationsViewController

- (HSPCSuggestedAutomationsViewController)initWithCoordinator:(id)a3 config:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  uint64_t v15;
  NSObject *v16;
  HSPCSuggestedAutomationsItemManager *v17;
  HSPCSuggestedAutomationsViewController *v18;
  HSPCSuggestedAutomationsViewController *v19;
  void *v20;
  void *v21;
  NAFuture *commitInProgress;
  objc_super v24;
  uint8_t buf[4];
  void *v26;

  v7 = a3;
  v8 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "addedAccessory"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v11 = objc_alloc_init((Class)HFNullValueSource);
  if (objc_msgSend(v9, "hf_isMediaAccessory"))
  {
    v12 = objc_alloc((Class)HFMediaAccessoryItem);
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "mediaProfile"));
    v14 = objc_msgSend(v12, "initWithValueSource:mediaProfileContainer:", v11, v13);

  }
  else
  {
    v14 = objc_msgSend(objc_alloc((Class)HFAccessoryItem), "initWithAccessory:valueSource:", v9, v11);
  }
  objc_msgSend(v10, "addObject:", v14);
  v15 = HFLogForCategory(62);
  v16 = objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v26 = v9;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Setting up HSPCSuggestedAutomationsViewController with accessory: %@", buf, 0xCu);
  }

  v17 = -[HSPCSuggestedAutomationsItemManager initWithDelegate:serviceLikeItems:]([HSPCSuggestedAutomationsItemManager alloc], "initWithDelegate:serviceLikeItems:", self, v10);
  v24.receiver = self;
  v24.super_class = (Class)HSPCSuggestedAutomationsViewController;
  v18 = -[HSPCSuggestedAutomationsViewController initWithItemManager:tableViewStyle:](&v24, "initWithItemManager:tableViewStyle:", v17, 0);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_config, a4);
    objc_storeStrong((id *)&v19->_coordinator, a3);
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCSuggestedAutomationsViewController tableView](v19, "tableView"));
    objc_msgSend(v21, "setBackgroundColor:", v20);

    commitInProgress = v19->_commitInProgress;
    v19->_commitInProgress = 0;

  }
  return v19;
}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HSPCSuggestedAutomationsViewController;
  -[HSPCSuggestedAutomationsViewController viewDidLoad](&v3, "viewDidLoad");
  -[HSPCSuggestedAutomationsViewController setWantsPreferredContentSize:](self, "setWantsPreferredContentSize:", 1);
}

- (id)buildItemModuleControllerForModule:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  HUAvailableRelatedTriggerItemModuleController *v10;
  HUAvailableRelatedTriggerItemModuleController *recommendationModuleController;
  uint64_t v12;
  id v13;
  void *v14;
  objc_super v16;

  v4 = a3;
  v6 = objc_opt_class(HUAvailableRelatedTriggerItemModule, v5);
  v7 = v4;
  if ((objc_opt_isKindOfClass(v7, v6) & 1) != 0)
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;

  if (v9)
  {
    v10 = (HUAvailableRelatedTriggerItemModuleController *)objc_msgSend(objc_alloc((Class)HUAvailableRelatedTriggerItemModuleController), "initWithModule:", v9);
    recommendationModuleController = self->_recommendationModuleController;
    self->_recommendationModuleController = v10;

    v12 = objc_claimAutoreleasedReturnValue(-[HSPCSuggestedAutomationsViewController recommendationModuleController](self, "recommendationModuleController"));
  }
  else
  {
    v16.receiver = self;
    v16.super_class = (Class)HSPCSuggestedAutomationsViewController;
    v13 = -[HSPCSuggestedAutomationsViewController buildItemModuleControllerForModule:](&v16, "buildItemModuleControllerForModule:", v7);
    v12 = objc_claimAutoreleasedReturnValue(v13);
  }
  v14 = (void *)v12;

  return v14;
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
  void *v10;
  void *v11;
  void *v12;

  v3 = objc_claimAutoreleasedReturnValue(-[HSPCSuggestedAutomationsViewController commitInProgress](self, "commitInProgress"));
  if (v3
    && (v4 = (void *)v3,
        v5 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCSuggestedAutomationsViewController commitInProgress](self, "commitInProgress")),
        v6 = objc_msgSend(v5, "isFinished"),
        v5,
        v4,
        (v6 & 1) == 0))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NAFuture futureWithResult:](NAFuture, "futureWithResult:", &off_1000A8BD8));
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCSuggestedAutomationsViewController recommendationModuleController](self, "recommendationModuleController"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "commitSelectedItems"));
    -[HSPCSuggestedAutomationsViewController setCommitInProgress:](self, "setCommitInProgress:", v8);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCSuggestedAutomationsViewController itemManager](self, "itemManager"));
    objc_msgSend(v9, "disableExternalUpdatesWithReason:", CFSTR("setupSuggestedAutomationsVCUpdatesDisabledReason"));

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCSuggestedAutomationsViewController commitInProgress](self, "commitInProgress"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "flatMap:", &stru_1000A37B8));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "recover:", &stru_1000A37D8));

  }
  return v12;
}

- (BOOL)shouldHideHeaderAboveSection:(int64_t)a3
{
  return 1;
}

- (BOOL)shouldHideFooterBelowSection:(int64_t)a3
{
  return 1;
}

- (id)shouldSkip
{
  NSNumber *v2;
  void *v3;
  void *v4;
  _QWORD v6[5];

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10005DB40;
  v6[3] = &unk_1000A3840;
  v6[4] = self;
  v2 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", sub_10005DB40((uint64_t)v6));
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NAFuture futureWithResult:](NAFuture, "futureWithResult:", v3));

  return v4;
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

- (HUAvailableRelatedTriggerItemModuleController)recommendationModuleController
{
  return self->_recommendationModuleController;
}

- (void)setRecommendationModuleController:(id)a3
{
  objc_storeStrong((id *)&self->_recommendationModuleController, a3);
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
  objc_storeStrong((id *)&self->_recommendationModuleController, 0);
  objc_storeStrong((id *)&self->_coordinator, 0);
  objc_storeStrong((id *)&self->_config, 0);
}

@end
