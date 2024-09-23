@implementation MPIntentViewController

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MPIntentViewController;
  -[MPIntentViewController viewDidLoad](&v6, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MPIntentViewController view](self, "view"));
  objc_msgSend(v4, "setBackgroundColor:", v3);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MPIntentViewController view](self, "view"));
  objc_msgSend(v5, "setOpaque:", 0);

  -[MPIntentViewController setCountdownCancelled:](self, "setCountdownCancelled:", 0);
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  char isKindOfClass;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  _QWORD v13[5];
  uint8_t buf[16];
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)MPIntentViewController;
  -[MPIntentViewController viewDidAppear:](&v15, "viewDidAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MPIntentViewController intent](self, "intent"));
  v5 = objc_opt_class(INStartCallIntent);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
  {

  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MPIntentViewController intent](self, "intent"));
    v7 = objc_opt_class(INStartAudioCallIntent);
    isKindOfClass = objc_opt_isKindOfClass(v6, v7);

    if ((isKindOfClass & 1) == 0)
      return;
  }
  if (!-[MPIntentViewController countdownCancelled](self, "countdownCancelled"))
  {
    v9 = PHDefaultLog();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Disabling application idleTimer for CallIntentCountdown: countdownStarted", buf, 2u);
    }

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    objc_msgSend(v11, "_setIdleTimerDisabled:forReason:", 1, CFSTR("CallIntentCountdown"));

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[MPIntentViewController countdownView](self, "countdownView"));
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10000810C;
    v13[3] = &unk_10007D440;
    v13[4] = self;
    objc_msgSend(v12, "startCountdownFromNumber:withTimeInterval:completion:", 3, v13, COERCE_DOUBLE((unint64_t)COERCE_UNSIGNED_INT(2.0)));

  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  uint8_t v6[16];
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MPIntentViewController;
  -[MPIntentViewController viewWillDisappear:](&v7, "viewWillDisappear:", a3);
  v3 = PHDefaultLog();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Enabling application idleTimer for CallIntentCountdown: viewWillDisappear", v6, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  objc_msgSend(v5, "_setIdleTimerDisabled:forReason:", 0, CFSTR("CallIntentCountdown"));

}

- (void)configureViewForParameters:(id)a3 ofInteraction:(id)a4 interactiveBehavior:(unint64_t)a5 context:(unint64_t)a6 completion:(id)a7
{
  id v10;
  void (**v11)(id, _QWORD, void *, double, double);
  id v12;
  id v13;
  NSObject *v14;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  char isKindOfClass;
  void *v24;
  uint64_t v25;
  char v26;
  id v27;
  NSObject *v28;
  void *v29;
  int v30;
  void *v31;

  v10 = a4;
  v11 = (void (**)(id, _QWORD, void *, double, double))a7;
  v12 = a3;
  -[MPIntentViewController setInteraction:](self, "setInteraction:", v10);
  v13 = PHDefaultLog();
  v14 = objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "intent"));
    v30 = 138412290;
    v31 = v15;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Intent: %@", (uint8_t *)&v30, 0xCu);

  }
  v16 = PHDefaultLog();
  v17 = objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "intentResponse"));
    v30 = 138412290;
    v31 = v18;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "IntentResponse: %@", (uint8_t *)&v30, 0xCu);

  }
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[MPIntentViewController intent](self, "intent"));
  v20 = objc_opt_class(INStartCallIntent);
  if ((objc_opt_isKindOfClass(v19, v20) & 1) != 0)
  {

LABEL_8:
    -[MPIntentViewController configureViewForEmergencyCountdown](self, "configureViewForEmergencyCountdown");
    goto LABEL_9;
  }
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[MPIntentViewController intent](self, "intent"));
  v22 = objc_opt_class(INStartAudioCallIntent);
  isKindOfClass = objc_opt_isKindOfClass(v21, v22);

  if ((isKindOfClass & 1) != 0)
    goto LABEL_8;
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[MPIntentViewController intent](self, "intent"));
  v25 = objc_opt_class(INSearchCallHistoryIntent);
  v26 = objc_opt_isKindOfClass(v24, v25);

  if ((v26 & 1) != 0)
  {
    -[MPIntentViewController configureForCallHistory](self, "configureForCallHistory");
  }
  else
  {
    v27 = PHDefaultLog();
    v28 = objc_claimAutoreleasedReturnValue(v27);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      sub_100052180(self);

    v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet set](NSSet, "set"));
    v11[2](v11, 0, v29, CGSizeZero.width, CGSizeZero.height);

  }
LABEL_9:
  -[MPIntentViewController desiredSize](self, "desiredSize");
  ((void (*)(void (**)(id, _QWORD, void *, double, double), uint64_t, id))v11[2])(v11, 1, v12);

}

- (void)viewWasCancelled
{
  id v3;
  NSObject *v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  uint8_t v9[16];
  uint8_t buf[16];

  v3 = PHDefaultLog();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "our view was cancelled, stopping countdown", buf, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MPIntentViewController countdownView](self, "countdownView"));
  objc_msgSend(v5, "cancel");

  -[MPIntentViewController setCountdownCancelled:](self, "setCountdownCancelled:", 1);
  v6 = PHDefaultLog();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Enabling application idleTimer for CallIntentCountdown: viewWasCancelled", v9, 2u);
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  objc_msgSend(v8, "_setIdleTimerDisabled:forReason:", 0, CFSTR("CallIntentCountdown"));

}

- (void)configureViewForParameters:(id)a3 ofInteraction:(id)a4 context:(unint64_t)a5 completion:(id)a6
{
  -[MPIntentViewController configureViewForParameters:ofInteraction:interactiveBehavior:context:completion:](self, "configureViewForParameters:ofInteraction:interactiveBehavior:context:completion:", a3, a4, 0, a5, a6);
}

- (void)desiresInteractivity:(id)a3
{
  (*((void (**)(id, uint64_t))a3 + 2))(a3, 1);
}

- (id)intent
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MPIntentViewController interaction](self, "interaction"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "intent"));

  return v3;
}

- (id)callRecords
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MPIntentViewController interaction](self, "interaction"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "intentResponse"));

  v4 = objc_opt_class(INSearchCallHistoryIntentResponse);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) == 0)
  {
    v15 = PHDefaultLog();
    v7 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_100052240(v7, v16, v17, v18, v19, v20, v21, v22);
    v5 = 0;
    goto LABEL_8;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "callRecords"));
  if (!objc_msgSend(v5, "count"))
  {
    v6 = PHDefaultLog();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_10005220C(v7, v8, v9, v10, v11, v12, v13, v14);
LABEL_8:

  }
  return v5;
}

- (id)callHistoryManager
{
  if (qword_100092248 != -1)
    dispatch_once(&qword_100092248, &stru_10007D5D0);
  return (id)qword_100092240;
}

- (id)callHistoryCache
{
  if (qword_100092258 != -1)
    dispatch_once(&qword_100092258, &stru_10007D5F0);
  return (id)qword_100092250;
}

- (id)recentCallForCallRecord:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  id v18;
  NSObject *v19;
  uint64_t v20;
  uint8_t buf[4];
  void *v23;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MPIntentViewController callHistoryCache](self, "callHistoryCache"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", v5));

  if (!v7)
  {
    v8 = PHDefaultLog();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v23 = v5;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Searching for calls with identifier: %@", buf, 0xCu);
    }

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("unique_id == %@"), v5));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MPIntentViewController callHistoryManager](self, "callHistoryManager"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "callsWithPredicate:limit:offset:batchSize:", v10, 1, 0, 1));

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[MPIntentViewController callHistoryCache](self, "callHistoryCache"));
    v13 = v12;
    if (v7)
      v14 = v7;
    else
      v14 = &__NSArray0__struct;
    objc_msgSend(v12, "setObject:forKey:", v14, v5);

  }
  if (objc_msgSend(v7, "count") != (id)1)
  {
    v15 = PHDefaultLog();
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      sub_1000522DC(v7);

  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "firstObject"));
  if (!v17)
  {
    v18 = PHDefaultLog();
    v19 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      sub_100052274((uint64_t)v4, v19, v20);

  }
  return v17;
}

- (id)voicemailForCallRecord:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  uint64_t v10;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "identifier"));
  v5 = objc_msgSend(v4, "longLongValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MPIntentViewController voicemailManager](self, "voicemailManager"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "voicemailWithIdentifier:", v5));

  if (!v7)
  {
    v8 = PHDefaultLog();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_10005234C((uint64_t)v4, v9, v10);

  }
  return v7;
}

- (double)calculatedHeightForCallRecordCellsWithWidth:(double)a3
{
  void *v5;
  id v6;
  unint64_t v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  MPVisualMessage *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  id v27;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MPIntentViewController callRecords](self, "callRecords"));
  v6 = objc_msgSend(v5, "count");

  if (!v6)
    return 0.0;
  v7 = 0;
  v8 = 0.0;
  do
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MPIntentViewController callRecords](self, "callRecords"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndexedSubscript:", v7));

    if (objc_msgSend(v10, "callRecordType") == (id)5)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[MPIntentViewController voicemailForCallRecord:](self, "voicemailForCallRecord:", v10));
      if (v11)
      {
        v12 = -[MPVisualMessage initWithVMVoicemail:]([MPVisualMessage alloc], "initWithVMVoicemail:", v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[MPIntentViewController prototypeVoicemailCell](self, "prototypeVoicemailCell"));
        -[MPIntentViewController configureVoicemailTableViewCell:forVoicemail:](self, "configureVoicemailTableViewCell:forVoicemail:", v13, v12);

        v14 = (void *)objc_claimAutoreleasedReturnValue(-[MPIntentViewController prototypeVoicemailCell](self, "prototypeVoicemailCell"));
        LODWORD(v15) = 1148846080;
        LODWORD(v16) = 1112014848;
        objc_msgSend(v14, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", a3, 0.0, v15, v16);
        v18 = v17;

        v8 = v8 + fmin(v18, 100.0);
      }
    }
    else
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[MPIntentViewController recentCallForCallRecord:](self, "recentCallForCallRecord:", v10));
      if (v11)
      {
        v19 = (void *)objc_claimAutoreleasedReturnValue(-[MPIntentViewController prototypeRecentCallCell](self, "prototypeRecentCallCell"));
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "numberOfCalls"));
        -[MPIntentViewController configureRecentCallTableViewCell:forRecentCall:numberOfOccurences:](self, "configureRecentCallTableViewCell:forRecentCall:numberOfOccurences:", v19, v11, objc_msgSend(v20, "unsignedIntegerValue"));

        v21 = (void *)objc_claimAutoreleasedReturnValue(-[MPIntentViewController prototypeRecentCallCell](self, "prototypeRecentCallCell"));
        LODWORD(v22) = 1148846080;
        LODWORD(v23) = 1112014848;
        objc_msgSend(v21, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", a3, 0.0, v22, v23);
        v25 = v24;

        v8 = v8 + v25;
      }
    }

    ++v7;
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[MPIntentViewController callRecords](self, "callRecords"));
    v27 = objc_msgSend(v26, "count");

  }
  while (v7 < (unint64_t)v27);
  return v8;
}

- (CGSize)desiredSize
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  char isKindOfClass;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  uint64_t v17;
  char v18;
  void *v19;
  double v20;
  double v21;
  CGSize result;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MPIntentViewController intent](self, "intent"));
  v4 = objc_opt_class(INStartCallIntent);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0)
  {

    goto LABEL_4;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MPIntentViewController intent](self, "intent"));
  v6 = objc_opt_class(INStartAudioCallIntent);
  isKindOfClass = objc_opt_isKindOfClass(v5, v6);

  if ((isKindOfClass & 1) != 0)
  {
LABEL_4:
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MPIntentViewController extensionContext](self, "extensionContext"));
    objc_msgSend(v8, "hostedViewMaximumAllowedSize");
    v10 = v9;

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MPIntentViewController extensionContext](self, "extensionContext"));
    objc_msgSend(v11, "hostedViewMaximumAllowedSize");
    v13 = v12;

    if (v13 <= 200.0)
      v14 = v13;
    else
      v14 = 200.0;
    goto LABEL_7;
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[MPIntentViewController intent](self, "intent"));
  v17 = objc_opt_class(INSearchCallHistoryIntent);
  v18 = objc_opt_isKindOfClass(v16, v17);

  v14 = 0.0;
  v10 = 0.0;
  if ((v18 & 1) != 0)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[MPIntentViewController extensionContext](self, "extensionContext"));
    objc_msgSend(v19, "hostedViewMaximumAllowedSize");
    v10 = v20;

    -[MPIntentViewController calculatedHeightForCallRecordCellsWithWidth:](self, "calculatedHeightForCallRecordCellsWithWidth:", v10);
    v14 = v21;
  }
LABEL_7:
  v15 = v10;
  result.height = v14;
  result.width = v15;
  return result;
}

- (void)configureViewForEmergencyCountdown
{
  id v3;
  NSObject *v4;
  MPEmergencyCountdownView *v5;
  double v6;
  MPEmergencyCountdownView *v7;
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
  void *v18;
  void *v19;
  void *v20;
  uint8_t v21[16];

  v3 = PHDefaultLog();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v21 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Configuring for emergency countdown", v21, 2u);
  }

  v5 = [MPEmergencyCountdownView alloc];
  LODWORD(v6) = 1125515264;
  v7 = -[MPEmergencyCountdownView initWithDiameter:](v5, "initWithDiameter:", v6);
  -[MPIntentViewController setCountdownView:](self, "setCountdownView:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MPIntentViewController view](self, "view"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MPIntentViewController countdownView](self, "countdownView"));
  objc_msgSend(v8, "addSubview:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MPIntentViewController countdownView](self, "countdownView"));
  objc_msgSend(v10, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MPIntentViewController countdownView](self, "countdownView"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "centerXAnchor"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MPIntentViewController view](self, "view"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "centerXAnchor"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "constraintEqualToAnchor:", v14));
  objc_msgSend(v15, "setActive:", 1);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[MPIntentViewController countdownView](self, "countdownView"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "centerYAnchor"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[MPIntentViewController view](self, "view"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "centerYAnchor"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "constraintEqualToAnchor:", v19));
  objc_msgSend(v20, "setActive:", 1);

}

- (void)configureForCallHistory
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  PHRecentsController *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  PHRecentsController *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  MPVoicemailController *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  MPVoicemailController *v23;
  MPLegacyRecentsTableViewCell *v24;
  void *v25;
  PHVoicemailMessageTableViewCell *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  uint8_t v65[16];

  v3 = PHDefaultLog();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v65 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Configuring for call history", v65, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[PHApplicationServices sharedInstance](PHApplicationServices, "sharedInstance"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallHistoryController callHistoryControllerWithCoalescingStrategy:options:](TUCallHistoryController, "callHistoryControllerWithCoalescingStrategy:options:", 1, 15));
  v7 = [PHRecentsController alloc];
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "callProviderManager"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "contactStore"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "suggestedContactStore"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "metadataCache"));
  v12 = -[PHRecentsController initWithCallHistoryController:callProviderManager:contactStore:suggestedContactStore:metadataCache:](v7, "initWithCallHistoryController:callProviderManager:contactStore:suggestedContactStore:metadataCache:", v6, v8, v9, v10, v11);
  -[MPIntentViewController setRecentsController:](self, "setRecentsController:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MPIntentViewController recentsController](self, "recentsController"));
  objc_msgSend(v13, "addDelegate:queue:", self, &_dispatch_main_q);

  v14 = objc_alloc_init((Class)VMVoicemailManager);
  -[MPIntentViewController setVoicemailManager:](self, "setVoicemailManager:", v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[MPIntentViewController voicemailManager](self, "voicemailManager"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[PHVisualVoicemailManagerFactory getVisualVoiceMailWithVisualVoicemailManager:onVoicemailsChanged:](PHVisualVoicemailManagerFactory, "getVisualVoiceMailWithVisualVoicemailManager:onVoicemailsChanged:", v15, &stru_10007D610));

  v17 = [MPVoicemailController alloc];
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[MPIntentViewController voicemailManager](self, "voicemailManager"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "callProviderManager"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "contactStore"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "suggestedContactStore"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "metadataCache"));
  v23 = -[MPVoicemailController initWithVoicemailManager:accountManager:callProviderManager:contactStore:suggestedContactStore:metadataCache:](v17, "initWithVoicemailManager:accountManager:callProviderManager:contactStore:suggestedContactStore:metadataCache:", v16, v18, v19, v20, v21, v22);
  -[MPIntentViewController setVoicemailController:](self, "setVoicemailController:", v23);

  v24 = objc_alloc_init(MPLegacyRecentsTableViewCell);
  -[MPIntentViewController setPrototypeRecentCallCell:](self, "setPrototypeRecentCallCell:", v24);

  v25 = (void *)objc_claimAutoreleasedReturnValue(-[MPIntentViewController prototypeRecentCallCell](self, "prototypeRecentCallCell"));
  objc_msgSend(v25, "updateFontsLayoutMetricsAndSeparatorInset");

  v26 = objc_alloc_init(PHVoicemailMessageTableViewCell);
  -[MPIntentViewController setPrototypeVoicemailCell:](self, "setPrototypeVoicemailCell:", v26);

  v27 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBlueColor](UIColor, "systemBlueColor"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[MPIntentViewController view](self, "view"));
  objc_msgSend(v28, "setTintColor:", v27);

  v29 = objc_msgSend(objc_alloc((Class)UITableView), "initWithFrame:style:", 0, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  -[MPIntentViewController setTableView:](self, "setTableView:", v29);

  v30 = (void *)objc_claimAutoreleasedReturnValue(-[MPIntentViewController tableView](self, "tableView"));
  objc_msgSend(v30, "setDataSource:", self);

  v31 = (void *)objc_claimAutoreleasedReturnValue(-[MPIntentViewController tableView](self, "tableView"));
  objc_msgSend(v31, "setDelegate:", self);

  v32 = (void *)objc_claimAutoreleasedReturnValue(-[MPIntentViewController tableView](self, "tableView"));
  objc_msgSend(v32, "setScrollEnabled:", 0);

  v33 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(-[MPIntentViewController tableView](self, "tableView"));
  objc_msgSend(v34, "setBackgroundColor:", v33);

  v35 = (void *)objc_claimAutoreleasedReturnValue(-[MPIntentViewController tableView](self, "tableView"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "layer"));
  objc_msgSend(v36, "setHitTestsAsOpaque:", 1);

  v37 = (void *)objc_claimAutoreleasedReturnValue(-[MPIntentViewController tableView](self, "tableView"));
  objc_msgSend(v37, "registerClass:forCellReuseIdentifier:", objc_opt_class(MPLegacyRecentsTableViewCell), CFSTR("MPLegacyRecentsTableViewCell"));

  v38 = (void *)objc_claimAutoreleasedReturnValue(-[MPIntentViewController tableView](self, "tableView"));
  v39 = objc_opt_class(PHVoicemailMessageTableViewCell);
  v40 = (void *)objc_claimAutoreleasedReturnValue(+[PHVoicemailMessageTableViewCell reuseIdentifier](PHVoicemailMessageTableViewCell, "reuseIdentifier"));
  objc_msgSend(v38, "registerClass:forCellReuseIdentifier:", v39, v40);

  v41 = (void *)objc_claimAutoreleasedReturnValue(-[MPIntentViewController tableView](self, "tableView"));
  objc_msgSend(v41, "setRowHeight:", UITableViewAutomaticDimension);

  v42 = (void *)objc_claimAutoreleasedReturnValue(-[MPIntentViewController view](self, "view"));
  v43 = (void *)objc_claimAutoreleasedReturnValue(-[MPIntentViewController tableView](self, "tableView"));
  objc_msgSend(v42, "addSubview:", v43);

  v44 = (void *)objc_claimAutoreleasedReturnValue(-[MPIntentViewController tableView](self, "tableView"));
  objc_msgSend(v44, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v45 = (void *)objc_claimAutoreleasedReturnValue(-[MPIntentViewController tableView](self, "tableView"));
  v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "topAnchor"));
  v47 = (void *)objc_claimAutoreleasedReturnValue(-[MPIntentViewController view](self, "view"));
  v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "topAnchor"));
  v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "constraintEqualToAnchor:", v48));
  objc_msgSend(v49, "setActive:", 1);

  v50 = (void *)objc_claimAutoreleasedReturnValue(-[MPIntentViewController tableView](self, "tableView"));
  v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "bottomAnchor"));
  v52 = (void *)objc_claimAutoreleasedReturnValue(-[MPIntentViewController view](self, "view"));
  v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "bottomAnchor"));
  v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "constraintEqualToAnchor:", v53));
  objc_msgSend(v54, "setActive:", 1);

  v55 = (void *)objc_claimAutoreleasedReturnValue(-[MPIntentViewController tableView](self, "tableView"));
  v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "leftAnchor"));
  v57 = (void *)objc_claimAutoreleasedReturnValue(-[MPIntentViewController view](self, "view"));
  v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "leftAnchor"));
  v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "constraintEqualToAnchor:", v58));
  objc_msgSend(v59, "setActive:", 1);

  v60 = (void *)objc_claimAutoreleasedReturnValue(-[MPIntentViewController tableView](self, "tableView"));
  v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "rightAnchor"));
  v62 = (void *)objc_claimAutoreleasedReturnValue(-[MPIntentViewController view](self, "view"));
  v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "rightAnchor"));
  v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "constraintEqualToAnchor:", v63));
  objc_msgSend(v64, "setActive:", 1);

}

- (id)voicemailMessageViewModelForVoicemail:(id)a3
{
  id v4;
  MPVoicemailMessageViewModel *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  NSObject *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  VMMessageTranscriptViewModel *v34;

  v4 = a3;
  v5 = objc_alloc_init(MPVoicemailMessageViewModel);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "date"));
  -[MPVoicemailMessageViewModel setDate:](v5, "setDate:", v6);

  v7 = PHVoicemailCellDateFormatter();
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "date"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "stringFromDate:", v9));
  -[MPVoicemailMessageViewModel setLocalizedDate:](v5, "setLocalizedDate:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MPIntentViewController voicemailController](self, "voicemailController"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedTitleForMessage:", v4));
  -[MPVoicemailMessageViewModel setLocalizedTitle:](v5, "setLocalizedTitle:", v12);

  objc_msgSend(v4, "duration");
  v14 = PHVoicemailFormatTime(v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  -[MPVoicemailMessageViewModel setLocalizedDuration:](v5, "setLocalizedDuration:", v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[MPIntentViewController voicemailController](self, "voicemailController"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "localizedSubtitleForMessage:", v4));
  -[MPVoicemailMessageViewModel setLocalizedSubtitle:](v5, "setLocalizedSubtitle:", v17);

  -[MPVoicemailMessageViewModel setIsRead:](v5, "setIsRead:", objc_msgSend(v4, "isRead"));
  -[MPVoicemailMessageViewModel setIsDeleted:](v5, "setIsDeleted:", objc_msgSend(v4, "folder") == (id)2);
  v18 = objc_msgSend(v4, "isTranscriptionAvailable");
  v19 = PHDefaultLog();
  v20 = objc_claimAutoreleasedReturnValue(v19);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    sub_1000523B4((char)v18, (uint64_t)v4, v20);

  -[MPVoicemailMessageViewModel setShowsTranscriptionView:](v5, "setShowsTranscriptionView:", v18);
  -[MPVoicemailMessageViewModel setShowsPlayerControls:](v5, "setShowsPlayerControls:", 1);
  objc_msgSend(v4, "duration");
  -[MPVoicemailMessageViewModel setDuration:](v5, "setDuration:");
  if (+[PHDevice isGeminiCapable](PHDevice, "isGeminiCapable"))
  {
    v21 = (id)objc_claimAutoreleasedReturnValue(-[MPIntentViewController voicemailController](self, "voicemailController"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "callProviderManager"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "telephonyProvider"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "prioritizedSenderIdentities"));
    if ((unint64_t)objc_msgSend(v24, "count") < 2)
    {

      goto LABEL_8;
    }
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "receiverDestinationID"));
    v26 = objc_msgSend(v25, "length");

    if (v26)
    {
      v27 = objc_alloc((Class)TUHandle);
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "receiverDestinationID"));
      v21 = objc_msgSend(v27, "initWithType:value:", 2, v28);

      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "receiverISOCountryCode"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "canonicalHandleForISOCountryCode:", v29));

      v30 = (void *)objc_claimAutoreleasedReturnValue(-[MPIntentViewController voicemailController](self, "voicemailController"));
      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "callProviderManager"));
      v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "telephonyProvider"));
      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "senderIdentityForHandle:", v22));
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "localizedShortName"));

      -[MPVoicemailMessageViewModel setLocalizedSenderIdentityTitle:](v5, "setLocalizedSenderIdentityTitle:", v23);
LABEL_8:

    }
  }
  v34 = -[VMMessageTranscriptViewModel initWithMPMessage:]([VMMessageTranscriptViewModel alloc], "initWithMPMessage:", v4);
  -[MPVoicemailMessageViewModel setTranscriptViewModel:](v5, "setTranscriptViewModel:", v34);

  return v5;
}

- (void)recentsController:(id)a3 didChangeCalls:(id)a4
{
  id v5;
  NSObject *v6;
  id v7;
  void *v8;
  void *v9;
  int v10;
  id v11;

  v5 = PHDefaultLog();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138412290;
    v11 = (id)objc_opt_class(self);
    v7 = v11;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%@ is handling recent calls change", (uint8_t *)&v10, 0xCu);

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MPIntentViewController recentsItemCache](self, "recentsItemCache"));
  objc_msgSend(v8, "removeAllObjects");

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MPIntentViewController tableView](self, "tableView"));
  objc_msgSend(v9, "reloadData");

}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  MPVisualMessage *v13;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MPIntentViewController callRecords](self, "callRecords"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndexedSubscript:", objc_msgSend(v7, "row")));

  if (objc_msgSend(v9, "callRecordType") == (id)5)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[PHVoicemailMessageTableViewCell reuseIdentifier](PHVoicemailMessageTableViewCell, "reuseIdentifier"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dequeueReusableCellWithIdentifier:forIndexPath:", v10, v7));

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[MPIntentViewController voicemailForCallRecord:](self, "voicemailForCallRecord:", v9));
    if (v12)
    {
      v13 = -[MPVisualMessage initWithVMVoicemail:]([MPVisualMessage alloc], "initWithVMVoicemail:", v12);
      -[MPIntentViewController configureVoicemailTableViewCell:forVoicemail:](self, "configureVoicemailTableViewCell:forVoicemail:", v11, v13);
LABEL_6:

    }
  }
  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("MPLegacyRecentsTableViewCell"), v7));
    objc_msgSend(v11, "updateFontsLayoutMetricsAndSeparatorInset");
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[MPIntentViewController recentCallForCallRecord:](self, "recentCallForCallRecord:", v9));
    if (v12)
    {
      v13 = (MPVisualMessage *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "numberOfCalls"));
      -[MPIntentViewController configureRecentCallTableViewCell:forRecentCall:numberOfOccurences:](self, "configureRecentCallTableViewCell:forRecentCall:numberOfOccurences:", v11, v12, -[MPVisualMessage unsignedIntegerValue](v13, "unsignedIntegerValue"));
      goto LABEL_6;
    }
  }

  return v11;
}

- (id)recentsItemCache
{
  if (qword_100092268 != -1)
    dispatch_once(&qword_100092268, &stru_10007D630);
  return (id)qword_100092260;
}

- (id)recentsItemForCall:(id)a3 numberOfOccurences:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "uniqueId"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MPIntentViewController recentsItemCache](self, "recentsItemCache"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", v7));

  if (!v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MPIntentViewController recentsController](self, "recentsController"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "itemForRecentCall:numberOfOccurences:", v6, a4));

    if (v9)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[MPIntentViewController recentsItemCache](self, "recentsItemCache"));
      objc_msgSend(v11, "setObject:forKey:", v9, v7);

    }
  }

  return v9;
}

- (void)configureRecentCallTableViewCell:(id)a3 forRecentCall:(id)a4 numberOfOccurences:(unint64_t)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  NSObject *v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  id v19;

  v8 = a4;
  v9 = a3;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MPIntentViewController recentsItemForCall:numberOfOccurences:](self, "recentsItemForCall:numberOfOccurences:", v8, a5));
  v11 = PHDefaultLog();
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v18 = 138412290;
    v19 = v8;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Recent Call: %@", (uint8_t *)&v18, 0xCu);
  }

  v13 = PHDefaultLog();
  v14 = objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v18 = 138412290;
    v19 = v10;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Recents Item: %@", (uint8_t *)&v18, 0xCu);
  }

  objc_msgSend(v9, "configureWithRecentsItem:recentCall:messageIndicatorViewModel:", v10, v8, 0);
  objc_msgSend(v9, "setAccessoryType:", 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  objc_msgSend(v9, "setBackgroundColor:", v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "contentView"));

  objc_msgSend(v17, "setBackgroundColor:", v16);
}

- (void)configureVoicemailTableViewCell:(id)a3 forVoicemail:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "setDelegate:", self);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  objc_msgSend(v7, "setBackgroundColor:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "contentView"));
  objc_msgSend(v10, "setBackgroundColor:", v9);

  v11 = (id)objc_claimAutoreleasedReturnValue(-[MPIntentViewController voicemailMessageViewModelForVoicemail:](self, "voicemailMessageViewModelForVoicemail:", v6));
  objc_msgSend(v7, "configureWithVoicemailMessageViewModel:expanded:shouldGrayForeground:", v11, 0, 0);

}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v4;
  id v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MPIntentViewController callRecords](self, "callRecords", a3, a4));
  v5 = objc_msgSend(v4, "count");

  return (int64_t)v5;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4
{
  double result;

  +[MPLegacyRecentsTableViewCell minimumRowHeight](MPLegacyRecentsTableViewCell, "minimumRowHeight", a3, a4);
  return result;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;

  v14 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MPIntentViewController callRecords](self, "callRecords"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndexedSubscript:", objc_msgSend(v14, "row")));

  if (objc_msgSend(v8, "callRecordType") == (id)5)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MPIntentViewController voicemailForCallRecord:](self, "voicemailForCallRecord:", v8));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL phoneAppVoicemailURLForRecordID:](NSURL, "phoneAppVoicemailURLForRecordID:", objc_msgSend(v9, "identifier")));
    TUOpenSensitiveURL();
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MPIntentViewController recentCallForCallRecord:](self, "recentCallForCallRecord:", v8));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "validRemoteParticipantHandles"));
    v12 = objc_msgSend(v11, "count");

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[MPIntentViewController recentsController](self, "recentsController"));
    v10 = v13;
    if ((unint64_t)v12 < 2)
      objc_msgSend(v13, "performDialRequestForRecentCall:", v9);
    else
      objc_msgSend(v13, "performJoinRequestForRecentCall:", v9);
  }

  objc_msgSend(v6, "deselectRowAtIndexPath:animated:", v14, 1);
}

- (INInteraction)interaction
{
  return self->_interaction;
}

- (void)setInteraction:(id)a3
{
  objc_storeStrong((id *)&self->_interaction, a3);
}

- (MPEmergencyCountdownView)countdownView
{
  return self->_countdownView;
}

- (void)setCountdownView:(id)a3
{
  objc_storeStrong((id *)&self->_countdownView, a3);
}

- (BOOL)countdownCancelled
{
  return self->_countdownCancelled;
}

- (void)setCountdownCancelled:(BOOL)a3
{
  self->_countdownCancelled = a3;
}

- (UITableView)tableView
{
  return self->_tableView;
}

- (void)setTableView:(id)a3
{
  objc_storeStrong((id *)&self->_tableView, a3);
}

- (PHRecentsController)recentsController
{
  return self->_recentsController;
}

- (void)setRecentsController:(id)a3
{
  objc_storeStrong((id *)&self->_recentsController, a3);
}

- (MPLegacyRecentsTableViewCell)prototypeRecentCallCell
{
  return self->_prototypeRecentCallCell;
}

- (void)setPrototypeRecentCallCell:(id)a3
{
  objc_storeStrong((id *)&self->_prototypeRecentCallCell, a3);
}

- (VMVoicemailManager)voicemailManager
{
  return self->_voicemailManager;
}

- (void)setVoicemailManager:(id)a3
{
  objc_storeStrong((id *)&self->_voicemailManager, a3);
}

- (MPVoicemailController)voicemailController
{
  return self->_voicemailController;
}

- (void)setVoicemailController:(id)a3
{
  objc_storeStrong((id *)&self->_voicemailController, a3);
}

- (PHVoicemailMessageTableViewCell)prototypeVoicemailCell
{
  return self->_prototypeVoicemailCell;
}

- (void)setPrototypeVoicemailCell:(id)a3
{
  objc_storeStrong((id *)&self->_prototypeVoicemailCell, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_prototypeVoicemailCell, 0);
  objc_storeStrong((id *)&self->_voicemailController, 0);
  objc_storeStrong((id *)&self->_voicemailManager, 0);
  objc_storeStrong((id *)&self->_prototypeRecentCallCell, 0);
  objc_storeStrong((id *)&self->_recentsController, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_countdownView, 0);
  objc_storeStrong((id *)&self->_interaction, 0);
}

@end
