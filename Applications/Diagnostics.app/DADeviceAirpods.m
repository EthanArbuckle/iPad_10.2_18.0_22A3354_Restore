@implementation DADeviceAirpods

- (DADeviceAirpods)initWithBluetoothDevice:(id)a3
{
  id v5;
  DADeviceAirpods *v6;
  DADeviceAirpods *v7;
  uint64_t v8;
  NSString *macAddress;
  NSString *v10;
  NSString *serialNumber;
  NSString *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  DADeviceState *v19;
  void *v20;
  DADeviceState *v21;
  DADeviceState *state;
  uint64_t v23;
  DATestQueue *testQueue;
  uint64_t v25;
  uint64_t v26;
  DKDiagnosticManager *diagnosticsManager;
  NSUUID *airpodsUUID;
  DKReportManager *v29;
  DKReportManager *reportManager;
  DADeviceConnectionAirPods *v31;
  void *v32;
  DADeviceConnectionAirPods *v33;
  DADeviceConnectionAirPods *connection;
  DADeviceAirpods *v35;
  uint64_t v36;
  NSObject *v37;
  objc_super v39;
  _QWORD v40[5];
  _QWORD v41[5];

  v5 = a3;
  v39.receiver = self;
  v39.super_class = (Class)DADeviceAirpods;
  v6 = -[DADeviceAirpods init](&v39, "init");
  v7 = v6;
  if (!v6)
    goto LABEL_4;
  objc_storeStrong((id *)&v6->_airpodsDevice, a3);
  v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "address"));
  macAddress = v7->_macAddress;
  v7->_macAddress = (NSString *)v8;

  v10 = (NSString *)objc_claimAutoreleasedReturnValue(+[DADeviceObserverAirpods primarySerialNumberForAirpodsDevice:](DADeviceObserverAirpods, "primarySerialNumberForAirpodsDevice:", v5));
  if (v10)
  {
    serialNumber = v7->_serialNumber;
    v7->_serialNumber = v10;
    v12 = v10;

    v40[0] = CFSTR("productClass");
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceAirpods _productClass](v7, "_productClass"));
    v41[0] = v13;
    v40[1] = CFSTR("deviceClass");
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceAirpods _deviceClass](v7, "_deviceClass"));
    v41[1] = v14;
    v40[2] = CFSTR("deviceType");
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceAirpods _deviceType](v7, "_deviceType"));
    v41[2] = v15;
    v40[3] = CFSTR("marketingName");
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceAirpods _marketingName](v7, "_marketingName"));
    v41[3] = v16;
    v40[4] = CFSTR("imageName");
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceAirpods _deviceImageName](v7, "_deviceImageName"));
    v41[4] = v17;
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v41, v40, 5));

    v19 = [DADeviceState alloc];
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceAirpods serialNumber](v7, "serialNumber"));
    v21 = -[DADeviceState initWithSerialNumber:attributes:](v19, "initWithSerialNumber:attributes:", v20, v18);
    state = v7->_state;
    v7->_state = v21;

    v23 = objc_claimAutoreleasedReturnValue(+[DATestQueue testQueueWithDelegate:](DATestQueue, "testQueueWithDelegate:", v7));
    testQueue = v7->_testQueue;
    v7->_testQueue = (DATestQueue *)v23;

    v26 = objc_opt_new(DKDiagnosticManager, v25);
    diagnosticsManager = v7->_diagnosticsManager;
    v7->_diagnosticsManager = (DKDiagnosticManager *)v26;

    -[DKDiagnosticManager setProgressResponder:](v7->_diagnosticsManager, "setProgressResponder:", v7);
    -[DKDiagnosticManager setAssetResponder:](v7->_diagnosticsManager, "setAssetResponder:", v7);
    -[DKDiagnosticManager setAccessoryResponder:](v7->_diagnosticsManager, "setAccessoryResponder:", v7);
    airpodsUUID = v7->_airpodsUUID;
    v7->_airpodsUUID = 0;

    v29 = (DKReportManager *)objc_msgSend(objc_alloc((Class)DKReportManager), "initWithBundleIdentifier:", CFSTR("AirPods"));
    reportManager = v7->_reportManager;
    v7->_reportManager = v29;

    v31 = [DADeviceConnectionAirPods alloc];
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceAirpods state](v7, "state"));
    v33 = -[DADeviceConnectionAirPods initWithState:bluetoothDevice:](v31, "initWithState:bluetoothDevice:", v32, v5);
    connection = v7->_connection;
    v7->_connection = v33;

    -[DADeviceConnectionLocal setDelegate:](v7->_connection, "setDelegate:", v7);
LABEL_4:
    v35 = v7;
    goto LABEL_8;
  }
  v36 = DiagnosticLogHandleForCategory(1);
  v37 = objc_claimAutoreleasedReturnValue(v36);
  if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    sub_1000EB7C8(v37);

  v35 = 0;
LABEL_8:

  return v35;
}

- (BOOL)isLocal
{
  return 1;
}

- (void)start
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[DADeviceAirpods connection](self, "connection"));
  objc_msgSend(v2, "start");

}

- (void)idle
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[DADeviceAirpods connection](self, "connection"));
  objc_msgSend(v2, "idle");

}

- (void)suspendTests
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  void *v6;
  int v7;
  DADeviceAirpods *v8;

  v3 = DiagnosticLogHandleForCategory(1);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412290;
    v8 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Test launch suspending for %@.", (uint8_t *)&v7, 0xCu);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceAirpods testQueue](self, "testQueue"));
  objc_msgSend(v5, "setSuspended:", 1);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceAirpods diagnosticsManager](self, "diagnosticsManager"));
  objc_msgSend(v6, "cancelAllDiagnostics");

}

- (void)resumeTests
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  int v6;
  DADeviceAirpods *v7;

  v3 = DiagnosticLogHandleForCategory(1);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Test launch resuming for %@.", (uint8_t *)&v6, 0xCu);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceAirpods testQueue](self, "testQueue"));
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
  block[2] = sub_1000293A4;
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
  void *v8;
  void (**v9)(_QWORD, _QWORD, _QWORD);
  void *v10;
  void *v11;
  id v12;
  id v13;

  v13 = a3;
  v4 = objc_opt_class(DADeviceConnectionStartTestCommand);
  if ((objc_opt_isKindOfClass(v13, v4) & 1) != 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceAirpods connection](self, "connection"));
    objc_msgSend(v5, "setUnpairOnTestCompletion:", 0);

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceAirpods diagnosticsManager](self, "diagnosticsManager"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "testID"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "attributesForIdentifier:", v7));

    if (v8)
    {
      v9 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[DADeviceAirpods testQueue](self, "testQueue"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "parameters"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "completion"));
      v12 = objc_msgSend(v11, "copy");
      objc_msgSend(v9, "enqueueTestWithTestAttributes:parameters:completion:", v8, v10, v12);

    }
    else
    {
      v9 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "completion"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", DKErrorDomain, -1000, 0));
      ((void (**)(_QWORD, _QWORD, void *))v9)[2](v9, 0, v10);
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
    v7 = (id)objc_claimAutoreleasedReturnValue(-[DADeviceAirpods diagnosticsManager](self, "diagnosticsManager"));
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
  v12 = (id)objc_claimAutoreleasedReturnValue(-[DADeviceAirpods diagnosticsManager](self, "diagnosticsManager"));
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
    -[DADeviceAirpods _profileWithCommand:](self, "_profileWithCommand:", v7);
    goto LABEL_7;
  }
  if (v5 == (id)1)
  {
    -[DADeviceAirpods cancelTestWithCommand:](self, "cancelTestWithCommand:", v7);
    goto LABEL_7;
  }
  v6 = v7;
  if (!v5)
  {
    -[DADeviceAirpods startTestWithCommand:](self, "startTestWithCommand:", v7);
LABEL_7:
    v6 = v7;
  }

}

- (unint64_t)hash
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceAirpods macAddress](self, "macAddress"));
  v3 = objc_msgSend(v2, "hash");

  return (unint64_t)v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  unsigned __int8 v8;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(DADeviceAirpods)))
  {
    v5 = v4;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceAirpods macAddress](self, "macAddress"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "macAddress"));

    v8 = objc_msgSend(v6, "isEqualToString:", v7);
  }
  else
  {
    v8 = 0;
  }

  return v8;
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
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceAirpods state](self, "state"));
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
  id v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  void *i;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  NSObject *v25;
  void *v26;
  id v27;
  NSObject *v28;
  dispatch_time_t v29;
  void (**v30)(_QWORD, _QWORD);
  void *v31;
  NSObject *v32;
  DADeviceAirpods *v33;
  id v34;
  void *v35;
  _QWORD v36[4];
  id v37;
  NSObject *v38;
  uint8_t buf[16];
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _QWORD v44[4];
  id v45;
  NSObject *v46;
  _BYTE v47[128];

  v4 = a3;
  v5 = objc_opt_class(DADeviceConnectionProfileCommand);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
  {
    v6 = dispatch_group_create();
    dispatch_group_enter(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceAirpods diagnosticsManager](self, "diagnosticsManager"));
    v44[0] = _NSConcreteStackBlock;
    v44[1] = 3221225472;
    v44[2] = sub_100029C00;
    v44[3] = &unk_100133AA8;
    v8 = v4;
    v45 = v8;
    v9 = v6;
    v46 = v9;
    objc_msgSend(v7, "diagnosticsWithCompletion:", v44);

    v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "components"));
    if (v10
      && (v11 = (void *)v10,
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "components")),
          v13 = objc_msgSend(v12, "count"),
          v12,
          v11,
          v13))
    {
      v32 = v9;
      v33 = self;
      v34 = v4;
      v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
      v40 = 0u;
      v41 = 0u;
      v42 = 0u;
      v43 = 0u;
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "components"));
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v40, v47, 16);
      if (v15)
      {
        v16 = v15;
        v17 = *(_QWORD *)v41;
        do
        {
          for (i = 0; i != v16; i = (char *)i + 1)
          {
            if (*(_QWORD *)v41 != v17)
              objc_enumerationMutation(v14);
            v19 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * (_QWORD)i);
            v20 = objc_opt_class(NSDictionary);
            if ((objc_opt_isKindOfClass(v19, v20) & 1) != 0)
            {
              v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("identifier")));
              v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("type")));
              if (v22)
              {
                v23 = (void *)objc_claimAutoreleasedReturnValue(+[DKComponentPredicate componentPredicateWithType:identifier:](DKComponentPredicate, "componentPredicateWithType:identifier:", v22, v21));
                objc_msgSend(v35, "addObject:", v23);

              }
            }
          }
          v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v40, v47, 16);
        }
        while (v16);
      }

      self = v33;
      v4 = v34;
      v9 = v32;
    }
    else
    {
      v35 = 0;
    }
    v24 = DiagnosticLogHandleForCategory(1);
    v25 = objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Starting report...", buf, 2u);
    }

    dispatch_group_enter(v9);
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceAirpods reportManager](self, "reportManager"));
    v36[0] = _NSConcreteStackBlock;
    v36[1] = 3221225472;
    v36[2] = sub_100029E4C;
    v36[3] = &unk_100133968;
    v27 = v8;
    v37 = v27;
    v38 = v9;
    v28 = v9;
    objc_msgSend(v26, "reportWithComponentPredicateManifest:completion:", v35, v36);

    v29 = dispatch_time(0, 60000000000);
    dispatch_group_wait(v28, v29);
    v30 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "completion"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "profile"));
    ((void (**)(_QWORD, void *))v30)[2](v30, v31);

  }
}

- (id)_deviceImageName
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceAirpods _deviceType](self, "_deviceType"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@-0.png"), v2));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "stringByReplacingReservedURLCharactersUsingEncoding:", 1));

  return v4;
}

- (id)_productClass
{
  return CFSTR("Airpods");
}

- (id)_deviceClass
{
  return CFSTR("Accessory");
}

- (id)_deviceType
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceAirpods airpodsDevice](self, "airpodsDevice"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("AirPods_%u"), objc_msgSend(v2, "productId")));

  return v3;
}

- (id)_marketingName
{
  void *v2;
  unsigned int v3;
  id result;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceAirpods airpodsDevice](self, "airpodsDevice"));
  v3 = objc_msgSend(v2, "productId");

  result = CFSTR("AirPods");
  switch(v3)
  {
    case 0x2003u:
      result = CFSTR("Powerbeats³");
      break;
    case 0x2004u:
    case 0x2007u:
    case 0x2008u:
    case 0x200Fu:
    case 0x2010u:
    case 0x2012u:
    case 0x2013u:
      return result;
    case 0x2005u:
      result = CFSTR("BeatsX");
      break;
    case 0x2006u:
      result = CFSTR("Beats Solo³");
      break;
    case 0x2009u:
      result = CFSTR("Beats Studio³");
      break;
    case 0x200Au:
      result = CFSTR("AirPods Max");
      break;
    case 0x200Bu:
      result = CFSTR("Powerbeats Pro");
      break;
    case 0x200Cu:
      result = CFSTR("Beats Solo Pro");
      break;
    case 0x200Du:
      result = CFSTR("Powerbeats⁴");
      break;
    case 0x200Eu:
    case 0x2014u:
      goto LABEL_4;
    case 0x2011u:
      result = CFSTR("Beats Studio Buds");
      break;
    default:
      if (v3 == 8228)
LABEL_4:
        result = CFSTR("AirPods Pro");
      break;
  }
  return result;
}

- (void)updateProgress:(id)a3 forTest:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  v9 = (id)objc_claimAutoreleasedReturnValue(-[DADeviceAirpods connection](self, "connection"));
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
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceAirpods connection](self, "connection"));
  v9 = objc_opt_respondsToSelector(v8, "requestAsset:completionHandler:");

  if ((v9 & 1) != 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceAirpods connection](self, "connection"));
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10002A2B0;
    v11[3] = &unk_100133490;
    v12 = v6;
    v13 = v7;
    objc_msgSend(v10, "requestAsset:completionHandler:", v12, v11);

  }
}

- (void)unpairSessionAccessoryOnTestCompletion
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[DADeviceAirpods connection](self, "connection"));
  objc_msgSend(v2, "setUnpairOnTestCompletion:", 1);

}

- (void)allowSessionAccessoryDisconnectForDuration:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  int v8;
  id v9;

  v4 = a3;
  v5 = DiagnosticLogHandleForCategory(0);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412290;
    v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "DK requested to allow accessory disconnect for %@", (uint8_t *)&v8, 0xCu);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceAirpods connection](self, "connection"));
  objc_msgSend(v7, "allowSessionAccessoryDisconnectForDuration:", v4);

}

- (void)clearAllowSessionAccessoryDisconnect
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  uint8_t v6[16];

  v3 = DiagnosticLogHandleForCategory(0);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "DK requested to clear allowing accessory disconnects", v6, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceAirpods connection](self, "connection"));
  objc_msgSend(v5, "clearAllowSessionAccessoryDisconnect");

}

- (void)requestSessionAccessoryIdentifierWithCompletion:(id)a3
{
  void (**v4)(id, void *, _QWORD);
  void *v5;
  void *v6;
  id v7;
  void *i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  unsigned __int8 v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  id v25;
  void *v26;
  void (**v27)(id, void *, _QWORD);
  id obj;
  id v29;
  uint64_t v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  id v35;
  NSErrorUserInfoKey v36;
  const __CFString *v37;
  _BYTE v38[128];

  v4 = (void (**)(id, void *, _QWORD))a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceAirpods airpodsUUID](self, "airpodsUUID"));

  if (!v5)
  {
    v35 = 0;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[CBDiscovery devicesWithDiscoveryFlags:error:](CBDiscovery, "devicesWithDiscoveryFlags:error:", 0x800000, &v35));
    v7 = v35;
    if (v6)
    {
      v33 = 0u;
      v34 = 0u;
      v31 = 0u;
      v32 = 0u;
      obj = v6;
      v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v38, 16);
      if (v29)
      {
        v30 = *(_QWORD *)v32;
        v26 = v6;
        v27 = v4;
        v25 = v7;
        while (2)
        {
          for (i = 0; i != v29; i = (char *)i + 1)
          {
            if (*(_QWORD *)v32 != v30)
              objc_enumerationMutation(obj);
            v9 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * (_QWORD)i);
            v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "serialNumber", v25, v26, v27));
            v11 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceAirpods serialNumber](self, "serialNumber"));
            if ((objc_msgSend(v10, "isEqualToString:", v11) & 1) != 0)
              goto LABEL_15;
            v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "serialNumberLeft"));
            v13 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceAirpods serialNumber](self, "serialNumber"));
            if ((objc_msgSend(v12, "isEqualToString:", v13) & 1) != 0)
            {

LABEL_15:
LABEL_16:
              v17 = objc_alloc((Class)NSUUID);
              v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "identifier"));
              v19 = objc_msgSend(v17, "initWithUUIDString:", v18);
              -[DADeviceAirpods setAirpodsUUID:](self, "setAirpodsUUID:", v19);

              v6 = v26;
              v4 = v27;
              v7 = v25;
              goto LABEL_17;
            }
            v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "serialNumberRight"));
            v15 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceAirpods serialNumber](self, "serialNumber"));
            v16 = objc_msgSend(v14, "isEqualToString:", v15);

            if ((v16 & 1) != 0)
              goto LABEL_16;
          }
          v6 = v26;
          v4 = v27;
          v7 = v25;
          v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v38, 16);
          if (v29)
            continue;
          break;
        }
      }
LABEL_17:

    }
  }
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceAirpods airpodsUUID](self, "airpodsUUID"));

  if (v20)
  {
    v21 = (id)objc_claimAutoreleasedReturnValue(-[DADeviceAirpods airpodsUUID](self, "airpodsUUID"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "UUIDString"));
    v4[2](v4, v22, 0);

  }
  else
  {
    v23 = objc_alloc((Class)NSError);
    v36 = NSLocalizedDescriptionKey;
    v37 = CFSTR("Unable to find CoreBluetooth identifier for session accessory");
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v37, &v36, 1));
    v21 = objc_msgSend(v23, "initWithDomain:code:userInfo:", CFSTR("com.apple.Diagnostics"), -1, v24);

    ((void (**)(id, void *, id))v4)[2](v4, &stru_10013CDC8, v21);
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

- (BluetoothDevice)airpodsDevice
{
  return self->_airpodsDevice;
}

- (void)setAirpodsDevice:(id)a3
{
  objc_storeStrong((id *)&self->_airpodsDevice, a3);
}

- (DADeviceConnectionAirPods)connection
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

- (NSString)serialNumber
{
  return self->_serialNumber;
}

- (void)setSerialNumber:(id)a3
{
  objc_storeStrong((id *)&self->_serialNumber, a3);
}

- (NSString)macAddress
{
  return self->_macAddress;
}

- (void)setMacAddress:(id)a3
{
  objc_storeStrong((id *)&self->_macAddress, a3);
}

- (NSUUID)airpodsUUID
{
  return self->_airpodsUUID;
}

- (void)setAirpodsUUID:(id)a3
{
  objc_storeStrong((id *)&self->_airpodsUUID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_airpodsUUID, 0);
  objc_storeStrong((id *)&self->_macAddress, 0);
  objc_storeStrong((id *)&self->_serialNumber, 0);
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_testQueue, 0);
  objc_storeStrong((id *)&self->_reportManager, 0);
  objc_storeStrong((id *)&self->_diagnosticsManager, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_airpodsDevice, 0);
  objc_destroyWeak((id *)&self->delegate);
}

@end
