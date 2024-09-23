@implementation SYMessengerSyncEngine

- (SYMessengerSyncEngine)initWithService:(id)a3 queue:(id)a4
{
  id v6;
  SYMessengerSyncEngine *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  id v15;
  dispatch_queue_t v16;
  OS_dispatch_queue *idsQueue;
  dispatch_semaphore_t v18;
  OS_dispatch_semaphore *lookupLock;
  uint64_t v20;
  NSMapTable *requestLookup;
  uint64_t v22;
  NSMapTable *callbackLookup;
  SYMessengerSyncEngine *v24;
  int relative_priority_ptr;
  objc_super v27;

  v6 = a3;
  v27.receiver = self;
  v27.super_class = (Class)SYMessengerSyncEngine;
  v7 = -[SYSyncEngine initWithService:queue:](&v27, sel_initWithService_queue_, v6, a4);
  if (v7)
  {
    v8 = objc_alloc(MEMORY[0x24BDD17C8]);
    objc_msgSend(v6, "name");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "lastPathComponent");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v8, "initWithFormat:", CFSTR("%@ SYMessengerSyncEngine IDS Queue"), v10);

    relative_priority_ptr = 0;
    -[SYSyncEngine queue](v7, "queue");
    v12 = objc_claimAutoreleasedReturnValue();
    LODWORD(v9) = dispatch_queue_get_qos_class(v12, &relative_priority_ptr);

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v13 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v13, (dispatch_qos_class_t)v9, relative_priority_ptr);
    v14 = objc_claimAutoreleasedReturnValue();

    v15 = objc_retainAutorelease(v11);
    v16 = dispatch_queue_create((const char *)objc_msgSend(v15, "UTF8String"), v14);
    idsQueue = v7->_idsQueue;
    v7->_idsQueue = (OS_dispatch_queue *)v16;

    +[SYQueueDumper registerQueue:](SYQueueDumper, "registerQueue:", v7->_idsQueue);
    v18 = dispatch_semaphore_create(1);
    lookupLock = v7->_lookupLock;
    v7->_lookupLock = (OS_dispatch_semaphore *)v18;

    objc_msgSend(MEMORY[0x24BDD1650], "weakToStrongObjectsMapTable");
    v20 = objc_claimAutoreleasedReturnValue();
    requestLookup = v7->_requestLookup;
    v7->_requestLookup = (NSMapTable *)v20;

    objc_msgSend(MEMORY[0x24BDD1650], "mapTableWithKeyOptions:valueOptions:", 517, 0x10000);
    v22 = objc_claimAutoreleasedReturnValue();
    callbackLookup = v7->_callbackLookup;
    v7->_callbackLookup = (NSMapTable *)v22;

    v24 = v7;
  }

  return v7;
}

- (id)messageCenter
{
  return self->_messageCenter;
}

- (BOOL)targetIsNearby
{
  _BOOL4 v3;
  SYDevice *activeDevice;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  int v11;
  const char *v12;
  char v13;
  int v14;
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = -[SYDevice hasCachedNearby](self->_activeDevice, "hasCachedNearby");
  activeDevice = self->_activeDevice;
  if (v3)
    return -[SYDevice cachedIsNearby](self->_activeDevice, "cachedIsNearby");
  -[NMSMessageCenter idsService](self->_messageCenter, "idsService");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "devices");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SYDevice findMatchingIDSDeviceFromList:](activeDevice, "findMatchingIDSDeviceFromList:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    if (_sync_log_facilities_pred != -1)
      _os_once();
    v9 = (void *)qword_253D84AC0;
    if (os_log_type_enabled((os_log_t)qword_253D84AC0, OS_LOG_TYPE_DEFAULT))
    {
      v10 = v9;
      v11 = objc_msgSend(v8, "isNearby");
      v12 = "not ";
      if (v11)
        v12 = "";
      v14 = 136315138;
      v15 = v12;
      _os_log_impl(&dword_211704000, v10, OS_LOG_TYPE_DEFAULT, "Target device is %snearby, caching value.", (uint8_t *)&v14, 0xCu);

    }
    -[SYDevice setCachedIsNearby:](self->_activeDevice, "setCachedIsNearby:", objc_msgSend(v8, "isNearby"));
    -[SYDevice setHasCachedNearby:](self->_activeDevice, "setHasCachedNearby:", 1);
    v13 = objc_msgSend(v8, "isNearby");
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (BOOL)targetConnected
{
  _BOOL4 v3;
  SYDevice *activeDevice;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  int v11;
  const char *v12;
  char v13;
  int v14;
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = -[SYDevice hasCachedConnected](self->_activeDevice, "hasCachedConnected");
  activeDevice = self->_activeDevice;
  if (v3)
    return -[SYDevice cachedConnected](self->_activeDevice, "cachedConnected");
  -[NMSMessageCenter idsService](self->_messageCenter, "idsService");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "devices");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SYDevice findMatchingIDSDeviceFromList:](activeDevice, "findMatchingIDSDeviceFromList:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    if (_sync_log_facilities_pred != -1)
      _os_once();
    v9 = (void *)qword_253D84AC0;
    if (os_log_type_enabled((os_log_t)qword_253D84AC0, OS_LOG_TYPE_DEFAULT))
    {
      v10 = v9;
      v11 = objc_msgSend(v8, "isConnected");
      v12 = "not ";
      if (v11)
        v12 = "";
      v14 = 136315138;
      v15 = v12;
      _os_log_impl(&dword_211704000, v10, OS_LOG_TYPE_DEFAULT, "Target device is %sconnected, caching value.", (uint8_t *)&v14, 0xCu);

    }
    -[SYDevice setCachedConnected:](self->_activeDevice, "setCachedConnected:", objc_msgSend(v8, "isConnected"));
    -[SYDevice setHasCachedConnected:](self->_activeDevice, "setHasCachedConnected:", 1);
    v13 = objc_msgSend(v8, "isConnected");
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (BOOL)resume:(id *)a3
{
  SYDevice *v5;
  SYDevice *activeDevice;
  SYDevice *v7;

  -[SYMessengerSyncEngine _hookupMessageHandler](self, "_hookupMessageHandler");
  -[NMSMessageCenter resume](self->_messageCenter, "resume");
  +[SYDevice targetableDevice](SYDevice, "targetableDevice");
  v5 = (SYDevice *)objc_claimAutoreleasedReturnValue();
  activeDevice = self->_activeDevice;
  self->_activeDevice = v5;

  v7 = self->_activeDevice;
  if (a3 && !v7)
    *a3 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithSYError:userInfo:", 2003, 0);
  return v7 != 0;
}

- (void)suspend
{
  NMSMessageCenter *messageCenter;

  -[NMSMessageCenter _obliterate](self->_messageCenter, "_obliterate");
  messageCenter = self->_messageCenter;
  self->_messageCenter = 0;

}

- (void)beginSession
{
  SYDevice *activeDevice;
  void *v4;
  void *v5;
  void *v6;
  NSString *v7;
  NSString *sessionDeviceID;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SYMessengerSyncEngine;
  -[SYSyncEngine beginSession](&v9, sel_beginSession);
  activeDevice = self->_activeDevice;
  -[NMSMessageCenter service](self->_messageCenter, "service");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "devices");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SYDevice findMatchingIDSDeviceFromList:](activeDevice, "findMatchingIDSDeviceFromList:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[NMSMessageCenter deviceIDFromDevice:](self->_messageCenter, "deviceIDFromDevice:", v6);
  v7 = (NSString *)objc_claimAutoreleasedReturnValue();
  sessionDeviceID = self->_sessionDeviceID;
  self->_sessionDeviceID = v7;

}

- (void)enqueueSyncRequest:(id)a3 withMessageID:(unsigned __int16)a4 priority:(int64_t)a5 options:(id)a6 userContext:(id)a7 callback:(id)a8
{
  uint64_t v12;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  NSMapTable *callbackLookup;
  void *v31;
  void *v32;
  int64_t v33;
  id v34;
  id v35;
  id v36;

  v12 = a4;
  v14 = a3;
  v15 = a6;
  v16 = a7;
  v17 = a8;
  if (!self->_messageCenter)
    _os_assumes_log();
  -[SYMessengerSyncEngine _wrapMessage:ofType:userInfo:](self, "_wrapMessage:ofType:userInfo:", v14, v12, v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    v35 = v16;
    v33 = a5;
    if (_sync_log_facilities_pred != -1)
      _os_once();
    v34 = v17;
    v19 = v14;
    if (os_log_type_enabled((os_log_t)qword_253D84AB8, OS_LOG_TYPE_DEBUG))
      -[SYMessengerSyncEngine enqueueSyncRequest:withMessageID:priority:options:userContext:callback:].cold.3();
    -[SYSyncEngine responder](self, "responder");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "extraTransportOptions");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[SYMessengerSyncEngine customIDSOptions](self, "customIDSOptions");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = v15;
    IDSOptionsFromSYServiceOptions(v15);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    CoalesceOptionDictionaries(v22, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    CoalesceOptionDictionaries(v21, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (_sync_log_facilities_pred != -1)
      _os_once();
    v14 = v19;
    v16 = v35;
    if (os_log_type_enabled((os_log_t)qword_253D84AB8, OS_LOG_TYPE_DEBUG))
      -[SYMessengerSyncEngine enqueueSyncRequest:withMessageID:priority:options:userContext:callback:].cold.2();
    if (v33 == 20)
      v26 = 2;
    else
      v26 = v33 != 0;
    objc_msgSend(v18, "setPriority:", v26);
    objc_msgSend(v18, "setExtraIDSOptions:", v25);
    +[SYStatisticStore sharedInstance](SYStatisticStore, "sharedInstance");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[SYSyncEngine service](self, "service");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "name");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "recordOutgoingMessage:forService:", v18, v29);

    dispatch_semaphore_wait((dispatch_semaphore_t)self->_lookupLock, 0xFFFFFFFFFFFFFFFFLL);
    callbackLookup = self->_callbackLookup;
    v17 = v34;
    v31 = (void *)MEMORY[0x212BE0F2C](v34);
    -[NSMapTable setObject:forKey:](callbackLookup, "setObject:forKey:", v31, v18);

    dispatch_semaphore_signal((dispatch_semaphore_t)self->_lookupLock);
    -[NMSMessageCenter sendRequest:](self->_messageCenter, "sendRequest:", v18);
    v15 = v36;
  }
  else
  {
    if (_sync_log_facilities_pred != -1)
      _os_once();
    v32 = (void *)qword_253D84AC0;
    if (os_log_type_enabled((os_log_t)qword_253D84AC0, OS_LOG_TYPE_ERROR))
      -[SYMessengerSyncEngine enqueueSyncRequest:withMessageID:priority:options:userContext:callback:].cold.1(v32);
    v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithSYError:userInfo:", 2001, 0);
    (*((void (**)(id, _QWORD, _QWORD, void *))v17 + 2))(v17, 0, 0, v25);
  }

}

- (id)outputStreamWithMetadata:(id)a3 priority:(int64_t)a4 options:(id)a5 context:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  _QWORD v18[4];
  id v19;
  SYMessengerSyncEngine *v20;
  id v21;
  id v22;
  id v23;
  id v24[2];
  id location;

  v12 = a3;
  v13 = a5;
  v14 = a6;
  if (!self->_messageCenter)
    _os_assumes_log();
  objc_msgSend(MEMORY[0x24BDBCF48], "_SYURLForNewTemporaryFile:", a7);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    v16 = -[SYCompressedFileOutputStream initToCompressedFileAtURL:shouldAppend:]([SYCompressedFileOutputStream alloc], "initToCompressedFileAtURL:shouldAppend:", v15, 0);
    objc_initWeak(&location, self);
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __81__SYMessengerSyncEngine_outputStreamWithMetadata_priority_options_context_error___block_invoke;
    v18[3] = &unk_24CC66A28;
    objc_copyWeak(v24, &location);
    v19 = v15;
    v20 = self;
    v21 = v13;
    v22 = v12;
    v24[1] = (id)a4;
    v23 = v14;
    objc_msgSend(v16, "setOnClose:", v18);

    objc_destroyWeak(v24);
    objc_destroyWeak(&location);
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

void __81__SYMessengerSyncEngine_outputStreamWithMetadata_priority_options_context_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id *WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  char v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  id v26;

  v3 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 72));
  if (WeakRetained && objc_msgSend(v3, "streamStatus") != 7)
  {
    objc_msgSend(*(id *)(a1 + 40), "customIDSOptions");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    IDSOptionsFromSYServiceOptions(*(void **)(a1 + 48));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    CoalesceOptionDictionaries(v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = (void *)objc_opt_new();
    objc_msgSend(v14, "setFileURL:", *(_QWORD *)(a1 + 32));
    objc_msgSend(v14, "setMetadata:", *(_QWORD *)(a1 + 56));
    v15 = *(_QWORD *)(a1 + 80);
    if (v15 == 20)
      v16 = 2;
    else
      v16 = v15 != 0;
    objc_msgSend(v14, "setPriority:", v16);
    objc_msgSend(WeakRetained, "service");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "defaultMessageTimeout");
    objc_msgSend(v14, "setSendTimeout:");

    objc_msgSend(v14, "setPersistentUserInfo:", *(_QWORD *)(a1 + 64));
    objc_msgSend(v14, "setExtraIDSOptions:", v13);
    v18 = (void *)objc_opt_new();
    objc_msgSend(*(id *)(a1 + 40), "_fileTransferHeader");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setHeader:", v19);

    objc_msgSend(v18, "header");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "timestamp");
    v22 = v21;
    objc_msgSend(v14, "sendTimeout");
    v24 = v22 + v23;
    objc_msgSend(v18, "header");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setTimeout:", v24);

    objc_msgSend(v18, "setDecompressedFileSize:", objc_msgSend(v3, "bytesThroughput"));
    objc_msgSend(v14, "setPbHeaderInfo:", v18);
    objc_msgSend(WeakRetained[6], "sendFile:", v14);

  }
  else
  {
    objc_msgSend(v3, "streamError");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      if (_sync_log_facilities_pred != -1)
        _os_once();
      v6 = (void *)qword_253D84AC0;
      if (os_log_type_enabled((os_log_t)qword_253D84AC0, OS_LOG_TYPE_ERROR))
        __81__SYMessengerSyncEngine_outputStreamWithMetadata_priority_options_context_error___block_invoke_cold_2(v6);
    }
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1 + 32);
    v26 = 0;
    v9 = objc_msgSend(v7, "removeItemAtURL:error:", v8, &v26);
    v10 = v26;

    if ((v9 & 1) == 0)
    {
      if (_sync_log_facilities_pred != -1)
        _os_once();
      if (os_log_type_enabled((os_log_t)qword_253D84AC0, OS_LOG_TYPE_ERROR))
        __81__SYMessengerSyncEngine_outputStreamWithMetadata_priority_options_context_error___block_invoke_cold_1();
    }

  }
}

- (id)cancelMessagesReturningFailures:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NMSMessageCenter *messageCenter;
  BOOL v13;
  id v14;
  NSObject *v15;
  id v17;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t buf[4];
  uint64_t v24;
  __int16 v25;
  id v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    v5 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEF0]), "initWithCapacity:", objc_msgSend(v4, "count"));
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v17 = v4;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v20;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v20 != v9)
            objc_enumerationMutation(v6);
          v11 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v10);
          messageCenter = self->_messageCenter;
          v18 = 0;
          v13 = -[NMSMessageCenter cancelMessageWithID:error:](messageCenter, "cancelMessageWithID:error:", v11, &v18);
          v14 = v18;
          if (!v13)
          {
            if (_sync_log_facilities_pred != -1)
              _os_once();
            v15 = qword_253D84AC0;
            if (os_log_type_enabled((os_log_t)qword_253D84AC0, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138543618;
              v24 = v11;
              v25 = 2112;
              v26 = v14;
              _os_log_impl(&dword_211704000, v15, OS_LOG_TYPE_INFO, "Failed to cancel outgoing message (%{public}@): %@", buf, 0x16u);
            }
            objc_msgSend(v5, "addObject:", v11);
          }

          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
      }
      while (v8);
    }

    v4 = v17;
  }
  else
  {
    v5 = v4;
  }

  return v5;
}

- (id)stateForLogging
{
  void *v3;

  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "setType:", 1);
  objc_msgSend(v3, "setSuspended:", self->_messageCenter == 0);
  objc_msgSend(v3, "setInSession:", -[SYSyncEngine isInSession](self, "isInSession"));
  objc_msgSend(v3, "setBuffersSessions:", -[SYSyncEngine buffersSessions](self, "buffersSessions"));
  return v3;
}

- (id)_fileTransferHeader
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  SYPeer *v6;
  void *v7;
  void *v8;
  SYPeer *v9;
  SYVectorClock *v10;
  void *v11;
  SYVectorClock *v12;

  -[SYSyncEngine service](self, "service");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[SYPersistentStore sharedPersistentStoreForService:](SYPersistentStore, "sharedPersistentStoreForService:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)objc_opt_new();
  objc_msgSend(v5, "setTimestamp:", CFAbsoluteTimeGetCurrent());
  v6 = [SYPeer alloc];
  objc_msgSend(v2, "peerID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "generationID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[SYPeer initWithPeerID:generation:](v6, "initWithPeerID:generation:", v7, v8);
  objc_msgSend(v5, "setSender:", v9);

  v10 = [SYVectorClock alloc];
  objc_msgSend(v4, "vectorClockJSON");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[SYVectorClock initWithJSONRepresentation:](v10, "initWithJSONRepresentation:", v11);
  objc_msgSend(v5, "setState:", v12);

  objc_msgSend(v5, "setVersion:", 2);
  objc_msgSend(v5, "setSequenceNumber:", 0);

  return v5;
}

- (void)_updateMessageCenterPrefs:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;

  v11 = a3;
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("EnableTransmitWindow"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4 || objc_msgSend(v4, "BOOLValue"))
  {
    -[NMSMessageCenter setEnableTransmissionWindow:](self->_messageCenter, "setEnableTransmissionWindow:", 1);
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("MaxMessagesInFlight"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
      v7 = objc_msgSend(v6, "unsignedIntegerValue");
    else
      v7 = 20;
    -[NMSMessageCenter setMaxMessagesInFlight:](self->_messageCenter, "setMaxMessagesInFlight:", v7);
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("MinMessagesInFlight"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
      v9 = objc_msgSend(v8, "unsignedIntegerValue");
    else
      v9 = 10;
    -[NMSMessageCenter setMinMessagesInFlight:](self->_messageCenter, "setMinMessagesInFlight:", v9);
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("MaxBytesInFlight"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
      v10 = objc_msgSend(v5, "unsignedIntegerValue");
    else
      v10 = 1000000;
    -[NMSMessageCenter setMaxBytesInFlight:](self->_messageCenter, "setMaxBytesInFlight:", v10);
  }

}

- (void)_suspendIncomingMessages
{
  -[NMSMessageCenter suspendIncomingMessages](self->_messageCenter, "suspendIncomingMessages");
}

- (void)_resumeIncomingMessages
{
  -[NMSMessageCenter resumeIncomingMessages](self->_messageCenter, "resumeIncomingMessages");
}

- (void)_hookupMessageHandler
{
  NSObject *v3;
  NMSMessageCenter *v4;
  void *v5;
  void *v6;
  NMSMessageCenter *v7;
  NMSMessageCenter *messageCenter;
  void *v9;
  void *v10;
  void *v11;
  NMSMessageCenter *v12;
  uint64_t v13;
  NMSMessageCenter *v14;
  uint64_t v15;
  NMSMessageCenter *v16;
  uint64_t v17;
  NMSMessageCenter *v18;
  uint64_t v19;
  NMSMessageCenter *v20;
  uint64_t v21;
  NMSMessageCenter *v22;
  uint64_t v23;
  NMSMessageCenter *v24;
  uint64_t v25;
  NMSMessageCenter *v26;
  uint64_t v27;
  NMSMessageCenter *v28;
  uint64_t v29;
  id v30;
  id v31;
  uint64_t v32;
  NMSMessageCenter *v33;
  _QWORD v34[4];
  id v35;
  _QWORD v36[5];
  id v37;
  _QWORD v38[5];
  id v39;
  id buf[2];

  if (_sync_log_facilities_pred != -1)
    _os_once();
  v3 = qword_253D84AC0;
  if (os_log_type_enabled((os_log_t)qword_253D84AC0, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_211704000, v3, OS_LOG_TYPE_DEFAULT, "Creating NanoMessageCenter", (uint8_t *)buf, 2u);
  }
  v4 = [NMSMessageCenter alloc];
  -[SYSyncEngine service](self, "service");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[NMSMessageCenter initWithIDSServiceIdentifier:](v4, "initWithIDSServiceIdentifier:", v6);
  messageCenter = self->_messageCenter;
  self->_messageCenter = v7;

  -[SYSyncEngine transportActivity](self, "transportActivity");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NMSMessageCenter setTransportActivity:](self->_messageCenter, "setTransportActivity:", v9);

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "persistentDomainForName:", CFSTR("com.apple.companionsync"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[SYMessengerSyncEngine _updateMessageCenterPrefs:](self, "_updateMessageCenterPrefs:", v11);
  v12 = self->_messageCenter;
  v13 = objc_opt_class();
  -[NMSMessageCenter mapPBRequest:toResponse:messageID:](v12, "mapPBRequest:toResponse:messageID:", v13, objc_opt_class(), 102);
  v14 = self->_messageCenter;
  v15 = objc_opt_class();
  -[NMSMessageCenter mapPBRequest:toResponse:messageID:](v14, "mapPBRequest:toResponse:messageID:", v15, objc_opt_class(), 101);
  v16 = self->_messageCenter;
  v17 = objc_opt_class();
  -[NMSMessageCenter mapPBRequest:toResponse:messageID:](v16, "mapPBRequest:toResponse:messageID:", v17, objc_opt_class(), 103);
  v18 = self->_messageCenter;
  v19 = objc_opt_class();
  -[NMSMessageCenter mapPBRequest:toResponse:messageID:](v18, "mapPBRequest:toResponse:messageID:", v19, objc_opt_class(), 104);
  v20 = self->_messageCenter;
  v21 = objc_opt_class();
  -[NMSMessageCenter mapPBRequest:toResponse:messageID:](v20, "mapPBRequest:toResponse:messageID:", v21, objc_opt_class(), 105);
  -[NMSMessageCenter mapPBRequest:toResponse:messageID:](self->_messageCenter, "mapPBRequest:toResponse:messageID:", objc_opt_class(), 0, 106);
  -[NMSMessageCenter mapPBRequest:toResponse:messageID:](self->_messageCenter, "mapPBRequest:toResponse:messageID:", objc_opt_class(), 0, 0x7FFFLL);
  v22 = self->_messageCenter;
  v23 = objc_opt_class();
  -[NMSMessageCenter mapPBRequest:toResponse:messageID:](v22, "mapPBRequest:toResponse:messageID:", v23, objc_opt_class(), 1);
  v24 = self->_messageCenter;
  v25 = objc_opt_class();
  -[NMSMessageCenter mapPBRequest:toResponse:messageID:](v24, "mapPBRequest:toResponse:messageID:", v25, objc_opt_class(), 2);
  -[NMSMessageCenter mapPBRequest:toResponse:messageID:](self->_messageCenter, "mapPBRequest:toResponse:messageID:", objc_opt_class(), 0, 3);
  v26 = self->_messageCenter;
  v27 = objc_opt_class();
  -[NMSMessageCenter mapPBRequest:toResponse:messageID:](v26, "mapPBRequest:toResponse:messageID:", v27, objc_opt_class(), 4);
  v28 = self->_messageCenter;
  v29 = objc_opt_class();
  -[NMSMessageCenter mapPBRequest:toResponse:messageID:](v28, "mapPBRequest:toResponse:messageID:", v29, objc_opt_class(), 5);
  -[NMSMessageCenter mapPBRequest:toResponse:messageID:](self->_messageCenter, "mapPBRequest:toResponse:messageID:", objc_opt_class(), 0, 6);
  -[NMSMessageCenter setDelegate:queue:](self->_messageCenter, "setDelegate:queue:", self, self->_idsQueue);
  objc_initWeak(buf, self);
  v30 = objc_alloc_init(MEMORY[0x24BDD1698]);
  v31 = objc_alloc_init(MEMORY[0x24BDD1698]);
  objc_msgSend(v30, "addIndexesInRange:", 1, 6);
  objc_msgSend(v30, "addIndexesInRange:", 101, 6);
  objc_msgSend(v30, "addIndex:", 0x7FFFLL);
  objc_msgSend(v31, "addIndex:", 1);
  objc_msgSend(v31, "addIndex:", 2);
  objc_msgSend(v31, "addIndex:", 4);
  objc_msgSend(v31, "addIndex:", 5);
  objc_msgSend(v31, "addIndexesInRange:", 101, 6);
  objc_msgSend(v31, "removeIndex:", 106);
  v32 = MEMORY[0x24BDAC760];
  v38[0] = MEMORY[0x24BDAC760];
  v38[1] = 3221225472;
  v38[2] = __46__SYMessengerSyncEngine__hookupMessageHandler__block_invoke;
  v38[3] = &unk_24CC66A78;
  v38[4] = self;
  objc_copyWeak(&v39, buf);
  objc_msgSend(v30, "enumerateIndexesUsingBlock:", v38);
  v36[0] = v32;
  v36[1] = 3221225472;
  v36[2] = __46__SYMessengerSyncEngine__hookupMessageHandler__block_invoke_3;
  v36[3] = &unk_24CC66A78;
  v36[4] = self;
  objc_copyWeak(&v37, buf);
  objc_msgSend(v31, "enumerateIndexesUsingBlock:", v36);
  v33 = self->_messageCenter;
  v34[0] = v32;
  v34[1] = 3221225472;
  v34[2] = __46__SYMessengerSyncEngine__hookupMessageHandler__block_invoke_76;
  v34[3] = &unk_24CC65888;
  objc_copyWeak(&v35, buf);
  -[NMSMessageCenter addRequestHandlerForMessageID:usingBlock:](v33, "addRequestHandlerForMessageID:usingBlock:", 106, v34);
  objc_destroyWeak(&v35);
  objc_destroyWeak(&v37);
  objc_destroyWeak(&v39);

  objc_destroyWeak(buf);
}

void __46__SYMessengerSyncEngine__hookupMessageHandler__block_invoke(uint64_t a1, unsigned __int16 a2)
{
  void *v4;
  uint64_t v5;
  id *v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;
  unsigned __int16 v12;

  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
  v5 = MEMORY[0x24BDAC760];
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __46__SYMessengerSyncEngine__hookupMessageHandler__block_invoke_2;
  v10[3] = &unk_24CC65900;
  v6 = (id *)(a1 + 40);
  objc_copyWeak(&v11, (id *)(a1 + 40));
  v12 = a2;
  objc_msgSend(v4, "addErrorHandlerForMessageID:usingBlock:", a2, v10);
  v7 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
  v8[0] = v5;
  v8[1] = 3221225472;
  v8[2] = __46__SYMessengerSyncEngine__hookupMessageHandler__block_invoke_65;
  v8[3] = &unk_24CC65888;
  objc_copyWeak(&v9, v6);
  objc_msgSend(v7, "addRequestHandlerForMessageID:usingBlock:", a2, v8);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&v11);
}

void __46__SYMessengerSyncEngine__hookupMessageHandler__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (_sync_log_facilities_pred != -1)
      _os_once();
    v5 = qword_253D84AC0;
    if (os_log_type_enabled((os_log_t)qword_253D84AC0, OS_LOG_TYPE_ERROR))
      __46__SYMessengerSyncEngine__hookupMessageHandler__block_invoke_2_cold_1(a1, (uint64_t)v3, v5);
    objc_msgSend(WeakRetained, "_handleError:forMessageID:", v3, *(unsigned __int16 *)(a1 + 40));
  }

}

void __46__SYMessengerSyncEngine__hookupMessageHandler__block_invoke_65(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double Current;
  double v12;
  double v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  NSObject *v18;
  id v19;
  id v20;
  NSObject *v21;
  int v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(uint64_t);
  void *v27;
  id v28;
  id v29;
  id v30;
  id v31;
  uint8_t buf[4];
  int v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  double v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "service");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[SYStatisticStore sharedInstance](SYStatisticStore, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "name");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "recordIncomingMessage:forService:", v3, v8);

    objc_msgSend(v5, "_getRequestHeader:", v3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "copy");

    if (_sync_log_facilities_pred != -1)
      _os_once();
    if (os_log_type_enabled((os_log_t)qword_253D84AF0, OS_LOG_TYPE_DEBUG))
    {
      Current = CFAbsoluteTimeGetCurrent();
      objc_msgSend(v10, "timestamp");
      v13 = v12;
      if (_sync_log_facilities_pred != -1)
        _os_once();
      v14 = (void *)qword_253D84AF0;
      if (os_log_type_enabled((os_log_t)qword_253D84AF0, OS_LOG_TYPE_DEBUG))
      {
        v21 = v14;
        v22 = objc_msgSend(v3, "messageID");
        objc_msgSend(v3, "idsIdentifier");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 67109634;
        v33 = v22;
        v34 = 2114;
        v35 = v23;
        v36 = 2048;
        v37 = Current - v13;
        _os_log_debug_impl(&dword_211704000, v21, OS_LOG_TYPE_DEBUG, "Incoming request %{companionsync:SYMessageID}hu: %{public}@. Transit time = %.02f seconds", buf, 0x1Cu);

      }
    }
    objc_msgSend(v3, "idsIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v5, "_checkMessageHeader:messageID:", v10, v15);

    if ((v16 & 1) != 0)
    {
      objc_msgSend(v5, "_suspendIncomingMessages");
      objc_msgSend(v3, "pbRequest");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v3, "expectsResponse"))
        objc_msgSend(v3, "configureResponse");
      objc_msgSend(v5, "queue");
      v18 = objc_claimAutoreleasedReturnValue();
      v24 = MEMORY[0x24BDAC760];
      v25 = 3221225472;
      v26 = __46__SYMessengerSyncEngine__hookupMessageHandler__block_invoke_66;
      v27 = &unk_24CC65C10;
      v19 = v5;
      v28 = v19;
      v29 = v17;
      v30 = v3;
      v31 = v6;
      v20 = v17;
      dispatch_async(v18, &v24);

      objc_msgSend(v19, "_recordLastSeqNo:", v10, v24, v25, v26, v27);
    }
    else
    {
      objc_msgSend(v3, "setExpectsResponse:", 0);
    }

  }
}

void __46__SYMessengerSyncEngine__hookupMessageHandler__block_invoke_66(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  id v7;
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "responder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 40);
  v4 = objc_msgSend(*(id *)(a1 + 48), "messageID");
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __46__SYMessengerSyncEngine__hookupMessageHandler__block_invoke_2_67;
  v5[3] = &unk_24CC66A50;
  v6 = *(id *)(a1 + 48);
  v7 = *(id *)(a1 + 32);
  v8 = *(id *)(a1 + 56);
  objc_msgSend(v2, "handleSyncRequest:ofType:response:", v3, v4, v5);

}

void __46__SYMessengerSyncEngine__hookupMessageHandler__block_invoke_2_67(id *a1, void *a2, void *a3)
{
  id v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a2;
  v5 = a3;
  v6 = objc_msgSend(a1[4], "expectsResponse");
  if (v15 && v6)
  {
    objc_msgSend(a1[4], "response");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setPbResponse:", v15);
    objc_msgSend(v7, "setPersistentUserInfo:", v5);
    objc_msgSend(a1[5], "customIDSOptions");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[5], "responder");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "extraTransportOptions");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    IDSOptionsFromSYServiceOptions(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    CoalesceOptionDictionaries(v8, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setExtraIDSOptions:", v12);

    +[SYStatisticStore sharedInstance](SYStatisticStore, "sharedInstance");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[6], "name");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "recordOutgoingMessage:forService:", v7, v14);

    objc_msgSend(v7, "send");
  }
  objc_msgSend(a1[5], "_resumeIncomingMessages");

}

void __46__SYMessengerSyncEngine__hookupMessageHandler__block_invoke_3(uint64_t a1, unsigned __int16 a2)
{
  void *v3;
  _QWORD v4[4];
  id v5;

  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __46__SYMessengerSyncEngine__hookupMessageHandler__block_invoke_4;
  v4[3] = &unk_24CC658B0;
  objc_copyWeak(&v5, (id *)(a1 + 40));
  objc_msgSend(v3, "addResponseHandler:usingBlock:", a2, v4);
  objc_destroyWeak(&v5);
}

void __46__SYMessengerSyncEngine__hookupMessageHandler__block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double Current;
  double v11;
  double v12;
  void *v13;
  void *v14;
  int v15;
  NSObject *v16;
  id v17;
  NSObject *v18;
  int v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(uint64_t);
  void *v25;
  id v26;
  id v27;
  uint8_t buf[4];
  int v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  double v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "service");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[SYStatisticStore sharedInstance](SYStatisticStore, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "name");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "recordIncomingMessage:forService:", v3, v8);

    objc_msgSend(v5, "_getResponseHeader:", v3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (_sync_log_facilities_pred != -1)
      _os_once();
    if (os_log_type_enabled((os_log_t)qword_253D84AF0, OS_LOG_TYPE_DEBUG))
    {
      Current = CFAbsoluteTimeGetCurrent();
      objc_msgSend(v9, "timestamp");
      v12 = v11;
      if (_sync_log_facilities_pred != -1)
        _os_once();
      v13 = (void *)qword_253D84AF0;
      if (os_log_type_enabled((os_log_t)qword_253D84AF0, OS_LOG_TYPE_DEBUG))
      {
        v18 = v13;
        v19 = objc_msgSend(v3, "messageID");
        objc_msgSend(v3, "idsIdentifier");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "requestIDSIdentifier");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 67109890;
        v29 = v19;
        v30 = 2114;
        v31 = v20;
        v32 = 2114;
        v33 = v21;
        v34 = 2048;
        v35 = Current - v12;
        _os_log_debug_impl(&dword_211704000, v18, OS_LOG_TYPE_DEBUG, "Incoming response to %{companionsync:SYMessageID}hu: %{public}@, responding to %{public}@. Transit time = %.02f seconds", buf, 0x26u);

      }
    }
    objc_msgSend(v3, "idsIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v5, "_checkMessageHeader:messageID:", v9, v14);

    if (v15)
    {
      objc_msgSend(v5, "_suspendIncomingMessages");
      objc_msgSend(v5, "queue");
      v16 = objc_claimAutoreleasedReturnValue();
      v22 = MEMORY[0x24BDAC760];
      v23 = 3221225472;
      v24 = __46__SYMessengerSyncEngine__hookupMessageHandler__block_invoke_72;
      v25 = &unk_24CC652B8;
      v17 = v5;
      v26 = v17;
      v27 = v3;
      dispatch_async(v16, &v22);

      objc_msgSend(v17, "_recordLastSeqNo:", v9, v22, v23, v24, v25);
    }

  }
}

void __46__SYMessengerSyncEngine__hookupMessageHandler__block_invoke_72(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "responder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "pbResponse");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(*(id *)(a1 + 40), "messageID");
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __46__SYMessengerSyncEngine__hookupMessageHandler__block_invoke_2_73;
  v5[3] = &unk_24CC65290;
  v6 = *(id *)(a1 + 32);
  objc_msgSend(v2, "handleSyncResponse:ofType:completion:", v3, v4, v5);

}

void __46__SYMessengerSyncEngine__hookupMessageHandler__block_invoke_2_73(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if ((a2 & 1) == 0)
  {
    if (_sync_log_facilities_pred != -1)
      _os_once();
    v6 = qword_253D84AC0;
    if (os_log_type_enabled((os_log_t)qword_253D84AC0, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 138412290;
      v8 = v5;
      _os_log_impl(&dword_211704000, v6, OS_LOG_TYPE_DEFAULT, "Response handler failure reported: %@", (uint8_t *)&v7, 0xCu);
    }
  }
  objc_msgSend(*(id *)(a1 + 32), "_resumeIncomingMessages");

}

void __46__SYMessengerSyncEngine__hookupMessageHandler__block_invoke_76(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  NSObject *v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "service");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "pbRequest");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[SYStatisticStore sharedInstance](SYStatisticStore, "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "name");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "recordIncomingMessage:forService:", v3, v9);

    objc_msgSend(v7, "payload");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
      objc_msgSend(v3, "data");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "data");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "length");

      if (v13 >= 0x14)
        v14 = 20;
      else
        v14 = v13;
      objc_msgSend(v11, "subdataWithRange:", 0, v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (_sync_log_facilities_pred != -1)
        _os_once();
      v16 = (void *)qword_253D84AC0;
      if (os_log_type_enabled((os_log_t)qword_253D84AC0, (os_log_type_t)0x90u))
        __46__SYMessengerSyncEngine__hookupMessageHandler__block_invoke_76_cold_1(v16, v3, (uint64_t)v15);

    }
    objc_msgSend(v5, "_suspendIncomingMessages");
    objc_msgSend(v5, "queue");
    v17 = objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __46__SYMessengerSyncEngine__hookupMessageHandler__block_invoke_77;
    v19[3] = &unk_24CC652B8;
    v20 = v5;
    v21 = v7;
    v18 = v7;
    dispatch_async(v17, v19);

  }
}

void __46__SYMessengerSyncEngine__hookupMessageHandler__block_invoke_77(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[4];
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "responder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "payload");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __46__SYMessengerSyncEngine__hookupMessageHandler__block_invoke_2_78;
  v4[3] = &unk_24CC65290;
  v5 = *(id *)(a1 + 32);
  objc_msgSend(v2, "handleOutOfBandData:completion:", v3, v4);

}

void __46__SYMessengerSyncEngine__hookupMessageHandler__block_invoke_2_78(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if ((a2 & 1) == 0)
  {
    if (_sync_log_facilities_pred != -1)
      _os_once();
    v6 = qword_253D84AC0;
    if (os_log_type_enabled((os_log_t)qword_253D84AC0, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 138412290;
      v8 = v5;
      _os_log_impl(&dword_211704000, v6, OS_LOG_TYPE_DEFAULT, "Failure dealing with OOB data: %@", (uint8_t *)&v7, 0xCu);
    }
  }
  objc_msgSend(*(id *)(a1 + 32), "_resumeIncomingMessages");

}

- (id)_getRequestHeader:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "pbRequest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "header");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_getResponseHeader:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "pbResponse");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "header");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)_checkMessageHeader:(id)a3 messageID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;

  v6 = a4;
  v7 = a3;
  -[SYSyncEngine responder](self, "responder");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "willAcceptMessageWithHeader:messageID:", v7, v6);

  return v9;
}

- (void)_recordLastSeqNo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  char v11;
  id v12;
  void *v13;
  id v14;

  v4 = a3;
  -[SYSyncEngine service](self, "service");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[SYPersistentStore sharedPersistentStoreForService:](SYPersistentStore, "sharedPersistentStoreForService:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v4, "sequenceNumber");
  objc_msgSend(v4, "sender");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "peerID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  v11 = objc_msgSend(v7, "setLastSequenceNumber:fromPeer:error:", v8, v10, &v14);
  v12 = v14;

  if ((v11 & 1) == 0)
  {
    if (_sync_log_facilities_pred != -1)
      _os_once();
    v13 = (void *)qword_253D84AC0;
    if (os_log_type_enabled((os_log_t)qword_253D84AC0, OS_LOG_TYPE_ERROR))
      -[SYMessengerSyncEngine _recordLastSeqNo:].cold.1(v13);
  }

}

- (void)_handleError:(id)a3 forMessageID:(unsigned __int16)a4
{
  void *v5;
  void *v6;
  int v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;

  v12 = a3;
  objc_msgSend(v12, "idsIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "domain");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("NMSErrorDomain"));

  if (v7 && objc_msgSend(v12, "code") == 7)
  {
    v8 = objc_alloc(MEMORY[0x24BDD1540]);
    objc_msgSend(v12, "userInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "initWithSYError:userInfo:", 2019, v9);

    v12 = (id)v10;
  }
  -[SYSyncEngine responder](self, "responder");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "handleSyncError:forMessageWithIdentifier:", v12, v5);

}

- (id)_wrapMessage:(id)a3 ofType:(unsigned __int16)a4 userInfo:(id)a5
{
  uint64_t v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  double v16;
  NSString *sessionDeviceID;
  void *v18;
  SYDevice *activeDevice;
  void *v20;
  void *v21;
  double v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;

  v5 = a4;
  v8 = a5;
  v9 = a3;
  -[SYSyncEngine service](self, "service");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[NMSOutgoingRequest requestWithMessageID:](NMSOutgoingRequest, "requestWithMessageID:", v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setPbRequest:", v9);

  objc_msgSend(v11, "setPersistentUserInfo:", v8);
  v12 = objc_msgSend(v10, "priority");
  if (v12 == 20)
    v13 = 2;
  else
    v13 = v12 != 0;
  objc_msgSend(v11, "setPriority:", v13);
  objc_msgSend(v11, "setShouldEncrypt:", 1);
  objc_msgSend(v10, "currentSession");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v14)
  {
    objc_msgSend(v14, "perMessageTimeout");
    objc_msgSend(v11, "setSendTimeout:");
    objc_msgSend(v15, "perMessageTimeout");
    objc_msgSend(v11, "setResponseTimeout:", v16 + v16);
    if (self->_sessionDeviceID)
      sessionDeviceID = self->_sessionDeviceID;
    else
      sessionDeviceID = (NSString *)*MEMORY[0x24BE4FD60];
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", sessionDeviceID);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setTargetDeviceIDs:", v18);
  }
  else
  {
    activeDevice = self->_activeDevice;
    -[NMSMessageCenter service](self->_messageCenter, "service");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "devices");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[SYDevice findMatchingIDSDeviceFromList:](activeDevice, "findMatchingIDSDeviceFromList:", v21);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "defaultMessageTimeout");
    objc_msgSend(v11, "setSendTimeout:");
    objc_msgSend(v10, "defaultMessageTimeout");
    objc_msgSend(v11, "setResponseTimeout:", v22 + v22);
    v23 = (void *)MEMORY[0x24BDBCF20];
    -[NMSMessageCenter deviceIDFromDevice:](self->_messageCenter, "deviceIDFromDevice:", v18);
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = (void *)v24;
    if (v24)
      v26 = v24;
    else
      v26 = *MEMORY[0x24BE4FD60];
    objc_msgSend(v23, "setWithObject:", v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setTargetDeviceIDs:", v27);

  }
  return v11;
}

- (void)messageCenter:(id)a3 didReceiveUnknownRequest:(id)a4
{
  id v5;
  id v6;
  void *v7;

  v5 = a3;
  v6 = a4;
  if (_sync_log_facilities_pred != -1)
    _os_once();
  v7 = (void *)qword_253D84AC0;
  if (os_log_type_enabled((os_log_t)qword_253D84AC0, (os_log_type_t)0x90u))
    -[SYMessengerSyncEngine messageCenter:didReceiveUnknownRequest:].cold.1(v7);

}

- (void)messageCenter:(id)a3 didReceiveIncomingFileTransfer:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = a4;
  objc_msgSend(v5, "fileURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "metadata");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (_sync_log_facilities_pred != -1)
    _os_once();
  v8 = (void *)qword_253D84AF0;
  if (os_log_type_enabled((os_log_t)qword_253D84AF0, OS_LOG_TYPE_DEBUG))
    -[SYMessengerSyncEngine messageCenter:didReceiveIncomingFileTransfer:].cold.1(v8);
  -[SYSyncEngine responder](self, "responder");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "handleFileTransfer:metadata:completion:", v6, v7, &__block_literal_global_10);

}

void __70__SYMessengerSyncEngine_messageCenter_didReceiveIncomingFileTransfer___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v4;

  v4 = a3;
  if ((a2 & 1) == 0)
  {
    if (_sync_log_facilities_pred != -1)
      _os_once();
    if (os_log_type_enabled((os_log_t)qword_253D84AC0, OS_LOG_TYPE_ERROR))
      __70__SYMessengerSyncEngine_messageCenter_didReceiveIncomingFileTransfer___block_invoke_cold_1();
  }

}

- (void)messageCenter:(id)a3 didResolveIDSIdentifierForRequest:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void (**v12)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v13;

  v5 = a4;
  +[SYStatisticStore sharedInstance](SYStatisticStore, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "idsIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "assignIdentifier:toOutgoingMessage:", v7, v5);

  -[SYSyncEngine responder](self, "responder");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "idsIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "persistentUserInfo");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "enqueuedMessageWithID:context:", v9, v10);

  if (_sync_log_facilities_pred != -1)
    _os_once();
  v11 = (void *)qword_253D84AF0;
  if (os_log_type_enabled((os_log_t)qword_253D84AF0, OS_LOG_TYPE_DEBUG))
    -[SYMessengerSyncEngine messageCenter:didResolveIDSIdentifierForRequest:].cold.1(v11, v5);
  dispatch_semaphore_wait((dispatch_semaphore_t)self->_lookupLock, 0xFFFFFFFFFFFFFFFFLL);
  -[NSMapTable objectForKey:](self->_callbackLookup, "objectForKey:", v5);
  v12 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    -[NSMapTable removeObjectForKey:](self->_callbackLookup, "removeObjectForKey:", v5);
    dispatch_semaphore_signal((dispatch_semaphore_t)self->_lookupLock);
    objc_msgSend(v5, "idsIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, uint64_t, void *, _QWORD))v12)[2](v12, 1, v13, 0);

  }
  else
  {
    dispatch_semaphore_signal((dispatch_semaphore_t)self->_lookupLock);
  }

}

- (void)messageCenter:(id)a3 didResolveIDSIdentifier:(id)a4 forResponse:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v7 = a4;
  v8 = a5;
  objc_msgSend(v8, "request");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (_sync_log_facilities_pred != -1)
    _os_once();
  v10 = (void *)qword_253D84AF0;
  if (os_log_type_enabled((os_log_t)qword_253D84AF0, OS_LOG_TYPE_DEBUG))
    -[SYMessengerSyncEngine messageCenter:didResolveIDSIdentifier:forResponse:].cold.1(v10, v9, (uint64_t)v7);
  +[SYStatisticStore sharedInstance](SYStatisticStore, "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "assignIdentifier:toOutgoingMessage:", v7, v8);

  -[SYSyncEngine responder](self, "responder");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "persistentUserInfo");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "enqueuedMessageWithID:context:", v7, v13);
}

- (void)messageCenter:(id)a3 didResolveIDSIdentifier:(id)a4 forFileTransfer:(id)a5
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a5;
  +[SYStatisticStore sharedInstance](SYStatisticStore, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "assignIdentifier:toOutgoingMessage:", v6, v7);

  if (_sync_log_facilities_pred != -1)
    _os_once();
  if (os_log_type_enabled((os_log_t)qword_253D84AF0, OS_LOG_TYPE_DEBUG))
    -[SYMessengerSyncEngine messageCenter:didResolveIDSIdentifier:forFileTransfer:].cold.1();

}

- (void)messageCenter:(id)a3 didSuccessfullySendRequestWithIdentifier:(id)a4 userInfo:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  id v14;
  id v15;
  _QWORD block[5];
  id v17;
  id v18;
  uint8_t buf[4];
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (_sync_log_facilities_pred != -1)
    _os_once();
  if (os_log_type_enabled((os_log_t)qword_253D84AF0, OS_LOG_TYPE_DEBUG))
    -[SYMessengerSyncEngine messageCenter:didSuccessfullySendRequestWithIdentifier:userInfo:].cold.1();
  if (_sync_log_facilities_pred != -1)
    _os_once();
  v11 = qword_253D84AC0;
  if (os_log_type_enabled((os_log_t)qword_253D84AC0, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v20 = v9;
    _os_log_impl(&dword_211704000, v11, OS_LOG_TYPE_DEFAULT, "dataIdentifier: %{public}@ didSendWithSuccess: YES error: nil", buf, 0xCu);
  }
  +[SYStatisticStore sharedInstance](SYStatisticStore, "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "confirmDeliveryOfOutgoingMessage:", v9);

  -[SYSyncEngine queue](self, "queue");
  v13 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __89__SYMessengerSyncEngine_messageCenter_didSuccessfullySendRequestWithIdentifier_userInfo___block_invoke;
  block[3] = &unk_24CC65560;
  block[4] = self;
  v17 = v9;
  v18 = v10;
  v14 = v10;
  v15 = v9;
  dispatch_async(v13, block);

}

void __89__SYMessengerSyncEngine_messageCenter_didSuccessfullySendRequestWithIdentifier_userInfo___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "responder");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sentMessageWithID:context:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (void)messageCenter:(id)a3 didSuccessfullyDeliverRequestWithIdentifier:(id)a4 userInfo:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  id v14;
  id v15;
  _QWORD block[5];
  id v17;
  id v18;
  uint8_t buf[4];
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (_sync_log_facilities_pred != -1)
    _os_once();
  if (os_log_type_enabled((os_log_t)qword_253D84AF0, OS_LOG_TYPE_DEBUG))
    -[SYMessengerSyncEngine messageCenter:didSuccessfullyDeliverRequestWithIdentifier:userInfo:].cold.1();
  if (_sync_log_facilities_pred != -1)
    _os_once();
  v11 = qword_253D84AC0;
  if (os_log_type_enabled((os_log_t)qword_253D84AC0, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v20 = v9;
    _os_log_impl(&dword_211704000, v11, OS_LOG_TYPE_DEFAULT, "Remote delivery confirmation for %{public}@", buf, 0xCu);
  }
  +[SYStatisticStore sharedInstance](SYStatisticStore, "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "confirmDeliveryOfOutgoingMessage:", v9);

  -[SYSyncEngine queue](self, "queue");
  v13 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __92__SYMessengerSyncEngine_messageCenter_didSuccessfullyDeliverRequestWithIdentifier_userInfo___block_invoke;
  block[3] = &unk_24CC65560;
  block[4] = self;
  v17 = v9;
  v18 = v10;
  v14 = v10;
  v15 = v9;
  dispatch_async(v13, block);

}

void __92__SYMessengerSyncEngine_messageCenter_didSuccessfullyDeliverRequestWithIdentifier_userInfo___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "responder");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "deliveredMessageWithID:context:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (void)messageCenter:(id)a3 failedToSendMessageWithIdentifier:(id)a4 error:(id)a5 userInfo:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  id v19;
  id v20;
  _QWORD block[5];
  id v22;
  id v23;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (_sync_log_facilities_pred != -1)
    _os_once();
  if (os_log_type_enabled((os_log_t)qword_253D84AC0, OS_LOG_TYPE_ERROR))
    -[SYMessengerSyncEngine messageCenter:failedToSendMessageWithIdentifier:error:userInfo:].cold.2();
  if (_sync_log_facilities_pred != -1)
    _os_once();
  v14 = (void *)qword_253D84AF0;
  if (os_log_type_enabled((os_log_t)qword_253D84AF0, OS_LOG_TYPE_DEBUG))
    -[SYMessengerSyncEngine messageCenter:failedToSendMessageWithIdentifier:error:userInfo:].cold.1((uint64_t)v11, v14, v12);
  +[SYStatisticStore sharedInstance](SYStatisticStore, "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[SYSyncEngine service](self, "service");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "name");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "updateOutgoingMessageWithIdentifier:forService:sentSuccessfully:sendError:", v11, v17, 0, v12);

  -[SYSyncEngine queue](self, "queue");
  v18 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __88__SYMessengerSyncEngine_messageCenter_failedToSendMessageWithIdentifier_error_userInfo___block_invoke;
  block[3] = &unk_24CC65560;
  block[4] = self;
  v22 = v12;
  v23 = v11;
  v19 = v11;
  v20 = v12;
  dispatch_async(v18, block);

}

void __88__SYMessengerSyncEngine_messageCenter_failedToSendMessageWithIdentifier_error_userInfo___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "responder");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleSyncError:forMessageWithIdentifier:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (void)messageCenter:(id)a3 activeDeviceChanged:(id)a4 acknowledgement:(id)a5
{
  id v8;
  id v9;
  void (**v10)(_QWORD);
  NSObject *v11;
  SYDevice *activeDevice;
  SYDevice *v13;
  SYDevice *v14;
  int v15;
  SYDevice *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(_QWORD))a5;
  if (_sync_log_facilities_pred != -1)
    _os_once();
  v11 = qword_253D84AC0;
  if (os_log_type_enabled((os_log_t)qword_253D84AC0, OS_LOG_TYPE_DEFAULT))
  {
    activeDevice = self->_activeDevice;
    v15 = 138412546;
    v16 = activeDevice;
    v17 = 2112;
    v18 = v9;
    _os_log_impl(&dword_211704000, v11, OS_LOG_TYPE_DEFAULT, "Active IDS device changed. Old = %@, new = %@", (uint8_t *)&v15, 0x16u);
  }
  +[SYDevice deviceForIDSDevice:](SYDevice, "deviceForIDSDevice:", v9);
  v13 = (SYDevice *)objc_claimAutoreleasedReturnValue();
  v14 = self->_activeDevice;
  self->_activeDevice = v13;

  v10[2](v10);
}

- (void)messageCenter:(id)a3 nearbyDevicesChanged:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  const char *v11;
  void *v12;
  os_activity_scope_state_s v13;
  uint8_t buf[4];
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[SYSyncEngine transportActivity](self, "transportActivity", 0, 0);
  v8 = objc_claimAutoreleasedReturnValue();
  os_activity_scope_enter(v8, &v13);

  -[SYDevice findMatchingIDSDeviceFromList:](self->_activeDevice, "findMatchingIDSDeviceFromList:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!-[SYDevice hasCachedNearby](self->_activeDevice, "hasCachedNearby")
    || (((v9 != 0) ^ -[SYDevice cachedIsNearby](self->_activeDevice, "cachedIsNearby")) & 1) != 0)
  {
    -[SYDevice setCachedIsNearby:](self->_activeDevice, "setCachedIsNearby:", v9 != 0);
    -[SYDevice setHasCachedNearby:](self->_activeDevice, "setHasCachedNearby:", 1);
    if (_sync_log_facilities_pred != -1)
      _os_once();
    v10 = qword_253D84AC0;
    if (os_log_type_enabled((os_log_t)qword_253D84AC0, OS_LOG_TYPE_DEFAULT))
    {
      v11 = "left";
      if (v9)
        v11 = "entered";
      *(_DWORD *)buf = 136315138;
      v15 = v11;
      _os_log_impl(&dword_211704000, v10, OS_LOG_TYPE_DEFAULT, "Target device %s proximity", buf, 0xCu);
    }
    -[SYSyncEngine responder](self, "responder");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "currentDeviceProximityChanged:", v9 != 0);

  }
  os_activity_scope_leave(&v13);

}

- (void)messageCenter:(id)a3 connectedDevicesChanged:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  const char *v11;
  void *v12;
  uint8_t v13[16];
  os_activity_scope_state_s state;

  v6 = a3;
  v7 = a4;
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  -[SYSyncEngine transportActivity](self, "transportActivity");
  v8 = objc_claimAutoreleasedReturnValue();
  os_activity_scope_enter(v8, &state);

  -[SYDevice findMatchingIDSDeviceFromList:](self->_activeDevice, "findMatchingIDSDeviceFromList:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!-[SYDevice hasCachedConnected](self->_activeDevice, "hasCachedConnected")
    || (((v9 != 0) ^ -[SYDevice cachedConnected](self->_activeDevice, "cachedConnected")) & 1) != 0)
  {
    -[SYDevice setCachedConnected:](self->_activeDevice, "setCachedConnected:", v9 != 0);
    -[SYDevice setHasCachedConnected:](self->_activeDevice, "setHasCachedConnected:", 1);
    if (v9)
    {
      if (_sync_log_facilities_pred != -1)
        _os_once();
      v10 = qword_253D84AC0;
      if (!os_log_type_enabled((os_log_t)qword_253D84AC0, OS_LOG_TYPE_DEFAULT))
        goto LABEL_13;
      *(_WORD *)v13 = 0;
      v11 = "Target device is connected";
    }
    else
    {
      if (_sync_log_facilities_pred != -1)
        _os_once();
      v10 = qword_253D84AC0;
      if (!os_log_type_enabled((os_log_t)qword_253D84AC0, OS_LOG_TYPE_DEFAULT))
        goto LABEL_13;
      *(_WORD *)v13 = 0;
      v11 = "Target device is NOT connected";
    }
    _os_log_impl(&dword_211704000, v10, OS_LOG_TYPE_DEFAULT, v11, v13, 2u);
LABEL_13:
    -[SYSyncEngine responder](self, "responder", *(_QWORD *)v13);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "currentDeviceConnectionChanged:", v9 != 0);

  }
  os_activity_scope_leave(&state);

}

- (NSDictionary)customIDSOptions
{
  return self->_customIDSOptions;
}

- (void)setCustomIDSOptions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (OS_dispatch_queue)idsQueue
{
  return self->_idsQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_idsQueue, 0);
  objc_storeStrong((id *)&self->_customIDSOptions, 0);
  objc_storeStrong((id *)&self->_sessionDeviceID, 0);
  objc_storeStrong((id *)&self->_activeDevice, 0);
  objc_storeStrong((id *)&self->_callbackLookup, 0);
  objc_storeStrong((id *)&self->_requestLookup, 0);
  objc_storeStrong((id *)&self->_lookupLock, 0);
  objc_storeStrong((id *)&self->_messageCenter, 0);
}

- (void)enqueueSyncRequest:(void *)a1 withMessageID:priority:options:userContext:callback:.cold.1(void *a1)
{
  NSObject *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint8_t v5[24];

  OUTLINED_FUNCTION_4_1(a1);
  v2 = (void *)OUTLINED_FUNCTION_13();
  _SYObfuscate(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_1(&dword_211704000, v1, v4, "Failed to wrap message: %{public}@", v5);

  OUTLINED_FUNCTION_4_0();
}

- (void)enqueueSyncRequest:withMessageID:priority:options:userContext:callback:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_9(&dword_211704000, v0, v1, "Coalesced IDS options: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)enqueueSyncRequest:withMessageID:priority:options:userContext:callback:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_9(&dword_211704000, v0, v1, "Input request options: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __81__SYMessengerSyncEngine_outputStreamWithMetadata_priority_options_context_error___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_1(&dword_211704000, v0, v1, "Failed to delete unused file-transfer file: %{public}@", v2);
  OUTLINED_FUNCTION_2();
}

void __81__SYMessengerSyncEngine_outputStreamWithMetadata_priority_options_context_error___block_invoke_cold_2(void *a1)
{
  NSObject *v1;
  void *v2;
  uint64_t v3;
  uint8_t v4[24];

  OUTLINED_FUNCTION_4_1(a1);
  objc_msgSend((id)OUTLINED_FUNCTION_13(), "streamError");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_1(&dword_211704000, v1, v3, "Error writing to URL for file transfer: %{public}@", v4);

  OUTLINED_FUNCTION_4_0();
}

void __46__SYMessengerSyncEngine__hookupMessageHandler__block_invoke_2_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  _DWORD v4[2];
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = *(unsigned __int16 *)(a1 + 40);
  v4[0] = 67109378;
  v4[1] = v3;
  v5 = 2114;
  v6 = a2;
  _os_log_error_impl(&dword_211704000, log, OS_LOG_TYPE_ERROR, "Error sending message with ID %{companionsync:SYMessageID}hu: %{public}@", (uint8_t *)v4, 0x12u);
  OUTLINED_FUNCTION_2();
}

void __46__SYMessengerSyncEngine__hookupMessageHandler__block_invoke_76_cold_1(void *a1, void *a2, uint64_t a3)
{
  NSObject *v5;
  void *v6;
  uint8_t v7[14];
  uint64_t v8;

  v5 = OUTLINED_FUNCTION_4_1(a1);
  objc_msgSend(a2, "data");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "length");
  OUTLINED_FUNCTION_8_0();
  v8 = a3;
  _os_log_error_impl(&dword_211704000, v5, (os_log_type_t)0x90u, "Out of band message with nil payload found! Request data has size %lu. First 20 bytes = %{public}@", v7, 0x16u);

  OUTLINED_FUNCTION_12();
}

- (void)_recordLastSeqNo:(void *)a1 .cold.1(void *a1)
{
  NSObject *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint8_t v5[24];

  OUTLINED_FUNCTION_4_1(a1);
  v2 = (void *)OUTLINED_FUNCTION_13();
  _SYObfuscate(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_1(&dword_211704000, v1, v4, "Failed to store incoming sequence number: %{public}@", v5);

  OUTLINED_FUNCTION_4_0();
}

- (void)messageCenter:(void *)a1 didReceiveUnknownRequest:.cold.1(void *a1)
{
  NSObject *v1;
  void *v2;
  void *v3;
  uint8_t v4[24];

  OUTLINED_FUNCTION_4_1(a1);
  v2 = (void *)OUTLINED_FUNCTION_13();
  _SYObfuscate(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_10();
  _os_log_error_impl(&dword_211704000, v1, (os_log_type_t)0x90u, "Received an unknown message: %{public}@", v4, 0xCu);

  OUTLINED_FUNCTION_4_0();
}

- (void)messageCenter:(void *)a1 didReceiveIncomingFileTransfer:.cold.1(void *a1)
{
  NSObject *v1;
  void *v2;
  uint8_t v3[24];

  OUTLINED_FUNCTION_4_1(a1);
  objc_msgSend((id)OUTLINED_FUNCTION_13(), "idsIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_10();
  _os_log_debug_impl(&dword_211704000, v1, OS_LOG_TYPE_DEBUG, "Incoming file: %{public}@", v3, 0xCu);

  OUTLINED_FUNCTION_4_0();
}

void __70__SYMessengerSyncEngine_messageCenter_didReceiveIncomingFileTransfer___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_1(&dword_211704000, v0, v1, "Failed to process incoming file transfer: %{public}@", v2);
  OUTLINED_FUNCTION_2();
}

- (void)messageCenter:(void *)a1 didResolveIDSIdentifierForRequest:(void *)a2 .cold.1(void *a1, void *a2)
{
  NSObject *v2;
  int v4;
  void *v5;
  _DWORD v6[2];
  __int16 v7;
  void *v8;

  OUTLINED_FUNCTION_4_1(a1);
  v4 = objc_msgSend((id)OUTLINED_FUNCTION_13(), "messageID");
  objc_msgSend(a2, "idsIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = 67109378;
  v6[1] = v4;
  v7 = 2114;
  v8 = v5;
  _os_log_debug_impl(&dword_211704000, v2, OS_LOG_TYPE_DEBUG, "Sent %{companionsync:SYMessageID}hu: %{public}@", (uint8_t *)v6, 0x12u);

  OUTLINED_FUNCTION_12();
}

- (void)messageCenter:(void *)a1 didResolveIDSIdentifier:(void *)a2 forResponse:(uint64_t)a3 .cold.1(void *a1, void *a2, uint64_t a3)
{
  NSObject *v5;
  int v6;
  void *v7;
  _DWORD v8[2];
  __int16 v9;
  void *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v5 = a1;
  v6 = objc_msgSend(a2, "messageID");
  objc_msgSend(a2, "idsIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = 67109634;
  v8[1] = v6;
  v9 = 2114;
  v10 = v7;
  v11 = 2114;
  v12 = a3;
  _os_log_debug_impl(&dword_211704000, v5, OS_LOG_TYPE_DEBUG, "Sent response to %{companionsync:SYMessageID}hu (%{public}@): %{public}@", (uint8_t *)v8, 0x1Cu);

}

- (void)messageCenter:didResolveIDSIdentifier:forFileTransfer:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_9(&dword_211704000, v0, v1, "Sent file: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)messageCenter:didSuccessfullySendRequestWithIdentifier:userInfo:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_9(&dword_211704000, v0, v1, "Device-level ACK for %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)messageCenter:didSuccessfullyDeliverRequestWithIdentifier:userInfo:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_9(&dword_211704000, v0, v1, "App-level ACK for %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)messageCenter:(void *)a3 failedToSendMessageWithIdentifier:error:userInfo:.cold.1(uint64_t a1, void *a2, void *a3)
{
  NSObject *v5;
  void *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  _SYObfuscate(a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138543618;
  v8 = a1;
  v9 = 2114;
  v10 = v6;
  _os_log_debug_impl(&dword_211704000, v5, OS_LOG_TYPE_DEBUG, "Send failure: %{public}@, error=%{public}@", (uint8_t *)&v7, 0x16u);

  OUTLINED_FUNCTION_12();
}

- (void)messageCenter:failedToSendMessageWithIdentifier:error:userInfo:.cold.2()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[14];
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_8_0();
  v3 = v0;
  _os_log_error_impl(&dword_211704000, v1, OS_LOG_TYPE_ERROR, "Message send failure for %{public}@: %{public}@", v2, 0x16u);
  OUTLINED_FUNCTION_2();
}

@end
