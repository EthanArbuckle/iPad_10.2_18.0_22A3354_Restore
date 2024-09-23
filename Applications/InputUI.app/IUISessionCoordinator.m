@implementation IUISessionCoordinator

- (IUISessionCoordinator)initWithQueue:(id)a3
{
  id v5;
  IUISessionCoordinator *v6;
  IUISessionCoordinator *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IUISessionCoordinator;
  v6 = -[IUISessionCoordinator init](&v9, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_dispatchQueue, a3);

  return v7;
}

+ (BOOL)_useRTIInterfaceForAutoFillOnIphone
{
  if (qword_1000293A0 != -1)
    dispatch_once(&qword_1000293A0, &stru_10001C550);
  return byte_100029398;
}

- (void)reloadInputSource
{
  IUIRTIInputSource *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  uint8_t v11[16];

  if (qword_1000293B0 != -1)
    dispatch_once(&qword_1000293B0, &stru_10001C710);
  if (!byte_1000293A8)
  {
    v3 = objc_alloc_init(IUIRTIInputSource);
    -[IUIRTIInputSource setDataTransportDelegate:](v3, "setDataTransportDelegate:", self);
    -[IUIRTIInputSource setHidden:](v3, "setHidden:", 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[IUISessionCoordinator inputSourceViewController](self, "inputSourceViewController"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "view"));
    objc_msgSend(v5, "addSubview:", v3);

    -[IUISessionCoordinator setTextInputSource:](self, "setTextInputSource:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "systemDelegateMultiplexer"));
    objc_msgSend(v7, "setPrimaryDelegate:", self);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[IUISessionCoordinator textInputSource](self, "textInputSource"));
    objc_msgSend(v8, "setCanBecomeFirstResponder:", 0);

    v9 = sub_1000039F4();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Input source did load", v11, 2u);
    }

  }
}

- (void)setCurrentSession:(id)a3
{
  RTIInputSystemServiceSession *v4;
  RTIInputSystemServiceSession *currentSession;

  v4 = (RTIInputSystemServiceSession *)a3;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  currentSession = self->_currentSession;
  self->_currentSession = v4;

}

- (void)inputSource:(id)a3 didGenerateTextActionPayload:(id)a4
{
  id v5;
  void *v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[IUISessionCoordinator currentServiceSession](self, "currentServiceSession"));
  if (!v6)
  {
    v7 = sub_1000039F4();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_10000DF98(v8, v9, v10, v11, v12, v13, v14, v15);

  }
  objc_msgSend(v6, "handleTextActionPayload:", v5);

}

- (id)serviceSessionPayloadDelegate
{
  void *v2;
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[IUISessionCoordinator currentServiceSession](self, "currentServiceSession"));
  if (!v2)
  {
    v3 = sub_1000039F4();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      sub_10000E008(v4, v5, v6, v7, v8, v9, v10, v11);

  }
  return v2;
}

- (id)assertionForOptions:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;

  v4 = a3;
  v5 = v4;
  if (v4
    && ((v6 = objc_msgSend(v4, "animated"), v7 = objc_msgSend(v5, "offscreenDirection"), (_DWORD)v7)
     || (v6 & 1) == 0))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[IUISessionCoordinator textInputSource](self, "textInputSource"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "keyboardSceneDelegate"));
    v11 = v10;
    if (v10)
      v12 = v10;
    else
      v12 = (id)objc_claimAutoreleasedReturnValue(+[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate"));
    v13 = v12;

    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "requestAnimationAssertionWithDirection:animated:", v7, v6));
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)invalidateAssertionIfNeeded:(id)a3 resetKeyboardAlpha:(BOOL)a4
{
  _BOOL4 v4;
  id v5;

  v4 = a4;
  v5 = a3;
  if (v4)
    +[UIKeyboard setKeyboardAlpha:](UIKeyboard, "setKeyboardAlpha:", 1.0);
  objc_msgSend(v5, "invalidate");

}

- (id)sessionChangeQueue
{
  NSObject *v3;
  NSMutableArray *sessionChangeQueue;
  NSMutableArray *v5;
  NSMutableArray *v6;

  v3 = objc_claimAutoreleasedReturnValue(-[IUISessionCoordinator dispatchQueue](self, "dispatchQueue"));
  dispatch_assert_queue_V2(v3);

  sessionChangeQueue = self->_sessionChangeQueue;
  if (!sessionChangeQueue)
  {
    v5 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v6 = self->_sessionChangeQueue;
    self->_sessionChangeQueue = v5;

    sessionChangeQueue = self->_sessionChangeQueue;
  }
  return sessionChangeQueue;
}

- (void)handlePendingSuggestionsDataIfNecessary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[IUISessionCoordinator pendingSuggestions](self, "pendingSuggestions"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[IUISessionCoordinator currentSession](self, "currentSession"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "uuid"));
  v12 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", v5));

  if (v12)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[IUISessionCoordinator pendingSuggestions](self, "pendingSuggestions"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[IUISessionCoordinator currentSession](self, "currentSession"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "uuid"));
    objc_msgSend(v6, "removeObjectForKey:", v8);

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[UITextSuggestion decodeTextSuggestions:](UITextSuggestion, "decodeTextSuggestions:", v12));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[IUISessionCoordinator textInputSource](self, "textInputSource"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "inputDelegate"));
    objc_msgSend(v11, "setSuggestions:", v9);

  }
}

- (RTIInputSystemDelegate)autofillUIServiceDelegate
{
  uint64_t v3;
  void *v4;
  objc_class *v5;
  RTIInputSystemDelegate *v6;
  RTIInputSystemDelegate *autofillUIServiceDelegate;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  if (!self->_autofillUIServiceDelegate
    && +[UIKeyboard supportsAutoFillPanel](UIKeyboard, "supportsAutoFillPanel")
    && objc_msgSend((id)objc_opt_class(self, v3), "_useRTIInterfaceForAutoFillOnIphone"))
  {
    v10 = 0;
    v11 = &v10;
    v12 = 0x2050000000;
    v4 = (void *)qword_1000293B8;
    v13 = qword_1000293B8;
    if (!qword_1000293B8)
    {
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_10000B480;
      v9[3] = &unk_10001C518;
      v9[4] = &v10;
      sub_10000B480((uint64_t)v9);
      v4 = (void *)v11[3];
    }
    v5 = objc_retainAutorelease(v4);
    _Block_object_dispose(&v10, 8);
    v6 = (RTIInputSystemDelegate *)objc_alloc_init(v5);
    autofillUIServiceDelegate = self->_autofillUIServiceDelegate;
    self->_autofillUIServiceDelegate = v6;

  }
  return self->_autofillUIServiceDelegate;
}

- (id)_main_didTeardownExistingDelegateCallback_withSessionChangeAssistant:(id)a3
{
  id v3;
  id v4;
  _QWORD v6[4];
  id v7;

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000068CC;
  v6[3] = &unk_10001C578;
  v7 = a3;
  v3 = v7;
  v4 = objc_msgSend(v6, "copy");

  return v4;
}

- (id)_main_willSetupNewDelegateCallback_withSessionChangeAssistant:(id)a3
{
  id v3;
  id v4;
  _QWORD v6[4];
  id v7;

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000069A4;
  v6[3] = &unk_10001C578;
  v7 = a3;
  v3 = v7;
  v4 = objc_msgSend(v6, "copy");

  return v4;
}

- (void)_queue_queueSessionChange:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  unsigned __int8 v7;
  void *v8;
  unsigned __int8 v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  IUISessionChangeResponse *v13;
  void (**v14)(_QWORD, _QWORD);
  _QWORD v15[5];
  id v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  id v20;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[IUISessionCoordinator dispatchQueue](self, "dispatchQueue"));
  dispatch_assert_queue_V2(v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "sessionChange"));
  v7 = objc_msgSend(v6, "isBeginningSession");

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "sessionChange"));
  v9 = objc_msgSend(v8, "isEndingSession");

  v10 = sub_1000041D4();
  v11 = objc_claimAutoreleasedReturnValue(v10);
  v12 = v11;
  if ((v9 & 1) != 0 || (v7 & 1) != 0)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v18 = "-[IUISessionCoordinator _queue_queueSessionChange:]";
      v19 = 2112;
      v20 = v4;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%s  Ready to handle session change: %@", buf, 0x16u);
    }

    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100006BE4;
    v15[3] = &unk_10001C5A0;
    v15[4] = self;
    v16 = v4;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v15);

  }
  else
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_10000E078(v4);

    v13 = -[IUISessionChangeResponse initWithResponseState:]([IUISessionChangeResponse alloc], "initWithResponseState:", 2);
    v14 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "completion"));
    ((void (**)(_QWORD, IUISessionChangeResponse *))v14)[2](v14, v13);

  }
}

- (id)_main_inputSourceForChangeContext:(id)a3
{
  id v4;
  IUIRTIInputSource *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;

  v4 = a3;
  v5 = objc_alloc_init(IUIRTIInputSource);
  -[IUIRTIInputSource setHidden:](v5, "setHidden:", 1);
  -[IUIRTIInputSource setCanBecomeFirstResponder:](v5, "setCanBecomeFirstResponder:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[RTIInputSystemDataPayload payloadWithData:](RTIInputSystemDataPayload, "payloadWithData:", 0));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "sessionChange"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "beginSessionDocumentTraits"));
  v9 = objc_msgSend(v8, "copy");
  objc_msgSend(v6, "setDocumentTraits:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "sessionChange"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "beginSessionDocumentState"));
  v12 = objc_msgSend(v11, "copy");
  objc_msgSend(v6, "setDocumentState:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "sessionChange"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "beginSessionID"));
  v15 = objc_msgSend(v14, "copy");
  objc_msgSend(v6, "setSessionUUID:", v15);

  objc_msgSend(v6, "updateData");
  -[IUIRTIInputSource ingestDataPayload:](v5, "ingestDataPayload:", v6);
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[IUISessionCoordinator inputSourceViewController](self, "inputSourceViewController"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "view"));
  objc_msgSend(v17, "addSubview:", v5);

  -[IUIRTIInputSource setCanBecomeFirstResponder:](v5, "setCanBecomeFirstResponder:", 1);
  return v5;
}

- (id)_main_placeholderInputSourceForSession:(id)a3
{
  id v4;
  IUIRTIInputSource *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  v5 = objc_alloc_init(IUIRTIInputSource);
  -[IUIRTIInputSource setHidden:](v5, "setHidden:", 1);
  -[IUIRTIInputSource setCanBecomeFirstResponder:](v5, "setCanBecomeFirstResponder:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "uuid"));
  -[IUIRTIInputSource setIdentifier:](v5, "setIdentifier:", v6);

  -[IUIRTIInputSource setPlaceholder:](v5, "setPlaceholder:", 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "currentDataPayload"));

  -[IUIRTIInputSource ingestDataPayload:](v5, "ingestDataPayload:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[IUISessionCoordinator inputSourceViewController](self, "inputSourceViewController"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "view"));
  objc_msgSend(v9, "addSubview:", v5);

  -[IUIRTIInputSource setCanBecomeFirstResponder:](v5, "setCanBecomeFirstResponder:", 1);
  return v5;
}

- (id)_main_placeholderServiceSessionWithIdentifier:(id)a3 documentTraits:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;

  v5 = a4;
  v6 = a3;
  v7 = objc_alloc_init((Class)RTIDocumentState);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[RTIInputSystemServiceSessionPlaceholder placeholderServiceSessionWithIdentifier:traits:state:](RTIInputSystemServiceSessionPlaceholder, "placeholderServiceSessionWithIdentifier:traits:state:", v6, v5, v7));

  return v8;
}

- (void)_main_handleSessionChange:(id)a3
{
  IUISessionChangeContext *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  unsigned int v9;
  unsigned int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unsigned int v15;
  void *v16;
  unsigned int v17;
  int v18;
  id v19;
  NSObject *v20;
  id v21;
  NSObject *v22;
  void *v23;
  void *v24;
  id v25;
  NSObject *v26;
  void *v27;
  IUISessionChangeResponse *v28;
  void (**v29)(_QWORD, _QWORD);
  IUISessionChangeContext *v30;
  id v31;
  NSObject *v32;
  void *v33;
  void *v34;
  id v35;
  uint64_t v36;
  void *v37;
  IUISessionChange *v38;
  void *v39;
  void *v40;
  id v41;
  IUISessionChangeContext *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  IUISessionChangeContext *v46;
  void *v47;
  IUISessionChange *v48;
  void *v49;
  id v50;
  IUISessionChangeContext *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  IUISessionChangeAssistant *v57;
  void *v58;
  void *v59;
  id v60;
  NSObject *v61;
  dispatch_time_t v62;
  NSObject *v63;
  id v64;
  NSObject *v65;
  void *v66;
  id v67;
  void *v68;
  IUISessionChangeContext *v69;
  void *v70;
  _QWORD block[4];
  IUISessionChangeResponse *v72;
  IUISessionCoordinator *v73;
  _BYTE *v74;
  uint8_t v75[4];
  const char *v76;
  __int16 v77;
  void *v78;
  uint8_t v79[4];
  const char *v80;
  __int16 v81;
  void *v82;
  uint8_t v83[32];
  _BYTE buf[24];
  uint64_t (*v85)(uint64_t, uint64_t);
  __int128 v86;

  v4 = (IUISessionChangeContext *)a3;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  v5 = sub_1000041D4();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[IUISessionChangeContext sessionChange](v4, "sessionChange"));
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "-[IUISessionCoordinator _main_handleSessionChange:]";
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s  begin session change: %@", buf, 0x16u);

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[IUISessionChangeContext sessionChange](v4, "sessionChange"));
  v9 = objc_msgSend(v8, "isEndingSession");
  v10 = objc_msgSend(v8, "isBeginningSession");
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[IUISessionCoordinator currentSession](self, "currentSession"));

  if ((v9 & (v11 != 0)) == 1)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[IUISessionCoordinator currentSession](self, "currentSession"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "uuid"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "endSessionID"));
    v15 = objc_msgSend(v13, "isEqual:", v14);

    if (v15)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "options"));
      v17 = objc_msgSend(v16, "shouldResign");

      v18 = v17 ^ 1;
      v15 = 1;
    }
    else
    {
      v18 = 0;
    }
  }
  else
  {
    v18 = 0;
    v15 = 0;
  }
  v19 = sub_1000041D4();
  v20 = objc_claimAutoreleasedReturnValue(v19);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136316418;
    *(_QWORD *)&buf[4] = "-[IUISessionCoordinator _main_handleSessionChange:]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = v9;
    *(_WORD *)&buf[18] = 1024;
    *(_DWORD *)&buf[20] = v10;
    LOWORD(v85) = 1024;
    *(_DWORD *)((char *)&v85 + 2) = v11 != 0;
    HIWORD(v85) = 1024;
    LODWORD(v86) = v15;
    WORD2(v86) = 1024;
    *(_DWORD *)((char *)&v86 + 6) = v18;
    _os_log_debug_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEBUG, "%s  \n  changeEndsSession:   %d\n  changeBeginsSession: %d\n  hasCurrentSession:   %d\n  endingSessionMatchesCurrentSession: %d\n  createPlaceholderInputSource: %d", buf, 0x2Au);
  }

  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v85 = sub_100007808;
  *(_QWORD *)&v86 = sub_100007818;
  *((_QWORD *)&v86 + 1) = 0;
  if ((v10 & (v11 != 0)) == 1)
  {
    v21 = sub_1000041D4();
    v22 = objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[IUISessionCoordinator currentSession](self, "currentSession"));
      sub_10000E1E4(v23, (uint64_t)v4, v83, v22);
    }

  }
  if (((v15 | v9 ^ 1) & 1) == 0)
  {
    v25 = sub_1000041D4();
    v26 = objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
    {
      v27 = (void *)objc_claimAutoreleasedReturnValue(-[IUISessionChangeContext sessionChange](v4, "sessionChange"));
      sub_10000E17C(v27, v79, v26);
    }

    v28 = -[IUISessionChangeResponse initWithResponseState:]([IUISessionChangeResponse alloc], "initWithResponseState:", 2);
    v29 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[IUISessionChangeContext completion](v4, "completion"));
    ((void (**)(_QWORD, IUISessionChangeResponse *))v29)[2](v29, v28);

    v30 = 0;
    goto LABEL_36;
  }
  if (v11)
  {
    v70 = (void *)objc_claimAutoreleasedReturnValue(-[IUISessionCoordinator textInputSource](self, "textInputSource"));
    if (v10)
    {
LABEL_17:
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[IUISessionCoordinator _main_inputSourceForChangeContext:](self, "_main_inputSourceForChangeContext:", v4));
      v69 = 0;
      goto LABEL_27;
    }
  }
  else
  {
    v70 = 0;
    if (v10)
      goto LABEL_17;
  }
  if (v18)
  {
    v68 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
    v31 = sub_1000041D4();
    v32 = objc_claimAutoreleasedReturnValue(v31);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v79 = 136315394;
      v80 = "-[IUISessionCoordinator _main_handleSessionChange:]";
      v81 = 2112;
      v82 = v68;
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "%s  Creating placeholder service session with identifier: %@", v79, 0x16u);
    }

    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v70, "sourceSession"));
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "documentTraits"));
    v35 = objc_msgSend(v34, "copy");

    objc_msgSend(v35, "setAutofillMode:", 0);
    objc_msgSend(v35, "setAutofillSubMode:", 0);
    objc_msgSend(v35, "setAutofillContext:", 0);
    v67 = objc_alloc_init((Class)RTIDocumentState);
    v36 = objc_claimAutoreleasedReturnValue(-[IUISessionCoordinator _main_placeholderServiceSessionWithIdentifier:documentTraits:](self, "_main_placeholderServiceSessionWithIdentifier:documentTraits:", v68, v35));
    v37 = *(void **)(*(_QWORD *)&buf[8] + 40);
    *(_QWORD *)(*(_QWORD *)&buf[8] + 40) = v36;

    v24 = (void *)objc_claimAutoreleasedReturnValue(-[IUISessionCoordinator _main_placeholderInputSourceForSession:](self, "_main_placeholderInputSourceForSession:", *(_QWORD *)(*(_QWORD *)&buf[8] + 40)));
    v38 = [IUISessionChange alloc];
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "endSessionID"));
    v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "options"));
    v41 = -[IUISessionChange initEndSessionWithID:andBeginPlaceholderSessionWithID:documentTraits:documentState:options:](v38, "initEndSessionWithID:andBeginPlaceholderSessionWithID:documentTraits:documentState:options:", v39, v68, v35, v67, v40);

    v42 = [IUISessionChangeContext alloc];
    v43 = (void *)objc_claimAutoreleasedReturnValue(-[IUISessionChangeContext service](v4, "service"));
    v44 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40);
    v45 = (void *)objc_claimAutoreleasedReturnValue(-[IUISessionChangeContext completion](v4, "completion"));
    v46 = -[IUISessionChangeContext initWithService:session:sessionChange:completion:](v42, "initWithService:session:sessionChange:completion:", v43, v44, v41, v45);

    v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "options"));
    objc_msgSend(v47, "setShouldResign:", 1);
    v48 = [IUISessionChange alloc];
    v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "uuid"));
    v50 = -[IUISessionChange initEndSessionWithID:options:](v48, "initEndSessionWithID:options:", v49, v47);

    v51 = [IUISessionChangeContext alloc];
    v52 = (void *)objc_claimAutoreleasedReturnValue(-[IUISessionChangeContext service](v46, "service"));
    v69 = -[IUISessionChangeContext initWithService:session:sessionChange:completion:](v51, "initWithService:session:sessionChange:completion:", v52, *(_QWORD *)(*(_QWORD *)&buf[8] + 40), v50, &stru_10001C5E0);

    v8 = v41;
    v4 = v46;
  }
  else
  {
    v69 = 0;
    v24 = 0;
  }
LABEL_27:
  v53 = (void *)objc_claimAutoreleasedReturnValue(-[IUISessionChangeContext sessionChange](v4, "sessionChange"));
  v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "options"));
  v55 = (void *)objc_claimAutoreleasedReturnValue(-[IUISessionCoordinator assertionForOptions:](self, "assertionForOptions:", v54));

  v56 = (void *)objc_claimAutoreleasedReturnValue(+[UIKeyboardImpl sharedInstance](UIKeyboardImpl, "sharedInstance"));
  v57 = -[IUISessionChangeAssistant initWithController:sessionChangeContext:outgoingInputSource:incomingInputSource:]([IUISessionChangeAssistant alloc], "initWithController:sessionChangeContext:outgoingInputSource:incomingInputSource:", self, v4, v70, v24);
  v58 = (void *)objc_claimAutoreleasedReturnValue(-[IUISessionCoordinator _main_didTeardownExistingDelegateCallback_withSessionChangeAssistant:](self, "_main_didTeardownExistingDelegateCallback_withSessionChangeAssistant:", v57));
  v59 = (void *)objc_claimAutoreleasedReturnValue(-[IUISessionCoordinator _main_willSetupNewDelegateCallback_withSessionChangeAssistant:](self, "_main_willSetupNewDelegateCallback_withSessionChangeAssistant:", v57));
  objc_msgSend(v56, "setDidTeardownExistingDelegate:", v58);
  objc_msgSend(v56, "setWillSetupNewDelegate:", v59);
  if (v24)
  {
    objc_msgSend(v24, "becomeFirstResponder");
  }
  else if (v70)
  {
    objc_msgSend(v70, "resignFirstResponder");
  }
  else
  {
    v60 = sub_1000041D4();
    v61 = objc_claimAutoreleasedReturnValue(v60);
    if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
      sub_10000E104();

  }
  -[IUISessionChangeAssistant finalizeSessionChange](v57, "finalizeSessionChange");
  -[IUISessionCoordinator invalidateAssertionIfNeeded:resetKeyboardAlpha:](self, "invalidateAssertionIfNeeded:resetKeyboardAlpha:", v55, v24 != 0);
  -[IUISessionCoordinator handlePendingSuggestionsDataIfNecessary](self, "handlePendingSuggestionsDataIfNecessary");
  objc_msgSend(v56, "setDidTeardownExistingDelegate:", 0);
  objc_msgSend(v56, "setWillSetupNewDelegate:", 0);

  if (v69)
  {
    v62 = dispatch_time(0, 50000000);
    v63 = objc_claimAutoreleasedReturnValue(-[IUISessionCoordinator dispatchQueue](self, "dispatchQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000078C4;
    block[3] = &unk_10001C608;
    v30 = v69;
    v72 = (IUISessionChangeResponse *)v30;
    v73 = self;
    v74 = buf;
    dispatch_after(v62, v63, block);

    v28 = v72;
LABEL_36:

    goto LABEL_37;
  }
  v30 = 0;
LABEL_37:
  v64 = sub_1000041D4();
  v65 = objc_claimAutoreleasedReturnValue(v64);
  if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
  {
    v66 = (void *)objc_claimAutoreleasedReturnValue(-[IUISessionChangeContext sessionChange](v4, "sessionChange"));
    *(_DWORD *)v75 = 136315394;
    v76 = "-[IUISessionCoordinator _main_handleSessionChange:]";
    v77 = 2112;
    v78 = v66;
    _os_log_impl((void *)&_mh_execute_header, v65, OS_LOG_TYPE_DEFAULT, "%s  finished session change: %@", v75, 0x16u);

  }
  _Block_object_dispose(buf, 8);

}

- (void)inputSystemService:(id)a3 didCreateInputSession:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD block[5];
  id v14;
  id v15;
  uint8_t buf[4];
  id v17;
  __int16 v18;
  id v19;

  v6 = a3;
  v7 = a4;
  v8 = sub_1000039F4();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v17 = v7;
    v18 = 2112;
    v19 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "did create session %@, service: %@", buf, 0x16u);
  }

  v10 = objc_claimAutoreleasedReturnValue(-[IUISessionCoordinator dispatchQueue](self, "dispatchQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100007B38;
  block[3] = &unk_10001C630;
  block[4] = self;
  v14 = v6;
  v15 = v7;
  v11 = v7;
  v12 = v6;
  dispatch_async(v10, block);

}

- (void)inputSystemService:(id)a3 inputSessionDidBegin:(id)a4
{
  -[IUISessionCoordinator inputSystemService:inputSessionDidBegin:options:](self, "inputSystemService:inputSessionDidBegin:options:", a3, a4, 0);
}

- (void)inputSystemService:(id)a3 inputSessionDidBegin:(id)a4 options:(id)a5
{
  id v8;
  char *v9;
  id v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  id v14;
  char *v15;
  id v16;
  IUISessionChange *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  NSObject *v23;
  IUISessionChangeContext *v24;
  NSObject *v25;
  IUISessionChangeContext *v26;
  NSObject *v27;
  _QWORD v28[5];
  char *v29;
  id v30;
  _QWORD v31[5];
  IUISessionChangeContext *v32;
  _QWORD block[5];
  id v34;
  char *v35;
  id v36;
  uint8_t buf[4];
  const char *v38;
  __int16 v39;
  id v40;

  v8 = a3;
  v9 = (char *)a4;
  v10 = a5;
  v11 = sub_1000039F4();
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v38 = v9;
    v39 = 2112;
    v40 = v8;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "did begin session %@, service: %@", buf, 0x16u);
  }

  v13 = objc_claimAutoreleasedReturnValue(-[IUISessionCoordinator dispatchQueue](self, "dispatchQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100007FC4;
  block[3] = &unk_10001C658;
  block[4] = self;
  v14 = v8;
  v34 = v14;
  v15 = v9;
  v35 = v15;
  v16 = v10;
  v36 = v16;
  dispatch_async(v13, block);

  if (qword_1000293B0 != -1)
    dispatch_once(&qword_1000293B0, &stru_10001C710);
  if (byte_1000293A8)
  {
    v17 = [IUISessionChange alloc];
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "uuid"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "documentTraits"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "documentState"));
    v21 = -[IUISessionChange initBeginSessionWithID:documentTraits:documentState:options:](v17, "initBeginSessionWithID:documentTraits:documentState:options:", v18, v19, v20, v16);

    v22 = sub_1000041D4();
    v23 = objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v38 = "-[IUISessionCoordinator inputSystemService:inputSessionDidBegin:options:]";
      v39 = 2112;
      v40 = v21;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "%s  queuing input session did begin: %@", buf, 0x16u);
    }

    v24 = -[IUISessionChangeContext initWithService:session:sessionChange:completion:]([IUISessionChangeContext alloc], "initWithService:session:sessionChange:completion:", v14, v15, v21, &stru_10001C678);
    v25 = objc_claimAutoreleasedReturnValue(-[IUISessionCoordinator dispatchQueue](self, "dispatchQueue"));
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    v31[2] = sub_1000080F0;
    v31[3] = &unk_10001C5A0;
    v31[4] = self;
    v32 = v24;
    v26 = v24;
    dispatch_async(v25, v31);

  }
  else
  {
    v27 = objc_claimAutoreleasedReturnValue(-[IUISessionCoordinator dispatchQueue](self, "dispatchQueue"));
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_1000080FC;
    v28[3] = &unk_10001C630;
    v28[4] = self;
    v29 = v15;
    v30 = v16;
    dispatch_async(v27, v28);

  }
}

- (void)_endSession:(id)a3 options:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  unsigned __int8 v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  NSObject *v20;
  id *v21;
  _QWORD *v22;
  void *v23;
  _QWORD v24[4];
  id v25;
  _QWORD v26[4];
  id v27;
  uint8_t buf[4];
  id v29;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[IUISessionCoordinator currentSession](self, "currentSession"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "uuid"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "uuid"));
  v14 = objc_msgSend(v12, "isEqual:", v13);

  if ((v14 & 1) != 0)
  {
    if ((objc_msgSend(v9, "shouldResign") & 1) != 0)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[IUISessionCoordinator assertionForOptions:](self, "assertionForOptions:", v9));
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[IUISessionCoordinator textInputSource](self, "textInputSource"));
      objc_msgSend(v16, "resignFirstResponder");

      -[IUISessionCoordinator invalidateAssertionIfNeeded:resetKeyboardAlpha:](self, "invalidateAssertionIfNeeded:resetKeyboardAlpha:", v15, 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[IUISessionCoordinator textInputSource](self, "textInputSource"));
      objc_msgSend(v17, "setText:", 0);

    }
    else
    {
      -[IUISessionCoordinator setNeedsToReloadInputSource:](self, "setNeedsToReloadInputSource:", 1);
    }
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[IUISessionCoordinator textInputSource](self, "textInputSource"));
    objc_msgSend(v23, "setCanBecomeFirstResponder:", 0);

    -[IUISessionCoordinator setCurrentSession:](self, "setCurrentSession:", 0);
    +[UIKeyboard setKeyboardAlpha:](UIKeyboard, "setKeyboardAlpha:", 1.0);
    if (v10)
    {
      v20 = objc_claimAutoreleasedReturnValue(-[IUISessionCoordinator dispatchQueue](self, "dispatchQueue"));
      v24[0] = _NSConcreteStackBlock;
      v24[1] = 3221225472;
      v24[2] = sub_1000085F8;
      v24[3] = &unk_10001C6A0;
      v21 = &v25;
      v25 = v10;
      v22 = v24;
      goto LABEL_11;
    }
  }
  else
  {
    v18 = sub_1000039F4();
    v19 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v29 = v8;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "ignoring inputSessionDidEnd for %@ because it's not current session", buf, 0xCu);
    }

    if (v10)
    {
      v20 = objc_claimAutoreleasedReturnValue(-[IUISessionCoordinator dispatchQueue](self, "dispatchQueue"));
      v26[0] = _NSConcreteStackBlock;
      v26[1] = 3221225472;
      v26[2] = sub_1000085EC;
      v26[3] = &unk_10001C6A0;
      v21 = &v27;
      v27 = v10;
      v22 = v26;
LABEL_11:
      dispatch_async(v20, v22);

    }
  }

}

- (void)inputSystemService:(id)a3 inputSessionDidEnd:(id)a4
{
  -[IUISessionCoordinator inputSystemService:inputSessionDidEnd:options:](self, "inputSystemService:inputSessionDidEnd:options:", a3, a4, 0);
}

- (void)inputSystemService:(id)a3 inputSessionDidEnd:(id)a4 options:(id)a5
{
  -[IUISessionCoordinator inputSystemService:inputSessionDidEnd:options:completion:](self, "inputSystemService:inputSessionDidEnd:options:completion:", a3, a4, a5, 0);
}

- (void)inputSystemService:(id)a3 inputSessionDidEnd:(id)a4 options:(id)a5 completion:(id)a6
{
  char *v10;
  char *v11;
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  NSObject *v16;
  char *v17;
  char *v18;
  id v19;
  IUISessionChange *v20;
  void *v21;
  char *v22;
  id v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void (**v27)(_QWORD);
  NSObject *v28;
  id v29;
  _QWORD *v30;
  IUISessionChangeContext *v31;
  NSObject *v32;
  IUISessionChangeContext *v33;
  void *v34;
  id v35;
  NSObject *v36;
  id v37;
  char *v38;
  _QWORD v39[4];
  char *v40;
  char *v41;
  IUISessionCoordinator *v42;
  id v43;
  id v44;
  _QWORD v45[5];
  IUISessionChangeContext *v46;
  _QWORD v47[4];
  id v48;
  _QWORD block[5];
  char *v50;
  char *v51;
  id v52;
  uint8_t buf[4];
  const char *v54;
  __int16 v55;
  char *v56;

  v10 = (char *)a3;
  v11 = (char *)a4;
  v12 = a5;
  v13 = a6;
  v14 = sub_1000039F4();
  v15 = objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v54 = v11;
    v55 = 2112;
    v56 = v10;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "did end session %@, service: %@", buf, 0x16u);
  }

  v16 = objc_claimAutoreleasedReturnValue(-[IUISessionCoordinator dispatchQueue](self, "dispatchQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100008AA8;
  block[3] = &unk_10001C658;
  block[4] = self;
  v17 = v10;
  v50 = v17;
  v18 = v11;
  v51 = v18;
  v19 = v12;
  v52 = v19;
  dispatch_async(v16, block);

  if (qword_1000293B0 != -1)
    dispatch_once(&qword_1000293B0, &stru_10001C710);
  if (byte_1000293A8)
  {
    v20 = [IUISessionChange alloc];
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "uuid"));
    v22 = -[IUISessionChange initEndSessionWithID:options:](v20, "initEndSessionWithID:options:", v21, v19);

    v23 = sub_1000041D4();
    v24 = objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v54 = "-[IUISessionCoordinator inputSystemService:inputSessionDidEnd:options:completion:]";
      v55 = 2112;
      v56 = v22;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "%s  queuing input session did end: %@", buf, 0x16u);
    }

    v25 = (void *)objc_claimAutoreleasedReturnValue(+[InputUIApp sharedApplication](InputUIApp, "sharedApplication"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "servicePausedLock"));
    objc_msgSend(v26, "lock");

    v37 = v19;
    if (objc_msgSend(v25, "isServicePaused"))
    {
      v27 = (void (**)(_QWORD))objc_retainBlock(v13);

      v13 = 0;
    }
    else
    {
      v27 = 0;
    }
    v47[0] = _NSConcreteStackBlock;
    v47[1] = 3221225472;
    v47[2] = sub_100008BD0;
    v47[3] = &unk_10001C6C8;
    v29 = v13;
    v48 = v29;
    v30 = objc_retainBlock(v47);
    v38 = v17;
    v31 = -[IUISessionChangeContext initWithService:session:sessionChange:completion:]([IUISessionChangeContext alloc], "initWithService:session:sessionChange:completion:", v17, v18, v22, v30);
    v32 = objc_claimAutoreleasedReturnValue(-[IUISessionCoordinator dispatchQueue](self, "dispatchQueue"));
    v45[0] = _NSConcreteStackBlock;
    v45[1] = 3221225472;
    v45[2] = sub_100008BE4;
    v45[3] = &unk_10001C5A0;
    v45[4] = self;
    v46 = v31;
    v33 = v31;
    dispatch_async(v32, v45);

    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "servicePausedLock"));
    objc_msgSend(v34, "unlock");

    if (v27)
    {
      v35 = sub_1000041D4();
      v36 = objc_claimAutoreleasedReturnValue(v35);
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v54 = "-[IUISessionCoordinator inputSystemService:inputSessionDidEnd:options:completion:]";
        _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "%s  InputUI service is paused: calling end input session completion immediately", buf, 0xCu);
      }

      v27[2](v27);
    }

    v19 = v37;
    v17 = v38;
  }
  else
  {
    v28 = objc_claimAutoreleasedReturnValue(-[IUISessionCoordinator dispatchQueue](self, "dispatchQueue"));
    v39[0] = _NSConcreteStackBlock;
    v39[1] = 3221225472;
    v39[2] = sub_100008BF0;
    v39[3] = &unk_10001C6F0;
    v40 = v18;
    v41 = v17;
    v42 = self;
    v43 = v19;
    v29 = v13;
    v44 = v29;
    dispatch_async(v28, v39);

    v22 = v40;
  }

}

- (void)inputSystemService:(id)a3 inputSessionDidDie:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD block[5];
  id v14;
  id v15;
  uint8_t buf[4];
  id v17;
  __int16 v18;
  id v19;

  v6 = a3;
  v7 = a4;
  v8 = sub_1000039F4();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v17 = v7;
    v18 = 2112;
    v19 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "session %@ did die, service: %@", buf, 0x16u);
  }

  v10 = objc_claimAutoreleasedReturnValue(-[IUISessionCoordinator dispatchQueue](self, "dispatchQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100008E3C;
  block[3] = &unk_10001C630;
  block[4] = self;
  v14 = v6;
  v15 = v7;
  v11 = v7;
  v12 = v6;
  dispatch_async(v10, block);

}

- (void)inputSystemService:(id)a3 inputSessionDocumentDidChange:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD block[4];
  id v14;
  id v15;
  IUISessionCoordinator *v16;
  uint8_t buf[4];
  id v18;
  __int16 v19;
  id v20;

  v6 = a3;
  v7 = a4;
  v8 = sub_1000039F4();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v18 = v7;
    v19 = 2112;
    v20 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "did change document for session %@, service: %@", buf, 0x16u);
  }

  v10 = objc_claimAutoreleasedReturnValue(-[IUISessionCoordinator dispatchQueue](self, "dispatchQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100009084;
  block[3] = &unk_10001C630;
  v14 = v7;
  v15 = v6;
  v16 = self;
  v11 = v6;
  v12 = v7;
  dispatch_async(v10, block);

}

- (void)inputSystemService:(id)a3 inputSession:(id)a4 documentTraitsDidChange:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  IUISessionCoordinator *v20;
  id v21;
  uint8_t buf[4];
  id v23;
  __int16 v24;
  id v25;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = sub_1000039F4();
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v23 = v9;
    v24 = 2112;
    v25 = v8;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "did change document traits for session %@, service: %@", buf, 0x16u);
  }

  v13 = objc_claimAutoreleasedReturnValue(-[IUISessionCoordinator dispatchQueue](self, "dispatchQueue"));
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1000093CC;
  v17[3] = &unk_10001C658;
  v18 = v9;
  v19 = v8;
  v20 = self;
  v21 = v10;
  v14 = v10;
  v15 = v8;
  v16 = v9;
  dispatch_async(v13, v17);

}

- (void)inputSystemService:(id)a3 inputSession:(id)a4 documentStateDidChange:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  IUISessionCoordinator *v20;
  id v21;
  uint8_t buf[4];
  id v23;
  __int16 v24;
  id v25;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = sub_1000039F4();
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v23 = v9;
    v24 = 2112;
    v25 = v8;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "did change document state for session %@, service: %@", buf, 0x16u);
  }

  v13 = objc_claimAutoreleasedReturnValue(-[IUISessionCoordinator dispatchQueue](self, "dispatchQueue"));
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10000971C;
  v17[3] = &unk_10001C658;
  v18 = v9;
  v19 = v8;
  v20 = self;
  v21 = v10;
  v14 = v10;
  v15 = v8;
  v16 = v9;
  dispatch_async(v13, v17);

}

- (void)inputSystemService:(id)a3 inputSession:(id)a4 textSuggestionsChanged:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;
  id v20;
  uint8_t buf[4];
  id v22;
  __int16 v23;
  id v24;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = sub_1000039F4();
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v22 = v9;
    v23 = 2112;
    v24 = v8;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "did change text suggestions for session %@, service: %@", buf, 0x16u);
  }

  v13 = objc_claimAutoreleasedReturnValue(-[IUISessionCoordinator dispatchQueue](self, "dispatchQueue"));
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100009A6C;
  v17[3] = &unk_10001C658;
  v17[4] = self;
  v18 = v8;
  v19 = v9;
  v20 = v10;
  v14 = v10;
  v15 = v9;
  v16 = v8;
  dispatch_async(v13, v17);

}

- (void)inputSystemService:(id)a3 inputSession:(id)a4 performInputOperation:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  IUISessionCoordinator *v20;
  id v21;
  uint8_t buf[4];
  id v23;
  __int16 v24;
  id v25;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = sub_1000039F4();
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v23 = v9;
    v24 = 2112;
    v25 = v8;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "did receive input operation from session %@, service: %@", buf, 0x16u);
  }

  v13 = objc_claimAutoreleasedReturnValue(-[IUISessionCoordinator dispatchQueue](self, "dispatchQueue"));
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100009E94;
  v17[3] = &unk_10001C658;
  v18 = v9;
  v19 = v8;
  v20 = self;
  v21 = v10;
  v14 = v10;
  v15 = v8;
  v16 = v9;
  dispatch_async(v13, v17);

}

- (void)inputSystemService:(id)a3 inputSession:(id)a4 performInputOperation:(id)a5 withResponse:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  NSObject *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  _QWORD block[5];
  id v22;
  id v23;
  id v24;
  id v25;
  uint8_t buf[4];
  id v27;
  __int16 v28;
  id v29;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = sub_1000039F4();
  v15 = objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v27 = v11;
    v28 = 2112;
    v29 = v10;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "did receive input from session %@, service: %@", buf, 0x16u);
  }

  v16 = objc_claimAutoreleasedReturnValue(-[IUISessionCoordinator dispatchQueue](self, "dispatchQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000A324;
  block[3] = &unk_10001C6F0;
  block[4] = self;
  v22 = v10;
  v23 = v11;
  v24 = v12;
  v25 = v13;
  v17 = v13;
  v18 = v12;
  v19 = v11;
  v20 = v10;
  dispatch_async(v16, block);

}

- (void)inputSystemService:(id)a3 inputSessionDidPause:(id)a4 withReason:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;
  id v20;
  uint8_t buf[4];
  id v22;
  __int16 v23;
  id v24;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = sub_1000039F4();
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v22 = v9;
    v23 = 2112;
    v24 = v8;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "did pause session %@, service: %@", buf, 0x16u);
  }

  v13 = objc_claimAutoreleasedReturnValue(-[IUISessionCoordinator dispatchQueue](self, "dispatchQueue"));
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10000A7AC;
  v17[3] = &unk_10001C658;
  v17[4] = self;
  v18 = v8;
  v19 = v9;
  v20 = v10;
  v14 = v10;
  v15 = v9;
  v16 = v8;
  dispatch_async(v13, v17);

}

- (void)inputSystemService:(id)a3 inputSessionDidUnpause:(id)a4 withReason:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;
  id v20;
  uint8_t buf[4];
  id v22;
  __int16 v23;
  id v24;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = sub_1000039F4();
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v22 = v9;
    v23 = 2112;
    v24 = v8;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "did unpause session %@, service: %@", buf, 0x16u);
  }

  v13 = objc_claimAutoreleasedReturnValue(-[IUISessionCoordinator dispatchQueue](self, "dispatchQueue"));
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10000AA40;
  v17[3] = &unk_10001C658;
  v17[4] = self;
  v18 = v8;
  v19 = v9;
  v20 = v10;
  v14 = v10;
  v15 = v9;
  v16 = v8;
  dispatch_async(v13, v17);

}

- (void)inputSystemService:(id)a3 inputSession:(id)a4 didAddRTISupplementalLexicon:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;
  id v20;
  uint8_t buf[4];
  id v22;
  __int16 v23;
  id v24;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = sub_1000039F4();
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v22 = v9;
    v23 = 2112;
    v24 = v8;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "did add RTI supplemental lexicon for session %@, service: %@", buf, 0x16u);
  }

  v13 = objc_claimAutoreleasedReturnValue(-[IUISessionCoordinator dispatchQueue](self, "dispatchQueue"));
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10000ACD4;
  v17[3] = &unk_10001C658;
  v17[4] = self;
  v18 = v8;
  v19 = v9;
  v20 = v10;
  v14 = v10;
  v15 = v9;
  v16 = v8;
  dispatch_async(v13, v17);

}

- (void)inputSystemService:(id)a3 inputSession:(id)a4 didRemoveRTISupplementalLexicon:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;
  id v20;
  uint8_t buf[4];
  id v22;
  __int16 v23;
  id v24;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = sub_1000039F4();
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v22 = v9;
    v23 = 2112;
    v24 = v8;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "did remove RTI supplemental lexicon for session %@, service: %@", buf, 0x16u);
  }

  v13 = objc_claimAutoreleasedReturnValue(-[IUISessionCoordinator dispatchQueue](self, "dispatchQueue"));
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10000B0CC;
  v17[3] = &unk_10001C658;
  v17[4] = self;
  v18 = v8;
  v19 = v9;
  v20 = v10;
  v14 = v10;
  v15 = v9;
  v16 = v8;
  dispatch_async(v13, v17);

}

- (IUIRTIInputSource)textInputSource
{
  return self->_textInputSource;
}

- (void)setTextInputSource:(id)a3
{
  objc_storeStrong((id *)&self->_textInputSource, a3);
}

- (RTIInputSystemServiceSession)currentSession
{
  return self->_currentSession;
}

- (IUIInputSourceViewController)inputSourceViewController
{
  return self->_inputSourceViewController;
}

- (void)setInputSourceViewController:(id)a3
{
  objc_storeStrong((id *)&self->_inputSourceViewController, a3);
}

- (BOOL)needsToReloadInputSource
{
  return self->_needsToReloadInputSource;
}

- (void)setNeedsToReloadInputSource:(BOOL)a3
{
  self->_needsToReloadInputSource = a3;
}

- (void)setAutofillUIServiceDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_autofillUIServiceDelegate, a3);
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (NSMutableDictionary)pendingSuggestions
{
  return self->_pendingSuggestions;
}

- (void)setPendingSuggestions:(id)a3
{
  objc_storeStrong((id *)&self->_pendingSuggestions, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingSuggestions, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_autofillUIServiceDelegate, 0);
  objc_storeStrong((id *)&self->_inputSourceViewController, 0);
  objc_storeStrong((id *)&self->_currentSession, 0);
  objc_storeStrong((id *)&self->_textInputSource, 0);
  objc_storeStrong((id *)&self->_sessionChangeQueue, 0);
}

@end
