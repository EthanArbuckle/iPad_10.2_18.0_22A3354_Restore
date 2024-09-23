@implementation SiriNotificationsSetupViewController

- (SiriNotificationsSetupViewController)init
{
  uint64_t v3;

  v3 = objc_opt_class(SFSiriController, a2);
  return -[SiriNotificationsSetupViewController initWithSiriControllerClass:](self, "initWithSiriControllerClass:", v3);
}

- (SiriNotificationsSetupViewController)initWithSiriControllerClass:(Class)a3
{
  SiriNotificationsSetupViewController *v4;
  SiriNotificationsSetupViewController *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SiriNotificationsSetupViewController;
  v4 = -[SiriNotificationsSetupViewController init](&v7, "init");
  v5 = v4;
  if (v4)
    objc_storeStrong((id *)&v4->_siriControllerClass, a3);
  return v5;
}

- (void)viewDidLoad
{
  uint64_t v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  const __CFString *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  objc_super v34;
  _QWORD v35[5];

  if (dword_1001A8258 <= 30 && (dword_1001A8258 != -1 || _LogCategory_Initialize(&dword_1001A8258, 30)))
    LogPrintF(&dword_1001A8258, "-[SiriNotificationsSetupViewController viewDidLoad]", 30, "SiriNotifications ViewDidLoad\n");
  v34.receiver = self;
  v34.super_class = (Class)SiriNotificationsSetupViewController;
  -[SiriNotificationsSetupViewController viewDidLoad](&v34, "viewDidLoad");
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[SiriNotificationsSetupViewController extendedUserInfo](self, "extendedUserInfo"));
  v4 = objc_msgSend((id)objc_opt_class(self, v3), "modelForUserInfo:", v33);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  -[SiriNotificationsSetupViewController setModel:](self, "setModel:", v5);

  v7 = (void *)objc_opt_class(self, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SiriNotificationsSetupViewController model](self, "model"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "viewModelForModel:", v8));
  -[SiriNotificationsSetupViewController setViewModel:](self, "setViewModel:", v9);

  if (dword_1001A8258 <= 30 && (dword_1001A8258 != -1 || _LogCategory_Initialize(&dword_1001A8258, 30)))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[SiriNotificationsSetupViewController model](self, "model"));
    v11 = (unint64_t)objc_msgSend(v10, "viewType");
    if (v11 > 2)
      v12 = CFSTR("?");
    else
      v12 = off_10017D460[v11];
    LogPrintF(&dword_1001A8258, "-[SiriNotificationsSetupViewController viewDidLoad]", 30, "View type: %@", v12);

  }
  -[SiriNotificationsSetupViewController setDismissalType:](self, "setDismissalType:", 3);
  -[SiriNotificationsSetupViewController setUpTitle](self, "setUpTitle");
  -[SiriNotificationsSetupViewController setUpSubtitle](self, "setUpSubtitle");
  -[SiriNotificationsSetupViewController setUpActions](self, "setUpActions");
  v13 = objc_alloc((Class)UIImageView);
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](UIImage, "imageNamed:", CFSTR("SpokenIcon")));
  v15 = objc_msgSend(v13, "initWithImage:", v14);

  objc_msgSend(v15, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[SiriNotificationsSetupViewController contentView](self, "contentView"));
  objc_msgSend(v16, "addSubview:", v15);

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[SiriNotificationsSetupViewController contentView](self, "contentView"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "mainContentGuide"));

  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "topAnchor"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "topAnchor"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "constraintGreaterThanOrEqualToAnchor:", v31));
  v35[0] = v30;
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "centerXAnchor"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "centerXAnchor"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "constraintEqualToAnchor:", v28));
  v35[1] = v27;
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "bottomAnchor"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "bottomAnchor"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "constraintLessThanOrEqualToAnchor:", v20));
  v35[2] = v21;
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "heightAnchor"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "constraintEqualToConstant:", 76.0));
  v35[3] = v23;
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "widthAnchor"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "constraintEqualToConstant:", 76.0));
  v35[4] = v25;
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v35, 5));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v26);

}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  objc_super v7;

  v3 = a3;
  if (dword_1001A8258 <= 30 && (dword_1001A8258 != -1 || _LogCategory_Initialize(&dword_1001A8258, 30)))
    LogPrintF(&dword_1001A8258, "-[SiriNotificationsSetupViewController viewWillAppear:]", 30, "SiriNotifications ViewWillAppear\n");
  v7.receiver = self;
  v7.super_class = (Class)SiriNotificationsSetupViewController;
  -[SiriNotificationsSetupViewController viewWillAppear:](&v7, "viewWillAppear:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SiriNotificationsSetupViewController mainController](self, "mainController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "announceMessagesEvent"));
  objc_msgSend(v6, "setPairingExitView:", 3);

}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  uint64_t v5;
  int v6;
  objc_class *v7;
  void *v8;
  void *v9;
  unsigned int v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)SiriNotificationsSetupViewController;
  -[SiriNotificationsSetupViewController viewDidAppear:](&v11, "viewDidAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[AFPreferences sharedPreferences](AFPreferences, "sharedPreferences"));
  objc_msgSend(v4, "setSpokenNotificationsProxCardSeen");

  if (dword_1001A8258 <= 30)
  {
    if (dword_1001A8258 != -1 || (v5 = _LogCategory_Initialize(&dword_1001A8258, 30), (_DWORD)v5))
      v5 = LogPrintF(&dword_1001A8258, "-[SiriNotificationsSetupViewController viewDidAppear:]", 30, "Recording user has seen SiriNotifications opt-out card\n");
  }
  v6 = SFIsAnnounceCallsEnabled(v5);
  v7 = -[SiriNotificationsSetupViewController siriControllerClass](self, "siriControllerClass");
  if (v6)
    -[objc_class setHasUserSeenAnnounceCallsOptOutScreen:](v7, "setHasUserSeenAnnounceCallsOptOutScreen:", 1);
  else
    -[objc_class setHasUserSeenAnnounceMessagesOptOutScreen:](v7, "setHasUserSeenAnnounceMessagesOptOutScreen:", 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SiriNotificationsSetupViewController model](self, "model"));
  if ((objc_msgSend(v8, "isSiriAllowedWhileLocked") & 1) != 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[SiriNotificationsSetupViewController model](self, "model"));
    v10 = objc_msgSend(v9, "isUpsellFlow");

    if (v10)
    {
      -[objc_class setAnnounceMessagesEnabled:](-[SiriNotificationsSetupViewController siriControllerClass](self, "siriControllerClass"), "setAnnounceMessagesEnabled:", 1);
      -[SiriNotificationsSetupViewController updateAnnounceCallsStateForUserOptedIn](self, "updateAnnounceCallsStateForUserOptedIn");
    }
  }
  else
  {

  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  if (dword_1001A8258 <= 30 && (dword_1001A8258 != -1 || _LogCategory_Initialize(&dword_1001A8258, 30)))
    LogPrintF(&dword_1001A8258, "-[SiriNotificationsSetupViewController viewDidDisappear:]", 30, "SiriNotifications ViewDidDisappear\n");
  v5.receiver = self;
  v5.super_class = (Class)SiriNotificationsSetupViewController;
  -[SiriNotificationsSetupViewController viewDidDisappear:](&v5, "viewDidDisappear:", v3);
}

- (id)deviceName
{
  id WeakRetained;
  void *v3;
  void *v4;
  unsigned int Int64Ranged;
  void *v6;
  id v8;

  WeakRetained = objc_loadWeakRetained((id *)&self->_mainController);
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "localizedName"));

  if (!v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "userInfo"));
    Int64Ranged = CFDictionaryGetInt64Ranged(v4, CFSTR("pid"), 0, 0xFFFFFFFFLL, 0);

    v8 = 0;
    sub_100116514(Int64Ranged, 0, 1, 0, &v8, 0, 0);
    objc_msgSend(WeakRetained, "setLocalizedName:", v8);

  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "localizedName"));

  return v6;
}

- (id)extendedUserInfo
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SiriNotificationsSetupViewController mainController](self, "mainController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "userInfo"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", v4));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SiriNotificationsSetupViewController deviceName](self, "deviceName"));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, CFSTR("localizedDeviceName"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v3, "inEarDetection")));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, CFSTR("inEarDetection"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithDictionary:](NSDictionary, "dictionaryWithDictionary:", v5));
  return v8;
}

- (void)setUpTitle
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = (id)objc_claimAutoreleasedReturnValue(+[PRXTextView textViewWithStyle:](PRXTextView, "textViewWithStyle:", 0));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SiriNotificationsSetupViewController viewModel](self, "viewModel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "titleText"));
  objc_msgSend(v10, "setTitleText:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SiriNotificationsSetupViewController viewModel](self, "viewModel"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "titleFont"));
  objc_msgSend(v10, "setFont:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SiriNotificationsSetupViewController viewModel](self, "viewModel"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "titleColor"));
  objc_msgSend(v10, "setTextColor:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[SiriNotificationsSetupViewController contentView](self, "contentView"));
  objc_msgSend(v9, "setTitleView:", v10);

}

- (void)setUpSubtitle
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = (id)objc_claimAutoreleasedReturnValue(+[PRXLabel labelWithStyle:](PRXLabel, "labelWithStyle:", 1));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SiriNotificationsSetupViewController viewModel](self, "viewModel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "subtitleFont"));
  objc_msgSend(v8, "setFont:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SiriNotificationsSetupViewController viewModel](self, "viewModel"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "subtitleText"));
  objc_msgSend(v8, "setText:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SiriNotificationsSetupViewController contentView](self, "contentView"));
  objc_msgSend(v7, "setSubtitleLabel:", v8);

}

- (void)setUpActions
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  unsigned int v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void **v24;
  uint64_t v25;
  void (*v26)(uint64_t);
  void *v27;
  id v28;
  _QWORD v29[4];
  id v30;
  _QWORD v31[4];
  id v32;
  id location;

  location = 0;
  objc_initWeak(&location, self);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SiriNotificationsSetupViewController viewModel](self, "viewModel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "primaryActionTitle"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SiriNotificationsSetupViewController viewModel](self, "viewModel"));
  v6 = objc_msgSend(v5, "primaryActionStyle");

  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_1000E2C4C;
  v31[3] = &unk_10017E008;
  objc_copyWeak(&v32, &location);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[PRXAction actionWithTitle:style:handler:](PRXAction, "actionWithTitle:style:handler:", v4, v6, v31));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SiriNotificationsSetupViewController viewModel](self, "viewModel"));
  objc_msgSend(v7, "setUsesLegacyStyling:", objc_msgSend(v8, "primaryActionUsesLegacyStyling"));

  v9 = -[SiriNotificationsSetupViewController addAction:](self, "addAction:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[SiriNotificationsSetupViewController viewModel](self, "viewModel"));
  v11 = objc_msgSend(v10, "secondaryActionAvailable");

  if (v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[SiriNotificationsSetupViewController viewModel](self, "viewModel"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "secondaryActionTitle"));

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[SiriNotificationsSetupViewController viewModel](self, "viewModel"));
    v15 = objc_msgSend(v14, "secondaryActionStyle");

    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_1000E2C78;
    v29[3] = &unk_10017E008;
    objc_copyWeak(&v30, &location);
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[PRXAction actionWithTitle:style:handler:](PRXAction, "actionWithTitle:style:handler:", v13, v15, v29));
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[SiriNotificationsSetupViewController viewModel](self, "viewModel"));
    objc_msgSend(v16, "setUsesLegacyStyling:", objc_msgSend(v17, "secondaryActionUsesLegacyStyling"));

    v18 = -[SiriNotificationsSetupViewController addAction:](self, "addAction:", v16);
    objc_destroyWeak(&v30);

  }
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[SiriNotificationsSetupViewController viewModel](self, "viewModel"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "dismissActionTitle"));

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[SiriNotificationsSetupViewController viewModel](self, "viewModel"));
  v22 = objc_msgSend(v21, "dismissActionStyle");

  v24 = _NSConcreteStackBlock;
  v25 = 3221225472;
  v26 = sub_1000E2CA4;
  v27 = &unk_10017E008;
  objc_copyWeak(&v28, &location);
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[PRXAction actionWithTitle:style:handler:](PRXAction, "actionWithTitle:style:handler:", v20, v22, &v24));
  -[SiriNotificationsSetupViewController setDismissButtonAction:](self, "setDismissButtonAction:", v23, v24, v25, v26, v27);

  objc_destroyWeak(&v28);
  objc_destroyWeak(&v32);

  objc_destroyWeak(&location);
}

- (void)logDismissEventForAnnounceMessagesToDuet
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v2 = (void *)MGCopyAnswer(CFSTR("BuildVersion"), 0);
  if (v2)
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("iOS-"), "stringByAppendingString:", v2));
  else
    v3 = 0;
  v4 = objc_alloc_init((Class)NSMutableDictionary);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[_DKDiscoverabilitySignalsMetadataKey osBuild](_DKDiscoverabilitySignalsMetadataKey, "osBuild"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v3, v5);

  v6 = objc_msgSend(objc_alloc((Class)_DKSource), "initWithIdentifier:bundleIdentifier:itemIdentifier:groupIdentifier:deviceIdentifier:userIdentifier:", 0, CFSTR("com.apple.Sharing"), 0, 0, 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[_DKSystemEventStreams discoverabilitySignalsStream](_DKSystemEventStreams, "discoverabilitySignalsStream"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[_DKEvent eventWithStream:source:startDate:endDate:identifierStringValue:metadata:](_DKEvent, "eventWithStream:source:startDate:endDate:identifierStringValue:metadata:", v8, v6, v7, v7, CFSTR("com.apple.siri.spoken-messages.opt-in.dismissed"), v4));

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[_DKKnowledgeStore knowledgeStore](_DKKnowledgeStore, "knowledgeStore"));
  v12 = v9;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v12, 1));
  objc_msgSend(v10, "saveObjects:responseQueue:withCompletion:", v11, 0, &stru_10017D410);

}

- (void)handleDismissForMessages
{
  void *v3;
  id WeakRetained;

  -[SiriNotificationsSetupViewController logDismissEventForAnnounceMessagesToDuet](self, "logDismissEventForAnnounceMessagesToDuet");
  WeakRetained = objc_loadWeakRetained((id *)&self->_mainController);
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "announceMessagesEvent"));
  objc_msgSend(v3, "setUserExplicitlyOptedIn:", 1);

}

- (void)handleDismissButton
{
  void *v3;
  id v4;
  id WeakRetained;

  if (dword_1001A8258 <= 30 && (dword_1001A8258 != -1 || _LogCategory_Initialize(&dword_1001A8258, 30)))
    LogPrintF(&dword_1001A8258, "-[SiriNotificationsSetupViewController handleDismissButton]", 30, "SiriNotifications Dismiss button\n");
  WeakRetained = objc_loadWeakRetained((id *)&self->_mainController);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SiriNotificationsSetupViewController model](self, "model"));
  v4 = objc_msgSend(v3, "viewType");

  if (v4 == (id)2)
  {
    -[SiriNotificationsSetupViewController handleDismissForMessages](self, "handleDismissForMessages");
    goto LABEL_10;
  }
  if (v4 == (id)1)
  {
LABEL_10:
    -[SiriNotificationsSetupViewController handleDismissForCalls](self, "handleDismissForCalls");
    goto LABEL_11;
  }
  if (v4)
  {
    if (dword_1001A8258 <= 90
      && (dword_1001A8258 != -1 || _LogCategory_Initialize(&dword_1001A8258, 90)))
    {
      LogPrintF(&dword_1001A8258, "-[SiriNotificationsSetupViewController handleDismissButton]", 90, "Unable to fully handle dismiss - unknown viewType %d", (_DWORD)v4);
    }
  }
  else
  {
    -[SiriNotificationsSetupViewController handleDismissForMessages](self, "handleDismissForMessages");
  }
LABEL_11:
  objc_msgSend(WeakRetained, "dismiss:", 5);

}

- (void)handleContinueForMessages
{
  void *v3;
  id v4;

  -[objc_class setAnnounceMessagesEnabled:](-[SiriNotificationsSetupViewController siriControllerClass](self, "siriControllerClass"), "setAnnounceMessagesEnabled:", 1);
  v4 = (id)objc_claimAutoreleasedReturnValue(-[SiriNotificationsSetupViewController mainController](self, "mainController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "announceMessagesEvent"));
  objc_msgSend(v3, "setUserExplicitlyOptedIn:", 1);

}

- (void)handleContinueButton
{
  void *v3;
  id v4;

  if (dword_1001A8258 <= 30 && (dword_1001A8258 != -1 || _LogCategory_Initialize(&dword_1001A8258, 30)))
    LogPrintF(&dword_1001A8258, "-[SiriNotificationsSetupViewController handleContinueButton]", 30, "SiriNotifications Continue Button\n");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SiriNotificationsSetupViewController model](self, "model"));
  v4 = objc_msgSend(v3, "viewType");

  if (v4 == (id)2)
  {
    -[SiriNotificationsSetupViewController handleContinueForMessages](self, "handleContinueForMessages");
    goto LABEL_10;
  }
  if (v4 == (id)1)
  {
LABEL_10:
    -[SiriNotificationsSetupViewController handleContinueForCalls](self, "handleContinueForCalls");
    goto LABEL_11;
  }
  if (v4)
  {
    if (dword_1001A8258 <= 90
      && (dword_1001A8258 != -1 || _LogCategory_Initialize(&dword_1001A8258, 90)))
    {
      LogPrintF(&dword_1001A8258, "-[SiriNotificationsSetupViewController handleContinueButton]", 90, "Unable to fully handle continue - unknown viewType %d", (_DWORD)v4);
    }
  }
  else
  {
    -[SiriNotificationsSetupViewController handleContinueForMessages](self, "handleContinueForMessages");
  }
LABEL_11:
  -[SiriNotificationsSetupViewController transitionToNextCardIfNecessary](self, "transitionToNextCardIfNecessary");
}

- (void)handleDoNotForMessages
{
  void *v3;
  id v4;

  -[objc_class setAnnounceMessagesEnabled:](-[SiriNotificationsSetupViewController siriControllerClass](self, "siriControllerClass"), "setAnnounceMessagesEnabled:", 0);
  v4 = (id)objc_claimAutoreleasedReturnValue(-[SiriNotificationsSetupViewController mainController](self, "mainController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "announceMessagesEvent"));
  objc_msgSend(v3, "setUserExplicitlyOptedOut:", 0);

}

- (void)handleDoNotAnnounceButton
{
  void *v3;
  id v4;

  if (dword_1001A8258 <= 30 && (dword_1001A8258 != -1 || _LogCategory_Initialize(&dword_1001A8258, 30)))
    LogPrintF(&dword_1001A8258, "-[SiriNotificationsSetupViewController handleDoNotAnnounceButton]", 30, "SiriNotifications Don't Announce Button\n");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SiriNotificationsSetupViewController model](self, "model"));
  v4 = objc_msgSend(v3, "viewType");

  if (v4 == (id)2)
    goto LABEL_8;
  if (v4 != (id)1)
  {
    if (!v4)
    {
LABEL_8:
      -[SiriNotificationsSetupViewController handleDoNotForMessages](self, "handleDoNotForMessages");
      goto LABEL_9;
    }
    if (dword_1001A8258 <= 90
      && (dword_1001A8258 != -1 || _LogCategory_Initialize(&dword_1001A8258, 90)))
    {
      LogPrintF(&dword_1001A8258, "-[SiriNotificationsSetupViewController handleDoNotAnnounceButton]", 90, "Unable to fully handle not now - unknown viewType %d", (_DWORD)v4);
    }
  }
LABEL_9:
  -[SiriNotificationsSetupViewController transitionToNextCardIfNecessary](self, "transitionToNextCardIfNecessary");
}

- (void)updateAnnounceCallsStateForUserOptedIn
{
  void *v3;
  unsigned int v4;

  if (SFIsAnnounceCallsEnabled(self))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[SiriNotificationsSetupViewController model](self, "model"));
    v4 = objc_msgSend(v3, "isSiriAllowedWhileLocked");

    if (v4)
    {
      if (!-[objc_class announceCallsState](-[SiriNotificationsSetupViewController siriControllerClass](self, "siriControllerClass"), "announceCallsState"))
      {
        -[objc_class setAnnounceCallsState:](-[SiriNotificationsSetupViewController siriControllerClass](self, "siriControllerClass"), "setAnnounceCallsState:", 3);
        -[SiriNotificationsSetupViewController announceCallsEnabledDonateTip](self, "announceCallsEnabledDonateTip");
      }
    }
  }
}

- (void)transitionToNextCardIfNecessary
{
  void *v3;
  unsigned int v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_mainController);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SiriNotificationsSetupViewController model](self, "model"));
  v4 = objc_msgSend(v3, "isUpsellFlow");

  if (v4)
  {
    objc_msgSend(WeakRetained, "dismiss:", 9);
  }
  else if (objc_msgSend(WeakRetained, "shouldShowSpatialAudioSetUp"))
  {
    objc_msgSend(WeakRetained, "showSpatialAudioTutorial");
  }
  else
  {
    objc_msgSend(WeakRetained, "showStatus:", 0);
  }

}

- (void)announceCallsEnabledDonateTip
{
  void *v2;
  id v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(+[BMStreams discoverabilitySignal](BMStreams, "discoverabilitySignal"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "source"));
  v3 = objc_msgSend(objc_alloc((Class)BMDiscoverabilitySignalEvent), "initWithIdentifier:bundleID:context:", CFSTR("com.apple.siri.announce-calls.enabled"), CFSTR("com.apple.sharingd"), 0);
  objc_msgSend(v2, "sendEvent:", v3);

}

- (SiriNotificationsSetupProxPairingControllerProxy)mainController
{
  return (SiriNotificationsSetupProxPairingControllerProxy *)objc_loadWeakRetained((id *)&self->_mainController);
}

- (void)setMainController:(id)a3
{
  objc_storeWeak((id *)&self->_mainController, a3);
}

- (Class)siriControllerClass
{
  return self->_siriControllerClass;
}

- (SiriNotificationsSetupModel)model
{
  return self->_model;
}

- (void)setModel:(id)a3
{
  objc_storeStrong((id *)&self->_model, a3);
}

- (SiriNotificationsSetupViewModel)viewModel
{
  return self->_viewModel;
}

- (void)setViewModel:(id)a3
{
  objc_storeStrong((id *)&self->_viewModel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_siriControllerClass, 0);
  objc_destroyWeak((id *)&self->_mainController);
}

+ (id)modelForUserInfo:(id)a3 siriControllerClass:(Class)a4
{
  id v5;
  SiriNotificationsSetupModel *v6;
  CFTypeID TypeID;
  unsigned int v8;
  unsigned int v9;
  uint64_t v10;
  uint64_t v11;

  v5 = a3;
  v6 = objc_alloc_init(SiriNotificationsSetupModel);
  if (v5)
  {
    -[SiriNotificationsSetupModel setDeviceProductID:](v6, "setDeviceProductID:", CFDictionaryGetInt64Ranged(v5, CFSTR("pid"), 0, 0xFFFFFFFFLL, 0));
    -[SiriNotificationsSetupModel setDeviceSupportsInEarDetection:](v6, "setDeviceSupportsInEarDetection:", CFDictionaryGetInt64(v5, CFSTR("inEarDetection"), 0) != 0);
    -[SiriNotificationsSetupModel setIsSiriAllowedWhileLocked:](v6, "setIsSiriAllowedWhileLocked:", -[objc_class isSiriAllowedWhileLocked](a4, "isSiriAllowedWhileLocked"));
    -[SiriNotificationsSetupModel setIsUpsellFlow:](v6, "setIsUpsellFlow:", CFDictionaryGetInt64(v5, CFSTR("siriNote"), 0) != 0);
    TypeID = CFStringGetTypeID();
    -[SiriNotificationsSetupModel setLocalizedDeviceName:](v6, "setLocalizedDeviceName:", CFDictionaryGetTypedValue(v5, CFSTR("localizedDeviceName"), TypeID, 0));
    v8 = -[objc_class shouldPromptForAnnounceMessagesForProductID:isUpsellFlow:](a4, "shouldPromptForAnnounceMessagesForProductID:isUpsellFlow:", -[SiriNotificationsSetupModel deviceProductID](v6, "deviceProductID"), -[SiriNotificationsSetupModel isUpsellFlow](v6, "isUpsellFlow"));
    v9 = -[objc_class shouldPromptForAnnounceCallsForProductID:supportsInEarDetection:isUpsellFlow:](a4, "shouldPromptForAnnounceCallsForProductID:supportsInEarDetection:isUpsellFlow:", -[SiriNotificationsSetupModel deviceProductID](v6, "deviceProductID"), -[SiriNotificationsSetupModel deviceSupportsInEarDetection](v6, "deviceSupportsInEarDetection"), -[SiriNotificationsSetupModel isUpsellFlow](v6, "isUpsellFlow"));
    if ((v8 & 1) != 0 || v9)
    {
      v10 = 2;
      if ((v8 & v9) == 0)
        v10 = 0;
      if (v8)
        v11 = v10;
      else
        v11 = 1;
      -[SiriNotificationsSetupModel setViewType:](v6, "setViewType:", v11);
    }
  }
  else if (dword_1001A8258 <= 115
         && (dword_1001A8258 != -1 || _LogCategory_Initialize(&dword_1001A8258, 115)))
  {
    LogPrintF(&dword_1001A8258, "+[SiriNotificationsSetupViewController modelForUserInfo:siriControllerClass:]", 115, "No user info");
  }

  return v6;
}

+ (id)modelForUserInfo:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;

  v4 = a3;
  v6 = objc_msgSend(a1, "modelForUserInfo:siriControllerClass:", v4, objc_opt_class(SFSiriController, v5));
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  return v7;
}

+ (id)locIntermediateStringForViewType:(int64_t)a3
{
  const __CFString *v4;

  if ((unint64_t)a3 < 3)
    return off_10017D430[a3];
  v4 = CFSTR("MESSAGES_AND_CALLS");
  if (dword_1001A8258 <= 30 && (dword_1001A8258 != -1 || _LogCategory_Initialize(&dword_1001A8258, 30)))
    LogPrintF(&dword_1001A8258, "+[SiriNotificationsSetupViewController locIntermediateStringForViewType:]", 30, "Unhandled view type %d, assuming %@", a3, CFSTR("MESSAGES_AND_CALLS"));
  return (id)v4;
}

+ (id)locTableForViewType:(int64_t)a3
{
  const __CFString *v4;

  if ((unint64_t)a3 < 3)
    return off_10017D448[a3];
  v4 = CFSTR("Localizable-AnnounceTelephony");
  if (dword_1001A8258 <= 30 && (dword_1001A8258 != -1 || _LogCategory_Initialize(&dword_1001A8258, 30)))
    LogPrintF(&dword_1001A8258, "+[SiriNotificationsSetupViewController locTableForViewType:]", 30, "Unhandled view type %d, assuming %@", a3, CFSTR("Localizable-AnnounceTelephony"));
  return (id)v4;
}

+ (id)defaultDismissActionTitle
{
  return &stru_10017E3D8;
}

+ (int64_t)defaultDismissActionStyle
{
  return 0;
}

+ (int64_t)defaultPrimaryActionStyle
{
  return 0;
}

+ (BOOL)defaultPrimaryActionUsesLegacyStyling
{
  return 1;
}

+ (int64_t)defaultSecondaryActionStyle
{
  return 1;
}

+ (BOOL)defaultSecondaryActionUsesLegacyStyling
{
  return 1;
}

+ (id)defaultSubtitleFont
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UITraitCollection traitCollectionWithPreferredContentSizeCategory:](UITraitCollection, "traitCollectionWithPreferredContentSizeCategory:", UIContentSizeCategoryLarge));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIFontDescriptor preferredFontDescriptorWithTextStyle:compatibleWithTraitCollection:](UIFontDescriptor, "preferredFontDescriptorWithTextStyle:compatibleWithTraitCollection:", UIFontTextStyleSubheadline, v2));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "fontDescriptorWithSymbolicTraits:", 0x8000));

  objc_msgSend(v4, "pointSize");
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont fontWithDescriptor:size:](UIFont, "fontWithDescriptor:size:", v4));

  return v5;
}

+ (id)defaultTitleColor
{
  return +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.368627451, 0.368627451, 0.368627451, 1.0);
}

+ (id)defaultTitleFont
{
  return +[UIFont systemFontOfSize:weight:](UIFont, "systemFontOfSize:weight:", 30.0, UIFontWeightLight);
}

+ (id)viewModelForModel:(id)a3
{
  id v4;
  SiriNotificationsSetupViewModel *v5;
  void *v6;
  _UNKNOWN **v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  void *v25;
  void *v26;
  id v27;
  unsigned int v28;
  unsigned int v29;
  const __CFString *v30;
  const __CFString *v31;
  __CFString *v32;
  id v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;

  v4 = a3;
  v5 = objc_alloc_init(SiriNotificationsSetupViewModel);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "locIntermediateStringForViewType:", objc_msgSend(v4, "viewType")));
  v7 = &_ss5ErrorP10FoundationAC13CustomNSErrorRzrlE7_domainSSvg_ptr;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("ANNOUNCE_%@"), v6));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "locTableForViewType:", objc_msgSend(v4, "viewType")));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@_TITLE"), v8));
  v11 = sub_1001171A8(v9, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  -[SiriNotificationsSetupViewModel setTitleText:](v5, "setTitleText:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "defaultTitleFont"));
  -[SiriNotificationsSetupViewModel setTitleFont:](v5, "setTitleFont:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "defaultTitleColor"));
  -[SiriNotificationsSetupViewModel setTitleColor:](v5, "setTitleColor:", v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "defaultSubtitleFont"));
  -[SiriNotificationsSetupViewModel setSubtitleFont:](v5, "setSubtitleFont:", v15);

  if (objc_msgSend(v4, "isSiriAllowedWhileLocked"))
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@_SUBTITLE_FORMAT"), v8));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedDeviceName"));
    v24 = sub_10011743C(v9, v16, v18, v19, v20, v21, v22, v23, (uint64_t)v17);
    v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
    -[SiriNotificationsSetupViewModel setSubtitleText:](v5, "setSubtitleText:", v25);

    v7 = &_ss5ErrorP10FoundationAC13CustomNSErrorRzrlE7_domainSSvg_ptr;
  }
  else
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@_SUBTITLE_LOCKED"), v8));

    v27 = sub_1001171A8(v9, v26);
    v16 = (void *)objc_claimAutoreleasedReturnValue(v27);
    -[SiriNotificationsSetupViewModel setSubtitleText:](v5, "setSubtitleText:", v16);
    v10 = v26;
  }

  -[SiriNotificationsSetupViewModel setPrimaryActionStyle:](v5, "setPrimaryActionStyle:", objc_msgSend(a1, "defaultPrimaryActionStyle"));
  -[SiriNotificationsSetupViewModel setPrimaryActionUsesLegacyStyling:](v5, "setPrimaryActionUsesLegacyStyling:", 1);
  v28 = objc_msgSend(v4, "isSiriAllowedWhileLocked");
  v29 = objc_msgSend(v4, "isUpsellFlow");
  v30 = CFSTR("SET_UP_LATER");
  v31 = CFSTR("CONTINUE");
  if (v29)
  {
    v30 = CFSTR("CONTINUE");
    v31 = CFSTR("OK_BUTTON_TITLE");
  }
  if (v28)
    v32 = (__CFString *)v31;
  else
    v32 = (__CFString *)v30;
  v33 = sub_1001171A8(CFSTR("Localizable"), v32);
  v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
  -[SiriNotificationsSetupViewModel setPrimaryActionTitle:](v5, "setPrimaryActionTitle:", v34);

  if (objc_msgSend(v4, "isSiriAllowedWhileLocked"))
  {
    -[SiriNotificationsSetupViewModel setSecondaryActionAvailable:](v5, "setSecondaryActionAvailable:", 1);
    -[SiriNotificationsSetupViewModel setSecondaryActionStyle:](v5, "setSecondaryActionStyle:", objc_msgSend(a1, "defaultSecondaryActionStyle"));
    -[SiriNotificationsSetupViewModel setSecondaryActionUsesLegacyStyling:](v5, "setSecondaryActionUsesLegacyStyling:", 1);
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7[214], "stringWithFormat:", CFSTR("%@_TURN_OFF"), v8));

    v36 = sub_1001171A8(v9, v35);
    v37 = (void *)objc_claimAutoreleasedReturnValue(v36);
    -[SiriNotificationsSetupViewModel setSecondaryActionTitle:](v5, "setSecondaryActionTitle:", v37);

    v10 = v35;
  }
  -[SiriNotificationsSetupViewModel setDismissActionTitle:](v5, "setDismissActionTitle:", &stru_10017E3D8);
  -[SiriNotificationsSetupViewModel setDismissActionStyle:](v5, "setDismissActionStyle:", 0);

  return v5;
}

@end
