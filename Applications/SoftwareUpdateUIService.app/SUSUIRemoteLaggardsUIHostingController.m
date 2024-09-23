@implementation SUSUIRemoteLaggardsUIHostingController

- (SUSUIRemoteLaggardsUIHostingController)init
{
  SUSUIRemoteLaggardsUIHostingController *v3;
  SUSUIRemoteLaggardsUIHostingController *v4;
  os_log_t oslog;
  objc_super v6;
  SEL v7;
  SUSUIRemoteLaggardsUIHostingController *v8;
  uint8_t v9[24];

  v7 = a2;
  v8 = 0;
  v6.receiver = self;
  v6.super_class = (Class)SUSUIRemoteLaggardsUIHostingController;
  v4 = -[SUSUIRemoteLaggardsUIHostingController init](&v6, "init");
  v8 = v4;
  objc_storeStrong((id *)&v8, v4);
  if (v4)
  {
    oslog = (os_log_t)(id)SUSUILogLaggardsUI();
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      sub_100003BA4((uint64_t)v9, (uint64_t)v8);
      _os_log_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_DEFAULT, "Created SUSUIRemoteLaggardsUIHostingController: %@", v9, 0xCu);
    }
    objc_storeStrong((id *)&oslog, 0);
  }
  v3 = v8;
  objc_storeStrong((id *)&v8, 0);
  return v3;
}

+ (BOOL)_isSecureForRemoteViewService
{
  return 1;
}

- (void)loadView
{
  double v2;
  double v3;
  double v4;
  double v5;
  id v6;
  UIScreen *v7;
  id v8;
  UIColor *v9;
  id v10;
  id v11;
  id v12;
  os_log_type_t v13;
  id location[2];
  SUSUIRemoteLaggardsUIHostingController *v15;
  uint8_t v16[24];

  v15 = self;
  location[1] = (id)a2;
  location[0] = (id)SUSUILogLaggardsUI();
  v13 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)location[0], OS_LOG_TYPE_DEFAULT))
  {
    sub_1000061C4((uint64_t)v16, (uint64_t)"-[SUSUIRemoteLaggardsUIHostingController loadView]");
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)location[0], v13, "%s: Creating view for SUSUIRemoteLaggardsUIHostingController", v16, 0xCu);
  }
  objc_storeStrong(location, 0);
  v6 = objc_alloc((Class)UIView);
  v7 = +[UIScreen mainScreen](UIScreen, "mainScreen");
  -[UIScreen bounds](v7, "bounds");
  v12 = objc_msgSend(v6, "initWithFrame:", v2, v3, v4, v5);

  v8 = v12;
  v9 = +[UIColor clearColor](UIColor, "clearColor");
  objc_msgSend(v8, "setBackgroundColor:");

  objc_msgSend(v12, "setAutoresizingMask:", 18);
  objc_msgSend(v12, "setOpaque:", 0);
  v10 = objc_msgSend(v12, "layer");
  objc_msgSend(v10, "setAllowsGroupBlending:", 0);

  v11 = objc_msgSend(v12, "layer");
  objc_msgSend(v11, "setAllowsGroupOpacity:", 0);

  -[SUSUIRemoteLaggardsUIHostingController setView:](v15, "setView:", v12);
  objc_storeStrong(&v12, 0);
}

- (void)viewWillAppear:(BOOL)a3
{
  id v3;
  const __CFString *v4;
  os_log_t oslog;
  objc_super v6;
  BOOL v7;
  SEL v8;
  SUSUIRemoteLaggardsUIHostingController *v9;
  uint8_t v10[24];

  v9 = self;
  v8 = a2;
  v7 = a3;
  v6.receiver = self;
  v6.super_class = (Class)SUSUIRemoteLaggardsUIHostingController;
  v3 = -[SUSUIRemoteLaggardsUIHostingController viewWillAppear:](&v6, "viewWillAppear:", a3);
  oslog = (os_log_t)(id)SUSUILogLaggardsUI(v3);
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    if (v7)
      v4 = CFSTR("YES");
    else
      v4 = CFSTR("NO");
    sub_100006914((uint64_t)v10, (uint64_t)"-[SUSUIRemoteLaggardsUIHostingController viewWillAppear:]", (uint64_t)v4);
    _os_log_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_DEFAULT, "%s: %@", v10, 0x16u);
  }
  objc_storeStrong((id *)&oslog, 0);
}

- (void)viewDidAppear:(BOOL)a3
{
  id v3;
  const __CFString *v4;
  os_log_t oslog;
  objc_super v6;
  BOOL v7;
  SEL v8;
  SUSUIRemoteLaggardsUIHostingController *v9;
  uint8_t v10[24];

  v9 = self;
  v8 = a2;
  v7 = a3;
  v6.receiver = self;
  v6.super_class = (Class)SUSUIRemoteLaggardsUIHostingController;
  v3 = -[SUSUIRemoteLaggardsUIHostingController viewDidAppear:](&v6, "viewDidAppear:", a3);
  oslog = (os_log_t)(id)SUSUILogLaggardsUI(v3);
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    if (v7)
      v4 = CFSTR("YES");
    else
      v4 = CFSTR("NO");
    sub_100006914((uint64_t)v10, (uint64_t)"-[SUSUIRemoteLaggardsUIHostingController viewDidAppear:]", (uint64_t)v4);
    _os_log_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_DEFAULT, "%s: %@", v10, 0x16u);
  }
  objc_storeStrong((id *)&oslog, 0);
}

- (void)viewWillDisappear:(BOOL)a3
{
  id v3;
  const __CFString *v4;
  os_log_t oslog;
  objc_super v6;
  BOOL v7;
  SEL v8;
  SUSUIRemoteLaggardsUIHostingController *v9;
  uint8_t v10[24];

  v9 = self;
  v8 = a2;
  v7 = a3;
  v6.receiver = self;
  v6.super_class = (Class)SUSUIRemoteLaggardsUIHostingController;
  v3 = -[SUSUIRemoteLaggardsUIHostingController viewWillDisappear:](&v6, "viewWillDisappear:", a3);
  oslog = (os_log_t)(id)SUSUILogLaggardsUI(v3);
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    if (v7)
      v4 = CFSTR("YES");
    else
      v4 = CFSTR("NO");
    sub_100006914((uint64_t)v10, (uint64_t)"-[SUSUIRemoteLaggardsUIHostingController viewWillDisappear:]", (uint64_t)v4);
    _os_log_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_DEFAULT, "%s: %@", v10, 0x16u);
  }
  objc_storeStrong((id *)&oslog, 0);
}

- (void)viewDidDisappear:(BOOL)a3
{
  const __CFString *v3;
  objc_super v4;
  os_log_type_t type;
  os_log_t oslog;
  BOOL v7;
  SEL v8;
  SUSUIRemoteLaggardsUIHostingController *v9;
  uint8_t v10[24];

  v9 = self;
  v8 = a2;
  v7 = a3;
  oslog = (os_log_t)(id)SUSUILogLaggardsUI(self);
  type = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    if (v7)
      v3 = CFSTR("YES");
    else
      v3 = CFSTR("NO");
    sub_100006914((uint64_t)v10, (uint64_t)"-[SUSUIRemoteLaggardsUIHostingController viewDidDisappear:]", (uint64_t)v3);
    _os_log_impl((void *)&_mh_execute_header, oslog, type, "%s: %@", v10, 0x16u);
  }
  objc_storeStrong((id *)&oslog, 0);
  v4.receiver = v9;
  v4.super_class = (Class)SUSUIRemoteLaggardsUIHostingController;
  -[SUSUIRemoteLaggardsUIHostingController viewDidDisappear:](&v4, "viewDidDisappear:", v7);
  -[SUSUIRemoteLaggardsUIHostingController _fireActionWithResponseIfNecessary:](v9, "_fireActionWithResponseIfNecessary:", 0);
}

- (void)viewDidLoad
{
  objc_super v2;
  SEL v3;
  SUSUIRemoteLaggardsUIHostingController *v4;

  v4 = self;
  v3 = a2;
  v2.receiver = self;
  v2.super_class = (Class)SUSUIRemoteLaggardsUIHostingController;
  -[SUSUIRemoteLaggardsUIHostingController viewDidLoad](&v2, "viewDidLoad");
}

- (void)didReceiveMemoryWarning
{
  objc_super v2;
  SEL v3;
  SUSUIRemoteLaggardsUIHostingController *v4;

  v4 = self;
  v3 = a2;
  v2.receiver = self;
  v2.super_class = (Class)SUSUIRemoteLaggardsUIHostingController;
  -[SUSUIRemoteLaggardsUIHostingController didReceiveMemoryWarning](&v2, "didReceiveMemoryWarning");
}

- (void)configureWithContext:(id)a3 completion:(id)a4
{
  uint64_t v4;
  id v5;
  SUSUIRemoteLaggardsUIHostingController *v6;
  NSObject *log;
  os_log_type_t type;
  id v9;
  id v11;
  id v12;
  os_log_type_t v13;
  id v14;
  id v15;
  id location[2];
  SUSUIRemoteLaggardsUIHostingController *v17;
  uint8_t v18[24];

  v17 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v15 = 0;
  objc_storeStrong(&v15, a4);
  v14 = (id)SUSUILogLaggardsUI(v4);
  v13 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v14, OS_LOG_TYPE_DEFAULT))
  {
    log = v14;
    type = v13;
    v6 = v17;
    v9 = objc_msgSend(location[0], "actions");
    v12 = v9;
    sub_100003488((uint64_t)v18, (uint64_t)v6, (uint64_t)v12);
    _os_log_impl((void *)&_mh_execute_header, log, type, "%@ - configure with context: %@", v18, 0x16u);

    objc_storeStrong(&v12, 0);
  }
  objc_storeStrong(&v14, 0);
  v5 = objc_msgSend(location[0], "actions");
  v11 = objc_msgSend(v5, "anyObject");

  -[SUSUIRemoteLaggardsUIHostingController _configureWithAction:completion:](v17, "_configureWithAction:completion:", v11, v15);
  objc_storeStrong(&v11, 0);
  objc_storeStrong(&v15, 0);
  objc_storeStrong(location, 0);
}

- (unint64_t)supportedInterfaceOrientations
{
  UIDevice *v3;
  BOOL v4;

  v3 = +[UIDevice currentDevice](UIDevice, "currentDevice");
  v4 = (id)-[UIDevice userInterfaceIdiom](v3, "userInterfaceIdiom") != (id)1;

  if (v4)
    return 2;
  else
    return 30;
}

- (id)laggardsUIViewControllerForAction:(id)a3
{
  uint64_t v3;
  os_log_t oslog;
  id location;
  SEL v7;
  SUSUIRemoteLaggardsUIHostingController *v8;
  uint8_t v9[24];

  v8 = self;
  v7 = a2;
  location = 0;
  objc_storeStrong(&location, a3);
  oslog = (os_log_t)(id)SUSUILogLaggardsUI(v3);
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    sub_1000061C4((uint64_t)v9, (uint64_t)"-[SUSUIRemoteLaggardsUIHostingController laggardsUIViewControllerForAction:]");
    _os_log_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_DEFAULT, "%s: Should implement this method in each inheriting class.", v9, 0xCu);
  }
  objc_storeStrong((id *)&oslog, 0);
  -[SUSUIRemoteLaggardsUIHostingController doesNotRecognizeSelector:](v8, "doesNotRecognizeSelector:", v7);
  objc_storeStrong(&location, 0);
  return 0;
}

- (Class)laggardsUIActionClass
{
  return (Class)objc_opt_class(SUSUILaggardsUIAlertAction);
}

- (void)_configureWithAction:(id)a3 completion:(id)a4
{
  uint64_t v4;
  UIViewController *v5;
  UIViewController *rootViewController;
  id v7;
  UIViewController *v8;
  UIViewController *presentingViewController;
  id v10;
  UIViewController *v11;
  UIViewController *v12;
  UIPresentationController *v13;
  UIViewController *v14;
  SUSUIRemoteLaggardsUIHostingController *v15;
  id v16;
  id v17;
  void **v19;
  int v20;
  int v21;
  uint64_t (*v22)(uint64_t);
  void *v23;
  id v24;
  id v25;
  os_log_type_t v26;
  id v27;
  id v28;
  id location[2];
  SUSUIRemoteLaggardsUIHostingController *v30;
  uint8_t v31[24];

  v30 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v28 = 0;
  objc_storeStrong(&v28, a4);
  v27 = (id)SUSUILogLaggardsUI(v4);
  v26 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v27, OS_LOG_TYPE_DEFAULT))
  {
    sub_100006914((uint64_t)v31, (uint64_t)"-[SUSUIRemoteLaggardsUIHostingController _configureWithAction:completion:]", (uint64_t)location[0]);
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v27, v26, "%s: configuring with action - %@", v31, 0x16u);
  }
  objc_storeStrong(&v27, 0);
  objc_storeStrong((id *)&v30->_action, location[0]);
  if (-[SUSUIRemoteLaggardsUIHostingController useNavigationController](v30, "useNavigationController"))
  {
    v5 = (UIViewController *)-[SUSUIRemoteLaggardsUIHostingController laggardsUIViewControllerForAction:](v30, "laggardsUIViewControllerForAction:", location[0]);
    rootViewController = v30->_rootViewController;
    v30->_rootViewController = v5;

    v7 = objc_alloc((Class)OBNavigationController);
    v8 = (UIViewController *)objc_msgSend(v7, "initWithRootViewController:", v30->_rootViewController);
    presentingViewController = v30->_presentingViewController;
    v30->_presentingViewController = v8;

    if (-[SUSUIRemoteLaggardsUIHostingController allowCancel](v30, "allowCancel"))
    {
      v10 = objc_alloc((Class)UIBarButtonItem);
      v25 = objc_msgSend(v10, "initWithBarButtonSystemItem:target:action:", 1, v30, "handleCancelButtonTapped:");
      v17 = -[UIViewController navigationBar](v30->_presentingViewController, "navigationBar");
      v16 = objc_msgSend(v17, "topItem");
      objc_msgSend(v16, "setRightBarButtonItem:", v25);

      objc_storeStrong(&v25, 0);
    }
  }
  else
  {
    v11 = (UIViewController *)-[SUSUIRemoteLaggardsUIHostingController laggardsUIViewControllerForAction:](v30, "laggardsUIViewControllerForAction:", location[0]);
    v12 = v30->_presentingViewController;
    v30->_presentingViewController = v11;

    objc_storeStrong((id *)&v30->_rootViewController, v30->_presentingViewController);
  }
  if (!-[SUSUIRemoteLaggardsUIHostingController enableSwipeToCancel](v30, "enableSwipeToCancel"))
    -[UIViewController setModalInPresentation:](v30->_presentingViewController, "setModalInPresentation:", 1);
  v13 = -[UIViewController presentationController](v30->_presentingViewController, "presentationController");
  -[UIPresentationController setDelegate:](v13, "setDelegate:", v30);

  v15 = v30;
  v14 = v30->_presentingViewController;
  v19 = _NSConcreteStackBlock;
  v20 = -1073741824;
  v21 = 0;
  v22 = sub_10000BAE0;
  v23 = &unk_100014AA0;
  v24 = v28;
  -[SUSUIRemoteLaggardsUIHostingController presentViewController:animated:completion:](v15, "presentViewController:animated:completion:", v14, 1, &v19);
  objc_storeStrong(&v24, 0);
  objc_storeStrong(&v28, 0);
  objc_storeStrong(location, 0);
}

- (void)_fireActionWithResponseIfNecessary:(BOOL)a3
{
  if (self->_action)
    objc_storeStrong((id *)&self->_action, 0);
}

- (void)handleCancelButtonTapped:(id)a3
{
  SUSUIRemoteLaggardsUIHostingController *v3;
  id v4;
  void **v5;
  int v6;
  int v7;
  void (*v8)(NSObject *, char);
  void *v9;
  id v10;
  id v11;
  void **v12;
  int v13;
  int v14;
  void (*v15)(id *);
  void *v16;
  SUSUIRemoteLaggardsUIHostingController *v17;
  id v18;
  id location[2];
  SUSUIRemoteLaggardsUIHostingController *v20;

  v20 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v12 = _NSConcreteStackBlock;
  v13 = -1073741824;
  v14 = 0;
  v15 = sub_10000BD3C;
  v16 = &unk_100014528;
  v17 = v20;
  v18 = objc_retainBlock(&v12);
  v11 = v20->_rootViewController;
  if (v11
    && (objc_opt_respondsToSelector(v11, "remoteLaggardsUIHostingControllerWillCancelOperation:withCompletionBlock:") & 1) != 0)
  {
    v4 = v11;
    v3 = v20;
    v5 = _NSConcreteStackBlock;
    v6 = -1073741824;
    v7 = 0;
    v8 = sub_10000BFD8;
    v9 = &unk_100014AC8;
    v10 = v18;
    objc_msgSend(v4, "remoteLaggardsUIHostingControllerWillCancelOperation:withCompletionBlock:", v3, &v5);
    objc_storeStrong(&v10, 0);
  }
  else
  {
    (*((void (**)(void))v18 + 2))();
  }
  objc_storeStrong(&v11, 0);
  objc_storeStrong(&v18, 0);
  objc_storeStrong((id *)&v17, 0);
  objc_storeStrong(location, 0);
}

- (void)presentationControllerDidDismiss:(id)a3
{
  dispatch_queue_t queue;
  void **v4;
  int v5;
  int v6;
  void (*v7)(uint64_t);
  void *v8;
  SUSUIRemoteLaggardsUIHostingController *v9;
  id location[2];
  SUSUIRemoteLaggardsUIHostingController *v11;

  v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  queue = &_dispatch_main_q;
  v4 = _NSConcreteStackBlock;
  v5 = -1073741824;
  v6 = 0;
  v7 = sub_10000C1E4;
  v8 = &unk_100014528;
  v9 = v11;
  dispatch_async(queue, &v4);

  objc_storeStrong((id *)&v9, 0);
  objc_storeStrong(location, 0);
}

- (SUSUILaggardsUIAlertAction)action
{
  return self->_action;
}

- (BOOL)useNavigationController
{
  return self->_useNavigationController;
}

- (void)setUseNavigationController:(BOOL)a3
{
  self->_useNavigationController = a3;
}

- (BOOL)enableSwipeToCancel
{
  return self->_enableSwipeToCancel;
}

- (void)setEnableSwipeToCancel:(BOOL)a3
{
  self->_enableSwipeToCancel = a3;
}

- (BOOL)allowCancel
{
  return self->_allowCancel;
}

- (void)setAllowCancel:(BOOL)a3
{
  self->_allowCancel = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_action, 0);
  objc_storeStrong((id *)&self->_rootViewController, 0);
  objc_storeStrong((id *)&self->_presentingViewController, 0);
}

@end
