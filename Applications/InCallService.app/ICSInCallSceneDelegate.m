@implementation ICSInCallSceneDelegate

- (ICSInCallSceneDelegate)init
{
  ICSInCallSceneDelegate *v2;
  uint64_t v3;
  CNKFeatures *features;
  id v5;
  ICSDynamicSystemUIPresentationStyleHandler *v6;
  ICSInCallScenePresentationStyleHandler *greenTea3PPresentationStyleHandler;
  ICSGreenTea3PUIHardwareEventHandler *v8;
  ICSGreenTea3PUIHardwareEventHandler *greenTea3PUIHardwareEventHandler;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)ICSInCallSceneDelegate;
  v2 = -[ICSInCallSceneDelegate init](&v11, "init");
  if (v2)
  {
    v3 = objc_claimAutoreleasedReturnValue(+[CNKFeatures sharedInstance](CNKFeatures, "sharedInstance"));
    features = v2->_features;
    v2->_features = (CNKFeatures *)v3;

    v5 = objc_alloc_init((Class)TUFeatureFlags);
    if (objc_msgSend(v5, "groupConversations") && TUDeviceHasChinaSKU())
    {
      v6 = objc_alloc_init(ICSDynamicSystemUIPresentationStyleHandler);
      greenTea3PPresentationStyleHandler = v2->_greenTea3PPresentationStyleHandler;
      v2->_greenTea3PPresentationStyleHandler = (ICSInCallScenePresentationStyleHandler *)v6;

      v8 = objc_alloc_init(ICSGreenTea3PUIHardwareEventHandler);
      greenTea3PUIHardwareEventHandler = v2->_greenTea3PUIHardwareEventHandler;
      v2->_greenTea3PUIHardwareEventHandler = v8;

    }
  }
  return v2;
}

- (BOOL)isDeviceAttachedToWindowedAccessory
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "delegate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "currentInCallScene"));
  LOBYTE(self) = -[ICSInCallSceneDelegate isDeviceAttachedToWindowedAccessoryForScene:](self, "isDeviceAttachedToWindowedAccessoryForScene:", v5);

  return (char)self;
}

- (BOOL)isDeviceAttachedToWindowedAccessoryForScene:(id)a3
{
  id v4;
  _BOOL4 v5;
  CGRect v7;

  v4 = a3;
  -[ICSInCallSceneDelegate deviceWindowedAccessoryCutoutFrameForScene:](self, "deviceWindowedAccessoryCutoutFrameForScene:", v4);
  v5 = !CGRectIsEmpty(v7);
  if ((objc_opt_respondsToSelector(v4, "isDeviceAttachedToWindowedAccessory") & 1) != 0
    && !objc_msgSend(v4, "performSelector:", "isDeviceAttachedToWindowedAccessory"))
  {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (CGRect)deviceWindowedAccessoryCutoutFrame
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGRect result;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "delegate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "currentInCallScene"));
  -[ICSInCallSceneDelegate deviceWindowedAccessoryCutoutFrameForScene:](self, "deviceWindowedAccessoryCutoutFrameForScene:", v5);
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  v14 = v7;
  v15 = v9;
  v16 = v11;
  v17 = v13;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (CGRect)deviceWindowedAccessoryCutoutFrameForScene:(id)a3
{
  id v3;
  void *v4;
  double v5;
  CGFloat x;
  double v7;
  CGFloat y;
  double v9;
  CGFloat width;
  double v11;
  CGFloat height;
  double v13;
  double v14;
  double v15;
  double v16;
  CGRect result;

  v3 = a3;
  if ((objc_opt_respondsToSelector(v3, "windowedAccessoryCutoutFrameInScreen") & 1) != 0)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "valueForKey:", CFSTR("windowedAccessoryCutoutFrameInScreen")));
    objc_msgSend(v4, "CGRectValue");
    x = v5;
    y = v7;
    width = v9;
    height = v11;

  }
  else
  {
    x = CGRectZero.origin.x;
    y = CGRectZero.origin.y;
    width = CGRectZero.size.width;
    height = CGRectZero.size.height;
  }

  v13 = x;
  v14 = y;
  v15 = width;
  v16 = height;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (CGRect)windowedAccessoryCutoutFrameInScreen
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = CGRectZero.origin.x;
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (BOOL)isAttachedToWindowedAccessoryWithValidFrameForCurrentScene
{
  return -[ICSInCallSceneDelegate isDeviceAttachedToWindowedAccessory](self, "isDeviceAttachedToWindowedAccessory");
}

- (void)inCallWindowScene:(id)a3 didReceiveHardwareButtonEvents:(id)a4
{
  id v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICSInCallSceneDelegate remoteAlertShellViewControllerForWindowScene:](self, "remoteAlertShellViewControllerForWindowScene:", a3));
  if (objc_msgSend(v7, "conformsToProtocol:", &OBJC_PROTOCOL___PHInCallHardwareButtonEventHandlerProtocol))
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v8 = v6;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v14;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v14 != v11)
            objc_enumerationMutation(v8);
          -[ICSInCallSceneDelegate handleHardwareButtonEvent:eventHandler:](self, "handleHardwareButtonEvent:eventHandler:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)v12), v7, (_QWORD)v13);
          v12 = (char *)v12 + 1;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v10);
    }

  }
}

- (void)inCallWindowScene:(id)a3 didReceiveDeviceLockEvent:(id)a4 withResultHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  _QWORD *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  uint8_t v18[8];
  _QWORD v19[4];
  id v20;

  v8 = a3;
  v9 = a4;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10006FB0C;
  v19[3] = &unk_100285AC8;
  v10 = a5;
  v20 = v10;
  v11 = objc_retainBlock(v19);
  if (objc_msgSend(v8, "ics_sceneType") == (id)6
    && (v12 = (void *)objc_claimAutoreleasedReturnValue(-[ICSInCallSceneDelegate greenTea3PUIHardwareEventHandler](self, "greenTea3PUIHardwareEventHandler")), v12, v12))
  {
    v13 = sub_1000C56D8();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v18 = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Passing device lock event to GreenTea3P UI hardware event handler", v18, 2u);
    }
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[ICSInCallSceneDelegate greenTea3PUIHardwareEventHandler](self, "greenTea3PUIHardwareEventHandler"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[ICSInCallSceneDelegate callAnalyticsLogger](self, "callAnalyticsLogger"));
    objc_msgSend(v14, "handleDeviceLockEvent:resultHandler:callAnalyticsLogger:completionHandler:", v9, v10, v15, &stru_1002863E0);

  }
  else
  {
    v16 = sub_1000C56D8();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v18 = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Received user-initiated device lock event, handing it off to the root view controller to handle", v18, 2u);
    }
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[ICSInCallSceneDelegate remoteAlertShellViewControllerForWindowScene:](self, "remoteAlertShellViewControllerForWindowScene:", v8));
    if (v14)
    {
      objc_msgSend(v14, "handleDeviceLockEventWithSourceType:resultHandler:", objc_msgSend(v9, "sourceType"), v11);
    }
    else
    {
      v17 = sub_1000C56D8();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v18 = 0;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "PHInCallRemoteAlertShellViewController missing for windowScene", v18, 2u);
      }
      ((void (*)(_QWORD *, _QWORD))v11[2])(v11, 0);
    }
  }

}

- (void)inCallWindowScene:(id)a3 didChangePresentationModeWithAnalyticsSource:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  int64_t v22;
  void *v23;
  float Current;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  id v33;
  NSObject *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  NSObject *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  NSObject *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  id v55;
  uint8_t buf[4];
  id v57;
  __int16 v58;
  void *v59;

  v6 = a3;
  v55 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "session"));
  -[ICSInCallSceneDelegate _setupSceneIfNeeded:session:](self, "_setupSceneIfNeeded:session:", v6, v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICSInCallSceneDelegate remoteAlertShellViewControllerForWindowScene:](self, "remoteAlertShellViewControllerForWindowScene:", v6));
  v9 = sub_10000EF40((uint64_t)objc_msgSend(v6, "ics_sceneType"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v11 = sub_1000C56D8();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = v11;
    v13 = SBSInCallPresentationModeDescription(objc_msgSend(v6, "presentationMode"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    *(_DWORD *)buf = 138543618;
    v57 = v10;
    v58 = 2114;
    v59 = v14;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Scene of type '%{public}@' changed presentation mode to %{public}@", buf, 0x16u);

  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "callDisplayStyleManager"));
  v16 = objc_msgSend(v15, "callDisplayStyle");

  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "callDisplayStyleManager"));
  -[ICSInCallSceneDelegate deviceWindowedAccessoryCutoutFrameForScene:](self, "deviceWindowedAccessoryCutoutFrameForScene:", v6);
  objc_msgSend(v17, "updateMiniWindowCutoutFrame:attachedToWindowedAccessory:", -[ICSInCallSceneDelegate isDeviceAttachedToWindowedAccessoryForScene:](self, "isDeviceAttachedToWindowedAccessoryForScene:", v6), v18, v19, v20, v21);

  v22 = -[ICSInCallSceneDelegate callDisplayStyleForScene:](self, "callDisplayStyleForScene:", v6);
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "callDisplayStyleManager"));
  objc_msgSend(v23, "setCallDisplayStyle:", v22);

  Current = BKSDisplayBrightnessGetCurrent();
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "frontmostBargeCall"));

  if (v26
    && objc_msgSend(v26, "isPTT")
    && v22 == 4
    && Current > 0.0
    && (SBUIIsSystemApertureEnabled() & 1) == 0)
  {
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "delegate"));
    objc_msgSend(v28, "dismissPTTSessionPresentation");

  }
  v29 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "frontmostAudioOrVideoCall"));

  v54 = v30;
  v31 = objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "uniqueProxyIdentifierUUID"));
  if (!v16)
  {
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[ICSInCallSceneDelegate callAnalyticsLogger](self, "callAnalyticsLogger"));

    if (v32)
    {
      v33 = sub_1000C5588();
      v34 = objc_claimAutoreleasedReturnValue(v33);
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v57 = v55;
        _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "ICSCallAnalytics: analytcs source changed to %@", buf, 0xCu);
      }

      v35 = (void *)objc_claimAutoreleasedReturnValue(-[ICSInCallSceneDelegate callAnalyticsLogger](self, "callAnalyticsLogger"));
      objc_msgSend(v35, "setBannerDismissalReasonForAnalyticsSource:callUUID:", v55, v31);

    }
  }
  v36 = (void *)objc_claimAutoreleasedReturnValue(-[ICSInCallSceneDelegate callAnalyticsLogger](self, "callAnalyticsLogger"));
  v53 = (void *)v31;
  objc_msgSend(v36, "setPresentationMode:callUUID:", objc_msgSend(v6, "presentationMode"), v31);

  v37 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "delegate"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "sceneManager"));
  objc_msgSend(v39, "didUpdatePresentationMode:forScene:", objc_msgSend(v6, "presentationMode"), v6);

  v40 = objc_msgSend(v6, "presentationMode");
  v41 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "delegate"));
  v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "bannerPresentationManager"));
  v44 = v43;
  if (v40 == (id)2)
    objc_msgSend(v43, "didUpdatePresentationModeToFullScreen");
  else
    objc_msgSend(v43, "didUpdatePresentationModeToDismissed");

  -[ICSInCallSceneDelegate updateSceneBackgroundMaterialWith:](self, "updateSceneBackgroundMaterialWith:", v6);
  if (!-[CNKFeatures isIncomingCallBannerEnabled](self->_features, "isIncomingCallBannerEnabled")
    && v22 == 2)
  {
    v45 = sub_1000C55F8();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v57 = v10;
      _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "Requesting dismissal of presented banner since the ICS scene %{public}@ is now full screen", buf, 0xCu);
    }
    v46 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "delegate"));
    v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "bannerPresentationManager"));
    objc_msgSend(v48, "dismissPresentedBannerForReason:animated:", CFSTR("InCallService is presenting full screen"), 1);

  }
  v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "pipController"));
  if (objc_msgSend(v49, "isPipped") && v22 == 2)
  {
    v50 = sub_1000C56D8();
    if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v57 = v10;
      _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_DEFAULT, "Returning %{public}@ PiP to full screen since the associated scene is now full screen", buf, 0xCu);
    }
    objc_msgSend(v49, "manuallyStopPIPWithCompletion:", &stru_100286400);
  }
  v51 = (void *)objc_claimAutoreleasedReturnValue(-[ICSInCallSceneDelegate greenTea3PPresentationStyleHandler](self, "greenTea3PPresentationStyleHandler"));

  if (v51)
  {
    v52 = (void *)objc_claimAutoreleasedReturnValue(-[ICSInCallSceneDelegate greenTea3PPresentationStyleHandler](self, "greenTea3PPresentationStyleHandler"));
    objc_msgSend(v52, "handlePresentationModeChanged:scene:", objc_msgSend(v6, "presentationMode"), v6);

  }
}

- (void)inCallWindowScene:(id)a3 didTransitionToAttachedToWindowedAccessory:(BOOL)a4 windowedAccessoryCutoutFrameInScreen:(CGRect)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  _BOOL8 v9;
  id v11;
  NSObject *v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  NSString *v16;
  void *v17;
  void *v18;
  void *v19;
  int64_t v20;
  void *v21;
  int v22;
  void *v23;
  __int16 v24;
  void *v25;
  NSRect v26;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v9 = a4;
  v11 = a3;
  v12 = sub_1000C56D8();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = v12;
    v14 = NSStringFromBOOL(v9);
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    v26.origin.x = x;
    v26.origin.y = y;
    v26.size.width = width;
    v26.size.height = height;
    v16 = NSStringFromRect(v26);
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    v22 = 138543618;
    v23 = v15;
    v24 = 2114;
    v25 = v17;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "In-call scene did transition to device attached to windowed accessory: %{public}@ with frame: %{public}@", (uint8_t *)&v22, 0x16u);

  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[ICSInCallSceneDelegate remoteAlertShellViewControllerForWindowScene:](self, "remoteAlertShellViewControllerForWindowScene:", v11));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "callDisplayStyleManager"));
  -[ICSInCallSceneDelegate deviceWindowedAccessoryCutoutFrameForScene:](self, "deviceWindowedAccessoryCutoutFrameForScene:", v11);
  objc_msgSend(v19, "updateMiniWindowCutoutFrame:attachedToWindowedAccessory:", v9);

  v20 = -[ICSInCallSceneDelegate callDisplayStyleForScene:](self, "callDisplayStyleForScene:", v11);
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "callDisplayStyleManager"));
  objc_msgSend(v21, "setCallDisplayStyle:", v20);

}

- (void)inCallWindowSceneHandleShowingNoticeForRevealingSystemControls:(id)a3
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  uint8_t v7[16];

  v3 = sub_1000C55F8();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Landscape app has requested presentation of home affordance, showing session reminder notice", v7, 2u);
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "delegate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "bannerPresentationManager"));
  objc_msgSend(v6, "presentReminderNotice");

}

- (id)remoteAlertShellViewControllerForWindowScene:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[ICSInCallSceneDelegate windowSceneToWindowMap](self, "windowSceneToWindowMap"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v5, "objectForKey:", v4));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "rootViewController"));
  v9 = objc_opt_class(PHInCallRemoteAlertShellViewController, v8);
  LOBYTE(v5) = objc_opt_isKindOfClass(v7, v9);

  if ((v5 & 1) != 0)
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "rootViewController"));
  else
    v10 = 0;

  return v10;
}

- (id)inCallWindowSceneSystemApertureElementProvider:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  NSObject *v17;
  int v19;
  void *v20;
  __int16 v21;
  id v22;

  v4 = a3;
  if ((-[CNKFeatures isSystemApertureEnabled](self->_features, "isSystemApertureEnabled") & 1) != 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "delegate"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "bannerPresentationManager"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "makeSystemApertureElementProvider"));

    if ((objc_opt_respondsToSelector(v8, "systemApertureElementViewController") & 1) == 0)
    {
      v9 = sub_1000C56D8();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
        sub_1001A9604((uint64_t)v8, v9, v10, v11, v12, v13, v14, v15);
    }
    v16 = sub_1000C56D8();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v19 = 138412546;
      v20 = v8;
      v21 = 2112;
      v22 = v4;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Provided system aperture element %@ corresponding to scene %@", (uint8_t *)&v19, 0x16u);
    }
  }
  else
  {
    v17 = sub_1000C56D8();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
      sub_1001A9668(v17);
    v8 = 0;
  }

  return v8;
}

- (void)inCallWindowSceneHandleSilenceRingtone:(id)a3
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance", a3));
  v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "incomingCall"));
  if (v4)
  {
    v7 = (id)v4;

    v5 = v7;
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
    v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "incomingVideoCall"));

    v5 = v8;
    if (!v8)
      goto LABEL_7;
  }
  v9 = v5;
  if ((objc_msgSend(v5, "shouldSuppressRingtone") & 1) == 0)
    objc_msgSend(v9, "suppressRingtone");
  v5 = v9;
LABEL_7:

}

- (void)windowScene:(id)a3 didUpdateCoordinateSpace:(id)a4 interfaceOrientation:(int64_t)a5 traitCollection:(id)a6
{
  id v7;
  void *v8;
  void *v9;
  id v10;

  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICSInCallSceneDelegate windowSceneToWindowMap](self, "windowSceneToWindowMap"));
  v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", v7));

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "coordinateSpace"));
  objc_msgSend(v9, "bounds");
  objc_msgSend(v10, "setFrame:");

}

- (void)sceneDidBecomeActive:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "session"));
  -[ICSInCallSceneDelegate _setupSceneIfNeeded:session:](self, "_setupSceneIfNeeded:session:", v4, v5);

}

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v6;
  id v7;

  v6 = a3;
  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "session"));
  -[ICSInCallSceneDelegate _setupSceneIfNeeded:session:](self, "_setupSceneIfNeeded:session:", v6, v7);

}

- (void)_setupSceneIfNeeded:(id)a3 session:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  ICSSecureWindow *v20;
  void *v21;
  ICSCallAnalyticsLogger *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  NSObject *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  NSObject *v42;
  NSObject *v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  NSObject *v48;
  NSObject *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  ICSSecureWindow *v56;
  void *v57;
  uint64_t v58;
  uint64_t v59;
  id v60;
  void *v61;
  void *v62;
  NSObject *v63;
  NSObject *v64;
  const __CFString *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  NSObject *v72;
  const __CFString *v73;
  void *v74;
  void *v75;
  id v76;
  ICSSecureWindow *v77;
  uint8_t buf[4];
  id v79;
  __int16 v80;
  id v81;
  __int16 v82;
  uint64_t v83;

  v6 = a3;
  v7 = a4;
  if (!-[ICSInCallSceneDelegate hasSetupForScene](self, "hasSetupForScene"))
  {
    v8 = v6;
    if (objc_msgSend(v8, "activationState") != (id)-1
      || objc_msgSend(v8, "presentationMode")
      || (v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "requestedPresentationConfigurationIdentifier")),
          v9,
          v9))
    {
      -[ICSInCallSceneDelegate setHasSetupForScene:](self, "setHasSetupForScene:", 1);
      v10 = objc_msgSend(v8, "ics_sceneType");
      v11 = sub_1000C56D8();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v12 = v11;
        v13 = sub_10000EF40((uint64_t)v10);
        v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
        *(_DWORD *)buf = 138543874;
        v79 = v14;
        v80 = 2114;
        v81 = v8;
        v82 = 2114;
        v83 = (uint64_t)v7;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Connecting new scene of type '%{public}@'; scene: %{public}@; to session: %{public}@",
          buf,
          0x20u);

      }
      if (!-[ICSInCallSceneDelegate zombieDetectedForSession:scene:ofType:](self, "zombieDetectedForSession:scene:ofType:", v7, v8, v10))
      {
        v76 = v6;
        v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "delegate"));
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "sceneManager"));
        v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "sceneOfType:", v10));

        if (v18)
        {
          v19 = sub_1000C56D8();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          {
            v72 = v19;
            v73 = sub_10000EF40((uint64_t)v10);
            v74 = (void *)objc_claimAutoreleasedReturnValue(v73);
            *(_DWORD *)buf = 138543874;
            v79 = v74;
            v80 = 2112;
            v81 = v8;
            v82 = 2112;
            v83 = v18;
            _os_log_error_impl((void *)&_mh_execute_header, v72, OS_LOG_TYPE_ERROR, "Attempting to connect a new scene of type '%{public}@'; scene:%@ even though we already have one active:%@"
              ", undefined behavior may ensue",
              buf,
              0x20u);

          }
        }
        v75 = (void *)v18;
        v20 = -[ICSSecureWindow initWithWindowScene:]([ICSSecureWindow alloc], "initWithWindowScene:", v8);
        v21 = (void *)objc_claimAutoreleasedReturnValue(-[ICSInCallSceneDelegate windowSceneToWindowMap](self, "windowSceneToWindowMap"));
        objc_msgSend(v21, "setObject:forKey:", v20, v8);

        v22 = objc_alloc_init(ICSCallAnalyticsLogger);
        -[ICSInCallSceneDelegate setCallAnalyticsLogger:](self, "setCallAnalyticsLogger:", v22);

        v77 = v20;
        -[ICSInCallSceneDelegate configureWindow:windowScene:](self, "configureWindow:windowScene:", v20, v8);
        -[ICSInCallSceneDelegate configureWindowScene:forSceneType:](self, "configureWindowScene:forSceneType:", v8, v10);
        v23 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "delegate"));
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "allInCallScenes"));
        objc_msgSend(v25, "addObject:", v8);

        v26 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
        v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "delegate"));
        v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "connectedSceneSessionIdentifiers"));
        v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "persistentIdentifier"));
        v30 = objc_msgSend(v29, "copy");
        objc_msgSend(v28, "addObject:", v30);

        v31 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
        v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "delegate"));
        v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "sceneManager"));
        objc_msgSend(v33, "registerScene:ofType:", v8, v10);

        v34 = sub_1000C56D8();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
        {
          v35 = v34;
          v36 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
          v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "delegate"));
          v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "currentInCallScene"));
          v39 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
          v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "delegate"));
          v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "allInCallScenes"));
          *(_DWORD *)buf = 138543618;
          v79 = v38;
          v80 = 2114;
          v81 = v41;
          _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "The current in-call scene is: %{public}@; the set of all tracked scenes is now: %{public}@",
            buf,
            0x16u);

        }
        v42 = sub_1000C56D8();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
        {
          v43 = v42;
          v44 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
          v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "delegate"));
          v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "allInCallScenes"));
          v47 = objc_msgSend(v46, "count");
          *(_DWORD *)buf = 134217984;
          v79 = v47;
          _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "Number of scenes tracked is %lu", buf, 0xCu);

        }
        v48 = sub_1000C56D8();
        if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
        {
          v49 = v48;
          v50 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
          v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "delegate"));
          v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "connectedSceneSessionIdentifiers"));
          *(_DWORD *)buf = 138543362;
          v79 = v52;
          _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_DEFAULT, "The set of all scene sessions that have ever connected is %{public}@", buf, 0xCu);

        }
        v53 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
        v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "delegate"));
        v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "sceneManager"));
        objc_msgSend(v55, "didUpdatePresentationMode:forScene:", objc_msgSend(v8, "presentationMode"), v8);

        v56 = v77;
        v57 = (void *)objc_claimAutoreleasedReturnValue(-[ICSSecureWindow rootViewController](v77, "rootViewController"));
        v59 = objc_opt_class(PHInCallRemoteAlertShellViewController, v58);
        if ((objc_opt_isKindOfClass(v57, v59) & 1) != 0)
        {
          v60 = v57;
          v61 = v60;
          if (v60)
          {
            v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "pipController"));
            objc_msgSend(v62, "setWindowForTransitionAnimation:", v77);

            objc_msgSend(v61, "sceneSessionDidChange");
          }
        }
        else
        {
          v61 = 0;
        }
        if ((-[CNKFeatures isIncomingCallBannerEnabled](self->_features, "isIncomingCallBannerEnabled") & 1) == 0
          && objc_msgSend(v8, "presentationMode") == (id)2
          && objc_msgSend(v8, "ics_sceneType") != (id)6)
        {
          v63 = sub_1000C55F8();
          if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
          {
            v64 = v63;
            v65 = sub_10000EF40((uint64_t)objc_msgSend(v8, "ics_sceneType"));
            v66 = (void *)objc_claimAutoreleasedReturnValue(v65);
            *(_DWORD *)buf = 138543362;
            v79 = v66;
            _os_log_impl((void *)&_mh_execute_header, v64, OS_LOG_TYPE_DEFAULT, "Requesting dismissal of presented banner since a new full screen ICS scene %{public}@ is connecting", buf, 0xCu);

          }
          v67 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
          v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "delegate"));
          v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v68, "bannerPresentationManager"));
          objc_msgSend(v69, "dismissPresentedBannerForReason:animated:", CFSTR("InCallService is connecting a new full screen scene"), 1);

          v56 = v77;
        }
        +[CATransaction setFrameStallSkipRequest:](CATransaction, "setFrameStallSkipRequest:", 1);
        v70 = (void *)objc_claimAutoreleasedReturnValue(-[ICSInCallSceneDelegate greenTea3PPresentationStyleHandler](self, "greenTea3PPresentationStyleHandler"));

        if (v70)
        {
          v71 = (void *)objc_claimAutoreleasedReturnValue(-[ICSInCallSceneDelegate greenTea3PPresentationStyleHandler](self, "greenTea3PPresentationStyleHandler"));
          objc_msgSend(v71, "handlePresentationModeChanged:scene:", objc_msgSend(v8, "presentationMode"), v8);

        }
        v6 = v76;
      }
    }

  }
}

- (void)sceneDidDisconnect:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unsigned int v14;
  NSObject *v15;
  _BOOL4 v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void (**v32)(void);
  void *v33;
  void *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  int v47;
  id v48;
  __int16 v49;
  id v50;

  v4 = a3;
  v5 = sub_1000C56D8();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    v7 = sub_10000EF40((uint64_t)objc_msgSend(v4, "ics_sceneType"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    v47 = 138543618;
    v48 = v8;
    v49 = 2112;
    v50 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Disconnected scene of type %{public}@: %@", (uint8_t *)&v47, 0x16u);

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICSInCallSceneDelegate remoteAlertShellViewControllerForWindowScene:](self, "remoteAlertShellViewControllerForWindowScene:", v4));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[ICSInCallSceneDelegate windowSceneToWindowMap](self, "windowSceneToWindowMap"));
  objc_msgSend(v10, "removeObjectForKey:", v4);

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "delegate"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "allInCallScenes"));
  v14 = objc_msgSend(v13, "containsObject:", v4);

  v15 = sub_1000C56D8();
  v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
  if (v14)
  {
    if (v16)
    {
      v47 = 138412290;
      v48 = v4;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Removing scene %@ from the set of all tracked scenes", (uint8_t *)&v47, 0xCu);
    }
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "delegate"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "allInCallScenes"));
    objc_msgSend(v19, "removeObject:", v4);

  }
  else if (v16)
  {
    v47 = 138412290;
    v48 = v4;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "[Warning]: Not removing scene %@ from the set of all tracked scenes because it was already untracked", (uint8_t *)&v47, 0xCu);
  }
  v20 = sub_1000C56D8();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    v21 = v20;
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "delegate"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "allInCallScenes"));
    v47 = 138412290;
    v48 = v24;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "The set of all tracked scenes is now %@", (uint8_t *)&v47, 0xCu);

  }
  v25 = sub_1000C56D8();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    v26 = v25;
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "delegate"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "allInCallScenes"));
    v30 = objc_msgSend(v29, "count");
    v47 = 134217984;
    v48 = v30;
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Number of scenes tracked is %lu", (uint8_t *)&v47, 0xCu);

  }
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[ICSInCallSceneDelegate sceneDidDisconnectBlock](self, "sceneDidDisconnectBlock"));

  if (v31)
  {
    v32 = (void (**)(void))objc_claimAutoreleasedReturnValue(-[ICSInCallSceneDelegate sceneDidDisconnectBlock](self, "sceneDidDisconnectBlock"));
    v32[2]();

    -[ICSInCallSceneDelegate setSceneDidDisconnectBlock:](self, "setSceneDidDisconnectBlock:", 0);
  }
  if (objc_msgSend(v4, "presentationMode") == (id)1)
  {
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[ICSInCallSceneDelegate callAnalyticsLogger](self, "callAnalyticsLogger"));
    objc_msgSend(v33, "bannerDidDisconnect");

  }
  -[ICSInCallSceneDelegate setCallAnalyticsLogger:](self, "setCallAnalyticsLogger:", 0);
  objc_msgSend(v9, "sceneSessionDidChange");
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "requestedPresentationConfigurationIdentifier"));

  if (v34)
  {
    v35 = objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    v36 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject delegate](v35, "delegate"));
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "sceneManager"));
    v38 = objc_msgSend(v4, "ics_sceneType");
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "requestedPresentationConfigurationIdentifier"));
    objc_msgSend(v37, "didDisconnectSceneOfType:withIdentifier:", v38, v39);

  }
  else
  {
    v40 = sub_1000C5588();
    v35 = objc_claimAutoreleasedReturnValue(v40);
    if (os_log_type_enabled(v35, OS_LOG_TYPE_FAULT))
      sub_1001A96A8((uint64_t)v4, v35, v41, v42, v43, v44, v45, v46);
  }

}

- (void)handleHardwareButtonEvent:(id)a3 eventHandler:(id)a4
{
  id v5;

  v5 = a4;
  switch((unint64_t)objc_msgSend(a3, "buttonEventType"))
  {
    case 1uLL:
      objc_msgSend(v5, "handleVolumeUpButtonPressed");
      break;
    case 2uLL:
      objc_msgSend(v5, "handleVolumeDownButtonPressed");
      break;
    case 3uLL:
      objc_msgSend(v5, "handleHeadsetButtonPressed");
      break;
    case 4uLL:
      objc_msgSend(v5, "handleHeadsetButtonLongPressed");
      break;
    default:
      break;
  }

}

- (BOOL)zombieDetectedForSession:(id)a3 scene:(id)a4 ofType:(unint64_t)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned int v13;
  void *v14;
  void *v15;
  void *v16;
  unsigned int v17;
  void *v18;
  _BOOL4 v19;
  char v20;
  int v21;
  NSObject *v22;

  v7 = a4;
  v8 = a3;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "delegate"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "connectedSceneSessionIdentifiers"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "persistentIdentifier"));

  v13 = objc_msgSend(v11, "containsObject:", v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "delegate"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "sceneManager"));
  v17 = objc_msgSend(v16, "hasPendingSceneOfType:", a5);

  if ((objc_opt_respondsToSelector(v7, "requestedPresentationConfigurationIdentifier") & 1) != 0)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "requestedPresentationConfigurationIdentifier"));
    v19 = v18 == 0;

  }
  else
  {
    v19 = 0;
  }
  v20 = v17 ^ 1;
  v21 = v13 | v19 | v17 ^ 1;
  if (v21 == 1)
  {
    v22 = sub_1000C56D8();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      sub_1001A970C(v13, v20, v22);
  }

  return v21;
}

- (void)configureWindowScene:(id)a3 forSceneType:(unint64_t)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned int v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  uint8_t v20[16];
  uint8_t buf[16];

  v6 = a3;
  -[ICSInCallSceneDelegate updateSceneBackgroundMaterialWith:](self, "updateSceneBackgroundMaterialWith:", v6);
  v7 = sub_1000A33EC(a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  objc_msgSend(v6, "setPreferredBackgroundActivitiesToSuppress:", v8);

  objc_msgSend(v6, "setShouldBecomeVisibleWhenWakingDisplay:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "delegate"));
  v11 = objc_msgSend(v10, "shouldActivateSOS");

  if (v11)
  {
    v12 = sub_1000C56D8();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "ICSApplicationDelegate wants SOS while connecting a new scene. Immediately transition to full-screen overlay for SOS", buf, 2u);
    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "delegate"));
    objc_msgSend(v14, "transitionSceneToOverlayForSOS");
  }
  else
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "delegate"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "activationContext"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "pendingRestrictedScreenTimeRequest"));

    if (!v18)
      goto LABEL_10;
    v19 = sub_1000C56D8();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v20 = 0;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "ICSApplicationDelegate wants Screen Time while connecting a new scene. Immediately transition to full-screen overlay for Screen Time", v20, 2u);
    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "delegate"));
    objc_msgSend(v14, "transitionSceneToOverlayForScreenTime");
  }

LABEL_10:
  if (objc_msgSend(v6, "isScreenSharingPresentation"))
  {
    objc_msgSend(v6, "setSupportsDeviceLockEvents:", 0);
    objc_msgSend(v6, "setIdleTimerDisabled:", 1);
    objc_msgSend(v6, "setCallConnected:", 0);
    objc_msgSend(v6, "setPreferredHardwareButtonEventTypes:", 0);
  }
  if (a4 == 6)
  {
    objc_msgSend(v6, "setSupportsDeviceLockEvents:", 1);
    objc_msgSend(v6, "setShouldBecomeVisibleWhenWakingDisplay:", 0);
    objc_msgSend(v6, "setPrefersHiddenWhenDismissed:", 1);
  }

}

- (void)updateSceneBackgroundMaterialWith:(id)a3
{
  void *v4;
  void *v5;
  unsigned int v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;

  v16 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "frontmostCall"));
  if ((objc_msgSend(v5, "isRTT") & 1) != 0)
  {
    v6 = 0;
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "frontmostCall"));
    v6 = objc_msgSend(v8, "isTTY") ^ 1;

  }
  if (objc_msgSend(v16, "presentationMode") != (id)1
    && -[CNKFeatures isHeroImageEnabled](self->_features, "isHeroImageEnabled")
    && ((v9 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance")),
         objc_msgSend(v9, "currentCallCount"))
      ? (v10 = v6)
      : (v10 = 0),
        v9,
        v10 == 1))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "frontmostAudioOrVideoCall"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "activeConversationForCall:", v13));

    if (v14 && !objc_msgSend(v14, "avMode"))
      v15 = 4;
    else
      v15 = 1;
    objc_msgSend(v16, "_setBackgroundStyle:", v15);

  }
  else
  {
    objc_msgSend(v16, "_setBackgroundStyle:", 4);
  }

}

- (void)configureWindow:(id)a3 windowScene:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v6 = a4;
  v9 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "coordinateSpace"));
  objc_msgSend(v7, "bounds");
  objc_msgSend(v9, "setFrame:");

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICSInCallSceneDelegate createRootViewControllerForScene:](self, "createRootViewControllerForScene:", v6));
  objc_msgSend(v9, "setRootViewController:", v8);

  objc_msgSend(v9, "makeKeyAndVisible");
}

- (id)createRootViewControllerForScene:(id)a3
{
  void *v3;
  PHInCallRemoteAlertShellViewController *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICSInCallSceneDelegate createCallDisplayStyleManagerForScene:](self, "createCallDisplayStyleManagerForScene:", a3));
  v4 = -[PHInCallRemoteAlertShellViewController initWithCallDisplayStyleManager:]([PHInCallRemoteAlertShellViewController alloc], "initWithCallDisplayStyleManager:", v3);

  return v4;
}

- (id)createCallDisplayStyleManagerForScene:(id)a3
{
  id v4;
  ICSCallDisplayStyleManager *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  id v12;

  v4 = a3;
  v5 = objc_alloc_init(ICSCallDisplayStyleManager);
  -[ICSInCallSceneDelegate deviceWindowedAccessoryCutoutFrameForScene:](self, "deviceWindowedAccessoryCutoutFrameForScene:", v4);
  -[ICSCallDisplayStyleManager updateMiniWindowCutoutFrame:attachedToWindowedAccessory:](v5, "updateMiniWindowCutoutFrame:attachedToWindowedAccessory:", -[ICSInCallSceneDelegate isDeviceAttachedToWindowedAccessoryForScene:](self, "isDeviceAttachedToWindowedAccessoryForScene:", v4), v6, v7, v8, v9);
  -[ICSCallDisplayStyleManager setCallDisplayStyle:](v5, "setCallDisplayStyle:", -[ICSInCallSceneDelegate callDisplayStyleForScene:](self, "callDisplayStyleForScene:", v4));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "session"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "persistentIdentifier"));
  -[ICSCallDisplayStyleManager setSceneSessionIdentifier:](v5, "setSceneSessionIdentifier:", v11);

  v12 = objc_msgSend(v4, "ics_sceneType");
  -[ICSCallDisplayStyleManager setSceneType:](v5, "setSceneType:", v12);
  return v5;
}

- (int64_t)callDisplayStyleForScene:(id)a3
{
  id v4;
  char *v5;
  int64_t v6;
  void *v7;

  v4 = a3;
  v5 = (char *)objc_msgSend(v4, "presentationMode");
  if ((unint64_t)(v5 - 2) >= 2)
  {
    if (v5 == (char *)1)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[ICSPreferences sharedPreferences](ICSPreferences, "sharedPreferences"));
      if (objc_msgSend(v7, "hasBannersEnabled"))
        v6 = 0;
      else
        v6 = 2;

    }
    else
    {
      v6 = 4;
    }
  }
  else if (-[ICSInCallSceneDelegate isDeviceAttachedToWindowedAccessoryForScene:](self, "isDeviceAttachedToWindowedAccessoryForScene:", v4))
  {
    v6 = 1;
  }
  else
  {
    v6 = 2;
  }

  return v6;
}

- (NSMapTable)windowSceneToWindowMap
{
  NSMapTable *windowSceneToWindowMap;
  NSMapTable *v4;
  NSMapTable *v5;

  windowSceneToWindowMap = self->_windowSceneToWindowMap;
  if (!windowSceneToWindowMap)
  {
    v4 = (NSMapTable *)objc_claimAutoreleasedReturnValue(+[NSMapTable weakToStrongObjectsMapTable](NSMapTable, "weakToStrongObjectsMapTable"));
    v5 = self->_windowSceneToWindowMap;
    self->_windowSceneToWindowMap = v4;

    windowSceneToWindowMap = self->_windowSceneToWindowMap;
  }
  return windowSceneToWindowMap;
}

- (id)sceneDidDisconnectBlock
{
  return self->_sceneDidDisconnectBlock;
}

- (void)setSceneDidDisconnectBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (ICSCallAnalyticsLogger)callAnalyticsLogger
{
  return self->_callAnalyticsLogger;
}

- (void)setCallAnalyticsLogger:(id)a3
{
  objc_storeStrong((id *)&self->_callAnalyticsLogger, a3);
}

- (BOOL)hasSetupForScene
{
  return self->_hasSetupForScene;
}

- (void)setHasSetupForScene:(BOOL)a3
{
  self->_hasSetupForScene = a3;
}

- (ICSInCallScenePresentationStyleHandler)greenTea3PPresentationStyleHandler
{
  return (ICSInCallScenePresentationStyleHandler *)objc_getProperty(self, a2, 48, 1);
}

- (void)setGreenTea3PPresentationStyleHandler:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (ICSGreenTea3PUIHardwareEventHandler)greenTea3PUIHardwareEventHandler
{
  return (ICSGreenTea3PUIHardwareEventHandler *)objc_getProperty(self, a2, 56, 1);
}

- (void)setGreenTea3PUIHardwareEventHandler:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_greenTea3PUIHardwareEventHandler, 0);
  objc_storeStrong((id *)&self->_greenTea3PPresentationStyleHandler, 0);
  objc_storeStrong((id *)&self->_callAnalyticsLogger, 0);
  objc_storeStrong(&self->_sceneDidDisconnectBlock, 0);
  objc_storeStrong((id *)&self->_windowSceneToWindowMap, 0);
  objc_storeStrong((id *)&self->_features, 0);
}

@end
