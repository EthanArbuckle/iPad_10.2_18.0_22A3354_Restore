@implementation FontInstallMainController

+ (id)_remoteViewControllerInterface
{
  return +[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___FontInstallViewServiceProtocol, a2, a1);
}

+ (id)_exportedInterface
{
  return +[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___FontInstallUISceneProtocol, a2, a1);
}

- (void)viewDidAppear:(BOOL)a3
{
  UIImage *v3;
  IconAndSubIconHeaderViewController *v4;
  id v5;
  id v6;
  IconAndSubIconHeaderViewController *v7;
  id v8;
  UIScreen *v9;
  NSBundle *v10;
  NSString *v11;
  NSBundle *v12;
  NSBundle *v13;
  NSBundle *v14;
  id v15;
  id v16;
  id v17;
  void **v18;
  int v19;
  int v20;
  void (*v21)(id *, void *);
  void *v22;
  id v23;
  id v24;
  void **v25;
  int v26;
  int v27;
  void (*v28)(id *, void *);
  void *v29;
  id v30;
  id v31;
  id location;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  objc_super v40;
  BOOL v41;
  SEL v42;
  FontInstallMainController *v43;

  v43 = self;
  v42 = a2;
  v41 = a3;
  v40.receiver = self;
  v40.super_class = (Class)FontInstallMainController;
  -[FontInstallMainController viewDidAppear:](&v40, "viewDidAppear:", a3);
  v9 = +[UIScreen mainScreen](UIScreen, "mainScreen");
  -[UIScreen scale](v9, "scale");
  v39 = +[UIImage _applicationIconImageForBundleIdentifier:format:scale:](UIImage, "_applicationIconImageForBundleIdentifier:format:scale:", CFSTR("com.apple.FontInstallViewService"), 2);

  v10 = +[NSBundle mainBundle](NSBundle, "mainBundle");
  v38 = -[NSBundle localizedStringForKey:value:table:](v10, "localizedStringForKey:value:table:", CFSTR("FONT_INSTALL_NOTE"));

  v11 = -[FontInstallMainController applicationName](v43, "applicationName");
  v37 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v38, v11);

  v12 = +[NSBundle mainBundle](NSBundle, "mainBundle");
  v36 = -[NSBundle localizedStringForKey:value:table:](v12, "localizedStringForKey:value:table:", CFSTR("FONT_INSTALL_TITLE"), &stru_100014650, 0);

  v13 = +[NSBundle mainBundle](NSBundle, "mainBundle");
  v35 = -[NSBundle localizedStringForKey:value:table:](v13, "localizedStringForKey:value:table:", CFSTR("DONT_INSTALL_BUTTON"), &stru_100014650, 0);

  v14 = +[NSBundle mainBundle](NSBundle, "mainBundle");
  v34 = -[NSBundle localizedStringForKey:value:table:](v14, "localizedStringForKey:value:table:", CFSTR("INSTALL_BUTTON"), &stru_100014650, 0);

  v33 = +[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v36, v37);
  v15 = objc_msgSend(v33, "view");
  objc_msgSend(v15, "setAccessibilityIdentifier:", CFSTR("FONT_INSTALL"));

  objc_initWeak(&location, v43);
  v16 = v35;
  v25 = _NSConcreteStackBlock;
  v26 = -1073741824;
  v27 = 0;
  v28 = __43__FontInstallMainController_viewDidAppear___block_invoke;
  v29 = &unk_100014318;
  objc_copyWeak(&v30, &location);
  v31 = +[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v16, 1, &v25);
  v8 = v34;
  v18 = _NSConcreteStackBlock;
  v19 = -1073741824;
  v20 = 0;
  v21 = __43__FontInstallMainController_viewDidAppear___block_invoke_2;
  v22 = &unk_100014318;
  objc_copyWeak(&v23, &location);
  v24 = +[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v8, 0, &v18);
  objc_msgSend(v33, "addAction:", v31);
  objc_msgSend(v33, "addAction:", v24);
  v6 = v33;
  v7 = [IconAndSubIconHeaderViewController alloc];
  v5 = v39;
  v3 = -[FontInstallMainController applicationIconImage](v43, "applicationIconImage");
  v4 = -[IconAndSubIconHeaderViewController initWithIconImage:andSubIconImage:](v7, "initWithIconImage:andSubIconImage:", v5);
  objc_msgSend(v6, "_setHeaderContentViewController:", v4);

  objc_storeStrong((id *)&v43->_vcNav, v33);
  -[FontInstallMainController presentViewController:animated:completion:](v43, "presentViewController:animated:completion:", v43->_vcNav, 1, 0);
  v17 = -[FontInstallMainController _remoteViewControllerProxy](v43, "_remoteViewControllerProxy");
  objc_msgSend(v17, "setWallpaperTunnelActive:", 1);
  objc_storeStrong(&v17, 0);
  objc_storeStrong(&v24, 0);
  objc_destroyWeak(&v23);
  objc_storeStrong(&v31, 0);
  objc_destroyWeak(&v30);
  objc_destroyWeak(&location);
  objc_storeStrong(&v33, 0);
  objc_storeStrong(&v34, 0);
  objc_storeStrong(&v35, 0);
  objc_storeStrong(&v36, 0);
  objc_storeStrong(&v37, 0);
  objc_storeStrong(&v38, 0);
  objc_storeStrong(&v39, 0);
}

void __43__FontInstallMainController_viewDidAppear___block_invoke(id *a1, void *a2)
{
  id v2;
  id WeakRetained;
  id to[2];
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  to[1] = a1;
  objc_copyWeak(to, a1 + 4);
  WeakRetained = objc_loadWeakRetained(to);

  if (WeakRetained)
  {
    v2 = objc_loadWeakRetained(to);
    objc_msgSend(v2, "doneWithInstallFonts:", 0);

  }
  objc_destroyWeak(to);
  objc_storeStrong(location, 0);
}

void __43__FontInstallMainController_viewDidAppear___block_invoke_2(id *a1, void *a2)
{
  id v2;
  id WeakRetained;
  id to[2];
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  to[1] = a1;
  objc_copyWeak(to, a1 + 4);
  WeakRetained = objc_loadWeakRetained(to);

  if (WeakRetained)
  {
    v2 = objc_loadWeakRetained(to);
    objc_msgSend(v2, "doneWithInstallFonts:", 1);

  }
  objc_destroyWeak(to);
  objc_storeStrong(location, 0);
}

- (void)viewWillAppear:(BOOL)a3
{
  id v3;
  objc_super v4;
  BOOL v5;
  SEL v6;
  FontInstallMainController *v7;

  v7 = self;
  v6 = a2;
  v5 = a3;
  v4.receiver = self;
  v4.super_class = (Class)FontInstallMainController;
  -[FontInstallMainController viewWillAppear:](&v4, "viewWillAppear:", a3);
  v3 = -[FontInstallMainController _remoteViewControllerProxy](v7, "_remoteViewControllerProxy");
  objc_msgSend(v3, "setStatusBarHidden:withDuration:", 1, 0.0);
  objc_msgSend(v3, "setAllowsAlertItems:", 1);
  objc_storeStrong(&v3, 0);
}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v3;
  BOOL v4;
  SEL v5;
  FontInstallMainController *v6;

  v6 = self;
  v5 = a2;
  v4 = a3;
  if (self->_connection)
  {
    NSLog(CFSTR("Install Font Dialog must have been forcibly dismissed."));
    -[FontInstallMainController doneWithInstallFonts:](v6, "doneWithInstallFonts:", 0);
  }
  v3.receiver = v6;
  v3.super_class = (Class)FontInstallMainController;
  -[FontInstallMainController viewDidDisappear:](&v3, "viewDidDisappear:", v4);
}

- (void)connectToEndpoint:(id)a3
{
  NSXPCConnection *v3;
  NSXPCConnection *connection;
  NSXPCConnection *v5;
  NSXPCInterface *v6;
  void **v7;
  int v8;
  int v9;
  void (*v10)(id *);
  void *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id location[2];
  FontInstallMainController *v17;

  v17 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v15 = objc_alloc_init((Class)NSXPCListenerEndpoint);
  objc_msgSend(v15, "_setEndpoint:", location[0]);
  v3 = (NSXPCConnection *)objc_msgSend(objc_alloc((Class)NSXPCConnection), "initWithListenerEndpoint:", v15);
  connection = v17->_connection;
  v17->_connection = v3;

  v5 = v17->_connection;
  v6 = +[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___FontInstallViewServiceProtocol);
  -[NSXPCConnection setRemoteObjectInterface:](v5, "setRemoteObjectInterface:");

  objc_initWeak(&v14, v17);
  v7 = _NSConcreteStackBlock;
  v8 = -1073741824;
  v9 = 0;
  v10 = __47__FontInstallMainController_connectToEndpoint___block_invoke;
  v11 = &unk_100014228;
  objc_copyWeak(&v12, &v14);
  v13 = objc_retainBlock(&v7);
  -[NSXPCConnection setInvalidationHandler:](v17->_connection, "setInvalidationHandler:", v13);
  -[NSXPCConnection setInterruptionHandler:](v17->_connection, "setInterruptionHandler:", v13);
  -[NSXPCConnection resume](v17->_connection, "resume");
  objc_storeStrong(&v13, 0);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&v14);
  objc_storeStrong(&v15, 0);
  objc_storeStrong(location, 0);
}

void __47__FontInstallMainController_connectToEndpoint___block_invoke(id *a1)
{
  id location[3];

  location[2] = a1;
  location[1] = a1;
  location[0] = objc_loadWeakRetained(a1 + 4);
  if (location[0])
    NSLog(CFSTR("FontInstallMainController invalidated."));
  objc_storeStrong(location, 0);
}

- (void)setupWithUserInfo:(id)a3 xpcEndpoint:(id)a4 dismissHandler:(id)a5
{
  id v5;
  UIImage *v6;
  UIImage *applicationIconImage;
  NSString *v8;
  NSString *applicationName;
  id v10;
  id dismissHandler;
  id v14;
  UIScreen *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id location[2];
  FontInstallMainController *v21;

  v21 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v19 = 0;
  objc_storeStrong(&v19, a4);
  v18 = 0;
  objc_storeStrong(&v18, a5);
  v17 = objc_msgSend(location[0], "objectForKey:", CFSTR("identifier"));
  v5 = objc_alloc((Class)LSApplicationRecord);
  v16 = objc_msgSend(v5, "initWithBundleIdentifier:allowPlaceholder:error:", v17, 0, 0);
  v14 = v17;
  v15 = +[UIScreen mainScreen](UIScreen, "mainScreen");
  -[UIScreen scale](v15, "scale");
  v6 = (UIImage *)+[UIImage _applicationIconImageForBundleIdentifier:format:scale:](UIImage, "_applicationIconImageForBundleIdentifier:format:scale:", v14, 0);
  applicationIconImage = v21->_applicationIconImage;
  v21->_applicationIconImage = v6;

  v8 = (NSString *)objc_msgSend(v16, "localizedName");
  applicationName = v21->_applicationName;
  v21->_applicationName = v8;

  v10 = objc_retainBlock(v18);
  dismissHandler = v21->_dismissHandler;
  v21->_dismissHandler = v10;

  -[FontInstallMainController connectToEndpoint:](v21, "connectToEndpoint:", v19);
  objc_storeStrong(&v16, 0);
  objc_storeStrong(&v17, 0);
  objc_storeStrong(&v18, 0);
  objc_storeStrong(&v19, 0);
  objc_storeStrong(location, 0);
}

- (void)configureWithContext:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  id v7;
  FontInstallMainController *v8;
  id v9;
  id v10;
  id v11;
  id location[2];
  FontInstallMainController *v13;

  v13 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v11 = 0;
  objc_storeStrong(&v11, a4);
  v10 = -[FontInstallMainController _remoteViewControllerProxyWithErrorHandler:](v13, "_remoteViewControllerProxyWithErrorHandler:", &__block_literal_global_2);
  v7 = -[FontInstallMainController view](v13, "view");
  v6 = objc_msgSend(v7, "window");
  v5 = objc_msgSend(v6, "windowScene");
  objc_msgSend(v10, "setLaunchingInterfaceOrientation:", objc_msgSend(v5, "interfaceOrientation"));

  objc_msgSend(v10, "setReachabilityDisabled:", 1);
  objc_msgSend(v10, "setAllowsAlertStacking:", 0);
  v8 = v13;
  v9 = objc_msgSend(location[0], "xpcEndpoint");
  -[FontInstallMainController connectToEndpoint:](v8, "connectToEndpoint:");

  if (v11)
    (*((void (**)(void))v11 + 2))();
  objc_storeStrong(&v10, 0);
  objc_storeStrong(&v11, 0);
  objc_storeStrong(location, 0);
}

void __61__FontInstallMainController_configureWithContext_completion___block_invoke(id a1, NSError *a2)
{
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  NSLog(CFSTR("FontInstall configureWithContext - error - %@"), location[0]);
  objc_storeStrong(location, 0);
}

- (void)prepareForActivationWithContext:(id)a3 completion:(id)a4
{
  UIImage *v4;
  UIImage *applicationIconImage;
  NSString *v6;
  NSString *applicationName;
  id v9;
  UIScreen *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id location[2];
  FontInstallMainController *v16;

  v16 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v14 = 0;
  objc_storeStrong(&v14, a4);
  v13 = -[FontInstallMainController _remoteViewControllerProxyWithErrorHandler:](v16, "_remoteViewControllerProxyWithErrorHandler:", &__block_literal_global_123);
  objc_msgSend(v13, "setStatusBarHidden:withDuration:", 1, 0.4);
  v9 = objc_msgSend(location[0], "userInfo");
  v12 = objc_msgSend(v9, "objectForKey:", CFSTR("identifier"));

  v11 = objc_msgSend(objc_alloc((Class)LSApplicationRecord), "initWithBundleIdentifier:allowPlaceholder:error:", v12, 0, 0);
  v10 = +[UIScreen mainScreen](UIScreen, "mainScreen");
  -[UIScreen scale](v10, "scale");
  v4 = (UIImage *)+[UIImage _applicationIconImageForBundleIdentifier:format:scale:](UIImage, "_applicationIconImageForBundleIdentifier:format:scale:", v12, 0);
  applicationIconImage = v16->_applicationIconImage;
  v16->_applicationIconImage = v4;

  v6 = (NSString *)objc_msgSend(v11, "localizedName");
  applicationName = v16->_applicationName;
  v16->_applicationName = v6;

  if (v14)
    (*((void (**)(void))v14 + 2))();
  objc_storeStrong(&v11, 0);
  objc_storeStrong(&v12, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(location, 0);
}

void __72__FontInstallMainController_prepareForActivationWithContext_completion___block_invoke(id a1, NSError *a2)
{
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  NSLog(CFSTR("FontInstall prepareForActivationWithContext - error - %@"), location[0]);
  objc_storeStrong(location, 0);
}

- (void)doneWithInstallFonts:(BOOL)a3
{
  FontInstallMainController *v3;
  void **v4;
  int v5;
  int v6;
  void (*v7)(id *);
  void *v8;
  FontInstallMainController *v9;
  id v10;
  BOOL v11;
  SEL v12;
  FontInstallMainController *v13;

  v13 = self;
  v12 = a2;
  v11 = a3;
  NSLog(CFSTR("FontInstall doneWithInstallFonts:%d"), a3);
  v10 = -[NSXPCConnection remoteObjectProxyWithErrorHandler:](v13->_connection, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_128_0);
  objc_msgSend(v10, "doneWithInstallFonts:", v11);
  v3 = v13;
  v4 = _NSConcreteStackBlock;
  v5 = -1073741824;
  v6 = 0;
  v7 = __50__FontInstallMainController_doneWithInstallFonts___block_invoke_2;
  v8 = &unk_1000142D0;
  v9 = v13;
  -[FontInstallMainController dismissViewControllerAnimated:completion:](v3, "dismissViewControllerAnimated:completion:", 1);
  objc_storeStrong((id *)&v9, 0);
  objc_storeStrong(&v10, 0);
}

void __50__FontInstallMainController_doneWithInstallFonts___block_invoke(id a1, NSError *a2)
{
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  NSLog(CFSTR("FontInstallViewService connection error - %@"), location[0]);
  objc_storeStrong(location, 0);
}

void __50__FontInstallMainController_doneWithInstallFonts___block_invoke_2(id *a1)
{
  id v2[3];

  v2[2] = a1;
  v2[1] = a1;
  objc_msgSend(*((id *)a1[4] + 2), "invalidate");
  objc_storeStrong((id *)a1[4] + 2, 0);
  if (*((_QWORD *)a1[4] + 3))
    (*(void (**)(void))(*((_QWORD *)a1[4] + 3) + 16))();
  v2[0] = objc_msgSend(a1[4], "_remoteViewControllerProxy");
  objc_msgSend(v2[0], "deactivate");
  objc_msgSend(v2[0], "invalidate");
  objc_storeStrong((id *)a1[4] + 1, 0);
  objc_storeStrong((id *)a1[4] + 4, 0);
  objc_storeStrong(v2, 0);
}

- (UIImage)applicationIconImage
{
  return self->_applicationIconImage;
}

- (NSString)applicationName
{
  return self->_applicationName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_applicationName, 0);
  objc_storeStrong((id *)&self->_applicationIconImage, 0);
  objc_storeStrong(&self->_dismissHandler, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_vcNav, 0);
}

@end
