@implementation PHCarPlayInCallViewController

- (PHCarPlayInCallViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  PHCarPlayInCallViewController *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PHCarPlayInCallViewController;
  v4 = -[PHCarPlayInCallViewController initWithNibName:bundle:](&v7, "initWithNibName:bundle:", a3, a4);
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v5, "addObserver:selector:name:object:", v4, "screenDidDisconnectNotification:", UIScreenDidDisconnectNotification, 0);

  }
  return v4;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[PHCarPlayMainInCallViewController setDelegate:](self->_mainInCallViewController, "setDelegate:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)PHCarPlayInCallViewController;
  -[PHCarPlayInCallViewController dealloc](&v4, "dealloc");
}

- (void)loadView
{
  id v3;
  NSObject *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  PHCarPlayMainInCallViewController *v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  TUHardwareControlsBroadcaster *v47;
  TUHardwareControlsBroadcaster *hardwareControlBroadcaster;
  id v49;
  uint8_t buf[8];
  const __CFString *v51;
  void *v52;
  const __CFString *v53;
  void *v54;
  const __CFString *v55;
  void *v56;
  const __CFString *v57;
  void *v58;

  v3 = sub_1000C5588();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "PHCarPlayInCallViewController loading view", buf, 2u);
  }

  v49 = objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor dynamicBackgroundColor](UIColor, "dynamicBackgroundColor"));
  objc_msgSend(v49, "setBackgroundColor:", v5);

  -[PHCarPlayInCallViewController setView:](self, "setView:", v49);
  v6 = objc_alloc_init((Class)UIView);
  objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v6, "setOpaque:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  objc_msgSend(v6, "setBackgroundColor:", v7);

  -[PHCarPlayInCallViewController setFlippyViewContainer:](self, "setFlippyViewContainer:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayInCallViewController view](self, "view"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayInCallViewController flippyViewContainer](self, "flippyViewContainer"));
  objc_msgSend(v8, "addSubview:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayInCallViewController view](self, "view"));
  v57 = CFSTR("view");
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayInCallViewController flippyViewContainer](self, "flippyViewContainer"));
  v58 = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v58, &v57, 1));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("|[view]|"), 0, 0, v12));
  objc_msgSend(v10, "addConstraints:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayInCallViewController view](self, "view"));
  v55 = CFSTR("view");
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayInCallViewController flippyViewContainer](self, "flippyViewContainer"));
  v56 = v15;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v56, &v55, 1));
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|[view]|"), 0, 0, v16));
  objc_msgSend(v14, "addConstraints:", v17);

  v18 = objc_alloc_init(PHCarPlayMainInCallViewController);
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayMainInCallViewController view](v18, "view"));
  objc_msgSend(v19, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayInCallViewController view](self, "view"));
  objc_msgSend(v20, "bounds");
  v22 = v21;
  v24 = v23;
  v26 = v25;
  v28 = v27;
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayMainInCallViewController view](v18, "view"));
  objc_msgSend(v29, "setFrame:", v22, v24, v26, v28);

  -[PHCarPlayInCallViewController addChildViewController:](self, "addChildViewController:", v18);
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayInCallViewController flippyViewContainer](self, "flippyViewContainer"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayMainInCallViewController view](v18, "view"));
  objc_msgSend(v30, "addSubview:", v31);

  -[PHCarPlayMainInCallViewController setDelegate:](v18, "setDelegate:", self);
  -[PHCarPlayInCallViewController setMainInCallViewController:](self, "setMainInCallViewController:", v18);
  -[PHCarPlayInCallViewController updateMainInCallControllerCalls](self, "updateMainInCallControllerCalls");
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayInCallViewController flippyViewContainer](self, "flippyViewContainer"));
  v53 = CFSTR("view");
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayInCallViewController mainInCallViewController](self, "mainInCallViewController"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "view"));
  v54 = v34;
  v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v54, &v53, 1));
  v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("|[view]|"), 0, 0, v35));
  objc_msgSend(v32, "addConstraints:", v36);

  v37 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayInCallViewController flippyViewContainer](self, "flippyViewContainer"));
  v51 = CFSTR("view");
  v38 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayInCallViewController mainInCallViewController](self, "mainInCallViewController"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "view"));
  v52 = v39;
  v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v52, &v51, 1));
  v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|[view]|"), 0, 0, v40));
  objc_msgSend(v37, "addConstraints:", v41);

  v42 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayInCallViewController view](self, "view"));
  objc_msgSend(v42, "setNeedsLayout");

  v43 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayInCallViewController view](self, "view"));
  objc_msgSend(v43, "layoutIfNeeded");

  v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v44, "addObserver:selector:name:object:", self, "callStatusChangedNotification:", TUCallCenterCallStatusChangedNotification, 0);
  objc_msgSend(v44, "addObserver:selector:name:object:", self, "callStatusChangedNotification:", TUCallCenterVideoCallStatusChangedNotification, 0);
  objc_msgSend(v44, "addObserver:selector:name:object:", self, "conferencedCallsChangedNotification:", TUCallCenterConferenceParticipantsChangedNotification, 0);
  v45 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
  v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "conversationManager"));
  objc_msgSend(v46, "addDelegate:queue:", self, &_dispatch_main_q);

  v47 = (TUHardwareControlsBroadcaster *)objc_alloc_init((Class)TUHardwareControlsBroadcaster);
  hardwareControlBroadcaster = self->_hardwareControlBroadcaster;
  self->_hardwareControlBroadcaster = v47;

}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  NSObject *v13;
  _QWORD v14[5];
  CGAffineTransform v15;
  CGAffineTransform v16;
  objc_super v17;
  uint8_t buf[16];

  v3 = a3;
  v5 = sub_1000C5588();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "PHCarPlayInCallViewController viewDidAppear:", buf, 2u);
  }

  v17.receiver = self;
  v17.super_class = (Class)PHCarPlayInCallViewController;
  -[PHCarPlayInCallViewController viewDidAppear:](&v17, "viewDidAppear:", v3);
  CGAffineTransformMakeScale(&v16, 1.5, 1.5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayInCallViewController view](self, "view"));
  v15 = v16;
  objc_msgSend(v7, "setTransform:", &v15);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayInCallViewController view](self, "view"));
  objc_msgSend(v8, "setAlpha:", 0.0);

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1000265D8;
  v14[3] = &unk_100284898;
  v14[4] = self;
  +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v14, &stru_100285260, 0.349999994);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v9, "addObserver:selector:name:object:", self, "hardwareControlEventNotification:", TUCarPlayHardwareControlEventNotification, 0);

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
  v11 = objc_msgSend(v10, "currentAudioAndVideoCallCount");

  if (!v11)
  {
    v12 = sub_1000C5588();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "PHCarPlayInCallViewController: appeared with no current calls, will call animateOutIfNecessary", buf, 2u);
    }

    -[PHCarPlayInCallViewController animateOutIfNecessary](self, "animateOutIfNecessary");
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  id v5;
  NSObject *v6;
  void *v7;
  objc_super v8;
  uint8_t buf[16];

  v3 = a3;
  v5 = sub_1000C5588();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "PHCarPlayInCallViewController viewDidDisappear:", buf, 2u);
  }

  v8.receiver = self;
  v8.super_class = (Class)PHCarPlayInCallViewController;
  -[PHCarPlayInCallViewController viewDidDisappear:](&v8, "viewDidDisappear:", v3);
  -[PHCarPlayInCallViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v7, "removeObserver:name:object:", self, TUCarPlayHardwareControlEventNotification, 0);

}

- (void)muteStateChangedNotification:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance", a3));
  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "frontmostAudioOrVideoCall"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayInCallViewController mainInCallViewController](self, "mainInCallViewController"));
  objc_msgSend(v5, "setIsMuted:", objc_msgSend(v6, "isUplinkMuted"));

}

- (void)callStatusChangedNotification:(id)a3
{
  -[PHCarPlayInCallViewController updateTPInCallControllerPhoneCalls](self, "updateTPInCallControllerPhoneCalls", a3);
}

- (void)conferencedCallsChangedNotification:(id)a3
{
  -[PHCarPlayInCallViewController updateTPInCallControllerPhoneCalls](self, "updateTPInCallControllerPhoneCalls", a3);
}

- (void)updateTPInCallControllerPhoneCalls
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unsigned int v7;
  id v8;

  -[PHCarPlayInCallViewController updateMainInCallControllerCalls](self, "updateMainInCallControllerCalls");
  v8 = (id)objc_claimAutoreleasedReturnValue(-[PHCarPlayInCallViewController incomingCall](self, "incomingCall"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayInCallViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy"));
  objc_msgSend(v3, "setAllowsBanners:", v8 == 0);

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "delegate"));
  objc_msgSend(v5, "setAllowsCarPlayBanners:", v8 == 0);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayInCallViewController mainInCallViewController](self, "mainInCallViewController"));
  v7 = objc_msgSend(v6, "isDismissable");

  if (v7)
  {
    -[PHCarPlayInCallViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
    -[PHCarPlayInCallViewController animateOutIfNecessary](self, "animateOutIfNecessary");
  }

}

- (void)updateMainInCallControllerCalls
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
  v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "displayedAudioAndVideoCalls"));

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "conferenceParticipantCalls"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayInCallViewController mainInCallViewController](self, "mainInCallViewController"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayInCallViewController incomingCall](self, "incomingCall"));
  objc_msgSend(v6, "setPrimaryCalls:conferencePhoneCalls:incomingCall:", v8, v5, v7);

}

- (id)incomingCall
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "incomingCall"));
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
    v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "incomingVideoCall"));

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "callsPassingTest:", &stru_100285280));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "firstObject"));

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "activeConversationForCall:", v9));
  v12 = objc_msgSend(v11, "state");

  if (v12 == (id)1)
  {
    v13 = v9;

    v5 = v13;
  }

  return v5;
}

- (void)animateOutIfNecessary
{
  id v3;
  NSObject *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned int v13;
  id v14;
  NSObject *v15;
  dispatch_time_t v16;
  void *v17;
  void *v18;
  _QWORD block[5];
  uint8_t buf[4];
  id v21;
  __int16 v22;
  id v23;
  __int16 v24;
  _BOOL4 v25;
  __int16 v26;
  id v27;

  v3 = sub_1000C5588();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "displayedAudioAndVideoCalls"));
    v5 = objc_msgSend(v17, "count");
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "conferenceParticipantCalls"));
    v8 = objc_msgSend(v7, "count");
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "incomingCall"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
    *(_DWORD *)buf = 134218752;
    v21 = v5;
    v22 = 2048;
    v23 = v8;
    v24 = 1024;
    v25 = v10 != 0;
    v26 = 2048;
    v27 = objc_msgSend(v11, "currentAudioAndVideoCallCount");
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "PHCarPlayInCallViewController: animateOutIfNecessary [Displayed calls: %lu, Conference calls: %lu, Incoming calls: %d, Audio and Video Calls: %lu]", buf, 0x26u);

  }
  if (!-[PHCarPlayInCallViewController activePhoneCallExists](self, "activePhoneCallExists"))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayInCallViewController mainInCallViewController](self, "mainInCallViewController"));
    v13 = objc_msgSend(v12, "isDismissable");

    if (v13)
    {
      v14 = sub_1000C5588();
      v15 = objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Animating out", buf, 2u);
      }

      v16 = dispatch_time(0, 500000000);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100026CC4;
      block[3] = &unk_100284898;
      block[4] = self;
      dispatch_after(v16, (dispatch_queue_t)&_dispatch_main_q, block);
    }
  }
}

- (BOOL)activePhoneCallExists
{
  void *v2;
  void *v3;
  char *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  unint64_t v10;
  void *v11;
  unint64_t v12;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "displayedAudioAndVideoCalls"));
  v4 = (char *)objc_msgSend(v3, "count");

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "conferenceParticipantCalls"));
  v7 = objc_msgSend(v6, "count");

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "incomingCalls"));
  v10 = (unint64_t)objc_msgSend(v9, "count");

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
  v12 = (unint64_t)objc_msgSend(v11, "currentAudioAndVideoCallCount");

  return &v4[(_QWORD)v7 + v10 + v12] != 0;
}

- (void)presentAddCallViewControllerRequestedFromInCallViewController:(id)a3
{
  UIViewController *v4;
  UIViewController *contactsViewController;
  id v6;

  v4 = (UIViewController *)objc_alloc_init((Class)CNStarkContactsListViewController);
  contactsViewController = self->_contactsViewController;
  self->_contactsViewController = v4;

  v6 = objc_msgSend(objc_alloc((Class)UINavigationController), "initWithRootViewController:", self->_contactsViewController);
  objc_msgSend(v6, "setDelegate:", self);
  -[PHCarPlayInCallViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v6, 1, 0);

}

- (void)navigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5
{
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  UIViewController *v18;

  v18 = (UIViewController *)a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayInCallViewController view](self, "view"));
  v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "window"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v9, "screen"));

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "_capabilityForKey:", _UIScreenCapabilityInteractionModelsKey));
  LOBYTE(v9) = objc_msgSend(v11, "integerValue");

  if ((v9 & 1) != 0)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController navigationItem](v18, "navigationItem"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "rightBarButtonItem"));

    if (!v13)
    {
      v14 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithBarButtonSystemItem:target:action:", 1, self, "cancelAddCallViewController:");
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController navigationItem](v18, "navigationItem"));
      objc_msgSend(v15, "setRightBarButtonItem:", v14);

    }
  }
  v16 = objc_msgSend(objc_alloc((Class)UITapGestureRecognizer), "initWithTarget:action:", self, "backPressed:");
  objc_msgSend(v16, "setAllowedPressTypes:", &off_100296F60);
  objc_msgSend(v16, "setDelegate:", self);
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "view"));

  objc_msgSend(v17, "addGestureRecognizer:", v16);
  self->_nextBackDismissesNavController = self->_contactsViewController == v18;

}

- (void)backPressed:(id)a3
{
  if (self->_nextBackDismissesNavController)
    -[PHCarPlayInCallViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)cancelAddCallViewController:(id)a3
{
  -[PHCarPlayInCallViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)presentKeypadViewControllerRequestedFromInCallViewController:(id)a3
{
  PHCarPlayInCallKeypadViewController *v4;

  v4 = objc_alloc_init(PHCarPlayInCallKeypadViewController);
  -[PHCarPlayInCallViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v4, 1, 0);

}

- (void)hardwareControlEventNotification:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  char isKindOfClass;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  unsigned __int8 v18;
  id v19;
  NSObject *v20;
  int v21;
  id v22;

  v4 = a3;
  v5 = sub_1000C5588();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v21 = 138412290;
    v22 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "PHCarPlayInCallViewController received hardware control event notification: %@", (uint8_t *)&v21, 0xCu);
  }

  v7 = objc_claimAutoreleasedReturnValue(-[PHCarPlayInCallViewController presentedViewController](self, "presentedViewController"));
  if (!v7
    || (v8 = (void *)v7,
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayInCallViewController presentedViewController](self, "presentedViewController")),
        v11 = objc_opt_class(PHCarPlayInCallKeypadViewController, v10),
        isKindOfClass = objc_opt_isKindOfClass(v9, v11),
        v9,
        v8,
        (isKindOfClass & 1) != 0))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "valueForKey:", kTUCarPlayHardwareControlButtonKey));
    v15 = (void *)kTUCarPlayHardwareControlButtonKeypad;

    if (v14 == v15)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "valueForKey:", kTUCarPlayHardwareControlKeypadValueKey));
      v18 = objc_msgSend(v17, "characterAtIndex:", 0);

      v19 = sub_1000C5588();
      v20 = objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v21) = 0;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Will play DTMF tone because we heard about a hardware key being pressed", (uint8_t *)&v21, 2u);
      }

      +[DialerController playDTMFToneForKey:](DialerController, "playDTMFToneForKey:", v18);
    }
  }

}

- (void)screenDidDisconnectNotification:(id)a3
{
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  PHCarPlayInCallViewController *v11;
  __int16 v12;
  void *v13;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "object"));
  if (objc_msgSend(v4, "_userInterfaceIdiom") == (id)3)
  {
    v5 = sub_1000C5588();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayInCallViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy"));
      v10 = 138412546;
      v11 = self;
      v12 = 2112;
      v13 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "PHCarPlayInCallViewController (%@) heard about a disconnected screen, we'll dismiss outselves from (%@)", (uint8_t *)&v10, 0x16u);

    }
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v8, "removeObserver:", self);

    -[PHCarPlayInCallViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 0, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayInCallViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy"));
    objc_msgSend(v9, "dismiss");

  }
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 1;
}

- (id)preferredFocusEnvironments
{
  void *v3;
  void *v4;
  void *v5;
  id v7;
  objc_super v8;
  void *v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayInCallViewController mainInCallViewController](self, "mainInCallViewController"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayInCallViewController mainInCallViewController](self, "mainInCallViewController"));
    v9 = v4;
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v9, 1));

    return v5;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)PHCarPlayInCallViewController;
    v7 = -[PHCarPlayInCallViewController preferredFocusEnvironments](&v8, "preferredFocusEnvironments");
    return (id)objc_claimAutoreleasedReturnValue(v7);
  }
}

- (void)conversationManager:(id)a3 stateChangedForConversation:(id)a4
{
  if (objc_msgSend(a4, "state", a3) == (id)1)
    -[PHCarPlayInCallViewController updateTPInCallControllerPhoneCalls](self, "updateTPInCallControllerPhoneCalls");
}

- (UIView)flippyViewContainer
{
  return (UIView *)objc_getProperty(self, a2, 24, 1);
}

- (void)setFlippyViewContainer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (PHCarPlayMainInCallViewController)mainInCallViewController
{
  return (PHCarPlayMainInCallViewController *)objc_getProperty(self, a2, 32, 1);
}

- (void)setMainInCallViewController:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (TUHardwareControlsBroadcaster)hardwareControlBroadcaster
{
  return (TUHardwareControlsBroadcaster *)objc_getProperty(self, a2, 40, 1);
}

- (void)setHardwareControlBroadcaster:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hardwareControlBroadcaster, 0);
  objc_storeStrong((id *)&self->_mainInCallViewController, 0);
  objc_storeStrong((id *)&self->_flippyViewContainer, 0);
  objc_storeStrong((id *)&self->_contactsViewController, 0);
}

@end
