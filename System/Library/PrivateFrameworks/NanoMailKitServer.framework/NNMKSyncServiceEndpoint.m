@implementation NNMKSyncServiceEndpoint

- (unint64_t)connectivityState
{
  return -[NNMKSyncServiceTransport connectivityState](self->_serviceTransport, "connectivityState");
}

- (NNMKSyncServiceEndpoint)initWithIDSServiceName:(id)a3 queue:(id)a4
{
  id v7;
  id v8;
  NNMKSyncServiceEndpoint *v9;
  NNMKSyncServiceEndpoint *v10;
  NSMutableDictionary *v11;
  NSMutableDictionary *repeatPreventionRecords;
  dispatch_source_t v13;
  OS_dispatch_source *repeatPreventionCleanupTimer;
  NSObject *v15;
  _QWORD v17[4];
  id v18;
  id location;
  objc_super v20;

  v7 = a3;
  v8 = a4;
  v20.receiver = self;
  v20.super_class = (Class)NNMKSyncServiceEndpoint;
  v9 = -[NNMKSyncServiceEndpoint init](&v20, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_serviceQueue, a4);
    objc_storeStrong((id *)&v10->_idsServiceName, a3);
    -[NNMKSyncServiceEndpoint _initializeServiceTransport](v10, "_initializeServiceTransport");
    v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    repeatPreventionRecords = v10->_repeatPreventionRecords;
    v10->_repeatPreventionRecords = v11;

    v13 = dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, (dispatch_queue_t)v10->_serviceQueue);
    repeatPreventionCleanupTimer = v10->_repeatPreventionCleanupTimer;
    v10->_repeatPreventionCleanupTimer = (OS_dispatch_source *)v13;

    objc_initWeak(&location, v10);
    v15 = v10->_repeatPreventionCleanupTimer;
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __56__NNMKSyncServiceEndpoint_initWithIDSServiceName_queue___block_invoke;
    v17[3] = &unk_24F9F6860;
    objc_copyWeak(&v18, &location);
    dispatch_source_set_event_handler(v15, v17);
    dispatch_resume((dispatch_object_t)v10->_repeatPreventionCleanupTimer);
    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }

  return v10;
}

- (void)_initializeServiceTransport
{
  NNMKSyncServiceIDSTransport *v3;
  NNMKSyncServiceTransport *serviceTransport;

  v3 = -[NNMKSyncServiceIDSTransport initWithServiceName:queue:delegate:]([NNMKSyncServiceIDSTransport alloc], "initWithServiceName:queue:delegate:", self->_idsServiceName, self->_serviceQueue, self);
  serviceTransport = self->_serviceTransport;
  self->_serviceTransport = (NNMKSyncServiceTransport *)v3;

}

- (id)sendProtobufData:(id)a3 type:(unint64_t)a4 priority:(unint64_t)a5 timeout:(double)a6 allowCloudDelivery:(BOOL)a7
{
  return (id)-[NNMKSyncServiceTransport sendProtobufData:type:priority:timeout:allowCloudDelivery:](self->_serviceTransport, "sendProtobufData:type:priority:timeout:allowCloudDelivery:", a3, a4, a5, a7, a6);
}

void __56__NNMKSyncServiceEndpoint_initWithIDSServiceName_queue___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_removeExpiredRepeatPreventionRecords");

}

- (void)dealloc
{
  objc_super v3;

  dispatch_source_cancel((dispatch_source_t)self->_repeatPreventionCleanupTimer);
  v3.receiver = self;
  v3.super_class = (Class)NNMKSyncServiceEndpoint;
  -[NNMKSyncServiceEndpoint dealloc](&v3, sel_dealloc);
}

- (void)resetRepeatPreventionHistory
{
  -[NSMutableDictionary removeAllObjects](self->_repeatPreventionRecords, "removeAllObjects");
}

- (id)sendProtobufData:(id)a3 type:(unint64_t)a4 priority:(unint64_t)a5 timeoutCategory:(unint64_t)a6 allowCloudDelivery:(BOOL)a7
{
  return (id)-[NNMKSyncServiceTransport sendProtobufData:type:priority:timeoutCategory:allowCloudDelivery:](self->_serviceTransport, "sendProtobufData:type:priority:timeoutCategory:allowCloudDelivery:", a3, a4, a5, a6, a7);
}

- (id)sendProtobufData:(id)a3 type:(unint64_t)a4 priority:(unint64_t)a5 repeatPreventionId:(id)a6 timeoutCategory:(unint64_t)a7 allowCloudDelivery:(BOOL)a8
{
  _BOOL8 v8;
  id v14;
  id v15;
  void *v16;

  v8 = a8;
  v14 = a3;
  v15 = a6;
  if (v15)
  {
    if (-[NNMKSyncServiceEndpoint _willIdRepeat:](self, "_willIdRepeat:", v15))
    {
      v16 = 0;
    }
    else
    {
      -[NNMKSyncServiceTransport sendProtobufData:type:priority:timeoutCategory:allowCloudDelivery:](self->_serviceTransport, "sendProtobufData:type:priority:timeoutCategory:allowCloudDelivery:", v14, a4, a5, a7, v8);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[NNMKSyncServiceEndpoint _storeRepeatPreventionId:priority:](self, "_storeRepeatPreventionId:priority:", v15, a5);
    }
  }
  else
  {
    -[NNMKSyncServiceEndpoint sendProtobufData:type:priority:timeoutCategory:allowCloudDelivery:](self, "sendProtobufData:type:priority:timeoutCategory:allowCloudDelivery:", v14, a4, a5, a7, v8);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v16;
}

- (id)sendResourceAtURL:(id)a3 metadata:(id)a4 priority:(unint64_t)a5 timeoutCategory:(unint64_t)a6
{
  return (id)-[NNMKSyncServiceTransport sendResourceAtURL:metadata:priority:timeoutCategory:](self->_serviceTransport, "sendResourceAtURL:metadata:priority:timeoutCategory:", a3, a4, a5, a6);
}

- (void)syncServiceTransport:(id)a3 didReadProtobufData:(id)a4 type:(unint64_t)a5
{
  id v8;
  void *v9;
  id v10;

  v10 = a3;
  v8 = a4;
  v9 = (void *)MEMORY[0x22E327D4C]();
  -[NNMKSyncServiceEndpoint readProtobufData:type:](self, "readProtobufData:type:", v8, a5);
  objc_autoreleasePoolPop(v9);

}

- (void)syncServiceTransport:(id)a3 didRecieveDataAtURL:(id)a4 metadata:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;

  v11 = a3;
  v8 = a4;
  v9 = a5;
  v10 = (void *)MEMORY[0x22E327D4C]();
  -[NNMKSyncServiceEndpoint readResourceAtURL:metadata:](self, "readResourceAtURL:metadata:", v8, v9);
  objc_autoreleasePoolPop(v10);

}

- (void)syncServiceTransport:(id)a3 didSendProtobufSuccessfullyWithIdentifier:(id)a4
{
  -[NNMKSyncServiceEndpoint successfullySentProtobufWithIDSIdentifier:](self, "successfullySentProtobufWithIDSIdentifier:", a4);
}

- (void)syncServiceTransport:(id)a3 didFailSendingProtobufWithIdentifier:(id)a4 errorCode:(int64_t)a5
{
  -[NNMKSyncServiceEndpoint failedSendingProtobufWithIDSIdentifier:errorCode:](self, "failedSendingProtobufWithIDSIdentifier:errorCode:", a4, a5);
}

- (BOOL)_willIdRepeat:(id)a3
{
  void *v3;
  void *v4;
  double v5;
  BOOL v6;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_repeatPreventionRecords, "objectForKeyedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "timeIntervalSinceNow");
    v6 = v5 > 0.0;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)_storeRepeatPreventionId:(id)a3 priority:(unint64_t)a4
{
  double v5;
  void *v6;
  id v7;
  NSObject *repeatPreventionCleanupTimer;
  dispatch_time_t v9;
  id v10;

  if (a4 == 300)
    v5 = 5.0;
  else
    v5 = 15.0;
  v6 = (void *)MEMORY[0x24BDBCE60];
  v7 = a3;
  objc_msgSend(v6, "dateWithTimeIntervalSinceNow:", v5);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_repeatPreventionRecords, "setObject:forKeyedSubscript:", v10, v7);

  repeatPreventionCleanupTimer = self->_repeatPreventionCleanupTimer;
  v9 = dispatch_time(0, (uint64_t)(v5 * 1000000000.0));
  dispatch_source_set_timer(repeatPreventionCleanupTimer, v9, 0xFFFFFFFFFFFFFFFFLL, 0);

}

- (void)_removeExpiredRepeatPreventionRecords
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[NSMutableDictionary allKeys](self->_repeatPreventionRecords, "allKeys", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * i);
        if (!-[NNMKSyncServiceEndpoint _willIdRepeat:](self, "_willIdRepeat:", v8))
          -[NSMutableDictionary removeObjectForKey:](self->_repeatPreventionRecords, "removeObjectForKey:", v8);
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

}

- (NNMKSyncServiceTransport)serviceTransport
{
  return self->_serviceTransport;
}

- (void)setServiceTransport:(id)a3
{
  objc_storeStrong((id *)&self->_serviceTransport, a3);
}

- (NSString)idsServiceName
{
  return self->_idsServiceName;
}

- (void)setIdsServiceName:(id)a3
{
  objc_storeStrong((id *)&self->_idsServiceName, a3);
}

- (OS_dispatch_queue)serviceQueue
{
  return self->_serviceQueue;
}

- (void)setServiceQueue:(id)a3
{
  objc_storeStrong((id *)&self->_serviceQueue, a3);
}

- (NSMutableDictionary)repeatPreventionRecords
{
  return self->_repeatPreventionRecords;
}

- (void)setRepeatPreventionRecords:(id)a3
{
  objc_storeStrong((id *)&self->_repeatPreventionRecords, a3);
}

- (OS_dispatch_source)repeatPreventionCleanupTimer
{
  return self->_repeatPreventionCleanupTimer;
}

- (void)setRepeatPreventionCleanupTimer:(id)a3
{
  objc_storeStrong((id *)&self->_repeatPreventionCleanupTimer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_repeatPreventionCleanupTimer, 0);
  objc_storeStrong((id *)&self->_repeatPreventionRecords, 0);
  objc_storeStrong((id *)&self->_serviceQueue, 0);
  objc_storeStrong((id *)&self->_idsServiceName, 0);
  objc_storeStrong((id *)&self->_serviceTransport, 0);
}

@end
