@implementation DARemoteRunnerManager

+ (id)sharedInstance
{
  if (qword_10016E8D8 != -1)
    dispatch_once(&qword_10016E8D8, &stru_100133520);
  return (id)qword_10016E8D0;
}

- (DARemoteRunnerManager)init
{
  DARemoteRunnerManager *v2;
  DARemoteRunnerManager *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)DARemoteRunnerManager;
  v2 = -[DARemoteRunnerManager init](&v5, "init");
  v3 = v2;
  if (v2)
    -[DARemoteRunnerManager initListener](v2, "initListener");
  return v3;
}

- (void)initListener
{
  id v3;
  void *v4;
  id v5;

  v3 = objc_msgSend(objc_alloc((Class)NSXPCListener), "initWithMachServiceName:", CFSTR("com.apple.diagnostics.remote-runner-service"));
  -[DARemoteRunnerManager setListener:](self, "setListener:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DARemoteRunnerManager listener](self, "listener"));
  objc_msgSend(v4, "setDelegate:", self);

  v5 = (id)objc_claimAutoreleasedReturnValue(-[DARemoteRunnerManager listener](self, "listener"));
  objc_msgSend(v5, "resume");

}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  BOOL v19;
  uint64_t v21;
  NSObject *v22;
  void *v23;
  _QWORD v24[5];
  id v25;
  id location;
  uint8_t v27[4];
  id v28;
  __int128 buf;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  _QWORD v34[7];
  _QWORD v35[6];

  v6 = a3;
  v7 = a4;
  v8 = DiagnosticLogHandleForCategory(8);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "New connection %@ requested for remote runner service", (uint8_t *)&buf, 0xCu);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "valueForEntitlement:", CFSTR("com.apple.diagnostics.remote-runner-service")));
  v11 = objc_opt_class(NSNumber);
  if ((objc_opt_isKindOfClass(v10, v11) & 1) == 0 || !objc_msgSend(v10, "BOOLValue"))
  {
    objc_msgSend(v7, "invalidate");
LABEL_9:
    v19 = 1;
    goto LABEL_10;
  }
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___DARemoteRunnerServerProtocol));
  v35[0] = objc_opt_class(DKDiagnosticParameters);
  v35[1] = objc_opt_class(NSArray);
  v35[2] = objc_opt_class(NSDictionary);
  v35[3] = objc_opt_class(NSString);
  v35[4] = objc_opt_class(NSNumber);
  v35[5] = objc_opt_class(NSData);
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v35, 6));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v12));
  objc_msgSend(v23, "setClasses:forSelector:argumentIndex:ofReply:", v13, "runTestWithID:name:description:parameters:completion:", 3, 0);

  v34[0] = objc_opt_class(DKDiagnosticResult);
  v34[1] = objc_opt_class(NSArray);
  v34[2] = objc_opt_class(NSDictionary);
  v34[3] = objc_opt_class(NSString);
  v34[4] = objc_opt_class(NSNumber);
  v34[5] = objc_opt_class(NSData);
  v34[6] = objc_opt_class(NSURL);
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v34, 7));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v14));
  objc_msgSend(v23, "setClasses:forSelector:argumentIndex:ofReply:", v15, "runTestWithID:name:description:parameters:completion:", 0, 1);

  objc_msgSend(v7, "setExportedObject:", self);
  objc_msgSend(v7, "setExportedInterface:", v23);
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___DARemoteRunnerClientProtocol));
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v30 = 0x3032000000;
  v31 = sub_100019CE4;
  v32 = sub_100019CF4;
  v33 = 0;
  objc_initWeak(&location, v7);
  objc_msgSend(v7, "setRemoteObjectInterface:", v16);
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_100019CFC;
  v24[3] = &unk_100133548;
  v24[4] = &buf;
  objc_copyWeak(&v25, &location);
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "synchronousRemoteObjectProxyWithErrorHandler:", v24));
  v18 = v17;
  if (v17 && !*(_QWORD *)(*((_QWORD *)&buf + 1) + 40))
  {
    -[DARemoteRunnerManager setRemoteClient:](self, "setRemoteClient:", v17);
    objc_msgSend(v7, "resume");
    v21 = DiagnosticLogHandleForCategory(8);
    v22 = objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v27 = 138412290;
      v28 = v7;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Connection %@ established with remote runner service", v27, 0xCu);
    }

    objc_destroyWeak(&v25);
    objc_destroyWeak(&location);
    _Block_object_dispose(&buf, 8);

    goto LABEL_9;
  }

  objc_destroyWeak(&v25);
  objc_destroyWeak(&location);
  _Block_object_dispose(&buf, 8);

  v19 = 0;
LABEL_10:

  return v19;
}

- (void)ping:(id)a3
{
  void (**v3)(_QWORD);
  uint64_t v4;
  NSObject *v5;
  uint8_t v6[16];

  v3 = (void (**)(_QWORD))a3;
  v4 = DiagnosticLogHandleForCategory(8);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Remote runner is pinging to see if we are alive", v6, 2u);
  }

  v3[2](v3);
}

- (void)createRemoteRunnerDeviceWithSerialNumber:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, _UNKNOWN **);
  uint64_t v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  DADeviceLocalRemoteRunner *v13;
  DADeviceLocalRemoteRunner *v14;
  DADeviceState *v15;
  DADeviceState *state;
  void *v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  uint64_t v21;
  NSObject *v22;
  int v23;
  id v24;

  v6 = a3;
  v7 = (void (**)(id, _UNKNOWN **))a4;
  v8 = DiagnosticLogHandleForCategory(8);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v23 = 138412290;
    v24 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Remote runner create device requested with serial number %@", (uint8_t *)&v23, 0xCu);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[DARemoteRunnerManager device](self, "device"));
  if (v10)
  {
    v11 = DiagnosticLogHandleForCategory(8);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v23) = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Remote runner create device failed - a remote runner device already exists!", (uint8_t *)&v23, 2u);
    }

    v7[2](v7, &off_10013F718);
  }
  else
  {
    v13 = -[DADeviceLocal initWithSerialNumber:]([DADeviceLocalRemoteRunner alloc], "initWithSerialNumber:", v6);
    v14 = v13;
    if (v13)
    {
      v15 = (DADeviceState *)objc_claimAutoreleasedReturnValue(-[DADeviceLocal state](v13, "state"));
      state = self->_state;
      self->_state = v15;

      -[DADeviceState setPhase:](self->_state, "setPhase:", 0);
      -[DARemoteRunnerManager setDevice:](self, "setDevice:", v14);
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
      objc_msgSend(v17, "postNotificationName:object:", CFSTR("DARemoteRunnerDeviceCreatedNotification"), v14);

      v18 = (void *)objc_claimAutoreleasedReturnValue(-[DARemoteRunnerManager device](self, "device"));
      objc_msgSend(v18, "start");

      v7[2](v7, &off_10013F730);
      v19 = DiagnosticLogHandleForCategory(8);
      v20 = objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v23) = 0;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Remote runner device created successfully", (uint8_t *)&v23, 2u);
      }

    }
    else
    {
      v21 = DiagnosticLogHandleForCategory(8);
      v22 = objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v23) = 0;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Remote runner device creation failed", (uint8_t *)&v23, 2u);
      }

      v7[2](v7, &off_10013F748);
    }

  }
}

- (void)destroyRemoteRunnerDeviceWithCompletion:(id)a3
{
  void (**v4)(id, _UNKNOWN **);
  uint64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  _UNKNOWN **v9;
  uint8_t v10[16];

  v4 = (void (**)(id, _UNKNOWN **))a3;
  v5 = DiagnosticLogHandleForCategory(8);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Remote runner device destroy requested", v10, 2u);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[DARemoteRunnerManager device](self, "device"));
  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[DARemoteRunnerManager device](self, "device"));
    objc_msgSend(v8, "end");

    v9 = &off_10013F730;
  }
  else
  {
    v9 = &off_10013F760;
  }
  v4[2](v4, v9);

}

- (void)getReportWithComponents:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  __CFString *v10;
  void *v11;
  DADeviceConnectionProfileCommand *v12;
  id v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  _QWORD v17[4];
  id v18;
  uint8_t buf[4];
  __CFString *v20;

  v6 = a3;
  v7 = a4;
  v8 = DiagnosticLogHandleForCategory(8);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = v6 ? (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "debugDescription")) : CFSTR("all");
    *(_DWORD *)buf = 138412290;
    v20 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Remote runner device run test requested system report with components: %@", buf, 0xCu);
    if (v6)

  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[DARemoteRunnerManager device](self, "device"));

  if (v11)
  {
    if (v6 && objc_msgSend(v6, "count"))
    {
      v12 = objc_alloc_init(DADeviceConnectionProfileCommand);
      v13 = objc_alloc_init((Class)ASTProfileResult);
      -[DADeviceConnectionProfileCommand setProfile:](v12, "setProfile:", v13);

      -[DADeviceConnectionProfileCommand setComponents:](v12, "setComponents:", v6);
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_10001A408;
      v17[3] = &unk_100133570;
      v18 = v7;
      -[DADeviceConnectionProfileCommand setCompletion:](v12, "setCompletion:", v17);
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[DARemoteRunnerManager delegate](self, "delegate"));
      objc_msgSend(v14, "deviceConnection:didRecieveCommand:", self, v12);

    }
  }
  else
  {
    v15 = DiagnosticLogHandleForCategory(8);
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Remote runner device run test failed - a remote runner device does not exist.", buf, 2u);
    }

    (*((void (**)(id, _QWORD))v7 + 2))(v7, 0);
  }

}

- (void)getReportWithCompletion:(id)a3
{
  -[DARemoteRunnerManager getReportWithComponents:completion:](self, "getReportWithComponents:completion:", 0, a3);
}

- (void)runTestWithID:(id)a3 name:(id)a4 description:(id)a5 parameters:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  void (**v15)(id, _QWORD, void *);
  uint64_t v16;
  NSObject *v17;
  void *v18;
  _BOOL4 v19;
  _QWORD *v20;
  DADeviceConnectionStartTestCommand *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  NSObject *v25;
  void *v26;
  id v27;
  _QWORD v28[4];
  id v29;
  id v30;
  _QWORD v31[4];
  void (**v32)(id, _QWORD, void *);
  id v33;
  uint8_t buf[4];
  id v35;
  __int16 v36;
  id v37;
  __int16 v38;
  id v39;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v27 = a6;
  v15 = (void (**)(id, _QWORD, void *))a7;
  v16 = DiagnosticLogHandleForCategory(8);
  v17 = objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    v35 = v12;
    v36 = 2112;
    v37 = v13;
    v38 = 2112;
    v39 = v14;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Remote runner device run test requested with ID: %@ name: %@ description: %@", buf, 0x20u);
  }

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[DARemoteRunnerManager device](self, "device"));
  v19 = v18 == 0;

  if (v19)
  {
    v24 = DiagnosticLogHandleForCategory(8);
    v25 = objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Remote runner device run test failed - a remote runner device does not exist.", buf, 2u);
    }

    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("DADiagnosticsRemoteRunner"), -3, 0));
    v15[2](v15, 0, v26);

  }
  else
  {
    objc_initWeak((id *)buf, self);
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    v31[2] = sub_10001A990;
    v31[3] = &unk_1001335B8;
    objc_copyWeak(&v33, (id *)buf);
    v32 = v15;
    v20 = objc_retainBlock(v31);
    v21 = objc_alloc_init(DADeviceConnectionStartTestCommand);
    -[DADeviceConnectionStartTestCommand setTestID:](v21, "setTestID:", v12);
    -[DADeviceConnectionStartTestCommand setParameters:](v21, "setParameters:", v27);
    -[DADeviceConnectionStartTestCommand setCompletion:](v21, "setCompletion:", v20);
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[DARemoteRunnerManager state](self, "state"));
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_10001AAE0;
    v28[3] = &unk_100132AD8;
    v29 = v13;
    v30 = v14;
    objc_msgSend(v22, "transactionWithBlock:", v28);

    v23 = (void *)objc_claimAutoreleasedReturnValue(-[DARemoteRunnerManager delegate](self, "delegate"));
    objc_msgSend(v23, "deviceConnection:didRecieveCommand:", self, v21);

    objc_destroyWeak(&v33);
    objc_destroyWeak((id *)buf);
  }

}

- (void)cancelTestWithID:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, _UNKNOWN **);
  uint64_t v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  DADeviceConnectionCancelTestCommand *v13;
  void *v14;
  int v15;
  id v16;

  v6 = a3;
  v7 = (void (**)(id, _UNKNOWN **))a4;
  v8 = DiagnosticLogHandleForCategory(8);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v15 = 138412290;
    v16 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Remote runner device cancel test requested for ID: %@", (uint8_t *)&v15, 0xCu);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[DARemoteRunnerManager device](self, "device"));
  if (!v10)
  {
    v11 = DiagnosticLogHandleForCategory(8);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v15) = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Remote runner device cancel test failed - a remote runner device does not exist.", (uint8_t *)&v15, 2u);
    }

    v7[2](v7, &off_10013F760);
  }
  v13 = objc_alloc_init(DADeviceConnectionCancelTestCommand);
  -[DADeviceConnectionCancelTestCommand setTestID:](v13, "setTestID:", v6);
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[DARemoteRunnerManager delegate](self, "delegate"));
  objc_msgSend(v14, "deviceConnection:didRecieveCommand:", self, v13);

  v7[2](v7, &off_10013F730);
}

- (void)start
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DARemoteRunnerManager state](self, "state"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObjects:](NSSet, "setWithObjects:", &off_10013F778, &off_10013F790, &off_10013F7A8, 0));
  objc_msgSend(v3, "removeErrorCodes:", v4);

  v5 = (id)objc_claimAutoreleasedReturnValue(-[DARemoteRunnerManager state](self, "state"));
  objc_msgSend(v5, "setPhase:", 4);

}

- (void)end
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DARemoteRunnerManager remoteClient](self, "remoteClient"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[DARemoteRunnerManager remoteClient](self, "remoteClient"));
    objc_msgSend(v4, "remoteRunnerDeviceEnded");

  }
  -[DARemoteRunnerManager _destroyDevice](self, "_destroyDevice");
}

- (void)requestAsset:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD);
  uint64_t v8;
  NSObject *v9;
  void *v10;
  void *v11;
  int v12;
  id v13;

  v6 = a3;
  v7 = (void (**)(id, _QWORD))a4;
  v8 = DiagnosticLogHandleForCategory(8);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 138412290;
    v13 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Remote runner device requesting asset %@", (uint8_t *)&v12, 0xCu);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[DARemoteRunnerManager remoteClient](self, "remoteClient"));
  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[DARemoteRunnerManager remoteClient](self, "remoteClient"));
    objc_msgSend(v11, "requestAsset:completion:", v6, v7);

  }
  else
  {
    v7[2](v7, 0);
  }

}

- (void)requestUploadAssets:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, _UNKNOWN **, void *);
  uint64_t v8;
  NSObject *v9;
  void *v10;
  void *v11;
  int v12;
  id v13;

  v6 = a3;
  v7 = (void (**)(id, _UNKNOWN **, void *))a4;
  v8 = DiagnosticLogHandleForCategory(8);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 138412290;
    v13 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Remote runner device requesting to upload assets: %@", (uint8_t *)&v12, 0xCu);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[DARemoteRunnerManager remoteClient](self, "remoteClient"));
  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[DARemoteRunnerManager remoteClient](self, "remoteClient"));
    objc_msgSend(v11, "requestUploadAssets:completion:", v6, v7);
  }
  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("DADiagnosticsRemoteRunner"), -6, 0));
    v7[2](v7, &off_10013FAF8, v11);
  }

}

- (void)_destroyDevice
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DARemoteRunnerManager device](self, "device"));
  objc_msgSend(v3, "postNotificationName:object:", CFSTR("DARemoteRunnerDeviceDestroyedNotification"), v4);

  -[DARemoteRunnerManager setDevice:](self, "setDevice:", 0);
}

- (DADeviceConnectionDelegate)delegate
{
  return (DADeviceConnectionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSXPCListener)listener
{
  return self->_listener;
}

- (void)setListener:(id)a3
{
  objc_storeStrong((id *)&self->_listener, a3);
}

- (DADeviceLocalRemoteRunner)device
{
  return (DADeviceLocalRemoteRunner *)objc_getProperty(self, a2, 24, 1);
}

- (void)setDevice:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (DADeviceState)state
{
  return self->_state;
}

- (void)setState:(id)a3
{
  objc_storeStrong((id *)&self->_state, a3);
}

- (DARemoteRunnerClientProtocol)remoteClient
{
  return self->_remoteClient;
}

- (void)setRemoteClient:(id)a3
{
  objc_storeStrong((id *)&self->_remoteClient, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteClient, 0);
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
