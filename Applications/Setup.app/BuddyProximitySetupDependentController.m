@implementation BuddyProximitySetupDependentController

- (BuddyProximitySetupDependentController)initWithMessageSession:(id)a3 featureFlags:(id)a4
{
  id v5;
  BuddyProximitySetupDependentParentViewController *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  BuddyProximitySetupDependentController *v13;
  void **v15;
  int v16;
  int v17;
  void (*v18)(id *, void *);
  void *v19;
  id v20;
  objc_super v21;
  id obj;
  id location[2];
  id v24;

  v24 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  obj = 0;
  objc_storeStrong(&obj, a4);
  v5 = v24;
  v24 = 0;
  v21.receiver = v5;
  v21.super_class = (Class)BuddyProximitySetupDependentController;
  v24 = -[BuddyProximitySetupDependentController init](&v21, "init");
  objc_storeStrong(&v24, v24);
  if (v24)
  {
    v6 = objc_alloc_init(BuddyProximitySetupDependentParentViewController);
    v7 = (void *)*((_QWORD *)v24 + 4);
    *((_QWORD *)v24 + 4) = v6;

    v8 = objc_alloc((Class)sub_100116F34());
    v9 = objc_msgSend(v8, "initWithParentViewController:", *((_QWORD *)v24 + 4));
    v10 = (void *)*((_QWORD *)v24 + 5);
    *((_QWORD *)v24 + 5) = v9;

    objc_msgSend(*((id *)v24 + 5), "setDelegate:", v24);
    objc_storeStrong((id *)v24 + 3, obj);
    v11 = (void *)*((_QWORD *)v24 + 5);
    v12 = location[0];
    v15 = _NSConcreteStackBlock;
    v16 = -1073741824;
    v17 = 0;
    v18 = sub_100117020;
    v19 = &unk_100283140;
    v20 = v24;
    objc_msgSend(v11, "activateWithTemplateMessageSession:completion:", v12, &v15);
    objc_storeStrong(&v20, 0);
  }
  v13 = (BuddyProximitySetupDependentController *)v24;
  objc_storeStrong(&obj, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong(&v24, 0);
  return v13;
}

- (void)setDelegate:(id)a3
{
  PASFlowResult *v3;
  PASUIDependentViewPresenterDelegate *v4;
  PASFlowResult *v5;
  id v6;
  PASUIDependentViewPresenterDelegate *v7;
  id v8;
  id location[2];
  BuddyProximitySetupDependentController *v10;

  v10 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);

  objc_storeWeak((id *)&v10->_delegate, location[0]);
  v3 = -[BuddyProximitySetupDependentController result](v10, "result");

  if (v3)
  {
    v4 = -[BuddyProximitySetupDependentController delegate](v10, "delegate");
    v5 = -[BuddyProximitySetupDependentController result](v10, "result");
    -[PASUIDependentViewPresenterDelegate proximitySetupCompletedWithResult:](v4, "proximitySetupCompletedWithResult:", v5);

    -[BuddyProximitySetupDependentController setResult:](v10, "setResult:", 0);
  }
  else
  {
    v6 = -[BuddyProximitySetupDependentController passcodeSetUpCompletionBlock](v10, "passcodeSetUpCompletionBlock");

    if (v6)
    {
      v7 = -[BuddyProximitySetupDependentController delegate](v10, "delegate");
      v8 = -[BuddyProximitySetupDependentController passcodeSetUpCompletionBlock](v10, "passcodeSetUpCompletionBlock");
      -[PASUIDependentViewPresenterDelegate setupPasscodeAndBiometricWithCompletion:](v7, "setupPasscodeAndBiometricWithCompletion:", v8);

      -[BuddyProximitySetupDependentController setPasscodeSetUpCompletionBlock:](v10, "setPasscodeSetUpCompletionBlock:", 0);
    }
  }
  objc_storeStrong(location, 0);
}

- (void)waitForViewController:(id)a3
{
  void *v3;
  void **block;
  int v5;
  int v6;
  void (*v7)(uint64_t);
  void *v8;
  BuddyProximitySetupDependentController *v9;
  id v10;
  id location[2];
  BuddyProximitySetupDependentController *v12;

  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = &_dispatch_main_q;
  block = _NSConcreteStackBlock;
  v5 = -1073741824;
  v6 = 0;
  v7 = sub_10011744C;
  v8 = &unk_1002806E0;
  v9 = v12;
  v10 = location[0];
  dispatch_async((dispatch_queue_t)v3, &block);

  objc_storeStrong(&v10, 0);
  objc_storeStrong((id *)&v9, 0);
  objc_storeStrong(location, 0);
}

- (void)waitForSelectedAccountType:(id)a3
{
  void *v3;
  void **block;
  int v5;
  int v6;
  id (*v7)(uint64_t);
  void *v8;
  BuddyProximitySetupDependentController *v9;
  id v10;
  id location[2];
  BuddyProximitySetupDependentController *v12;

  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = &_dispatch_main_q;
  block = _NSConcreteStackBlock;
  v5 = -1073741824;
  v6 = 0;
  v7 = sub_1001175C8;
  v8 = &unk_1002806E0;
  v9 = v12;
  v10 = location[0];
  dispatch_async((dispatch_queue_t)v3, &block);

  objc_storeStrong(&v10, 0);
  objc_storeStrong((id *)&v9, 0);
  objc_storeStrong(location, 0);
}

- (void)setParentViewController:(id)a3
{
  void *v3;
  id location[2];
  BuddyProximitySetupDependentController *v5;

  v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = &_dispatch_main_q;
  dispatch_assert_queue_V2((dispatch_queue_t)v3);

  objc_storeStrong((id *)&v5->_parentViewController, location[0]);
  objc_storeStrong(location, 0);
}

- (void)setDependentViewPresenter:(id)a3
{
  void *v3;
  id location[2];
  BuddyProximitySetupDependentController *v5;

  v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = &_dispatch_main_q;
  dispatch_assert_queue_V2((dispatch_queue_t)v3);

  objc_storeStrong((id *)&v5->_dependentViewPresenter, location[0]);
  objc_storeStrong(location, 0);
}

- (void)setReadyForPresentation:(id)a3
{
  void *v3;
  id location[2];
  BuddyProximitySetupDependentController *v5;

  v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = &_dispatch_main_q;
  dispatch_assert_queue_V2((dispatch_queue_t)v3);

  objc_storeStrong((id *)&v5->_readyForPresentation, location[0]);
  objc_storeStrong(location, 0);
}

- (void)setViewControllerAvailableBlock:(id)a3
{
  void *v3;
  id v4;
  id viewControllerAvailableBlock;
  id location[2];
  BuddyProximitySetupDependentController *v7;

  v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = &_dispatch_main_q;
  dispatch_assert_queue_V2((dispatch_queue_t)v3);

  v4 = objc_retainBlock(location[0]);
  viewControllerAvailableBlock = v7->_viewControllerAvailableBlock;
  v7->_viewControllerAvailableBlock = v4;

  objc_storeStrong(location, 0);
}

- (void)setAccountType:(int64_t)a3
{
  void *v3;

  v3 = &_dispatch_main_q;
  dispatch_assert_queue_V2((dispatch_queue_t)v3);

  self->_accountType = a3;
}

- (void)setAccountTypeSelectedBlock:(id)a3
{
  void *v3;
  id v4;
  id accountTypeSelectedBlock;
  id location[2];
  BuddyProximitySetupDependentController *v7;

  v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = &_dispatch_main_q;
  dispatch_assert_queue_V2((dispatch_queue_t)v3);

  v4 = objc_retainBlock(location[0]);
  accountTypeSelectedBlock = v7->_accountTypeSelectedBlock;
  v7->_accountTypeSelectedBlock = v4;

  objc_storeStrong(location, 0);
}

- (void)_accountTypeSelected:(int64_t)a3
{
  void *v3;
  uint64_t v4;
  id v5;
  void (**v6)(id, uint64_t);
  os_log_t oslog;
  uint64_t v8;
  SEL v9;
  BuddyProximitySetupDependentController *v10;
  uint8_t buf[24];

  v10 = self;
  v9 = a2;
  v8 = a3;
  v3 = &_dispatch_main_q;
  dispatch_assert_queue_V2((dispatch_queue_t)v3);

  oslog = (os_log_t)(id)_BYLoggingFacility(v4);
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    sub_1000342B4((uint64_t)buf, v8);
    _os_log_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_DEFAULT, "Source device selected account type: %ld", buf, 0xCu);
  }
  objc_storeStrong((id *)&oslog, 0);
  -[BuddyProximitySetupDependentController setHasAccountType:](v10, "setHasAccountType:", 1);
  -[BuddyProximitySetupDependentController setAccountType:](v10, "setAccountType:", v8);
  v5 = -[BuddyProximitySetupDependentController accountTypeSelectedBlock](v10, "accountTypeSelectedBlock");

  if (v5)
  {
    v6 = (void (**)(id, uint64_t))-[BuddyProximitySetupDependentController accountTypeSelectedBlock](v10, "accountTypeSelectedBlock");
    v6[2](v6, v8);

    -[BuddyProximitySetupDependentController setAccountTypeSelectedBlock:](v10, "setAccountTypeSelectedBlock:", 0);
  }
}

- (void)setupPasscodeAndBiometricWithCompletion:(id)a3
{
  PASUIDependentViewPresenterDelegate *v3;
  uint64_t v4;
  PASUIDependentViewPresenterDelegate *v5;
  NSObject *v6;
  os_log_type_t v7;
  _WORD v8[7];
  os_log_type_t v9;
  os_log_t oslog;
  id location[2];
  BuddyProximitySetupDependentController *v12;

  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  -[BuddyProximitySetupDependentController setPasscodeSetUpCompletionBlock:](v12, "setPasscodeSetUpCompletionBlock:", location[0]);
  v3 = -[BuddyProximitySetupDependentController delegate](v12, "delegate");

  if (v3)
  {
    v5 = -[BuddyProximitySetupDependentController delegate](v12, "delegate");
    -[PASUIDependentViewPresenterDelegate setupPasscodeAndBiometricWithCompletion:](v5, "setupPasscodeAndBiometricWithCompletion:", location[0]);

  }
  else
  {
    oslog = (os_log_t)(id)_BYLoggingFacility(v4);
    v9 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      v6 = oslog;
      v7 = v9;
      sub_100038C3C(v8);
      _os_log_impl((void *)&_mh_execute_header, v6, v7, "Proximity dependent setup will show biometric/passcode setup", (uint8_t *)v8, 2u);
    }
    objc_storeStrong((id *)&oslog, 0);
  }
  objc_storeStrong(location, 0);
}

- (void)proximitySetupCompletedWithResult:(id)a3
{
  void *v3;
  PASUIDependentViewPresenterDelegate *v4;
  uint64_t v5;
  PASUIDependentViewPresenterDelegate *v6;
  os_log_t oslog;
  void **block;
  int v9;
  int v10;
  id (*v11)(uint64_t);
  void *v12;
  BuddyProximitySetupDependentController *v13;
  id v14;
  id location[2];
  BuddyProximitySetupDependentController *v16;
  uint8_t buf[24];

  v16 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  -[BuddyProximitySetupDependentController setResult:](v16, "setResult:", location[0]);
  v3 = &_dispatch_main_q;
  block = _NSConcreteStackBlock;
  v9 = -1073741824;
  v10 = 0;
  v11 = sub_100117D68;
  v12 = &unk_100280D00;
  v13 = v16;
  v14 = location[0];
  dispatch_async((dispatch_queue_t)v3, &block);

  v4 = -[BuddyProximitySetupDependentController delegate](v16, "delegate");
  if (v4)
  {
    v6 = -[BuddyProximitySetupDependentController delegate](v16, "delegate");
    -[PASUIDependentViewPresenterDelegate proximitySetupCompletedWithResult:](v6, "proximitySetupCompletedWithResult:", location[0]);

  }
  else
  {
    oslog = (os_log_t)(id)_BYLoggingFacility(v5);
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      sub_100038C28((uint64_t)buf, (uint64_t)location[0]);
      _os_log_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_DEFAULT, "Proximity dependent setup completed with result: %@", buf, 0xCu);
    }
    objc_storeStrong((id *)&oslog, 0);
  }
  objc_storeStrong(&v14, 0);
  objc_storeStrong((id *)&v13, 0);
  objc_storeStrong(location, 0);
}

- (void)proximitySetupSelectedAccountType:(int64_t)a3
{
  -[BuddyProximitySetupDependentController proximitySetupSelectedAccount:completion:](self, "proximitySetupSelectedAccount:completion:", a3, &stru_100283160);
}

- (void)proximitySetupSelectedAccount:(int64_t)a3 completion:(id)a4
{
  void *v4;
  void **v5;
  int v6;
  int v7;
  id (*v8)(uint64_t);
  void *v9;
  id v10[2];
  id location;
  void *v12;
  SEL v13;
  BuddyProximitySetupDependentController *v14;

  v14 = self;
  v13 = a2;
  v12 = (void *)a3;
  location = 0;
  objc_storeStrong(&location, a4);
  v4 = &_dispatch_main_q;
  v5 = _NSConcreteStackBlock;
  v6 = -1073741824;
  v7 = 0;
  v8 = sub_100117EF8;
  v9 = &unk_100280BA8;
  v10[0] = v14;
  v10[1] = v12;
  dispatch_async((dispatch_queue_t)v4, &v5);

  if (location)
    (*((void (**)(id, uint64_t))location + 2))(location, 1);
  objc_storeStrong(v10, 0);
  objc_storeStrong(&location, 0);
}

- (void)setupPerformAIDASignInWith:(id)a3 completion:(id)a4
{
  PASUIDependentViewPresenterDelegate *v5;
  id v6;
  id location[2];
  BuddyProximitySetupDependentController *v8;

  v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v6 = 0;
  objc_storeStrong(&v6, a4);
  v5 = -[BuddyProximitySetupDependentController delegate](v8, "delegate");
  -[PASUIDependentViewPresenterDelegate setupPerformAIDASignInWith:completion:](v5, "setupPerformAIDASignInWith:completion:", location[0], v6);

  objc_storeStrong(&v6, 0);
  objc_storeStrong(location, 0);
}

- (void)connectionTerminated
{
  void *v2;
  void **block;
  int v4;
  int v5;
  id (*v6);
  void *v7;
  id v8[2];
  BuddyProximitySetupDependentController *v9;

  v9 = self;
  v8[1] = (id)a2;
  v2 = &_dispatch_main_q;
  block = _NSConcreteStackBlock;
  v4 = -1073741824;
  v5 = 0;
  v6 = sub_100118064;
  v7 = &unk_100280730;
  v8[0] = v9;
  dispatch_async((dispatch_queue_t)v2, &block);

  objc_storeStrong(v8, 0);
}

- (PASUIDependentViewPresenterDelegate)delegate
{
  return (PASUIDependentViewPresenterDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (BuddyFeatureFlags)featureFlags
{
  return self->_featureFlags;
}

- (void)setFeatureFlags:(id)a3
{
  objc_storeStrong((id *)&self->_featureFlags, a3);
}

- (UIViewController)parentViewController
{
  return self->_parentViewController;
}

- (PASUIDependentViewPresenter)dependentViewPresenter
{
  return self->_dependentViewPresenter;
}

- (NSNumber)readyForPresentation
{
  return self->_readyForPresentation;
}

- (id)viewControllerAvailableBlock
{
  return self->_viewControllerAvailableBlock;
}

- (int64_t)accountType
{
  return self->_accountType;
}

- (BOOL)hasAccountType
{
  return self->_hasAccountType;
}

- (void)setHasAccountType:(BOOL)a3
{
  self->_hasAccountType = a3;
}

- (id)accountTypeSelectedBlock
{
  return self->_accountTypeSelectedBlock;
}

- (id)passcodeSetUpCompletionBlock
{
  return self->_passcodeSetUpCompletionBlock;
}

- (void)setPasscodeSetUpCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (PASFlowResult)result
{
  return self->_result;
}

- (void)setResult:(id)a3
{
  objc_storeStrong((id *)&self->_result, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_result, 0);
  objc_storeStrong(&self->_passcodeSetUpCompletionBlock, 0);
  objc_storeStrong(&self->_accountTypeSelectedBlock, 0);
  objc_storeStrong(&self->_viewControllerAvailableBlock, 0);
  objc_storeStrong((id *)&self->_readyForPresentation, 0);
  objc_storeStrong((id *)&self->_dependentViewPresenter, 0);
  objc_storeStrong((id *)&self->_parentViewController, 0);
  objc_storeStrong((id *)&self->_featureFlags, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
