@implementation DADeviceLocal

- (DADeviceLocal)init
{
  DADeviceLocal *v2;
  DADeviceLocal *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)DADeviceLocal;
  v2 = -[DADeviceLocal init](&v5, "init");
  v3 = v2;
  if (v2)
    -[DADeviceLocal _initDevice](v2, "_initDevice");
  return v3;
}

- (DADeviceLocal)initWithSerialNumber:(id)a3
{
  id v5;
  DADeviceLocal *v6;
  DADeviceLocal *v7;
  void *v8;
  unsigned int v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  objc_super v20;

  v5 = a3;
  v20.receiver = self;
  v20.super_class = (Class)DADeviceLocal;
  v6 = -[DADeviceLocal init](&v20, "init");
  v7 = v6;
  if (v6)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceLocal _serialNumber](v6, "_serialNumber"));
    v9 = objc_msgSend(v5, "isEqualToString:", v8);

    if (v9)
    {
      v10 = DiagnosticLogHandleForCategory(1);
      v11 = objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        sub_1000EACCC(v11, v12, v13, v14, v15, v16, v17, v18);

      v7 = 0;
    }
    else
    {
      objc_storeStrong((id *)&v7->_customSerialNumber, a3);
      -[DADeviceLocal _initDevice](v7, "_initDevice");
    }
  }

  return v7;
}

- (void)setBundleIdentifier:(id)a3
{
  id v4;
  DKReportManager *v5;
  DKReportManager *reportManager;

  v4 = a3;
  v5 = (DKReportManager *)objc_msgSend(objc_alloc((Class)DKReportManager), "initWithBundleIdentifier:", v4);

  reportManager = self->_reportManager;
  self->_reportManager = v5;

}

- (unint64_t)hash
{
  void *v2;
  void *v3;
  id v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceLocal state](self, "state"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "serialNumber"));
  v4 = objc_msgSend(v3, "hash");

  return (unint64_t)v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned __int8 v9;

  v4 = a3;
  if (objc_msgSend(v4, "conformsToProtocol:", &OBJC_PROTOCOL___DADevice))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceLocal state](self, "state"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "serialNumber"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "state"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "serialNumber"));
    v9 = objc_msgSend(v6, "isEqualToString:", v8);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (NSString)description
{
  objc_class *v3;
  NSString *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (objc_class *)objc_opt_class(self);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceLocal state](self, "state"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "serialNumber"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@; %p: %@>"),
                   v5,
                   self,
                   v7));

  return (NSString *)v8;
}

- (BOOL)isLocal
{
  return 1;
}

- (void)start
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "postNotificationName:object:", CFSTR("com.apple.Diagnostics.LocalSessionWillStart"), self);

  v4 = (id)objc_claimAutoreleasedReturnValue(-[DADeviceLocal connection](self, "connection"));
  objc_msgSend(v4, "start");

}

- (void)idle
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[DADeviceLocal connection](self, "connection"));
  objc_msgSend(v2, "idle");

}

- (void)suspendTests
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  void *v6;
  int v7;
  DADeviceLocal *v8;

  v3 = DiagnosticLogHandleForCategory(1);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412290;
    v8 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Test launch suspending for %@.", (uint8_t *)&v7, 0xCu);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceLocal testQueue](self, "testQueue"));
  objc_msgSend(v5, "setSuspended:", 1);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceLocal diagnosticsManager](self, "diagnosticsManager"));
  objc_msgSend(v6, "cancelAllDiagnostics");

}

- (void)resumeTests
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  int v6;
  DADeviceLocal *v7;

  v3 = DiagnosticLogHandleForCategory(1);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Test launch resuming for %@.", (uint8_t *)&v6, 0xCu);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceLocal testQueue](self, "testQueue"));
  objc_msgSend(v5, "setSuspended:", 0);

}

- (void)end
{
  void *v3;
  id v4;
  void *v5;
  dispatch_queue_global_t global_queue;
  NSObject *v7;
  _QWORD block[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceLocal state](self, "state"));
  v4 = objc_msgSend(v3, "phase");

  if (v4 != (id)5)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceLocal state](self, "state"));
    objc_msgSend(v5, "setPhase:", 5);

    global_queue = dispatch_get_global_queue(25, 0);
    v7 = objc_claimAutoreleasedReturnValue(global_queue);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100015B30;
    block[3] = &unk_100132838;
    block[4] = self;
    dispatch_async(v7, block);

  }
}

- (void)requestSuiteStart:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  v8 = (id)objc_claimAutoreleasedReturnValue(-[DADeviceLocal connection](self, "connection"));
  objc_msgSend(v8, "requestSuiteStart:completionHandler:", v7, v6);

}

- (void)requestSuiteFinishWithCompletionHandler:(id)a3
{
  void *v4;
  void *v5;
  void (**v6)(id, _QWORD);

  v6 = (void (**)(id, _QWORD))a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceLocal connection](self, "connection"));
  objc_msgSend(v4, "idle");

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceLocal state](self, "state"));
  objc_msgSend(v5, "setSuiteID:", 0);

  v6[2](v6, 0);
}

- (void)executeTestWithTestAttributes:(id)a3 parameters:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[DAPlatform currentPlatform](DAPlatform, "currentPlatform"));
  objc_msgSend(v11, "undimCheckerBoardDisplay");

  v14 = objc_retainBlock(v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceLocal diagnosticsManager](self, "diagnosticsManager"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "identifier"));

  objc_msgSend(v12, "beginDiagnosticWithIdentifier:parameters:completion:", v13, v9, v14);
}

- (void)startTestWithCommand:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void (**v8)(_QWORD, _QWORD, _QWORD);
  void *v9;
  void *v10;
  id v11;
  id v12;

  v12 = a3;
  v4 = objc_opt_class(DADeviceConnectionStartTestCommand);
  if ((objc_opt_isKindOfClass(v12, v4) & 1) != 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceLocal diagnosticsManager](self, "diagnosticsManager"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "testID"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "attributesForIdentifier:", v6));

    if (v7)
    {
      v8 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[DADeviceLocal testQueue](self, "testQueue"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "parameters"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "completion"));
      v11 = objc_msgSend(v10, "copy");
      objc_msgSend(v8, "enqueueTestWithTestAttributes:parameters:completion:", v7, v9, v11);

    }
    else
    {
      v8 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "completion"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", DKErrorDomain, -1000, 0));
      ((void (**)(_QWORD, _QWORD, void *))v8)[2](v8, 0, v9);
    }

  }
}

- (void)cancelTestWithCommand:(id)a3
{
  id v4;
  uint64_t v5;
  char isKindOfClass;
  id v7;

  v4 = a3;
  v5 = objc_opt_class(DADeviceConnectionCancelTestCommand);
  isKindOfClass = objc_opt_isKindOfClass(v4, v5);

  if ((isKindOfClass & 1) != 0)
  {
    v7 = (id)objc_claimAutoreleasedReturnValue(-[DADeviceLocal diagnosticsManager](self, "diagnosticsManager"));
    objc_msgSend(v7, "cancelAllDiagnostics");

  }
}

- (void)profileWithCommand:(id)a3
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  void *v21;
  id v22;
  NSObject *v23;
  dispatch_time_t v24;
  void (**v25)(_QWORD, _QWORD);
  void *v26;
  dispatch_group_t group;
  id v29;
  void *v30;
  void *v31;
  _QWORD v32[4];
  id v33;
  NSObject *v34;
  uint64_t *v35;
  uint8_t buf[16];
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _QWORD v41[4];
  id v42;
  dispatch_group_t v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  char v48;
  _BYTE v49[128];

  v3 = a3;
  v45 = 0;
  v46 = &v45;
  v47 = 0x2020000000;
  v48 = 1;
  v4 = objc_opt_class(DADeviceConnectionProfileCommand);
  v30 = v3;
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0)
  {
    v5 = dispatch_group_create();
    dispatch_group_enter(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceLocal diagnosticsManager](self, "diagnosticsManager"));
    v41[0] = _NSConcreteStackBlock;
    v41[1] = 3221225472;
    v41[2] = sub_100016360;
    v41[3] = &unk_100133440;
    v44 = &v45;
    v29 = v3;
    v42 = v29;
    group = v5;
    v43 = group;
    objc_msgSend(v6, "diagnosticsWithCompletion:", v41);

    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "components"));
    if (!v7
      || (v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "components")),
          v9 = objc_msgSend(v8, "count") == 0,
          v8,
          v7,
          v9))
    {
      v31 = 0;
    }
    else
    {
      v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
      v39 = 0u;
      v40 = 0u;
      v37 = 0u;
      v38 = 0u;
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "components"));
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v37, v49, 16);
      if (v11)
      {
        v12 = *(_QWORD *)v38;
        do
        {
          for (i = 0; i != v11; i = (char *)i + 1)
          {
            if (*(_QWORD *)v38 != v12)
              objc_enumerationMutation(v10);
            v14 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * (_QWORD)i);
            v15 = objc_opt_class(NSDictionary);
            if ((objc_opt_isKindOfClass(v14, v15) & 1) != 0)
            {
              v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("identifier")));
              v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("type")));
              if (v17)
              {
                v18 = (void *)objc_claimAutoreleasedReturnValue(+[DKComponentPredicate componentPredicateWithType:identifier:](DKComponentPredicate, "componentPredicateWithType:identifier:", v17, v16));
                objc_msgSend(v31, "addObject:", v18);

              }
            }
          }
          v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v37, v49, 16);
        }
        while (v11);
      }

    }
    v19 = DiagnosticLogHandleForCategory(1);
    v20 = objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Starting report...", buf, 2u);
    }

    dispatch_group_enter(group);
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceLocal reportManager](self, "reportManager"));
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472;
    v32[2] = sub_100016538;
    v32[3] = &unk_100133468;
    v35 = &v45;
    v22 = v29;
    v33 = v22;
    v23 = group;
    v34 = v23;
    objc_msgSend(v21, "reportWithComponentPredicateManifest:completion:", v31, v32);

    v24 = dispatch_time(0, 120000000000);
    dispatch_group_wait(v23, v24);
    *((_BYTE *)v46 + 24) = 0;
    v25 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "completion"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "profile"));
    ((void (**)(_QWORD, void *))v25)[2](v25, v26);

  }
  _Block_object_dispose(&v45, 8);

}

- (void)deviceConnection:(id)a3 didRecieveCommand:(id)a4
{
  id v5;
  void *v6;
  id v7;

  v7 = a4;
  v5 = objc_msgSend(v7, "commandType");
  if (v5 == (id)2)
  {
    -[DADeviceLocal profileWithCommand:](self, "profileWithCommand:", v7);
    goto LABEL_7;
  }
  if (v5 == (id)1)
  {
    -[DADeviceLocal cancelTestWithCommand:](self, "cancelTestWithCommand:", v7);
    goto LABEL_7;
  }
  v6 = v7;
  if (!v5)
  {
    -[DADeviceLocal startTestWithCommand:](self, "startTestWithCommand:", v7);
LABEL_7:
    v6 = v7;
  }

}

- (void)deviceConnection:(id)a3 didRequestSuiteRunWithDestinations:(id)a4 confirmation:(id)a5
{
  id v7;
  id v8;
  id v9;

  v7 = a5;
  v8 = a4;
  v9 = (id)objc_claimAutoreleasedReturnValue(-[DADeviceLocal delegate](self, "delegate"));
  objc_msgSend(v9, "device:didRequestSuiteRunWithDestinations:confirmation:", self, v8, v7);

}

- (void)deviceConnection:(id)a3 didFinishTestSuite:(id)a4 withEntry:(id)a5 error:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;

  v9 = a6;
  v10 = a5;
  v11 = a4;
  v12 = (id)objc_claimAutoreleasedReturnValue(-[DADeviceLocal delegate](self, "delegate"));
  objc_msgSend(v12, "device:didFinishTestSuite:withEntry:error:", self, v11, v10, v9);

}

- (void)deviceConnection:(id)a3 didRequestInstructionalPrompt:(id)a4 withConfirmation:(id)a5
{
  id v7;
  id v8;
  id v9;

  v7 = a5;
  v8 = a4;
  v9 = (id)objc_claimAutoreleasedReturnValue(-[DADeviceLocal delegate](self, "delegate"));
  objc_msgSend(v9, "device:didRequestInstructionalPrompt:withConfirmation:", self, v8, v7);

}

- (void)updateProgress:(id)a3 forTest:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  v9 = (id)objc_claimAutoreleasedReturnValue(-[DADeviceLocal connection](self, "connection"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "progressForTest"));
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, v6);

}

- (void)getAsset:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceLocal connection](self, "connection"));
  v9 = objc_opt_respondsToSelector(v8, "requestAsset:completionHandler:");

  if ((v9 & 1) != 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceLocal connection](self, "connection"));
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1000169DC;
    v11[3] = &unk_100133490;
    v12 = v6;
    v13 = v7;
    objc_msgSend(v10, "requestAsset:completionHandler:", v12, v11);

  }
}

- (void)uploadAssets:(id)a3 completion:(id)a4
{
  void (**v6)(id, void *, uint64_t);
  void *v7;
  char v8;
  void *v9;
  uint64_t v10;
  id v11;

  v11 = a3;
  v6 = (void (**)(id, void *, uint64_t))a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceLocal connection](self, "connection"));
  v8 = objc_opt_respondsToSelector(v7, "requestUploadAssets:completion:");

  if ((v8 & 1) != 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceLocal connection](self, "connection"));
    objc_msgSend(v9, "requestUploadAssets:completion:", v11, v6);
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray array](NSArray, "array"));
    v10 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", DKErrorDomain, -1008, 0));
    v6[2](v6, v9, v10);

    v6 = (void (**)(id, void *, uint64_t))v10;
  }

}

- (void)_initDevice
{
  void *v3;
  void *v4;
  DADeviceState *v5;
  DADeviceState *state;
  DATestQueue *v7;
  DATestQueue *testQueue;
  uint64_t v9;
  DKDiagnosticManager *v10;
  DKDiagnosticManager *diagnosticsManager;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  id v15;
  DKReportManager *v16;
  DKReportManager *reportManager;
  DADeviceConnectionLocal *v18;
  DADeviceConnectionLocal *connection;
  void *v20;
  uint8_t v21[16];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceLocal _deviceAttributes](self, "_deviceAttributes"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceLocal _serialNumber](self, "_serialNumber"));
  v5 = -[DADeviceState initWithSerialNumber:attributes:]([DADeviceState alloc], "initWithSerialNumber:attributes:", v4, v3);
  state = self->_state;
  self->_state = v5;

  v7 = (DATestQueue *)objc_claimAutoreleasedReturnValue(+[DATestQueue testQueueWithDelegate:](DATestQueue, "testQueueWithDelegate:", self));
  testQueue = self->_testQueue;
  self->_testQueue = v7;

  v10 = (DKDiagnosticManager *)objc_opt_new(DKDiagnosticManager, v9);
  diagnosticsManager = self->_diagnosticsManager;
  self->_diagnosticsManager = v10;

  -[DKDiagnosticManager setProgressResponder:](self->_diagnosticsManager, "setProgressResponder:", self);
  -[DKDiagnosticManager setAssetResponder:](self->_diagnosticsManager, "setAssetResponder:", self);
  if (os_variant_has_internal_content("com.apple.Diagnostics"))
  {
    v12 = DiagnosticLogHandleForCategory(1);
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v21 = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Diagnostic allow list enabled for internal install", v21, 2u);
    }

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceLocal _getDiagnosticAllowList](self, "_getDiagnosticAllowList"));
    -[DKDiagnosticManager setAllowList:](self->_diagnosticsManager, "setAllowList:", v14);

  }
  v15 = objc_alloc((Class)DKReportManager);
  v16 = (DKReportManager *)objc_msgSend(v15, "initWithBundleIdentifier:", kDKDefaultBundleIdentifier);
  reportManager = self->_reportManager;
  self->_reportManager = v16;

  v18 = (DADeviceConnectionLocal *)objc_claimAutoreleasedReturnValue(-[DADeviceLocal _createDeviceConnection](self, "_createDeviceConnection"));
  connection = self->_connection;
  self->_connection = v18;

  -[DADeviceConnectionLocal setDelegate:](self->_connection, "setDelegate:", self);
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v20, "addObserver:selector:name:object:", self, "_localDeviceSessionWillStartNotification:", CFSTR("com.apple.Diagnostics.LocalSessionWillStart"), 0);

}

- (id)_createDeviceConnection
{
  DADeviceConnectionLocal *v3;
  void *v4;
  DADeviceConnectionLocal *v5;
  DADeviceConnectionConfigurator *v6;

  v3 = [DADeviceConnectionLocal alloc];
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceLocal state](self, "state"));
  v5 = -[DADeviceConnectionLocal initWithState:](v3, "initWithState:", v4);

  v6 = objc_alloc_init(DADeviceConnectionConfigurator);
  -[DADeviceConnectionLocal setConfigurator:](v5, "setConfigurator:", v6);

  return v5;
}

- (id)_deviceAttributes
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[9];
  _QWORD v21[9];

  v20[0] = CFSTR("productClass");
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceLocal _productClass](self, "_productClass"));
  v21[0] = v19;
  v20[1] = CFSTR("IMEI");
  v3 = objc_claimAutoreleasedReturnValue(-[DADeviceLocal _IMEI](self, "_IMEI"));
  v4 = (void *)v3;
  if (!v3)
    v3 = objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v17 = (void *)v3;
  v21[1] = v3;
  v20[2] = CFSTR("marketingName");
  v5 = objc_claimAutoreleasedReturnValue(-[DADeviceLocal _marketingName](self, "_marketingName"));
  v6 = (void *)v5;
  if (!v5)
    v5 = objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v21[2] = v5;
  v20[3] = CFSTR("imageName");
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceLocal _deviceImageName](self, "_deviceImageName", v5));
  v21[3] = v18;
  v20[4] = CFSTR("maskName");
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceLocal _deviceMaskName](self, "_deviceMaskName"));
  v21[4] = v7;
  v20[5] = CFSTR("deviceType");
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceLocal _deviceType](self, "_deviceType"));
  v21[5] = v8;
  v20[6] = CFSTR("deviceClass");
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceLocal _deviceClass](self, "_deviceClass"));
  v21[6] = v9;
  v20[7] = CFSTR("deviceEnclosureColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceLocal _deviceEnclosureColor](self, "_deviceEnclosureColor"));
  v11 = v10;
  if (!v10)
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v21[7] = v11;
  v20[8] = CFSTR("deviceColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceLocal _deviceColor](self, "_deviceColor"));
  v13 = v12;
  if (!v12)
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v21[8] = v13;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v21, v20, 9));
  if (!v12)

  if (!v10)
  if (!v6)

  if (!v4)
  return v14;
}

- (id)_deviceImageName
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)MGCopyAnswer(CFSTR("DeviceEnclosureColor"), 0);
  if (objc_msgSend(v2, "isEqualToString:", CFSTR("unknown")))
  {
    v3 = MGCopyAnswer(CFSTR("DeviceColor"), 0);

    v2 = (void *)v3;
  }
  v4 = (void *)MGCopyAnswer(CFSTR("ProductType"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@_%@.png"), v4, v2));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stringByReplacingReservedURLCharactersUsingEncoding:", 1));

  return v6;
}

- (id)_deviceMaskName
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MGCopyAnswer(CFSTR("ProductType"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("mask_%@.png"), v2));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "stringByReplacingReservedURLCharactersUsingEncoding:", 1));

  return v4;
}

- (id)_serialNumber
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceLocal customSerialNumber](self, "customSerialNumber"));

  if (v3)
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceLocal customSerialNumber](self, "customSerialNumber"));
  else
    v4 = (void *)MGCopyAnswer(CFSTR("SerialNumber"), 0);
  return v4;
}

- (id)_productClass
{
  return (id)MGCopyAnswer(CFSTR("DeviceName"), 0);
}

- (id)_deviceClass
{
  return (id)MGCopyAnswer(CFSTR("DeviceClass"), 0);
}

- (id)_deviceType
{
  return (id)MGCopyAnswer(CFSTR("ProductType"), 0);
}

- (id)_deviceEnclosureColor
{
  void *v2;
  void *v3;

  v2 = (void *)MGCopyAnswer(CFSTR("DeviceEnclosureColor"), 0);
  v3 = 0;
  if ((objc_msgSend(v2, "isEqualToString:", CFSTR("unknown")) & 1) == 0)
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "stringByReplacingOccurrencesOfString:withString:", CFSTR("#"), &stru_10013CDC8));

  return v3;
}

- (id)_deviceColor
{
  void *v2;
  void *v3;

  v2 = (void *)MGCopyAnswer(CFSTR("DeviceColor"), 0);
  v3 = 0;
  if ((objc_msgSend(v2, "isEqualToString:", CFSTR("unknown")) & 1) == 0)
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "stringByReplacingOccurrencesOfString:withString:", CFSTR("#"), &stru_10013CDC8));

  return v3;
}

- (id)_marketingName
{
  return (id)MGCopyAnswer(CFSTR("marketing-name"), 0);
}

- (id)_IMEI
{
  return (id)MGCopyAnswer(CFSTR("InternationalMobileEquipmentIdentity"), 0);
}

- (id)_getDiagnosticAllowList
{
  if (qword_10016E898 != -1)
    dispatch_once(&qword_10016E898, &stru_1001334B0);
  return (id)qword_10016E890;
}

- (void)_localDeviceSessionWillStartNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  void *v12;
  int v13;
  DADeviceLocal *v14;
  __int16 v15;
  void *v16;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "object"));
  if (objc_msgSend(v5, "isEqual:", self))
    goto LABEL_8;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceLocal state](self, "state"));
  if (!objc_msgSend(v6, "phase"))
  {

LABEL_8:
    goto LABEL_9;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceLocal state](self, "state"));
  v8 = objc_msgSend(v7, "phase");

  if (v8 != (id)1)
  {
    v9 = DiagnosticLogHandleForCategory(1);
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "object"));
      v13 = 138412546;
      v14 = self;
      v15 = 2112;
      v16 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Local device %@ ending so %@ can start", (uint8_t *)&v13, 0x16u);

    }
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceLocal connection](self, "connection"));
    objc_msgSend(v12, "end");

  }
LABEL_9:

}

- (NSString)bundleIdentifier
{
  return (NSString *)kDKDefaultBundleIdentifier;
}

- (void)archiveConnection
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[DADeviceLocal connection](self, "connection"));
  objc_msgSend(v2, "archive");

}

- (DADeviceDelegate)delegate
{
  return (DADeviceDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (DADeviceConnectionLocal)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_connection, a3);
}

- (DKDiagnosticManager)diagnosticsManager
{
  return self->_diagnosticsManager;
}

- (void)setDiagnosticsManager:(id)a3
{
  objc_storeStrong((id *)&self->_diagnosticsManager, a3);
}

- (DKReportManager)reportManager
{
  return self->_reportManager;
}

- (void)setReportManager:(id)a3
{
  objc_storeStrong((id *)&self->_reportManager, a3);
}

- (BOOL)areTestsSuspended
{
  return self->_testsSuspended;
}

- (void)setTestsSuspended:(BOOL)a3
{
  self->_testsSuspended = a3;
}

- (DATestQueue)testQueue
{
  return self->_testQueue;
}

- (void)setTestQueue:(id)a3
{
  objc_storeStrong((id *)&self->_testQueue, a3);
}

- (DADeviceState)state
{
  return self->_state;
}

- (void)setState:(id)a3
{
  objc_storeStrong((id *)&self->_state, a3);
}

- (NSString)customSerialNumber
{
  return self->_customSerialNumber;
}

- (void)setCustomSerialNumber:(id)a3
{
  objc_storeStrong((id *)&self->_customSerialNumber, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customSerialNumber, 0);
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_testQueue, 0);
  objc_storeStrong((id *)&self->_reportManager, 0);
  objc_storeStrong((id *)&self->_diagnosticsManager, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

@end
