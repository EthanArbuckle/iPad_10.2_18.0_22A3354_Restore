@implementation DeleteAppFontsMainController

- (void)viewDidAppear:(BOOL)a3
{
  UIStoryboard *v3;
  UIStoryboard *storyboard;
  DeleteAppFontsViewController *v5;
  DeleteAppFontsViewController *vcNav;
  id v7;
  id v8;
  id v9;
  UIDevice *v10;
  id v11;
  BOOL v12;
  id v13;
  id location;
  objc_super v15;
  BOOL v16;
  SEL v17;
  DeleteAppFontsMainController *v18;
  id v19;

  v18 = self;
  v17 = a2;
  v16 = a3;
  v15.receiver = self;
  v15.super_class = (Class)DeleteAppFontsMainController;
  -[DeleteAppFontsMainController viewDidAppear:](&v15, "viewDidAppear:", a3);
  location = CFSTR("Main_iPhone");
  v19 = 0;
  v10 = +[UIDevice currentDevice](UIDevice, "currentDevice");
  v11 = -[UIDevice userInterfaceIdiom](v10, "userInterfaceIdiom");

  v19 = v11;
  v12 = 1;
  if (v11 != (id)1)
    v12 = v19 == (id)5;
  if (v12)
    objc_storeStrong(&location, CFSTR("Main"));
  v9 = -[DeleteAppFontsMainController view](v18, "view");
  v8 = objc_msgSend(v9, "window");
  v7 = objc_msgSend(v8, "_rootSheetPresentationController");
  objc_msgSend(v7, "_setShouldScaleDownBehindDescendantSheets:", 0);

  v3 = +[UIStoryboard storyboardWithName:bundle:](UIStoryboard, "storyboardWithName:bundle:", location);
  storyboard = v18->_storyboard;
  v18->_storyboard = v3;

  v5 = -[UIStoryboard instantiateViewControllerWithIdentifier:](v18->_storyboard, "instantiateViewControllerWithIdentifier:", CFSTR("DeleteAppFontsDialog"));
  vcNav = v18->_vcNav;
  v18->_vcNav = v5;

  -[DeleteAppFontsViewController setModalTransitionStyle:](v18->_vcNav, "setModalTransitionStyle:", 2);
  -[DeleteAppFontsViewController setModalPresentationStyle:](v18->_vcNav, "setModalPresentationStyle:", 5);
  -[DeleteAppFontsViewController setMainController:](v18->_vcNav, "setMainController:", v18);
  -[DeleteAppFontsMainController presentViewController:animated:completion:](v18, "presentViewController:animated:completion:", v18->_vcNav, 1, 0);
  v13 = -[DeleteAppFontsMainController _remoteViewControllerProxy](v18, "_remoteViewControllerProxy");
  objc_msgSend(v13, "setWallpaperTunnelActive:", 1);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(&location, 0);
}

- (void)viewWillAppear:(BOOL)a3
{
  id v3;
  objc_super v4;
  BOOL v5;
  SEL v6;
  DeleteAppFontsMainController *v7;

  v7 = self;
  v6 = a2;
  v5 = a3;
  v4.receiver = self;
  v4.super_class = (Class)DeleteAppFontsMainController;
  -[DeleteAppFontsMainController viewWillAppear:](&v4, "viewWillAppear:", a3);
  v3 = -[DeleteAppFontsMainController _remoteViewControllerProxy](v7, "_remoteViewControllerProxy");
  objc_msgSend(v3, "setStatusBarHidden:withDuration:", 1, 0.0);
  objc_msgSend(v3, "setAllowsAlertItems:", 1);
  objc_storeStrong(&v3, 0);
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
  DeleteAppFontsMainController *v17;

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
  v10 = __50__DeleteAppFontsMainController_connectToEndpoint___block_invoke;
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

void __50__DeleteAppFontsMainController_connectToEndpoint___block_invoke(id *a1)
{
  id location[3];

  location[2] = a1;
  location[1] = a1;
  location[0] = objc_loadWeakRetained(a1 + 4);
  if (location[0])
    NSLog(CFSTR("DeleteAppFontsViewController invalidated."));
  objc_storeStrong(location, 0);
}

- (void)setupWithUserInfo:(id)a3 xpcEndpoint:(id)a4 dismissHandler:(id)a5
{
  UIImage *v5;
  UIImage *applicationIconImage;
  NSString *v7;
  NSString *applicationName;
  NSArray *v9;
  NSArray *registeredFonts;
  id v11;
  id dismissHandler;
  id v13;
  UIScreen *v14;
  id v17;
  id v18;
  id v19;
  id v20;
  id location[2];
  DeleteAppFontsMainController *v22;

  v22 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v20 = 0;
  objc_storeStrong(&v20, a4);
  v19 = 0;
  objc_storeStrong(&v19, a5);
  v18 = objc_msgSend(location[0], "objectForKey:", CFSTR("deleteAppIdentifier"));
  if (!v18)
  {
    v18 = objc_msgSend(location[0], "objectForKey:", CFSTR("identifier"));

  }
  v17 = objc_msgSend(objc_alloc((Class)LSApplicationRecord), "initWithBundleIdentifier:allowPlaceholder:error:", v18, 0);
  v13 = v18;
  v14 = +[UIScreen mainScreen](UIScreen, "mainScreen");
  -[UIScreen scale](v14, "scale");
  v5 = (UIImage *)+[UIImage _applicationIconImageForBundleIdentifier:format:scale:](UIImage, "_applicationIconImageForBundleIdentifier:format:scale:", v13, 0);
  applicationIconImage = v22->_applicationIconImage;
  v22->_applicationIconImage = v5;

  v7 = (NSString *)objc_msgSend(v17, "localizedName");
  applicationName = v22->_applicationName;
  v22->_applicationName = v7;

  v9 = (NSArray *)objc_msgSend(location[0], "objectForKey:", CFSTR("registeredFonts"));
  registeredFonts = v22->_registeredFonts;
  v22->_registeredFonts = v9;

  v11 = objc_retainBlock(v19);
  dismissHandler = v22->_dismissHandler;
  v22->_dismissHandler = v11;

  -[DeleteAppFontsMainController connectToEndpoint:](v22, "connectToEndpoint:", v20);
  objc_storeStrong(&v17, 0);
  objc_storeStrong(&v18, 0);
  objc_storeStrong(&v19, 0);
  objc_storeStrong(&v20, 0);
  objc_storeStrong(location, 0);
}

- (void)configureWithContext:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  id v7;
  DeleteAppFontsMainController *v8;
  id v9;
  id v10;
  id v11;
  id location[2];
  DeleteAppFontsMainController *v13;

  v13 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v11 = 0;
  objc_storeStrong(&v11, a4);
  v10 = -[DeleteAppFontsMainController _remoteViewControllerProxyWithErrorHandler:](v13, "_remoteViewControllerProxyWithErrorHandler:", &__block_literal_global);
  v7 = -[DeleteAppFontsMainController view](v13, "view");
  v6 = objc_msgSend(v7, "window");
  v5 = objc_msgSend(v6, "windowScene");
  objc_msgSend(v10, "setLaunchingInterfaceOrientation:", objc_msgSend(v5, "interfaceOrientation"));

  objc_msgSend(v10, "setReachabilityDisabled:", 1);
  objc_msgSend(v10, "setAllowsAlertStacking:", 0);
  v8 = v13;
  v9 = objc_msgSend(location[0], "xpcEndpoint");
  -[DeleteAppFontsMainController connectToEndpoint:](v8, "connectToEndpoint:");

  if (v11)
    (*((void (**)(void))v11 + 2))();
  objc_storeStrong(&v10, 0);
  objc_storeStrong(&v11, 0);
  objc_storeStrong(location, 0);
}

void __64__DeleteAppFontsMainController_configureWithContext_completion___block_invoke(id a1, NSError *a2)
{
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  NSLog(CFSTR("DeleteAppFonts configureWithContext - error - %@"), location[0]);
  objc_storeStrong(location, 0);
}

- (void)prepareForActivationWithContext:(id)a3 completion:(id)a4
{
  UIImage *v4;
  UIImage *applicationIconImage;
  NSString *v6;
  NSString *applicationName;
  NSArray *v8;
  NSArray *registeredFonts;
  UIScreen *v10;
  id v11;
  id v12;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id location[2];
  DeleteAppFontsMainController *v20;

  v20 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v18 = 0;
  objc_storeStrong(&v18, a4);
  v17 = -[DeleteAppFontsMainController _remoteViewControllerProxyWithErrorHandler:](v20, "_remoteViewControllerProxyWithErrorHandler:", &__block_literal_global_75);
  objc_msgSend(v17, "setStatusBarHidden:withDuration:", 1, 0.4);
  v14 = objc_msgSend(location[0], "userInfo");
  v16 = objc_msgSend(v14, "objectForKey:", CFSTR("deleteAppIdentifier"));

  if (!v16)
  {
    v12 = objc_msgSend(location[0], "userInfo");
    v16 = objc_msgSend(v12, "objectForKey:", CFSTR("identifier"));

  }
  v15 = objc_msgSend(objc_alloc((Class)LSApplicationRecord), "initWithBundleIdentifier:allowPlaceholder:error:", v16, 0, 0);
  v10 = +[UIScreen mainScreen](UIScreen, "mainScreen");
  -[UIScreen scale](v10, "scale");
  v4 = (UIImage *)+[UIImage _applicationIconImageForBundleIdentifier:format:scale:](UIImage, "_applicationIconImageForBundleIdentifier:format:scale:", v16, 0);
  applicationIconImage = v20->_applicationIconImage;
  v20->_applicationIconImage = v4;

  v6 = (NSString *)objc_msgSend(v15, "localizedName");
  applicationName = v20->_applicationName;
  v20->_applicationName = v6;

  v11 = objc_msgSend(location[0], "userInfo");
  v8 = (NSArray *)objc_msgSend(v11, "objectForKey:", CFSTR("registeredFonts"));
  registeredFonts = v20->_registeredFonts;
  v20->_registeredFonts = v8;

  if (v18)
    (*((void (**)(void))v18 + 2))();
  objc_storeStrong(&v15, 0);
  objc_storeStrong(&v16, 0);
  objc_storeStrong(&v17, 0);
  objc_storeStrong(&v18, 0);
  objc_storeStrong(location, 0);
}

void __75__DeleteAppFontsMainController_prepareForActivationWithContext_completion___block_invoke(id a1, NSError *a2)
{
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  NSLog(CFSTR("DeleteAppFonts prepareForActivationWithContext - error - %@"), location[0]);
  objc_storeStrong(location, 0);
}

- (void)doneWithDeleteAppFonts:(BOOL)a3
{
  DeleteAppFontsMainController *v3;
  void **v4;
  int v5;
  int v6;
  void (*v7)(id *);
  void *v8;
  DeleteAppFontsMainController *v9;
  id v10;
  BOOL v11;
  SEL v12;
  DeleteAppFontsMainController *v13;

  v13 = self;
  v12 = a2;
  v11 = a3;
  NSLog(CFSTR("DeleteAppFonts doneWithDeleteAppFonts:%d"), a3);
  v10 = -[NSXPCConnection remoteObjectProxyWithErrorHandler:](v13->_connection, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_80);
  objc_msgSend(v10, "doneWithDeleteAppFonts:", v11);
  v3 = v13;
  v4 = _NSConcreteStackBlock;
  v5 = -1073741824;
  v6 = 0;
  v7 = __55__DeleteAppFontsMainController_doneWithDeleteAppFonts___block_invoke_2;
  v8 = &unk_1000142D0;
  v9 = v13;
  -[DeleteAppFontsMainController dismissViewControllerAnimated:completion:](v3, "dismissViewControllerAnimated:completion:", 1);
  objc_storeStrong((id *)&v9, 0);
  objc_storeStrong(&v10, 0);
}

void __55__DeleteAppFontsMainController_doneWithDeleteAppFonts___block_invoke(id a1, NSError *a2)
{
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  NSLog(CFSTR("FontInstallViewService connection error - %@"), location[0]);
  objc_storeStrong(location, 0);
}

void __55__DeleteAppFontsMainController_doneWithDeleteAppFonts___block_invoke_2(id *a1)
{
  id v2[3];

  v2[2] = a1;
  v2[1] = a1;
  objc_msgSend(*((id *)a1[4] + 3), "invalidate");
  objc_storeStrong((id *)a1[4] + 3, 0);
  if (*((_QWORD *)a1[4] + 4))
    (*(void (**)(void))(*((_QWORD *)a1[4] + 4) + 16))();
  v2[0] = objc_msgSend(a1[4], "_remoteViewControllerProxy");
  objc_msgSend(v2[0], "deactivate");
  objc_msgSend(v2[0], "invalidate");
  objc_storeStrong((id *)a1[4] + 2, 0);
  objc_storeStrong((id *)a1[4] + 1, 0);
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

- (NSArray)registeredFonts
{
  return self->_registeredFonts;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_registeredFonts, 0);
  objc_storeStrong((id *)&self->_applicationName, 0);
  objc_storeStrong((id *)&self->_applicationIconImage, 0);
  objc_storeStrong(&self->_dismissHandler, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_vcNav, 0);
  objc_storeStrong((id *)&self->_storyboard, 0);
}

@end
