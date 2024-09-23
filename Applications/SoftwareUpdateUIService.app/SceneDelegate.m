@implementation SceneDelegate

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v5;
  UIWindow *v6;
  UIWindow *window;
  id v8;
  NSArray *v9;
  id v12;
  id v13;
  id v14;
  id location[2];
  SceneDelegate *v16;
  uint8_t v17[24];

  v16 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v14 = 0;
  objc_storeStrong(&v14, a4);
  v13 = 0;
  objc_storeStrong(&v13, a5);
  v12 = (id)SUSUILog();
  if (os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_DEFAULT))
  {
    sub_100006914((uint64_t)v17, (uint64_t)"-[SceneDelegate scene:willConnectToSession:options:]", (uint64_t)v13);
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v12, OS_LOG_TYPE_DEFAULT, "%s connectionOptions:%@", v17, 0x16u);
  }
  objc_storeStrong(&v12, 0);
  v5 = objc_alloc((Class)UIWindow);
  v6 = (UIWindow *)objc_msgSend(v5, "initWithWindowScene:", location[0]);
  window = v16->_window;
  v16->_window = v6;

  v8 = location[0];
  v9 = +[NSArray arrayWithObject:](NSArray, "arrayWithObject:", v16);
  objc_msgSend(v8, "_registerSceneActionsHandlerArray:forKey:");

  objc_storeStrong(&v13, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(location, 0);
}

- (id)_respondToActions:(id)a3 forFBSScene:(id)a4 inUIScene:(id)a5 fromTransitionContext:(id)a6
{
  id v7;
  id v8;
  id v9;
  NSObject *log;
  os_log_type_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  id v19;
  id v20;
  SUSUIRemoteAuthenticationContainerViewController *v21;
  int v22;
  id v23;
  os_log_type_t type;
  os_log_t oslog;
  _QWORD __b[8];
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id location[2];
  SceneDelegate *v33;
  uint8_t v34[24];
  _BYTE v35[128];

  v33 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v31 = 0;
  objc_storeStrong(&v31, a4);
  v30 = 0;
  objc_storeStrong(&v30, a5);
  v29 = 0;
  objc_storeStrong(&v29, a6);
  v28 = objc_msgSend(location[0], "mutableCopy");
  memset(__b, 0, sizeof(__b));
  v19 = location[0];
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", __b, v35, 16);
  if (v20)
  {
    v13 = *(_QWORD *)__b[2];
    v14 = 0;
    v15 = v20;
    while (1)
    {
      v12 = v14;
      if (*(_QWORD *)__b[2] != v13)
        objc_enumerationMutation(v19);
      v27 = *(id *)(__b[1] + 8 * v14);
      oslog = (os_log_t)(id)SUSUILog();
      type = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
      {
        log = oslog;
        v11 = type;
        sub_100006914((uint64_t)v34, (uint64_t)"-[SceneDelegate _respondToActions:forFBSScene:inUIScene:fromTransitionContext:]", (uint64_t)v27);
        _os_log_impl((void *)&_mh_execute_header, log, v11, " %s got new action:%@", v34, 0x16u);
      }
      objc_storeStrong((id *)&oslog, 0);
      v8 = objc_alloc((Class)SUSUIAuthenticationAlertAction);
      v9 = objc_msgSend(v27, "info");
      v23 = objc_msgSend(v8, "initWithInfo:forBaseAction:");

      if (v23)
      {
        objc_msgSend(v28, "removeObject:", v27);
        v21 = objc_alloc_init(SUSUIRemoteAuthenticationContainerViewController);
        -[SUSUIRemoteAuthenticationContainerViewController configureWithAction:](v21, "configureWithAction:", v23);
        -[UIWindow setRootViewController:](v33->_window, "setRootViewController:", v21);
        -[UIWindow makeKeyAndVisible](v33->_window, "makeKeyAndVisible");
        objc_storeStrong((id *)&v21, 0);
        v22 = 0;
      }
      else
      {
        v22 = 3;
      }
      objc_storeStrong(&v23, 0);
      ++v14;
      if (v12 + 1 >= (unint64_t)v15)
      {
        v14 = 0;
        v15 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", __b, v35, 16);
        if (!v15)
          break;
      }
    }
  }

  v7 = v28;
  v22 = 1;
  objc_storeStrong(&v28, 0);
  objc_storeStrong(&v29, 0);
  objc_storeStrong(&v30, 0);
  objc_storeStrong(&v31, 0);
  objc_storeStrong(location, 0);
  return v7;
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
}

@end
