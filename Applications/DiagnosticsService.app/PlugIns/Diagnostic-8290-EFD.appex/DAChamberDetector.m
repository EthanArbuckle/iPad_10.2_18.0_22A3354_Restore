@implementation DAChamberDetector

- (DAChamberDetector)initWithInputs:(id)a3
{
  id v5;
  DAChamberDetector *v6;
  DAChamberDetector *v7;
  id *p_inputs;
  uint64_t v9;
  NSMutableSet *sensors;
  uint64_t v11;
  NSMutableSet *expectations;
  dispatch_queue_t v13;
  OS_dispatch_queue *eventQueue;
  uint64_t v15;
  NSObject *v16;
  DAWifiSensor *v17;
  uint64_t v18;
  NSObject *v19;
  DAALSSensor *v20;
  uint64_t v21;
  NSObject *v22;
  unsigned int v23;
  unsigned int v24;
  objc_super v26;
  uint8_t buf[4];
  unsigned int v28;
  __int16 v29;
  unsigned int v30;

  v5 = a3;
  v26.receiver = self;
  v26.super_class = (Class)DAChamberDetector;
  v6 = -[DAChamberDetector init](&v26, "init");
  v7 = v6;
  if (v6)
  {
    v6->_started = 0;
    p_inputs = (id *)&v6->_inputs;
    objc_storeStrong((id *)&v6->_inputs, a3);
    v9 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
    sensors = v7->_sensors;
    v7->_sensors = (NSMutableSet *)v9;

    v11 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
    expectations = v7->_expectations;
    v7->_expectations = (NSMutableSet *)v11;

    v13 = dispatch_queue_create("DAChamberDetectorEventQueue", (dispatch_queue_attr_t)&_dispatch_queue_attr_concurrent);
    eventQueue = v7->_eventQueue;
    v7->_eventQueue = (OS_dispatch_queue *)v13;

    if ((-[DAChamberInputs detectChamberSensor](v7->_inputs, "detectChamberSensor") & 2) != 0)
    {
      v15 = DiagnosticLogHandleForCategory(3);
      v16 = objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "DAChamberDetector: Creating Wifi sensor", buf, 2u);
      }

      v17 = -[DAWifiSensor initWithDelegate:scanInterval:]([DAWifiSensor alloc], "initWithDelegate:scanInterval:", v7, 8.0);
      -[NSMutableSet addObject:](v7->_sensors, "addObject:", v17);

    }
    if ((objc_msgSend(*p_inputs, "detectChamberSensor") & 1) != 0)
    {
      v18 = DiagnosticLogHandleForCategory(3);
      v19 = objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "DAChamberDetector: Creating ALS sensor", buf, 2u);
      }

      v20 = -[DAALSSensor initWithDelegate:threshold:]([DAALSSensor alloc], "initWithDelegate:threshold:", v7, -[DAChamberInputs detectChamberReadyALSThreshold](v7->_inputs, "detectChamberReadyALSThreshold"));
      -[NSMutableSet addObject:](v7->_sensors, "addObject:", v20);

    }
    v21 = DiagnosticLogHandleForCategory(3);
    v22 = objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      v23 = objc_msgSend(*p_inputs, "detectChamberReadyWaitTime");
      v24 = objc_msgSend(*p_inputs, "detectChamberSensor");
      *(_DWORD *)buf = 67109376;
      v28 = v23;
      v29 = 1024;
      v30 = v24;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "DAChamberDetector: Setup parameters: detectChamberReadyWaitTime(%dsec), detectChamberSensor(%x)", buf, 0xEu);
    }

  }
  return v7;
}

- (void)start
{
  void *v3;
  id v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  id v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  DAChamberSensorEvent *v17;
  uint64_t v18;
  void *v19;
  DAChamberSensorEvent *v20;
  dispatch_semaphore_t v21;
  NSObject *v22;
  id obj;
  _QWORD block[5];
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t v29[128];
  uint8_t buf[4];
  void *v31;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DAChamberDetector sensors](self, "sensors"));
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    v5 = DiagnosticLogHandleForCategory(3);
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[DAChamberDetector sensors](self, "sensors"));
      *(_DWORD *)buf = 138412290;
      v31 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "DAChamberDetector: Starting sensors: %@", buf, 0xCu);

    }
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue(-[DAChamberDetector sensors](self, "sensors"));
    v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    if (v8)
    {
      v10 = v8;
      v11 = *(_QWORD *)v26;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v26 != v11)
            objc_enumerationMutation(obj);
          v13 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)v12);
          v14 = objc_opt_class(DAWifiSensor, v9);
          if ((objc_opt_isKindOfClass(v13, v14) & 1) != 0)
          {
            v16 = (void *)objc_claimAutoreleasedReturnValue(-[DAChamberDetector expectations](self, "expectations"));
            v17 = -[DAChamberSensorEvent initWithSensorType:eventType:]([DAChamberSensorEvent alloc], "initWithSensorType:eventType:", 1, 3);
            objc_msgSend(v16, "addObject:", v17);

          }
          v18 = objc_opt_class(DAALSSensor, v15);
          if ((objc_opt_isKindOfClass(v13, v18) & 1) != 0)
          {
            v19 = (void *)objc_claimAutoreleasedReturnValue(-[DAChamberDetector expectations](self, "expectations"));
            v20 = -[DAChamberSensorEvent initWithSensorType:eventType:]([DAChamberSensorEvent alloc], "initWithSensorType:eventType:", 0, 2);
            objc_msgSend(v19, "addObject:", v20);

          }
          objc_msgSend(v13, "startMonitoring");
          v12 = (char *)v12 + 1;
        }
        while (v10 != v12);
        v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      }
      while (v10);
    }

    v21 = dispatch_semaphore_create(0);
    -[DAChamberDetector setChamberReadySemaphore:](self, "setChamberReadySemaphore:", v21);

    v22 = objc_claimAutoreleasedReturnValue(-[DAChamberDetector eventQueue](self, "eventQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100004B20;
    block[3] = &unk_10001C580;
    block[4] = self;
    dispatch_async(v22, block);

    -[DAChamberDetector setStarted:](self, "setStarted:", 1);
  }
  else
  {
    -[DAChamberDetector setStarted:](self, "setStarted:", 1);
    -[DAChamberDetector checkChamberIsReady](self, "checkChamberIsReady");
  }
}

- (void)stop
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DAChamberDetector sensors](self, "sensors", 0));
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)v7), "stopMonitoring");
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[DAChamberDetector expectations](self, "expectations"));
  objc_msgSend(v8, "removeAllObjects");

  -[DAChamberDetector setStarted:](self, "setStarted:", 0);
}

- (void)checkChamberIsReady
{
  unsigned __int8 v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  id v9;
  uint8_t buf[16];

  v9 = (id)objc_claimAutoreleasedReturnValue(-[DAChamberDetector expectations](self, "expectations"));
  if (objc_msgSend(v9, "count"))
  {

  }
  else
  {
    v3 = -[DAChamberDetector started](self, "started");

    if ((v3 & 1) != 0)
    {
      v4 = DiagnosticLogHandleForCategory(3);
      v5 = objc_claimAutoreleasedReturnValue(v4);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "DAChamberDetector: Chamber is ready", buf, 2u);
      }

      v6 = (void *)objc_claimAutoreleasedReturnValue(-[DAChamberDetector chamberReadySemaphore](self, "chamberReadySemaphore"));
      if (v6)
      {
        v7 = objc_claimAutoreleasedReturnValue(-[DAChamberDetector chamberReadySemaphore](self, "chamberReadySemaphore"));
        dispatch_semaphore_signal(v7);

      }
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[DAChamberDetector delegate](self, "delegate"));
      objc_msgSend(v8, "handleChamberStatus:", 1);

    }
  }
}

- (BOOL)shouldStopAfterEventReceived:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;
  void *v7;
  unsigned int v8;

  v4 = a3;
  if (!-[DAChamberDetector started](self, "started"))
    goto LABEL_11;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DAChamberDetector expectations](self, "expectations"));
  if (!objc_msgSend(v5, "count"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[DAChamberDetector sensors](self, "sensors"));
    if (!objc_msgSend(v7, "count"))
    {

      goto LABEL_3;
    }
    if (objc_msgSend(v4, "eventType") == 1)
    {

LABEL_10:
      -[DAChamberDetector stop](self, "stop");
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[DAChamberDetector delegate](self, "delegate"));
      objc_msgSend(v5, "handleChamberStatus:", 3);
      v6 = 1;
      goto LABEL_4;
    }
    v8 = objc_msgSend(v4, "eventType");

    if (v8 == 4)
      goto LABEL_10;
LABEL_11:
    v6 = 0;
    goto LABEL_12;
  }
LABEL_3:
  v6 = 0;
LABEL_4:

LABEL_12:
  return v6;
}

- (void)handleSensorEvent:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  DAChamberDetector *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  id v12;
  int v13;
  id v14;

  v4 = a3;
  v5 = DiagnosticLogHandleForCategory(3);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 138412290;
    v14 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "DAChamberDetector: Received sensor event: %@", (uint8_t *)&v13, 0xCu);
  }

  if (!-[DAChamberDetector shouldStopAfterEventReceived:](self, "shouldStopAfterEventReceived:", v4))
  {
    v7 = self;
    objc_sync_enter(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[DAChamberDetector expectations](v7, "expectations"));
    objc_msgSend(v8, "removeObject:", v4);

    v9 = DiagnosticLogHandleForCategory(3);
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[DAChamberDetector expectations](v7, "expectations"));
      v12 = objc_msgSend(v11, "count");
      v13 = 134217984;
      v14 = v12;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "DAChamberDetector: Expectations left: %lu", (uint8_t *)&v13, 0xCu);

    }
    -[DAChamberDetector checkChamberIsReady](v7, "checkChamberIsReady");
    objc_sync_exit(v7);

  }
}

- (void)dealloc
{
  objc_super v3;

  -[DAChamberDetector stop](self, "stop");
  v3.receiver = self;
  v3.super_class = (Class)DAChamberDetector;
  -[DAChamberDetector dealloc](&v3, "dealloc");
}

- (DAChamberDetectorDelegate)delegate
{
  return (DAChamberDetectorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (DAChamberInputs)inputs
{
  return self->_inputs;
}

- (void)setInputs:(id)a3
{
  objc_storeStrong((id *)&self->_inputs, a3);
}

- (NSMutableSet)sensors
{
  return self->_sensors;
}

- (void)setSensors:(id)a3
{
  objc_storeStrong((id *)&self->_sensors, a3);
}

- (NSMutableSet)expectations
{
  return self->_expectations;
}

- (void)setExpectations:(id)a3
{
  objc_storeStrong((id *)&self->_expectations, a3);
}

- (OS_dispatch_semaphore)chamberReadySemaphore
{
  return self->_chamberReadySemaphore;
}

- (void)setChamberReadySemaphore:(id)a3
{
  objc_storeStrong((id *)&self->_chamberReadySemaphore, a3);
}

- (OS_dispatch_queue)eventQueue
{
  return self->_eventQueue;
}

- (void)setEventQueue:(id)a3
{
  objc_storeStrong((id *)&self->_eventQueue, a3);
}

- (BOOL)started
{
  return self->_started;
}

- (void)setStarted:(BOOL)a3
{
  self->_started = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventQueue, 0);
  objc_storeStrong((id *)&self->_chamberReadySemaphore, 0);
  objc_storeStrong((id *)&self->_expectations, 0);
  objc_storeStrong((id *)&self->_sensors, 0);
  objc_storeStrong((id *)&self->_inputs, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
