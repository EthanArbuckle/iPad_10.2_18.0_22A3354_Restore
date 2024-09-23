@implementation PHEmergencyDialerViewController

- (PHEmergencyDialerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  PHEmergencyDialerViewController *v4;
  PHEmergencyDialerViewController *v5;
  HKHealthStore *v6;
  HKHealthStore *healthStore;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PHEmergencyDialerViewController;
  v4 = -[PHEmergencyDialerViewController initWithNibName:bundle:](&v9, "initWithNibName:bundle:", a3, a4);
  v5 = v4;
  if (v4)
  {
    -[PHEmergencyDialerViewController setCurrentState:](v4, "setCurrentState:", 0);
    v6 = (HKHealthStore *)objc_alloc_init((Class)CUTWeakLinkClass(CFSTR("HKHealthStore"), CFSTR("HealthKit")));
    healthStore = v5->_healthStore;
    v5->_healthStore = v6;

    -[PHEmergencyDialerViewController setShouldSetPresenceToken:](v5, "setShouldSetPresenceToken:", 1);
  }
  return v5;
}

- (void)loadView
{
  void *v3;
  unsigned int v4;
  uint64_t v5;
  id v6;
  double y;
  double width;
  double height;
  id v10;
  void *v11;
  PHEmergencyHandsetDialerView *v12;
  PHEmergencyHandsetDialerView *dialerView;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
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
  double v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  double v40;
  double v41;
  void *v42;
  void *v43;
  PHBottomBarButton *v44;
  void *v45;
  PHBottomBarButtonConfiguration *v46;
  PHBottomBarButton *v47;
  void *v48;
  void *v49;
  void *v50;
  PHBottomBarButtonConfiguration *v51;
  PHBottomBarButton *v52;
  void *v53;
  void *v54;
  void *v55;
  id v56;
  void *v57;
  PHBottomBarButtonConfiguration *v58;
  _QWORD v59[6];
  _QWORD v60[5];
  id v61;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[PHInCallUtilities sharedInstance](PHInCallUtilities, "sharedInstance"));
  v4 = objc_msgSend(v3, "isSetupAssistantRunning");

  if (v4)
    v5 = 4;
  else
    v5 = 3;
  -[PHEmergencyDialerViewController setBackgroundStyle:](self, "setBackgroundStyle:", v5);
  v6 = objc_alloc((Class)UIView);
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  v10 = objc_msgSend(v6, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  objc_msgSend(v10, "setBackgroundColor:", v11);

  objc_msgSend(v10, "setOpaque:", 0);
  -[PHEmergencyDialerViewController setView:](self, "setView:", v10);
  v12 = -[PHEmergencyHandsetDialerView initWithFrame:]([PHEmergencyHandsetDialerView alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
  dialerView = self->_dialerView;
  self->_dialerView = v12;

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[PHAbstractDialerView phonePadView](self->_dialerView, "phonePadView"));
  objc_msgSend(v14, "setPlaysSounds:", 1);

  -[PHEmergencyHandsetDialerView setAutoresizingMask:](self->_dialerView, "setAutoresizingMask:", 18);
  -[PHAbstractDialerView setDelegate:](self->_dialerView, "setDelegate:", self);
  -[PHEmergencyHandsetDialerView bounds](self->_dialerView, "bounds");
  objc_msgSend(v10, "setFrame:");
  v57 = v10;
  objc_msgSend(v10, "addSubview:", self->_dialerView);
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[PHAbstractDialerView callButton](self->_dialerView, "callButton"));
  objc_msgSend(v15, "addTarget:action:forEvents:", self, "callButtonTapped:", 64);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[PHAbstractDialerView deleteButton](self->_dialerView, "deleteButton"));
  objc_msgSend(v16, "addTarget:action:forEvents:", self, "deleteButtonTapped:", 64);

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[PHAbstractDialerView phonePadView](self->_dialerView, "phonePadView"));
  objc_msgSend(v17, "setDelegate:", self);

  v18 = (void *)objc_claimAutoreleasedReturnValue(+[PHEdgeInsetButton buttonWithType:](PHEdgeInsetButton, "buttonWithType:", 1));
  objc_msgSend(v18, "setTouchAreaEdgeInsets:", -15.0, -15.0, -15.0, -15.0);
  objc_msgSend(v18, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v18, "addTarget:action:forControlEvents:", self, "backButtonTapped:", 64);
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_10028DC20, CFSTR("EmergencyCallStrings")));
  objc_msgSend(v18, "setTitle:forState:", v20, 0);

  v21 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
  objc_msgSend(v18, "setTitleColor:forState:", v21, 0);

  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "titleLabel"));
  if (+[PHUIConfiguration handsetDialerSpacing](PHUIConfiguration, "handsetDialerSpacing"))
    v23 = 16.0;
  else
    v23 = 14.0;
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:", v23));
  objc_msgSend(v22, "setFont:", v24);

  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "titleLabel"));
  objc_msgSend(v25, "setTextAlignment:", 1);

  v26 = (void *)objc_claimAutoreleasedReturnValue(-[PHEmergencyDialerViewController view](self, "view"));
  objc_msgSend(v26, "addSubview:", v18);

  -[PHEmergencyDialerViewController setBackButton:](self, "setBackButton:", v18);
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[PHEmergencyDialerViewController view](self, "view"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[PHEmergencyDialerViewController useRTTButton](self, "useRTTButton"));
  objc_msgSend(v27, "addSubview:", v28);

  -[PHEmergencyDialerViewController refreshUseRTTButton](self, "refreshUseRTTButton");
  v29 = (void *)objc_claimAutoreleasedReturnValue(+[PHEdgeInsetButton buttonWithType:](PHEdgeInsetButton, "buttonWithType:", 1));
  objc_msgSend(v29, "setTouchAreaEdgeInsets:", -15.0, -15.0, -15.0, -15.0);
  objc_msgSend(v29, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v29, "addTarget:action:forControlEvents:", self, "medicalIDButtonTapped:", 64);
  v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "localizedStringForKey:value:table:", CFSTR("MEDICAL_ID"), &stru_10028DC20, CFSTR("EmergencyCallStrings")));
  objc_msgSend(v29, "setTitle:forState:", v31, 0);

  v32 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemRedColor](UIColor, "systemRedColor"));
  objc_msgSend(v29, "setTitleColor:forState:", v32, 0);

  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "titleLabel"));
  if (+[PHUIConfiguration handsetDialerSpacing](PHUIConfiguration, "handsetDialerSpacing"))
    v34 = 16.0;
  else
    v34 = 14.0;
  v35 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:", v34));
  objc_msgSend(v33, "setFont:", v35);

  v36 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage tpImageForSymbolType:pointSize:](UIImage, "tpImageForSymbolType:pointSize:", 37, 10.0));
  objc_msgSend(v29, "setImage:forState:", v36, 0);

  v37 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemRedColor](UIColor, "systemRedColor"));
  objc_msgSend(v29, "_setImageColor:forState:", v37, 0);

  v38 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v39 = objc_msgSend(v38, "userInterfaceLayoutDirection");

  if (v39 == (id)1)
    v40 = -3.0;
  else
    v40 = 3.0;
  if (v39 == (id)1)
    v41 = 3.0;
  else
    v41 = -3.0;
  objc_msgSend(v29, "setTitleEdgeInsets:", 0.0, v40, 0.0, v41);
  objc_msgSend(v29, "setImageEdgeInsets:", -0.5, v41, 0.5, v40);
  objc_msgSend(v29, "setHidden:", 1);
  v42 = (void *)objc_claimAutoreleasedReturnValue(-[PHEmergencyDialerViewController view](self, "view"));
  objc_msgSend(v42, "addSubview:", v29);

  -[PHEmergencyDialerViewController setMedicalIDButton:](self, "setMedicalIDButton:", v29);
  v60[0] = 0;
  v60[1] = v60;
  v60[2] = 0x3032000000;
  v60[3] = sub_100093684;
  v60[4] = sub_100093694;
  v61 = 0;
  v43 = (void *)objc_claimAutoreleasedReturnValue(-[PHEmergencyDialerViewController healthStore](self, "healthStore"));
  v59[0] = _NSConcreteStackBlock;
  v59[1] = 3221225472;
  v59[2] = sub_10009369C;
  v59[3] = &unk_100286D70;
  v59[4] = self;
  v59[5] = v60;
  objc_msgSend(v43, "fetchMedicalIDDataWithCompletion:", v59);

  v58 = -[PHBottomBarButtonConfiguration initWithAction:]([PHBottomBarButtonConfiguration alloc], "initWithAction:", 14);
  v44 = -[PHBottomBarButton initWithConfiguration:]([PHBottomBarButton alloc], "initWithConfiguration:", v58);
  -[PHBottomBarButton setTranslatesAutoresizingMaskIntoConstraints:](v44, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[PHBottomBarButton addTarget:action:forControlEvents:](v44, "addTarget:action:forControlEvents:", self, "endButtonTapped:", 64);
  -[PHBottomBarButton setAlpha:](v44, "setAlpha:", 0.0);
  v45 = (void *)objc_claimAutoreleasedReturnValue(-[PHEmergencyDialerViewController view](self, "view"));
  objc_msgSend(v45, "addSubview:", v44);

  -[PHEmergencyDialerViewController setEndButton:](self, "setEndButton:", v44);
  v46 = -[PHBottomBarButtonConfiguration initWithAction:]([PHBottomBarButtonConfiguration alloc], "initWithAction:", 35);
  v47 = -[PHBottomBarButton initWithConfiguration:]([PHBottomBarButton alloc], "initWithConfiguration:", v46);
  -[PHBottomBarButton setTranslatesAutoresizingMaskIntoConstraints:](v47, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[PHBottomBarButton addTarget:action:forControlEvents:](v47, "addTarget:action:forControlEvents:", self, "stewieAlertButtonTapped:", 64);
  -[PHBottomBarButton setAlpha:](v47, "setAlpha:", 0.0);
  v48 = (void *)objc_claimAutoreleasedReturnValue(-[PHEmergencyDialerViewController view](self, "view"));
  objc_msgSend(v48, "addSubview:", v47);

  -[PHEmergencyDialerViewController setStewieAlertButton:](self, "setStewieAlertButton:", v47);
  v49 = (void *)objc_claimAutoreleasedReturnValue(-[PHEmergencyDialerViewController stewieAlertButton](self, "stewieAlertButton"));
  v50 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
  objc_msgSend(v49, "setTitleColor:forState:", v50, 0);

  v51 = -[PHBottomBarButtonConfiguration initWithAction:]([PHBottomBarButtonConfiguration alloc], "initWithAction:", 36);
  v52 = -[PHBottomBarButton initWithConfiguration:]([PHBottomBarButton alloc], "initWithConfiguration:", v51);
  -[PHBottomBarButton setTranslatesAutoresizingMaskIntoConstraints:](v52, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[PHBottomBarButton addTarget:action:forControlEvents:](v52, "addTarget:action:forControlEvents:", self, "endButtonTapped:", 64);
  -[PHBottomBarButton setAlpha:](v52, "setAlpha:", 0.0);
  v53 = (void *)objc_claimAutoreleasedReturnValue(-[PHEmergencyDialerViewController view](self, "view"));
  objc_msgSend(v53, "addSubview:", v52);

  -[PHEmergencyDialerViewController setStewieEndCallButton:](self, "setStewieEndCallButton:", v52);
  v54 = (void *)objc_claimAutoreleasedReturnValue(-[PHEmergencyDialerViewController stewieEndCallButton](self, "stewieEndCallButton"));
  v55 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
  objc_msgSend(v54, "setTitleColor:forState:", v55, 0);

  v56 = objc_alloc_init((Class)UINotificationFeedbackGenerator);
  -[PHEmergencyDialerViewController setAlertFeedbackGenerator:](self, "setAlertFeedbackGenerator:", v56);

  -[PHEmergencyDialerViewController loadConstraints](self, "loadConstraints");
  -[PHEmergencyDialerViewController updateCurrentState](self, "updateCurrentState");

  _Block_object_dispose(v60, 8);
}

- (void)loadConstraints
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
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
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  id v77;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHEmergencyDialerViewController dialerView](self, "dialerView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "phonePadView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "centerXAnchor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHEmergencyDialerViewController medicalIDButton](self, "medicalIDButton"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "centerXAnchor"));
  +[TPNumberPadLightStyleButton defaultSize](TPNumberPadLightStyleButton, "defaultSize");
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "constraintEqualToAnchor:constant:", v7));

  LODWORD(v9) = 1144750080;
  objc_msgSend(v8, "setPriority:", v9);
  objc_msgSend(v8, "setActive:", 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[PHEmergencyDialerViewController medicalIDButton](self, "medicalIDButton"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "leadingAnchor"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[PHEmergencyDialerViewController dialerView](self, "dialerView"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "leadingAnchor"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "constraintGreaterThanOrEqualToAnchor:constant:", v13, 15.0));

  objc_msgSend(v14, "setActive:", 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[PHEmergencyDialerViewController medicalIDButton](self, "medicalIDButton"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "centerYAnchor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[PHEmergencyDialerViewController backButton](self, "backButton"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "centerYAnchor"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "constraintEqualToAnchor:", v18));

  objc_msgSend(v19, "setActive:", 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[PHEmergencyDialerViewController endButton](self, "endButton"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "centerXAnchor"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[PHEmergencyDialerViewController dialerView](self, "dialerView"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "callButton"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "centerXAnchor"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "constraintEqualToAnchor:", v24));

  objc_msgSend(v25, "setActive:", 1);
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[PHEmergencyDialerViewController endButton](self, "endButton"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "centerYAnchor"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[PHEmergencyDialerViewController dialerView](self, "dialerView"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "callButton"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "centerYAnchor"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "constraintEqualToAnchor:", v30));

  objc_msgSend(v31, "setActive:", 1);
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[PHEmergencyDialerViewController stewieAlertButton](self, "stewieAlertButton"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "centerYAnchor"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(-[PHEmergencyDialerViewController dialerView](self, "dialerView"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "callButton"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "centerYAnchor"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "constraintEqualToAnchor:", v36));

  objc_msgSend(v37, "setActive:", 1);
  v38 = (void *)objc_claimAutoreleasedReturnValue(-[PHEmergencyDialerViewController stewieAlertButton](self, "stewieAlertButton"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "leadingAnchor"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(-[PHEmergencyDialerViewController dialerView](self, "dialerView"));
  v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "callButton"));
  v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "trailingAnchor"));
  v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "constraintEqualToAnchor:", v42));

  objc_msgSend(v43, "setActive:", 1);
  v44 = (void *)objc_claimAutoreleasedReturnValue(-[PHEmergencyDialerViewController stewieEndCallButton](self, "stewieEndCallButton"));
  v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "centerYAnchor"));
  v46 = (void *)objc_claimAutoreleasedReturnValue(-[PHEmergencyDialerViewController dialerView](self, "dialerView"));
  v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "callButton"));
  v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "centerYAnchor"));
  v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "constraintEqualToAnchor:", v48));

  objc_msgSend(v49, "setActive:", 1);
  v50 = (void *)objc_claimAutoreleasedReturnValue(-[PHEmergencyDialerViewController stewieEndCallButton](self, "stewieEndCallButton"));
  v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "trailingAnchor"));
  v52 = (void *)objc_claimAutoreleasedReturnValue(-[PHEmergencyDialerViewController dialerView](self, "dialerView"));
  v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "callButton"));
  v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "leadingAnchor"));
  v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "constraintEqualToAnchor:", v54));

  objc_msgSend(v55, "setActive:", 1);
  v56 = (void *)objc_claimAutoreleasedReturnValue(-[PHEmergencyDialerViewController backButton](self, "backButton"));
  v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "centerXAnchor"));
  v58 = (void *)objc_claimAutoreleasedReturnValue(-[PHEmergencyDialerViewController dialerView](self, "dialerView"));
  v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "phonePadView"));
  v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "centerXAnchor"));
  +[TPNumberPadLightStyleButton defaultSize](TPNumberPadLightStyleButton, "defaultSize");
  v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "constraintEqualToAnchor:constant:", v60));

  objc_msgSend(v61, "setActive:", 1);
  v62 = (void *)objc_claimAutoreleasedReturnValue(-[PHEmergencyDialerViewController view](self, "view"));
  v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "bottomAnchor"));
  v64 = (void *)objc_claimAutoreleasedReturnValue(-[PHEmergencyDialerViewController backButton](self, "backButton"));
  v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "lastBaselineAnchor"));
  -[PHEmergencyDialerViewController bottomToCancelBaselineOffset](self, "bottomToCancelBaselineOffset");
  v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "constraintEqualToAnchor:constant:", v65));

  objc_msgSend(v66, "setActive:", 1);
  v67 = (void *)objc_claimAutoreleasedReturnValue(-[PHEmergencyDialerViewController useRTTButton](self, "useRTTButton"));
  v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "centerXAnchor"));
  v69 = (void *)objc_claimAutoreleasedReturnValue(-[PHEmergencyDialerViewController dialerView](self, "dialerView"));
  v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "phonePadView"));
  v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v70, "centerXAnchor"));
  +[TPNumberPadLightStyleButton defaultSize](TPNumberPadLightStyleButton, "defaultSize");
  v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v68, "constraintEqualToAnchor:constant:", v71));

  objc_msgSend(v72, "setActive:", 1);
  v73 = (void *)objc_claimAutoreleasedReturnValue(-[PHEmergencyDialerViewController view](self, "view"));
  v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "bottomAnchor"));
  v75 = (void *)objc_claimAutoreleasedReturnValue(-[PHEmergencyDialerViewController useRTTButton](self, "useRTTButton"));
  v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "lastBaselineAnchor"));
  -[PHEmergencyDialerViewController bottomToCancelBaselineOffset](self, "bottomToCancelBaselineOffset");
  v77 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v74, "constraintEqualToAnchor:constant:", v76));

  objc_msgSend(v77, "setActive:", 1);
}

- (void)dealloc
{
  void *v3;
  NSTimer *callDurationTimer;
  objc_super v5;

  if (-[PHEmergencyDialerViewController shouldSetPresenceToken](self, "shouldSetPresenceToken"))
    sub_10008745C(0);
  +[NSObject cancelPreviousPerformRequestsWithTarget:selector:object:](NSObject, "cancelPreviousPerformRequestsWithTarget:selector:object:", self, "continueCyclingEmergencyTitleLabel", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

  -[NSTimer invalidate](self->_callDurationTimer, "invalidate");
  callDurationTimer = self->_callDurationTimer;
  self->_callDurationTimer = 0;

  v5.receiver = self;
  v5.super_class = (Class)PHEmergencyDialerViewController;
  -[PHEmergencyDialerViewController dealloc](&v5, "dealloc");
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

- (BOOL)_disableAutomaticKeyboardUI
{
  return 1;
}

- (void)deleteButtonTapped:(id)a3
{
  -[PHEmergencyDialerViewController phonePadDeleteLastDigit:](self, "phonePadDeleteLastDigit:", 0);
}

- (void)endButtonTapped:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t v21[128];
  uint8_t buf[4];
  unsigned int v23;

  v4 = a3;
  v5 = sub_1000C5588();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    v23 = -[PHEmergencyDialerViewController currentState](self, "currentState");
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "[PHEmergencyDialerViewController endButtonTapped:] current state is %d", buf, 8u);
  }

  -[PHEmergencyDialerViewController setCallEnding:](self, "setCallEnding:", 1);
  v7 = sub_1000C5588();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "[PHEmergencyDialerViewController endButtonTapped:] endbutton setEnabled:NO", buf, 2u);
  }

  objc_msgSend(v4, "setEnabled:", 0);
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance", 0));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "currentAudioAndVideoCalls"));

  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v18;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v18 != v13)
          objc_enumerationMutation(v10);
        v15 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)v14);
        v16 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
        objc_msgSend(v16, "disconnectCall:", v15);

        v14 = (char *)v14 + 1;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v12);
  }

  -[PHEmergencyDialerViewController updateEmergencyTitleLabelForCallDuration](self, "updateEmergencyTitleLabelForCallDuration");
}

- (void)callButtonTapped:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  NSObject *v7;
  _DWORD v8[2];

  v4 = sub_1000C5588();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v8[0] = 67109120;
    v8[1] = -[PHEmergencyDialerViewController currentState](self, "currentState");
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[PHEmergencyDialerViewController callButtonTapped:] current state is %d", (uint8_t *)v8, 8u);
  }

  if (!-[PHEmergencyDialerViewController currentState](self, "currentState")
    || -[PHEmergencyDialerViewController currentState](self, "currentState") == 3)
  {
    v6 = sub_1000C5588();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v8[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Will attempt to dial emergency call", (uint8_t *)v8, 2u);
    }

    -[PHEmergencyDialerViewController attemptToDialEmergencyCall](self, "attemptToDialEmergencyCall");
  }
}

- (void)backButtonTapped:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint8_t v7[16];

  v4 = sub_1000C5588();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Ending emergency callback mode due to back button tap", v7, 2u);
  }

  +[TUCallCapabilities endEmergencyCallbackMode](TUCallCapabilities, "endEmergencyCallbackMode");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHEmergencyDialerViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy"));
  objc_msgSend(v6, "dismiss");

}

- (void)medicalIDButtonTapped:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v4 = objc_alloc((Class)UINavigationController);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHEmergencyDialerViewController medicalIDViewController](self, "medicalIDViewController"));
  v10 = objc_msgSend(v4, "initWithRootViewController:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "navigationBar"));
  objc_msgSend(v6, "setPrefersLargeTitles:", 1);

  objc_msgSend(v10, "setModalPresentationStyle:", 6);
  if (_os_feature_enabled_impl("Health", "medicalid_v2"))
  {
    v7 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithBarButtonSystemItem:target:action:", 0, self, "dismissMedicalIDViewControllerIfNecessary");
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHEmergencyDialerViewController medicalIDViewController](self, "medicalIDViewController"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "navigationItem"));
    objc_msgSend(v9, "setRightBarButtonItem:", v7);

  }
  -[PHEmergencyDialerViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v10, 1, 0);

}

- (void)dismissMedicalIDViewControllerIfNecessary
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHEmergencyDialerViewController presentedViewController](self, "presentedViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHEmergencyDialerViewController medicalIDViewController](self, "medicalIDViewController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "navigationController"));

  if (v3 == v5)
    -[PHEmergencyDialerViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PHEmergencyDialerViewController;
  -[PHEmergencyDialerViewController viewWillAppear:](&v6, "viewWillAppear:", a3);
  if (-[PHEmergencyDialerViewController shouldSetPresenceToken](self, "shouldSetPresenceToken"))
    sub_10008745C(1uLL);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v4, "addObserver:selector:name:object:", self, "callStatusChangedNotification:", TUCallCenterCallStatusChangedNotification, 0);
  objc_msgSend(v4, "addObserver:selector:name:object:", self, "emergencyCallbackModeChangedNotification:", TUCallCapabilitiesEmergencyCallbackModeChangedNotification, 0);
  objc_msgSend(v4, "addObserver:selector:name:object:", self, "handleTUCallSupportsTTYWithVoiceChangedNotification:", TUCallSupportsTTYWithVoiceChangedNotification, 0);
  objc_msgSend(v4, "addObserver:selector:name:object:", self, "handleTUCallTTYTypeChangedNotification:", TUCallTTYTypeChangedNotification, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotification PHAlertInvoked](NSNotification, "PHAlertInvoked"));
  objc_msgSend(v4, "addObserver:selector:name:object:", self, "handleAlertInvokedNotification:", v5, 0);

  -[PHEmergencyDialerViewController updateCurrentState](self, "updateCurrentState");
}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  uint8_t v12[16];
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)PHEmergencyDialerViewController;
  -[PHEmergencyDialerViewController viewDidDisappear:](&v13, "viewDidDisappear:", a3);
  if (-[PHEmergencyDialerViewController shouldSetPresenceToken](self, "shouldSetPresenceToken"))
    sub_10008745C(0);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v4, "removeObserver:name:object:", self, TUCallCenterCallStatusChangedNotification, 0);
  objc_msgSend(v4, "removeObserver:name:object:", self, TUCallCapabilitiesEmergencyCallbackModeChangedNotification, 0);
  objc_msgSend(v4, "removeObserver:name:object:", self, TUCallSupportsTTYWithVoiceChangedNotification, 0);
  objc_msgSend(v4, "removeObserver:name:object:", self, TUCallTTYTypeChangedNotification, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotification PHAlertInvoked](NSNotification, "PHAlertInvoked"));
  objc_msgSend(v4, "removeObserver:name:object:", self, v5, 0);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHEmergencyDialerViewController callDurationTimer](self, "callDurationTimer"));
  objc_msgSend(v6, "invalidate");

  -[PHEmergencyDialerViewController setCallDurationTimer:](self, "setCallDurationTimer:", 0);
  -[PHEmergencyDialerViewController setCurrentState:](self, "setCurrentState:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
  v8 = objc_msgSend(v7, "currentCallCount");

  if (!v8)
  {
    v9 = sub_1000C5588();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Ending emergency callback mode due because the emergency dialer is disappearing with no current calls", v12, 2u);
    }

    +[TUCallCapabilities endEmergencyCallbackMode](TUCallCapabilities, "endEmergencyCallbackMode");
  }
  sub_1000948CC();
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[PHInCallUtilities sharedInstance](PHInCallUtilities, "sharedInstance"));
  objc_msgSend(v11, "stopSuppressingInCallStatusBarForReason:", CFSTR("PHSuppressInCallStatusBarForBuddyEmergencyCallReason"));

}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PHEmergencyDialerViewController;
  -[PHEmergencyDialerViewController viewDidMoveToWindow:shouldAppearOrDisappear:](&v4, "viewDidMoveToWindow:shouldAppearOrDisappear:", a3, a4);
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)updateCurrentState
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  id v14;
  NSObject *v15;
  uint64_t v16;
  unsigned int v17;
  id v18;
  _BOOL4 v19;
  int v20;
  void *v21;
  __int16 v22;
  id v23;

  v3 = sub_1000C5588();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "currentCalls"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
    v20 = 138412546;
    v21 = v6;
    v22 = 2048;
    v23 = objc_msgSend(v7, "currentCallCount");
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "updateCurrentState: Calls are: %@. Count is %lu.", (uint8_t *)&v20, 0x16u);

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
  v9 = objc_msgSend(v8, "currentCallCount");

  if (v9)
  {
    v10 = sub_1000C5588();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v20) = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "updateCurrentState: There are current calls, so setting state to PHEmergencyDialerStateInCall", (uint8_t *)&v20, 2u);
    }

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
    v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "frontmostCall"));

    if (-[NSObject canDisplayAlertUI:](v13, "canDisplayAlertUI:", -[PHEmergencyDialerViewController shouldPresentAlertButton](self, "shouldPresentAlertButton")))
    {
      v14 = sub_1000C5588();
      v15 = objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v20) = 0;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "UpdateCurrentState: There are current calls and we need to show alertUI, so setting state to PHEmergencyDialerAlertModeNeededIfAvailable", (uint8_t *)&v20, 2u);
      }

      v16 = 2;
    }
    else
    {
      v16 = 1;
    }
  }
  else
  {
    v17 = +[TUCallCapabilities isEmergencyCallbackModeEnabled](TUCallCapabilities, "isEmergencyCallbackModeEnabled");
    v18 = sub_1000C5588();
    v13 = objc_claimAutoreleasedReturnValue(v18);
    v19 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
    if (v17)
    {
      if (v19)
      {
        LOWORD(v20) = 0;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "updateCurrentState: emergency callback mode is active, so setting state to PHEmergencyDialerStateEmergencyCallBackMode", (uint8_t *)&v20, 2u);
      }
      v16 = 3;
    }
    else
    {
      if (v19)
      {
        LOWORD(v20) = 0;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "updateCurrentState: setting state to PHEmergencyDialerStateIdle", (uint8_t *)&v20, 2u);
      }
      v16 = 0;
    }
  }

  -[PHEmergencyDialerViewController setCurrentState:](self, "setCurrentState:", v16);
}

- (void)setCurrentState:(signed __int16)a3
{
  -[PHEmergencyDialerViewController setCurrentState:animated:](self, "setCurrentState:animated:", a3, 0);
}

- (void)setCurrentState:(signed __int16)a3 animated:(BOOL)a4
{
  int v4;
  _BOOL4 v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  _QWORD *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD *v26;
  void *v27;
  id v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  _QWORD *v35;
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
  void *v47;
  _QWORD *v48;
  void *v49;
  id v50;
  NSObject *v51;
  id v52;
  NSObject *v53;
  _QWORD v54[5];
  _QWORD v55[5];
  _QWORD v56[5];
  _QWORD v57[5];
  uint8_t buf[8];
  uint8_t *v59;
  uint64_t v60;
  void *v61;

  v4 = a3;
  if (self->_currentState != a3)
  {
    v6 = a4;
    v7 = sub_1000C5588();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = v4;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Set Current State %d", buf, 8u);
    }

    switch(v4)
    {
      case 0:
        sub_1000948CC();
        v9 = (void *)objc_claimAutoreleasedReturnValue(+[PHInCallUtilities sharedInstance](PHInCallUtilities, "sharedInstance"));
        objc_msgSend(v9, "stopSuppressingInCallStatusBarForReason:", CFSTR("PHSuppressInCallStatusBarForBuddyEmergencyCallReason"));

        v10 = (void *)objc_claimAutoreleasedReturnValue(-[PHEmergencyDialerViewController callDurationTimer](self, "callDurationTimer"));
        objc_msgSend(v10, "invalidate");

        -[PHEmergencyDialerViewController setCallDurationTimer:](self, "setCallDurationTimer:", 0);
        -[PHEmergencyDialerViewController continueCyclingEmergencyTitleLabel](self, "continueCyclingEmergencyTitleLabel");
        v57[0] = _NSConcreteStackBlock;
        v57[1] = 3221225472;
        v57[2] = sub_1000953E4;
        v57[3] = &unk_100284898;
        v57[4] = self;
        v11 = objc_retainBlock(v57);
        v12 = v11;
        if (v6)
          +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v11, 0, 0.5);
        else
          ((void (*)(_QWORD *))v11[2])(v11);

        break;
      case 1:
        *(_QWORD *)buf = 0;
        v59 = buf;
        v60 = 0x2020000000;
        v37 = off_1002DCB08;
        v61 = off_1002DCB08;
        if (!off_1002DCB08)
        {
          v38 = (void *)sub_100097D50();
          v37 = dlsym(v38, "MSNMonitorBeginException");
          *((_QWORD *)v59 + 3) = v37;
          off_1002DCB08 = v37;
        }
        _Block_object_dispose(buf, 8);
        if (!v37)
        {
          sub_1001A8660();
          __break(1u);
        }
        ((void (*)(const char *))v37)("emergency");
        v39 = (void *)objc_claimAutoreleasedReturnValue(+[PHInCallUtilities sharedInstance](PHInCallUtilities, "sharedInstance"));
        objc_msgSend(v39, "startSuppressingInCallStatusBarForReason:", CFSTR("PHSuppressInCallStatusBarForBuddyEmergencyCallReason"));

        v40 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
        v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "displayedCall"));

        if (v41 && objc_msgSend(v41, "isEmergency"))
        {
          v42 = (void *)objc_claimAutoreleasedReturnValue(-[PHEmergencyDialerViewController dialerView](self, "dialerView"));
          v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "lcdView"));
          v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "handle"));
          v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "value"));
          objc_msgSend(v43, "setText:needsFormat:", v45, 1);

        }
        -[PHEmergencyDialerViewController updateEmergencyTitleLabelForCallDuration](self, "updateEmergencyTitleLabelForCallDuration");
        v46 = (void *)objc_claimAutoreleasedReturnValue(-[PHEmergencyDialerViewController callDurationTimer](self, "callDurationTimer"));
        objc_msgSend(v46, "invalidate");

        -[PHEmergencyDialerViewController setCallDurationTimer:](self, "setCallDurationTimer:", 0);
        v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:](NSTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, "updateEmergencyTitleLabelForCallDuration", 0, 1, 1.0));
        -[PHEmergencyDialerViewController setCallDurationTimer:](self, "setCallDurationTimer:", v47);

        +[NSObject cancelPreviousPerformRequestsWithTarget:selector:object:](NSObject, "cancelPreviousPerformRequestsWithTarget:selector:object:", self, "continueCyclingEmergencyTitleLabel", 0);
        v56[0] = _NSConcreteStackBlock;
        v56[1] = 3221225472;
        v56[2] = sub_1000954F0;
        v56[3] = &unk_100284898;
        v56[4] = self;
        v48 = objc_retainBlock(v56);
        v49 = v48;
        if (v6)
        {
          v50 = sub_1000C5588();
          v51 = objc_claimAutoreleasedReturnValue(v50);
          if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_DEFAULT, "[PHEmergencyDialerViewController setCurrentState:] self.endButton.enabled = YES", buf, 2u);
          }

          +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v49, 0.5);
        }
        else
        {
          ((void (*)(_QWORD *))v48[2])(v48);
        }

        break;
      case 2:
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[PHEmergencyDialerViewController alertFeedbackGenerator](self, "alertFeedbackGenerator"));
        objc_msgSend(v13, "notificationOccurred:", 0);

        v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("ALERT_ERROR_LABEL"), &stru_10028DC20, CFSTR("Localizable-Stewie")));
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[PHEmergencyDialerViewController dialerView](self, "dialerView"));
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "emergencyTitleLabel"));
        objc_msgSend(v17, "setText:", v15);

        v18 = (void *)objc_claimAutoreleasedReturnValue(-[PHEmergencyDialerViewController dialerView](self, "dialerView"));
        v20 = objc_opt_class(PHEmergencyHandsetDialerView, v19);
        LOBYTE(v15) = objc_opt_isKindOfClass(v18, v20);

        if ((v15 & 1) != 0)
        {
          v21 = (void *)objc_claimAutoreleasedReturnValue(-[PHEmergencyDialerViewController dialerView](self, "dialerView"));
          if ((uint64_t)objc_msgSend(v21, "numberOfLinesInEmergencyTitleLabel") >= 3)
          {
            v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
            v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("ALERT_ERROR_LABEL_NO_LINE_BREAK"), &stru_10028DC20, CFSTR("Localizable-Stewie")));
            v24 = (void *)objc_claimAutoreleasedReturnValue(-[PHEmergencyDialerViewController dialerView](self, "dialerView"));
            v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "emergencyTitleLabel"));
            objc_msgSend(v25, "setText:", v23);

          }
        }
        if (-[PHEmergencyDialerViewController shouldPresentAlertButton](self, "shouldPresentAlertButton"))
        {
          v54[0] = _NSConcreteStackBlock;
          v54[1] = 3221225472;
          v54[2] = sub_100095724;
          v54[3] = &unk_100284898;
          v54[4] = self;
          v26 = objc_retainBlock(v54);
          v27 = v26;
          if (v6)
          {
            v28 = sub_1000C5588();
            v29 = objc_claimAutoreleasedReturnValue(v28);
            if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "[PHEmergencyDialerViewController setCurrentState:] self.stewieEndCallButton.enabled = YES", buf, 2u);
            }

            +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v27, 0, 0.5);
          }
          else
          {
            ((void (*)(_QWORD *))v26[2])(v26);
          }

        }
        else
        {
          v52 = sub_1000C5588();
          v53 = objc_claimAutoreleasedReturnValue(v52);
          if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_DEFAULT, "shouldPresentAlertButton is false, skipping update stewie button", buf, 2u);
          }

        }
        break;
      case 3:
        v30 = (void *)objc_claimAutoreleasedReturnValue(-[PHEmergencyDialerViewController callDurationTimer](self, "callDurationTimer"));
        objc_msgSend(v30, "invalidate");

        -[PHEmergencyDialerViewController setCallDurationTimer:](self, "setCallDurationTimer:", 0);
        +[NSObject cancelPreviousPerformRequestsWithTarget:selector:object:](NSObject, "cancelPreviousPerformRequestsWithTarget:selector:object:", self, "continueCyclingEmergencyTitleLabel", 0);
        v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "localizedStringForKey:value:table:", CFSTR("EMERGENCY_CALL_MODE"), &stru_10028DC20, CFSTR("EmergencyCallStrings")));
        v33 = (void *)objc_claimAutoreleasedReturnValue(-[PHEmergencyDialerViewController dialerView](self, "dialerView"));
        v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "emergencyTitleLabel"));
        objc_msgSend(v34, "setText:", v32);

        v55[0] = _NSConcreteStackBlock;
        v55[1] = 3221225472;
        v55[2] = sub_100095618;
        v55[3] = &unk_100284898;
        v55[4] = self;
        v35 = objc_retainBlock(v55);
        v36 = v35;
        if (v6)
          +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v35, 0, 0.5);
        else
          ((void (*)(_QWORD *))v35[2])(v35);

        break;
      default:
        break;
    }
  }
  self->_currentState = v4;
}

- (void)continueCyclingEmergencyTitleLabel
{
  void *v2;
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[PHEmergencyDialerViewController dialerView](self, "dialerView"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "emergencyTitleLabel"));
  objc_msgSend(v2, "startCyclingStrings");

}

+ (BOOL)_isSecureForRemoteViewService
{
  return 1;
}

- (void)callStatusChangedNotification:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _TtC13InCallService16AlertCoordinator *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  unsigned int v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  _BYTE v27[24];

  v4 = a3;
  v5 = sub_1000C5588();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v27 = 138412546;
    *(_QWORD *)&v27[4] = objc_opt_class(self, v7);
    *(_WORD *)&v27[12] = 2112;
    *(_QWORD *)&v27[14] = v4;
    v8 = *(id *)&v27[4];
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%@ is handling %@", v27, 0x16u);

  }
  -[PHEmergencyDialerViewController setCallEnding:](self, "setCallEnding:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "object"));
  if (objc_msgSend(v9, "status") == 3)
  {
    -[PHEmergencyDialerViewController dismissMedicalIDViewControllerIfNecessary](self, "dismissMedicalIDViewControllerIfNecessary");
    -[PHEmergencyDialerViewController setShouldPresentAlertButton:](self, "setShouldPresentAlertButton:", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "delegate"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "alertCoordinator"));

    if (!v12)
    {
      v13 = objc_alloc_init(_TtC13InCallService16AlertCoordinator);
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "delegate"));
      objc_msgSend(v15, "setAlertCoordinator:", v13);

    }
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication", *(_OWORD *)v27, *(_QWORD *)&v27[16]));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "delegate"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "alertCoordinator"));
    objc_msgSend(v18, "setDelegate:", self);

    v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "delegate"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "alertCoordinator"));
    v22 = objc_msgSend(v21, "isMonitoring");

    v23 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "delegate"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "alertCoordinator"));
    v26 = v25;
    if (v22)
      objc_msgSend(v25, "refreshDelegateWithState");
    else
      objc_msgSend(v25, "startMonitoring");

  }
  -[PHEmergencyDialerViewController refreshUseRTTButton](self, "refreshUseRTTButton", *(_QWORD *)v27, *(_OWORD *)&v27[8]);
  -[PHEmergencyDialerViewController updateCurrentState](self, "updateCurrentState");

}

- (void)emergencyCallbackModeChangedNotification:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  int v7;
  id v8;

  v4 = a3;
  v5 = sub_1000C5588();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412290;
    v8 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Emergency callback mode changed notification %@", (uint8_t *)&v7, 0xCu);
  }

  -[PHEmergencyDialerViewController updateCurrentState](self, "updateCurrentState");
}

- (void)handleAlertInvokedNotification:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint8_t v7[16];

  v4 = sub_1000C5588();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Dismiss emergency dialer because we invoke stewie", v7, 2u);
  }

  +[TUCallCapabilities endEmergencyCallbackMode](TUCallCapabilities, "endEmergencyCallbackMode");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHEmergencyDialerViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy"));
  objc_msgSend(v6, "dismiss");

}

- (void)phonePad:(id)a3 appendString:(id)a4
{
  PHEmergencyHandsetDialerView *dialerView;
  id v6;
  void *v7;
  id v8;

  dialerView = self->_dialerView;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHAbstractDialerView lcdView](dialerView, "lcdView"));
  objc_msgSend(v7, "insertStringAtCurrentPosition:", v6);

  v8 = (id)objc_claimAutoreleasedReturnValue(-[PHAbstractDialerView lcdView](self->_dialerView, "lcdView"));
  objc_msgSend(v8, "setName:numberLabel:suggestion:", 0, 0, 0);

}

- (void)phonePadDeleteLastDigit:(id)a3
{
  void *v4;
  id v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHAbstractDialerView lcdView](self->_dialerView, "lcdView", a3));
  objc_msgSend(v4, "deleteCharacter");

  v5 = (id)objc_claimAutoreleasedReturnValue(-[PHAbstractDialerView lcdView](self->_dialerView, "lcdView"));
  objc_msgSend(v5, "setName:numberLabel:suggestion:", 0, 0, 0);

}

- (void)phonePad:(id)a3 keyDown:(char)a4
{
  void *v5;
  void *v6;
  void *v7;
  unsigned int v8;
  void *v9;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance", a3));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "currentCalls"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "firstObject"));

  v7 = v9;
  if (v9)
  {
    v8 = objc_msgSend(v9, "shouldPlayDTMFTone");
    v7 = v9;
    if (v8)
    {
      objc_msgSend(v9, "playDTMFToneForKey:", a4);
      v7 = v9;
    }
  }

}

- (id)currentCallStatusStringForDisplay
{
  void *v2;
  void *v3;
  unsigned int v4;
  unsigned int v5;
  unsigned int v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  __CFString *v10;
  __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v16;
  __CFString *v17;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "displayedCall"));

  if (v3)
  {
    v4 = objc_msgSend(v3, "status");
    if (v4 == 4)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle conversationKit](NSBundle, "conversationKit"));
      v8 = v7;
      v9 = CFSTR("CALLING");
    }
    else
    {
      v5 = v4;
      if (v4 == 3)
      {
        v6 = objc_msgSend(v3, "hasBeenRedirected");
        v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle conversationKit](NSBundle, "conversationKit"));
        v8 = v7;
        if (v6)
          v9 = CFSTR("REDIRECTED");
        else
          v9 = CFSTR("CALLING");
      }
      else if (objc_msgSend(v3, "isOnHold"))
      {
        v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle conversationKit](NSBundle, "conversationKit"));
        v8 = v7;
        v9 = CFSTR("HOLD_LABEL");
      }
      else
      {
        if (v5 != 6)
        {
          v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "callDurationString"));
          v8 = (void *)v16;
          v17 = CFSTR("00:00");
          if (v16)
            v17 = (__CFString *)v16;
          v11 = v17;
          goto LABEL_14;
        }
        v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle conversationKit](NSBundle, "conversationKit"));
        v8 = v7;
        v9 = CFSTR("CALL_ENDED");
      }
    }
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", v9, &stru_10028DC20, CFSTR("CallStatus")));
LABEL_14:
    v10 = v11;

    goto LABEL_15;
  }
  v10 = &stru_10028DC20;
LABEL_15:
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("EMERGENCY_CALL_%@"), &stru_10028DC20, CFSTR("EmergencyCallStrings")));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v13, v10));

  return v14;
}

- (void)updateEmergencyTitleLabelForCallDuration
{
  void *v3;
  void *v4;
  id v5;

  if (-[PHEmergencyDialerViewController currentState](self, "currentState") == 1)
  {
    v5 = (id)objc_claimAutoreleasedReturnValue(-[PHEmergencyDialerViewController currentCallStatusStringForDisplay](self, "currentCallStatusStringForDisplay"));
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHEmergencyDialerViewController dialerView](self, "dialerView"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "emergencyTitleLabel"));
    objc_msgSend(v4, "setText:", v5);

  }
}

- (void)noteTintColorForBackgroundStyleChanged:(id)a3
{
  id v4;
  void *v5;
  unsigned int v6;
  void *v7;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PHEmergencyDialerViewController;
  -[PHEmergencyDialerViewController noteTintColorForBackgroundStyleChanged:](&v8, "noteTintColorForBackgroundStyleChanged:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[PHInCallUtilities sharedInstance](PHInCallUtilities, "sharedInstance"));
  v6 = objc_msgSend(v5, "isSetupAssistantRunning");

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHEmergencyDialerViewController view](self, "view"));
    objc_msgSend(v7, "setBackgroundColor:", v4);

  }
}

- (void)noteViewMovedOffscreenTemporarily
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PHEmergencyDialerViewController;
  -[PHEmergencyDialerViewController noteViewMovedOffscreenTemporarily](&v5, "noteViewMovedOffscreenTemporarily");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHEmergencyDialerViewController dialerView](self, "dialerView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "lcdView"));
  objc_msgSend(v4, "setText:needsFormat:", &stru_10028DC20, 0);

  -[PHEmergencyDialerViewController dismissMedicalIDViewControllerIfNecessary](self, "dismissMedicalIDViewControllerIfNecessary");
}

- (double)bottomToCancelBaselineOffset
{
  unint64_t v3;
  double result;

  if (+[PHUIConfiguration shouldUseExplicitLayoutDimensions](PHUIConfiguration, "shouldUseExplicitLayoutDimensions"))
  {
    -[PHEmergencyDialerViewController bottomToCancelBaselineOffsetForDxDevices](self, "bottomToCancelBaselineOffsetForDxDevices");
  }
  else
  {
    v3 = +[PHUIConfiguration handsetDialerSpacing](PHUIConfiguration, "handsetDialerSpacing");
    result = 26.0;
    if (v3 - 3 <= 3)
      return dbl_10023FF90[v3 - 3];
  }
  return result;
}

- (double)bottomToCancelBaselineOffsetForDxDevices
{
  unint64_t v2;

  v2 = +[PHUIConfiguration screenSize](PHUIConfiguration, "screenSize");
  if (v2 - 11 > 4)
    return 52.0;
  else
    return dbl_10023FFB0[v2 - 11];
}

- (id)digits
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PHEmergencyDialerViewController dialerView](self, "dialerView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "lcdView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "text"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringByApplyingTransform:reverse:", NSStringTransformToLatin, 0));
  if (v5)
  {
    v6 = TUNetworkCountryCode();
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[TUPhoneNumber phoneNumberWithDigits:countryCode:](TUPhoneNumber, "phoneNumberWithDigits:countryCode:", v5, v7));

    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "digits"));
    if (!objc_msgSend(v9, "length"))
    {
      v10 = v5;

      v9 = v10;
    }

    v4 = v9;
  }

  return v4;
}

+ (BOOL)isEmergencyNumber:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  NSObject *v11;
  _BOOL4 v12;
  id v13;
  NSObject *v14;
  uint64_t v15;
  NSObject *i;
  void *v17;
  void *v18;
  unsigned int v19;
  id v20;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t buf[4];
  id v28;
  __int16 v29;
  void *v30;
  _BYTE v31[128];

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[PHApplicationServices sharedInstance](PHApplicationServices, "sharedInstance"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "callProviderManager"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "emergencyProvider"));

  v7 = objc_alloc_init((Class)TUSenderIdentityClient);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "prioritizedSenderIdentities"));
  v9 = objc_msgSend(v8, "count");
  v10 = sub_1000C5588();
  v11 = objc_claimAutoreleasedReturnValue(v10);
  v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
  if (v9)
  {
    if (v12)
    {
      *(_DWORD *)buf = 138412290;
      v28 = v3;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Checking whether the digits %@ are an emergency telephone number.", buf, 0xCu);
    }

    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v13 = v8;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
    if (v14)
    {
      v22 = v6;
      v15 = *(_QWORD *)v24;
      while (2)
      {
        for (i = 0; i != v14; i = ((char *)i + 1))
        {
          if (*(_QWORD *)v24 != v15)
            objc_enumerationMutation(v13);
          v17 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)i);
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "UUID"));
          v19 = objc_msgSend(v7, "isEmergencyNumberForDigits:senderIdentityUUID:", v3, v18);

          if (v19)
          {
            v20 = sub_1000C5588();
            v14 = objc_claimAutoreleasedReturnValue(v20);
            if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              v28 = v3;
              v29 = 2112;
              v30 = v17;
              _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Digits %@ are an emergency telephone number for sender identity %@.", buf, 0x16u);
            }

            LOBYTE(v14) = 1;
            goto LABEL_16;
          }
        }
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
        if (v14)
          continue;
        break;
      }
LABEL_16:
      v6 = v22;
    }

  }
  else
  {
    if (v12)
    {
      *(_DWORD *)buf = 138412290;
      v28 = v3;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Checking whether the digits %@ is an emergency telephone number for nil sender identity.", buf, 0xCu);
    }

    LOBYTE(v14) = objc_msgSend(v7, "isEmergencyNumberForDigits:senderIdentityUUID:", v3, 0);
  }

  return (char)v14;
}

- (BOOL)shouldShowAirplaneEmergencyCallAlertForDialRequest:(id)a3
{
  id v3;
  unsigned __int8 v4;
  void *v6;
  void *v7;

  v3 = a3;
  if (sub_1000873AC()
    && objc_msgSend(v3, "isValid")
    && objc_msgSend(v3, "dialType") == (id)1
    && (objc_msgSend(v3, "isSOS") & 1) == 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localSenderIdentityUUID"));
    if (v6)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localSenderIdentityUUID"));
      if (+[TUCallCapabilities canAttemptEmergencyCallsWithoutCellularConnectionWithUUID:](TUCallCapabilities, "canAttemptEmergencyCallsWithoutCellularConnectionWithUUID:", v7))v4 = +[TUCallCapabilities supportsPrimaryCalling](TUCallCapabilities, "supportsPrimaryCalling");
      else
        v4 = 0;

    }
    else
    {
      v4 = 0;
    }

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)attemptToDialEmergencyCall
{
  id v3;
  NSObject *v4;
  void *v5;
  id v6;
  const __CFString *v7;
  void *v8;
  id v9;
  __CFString *v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  NSObject *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  NSObject *v29;
  PHAirplaneEmergencyCallAlert *v30;
  PHAirplaneEmergencyCallAlert *v31;
  char v32;
  id v33;
  NSObject *v34;
  NSObject *v35;
  void *v36;
  void **v37;
  uint64_t v38;
  id *(*v39)(id *, int);
  void *v40;
  PHEmergencyDialerViewController *v41;
  NSObject *v42;
  uint8_t buf[4];
  const __CFString *v44;

  +[NSObject cancelPreviousPerformRequestsWithTarget:selector:object:](NSObject, "cancelPreviousPerformRequestsWithTarget:selector:object:", self, "continueCyclingEmergencyTitleLabel", 0);
  v3 = sub_1000C5588();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
    v6 = objc_msgSend(v5, "currentCallCount");
    v7 = CFSTR("NO");
    if (!v6)
      v7 = CFSTR("YES");
    *(_DWORD *)buf = 138412290;
    v44 = v7;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[PHEmergencyDialerViewController dialEmergencyCall]: current call count is 0: %@", buf, 0xCu);

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
  v9 = objc_msgSend(v8, "currentCallCount");

  if (!v9)
  {
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue(-[PHEmergencyDialerViewController digits](self, "digits"));
    v11 = sub_1000C5588();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v44 = v10;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "dialEmergencyCall: digits to dial is %@", buf, 0xCu);
    }

    if (-[__CFString length](v10, "length"))
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[ICSApplicationServices sharedInstance](ICSApplicationServices, "sharedInstance"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "callProviderManager"));

      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "emergencyProvider"));
      v16 = sub_1000C5588();
      v17 = objc_claimAutoreleasedReturnValue(v16);
      v18 = v17;
      if (v15)
      {
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "dialEmergencyCall: dialing non-TTY emergency call", buf, 2u);
        }

        v19 = objc_msgSend(objc_alloc((Class)TUDialRequest), "initWithProvider:", v15);
        v20 = (void *)objc_claimAutoreleasedReturnValue(+[TUHandle handleWithDestinationID:](TUHandle, "handleWithDestinationID:", v10));
        objc_msgSend(v19, "setHandle:", v20);

        objc_msgSend(v19, "setPerformDialAssist:", 0);
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "prioritizedSenderIdentities"));
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "firstObject"));
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "UUID"));
        objc_msgSend(v19, "setLocalSenderIdentityUUID:", v23);

        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "prioritizedSenderIdentities"));
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "firstObject"));
        v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "accountUUID"));
        objc_msgSend(v19, "setLocalSenderIdentityAccountUUID:", v26);

        v27 = (void *)objc_claimAutoreleasedReturnValue(-[PHEmergencyDialerViewController senderIdentityClient](self, "senderIdentityClient"));
        v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "dialRequestByResolvingDialTypeUsingSenderIdentityClient:", v27));

        if (-[PHEmergencyDialerViewController shouldShowAirplaneEmergencyCallAlertForDialRequest:](self, "shouldShowAirplaneEmergencyCallAlertForDialRequest:", v18))
        {
          v28 = sub_1000C5588();
          v29 = objc_claimAutoreleasedReturnValue(v28);
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "An emergency call is being attempted with airplane mode enabled but Wi-Fi calling is available.", buf, 2u);
          }

          v30 = [PHAirplaneEmergencyCallAlert alloc];
          v37 = _NSConcreteStackBlock;
          v38 = 3221225472;
          v39 = sub_100096AEC;
          v40 = &unk_100284DF0;
          v41 = self;
          v18 = v18;
          v42 = v18;
          v31 = -[PHAirplaneEmergencyCallAlert initWithDialAction:](v30, "initWithDialAction:", &v37);
          -[PHAirplaneEmergencyCallAlert showOnViewController:](v31, "showOnViewController:", self, v37, v38, v39, v40, v41);

        }
        else
        {
          v32 = sub_100086FC4(v18);
          v33 = sub_1000C5588();
          v34 = objc_claimAutoreleasedReturnValue(v33);
          v35 = v34;
          if ((v32 & 1) != 0)
          {
            if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "Attempting an emergency call using a cellular network.", buf, 2u);
            }

            -[PHEmergencyDialerViewController dialEmergencyCallForDialRequest:](self, "dialEmergencyCallForDialRequest:", v18);
          }
          else
          {
            if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
              sub_1001AA0C8(v35);

            v36 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController networkUnavailableAlertControllerWithCallProvider:dialType:senderIdentityUUID:](UIAlertController, "networkUnavailableAlertControllerWithCallProvider:dialType:senderIdentityUUID:", v15, 1, 0));
            if (v36)
              -[PHEmergencyDialerViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v36, 1, 0);

          }
        }
      }
      else if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        sub_1001AA054((uint64_t)v14, v18);
      }

    }
  }
}

- (void)dialEmergencyCallForDialRequest:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  dispatch_semaphore_t v13;
  NSObject *v14;
  dispatch_time_t v15;
  BOOL v16;
  void *v17;
  void *v18;
  int v19;
  id v20;
  NSObject *v21;
  id v22;
  void ***v23;
  void *v24;
  void *v25;
  unsigned int v26;
  void *v27;
  void *v28;
  unsigned int v29;
  void *v30;
  unsigned int v31;
  id v32;
  void *v33;
  uint64_t v34;
  id v35;
  NSObject *v36;
  void *v37;
  void *v38;
  id v39;
  NSObject *v40;
  id v41;
  NSObject *v42;
  void *v43;
  void *v44;
  id v45;
  NSObject *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void **v54;
  uint64_t v55;
  void (*v56)(uint64_t, int);
  void *v57;
  id v58;
  _QWORD v59[4];
  id v60;
  NSObject *v61;
  __int128 *p_buf;
  __int128 buf;
  uint64_t v64;
  char v65;

  v4 = a3;
  if (!-[PHEmergencyDialerViewController shouldShowRTTAlertForDialRequest:](self, "shouldShowRTTAlertForDialRequest:", v4))goto LABEL_6;
  v5 = sub_1000F8B14();
  if (!v5)
    goto LABEL_6;
  v6 = v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "handle"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "value"));

  if (objc_msgSend(v8, "destinationIdIsPhoneNumber"))
  {
    v9 = TUHomeCountryCode();
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v11 = TUFormattedPhoneNumber(v8, v10);
    v12 = objc_claimAutoreleasedReturnValue(v11);

    v8 = (void *)v12;
  }
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v64 = 0x2020000000;
  v65 = 1;
  v13 = dispatch_semaphore_create(0);
  v59[0] = _NSConcreteStackBlock;
  v59[1] = 3221225472;
  v59[2] = sub_1000971B4;
  v59[3] = &unk_100286D98;
  v60 = v4;
  p_buf = &buf;
  v14 = v13;
  v61 = v14;
  objc_msgSend(v6, "displayCallPromptForContact:withCompletion:", v8, v59);
  v15 = dispatch_time(0, 15000000000);
  dispatch_semaphore_wait(v14, v15);
  objc_msgSend(v6, "cancelCallPromptDisplay");
  v16 = *(_BYTE *)(*((_QWORD *)&buf + 1) + 24) == 0;

  _Block_object_dispose(&buf, 8);
  if (!v16)
  {
LABEL_6:
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "handle"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "value"));
    v19 = TUIsMMIOrUSSDNumber();

    if (v19)
    {
      v20 = sub_1000C5588();
      v21 = objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf) = 0;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "dialEmergencyCall: Digits to dial are MMI/USSD, so dialing directly as a normal dial request", (uint8_t *)&buf, 2u);
      }

      v54 = _NSConcreteStackBlock;
      v55 = 3221225472;
      v56 = sub_100097220;
      v57 = &unk_1002848C0;
      v22 = v4;
      v58 = v22;
      v23 = objc_retainBlock(&v54);
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "handle", v54, v55, v56, v57));
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "value"));
      v26 = +[PHInCallUIUtilities shouldRequestPasscodeUnlockForMMICode:](PHInCallUIUtilities, "shouldRequestPasscodeUnlockForMMICode:", v25);

      if (v26)
      {
        v27 = (void *)objc_claimAutoreleasedReturnValue(+[PHInCallUtilities sharedInstance](PHInCallUtilities, "sharedInstance"));
        objc_msgSend(v27, "requestPasscodeUnlockWithCompletion:", v23);

      }
      else
      {
        ((void (*)(void ***, uint64_t))v23[2])(v23, 1);
      }

      v38 = v58;
    }
    else
    {
      v28 = (void *)objc_claimAutoreleasedReturnValue(+[PHInCallUtilities sharedInstance](PHInCallUtilities, "sharedInstance"));
      v29 = objc_msgSend(v28, "isSetupAssistantRunning");

      v30 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
      v31 = objc_msgSend(v30, "isPasscodeRequiredToUnlock");

      v32 = sub_10000D540(CFSTR("EmergencyDialerAllowsAllCalls"), TUBundleIdentifierInCallServiceApplication);
      v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
      LODWORD(v30) = objc_msgSend(v33, "BOOLValue");

      if ((((v29 | v31 | +[APApplication isPhoneAppLocked](APApplication, "isPhoneAppLocked")) ^ 1 | v30) & 1) == 0)
      {
        objc_msgSend(v4, "setDialType:", 1);
        if (v31)
          v34 = 2;
        else
          v34 = 0;
        objc_msgSend(v4, "setOriginatingUIType:", v34);
      }
      v35 = sub_1000C5588();
      v36 = objc_claimAutoreleasedReturnValue(v35);
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf) = 138412290;
        *(_QWORD *)((char *)&buf + 4) = v4;
        _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "dialEmergencyCall: preparing to dial request %@", (uint8_t *)&buf, 0xCu);
      }

      v37 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
      v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "dialWithRequest:", v4));

      v39 = sub_1000C5588();
      v40 = objc_claimAutoreleasedReturnValue(v39);
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf) = 138412290;
        *(_QWORD *)((char *)&buf + 4) = v38;
        _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "dialEmergencyCall: emergency call from request is %@", (uint8_t *)&buf, 0xCu);
      }

      if (!v38)
        goto LABEL_28;
      if (_os_feature_enabled_impl("ConversationKit", "EnhancedEmergency"))
      {
        v41 = sub_1000C5588();
        v42 = objc_claimAutoreleasedReturnValue(v41);
        if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(buf) = 0;
          _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "EnhancedEmergency: request full screen presentation for call from lock screen", (uint8_t *)&buf, 2u);
        }

        v43 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
        v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "delegate"));
        objc_msgSend(v44, "requestPresentationForCall:dialRequest:", v38, v4);

        v45 = sub_1000C5588();
        v46 = objc_claimAutoreleasedReturnValue(v45);
        if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(buf) = 0;
          _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEFAULT, "EnhancedEmergency: dismiss emergency dialer due to ICS launch", (uint8_t *)&buf, 2u);
        }

        +[TUCallCapabilities endEmergencyCallbackMode](TUCallCapabilities, "endEmergencyCallbackMode");
        v47 = (void *)objc_claimAutoreleasedReturnValue(-[PHEmergencyDialerViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy"));
        objc_msgSend(v47, "dismiss");

      }
      if (objc_msgSend(v38, "status") == 6)
      {
LABEL_28:
        v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "localizedStringForKey:value:table:", CFSTR("EMERGENCY_CALLS_ONLY"), &stru_10028DC20, CFSTR("EmergencyCallStrings")));
        v50 = (void *)objc_claimAutoreleasedReturnValue(-[PHEmergencyDialerViewController dialerView](self, "dialerView"));
        v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "emergencyTitleLabel"));
        objc_msgSend(v51, "setText:", v49);

        v52 = (void *)objc_claimAutoreleasedReturnValue(-[PHEmergencyDialerViewController dialerView](self, "dialerView"));
        v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "lcdView"));
        objc_msgSend(v53, "setText:needsFormat:", &stru_10028DC20, 0);

        -[PHEmergencyDialerViewController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", "continueCyclingEmergencyTitleLabel", 0, 3.0);
      }
    }

  }
}

- (void)handleUseRTTActionForButtonSender:(id)a3 event:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v5 = a3;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[PHEmergencyDialerViewController useRTTButton](self, "useRTTButton"));

  if (v6 == v5)
  {
    v9 = (id)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "frontmostCall"));
    objc_msgSend(v9, "setTTYType:forCall:", 1, v8);

  }
}

- (void)refreshUseRTTButton
{
  double v3;
  void *v4;
  _BOOL8 v5;
  id v6;

  v3 = (double)-[PHEmergencyDialerViewController shouldShowUseRTTButton](self, "shouldShowUseRTTButton");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHEmergencyDialerViewController useRTTButton](self, "useRTTButton"));
  objc_msgSend(v4, "setAlpha:", v3);

  v5 = -[PHEmergencyDialerViewController shouldShowUseRTTButton](self, "shouldShowUseRTTButton");
  v6 = (id)objc_claimAutoreleasedReturnValue(-[PHEmergencyDialerViewController useRTTButton](self, "useRTTButton"));
  objc_msgSend(v6, "setEnabled:", v5);

}

- (BOOL)shouldShowRTTAlertForDialRequest:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  unsigned __int8 v6;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
  if (objc_msgSend(v4, "currentCallCount") || !objc_msgSend(v3, "isValid"))
  {
    v6 = 0;
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "provider"));
    if (objc_msgSend(v5, "isTelephonyProvider"))
    {
      if ((objc_msgSend(v3, "isRTTAvailable") & 1) != 0)
        v6 = 1;
      else
        v6 = objc_msgSend(v3, "isTTYAvailable");
    }
    else
    {
      v6 = 0;
    }

  }
  return v6;
}

- (BOOL)shouldShowUseRTTButton
{
  void *v2;
  void *v3;
  void *v4;
  _BOOL4 v5;
  id v6;
  NSObject *v7;
  const __CFString *v8;
  int v10;
  const __CFString *v11;
  __int16 v12;
  void *v13;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "frontmostCall"));

  if (v3
    && objc_msgSend(v3, "status") == 1
    && (objc_msgSend(v3, "isRTT") & 1) == 0
    && (objc_msgSend(v3, "isTTY") & 1) == 0
    && objc_msgSend(v3, "supportsTTYWithVoice"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
    v5 = objc_msgSend(v4, "currentCallCount") == (id)1;

  }
  else
  {
    v5 = 0;
  }
  v6 = sub_1000C5588();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = CFSTR("should not");
    if (v5)
      v8 = CFSTR("should");
    v10 = 138412546;
    v11 = v8;
    v12 = 2112;
    v13 = v3;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Determined that the Use RTT button %@ be presented during the emergency call %@.", (uint8_t *)&v10, 0x16u);
  }

  return v5;
}

- (UIButton)useRTTButton
{
  UIButton *useRTTButton;
  id v4;
  void *v5;
  void *v6;
  UIButton *v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  UIButton *v16;

  useRTTButton = self->_useRTTButton;
  if (!useRTTButton)
  {
    v4 = sub_1000F8B14();
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "frontmostCall"));

    v7 = (UIButton *)objc_claimAutoreleasedReturnValue(+[PHEdgeInsetButton buttonWithType:](PHEdgeInsetButton, "buttonWithType:", 1));
    -[UIButton setTouchAreaEdgeInsets:](v7, "setTouchAreaEdgeInsets:", -15.0, -15.0, -15.0, -15.0);
    -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIButton addTarget:action:forControlEvents:](v7, "addTarget:action:forControlEvents:", self, "handleUseRTTActionForButtonSender:event:", 64);
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localSenderIdentityUUID"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "rttDisplayName:forSubscriptionContextUUID:", 1, v8));
    -[UIButton setTitle:forState:](v7, "setTitle:forState:", v9, 0);

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
    -[UIButton setTitleColor:forState:](v7, "setTitleColor:forState:", v10, 0);

    v11 = +[PHUIConfiguration handsetDialerSpacing](PHUIConfiguration, "handsetDialerSpacing");
    v12 = 16.0;
    if (!v11)
      v12 = 14.0;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:", v12));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton titleLabel](v7, "titleLabel"));
    objc_msgSend(v14, "setFont:", v13);

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton titleLabel](v7, "titleLabel"));
    objc_msgSend(v15, "setTextAlignment:", 1);

    v16 = self->_useRTTButton;
    self->_useRTTButton = v7;

    useRTTButton = self->_useRTTButton;
  }
  return useRTTButton;
}

- (void)handleTUCallSupportsTTYWithVoiceChangedNotification:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;

  v4 = a3;
  v5 = sub_1000C5588();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8 = (void *)objc_opt_class(self, v7);
    v9 = v8;
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name"));
    v11 = 138412546;
    v12 = v8;
    v13 = 2112;
    v14 = v10;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%@ is handling %@", (uint8_t *)&v11, 0x16u);

  }
  -[PHEmergencyDialerViewController refreshUseRTTButton](self, "refreshUseRTTButton");

}

- (void)handleTUCallTTYTypeChangedNotification:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;

  v4 = a3;
  v5 = sub_1000C5588();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8 = (void *)objc_opt_class(self, v7);
    v9 = v8;
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name"));
    v11 = 138412546;
    v12 = v8;
    v13 = 2112;
    v14 = v10;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%@ is handling %@", (uint8_t *)&v11, 0x16u);

  }
  -[PHEmergencyDialerViewController refreshUseRTTButton](self, "refreshUseRTTButton");

}

- (void)stewieAlertButtonTapped:(id)a3
{
  void *v3;
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication", a3));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "delegate"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "alertCoordinator"));
  objc_msgSend(v4, "invokeAlertWithRequestUnlock:automaticallyInvoked:", 1, 0);

}

- (void)alertWillInvoke
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("PHAlertDisconnectingCallsNotification"), 0);

}

- (void)updatePresentationStateWithAllowed:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  if (-[PHEmergencyDialerViewController shouldPresentAlertButton](self, "shouldPresentAlertButton") != a3)
  {
    -[PHEmergencyDialerViewController setShouldPresentAlertButton:](self, "setShouldPresentAlertButton:", v3);
    -[PHEmergencyDialerViewController updateCurrentState](self, "updateCurrentState");
  }
}

- (BOOL)shouldSetPresenceToken
{
  return self->_shouldSetPresenceToken;
}

- (void)setShouldSetPresenceToken:(BOOL)a3
{
  self->_shouldSetPresenceToken = a3;
}

- (PHEmergencyHandsetDialerView)dialerView
{
  return (PHEmergencyHandsetDialerView *)objc_getProperty(self, a2, 32, 1);
}

- (void)setDialerView:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSTimer)callDurationTimer
{
  return self->_callDurationTimer;
}

- (void)setCallDurationTimer:(id)a3
{
  objc_storeStrong((id *)&self->_callDurationTimer, a3);
}

- (UIButton)backButton
{
  return (UIButton *)objc_getProperty(self, a2, 48, 1);
}

- (void)setBackButton:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (UIButton)medicalIDButton
{
  return (UIButton *)objc_getProperty(self, a2, 56, 1);
}

- (void)setMedicalIDButton:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (UIButton)endButton
{
  return (UIButton *)objc_getProperty(self, a2, 64, 1);
}

- (void)setEndButton:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (signed)currentState
{
  return self->_currentState;
}

- (BOOL)callEnding
{
  return self->_callEnding;
}

- (void)setCallEnding:(BOOL)a3
{
  self->_callEnding = a3;
}

- (HKHealthStore)healthStore
{
  return (HKHealthStore *)objc_getProperty(self, a2, 72, 1);
}

- (void)setHealthStore:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (UIViewController)medicalIDViewController
{
  return (UIViewController *)objc_getProperty(self, a2, 80, 1);
}

- (void)setMedicalIDViewController:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (NSLayoutConstraint)endButtonHorizontalConstraint
{
  return self->_endButtonHorizontalConstraint;
}

- (void)setEndButtonHorizontalConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_endButtonHorizontalConstraint, a3);
}

- (UIButton)stewieAlertButton
{
  return (UIButton *)objc_getProperty(self, a2, 96, 1);
}

- (void)setStewieAlertButton:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (UIButton)stewieEndCallButton
{
  return (UIButton *)objc_getProperty(self, a2, 104, 1);
}

- (void)setStewieEndCallButton:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (BOOL)shouldPresentAlertButton
{
  return self->_shouldPresentAlertButton;
}

- (void)setShouldPresentAlertButton:(BOOL)a3
{
  self->_shouldPresentAlertButton = a3;
}

- (UINotificationFeedbackGenerator)alertFeedbackGenerator
{
  return self->_alertFeedbackGenerator;
}

- (void)setAlertFeedbackGenerator:(id)a3
{
  objc_storeStrong((id *)&self->_alertFeedbackGenerator, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alertFeedbackGenerator, 0);
  objc_storeStrong((id *)&self->_stewieEndCallButton, 0);
  objc_storeStrong((id *)&self->_stewieAlertButton, 0);
  objc_storeStrong((id *)&self->_endButtonHorizontalConstraint, 0);
  objc_storeStrong((id *)&self->_medicalIDViewController, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);
  objc_storeStrong((id *)&self->_endButton, 0);
  objc_storeStrong((id *)&self->_medicalIDButton, 0);
  objc_storeStrong((id *)&self->_backButton, 0);
  objc_storeStrong((id *)&self->_callDurationTimer, 0);
  objc_storeStrong((id *)&self->_dialerView, 0);
  objc_storeStrong((id *)&self->_useRTTButton, 0);
  objc_storeStrong((id *)&self->_senderIdentityClient, 0);
}

@end
