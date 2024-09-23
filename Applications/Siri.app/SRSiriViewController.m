@implementation SRSiriViewController

+ (id)_remoteViewControllerInterface
{
  return +[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___AFUIViewControllerHosting);
}

+ (id)_exportedInterface
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  double v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  double v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  double v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  double v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  double v34;
  uint64_t v35;
  void *v36;
  _QWORD v38[2];

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___AFUIViewControllerServing));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___AFUISiriSession));
  objc_msgSend(v2, "setInterface:forSelector:argumentIndex:ofReply:", v3, "setSession:", 0, 0);

  objc_opt_class(NSArray, v4);
  v38[0] = v5;
  *(_QWORD *)&v7 = objc_opt_class(AceObject, v6).n128_u64[0];
  v38[1] = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v38, 2, v7));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v9));

  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v10, "siriSessionGetRequestContextWithCompletionHandler:", 0, 1);
  objc_opt_class(NSArray, v11);
  v13 = v12;
  *(_QWORD *)&v15 = objc_opt_class(AFSpeechPhrase, v14).n128_u64[0];
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObjects:](NSSet, "setWithObjects:", v13, v15, v16, 0));
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v17, "siriSessionDidUpdateRecognitionWithPhrases:utterances:refId:", 0, 0);

  objc_opt_class(NSArray, v18);
  v20 = v19;
  *(_QWORD *)&v22 = objc_opt_class(AFSpeechUtterance, v21).n128_u64[0];
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObjects:](NSSet, "setWithObjects:", v20, v22, v23, 0));
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v24, "siriSessionDidUpdateRecognitionWithPhrases:utterances:refId:", 1, 0);

  *(_QWORD *)&v26 = objc_opt_class(SRUIFSiriSessionInfo, v25).n128_u64[0];
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObjects:](NSSet, "setWithObjects:", v27, v26, 0));
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v28, "siriSessionDidInitializeSessionInfo:", 0, 0);

  *(_QWORD *)&v30 = objc_opt_class(SRUIFSiriSessionInfo, v29).n128_u64[0];
  v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObjects:](NSSet, "setWithObjects:", v31, v30, 0));
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v32, "siriSessionDidUpdateSessionInfo:", 0, 0);

  *(_QWORD *)&v34 = objc_opt_class(SAVCSPlayContent, v33).n128_u64[0];
  v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObjects:](NSSet, "setWithObjects:", v35, v34, 0));
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v36, "siriSessionDidReceivePlayContentCommand:completion:", 0, 0);

  return v2;
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  char v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  objc_super v17;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v6 = objc_opt_respondsToSelector(v5, "_setForcedUserInterfaceLayoutDirection:");

  if ((v6 & 1) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    objc_msgSend(v7, "_setForcedUserInterfaceLayoutDirection:", SiriLanguageIsRTL(v7, v8));

  }
  else
  {
    v9 = AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
      sub_10009E618(v9, v10, v11, v12, v13, v14, v15, v16);
  }
  -[SRSiriViewController _setIdleTimerEnabled:](self, "_setIdleTimerEnabled:", 0);
  -[SRSiriViewController _cancelIdleTimer](self, "_cancelIdleTimer");
  v17.receiver = self;
  v17.super_class = (Class)SRSiriViewController;
  -[SRSiriViewController viewWillAppear:](&v17, "viewWillAppear:", v3);
}

- (void)viewDidLoad
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SRSiriViewController;
  -[SRSiriViewController viewDidLoad](&v4, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _analytics](self, "_analytics"));
  objc_msgSend(v3, "logEventWithType:context:", 1502, 0);

}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SRSiriViewController;
  -[SRSiriViewController viewDidAppear:](&v5, "viewDidAppear:", a3);
  objc_msgSend(UIApp, "finishedIPTest:", SUICPPTTestNameSiriBringupToSiriProcessViewControllerAppeared);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _analytics](self, "_analytics"));
  objc_msgSend(v4, "logEventWithType:context:", 1513, 0);

}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  void *v6;
  objc_super v7;
  uint8_t buf[4];
  const char *v9;

  v3 = a3;
  v5 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v9 = "-[SRSiriViewController viewDidDisappear:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  v7.receiver = self;
  v7.super_class = (Class)SRSiriViewController;
  -[SRSiriViewController viewDidDisappear:](&v7, "viewDidDisappear:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _analytics](self, "_analytics"));
  objc_msgSend(v6, "logEventWithType:context:", 1514, 0);

  -[SRSiriViewController _invalidateConnection](self, "_invalidateConnection");
}

- (void)viewWillDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SRSiriViewController;
  -[SRSiriViewController viewWillDisappear:](&v4, "viewWillDisappear:", a3);
  -[SRSiriViewController _setShowKeyboardIfTextInputEnabled:](self, "_setShowKeyboardIfTextInputEnabled:", 0);
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  objc_super v8;

  height = a3.height;
  width = a3.width;
  v7 = a4;
  kdebug_trace(722469688, 0, 0, 0, 0);
  v8.receiver = self;
  v8.super_class = (Class)SRSiriViewController;
  -[SRSiriViewController viewWillTransitionToSize:withTransitionCoordinator:](&v8, "viewWillTransitionToSize:withTransitionCoordinator:", v7, width, height);
  objc_msgSend(v7, "animateAlongsideTransition:completion:", 0, &stru_100123140);

}

- (void)_setupXPCListener
{
  NSObject *v3;
  NSXPCListener *v4;
  NSXPCListener *listener;
  _QWORD block[4];
  id v7;
  uint8_t buf[4];
  const char *v9;
  __int16 v10;
  SRSiriViewController *v11;

  v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v9 = "-[SRSiriViewController _setupXPCListener]";
    v10 = 2112;
    v11 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s #xpcSiriApp Setting up XPC Listener in %@", buf, 0x16u);
  }
  v4 = (NSXPCListener *)objc_msgSend(objc_alloc((Class)NSXPCListener), "initWithMachServiceName:", CFSTR("com.apple.siri.app"));
  listener = self->_listener;
  self->_listener = v4;

  -[NSXPCListener _setQueue:](self->_listener, "_setQueue:", &_dispatch_main_q);
  -[NSXPCListener setDelegate:](self->_listener, "setDelegate:", self);
  objc_initWeak((id *)buf, self);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003B09C;
  block[3] = &unk_100122638;
  objc_copyWeak(&v7, (id *)buf);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  objc_destroyWeak(&v7);
  objc_destroyWeak((id *)buf);
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  NSXPCListener *v6;
  id v7;
  NSXPCListener *listener;
  NSObject *v9;
  NSXPCListener *v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  double v15;
  id v16;
  void *v17;
  uint64_t v18;
  double v19;
  id v20;
  void *v21;
  void **v23;
  uint64_t v24;
  void (*v25)(uint64_t);
  void *v26;
  id v27;
  id v28;
  _QWORD v29[4];
  id v30;
  id v31;
  uint8_t buf[4];
  const char *v33;
  __int16 v34;
  id v35;
  __int16 v36;
  NSXPCListener *v37;
  __int16 v38;
  NSXPCListener *v39;

  v6 = (NSXPCListener *)a3;
  v7 = a4;
  listener = self->_listener;
  v9 = AFSiriLogContextConnection;
  if (listener == v6)
  {
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v33 = "-[SRSiriViewController listener:shouldAcceptNewConnection:]";
      v34 = 2112;
      v35 = v7;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s #xpcSiriApp Accepting new XPC Connection: %@", buf, 0x16u);
    }
    v11 = &_dispatch_main_q;
    objc_initWeak((id *)buf, self);
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_10003B48C;
    v29[3] = &unk_100123168;
    v12 = &_dispatch_main_q;
    v30 = &_dispatch_main_q;
    objc_copyWeak(&v31, (id *)buf);
    objc_msgSend(v7, "setInvalidationHandler:", v29);
    v23 = _NSConcreteStackBlock;
    v24 = 3221225472;
    v25 = sub_10003B530;
    v26 = &unk_100123168;
    v13 = &_dispatch_main_q;
    v27 = &_dispatch_main_q;
    objc_copyWeak(&v28, (id *)buf);
    objc_msgSend(v7, "setInterruptionHandler:", &v23);
    *(_QWORD *)&v15 = objc_opt_class(self, v14).n128_u64[0];
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "_remoteViewControllerInterface", v15, v23, v24, v25, v26));
    objc_msgSend(v7, "setRemoteObjectInterface:", v17);

    *(_QWORD *)&v19 = objc_opt_class(self, v18).n128_u64[0];
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "_exportedInterface", v19));
    objc_msgSend(v7, "setExportedInterface:", v21);

    objc_msgSend(v7, "setExportedObject:", self);
    objc_msgSend(v7, "_setQueue:", &_dispatch_main_q);
    objc_msgSend(v7, "resume");
    objc_storeStrong((id *)&self->_connection, a4);
    objc_destroyWeak(&v28);

    objc_destroyWeak(&v31);
    objc_destroyWeak((id *)buf);

  }
  else if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    v10 = self->_listener;
    *(_DWORD *)buf = 136315906;
    v33 = "-[SRSiriViewController listener:shouldAcceptNewConnection:]";
    v34 = 2112;
    v35 = v7;
    v36 = 2112;
    v37 = v6;
    v38 = 2112;
    v39 = v10;
    _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%s #xpcSiriApp Was asked to accept new connection from %@ for %@ instead of %@", buf, 0x2Au);
  }

  return listener == v6;
}

- (void)_connectionWasInvalidated
{
  unsigned int v3;
  NSObject *v4;
  NSXPCConnection *connection;
  int v6;
  const char *v7;
  __int16 v8;
  unsigned int v9;
  __int16 v10;
  NSXPCConnection *v11;

  v3 = -[NSXPCConnection processIdentifier](self->_connection, "processIdentifier");
  v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    connection = self->_connection;
    v6 = 136315650;
    v7 = "-[SRSiriViewController _connectionWasInvalidated]";
    v8 = 1024;
    v9 = v3;
    v10 = 2112;
    v11 = connection;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s #xpcSiriApp Connection from SpringBoard/CarPlay was invalidated pid=%d _connection=%@", (uint8_t *)&v6, 0x1Cu);
  }
  -[NSXPCConnection setExportedObject:](self->_connection, "setExportedObject:", 0);
}

- (void)_connectionWasInterrupted
{
  -[NSXPCConnection processIdentifier](self->_connection, "processIdentifier");
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    sub_10009E688();
}

- (SRSiriViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v6;
  id v7;
  SRSiriViewController *v8;
  void *v9;
  SRPreferences *v10;
  SRPreferences *preferences;
  AFUISiriLanguage *v12;
  AFUISiriLanguage *language;
  uint64_t v14;
  NSMutableArray *conversations;
  id v16;
  AFConversationStore *v17;
  AFConversationStore *conversationStore;
  AFManagedStorageConnection *v19;
  AFManagedStorageConnection *domainObjectStorageConnection;
  SRUIFAceCommandRecords *v21;
  SRUIFAceCommandRecords *aceCommandRecords;
  NSMutableArray *v23;
  NSMutableArray *repeatablePhrases;
  NSMutableDictionary *v25;
  NSMutableDictionary *synthesisPreparationDictionary;
  SRModeProvider *v27;
  SRModeProvider *modeProvider;
  SRUIFAnalyticsSupplement *v29;
  SRUIFAnalyticsSupplement *analyticsSupplement;
  SRUIFSpeechSynthesizer *v31;
  SRUIFSpeechSynthesizer *ttsManager;
  NSObject *v33;
  SRUIFSpeechSynthesizer *v34;
  void *v35;
  void *v36;
  SRSiriSystemUIController *v37;
  uint64_t v38;
  SRSiriSystemUIController *v39;
  SRSiriSystemUIController *systemUIController;
  __CFRunLoop *Main;
  AIMLExperimentationAnalyticsManager *v42;
  AIMLExperimentationAnalyticsManager *manager;
  _QWORD block[4];
  id v46;
  objc_super v47;
  uint8_t buf[4];
  const char *v49;
  __int16 v50;
  SRUIFSpeechSynthesizer *v51;

  v6 = a3;
  v7 = a4;
  v47.receiver = self;
  v47.super_class = (Class)SRSiriViewController;
  v8 = -[SRSiriViewController initWithNibName:bundle:](&v47, "initWithNibName:bundle:", v6, v7);
  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[SRApplication sharedApplication](SRApplication, "sharedApplication"));
    objc_msgSend(v9, "setDataSource:", v8);

    v10 = objc_alloc_init(SRPreferences);
    preferences = v8->_preferences;
    v8->_preferences = v10;

    v12 = (AFUISiriLanguage *)objc_msgSend(objc_alloc((Class)AFUISiriLanguage), "initWithDelegate:", v8);
    language = v8->_language;
    v8->_language = v12;

    -[SRSiriViewController _updateLanguageCode](v8, "_updateLanguageCode");
    v14 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    conversations = v8->_conversations;
    v8->_conversations = (NSMutableArray *)v14;

    v16 = -[SRSiriViewController _startNewConversation](v8, "_startNewConversation");
    v17 = (AFConversationStore *)objc_alloc_init((Class)AFConversationStore);
    conversationStore = v8->_conversationStore;
    v8->_conversationStore = v17;

    v19 = (AFManagedStorageConnection *)objc_alloc_init((Class)AFManagedStorageConnection);
    domainObjectStorageConnection = v8->_domainObjectStorageConnection;
    v8->_domainObjectStorageConnection = v19;

    v21 = (SRUIFAceCommandRecords *)objc_alloc_init((Class)SRUIFAceCommandRecords);
    aceCommandRecords = v8->_aceCommandRecords;
    v8->_aceCommandRecords = v21;

    -[SRUIFAceCommandRecords setDelegate:](v8->_aceCommandRecords, "setDelegate:", v8);
    v23 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    repeatablePhrases = v8->_repeatablePhrases;
    v8->_repeatablePhrases = v23;

    v8->_acousticIdAllowed = 0;
    v25 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    synthesisPreparationDictionary = v8->_synthesisPreparationDictionary;
    v8->_synthesisPreparationDictionary = v25;

    v27 = objc_alloc_init(SRModeProvider);
    modeProvider = v8->_modeProvider;
    v8->_modeProvider = v27;

    v29 = (SRUIFAnalyticsSupplement *)objc_alloc_init((Class)SRUIFAnalyticsSupplement);
    analyticsSupplement = v8->_analyticsSupplement;
    v8->_analyticsSupplement = v29;

    v31 = (SRUIFSpeechSynthesizer *)objc_alloc_init((Class)SRUIFSpeechSynthesizer);
    ttsManager = v8->_ttsManager;
    v8->_ttsManager = v31;

    -[SRUIFSpeechSynthesizer setDelegate:](v8->_ttsManager, "setDelegate:", v8);
    -[SRUIFSpeechSynthesizer setClientStateManagerDelegate:](v8->_ttsManager, "setClientStateManagerDelegate:", v8);
    v33 = AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
    {
      v34 = v8->_ttsManager;
      *(_DWORD *)buf = 136315394;
      v49 = "-[SRSiriViewController initWithNibName:bundle:]";
      v50 = 2112;
      v51 = v34;
      _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "%s #tts 3 created _ttsManager:%@", buf, 0x16u);
    }
    v35 = (void *)objc_claimAutoreleasedReturnValue(+[AFUIDisambiguationAnalyticsManager sharedManager](AFUIDisambiguationAnalyticsManager, "sharedManager"));
    objc_msgSend(v35, "setDataSource:", v8);

    v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v36, "addObserver:selector:name:object:", v8, "_audioSessionRouteDidChange:", AVAudioSessionRouteChangeNotification, 0);

    -[SRSiriViewController _setupXPCListener](v8, "_setupXPCListener");
    objc_initWeak((id *)buf, v8);
    v37 = [SRSiriSystemUIController alloc];
    v38 = AFUIIsDeviceLiveActivitiesSupported();
    v39 = -[SRSiriSystemUIController initWithDelegate:systemUIDevice:systemApertureSupportedDevice:](v37, "initWithDelegate:systemUIDevice:systemApertureSupportedDevice:", v8, v38, AFUIIsDeviceSystemApertureEnabled());
    systemUIController = v8->_systemUIController;
    v8->_systemUIController = v39;

    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10003BBAC;
    block[3] = &unk_100123190;
    objc_copyWeak(&v46, (id *)buf);
    v8->_mainRunLoopObserverRef = CFRunLoopObserverCreateWithHandler(0, 0x81uLL, 1u, 0, block);
    Main = CFRunLoopGetMain();
    CFRunLoopAddObserver(Main, v8->_mainRunLoopObserverRef, (CFRunLoopMode)UITrackingRunLoopMode);
    v42 = (AIMLExperimentationAnalyticsManager *)objc_alloc_init((Class)AIMLExperimentationAnalyticsManager);
    manager = v8->_manager;
    v8->_manager = v42;

    objc_destroyWeak(&v46);
    objc_destroyWeak((id *)buf);
  }

  return v8;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  __CFRunLoop *Main;
  NSObject *v6;
  SRBackgroundTaskManager *v7;
  objc_super v8;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  SRSiriViewController *v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _idleTimer](self, "_idleTimer"));
  objc_msgSend(v3, "invalidate");

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v4, "removeObserver:name:object:", self, AVAudioSessionRouteChangeNotification, 0);

  if (self->_mainRunLoopObserverRef)
  {
    Main = CFRunLoopGetMain();
    CFRunLoopRemoveObserver(Main, self->_mainRunLoopObserverRef, (CFRunLoopMode)UITrackingRunLoopMode);
    CFRelease(self->_mainRunLoopObserverRef);
  }
  v6 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v10 = "-[SRSiriViewController dealloc]";
    v11 = 2112;
    v12 = self;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s #xpcSiriApp invalidating connection because of dealloc self=%@", buf, 0x16u);
  }
  -[SRSiriViewController _invalidateConnection](self, "_invalidateConnection");
  v7 = objc_alloc_init(SRBackgroundTaskManager);
  objc_setAssociatedObject(self->_listener, CFSTR("NSXPCListenerInstanceAssociatedBackgroundTaskManagerIdentifier"), v7, (void *)1);
  -[NSXPCListener setDelegate:](self->_listener, "setDelegate:", 0);
  -[NSXPCListener invalidate](self->_listener, "invalidate");

  v8.receiver = self;
  v8.super_class = (Class)SRSiriViewController;
  -[SRSiriViewController dealloc](&v8, "dealloc");
}

- (void)_invalidateConnection
{
  NSObject *v3;
  NSXPCConnection *connection;
  int v5;
  const char *v6;
  __int16 v7;
  NSXPCConnection *v8;
  __int16 v9;
  SRSiriViewController *v10;

  v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    connection = self->_connection;
    v5 = 136315650;
    v6 = "-[SRSiriViewController _invalidateConnection]";
    v7 = 2112;
    v8 = connection;
    v9 = 2112;
    v10 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s #xpcSiriApp \"%@\" %@", (uint8_t *)&v5, 0x20u);
  }
  -[NSXPCConnection invalidate](self->_connection, "invalidate");
}

- (BOOL)shouldAutorotate
{
  if ((SiriUIDeviceIsZoomed(self, a2) & 1) != 0)
    return 0;
  else
    return SiriUIIsAllOrientationsSupported();
}

- (unint64_t)supportedInterfaceOrientations
{
  if ((SiriUIDeviceIsZoomed(self, a2) & 1) != 0 || (SiriUIIsAllOrientationsSupported() & 1) == 0)
    return 2;
  else
    return 30;
}

- (void)_cancelLastRootProvisionalSnippetFromLastRequestInConversation:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char isKindOfClass;
  NSObject *v14;
  _BOOL4 v15;
  void *v16;
  int v17;
  const char *v18;
  __int16 v19;
  void *v20;

  v3 = a3;
  objc_msgSend(v3, "removeTransientItems");
  v4 = (uint64_t)objc_msgSend(v3, "numberOfChildrenForItemWithIdentifier:", 0);
  if (v4 >= 1)
  {
    v5 = v4 + 1;
    while (1)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathWithIndex:](NSIndexPath, "indexPathWithIndex:", v5 - 2));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "itemAtIndexPath:", v6));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "aceObject"));
      if (objc_msgSend(v7, "type") == (id)1)
        break;
      if (objc_msgSend(v7, "presentationState") == (id)2)
      {
        objc_opt_class(SAUISnippet, v9);
        if ((objc_opt_isKindOfClass(v8, v10) & 1) != 0)
        {
          objc_opt_class(SAUIPronunciationSnippet, v11);
          isKindOfClass = objc_opt_isKindOfClass(v8, v12);
          v14 = AFSiriLogContextConnection;
          v15 = os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT);
          if ((isKindOfClass & 1) != 0)
          {
            if (v15)
            {
              v17 = 136315138;
              v18 = "-[SRSiriViewController _cancelLastRootProvisionalSnippetFromLastRequestInConversation:]";
              _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%s Not canceling SAUIPronunciationSnippet", (uint8_t *)&v17, 0xCu);
            }
          }
          else
          {
            if (v15)
            {
              v17 = 136315394;
              v18 = "-[SRSiriViewController _cancelLastRootProvisionalSnippetFromLastRequestInConversation:]";
              v19 = 2112;
              v20 = v8;
              _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%s Canceling provisional %@", (uint8_t *)&v17, 0x16u);
            }
            v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "identifier"));
            objc_msgSend(v3, "cancelItemWithIdentifier:", v16);

            objc_msgSend(v3, "setSynchronizedWithServer:", 0);
          }
          break;
        }
      }

      if ((unint64_t)--v5 <= 1)
        goto LABEL_15;
    }

  }
LABEL_15:

}

- (id)_host
{
  return -[SRSiriViewController _hostWithErrorHandler:](self, "_hostWithErrorHandler:", 0);
}

- (id)_hostWithErrorHandler:(id)a3
{
  return -[NSXPCConnection remoteObjectProxyWithErrorHandler:](self->_connection, "remoteObjectProxyWithErrorHandler:", a3);
}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SRSiriViewController;
  -[SRSiriViewController viewDidMoveToWindow:shouldAppearOrDisappear:](&v4, "viewDidMoveToWindow:shouldAppearOrDisappear:", a3, a4);
}

- (id)preferredFocusEnvironments
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  objc_super v9;
  uint64_t v10;

  v3 = objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentationViewController](self, "_presentationViewController"));
  v4 = (void *)v3;
  if (v3)
  {
    v10 = v3;
    v5 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v10, 1));
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)SRSiriViewController;
    v6 = -[SRSiriViewController preferredFocusEnvironments](&v9, "preferredFocusEnvironments");
    v5 = objc_claimAutoreleasedReturnValue(v6);
  }
  v7 = (void *)v5;

  return v7;
}

- (void)setBottomContentInset:(double)a3
{
  id v4;

  if (vabdd_f64(self->_bottomContentInset, a3) >= 0.00000011920929)
  {
    self->_bottomContentInset = a3;
    v4 = (id)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
    if ((objc_opt_respondsToSelector(v4, "setBottomContentInset:") & 1) != 0)
      objc_msgSend(v4, "setBottomContentInset:", self->_bottomContentInset);

  }
}

- (void)setSystemContentFrame:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v7;
  CGRect v8;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  self->_systemContentFrame = a3;
  v7 = (id)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
  if ((objc_opt_respondsToSelector(v7, "setTopContentInset:animated:") & 1) != 0)
  {
    v8.origin.x = x;
    v8.origin.y = y;
    v8.size.width = width;
    v8.size.height = height;
    objc_msgSend(v7, "setTopContentInset:animated:", 1, CGRectGetMaxY(v8));
  }

}

- (void)_setStatusBarFrame:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGRect *p_statusBarFrame;
  id v9;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  p_statusBarFrame = &self->_statusBarFrame;
  if (!CGRectEqualToRect(self->_statusBarFrame, a3))
  {
    p_statusBarFrame->origin.x = x;
    p_statusBarFrame->origin.y = y;
    p_statusBarFrame->size.width = width;
    p_statusBarFrame->size.height = height;
    v9 = (id)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
    if ((objc_opt_respondsToSelector(v9, "statusBarFrameDidChange") & 1) != 0)
      objc_msgSend(v9, "statusBarFrameDidChange");

  }
}

- (void)setStatusBarFrameValue:(id)a3
{
  objc_msgSend(a3, "CGRectValue");
  -[SRSiriViewController _setStatusBarFrame:](self, "_setStatusBarFrame:");
}

- (void)_setStatusViewHeight:(double)a3
{
  id v3;

  self->_statusViewHeight = a3;
  v3 = (id)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
  if ((objc_opt_respondsToSelector(v3, "statusViewHeightDidChange") & 1) != 0)
    objc_msgSend(v3, "statusViewHeightDidChange");

}

- (void)setStatusViewHeightNumber:(id)a3
{
  float v4;

  objc_msgSend(a3, "floatValue");
  -[SRSiriViewController _setStatusViewHeight:](self, "_setStatusViewHeight:", v4);
}

- (id)_activeConversation
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _conversations](self, "_conversations"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "lastObject"));

  return v3;
}

- (id)_conversationWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = sub_10003C588;
  v16 = sub_10003C598;
  v17 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _conversations](self, "_conversations"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10003C5A0;
  v9[3] = &unk_1001231B8;
  v6 = v4;
  v10 = v6;
  v11 = &v12;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v9);

  v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

- (void)_resetContext
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _session](self, "_session"));
  objc_msgSend(v2, "resetContextTypes:", 7);

}

- (void)_activateConversation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  unsigned __int8 v8;
  NSObject *v9;
  unsigned int v10;
  NSObject *v11;
  _BOOL4 v12;
  void *v13;
  void *v14;
  int v15;
  const char *v16;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _conversations](self, "_conversations"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _activeConversation](self, "_activeConversation"));
  v7 = (id)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _previousConversation](self, "_previousConversation"));

  v8 = objc_msgSend(v5, "containsObject:", v4);
  objc_msgSend(v5, "removeObject:", v4);
  objc_msgSend(v5, "addObject:", v4);
  if (v7 == v4)
  {
    v10 = objc_msgSend(v4, "isSynchronizedWithServer");
    v11 = AFSiriLogContextConnection;
    v12 = os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT);
    if (v10)
    {
      if (v12)
      {
        v15 = 136315138;
        v16 = "-[SRSiriViewController _activateConversation:]";
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%s Rolling back the last clear context for server synchronized conversation", (uint8_t *)&v15, 0xCu);
      }
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _session](self, "_session"));
      objc_msgSend(v13, "rollbackClearContext");
    }
    else
    {
      if (v12)
      {
        v15 = 136315138;
        v16 = "-[SRSiriViewController _activateConversation:]";
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%s Clearing context for non synchronized conversation", (uint8_t *)&v15, 0xCu);
      }
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _session](self, "_session"));
      objc_msgSend(v13, "clearContext");
    }

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _session](self, "_session"));
    objc_msgSend(v14, "setAlertContext");

  }
  else if ((v8 & 1) == 0 && (unint64_t)objc_msgSend(v5, "count") >= 2)
  {
    v9 = AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
    {
      v15 = 136315138;
      v16 = "-[SRSiriViewController _activateConversation:]";
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s Resetting context for more than one conversation loaded", (uint8_t *)&v15, 0xCu);
    }
    -[SRSiriViewController _resetContext](self, "_resetContext");
  }
  if (v6)
    -[SRSiriViewController _cancelLastRootProvisionalSnippetFromLastRequestInConversation:](self, "_cancelLastRootProvisionalSnippetFromLastRequestInConversation:", v6);

}

- (void)_removePreviousConversationFromStore
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _conversationStore](self, "_conversationStore"));
  objc_msgSend(v2, "removeConversationWithIdentifier:completionBlock:", AFUIPreviousConversationIdentifier, &stru_1001231F8);

}

- (void)_saveConversationWithCompletion:(id)a3
{
  void (**v4)(_QWORD);
  id v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned __int8 v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  id v15;
  void (**v16)(_QWORD);
  id v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  id v21;
  __int16 v22;
  void *v23;

  v4 = (void (**)(_QWORD))a3;
  v5 = AFUIPreviousConversationIdentifier;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _activeConversation](self, "_activeConversation"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
  if ((objc_opt_respondsToSelector(v7, "canSaveConversations") & 1) != 0)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
    v9 = objc_msgSend(v8, "canSaveConversations");

    if ((v9 & 1) == 0)
    {
      v10 = AFSiriLogContextConnection;
      if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v19 = "-[SRSiriViewController _saveConversationWithCompletion:]";
        v20 = 2112;
        v21 = v6;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%s #conversation Presentation does not support conversation saving; not saving conversation { conversation: %@ }",
          buf,
          0x16u);
      }
      if (v4)
        v4[2](v4);
      goto LABEL_11;
    }
  }
  else
  {

  }
  v11 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v19 = "-[SRSiriViewController _saveConversationWithCompletion:]";
    v20 = 2112;
    v21 = v5;
    v22 = 2112;
    v23 = v6;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%s #conversation Saving conversation to store { identifier: %@, conversation: %@ }", buf, 0x20u);
  }
  objc_initWeak((id *)buf, self);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _conversationStore](self, "_conversationStore"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10003CBF0;
  v13[3] = &unk_100123220;
  objc_copyWeak(&v17, (id *)buf);
  v14 = v5;
  v15 = v6;
  v16 = v4;
  objc_msgSend(v12, "saveConversation:withIdentifier:completionBlock:", v15, v14, v13);

  objc_destroyWeak(&v17);
  objc_destroyWeak((id *)buf);
LABEL_11:

}

- (void)_deleteConversationWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unsigned int v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _previousConversation](self, "_previousConversation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "identifier"));
  v7 = objc_msgSend(v4, "isEqual:", v6);

  if (v7)
    -[SRSiriViewController _removePreviousConversationFromStore](self, "_removePreviousConversationFromStore");
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _conversations](self, "_conversations"));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10003CE6C;
  v12[3] = &unk_100123248;
  v11 = v4;
  v13 = v11;
  v9 = objc_msgSend(v8, "indexOfObjectPassingTest:", v12);

  if (v9 != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _conversations](self, "_conversations"));
    objc_msgSend(v10, "removeObjectAtIndex:", v9);

  }
}

- (void)_deletePreviousConversation
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _previousConversation](self, "_previousConversation"));
  if (v3)
  {
    v5 = v3;
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "identifier"));
    -[SRSiriViewController _deleteConversationWithIdentifier:](self, "_deleteConversationWithIdentifier:", v4);

    v3 = v5;
  }

}

- (id)_startNewConversation
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _activeConversation](self, "_activeConversation"));

  if (v3)
    -[SRSiriViewController _saveConversationWithCompletion:](self, "_saveConversationWithCompletion:", 0);
  v4 = objc_alloc((Class)AFConversation);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _language](self, "_language"));
  v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "spokenLanguageCode"));
  v7 = objc_msgSend(v4, "initWithLanguageCode:", v6);

  objc_msgSend(v7, "setDelegate:", self);
  -[SRSiriViewController _activateConversation:](self, "_activateConversation:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
  LOBYTE(v6) = objc_opt_respondsToSelector(v8, "siriDidStartNewConversationWithIdentifier:");

  if ((v6 & 1) != 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "identifier"));
    objc_msgSend(v9, "siriDidStartNewConversationWithIdentifier:", v10);

  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "identifier"));

  return v11;
}

- (void)_restorePreviousConversation
{
  unsigned __int8 v3;
  AFConversationStore *conversationStore;
  NSObject *v5;
  _QWORD v6[4];
  id v7;
  _BYTE location[12];
  __int16 v9;
  uint64_t v10;

  v3 = -[SRPreferences siriIsActive](self->_preferences, "siriIsActive");
  -[SRPreferences setSiriIsActive:](self->_preferences, "setSiriIsActive:", 1);
  if ((v3 & 1) == 0)
  {
    if ((self->_lockState & 2) != 0)
    {
      v5 = AFSiriLogContextConnection;
      if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)location = 136315394;
        *(_QWORD *)&location[4] = "-[SRSiriViewController _restorePreviousConversation]";
        v9 = 2112;
        v10 = AFUIPreviousConversationIdentifier;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s #conversation Host not allowing SR to load previous conversation { identifier: %@ }", location, 0x16u);
      }
    }
    else
    {
      objc_initWeak((id *)location, self);
      conversationStore = self->_conversationStore;
      v6[0] = _NSConcreteStackBlock;
      v6[1] = 3221225472;
      v6[2] = sub_10003D1B8;
      v6[3] = &unk_1001232C0;
      objc_copyWeak(&v7, (id *)location);
      -[AFConversationStore fetchConversationWithIdentifier:completionBlock:](conversationStore, "fetchConversationWithIdentifier:completionBlock:", AFUIPreviousConversationIdentifier, v6);
      objc_destroyWeak(&v7);
      objc_destroyWeak((id *)location);
    }
  }
}

- (void)motionEnded:(int64_t)a3 withEvent:(id)a4
{
  id v6;
  unsigned int v7;
  objc_super v8;

  v6 = a4;
  v7 = -[SRSiriViewController textInputEnabled](self, "textInputEnabled");
  if (a3 == 1 && v7)
    -[SRSiriViewController _setShowKeyboardIfTextInputEnabled:minimized:](self, "_setShowKeyboardIfTextInputEnabled:minimized:", 1, +[UIKeyboard isInHardwareKeyboardMode](UIKeyboard, "isInHardwareKeyboardMode") ^ 1);
  v8.receiver = self;
  v8.super_class = (Class)SRSiriViewController;
  -[SRSiriViewController motionEnded:withEvent:](&v8, "motionEnded:withEvent:", a3, v6);

}

- (id)_previousConversation
{
  void *v2;
  char *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _conversations](self, "_conversations"));
  v3 = (char *)objc_msgSend(v2, "count");
  if ((unint64_t)v3 < 2)
    v4 = 0;
  else
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectAtIndex:", v3 - 2));

  return v4;
}

- (BOOL)_languageMatchesConversation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _language](self, "_language"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "spokenLanguageCode"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "languageCode"));

  LOBYTE(v4) = objc_msgSend(v6, "isEqualToString:", v7);
  return (char)v4;
}

- (id)_delayedConversationItemRevisionIdentifiers
{
  NSMutableSet *delayedConversationItemRevisionIdentifiers;
  NSMutableSet *v4;
  NSMutableSet *v5;

  delayedConversationItemRevisionIdentifiers = self->_delayedConversationItemRevisionIdentifiers;
  if (!delayedConversationItemRevisionIdentifiers)
  {
    v4 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    v5 = self->_delayedConversationItemRevisionIdentifiers;
    self->_delayedConversationItemRevisionIdentifiers = v4;

    delayedConversationItemRevisionIdentifiers = self->_delayedConversationItemRevisionIdentifiers;
  }
  return delayedConversationItemRevisionIdentifiers;
}

- (id)_presentedConversationItemRevisionIdentifiers
{
  NSMutableSet *presentedConversationItemRevisionIdentifiers;
  NSMutableSet *v4;
  NSMutableSet *v5;

  presentedConversationItemRevisionIdentifiers = self->_presentedConversationItemRevisionIdentifiers;
  if (!presentedConversationItemRevisionIdentifiers)
  {
    v4 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    v5 = self->_presentedConversationItemRevisionIdentifiers;
    self->_presentedConversationItemRevisionIdentifiers = v4;

    presentedConversationItemRevisionIdentifiers = self->_presentedConversationItemRevisionIdentifiers;
  }
  return presentedConversationItemRevisionIdentifiers;
}

- (id)_pendingPreSynthesisTasks
{
  NSMutableSet *pendingPreSynthesisTasks;
  NSMutableSet *v4;
  NSMutableSet *v5;

  pendingPreSynthesisTasks = self->_pendingPreSynthesisTasks;
  if (!pendingPreSynthesisTasks)
  {
    v4 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    v5 = self->_pendingPreSynthesisTasks;
    self->_pendingPreSynthesisTasks = v4;

    pendingPreSynthesisTasks = self->_pendingPreSynthesisTasks;
  }
  return pendingPreSynthesisTasks;
}

- (NSMutableSet)_completedCommandAppPunchOutIds
{
  NSMutableSet *completedCommandAppPunchOutIds;
  NSMutableSet *v4;
  NSMutableSet *v5;

  completedCommandAppPunchOutIds = self->_completedCommandAppPunchOutIds;
  if (!completedCommandAppPunchOutIds)
  {
    v4 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    v5 = self->_completedCommandAppPunchOutIds;
    self->_completedCommandAppPunchOutIds = v4;

    completedCommandAppPunchOutIds = self->_completedCommandAppPunchOutIds;
  }
  return completedCommandAppPunchOutIds;
}

- (void)setHostFrontMostAppOrientation:(int64_t)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(+[SRApplication sharedApplication](SRApplication, "sharedApplication"));
  objc_msgSend(v4, "setFrontMostAppOrientation:", a3);

}

- (void)siriWillActivateFromSource:(int64_t)a3
{
  void *v5;
  char v6;
  void *v7;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
  v6 = objc_opt_respondsToSelector(v5, "siriWillActivateFromSource:");

  if ((v6 & 1) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
    objc_msgSend(v7, "siriWillActivateFromSource:", a3);

  }
  -[SRSiriViewController _checkAndUpdateSiriIdleAndQuietStatusOrRescheduleIdleTimerIfNeeded](self, "_checkAndUpdateSiriIdleAndQuietStatusOrRescheduleIdleTimerIfNeeded");
}

- (void)siriDidActivateFromSource:(int64_t)a3
{
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  NSDictionary *testingContext;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  unsigned __int8 v16;
  int v17;
  const char *v18;
  __int16 v19;
  void *v20;

  v5 = (void *)AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a3));
    v17 = 136315394;
    v18 = "-[SRSiriViewController siriDidActivateFromSource:]";
    v19 = 2112;
    v20 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s source: %@", (uint8_t *)&v17, 0x16u);

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
  v9 = objc_opt_respondsToSelector(v8, "siriDidActivateFromSource:");

  if ((v9 & 1) != 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
    objc_msgSend(v10, "siriDidActivateFromSource:", a3);

  }
  testingContext = self->_testingContext;
  if (testingContext)
  {
    v12 = SUICPPTTestNameKey;
    v13 = objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](testingContext, "objectForKey:", SUICPPTTestNameKey));
    if (v13)
    {
      v14 = (void *)v13;
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](self->_testingContext, "objectForKey:", v12));
      v16 = objc_msgSend(v15, "hasPrefix:", SUICPPTSiriBringupTestPrefix);

      if ((v16 & 1) == 0)
        -[SRSiriViewController runPPTWithOptions:](self, "runPPTWithOptions:", self->_testingContext);
    }
  }
}

- (void)siriWillBePresented:(int64_t)a3
{
  void *v5;
  char v6;
  id v7;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
  v6 = objc_opt_respondsToSelector(v5, "siriWillBePresented:");

  if ((v6 & 1) != 0)
  {
    v7 = (id)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
    objc_msgSend(v7, "siriWillBePresented:", a3);

  }
}

- (void)siriDidDeactivateWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  SRPreferences *v6;
  _TtC4Siri36SRAssetsDownloadBannerViewController *v7;
  _TtC4Siri36SRAssetsDownloadBannerViewController *bannerViewController;
  NSObject *v9;
  void *v10;
  char v11;
  void *v12;
  NSObject *v13;
  void *v14;
  char v15;
  NSObject *v16;
  void *v17;
  _BOOL4 v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  _BOOL4 v24;
  NSObject *v25;
  uint64_t v26;
  void *v27;
  id v28;
  _QWORD v29[4];
  id v30;
  _QWORD v31[5];
  _QWORD v32[4];
  NSObject *v33;
  _QWORD v34[4];
  NSObject *v35;
  __int128 buf;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  SRBackgroundTaskManager *v40;
  _BYTE v41[24];
  uint64_t v42;

  v4 = a3;
  v5 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 136315138;
    *(_QWORD *)((char *)&buf + 4) = "-[SRSiriViewController siriDidDeactivateWithCompletion:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&buf, 0xCu);
  }
  v6 = objc_alloc_init(SRPreferences);
  if (objc_msgSend(UIApp, "activeInterfaceOrientation"))
    -[SRPreferences setLastKnownInterfaceOrientation:](v6, "setLastKnownInterfaceOrientation:", objc_msgSend(UIApp, "activeInterfaceOrientation"));
  if (!-[SRPreferences hasPresentedSiriAdvancedFeaturesAssetsDownloadNotification](v6, "hasPresentedSiriAdvancedFeaturesAssetsDownloadNotification")&& -[SRSiriViewController _shouldShowDownloadAssetsNotificationPrompt](self, "_shouldShowDownloadAssetsNotificationPrompt")&& +[SRAssetsUtilities shouldShowAssetDownloadBanner](SRAssetsUtilities, "shouldShowAssetDownloadBanner"))
  {
    v7 = objc_alloc_init(_TtC4Siri36SRAssetsDownloadBannerViewController);
    bannerViewController = self->_bannerViewController;
    self->_bannerViewController = v7;

    -[SRAssetsDownloadBannerViewController showBannerFor:](self->_bannerViewController, "showBannerFor:", 3.0);
    -[SRPreferences setHasPresentedSiriAdvancedFeaturesAssetsDownloadNotification:](v6, "setHasPresentedSiriAdvancedFeaturesAssetsDownloadNotification:", 1);
  }
  v9 = dispatch_group_create();
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
  v11 = objc_opt_respondsToSelector(v10, "siriDidDeactivateWithCompletion:");

  if ((v11 & 1) != 0)
  {
    dispatch_group_enter(v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472;
    v34[2] = sub_10003E1BC;
    v34[3] = &unk_1001225C0;
    v35 = v9;
    objc_msgSend(v12, "siriDidDeactivateWithCompletion:", v34);

    v13 = v35;
  }
  else
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
    v15 = objc_opt_respondsToSelector(v14, "siriDidDeactivate");

    if ((v15 & 1) == 0)
      goto LABEL_14;
    v13 = objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
    -[NSObject siriDidDeactivate](v13, "siriDidDeactivate");
  }

LABEL_14:
  v16 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 136315138;
    *(_QWORD *)((char *)&buf + 4) = "-[SRSiriViewController siriDidDeactivateWithCompletion:]";
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%s #tts Siri deactivating. Cancelling any in flight TTS so we can release the audio session", (uint8_t *)&buf, 0xCu);
  }
  -[SRSiriViewController _cancelSpeechSynthesis](self, "_cancelSpeechSynthesis");
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _requestOptions](self, "_requestOptions"));
  v18 = objc_msgSend(v17, "requestSource") == (id)8;

  if (v18
    && (id)-[SRSiriViewController _siriState](self, "_siriState") != (id)3
    && -[SRSiriViewController _siriState](self, "_siriState"))
  {
    *(_QWORD *)v41 = 0;
    *(_QWORD *)&v41[8] = v41;
    *(_QWORD *)&v41[16] = 0x2050000000;
    v19 = (void *)qword_1001503C8;
    v42 = qword_1001503C8;
    if (!qword_1001503C8)
    {
      *(_QWORD *)&buf = _NSConcreteStackBlock;
      *((_QWORD *)&buf + 1) = 3221225472;
      v37 = (uint64_t)sub_10005825C;
      v38 = (uint64_t (*)(uint64_t, uint64_t))&unk_1001232E8;
      v39 = (void (*)(uint64_t))v41;
      sub_10005825C((uint64_t)&buf);
      v19 = *(void **)(*(_QWORD *)&v41[8] + 24);
    }
    v20 = objc_retainAutorelease(v19);
    _Block_object_dispose(v41, 8);
    objc_msgSend(v20, "notifyVoiceTriggeredSiriSessionCancelled");
  }
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _preferences](self, "_preferences"));
  objc_msgSend(v21, "setSiriIsActive:", 0);

  v22 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _activeConversation](self, "_activeConversation"));
  v23 = objc_alloc_init((Class)NSIndexPath);
  v24 = (uint64_t)objc_msgSend(v22, "numberOfChildrenForItemAtIndexPath:", v23) > 0;

  if (v24)
  {
    dispatch_group_enter(v9);
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472;
    v32[2] = sub_10003E1C4;
    v32[3] = &unk_1001225C0;
    v33 = v9;
    -[SRSiriViewController _saveConversationWithCompletion:](self, "_saveConversationWithCompletion:", v32);

  }
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v37 = 0x3032000000;
  v38 = sub_10003C588;
  v39 = sub_10003C598;
  v40 = objc_alloc_init(SRBackgroundTaskManager);
  v25 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    v26 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 40);
    *(_DWORD *)v41 = 136315394;
    *(_QWORD *)&v41[4] = "-[SRSiriViewController siriDidDeactivateWithCompletion:]";
    *(_WORD *)&v41[12] = 2112;
    *(_QWORD *)&v41[14] = v26;
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "%s Taking %@ to flush instrumentation", v41, 0x16u);
  }
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[SRUIFInstrumentationManager sharedManager](SRUIFInstrumentationManager, "sharedManager"));
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_10003E1CC;
  v31[3] = &unk_1001232E8;
  v31[4] = &buf;
  objc_msgSend(v27, "boostQueuedMessagesAndPerformOnQueueCompletion:timeout:", v31, 2.0);

  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_10003E2A0;
  v29[3] = &unk_100122E20;
  v30 = v4;
  v28 = v4;
  dispatch_group_notify(v9, (dispatch_queue_t)&_dispatch_main_q, v29);

  _Block_object_dispose(&buf, 8);
}

- (void)didReceiveOrbViewTapToCancelRequest
{
  void *v3;
  char v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
  v4 = objc_opt_respondsToSelector(v3, "didReceiveOrbViewTapToCancelRequest");

  if ((v4 & 1) != 0)
  {
    v5 = (id)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
    objc_msgSend(v5, "didReceiveOrbViewTapToCancelRequest");

  }
}

- (void)siriWillShowPasscodeUnlockAndCancelRequest:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  char v6;
  void *v7;
  char v8;
  id v9;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
  v6 = objc_opt_respondsToSelector(v5, "siriWillShowPasscodeUnlockAndCancelRequest:");

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
  v9 = v7;
  if ((v6 & 1) != 0)
  {
    objc_msgSend(v7, "siriWillShowPasscodeUnlockAndCancelRequest:", v3);
  }
  else
  {
    v8 = objc_opt_respondsToSelector(v7, "siriWillShowPasscodeUnlock");

    if ((v8 & 1) == 0)
      return;
    v9 = (id)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
    objc_msgSend(v9, "siriWillShowPasscodeUnlock");
  }

}

- (void)siriWillShowPasscodeUnlock
{
  -[SRSiriViewController siriWillShowPasscodeUnlockAndCancelRequest:](self, "siriWillShowPasscodeUnlockAndCancelRequest:", 1);
}

- (void)siriWillHidePasscodeUnlockForResult:(int64_t)a3
{
  void *v4;
  char v5;
  id v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation", a3));
  v5 = objc_opt_respondsToSelector(v4, "siriWillHidePasscodeUnlock");

  if ((v5 & 1) != 0)
  {
    v6 = (id)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
    objc_msgSend(v6, "siriWillHidePasscodeUnlock");

  }
}

- (void)siriDidHidePasscodeUnlock
{
  void *v3;
  char v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
  v4 = objc_opt_respondsToSelector(v3, "siriDidHidePasscodeUnlock");

  if ((v4 & 1) != 0)
  {
    v5 = (id)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
    objc_msgSend(v5, "siriDidHidePasscodeUnlock");

  }
}

- (void)showAppUnlockForAppId:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  id v18;

  v6 = a3;
  v7 = a4;
  -[SRSiriViewController siriWillShowPasscodeUnlockAndCancelRequest:](self, "siriWillShowPasscodeUnlockAndCancelRequest:", 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[APApplication applicationWithBundleIdentifier:](APApplication, "applicationWithBundleIdentifier:", v6));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[APGuard sharedGuard](APGuard, "sharedGuard"));
  v10 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v16 = "-[SRSiriViewController showAppUnlockForAppId:completion:]";
    v17 = 2112;
    v18 = v6;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s Authenticating via APGuard for App Unlock, appId=%@", buf, 0x16u);
  }
  objc_initWeak((id *)buf, self);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10003E6B0;
  v12[3] = &unk_100123310;
  objc_copyWeak(&v14, (id *)buf);
  v11 = v7;
  v13 = v11;
  objc_msgSend(v9, "authenticateForSubject:relayingAuditToken:completion:", v8, 1, v12);

  objc_destroyWeak(&v14);
  objc_destroyWeak((id *)buf);

}

- (void)startRequestForText:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  id v9;
  void *v10;
  id obj;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet whitespaceAndNewlineCharacterSet](NSCharacterSet, "whitespaceAndNewlineCharacterSet"));
  obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringByTrimmingCharactersInSet:", v5));

  if (objc_msgSend(obj, "length"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
    v7 = objc_opt_respondsToSelector(v6, "siriWillStartTextInputRequest");

    if ((v7 & 1) != 0)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
      objc_msgSend(v8, "siriWillStartTextInputRequest");

    }
    v9 = objc_msgSend(objc_alloc((Class)SASRequestOptions), "initWithRequestSource:", 23);
    objc_msgSend(v9, "setText:", obj);
    objc_storeStrong((id *)&self->_requestText, obj);
    -[SRSiriViewController _startRequestWithOptions:](self, "_startRequestWithOptions:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _host](self, "_host"));
    objc_msgSend(v10, "serviceDidResetTextInput");

  }
}

- (void)startRequestForSuggestion:(id)a3 inputType:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  NSObject *v11;
  uint64_t Description;
  void *v13;
  int v14;
  const char *v15;
  __int16 v16;
  void *v17;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet whitespaceAndNewlineCharacterSet](NSCharacterSet, "whitespaceAndNewlineCharacterSet"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stringByTrimmingCharactersInSet:", v7));

  if (objc_msgSend(v8, "length"))
  {
    v9 = objc_msgSend(objc_alloc((Class)SASRequestOptions), "initWithRequestSource:", 50);
    objc_msgSend(v9, "setText:", v8);
    v10 = (void *)AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
    {
      v11 = v10;
      Description = SASRequestInputTypeGetDescription(a4);
      v13 = (void *)objc_claimAutoreleasedReturnValue(Description);
      v14 = 136315394;
      v15 = "-[SRSiriViewController startRequestForSuggestion:inputType:]";
      v16 = 2112;
      v17 = v13;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%s #suggestions startRequestForSuggestion inputType: %@", (uint8_t *)&v14, 0x16u);

    }
    objc_msgSend(v9, "setPreviousInteractionInputType:", a4);
    objc_storeStrong((id *)&self->_requestText, v8);
    -[SRSiriViewController _startRequestWithOptions:](self, "_startRequestWithOptions:", v9);

  }
}

- (void)siriKeyboardViewDidChange:(id *)a3
{
  void *v5;
  $AFC7234DB404F59E12F9D07E6C3E3A14 *p_keyboardInfo;
  __int128 v7;
  __int128 v8;
  void *v9;
  char v10;
  void *v11;
  __int128 v12;
  _OWORD v13[3];

  if (a3)
  {
    v5 = (void *)AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
      sub_10009E944((uint64_t)self, v5, (uint64_t)a3);
    p_keyboardInfo = &self->_keyboardInfo;
    v8 = *(_OWORD *)&a3->var3.origin.y;
    v7 = *(_OWORD *)&a3->var3.size.height;
    *(_OWORD *)&self->_keyboardInfo.enabled = *(_OWORD *)&a3->var0;
    *(_OWORD *)&self->_keyboardInfo.keyboardFrame.origin.y = v8;
    *(_OWORD *)&self->_keyboardInfo.keyboardFrame.size.height = v7;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
    v10 = objc_opt_respondsToSelector(v9, "updateKeyboardInfo:");

    if ((v10 & 1) != 0)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
      v12 = *(_OWORD *)&p_keyboardInfo->keyboardFrame.origin.y;
      v13[0] = *(_OWORD *)&p_keyboardInfo->enabled;
      v13[1] = v12;
      v13[2] = *(_OWORD *)&p_keyboardInfo->keyboardFrame.size.height;
      objc_msgSend(v11, "updateKeyboardInfo:", v13);

    }
  }
}

- (BOOL)_siriIsShowingPasscodeUnlock
{
  void *v3;
  char v4;
  void *v5;
  unsigned __int8 v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
  v4 = objc_opt_respondsToSelector(v3, "siriIsShowingPasscodeUnlock");

  if ((v4 & 1) == 0)
    return 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
  v6 = objc_msgSend(v5, "siriIsShowingPasscodeUnlock");

  return v6;
}

- (void)setSession:(id)a3
{
  AFUISiriSession *v5;
  AFUISiriSession *v6;

  v5 = (AFUISiriSession *)a3;
  if (self->_session != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_session, a3);
    v5 = v6;
  }

}

- (void)_setShowKeyboardIfTextInputEnabled:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _host](self, "_host"));
  objc_msgSend(v4, "serviceDidRequestKeyboard:", v3);

}

- (void)_setShowKeyboardIfTextInputEnabled:(BOOL)a3 minimized:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  id v6;

  v4 = a4;
  v5 = a3;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _host](self, "_host"));
  objc_msgSend(v6, "serviceDidRequestKeyboard:minimized:", v5, v4);

}

- (void)didReceiveHelpAction
{
  void *v3;
  char v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
  v4 = objc_opt_respondsToSelector(v3, "didReceiveHelpAction");

  if ((v4 & 1) != 0)
  {
    v5 = (id)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
    objc_msgSend(v5, "didReceiveHelpAction");

  }
}

- (void)didReceiveReportBugAction
{
  void *v3;
  char v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
  v4 = objc_opt_respondsToSelector(v3, "didReceiveReportBugAction");

  if ((v4 & 1) != 0)
  {
    v13 = (id)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
    objc_msgSend(v13, "didReceiveReportBugAction");

  }
  else
  {
    v5 = AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
      sub_10009EA20(v5, v6, v7, v8, v9, v10, v11, v12);
  }
}

- (void)didReceiveBugButtonLongPress
{
  void *v3;
  char v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
  v4 = objc_opt_respondsToSelector(v3, "didReceiveBugButtonLongPress");

  if ((v4 & 1) != 0)
  {
    v5 = (id)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
    objc_msgSend(v5, "didReceiveBugButtonLongPress");

  }
}

- (void)didReceiveShortTapActionWIthRequestOptions:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
  v5 = objc_opt_respondsToSelector(v4, "shortTapActionWithRequestOptions:");

  if ((v5 & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
    objc_msgSend(v6, "shortTapActionWithRequestOptions:", v7);

  }
}

- (void)_dismissWithReason:(int64_t)a3
{
  void *v5;
  NSObject *v6;
  uint64_t Name;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  const char *v15;
  __int16 v16;
  void *v17;

  v5 = (void *)AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    Name = SASDismissalReasonGetName(a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue(Name);
    v14 = 136315394;
    v15 = "-[SRSiriViewController _dismissWithReason:]";
    v16 = 2112;
    v17 = v8;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s #punchout 9 %@", (uint8_t *)&v14, 0x16u);

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
  v10 = objc_opt_respondsToSelector(v9, "dismissalUserInfo");

  if ((v10 & 1) != 0)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "dismissalUserInfo"));

  }
  else
  {
    v12 = 0;
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _hostWithErrorHandler:](self, "_hostWithErrorHandler:", &stru_100123350));
  objc_msgSend(v13, "serviceRequestsDismissalWithUserInfo:withReason:", v12, a3);

}

- (void)hostApplicationWillResignActive
{
  void *v3;
  char v4;
  void *v5;
  id v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
  v4 = objc_opt_respondsToSelector(v3, "hostApplicationWillResignActive");

  if ((v4 & 1) != 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
    objc_msgSend(v5, "hostApplicationWillResignActive");

  }
  v6 = (id)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _instrumentationManager](self, "_instrumentationManager"));
  objc_msgSend(v6, "hostWillResignActive");

}

- (void)hostApplicationWillEnterForeground
{
  void *v3;
  char v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
  v4 = objc_opt_respondsToSelector(v3, "hostApplicationWillEnterForeground");

  if ((v4 & 1) != 0)
  {
    v5 = (id)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
    objc_msgSend(v5, "hostApplicationWillEnterForeground");

  }
}

- (void)hostApplicationDidBecomeActive
{
  void *v3;
  char v4;
  void *v5;
  id v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
  v4 = objc_opt_respondsToSelector(v3, "hostApplicationDidBecomeActive");

  if ((v4 & 1) != 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
    objc_msgSend(v5, "hostApplicationDidBecomeActive");

  }
  v6 = (id)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _instrumentationManager](self, "_instrumentationManager"));
  objc_msgSend(v6, "hostDidBecomeActive");

}

- (void)setWaitingForTelephonyToStart:(BOOL)a3
{
  self->_waitingForTelephonyToStart = a3;
}

- (void)hostApplicationRequestsEmitUIStateTransitionForSiriDismissalWithReason:(int)a3 completion:(id)a4
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void (**v9)(id, void *);

  v4 = *(_QWORD *)&a3;
  v9 = (void (**)(id, void *))a4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[SRUIFInstrumentationManager sharedManager](SRUIFInstrumentationManager, "sharedManager"));
  objc_msgSend(v5, "emitUIStateTransitionForSiriDismissalWithReason:", v4);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[SRUIFInstrumentationManager sharedManager](SRUIFInstrumentationManager, "sharedManager"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "currentInstrumentationTurnContext"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "turnIdentifier"));

  if (v9)
    v9[2](v9, v8);

}

- (void)hostApplicationRequestsEmitInstrumentationEvent:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _instrumentationManager](self, "_instrumentationManager"));
  objc_msgSend(v5, "emitInstrumentation:", v4);

}

- (void)hostApplicationRequestsEmitInstrumentationEvent:(id)a3 atTime:(unint64_t)a4
{
  id v6;
  id v7;

  v6 = a3;
  v7 = (id)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _instrumentationManager](self, "_instrumentationManager"));
  objc_msgSend(v7, "emitInstrumentation:atTime:", v6, a4);

}

- (void)hostApplicationRequestsScreenshotWithCompletion:(id)a3
{
  void (**v3)(id, uint64_t);
  id v4;
  NSObject *v5;
  int v6;
  const char *v7;

  v3 = (void (**)(id, uint64_t))a3;
  v4 = objc_alloc_init((Class)SSUIService);
  objc_msgSend(v4, "showScreenshotUI");
  v5 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315138;
    v7 = "-[SRSiriViewController hostApplicationRequestsScreenshotWithCompletion:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s #screenshot: taking screenshot", (uint8_t *)&v6, 0xCu);
  }
  if (v3)
    v3[2](v3, 1);

}

- (void)hasContentAtPoint:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void (**v8)(_QWORD, _QWORD);
  NSObject *v9;
  uint64_t v10;
  id v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  NSObject *v17;
  const char *v18;
  char v19;
  void *v20;
  void *v21;
  void *v22;
  _BOOL4 v23;
  NSObject *v24;
  CGRect *p_systemContentFrame;
  double height;
  double x;
  double y;
  double width;
  NSObject *v30;
  void *v31;
  double v32;
  double v33;
  double v34;
  NSObject *v35;
  void *v36;
  double v37;
  double v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  id v43;
  id v44;
  uint64_t v45;
  void *i;
  void *v47;
  void *v48;
  NSObject *v49;
  void *v50;
  void (**v51)(_QWORD, _QWORD);
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  uint8_t v56[128];
  uint8_t buf[4];
  const char *v58;
  CGPoint v59;
  CGPoint v60;
  CGRect v61;
  CGRect v62;

  v6 = a3;
  v7 = a4;
  v8 = (void (**)(_QWORD, _QWORD))v7;
  if (!self->_textInteractionEditMenuVisible)
  {
    if (!v6)
    {
      v10 = 1;
      if (!v7)
        goto LABEL_20;
      goto LABEL_19;
    }
    v11 = objc_msgSend(v6, "CGPointValue");
    v13 = v12;
    v15 = v14;
    if (!SiriUIIsValidPoint(v11))
    {
      v19 = 1;
LABEL_18:
      v10 = v19 & 1;
      if (v8)
        goto LABEL_19;
      goto LABEL_20;
    }
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController presentation](self, "presentation"));
    if ((objc_opt_respondsToSelector(v16, "hasContentAtPoint:") & 1) != 0
      && (objc_msgSend(v16, "hasContentAtPoint:", v13, v15) & 1) == 0)
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController parentViewController](self, "parentViewController"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "presentedViewController"));

      if (v21)
      {
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "view"));
        objc_msgSend(v22, "frame");
        v59.x = v13;
        v59.y = v15;
        v23 = CGRectContainsPoint(v61, v59);

        if (v23)
        {
          v24 = AFSiriLogContextConnection;
          if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315138;
            v58 = "-[SRSiriViewController hasContentAtPoint:completion:]";
            _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "%s #dismissal - found content at point in presented alert view controller", buf, 0xCu);
          }

          goto LABEL_13;
        }
      }

      p_systemContentFrame = &self->_systemContentFrame;
      height = self->_systemContentFrame.size.height;
      if (height == 0.0)
        goto LABEL_38;
      x = p_systemContentFrame->origin.x;
      y = self->_systemContentFrame.origin.y;
      width = self->_systemContentFrame.size.width;
      if (objc_msgSend(UIApp, "activeInterfaceOrientation") == (id)3)
      {
        v30 = AFSiriLogContextConnection;
        if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          v58 = "-[SRSiriViewController hasContentAtPoint:completion:]";
          _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "%s #dismissal - converting system content frame to landscape right", buf, 0xCu);
        }
        v31 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController view](self, "view"));
        objc_msgSend(v31, "frame");
        v33 = v32;

        height = self->_systemContentFrame.size.width;
        width = self->_systemContentFrame.size.height;
        v34 = v33 - height;
        x = self->_systemContentFrame.origin.y;
        y = v34 - p_systemContentFrame->origin.x;
      }
      else if (objc_msgSend(UIApp, "activeInterfaceOrientation") == (id)4)
      {
        v35 = AFSiriLogContextConnection;
        if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          v58 = "-[SRSiriViewController hasContentAtPoint:completion:]";
          _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "%s #dismissal - converting system content frame to landscape left", buf, 0xCu);
        }
        v36 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController view](self, "view"));
        objc_msgSend(v36, "frame");
        v38 = v37;

        height = self->_systemContentFrame.size.width;
        width = self->_systemContentFrame.size.height;
        y = p_systemContentFrame->origin.x;
        x = v38 - width - self->_systemContentFrame.origin.y;
      }
      v62.origin.x = x;
      v62.origin.y = y;
      v62.size.width = width;
      v62.size.height = height;
      v60.x = v13;
      v60.y = v15;
      if (!CGRectContainsPoint(v62, v60))
      {
LABEL_38:
        v50 = v16;
        v51 = v8;
        v39 = (void *)objc_claimAutoreleasedReturnValue(+[UIWindow allWindowsIncludingInternalWindows:onlyVisibleWindows:](UIWindow, "allWindowsIncludingInternalWindows:onlyVisibleWindows:", 1, 0));
        v40 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController view](self, "view"));
        v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "window"));

        v54 = 0u;
        v55 = 0u;
        v52 = 0u;
        v53 = 0u;
        v42 = v39;
        v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v52, v56, 16);
        if (v43)
        {
          v44 = v43;
          v19 = 0;
          v45 = *(_QWORD *)v53;
          do
          {
            for (i = 0; i != v44; i = (char *)i + 1)
            {
              if (*(_QWORD *)v53 != v45)
                objc_enumerationMutation(v42);
              v47 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * (_QWORD)i);
              if (v47 != v41)
              {
                v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "hitTest:withEvent:", 0, v13, v15));
                if (v48)
                {
                  v49 = AFSiriLogContextConnection;
                  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 136315138;
                    v58 = "-[SRSiriViewController hasContentAtPoint:completion:]";
                    _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_DEFAULT, "%s #dismissal - found content at point in additional windows used by Siri, but not owned by Siri.", buf, 0xCu);
                  }
                  v19 = 1;
                }

              }
            }
            v44 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v52, v56, 16);
          }
          while (v44);
        }
        else
        {
          v19 = 0;
        }

        v8 = v51;
        v16 = v50;
        goto LABEL_14;
      }
      v17 = AFSiriLogContextConnection;
      if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v58 = "-[SRSiriViewController hasContentAtPoint:completion:]";
        v18 = "%s #dismissal - found content at point in system aperture";
        goto LABEL_12;
      }
    }
    else
    {
      v17 = AFSiriLogContextConnection;
      if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v58 = "-[SRSiriViewController hasContentAtPoint:completion:]";
        v18 = "%s #dismissal - found content at point in Presentation";
LABEL_12:
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, v18, buf, 0xCu);
      }
    }
LABEL_13:
    v19 = 1;
LABEL_14:

    goto LABEL_18;
  }
  v9 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v58 = "-[SRSiriViewController hasContentAtPoint:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s #dismissal - skipping content at point because of active text editing menu", buf, 0xCu);
  }
  if (v8)
  {
    v10 = 1;
LABEL_19:
    v8[2](v8, v10);
  }
LABEL_20:

}

- (void)didDetectGestureEvent:(int64_t)a3 inRegion:(int64_t)a4
{
  void *v7;
  void *v8;

  v7 = (void *)AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
    sub_10009EAFC(v7, (void *)a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController presentation](self, "presentation"));
  if ((objc_opt_respondsToSelector(v8, "didDetectGestureEvent:inRegion:") & 1) != 0)
    objc_msgSend(v8, "didDetectGestureEvent:inRegion:", a3, a4);

}

- (void)siriWillBeginTearDownForDismissalReason:(int64_t)a3 withOriginalDismissalOptions:(id)a4
{
  void *v6;
  SRSiriSystemUIController *systemUIController;
  id v8;

  v8 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController presentation](self, "presentation"));
  if ((objc_opt_respondsToSelector(v6, "siriWillBeginTearDownForDismissalReason:withOriginalDismissalOptions:") & 1) != 0)
  {
    objc_msgSend(v6, "siriWillBeginTearDownForDismissalReason:withOriginalDismissalOptions:", a3, v8);
  }
  else if ((objc_opt_respondsToSelector(v6, "siriWillBeginTearDownForDismissalReason:") & 1) != 0)
  {
    objc_msgSend(v6, "siriWillBeginTearDownForDismissalReason:", a3);
  }
  -[SRSiriSystemUIController tearDown](self->_systemUIController, "tearDown");
  systemUIController = self->_systemUIController;
  self->_systemUIController = 0;

}

- (void)hostApplicationPresentationStateUpdatedFromPresentationState:(int64_t)a3 toPresentationState:(int64_t)a4
{
  void *v7;
  char v8;
  id v9;

  self->_presentationState = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController presentation](self, "presentation"));
  v8 = objc_opt_respondsToSelector(v7, "presentationStateUpdatedFromPresentationState:toPresentationState:");

  if ((v8 & 1) != 0)
  {
    v9 = (id)objc_claimAutoreleasedReturnValue(-[SRSiriViewController presentation](self, "presentation"));
    objc_msgSend(v9, "presentationStateUpdatedFromPresentationState:toPresentationState:", a3, a4);

  }
}

- (void)hostApplicationDidSuccessfullyHandleCommandsInDelayedActionCommand:(id)a3
{
  id v4;
  NSObject *v5;
  _BOOL4 requestActive;
  _BOOL4 listenAfterSpeakingForRequestFinished;
  int v8;
  const char *v9;
  __int16 v10;
  _BOOL4 v11;
  __int16 v12;
  _BOOL4 v13;

  v4 = a3;
  v5 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    requestActive = self->_requestActive;
    listenAfterSpeakingForRequestFinished = self->_listenAfterSpeakingForRequestFinished;
    v8 = 136315650;
    v9 = "-[SRSiriViewController hostApplicationDidSuccessfullyHandleCommandsInDelayedActionCommand:]";
    v10 = 1024;
    v11 = requestActive;
    v12 = 1024;
    v13 = listenAfterSpeakingForRequestFinished;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s Request Active:%d, LAS: %d", (uint8_t *)&v8, 0x18u);
  }
  if (!self->_requestActive && self->_listenAfterSpeakingForRequestFinished)
  {
    -[SRSiriViewController _startListenAfterSpeaking](self, "_startListenAfterSpeaking");
    -[SRSiriViewController _setListenAfterSpeakingForRequestFinished:](self, "_setListenAfterSpeakingForRequestFinished:", 0);
  }

}

- (void)animatedDisappearanceDidBeginWithDuration:(double)a3 reason:(int64_t)a4
{
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;

  v7 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
    sub_10009EBA0(v7, v8, v9, v10, v11, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController presentation](self, "presentation"));
  if ((objc_opt_respondsToSelector(v15, "animatedDisappearanceDidBeginWithDuration:reason:") & 1) != 0)
    objc_msgSend(v15, "animatedDisappearanceDidBeginWithDuration:reason:", a4, a3);

}

- (void)setPresentation:(id)a3
{
  -[SRSiriViewController setPresentation:animated:completion:](self, "setPresentation:animated:completion:", a3, 0, 0);
}

- (void)setPresentation:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL4 v6;
  SiriUIPresentation *v9;
  Block_layout *v10;
  Block_layout *v11;
  SiriUIPresentation **p_presentation;
  void *v13;
  void *v14;
  _BOOL4 v15;
  void *v16;
  void *v17;
  void *v18;
  SiriUIPresentation *v19;
  void *v20;
  NSObject *v21;
  _BOOL4 v22;
  const __CFString *v23;
  const char *v24;
  NSObject *v25;
  uint32_t v26;
  uint64_t v27;
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
  Block_layout *v39;
  void *v40;
  Block_layout *v41;
  _QWORD v42[4];
  id v43;
  Block_layout *v44;
  uint8_t buf[4];
  const char *v46;
  __int16 v47;
  SiriUIPresentation *v48;
  __int16 v49;
  SiriUIPresentation *v50;
  __int16 v51;
  const __CFString *v52;
  CGRect v53;
  CGRect v54;

  v6 = a4;
  v9 = (SiriUIPresentation *)a3;
  v10 = (Block_layout *)a5;
  v11 = v10;
  p_presentation = &self->_presentation;
  if (self->_presentation != v9)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController view](self, "view"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "window"));
    objc_msgSend(v14, "frame");
    v54.origin.x = CGRectZero.origin.x;
    v54.origin.y = CGRectZero.origin.y;
    v54.size.width = CGRectZero.size.width;
    v54.size.height = CGRectZero.size.height;
    v15 = CGRectEqualToRect(v53, v54);

    if (v15)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController view](self, "view"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "window"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
      objc_msgSend(v18, "bounds");
      objc_msgSend(v17, "setFrame:");

    }
    v19 = *p_presentation;
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentationViewController](self, "_presentationViewController"));
    v21 = AFSiriLogContextConnection;
    v22 = os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT);
    if (v19)
    {
      if (!v22)
        goto LABEL_14;
      v23 = &stru_100125588;
      *(_DWORD *)buf = 136315906;
      v46 = "-[SRSiriViewController setPresentation:animated:completion:]";
      if (v6)
        v23 = CFSTR(" (animated)");
      v47 = 2112;
      v48 = v19;
      v49 = 2112;
      v50 = v9;
      v51 = 2112;
      v52 = v23;
      v24 = "%s Transitioning from presentation %@ to presentation %@%@";
      v25 = v21;
      v26 = 42;
    }
    else
    {
      if (!v22)
        goto LABEL_14;
      *(_DWORD *)buf = 136315394;
      v46 = "-[SRSiriViewController setPresentation:animated:completion:]";
      v47 = 2112;
      v48 = v9;
      v24 = "%s Setting initial presentation to %@";
      v25 = v21;
      v26 = 22;
    }
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, v24, buf, v26);
LABEL_14:
    if ((objc_opt_respondsToSelector(*p_presentation, "setDataSource:") & 1) != 0)
      -[SiriUIPresentation setDataSource:](*p_presentation, "setDataSource:", 0);
    if ((objc_opt_respondsToSelector(*p_presentation, "setDelegate:") & 1) != 0)
      -[SiriUIPresentation setDelegate:](*p_presentation, "setDelegate:", 0);
    objc_storeStrong((id *)&self->_presentation, a3);
    if ((objc_opt_respondsToSelector(*p_presentation, "setDelegate:") & 1) != 0)
      -[SiriUIPresentation setDelegate:](*p_presentation, "setDelegate:", self);
    if ((objc_opt_respondsToSelector(*p_presentation, "setDataSource:") & 1) != 0)
      -[SiriUIPresentation setDataSource:](*p_presentation, "setDataSource:", self);
    if ((objc_opt_respondsToSelector(*p_presentation, "setBottomContentInset:") & 1) != 0)
      -[SiriUIPresentation setBottomContentInset:](*p_presentation, "setBottomContentInset:", self->_bottomContentInset);
    if ((objc_opt_respondsToSelector(*p_presentation, "setTopContentInset:animated:") & 1) != 0)
      -[SiriUIPresentation setTopContentInset:animated:](*p_presentation, "setTopContentInset:animated:", 1, CGRectGetMaxY(self->_systemContentFrame));
    if ((objc_opt_respondsToSelector(*p_presentation, "shouldAllowTouchPassThrough") & 1) != 0)
      v27 = -[SiriUIPresentation shouldAllowTouchPassThrough](*p_presentation, "shouldAllowTouchPassThrough") ^ 1;
    else
      v27 = 1;
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController view](self, "view"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "layer"));
    objc_msgSend(v29, "setHitTestsAsOpaque:", v27);

    v30 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentationViewController](self, "_presentationViewController"));
    if (v30)
    {
      -[SRSiriViewController addChildViewController:](self, "addChildViewController:", v30);
      objc_msgSend(v30, "didMoveToParentViewController:", self);
      if (v6 && v20)
      {
        v42[0] = _NSConcreteStackBlock;
        v42[1] = 3221225472;
        v42[2] = sub_100040308;
        v42[3] = &unk_100122F30;
        v43 = v20;
        v44 = v11;
        -[SRSiriViewController transitionFromViewController:toViewController:duration:options:animations:completion:](self, "transitionFromViewController:toViewController:duration:options:animations:completion:", v43, v30, 5242880, 0, v42, 0.2);

LABEL_49:
        goto LABEL_50;
      }
      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "view"));
      objc_msgSend(v31, "setAutoresizingMask:", 18);

      v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "view"));
      v33 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController view](self, "view"));
      objc_msgSend(v33, "bounds");
      objc_msgSend(v32, "setFrame:");

      v34 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController view](self, "view"));
      v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "view"));
      objc_msgSend(v34, "addSubview:", v35);

      if (v20)
        goto LABEL_36;
      if (v19)
      {
        v40 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _host](self, "_host"));
        v38 = v40;
        if (v11)
          v41 = v11;
        else
          v41 = &stru_100123390;
        objc_msgSend(v40, "serviceViewControllerRequestsPresentation:", v41);
        goto LABEL_48;
      }
    }
    else if (v20)
    {
LABEL_36:
      objc_msgSend(v20, "willMoveToParentViewController:", 0);
      v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "view"));
      objc_msgSend(v36, "removeFromSuperview");

      objc_msgSend(v20, "removeFromParentViewController");
      if (v30)
        goto LABEL_37;
      v37 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _host](self, "_host"));
      v38 = v37;
      if (v11)
        v39 = v11;
      else
        v39 = &stru_1001233B0;
      objc_msgSend(v37, "serviceViewControllerRequestsDismissalWithDismissalReason:completion:", 0, v39);
LABEL_48:

      goto LABEL_49;
    }
LABEL_37:
    if (v11)
      v11->invoke(v11, 1);
    goto LABEL_49;
  }
  if (v10)
    v10->invoke(v10, 0);
LABEL_50:

}

- (void)updateToPresentationWithIdentifier:(id)a3 presentationProperties:(id)a4 animated:(BOOL)a5 completion:(id)a6
{
  _BOOL8 v7;
  void (**v10)(id, _QWORD);
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;

  v7 = a5;
  v20 = a4;
  v10 = (void (**)(id, _QWORD))a6;
  v11 = a3;
  -[SRSiriViewController _restorePreviousConversation](self, "_restorePreviousConversation");
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[SRSiriPresentationPluginHost sharedSiriPresentationPluginHost](SRSiriPresentationPluginHost, "sharedSiriPresentationPluginHost"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "presentationWithIdentifier:delegate:dataSource:", v11, self, self));

  objc_opt_class(self->_presentation, v14);
  if ((objc_opt_isKindOfClass(v13, v15) & 1) != 0)
  {
    if (v10)
      v10[2](v10, 0);
  }
  else
  {
    if ((objc_opt_respondsToSelector(v13, "setShouldSuppressErrorTTS:") & 1) != 0)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "objectForKey:", AFUIPresentationPropertiesShouldSuppressErrorTTSKey));
      objc_msgSend(v13, "setShouldSuppressErrorTTS:", objc_msgSend(v16, "BOOLValue"));

    }
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "objectForKey:", AFUIPresentationPropertiesRequestSourceKey));
    if (v17 && (objc_opt_respondsToSelector(v13, "siriWillActivateFromSource:") & 1) != 0)
      objc_msgSend(v13, "siriWillActivateFromSource:", objc_msgSend(v17, "integerValue"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "objectForKey:", AFUIPresentationPropertiesShowsSensitiveUIKey));
    v19 = objc_msgSend(v18, "BOOLValue");

    if (v17 && (objc_opt_respondsToSelector(v13, "setShowsSensitiveUI:") & 1) != 0)
      objc_msgSend(v13, "setShowsSensitiveUI:", v19);
    -[SRSiriViewController setPresentation:animated:completion:](self, "setPresentation:animated:completion:", v13, v7, v10);

  }
}

- (CGRect)frameForApplication:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  CGRect v24;
  CGRect result;
  CGRect v26;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation", a3));
  v5 = objc_opt_respondsToSelector(v4, "effectiveContentFrame");

  if ((v5 & 1) == 0)
    goto LABEL_3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
  objc_msgSend(v6, "effectiveContentFrame");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;

  v26.origin.x = CGRectZero.origin.x;
  v26.origin.y = CGRectZero.origin.y;
  v26.size.width = CGRectZero.size.width;
  v26.size.height = CGRectZero.size.height;
  v24.origin.x = v8;
  v24.origin.y = v10;
  v24.size.width = v12;
  v24.size.height = v14;
  if (CGRectEqualToRect(v24, v26))
  {
LABEL_3:
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController view](self, "view"));
    objc_msgSend(v15, "frame");
    v8 = v16;
    v10 = v17;
    v12 = v18;
    v14 = v19;

  }
  v20 = v8;
  v21 = v10;
  v22 = v12;
  v23 = v14;
  result.size.height = v23;
  result.size.width = v22;
  result.origin.y = v21;
  result.origin.x = v20;
  return result;
}

- (void)_openURL:(id)a3 bundleId:(id)a4 inPlace:(BOOL)a5 conversationId:(id)a6 completion:(id)a7
{
  _BOOL8 v9;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  BOOL v29;
  id location;
  _QWORD v31[4];
  id v32;

  v9 = a5;
  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = a7;
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _punchoutMetricsAceCommandIdForItemWithIdentifier:](self, "_punchoutMetricsAceCommandIdForItemWithIdentifier:", v14));
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_1000407E4;
  v31[3] = &unk_1001233D8;
  v17 = v15;
  v32 = v17;
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _hostWithErrorHandler:](self, "_hostWithErrorHandler:", v31));
  objc_initWeak(&location, self);
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_1000407FC;
  v23[3] = &unk_100123400;
  objc_copyWeak(&v28, &location);
  v19 = v12;
  v24 = v19;
  v20 = v13;
  v25 = v20;
  v29 = v9;
  v21 = v17;
  v27 = v21;
  v22 = v16;
  v26 = v22;
  objc_msgSend(v18, "openURL:bundleId:inPlace:completion:", v19, v20, v9, v23);

  objc_destroyWeak(&v28);
  objc_destroyWeak(&location);

}

- (void)_delayAceCommandSuccess:(id)a3 forDuration:(double)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  dispatch_time_t v10;
  id v11;
  _QWORD block[4];
  id v13;
  id v14[2];
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  double v18;
  __int16 v19;
  void *v20;

  v6 = a3;
  v7 = (void *)AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    v8 = v7;
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "aceId"));
    *(_DWORD *)buf = 136315650;
    v16 = "-[SRSiriViewController _delayAceCommandSuccess:forDuration:]";
    v17 = 2048;
    v18 = a4;
    v19 = 2112;
    v20 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s #aceCommandRecord scheduling a delayed action of %f seconds for command %@", buf, 0x20u);

  }
  -[SRSiriViewController _didStartActionForAceCommand:](self, "_didStartActionForAceCommand:", v6);
  objc_initWeak((id *)buf, self);
  v10 = dispatch_time(0, (uint64_t)(a4 * 1000000000.0));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100040ACC;
  block[3] = &unk_100123428;
  v14[1] = *(id *)&a4;
  v13 = v6;
  v11 = v6;
  objc_copyWeak(v14, (id *)buf);
  dispatch_after(v10, (dispatch_queue_t)&_dispatch_main_q, block);
  objc_destroyWeak(v14);

  objc_destroyWeak((id *)buf);
}

- (void)_didReceiveAceCommand:(id)a3
{
  -[SRSiriViewController _didReceiveAceCommand:completion:](self, "_didReceiveAceCommand:completion:", a3, 0);
}

- (void)_didReceiveAceCommand:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  _BOOL8 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  int v16;
  const char *v17;
  __int16 v18;
  SRSiriViewController *v19;
  __int16 v20;
  id v21;

  v6 = a3;
  v7 = a4;
  v8 = AFSiriLogContextConnection;
  v9 = os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT);
  if (v9)
  {
    v16 = 136315650;
    v17 = "-[SRSiriViewController _didReceiveAceCommand:completion:]";
    v18 = 2112;
    v19 = self;
    v20 = 2112;
    v21 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s %@ received ACE command: %@", (uint8_t *)&v16, 0x20u);
  }
  if (AFDeviceSupportsSystemAssistantExperience(v9, v10))
  {
    objc_opt_class(SASSpeechPartialResult, v11);
    if ((objc_opt_isKindOfClass(v6, v12) & 1) != 0
      || (objc_opt_class(SASSpeechRecognized, v13), (objc_opt_isKindOfClass(v6, v14) & 1) != 0))
    {
      -[SRSiriViewController _interruptSuggestionsForSpeechRecognized:](self, "_interruptSuggestionsForSpeechRecognized:", v6);
    }
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _aceCommandRecords](self, "_aceCommandRecords"));
  objc_msgSend(v15, "registerAceCommand:completion:", v6, v7);

}

- (void)_didStartActionForAceCommand:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t isKindOfClass;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  const __CFString *v19;
  void *v20;
  const __CFString *v21;
  void *v22;

  v4 = a3;
  if ((objc_opt_respondsToSelector(v4, "_afui_updateMapsAnalytics") & 1) != 0)
    objc_msgSend(v4, "_afui_updateMapsAnalytics");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _aceCommandRecords](self, "_aceCommandRecords"));
  objc_msgSend(v5, "recordActionStartedForAceCommand:", v4);

  if (-[SASRequestOptions inputType](self->_requestOptions, "inputType") == (id)2)
  {
    objc_opt_class(SASSpeechPartialResult, v6);
    isKindOfClass = objc_opt_isKindOfClass(v4, v7);
    if ((isKindOfClass & 1) != 0)
    {
      if (AFIsInternalInstall(isKindOfClass, v9))
      {
        v21 = CFSTR("bestTextInterpretation");
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "af_bestTextInterpretation"));
        v22 = v10;
        v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1));

      }
      else
      {
        v11 = 0;
      }
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _analytics](self, "_analytics"));
      v17 = v16;
      v18 = 1505;
LABEL_14:
      objc_msgSend(v16, "logEventWithType:context:", v18, v11);

      goto LABEL_15;
    }
    objc_opt_class(SASSpeechRecognized, v9);
    v13 = objc_opt_isKindOfClass(v4, v12);
    if ((v13 & 1) != 0)
    {
      if (AFIsInternalInstall(v13, v14))
      {
        v19 = CFSTR("bestTextInterpretation");
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "af_bestTextInterpretation"));
        v20 = v15;
        v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1));

      }
      else
      {
        v11 = 0;
      }
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _analytics](self, "_analytics"));
      v17 = v16;
      v18 = 1507;
      goto LABEL_14;
    }
  }
LABEL_15:

}

- (void)_didStartActionForItemAtIndexPath:(id)a3 inConversation:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "itemAtIndexPath:", a3));
  v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "aceCommandIdentifier"));

  v6 = v8;
  if (v8)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _aceCommandWithIdentifier:](self, "_aceCommandWithIdentifier:", v8));
    -[SRSiriViewController _didStartActionForAceCommand:](self, "_didStartActionForAceCommand:", v7);

    v6 = v8;
  }

}

- (id)_aceCommandWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _aceCommandRecords](self, "_aceCommandRecords"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "aceCommandWithIdentifier:", v4));

  return v6;
}

- (void)_speakText:(id)a3 identifier:(id)a4 sessionId:(id)a5 preferredVoice:(id)a6 provisionally:(BOOL)a7 eligibleAfterDuration:(double)a8 delayed:(BOOL)a9 canUseServerTTS:(BOOL)a10 speakableUtteranceParser:(id)a11 analyticsContext:(id)a12 speakableContextInfo:(id)a13 preparation:(id)a14 completion:(id)a15
{
  uint64_t v15;

  BYTE2(v15) = a10;
  BYTE1(v15) = a9;
  LOBYTE(v15) = a7;
  -[SRSiriViewController _speakText:audioData:ignoreMuteSwitch:identifier:sessionId:preferredVoice:language:gender:provisionally:eligibleAfterDuration:delayed:canUseServerTTS:speakableUtteranceParser:analyticsContext:speakableContextInfo:preparation:completion:](self, "_speakText:audioData:ignoreMuteSwitch:identifier:sessionId:preferredVoice:language:gender:provisionally:eligibleAfterDuration:delayed:canUseServerTTS:speakableUtteranceParser:analyticsContext:speakableContextInfo:preparation:completion:", a3, 0, 0, a4, a5, a6, a8, 0, 0, v15, a11, a12, a13, a14, a15);
}

- (void)_speakText:(id)a3 audioData:(id)a4 ignoreMuteSwitch:(BOOL)a5 identifier:(id)a6 sessionId:(id)a7 preferredVoice:(id)a8 language:(id)a9 gender:(id)a10 provisionally:(BOOL)a11 eligibleAfterDuration:(double)a12 delayed:(BOOL)a13 canUseServerTTS:(BOOL)a14 speakableUtteranceParser:(id)a15 analyticsContext:(id)a16 speakableContextInfo:(id)a17 preparation:(id)a18 completion:(id)a19
{
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  _QWORD *v31;
  void (**v32)(_QWORD, _QWORD, _QWORD);
  id v33;
  NSObject *v34;
  AFUISiriSession *session;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  _QWORD v42[4];
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;
  id v51;
  id v52;
  void (**v53)(_QWORD, _QWORD, _QWORD);
  id v54;
  id v55;
  id v56[2];
  BOOL v57;
  BOOL v58;
  BOOL v59;
  _QWORD v60[4];
  id v61;
  id location[2];

  v24 = a3;
  v25 = a4;
  v37 = a6;
  v38 = a7;
  v39 = a8;
  v40 = a9;
  v26 = a10;
  v41 = a15;
  v27 = a16;
  v28 = a17;
  v29 = a18;
  v60[0] = _NSConcreteStackBlock;
  v60[1] = 3221225472;
  v60[2] = sub_100041440;
  v60[3] = &unk_100123450;
  v30 = a19;
  v61 = v30;
  v31 = objc_retainBlock(v60);
  v32 = (void (**)(_QWORD, _QWORD, _QWORD))v31;
  if (v24)
  {
    v31 = objc_msgSend(v24, "length");
    if (!v25 && !v31)
      goto LABEL_4;
  }
  else if (!v25)
  {
LABEL_4:
    v32[2](v32, 2, 0);
    goto LABEL_11;
  }
  if ((AFDeviceSupportsTTS(v31) & 1) != 0)
  {
    objc_initWeak(location, self);
    session = self->_session;
    v42[0] = _NSConcreteStackBlock;
    v42[1] = 3221225472;
    v42[2] = sub_100041454;
    v42[3] = &unk_1001234C8;
    objc_copyWeak(v56, location);
    v53 = v32;
    v43 = v25;
    v44 = v37;
    v45 = v38;
    v57 = a11;
    v56[1] = *(id *)&a12;
    v54 = v30;
    v58 = a14;
    v46 = v24;
    v47 = v41;
    v55 = v29;
    v48 = v39;
    v49 = v40;
    v50 = v26;
    v59 = a13;
    v51 = v27;
    v52 = v28;
    -[AFUISiriSession forceAudioSessionActiveWithCompletion:](session, "forceAudioSessionActiveWithCompletion:", v42);

    objc_destroyWeak(v56);
    objc_destroyWeak(location);
  }
  else
  {
    v33 = v26;
    v34 = AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(location[0]) = 136315138;
      *(id *)((char *)location + 4) = "-[SRSiriViewController _speakText:audioData:ignoreMuteSwitch:identifier:sessionId:"
                                      "preferredVoice:language:gender:provisionally:eligibleAfterDuration:delayed:canUseS"
                                      "erverTTS:speakableUtteranceParser:analyticsContext:speakableContextInfo:preparation:completion:]";
      _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "%s TTS not available on certain devices, marking as finished", (uint8_t *)location, 0xCu);
    }
    v32[2](v32, 1, 0);
    v26 = v33;
  }
LABEL_11:

}

- (void)_didCompleteActionForAceCommand:(id)a3 success:(BOOL)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  void *v14;
  unsigned __int8 v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  uint64_t v22;
  void *i;
  void *v24;
  NSObject *v25;
  void *v26;
  NSObject *v27;
  id v28;
  _BOOL4 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t v34[128];
  uint8_t buf[4];
  const char *v36;
  __int16 v37;
  id v38;
  __int16 v39;
  _BOOL4 v40;

  v29 = a4;
  v6 = a3;
  objc_opt_class(SAUISayIt, v7);
  if ((objc_opt_isKindOfClass(v6, v8) & 1) != 0
    && !-[SRSiriViewController _presentationAllowsRecordingActionCompletedForSpeechSynthesisCommand:](self, "_presentationAllowsRecordingActionCompletedForSpeechSynthesisCommand:", v6))
  {
    v27 = AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v36 = "-[SRSiriViewController _didCompleteActionForAceCommand:success:]";
      v37 = 2112;
      v38 = v6;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "%s #tts 33 NOT recording SAUISayIt completed for SAUISayIt=%@", buf, 0x16u);
    }
    objc_storeStrong((id *)&self->_previousSayItCommand, a3);
    v13 = (id)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _aceCommandRecords](self, "_aceCommandRecords"));
    objc_msgSend(v13, "recordActionStoppedForAceCommand:", v6);
    goto LABEL_20;
  }
  v9 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v36 = "-[SRSiriViewController _didCompleteActionForAceCommand:success:]";
    v37 = 2112;
    v38 = v6;
    v39 = 1024;
    v40 = v29;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s #tts 33 recording command completed for aceCommand=%@ success=%i", buf, 0x1Cu);
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _aceCommandRecords](self, "_aceCommandRecords"));
  objc_msgSend(v10, "recordActionCompletedForAceCommand:success:", v6, v29);

  objc_opt_class(SAUIAddViews, v11);
  if ((objc_opt_isKindOfClass(v6, v12) & 1) != 0)
  {
    v13 = v6;
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "af_dialogPhase"));
    v15 = objc_msgSend(v14, "isReflectionDialogPhase");

    if ((v15 & 1) == 0)
    {
      v28 = v6;
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _aceCommandRecords](self, "_aceCommandRecords"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "refId"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "pendingAddViewsWithReflectionDialogPhaseWithRefId:", v17));

      v32 = 0u;
      v33 = 0u;
      v30 = 0u;
      v31 = 0u;
      v19 = v18;
      v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
      if (v20)
      {
        v21 = v20;
        v22 = *(_QWORD *)v31;
        do
        {
          for (i = 0; i != v21; i = (char *)i + 1)
          {
            if (*(_QWORD *)v31 != v22)
              objc_enumerationMutation(v19);
            v24 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * (_QWORD)i);
            v25 = AFSiriLogContextConnection;
            if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315650;
              v36 = "-[SRSiriViewController _didCompleteActionForAceCommand:success:]";
              v37 = 2112;
              v38 = v24;
              v39 = 1024;
              v40 = v29;
              _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "%s #tts recording reflectionDialogPhase command completed command=%@ success=%i", buf, 0x1Cu);
            }
            v26 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _aceCommandRecords](self, "_aceCommandRecords"));
            objc_msgSend(v26, "recordActionCompletedForAceCommand:success:", v24, 1);

          }
          v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
        }
        while (v21);
      }

      v6 = v28;
    }
LABEL_20:

  }
}

- (BOOL)_presentationAllowsRecordingActionCompletedForSpeechSynthesisCommand:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  id v8;
  BOOL v9;
  void *v10;
  NSObject *v11;
  void *v12;
  const __CFString *v13;
  int v15;
  const char *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  const __CFString *v20;
  __int16 v21;
  id v22;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController presentation](self, "presentation"));
  v6 = objc_opt_respondsToSelector(v5, "shouldProceedToNextCommandAtSpeechSynthesisEnd");

  if ((v6 & 1) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController presentation](self, "presentation"));
    v8 = objc_msgSend(v7, "performSelector:", "shouldProceedToNextCommandAtSpeechSynthesisEnd");
    v9 = v8 != 0;

    v10 = (void *)AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
    {
      v11 = v10;
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController presentation](self, "presentation"));
      v13 = CFSTR("doesn't allow");
      v15 = 136315906;
      v16 = "-[SRSiriViewController _presentationAllowsRecordingActionCompletedForSpeechSynthesisCommand:]";
      v17 = 2112;
      v18 = v12;
      if (v8)
        v13 = CFSTR("allows");
      v19 = 2112;
      v20 = v13;
      v21 = 2112;
      v22 = v4;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%s #tts presentation:%@ %@ recording SAUISayIt=%@ completed", (uint8_t *)&v15, 0x2Au);

    }
  }
  else
  {
    v9 = 1;
  }

  return v9;
}

- (void)_interruptSuggestionsForSpeechRecognized:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
  v5 = objc_opt_respondsToSelector(v4, "didRecognizeUserInputForConversationStarterSuggestions:");

  if ((v5 & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
    objc_msgSend(v6, "didRecognizeUserInputForConversationStarterSuggestions:", v7);

  }
}

- (void)_showStarterSuggestionsIfTwoShot
{
  void *v3;
  char v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
  v4 = objc_opt_respondsToSelector(v3, "didRecognizeTwoShotSignalForConversationStarterSuggestions");

  if ((v4 & 1) != 0)
  {
    v5 = (id)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
    objc_msgSend(v5, "didRecognizeTwoShotSignalForConversationStarterSuggestions");

  }
}

- (void)_synthesizeSpeechWithText:(id)a3 identifier:(id)a4 sessionId:(id)a5 isPhonetic:(BOOL)a6 provisionally:(BOOL)a7 completion:(id)a8
{
  _BOOL8 v10;
  id v14;
  Block_layout *v15;
  id v16;
  id v17;
  Block_layout *v18;
  NSObject *v19;
  uint64_t v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  id v24;

  v10 = a6;
  v14 = a3;
  if (a8)
    v15 = (Block_layout *)a8;
  else
    v15 = &stru_100123508;
  v16 = a5;
  v17 = a4;
  v18 = objc_retainBlock(v15);
  v19 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v22 = "-[SRSiriViewController _synthesizeSpeechWithText:identifier:sessionId:isPhonetic:provisionally:completion:]";
    v23 = 2112;
    v24 = v14;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%s #tts Enqueueing text=\"%@\", buf, 0x16u);
  }
  *(_WORD *)((char *)&v20 + 1) = 256;
  LOBYTE(v20) = a7;
  -[SRUIFSpeechSynthesizer enqueueText:identifier:sessionId:language:gender:isPhonetic:provisionally:eligibleAfterDuration:delayed:canUseServerTTS:preparationIdentifier:completion:analyticsContext:speakableContextInfo:](self->_ttsManager, "enqueueText:identifier:sessionId:language:gender:isPhonetic:provisionally:eligibleAfterDuration:delayed:canUseServerTTS:preparationIdentifier:completion:analyticsContext:speakableContextInfo:", v14, v17, v16, 0, 0, v10, 0.4, v20, 0, v18, 0, 0);

}

- (void)_synthesizePhoneticText:(id)a3 identifier:(id)a4 sessionId:(id)a5 completion:(id)a6
{
  -[SRSiriViewController _synthesizeSpeechWithText:identifier:sessionId:isPhonetic:provisionally:completion:](self, "_synthesizeSpeechWithText:identifier:sessionId:isPhonetic:provisionally:completion:", a3, a4, a5, 1, 0, a6);
}

- (void)_synthesizeProvisionalText:(id)a3 identifier:(id)a4 sessionId:(id)a5 completion:(id)a6
{
  -[SRSiriViewController _synthesizeSpeechWithText:identifier:sessionId:isPhonetic:provisionally:completion:](self, "_synthesizeSpeechWithText:identifier:sessionId:isPhonetic:provisionally:completion:", a3, a4, a5, 0, 1, a6);
}

- (void)_synthesizeText:(id)a3 identifier:(id)a4 sessionId:(id)a5 completion:(id)a6
{
  -[SRSiriViewController _synthesizeSpeechWithText:identifier:sessionId:isPhonetic:provisionally:completion:](self, "_synthesizeSpeechWithText:identifier:sessionId:isPhonetic:provisionally:completion:", a3, a4, a5, 0, 0, a6);
}

- (void)_cancelSpeechSynthesis
{
  NSObject *v3;
  int v4;
  const char *v5;

  v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315138;
    v5 = "-[SRSiriViewController _cancelSpeechSynthesis]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v4, 0xCu);
  }
  -[SRUIFSpeechSynthesizer cancel](self->_ttsManager, "cancel");
  -[SRSiriViewController notifyClientStateManagerSpeakingEnded:](self, "notifyClientStateManagerSpeakingEnded:", 0);
}

- (BOOL)_isSpeechSynthesisSpeaking
{
  return self->_synthesisIsSpeaking;
}

+ (id)_speechIdentifierForConversationItem:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "aceObject"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "aceId"));

  if (!v5)
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "aceCommandIdentifier"));

  return v5;
}

- (void)speechSynthesisGetPreparedTextForIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  NSMutableDictionary *synthesisPreparationDictionary;
  void (**v8)(id, _QWORD, uint64_t);
  void (**v9)(_QWORD, _QWORD);
  NSObject *v10;
  int v11;
  const char *v12;
  __int16 v13;
  id v14;

  v6 = a3;
  synthesisPreparationDictionary = self->_synthesisPreparationDictionary;
  v8 = (void (**)(id, _QWORD, uint64_t))a4;
  v9 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](synthesisPreparationDictionary, "objectForKey:", v6));
  v10 = AFSiriLogContextConnection;
  if (v9)
  {
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 136315394;
      v12 = "-[SRSiriViewController speechSynthesisGetPreparedTextForIdentifier:completion:]";
      v13 = 2112;
      v14 = v6;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s #tts 11 A Getting text for preparation identifier %@", (uint8_t *)&v11, 0x16u);
    }
    ((void (**)(_QWORD, void (**)(id, _QWORD, uint64_t)))v9)[2](v9, v8);
  }
  else
  {
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
      sub_10009ED68();
    v8[2](v8, 0, 1);
  }

  -[NSMutableDictionary removeObjectForKey:](self->_synthesisPreparationDictionary, "removeObjectForKey:", v6);
}

- (void)speechSynthesisDidStartSpeakingWithIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  char v7;
  void *v8;
  int v9;
  const char *v10;
  __int16 v11;
  id v12;

  v4 = a3;
  v5 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 136315394;
    v10 = "-[SRSiriViewController speechSynthesisDidStartSpeakingWithIdentifier:]";
    v11 = 2112;
    v12 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s #tts identifier=%@", (uint8_t *)&v9, 0x16u);
  }
  objc_msgSend(UIApp, "finishedIPTest:", SUICPPTTestNameSiriBringupToCarPlayMessageReading);
  self->_synthesisIsSpeaking = 1;
  self->_ttsSpokenForRequest = 1;
  -[SRSiriViewController _checkAndUpdateSiriIdleAndQuietStatusOrRescheduleIdleTimerIfNeeded](self, "_checkAndUpdateSiriIdleAndQuietStatusOrRescheduleIdleTimerIfNeeded");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
  v7 = objc_opt_respondsToSelector(v6, "siriDidStartSpeakingWithIdentifier:");

  if ((v7 & 1) != 0)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
    objc_msgSend(v8, "siriDidStartSpeakingWithIdentifier:", v4);

  }
}

- (void)speechSynthesisDidStopSpeakingWithIdentifier:(id)a3 queueIsEmpty:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  NSObject *v7;
  void *v8;
  char v9;
  void *v10;
  NSObject *v11;
  AFQueue *v12;
  id v13;
  id v14;
  uint64_t v15;
  void *i;
  AFQueue *ttsDelayedBlocks;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t v22[128];
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  id v26;
  __int16 v27;
  _BOOL4 v28;

  v4 = a4;
  v6 = a3;
  v7 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v24 = "-[SRSiriViewController speechSynthesisDidStopSpeakingWithIdentifier:queueIsEmpty:]";
    v25 = 2112;
    v26 = v6;
    v27 = 1024;
    v28 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s #tts #punchout 6 identifier=%@ queueIsEmpty=%i", buf, 0x1Cu);
  }
  self->_synthesisIsSpeaking = 0;
  if (v4 && self->_enqueuedSuggestion)
    -[SRSiriViewController _speakEnqueuedSpokenSuggestion](self, "_speakEnqueuedSpokenSuggestion");
  -[SRSiriViewController _checkAndUpdateSiriIdleAndQuietStatusOrRescheduleIdleTimerIfNeeded](self, "_checkAndUpdateSiriIdleAndQuietStatusOrRescheduleIdleTimerIfNeeded");
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
  v9 = objc_opt_respondsToSelector(v8, "siriDidStopSpeakingWithIdentifier:speechQueueIsEmpty:");

  if ((v9 & 1) != 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
    objc_msgSend(v10, "siriDidStopSpeakingWithIdentifier:speechQueueIsEmpty:", v6, v4);

  }
  if (v4 && self->_ttsDelayedBlocks)
  {
    v11 = AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v24 = "-[SRSiriViewController speechSynthesisDidStopSpeakingWithIdentifier:queueIsEmpty:]";
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%s #punchout 7 executing _ttsDelayedBlocks", buf, 0xCu);
    }
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v12 = self->_ttsDelayedBlocks;
    v13 = -[AFQueue countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v14; i = (char *)i + 1)
        {
          if (*(_QWORD *)v19 != v15)
            objc_enumerationMutation(v12);
          (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i) + 16))(*(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i));
        }
        v14 = -[AFQueue countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v14);
    }

    ttsDelayedBlocks = self->_ttsDelayedBlocks;
    self->_ttsDelayedBlocks = 0;

  }
}

- (void)speechSynthesisDidFinish:(id)a3
{
  -[AFUISiriSession speechSynthesisDidFinish:](self->_session, "speechSynthesisDidFinish:", a3);
}

- (void)speechSynthesisDidUpdatePowerLevelTo:(float)a3
{
  -[AFUISiriSession speechSynthesisDidUpdatePowerLevelTo:](self->_session, "speechSynthesisDidUpdatePowerLevelTo:");
}

- (void)notifyClientStateManagerTransactionBegan:(id)a3
{
  -[AFUISiriSession notifyStateManagerTransactionBegan](self->_session, "notifyStateManagerTransactionBegan", a3);
}

- (void)notifyClientStateManagerTransactionEnded:(id)a3
{
  -[AFUISiriSession notifyStateManagerTransactionEnded](self->_session, "notifyStateManagerTransactionEnded", a3);
}

- (void)notifyClientStateManagerSpeakingBegan:(id)a3
{
  -[AFUISiriSession notifyStateManagerSpeakingBegan](self->_session, "notifyStateManagerSpeakingBegan", a3);
}

- (void)notifyClientStateManagerSpeakingEnded:(id)a3
{
  NSObject *v4;
  int v5;
  const char *v6;

  v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315138;
    v6 = "-[SRSiriViewController notifyClientStateManagerSpeakingEnded:]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s #tts", (uint8_t *)&v5, 0xCu);
  }
  -[AFUISiriSession notifyStateManagerSpeakingEnded](self->_session, "notifyStateManagerSpeakingEnded");
}

- (id)domainObjectForIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _domainObjectStorageConnection](self, "_domainObjectStorageConnection"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "absoluteString"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "domainObjectForKey:", v6));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[AceObject aceObjectWithDictionary:](AceObject, "aceObjectWithDictionary:", v7));

  return v8;
}

- (void)setDomainObject:(id)a3 forIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v6 = a4;
  v7 = a3;
  v10 = (id)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _domainObjectStorageConnection](self, "_domainObjectStorageConnection"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "dictionary"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "absoluteString"));
  objc_msgSend(v10, "setDomainObject:forKey:", v8, v9);

}

- (void)audioPlayerStartPlaying:(id)a3
{
  -[SRSiriViewController _setAudioPlayerIsPlaying:](self, "_setAudioPlayerIsPlaying:", 1);
  if (-[SRSiriViewController _usesEventDrivenIdleAndQuietUpdates](self, "_usesEventDrivenIdleAndQuietUpdates"))
    -[SRSiriViewController _checkAndUpdateSiriIdleAndQuietStatusIfNeeded](self, "_checkAndUpdateSiriIdleAndQuietStatusIfNeeded");
}

- (void)audioPlayer:(id)a3 didFinishPlayback:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a3;
  v6 = a4;
  -[SRSiriViewController _setAudioPlayerIsPlaying:](self, "_setAudioPlayerIsPlaying:", 0);
  if (-[SRSiriViewController _usesEventDrivenIdleAndQuietUpdates](self, "_usesEventDrivenIdleAndQuietUpdates"))
    -[SRSiriViewController _checkAndUpdateSiriIdleAndQuietStatusIfNeeded](self, "_checkAndUpdateSiriIdleAndQuietStatusIfNeeded");
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _session](self, "_session"));
  objc_msgSend(v7, "forceAudioSessionActive");

  objc_opt_class(SABaseClientBoundCommand, v8);
  if ((objc_opt_isKindOfClass(v6, v9) & 1) != 0)
  {
    -[SRSiriViewController _didCompleteActionForAceCommand:success:](self, "_didCompleteActionForAceCommand:success:", v6, 1);
  }
  else
  {
    objc_opt_class(SAUISnippet, v10);
    if ((objc_opt_isKindOfClass(v6, v11) & 1) != 0)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _activeConversation](self, "_activeConversation"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "conversationItemIdentifier"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "itemWithIdentifier:", v13));

      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "aceCommandIdentifier"));
      if (v15)
      {
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _aceCommandWithIdentifier:](self, "_aceCommandWithIdentifier:", v15));
        -[SRSiriViewController _didCompleteActionForAceCommand:success:](self, "_didCompleteActionForAceCommand:success:", v16, 1);
        objc_msgSend(v17, "setConversationItemIdentifier:", 0);

      }
    }
  }

}

- (id)audioPlayer:(id)a3 audioURLForCommand:(id)a4
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  char isKindOfClass;
  void *v15;
  unsigned __int8 v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  v4 = a4;
  objc_opt_class(SASmsPlayAudio, v5);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "message"));
    if (!v8)
      goto LABEL_16;
  }
  else
  {
    objc_opt_class(SAUISnippet, v7);
    if ((objc_opt_isKindOfClass(v4, v9) & 1) == 0)
    {
      v8 = 0;
LABEL_16:
      v19 = 0;
      goto LABEL_19;
    }
    v10 = v4;
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "context"));
    objc_opt_class(SASmsSms, v12);
    isKindOfClass = objc_opt_isKindOfClass(v11, v13);

    if ((isKindOfClass & 1) != 0)
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "context"));
    else
      v8 = 0;

    if (!v8)
      goto LABEL_16;
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "messageType"));
  v16 = objc_msgSend(v15, "isEqualToString:", SASmsSmsMessageTypeAudioMessageValue);

  if ((v16 & 1) == 0)
  {
    v20 = AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
      sub_10009EDD4(v20, v21, v22, v23, v24, v25, v26, v27);
    goto LABEL_16;
  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[SiriUISnippetManager sharedInstance](SiriUISnippetManager, "sharedInstance"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "speakableProviderForObject:", v8));

  if (v18 && (objc_opt_respondsToSelector(v18, "attachmentURLForExpression:") & 1) != 0)
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "attachmentURLForExpression:", SASmsSmsDeferredMessageKeyValue));
  else
    v19 = 0;

LABEL_19:
  return v19;
}

- (void)aceCommandRecords:(id)a3 didChangeResultForCommand:(id)a4 completion:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a5;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _session](self, "_session"));
  v9 = v8;
  if (v10)
    objc_msgSend(v8, "resultDidChangeForAceCommand:completion:", v7, v10);
  else
    objc_msgSend(v8, "resultDidChangeForAceCommand:", v7);

}

- (void)siriSessionRequestsToShowAssetsDownloadNotificationPrompt
{
  -[SRSiriViewController _shouldShowDownloadAssetsNotificationPrompt:](self, "_shouldShowDownloadAssetsNotificationPrompt:", 1);
}

- (void)siriSessionWillProcessAceCommand:(id)a3
{
  __objc2_class *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  if ((_os_feature_enabled_impl("ResponseFramework", "Enabled") & 1) != 0)
    v4 = (__objc2_class *)MDDialogTransformer;
  else
    v4 = SRModeDialogTransformer;
  if ((-[__objc2_class supportsTransformationForAceCommand:](v4, "supportsTransformationForAceCommand:", v7) & 1) == 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _analytics](self, "_analytics"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _instrumentationManager](self, "_instrumentationManager"));
    objc_msgSend(v5, "logClientFeedbackPresented:dialogIdentifierProvider:", v7, v6);

  }
}

- (void)siriSessionResultForAceCommand:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  id v9;
  id v10;

  v7 = a4;
  v8 = a3;
  v10 = (id)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _aceCommandRecords](self, "_aceCommandRecords"));
  v9 = objc_msgSend(v10, "resultForAceCommand:", v8);

  (*((void (**)(id, id))a4 + 2))(v7, v9);
}

- (void)siriSessionWillStartRequestWithOptions:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  id v8;
  _BOOL8 v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  _BOOL4 ttsSpokenForRequest;
  uint64_t v18;
  void *v19;
  NSObject *v20;
  int v21;
  const char *v22;
  __int16 v23;
  void *v24;

  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  v8 = v6;
  if (objc_msgSend(v8, "acousticIdEnabled"))
    v9 = -[SRSiriViewController _isAcousticIdAllowed](self, "_isAcousticIdAllowed");
  else
    v9 = 0;
  objc_msgSend(v8, "setAcousticIdEnabled:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
  v11 = objc_opt_respondsToSelector(v10, "configureOptionsForImminentRequest:");

  v12 = v8;
  if ((v11 & 1) != 0)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "configureOptionsForImminentRequest:", v8));

  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "requestInfo"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "speechRequestOptions"));

  if (objc_msgSend(v15, "activationEvent") == (id)5)
  {
    v16 = AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
    {
      ttsSpokenForRequest = self->_ttsSpokenForRequest;
      v21 = 136315394;
      v22 = "-[SRSiriViewController siriSessionWillStartRequestWithOptions:completion:]";
      v23 = 1024;
      LODWORD(v24) = ttsSpokenForRequest;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%s ttsSpokenForRequest: %d", (uint8_t *)&v21, 0x12u);
    }
    if (self->_ttsSpokenForRequest)
      v18 = 1;
    else
      v18 = 3;
    objc_msgSend(v15, "setPresentationMode:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "requestInfo"));
    objc_msgSend(v19, "setSpeechRequestOptions:", v15);

  }
  if (objc_msgSend(v12, "requestSource") == (id)42)
    -[SRSiriViewController _setWaitingForStartRequest:](self, "_setWaitingForStartRequest:", 1);
  -[SRModeProvider setRequestOptions:](self->_modeProvider, "setRequestOptions:", v12);
  v20 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    v21 = 136315394;
    v22 = "-[SRSiriViewController siriSessionWillStartRequestWithOptions:completion:]";
    v23 = 2112;
    v24 = v12;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "%s Modified options:%@", (uint8_t *)&v21, 0x16u);
  }
  if (v7)
    v7[2](v7, v12);

}

- (void)_updateKeyboardStateWithError:(id)a3
{
  _BOOL4 lastMinimized;
  uint64_t v5;
  uint64_t v6;
  unsigned int v7;
  _BOOL4 v9;
  void *v10;
  char v11;
  void *v12;
  unsigned int v13;
  id v14;

  v14 = a3;
  lastMinimized = self->_lastMinimized;
  if (-[SRSiriViewController _siriIsShowingPasscodeUnlock](self, "_siriIsShowingPasscodeUnlock"))
  {
    v5 = 0;
    v6 = lastMinimized;
    goto LABEL_24;
  }
  if (-[SASRequestOptions requestSource](self->_requestOptions, "requestSource") == (id)20)
  {
    v5 = 1;
    v6 = 1;
    goto LABEL_24;
  }
  if (-[SASRequestOptions inputType](self->_requestOptions, "inputType") == (id)2)
  {
    if (!self->_keyboardEnabled)
    {
      v5 = 0;
      v6 = 0;
      goto LABEL_24;
    }
    v6 = +[UIKeyboard isInHardwareKeyboardMode](UIKeyboard, "isInHardwareKeyboardMode") ^ 1;
  }
  else if (-[SASRequestOptions requestSource](self->_requestOptions, "requestSource") == (id)23)
  {
    if (self->_keyboardEnabled)
      v7 = +[UIKeyboard isInHardwareKeyboardMode](UIKeyboard, "isInHardwareKeyboardMode") ^ 1;
    else
      v7 = 0;
    v9 = objc_msgSend(v14, "code") != (id)207 && objc_msgSend(v14, "code") != (id)203;
    v6 = v9 & v7;
  }
  else
  {
    v6 = lastMinimized || self->_requestOptions == 0;
  }
  v5 = 1;
LABEL_24:
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
  v11 = objc_opt_respondsToSelector(v10, "currentSnippetContainsFooterButtons");

  if ((v11 & 1) != 0)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
    v13 = objc_msgSend(v12, "currentSnippetContainsFooterButtons");

    v6 = v13 | v6;
  }
  -[SRSiriViewController _updateKeyboardState:minimized:](self, "_updateKeyboardState:minimized:", v5, v6);

}

- (void)siriSessionWillStartRequest
{
  _TtC4Siri16SiriUISuggestion *enqueuedSuggestion;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  NSObject *v10;
  NSObject *v11;
  AIMLExperimentationAnalyticsManager *manager;
  id v13;
  id v14;
  NSObject *v15;
  SRCarInvocationSourceInstrumentationSender *v16;
  void *v17;
  unint64_t v18;
  void *v19;
  int v20;
  const char *v21;

  enqueuedSuggestion = self->_enqueuedSuggestion;
  self->_enqueuedSuggestion = 0;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _requestOptions](self, "_requestOptions"));
  v5 = objc_msgSend(v4, "inputType");

  if (v5 == (id)2)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _host](self, "_host"));
    objc_msgSend(v6, "serviceDidRequestKeyboard:", 0);

  }
  if (-[SRSiriViewController _isSpeechSynthesisSpeaking](self, "_isSpeechSynthesisSpeaking"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _instrumentationManager](self, "_instrumentationManager"));
    objc_msgSend(v7, "emitUserBargeInEventForBargedInTurn");

  }
  -[SRSiriViewController _setRequestActive:](self, "_setRequestActive:", 1);
  -[SRSiriViewController _setWaitingForStartRequest:](self, "_setWaitingForStartRequest:", 0);
  -[SRSiriViewController _reflectionDialogHasBeenPlayed:](self, "_reflectionDialogHasBeenPlayed:", 0);
  -[SRSiriViewController _checkAndUpdateSiriIdleAndQuietStatusOrRescheduleIdleTimerIfNeeded](self, "_checkAndUpdateSiriIdleAndQuietStatusOrRescheduleIdleTimerIfNeeded");
  self->_delaySessionEndForInPlacePunchout = 0;
  self->_keyboardEnabled = 1;
  -[SRSiriViewController _setKeyboardLoweredAfterResponse:](self, "_setKeyboardLoweredAfterResponse:", 0);
  -[SRSiriViewController _setListenAfterSpeakingForRequestFinished:](self, "_setListenAfterSpeakingForRequestFinished:", 0);
  -[SRSiriViewController _cancelSpeechSynthesis](self, "_cancelSpeechSynthesis");
  if (-[SRSiriViewController _isUserUtteranceTapToEditInProgress](self, "_isUserUtteranceTapToEditInProgress"))
    -[SASRequestOptions setRequestSource:](self->_requestOptions, "setRequestSource:", 32);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
  v9 = objc_opt_respondsToSelector(v8, "siriRequestWillStartWithRequestOptions:");

  if ((v9 & 1) != 0)
  {
    if ((-[SASRequestOptions isForBluetoothCar](self->_requestOptions, "isForBluetoothCar") & 1) != 0
      || -[SASRequestOptions isForEyesFree](self->_requestOptions, "isForEyesFree"))
    {
      v10 = AFSiriLogContextConnection;
      if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
      {
        v20 = 136315138;
        v21 = "-[SRSiriViewController siriSessionWillStartRequest]";
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s This is either a bluetooth car request or an eyes free request", (uint8_t *)&v20, 0xCu);
      }
      v11 = AFSiriLogContextConnection;
      if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
      {
        v20 = 136315138;
        v21 = "-[SRSiriViewController siriSessionWillStartRequest]";
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%s Emitting Trial Experimentation Analytics for A2DP / HFP experiment", (uint8_t *)&v20, 0xCu);
      }
      manager = self->_manager;
      v13 = objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDString:", CFSTR("dec00f3a-a3a4-4777-8e7a-6cdba66bfb3e"));
      v14 = objc_alloc_init((Class)NSUUID);
      -[AIMLExperimentationAnalyticsManager emitTriggerForCodePathID:requestID:completionHandler:](manager, "emitTriggerForCodePathID:requestID:completionHandler:", v13, v14, &stru_100123528);

      v15 = AFSiriLogContextConnection;
      if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
      {
        v20 = 136315138;
        v21 = "-[SRSiriViewController siriSessionWillStartRequest]";
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%s Emitting BT Car InvocationContext", (uint8_t *)&v20, 0xCu);
      }
      v16 = objc_alloc_init(SRCarInvocationSourceInstrumentationSender);
      -[SRCarInvocationSourceInstrumentationSender sendBTCarInvocationContext](v16, "sendBTCarInvocationContext");

    }
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
    objc_msgSend(v17, "siriRequestWillStartWithRequestOptions:", self->_requestOptions);

  }
  v18 = (unint64_t)-[SASRequestOptions requestSource](self->_requestOptions, "requestSource");
  if (v18 == 50)
  {
    -[SRSiriViewController _insertUserUtteranceViewForSuggestion:](self, "_insertUserUtteranceViewForSuggestion:", self->_requestText);
  }
  else if (v18 == 23)
  {
    -[SRSiriViewController _insertUserUtteranceViewForText:](self, "_insertUserUtteranceViewForText:", self->_requestText);
  }
  else if ((v18 & 0xFFFFFFFFFFFFFFFELL) == 0x18)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[SASRequestOptions text](self->_requestOptions, "text"));
    -[SRSiriViewController _insertUserUtteranceViewForText:](self, "_insertUserUtteranceViewForText:", v19);

  }
}

- (void)siriSessionWillStartUIRequestWithText:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;

  v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init((Class)SAUIUserUtteranceView);
  objc_msgSend(v8, "setText:", v7);

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "UUIDString"));
  objc_msgSend(v8, "setAceId:", v10);

  v11 = objc_alloc_init((Class)SAUIAddViews);
  v18 = v8;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v18, 1));
  objc_msgSend(v11, "setViews:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "UUIDString"));
  objc_msgSend(v11, "setAceId:", v14);

  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100043B9C;
  v16[3] = &unk_100123550;
  v17 = v6;
  v15 = v6;
  -[SRSiriViewController siriSessionDidReceiveAddViewsCommand:completion:](self, "siriSessionDidReceiveAddViewsCommand:completion:", v11, v16);

}

- (void)siriSessionWillCancelRequest
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;

  -[SRSiriViewController _setListenAfterSpeakingForRequestFinished:](self, "_setListenAfterSpeakingForRequestFinished:", 0);
  -[SRSiriViewController _cancelSpeechSynthesis](self, "_cancelSpeechSynthesis");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _utteranceToSpeakAfterClearScreenCommand](self, "_utteranceToSpeakAfterClearScreenCommand"));
  v4 = objc_msgSend(v3, "length");

  if (v4)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[AFSpeakableUtteranceParser sruif_speakableUtteranceParserForCurrentLanguage](AFSpeakableUtteranceParser, "sruif_speakableUtteranceParserForCurrentLanguage"));
    objc_msgSend(v7, "setHandleTTSCodes:", 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _utteranceToSpeakAfterClearScreenCommand](self, "_utteranceToSpeakAfterClearScreenCommand"));
    LOBYTE(v6) = 1;
    -[SRSiriViewController _speakText:identifier:sessionId:preferredVoice:provisionally:eligibleAfterDuration:delayed:canUseServerTTS:speakableUtteranceParser:analyticsContext:speakableContextInfo:preparation:completion:](self, "_speakText:identifier:sessionId:preferredVoice:provisionally:eligibleAfterDuration:delayed:canUseServerTTS:speakableUtteranceParser:analyticsContext:speakableContextInfo:preparation:completion:", v5, 0, 0, 0, 0, 0, 0.0, v6, v7, 0, 0, 0, 0);

    -[SRSiriViewController _setUtteranceToSpeakAfterClearScreenCommand:](self, "_setUtteranceToSpeakAfterClearScreenCommand:", 0);
  }
}

- (void)siriSessionAudioRecordingDidChangePowerLevel:(float)a3
{
  double v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
  if ((objc_opt_respondsToSelector(v5, "siriAudioRecordingDidChangePowerLevel:") & 1) != 0)
  {
    *(float *)&v4 = a3;
    objc_msgSend(v5, "siriAudioRecordingDidChangePowerLevel:", v4);
  }

}

- (void)siriSessionAudioRecordingDidChangePowerLevel:(float)a3 peakLevel:(float)a4
{
  double v7;
  double v8;
  id v9;

  -[SRSiriViewController siriSessionAudioRecordingDidChangePowerLevel:](self, "siriSessionAudioRecordingDidChangePowerLevel:");
  v9 = (id)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
  if ((objc_opt_respondsToSelector(v9, "siriAudioRecordingDidChangePowerLevel:peakLevel:") & 1) != 0)
  {
    *(float *)&v7 = a3;
    *(float *)&v8 = a4;
    objc_msgSend(v9, "siriAudioRecordingDidChangePowerLevel:peakLevel:", v7, v8);
  }

}

- (void)siriSessionDidFinishRequestWithError:(id)a3
{
  __CFString *v4;
  NSObject *v5;
  const __CFString *v6;
  NSString *requestText;
  BOOL listenAfterSpeakingForRequestFinished;
  _QWORD v9[4];
  id v10;
  BOOL v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  const __CFString *v15;

  v4 = (__CFString *)a3;
  v5 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    v6 = CFSTR("success");
    if (v4)
      v6 = v4;
    *(_DWORD *)buf = 136315394;
    v13 = "-[SRSiriViewController siriSessionDidFinishRequestWithError:]";
    v14 = 2112;
    v15 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s #session %@", buf, 0x16u);
  }
  if (-[SRSiriViewController textInputEnabled](self, "textInputEnabled")
    && -[SRSiriViewController _isRequestActive](self, "_isRequestActive")
    && !-[SRSiriViewController _isUserUtteranceTapToEditInProgress](self, "_isUserUtteranceTapToEditInProgress"))
  {
    -[SRSiriViewController _updateKeyboardStateWithError:](self, "_updateKeyboardStateWithError:", v4);
    requestText = self->_requestText;
    self->_requestText = (NSString *)&stru_100125588;

  }
  listenAfterSpeakingForRequestFinished = self->_listenAfterSpeakingForRequestFinished;
  -[SRSiriViewController _setListenAfterSpeakingForRequestFinished:](self, "_setListenAfterSpeakingForRequestFinished:", 0);
  objc_initWeak((id *)buf, self);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100043F2C;
  v9[3] = &unk_100123578;
  v11 = listenAfterSpeakingForRequestFinished;
  objc_copyWeak(&v10, (id *)buf);
  -[SRSiriViewController _handleRequestError:completion:](self, "_handleRequestError:completion:", v4, v9);
  objc_destroyWeak(&v10);
  objc_destroyWeak((id *)buf);

}

- (void)siriSessionDidTransitionFromState:(int64_t)a3 toState:(int64_t)a4 event:(int64_t)a5 machAbsoluteTransitionTime:(double)a6
{
  void *v11;
  void ***v12;
  void ***v13;
  NSMutableArray *instrumentationStateTransitionsPendingInitialTurn;
  NSMutableArray *v15;
  NSMutableArray *v16;
  void ***v17;
  int64_t v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  uint64_t Description;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  char v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void **v34;
  uint64_t v35;
  void (*v36)(uint64_t);
  void *v37;
  id v38[4];
  _BYTE location[12];
  __int16 v40;
  void *v41;
  __int16 v42;
  void *v43;
  __int16 v44;
  void *v45;

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _instrumentationManager](self, "_instrumentationManager"));
  objc_msgSend(v11, "processSessionEvent:isSpeechSynthesisSpeaking:machAbsoluteTime:", a5, -[SRSiriViewController _isSpeechSynthesisSpeaking](self, "_isSpeechSynthesisSpeaking"), a6);

  if (a4 != a3)
  {
    objc_initWeak((id *)location, self);
    v34 = _NSConcreteStackBlock;
    v35 = 3221225472;
    v36 = sub_1000443E8;
    v37 = &unk_1001235A0;
    objc_copyWeak(v38, (id *)location);
    v38[1] = (id)a3;
    v38[2] = (id)a4;
    v38[3] = *(id *)&a6;
    v12 = objc_retainBlock(&v34);
    v13 = v12;
    if (self->_initialInstrumentationTurnReceieved)
    {
      ((void (*)(void ***))v12[2])(v12);
    }
    else
    {
      instrumentationStateTransitionsPendingInitialTurn = self->_instrumentationStateTransitionsPendingInitialTurn;
      if (!instrumentationStateTransitionsPendingInitialTurn)
      {
        v15 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array", v34, v35, v36, v37));
        v16 = self->_instrumentationStateTransitionsPendingInitialTurn;
        self->_instrumentationStateTransitionsPendingInitialTurn = v15;

        instrumentationStateTransitionsPendingInitialTurn = self->_instrumentationStateTransitionsPendingInitialTurn;
      }
      v17 = objc_retainBlock(v13);
      -[NSMutableArray addObject:](instrumentationStateTransitionsPendingInitialTurn, "addObject:", v17);

    }
    objc_destroyWeak(v38);
    objc_destroyWeak((id *)location);
  }
  if ((unint64_t)(a4 - 1) > 3)
    v18 = 0;
  else
    v18 = qword_1000C0D38[a4 - 1];
  self->_siriState = v18;
  -[SRSiriViewController _checkAndUpdateSiriIdleAndQuietStatusOrRescheduleIdleTimerIfNeeded](self, "_checkAndUpdateSiriIdleAndQuietStatusOrRescheduleIdleTimerIfNeeded", v34, v35, v36, v37);
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _voicemailPlayer](self, "_voicemailPlayer"));
  objc_msgSend(v19, "stopPlaying");

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _audioMessagePlayer](self, "_audioMessagePlayer"));
  objc_msgSend(v20, "stopPlaying");

  v21 = (void *)AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    v22 = v21;
    Description = SRUIFSiriSessionStateGetDescription(a3);
    v24 = (void *)objc_claimAutoreleasedReturnValue(Description);
    v25 = SRUIFSiriSessionStateGetDescription(a4);
    v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
    v27 = SRUIFSiriSessionEventGetDescription(a5);
    v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
    *(_DWORD *)location = 136315906;
    *(_QWORD *)&location[4] = "-[SRSiriViewController siriSessionDidTransitionFromState:toState:event:machAbsoluteTransitionTime:]";
    v40 = 2112;
    v41 = v24;
    v42 = 2112;
    v43 = v26;
    v44 = 2112;
    v45 = v28;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "%s #state changing fromState: %@ toState: %@, event: %@", location, 0x2Au);

  }
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
  v30 = objc_opt_respondsToSelector(v29, "siriDidTransitionFromState:event:");

  if ((v30 & 1) != 0)
  {
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
    v32 = v31;
    if ((unint64_t)(a3 - 1) > 3)
      v33 = 0;
    else
      v33 = qword_1000C0D38[a3 - 1];
    objc_msgSend(v31, "siriDidTransitionFromState:event:", v33, sub_10004452C((uint64_t)v31, a5));

  }
}

- (void)siriSessionDidStartNewTurn:(id)a3
{
  id v4;

  v4 = a3;
  -[SRSiriViewController siriSessionDidStartNewTurn:associatedLaunchStartContext:machAbsoluteTime:linkPreviousTurn:](self, "siriSessionDidStartNewTurn:associatedLaunchStartContext:machAbsoluteTime:linkPreviousTurn:", v4, 0, 0, (double)mach_absolute_time());

}

- (void)siriSessionDidStartNewTurn:(id)a3 associatedLaunchStartContext:(id)a4 machAbsoluteTime:(double)a5 linkPreviousTurn:(BOOL)a6
{
  _BOOL4 v6;
  id v10;
  id v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  id v24;
  uint64_t Bytes;
  void *v26;
  void *v27;
  void *v28;
  NSMutableArray *v29;
  id v30;
  id v31;
  uint64_t v32;
  void *v33;
  NSMutableArray *instrumentationStateTransitionsPendingInitialTurn;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint8_t v39[128];
  uint8_t buf[4];
  const char *v41;
  __int16 v42;
  void *v43;
  __int16 v44;
  void *v45;

  v6 = a6;
  v10 = a3;
  v11 = a4;
  v12 = (void *)AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    v13 = v12;
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _session](self, "_session"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "turnIdentifier"));
    *(_DWORD *)buf = 136315650;
    v41 = "-[SRSiriViewController siriSessionDidStartNewTurn:associatedLaunchStartContext:machAbsoluteTime:linkPreviousTurn:]";
    v42 = 2112;
    v43 = v14;
    v44 = 2112;
    v45 = v15;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%s #instrumentation %@ indicates a new turn %@ has started", buf, 0x20u);

  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _instrumentationManager](self, "_instrumentationManager"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "currentInstrumentationTurnContext"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "turnIdentifier"));

  v19 = (void *)objc_claimAutoreleasedReturnValue(+[SRUIFInstrumentationManager sharedManager](SRUIFInstrumentationManager, "sharedManager"));
  objc_msgSend(v19, "storeCurrentInstrumentationTurnContext:", v10);

  if (v11)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _instrumentationManager](self, "_instrumentationManager"));
    objc_msgSend(v20, "emitInstrumentation:atTime:", v11, (unint64_t)a5);

  }
  if (v6)
  {
    v21 = (void *)AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
    {
      v22 = v21;
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "turnIdentifier"));
      *(_DWORD *)buf = 136315650;
      v41 = "-[SRSiriViewController siriSessionDidStartNewTurn:associatedLaunchStartContext:machAbsoluteTime:linkPreviousTurn:]";
      v42 = 2112;
      v43 = v18;
      v44 = 2112;
      v45 = v23;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "%s #instrumentation linking previous turn %@ with the new turn %@", buf, 0x20u);

    }
    v24 = objc_alloc_init((Class)SISchemaConversationTrace);
    if (v18)
    {
      Bytes = AFTurnIdentifierGetBytes(v18);
      v26 = (void *)objc_claimAutoreleasedReturnValue(Bytes);
    }
    else
    {
      v27 = (void *)AFSiriLogContextConnection;
      if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
        sub_10009EE44(v27);
      v26 = 0;
    }
    objc_msgSend(v24, "setPreviousTurnID:", v26);
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _instrumentationManager](self, "_instrumentationManager"));
    objc_msgSend(v28, "emitInstrumentation:", v24);

  }
  self->_initialInstrumentationTurnReceieved = 1;
  if (-[NSMutableArray count](self->_instrumentationStateTransitionsPendingInitialTurn, "count"))
  {
    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    v29 = self->_instrumentationStateTransitionsPendingInitialTurn;
    v30 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v29, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
    if (v30)
    {
      v31 = v30;
      v32 = *(_QWORD *)v36;
      do
      {
        v33 = 0;
        do
        {
          if (*(_QWORD *)v36 != v32)
            objc_enumerationMutation(v29);
          (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * (_QWORD)v33) + 16))(*(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * (_QWORD)v33));
          v33 = (char *)v33 + 1;
        }
        while (v31 != v33);
        v31 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v29, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
      }
      while (v31);
    }

    instrumentationStateTransitionsPendingInitialTurn = self->_instrumentationStateTransitionsPendingInitialTurn;
    self->_instrumentationStateTransitionsPendingInitialTurn = 0;

  }
}

- (void)siriSessionRequestsInstrumentingMessage:(id)a3 machAbsoluteTime:(double)a4
{
  id v6;
  id v7;

  v6 = a3;
  v7 = (id)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _instrumentationManager](self, "_instrumentationManager"));
  objc_msgSend(v7, "emitInstrumentation:atTime:", v6, (unint64_t)a4);

}

- (void)siriSessionGetRequestContextWithCompletionHandler:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void (**v8)(id, void *);

  v8 = (void (**)(id, void *))a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
  v5 = objc_opt_respondsToSelector(v4, "requestContext");

  if ((v5 & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "requestContext"));

  }
  else
  {
    v7 = 0;
  }
  v8[2](v8, v7);

}

- (void)siriSessionDidChangeNetworkAvailability
{
  void *v3;
  char v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
  v4 = objc_opt_respondsToSelector(v3, "siriNetworkAvailabilityDidChange");

  if ((v4 & 1) != 0)
  {
    v5 = (id)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
    objc_msgSend(v5, "siriNetworkAvailabilityDidChange");

  }
}

- (void)siriSessionDidChangeLockState:(unint64_t)a3
{
  NSObject *v5;
  unint64_t lockState;
  _BOOL4 v7;
  id v8;
  void *v9;
  _QWORD block[5];
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  unint64_t v14;
  __int16 v15;
  unint64_t v16;

  v5 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    lockState = self->_lockState;
    *(_DWORD *)buf = 136315650;
    v12 = "-[SRSiriViewController siriSessionDidChangeLockState:]";
    v13 = 2048;
    v14 = lockState;
    v15 = 2048;
    v16 = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s old lockState=%zd, new lockState=%zd", buf, 0x20u);
  }
  v7 = self->_lockState == 0;
  self->_lockState = a3;
  if ((((a3 != 0) ^ v7) & 1) == 0)
  {
    v8 = objc_alloc_init((Class)SISchemaDeviceLockStateChanged);
    objc_msgSend(v8, "setIsDeviceLocked:", a3 != 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _instrumentationManager](self, "_instrumentationManager"));
    objc_msgSend(v9, "emitInstrumentation:", v8);

  }
  if (!a3)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100044C08;
    block[3] = &unk_1001225C0;
    block[4] = self;
    if (qword_1001503C0 != -1)
      dispatch_once(&qword_1001503C0, block);
  }
}

- (void)siriSessionDidReceiveOpenLinkCommand:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  unsigned int v13;
  NSObject *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  _QWORD v18[4];
  id v19;
  id v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  void *v24;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "ref"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "scheme"));
  if (!objc_msgSend(v9, "caseInsensitiveCompare:", CFSTR("prefs"))
    || !objc_msgSend(v9, "caseInsensitiveCompare:", CFSTR("audio-player-event")))
  {
    goto LABEL_16;
  }
  if (!objc_msgSend(v9, "caseInsensitiveCompare:", CFSTR("http"))
    || !objc_msgSend(v9, "caseInsensitiveCompare:", CFSTR("https")))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "host"));
    if (objc_msgSend(v10, "caseInsensitiveCompare:", CFSTR("apple.com")))
    {
      v11 = objc_msgSend(v10, "rangeOfString:options:", CFSTR(".apple.com"), 13);

      if (v11 == (id)0x7FFFFFFFFFFFFFFFLL)
        goto LABEL_7;
    }
    else
    {

    }
LABEL_16:
    v17 = AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v22 = "-[SRSiriViewController siriSessionDidReceiveOpenLinkCommand:completion:]";
      v23 = 2112;
      v24 = v8;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%s Opening URL:%@", buf, 0x16u);
    }
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_100044F18;
    v18[3] = &unk_1001235C8;
    v20 = v7;
    v19 = v6;
    -[SRSiriViewController _openURL:bundleId:inPlace:conversationId:completion:](self, "_openURL:bundleId:inPlace:conversationId:completion:", v8, 0, 0, 0, v18);

    v16 = v20;
    goto LABEL_19;
  }
LABEL_7:
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
  if ((objc_opt_respondsToSelector(v12, "trustsURL:") & 1) != 0)
  {
    v13 = objc_msgSend(v12, "trustsURL:", v8);

    if (v13)
      goto LABEL_16;
  }
  else
  {

  }
  v14 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v22 = "-[SRSiriViewController siriSessionDidReceiveOpenLinkCommand:completion:]";
    v23 = 2112;
    v24 = v8;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%s Ignoring unsafe URL:%@", buf, 0x16u);
  }
  if (v7)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "aceId"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[SACommandFailed sruif_commandFailedWithRefId:](SACommandFailed, "sruif_commandFailedWithRefId:", v15));

    objc_msgSend(v16, "setReason:", CFSTR("Ignoring potentially unsafe URL"));
    (*((void (**)(id, void *))v7 + 2))(v7, v16);
LABEL_19:

  }
}

- (void)siriSessionOpenURL:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  _BOOL4 delaySessionEndForInPlacePunchout;
  NSObject *v9;
  const __CFString *v10;
  AFQueue *v11;
  AFQueue *ttsDelayedBlocks;
  AFQueue *v13;
  void ***v14;
  void **v15;
  uint64_t v16;
  void (*v17)(uint64_t);
  void *v18;
  id v19;
  id v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  const __CFString *v24;
  __int16 v25;
  id v26;

  v6 = a3;
  v7 = a4;
  delaySessionEndForInPlacePunchout = self->_delaySessionEndForInPlacePunchout;
  v9 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    v10 = CFSTR("Replace");
    *(_DWORD *)buf = 136315650;
    v22 = "-[SRSiriViewController siriSessionOpenURL:completionHandler:]";
    v23 = 2112;
    if (delaySessionEndForInPlacePunchout)
      v10 = CFSTR("InPlace");
    v24 = v10;
    v25 = 2112;
    v26 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s #punchout 1 Performing %@ punchout of URL: %@", buf, 0x20u);
  }
  -[SRSiriViewController _openURL:bundleId:inPlace:conversationId:completion:](self, "_openURL:bundleId:inPlace:conversationId:completion:", v6, 0, delaySessionEndForInPlacePunchout, 0, v7);
  if (delaySessionEndForInPlacePunchout)
  {
    if (!self->_ttsDelayedBlocks)
    {
      v11 = (AFQueue *)objc_alloc_init((Class)AFQueue);
      ttsDelayedBlocks = self->_ttsDelayedBlocks;
      self->_ttsDelayedBlocks = v11;

    }
    objc_initWeak((id *)buf, self);
    v13 = self->_ttsDelayedBlocks;
    v15 = _NSConcreteStackBlock;
    v16 = 3221225472;
    v17 = sub_1000451DC;
    v18 = &unk_100122660;
    objc_copyWeak(&v20, (id *)buf);
    v19 = v6;
    v14 = objc_retainBlock(&v15);
    -[AFQueue enqueueObject:](v13, "enqueueObject:", v14, v15, v16, v17, v18);

    objc_destroyWeak(&v20);
    objc_destroyWeak((id *)buf);
  }

}

- (void)siriSessionRequestsDismissalForReason:(int64_t)a3
{
  void *v5;
  NSObject *v6;
  uint64_t Name;
  void *v8;
  int v9;
  const char *v10;
  __int16 v11;
  void *v12;

  v5 = (void *)AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    Name = SASDismissalReasonGetName(a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue(Name);
    v9 = 136315394;
    v10 = "-[SRSiriViewController siriSessionRequestsDismissalForReason:]";
    v11 = 2112;
    v12 = v8;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s Siri Session is requesting dismissal %@", (uint8_t *)&v9, 0x16u);

  }
  -[SRSiriViewController _dismissWithReason:](self, "_dismissWithReason:", a3);
}

- (void)siriSessionWantsToCacheImage:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(+[INCache sharedCache](INCache, "sharedCache"));
  objc_msgSend(v4, "addCacheableObject:", v3);

}

- (void)siriSessionIsPresentingLocalAuthenticationUI
{
  double v3;
  uint64_t v4;
  void *v5;
  id v6;

  *(_QWORD *)&v3 = objc_opt_class(self, a2).n128_u64[0];
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleForClass:](NSBundle, "bundleForClass:", v4, v3));
  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "assistantUILocalizedStringForKey:table:", CFSTR("ASSISTANT_PRESENTING_LOCAL_AUTHENTICATION_UI"), 0));

  -[SRSiriViewController _presentAuthenticationDialogWithText:](self, "_presentAuthenticationDialogWithText:", v6);
}

- (void)siriSessionIsPresentingApplePaySheet
{
  double v3;
  uint64_t v4;
  void *v5;
  id v6;

  *(_QWORD *)&v3 = objc_opt_class(self, a2).n128_u64[0];
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleForClass:](NSBundle, "bundleForClass:", v4, v3));
  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "assistantUILocalizedStringForKey:table:", CFSTR("ASSISTANT_PRESENTING_APPLE_PAY_SHEET"), 0));

  -[SRSiriViewController _presentAuthenticationDialogWithText:](self, "_presentAuthenticationDialogWithText:", v6);
}

- (void)_presentAuthenticationDialogWithText:(id)a3
{
  id v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v4 = a3;
  v11 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v5 = objc_alloc_init((Class)SAUIAddViews);
  objc_msgSend(v5, "setDialogPhase:", SAUIDialogPhaseStatusValue);
  v6 = objc_alloc_init((Class)SAUIAssistantUtteranceView);
  objc_msgSend(v6, "setText:", v4);
  objc_msgSend(v6, "setSpeakableText:", v4);

  objc_msgSend(v11, "addObject:", v6);
  objc_msgSend(v5, "setViews:", v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "dictionary"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[AceObject aceObjectWithDictionary:](AceObject, "aceObjectWithDictionary:", v7));

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "UUIDString"));
  objc_msgSend(v8, "setAceId:", v10);

  -[SRSiriViewController _performGenericAceCommand:turnIdentifier:completion:](self, "_performGenericAceCommand:turnIdentifier:completion:", v8, 0, 0);
}

- (void)siriSessionDidReceiveSpeechRecognizedCommand:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  int v14;
  const char *v15;
  __int16 v16;
  void *v17;
  const __CFString *v18;
  void *v19;

  v4 = a3;
  if (AFIsInternalInstall(v4, v5))
  {
    v18 = CFSTR("bestTextInterpretation");
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "af_bestTextInterpretation"));
    v19 = v6;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1));

  }
  else
  {
    v7 = 0;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _analytics](self, "_analytics"));
  objc_msgSend(v8, "logEventWithType:context:", 1506, v7);

  -[SRSiriViewController _didReceiveAceCommand:](self, "_didReceiveAceCommand:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _activeConversation](self, "_activeConversation"));
  objc_msgSend(v9, "addItemForSpeechRecognizedCommand:", v4);

  v10 = (void *)AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    v11 = v10;
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "af_userUtteranceValue"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "bestTextInterpretation"));
    v14 = 136315394;
    v15 = "-[SRSiriViewController siriSessionDidReceiveSpeechRecognizedCommand:]";
    v16 = 2112;
    v17 = v13;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%s Speech Recognized: %@", (uint8_t *)&v14, 0x16u);

  }
}

- (void)siriSessionDidRecognizedAdditionalSpeechInterpretation:(id)a3 refId:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  v8 = (id)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _activeConversation](self, "_activeConversation"));
  objc_msgSend(v8, "addAdditionalSpeechInterpretation:refId:", v7, v6);

}

- (void)siriSessionDidUpdateRecognitionWithPhrases:(id)a3 utterances:(id)a4 refId:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (id)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _activeConversation](self, "_activeConversation"));
  objc_msgSend(v11, "addRecognitionUpdateWithPhrases:utterances:refId:", v10, v9, v8);

}

- (void)siriSessionDidReceiveSpeechPartialResultCommand:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  int v15;
  const char *v16;
  __int16 v17;
  id v18;
  const __CFString *v19;
  void *v20;

  v4 = a3;
  if (AFIsInternalInstall(v4, v5))
  {
    v19 = CFSTR("bestTextInterpretation");
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "af_bestTextInterpretation"));
    v20 = v6;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1));

  }
  else
  {
    v7 = 0;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _analytics](self, "_analytics"));
  objc_msgSend(v8, "logEventWithType:context:", 1504, v7);

  -[SRSiriViewController _didReceiveAceCommand:](self, "_didReceiveAceCommand:", v4);
  v9 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    v15 = 136315394;
    v16 = "-[SRSiriViewController siriSessionDidReceiveSpeechPartialResultCommand:]";
    v17 = 2112;
    v18 = v4;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s Did receive partial speech result %@", (uint8_t *)&v15, 0x16u);
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _activeConversation](self, "_activeConversation"));
  objc_msgSend(v10, "addItemForPartialResultCommand:", v4);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
  v12 = objc_opt_respondsToSelector(v11, "siriDidUpdateASRWithRecognition:");

  if ((v12 & 1) != 0)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "af_bestTextInterpretation"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
    objc_msgSend(v14, "siriDidUpdateASRWithRecognition:", v13);

  }
}

- (id)removeAlternativeFeatureViews:(id)a3
{
  id v3;
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v3 = a3;
  v4 = objc_alloc_init((Class)NSMutableArray);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "views", 0));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v8 = v6;
    v9 = *(_QWORD *)v16;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v5);
        v11 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)v10);
        objc_opt_class(SAARParaphrasedAlternativeResultsPod, v7);
        if ((objc_opt_isKindOfClass(v11, v12) & 1) == 0)
        {
          objc_opt_class(SAARParaphrasedSuggestedResultsPod, v7);
          if ((objc_opt_isKindOfClass(v11, v13) & 1) == 0)
            objc_msgSend(v4, "addObject:", v11);
        }
        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  objc_msgSend(v3, "setViews:", v4);
  return v3;
}

- (BOOL)_shouldLowerKeyboardForAddViewsCommand:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char isKindOfClass;
  void *v9;
  char v10;
  void *v11;
  id v12;
  id v13;
  int v14;
  int v15;
  uint64_t v16;
  void *i;
  void *v18;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "views"));
  v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "firstObject"));
  objc_opt_class(SAUIAssistantTipView, v6);
  isKindOfClass = objc_opt_isKindOfClass(v5, v7);

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "af_dialogPhase"));
  LOBYTE(v5) = objc_msgSend(v9, "isReflectionDialogPhase");

  v10 = 0;
  if ((v5 & 1) == 0 && (isKindOfClass & 1) == 0)
  {
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "views", 0));
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v12)
    {
      v13 = v12;
      v14 = 0;
      v15 = 0;
      v16 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v13; i = (char *)i + 1)
        {
          if (*(_QWORD *)v22 != v16)
            objc_enumerationMutation(v11);
          v18 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)i);
          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "listenAfterSpeaking"));
          v14 |= objc_msgSend(v19, "BOOLValue");

          v15 |= SiriUIAceViewHasButtons(v18);
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v13);
      v10 = v14 ^ 1 | v15;
    }
    else
    {
      v10 = 1;
    }

  }
  return v10 & 1;
}

- (void)_updateKeyboardState:(BOOL)a3 minimized:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  void *v7;
  _QWORD v8[4];
  id v9;
  BOOL v10;
  BOOL v11;
  id location;

  v4 = a4;
  v5 = a3;
  if (!-[SRSiriViewController _isKeyboardLoweredAfterResponse](self, "_isKeyboardLoweredAfterResponse"))
  {
    if (-[SASRequestOptions requestSource](self->_requestOptions, "requestSource") == (id)23)
    {
      objc_initWeak(&location, self);
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _host](self, "_host"));
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_100045EC4;
      v8[3] = &unk_1001235F0;
      objc_copyWeak(&v9, &location);
      v10 = v4;
      v11 = v5;
      objc_msgSend(v7, "serviceDidRequestCurrentTextInput:", v8);

      objc_destroyWeak(&v9);
      objc_destroyWeak(&location);
    }
    else if (-[SASRequestOptions inputType](self->_requestOptions, "inputType") == (id)2)
    {
      -[SRSiriViewController _setShowKeyboardIfTextInputEnabled:minimized:](self, "_setShowKeyboardIfTextInputEnabled:minimized:", v5, v4);
      -[SRSiriViewController _setKeyboardLoweredAfterResponse:](self, "_setKeyboardLoweredAfterResponse:", v4);
    }
  }
}

- (void)_updateKeyboardStatusForAddViewsCommand:(id)a3
{
  uint64_t v4;

  if (-[SRSiriViewController _shouldLowerKeyboardForAddViewsCommand:](self, "_shouldLowerKeyboardForAddViewsCommand:", a3))
  {
    v4 = +[UIKeyboard isInHardwareKeyboardMode](UIKeyboard, "isInHardwareKeyboardMode") ^ 1;
  }
  else
  {
    v4 = 0;
  }
  if (-[SASRequestOptions requestSource](self->_requestOptions, "requestSource") == (id)23
    || (_DWORD)v4 && -[SASRequestOptions inputType](self->_requestOptions, "inputType") == (id)2)
  {
    -[SRSiriViewController _updateKeyboardState:minimized:](self, "_updateKeyboardState:minimized:", -[SRSiriViewController textInputEnabled](self, "textInputEnabled"), v4);
  }
}

- (void)siriSessionDidReceiveAddViewsCommand:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  char isKindOfClass;
  void *v12;
  void *v13;
  void (**v14)(id, void *);
  id v15;
  uint64_t v16;
  double v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  void *i;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  NSObject *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  NSString *responseViewId;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  BOOL v41;
  NSString *v42;
  NSString *v43;
  uint64_t v44;
  void *v45;
  BOOL v46;
  NSString *v47;
  NSString *v48;
  id v49;
  void *v50;
  id v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  unsigned int v59;
  void *v60;
  NSString *v61;
  NSString *startRecordingSoundId;
  void *v63;
  char v64;
  void *v65;
  void *v66;
  void *v67;
  char v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  char v73;
  void *v74;
  void *v75;
  NSString *v76;
  NSString *addViewsRefId;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  unsigned int v82;
  int64_t v83;
  int64_t v84;
  SRSiriSystemUIController *systemUIController;
  unint64_t lockState;
  void *v87;
  void *v88;
  void *v89;
  unsigned int v90;
  id v91;
  NSObject *v92;
  void *v93;
  char v94;
  void *v95;
  char v96;
  void *v97;
  void *v98;
  _BOOL4 v99;
  void *v100;
  void *v101;
  SRUIFAnalyticsSupplement *analyticsSupplement;
  uint64_t v103;
  void *v104;
  void *v105;
  int v106;
  void *v107;
  NSObject *v108;
  void *v109;
  char v110;
  void *v111;
  void *v112;
  void *v113;
  NSObject *v114;
  void *v115;
  unsigned int v116;
  NSObject *v117;
  void *v118;
  NSObject *v119;
  uint64_t Name;
  void *v121;
  void *v122;
  void (**v123)(id, void *);
  unint64_t v124;
  void *v125;
  id obj;
  id obja;
  id v128;
  _QWORD v129[4];
  id v130;
  id v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  id v136;
  uint8_t buf[4];
  const char *v138;
  __int16 v139;
  void *v140;
  __int16 v141;
  id v142;
  _BYTE v143[128];

  v6 = a3;
  v123 = (void (**)(id, void *))a4;
  v125 = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "views"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "firstObject"));
  objc_opt_class(SAVCSPlayTrailer, v9);
  isKindOfClass = objc_opt_isKindOfClass(v8, v10);

  if ((isKindOfClass & 1) == 0)
  {
    v15 = objc_alloc((Class)NSMutableString);
    *(_QWORD *)&v17 = objc_opt_class(v125, v16).n128_u64[0];
    v19 = v18;
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v125, "aceId", v17));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v125, "refId"));
    v128 = objc_msgSend(v15, "initWithFormat:", CFSTR("<%@: %@ refId:%@>\n"), v19, v20, v21);

    v134 = 0u;
    v135 = 0u;
    v132 = 0u;
    v133 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v125, "views"));
    v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v132, v143, 16);
    if (v22)
    {
      v23 = *(_QWORD *)v133;
      do
      {
        for (i = 0; i != v22; i = (char *)i + 1)
        {
          if (*(_QWORD *)v133 != v23)
            objc_enumerationMutation(obj);
          v25 = *(void **)(*((_QWORD *)&v132 + 1) + 8 * (_QWORD)i);
          v26 = (void *)objc_claimAutoreleasedReturnValue(+[SiriUIUtilities descriptionForAceView:](SiriUIUtilities, "descriptionForAceView:", v25));
          objc_msgSend(v128, "appendFormat:", CFSTR("%@\n"), v26);

          v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "aceId"));
          LODWORD(v26) = v27 == 0;

          if ((_DWORD)v26)
          {
            v29 = AFSiriLogContextConnection;
            if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315394;
              v138 = "-[SRSiriViewController siriSessionDidReceiveAddViewsCommand:completion:]";
              v139 = 2112;
              v140 = v25;
              _os_log_error_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "%s View missing aceID can result in TTS speaking AddViews and SayIt out of order %@", buf, 0x16u);
            }
            v30 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _analytics](self, "_analytics"));
            v31 = AFAnalyticsContextCreateWithCommand(v125);
            v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
            objc_msgSend(v30, "logEventWithType:context:", 1449, v32);

          }
          objc_opt_class(SAUIAssistantUtteranceView, v28);
          if ((objc_opt_isKindOfClass(v25, v33) & 1) != 0)
          {
            v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "dialogIdentifier"));
            -[SRSiriViewController disableTouchIDFaceIDIfNecessaryForDucID:](self, "disableTouchIDFaceIDIfNecessaryForDucID:", v34);

            v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "listenAfterSpeaking"));
            self->_keyboardEnabled = objc_msgSend(v35, "BOOLValue") ^ 1;

          }
          responseViewId = self->_responseViewId;
          self->_responseViewId = 0;

          objc_opt_class(SAUIPluginSnippet, v37);
          if ((objc_opt_isKindOfClass(v25, v38) & 1) != 0)
          {
            v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "responseViewId"));
            v41 = v40 == 0;

            if (!v41)
            {
              v42 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "responseViewId"));
              v43 = self->_responseViewId;
              self->_responseViewId = v42;

            }
          }
          objc_opt_class(SACardSnippet, v39);
          if ((objc_opt_isKindOfClass(v25, v44) & 1) != 0)
          {
            v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "responseViewId"));
            v46 = v45 == 0;

            if (!v46)
            {
              v47 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "responseViewId"));
              v48 = self->_responseViewId;
              self->_responseViewId = v47;

              v49 = objc_alloc((Class)VRXVisualResponseShown);
              v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "cardData"));
              v51 = objc_msgSend(v49, "initWithCardData:responseViewId:", v50, self->_responseViewId);

              v52 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _instrumentationManager](self, "_instrumentationManager"));
              v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "currentInstrumentationTurnContext"));
              v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "turnIdentifier"));

              objc_msgSend(v51, "emitWithTurnIdentifier:", v54);
            }
          }
          v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "dialog"));

          if (v55)
          {
            v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "dialog"));
            v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "dialogIdentifier"));
            -[SRSiriViewController disableTouchIDFaceIDIfNecessaryForDucID:](self, "disableTouchIDFaceIDIfNecessaryForDucID:", v57);

          }
          if (!self->_listenAfterSpeakingForRequestFinished)
          {
            v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "listenAfterSpeaking"));
            v59 = objc_msgSend(v58, "BOOLValue");

            if (v59)
            {
              -[SRSiriViewController _setListenAfterSpeakingForRequestFinished:](self, "_setListenAfterSpeakingForRequestFinished:", 1);
              v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "listenAfterSpeakingBehavior"));
              v61 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "startAlertSoundID"));
              startRecordingSoundId = self->_startRecordingSoundId;
              self->_startRecordingSoundId = v61;

            }
          }
          v63 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
          v64 = objc_opt_respondsToSelector(v63, "delayDismissalAfterIdleFires:");

          if ((v64 & 1) != 0)
          {
            v65 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
            v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "delayDismissalMs"));
            objc_msgSend(v65, "delayDismissalAfterIdleFires:", v66);

          }
        }
        v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v132, v143, 16);
      }
      while (v22);
    }

    v67 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
    v68 = objc_opt_respondsToSelector(v67, "handleFeedbackForm:");

    if ((v68 & 1) != 0)
    {
      v69 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
      v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v125, "feedbackForm"));
      objc_msgSend(v69, "handleFeedbackForm:", v70);

    }
    v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v125, "requestEndBehavior"));
    if (v71)
    {
      v72 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
      v73 = objc_opt_respondsToSelector(v72, "handleRequestEndBehavior:isAttending:");

      if ((v73 & 1) != 0)
      {
        objc_initWeak((id *)buf, self);
        v129[0] = _NSConcreteStackBlock;
        v129[1] = 3221225472;
        v129[2] = sub_100046DD0;
        v129[3] = &unk_100123618;
        objc_copyWeak(&v131, (id *)buf);
        v130 = v125;
        -[SRSiriViewController _fetchAttendingState:](self, "_fetchAttendingState:", v129);

        objc_destroyWeak(&v131);
        objc_destroyWeak((id *)buf);
      }
    }
    obja = v125;
    -[SRSiriViewController _logPatternExecutedEventForAddViewsCommand:](self, "_logPatternExecutedEventForAddViewsCommand:");
    -[SRSiriViewController _sharePatternIdFromAddViewsCommand:](self, "_sharePatternIdFromAddViewsCommand:", obja);
    v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(obja, "responseMode"));
    v124 = -[SRSiriViewController _responseModeToMDModeConverter:](self, "_responseModeToMDModeConverter:", v74);

    v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(obja, "responseMode"));
    v122 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "lowercaseString"));

    v76 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(obja, "refId"));
    addViewsRefId = self->_addViewsRefId;
    self->_addViewsRefId = v76;

    v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(obja, "responseMode"));
    self->_addViewsMode = -[SRSiriViewController _responseModeToMDModeConverter:](self, "_responseModeToMDModeConverter:", v78);

    v79 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(obja, "patternId"));
    if (v79)
    {
      v80 = obja;
    }
    else
    {
      if (-[NSString length](self->_responseViewId, "length"))
      {
        v80 = obja;
LABEL_39:
        v81 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v80, "sruif_dialogPhase"));
        v82 = objc_msgSend(v81, "isReflectionDialogPhase");

        if (v82)
          -[SRSiriViewController _reflectionDialogHasBeenPlayed:](self, "_reflectionDialogHasBeenPlayed:", 1);
        if ((id)-[SRSiriViewController _presentationOptions](self, "_presentationOptions") == (id)2)
          v83 = 4;
        else
          v83 = +[SRVisualResponseTransformer currentIdiom](SRVisualResponseTransformer, "currentIdiom");
        v84 = -[SRSiriViewController _viewModeFromPresentationOptions:](self, "_viewModeFromPresentationOptions:", -[SRSiriViewController _presentationOptions](self, "_presentationOptions"));
        systemUIController = self->_systemUIController;
        lockState = self->_lockState;
        v87 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController view](self, "view"));
        v88 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v87, "traitCollection"));
        -[SRSiriSystemUIController updateSystemUIForAddViews:viewMode:lockState:isInAmbient:](systemUIController, "updateSystemUIForAddViews:viewMode:lockState:isInAmbient:", v80, v84, lockState, objc_msgSend(v88, "isAmbientPresented"));

        if (-[SRSiriSystemUIController shouldRedactSnippetForAddViews:](self->_systemUIController, "shouldRedactSnippetForAddViews:", v80))
        {
          v89 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriSystemUIController transformAddViews:mode:idiom:](self->_systemUIController, "transformAddViews:mode:idiom:", v80, -[SRSiriViewController _MDModeToSRModeConverter:](self, "_MDModeToSRModeConverter:", v124), v83));
          v90 = -[SRSiriSystemUIController presentingSystemUI](self->_systemUIController, "presentingSystemUI");
          v91 = v89;

          if (!v90)
            goto LABEL_52;
          v92 = AFSiriLogContextConnection;
          if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315138;
            v138 = "-[SRSiriViewController siriSessionDidReceiveAddViewsCommand:completion:]";
            _os_log_impl((void *)&_mh_execute_header, v92, OS_LOG_TYPE_DEFAULT, "%s System UI Presented. Setting didPresentSystemUI", buf, 0xCu);
          }
          v93 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
          v94 = objc_opt_respondsToSelector(v93, "didPresentSystemUI");

          if ((v94 & 1) == 0)
          {
LABEL_52:
            v95 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
            v96 = objc_opt_respondsToSelector(v95, "siriResponseModeDidChange:");

            if ((v96 & 1) != 0)
            {
              v97 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
              objc_msgSend(v97, "siriResponseModeDidChange:", v124);

            }
            v98 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v91, "views"));
            v99 = objc_msgSend(v98, "count") == 0;

            if (v99)
            {
              v108 = AFSiriLogContextConnection;
              if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 136315138;
                v138 = "-[SRSiriViewController siriSessionDidReceiveAddViewsCommand:completion:]";
                _os_log_impl((void *)&_mh_execute_header, v108, OS_LOG_TYPE_DEFAULT, "%s System UI Presented. Resetting ASR", buf, 0xCu);
              }
              v109 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
              v110 = objc_opt_respondsToSelector(v109, "resetViewsAndClearASR:");

              if ((v110 & 1) != 0)
              {
                v111 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
                objc_msgSend(v111, "resetViewsAndClearASR:", 1);

              }
              v112 = (void *)AFSiriLogContextConnection;
              if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
                sub_10009EEE0(v112, obja);
              if (!v123)
                goto LABEL_66;
              v107 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(obja, "aceId"));
              v113 = (void *)objc_claimAutoreleasedReturnValue(+[SACommandSucceeded sruif_commandSucceededWithRefId:](SACommandSucceeded, "sruif_commandSucceededWithRefId:", v107));
              v123[2](v123, v113);

            }
            else
            {
              v100 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _analytics](self, "_analytics"));
              v101 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _instrumentationManager](self, "_instrumentationManager"));
              objc_msgSend(v100, "logClientFeedbackPresented:dialogIdentifierProvider:", v91, v101);

              analyticsSupplement = self->_analyticsSupplement;
              v103 = -[SRSiriViewController _instrumentationResponseModeForMode:](self, "_instrumentationResponseModeForMode:", v124);
              v136 = v91;
              v104 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v136, 1));
              -[SRUIFAnalyticsSupplement didComputeMode:forAceCommand:generatedAceCommands:](analyticsSupplement, "didComputeMode:forAceCommand:generatedAceCommands:", v103, obja, v104);

              -[SRSiriViewController _processAddViewsCommand:forMode:completion:](self, "_processAddViewsCommand:forMode:completion:", v91, -[SRSiriViewController _MDModeToSRModeConverter:](self, "_MDModeToSRModeConverter:", v124), v123);
              v105 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
              v106 = objc_opt_respondsToSelector(v105, "didReceiveAddViewsSignalForSuggestions:currentMode:");

              if ((v106 & 1) == 0)
              {
LABEL_66:

                v14 = v123;
                goto LABEL_67;
              }
              v107 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
              objc_msgSend(v107, "didReceiveAddViewsSignalForSuggestions:currentMode:", self->_addViewsRefId, v122);
            }

            goto LABEL_66;
          }
          v80 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
          objc_msgSend(v80, "didPresentSystemUI");
        }
        else
        {
          v91 = (id)objc_claimAutoreleasedReturnValue(+[SRVisualResponseTransformer transformVisualResponse:forMode:idiom:shouldHideSnippet:](SRVisualResponseTransformer, "transformVisualResponse:forMode:idiom:shouldHideSnippet:", v80, -[SRSiriViewController _MDModeToSRModeConverter:](self, "_MDModeToSRModeConverter:", v124), v83, 0));
        }

        goto LABEL_52;
      }
      v114 = AFSiriLogContextConnection;
      if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v138 = "-[SRSiriViewController siriSessionDidReceiveAddViewsCommand:completion:]";
        _os_log_impl((void *)&_mh_execute_header, v114, OS_LOG_TYPE_DEFAULT, "%s #modes non-RF response - setting currentMode as computed mode passed from MAF through addViews for iOS bridging", buf, 0xCu);
      }
      v115 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(obja, "sruif_dialogPhase"));
      if (objc_msgSend(v115, "isReflectionDialogPhase"))
      {
        v116 = -[SRSiriViewController _suppressTTSForErrorsAndInterstitials](self, "_suppressTTSForErrorsAndInterstitials");

        if (v116)
        {
          v117 = AFSiriLogContextConnection;
          if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315138;
            v138 = "-[SRSiriViewController siriSessionDidReceiveAddViewsCommand:completion:]";
            _os_log_impl((void *)&_mh_execute_header, v117, OS_LOG_TYPE_DEFAULT, "%s #modes Applying DisplayOnly mode to suppress interstitials from being spoken", buf, 0xCu);
          }
          v124 = 2;
        }
      }
      else
      {

      }
      v118 = (void *)AFSiriLogContextConnection;
      if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
      {
        v119 = v118;
        Name = MDModeGetName(v124);
        v121 = (void *)objc_claimAutoreleasedReturnValue(Name);
        *(_DWORD *)buf = 136315650;
        v138 = "-[SRSiriViewController siriSessionDidReceiveAddViewsCommand:completion:]";
        v139 = 2112;
        v140 = v121;
        v141 = 2112;
        v142 = v128;
        _os_log_impl((void *)&_mh_execute_header, v119, OS_LOG_TYPE_DEFAULT, "%s #modes %@ %@", buf, 0x20u);

      }
      v80 = (void *)objc_claimAutoreleasedReturnValue(+[MDDialogTransformer transformAddViews:forMode:](MDDialogTransformer, "transformAddViews:forMode:", obja, v124));
      v79 = obja;
    }

    goto LABEL_39;
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v125, "views"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "firstObject"));
  v14 = v123;
  -[SRSiriViewController handlePlayTrailer:completion:](self, "handlePlayTrailer:completion:", v13, v123);

LABEL_67:
}

- (void)orientationWillChangeTo:(int64_t)a3
{
  -[SRSiriSystemUIController orientationChangedTo:](self->_systemUIController, "orientationChangedTo:", a3);
}

- (void)siriSessionRequestsTTSDuckToVolume:(float)a3 rampTime:(double)a4 completion:(id)a5
{
  id v8;
  NSObject *v9;
  double v10;
  int v11;
  const char *v12;
  __int16 v13;
  double v14;
  __int16 v15;
  double v16;

  v8 = a5;
  v9 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 136315650;
    v12 = "-[SRSiriViewController siriSessionRequestsTTSDuckToVolume:rampTime:completion:]";
    v13 = 2048;
    v14 = a3;
    v15 = 2048;
    v16 = a4;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s Ducking TTS to %f over time %f", (uint8_t *)&v11, 0x20u);
  }
  *(float *)&v10 = a3;
  -[SRUIFSpeechSynthesizer duckTTSVolumeTo:rampTime:completion:](self->_ttsManager, "duckTTSVolumeTo:rampTime:completion:", v8, v10, a4);

}

- (void)siriSessionWillProcessAppLaunchWithBundleIdentifier:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
  v5 = objc_opt_respondsToSelector(v4, "siriWillProcessAppLaunchWithBundleIdentifier:");

  if ((v5 & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
    objc_msgSend(v6, "siriWillProcessAppLaunchWithBundleIdentifier:", v7);

  }
  -[SRSiriSystemUIController collapseSystemUI](self->_systemUIController, "collapseSystemUI");

}

- (void)siriSessionDidEnterLatencyState
{
  void *v3;
  char v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
  v4 = objc_opt_respondsToSelector(v3, "siriDidEnterLatencyState");

  if ((v4 & 1) != 0)
  {
    v5 = (id)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
    objc_msgSend(v5, "siriDidEnterLatencyState");

  }
}

- (void)siriSessionDidReceiveLatencyProgressUpdate:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
  v5 = objc_opt_respondsToSelector(v4, "siriDidReceiveLatencyProgressUpdate:");

  if ((v5 & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
    objc_msgSend(v6, "siriDidReceiveLatencyProgressUpdate:", v7);

  }
}

- (void)orchestrationDidPresentResponseFullyInApp
{
  void *v3;
  char v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
  v4 = objc_opt_respondsToSelector(v3, "didPresentResponseFullyInApp");

  if ((v4 & 1) != 0)
  {
    v5 = (id)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
    objc_msgSend(v5, "didPresentResponseFullyInApp");

  }
}

- (void)controllerRequestSystemApertureCollapse
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _host](self, "_host"));
  objc_msgSend(v2, "requestSystemApertureCollapse");

}

- (void)controllerRequestSiriDismissal
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
  -[SRSiriViewController dismissSiriPresentation:withReason:](self, "dismissSiriPresentation:withReason:", v3, 55);

}

- (void)controllerRequestSiriBlurHidden:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  _BOOL8 v6;
  void *v7;
  unsigned int v8;
  id v9;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _host](self, "_host"));
  v6 = !v3;
  objc_msgSend(v5, "requestHostBlurVisible:reason:fence:", v6, 2, 0);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController traitCollection](self, "traitCollection"));
  v8 = objc_msgSend(v7, "isAmbientPresented");

  if (v8)
  {
    v9 = (id)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _host](self, "_host"));
    objc_msgSend(v9, "setFullScreenDimmingLayerVisible:animated:", v6, 1);

  }
}

- (void)controllerRequestTapsShared:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  id v7;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _host](self, "_host"));
  objc_msgSend(v5, "setShouldPassTouchesThroughToSpringBoard:", v3);

  v7 = (id)objc_claimAutoreleasedReturnValue(-[SRSiriViewController view](self, "view"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "layer"));
  objc_msgSend(v6, "setHitTestsAsOpaque:", v3 ^ 1);

}

- (void)controllerRequestScreenClearedWithClearASR:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  char v6;
  id v7;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
  v6 = objc_opt_respondsToSelector(v5, "resetViewsAndClearASR:");

  if ((v6 & 1) != 0)
  {
    v7 = (id)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
    objc_msgSend(v7, "resetViewsAndClearASR:", v3);

  }
}

- (void)_processAddViewsCommand:(id)a3 forMode:(unint64_t)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  void *v19;
  unint64_t v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  SAUISayIt *repeatableAudioSayit;
  void *v26;
  void *v27;
  void *v28;
  _QWORD v29[4];
  id v30;

  v8 = a3;
  v9 = a5;
  v10 = v8;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
  v12 = objc_opt_respondsToSelector(v11, "prepareAddViewsCommandForConversation:");

  v15 = v10;
  if ((v12 & 1) != 0)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "prepareAddViewsCommandForConversation:", v10));

  }
  if (SiriUIDisableAlternativesFeature(v13, v14))
  {
    v17 = objc_claimAutoreleasedReturnValue(-[SRSiriViewController removeAlternativeFeatureViews:](self, "removeAlternativeFeatureViews:", v15));

    v15 = (void *)v17;
  }
  if (-[SRSiriViewController textInputEnabled](self, "textInputEnabled"))
    -[SRSiriViewController _updateKeyboardStatusForAddViewsCommand:](self, "_updateKeyboardStatusForAddViewsCommand:", v15);
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_100047628;
  v29[3] = &unk_100123550;
  v18 = v9;
  v30 = v18;
  -[SRSiriViewController _didReceiveAceCommand:completion:](self, "_didReceiveAceCommand:completion:", v15, v29);
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "responseMode"));
  v20 = -[SRSiriViewController _responseModeToMDModeConverter:](self, "_responseModeToMDModeConverter:", v19);

  if ((v20 == 3 || !v20) && _os_feature_enabled_impl("SiriAssistantSuggestions", "voxHint"))
    -[SRSiriViewController _enqueueSpokenSuggestionsFromAddViews:](self, "_enqueueSpokenSuggestionsFromAddViews:", v10);
  if (a4 == 2)
  {
    +[SRUIFAddViewsDurationProvider minimumDisplayDurationForAddViews:](SRUIFAddViewsDurationProvider, "minimumDisplayDurationForAddViews:", v15);
    if (v21 > 0.0)
      -[SRSiriViewController _delayAceCommandSuccess:forDuration:](self, "_delayAceCommandSuccess:forDuration:", v15);
  }
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "dialogPhase"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[AFDialogPhase dialogPhaseForAceDialogPhase:](AFDialogPhase, "dialogPhaseForAceDialogPhase:", v22));

  if ((objc_msgSend(v23, "isTemporary") & 1) == 0
    && (objc_msgSend(v23, "isConfirmedDialogPhase") & 1) == 0
    && (objc_msgSend(v23, "isCancelledDialogPhase") & 1) == 0)
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _repeatablePhrases](self, "_repeatablePhrases"));
    objc_msgSend(v24, "removeAllObjects");

    repeatableAudioSayit = self->_repeatableAudioSayit;
    self->_repeatableAudioSayit = 0;

  }
  if (!objc_msgSend(v23, "isTemporary") || objc_msgSend(v23, "isConfirmationDialogPhase"))
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _session](self, "_session"));
    objc_msgSend(v26, "requestDidPresentViewForUICommand:", v15);

  }
  if (objc_msgSend(v23, "isErrorDialogPhase"))
  {
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _session](self, "_session"));
    objc_msgSend(v27, "requestDidPresentViewForErrorCommand:", v15);

  }
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _activeConversation](self, "_activeConversation"));
  objc_msgSend(v28, "addItemsForAddViewsCommand:", v15);

}

- (void)disableTouchIDFaceIDIfNecessaryForDucID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  unsigned int v11;
  id v12;
  NSObject *v13;
  id v14;
  id v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  void *v19;

  v4 = a3;
  v5 = v4;
  if ((~LODWORD(self->_lockState) & 3) == 0
    && ((objc_msgSend(v4, "isEqualToString:", CFSTR("misc#answerWhoAmI")) & 1) != 0
     || objc_msgSend(v5, "isEqualToString:", CFSTR("misc#answerWhoseIsThis"))))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[BKDeviceManager availableDevices](BKDeviceManager, "availableDevices"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "firstObject"));

    if (v7)
    {
      v15 = 0;
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[BKDevice deviceWithDescriptor:error:](BKDevice, "deviceWithDescriptor:error:", v7, &v15));
      v9 = v15;
      v10 = v9;
      if (v8)
      {
        v14 = v9;
        v11 = objc_msgSend(v8, "forceBioLockoutIfLockedForUser:error:", 501, &v14);
        v12 = v14;

        v13 = AFSiriLogContextConnection;
        if (v11)
        {
          if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315394;
            v17 = "-[SRSiriViewController disableTouchIDFaceIDIfNecessaryForDucID:]";
            v18 = 2112;
            v19 = v5;
            _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%s Disabled BioLock for \"%@\", buf, 0x16u);
          }
        }
        else if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
        {
          sub_10009EF94();
        }
        v10 = v12;
      }
      else if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
      {
        sub_10009EF94();
      }

    }
  }

}

- (void)handlePlayTrailer:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;
  id location;

  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init((Class)SAVCSPlayContent);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "utsId"));
  objc_msgSend(v8, "setPlayTrailer:", 1);
  objc_msgSend(v8, "setContentType:", SAVCSContentTypeMovieValue);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "UUIDString"));
  objc_msgSend(v8, "setAceId:", v11);

  objc_msgSend(v8, "setUtsId:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "hiresTrailerUri"));
  v13 = v12;
  if (v12)
    v14 = v12;
  else
    v14 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "lowresTrailerUri"));
  v15 = v14;

  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "lowresTrailerUri"));
  v17 = v16;
  if (v16)
    v18 = v16;
  else
    v18 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "hiresTrailerUri"));
  v19 = v18;

  if (v15)
  {
    objc_msgSend(v8, "setHiresTrailerUri:", v15);
    objc_msgSend(v8, "setLowresTrailerUri:", v19);
    -[SRSiriViewController siriSessionDidReceivePlayContentCommand:completion:](self, "siriSessionDidReceivePlayContentCommand:completion:", v8, v7);
  }
  else
  {
    v20 = objc_msgSend(objc_alloc((Class)WLKCanonicalPlayablesRequest), "initWithCanonicalID:", v9);
    objc_initWeak(&location, self);
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_100047A6C;
    v21[3] = &unk_100123668;
    v22 = v8;
    objc_copyWeak(&v24, &location);
    v23 = v7;
    objc_msgSend(v20, "makeRequestWithCompletion:", v21);

    objc_destroyWeak(&v24);
    objc_destroyWeak(&location);

  }
}

- (void)siriSessionDidReceiveAddDialogsCommand:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  double v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *i;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  unsigned int v22;
  void *v23;
  NSString *v24;
  NSString *startRecordingSoundId;
  void *v26;
  void *v27;
  char v28;
  void *v29;
  unint64_t v30;
  NSObject *v31;
  void *v32;
  NSObject *v33;
  uint64_t Name;
  void *v35;
  void *v36;
  void *v37;
  char v38;
  void *v39;
  id v40;
  id v41;
  uint64_t v42;
  void *j;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  NSObject *v48;
  void *v49;
  void *v50;
  char v51;
  void *v52;
  void *v53;
  void *v54;
  id v55;
  void *v56;
  _QWORD v57[5];
  id v58;
  char *v59;
  unint64_t v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  _QWORD v65[4];
  id v66;
  id v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  _BYTE v72[128];
  _BYTE location[12];
  __int16 v74;
  void *v75;
  __int16 v76;
  id v77;
  _BYTE v78[128];

  v6 = a3;
  v55 = a4;
  v7 = objc_alloc((Class)NSMutableString);
  *(_QWORD *)&v9 = objc_opt_class(v6, v8).n128_u64[0];
  v11 = v10;
  v56 = v6;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "aceId", v9));
  v13 = objc_msgSend(v7, "initWithFormat:", CFSTR("<%@: %@>\n"), v11, v12);

  v70 = 0u;
  v71 = 0u;
  v68 = 0u;
  v69 = 0u;
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dialogs"));
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v68, v78, 16);
  if (v15)
  {
    v16 = *(_QWORD *)v69;
    do
    {
      for (i = 0; i != v15; i = (char *)i + 1)
      {
        if (*(_QWORD *)v69 != v16)
          objc_enumerationMutation(v14);
        v18 = *(void **)(*((_QWORD *)&v68 + 1) + 8 * (_QWORD)i);
        v19 = (void *)objc_claimAutoreleasedReturnValue(+[SiriUIUtilities descriptionForDialog:](SiriUIUtilities, "descriptionForDialog:", v18));
        objc_msgSend(v13, "appendFormat:", CFSTR("%@\n"), v19);

        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "dialogIdentifier"));
        -[SRSiriViewController disableTouchIDFaceIDIfNecessaryForDucID:](self, "disableTouchIDFaceIDIfNecessaryForDucID:", v20);

      }
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v68, v78, 16);
    }
    while (v15);
  }

  if (!self->_listenAfterSpeakingForRequestFinished)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "listenAfterSpeaking"));
    v22 = objc_msgSend(v21, "BOOLValue");

    if (v22)
    {
      -[SRSiriViewController _setListenAfterSpeakingForRequestFinished:](self, "_setListenAfterSpeakingForRequestFinished:", 1);
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "listenAfterSpeakingBehavior"));
      v24 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "startAlertSoundID"));
      startRecordingSoundId = self->_startRecordingSoundId;
      self->_startRecordingSoundId = v24;

    }
  }
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "requestEndBehavior"));
  if (v26)
  {
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
    v28 = objc_opt_respondsToSelector(v27, "handleRequestEndBehavior:isAttending:");

    if ((v28 & 1) != 0)
    {
      objc_initWeak((id *)location, self);
      v65[0] = _NSConcreteStackBlock;
      v65[1] = 3221225472;
      v65[2] = sub_100048324;
      v65[3] = &unk_100123618;
      objc_copyWeak(&v67, (id *)location);
      v66 = v56;
      -[SRSiriViewController _fetchAttendingState:](self, "_fetchAttendingState:", v65);

      objc_destroyWeak(&v67);
      objc_destroyWeak((id *)location);
    }
  }
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "responseMode"));
  v30 = -[SRSiriViewController _responseModeToMDModeConverter:](self, "_responseModeToMDModeConverter:", v29);

  v31 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)location = 136315138;
    *(_QWORD *)&location[4] = "-[SRSiriViewController siriSessionDidReceiveAddDialogsCommand:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "%s #modes non-RF response - setting currentMode as computed mode passed from MAF through addDialogs for iOS bridging", location, 0xCu);
  }
  v32 = (void *)AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    v33 = v32;
    Name = MDModeGetName(v30);
    v35 = (void *)objc_claimAutoreleasedReturnValue(Name);
    *(_DWORD *)location = 136315650;
    *(_QWORD *)&location[4] = "-[SRSiriViewController siriSessionDidReceiveAddDialogsCommand:completion:]";
    v74 = 2112;
    v75 = v35;
    v76 = 2112;
    v77 = v13;
    _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "%s #modes %@ %@", location, 0x20u);

  }
  v36 = (void *)objc_claimAutoreleasedReturnValue(+[MDDialogTransformer transformAddDialogs:forMode:](MDDialogTransformer, "transformAddDialogs:forMode:", v56, v30));
  -[SRUIFAnalyticsSupplement didComputeMode:forAceCommand:generatedAceCommands:](self->_analyticsSupplement, "didComputeMode:forAceCommand:generatedAceCommands:", -[SRSiriViewController _instrumentationResponseModeForMode:](self, "_instrumentationResponseModeForMode:", v30), v56, v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
  v38 = objc_opt_respondsToSelector(v37, "siriResponseModeDidChange:");

  if ((v38 & 1) != 0)
  {
    v39 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
    objc_msgSend(v39, "siriResponseModeDidChange:", v30);

  }
  v63 = 0u;
  v64 = 0u;
  v61 = 0u;
  v62 = 0u;
  v40 = v36;
  v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v61, v72, 16);
  if (v41)
  {
    v42 = *(_QWORD *)v62;
    do
    {
      for (j = 0; j != v41; j = (char *)j + 1)
      {
        if (*(_QWORD *)v62 != v42)
          objc_enumerationMutation(v40);
        v44 = *(_QWORD *)(*((_QWORD *)&v61 + 1) + 8 * (_QWORD)j);
        v45 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _analytics](self, "_analytics"));
        v46 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _instrumentationManager](self, "_instrumentationManager"));
        objc_msgSend(v45, "logClientFeedbackPresented:dialogIdentifierProvider:", v44, v46);

      }
      v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v61, v72, 16);
    }
    while (v41);
  }

  if (objc_msgSend(v40, "count"))
  {
    v57[0] = _NSConcreteStackBlock;
    v57[1] = 3221225472;
    v57[2] = sub_100048398;
    v57[3] = &unk_100123690;
    v59 = (char *)objc_msgSend(v40, "count") - 1;
    v60 = v30;
    v57[4] = self;
    v58 = v55;
    objc_msgSend(v40, "enumerateObjectsUsingBlock:", v57);

  }
  else
  {
    v47 = (void *)AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
    {
      v48 = v47;
      v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "aceId"));
      *(_DWORD *)location = 136315394;
      *(_QWORD *)&location[4] = "-[SRSiriViewController siriSessionDidReceiveAddDialogsCommand:completion:]";
      v74 = 2112;
      v75 = v49;
      _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_DEFAULT, "%s #modes Transformed AddDialogs (aceId = %@) resulted in no commands", location, 0x16u);

    }
    v50 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
    v51 = objc_opt_respondsToSelector(v50, "didOmitDialogFromPresenting");

    if ((v51 & 1) != 0)
    {
      v52 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
      objc_msgSend(v52, "didOmitDialogFromPresenting");

    }
    if (v55)
    {
      v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "aceId"));
      v54 = (void *)objc_claimAutoreleasedReturnValue(+[SACommandSucceeded sruif_commandSucceededWithRefId:](SACommandSucceeded, "sruif_commandSucceededWithRefId:", v53));
      (*((void (**)(id, void *))v55 + 2))(v55, v54);

    }
  }

}

- (void)siriSessionDidReceiveClearScreenCommand:(id)a3 completion:(id)a4
{
  void (**v6)(id, id);
  void *v7;
  char v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;

  v15 = a3;
  v6 = (void (**)(id, id))a4;
  -[SRSiriViewController _didReceiveAceCommand:](self, "_didReceiveAceCommand:", v15);
  -[SRSiriViewController _didStartActionForAceCommand:](self, "_didStartActionForAceCommand:", v15);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
  v8 = objc_opt_respondsToSelector(v7, "startNewConversation");

  if ((v8 & 1) != 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
    objc_msgSend(v9, "startNewConversation");

  }
  else
  {
    v10 = -[SRSiriViewController _startNewConversation](self, "_startNewConversation");
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "initialView"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "speakableText"));

  if (objc_msgSend(v12, "length"))
    -[SRSiriViewController _setUtteranceToSpeakAfterClearScreenCommand:](self, "_setUtteranceToSpeakAfterClearScreenCommand:", v12);
  -[SRSiriViewController _didCompleteActionForAceCommand:success:](self, "_didCompleteActionForAceCommand:success:", v15, 1);
  if (v6)
  {
    v13 = objc_alloc_init((Class)SACommandSucceeded);
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "aceId"));
    objc_msgSend(v13, "setRefId:", v14);

    v6[2](v6, v13);
  }

}

- (void)siriSessionDidReceivePlayVoicemailCommand:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v6 = a3;
  -[SRSiriViewController _didReceiveAceCommand:completion:](self, "_didReceiveAceCommand:completion:", v6, a4);
  -[SRSiriViewController _didStartActionForAceCommand:](self, "_didStartActionForAceCommand:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _voicemailPlayer](self, "_voicemailPlayer"));
  objc_msgSend(v7, "setPlaybackCommand:", v6);

  v8 = (id)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _voicemailPlayer](self, "_voicemailPlayer"));
  objc_msgSend(v8, "startPlaying");

}

- (AFUIAudioPlayer)_voicemailPlayer
{
  AFUIAudioPlayer *voicemailPlayer;
  AFUIAudioPlayer *v4;
  AFUIAudioPlayer *v5;

  voicemailPlayer = self->_voicemailPlayer;
  if (!voicemailPlayer)
  {
    v4 = (AFUIAudioPlayer *)objc_claimAutoreleasedReturnValue(+[AFUIAudioPlayer voicemailPlayer](AFUIAudioPlayer, "voicemailPlayer"));
    v5 = self->_voicemailPlayer;
    self->_voicemailPlayer = v4;

    -[AFUIAudioPlayer setDelegate:](self->_voicemailPlayer, "setDelegate:", self);
    voicemailPlayer = self->_voicemailPlayer;
  }
  return voicemailPlayer;
}

- (id)_configuredSpeakableUtteranceParserForCommand:(id)a3 context:(id)a4 speakableText:(id)a5 subCompletion:(id)a6 speakPreparation:(id *)a7 speakCompletion:(id *)a8
{
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  uint64_t v17;
  id v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  unsigned __int8 v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  NSObject *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  id v31;
  _QWORD *v32;
  id v33;
  id v34;
  id v35;
  _QWORD *v36;
  id v37;
  id v39;
  _QWORD v42[4];
  id v43;
  id v44;
  id v45;
  uint64_t *v46;
  id v47;
  _QWORD v48[4];
  id v49;
  id v50;
  id v51;
  id v52;
  id v53;
  id location;
  uint64_t v55;
  uint64_t *v56;
  uint64_t v57;
  char v58;
  _BYTE v59[32];

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v39 = a6;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[AFSpeakableUtteranceParser sruif_speakableUtteranceParserForCurrentLanguage](AFSpeakableUtteranceParser, "sruif_speakableUtteranceParserForCurrentLanguage"));
  objc_msgSend(v15, "setHandleTTSCodes:", 1);
  v16 = objc_msgSend(v13, "conformsToProtocol:", &OBJC_PROTOCOL___SAAceIdentifiable);
  if ((_DWORD)v16)
  {
    v18 = v13;
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "identifier"));
    v13 = v18;
    if (objc_msgSend(v19, "isAMOSIdentifier"))
    {
      v13 = (id)objc_claimAutoreleasedReturnValue(-[SRSiriViewController domainObjectForIdentifier:](self, "domainObjectForIdentifier:", v19));

    }
  }
  v55 = 0;
  v56 = &v55;
  v57 = 0x2020000000;
  v58 = 0;
  if (AFIsInternalInstall(v16, v17))
  {
    objc_opt_class(AceObject, v20);
    if ((objc_opt_isKindOfClass(v12, v21) & 1) != 0)
    {
      v22 = +[SRUIFUtilities shouldRedactSpeakableTextForAceObject:](SRUIFUtilities, "shouldRedactSpeakableTextForAceObject:", v12);
      *((_BYTE *)v56 + 24) = v22;
    }
  }
  if (!objc_msgSend(v15, "sruif_hasExternalDomainsForStringWithFormat:shouldRedactLog:", v14, *((unsigned __int8 *)v56 + 24)))goto LABEL_15;
  objc_opt_class(AceObject, v23);
  if ((objc_opt_isKindOfClass(v13, v24) & 1) == 0)
  {
    v27 = AFSiriLogContextConnection;
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      objc_opt_class(v13, v28);
      sub_10009F0A8(v29, (uint64_t)v59, v27);
    }

LABEL_15:
    v26 = 0;
    goto LABEL_16;
  }
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[SiriUISnippetManager sharedInstance](SiriUISnippetManager, "sharedInstance"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "speakableProviderForObject:", v13));

  if (v26)
    objc_msgSend(v15, "registerProvider:forNamespace:", v26, _AFSpeakableUtteranceParserObjDomain);
LABEL_16:
  if ((objc_opt_respondsToSelector(v26, "setAssistantBulletin:") & 1) != 0
    && (objc_opt_respondsToSelector(v26, "identifier") & 1) != 0)
  {
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "identifier"));
    objc_initWeak(&location, self);
    if (v30)
    {
      v48[0] = _NSConcreteStackBlock;
      v48[1] = 3221225472;
      v48[2] = sub_100048B48;
      v48[3] = &unk_100123708;
      objc_copyWeak(&v53, &location);
      v31 = v30;
      v49 = v31;
      v50 = v26;
      v51 = v15;
      v52 = v14;
      v32 = objc_retainBlock(v48);

      objc_destroyWeak(&v53);
      goto LABEL_22;
    }
  }
  else
  {
    objc_initWeak(&location, self);
  }
  v31 = 0;
  v32 = 0;
LABEL_22:
  v42[0] = _NSConcreteStackBlock;
  v42[1] = 3221225472;
  v42[2] = sub_100048E44;
  v42[3] = &unk_100123730;
  objc_copyWeak(&v47, &location);
  v46 = &v55;
  v33 = v14;
  v43 = v33;
  v34 = v12;
  v44 = v34;
  v35 = v39;
  v45 = v35;
  v36 = objc_retainBlock(v42);
  if (a7)
    *a7 = objc_msgSend(v32, "copy");
  if (a8)
    *a8 = objc_msgSend(v36, "copy");
  v37 = v15;

  objc_destroyWeak(&v47);
  objc_destroyWeak(&location);

  _Block_object_dispose(&v55, 8);
  return v37;
}

- (void)siriSessionDidReceiveSmsPlayAudioCommand:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v6 = a3;
  -[SRSiriViewController _didReceiveAceCommand:completion:](self, "_didReceiveAceCommand:completion:", v6, a4);
  -[SRSiriViewController _didStartActionForAceCommand:](self, "_didStartActionForAceCommand:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _audioMessagePlayer](self, "_audioMessagePlayer"));
  objc_msgSend(v7, "setPlaybackCommand:", v6);

  v8 = (id)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _audioMessagePlayer](self, "_audioMessagePlayer"));
  objc_msgSend(v8, "startPlaying");

}

- (AFUIAudioPlayer)_audioMessagePlayer
{
  AFUIAudioPlayer *audioMessagePlayer;
  AFUIAudioPlayer *v4;
  AFUIAudioPlayer *v5;

  audioMessagePlayer = self->_audioMessagePlayer;
  if (!audioMessagePlayer)
  {
    v4 = (AFUIAudioPlayer *)objc_claimAutoreleasedReturnValue(+[AFUIAudioPlayer audioMessagePlayer](AFUIAudioPlayer, "audioMessagePlayer"));
    v5 = self->_audioMessagePlayer;
    self->_audioMessagePlayer = v4;

    -[AFUIAudioPlayer setDelegate:](self->_audioMessagePlayer, "setDelegate:", self);
    audioMessagePlayer = self->_audioMessagePlayer;
  }
  return audioMessagePlayer;
}

- (void)siriSessionDidReceivePlayNotificationSound:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  void *v9;
  SAUIPlayNotificationSound **p_currentNotificationSound;
  NSObject *v11;
  SAUIPlayNotificationSound *v12;
  int v13;
  const char *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  SAUIPlayNotificationSound *v18;

  v7 = a3;
  -[SRSiriViewController _didReceiveAceCommand:completion:](self, "_didReceiveAceCommand:completion:", v7, a4);
  -[SRSiriViewController _didStartActionForAceCommand:](self, "_didStartActionForAceCommand:", v7);
  -[AFUISiriSession forceAudioSessionActive](self->_session, "forceAudioSessionActive");
  v8 = objc_msgSend(objc_alloc((Class)TLAlertConfiguration), "initWithType:", 2);
  objc_msgSend(v8, "setShouldIgnoreRingerSwitch:", 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[TLAlert alertWithConfiguration:](TLAlert, "alertWithConfiguration:", v8));
  objc_msgSend(v9, "setPlaybackObserver:", self);
  p_currentNotificationSound = &self->_currentNotificationSound;
  objc_storeStrong((id *)p_currentNotificationSound, a3);
  v11 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    v12 = *p_currentNotificationSound;
    v13 = 136315650;
    v14 = "-[SRSiriViewController siriSessionDidReceivePlayNotificationSound:completion:]";
    v15 = 2112;
    v16 = v9;
    v17 = 2112;
    v18 = v12;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%s Playing notification sound %@ for command %@ ", (uint8_t *)&v13, 0x20u);
  }
  objc_msgSend(v9, "playWithCompletionHandler:", &stru_100123750);

}

- (void)alertDidBeginPlaying:(id)a3
{
  id v4;
  NSObject *v5;
  dispatch_time_t v6;
  _QWORD v7[5];
  id v8;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  id v12;

  v4 = a3;
  v5 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v10 = "-[SRSiriViewController alertDidBeginPlaying:]";
    v11 = 2112;
    v12 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s Alert %@ began playing", buf, 0x16u);
  }
  objc_initWeak((id *)buf, self);
  v6 = dispatch_time(0, 1500000000);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100049560;
  v7[3] = &unk_100122660;
  objc_copyWeak(&v8, (id *)buf);
  v7[4] = self;
  dispatch_after(v6, (dispatch_queue_t)&_dispatch_main_q, v7);
  objc_destroyWeak(&v8);
  objc_destroyWeak((id *)buf);

}

- (void)siriSessionDidReceiveSayItCommand:(id)a3 completion:(id)a4
{
  id v7;
  void (**v8)(id, void *);
  NSString *addViewsRefId;
  void *v10;
  void *v11;
  unint64_t addViewsMode;
  NSObject *v13;
  uint64_t Name;
  void *v15;
  void (**v16)(id, void *);
  void *v17;
  NSObject *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  _QWORD v30[4];
  void (**v31)(id, void *);
  uint8_t buf[4];
  const char *v33;
  __int16 v34;
  void *v35;

  v7 = a3;
  v8 = (void (**)(id, void *))a4;
  addViewsRefId = self->_addViewsRefId;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "refId"));
  LODWORD(addViewsRefId) = -[NSString isEqualToString:](addViewsRefId, "isEqualToString:", v10);

  if ((_DWORD)addViewsRefId && self->_addViewsMode == 2)
  {
    v11 = (void *)AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
    {
      addViewsMode = self->_addViewsMode;
      v13 = v11;
      Name = MDModeGetName(addViewsMode);
      v15 = (void *)objc_claimAutoreleasedReturnValue(Name);
      *(_DWORD *)buf = 136315394;
      v33 = "-[SRSiriViewController siriSessionDidReceiveSayItCommand:completion:]";
      v34 = 2112;
      v35 = v15;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%s #modes Suppressing SayIt command because the mode is %@", buf, 0x16u);

    }
    if (v8)
    {
      v16 = (void (**)(id, void *))objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "refId"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[SACommandSucceeded sruif_commandSucceededWithRefId:](SACommandSucceeded, "sruif_commandSucceededWithRefId:", v16));
      v8[2](v8, v17);

LABEL_19:
      goto LABEL_20;
    }
    goto LABEL_20;
  }
  if (!self->_delaySessionEndForInPlacePunchout
    || !+[PrivacyDisclosureManager appRequiresPreflightWithAppBundleId:](_TtC4Siri24PrivacyDisclosureManager, "appRequiresPreflightWithAppBundleId:", CFSTR("com.apple.Maps")))
  {
    v22 = (void *)AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
    {
      v23 = v22;
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[SiriUIUtilities descriptionForSayIt:](SiriUIUtilities, "descriptionForSayIt:", v7));
      *(_DWORD *)buf = 136315394;
      v33 = "-[SRSiriViewController siriSessionDidReceiveSayItCommand:completion:]";
      v34 = 2112;
      v35 = v24;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "%s #modes %@", buf, 0x16u);

    }
    objc_storeStrong((id *)&self->_previousSayItCommand, a3);
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v30[2] = sub_100049A54;
    v30[3] = &unk_100123550;
    v31 = v8;
    -[SRSiriViewController _didReceiveAceCommand:completion:](self, "_didReceiveAceCommand:completion:", v7, v30);
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _session](self, "_session"));
    objc_msgSend(v25, "requestDidPresentViewForUICommand:", v7);

    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "audioData"));
    if (v26)
    {

    }
    else
    {
      v27 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "languageCode"));
      if (!v27)
        goto LABEL_18;
      v28 = (void *)v27;
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "message"));

      if (!v29)
        goto LABEL_18;
    }
    objc_storeStrong((id *)&self->_repeatableAudioSayit, a3);
LABEL_18:
    -[SRSiriViewController _performSayItCommand:](self, "_performSayItCommand:", v7);
    v16 = v31;
    goto LABEL_19;
  }
  v18 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v33 = "-[SRSiriViewController siriSessionDidReceiveSayItCommand:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%s #modes #punchout Suppressing SayIt command because we are delaying the TTS session for a Maps punchout and the user hasn't accepted the Maps privacy disclosure policy", buf, 0xCu);
  }
  if (v8)
  {
    v16 = (void (**)(id, void *))objc_alloc_init((Class)SACommandIgnored);
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "refId"));
    objc_msgSend(v16, "setRefId:", v19);

    v20 = objc_alloc_init((Class)NSUUID);
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "UUIDString"));
    objc_msgSend(v16, "setAceId:", v21);

    v8[2](v8, v16);
    goto LABEL_19;
  }
LABEL_20:

}

- (void)siriSessionDidReceiveRepeatItCommand:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *i;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  id obj;
  _QWORD v22[4];
  id v23;
  uint64_t *v24;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _QWORD v30[4];
  id v31;
  id v32;
  id location;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  id v37;
  _QWORD v38[4];
  id v39;
  _BYTE v40[128];

  v6 = a3;
  v7 = a4;
  -[SRSiriViewController _setListenAfterSpeakingForRequestFinished:](self, "_setListenAfterSpeakingForRequestFinished:", self->_listenAfterSpeakingForRepeatable);
  v38[0] = _NSConcreteStackBlock;
  v38[1] = 3221225472;
  v38[2] = sub_100049E8C;
  v38[3] = &unk_100123550;
  v19 = v7;
  v39 = v19;
  -[SRSiriViewController _didReceiveAceCommand:completion:](self, "_didReceiveAceCommand:completion:", v6, v38);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _session](self, "_session"));
  objc_msgSend(v8, "requestDidPresentViewForUICommand:", v6);

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _repeatablePhrases](self, "_repeatablePhrases"));
  v34 = 0;
  v35 = &v34;
  v36 = 0x2020000000;
  v37 = 0;
  v37 = objc_msgSend(v20, "count");
  if (self->_repeatableAudioSayit)
  {
    -[SRSiriViewController _performSayItCommand:](self, "_performSayItCommand:");
  }
  else if (v35[3])
  {
    -[SRSiriViewController _didStartActionForAceCommand:](self, "_didStartActionForAceCommand:", v6);
    objc_initWeak(&location, self);
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    obj = v20;
    v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v40, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(_QWORD *)v27 != v10)
            objc_enumerationMutation(obj);
          v12 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)i);
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "aceId"));
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "refId"));
          v22[0] = _NSConcreteStackBlock;
          v22[1] = 3221225472;
          v22[2] = sub_100049EE0;
          v22[3] = &unk_1001237A0;
          v24 = &v34;
          objc_copyWeak(&v25, &location);
          v23 = v6;
          -[SRSiriViewController _synthesizeText:identifier:sessionId:completion:](self, "_synthesizeText:identifier:sessionId:completion:", v12, v13, v14, v22);

          objc_destroyWeak(&v25);
        }
        v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v40, 16);
      }
      while (v9);
    }

    objc_destroyWeak(&location);
  }
  else
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "contingency"));

    if (v15)
    {
      -[SRSiriViewController _didStartActionForAceCommand:](self, "_didStartActionForAceCommand:", v6);
      objc_initWeak(&location, self);
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "contingency"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "aceId"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "refId"));
      v30[0] = _NSConcreteStackBlock;
      v30[1] = 3221225472;
      v30[2] = sub_100049EA0;
      v30[3] = &unk_100123778;
      objc_copyWeak(&v32, &location);
      v31 = v6;
      -[SRSiriViewController _synthesizeText:identifier:sessionId:completion:](self, "_synthesizeText:identifier:sessionId:completion:", v16, v17, v18, v30);

      objc_destroyWeak(&v32);
      objc_destroyWeak(&location);
    }
  }
  _Block_object_dispose(&v34, 8);

}

- (void)siriSessionDidReceiveShowHelpCommand:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  -[SRSiriViewController _setShowKeyboardIfTextInputEnabled:minimized:](self, "_setShowKeyboardIfTextInputEnabled:minimized:", 1, 1);
  -[SRSiriViewController _didReceiveAceCommand:completion:](self, "_didReceiveAceCommand:completion:", v7, v6);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _session](self, "_session"));
  objc_msgSend(v8, "requestDidPresentViewForUICommand:", v7);

  v9 = (id)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _activeConversation](self, "_activeConversation"));
  objc_msgSend(v9, "addItemsForShowHelpCommand:", v7);

}

- (void)siriSessionDidReceiveUpdateViewsCommand:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  char v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  id v14;

  v13 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
  v8 = objc_opt_respondsToSelector(v7, "prepareUpdateViewsCommandForConversation:");

  if ((v8 & 1) != 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
    v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "prepareUpdateViewsCommandForConversation:", v13));

    v11 = (id)v10;
  }
  else
  {
    v11 = v13;
  }
  v14 = v11;
  -[SRSiriViewController _didReceiveAceCommand:completion:](self, "_didReceiveAceCommand:completion:", v11, v6);
  -[SRSiriViewController _didStartActionForAceCommand:](self, "_didStartActionForAceCommand:", v14);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _activeConversation](self, "_activeConversation"));
  objc_msgSend(v12, "updateWithUpdateViewsCommand:", v14);

  -[SRSiriViewController _didCompleteActionForAceCommand:success:](self, "_didCompleteActionForAceCommand:success:", v14, 1);
}

- (void)siriSessionDidReceiveAppPunchOutCommand:(id)a3 completion:(id)a4
{
  id *v4;
  id *v5;
  id v8;
  id v9;
  id *v10;
  _QWORD *v11;
  _QWORD *v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = (id *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "aceId"));

  if (v10)
    -[SRSiriViewController _didReceiveAceCommand:](self, "_didReceiveAceCommand:", v8);
  objc_initWeak(&location, self);
  if (v9)
  {
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10004A238;
    v13[3] = &unk_1001237C8;
    v11 = v13;
    v10 = &v16;
    objc_copyWeak(&v16, &location);
    v4 = &v14;
    v14 = v8;
    v5 = &v15;
    v15 = v9;
  }
  else
  {
    v11 = 0;
  }
  v12 = objc_retainBlock(v11);
  -[SRSiriViewController _performAppPunchOutCommand:completion:](self, "_performAppPunchOutCommand:completion:", v8, v12);

  if (v9)
  {

    objc_destroyWeak(v10);
  }
  objc_destroyWeak(&location);

}

- (void)siriSessionDidReceiveCloseAssistantCommand:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  unsigned int v10;
  uint64_t v11;
  SRUIFSpeechSynthesizer *ttsManager;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18[2];
  id location;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v6, "reason", kdebug_trace(722468952, 0, 0, 0, 0).n128_f64[0]);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = objc_msgSend(v9, "isEqualToString:", SAUICloseAssistantReasonEMPTY_RECOGNITIONValue);

  if (v10)
    v11 = 53;
  else
    v11 = 10;
  objc_initWeak(&location, self);
  ttsManager = self->_ttsManager;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10004A498;
  v15[3] = &unk_100123818;
  objc_copyWeak(v18, &location);
  v13 = v7;
  v17 = v13;
  v14 = v6;
  v16 = v14;
  v18[1] = (id)v11;
  -[SRUIFSpeechSynthesizer isSynthesisQueueEmpty:](ttsManager, "isSynthesisQueueEmpty:", v15);

  objc_destroyWeak(v18);
  objc_destroyWeak(&location);

}

- (void)siriSessionDidReceiveListenForPronunciationCommand:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  SRUIFSpeechSynthesizer *ttsManager;
  void *v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  ttsManager = self->_ttsManager;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "aceId"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "refId"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10004A9B8;
  v13[3] = &unk_100123840;
  objc_copyWeak(&v16, &location);
  v11 = v6;
  v14 = v11;
  v12 = v7;
  v15 = v12;
  -[SRUIFSpeechSynthesizer enqueueText:identifier:sessionId:completion:](ttsManager, "enqueueText:identifier:sessionId:completion:", 0, v9, v10, v13);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

}

- (void)siriSessionDidReceiveSetSuggestedUtterancesCommand:(id)a3 completion:(id)a4
{
  void (**v6)(id, void *);
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  v6 = (void (**)(id, void *))a4;
  -[SRSiriViewController _didReceiveAceCommand:](self, "_didReceiveAceCommand:", v14);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
  v8 = objc_opt_respondsToSelector(v7, "updateSuggestedUtterances:forLanguage:");

  if ((v8 & 1) != 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "utterances"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "language"));
    objc_msgSend(v9, "updateSuggestedUtterances:forLanguage:", v10, v11);

  }
  if (v6)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "aceId"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[SACommandSucceeded sruif_commandSucceededWithRefId:](SACommandSucceeded, "sruif_commandSucceededWithRefId:", v12));
    v6[2](v6, v13);

  }
}

- (void)siriSessionDidReceiveGetResponseAlternativesPlaybackCommand:(id)a3 completion:(id)a4
{
  void (**v6)(id, void *);
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v6 = (void (**)(id, void *))a4;
  -[SRSiriViewController _didReceiveAceCommand:](self, "_didReceiveAceCommand:", v12);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
  v8 = objc_opt_respondsToSelector(v7, "handleGetResponseAlternativesPlayback:");

  if ((v8 & 1) != 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
    objc_msgSend(v9, "handleGetResponseAlternativesPlayback:", v12);

  }
  if (v6)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "aceId"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[SACommandSucceeded sruif_commandSucceededWithRefId:](SACommandSucceeded, "sruif_commandSucceededWithRefId:", v10));
    v6[2](v6, v11);

  }
}

- (void)siriSessionDidReceiveSAUIShowFullScreenEffectCommand:(id)a3 completion:(id)a4
{
  void (**v6)(id, void *);
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v6 = (void (**)(id, void *))a4;
  -[SRSiriViewController _didReceiveAceCommand:](self, "_didReceiveAceCommand:", v12);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
  v8 = objc_opt_respondsToSelector(v7, "showFullScreenEffect:");

  if ((v8 & 1) != 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
    objc_msgSend(v9, "showFullScreenEffect:", v12);

  }
  if (v6)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "aceId"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[SACommandSucceeded sruif_commandSucceededWithRefId:](SACommandSucceeded, "sruif_commandSucceededWithRefId:", v10));
    v6[2](v6, v11);

  }
}

- (void)siriSessionDidReceiveSAUIShowSpeechAlternativesCommand:(id)a3 completion:(id)a4
{
  void (**v6)(id, void *);
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v6 = (void (**)(id, void *))a4;
  -[SRSiriViewController _didReceiveAceCommand:](self, "_didReceiveAceCommand:", v12);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
  v8 = objc_opt_respondsToSelector(v7, "showSpeechAlternatives:");

  if ((v8 & 1) != 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
    objc_msgSend(v9, "showSpeechAlternatives:", v12);

  }
  if (v6)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "aceId"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[SACommandSucceeded sruif_commandSucceededWithRefId:](SACommandSucceeded, "sruif_commandSucceededWithRefId:", v10));
    v6[2](v6, v11);

  }
}

- (void)siriSessionDidReceiveSAUIShowRequestHandlingStatusCommand:(id)a3 completion:(id)a4
{
  void (**v6)(id, void *);
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned __int8 v12;
  uint64_t v13;
  void *v14;
  unsigned __int8 v15;
  void *v16;
  unsigned int v17;
  void *v18;
  void *v19;
  id v20;

  v20 = a3;
  v6 = (void (**)(id, void *))a4;
  -[SRSiriViewController _didReceiveAceCommand:](self, "_didReceiveAceCommand:", v20);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
  v8 = objc_opt_respondsToSelector(v7, "showRequestHandlingStatus:");

  if ((v8 & 1) != 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
    objc_msgSend(v9, "showRequestHandlingStatus:", v20);
  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "requestHandlingStatus"));

    if (!v10)
      goto LABEL_13;
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "requestHandlingStatus"));
    v12 = objc_msgSend(v11, "isEqualToString:", SAUIShowRequestHandlingStatusRequestHandlingStatusASR_NL_ON_SERVERValue);

    if ((v12 & 1) != 0)
    {
      v13 = 1;
    }
    else
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "requestHandlingStatus"));
      v15 = objc_msgSend(v14, "isEqualToString:", SAUIShowRequestHandlingStatusRequestHandlingStatusASR_ON_DEVICE_NL_ON_SERVERValue);

      if ((v15 & 1) != 0)
      {
        v13 = 2;
      }
      else
      {
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "requestHandlingStatus"));
        v17 = objc_msgSend(v16, "isEqualToString:", SAUIShowRequestHandlingStatusRequestHandlingStatusASR_NL_ON_DEVICEValue);

        if (v17)
          v13 = 3;
        else
          v13 = 0;
      }
    }
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _host](self, "_host"));
    objc_msgSend(v9, "setRequestHandlingStatus:", v13);
  }

LABEL_13:
  if (v6)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "aceId"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[SACommandSucceeded sruif_commandSucceededWithRefId:](SACommandSucceeded, "sruif_commandSucceededWithRefId:", v18));
    v6[2](v6, v19);

  }
}

- (void)siriSessionDidReceiveSAUIChangePrimaryUtteranceCommand:(id)a3 completion:(id)a4
{
  void (**v6)(id, void *);
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v6 = (void (**)(id, void *))a4;
  -[SRSiriViewController _didReceiveAceCommand:](self, "_didReceiveAceCommand:", v12);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
  v8 = objc_opt_respondsToSelector(v7, "changeUtterance:");

  if ((v8 & 1) != 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
    objc_msgSend(v9, "changeUtterance:", v12);

  }
  if (v6)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "aceId"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[SACommandSucceeded sruif_commandSucceededWithRefId:](SACommandSucceeded, "sruif_commandSucceededWithRefId:", v10));
    v6[2](v6, v11);

  }
}

- (void)siriSessionDidReceiveSetUIGuidedAccessCommand:(id)a3 completion:(id)a4
{
  void (**v6)(id, id);
  unsigned int v7;
  uint64_t Availability;
  uint64_t v9;
  uint64_t v10;
  const __CFString *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a3;
  v6 = (void (**)(id, id))a4;
  if ((objc_msgSend(v17, "toggle") & 1) != 0)
    v7 = 0;
  else
    v7 = objc_msgSend(v17, "value") ^ 1;
  if ((objc_msgSend(v17, "dryRun") & 1) != 0 || v7)
  {
    v12 = objc_alloc_init((Class)SACommandFailed);
    objc_msgSend(v12, "setErrorCode:", SASettingValueUnchangedErrorCode);
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Guided Access is already off")));
    objc_msgSend(v12, "setReason:", v13);

  }
  else
  {
    Availability = ((uint64_t (*)(void))AXGuidedAccessGetAvailability)();
    if (!_AXSGuidedAccessEnabled())
    {
      _AXSTripleClickAddOption(7);
      v9 = _AXSGuidedAccessSetEnabled(1);
      Availability = AXGuidedAccessGetAvailability(v9);
    }
    switch(Availability)
    {
      case 0:
        -[SRSiriViewController _didReceiveAceCommand:](self, "_didReceiveAceCommand:", v17);
        v12 = objc_alloc_init((Class)SACommandSucceeded);
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "aceId"));
        objc_msgSend(v12, "setRefId:", v15);

        if (v6)
          v6[2](v6, v12);
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _hostWithErrorHandler:](self, "_hostWithErrorHandler:", &stru_100123860));
        objc_msgSend(v16, "serviceStartGuidedAccess");

        goto LABEL_15;
      case 1:
      case 2:
      case 4:
      case 5:
      case 6:
      case 12:
      case 14:
        v10 = SASettingGuidedAccessTemporarilyUnavailableErrorCode;
        v11 = CFSTR("Guided Access not available Right Now");
        goto LABEL_12;
      case 3:
        v10 = SASettingGuidedAccessUnavailableInRestoreOrUpdateErrorCode;
        v11 = CFSTR("Guided Access not available while restoring or updating");
        goto LABEL_12;
      case 7:
      case 8:
      case 9:
      case 10:
      case 13:
        v10 = SASettingGuidedAccessUnavailableForAppErrorCode;
        v11 = CFSTR("Guided Access can not be started over this application");
        goto LABEL_12;
      case 11:
        v10 = SASettingGuidedAccessPasscodeRequiredErrorCode;
        v11 = CFSTR("Guided Access requires a pin code to be set.");
        goto LABEL_12;
      default:
        v10 = -1;
        v11 = CFSTR("Guided Access failed for an unknown reason.");
LABEL_12:
        -[SRSiriViewController _didReceiveAceCommand:](self, "_didReceiveAceCommand:", v17);
        v12 = objc_alloc_init((Class)SACommandFailed);
        objc_msgSend(v12, "setErrorCode:", v10);
        objc_msgSend(v12, "setReason:", v11);
        break;
    }
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "aceId"));
  objc_msgSend(v12, "setRefId:", v14);

  if (v6)
    v6[2](v6, v12);
LABEL_15:

}

- (void)siriSessionDidReceiveHideSiriOverlayCommand:(id)a3 completion:(id)a4
{
  void (**v6)(id, id);
  void *v7;
  char v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;

  v13 = a3;
  v6 = (void (**)(id, id))a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
  v8 = objc_opt_respondsToSelector(v7, "dismissRecordingOverlayAndHideSnippets:");

  if ((v8 & 1) != 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
    objc_msgSend(v9, "dismissRecordingOverlayAndHideSnippets:", objc_msgSend(v13, "hideSnippets"));

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _session](self, "_session"));
    objc_msgSend(v10, "requestDidPresentViewForUICommand:", v13);

    if (v6)
    {
      v11 = objc_alloc_init((Class)SACommandSucceeded);
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "aceId"));
      objc_msgSend(v11, "setRefId:", v12);

      v6[2](v6, v11);
    }
  }

}

- (void)siriSessionDidReceiveAddContentToViewCommand:(id)a3 completion:(id)a4
{
  void (**v6)(id, id);
  void *v7;
  char v8;
  void *v9;
  unsigned int v10;
  id v11;
  void *v12;
  id v13;

  v13 = a3;
  v6 = (void (**)(id, id))a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
  v8 = objc_opt_respondsToSelector(v7, "siriDidReceiveAdditionalContent:");

  if ((v8 & 1) != 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
    v10 = objc_msgSend(v9, "siriDidReceiveAdditionalContent:", v13);

    if (v10)
    {
      v11 = objc_alloc_init((Class)SACommandSucceeded);
    }
    else
    {
      v11 = objc_alloc_init((Class)SACommandFailed);
      objc_msgSend(v11, "setReason:", CFSTR("The target view could either not be found, was not eligible, or couldn't be delivered the payload"));
    }
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "aceId"));
    objc_msgSend(v11, "setRefId:", v12);

    if (v6)
      v6[2](v6, v11);

  }
}

- (void)siriSessionDidReceiveGuideUpdateCommand:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[AFUIGuideCacheManager sharedManager](AFUIGuideCacheManager, "sharedManager"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10004B6C4;
  v10[3] = &unk_100123888;
  v11 = v5;
  v12 = v6;
  v8 = v5;
  v9 = v6;
  objc_msgSend(v7, "updateCacheWithGuideUpdate:completion:", v8, v10);

}

- (void)siriSessionDidReceiveShowNextCardCommand:(id)a3 completion:(id)a4
{
  void (**v5)(id, id);
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;

  v10 = a3;
  v5 = (void (**)(id, id))a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[SRUIFCardLoadingMonitor sharedInstance](SRUIFCardLoadingMonitor, "sharedInstance"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "cardSnippet"));
  objc_msgSend(v6, "broadcastCardSnippet:", v7);

  if (v5)
  {
    v8 = objc_alloc_init((Class)SACommandSucceeded);
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "aceId"));
    objc_msgSend(v8, "setRefId:", v9);

    v5[2](v5, v8);
  }

}

- (void)siriSessionDidReceiveShowNextSnippetCommand:(id)a3 completion:(id)a4
{
  void (**v5)(id, void *);
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v5 = (void (**)(id, void *))a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[SRUIFCardLoadingMonitor sharedInstance](SRUIFCardLoadingMonitor, "sharedInstance"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "visualResponse"));
  objc_msgSend(v6, "broadcastVisualResponseSnippet:", v7);

  if (v5)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "aceId"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[SACommandSucceeded sruif_commandSucceededWithRefId:](SACommandSucceeded, "sruif_commandSucceededWithRefId:", v8));
    v5[2](v5, v9);

  }
}

- (void)siriSessionDidReceiveUpdateVisualResponseSnippetCommand:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, uint64_t);
  void *v8;
  char v9;
  void *v10;
  id v11;
  void *v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  void *v20;
  int v21;
  const char *v22;
  __int16 v23;
  id v24;
  __int16 v25;
  void *v26;

  v6 = a3;
  v7 = (void (**)(id, uint64_t))a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
  v9 = objc_opt_respondsToSelector(v8, "didReceiveUpdateVisualResponseCommand:");

  if ((v9 & 1) != 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
    v11 = objc_msgSend(v10, "didReceiveUpdateVisualResponseCommand:", v6);

    v12 = (void *)AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
    {
      v13 = v12;
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "viewId"));
      v15 = NSStringFromBOOL(v11);
      v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
      v21 = 136315650;
      v22 = "-[SRSiriViewController siriSessionDidReceiveUpdateVisualResponseSnippetCommand:completion:]";
      v23 = 2112;
      v24 = v14;
      v25 = 2112;
      v26 = v16;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%s command with viewId: %@ handled by presentation: %@", (uint8_t *)&v21, 0x20u);

    }
    -[SRSiriViewController _logAceObjectPresented:dialogPhase:](self, "_logAceObjectPresented:dialogPhase:", v6, 0);
    if (v7)
    {
      if ((_DWORD)v11)
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "aceId"));
        v18 = objc_claimAutoreleasedReturnValue(+[SACommandSucceeded sruif_commandSucceededWithRefId:](SACommandSucceeded, "sruif_commandSucceededWithRefId:", v17));
LABEL_11:
        v20 = (void *)v18;
        v7[2](v7, v18);

        goto LABEL_12;
      }
LABEL_10:
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "aceId"));
      v18 = objc_claimAutoreleasedReturnValue(+[SACommandFailed sruif_commandFailedWithRefId:](SACommandFailed, "sruif_commandFailedWithRefId:", v17));
      goto LABEL_11;
    }
  }
  else
  {
    v19 = AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
    {
      v21 = 136315394;
      v22 = "-[SRSiriViewController siriSessionDidReceiveUpdateVisualResponseSnippetCommand:completion:]";
      v23 = 2112;
      v24 = v6;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%s presentation does not implement didReceiveUpdateVisualResponseCommand for command:%@", (uint8_t *)&v21, 0x16u);
    }
    if (v7)
      goto LABEL_10;
  }
LABEL_12:

}

- (void)siriSessionDidReceivePreSynthesizeTTSCommand:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  id location;

  v6 = a3;
  v7 = a4;
  v8 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
    sub_10009F560(v8, v9, v10, v11, v12, v13, v14, v15);
  objc_initWeak(&location, self);
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10004BCBC;
  v18[3] = &unk_100123640;
  objc_copyWeak(&v21, &location);
  v16 = v6;
  v19 = v16;
  v17 = v7;
  v20 = v17;
  SiriUIInvokeOnMainQueue(v18);

  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);

}

- (void)siriSessionDidReceiveDisambiguationItemSelected:(id)a3 completion:(id)a4
{
  void (**v5)(id, void *);
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v5 = (void (**)(id, void *))a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[AFUIDisambiguationAnalyticsManager sharedManager](AFUIDisambiguationAnalyticsManager, "sharedManager"));
  objc_msgSend(v6, "logDisambiguationItemSelected:", v9);

  if (v5)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "refId"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[SACommandSucceeded sruif_commandSucceededWithRefId:](SACommandSucceeded, "sruif_commandSucceededWithRefId:", v7));
    v5[2](v5, v8);

  }
}

- (void)siriSessionSpeechRecordingDidChangeAVRecordRoute:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  -[SRSiriViewController _setCurrentAVRecordRoute:](self, "_setCurrentAVRecordRoute:");
  objc_msgSend(UIApp, "finishedIPTest:", SUICPPTTestNameSiriBringupTVSyntheticSpeechCapturedToSpeechRecording);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
  v5 = objc_opt_respondsToSelector(v4, "speechRecordingDidBeginOnRecordRoute:");

  if ((v5 & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
    objc_msgSend(v6, "speechRecordingDidBeginOnRecordRoute:", v7);

  }
}

- (void)siriSessionSpeechRecordingDidEnd
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  id v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
  v4 = objc_opt_respondsToSelector(v3, "speechRecordingDidEndForRequest:onAVRecordRoute:");

  if ((v4 & 1) != 0)
  {
    v7 = (id)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _requestOptions](self, "_requestOptions"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _currentAVRecordRoute](self, "_currentAVRecordRoute"));
    objc_msgSend(v7, "speechRecordingDidEndForRequest:onAVRecordRoute:", v5, v6);

  }
}

- (void)siriSessionSpeechRecordingDidCancel
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  id v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
  v4 = objc_opt_respondsToSelector(v3, "speechRecordingDidCancelForRequest:onAVRecordRoute:");

  if ((v4 & 1) != 0)
  {
    v7 = (id)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _requestOptions](self, "_requestOptions"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _currentAVRecordRoute](self, "_currentAVRecordRoute"));
    objc_msgSend(v7, "speechRecordingDidCancelForRequest:onAVRecordRoute:", v5, v6);

  }
}

- (void)siriSessionSpeechRecordingDidFailWithError:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
  v5 = objc_opt_respondsToSelector(v4, "speechRecordingDidFailForRequest:onAVRecordRoute:withError:");

  if ((v5 & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _requestOptions](self, "_requestOptions"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _currentAVRecordRoute](self, "_currentAVRecordRoute"));
    objc_msgSend(v6, "speechRecordingDidFailForRequest:onAVRecordRoute:withError:", v7, v8, v9);

  }
}

- (BOOL)siriSessionShouldRequestUpdateForViewWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  unsigned __int8 v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _activeConversation](self, "_activeConversation"));
  v6 = objc_msgSend(v5, "containsItemForAceViewWithIdentifier:", v4);

  return v6;
}

- (void)siriSessionDidDetectMusic
{
  void *v3;
  char v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
  v4 = objc_opt_respondsToSelector(v3, "siriDidDetectMusic");

  if ((v4 & 1) != 0)
  {
    v5 = (id)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
    objc_msgSend(v5, "siriDidDetectMusic");

  }
}

- (void)siriSessionDidDetectSpeechStartpoint
{
  void *v3;
  char v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
  v4 = objc_opt_respondsToSelector(v3, "speechRecordingDidDetectSpeechStartpoint");

  if ((v4 & 1) != 0)
  {
    v5 = (id)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
    objc_msgSend(v5, "speechRecordingDidDetectSpeechStartpoint");

  }
}

- (void)siriSessionDidUpdateAudioSessionID:(unsigned int)a3
{
  uint64_t v3;
  NSObject *v5;
  void *v6;
  unsigned int v7;
  int v8;
  const char *v9;
  __int16 v10;
  int v11;

  v3 = *(_QWORD *)&a3;
  v5 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 136315394;
    v9 = "-[SRSiriViewController siriSessionDidUpdateAudioSessionID:]";
    v10 = 1024;
    v11 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s #tts 4 %u", (uint8_t *)&v8, 0x12u);
  }
  -[SRUIFSpeechSynthesizer setAudioSessionID:](self->_ttsManager, "setAudioSessionID:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _requestOptions](self, "_requestOptions"));
  v7 = objc_msgSend(v6, "isForBluetoothCar");

  if (v7)
    -[SRUIFSpeechSynthesizer prewarmIfNeeded](self->_ttsManager, "prewarmIfNeeded");
}

- (void)siriSessionDidReceiveAudioSessionInterruptionBeganWithUserInfo:(id)a3 machAbsoluteTime:(unint64_t)a4
{
  void *v6;
  id v7;
  void *v8;
  id v9;

  v9 = objc_alloc_init((Class)SISchemaPNRFatalErrorInfo);
  objc_msgSend(v9, "setErrorDomain:", kAFAssistantErrorDomain);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%ld"), 48));
  objc_msgSend(v9, "setErrorCode:", v6);

  v7 = objc_alloc_init((Class)SISchemaPNRFatalError);
  objc_msgSend(v7, "setError:", v9);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _instrumentationManager](self, "_instrumentationManager"));
  objc_msgSend(v8, "emitInstrumentation:atTime:", v7, a4);

}

- (void)siriSessionRequestsPlayPhaticWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  SRUIFSpeechSynthesizer *ttsManager;
  id v7;
  _QWORD v8[4];
  id v9;
  uint8_t buf[4];
  const char *v11;

  v4 = a3;
  v5 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v11 = "-[SRSiriViewController siriSessionRequestsPlayPhaticWithCompletion:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s #phatic 5", buf, 0xCu);
  }
  ttsManager = self->_ttsManager;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10004C638;
  v8[3] = &unk_100123450;
  v9 = v4;
  v7 = v4;
  -[SRUIFSpeechSynthesizer enqueuePhaticWithCompletion:](ttsManager, "enqueuePhaticWithCompletion:", v8);

}

- (void)siriSessionRequestTwoShotWasRecognized
{
  NSObject *v3;
  int v4;
  const char *v5;

  if (AFDeviceSupportsSystemAssistantExperience(self, a2))
  {
    v3 = AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
    {
      v4 = 136315138;
      v5 = "-[SRSiriViewController siriSessionRequestTwoShotWasRecognized]";
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s #suggestions two-shot signal was recognized", (uint8_t *)&v4, 0xCu);
    }
    -[SRSiriViewController _showStarterSuggestionsIfTwoShot](self, "_showStarterSuggestionsIfTwoShot");
  }
}

- (void)siriSessionWillShowAudioRoutePicker
{
  -[SRSiriViewController _setShowKeyboardIfTextInputEnabled:](self, "_setShowKeyboardIfTextInputEnabled:", 0);
}

- (void)siriSessionWillDismissAudioRoutePicker
{
  -[SRSiriViewController _setShowKeyboardIfTextInputEnabled:](self, "_setShowKeyboardIfTextInputEnabled:", 1);
}

- (void)siriSessionDidInitializeSessionInfo:(id)a3
{
  id v5;

  v5 = a3;
  objc_storeStrong((id *)&self->_siriSessionInfo, a3);
  if ((objc_opt_respondsToSelector(self->_presentation, "siriSessionDidInitializeSessionInfo:") & 1) != 0)
    -[SiriUIPresentation siriSessionDidInitializeSessionInfo:](self->_presentation, "siriSessionDidInitializeSessionInfo:", v5);

}

- (void)siriSessionDidUpdateSessionInfo:(id)a3
{
  id v4;

  v4 = a3;
  -[SRUIFSiriSessionInfo applyInfo:](self->_siriSessionInfo, "applyInfo:");
  if ((objc_opt_respondsToSelector(self->_presentation, "siriSessionDidUpdateSessionInfo:") & 1) != 0)
    -[SiriUIPresentation siriSessionDidUpdateSessionInfo:](self->_presentation, "siriSessionDidUpdateSessionInfo:", v4);

}

- (void)siriSessionDidReceivePlayContentCommand:(id)a3 completion:(id)a4
{
  id v6;
  id v7;

  v7 = a3;
  v6 = a4;
  if ((objc_opt_respondsToSelector(self->_presentation, "handlePlayContentCommand:completion:") & 1) != 0)
    -[SiriUIPresentation handlePlayContentCommand:completion:](self->_presentation, "handlePlayContentCommand:completion:", v7, v6);

}

- (void)siriSessionDidReceiveLaunchTVRemoteCommand:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  id v17;

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "hashedRouteId"));
  v8 = objc_msgSend(objc_alloc((Class)NSData), "initWithBase64EncodedString:options:", v7, 0);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10004CA5C;
  v13[3] = &unk_1001238D8;
  v14 = objc_alloc_init((Class)AFSecurityConnection);
  v15 = v7;
  v16 = v5;
  v17 = v6;
  v9 = v5;
  v10 = v6;
  v11 = v7;
  v12 = v14;
  objc_msgSend(v12, "processData:usingProcedure:completion:", v8, 2, v13);

}

- (void)siriSessionDidReceiveSnippetConfigurationRequestCommand:(id)a3 completion:(id)a4
{
  void (**v6)(id, id);
  id v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  unsigned int v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  int IsRTL;
  _QWORD *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;

  v6 = (void (**)(id, id))a4;
  v7 = a3;
  v31 = objc_alloc_init((Class)SAUISize);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController presentation](self, "presentation"));
  if ((objc_opt_respondsToSelector(v8, "maxSizeForSnippet") & 1) != 0)
  {
    objc_msgSend(v8, "maxSizeForSnippet");
    v10 = v9;
    v12 = v11;
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController view](self, "view"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "traitCollection"));
    v15 = objc_msgSend(v14, "isAmbientPresented");

    if (v15)
      v10 = v10 / SiriSharedUICompactAmbientContentScaleAmount;
    objc_msgSend(v31, "setWidth:", (uint64_t)v10);
    objc_msgSend(v31, "setHeight:", (uint64_t)v12);
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIWindow _applicationKeyWindow](UIWindow, "_applicationKeyWindow"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "windowScene"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "screen"));
    objc_msgSend(v18, "scale");
    objc_msgSend(v31, "setScale:");

  }
  v19 = objc_alloc_init((Class)SAUISnippetDisplayConfigurationResponse);
  objc_msgSend(v19, "setEstimatedVisibleSnippetDisplaySize:", v31);
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "aceId"));

  objc_msgSend(v19, "setRefId:", v20);
  objc_msgSend(v19, "setAccessibilityDifferentiateWithoutColor:", UIAccessibilityShouldDifferentiateWithoutColor());
  objc_msgSend(v19, "setAccessibilityInvertColors:", UIAccessibilityIsInvertColorsEnabled());
  objc_msgSend(v19, "setAccessibilityReduceMotion:", UIAccessibilityIsReduceMotionEnabled());
  v21 = objc_msgSend(v19, "setAccessibilityReduceTransparency:", UIAccessibilityIsReduceTransparencyEnabled());
  IsRTL = SiriSharedUILanguageIsRTL(v21);
  v23 = &SAUITextDirectionRightToLeftValue;
  if (!IsRTL)
    v23 = &SAUITextDirectionLeftToRightValue;
  objc_msgSend(v19, "setTextDirection:", *v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentationViewController](self, "_presentationViewController"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "traitCollection"));

  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "aceDisplayColorScheme"));
  objc_msgSend(v19, "setDisplayColorScheme:", v26);

  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "aceDisplayColorGamut"));
  objc_msgSend(v19, "setDisplayGamut:", v27);

  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "aceDynamicTypeSize"));
  objc_msgSend(v19, "setDynamicTypeSize:", v28);

  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "aceTextLegibilityWeight"));
  objc_msgSend(v19, "setTextLegibilityWeight:", v29);

  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "aceDisplayContrast"));
  objc_msgSend(v19, "setDisplayContrast:", v30);

  v6[2](v6, v19);
}

- (void)siriPresentation:(id)a3 requestHostBlurVisible:(BOOL)a4 reason:(int64_t)a5 fence:(id)a6
{
  _BOOL8 v8;
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  int v14;
  const char *v15;

  v8 = a4;
  v10 = a3;
  v11 = a6;
  if (a5 == 2 && -[SRSiriSystemUIController presentingSystemUI](self->_systemUIController, "presentingSystemUI"))
  {
    v12 = AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
    {
      v14 = 136315138;
      v15 = "-[SRSiriViewController siriPresentation:requestHostBlurVisible:reason:fence:]";
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%s #SystemAperture - Not blurring the lock screen for content presentation", (uint8_t *)&v14, 0xCu);
    }
  }
  else
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _host](self, "_host"));
    objc_msgSend(v13, "requestHostBlurVisible:reason:fence:", v8, a5, v11);

  }
}

- (void)siriPresentation:(id)a3 reduceOrbOpacity:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  char v7;
  id v8;

  v4 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _host](self, "_host", a3));
  v7 = objc_opt_respondsToSelector(v6, "reduceOrbOpacity:");

  if ((v7 & 1) != 0)
  {
    v8 = (id)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _host](self, "_host"));
    objc_msgSend(v8, "reduceOrbOpacity:", v4);

  }
}

- (void)conversation:(id)a3 didChangeWithTransaction:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];

  v6 = a3;
  v7 = a4;
  v8 = (id)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _activeConversation](self, "_activeConversation"));

  if (v8 == v6)
    -[SRSiriViewController _deletePreviousConversation](self, "_deletePreviousConversation");
  v9 = objc_alloc_init((Class)NSArray);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "insertedItemIndexPaths"));

  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "insertedItemIndexPaths"));
    v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "arrayByAddingObjectsFromArray:", v11));

    v9 = (id)v12;
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "updatedItemIndexPaths"));

  if (v13)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "updatedItemIndexPaths"));
    v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "arrayByAddingObjectsFromArray:", v14));

    v9 = (id)v15;
  }
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v16 = v9;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v26;
    do
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v26 != v19)
          objc_enumerationMutation(v16);
        -[SRSiriViewController _didStartActionForItemAtIndexPath:inConversation:](self, "_didStartActionForItemAtIndexPath:inConversation:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)v20), v6, (_QWORD)v25);
        v20 = (char *)v20 + 1;
      }
      while (v18 != v20);
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v18);
  }

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
  -[SRUIFAnalyticsSupplement storeDialogPhasesForItemsAtIndexPaths:forConversation:](self->_analyticsSupplement, "storeDialogPhasesForItemsAtIndexPaths:forConversation:", v16, v6);
  if (-[SRSiriViewController _presentationSupportsConversationDidChangeWithTransaction:](self, "_presentationSupportsConversationDidChangeWithTransaction:", v21))
  {
    objc_msgSend(v21, "conversation:didChangeWithTransaction:", v6, v7);
  }
  else
  {
    if ((objc_opt_respondsToSelector(v21, "conversation:didUpdateItemsAtIndexPaths:") & 1) != 0)
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "updatedItemIndexPaths"));
      if (objc_msgSend(v22, "count"))
        objc_msgSend(v21, "conversation:didUpdateItemsAtIndexPaths:", v6, v22);

    }
    if ((objc_opt_respondsToSelector(v21, "conversation:didInsertItemsAtIndexPaths:") & 1) != 0)
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "insertedItemIndexPaths"));
      if (objc_msgSend(v23, "count"))
        objc_msgSend(v21, "conversation:didInsertItemsAtIndexPaths:", v6, v23);

    }
    if ((objc_opt_respondsToSelector(v21, "conversation:didChangePresentationStateForItemsAtIndexPaths:") & 1) != 0)
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "presentationStateChangedItemIndexPaths"));
      if (objc_msgSend(v24, "count"))
        objc_msgSend(v21, "conversation:didChangePresentationStateForItemsAtIndexPaths:", v6, v24);

    }
  }

}

- (BOOL)_presentationSupportsConversationDidChangeWithTransaction:(id)a3
{
  return objc_opt_respondsToSelector(a3, "conversation:didChangeWithTransaction:") & 1;
}

- (void)conversation:(id)a3 didRemoveItemsWithIdentifiers:(id)a4 atIndexPaths:(id)a5 parentItemIdentifiers:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;

  v15 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = (id)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _activeConversation](self, "_activeConversation"));

  if (v13 == v15)
    -[SRSiriViewController _deletePreviousConversation](self, "_deletePreviousConversation");
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
  if ((objc_opt_respondsToSelector(v14, "conversation:didRemoveItemsWithIdentifiers:atIndexPaths:parentItemIdentifiers:") & 1) != 0)objc_msgSend(v14, "conversation:didRemoveItemsWithIdentifiers:atIndexPaths:parentItemIdentifiers:", v15, v10, v11, v12);

}

- (void)siriSessionDidReceiveExtendCurrentTTSCommand:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  const char *v12;

  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  self->_delaySessionEndForInPlacePunchout = 1;
  v8 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 136315138;
    v12 = "-[SRSiriViewController siriSessionDidReceiveExtendCurrentTTSCommand:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s #punchout received request to delay current session end for In Place Punchout", (uint8_t *)&v11, 0xCu);
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "aceId"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[SACommandSucceeded sruif_commandSucceededWithRefId:](SACommandSucceeded, "sruif_commandSucceededWithRefId:", v9));
  v7[2](v7, v10);

}

- (void)siriSessionDidReceiveRevealRecognizedSpeechCommand:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, uint64_t);
  void *v8;
  char v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  int v15;
  const char *v16;
  __int16 v17;
  id v18;

  v6 = a3;
  v7 = (void (**)(id, uint64_t))a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
  v9 = objc_opt_respondsToSelector(v8, "didReceiveRevealRecognizedSpeechCommand:");

  if ((v9 & 1) != 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
    objc_msgSend(v10, "didReceiveRevealRecognizedSpeechCommand:", v6);

    -[SRSiriViewController _logAceObjectPresented:dialogPhase:](self, "_logAceObjectPresented:dialogPhase:", v6, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "aceId"));
    v12 = objc_claimAutoreleasedReturnValue(+[SACommandSucceeded sruif_commandSucceededWithRefId:](SACommandSucceeded, "sruif_commandSucceededWithRefId:", v11));
  }
  else
  {
    v13 = AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
    {
      v15 = 136315394;
      v16 = "-[SRSiriViewController siriSessionDidReceiveRevealRecognizedSpeechCommand:completion:]";
      v17 = 2112;
      v18 = v6;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%s presentation does not implement didReceiveRevealRecognizedSpeechCommand for command:%@", (uint8_t *)&v15, 0x16u);
    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "aceId"));
    v12 = objc_claimAutoreleasedReturnValue(+[SACommandFailed sruif_commandFailedWithRefId:](SACommandFailed, "sruif_commandFailedWithRefId:", v11));
  }
  v14 = (void *)v12;
  v7[2](v7, v12);

  -[SRSiriViewController _logRevealSpeechCommandReceived:](self, "_logRevealSpeechCommandReceived:", v6);
}

- (void)siriSessionDidReceivePaginateListCommand:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  int v14;
  const char *v15;
  __int16 v16;
  id v17;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
  v9 = objc_opt_respondsToSelector(v8, "didReceivePaginateListCommand:completion:");

  if ((v9 & 1) != 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
    objc_msgSend(v10, "didReceivePaginateListCommand:completion:", v6, v7);

    -[SRSiriViewController _logAceObjectPresented:dialogPhase:](self, "_logAceObjectPresented:dialogPhase:", v6, 0);
  }
  else
  {
    v11 = AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
    {
      v14 = 136315394;
      v15 = "-[SRSiriViewController siriSessionDidReceivePaginateListCommand:completion:]";
      v16 = 2112;
      v17 = v6;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%s presentation does not implement didReceivePaginateListCommand for command:%@", (uint8_t *)&v14, 0x16u);
    }
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "aceId"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[SACommandFailed sruif_commandFailedWithRefId:](SACommandFailed, "sruif_commandFailedWithRefId:", v12));
    (*((void (**)(id, void *))v7 + 2))(v7, v13);

  }
}

- (int64_t)siriStateForSiriPresentation:(id)a3
{
  return self->_siriState;
}

- (int64_t)siriPresentationStateForSiriPresentation:(id)a3
{
  return self->_presentationState;
}

- (id)conversationIdentifiersForSiriPresentation:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _conversations](self, "_conversations", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v3, "count")));
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)v9), "identifier", (_QWORD)v12));
        objc_msgSend(v4, "addObject:", v10);

        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  return v4;
}

- (id)siriPresentation:(id)a3 conversationWithIdentifier:(id)a4
{
  return -[SRSiriViewController _conversationWithIdentifier:](self, "_conversationWithIdentifier:", a4);
}

- (void)siriPresentation:(id)a3 deleteConversationWithIdentifier:(id)a4
{
  -[SRSiriViewController _deleteConversationWithIdentifier:](self, "_deleteConversationWithIdentifier:", a4);
}

- (void)siriPresentation:(id)a3 activateConversationWithIdentifier:(id)a4
{
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _conversationWithIdentifier:](self, "_conversationWithIdentifier:", a4));
  -[SRSiriViewController _activateConversation:](self, "_activateConversation:", v5);

}

- (id)siriPresentation:(id)a3 identifierOfItemAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _activeConversation](self, "_activeConversation"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "identifierOfItemAtIndexPath:", v5));

  return v7;
}

- (id)siriPresentation:(id)a3 indexPathForItemWithIdentifier:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _activeConversation](self, "_activeConversation"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "indexPathForItemWithIdentifier:", v5));

  return v7;
}

- (id)_activeConversationItemAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _activeConversation](self, "_activeConversation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "itemAtIndexPath:", v4));

  return v6;
}

- (int64_t)siriPresentation:(id)a3 typeOfItemAtIndexPath:(id)a4
{
  void *v4;
  char *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _activeConversationItemAtIndexPath:](self, "_activeConversationItemAtIndexPath:", a4));
  v5 = (char *)objc_msgSend(v4, "type");

  if ((unint64_t)(v5 - 1) >= 5)
    return 0;
  else
    return (int64_t)v5;
}

- (int64_t)siriPresentation:(id)a3 numberOfChildrenForItemAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  id v7;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _activeConversation](self, "_activeConversation"));
  v7 = objc_msgSend(v6, "numberOfChildrenForItemAtIndexPath:", v5);

  return (int64_t)v7;
}

- (id)siriPresentation:(id)a3 aceObjectForItemAtIndexPath:(id)a4
{
  void *v4;
  void *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _activeConversationItemAtIndexPath:](self, "_activeConversationItemAtIndexPath:", a4));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "aceObject"));

  return v5;
}

- (id)siriPresentation:(id)a3 aceCommandIdentifierForItemAtIndexPath:(id)a4
{
  void *v4;
  void *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _activeConversationItemAtIndexPath:](self, "_activeConversationItemAtIndexPath:", a4));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "aceCommandIdentifier"));

  return v5;
}

- (id)siriPresentation:(id)a3 dialogPhaseForItemAtIndexPath:(id)a4
{
  return -[SRSiriViewController _dialogPhaseForItemAtIndexPath:](self, "_dialogPhaseForItemAtIndexPath:", a4);
}

- (void)siriPresentation:(id)a3 insertAceViews:(id)a4 withDialogPhase:(id)a5 asItemsAtIndexPaths:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;

  v9 = a6;
  v10 = a5;
  v11 = a4;
  v12 = (id)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _activeConversation](self, "_activeConversation"));
  objc_msgSend(v12, "insertItemsForAceViews:withDialogPhase:atIndexPaths:", v11, v10, v9);

}

- (void)siriPresentation:(id)a3 removeItemsAtIndexPaths:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _activeConversation](self, "_activeConversation"));
  objc_msgSend(v6, "removeItemsAtIndexPaths:", v5);

}

- (void)siriPresentation:(id)a3 addSelectionResponse:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _activeConversation](self, "_activeConversation"));
  objc_msgSend(v6, "addSelectionResponse:", v5);

}

- (id)siriPresentation:(id)a3 domainObjectForIdentifier:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController domainObjectStoreForSiriPresentation:](self, "domainObjectStoreForSiriPresentation:", a3));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "domainObjectForIdentifier:", v6));

  return v8;
}

- (void)siriPresentation:(id)a3 setDomainObject:(id)a4 forIdentifier:(id)a5
{
  id v8;
  id v9;
  id v10;

  v8 = a5;
  v9 = a4;
  v10 = (id)objc_claimAutoreleasedReturnValue(-[SRSiriViewController domainObjectStoreForSiriPresentation:](self, "domainObjectStoreForSiriPresentation:", a3));
  objc_msgSend(v10, "setDomainObject:forIdentifier:", v9, v8);

}

- (BOOL)siriPresentation:(id)a3 itemAtIndexPathIsVirgin:(id)a4
{
  void *v4;
  unsigned __int8 v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _activeConversationItemAtIndexPath:](self, "_activeConversationItemAtIndexPath:", a4));
  v5 = objc_msgSend(v4, "isVirgin");

  return v5;
}

- (id)sessionInfoForSiriPresentation:(id)a3
{
  return self->_siriSessionInfo;
}

- (double)contentWidthForForSiriPresentation:(id)a3
{
  void *v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double Width;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t IsPhone;
  uint64_t v18;
  uint64_t IsZoomed;
  uint64_t IsLargeFormatPad;
  double result;
  CGRect v22;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController view](self, "view", a3));
  objc_msgSend(v4, "frame");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  v22.origin.x = v6;
  v22.origin.y = v8;
  v22.size.width = v10;
  v22.size.height = v12;
  Width = CGRectGetWidth(v22);
  objc_opt_class(self, v14);
  v16 = v15;
  IsPhone = SiriUIDeviceIsPhone(v15);
  IsZoomed = SiriUIDeviceIsZoomed(IsPhone, v18);
  IsLargeFormatPad = SiriUIDeviceIsLargeFormatPad();
  _objc_msgSend(v16, "_contentWidthForWidth:isPhone:isZoomed:isLargeFormatPad:", IsPhone, IsZoomed, IsLargeFormatPad, Width);
  return result;
}

- (void)tapToEditPresented:(id)a3
{
  -[SRSiriSystemUIController tapToEditPresented](self->_systemUIController, "tapToEditPresented", a3);
}

+ (double)_contentWidthForWidth:(double)result isPhone:(BOOL)a4 isZoomed:(BOOL)a5 isLargeFormatPad:(BOOL)a6
{
  double *v6;

  if (a4)
  {
    v6 = (double *)&SiriUIPhoneMaxContentWidth;
  }
  else
  {
    if (a6)
      return SiriUILargeFormatPadContentWidth;
    v6 = (double *)&SiriUIPadZoomedMaxContentWidth;
    if (!a5)
      v6 = (double *)&SiriUIPadMaxContentWidth;
  }
  if (*v6 <= result)
    return *v6;
  return result;
}

- (BOOL)textInputEnabled
{
  void *v3;
  unsigned __int8 v4;

  if ((objc_opt_respondsToSelector(self->_presentation, "supportsTextInput") & 1) == 0
    || !-[SASRequestOptions isTypeToSiriRequest](self->_requestOptions, "isTypeToSiriRequest"))
  {
    return 0;
  }
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
  v4 = objc_msgSend(v3, "supportsTextInput");

  return v4;
}

- (CGRect)statusBarFrameForSiriPresentation:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  -[SRSiriViewController _statusBarFrame](self, "_statusBarFrame", a3);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (double)statusViewHeightForSiriPresentation:(id)a3
{
  double result;

  if (-[SRSiriViewController textInputEnabled](self, "textInputEnabled", a3)
    && (!self->_requestActive || -[SASRequestOptions inputType](self->_requestOptions, "inputType") != (id)2))
  {
    return 0.0;
  }
  -[SRSiriViewController _statusViewHeight](self, "_statusViewHeight");
  return result;
}

- ($5902F3589ABA92D8028CA1BE72F4BD0A)keyboardInfoForSiriPresentation:(SEL)a3
{
  CGSize size;

  size = self[2].var3.size;
  *(CGPoint *)&retstr->var0 = self[2].var3.origin;
  *(CGSize *)&retstr->var3.origin.y = size;
  *(_OWORD *)&retstr->var3.size.height = *(_OWORD *)&self[2].var4;
  return self;
}

- (id)activeRequestOptionsForSiriPresentation:(id)a3
{
  id v4;

  if (-[SRSiriViewController _isSiriIdleAndQuiet](self, "_isSiriIdleAndQuiet", a3)
    && !-[SASRequestOptions isTypeToSiriRequest](self->_requestOptions, "isTypeToSiriRequest"))
  {
    v4 = 0;
  }
  else
  {
    v4 = -[SASRequestOptions copy](self->_requestOptions, "copy");
  }
  return v4;
}

- (void)siriPresentation:(id)a3 startRequestWithOptions:(id)a4
{
  -[SRSiriViewController _startRequestWithOptions:](self, "_startRequestWithOptions:", a4);
}

- (void)siriPresentation:(id)a3 startRequestForText:(id)a4
{
  id v5;

  v5 = a4;
  if (objc_msgSend(v5, "length"))
    -[SRSiriViewController startRequestForText:](self, "startRequestForText:", v5);

}

- (void)siriPresentation:(id)a3 startRequestForSuggestion:(id)a4 inputType:(int64_t)a5
{
  id v7;

  v7 = a4;
  if (objc_msgSend(v7, "length"))
    -[SRSiriViewController startRequestForSuggestion:inputType:](self, "startRequestForSuggestion:inputType:", v7, a5);

}

- (void)siriPresentationKeyboardViewDidAppear:(id)a3
{
  void *v4;
  char v5;
  id v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _host](self, "_host", a3));
  v5 = objc_opt_respondsToSelector(v4, "presentationDidPresentKeyboard");

  if ((v5 & 1) != 0)
  {
    v6 = (id)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _host](self, "_host"));
    objc_msgSend(v6, "presentationDidPresentKeyboard");

  }
}

- (void)stopRecordingSpeechForSiriPresentation:(id)a3
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _session](self, "_session", a3));
  objc_msgSend(v3, "stopRecordingSpeech");

}

- (void)cancelRequestForSiriPresentation:(id)a3
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _session](self, "_session", a3));
  objc_msgSend(v3, "cancelSpeechRequest");

}

- (void)forceAudioSessionInactiveForSiriPresentation:(id)a3
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _session](self, "_session", a3));
  objc_msgSend(v3, "forceAudioSessionInactive");

}

- (void)dismissSiriPresentation:(id)a3 withReason:(int64_t)a4
{
  id v6;
  NSObject *v7;
  NSObject *v8;
  int v9;
  const char *v10;

  v6 = a3;
  v7 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 136315138;
    v10 = "-[SRSiriViewController dismissSiriPresentation:withReason:]";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s #idleTimer cancelling idle timer", (uint8_t *)&v9, 0xCu);
  }
  if (-[SRSiriViewController _isReadingBulletinContentInCarPlayOutsideOfSiriSession](self, "_isReadingBulletinContentInCarPlayOutsideOfSiriSession"))
  {
    v8 = AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 136315138;
      v10 = "-[SRSiriViewController dismissSiriPresentation:withReason:]";
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s #cmas #carPlay received a dismissal request while we are reading bulletin content outside of a Siri session. Cancelling speech synthesis.", (uint8_t *)&v9, 0xCu);
    }
    -[SRSiriViewController _cancelSpeechSynthesis](self, "_cancelSpeechSynthesis");
  }
  -[SRSiriViewController _setIdleTimerEnabled:](self, "_setIdleTimerEnabled:", 0);
  -[SRSiriViewController _cancelIdleTimer](self, "_cancelIdleTimer");
  -[SRSiriViewController _dismissWithReason:](self, "_dismissWithReason:", a4);

}

- (void)siriWillStopAttending:(id)a3
{
  NSObject *v4;
  void *v5;
  int v6;
  const char *v7;

  v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315138;
    v7 = "-[SRSiriViewController siriWillStopAttending:]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s #autodismiss telling session to stop attending for attention loss", (uint8_t *)&v6, 0xCu);
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _session](self, "_session"));
  objc_msgSend(v5, "stopAttending");

}

- (void)_siriPresentation:(id)a3 speakTextForConversationItemIdentifier:(id)a4 delayed:(BOOL)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  uint64_t v17;
  double v18;
  id v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  NSObject *v26;
  void *v27;
  NSObject *v28;
  id v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  _QWORD *v42;
  unsigned __int8 v43;
  void *v44;
  void *v45;
  id v46;
  void *v47;
  id v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  _QWORD v55[4];
  id v56;
  id v57;
  id v58;
  id v59;
  const __CFString *v60;
  uint64_t v61;
  uint8_t buf[4];
  const char *v63;
  __int16 v64;
  id v65;

  v7 = a3;
  v8 = a4;
  -[SRSiriViewController _setStartRequestAceCommandSent:](self, "_setStartRequestAceCommandSent:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _activeConversation](self, "_activeConversation"));
  if ((objc_msgSend(v9, "containsItemWithIdentifier:", v8) & 1) != 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "itemWithIdentifier:", v8));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "aceCommandIdentifier"));
    if (v11)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _aceCommandWithIdentifier:](self, "_aceCommandWithIdentifier:", v11));
      if (v12)
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _aceCommandRecords](self, "_aceCommandRecords"));
        v14 = objc_msgSend(v13, "resultForAceCommand:", v12);

        if (v14 != (id)2)
        {
          v15 = objc_msgSend(v10, "type");
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "aceObject"));
          *(_QWORD *)&v18 = objc_opt_class(self, v17).n128_u64[0];
          v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "_speechIdentifierForConversationItem:", v10, v18));
          v52 = v16;
          if (v15 == (id)3)
          {
            v20 = v16;
            v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "context"));
            v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "refId"));
            v43 = objc_msgSend(v20, "canUseServerTTS");
            objc_opt_class(SAUIDisambiguationList, v22);
            if ((objc_opt_isKindOfClass(v20, v23) & 1) != 0)
              v24 = objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "sruif_combinedSpeakableText"));
            else
              v24 = objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "speakableText"));
            v53 = (void *)v24;
            if ((AFDeviceSupportsTTS(v24) & 1) == 0)
            {
              v28 = AFSiriLogContextConnection;
              if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 136315138;
                v63 = "-[SRSiriViewController _siriPresentation:speakTextForConversationItemIdentifier:delayed:]";
                _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "%s #tts Device does not support tts, overriding speakable text since tts is not supported", buf, 0xCu);
              }

              v53 = 0;
            }
            v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "speakableContextInfo"));

            v27 = v53;
          }
          else
          {
            v49 = 0;
            v50 = 0;
            v27 = 0;
            v21 = 0;
            v43 = 1;
          }
          v55[0] = _NSConcreteStackBlock;
          v55[1] = 3221225472;
          v55[2] = sub_10004EB68;
          v55[3] = &unk_100122C68;
          v56 = v7;
          v57 = v9;
          v58 = v8;
          v29 = v10;
          v59 = v29;
          v44 = (void *)v21;
          v54 = v27;
          v42 = objc_retainBlock(v55);
          v47 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _configuredSpeakableUtteranceParserForCommand:context:speakableText:subCompletion:speakPreparation:speakCompletion:](self, "_configuredSpeakableUtteranceParserForCommand:context:speakableText:subCompletion:speakPreparation:speakCompletion:", v12, v21, v27));
          v48 = 0;
          v46 = 0;
          v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "dialogPhase"));
          objc_msgSend(v30, "isExpository");

          v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "dialogPhase"));
          v32 = objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "aceDialogPhaseValue"));

          if (v32)
          {
            v60 = CFSTR("dialogPhase");
            v61 = v32;
            v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v61, &v60, 1));
          }
          else
          {
            v45 = 0;
          }
          objc_opt_class(SAAceView, v33);
          v41 = (void *)v32;
          if ((objc_opt_isKindOfClass(v52, v34) & 1) != 0)
          {
            v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "aceObject"));
            v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "preferredSpeakableTextVoice"));

          }
          else
          {
            v36 = 0;
          }
          LOBYTE(v40) = v43;
          v37 = v54;
          -[SRSiriViewController _speakText:identifier:sessionId:preferredVoice:provisionally:eligibleAfterDuration:delayed:canUseServerTTS:speakableUtteranceParser:analyticsContext:speakableContextInfo:preparation:completion:](self, "_speakText:identifier:sessionId:preferredVoice:provisionally:eligibleAfterDuration:delayed:canUseServerTTS:speakableUtteranceParser:analyticsContext:speakableContextInfo:preparation:completion:", 0.4, v40, v47, v45, v49, v48, v46);
          if (v54)
          {
            v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "aceObject"));
            v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "dialogPhase"));
            -[SRSiriViewController _logAceObjectSpoken:dialogPhase:speakableText:](self, "_logAceObjectSpoken:dialogPhase:speakableText:", v38, v39, v54);

            v37 = v54;
          }

        }
      }
    }
    else
    {
      v26 = AFSiriLogContextConnection;
      if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v63 = "-[SRSiriViewController _siriPresentation:speakTextForConversationItemIdentifier:delayed:]";
        v64 = 2112;
        v65 = v8;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "%s Not speaking conversation item:%@. Item missing aceCommandIdentifier.", buf, 0x16u);
      }
      if ((objc_opt_respondsToSelector(v7, "siriDidFinishActionsForConversationItemWithIdentifier:inConversation:") & 1) == 0)
        goto LABEL_31;
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "identifier"));
      objc_msgSend(v7, "siriDidFinishActionsForConversationItemWithIdentifier:inConversation:", v12, v9);
    }

LABEL_31:
    goto LABEL_32;
  }
  v25 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v63 = "-[SRSiriViewController _siriPresentation:speakTextForConversationItemIdentifier:delayed:]";
    v64 = 2112;
    v65 = v8;
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "%s Not speaking conversation item:%@. Item doesn't exist in activeConversation.", buf, 0x16u);
  }
LABEL_32:

}

- (void)_siriPresentation:(id)a3 speakTextForConversationItemIdentifierDidBecomeReady:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  double v8;
  id v9;
  void *v10;
  id v11;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _activeConversation](self, "_activeConversation"));
  v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "itemWithIdentifier:", v5));

  *(_QWORD *)&v8 = objc_opt_class(self, v7).n128_u64[0];
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "_speechIdentifierForConversationItem:", v11, v8));
  -[SRUIFSpeechSynthesizer processDelayedItem:](self->_ttsManager, "processDelayedItem:", v10);

}

- (void)siriPresentationDidPresentUserInterface:(id)a3
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _host](self, "_host", a3));
  objc_msgSend(v3, "serviceDidPresentUserInterface");

}

- (void)siriPresentation:(id)a3 didPresentConversationItemsWithIdentifiers:(id)a4
{
  id v6;
  id v7;
  __int128 v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  unsigned int v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  unsigned int v19;
  NSObject *v20;
  id v21;
  void *v22;
  unsigned int v23;
  NSObject *v24;
  _BOOL4 v25;
  void *v26;
  void *v27;
  void *v28;
  __int128 v29;
  uint64_t v30;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint8_t buf[4];
  const char *v37;
  __int16 v38;
  void *v39;
  _BYTE v40[128];

  v31 = a3;
  v6 = a4;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
  if (v7)
  {
    v9 = v7;
    v10 = *(_QWORD *)v33;
    *(_QWORD *)&v8 = 136315394;
    v29 = v8;
    v30 = *(_QWORD *)v33;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v33 != v10)
          objc_enumerationMutation(v6);
        v12 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * (_QWORD)v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _activeConversation](self, "_activeConversation", v29));
        v14 = objc_msgSend(v13, "containsItemWithIdentifier:", v12);

        if (v14)
        {
          v15 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _activeConversation](self, "_activeConversation"));
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "itemWithIdentifier:", v12));

          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "revisionIdentifier"));
          v18 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentedConversationItemRevisionIdentifiers](self, "_presentedConversationItemRevisionIdentifiers"));
          v19 = objc_msgSend(v18, "containsObject:", v17);

          if (v19)
          {
            v20 = AFSiriLogContextConnection;
            if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = v29;
              v37 = "-[SRSiriViewController siriPresentation:didPresentConversationItemsWithIdentifiers:]";
              v38 = 2112;
              v39 = v16;
              _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "%s Ignoring conversation item because we have already presented it { item: %@ }", buf, 0x16u);
            }
          }
          else
          {
            v21 = v6;
            v22 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _delayedConversationItemRevisionIdentifiers](self, "_delayedConversationItemRevisionIdentifiers"));
            v23 = objc_msgSend(v22, "containsObject:", v17);

            v24 = AFSiriLogContextConnection;
            v25 = os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT);
            if (v23)
            {
              if (v25)
              {
                *(_DWORD *)buf = v29;
                v37 = "-[SRSiriViewController siriPresentation:didPresentConversationItemsWithIdentifiers:]";
                v38 = 2112;
                v39 = v16;
                _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "%s Delayed conversation item was presented; processing { item: %@ }",
                  buf,
                  0x16u);
              }
              v26 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _delayedConversationItemRevisionIdentifiers](self, "_delayedConversationItemRevisionIdentifiers"));
              objc_msgSend(v26, "removeObject:", v17);

              -[SRSiriViewController _siriPresentation:speakTextForConversationItemIdentifierDidBecomeReady:](self, "_siriPresentation:speakTextForConversationItemIdentifierDidBecomeReady:", v31, v12);
              v27 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentedConversationItemRevisionIdentifiers](self, "_presentedConversationItemRevisionIdentifiers"));
              objc_msgSend(v27, "addObject:", v17);

            }
            else
            {
              if (v25)
              {
                *(_DWORD *)buf = v29;
                v37 = "-[SRSiriViewController siriPresentation:didPresentConversationItemsWithIdentifiers:]";
                v38 = 2112;
                v39 = v16;
                _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "%s Conversation item was presented for the first time; processing { item: %@ }",
                  buf,
                  0x16u);
              }
              v28 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentedConversationItemRevisionIdentifiers](self, "_presentedConversationItemRevisionIdentifiers"));
              objc_msgSend(v28, "addObject:", v17);

              -[SRSiriViewController _siriPresentation:speakTextForConversationItemIdentifier:delayed:](self, "_siriPresentation:speakTextForConversationItemIdentifier:delayed:", v31, v12, 0);
            }
            v6 = v21;
            v10 = v30;
          }

        }
        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
    }
    while (v9);
  }

}

- (void)siriPresentation:(id)a3 didPresentItemsAtIndexPaths:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _activeConversation](self, "_activeConversation"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v7, "count")));
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v10 = v7;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v17;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v17 != v13)
          objc_enumerationMutation(v10);
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "identifierOfItemAtIndexPath:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)v14), (_QWORD)v16));
        objc_msgSend(v9, "addObject:", v15);

        v14 = (char *)v14 + 1;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v12);
  }

  -[SRSiriViewController siriPresentation:didPresentConversationItemsWithIdentifiers:](self, "siriPresentation:didPresentConversationItemsWithIdentifiers:", v6, v9);
}

- (void)siriPresentation:(id)a3 willDiscardConversationItemsWithIdentifiers:(id)a4
{
  id v5;
  id v6;
  __int128 v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  unsigned int v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  uint64_t v27;
  _BYTE v28[128];

  v5 = a4;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
  if (v6)
  {
    v8 = v6;
    v9 = *(_QWORD *)v21;
    *(_QWORD *)&v7 = 136315394;
    v19 = v7;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v21 != v9)
          objc_enumerationMutation(v5);
        v11 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _activeConversation](self, "_activeConversation", v19));
        v13 = objc_msgSend(v12, "containsItemWithIdentifier:", v11);

        if (v13)
        {
          v14 = AFSiriLogContextConnection;
          if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v19;
            v25 = "-[SRSiriViewController siriPresentation:willDiscardConversationItemsWithIdentifiers:]";
            v26 = 2112;
            v27 = v11;
            _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%s Discarded conversation item with identifier %@", buf, 0x16u);
          }
          v15 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _activeConversation](self, "_activeConversation"));
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "itemWithIdentifier:", v11));

          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "aceCommandIdentifier"));
          v18 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _aceCommandWithIdentifier:](self, "_aceCommandWithIdentifier:", v17));
          -[SRSiriViewController _didCompleteActionForAceCommand:success:](self, "_didCompleteActionForAceCommand:success:", v18, 1);

        }
        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
    }
    while (v8);
  }

}

- (void)siriPresentation:(id)a3 didDelayPresentationOfItemsWithIdentifiers:(id)a4
{
  id v6;
  id v7;
  __int128 v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  unsigned int v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  unsigned __int8 v19;
  void *v20;
  NSObject *v21;
  __int128 v22;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t buf[4];
  const char *v29;
  __int16 v30;
  void *v31;
  _BYTE v32[128];

  v23 = a3;
  v6 = a4;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
  if (v7)
  {
    v9 = v7;
    v10 = *(_QWORD *)v25;
    *(_QWORD *)&v8 = 136315394;
    v22 = v8;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v25 != v10)
          objc_enumerationMutation(v6);
        v12 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _activeConversation](self, "_activeConversation", v22));
        v14 = objc_msgSend(v13, "containsItemWithIdentifier:", v12);

        if (v14)
        {
          v15 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _activeConversation](self, "_activeConversation"));
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "itemWithIdentifier:", v12));

          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "revisionIdentifier"));
          v18 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _delayedConversationItemRevisionIdentifiers](self, "_delayedConversationItemRevisionIdentifiers"));
          v19 = objc_msgSend(v18, "containsObject:", v17);

          if ((v19 & 1) == 0)
          {
            v20 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _delayedConversationItemRevisionIdentifiers](self, "_delayedConversationItemRevisionIdentifiers"));
            objc_msgSend(v20, "addObject:", v17);

            v21 = AFSiriLogContextConnection;
            if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = v22;
              v29 = "-[SRSiriViewController siriPresentation:didDelayPresentationOfItemsWithIdentifiers:]";
              v30 = 2112;
              v31 = v17;
              _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "%s Processed but delaying presentation for conversation item with identifier %@", buf, 0x16u);
            }
            -[SRSiriViewController _siriPresentation:speakTextForConversationItemIdentifier:delayed:](self, "_siriPresentation:speakTextForConversationItemIdentifier:delayed:", v23, v12, 1);
          }

        }
        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
    }
    while (v9);
  }

}

- (unint64_t)siriDeviceLockStateForSiriPresentation:(id)a3
{
  return self->_lockState;
}

- (void)siriPresentation:(id)a3 synthesizeSpeechWithText:(id)a4 completion:(id)a5
{
  id v7;
  _QWORD v8[4];
  id v9;

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10004F664;
  v8[3] = &unk_100123450;
  v9 = a5;
  v7 = v9;
  -[SRSiriViewController _synthesizeText:identifier:sessionId:completion:](self, "_synthesizeText:identifier:sessionId:completion:", a4, 0, 0, v8);

}

- (void)siriPresentation:(id)a3 synthesizeSpeechWithPhoneticText:(id)a4 completion:(id)a5
{
  id v7;
  _QWORD v8[4];
  id v9;

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10004F708;
  v8[3] = &unk_100123450;
  v9 = a5;
  v7 = v9;
  -[SRSiriViewController _synthesizePhoneticText:identifier:sessionId:completion:](self, "_synthesizePhoneticText:identifier:sessionId:completion:", a4, 0, 0, v8);

}

- (int64_t)siriPresentation:(id)a3 presentationStateForItemAtIndexPath:(id)a4
{
  void *v4;
  id v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _activeConversationItemAtIndexPath:](self, "_activeConversationItemAtIndexPath:", a4));
  v5 = objc_msgSend(v4, "presentationState");

  return (int64_t)v5;
}

- (void)siriPresentation:(id)a3 didCorrectRecognition:(id)a4 correctionIdentifier:(id)a5 forConversationItemWithIdentifier:(id)a6 userSelectionResults:(id)a7
{
  id v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  double v18;
  void *v19;
  NSString *requestText;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;

  v25 = a4;
  v11 = a5;
  v12 = a6;
  v13 = a7;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _activeConversation](self, "_activeConversation"));
  v15 = mach_absolute_time();
  if (objc_msgSend(v14, "containsItemWithIdentifier:", v12))
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "itemWithIdentifier:", v12));
    if (objc_msgSend(v16, "type") == (id)1)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "aceObject"));
      objc_msgSend(v17, "sruif_setRecognitionWithCorrectedSpeech:", v25);

    }
    v18 = (double)v15;
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "indexPathForItemWithIdentifier:", v12));
    objc_msgSend(v14, "removeItemsFollowingItemAtIndexPath:", v19);

    if ((char *)-[SASRequestOptions requestSource](self->_requestOptions, "requestSource") - 23 <= (char *)2)
    {
      -[SASRequestOptions setText:](self->_requestOptions, "setText:", 0);
      requestText = self->_requestText;
      self->_requestText = (NSString *)&stru_100125588;

    }
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _instrumentationManager](self, "_instrumentationManager"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "currentInstrumentationTurnContext"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "turnIdentifier"));

    v24 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _session](self, "_session"));
    objc_msgSend(v24, "startCorrectedRequestWithText:correctionIdentifier:userSelectionResults:turnIdentifier:machAbsoluteTime:", v25, v11, v13, v23, v18);

  }
}

- (void)siriPresentation:(id)a3 startEditedRequestWithText:(id)a4 correctionIdentifier:(id)a5 userSelectionResults:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  double v14;
  void *v15;
  id v16;

  v9 = a6;
  v10 = a5;
  v11 = a4;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _instrumentationManager](self, "_instrumentationManager"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "currentInstrumentationTurnContext"));
  v16 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "turnIdentifier"));

  v14 = (double)mach_absolute_time();
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _session](self, "_session"));
  objc_msgSend(v15, "startCorrectedRequestWithText:correctionIdentifier:userSelectionResults:turnIdentifier:machAbsoluteTime:", v11, v10, v9, v16, v14);

}

- (void)siriPresentation:(id)a3 didCorrectRecognition:(id)a4 correctionIdentifier:(id)a5 forItemAtIndexPath:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _activeConversation](self, "_activeConversation"));
  v15 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "identifierOfItemAtIndexPath:", v10));

  -[SRSiriViewController siriPresentation:didCorrectRecognition:correctionIdentifier:forConversationItemWithIdentifier:userSelectionResults:](self, "siriPresentation:didCorrectRecognition:correctionIdentifier:forConversationItemWithIdentifier:userSelectionResults:", v13, v12, v11, v15, 0);
}

- (void)siriPresentation:(id)a3 performAceCommand:(id)a4 conversationItemIdentifier:(id)a5 completion:(id)a6
{
  -[SRSiriViewController _performAceCommand:conversationIdentifier:turnIdentifier:completion:](self, "_performAceCommand:conversationIdentifier:turnIdentifier:completion:", a4, a5, 0, a6);
}

- (void)siriPresentation:(id)a3 performAceCommand:(id)a4 conversationItemIdentifier:(id)a5 turnIdentifier:(id)a6 completion:(id)a7
{
  -[SRSiriViewController _performAceCommand:conversationIdentifier:turnIdentifier:completion:](self, "_performAceCommand:conversationIdentifier:turnIdentifier:completion:", a4, a5, a6, a7);
}

- (void)_performAceCommand:(id)a3 conversationIdentifier:(id)a4 turnIdentifier:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  id v16;

  v16 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = objc_msgSend(v16, "sruif_aceCommandType");
  if (v13 == (id)1)
  {
    -[SRSiriViewController _performGenericAceCommand:turnIdentifier:completion:](self, "_performGenericAceCommand:turnIdentifier:completion:", v16, v11, v12);
  }
  else if (v13 == (id)2)
  {
    -[SRSiriViewController _performAppPunchOutCommand:conversationItemIdentifier:completion:](self, "_performAppPunchOutCommand:conversationItemIdentifier:completion:", v16, v10, v12);
  }
  else if (!v13)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Cannot perform non-command: %@"), v16));
    v15 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInvalidArgumentException, v14, 0));

    objc_exception_throw(v15);
  }

}

- (void)siriPresentation:(id)a3 openURL:(id)a4 conversationId:(id)a5 completion:(id)a6
{
  -[SRSiriViewController _openURL:bundleId:inPlace:conversationId:completion:](self, "_openURL:bundleId:inPlace:conversationId:completion:", a4, 0, 0, a5, a6);
}

- (id)effectiveCoreLocationBundleForSiriPresentation:(id)a3
{
  return +[AFUISiriSession effectiveCoreLocationBundle](AFUISiriSession, "effectiveCoreLocationBundle", a3);
}

- (void)enableIdleTimerForSiriPresentation:(id)a3
{
  NSObject *v4;
  int v5;
  const char *v6;

  v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315138;
    v6 = "-[SRSiriViewController enableIdleTimerForSiriPresentation:]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s Enabling idle timer at the presentation's request", (uint8_t *)&v5, 0xCu);
  }
  -[SRSiriViewController _setIdleTimerEnabled:](self, "_setIdleTimerEnabled:", 1);
  -[SRSiriViewController _rescheduleIdleTimerIfNeeded](self, "_rescheduleIdleTimerIfNeeded");
}

- (void)disableIdleTimerForSiriPresentation:(id)a3
{
  NSObject *v4;
  int v5;
  const char *v6;

  v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315138;
    v6 = "-[SRSiriViewController disableIdleTimerForSiriPresentation:]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s Disabling idle timer at the presentation's request", (uint8_t *)&v5, 0xCu);
  }
  -[SRSiriViewController _setIdleTimerEnabled:](self, "_setIdleTimerEnabled:", 0);
  -[SRSiriViewController _rescheduleIdleTimerIfNeeded](self, "_rescheduleIdleTimerIfNeeded");
}

- (void)siriPresentation:(id)a3 setStatusViewHidden:(BOOL)a4
{
  _BOOL8 v4;
  id v5;

  v4 = a4;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _host](self, "_host", a3));
  objc_msgSend(v5, "setStatusViewHidden:", v4);

}

- (void)siriPresentation:(id)a3 setTypeToSiriViewHidden:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  char v7;
  id v8;

  v4 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _host](self, "_host", a3));
  v7 = objc_opt_respondsToSelector(v6, "setTypeToSiriViewHidden:");

  if ((v7 & 1) != 0)
  {
    v8 = (id)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _host](self, "_host"));
    objc_msgSend(v8, "setTypeToSiriViewHidden:", v4);

  }
}

- (void)siriPresentation:(id)a3 setFullScreenDimmingLayerVisible:(BOOL)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  uint64_t IsPad;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;

  v5 = a5;
  v6 = a4;
  IsPad = SiriUIDeviceIsPad(self, a2);
  if ((IsPad & 1) == 0 && AFDeviceSupportsSystemAssistantExperience(IsPad, v9))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController view](self, "view"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "layer"));
    objc_msgSend(v11, "setHitTestsAsOpaque:", v6);

  }
  v12 = (id)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _host](self, "_host"));
  objc_msgSend(v12, "setFullScreenDimmingLayerVisible:animated:", v6, v5);

}

- (void)siriPresentation:(id)a3 inputTypeDidChange:(int64_t)a4
{
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _host](self, "_host", a3));
  objc_msgSend(v5, "inputTypeDidChange:", a4);

}

- (void)siriPresentation:(id)a3 setStatusViewDisabled:(BOOL)a4
{
  _BOOL8 v4;
  id v5;

  v4 = a4;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _host](self, "_host", a3));
  objc_msgSend(v5, "setStatusViewDisabled:", v4);

}

- (void)siriPresentation:(id)a3 setStatusViewUserInteractionEnabled:(BOOL)a4
{
  _BOOL8 v4;
  id v5;

  v4 = a4;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _host](self, "_host", a3));
  objc_msgSend(v5, "setStatusViewUserInteractionEnabled:", v4);

}

- (void)siriPresentation:(id)a3 willPresentViewController:(id)a4
{
  id v5;
  id v6;
  id v7;

  v5 = a4;
  v7 = (id)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _host](self, "_host"));
  v6 = objc_msgSend(v5, "preferredStatusBarStyle");

  objc_msgSend(v7, "serviceWillPresentViewControllerWithStatusBarStyle:", v6);
}

- (void)siriPresentation:(id)a3 didPresentViewController:(id)a4
{
  id v5;
  id v6;
  id v7;

  v5 = a4;
  v7 = (id)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _host](self, "_host"));
  v6 = objc_msgSend(v5, "preferredStatusBarStyle");

  objc_msgSend(v7, "serviceDidPresentViewControllerWithStatusBarStyle:", v6);
}

- (void)siriPresentation:(id)a3 willDismissViewController:(id)a4
{
  id v5;
  id v6;
  id v7;

  v5 = a4;
  v7 = (id)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _host](self, "_host"));
  v6 = objc_msgSend(v5, "preferredStatusBarStyle");

  objc_msgSend(v7, "serviceWillDismissViewControllerWithStatusBarStyle:", v6);
}

- (void)siriPresentation:(id)a3 didDismissViewController:(id)a4
{
  id v5;
  id v6;
  id v7;

  v5 = a4;
  v7 = (id)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _host](self, "_host"));
  v6 = objc_msgSend(v5, "preferredStatusBarStyle");

  objc_msgSend(v7, "serviceDidDismissViewControllerWithStatusBarStyle:", v6);
}

- (void)siriPresentation:(id)a3 didRequestKeyboardWithVisibility:(BOOL)a4
{
  -[SRSiriViewController _setShowKeyboardIfTextInputEnabled:](self, "_setShowKeyboardIfTextInputEnabled:", a4);
}

- (void)siriPresentation:(id)a3 setStatusBarHidden:(BOOL)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  id v7;

  v5 = a5;
  v6 = a4;
  v7 = (id)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _host](self, "_host", a3));
  objc_msgSend(v7, "setStatusBarHidden:animated:", v6, v5);

}

- (void)siriPresentation:(id)a3 setStatusBarHidden:(BOOL)a4 animated:(BOOL)a5 completion:(id)a6
{
  _BOOL8 v6;
  _BOOL8 v7;
  id v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;

  v6 = a5;
  v7 = a4;
  v9 = a6;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _host](self, "_host"));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000501DC;
  v12[3] = &unk_100122688;
  v13 = v9;
  v11 = v9;
  objc_msgSend(v10, "setStatusBarHidden:animated:completion:", v7, v6, v12);

}

- (void)siriPresentation:(id)a3 setHelpButtonEmphasized:(BOOL)a4
{
  _BOOL8 v4;
  id v5;

  v4 = a4;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _host](self, "_host", a3));
  objc_msgSend(v5, "setHelpButtonEmphasized:", v4);

}

- (void)siriPresentationPulseHelpButton:(id)a3
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _host](self, "_host", a3));
  objc_msgSend(v3, "pulseHelpButton");

}

- (BOOL)siriPresentationShouldDelaySuggestions:(id)a3
{
  id v4;

  if (!-[SRSiriViewController textInputEnabled](self, "textInputEnabled", a3)
    || (v4 = -[SASRequestOptions requestSource](self->_requestOptions, "requestSource"), v4 != (id)1))
  {
    LOBYTE(v4) = 0;
  }
  return (char)v4;
}

- (void)siriPresentation:(id)a3 setBugReportingAvailable:(BOOL)a4
{
  _BOOL8 v4;
  id v5;

  v4 = a4;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _host](self, "_host", a3));
  objc_msgSend(v5, "setBugReportingAvailable:", v4);

}

- (void)siriPresentationDidPresentBugReporter:(id)a3
{
  void *v4;
  char v5;
  id v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _host](self, "_host", a3));
  v5 = objc_opt_respondsToSelector(v4, "serviceDidPresentBugReporter");

  if ((v5 & 1) != 0)
  {
    v6 = (id)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _host](self, "_host"));
    objc_msgSend(v6, "serviceDidPresentBugReporter");

  }
}

- (void)siriPresentationDidDismissBugReporter:(id)a3
{
  void *v4;
  char v5;
  id v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _host](self, "_host", a3));
  v5 = objc_opt_respondsToSelector(v4, "serviceDidDismissBugReporter");

  if ((v5 & 1) != 0)
  {
    v6 = (id)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _host](self, "_host"));
    objc_msgSend(v6, "serviceDidDismissBugReporter");

  }
}

- (void)getScreenshotImageForSiriPresentation:(id)a3 withCompletion:(id)a4
{
  id v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  v5 = a4;
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _host](self, "_host"));
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10005045C;
    v7[3] = &unk_100123900;
    v8 = v5;
    objc_msgSend(v6, "getScreenshotWithReplyHandler:", v7);

  }
}

- (void)siriPresentationPresentAcousticIDSpinner:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = objc_alloc_init((Class)SAAIStartSession);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "UUIDString"));
  objc_msgSend(v7, "setAceId:", v5);

  -[SRSiriViewController _didReceiveAceCommand:](self, "_didReceiveAceCommand:", v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _activeConversation](self, "_activeConversation"));
  objc_msgSend(v6, "addItemForMusicStartSessionCommand:", v7);

}

- (void)siriPresentationRemoveAcousticIDSpinner:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _activeConversation](self, "_activeConversation", a3));
  v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "lastItem"));

  if (objc_msgSend(v8, "type") == (id)5)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "identifier"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", v5));

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _activeConversation](self, "_activeConversation"));
    objc_msgSend(v7, "removeItemsWithIdentifiers:", v6);

  }
}

- (void)siriPresentation:(id)a3 didEditSpeechRecognized:(id)a4 forInterval:(double)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v7 = a4;
  v8 = objc_alloc((Class)AFMetrics);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "refId"));

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a5));
  v12 = objc_msgSend(v8, "initWithOriginalCommandId:category:duration:", v9, 4, v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _session](self, "_session"));
  objc_msgSend(v11, "recordUIMetrics:", v12);

}

- (void)siriPresentation:(id)a3 didScrollForInterval:(double)a4 metricsContext:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t *v15;
  const __CFString **v16;
  uint64_t v17;
  void *v18;
  void *v19;
  const __CFString *v20;
  uint64_t v21;
  _QWORD v22[2];
  _QWORD v23[2];

  v8 = a3;
  v9 = a5;
  if (!v9)
  {
    v9 = (id)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _activeConversation](self, "_activeConversation"));

    if (v9)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _activeConversation](self, "_activeConversation"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "identifier"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _punchoutMetricsAceCommandIdForItemWithIdentifier:](self, "_punchoutMetricsAceCommandIdForItemWithIdentifier:", v11));

      v9 = (id)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _metricsContextForItemWithAceCommandId:](self, "_metricsContextForItemWithAceCommandId:", v12));
    }
  }
  v13 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%.02f"), *(_QWORD *)&a4));
  v14 = (void *)v13;
  if (v9)
  {
    v22[0] = CFSTR("metricsContext");
    v22[1] = CFSTR("duration");
    v23[0] = v9;
    v23[1] = v13;
    v15 = v23;
    v16 = (const __CFString **)v22;
    v17 = 2;
  }
  else
  {
    v20 = CFSTR("duration");
    v21 = v13;
    v15 = &v21;
    v16 = &v20;
    v17 = 1;
  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v15, v16, v17));
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _analytics](self, "_analytics"));
  objc_msgSend(v19, "logEventWithType:context:", 1432, v18);

}

- (void)siriPresentation:(id)a3 didShowAceViewWithIdentifier:(id)a4 aceViewClass:(Class)a5 metricsContext:(id)a6 forInterval:(double)a7
{
  id v11;
  id v12;
  void *v13;
  unsigned int v14;
  void *v15;
  void *v16;
  dispatch_queue_global_t global_queue;
  NSObject *v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23[3];
  id location;

  v11 = a4;
  v12 = a6;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _activeConversation](self, "_activeConversation"));
  v14 = objc_msgSend(v13, "containsItemWithIdentifier:", v11);

  if (v14)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _activeConversation](self, "_activeConversation"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "itemWithIdentifier:", v11));

    objc_initWeak(&location, self);
    global_queue = dispatch_get_global_queue(0, 0);
    v18 = objc_claimAutoreleasedReturnValue(global_queue);
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_1000509A8;
    v20[3] = &unk_100123950;
    v23[1] = a5;
    v21 = v12;
    v22 = v16;
    v23[2] = *(id *)&a7;
    v19 = v16;
    objc_copyWeak(v23, &location);
    dispatch_async(v18, v20);

    objc_destroyWeak(v23);
    objc_destroyWeak(&location);
  }

}

- (void)siriPresentation:(id)a3 didShowTipWithIdentifier:(id)a4 startDate:(id)a5 endDate:(id)a6 flowID:(id)a7
{
  id v11;
  id v12;
  id v13;
  void *v14;
  unsigned int v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  id v20;

  v20 = a5;
  v11 = a6;
  v12 = a7;
  v13 = a4;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _activeConversation](self, "_activeConversation"));
  v15 = objc_msgSend(v14, "containsItemWithIdentifier:", v13);

  if (v15)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[CKKnowledgeStore defaultSynchedKnowledgeStore](CKKnowledgeStore, "defaultSynchedKnowledgeStore"));
    v17 = objc_msgSend(objc_alloc((Class)CKPermanentEventStore), "initWithKnowledgeStore:", v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@#%@"), v12, CFSTR("TipOnScreen")));
    v19 = objc_msgSend(objc_alloc((Class)CKEvent), "initWithIdentifier:startDate:endDate:metadata:", v18, v20, v11, 0);
    objc_msgSend(v17, "recordEvent:completionHandler:", v19, &stru_100123970);

  }
}

- (void)siriPresentation:(id)a3 didShowGuideStartTime:(id)a4 endTime:(id)a5
{
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;

  v6 = a5;
  v7 = a4;
  v10 = (id)objc_claimAutoreleasedReturnValue(+[CKKnowledgeStore defaultSynchedKnowledgeStore](CKKnowledgeStore, "defaultSynchedKnowledgeStore"));
  v8 = objc_msgSend(objc_alloc((Class)CKPermanentEventStore), "initWithKnowledgeStore:", v10);
  v9 = objc_msgSend(objc_alloc((Class)CKEvent), "initWithIdentifier:startDate:endDate:metadata:", CFSTR("SiriGuideShown"), v7, v6, 0);

  objc_msgSend(v8, "recordEvent:completionHandler:", v9, &stru_100123990);
}

- (void)handlePasscodeUnlockForSiriPresentation:(id)a3 withCompletion:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _host](self, "_host"));
  objc_msgSend(v6, "handlePasscodeUnlockWithCompletion:", v5);

}

- (void)siriPresentationMicButtonWasTapped:(id)a3
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _host](self, "_host", a3));
  objc_msgSend(v3, "serviceDidDetectMicButtonTap");

}

- (void)siriPresentationMicButtonLongPressBegan:(id)a3
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _host](self, "_host", a3));
  objc_msgSend(v3, "serviceDidDetectMicButtonLongPressBegan");

}

- (void)siriPresentationMicButtonLongPressEnded:(id)a3
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _host](self, "_host", a3));
  objc_msgSend(v3, "serviceDidDetectMicButtonLongPressEnded");

}

- (void)siriPresentation:(id)a3 didChangePeekMode:(unint64_t)a4
{
  unint64_t v4;
  id v5;

  if (a4 - 1 >= 3)
    v4 = 0;
  else
    v4 = a4;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _host](self, "_host", a3));
  objc_msgSend(v5, "servicePresentationDidChangePeekMode:", v4);

}

- (void)siriPresentation:(id)a3 didChangeVisualState:(unint64_t)a4
{
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _host](self, "_host", a3));
  objc_msgSend(v5, "servicePresentationDidChangeVisualState:", a4);

}

- (void)siriPresentation:(id)a3 willChangeKeyboardVisibility:(BOOL)a4
{
  _BOOL8 v4;
  id v5;

  v4 = a4;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _host](self, "_host", a3));
  objc_msgSend(v5, "serviceViewControllerWillChangeKeyboardVisibility:", v4);

}

- (void)siriPresentation:(id)a3 willChangeTextInteractionEditMenuVisibility:(BOOL)a4
{
  self->_textInteractionEditMenuVisible = a4;
}

- (void)siriPresentation:(id)a3 requestsKeyboardWithCompletion:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _host](self, "_host"));
  objc_msgSend(v6, "serviceViewControllerRequestsKeyboardWithCompletion:", v5);

}

- (void)siriPresentation:(id)a3 willBeginEditingOfType:(int64_t)a4
{
  id v5;

  if (a4 == 1)
    -[SRSiriViewController _setUserUtteranceTapToEditInProgress:](self, "_setUserUtteranceTapToEditInProgress:", 1);
  v5 = (id)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _host](self, "_host"));
  objc_msgSend(v5, "serviceWillBeginEditing");

}

- (void)siriPresentationDidEndEditing:(id)a3
{
  -[SRSiriViewController _setUserUtteranceTapToEditInProgress:](self, "_setUserUtteranceTapToEditInProgress:", 0);
}

- (void)siriPresentationDidResignFirstResponder:(id)a3
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _host](self, "_host", a3));
  objc_msgSend(v3, "serviceDidEndEditing");

}

- (void)siriPresentationRequestsHIDEventDefferal:(id)a3
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _host](self, "_host", a3));
  objc_msgSend(v3, "serviceRequestsHIDEventDefferal");

}

- (void)siriPresentationCancelHIDEventDefferal:(id)a3
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _host](self, "_host", a3));
  objc_msgSend(v3, "serviceCancelHIDEventDefferal");

}

- (void)siriPresentation:(id)a3 requestsTouchPassThroughEnabled:(BOOL)a4
{
  _BOOL4 v4;
  NSObject *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  int v10;
  const char *v11;
  __int16 v12;
  const __CFString *v13;

  v4 = a4;
  v6 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    v7 = CFSTR("Disabling");
    if (v4)
      v7 = CFSTR("Enabling");
    v10 = 136315394;
    v11 = "-[SRSiriViewController siriPresentation:requestsTouchPassThroughEnabled:]";
    v12 = 2112;
    v13 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s %@ touch pass through on SRSiriViewController", (uint8_t *)&v10, 0x16u);
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController view](self, "view"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "layer"));
  objc_msgSend(v9, "setHitTestsAsOpaque:", !v4);

}

- (void)siriPresentation:(id)a3 didPresentIntentWithBundleId:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _host](self, "_host"));
  objc_msgSend(v6, "servicePresentedIntentWithBundleId:", v5);

}

- (void)siriPresentationClearContext:(id)a3
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _session](self, "_session", a3));
  objc_msgSend(v3, "clearContext");

}

- (id)siriPresentation:(id)a3 additionalSpeechInterpretationsForRefId:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _activeConversation](self, "_activeConversation"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "additionalSpeechInterpretationsForRefId:", v5));

  return v7;
}

- (id)siriPresentation:(id)a3 updatedUserUtteranceForRefId:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _activeConversation](self, "_activeConversation"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "updatedUserUtteranceForRefId:", v5));

  return v7;
}

- (void)siriPresentationDidPresentConversationFromBreadcrumb:(id)a3
{
  id v4;

  -[SRSiriViewController _setShowKeyboardIfTextInputEnabled:minimized:](self, "_setShowKeyboardIfTextInputEnabled:minimized:", 1, +[UIKeyboard isInHardwareKeyboardMode](UIKeyboard, "isInHardwareKeyboardMode", a3) ^ 1);
  v4 = (id)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _host](self, "_host"));
  objc_msgSend(v4, "serviceDidPresentConversationFromBreadcrumb");

}

- (BOOL)inTextInputModeForSiriPresentation:(id)a3
{
  _BOOL4 v4;

  v4 = -[SRSiriViewController textInputEnabled](self, "textInputEnabled", a3);
  if (v4)
    LOBYTE(v4) = !self->_requestActive
              || -[SASRequestOptions requestSource](self->_requestOptions, "requestSource") != (id)8
              && (!SiriUIIsHTTForTextInputEnabled()
               || -[SASRequestOptions inputType](self->_requestOptions, "inputType") != (id)2)
              || self->_keyboardInfo.keyboardHeight > 0.0;
  return v4;
}

- (void)siriPresentationDidHideUnlockScreen:(id)a3
{
  -[SRSiriViewController _setShowKeyboardIfTextInputEnabled:minimized:](self, "_setShowKeyboardIfTextInputEnabled:minimized:", 1, +[UIKeyboard isInHardwareKeyboardMode](UIKeyboard, "isInHardwareKeyboardMode", a3) ^ 1);
}

- (void)siriPresentationDidHideKeyboard:(id)a3
{
  -[SRSiriViewController _setShowKeyboardIfTextInputEnabled:](self, "_setShowKeyboardIfTextInputEnabled:", 0);
}

- (void)siriPresentationWillSendStartRequest:(id)a3
{
  -[SRSiriViewController _setStartRequestAceCommandSent:](self, "_setStartRequestAceCommandSent:", 1);
  -[SRSiriViewController _cancelSpeechSynthesis](self, "_cancelSpeechSynthesis");
}

- (id)localeForSiriPresentation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = objc_alloc((Class)NSLocale);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _language](self, "_language"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "spokenLanguageCode"));
  v7 = objc_msgSend(v4, "initWithLocaleIdentifier:", v6);

  return v7;
}

- (void)siriPresentationDidRequestRestartSpeechSynthesis:(id)a3
{
  SAUISayIt *previousSayItCommand;

  previousSayItCommand = self->_previousSayItCommand;
  if (previousSayItCommand)
    -[SRSiriViewController siriSessionDidReceiveSayItCommand:completion:](self, "siriSessionDidReceiveSayItCommand:completion:", previousSayItCommand, 0);
}

- (void)siriPresentationDidPresentDynamicSnippetWithInfo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _session](self, "_session"));
  objc_msgSend(v5, "siriUIDidPresentDynamicSnippetWithInfo:", v4);

}

- (void)userTouchedSnippet
{
  -[SRModeProvider setUserTouchedSnippet:](self->_modeProvider, "setUserTouchedSnippet:", 1);
}

- (void)siriPresentation:(id)a3 handleStartLocalRequest:(id)a4 turnIdentifier:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  double v10;
  void *v11;
  int v12;
  const char *v13;
  __int16 v14;
  id v15;

  v7 = a4;
  v8 = a5;
  v9 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 136315394;
    v13 = "-[SRSiriViewController siriPresentation:handleStartLocalRequest:turnIdentifier:]";
    v14 = 2112;
    v15 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s Handling startLocalRequest : %@", (uint8_t *)&v12, 0x16u);
  }
  v10 = (double)mach_absolute_time();
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _session](self, "_session"));
  objc_msgSend(v11, "performAceCommand:turnIdentifier:machAbsoluteTime:", v7, v8, v10);

}

- (void)_emitRenderingStarted
{
  id v3;
  id v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  os_signpost_id_t uiRenderSignpost;
  int v9;
  const char *v10;
  __int16 v11;
  const char *v12;

  v3 = objc_alloc_init((Class)SISchemaUEIUIRenderingStarted);
  objc_msgSend(v3, "setExists:", 1);
  v4 = objc_alloc_init((Class)SISchemaUEIUIRenderingContext);
  objc_msgSend(v4, "setStartedOrChanged:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _instrumentationManager](self, "_instrumentationManager"));
  objc_msgSend(v5, "emitInstrumentation:", v4);

  self->_uiRenderSignpost = os_signpost_id_generate(AFSiriLogContextPerformance);
  v6 = AFSiriLogContextPerformance;
  v7 = v6;
  uiRenderSignpost = self->_uiRenderSignpost;
  if (uiRenderSignpost - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    v9 = 136315394;
    v10 = "SiriX";
    v11 = 2080;
    v12 = "enableTelemetry=YES";
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v7, OS_SIGNPOST_INTERVAL_BEGIN, uiRenderSignpost, "UIRenderTime", "%s %s", (uint8_t *)&v9, 0x16u);
  }

}

- (void)_emitRenderingEnded
{
  id v3;
  id v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  os_signpost_id_t uiRenderSignpost;
  uint8_t v9[16];

  v3 = objc_alloc_init((Class)SISchemaUEIUIRenderingEnded);
  objc_msgSend(v3, "setExists:", 1);
  v4 = objc_alloc_init((Class)SISchemaUEIUIRenderingContext);
  objc_msgSend(v4, "setEnded:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _instrumentationManager](self, "_instrumentationManager"));
  objc_msgSend(v5, "emitInstrumentation:", v4);

  v6 = AFSiriLogContextPerformance;
  v7 = v6;
  uiRenderSignpost = self->_uiRenderSignpost;
  if (uiRenderSignpost - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    *(_WORD *)v9 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v7, OS_SIGNPOST_INTERVAL_END, uiRenderSignpost, "UIRenderTime", (const char *)&unk_1000E8151, v9, 2u);
  }

}

- (void)didBeginProcessingConversationItems
{
  -[SRSiriViewController _emitRenderingStarted](self, "_emitRenderingStarted");
}

- (void)siriPresentation:(id)a3 viewDidAppearWithAceObject:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  int v12;
  const char *v13;
  __int16 v14;
  id v15;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "encodedClassName"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "aceId"));
  -[SRSiriViewController siriPresentation:viewDidAppearWithClassDescriptor:identifier:](self, "siriPresentation:viewDidAppearWithClassDescriptor:identifier:", v7, v8, v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[SRUIFAnalyticsSupplement dialogPhaseForAceObject:](self->_analyticsSupplement, "dialogPhaseForAceObject:", v6));
  if (!v10)
  {
    v11 = AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 136315394;
      v13 = "-[SRSiriViewController siriPresentation:viewDidAppearWithAceObject:]";
      v14 = 2112;
      v15 = v6;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%s Dialog phase is unexpectedly nil for aceObject : %@", (uint8_t *)&v12, 0x16u);
    }
  }
  -[SRSiriViewController _logAceObjectPresented:dialogPhase:](self, "_logAceObjectPresented:dialogPhase:", v6, v10);

}

- (void)siriPresentation:(id)a3 viewDidAppearWithClassDescriptor:(id)a4 identifier:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a4;
  v7 = a5;
  -[SRSiriViewController _emitRenderingEnded](self, "_emitRenderingEnded");
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  if (objc_msgSend(v10, "length"))
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v10, CFSTR("viewClass"));
  if (objc_msgSend(v7, "length"))
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, CFSTR("identifier"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _analytics](self, "_analytics"));
  objc_msgSend(v9, "logEventWithType:context:", 1461, v8);

}

- (void)siriPresentation:(id)a3 viewDidDisappearWithClassDescriptor:(id)a4 identifier:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a4;
  v7 = a5;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  if (objc_msgSend(v10, "length"))
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v10, CFSTR("viewClass"));
  if (objc_msgSend(v7, "length"))
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, CFSTR("identifier"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _analytics](self, "_analytics"));
  objc_msgSend(v9, "logEventWithType:context:", 1462, v8);

}

- (void)userDrilledIntoSnippet
{
  -[SRSiriSystemUIController userDrilledIntoSnippet](self->_systemUIController, "userDrilledIntoSnippet");
}

- (void)_insertUserUtteranceViewForText:(id)a3
{
  id v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  SRSiriViewController *v24;
  id v25;
  id v26;
  id v27;
  id v28;

  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    v24 = self;
    v5 = objc_alloc_init((Class)SASToken);
    objc_msgSend(v5, "setText:", v4);
    v6 = objc_alloc_init((Class)SASInterpretation);
    v28 = v5;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v28, 1));
    objc_msgSend(v6, "setTokens:", v7);

    v8 = objc_alloc_init((Class)SASPhrase);
    v27 = v6;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v27, 1));
    objc_msgSend(v8, "setInterpretations:", v9);

    v10 = objc_alloc_init((Class)SASRecognition);
    v26 = v8;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v26, 1));
    objc_msgSend(v10, "setPhrases:", v11);

    v12 = objc_alloc_init((Class)SASSpeechRecognized);
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "UUIDString"));
    objc_msgSend(v12, "setAceId:", v14);

    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "UUIDString"));
    objc_msgSend(v12, "setRefId:", v16);

    objc_msgSend(v12, "setTitle:", v4);
    objc_msgSend(v12, "setRecognition:", v10);
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "UUIDString"));
    objc_msgSend(v12, "setSessionId:", v18);

    v19 = objc_alloc_init((Class)SASSpeechPartialResult);
    v25 = v5;
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v25, 1));
    objc_msgSend(v19, "setTokens:", v20);

    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "UUIDString"));
    objc_msgSend(v19, "setAceId:", v22);

    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "refId"));
    objc_msgSend(v19, "setRefId:", v23);

    -[SRSiriViewController siriSessionDidReceiveSpeechPartialResultCommand:](v24, "siriSessionDidReceiveSpeechPartialResultCommand:", v19);
    -[SRSiriViewController siriSessionDidReceiveSpeechRecognizedCommand:](v24, "siriSessionDidReceiveSpeechRecognizedCommand:", v12);

  }
}

- (void)_insertUserUtteranceViewForSuggestion:(id)a3
{
  id v3;
  id v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
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
  id v22;
  void *v23;
  void *v24;
  void *v25;
  id v27;
  id v28;
  id v29;

  v3 = a3;
  if (objc_msgSend(v3, "length"))
  {
    v4 = objc_alloc_init((Class)SASToken);
    objc_msgSend(v4, "setText:", v3);
    v5 = objc_alloc_init((Class)SASInterpretation);
    v25 = v4;
    v29 = v4;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v29, 1));
    objc_msgSend(v5, "setTokens:", v6);

    v7 = objc_alloc_init((Class)SASPhrase);
    v28 = v5;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v28, 1));
    objc_msgSend(v7, "setInterpretations:", v8);

    v9 = objc_alloc_init((Class)SASRecognition);
    v27 = v7;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v27, 1));
    objc_msgSend(v9, "setPhrases:", v10);

    v11 = objc_alloc_init((Class)SASSpeechRecognized);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "UUIDString"));
    objc_msgSend(v11, "setAceId:", v13);

    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "UUIDString"));
    objc_msgSend(v11, "setRefId:", v15);

    objc_msgSend(v11, "setTitle:", v3);
    objc_msgSend(v11, "setRecognition:", v9);
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "UUIDString"));
    objc_msgSend(v11, "setSessionId:", v17);

    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "recognition"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "refId"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "sessionId"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "af_userUtteranceValueWithRefId:sessionId:", v19, v20));

    v22 = objc_msgSend(objc_alloc((Class)SRUIFSpeechRecognitionHypothesis), "initWithUserUtterance:backingAceObject:isFinal:", v21, 0, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
    LOBYTE(v4) = objc_opt_respondsToSelector(v23, "updateSpeechRecognitionHypothesisForSuggestion:");

    if ((v4 & 1) != 0)
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
      objc_msgSend(v24, "updateSpeechRecognitionHypothesisForSuggestion:", v22);

    }
  }

}

- (void)siriSessionRequestsReadoutOfBulletin:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  id v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void (**v24)(_QWORD, _QWORD);
  _QWORD block[5];
  void (**v26)(_QWORD, _QWORD);
  _BYTE *v27;
  _QWORD *v28;
  id v29;
  _QWORD v30[4];
  NSObject *v31;
  _QWORD *v32;
  id v33;
  _QWORD v34[4];
  NSObject *v35;
  _BYTE *v36;
  id v37;
  id location;
  _QWORD v39[4];
  uint8_t v40[4];
  const char *v41;
  __int16 v42;
  void *v43;
  _BYTE buf[24];
  uint64_t v45;

  v6 = a3;
  v7 = a4;
  v8 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "-[SRSiriViewController siriSessionRequestsReadoutOfBulletin:completion:]";
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s #cmas #carPlay %@", buf, 0x16u);
  }
  if (v6)
  {
    v24 = (void (**)(_QWORD, _QWORD))v7;
    -[SRSiriViewController _setReadingBulletinContentInCarPlayOutsideOfSiriSession:](self, "_setReadingBulletinContentInCarPlayOutsideOfSiriSession:", 1);
    v9 = dispatch_group_create();
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    v45 = 0;
    v39[0] = 0;
    v39[1] = v39;
    v39[2] = 0x2020000000;
    v39[3] = 0;
    objc_initWeak(&location, self);
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "title"));
    v11 = AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)v40 = 136315394;
      v41 = "-[SRSiriViewController siriSessionRequestsReadoutOfBulletin:completion:]";
      v42 = 2112;
      v43 = v10;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%s #cmas #carPlay Title of emergency bulletin to speak: %@", v40, 0x16u);
    }
    v12 = objc_msgSend(v10, "length");
    if (v12)
    {
      dispatch_group_enter(v9);
      v34[0] = _NSConcreteStackBlock;
      v34[1] = 3221225472;
      v34[2] = sub_10005270C;
      v34[3] = &unk_1001237A0;
      v36 = buf;
      objc_copyWeak(&v37, &location);
      v35 = v9;
      -[SRSiriViewController _synthesizeText:identifier:sessionId:completion:](self, "_synthesizeText:identifier:sessionId:completion:", v10, 0, 0, v34);

      objc_destroyWeak(&v37);
    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "message"));
    v14 = AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)v40 = 136315394;
      v41 = "-[SRSiriViewController siriSessionRequestsReadoutOfBulletin:completion:]";
      v42 = 2112;
      v43 = v13;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "%s #cmas #carPlay Message of emergency bulletin to speak: %@", v40, 0x16u);
    }
    if (objc_msgSend(v13, "length"))
    {
      dispatch_group_enter(v9);
      v30[0] = _NSConcreteStackBlock;
      v30[1] = 3221225472;
      v30[2] = sub_100052774;
      v30[3] = &unk_1001237A0;
      v32 = v39;
      objc_copyWeak(&v33, &location);
      v31 = v9;
      -[SRSiriViewController _synthesizeText:identifier:sessionId:completion:](self, "_synthesizeText:identifier:sessionId:completion:", v13, 0, 0, v30);

      objc_destroyWeak(&v33);
    }
    else if (!v12)
    {
      v16 = AFSiriLogContextConnection;
      if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
        sub_10009F8D4(v16, v17, v18, v19, v20, v21, v22, v23);
      v24[2](v24, 4);
      goto LABEL_16;
    }
    v15 = AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)v40 = 136315138;
      v41 = "-[SRSiriViewController siriSessionRequestsReadoutOfBulletin:completion:]";
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "%s #cmas #carPlay Waiting for synthesis to complete", v40, 0xCu);
    }
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000527DC;
    block[3] = &unk_1001239D8;
    objc_copyWeak(&v29, &location);
    v27 = buf;
    v28 = v39;
    block[4] = self;
    v26 = v24;
    dispatch_group_notify(v9, (dispatch_queue_t)&_dispatch_main_q, block);

    objc_destroyWeak(&v29);
LABEL_16:

    objc_destroyWeak(&location);
    _Block_object_dispose(v39, 8);
    _Block_object_dispose(buf, 8);

    v7 = v24;
  }

}

- (unint64_t)_readoutResultFromTTSResult:(int64_t)a3 error:(id)a4
{
  id v5;
  NSObject *v6;
  int v8;
  const char *v9;
  __int16 v10;
  id v11;

  v5 = a4;
  if (a3 == 1
    && +[SRUIFSpeechSynthesisUtility isSpeechSynthesisErrorUserCancelled:](SRUIFSpeechSynthesisUtility, "isSpeechSynthesisErrorUserCancelled:", v5))
  {
    v6 = AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 136315394;
      v9 = "-[SRSiriViewController _readoutResultFromTTSResult:error:]";
      v10 = 2112;
      v11 = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s #cmas #carPlay received a user cancelled voice services error, setting state to AFUIBulletinReadoutResultSynthesisCancelled. %@", (uint8_t *)&v8, 0x16u);
    }
    a3 = 3;
  }
  else
  {
    if (v5 && os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
      sub_10009F9B4();
    if ((unint64_t)(a3 - 1) >= 3)
      a3 = 0;
  }

  return a3;
}

- (unint64_t)_readoutResultFromTitleResult:(unint64_t)a3 messageResult:(unint64_t)a4
{
  unint64_t result;
  void *v6;

  result = 2;
  if (a3 != 2 && a4 != 2)
  {
    result = 3;
    if (a3 != 3 && a4 != 3)
    {
      if (a3 == 1 && !a4 || a3 <= 1 && a4 == 1)
      {
        return 1;
      }
      else
      {
        v6 = (void *)AFSiriLogContextConnection;
        if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
          sub_10009FA20(v6, (void *)a3);
        return 0;
      }
    }
  }
  return result;
}

- (void)_activeRequestOptionsDidChange
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[SRSiriViewController presentation](self, "presentation"));
  if ((objc_opt_respondsToSelector(v2, "activeRequestOptionsDidChange") & 1) != 0)
    objc_msgSend(v2, "activeRequestOptionsDidChange");

}

- (void)_setRequestOptions:(id)a3
{
  objc_storeStrong((id *)&self->_requestOptions, a3);
  -[SRSiriViewController _activeRequestOptionsDidChange](self, "_activeRequestOptionsDidChange");
}

- (void)setRequestOptions:(id)a3
{
  id v4;
  NSObject *v5;
  NSDictionary *v6;
  NSDictionary *testingContext;
  void *v8;
  char v9;
  void *v10;
  int v11;
  const char *v12;
  __int16 v13;
  id v14;

  v4 = a3;
  v5 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 136315394;
    v12 = "-[SRSiriViewController setRequestOptions:]";
    v13 = 2112;
    v14 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s %@", (uint8_t *)&v11, 0x16u);
  }
  -[SRSiriViewController _setRequestOptions:](self, "_setRequestOptions:", v4);
  -[SRModeProvider setRequestOptions:](self->_modeProvider, "setRequestOptions:", v4);
  if (objc_msgSend(v4, "isInitialBringUp"))
    -[SRSiriViewController _setAcousticIdAllowed:](self, "_setAcousticIdAllowed:", 1);
  v6 = (NSDictionary *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "testingContext"));
  testingContext = self->_testingContext;
  self->_testingContext = v6;

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
  v9 = objc_opt_respondsToSelector(v8, "configureForRequestOptions:");

  if ((v9 & 1) != 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
    objc_msgSend(v10, "configureForRequestOptions:", v4);

  }
}

- (void)_startRequestWithOptions:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  const char *v11;
  __int16 v12;
  id v13;

  v4 = a3;
  v5 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 136315394;
    v11 = "-[SRSiriViewController _startRequestWithOptions:]";
    v12 = 2112;
    v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s %@", (uint8_t *)&v10, 0x16u);
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _instrumentationManager](self, "_instrumentationManager"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "currentInstrumentationTurnContext"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "turnIdentifier"));

  if (v8)
    objc_msgSend(v4, "setPreviousTurnIdentifier:", v8);
  -[SRSiriViewController _setWaitingForStartRequest:](self, "_setWaitingForStartRequest:", 1);
  if (-[SRSiriViewController _usesEventDrivenIdleAndQuietUpdates](self, "_usesEventDrivenIdleAndQuietUpdates"))
    -[SRSiriViewController _checkAndUpdateSiriIdleAndQuietStatusIfNeeded](self, "_checkAndUpdateSiriIdleAndQuietStatusIfNeeded");
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _hostWithErrorHandler:](self, "_hostWithErrorHandler:", &stru_1001239F8));
  objc_msgSend(v9, "serviceStartRequestWithOptions:", v4);

}

- (void)siriPresentation:(id)a3 siriRequestEnteredWithText:(id)a4
{
  -[SRSiriViewController startRequestForText:](self, "startRequestForText:", a4);
}

- (void)siriSessionDidStartAcousticIDRequest
{
  void *v3;
  char v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
  v4 = objc_opt_respondsToSelector(v3, "acousticIDRequestDidStart");

  if ((v4 & 1) != 0)
  {
    v5 = (id)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
    objc_msgSend(v5, "acousticIDRequestDidStart");

  }
}

- (void)siriSessionDidFinishAcousticIDRequestWithSuccess:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  char v6;
  id v7;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
  v6 = objc_opt_respondsToSelector(v5, "acousticIDRequestDidFinishWithSuccess:");

  if ((v6 & 1) != 0)
  {
    v7 = (id)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
    objc_msgSend(v7, "acousticIDRequestDidFinishWithSuccess:", v3);

  }
}

- (void)siriSessionRequestedCancelPhotoSelectionWithAnimation:(BOOL)a3
{
  SiriSharedUIPhPicker *phPicker;

  phPicker = self->_phPicker;
  if (phPicker)
    -[SiriSharedUIPhPicker dismissPhotoPickerIfExistsWithAnimation:](phPicker, "dismissPhotoPickerIfExistsWithAnimation:", a3);
}

- (void)siriSessionRequestedPhotoSelectionWithSearchString:(id)a3 completion:(id)a4
{
  id v6;
  SiriSharedUIPhPicker *phPicker;
  SiriSharedUIPhPicker *v8;
  SiriSharedUIPhPicker *v9;
  void *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  phPicker = self->_phPicker;
  if (!phPicker)
  {
    v8 = (SiriSharedUIPhPicker *)objc_alloc_init((Class)SiriSharedUIPhPicker);
    v9 = self->_phPicker;
    self->_phPicker = v8;

    phPicker = self->_phPicker;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentationViewController](self, "_presentationViewController"));
  -[SiriSharedUIPhPicker presentPhotoPicker:withSearchString:completion:](phPicker, "presentPhotoPicker:withSearchString:completion:", v10, v11, v6);

}

- (int64_t)_presentationOptions
{
  void *v3;
  unsigned __int8 v4;
  void *v6;
  char v7;
  void *v8;
  id v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _requestOptions](self, "_requestOptions"));
  v4 = objc_msgSend(v3, "isForBluetoothCar");

  if ((v4 & 1) != 0)
    return 8;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
  v7 = objc_opt_respondsToSelector(v6, "options");

  if ((v7 & 1) == 0)
    return 0;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
  v9 = objc_msgSend(v8, "options");

  return (int64_t)v9;
}

- (void)preloadPresentationBundleWithIdentifier:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(+[SRSiriPresentationPluginHost sharedSiriPresentationPluginHost](SRSiriPresentationPluginHost, "sharedSiriPresentationPluginHost"));
  objc_msgSend(v4, "preloadPresentationBundleWithIdentifier:", v3);

}

- (void)preloadPluginBundles
{
  void *v2;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[SiriUICardProviderRegistry sharedInstance](SiriUICardProviderRegistry, "sharedInstance"));
  objc_msgSend(v2, "preloadProviders");

  +[VRXVisualResponseProvider preloadPlugins](VRXVisualResponseProvider, "preloadPlugins");
}

- (void)showPresentationWithIdentifier:(id)a3 properties:(id)a4 lockState:(unint64_t)a5
{
  self->_lockState = a5;
  -[SRSiriViewController updateToPresentationWithIdentifier:presentationProperties:animated:completion:](self, "updateToPresentationWithIdentifier:presentationProperties:animated:completion:", a3, a4, 0, 0);
}

- (void)_setPresentation:(id)a3
{
  -[SRSiriViewController setPresentation:](self, "setPresentation:", a3);
}

- (id)_presentationViewController
{
  void *v3;

  if ((objc_opt_respondsToSelector(self->_presentation, "viewController") & 1) != 0)
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[SiriUIPresentation viewController](self->_presentation, "viewController"));
  else
    v3 = 0;
  return v3;
}

- (void)_updateLanguageCode
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _language](self, "_language"));
  v3 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "spokenLanguageCode"));

  AFUISetLanguageCode(v3);
}

- (id)_dialogPhaseForItemAtIndexPath:(id)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _activeConversationItemAtIndexPath:](self, "_activeConversationItemAtIndexPath:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "dialogPhase"));

  return v4;
}

- (void)_performGenericAceCommand:(id)a3 turnIdentifier:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, uint64_t);
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  double v18;
  NSObject *v19;
  SAUISayIt *previousSayItCommand;
  SAUISayIt *v21;
  void *v22;
  int v23;
  const char *v24;
  __int16 v25;
  id v26;
  __int16 v27;
  SAUISayIt *v28;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, uint64_t))a5;
  v11 = mach_absolute_time();
  objc_opt_class(SAUISayIt, v12);
  if ((objc_opt_isKindOfClass(v8, v13) & 1) != 0)
  {
    -[SRSiriViewController _performSayItCommand:](self, "_performSayItCommand:", v8);
    if (!v10)
      goto LABEL_16;
    goto LABEL_15;
  }
  objc_opt_class(SAUICancelCurrentTTS, v14);
  if ((objc_opt_isKindOfClass(v8, v15) & 1) != 0)
  {
    -[SRSiriViewController _cancelCurrentTTS:](self, "_cancelCurrentTTS:", v8);
    if (!v10)
      goto LABEL_16;
    goto LABEL_15;
  }
  objc_opt_class(SASmsCancelCurrentAudioPlayBack, v16);
  if ((objc_opt_isKindOfClass(v8, v17) & 1) != 0)
  {
    -[SRSiriViewController _cancelCurrentAudioMessagePlayback:](self, "_cancelCurrentAudioMessagePlayback:", v8);
    if (!v10)
      goto LABEL_16;
    goto LABEL_15;
  }
  v18 = (double)v11;
  if (self->_previousSayItCommand)
  {
    v19 = AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
    {
      previousSayItCommand = self->_previousSayItCommand;
      v23 = 136315650;
      v24 = "-[SRSiriViewController _performGenericAceCommand:turnIdentifier:completion:]";
      v25 = 2112;
      v26 = v8;
      v27 = 2112;
      v28 = previousSayItCommand;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%s #tts recording _previousSayItCommand completed before processing ace command=%@, previousSayItCommand=%@", (uint8_t *)&v23, 0x20u);
    }
    -[SRSiriViewController _didCompleteActionForAceCommand:success:](self, "_didCompleteActionForAceCommand:success:", self->_previousSayItCommand, 1);
    v21 = self->_previousSayItCommand;
    self->_previousSayItCommand = 0;

  }
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _session](self, "_session"));
  objc_msgSend(v22, "performAceCommand:turnIdentifier:machAbsoluteTime:", v8, v9, v18);

  if (v10)
LABEL_15:
    v10[2](v10, 1);
LABEL_16:

}

- (void)_performSayItCommand:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  unsigned int v8;
  void *v9;
  NSString *v10;
  NSString *startRecordingSoundId;
  void *v12;
  SRSiriViewController *v13;
  id v14;
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
  uint64_t v25;
  unsigned int v26;
  void *v27;
  void *v28;
  id v29;
  id v30;
  id v31;
  id v32;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "context"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "message"));
  v31 = 0;
  v32 = 0;
  v28 = (void *)v5;
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _configuredSpeakableUtteranceParserForCommand:context:speakableText:subCompletion:speakPreparation:speakCompletion:](self, "_configuredSpeakableUtteranceParserForCommand:context:speakableText:subCompletion:speakPreparation:speakCompletion:", v4, v5, v6, 0, &v32, &v31));
  v30 = v32;
  v29 = v31;

  if (!self->_listenAfterSpeakingForRequestFinished)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "listenAfterSpeaking"));
    v8 = objc_msgSend(v7, "BOOLValue");

    if (v8)
    {
      -[SRSiriViewController _setListenAfterSpeakingForRequestFinished:](self, "_setListenAfterSpeakingForRequestFinished:", 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "listenAfterSpeakingBehavior"));
      v10 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "startAlertSoundID"));
      startRecordingSoundId = self->_startRecordingSoundId;
      self->_startRecordingSoundId = v10;

    }
  }
  -[SRSiriViewController _didStartActionForAceCommand:](self, "_didStartActionForAceCommand:", v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "voiceName"));

  if (v12)
  {
    v13 = self;
    v14 = objc_alloc_init((Class)SAVoice);
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "voiceName"));
    objc_msgSend(v14, "setName:", v15);

    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "languageCode"));
    v17 = v14;
    objc_msgSend(v14, "setLanguageString:", v16);

  }
  else
  {
    v13 = self;
    v17 = 0;
  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "message"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "audioData"));
  v26 = objc_msgSend(v4, "sruif_ignoresMuteSwitch");
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "aceId"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "refId"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "languageCode"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "gender"));
  BYTE2(v25) = objc_msgSend(v4, "canUseServerTTS");
  LOWORD(v25) = 0;
  -[SRSiriViewController _speakText:audioData:ignoreMuteSwitch:identifier:sessionId:preferredVoice:language:gender:provisionally:eligibleAfterDuration:delayed:canUseServerTTS:speakableUtteranceParser:analyticsContext:speakableContextInfo:preparation:completion:](v13, "_speakText:audioData:ignoreMuteSwitch:identifier:sessionId:preferredVoice:language:gender:provisionally:eligibleAfterDuration:delayed:canUseServerTTS:speakableUtteranceParser:analyticsContext:speakableContextInfo:preparation:completion:", v18, v19, v26, v20, v21, v17, 0.0, v22, v23, v25, v27, 0, 0, v30, v29);

  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "message"));
  -[SRSiriViewController _logAceObjectSpoken:dialogPhase:speakableText:](v13, "_logAceObjectSpoken:dialogPhase:speakableText:", v4, 0, v24);

}

- (void)_cancelCurrentTTS:(id)a3
{
  -[SRUIFSpeechSynthesizer skipCurrentSynthesis](self->_ttsManager, "skipCurrentSynthesis", a3);
}

- (void)_cancelCurrentAudioMessagePlayback:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _audioMessagePlayer](self, "_audioMessagePlayer", a3));
  objc_msgSend(v4, "stopPlaying");

  v7 = (id)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _audioMessagePlayer](self, "_audioMessagePlayer"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _audioMessagePlayer](self, "_audioMessagePlayer"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "playbackCommand"));
  -[SRSiriViewController audioPlayer:didFinishPlayback:](self, "audioPlayer:didFinishPlayback:", v7, v6);

}

- (void)_performAppPunchOutCommand:(id)a3 completion:(id)a4
{
  -[SRSiriViewController _performAppPunchOutCommand:conversationItemIdentifier:completion:](self, "_performAppPunchOutCommand:conversationItemIdentifier:completion:", a3, 0, a4);
}

- (void)_performAppPunchOutCommand:(id)a3 conversationItemIdentifier:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, _QWORD);
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  unsigned __int8 v17;
  void *v18;
  id v19;
  void (**v20)(id, _QWORD);
  void *v21;
  void *v22;
  id v23;
  void *v24;
  uint64_t v25;
  void *v26;
  NSObject *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  _QWORD *v37;
  void *v38;
  unsigned int v39;
  _QWORD *v40;
  _QWORD v41[4];
  id v42;
  _QWORD *v43;
  id v44;
  _QWORD v45[4];
  id v46;
  id v47;
  _QWORD v48[4];
  id v49;
  id v50;
  id v51;
  id v52;
  id location[2];

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, _QWORD))a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "bundleId"));
  if (v11)
  {

  }
  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "punchOutUri"));

    if (!v12)
    {
      if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
      {
        sub_10009FB38();
        if (!v10)
          goto LABEL_22;
      }
      else if (!v10)
      {
        goto LABEL_22;
      }
      v10[2](v10, 0);
      goto LABEL_22;
    }
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "refId"));
  if (!v13)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _punchoutMetricsAceCommandIdForItemWithIdentifier:](self, "_punchoutMetricsAceCommandIdForItemWithIdentifier:", v9));
    if (!v13)
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "aceId"));
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "bundleId"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@-%@"), v13, v14));

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _completedCommandAppPunchOutIds](self, "_completedCommandAppPunchOutIds"));
  v17 = objc_msgSend(v16, "containsObject:", v15);

  if ((v17 & 1) == 0)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _completedCommandAppPunchOutIds](self, "_completedCommandAppPunchOutIds"));
    objc_msgSend(v18, "addObject:", v15);

    objc_initWeak(location, self);
    v48[0] = _NSConcreteStackBlock;
    v48[1] = 3221225472;
    v48[2] = sub_100053D5C;
    v48[3] = &unk_100123A20;
    objc_copyWeak(&v52, location);
    v49 = v13;
    v19 = v8;
    v50 = v19;
    v20 = v10;
    v51 = v20;
    v40 = objc_retainBlock(v48);
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "alternativePunchOut"));

    if (v21)
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "alternativePunchOut"));
      -[SRSiriViewController _performGenericAceCommand:turnIdentifier:completion:](self, "_performGenericAceCommand:turnIdentifier:completion:", v22, 0, v20);
    }
    else
    {
      v45[0] = _NSConcreteStackBlock;
      v45[1] = 3221225472;
      v45[2] = sub_100053E64;
      v45[3] = &unk_100123A48;
      v23 = v19;
      v46 = v23;
      v37 = v40;
      v47 = v37;
      v38 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _hostWithErrorHandler:](self, "_hostWithErrorHandler:", v45));
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
      v25 = objc_opt_respondsToSelector(v24, "shouldPunchOutInPlace");

      if ((v25 & 1) != 0)
      {
        v26 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
        v39 = objc_msgSend(v26, "shouldPunchOutInPlace");

        if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
          sub_10009FBA4();
      }
      else
      {
        v27 = AFSiriLogContextConnection;
        if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
          sub_10009FC34(v27, v28, v29, v30, v31, v32, v33, v34);
        v39 = 0;
      }
      v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "punchOutUri"));
      v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "bundleId"));
      v41[0] = _NSConcreteStackBlock;
      v41[1] = 3221225472;
      v41[2] = sub_100053ED4;
      v41[3] = &unk_100123AC0;
      v43 = v37;
      v42 = v23;
      objc_copyWeak(&v44, location);
      objc_msgSend(v38, "openURL:bundleId:inPlace:completion:", v35, v36, v39, v41);

      objc_destroyWeak(&v44);
      v22 = v46;
    }

    objc_destroyWeak(&v52);
    objc_destroyWeak(location);
  }

LABEL_22:
}

- (void)_cancelIdleTimer
{
  void *v3;
  NSObject *v4;
  void *v5;
  int v6;
  const char *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _idleTimer](self, "_idleTimer"));

  if (v3)
  {
    v4 = AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 136315138;
      v7 = "-[SRSiriViewController _cancelIdleTimer]";
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s #idleTimer", (uint8_t *)&v6, 0xCu);
    }
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _idleTimer](self, "_idleTimer"));
    objc_msgSend(v5, "invalidate");

    -[SRSiriViewController _setIdleTimer:](self, "_setIdleTimer:", 0);
  }
}

- (void)_scheduleIdleTimer
{
  void *v3;
  char v4;
  double v5;
  void *v6;
  double v7;
  NSObject *v8;
  void *v9;
  int v10;
  const char *v11;
  __int16 v12;
  double v13;

  -[SRSiriViewController _cancelIdleTimer](self, "_cancelIdleTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
  v4 = objc_opt_respondsToSelector(v3, "idleTimerInterval");

  v5 = 5.0;
  if ((v4 & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
    objc_msgSend(v6, "idleTimerInterval");
    v5 = v7;

  }
  v8 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 136315394;
    v11 = "-[SRSiriViewController _scheduleIdleTimer]";
    v12 = 2048;
    v13 = v5;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s #idleTimer idleTimerInterval=%f seconds", (uint8_t *)&v10, 0x16u);
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:](NSTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, "_idleTimerFired:", 0, 0, v5));
  -[SRSiriViewController _setIdleTimer:](self, "_setIdleTimer:", v9);

}

- (void)_rescheduleIdleTimerIfNeeded
{
  unsigned int v3;
  unsigned int v4;
  void *v5;
  char v6;
  void *v7;
  unsigned int v8;
  NSObject *v9;
  int v10;
  const char *v11;
  __int16 v12;
  unsigned int v13;
  __int16 v14;
  unsigned int v15;
  __int16 v16;
  unsigned int v17;

  -[SRSiriViewController _checkAndUpdateSiriIsIdleAndQuietStatusWithChangeHandler:](self, "_checkAndUpdateSiriIsIdleAndQuietStatusWithChangeHandler:", 0);
  v3 = -[SRSiriViewController _isSiriIdleAndQuiet](self, "_isSiriIdleAndQuiet");
  v4 = -[SRSiriViewController _isIdleTimerEnabled](self, "_isIdleTimerEnabled");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
  v6 = objc_opt_respondsToSelector(v5, "isPresentingUIFromRemoteDevice");

  if ((v6 & 1) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
    v8 = objc_msgSend(v7, "isPresentingUIFromRemoteDevice");

  }
  else
  {
    v8 = 0;
  }
  v9 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 136315906;
    v11 = "-[SRSiriViewController _rescheduleIdleTimerIfNeeded]";
    v12 = 1024;
    v13 = v3;
    v14 = 1024;
    v15 = v4;
    v16 = 1024;
    v17 = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s #idleTimer idleAndQuiet=%i idleTimerEnabled=%i isPresentingUIFromRemoteDevice:%i", (uint8_t *)&v10, 0x1Eu);
  }
  if ((v4 & (v3 | v8)) == 1)
    -[SRSiriViewController _scheduleIdleTimer](self, "_scheduleIdleTimer");
  else
    -[SRSiriViewController _cancelIdleTimer](self, "_cancelIdleTimer");
}

- (void)_idleTimerFired:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  unsigned int v7;
  unsigned int v8;
  unsigned int v9;
  void *v10;
  char v11;
  void *v12;
  unsigned int v13;
  NSObject *v14;
  _BOOL4 v15;
  void *v16;
  char v17;
  void *v18;
  int v19;
  const char *v20;
  __int16 v21;
  unsigned int v22;
  __int16 v23;
  unsigned int v24;
  __int16 v25;
  unsigned int v26;
  __int16 v27;
  unsigned int v28;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation", a3));
  v5 = objc_opt_respondsToSelector(v4, "shouldDismissForIdling");

  if ((v5 & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
    v7 = objc_msgSend(v6, "shouldDismissForIdling");

  }
  else
  {
    v7 = 0;
  }
  v8 = -[SRSiriViewController _isIdleTimerEnabled](self, "_isIdleTimerEnabled");
  v9 = -[SRSiriViewController _isSiriIdleAndQuiet](self, "_isSiriIdleAndQuiet");
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
  v11 = objc_opt_respondsToSelector(v10, "isPresentingUIFromRemoteDevice");

  if ((v11 & 1) != 0)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
    v13 = objc_msgSend(v12, "isPresentingUIFromRemoteDevice");

  }
  else
  {
    v13 = 0;
  }
  v14 = AFSiriLogContextConnection;
  v15 = os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT);
  if ((v7 & v8 & (v9 | v13)) == 1)
  {
    if (v15)
    {
      v19 = 136315138;
      v20 = "-[SRSiriViewController _idleTimerFired:]";
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%s #idleTimer Dismissing Siri", (uint8_t *)&v19, 0xCu);
    }
    -[SRSiriViewController _cancelIdleTimer](self, "_cancelIdleTimer");
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
    v17 = objc_opt_respondsToSelector(v16, "siriWillDismissWithReason:completion:");

    if ((v17 & 1) != 0)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
      objc_msgSend(v18, "siriWillDismissWithReason:completion:", 1, 0);

    }
    -[SRSiriViewController _dismissWithReason:](self, "_dismissWithReason:", 4);
  }
  else
  {
    if (v15)
    {
      v19 = 136316162;
      v20 = "-[SRSiriViewController _idleTimerFired:]";
      v21 = 1024;
      v22 = v7;
      v23 = 1024;
      v24 = v9;
      v25 = 1024;
      v26 = v8;
      v27 = 1024;
      v28 = v13;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%s #idleTimer Not dismissing Siri - readyToDismiss:%d idleAndQuiet:%d idleTimerEnabled:%d isPresentingUIFromRemoteDevice:%d", (uint8_t *)&v19, 0x24u);
    }
    -[SRSiriViewController _rescheduleIdleTimerIfNeeded](self, "_rescheduleIdleTimerIfNeeded");
  }
}

- (BOOL)_isSiriIdleAndQuiet
{
  int64_t siriState;
  BOOL v4;
  int v5;
  unsigned int v6;
  unsigned int v7;
  unsigned int v8;
  unsigned int v9;
  _BOOL4 delaySessionEndForInPlacePunchout;
  int v11;
  _BOOL4 v12;
  NSObject *v13;
  const __CFString *v14;
  int v16;
  const char *v17;
  __int16 v18;
  const __CFString *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  unsigned int v23;
  __int16 v24;
  unsigned int v25;
  __int16 v26;
  unsigned int v27;
  __int16 v28;
  unsigned int v29;
  __int16 v30;
  _BOOL4 v31;

  siriState = self->_siriState;
  if (siriState)
    v4 = siriState == 3;
  else
    v4 = 1;
  v5 = v4;
  v6 = -[SRSiriViewController _isRequestActive](self, "_isRequestActive");
  v7 = -[SRSiriViewController _isSpeechSynthesisSpeaking](self, "_isSpeechSynthesisSpeaking");
  v8 = -[SRSiriViewController _isAudioPlayerPlaying](self, "_isAudioPlayerPlaying");
  v9 = -[SRSiriViewController _isWaitingForStartRequest](self, "_isWaitingForStartRequest");
  delaySessionEndForInPlacePunchout = self->_delaySessionEndForInPlacePunchout;
  v11 = v9 ^ 1;
  if (self->_delaySessionEndForInPlacePunchout)
    v11 = 0;
  if ((v8 & 1) != 0)
    v11 = 0;
  if ((v7 & 1) != 0)
    v11 = 0;
  if ((v6 & 1) != 0)
    v11 = 0;
  if (v5 == 1)
    v12 = v11;
  else
    v12 = 0;
  v13 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    v14 = CFSTR("NO ");
    v16 = 136316930;
    v17 = "-[SRSiriViewController _isSiriIdleAndQuiet]";
    v18 = 2112;
    if (v12)
      v14 = CFSTR("YES");
    v19 = v14;
    v20 = 1024;
    v21 = v5;
    v22 = 1024;
    v23 = v6;
    v24 = 1024;
    v25 = v7;
    v26 = 1024;
    v27 = v8;
    v28 = 1024;
    v29 = v9;
    v30 = 1024;
    v31 = delaySessionEndForInPlacePunchout;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%s #idle %@ - inIdleState:%d requestActive:%d speaking:%d audioPlaying:%d waitingForStartRequest:%d delayingSessionEndForInPlacePunchout:%d", (uint8_t *)&v16, 0x3Au);
  }
  return v12;
}

- (void)_checkAndUpdateSiriIsIdleAndQuietStatusWithChangeHandler:(id)a3
{
  _BOOL8 v4;
  unint64_t v5;
  uint64_t v6;
  void *v7;
  void (**v8)(id, _BOOL8);

  v8 = (void (**)(id, _BOOL8))a3;
  v4 = -[SRSiriViewController _isSiriIdleAndQuiet](self, "_isSiriIdleAndQuiet");
  v5 = -[SRSiriViewController _wasSiriIdleAndQuiet](self, "_wasSiriIdleAndQuiet");
  if (v4)
    v6 = 1;
  else
    v6 = 2;
  -[SRSiriViewController _setWasSiriIdleAndQuiet:](self, "_setWasSiriIdleAndQuiet:", v6);
  if (v5 != v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _hostWithErrorHandler:](self, "_hostWithErrorHandler:", &stru_100123AE0));
    objc_msgSend(v7, "siriIdleAndQuietStatusDidChange:", v4);

    -[SRSiriViewController _scheduleInterruptedAudioResumingIfNeeded](self, "_scheduleInterruptedAudioResumingIfNeeded");
    if (v8)
      v8[2](v8, v4);
  }

}

- (void)_checkAndUpdateSiriIdleAndQuietStatusIfNeeded
{
  _QWORD v3[4];
  id v4;
  id location;

  objc_initWeak(&location, self);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100054B34;
  v3[3] = &unk_100122CD8;
  objc_copyWeak(&v4, &location);
  -[SRSiriViewController _checkAndUpdateSiriIsIdleAndQuietStatusWithChangeHandler:](self, "_checkAndUpdateSiriIsIdleAndQuietStatusWithChangeHandler:", v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

- (void)_scheduleInterruptedAudioResumingIfNeeded
{
  _QWORD v3[4];
  id v4;
  id location;

  if (!self->_waitingForTelephonyToStart)
  {
    if (-[SRSiriViewController _isSiriIdleAndQuiet](self, "_isSiriIdleAndQuiet"))
    {
      objc_initWeak(&location, self);
      v3[0] = _NSConcreteStackBlock;
      v3[1] = 3221225472;
      v3[2] = sub_100054E34;
      v3[3] = &unk_100122CD8;
      objc_copyWeak(&v4, &location);
      -[SRSiriViewController _fetchAttendingState:](self, "_fetchAttendingState:", v3);
      objc_destroyWeak(&v4);
      objc_destroyWeak(&location);
    }
  }
}

- (void)_scheduleAudioResumptionAfterDelayInSec:(double)a3
{
  NSObject *v5;
  dispatch_time_t v6;
  _QWORD block[4];
  id v8;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  double v12;

  v5 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v10 = "-[SRSiriViewController _scheduleAudioResumptionAfterDelayInSec:]";
    v11 = 2048;
    v12 = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s Scheduling interrupted audio to be resumed in %lf seconds", buf, 0x16u);
  }
  objc_initWeak((id *)buf, self);
  v6 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100055074;
  block[3] = &unk_100122638;
  objc_copyWeak(&v8, (id *)buf);
  dispatch_after(v6, (dispatch_queue_t)&_dispatch_main_q, block);
  objc_destroyWeak(&v8);
  objc_destroyWeak((id *)buf);
}

- (void)_checkAndUpdateSiriIdleAndQuietStatusOrRescheduleIdleTimerIfNeeded
{
  if (-[SRSiriViewController _usesEventDrivenIdleAndQuietUpdates](self, "_usesEventDrivenIdleAndQuietUpdates"))
    -[SRSiriViewController _checkAndUpdateSiriIdleAndQuietStatusIfNeeded](self, "_checkAndUpdateSiriIdleAndQuietStatusIfNeeded");
  else
    -[SRSiriViewController _rescheduleIdleTimerIfNeeded](self, "_rescheduleIdleTimerIfNeeded");
}

- (BOOL)_resumesInterruptedAudioPlaybackForAttendingState:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  unsigned __int8 v5;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
  if ((objc_opt_respondsToSelector(v4, "shouldResumeInterruptedAudioPlaybackForAttendingState:") & 1) != 0)
    v5 = objc_msgSend(v4, "shouldResumeInterruptedAudioPlaybackForAttendingState:", v3);
  else
    v5 = 0;

  return v5;
}

- (BOOL)_usesEventDrivenIdleAndQuietUpdates
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
  if ((objc_opt_respondsToSelector(v2, "shouldUseEventDrivenIdleAndQuietUpdates") & 1) != 0)
    v3 = objc_msgSend(v2, "shouldUseEventDrivenIdleAndQuietUpdates");
  else
    v3 = 0;

  return v3;
}

- (void)_setExperimentationManager:(id)a3
{
  objc_storeStrong((id *)&self->_manager, a3);
}

- (void)_handleRequestError:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  _QWORD v14[4];
  id v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  id v19;

  v6 = a3;
  v7 = a4;
  if (v6)
  {
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
      sub_10009FDF4();
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[SRErrorUtility userStringForError:reflectionDialogWasPlayed:](SRErrorUtility, "userStringForError:reflectionDialogWasPlayed:", v6, -[SRSiriViewController _reflectionDialogHasBeenPlayed](self, "_reflectionDialogHasBeenPlayed")));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _instrumentationManager](self, "_instrumentationManager"));
    objc_msgSend(v9, "emitRequestFailedWithError:", v6);

    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "domain"));
    if (objc_msgSend(v10, "isEqualToString:", kAFAssistantErrorDomain))
    {
      v11 = objc_msgSend(v6, "code");

      if (v11 == (id)6)
      {
        v12 = AFSiriLogContextConnection;
        if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          v17 = "-[SRSiriViewController _handleRequestError:completion:]";
          v18 = 2114;
          v19 = v6;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%s #errorHandling handling kAFErrorNotReady: %{public}@ locally", buf, 0x16u);
        }
        -[SRSiriViewController _displayNotReadyError:](self, "_displayNotReadyError:", v7);
        goto LABEL_20;
      }
    }
    else
    {

    }
    if (v8)
    {
      -[SRSiriViewController _addErrorUtterance:](self, "_addErrorUtterance:", v8);
      if (!-[SRSiriViewController _suppressTTSForErrorsAndInterstitials](self, "_suppressTTSForErrorsAndInterstitials"))
      {
        v13 = AFSiriLogContextConnection;
        if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          v17 = "-[SRSiriViewController _handleRequestError:completion:]";
          v18 = 2112;
          v19 = v8;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%s #errorHandling speaking error TTS with error string: '%@'", buf, 0x16u);
        }
        v14[0] = _NSConcreteStackBlock;
        v14[1] = 3221225472;
        v14[2] = sub_100055530;
        v14[3] = &unk_100123450;
        v15 = v7;
        -[SRSiriViewController _synthesizeText:identifier:sessionId:completion:](self, "_synthesizeText:identifier:sessionId:completion:", v8, 0, 0, v14);

        goto LABEL_20;
      }
    }
    else if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      sub_10009FD88();
      if (!v7)
        goto LABEL_20;
      goto LABEL_19;
    }
    if (!v7)
    {
LABEL_20:

      goto LABEL_21;
    }
LABEL_19:
    (*((void (**)(id, BOOL))v7 + 2))(v7, v8 != 0);
    goto LABEL_20;
  }
  +[SRErrorUtility resetErrorState](SRErrorUtility, "resetErrorState");
  if (v7)
    (*((void (**)(id, _QWORD))v7 + 2))(v7, 0);
LABEL_21:

}

- (void)_displayNotReadyError:(id)a3
{
  id v4;
  uint64_t v5;
  double v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  double v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v16[4];
  id v17;

  v4 = a3;
  *(_QWORD *)&v6 = objc_opt_class(self, v5).n128_u64[0];
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleForClass:](NSBundle, "bundleForClass:", v7, v6));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "assistantUILocalizedStringForKey:table:", CFSTR("ASSISTANT_NOT_READY_TITLE"), 0));

  *(_QWORD *)&v11 = objc_opt_class(self, v10).n128_u64[0];
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleForClass:](NSBundle, "bundleForClass:", v12, v11));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "assistantUILocalizedStringForKey:table:", CFSTR("ASSISTANT_NOT_READY_MESSAGE"), 0));

  -[SRSiriViewController _addErrorUtterance:](self, "_addErrorUtterance:", v9);
  -[SRSiriViewController _addErrorUtterance:](self, "_addErrorUtterance:", v14);
  -[SRSiriViewController _synthesizeText:identifier:sessionId:completion:](self, "_synthesizeText:identifier:sessionId:completion:", v9, 0, 0, 0);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100055694;
  v16[3] = &unk_100123450;
  v17 = v4;
  v15 = v4;
  -[SRSiriViewController _synthesizeText:identifier:sessionId:completion:](self, "_synthesizeText:identifier:sessionId:completion:", v14, 0, 0, v16);

}

- (id)_searchAddViewsForSpokenHintsView:(id)a3
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  unsigned __int8 v11;
  NSObject *v12;
  id v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t buf[4];
  const char *v20;
  _BYTE v21[128];

  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "views", 0));
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v16;
    v7 = SAAceViewUIItemTypeItemTypeHintValue;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v6)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "itemType"));
        v11 = objc_msgSend(v10, "isEqualToString:", v7);

        if ((v11 & 1) != 0)
        {
          v14 = v9;

          return v14;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
      if (v5)
        continue;
      break;
    }
  }

  v12 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v20 = "-[SRSiriViewController _searchAddViewsForSpokenHintsView:]";
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%s #suggestions No hints SAAceView in the SAUIAddViews.", buf, 0xCu);
  }
  return 0;
}

- (void)_enqueueSpokenSuggestionsFromAddViews:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  _QWORD v7[4];
  id v8;
  id v9;
  uint8_t buf[4];
  const char *v11;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _searchAddViewsForSpokenHintsView:](self, "_searchAddViewsForSpokenHintsView:", v4));
  if (v5)
  {
    v6 = AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v11 = "-[SRSiriViewController _enqueueSpokenSuggestionsFromAddViews:]";
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s #suggestions We found a hints SAAceView in the SAUIAddViews. Querying SiriSuggestions for potential spoken hints.", buf, 0xCu);
    }
    -[SRUIFAceCommandRecords recordActionStartedForAceCommand:](self->_aceCommandRecords, "recordActionStartedForAceCommand:", v4);
    objc_initWeak((id *)buf, self);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1000559DC;
    v7[3] = &unk_100123B30;
    objc_copyWeak(&v9, (id *)buf);
    v8 = v4;
    +[SiriUISpokenSuggestionsProvider fetchTopSpokenSuggestionFrom:completion:](_TtC4Siri31SiriUISpokenSuggestionsProvider, "fetchTopSpokenSuggestionFrom:completion:", v8, v7);

    objc_destroyWeak(&v9);
    objc_destroyWeak((id *)buf);
  }

}

- (void)_speakEnqueuedSpokenSuggestion
{
  NSObject *v3;
  _TtC4Siri16SiriUISuggestion *v4;
  _TtC4Siri16SiriUISuggestion *enqueuedSuggestion;
  void *v6;
  _TtC4Siri16SiriUISuggestion *v7;
  _QWORD v8[4];
  _TtC4Siri16SiriUISuggestion *v9;
  id v10;
  uint8_t buf[4];
  const char *v12;

  v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v12 = "-[SRSiriViewController _speakEnqueuedSpokenSuggestion]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s #suggestions Request TTS finished. Calling exposure callback and speaking hint TTS.", buf, 0xCu);
  }
  v4 = self->_enqueuedSuggestion;
  enqueuedSuggestion = self->_enqueuedSuggestion;
  self->_enqueuedSuggestion = 0;

  -[SiriUISuggestion siriDidSpeakHint](v4, "siriDidSpeakHint");
  objc_initWeak((id *)buf, self);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SiriUISuggestion spokenText](v4, "spokenText"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100055CD0;
  v8[3] = &unk_100123778;
  objc_copyWeak(&v10, (id *)buf);
  v7 = v4;
  v9 = v7;
  -[SRSiriViewController _synthesizeText:identifier:sessionId:completion:](self, "_synthesizeText:identifier:sessionId:completion:", v6, 0, 0, v8);

  objc_destroyWeak(&v10);
  objc_destroyWeak((id *)buf);

}

- (void)_logRevealSpeechCommandReceived:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  double v10;
  void *i;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  const __CFString *v20;
  void *v21;
  _BYTE v22[128];

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "recognition"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "utterances"));

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    v10 = 0.0;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i), "confidenceScore", (_QWORD)v16);
        v10 = v10 + v12;
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
    }
    while (v8);
  }
  else
  {
    v10 = 0.0;
  }

  if (objc_msgSend(v6, "count"))
    v10 = v10 / (double)(unint64_t)objc_msgSend(v6, "count");
  v20 = CFSTR("confidenceScore");
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v10, (_QWORD)v16));
  v21 = v13;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1));

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _analytics](self, "_analytics"));
  objc_msgSend(v15, "logEventWithType:context:", 1459, v14);

}

- (unint64_t)_currentModeWithModeProvider:(id)a3
{
  return (unint64_t)_objc_msgSend(a3, "currentMode");
}

- (id)_analytics
{
  return +[AFAnalytics sharedAnalytics](AFAnalytics, "sharedAnalytics");
}

- (id)_instrumentationManager
{
  return +[SRUIFInstrumentationManager sharedManager](SRUIFInstrumentationManager, "sharedManager");
}

- (void)_addErrorUtterance:(id)a3
{
  id v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v4 = a3;
  v11 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v5 = objc_alloc_init((Class)SAUIAddViews);
  objc_msgSend(v5, "setDialogPhase:", SAUIDialogPhaseErrorValue);
  v6 = objc_alloc_init((Class)SAUIAssistantUtteranceView);
  objc_msgSend(v6, "setText:", v4);

  objc_msgSend(v11, "addObject:", v6);
  objc_msgSend(v5, "setViews:", v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "dictionary"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[AceObject aceObjectWithDictionary:](AceObject, "aceObjectWithDictionary:", v7));

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "UUIDString"));
  objc_msgSend(v8, "setAceId:", v10);

  -[SRSiriViewController _performGenericAceCommand:turnIdentifier:completion:](self, "_performGenericAceCommand:turnIdentifier:completion:", v8, 0, 0);
}

- (void)_audioSessionRouteDidChange:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "userInfo"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", AVAudioSessionRouteChangeReasonKey));
  v6 = objc_msgSend(v5, "unsignedIntegerValue");

  if (v6 == (id)2)
    -[SRSiriViewController _cancelSpeechSynthesis](self, "_cancelSpeechSynthesis");
}

- (void)_startListenAfterSpeaking
{
  void *v3;
  SASRequestOptions *requestOptions;
  NSObject *v5;
  uint64_t Name;
  void *v7;
  void *v8;
  unsigned __int8 v9;
  NSObject *v10;
  NSObject *v11;
  const char *v12;
  void *v13;
  unsigned int v14;
  NSObject *v15;
  _QWORD v16[4];
  id v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  void *v21;

  -[SRSiriViewController _setAcousticIdAllowed:](self, "_setAcousticIdAllowed:", 0);
  if (-[SASRequestOptions requestSource](self->_requestOptions, "requestSource") == (id)23
    || -[SASRequestOptions isSuggestionSourceWithTextInput](self->_requestOptions, "isSuggestionSourceWithTextInput"))
  {
    v3 = (void *)AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
    {
      requestOptions = self->_requestOptions;
      v5 = v3;
      Name = SASRequestSourceGetName(-[SASRequestOptions requestSource](requestOptions, "requestSource"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(Name);
      *(_DWORD *)buf = 136315394;
      v19 = "-[SRSiriViewController _startListenAfterSpeaking]";
      v20 = 2112;
      v21 = v7;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s #tts Not listening after speaking because requestSource == %@", buf, 0x16u);

    }
    return;
  }
  if (!-[SASRequestOptions isForAppleTV](self->_requestOptions, "isForAppleTV"))
  {
LABEL_11:
    if (-[SRSiriViewController _isStartRequestAceCommandSent](self, "_isStartRequestAceCommandSent"))
    {
      v11 = AFSiriLogContextConnection;
      if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v19 = "-[SRSiriViewController _startListenAfterSpeaking]";
        v12 = "%s #tts Not listening after speaking because SAStartRequest was sent during TTS";
LABEL_17:
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, v12, buf, 0xCu);
      }
    }
    else
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[AFPreferences sharedPreferences](AFPreferences, "sharedPreferences"));
      v14 = objc_msgSend(v13, "listenAfterSpeakingDisabled");

      if (!v14)
      {
        objc_initWeak((id *)buf, self);
        v16[0] = _NSConcreteStackBlock;
        v16[1] = 3221225472;
        v16[2] = sub_100056570;
        v16[3] = &unk_100122CD8;
        objc_copyWeak(&v17, (id *)buf);
        -[SRSiriViewController _fetchAttendingState:](self, "_fetchAttendingState:", v16);
        objc_destroyWeak(&v17);
        objc_destroyWeak((id *)buf);
        return;
      }
      v11 = AFSiriLogContextConnection;
      if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v19 = "-[SRSiriViewController _startListenAfterSpeaking]";
        v12 = "%s #tts Not listening after speaking because listenAfterSpeakingDisabled == YES";
        goto LABEL_17;
      }
    }
    self->_keyboardEnabled = 1;
    return;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SASRequestOptions requestInfo](self->_requestOptions, "requestInfo"));
  if ((objc_msgSend(v8, "afui_isRemoteHeadsetActivation") & 1) != 0)
  {

    goto LABEL_9;
  }
  v9 = -[SASRequestOptions afui_isTVFollowUpHearstActivation](self->_requestOptions, "afui_isTVFollowUpHearstActivation");

  if ((v9 & 1) != 0)
  {
LABEL_9:
    v10 = AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v19 = "-[SRSiriViewController _startListenAfterSpeaking]";
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s #tts #tv Allowing listening after speaking for multi-turn request on AppleTV when auto endpointing is on", buf, 0xCu);
    }
    goto LABEL_11;
  }
  v15 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v19 = "-[SRSiriViewController _startListenAfterSpeaking]";
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%s #tts #tv Not listening after speaking because requestSource is one of the request sources for AppleTV.", buf, 0xCu);
  }
}

- (void)siriPresentation:(id)a3 requestsAttendingStateWithCompletion:(id)a4
{
  -[SRSiriViewController _fetchAttendingState:](self, "_fetchAttendingState:", a4);
}

- (void)_fetchAttendingState:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _session](self, "_session"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100056734;
  v7[3] = &unk_100122688;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "fetchAttendingState:", v7);

}

- (void)_notifyPromptedUserForInput
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _session](self, "_session"));
  objc_msgSend(v2, "promptedUserForInput");

}

- (void)_startListenAfterSpeakingRequest
{
  NSObject *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  SRUIFSpeechSynthesizer *ttsManager;
  id v14;
  _QWORD v15[4];
  id v16;
  SRSiriViewController *v17;
  id v18;
  uint8_t buf[4];
  const char *v20;

  v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v20 = "-[SRSiriViewController _startListenAfterSpeakingRequest]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s #tts Start listening. Starting new request after TTS completed", buf, 0xCu);
  }
  v4 = objc_alloc((Class)SASRequestOptions);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _uiPresentationIdentifier](self, "_uiPresentationIdentifier"));
  v6 = objc_msgSend(v4, "initWithRequestSource:uiPresentationIdentifier:", 9, v5);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _requestOptions](self, "_requestOptions"));
  objc_msgSend(v6, "setIsForBluetoothCar:", objc_msgSend(v7, "isForBluetoothCar"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _requestOptions](self, "_requestOptions"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "originalRequestOptions"));
  if (v9)
  {
    objc_msgSend(v6, "setOriginalRequestOptions:", v9);
  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _requestOptions](self, "_requestOptions"));
    objc_msgSend(v6, "setOriginalRequestOptions:", v10);

  }
  objc_msgSend(v6, "setStartRecordingSoundId:", self->_startRecordingSoundId);
  v11 = objc_msgSend(objc_alloc((Class)AFSpeechRequestOptions), "initWithActivationEvent:", 5);
  v12 = (void *)objc_opt_new(AFRequestInfo);
  objc_msgSend(v12, "setSpeechRequestOptions:", v11);
  objc_msgSend(v6, "setRequestInfo:", v12);
  objc_initWeak((id *)buf, self);
  ttsManager = self->_ttsManager;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000569E0;
  v15[3] = &unk_100123060;
  objc_copyWeak(&v18, (id *)buf);
  v14 = v6;
  v16 = v14;
  v17 = self;
  -[SRUIFSpeechSynthesizer isSynthesisQueueEmpty:](ttsManager, "isSynthesisQueueEmpty:", v15);

  objc_destroyWeak(&v18);
  objc_destroyWeak((id *)buf);

}

- (id)_punchoutMetricsAceCommandIdForItemWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  unsigned int v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;

  v4 = a3;
  if (v4
    && (v5 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _activeConversation](self, "_activeConversation")),
        v6 = objc_msgSend(v5, "containsItemWithIdentifier:", v4),
        v5,
        v6)
    && (v7 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _activeConversation](self, "_activeConversation")),
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "itemWithIdentifier:", v4)),
        v7,
        v8))
  {
    while (1)
    {
      v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "aceCommandIdentifier"));
      if (v9)
        break;
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _activeConversation](self, "_activeConversation"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "identifier"));
      v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "parentOfItemWithIdentifier:", v11));

      v8 = (void *)v12;
      if (!v12)
      {
        v13 = 0;
        goto LABEL_10;
      }
    }
    v13 = (void *)v9;
LABEL_10:

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)_metricsContextForItemWithAceCommandId:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v14;
  _QWORD v15[2];
  _QWORD v16[2];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _aceCommandRecords](self, "_aceCommandRecords"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "aceCommandWithIdentifier:", v4));

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "refId"));

    v8 = 0;
    if (v4 && v7)
    {
      v15[0] = CFSTR("i");
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "refId"));
      v15[1] = CFSTR("a");
      v16[0] = v9;
      v16[1] = v4;
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v16, v15, 2));

      v14 = 0;
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSJSONSerialization dataWithJSONObject:options:error:](NSJSONSerialization, "dataWithJSONObject:options:error:", v10, 0, &v14));
      v12 = v14;
      if (v11)
      {
        v8 = objc_msgSend(objc_alloc((Class)NSString), "initWithData:encoding:", v11, 4);
      }
      else
      {
        if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
          sub_10009FE60();
        v8 = 0;
      }

    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)_uiPresentationIdentifier
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  __CFString *v7;
  void *v8;
  char v9;
  void *v10;
  char *v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _requestOptions](self, "_requestOptions"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "uiPresentationIdentifier"));
  v5 = objc_msgSend(v4, "length");

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _requestOptions](self, "_requestOptions"));
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "uiPresentationIdentifier"));

  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
    v9 = objc_opt_respondsToSelector(v8, "options");

    if ((v9 & 1) != 0
      && (v10 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation")),
          v11 = (char *)objc_msgSend(v10, "options"),
          v10,
          (unint64_t)(v11 - 1) <= 7))
    {
      v7 = off_100123B68[(_QWORD)(v11 - 1)];
    }
    else
    {
      v7 = CFSTR("com.apple.siri.Compact");
    }
  }
  return v7;
}

- (void)_logAceObjectPresented:(id)a3 dialogPhase:(id)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  SRUIFAnalyticsSupplement *analyticsSupplement;
  void *v17;
  id v18;
  void *v19;
  char v20;
  void *v21;
  id v22;
  id v23;

  v23 = a3;
  v6 = a4;
  objc_opt_class(SASSpeechPartialResult, v7);
  if ((objc_opt_isKindOfClass(v23, v8) & 1) != 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _instrumentationManager](self, "_instrumentationManager"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "aceId"));
    objc_msgSend(v10, "emitPartialSpeechTranscriptionEventForAceObjectWithIdentifier:", v11);
LABEL_7:

    goto LABEL_8;
  }
  objc_opt_class(SASSpeechRecognized, v9);
  if ((objc_opt_isKindOfClass(v23, v12) & 1) != 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _instrumentationManager](self, "_instrumentationManager"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "aceId"));
    objc_msgSend(v10, "emitFinalSpeechTranscriptionEventForAceObjectWithIdentifier:", v11);
    goto LABEL_7;
  }
  objc_opt_class(SAUIRevealRecognizedSpeech, v13);
  if ((objc_opt_isKindOfClass(v23, v14) & 1) != 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _instrumentationManager](self, "_instrumentationManager"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "aceId"));
    objc_msgSend(v10, "emitRevealSpeechTranscriptionEventForAceObjectWithIdentifier:", v11);
    goto LABEL_7;
  }
  v15 = -[SRSiriViewController _instrumentationPresentationForPresentationOptions:](self, "_instrumentationPresentationForPresentationOptions:", -[SRSiriViewController _presentationOptions](self, "_presentationOptions"));
  analyticsSupplement = self->_analyticsSupplement;
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "refId"));
  v18 = -[SRUIFAnalyticsSupplement computedModeForRefId:](analyticsSupplement, "computedModeForRefId:", v17);

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
  v20 = objc_opt_respondsToSelector(v19, "viewRegionForPresentedAceObject:");

  if ((v20 & 1) != 0)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
    v22 = objc_msgSend(v21, "viewRegionForPresentedAceObject:", v23);

  }
  else
  {
    v22 = 0;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _instrumentationManager](self, "_instrumentationManager"));
  objc_msgSend(v10, "emitUUFRShownForAceObject:presentationType:dialogPhase:mode:viewRegion:", v23, v15, v6, v18, v22);
LABEL_8:

}

- (void)_logAceObjectSpoken:(id)a3 dialogPhase:(id)a4 speakableText:(id)a5
{
  -[SRSiriViewController _logAceObjectSpoken:dialogPhase:speakableText:dialogIdentifierOverride:](self, "_logAceObjectSpoken:dialogPhase:speakableText:dialogIdentifierOverride:", a3, a4, a5, 0);
}

- (void)_logAceObjectSpoken:(id)a3 dialogPhase:(id)a4 speakableText:(id)a5 dialogIdentifierOverride:(id)a6
{
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  SRUIFAnalyticsSupplement *analyticsSupplement;
  id v18;
  SRUIFAnalyticsSupplement *v19;
  void *v20;
  id v21;
  void *v22;
  id v23;

  v23 = a3;
  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = -[SRSiriViewController _instrumentationPresentationForPresentationOptions:](self, "_instrumentationPresentationForPresentationOptions:", -[SRSiriViewController _presentationOptions](self, "_presentationOptions"));
  objc_opt_class(SABaseClientBoundCommand, v14);
  if ((objc_opt_isKindOfClass(v23, v15) & 1) == 0)
  {
    analyticsSupplement = self->_analyticsSupplement;
    v16 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "refId"));
    v18 = -[SRUIFAnalyticsSupplement computedModeForRefId:](analyticsSupplement, "computedModeForRefId:", v16);
LABEL_9:
    v21 = v18;
    goto LABEL_10;
  }
  v16 = v23;
  if ((_os_feature_enabled_impl("ResponseFramework", "Enabled") & 1) == 0)
  {
    if (+[SRModeDialogTransformer supportsTransformationForAceCommand:](SRModeDialogTransformer, "supportsTransformationForAceCommand:", v16))
    {
      goto LABEL_7;
    }
LABEL_8:
    v18 = -[SRUIFAnalyticsSupplement computedModeForAceCommand:](self->_analyticsSupplement, "computedModeForAceCommand:", v16);
    goto LABEL_9;
  }
  if (!+[MDDialogTransformer supportsTransformationForAceCommand:](MDDialogTransformer, "supportsTransformationForAceCommand:", v16))goto LABEL_8;
LABEL_7:
  v19 = self->_analyticsSupplement;
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "refId"));
  v21 = -[SRUIFAnalyticsSupplement computedModeForRefId:](v19, "computedModeForRefId:", v20);

  if (!(_DWORD)v21)
    goto LABEL_8;
LABEL_10:

  v22 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _instrumentationManager](self, "_instrumentationManager"));
  objc_msgSend(v22, "emitUUFRSpokenForAceObject:presentationType:dialogPhase:mode:speakableText:dialogIdentifierOverride:", v23, v13, v12, v21, v11, v10);

}

- (int)_instrumentationResponseModeForMode:(unint64_t)a3
{
  if (a3 > 3)
    return 0;
  else
    return dword_1000C0DF0[a3];
}

- (int)_mapSiriTransitionState:(int64_t)a3
{
  if ((unint64_t)a3 > 4)
    return 0;
  else
    return dword_1000C0D58[a3];
}

- (int)_instrumentationPresentationForPresentationOptions:(int64_t)a3
{
  void *v4;
  unsigned __int8 v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController traitCollection](self, "traitCollection"));
  v5 = objc_msgSend(v4, "isAmbientPresented");

  if ((v5 & 1) != 0)
    return 7;
  if ((unint64_t)a3 > 8)
    return 0;
  return dword_1000C0D6C[a3];
}

- (unint64_t)_MDModeToSRModeConverter:(unint64_t)a3
{
  if (a3 > 3)
    return 1;
  else
    return qword_1000C0D90[a3];
}

- (unint64_t)_SRModeToMDModeConverter:(unint64_t)a3
{
  if (a3 == 2)
    return 2;
  else
    return a3 != 0;
}

- (unint64_t)_responseModeToMDModeConverter:(id)a3
{
  void *v3;
  unint64_t v4;
  NSObject *v6;
  int v7;
  const char *v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "lowercaseString"));
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("displayonly")) & 1) != 0)
  {
    v4 = 2;
  }
  else
  {
    if ((objc_msgSend(v3, "isEqualToString:", CFSTR("displayforward")) & 1) == 0)
    {
      if ((objc_msgSend(v3, "isEqualToString:", CFSTR("voiceonly")) & 1) != 0)
      {
        v4 = 0;
        goto LABEL_9;
      }
      if ((objc_msgSend(v3, "isEqualToString:", CFSTR("voiceforward")) & 1) != 0)
      {
        v4 = 3;
        goto LABEL_9;
      }
      v6 = AFSiriLogContextConnection;
      if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
      {
        v7 = 136315138;
        v8 = "-[SRSiriViewController _responseModeToMDModeConverter:]";
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s #modes Incompatible ResponseMode sent via addViews. Defaulting to DisplayForward", (uint8_t *)&v7, 0xCu);
      }
    }
    v4 = 1;
  }
LABEL_9:

  return v4;
}

- (BOOL)_suppressTTSForErrorsAndInterstitials
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  NSObject *v7;
  int v9;
  const char *v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _requestOptions](self, "_requestOptions"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "requestInfo"));
  v5 = objc_msgSend(v4, "activationEvent");

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _requestOptions](self, "_requestOptions"));
  if (objc_msgSend(v6, "requestSource") == (id)26 || v5 == (id)6)
  {

  }
  else
  {

    if (v5 != (id)9)
      return -[SRModeProvider displayOnlyModeForInterstitialsAndErrors](self->_modeProvider, "displayOnlyModeForInterstitialsAndErrors");
  }
  v7 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 136315138;
    v10 = "-[SRSiriViewController _suppressTTSForErrorsAndInterstitials]";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s #errorHandling suppressing interstitial and error TTS for spoken messages", (uint8_t *)&v9, 0xCu);
  }
  return 1;
}

- (void)_setListenAfterSpeakingForRequestFinished:(BOOL)a3
{
  NSObject *v4;
  _BOOL4 listenAfterSpeakingForRequestFinished;
  int v6;
  const char *v7;
  __int16 v8;
  _BOOL4 v9;

  self->_listenAfterSpeakingForRequestFinished = a3;
  v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    listenAfterSpeakingForRequestFinished = self->_listenAfterSpeakingForRequestFinished;
    v6 = 136315394;
    v7 = "-[SRSiriViewController _setListenAfterSpeakingForRequestFinished:]";
    v8 = 1024;
    v9 = listenAfterSpeakingForRequestFinished;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s listenAfterSpeaking - %d", (uint8_t *)&v6, 0x12u);
  }
}

- (void)_sharePatternIdFromAddViewsCommand:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "patternId"));

  if (v4)
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "views", 0));
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v6)
    {
      v8 = v6;
      v9 = *(_QWORD *)v17;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v17 != v9)
            objc_enumerationMutation(v5);
          v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)v10);
          objc_opt_class(SAUIVisualResponseSnippet, v7);
          if ((objc_opt_isKindOfClass(v11, v12) & 1) != 0)
          {
            v13 = v11;
            v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "patternId"));
            v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "viewId"));

            +[VRXVisualResponseProvider setPatternId:forViewId:](VRXVisualResponseProvider, "setPatternId:forViewId:", v14, v15);
          }
          v10 = (char *)v10 + 1;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v8);
    }

  }
}

- (void)_logPatternExecutedEventForAddViewsCommand:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  NSString *responseViewId;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "patternId"));
  if (v4)
  {

LABEL_4:
    v5 = objc_alloc((Class)VRXPatternExecutedInstrumentationEvent);
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "patternId"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "patternType"));
    responseViewId = self->_responseViewId;
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "responseMode"));
    v10 = objc_msgSend(v5, "initWithPatternId:patternType:responseViewId:responseMode:", v6, v7, responseViewId, v9);

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _instrumentationManager](self, "_instrumentationManager"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "currentInstrumentationTurnContext"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "turnIdentifier"));

    objc_msgSend(v10, "emitWithTurnIdentifier:", v13);
    goto LABEL_5;
  }
  if (-[NSString length](self->_responseViewId, "length"))
    goto LABEL_4;
LABEL_5:

}

- (int64_t)_viewModeFromPresentationOptions:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 7)
    return 7;
  else
    return qword_1000C0DB0[a3 - 1];
}

- (void)_setConversations:(id)a3
{
  objc_storeStrong((id *)&self->_conversations, a3);
}

- (void)_setPresentedConversationItemRevisionIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_presentedConversationItemRevisionIdentifiers, a3);
}

- (void)_setDelayedConversationItemRevisionIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_delayedConversationItemRevisionIdentifiers, a3);
}

- (void)_setAceCommandRecords:(id)a3
{
  objc_storeStrong((id *)&self->_aceCommandRecords, a3);
}

- (SiriUIPresentation)presentation
{
  return self->_presentation;
}

- (AFUISiriSession)_session
{
  return self->_session;
}

- (SRPreferences)_preferences
{
  return self->_preferences;
}

- (CGRect)_statusBarFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_statusBarFrame.origin.x;
  y = self->_statusBarFrame.origin.y;
  width = self->_statusBarFrame.size.width;
  height = self->_statusBarFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (double)_statusViewHeight
{
  return self->_statusViewHeight;
}

- (double)_bottomContentInset
{
  return self->_bottomContentInset;
}

- (CGRect)_systemContentFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_systemContentFrame.origin.x;
  y = self->_systemContentFrame.origin.y;
  width = self->_systemContentFrame.size.width;
  height = self->_systemContentFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (AFConversationStore)_conversationStore
{
  return self->_conversationStore;
}

- (NSMutableArray)_conversations
{
  return self->_conversations;
}

- (AFUISiriLanguage)_language
{
  return self->_language;
}

- (void)_setVoicemailPlayer:(id)a3
{
  objc_storeStrong((id *)&self->_voicemailPlayer, a3);
}

- (void)_setAudioMessagePlayer:(id)a3
{
  objc_storeStrong((id *)&self->_audioMessagePlayer, a3);
}

- (SRUIFAceCommandRecords)_aceCommandRecords
{
  return self->_aceCommandRecords;
}

- (void)setCompletedCommandAppPunchOutIds:(id)a3
{
  objc_storeStrong((id *)&self->_completedCommandAppPunchOutIds, a3);
}

- (SASRequestOptions)_requestOptions
{
  return self->_requestOptions;
}

- (NSString)_currentAVRecordRoute
{
  return self->_currentAVRecordRoute;
}

- (void)_setCurrentAVRecordRoute:(id)a3
{
  objc_storeStrong((id *)&self->_currentAVRecordRoute, a3);
}

- (int64_t)_siriState
{
  return self->_siriState;
}

- (void)_setSiriState:(int64_t)a3
{
  self->_siriState = a3;
}

- (NSTimer)_idleTimer
{
  return self->__idleTimer;
}

- (void)_setIdleTimer:(id)a3
{
  objc_storeStrong((id *)&self->__idleTimer, a3);
}

- (BOOL)_isIdleTimerEnabled
{
  return self->__idleTimerEnabled;
}

- (void)_setIdleTimerEnabled:(BOOL)a3
{
  self->__idleTimerEnabled = a3;
}

- (BOOL)_isAcousticIdAllowed
{
  return self->_acousticIdAllowed;
}

- (void)_setAcousticIdAllowed:(BOOL)a3
{
  self->_acousticIdAllowed = a3;
}

- (unint64_t)_wasSiriIdleAndQuiet
{
  return self->_wasSiriIdleAndQuiet;
}

- (void)_setWasSiriIdleAndQuiet:(unint64_t)a3
{
  self->_wasSiriIdleAndQuiet = a3;
}

- (AFManagedStorageConnection)_domainObjectStorageConnection
{
  return self->_domainObjectStorageConnection;
}

- (BOOL)_isWaitingForStartRequest
{
  return self->_waitingForStartRequest;
}

- (void)_setWaitingForStartRequest:(BOOL)a3
{
  self->_waitingForStartRequest = a3;
}

- (BOOL)_isRequestActive
{
  return self->_requestActive;
}

- (void)_setRequestActive:(BOOL)a3
{
  self->_requestActive = a3;
}

- (BOOL)_isUserUtteranceTapToEditInProgress
{
  return self->_userUtteranceTapToEditInProgress;
}

- (void)_setUserUtteranceTapToEditInProgress:(BOOL)a3
{
  self->_userUtteranceTapToEditInProgress = a3;
}

- (NSMutableArray)_repeatablePhrases
{
  return self->_repeatablePhrases;
}

- (void)_setRepeatablePhrases:(id)a3
{
  objc_storeStrong((id *)&self->_repeatablePhrases, a3);
}

- (BOOL)_listenAfterSpeakingForRepeatable
{
  return self->_listenAfterSpeakingForRepeatable;
}

- (void)_setListenAfterSpeakingForRepeatable:(BOOL)a3
{
  self->_listenAfterSpeakingForRepeatable = a3;
}

- (BOOL)_isStartRequestAceCommandSent
{
  return self->_startRequestAceCommandSent;
}

- (void)_setStartRequestAceCommandSent:(BOOL)a3
{
  self->_startRequestAceCommandSent = a3;
}

- (BOOL)_isAudioPlayerPlaying
{
  return self->_audioPlayerIsPlaying;
}

- (void)_setAudioPlayerIsPlaying:(BOOL)a3
{
  self->_audioPlayerIsPlaying = a3;
}

- (BOOL)_isKeyboardLoweredAfterResponse
{
  return self->_keyboardLoweredAfterResponse;
}

- (void)_setKeyboardLoweredAfterResponse:(BOOL)a3
{
  self->_keyboardLoweredAfterResponse = a3;
}

- (NSString)_utteranceToSpeakAfterClearScreenCommand
{
  return self->_utteranceToSpeakAfterClearScreenCommand;
}

- (void)_setUtteranceToSpeakAfterClearScreenCommand:(id)a3
{
  objc_storeStrong((id *)&self->_utteranceToSpeakAfterClearScreenCommand, a3);
}

- (UIView)inputAccessoryView
{
  return self->_inputAccessoryView;
}

- (void)setInputAccessoryView:(id)a3
{
  objc_storeStrong((id *)&self->_inputAccessoryView, a3);
}

- (SAUISayIt)previousSayItCommand
{
  return self->_previousSayItCommand;
}

- (void)setPreviousSayItCommand:(id)a3
{
  objc_storeStrong((id *)&self->_previousSayItCommand, a3);
}

- (BOOL)_listenAfterSpeakingForRequestFinished
{
  return self->_listenAfterSpeakingForRequestFinished;
}

- (BOOL)_isReadingBulletinContentInCarPlayOutsideOfSiriSession
{
  return self->_readingBulletinContentInCarPlayOutsideOfSiriSession;
}

- (void)_setReadingBulletinContentInCarPlayOutsideOfSiriSession:(BOOL)a3
{
  self->_readingBulletinContentInCarPlayOutsideOfSiriSession = a3;
}

- (BOOL)_reflectionDialogHasBeenPlayed
{
  return self->_reflectionDialogHasBeenPlayed;
}

- (void)_reflectionDialogHasBeenPlayed:(BOOL)a3
{
  self->_reflectionDialogHasBeenPlayed = a3;
}

- (BOOL)_shouldShowDownloadAssetsNotificationPrompt
{
  return self->_shouldShowDownloadAssetsNotificationPrompt;
}

- (void)_shouldShowDownloadAssetsNotificationPrompt:(BOOL)a3
{
  self->_shouldShowDownloadAssetsNotificationPrompt = a3;
}

- (_TtC4Siri36SRAssetsDownloadBannerViewController)_bannerViewController
{
  return self->_bannerViewController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bannerViewController, 0);
  objc_storeStrong((id *)&self->_previousSayItCommand, 0);
  objc_storeStrong((id *)&self->_inputAccessoryView, 0);
  objc_storeStrong((id *)&self->_utteranceToSpeakAfterClearScreenCommand, 0);
  objc_storeStrong((id *)&self->_repeatablePhrases, 0);
  objc_storeStrong((id *)&self->_domainObjectStorageConnection, 0);
  objc_storeStrong((id *)&self->__idleTimer, 0);
  objc_storeStrong((id *)&self->_currentAVRecordRoute, 0);
  objc_storeStrong((id *)&self->_requestOptions, 0);
  objc_storeStrong((id *)&self->_completedCommandAppPunchOutIds, 0);
  objc_storeStrong((id *)&self->_aceCommandRecords, 0);
  objc_storeStrong((id *)&self->_audioMessagePlayer, 0);
  objc_storeStrong((id *)&self->_voicemailPlayer, 0);
  objc_storeStrong((id *)&self->_language, 0);
  objc_storeStrong((id *)&self->_conversations, 0);
  objc_storeStrong((id *)&self->_conversationStore, 0);
  objc_storeStrong((id *)&self->_preferences, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_presentation, 0);
  objc_storeStrong((id *)&self->_manager, 0);
  objc_storeStrong((id *)&self->_instrumentationStateTransitionsPendingInitialTurn, 0);
  objc_storeStrong((id *)&self->_enqueuedSuggestion, 0);
  objc_storeStrong((id *)&self->_systemUIController, 0);
  objc_storeStrong((id *)&self->_phPicker, 0);
  objc_storeStrong((id *)&self->_addViewsRefId, 0);
  objc_storeStrong((id *)&self->_ttsManager, 0);
  objc_storeStrong((id *)&self->_analyticsSupplement, 0);
  objc_storeStrong((id *)&self->_testingContext, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_siriSessionInfo, 0);
  objc_storeStrong((id *)&self->_startRecordingSoundId, 0);
  objc_storeStrong((id *)&self->_requestText, 0);
  objc_storeStrong((id *)&self->_modeProvider, 0);
  objc_storeStrong((id *)&self->_currentNotificationSound, 0);
  objc_storeStrong((id *)&self->_repeatableAudioSayit, 0);
  objc_storeStrong((id *)&self->_pendingPreSynthesisTasks, 0);
  objc_storeStrong((id *)&self->_delayedConversationItemRevisionIdentifiers, 0);
  objc_storeStrong((id *)&self->_presentedConversationItemRevisionIdentifiers, 0);
  objc_storeStrong((id *)&self->_synthesisPreparationDictionary, 0);
  objc_storeStrong((id *)&self->_responseViewId, 0);
  objc_storeStrong((id *)&self->_ttsDelayedBlocks, 0);
}

- (void)runPPTWithOptions:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  v4 = SUICPPTTestNameKey;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", SUICPPTTestNameKey));

  v6 = v8;
  if (v5)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", v4));
    if (objc_msgSend(v7, "isEqualToString:", SUICPPTTestNameSiriScrollTeamRoster))
      -[SRSiriViewController _runScrollRosterTestWithOptions:](self, "_runScrollRosterTestWithOptions:", v8);

    v6 = v8;
  }

}

- (void)_runScrollRosterTestWithOptions:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  dispatch_time_t v11;
  id v12;
  _QWORD block[4];
  id v14;
  id v15;
  id location;
  id v17;
  _QWORD v18[4];
  _QWORD v19[4];

  v4 = a3;
  v5 = objc_alloc_init((Class)SAUIAddViews);
  v6 = objc_msgSend(objc_alloc((Class)NSData), "initWithBase64EncodedString:options:", &cfstr_Gv8ccagsxwjcxa, 0);
  v7 = objc_alloc((Class)SAUISnippet);
  v18[0] = CFSTR("cardData");
  v18[1] = CFSTR("$class");
  v19[0] = v6;
  v19[1] = CFSTR("Snippet");
  v18[2] = CFSTR("$group");
  v18[3] = CFSTR("aceId");
  v19[2] = CFSTR("com.apple.ace.ui.card");
  v19[3] = CFSTR("fakeId");
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v19, v18, 4));
  v9 = objc_msgSend(v7, "initWithDictionary:", v8);

  objc_msgSend(v9, "setItemType:", SAAceViewUIItemTypeItemTypeResultValue);
  v17 = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v17, 1));
  objc_msgSend(v5, "setViews:", v10);

  -[SRSiriViewController _testDidReceiveAceCommand:completion:](self, "_testDidReceiveAceCommand:completion:", v5, 0);
  objc_initWeak(&location, self);
  v11 = dispatch_time(0, 1000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100058750;
  block[3] = &unk_100122660;
  objc_copyWeak(&v15, &location);
  v14 = v4;
  v12 = v4;
  dispatch_after(v11, (dispatch_queue_t)&_dispatch_main_q, block);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

}

- (void)_startScrollingWithOptions:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  id v12;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentationViewController](self, "_presentationViewController"));
  v12 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "view"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "snippetView"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "contentPlatterScrollView"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", SUICPPTIterationsKey));
  v9 = objc_msgSend(v8, "intValue");

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("offset")));
  v11 = objc_msgSend(v10, "intValue");

  objc_msgSend(v7, "_performScrollTest:iterations:delta:", SUICPPTTestNameSiriScrollTeamRoster, v9, v11);
}

- (void)_testDidReceiveAceCommand:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v6 = a3;
  -[SRSiriViewController _didReceiveAceCommand:completion:](self, "_didReceiveAceCommand:completion:", v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _activeConversation](self, "_activeConversation"));
  objc_msgSend(v7, "addItemsForAddViewsCommand:", v6);

  v8 = (id)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _session](self, "_session"));
  objc_msgSend(v8, "stopRecordingSpeech");

}

@end
