@implementation SRSystemAssistantExperiencePresentation

- (SRSystemAssistantExperiencePresentation)initWithDelegate:(id)a3 dataSource:(id)a4
{
  id v6;
  id v7;
  SRSystemAssistantExperiencePresentation *v8;
  SRSystemAssistantExperiencePresentation *v9;
  SRSystemAssistantExperienceViewController *v10;
  SRSystemAssistantExperienceViewController *saeViewController;
  void *v12;
  id v13;
  SRCompactAutoDismissController *v14;
  SRCompactAutoDismissController *autoDismissController;
  void *v16;
  void *v17;
  dispatch_queue_attr_t v18;
  NSObject *v19;
  dispatch_queue_t v20;
  OS_dispatch_queue *viewModelControllerQueue;
  objc_super v23;

  v6 = a3;
  v7 = a4;
  v23.receiver = self;
  v23.super_class = (Class)SRSystemAssistantExperiencePresentation;
  v8 = -[SRSystemAssistantExperiencePresentation init](&v23, "init");
  v9 = v8;
  if (v8)
  {
    -[SRSystemAssistantExperiencePresentation setDelegate:](v8, "setDelegate:", v6);
    -[SRSystemAssistantExperiencePresentation setDataSource:](v9, "setDataSource:", v7);
    v9->_inputType = 0;
    v10 = objc_alloc_init(SRSystemAssistantExperienceViewController);
    saeViewController = v9->_saeViewController;
    v9->_saeViewController = v10;

    -[SRSystemAssistantExperienceViewController setDelegate:](v9->_saeViewController, "setDelegate:", v9);
    -[SRSystemAssistantExperienceViewController setAlwaysShowSpeech:](v9->_saeViewController, "setAlwaysShowSpeech:", -[SRSystemAssistantExperiencePresentation alwaysShowRecognizedSpeech](v9, "alwaysShowRecognizedSpeech"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperiencePresentation delegate](v9, "delegate"));
    v13 = objc_msgSend(v12, "siriDeviceLockStateForSiriPresentation:", v9);

    v14 = -[SRCompactAutoDismissController initWithDelegate:andLockState:]([SRCompactAutoDismissController alloc], "initWithDelegate:andLockState:", v9, v13);
    autoDismissController = v9->_autoDismissController;
    v9->_autoDismissController = v14;

    v16 = (void *)objc_claimAutoreleasedReturnValue(+[AFPreferences sharedPreferences](AFPreferences, "sharedPreferences"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "languageCode"));
    +[SiriUISashItem _setLanguageCode:](SiriUISashItem, "_setLanguageCode:", v17);

    v18 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    v19 = objc_claimAutoreleasedReturnValue(v18);
    v20 = dispatch_queue_create("com.apple.siri.SRSystemAssistantExperiencePresentation.viewModelControllerQueue", v19);
    viewModelControllerQueue = v9->_viewModelControllerQueue;
    v9->_viewModelControllerQueue = (OS_dispatch_queue *)v20;

    -[SRSystemAssistantExperiencePresentation _activeConversationDidChange](v9, "_activeConversationDidChange");
  }

  return v9;
}

- (id)_conversationIdentifiers
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperiencePresentation dataSource](self, "dataSource"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "conversationIdentifiersForSiriPresentation:", self));

  return v4;
}

- (id)_identifierOfPreviousConversation
{
  void *v2;
  void *v3;
  NSObject *v4;
  int v6;
  const char *v7;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperiencePresentation _conversationIdentifiers](self, "_conversationIdentifiers"));
  if ((unint64_t)objc_msgSend(v2, "count") < 2)
  {
    v4 = AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 136315138;
      v7 = "-[SRSystemAssistantExperiencePresentation _identifierOfPreviousConversation]";
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s #compact no previous conversation found", (uint8_t *)&v6, 0xCu);
    }
    v3 = 0;
  }
  else
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectAtIndexedSubscript:", (char *)objc_msgSend(v2, "count") - 2));
  }

  return v3;
}

- (id)_activeConversation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperiencePresentation dataSource](self, "dataSource"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperiencePresentation _conversationIdentifiers](self, "_conversationIdentifiers"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "lastObject"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "siriPresentation:conversationWithIdentifier:", self, v5));

  return v6;
}

- (void)configureForRequestOptions:(id)a3
{
  NSObject *v4;
  id WeakRetained;
  int v6;
  const char *v7;

  if (+[AFUISiriSession availabilityState](AFUISiriSession, "availabilityState", a3))
  {
    v4 = AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 136315138;
      v7 = "-[SRSystemAssistantExperiencePresentation configureForRequestOptions:]";
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s #networkAvailability Siri Not available. Dismissing Siri and posting notification", (uint8_t *)&v6, 0xCu);
    }
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "dismissSiriPresentation:withReason:", self, 13);

  }
}

- (id)viewController
{
  return self->_saeViewController;
}

- (void)conversation:(id)a3 didChangeWithTransaction:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperiencePresentation activeViewModelController](self, "activeViewModelController"));
  objc_msgSend(v6, "conversationDidChangeWithTransaction:", v5);

}

- (void)didReceiveRevealRecognizedSpeechCommand:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  const char *v14;
  __int16 v15;
  id v16;

  v4 = a3;
  v5 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 136315394;
    v14 = "-[SRSystemAssistantExperiencePresentation didReceiveRevealRecognizedSpeechCommand:]";
    v15 = 2112;
    v16 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s #compact: received revealRecognizedSpeech:%@", (uint8_t *)&v13, 0x16u);
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "recognition"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperiencePresentation dataSource](self, "dataSource"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "sessionInfoForSiriPresentation:", self));

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "refId"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "identifier"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "af_userUtteranceValueWithRefId:sessionId:", v9, v10));

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperiencePresentation activeViewModelController](self, "activeViewModelController"));
  objc_msgSend(v12, "revealUserUtterance:backingAceObject:", v11, v4);

}

- (void)dealloc
{
  objc_super v3;

  -[SRCompactAutoDismissController invalidate](self->_autoDismissController, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)SRSystemAssistantExperiencePresentation;
  -[SRSystemAssistantExperiencePresentation dealloc](&v3, "dealloc");
}

- (void)activeRequestOptionsDidChange
{
  uint64_t v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperiencePresentation _activeRequestOptions](self, "_activeRequestOptions"));
  if (objc_msgSend(v4, "isTypeToSiriRequest") && objc_msgSend(v4, "inputType") != (id)2)
    v3 = 1;
  else
    v3 = 2;
  -[SRSystemAssistantExperienceViewController setActiveRequestOptions:](self->_saeViewController, "setActiveRequestOptions:", v4);
  -[SRSystemAssistantExperiencePresentation _setInputType:](self, "_setInputType:", v3);

}

- (void)siriRequestWillStartWithRequestOptions:(id)a3
{
  id v4;
  NSObject *v5;
  NSString *responseMode;
  NSNumber *delayDismissalMs;
  _QWORD block[5];
  uint8_t buf[4];
  const char *v10;

  v4 = a3;
  v5 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v10 = "-[SRSystemAssistantExperiencePresentation siriRequestWillStartWithRequestOptions:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  *(_WORD *)&self->_isPresentingSystemUI = 0;
  responseMode = self->_responseMode;
  self->_responseMode = 0;

  delayDismissalMs = self->_delayDismissalMs;
  self->_delayDismissalMs = 0;

  self->_shouldMuteSiriFeedbackBanner = 0;
  self->_shouldPauseAutoDismissal = 0;
  if (objc_msgSend(v4, "requestSource") != (id)9)
    self->_requestIsWiredMicOrBTHeadsetOrWx = objc_msgSend(v4, "isWiredMicOrBTHeadsetOrWx");
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002936C;
  block[3] = &unk_1001225C0;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  -[SRSystemAssistantExperienceViewController siriWillStartRequest](self->_saeViewController, "siriWillStartRequest");

}

- (void)siriResponseModeDidChange:(unint64_t)a3
{
  NSObject *v5;
  _BOOL4 requestIsWiredMicOrBTHeadsetOrWx;
  uint64_t Name;
  NSString *v8;
  NSString *responseMode;
  int v10;
  const char *v11;
  __int16 v12;
  unint64_t v13;
  __int16 v14;
  _BOOL4 v15;

  v5 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    requestIsWiredMicOrBTHeadsetOrWx = self->_requestIsWiredMicOrBTHeadsetOrWx;
    v10 = 136315650;
    v11 = "-[SRSystemAssistantExperiencePresentation siriResponseModeDidChange:]";
    v12 = 2048;
    v13 = a3;
    v14 = 1024;
    v15 = requestIsWiredMicOrBTHeadsetOrWx;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s #compact mode updated to %lu, _requestIsWiredMicOrBTHeadsetOrWx: %d", (uint8_t *)&v10, 0x1Cu);
  }
  -[SRCompactAutoDismissController siriResponseModeDidChange:isWiredMicOrBTHeadsetOrWx:](self->_autoDismissController, "siriResponseModeDidChange:isWiredMicOrBTHeadsetOrWx:", a3, self->_requestIsWiredMicOrBTHeadsetOrWx);
  Name = MDModeGetName(a3);
  v8 = (NSString *)objc_claimAutoreleasedReturnValue(Name);
  responseMode = self->_responseMode;
  self->_responseMode = v8;

}

- (void)siriDidActivateFromSource:(int64_t)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  const char *v10;

  if (a3 == 20)
  {
    v5 = AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 136315138;
      v10 = "-[SRSystemAssistantExperiencePresentation siriDidActivateFromSource:]";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s #compact Loading previous conversation because we activated from a breadcrumb", (uint8_t *)&v9, 0xCu);
    }
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperiencePresentation dataSource](self, "dataSource"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperiencePresentation _identifierOfPreviousConversation](self, "_identifierOfPreviousConversation"));
    objc_msgSend(v6, "siriPresentation:activateConversationWithIdentifier:", self, v7);

    -[SRSystemAssistantExperiencePresentation _activeConversationDidChange](self, "_activeConversationDidChange");
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperiencePresentation delegate](self, "delegate"));
    objc_msgSend(v8, "siriPresentationDidPresentConversationFromBreadcrumb:", self);

  }
  -[SRSystemAssistantExperienceViewController siriDidActivate](self->_saeViewController, "siriDidActivate");
  -[SRSystemAssistantExperienceViewController setUpConversationStarterSuggestionsWith:](self->_saeViewController, "setUpConversationStarterSuggestionsWith:", a3);
  *(_WORD *)&self->_userCancelledRequestViaOrbViewTap = 0;
  self->_isPresentingSystemUI = 0;
  self->_initialRequestSource = a3;
}

- (void)siriDidStartNewConversationWithIdentifier:(id)a3
{
  void *v5;
  NSObject *v6;
  void *v7;
  int v8;
  const char *v9;
  __int16 v10;
  void *v11;

  v5 = (void *)AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "UUIDString"));
    v8 = 136315394;
    v9 = "-[SRSystemAssistantExperiencePresentation siriDidStartNewConversationWithIdentifier:]";
    v10 = 2112;
    v11 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s #compact Starting a new conversation %@", (uint8_t *)&v8, 0x16u);

  }
  -[SRSystemAssistantExperiencePresentation _activeConversationDidChange](self, "_activeConversationDidChange");
}

- (void)speechRecordingDidBeginOnRecordRoute:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  id v9;

  v4 = a3;
  v5 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315394;
    v7 = "-[SRSystemAssistantExperiencePresentation speechRecordingDidBeginOnRecordRoute:]";
    v8 = 2112;
    v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s #compact recording started on recordRoute: %@", (uint8_t *)&v6, 0x16u);
  }
  self->_recordingFromWxDevice = AFRecordRouteIsHearst(v4);

}

- (BOOL)shouldResumeInterruptedAudioPlaybackForAttendingState:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  NSString *responseMode;
  _BOOL4 requestIsWiredMicOrBTHeadsetOrWx;
  NSString *v8;
  uint64_t Name;
  void *v10;
  _BOOL4 v11;
  int v13;
  const char *v14;
  __int16 v15;
  _BOOL4 v16;
  __int16 v17;
  NSString *v18;
  __int16 v19;
  _BOOL4 v20;

  v3 = a3;
  v5 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    responseMode = self->_responseMode;
    requestIsWiredMicOrBTHeadsetOrWx = self->_requestIsWiredMicOrBTHeadsetOrWx;
    v13 = 136315906;
    v14 = "-[SRSystemAssistantExperiencePresentation shouldResumeInterruptedAudioPlaybackForAttendingState:]";
    v15 = 1024;
    v16 = v3;
    v17 = 2112;
    v18 = responseMode;
    v19 = 1024;
    v20 = requestIsWiredMicOrBTHeadsetOrWx;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s #compact isAttending: %d, responseMode: %@, requestIsWiredMicOrBTHeadsetOrWx: %d", (uint8_t *)&v13, 0x22u);
  }
  if (v3)
  {
    v8 = self->_responseMode;
    Name = MDModeGetName(0);
    v10 = (void *)objc_claimAutoreleasedReturnValue(Name);
    if (-[NSString isEqualToString:](v8, "isEqualToString:", v10))
    {

      return self->_shouldResumeMediaOnIdle;
    }
    v11 = self->_requestIsWiredMicOrBTHeadsetOrWx;

    if (v11)
      return self->_shouldResumeMediaOnIdle;
  }
  return 1;
}

- (BOOL)shouldResumeInterruptedAudioPlayback
{
  return 1;
}

- (BOOL)shouldPunchOutInPlace
{
  return _os_feature_enabled_impl("SiriUI", "persistent_siri");
}

- (BOOL)shouldAllowTouchPassThrough
{
  return 1;
}

- (void)handlePlayContentCommand:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, id);
  SRPlayContentViewController *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  SRSystemAssistantExperienceViewController *saeViewController;
  id v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id location;

  v6 = a3;
  v7 = (void (**)(id, id))a4;
  v8 = -[SRPlayContentViewController initWithPlayContent:]([SRPlayContentViewController alloc], "initWithPlayContent:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[SRPlayContentViewController player](v8, "player"));

  if (v9)
  {
    -[SRPlayContentViewController setVideoPlayerControllerDelegate:](v8, "setVideoPlayerControllerDelegate:", self);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperiencePresentation delegate](self, "delegate"));
    objc_msgSend(v10, "siriPresentation:setStatusBarHidden:animated:", self, 1, 1);

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperiencePresentation delegate](self, "delegate"));
    objc_msgSend(v11, "siriPresentation:setStatusViewHidden:", self, 1);

    v12 = objc_msgSend(objc_alloc((Class)SiriUIModalContainerViewController), "initWithContentViewController:", v8);
    objc_msgSend(v12, "setDelegate:", self);
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperiencePresentation delegate](self, "delegate"));
    objc_msgSend(v13, "siriPresentation:willPresentViewController:", self, v12);

    objc_initWeak(&location, self);
    saeViewController = self->_saeViewController;
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_100029B18;
    v20[3] = &unk_100122660;
    objc_copyWeak(&v22, &location);
    v15 = v12;
    v21 = v15;
    -[SRSystemAssistantExperienceViewController presentViewController:animated:completion:](saeViewController, "presentViewController:animated:completion:", v15, 1, v20);
    if (v7)
    {
      v16 = objc_alloc_init((Class)SACommandSucceeded);
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "aceId"));
      objc_msgSend(v16, "setRefId:", v17);

      v7[2](v7, v16);
    }

    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);

  }
  else if (v7)
  {
    v18 = objc_msgSend(objc_alloc((Class)SACommandFailed), "initWithReason:", CFSTR("No AVPlayer for PlayContent command"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "aceId"));
    objc_msgSend(v18, "setRefId:", v19);

    v7[2](v7, v18);
  }

}

- (BOOL)supportsVisualPresentationForConversationItem:(id)a3
{
  if ((char *)objc_msgSend(a3, "type") - 1 > (char *)1)
    return 1;
  else
    return -[SRSystemAssistantExperiencePresentation alwaysShowRecognizedSpeech](self, "alwaysShowRecognizedSpeech");
}

- (int)viewRegionForPresentedAceObject:(id)a3
{
  return -[SRSystemAssistantExperienceViewController viewRegionForPresentedAceObject:](self->_saeViewController, "viewRegionForPresentedAceObject:", a3);
}

- (void)siriDidDeactivateWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  SRDismissalClassificationController *v8;
  void *v9;
  _BOOL8 v10;
  int64_t inputType;
  int64_t initialRequestSource;
  id v13;
  id v14;
  SRDismissalClassificationController *v15;
  _QWORD v16[4];
  SRDismissalClassificationController *v17;
  id v18;
  id v19;
  int64_t v20;
  BOOL v21;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperienceViewController presentedViewController](self->_saeViewController, "presentedViewController"));

  if (v5)
    -[SRSystemAssistantExperienceViewController dismissViewControllerAnimated:completion:](self->_saeViewController, "dismissViewControllerAnimated:completion:", 1, 0);
  v6 = -[SRSystemAssistantExperienceViewController siriDidDeactivate](self->_saeViewController, "siriDidDeactivate");
  if (AFIsInternalInstall(v6, v7) && !self->_shouldMuteSiriFeedbackBanner)
    +[SRSiriDebugManager invokeSiriDebugFeedbackBannerFor:completionHandler:](SRSiriDebugManager, "invokeSiriDebugFeedbackBannerFor:completionHandler:", self->_initialRequestSource, 0);
  v8 = objc_alloc_init(SRDismissalClassificationController);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperiencePresentation _dismissalContextWithDismissalReason:dismissalOptions:](self, "_dismissalContextWithDismissalReason:dismissalOptions:", self->_lastDismissalReason, self->_lastDismissalOptions));
  v10 = -[SRDismissalClassificationController classifyRequestAsUnintendedWithContext:](v8, "classifyRequestAsUnintendedWithContext:", v9);
  objc_msgSend(v9, "setClassifiedAsUnintended:", v10);
  -[SRDismissalClassificationController recordDismissalEventWithContext:markAsUnintended:](v8, "recordDismissalEventWithContext:markAsUnintended:", v9, v10);
  inputType = self->_inputType;
  initialRequestSource = self->_initialRequestSource;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100029D40;
  v16[3] = &unk_100122E48;
  v17 = v8;
  v18 = v9;
  v21 = v10;
  v19 = v4;
  v20 = inputType;
  v13 = v4;
  v14 = v9;
  v15 = v8;
  -[SRDismissalClassificationController requestMitigationStatusBasedOnRequestClassification:withRequestSource:withCompletion:](v15, "requestMitigationStatusBasedOnRequestClassification:withRequestSource:withCompletion:", v10, initialRequestSource, v16);

}

- (void)siriDidStartSpeakingWithIdentifier:(id)a3
{
  -[SRSystemAssistantExperienceViewController siriDidStartSpeakingWithIdentifier:](self->_saeViewController, "siriDidStartSpeakingWithIdentifier:", a3);
}

- (void)siriDidStopSpeakingWithIdentifier:(id)a3 speechQueueIsEmpty:(BOOL)a4
{
  -[SRSystemAssistantExperienceViewController siriDidStopSpeakingWithIdentifier:speechQueueIsEmpty:](self->_saeViewController, "siriDidStopSpeakingWithIdentifier:speechQueueIsEmpty:", a3, a4);
}

- (void)siriDidUpdateASRWithRecognition:(id)a3
{
  -[SRSystemAssistantExperienceViewController siriDidUpdateASRWithRecognition:](self->_saeViewController, "siriDidUpdateASRWithRecognition:", a3);
}

- (void)siriDidTapOutsideContent
{
  -[SRSystemAssistantExperienceViewController siriDidTapOutsideContent](self->_saeViewController, "siriDidTapOutsideContent");
}

- (void)showFullScreenEffect:(id)a3
{
  -[SRSystemAssistantExperienceViewController showFullScreenEffect:](self->_saeViewController, "showFullScreenEffect:", a3);
}

- (void)didOmitDialogFromPresenting
{
  -[SRSystemAssistantExperiencePresentation _handleNonSnippetResponse:](self, "_handleNonSnippetResponse:", 0);
}

- (void)resetViewsAndClearASR:(BOOL)a3
{
  -[SiriSharedUICompactViewModelController resetViewsAndClearASR:](self->_activeViewModelController, "resetViewsAndClearASR:", a3);
}

- (void)didPresentSystemUI
{
  -[SRSystemAssistantExperiencePresentation _handleNonSnippetResponse:](self, "_handleNonSnippetResponse:", 1);
}

- (void)didRecognizeUserInputForConversationStarterSuggestions:(id)a3
{
  NSObject *v4;
  int v5;
  const char *v6;

  if (-[SRSystemAssistantExperiencePresentation _shouldInterruptSuggestionsForSpeechRecognized:](self, "_shouldInterruptSuggestionsForSpeechRecognized:", a3))
  {
    v4 = AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
    {
      v5 = 136315138;
      v6 = "-[SRSystemAssistantExperiencePresentation didRecognizeUserInputForConversationStarterSuggestions:]";
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s #suggestions User input recognized, will try to stop suggestions from showing", (uint8_t *)&v5, 0xCu);
    }
    -[SRSystemAssistantExperienceViewController didRecognizeUserInputForConversationStarterSuggestions](self->_saeViewController, "didRecognizeUserInputForConversationStarterSuggestions");
  }
}

- (BOOL)_shouldInterruptSuggestionsForSpeechRecognized:(id)a3
{
  uint64_t v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  void *i;
  void *v18;
  id v19;
  char v20;
  char v21;
  NSObject *v22;
  const char *v24;
  void *v26;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t buf[4];
  const char *v33;
  __int16 v34;
  SRSystemAssistantExperiencePresentation *v35;
  __int16 v36;
  void *v37;
  _BYTE v38[128];

  v5 = a3;
  if (self->_initialRequestSource != 8
    || (objc_opt_class(SASSpeechPartialResult, v4), (objc_opt_isKindOfClass(v5, v6) & 1) == 0))
  {
    v21 = 1;
    goto LABEL_29;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "af_bestTextInterpretation"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet whitespaceCharacterSet](NSCharacterSet, "whitespaceCharacterSet"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stringByTrimmingCharactersInSet:", v8));

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet whitespaceCharacterSet](NSCharacterSet, "whitespaceCharacterSet"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "componentsSeparatedByCharactersInSet:", v10));

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperiencePresentation _siriLocalizedTriggerPhrases](self, "_siriLocalizedTriggerPhrases"));
  if (!objc_msgSend(v11, "count") || !objc_msgSend(v12, "count"))
  {
    v20 = 0;
    goto LABEL_28;
  }
  v27 = v7;
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v13 = v12;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v28, v38, 16);
  if (!v14)
  {
    v20 = 0;
    goto LABEL_27;
  }
  v15 = v14;
  v26 = v11;
  v16 = *(_QWORD *)v29;
  while (2)
  {
    for (i = 0; i != v15; i = (char *)i + 1)
    {
      if (*(_QWORD *)v29 != v16)
        objc_enumerationMutation(v13);
      v18 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)i);
      v19 = objc_msgSend(v9, "length", v26);
      if (v19 >= objc_msgSend(v18, "length"))
      {
        if (objc_msgSend(v9, "isEqualToString:", v18))
        {
          v22 = AFSiriLogContextConnection;
          if (!os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
          {
LABEL_25:
            v20 = 1;
            goto LABEL_26;
          }
          *(_DWORD *)buf = 136315650;
          v33 = "-[SRSystemAssistantExperiencePresentation _shouldInterruptSuggestionsForSpeechRecognized:]";
          v34 = 2112;
          v35 = self;
          v36 = 2112;
          v37 = v9;
          v24 = "%s %@ #suggestions received Partial Speech but it is a voice trigger phrase: %@";
LABEL_24:
          _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, v24, buf, 0x20u);
          goto LABEL_25;
        }
      }
      else if (objc_msgSend(v18, "hasPrefix:", v9))
      {
        v22 = AFSiriLogContextConnection;
        if (!os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
          goto LABEL_25;
        *(_DWORD *)buf = 136315650;
        v33 = "-[SRSystemAssistantExperiencePresentation _shouldInterruptSuggestionsForSpeechRecognized:]";
        v34 = 2112;
        v35 = self;
        v36 = 2112;
        v37 = v9;
        v24 = "%s %@ #suggestions received Partial Speech but it is a prefix for voice trigger phrase: %@";
        goto LABEL_24;
      }
    }
    v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v28, v38, 16);
    if (v15)
      continue;
    break;
  }
  v20 = 0;
LABEL_26:
  v11 = v26;
LABEL_27:

  v7 = v27;
LABEL_28:
  v21 = v20 ^ 1;

LABEL_29:
  return v21;
}

- (void)updateSpeechRecognitionHypothesisForSuggestion:(id)a3
{
  -[SRSystemAssistantExperienceViewController updateSpeechRecognitionHypothesisForSuggestion:](self->_saeViewController, "updateSpeechRecognitionHypothesisForSuggestion:", a3);
}

- (id)_siriLocalizedTriggerPhrases
{
  void *v2;
  void *v3;
  void *v4;
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
  _QWORD v16[2];

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[VTPreferences sharedPreferences](VTPreferences, "sharedPreferences"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[AFPreferences sharedPreferences](AFPreferences, "sharedPreferences"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "languageCode"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedTriggerPhraseForLanguageCode:", v4));

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet whitespaceCharacterSet](NSCharacterSet, "whitespaceCharacterSet"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stringByTrimmingCharactersInSet:", v6));

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[VTPreferences sharedPreferences](VTPreferences, "sharedPreferences"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[AFPreferences sharedPreferences](AFPreferences, "sharedPreferences"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "languageCode"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedCompactTriggerPhraseForLanguageCode:", v10));

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet whitespaceCharacterSet](NSCharacterSet, "whitespaceCharacterSet"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "stringByTrimmingCharactersInSet:", v12));

  v16[0] = v13;
  v16[1] = v7;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v16, 2));

  return v14;
}

- (void)didRecognizeTwoShotSignalForConversationStarterSuggestions
{
  NSObject *v3;
  int v4;
  const char *v5;

  v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315138;
    v5 = "-[SRSystemAssistantExperiencePresentation didRecognizeTwoShotSignalForConversationStarterSuggestions]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s #suggestions two-shot recognized, will try to show starter suggestions", (uint8_t *)&v4, 0xCu);
  }
  -[SRSystemAssistantExperienceViewController didRecognizeTwoShotSignalForConversationStarterSuggestions](self->_saeViewController, "didRecognizeTwoShotSignalForConversationStarterSuggestions");
}

- (void)didReceiveAddViewsSignalForSuggestions:(id)a3 currentMode:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  int v9;
  const char *v10;

  v6 = a3;
  v7 = a4;
  v8 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 136315138;
    v10 = "-[SRSystemAssistantExperiencePresentation didReceiveAddViewsSignalForSuggestions:currentMode:]";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s #suggestions addviews received, triggering conversation continuer suggestions", (uint8_t *)&v9, 0xCu);
  }
  -[SRSystemAssistantExperienceViewController didReceiveAddViewsSignalForSuggestions:currentMode:](self->_saeViewController, "didReceiveAddViewsSignalForSuggestions:currentMode:", v6, v7);

}

- (BOOL)didReceiveUpdateVisualResponseCommand:(id)a3
{
  return -[SRSystemAssistantExperienceViewController didReceiveUpdateVisualResponseCommand:](self->_saeViewController, "didReceiveUpdateVisualResponseCommand:", a3);
}

- (void)siriDidTransitionFromState:(int64_t)a3 event:(int64_t)a4
{
  NSObject *v5;
  BOOL v6;
  NSObject *v7;
  _BOOL4 hasPendingAutoDismissal;
  _BOOL4 recordingFromWxDevice;
  void *v10;
  void *v11;
  SRSystemAssistantExperiencePresentation *v12;
  uint64_t v13;
  NSObject *v14;
  _BOOL4 v15;
  int v16;
  const char *v17;
  __int16 v18;
  _BOOL4 v19;
  __int16 v20;
  _BOOL4 v21;

  if (a4 == 13)
  {
    v7 = AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
    {
      hasPendingAutoDismissal = self->_hasPendingAutoDismissal;
      recordingFromWxDevice = self->_recordingFromWxDevice;
      v16 = 136315650;
      v17 = "-[SRSystemAssistantExperiencePresentation siriDidTransitionFromState:event:]";
      v18 = 1024;
      v19 = hasPendingAutoDismissal;
      v20 = 1024;
      v21 = recordingFromWxDevice;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s #compact Speech was mitigated as side speech, _hasPendingAutoDismissal: %d, _recordingFromWxDevice: %d", (uint8_t *)&v16, 0x18u);
    }
    if (self->_hasPendingAutoDismissal)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperiencePresentation delegate](self, "delegate"));
      v11 = v10;
      v12 = self;
      v13 = 4;
    }
    else
    {
      v6 = self->_recordingFromWxDevice;
      if (!v6)
        goto LABEL_17;
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperiencePresentation delegate](self, "delegate"));
      v11 = v10;
      v12 = self;
      v13 = 58;
    }
    objc_msgSend(v10, "dismissSiriPresentation:withReason:", v12, v13);

    goto LABEL_16;
  }
  if (a4 == 12)
  {
    v14 = AFSiriLogContextConnection;
    v15 = os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT);
    v6 = 0;
    if (!v15)
      goto LABEL_17;
    v16 = 136315138;
    v17 = "-[SRSystemAssistantExperiencePresentation siriDidTransitionFromState:event:]";
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%s #compact Speech was determined as directed at siri stop pausing auto dismissal", (uint8_t *)&v16, 0xCu);
LABEL_16:
    v6 = 0;
    goto LABEL_17;
  }
  if (a4 != 11)
    return;
  v5 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    v16 = 136315138;
    v17 = "-[SRSystemAssistantExperiencePresentation siriDidTransitionFromState:event:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s #compact Speech start detected, pausing auto dismissal", (uint8_t *)&v16, 0xCu);
  }
  v6 = 1;
LABEL_17:
  self->_shouldPauseAutoDismissal = v6;
}

- (void)siriWillProcessAppLaunchWithBundleIdentifier:(id)a3
{
  id v4;
  NSObject *v5;

  v4 = a3;
  v5 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
    sub_10009DFE0((uint64_t)v4, v5);
  -[SRSystemAssistantExperiencePresentation _handleNonSnippetResponse:](self, "_handleNonSnippetResponse:", 2);

}

- (void)siriDidEnterLatencyState
{
  -[SiriSharedUICompactViewModelController revealLatencyView](self->_activeViewModelController, "revealLatencyView");
}

- (void)siriDidReceiveLatencyProgressUpdate:(id)a3
{
  -[SiriSharedUICompactViewModelController updateLatencySummary:](self->_activeViewModelController, "updateLatencySummary:", a3);
}

- (void)previousConversationDidLoad:(id)a3
{
  id v4;
  id v5;
  unsigned __int8 v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  double v12;
  NSObject *viewModelControllerQueue;
  _QWORD v14[5];
  id v15;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "lastItem"));
  if (!objc_msgSend(v5, "isPersistentAcrossInvocations"))
  {
LABEL_8:

    goto LABEL_9;
  }
  v6 = -[SRSystemAssistantExperienceViewController isInAmbient](self->_saeViewController, "isInAmbient");

  if ((v6 & 1) == 0)
  {
    v7 = SRUIFMaxIntervalForDisplayingPreviousConversation();
    if (v7 != -1)
    {
      v8 = v7;
      v9 = objc_alloc((Class)SRUIFPreferences);
      v5 = objc_msgSend(v9, "initWithSuiteName:", SRUIFPreferencesDefaultDomain);
      v10 = objc_msgSend(v5, "integerForKey:", SRUIFPreferencesPreviousConversationEndTimestamp);
      if (v10)
      {
        v11 = v10;
        +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
        if ((uint64_t)v12 - (uint64_t)v11 >= 0 && (uint64_t)v12 - (uint64_t)v11 <= v8)
        {
          viewModelControllerQueue = self->_viewModelControllerQueue;
          v14[0] = _NSConcreteStackBlock;
          v14[1] = 3221225472;
          v14[2] = sub_10002AC70;
          v14[3] = &unk_100122E70;
          v14[4] = self;
          v15 = v4;
          dispatch_async(viewModelControllerQueue, v14);

        }
      }
      goto LABEL_8;
    }
  }
LABEL_9:

}

- (void)attemptedToSaveConversation:(id)a3 withResult:(BOOL)a4
{
  _BOOL4 v4;
  void *v5;
  unsigned int v6;
  id v7;
  double v8;
  uint64_t v9;
  id v10;

  v4 = a4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "lastItem"));
  v6 = objc_msgSend(v5, "isPersistentAcrossInvocations");

  if (v6)
  {
    v7 = objc_alloc((Class)SRUIFPreferences);
    v10 = objc_msgSend(v7, "initWithSuiteName:", SRUIFPreferencesDefaultDomain);
    if (v4)
    {
      +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
      v9 = (uint64_t)v8;
    }
    else
    {
      v9 = 0;
    }
    objc_msgSend(v10, "setInteger:forKey:", v9, SRUIFPreferencesPreviousConversationEndTimestamp);

  }
}

- (void)animatedDisappearanceDidBeginWithDuration:(double)a3 reason:(int64_t)a4
{
  -[SRSystemAssistantExperienceViewController animatedDisappearanceDidBeginWithDuration:reason:](self->_saeViewController, "animatedDisappearanceDidBeginWithDuration:reason:", a4, a3);
}

- (void)didPresentResponseFullyInApp
{
  -[SRSystemAssistantExperiencePresentation _handleNonSnippetResponse:](self, "_handleNonSnippetResponse:", 3);
}

- (void)_handleNonSnippetResponse:(int64_t)a3
{
  NSObject *v4;
  char v5;
  uint64_t v6;
  NSObject *v7;
  int64_t inputType;
  NSObject *v9;
  _BOOL4 v10;
  uint64_t v11;
  int64_t v12;
  NSObject *v13;
  _BOOL4 v14;
  void *v15;
  NSObject *v16;
  char v17;
  int v18;
  const char *v19;

  switch(a3)
  {
    case 0:
      v4 = AFSiriLogContextConnection;
      if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
      {
        v18 = 136315138;
        v19 = "-[SRSystemAssistantExperiencePresentation _handleNonSnippetResponse:]";
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s #dismissal Omitted dialog -> recording _hasOmittedDialogFromPresenting = YES", (uint8_t *)&v18, 0xCu);
      }
      v5 = 0;
      v6 = 34;
      goto LABEL_24;
    case 1:
      v7 = AFSiriLogContextConnection;
      if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
      {
        v18 = 136315138;
        v19 = "-[SRSystemAssistantExperiencePresentation _handleNonSnippetResponse:]";
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s #dismissal Presenting System UI -> recording _isPresentingSystemUI = YES", (uint8_t *)&v18, 0xCu);
      }
      v5 = 0;
      v6 = 35;
      goto LABEL_24;
    case 2:
      if (!_os_feature_enabled_impl("SiriUI", "persistent_siri"))
        return;
      inputType = self->_inputType;
      v9 = AFSiriLogContextConnection;
      v10 = os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT);
      if (inputType == 1)
      {
        if (v10)
        {
          v18 = 136315138;
          v19 = "-[SRSystemAssistantExperiencePresentation _handleNonSnippetResponse:]";
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s #dismissal Siri will process app launch -> dismissing Siri", (uint8_t *)&v18, 0xCu);
        }
        v11 = 29;
        goto LABEL_17;
      }
      if (v10)
      {
        v18 = 136315138;
        v19 = "-[SRSystemAssistantExperiencePresentation _handleNonSnippetResponse:]";
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s #dismissal Siri will process app launch -> recording _willLaunchApp = YES", (uint8_t *)&v18, 0xCu);
      }
      v5 = 1;
      v6 = 89;
      goto LABEL_24;
    case 3:
      v12 = self->_inputType;
      v13 = AFSiriLogContextConnection;
      v14 = os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT);
      if (v12 == 1)
      {
        if (v14)
        {
          v18 = 136315138;
          v19 = "-[SRSystemAssistantExperiencePresentation _handleNonSnippetResponse:]";
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%s #dismissal Response presented fully in-app -> dismissing Siri", (uint8_t *)&v18, 0xCu);
        }
        v11 = 64;
LABEL_17:
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperiencePresentation delegate](self, "delegate"));
        objc_msgSend(v15, "dismissSiriPresentation:withReason:", self, v11);

      }
      else
      {
        if (v14)
        {
          v18 = 136315138;
          v19 = "-[SRSystemAssistantExperiencePresentation _handleNonSnippetResponse:]";
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%s #dismissal Response presented fully in-app -> recording _presentedResponseInApp = YES", (uint8_t *)&v18, 0xCu);
        }
        v5 = 1;
        v6 = 112;
LABEL_24:
        *((_BYTE *)&self->super.isa + v6) = 1;
        v16 = AFSiriLogContextConnection;
        if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
        {
          v18 = 136315138;
          v19 = "-[SRSystemAssistantExperiencePresentation _handleNonSnippetResponse:]";
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%s Removing all elements of the response UI if needed", (uint8_t *)&v18, 0xCu);
        }
        -[SRSystemAssistantExperienceViewController removeResponseElementsIfNeeded:](self->_saeViewController, "removeResponseElementsIfNeeded:", 3);
        if (self->_inputType == 1)
          v17 = v5;
        else
          v17 = 1;
        if ((v17 & 1) == 0)
          -[SRSystemAssistantExperienceViewController endTypeToSiriLatencyStateIfNeeded](self->_saeViewController, "endTypeToSiriLatencyStateIfNeeded");
      }
      return;
    default:
      return;
  }
}

- (void)setShowsSensitiveUI:(BOOL)a3
{
  -[SRSystemAssistantExperienceViewController setShowsSensitiveUI:](self->_saeViewController, "setShowsSensitiveUI:", a3);
}

- (void)_activeConversationDidChange
{
  id v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperiencePresentation _activeConversation](self, "_activeConversation"));
  v3 = objc_msgSend(objc_alloc((Class)SiriSharedUICompactViewModelController), "initWithConversation:delegate:", v4, self);
  -[SRSystemAssistantExperiencePresentation setActiveViewModelController:](self, "setActiveViewModelController:", v3);

}

- (void)setActiveViewModelController:(id)a3
{
  id v4;
  NSObject *viewModelControllerQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  -[SiriSharedUICompactViewModelController setDelegate:](self->_activeViewModelController, "setDelegate:", 0);
  viewModelControllerQueue = self->_viewModelControllerQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002B1E8;
  block[3] = &unk_100122E70;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(viewModelControllerQueue, block);
  -[SiriSharedUICompactViewModelController setViewModelChangeObserver:](self->_activeViewModelController, "setViewModelChangeObserver:", self->_saeViewController);

}

- (int64_t)inputTypeForCompactViewModelController:(id)a3
{
  return -[SRSystemAssistantExperiencePresentation _viewModelInputTypeForRequestInputType:](self, "_viewModelInputTypeForRequestInputType:", -[SRSystemAssistantExperiencePresentation _inputType](self, "_inputType", a3));
}

- (void)compactViewModelController:(id)a3 didProcessConversationItemsWithIdentifiers:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperiencePresentation delegate](self, "delegate"));
  objc_msgSend(v6, "siriPresentation:didPresentConversationItemsWithIdentifiers:", self, v5);

}

- (BOOL)siriDeviceLockedForViewModelController:(id)a3
{
  void *v4;
  unint64_t v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperiencePresentation delegate](self, "delegate", a3));
  v5 = ((unint64_t)objc_msgSend(v4, "siriDeviceLockStateForSiriPresentation:", self) >> 1) & 1;

  return v5;
}

- (id)compactViewModelController:(id)a3 requestsTranscriptItemForAceObject:(id)a4
{
  id v4;
  void *v5;
  void *v6;

  v4 = a4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[SRLocalSnippetManager transcriptItemForObject:](SRLocalSnippetManager, "transcriptItemForObject:", v4));
  if (!v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[SiriUISnippetManager sharedInstance](SiriUISnippetManager, "sharedInstance"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "transcriptItemForObject:sizeClass:", v4, 1));

  }
  return v5;
}

- (void)immersiveExperienceRequestedForViewModelController:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperiencePresentation delegate](self, "delegate", a3));
  objc_msgSend(v4, "siriPresentation:requestHostBlurVisible:reason:fence:", self, 1, 3, 0);

}

- (void)handleRequestEndBehavior:(id)a3 isAttending:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  id v13;
  NSNumber *v14;
  NSNumber *delayDismissalMs;
  int v16;
  const char *v17;
  __int16 v18;
  id v19;

  v4 = a4;
  v6 = a3;
  v7 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    v16 = 136315394;
    v17 = "-[SRSystemAssistantExperiencePresentation handleRequestEndBehavior:isAttending:]";
    v18 = 1024;
    LODWORD(v19) = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s handling request end behavior in presentation: isAttending: %d", (uint8_t *)&v16, 0x12u);
  }
  if (v4)
  {
    if (objc_msgSend(v6, "premptivelyResumeMedia"))
    {
      v8 = AFSiriLogContextConnection;
      if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
      {
        v16 = 136315138;
        v17 = "-[SRSystemAssistantExperiencePresentation handleRequestEndBehavior:isAttending:]";
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s Presentation will resume media on idle", (uint8_t *)&v16, 0xCu);
      }
      self->_shouldResumeMediaOnIdle = 1;
    }
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "minimumAutoDismissalTimeInMs"));

    if (v9)
    {
      v10 = (void *)AFSiriLogContextConnection;
      if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
      {
        v11 = v10;
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "minimumAutoDismissalTimeInMs"));
        v13 = objc_msgSend(v12, "longValue");
        v16 = 136315394;
        v17 = "-[SRSystemAssistantExperiencePresentation handleRequestEndBehavior:isAttending:]";
        v18 = 2048;
        v19 = v13;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%s #autodismiss Setting delay dismissal for compact presentation by %ld milliseconds.", (uint8_t *)&v16, 0x16u);

      }
      v14 = (NSNumber *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "minimumAutoDismissalTimeInMs"));
      delayDismissalMs = self->_delayDismissalMs;
      self->_delayDismissalMs = v14;

    }
  }

}

- (void)handleFeedbackForm:(id)a3
{
  objc_storeStrong((id *)&self->_currentFeedbackForm, a3);
}

- (void)siriSAEViewCOntrollerRequestStopAttending:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperiencePresentation delegate](self, "delegate", a3));
  objc_msgSend(v4, "siriWillStopAttending:", self);

}

- (BOOL)hasContentAtPoint:(CGPoint)a3
{
  double y;
  double x;
  AFUIBugReportPresenting *bugReportingPresenter;

  y = a3.y;
  x = a3.x;
  bugReportingPresenter = self->_bugReportingPresenter;
  if (bugReportingPresenter
    && (-[AFUIBugReportPresenting hasContentAtPoint:](bugReportingPresenter, "hasContentAtPoint:", a3.x, a3.y) & 1) != 0)
  {
    return 1;
  }
  -[SRSystemAssistantExperiencePresentation _convertToPointInSAEViewCoordinates:](self, "_convertToPointInSAEViewCoordinates:", x, y);
  return -[SRSystemAssistantExperienceViewController hasContentAtPoint:](self->_saeViewController, "hasContentAtPoint:");
}

- (CGPoint)_convertToPointInSAEViewCoordinates:(CGPoint)a3
{
  double y;
  double x;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperienceViewController view](self->_saeViewController, "view"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "window"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "screen"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "coordinateSpace"));
  objc_msgSend(v5, "convertPoint:fromCoordinateSpace:", v8, x, y);
  v10 = v9;
  v12 = v11;

  v13 = v10;
  v14 = v12;
  result.y = v14;
  result.x = v13;
  return result;
}

- (void)didDetectGestureEvent:(int64_t)a3 inRegion:(int64_t)a4
{
  void *v7;

  v7 = (void *)AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
    sub_10009E068(v7, a3, a4);
  if (a4 == 1)
  {
    -[SRSystemAssistantExperiencePresentation _didDetectTouchOutsideOfSiri](self, "_didDetectTouchOutsideOfSiri");
  }
  else if (!a4)
  {
    -[SRSystemAssistantExperiencePresentation _didDetectGestureEventWithinSiri:](self, "_didDetectGestureEventWithinSiri:", a3);
  }
}

- (void)_didDetectGestureEventWithinSiri:(int64_t)a3
{
  _QWORD block[5];

  if (self->_inputType != 1)
  {
    self->_detectedTouchOutsideOfSiri = 0;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10002B820;
    block[3] = &unk_1001225C0;
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (void)_didDetectTouchOutsideOfSiri
{
  id v3;

  if (self->_inputType != 1)
  {
    if (-[SRSystemAssistantExperienceViewController isDisplayingResponse](self->_saeViewController, "isDisplayingResponse"))
    {
      v3 = (id)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperiencePresentation delegate](self, "delegate"));
      objc_msgSend(v3, "dismissSiriPresentation:withReason:", self, 23);

    }
    else if (self->_siriIsIdleAndQuiet)
    {
      -[SRSystemAssistantExperiencePresentation _scheduleAutoDismissalForTouchOutsideOfSiri](self, "_scheduleAutoDismissalForTouchOutsideOfSiri");
    }
    else
    {
      self->_detectedTouchOutsideOfSiri = 1;
    }
  }
}

- (void)setBottomContentInset:(double)a3
{
  -[SRSystemAssistantExperienceViewController setBottomContentInset:](self->_saeViewController, "setBottomContentInset:", a3);
}

- (void)setTopContentInset:(double)a3 animated:(BOOL)a4
{
  -[SRSystemAssistantExperienceViewController setTopContentInset:animated:](self->_saeViewController, "setTopContentInset:animated:", a4, a3);
}

- (void)siriWillBeginTearDownForDismissalReason:(int64_t)a3 withOriginalDismissalOptions:(id)a4
{
  void *v7;
  id v8;
  uint64_t v9;
  id v10;

  v10 = a4;
  self->_lastDismissalReason = a3;
  objc_storeStrong((id *)&self->_lastDismissalOptions, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperiencePresentation delegate](self, "delegate"));
  v8 = objc_msgSend(v7, "siriDeviceLockStateForSiriPresentation:", self);

  if (a3 == 13)
  {
    if (v8)
      v9 = 2;
    else
      v9 = 1;
    +[SRNotificationUtility postSiriUnavailableNotification:](SRNotificationUtility, "postSiriUnavailableNotification:", v9);
  }

}

- (id)_dismissalContextWithDismissalReason:(int64_t)a3 dismissalOptions:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  SRDismissalClassificationContext *v12;
  id v13;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperiencePresentation delegate](self, "delegate"));
  v8 = objc_msgSend(v7, "siriDeviceLockStateForSiriPresentation:", self);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperiencePresentation dataSource](self, "dataSource"));
  v10 = objc_msgSend(v9, "siriStateForSiriPresentation:", self);

  if (self->_hasPresentedContent || self->_hasOmittedDialogFromPresenting)
    v11 = 2;
  else
    v11 = 2 * self->_isPresentingSystemUI;
  v12 = [SRDismissalClassificationContext alloc];
  v13 = objc_msgSend(v6, "reason");

  return -[SRDismissalClassificationContext initWithCancellationReason:contentPresentationState:dismissalReason:isDeviceUnlocked:siriState:requestSource:](v12, "initWithCancellationReason:contentPresentationState:dismissalReason:isDeviceUnlocked:siriState:requestSource:", v13, v11, a3, v8 == 0, v10, self->_initialRequestSource);
}

- (double)expectedContentWidth
{
  void *v3;
  double v4;
  double v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperiencePresentation delegate](self, "delegate"));
  objc_msgSend(v3, "contentWidthForForSiriPresentation:", self);
  v5 = v4;

  return v5;
}

- (void)tapToEditPresented
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperiencePresentation delegate](self, "delegate"));
  objc_msgSend(v3, "tapToEditPresented:", self);

}

- (CGSize)maxSizeForSnippet
{
  double v2;
  double v3;
  CGSize result;

  -[SRSystemAssistantExperienceViewController maxSizeForSnippet](self->_saeViewController, "maxSizeForSnippet");
  result.height = v3;
  result.width = v2;
  return result;
}

- (CGRect)effectiveContentFrame
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

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperienceViewController view](self->_saeViewController, "view"));
  objc_msgSend(v2, "frame");
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

- (void)viewController:(id)a3 openURL:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  id v9;

  v7 = a5;
  v8 = a4;
  v9 = (id)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperiencePresentation delegate](self, "delegate"));
  objc_msgSend(v9, "siriPresentation:openURL:conversationId:completion:", self, v8, 0, v7);

}

- (void)viewController:(id)a3 performAceCommands:(id)a4 completion:(id)a5
{
  id v8;
  NSObject *v9;
  id v10;
  uint64_t v11;
  void *i;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  uint64_t v20;
  void *j;
  uint64_t v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  id v27;
  id obj;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _QWORD block[4];
  id v34;
  _QWORD *v35;
  _QWORD v36[4];
  NSObject *v37;
  _QWORD *v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _QWORD v43[3];
  char v44;
  _BYTE v45[128];
  _BYTE v46[128];

  v24 = a3;
  v8 = a4;
  v26 = v8;
  v27 = a5;
  if (v27)
  {
    v43[0] = 0;
    v43[1] = v43;
    v43[2] = 0x2020000000;
    v44 = 1;
    v9 = dispatch_group_create();
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    obj = v8;
    v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v46, 16, v24, v8);
    if (v10)
    {
      v11 = *(_QWORD *)v40;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(_QWORD *)v40 != v11)
            objc_enumerationMutation(obj);
          v13 = *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * (_QWORD)i);
          dispatch_group_enter(v9);
          v14 = (void *)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperiencePresentation delegate](self, "delegate"));
          v36[0] = _NSConcreteStackBlock;
          v36[1] = 3221225472;
          v36[2] = sub_10002BEF8;
          v36[3] = &unk_100122E98;
          v38 = v43;
          v37 = v9;
          objc_msgSend(v14, "siriPresentation:performAceCommand:conversationItemIdentifier:completion:", self, v13, 0, v36);

        }
        v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v46, 16);
      }
      while (v10);
    }

    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10002BF10;
    block[3] = &unk_100122EC0;
    v34 = v27;
    v35 = v43;
    dispatch_group_notify(v9, (dispatch_queue_t)&_dispatch_main_q, block);

    _Block_object_dispose(v43, 8);
  }
  else
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[SRUIFInstrumentationManager sharedManager](SRUIFInstrumentationManager, "sharedManager", v24));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "currentInstrumentationTurnContext"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "turnIdentifier"));

    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v18 = v8;
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v29, v45, 16);
    if (v19)
    {
      v20 = *(_QWORD *)v30;
      do
      {
        for (j = 0; j != v19; j = (char *)j + 1)
        {
          if (*(_QWORD *)v30 != v20)
            objc_enumerationMutation(v18);
          v22 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * (_QWORD)j);
          v23 = (void *)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperiencePresentation delegate](self, "delegate"));
          objc_msgSend(v23, "siriPresentation:performAceCommand:conversationItemIdentifier:turnIdentifier:completion:", self, v22, 0, v17, 0);

        }
        v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v29, v45, 16);
      }
      while (v19);
    }

  }
}

- (void)saeViewController:(id)a3 speakText:(id)a4 isPhonetic:(BOOL)a5 completion:(id)a6
{
  _BOOL4 v6;
  id v9;
  id v10;
  void *v11;
  id v12;

  v6 = a5;
  v9 = a6;
  v10 = a4;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperiencePresentation delegate](self, "delegate"));
  v12 = v11;
  if (v6)
    objc_msgSend(v11, "siriPresentation:synthesizeSpeechWithPhoneticText:completion:", self, v10, v9);
  else
    objc_msgSend(v11, "siriPresentation:synthesizeSpeechWithText:completion:", self, v10, v9);

}

- (void)stopSpeakingForSAEViewController:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperiencePresentation delegate](self, "delegate", a3));
  objc_msgSend(v4, "stopSpeakingForSiriPresentation:", self);

}

- (unint64_t)lockStateForSAEViewController:(id)a3
{
  void *v4;
  id v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperiencePresentation delegate](self, "delegate", a3));
  v5 = objc_msgSend(v4, "siriDeviceLockStateForSiriPresentation:", self);

  return (unint64_t)v5;
}

- (id)localeForSAEViewController:(id)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperiencePresentation delegate](self, "delegate", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localeForSiriPresentation:", self));

  return v5;
}

- (void)viewControllerDidPresentUserInterface:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "siriPresentationDidPresentUserInterface:", self);

}

- (void)userTouchedSnippet
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperiencePresentation delegate](self, "delegate"));
  objc_msgSend(v2, "userTouchedSnippet");

}

- (void)saeViewController:(id)a3 handleStartLocalRequest:(id)a4 turnIdentifier:(id)a5
{
  id v7;
  void *v8;
  char v9;
  void *v10;
  id v11;

  v11 = a4;
  v7 = a5;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperiencePresentation delegate](self, "delegate"));
  v9 = objc_opt_respondsToSelector(v8, "siriPresentation:handleStartLocalRequest:turnIdentifier:");

  if ((v9 & 1) != 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperiencePresentation delegate](self, "delegate"));
    objc_msgSend(v10, "siriPresentation:handleStartLocalRequest:turnIdentifier:", self, v11, v7);

  }
}

- (void)saeViewController:(id)a3 setStatusViewHidden:(BOOL)a4
{
  _BOOL8 v4;
  id v6;

  v4 = a4;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperiencePresentation delegate](self, "delegate", a3));
  objc_msgSend(v6, "siriPresentation:setStatusViewHidden:", self, v4);

}

- (void)viewControllerViewWillDisappear:(id)a3
{
  -[AFUIBugReportPresenting dismiss](self->_bugReportingPresenter, "dismiss", a3);
}

- (void)viewController:(id)a3 requestsHostBackgroundBlurVisible:(BOOL)a4 reason:(int64_t)a5 fence:(id)a6
{
  _BOOL8 v7;
  id v9;
  id v10;

  v7 = a4;
  v9 = a6;
  v10 = (id)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperiencePresentation delegate](self, "delegate"));
  objc_msgSend(v10, "siriPresentation:requestHostBlurVisible:reason:fence:", self, v7, a5, v9);

}

- (void)viewController:(id)a3 reduceOrbOpacity:(BOOL)a4
{
  _BOOL8 v4;
  id v6;

  v4 = a4;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperiencePresentation delegate](self, "delegate", a3));
  objc_msgSend(v6, "siriPresentation:reduceOrbOpacity:", self, v4);

}

- (void)endSiriSessionForViewController:(id)a3 withDismissalReason:(int64_t)a4
{
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperiencePresentation delegate](self, "delegate", a3));
  objc_msgSend(v6, "dismissSiriPresentation:withReason:", self, a4);

}

- (void)stopRecordingForViewController:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperiencePresentation delegate](self, "delegate", a3));
  objc_msgSend(v4, "stopRecordingSpeechForSiriPresentation:", self);

}

- (void)cancelRequestForViewController:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperiencePresentation delegate](self, "delegate", a3));
  objc_msgSend(v4, "cancelRequestForSiriPresentation:", self);

}

- (void)didPresentContentForSAEViewController:(id)a3
{
  id v4;

  self->_hasPresentedContent = 1;
  if (-[SRSystemAssistantExperienceViewController isInAmbient](self->_saeViewController, "isInAmbient", a3))
  {
    v4 = (id)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperiencePresentation delegate](self, "delegate"));
    objc_msgSend(v4, "siriPresentation:requestHostBlurVisible:reason:fence:", self, 1, 2, 0);

  }
}

- (id)effectiveCoreLocationBundleForSAEViewController:(id)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperiencePresentation delegate](self, "delegate", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "effectiveCoreLocationBundleForSiriPresentation:", self));

  return v5;
}

- (void)siriSAEViewController:(id)a3 willPresentViewController:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperiencePresentation delegate](self, "delegate"));
  objc_msgSend(v6, "siriPresentation:willPresentViewController:", self, v5);

}

- (void)didBeginProcessingConversationItems
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperiencePresentation delegate](self, "delegate"));
  objc_msgSend(v2, "didBeginProcessingConversationItems");

}

- (void)siriSAEViewController:(id)a3 willDismissViewController:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperiencePresentation delegate](self, "delegate"));
  objc_msgSend(v6, "siriPresentation:willDismissViewController:", self, v5);

}

- (void)saeViewController:(id)a3 viewDidAppearForAceObject:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperiencePresentation delegate](self, "delegate"));
  objc_msgSend(v6, "siriPresentation:viewDidAppearWithAceObject:", self, v5);

}

- (void)saeViewController:(id)a3 viewDidDisappearForAceObject:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v5 = a4;
  v8 = (id)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperiencePresentation delegate](self, "delegate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "encodedClassName"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "aceId"));

  objc_msgSend(v8, "siriPresentation:viewDidDisappearWithClassDescriptor:identifier:", self, v6, v7);
}

- (void)userDrilledIntoSnippet
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperiencePresentation delegate](self, "delegate"));
  objc_msgSend(v2, "userDrilledIntoSnippet");

}

- (void)contentDidUpdate
{
  self->_detectedTouchOutsideOfSiri = 0;
}

- (void)siriSAEViewControllerRequestsVoiceActivation:(id)a3 withRequestOptions:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperiencePresentation delegate](self, "delegate"));
  objc_msgSend(v6, "siriPresentation:startRequestWithOptions:", self, v5);

}

- (void)siriSAEViewControllerRequestsTextActivation:(id)a3 withRequestSource:(int64_t)a4
{
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperiencePresentation delegate](self, "delegate", a3));
  objc_msgSend(v6, "cancelRequestForSiriPresentation:", self);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperiencePresentation delegate](self, "delegate"));
  objc_msgSend(v7, "siriWillStopAttending:", self);

  v9 = objc_msgSend(objc_alloc((Class)SASRequestOptions), "initWithRequestSource:uiPresentationIdentifier:", a4, CFSTR("com.apple.siri.SystemAssistantExperience"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperiencePresentation delegate](self, "delegate"));
  objc_msgSend(v8, "siriPresentation:startRequestWithOptions:", self, v9);

}

- (void)siriSAEViewControllerWillBeginTextEditMenuInteraction:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperiencePresentation delegate](self, "delegate", a3));
  objc_msgSend(v4, "siriPresentation:willChangeTextInteractionEditMenuVisibility:", self, 1);

}

- (void)siriSAEViewControllerDidEndTextEditMenuInteraction:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperiencePresentation delegate](self, "delegate", a3));
  objc_msgSend(v4, "siriPresentation:willChangeTextInteractionEditMenuVisibility:", self, 0);

}

- (void)viewController:(id)a3 willChangeKeyboardVisibility:(BOOL)a4
{
  _BOOL8 v4;
  id v6;

  v4 = a4;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperiencePresentation delegate](self, "delegate", a3));
  objc_msgSend(v6, "siriPresentation:willChangeKeyboardVisibility:", self, v4);

}

- (void)didTapCloseButtonOnSnippet
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperiencePresentation delegate](self, "delegate"));
  objc_msgSend(v3, "dismissSiriPresentation:withReason:", self, 66);

}

- (id)_analytics
{
  return +[AFAnalytics sharedAnalytics](AFAnalytics, "sharedAnalytics");
}

- (void)didReceiveBugButtonLongPress
{
  self->_shouldMuteSiriFeedbackBanner = 1;
  -[SRSystemAssistantExperiencePresentation _setupBugReportingPresenterIfNecessary](self, "_setupBugReportingPresenterIfNecessary");
  -[AFUIBugReportPresenting didReceiveBugButtonLongPress](self->_bugReportingPresenter, "didReceiveBugButtonLongPress");
}

- (void)didReceiveReportBugAction
{
  self->_shouldMuteSiriFeedbackBanner = 1;
  -[SRSystemAssistantExperiencePresentation _setupBugReportingPresenterIfNecessary](self, "_setupBugReportingPresenterIfNecessary");
  -[AFUIBugReportPresenting didReceiveReportBugAction](self->_bugReportingPresenter, "didReceiveReportBugAction");
}

- (void)_setupBugReportingPresenterIfNecessary
{
  uint64_t v3;
  AFUIBugReportPresenting *v4;
  AFUIBugReportPresenting *bugReportingPresenter;

  if (!self->_bugReportingPresenter)
  {
    v3 = AFUICreateBugReportPresentingWithDelegate();
    v4 = (AFUIBugReportPresenting *)objc_claimAutoreleasedReturnValue(v3);
    bugReportingPresenter = self->_bugReportingPresenter;
    self->_bugReportingPresenter = v4;

  }
}

- (void)bugReportPresenter:(id)a3 requestsToHandlePasscodeUnlockWithCompletion:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperiencePresentation delegate](self, "delegate"));
  objc_msgSend(v6, "handlePasscodeUnlockForSiriPresentation:withCompletion:", self, v5);

}

- (void)bugReportPresenter:(id)a3 requestsToOpenURL:(id)a4 withCompletion:(id)a5
{
  id v7;
  id v8;
  id v9;

  v7 = a5;
  v8 = a4;
  v9 = (id)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperiencePresentation delegate](self, "delegate"));
  objc_msgSend(v9, "siriPresentation:openURL:conversationId:completion:", self, v8, 0, v7);

}

- (void)bugReportPresenter:(id)a3 requestsToPerformAceCommand:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperiencePresentation delegate](self, "delegate"));
  objc_msgSend(v6, "siriPresentation:performAceCommand:conversationItemIdentifier:completion:", self, v5, 0, 0);

}

- (void)bugReportPresenter:(id)a3 requestsToPresentViewController:(id)a4
{
  -[SRSystemAssistantExperienceViewController presentViewController:animated:completion:](self->_saeViewController, "presentViewController:animated:completion:", a4, 1, 0);
}

- (void)bugReportPresenter:(id)a3 requestsToTakeScreenshotWithCompletion:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperiencePresentation delegate](self, "delegate"));
  objc_msgSend(v6, "getScreenshotImageForSiriPresentation:withCompletion:", self, v5);

}

- (void)bugReportPresenter:(id)a3 setBugReportingAvailable:(BOOL)a4
{
  _BOOL8 v4;
  id v6;

  v4 = a4;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperiencePresentation delegate](self, "delegate", a3));
  objc_msgSend(v6, "siriPresentation:setBugReportingAvailable:", self, v4);

}

- (id)bugReportPresenterRequestsBugReportKeywordIdentifiers:(id)a3
{
  const __CFString *v4;

  v4 = CFSTR("1229562");
  return (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v4, 1));
}

- (id)bugReportPresenterRequestsBugReportPrefixForTitle:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc_init((Class)UIDevice);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "buildVersion"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("[%@]"), v4));
  return v5;
}

- (double)bugReportPresenterRequestsLastPresentationTime:(id)a3
{
  double result;

  -[SRSystemAssistantExperienceViewController lastPresentationTime](self->_saeViewController, "lastPresentationTime", a3);
  return result;
}

- (id)bugReportPresenterRequestsPresentingView:(id)a3
{
  return -[SRSystemAssistantExperienceViewController view](self->_saeViewController, "view", a3);
}

- (void)bugReportPresenter:(id)a3 setStatusViewHidden:(BOOL)a4
{
  _BOOL8 v4;
  id v6;

  v4 = a4;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperiencePresentation delegate](self, "delegate", a3));
  objc_msgSend(v6, "siriPresentation:setStatusViewHidden:", self, v4);

}

- (void)bugReportPresenterRequestsInvalidateAutoDismissal:(id)a3
{
  NSObject *v3;
  int v4;
  const char *v5;

  -[SRCompactAutoDismissController invalidate](self->_autoDismissController, "invalidate", a3);
  v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315138;
    v5 = "-[SRSystemAssistantExperiencePresentation bugReportPresenterRequestsInvalidateAutoDismissal:]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s #autodismiss Siri TTR invalidated Auto Dismissal to keep Siri TTR modal up.", (uint8_t *)&v4, 0xCu);
  }
}

- (void)bugReportPresenterRequestsSiriSessionToFinishCurrentRequest:(id)a3
{
  void *v3;
  NSObject *v4;
  int v5;
  const char *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperiencePresentation delegate](self, "delegate", a3));
  objc_msgSend(v3, "siriSessionWillCancelRequest");

  v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315138;
    v6 = "-[SRSystemAssistantExperiencePresentation bugReportPresenterRequestsSiriSessionToFinishCurrentRequest:]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s #SiriTTR Cancel current Siri Session request so that it doesn't interrupt user filing issue details.", (uint8_t *)&v5, 0xCu);
  }
}

- (BOOL)bugReportPresenterShouldPromptUserForScreenshotPermission:(id)a3
{
  return 1;
}

- (void)bugReportPresenter:(id)a3 requestsSiriDismissalWithReason:(int64_t)a4
{
  NSObject *v6;
  void *v7;
  int v8;
  const char *v9;
  __int16 v10;
  int64_t v11;

  v6 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 136315394;
    v9 = "-[SRSystemAssistantExperiencePresentation bugReportPresenter:requestsSiriDismissalWithReason:]";
    v10 = 2048;
    v11 = a4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s #SiriTTR: Dismissing Siri with SASDismissalReason: %ld", (uint8_t *)&v8, 0x16u);
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperiencePresentation delegate](self, "delegate"));
  objc_msgSend(v7, "dismissSiriPresentation:withReason:", self, a4);

}

- (void)saeViewController:(id)a3 requestsKeyboardWithCompletion:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperiencePresentation delegate](self, "delegate"));
  objc_msgSend(v6, "siriPresentation:requestsKeyboardWithCompletion:", self, v5);

}

- (void)saeViewController:(id)a3 willBeginEditingOfType:(int64_t)a4
{
  _BOOL8 v5;
  id v6;

  v5 = a4 == 1;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperiencePresentation delegate](self, "delegate", a3));
  objc_msgSend(v6, "siriPresentation:willBeginEditingOfType:", self, v5);

}

- (void)saeViewControllerDidEndEditing:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperiencePresentation delegate](self, "delegate", a3));
  objc_msgSend(v4, "siriPresentationDidResignFirstResponder:", self);

}

- (void)viewController:(id)a3 siriRequestEnteredWithText:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperiencePresentation delegate](self, "delegate"));
  objc_msgSend(v6, "siriPresentation:startRequestForText:", self, v5);

}

- (void)viewController:(id)a3 siriRequestEnteredWithSuggestion:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperiencePresentation delegate](self, "delegate"));
  objc_msgSend(v6, "siriPresentation:startRequestForSuggestion:inputType:", self, v5, self->_inputType);

}

- (void)viewController:(id)a3 didFinishEditingUtteranceWithText:(id)a4 originalUserUtterance:(id)a5 selectionResults:(id)a6
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  int v21;
  const char *v22;

  v9 = a4;
  v10 = a5;
  v11 = a6;
  if ((+[SiriUIUtilities string:isSameAsUserUtterance:](SiriUIUtilities, "string:isSameAsUserUtterance:", v9, v10) & 1) != 0)
  {
    v12 = AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
    {
      v21 = 136315138;
      v22 = "-[SRSystemAssistantExperiencePresentation viewController:didFinishEditingUtteranceWithText:originalUserUtter"
            "ance:selectionResults:]";
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%s #compact: edited text was same as original, not creating new UserUtterance", (uint8_t *)&v21, 0xCu);
    }
  }
  else
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperiencePresentation delegate](self, "delegate"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "correctionIdentifier"));
    objc_msgSend(v13, "siriPresentation:startEditedRequestWithText:correctionIdentifier:userSelectionResults:", self, v9, v14, v11);

    v15 = AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
    {
      v21 = 136315138;
      v22 = "-[SRSystemAssistantExperiencePresentation viewController:didFinishEditingUtteranceWithText:originalUserUtter"
            "ance:selectionResults:]";
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%s #compact: creating new UserUtterance from edited text", (uint8_t *)&v21, 0xCu);
    }
    v16 = objc_alloc((Class)AFUserUtterance);
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "correctionIdentifier"));
    v18 = objc_msgSend(v16, "initWithString:correctionIdentifier:", v9, v17);

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperiencePresentation activeViewModelController](self, "activeViewModelController"));
    objc_msgSend(v19, "revealUserUtterance:backingAceObject:", v18, 0);

  }
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperiencePresentation delegate](self, "delegate"));
  objc_msgSend(v20, "siriPresentationDidEndEditing:", self);

}

- (void)saeViewControllerRequestsHIDEventDefferal:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperiencePresentation delegate](self, "delegate", a3));
  objc_msgSend(v4, "siriPresentationRequestsHIDEventDefferal:", self);

}

- (void)saeViewControllerCancelHIDEventDefferal:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperiencePresentation delegate](self, "delegate", a3));
  objc_msgSend(v4, "siriPresentationCancelHIDEventDefferal:", self);

}

- (id)feedbackFormForCurrentRequest
{
  return self->_currentFeedbackForm;
}

- (SASRequestOptions)_activeRequestOptions
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperiencePresentation delegate](self, "delegate"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "activeRequestOptionsForSiriPresentation:", self));

  return (SASRequestOptions *)v4;
}

- (void)siriIsIdleAndQuietStatusDidChange:(BOOL)a3 isAttending:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL4 v5;
  NSObject *v7;
  NSString *responseMode;
  _BOOL4 requestIsWiredMicOrBTHeadsetOrWx;
  NSString *v10;
  uint64_t Name;
  void *v12;
  _BOOL4 v13;
  NSNumber *delayDismissalMs;
  double v15;
  NSObject *v16;
  _BOOL4 userCancelledRequestViaOrbViewTap;
  NSObject *v18;
  _BOOL4 v19;
  double v20;
  const char *v21;
  _BYTE v22[24];
  __int16 v23;
  NSString *v24;
  __int16 v25;
  _BOOL4 v26;

  v4 = a4;
  v5 = a3;
  v7 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    responseMode = self->_responseMode;
    requestIsWiredMicOrBTHeadsetOrWx = self->_requestIsWiredMicOrBTHeadsetOrWx;
    *(_DWORD *)v22 = 136316162;
    *(_QWORD *)&v22[4] = "-[SRSystemAssistantExperiencePresentation siriIsIdleAndQuietStatusDidChange:isAttending:]";
    *(_WORD *)&v22[12] = 1024;
    *(_DWORD *)&v22[14] = v5;
    *(_WORD *)&v22[18] = 1024;
    *(_DWORD *)&v22[20] = v4;
    v23 = 2112;
    v24 = responseMode;
    v25 = 1024;
    v26 = requestIsWiredMicOrBTHeadsetOrWx;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s #compact siriIsIdleAndQuiet: %d, isAttending: %d, responseMode: %@, requestIsWiredMicOrBTHeadsetOrWx: %d", v22, 0x28u);
  }
  self->_siriIsIdleAndQuiet = v5;
  -[SRCompactAutoDismissController stopAutoDismissalAttentionController](self->_autoDismissController, "stopAutoDismissalAttentionController");
  if (!v5)
    return;
  -[SRSystemAssistantExperienceViewController siriIsIdleAndQuiet](self->_saeViewController, "siriIsIdleAndQuiet");
  if (self->_detectedTouchOutsideOfSiri)
    -[SRSystemAssistantExperiencePresentation _scheduleAutoDismissalForTouchOutsideOfSiri](self, "_scheduleAutoDismissalForTouchOutsideOfSiri");
  if (v4)
  {
    v10 = self->_responseMode;
    Name = MDModeGetName(0);
    v12 = (void *)objc_claimAutoreleasedReturnValue(Name);
    if (-[NSString isEqualToString:](v10, "isEqualToString:", v12))
    {

    }
    else
    {
      v13 = self->_requestIsWiredMicOrBTHeadsetOrWx;

      if (!v13)
        goto LABEL_15;
    }
    delayDismissalMs = self->_delayDismissalMs;
    if (delayDismissalMs)
    {
      v15 = (double)-[NSNumber longValue](delayDismissalMs, "longValue") / 1000.0;
      v16 = AFSiriLogContextConnection;
      if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v22 = 136315394;
        *(_QWORD *)&v22[4] = "-[SRSystemAssistantExperiencePresentation siriIsIdleAndQuietStatusDidChange:isAttending:]";
        *(_WORD *)&v22[12] = 2048;
        *(double *)&v22[14] = v15;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%s #compact, setting minimum dismissal time to %lf s for VoiceOnly/Headphones", v22, 0x16u);
      }
    }
    else
    {
      v15 = 0.0;
    }
    -[SRCompactAutoDismissController updateMinimumIdleTimeInterval:](self->_autoDismissController, "updateMinimumIdleTimeInterval:", v15);
  }
LABEL_15:
  -[SRCompactAutoDismissController startAutoDismissalAttentionController](self->_autoDismissController, "startAutoDismissalAttentionController");
  if (!self->_hasPresentedContent
    && !self->_hasOmittedDialogFromPresenting
    && !self->_isPresentingSystemUI
    && !self->_willLaunchApp
    && !self->_presentedResponseFullyInApp)
  {
    userCancelledRequestViaOrbViewTap = self->_userCancelledRequestViaOrbViewTap;
    v18 = AFSiriLogContextConnection;
    v19 = os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT);
    if (userCancelledRequestViaOrbViewTap)
    {
      v20 = 3.0;
      if (v19)
      {
        *(_DWORD *)v22 = 136315394;
        *(_QWORD *)&v22[4] = "-[SRSystemAssistantExperiencePresentation siriIsIdleAndQuietStatusDidChange:isAttending:]";
        *(_WORD *)&v22[12] = 2048;
        *(_QWORD *)&v22[14] = 0x4008000000000000;
        v21 = "%s #autodismiss Siri is idle and hasn't presented content to the user. Scheduling autodismissal in %.0f se"
              "conds because orbView was tapped";
LABEL_25:
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, v21, v22, 0x16u);
      }
    }
    else
    {
      v20 = 0.300000012;
      if (v19)
      {
        *(_DWORD *)v22 = 136315394;
        *(_QWORD *)&v22[4] = "-[SRSystemAssistantExperiencePresentation siriIsIdleAndQuietStatusDidChange:isAttending:]";
        *(_WORD *)&v22[12] = 2048;
        *(_QWORD *)&v22[14] = 0x3FD3333340000000;
        v21 = "%s #autodismiss Siri is idle and hasn't presented content to the user. Scheduling autodismissal in %.0f seconds";
        goto LABEL_25;
      }
    }
    -[SRCompactAutoDismissController scheduleAutoDismissalForLongIdling:](self->_autoDismissController, "scheduleAutoDismissalForLongIdling:", v20, *(_OWORD *)v22, *(_QWORD *)&v22[16]);
  }
}

- (void)didReceiveOrbViewTapToCancelRequest
{
  self->_userCancelledRequestViaOrbViewTap = 1;
}

- (BOOL)shouldUseEventDrivenIdleAndQuietUpdates
{
  return 1;
}

- (void)siriWillShowPasscodeUnlockAndCancelRequest:(BOOL)a3
{
  -[SRCompactAutoDismissController setUseExtendedTimeout:](self->_autoDismissController, "setUseExtendedTimeout:", 1);
}

- (void)siriDidHidePasscodeUnlock
{
  -[SRCompactAutoDismissController setUseExtendedTimeout:](self->_autoDismissController, "setUseExtendedTimeout:", 0);
}

- (id)dismissalUserInfo
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  _QWORD v8[2];
  _QWORD v9[2];

  v2 = SUICStringForAutoDismissalReason(-[SRCompactAutoDismissController autoDismissalReason](self->_autoDismissController, "autoDismissalReason"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  if (v3)
  {
    v8[0] = SiriUIDismissalReasonUserInfoKey;
    v4 = SiriUIDismissalReasonStringFromReason(1);
    v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
    v8[1] = SiriUIDismissalReasonDescriptionUserInfoKey;
    v9[0] = v5;
    v9[1] = v3;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v9, v8, 2));

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)_scheduleAutoDismissalForTouchOutsideOfSiri
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002D5E8;
  block[3] = &unk_1001225C0;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)_setInputType:(int64_t)a3
{
  int64_t inputType;
  void *v6;
  id v7;

  inputType = self->_inputType;
  if (inputType != a3)
  {
    if (a3 == 1 && inputType == 2)
    {
      self->_inputType = 1;
      -[SRSystemAssistantExperienceViewController switchPresentationToTextInput](self->_saeViewController, "switchPresentationToTextInput");
      -[SRSystemAssistantExperiencePresentation siriSAEViewControllerRequestsTextActivation:withRequestSource:](self, "siriSAEViewControllerRequestsTextActivation:withRequestSource:", self->_saeViewController, 47);
    }
    else
    {
      self->_inputType = a3;
    }
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperiencePresentation activeViewModelController](self, "activeViewModelController"));
    objc_msgSend(v6, "inputTypeDidChange");

    v7 = (id)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperiencePresentation delegate](self, "delegate"));
    objc_msgSend(v7, "siriPresentation:inputTypeDidChange:", self, a3);

  }
}

- (void)autoDismissControllerRequestsDismissal:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  const char *v8;

  v4 = a3;
  if (self->_shouldPauseAutoDismissal)
  {
    v5 = AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 136315138;
      v8 = "-[SRSystemAssistantExperiencePresentation autoDismissControllerRequestsDismissal:]";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s #compact holding onto autodismissal event waiting for mitigation result", (uint8_t *)&v7, 0xCu);
    }
    self->_hasPendingAutoDismissal = 1;
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperiencePresentation delegate](self, "delegate"));
    objc_msgSend(v6, "dismissSiriPresentation:withReason:", self, 4);

  }
}

- (void)autoDismissControllerRequestsStopAttending:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperiencePresentation delegate](self, "delegate", a3));
  objc_msgSend(v4, "siriWillStopAttending:", self);

}

- (void)modalContainerViewControllerViewWillDisappear:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperiencePresentation delegate](self, "delegate"));
  objc_msgSend(v5, "siriPresentation:willDismissViewController:", self, v4);

}

- (void)modalContainerViewControllerViewDidDisappear:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[SRSystemAssistantExperiencePresentation delegate](self, "delegate"));
  objc_msgSend(v5, "siriPresentation:didDismissViewController:", self, v4);

}

- (void)playbackDidFinishForVideoPlayerViewController:(id)a3
{
  -[SRSystemAssistantExperiencePresentation _dismissVideoPlayerViewController](self, "_dismissVideoPlayerViewController", a3);
}

- (void)playbackDidFailForVideoPlayerViewController:(id)a3
{
  -[SRSystemAssistantExperiencePresentation _dismissVideoPlayerViewController](self, "_dismissVideoPlayerViewController", a3);
}

- (void)_dismissVideoPlayerViewController
{
  _QWORD v3[5];

  -[SRSystemAssistantExperienceViewController dismissViewControllerAnimated:completion:](self->_saeViewController, "dismissViewControllerAnimated:completion:", 1, 0);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10002D94C;
  v3[3] = &unk_1001225C0;
  v3[4] = self;
  +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v3, 0.2);
}

- (int64_t)_viewModelInputTypeForRequestInputType:(int64_t)a3
{
  if (a3 == 1)
    return 1;
  else
    return 2 * (a3 == 2);
}

- (BOOL)alwaysShowRecognizedSpeech
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[AFPreferences sharedPreferences](AFPreferences, "sharedPreferences"));
  v3 = objc_msgSend(v2, "alwaysShowRecognizedSpeech");

  return v3;
}

- (SiriUIPresentationDataSource)dataSource
{
  return (SiriUIPresentationDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (void)setDataSource:(id)a3
{
  objc_storeWeak((id *)&self->_dataSource, a3);
}

- (SiriUIPresentationDelegate)delegate
{
  return (SiriUIPresentationDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (SiriSharedUICompactViewModelController)activeViewModelController
{
  return self->_activeViewModelController;
}

- (int64_t)_inputType
{
  return self->_inputType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeViewModelController, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_currentFeedbackForm, 0);
  objc_storeStrong((id *)&self->_viewModelControllerQueue, 0);
  objc_storeStrong((id *)&self->_previousConversation, 0);
  objc_storeStrong((id *)&self->_delayDismissalMs, 0);
  objc_storeStrong((id *)&self->_lastDismissalOptions, 0);
  objc_storeStrong((id *)&self->_responseMode, 0);
  objc_storeStrong((id *)&self->_autoDismissController, 0);
  objc_storeStrong((id *)&self->_bugReportingPresenter, 0);
  objc_storeStrong((id *)&self->_saeViewController, 0);
}

@end
