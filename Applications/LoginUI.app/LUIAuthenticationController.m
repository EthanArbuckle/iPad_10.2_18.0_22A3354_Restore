@implementation LUIAuthenticationController

+ (LUIAuthenticationController)sharedController
{
  if (qword_100088DB8 != -1)
    dispatch_once(&qword_100088DB8, &stru_100069720);
  return (LUIAuthenticationController *)(id)qword_100088DB0;
}

- (LUIAuthenticationController)init
{
  LUIAuthenticationController *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *queue;
  NSMutableDictionary *v5;
  NSMutableDictionary *authModeCache;
  LUISyncBubbleController *v7;
  LUISyncBubbleController *syncBubbleController;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)LUIAuthenticationController;
  v2 = -[LUIAuthenticationController init](&v10, "init");
  if (v2)
  {
    v3 = dispatch_queue_create("LUIAuthenticationController Queue", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    v5 = objc_opt_new(NSMutableDictionary);
    authModeCache = v2->_authModeCache;
    v2->_authModeCache = v5;

    v2->_timeoutInterval = 30.0;
    v7 = objc_opt_new(LUISyncBubbleController);
    syncBubbleController = v2->_syncBubbleController;
    v2->_syncBubbleController = v7;

  }
  return v2;
}

- (void)startLoginFlowForUser:(id)a3
{
  id v4;
  unsigned int v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;

  v4 = a3;
  v5 = -[LUIAuthenticationController isLoginOngoing](self, "isLoginOngoing");
  v6 = qword_100088F30;
  if (v5)
  {
    if (os_log_type_enabled((os_log_t)qword_100088F30, OS_LOG_TYPE_ERROR))
      sub_10003BD98(v6, v7, v8, v9, v10, v11, v12, v13);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)qword_100088F30, OS_LOG_TYPE_DEFAULT))
    {
      v14 = v6;
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "username"));
      v18 = 138477827;
      v19 = v15;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Starting login flow for user: %{private}@", (uint8_t *)&v18, 0xCu);

    }
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[LUIAuthenticationController _createInitialEnvironment](self, "_createInitialEnvironment"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[LUIAuthenticationController _createInitialConfigurationForUser:](self, "_createInitialConfigurationForUser:", v4));
    -[LUIAuthenticationController _kickOffLoginFlowStep:configuration:environment:](self, "_kickOffLoginFlowStep:configuration:environment:", 0, v17, v16);

  }
}

- (void)startLoginFlowForAnonymousTemporaryUserWithResultResponder:(id)a3
{
  id v4;
  unsigned int v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint8_t v16[16];

  v4 = a3;
  v5 = -[LUIAuthenticationController isLoginOngoing](self, "isLoginOngoing");
  v6 = qword_100088F30;
  if (v5)
  {
    if (os_log_type_enabled((os_log_t)qword_100088F30, OS_LOG_TYPE_ERROR))
      sub_10003BE08(v6, v7, v8, v9, v10, v11, v12, v13);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)qword_100088F30, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v16 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Starting login flow for anonymous temporary user", v16, 2u);
    }
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[LUIAuthenticationController _createInitialEnvironment](self, "_createInitialEnvironment"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[LUIAuthenticationController _createInitialConfigurationForAnonymousUserWithResultResponder:](self, "_createInitialConfigurationForAnonymousUserWithResultResponder:", v4));
    -[LUIAuthenticationController _kickOffLoginFlowStep:configuration:environment:](self, "_kickOffLoginFlowStep:configuration:environment:", 6, v15, v14);

  }
}

- (void)authenticateWithUser:(id)a3 password:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, void *);
  unsigned int v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, void *))a5;
  v11 = -[LUIAuthenticationController isLoginOngoing](self, "isLoginOngoing");
  v12 = qword_100088F30;
  if (!v11)
  {
    if (os_log_type_enabled((os_log_t)qword_100088F30, OS_LOG_TYPE_DEFAULT))
    {
      v21 = v12;
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "username"));
      v24 = 138477827;
      v25 = v22;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "authenticateWithUser: %{private}@", (uint8_t *)&v24, 0xCu);

    }
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[LUIAuthenticationController _createInitialConfigurationForUser:](self, "_createInitialConfigurationForUser:", v8));
    objc_msgSend(v20, "setPasscode:", v9);
    objc_msgSend(v20, "setAuthMode:", 1);
    objc_msgSend(v20, "setCompletionHandler:", v10);
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[LUIAuthenticationController _createInitialEnvironment](self, "_createInitialEnvironment"));
    -[LUIAuthenticationController _kickOffLoginFlowStep:configuration:environment:](self, "_kickOffLoginFlowStep:configuration:environment:", 3, v20, v23);

    goto LABEL_8;
  }
  if (os_log_type_enabled((os_log_t)qword_100088F30, OS_LOG_TYPE_ERROR))
  {
    sub_10003BE78(v12, v13, v14, v15, v16, v17, v18, v19);
    if (!v10)
      goto LABEL_9;
    goto LABEL_4;
  }
  if (v10)
  {
LABEL_4:
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[LKError errorWithCode:](LKError, "errorWithCode:", 31));
    v10[2](v10, v20);
LABEL_8:

  }
LABEL_9:

}

- (void)createAndLoginLocalUserWithUsername:(id)a3 password:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, void *);
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, void *))a5;
  if (!-[LUIAuthenticationController isLoginOngoing](self, "isLoginOngoing"))
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[LUIAuthenticationController _fakeAltDSIDForUsername:](self, "_fakeAltDSIDForUsername:", v8));
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[LUIAuthenticationController _createInitialEnvironment](self, "_createInitialEnvironment"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[LUIAuthenticationController _createInitialConfigurationForLocalUserWithUsername:altDSID:password:givenName:isTemporarySession:](self, "_createInitialConfigurationForLocalUserWithUsername:altDSID:password:givenName:isTemporarySession:", v8, v20, v9, v8, 0));
    objc_msgSend(v22, "setCompletionHandler:", v10);
    -[LUIAuthenticationController _kickOffLoginFlowStep:configuration:environment:](self, "_kickOffLoginFlowStep:configuration:environment:", 6, v22, v21);

    goto LABEL_6;
  }
  v11 = qword_100088F30;
  if (os_log_type_enabled((os_log_t)qword_100088F30, OS_LOG_TYPE_ERROR))
  {
    sub_10003BEE8(v11, v12, v13, v14, v15, v16, v17, v18);
    if (!v10)
      goto LABEL_6;
    goto LABEL_4;
  }
  if (v10)
  {
LABEL_4:
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[LKError errorWithCode:](LKError, "errorWithCode:", 31));
    v10[2](v10, v19);

  }
LABEL_6:

}

- (void)_kickOffLoginFlowStep:(unint64_t)a3 configuration:(id)a4 environment:(id)a5
{
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  unsigned int v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  _QWORD *v28;
  void *v29;
  _QWORD v30[5];
  id v31;
  id v32;
  _QWORD v33[4];
  id v34;
  id v35;
  id v36;
  _QWORD v37[4];
  id v38;
  LUIAuthenticationController *v39;
  id v40;
  _QWORD v41[4];
  _QWORD *v42;
  _QWORD v43[5];
  id v44;
  id v45;
  _QWORD v46[5];
  id v47;
  id v48;
  _QWORD v49[5];
  id v50;
  id v51;
  _QWORD v52[5];
  id v53;
  id v54;
  uint8_t buf[4];
  void *v56;

  v8 = a4;
  v9 = a5;
  v10 = (void *)qword_100088F30;
  if (os_log_type_enabled((os_log_t)qword_100088F30, OS_LOG_TYPE_DEFAULT))
  {
    v11 = v10;
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[LUIAuthenticationController _nameOfStep:](self, "_nameOfStep:", a3));
    *(_DWORD *)buf = 138543362;
    v56 = v12;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Step started: %{public}@", buf, 0xCu);

  }
  switch(a3)
  {
    case 0uLL:
      -[LUIAuthenticationController startProgressAnimation](self, "startProgressAnimation");
      -[LUIAuthenticationController _loginFlowStepFinished:result:configuration:environment:](self, "_loginFlowStepFinished:result:configuration:environment:", 0, 0, v8, v9);
      break;
    case 1uLL:
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "user"));
      v52[0] = _NSConcreteStackBlock;
      v52[1] = 3221225472;
      v52[2] = sub_10001C2A0;
      v52[3] = &unk_100069748;
      v52[4] = self;
      v53 = v8;
      v54 = v9;
      -[LUIAuthenticationController _startFetchingAuthModeWithTimeoutForUser:completionHandler:](self, "_startFetchingAuthModeWithTimeoutForUser:completionHandler:", v13, v52);

      break;
    case 2uLL:
      v14 = objc_msgSend(v8, "authMode");
      if (v14 == (id)2)
      {
        -[LUIAuthenticationController _loginFlowStepFinished:result:configuration:environment:](self, "_loginFlowStepFinished:result:configuration:environment:", 2, 0, v8, v9);
      }
      else if (v14 == (id)1)
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "user"));
        -[LUIAuthenticationController _presentPasswordViewControllerAndMoveOnForUser:configuration:environment:](self, "_presentPasswordViewControllerAndMoveOnForUser:configuration:environment:", v15, v8, v9);

      }
      break;
    case 3uLL:
      SBSSetAllApplicationsShowProgress(1, 100);
      -[LUIAuthenticationController setIsLoginOngoing:](self, "setIsLoginOngoing:", 1);
      -[LUIAuthenticationController authBegan](self, "authBegan");
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[LUIAuthenticationController syncBubbleController](self, "syncBubbleController"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "user"));
      objc_msgSend(v16, "scheduleSyncBubbleTerminationForUser:", v17);

      -[LUIAuthenticationController _loginFlowStepFinished:result:configuration:environment:](self, "_loginFlowStepFinished:result:configuration:environment:", 3, 0, v8, v9);
      break;
    case 4uLL:
      if (!-[LUIAuthenticationController _skipRemoteAuthDueToUserDefaultsSetting:environment:](self, "_skipRemoteAuthDueToUserDefaultsSetting:environment:", v8, v9)&& !-[LUIAuthenticationController _skipRemoteAuthDueToBackoff:environment:](self, "_skipRemoteAuthDueToBackoff:environment:", v8, v9))
      {
        v49[0] = _NSConcreteStackBlock;
        v49[1] = 3221225472;
        v49[2] = sub_10001C2B8;
        v49[3] = &unk_100069748;
        v49[4] = self;
        v50 = v8;
        v51 = v9;
        -[LUIAuthenticationController _startRemoteAuthWithConfiguration:environment:completionHandler:](self, "_startRemoteAuthWithConfiguration:environment:completionHandler:", v50, v51, v49);

      }
      break;
    case 5uLL:
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "user"));
      v19 = objc_msgSend(v18, "isAuditor");

      if (v19)
      {
        -[LUIAuthenticationController _loginFlowStepFinished:result:configuration:environment:](self, "_loginFlowStepFinished:result:configuration:environment:", 5, 0, v8, v9);
      }
      else
      {
        v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "emcsInfoDict"));
        v46[0] = _NSConcreteStackBlock;
        v46[1] = 3221225472;
        v46[2] = sub_10001C2D0;
        v46[3] = &unk_100069748;
        v46[4] = self;
        v47 = v8;
        v48 = v9;
        -[LUIAuthenticationController _stashRecoveryInfo:completionHandler:](self, "_stashRecoveryInfo:completionHandler:", v29, v46);

      }
      break;
    case 6uLL:
      kdebug_trace(732758028, 0, 0, 0, 0);
      -[LUIAuthenticationController setIsLoginOngoing:](self, "setIsLoginOngoing:", 1);
      +[LKRegression executeDelayByUserDefaultIfSet:](LKRegression, "executeDelayByUserDefaultIfSet:", CFSTR("LUICreateLocalAuthRegression"));
      v20 = qword_100088F30;
      if (os_log_type_enabled((os_log_t)qword_100088F30, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Beginning local auth", buf, 2u);
      }
      -[LUIAuthenticationController _setBypassSetupAssistantIfNeeded:](self, "_setBypassSetupAssistantIfNeeded:", v8);
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[LUIAuthenticationController _checkForCurrentUserPasscodeChange:](self, "_checkForCurrentUserPasscodeChange:", v8));
      -[LUIAuthenticationController _loginFlowStepFinished:result:configuration:environment:](self, "_loginFlowStepFinished:result:configuration:environment:", 6, v21, v8, v9);

      break;
    case 7uLL:
      if (objc_msgSend(v8, "userAlreadyExist"))
      {
        -[LUIAuthenticationController _loginFlowStepFinished:result:configuration:environment:](self, "_loginFlowStepFinished:result:configuration:environment:", 7, 0, v8, v9);
      }
      else
      {
        v43[0] = _NSConcreteStackBlock;
        v43[1] = 3221225472;
        v43[2] = sub_10001C2E8;
        v43[3] = &unk_100068D60;
        v43[4] = self;
        v27 = v8;
        v44 = v27;
        v45 = v9;
        v28 = objc_retainBlock(v43);
        if (objc_msgSend(v27, "needsToEvictCleanUser"))
        {
          v41[0] = _NSConcreteStackBlock;
          v41[1] = 3221225472;
          v41[2] = sub_10001C398;
          v41[3] = &unk_100069770;
          v42 = v28;
          -[LUIAuthenticationController _evictCleanUserOrCacheDeleteWithCompletionHandler:](self, "_evictCleanUserOrCacheDeleteWithCompletionHandler:", v41);

        }
        else
        {
          ((void (*)(_QWORD *))v28[2])(v28);
        }

      }
      break;
    case 8uLL:
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[LUIAuthenticationController syncBubbleController](self, "syncBubbleController"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "user"));
      v37[0] = _NSConcreteStackBlock;
      v37[1] = 3221225472;
      v37[2] = sub_10001C3A4;
      v37[3] = &unk_100068D60;
      v38 = v8;
      v39 = self;
      v40 = v9;
      objc_msgSend(v22, "waitUntilSyncBubbleIsTerminatedForUser:completionHandler:", v23, v37);

      break;
    case 9uLL:
      objc_initWeak((id *)buf, self);
      v33[0] = _NSConcreteStackBlock;
      v33[1] = 3221225472;
      v33[2] = sub_10001C5E8;
      v33[3] = &unk_1000697C0;
      objc_copyWeak(&v36, (id *)buf);
      v34 = v8;
      v35 = v9;
      -[LUIAuthenticationController _deleteUserAndUpdateConfiguration:completionHandler:](self, "_deleteUserAndUpdateConfiguration:completionHandler:", v34, v33);

      objc_destroyWeak(&v36);
      objc_destroyWeak((id *)buf);
      break;
    case 0xAuLL:
      kdebug_trace(732758032, 0, 0, 0, 0);
      -[LUIAuthenticationController _savePreferenceIfNeededWithConfiguration:](self, "_savePreferenceIfNeededWithConfiguration:", v8);
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "navigationController"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "user"));
      v26 = objc_msgSend(v8, "isTemporarySession");
      v30[0] = _NSConcreteStackBlock;
      v30[1] = 3221225472;
      v30[2] = sub_10001C640;
      v30[3] = &unk_100068D60;
      v30[4] = self;
      v31 = v8;
      v32 = v9;
      -[LUIAuthenticationController _presentGettingReadyViewInNavigationController:forUser:isTemporarySession:completionHandler:](self, "_presentGettingReadyViewInNavigationController:forUser:isTemporarySession:completionHandler:", v24, v25, v26, v30);

      break;
    case 0xBuLL:
      -[LUIAuthenticationController stopProgressAnimation](self, "stopProgressAnimation");
      -[LUIAuthenticationController authEnded](self, "authEnded");
      SBSSetAllApplicationsShowProgress(0, 100);
      -[LUIAuthenticationController _loginFlowStepFinished:result:configuration:environment:](self, "_loginFlowStepFinished:result:configuration:environment:", 11, 0, v8, v9);
      break;
    default:
      break;
  }

}

- (void)_loginFlowStepFinished:(unint64_t)a3 result:(id)a4 configuration:(id)a5 environment:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  NSObject *v14;
  void *v15;
  LUIAuthenticationController *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  LUIAuthenticationController *v22;
  uint64_t v23;
  void *v24;
  NSObject *v25;
  unsigned int v26;
  unsigned int v27;
  NSObject *v28;
  LUIAuthenticationController *v29;
  uint64_t v30;
  NSObject *v31;
  void *v32;
  void *v33;
  unsigned int v34;
  NSObject *v35;
  _BOOL4 v36;
  void *v37;
  void *v38;
  unsigned int v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  void (**v45)(_QWORD, _QWORD);
  NSObject *v46;
  unsigned int v47;
  void *v48;
  unsigned int v49;
  NSObject *v50;
  NSObject *v51;
  NSObject *v52;
  void *v53;
  NSObject *v54;
  void *v55;
  NSObject *v56;
  uint64_t v57;
  NSObject *v58;
  uint64_t v59;
  void *v60;
  id v61;
  uint64_t v62;
  void *v63;
  NSObject *v64;
  uint64_t v65;
  NSObject *v66;
  void *v67;
  NSObject *v68;
  void *v69;
  int v70;
  _QWORD v71[2];

  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = (void *)qword_100088F30;
  if (os_log_type_enabled((os_log_t)qword_100088F30, OS_LOG_TYPE_DEFAULT))
  {
    v14 = v13;
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[LUIAuthenticationController _nameOfStep:](self, "_nameOfStep:", a3));
    v70 = 138412290;
    v71[0] = v15;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Step finished: %@", (uint8_t *)&v70, 0xCu);

  }
  switch(a3)
  {
    case 0uLL:
      if ((objc_msgSend(v12, "deviceHasNetwork") & 1) == 0)
        -[LUIAuthenticationController setTimeoutInterval:](self, "setTimeoutInterval:", 30.0);
      v16 = self;
      v17 = 1;
      goto LABEL_68;
    case 1uLL:
      v18 = objc_claimAutoreleasedReturnValue(-[LUIAuthenticationController _updateConfigurationWithFetchAuthModeResult:result:](self, "_updateConfigurationWithFetchAuthModeResult:result:", v11, v10));
      if (!v18)
      {
        v16 = self;
        v17 = 2;
        goto LABEL_68;
      }
      v19 = (void *)v18;
      if (-[LUIAuthenticationController _isNetworkError:](self, "_isNetworkError:", v18))
      {
        if (objc_msgSend(v11, "userAlreadyExist"))
          v20 = 11;
        else
          v20 = 19;
        v21 = objc_claimAutoreleasedReturnValue(+[LKError errorWithCode:](LKError, "errorWithCode:", v20));

        v19 = (void *)v21;
      }
      v22 = self;
      v23 = 1;
      goto LABEL_89;
    case 2uLL:
      -[LUIAuthenticationController _updateConfigurationWithPasscodeEnterResult:result:](self, "_updateConfigurationWithPasscodeEnterResult:result:", v11, v10);
      v16 = self;
      v17 = 3;
      goto LABEL_68;
    case 3uLL:
      if ((objc_msgSend(v11, "doLocalAuthOnly") & 1) == 0
        && !objc_msgSend(v11, "canLoginWithLocalAuthOnly"))
      {
        v16 = self;
        v17 = 4;
        goto LABEL_68;
      }
      v24 = (void *)qword_100088F30;
      if (os_log_type_enabled((os_log_t)qword_100088F30, OS_LOG_TYPE_DEFAULT))
      {
        v25 = v24;
        v26 = objc_msgSend(v11, "doLocalAuthOnly");
        v27 = objc_msgSend(v11, "canLoginWithLocalAuthOnly");
        v70 = 67109376;
        LODWORD(v71[0]) = v26;
        WORD2(v71[0]) = 1024;
        *(_DWORD *)((char *)v71 + 6) = v27;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "doLocalAuthOnly: %d, canLoginWithLocalAuthOnly: %d", (uint8_t *)&v70, 0xEu);

      }
      goto LABEL_22;
    case 4uLL:
      if (!objc_msgSend(v11, "doLocalAuthOnly"))
      {
        v47 = -[LUIAuthenticationController _isRestrictionlessLoginEnabled](self, "_isRestrictionlessLoginEnabled");
        if (+[LKPlatformSupport isInternalBuild](LKPlatformSupport, "isInternalBuild"))
        {
          v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
          v49 = objc_msgSend(v48, "BOOLForKey:", CFSTR("LUIForgeVeryFirstTimeLogin"));

        }
        else
        {
          v49 = 0;
        }
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("userAuthError")));
        if (v19
          && (!v47 || !-[LUIAuthenticationController _isUnmanagedDeviceError:](self, "_isUnmanagedDeviceError:", v19)))
        {
          if (-[LUIAuthenticationController _isNetworkError:](self, "_isNetworkError:", v19))
          {
            v58 = qword_100088F30;
            if (os_log_type_enabled((os_log_t)qword_100088F30, OS_LOG_TYPE_DEFAULT))
            {
              LOWORD(v70) = 0;
              _os_log_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_DEFAULT, "This is a first time login since user doesn't have managed credentials. Server connection failure", (uint8_t *)&v70, 2u);
            }
            v59 = objc_claimAutoreleasedReturnValue(+[LKError errorWithCode:](LKError, "errorWithCode:", 11));

            v19 = (void *)v59;
          }
          v22 = self;
          v23 = 4;
LABEL_89:
          -[LUIAuthenticationController _terminateUserLoginFlowFromStep:error:configuration:environment:](v22, "_terminateUserLoginFlowFromStep:error:configuration:environment:", v23, v19, v11, v12);
          goto LABEL_94;
        }
        v52 = qword_100088F30;
        if (os_log_type_enabled((os_log_t)qword_100088F30, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v70) = 0;
          _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_DEFAULT, "No remote auth error", (uint8_t *)&v70, 2u);
        }
        v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("remoteAuthResponse")));
        v37 = v53;
        if (v19)
        {
          v54 = qword_100088F30;
          if (os_log_type_enabled((os_log_t)qword_100088F30, OS_LOG_TYPE_DEFAULT))
          {
            v70 = 138543362;
            v71[0] = v19;
            _os_log_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_DEFAULT, "Remote auth failed for error: %{public}@. Ignore the error and fake an authentication result", (uint8_t *)&v70, 0xCu);
          }
          v55 = v37;
          v37 = (void *)objc_claimAutoreleasedReturnValue(-[LUIAuthenticationController _fakeRestrictionlessLoginAuthenticationResultsWithConfiguration:](self, "_fakeRestrictionlessLoginAuthenticationResultsWithConfiguration:", v11));
          goto LABEL_79;
        }
        v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "objectForKeyedSubscript:", AKAuthenticationSecurityLevelKey));
        v61 = objc_msgSend(v60, "integerValue");

        if (v61 == (id)5)
        {
          v62 = objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "objectForKeyedSubscript:", AKAuthenticationAlternateDSIDKey));
          if (v62)
          {
            v55 = (void *)v62;
            v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "objectForKeyedSubscript:", AKAuthenticationShortLivedTokenKey));
            if (!v63)
            {
              v68 = qword_100088F30;
              if (os_log_type_enabled((os_log_t)qword_100088F30, OS_LOG_TYPE_DEFAULT))
              {
                LOWORD(v70) = 0;
                _os_log_impl((void *)&_mh_execute_header, v68, OS_LOG_TYPE_DEFAULT, "We did not receive a short lived token", (uint8_t *)&v70, 2u);
              }
              v69 = (void *)objc_claimAutoreleasedReturnValue(+[LKError errorWithCode:](LKError, "errorWithCode:", 12));
              -[LUIAuthenticationController _terminateUserLoginFlowFromStep:error:configuration:environment:](self, "_terminateUserLoginFlowFromStep:error:configuration:environment:", 4, v69, v11, v12);

              goto LABEL_107;
            }

LABEL_79:
            if (v49)
            {
              v56 = qword_100088F30;
              if (os_log_type_enabled((os_log_t)qword_100088F30, OS_LOG_TYPE_DEFAULT))
              {
                LOWORD(v70) = 0;
                _os_log_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_DEFAULT, "Will tamper with the authentication result to forge a very first time login", (uint8_t *)&v70, 2u);
              }
              v57 = objc_claimAutoreleasedReturnValue(-[LUIAuthenticationController _updatedAuthenticationResultsForVeryFirstTimeLogin:](self, "_updatedAuthenticationResultsForVeryFirstTimeLogin:", v37));

              v37 = (void *)v57;
            }
            -[LUIAuthenticationController _analyzeRemoteAuthResult:andUpdateConfiguration:](self, "_analyzeRemoteAuthResult:andUpdateConfiguration:", v37, v11);
            -[LUIAuthenticationController _kickOffLoginFlowStep:configuration:environment:](self, "_kickOffLoginFlowStep:configuration:environment:", 5, v11, v12);
LABEL_107:

LABEL_94:
            goto LABEL_95;
          }
          v66 = qword_100088F30;
          if (os_log_type_enabled((os_log_t)qword_100088F30, OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(v70) = 0;
            _os_log_impl((void *)&_mh_execute_header, v66, OS_LOG_TYPE_DEFAULT, "We did not receive an alternate DSID", (uint8_t *)&v70, 2u);
          }
          v65 = 10;
        }
        else
        {
          v64 = qword_100088F30;
          if (os_log_type_enabled((os_log_t)qword_100088F30, OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(v70) = 0;
            _os_log_impl((void *)&_mh_execute_header, v64, OS_LOG_TYPE_DEFAULT, "Not a managed Apple ID", (uint8_t *)&v70, 2u);
          }
          v65 = 9;
        }
        v67 = (void *)objc_claimAutoreleasedReturnValue(+[LKError errorWithCode:](LKError, "errorWithCode:", v65));
        -[LUIAuthenticationController _terminateUserLoginFlowFromStep:error:configuration:environment:](self, "_terminateUserLoginFlowFromStep:error:configuration:environment:", 4, v67, v11, v12);

        goto LABEL_107;
      }
      v28 = qword_100088F30;
      if (os_log_type_enabled((os_log_t)qword_100088F30, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v70) = 0;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Local auth only set. Move forward to local auth", (uint8_t *)&v70, 2u);
      }
LABEL_22:
      v16 = self;
      v17 = 6;
LABEL_68:
      -[LUIAuthenticationController _kickOffLoginFlowStep:configuration:environment:](v16, "_kickOffLoginFlowStep:configuration:environment:", v17, v11, v12);
LABEL_95:

      return;
    case 5uLL:
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("userAuthError")));
      if (v19 && os_log_type_enabled((os_log_t)qword_100088F30, OS_LOG_TYPE_ERROR))
        sub_10003BF58();
      v29 = self;
      v30 = 6;
      goto LABEL_93;
    case 6uLL:
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("userAuthError")));
      if (v19)
      {
        v22 = self;
        v23 = 6;
        goto LABEL_89;
      }
      if (!objc_msgSend(v11, "userAlreadyExist"))
        goto LABEL_57;
      goto LABEL_59;
    case 7uLL:
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("userAuthError")));
      if (v19)
      {
        if ((objc_msgSend(v11, "needsToEvictCleanUser") & 1) != 0
          || !+[LKLoginSupport hasCleanUser](LKLoginSupport, "hasCleanUser"))
        {
          v22 = self;
          v23 = 7;
          goto LABEL_89;
        }
        v31 = qword_100088F30;
        if (os_log_type_enabled((os_log_t)qword_100088F30, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v70) = 0;
          _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "Failed to create a new user, will try deleting a clean user", (uint8_t *)&v70, 2u);
        }
        objc_msgSend(v11, "setNeedsToEvictCleanUser:", 1);
LABEL_57:
        v29 = self;
        v30 = 7;
      }
      else
      {
        -[LUIAuthenticationController _createTemporaryPreferencesToSetIfNeeded:](self, "_createTemporaryPreferencesToSetIfNeeded:", v11);
LABEL_59:
        v29 = self;
        v30 = 8;
      }
      goto LABEL_93;
    case 8uLL:
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("userAuthError")));
      if (v19)
      {
        if ((objc_msgSend(v11, "hasDoneRemoteAuth") & 1) != 0)
        {
          v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "user"));
          v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "currentUser"));
          v34 = objc_msgSend(v32, "isEqual:", v33);

          v35 = qword_100088F30;
          v36 = os_log_type_enabled((os_log_t)qword_100088F30, OS_LOG_TYPE_DEFAULT);
          if (v34)
          {
            if (v36)
            {
              LOWORD(v70) = 0;
              _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "Load user failed. We are trying to log into current user", (uint8_t *)&v70, 2u);
            }
            v37 = (void *)objc_claimAutoreleasedReturnValue(+[LKError errorWithCode:](LKError, "errorWithCode:", 24));
            -[LUIAuthenticationController _terminateUserLoginFlowFromStep:error:configuration:environment:](self, "_terminateUserLoginFlowFromStep:error:configuration:environment:", 8, v37, v11, v12);
            goto LABEL_107;
          }
          if (v36)
          {
            LOWORD(v70) = 0;
            _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "Load user failed. Will delete user.", (uint8_t *)&v70, 2u);
          }
          v29 = self;
          v30 = 9;
        }
        else
        {
          v51 = qword_100088F30;
          if (os_log_type_enabled((os_log_t)qword_100088F30, OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(v70) = 0;
            _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_DEFAULT, "Load user failed. And we are doing local auth only", (uint8_t *)&v70, 2u);
          }
          v29 = self;
          v30 = 4;
        }
      }
      else
      {
        v29 = self;
        v30 = 10;
      }
LABEL_93:
      -[LUIAuthenticationController _kickOffLoginFlowStep:configuration:environment:](v29, "_kickOffLoginFlowStep:configuration:environment:", v30, v11, v12);
      goto LABEL_94;
    case 9uLL:
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("userAuthError")));
      if (!v19)
        goto LABEL_57;
      v22 = self;
      v23 = 9;
      goto LABEL_89;
    case 0xAuLL:
      v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "currentUser"));
      v39 = objc_msgSend(v38, "isLoginUser");

      if (v39)
        v40 = 732758040;
      else
        v40 = 732758056;
      kdebug_trace(v40, 0, 0, 0, 0);
      v41 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("userAuthError")));
      if (v41)
      {
        v42 = (void *)v41;
        v43 = (void *)objc_claimAutoreleasedReturnValue(+[LKError errorWithCode:](LKError, "errorWithCode:", 13));

        -[LUIAuthenticationController _terminateUserLoginFlowFromStep:error:configuration:environment:](self, "_terminateUserLoginFlowFromStep:error:configuration:environment:", 10, v43, v11, v12);
        goto LABEL_95;
      }
      v50 = qword_100088F30;
      if (os_log_type_enabled((os_log_t)qword_100088F30, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v70) = 0;
        _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_DEFAULT, "Switch completion called with no error.", (uint8_t *)&v70, 2u);
      }
      v16 = self;
      v17 = 11;
      goto LABEL_68;
    case 0xBuLL:
      v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "completionHandler"));

      if (v44)
      {
        v45 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "completionHandler"));
        v45[2](v45, 0);

      }
      v46 = qword_100088F30;
      if (os_log_type_enabled((os_log_t)qword_100088F30, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v70) = 0;
        _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEFAULT, "User log-in flow completed", (uint8_t *)&v70, 2u);
      }
      goto LABEL_95;
    default:
      goto LABEL_95;
  }
}

- (void)_terminateUserLoginFlowFromStep:(unint64_t)a3 error:(id)a4 configuration:(id)a5 environment:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  char v15;
  void *v16;
  void (**v17)(_QWORD, _QWORD);
  _QWORD block[5];
  uint8_t buf[4];
  id v20;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = qword_100088F30;
  if (os_log_type_enabled((os_log_t)qword_100088F30, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v20 = v10;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "User login failed due to error: %{public}@", buf, 0xCu);
  }
  -[LUIAuthenticationController setIsLoginOngoing:](self, "setIsLoginOngoing:", 0);
  -[LUIAuthenticationController stopProgressAnimation](self, "stopProgressAnimation");
  -[LUIAuthenticationController authEnded](self, "authEnded");
  SBSSetAllApplicationsShowProgress(0, 100);
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[LUIAuthenticationController delegate](self, "delegate"));
  v15 = objc_opt_respondsToSelector(v14, "authenticationCanceled");

  if ((v15 & 1) != 0)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10001D3E4;
    block[3] = &unk_100068C58;
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
  if (v10)
    -[LUIAuthenticationController _handleAuthenticationError:configuration:step:](self, "_handleAuthenticationError:configuration:step:", v10, v11, a3);
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "completionHandler"));

  if (v16)
  {
    v17 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "completionHandler"));
    ((void (**)(_QWORD, id))v17)[2](v17, v10);

  }
}

- (void)_handleAuthenticationError:(id)a3 configuration:(id)a4 step:(unint64_t)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  unsigned int v18;
  BOOL v19;
  void *v20;
  unsigned int v21;
  NSObject *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  unsigned __int8 v34;
  uint64_t v35;
  void *v36;
  double v37;
  double v38;
  id v39;
  void *v40;
  void *v41;
  void *v42;
  _QWORD block[4];
  id v44;
  id v45;
  _QWORD v46[4];
  id v47;
  uint8_t buf[16];

  v8 = a3;
  v9 = a4;
  v10 = (void *)qword_100088F38;
  if (os_log_type_enabled((os_log_t)qword_100088F38, OS_LOG_TYPE_DEBUG))
    sub_10003BFF8(v10, v9, (uint64_t)v8);
  v11 = objc_msgSend(v8, "code");
  if (a5 < 2)
    goto LABEL_4;
  v15 = v11;
  if (a5 == 4)
  {
    if (objc_msgSend(v9, "authMode") == (id)2)
    {
LABEL_4:
      if (-[LUIAuthenticationController _isNetworkError:](self, "_isNetworkError:", v8))
      {
        v12 = qword_100088F30;
        if (os_log_type_enabled((os_log_t)qword_100088F30, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Server request failed", buf, 2u);
        }
        v13 = (void *)objc_claimAutoreleasedReturnValue(+[LKError errorWithCode:](LKError, "errorWithCode:", 23));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "navigationController"));
        -[LUIAuthenticationController _presentAlertControllerForError:inNavigationController:](self, "_presentAlertControllerForError:inNavigationController:", v13, v14);

      }
      else
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "navigationController"));
        -[LUIAuthenticationController _presentAlertControllerForError:inNavigationController:](self, "_presentAlertControllerForError:inNavigationController:", v8, v13);
      }
      goto LABEL_36;
    }
  }
  else if (a5 - 6 <= 3)
  {
    kdebug_trace(732758032, 0, 0, 0, 0);
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "domain"));
  v17 = LKErrorDomain;
  v18 = objc_msgSend(v16, "isEqualToString:", LKErrorDomain);

  if (v18)
    v19 = v15 == (id)13;
  else
    v19 = 0;
  if (v19)
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "localizedStringForKey:value:table:", CFSTR("SWITCH_FAILURE"), &stru_100069EB8, 0));

    v25 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", 0, v13, 1));
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_100069EB8, 0));
    v46[0] = _NSConcreteStackBlock;
    v46[1] = 3221225472;
    v46[2] = sub_10001D9B4;
    v46[3] = &unk_100068C08;
    v28 = v9;
    v47 = v28;
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v27, 0, v46));

    objc_msgSend(v25, "addAction:", v29);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10001D9F0;
    block[3] = &unk_100068C30;
    v44 = v28;
    v45 = v25;
    v23 = v25;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

  }
  else
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "domain"));
    v21 = objc_msgSend(v20, "isEqualToString:", v17);

    if (v21 && v15 == (id)24)
    {
      v22 = qword_100088F30;
      if (os_log_type_enabled((os_log_t)qword_100088F30, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Logging in current user again with the password reset. Will switch to LoginUser with an error message", buf, 2u);
      }
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[LKError errorWithCode:](LKError, "errorWithCode:", 24));
      v23 = (id)objc_claimAutoreleasedReturnValue(+[UMUserManager sharedManager](UMUserManager, "sharedManager"));
      objc_msgSend(v23, "switchToLoginUserWithError:completionHandler:", v13, &stru_1000697E0);
    }
    else
    {
      if (-[LUIAuthenticationController _isAuthErrorWithServerErrorCode:error:](self, "_isAuthErrorWithServerErrorCode:error:", -23101, v8))
      {
        v30 = qword_100088F08;
        if (os_log_type_enabled((os_log_t)qword_100088F08, OS_LOG_TYPE_ERROR))
          sub_10003BFB8(v30);
        v31 = (void *)objc_claimAutoreleasedReturnValue(+[UMUserManager sharedManager](UMUserManager, "sharedManager"));
        v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "user"));
        objc_msgSend(v31, "disableUser:completionHandler:", v32, 0);

      }
      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "domain"));
      v34 = objc_msgSend(v33, "isEqualToString:", v17);

      if ((v34 & 1) == 0)
      {
        v35 = objc_claimAutoreleasedReturnValue(-[LUIAuthenticationController _translateErrorToLKErrorIfNeeded:](self, "_translateErrorToLKErrorIfNeeded:", v8));

        v8 = (id)v35;
      }
      if (objc_msgSend(v8, "code") == (id)18)
      {
        v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "userInfo"));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "objectForKeyedSubscript:", LKErrorPasscodeBackOffInterval));

        objc_msgSend(v13, "doubleValue");
        v38 = v37;
        v23 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "passcodeResultResponder"));
        objc_msgSend(v23, "startPasscodeVerificationBackoff:", v38);
      }
      else
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[LUIAuthenticationController errorMessageForError:](self, "errorMessageForError:", v8));
        v39 = objc_msgSend(v8, "code");
        v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "passcodeResultResponder"));
        v23 = v40;
        if (v39 == (id)17)
        {
          v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
          v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "localizedStringForKey:value:table:", CFSTR("CANNOT_CREATE_USER_TITLE"), &stru_100069EB8, 0));
          objc_msgSend(v23, "presentAlertForErrorTitle:message:", v42, v13);

        }
        else
        {
          objc_msgSend(v40, "passcodeVerificationFailedWithErrorMessage:", v13);
        }
      }
    }
  }

LABEL_36:
}

- (id)_createInitialConfigurationForUser:(id)a3
{
  id v4;
  void *v5;
  unsigned int v6;
  unsigned int v7;
  void *v8;
  unsigned int v9;
  NSObject *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  char v15;
  uint64_t v16;
  unsigned int v17;
  unsigned __int8 v18;
  void *v19;
  LUIAuthenticateConfiguration *v20;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  LUIAuthenticateConfiguration *v26;
  char v27;
  LUIAuthenticationController *v28;
  uint8_t buf[4];
  int v30;
  __int16 v31;
  unsigned int v32;
  __int16 v33;
  unsigned int v34;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "username"));
  v28 = self;
  v6 = -[LUIAuthenticationController _canLocallyAuthUserWithUsername:](self, "_canLocallyAuthUserWithUsername:", v5);

  v7 = +[LKPlatformSupport isInternalBuild](LKPlatformSupport, "isInternalBuild");
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v9 = objc_msgSend(v8, "BOOLForKey:", CFSTR("LUILocalAuthOnly"));

  v10 = qword_100088F30;
  if (os_log_type_enabled((os_log_t)qword_100088F30, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109632;
    v30 = v7 & v9;
    v31 = 1024;
    v32 = v7;
    v33 = 1024;
    v34 = v9;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "doLocalAuthOnly: %d, isInternalBuild: %d, localAuthDefault: %d", buf, 0x14u);
  }
  v27 = v7 & v9;
  v26 = [LUIAuthenticateConfiguration alloc];
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[UMUserManager sharedManager](UMUserManager, "sharedManager"));
  v12 = objc_msgSend(v11, "userExists:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[UMUserManager sharedManager](UMUserManager, "sharedManager"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "currentUser"));
  v15 = v6;
  v16 = v6;
  v17 = +[LKPlatformSupport isInternalBuild](LKPlatformSupport, "isInternalBuild");
  if (v17)
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v18 = objc_msgSend(v25, "BOOLForKey:", CFSTR("LUIBypassSetupAssistant"));
  }
  else
  {
    v18 = 0;
  }
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[LUIAuthenticationController navigationController](v28, "navigationController"));
  LOBYTE(v24) = 0;
  LOBYTE(v23) = v18;
  BYTE2(v22) = 0;
  BYTE1(v22) = v27;
  LOBYTE(v22) = v15;
  v20 = -[LUIAuthenticateConfiguration initWithUser:userAlreadyExist:isTemporarySession:currentUser:passcode:passcodeResetRequired:passcodeResultResponder:authMode:canLoginWithLocalAuthOnly:doLocalAuthOnly:hasDoneRemoteAuth:userSwitchContext:emcsInfoDict:shouldBypassSetupAssistant:preferencesToSet:needsToEvictCleanUser:navigationController:completionHandler:](v26, "initWithUser:userAlreadyExist:isTemporarySession:currentUser:passcode:passcodeResetRequired:passcodeResultResponder:authMode:canLoginWithLocalAuthOnly:doLocalAuthOnly:hasDoneRemoteAuth:userSwitchContext:emcsInfoDict:shouldBypassSetupAssistant:preferencesToSet:needsToEvictCleanUser:navigationController:completionHandler:", v4, v12, 0, v14, 0, 0, 0, v16, v22, 0, 0, v23, 0, v24, v19,
          0);

  if (v17)
  return v20;
}

- (id)_createInitialConfigurationForLocalUserWithUsername:(id)a3 altDSID:(id)a4 password:(id)a5 givenName:(id)a6 isTemporarySession:(BOOL)a7
{
  _BOOL8 v7;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  LUIAuthenticateConfiguration *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  LUIAuthenticateConfiguration *v26;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;

  v7 = a7;
  v12 = a6;
  v13 = a5;
  v14 = a4;
  v15 = a3;
  v16 = (void *)objc_opt_new(UMMutableUser);
  objc_msgSend(v16, "setUsername:", v15);
  objc_msgSend(v16, "setAlternateDSID:", v14);

  if (v12)
    v17 = v12;
  else
    v17 = v15;
  objc_msgSend(v16, "setGivenName:", v17);

  objc_msgSend(v16, "setIsAuditor:", v7);
  objc_msgSend(v16, "setIsTransientUser:", v7);
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[LUIPersistentImageCache sharedCache](LUIPersistentImageCache, "sharedCache"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "urlForAnonymousUserAvatar"));
  objc_msgSend(v16, "setPhotoURL:", v19);

  v20 = [LUIAuthenticateConfiguration alloc];
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[UMUserManager sharedManager](UMUserManager, "sharedManager"));
  v22 = objc_msgSend(v21, "userExists:", v16);
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[UMUserManager sharedManager](UMUserManager, "sharedManager"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "currentUser"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[LUIAuthenticationController navigationController](self, "navigationController"));
  LOBYTE(v30) = 0;
  LOBYTE(v29) = 1;
  BYTE2(v28) = 0;
  LOWORD(v28) = 257;
  v26 = -[LUIAuthenticateConfiguration initWithUser:userAlreadyExist:isTemporarySession:currentUser:passcode:passcodeResetRequired:passcodeResultResponder:authMode:canLoginWithLocalAuthOnly:doLocalAuthOnly:hasDoneRemoteAuth:userSwitchContext:emcsInfoDict:shouldBypassSetupAssistant:preferencesToSet:needsToEvictCleanUser:navigationController:completionHandler:](v20, "initWithUser:userAlreadyExist:isTemporarySession:currentUser:passcode:passcodeResetRequired:passcodeResultResponder:authMode:canLoginWithLocalAuthOnly:doLocalAuthOnly:hasDoneRemoteAuth:userSwitchContext:emcsInfoDict:shouldBypassSetupAssistant:preferencesToSet:needsToEvictCleanUser:navigationController:completionHandler:", v16, v22, v7, v24, v13, 0, 0, 1, v28, 0, 0, v29, 0, v30, v25,
          0);

  return v26;
}

- (id)_createInitialConfigurationForAnonymousUserWithResultResponder:(id)a3
{
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = LKAnonymousUserUsernameKey;
  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "UUIDString"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("GUEST"), &stru_100069EB8, 0));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[LUIAuthenticationController _createInitialConfigurationForLocalUserWithUsername:altDSID:password:givenName:isTemporarySession:](self, "_createInitialConfigurationForLocalUserWithUsername:altDSID:password:givenName:isTemporarySession:", v4, v7, 0, v9, 1));

  objc_msgSend(v10, "setPasscodeResultResponder:", v5);
  return v10;
}

- (id)_createInitialEnvironment
{
  LUIAuthenticateEnvironment *v2;
  void *v3;
  LUIAuthenticateEnvironment *v4;

  v2 = [LUIAuthenticateEnvironment alloc];
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[LUIReachability reachabilityForInternetConnection](LUIReachability, "reachabilityForInternetConnection"));
  v4 = -[LUIAuthenticateEnvironment initWithDeviceHasNetwork:isInternalBuild:](v2, "initWithDeviceHasNetwork:isInternalBuild:", objc_msgSend(v3, "currentReachabilityStatus") != 0, +[LKPlatformSupport isInternalBuild](LKPlatformSupport, "isInternalBuild"));

  return v4;
}

- (void)_startFetchingAuthModeWithTimeoutForUser:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  double v8;
  double v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  const __CFString *v18;
  id v19;

  v6 = a4;
  v7 = a3;
  -[LUIAuthenticationController timeoutInterval](self, "timeoutInterval");
  v9 = v8;
  if (v6)
  {
    v18 = CFSTR("completionBlock");
    v10 = objc_retainBlock(v6);
    v19 = v10;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:](NSTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, "_fetchAuthModeTimedOut:", v11, 0, v9));

  }
  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:](NSTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, "_fetchAuthModeTimedOut:", 0, 0, v8));
  }
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10001E1A8;
  v15[3] = &unk_100069830;
  v15[4] = self;
  v16 = v12;
  v17 = v6;
  v13 = v6;
  v14 = v12;
  -[LUIAuthenticationController fetchAuthModeIfNeededWithUser:completionHandler:](self, "fetchAuthModeIfNeededWithUser:completionHandler:", v7, v15);

}

- (void)_fetchAuthModeTimedOut:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;
  id location;

  v4 = a3;
  if (objc_msgSend(v4, "isValid"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("completionBlock")));

    objc_initWeak(&location, self);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10001E450;
    v8[3] = &unk_100069858;
    objc_copyWeak(&v11, &location);
    v9 = v4;
    v7 = v6;
    v10 = v7;
    -[LUIAuthenticationController _queueBlock:](self, "_queueBlock:", v8);

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);

  }
}

- (id)_fetchAuthResultDictionaryForAuthMode:(unint64_t)a3 error:(id)a4
{
  id v5;
  void *v6;
  void **v7;
  const __CFString **v8;
  uint64_t v9;
  void *v10;
  const __CFString *v12;
  void *v13;
  _QWORD v14[2];
  _QWORD v15[2];

  if (a4)
  {
    v14[0] = CFSTR("userAuthMode");
    v5 = a4;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a3));
    v14[1] = CFSTR("userAuthError");
    v15[0] = v6;
    v15[1] = v5;
    v7 = (void **)v15;
    v8 = (const __CFString **)v14;
    v9 = 2;
  }
  else
  {
    v12 = CFSTR("userAuthMode");
    v5 = 0;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a3));
    v13 = v6;
    v7 = &v13;
    v8 = &v12;
    v9 = 1;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v7, v8, v9));

  return v10;
}

- (id)_updateConfigurationWithFetchAuthModeResult:(id)a3 result:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  unsigned __int8 v12;
  void *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("userAuthError")));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("userAuthMode")));

  v10 = objc_msgSend(v9, "integerValue");
  objc_msgSend(v6, "setAuthMode:", v10);
  if (v8)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
    v12 = objc_msgSend(v8, "isEqual:", v11);

    if ((v12 & 1) == 0)
    {
      if (!-[LUIAuthenticationController _isNetworkError:](self, "_isNetworkError:", v8)
        || !objc_msgSend(v6, "canLoginWithLocalAuthOnly"))
      {
        v14 = v8;
        goto LABEL_10;
      }
      objc_msgSend(v6, "setAuthMode:", 1);
    }
  }
  if (!objc_msgSend(v6, "authMode"))
  {
    v14 = (id)objc_claimAutoreleasedReturnValue(+[LKError errorWithCode:](LKError, "errorWithCode:", 22));
LABEL_10:
    v13 = v14;
    goto LABEL_11;
  }
  v13 = 0;
LABEL_11:

  return v13;
}

- (void)fetchAuthModeIfNeededWithUser:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, uint64_t, _QWORD);
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  _BOOL4 v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[4];
  void (**v23)(id, uint64_t, _QWORD);
  uint8_t buf[4];
  void *v25;

  v6 = a3;
  v7 = (void (**)(id, uint64_t, _QWORD))a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UMUserManager sharedManager](UMUserManager, "sharedManager"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "username"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "userForUsername:", v9));

  if (objc_msgSend(v10, "hasManagedCredentials"))
  {
    v11 = qword_100088F30;
    if (os_log_type_enabled((os_log_t)qword_100088F30, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "User already has logged in at least once to this device and set a passcode. No need to fetch authentication mode.", buf, 2u);
    }
    if (v7)
      v7[2](v7, 1, 0);
  }
  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[LUIAuthenticationController authModeCache](self, "authModeCache"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "username"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", v13));

    v15 = qword_100088F30;
    v16 = os_log_type_enabled((os_log_t)qword_100088F30, OS_LOG_TYPE_DEFAULT);
    if (v14)
    {
      if (v16)
      {
        v17 = v15;
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "username"));
        *(_DWORD *)buf = 138477827;
        v25 = v18;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "We've fetched auth mode for user: %{private}@", buf, 0xCu);

      }
      if (v7)
      {
        v19 = (void *)objc_claimAutoreleasedReturnValue(-[LUIAuthenticationController authModeCache](self, "authModeCache"));
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "username"));
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectForKeyedSubscript:", v20));
        v7[2](v7, (uint64_t)objc_msgSend(v21, "integerValue"), 0);

      }
    }
    else
    {
      if (v16)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Start fetching authentication mode since device has internet connection.", buf, 2u);
      }
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472;
      v22[2] = sub_10001EA6C;
      v22[3] = &unk_100069880;
      v23 = v7;
      -[LUIAuthenticationController _fetchAuthModeWithUser:completionHandler:](self, "_fetchAuthModeWithUser:completionHandler:", v6, v22);

    }
  }

}

- (void)_fetchAuthModeWithUser:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  kdebug_trace(732758044, 0, 0, 0, 0);
  -[LUIAuthenticationController authBegan](self, "authBegan");
  v8 = qword_100088F30;
  if (os_log_type_enabled((os_log_t)qword_100088F30, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Beginning to determine whether we need federated auth or not.", buf, 2u);
  }
  v9 = (void *)objc_opt_new(AKAppleIDAuthenticationContext);
  v10 = (void *)objc_opt_new(AKAppleIDAuthenticationController);
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "username"));
  objc_msgSend(v9, "setUsername:", v11);

  objc_msgSend(v9, "setIsEphemeral:", 1);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10001EBF0;
  v14[3] = &unk_100069830;
  v14[4] = self;
  v15 = v6;
  v16 = v7;
  v12 = v7;
  v13 = v6;
  objc_msgSend(v10, "fetchAuthModeWithContext:completion:", v9, v14);

}

- (void)_passcodeViewDidAppearActionWithConfiguration:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  unsigned int v8;
  void *v9;
  id v10;

  v10 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "user"));
  v5 = objc_opt_class(LKUser);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[LUIAuthenticationController delegate](self, "delegate"));
    if ((objc_opt_respondsToSelector(v6, "shouldUpdateStudentStatusWithClassroom") & 1) != 0)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[LUIAuthenticationController delegate](self, "delegate"));
      v8 = objc_msgSend(v7, "shouldUpdateStudentStatusWithClassroom");

      if (!v8)
        goto LABEL_8;
    }
    else
    {

    }
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "user"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));
    +[CRKStudentDaemonProxy setActiveStudentIdentifier:completion:](CRKStudentDaemonProxy, "setActiveStudentIdentifier:completion:", v9, &stru_1000698A0);

  }
LABEL_8:

}

- (void)_passcodeEnterDidCancelActionWithConfiguration:(id)a3 environment:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  unsigned int v9;
  id v10;

  v10 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[LUIAuthenticationController delegate](self, "delegate"));
  if ((objc_opt_respondsToSelector(v7, "shouldUpdateStudentStatusWithClassroom") & 1) != 0)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[LUIAuthenticationController delegate](self, "delegate"));
    v9 = objc_msgSend(v8, "shouldUpdateStudentStatusWithClassroom");

    if (!v9)
      goto LABEL_6;
  }
  else
  {

  }
  +[CRKStudentDaemonProxy setActiveStudentIdentifier:completion:](CRKStudentDaemonProxy, "setActiveStudentIdentifier:completion:", 0, &stru_1000698C0);
LABEL_6:
  -[LUIAuthenticationController _terminateUserLoginFlowFromStep:error:configuration:environment:](self, "_terminateUserLoginFlowFromStep:error:configuration:environment:", 2, 0, v10, v6);

}

- (void)_presentPasswordViewControllerAndMoveOnForUser:(id)a3 configuration:(id)a4 environment:(id)a5
{
  id v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;
  id v13;

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10001F000;
  v10[3] = &unk_100069910;
  v10[4] = self;
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v7 = v13;
  v8 = v12;
  v9 = v11;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v10);

}

- (void)_updateConfigurationWithPasscodeEnterResult:(id)a3 result:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  v5 = a4;
  if (objc_msgSend(v8, "authMode") != (id)2)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("password")));
    objc_msgSend(v8, "setPasscode:", v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("passwordResponder")));
    objc_msgSend(v8, "setPasscodeResultResponder:", v7);

  }
}

- (BOOL)_skipRemoteAuthDueToBackoff:(id)a3 environment:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  const __CFString *v17;
  void *v18;
  uint64_t v19;
  void *v20;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "user"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "username"));
  -[LUIAuthenticationController _passcodeBackoffIntervalForUsername:](self, "_passcodeBackoffIntervalForUsername:", v9);
  v11 = v10;

  if (v11 != 0.0)
  {
    v19 = LKErrorPasscodeBackOffInterval;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v11));
    v20 = v12;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1));

    v14 = (void *)objc_claimAutoreleasedReturnValue(+[LKError errorWithCode:userInfo:](LKError, "errorWithCode:userInfo:", 18, v13));
    v17 = CFSTR("userAuthError");
    v18 = v14;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1));
    -[LUIAuthenticationController _loginFlowStepFinished:result:configuration:environment:](self, "_loginFlowStepFinished:result:configuration:environment:", 4, v15, v6, v7);

  }
  return v11 != 0.0;
}

- (BOOL)_skipRemoteAuthDueToUserDefaultsSetting:(id)a3 environment:(id)a4
{
  id v6;
  id v7;
  unsigned int v8;
  void *v9;
  void *v10;
  const __CFString *v12;
  void *v13;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v6, "doLocalAuthOnly");
  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", AKAppleIDAuthenticationErrorDomain, -7005, 0));
    v12 = CFSTR("userAuthError");
    v13 = v9;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v13, &v12, 1));
    -[LUIAuthenticationController _loginFlowStepFinished:result:configuration:environment:](self, "_loginFlowStepFinished:result:configuration:environment:", 4, v10, v6, v7);

  }
  return v8;
}

- (double)_passcodeBackoffIntervalForUsername:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  double v6;
  double v7;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UMUserManager sharedManager](UMUserManager, "sharedManager"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userForUsername:", v3));

  objc_msgSend(v5, "passcodeBackOffInterval");
  v7 = v6;

  return v7;
}

- (void)_startRemoteAuthWithConfiguration:(id)a3 environment:(id)a4 completionHandler:(id)a5
{
  id v5;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  id v18;
  id v19;
  _QWORD v20[5];
  id v21;
  id v22;
  BOOL v23;
  uint8_t buf[8];
  const __CFString *v25;
  id v26;

  v8 = a5;
  v9 = a3;
  kdebug_trace(732758020, 0, 0, 0, 0);
  v10 = qword_100088F30;
  if (os_log_type_enabled((os_log_t)qword_100088F30, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Beginning remote auth", buf, 2u);
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[LUIAuthenticationController _createInAppContextFromConfiguration:](self, "_createInAppContextFromConfiguration:", v9));
  v12 = (void *)objc_opt_new(AKAppleIDAuthenticationController);
  v13 = objc_msgSend(v9, "authMode");

  if (v13 == (id)2)
  {
    v14 = 0;
  }
  else
  {
    -[LUIAuthenticationController timeoutInterval](self, "timeoutInterval");
    v16 = v15;
    if (v8)
    {
      v25 = CFSTR("completionBlock");
      v5 = objc_retainBlock(v8);
      v26 = v5;
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v26, &v25, 1));
    }
    else
    {
      v17 = 0;
    }
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:](NSTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, "_remoteAuthTimedOut:", v17, 1, v16));
    if (v8)
    {

    }
  }
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_10001F824;
  v20[3] = &unk_100069960;
  v23 = v13 == (id)2;
  v20[4] = self;
  v21 = v14;
  v22 = v8;
  v18 = v8;
  v19 = v14;
  objc_msgSend(v12, "authenticateWithContext:completion:", v11, v20);

}

- (id)_createInAppContextFromConfiguration:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned int v11;
  NSObject *v12;
  void *v13;
  void *v14;
  uint8_t v16[16];

  v4 = a3;
  v5 = (void *)objc_opt_new(AKAppleIDAuthenticationInAppContext);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "user"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "username"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "passcode"));
  objc_msgSend(v5, "setUsername:", v7);
  objc_msgSend(v5, "_setPassword:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "alternateDSID"));
  objc_msgSend(v5, "setAltDSID:", v9);

  if (+[LKPlatformSupport isInternalBuild](LKPlatformSupport, "isInternalBuild"))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "alternateDSID"));
    v11 = objc_msgSend(v10, "containsString:", CFSTR("restrictionlessLogin"));

    if (v11)
    {
      v12 = qword_100088F30;
      if (os_log_type_enabled((os_log_t)qword_100088F30, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v16 = 0;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Nil out alternateDSID for restrictionless login account", v16, 2u);
      }
      objc_msgSend(v5, "setAltDSID:", 0);
    }
  }
  objc_msgSend(v5, "setIsUsernameEditable:", 0);
  objc_msgSend(v5, "setShouldAllowAppleIDCreation:", 0);
  objc_msgSend(v5, "setNeedsCredentialRecovery:", 0);
  objc_msgSend(v5, "setNeedsNewAppleID:", 0);
  objc_msgSend(v5, "setServiceType:", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "navigationController"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "topViewController"));
  objc_msgSend(v5, "setPresentingViewController:", v14);

  objc_msgSend(v5, "setDelegate:", self);
  objc_msgSend(v5, "setShouldRequestShortLivedToken:", 1);
  objc_msgSend(v5, "setShouldRequestConfigurationInfo:", 1);
  objc_msgSend(v5, "setIsEphemeral:", 1);

  return v5;
}

- (void)_analyzeRemoteAuthResult:(id)a3 andUpdateConfiguration:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  NSMutableDictionary *v14;
  void *v15;
  void *v16;
  void *v17;
  _UNKNOWN **v18;
  NSObject *v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  uint64_t v35;
  void *v36;
  NSObject *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  NSObject *v42;
  void *v43;
  void *v44;
  void *v45;
  unsigned int v46;
  NSObject *v47;
  _BOOL4 v48;
  void *v49;
  void *v50;
  id v51;
  void *v52;
  void *v53;
  NSObject *v54;
  _BOOL4 v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  id v59;
  void *v60;
  id v61;
  uint64_t v62;
  void *v63;
  uint8_t buf[4];
  int v65;
  uint64_t v66;
  void *v67;

  v6 = a3;
  v7 = a4;
  v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", AKAuthenticationShortLivedTokenKey));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "user"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "passcode"));
  v11 = objc_claimAutoreleasedReturnValue(-[LUIAuthenticationController _updatedUserWithOldUser:passcodeType:authenticationResults:](self, "_updatedUserWithOldUser:passcodeType:authenticationResults:", v9, +[UMUser mc_userPasscodeTypeWithPasscode:](UMUser, "mc_userPasscodeTypeWithPasscode:", v10), v6));

  v60 = (void *)v11;
  objc_msgSend(v7, "setUser:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", AKAuthenticationConfigurationInfoKey));
  v13 = qword_100088F30;
  if (os_log_type_enabled((os_log_t)qword_100088F30, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "init setup data", buf, 2u);
  }
  v14 = objc_opt_new(NSMutableDictionary);
  if (+[LKPlatformSupport isInternalBuild](LKPlatformSupport, "isInternalBuild"))
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "dictionaryForKey:", CFSTR("LUIPreferencesToSet")));

    if (v16)
    {
      v17 = (void *)qword_100088F30;
      if (os_log_type_enabled((os_log_t)qword_100088F30, OS_LOG_TYPE_DEBUG))
        sub_10003C2F8(v17);
      -[NSMutableDictionary addEntriesFromDictionary:](v14, "addEntriesFromDictionary:", v16);
    }

  }
  v18 = &AKAppleIDAuthenticationErrorDomain_ptr;
  if (!v12)
  {
    v57 = 0;
    v32 = 0;
    goto LABEL_31;
  }
  v56 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("com.apple.idms.config.KCKey")));
  v19 = qword_100088F30;
  if (os_log_type_enabled((os_log_t)qword_100088F30, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "We have a config info", buf, 2u);
  }
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("com.apple.idms.config.BuddyData"), v56));
  v21 = objc_msgSend(v20, "mutableCopy");

  if (v21)
  {
    v22 = objc_opt_class(NSDictionary);
    if ((objc_opt_isKindOfClass(v21, v22) & 1) != 0)
    {
      v23 = v8;
      if (!_os_feature_enabled_impl("SharediPad", "idMSPreferences"))
        goto LABEL_21;
      v24 = LKIDMSApplicationPreferencesKey;
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", LKIDMSApplicationPreferencesKey));
      v26 = objc_opt_class(NSDictionary);
      if ((objc_opt_isKindOfClass(v25, v26) & 1) != 0)
      {
        v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", v24));
        v59 = objc_msgSend(v27, "count");

        if (!v59)
          goto LABEL_21;
        v28 = qword_100088F30;
        if (os_log_type_enabled((os_log_t)qword_100088F30, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Update BuddyData with application preferences", buf, 2u);
        }
        v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", v24));
        objc_msgSend(v21, "setObject:forKeyedSubscript:", v29, v24);

        v25 = (void *)objc_claimAutoreleasedReturnValue(+[LKUniversalDiskStorage sharedStorage](LKUniversalDiskStorage, "sharedStorage"));
        v66 = v24;
        v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", v24));
        v67 = v30;
        v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v67, &v66, 1));
        objc_msgSend(v25, "saveKeyValuePairs:error:", v31, 0);

      }
LABEL_21:
      v61 = 0;
      v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", v21, 1, &v61));
      v33 = v61;
      if (v33 && os_log_type_enabled((os_log_t)qword_100088F08, OS_LOG_TYPE_ERROR))
        sub_10003C28C();

      v8 = v23;
      v18 = &AKAppleIDAuthenticationErrorDomain_ptr;
      goto LABEL_26;
    }
  }
  v32 = 0;
LABEL_26:
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("com.apple.idms.config.Language")));
  if (v34)
  {
    v35 = objc_opt_class(v18[119]);
    if ((objc_opt_isKindOfClass(v34, v35) & 1) != 0)
      -[NSMutableDictionary addEntriesFromDictionary:](v14, "addEntriesFromDictionary:", v34);
  }

LABEL_31:
  if (-[NSMutableDictionary count](v14, "count", v57))
  {
    v36 = (void *)qword_100088F30;
    if (os_log_type_enabled((os_log_t)qword_100088F30, OS_LOG_TYPE_DEBUG))
      sub_10003C20C(v36);
    objc_msgSend(v7, "setPreferencesToSet:", v14);
  }
  v37 = qword_100088F30;
  if (os_log_type_enabled((os_log_t)qword_100088F30, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "check password", buf, 2u);
  }
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "passcode"));

  if (v38)
  {
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", AKAuthenticationIsPasscodeResetRequiredKey));
    objc_msgSend(v7, "setPasscodeResetRequired:", objc_msgSend(v39, "BOOLValue"));

  }
  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", AKAuthenticationIsServerUIRequiredKey));
  v41 = objc_msgSend(v40, "BOOLValue");

  v42 = qword_100088F30;
  if (os_log_type_enabled((os_log_t)qword_100088F30, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    v65 = (int)v41;
    _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "secondary action required: %d", buf, 8u);
  }
  v43 = (void *)v8;
  v44 = (void *)objc_claimAutoreleasedReturnValue(+[UMUserSwitchContext contextWithSetupData:shortLivedToken:secondaryActionRequired:](UMUserSwitchContext, "contextWithSetupData:shortLivedToken:secondaryActionRequired:", v32, v8, v41));
  objc_msgSend(v7, "setUserSwitchContext:", v44);
  objc_msgSend(v7, "setHasDoneRemoteAuth:", 1);
  v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "user"));
  v46 = objc_msgSend(v45, "isAuditor");

  v47 = qword_100088F30;
  v48 = os_log_type_enabled((os_log_t)qword_100088F30, OS_LOG_TYPE_DEFAULT);
  if (v46)
  {
    v49 = v58;
    if (v48)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEFAULT, "User is auditor", buf, 2u);
    }
  }
  else
  {
    if (v48)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEFAULT, "Not an auditor", buf, 2u);
    }
    v62 = kSecureBackupContainsEMCSDataKey;
    v63 = &__kCFBooleanTrue;
    v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v63, &v62, 1));
    v51 = objc_msgSend(v50, "mutableCopy");

    v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "passcode"));
    v49 = v58;
    if (v52)
    {
      v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "passcode"));
      objc_msgSend(v51, "setObject:forKeyedSubscript:", v53, kSecureBackupEMCSManagedCredentialKey);

    }
    v54 = qword_100088F30;
    v55 = os_log_type_enabled((os_log_t)qword_100088F30, OS_LOG_TYPE_DEFAULT);
    if (v58)
    {
      if (v55)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_DEFAULT, "We have an EMCS key", buf, 2u);
      }
      objc_msgSend(v51, "setObject:forKeyedSubscript:", v58, kSecureBackupEMCSIDMSDictKey);
    }
    else if (v55)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_DEFAULT, "We DO NOT have an EMCS key", buf, 2u);
    }
    objc_msgSend(v7, "setEmcsInfoDict:", v51);

  }
}

- (id)_updatedUserWithOldUser:(id)a3 passcodeType:(unint64_t)a4 authenticationResults:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  NSDate *v12;
  void *v13;
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
  NSObject *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  uint8_t v36[16];
  uint8_t buf[16];

  v7 = a3;
  v8 = a5;
  v9 = (void *)objc_opt_new(UMMutableUser);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", AKAuthenticationAlternateDSIDKey));
  objc_msgSend(v9, "setAlternateDSID:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "username"));
  objc_msgSend(v9, "setUsername:", v11);

  v12 = objc_opt_new(NSDate);
  objc_msgSend(v9, "setLastRemoteAuthDate:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "givenName"));
  objc_msgSend(v9, "setGivenName:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "familyName"));
  objc_msgSend(v9, "setFamilyName:", v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "displayName"));
  objc_msgSend(v9, "setDisplayName:", v15);

  objc_msgSend(v9, "setHasManagedCredentials:", objc_msgSend(v7, "hasManagedCredentials"));
  objc_msgSend(v9, "setPasscodeType:", a4);
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "givenName"));
  if (v16)
    goto LABEL_2;
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "familyName"));

  if (!v17)
  {
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", AKAuthenticationFirstNameKey));
    objc_msgSend(v9, "setGivenName:", v30);

    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", AKAuthenticationLastNameKey));
    objc_msgSend(v9, "setFamilyName:", v31);

    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "givenName"));
    if (objc_msgSend(v16, "length"))
    {
      v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "familyName"));
      v33 = objc_msgSend(v32, "length");

      if (!v33)
        goto LABEL_4;
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "familyName"));
      v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "givenName"));
      v35 = (void *)objc_claimAutoreleasedReturnValue(+[LKUser fullNameWithFamilyName:givenName:](LKUser, "fullNameWithFamilyName:givenName:", v16, v34));
      objc_msgSend(v9, "setDisplayName:", v35);

    }
LABEL_2:

  }
LABEL_4:
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "givenName"));

  if (!v18)
    objc_msgSend(v9, "setGivenName:", &stru_100069EB8);
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "familyName"));

  if (!v19)
    objc_msgSend(v9, "setFamilyName:", &stru_100069EB8);
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "photoURL"));
  objc_msgSend(v9, "setPhotoURL:", v20);

  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", AKAuthenticationAuditLoginKey));
  objc_msgSend(v9, "setIsAuditor:", objc_msgSend(v21, "BOOLValue"));

  if (objc_msgSend(v9, "isAuditor"))
  {
    v22 = qword_100088F30;
    if (os_log_type_enabled((os_log_t)qword_100088F30, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "isAuditor", buf, 2u);
    }
  }
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", AKAuthenticationConfigurationInfoKey));
  if (v23)
  {
    v24 = qword_100088F30;
    if (os_log_type_enabled((os_log_t)qword_100088F30, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v36 = 0;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "We have a config info", v36, 2u);
    }
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("com.apple.idms.config.Language")));
    if (v25)
    {
      v26 = objc_opt_class(NSDictionary);
      if ((objc_opt_isKindOfClass(v25, v26) & 1) != 0)
      {
        v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("AppleLanguages")));
        objc_msgSend(v9, "setLanguages:", v27);

        v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("AppleLocale")));
        objc_msgSend(v9, "setUserAuxiliaryString:", v28);

      }
    }

  }
  return v9;
}

- (BOOL)_isNetworkError:(id)a3
{
  id v3;
  void *v4;
  BOOL v5;
  void *v6;
  BOOL v7;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "domain"));
  v5 = v4 == (void *)AKAppleIDAuthenticationErrorDomain
    && (objc_msgSend(v3, "code") == (id)-7005 || objc_msgSend(v3, "code") == (id)-7029);

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "domain"));
  v7 = v6 == (void *)LKErrorDomain && objc_msgSend(v3, "code") == (id)23;

  return v5 || v7;
}

- (id)_remoteAuthResultDictionaryForServerResponse:(id)a3 error:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  id *v10;
  const __CFString **v11;
  uint64_t v12;
  void *v13;
  const __CFString *v15;
  id v16;
  _QWORD v17[2];
  _QWORD v18[2];

  v5 = a3;
  v6 = a4;
  if (v6)
  {
    v17[0] = CFSTR("remoteAuthResponse");
    if (v5)
      v7 = v5;
    else
      v7 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
    v9 = v7;
    v17[1] = CFSTR("userAuthError");
    v18[0] = v7;
    v18[1] = v6;
    v10 = (id *)v18;
    v11 = (const __CFString **)v17;
    v12 = 2;
  }
  else
  {
    v15 = CFSTR("remoteAuthResponse");
    if (v5)
      v8 = v5;
    else
      v8 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
    v9 = v8;
    v16 = v8;
    v10 = &v16;
    v11 = &v15;
    v12 = 1;
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v10, v11, v12));

  return v13;
}

- (void)_remoteAuthTimedOut:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;
  id location;

  v4 = a3;
  if (objc_msgSend(v4, "isValid"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("completionBlock")));

    objc_initWeak(&location, self);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100020BC8;
    v8[3] = &unk_100069858;
    objc_copyWeak(&v11, &location);
    v9 = v4;
    v7 = v6;
    v10 = v7;
    -[LUIAuthenticationController _queueBlock:](self, "_queueBlock:", v8);

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);

  }
}

- (void)_setBypassSetupAssistantIfNeeded:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  __CFString *v7;
  uint64_t v8;
  void *v9;
  const __CFString *v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  _QWORD v17[4];
  _QWORD v18[4];

  v3 = a3;
  if (objc_msgSend(v3, "shouldBypassSetupAssistant"))
  {
    v4 = (void *)CFPreferencesCopyValue(CFSTR("AppleLanguages"), kCFPreferencesAnyApplication, kCFPreferencesCurrentUser, kCFPreferencesAnyHost);
    if (!objc_msgSend(v4, "count"))
    {
      v5 = objc_claimAutoreleasedReturnValue(+[NSLocale preferredLanguages](NSLocale, "preferredLanguages"));

      v4 = (void *)v5;
    }
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale currentLocale](NSLocale, "currentLocale"));
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localeIdentifier"));

    v17[0] = CFSTR("SetupDone");
    v17[1] = CFSTR("SetupFinishedAllSteps");
    v18[0] = &__kCFBooleanTrue;
    v18[1] = &__kCFBooleanTrue;
    v17[2] = CFSTR("Language");
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "firstObject"));
    v9 = (void *)v8;
    v10 = CFSTR("en-US");
    if (v8)
      v10 = (const __CFString *)v8;
    v17[3] = CFSTR("Locale");
    v11 = CFSTR("en_US");
    if (v7)
      v11 = v7;
    v18[2] = v10;
    v18[3] = v11;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v18, v17, 4));
    v16 = 0;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", v12, 1, &v16));
    v14 = v16;

    if (v14 && os_log_type_enabled((os_log_t)qword_100088F08, OS_LOG_TYPE_ERROR))
      sub_10003C378();
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[UMUserSwitchContext contextWithSetupData:shortLivedToken:secondaryActionRequired:](UMUserSwitchContext, "contextWithSetupData:shortLivedToken:secondaryActionRequired:", v13, 0, 0));
    objc_msgSend(v3, "setUserSwitchContext:", v15);

  }
}

- (id)_checkForCurrentUserPasscodeChange:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  unsigned int v6;
  void *v7;
  void *v8;
  const __CFString *v10;
  void *v11;

  v3 = a3;
  if (objc_msgSend(v3, "userAlreadyExist")
    && objc_msgSend(v3, "passcodeResetRequired")
    && (v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "user")),
        v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "currentUser")),
        v6 = objc_msgSend(v4, "isEqual:", v5),
        v5,
        v4,
        v6))
  {
    v10 = CFSTR("userAuthError");
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[LKError errorWithCode:](LKError, "errorWithCode:", 24));
    v11 = v7;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v11, &v10, 1));

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)_stashRecoveryInfo:(id)a3 completionHandler:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_opt_new(SecureBackup);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000210CC;
  v9[3] = &unk_100069380;
  v10 = v5;
  v8 = v5;
  objc_msgSend(v7, "stashRecoveryDataWithInfo:completionBlock:", v6, v9);

}

- (void)_createTemporaryPreferencesToSetIfNeeded:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  NSObject *v18;
  void *v19;
  NSObject *v20;
  id v21;
  id v22;
  int v23;
  void *v24;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "preferencesToSet"));
  v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("AppleLanguages")));
  if (v5)
  {
    v6 = (void *)v5;
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "preferencesToSet"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("AppleLocale")));

    if (v8)
      goto LABEL_19;
  }
  else
  {

  }
  v9 = qword_100088F08;
  if (os_log_type_enabled((os_log_t)qword_100088F08, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v23) = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Creating account with no language from IdMS", (uint8_t *)&v23, 2u);
  }
  v10 = (void *)CFPreferencesCopyValue(CFSTR("AppleLanguages"), kCFPreferencesAnyApplication, kCFPreferencesCurrentUser, kCFPreferencesAnyHost);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale currentLocale](NSLocale, "currentLocale"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localeIdentifier"));

  if (v10 && v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "preferencesToSet"));
    objc_msgSend(v13, "addEntriesFromDictionary:", v14);

    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "user"));
    v16 = objc_msgSend(v15, "mutableCopy");

    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("AppleLanguages")));
    if (!v17)
    {
      v18 = qword_100088F08;
      if (os_log_type_enabled((os_log_t)qword_100088F08, OS_LOG_TYPE_DEFAULT))
      {
        v23 = 138543362;
        v24 = v10;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Setting default language for new user: %{public}@", (uint8_t *)&v23, 0xCu);
      }
      objc_msgSend(v13, "setObject:forKeyedSubscript:", v10, CFSTR("AppleLanguages"));
      objc_msgSend(v16, "setLanguages:", v10);
    }
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("AppleLocale")));

    if (!v19)
    {
      v20 = qword_100088F08;
      if (os_log_type_enabled((os_log_t)qword_100088F08, OS_LOG_TYPE_DEFAULT))
      {
        v23 = 138543362;
        v24 = v12;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Setting default locale for new user: %{public}@", (uint8_t *)&v23, 0xCu);
      }
      objc_msgSend(v13, "setObject:forKeyedSubscript:", v12, CFSTR("AppleLocale"));
      objc_msgSend(v16, "setUserAuxiliaryString:", v12);
    }
    v21 = objc_msgSend(v16, "copy");
    objc_msgSend(v3, "setUser:", v21);

    v22 = objc_msgSend(v13, "copy");
    objc_msgSend(v3, "setPreferencesToSet:", v22);

  }
LABEL_19:

}

- (void)_createUserAndUpdatePasscodeData:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  unsigned int v14;
  void *v15;
  void *v16;
  unsigned int v17;
  NSObject *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  _QWORD v26[4];
  id v27;
  id v28;
  id v29;
  uint8_t buf[4];
  unsigned int v31;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "passcode"));
  if (objc_msgSend(v6, "passcodeResetRequired"))
  {

    objc_msgSend(v6, "setPasscode:", 0);
    goto LABEL_7;
  }
  objc_msgSend(v6, "setPasscode:", v8);
  if (!v8)
  {
LABEL_7:
    v10 = qword_100088F30;
    if (os_log_type_enabled((os_log_t)qword_100088F30, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Create user for passcode reset", buf, 2u);
    }
    goto LABEL_9;
  }
  v9 = qword_100088F30;
  if (os_log_type_enabled((os_log_t)qword_100088F30, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Create user", buf, 2u);
  }

LABEL_9:
  -[LUIAuthenticationController _updateUserPasscodeLockGracePeriod:](self, "_updateUserPasscodeLockGracePeriod:", v6);
  v11 = (void *)qword_100088F30;
  if (os_log_type_enabled((os_log_t)qword_100088F30, OS_LOG_TYPE_DEFAULT))
  {
    v12 = v11;
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "user"));
    v14 = objc_msgSend(v13, "hasManagedCredentials");
    *(_DWORD *)buf = 67109120;
    v31 = v14;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "About to create user with hasManaged: %d", buf, 8u);

  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[LUITemporarySessionSupport sharedInstance](LUITemporarySessionSupport, "sharedInstance"));
  if ((objc_msgSend(v15, "isTemporarySessionOnly") & 1) != 0)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[LUITemporarySessionSupport sharedInstance](LUITemporarySessionSupport, "sharedInstance"));
    v17 = objc_msgSend(v16, "useDynamicQuotaSize");

    if (v17)
    {
      v18 = qword_100088F30;
      if (os_log_type_enabled((os_log_t)qword_100088F30, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "We are under temporary session only mode. Resize the quota before login", buf, 2u);
      }
      v19 = +[DMCMultiUserModeUtilities configureResidentUsersNumberForSharedDevice:preferenceDomain:](DMCMultiUserModeUtilities, "configureResidentUsersNumberForSharedDevice:preferenceDomain:", &off_10006C9B0, kMDMNotBackedUpPreferencesDomain);
    }
  }
  else
  {

  }
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[UMUserManager sharedManager](UMUserManager, "sharedManager"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "user"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "passcodeData"));
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_1000217D8;
  v26[3] = &unk_100069988;
  v28 = v20;
  v29 = v7;
  v27 = v6;
  v23 = v20;
  v24 = v6;
  v25 = v7;
  objc_msgSend(v23, "createUser:passcodeData:completionHandler:", v21, v22, v26);

}

- (void)_evictCleanUserOrCacheDeleteWithCompletionHandler:(id)a3
{
  id v4;
  _QWORD *v5;
  _QWORD v6[4];
  _QWORD *v7;
  _QWORD v8[5];
  id v9;

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100021B08;
  v8[3] = &unk_1000699B0;
  v8[4] = self;
  v9 = a3;
  v4 = v9;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100021B9C;
  v6[3] = &unk_1000699D8;
  v7 = objc_retainBlock(v8);
  v5 = v7;
  -[LUIAuthenticationController _queueBlock:](self, "_queueBlock:", v6);

}

- (void)_purgeSpaceWithCompletionHandler:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  _BYTE *v7;
  _BYTE *v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[3];
  _QWORD v17[3];
  uint8_t buf[4];
  uint64_t v19;
  __int16 v20;
  double v21;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UMUserManager sharedManager](UMUserManager, "sharedManager"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "allUsers"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "firstObject"));
  v7 = objc_msgSend(v6, "dataQuota");

  v8 = +[DMCMultiUserModeUtilities getDiskAvailableSize](DMCMultiUserModeUtilities, "getDiskAvailableSize");
  if (v7 - v8 + 500000000 <= 1000000000)
    v9 = 1000000000;
  else
    v9 = v7 - v8 + 500000000;
  v10 = qword_100088F30;
  if (os_log_type_enabled((os_log_t)qword_100088F30, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218240;
    v19 = v9;
    v20 = 2048;
    v21 = (double)(unint64_t)v9 / 1000000000.0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Asking to purge %llu bytes (%.2f GB) data", buf, 0x16u);
  }
  v17[0] = CFSTR("/private/var");
  v16[0] = CFSTR("CACHE_DELETE_VOLUME");
  v16[1] = CFSTR("CACHE_DELETE_AMOUNT");
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v9));
  v16[2] = CFSTR("CACHE_DELETE_URGENCY");
  v17[1] = v11;
  v17[2] = &off_10006C9C8;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v17, v16, 3));

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100021F30;
  v14[3] = &unk_100069A00;
  v15 = v3;
  v13 = v3;
  CacheDeletePurgeSpaceWithInfo(v12, v14);

}

- (void)_updateUserPasscodeLockGracePeriod:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "user"));
  v7 = objc_msgSend(v5, "mutableCopy");

  objc_msgSend(v7, "setPasscodeLockGracePeriod:", -[LUIAuthenticationController passcodeLockGracePeriod](self, "passcodeLockGracePeriod"));
  v6 = objc_msgSend(v7, "copy");
  objc_msgSend(v4, "setUser:", v6);

}

- (void)_deleteUserAndUpdateConfiguration:(id)a3 completionHandler:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UMUserManager sharedManager](UMUserManager, "sharedManager"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "user"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000221BC;
  v11[3] = &unk_100069A28;
  v12 = v5;
  v13 = v6;
  v9 = v6;
  v10 = v5;
  objc_msgSend(v7, "deleteUser:completionHandler:", v8, v11);

}

- (void)_savePreferenceIfNeededWithConfiguration:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "preferencesToSet"));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "preferencesToSet"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "user"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "username"));
    -[LUIAuthenticationController _savePreferences:forUsername:](self, "_savePreferences:forUsername:", v5, v7);

  }
}

- (void)_presentGettingReadyViewInNavigationController:(id)a3 forUser:(id)a4 isTemporarySession:(BOOL)a5 completionHandler:(id)a6
{
  _BOOL8 v7;
  id v9;
  id v10;
  id v11;
  LUIGettingReadyViewController *v12;
  id v13;
  LUIGettingReadyViewController *v14;
  id v15;
  _QWORD block[4];
  id v17;
  LUIGettingReadyViewController *v18;
  id v19;

  v7 = a5;
  v9 = a3;
  v10 = a6;
  v11 = a4;
  v12 = objc_opt_new(LUIGettingReadyViewController);
  -[LUIGettingReadyViewController setUser:](v12, "setUser:", v11);

  -[LUIGettingReadyViewController setIsTemporarySession:](v12, "setIsTemporarySession:", v7);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100022428;
  block[3] = &unk_1000693A8;
  v17 = v9;
  v18 = v12;
  v19 = v10;
  v13 = v10;
  v14 = v12;
  v15 = v9;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

}

- (void)_switchUserWithConfiguration:(id)a3 environment:(id)a4 completionHandler:(id)a5
{
  id v6;
  id v7;
  void *v8;
  unsigned int v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id *v16;
  id v17;
  NSObject *v18;
  id v19;
  _QWORD v20[4];
  id v21;
  _QWORD v22[4];
  id v23;
  uint8_t buf[16];

  v6 = a5;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "currentUser"));
  v9 = objc_msgSend(v8, "isLoginUser");

  if (v9)
  {
    kdebug_trace(732758036, 0, 0, 0, 0);
    +[LKRegression executeDelayByUserDefaultIfSet:](LKRegression, "executeDelayByUserDefaultIfSet:", CFSTR("LUICreateSwitchUserRegression"));
    v10 = qword_100088F30;
    if (os_log_type_enabled((os_log_t)qword_100088F30, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "User switching.", buf, 2u);
    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[UMUserManager sharedManager](UMUserManager, "sharedManager"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "user"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "passcodeData"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "userSwitchContext"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "preferencesToSet"));

    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_10002277C;
    v22[3] = &unk_100069380;
    v16 = &v23;
    v23 = v6;
    v17 = v6;
    objc_msgSend(v11, "switchToUser:passcodeData:context:preferences:completionHandler:", v12, v13, v14, v15, v22);
  }
  else
  {
    kdebug_trace(732758052, 0, 0, 0, 0);
    +[LKRegression executeDelayByUserDefaultIfSet:](LKRegression, "executeDelayByUserDefaultIfSet:", CFSTR("LUICreateDirectSwitchUserRegression"));
    v18 = qword_100088F30;
    if (os_log_type_enabled((os_log_t)qword_100088F30, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Direct user switching.", buf, 2u);
    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[UMUserManager sharedManager](UMUserManager, "sharedManager"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "user"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "passcodeData"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "userSwitchContext"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "preferencesToSet"));

    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_100022844;
    v20[3] = &unk_100069380;
    v16 = &v21;
    v21 = v6;
    v19 = v6;
    objc_msgSend(v11, "directSwitchToUser:passcodeData:context:preferences:completionHandler:", v12, v13, v14, v15, v20);
  }

}

- (id)_translateErrorToLKErrorIfNeeded:(id)a3
{
  id v4;
  void *v5;
  unsigned int v6;
  uint64_t v7;
  void *v8;
  unsigned int v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v19;
  void *v20;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "domain"));
  v6 = objc_msgSend(v5, "isEqualToString:", UMUserManagerErrorDomain);

  if (!v6)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "domain"));
    v9 = objc_msgSend(v8, "isEqualToString:", AKAppleIDAuthenticationErrorDomain);

    if (v9)
    {
      if (!-[LUIAuthenticationController _isNetworkError:](self, "_isNetworkError:", v4))
      {
        v16 = v4;
        goto LABEL_12;
      }
      v7 = 23;
LABEL_11:
      v16 = (id)objc_claimAutoreleasedReturnValue(+[LKError errorWithCode:](LKError, "errorWithCode:", v7));
LABEL_12:
      v17 = v16;
      goto LABEL_13;
    }
LABEL_10:
    v7 = 8;
    goto LABEL_11;
  }
  if (objc_msgSend(v4, "code") == (id)4)
  {
    v7 = 14;
    goto LABEL_11;
  }
  if (objc_msgSend(v4, "code") != (id)6)
    goto LABEL_10;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
  v11 = UMErrorPasscodeBackOffInterval;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", UMErrorPasscodeBackOffInterval));

  if (v12)
  {
    v19 = LKErrorPasscodeBackOffInterval;
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", v11));
    v20 = v14;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1));

  }
  else
  {
    v15 = 0;
  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[LKError errorWithCode:userInfo:](LKError, "errorWithCode:userInfo:", 18, v15));

LABEL_13:
  return v17;
}

- (id)errorMessageForError:(id)a3
{
  id v3;
  void *v4;
  unsigned int v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  uint64_t v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  NSString *v18;
  void *v19;
  void *v20;
  void *v21;
  __CFString *v22;
  void *v23;
  void *v24;
  void *v25;
  __CFString *v27;
  void *v28;
  char v29;
  void *v30;
  id v31;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "domain"));
  v5 = objc_msgSend(v4, "isEqualToString:", AKAppleIDAuthenticationErrorDomain);

  if (!v5)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedModel"));

    if (objc_msgSend(v3, "code") != (id)14)
    {
      if (objc_msgSend(v3, "code") == (id)18)
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "userInfo"));
        v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", LKErrorPasscodeBackOffInterval));

        objc_msgSend(v6, "doubleValue");
        v14 = ceil(v13 / 60.0);
        v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("PASSCODE_BACKOFF_WARNING"), &stru_100069EB8, 0));
        v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDateComponentsFormatter minuteStringForMinutes:](NSDateComponentsFormatter, "minuteStringForMinutes:", v14));
        v18 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v16, v17);
      }
      else
      {
        if (objc_msgSend(v3, "code") == (id)16)
        {
          if (v8)
          {
            v6 = (id)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
            if (_os_feature_enabled_impl("AppleAccount", "AABranding"))
              v22 = CFSTR("INCOMPATIBLE_APPLE_ACCOUNT_");
            else
              v22 = CFSTR("INCOMPATIBLE_APPLE_ID_");
            v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "uppercaseString"));
            v24 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString stringByAppendingString:](v22, "stringByAppendingString:", v23));
            v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", v24, &stru_100069EB8, 0));
            v11 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v25, v8));

            goto LABEL_19;
          }
          v29 = _os_feature_enabled_impl("AppleAccount", "AABranding");
          v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
          v6 = v9;
          if ((v29 & 1) != 0)
            v10 = CFSTR("INCOMPATIBLE_APPLE_ACCOUNT_GENERIC");
          else
            v10 = CFSTR("INCOMPATIBLE_APPLE_ID_GENERIC");
          goto LABEL_7;
        }
        if (objc_msgSend(v3, "code") == (id)11)
        {
          if (!v8)
          {
            v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
            v6 = v9;
            v10 = CFSTR("ONLINE_AUTHENTICATION_REQUIRED_GENERIC");
            goto LABEL_7;
          }
          v6 = (id)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "uppercaseString"));
          v27 = CFSTR("ONLINE_AUTHENTICATION_REQUIRED_");
        }
        else
        {
          if (objc_msgSend(v3, "code") != (id)15)
          {
            if (objc_msgSend(v3, "code") == (id)17)
            {
              v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
              v6 = v9;
              v10 = CFSTR("CANNOT_CREATE_USER");
            }
            else if (objc_msgSend(v3, "code") == (id)25)
            {
              v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
              v6 = v9;
              v10 = CFSTR("NETWORK_REQUEST_TIMED_OUT");
            }
            else
            {
              v30 = (void *)objc_claimAutoreleasedReturnValue(+[LUIReachability reachabilityForInternetConnection](LUIReachability, "reachabilityForInternetConnection"));
              v31 = objc_msgSend(v30, "currentReachabilityStatus");

              if (v31)
              {
                v11 = 0;
                goto LABEL_20;
              }
              v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
              v6 = v9;
              v10 = CFSTR("OFFLINE_PASSWORD_HINT");
            }
            goto LABEL_7;
          }
          if (!v8)
          {
            v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
            v6 = v9;
            v10 = CFSTR("USER_LIMIT_REACHED_GENERIC");
            goto LABEL_7;
          }
          v6 = (id)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "uppercaseString"));
          v27 = CFSTR("USER_LIMIT_REACHED_");
        }
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString stringByAppendingString:](v27, "stringByAppendingString:", v15));
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", v16, &stru_100069EB8, 0));
        v18 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v17, v8);
      }
      v11 = objc_claimAutoreleasedReturnValue(v18);

      goto LABEL_19;
    }
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v6 = v9;
    v10 = CFSTR("ACCOUNT_LOCKOUT_HINT");
LABEL_7:
    v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedStringForKey:value:table:", v10, &stru_100069EB8, 0));
LABEL_19:

LABEL_20:
    v6 = (id)v11;
    goto LABEL_21;
  }
  if (objc_msgSend(v3, "code") == (id)-7006 || objc_msgSend(v3, "code") == (id)-7003)
  {
    v6 = 0;
    goto LABEL_21;
  }
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "userInfo"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectForKeyedSubscript:", NSLocalizedDescriptionKey));
  v21 = v20;
  if (v20)
  {
    v6 = v20;
  }
  else
  {
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "userInfo"));
    v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "objectForKeyedSubscript:", NSLocalizedFailureReasonErrorKey));

  }
  if (!objc_msgSend(v6, "length"))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v8 = v9;
    v10 = CFSTR("UNKNOWN_ERROR");
    goto LABEL_7;
  }
LABEL_21:

  return v6;
}

- (void)authBegan
{
  -[LUIAuthenticationController _disableUserInteractionAndPauseIdleTimer](self, "_disableUserInteractionAndPauseIdleTimer");
}

- (BOOL)_canLocallyAuthUser:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned int v8;
  NSObject *v9;
  BOOL v10;
  NSObject *v11;
  const char *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  NSDate *v17;
  void *v18;
  void *v19;
  id v20;
  NSObject *v21;
  int v23;
  uint64_t v24;

  v4 = a3;
  if (!v4)
  {
    v11 = qword_100088F30;
    v10 = 0;
    if (!os_log_type_enabled((os_log_t)qword_100088F30, OS_LOG_TYPE_DEFAULT))
      goto LABEL_21;
    LOWORD(v23) = 0;
    v12 = "User doesn't exist";
LABEL_15:
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)&v23, 2u);
    v10 = 0;
    goto LABEL_21;
  }
  if (+[LKPlatformSupport isInternalBuild](LKPlatformSupport, "isInternalBuild"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "username"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[LUIAuthenticationController _fakeAltDSIDForUsername:](self, "_fakeAltDSIDForUsername:", v5));

    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "alternateDSID"));
    v8 = objc_msgSend(v7, "isEqualToString:", v6);

    if (v8)
    {
      v9 = qword_100088F30;
      if (os_log_type_enabled((os_log_t)qword_100088F30, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v23) = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Internal hack: This is a local user, do local auth only", (uint8_t *)&v23, 2u);
      }

      v10 = 1;
      goto LABEL_21;
    }

  }
  if ((objc_msgSend(v4, "hasManagedCredentials") & 1) == 0)
  {
    v11 = qword_100088F30;
    v10 = 0;
    if (!os_log_type_enabled((os_log_t)qword_100088F30, OS_LOG_TYPE_DEFAULT))
      goto LABEL_21;
    LOWORD(v23) = 0;
    v12 = "User DOES NOT have managed credentials.";
    goto LABEL_15;
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[DMCMultiUserModeUtilities onlineAuthenticationGracePeriod](DMCMultiUserModeUtilities, "onlineAuthenticationGracePeriod"));
  v14 = v13;
  if (v13)
    v15 = (uint64_t)objc_msgSend(v13, "integerValue");
  else
    v15 = 7;
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "lastRemoteAuthDate"));
  v17 = objc_opt_new(NSDate);
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar calendarWithIdentifier:](NSCalendar, "calendarWithIdentifier:", NSCalendarIdentifierGregorian));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "components:fromDate:toDate:options:", 16, v16, v17, 0));
  v20 = objc_msgSend(v19, "day");
  v10 = (uint64_t)v20 < v15;
  if ((uint64_t)v20 >= v15)
  {
    v21 = qword_100088F30;
    if (os_log_type_enabled((os_log_t)qword_100088F30, OS_LOG_TYPE_DEFAULT))
    {
      v23 = 134217984;
      v24 = v15;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "User has not remotely authenticated in the last %ld days", (uint8_t *)&v23, 0xCu);
    }
  }

LABEL_21:
  return v10;
}

- (BOOL)_canLocallyAuthUserWithUsername:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  BOOL v8;
  int v10;
  id v11;

  v4 = a3;
  v5 = qword_100088F30;
  if (os_log_type_enabled((os_log_t)qword_100088F30, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138412290;
    v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Checking if we can locally auth user with username: %@", (uint8_t *)&v10, 0xCu);
  }
  if (v4)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UMUserManager sharedManager](UMUserManager, "sharedManager"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "userForUsername:", v4));

    v8 = -[LUIAuthenticationController _canLocallyAuthUser:](self, "_canLocallyAuthUser:", v7);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)_shouldBypassSetupAssistant
{
  unsigned int v2;
  void *v3;
  unsigned __int8 v4;

  v2 = +[LKPlatformSupport isInternalBuild](LKPlatformSupport, "isInternalBuild");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v4 = objc_msgSend(v3, "BOOLForKey:", CFSTR("LUIBypassSetupAssistant"));

    LOBYTE(v2) = v4;
  }
  return v2;
}

- (void)_presentAlertControllerForError:(id)a3 inNavigationController:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  char v10;
  _QWORD v11[5];
  _QWORD block[4];
  id v13;
  LUIAuthenticationController *v14;
  id v15;

  v6 = a3;
  v7 = a4;
  v8 = (void *)qword_100088F30;
  if (os_log_type_enabled((os_log_t)qword_100088F30, OS_LOG_TYPE_DEBUG))
    sub_10003C3E4(v8);
  -[LUIAuthenticationController stopProgressAnimation](self, "stopProgressAnimation");
  if (objc_msgSend(v6, "code") == (id)-7003)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[LUIAuthenticationController delegate](self, "delegate"));
    v10 = objc_opt_respondsToSelector(v9, "authenticationCanceled");

    if ((v10 & 1) != 0)
    {
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_100023624;
      v11[3] = &unk_100068C58;
      v11[4] = self;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, v11);
    }
  }
  else
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000235D4;
    block[3] = &unk_100068D60;
    v13 = v7;
    v14 = self;
    v15 = v6;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

  }
}

- (void)startProgressAnimation
{
  uint64_t v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  _QWORD block[4];
  id v10;

  v3 = objc_claimAutoreleasedReturnValue(-[LUIAuthenticationController delegate](self, "delegate"));
  if (v3)
  {
    v4 = (void *)v3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[LUIAuthenticationController delegate](self, "delegate"));
    v6 = objc_opt_respondsToSelector(v5, "progressView");

    if ((v6 & 1) != 0)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[LUIAuthenticationController delegate](self, "delegate"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "progressView"));

      if (v8)
      {
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_100023730;
        block[3] = &unk_100068C58;
        v10 = v8;
        dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

      }
    }
  }
}

- (void)stopProgressAnimation
{
  uint64_t v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  _QWORD block[4];
  id v10;

  v3 = objc_claimAutoreleasedReturnValue(-[LUIAuthenticationController delegate](self, "delegate"));
  if (v3)
  {
    v4 = (void *)v3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[LUIAuthenticationController delegate](self, "delegate"));
    v6 = objc_opt_respondsToSelector(v5, "progressView");

    if ((v6 & 1) != 0)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[LUIAuthenticationController delegate](self, "delegate"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "progressView"));

      if (v8)
      {
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_100023814;
        block[3] = &unk_100068C58;
        v10 = v8;
        dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

      }
    }
  }
}

- (id)navigationController
{
  if (qword_100088DC8 != -1)
    dispatch_once(&qword_100088DC8, &stru_100069A48);
  return (id)qword_100088DC0;
}

- (id)alertControllerForAuthError:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v14[4];
  id v15;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "userInfo"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", NSLocalizedDescriptionKey));

  if (!objc_msgSend(v4, "length"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("UNKNOWN_ERROR"), &stru_100069EB8, 0));

    v4 = (void *)v6;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", 0, v4, 1));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_100069EB8, 0));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100023A58;
  v14[3] = &unk_100068C08;
  v10 = v7;
  v15 = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v9, 0, v14));

  objc_msgSend(v10, "addAction:", v11);
  v12 = v10;

  return v12;
}

- (void)_enableUserInteractionAndStartIdleTimer
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[LUIUIUpdateSupport sharedInstance](LUIUIUpdateSupport, "sharedInstance"));
  objc_msgSend(v2, "reenableUserInteractionForReason:", CFSTR("User Login"));

  if (+[LUIAttentionAwareIdleTimer shouldSetupAttentionAwareIdleTimer](LUIAttentionAwareIdleTimer, "shouldSetupAttentionAwareIdleTimer"))
  {
    v3 = (id)objc_claimAutoreleasedReturnValue(+[LUIAttentionAwareIdleTimer sharedInstance](LUIAttentionAwareIdleTimer, "sharedInstance"));
    objc_msgSend(v3, "start");

  }
}

- (void)_disableUserInteractionAndPauseIdleTimer
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[LUIUIUpdateSupport sharedInstance](LUIUIUpdateSupport, "sharedInstance"));
  objc_msgSend(v2, "disableUserInteractionForReason:", CFSTR("User Login"));

  if (+[LUIAttentionAwareIdleTimer shouldSetupAttentionAwareIdleTimer](LUIAttentionAwareIdleTimer, "shouldSetupAttentionAwareIdleTimer"))
  {
    v3 = (id)objc_claimAutoreleasedReturnValue(+[LUIAttentionAwareIdleTimer sharedInstance](LUIAttentionAwareIdleTimer, "sharedInstance"));
    objc_msgSend(v3, "pause");

  }
}

- (void)invalidateAndNilTimer:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  if (v3)
  {
    v4 = v3;
    objc_msgSend(v3, "invalidate");

  }
}

- (void)_increaseTimeoutInterval
{
  double v3;
  double v4;

  -[LUIAuthenticationController timeoutInterval](self, "timeoutInterval");
  v4 = v3 + 30.0;
  if (v4 > 120.0)
    v4 = 120.0;
  -[LUIAuthenticationController setTimeoutInterval:](self, "setTimeoutInterval:", v4);
}

- (void)_queueBlock:(id)a3
{
  id v4;
  NSObject *v5;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[LUIAuthenticationController queue](self, "queue"));
  dispatch_async(v5, v4);

}

- (void)_savePreferences:(id)a3 forUsername:(id)a4
{
  const __CFDictionary *v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  NSString *v10;
  __CFString *v11;
  int v12;
  const __CFDictionary *v13;

  v5 = (const __CFDictionary *)a3;
  v6 = a4;
  v7 = qword_100088F38;
  if (os_log_type_enabled((os_log_t)qword_100088F38, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 138412290;
    v13 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Setting preferences before login: %@", (uint8_t *)&v12, 0xCu);
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UMUserManager sharedManager](UMUserManager, "sharedManager"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "userForUsername:", v6));

  v10 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", getpwuid((uid_t)objc_msgSend(v9, "uid"))->pw_name);
  v11 = (__CFString *)objc_claimAutoreleasedReturnValue(v10);
  _CFPreferencesWriteUserPreferencesWithCorrectOwner();
  CFPreferencesSetMultiple(v5, 0, kCFPreferencesAnyApplication, v11, kCFPreferencesAnyHost);

}

- (unint64_t)passcodeLockGracePeriod
{
  void *v2;
  void *v3;
  id v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](MCProfileConnection, "sharedConnection"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "effectiveValueForSetting:", MCFeaturePasscodeLockGraceTime));
  v4 = objc_msgSend(v3, "unsignedLongValue");

  return (unint64_t)v4;
}

- (void)setupPasscodeViewControllerEventAction:(id)a3 forUser:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;
  _QWORD v20[5];
  id v21;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[LUIAuthenticationController _createInitialConfigurationForUser:](self, "_createInitialConfigurationForUser:", a4));
  objc_msgSend(v7, "setCanLoginWithLocalAuthOnly:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[LUIAuthenticationController _createInitialEnvironment](self, "_createInitialEnvironment"));
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100023F38;
  v20[3] = &unk_100068C30;
  v20[4] = self;
  v9 = v7;
  v21 = v9;
  objc_msgSend(v6, "setPasscodeViewDidAppearAction:", v20);
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100023F44;
  v17[3] = &unk_100068D60;
  v17[4] = self;
  v10 = v9;
  v18 = v10;
  v11 = v8;
  v19 = v11;
  objc_msgSend(v6, "setPasscodeCanceledAction:", v17);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100023F54;
  v14[3] = &unk_1000698E8;
  v14[4] = self;
  v15 = v10;
  v16 = v11;
  v12 = v11;
  v13 = v10;
  objc_msgSend(v6, "setPasscodeEnteredAction:", v14);

}

- (id)_nameOfStep:(unint64_t)a3
{
  if (a3 - 1 > 0xA)
    return CFSTR("LoginFlowStepEntrance");
  else
    return *(&off_100069A68 + a3 - 1);
}

- (void)contextWillBeginPresentingSecondaryUI:(id)a3
{
  NSObject *v4;
  _QWORD v5[5];
  uint8_t buf[16];

  v4 = qword_100088F30;
  if (os_log_type_enabled((os_log_t)qword_100088F30, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "WillBeginPresentingSecondaryUI", buf, 2u);
  }
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10002410C;
  v5[3] = &unk_100068C58;
  v5[4] = self;
  -[LUIAuthenticationController _queueBlock:](self, "_queueBlock:", v5);
  -[LUIAuthenticationController stopProgressAnimation](self, "stopProgressAnimation");
  -[LUIAuthenticationController _enableUserInteractionAndStartIdleTimer](self, "_enableUserInteractionAndStartIdleTimer");
}

- (void)contextDidEndPresentingSecondaryUI:(id)a3
{
  NSObject *v4;
  _QWORD v5[5];
  uint8_t buf[16];

  v4 = qword_100088F30;
  if (os_log_type_enabled((os_log_t)qword_100088F30, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "DidEndPresentingSecondaryUI", buf, 2u);
  }
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000241BC;
  v5[3] = &unk_100068C58;
  v5[4] = self;
  -[LUIAuthenticationController _queueBlock:](self, "_queueBlock:", v5);
}

- (BOOL)_isAuthErrorWithServerErrorCode:(int64_t)a3 error:(id)a4
{
  id v5;
  void *v6;
  unsigned int v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  unsigned __int8 v13;
  void *v14;
  void *v15;
  uint64_t v16;
  BOOL v17;
  uint64_t v18;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "domain"));
  v7 = objc_msgSend(v6, "isEqualToString:", AKAppleIDAuthenticationErrorDomain);

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "userInfo"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", NSUnderlyingErrorKey));

    v10 = objc_opt_class(NSError);
    if ((objc_opt_isKindOfClass(v9, v10) & 1) != 0)
    {
      v11 = AKAppleIDAuthenticationServerErrorDomain;
      while (1)
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "domain"));
        v13 = objc_msgSend(v12, "isEqualToString:", v11);

        if ((v13 & 1) != 0)
          break;
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "userInfo"));
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", NSUnderlyingErrorKey));

        v16 = objc_opt_class(NSError);
        v9 = v15;
        if ((objc_opt_isKindOfClass(v15, v16) & 1) == 0)
          goto LABEL_9;
      }
    }
    v15 = v9;
LABEL_9:
    v18 = objc_opt_class(NSError);
    v17 = (objc_opt_isKindOfClass(v15, v18) & 1) != 0 && objc_msgSend(v15, "code") == (id)a3;

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (BOOL)_isUnmanagedDeviceError:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  if (-[LUIAuthenticationController _isAuthErrorWithServerErrorCode:error:](self, "_isAuthErrorWithServerErrorCode:error:", -22425, v4))
  {
    v5 = 1;
  }
  else
  {
    v5 = -[LUIAuthenticationController _isAuthErrorWithServerErrorCode:error:](self, "_isAuthErrorWithServerErrorCode:error:", -22424, v4);
  }

  return v5;
}

- (BOOL)_isRestrictionlessLoginEnabled
{
  unsigned int v2;
  void *v3;
  void *v4;
  unsigned __int8 v5;

  v2 = +[LKPlatformSupport isInternalBuild](LKPlatformSupport, "isInternalBuild");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[LKUniversalDiskStorage sharedStorage](LKUniversalDiskStorage, "sharedStorage"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "retrieveValueForKey:", LPKIsRestrictionlessLoginEnabled));
    v5 = objc_msgSend(v4, "BOOLValue");

    LOBYTE(v2) = v5;
  }
  return v2;
}

- (id)_fakeRestrictionlessLoginAuthenticationResultsWithConfiguration:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint8_t buf[8];
  const __CFString *v16;
  void *v17;
  const __CFString *v18;
  void *v19;
  _QWORD v20[4];
  _QWORD v21[4];

  v3 = a3;
  v4 = qword_100088F30;
  if (os_log_type_enabled((os_log_t)qword_100088F30, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Fake an authentication results", buf, 2u);
  }
  v20[0] = AKAuthenticationFirstNameKey;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "user"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "username"));
  v21[0] = v6;
  v20[1] = AKAuthenticationAlternateDSIDKey;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "user"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "username"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), CFSTR("restrictionlessLogin"), v8));
  v21[1] = v9;
  v20[2] = AKAuthenticationShortLivedTokenKey;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "passcode"));
  v21[2] = v10;
  v20[3] = AKAuthenticationConfigurationInfoKey;
  v18 = CFSTR("com.apple.idms.config.BuddyData");
  v16 = CFSTR("SetupDone");
  v17 = &__kCFBooleanTrue;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1));
  v19 = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1));
  v21[3] = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v21, v20, 4));

  return v13;
}

- (id)_updatedAuthenticationResultsForVeryFirstTimeLogin:(id)a3
{
  id v3;
  id v4;

  v3 = objc_msgSend(a3, "mutableCopy");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", 0, CFSTR("SetupDone"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, AKAuthenticationIsPasscodeResetRequiredKey);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, AKAuthenticationIsServerUIRequiredKey);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", 0, CFSTR("AppleLanguages"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", 0, CFSTR("AppleLocale"));
  v4 = objc_msgSend(v3, "copy");

  return v4;
}

- (id)_fakeAltDSIDForUsername:(id)a3
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%lu%@"), (unint64_t)objc_msgSend(a3, "hash") % 0xF4240, CFSTR("-12-0a1b2c3d-1234-1234-1234-0123456789ab"));
}

- (LUIAuthenticationControllerDelegate)delegate
{
  return (LUIAuthenticationControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (NSMutableDictionary)authModeCache
{
  return self->_authModeCache;
}

- (void)setAuthModeCache:(id)a3
{
  objc_storeStrong((id *)&self->_authModeCache, a3);
}

- (double)timeoutInterval
{
  return self->_timeoutInterval;
}

- (void)setTimeoutInterval:(double)a3
{
  self->_timeoutInterval = a3;
}

- (BOOL)isPresentingFedAuthPrompt
{
  return self->_isPresentingFedAuthPrompt;
}

- (void)setIsPresentingFedAuthPrompt:(BOOL)a3
{
  self->_isPresentingFedAuthPrompt = a3;
}

- (LUISyncBubbleController)syncBubbleController
{
  return self->_syncBubbleController;
}

- (void)setSyncBubbleController:(id)a3
{
  objc_storeStrong((id *)&self->_syncBubbleController, a3);
}

- (BOOL)isLoginOngoing
{
  return self->_isLoginOngoing;
}

- (void)setIsLoginOngoing:(BOOL)a3
{
  self->_isLoginOngoing = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syncBubbleController, 0);
  objc_storeStrong((id *)&self->_authModeCache, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
