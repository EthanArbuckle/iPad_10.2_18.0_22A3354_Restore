@implementation LUIUIUpdateSupport

+ (int64_t)defaultBackgroundStyle
{
  return 1;
}

+ (int64_t)blurBackgroundStyle
{
  return 6;
}

+ (LUIUIUpdateSupport)sharedInstance
{
  if (qword_100088D58 != -1)
    dispatch_once(&qword_100088D58, &stru_100069038);
  return (LUIUIUpdateSupport *)(id)qword_100088D50;
}

- (LUIUIUpdateSupport)init
{
  LUIUIUpdateSupport *v2;
  LUIUIUpdateSupport *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)LUIUIUpdateSupport;
  v2 = -[LUIUIUpdateSupport init](&v5, "init");
  v3 = v2;
  if (v2)
    -[LUIUIUpdateSupport _setup](v2, "_setup");
  return v3;
}

- (void)_setup
{
  NSMutableSet *v3;
  NSMutableSet *disableUIUpdatesReasons;
  NSMutableSet *v5;
  NSMutableSet *disableUserInteractionReasons;
  NSMutableSet *v7;
  NSMutableSet *wifiPickerSuppressionReasons;
  NSString *statusBarUserName;

  v3 = objc_opt_new(NSMutableSet);
  disableUIUpdatesReasons = self->_disableUIUpdatesReasons;
  self->_disableUIUpdatesReasons = v3;

  self->_uiUpdatePending = 0;
  v5 = objc_opt_new(NSMutableSet);
  disableUserInteractionReasons = self->_disableUserInteractionReasons;
  self->_disableUserInteractionReasons = v5;

  v7 = objc_opt_new(NSMutableSet);
  wifiPickerSuppressionReasons = self->_wifiPickerSuppressionReasons;
  self->_wifiPickerSuppressionReasons = v7;

  self->_isRotationEnabled = 1;
  statusBarUserName = self->_statusBarUserName;
  self->_statusBarUserName = 0;

  self->_isIdleTimerModeLocked = 0;
}

- (void)setViewControllerStackAnimated:(BOOL)a3 deferrable:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL8 v5;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  int v20;
  void *v21;

  v4 = a4;
  v5 = a3;
  v7 = qword_100088F38;
  if (os_log_type_enabled((os_log_t)qword_100088F38, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v20) = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Calling set view controller...", (uint8_t *)&v20, 2u);
  }
  if (v4 && -[LUIUIUpdateSupport isViewUpdateDisabled](self, "isViewUpdateDisabled"))
  {
    v8 = (void *)qword_100088F38;
    if (os_log_type_enabled((os_log_t)qword_100088F38, OS_LOG_TYPE_DEFAULT))
    {
      v9 = v8;
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[LUIUIUpdateSupport disableUIUpdatesReasons](self, "disableUIUpdatesReasons"));
      v20 = 138412290;
      v21 = v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Deferring UI update for reasons: %@", (uint8_t *)&v20, 0xCu);

    }
    -[LUIUIUpdateSupport setUiUpdatePending:](self, "setUiUpdatePending:", 1);
  }
  else
  {
    -[LUIUIUpdateSupport setUiUpdatePending:](self, "setUiUpdatePending:", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[LUISetupController sharedController](LUISetupController, "sharedController"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "viewControllerStack"));

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "delegate"));

    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "navigationController"));
    objc_msgSend(v15, "setViewControllers:animated:", v12, v5);
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[LUISetupController sharedController](LUISetupController, "sharedController"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "alertForPossibleLogoutError"));

    if (v17)
    {
      v18 = qword_100088F38;
      if (os_log_type_enabled((os_log_t)qword_100088F38, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v20) = 0;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Presenting an alert for logout error", (uint8_t *)&v20, 2u);
      }
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "topViewController"));
      objc_msgSend(v19, "presentViewController:animated:completion:", v17, 1, 0);

    }
  }
}

- (BOOL)presentUserLimitIsReachedAlertIfNeeded
{
  unsigned __int8 v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  uint8_t v11[16];

  v2 = +[LKLoginSupport isNewUserAbleToLogin](LKLoginSupport, "isNewUserAbleToLogin");
  if ((v2 & 1) == 0)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[LUISetupController sharedController](LUISetupController, "sharedController"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "alertForUserLimitReached"));

    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "delegate"));

    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "navigationController"));
    v8 = qword_100088F38;
    if (os_log_type_enabled((os_log_t)qword_100088F38, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Presenting an alert for user limit reached", v11, 2u);
    }
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "topViewController"));
    objc_msgSend(v9, "presentViewController:animated:completion:", v4, 1, 0);

  }
  return v2 ^ 1;
}

- (BOOL)isViewUpdateDisabled
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[LUIUIUpdateSupport disableUIUpdatesReasons](self, "disableUIUpdatesReasons"));
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (void)beginDisablingViewUpdatesForReason:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;

  if (a3)
  {
    v4 = a3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[LUIUIUpdateSupport disableUIUpdatesReasons](self, "disableUIUpdatesReasons"));
    objc_msgSend(v5, "addObject:", v4);

    v6 = (void *)qword_100088F38;
    if (os_log_type_enabled((os_log_t)qword_100088F38, OS_LOG_TYPE_DEFAULT))
    {
      v7 = v6;
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[LUIUIUpdateSupport disableUIUpdatesReasons](self, "disableUIUpdatesReasons"));
      v9 = 138412290;
      v10 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "View updates disabled for reasons: %@", (uint8_t *)&v9, 0xCu);

    }
  }
}

- (void)endDisablingViewUpdatesForReason:(id)a3
{
  id v4;
  void *v5;
  unsigned int v6;
  NSObject *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  int v13;
  id v14;

  v4 = a3;
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[LUIUIUpdateSupport disableUIUpdatesReasons](self, "disableUIUpdatesReasons"));
    v6 = objc_msgSend(v5, "containsObject:", v4);

    if (v6)
    {
      v7 = qword_100088F38;
      if (os_log_type_enabled((os_log_t)qword_100088F38, OS_LOG_TYPE_DEFAULT))
      {
        v13 = 138412290;
        v14 = v4;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Removing reason to disable view updates: %@", (uint8_t *)&v13, 0xCu);
      }
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[LUIUIUpdateSupport disableUIUpdatesReasons](self, "disableUIUpdatesReasons"));
      objc_msgSend(v8, "removeObject:", v4);

      if (-[LUIUIUpdateSupport isViewUpdateDisabled](self, "isViewUpdateDisabled"))
      {
        v9 = (void *)qword_100088F38;
        if (os_log_type_enabled((os_log_t)qword_100088F38, OS_LOG_TYPE_DEFAULT))
        {
          v10 = v9;
          v11 = (void *)objc_claimAutoreleasedReturnValue(-[LUIUIUpdateSupport disableUIUpdatesReasons](self, "disableUIUpdatesReasons"));
          v13 = 138412290;
          v14 = v11;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "View updates still disabled for reasons: %@", (uint8_t *)&v13, 0xCu);

        }
      }
      else if (-[LUIUIUpdateSupport uiUpdatePending](self, "uiUpdatePending"))
      {
        v12 = qword_100088F38;
        if (os_log_type_enabled((os_log_t)qword_100088F38, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v13) = 0;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Performing deferred UI update", (uint8_t *)&v13, 2u);
        }
        -[LUIUIUpdateSupport setUiUpdatePending:](self, "setUiUpdatePending:", 0);
        -[LUIUIUpdateSupport setViewControllerStackAnimated:deferrable:](self, "setViewControllerStackAnimated:deferrable:", 1, 1);
      }
    }
  }

}

- (BOOL)isWiFiPickerSuppressed
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[LUIUIUpdateSupport wifiPickerSuppressionReasons](self, "wifiPickerSuppressionReasons"));
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (void)beginSuppressingWiFiPickerForReason:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  if (a3)
  {
    v4 = a3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[LUIUIUpdateSupport wifiPickerSuppressionReasons](self, "wifiPickerSuppressionReasons"));
    objc_msgSend(v5, "addObject:", v4);

    v6 = (void *)qword_100088F18;
    if (os_log_type_enabled((os_log_t)qword_100088F18, OS_LOG_TYPE_DEBUG))
      sub_10003B428(v6, self);
  }
}

- (void)endSuppressingWiFiPickerForReason:(id)a3
{
  id v4;
  void *v5;
  unsigned int v6;
  void *v7;
  void *v8;

  v4 = a3;
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[LUIUIUpdateSupport wifiPickerSuppressionReasons](self, "wifiPickerSuppressionReasons"));
    v6 = objc_msgSend(v5, "containsObject:", v4);

    if (v6)
    {
      if (os_log_type_enabled((os_log_t)qword_100088F18, OS_LOG_TYPE_DEBUG))
        sub_10003B538();
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[LUIUIUpdateSupport wifiPickerSuppressionReasons](self, "wifiPickerSuppressionReasons"));
      objc_msgSend(v7, "removeObject:", v4);

      if (-[LUIUIUpdateSupport isWiFiPickerSuppressed](self, "isWiFiPickerSuppressed"))
      {
        v8 = (void *)qword_100088F18;
        if (os_log_type_enabled((os_log_t)qword_100088F18, OS_LOG_TYPE_DEBUG))
          sub_10003B4B0(v8, self);
      }
    }
  }

}

- (BOOL)isUserInteractionDisabled
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[LUIUIUpdateSupport disableUserInteractionReasons](self, "disableUserInteractionReasons"));
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (void)disableUserInteractionForReason:(id)a3
{
  id v3;
  _QWORD v4[5];
  id v5;

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10000EB7C;
  v4[3] = &unk_100068C30;
  v4[4] = self;
  v5 = a3;
  v3 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v4);

}

- (void)_synchronouslyDisableUserInteractionForReason:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  int v12;
  void *v13;

  if (a3)
  {
    v4 = a3;
    if (!-[LUIUIUpdateSupport isUserInteractionDisabled](self, "isUserInteractionDisabled"))
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "delegate"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "window"));
      objc_msgSend(v7, "setUserInteractionEnabled:", 0);

    }
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[LUIUIUpdateSupport disableUserInteractionReasons](self, "disableUserInteractionReasons"));
    objc_msgSend(v8, "addObject:", v4);

    v9 = (void *)qword_100088F38;
    if (os_log_type_enabled((os_log_t)qword_100088F38, OS_LOG_TYPE_DEFAULT))
    {
      v10 = v9;
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[LUIUIUpdateSupport disableUserInteractionReasons](self, "disableUserInteractionReasons"));
      v12 = 138412290;
      v13 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "User interaction disabled for reasons: %@", (uint8_t *)&v12, 0xCu);

    }
  }
}

- (void)reenableUserInteractionForReason:(id)a3
{
  id v3;
  _QWORD v4[5];
  id v5;

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10000ED4C;
  v4[3] = &unk_100068C30;
  v4[4] = self;
  v5 = a3;
  v3 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v4);

}

- (void)_synchronouslyReenableUserInteractionForReason:(id)a3
{
  id v4;
  void *v5;
  unsigned int v6;
  NSObject *v7;
  void *v8;
  unsigned int v9;
  NSObject *v10;
  _BOOL4 v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  id v18;

  v4 = a3;
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[LUIUIUpdateSupport disableUserInteractionReasons](self, "disableUserInteractionReasons"));
    v6 = objc_msgSend(v5, "containsObject:", v4);

    if (v6)
    {
      v7 = qword_100088F38;
      if (os_log_type_enabled((os_log_t)qword_100088F38, OS_LOG_TYPE_DEFAULT))
      {
        v17 = 138412290;
        v18 = v4;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Removing reason to disable user interaction: %@", (uint8_t *)&v17, 0xCu);
      }
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[LUIUIUpdateSupport disableUserInteractionReasons](self, "disableUserInteractionReasons"));
      objc_msgSend(v8, "removeObject:", v4);

      v9 = -[LUIUIUpdateSupport isUserInteractionDisabled](self, "isUserInteractionDisabled");
      v10 = qword_100088F38;
      v11 = os_log_type_enabled((os_log_t)qword_100088F38, OS_LOG_TYPE_DEFAULT);
      if (v9)
      {
        if (v11)
        {
          v12 = v10;
          v13 = (void *)objc_claimAutoreleasedReturnValue(-[LUIUIUpdateSupport disableUserInteractionReasons](self, "disableUserInteractionReasons"));
          v17 = 138412290;
          v18 = v13;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "User interaction still disabled for reasons: %@", (uint8_t *)&v17, 0xCu);

        }
      }
      else
      {
        if (v11)
        {
          LOWORD(v17) = 0;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Enabling user interaction", (uint8_t *)&v17, 2u);
        }
        v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "delegate"));
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "window"));
        objc_msgSend(v16, "setUserInteractionEnabled:", 1);

      }
    }
  }

}

- (id)navigationController:(id)a3 animationControllerForOperation:(int64_t)a4 fromViewController:(id)a5 toViewController:(id)a6
{
  id v8;
  id v9;
  uint64_t v10;
  char isKindOfClass;
  LUIFadeOutFadeInTransition *v12;
  id v13;
  LUIFadeOutFadeInTransition *v14;
  uint64_t v15;
  uint64_t v16;
  LUIFadeOutFadeInTransition *v17;
  LUICrossFadeAnimationTransition *v18;
  LUICrossFadeAnimationTransition *v19;

  v8 = a5;
  v9 = a6;
  v10 = objc_opt_class(LUIGettingReadyViewController);
  isKindOfClass = objc_opt_isKindOfClass(v9, v10);

  if ((isKindOfClass & 1) != 0)
  {
    v12 = [LUIFadeOutFadeInTransition alloc];
    v13 = objc_msgSend((id)objc_opt_class(self), "blurBackgroundStyle");
    v14 = v12;
    v15 = 1;
  }
  else
  {
    v16 = objc_opt_class(LUIGettingReadyViewController);
    if ((objc_opt_isKindOfClass(v8, v16) & 1) == 0)
    {
      v18 = objc_opt_new(LUICrossFadeAnimationTransition);
      goto LABEL_7;
    }
    v17 = [LUIFadeOutFadeInTransition alloc];
    v13 = objc_msgSend((id)objc_opt_class(self), "defaultBackgroundStyle");
    v14 = v17;
    v15 = 0;
  }
  v18 = -[LUIFadeOutFadeInTransition initWithWallpaperVariant:backgroundStyle:](v14, "initWithWallpaperVariant:backgroundStyle:", v15, v13);
LABEL_7:
  v19 = v18;

  return v19;
}

- (void)navigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  unsigned int v15;
  const __CFString *v16;
  uint64_t v17;
  unsigned int v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  char v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  _QWORD v34[5];
  char v35;
  char v36;
  uint8_t buf[4];
  const __CFString *v38;

  v7 = a3;
  v8 = a4;
  if ((objc_opt_respondsToSelector(v8, "userForStatusBarDisplay") & 1) != 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "userForStatusBarDisplay"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "displayName"));

  }
  else
  {
    v10 = 0;
  }
  if ((objc_opt_respondsToSelector(v8, "shouldSetIdleTimerAsIfLocked") & 1) != 0)
    v11 = objc_msgSend(v8, "shouldSetIdleTimerAsIfLocked");
  else
    v11 = 0;
  if ((objc_opt_respondsToSelector(v8, "shouldAutorotate") & 1) != 0)
    v12 = (uint64_t)objc_msgSend(v8, "shouldAutorotate");
  else
    v12 = 1;
  if ((objc_opt_respondsToSelector(v8, "shouldAllowUIUpdate") & 1) != 0)
  {
    v13 = (void *)qword_100088F38;
    if (os_log_type_enabled((os_log_t)qword_100088F38, OS_LOG_TYPE_DEFAULT))
    {
      v14 = v13;
      v15 = objc_msgSend(v8, "shouldAllowUIUpdate");
      v16 = CFSTR("NO");
      if (v15)
        v16 = CFSTR("YES");
      *(_DWORD *)buf = 138412290;
      v38 = v16;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "shouldAllowUIUpdate: %@", buf, 0xCu);

    }
    v17 = (uint64_t)objc_msgSend(v8, "shouldAllowUIUpdate");
  }
  else
  {
    v17 = 1;
  }
  if ((objc_opt_respondsToSelector(v8, "suppressesWiFiPicker") & 1) != 0)
    v18 = objc_msgSend(v8, "suppressesWiFiPicker");
  else
    v18 = 0;
  if ((_DWORD)v17)
    -[LUIUIUpdateSupport endDisablingViewUpdatesForReason:](self, "endDisablingViewUpdatesForReason:", CFSTR("View Controller"));
  else
    -[LUIUIUpdateSupport beginDisablingViewUpdatesForReason:](self, "beginDisablingViewUpdatesForReason:", CFSTR("View Controller"));
  if (v18)
  {
    -[LUIUIUpdateSupport beginSuppressingWiFiPickerForReason:](self, "beginSuppressingWiFiPickerForReason:", CFSTR("View controller"));
    if (v10)
      goto LABEL_28;
  }
  else
  {
    -[LUIUIUpdateSupport endSuppressingWiFiPickerForReason:](self, "endSuppressingWiFiPickerForReason:", CFSTR("View controller"));
    if (v10)
      goto LABEL_28;
  }
  v17 = objc_claimAutoreleasedReturnValue(-[LUIUIUpdateSupport statusBarUserName](self, "statusBarUserName"));
  if (!v17)
  {
    if ((_DWORD)v11 != -[LUIUIUpdateSupport isIdleTimerModeLocked](self, "isIdleTimerModeLocked")
      || (_DWORD)v12 != -[LUIUIUpdateSupport isRotationEnabled](self, "isRotationEnabled"))
    {
      goto LABEL_39;
    }
    goto LABEL_40;
  }
LABEL_28:
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[LUIUIUpdateSupport statusBarUserName](self, "statusBarUserName"));
  if (objc_msgSend(v10, "isEqualToString:", v19)
    && (_DWORD)v11 == -[LUIUIUpdateSupport isIdleTimerModeLocked](self, "isIdleTimerModeLocked"))
  {
    v20 = v12 ^ -[LUIUIUpdateSupport isRotationEnabled](self, "isRotationEnabled");
  }
  else
  {
    v20 = 1;
  }

  if (v10)
  {
    if (!v20)
      goto LABEL_40;
LABEL_39:
    -[LUIUIUpdateSupport setStatusBarUserName:](self, "setStatusBarUserName:", v10);
    -[LUIUIUpdateSupport setIsIdleTimerModeLocked:](self, "setIsIdleTimerModeLocked:", v11);
    -[LUIUIUpdateSupport setIsRotationEnabled:](self, "setIsRotationEnabled:", v12);
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "delegate"));
    v33 = v10;
    v23 = v12;
    v24 = v7;
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "window"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "windowScene"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "_FBSScene"));

    v7 = v24;
    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472;
    v34[2] = sub_10000F4CC;
    v34[3] = &unk_100069060;
    v35 = (char)v11;
    v34[4] = self;
    v36 = v23;
    v10 = v33;
    objc_msgSend(v27, "updateClientSettingsWithBlock:", v34);

    goto LABEL_40;
  }

  if ((v20 & 1) != 0)
    goto LABEL_39;
LABEL_40:
  if (objc_msgSend(v8, "conformsToProtocol:", &OBJC_PROTOCOL___LUIRecentUsersViewing))
  {
    v28 = qword_100088F38;
    if (os_log_type_enabled((os_log_t)qword_100088F38, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Flag the recent user view controller if needed...", buf, 2u);
    }
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[LUISetupController sharedController](LUISetupController, "sharedController"));
    objc_msgSend(v29, "addRecentUsersViewController:", v8);

  }
  if (objc_msgSend(v7, "lastOperation") == (id)2)
  {
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "disappearingViewController"));
    if (objc_msgSend(v30, "conformsToProtocol:", &OBJC_PROTOCOL___LUIRecentUsersViewing))
    {
      v31 = qword_100088F38;
      if (os_log_type_enabled((os_log_t)qword_100088F38, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "Unflag the recent user view controller if needed...", buf, 2u);
      }
      v32 = (void *)objc_claimAutoreleasedReturnValue(+[LUISetupController sharedController](LUISetupController, "sharedController"));
      objc_msgSend(v32, "removeRecentUsersViewController:", v30);

    }
  }

}

- (NSString)statusBarUserName
{
  return self->_statusBarUserName;
}

- (void)setStatusBarUserName:(id)a3
{
  objc_storeStrong((id *)&self->_statusBarUserName, a3);
}

- (BOOL)isIdleTimerModeLocked
{
  return self->_isIdleTimerModeLocked;
}

- (void)setIsIdleTimerModeLocked:(BOOL)a3
{
  self->_isIdleTimerModeLocked = a3;
}

- (BOOL)isRotationEnabled
{
  return self->_isRotationEnabled;
}

- (void)setIsRotationEnabled:(BOOL)a3
{
  self->_isRotationEnabled = a3;
}

- (NSMutableSet)disableUIUpdatesReasons
{
  return self->_disableUIUpdatesReasons;
}

- (void)setDisableUIUpdatesReasons:(id)a3
{
  objc_storeStrong((id *)&self->_disableUIUpdatesReasons, a3);
}

- (BOOL)uiUpdatePending
{
  return self->_uiUpdatePending;
}

- (void)setUiUpdatePending:(BOOL)a3
{
  self->_uiUpdatePending = a3;
}

- (NSMutableSet)disableUserInteractionReasons
{
  return self->_disableUserInteractionReasons;
}

- (void)setDisableUserInteractionReasons:(id)a3
{
  objc_storeStrong((id *)&self->_disableUserInteractionReasons, a3);
}

- (NSMutableSet)wifiPickerSuppressionReasons
{
  return self->_wifiPickerSuppressionReasons;
}

- (void)setWifiPickerSuppressionReasons:(id)a3
{
  objc_storeStrong((id *)&self->_wifiPickerSuppressionReasons, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wifiPickerSuppressionReasons, 0);
  objc_storeStrong((id *)&self->_disableUserInteractionReasons, 0);
  objc_storeStrong((id *)&self->_disableUIUpdatesReasons, 0);
  objc_storeStrong((id *)&self->_statusBarUserName, 0);
}

+ (void)reset
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(+[LUIUIUpdateSupport sharedInstance](LUIUIUpdateSupport, "sharedInstance"));
  objc_msgSend(v2, "_setup");

}

@end
