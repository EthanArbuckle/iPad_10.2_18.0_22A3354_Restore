@implementation StartPreflightViewController

- (void)setupWithInputs:(id)a3 responder:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  _BOOL4 v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  NSObject *v28;
  void *v29;
  void *v30;
  dispatch_semaphore_t v31;
  _QWORD v32[4];
  id v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t v37;
  _BYTE buf[24];
  void *v39;
  uint64_t *v40;

  v6 = a3;
  v7 = a4;
  v9 = handleForCategory(0, v8);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    *(_QWORD *)&buf[4] = "-[StartPreflightViewController setupWithInputs:responder:]";
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v6;
    *(_WORD *)&buf[22] = 2112;
    v39 = v7;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s: %@, %@", buf, 0x20u);
  }

  -[StartPreflightViewController setInputs:](self, "setInputs:", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[StartPreflightViewController inputs](self, "inputs"));
  v12 = v11 == 0;

  if (v12)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[StartPreflightViewController result](self, "result"));
    objc_msgSend(v14, "setStatusCode:", &off_1000154A0);

    -[StartPreflightViewController setFinished:](self, "setFinished:", 1);
  }
  v15 = handleForCategory(0, v13);
  v16 = objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Register physical button events", buf, 2u);
  }

  if (!qword_10001A1A0)
  {
    *(_OWORD *)buf = off_100014790;
    *(_QWORD *)&buf[16] = 0;
    qword_10001A1A0 = _sl_dlopen(buf, 0);
  }
  if (!qword_10001A1A0)
  {
    v18 = handleForCategory(0, v17);
    v19 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      sub_10000C6BC();

    v20 = (void *)objc_claimAutoreleasedReturnValue(-[StartPreflightViewController result](self, "result"));
    objc_msgSend(v20, "setStatusCode:", &off_1000154B8);

    -[StartPreflightViewController setFinished:](self, "setFinished:", 1);
  }
  v34 = 0;
  v35 = &v34;
  v36 = 0x2050000000;
  v21 = (void *)qword_10001A1A8;
  v37 = qword_10001A1A8;
  if (!qword_10001A1A8)
  {
    *(_QWORD *)buf = _NSConcreteStackBlock;
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = sub_100008CD8;
    v39 = &unk_1000147B0;
    v40 = &v34;
    sub_100008CD8((uint64_t)buf);
    v21 = (void *)v35[3];
  }
  v22 = objc_retainAutorelease(v21);
  _Block_object_dispose(&v34, 8);
  v24 = (void *)objc_opt_new(v22, v23);
  -[StartPreflightViewController setButtonEventMonitor:](self, "setButtonEventMonitor:", v24);

  v25 = (void *)objc_claimAutoreleasedReturnValue(-[StartPreflightViewController buttonEventMonitor](self, "buttonEventMonitor"));
  LODWORD(v24) = v25 == 0;

  if ((_DWORD)v24)
  {
    v27 = handleForCategory(0, v26);
    v28 = objc_claimAutoreleasedReturnValue(v27);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      sub_10000C690();

    v29 = (void *)objc_claimAutoreleasedReturnValue(-[StartPreflightViewController result](self, "result"));
    objc_msgSend(v29, "setStatusCode:", &off_1000154B8);

    -[StartPreflightViewController setFinished:](self, "setFinished:", 1);
  }
  objc_initWeak((id *)buf, self);
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[StartPreflightViewController buttonEventMonitor](self, "buttonEventMonitor"));
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = sub_100006838;
  v32[3] = &unk_100014720;
  objc_copyWeak(&v33, (id *)buf);
  objc_msgSend(v30, "startWithPriority:completion:", 200, v32);

  v31 = dispatch_semaphore_create(0);
  -[StartPreflightViewController setUiNeededKnownSemaphore:](self, "setUiNeededKnownSemaphore:", v31);

  -[StartPreflightViewController setActivationLockChallengeNeeded:](self, "setActivationLockChallengeNeeded:", 0);
  objc_destroyWeak(&v33);
  objc_destroyWeak((id *)buf);

}

- (void)start
{
  uint64_t v3;
  char v4;
  NSObject *v5;
  unsigned __int8 v6;
  id v7;
  unsigned __int8 v8;
  NSObject *v9;
  NSObject *v10;
  StartPreflightViewController *v11;
  uint64_t v12;
  id v13;
  id v14;

  v3 = objc_claimAutoreleasedReturnValue(-[StartPreflightViewController result](self, "result"));
  objc_msgSend((id)v3, "setStatusCode:", &off_1000154D0);

  LOBYTE(v3) = MGGetBoolAnswer(CFSTR("InternalBuild"));
  v4 = MGGetBoolAnswer(CFSTR("3kmXfug8VcxLI5yEmsqQKw"));
  if ((v3 & 1) == 0 && (v4 & 1) == 0)
  {
    v5 = objc_claimAutoreleasedReturnValue(-[StartPreflightViewController uiNeededKnownSemaphore](self, "uiNeededKnownSemaphore"));
    dispatch_semaphore_signal(v5);

    -[StartPreflightViewController endTestWithStatusCode:error:](self, "endTestWithStatusCode:error:", -6, 0);
    return;
  }
  v14 = 0;
  v6 = -[StartPreflightViewController preflightPhase1:](self, "preflightPhase1:", &v14);
  v7 = v14;
  if ((v6 & 1) != 0)
  {
    v8 = -[StartPreflightViewController activationLockCheck](self, "activationLockCheck");
    v9 = objc_claimAutoreleasedReturnValue(-[StartPreflightViewController uiNeededKnownSemaphore](self, "uiNeededKnownSemaphore"));
    dispatch_semaphore_signal(v9);

    if ((v8 & 1) != 0)
    {
      if (-[StartPreflightViewController activationLockChallengeNeeded](self, "activationLockChallengeNeeded"))
        -[StartPreflightViewController setupActivationLockView](self, "setupActivationLockView");
      else
        -[StartPreflightViewController activationLockComplete](self, "activationLockComplete");
      goto LABEL_11;
    }
    v11 = self;
    v12 = -77;
    v13 = 0;
  }
  else
  {
    v10 = objc_claimAutoreleasedReturnValue(-[StartPreflightViewController uiNeededKnownSemaphore](self, "uiNeededKnownSemaphore"));
    dispatch_semaphore_signal(v10);

    v11 = self;
    v12 = -78;
    v13 = v7;
  }
  -[StartPreflightViewController endTestWithStatusCode:error:](v11, "endTestWithStatusCode:error:", v12, v13);
LABEL_11:

}

- (void)cancel
{
  uint64_t v3;
  NSObject *v4;
  int v5;
  const char *v6;

  v3 = handleForCategory(0, a2);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315138;
    v6 = "-[StartPreflightViewController cancel]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v5, 0xCu);
  }

  -[StartPreflightViewController setFinished:](self, "setFinished:", 1);
}

- (void)teardown
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  _QWORD v6[5];
  uint8_t buf[4];
  const char *v8;

  v3 = handleForCategory(0, a2);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v8 = "-[StartPreflightViewController teardown]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[StartPreflightViewController buttonEventMonitor](self, "buttonEventMonitor"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100006BA4;
  v6[3] = &unk_100014748;
  v6[4] = self;
  objc_msgSend(v5, "stopWithCompletion:", v6);

}

- (BOOL)shouldPresentInHostApp
{
  uint64_t v3;
  NSObject *v4;
  NSObject *v5;
  int v7;
  const char *v8;

  v3 = handleForCategory(0, a2);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315138;
    v8 = "-[StartPreflightViewController shouldPresentInHostApp]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v7, 0xCu);
  }

  v5 = objc_claimAutoreleasedReturnValue(-[StartPreflightViewController uiNeededKnownSemaphore](self, "uiNeededKnownSemaphore"));
  dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);

  return -[StartPreflightViewController activationLockChallengeNeeded](self, "activationLockChallengeNeeded");
}

- (void)viewDidLoad
{
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  objc_super v5;
  uint8_t buf[4];
  const char *v7;

  v5.receiver = self;
  v5.super_class = (Class)StartPreflightViewController;
  -[StartPreflightViewController viewDidLoad](&v5, "viewDidLoad");
  v3 = handleForCategory(0, v2);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v7 = "-[StartPreflightViewController viewDidLoad]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

}

- (void)viewDidAppear:(BOOL)a3
{
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  objc_super v6;
  uint8_t buf[4];
  const char *v8;

  v6.receiver = self;
  v6.super_class = (Class)StartPreflightViewController;
  -[StartPreflightViewController viewDidAppear:](&v6, "viewDidAppear:", a3);
  v4 = handleForCategory(0, v3);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v8 = "-[StartPreflightViewController viewDidAppear:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

}

- (void)setupActivationLockView
{
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  ChimeraLockViewController *v11;
  void *v12;
  void *v13;
  void *v14;
  ChimeraLockViewController *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  id v20;
  id v21;
  uint64_t v22;
  void *j;
  void *v24;
  TokenChallenger *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  TokenChallenger *v31;
  uint64_t v32;
  ActivationLockViewController *v33;
  ActivationLockViewController *v34;
  void *v35;
  void *v36;
  void *v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  id obj;
  id obja;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  _BYTE v65[128];
  uint8_t v66[128];
  uint8_t buf[4];
  const char *v68;

  v2 = handleForCategory(0, a2);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v68 = "-[StartPreflightViewController setupActivationLockView]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  -[StartPreflightViewController setShouldShowPressHomeLabel:](self, "setShouldShowPressHomeLabel:", 0);
  v5 = (void *)objc_opt_new(NSMutableArray, v4);
  -[StartPreflightViewController setViewControllers:](self, "setViewControllers:", v5);

  v63 = 0u;
  v64 = 0u;
  v61 = 0u;
  v62 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(-[StartPreflightViewController chimeraLockComponents](self, "chimeraLockComponents"));
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v61, v66, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v62;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v62 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * (_QWORD)i);
        v11 = [ChimeraLockViewController alloc];
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("spc")));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectAtIndexedSubscript:", 0));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("status")));
        v15 = -[ChimeraLockViewController initWithComponent:status:](v11, "initWithComponent:status:", v13, v14);

        if (v15)
        {
          -[ChimeraLockViewController setCoordinator:](v15, "setCoordinator:", self);
          v16 = (void *)objc_claimAutoreleasedReturnValue(-[StartPreflightViewController viewControllers](self, "viewControllers"));
          objc_msgSend(v16, "addObject:", v15);

        }
      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v61, v66, 16);
    }
    while (v7);
  }

  v53 = (void *)objc_opt_new(IDMSAuthenticator, v17);
  v19 = (void *)objc_opt_new(NSMutableArray, v18);
  v57 = 0u;
  v58 = 0u;
  v59 = 0u;
  v60 = 0u;
  obja = (id)objc_claimAutoreleasedReturnValue(-[StartPreflightViewController activationLockComponents](self, "activationLockComponents"));
  v20 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v57, v65, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v58;
    do
    {
      for (j = 0; j != v21; j = (char *)j + 1)
      {
        if (*(_QWORD *)v58 != v22)
          objc_enumerationMutation(obja);
        v24 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * (_QWORD)j);
        v25 = [TokenChallenger alloc];
        v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("token")));
        v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("spc")));
        v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("type")));
        v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("endpoint")));
        v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v29));
        v31 = -[TokenChallenger initWithToken:components:fdrTypes:endpoint:signer:](v25, "initWithToken:components:fdrTypes:endpoint:signer:", v26, v27, v28, v30, self);
        objc_msgSend(v19, "addObject:", v31);

      }
      v21 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v57, v65, 16);
    }
    while (v21);
  }

  if (objc_msgSend(v19, "count"))
  {
    v33 = -[ActivationLockViewController initWithTokenChallengers:authenticator:]([ActivationLockViewController alloc], "initWithTokenChallengers:authenticator:", v19, v53);
    v34 = v33;
    if (v33)
    {
      -[ActivationLockViewController setCoordinator:](v33, "setCoordinator:", self);
      v35 = (void *)objc_claimAutoreleasedReturnValue(-[StartPreflightViewController viewControllers](self, "viewControllers"));
      objc_msgSend(v35, "addObject:", v34);

    }
  }
  v36 = (void *)objc_opt_new(UINavigationController, v32);
  -[StartPreflightViewController setNavigationController:](self, "setNavigationController:", v36);

  v37 = (void *)objc_claimAutoreleasedReturnValue(-[StartPreflightViewController view](self, "view"));
  objc_msgSend(v37, "bounds");
  v39 = v38;
  v41 = v40;
  v43 = v42;
  v45 = v44;
  v46 = (void *)objc_claimAutoreleasedReturnValue(-[StartPreflightViewController navigationController](self, "navigationController"));
  v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "view"));
  objc_msgSend(v47, "setFrame:", v39, v41, v43, v45);

  v48 = (void *)objc_claimAutoreleasedReturnValue(-[StartPreflightViewController view](self, "view"));
  v49 = (void *)objc_claimAutoreleasedReturnValue(-[StartPreflightViewController navigationController](self, "navigationController"));
  v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "view"));
  objc_msgSend(v48, "addSubview:", v50);

  v51 = (void *)objc_claimAutoreleasedReturnValue(-[StartPreflightViewController navigationController](self, "navigationController"));
  -[StartPreflightViewController addChildViewController:](self, "addChildViewController:", v51);

  -[StartPreflightViewController moveToNextViewController](self, "moveToNextViewController");
  v52 = (void *)objc_claimAutoreleasedReturnValue(-[StartPreflightViewController navigationController](self, "navigationController"));
  objc_msgSend(v52, "didMoveToParentViewController:", self);

}

- (void)moveToNextViewController
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  const char *v16;

  v3 = handleForCategory(0, a2);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v15 = 136315138;
    v16 = "-[StartPreflightViewController moveToNextViewController]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v15, 0xCu);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[StartPreflightViewController viewControllers](self, "viewControllers"));
  v6 = objc_msgSend(v5, "count");

  v8 = handleForCategory(0, v7);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v10)
    {
      LOWORD(v15) = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Move to next view", (uint8_t *)&v15, 2u);
    }

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[StartPreflightViewController navigationController](self, "navigationController"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[StartPreflightViewController viewControllers](self, "viewControllers"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectAtIndexedSubscript:", 0));
    objc_msgSend(v11, "pushViewController:animated:", v13, 1);

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[StartPreflightViewController viewControllers](self, "viewControllers"));
    objc_msgSend(v14, "removeObjectAtIndex:", 0);

  }
  else
  {
    if (v10)
    {
      LOWORD(v15) = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "No more views. Activation lock complete", (uint8_t *)&v15, 2u);
    }

    -[StartPreflightViewController activationLockComplete](self, "activationLockComplete");
  }
}

- (void)handleButtonEvent:(unint64_t)a3
{
  uint64_t v4;
  NSObject *v5;
  int v6;
  unint64_t v7;

  v4 = handleForCategory(0, a2);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 134217984;
    v7 = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Physical button event: %ld", (uint8_t *)&v6, 0xCu);
  }

}

- (void)endTestWithStatusCode:(int64_t)a3 error:(id)a4
{
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
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  uint64_t v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  NSObject *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  _QWORD v43[2];
  _QWORD v44[2];
  _QWORD v45[4];
  _QWORD v46[4];

  v6 = a4;
  if (a3)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a3));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[StartPreflightViewController result](self, "result"));
    objc_msgSend(v8, "setStatusCode:", v7);

    v43[0] = CFSTR("error");
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "description"));
    v10 = v9;
    if (!v9)
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
    v43[1] = CFSTR("errorCode");
    v44[0] = v10;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v6, "code")));
    v12 = v11;
    if (!v11)
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
    v44[1] = v12;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v44, v43, 2));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[StartPreflightViewController result](self, "result"));
    objc_msgSend(v14, "setData:", v13);

    if (!v11)
    if (!v9)

    -[StartPreflightViewController setFinished:](self, "setFinished:", 1);
    goto LABEL_42;
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[StartPreflightViewController preflightRIK](self, "preflightRIK"));

  if (!v15)
  {
    v17 = 0;
    goto LABEL_17;
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[StartPreflightViewController preflightRIK](self, "preflightRIK"));
  v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "base64EncodedStringWithOptions:", 0));

  if (v17)
  {
LABEL_17:
    v21 = 0;
    goto LABEL_18;
  }
  v19 = handleForCategory(0, v18);
  v20 = objc_claimAutoreleasedReturnValue(v19);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    sub_10000C714();

  v17 = 0;
  v21 = -87;
LABEL_18:
  v22 = (id)objc_claimAutoreleasedReturnValue(-[StartPreflightViewController preflightResults](self, "preflightResults"));

  if (v22)
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[StartPreflightViewController preflightResults](self, "preflightResults"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[CRPreflightUtils spcResults:](CRPreflightUtils, "spcResults:", v23));

    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("sealed")));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("pass")));
    v22 = objc_msgSend(v26, "mutableCopy");
    if (v25 && objc_msgSend(v25, "count"))
      objc_msgSend(v22, "addObject:", CFSTR("RECOVER"));
    if (!v22 || !objc_msgSend(v22, "count"))
    {
      v28 = handleForCategory(0, v27);
      v29 = objc_claimAutoreleasedReturnValue(v28);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        sub_10000C6E8();

      v21 = -88;
    }

  }
  v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v21));
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[StartPreflightViewController result](self, "result"));
  objc_msgSend(v31, "setStatusCode:", v30);

  v45[0] = CFSTR("error");
  v32 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "description"));
  v33 = (void *)v32;
  if (!v32)
    v32 = objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v41 = (void *)v32;
  v42 = v6;
  v46[0] = v32;
  v45[1] = CFSTR("errorCode");
  v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v6, "code")));
  v35 = v34;
  if (!v34)
    v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v46[1] = v35;
  v45[2] = CFSTR("preflightRIK");
  v36 = (void *)v17;
  v37 = (void *)v17;
  if (!v17)
    v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v46[2] = v36;
  v45[3] = CFSTR("preflightPartSPC");
  v38 = v22;
  if (!v22)
    v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v46[3] = v38;
  v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v46, v45, 4));
  v40 = (void *)objc_claimAutoreleasedReturnValue(-[StartPreflightViewController result](self, "result"));
  objc_msgSend(v40, "setData:", v39);

  if (v22)
  {
    if (v37)
      goto LABEL_38;
LABEL_44:

    if (v34)
      goto LABEL_39;
LABEL_45:

    goto LABEL_39;
  }

  if (!v37)
    goto LABEL_44;
LABEL_38:
  if (!v34)
    goto LABEL_45;
LABEL_39:

  if (!v33)
  -[StartPreflightViewController setFinished:](self, "setFinished:", 1);

  v6 = v42;
LABEL_42:

}

- (BOOL)activationLockCheck
{
  StartPreflightViewController *v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  unsigned __int8 v25;
  unsigned int v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  NSObject *v30;
  uint64_t v31;
  uint64_t v32;
  NSObject *v33;
  BOOL v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  NSObject *v40;
  StartPreflightViewController *v43;
  id obj;
  void *v45;
  void *v46;
  uint8_t buf[16];
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];

  v2 = self;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[StartPreflightViewController preflightResponsePhase1](self, "preflightResponsePhase1"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[CRPreflightUtils activationResults:](CRPreflightUtils, "activationResults:", v3));

  v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  obj = v4;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v52, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v49;
    v43 = v2;
LABEL_3:
    v8 = 0;
    while (1)
    {
      if (*(_QWORD *)v49 != v7)
        objc_enumerationMutation(obj);
      v9 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("status"), v43));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("spc")));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("type")));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("endpoint")));
      v14 = objc_opt_class(NSArray);
      if ((objc_opt_isKindOfClass(v11, v14) & 1) == 0)
      {
        v36 = handleForCategory(0, v15);
        v40 = objc_claimAutoreleasedReturnValue(v36);
        if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
          sub_10000C870();
        goto LABEL_39;
      }
      v16 = objc_opt_class(NSArray);
      if ((objc_opt_isKindOfClass(v12, v16) & 1) == 0)
      {
        v37 = handleForCategory(0, v17);
        v40 = objc_claimAutoreleasedReturnValue(v37);
        if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
          sub_10000C844();
        goto LABEL_39;
      }
      if (!objc_msgSend(v11, "count")
        || !objc_msgSend(v12, "count")
        || (v19 = objc_msgSend(v11, "count"), v19 != objc_msgSend(v12, "count")))
      {
        v35 = handleForCategory(0, v18);
        v40 = objc_claimAutoreleasedReturnValue(v35);
        if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
          sub_10000C740(v11, v12, v40);
        goto LABEL_39;
      }
      if (objc_msgSend(v10, "isEqualToString:", CFSTR("CHALLENGED")))
      {
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("token")));

        if (!v20)
        {
          v38 = handleForCategory(0, v21);
          v40 = objc_claimAutoreleasedReturnValue(v38);
          if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
            sub_10000C7EC();
          goto LABEL_39;
        }
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("endpoint")));

        v24 = v45;
        if (!v22)
        {
          v39 = handleForCategory(0, v23);
          v40 = objc_claimAutoreleasedReturnValue(v39);
          if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
            sub_10000C818();
LABEL_39:
          v27 = obj;

          v34 = 0;
          goto LABEL_40;
        }
      }
      else
      {
        v25 = objc_msgSend(v10, "isEqualToString:", CFSTR("DENIED"));
        v24 = v46;
        if ((v25 & 1) == 0)
        {
          v26 = objc_msgSend(v10, "isEqualToString:", CFSTR("DENIED"));
          v24 = v46;
          if (!v26)
            goto LABEL_18;
        }
      }
      objc_msgSend(v24, "addObject:", v9);
LABEL_18:

      if (v6 == (id)++v8)
      {
        v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v52, 16);
        v2 = v43;
        if (v6)
          goto LABEL_3;
        break;
      }
    }
  }
  v27 = obj;

  if (objc_msgSend(v46, "count"))
  {
    v29 = handleForCategory(0, v28);
    v30 = objc_claimAutoreleasedReturnValue(v29);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Chimera lock needed", buf, 2u);
    }

    -[StartPreflightViewController setChimeraLockComponents:](v2, "setChimeraLockComponents:", v46);
    -[StartPreflightViewController setActivationLockChallengeNeeded:](v2, "setActivationLockChallengeNeeded:", 1);
  }
  if (objc_msgSend(v45, "count"))
  {
    v32 = handleForCategory(0, v31);
    v33 = objc_claimAutoreleasedReturnValue(v32);
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "Activation lock needed", buf, 2u);
    }

    -[StartPreflightViewController setActivationLockComponents:](v2, "setActivationLockComponents:", v45);
    v34 = 1;
    -[StartPreflightViewController setActivationLockChallengeNeeded:](v2, "setActivationLockChallengeNeeded:", 1);
  }
  else
  {
    v34 = 1;
  }
LABEL_40:

  return v34;
}

- (BOOL)preflightPhase1:(id *)a3
{
  id v5;
  dispatch_semaphore_t v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  dispatch_time_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  BOOL v14;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void **v26;
  uint64_t v27;
  void (*v28)(uint64_t, int, void *, void *);
  void *v29;
  NSObject *v30;
  uint64_t *v31;
  uint64_t *v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t (*v43)(uint64_t, uint64_t);
  void (*v44)(uint64_t);
  id v45;
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  char v49;

  v46 = 0;
  v47 = &v46;
  v48 = 0x2020000000;
  v49 = 0;
  v40 = 0;
  v41 = &v40;
  v42 = 0x3032000000;
  v43 = sub_1000082D4;
  v44 = sub_1000082E4;
  v45 = 0;
  v34 = 0;
  v35 = &v34;
  v36 = 0x3032000000;
  v37 = sub_1000082D4;
  v38 = sub_1000082E4;
  v39 = 0;
  v5 = objc_alloc_init((Class)NSMutableDictionary);
  v6 = dispatch_semaphore_create(0);
  v8 = (void *)objc_opt_new(CRPreflightController, v7);
  v26 = _NSConcreteStackBlock;
  v27 = 3221225472;
  v28 = sub_1000082EC;
  v29 = &unk_100014770;
  v31 = &v46;
  v32 = &v40;
  v33 = &v34;
  v9 = v6;
  v30 = v9;
  objc_msgSend(v8, "preflightPhase1:withReply:", v5, &v26);
  v10 = dispatch_time(0, 120000000000);
  if (dispatch_semaphore_wait(v9, v10))
  {
    v12 = handleForCategory(0, v11);
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      sub_10000C8F4();
LABEL_4:

    goto LABEL_5;
  }
  if (*((_BYTE *)v47 + 24) && !v35[5])
  {
    v18 = (void *)v41[5];
    if (v18)
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("keyBlob"), v26, v27, v28, v29));
      if (v19)
      {
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v41[5], "objectForKeyedSubscript:", CFSTR("baaCert")));
        if (v20)
        {
          v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v41[5], "objectForKeyedSubscript:", CFSTR("responsePhase1")));

          if (v21)
          {
            v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v41[5], "objectForKeyedSubscript:", CFSTR("keyBlob")));
            -[StartPreflightViewController setPreflightRIK:](self, "setPreflightRIK:", v22);

            v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v41[5], "objectForKeyedSubscript:", CFSTR("baaCert")));
            -[StartPreflightViewController setPreflightBaaCert:](self, "setPreflightBaaCert:", v23);

            v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v41[5], "objectForKeyedSubscript:", CFSTR("responsePhase1")));
            -[StartPreflightViewController setPreflightResponsePhase1:](self, "setPreflightResponsePhase1:", v24);

            v14 = 1;
            goto LABEL_6;
          }
        }
        else
        {

        }
      }
    }
    v25 = handleForCategory(0, v11);
    v13 = objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      sub_10000C8C8();
    goto LABEL_4;
  }
  v16 = handleForCategory(0, v11);
  v17 = objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    sub_10000C89C();

  if (a3)
  {
    v14 = 0;
    *a3 = objc_retainAutorelease((id)v35[5]);
    goto LABEL_6;
  }
LABEL_5:
  v14 = 0;
LABEL_6:

  _Block_object_dispose(&v34, 8);
  _Block_object_dispose(&v40, 8);

  _Block_object_dispose(&v46, 8);
  return v14;
}

- (BOOL)preflightPhase2:(id *)a3
{
  void *v5;
  dispatch_semaphore_t v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  dispatch_time_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  BOOL v15;
  uint64_t v17;
  NSObject *v18;
  uint8_t v19[16];
  _QWORD v20[4];
  NSObject *v21;
  uint64_t *v22;
  uint64_t *v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  char v40;

  v5 = (void *)objc_opt_new(CRPreflightController, a2);
  v37 = 0;
  v38 = &v37;
  v39 = 0x2020000000;
  v40 = 0;
  v31 = 0;
  v32 = &v31;
  v33 = 0x3032000000;
  v34 = sub_1000082D4;
  v35 = sub_1000082E4;
  v36 = 0;
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = sub_1000082D4;
  v29 = sub_1000082E4;
  v30 = 0;
  v6 = dispatch_semaphore_create(0);
  v7 = objc_alloc_init((Class)NSMutableDictionary);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[StartPreflightViewController preflightRIK](self, "preflightRIK"));
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("keyBlob"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[StartPreflightViewController preflightResponsePhase1](self, "preflightResponsePhase1"));
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v9, CFSTR("responsePhase1"));

  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_10000878C;
  v20[3] = &unk_100014770;
  v22 = &v37;
  v23 = &v31;
  v24 = &v25;
  v10 = v6;
  v21 = v10;
  objc_msgSend(v5, "preflightPhase2:withReply:", v7, v20);
  v11 = dispatch_time(0, 120000000000);
  if (dispatch_semaphore_wait(v10, v11))
  {
    v13 = handleForCategory(0, v12);
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      sub_10000C920();

  }
  else
  {
    if (*((_BYTE *)v38 + 24) && !v26[5])
    {
      -[StartPreflightViewController setPreflightResults:](self, "setPreflightResults:", v32[5]);
      v15 = 1;
      goto LABEL_6;
    }
    v17 = handleForCategory(0, v12);
    v18 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v19 = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Preflight phase 2 failed", v19, 2u);
    }

    if (a3)
    {
      v15 = 0;
      *a3 = objc_retainAutorelease((id)v26[5]);
      goto LABEL_6;
    }
  }
  v15 = 0;
LABEL_6:

  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v31, 8);

  _Block_object_dispose(&v37, 8);
  return v15;
}

- (void)activationLockComplete
{
  unsigned __int8 v3;
  id v4;
  uint64_t v5;
  id v6;
  id v7;

  v7 = 0;
  v3 = -[StartPreflightViewController preflightPhase2:](self, "preflightPhase2:", &v7);
  v4 = v7;
  if ((v3 & 1) != 0)
  {
    v5 = 0;
    v6 = 0;
  }
  else
  {
    v5 = -79;
    v6 = v4;
  }
  -[StartPreflightViewController endTestWithStatusCode:error:](self, "endTestWithStatusCode:error:", v5, v6);

}

- (id)baaCert
{
  return -[StartPreflightViewController preflightBaaCert](self, "preflightBaaCert");
}

- (id)signData:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  v6 = (void *)objc_opt_new(CRPreflightController, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[StartPreflightViewController preflightRIK](self, "preflightRIK"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "sign:keyBlob:", v4, v7));

  return v8;
}

- (StartPreflightInputs)inputs
{
  return self->inputs;
}

- (void)setInputs:(id)a3
{
  objc_storeStrong((id *)&self->inputs, a3);
}

- (NSData)preflightRIK
{
  return self->_preflightRIK;
}

- (void)setPreflightRIK:(id)a3
{
  objc_storeStrong((id *)&self->_preflightRIK, a3);
}

- (NSData)preflightBaaCert
{
  return self->_preflightBaaCert;
}

- (void)setPreflightBaaCert:(id)a3
{
  objc_storeStrong((id *)&self->_preflightBaaCert, a3);
}

- (NSDictionary)preflightResponsePhase1
{
  return self->_preflightResponsePhase1;
}

- (void)setPreflightResponsePhase1:(id)a3
{
  objc_storeStrong((id *)&self->_preflightResponsePhase1, a3);
}

- (NSDictionary)preflightResults
{
  return self->_preflightResults;
}

- (void)setPreflightResults:(id)a3
{
  objc_storeStrong((id *)&self->_preflightResults, a3);
}

- (BOOL)activationLockChallengeNeeded
{
  return self->_activationLockChallengeNeeded;
}

- (void)setActivationLockChallengeNeeded:(BOOL)a3
{
  self->_activationLockChallengeNeeded = a3;
}

- (NSArray)chimeraLockComponents
{
  return self->_chimeraLockComponents;
}

- (void)setChimeraLockComponents:(id)a3
{
  objc_storeStrong((id *)&self->_chimeraLockComponents, a3);
}

- (NSArray)activationLockComponents
{
  return self->_activationLockComponents;
}

- (void)setActivationLockComponents:(id)a3
{
  objc_storeStrong((id *)&self->_activationLockComponents, a3);
}

- (OS_dispatch_semaphore)uiNeededKnownSemaphore
{
  return self->_uiNeededKnownSemaphore;
}

- (void)setUiNeededKnownSemaphore:(id)a3
{
  objc_storeStrong((id *)&self->_uiNeededKnownSemaphore, a3);
}

- (UINavigationController)navigationController
{
  return self->_navigationController;
}

- (void)setNavigationController:(id)a3
{
  objc_storeStrong((id *)&self->_navigationController, a3);
}

- (NSMutableArray)viewControllers
{
  return self->_viewControllers;
}

- (void)setViewControllers:(id)a3
{
  objc_storeStrong((id *)&self->_viewControllers, a3);
}

- (DSHardwareButtonEventMonitor)buttonEventMonitor
{
  return self->_buttonEventMonitor;
}

- (void)setButtonEventMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_buttonEventMonitor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buttonEventMonitor, 0);
  objc_storeStrong((id *)&self->_viewControllers, 0);
  objc_storeStrong((id *)&self->_navigationController, 0);
  objc_storeStrong((id *)&self->_uiNeededKnownSemaphore, 0);
  objc_storeStrong((id *)&self->_activationLockComponents, 0);
  objc_storeStrong((id *)&self->_chimeraLockComponents, 0);
  objc_storeStrong((id *)&self->_preflightResults, 0);
  objc_storeStrong((id *)&self->_preflightResponsePhase1, 0);
  objc_storeStrong((id *)&self->_preflightBaaCert, 0);
  objc_storeStrong((id *)&self->_preflightRIK, 0);
  objc_storeStrong((id *)&self->inputs, 0);
}

@end
