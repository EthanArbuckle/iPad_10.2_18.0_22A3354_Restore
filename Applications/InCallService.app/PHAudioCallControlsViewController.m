@implementation PHAudioCallControlsViewController

- (PHAudioCallControlsViewController)initWithCallDisplayStyleManager:(id)a3
{
  id v5;
  PHAudioCallControlsViewController *v6;
  PHAudioCallControlsViewController *v7;
  uint64_t v8;
  CNKFeatures *features;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v16;

  v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)PHAudioCallControlsViewController;
  v6 = -[PHAudioCallControlsViewController init](&v16, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_callDisplayStyleManager, a3);
    v7->_contactStoreAuthorized = +[CNContactStore phoneKit_isAuthorized](CNContactStore, "phoneKit_isAuthorized");
    v8 = objc_claimAutoreleasedReturnValue(+[CNKFeatures sharedInstance](CNKFeatures, "sharedInstance"));
    features = v7->_features;
    v7->_features = (CNKFeatures *)v8;

    v7->_updatesPaused = 0;
    v7->_proximitySensorNotificationToken = 0;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
    -[PHAudioCallControlsViewController setCallCenter:](v7, "setCallCenter:", v10);

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallControlsViewController callCenter](v7, "callCenter"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "routeController"));
    objc_msgSend(v12, "addDelegate:", v7);

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallControlsViewController callCenter](v7, "callCenter"));
    -[PHAudioCallControlsViewController setCallContainer:](v7, "setCallContainer:", v13);

    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v14, "addObserver:selector:name:object:", v7, "callStatusChangedNotification:", TUCallCenterCallStatusChangedNotification, 0);
    objc_msgSend(v14, "addObserver:selector:name:object:", v7, "callStatusChangedNotification:", TUCallCenterVideoCallStatusChangedNotification, 0);
    objc_msgSend(v14, "addObserver:selector:name:object:", v7, "callIsOnHoldChangedNotification:", TUCallIsOnHoldChangedNotification, 0);
    objc_msgSend(v14, "addObserver:selector:name:object:", v7, "conferenceParticipantCallsChangedNotification:", TUCallCenterConferenceParticipantsChangedNotification, 0);
    objc_msgSend(v14, "addObserver:selector:name:object:", v7, "callModelChangedNotification:", TUCallModelChangedNotification, 0);
    objc_msgSend(v14, "addObserver:selector:name:object:", v7, "faceTimeIDStatusChangedNotification:", TUCallFaceTimeIDStatusChangedNotification, 0);
    objc_msgSend(v14, "addObserver:selector:name:object:", v7, "uplinkStateChangedNotification:", TUCallIsUplinkMutedChangedNotification, 0);
    objc_msgSend(v14, "addObserver:selector:name:object:", v7, "handleTUCallSupportsTTYWithVoiceChangedNotification:", TUCallSupportsTTYWithVoiceChangedNotification, 0);
    objc_msgSend(v14, "addObserver:selector:name:object:", v7, "handleTUCallTTYTypeChangedNotification:", TUCallTTYTypeChangedNotification, 0);

  }
  return v7;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)PHAudioCallControlsViewController;
  -[PHAudioCallControlsViewController dealloc](&v4, "dealloc");
}

- (void)loadView
{
  PHAudioCallControlsView *v3;
  void *v4;
  PHAudioCallControlsView *v5;
  PHAudioCallControlsView *controlsView;

  v3 = [PHAudioCallControlsView alloc];
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallControlsViewController callDisplayStyleManager](self, "callDisplayStyleManager"));
  v5 = -[PHAudioCallControlsView initWithCallDisplayStyleManager:](v3, "initWithCallDisplayStyleManager:", v4);
  controlsView = self->_controlsView;
  self->_controlsView = v5;

  -[PHAudioCallControlsView setDelegate:](self->_controlsView, "setDelegate:", self);
  -[PHAudioCallControlsViewController setView:](self, "setView:", self->_controlsView);
}

- (id)speakerphoneTipReferenceButton
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallControlsViewController controlsView](self, "controlsView"));
  v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "buttonForControlType:", 2));

  if ((v4
     || (v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallControlsViewController controlsView](self, "controlsView")),
         v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "buttonForControlType:", 3)),
         v5,
         v4))
    && objc_msgSend(v4, "state") != (id)4
    && objc_msgSend(v4, "state") != (id)2)
  {
    v4 = v4;
    v6 = v4;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  id v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PHAudioCallControlsViewController;
  -[PHAudioCallControlsViewController viewDidAppear:](&v6, "viewDidAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallControlsViewController callDisplayStyleManager](self, "callDisplayStyleManager"));
  v5 = objc_msgSend(v4, "callDisplayStyle");

  if (v5 == (id)2)
    -[PHAudioCallControlsViewController tipKitStartObservation](self, "tipKitStartObservation");
}

- (void)viewWillDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PHAudioCallControlsViewController;
  -[PHAudioCallControlsViewController viewWillDisappear:](&v4, "viewWillDisappear:", a3);
  -[PHAudioCallControlsViewController tipKitStopObservation](self, "tipKitStopObservation");
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)callStatusChangedNotification:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;

  v4 = a3;
  v5 = sub_1000C5588();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    objc_opt_class(self, v7);
    v9 = v8;
    v10 = v8;
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name"));
    v12 = 138412546;
    v13 = v9;
    v14 = 2112;
    v15 = v11;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%@ is handling %@", (uint8_t *)&v12, 0x16u);

  }
  -[PHAudioCallControlsViewController updateControls](self, "updateControls");

}

- (void)callIsOnHoldChangedNotification:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;

  v4 = a3;
  v5 = sub_1000C5588();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    objc_opt_class(self, v7);
    v9 = v8;
    v10 = v8;
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name"));
    v12 = 138412546;
    v13 = v9;
    v14 = 2112;
    v15 = v11;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%@ is handling %@", (uint8_t *)&v12, 0x16u);

  }
  -[PHAudioCallControlsViewController updateControls](self, "updateControls");

}

- (void)conferenceParticipantCallsChangedNotification:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;

  v4 = a3;
  v5 = sub_1000C5588();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    objc_opt_class(self, v7);
    v9 = v8;
    v10 = v8;
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name"));
    v12 = 138412546;
    v13 = v9;
    v14 = 2112;
    v15 = v11;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%@ is handling %@", (uint8_t *)&v12, 0x16u);

  }
  -[PHAudioCallControlsViewController updateControls](self, "updateControls");

}

- (void)faceTimeIDStatusChangedNotification:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;

  v4 = a3;
  v5 = sub_1000C5588();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    objc_opt_class(self, v7);
    v9 = v8;
    v10 = v8;
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name"));
    v12 = 138412546;
    v13 = v9;
    v14 = 2112;
    v15 = v11;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%@ is handling %@", (uint8_t *)&v12, 0x16u);

  }
  -[PHAudioCallControlsViewController updateControls](self, "updateControls");

}

- (void)callModelChangedNotification:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;

  v4 = a3;
  v5 = sub_1000C5588();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    objc_opt_class(self, v7);
    v9 = v8;
    v10 = v8;
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name"));
    v12 = 138412546;
    v13 = v9;
    v14 = 2112;
    v15 = v11;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%@ is handling %@", (uint8_t *)&v12, 0x16u);

  }
  -[PHAudioCallControlsViewController updateControls](self, "updateControls");

}

- (void)uplinkStateChangedNotification:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;

  v4 = a3;
  v5 = sub_1000C5588();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    objc_opt_class(self, v7);
    v9 = v8;
    v10 = v8;
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name"));
    v12 = 138412546;
    v13 = v9;
    v14 = 2112;
    v15 = v11;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%@ is handling %@", (uint8_t *)&v12, 0x16u);

  }
  -[PHAudioCallControlsViewController updateControls](self, "updateControls");

}

- (void)handleTUCallSupportsTTYWithVoiceChangedNotification:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;

  v4 = a3;
  v5 = sub_1000C5588();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    objc_opt_class(self, v7);
    v9 = v8;
    v10 = v8;
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name"));
    v12 = 138412546;
    v13 = v9;
    v14 = 2112;
    v15 = v11;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%@ is handling %@", (uint8_t *)&v12, 0x16u);

  }
  -[PHAudioCallControlsViewController updateControls](self, "updateControls");

}

- (void)handleTUCallTTYTypeChangedNotification:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;

  v4 = a3;
  v5 = sub_1000C5588();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    objc_opt_class(self, v7);
    v9 = v8;
    v10 = v8;
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name"));
    v12 = 138412546;
    v13 = v9;
    v14 = 2112;
    v15 = v11;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%@ is handling %@", (uint8_t *)&v12, 0x16u);

  }
  -[PHAudioCallControlsViewController updateControls](self, "updateControls");

}

- (unint64_t)numberOfRowsInControlsView:(id)a3
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallControlsViewController currentArrangement](self, "currentArrangement", a3));
  v4 = objc_msgSend(v3, "rows");

  return (unint64_t)v4;
}

- (unint64_t)numberOfColumnsInControlsView:(id)a3
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallControlsViewController currentArrangement](self, "currentArrangement", a3));
  v4 = objc_msgSend(v3, "columns");

  return (unint64_t)v4;
}

- (unint64_t)controlTypeAtRow:(unint64_t)a3 column:(unint64_t)a4
{
  void *v6;
  id v7;

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallControlsViewController currentArrangement](self, "currentArrangement"));
  v7 = objc_msgSend(v6, "controlTypeAtRow:column:", a3, a4);

  return (unint64_t)v7;
}

- (void)fetchAudioRoutesImageWithCompletion:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "routeController"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000FAE98;
  v7[3] = &unk_1002868B0;
  v8 = v3;
  v6 = v3;
  objc_msgSend(v5, "fetchAudioControlsGlyphWithCompletion:", v7);

}

- (id)imageForControlType:(unint64_t)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned int v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;

  v4 = 0;
  switch(a3)
  {
    case 0uLL:
      v4 = 21;
      goto LABEL_26;
    case 1uLL:
      v4 = 18;
      goto LABEL_26;
    case 2uLL:
      v4 = objc_claimAutoreleasedReturnValue(+[TURoute speakerAudioRouteGlyph](TURoute, "speakerAudioRouteGlyph"));
      if (!v4)
        goto LABEL_26;
      return (id)v4;
    case 4uLL:
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallControlsViewController features](self, "features"));
      if (objc_msgSend(v5, "isButtonLayoutEnabled"))
        v4 = 17;
      else
        v4 = 16;

      goto LABEL_26;
    case 5uLL:
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallControlsViewController callContainer](self, "callContainer"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "frontmostCall"));
      v8 = objc_msgSend(v7, "faceTimeIDStatus");

      if (v8 == 2)
        v4 = 5;
      else
        v4 = 7;
      goto LABEL_26;
    case 6uLL:
      v4 = 12;
      goto LABEL_26;
    case 7uLL:
      v4 = 13;
      goto LABEL_26;
    case 8uLL:
      v4 = 25;
      goto LABEL_26;
    case 9uLL:
      v4 = 20;
      goto LABEL_26;
    case 0xAuLL:
      v4 = 19;
      goto LABEL_26;
    case 0xBuLL:
    case 0xEuLL:
      v4 = 28;
      goto LABEL_26;
    case 0xCuLL:
    case 0x11uLL:
      v4 = 5;
      goto LABEL_26;
    case 0xDuLL:
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallControlsViewController delegate](self, "delegate"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "frontmostCallProviderIconForAudioCallControlsViewController:", self));
      v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "imageWithRenderingMode:", 2));

      if (!v4)
        goto LABEL_26;
      return (id)v4;
    case 0xFuLL:
      v4 = 2;
      goto LABEL_26;
    case 0x10uLL:
      v11 = objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](UIImage, "imageNamed:", CFSTR("text_sos_icon")));
      goto LABEL_29;
    case 0x12uLL:
      v4 = 85;
      goto LABEL_26;
    case 0x13uLL:
      v4 = 86;
      goto LABEL_26;
    default:
LABEL_26:
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallControlsViewController callDisplayStyleManager](self, "callDisplayStyleManager"));
      v13 = objc_msgSend(v12, "callDisplayStyle");

      if (v13 == (id)3)
        v11 = objc_claimAutoreleasedReturnValue(+[UIImage tpHierarchicalImageForSymbolType:pointSize:scale:](UIImage, "tpHierarchicalImageForSymbolType:pointSize:scale:", v4, 2, 32.0));
      else
        v11 = objc_claimAutoreleasedReturnValue(+[UIImage tpHierarchicalImageForSymbolType:pointSize:](UIImage, "tpHierarchicalImageForSymbolType:pointSize:", v4, 32.0));
LABEL_29:
      v4 = v11;
      return (id)v4;
  }
}

- (id)titleForControlType:(unint64_t)a3
{
  void *v3;
  void *v4;
  const __CFString *v5;
  void *v6;
  void *v7;
  void *v8;

  switch(a3)
  {
    case 0uLL:
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v4 = v3;
      v5 = CFSTR("MUTE");
      goto LABEL_23;
    case 1uLL:
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v4 = v3;
      v5 = CFSTR("KEYPAD");
      goto LABEL_23;
    case 2uLL:
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v4 = v3;
      v5 = CFSTR("SPEAKER");
      goto LABEL_23;
    case 3uLL:
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v4 = v3;
      v5 = CFSTR("ROUTE");
      goto LABEL_23;
    case 4uLL:
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v4 = v3;
      v5 = CFSTR("ADD");
      goto LABEL_23;
    case 5uLL:
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v4 = v3;
      v5 = CFSTR("FACETIME");
      goto LABEL_23;
    case 6uLL:
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v4 = v3;
      v5 = CFSTR("CONTACTS");
      goto LABEL_23;
    case 7uLL:
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v4 = v3;
      v5 = CFSTR("MESSAGES");
      goto LABEL_23;
    case 8uLL:
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v4 = v3;
      v5 = CFSTR("HOLD");
      goto LABEL_23;
    case 9uLL:
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v4 = v3;
      v5 = CFSTR("SWAP");
      goto LABEL_23;
    case 0xAuLL:
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v4 = v3;
      v5 = CFSTR("MERGE");
      goto LABEL_23;
    case 0xBuLL:
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v4 = v3;
      v5 = CFSTR("TTY");
      goto LABEL_23;
    case 0xCuLL:
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v4 = v3;
      v5 = CFSTR("VIDEO");
      goto LABEL_23;
    case 0xDuLL:
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallControlsViewController callContainer](self, "callContainer"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "frontmostCall"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "provider"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedName"));

      goto LABEL_24;
    case 0xEuLL:
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v4 = v3;
      v5 = CFSTR("RTT");
      goto LABEL_23;
    case 0xFuLL:
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v4 = v3;
      v5 = CFSTR("END");
      goto LABEL_23;
    case 0x10uLL:
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v4 = v3;
      v5 = CFSTR("EMERGENCY_TEXT");
      goto LABEL_23;
    case 0x11uLL:
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v4 = v3;
      v5 = CFSTR("LIVE_VIDEO");
      goto LABEL_23;
    case 0x12uLL:
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v4 = v3;
      v5 = CFSTR("SHARE_MEDIA");
      goto LABEL_23;
    case 0x13uLL:
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v4 = v3;
      v5 = CFSTR("SHARE_CARD");
LABEL_23:
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", v5, &stru_10028DC20, CFSTR("InCallService")));
LABEL_24:

      break;
    default:
      v6 = 0;
      break;
  }
  return v6;
}

- (void)updateControls
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  id v7;
  id v8;
  uint8_t buf[4];
  void *v10;

  if (-[PHAudioCallControlsViewController updatesPaused](self, "updatesPaused"))
  {
    v3 = sub_1000C5588();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      objc_opt_class(self, v5);
      *(_DWORD *)buf = 138412290;
      v10 = v6;
      v7 = v6;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%@ updates are paused, skipping update.", buf, 0xCu);

    }
  }
  else
  {
    v8 = (id)objc_claimAutoreleasedReturnValue(-[PHAudioCallControlsViewController controlsView](self, "controlsView"));
    objc_msgSend(v8, "updateControls");

  }
}

- (void)controlTypeTapped:(unint64_t)a3 forView:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  unsigned int v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  unsigned int v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  NSObject *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  unsigned int v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  id v54;
  const char *v55;
  id v56;
  int v57;
  unint64_t v58;
  __int16 v59;
  void *v60;

  v6 = a4;
  v7 = sub_1000C5588();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v57 = 134217984;
    v58 = a3;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Control type tapped (%lu)", (uint8_t *)&v57, 0xCu);
  }

  switch(a3)
  {
    case 0uLL:
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallControlsViewController callContainer](self, "callContainer"));
      v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "frontmostCall"));

      objc_msgSend(v9, "setUplinkMuted:", objc_msgSend(v9, "isUplinkMuted") ^ 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallControlsViewController controlsView](self, "controlsView"));
      objc_msgSend(v11, "setSelectedState:forControlType:", objc_msgSend(v9, "isUplinkMuted"), 0);

      v12 = objc_claimAutoreleasedReturnValue(-[PHAudioCallControlsViewController delegate](self, "delegate"));
      -[NSObject audioCallControlsViewControllerDidToggleMuteButton:](v12, "audioCallControlsViewControllerDidToggleMuteButton:", objc_msgSend(v9, "isUplinkMuted"));
      goto LABEL_45;
    case 1uLL:
      -[PHAudioCallControlsViewController tipKitStopObservation](self, "tipKitStopObservation");
      v9 = (id)objc_claimAutoreleasedReturnValue(-[PHAudioCallControlsViewController delegate](self, "delegate"));
      objc_msgSend(v9, "audioCallControlsViewControllerRequestedKeypadPresentation:", self);
      goto LABEL_46;
    case 2uLL:
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "routeController"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "pickedRoute"));
      v16 = objc_msgSend(v15, "isSpeaker");

      v17 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "routeController"));
      v19 = v18;
      if (v16)
      {
        v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "routeForSpeakerDisable"));

        if (v9)
        {
          v20 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
          v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "routeController"));
          objc_msgSend(v21, "pickRoute:", v9);

          v12 = objc_claimAutoreleasedReturnValue(-[PHAudioCallControlsViewController controlsView](self, "controlsView"));
          -[NSObject setSelectedState:forControlType:](v12, "setSelectedState:forControlType:", 0, 2);
          goto LABEL_45;
        }
        v54 = sub_1000C5588();
        v12 = objc_claimAutoreleasedReturnValue(v54);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v57) = 0;
          v55 = "[WARN] Could not find available route to pick for speaker disable";
LABEL_44:
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, v55, (uint8_t *)&v57, 2u);
        }
      }
      else
      {
        v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "routeForSpeakerEnable"));

        if (v9)
        {
          v41 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
          v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "routeController"));
          objc_msgSend(v42, "pickRoute:", v9);

          v43 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallControlsViewController controlsView](self, "controlsView"));
          objc_msgSend(v43, "setSelectedState:forControlType:", 1, 2);

          +[TPTipsHelper donateEventSpeakerUsed](TPTipsHelper, "donateEventSpeakerUsed");
          goto LABEL_46;
        }
        v56 = sub_1000C5588();
        v12 = objc_claimAutoreleasedReturnValue(v56);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v57) = 0;
          v55 = "[WARN] Could not find available route to pick for speaker enable";
          goto LABEL_44;
        }
      }
LABEL_45:

LABEL_46:
LABEL_47:

      return;
    case 3uLL:
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "routeController"));
      v24 = objc_msgSend(v23, "areAuxiliaryRoutesAvailable");

      if (!v24)
        goto LABEL_47;
      v9 = (id)objc_claimAutoreleasedReturnValue(-[PHAudioCallControlsViewController delegate](self, "delegate"));
      objc_msgSend(v9, "audioCallControlsViewControllerRequestedAudioRoutesPresentation:", self);
      goto LABEL_46;
    case 4uLL:
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallControlsViewController view](self, "view"));
      v26 = objc_msgSend(v25, "_currentUserInterfaceIdiom");

      v27 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallControlsViewController delegate](self, "delegate"));
      v9 = v27;
      if (v26 == (id)1)
        goto LABEL_17;
      objc_msgSend(v27, "audioCallControlsViewControllerRequestedAddCallPresentation:forView:", self, v6);
      goto LABEL_46;
    case 5uLL:
      v28 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallControlsViewController callContainer](self, "callContainer"));
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "callWithStatus:", 1));
      v30 = v29;
      if (v29)
      {
        v9 = v29;
      }
      else
      {
        v44 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallControlsViewController callContainer](self, "callContainer"));
        v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "callWithStatus:", 2));

      }
      v45 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
      objc_msgSend(v45, "requestVideoUpgradeForCall:originatingUIType:", v9, 27);

      objc_msgSend(v9, "setIsSendingVideo:", 1);
      v46 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
      v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "routeController"));
      v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "pickedRoute"));
      v49 = objc_msgSend(v48, "isReceiver");

      if (!v49)
        goto LABEL_46;
      v12 = objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
      v50 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject routeController](v12, "routeController"));
      v51 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
      v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "routeController"));
      v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "speakerRoute"));
      objc_msgSend(v50, "pickRoute:", v53);

      goto LABEL_45;
    case 6uLL:
      v27 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallControlsViewController delegate](self, "delegate"));
      v9 = v27;
LABEL_17:
      objc_msgSend(v27, "audioCallControlsViewControllerRequestedContactsPresentation:forView:", self, v6);
      goto LABEL_46;
    case 7uLL:
      v9 = (id)objc_claimAutoreleasedReturnValue(-[PHAudioCallControlsViewController callContainer](self, "callContainer"));
      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "frontmostCall"));
      -[PHAudioCallControlsViewController openMessagesForCall:](self, "openMessagesForCall:", v31);
      goto LABEL_25;
    case 8uLL:
      v32 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallControlsViewController callContainer](self, "callContainer"));
      v33 = objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "currentCalls"));
      v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v33, "firstObject"));

      LOBYTE(v33) = objc_msgSend(v9, "isOnHold");
      v34 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallControlsViewController callCenter](self, "callCenter"));
      v35 = v34;
      if ((v33 & 1) != 0)
        objc_msgSend(v34, "unholdCall:", v9);
      else
        objc_msgSend(v34, "holdCall:", v9);

      -[PHAudioCallControlsViewController updateControls](self, "updateControls");
      goto LABEL_46;
    case 9uLL:
      v9 = (id)objc_claimAutoreleasedReturnValue(-[PHAudioCallControlsViewController callCenter](self, "callCenter"));
      objc_msgSend(v9, "swapCalls");
      goto LABEL_46;
    case 0xAuLL:
      v36 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallControlsViewController callContainer](self, "callContainer"));
      v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "callWithStatus:", 2));

      v37 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallControlsViewController callContainer](self, "callContainer"));
      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "callWithStatus:", 1));

      v38 = sub_1000C5588();
      v39 = objc_claimAutoreleasedReturnValue(v38);
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
      {
        v57 = 138412546;
        v58 = (unint64_t)v9;
        v59 = 2112;
        v60 = v31;
        _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "PHAudioCallControlTypeMerge tapped. Grouping held call %@ with active call %@", (uint8_t *)&v57, 0x16u);
      }

      v40 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallControlsViewController callCenter](self, "callCenter"));
      objc_msgSend(v40, "groupCall:withOtherCall:", v9, v31);

LABEL_25:
      goto LABEL_46;
    case 0xBuLL:
    case 0xEuLL:
      v9 = (id)objc_claimAutoreleasedReturnValue(-[PHAudioCallControlsViewController delegate](self, "delegate"));
      objc_msgSend(v9, "audioCallControlsViewControllerDidTapRTTButton");
      goto LABEL_46;
    case 0xCuLL:
      v9 = (id)objc_claimAutoreleasedReturnValue(-[PHAudioCallControlsViewController delegate](self, "delegate"));
      objc_msgSend(v9, "audioCallControlsViewControllerRequestedVideoPresentation:", self);
      goto LABEL_46;
    case 0xDuLL:
      v9 = (id)objc_claimAutoreleasedReturnValue(-[PHAudioCallControlsViewController delegate](self, "delegate"));
      objc_msgSend(v9, "audioCallControlsViewControllerRequestedPunchOutPresentation:", self);
      goto LABEL_46;
    case 0xFuLL:
      v9 = (id)objc_claimAutoreleasedReturnValue(-[PHAudioCallControlsViewController delegate](self, "delegate"));
      objc_msgSend(v9, "audioCallControlsViewControllerDidTapEndButton:", self);
      goto LABEL_46;
    case 0x10uLL:
      v9 = (id)objc_claimAutoreleasedReturnValue(-[PHAudioCallControlsViewController delegate](self, "delegate"));
      objc_msgSend(v9, "audioCallControlsViewControllerRequestedInvokeAlert");
      goto LABEL_46;
    case 0x11uLL:
      v9 = (id)objc_claimAutoreleasedReturnValue(-[PHAudioCallControlsViewController delegate](self, "delegate"));
      objc_msgSend(v9, "audioCallControlsViewControllerDidTapVideoStreamingButton");
      goto LABEL_46;
    case 0x12uLL:
      v9 = (id)objc_claimAutoreleasedReturnValue(-[PHAudioCallControlsViewController delegate](self, "delegate"));
      objc_msgSend(v9, "audioCallControlsViewControllerRequestedShareMedia");
      goto LABEL_46;
    case 0x13uLL:
      v9 = (id)objc_claimAutoreleasedReturnValue(-[PHAudioCallControlsViewController delegate](self, "delegate"));
      objc_msgSend(v9, "audioCallControlsViewControllerRequestedShareCardFromSourceView:", v6);
      goto LABEL_46;
    default:
      goto LABEL_47;
  }
}

- (void)controlTypeShortPressed:(unint64_t)a3
{
  id v4;
  NSObject *v5;
  int v6;
  unint64_t v7;

  v4 = sub_1000C5588();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 134217984;
    v7 = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Control type short pressed (%lu)", (uint8_t *)&v6, 0xCu);
  }

}

- (void)controlTypeLongPressed:(unint64_t)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned int v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  _BOOL4 v17;
  void *v18;
  unsigned int v19;
  int v20;
  _BYTE v21[10];
  __int16 v22;
  int v23;

  v5 = sub_1000C5588();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v20 = 134217984;
    *(_QWORD *)v21 = a3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Control type long pressed (%lu)", (uint8_t *)&v20, 0xCu);
  }

  if (a3 == 1)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallControlsViewController delegate](self, "delegate"));
    objc_msgSend(v8, "audioCallControlsViewControllerRequestedKeypadPresentationForFieldMode:", self);
    goto LABEL_14;
  }
  if (a3)
    return;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallControlsViewController callContainer](self, "callContainer"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "callWithStatus:", 1));

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallControlsViewController callContainer](self, "callContainer"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "currentCallGroups"));
  if (objc_msgSend(v10, "count") != (id)1 || !v8)
  {

    goto LABEL_11;
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "model"));
  v12 = objc_msgSend(v11, "supportsHolding");

  if (!v12)
  {
LABEL_11:
    v13 = sub_1000C5588();
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallControlsViewController callContainer](self, "callContainer"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "currentCallGroups"));
      v17 = objc_msgSend(v16, "count") != (id)1;
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "model"));
      v19 = objc_msgSend(v18, "supportsHolding");
      v20 = 67109632;
      *(_DWORD *)v21 = v17;
      *(_WORD *)&v21[4] = 1024;
      *(_DWORD *)&v21[6] = v8 == 0;
      v22 = 1024;
      v23 = v19 ^ 1;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Not holding: current call count isn't 1 (%d), active call doesn't exist (%d), or active call doesn't support holding (%d)", (uint8_t *)&v20, 0x14u);

    }
    goto LABEL_14;
  }
  -[PHAudioCallControlsViewController controlTypeTapped:forView:](self, "controlTypeTapped:forView:", 8, 0);
LABEL_14:

}

- (id)audioRouteMenu
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallControlsViewController delegate](self, "delegate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "audioRouteMenu"));

  return v3;
}

- (BOOL)controlTypeIsEnabled:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  unsigned int v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  char v21;
  void *v22;
  id v23;
  unsigned __int8 v24;
  void *v25;
  void *v26;
  void *v27;
  unsigned int v28;
  void *v29;
  void *v30;
  unint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  unsigned int v35;
  unsigned int v36;
  void *v37;
  void *v39;
  unsigned __int8 v40;

  if (!-[PHAudioCallControlsViewController isEnabled](self, "isEnabled"))
  {
    LOBYTE(v14) = 0;
    return v14;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallControlsViewController callContainer](self, "callContainer"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "callWithStatus:", 2));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallControlsViewController callContainer](self, "callContainer"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "callWithStatus:", 1));

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallControlsViewController callContainer](self, "callContainer"));
  v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "callWithStatus:", 3));

  if (v8)
    v11 = v8;
  else
    v11 = v6;
  v12 = v11;
  v13 = (void *)v12;
  switch(a3)
  {
    case 0uLL:
      LOBYTE(v14) = (v12 | v10) != 0;
      goto LABEL_88;
    case 1uLL:
      if (v12)
      {
        if (objc_msgSend((id)v12, "isOnHold") && !v10)
          goto LABEL_84;
      }
      else if (!v10)
      {
        goto LABEL_83;
      }
      v23 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "model"));
      if ((objc_msgSend(v23, "supportsDTMF") & 1) != 0)
      {
        LOBYTE(v14) = 1;
        goto LABEL_87;
      }
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v10, "model"));
      LOBYTE(v14) = objc_msgSend(v26, "supportsDTMF");
      goto LABEL_86;
    case 2uLL:
    case 3uLL:
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "routeController"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "routes"));
      if ((unint64_t)objc_msgSend(v17, "count") > 1)
      {
        v21 = 0;
      }
      else
      {
        v18 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "routeController"));
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "pickedRoute"));
        v40 = objc_msgSend(v20, "isSpeaker");

        v21 = v40 ^ 1;
      }

      if (v13)
        v30 = v13;
      else
        v30 = (void *)v10;
      v31 = v30;

      LOBYTE(v14) = 0;
      if (v10 | v31 && (v21 & 1) == 0)
        v14 = objc_msgSend((id)v31, "isTTY") ^ 1;
      v13 = (void *)v31;
      goto LABEL_88;
    case 4uLL:
      if (v12)
        v25 = (void *)v12;
      else
        v25 = (void *)v10;
      v23 = v25;
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallControlsViewController callCenter](self, "callCenter"));
      if (objc_msgSend(v26, "isAddCallAllowed"))
      {
        v27 = (void *)objc_claimAutoreleasedReturnValue(+[PHInCallUtilities sharedInstance](PHInCallUtilities, "sharedInstance"));
        if ((objc_msgSend(v27, "isSetupAssistantRunning") & 1) == 0)
        {
          v28 = objc_msgSend(v23, "isConversation");
          if (!v28)
          {
LABEL_28:
            v29 = (void *)objc_claimAutoreleasedReturnValue(+[PHInCallUtilities sharedInstance](PHInCallUtilities, "sharedInstance"));
            v14 = objc_msgSend(v29, "isInLostMode") ^ 1;

            if (v28)
              goto LABEL_91;
LABEL_77:

            goto LABEL_86;
          }
          if (objc_msgSend(v23, "isConversation"))
          {
            v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "remoteParticipantHandles"));
            if (objc_msgSend(v39, "count") != (id)1)
            {
              LOBYTE(v14) = 0;
LABEL_91:

              goto LABEL_77;
            }
            goto LABEL_28;
          }
        }
LABEL_76:
        LOBYTE(v14) = 0;
        goto LABEL_77;
      }
      LOBYTE(v14) = 0;
LABEL_86:

      goto LABEL_87;
    case 5uLL:
    case 0xCuLL:
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v12, "provider"));
      if ((objc_msgSend(v22, "supportsAudioAndVideo") & 1) != 0)
      {
        v23 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "provider"));
      }
      else
      {
        v32 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallControlsViewController callCenter](self, "callCenter"));
        v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "providerManager"));
        v23 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "faceTimeProvider"));

      }
      if ((objc_msgSend(v23, "isFaceTimeProvider") & 1) != 0)
      {
        v34 = (void *)objc_claimAutoreleasedReturnValue(+[PHInCallUtilities sharedInstance](PHInCallUtilities, "sharedInstance"));
        v35 = objc_msgSend(v34, "faceTimeVideoIsAvailable");

      }
      else
      {
        v35 = objc_msgSend(v23, "supportsAudioAndVideo");
      }
      if (!v13)
        goto LABEL_78;
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "handle"));
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "value"));
      if (!objc_msgSend(v27, "length")
        || (objc_msgSend(v13, "isConferenced") & 1) != 0
        || (objc_msgSend(v13, "isVoicemail") & 1) != 0
        || (objc_msgSend(v13, "isEmergency") & 1) != 0
        || objc_msgSend(v13, "status") != 1)
      {
        goto LABEL_76;
      }
      v36 = objc_msgSend(v13, "faceTimeIDStatus") == 1 ? 0 : v35;
      if (v36 != 1)
        goto LABEL_76;
      v37 = (void *)objc_claimAutoreleasedReturnValue(+[PHInCallUtilities sharedInstance](PHInCallUtilities, "sharedInstance"));
      v14 = objc_msgSend(v37, "isSetupAssistantRunning") ^ 1;

      goto LABEL_77;
    case 6uLL:
      if (!(v10 | v12))
      {
LABEL_83:
        v13 = 0;
        goto LABEL_84;
      }
      if (!-[PHAudioCallControlsViewController isContactStoreAuthorized](self, "isContactStoreAuthorized"))
      {
LABEL_84:
        LOBYTE(v14) = 0;
        goto LABEL_88;
      }
      v23 = (id)objc_claimAutoreleasedReturnValue(+[PHInCallUtilities sharedInstance](PHInCallUtilities, "sharedInstance"));
      if ((objc_msgSend(v23, "isSetupAssistantRunning") & 1) == 0)
      {
        v26 = (void *)objc_claimAutoreleasedReturnValue(+[PHInCallUtilities sharedInstance](PHInCallUtilities, "sharedInstance"));
        v14 = objc_msgSend(v26, "isInLostMode") ^ 1;
        goto LABEL_86;
      }
LABEL_78:
      LOBYTE(v14) = 0;
LABEL_87:

LABEL_88:
      return v14;
    case 7uLL:
    case 0x13uLL:
      if (!v12)
        v12 = v10;
      v24 = objc_msgSend((id)v12, "isConversation");
      goto LABEL_52;
    case 8uLL:
      if (!v10)
        goto LABEL_39;
      goto LABEL_84;
    case 9uLL:
      LOBYTE(v14) = 0;
      if (v10 || !v6)
        goto LABEL_88;
      v12 = (uint64_t)v8;
LABEL_39:
      v23 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v12, "model"));
      LOBYTE(v14) = objc_msgSend(v23, "supportsHolding");
      goto LABEL_87;
    case 0xAuLL:
      LOBYTE(v14) = 0;
      if (v10 || !v12 || !v6)
        goto LABEL_88;
      v23 = (id)objc_claimAutoreleasedReturnValue(-[PHAudioCallControlsViewController callCenter](self, "callCenter"));
      if (!objc_msgSend(v23, "canGroupCall:withCall:", v13, v6)
        || (objc_msgSend(v13, "isRTT") & 1) != 0
        || (objc_msgSend(v13, "isTTY") & 1) != 0
        || (objc_msgSend(v6, "isRTT") & 1) != 0)
      {
        goto LABEL_78;
      }
      v14 = objc_msgSend(v6, "isTTY") ^ 1;
      goto LABEL_87;
    case 0xBuLL:
      if (!v12)
        goto LABEL_84;
      v24 = objc_msgSend((id)v12, "isTTY");
      goto LABEL_52;
    case 0xDuLL:
    case 0xFuLL:
    case 0x10uLL:
    case 0x11uLL:
    case 0x12uLL:
      LOBYTE(v14) = 1;
      goto LABEL_88;
    case 0xEuLL:
      if (!v12)
        goto LABEL_84;
      v24 = objc_msgSend((id)v12, "isRTT");
LABEL_52:
      LOBYTE(v14) = v24;
      goto LABEL_88;
    default:
      goto LABEL_84;
  }
}

- (BOOL)controlTypeIsSelected:(unint64_t)a3
{
  void *v5;
  void *v6;
  BOOL v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned __int8 v11;
  unsigned __int8 v12;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallControlsViewController callContainer](self, "callContainer"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "frontmostCall"));

  v7 = 0;
  if ((uint64_t)a3 > 7)
  {
    if (a3 == 17)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallControlsViewController delegate](self, "delegate"));
      v12 = objc_msgSend(v10, "videoStreamingIsGoingOn");
      goto LABEL_13;
    }
    if (a3 == 8)
    {
      v11 = objc_msgSend(v6, "isOnHold");
LABEL_10:
      v7 = v11;
    }
  }
  else
  {
    if (a3 - 2 < 2)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "routeController"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "pickedRoute"));

      if ((objc_msgSend(v10, "isAuxiliary") & 1) != 0)
      {
        v7 = 1;
LABEL_14:

        goto LABEL_15;
      }
      v12 = objc_msgSend(v10, "isSpeaker");
LABEL_13:
      v7 = v12;
      goto LABEL_14;
    }
    if (!a3)
    {
      v11 = objc_msgSend(v6, "isUplinkMuted");
      goto LABEL_10;
    }
  }
LABEL_15:

  return v7;
}

- (void)setEnabled:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(-[PHAudioCallControlsViewController controlsView](self, "controlsView"));
  objc_msgSend(v4, "setButtonsEnabled:", v3);

}

- (BOOL)isEnabled
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallControlsViewController controlsView](self, "controlsView"));
  v3 = objc_msgSend(v2, "buttonsEnabled");

  return v3;
}

- (void)setUpdatesPaused:(BOOL)a3
{
  _BOOL4 v3;
  id v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  _BOOL4 v14;

  v3 = a3;
  v5 = sub_1000C5588();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    objc_opt_class(self, v7);
    v11 = 138412546;
    v12 = v8;
    v13 = 1024;
    v14 = v3;
    v9 = v8;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%@ setUpdatesPaused=%d", (uint8_t *)&v11, 0x12u);

  }
  self->_updatesPaused = v3;
  if (!v3)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallControlsViewController controlsView](self, "controlsView"));
    objc_msgSend(v10, "updateControls");

  }
}

- (BOOL)multipleCallsArePresent
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  unint64_t v6;
  uint64_t v7;
  void *i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallControlsViewController callContainer](self, "callContainer"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "currentCallGroups"));

  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v4 = v3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = 0;
    v7 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)i), "status", (_QWORD)v10) - 1 < 4)
          ++v6;
      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
    LOBYTE(v5) = v6 > 1;
  }

  return (char)v5;
}

- (BOOL)hasActiveAndIncomingCallPresent
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  id v6;
  char v7;
  char v8;
  uint64_t v9;
  void *i;
  unsigned int v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallControlsViewController callContainer](self, "callContainer"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "currentCallGroups"));

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = v3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (!v5)
  {
    v7 = 0;
    v8 = 0;
    goto LABEL_18;
  }
  v6 = v5;
  v7 = 0;
  v8 = 0;
  v9 = *(_QWORD *)v14;
  while (2)
  {
    for (i = 0; i != v6; i = (char *)i + 1)
    {
      if (*(_QWORD *)v14 != v9)
        objc_enumerationMutation(v4);
      v11 = objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i), "status", (_QWORD)v13);
      if (v11 == 4)
      {
        v7 = 1;
        if ((v8 & 1) == 0)
          continue;
      }
      else
      {
        if (v11 == 1)
          v8 = 1;
        if ((v8 & 1) == 0)
          continue;
      }
      if ((v7 & 1) != 0)
      {
        v7 = 1;
        v8 = 1;
        goto LABEL_18;
      }
    }
    v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v6)
      continue;
    break;
  }
LABEL_18:

  return v8 & v7 & 1;
}

- (PHAudioCallControlArrangement)currentArrangement
{
  id v3;
  void *v4;

  v3 = objc_alloc_init((Class)TUSenderIdentityClient);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallControlsViewController currentArrangementWithSenderIdentityClient:](self, "currentArrangementWithSenderIdentityClient:", v3));

  return (PHAudioCallControlArrangement *)v4;
}

- (id)currentArrangementWithSenderIdentityClient:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unsigned int v14;
  PHAudioCallControlArrangement *v15;
  uint64_t v16;
  unsigned int v17;
  unsigned int v18;
  PHAudioCallControlArrangement *v19;
  void *v20;
  PHAudioCallControlArrangement *v21;
  void *v22;
  unsigned __int8 v23;
  PHAudioCallControlArrangement *v24;
  unsigned int v25;
  PHAudioCallControlArrangement *v26;
  PHAudioCallControlArrangement *v27;
  char v28;
  PHAudioCallControlArrangement *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  id v33;
  NSObject *v34;
  void *v35;
  unsigned int v36;
  void *v37;
  void *v38;
  unsigned int v39;
  void *v40;
  id v41;
  void *v42;
  unsigned __int8 v43;
  void *v44;
  unsigned int v45;
  uint64_t v46;
  void *v47;
  unsigned int v48;
  void *v49;
  unsigned int v50;
  unsigned int v51;
  void *v52;
  unsigned int v53;
  void *v54;
  unsigned int v55;
  void *v56;
  int v58;
  void *v59;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallControlsViewController callDisplayStyleManager](self, "callDisplayStyleManager"));
  v6 = objc_msgSend(v5, "callDisplayStyle");

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallControlsViewController callContainer](self, "callContainer"));
  v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "frontmostCall"));
  if (v8)
  {
    v9 = (void *)v8;
LABEL_3:

    goto LABEL_5;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallControlsViewController callContainer](self, "callContainer"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "currentCalls"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "firstObject"));

  if (!v9)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "delegate"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "mostRecentlyDisconnectedAudioCall"));

    goto LABEL_3;
  }
LABEL_5:
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallControlsViewController features](self, "features"));
  if ((objc_msgSend(v12, "isButtonLayoutEnabled") & 1) != 0)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallControlsViewController delegate](self, "delegate"));
    v14 = objc_msgSend(v9, "canDisplayAlertUI:", objc_msgSend(v13, "audioControlsShouldPresentAlertButton"));

    if (v14)
    {
      v15 = [PHAudioCallControlArrangement alloc];
      if (v6 == (id)3)
        v16 = objc_claimAutoreleasedReturnValue(+[PHAudioCallControlArrangement simplifiedDefaultAlertControlTypes](PHAudioCallControlArrangement, "simplifiedDefaultAlertControlTypes"));
      else
        v16 = objc_claimAutoreleasedReturnValue(+[PHAudioCallControlArrangement defaultAlertControlTypes](PHAudioCallControlArrangement, "defaultAlertControlTypes"));
      v49 = (void *)v16;
      v27 = -[PHAudioCallControlArrangement initWithControlTypes:](v15, "initWithControlTypes:", v16);
LABEL_64:

      goto LABEL_65;
    }
  }
  else
  {

  }
  if (v6 == (id)3)
  {
    v17 = -[PHAudioCallControlsViewController hasActiveAndIncomingCallPresent](self, "hasActiveAndIncomingCallPresent");
    v18 = -[PHAudioCallControlsViewController multipleCallsArePresent](self, "multipleCallsArePresent");
    v19 = [PHAudioCallControlArrangement alloc];
    if (v18 && !v17)
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[PHAudioCallControlArrangement simplifiedDefaultMultipleCallControlTypes](PHAudioCallControlArrangement, "simplifiedDefaultMultipleCallControlTypes"));
      v21 = v19;
LABEL_21:
      v27 = -[PHAudioCallControlArrangement initWithControlTypes:](v21, "initWithControlTypes:", v20);
      v28 = 1;
      goto LABEL_24;
    }
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[PHAudioCallControlArrangement simplifiedDefaultControlTypes](PHAudioCallControlArrangement, "simplifiedDefaultControlTypes"));
    v24 = v19;
  }
  else
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallControlsViewController features](self, "features"));
    if (objc_msgSend(v22, "shouldEmbedSwapBanner"))
      v23 = -[PHAudioCallControlsViewController hasActiveAndIncomingCallPresent](self, "hasActiveAndIncomingCallPresent");
    else
      v23 = 0;

    v25 = -[PHAudioCallControlsViewController multipleCallsArePresent](self, "multipleCallsArePresent");
    v26 = [PHAudioCallControlArrangement alloc];
    if (v25 && (v23 & 1) == 0)
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[PHAudioCallControlArrangement defaultMultipleCallControlTypes](PHAudioCallControlArrangement, "defaultMultipleCallControlTypes"));
      v21 = v26;
      goto LABEL_21;
    }
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[PHAudioCallControlArrangement defaultControlTypes](PHAudioCallControlArrangement, "defaultControlTypes"));
    v24 = v26;
  }
  v27 = -[PHAudioCallControlArrangement initWithControlTypes:](v24, "initWithControlTypes:", v20);
  v28 = 0;
LABEL_24:

  if (objc_msgSend(v9, "isRTT"))
  {
    v29 = v27;
    v30 = 0;
    v31 = 14;
LABEL_26:
    -[PHAudioCallControlArrangement replaceControlsOfType:withControlOfType:](v29, "replaceControlsOfType:withControlOfType:", v30, v31);
    goto LABEL_41;
  }
  if (objc_msgSend(v9, "isTTY"))
  {
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localSenderIdentityUUID"));
    if (!v32)
    {
      v33 = sub_1000C5588();
      v34 = objc_claimAutoreleasedReturnValue(v33);
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        v58 = 138412290;
        v59 = v9;
        _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "Could not retrieve a sender identity UUID from the call %@; checking if TTY software is available anyway.",
          (uint8_t *)&v58,
          0xCu);
      }

    }
    if (objc_msgSend(v4, "isTTYSoftwareAvailableForSenderIdentityUUID:", v32))
      -[PHAudioCallControlArrangement replaceControlsOfType:withControlOfType:](v27, "replaceControlsOfType:withControlOfType:", 0, 11);

  }
  else
  {
    if ((v28 & 1) == 0)
    {
      if (objc_msgSend(v9, "isOnHold"))
      {
        v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "model"));
        v36 = objc_msgSend(v35, "supportsHolding");

        if (v36)
        {
          v29 = v27;
          v30 = 0;
          v31 = 8;
          goto LABEL_26;
        }
      }
    }
    if (objc_msgSend(v9, "isConversation"))
    {
      v29 = v27;
      v30 = 6;
      v31 = 7;
      goto LABEL_26;
    }
  }
LABEL_41:
  v37 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "routeController"));
  v39 = objc_msgSend(v38, "areAuxiliaryRoutesAvailable");

  if (v39)
    -[PHAudioCallControlArrangement replaceControlsOfType:withControlOfType:](v27, "replaceControlsOfType:withControlOfType:", 2, 3);
  v40 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallControlsViewController callDisplayStyleManager](self, "callDisplayStyleManager"));
  v41 = objc_msgSend(v40, "callDisplayStyle");

  if (v41 == (id)3
    && (-[PHAudioCallControlsViewController controlTypeIsEnabled:](self, "controlTypeIsEnabled:", 5)
     || !-[PHAudioCallControlsViewController controlTypeIsEnabled:](self, "controlTypeIsEnabled:", 1)))
  {
    -[PHAudioCallControlArrangement replaceControlsOfType:withControlOfType:](v27, "replaceControlsOfType:withControlOfType:", 1, 5);
  }
  if (v9)
  {
    v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "provider"));
    v43 = objc_msgSend(v42, "isSystemProvider");

    if ((v43 & 1) == 0)
    {
      v44 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallControlsViewController features](self, "features"));
      v45 = objc_msgSend(v44, "isButtonLayoutEnabled");

      v46 = v45 ? 4 : 6;
      -[PHAudioCallControlArrangement replaceControlsOfType:withControlOfType:](v27, "replaceControlsOfType:withControlOfType:", v46, 13);
      v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "provider"));
      v48 = objc_msgSend(v47, "supportsAudioAndVideo");

      if (v48)
        -[PHAudioCallControlArrangement replaceControlsOfType:withControlOfType:](v27, "replaceControlsOfType:withControlOfType:", 5, 12);
    }
  }
  v49 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallControlsViewController features](self, "features"));
  v50 = objc_msgSend(v49, "isEnhancedEmergencyEnabled");
  if (!v9 || !v50)
    goto LABEL_64;
  v51 = objc_msgSend(v9, "isEmergency");

  if (v51)
  {
    v52 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallControlsViewController delegate](self, "delegate"));
    v53 = objc_msgSend(v52, "shouldEnableVideoStreamingButton");

    if (v53)
      -[PHAudioCallControlArrangement replaceControlsOfType:withControlOfType:](v27, "replaceControlsOfType:withControlOfType:", 5, 17);
    v54 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallControlsViewController delegate](self, "delegate"));
    v55 = objc_msgSend(v54, "shouldEnableShareMediaButton");

    if (v55)
      -[PHAudioCallControlArrangement replaceControlsOfType:withControlOfType:](v27, "replaceControlsOfType:withControlOfType:", 4, 18);
  }
LABEL_65:

  return v27;
}

- (void)openMessagesForCall:(id)a3
{
  id v3;
  void *v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  id v25;
  id v26;
  NSObject *v27;
  void *v28;
  void *v29;
  id v30;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint8_t buf[4];
  id v37;
  _BYTE v38[128];

  v3 = a3;
  if (objc_msgSend(v3, "isConversation"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
    v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "activeConversationForCall:", v3));

    if (v5)
    {
      v6 = objc_alloc_init((Class)NSMutableArray);
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject groupUUID](v5, "groupUUID"));

      if (v7)
      {
        v8 = objc_alloc((Class)NSURLQueryItem);
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject groupUUID](v5, "groupUUID"));
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "UUIDString"));
        v11 = objc_msgSend(v8, "initWithName:value:", CFSTR("groupid"), v10);

        -[NSObject addObject:](v6, "addObject:", v11);
      }
      v12 = objc_alloc_init((Class)NSMutableArray);
      v32 = 0u;
      v33 = 0u;
      v34 = 0u;
      v35 = 0u;
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject remoteMembers](v5, "remoteMembers", 0));
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
      if (v14)
      {
        v15 = v14;
        v16 = *(_QWORD *)v33;
        do
        {
          v17 = 0;
          do
          {
            if (*(_QWORD *)v33 != v16)
              objc_enumerationMutation(v13);
            v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1)
                                                                               + 8 * (_QWORD)v17), "handles"));
            v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "anyObject"));

            v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "value"));
            if (v20)
            {
              v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "value"));
              objc_msgSend(v12, "addObject:", v21);

            }
            v17 = (char *)v17 + 1;
          }
          while (v15 != v17);
          v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
        }
        while (v15);
      }

      if (objc_msgSend(v12, "count"))
      {
        v22 = objc_alloc((Class)NSURLQueryItem);
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "componentsJoinedByString:", CFSTR(",")));
        v24 = objc_msgSend(v22, "initWithName:value:", CFSTR("addresses"), v23);

        -[NSObject addObject:](v6, "addObject:", v24);
      }
      v25 = objc_alloc_init((Class)NSURLComponents);
      objc_msgSend(v25, "setScheme:", CFSTR("sms"));
      objc_msgSend(v25, "setPath:", CFSTR("open"));
      objc_msgSend(v25, "setQueryItems:", v6);
      v26 = sub_1000C5588();
      v27 = objc_claimAutoreleasedReturnValue(v26);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "URL"));
        *(_DWORD *)buf = 138412290;
        v37 = v28;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Opening Multiway Messages URL: %@ ...", buf, 0xCu);

      }
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "URL"));
      TUUnlockAndOpenURL();

    }
    else
    {
      v31 = sub_1000C5588();
      v6 = objc_claimAutoreleasedReturnValue(v31);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        sub_1001AAAE4((uint64_t)v3, v6);
    }

  }
  else
  {
    v30 = sub_1000C5588();
    v5 = objc_claimAutoreleasedReturnValue(v30);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v37 = v3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Not opening Multiway Messages for call. Call is not a conversation: %@", buf, 0xCu);
    }
  }

}

- (void)routesChangedForRouteController:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  unsigned __int8 v9;
  void *v10;
  uint8_t v11[16];

  v4 = a3;
  v5 = sub_1000C5588();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "", v11, 2u);
  }

  -[PHAudioCallControlsViewController updateControls](self, "updateControls");
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "pickedRoute"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallControlsViewController lastPickedRoute](self, "lastPickedRoute"));
  v9 = objc_msgSend(v7, "isEqualToRoute:", v8);

  if ((v9 & 1) == 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallControlsViewController controlsView](self, "controlsView"));
    objc_msgSend(v10, "dismissAudioRoutesMenu");

    -[PHAudioCallControlsViewController setLastPickedRoute:](self, "setLastPickedRoute:", v7);
  }

}

- (void)handleMutedTalkerBannerTap
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallControlsViewController callContainer](self, "callContainer"));
  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "frontmostCall"));

  objc_msgSend(v5, "setUplinkMuted:", objc_msgSend(v5, "isUplinkMuted") ^ 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallControlsViewController controlsView](self, "controlsView"));
  objc_msgSend(v4, "setSelectedState:forControlType:", objc_msgSend(v5, "isUplinkMuted"), 0);

}

- (NSArray)buttonsForAmbientTransition
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallControlsViewController controlsView](self, "controlsView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "buttonsForAmbientTransition"));

  return (NSArray *)v3;
}

- (PHAudioCallControlsViewControllerDelegate)delegate
{
  return (PHAudioCallControlsViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (BOOL)updatesPaused
{
  return self->_updatesPaused;
}

- (int)proximitySensorNotificationToken
{
  return self->_proximitySensorNotificationToken;
}

- (void)setProximitySensorNotificationToken:(int)a3
{
  self->_proximitySensorNotificationToken = a3;
}

- (ICSCallDisplayStyleManager)callDisplayStyleManager
{
  return (ICSCallDisplayStyleManager *)objc_getProperty(self, a2, 24, 1);
}

- (PHAudioCallControlsView)controlsView
{
  return (PHAudioCallControlsView *)objc_getProperty(self, a2, 32, 1);
}

- (void)setControlsView:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (PHAudioCallControlArrangement)controlArrangement
{
  return (PHAudioCallControlArrangement *)objc_getProperty(self, a2, 40, 1);
}

- (void)setControlArrangement:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (TUCallCenter)callCenter
{
  return self->_callCenter;
}

- (void)setCallCenter:(id)a3
{
  objc_storeStrong((id *)&self->_callCenter, a3);
}

- (TUCallContainerPrivate)callContainer
{
  return self->_callContainer;
}

- (void)setCallContainer:(id)a3
{
  objc_storeStrong((id *)&self->_callContainer, a3);
}

- (TURoute)lastPickedRoute
{
  return (TURoute *)objc_getProperty(self, a2, 64, 1);
}

- (void)setLastPickedRoute:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (BOOL)isContactStoreAuthorized
{
  return self->_contactStoreAuthorized;
}

- (void)setContactStoreAuthorized:(BOOL)a3
{
  self->_contactStoreAuthorized = a3;
}

- (CNKFeatures)features
{
  return self->_features;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_features, 0);
  objc_storeStrong((id *)&self->_lastPickedRoute, 0);
  objc_storeStrong((id *)&self->_callContainer, 0);
  objc_storeStrong((id *)&self->_callCenter, 0);
  objc_storeStrong((id *)&self->_controlArrangement, 0);
  objc_storeStrong((id *)&self->_controlsView, 0);
  objc_storeStrong((id *)&self->_callDisplayStyleManager, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)callDisplayStyleDidChangeFromStyle:(int64_t)a3 toStyle:(int64_t)a4
{
  if (a4 == 2)
    -[PHAudioCallControlsViewController tipKitStartObservation](self, "tipKitStartObservation", a3);
  else
    -[PHAudioCallControlsViewController tipKitStopObservation](self, "tipKitStopObservation", a3);
}

- (void)tipKitStartObservation
{
  PHAudioCallControlsViewController *v2;

  v2 = self;
  sub_10010F554();

}

- (void)proximityStateChanged
{
  PHAudioCallControlsViewController *v2;

  v2 = self;
  sub_100110304();

}

- (void)tipKitStopObservation
{
  PHAudioCallControlsViewController *v2;

  v2 = self;
  sub_1001104F4();

}

@end
