@implementation PHCallViewController

- (PHCallViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  PHCallViewController *v4;
  PHCallViewController *v5;
  NSCache *v6;
  NSCache *punchoutImageCache;
  TUCallProviderManager *v8;
  TUCallProviderManager *providerManager;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PHCallViewController;
  v4 = -[PHCallViewController initWithNibName:bundle:](&v11, "initWithNibName:bundle:", a3, a4);
  v5 = v4;
  if (v4)
  {
    v4->_currentState = 0;
    v6 = (NSCache *)objc_alloc_init((Class)NSCache);
    punchoutImageCache = v5->_punchoutImageCache;
    v5->_punchoutImageCache = v6;

    v8 = (TUCallProviderManager *)objc_alloc_init((Class)TUCallProviderManager);
    providerManager = v5->_providerManager;
    v5->_providerManager = v8;

    -[TUCallProviderManager addDelegate:queue:](v5->_providerManager, "addDelegate:queue:", v5, &_dispatch_main_q);
  }
  return v5;
}

- (BOOL)isPresentingCustomMessageController
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  char isKindOfClass;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallViewController presentedViewController](self, "presentedViewController"));
  v4 = objc_opt_class(PHMessageComposeViewController, v3);
  isKindOfClass = objc_opt_isKindOfClass(v2, v4);

  return isKindOfClass & 1;
}

- (void)setCurrentState:(unsigned __int16)a3
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  id v17;

  self->_currentState = a3;
  if (-[PHCallViewController currentState](self, "currentState") == 1)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
    v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "incomingCall"));
    if (v4)
    {
      v17 = (id)v4;

    }
    else
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
      v17 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "incomingVideoCall"));

      if (!v17)
      {
        v17 = 0;
        goto LABEL_7;
      }
    }
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[TUMetadataClientController sharedInstance](TUMetadataClientController, "sharedInstance"));
    objc_msgSend(v6, "updateMetadataForCall:", v17);

LABEL_7:
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "delegate"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "currentInCallScene"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "delegate"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "callAnalyticsLogger"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "delegate"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "currentInCallScene"));
    v15 = objc_msgSend(v14, "presentationMode");
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[ICSPreferences sharedPreferences](ICSPreferences, "sharedPreferences"));
    objc_msgSend(v11, "createAnalyticsViewForCall:initialPresentationMode:bannersEnabled:", v17, v15, objc_msgSend(v16, "hasBannersEnabled"));

  }
}

- (void)transitionToIdleAfterDelay
{
  int64_t v3;
  dispatch_time_t v4;
  _QWORD block[5];

  if (-[PHCallViewController currentState](self, "currentState") == 1)
    v3 = 500000000;
  else
    v3 = 1000000000;
  v4 = dispatch_time(0, v3);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100020764;
  block[3] = &unk_100284898;
  block[4] = self;
  dispatch_after(v4, (dispatch_queue_t)&_dispatch_main_q, block);
}

- (BOOL)allowsMenuButtonDismissal
{
  return 1;
}

- (BOOL)allowsOtherAlertsToStackOnTop
{
  return 1;
}

- (BOOL)allowsBanners
{
  return 1;
}

- (BOOL)allowsOrientationChangeEvents
{
  return 0;
}

- (unint64_t)desiredButtonEvents
{
  return 0;
}

- (unint64_t)desiredSceneButtonEvents
{
  return 0;
}

- (BOOL)desiresLockButtonEvents
{
  return 0;
}

- (unint64_t)desiredButtonEventsForCallContainer:(id)a3
{
  return 0;
}

- (void)configureDeclineWithReminderButton:(id)a3 declineWithMessageButton:(id)a4 forIncomingCall:(id)a5
{
  id v8;
  id v9;
  void *v10;
  PHDeclineCallServiceFactory *v11;
  void *v12;
  void *v13;
  PHDeclineWithMessageController *v14;
  void *v15;
  id v16;

  v16 = a3;
  v8 = a4;
  v9 = a5;
  if (!TUCallScreeningEnabledM3(0)
    || !-[PHCallViewController isPresentingCustomMessageController](self, "isPresentingCustomMessageController")
    || (v10 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallViewController declineWithMessageController](self, "declineWithMessageController")),
        v10,
        !v10))
  {
    if (v16)
      +[PHDeclineWithReminderController configureButton:forIncomingCall:presenter:](PHDeclineWithReminderController, "configureButton:forIncomingCall:presenter:", v16, v9, self);
    if (v8)
    {
      v11 = objc_opt_new(PHDeclineCallServiceFactory);
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[PHDeclineCallServiceFactory makeWithCallCenter:](v11, "makeWithCallCenter:", v12));

      v14 = -[PHDeclineWithMessageController initWithIncomingCall:customMessagePresentingViewController:declineCallService:]([PHDeclineWithMessageController alloc], "initWithIncomingCall:customMessagePresentingViewController:declineCallService:", v9, self, v13);
      -[PHCallViewController setDeclineWithMessageController:](self, "setDeclineWithMessageController:", v14);

      v15 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallViewController declineWithMessageController](self, "declineWithMessageController"));
      objc_msgSend(v15, "configureDeclineMessageForButton:", v8);

    }
  }

}

- (CGRect)sourceRectForDeclineWithMessagePopover
{
  void *v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  CGRect v29;
  CGRect v30;
  CGRect result;
  CGRect v32;
  CGRect v33;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallViewController bottomBar](self, "bottomBar"));
  objc_msgSend(v3, "frameForControlWithActionType:", 9);
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  v29.origin.x = v5;
  v29.origin.y = v7;
  v29.size.width = v9;
  v29.size.height = v11;
  v32.origin.x = CGRectZero.origin.x;
  v32.origin.y = y;
  v32.size.width = width;
  v32.size.height = height;
  if (CGRectEqualToRect(v29, v32))
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallViewController bottomBar](self, "bottomBar"));
    objc_msgSend(v15, "frameForControlWithActionType:", 11);
    v5 = v16;
    v7 = v17;
    v9 = v18;
    v11 = v19;

  }
  v30.origin.x = v5;
  v30.origin.y = v7;
  v30.size.width = v9;
  v30.size.height = v11;
  v33.origin.x = CGRectZero.origin.x;
  v33.origin.y = y;
  v33.size.width = width;
  v33.size.height = height;
  if (CGRectEqualToRect(v30, v33))
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallViewController bottomBar](self, "bottomBar"));
    objc_msgSend(v20, "frameForControlWithActionType:", 27);
    v5 = v21;
    v7 = v22;
    v9 = v23;
    v11 = v24;

  }
  v25 = v5;
  v26 = v7;
  v27 = v9;
  v28 = v11;
  result.size.height = v28;
  result.size.width = v27;
  result.origin.y = v26;
  result.origin.x = v25;
  return result;
}

- (CGRect)sourceRectForDeclineWithReminderPopover
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGRect result;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallViewController bottomBar](self, "bottomBar"));
  objc_msgSend(v2, "frameForControlWithActionType:", 12);
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (BOOL)_shouldAutoAnswer
{
  void *v2;
  unsigned int v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  _BOOL4 v14;
  id v15;
  NSObject *v16;
  const __CFString *v17;
  int v19;
  const __CFString *v20;
  __int16 v21;
  id v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  id v26;
  __int16 v27;
  void *v28;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[IMLockdownManager sharedInstance](IMLockdownManager, "sharedInstance"));
  v3 = objc_msgSend(v2, "isInternalInstall");

  if (v3)
  {
    v4 = sub_10000D540(CFSTR("autoAnswerInvites"), CFSTR("com.apple.conference"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
    if (objc_msgSend(v5, "BOOLValue"))
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "incomingCall"));

      v8 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
      v9 = objc_msgSend(v8, "currentCallCount");

      v10 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "incomingVideoCall"));

      v12 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
      v13 = objc_msgSend(v12, "currentVideoCallCount");

      if (v9 == (id)1 && objc_msgSend(v7, "service") == 2)
        v14 = 1;
      else
        v14 = v13 == (id)1 && objc_msgSend(v11, "service") == 3;
      v15 = sub_1000C5588();
      v16 = objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        v17 = CFSTR("NO");
        v19 = 138413314;
        if (v14)
          v17 = CFSTR("YES");
        v20 = v17;
        v21 = 2048;
        v22 = v9;
        v23 = 2112;
        v24 = v7;
        v25 = 2048;
        v26 = v13;
        v27 = 2112;
        v28 = v11;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Auto Answer is %@ - call count is %lu (incoming call: %@), video call count is %lu (incoming video call: %@)", (uint8_t *)&v19, 0x34u);
      }

    }
    else
    {
      LOBYTE(v14) = 0;
    }

  }
  else
  {
    LOBYTE(v14) = 0;
  }
  return v14;
}

- (void)setupAutoAnswer
{
  id v3;
  NSObject *v4;
  uint8_t v5[16];

  if (-[PHCallViewController _shouldAutoAnswer](self, "_shouldAutoAnswer"))
  {
    v3 = sub_1000C5588();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Setting up auto answer", v5, 2u);
    }

    -[PHCallViewController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", "autoAnswer", 0, 5.0);
  }
}

- (void)cancelAutoAnswer
{
  id v3;
  NSObject *v4;
  uint8_t v5[16];

  if (-[PHCallViewController _shouldAutoAnswer](self, "_shouldAutoAnswer"))
  {
    v3 = sub_1000C5588();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Canceling auto answer", v5, 2u);
    }

    +[NSObject cancelPreviousPerformRequestsWithTarget:selector:object:](NSObject, "cancelPreviousPerformRequestsWithTarget:selector:object:", self, "autoAnswer", 0);
  }
}

- (void)autoAnswer
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint8_t v11[16];

  -[PHCallViewController cancelAutoAnswer](self, "cancelAutoAnswer");
  if (-[PHCallViewController _shouldAutoAnswer](self, "_shouldAutoAnswer"))
  {
    v3 = sub_1000C5588();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Auto answering", v11, 2u);
    }

    v5 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "incomingCall"));

    if (v6)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
      objc_msgSend(v7, "answerCall:", v6);

    }
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "incomingVideoCall"));

    if (v9)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
      objc_msgSend(v10, "answerCall:", v9);

    }
  }
}

- (void)setStatusBarHidden:(BOOL)a3 withDuration:(double)a4
{
  _BOOL8 v5;
  id v6;

  v5 = a3;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[PHCallViewController inCallRootViewController](self, "inCallRootViewController"));
  objc_msgSend(v6, "setStatusBarHidden:withDuration:", v5, a4);

}

- (TUSenderIdentityClient)senderIdentityClient
{
  TUSenderIdentityClient *senderIdentityClient;
  TUSenderIdentityClient *v4;
  TUSenderIdentityClient *v5;

  senderIdentityClient = self->_senderIdentityClient;
  if (!senderIdentityClient)
  {
    v4 = (TUSenderIdentityClient *)objc_alloc_init((Class)TUSenderIdentityClient);
    v5 = self->_senderIdentityClient;
    self->_senderIdentityClient = v4;

    senderIdentityClient = self->_senderIdentityClient;
  }
  return senderIdentityClient;
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PHCallViewController;
  -[PHCallViewController viewDidAppear:](&v4, "viewDidAppear:", a3);
  -[PHCallViewController setupAutoAnswer](self, "setupAutoAnswer");
}

- (void)viewWillDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PHCallViewController;
  -[PHCallViewController viewWillDisappear:](&v4, "viewWillDisappear:", a3);
  -[PHCallViewController cancelAutoAnswer](self, "cancelAutoAnswer");
}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PHCallViewController;
  -[PHCallViewController viewDidDisappear:](&v4, "viewDidDisappear:", a3);
  -[PHCallViewController handleDismissedCallDisplayStyle](self, "handleDismissedCallDisplayStyle");
}

- (void)handleDismissedCallDisplayStyle
{
  void *v3;
  PHCallViewController *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  char isKindOfClass;

  -[PHCallViewController cancelAutoAnswer](self, "cancelAutoAnswer");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallViewController presentedViewController](self, "presentedViewController"));
  v4 = (PHCallViewController *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "presentingViewController"));

  if (v4 == self)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallViewController presentedViewController](self, "presentedViewController"));
    objc_msgSend(v5, "dismissViewControllerAnimated:completion:", 0, 0);

  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallViewController presentedViewController](self, "presentedViewController"));
  v8 = objc_opt_class(PHMessageComposeViewController, v7);
  isKindOfClass = objc_opt_isKindOfClass(v6, v8);

  if ((isKindOfClass & 1) != 0)
    -[PHCallViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
  -[PHCallViewController releaseDismissalAssertionIfNeeded](self, "releaseDismissalAssertionIfNeeded");
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)showErrorAlertWithTitle:(id)a3 message:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_10028DC20, CFSTR("InCallService")));
  v10 = (id)objc_claimAutoreleasedReturnValue(+[IMUserNotification userNotificationWithIdentifier:title:message:defaultButton:alternateButton:otherButton:](IMUserNotification, "userNotificationWithIdentifier:title:message:defaultButton:alternateButton:otherButton:", CFSTR("InCallService"), v6, v5, v8, 0, 0));

  objc_msgSend(v10, "setShowInLockScreen:", 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[IMUserNotificationCenter sharedInstance](IMUserNotificationCenter, "sharedInstance"));
  objc_msgSend(v9, "addUserNotification:listener:", v10, 0);

}

- (void)showErrorAlertWithTitle:(id)a3 message:(id)a4 alternateButton:(id)a5 alternateButtonURL:(id)a6 otherButton:(id)a7 otherButtonURL:(id)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  void ***v24;
  void *v25;
  void **v26;
  uint64_t v27;
  void (*v28)(uint64_t, void *);
  void *v29;
  id v30;
  id v31;

  v13 = a6;
  v14 = a8;
  v15 = a7;
  v16 = a5;
  v17 = a4;
  v18 = a3;
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_10028DC20, CFSTR("InCallService")));
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[IMUserNotification userNotificationWithIdentifier:title:message:defaultButton:alternateButton:otherButton:](IMUserNotification, "userNotificationWithIdentifier:title:message:defaultButton:alternateButton:otherButton:", CFSTR("InCallService"), v18, v17, v20, v16, v15));

  v26 = _NSConcreteStackBlock;
  v27 = 3221225472;
  v28 = sub_1000213C4;
  v29 = &unk_100285088;
  v30 = v13;
  v31 = v14;
  v22 = v14;
  v23 = v13;
  v24 = objc_retainBlock(&v26);
  objc_msgSend(v21, "setShowInLockScreen:", 1, v26, v27, v28, v29);
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[IMUserNotificationCenter sharedInstance](IMUserNotificationCenter, "sharedInstance"));
  objc_msgSend(v25, "addUserNotification:listener:completionHandler:", v21, 0, v24);

}

- (void)showErrorAlertWithTitle:(id)a3 message:(id)a4 alternateButton:(id)a5 alternateButtonURL:(id)a6
{
  -[PHCallViewController showErrorAlertWithTitle:message:alternateButton:alternateButtonURL:otherButton:otherButtonURL:](self, "showErrorAlertWithTitle:message:alternateButton:alternateButtonURL:otherButton:otherButtonURL:", a3, a4, a5, a6, 0, 0);
}

- (BOOL)shouldShowActionTypeSendToVoicemail
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned int v8;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[ICSApplicationServices sharedInstance](ICSApplicationServices, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "incomingCall"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "accountManager"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "accounts"));
  if (objc_msgSend(v6, "count"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "model"));
    if (objc_msgSend(v7, "supportsSendingToVoicemail")
      && (objc_msgSend(v4, "isRTT") & 1) == 0)
    {
      v8 = objc_msgSend(v4, "isTTY") ^ 1;
    }
    else
    {
      LOBYTE(v8) = 0;
    }

  }
  else
  {
    LOBYTE(v8) = 0;
  }

  return v8;
}

+ (double)homeButtonOffsetForView:(id)a3
{
  id v3;
  double v4;
  void *v5;
  double v6;
  CGFloat v7;
  double v8;
  double v9;
  double v10;
  CGFloat v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  CGRect v17;

  v3 = a3;
  v4 = 0.0;
  if ((id)+[PHUIConfiguration pipStatusBarPadding](PHUIConfiguration, "pipStatusBarPadding") == (id)5)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "safeAreaLayoutGuide"));
    objc_msgSend(v5, "layoutFrame");
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;

    v17.origin.x = v7;
    v17.origin.y = v9;
    v17.size.width = v11;
    v17.size.height = v13;
    if (!CGRectIsEmpty(v17))
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
      objc_msgSend(v14, "bounds");
      v4 = v15 - (v9 + v13);

    }
  }

  return v4;
}

+ (double)_bottomBarBottomMarginForView:(id)a3
{
  uint64_t v4;
  id v5;
  double v6;
  _QWORD v8[4];
  id v9;
  id v10;

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10002169C;
  v8[3] = &unk_1002850B0;
  v9 = a3;
  v10 = a1;
  v4 = qword_1002DC690;
  v5 = v9;
  if (v4 != -1)
    dispatch_once(&qword_1002DC690, v8);
  v6 = *(double *)&qword_1002DC688;

  return v6;
}

+ (double)_yOffsetForLoweredButtons
{
  if (qword_1002DC6A0 != -1)
    dispatch_once(&qword_1002DC6A0, &stru_1002850D0);
  return *(double *)&qword_1002DC698;
}

- (BOOL)needsDismissalAssertion
{
  return 0;
}

+ (NSString)dismissalAssertionReason
{
  return 0;
}

- (void)obtainDismissalAssertionIfNeeded
{
  uint64_t v3;
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  id v8;

  if (-[PHCallViewController needsDismissalAssertion](self, "needsDismissalAssertion"))
  {
    v4 = objc_msgSend((id)objc_opt_class(self, v3), "dismissalAssertionReason");
    v5 = (void *)objc_claimAutoreleasedReturnValue(v4);

    if (v5)
    {
      v7 = objc_msgSend((id)objc_opt_class(self, v6), "dismissalAssertionReason");
      v8 = (id)objc_claimAutoreleasedReturnValue(v7);
      +[PHInCallRootViewController obtainDismissalAssertionForReason:](PHInCallRootViewController, "obtainDismissalAssertionForReason:", v8);

    }
  }
}

- (void)releaseDismissalAssertionIfNeeded
{
  if (!-[PHCallViewController needsDismissalAssertion](self, "needsDismissalAssertion"))
    -[PHCallViewController releaseDismissalAssertion](self, "releaseDismissalAssertion");
}

- (void)releaseDismissalAssertion
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  id v7;

  v3 = objc_msgSend((id)objc_opt_class(self, a2), "dismissalAssertionReason");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);

  if (v4)
  {
    v6 = objc_msgSend((id)objc_opt_class(self, v5), "dismissalAssertionReason");
    v7 = (id)objc_claimAutoreleasedReturnValue(v6);
    +[PHInCallRootViewController releaseDismissalAssertionForReason:](PHInCallRootViewController, "releaseDismissalAssertionForReason:", v7);

  }
}

- (UIImage)frontmostCallProviderIcon
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  UIImage *ImageFromCurrentImageContext;
  id v15;
  NSObject *v16;
  _BOOL4 v17;
  void *v18;
  void *v19;
  id v20;
  const char *v21;
  int v23;
  id v24;
  __int16 v25;
  void *v26;
  CGSize v27;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "frontmostAudioOrVideoCall"));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "provider"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallViewController punchoutImageCache](self, "punchoutImageCache"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "identifier"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", v7));

    if (v8)
    {
      v9 = v8;
LABEL_19:

      goto LABEL_20;
    }
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "iconTemplateImageData"));

    if (!v10)
    {
      v9 = 0;
      goto LABEL_19;
    }
    v11 = objc_alloc((Class)UIImage);
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "iconTemplateImageData"));
    v13 = objc_msgSend(v11, "initWithData:", v12);

    if (v13)
    {
      v27.width = 40.0;
      v27.height = 40.0;
      UIGraphicsBeginImageContextWithOptions(v27, 0, 0.0);
      objc_msgSend(v13, "drawInRect:", 0.0, 0.0, 40.0, 40.0);
      ImageFromCurrentImageContext = UIGraphicsGetImageFromCurrentImageContext();
      v9 = (id)objc_claimAutoreleasedReturnValue(ImageFromCurrentImageContext);
      UIGraphicsEndImageContext();
      v15 = sub_1000C5588();
      v16 = objc_claimAutoreleasedReturnValue(v15);
      v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
      if (v9)
      {
        if (v17)
        {
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "identifier"));
          v23 = 138412546;
          v24 = v9;
          v25 = 2112;
          v26 = v18;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Adding punchout image (%@) to cache for key: %@", (uint8_t *)&v23, 0x16u);

        }
        v16 = objc_claimAutoreleasedReturnValue(-[PHCallViewController punchoutImageCache](self, "punchoutImageCache"));
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "identifier"));
        -[NSObject setObject:forKey:](v16, "setObject:forKey:", v9, v19);

        goto LABEL_18;
      }
      if (v17)
      {
        LOWORD(v23) = 0;
        v21 = "[WARN] Could not get image from current image context";
        goto LABEL_16;
      }
    }
    else
    {
      v20 = sub_1000C5588();
      v16 = objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v23) = 0;
        v21 = "[WARN] Could not generate image from iconTemplateImageData from provider";
LABEL_16:
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, v21, (uint8_t *)&v23, 2u);
      }
    }
    v9 = 0;
LABEL_18:

    goto LABEL_19;
  }
  v9 = 0;
LABEL_20:

  return (UIImage *)v9;
}

- (void)punchOutToVoIPApplicationForCurrentCall
{
  dispatch_time_t v2;

  v2 = dispatch_time(0, 250000000);
  dispatch_after(v2, (dispatch_queue_t)&_dispatch_main_q, &stru_1002850F0);
}

- (void)activateProviderInBackgroundForCall:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  dispatch_time_t v7;
  id v8;
  _QWORD v9[4];
  id v10;
  PHCallViewController *v11;
  uint8_t buf[16];

  v4 = a3;
  v5 = sub_1000C5588();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "PHCallViewController: Requested background activation", buf, 2u);
  }

  v7 = dispatch_time(0, 250000000);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100021FAC;
  v9[3] = &unk_100285158;
  v10 = v4;
  v11 = self;
  v8 = v4;
  dispatch_after(v7, (dispatch_queue_t)&_dispatch_main_q, v9);

}

- (void)activateProviderInBackgroundWithBundleID:(id)a3
{
  id v3;
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint8_t buf[4];
  id v12;

  v3 = a3;
  v4 = sub_1000C5588();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v12 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Punching out to app with bundle identifier %@", buf, 0xCu);
  }

  v6 = objc_alloc_init((Class)_LSOpenConfiguration);
  v9 = FBSOpenApplicationOptionKeyActivateSuspended;
  v10 = &__kCFBooleanTrue;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v10, &v9, 1));
  objc_msgSend(v6, "setFrontBoardOptions:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](LSApplicationWorkspace, "defaultWorkspace"));
  objc_msgSend(v8, "openApplicationWithBundleIdentifier:configuration:completionHandler:", v3, v6, &stru_100285198);

}

- (id)imageForItemInBar:(id)a3 withActionType:(int64_t)a4
{
  uint64_t v4;
  uint64_t v5;

  if (a4 == 28)
    return (id)objc_claimAutoreleasedReturnValue(-[PHCallViewController frontmostCallProviderIcon](self, "frontmostCallProviderIcon", a3, v4, v5));
  else
    return 0;
}

- (int64_t)bottomBarCallStateInBar:(id)a3
{
  return 2;
}

- (void)providersChangedForProviderManager:(id)a3
{
  id v4;
  void *v5;
  unsigned int v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[8];
  _BYTE v23[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallViewController providerManager](self, "providerManager"));
  v6 = objc_msgSend(v4, "isEqual:", v5);

  if (v6)
  {
    v7 = sub_1000C5588();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Call providers changed. Invalidating punchout image cache", buf, 2u);
    }

    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallViewController providerManager](self, "providerManager", 0));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "providers"));

    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v19;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v19 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)v14);
          v16 = (void *)objc_claimAutoreleasedReturnValue(-[PHCallViewController punchoutImageCache](self, "punchoutImageCache"));
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "identifier"));
          objc_msgSend(v16, "removeObjectForKey:", v17);

          v14 = (char *)v14 + 1;
        }
        while (v12 != v14);
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
      }
      while (v12);
    }

  }
}

- (void)callDisplayStyleDidChangeFromStyle:(int64_t)a3 toStyle:(int64_t)a4
{
  if (a4 == 4)
    -[PHCallViewController handleDismissedCallDisplayStyle](self, "handleDismissedCallDisplayStyle", a3);
}

- (PHInCallRootViewControllerProtocol)inCallRootViewController
{
  return (PHInCallRootViewControllerProtocol *)objc_loadWeakRetained((id *)&self->_inCallRootViewController);
}

- (void)setInCallRootViewController:(id)a3
{
  objc_storeWeak((id *)&self->_inCallRootViewController, a3);
}

- (BOOL)wantsApplicationDismissalStyle
{
  return self->_wantsApplicationDismissalStyle;
}

- (void)setWantsApplicationDismissalStyle:(BOOL)a3
{
  self->_wantsApplicationDismissalStyle = a3;
}

- (PHBottomBar)bottomBar
{
  return self->_bottomBar;
}

- (void)setBottomBar:(id)a3
{
  objc_storeStrong((id *)&self->_bottomBar, a3);
}

- (CNKFaceTimeConstraintsController)controlsConstraintsController
{
  return self->_controlsConstraintsController;
}

- (void)setControlsConstraintsController:(id)a3
{
  objc_storeStrong((id *)&self->_controlsConstraintsController, a3);
}

- (CNContact)contact
{
  return self->_contact;
}

- (void)setContact:(id)a3
{
  objc_storeStrong((id *)&self->_contact, a3);
}

- (unsigned)currentState
{
  return self->_currentState;
}

- (CNContactStore)contactStore
{
  return self->_contactStore;
}

- (void)setContactStore:(id)a3
{
  objc_storeStrong((id *)&self->_contactStore, a3);
}

- (TUContactsDataProvider)contactsDataProvider
{
  return self->_contactsDataProvider;
}

- (void)setContactsDataProvider:(id)a3
{
  objc_storeStrong((id *)&self->_contactsDataProvider, a3);
}

- (NSCache)punchoutImageCache
{
  return (NSCache *)objc_getProperty(self, a2, 72, 1);
}

- (void)setPunchoutImageCache:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (TUCallProviderManager)providerManager
{
  return (TUCallProviderManager *)objc_getProperty(self, a2, 80, 1);
}

- (void)setProviderManager:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (PHAlertController)failureAlertController
{
  return (PHAlertController *)objc_loadWeakRetained((id *)&self->_failureAlertController);
}

- (void)setFailureAlertController:(id)a3
{
  objc_storeWeak((id *)&self->_failureAlertController, a3);
}

- (PHDeclineWithMessageController)declineWithMessageController
{
  return self->_declineWithMessageController;
}

- (void)setDeclineWithMessageController:(id)a3
{
  objc_storeStrong((id *)&self->_declineWithMessageController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_declineWithMessageController, 0);
  objc_destroyWeak((id *)&self->_failureAlertController);
  objc_storeStrong((id *)&self->_providerManager, 0);
  objc_storeStrong((id *)&self->_punchoutImageCache, 0);
  objc_storeStrong((id *)&self->_contactsDataProvider, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
  objc_storeStrong((id *)&self->_contact, 0);
  objc_storeStrong((id *)&self->_controlsConstraintsController, 0);
  objc_storeStrong((id *)&self->_bottomBar, 0);
  objc_destroyWeak((id *)&self->_inCallRootViewController);
  objc_storeStrong((id *)&self->_senderIdentityClient, 0);
}

@end
