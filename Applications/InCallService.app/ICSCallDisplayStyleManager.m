@implementation ICSCallDisplayStyleManager

- (ICSCallDisplayStyleManager)init
{
  ICSCallDisplayStyleManager *v2;
  id v3;
  _QWORD v5[4];
  id v6;
  id location;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)ICSCallDisplayStyleManager;
  v2 = -[ICSCallDisplayStyleManager init](&v8, "init");
  if (v2)
  {
    objc_initWeak(&location, v2);
    v3 = &_dispatch_main_q;
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_1000462E4;
    v5[3] = &unk_1002851E0;
    objc_copyWeak(&v6, &location);
    notify_register_dispatch("ToggleCleethorpes", &v2->_toggleCleethorpesNotificationToken, (dispatch_queue_t)&_dispatch_main_q, v5);

    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  notify_cancel(-[ICSCallDisplayStyleManager toggleCleethorpesNotificationToken](self, "toggleCleethorpesNotificationToken"));
  v3.receiver = self;
  v3.super_class = (Class)ICSCallDisplayStyleManager;
  -[ICSCallDisplayStyleManager dealloc](&v3, "dealloc");
}

- (void)setCallDisplayStyle:(int64_t)a3
{
  id v5;
  NSObject *v6;
  int64_t callDisplayStyle;
  void *v8;
  int v9;
  int64_t v10;

  if (self->_callDisplayStyle != a3)
  {
    v5 = sub_1000C5588();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 134217984;
      v10 = a3;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Call display style changed: %ld", (uint8_t *)&v9, 0xCu);
    }

    callDisplayStyle = self->_callDisplayStyle;
    self->_callDisplayStyle = a3;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICSCallDisplayStyleManager rootViewController](self, "rootViewController"));
    +[ICSCallDisplayStyleManager notifyAllRespondersForViewController:callDisplayStyleDidChangeFromStyle:toStyle:](ICSCallDisplayStyleManager, "notifyAllRespondersForViewController:callDisplayStyleDidChangeFromStyle:toStyle:", v8, callDisplayStyle, a3);

  }
}

- (void)updateMiniWindowCutoutFrame:(CGRect)a3 attachedToWindowedAccessory:(BOOL)a4
{
  _BOOL8 v4;

  v4 = a4;
  -[ICSCallDisplayStyleManager setMiniWindowCutoutFrame:](self, "setMiniWindowCutoutFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[ICSCallDisplayStyleManager setAttachedToWindowedAccessory:](self, "setAttachedToWindowedAccessory:", v4);
}

+ (int64_t)callDisplayStyleToRequestForCurrentState
{
  void *v2;
  void *v3;
  _BOOL4 v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned int v8;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "incomingCall"));
  if (v3)
  {
    v4 = 1;
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "incomingVideoCall"));
    v4 = v6 != 0;

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[ICSPreferences sharedPreferences](ICSPreferences, "sharedPreferences"));
  v8 = objc_msgSend(v7, "hasBannersEnabled");

  if ((v8 & v4) != 0)
    return 0;
  else
    return 2;
}

+ (void)notifyAllRespondersForViewController:(id)a3 callDisplayStyleDidChangeFromStyle:(int64_t)a4 toStyle:(int64_t)a5
{
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[ICSCallDisplayStyleManager allSubviewsAndChildViewControllersForRootViewController:](ICSCallDisplayStyleManager, "allSubviewsAndChildViewControllersForRootViewController:", a3));
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v12, "conformsToProtocol:", &OBJC_PROTOCOL___ICSCallDisplayStyleHandler))
          objc_msgSend(v12, "callDisplayStyleDidChangeFromStyle:toStyle:", a4, a5);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v9);
  }

}

+ (id)allSubviewsAndChildViewControllersForRootViewController:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "view"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[ICSCallDisplayStyleManager allSubviewsOfView:](ICSCallDisplayStyleManager, "allSubviewsOfView:", v4));

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[ICSCallDisplayStyleManager allChildViewControllersOfViewController:](ICSCallDisplayStyleManager, "allChildViewControllersOfViewController:", v3));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "arrayByAddingObjectsFromArray:", v6));

  return v7;
}

+ (id)allSubviewsOfView:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v5 = v4;
  if (v3)
  {
    objc_msgSend(v4, "addObject:", v3);
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "subviews", 0));
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v15;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v15 != v9)
            objc_enumerationMutation(v6);
          v11 = (void *)objc_claimAutoreleasedReturnValue(+[ICSCallDisplayStyleManager allSubviewsOfView:](ICSCallDisplayStyleManager, "allSubviewsOfView:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)v10)));
          objc_msgSend(v5, "addObjectsFromArray:", v11);

          v10 = (char *)v10 + 1;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v8);
    }

  }
  v12 = objc_msgSend(v5, "copy");

  return v12;
}

+ (id)allChildViewControllersOfViewController:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[PHInCallUIUtilities handleNavigationControllerIfNecessary:](PHInCallUIUtilities, "handleNavigationControllerIfNecessary:", v3));

  if (v5)
  {
    objc_msgSend(v4, "addObject:", v5);
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "childViewControllers", 0));
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v15;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v15 != v9)
            objc_enumerationMutation(v6);
          v11 = (void *)objc_claimAutoreleasedReturnValue(+[ICSCallDisplayStyleManager allChildViewControllersOfViewController:](ICSCallDisplayStyleManager, "allChildViewControllersOfViewController:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)v10)));
          objc_msgSend(v4, "addObjectsFromArray:", v11);

          v10 = (char *)v10 + 1;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v8);
    }

  }
  v12 = objc_msgSend(v4, "copy");

  return v12;
}

- (int64_t)callDisplayStyle
{
  return self->_callDisplayStyle;
}

- (UIViewController)rootViewController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_rootViewController);
}

- (void)setRootViewController:(id)a3
{
  objc_storeWeak((id *)&self->_rootViewController, a3);
}

- (NSString)sceneSessionIdentifier
{
  return self->_sceneSessionIdentifier;
}

- (void)setSceneSessionIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (BOOL)attachedToWindowedAccessory
{
  return self->_attachedToWindowedAccessory;
}

- (void)setAttachedToWindowedAccessory:(BOOL)a3
{
  self->_attachedToWindowedAccessory = a3;
}

- (CGRect)miniWindowCutoutFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_miniWindowCutoutFrame.origin.x;
  y = self->_miniWindowCutoutFrame.origin.y;
  width = self->_miniWindowCutoutFrame.size.width;
  height = self->_miniWindowCutoutFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setMiniWindowCutoutFrame:(CGRect)a3
{
  self->_miniWindowCutoutFrame = a3;
}

- (unint64_t)sceneType
{
  return self->_sceneType;
}

- (void)setSceneType:(unint64_t)a3
{
  self->_sceneType = a3;
}

- (int)toggleCleethorpesNotificationToken
{
  return self->_toggleCleethorpesNotificationToken;
}

- (void)setToggleCleethorpesNotificationToken:(int)a3
{
  self->_toggleCleethorpesNotificationToken = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sceneSessionIdentifier, 0);
  objc_destroyWeak((id *)&self->_rootViewController);
}

@end
