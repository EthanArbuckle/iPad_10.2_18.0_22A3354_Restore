@implementation DAWifiSensor

- (DAWifiSensor)initWithDelegate:(id)a3 scanInterval:(double)a4
{
  id v6;
  DAWifiSensor *v7;
  DAWifiSensor *v8;
  CWFInterface *v9;
  CWFInterface *interface;
  dispatch_queue_t v11;
  OS_dispatch_queue *scanQueue;
  DAChamberSensorEvent *mostRecentEvent;
  objc_super v15;

  v6 = a3;
  v15.receiver = self;
  v15.super_class = (Class)DAWifiSensor;
  v7 = -[DAWifiSensor init](&v15, "init");
  v8 = v7;
  if (v7)
  {
    objc_storeWeak((id *)&v7->_delegate, v6);
    v9 = (CWFInterface *)objc_alloc_init((Class)CWFInterface);
    interface = v8->_interface;
    v8->_interface = v9;

    v8->_scanInterval = a4;
    v11 = dispatch_queue_create("DAWifiSensorQueue", 0);
    scanQueue = v8->_scanQueue;
    v8->_scanQueue = (OS_dispatch_queue *)v11;

    mostRecentEvent = v8->_mostRecentEvent;
    v8->_mostRecentEvent = 0;

  }
  return v8;
}

- (void)startMonitoring
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  uint8_t v6[16];

  v3 = DiagnosticLogHandleForCategory(3);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "DAWifiSensor:: Start monitoring", v6, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DAWifiSensor interface](self, "interface"));
  objc_msgSend(v5, "activate");

  -[DAWifiSensor setStarted:](self, "setStarted:", 1);
  -[DAWifiSensor scheduleNetworksScanWithDelay:](self, "scheduleNetworksScanWithDelay:", 0.0);
}

- (void)stopMonitoring
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  uint8_t v6[16];

  v3 = DiagnosticLogHandleForCategory(3);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "DAWifiSensor:: Stop monitoring", v6, 2u);
  }

  -[DAWifiSensor setStarted:](self, "setStarted:", 0);
  -[DAWifiSensor setMostRecentEvent:](self, "setMostRecentEvent:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DAWifiSensor interface](self, "interface"));
  objc_msgSend(v5, "invalidate");

}

- (void)scanAvailableNetworks
{
  DAWifiSensor *v2;
  uint64_t v3;
  NSObject *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  NSObject *v11;
  DAChamberSensorEvent *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  void *i;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  void *v22;
  id v23;
  uint64_t v24;
  void *v25;
  unsigned __int8 v26;
  void *v27;
  void *v28;
  DAWifiSensor *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  id v34;
  uint8_t buf[4];
  id v36;
  __int16 v37;
  id v38;
  _BYTE v39[128];

  v2 = self;
  if (-[DAWifiSensor started](self, "started"))
  {
    v3 = DiagnosticLogHandleForCategory(3);
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "DAWifiSensor: Scanning wifi networks", buf, 2u);
    }

    v5 = objc_alloc_init((Class)CWFScanParameters);
    objc_msgSend(v5, "setMergeScanResults:", 1);
    objc_msgSend(v5, "setMaximumCacheAge:", 0);
    objc_msgSend(v5, "setChannels:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", &off_10001D7D8));
    objc_msgSend(v5, "setIncludeProperties:", v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[DAWifiSensor interface](v2, "interface"));
    v34 = 0;
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "performScanWithParameters:error:", v5, &v34));
    v9 = v34;

    v10 = DiagnosticLogHandleForCategory(3);
    v11 = objc_claimAutoreleasedReturnValue(v10);
    v12 = (DAChamberSensorEvent *)v11;
    if (v9)
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        sub_100010F68(v9, &v12->super);
    }
    else
    {
      v29 = v2;
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v13 = objc_msgSend(v8, "count");
        *(_DWORD *)buf = 134217984;
        v36 = v13;
        _os_log_impl((void *)&_mh_execute_header, &v12->super, OS_LOG_TYPE_DEFAULT, "DAWifiSensor: Found %lu networks", buf, 0xCu);
      }

      v32 = 0u;
      v33 = 0u;
      v30 = 0u;
      v31 = 0u;
      v28 = v8;
      v14 = v8;
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v30, v39, 16);
      if (v15)
      {
        v16 = v15;
        v17 = *(_QWORD *)v31;
        do
        {
          for (i = 0; i != v16; i = (char *)i + 1)
          {
            if (*(_QWORD *)v31 != v17)
              objc_enumerationMutation(v14);
            v19 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * (_QWORD)i);
            v20 = DiagnosticLogHandleForCategory(3);
            v21 = objc_claimAutoreleasedReturnValue(v20);
            if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
            {
              v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "networkName"));
              v23 = objc_msgSend(v19, "RSSI");
              *(_DWORD *)buf = 138412546;
              v36 = v22;
              v37 = 2048;
              v38 = v23;
              _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "SSID: %@, RSSI: %ld, ", buf, 0x16u);

            }
          }
          v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v30, v39, 16);
        }
        while (v16);
      }

      if (objc_msgSend(v14, "count"))
        v24 = 4;
      else
        v24 = 3;
      v12 = -[DAChamberSensorEvent initWithSensorType:eventType:]([DAChamberSensorEvent alloc], "initWithSensorType:eventType:", 1, v24);
      v2 = v29;
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[DAWifiSensor mostRecentEvent](v29, "mostRecentEvent"));
      v26 = -[DAChamberSensorEvent isEqual:](v12, "isEqual:", v25);

      if ((v26 & 1) == 0)
      {
        v27 = (void *)objc_claimAutoreleasedReturnValue(-[DAWifiSensor delegate](v29, "delegate"));
        objc_msgSend(v27, "handleSensorEvent:", v12);

        -[DAWifiSensor setMostRecentEvent:](v29, "setMostRecentEvent:", v12);
      }
      v8 = v28;
      v9 = 0;
    }

    -[DAWifiSensor scanInterval](v2, "scanInterval");
    -[DAWifiSensor scheduleNetworksScanWithDelay:](v2, "scheduleNetworksScanWithDelay:");

  }
}

- (void)scheduleNetworksScanWithDelay:(double)a3
{
  dispatch_time_t v4;
  NSObject *v5;
  _QWORD block[5];

  v4 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
  v5 = objc_claimAutoreleasedReturnValue(-[DAWifiSensor scanQueue](self, "scanQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000D738;
  block[3] = &unk_10001C580;
  block[4] = self;
  dispatch_after(v4, v5, block);

}

- (void)dealloc
{
  objc_super v3;

  -[DAWifiSensor stopMonitoring](self, "stopMonitoring");
  v3.receiver = self;
  v3.super_class = (Class)DAWifiSensor;
  -[DAWifiSensor dealloc](&v3, "dealloc");
}

- (DAChamberSensorDelegate)delegate
{
  return (DAChamberSensorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (CWFInterface)interface
{
  return self->_interface;
}

- (void)setInterface:(id)a3
{
  objc_storeStrong((id *)&self->_interface, a3);
}

- (OS_dispatch_queue)scanQueue
{
  return self->_scanQueue;
}

- (void)setScanQueue:(id)a3
{
  objc_storeStrong((id *)&self->_scanQueue, a3);
}

- (DAChamberSensorEvent)mostRecentEvent
{
  return self->_mostRecentEvent;
}

- (void)setMostRecentEvent:(id)a3
{
  objc_storeStrong((id *)&self->_mostRecentEvent, a3);
}

- (double)scanInterval
{
  return self->_scanInterval;
}

- (void)setScanInterval:(double)a3
{
  self->_scanInterval = a3;
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
  objc_storeStrong((id *)&self->_mostRecentEvent, 0);
  objc_storeStrong((id *)&self->_scanQueue, 0);
  objc_storeStrong((id *)&self->_interface, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
