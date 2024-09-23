@implementation FontInstallSceneDelegate

- (FontInstallSceneDelegate)init
{
  NSSet *v2;
  NSSet *supportedControllerClassNames;
  FontInstallSceneDelegate *v5;
  FontInstallSceneDelegate *v6;
  objc_super v7;
  SEL v8;
  FontInstallSceneDelegate *v9;

  v8 = a2;
  v9 = 0;
  v7.receiver = self;
  v7.super_class = (Class)FontInstallSceneDelegate;
  v6 = -[FontInstallSceneDelegate init](&v7, "init");
  v9 = v6;
  objc_storeStrong((id *)&v9, v6);
  if (v6)
  {
    v2 = +[NSSet setWithArray:](NSSet, "setWithArray:", &off_100015078);
    supportedControllerClassNames = v9->_supportedControllerClassNames;
    v9->_supportedControllerClassNames = v2;

  }
  v5 = v9;
  objc_storeStrong((id *)&v9, 0);
  return v5;
}

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v5;
  UIWindow *v6;
  UIWindow *window;
  id v10;
  NSArray *v11;
  id v12;
  id v13;
  id v14;
  id location[2];
  FontInstallSceneDelegate *v16;
  FontInstallSceneDelegate *v17;

  v16 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v14 = 0;
  objc_storeStrong(&v14, a4);
  v13 = 0;
  objc_storeStrong(&v13, a5);
  v12 = location[0];
  v5 = objc_alloc((Class)UIWindow);
  v6 = (UIWindow *)objc_msgSend(v5, "initWithWindowScene:", v12);
  window = v16->_window;
  v16->_window = v6;

  v10 = location[0];
  v17 = v16;
  v11 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v17, 1);
  objc_msgSend(v10, "_registerSceneActionsHandlerArray:forKey:");

  objc_storeStrong(&v12, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(location, 0);
}

- (id)_respondToActions:(id)a3 forFBSScene:(id)a4 inUIScene:(id)a5 fromTransitionContext:(id)a6
{
  FontInstallUISceneProtocol *rootViewController;
  FontInstallUISceneProtocol *v7;
  id v9;
  FontInstallMainController *v10;
  DeleteAppFontsMainController *v11;
  FontInstallMissingController *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  id v17;
  id v18;
  int v22;
  void **v23;
  int v24;
  int v25;
  void (*v26)(id *);
  void *v27;
  id v28;
  id v29;
  id from;
  id v31;
  id v32;
  id v33;
  id v34;
  _QWORD __b[8];
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id location[2];
  FontInstallSceneDelegate *v42;
  _BYTE v43[128];

  v42 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v40 = 0;
  objc_storeStrong(&v40, a4);
  v39 = 0;
  objc_storeStrong(&v39, a5);
  v38 = 0;
  objc_storeStrong(&v38, a6);
  v37 = objc_msgSend(location[0], "mutableCopy");
  memset(__b, 0, sizeof(__b));
  v17 = location[0];
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", __b, v43, 16);
  if (v18)
  {
    v14 = *(_QWORD *)__b[2];
    v15 = 0;
    v16 = v18;
    while (1)
    {
      v13 = v15;
      if (*(_QWORD *)__b[2] != v14)
        objc_enumerationMutation(v17);
      v36 = *(id *)(__b[1] + 8 * v15);
      v34 = objc_msgSend(v36, "info");
      v33 = objc_msgSend(v34, "objectForSetting:", 0);
      v32 = objc_msgSend(v34, "objectForSetting:", 1);
      v31 = objc_msgSend(v34, "objectForSetting:", 2);
      if (v33 && v31 && -[NSSet containsObject:](v42->_supportedControllerClassNames, "containsObject:", v32))
      {
        if ((objc_msgSend(v32, "isEqualToString:", CFSTR("FontInstallMissingController")) & 1) != 0)
        {
          v12 = objc_alloc_init(FontInstallMissingController);
          rootViewController = v42->_rootViewController;
          v42->_rootViewController = (FontInstallUISceneProtocol *)v12;

        }
        else
        {
          if ((objc_msgSend(v32, "isEqualToString:", CFSTR("DeleteAppFontsMainController")) & 1) != 0)
          {
            v11 = objc_alloc_init(DeleteAppFontsMainController);
            v7 = v42->_rootViewController;
            v42->_rootViewController = (FontInstallUISceneProtocol *)v11;
          }
          else
          {
            v10 = objc_alloc_init(FontInstallMainController);
            v7 = v42->_rootViewController;
            v42->_rootViewController = (FontInstallUISceneProtocol *)v10;
          }

        }
        -[UIWindow setRootViewController:](v42->_window, "setRootViewController:", v42->_rootViewController);
        -[UIWindow setContentsPosition:](v42->_window, "setContentsPosition:", 0);
        objc_initWeak(&from, v42);
        v23 = _NSConcreteStackBlock;
        v24 = -1073741824;
        v25 = 0;
        v26 = __90__FontInstallSceneDelegate__respondToActions_forFBSScene_inUIScene_fromTransitionContext___block_invoke;
        v27 = &unk_100014228;
        objc_copyWeak(&v28, &from);
        v29 = objc_retainBlock(&v23);
        -[FontInstallUISceneProtocol setupWithUserInfo:xpcEndpoint:dismissHandler:](v42->_rootViewController, "setupWithUserInfo:xpcEndpoint:dismissHandler:", v33, v31, v29);
        objc_msgSend(v37, "removeObject:", v36);
        v22 = 2;
        objc_storeStrong(&v29, 0);
        objc_destroyWeak(&v28);
        objc_destroyWeak(&from);
      }
      else
      {
        v22 = 0;
      }
      objc_storeStrong(&v31, 0);
      objc_storeStrong(&v32, 0);
      objc_storeStrong(&v33, 0);
      objc_storeStrong(&v34, 0);
      if (v22)
        break;
      ++v15;
      if (v13 + 1 >= (unint64_t)v16)
      {
        v15 = 0;
        v16 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", __b, v43, 16);
        if (!v16)
          break;
      }
    }
  }

  -[UIWindow makeKeyAndVisible](v42->_window, "makeKeyAndVisible");
  v9 = objc_msgSend(v37, "copy");
  objc_storeStrong(&v37, 0);
  objc_storeStrong(&v38, 0);
  objc_storeStrong(&v39, 0);
  objc_storeStrong(&v40, 0);
  objc_storeStrong(location, 0);
  return v9;
}

void __90__FontInstallSceneDelegate__respondToActions_forFBSScene_inUIScene_fromTransitionContext___block_invoke(id *a1)
{
  id location[3];

  location[2] = a1;
  location[1] = a1;
  location[0] = objc_loadWeakRetained(a1 + 4);
  if (location[0])
    objc_msgSend(location[0], "_cleanupOnRootControllerDismiss");
  objc_storeStrong(location, 0);
}

- (void)sceneDidEnterBackground:(id)a3
{
  id location[2];
  FontInstallSceneDelegate *v4;

  v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (v4->_rootViewController)
  {
    -[FontInstallUISceneProtocol dismissViewControllerAnimated:completion:](v4->_rootViewController, "dismissViewControllerAnimated:completion:", 1, 0);
    -[FontInstallSceneDelegate _cleanupOnRootControllerDismiss](v4, "_cleanupOnRootControllerDismiss");
  }
  objc_storeStrong(location, 0);
}

- (void)_cleanupOnRootControllerDismiss
{
  id v2;
  UIWindowScene *v3;
  UIApplication *v4;

  -[UIWindow setRootViewController:](self->_window, "setRootViewController:");
  v4 = +[UIApplication sharedApplication](UIApplication, "sharedApplication");
  v3 = -[UIWindow windowScene](self->_window, "windowScene");
  v2 = -[UIWindowScene session](v3, "session");
  -[UIApplication requestSceneSessionDestruction:options:errorHandler:](v4, "requestSceneSessionDestruction:options:errorHandler:");

}

void __59__FontInstallSceneDelegate__cleanupOnRootControllerDismiss__block_invoke(id a1, NSError *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  FSLog_Error(CFSTR("FontInstallViewService"), CFSTR("Scene destruction request failed - %@"), v2, v3, v4, v5, v6, v7, (uint64_t)location[0]);
  objc_storeStrong(location, 0);
}

- (UIWindow)window
{
  return self->_window;
}

- (void)setWindow:(id)a3
{
  objc_storeStrong((id *)&self->_window, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_window, 0);
  objc_storeStrong((id *)&self->_supportedControllerClassNames, 0);
  objc_storeStrong((id *)&self->_rootViewController, 0);
}

@end
