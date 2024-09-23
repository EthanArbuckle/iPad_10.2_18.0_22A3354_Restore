@implementation DADeviceConnectionLocal

- (DADeviceConnectionLocal)initWithState:(id)a3
{
  id v5;
  DADeviceConnectionLocal *v6;
  DADeviceConnectionLocal *v7;
  DAAssetUploader *v8;
  DAAssetUploader *assetUploader;
  uint64_t v10;
  NSMutableDictionary *sandboxExtensionHandles;
  uint64_t v12;
  NSMutableDictionary *progressForTest;
  objc_super v15;

  v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)DADeviceConnectionLocal;
  v6 = -[DADeviceConnectionLocal init](&v15, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_state, a3);
    v7->_disconnecting = 0;
    -[DADeviceState setPhase:](v7->_state, "setPhase:", 0);
    v8 = objc_alloc_init(DAAssetUploader);
    assetUploader = v7->_assetUploader;
    v7->_assetUploader = v8;

    v10 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    sandboxExtensionHandles = v7->_sandboxExtensionHandles;
    v7->_sandboxExtensionHandles = (NSMutableDictionary *)v10;

    v12 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    progressForTest = v7->_progressForTest;
    v7->_progressForTest = (NSMutableDictionary *)v12;

  }
  return v7;
}

- (id)IMEI
{
  return 0;
}

- (DADeviceState)state
{
  return self->_state;
}

- (int)mode
{
  void *v3;
  void *v4;
  int v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceConnectionLocal configurator](self, "configurator"));

  if (!v3)
    return 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceConnectionLocal configurator](self, "configurator"));
  v5 = objc_msgSend(v4, "mode");

  return v5;
}

- (void)start
{
  uint64_t v3;
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
  uint8_t buf[4];
  const char *v15;

  v3 = DiagnosticLogHandleForCategory(1);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v15 = "-[DADeviceConnectionLocal start]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[DADeviceConnectionLocal] %s", buf, 0xCu);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceConnectionLocal state](self, "state"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObjects:](NSSet, "setWithObjects:", &off_10013EEF0, &off_10013EF08, &off_10013EF20, 0));
  objc_msgSend(v5, "removeErrorCodes:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceConnectionLocal state](self, "state"));
  objc_msgSend(v7, "setPhase:", 2);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceConnectionLocal state](self, "state"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "serialNumber"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[ASTIdentity identityWithSerialNumber:](ASTIdentity, "identityWithSerialNumber:", v9));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[ASTSession sessionWithIdentity:](ASTSession, "sessionWithIdentity:", v10));
  -[DADeviceConnectionLocal setSession:](self, "setSession:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceConnectionLocal session](self, "session"));
  objc_msgSend(v12, "setDelegate:", self);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceConnectionLocal session](self, "session"));
  objc_msgSend(v13, "startWithMode:", -[DADeviceConnectionLocal mode](self, "mode"));

}

- (void)idle
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  int v6;
  const char *v7;

  v3 = DiagnosticLogHandleForCategory(1);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315138;
    v7 = "-[DADeviceConnectionLocal idle]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[DADeviceConnectionLocal] %s", (uint8_t *)&v6, 0xCu);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceConnectionLocal session](self, "session"));
  objc_msgSend(v5, "idle");

}

- (void)end
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  void *v6;
  int v7;
  const char *v8;

  v3 = DiagnosticLogHandleForCategory(1);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315138;
    v8 = "-[DADeviceConnectionLocal end]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[DADeviceConnectionLocal] %s", (uint8_t *)&v7, 0xCu);
  }

  -[DADeviceConnectionLocal setDisconnecting:](self, "setDisconnecting:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceConnectionLocal session](self, "session"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceConnectionLocal session](self, "session"));
    objc_msgSend(v6, "end");
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceConnectionLocal state](self, "state"));
    objc_msgSend(v6, "setPhase:", 1);
  }

}

- (void)requestAsset:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  uint8_t buf[4];
  const char *v15;

  v6 = a4;
  v7 = a3;
  v8 = DiagnosticLogHandleForCategory(1);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v15 = "-[DADeviceConnectionLocal requestAsset:completionHandler:]";
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "[DADeviceConnectionLocal] %s", buf, 0xCu);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceConnectionLocal session](self, "session"));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10000902C;
  v12[3] = &unk_100132A38;
  v13 = v6;
  v11 = v6;
  objc_msgSend(v10, "requestAsset:completionHandler:", v7, v12);

}

- (void)requestUploadAssets:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, void *, void *);
  uint64_t v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  const char *v14;

  v6 = a3;
  v7 = (void (**)(id, void *, void *))a4;
  v8 = DiagnosticLogHandleForCategory(1);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 136315138;
    v14 = "-[DADeviceConnectionLocal requestUploadAssets:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "[DADeviceConnectionLocal] %s", (uint8_t *)&v13, 0xCu);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceConnectionLocal assetUploader](self, "assetUploader"));
  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceConnectionLocal assetUploader](self, "assetUploader"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceConnectionLocal strongDeviceIdentity](self, "strongDeviceIdentity"));
    objc_msgSend(v11, "uploadAssets:wtihDeviceIdentity:completion:", v6, v12, v7);
  }
  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray array](NSArray, "array"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", DKErrorDomain, -1008, 0));
    v7[2](v7, v11, v12);
  }

}

- (void)requestSuiteStart:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  id v11;
  _QWORD v12[5];
  id v13;
  uint8_t buf[4];
  const char *v15;

  v6 = a4;
  v7 = a3;
  v8 = DiagnosticLogHandleForCategory(1);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v15 = "-[DADeviceConnectionLocal requestSuiteStart:completionHandler:]";
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "[DADeviceConnectionLocal] %s", buf, 0xCu);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceConnectionLocal session](self, "session"));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000092E4;
  v12[3] = &unk_100132A60;
  v12[4] = self;
  v13 = v6;
  v11 = v6;
  objc_msgSend(v10, "requestSuiteStart:completionHandler:", v7, v12);

}

- (void)sessionDidStart:(id)a3
{
  uint64_t v4;
  NSObject *v5;
  void *v6;
  int v7;
  const char *v8;

  v4 = DiagnosticLogHandleForCategory(1);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315138;
    v8 = "-[DADeviceConnectionLocal sessionDidStart:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[DADeviceConnectionLocal] %s", (uint8_t *)&v7, 0xCu);
  }

  if (!-[DADeviceConnectionLocal isDisconnecting](self, "isDisconnecting"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceConnectionLocal state](self, "state"));
    objc_msgSend(v6, "setPhase:", 4);

  }
}

- (void)session:(id)a3 startTest:(id)a4 parameters:(id)a5 testResult:(id)a6
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  char isKindOfClass;
  uint64_t v19;
  NSObject *v20;
  _BOOL4 v21;
  int v22;
  unsigned int v23;
  void *v24;
  id v25;
  id v26;
  void ***v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void **v32;
  uint64_t v33;
  void (*v34)(uint64_t, void *, void *);
  void *v35;
  DADeviceConnectionLocal *v36;
  id v37;
  id v38;
  id v39;
  uint8_t buf[4];
  const char *v41;

  v9 = a4;
  v10 = a5;
  v11 = a6;
  v12 = DiagnosticLogHandleForCategory(1);
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v41 = "-[DADeviceConnectionLocal session:startTest:parameters:testResult:]";
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "[DADeviceConnectionLocal] %s", buf, 0xCu);
  }

  objc_msgSend(v11, "setStatusCode:", &off_10013EF38);
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("specifications")));
  if (v14)
  {
    v15 = objc_opt_class(NSDictionary);
    if ((objc_opt_isKindOfClass(v14, v15) & 1) != 0)
    {
      v16 = (char *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("allowCellularSizeThreshold")));
      if (v16)
      {
        v17 = objc_opt_class(NSNumber);
        isKindOfClass = objc_opt_isKindOfClass(v16, v17);
        v19 = DiagnosticLogHandleForCategory(1);
        v20 = objc_claimAutoreleasedReturnValue(v19);
        v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);
        if ((isKindOfClass & 1) == 0)
        {
          if (v21)
          {
            *(_DWORD *)buf = 138412290;
            v41 = v16;
            _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Bad test specification value. Expected a number, got [%@]", buf, 0xCu);
          }

          objc_msgSend(v11, "setStatusCode:", &off_10013EF50);
          v22 = 0;
          goto LABEL_15;
        }
        if (v21)
        {
          *(_DWORD *)buf = 138412290;
          v41 = v16;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Setting cellular threshold to %@.", buf, 0xCu);
        }

        objc_msgSend(v11, "setAllowCellularSizeThreshold:", v16);
      }
      v22 = 1;
LABEL_15:

      goto LABEL_16;
    }
  }
  v22 = 1;
LABEL_16:
  v23 = -[DADeviceConnectionLocal isDisconnecting](self, "isDisconnecting");
  if (!v22 || v23)
  {
    v26 = (id)objc_claimAutoreleasedReturnValue(-[DADeviceConnectionLocal session](self, "session"));
    objc_msgSend(v26, "sendTestResult:error:", v11, 0);
  }
  else
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    v32 = _NSConcreteStackBlock;
    v33 = 3221225472;
    v34 = sub_1000097F0;
    v35 = &unk_100132A88;
    v36 = self;
    v25 = v9;
    v37 = v25;
    v38 = v11;
    v39 = v24;
    v26 = v24;
    v27 = objc_retainBlock(&v32);
    v29 = (void *)objc_opt_new(DADeviceConnectionStartTestCommand, v28);
    objc_msgSend(v29, "setTestID:", v25, v32, v33, v34, v35, v36);
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[DKDiagnosticParameters diagnosticParametersWithDictionary:](DKDiagnosticParameters, "diagnosticParametersWithDictionary:", v10));
    objc_msgSend(v29, "setParameters:", v30);

    objc_msgSend(v29, "setCompletion:", v27);
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceConnectionLocal delegate](self, "delegate"));
    objc_msgSend(v31, "deviceConnection:didRecieveCommand:", self, v29);

  }
}

- (void)session:(id)a3 didEndWithError:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  DADeviceConnectionLocal *v15;
  id v16;
  uint8_t buf[4];
  const char *v18;

  v6 = a3;
  v7 = a4;
  v8 = DiagnosticLogHandleForCategory(1);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v18 = "-[DADeviceConnectionLocal session:didEndWithError:]";
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "[DADeviceConnectionLocal] %s", buf, 0xCu);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceConnectionLocal state](self, "state"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100009CC4;
  v13[3] = &unk_100132AB0;
  v14 = v7;
  v15 = self;
  v16 = v6;
  v11 = v6;
  v12 = v7;
  objc_msgSend(v10, "transactionWithBlock:", v13);

  -[DADeviceConnectionLocal setDisconnecting:](self, "setDisconnecting:", 0);
  -[DADeviceConnectionLocal setStrongDeviceIdentity:](self, "setStrongDeviceIdentity:", 0);

}

- (void)session:(id)a3 didStartTestSuite:(id)a4 description:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  uint8_t buf[4];
  const char *v18;

  v7 = a4;
  v8 = a5;
  v9 = DiagnosticLogHandleForCategory(1);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v18 = "-[DADeviceConnectionLocal session:didStartTestSuite:description:]";
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "[DADeviceConnectionLocal] %s", buf, 0xCu);
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceConnectionLocal state](self, "state"));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100009F84;
  v14[3] = &unk_100132AD8;
  v15 = v7;
  v16 = v8;
  v12 = v8;
  v13 = v7;
  objc_msgSend(v11, "transactionWithBlock:", v14);

}

- (void)session:(id)a3 didCompleteTestSuite:(id)a4 description:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  NSObject *v10;
  int v11;
  const char *v12;

  v7 = a4;
  v8 = a3;
  v9 = DiagnosticLogHandleForCategory(1);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 136315138;
    v12 = "-[DADeviceConnectionLocal session:didCompleteTestSuite:description:]";
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "[DADeviceConnectionLocal] %s", (uint8_t *)&v11, 0xCu);
  }

  -[DADeviceConnectionLocal _session:didFinishSuiteWithName:skipped:](self, "_session:didFinishSuiteWithName:skipped:", v8, v7, 0);
}

- (void)sessionDidCancelSuite:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  const char *v10;

  v4 = a3;
  v5 = DiagnosticLogHandleForCategory(1);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 136315138;
    v10 = "-[DADeviceConnectionLocal sessionDidCancelSuite:]";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "[DADeviceConnectionLocal] %s", (uint8_t *)&v9, 0xCu);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceConnectionLocal state](self, "state"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "suiteName"));
  -[DADeviceConnectionLocal _session:didFinishSuiteWithName:skipped:](self, "_session:didFinishSuiteWithName:skipped:", v4, v8, 1);

}

- (void)_session:(id)a3 didFinishSuiteWithName:(id)a4 skipped:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  uint64_t v10;
  NSObject *v11;
  _QWORD *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  DAHistoryEntry *v21;
  void *v22;
  DAHistoryEntry *v23;
  _QWORD v24[4];
  id v25;
  _QWORD *v26;
  BOOL v27;
  _QWORD v28[5];
  uint8_t buf[4];
  const char *v30;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  v10 = DiagnosticLogHandleForCategory(1);
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v30 = "-[DADeviceConnectionLocal _session:didFinishSuiteWithName:skipped:]";
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "[DADeviceConnectionLocal] %s", buf, 0xCu);
  }

  if (!-[DADeviceConnectionLocal isDisconnecting](self, "isDisconnecting"))
  {
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_10000A444;
    v28[3] = &unk_100132B28;
    v28[4] = self;
    v12 = objc_retainBlock(v28);
    if (objc_msgSend(v8, "shouldShowResults")
      && (v13 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceConnectionLocal state](self, "state")),
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "diagnosticEventID")),
          v14,
          v13,
          v14))
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceConnectionLocal session](self, "session"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceConnectionLocal state](self, "state"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "diagnosticEventID"));
      v24[0] = _NSConcreteStackBlock;
      v24[1] = 3221225472;
      v24[2] = sub_10000A630;
      v24[3] = &unk_100132B50;
      v26 = v12;
      v25 = v9;
      v27 = v5;
      objc_msgSend(v15, "requestSuiteSummary:completionHandler:", v17, v24);

      v18 = v26;
    }
    else
    {
      v19 = DiagnosticLogHandleForCategory(1);
      v20 = objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Skipping requesting suite summary", buf, 2u);
      }

      v21 = [DAHistoryEntry alloc];
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceConnectionLocal state](self, "state"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "suiteName"));
      v23 = -[DAHistoryEntry initWithTestSuiteName:skipped:](v21, "initWithTestSuiteName:skipped:", v22, v5);
      ((void (*)(_QWORD *, DAHistoryEntry *, _QWORD))v12[2])(v12, v23, 0);

    }
  }

}

- (void)session:(id)a3 didUpdateTestSuiteProgress:(id)a4
{
  id v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  int v9;
  const char *v10;

  v5 = a4;
  v6 = DiagnosticLogHandleForCategory(1);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 136315138;
    v10 = "-[DADeviceConnectionLocal session:didUpdateTestSuiteProgress:]";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "[DADeviceConnectionLocal] %s", (uint8_t *)&v9, 0xCu);
  }

  if (!-[DADeviceConnectionLocal isDisconnecting](self, "isDisconnecting"))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceConnectionLocal state](self, "state"));
    objc_msgSend(v8, "setProgress:", v5);

  }
}

- (void)session:(id)a3 didUpdateTestSuiteImage:(id)a4
{
  id v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  int v9;
  const char *v10;

  v5 = a4;
  v6 = DiagnosticLogHandleForCategory(1);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 136315138;
    v10 = "-[DADeviceConnectionLocal session:didUpdateTestSuiteImage:]";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "[DADeviceConnectionLocal] %s", (uint8_t *)&v9, 0xCu);
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceConnectionLocal state](self, "state"));
  objc_msgSend(v8, "setTestSuiteImageData:", v5);

}

- (id)session:(id)a3 progressForTest:(id)a4
{
  id v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  uint64_t v13;
  NSObject *v14;
  int v16;
  const char *v17;
  __int16 v18;
  void *v19;

  v5 = a4;
  v6 = DiagnosticLogHandleForCategory(1);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v16 = 136315138;
    v17 = "-[DADeviceConnectionLocal session:progressForTest:]";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "[DADeviceConnectionLocal] %s", (uint8_t *)&v16, 0xCu);
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceConnectionLocal progressForTest](self, "progressForTest"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", v5));

  if (v9 && (objc_msgSend(v9, "isIndeterminate") & 1) == 0)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "fractionCompleted"));
    objc_msgSend(v11, "doubleValue");
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v12 * 100.0));

  }
  else
  {
    v10 = 0;
  }
  v13 = DiagnosticLogHandleForCategory(1);
  v14 = objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v16 = 136315394;
    v17 = "-[DADeviceConnectionLocal session:progressForTest:]";
    v18 = 2112;
    v19 = v10;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "[DADeviceConnectionLocal] %s progress is: %@", (uint8_t *)&v16, 0x16u);
  }

  return v10;
}

- (id)session:(id)a3 estimatedTimeRemainingForTest:(id)a4
{
  id v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  int v12;
  const char *v13;

  v5 = a4;
  v6 = DiagnosticLogHandleForCategory(1);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 136315138;
    v13 = "-[DADeviceConnectionLocal session:estimatedTimeRemainingForTest:]";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "[DADeviceConnectionLocal] %s", (uint8_t *)&v12, 0xCu);
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceConnectionLocal progressForTest](self, "progressForTest"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", v5));

  if (v9)
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "estimatedTimeRemaining"));
  else
    v10 = 0;

  return v10;
}

- (void)session:(id)a3 didRequestSuiteRunWithDestinations:(id)a4 confirmation:(id)a5
{
  id v7;
  id v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  DADeviceConnectionLocal *v15;
  id v16;

  v7 = a4;
  v8 = a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceConnectionLocal delegate](self, "delegate"));
  v10 = objc_opt_respondsToSelector(v9, "deviceConnection:didRequestSuiteRunWithDestinations:confirmation:");

  if ((v10 & 1) != 0)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceConnectionLocal delegate](self, "delegate"));
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10000AC8C;
    v13[3] = &unk_100132BA0;
    v14 = v7;
    v15 = self;
    v16 = v8;
    objc_msgSend(v11, "deviceConnection:didRequestSuiteRunWithDestinations:confirmation:", self, v14, v13);

  }
  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceConnectionLocal state](self, "state"));
    objc_msgSend(v12, "setSuitesAvailable:", &__NSArray0__struct);

    (*((void (**)(id, _QWORD))v8 + 2))(v8, 0);
  }

}

- (void)session:(id)a3 didRequestInstructionalPrompt:(id)a4 withConfirmation:(id)a5
{
  void (**v7)(id, void *, _QWORD);
  void *v8;
  char v9;
  void *v10;
  id v11;

  v11 = a4;
  v7 = (void (**)(id, void *, _QWORD))a5;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceConnectionLocal delegate](self, "delegate"));
  v9 = objc_opt_respondsToSelector(v8, "deviceConnection:didRequestInstructionalPrompt:withConfirmation:");

  if ((v9 & 1) != 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceConnectionLocal delegate](self, "delegate"));
    objc_msgSend(v10, "deviceConnection:didRequestInstructionalPrompt:withConfirmation:", self, v11, v7);
  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "identifier"));
    v7[2](v7, v10, 0);
  }

}

- (void)session:(id)a3 cancelTest:(id)a4
{
  id v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  int v11;
  const char *v12;

  v5 = a4;
  v6 = DiagnosticLogHandleForCategory(1);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 136315138;
    v12 = "-[DADeviceConnectionLocal session:cancelTest:]";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "[DADeviceConnectionLocal] %s", (uint8_t *)&v11, 0xCu);
  }

  v9 = (void *)objc_opt_new(DADeviceConnectionCancelTestCommand, v8);
  objc_msgSend(v9, "setTestID:", v5);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceConnectionLocal delegate](self, "delegate"));
  objc_msgSend(v10, "deviceConnection:didRecieveCommand:", self, v9);

}

- (void)session:(id)a3 profile:(id)a4 filteredByComponents:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  uint8_t buf[4];
  const char *v21;

  v8 = a3;
  v9 = a5;
  v10 = a4;
  v11 = DiagnosticLogHandleForCategory(1);
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v21 = "-[DADeviceConnectionLocal session:profile:filteredByComponents:]";
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "[DADeviceConnectionLocal] %s", buf, 0xCu);
  }

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceConnectionLocal state](self, "state"));
  objc_msgSend(v13, "setPhase:", 3);

  v15 = (void *)objc_opt_new(DADeviceConnectionProfileCommand, v14);
  objc_msgSend(v15, "setComponents:", v9);

  objc_msgSend(v15, "setProfile:", v10);
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10000B0D8;
  v18[3] = &unk_100132BC8;
  v19 = v8;
  v16 = v8;
  objc_msgSend(v15, "setCompletion:", v18);
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceConnectionLocal delegate](self, "delegate"));
  objc_msgSend(v17, "deviceConnection:didRecieveCommand:", self, v15);

}

- (void)session:(id)a3 didPauseWithError:(id)a4
{
  id v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  const char *v11;

  v5 = a4;
  v6 = DiagnosticLogHandleForCategory(1);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 136315138;
    v11 = "-[DADeviceConnectionLocal session:didPauseWithError:]";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "[DADeviceConnectionLocal] %s", (uint8_t *)&v10, 0xCu);
  }

  if (objc_msgSend(v5, "code") == (id)-1004)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceConnectionLocal state](self, "state"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "userInfo"));
    objc_msgSend(v8, "addErrorCode:userInfo:", 3, v9);

  }
}

- (void)sessionDidResume:(id)a3
{
  uint64_t v4;
  NSObject *v5;
  void *v6;
  int v7;
  const char *v8;

  v4 = DiagnosticLogHandleForCategory(1);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315138;
    v8 = "-[DADeviceConnectionLocal sessionDidResume:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[DADeviceConnectionLocal] %s", (uint8_t *)&v7, 0xCu);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceConnectionLocal state](self, "state"));
  objc_msgSend(v6, "removeErrorCode:", 3);

}

- (void)session:(id)a3 didPauseSendingResultForTest:(id)a4 error:(id)a5
{
  id v6;
  uint64_t v7;
  NSObject *v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  int v13;
  const char *v14;

  v6 = a5;
  v7 = DiagnosticLogHandleForCategory(1);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 136315138;
    v14 = "-[DADeviceConnectionLocal session:didPauseSendingResultForTest:error:]";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "[DADeviceConnectionLocal] %s", (uint8_t *)&v13, 0xCu);
  }

  v9 = objc_msgSend(v6, "code");
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceConnectionLocal state](self, "state"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "userInfo"));
  if (v9 == (id)-1003)
    v12 = 2;
  else
    v12 = 3;
  objc_msgSend(v10, "addErrorCode:userInfo:", v12, v11);

}

- (void)session:(id)a3 didResumeSendingResultForTest:(id)a4
{
  uint64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint8_t buf[4];
  const char *v10;

  v5 = DiagnosticLogHandleForCategory(1);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v10 = "-[DADeviceConnectionLocal session:didResumeSendingResultForTest:]";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "[DADeviceConnectionLocal] %s", buf, 0xCu);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceConnectionLocal state](self, "state"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObjects:](NSSet, "setWithObjects:", &off_10013EFE0, &off_10013EFF8, 0));
  objc_msgSend(v7, "removeErrorCodes:", v8);

}

- (void)session:(id)a3 didFinishSendingResultForTest:(id)a4
{
  id v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  const char *v12;

  v5 = a4;
  v6 = DiagnosticLogHandleForCategory(1);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 136315138;
    v12 = "-[DADeviceConnectionLocal session:didFinishSendingResultForTest:]";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "[DADeviceConnectionLocal] %s", (uint8_t *)&v11, 0xCu);
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceConnectionLocal sandboxExtensionHandles](self, "sandboxExtensionHandles"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", v5));

  +[DKSandboxExtension releaseSandboxExtensionsWithHandles:](DKSandboxExtension, "releaseSandboxExtensionsWithHandles:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceConnectionLocal sandboxExtensionHandles](self, "sandboxExtensionHandles"));
  objc_msgSend(v10, "removeObjectForKey:", v5);

  -[DADeviceConnectionLocal didFinishSendingResultForTest:](self, "didFinishSendingResultForTest:", v5);
}

- (void)session:(id)a3 didUpdateSettings:(id)a4 completionHandler:(id)a5
{
  id v8;
  void (**v9)(id, void *, _QWORD);
  id v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  unsigned __int8 v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  const char *v22;

  v8 = a3;
  v9 = (void (**)(id, void *, _QWORD))a5;
  v10 = a4;
  v11 = DiagnosticLogHandleForCategory(1);
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v21 = 136315138;
    v22 = "-[DADeviceConnectionLocal session:didUpdateSettings:completionHandler:]";
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "[DADeviceConnectionLocal] %s", (uint8_t *)&v21, 0xCu);
  }

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[DASessionSettings sessionSettingsWithDictionary:](DASessionSettings, "sessionSettingsWithDictionary:", v10));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceConnectionLocal state](self, "state"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "sessionSettings"));
  v16 = objc_msgSend(v15, "isEqual:", v13);

  if ((v16 & 1) == 0)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceConnectionLocal state](self, "state"));
    objc_msgSend(v17, "setSessionSettings:", v13);

    objc_msgSend(v8, "setAllowCellularSizeThreshold:", objc_msgSend(v13, "allowCellularSizeThreshold"));
  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceConnectionLocal state](self, "state"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "sessionSettings"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "dictionary"));
  v9[2](v9, v20, 0);

}

- (void)sessionDidReboot:(id)a3 withParameters:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  int v10;
  const char *v11;

  v6 = a4;
  v7 = a3;
  v8 = DiagnosticLogHandleForCategory(1);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 136315138;
    v11 = "-[DADeviceConnectionLocal sessionDidReboot:withParameters:]";
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "[DADeviceConnectionLocal] %s", (uint8_t *)&v10, 0xCu);
  }

  -[DADeviceConnectionLocal _sessionDidPowerOff:forReboot:withParameters:](self, "_sessionDidPowerOff:forReboot:withParameters:", v7, 1, v6);
}

- (void)sessionDidShutDown:(id)a3 withParameters:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  int v10;
  const char *v11;

  v6 = a4;
  v7 = a3;
  v8 = DiagnosticLogHandleForCategory(1);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 136315138;
    v11 = "-[DADeviceConnectionLocal sessionDidShutDown:withParameters:]";
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "[DADeviceConnectionLocal] %s", (uint8_t *)&v10, 0xCu);
  }

  -[DADeviceConnectionLocal _sessionDidPowerOff:forReboot:withParameters:](self, "_sessionDidPowerOff:forReboot:withParameters:", v7, 0, v6);
}

- (void)session:(id)a3 generateAuthInfoWithNonce:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  _QWORD v19[4];
  id v20;
  uint8_t buf[4];
  const char *v22;

  v6 = a3;
  v7 = a4;
  v8 = DiagnosticLogHandleForCategory(1);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v22 = "-[DADeviceConnectionLocal session:generateAuthInfoWithNonce:]";
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "[DADeviceConnectionLocal] %s", buf, 0xCu);
  }

  CFPreferencesAppSynchronize(CFSTR("com.apple.AppleServiceToolkit"));
  v10 = (void *)CFPreferencesCopyAppValue(CFSTR("StrongDeviceIdentity"), CFSTR("com.apple.AppleServiceToolkit"));
  v11 = v10;
  if (v10 && !objc_msgSend(v10, "BOOLValue"))
  {
    v17 = DiagnosticLogHandleForCategory(1);
    v18 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "Strong device identity is OFF.", buf, 2u);
    }

    objc_msgSend(v6, "sendAuthInfoResult:error:", 0, 0);
  }
  else
  {
    v12 = DiagnosticLogHandleForCategory(1);
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Strong device identity is ON.", buf, 2u);
    }

    v15 = (void *)objc_opt_new(DAStrongDeviceIdentity, v14);
    -[DADeviceConnectionLocal setStrongDeviceIdentity:](self, "setStrongDeviceIdentity:", v15);

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceConnectionLocal strongDeviceIdentity](self, "strongDeviceIdentity"));
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_10000BB90;
    v19[3] = &unk_100132BF0;
    v20 = v6;
    objc_msgSend(v16, "generateAuthInfoWithNonce:completion:", v7, v19);

  }
}

- (void)session:(id)a3 signPayload:(id)a4 completionHandler:(id)a5
{
  id v7;
  void (**v8)(id, void *, id);
  uint64_t v9;
  NSObject *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  uint8_t buf[4];
  const char *v16;

  v7 = a4;
  v8 = (void (**)(id, void *, id))a5;
  v9 = DiagnosticLogHandleForCategory(1);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v16 = "-[DADeviceConnectionLocal session:signPayload:completionHandler:]";
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "[DADeviceConnectionLocal] %s", buf, 0xCu);
  }

  v11 = (id)objc_claimAutoreleasedReturnValue(-[DADeviceConnectionLocal strongDeviceIdentity](self, "strongDeviceIdentity"));
  if (v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceConnectionLocal strongDeviceIdentity](self, "strongDeviceIdentity"));
    v14 = 0;
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "signPayload:error:", v7, &v14));
    v11 = v14;

  }
  else
  {
    v13 = 0;
  }
  v8[2](v8, v13, v11);

}

- (void)session:(id)a3 signFile:(id)a4 completionHandler:(id)a5
{
  id v7;
  void (**v8)(id, void *, id);
  uint64_t v9;
  NSObject *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  uint8_t buf[4];
  const char *v16;

  v7 = a4;
  v8 = (void (**)(id, void *, id))a5;
  v9 = DiagnosticLogHandleForCategory(1);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v16 = "-[DADeviceConnectionLocal session:signFile:completionHandler:]";
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "[DADeviceConnectionLocal] %s", buf, 0xCu);
  }

  v11 = (id)objc_claimAutoreleasedReturnValue(-[DADeviceConnectionLocal strongDeviceIdentity](self, "strongDeviceIdentity"));
  if (v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceConnectionLocal strongDeviceIdentity](self, "strongDeviceIdentity"));
    v14 = 0;
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "signFile:error:", v7, &v14));
    v11 = v14;

  }
  else
  {
    v13 = 0;
  }
  v8[2](v8, v13, v11);

}

- (void)_sessionDidPowerOff:(id)a3 forReboot:(BOOL)a4 withParameters:(id)a5
{
  _BOOL8 v5;
  id v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  int v19;
  const char *v20;

  v5 = a4;
  v7 = a5;
  v8 = DiagnosticLogHandleForCategory(1);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v19 = 136315138;
    v20 = "-[DADeviceConnectionLocal _sessionDidPowerOff:forReboot:withParameters:]";
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "[DADeviceConnectionLocal] %s", (uint8_t *)&v19, 0xCu);
  }

  if (+[CBSUtilities isCheckerBoardActive](CBSUtilities, "isCheckerBoardActive"))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceConnectionLocal session](self, "session"));
    objc_msgSend(v10, "archive");

  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("bootMode")));
  if (v11 && (v12 = objc_opt_class(NSNumber), (objc_opt_isKindOfClass(v11, v12) & 1) != 0))
    v13 = (uint64_t)objc_msgSend(v11, "integerValue");
  else
    v13 = 2;
  -[DADeviceConnectionLocal _setNextBootForBootMode:](self, "_setNextBootForBootMode:", v13);
  if (objc_msgSend(v11, "integerValue") == (id)3)
  {
    v14 = DiagnosticLogHandleForCategory(3);
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v19) = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Starting battery disconnect shutdown sequence.", (uint8_t *)&v19, 2u);
    }

    v16 = -[DADeviceConnectionLocal _unsealCodeFromParameters:](self, "_unsealCodeFromParameters:", v7);
    +[NSThread sleepForTimeInterval:](NSThread, "sleepForTimeInterval:", 5.0);
    if (-[DADeviceConnectionLocal _shutdownForBatteryDisconnectWithUnsealCode:](self, "_shutdownForBatteryDisconnectWithUnsealCode:", v16))
    {
      goto LABEL_19;
    }
LABEL_18:
    -[DADeviceConnectionLocal _shutDownDeviceForReboot:](self, "_shutDownDeviceForReboot:", v5);
    goto LABEL_19;
  }
  if (objc_msgSend(v11, "integerValue") != (id)4)
    goto LABEL_18;
  v17 = DiagnosticLogHandleForCategory(3);
  v18 = objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v19) = 0;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Starting entry into Shelf Life Mode.", (uint8_t *)&v19, 2u);
  }

  +[NSThread sleepForTimeInterval:](NSThread, "sleepForTimeInterval:", 5.0);
  if (!-[DADeviceConnectionLocal _shutdownToShelfLifeMode](self, "_shutdownToShelfLifeMode"))
    goto LABEL_18;
LABEL_19:

}

- (void)_setNextBootForBootMode:(int64_t)a3
{
  uint64_t v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  int64_t v15;

  v4 = DiagnosticLogHandleForCategory(3);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v14 = 134217984;
    v15 = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Setting next boot to %ld", (uint8_t *)&v14, 0xCu);
  }

  switch(a3)
  {
    case 0:
    case 3:
    case 4:
      v6 = objc_claimAutoreleasedReturnValue(+[DANvramUtil sharedInstance](DANvramUtil, "sharedInstance"));
      -[NSObject clearNextBootCheckerBoardPersistent](v6, "clearNextBootCheckerBoardPersistent");
      break;
    case 1:
      v6 = objc_claimAutoreleasedReturnValue(+[DANvramUtil sharedInstance](DANvramUtil, "sharedInstance"));
      -[NSObject setNextBootRecovery](v6, "setNextBootRecovery");
      break;
    case 2:
      v6 = objc_claimAutoreleasedReturnValue(+[DANvramUtil sharedInstance](DANvramUtil, "sharedInstance"));
      -[NSObject setNextBootCheckerBoard](v6, "setNextBootCheckerBoard");
      break;
    case 5:
      v6 = objc_claimAutoreleasedReturnValue(+[DANvramUtil sharedInstance](DANvramUtil, "sharedInstance"));
      -[NSObject setNextBootCheckerBoardPersistent](v6, "setNextBootCheckerBoardPersistent");
      break;
    default:
      v7 = DiagnosticLogHandleForCategory(3);
      v6 = objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        sub_1000EA694(a3, v6, v8, v9, v10, v11, v12, v13);
      break;
  }

}

- (void)_shutDownDeviceForReboot:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t v4;
  NSObject *v5;
  id v6;
  id v7;
  uint8_t v8[16];

  v3 = a3;
  v4 = DiagnosticLogHandleForCategory(1);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Diagnostics is rebooting this device", v8, 2u);
  }

  v6 = objc_alloc_init((Class)FBSSystemService);
  v7 = objc_msgSend(objc_alloc((Class)FBSShutdownOptions), "initWithReason:", CFSTR("Rebooting for Diagnostics"));
  objc_msgSend(v7, "setRebootType:", v3);
  objc_msgSend(v6, "shutdownWithOptions:", v7);

}

- (unsigned)_unsealCodeFromParameters:(id)a3
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  int v9;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("unsealCode")));
  v5 = objc_opt_class(NSString);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
  {
    v9 = 0;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSScanner scannerWithString:](NSScanner, "scannerWithString:", v4));
    if ((objc_msgSend(v6, "scanHexInt:", &v9) & 1) != 0)
    {
      LODWORD(v3) = v9;
    }
    else
    {
      v7 = DiagnosticLogHandleForCategory(3);
      v3 = objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
        sub_1000EA6F8();

    }
  }

  return v3;
}

- (BOOL)_shutdownForBatteryDisconnectWithUnsealCode:(unsigned int)a3
{
  id v4;
  unsigned int v5;
  uint64_t v6;
  NSObject *v7;
  NSObject *v8;
  unsigned __int8 v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  NSObject *v13;
  unsigned int v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  NSObject *v18;
  unsigned int v19;
  uint64_t v20;
  NSObject *v21;
  uint64_t v22;
  NSObject *v23;
  unsigned int v24;
  uint64_t v25;
  NSObject *v26;
  uint64_t v27;
  NSObject *v28;
  BOOL v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unsigned __int16 v35;
  unsigned __int16 v36;
  unsigned __int16 v37;
  __int16 v38;
  unsigned __int16 v39;
  __int16 v40;
  uint8_t buf[4];
  int v42;

  v4 = objc_alloc_init((Class)DSAppleSMCDevice);
  objc_msgSend(v4, "openAppleSMC:", 0);
  v39 = HIWORD(a3);
  v40 = a3;
  v5 = objc_msgSend(v4, "writeDataFor:value:size:", CFSTR("GCCM"), &v40, 2);
  v6 = DiagnosticLogHandleForCategory(3);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  v8 = v7;
  if (!v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_1000EA750();
    goto LABEL_47;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Low bytes of unseal code successfully written to SMC", buf, 2u);
  }

  v9 = objc_msgSend(v4, "writeDataFor:value:size:", CFSTR("GCRW"), &v39, 2);
  v10 = DiagnosticLogHandleForCategory(3);
  v11 = objc_claimAutoreleasedReturnValue(v10);
  v8 = v11;
  if ((v9 & 1) == 0)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_1000EA750();
    goto LABEL_47;
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    v42 = v39;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "High bytes of unseal code successfully written to SMC, %#x", buf, 8u);
  }

  v38 = 0;
  if ((objc_msgSend(v4, "writeDataFor:value:size:", CFSTR("GCCM"), &v38, 2) & 1) == 0)
  {
    v30 = DiagnosticLogHandleForCategory(3);
    v8 = objc_claimAutoreleasedReturnValue(v30);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_1000EA724();
    goto LABEL_47;
  }
  v37 = 0;
  v12 = DiagnosticLogHandleForCategory(3);
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Status read control register written low bytes to SMC", buf, 2u);
  }

  v14 = objc_msgSend(v4, "readDataFor:value:size:", CFSTR("GCRW"), &v37, 2);
  v15 = DiagnosticLogHandleForCategory(3);
  v16 = objc_claimAutoreleasedReturnValue(v15);
  v8 = v16;
  if (!v14)
  {
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      goto LABEL_47;
LABEL_36:
    sub_1000EA724();
    goto LABEL_47;
  }
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    v42 = v37;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Successfully read from status high bytes register address: %#x", buf, 8u);
  }

  if ((v37 & 0x2000) != 0)
  {
    v31 = DiagnosticLogHandleForCategory(3);
    v8 = objc_claimAutoreleasedReturnValue(v31);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      v42 = v37;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Control assignment failed, register value: %#x", buf, 8u);
    }
    goto LABEL_47;
  }
  v37 = 23;
  if (!objc_msgSend(v4, "writeDataFor:value:size:", CFSTR("GCCM"), &v37, 2))
  {
    v32 = DiagnosticLogHandleForCategory(3);
    v8 = objc_claimAutoreleasedReturnValue(v32);
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      goto LABEL_47;
    goto LABEL_36;
  }
  v36 = 0;
  v17 = DiagnosticLogHandleForCategory(3);
  v18 = objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "First read control register low bytes written to SMC", buf, 2u);
  }

  v19 = objc_msgSend(v4, "readDataFor:value:size:", CFSTR("GCRW"), &v36, 2);
  v20 = DiagnosticLogHandleForCategory(3);
  v21 = objc_claimAutoreleasedReturnValue(v20);
  v8 = v21;
  if (!v19)
  {
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
LABEL_42:
      sub_1000EA724();
LABEL_47:

    v29 = 0;
    goto LABEL_48;
  }
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    v42 = v36;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Successfully read from first control register high bytes address: %#x", buf, 8u);
  }

  v36 = 32;
  if (!objc_msgSend(v4, "writeDataFor:value:size:", CFSTR("GCCM"), &v36, 2))
  {
    v33 = DiagnosticLogHandleForCategory(3);
    v8 = objc_claimAutoreleasedReturnValue(v33);
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      goto LABEL_47;
    goto LABEL_42;
  }
  v35 = 0;
  v22 = DiagnosticLogHandleForCategory(3);
  v23 = objc_claimAutoreleasedReturnValue(v22);
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Second read control register low bytes written to SMC", buf, 2u);
  }

  v24 = objc_msgSend(v4, "readDataFor:value:size:", CFSTR("GCRW"), &v35, 2);
  v25 = DiagnosticLogHandleForCategory(3);
  v26 = objc_claimAutoreleasedReturnValue(v25);
  v8 = v26;
  if (!v24)
  {
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      sub_1000EA724();
    goto LABEL_47;
  }
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    v42 = v35;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Successfully read from second control register high bytes value: %#x", buf, 8u);
  }

  v27 = DiagnosticLogHandleForCategory(3);
  v28 = objc_claimAutoreleasedReturnValue(v27);
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Battery Disconnect shutdown successfully initiated.", buf, 2u);
  }

  v29 = 1;
LABEL_48:

  return v29;
}

- (BOOL)_shutdownToShelfLifeMode
{
  id v3;
  void *v4;
  unsigned int v5;
  BOOL v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;

  v3 = objc_alloc_init((Class)DSAppleSMCDevice);
  objc_msgSend(v3, "openAppleSMC:", 0);
  if (!objc_msgSend(v3, "writeValueFor:andValue:", CFSTR("BCSL"), &off_10013F010))
  {
    v7 = DiagnosticLogHandleForCategory(3);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      goto LABEL_7;
    goto LABEL_8;
  }
  objc_msgSend(v3, "readValueFor:", CFSTR("BCSL"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
  v5 = objc_msgSend(v4, "unsignedIntValue");

  if (v5 != 2)
  {
    v9 = DiagnosticLogHandleForCategory(3);
    v8 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
LABEL_7:
      sub_1000EA77C();
LABEL_8:

    v6 = 0;
    goto LABEL_9;
  }
  -[DADeviceConnectionLocal _shutDownDeviceForReboot:](self, "_shutDownDeviceForReboot:", 0);
  v6 = 1;
LABEL_9:

  return v6;
}

- (void)archive
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[DADeviceConnectionLocal session](self, "session"));
  objc_msgSend(v2, "archive");

}

- (DADeviceConnectionDelegate)delegate
{
  return (DADeviceConnectionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSMutableDictionary)progressForTest
{
  return self->_progressForTest;
}

- (void)setProgressForTest:(id)a3
{
  objc_storeStrong((id *)&self->_progressForTest, a3);
}

- (DADeviceConnectionConfigurator)configurator
{
  return self->_configurator;
}

- (void)setConfigurator:(id)a3
{
  objc_storeStrong((id *)&self->_configurator, a3);
}

- (ASTSession)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
  objc_storeStrong((id *)&self->_session, a3);
}

- (DASessionSettings)sessionSettings
{
  return self->_sessionSettings;
}

- (void)setSessionSettings:(id)a3
{
  objc_storeStrong((id *)&self->_sessionSettings, a3);
}

- (DAStrongDeviceIdentity)strongDeviceIdentity
{
  return self->_strongDeviceIdentity;
}

- (void)setStrongDeviceIdentity:(id)a3
{
  objc_storeStrong((id *)&self->_strongDeviceIdentity, a3);
}

- (DAAssetUploader)assetUploader
{
  return self->_assetUploader;
}

- (void)setAssetUploader:(id)a3
{
  objc_storeStrong((id *)&self->_assetUploader, a3);
}

- (NSMutableDictionary)sandboxExtensionHandles
{
  return self->_sandboxExtensionHandles;
}

- (void)setSandboxExtensionHandles:(id)a3
{
  objc_storeStrong((id *)&self->_sandboxExtensionHandles, a3);
}

- (BOOL)isDisconnecting
{
  return self->_disconnecting;
}

- (void)setDisconnecting:(BOOL)a3
{
  self->_disconnecting = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sandboxExtensionHandles, 0);
  objc_storeStrong((id *)&self->_assetUploader, 0);
  objc_storeStrong((id *)&self->_strongDeviceIdentity, 0);
  objc_storeStrong((id *)&self->_sessionSettings, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_configurator, 0);
  objc_storeStrong((id *)&self->_progressForTest, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_state, 0);
}

@end
