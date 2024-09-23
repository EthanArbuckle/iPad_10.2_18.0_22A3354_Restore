@implementation CBWindowManager

+ (id)sharedInstance
{
  if (qword_10008BDE8 != -1)
    dispatch_once(&qword_10008BDE8, &stru_100076210);
  return (id)qword_10008BDE0;
}

- (CBWindowManager)init
{
  CBWindowManager *v2;
  UIViewController *v3;
  void *v4;
  void *v5;
  CBWindow *v6;
  CBWindow *backgroundWindow;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  CBRecordingIndicatorManager *v11;
  void *v12;
  CBRecordingIndicatorManager *v13;
  CBRecordingIndicatorManager *rootWindowRecordingIndicatorManager;
  NSArray *v15;
  uint64_t i;
  void *v17;
  NSArray *layers;
  uint8_t v20[16];
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)CBWindowManager;
  v2 = -[CBWindowManager init](&v21, "init");
  if (v2)
  {
    v3 = objc_opt_new(UIViewController);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController view](v3, "view"));
    objc_msgSend(v5, "setBackgroundColor:", v4);

    v6 = objc_alloc_init(CBWindow);
    backgroundWindow = v2->_backgroundWindow;
    v2->_backgroundWindow = v6;

    -[CBWindow setWindowLevel:](v2->_backgroundWindow, "setWindowLevel:", -5000.0);
    -[CBWindow setRootViewController:](v2->_backgroundWindow, "setRootViewController:", v3);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CBWindow rootViewController](v2->_backgroundWindow, "rootViewController"));
    -[CBWindow setPresentedView:](v2->_backgroundWindow, "setPresentedView:", v8);

    -[CBWindow makeKeyAndVisible](v2->_backgroundWindow, "makeKeyAndVisible");
    v9 = CheckerBoardLogHandleForCategory(6);
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v20 = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Creating recording indicator manager for root window", v20, 2u);
    }

    v11 = [CBRecordingIndicatorManager alloc];
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[CBWindow windowScene](v2->_backgroundWindow, "windowScene"));
    v13 = -[CBRecordingIndicatorManager initWithWindowScene:](v11, "initWithWindowScene:", v12);
    rootWindowRecordingIndicatorManager = v2->_rootWindowRecordingIndicatorManager;
    v2->_rootWindowRecordingIndicatorManager = v13;

    v15 = (NSArray *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", 3));
    for (i = 0; i != 3; ++i)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
      -[NSArray insertObject:atIndex:](v15, "insertObject:atIndex:", v17, i);

    }
    layers = v2->_layers;
    v2->_layers = v15;

  }
  return v2;
}

- (id)createRepresentationWithIdentifier:(id)a3
{
  void *v4;
  double v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[CBWindowRepresentation windowRepresentationForIdentifier:](CBWindowRepresentation, "windowRepresentationForIdentifier:", a3));
  -[CBWindowManager _maxLevelForLayer:](self, "_maxLevelForLayer:", 1);
  objc_msgSend(v4, "setWindowLevel:", v5 + 10.0);
  objc_msgSend(v4, "setBackgroundTunnel:", 1);
  objc_msgSend(v4, "setWindowManager:", self);
  objc_msgSend(v4, "setWindowManagerLayer:", 1);
  return v4;
}

- (id)presentViewController:(id)a3 onLayer:(unint64_t)a4 backgroundTunnel:(BOOL)a5 statusBarVisible:(BOOL)a6 animated:(BOOL)a7 completion:(id)a8
{
  _BOOL8 v9;
  _BOOL8 v10;
  _BOOL8 v11;
  id v14;
  id v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  void *v19;
  int v21;
  id v22;

  v9 = a7;
  v10 = a6;
  v11 = a5;
  v14 = a3;
  v15 = a8;
  if (-[CBWindowManager _hasLaunchedDiagnosticsProcess](self, "_hasLaunchedDiagnosticsProcess"))
  {
    v16 = CheckerBoardLogHandleForCategory(2);
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v21 = 138412290;
      v22 = v14;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "CBSceneManager: present viewController %@ to be on top of the Diagnostics app", (uint8_t *)&v21, 0xCu);
    }

    v18 = (void *)objc_claimAutoreleasedReturnValue(+[CBSceneManager sharedInstance](CBSceneManager, "sharedInstance"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "presentViewController:completion:", v14, v15));

  }
  else
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[CBWindowManager _presentVC:onLayer:backgroundTunnel:statusBarVisible:animated:completion:](self, "_presentVC:onLayer:backgroundTunnel:statusBarVisible:animated:completion:", v14, a4, v11, v10, v9, v15));
  }

  return v19;
}

- (id)_presentVC:(id)a3 onLayer:(unint64_t)a4 backgroundTunnel:(BOOL)a5 statusBarVisible:(BOOL)a6 animated:(BOOL)a7 completion:(id)a8
{
  _BOOL8 v8;
  _BOOL8 v9;
  _BOOL8 v10;
  id v14;
  id v15;
  CBWindow *v16;
  double v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;
  CBWindowRootViewController *v21;
  void *v22;
  void *v23;
  CBWindow *v24;
  id v25;
  void *v26;
  CBWindow *v27;
  _QWORD v29[4];
  CBWindow *v30;
  id v31;
  uint8_t buf[4];
  uint64_t v33;

  v8 = a7;
  v9 = a6;
  v10 = a5;
  v14 = a8;
  v15 = a3;
  v16 = -[CBWindow initWithBackgroundTunnel:]([CBWindow alloc], "initWithBackgroundTunnel:", v10);
  -[CBWindow setWindowManager:](v16, "setWindowManager:", self);
  -[CBWindow setWindowManagerLayer:](v16, "setWindowManagerLayer:", a4);
  -[CBWindowManager _maxLevelForLayer:](self, "_maxLevelForLayer:", a4);
  -[CBWindow setWindowLevel:](v16, "setWindowLevel:", v17 + 10.0);
  v18 = CheckerBoardLogHandleForCategory(2);
  v19 = objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    -[CBWindow windowLevel](v16, "windowLevel");
    *(_DWORD *)buf = 134217984;
    v33 = v20;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Set window level to: %f", buf, 0xCu);
  }

  -[CBWindow setPresentViewControllerWithStatusBarShown:](v16, "setPresentViewControllerWithStatusBarShown:", v9);
  -[CBWindow setPresentedView:](v16, "setPresentedView:", v15);
  objc_msgSend(v15, "setModalPresentationStyle:", 0);
  v21 = objc_alloc_init(CBWindowRootViewController);
  -[CBWindowRootViewController setWindow:](v21, "setWindow:", v16);
  -[CBWindow setRootViewController:](v16, "setRootViewController:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  -[CBWindow setBackgroundColor:](v16, "setBackgroundColor:", v22);

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[CBWindow windowManager](v16, "windowManager"));
  objc_msgSend(v23, "windowWillAppear:", v16);

  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_10002D4BC;
  v29[3] = &unk_100075FE0;
  v24 = v16;
  v30 = v24;
  v31 = v14;
  v25 = v14;
  -[CBWindowRootViewController presentViewController:animated:completion:](v21, "presentViewController:animated:completion:", v15, v8, v29);

  v26 = v31;
  v27 = v24;

  return v27;
}

- (void)windowWillAppear:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "setHidden:", 0);

}

- (void)windowDidAppear:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  id location;

  objc_initWeak(&location, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CBWindowManager layers](self, "layers"));
  v5 = objc_loadWeakRetained(&location);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectAtIndex:", objc_msgSend(v5, "windowManagerLayer")));
  v7 = objc_loadWeakRetained(&location);
  objc_msgSend(v6, "addObject:", v7);

  -[CBWindowManager _adjustBackgroundWindowLevel](self, "_adjustBackgroundWindowLevel");
  -[CBWindowManager _rekeyWindows](self, "_rekeyWindows");
  objc_destroyWeak(&location);
}

- (void)windowWillDismiss:(id)a3
{
  uint64_t i;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  for (i = 0; i != 3; ++i)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CBWindowManager layers](self, "layers"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndex:", i));

    objc_msgSend(v6, "removeObject:", v7);
  }
  -[CBWindowManager _adjustBackgroundWindowLevel](self, "_adjustBackgroundWindowLevel");
  -[CBWindowManager _rekeyWindows](self, "_rekeyWindows");

}

- (void)windowDidDismiss:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "setHidden:", 1);

}

- (BOOL)_hasLaunchedDiagnosticsProcess
{
  void *v2;
  void *v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  BOOL v7;
  int v9;
  void *v10;
  __int16 v11;
  id v12;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[FBProcessManager sharedInstance](FBProcessManager, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "applicationProcessesForBundleIdentifier:", CFSTR("com.apple.Diagnostics")));

  v4 = CheckerBoardLogHandleForCategory(2);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "description"));
    v9 = 138412546;
    v10 = v6;
    v11 = 2048;
    v12 = objc_msgSend(v3, "count");
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Number of Diagnostics processes (%@): %lu", (uint8_t *)&v9, 0x16u);

  }
  v7 = objc_msgSend(v3, "count") != 0;

  return v7;
}

- (void)_rekeyWindows
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  int v9;
  void *v10;

  v3 = 2;
  while (1)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CBWindowManager layers](self, "layers"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectAtIndex:", v3));

    if (objc_msgSend(v5, "count"))
      break;

    if (!--v3)
      return;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "lastObject"));
  v7 = CheckerBoardLogHandleForCategory(2);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138412290;
    v10 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Making %@ the key window.", (uint8_t *)&v9, 0xCu);
  }

  objc_msgSend(v6, "makeKeyWindow");
}

- (double)_maxLevelForLayer:(unint64_t)a3
{
  const UIWindowLevel *v4;
  double v5;
  void *v6;
  void *v7;
  unint64_t v8;
  void *v9;
  double v10;
  double v11;

  if (a3)
  {
    if (a3 == 2)
      v4 = &UIWindowLevelAlert;
    else
      v4 = &UIWindowLevelNormal;
    v5 = *v4;
  }
  else
  {
    v5 = -4990.0;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CBWindowManager layers](self, "layers"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndex:", a3));

  if (objc_msgSend(v7, "count"))
  {
    v8 = 0;
    do
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndex:", v8));
      objc_msgSend(v9, "windowLevel");
      if (v5 < v10)
      {
        objc_msgSend(v9, "windowLevel");
        v5 = v11;
      }

      ++v8;
    }
    while (v8 < (unint64_t)objc_msgSend(v7, "count"));
  }

  return v5;
}

- (void)_adjustBackgroundWindowLevel
{
  __int128 v2;
  uint64_t v4;
  double v5;
  void *v6;
  void *v7;
  unint64_t v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  __int128 v20;
  uint8_t buf[4];
  double v22;
  __int16 v23;
  uint64_t v24;

  v4 = 0;
  v5 = 0.0;
  *(_QWORD *)&v2 = 138412546;
  v20 = v2;
  do
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CBWindowManager layers](self, "layers", v20));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndex:", v4));

    if (objc_msgSend(v7, "count"))
    {
      v8 = 0;
      do
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndex:", v8));
        if (objc_msgSend(v9, "backgroundTunnel"))
        {
          v10 = CheckerBoardLogHandleForCategory(2);
          v11 = objc_claimAutoreleasedReturnValue(v10);
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v9, "windowLevel");
            *(_DWORD *)buf = v20;
            v22 = *(double *)&v9;
            v23 = 2048;
            v24 = v12;
            _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Examining %@ for background leveling: %f", buf, 0x16u);
          }

          objc_msgSend(v9, "windowLevel");
          v5 = v13 + -1.0;
        }

        ++v8;
      }
      while (v8 < (unint64_t)objc_msgSend(v7, "count"));
    }

    ++v4;
  }
  while (v4 != 3);
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[CBWindowManager backgroundWindow](self, "backgroundWindow"));
  objc_msgSend(v14, "windowLevel");
  v16 = v15;

  if (v16 != v5)
  {
    v17 = CheckerBoardLogHandleForCategory(2);
    v18 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v22 = v5;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Setting background to level %f.", buf, 0xCu);
    }

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[CBWindowManager backgroundWindow](self, "backgroundWindow"));
    objc_msgSend(v19, "setWindowLevel:", v5);

  }
}

- (CBRecordingIndicatorManager)rootWindowRecordingIndicatorManager
{
  return self->_rootWindowRecordingIndicatorManager;
}

- (CBWindow)backgroundWindow
{
  return self->_backgroundWindow;
}

- (void)setBackgroundWindow:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundWindow, a3);
}

- (NSArray)layers
{
  return self->_layers;
}

- (void)setLayers:(id)a3
{
  objc_storeStrong((id *)&self->_layers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layers, 0);
  objc_storeStrong((id *)&self->_backgroundWindow, 0);
  objc_storeStrong((id *)&self->_rootWindowRecordingIndicatorManager, 0);
}

@end
