@implementation WFMediaRoutePicker

- (WFMediaRoutePicker)init
{
  return -[WFMediaRoutePicker initWithRouteType:](self, "initWithRouteType:", 0);
}

- (WFMediaRoutePicker)initWithRouteType:(int64_t)a3
{
  WFMediaRoutePicker *v4;
  dispatch_queue_t v5;
  OS_dispatch_queue *queue;
  uint64_t v7;
  NSMutableArray *observers;
  id v9;
  void *v10;
  void *v11;
  objc_class *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  int v16;
  id v17;
  NSObject *v18;
  void *v19;
  objc_class *v20;
  uint64_t v21;
  MPAVRoutingController *routingController;
  WFMediaRoutePicker *v23;
  id v25;
  objc_super v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;
  _BYTE buf[32];
  uint64_t *v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v26.receiver = self;
  v26.super_class = (Class)WFMediaRoutePicker;
  v4 = -[WFMediaRoutePicker init](&v26, sel_init);
  if (v4)
  {
    v5 = dispatch_queue_create("com.apple.shortcuts.WFMediaRoutePicker", 0);
    queue = v4->_queue;
    v4->_queue = (OS_dispatch_queue *)v5;

    v7 = objc_opt_new();
    observers = v4->_observers;
    v4->_observers = (NSMutableArray *)v7;

    v4->_routeType = a3;
    v9 = objc_alloc((Class)getMPAVEndpointRouteClass());
    v10 = (void *)objc_msgSend(v9, "initWithEndpoint:", MRAVEndpointGetLocalEndpoint());
    v27 = 0;
    v28 = &v27;
    v29 = 0x2050000000;
    v11 = (void *)getMPAVOutputDeviceRoutingDataSourceClass_softClass;
    v30 = getMPAVOutputDeviceRoutingDataSourceClass_softClass;
    if (!getMPAVOutputDeviceRoutingDataSourceClass_softClass)
    {
      *(_QWORD *)buf = MEMORY[0x24BDAC760];
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = __getMPAVOutputDeviceRoutingDataSourceClass_block_invoke;
      *(_QWORD *)&buf[24] = &unk_24F8BB430;
      v32 = &v27;
      __getMPAVOutputDeviceRoutingDataSourceClass_block_invoke((uint64_t)buf);
      v11 = (void *)v28[3];
    }
    v12 = objc_retainAutorelease(v11);
    _Block_object_dispose(&v27, 8);
    v13 = (void *)objc_msgSend([v12 alloc], "initWithEndpointRoute:", v10);
    objc_msgSend(MEMORY[0x24BDB1858], "auxiliarySession");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = *MEMORY[0x24BDB15A8];
    v25 = 0;
    v16 = objc_msgSend(v14, "setCategory:error:", v15, &v25);
    v17 = v25;
    getWFActionsLogObject();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      *(_QWORD *)&buf[4] = "-[WFMediaRoutePicker initWithRouteType:]";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v16 ^ 1;
      *(_WORD *)&buf[18] = 2112;
      *(_QWORD *)&buf[20] = v17;
      _os_log_impl(&dword_22D353000, v18, OS_LOG_TYPE_DEFAULT, "%s Setting audio session category for route discovery failed: %d error: %@", buf, 0x1Cu);
    }

    objc_msgSend(v13, "setTargetSessionID:", objc_msgSend(v14, "opaqueSessionID"));
    objc_storeStrong((id *)&v4->_routingAudioSession, v14);
    if ((unint64_t)(a3 - 1) > 1)
      objc_msgSend(v13, "setSupportsQueueHandoff:", 0);
    else
      objc_msgSend(v13, "setFilterMode:", 3);
    v27 = 0;
    v28 = &v27;
    v29 = 0x2050000000;
    v19 = (void *)getMPAVRoutingControllerClass_softClass_33929;
    v30 = getMPAVRoutingControllerClass_softClass_33929;
    if (!getMPAVRoutingControllerClass_softClass_33929)
    {
      *(_QWORD *)buf = MEMORY[0x24BDAC760];
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = __getMPAVRoutingControllerClass_block_invoke_33930;
      *(_QWORD *)&buf[24] = &unk_24F8BB430;
      v32 = &v27;
      __getMPAVRoutingControllerClass_block_invoke_33930((uint64_t)buf);
      v19 = (void *)v28[3];
    }
    v20 = objc_retainAutorelease(v19);
    _Block_object_dispose(&v27, 8);
    v21 = objc_msgSend([v20 alloc], "initWithDataSource:name:", v13, CFSTR("WFMediaRoutePicker"));
    routingController = v4->_routingController;
    v4->_routingController = (MPAVRoutingController *)v21;

    -[MPAVRoutingController setRouteTypes:](v4->_routingController, "setRouteTypes:", 3);
    v23 = v4;

  }
  return v4;
}

- (void)getPairedAudioDevicesMatchingRouteDescriptor:(id)a3 withCompletion:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  id *v12;
  id v13;
  id v14;
  void *v15;
  NSObject *v16;
  id v17;
  id v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  id v22;
  _QWORD v23[5];
  id v24;
  id v25;
  uint8_t buf[4];
  const char *v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFMediaRoutePicker.m"), 128, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("routeDescriptor"));

  }
  getWFActionsLogObject();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315395;
    v27 = "-[WFMediaRoutePicker getPairedAudioDevicesMatchingRouteDescriptor:withCompletion:]";
    v28 = 2113;
    v29 = v7;
    _os_log_impl(&dword_22D353000, v9, OS_LOG_TYPE_INFO, "%s Searching for Bluetooth device matching route descriptor %{private}@", buf, 0x16u);
  }

  -[WFMediaRoutePicker bluetoothClient](self, "bluetoothClient");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[WFMediaRoutePicker bluetoothClient](self, "bluetoothClient");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __82__WFMediaRoutePicker_getPairedAudioDevicesMatchingRouteDescriptor_withCompletion___block_invoke_19;
    v20[3] = &unk_24F8BA390;
    v12 = &v21;
    v21 = v7;
    v22 = v8;
    v13 = v8;
    v14 = v7;
    objc_msgSend(v11, "getPairedDevicesMatchingType:completion:", 1, v20);

    v15 = v22;
  }
  else
  {
    getWFActionsLogObject();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v27 = "-[WFMediaRoutePicker getPairedAudioDevicesMatchingRouteDescriptor:withCompletion:]";
      _os_log_impl(&dword_22D353000, v16, OS_LOG_TYPE_INFO, "%s Initializing Bluetooth client", buf, 0xCu);
    }

    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = __82__WFMediaRoutePicker_getPairedAudioDevicesMatchingRouteDescriptor_withCompletion___block_invoke;
    v23[3] = &unk_24F8B6A50;
    v12 = &v25;
    v24 = v7;
    v25 = v8;
    v23[4] = self;
    v17 = v8;
    v18 = v7;
    +[WFBluetoothSettingsClient createClientWithCompletionHandler:](WFBluetoothSettingsClient, "createClientWithCompletionHandler:", v23);
    v15 = v24;
  }

}

- (void)startDiscoveringRoutes
{
  NSObject *v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  WFMediaRoutePicker *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  getWFActionsLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v8 = "-[WFMediaRoutePicker startDiscoveringRoutes]";
    v9 = 2112;
    v10 = self;
    _os_log_impl(&dword_22D353000, v3, OS_LOG_TYPE_INFO, "%s Starting discovering routes for %@", buf, 0x16u);
  }

  -[WFMediaRoutePicker routingController](self, "routingController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDiscoveryMode:", 3);
  objc_msgSend(v4, "setDelegate:", self);
  objc_initWeak((id *)buf, self);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __44__WFMediaRoutePicker_startDiscoveringRoutes__block_invoke;
  v5[3] = &unk_24F8B6AA0;
  objc_copyWeak(&v6, (id *)buf);
  objc_msgSend(v4, "fetchAvailableRoutesWithCompletionHandler:", v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak((id *)buf);

}

- (void)stopDiscoveringRoutes
{
  NSObject *v3;
  void *v4;
  int v5;
  const char *v6;
  __int16 v7;
  WFMediaRoutePicker *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  getWFActionsLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v5 = 136315394;
    v6 = "-[WFMediaRoutePicker stopDiscoveringRoutes]";
    v7 = 2112;
    v8 = self;
    _os_log_impl(&dword_22D353000, v3, OS_LOG_TYPE_INFO, "%s Stopping discovering routes for %@", (uint8_t *)&v5, 0x16u);
  }

  -[WFMediaRoutePicker routingController](self, "routingController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDiscoveryMode:", 0);
  objc_msgSend(v4, "setDelegate:", 0);

}

- (void)addAvailableRoutesObserver:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[WFMediaRoutePicker queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __49__WFMediaRoutePicker_addAvailableRoutesObserver___block_invoke;
  v7[3] = &unk_24F8BA480;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)removeAvailableRoutesObserver:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[WFMediaRoutePicker queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __52__WFMediaRoutePicker_removeAvailableRoutesObserver___block_invoke;
  v7[3] = &unk_24F8BA480;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (NSArray)availableRoutes
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[5];

  -[WFMediaRoutePicker routingController](self, "routingController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "availableRoutes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __37__WFMediaRoutePicker_availableRoutes__block_invoke;
  v7[3] = &unk_24F8B6AC8;
  v7[4] = self;
  objc_msgSend(v4, "if_objectsPassingTest:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v5;
}

- (void)findRouteMatchingDescriptor:(id)a3 timeout:(double)a4 completionHandler:(id)a5
{
  id v9;
  WFMediaRouteFinder *v10;
  void *v11;
  id v12;

  v12 = a3;
  v9 = a5;
  if (!v12)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFMediaRoutePicker.m"), 222, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("routeDescriptor"));

  }
  v10 = -[WFMediaRouteFinder initWithPicker:routeDescriptor:timeout:completionHandler:]([WFMediaRouteFinder alloc], "initWithPicker:routeDescriptor:timeout:completionHandler:", self, v12, v9, a4);
  -[WFMediaRouteFinder start](v10, "start");

}

- (void)findRoutesMatchingDescriptors:(id)a3 timeout:(double)a4 completionHandler:(id)a5
{
  _QWORD v5[6];

  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __78__WFMediaRoutePicker_findRoutesMatchingDescriptors_timeout_completionHandler___block_invoke;
  v5[3] = &unk_24F8B6B18;
  v5[4] = self;
  *(double *)&v5[5] = a4;
  objc_msgSend(a3, "if_mapAsynchronously:completionHandler:", v5, a5);
}

- (void)selectRoute:(id)a3 operation:(int64_t)a4 timeout:(double)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  id v17;
  id v18;
  uint64_t v19;
  void *v20;
  void *v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  id v26;
  id from;
  id location;
  _QWORD v29[4];
  id v30;
  WFMediaRoutePicker *v31;
  id v32;
  uint64_t *v33;
  _BYTE *v34;
  double v35;
  int64_t v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t (*v40)(uint64_t, uint64_t);
  void (*v41)(uint64_t);
  id v42;
  _BYTE buf[24];
  void *(*v44)(uint64_t, uint64_t);
  void (*v45)(uint64_t);
  id v46;
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a6;
  getWFActionsLogObject();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "-[WFMediaRoutePicker selectRoute:operation:timeout:completionHandler:]";
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v10;
    _os_log_impl(&dword_22D353000, v12, OS_LOG_TYPE_INFO, "%s Selecting route as output route %@", buf, 0x16u);
  }

  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v44 = __Block_byref_object_copy__33870;
  v45 = __Block_byref_object_dispose__33871;
  v46 = (id)objc_msgSend(v11, "copy");
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = 0;
  v38 = &v37;
  v39 = 0x3032000000;
  v40 = __Block_byref_object_copy__28;
  v41 = __Block_byref_object_dispose__29;
  v42 = 0;
  v14 = objc_alloc(MEMORY[0x24BEC1478]);
  -[WFMediaRoutePicker queue](self, "queue");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = MEMORY[0x24BDAC760];
  v29[0] = MEMORY[0x24BDAC760];
  v29[1] = 3221225472;
  v29[2] = __70__WFMediaRoutePicker_selectRoute_operation_timeout_completionHandler___block_invoke;
  v29[3] = &unk_24F8B6B40;
  v33 = &v37;
  v17 = v13;
  v35 = a5;
  v34 = buf;
  v30 = v17;
  v31 = self;
  v18 = v10;
  v32 = v18;
  v36 = a4;
  v19 = objc_msgSend(v14, "initWithInterval:repeatInterval:queue:handler:", v15, v29, 1.0, 1.0);
  v20 = (void *)v38[5];
  v38[5] = v19;

  objc_msgSend((id)v38[5], "start");
  objc_initWeak(&location, self);
  objc_initWeak(&from, (id)v38[5]);
  objc_initWeak(&v26, *(id *)(*(_QWORD *)&buf[8] + 40));
  -[WFMediaRoutePicker routingController](self, "routingController");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v16;
  v22[1] = 3221225472;
  v22[2] = __70__WFMediaRoutePicker_selectRoute_operation_timeout_completionHandler___block_invoke_32;
  v22[3] = &unk_24F8B6B68;
  objc_copyWeak(&v23, &location);
  objc_copyWeak(&v24, &from);
  objc_copyWeak(&v25, &v26);
  objc_msgSend(v21, "selectRoute:operation:completion:", v18, a4, v22);

  objc_destroyWeak(&v25);
  objc_destroyWeak(&v24);
  objc_destroyWeak(&v23);
  objc_destroyWeak(&v26);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v37, 8);

  _Block_object_dispose(buf, 8);
}

- (void)handOffFromSourceUID:(id)a3 toDestinationUID:(id)a4 timeout:(double)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  if (v10)
  {
    if (v11)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFMediaRoutePicker.m"), 311, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sourceUID"));

    if (v11)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFMediaRoutePicker.m"), 312, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("destinationUID"));

LABEL_3:
  if (-[WFMediaRoutePicker routeType](self, "routeType") != 2)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFMediaRoutePicker.m"), 313, CFSTR("Can't handoff when route type isn't WFMediaRouteTypeHandoffCompatibleEndpoint"));

  }
  if (objc_msgSend(v10, "isEqualToString:", CFSTR("Speaker")))
  {

    v10 = 0;
  }
  if (objc_msgSend(v11, "isEqualToString:", CFSTR("Speaker")))
  {

    v11 = 0;
  }
  -[WFMediaRoutePicker queue](self, "queue");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v12;
  v14 = v12;
  MRMediaRemotePlaybackSessionMigrateForDevice();

}

- (void)findHandoffRouteMatchingDescriptor:(id)a3 timeout:(double)a4 completionHandler:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  _QWORD v13[4];
  id v14;

  v9 = a3;
  v10 = a5;
  if (-[WFMediaRoutePicker routeType](self, "routeType") != 2)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFMediaRoutePicker.m"), 337, CFSTR("Can't handoff when route type isn't WFMediaRouteTypeHandoffCompatibleEndpoint"));

  }
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __83__WFMediaRoutePicker_findHandoffRouteMatchingDescriptor_timeout_completionHandler___block_invoke;
  v13[3] = &unk_24F8B6AF0;
  v14 = v10;
  v11 = v10;
  -[WFMediaRoutePicker findRouteMatchingDescriptor:timeout:completionHandler:](self, "findRouteMatchingDescriptor:timeout:completionHandler:", v9, v13, a4);

}

- (void)findHandoffRoutesMatchingDescriptors:(id)a3 timeout:(double)a4 completionHandler:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  _QWORD v13[4];
  id v14;

  v9 = a3;
  v10 = a5;
  if (-[WFMediaRoutePicker routeType](self, "routeType") != 2)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFMediaRoutePicker.m"), 347, CFSTR("Can't handoff when route type isn't WFMediaRouteTypeHandoffCompatibleEndpoint"));

  }
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __85__WFMediaRoutePicker_findHandoffRoutesMatchingDescriptors_timeout_completionHandler___block_invoke;
  v13[3] = &unk_24F8B9110;
  v14 = v10;
  v11 = v10;
  -[WFMediaRoutePicker findRoutesMatchingDescriptors:timeout:completionHandler:](self, "findRoutesMatchingDescriptors:timeout:completionHandler:", v9, v13, a4);

}

- (void)routingControllerAvailableRoutesDidChange:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  _QWORD block[5];
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  getWFActionsLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v4, "availableRoutes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315395;
    v10 = "-[WFMediaRoutePicker routingControllerAvailableRoutesDidChange:]";
    v11 = 2113;
    v12 = v6;
    _os_log_impl(&dword_22D353000, v5, OS_LOG_TYPE_INFO, "%s Available media routes updated: %{private}@", buf, 0x16u);

  }
  -[WFMediaRoutePicker queue](self, "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __64__WFMediaRoutePicker_routingControllerAvailableRoutesDidChange___block_invoke;
  block[3] = &unk_24F8BB638;
  block[4] = self;
  dispatch_async(v7, block);

}

- (int64_t)routeType
{
  return self->_routeType;
}

- (AVAudioSession)routingAudioSession
{
  return self->_routingAudioSession;
}

- (void)setRoutingAudioSession:(id)a3
{
  objc_storeStrong((id *)&self->_routingAudioSession, a3);
}

- (MPAVRoutingController)routingController
{
  return self->_routingController;
}

- (void)setRoutingController:(id)a3
{
  objc_storeStrong((id *)&self->_routingController, a3);
}

- (WFBluetoothSettingsClient)bluetoothClient
{
  return self->_bluetoothClient;
}

- (NSMutableArray)observers
{
  return self->_observers;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_bluetoothClient, 0);
  objc_storeStrong((id *)&self->_routingController, 0);
  objc_storeStrong((id *)&self->_routingAudioSession, 0);
}

void __64__WFMediaRoutePicker_routingControllerAvailableRoutesDidChange___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "observers", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "routePickerDidUpdateAvailableRoutes:", *(_QWORD *)(a1 + 32));
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

void __85__WFMediaRoutePicker_findHandoffRoutesMatchingDescriptors_timeout_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v5 = a3;
  objc_msgSend(a2, "if_map:", &__block_literal_global_33841);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

id __85__WFMediaRoutePicker_findHandoffRoutesMatchingDescriptors_timeout_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  id MPAVEndpointRouteClass;
  void *v4;

  v2 = a2;
  MPAVEndpointRouteClass = getMPAVEndpointRouteClass();
  WFEnforceClass_33843(v2, (uint64_t)MPAVEndpointRouteClass);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

void __83__WFMediaRoutePicker_findHandoffRouteMatchingDescriptor_timeout_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4;
  id v5;
  id v6;
  id MPAVEndpointRouteClass;
  id v8;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = a3;
  v6 = a2;
  MPAVEndpointRouteClass = getMPAVEndpointRouteClass();
  WFEnforceClass_33843(v6, (uint64_t)MPAVEndpointRouteClass);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v8, v5);
}

uint64_t __86__WFMediaRoutePicker_handOffFromSourceUID_toDestinationUID_timeout_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __70__WFMediaRoutePicker_selectRoute_operation_timeout_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  double v3;
  double v4;
  double v5;
  NSObject *v6;
  _BOOL4 v7;
  uint64_t v8;
  id v9;
  void (*v10)(void);
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  NSObject *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t v28[128];
  uint8_t buf[4];
  const char *v30;
  __int16 v31;
  uint64_t v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  if ((objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "isCancelled") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 32));
    v4 = v3;
    v5 = *(double *)(a1 + 72);

    getWFActionsLogObject();
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);
    if (v4 <= v5)
    {
      if (v7)
      {
        *(_DWORD *)buf = 136315138;
        v30 = "-[WFMediaRoutePicker selectRoute:operation:timeout:completionHandler:]_block_invoke";
        _os_log_impl(&dword_22D353000, v6, OS_LOG_TYPE_INFO, "%s Select route: polling to see if desired route selection operation has succeeded", buf, 0xCu);
      }

      objc_msgSend(*(id *)(a1 + 40), "routingController");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "pickedRoutes");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      v26 = 0u;
      v27 = 0u;
      v24 = 0u;
      v25 = 0u;
      v9 = v12;
      v13 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      if (v13)
      {
        v14 = v13;
        v15 = *(_QWORD *)v25;
        while (2)
        {
          for (i = 0; i != v14; ++i)
          {
            if (*(_QWORD *)v25 != v15)
              objc_enumerationMutation(v9);
            v17 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
            objc_msgSend(v17, "routeUID", (_QWORD)v24);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(a1 + 48), "routeUID");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend(v18, "isEqualToString:", v19) & 1) != 0
              || objc_msgSend(v17, "isDeviceSpeakerRoute")
              && objc_msgSend(*(id *)(a1 + 48), "isDeviceSpeakerRoute"))
            {

LABEL_22:
              if (*(_QWORD *)(a1 + 80) != 2)
                goto LABEL_25;
              goto LABEL_29;
            }
            objc_msgSend(v17, "routeName");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(a1 + 48), "routeName");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = objc_msgSend(v20, "isEqualToString:", v21);

            if ((v22 & 1) != 0)
              goto LABEL_22;
          }
          v14 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
          if (v14)
            continue;
          break;
        }

        if (((v22 ^ (*(_QWORD *)(a1 + 80) == 2)) & 1) != 0)
          goto LABEL_25;
        goto LABEL_29;
      }

      if (*(_QWORD *)(a1 + 80) != 2)
      {
LABEL_29:

        return;
      }
LABEL_25:
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "cancel", (_QWORD)v24);
      getWFActionsLogObject();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        v30 = "-[WFMediaRoutePicker selectRoute:operation:timeout:completionHandler:]_block_invoke";
        _os_log_impl(&dword_22D353000, v23, OS_LOG_TYPE_INFO, "%s Select route: route selection finished successfully", buf, 0xCu);
      }

      v10 = *(void (**)(void))(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40) + 16);
    }
    else
    {
      if (v7)
      {
        v8 = *(_QWORD *)(a1 + 72);
        *(_DWORD *)buf = 136315394;
        v30 = "-[WFMediaRoutePicker selectRoute:operation:timeout:completionHandler:]_block_invoke";
        v31 = 2048;
        v32 = v8;
        _os_log_impl(&dword_22D353000, v6, OS_LOG_TYPE_INFO, "%s Selecting route timed out after %f seconds", buf, 0x16u);
      }

      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "cancel");
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("WFMediaRoutePickerErrorDomain"), 3, 0);
      v9 = (id)objc_claimAutoreleasedReturnValue();
      v10 = *(void (**)(void))(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40) + 16);
    }
    v10();
    goto LABEL_29;
  }
}

void __70__WFMediaRoutePicker_selectRoute_operation_timeout_completionHandler___block_invoke_32(id *a1, void *a2)
{
  id v3;
  id WeakRetained;
  id v5;
  id v6;
  NSObject *v7;
  _QWORD block[4];
  id v9;
  id v10;
  id v11;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained(a1 + 4);
  v5 = objc_loadWeakRetained(a1 + 5);
  v6 = objc_loadWeakRetained(a1 + 6);
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "queue");
    v7 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __70__WFMediaRoutePicker_selectRoute_operation_timeout_completionHandler___block_invoke_2;
    block[3] = &unk_24F8BA298;
    v9 = v5;
    v10 = v3;
    v11 = v6;
    dispatch_async(v7, block);

  }
}

uint64_t __70__WFMediaRoutePicker_selectRoute_operation_timeout_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t result;
  uint64_t v10;
  uint64_t v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "cancel");
  v2 = *(_QWORD *)(a1 + 40);
  getWFActionsLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      v5 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 136315394;
      v13 = "-[WFMediaRoutePicker selectRoute:operation:timeout:completionHandler:]_block_invoke_2";
      v14 = 2112;
      v15 = v5;
      _os_log_impl(&dword_22D353000, v4, OS_LOG_TYPE_INFO, "%s Select route completed with error: %@", buf, 0x16u);
    }

    v6 = (void *)MEMORY[0x24BDD1540];
    v7 = *(_QWORD *)(a1 + 40);
    v10 = *MEMORY[0x24BDD1398];
    v11 = v7;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v11, &v10, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "errorWithDomain:code:userInfo:", CFSTR("WFMediaRoutePickerErrorDomain"), 4, v8);
    v4 = objc_claimAutoreleasedReturnValue();

  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    v13 = "-[WFMediaRoutePicker selectRoute:operation:timeout:completionHandler:]_block_invoke";
    _os_log_impl(&dword_22D353000, v4, OS_LOG_TYPE_ERROR, "%s Select route completed", buf, 0xCu);
  }

  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 40));
  return result;
}

void __78__WFMediaRoutePicker_findRoutesMatchingDescriptors_timeout_completionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v6;
  void *v7;
  double v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  v7 = *(void **)(a1 + 32);
  v8 = *(double *)(a1 + 40);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __78__WFMediaRoutePicker_findRoutesMatchingDescriptors_timeout_completionHandler___block_invoke_2;
  v10[3] = &unk_24F8B6AF0;
  v11 = v6;
  v9 = v6;
  objc_msgSend(v7, "findRouteMatchingDescriptor:timeout:completionHandler:", a2, v10, v8);

}

uint64_t __78__WFMediaRoutePicker_findRoutesMatchingDescriptors_timeout_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __37__WFMediaRoutePicker_availableRoutes__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;

  v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "routeType") != 2
    || (objc_msgSend(v3, "isAppleTVRoute") & 1) != 0
    || (objc_msgSend(v3, "isHomePodRoute") & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    v4 = objc_msgSend(v3, "isDeviceSpeakerRoute");
  }

  return v4;
}

void __52__WFMediaRoutePicker_removeAvailableRoutesObserver___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "observers");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObject:", *(_QWORD *)(a1 + 40));
  if (!objc_msgSend(v2, "count"))
    objc_msgSend(*(id *)(a1 + 32), "stopDiscoveringRoutes");

}

void __49__WFMediaRoutePicker_addAvailableRoutesObserver___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "observers");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v3, "count");
  objc_msgSend(v3, "addObject:", *(_QWORD *)(a1 + 40));
  if (!v2)
    objc_msgSend(*(id *)(a1 + 32), "startDiscoveringRoutes");

}

void __44__WFMediaRoutePicker_startDiscoveringRoutes__block_invoke(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "routingController");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "routingControllerAvailableRoutesDidChange:", v1);

}

void __82__WFMediaRoutePicker_getPairedAudioDevicesMatchingRouteDescriptor_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  NSObject *v5;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v4 = a2;
  if (v4)
  {
    getWFActionsLogObject();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6 = 136315138;
      v7 = "-[WFMediaRoutePicker getPairedAudioDevicesMatchingRouteDescriptor:withCompletion:]_block_invoke";
      _os_log_impl(&dword_22D353000, v5, OS_LOG_TYPE_INFO, "%s Bluetooth client initialized, caching for future runs...", (uint8_t *)&v6, 0xCu);
    }

    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 32), a2);
    objc_msgSend(*(id *)(a1 + 32), "getPairedAudioDevicesMatchingRouteDescriptor:withCompletion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

void __82__WFMediaRoutePicker_getPairedAudioDevicesMatchingRouteDescriptor_withCompletion___block_invoke_19(uint64_t a1, void *a2)
{
  void *v4;
  uint64_t v5;
  NSObject *v6;
  _BOOL4 v7;
  uint64_t v8;
  const char *v9;
  NSObject *v10;
  uint32_t v11;
  uint64_t v12;
  _QWORD v13[4];
  id v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __82__WFMediaRoutePicker_getPairedAudioDevicesMatchingRouteDescriptor_withCompletion___block_invoke_2;
  v13[3] = &unk_24F8B6A78;
  v14 = *(id *)(a1 + 32);
  objc_msgSend(a2, "if_objectsPassingTest:", v13);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");
  getWFActionsLogObject();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);
  if (v5)
  {
    if (v7)
    {
      v8 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 136315651;
      v16 = "-[WFMediaRoutePicker getPairedAudioDevicesMatchingRouteDescriptor:withCompletion:]_block_invoke";
      v17 = 2113;
      v18 = v8;
      v19 = 2113;
      v20 = v4;
      v9 = "%s Found bluetooth devices matching descriptor %{private}@: %{private}@";
      v10 = v6;
      v11 = 32;
LABEL_6:
      _os_log_impl(&dword_22D353000, v10, OS_LOG_TYPE_INFO, v9, buf, v11);
    }
  }
  else if (v7)
  {
    v12 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 136315395;
    v16 = "-[WFMediaRoutePicker getPairedAudioDevicesMatchingRouteDescriptor:withCompletion:]_block_invoke";
    v17 = 2113;
    v18 = v12;
    v9 = "%s Did not find any bluetooth devices matching descriptor %{private}@";
    v10 = v6;
    v11 = 22;
    goto LABEL_6;
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __82__WFMediaRoutePicker_getPairedAudioDevicesMatchingRouteDescriptor_withCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  int v13;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "routeUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "address");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "containsString:", v6);

  objc_msgSend(*(id *)(a1 + 32), "routeName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = v8;
  v11 = v9;
  v12 = v11;
  if (v10 == v11)
  {
    v13 = 1;
  }
  else
  {
    v13 = 0;
    if (v10 && v11)
      v13 = objc_msgSend(v10, "isEqualToString:", v11);
  }

  return v7 | v13;
}

@end
