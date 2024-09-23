@implementation CARSetupContainerViewController

- (void)viewDidLoad
{
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)CARSetupContainerViewController;
  -[CARSetupContainerViewController viewDidLoad](&v14, "viewDidLoad");
  v3 = CARSetupLogForCategory(0);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    sub_100006904(v4, v5, v6, v7, v8, v9, v10, v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CARSetupContainerViewController view](self, "view"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  objc_msgSend(v12, "setBackgroundColor:", v13);

}

- (void)viewDidAppear:(BOOL)a3
{
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)CARSetupContainerViewController;
  -[CARSetupContainerViewController viewDidAppear:](&v12, "viewDidAppear:", a3);
  v3 = CARSetupLogForCategory(0);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    sub_100006938(v4, v5, v6, v7, v8, v9, v10, v11);

}

- (unint64_t)supportedInterfaceOrientations
{
  return 2;
}

- (void)_setupPromptPresenter
{
  CARSetupPromptPresenter *v3;

  v3 = -[CARSetupPromptPresenter initWithPresentingViewController:]([CARSetupPromptPresenter alloc], "initWithPresentingViewController:", self);
  -[CARSetupContainerViewController setPromptPresenter:](self, "setPromptPresenter:", v3);

}

- (void)configureWithContext:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  uint64_t v8;
  NSObject *v9;
  void *v10;
  void *v11;
  int v12;
  id v13;
  __int16 v14;
  void *v15;

  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  v8 = CARSetupLogForCategory(0);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "userInfo"));
    v12 = 138412546;
    v13 = v6;
    v14 = 2112;
    v15 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Configure with context %@ userinfo %@", (uint8_t *)&v12, 0x16u);

  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CARSetupContainerViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy"));
  objc_msgSend(v11, "setAllowsAlertItems:", 0);
  if (v7)
    v7[2](v7);

}

- (void)prepareForActivationWithContext:(id)a3 completion:(id)a4
{
  void *v5;
  id v6;

  v6 = a4;
  -[CARSetupContainerViewController _setupPromptPresenter](self, "_setupPromptPresenter");
  v5 = v6;
  if (v6)
  {
    (*((void (**)(id))v6 + 2))(v6);
    v5 = v6;
  }

}

- (void)handleButtonActions:(id)a3
{
  objc_msgSend(a3, "enumerateObjectsUsingBlock:", &stru_10000C380);
}

- (CARSetupPromptPresenter)promptPresenter
{
  return self->_promptPresenter;
}

- (void)setPromptPresenter:(id)a3
{
  objc_storeStrong((id *)&self->_promptPresenter, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_promptPresenter, 0);
}

@end
