@implementation BuddyChildSetupPresenter

- (BuddyChildSetupPresenter)init
{
  BuddyChildSetupPresenter *v2;
  objc_super v4;
  SEL v5;
  id location;

  v5 = a2;
  location = 0;
  v4.receiver = self;
  v4.super_class = (Class)BuddyChildSetupPresenter;
  location = -[BuddyChildSetupPresenter init](&v4, "init");
  objc_storeStrong(&location, location);
  if (location)
    objc_storeStrong((id *)location + 2, 0);
  v2 = (BuddyChildSetupPresenter *)location;
  objc_storeStrong(&location, 0);
  return v2;
}

- (void)startFlowWithNavigationController:(id)a3
{
  AISChildSetupPresenter *v3;
  id location[2];
  BuddyChildSetupPresenter *v5;

  v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  -[BuddyChildSetupPresenter _ensurePresenter](v5, "_ensurePresenter");
  v3 = -[BuddyChildSetupPresenter presenter](v5, "presenter");
  -[AISChildSetupPresenter startFlowWithViewControllerPresentationHandler:](v3, "startFlowWithViewControllerPresentationHandler:", location[0]);

  objc_storeStrong(location, 0);
}

- (void)fetchCutOffAgeForChildAccountWithCompletionHandler:(id)a3
{
  AISChildSetupPresenter *v3;
  id v4;
  AISChildSetupPresenter *v5;
  id v6;
  void **v7;
  int v8;
  int v9;
  void (*v10)(NSObject *, void *, void *);
  void *v11;
  id v12;
  os_log_type_t v13;
  os_log_t oslog;
  id location[2];
  BuddyChildSetupPresenter *v16;
  uint8_t buf[24];

  v16 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  oslog = (os_log_t)(id)_BYLoggingFacility(-[BuddyChildSetupPresenter _ensurePresenter](v16, "_ensurePresenter"));
  v13 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    v3 = -[BuddyChildSetupPresenter presenter](v16, "presenter");
    v4 = -[AISChildSetupPresenter childSetupStore](v3, "childSetupStore");
    sub_100038C28((uint64_t)buf, (uint64_t)v4);
    _os_log_impl((void *)&_mh_execute_header, oslog, v13, "Will fetch cut off age for child account with child setup store %@", buf, 0xCu);

  }
  objc_storeStrong((id *)&oslog, 0);
  v5 = -[BuddyChildSetupPresenter presenter](v16, "presenter");
  v6 = -[AISChildSetupPresenter childSetupStore](v5, "childSetupStore");
  v7 = _NSConcreteStackBlock;
  v8 = -1073741824;
  v9 = 0;
  v10 = sub_100166424;
  v11 = &unk_100283A48;
  v12 = location[0];
  objc_msgSend(v6, "fetchMaxAgeForChildAccountWithCompletionHandler:", &v7);

  objc_storeStrong(&v12, 0);
  objc_storeStrong(location, 0);
}

- (void)_ensurePresenter
{
  void *v2;
  AISChildSetupPresenter *v3;
  AISChildSetupPresenter *presenter;

  v2 = &_dispatch_main_q;
  dispatch_assert_queue_V2((dispatch_queue_t)v2);

  if (!self->_presenter)
  {
    v3 = (AISChildSetupPresenter *)objc_alloc_init((Class)sub_100166760());
    presenter = self->_presenter;
    self->_presenter = v3;

    -[AISChildSetupPresenter setDelegate:](self->_presenter, "setDelegate:", self, a2);
  }
}

- (void)childSetupPresenter:(id)a3 didCompleteWithResult:(id)a4
{
  BuddyChildSetupPresenterDelegate *v5;
  id v6;
  id location[2];
  BuddyChildSetupPresenter *v8;

  v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v6 = 0;
  objc_storeStrong(&v6, a4);
  v5 = -[BuddyChildSetupPresenter delegate](v8, "delegate");
  -[BuddyChildSetupPresenterDelegate didSucceedWithChildSetupPresenter:](v5, "didSucceedWithChildSetupPresenter:", v8);

  objc_storeStrong(&v6, 0);
  objc_storeStrong(location, 0);
}

- (void)childSetupPresenter:(id)a3 didFail:(id)a4
{
  BuddyChildSetupPresenterDelegate *v5;
  id v6;
  id location[2];
  BuddyChildSetupPresenter *v8;

  v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v6 = 0;
  objc_storeStrong(&v6, a4);
  v5 = -[BuddyChildSetupPresenter delegate](v8, "delegate");
  -[BuddyChildSetupPresenterDelegate childSetupPresenter:didFail:](v5, "childSetupPresenter:didFail:", v8, v6);

  objc_storeStrong(&v6, 0);
  objc_storeStrong(location, 0);
}

- (void)setupLocationServicesWithCompletion:(id)a3
{
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  BuddyChildSetupPresenterDelegate *v6;
  id v7;
  uint8_t buf[15];
  os_log_type_t v9;
  os_log_t oslog;
  id location[2];
  BuddyChildSetupPresenter *v12;

  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  oslog = (os_log_t)(id)_BYLoggingFacility(v3);
  v9 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    v4 = oslog;
    v5 = v9;
    sub_100038C3C(buf);
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "Child setup presenter requesting location services setup", buf, 2u);
  }
  objc_storeStrong((id *)&oslog, 0);
  v7 = -[BuddyAISFlowTaskInfo initWithUnderlyingFlowTaskInfo:]([BuddyAISFlowTaskInfo alloc], "initWithUnderlyingFlowTaskInfo:", 0);
  v6 = -[BuddyChildSetupPresenter delegate](v12, "delegate");
  -[BuddyChildSetupPresenterDelegate setupLocationServicesWithNextTaskInfo:completion:](v6, "setupLocationServicesWithNextTaskInfo:completion:", v7, location[0]);

  objc_storeStrong(&v7, 0);
  objc_storeStrong(location, 0);
}

- (void)setupPasscodeWithCompletion:(id)a3
{
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  BuddyChildSetupPresenterDelegate *v6;
  id v7;
  uint8_t buf[15];
  os_log_type_t v9;
  os_log_t oslog;
  id location[2];
  BuddyChildSetupPresenter *v12;

  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  oslog = (os_log_t)(id)_BYLoggingFacility(v3);
  v9 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    v4 = oslog;
    v5 = v9;
    sub_100038C3C(buf);
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "Child setup presenter requesting passcode setup", buf, 2u);
  }
  objc_storeStrong((id *)&oslog, 0);
  v7 = -[BuddyAISFlowTaskInfo initWithUnderlyingFlowTaskInfo:]([BuddyAISFlowTaskInfo alloc], "initWithUnderlyingFlowTaskInfo:", 0);
  v6 = -[BuddyChildSetupPresenter delegate](v12, "delegate");
  -[BuddyChildSetupPresenterDelegate setupPasscodeWithNextTaskInfo:completion:](v6, "setupPasscodeWithNextTaskInfo:completion:", v7, location[0]);

  objc_storeStrong(&v7, 0);
  objc_storeStrong(location, 0);
}

- (void)setupPasscodeForAccount:(id)a3 nextTaskInfo:(id)a4 completion:(id)a5
{
  uint64_t v7;
  BuddyAISFlowTaskInfo *v8;
  BuddyChildSetupPresenterDelegate *v9;
  BuddyAISFlowTaskInfo *v10;
  os_log_type_t v11;
  os_log_t oslog;
  id v13;
  id v14;
  id location[2];
  BuddyChildSetupPresenter *v16;
  uint8_t buf[24];

  v16 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v14 = 0;
  objc_storeStrong(&v14, a4);
  v13 = 0;
  objc_storeStrong(&v13, a5);
  oslog = (os_log_t)(id)_BYLoggingFacility(v7);
  v11 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    sub_100038C28((uint64_t)buf, (uint64_t)v14);
    _os_log_impl((void *)&_mh_execute_header, oslog, v11, "Child setup presenter requesting passcode setup with nextTaskInfo %@", buf, 0xCu);
  }
  objc_storeStrong((id *)&oslog, 0);
  v8 = [BuddyAISFlowTaskInfo alloc];
  v10 = -[BuddyAISFlowTaskInfo initWithUnderlyingFlowTaskInfo:](v8, "initWithUnderlyingFlowTaskInfo:", v14);
  v9 = -[BuddyChildSetupPresenter delegate](v16, "delegate");
  -[BuddyChildSetupPresenterDelegate setupPasscodeWithNextTaskInfo:completion:](v9, "setupPasscodeWithNextTaskInfo:completion:", v10, v13);

  objc_storeStrong((id *)&v10, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(location, 0);
}

- (void)setupLocationServicesWithNextTaskInfo:(id)a3 completion:(id)a4
{
  uint64_t v5;
  BuddyAISFlowTaskInfo *v6;
  BuddyChildSetupPresenterDelegate *v7;
  id v8;
  os_log_type_t v9;
  os_log_t oslog;
  id v11;
  id location[2];
  BuddyChildSetupPresenter *v13;
  uint8_t buf[24];

  v13 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v11 = 0;
  objc_storeStrong(&v11, a4);
  oslog = (os_log_t)(id)_BYLoggingFacility(v5);
  v9 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    sub_100038C28((uint64_t)buf, (uint64_t)location[0]);
    _os_log_impl((void *)&_mh_execute_header, oslog, v9, "Child setup presenter requesting location services setup with nextTaskInfo %@", buf, 0xCu);
  }
  objc_storeStrong((id *)&oslog, 0);
  v6 = [BuddyAISFlowTaskInfo alloc];
  v8 = -[BuddyAISFlowTaskInfo initWithUnderlyingFlowTaskInfo:](v6, "initWithUnderlyingFlowTaskInfo:", location[0]);
  v7 = -[BuddyChildSetupPresenter delegate](v13, "delegate");
  -[BuddyChildSetupPresenterDelegate setupLocationServicesWithNextTaskInfo:completion:](v7, "setupLocationServicesWithNextTaskInfo:completion:", v8, v11);

  objc_storeStrong(&v8, 0);
  objc_storeStrong(&v11, 0);
  objc_storeStrong(location, 0);
}

- (void)setupPerformAIDASignInWith:(id)a3 completion:(id)a4
{
  BuddyChildSetupPresenterDelegate *v5;
  id v6;
  id location[2];
  BuddyChildSetupPresenter *v8;

  v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v6 = 0;
  objc_storeStrong(&v6, a4);
  v5 = -[BuddyChildSetupPresenter delegate](v8, "delegate");
  -[BuddyChildSetupPresenterDelegate setupPerformAIDASignInWith:completion:](v5, "setupPerformAIDASignInWith:completion:", location[0], v6);

  objc_storeStrong(&v6, 0);
  objc_storeStrong(location, 0);
}

- (BuddyChildSetupPresenterDelegate)delegate
{
  return (BuddyChildSetupPresenterDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (AISChildSetupPresenter)presenter
{
  return self->_presenter;
}

- (void)setPresenter:(id)a3
{
  objc_storeStrong((id *)&self->_presenter, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presenter, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
