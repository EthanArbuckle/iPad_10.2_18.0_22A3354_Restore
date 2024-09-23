@implementation DADeviceLocalPersistent

- (DADeviceLocalPersistent)init
{
  DADeviceLocalPersistent *v2;
  DADeviceState *v3;
  void *v4;
  void *v5;
  void *v6;
  DADeviceState *v7;
  DADeviceState *state;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)DADeviceLocalPersistent;
  v2 = -[DADeviceLocalPersistent init](&v13, "init");
  if (v2)
  {
    v3 = [DADeviceState alloc];
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[ELSManager sharedManager](ELSManager, "sharedManager"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "snapshot"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "dedSessionIdentifier"));
    v7 = -[DADeviceState initWithSerialNumber:attributes:](v3, "initWithSerialNumber:attributes:", v6, &__NSDictionary0__struct);
    state = v2->_state;
    v2->_state = v7;

    v2->_bugSessionStarted = 0;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[ELSManager sharedManager](ELSManager, "sharedManager"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "snapshot"));
    -[DADeviceLocalPersistent advanceForStatus:](v2, "advanceForStatus:", objc_msgSend(v10, "status"));

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v11, "addObserver:selector:name:object:", v2, "enhancedLoggingDidUpdateStatus:", ELSDidUpdateStatus, 0);

  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:name:object:", self, ELSDidUpdateStatus, 0);

  v4.receiver = self;
  v4.super_class = (Class)DADeviceLocalPersistent;
  -[DADeviceLocalPersistent dealloc](&v4, "dealloc");
}

- (BOOL)isLocal
{
  return 1;
}

- (void)end
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  _QWORD v9[5];
  _QWORD block[5];
  uint8_t buf[4];
  const char *v12;

  v3 = DiagnosticLogHandleForCategory(11);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v12 = "-[DADeviceLocalPersistent end]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000EFC4;
  block[3] = &unk_100132838;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v5, "removeObserver:name:object:", self, ELSDidUpdateStatus, 0);

  v6 = DiagnosticLogHandleForCategory(11);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Flushing defaults...", buf, 2u);
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[ELSManager sharedManager](ELSManager, "sharedManager"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10000F028;
  v9[3] = &unk_100132EE0;
  v9[4] = self;
  objc_msgSend(v8, "flushWithCompletion:", v9);

}

- (void)enhancedLoggingDidUpdateStatus:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "userInfo"));
  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", ELSUserInfoKey));

  v5 = v6;
  if (v6)
  {
    -[DADeviceLocalPersistent advanceForStatus:](self, "advanceForStatus:", objc_msgSend(v6, "status"));
    v5 = v6;
  }

}

- (void)advanceForStatus:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  if (a3 >= 3)
  {
    -[DADeviceLocalPersistent startBugSession](self, "startBugSession");
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[ELSManager sharedManager](ELSManager, "sharedManager"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "snapshot"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "startDate"));

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[ELSManager sharedManager](ELSManager, "sharedManager"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "snapshot"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "endDate"));

    if (v7 && !v10)
      -[DADeviceLocalPersistent retryBugSession](self, "retryBugSession");

  }
  switch(a3)
  {
    case 0uLL:
      -[DADeviceLocalPersistent end](self, "end");
      break;
    case 1uLL:
      -[DADeviceLocalPersistent beginEnroll](self, "beginEnroll");
      break;
    case 2uLL:
      -[DADeviceLocalPersistent askForEnrollConsent](self, "askForEnrollConsent");
      break;
    case 3uLL:
      -[DADeviceLocalPersistent beginCollection](self, "beginCollection");
      break;
    case 4uLL:
      -[DADeviceLocalPersistent askForUploadConsent](self, "askForUploadConsent");
      break;
    case 5uLL:
      -[DADeviceLocalPersistent beginUpload](self, "beginUpload");
      break;
    case 6uLL:
      -[DADeviceLocalPersistent beginUnenroll](self, "beginUnenroll");
      break;
    case 7uLL:
      -[DADeviceLocalPersistent uploadFinished](self, "uploadFinished");
      break;
    case 8uLL:
      -[DADeviceLocalPersistent uploadFailed](self, "uploadFailed");
      break;
    default:
      return;
  }
}

- (void)beginEnroll
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  int v6;
  const char *v7;

  v3 = DiagnosticLogHandleForCategory(11);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315138;
    v7 = "-[DADeviceLocalPersistent beginEnroll]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v6, 0xCu);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceLocalPersistent state](self, "state"));
  objc_msgSend(v5, "transactionWithBlock:", &stru_100132F20);

}

- (void)askForEnrollConsent
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  int v6;
  const char *v7;

  v3 = DiagnosticLogHandleForCategory(11);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315138;
    v7 = "-[DADeviceLocalPersistent askForEnrollConsent]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v6, 0xCu);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceLocalPersistent state](self, "state"));
  objc_msgSend(v5, "transactionWithBlock:", &stru_100132F40);

  +[ELSEvent createLoggingEventWith:](ELSEvent, "createLoggingEventWith:", ELSEventTypeAskedForEnrollConsent);
}

- (void)beginCollection
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  _QWORD block[5];
  uint8_t buf[4];
  const char *v8;

  v3 = DiagnosticLogHandleForCategory(11);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v8 = "-[DADeviceLocalPersistent beginCollection]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceLocalPersistent state](self, "state"));
  objc_msgSend(v5, "transactionWithBlock:", &stru_100132F60);

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000F700;
  block[3] = &unk_100132838;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)heartbeat
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  _QWORD v11[5];
  _QWORD v12[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[ELSManager sharedManager](ELSManager, "sharedManager"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "snapshot"));
  v5 = objc_msgSend(v4, "status");

  if (v5 == (id)3)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[ELSManager sharedManager](ELSManager, "sharedManager"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "snapshot"));
    objc_msgSend(v7, "durationRemaining");
    v9 = v8;

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceLocalPersistent state](self, "state"));
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10000F87C;
    v12[3] = &unk_100132F80;
    v12[4] = v9;
    objc_msgSend(v10, "transactionWithBlock:", v12);

    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10000F888;
    v11[3] = &unk_100132838;
    v11[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v11);
  }
}

- (void)askForUploadConsent
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  int v6;
  const char *v7;

  v3 = DiagnosticLogHandleForCategory(11);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315138;
    v7 = "-[DADeviceLocalPersistent askForUploadConsent]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v6, 0xCu);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceLocalPersistent state](self, "state"));
  objc_msgSend(v5, "transactionWithBlock:", &stru_100132FA0);

  +[ELSEvent createLoggingEventWith:](ELSEvent, "createLoggingEventWith:", ELSEventTypeAskedForUploadConsent);
}

- (void)beginUpload
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  int v10;
  const char *v11;

  v3 = DiagnosticLogHandleForCategory(11);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 136315138;
    v11 = "-[DADeviceLocalPersistent beginUpload]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v10, 0xCu);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[ELSManager sharedManager](ELSManager, "sharedManager"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "snapshot"));
  v7 = objc_msgSend(v6, "consent");

  if (v7 == (id)3)
  {
    -[DADeviceLocalPersistent reconfigureWithCommit:](self, "reconfigureWithCommit:", 1);
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceLocalPersistent session](self, "session"));
    objc_msgSend(v8, "commit");

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceLocalPersistent state](self, "state"));
  objc_msgSend(v9, "transactionWithBlock:", &stru_100132FC0);

}

- (void)beginUnenroll
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  int v6;
  const char *v7;

  v3 = DiagnosticLogHandleForCategory(11);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315138;
    v7 = "-[DADeviceLocalPersistent beginUnenroll]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v6, 0xCu);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceLocalPersistent state](self, "state"));
  objc_msgSend(v5, "transactionWithBlock:", &stru_100132FE0);

  -[DADeviceLocalPersistent end](self, "end");
}

- (void)uploadFinished
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v9[5];
  uint8_t buf[4];
  const char *v11;

  v3 = DiagnosticLogHandleForCategory(11);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v11 = "-[DADeviceLocalPersistent uploadFinished]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[ELSManager sharedManager](ELSManager, "sharedManager"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "snapshot"));
  v7 = objc_msgSend(v6, "status");

  if ((unint64_t)v7 <= 5)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[ELSManager sharedManager](ELSManager, "sharedManager"));
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10000FDC0;
    v9[3] = &unk_100132EE0;
    v9[4] = self;
    objc_msgSend(v8, "finishWithCompletion:", v9);

  }
}

- (void)uploadFailed
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  _QWORD v6[5];
  uint8_t buf[4];
  const char *v8;

  v3 = DiagnosticLogHandleForCategory(11);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v8 = "-[DADeviceLocalPersistent uploadFailed]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[ELSManager sharedManager](ELSManager, "sharedManager"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10000FF00;
  v6[3] = &unk_100132EE0;
  v6[4] = self;
  objc_msgSend(v5, "finishWithCompletion:", v6);

}

- (void)startBugSession
{
  uint64_t v3;
  NSObject *v4;
  _QWORD v5[5];
  uint8_t buf[4];
  const char *v7;

  if (!-[DADeviceLocalPersistent bugSessionStarted](self, "bugSessionStarted"))
  {
    v3 = DiagnosticLogHandleForCategory(11);
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v7 = "-[DADeviceLocalPersistent startBugSession]";
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
    }

    -[DADeviceLocalPersistent setBugSessionStarted:](self, "setBugSessionStarted:", 1);
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_100010058;
    v5[3] = &unk_100133090;
    v5[4] = self;
    -[DADeviceLocalPersistent connectToDED:](self, "connectToDED:", v5);
  }
}

- (void)unpackQueueWithOngoingExtensions:(id)a3 retry:(BOOL)a4
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  _UNKNOWN **v7;
  void *v8;
  void *v9;
  void *v10;
  dispatch_group_t v11;
  NSObject *v12;
  NSObject *v13;
  uint64_t v14;
  NSObject *v15;
  unint64_t v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  void *i;
  char *v22;
  uint64_t v23;
  NSObject *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  char *v36;
  id v37;
  id v38;
  uint64_t v39;
  void *j;
  void *v41;
  uint64_t v42;
  NSObject *v43;
  char *v44;
  double v45;
  double v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  id v55;
  void *v56;
  void *v57;
  id v58;
  NSObject *v59;
  void *v60;
  void *v61;
  void *v62;
  id v63;
  NSObject *v64;
  id v65;
  void *v66;
  NSObject *v67;
  void *v68;
  id obj;
  _BOOL4 v70;
  _QWORD *v71;
  _QWORD v73[4];
  id v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  _QWORD v79[5];
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  _QWORD v84[4];
  NSObject *v85;
  _BYTE v86[128];
  uint8_t v87[128];
  uint8_t buf[4];
  const char *v89;

  v70 = a4;
  v4 = a3;
  v5 = DiagnosticLogHandleForCategory(1);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v89 = "-[DADeviceLocalPersistent unpackQueueWithOngoingExtensions:retry:]";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  v7 = &_sSh8IteratorV6_cocoaAByx_Gs10__CocoaSetVAACn_tcfC_ptr;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[ELSManager sharedManager](ELSManager, "sharedManager"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "snapshot"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "endDate"));

  v11 = dispatch_group_create();
  v12 = dispatch_queue_create("com.apple.Diagnostics.finishLocalPersistentDeviceQueue", 0);
  v84[0] = _NSConcreteStackBlock;
  v84[1] = 3221225472;
  v84[2] = sub_100010D6C;
  v84[3] = &unk_1001330B8;
  v13 = v11;
  v85 = v13;
  v71 = objc_retainBlock(v84);
  v67 = v13;
  if (v4 && v10 && objc_msgSend(v4, "count"))
  {
    v14 = DiagnosticLogHandleForCategory(11);
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Re-attaching to Ongoing Extensions...", buf, 2u);
    }

    if (objc_msgSend(v4, "count"))
    {
      v16 = 0;
      do
      {
        dispatch_group_enter(v13);
        ++v16;
      }
      while ((unint64_t)objc_msgSend(v4, "count") > v16);
    }
    dispatch_group_notify(v13, v12, &stru_1001330D8);
    v82 = 0u;
    v83 = 0u;
    v80 = 0u;
    v81 = 0u;
    v17 = v4;
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v80, v87, 16);
    if (v18)
    {
      v19 = v18;
      v66 = v10;
      v20 = *(_QWORD *)v81;
      do
      {
        for (i = 0; i != v19; i = (char *)i + 1)
        {
          if (*(_QWORD *)v81 != v20)
            objc_enumerationMutation(v17);
          v22 = *(char **)(*((_QWORD *)&v80 + 1) + 8 * (_QWORD)i);
          v23 = DiagnosticLogHandleForCategory(11);
          v24 = objc_claimAutoreleasedReturnValue(v23);
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v89 = v22;
            _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Extension = %@", buf, 0xCu);
          }

          v25 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceLocalPersistent session](self, "session"));
          v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "dedExtensionIdentifier"));
          objc_msgSend(v25, "attachCompletionHandlerForDEDExtensionIdentifier:handler:", v26, v71);

        }
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v80, v87, 16);
      }
      while (v19);
      v7 = &_sSh8IteratorV6_cocoaAByx_Gs10__CocoaSetVAACn_tcfC_ptr;
      v10 = v66;
    }
  }
  else
  {
    v27 = DiagnosticLogHandleForCategory(11);
    v28 = objc_claimAutoreleasedReturnValue(v27);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Starting diagnostics from Queue...", buf, 2u);
    }

    v29 = (void *)objc_claimAutoreleasedReturnValue(+[ELSManager sharedManager](ELSManager, "sharedManager"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "snapshot"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "queue"));

    v32 = (void *)objc_claimAutoreleasedReturnValue(+[ELSManager sharedManager](ELSManager, "sharedManager"));
    v79[0] = _NSConcreteStackBlock;
    v79[1] = 3221225472;
    v79[2] = sub_100010F9C;
    v79[3] = &unk_100132EE0;
    v79[4] = self;
    objc_msgSend(v32, "transactionWithBlock:", v79);

    v65 = v4;
    if (v70)
    {
      v33 = (void *)objc_claimAutoreleasedReturnValue(+[ELSManager sharedManager](ELSManager, "sharedManager"));
      v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "snapshot"));
      v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "identifiersToRetry"));
      v36 = (char *)objc_msgSend(v35, "count");

    }
    else
    {
      v36 = (char *)objc_msgSend(v31, "count");
    }
    for (; v36; --v36)
      dispatch_group_enter(v13);
    v64 = v12;
    dispatch_group_notify(v13, v12, &stru_1001330D8);
    v68 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v75 = 0u;
    v76 = 0u;
    v77 = 0u;
    v78 = 0u;
    obj = v31;
    v37 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v75, v86, 16);
    if (v37)
    {
      v38 = v37;
      v39 = *(_QWORD *)v76;
      do
      {
        for (j = 0; j != v38; j = (char *)j + 1)
        {
          if (*(_QWORD *)v76 != v39)
            objc_enumerationMutation(obj);
          v41 = *(void **)(*((_QWORD *)&v75 + 1) + 8 * (_QWORD)j);
          if (!v70 || objc_msgSend(*(id *)(*((_QWORD *)&v75 + 1) + 8 * (_QWORD)j), "retry"))
          {
            v42 = DiagnosticLogHandleForCategory(11);
            v43 = objc_claimAutoreleasedReturnValue(v42);
            if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
            {
              v44 = (char *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "description"));
              *(_DWORD *)buf = 138412290;
              v89 = v44;
              _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "Entry = %@", buf, 0xCu);

            }
            objc_msgSend(v41, "executeAfterDuration");
            v46 = v45;
            v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
            v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeInterval:sinceDate:](NSDate, "dateWithTimeInterval:sinceDate:", v47, v46));

            v49 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceLocalPersistent session](self, "session"));
            v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "type"));
            v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "parameters"));
            v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "startDiagnosticExtensionWithIdentifier:parameters:deferRunUntil:completion:", v50, v51, v48, v71));

            if (objc_msgSend(v41, "retry"))
            {
              v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "stringValue"));
              objc_msgSend(v68, "addObject:", v53);

            }
          }
        }
        v38 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v75, v86, 16);
      }
      while (v38);
    }
    v17 = obj;

    v7 = &_sSh8IteratorV6_cocoaAByx_Gs10__CocoaSetVAACn_tcfC_ptr;
    v54 = (void *)objc_claimAutoreleasedReturnValue(+[ELSManager sharedManager](ELSManager, "sharedManager"));
    v73[0] = _NSConcreteStackBlock;
    v73[1] = 3221225472;
    v73[2] = sub_1000110D8;
    v73[3] = &unk_100132EE0;
    v74 = v68;
    v55 = v68;
    objc_msgSend(v54, "transactionWithBlock:", v73);

    v4 = v65;
    v12 = v64;
  }

  v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7[369], "sharedManager"));
  v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "snapshot"));
  v58 = objc_msgSend(v57, "consent");

  if (v58 == (id)3)
  {
    -[DADeviceLocalPersistent reconfigureWithCommit:](self, "reconfigureWithCommit:", 1);
    v59 = v67;
  }
  else
  {
    v59 = v67;
    if (v58 == (id)2)
    {
      v60 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceLocalPersistent session](self, "session"));
      objc_msgSend(v60, "commit");
LABEL_49:

      goto LABEL_50;
    }
    v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7[369], "sharedManager"));
    v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "snapshot"));
    v63 = objc_msgSend(v62, "consent");

    if (v63 == (id)1)
    {
      v60 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceLocalPersistent session](self, "session"));
      objc_msgSend(v60, "scheduleNotification");
      goto LABEL_49;
    }
  }
LABEL_50:

}

- (void)retryBugSession
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD v15[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceLocalPersistent session](self, "session"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceLocalPersistent session](self, "session"));
    objc_msgSend(v4, "clearNotification");

    v5 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceLocalPersistent session](self, "session"));
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1000111B0;
    v15[3] = &unk_100133100;
    v15[4] = self;
    objc_msgSend(v5, "synchronizeSessionStatusWithCompletion:", v15);

  }
  else
  {
    v6 = DiagnosticLogHandleForCategory(11);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_1000EAA40(v7, v8, v9, v10, v11, v12, v13, v14);

  }
}

- (void)reconfigureWithCommit:(BOOL)a3
{
  void *v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD v15[5];
  BOOL v16;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceLocalPersistent session](self, "session"));

  if (v5)
  {
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100011684;
    v15[3] = &unk_100133128;
    v15[4] = self;
    v16 = a3;
    -[DADeviceLocalPersistent connectToDED:](self, "connectToDED:", v15);
  }
  else
  {
    v6 = DiagnosticLogHandleForCategory(11);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_1000EAA74(v7, v8, v9, v10, v11, v12, v13, v14);

  }
}

- (id)notifierConfiguration
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[ELSManager sharedManager](ELSManager, "sharedManager"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "snapshot"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "followUpOptions"));

  v5 = objc_alloc((Class)DEDNotifierConfiguration);
  v6 = sub_1000129FC(CFSTR("ENHANCED_LOGGING_FOLLOWUP_TITLE"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = sub_1000129FC(CFSTR("ENHANCED_LOGGING_FOLLOWUP_ALERT_BODY"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = objc_msgSend(v5, "initWithHostAppIdentifier:localizedNotificationTitle:localizedNotificationBody:", CFSTR("com.apple.Diagnostics"), v7, v9);

  objc_msgSend(v10, "setFollowupUniqueIdentifier:", ELSDomain);
  v11 = ELSFollowUpOptionFrequency;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", ELSFollowUpOptionFrequency));
  if (v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", v11));
    objc_msgSend(v13, "doubleValue");
    objc_msgSend(v10, "setFollowupFrequency:");

  }
  else
  {
    objc_msgSend(v10, "setFollowupFrequency:", 3600.0);
  }

  v14 = ELSFollowUpOptionUseSpringBoardNotification;
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", ELSFollowUpOptionUseSpringBoardNotification));
  if (v15)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", v14));
    objc_msgSend(v10, "setFollowupUseSpringboardNotification:", objc_msgSend(v16, "BOOLValue"));

  }
  else
  {
    objc_msgSend(v10, "setFollowupUseSpringboardNotification:", 1);
  }

  v17 = sub_1000129FC(CFSTR("ENHANCED_LOGGING_FOLLOWUP_SETTINGS_TITLE"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  objc_msgSend(v10, "setFollowupLocalizedTitle:", v18);

  v19 = sub_1000129FC(CFSTR("ENHANCED_LOGGING_FOLLOWUP_SETTINGS_BODY"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
  objc_msgSend(v10, "setFollowupLocalizedInformativeText:", v20);

  v21 = sub_1000129FC(CFSTR("ENHANCED_LOGGING_FOLLOWUP_ALERT_ACTION"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
  objc_msgSend(v10, "setFollowupNotificationActionTitle:", v22);

  v23 = sub_1000129FC(CFSTR("ENHANCED_LOGGING_FOLLOWUP_ALERT_ACTION"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
  objc_msgSend(v10, "setReviewActionLabel:", v24);

  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", CFSTR("diags://?els-action=review")));
  objc_msgSend(v10, "setFollowupReviewActionURL:", v25);

  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", CFSTR("diags://?els-action=review")));
  objc_msgSend(v10, "setFollowupNotificationActionURL:", v26);

  return v10;
}

- (void)connectToDED:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[ELSManager sharedManager](ELSManager, "sharedManager"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100011A74;
  v7[3] = &unk_100133178;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "getBugSessionActivityWithCompletion:", v7);

}

- (void)startDEDSessionForDevice:(id)a3 withConfig:(id)a4 withNewSession:(BOOL)a5 completionHandler:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  BOOL v21;

  v9 = a6;
  v10 = a4;
  v11 = a3;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[ELSManager sharedManager](ELSManager, "sharedManager"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[DEDManager sharedInstance](DEDManager, "sharedInstance"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "snapshot"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "dedSessionIdentifier"));
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10001240C;
  v18[3] = &unk_1001331C8;
  v19 = v12;
  v20 = v9;
  v21 = a5;
  v16 = v9;
  v17 = v12;
  objc_msgSend(v13, "startBugSessionWithIdentifier:configuration:target:completion:", v15, v10, v11, v18);

}

- (void)uploadProgress:(unint64_t)a3 total:(int64_t)a4 session:(id)a5
{
  uint64_t v5;
  uint64_t v6;
  void *v9;
  _QWORD v10[12];

  if (a3 == a4)
  {
    -[DADeviceLocalPersistent uploadFinished](self, "uploadFinished");
  }
  else
  {
    v10[10] = v5;
    v10[11] = v6;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceLocalPersistent state](self, "state"));
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100012804;
    v10[3] = &unk_1001331E8;
    v10[4] = a3;
    v10[5] = a4;
    objc_msgSend(v9, "transactionWithBlock:", v10);

  }
}

- (DADeviceDelegate)delegate
{
  return (DADeviceDelegate *)objc_loadWeakRetained((id *)&self->delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->delegate, a3);
}

- (DEDDevice)dedSessionDevice
{
  return self->_dedSessionDevice;
}

- (void)setDedSessionDevice:(id)a3
{
  objc_storeStrong((id *)&self->_dedSessionDevice, a3);
}

- (DADeviceState)state
{
  return self->_state;
}

- (void)setState:(id)a3
{
  objc_storeStrong((id *)&self->_state, a3);
}

- (DEDBugSession)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
  objc_storeStrong((id *)&self->_session, a3);
}

- (BOOL)bugSessionStarted
{
  return self->_bugSessionStarted;
}

- (void)setBugSessionStarted:(BOOL)a3
{
  self->_bugSessionStarted = a3;
}

- (NSTimer)clock
{
  return self->_clock;
}

- (void)setClock:(id)a3
{
  objc_storeStrong((id *)&self->_clock, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clock, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_dedSessionDevice, 0);
  objc_destroyWeak((id *)&self->delegate);
}

@end
