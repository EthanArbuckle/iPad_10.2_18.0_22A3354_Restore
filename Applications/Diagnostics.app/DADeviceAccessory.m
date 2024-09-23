@implementation DADeviceAccessory

- (DADeviceAccessory)init
{
  return -[DADeviceAccessory initWithAccessory:](self, "initWithAccessory:", 0);
}

- (DADeviceAccessory)initWithAccessory:(id)a3
{
  id v5;
  DADeviceAccessory *v6;
  DADeviceAccessory *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  DADeviceState *v12;
  void *v13;
  DADeviceState *v14;
  DADeviceState *state;
  uint64_t v16;
  DATestQueue *testQueue;
  id v18;
  DAAdapterAccessory *accessory;
  uint64_t v20;
  DKReportManager *v21;
  DKReportManager *reportManager;
  DADeviceConnectionLocal *v23;
  void *v24;
  DADeviceConnectionLocal *v25;
  DADeviceConnectionLocal *connection;
  objc_super v28;
  _QWORD v29[3];
  _QWORD v30[3];

  v5 = a3;
  v28.receiver = self;
  v28.super_class = (Class)DADeviceAccessory;
  v6 = -[DADeviceAccessory init](&v28, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_accessory, a3);
    v29[0] = CFSTR("productClass");
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceAccessory _productClass](v7, "_productClass"));
    v30[0] = v8;
    v29[1] = CFSTR("marketingName");
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceAccessory _marketingName](v7, "_marketingName"));
    v30[1] = v9;
    v29[2] = CFSTR("imageName");
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceAccessory _deviceImageName](v7, "_deviceImageName"));
    v30[2] = v10;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v30, v29, 3));

    v12 = [DADeviceState alloc];
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceAccessory _serialNumber](v7, "_serialNumber"));
    v14 = -[DADeviceState initWithSerialNumber:attributes:](v12, "initWithSerialNumber:attributes:", v13, v11);
    state = v7->_state;
    v7->_state = v14;

    v16 = objc_claimAutoreleasedReturnValue(+[DATestQueue testQueueWithDelegate:](DATestQueue, "testQueueWithDelegate:", v7));
    testQueue = v7->_testQueue;
    v7->_testQueue = (DATestQueue *)v16;

    v18 = kDKDefaultBundleIdentifier;
    accessory = v7->_accessory;
    if (accessory)
    {
      v20 = objc_claimAutoreleasedReturnValue(-[DAAdapterAccessory identifier](accessory, "identifier"));

      v18 = (id)v20;
    }
    v21 = (DKReportManager *)objc_msgSend(objc_alloc((Class)DKReportManager), "initWithBundleIdentifier:", v18);
    reportManager = v7->_reportManager;
    v7->_reportManager = v21;

    v23 = [DADeviceConnectionLocal alloc];
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceAccessory state](v7, "state"));
    v25 = -[DADeviceConnectionLocal initWithState:](v23, "initWithState:", v24);
    connection = v7->_connection;
    v7->_connection = v25;

    -[DADeviceConnectionLocal setDelegate:](v7->_connection, "setDelegate:", v7);
  }

  return v7;
}

- (BOOL)isLocal
{
  return 1;
}

- (void)start
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[DADeviceAccessory connection](self, "connection"));
  objc_msgSend(v2, "start");

}

- (void)idle
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[DADeviceAccessory connection](self, "connection"));
  objc_msgSend(v2, "idle");

}

- (void)suspendTests
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  void *v6;
  int v7;
  DADeviceAccessory *v8;

  v3 = DiagnosticLogHandleForCategory(1);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412290;
    v8 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Test launch suspending for %@.", (uint8_t *)&v7, 0xCu);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceAccessory testQueue](self, "testQueue"));
  objc_msgSend(v5, "setSuspended:", 1);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceAccessory diagnosticsManager](self, "diagnosticsManager"));
  objc_msgSend(v6, "cancelAllDiagnostics");

}

- (void)resumeTests
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  int v6;
  DADeviceAccessory *v7;

  v3 = DiagnosticLogHandleForCategory(1);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Test launch resuming for %@.", (uint8_t *)&v6, 0xCu);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceAccessory testQueue](self, "testQueue"));
  objc_msgSend(v5, "setSuspended:", 0);

}

- (void)end
{
  dispatch_queue_global_t global_queue;
  NSObject *v4;
  _QWORD block[5];

  global_queue = dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue(global_queue);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100023DEC;
  block[3] = &unk_100132838;
  block[4] = self;
  dispatch_async(v4, block);

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
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceAccessory diagnosticsManager](self, "diagnosticsManager"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "testID"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "attributesForIdentifier:", v6));

    if (v7)
    {
      v8 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[DADeviceAccessory testQueue](self, "testQueue"));
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
    v7 = (id)objc_claimAutoreleasedReturnValue(-[DADeviceAccessory diagnosticsManager](self, "diagnosticsManager"));
    objc_msgSend(v7, "cancelAllDiagnostics");

  }
}

- (void)executeTestWithTestAttributes:(id)a3 parameters:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v12 = (id)objc_claimAutoreleasedReturnValue(-[DADeviceAccessory diagnosticsManager](self, "diagnosticsManager"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "identifier"));

  objc_msgSend(v12, "beginDiagnosticWithIdentifier:parameters:completion:", v11, v9, v8);
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
    -[DADeviceAccessory _profileWithCommand:](self, "_profileWithCommand:", v7);
    goto LABEL_7;
  }
  if (v5 == (id)1)
  {
    -[DADeviceAccessory cancelTestWithCommand:](self, "cancelTestWithCommand:", v7);
    goto LABEL_7;
  }
  v6 = v7;
  if (!v5)
  {
    -[DADeviceAccessory startTestWithCommand:](self, "startTestWithCommand:", v7);
LABEL_7:
    v6 = v7;
  }

}

- (unint64_t)hash
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceAccessory _serialNumber](self, "_serialNumber"));
  v3 = objc_msgSend(v2, "hash");

  return (unint64_t)v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unsigned __int8 v7;

  v4 = a3;
  if ((objc_opt_respondsToSelector(v4, "_serialNumber") & 1) != 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceAccessory _serialNumber](self, "_serialNumber"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "_serialNumber"));
    v7 = objc_msgSend(v5, "isEqualToString:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
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
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceAccessory state](self, "state"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "serialNumber"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@; %p: %@>"),
                   v5,
                   self,
                   v7));

  return (NSString *)v8;
}

- (void)_profileWithCommand:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  void *i;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  NSObject *v23;
  void *v24;
  id v25;
  NSObject *v26;
  dispatch_time_t v27;
  void (**v28)(_QWORD, _QWORD);
  void *v29;
  NSObject *v30;
  DADeviceAccessory *v31;
  void *v32;
  _QWORD v33[4];
  id v34;
  NSObject *v35;
  uint8_t buf[16];
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];

  v4 = a3;
  v5 = objc_opt_class(DADeviceConnectionProfileCommand);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
  {
    v6 = dispatch_group_create();
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "profile"));
    objc_msgSend(v7, "setTests:", &__NSArray0__struct);

    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "components"));
    if (v8
      && (v9 = (void *)v8,
          v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "components")),
          v11 = objc_msgSend(v10, "count"),
          v10,
          v9,
          v11))
    {
      v30 = v6;
      v31 = self;
      v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
      v37 = 0u;
      v38 = 0u;
      v39 = 0u;
      v40 = 0u;
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "components"));
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
      if (v13)
      {
        v14 = v13;
        v15 = *(_QWORD *)v38;
        do
        {
          for (i = 0; i != v14; i = (char *)i + 1)
          {
            if (*(_QWORD *)v38 != v15)
              objc_enumerationMutation(v12);
            v17 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * (_QWORD)i);
            v18 = objc_opt_class(NSDictionary);
            if ((objc_opt_isKindOfClass(v17, v18) & 1) != 0)
            {
              v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("identifier")));
              v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("type")));
              if (v20)
              {
                v21 = (void *)objc_claimAutoreleasedReturnValue(+[DKComponentPredicate componentPredicateWithType:identifier:](DKComponentPredicate, "componentPredicateWithType:identifier:", v20, v19));
                objc_msgSend(v32, "addObject:", v21);

              }
            }
          }
          v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
        }
        while (v14);
      }

      self = v31;
      v6 = v30;
    }
    else
    {
      v32 = 0;
    }
    v22 = DiagnosticLogHandleForCategory(1);
    v23 = objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Starting report...", buf, 2u);
    }

    dispatch_group_enter(v6);
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceAccessory reportManager](self, "reportManager"));
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472;
    v33[2] = sub_1000245AC;
    v33[3] = &unk_100133968;
    v25 = v4;
    v34 = v25;
    v35 = v6;
    v26 = v6;
    objc_msgSend(v24, "reportWithComponentPredicateManifest:completion:", v32, v33);

    v27 = dispatch_time(0, 60000000000);
    dispatch_group_wait(v26, v27);
    v28 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "completion"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "profile"));
    ((void (**)(_QWORD, void *))v28)[2](v28, v29);

  }
}

- (id)_deviceImageName
{
  uint64_t v2;
  void *v3;
  __CFString *v4;

  v2 = objc_claimAutoreleasedReturnValue(-[DAAdapterAccessory modelNumber](self->_accessory, "modelNumber"));
  v3 = (void *)v2;
  if (v2)
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("SBC"), "stringByAppendingFormat:", CFSTR("-%@"), v2));
  else
    v4 = CFSTR("SBC");

  return v4;
}

- (id)_serialNumber
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceAccessory accessory](self, "accessory"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "serialNumber"));

  return v3;
}

- (id)_productClass
{
  return CFSTR("Accessories");
}

- (id)_marketingName
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceAccessory accessory](self, "accessory"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "productName"));

  return v3;
}

- (DADeviceDelegate)delegate
{
  return (DADeviceDelegate *)objc_loadWeakRetained((id *)&self->delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->delegate, a3);
}

- (DAAdapterAccessory)accessory
{
  return self->_accessory;
}

- (void)setAccessory:(id)a3
{
  objc_storeStrong((id *)&self->_accessory, a3);
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_testQueue, 0);
  objc_storeStrong((id *)&self->_reportManager, 0);
  objc_storeStrong((id *)&self->_diagnosticsManager, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_accessory, 0);
  objc_destroyWeak((id *)&self->delegate);
}

@end
