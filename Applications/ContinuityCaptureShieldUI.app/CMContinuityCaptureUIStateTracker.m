@implementation CMContinuityCaptureUIStateTracker

+ (id)sharedInstance
{
  if (qword_100020078 != -1)
    dispatch_once(&qword_100020078, &stru_1000187A0);
  return (id)qword_100020080;
}

- (CMContinuityCaptureUIStateTracker)init
{
  CMContinuityCaptureUIStateTracker *v2;
  CMContinuityCaptureUIStateTracker *v3;
  CMContinuityCaptureUIConfiguration *v4;
  CMContinuityCaptureUIConfiguration *activeConfiguration;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)CMContinuityCaptureUIStateTracker;
  v2 = -[CMContinuityCaptureUIStateTracker init](&v15, "init");
  v3 = v2;
  if (v2)
  {
    v2->_uiState = 0;
    v4 = (CMContinuityCaptureUIConfiguration *)objc_alloc_init((Class)CMContinuityCaptureUIConfiguration);
    activeConfiguration = v3->_activeConfiguration;
    v3->_activeConfiguration = v4;

    v3->_active = 1;
    objc_storeStrong((id *)&v3->_queue, &_dispatch_main_q);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "neighborhoodActivityConduit"));
    objc_msgSend(v7, "addDelegate:queue:", v3, v3->_queue);

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "conversationManager"));
    objc_msgSend(v9, "addDelegate:queue:", v3, v3->_queue);

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "neighborhoodActivityConduit"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "activeSplitSessionTV"));
    v3->_inFaceTime = v12 != 0;

    -[CMContinuityCaptureUIStateTracker _aquireAppSuspendAssertion](v3, "_aquireAppSuspendAssertion");
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[CMContinuityCaptureXPCClientCCD sharedInstance](CMContinuityCaptureXPCClientCCD, "sharedInstance"));
    objc_msgSend(v13, "connectToContinuityCaptureServerWithDelegate:", v3);

  }
  return v3;
}

- (void)_aquireAppSuspendAssertion
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  RBSAssertion *v8;
  RBSAssertion *appSuspendAssertion;
  RBSAssertion *v10;
  unsigned int v11;
  id v12;
  id v13;
  NSObject *v14;
  _BOOL4 v15;
  const char *v16;
  NSObject *v17;
  uint32_t v18;
  id v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  CMContinuityCaptureUIStateTracker *v23;
  __int16 v24;
  id v25;
  void *v26;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[RBSDomainAttribute attributeWithDomain:name:](RBSDomainAttribute, "attributeWithDomain:name:", CFSTR("com.apple.ContinuityCaptureShieldUI"), CFSTR("DoCapture")));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[RBSProcessIdentifier identifierForCurrentProcess](RBSProcessIdentifier, "identifierForCurrentProcess"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[RBSTarget targetWithPid:](RBSTarget, "targetWithPid:", objc_msgSend(v4, "pid")));
  v6 = objc_alloc((Class)RBSAssertion);
  v26 = v3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v26, 1));
  v8 = (RBSAssertion *)objc_msgSend(v6, "initWithExplanation:target:attributes:", CFSTR("Shield Terminate XPC"), v5, v7);
  appSuspendAssertion = self->_appSuspendAssertion;
  self->_appSuspendAssertion = v8;

  v10 = self->_appSuspendAssertion;
  v19 = 0;
  v11 = -[RBSAssertion acquireWithError:](v10, "acquireWithError:", &v19);
  v12 = v19;
  v13 = sub_100007074();
  v14 = objc_claimAutoreleasedReturnValue(v13);
  v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
  if (v11)
  {
    if (v15)
    {
      *(_DWORD *)buf = 136315394;
      v21 = "-[CMContinuityCaptureUIStateTracker _aquireAppSuspendAssertion]";
      v22 = 2112;
      v23 = self;
      v16 = "%s: %@ Successfully acquired app suspend assertion";
      v17 = v14;
      v18 = 22;
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, v16, buf, v18);
    }
  }
  else if (v15)
  {
    *(_DWORD *)buf = 136315650;
    v21 = "-[CMContinuityCaptureUIStateTracker _aquireAppSuspendAssertion]";
    v22 = 2112;
    v23 = self;
    v24 = 2112;
    v25 = v12;
    v16 = "%s: %@ Failed to acquire app suspend assertion with error %@";
    v17 = v14;
    v18 = 32;
    goto LABEL_6;
  }

}

- (void)_releaseAppSuspendAssertion
{
  RBSAssertion *appSuspendAssertion;
  RBSAssertion *v4;

  appSuspendAssertion = self->_appSuspendAssertion;
  if (appSuspendAssertion)
  {
    -[RBSAssertion invalidate](appSuspendAssertion, "invalidate");
    v4 = self->_appSuspendAssertion;
    self->_appSuspendAssertion = 0;

  }
}

- (int64_t)uiState
{
  CMContinuityCaptureUIStateTracker *v2;
  int64_t uiState;

  v2 = self;
  objc_sync_enter(v2);
  uiState = v2->_uiState;
  objc_sync_exit(v2);

  return uiState;
}

- (void)setUiState:(int64_t)a3
{
  CMContinuityCaptureUIStateTracker *obj;

  obj = self;
  objc_sync_enter(obj);
  obj->_uiState = a3;
  objc_sync_exit(obj);

}

- (int64_t)connectionType
{
  CMContinuityCaptureUIStateTracker *v2;
  int64_t connectionType;

  v2 = self;
  objc_sync_enter(v2);
  connectionType = v2->_connectionType;
  objc_sync_exit(v2);

  return connectionType;
}

- (void)setConnectionType:(int64_t)a3
{
  CMContinuityCaptureUIStateTracker *obj;

  obj = self;
  objc_sync_enter(obj);
  obj->_connectionType = a3;
  objc_sync_exit(obj);

}

- (CMContinuityCaptureUIConfiguration)activeConfiguration
{
  CMContinuityCaptureUIStateTracker *v2;
  CMContinuityCaptureUIConfiguration *v3;
  id v4;
  NSObject *v5;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_activeConfiguration;
  objc_sync_exit(v2);

  if (!v3)
  {
    v4 = sub_100007074();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_10000BFE0();

  }
  return v3;
}

- (BOOL)active
{
  CMContinuityCaptureUIStateTracker *v2;
  BOOL active;

  v2 = self;
  objc_sync_enter(v2);
  active = v2->_active;
  objc_sync_exit(v2);

  return active;
}

- (BOOL)isInFaceTime
{
  CMContinuityCaptureUIStateTracker *v2;
  BOOL inFaceTime;

  v2 = self;
  objc_sync_enter(v2);
  inFaceTime = v2->_inFaceTime;
  objc_sync_exit(v2);

  return inFaceTime;
}

- (BOOL)isDedicatedSession
{
  CMContinuityCaptureUIStateTracker *v2;
  void *v3;
  unsigned __int8 v4;

  v2 = self;
  objc_sync_enter(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CMContinuityCaptureUIStateTracker activeConfiguration](v2, "activeConfiguration"));
  v4 = objc_msgSend(v3, "isDedicated");

  objc_sync_exit(v2);
  return v4;
}

- (void)setUIConfiguration:(id)a3
{
  void *v4;
  unsigned __int8 v5;
  id v6;

  v6 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CMContinuityCaptureUIStateTracker activeConfiguration](self, "activeConfiguration"));
  v5 = objc_msgSend(v4, "isEqual:", v6);

  if ((v5 & 1) == 0)
  {
    if (+[NSThread isMainThread](NSThread, "isMainThread")
      && (_UNKNOWN *)self->_queue == &_dispatch_main_q)
    {
      -[CMContinuityCaptureUIStateTracker _sessionDidUpdateWithConfiguration:](self, "_sessionDidUpdateWithConfiguration:", v6);
    }
    else
    {
      -[CMContinuityCaptureUIStateTracker sessionDidUpdateWithConfiguration:](self, "sessionDidUpdateWithConfiguration:", v6);
    }
  }

}

- (void)_refreshInFaceTime
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
  unsigned int v12;
  int v13;
  CMContinuityCaptureUIStateTracker *obj;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  obj = self;
  objc_sync_enter(obj);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "conversationManager"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "activeConversations"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "bs_firstObjectPassingTest:", &stru_1000187C0));

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "neighborhoodActivityConduit"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "activeSplitSessionTV"));
  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "neighborhoodActivityConduit"));
    v12 = objc_msgSend(v11, "canPullBackConversation:", v6);

  }
  else
  {
    v12 = 0;
  }

  if (objc_msgSend(v6, "avMode"))
    v13 = 1;
  else
    v13 = v12;
  if (obj->_inFaceTime != v13)
  {
    -[CMContinuityCaptureUIStateTracker willChangeValueForKey:](obj, "willChangeValueForKey:", CFSTR("inFaceTime"));
    obj->_inFaceTime = v13;
    -[CMContinuityCaptureUIStateTracker didChangeValueForKey:](obj, "didChangeValueForKey:", CFSTR("inFaceTime"));
  }

  objc_sync_exit(obj);
}

- (void)neighborhoodActivityConduit:(id)a3 splitSessionStarted:(id)a4
{
  -[CMContinuityCaptureUIStateTracker _refreshInFaceTime](self, "_refreshInFaceTime", a3, a4);
}

- (void)neighborhoodActivityConduit:(id)a3 splitSessionEnded:(id)a4
{
  -[CMContinuityCaptureUIStateTracker _refreshInFaceTime](self, "_refreshInFaceTime", a3, a4);
}

- (void)conversationManager:(id)a3 remoteMembersChangedForConversation:(id)a4
{
  -[CMContinuityCaptureUIStateTracker _refreshInFaceTime](self, "_refreshInFaceTime", a3, a4);
}

- (void)conversationManager:(id)a3 activeRemoteParticipantsChangedForConversation:(id)a4
{
  -[CMContinuityCaptureUIStateTracker _refreshInFaceTime](self, "_refreshInFaceTime", a3, a4);
}

- (void)sessionDidUpdateWithConfiguration:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100007A2C;
  block[3] = &unk_1000187E8;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)_sessionDidUpdateWithConfiguration:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  CMContinuityCaptureUIStateTracker *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unsigned __int8 v14;
  void *v15;
  id v16;
  NSObject *v17;
  int v18;
  const char *v19;
  __int16 v20;
  CMContinuityCaptureUIStateTracker *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  id v25;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[CMContinuityCaptureUIStateTracker sharedInstance](CMContinuityCaptureUIStateTracker, "sharedInstance"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "activeConfiguration"));

  v7 = sub_100007074();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v18 = 136315906;
    v19 = "-[CMContinuityCaptureUIStateTracker _sessionDidUpdateWithConfiguration:]";
    v20 = 2112;
    v21 = self;
    v22 = 2114;
    v23 = v6;
    v24 = 2114;
    v25 = v4;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s: %@ activeConfiguration change (%{public}@ -> %{public}@)", (uint8_t *)&v18, 0x2Au);
  }

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (v4)
  {
    -[CMContinuityCaptureUIStateTracker willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("activeConfiguration"));
    v9 = self;
    objc_sync_enter(v9);
    if (objc_msgSend(v4, "clientDeviceModel"))
      objc_msgSend(v6, "setClientDeviceModel:", objc_msgSend(v4, "clientDeviceModel"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "clientName"));
    objc_msgSend(v6, "setClientName:", v10);

    objc_msgSend(v6, "setCompositeState:", objc_msgSend(v4, "compositeState"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "applicationIdentifier"));
    objc_msgSend(v6, "setApplicationIdentifier:", v11);

    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "placementStepSkipped"));
    LODWORD(v11) = v12 == 0;

    if ((_DWORD)v11)
      objc_msgSend(v6, "setPlacementStepSkipped:", &__kCFBooleanFalse);
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "placementStepSkipped"));
    v14 = objc_msgSend(v13, "BOOLValue");

    if ((v14 & 1) == 0)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "placementStepSkipped"));
      objc_msgSend(v6, "setPlacementStepSkipped:", v15);

    }
    objc_msgSend(v6, "setIsDedicated:", objc_msgSend(v4, "isDedicated"));
    objc_sync_exit(v9);

    -[CMContinuityCaptureUIStateTracker didChangeValueForKey:](v9, "didChangeValueForKey:", CFSTR("activeConfiguration"));
  }
  else
  {
    v16 = sub_100007074();
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      sub_10000C050();

  }
}

- (void)tearDownShield
{
  id v3;
  NSObject *v4;
  NSObject *queue;
  _QWORD block[4];
  id v7;
  uint8_t buf[4];
  const char *v9;
  __int16 v10;
  CMContinuityCaptureUIStateTracker *v11;

  v3 = sub_100007074();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v9 = "-[CMContinuityCaptureUIStateTracker tearDownShield]";
    v10 = 2112;
    v11 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s: %@ teardown shieldUI", buf, 0x16u);
  }

  objc_initWeak((id *)buf, self);
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100007E14;
  block[3] = &unk_100018678;
  objc_copyWeak(&v7, (id *)buf);
  dispatch_async(queue, block);
  objc_destroyWeak(&v7);
  objc_destroyWeak((id *)buf);
}

- (void)_tearDownShield
{
  CMContinuityCaptureUIStateTracker *v3;
  _BOOL4 active;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[CMContinuityCaptureUIStateTracker _releaseAppSuspendAssertion](self, "_releaseAppSuspendAssertion");
  -[CMContinuityCaptureUIStateTracker willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("active"));
  v3 = self;
  objc_sync_enter(v3);
  active = v3->_active;
  v3->_active = 0;
  objc_sync_exit(v3);

  -[CMContinuityCaptureUIStateTracker didChangeValueForKey:](v3, "didChangeValueForKey:", CFSTR("active"));
  if (active)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "neighborhoodActivityConduit"));
    objc_msgSend(v6, "removeDelegate:", v3);

    v8 = (id)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "conversationManager"));
    objc_msgSend(v7, "removeDelegate:", v3);

  }
}

- (void)serverXPCConnectionInterrupted
{
  void *v3;
  void *v4;
  id v5;
  id v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[CMContinuityCaptureUIStateTracker sharedInstance](CMContinuityCaptureUIStateTracker, "sharedInstance"));
  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "activeConfiguration"));

  v4 = v6;
  if (v6)
  {
    v5 = objc_msgSend(v6, "copy");
    objc_msgSend(v5, "setCompositeState:", 16);
    -[CMContinuityCaptureUIStateTracker sessionDidUpdateWithConfiguration:](self, "sessionDidUpdateWithConfiguration:", v5);

    v4 = v6;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appSuspendAssertion, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_activeConfiguration, 0);
}

@end
