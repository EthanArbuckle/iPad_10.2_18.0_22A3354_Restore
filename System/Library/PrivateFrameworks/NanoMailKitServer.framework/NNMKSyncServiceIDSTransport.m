@implementation NNMKSyncServiceIDSTransport

- (unint64_t)connectivityState
{
  return self->_connectivityState;
}

- (NNMKSyncServiceIDSTransport)initWithServiceName:(id)a3 queue:(id)a4 delegate:(id)a5
{
  id v9;
  id v10;
  id v11;
  NNMKSyncServiceIDSTransport *v12;
  NNMKSyncServiceIDSTransport *v13;
  uint64_t v14;
  IDSService *idsService;
  objc_super v17;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)NNMKSyncServiceIDSTransport;
  v12 = -[NNMKSyncServiceIDSTransport init](&v17, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeWeak((id *)&v12->_delegate, v11);
    objc_storeStrong((id *)&v13->_serviceName, a3);
    v14 = objc_msgSend(objc_alloc(MEMORY[0x24BE4FCB8]), "initWithService:", v9);
    idsService = v13->_idsService;
    v13->_idsService = (IDSService *)v14;

    -[IDSService addDelegate:queue:](v13->_idsService, "addDelegate:queue:", v13, v10);
    v13->_connectivityState = -[NNMKSyncServiceIDSTransport _connectivityState](v13, "_connectivityState");
  }

  return v13;
}

- (unint64_t)_connectivityState
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  unint64_t v8;
  int v9;
  int v10;
  int v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  unsigned int v16;
  char v17;
  unsigned int v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t buf[4];
  uint64_t v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  uint64_t v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  -[IDSService devices](self->_idsService, "devices", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v20, v30, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v21;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v21 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        if (objc_msgSend(v7, "isDefaultPairedDevice"))
        {
          v9 = __connected;
          if (v9 != objc_msgSend(v7, "isConnected")
            || (v10 = __nearby, v10 != objc_msgSend(v7, "isNearby"))
            || (v11 = __cloudConnected, v11 != objc_msgSend(v7, "isCloudConnected")))
          {
            __connected = objc_msgSend(v7, "isConnected");
            __nearby = objc_msgSend(v7, "isNearby");
            __cloudConnected = objc_msgSend(v7, "isCloudConnected");
            v12 = (void *)qword_253E87A90;
            if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_DEFAULT))
            {
              v13 = v12;
              v14 = objc_msgSend(v7, "isConnected");
              v15 = objc_msgSend(v7, "isNearby");
              v16 = objc_msgSend(v7, "isCloudConnected");
              *(_DWORD *)buf = 134218496;
              v25 = v14;
              v26 = 2048;
              v27 = v15;
              v28 = 2048;
              v29 = v16;
              _os_log_impl(&dword_22E161000, v13, OS_LOG_TYPE_DEFAULT, "#Connectivity IDS connectivity state. Connected: %lu, Nearby: %lu, Cloud Connected: %lu", buf, 0x20u);

            }
          }
          v17 = objc_msgSend(v7, "isConnected");
          v18 = objc_msgSend(v7, "isNearby");
          if ((v17 & 1) != 0)
          {
            if ((v18 & 1) != 0)
            {
              v8 = 2;
            }
            else if (objc_msgSend(v7, "isCloudConnected"))
            {
              v8 = 4;
            }
            else
            {
              v8 = 3;
            }
          }
          else
          {
            v8 = v18;
          }
          goto LABEL_22;
        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v20, v30, 16);
      if (v4)
        continue;
      break;
    }
  }
  v8 = 0;
LABEL_22:

  return v8;
}

- (id)sendProtobufData:(id)a3 type:(unint64_t)a4 priority:(unint64_t)a5 timeout:(double)a6 allowCloudDelivery:(BOOL)a7
{
  _BOOL8 v7;
  objc_class *v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  IDSService *idsService;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  NSObject *v26;
  NSString *serviceName;
  id v28;
  id v30;
  id v31;
  uint8_t buf[4];
  id v33;
  __int16 v34;
  unint64_t v35;
  __int16 v36;
  NSString *v37;
  _QWORD v38[3];
  _QWORD v39[4];

  v7 = a7;
  v39[3] = *MEMORY[0x24BDAC8D0];
  v12 = (objc_class *)MEMORY[0x24BE4FC88];
  v13 = a3;
  v14 = (void *)objc_msgSend([v12 alloc], "initWithProtobufData:type:isResponse:", v13, (unsigned __int16)a4, 0);

  v15 = 200;
  if (a5 == 100)
    v15 = 100;
  if (a5 == 300)
    v16 = 300;
  else
    v16 = v15;
  idsService = self->_idsService;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", *MEMORY[0x24BE4F9C8]);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = *MEMORY[0x24BE4FB48];
  v39[0] = MEMORY[0x24BDBD1C8];
  v20 = *MEMORY[0x24BE4FB30];
  v38[0] = v19;
  v38[1] = v20;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a6);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v39[1] = v21;
  v38[2] = *MEMORY[0x24BE4FA68];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v7);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v39[2] = v22;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v39, v38, 3);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = 0;
  v31 = 0;
  -[IDSService sendProtobuf:toDestinations:priority:options:identifier:error:](idsService, "sendProtobuf:toDestinations:priority:options:identifier:error:", v14, v18, v16, v23, &v31, &v30);
  v24 = v31;
  v25 = v30;

  v26 = qword_253E87A90;
  if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_DEFAULT))
  {
    serviceName = self->_serviceName;
    *(_DWORD *)buf = 138543874;
    v33 = v24;
    v34 = 2048;
    v35 = a4;
    v36 = 2114;
    v37 = serviceName;
    _os_log_impl(&dword_22E161000, v26, OS_LOG_TYPE_DEFAULT, "#IDS sent message. (IDS Identifier: %{public}@, Type: %lu, Service: %{public}@)", buf, 0x20u);
  }
  v28 = v24;

  return v28;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[IDSService removeDelegate:](self->_idsService, "removeDelegate:", self);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)NNMKSyncServiceIDSTransport;
  -[NNMKSyncServiceIDSTransport dealloc](&v4, sel_dealloc);
}

- (id)sendProtobufData:(id)a3 type:(unint64_t)a4 priority:(unint64_t)a5 timeoutCategory:(unint64_t)a6 allowCloudDelivery:(BOOL)a7
{
  _BOOL8 v7;
  id v12;
  void *v13;

  v7 = a7;
  v12 = a3;
  -[NNMKSyncServiceIDSTransport _timeIntervalFromTimeoutCategory:](self, "_timeIntervalFromTimeoutCategory:", a6);
  -[NNMKSyncServiceIDSTransport sendProtobufData:type:priority:timeout:allowCloudDelivery:](self, "sendProtobufData:type:priority:timeout:allowCloudDelivery:", v12, a4, a5, v7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)sendResourceAtURL:(id)a3 metadata:(id)a4 priority:(unint64_t)a5 timeoutCategory:(unint64_t)a6
{
  id v10;
  uint64_t v11;
  uint64_t v12;
  IDSService *idsService;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  NSObject *v24;
  NSString *serviceName;
  id v27;
  id v28;
  uint8_t buf[4];
  id v30;
  __int16 v31;
  id v32;
  __int16 v33;
  NSString *v34;
  _QWORD v35[2];
  _QWORD v36[3];

  v36[2] = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = 200;
  if (a5 == 100)
    v11 = 100;
  if (a5 == 300)
    v12 = 300;
  else
    v12 = v11;
  idsService = self->_idsService;
  v14 = (void *)MEMORY[0x24BDBCF20];
  v15 = *MEMORY[0x24BE4F9C8];
  v16 = a4;
  objc_msgSend(v14, "setWithObject:", v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = *MEMORY[0x24BE4FB30];
  v35[0] = *MEMORY[0x24BE4FB48];
  v35[1] = v18;
  v36[0] = MEMORY[0x24BDBD1C8];
  v19 = (void *)MEMORY[0x24BDD16E0];
  -[NNMKSyncServiceIDSTransport _timeIntervalFromTimeoutCategory:](self, "_timeIntervalFromTimeoutCategory:", a6);
  objc_msgSend(v19, "numberWithDouble:");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v36[1] = v20;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v36, v35, 2);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0;
  v28 = 0;
  -[IDSService sendResourceAtURL:metadata:toDestinations:priority:options:identifier:error:](idsService, "sendResourceAtURL:metadata:toDestinations:priority:options:identifier:error:", v10, v16, v17, v12, v21, &v28, &v27);

  v22 = v28;
  v23 = v27;

  v24 = qword_253E87A90;
  if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_DEFAULT))
  {
    serviceName = self->_serviceName;
    *(_DWORD *)buf = 138543874;
    v30 = v22;
    v31 = 2114;
    v32 = v10;
    v33 = 2114;
    v34 = serviceName;
    _os_log_impl(&dword_22E161000, v24, OS_LOG_TYPE_DEFAULT, "#IDS sent resource. (IDS Identifier: %{public}@, URL: %{public}@, Service: %{public}@)", buf, 0x20u);
  }

  return v22;
}

- (void)service:(id)a3 account:(id)a4 incomingUnhandledProtobuf:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v9;
  void *v10;
  NSObject *v11;
  void *v12;
  int v13;
  NSString *serviceName;
  id WeakRetained;
  void *v16;
  int v17;
  void *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  NSString *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v9 = a5;
  v10 = (void *)qword_253E87A90;
  if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_DEFAULT))
  {
    v11 = v10;
    objc_msgSend(a7, "outgoingResponseIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v9, "type");
    serviceName = self->_serviceName;
    v17 = 138543874;
    v18 = v12;
    v19 = 1024;
    v20 = v13;
    v21 = 2114;
    v22 = serviceName;
    _os_log_impl(&dword_22E161000, v11, OS_LOG_TYPE_DEFAULT, "#IDS received message. (IDS Identifier: %{public}@, Type: %d, Service: %{public}@)", (uint8_t *)&v17, 0x1Cu);

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(v9, "data");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "syncServiceTransport:didReadProtobufData:type:", self, v16, objc_msgSend(v9, "type"));

}

- (void)service:(id)a3 account:(id)a4 incomingResourceAtURL:(id)a5 metadata:(id)a6 fromID:(id)a7 context:(id)a8
{
  id v11;
  id v12;
  void *v13;
  NSObject *v14;
  void *v15;
  NSString *serviceName;
  id WeakRetained;
  int v18;
  void *v19;
  __int16 v20;
  id v21;
  __int16 v22;
  NSString *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v11 = a5;
  v12 = a6;
  v13 = (void *)qword_253E87A90;
  if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_DEFAULT))
  {
    v14 = v13;
    objc_msgSend(a8, "outgoingResponseIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    serviceName = self->_serviceName;
    v18 = 138543874;
    v19 = v15;
    v20 = 2112;
    v21 = v11;
    v22 = 2114;
    v23 = serviceName;
    _os_log_impl(&dword_22E161000, v14, OS_LOG_TYPE_DEFAULT, "#IDS received resource. (IDS Identifier: %{public}@, URL: %@, Service: %{public}@)", (uint8_t *)&v18, 0x20u);

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "syncServiceTransport:didRecieveDataAtURL:metadata:", self, v11, v12);

}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7
{
  NNMKSyncServiceTransportDelegate **p_delegate;
  id v10;
  id v11;
  uint64_t v12;
  id WeakRetained;

  if (!a6)
  {
    p_delegate = &self->_delegate;
    v10 = a7;
    v11 = a5;
    WeakRetained = objc_loadWeakRetained((id *)p_delegate);
    v12 = objc_msgSend(v10, "code");

    objc_msgSend(WeakRetained, "syncServiceTransport:didFailSendingProtobufWithIdentifier:errorCode:", self, v11, v12);
  }
}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 hasBeenDeliveredWithContext:(id)a6
{
  NNMKSyncServiceTransportDelegate **p_delegate;
  id v8;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v8 = a5;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "syncServiceTransport:didSendProtobufSuccessfullyWithIdentifier:", self, v8);

}

- (void)serviceSpaceDidBecomeAvailable:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "syncServiceTransportDidReportSpaceBecameAvailable:", self);

}

- (void)_handleConnectivityChange
{
  unint64_t v3;
  id v4;

  v3 = -[NNMKSyncServiceIDSTransport _connectivityState](self, "_connectivityState");
  if (v3 != self->_connectivityState)
  {
    self->_connectivityState = v3;
    -[NNMKSyncServiceIDSTransport delegate](self, "delegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "syncServiceTransportDidChangeConnectivity:", self);

  }
}

- (double)_timeIntervalFromTimeoutCategory:(unint64_t)a3
{
  double result;

  result = 60.0;
  if (a3 == 1)
    result = 1800.0;
  if (a3 == 2)
    return 3600.0;
  return result;
}

- (IDSService)idsService
{
  return self->_idsService;
}

- (void)setIdsService:(id)a3
{
  objc_storeStrong((id *)&self->_idsService, a3);
}

- (void)setConnectivityState:(unint64_t)a3
{
  self->_connectivityState = a3;
}

- (NNMKSyncServiceTransportDelegate)delegate
{
  return (NNMKSyncServiceTransportDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (void)setServiceName:(id)a3
{
  objc_storeStrong((id *)&self->_serviceName, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceName, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_idsService, 0);
}

@end
