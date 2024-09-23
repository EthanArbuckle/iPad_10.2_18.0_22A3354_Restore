@implementation BLTRemoteObject

- (BLTRemoteObject)initWithServiceName:(id)a3 idsQueueName:(char *)a4
{
  return -[BLTRemoteObject initWithServiceName:idsQueueName:andClientQueue:](self, "initWithServiceName:idsQueueName:andClientQueue:", a3, a4, 0);
}

- (BLTRemoteObject)initWithServiceName:(id)a3 idsQueueName:(char *)a4 andClientQueue:(id)a5
{
  id v8;
  dispatch_queue_t v9;
  BLTRemoteObject *v10;
  BLTRemoteObject *v11;
  uint64_t v12;
  NSString *serviceName;
  NSMutableDictionary *v14;
  NSMutableDictionary *idsSendIDToCompletionHandler;
  NSMutableDictionary *v16;
  NSMutableDictionary *idsSendIDToResponseHandler;
  NSMutableDictionary *v18;
  NSMutableDictionary *idsFileIDToResponseHandler;
  NSObject *v20;
  NSObject *v21;
  dispatch_queue_t v22;
  OS_dispatch_queue *idsQueue;
  void *v24;
  void *v25;
  id v26;
  const char *v27;
  NSObject *v28;
  NSLock *v29;
  NSLock *sequenceNumberSendLock;
  id v31;
  const char *v32;
  NSObject *v33;
  dispatch_queue_t v34;
  OS_dispatch_queue *connectionStatusQueue;
  BLTSimpleCache *v36;
  BLTSimpleCache *mruCacheOfSends;
  BLTSimpleCache *v38;
  BLTSimpleCache *mruCacheOfReceives;
  NSObject *v40;
  void *v41;
  void *v42;
  id v44;
  objc_super v45;
  uint8_t buf[4];
  id v47;
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = (dispatch_queue_t)a5;
  v45.receiver = self;
  v45.super_class = (Class)BLTRemoteObject;
  v10 = -[BLTRemoteObject init](&v45, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_pairedDeviceReady = 1;
    v12 = objc_msgSend(v8, "copy");
    serviceName = v11->_serviceName;
    v11->_serviceName = (NSString *)v12;

    v14 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    idsSendIDToCompletionHandler = v11->_idsSendIDToCompletionHandler;
    v11->_idsSendIDToCompletionHandler = v14;

    v16 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    idsSendIDToResponseHandler = v11->_idsSendIDToResponseHandler;
    v11->_idsSendIDToResponseHandler = v16;

    v18 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    idsFileIDToResponseHandler = v11->_idsFileIDToResponseHandler;
    v11->_idsFileIDToResponseHandler = v18;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v20 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v20, QOS_CLASS_USER_INITIATED, 0);
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = dispatch_queue_create(a4, v21);
    idsQueue = v11->_idsQueue;
    v11->_idsQueue = (OS_dispatch_queue *)v22;

    if (!v9)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", a4);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "stringByAppendingString:", CFSTR(".client"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      v26 = objc_retainAutorelease(v25);
      v27 = (const char *)objc_msgSend(v26, "UTF8String");
      dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v28 = objc_claimAutoreleasedReturnValue();
      v9 = dispatch_queue_create(v27, v28);

    }
    objc_storeStrong((id *)&v11->_clientQueue, v9);
    v29 = (NSLock *)objc_alloc_init(MEMORY[0x24BDD1648]);
    sequenceNumberSendLock = v11->_sequenceNumberSendLock;
    v11->_sequenceNumberSendLock = v29;

    objc_msgSend(v8, "stringByAppendingString:", CFSTR(".connectionstatusqueue"));
    v31 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v32 = (const char *)objc_msgSend(v31, "UTF8String");
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v33 = objc_claimAutoreleasedReturnValue();
    v34 = dispatch_queue_create(v32, v33);
    connectionStatusQueue = v11->_connectionStatusQueue;
    v11->_connectionStatusQueue = (OS_dispatch_queue *)v34;

    v36 = -[BLTSimpleCache initWithCapacity:]([BLTSimpleCache alloc], "initWithCapacity:", 10);
    mruCacheOfSends = v11->_mruCacheOfSends;
    v11->_mruCacheOfSends = v36;

    v38 = -[BLTSimpleCache initWithCapacity:]([BLTSimpleCache alloc], "initWithCapacity:", 10);
    mruCacheOfReceives = v11->_mruCacheOfReceives;
    v11->_mruCacheOfReceives = v38;

    -[BLTRemoteObject disableStandaloneTestMode](v11, "disableStandaloneTestMode");
    blt_ids_log();
    v40 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v47 = v8;
      _os_log_impl(&dword_2173D9000, v40, OS_LOG_TYPE_INFO, "Created IDS service %@", buf, 0xCu);
    }

    objc_initWeak((id *)buf, v11);
    BLTWorkQueue();
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_copyWeak(&v44, (id *)buf);
    v11->_stateHandler = os_state_add_handler();

    -[BLTRemoteObject _updateConnectionStatus](v11, "_updateConnectionStatus");
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "addObserver:selector:name:object:", v11, sel__deviceConnectionStatusChanged_, CFSTR("BLTIDSDeviceConnectionStatusChangedNotification"), 0);

    objc_destroyWeak(&v44);
    objc_destroyWeak((id *)buf);

  }
  return v11;
}

_DWORD *__67__BLTRemoteObject_initWithServiceName_idsQueueName_andClientQueue___block_invoke(uint64_t a1)
{
  id WeakRetained;
  objc_class *v2;
  void *v3;
  void *v4;
  _DWORD *v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = (objc_class *)objc_opt_class();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = BLTStateDataWithTitleAndDescription(v3, (uint64_t)v4);

  return v5;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  -[BLTAbstractIDSService removeDelegate:](self->_service, "removeDelegate:", self);
  v4.receiver = self;
  v4.super_class = (Class)BLTRemoteObject;
  -[BLTRemoteObject dealloc](&v4, sel_dealloc);
}

- (NSString)description
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  void *v9;

  objc_msgSend(MEMORY[0x24BE0BE08], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BLTRemoteObject mruCacheOfSends](self, "mruCacheOfSends");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendObject:withName:skipIfNil:", v4, CFSTR("mruCacheOfSends"), 0);

  -[BLTRemoteObject mruCacheOfReceives](self, "mruCacheOfReceives");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v3, "appendObject:withName:skipIfNil:", v6, CFSTR("mruCacheOfReceives"), 0);

  v8 = (id)objc_msgSend(v3, "appendObject:withName:skipIfNil:", self->_serviceName, CFSTR("serviceName"), 0);
  objc_msgSend(v3, "build");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v9;
}

- (void)_handleNewSessionState:(unint64_t)a3
{
  void *v5;
  id v6;

  if (a3)
  {
    -[BLTRemoteObject sequenceNumberManager](self, "sequenceNumberManager");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "recvSessionIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[BLTRemoteObject _sendAckInitialSequenceNumberForSession:sessionState:](self, "_sendAckInitialSequenceNumberForSession:sessionState:", v5, a3);

  }
}

- (BOOL)_sequenceErrorDidHappenAndHandled:(int64_t)a3 service:(id)a4 incomingIdentifier:(id)a5
{
  char v6;
  id v8;
  id v9;
  BOOL v10;
  NSObject *v11;
  NSObject *v12;
  uint8_t v14[16];

  v6 = a3;
  v8 = a4;
  v9 = a5;
  if ((v6 & 2) != 0)
  {
    blt_ids_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v14 = 0;
      _os_log_impl(&dword_2173D9000, v11, OS_LOG_TYPE_DEFAULT, "Detected a duplicate message!", v14, 2u);
    }

    goto LABEL_10;
  }
  if ((v6 & 1) != 0)
  {
    BLTAnalyticsLogOutOfOrderMessage();
    blt_ids_log();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[BLTRemoteObject _sequenceErrorDidHappenAndHandled:service:incomingIdentifier:].cold.1((uint64_t)v8, (uint64_t)v9, v12);

    -[BLTRemoteObject _sendAssertForSession](self, "_sendAssertForSession");
LABEL_10:
    v10 = 1;
    goto LABEL_11;
  }
  v10 = 0;
LABEL_11:

  return v10;
}

- (void)handleIDSProtobuf:(id)a3
{
  BLTSimpleCache *mruCacheOfReceives;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  mruCacheOfReceives = self->_mruCacheOfReceives;
  v11 = a3;
  objc_msgSend(v11, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "outgoingResponseIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "incomingResponseIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("messageType:%u"), objc_msgSend(v11, "type"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[BLTRemoteRequestLogItem remoteRequestLogItemWithIDSTransmitIdentifier:IDSResponseIdentifier:requestDescription:sequenceNumber:sessionIdentifier:sessionState:](BLTRemoteRequestLogItem, "remoteRequestLogItemWithIDSTransmitIdentifier:IDSResponseIdentifier:requestDescription:sequenceNumber:sessionIdentifier:sessionState:", v6, v8, v9, 0, 0, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[BLTSimpleCache cacheObject:](mruCacheOfReceives, "cacheObject:", v10);

  -[BLTRemoteObject _queueHandleIDSProtobuf:](self, "_queueHandleIDSProtobuf:", v11);
}

- (void)_queueHandleIDSProtobuf:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  int v11;
  NSObject *idsQueue;
  id v13;
  uint64_t v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  int v23;
  _QWORD block[5];
  id v25;
  _BYTE *v26;
  uint8_t v27[4];
  const char *v28;
  __int16 v29;
  id v30;
  _BYTE buf[24];
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  objc_msgSend(v4, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "incomingResponseIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  blt_ids_log();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "context");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "outgoingResponseIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v9;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v6;
    _os_log_impl(&dword_2173D9000, v7, OS_LOG_TYPE_DEFAULT, "Received message with IDS identifier: %@ and incoming response id: %@", buf, 0x16u);

  }
  v10 = objc_msgSend(v4, "isResponse");
  if (v6)
    v11 = v10;
  else
    v11 = 0;
  if (v11 != 1)
    goto LABEL_31;
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v32 = __Block_byref_object_copy_;
  v33 = __Block_byref_object_dispose_;
  v34 = 0;
  idsQueue = self->_idsQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __43__BLTRemoteObject__queueHandleIDSProtobuf___block_invoke;
  block[3] = &unk_24D761A80;
  v26 = buf;
  block[4] = self;
  v13 = v6;
  v25 = v13;
  dispatch_sync(idsQueue, block);
  v14 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40);
  if (v14)
  {
    if (-[BLTRemoteObject _callSendCompletionHandlerWithSuccess:identifier:error:](self, "_callSendCompletionHandlerWithSuccess:identifier:error:", 1, v13, 0))
    {
      blt_ids_log();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v27 = 0;
        _os_log_impl(&dword_2173D9000, v15, OS_LOG_TYPE_DEFAULT, "Response arrived before IDS delegate didSendWithSuccess.", v27, 2u);
      }

    }
    blt_ids_log();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v27 = 136315394;
      v28 = "-[BLTRemoteObject _queueHandleIDSProtobuf:]";
      v29 = 2112;
      v30 = v13;
      _os_log_impl(&dword_2173D9000, v16, OS_LOG_TYPE_DEFAULT, "%s: matched response %@, executing block", v27, 0x16u);
    }

    (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)&buf[8] + 40) + 16))();
  }
  else
  {
    blt_ids_log();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v27 = 136315394;
      v28 = "-[BLTRemoteObject _queueHandleIDSProtobuf:]";
      v29 = 2112;
      v30 = v13;
      _os_log_impl(&dword_2173D9000, v17, OS_LOG_TYPE_DEFAULT, "%s: no ack block found for response %@, ignoring", v27, 0x16u);
    }

  }
  _Block_object_dispose(buf, 8);

  if (!v14)
  {
LABEL_31:
    if (objc_msgSend(v4, "isResponse"))
      v18 = 0x10000;
    else
      v18 = 0;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v18 | objc_msgSend(v4, "type"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](self->_idsRequestMessageTypeToSelector, "objectForKeyedSubscript:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v20;
    if (v20)
    {
      ((void (*)(BLTRemoteObject *, uint64_t, id))objc_msgSend(v20, "method"))(self, objc_msgSend(v20, "selector"), v4);
    }
    else
    {
      blt_ids_log();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        v23 = objc_msgSend(v4, "type");
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&buf[4] = v23;
        _os_log_impl(&dword_2173D9000, v22, OS_LOG_TYPE_DEFAULT, "No method registered for message with type: %d", buf, 8u);
      }

    }
  }

}

void __43__BLTRemoteObject__queueHandleIDSProtobuf___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1[4] + 16), "objectForKeyedSubscript:", a1[5]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  if (*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40))
    objc_msgSend(*(id *)(a1[4] + 16), "removeObjectForKey:", a1[5]);
}

- (void)handleIncomingMessage:(id)a3
{
  id v4;
  BLTPBProtobuf *v5;
  void *v6;
  BLTPBProtobuf *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *clientQueue;
  BLTSimpleCache *mruCacheOfReceives;
  void *v24;
  id v25;
  _QWORD block[5];
  BLTPBProtobuf *v27;

  v4 = a3;
  v5 = [BLTPBProtobuf alloc];
  -[BLTRemoteObject sequenceNumberManager](self, "sequenceNumberManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[BLTPBProtobuf initWithIDSProtobuf:sequenceNumberManager:](v5, "initWithIDSProtobuf:sequenceNumberManager:", v4, v6);

  if (v7)
  {
    v25 = v4;
    objc_msgSend(v4, "transportData");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    mruCacheOfReceives = self->_mruCacheOfReceives;
    -[BLTPBProtobuf context](v7, "context");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "outgoingResponseIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[BLTPBProtobuf context](v7, "context");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "incomingResponseIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("messageType:%u"), -[BLTPBProtobuf type](v7, "type"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", objc_msgSend(v8, "sequenceNumber"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    sessionUUIDFromTransportData(v8);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v8;
    +[BLTRemoteRequestLogItem remoteRequestLogItemWithIDSTransmitIdentifier:IDSResponseIdentifier:requestDescription:sequenceNumber:sessionIdentifier:sessionState:](BLTRemoteRequestLogItem, "remoteRequestLogItemWithIDSTransmitIdentifier:IDSResponseIdentifier:requestDescription:sequenceNumber:sessionIdentifier:sessionState:", v10, v12, v13, v14, v15, objc_msgSend(v8, "sessionState"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[BLTSimpleCache cacheObject:](mruCacheOfReceives, "cacheObject:", v16);

    -[BLTRemoteObject _handleNewSessionState:](self, "_handleNewSessionState:", -[BLTPBProtobuf sessionState](v7, "sessionState"));
    v17 = -[BLTPBProtobuf sequenceNumberError](v7, "sequenceNumberError");
    -[BLTPBProtobuf context](v7, "context");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "serviceIdentifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[BLTPBProtobuf context](v7, "context");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "outgoingResponseIdentifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v17) = -[BLTRemoteObject _sequenceErrorDidHappenAndHandled:service:incomingIdentifier:](self, "_sequenceErrorDidHappenAndHandled:service:incomingIdentifier:", v17, v19, v21);

    if ((v17 & 1) == 0)
    {
      clientQueue = self->_clientQueue;
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __41__BLTRemoteObject_handleIncomingMessage___block_invoke;
      block[3] = &unk_24D761AA8;
      block[4] = self;
      v27 = v7;
      dispatch_async(clientQueue, block);

    }
    v4 = v25;
  }

}

uint64_t __41__BLTRemoteObject_handleIncomingMessage___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queueHandleIDSProtobuf:", *(_QWORD *)(a1 + 40));
}

- (void)_sendAssertForSession
{
  -[BLTRemoteObject _sendAckInitialSequenceNumberForSession:withAssert:sessionState:](self, "_sendAckInitialSequenceNumberForSession:withAssert:sessionState:", 0, 1, 0);
}

- (void)_sendAckInitialSequenceNumberForSession:(id)a3 sessionState:(unint64_t)a4
{
  unint64_t v4;

  v4 = a4;
  -[BLTRemoteObject _sendAckInitialSequenceNumberForSession:withAssert:sessionState:](self, "_sendAckInitialSequenceNumberForSession:withAssert:sessionState:", a3, 0, &v4);
}

- (void)_sendAckInitialSequenceNumberForSession:(id)a3 withAssert:(BOOL)a4 sessionState:(unint64_t *)a5
{
  _BOOL4 v6;
  id v8;
  BLTPBAckInitialSequenceNumberRequest *v9;
  void *v10;
  void *v11;
  _QWORD v12[3];

  v6 = a4;
  v12[2] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = objc_alloc_init(BLTPBAckInitialSequenceNumberRequest);
  if (v8)
  {
    v12[0] = 0;
    v12[1] = 0;
    objc_msgSend(v8, "getUUIDBytes:", v12);
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", v12, 16);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[BLTPBAckInitialSequenceNumberRequest setSessionIdentifier:](v9, "setSessionIdentifier:", v10);

  }
  if (v6)
    -[BLTPBAckInitialSequenceNumberRequest setAssert:](v9, "setAssert:", 1);
  if (a5)
    -[BLTPBAckInitialSequenceNumberRequest setSessionState:](v9, "setSessionState:", *(unsigned int *)a5);
  +[BLTRemoteRequest remoteRequestWithProtobuf:type:](BLTRemoteRequest, "remoteRequestWithProtobuf:type:", v9, 12);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[BLTRemoteObject _queueSendRequest:](self, "_queueSendRequest:", v11);

}

- (void)handleAckInitialSequenceNumberRequest:(id)a3
{
  id v4;
  BLTPBAckInitialSequenceNumberRequest *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  uint64_t v15;
  BLTPBAckInitialSequenceNumberRequest *v16;

  v4 = a3;
  v5 = [BLTPBAckInitialSequenceNumberRequest alloc];
  objc_msgSend(v4, "data");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = -[BLTPBAckInitialSequenceNumberRequest initWithData:](v5, "initWithData:", v6);
  if (-[BLTPBAckInitialSequenceNumberRequest hasSessionIdentifier](v16, "hasSessionIdentifier"))
  {
    v7 = objc_alloc(MEMORY[0x24BDD1880]);
    -[BLTPBAckInitialSequenceNumberRequest sessionIdentifier](v16, "sessionIdentifier");
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v9 = (void *)objc_msgSend(v7, "initWithUUIDBytes:", objc_msgSend(v8, "bytes"));

    -[BLTRemoteObject sequenceNumberManager](self, "sequenceNumberManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "currentSessionIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v9, "isEqual:", v11);

    if ((v12 & 1) == 0)
    {
      -[BLTRemoteObject sequenceNumberManager](self, "sequenceNumberManager");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v13;
      v15 = 1;
      goto LABEL_9;
    }
    if (-[BLTPBAckInitialSequenceNumberRequest sessionState](v16, "sessionState") == 1)
    {
      -[BLTRemoteObject sequenceNumberManager](self, "sequenceNumberManager");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v13;
      v15 = 2;
LABEL_9:
      objc_msgSend(v13, "setSessionState:", v15);

      goto LABEL_10;
    }
    if (-[BLTPBAckInitialSequenceNumberRequest sessionState](v16, "sessionState") == 2)
    {
      -[BLTRemoteObject sequenceNumberManager](self, "sequenceNumberManager");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v13;
      v15 = 0;
      goto LABEL_9;
    }
  }
  else
  {
    -[BLTRemoteObject sequenceNumberManager](self, "sequenceNumberManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setSessionState:", 0);
  }
LABEL_10:

}

- (void)_storeProtobufAction:(SEL)a3 messageType:(unsigned __int16)a4 messageSendType:(int64_t)a5
{
  unsigned int v6;
  void *v9;
  BLTPBSelectorItem *v10;

  v6 = a4;
  v10 = objc_alloc_init(BLTPBSelectorItem);
  -[BLTPBSelectorItem setSelector:](v10, "setSelector:", a3);
  -[BLTPBSelectorItem setMethod:](v10, "setMethod:", -[BLTRemoteObject methodForSelector:](self, "methodForSelector:", a3));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v6 | (unint64_t)(a5 << 16));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_idsRequestMessageTypeToSelector, "setObject:forKeyedSubscript:", v10, v9);

}

- (void)setProtobufAction:(SEL)a3 forIncomingRequestsOfType:(unsigned __int16)a4
{
  uint64_t v4;
  id v6;

  v4 = a4;
  -[BLTRemoteObject _storeProtobufAction:messageType:messageSendType:](self, "_storeProtobufAction:messageType:messageSendType:", a3, a4, 0);
  -[BLTRemoteObject service](self, "service");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setProtobufAction:forIncomingRequestsOfType:", sel_handleIncomingMessage_, v4);

}

- (void)setProtobufAction:(SEL)a3 forIncomingResponsesOfType:(unsigned __int16)a4
{
  uint64_t v4;
  id v6;

  v4 = a4;
  -[BLTRemoteObject _storeProtobufAction:messageType:messageSendType:](self, "_storeProtobufAction:messageType:messageSendType:", a3, a4, 1);
  -[BLTRemoteObject service](self, "service");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setProtobufAction:forIncomingResponsesOfType:", sel_handleIncomingMessage_, v4);

}

- (unint64_t)connectionStatus
{
  NSObject *connectionStatusQueue;
  _QWORD block[5];

  connectionStatusQueue = self->_connectionStatusQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __35__BLTRemoteObject_connectionStatus__block_invoke;
  block[3] = &unk_24D761AD0;
  block[4] = self;
  dispatch_sync(connectionStatusQueue, block);
  return -[BLTRemoteObject lastKnownConnectionStatus](self, "lastKnownConnectionStatus");
}

uint64_t __35__BLTRemoteObject_connectionStatus__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queueUpdateConnectionStatusWithResetDefaulteDevice:", 0);
}

- (void)_updateConnectionStatus
{
  -[BLTRemoteObject _updateConnectionStatusWithResetDefaulteDevice:](self, "_updateConnectionStatusWithResetDefaulteDevice:", 0);
}

- (void)_updateConnectionStatusWithResetDefaulteDevice:(BOOL)a3
{
  NSObject *connectionStatusQueue;
  _QWORD v4[5];
  BOOL v5;

  connectionStatusQueue = self->_connectionStatusQueue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __66__BLTRemoteObject__updateConnectionStatusWithResetDefaulteDevice___block_invoke;
  v4[3] = &unk_24D761AF8;
  v4[4] = self;
  v5 = a3;
  dispatch_async(connectionStatusQueue, v4);
}

uint64_t __66__BLTRemoteObject__updateConnectionStatusWithResetDefaulteDevice___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queueUpdateConnectionStatusWithResetDefaulteDevice:", *(unsigned __int8 *)(a1 + 40));
}

- (void)_queueUpdateConnectionStatusWithResetDefaulteDevice:(BOOL)a3
{
  BLTAbstractIDSDevice *v4;
  void *v5;
  BLTAbstractIDSDevice *v6;
  BLTAbstractIDSDevice *defaultPairedDevice;
  NSObject *v8;
  BLTAbstractIDSDevice *v9;
  uint64_t v10;
  NSObject *v11;
  char *v12;
  unint64_t v13;
  const char *v14;
  int v15;
  void *v16;
  __int16 v17;
  const char *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  if (a3 || (v4 = self->_defaultPairedDevice) == 0)
  {
    -[BLTRemoteObject service](self, "service");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "defaultPairedDevice");
    v6 = (BLTAbstractIDSDevice *)objc_claimAutoreleasedReturnValue();
    defaultPairedDevice = self->_defaultPairedDevice;
    self->_defaultPairedDevice = v6;

    blt_ids_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = self->_defaultPairedDevice;
      v15 = 138412290;
      v16 = v9;
      _os_log_impl(&dword_2173D9000, v8, OS_LOG_TYPE_INFO, "Found default paired device %@", (uint8_t *)&v15, 0xCu);
    }

    v4 = self->_defaultPairedDevice;
  }
  if ((-[BLTAbstractIDSDevice isNearby](v4, "isNearby") & 1) != 0)
  {
    v10 = 1;
  }
  else if ((-[BLTAbstractIDSDevice isConnected](self->_defaultPairedDevice, "isConnected") & 1) != 0)
  {
    v10 = 2;
  }
  else if (-[BLTAbstractIDSDevice isCloudReachable](self->_defaultPairedDevice, "isCloudReachable"))
  {
    v10 = 3;
  }
  else
  {
    v10 = 0;
  }
  blt_ids_log();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = off_24D761CD0[v10];
    v13 = -[BLTRemoteObject lastKnownConnectionStatus](self, "lastKnownConnectionStatus");
    if (v13 > 3)
      v14 = "unknown";
    else
      v14 = off_24D761CD0[v13];
    v15 = 136315394;
    v16 = v12;
    v17 = 2080;
    v18 = v14;
    _os_log_impl(&dword_2173D9000, v11, OS_LOG_TYPE_DEFAULT, "Default paired device connection status: %s last known status: %s", (uint8_t *)&v15, 0x16u);
  }

  if (v10 != -[BLTRemoteObject lastKnownConnectionStatus](self, "lastKnownConnectionStatus"))
    -[BLTRemoteObject setLastKnownConnectionStatus:](self, "setLastKnownConnectionStatus:", v10);
}

- (void)enableStandaloneTestModeWithMinimumSendDelay:(unint64_t)a3 maximumSendDelay:(unint64_t)a4 minimumResponseDelay:(unint64_t)a5 maximumResponseDelay:(unint64_t)a6
{
  BLTAbstractIDSService *v11;

  -[BLTRemoteObject _setStandaloneTestModeEnabled:](self, "_setStandaloneTestModeEnabled:", 1);
  v11 = self->_service;
  -[BLTAbstractIDSService setMinimumSendDelay:](v11, "setMinimumSendDelay:", a3);
  -[BLTAbstractIDSService setMaximumSendDelay:](v11, "setMaximumSendDelay:", a4);
  -[BLTAbstractIDSService setMinimumResponseDelay:](v11, "setMinimumResponseDelay:", a5);
  -[BLTAbstractIDSService setMaximumResponseDelay:](v11, "setMaximumResponseDelay:", a6);

}

- (void)disableStandaloneTestMode
{
  -[BLTRemoteObject _setStandaloneTestModeEnabled:](self, "_setStandaloneTestModeEnabled:", 0);
}

- (void)_setStandaloneTestModeEnabled:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *connectionStatusQueue;
  BLTAbstractIDSService *service;
  NSString *serviceName;
  NSString *v8;
  __objc2_class **v9;
  BLTAbstractIDSService *v10;
  BLTAbstractIDSService *v11;
  BLTPBProtobufSequenceNumberManager *v12;
  BLTPBProtobufSequenceNumberManager *v13;
  BLTPBProtobufSequenceNumberManager *sequenceNumberManager;
  NSMutableDictionary *v15;
  NSMutableDictionary *idsRequestMessageTypeToSelector;
  _QWORD block[5];

  v3 = a3;
  connectionStatusQueue = self->_connectionStatusQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __49__BLTRemoteObject__setStandaloneTestModeEnabled___block_invoke;
  block[3] = &unk_24D761AD0;
  block[4] = self;
  dispatch_sync(connectionStatusQueue, block);
  service = self->_service;
  if (service)
    -[BLTAbstractIDSService removeDelegate:](service, "removeDelegate:", self);
  serviceName = self->_serviceName;
  if (v3)
  {
    -[NSString stringByAppendingString:](serviceName, "stringByAppendingString:", CFSTR(".test"));
    v8 = (NSString *)objc_claimAutoreleasedReturnValue();
    v9 = off_24D7611F0;
  }
  else
  {
    v8 = serviceName;
    v9 = off_24D760EA0;
  }
  v10 = (BLTAbstractIDSService *)objc_msgSend(objc_alloc(*v9), "initWithService:", v8);
  v11 = self->_service;
  self->_service = v10;

  v12 = [BLTPBProtobufSequenceNumberManager alloc];
  v13 = -[BLTPBProtobufSequenceNumberManager initWithServiceName:updateSequenceNumbersOnOutOfOrder:](v12, "initWithServiceName:updateSequenceNumbersOnOutOfOrder:", v8, objc_msgSend(MEMORY[0x24BE6B4A8], "activePairedDeviceSupportsNotSendingTemporarySequenceNumbers") ^ 1);
  sequenceNumberManager = self->_sequenceNumberManager;
  self->_sequenceNumberManager = v13;

  v15 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
  idsRequestMessageTypeToSelector = self->_idsRequestMessageTypeToSelector;
  self->_idsRequestMessageTypeToSelector = v15;

  -[BLTRemoteObject setProtobufAction:forIncomingRequestsOfType:](self, "setProtobufAction:forIncomingRequestsOfType:", sel_handleAckInitialSequenceNumberRequest_, 12);
  -[BLTRemoteObject registerProtobufHandlers](self, "registerProtobufHandlers");
  -[BLTAbstractIDSService addDelegate:queue:](self->_service, "addDelegate:queue:", self, self->_idsQueue);

}

void __49__BLTRemoteObject__setStandaloneTestModeEnabled___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 56);
  *(_QWORD *)(v1 + 56) = 0;

}

- (void)sendRequest:(id)a3 type:(unsigned __int16)a4
{
  -[BLTRemoteObject sendRequest:type:didSend:](self, "sendRequest:type:didSend:", a3, a4, 0);
}

- (void)sendRequest:(id)a3 type:(unsigned __int16)a4 didSend:(id)a5
{
  -[BLTRemoteObject sendRequest:type:withTimeout:didSend:](self, "sendRequest:type:withTimeout:didSend:", a3, a4, 0, a5);
}

- (void)sendRequest:(id)a3 type:(unsigned __int16)a4 withTimeout:(id)a5 didSend:(id)a6
{
  -[BLTRemoteObject sendRequest:type:withTimeout:withDescription:didSend:](self, "sendRequest:type:withTimeout:withDescription:didSend:", a3, a4, a5, 0, a6);
}

- (void)sendRequest:(id)a3 type:(unsigned __int16)a4 withTimeout:(id)a5 withDescription:(id)a6 didSend:(id)a7
{
  -[BLTRemoteObject sendRequest:type:withTimeout:withDescription:onlyOneFor:didSend:andResponse:](self, "sendRequest:type:withTimeout:withDescription:onlyOneFor:didSend:andResponse:", a3, a4, a5, a6, 0, a7, 0);
}

- (void)sendRequest:(id)a3 type:(unsigned __int16)a4 withTimeout:(id)a5 withDescription:(id)a6 onlyOneFor:(id)a7 didSend:(id)a8 andResponse:(id)a9
{
  uint64_t v13;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;

  v13 = a4;
  v16 = a9;
  v17 = a8;
  v18 = a7;
  v19 = a6;
  v20 = a5;
  +[BLTRemoteRequest remoteRequestWithProtobuf:type:](BLTRemoteRequest, "remoteRequestWithProtobuf:type:", a3, v13);
  v21 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setTimeout:", v20);

  objc_msgSend(v21, "setRequestDescription:", v19);
  objc_msgSend(v21, "setUniqueID:", v18);

  objc_msgSend(v21, "setDidSend:", v17);
  objc_msgSend(v21, "setResponseCompletion:", v16);

  -[BLTRemoteObject sendRequest:](self, "sendRequest:", v21);
}

- (void)sendResponse:(id)a3 type:(unsigned __int16)a4 withRequest:(id)a5 withTimeout:(id)a6 withDescription:(id)a7 onlyOneFor:(id)a8 didSend:(id)a9
{
  uint64_t v13;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;

  v13 = a4;
  v16 = a9;
  v17 = a8;
  v18 = a7;
  v19 = a6;
  v20 = a5;
  +[BLTRemoteRequest remoteRequestWithProtobuf:type:](BLTRemoteRequest, "remoteRequestWithProtobuf:type:", a3, v13);
  v21 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setResponseToRequest:", v20);

  objc_msgSend(v21, "setTimeout:", v19);
  objc_msgSend(v21, "setRequestDescription:", v18);

  objc_msgSend(v21, "setUniqueID:", v17);
  objc_msgSend(v21, "setDidSend:", v16);

  -[BLTRemoteObject sendRequest:](self, "sendRequest:", v21);
}

- (void)sendRequest:(id)a3 type:(unsigned __int16)a4 withTimeout:(id)a5 didSend:(id)a6 didQueue:(id)a7
{
  uint64_t v9;
  id v12;
  id v13;
  id v14;
  id v15;

  v9 = a4;
  v12 = a7;
  v13 = a6;
  v14 = a5;
  +[BLTRemoteRequest remoteRequestWithProtobuf:type:](BLTRemoteRequest, "remoteRequestWithProtobuf:type:", a3, v9);
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setTimeout:", v14);

  objc_msgSend(v15, "setDidSend:", v13);
  objc_msgSend(v15, "setDidQueue:", v12);

  if ((_DWORD)v9 == 27)
  {
    objc_msgSend(v15, "setAllowCloudDelivery:", 0);
    objc_msgSend(v15, "setNonWaking:", 1);
  }
  -[BLTRemoteObject sendRequest:](self, "sendRequest:", v15);

}

- (void)sendRequest:(id)a3
{
  id v4;
  NSObject *idsQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_idsQueue);
  idsQueue = self->_idsQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __31__BLTRemoteObject_sendRequest___block_invoke;
  block[3] = &unk_24D761AA8;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(idsQueue, block);

}

uint64_t __31__BLTRemoteObject_sendRequest___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queueSendRequest:", *(_QWORD *)(a1 + 40));
}

- (void)_queuePerformSend:(id)a3 responseToRequest:(id)a4 withTimeout:(id)a5 withDescription:(id)a6 shortDescription:(id)a7 onlyOneFor:(id)a8 allowCloudDelivery:(BOOL)a9 nonWaking:(BOOL)a10 didSend:(id)a11 andResponse:(id)a12
{
  id v18;
  id v19;
  id v20;
  id v21;
  const char *v22;
  void *v23;
  double v24;
  void *v25;
  uint64_t v26;
  NSObject *v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  const char *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  id v36;
  void *v37;
  id v38;
  uint64_t v39;
  id v40;
  id v41;
  id v42;
  char v43;
  void *v44;
  void *v45;
  void *v46;
  NSObject *v47;
  BLTSimpleCache *mruCacheOfSends;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  uint64_t v53;
  id v54;
  id v55;
  void *v56;
  id v57;
  uint64_t (**v58)(id, void *, id *, id *, id *);
  void (**v59)(_QWORD, _QWORD, _QWORD);
  id v60;
  void *v61;
  id v62;
  id v63;
  id v64;
  id v65;
  _QWORD v66[5];
  id v67;
  id v68;
  id v69;
  _QWORD v70[5];
  id v71;
  _BYTE *v72;
  uint8_t v73[4];
  uint64_t v74;
  __int16 v75;
  id v76;
  __int16 v77;
  id v78;
  __int16 v79;
  const char *v80;
  _BYTE buf[24];
  char v82;
  uint64_t v83;

  v83 = *MEMORY[0x24BDAC8D0];
  v58 = (uint64_t (**)(id, void *, id *, id *, id *))a3;
  v18 = a4;
  v19 = a5;
  v60 = a6;
  v57 = a7;
  v62 = a8;
  v20 = a11;
  v21 = a12;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_idsQueue);
  v22 = "response";
  v61 = v18;
  if (!v18)
    v22 = "request";
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    v24 = *MEMORY[0x24BE4FA10];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *MEMORY[0x24BE4FA10]);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v19, "compare:", v25);

    if (v26 == 1)
    {
      blt_ids_log();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v19, "doubleValue");
        *(_DWORD *)buf = 134218240;
        *(_QWORD *)&buf[4] = v28;
        *(_WORD *)&buf[12] = 2048;
        *(double *)&buf[14] = v24;
        _os_log_impl(&dword_2173D9000, v27, OS_LOG_TYPE_INFO, "Timeout: %f is greater than IDS max: %f and will be clamped to max", buf, 0x16u);
      }

      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v24);
      v29 = objc_claimAutoreleasedReturnValue();

      v30 = (id)v29;
    }
    else
    {
      v30 = v19;
    }
    v56 = v30;
    objc_msgSend(v23, "setObject:forKeyedSubscript:");
    objc_msgSend(v23, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE4FA90]);
    v31 = "remote timeout is ENFORCED";
  }
  else
  {
    v56 = 0;
    v31 = "";
  }
  if (v62)
    objc_msgSend(v23, "setObject:forKeyedSubscript:", v62, *MEMORY[0x24BE4FB18]);
  if (v18)
  {
    objc_msgSend(v18, "context");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "outgoingResponseIdentifier");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setObject:forKeyedSubscript:", v33, *MEMORY[0x24BE4FAF0]);

  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a9);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setObject:forKeyedSubscript:", v34, *MEMORY[0x24BE4FA68]);

  if (a10)
    objc_msgSend(v23, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE4FAE8]);
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3020000000;
  v82 = 0;
  v35 = MEMORY[0x24BDAC760];
  v70[0] = MEMORY[0x24BDAC760];
  v70[1] = 3221225472;
  v70[2] = __160__BLTRemoteObject__queuePerformSend_responseToRequest_withTimeout_withDescription_shortDescription_onlyOneFor_allowCloudDelivery_nonWaking_didSend_andResponse___block_invoke;
  v70[3] = &unk_24D761B48;
  v36 = v21;
  v71 = v36;
  v72 = buf;
  v70[4] = self;
  v37 = (void *)MEMORY[0x219A0C15C](v70);
  v66[0] = v35;
  v66[1] = 3221225472;
  v66[2] = __160__BLTRemoteObject__queuePerformSend_responseToRequest_withTimeout_withDescription_shortDescription_onlyOneFor_allowCloudDelivery_nonWaking_didSend_andResponse___block_invoke_3;
  v66[3] = &unk_24D761BC0;
  v54 = v20;
  v66[4] = self;
  v67 = v54;
  v55 = v36;
  v68 = v55;
  v38 = v37;
  v69 = v38;
  v59 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x219A0C15C](v66);
  v64 = 0;
  v65 = 0;
  v63 = 0;
  v39 = v58[2](v58, v23, &v65, &v64, &v63);
  v40 = v65;
  v41 = v64;
  v42 = v63;
  if (v40)
    v43 = 0;
  else
    v43 = v39;
  if ((v43 & 1) != 0)
  {
    v44 = (void *)MEMORY[0x219A0C15C](v59);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_idsSendIDToCompletionHandler, "setObject:forKeyedSubscript:", v44, v41);

    v45 = (void *)MEMORY[0x219A0C15C](v38);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_idsSendIDToResponseHandler, "setObject:forKeyedSubscript:", v45, v41);

  }
  else
  {
    _BLTLogIDSSendFail(-[BLTRemoteObject isPairedDeviceReady](self, "isPairedDeviceReady"), v40, v41);
    if (objc_msgSend(v40, "code") == 27)
      self->_full = 1;
    -[BLTRemoteObject _wrapError:identifier:](self, "_wrapError:identifier:", v40, v41);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, uint64_t, void *))v59)[2](v59, v39, v46);

    (*((void (**)(id, _QWORD))v38 + 2))(v38, 0);
  }
  blt_ids_log();
  v47 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v73 = 136315906;
    v74 = v53;
    v75 = 2112;
    v76 = v60;
    v77 = 2112;
    v78 = v41;
    v79 = 2080;
    v80 = v31;
    _os_log_impl(&dword_2173D9000, v47, OS_LOG_TYPE_DEFAULT, "Sent IDS %s %@ got identifier: %@ %s", v73, 0x2Au);
  }

  mruCacheOfSends = self->_mruCacheOfSends;
  objc_msgSend(v23, "objectForKeyedSubscript:", *MEMORY[0x24BE4FAF0]);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", objc_msgSend(v42, "sequenceNumber"));
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  sessionUUIDFromTransportData(v42);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  +[BLTRemoteRequestLogItem remoteRequestLogItemWithIDSTransmitIdentifier:IDSResponseIdentifier:requestDescription:sequenceNumber:sessionIdentifier:sessionState:](BLTRemoteRequestLogItem, "remoteRequestLogItemWithIDSTransmitIdentifier:IDSResponseIdentifier:requestDescription:sequenceNumber:sessionIdentifier:sessionState:", v41, v49, v60, v50, v51, objc_msgSend(v42, "sessionState"));
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  -[BLTSimpleCache cacheObject:](mruCacheOfSends, "cacheObject:", v52);

  _Block_object_dispose(buf, 8);
}

void __160__BLTRemoteObject__queuePerformSend_responseToRequest_withTimeout_withDescription_shortDescription_onlyOneFor_allowCloudDelivery_nonWaking_didSend_andResponse___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  unsigned __int8 *v4;
  unsigned __int8 v5;
  void *v6;
  NSObject *v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v3 = a2;
  if (a1[5])
  {
    v4 = (unsigned __int8 *)(*(_QWORD *)(a1[6] + 8) + 40);
    do
      v5 = __ldaxr(v4);
    while (__stlxr(v5 | 1, v4));
    if ((v5 & 1) == 0)
    {
      v6 = (void *)a1[5];
      v7 = *(NSObject **)(a1[4] + 104);
      v8[0] = MEMORY[0x24BDAC760];
      v8[1] = 3221225472;
      v8[2] = __160__BLTRemoteObject__queuePerformSend_responseToRequest_withTimeout_withDescription_shortDescription_onlyOneFor_allowCloudDelivery_nonWaking_didSend_andResponse___block_invoke_2;
      v8[3] = &unk_24D761B20;
      v10 = v6;
      v9 = v3;
      dispatch_async(v7, v8);

    }
  }

}

uint64_t __160__BLTRemoteObject__queuePerformSend_responseToRequest_withTimeout_withDescription_shortDescription_onlyOneFor_allowCloudDelivery_nonWaking_didSend_andResponse___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __160__BLTRemoteObject__queuePerformSend_responseToRequest_withTimeout_withDescription_shortDescription_onlyOneFor_allowCloudDelivery_nonWaking_didSend_andResponse___block_invoke_3(uint64_t a1, int a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  dispatch_time_t v8;
  NSObject *v9;
  _QWORD v10[4];
  id v11;
  _QWORD block[4];
  id v13;
  id v14;
  char v15;

  v5 = a3;
  v6 = *(void **)(a1 + 40);
  if (v6)
  {
    v7 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 104);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __160__BLTRemoteObject__queuePerformSend_responseToRequest_withTimeout_withDescription_shortDescription_onlyOneFor_allowCloudDelivery_nonWaking_didSend_andResponse___block_invoke_4;
    block[3] = &unk_24D761B70;
    v14 = v6;
    v15 = a2;
    v13 = v5;
    dispatch_async(v7, block);

  }
  if (a2 && *(_QWORD *)(a1 + 48))
  {
    v8 = dispatch_time(0, 30000000000);
    v9 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 104);
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __160__BLTRemoteObject__queuePerformSend_responseToRequest_withTimeout_withDescription_shortDescription_onlyOneFor_allowCloudDelivery_nonWaking_didSend_andResponse___block_invoke_5;
    v10[3] = &unk_24D761B98;
    v11 = *(id *)(a1 + 56);
    dispatch_after(v8, v9, v10);

  }
}

uint64_t __160__BLTRemoteObject__queuePerformSend_responseToRequest_withTimeout_withDescription_shortDescription_onlyOneFor_allowCloudDelivery_nonWaking_didSend_andResponse___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

uint64_t __160__BLTRemoteObject__queuePerformSend_responseToRequest_withTimeout_withDescription_shortDescription_onlyOneFor_allowCloudDelivery_nonWaking_didSend_andResponse___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)_wrapError:(id)a3 identifier:(id)a4
{
  void *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;

  v4 = a3;
  if (a3)
  {
    v5 = a4;
    v6 = v4;
    objc_msgSend(v6, "userInfo");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "mutableCopy");

    objc_msgSend(v8, "setObject:forKeyedSubscript:", v5, CFSTR("BLTTransportSendIdentifier"));
    v9 = (void *)MEMORY[0x24BDD1540];
    objc_msgSend(v6, "domain");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v6, "code");

    objc_msgSend(v9, "errorWithDomain:code:userInfo:", v10, v11, v8);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

- (void)_queueSendRequest:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  objc_class *v11;
  uint64_t v12;
  objc_class *v13;
  void *v14;
  void *v15;
  char v16;
  char v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  BLTRemoteObject *v25;
  void *context;
  _QWORD v27[5];
  id v28;
  id v29;

  v4 = a3;
  context = (void *)MEMORY[0x219A0BFAC]();
  objc_msgSend(v4, "protobuf");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = MEMORY[0x24BDAC760];
  v27[1] = 3221225472;
  v27[2] = __37__BLTRemoteObject__queueSendRequest___block_invoke;
  v27[3] = &unk_24D761BE8;
  v25 = self;
  v27[4] = self;
  v6 = v5;
  v28 = v6;
  v7 = v4;
  v29 = v7;
  objc_msgSend(v7, "responseToRequest");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "timeout");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "requestDescription");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (!v8)
  {
    v10 = (void *)MEMORY[0x24BDD17C8];
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v12 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "redact");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)v12;
    objc_msgSend(v10, "stringWithFormat:", CFSTR("%@: %@"), v12, v21);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v13 = (objc_class *)objc_opt_class();
  NSStringFromClass(v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "uniqueID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v7, "allowCloudDelivery");
  v17 = objc_msgSend(v7, "nonWaking");
  objc_msgSend(v7, "didSend");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "responseCompletion");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  BYTE1(v20) = v17;
  LOBYTE(v20) = v16;
  -[BLTRemoteObject _queuePerformSend:responseToRequest:withTimeout:withDescription:shortDescription:onlyOneFor:allowCloudDelivery:nonWaking:didSend:andResponse:](v25, "_queuePerformSend:responseToRequest:withTimeout:withDescription:shortDescription:onlyOneFor:allowCloudDelivery:nonWaking:didSend:andResponse:", v27, v24, v23, v9, v14, v15, v20, v18, v19);

  if (!v8)
  {

  }
  objc_autoreleasePoolPop(context);

}

uint64_t __37__BLTRemoteObject__queueSendRequest___block_invoke(uint64_t a1, void *a2, _QWORD *a3, _QWORD *a4, _QWORD *a5)
{
  id v6;
  void *v7;
  BLTPBProtobuf *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  BLTPBProtobuf *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  id v20;
  void *v21;
  void (**v22)(void);
  id v27;
  id v28;

  v6 = a2;
  v7 = (void *)MEMORY[0x219A0BFAC](objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "lock"));
  v8 = [BLTPBProtobuf alloc];
  v9 = *(_QWORD *)(a1 + 40);
  v10 = objc_msgSend(*(id *)(a1 + 48), "type");
  objc_msgSend(*(id *)(a1 + 48), "responseToRequest");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "sequenceNumberManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[BLTPBProtobuf initWithProtobuf:type:isResponse:sequenceNumberManager:](v8, "initWithProtobuf:type:isResponse:sequenceNumberManager:", v9, v10, v11 != 0, v12);

  -[IDSProtobuf transportData](v13, "transportData");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "service");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", *MEMORY[0x24BE4F9C8]);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0;
  v28 = 0;
  v17 = v6;
  v18 = objc_msgSend(v15, "sendProtobuf:toDestinations:priority:options:identifier:error:", v13, v16, 300, v6, &v28, &v27);
  v19 = v28;
  v20 = v27;

  objc_autoreleasePoolPop(v7);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "unlock");
  objc_msgSend(*(id *)(a1 + 48), "didQueue");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    objc_msgSend(*(id *)(a1 + 48), "didQueue");
    v22 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v22[2]();

  }
  if (a3)
    *a3 = objc_retainAutorelease(v20);
  if (a4)
    *a4 = objc_retainAutorelease(v19);
  if (a5)
    *a5 = objc_retainAutorelease(v14);

  return v18;
}

- (void)sendFileURL:(id)a3 withTimeout:(id)a4 extraMetadata:(id)a5 responseHandlers:(id)a6 didSend:(id)a7 didQueue:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  NSObject *idsQueue;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  _QWORD block[5];
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  idsQueue = self->_idsQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __91__BLTRemoteObject_sendFileURL_withTimeout_extraMetadata_responseHandlers_didSend_didQueue___block_invoke;
  block[3] = &unk_24D761C38;
  block[4] = self;
  v28 = v16;
  v29 = v14;
  v30 = v17;
  v31 = v15;
  v32 = v19;
  v33 = v18;
  v21 = v18;
  v22 = v15;
  v23 = v17;
  v24 = v19;
  v25 = v14;
  v26 = v16;
  dispatch_sync(idsQueue, block);

}

void __91__BLTRemoteObject_sendFileURL_withTimeout_extraMetadata_responseHandlers_didSend_didQueue___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;

  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __91__BLTRemoteObject_sendFileURL_withTimeout_extraMetadata_responseHandlers_didSend_didQueue___block_invoke_2;
  v7[3] = &unk_24D761C10;
  v2 = *(void **)(a1 + 40);
  v8 = *(id *)(a1 + 32);
  v9 = v2;
  v10 = *(id *)(a1 + 48);
  v12 = *(id *)(a1 + 72);
  v11 = *(id *)(a1 + 56);
  v3 = *(_QWORD *)(a1 + 64);
  objc_msgSend(*(id *)(a1 + 48), "absoluteString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "relativeString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOWORD(v6) = 1;
  objc_msgSend(v8, "_queuePerformSend:responseToRequest:withTimeout:withDescription:shortDescription:onlyOneFor:allowCloudDelivery:nonWaking:didSend:andResponse:", v7, 0, v3, v4, v5, 0, v6, *(_QWORD *)(a1 + 80), 0);

}

uint64_t __91__BLTRemoteObject_sendFileURL_withTimeout_extraMetadata_responseHandlers_didSend_didQueue___block_invoke_2(uint64_t a1, void *a2, _QWORD *a3, _QWORD *a4, _QWORD *a5)
{
  id v7;
  void *v8;
  BLTPBFileURLMetaData *v9;
  void *v10;
  BLTPBFileURLMetaData *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  id v18;
  uint64_t v19;
  int v20;
  id v22;
  void *v25;
  id v26;
  id v27;

  v7 = a2;
  v8 = (void *)MEMORY[0x219A0BFAC](objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "lock"));
  v9 = [BLTPBFileURLMetaData alloc];
  objc_msgSend(*(id *)(a1 + 32), "sequenceNumberManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[BLTPBFileURLMetaData initWithSequenceNumberManager:extraMetadata:](v9, "initWithSequenceNumberManager:extraMetadata:", v10, *(_QWORD *)(a1 + 40));

  -[BLTPBFileURLMetaData transportData](v11, "transportData");
  v22 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "service");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = *(_QWORD *)(a1 + 48);
  -[BLTPBFileURLMetaData metadata](v11, "metadata");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", *MEMORY[0x24BE4F9C8]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0;
  v27 = 0;
  v25 = v7;
  v16 = objc_msgSend(v12, "sendResourceAtURL:metadata:toDestinations:priority:options:identifier:error:", v13, v14, v15, 300, v7, &v27, &v26);
  v17 = v27;
  v18 = v26;

  objc_autoreleasePoolPop(v8);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "unlock");
  v19 = *(_QWORD *)(a1 + 64);
  if (v19)
    (*(void (**)(void))(v19 + 16))();
  if (a3)
    *a3 = objc_retainAutorelease(v18);
  if (a4)
    *a4 = objc_retainAutorelease(v17);
  if (a5)
    *a5 = objc_retainAutorelease(v22);
  if (v18)
    v20 = 0;
  else
    v20 = v16;
  if (v20 == 1 && *(_QWORD *)(a1 + 56))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "addEntriesFromDictionary:");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 56), v17);
  }

  return v16;
}

- (void)service:(id)a3 devicesChanged:(id)a4
{
  NSObject *v5;
  uint8_t v6[16];

  blt_ids_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_2173D9000, v5, OS_LOG_TYPE_DEFAULT, "Devices changed!", v6, 2u);
  }

  -[BLTRemoteObject _updateConnectionStatusWithResetDefaulteDevice:](self, "_updateConnectionStatusWithResetDefaulteDevice:", 1);
}

- (void)service:(id)a3 nearbyDevicesChanged:(id)a4
{
  NSObject *v5;
  uint8_t v6[16];

  blt_ids_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_2173D9000, v5, OS_LOG_TYPE_DEFAULT, "Nearby devices changed!", v6, 2u);
  }

  -[BLTRemoteObject _updateConnectionStatusWithResetDefaulteDevice:](self, "_updateConnectionStatusWithResetDefaulteDevice:", 1);
}

- (void)_deviceConnectionStatusChanged:(id)a3
{
  NSObject *v4;
  uint8_t v5[16];

  blt_ids_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_2173D9000, v4, OS_LOG_TYPE_DEFAULT, "Device connection status changed!", v5, 2u);
  }

  -[BLTRemoteObject _updateConnectionStatus](self, "_updateConnectionStatus");
}

- (void)_removeAndHandleResponseHandler:(id)a3
{
  id v4;
  void *v5;
  NSObject *clientQueue;
  _QWORD block[4];
  id v8;

  v4 = a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_idsSendIDToResponseHandler, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[NSMutableDictionary removeObjectForKey:](self->_idsSendIDToResponseHandler, "removeObjectForKey:", v4);
    clientQueue = self->_clientQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __51__BLTRemoteObject__removeAndHandleResponseHandler___block_invoke;
    block[3] = &unk_24D761B98;
    v8 = v5;
    dispatch_async(clientQueue, block);

  }
}

uint64_t __51__BLTRemoteObject__removeAndHandleResponseHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7
{
  _BOOL8 v8;
  id v10;
  id v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[4];
  id v23;
  _BYTE v24[128];
  uint64_t v25;

  v8 = a6;
  v25 = *MEMORY[0x24BDAC8D0];
  v10 = a5;
  v11 = a7;
  -[BLTRemoteObject _idsQueueCallSendCompletionHandlerWithSuccess:identifier:error:](self, "_idsQueueCallSendCompletionHandlerWithSuccess:identifier:error:", v8, v10, v11);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_idsFileIDToResponseHandler, "objectForKeyedSubscript:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
    -[NSMutableDictionary removeObjectForKey:](self->_idsFileIDToResponseHandler, "removeObjectForKey:", v10);
  if (v11 || !v8)
  {
    _BLTLogIDSSendFail(-[BLTRemoteObject isPairedDeviceReady](self, "isPairedDeviceReady"), v11, v10);
    -[BLTRemoteObject _removeAndHandleResponseHandler:](self, "_removeAndHandleResponseHandler:", v10);
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v13 = v12;
    v14 = -[NSObject countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v19;
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v19 != v16)
            objc_enumerationMutation(v13);
          -[BLTRemoteObject _removeAndHandleResponseHandler:](self, "_removeAndHandleResponseHandler:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v17++), (_QWORD)v18);
        }
        while (v15 != v17);
        v15 = -[NSObject countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
      }
      while (v15);
    }
  }
  else
  {
    blt_ids_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v23 = v10;
      _os_log_impl(&dword_2173D9000, v13, OS_LOG_TYPE_DEFAULT, "IDS success sending request: %@", buf, 0xCu);
    }
  }

}

- (BOOL)_idsQueueCallSendCompletionHandlerWithSuccess:(BOOL)a3 identifier:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  void *v10;
  NSObject *clientQueue;
  _QWORD block[5];
  id v14;
  id v15;
  id v16;
  BOOL v17;

  v8 = a4;
  v9 = a5;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_idsSendIDToCompletionHandler, "objectForKeyedSubscript:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    -[NSMutableDictionary removeObjectForKey:](self->_idsSendIDToCompletionHandler, "removeObjectForKey:", v8);
    clientQueue = self->_clientQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __82__BLTRemoteObject__idsQueueCallSendCompletionHandlerWithSuccess_identifier_error___block_invoke;
    block[3] = &unk_24D761C60;
    v17 = a3;
    v16 = v10;
    block[4] = self;
    v14 = v9;
    v15 = v8;
    dispatch_async(clientQueue, block);

  }
  return v10 != 0;
}

void __82__BLTRemoteObject__idsQueueCallSendCompletionHandlerWithSuccess_identifier_error___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  id v3;

  v1 = *(unsigned __int8 *)(a1 + 64);
  v2 = *(_QWORD *)(a1 + 56);
  objc_msgSend(*(id *)(a1 + 32), "_wrapError:identifier:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t, id))(v2 + 16))(v2, v1, v3);

}

- (BOOL)_callSendCompletionHandlerWithSuccess:(BOOL)a3 identifier:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  NSObject *idsQueue;
  id v11;
  id v12;
  _QWORD block[5];
  id v15;
  id v16;
  uint64_t *v17;
  BOOL v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  char v22;

  v8 = a4;
  v9 = a5;
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0;
  idsQueue = self->_idsQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __74__BLTRemoteObject__callSendCompletionHandlerWithSuccess_identifier_error___block_invoke;
  block[3] = &unk_24D761C88;
  v18 = a3;
  block[4] = self;
  v15 = v8;
  v16 = v9;
  v17 = &v19;
  v11 = v9;
  v12 = v8;
  dispatch_sync(idsQueue, block);
  LOBYTE(idsQueue) = *((_BYTE *)v20 + 24);

  _Block_object_dispose(&v19, 8);
  return (char)idsQueue;
}

uint64_t __74__BLTRemoteObject__callSendCompletionHandlerWithSuccess_identifier_error___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_idsQueueCallSendCompletionHandlerWithSuccess:identifier:error:", *(unsigned __int8 *)(a1 + 64), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = result;
  return result;
}

- (void)service:(id)a3 account:(id)a4 incomingResourceAtURL:(id)a5 metadata:(id)a6 fromID:(id)a7 context:(id)a8
{
  id v14;
  BLTPBFileURLMetaData *v15;
  void *v16;
  BLTPBFileURLMetaData *v17;
  BLTSimpleCache *mruCacheOfReceives;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  char v37;
  NSObject *clientQueue;
  NSObject *v39;
  uint64_t v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  void *v46;
  _QWORD block[5];
  id v48;
  BLTPBFileURLMetaData *v49;
  __int128 *p_buf;
  id obj;
  uint8_t v52[4];
  id v53;
  __int16 v54;
  void *v55;
  __int16 v56;
  uint64_t v57;
  __int128 buf;
  uint64_t v59;
  uint64_t (*v60)(uint64_t, uint64_t);
  void (*v61)(uint64_t);
  id v62;
  uint64_t v63;

  v63 = *MEMORY[0x24BDAC8D0];
  v41 = a3;
  v42 = a4;
  v44 = a5;
  v45 = a6;
  v43 = a7;
  v14 = a8;
  v15 = [BLTPBFileURLMetaData alloc];
  -[BLTRemoteObject sequenceNumberManager](self, "sequenceNumberManager");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[BLTPBFileURLMetaData initWithMetadata:sequenceNumberManager:](v15, "initWithMetadata:sequenceNumberManager:", v45, v16);

  if (v17)
  {
    -[BLTPBFileURLMetaData transportData](v17, "transportData");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    mruCacheOfReceives = self->_mruCacheOfReceives;
    objc_msgSend(v14, "outgoingResponseIdentifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "incomingResponseIdentifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("incomingResource:%@"), v44);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", objc_msgSend(v46, "sequenceNumber"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    sessionUUIDFromTransportData(v46);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    +[BLTRemoteRequestLogItem remoteRequestLogItemWithIDSTransmitIdentifier:IDSResponseIdentifier:requestDescription:sequenceNumber:sessionIdentifier:sessionState:](BLTRemoteRequestLogItem, "remoteRequestLogItemWithIDSTransmitIdentifier:IDSResponseIdentifier:requestDescription:sequenceNumber:sessionIdentifier:sessionState:", v19, v20, v21, v22, v23, objc_msgSend(v46, "sessionState"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[BLTSimpleCache cacheObject:](mruCacheOfReceives, "cacheObject:", v24);

    -[BLTRemoteObject _handleNewSessionState:](self, "_handleNewSessionState:", -[BLTPBFileURLMetaData sessionState](v17, "sessionState"));
    v25 = -[BLTPBFileURLMetaData sequenceNumberError](v17, "sequenceNumberError");
    objc_msgSend(v14, "serviceIdentifier");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "outgoingResponseIdentifier");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v25) = -[BLTRemoteObject _sequenceErrorDidHappenAndHandled:service:incomingIdentifier:](self, "_sequenceErrorDidHappenAndHandled:service:incomingIdentifier:", v25, v26, v27);

    if ((v25 & 1) == 0)
    {
      blt_ids_log();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v14, "outgoingResponseIdentifier");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(buf) = 138412290;
        *(_QWORD *)((char *)&buf + 4) = v29;
        _os_log_impl(&dword_2173D9000, v28, OS_LOG_TYPE_DEFAULT, "Received resource with IDS identifier: %@", (uint8_t *)&buf, 0xCu);

      }
      *(_QWORD *)&buf = 0;
      *((_QWORD *)&buf + 1) = &buf;
      v59 = 0x3032000000;
      v60 = __Block_byref_object_copy__230;
      v61 = __Block_byref_object_dispose__231;
      v62 = 0;
      v30 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(v14, "serviceIdentifier");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "outgoingResponseIdentifier");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "stringWithFormat:", CFSTR("%@:%@"), v31, v32);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      BLTFileURLInPairingPath(v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      if (v34
        && (objc_msgSend(MEMORY[0x24BDD1580], "defaultManager"),
            v35 = (void *)objc_claimAutoreleasedReturnValue(),
            v36 = *((_QWORD *)&buf + 1),
            obj = *(id *)(*((_QWORD *)&buf + 1) + 40),
            v37 = objc_msgSend(v35, "copyItemAtURL:toURL:error:", v44, v34, &obj),
            objc_storeStrong((id *)(v36 + 40), obj),
            v35,
            (v37 & 1) != 0))
      {
        clientQueue = self->_clientQueue;
        block[0] = MEMORY[0x24BDAC760];
        block[1] = 3221225472;
        block[2] = __81__BLTRemoteObject_service_account_incomingResourceAtURL_metadata_fromID_context___block_invoke;
        block[3] = &unk_24D761CB0;
        block[4] = self;
        v48 = v34;
        v49 = v17;
        p_buf = &buf;
        dispatch_async(clientQueue, block);

      }
      else
      {
        blt_ids_log();
        v39 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
        {
          v40 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 40);
          *(_DWORD *)v52 = 138412802;
          v53 = v44;
          v54 = 2112;
          v55 = v34;
          v56 = 2112;
          v57 = v40;
          _os_log_error_impl(&dword_2173D9000, v39, OS_LOG_TYPE_ERROR, "Error creating link for incoming URL: %@ at %@ error: %@", v52, 0x20u);
        }

      }
      _Block_object_dispose(&buf, 8);

    }
  }

}

void __81__BLTRemoteObject_service_account_incomingResourceAtURL_metadata_fromID_context___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  id obj;

  v2 = *(void **)(a1 + 32);
  v3 = (uint64_t *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 48), "extraMetadata");
  v5 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFileURL:extraMetadata:", v4, v5);

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *v3;
  v9 = *(_QWORD *)(a1 + 56);
  v8 = a1 + 56;
  v10 = *(_QWORD *)(v9 + 8);
  obj = *(id *)(v10 + 40);
  LOBYTE(v5) = objc_msgSend(v6, "removeItemAtURL:error:", v7, &obj);
  objc_storeStrong((id *)(v10 + 40), obj);

  if ((v5 & 1) == 0)
  {
    blt_ids_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      __81__BLTRemoteObject_service_account_incomingResourceAtURL_metadata_fromID_context___block_invoke_cold_1(v3, v8, v11);

  }
}

- (OS_dispatch_queue)clientQueue
{
  return self->_clientQueue;
}

- (void)setClientQueue:(id)a3
{
  objc_storeStrong((id *)&self->_clientQueue, a3);
}

- (unint64_t)lastKnownConnectionStatus
{
  return self->_lastKnownConnectionStatus;
}

- (void)setLastKnownConnectionStatus:(unint64_t)a3
{
  self->_lastKnownConnectionStatus = a3;
}

- (BOOL)isPairedDeviceReady
{
  return self->_pairedDeviceReady;
}

- (void)setPairedDeviceReady:(BOOL)a3
{
  self->_pairedDeviceReady = a3;
}

- (BLTAbstractIDSService)service
{
  return self->_service;
}

- (BLTPBProtobufSequenceNumberManager)sequenceNumberManager
{
  return self->_sequenceNumberManager;
}

- (BLTSimpleCache)mruCacheOfSends
{
  return self->_mruCacheOfSends;
}

- (void)setMruCacheOfSends:(id)a3
{
  objc_storeStrong((id *)&self->_mruCacheOfSends, a3);
}

- (BLTSimpleCache)mruCacheOfReceives
{
  return self->_mruCacheOfReceives;
}

- (void)setMruCacheOfReceives:(id)a3
{
  objc_storeStrong((id *)&self->_mruCacheOfReceives, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mruCacheOfReceives, 0);
  objc_storeStrong((id *)&self->_mruCacheOfSends, 0);
  objc_storeStrong((id *)&self->_sequenceNumberManager, 0);
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_clientQueue, 0);
  objc_storeStrong((id *)&self->_connectionStatusQueue, 0);
  objc_storeStrong((id *)&self->_sequenceNumberSendLock, 0);
  objc_storeStrong((id *)&self->_idsRequestMessageTypeToSelector, 0);
  objc_storeStrong((id *)&self->_defaultPairedDevice, 0);
  objc_storeStrong((id *)&self->_idsQueue, 0);
  objc_storeStrong((id *)&self->_serviceName, 0);
  objc_storeStrong((id *)&self->_idsFileIDToResponseHandler, 0);
  objc_storeStrong((id *)&self->_idsSendIDToResponseHandler, 0);
  objc_storeStrong((id *)&self->_idsSendIDToCompletionHandler, 0);
}

- (void)_sequenceErrorDidHappenAndHandled:(uint64_t)a1 service:(uint64_t)a2 incomingIdentifier:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 138412546;
  *(_QWORD *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 2112;
  *(_QWORD *)&v3[14] = a2;
  OUTLINED_FUNCTION_0(&dword_2173D9000, a2, a3, "Out of order message received from IDS on %@ with identifer %@", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16], *MEMORY[0x24BDAC8D0]);
}

void __81__BLTRemoteObject_service_account_incomingResourceAtURL_metadata_fromID_context___block_invoke_cold_1(_QWORD *a1, uint64_t a2, NSObject *a3)
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 138412546;
  *(_QWORD *)&v3[4] = *a1;
  *(_WORD *)&v3[12] = 2112;
  *(_QWORD *)&v3[14] = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)a2 + 8) + 40);
  OUTLINED_FUNCTION_0(&dword_2173D9000, a2, a3, "Error removing %@ error: %@", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16], *MEMORY[0x24BDAC8D0]);
}

@end
