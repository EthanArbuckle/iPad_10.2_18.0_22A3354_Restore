@implementation FontInstallMissingController

- (void)viewDidAppear:(BOOL)a3
{
  UIStoryboard *v3;
  UIStoryboard *storyboard;
  FontInstallMissingNavigationController *v5;
  FontInstallMissingNavigationController *detailPresentationController;
  UIImage *v7;
  UIImage *mainIcon;
  IconAndSubIconHeaderViewController *v9;
  id v10;
  IconAndSubIconHeaderViewController *v11;
  NSString *noncancelTitle;
  id v13;
  id v14;
  id v15;
  UIScreen *v16;
  id v17;
  NSString *cancelTitle;
  UIDevice *v19;
  id v20;
  BOOL v21;
  id v22;
  void **v23;
  int v24;
  int v25;
  void (*v26)(id *, void *);
  void *v27;
  FontInstallMissingController *v28;
  id v29;
  id v30;
  void **v31;
  int v32;
  int v33;
  void (*v34)(id *, void *);
  void *v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id location;
  objc_super v41;
  BOOL v42;
  SEL v43;
  FontInstallMissingController *v44;
  id v45;

  v44 = self;
  v43 = a2;
  v42 = a3;
  v41.receiver = self;
  v41.super_class = (Class)FontInstallMissingController;
  -[FontInstallMissingController viewDidAppear:](&v41, "viewDidAppear:", a3);
  location = CFSTR("Main_iPhone");
  v45 = 0;
  v19 = +[UIDevice currentDevice](UIDevice, "currentDevice");
  v20 = -[UIDevice userInterfaceIdiom](v19, "userInterfaceIdiom");

  v45 = v20;
  v21 = 1;
  if (v20 != (id)1)
    v21 = v45 == (id)5;
  if (v21)
    objc_storeStrong(&location, CFSTR("Main"));
  v15 = -[FontInstallMissingController view](v44, "view");
  v14 = objc_msgSend(v15, "window");
  v13 = objc_msgSend(v14, "_rootSheetPresentationController");
  objc_msgSend(v13, "_setShouldScaleDownBehindDescendantSheets:", 0);

  v3 = +[UIStoryboard storyboardWithName:bundle:](UIStoryboard, "storyboardWithName:bundle:", location, 0);
  storyboard = v44->_storyboard;
  v44->_storyboard = v3;

  v5 = -[UIStoryboard instantiateViewControllerWithIdentifier:](v44->_storyboard, "instantiateViewControllerWithIdentifier:", CFSTR("MissingFontsNavigation"));
  detailPresentationController = v44->_detailPresentationController;
  v44->_detailPresentationController = v5;

  v16 = +[UIScreen mainScreen](UIScreen, "mainScreen");
  -[UIScreen scale](v16, "scale");
  v7 = (UIImage *)+[UIImage _applicationIconImageForBundleIdentifier:format:scale:](UIImage, "_applicationIconImageForBundleIdentifier:format:scale:", CFSTR("com.apple.FontInstallViewService"), 2);
  mainIcon = v44->_mainIcon;
  v44->_mainIcon = v7;

  v39 = +[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v44->_alertTitle, v44->_messageText);
  v17 = objc_msgSend(v39, "view");
  objc_msgSend(v17, "setAccessibilityIdentifier:", CFSTR("MISSING_FONTS"));

  objc_initWeak(&v38, v44);
  cancelTitle = v44->_cancelTitle;
  v31 = _NSConcreteStackBlock;
  v32 = -1073741824;
  v33 = 0;
  v34 = __46__FontInstallMissingController_viewDidAppear___block_invoke;
  v35 = &unk_100014318;
  objc_copyWeak(&v36, &v38);
  v37 = +[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", cancelTitle, 1, &v31);
  noncancelTitle = v44->_noncancelTitle;
  v23 = _NSConcreteStackBlock;
  v24 = -1073741824;
  v25 = 0;
  v26 = __46__FontInstallMissingController_viewDidAppear___block_invoke_2;
  v27 = &unk_100014340;
  objc_copyWeak(&v29, &v38);
  v28 = v44;
  v30 = +[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", noncancelTitle, 0, &v23);
  objc_msgSend(v39, "addAction:", v37);
  objc_msgSend(v39, "addAction:", v30);
  v10 = v39;
  v11 = [IconAndSubIconHeaderViewController alloc];
  v9 = -[IconAndSubIconHeaderViewController initWithIconImage:andSubIconImage:](v11, "initWithIconImage:andSubIconImage:", v44->_mainIcon, v44->_subIcon);
  objc_msgSend(v10, "_setHeaderContentViewController:", v9);

  objc_storeStrong((id *)&v44->_initialViewController, v39);
  -[FontInstallMissingController presentViewController:animated:completion:](v44, "presentViewController:animated:completion:", v44->_initialViewController, 1, 0);
  v22 = -[FontInstallMissingController _remoteViewControllerProxy](v44, "_remoteViewControllerProxy");
  objc_msgSend(v22, "setWallpaperTunnelActive:", 1);
  objc_storeStrong(&v22, 0);
  objc_storeStrong(&v30, 0);
  objc_storeStrong((id *)&v28, 0);
  objc_destroyWeak(&v29);
  objc_storeStrong(&v37, 0);
  objc_destroyWeak(&v36);
  objc_destroyWeak(&v38);
  objc_storeStrong(&v39, 0);
  objc_storeStrong(&location, 0);
}

void __46__FontInstallMissingController_viewDidAppear___block_invoke(id *a1, void *a2)
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
    objc_msgSend(v2, "doneWithMissingFonts:withDismissAnimated:", &__NSArray0__struct, 1);

  }
  objc_destroyWeak(to);
  objc_storeStrong(location, 0);
}

void __46__FontInstallMissingController_viewDidAppear___block_invoke_2(id *a1, void *a2)
{
  id WeakRetained;
  id to[2];
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  to[1] = a1;
  objc_copyWeak(to, a1 + 5);
  WeakRetained = objc_loadWeakRetained(to);

  if (WeakRetained)
  {
    objc_msgSend(*((id *)a1[4] + 10), "setModalTransitionStyle:", 0);
    objc_msgSend(*((id *)a1[4] + 10), "setModalPresentationStyle:", 2);
    objc_msgSend(*((id *)a1[4] + 10), "setRemoteController:", a1[4]);
    objc_msgSend(a1[4], "presentViewController:animated:completion:", *((_QWORD *)a1[4] + 10), 1, 0);
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
  FontInstallMissingController *v7;

  v7 = self;
  v6 = a2;
  v5 = a3;
  v4.receiver = self;
  v4.super_class = (Class)FontInstallMissingController;
  -[FontInstallMissingController viewWillAppear:](&v4, "viewWillAppear:", a3);
  v3 = -[FontInstallMissingController _remoteViewControllerProxy](v7, "_remoteViewControllerProxy");
  objc_msgSend(v3, "setStatusBarHidden:withDuration:", 1, 0.0);
  objc_msgSend(v3, "setAllowsAlertItems:", 1);
  objc_storeStrong(&v3, 0);
}

- (void)viewDidDisappear:(BOOL)a3
{
  NSObject *log;
  os_log_type_t type;
  objc_super v5;
  uint8_t v6[15];
  char v7;
  id location;
  BOOL v9;
  SEL v10;
  FontInstallMissingController *v11;

  v11 = self;
  v10 = a2;
  v9 = a3;
  if (self->_connection)
  {
    location = &_os_log_default;
    v7 = 2;
    if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_DEBUG))
    {
      log = location;
      type = v7;
      __os_log_helper_16_0_0(v6);
      _os_log_debug_impl((void *)&_mh_execute_header, log, type, "Missing Font Dialog must have been forcibly dismissed.", v6, 2u);
    }
    objc_storeStrong(&location, 0);
    -[FontInstallMissingController doneWithMissingFonts:withDismissAnimated:](v11, "doneWithMissingFonts:withDismissAnimated:", &__NSArray0__struct, 1);
  }
  v5.receiver = v11;
  v5.super_class = (Class)FontInstallMissingController;
  -[FontInstallMissingController viewDidDisappear:](&v5, "viewDidDisappear:", v9);
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
  FontInstallMissingController *v17;

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
  v10 = __50__FontInstallMissingController_connectToEndpoint___block_invoke;
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

void __50__FontInstallMissingController_connectToEndpoint___block_invoke(id *a1)
{
  NSObject *log;
  os_log_type_t type;
  uint8_t v3[15];
  char v4;
  id location;
  id v6[3];

  v6[2] = a1;
  v6[1] = a1;
  v6[0] = objc_loadWeakRetained(a1 + 4);
  if (v6[0])
  {
    location = &_os_log_default;
    v4 = 2;
    if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_DEBUG))
    {
      log = location;
      type = v4;
      __os_log_helper_16_0_0(v3);
      _os_log_debug_impl((void *)&_mh_execute_header, log, type, "FontInstallMissingController invalidated.", v3, 2u);
    }
    objc_storeStrong(&location, 0);
  }
  objc_storeStrong(v6, 0);
}

- (void)setupWithUserInfo:(id)a3 xpcEndpoint:(id)a4 dismissHandler:(id)a5
{
  id v5;
  id dismissHandler;
  id v9;
  id v10;
  id v11;
  id location[2];
  FontInstallMissingController *v13;

  v13 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v11 = 0;
  objc_storeStrong(&v11, a4);
  v10 = 0;
  objc_storeStrong(&v10, a5);
  v9 = objc_msgSend(location[0], "objectForKey:", CFSTR("fonts"));
  -[FontInstallMissingController setInput:](v13, "setInput:");

  -[FontInstallMissingController configureControllersForInput](v13, "configureControllersForInput");
  v5 = objc_retainBlock(v10);
  dismissHandler = v13->_dismissHandler;
  v13->_dismissHandler = v5;

  -[FontInstallMissingController connectToEndpoint:](v13, "connectToEndpoint:", v11);
  objc_storeStrong(&v10, 0);
  objc_storeStrong(&v11, 0);
  objc_storeStrong(location, 0);
}

- (void)configureWithContext:(id)a3 completion:(id)a4
{
  FontInstallMissingController *v4;
  id v5;
  NSObject *log;
  os_log_type_t type;
  id v9;
  id v10;
  id v11;
  uint8_t v12[15];
  char v13;
  id v14;
  id v15;
  id v16;
  id location[2];
  FontInstallMissingController *v18;

  v18 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v16 = 0;
  objc_storeStrong(&v16, a4);
  v15 = -[FontInstallMissingController _remoteViewControllerProxyWithErrorHandler:](v18, "_remoteViewControllerProxyWithErrorHandler:", &__block_literal_global_1);
  v11 = -[FontInstallMissingController view](v18, "view");
  v10 = objc_msgSend(v11, "window");
  v9 = objc_msgSend(v10, "windowScene");
  objc_msgSend(v15, "setLaunchingInterfaceOrientation:", objc_msgSend(v9, "interfaceOrientation"));

  objc_msgSend(v15, "setReachabilityDisabled:", 1);
  objc_msgSend(v15, "setAllowsAlertStacking:", 0);
  v14 = &_os_log_default;
  v13 = 2;
  if (os_log_type_enabled((os_log_t)v14, OS_LOG_TYPE_DEBUG))
  {
    log = v14;
    type = v13;
    __os_log_helper_16_0_0(v12);
    _os_log_debug_impl((void *)&_mh_execute_header, log, type, "FontInstall configureWithContext", v12, 2u);
  }
  objc_storeStrong(&v14, 0);
  v4 = v18;
  v5 = objc_msgSend(location[0], "xpcEndpoint");
  -[FontInstallMissingController connectToEndpoint:](v4, "connectToEndpoint:");

  if (v16)
    (*((void (**)(void))v16 + 2))();
  objc_storeStrong(&v15, 0);
  objc_storeStrong(&v16, 0);
  objc_storeStrong(location, 0);
}

void __64__FontInstallMissingController_configureWithContext_completion___block_invoke(id a1, NSError *a2)
{
  os_log_t oslog[2];
  id location[2];
  uint8_t v5[24];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  oslog[1] = (os_log_t)a1;
  oslog[0] = (os_log_t)&_os_log_default;
  if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEBUG))
  {
    __os_log_helper_16_2_1_8_64((uint64_t)v5, (uint64_t)location[0]);
    _os_log_debug_impl((void *)&_mh_execute_header, oslog[0], OS_LOG_TYPE_DEBUG, "FontInstall configureWithContext - error - %@", v5, 0xCu);
  }
  objc_storeStrong((id *)oslog, 0);
  objc_storeStrong(location, 0);
}

- (void)configureControllersForInput
{
  id v2;
  NSBundle *v3;
  const __CFString *v4;
  NSString *v5;
  NSString *v6;
  NSBundle *v7;
  const __CFString *v8;
  NSString *v9;
  NSString *v10;
  UIImage *v11;
  UIImage *subIcon;
  NSString *v13;
  NSString *v14;
  NSString *v15;
  NSString *v16;
  NSBundle *v17;
  const __CFString *v18;
  NSString *v19;
  NSString *alertTitle;
  NSBundle *v21;
  const __CFString *v22;
  NSString *v23;
  NSString *messageText;
  NSString *v25;
  NSString *cancelTitle;
  NSString *v27;
  NSString *noncancelTitle;
  NSBundle *v29;
  const __CFString *v30;
  NSString *v31;
  NSString *v32;
  NSBundle *v33;
  const __CFString *v34;
  NSString *v35;
  NSString *v36;
  NSString *v37;
  NSString *v38;
  NSString *v39;
  NSString *v40;
  NSString *v41;
  NSBundle *v42;
  NSString *v43;
  NSBundle *v44;
  NSBundle *v45;
  NSBundle *v46;
  UIScreen *v47;
  id v48;
  NSString *v49;
  NSBundle *v50;
  NSString *v51;
  NSString *v52;
  NSBundle *v53;
  NSBundle *v54;
  NSBundle *v55;
  NSMutableArray *v56;
  NSString *v57;
  id v58;
  NSString *v59;
  NSBundle *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  id v64;
  NSArray *v65;
  id v66;
  NSString *v67;
  NSBundle *v68;
  NSString *v69;
  NSBundle *v70;
  NSBundle *v71;
  NSBundle *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  id v76;
  NSArray *v77;
  NSUInteger v78;
  NSArray *obj;
  id v80;
  id v81;
  id v82;
  id v83;
  id v84;
  _QWORD v85[8];
  id v86;
  NSMutableArray *v87;
  BOOL v88;
  id v89;
  id v90;
  _QWORD __b[8];
  id v92;
  uint64_t v93;
  id v94;
  unint64_t v95;
  SEL v96;
  FontInstallMissingController *v97;
  _BYTE v98[128];
  _BYTE v99[128];

  v97 = self;
  v96 = a2;
  v77 = -[FontInstallMissingController input](self, "input");
  v78 = -[NSArray count](v77, "count");

  v95 = v78;
  v94 = objc_opt_new(NSMutableSet);
  v93 = 0;
  memset(__b, 0, sizeof(__b));
  obj = -[FontInstallMissingController input](v97, "input");
  v80 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", __b, v99, 16);
  if (v80)
  {
    v74 = *(_QWORD *)__b[2];
    v75 = 0;
    v76 = v80;
    while (1)
    {
      v73 = v75;
      if (*(_QWORD *)__b[2] != v74)
        objc_enumerationMutation(obj);
      v92 = *(id *)(__b[1] + 8 * v75);
      v90 = objc_msgSend(v92, "objectForKeyedSubscript:", CFSTR("providers"));
      objc_msgSend(v94, "addObjectsFromArray:", v90);
      v2 = objc_msgSend(v90, "count");
      v93 += v2 != 0;
      objc_storeStrong(&v90, 0);
      ++v75;
      if (v73 + 1 >= (unint64_t)v76)
      {
        v75 = 0;
        v76 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", __b, v99, 16);
        if (!v76)
          break;
      }
    }
  }

  v89 = objc_msgSend(v94, "count");
  v88 = v95 <= 3;
  if (v93)
  {
    if (v88 && v89 == (id)1 && v93 == v95)
    {
      v87 = objc_opt_new(NSMutableArray);
      memset(v85, 0, sizeof(v85));
      v65 = -[FontInstallMissingController input](v97, "input");
      v66 = -[NSArray countByEnumeratingWithState:objects:count:](v65, "countByEnumeratingWithState:objects:count:", v85, v98, 16);
      if (v66)
      {
        v62 = *(_QWORD *)v85[2];
        v63 = 0;
        v64 = v66;
        while (1)
        {
          v61 = v63;
          if (*(_QWORD *)v85[2] != v62)
            objc_enumerationMutation(v65);
          v86 = *(id *)(v85[1] + 8 * v63);
          v56 = v87;
          v60 = +[NSBundle mainBundle](NSBundle, "mainBundle");
          v59 = -[NSBundle localizedStringForKey:value:table:](v60, "localizedStringForKey:value:table:", CFSTR("QUOTE_FONT_NAME_IN_LIST"), &stru_100014650, 0);
          v58 = objc_msgSend(v86, "objectForKeyedSubscript:", CFSTR("displayName"));
          v57 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v59, v58);
          -[NSMutableArray addObject:](v56, "addObject:");

          ++v63;
          if (v61 + 1 >= (unint64_t)v64)
          {
            v63 = 0;
            v64 = -[NSArray countByEnumeratingWithState:objects:count:](v65, "countByEnumeratingWithState:objects:count:", v85, v98, 16);
            if (!v64)
              break;
          }
        }
      }

      v84 = objc_msgSend(v94, "anyObject");
      v47 = +[UIScreen mainScreen](UIScreen, "mainScreen");
      -[UIScreen scale](v47, "scale");
      v83 = +[UIImage _applicationIconImageForBundleIdentifier:format:scale:](UIImage, "_applicationIconImageForBundleIdentifier:format:scale:", v84, 2);

      v48 = objc_msgSend(objc_alloc((Class)LSApplicationRecord), "initWithBundleIdentifier:allowPlaceholder:error:", v84, 0);
      v82 = objc_msgSend(v48, "localizedName");

      v81 = -[NSMutableArray count](v87, "count");
      objc_storeStrong((id *)&v97->_subIcon, v83);
      v17 = +[NSBundle mainBundle](NSBundle, "mainBundle");
      v50 = v17;
      if (v81 == (id)1)
        v18 = CFSTR("INSTALL_TITLE_SINGULAR");
      else
        v18 = CFSTR("INSTALL_TITLE_PLURAL");
      v49 = -[NSBundle localizedStringForKey:value:table:](v17, "localizedStringForKey:value:table:", v18);
      v19 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:");
      alertTitle = v97->_alertTitle;
      v97->_alertTitle = v19;

      v21 = +[NSBundle mainBundle](NSBundle, "mainBundle");
      v53 = v21;
      if (v81 == (id)1)
        v22 = CFSTR("MISSING_SIMPLE_AVAILABLE_SINGULAR");
      else
        v22 = CFSTR("MISSING_SIMPLE_AVAILABLE_PLURAL");
      v52 = -[NSBundle localizedStringForKey:value:table:](v21, "localizedStringForKey:value:table:", v22, &stru_100014650, 0);
      v51 = +[NSListFormatter localizedStringByJoiningStrings:](NSListFormatter, "localizedStringByJoiningStrings:", v87);
      v23 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v52, v51, v82);
      messageText = v97->_messageText;
      v97->_messageText = v23;

      v54 = +[NSBundle mainBundle](NSBundle, "mainBundle");
      v25 = -[NSBundle localizedStringForKey:value:table:](v54, "localizedStringForKey:value:table:", CFSTR("IGNORE_BUTTON"), &stru_100014650, 0);
      cancelTitle = v97->_cancelTitle;
      v97->_cancelTitle = v25;

      v55 = +[NSBundle mainBundle](NSBundle, "mainBundle");
      v27 = -[NSBundle localizedStringForKey:value:table:](v55, "localizedStringForKey:value:table:", CFSTR("DETAILS_BUTTON"), &stru_100014650, 0);
      noncancelTitle = v97->_noncancelTitle;
      v97->_noncancelTitle = v27;

      objc_storeStrong(&v82, 0);
      objc_storeStrong(&v83, 0);
      objc_storeStrong(&v84, 0);
      objc_storeStrong((id *)&v87, 0);
    }
    else
    {
      objc_storeStrong((id *)&v97->_subIcon, 0);
      v29 = +[NSBundle mainBundle](NSBundle, "mainBundle");
      v42 = v29;
      if (v93 == 1)
        v30 = CFSTR("INSTALL_TITLE_SINGULAR");
      else
        v30 = CFSTR("INSTALL_TITLE_PLURAL");
      v41 = -[NSBundle localizedStringForKey:value:table:](v29, "localizedStringForKey:value:table:", v30);
      v31 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:");
      v32 = v97->_alertTitle;
      v97->_alertTitle = v31;

      v33 = +[NSBundle mainBundle](NSBundle, "mainBundle");
      v44 = v33;
      if (v93 == 1)
        v34 = CFSTR("MISSING_AVAILABLE_SINGULAR");
      else
        v34 = CFSTR("MISSING_AVAILABLE_PLURAL");
      v43 = -[NSBundle localizedStringForKey:value:table:](v33, "localizedStringForKey:value:table:", v34, &stru_100014650, 0);
      v35 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:");
      v36 = v97->_messageText;
      v97->_messageText = v35;

      v45 = +[NSBundle mainBundle](NSBundle, "mainBundle");
      v37 = -[NSBundle localizedStringForKey:value:table:](v45, "localizedStringForKey:value:table:", CFSTR("IGNORE_BUTTON"), &stru_100014650, 0);
      v38 = v97->_cancelTitle;
      v97->_cancelTitle = v37;

      v46 = +[NSBundle mainBundle](NSBundle, "mainBundle");
      v39 = -[NSBundle localizedStringForKey:value:table:](v46, "localizedStringForKey:value:table:", CFSTR("DETAILS_BUTTON"), &stru_100014650, 0);
      v40 = v97->_noncancelTitle;
      v97->_noncancelTitle = v39;

    }
  }
  else
  {
    v3 = +[NSBundle mainBundle](NSBundle, "mainBundle");
    v68 = v3;
    if (v95 == 1)
      v4 = CFSTR("CANT_INSTALL_TITLE_SINGULAR");
    else
      v4 = CFSTR("CANT_INSTALL_TITLE_PLURAL");
    v67 = -[NSBundle localizedStringForKey:value:table:](v3, "localizedStringForKey:value:table:", v4);
    v5 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v95);
    v6 = v97->_alertTitle;
    v97->_alertTitle = v5;

    v7 = +[NSBundle mainBundle](NSBundle, "mainBundle");
    v70 = v7;
    if (v95 == 1)
      v8 = CFSTR("MISSING_UNAVAILABLE_SINGULAR");
    else
      v8 = CFSTR("MISSING_UNAVAILABLE_PLURAL");
    v69 = -[NSBundle localizedStringForKey:value:table:](v7, "localizedStringForKey:value:table:", v8, &stru_100014650, 0);
    v9 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:");
    v10 = v97->_messageText;
    v97->_messageText = v9;

    v11 = +[UIImage imageNamed:](UIImage, "imageNamed:", CFSTR("Caution"));
    subIcon = v97->_subIcon;
    v97->_subIcon = v11;

    v71 = +[NSBundle mainBundle](NSBundle, "mainBundle");
    v13 = -[NSBundle localizedStringForKey:value:table:](v71, "localizedStringForKey:value:table:", CFSTR("OK_BUTTON"), &stru_100014650, 0);
    v14 = v97->_cancelTitle;
    v97->_cancelTitle = v13;

    v72 = +[NSBundle mainBundle](NSBundle, "mainBundle");
    v15 = -[NSBundle localizedStringForKey:value:table:](v72, "localizedStringForKey:value:table:", CFSTR("DETAILS_BUTTON"), &stru_100014650, 0);
    v16 = v97->_noncancelTitle;
    v97->_noncancelTitle = v15;

  }
  objc_storeStrong(&v94, 0);
}

- (void)prepareForActivationWithContext:(id)a3 completion:(id)a4
{
  id v4;
  id v5;
  NSObject *log;
  os_log_type_t type;
  uint8_t v9[15];
  char v10;
  id v11;
  id v12;
  id v13;
  id location[2];
  FontInstallMissingController *v15;

  v15 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v13 = 0;
  objc_storeStrong(&v13, a4);
  v12 = -[FontInstallMissingController _remoteViewControllerProxyWithErrorHandler:](v15, "_remoteViewControllerProxyWithErrorHandler:", &__block_literal_global_127);
  v11 = &_os_log_default;
  v10 = 2;
  if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_DEBUG))
  {
    log = v11;
    type = v10;
    __os_log_helper_16_0_0(v9);
    _os_log_debug_impl((void *)&_mh_execute_header, log, type, "FontInstall prepareForActivationWithContext", v9, 2u);
  }
  objc_storeStrong(&v11, 0);
  objc_msgSend(v12, "setStatusBarHidden:withDuration:", 1, 0.4);
  v5 = objc_msgSend(location[0], "userInfo");
  v4 = objc_msgSend(v5, "objectForKey:", CFSTR("fonts"));
  -[FontInstallMissingController setInput:](v15, "setInput:");

  -[FontInstallMissingController configureControllersForInput](v15, "configureControllersForInput");
  if (v13)
    (*((void (**)(void))v13 + 2))();
  objc_storeStrong(&v12, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(location, 0);
}

void __75__FontInstallMissingController_prepareForActivationWithContext_completion___block_invoke(id a1, NSError *a2)
{
  os_log_t oslog[2];
  id location[2];
  uint8_t v5[24];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  oslog[1] = (os_log_t)a1;
  oslog[0] = (os_log_t)&_os_log_default;
  if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEBUG))
  {
    __os_log_helper_16_2_1_8_64((uint64_t)v5, (uint64_t)location[0]);
    _os_log_debug_impl((void *)&_mh_execute_header, oslog[0], OS_LOG_TYPE_DEBUG, "FontInstall prepareForActivationWithContext - error - %@", v5, 0xCu);
  }
  objc_storeStrong((id *)oslog, 0);
  objc_storeStrong(location, 0);
}

- (void)doneWithMissingFonts:(id)a3 withDismissAnimated:(BOOL)a4
{
  BOOL v4;
  FontInstallMissingController *v5;
  void **v7;
  int v8;
  int v9;
  void (*v10)(id *);
  void *v11;
  FontInstallMissingController *v12;
  id v13;
  os_log_type_t v14;
  id v15;
  BOOL v16;
  id location[2];
  FontInstallMissingController *v18;
  uint8_t v19[24];

  v18 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v16 = a4;
  v15 = &_os_log_default;
  v14 = OS_LOG_TYPE_DEBUG;
  if (os_log_type_enabled((os_log_t)v15, OS_LOG_TYPE_DEBUG))
  {
    __os_log_helper_16_2_1_8_64((uint64_t)v19, (uint64_t)location[0]);
    _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)v15, v14, "FontInstall doneWithMissingFonts:%@", v19, 0xCu);
  }
  objc_storeStrong(&v15, 0);
  v13 = -[NSXPCConnection remoteObjectProxyWithErrorHandler:](v18->_connection, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_128);
  objc_msgSend(v13, "doneWithMissingFonts:", location[0]);
  v5 = v18;
  v4 = v16;
  v7 = _NSConcreteStackBlock;
  v8 = -1073741824;
  v9 = 0;
  v10 = __73__FontInstallMissingController_doneWithMissingFonts_withDismissAnimated___block_invoke_129;
  v11 = &unk_1000142D0;
  v12 = v18;
  -[FontInstallMissingController dismissViewControllerAnimated:completion:](v5, "dismissViewControllerAnimated:completion:", v4, &v7);
  objc_storeStrong((id *)&v12, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(location, 0);
}

void __73__FontInstallMissingController_doneWithMissingFonts_withDismissAnimated___block_invoke(id a1, NSError *a2)
{
  os_log_t oslog[2];
  id location[2];
  uint8_t v5[24];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  oslog[1] = (os_log_t)a1;
  oslog[0] = (os_log_t)&_os_log_default;
  if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEBUG))
  {
    __os_log_helper_16_2_1_8_64((uint64_t)v5, (uint64_t)location[0]);
    _os_log_debug_impl((void *)&_mh_execute_header, oslog[0], OS_LOG_TYPE_DEBUG, "FontInstallViewService connection error - %@", v5, 0xCu);
  }
  objc_storeStrong((id *)oslog, 0);
  objc_storeStrong(location, 0);
}

void __73__FontInstallMissingController_doneWithMissingFonts_withDismissAnimated___block_invoke_129(id *a1)
{
  id v2[3];

  v2[2] = a1;
  v2[1] = a1;
  objc_msgSend(*((id *)a1[4] + 3), "invalidate");
  objc_storeStrong((id *)a1[4] + 3, 0);
  if (*((_QWORD *)a1[4] + 11))
    (*(void (**)(void))(*((_QWORD *)a1[4] + 11) + 16))();
  v2[0] = objc_msgSend(a1[4], "_remoteViewControllerProxy");
  objc_msgSend(v2[0], "deactivate");
  objc_msgSend(v2[0], "invalidate");
  objc_storeStrong((id *)a1[4] + 2, 0);
  objc_storeStrong((id *)a1[4] + 1, 0);
  objc_storeStrong((id *)a1[4] + 10, 0);
  objc_storeStrong((id *)a1[4] + 8, 0);
  objc_storeStrong((id *)a1[4] + 9, 0);
  objc_storeStrong(v2, 0);
}

- (NSArray)input
{
  return self->_input;
}

- (void)setInput:(id)a3
{
  objc_storeStrong((id *)&self->_input, a3);
}

- (NSMutableArray)output
{
  return self->_output;
}

- (void)setOutput:(id)a3
{
  objc_storeStrong((id *)&self->_output, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_output, 0);
  objc_storeStrong((id *)&self->_input, 0);
  objc_storeStrong(&self->_dismissHandler, 0);
  objc_storeStrong((id *)&self->_detailPresentationController, 0);
  objc_storeStrong((id *)&self->_subIcon, 0);
  objc_storeStrong((id *)&self->_mainIcon, 0);
  objc_storeStrong((id *)&self->_messageText, 0);
  objc_storeStrong((id *)&self->_alertTitle, 0);
  objc_storeStrong((id *)&self->_noncancelTitle, 0);
  objc_storeStrong((id *)&self->_cancelTitle, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_initialViewController, 0);
  objc_storeStrong((id *)&self->_storyboard, 0);
}

@end
