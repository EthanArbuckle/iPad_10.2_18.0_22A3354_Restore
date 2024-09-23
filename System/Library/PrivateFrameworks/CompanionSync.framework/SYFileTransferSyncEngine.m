@implementation SYFileTransferSyncEngine

- (SYFileTransferSyncEngine)initWithService:(id)a3 queue:(id)a4
{
  id v6;
  SYFileTransferSyncEngine *v7;
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
  uint64_t v18;
  NSMutableIndexSet *messageRows;
  uint64_t v20;
  NSMutableIndexSet *responseMessageRows;
  uint64_t v22;
  NSMutableArray *deferredIncomingSessions;
  uint64_t v24;
  NSMutableDictionary *messageIDsToSessionIDs;
  uint64_t v26;
  NSMutableSet *singleMessageUUIDs;
  SYFileTransferSyncEngine *v28;
  int relative_priority_ptr;
  objc_super v31;

  v6 = a3;
  v31.receiver = self;
  v31.super_class = (Class)SYFileTransferSyncEngine;
  v7 = -[SYSyncEngine initWithService:queue:](&v31, sel_initWithService_queue_, v6, a4);
  if (v7)
  {
    v8 = objc_alloc(MEMORY[0x24BDD17C8]);
    objc_msgSend(v6, "name");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "lastPathComponent");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v8, "initWithFormat:", CFSTR("%@ SYFileTransferSyncEngine IDS Queue"), v10);

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
    v7->_idsQueueLock._os_unfair_lock_opaque = 0;
    v7->_idsQueueIsSuspended = 0;
    v7->_idsQueueResumedLock = 0;
    v18 = objc_opt_new();
    messageRows = v7->_messageRows;
    v7->_messageRows = (NSMutableIndexSet *)v18;

    v20 = objc_opt_new();
    responseMessageRows = v7->_responseMessageRows;
    v7->_responseMessageRows = (NSMutableIndexSet *)v20;

    v22 = objc_opt_new();
    deferredIncomingSessions = v7->_deferredIncomingSessions;
    v7->_deferredIncomingSessions = (NSMutableArray *)v22;

    v7->_messageMapLock._os_unfair_lock_opaque = 0;
    v24 = objc_opt_new();
    messageIDsToSessionIDs = v7->_messageIDsToSessionIDs;
    v7->_messageIDsToSessionIDs = (NSMutableDictionary *)v24;

    v26 = objc_opt_new();
    singleMessageUUIDs = v7->_singleMessageUUIDs;
    v7->_singleMessageUUIDs = (NSMutableSet *)v26;

    v28 = v7;
  }

  return v7;
}

- (void)_suspendIdsQueue
{
  os_unfair_lock_s *p_idsQueueLock;

  p_idsQueueLock = &self->_idsQueueLock;
  os_unfair_lock_lock(&self->_idsQueueLock);
  if (!*(_WORD *)&self->_idsQueueIsSuspended)
  {
    self->_idsQueueIsSuspended = 1;
    dispatch_suspend((dispatch_object_t)self->_idsQueue);
  }
  os_unfair_lock_unlock(p_idsQueueLock);
}

- (void)_resumeIdsQueue
{
  os_unfair_lock_s *p_idsQueueLock;

  p_idsQueueLock = &self->_idsQueueLock;
  os_unfair_lock_lock(&self->_idsQueueLock);
  if (self->_idsQueueIsSuspended)
  {
    self->_idsQueueIsSuspended = 0;
    dispatch_resume((dispatch_object_t)self->_idsQueue);
  }
  os_unfair_lock_unlock(p_idsQueueLock);
}

- (void)dealloc
{
  IDSService *idsService;
  objc_super v4;

  -[IDSService removeDelegate:](self->_idsService, "removeDelegate:", self);
  os_unfair_lock_lock(&self->_idsQueueLock);
  self->_idsQueueResumedLock = 1;
  os_unfair_lock_unlock(&self->_idsQueueLock);
  -[SYFileTransferSyncEngine _resumeIdsQueue](self, "_resumeIdsQueue");
  idsService = self->_idsService;
  self->_idsService = 0;

  v4.receiver = self;
  v4.super_class = (Class)SYFileTransferSyncEngine;
  -[SYSyncEngine dealloc](&v4, sel_dealloc);
}

- (BOOL)resume:(id *)a3
{
  void *v4;
  id v5;
  void *v6;
  IDSService *v7;
  IDSService *idsService;
  SYDevice *v9;
  SYDevice *activeDevice;

  -[SYSyncEngine service](self, "service", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc(MEMORY[0x24BE4FCB8]);
  objc_msgSend(v4, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (IDSService *)objc_msgSend(v5, "initWithService:", v6);
  idsService = self->_idsService;
  self->_idsService = v7;

  -[IDSService addDelegate:queue:](self->_idsService, "addDelegate:queue:", self, self->_idsQueue);
  +[SYDevice targetableDevice](SYDevice, "targetableDevice");
  v9 = (SYDevice *)objc_claimAutoreleasedReturnValue();
  activeDevice = self->_activeDevice;
  self->_activeDevice = v9;

  return 1;
}

- (void)suspend
{
  IDSService *idsService;

  -[IDSService removeDelegate:](self->_idsService, "removeDelegate:", self);
  idsService = self->_idsService;
  self->_idsService = 0;

}

- (void)endFileTransferForStream:(id)a3 atURL:(id)a4 target:(id)a5 wasCancelled:(BOOL)a6 messageRows:(id)a7
{
  id v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  void *v30;
  void *v31;
  id v33;
  _QWORD v34[4];
  id v35;
  SYFileTransferSyncEngine *v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  _QWORD *v43;
  BOOL v44;
  _QWORD v45[5];
  IDSMessageContext *v46;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v33 = a7;
  -[IDSService devices](self->_idsService, "devices");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = v13;
  objc_msgSend(v13, "findMatchingIDSDeviceFromList:", v14);
  v15 = objc_claimAutoreleasedReturnValue();

  v30 = (void *)v15;
  v16 = (id)IDSCopyIDForDevice();
  if (!v16)
    v16 = (id)*MEMORY[0x24BE4FD60];
  -[SYSyncEngine service](self, "service");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "peerID");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[SYSyncEngine responder](self, "responder");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "extraTransportOptions");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  IDSOptionsFromSYServiceOptions(v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[SYFileTransferSyncEngine idsOptions:](self, "idsOptions:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v45[0] = 0;
  v45[1] = v45;
  v45[2] = 0x3032000000;
  v45[3] = __Block_byref_object_copy__13;
  v45[4] = __Block_byref_object_dispose__13;
  v46 = self->_inputPriorityBoostContext;
  v34[0] = MEMORY[0x24BDAC760];
  v34[1] = 3221225472;
  v34[2] = __91__SYFileTransferSyncEngine_endFileTransferForStream_atURL_target_wasCancelled_messageRows___block_invoke;
  v34[3] = &unk_24CC66C70;
  v23 = v11;
  v35 = v23;
  v36 = self;
  v44 = a6;
  v24 = v17;
  v37 = v24;
  v25 = v12;
  v38 = v25;
  v26 = v18;
  v39 = v26;
  v27 = v16;
  v40 = v27;
  v28 = v22;
  v41 = v28;
  v29 = v33;
  v42 = v29;
  v43 = v45;
  objc_msgSend(v23, "whenComplete:", v34);

  _Block_object_dispose(v45, 8);
}

void __91__SYFileTransferSyncEngine_endFileTransferForStream_atURL_target_wasCancelled_messageRows___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  id v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  _QWORD v15[4];
  id v16;
  id v17;
  uint64_t v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  uint64_t v24;
  char v25;

  if (_sync_log_facilities_pred != -1)
    _os_once();
  v2 = qword_253D84AC0;
  if (os_log_type_enabled((os_log_t)qword_253D84AC0, OS_LOG_TYPE_DEBUG))
    __91__SYFileTransferSyncEngine_endFileTransferForStream_atURL_target_wasCancelled_messageRows___block_invoke_cold_1(a1, v2, v3, v4, v5, v6, v7, v8);
  objc_msgSend(*(id *)(a1 + 32), "close");
  v9 = *(void **)(a1 + 32);
  v10 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 168);
  v15[0] = MEMORY[0x24BDAC760];
  v15[2] = __91__SYFileTransferSyncEngine_endFileTransferForStream_atURL_target_wasCancelled_messageRows___block_invoke_53;
  v15[3] = &unk_24CC66C70;
  v25 = *(_BYTE *)(a1 + 104);
  v15[1] = 3221225472;
  v16 = v9;
  v11 = *(id *)(a1 + 48);
  v12 = *(_QWORD *)(a1 + 40);
  v17 = v11;
  v18 = v12;
  v19 = *(id *)(a1 + 56);
  v20 = *(id *)(a1 + 64);
  v21 = *(id *)(a1 + 72);
  v22 = *(id *)(a1 + 80);
  v13 = *(id *)(a1 + 88);
  v14 = *(_QWORD *)(a1 + 96);
  v23 = v13;
  v24 = v14;
  dispatch_async(v10, v15);

}

void __91__SYFileTransferSyncEngine_endFileTransferForStream_atURL_target_wasCancelled_messageRows___block_invoke_53(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  const char *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  id v22;
  id v23;
  NSObject *v24;
  uint64_t v25;
  void *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  void *v38;
  NSObject *v39;
  _QWORD block[5];
  id v41;
  id v42;
  uint8_t buf[4];
  uint64_t v44;
  __int16 v45;
  id v46;
  _QWORD v47[4];
  _QWORD v48[5];

  v48[4] = *MEMORY[0x24BDAC8D0];
  if (*(_BYTE *)(a1 + 104))
  {
    if (_sync_log_facilities_pred != -1)
      _os_once();
    v2 = qword_253D84AC0;
    if (os_log_type_enabled((os_log_t)qword_253D84AC0, OS_LOG_TYPE_DEFAULT))
    {
      v3 = *(_QWORD *)(a1 + 56);
      *(_DWORD *)buf = 138412290;
      v44 = v3;
      v4 = "Outgoing file-transfer unnecessary - removing output file at URL %@";
LABEL_38:
      _os_log_impl(&dword_211704000, v2, OS_LOG_TYPE_DEFAULT, v4, buf, 0xCu);
    }
  }
  else
  {
    if (objc_msgSend(*(id *)(a1 + 32), "hasWrittenData"))
    {
      objc_msgSend(*(id *)(a1 + 40), "options");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("SYServiceOptionEnableCRC"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "integerValue");

      if (v7)
        v8 = objc_msgSend(*(id *)(a1 + 48), "_crcChecksum:", *(_QWORD *)(a1 + 56));
      else
        v8 = 0;
      v47[0] = CFSTR("ContainsSession");
      v47[1] = CFSTR("PeerID");
      v10 = *(_QWORD *)(a1 + 64);
      v48[0] = MEMORY[0x24BDBD1C8];
      v48[1] = v10;
      v47[2] = CFSTR("EnqueuedAt");
      v11 = (void *)objc_opt_new();
      v48[2] = v11;
      v47[3] = CFSTR("CRC");
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", v8);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v48[3] = v12;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v48, v47, 4);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v14 = *(_QWORD *)(a1 + 56);
      v15 = *(void **)(*(_QWORD *)(a1 + 48) + 128);
      objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", *(_QWORD *)(a1 + 72));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(*(id *)(a1 + 40), "priority");
      v18 = 100;
      if (!v17)
        v18 = 200;
      v19 = *(_QWORD *)(a1 + 80);
      if (v17 == 20)
        v20 = 300;
      else
        v20 = v18;
      v41 = 0;
      v42 = 0;
      v21 = objc_msgSend(v15, "sendResourceAtURL:metadata:toDestinations:priority:options:identifier:error:", v14, v13, v16, v20, v19, &v42, &v41);
      v22 = v42;
      v23 = v41;

      if ((v21 & 1) != 0)
      {
        if (_sync_log_facilities_pred != -1)
          _os_once();
        v24 = qword_253D84AC0;
        if (os_log_type_enabled((os_log_t)qword_253D84AC0, OS_LOG_TYPE_DEFAULT))
        {
          v25 = *(_QWORD *)(a1 + 56);
          *(_DWORD *)buf = 138412546;
          v44 = v25;
          v45 = 2114;
          v46 = v22;
          _os_log_impl(&dword_211704000, v24, OS_LOG_TYPE_DEFAULT, "Sent file at %@ via IDS, got identifier %{public}@", buf, 0x16u);
        }
        if (_sync_log_facilities_pred != -1)
          _os_once();
        if (os_log_type_enabled((os_log_t)qword_253D84AF0, OS_LOG_TYPE_DEBUG))
          -[SYMessengerSyncEngine messageCenter:didResolveIDSIdentifier:forFileTransfer:].cold.1();
        os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 48) + 216));
        objc_msgSend(*(id *)(a1 + 32), "streamPropertyForKey:", SYAssociatedSessionIdentifierPropertyKey);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 224), "setObject:forKeyedSubscript:", v26, v22);

        os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 48) + 216));
        objc_msgSend(*(id *)(a1 + 48), "responder");
        v27 = objc_claimAutoreleasedReturnValue();
        -[NSObject enqueuedMessageWithID:context:](v27, "enqueuedMessageWithID:context:", v22, 0);
      }
      else
      {
        +[SYTransportLog sharedInstance](SYTransportLog, "sharedInstance");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "oslog");
        v27 = objc_claimAutoreleasedReturnValue();

        if (os_log_type_enabled(v27, (os_log_type_t)0x90u))
          __91__SYFileTransferSyncEngine_endFileTransferForStream_atURL_target_wasCancelled_messageRows___block_invoke_53_cold_2(a1 + 56, v23, v27);
      }

      +[SYStatisticStore sharedInstance](SYStatisticStore, "sharedInstance");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = *(_QWORD *)(a1 + 56);
      objc_msgSend(*(id *)(a1 + 40), "name");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "recordOutgoingFileTransferAtURL:metadata:identifier:error:forService:", v30, v13, v22, v23, v31);

      if (v22)
      {
        +[SYStatisticStore sharedInstance](SYStatisticStore, "sharedInstance");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "setFileTransferIdentifier:forOutgoingMessagesWithRowIDs:", v22, *(_QWORD *)(a1 + 88));

      }
    }
    else
    {
      if (_sync_log_facilities_pred != -1)
        _os_once();
      v9 = qword_253D84AC0;
      if (os_log_type_enabled((os_log_t)qword_253D84AC0, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_211704000, v9, OS_LOG_TYPE_DEFAULT, "Output file contains no data, not sending anything.", buf, 2u);
      }
    }
    if (_sync_log_facilities_pred != -1)
      _os_once();
    v2 = qword_253D84AC0;
    if (os_log_type_enabled((os_log_t)qword_253D84AC0, OS_LOG_TYPE_DEFAULT))
    {
      v33 = *(_QWORD *)(a1 + 56);
      *(_DWORD *)buf = 138412290;
      v44 = v33;
      v4 = "Removing output file at %@";
      goto LABEL_38;
    }
  }
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "removeItemAtURL:error:", *(_QWORD *)(a1 + 56), 0);

  v35 = *(_QWORD *)(a1 + 48);
  v36 = *(void **)(v35 + 232);
  *(_QWORD *)(v35 + 232) = 0;

  v37 = *(_QWORD *)(*(_QWORD *)(a1 + 96) + 8);
  v38 = *(void **)(v37 + 40);
  *(_QWORD *)(v37 + 40) = 0;

  objc_msgSend(*(id *)(a1 + 48), "queue");
  v39 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __91__SYFileTransferSyncEngine_endFileTransferForStream_atURL_target_wasCancelled_messageRows___block_invoke_61;
  block[3] = &unk_24CC65418;
  block[4] = *(_QWORD *)(a1 + 48);
  dispatch_async(v39, block);

}

void __91__SYFileTransferSyncEngine_endFileTransferForStream_atURL_target_wasCancelled_messageRows___block_invoke_61(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 200), "firstObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 200), "removeObjectAtIndex:", 0);
    if (_sync_log_facilities_pred != -1)
      _os_once();
    v3 = (void *)qword_253D84AC0;
    if (os_log_type_enabled((os_log_t)qword_253D84AC0, OS_LOG_TYPE_DEFAULT))
    {
      v4 = v3;
      objc_msgSend(v2, "identifier");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543362;
      v12 = v5;
      _os_log_impl(&dword_211704000, v4, OS_LOG_TYPE_DEFAULT, "Retrying deferred incoming session with identifier %{public}@", (uint8_t *)&v11, 0xCu);

    }
    v6 = *(void **)(a1 + 32);
    objc_msgSend(v2, "resourceURL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "metadata");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "idsContext");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_handleIncomingSessionFileAtOwnedURL:metadata:identifier:idsContext:", v7, v8, v9, v10);

  }
}

- (void)beginResponseSession
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0_1(&dword_211704000, v0, v1, "Failed to get new temporary item url: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)endResponseSession
{
  NSURL *v3;
  _SYOutputStreamer *v4;
  void *v5;
  _BOOL4 responsesCanceled;
  NSObject *v7;
  NSURL *responseFileURL;
  _SYOutputStreamer *responseStream;
  OS_os_transaction *v10;
  OS_os_transaction *closureTransaction;
  OS_os_transaction *responseSessionTransaction;
  int v13;
  SYFileTransferSyncEngine *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = self->_responseFileURL;
  v4 = self->_responseStream;
  v5 = (void *)-[NSMutableIndexSet copy](self->_responseMessageRows, "copy");
  responsesCanceled = self->_responsesCanceled;
  -[NSMutableIndexSet removeAllIndexes](self->_responseMessageRows, "removeAllIndexes");
  if (_sync_log_facilities_pred != -1)
    _os_once();
  v7 = qword_253D84AC0;
  if (os_log_type_enabled((os_log_t)qword_253D84AC0, OS_LOG_TYPE_INFO))
  {
    v13 = 134217984;
    v14 = self;
    _os_log_impl(&dword_211704000, v7, OS_LOG_TYPE_INFO, "Ending file-transfer response session for engine %p", (uint8_t *)&v13, 0xCu);
  }
  responseFileURL = self->_responseFileURL;
  self->_responseFileURL = 0;

  responseStream = self->_responseStream;
  self->_responseStream = 0;

  self->_responsesCanceled = 0;
  self->_sessionCanceled = 0;
  v10 = (OS_os_transaction *)os_transaction_create();
  closureTransaction = self->_closureTransaction;
  self->_closureTransaction = v10;

  responseSessionTransaction = self->_responseSessionTransaction;
  self->_responseSessionTransaction = 0;

  -[SYFileTransferSyncEngine endFileTransferForStream:atURL:target:wasCancelled:messageRows:](self, "endFileTransferForStream:atURL:target:wasCancelled:messageRows:", v4, v3, self->_responseDevice, responsesCanceled, v5);
}

- (void)beginSession
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0_1(&dword_211704000, v0, v1, "Failed to get new temporary item URL: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)endSession
{
  _BOOL4 sessionCanceled;
  NSURL *v4;
  _SYOutputStreamer *v5;
  void *v6;
  NSObject *v7;
  NSURL *outputFileURL;
  _SYOutputStreamer *outputStream;
  SYStartSyncSession *sessionStartMessage;
  OS_os_transaction *v11;
  OS_os_transaction *closureTransaction;
  objc_super v13;
  uint8_t buf[4];
  SYFileTransferSyncEngine *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  if (self->_inSession)
  {
    self->_inSession = 0;
    sessionCanceled = self->_sessionCanceled;
    v4 = self->_outputFileURL;
    v5 = self->_outputStream;
    v6 = (void *)-[NSMutableIndexSet copy](self->_messageRows, "copy");
    -[NSMutableIndexSet removeAllIndexes](self->_messageRows, "removeAllIndexes");
    if (_sync_log_facilities_pred != -1)
      _os_once();
    v7 = qword_253D84AC0;
    if (os_log_type_enabled((os_log_t)qword_253D84AC0, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      v15 = self;
      _os_log_impl(&dword_211704000, v7, OS_LOG_TYPE_INFO, "Ending file-transfer outgoing session for engine %p", buf, 0xCu);
    }
    outputFileURL = self->_outputFileURL;
    self->_outputFileURL = 0;

    outputStream = self->_outputStream;
    self->_outputStream = 0;

    self->_sessionCanceled = 0;
    self->_responsesCanceled = 0;
    self->_inSession = 0;
    sessionStartMessage = self->_sessionStartMessage;
    self->_sessionStartMessage = 0;

    v11 = (OS_os_transaction *)os_transaction_create();
    closureTransaction = self->_closureTransaction;
    self->_closureTransaction = v11;

    v13.receiver = self;
    v13.super_class = (Class)SYFileTransferSyncEngine;
    -[SYSyncEngine endSession](&v13, sel_endSession);
    -[SYFileTransferSyncEngine endFileTransferForStream:atURL:target:wasCancelled:messageRows:](self, "endFileTransferForStream:atURL:target:wasCancelled:messageRows:", v5, v4, self->_sessionDevice, sessionCanceled, v6);

  }
}

- (BOOL)isInSession
{
  return self->_inSession;
}

- (BOOL)buffersSessions
{
  return 1;
}

- (BOOL)buffersHandshake
{
  return !-[SYFileTransferSyncEngine _sessionDeviceCanUseSingleMessages](self, "_sessionDeviceCanUseSingleMessages");
}

- (BOOL)targetIsNearby
{
  _BOOL4 v3;
  SYDevice *activeDevice;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  int v10;
  const char *v11;
  char v12;
  int v13;
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = -[SYDevice hasCachedNearby](self->_activeDevice, "hasCachedNearby");
  activeDevice = self->_activeDevice;
  if (v3)
    return -[SYDevice cachedIsNearby](self->_activeDevice, "cachedIsNearby");
  -[IDSService devices](self->_idsService, "devices");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SYDevice findMatchingIDSDeviceFromList:](activeDevice, "findMatchingIDSDeviceFromList:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    if (_sync_log_facilities_pred != -1)
      _os_once();
    v8 = (void *)qword_253D84AC0;
    if (os_log_type_enabled((os_log_t)qword_253D84AC0, OS_LOG_TYPE_DEFAULT))
    {
      v9 = v8;
      v10 = objc_msgSend(v7, "isNearby");
      v11 = "not ";
      if (v10)
        v11 = "";
      v13 = 136315138;
      v14 = v11;
      _os_log_impl(&dword_211704000, v9, OS_LOG_TYPE_DEFAULT, "Target device is %snearby, caching value.", (uint8_t *)&v13, 0xCu);

    }
    -[SYDevice setCachedIsNearby:](self->_activeDevice, "setCachedIsNearby:", objc_msgSend(v7, "isNearby"));
    -[SYDevice setHasCachedNearby:](self->_activeDevice, "setHasCachedNearby:", 1);
    v12 = objc_msgSend(v7, "isNearby");
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (BOOL)_sessionDeviceCanUseSingleMessages
{
  SYDevice *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  uint64_t v8;

  v3 = self->_sessionDevice;
  if (!v3)
    v3 = self->_activeDevice;
  v4 = -[SYDevice deviceCode](v3, "deviceCode");
  -[SYDevice systemBuildVersion](v3, "systemBuildVersion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4 == 5)
    v7 = CFSTR("14S184");
  else
    v7 = CFSTR("14A187");
  v8 = objc_msgSend(v5, "compare:", v7);

  return v8 != -1;
}

- (void)_enqueueSingleMessage:(id)a3 withMessageID:(unsigned __int16)a4 priority:(int64_t)a5 options:(id)a6 userContext:(id)a7 callback:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  SYStartSyncSession *sessionStartMessage;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  void *v31;
  _QWORD block[5];
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  int64_t v38;
  unsigned __int16 v39;

  v14 = a3;
  v15 = a6;
  v16 = a7;
  v17 = a8;
  if (self->_inSession)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      sessionStartMessage = self->_sessionStartMessage;
      self->_sessionStartMessage = 0;

    }
  }
  v19 = (void *)objc_msgSend(v17, "copy");

  -[SYSyncEngine responder](self, "responder");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "extraTransportOptions");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  CoalesceOptionDictionaries(v21, v15);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  -[SYSyncEngine service](self, "service");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "name");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[SYSyncEngine queue](self, "queue");
  v31 = v15;
  v25 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __102__SYFileTransferSyncEngine__enqueueSingleMessage_withMessageID_priority_options_userContext_callback___block_invoke;
  block[3] = &unk_24CC66C98;
  v39 = a4;
  block[4] = self;
  v33 = v14;
  v34 = v16;
  v35 = v24;
  v36 = v22;
  v37 = v19;
  v38 = a5;
  v26 = v22;
  v27 = v24;
  v28 = v16;
  v29 = v14;
  v30 = v19;
  dispatch_async(v25, block);

}

void __102__SYFileTransferSyncEngine__enqueueSingleMessage_withMessageID_priority_options_userContext_callback___block_invoke(uint64_t a1)
{
  NSObject *v2;
  int v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  int v23;
  id v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  int v30;
  void *v31;
  int v32;
  NSObject *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  id v37;
  id v38;
  id v39;
  id v40;
  uint64_t v41;
  uint8_t buf[4];
  int v43;
  __int16 v44;
  uint64_t v45;
  __int16 v46;
  id v47;
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 128))
  {
    if (_sync_log_facilities_pred != -1)
      _os_once();
    v2 = qword_253D84AC0;
    if (os_log_type_enabled((os_log_t)qword_253D84AC0, OS_LOG_TYPE_DEFAULT))
    {
      v3 = *(unsigned __int16 *)(a1 + 88);
      *(_DWORD *)buf = 67109120;
      v43 = v3;
      _os_log_impl(&dword_211704000, v2, OS_LOG_TYPE_DEFAULT, "Enqueueing %{companionsync:SYMessageID}hu for transfer using IDS messaging", buf, 8u);
    }
    objc_msgSend(*(id *)(a1 + 32), "_wrapMessage:ofType:userInfo:", *(_QWORD *)(a1 + 40), *(unsigned __int16 *)(a1 + 88), *(_QWORD *)(a1 + 48));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[SYStatisticStore sharedInstance](SYStatisticStore, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "recordOutgoingMessage:forService:", v4, *(_QWORD *)(a1 + 56));

    +[SYStatisticStore sharedInstance](SYStatisticStore, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "rowIDForPartialMessage:", v4);

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 184), "addIndex:", v7);
    objc_msgSend(*(id *)(a1 + 40), "data");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = 0;
    LOWORD(v41) = *(_WORD *)(a1 + 88);
    HIDWORD(v41) = objc_msgSend(v8, "length");
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEC8]), "initWithBytes:length:", &v41, 8);
    objc_msgSend(v9, "appendData:", v8);
    v10 = *(_QWORD *)(a1 + 32);
    v11 = *(void **)(v10 + 136);
    objc_msgSend(*(id *)(v10 + 128), "devices");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "findMatchingIDSDeviceFromList:", v12);
    v13 = objc_claimAutoreleasedReturnValue();

    v37 = (id)v13;
    v14 = (id)IDSCopyIDForDevice();
    if (!v14)
      v14 = (id)*MEMORY[0x24BE4FD60];
    v15 = *(void **)(a1 + 32);
    IDSOptionsFromSYServiceOptions(*(void **)(a1 + 64));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "idsOptions:forFileTransfer:", v16, 0);
    v17 = objc_claimAutoreleasedReturnValue();

    v18 = *(_QWORD *)(a1 + 80);
    v19 = 100;
    if (!v18)
      v19 = 200;
    if (v18 == 20)
      v20 = 300;
    else
      v20 = v19;
    v21 = *(void **)(*(_QWORD *)(a1 + 32) + 128);
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", v14);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = 0;
    v40 = 0;
    v36 = (void *)v17;
    v23 = objc_msgSend(v21, "sendData:toDestinations:priority:options:identifier:error:", v9, v22, v20, v17, &v40, &v39);
    v24 = v40;
    v25 = v39;

    if (v23)
    {
      +[SYStatisticStore sharedInstance](SYStatisticStore, "sharedInstance");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "assignIdentifier:toOutgoingMessage:", v24, v4);

      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 208), "addObject:", v24);
      objc_msgSend(*(id *)(a1 + 32), "responder");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "enqueuedMessageWithID:context:", v24, *(_QWORD *)(a1 + 48));

      os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 216));
      objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", 0x24CC69840);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 224), "setObject:forKeyedSubscript:", v28, v24);

      os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 216));
      if (_sync_log_facilities_pred != -1)
        _os_once();
      v29 = qword_253D84AC0;
      if (os_log_type_enabled((os_log_t)qword_253D84AC0, OS_LOG_TYPE_INFO))
      {
        v30 = *(unsigned __int16 *)(a1 + 88);
        *(_DWORD *)buf = 67109378;
        v43 = v30;
        v44 = 2114;
        v45 = (uint64_t)v24;
        _os_log_impl(&dword_211704000, v29, OS_LOG_TYPE_INFO, "Sent %{companionsync:SYMessageID}hu, got identifier %{public}@", buf, 0x12u);
      }
      if (_sync_log_facilities_pred != -1)
        _os_once();
      v31 = (void *)qword_253D84AF0;
      if (os_log_type_enabled((os_log_t)qword_253D84AF0, OS_LOG_TYPE_DEBUG))
      {
        v32 = *(unsigned __int16 *)(a1 + 88);
        v33 = v31;
        v34 = objc_msgSend(v9, "length");
        *(_DWORD *)buf = 67109634;
        v43 = v32;
        v44 = 2048;
        v45 = v34;
        v46 = 2114;
        v47 = v24;
        _os_log_debug_impl(&dword_211704000, v33, OS_LOG_TYPE_DEBUG, "Sent %{companionsync:SYMessageID}hu, %lu bytes: %{public}@", buf, 0x1Cu);

      }
    }
    else
    {
      if (_sync_log_facilities_pred != -1)
        _os_once();
      if (os_log_type_enabled((os_log_t)qword_253D84AC0, OS_LOG_TYPE_ERROR))
        __102__SYFileTransferSyncEngine__enqueueSingleMessage_withMessageID_priority_options_userContext_callback___block_invoke_cold_1();
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();

  }
  else
  {
    v35 = *(_QWORD *)(a1 + 72);
    v38 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithSYError:userInfo:", 2001, 0);
    (*(void (**)(uint64_t, _QWORD, _QWORD))(v35 + 16))(v35, 0, 0);

  }
}

- (void)enqueueSyncRequest:(id)a3 withMessageID:(unsigned __int16)a4 priority:(int64_t)a5 options:(id)a6 userContext:(id)a7 callback:(id)a8
{
  uint64_t v12;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  int v20;
  NSObject *v21;
  id v22;
  NSObject *v23;
  BOOL v24;
  NSObject *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  id v29;
  _QWORD v30[5];
  id v31;
  id v32;
  id v33;
  id v34;
  __int16 v35;
  BOOL v36;
  uint8_t buf[4];
  id v38;
  uint64_t v39;

  v12 = a4;
  v39 = *MEMORY[0x24BDAC8D0];
  v15 = a3;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  if (!self->_idsService)
    _os_assumes_log();
  objc_msgSend(v16, "objectForKeyedSubscript:", 0x24CC6A380);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "BOOLValue");

  if (v20 && -[SYFileTransferSyncEngine _sessionDeviceCanUseSingleMessages](self, "_sessionDeviceCanUseSingleMessages"))
  {
    -[SYFileTransferSyncEngine _enqueueSingleMessage:withMessageID:priority:options:userContext:callback:](self, "_enqueueSingleMessage:withMessageID:priority:options:userContext:callback:", v15, v12, a5, v16, v17, v18);
    goto LABEL_37;
  }
  if (!self->_inSession)
    goto LABEL_31;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (_sync_log_facilities_pred != -1)
      _os_once();
    if (os_log_type_enabled((os_log_t)qword_253D84AC0, OS_LOG_TYPE_DEBUG))
      -[SYFileTransferSyncEngine enqueueSyncRequest:withMessageID:priority:options:userContext:callback:].cold.1();
    objc_storeStrong((id *)&self->_sessionStartMessage, a3);
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || !self->_sessionStartMessage)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v22 = v15;
      if (objc_msgSend(v22, "hasError") && self->_sessionStartMessage)
      {
        if (_sync_log_facilities_pred != -1)
          _os_once();
        v23 = qword_253D84AC0;
        if (os_log_type_enabled((os_log_t)qword_253D84AC0, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_211704000, v23, OS_LOG_TYPE_DEFAULT, "File-transfer engine cancelling session ending in an error", buf, 2u);
        }
        -[SYFileTransferSyncEngine _cancelSession](self, "_cancelSession");
      }

    }
    if (self->_inSession)
    {
      v24 = !self->_inSession;
LABEL_36:
      -[SYSyncEngine service](self, "service");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "name");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[SYSyncEngine queue](self, "queue");
      v28 = objc_claimAutoreleasedReturnValue();
      v30[0] = MEMORY[0x24BDAC760];
      v30[1] = 3221225472;
      v30[2] = __99__SYFileTransferSyncEngine_enqueueSyncRequest_withMessageID_priority_options_userContext_callback___block_invoke;
      v30[3] = &unk_24CC66CE8;
      v30[4] = self;
      v34 = v18;
      v36 = v24;
      v31 = v15;
      v35 = v12;
      v32 = v17;
      v33 = v27;
      v29 = v27;
      dispatch_async(v28, v30);

      goto LABEL_37;
    }
LABEL_31:
    if (_sync_log_facilities_pred != -1)
      _os_once();
    v25 = qword_253D84AB8;
    if (os_log_type_enabled((os_log_t)qword_253D84AB8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_211704000, v25, OS_LOG_TYPE_DEFAULT, "File-transfer engine creating a one-message session", buf, 2u);
    }
    -[SYFileTransferSyncEngine beginSession](self, "beginSession");
    v24 = 1;
    goto LABEL_36;
  }
  if (_sync_log_facilities_pred != -1)
    _os_once();
  v21 = qword_253D84AC0;
  if (os_log_type_enabled((os_log_t)qword_253D84AC0, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v38 = v15;
    _os_log_impl(&dword_211704000, v21, OS_LOG_TYPE_DEFAULT, "File-transfer engine eliding restart request %p", buf, 0xCu);
  }
  -[SYFileTransferSyncEngine _handleSessionRestart:priority:options:userContext:callback:](self, "_handleSessionRestart:priority:options:userContext:callback:", v15, a5, v16, v17, v18);
LABEL_37:

}

void __99__SYFileTransferSyncEngine_enqueueSyncRequest_withMessageID_priority_options_userContext_callback___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  NSObject *v4;
  objc_class *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  NSObject *v20;
  _QWORD v21[5];
  id v22;
  id v23;
  char v24;
  _BYTE buf[24];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v2 + 128) && *(_QWORD *)(v2 + 72))
  {
    if (_sync_log_facilities_pred != -1)
      _os_once();
    v3 = (void *)qword_253D84AC0;
    if (os_log_type_enabled((os_log_t)qword_253D84AC0, OS_LOG_TYPE_DEFAULT))
    {
      v4 = v3;
      v5 = (objc_class *)objc_opt_class();
      NSStringFromClass(v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v6;
      _os_log_impl(&dword_211704000, v4, OS_LOG_TYPE_DEFAULT, "Enqueueing %{public}@ message", buf, 0xCu);

    }
    objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", 0x24CC69840);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "setStreamProperty:forKey:", v7, SYAssociatedSessionIdentifierPropertyKey);
    objc_msgSend(*(id *)(a1 + 32), "_wrapMessage:ofType:userInfo:", *(_QWORD *)(a1 + 40), *(unsigned __int16 *)(a1 + 72), *(_QWORD *)(a1 + 48));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[SYStatisticStore sharedInstance](SYStatisticStore, "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "recordOutgoingMessage:forService:", v8, *(_QWORD *)(a1 + 56));

    +[SYStatisticStore sharedInstance](SYStatisticStore, "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "rowIDForPartialMessage:", v8);

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 184), "addIndex:", v11);
    objc_msgSend(*(id *)(a1 + 40), "data");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)buf = 0;
    *(_WORD *)buf = *(_WORD *)(a1 + 72);
    *(_DWORD *)&buf[4] = objc_msgSend(v12, "length");
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEC8]), "initWithBytes:length:", buf, 8);
    objc_msgSend(v13, "appendData:", v12);
    v14 = *(void **)(*(_QWORD *)(a1 + 32) + 72);
    v21[0] = MEMORY[0x24BDAC760];
    v21[1] = 3221225472;
    v21[2] = __99__SYFileTransferSyncEngine_enqueueSyncRequest_withMessageID_priority_options_userContext_callback___block_invoke_82;
    v21[3] = &unk_24CC66CC0;
    v15 = *(id *)(a1 + 64);
    v24 = *(_BYTE *)(a1 + 74);
    v16 = *(_QWORD *)(a1 + 32);
    v17 = *(void **)(a1 + 40);
    v23 = v15;
    v21[4] = v16;
    v22 = v17;
    objc_msgSend(v14, "writeData:completion:", v13, v21);

  }
  else
  {
    v18 = *(_QWORD *)(a1 + 64);
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithSYError:userInfo:", 2001, 0);
    (*(void (**)(uint64_t, _QWORD, _QWORD, void *))(v18 + 16))(v18, 0, 0, v19);

    if (*(_BYTE *)(a1 + 74))
    {
      if (_sync_log_facilities_pred != -1)
        _os_once();
      v20 = qword_253D84AC0;
      if (os_log_type_enabled((os_log_t)qword_253D84AC0, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_211704000, v20, OS_LOG_TYPE_DEFAULT, "Cancelling one-message file-transfer session: no IDSService or no output stream available", buf, 2u);
      }
      objc_msgSend(*(id *)(a1 + 32), "_cancelSession");
      objc_msgSend(*(id *)(a1 + 32), "endSession");
    }
  }
}

void __99__SYFileTransferSyncEngine_enqueueSyncRequest_withMessageID_priority_options_userContext_callback___block_invoke_82(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  id *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  uint8_t v11[16];
  uint8_t buf[16];

  v5 = a3;
  if (v5 && (a2 & 1) == 0)
  {
    if (_sync_log_facilities_pred != -1)
      _os_once();
    if (os_log_type_enabled((os_log_t)qword_253D84AC0, OS_LOG_TYPE_ERROR))
      __99__SYFileTransferSyncEngine_enqueueSyncRequest_withMessageID_priority_options_userContext_callback___block_invoke_82_cold_1();
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  if (*(_BYTE *)(a1 + 56))
  {
    if ((a2 & 1) == 0)
    {
      if (_sync_log_facilities_pred != -1)
        _os_once();
      v6 = qword_253D84AC0;
      if (os_log_type_enabled((os_log_t)qword_253D84AC0, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_211704000, v6, OS_LOG_TYPE_DEFAULT, "Cancelling one-message file-transfer session, since the data couldn't be written to the file", buf, 2u);
      }
      objc_msgSend(*(id *)(a1 + 32), "_cancelSession");
    }
    v7 = (id *)(a1 + 32);
  }
  else
  {
    v8 = *(void **)(a1 + 32);
    v9 = *(_QWORD *)(a1 + 40);
    v7 = (id *)(a1 + 32);
    if (!objc_msgSend(v8, "_shouldTreatAsSessionEnd:", v9))
      goto LABEL_16;
    if ((a2 & 1) == 0)
    {
      if (_sync_log_facilities_pred != -1)
        _os_once();
      v10 = qword_253D84AC0;
      if (os_log_type_enabled((os_log_t)qword_253D84AC0, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v11 = 0;
        _os_log_impl(&dword_211704000, v10, OS_LOG_TYPE_DEFAULT, "Cancelling file-transfer session, since the session-end message couldn't be written to the file", v11, 2u);
      }
      objc_msgSend(*v7, "_cancelSession");
    }
  }
  objc_msgSend(*v7, "endSession");
LABEL_16:

}

- (id)outputStreamWithMetadata:(id)a3 priority:(int64_t)a4 options:(id)a5 context:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  SYDevice *activeDevice;
  void *v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  id v28;
  void *v29;
  _QWORD v30[4];
  id v31;
  SYFileTransferSyncEngine *v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37[3];
  id location;

  v12 = a3;
  v13 = a5;
  v14 = a6;
  if (!self->_idsService)
    _os_assumes_log();
  objc_msgSend(MEMORY[0x24BDBCF48], "_SYURLForNewTemporaryFile:", a7);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    v28 = v14;
    v29 = (void *)a4;
    activeDevice = self->_activeDevice;
    -[IDSService devices](self->_idsService, "devices");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[SYDevice findMatchingIDSDeviceFromList:](activeDevice, "findMatchingIDSDeviceFromList:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = (id)IDSCopyIDForDevice();
    if (!v19)
      v19 = (id)*MEMORY[0x24BE4FD60];
    v20 = -[SYCompressedFileOutputStream initToCompressedFileAtURL:shouldAppend:]([SYCompressedFileOutputStream alloc], "initToCompressedFileAtURL:shouldAppend:", v15, 0);
    -[SYSyncEngine service](self, "service");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "name");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "defaultMessageTimeout");
    v24 = v23;
    objc_initWeak(&location, self);
    v30[0] = MEMORY[0x24BDAC760];
    v30[1] = 3221225472;
    v30[2] = __84__SYFileTransferSyncEngine_outputStreamWithMetadata_priority_options_context_error___block_invoke;
    v30[3] = &unk_24CC66D10;
    objc_copyWeak(v37, &location);
    v31 = v15;
    v32 = self;
    v37[1] = v24;
    v33 = v12;
    v34 = v13;
    v25 = v19;
    v35 = v25;
    v37[2] = v29;
    v26 = v22;
    v36 = v26;
    objc_msgSend(v20, "setOnClose:", v30);

    objc_destroyWeak(v37);
    objc_destroyWeak(&location);

    v14 = v28;
  }
  else
  {
    v20 = 0;
  }

  return v20;
}

void __84__SYFileTransferSyncEngine_outputStreamWithMetadata_priority_options_context_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char v32;
  id v33;
  NSObject *v34;
  uint64_t v35;
  void *v36;
  NSObject *v37;
  void *v38;
  uint64_t v39;
  char v40;
  id v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;
  uint8_t buf[4];
  uint64_t v52;
  __int16 v53;
  id v54;
  uint64_t v55;

  v55 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
  if (WeakRetained && objc_msgSend(v3, "streamStatus") != 7)
  {
    v11 = (id)objc_opt_new();
    objc_msgSend(*(id *)(a1 + 40), "_fileTransferHeader");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setHeader:", v13);

    objc_msgSend(v11, "header");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "timestamp");
    v16 = v15 + *(double *)(a1 + 88);
    objc_msgSend(v11, "header");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setTimeout:", v16);

    objc_msgSend(v11, "setDecompressedFileSize:", objc_msgSend(v3, "bytesThroughput"));
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", 2);
    objc_msgSend(v11, "data");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setObject:forKeyedSubscript:", v19, CFSTR("FileHeader"));

    v20 = *(_QWORD *)(a1 + 48);
    if (v20)
      objc_msgSend(v18, "setObject:forKeyedSubscript:", v20, CFSTR("UserMetadata"));
    v21 = *(void **)(a1 + 40);
    IDSOptionsFromSYServiceOptions(*(void **)(a1 + 56));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "idsOptions:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    v24 = *(_QWORD *)(a1 + 40);
    v25 = *(_QWORD *)(a1 + 48);
    v26 = *(void **)(v24 + 128);
    v27 = *(_QWORD *)(v24 + 64);
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", *(_QWORD *)(a1 + 64));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = *(_QWORD *)(a1 + 96);
    v30 = 100;
    if (!v29)
      v30 = 200;
    if (v29 == 20)
      v31 = 300;
    else
      v31 = v30;
    v48 = 0;
    v49 = 0;
    v32 = objc_msgSend(v26, "sendResourceAtURL:metadata:toDestinations:priority:options:identifier:error:", v27, v25, v28, v31, v23, &v49, &v48);
    v46 = v49;
    v33 = v48;

    v45 = v18;
    if ((v32 & 1) != 0)
    {
      if (_sync_log_facilities_pred != -1)
        _os_once();
      v34 = qword_253D84AC0;
      if (os_log_type_enabled((os_log_t)qword_253D84AC0, OS_LOG_TYPE_DEFAULT))
      {
        v35 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 64);
        *(_DWORD *)buf = 138412546;
        v52 = v35;
        v53 = 2114;
        v54 = v46;
        _os_log_impl(&dword_211704000, v34, OS_LOG_TYPE_DEFAULT, "Sent file at %@ via IDS, got identifier %{public}@", buf, 0x16u);
      }
      if (_sync_log_facilities_pred != -1)
        _os_once();
      if (os_log_type_enabled((os_log_t)qword_253D84AF0, OS_LOG_TYPE_DEBUG))
        __84__SYFileTransferSyncEngine_outputStreamWithMetadata_priority_options_context_error___block_invoke_cold_4();
    }
    else
    {
      +[SYTransportLog sharedInstance](SYTransportLog, "sharedInstance");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "oslog");
      v37 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v37, (os_log_type_t)0x90u))
      {
        v44 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 64);
        *(_DWORD *)buf = 138412546;
        v52 = v44;
        v53 = 2112;
        v54 = v33;
        _os_log_error_impl(&dword_211704000, v37, (os_log_type_t)0x90u, "Failed to send file at %@ via IDS: %@", buf, 0x16u);
      }

    }
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = *(_QWORD *)(a1 + 32);
    v47 = 0;
    v40 = objc_msgSend(v38, "removeItemAtURL:error:", v39, &v47);
    v41 = v47;

    if ((v40 & 1) == 0)
    {
      if (_sync_log_facilities_pred != -1)
        _os_once();
      v42 = (void *)qword_253D84AC0;
      if (os_log_type_enabled((os_log_t)qword_253D84AC0, OS_LOG_TYPE_ERROR))
        __84__SYFileTransferSyncEngine_outputStreamWithMetadata_priority_options_context_error___block_invoke_cold_3(a1 + 32, v42, v41);
    }
    +[SYStatisticStore sharedInstance](SYStatisticStore, "sharedInstance");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "recordOutgoingFileTransferAtURL:metadata:identifier:error:forService:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 64), *(_QWORD *)(a1 + 48), v46, v33, *(_QWORD *)(a1 + 72));

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
        __84__SYFileTransferSyncEngine_outputStreamWithMetadata_priority_options_context_error___block_invoke_cold_2(v6, v3);
    }
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(a1 + 32);
    v8 = (uint64_t *)(a1 + 32);
    v50 = 0;
    v10 = objc_msgSend(v7, "removeItemAtURL:error:", v9, &v50);
    v11 = v50;

    if ((v10 & 1) == 0)
    {
      if (_sync_log_facilities_pred != -1)
        _os_once();
      v12 = qword_253D84AC0;
      if (os_log_type_enabled((os_log_t)qword_253D84AC0, OS_LOG_TYPE_ERROR))
        __84__SYFileTransferSyncEngine_outputStreamWithMetadata_priority_options_context_error___block_invoke_cold_1(v8, (uint64_t)v11, v12);
    }
  }

}

- (id)cancelMessagesReturningFailures:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  IDSService *idsService;
  char v14;
  id v15;
  NSObject *v16;
  void *v18;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t buf[4];
  uint64_t v25;
  __int16 v26;
  id v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = v4;
  if (self->_idsService && objc_msgSend(v4, "count"))
  {
    v6 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEF0]), "initWithCapacity:", objc_msgSend(v5, "count"));
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v18 = v5;
    v7 = v5;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v21;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v21 != v10)
            objc_enumerationMutation(v7);
          v12 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v11);
          idsService = self->_idsService;
          v19 = 0;
          v14 = -[IDSService cancelIdentifier:error:](idsService, "cancelIdentifier:error:", v12, &v19);
          v15 = v19;
          if ((v14 & 1) == 0)
          {
            if (_sync_log_facilities_pred != -1)
              _os_once();
            v16 = qword_253D84AC0;
            if (os_log_type_enabled((os_log_t)qword_253D84AC0, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543618;
              v25 = v12;
              v26 = 2112;
              v27 = v15;
              _os_log_impl(&dword_211704000, v16, OS_LOG_TYPE_DEFAULT, "Failed to cancel outgoing file-transfer message (%{public}@): %@", buf, 0x16u);
            }
            objc_msgSend(v6, "addObject:", v12);
          }

          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
      }
      while (v9);
    }

    v5 = v18;
  }
  else
  {
    v6 = v5;
  }

  return v6;
}

- (id)stateForLogging
{
  void *v3;

  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "setType:", 2);
  objc_msgSend(v3, "setSuspended:", self->_idsService == 0);
  objc_msgSend(v3, "setInSession:", -[SYFileTransferSyncEngine isInSession](self, "isInSession"));
  objc_msgSend(v3, "setBuffersSessions:", -[SYFileTransferSyncEngine buffersSessions](self, "buffersSessions"));
  return v3;
}

- (void)_cancelSession
{
  NSObject *v3;
  uint8_t v4[16];

  if (_sync_log_facilities_pred != -1)
    _os_once();
  v3 = qword_253D84AC0;
  if (os_log_type_enabled((os_log_t)qword_253D84AC0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_211704000, v3, OS_LOG_TYPE_DEFAULT, "Canceling send for any outgoing messages on the request stream.", v4, 2u);
  }
  self->_sessionCanceled = 1;
}

- (void)_cancelResponses
{
  NSObject *v3;
  uint8_t v4[16];

  if (_sync_log_facilities_pred != -1)
    _os_once();
  v3 = qword_253D84AC0;
  if (os_log_type_enabled((os_log_t)qword_253D84AC0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_211704000, v3, OS_LOG_TYPE_DEFAULT, "Canceling send for any outgoing messages on the response stream.", v4, 2u);
  }
  self->_responsesCanceled = 1;
}

- (void)_handleSessionRestart:(id)a3 priority:(int64_t)a4 options:(id)a5 userContext:(id)a6 callback:(id)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  _SYOutputStreamer *outputStream;
  id v17;
  id v18;
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;
  id v25;
  id v26[2];
  id location;

  v12 = a3;
  v13 = a5;
  v14 = a6;
  v15 = (void *)objc_msgSend(a7, "copy");
  objc_initWeak(&location, self);
  outputStream = self->_outputStream;
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __88__SYFileTransferSyncEngine__handleSessionRestart_priority_options_userContext_callback___block_invoke;
  v21[3] = &unk_24CC66D38;
  objc_copyWeak(v26, &location);
  v17 = v12;
  v22 = v17;
  v26[1] = (id)a4;
  v18 = v13;
  v23 = v18;
  v19 = v14;
  v24 = v19;
  v20 = v15;
  v25 = v20;
  -[_SYOutputStreamer whenComplete:](outputStream, "whenComplete:", v21);

  objc_destroyWeak(v26);
  objc_destroyWeak(&location);

}

void __88__SYFileTransferSyncEngine__handleSessionRestart_priority_options_userContext_callback___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "_reallyHandleSessionRestart:priority:options:userContext:callback:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
    WeakRetained = v3;
  }

}

- (void)_reallyHandleSessionRestart:(id)a3 priority:(int64_t)a4 options:(id)a5 userContext:(id)a6 callback:(id)a7
{
  id v11;
  _SYOutputStreamer *outputStream;
  id v13;
  _SYOutputStreamer *v14;
  id v15;
  _SYOutputStreamer *v16;
  NSURL *outputFileURL;
  void *v18;
  _SYOutputStreamer *v19;
  _SYOutputStreamer *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;

  v27 = a5;
  v11 = a6;
  outputStream = self->_outputStream;
  v13 = a7;
  -[_SYOutputStreamer close](outputStream, "close");
  v14 = self->_outputStream;
  self->_outputStream = 0;

  v15 = objc_alloc_init(MEMORY[0x24BDBCE50]);
  objc_msgSend(v15, "writeToURL:options:error:", self->_outputFileURL, 1, 0);

  v16 = [_SYOutputStreamer alloc];
  outputFileURL = self->_outputFileURL;
  -[SYSyncEngine queue](self, "queue");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[_SYOutputStreamer initWithCompressedFileURL:callbackQueue:](v16, "initWithCompressedFileURL:callbackQueue:", outputFileURL, v18);
  v20 = self->_outputStream;
  self->_outputStream = v19;

  if (self->_outputStream)
  {
    -[SYSyncEngine service](self, "service");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "name");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    +[SYPersistentStore sharedPersistentStoreForService:](SYPersistentStore, "sharedPersistentStoreForService:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[SYStartSyncSession header](self->_sessionStartMessage, "header");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "resetSequenceNumber:", objc_msgSend(v24, "sequenceNumber"));

    v25 = (void *)objc_opt_new();
    -[SYStartSyncSession copyTo:](self->_sessionStartMessage, "copyTo:", v25);
    v26 = (void *)objc_msgSend(v21, "_newMessageHeader");
    objc_msgSend(v25, "setHeader:", v26);

    -[SYFileTransferSyncEngine enqueueSyncRequest:withMessageID:priority:options:userContext:callback:](self, "enqueueSyncRequest:withMessageID:priority:options:userContext:callback:", v25, 102, a4, v27, v11, v13);
    v13 = v25;
  }
  else
  {
    v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithSYError:userInfo:", 2001, 0);
    (*((void (**)(id, _QWORD, _QWORD, void *))v13 + 2))(v13, 0, 0, v21);
  }

}

- (id)idsOptions:(id)a3
{
  return -[SYFileTransferSyncEngine idsOptions:forFileTransfer:](self, "idsOptions:forFileTransfer:", a3, 1);
}

- (id)idsOptions:(id)a3 forFileTransfer:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;

  v4 = a4;
  v6 = a3;
  v7 = (void *)objc_opt_new();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE4FB48]);
  -[SYSyncEngine service](self, "service");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "currentSession");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "defaultMessageTimeout");
  if (!v9)
    goto LABEL_6;
  if (!v4)
  {
    objc_msgSend(v9, "perMessageTimeout");
LABEL_6:
    v13 = v10;
    goto LABEL_7;
  }
  objc_msgSend(v9, "fullSessionTimeout");
  if (v11 == 0.0)
    goto LABEL_13;
  objc_msgSend(v9, "remainingSessionTime");
  v13 = v12 * 0.5;
LABEL_7:
  if (v13 != 0.0)
  {
    if (MGGetBoolAnswer())
    {
      objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "objectForKey:inDomain:", CFSTR("FileTransferOverrideTimeout"), CFSTR("com.apple.companionsync"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15)
      {
        objc_msgSend(v15, "doubleValue");
        v13 = v16;
      }

    }
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v13);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v17, *MEMORY[0x24BE4FB30]);

    objc_msgSend(v7, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE4FA90]);
  }
LABEL_13:
  -[SYFileTransferSyncEngine customIDSOptions](self, "customIDSOptions");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    -[SYFileTransferSyncEngine customIDSOptions](self, "customIDSOptions");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addEntriesFromDictionary:", v19);

  }
  if (v6)
    objc_msgSend(v7, "addEntriesFromDictionary:", v6);
  objc_msgSend(v7, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C0], *MEMORY[0x24BE4FA80]);

  return v7;
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
  }
  else
  {
    objc_msgSend(v10, "defaultMessageTimeout");
    objc_msgSend(v11, "setSendTimeout:");
    objc_msgSend(v10, "defaultMessageTimeout");
  }
  objc_msgSend(v11, "setResponseTimeout:", v16 + v16);

  return v11;
}

- (id)_wrapResponse:(id)a3 toRequest:(id)a4 ofType:(unsigned __int16)a5
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v6, "configureResponse");
  objc_msgSend(v6, "response");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setPbResponse:", v7);
  return v8;
}

- (id)_wrapIncomingMessage:(id)a3 ofType:(unsigned __int16)a4 identifier:(id)a5
{
  uint64_t v5;
  id v8;
  id v9;
  void *v10;
  NMSIncomingRequest *v11;
  uint64_t v12;
  uint64_t v13;

  v5 = a4;
  v8 = a5;
  v9 = a3;
  -[SYSyncEngine service](self, "service");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_alloc_init(NMSIncomingRequest);
  -[NMSIncomingRequest setMessageID:](v11, "setMessageID:", v5);
  -[NMSIncomingRequest setPbRequest:](v11, "setPbRequest:", v9);

  v12 = objc_msgSend(v10, "priority");
  if (v12 == 20)
    v13 = 2;
  else
    v13 = v12 != 0;
  -[NMSIncomingRequest setPriority:](v11, "setPriority:", v13);
  -[NMSIncomingRequest setIdsIdentifier:](v11, "setIdsIdentifier:", v8);

  -[NMSIncomingRequest setExpectsResponse:](v11, "setExpectsResponse:", 1);
  return v11;
}

- (id)_wrapIncomingResponse:(id)a3 ofType:(unsigned __int16)a4 identifier:(id)a5
{
  uint64_t v5;
  id v7;
  id v8;
  NMSIncomingResponse *v9;

  v5 = a4;
  v7 = a5;
  v8 = a3;
  v9 = objc_alloc_init(NMSIncomingResponse);
  -[NMSIncomingResponse setMessageID:](v9, "setMessageID:", v5);
  -[NMSIncomingResponse setPbResponse:](v9, "setPbResponse:", v8);

  -[NMSIncomingResponse setIdsIdentifier:](v9, "setIdsIdentifier:", v7);
  return v9;
}

- (id)_assumeOwnershipOfURL:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  char *v10;
  char *v11;
  void *v12;
  void *v13;
  void *v14;
  const char *v15;
  id v16;
  int *v17;
  uint64_t v18;
  id v19;
  id v20;
  id v21;
  int *v22;
  uint64_t v23;
  id v24;

  v5 = a3;
  objc_msgSend(v5, "URLByDeletingLastPathComponent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "path");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringByAppendingPathComponent:", CFSTR("SYFileTransfer-XXXXX"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_retainAutorelease(v8);
  v10 = strdup((const char *)objc_msgSend(v9, "UTF8String"));
  v11 = mkdtemp(v10);
  if (v11)
  {
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF48]), "initFileURLWithFileSystemRepresentation:isDirectory:relativeToURL:", v11, 1, 0);
    free(v10);
    objc_msgSend(v5, "lastPathComponent");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "URLByAppendingPathComponent:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = (const char *)objc_msgSend(objc_retainAutorelease(v5), "fileSystemRepresentation");
    v16 = objc_retainAutorelease(v14);
    if (link(v15, (const char *)objc_msgSend(v16, "fileSystemRepresentation")))
    {
      v17 = __error();
      if (a4)
      {
        v18 = *v17;
        v19 = objc_alloc(MEMORY[0x24BDD1540]);
        v20 = (id)objc_msgSend(v19, "initWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], v18, 0);
        v21 = 0;
        *a4 = v20;
      }
      else
      {
        v21 = 0;
      }
    }
    else
    {
      v21 = v16;
    }

  }
  else
  {
    v22 = __error();
    if (a4)
    {
      v23 = *v22;
      v24 = objc_alloc(MEMORY[0x24BDD1540]);
      v21 = 0;
      *a4 = (id)objc_msgSend(v24, "initWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], v23, 0);
    }
    else
    {
      v21 = 0;
    }
  }

  return v21;
}

- (void)_readNextProtobuf:(id)a3
{
  void *v4;
  _SYInputStreamer *inputStream;
  id v6;
  _QWORD v7[5];
  id v8;
  id v9;
  id location;

  v4 = (void *)objc_msgSend(a3, "copy");
  objc_initWeak(&location, self);
  inputStream = self->_inputStream;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __46__SYFileTransferSyncEngine__readNextProtobuf___block_invoke;
  v7[3] = &unk_24CC66D88;
  objc_copyWeak(&v9, &location);
  v6 = v4;
  v7[4] = self;
  v8 = v6;
  -[_SYInputStreamer readDataOfLength:completion:](inputStream, "readDataOfLength:completion:", 8, v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

}

void __46__SYFileTransferSyncEngine__readNextProtobuf___block_invoke(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  _QWORD *WeakRetained;
  NSObject *v8;
  uint64_t v9;
  __int16 v10;
  BOOL v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  id v17;
  __int16 v18;
  BOOL v19;
  uint8_t buf[16];
  os_activity_scope_state_s state;

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained(a1 + 6);
  if (WeakRetained && objc_msgSend(v5, "length"))
  {
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    objc_msgSend(WeakRetained, "transportActivity");
    v8 = objc_claimAutoreleasedReturnValue();
    os_activity_scope_enter(v8, &state);

    v9 = objc_msgSend(objc_retainAutorelease(v5), "bytes");
    v10 = *(_WORD *)v9;
    v11 = *(_WORD *)(v9 + 2) != 0;
    v12 = *(unsigned int *)(v9 + 4);
    if (*(_WORD *)(v9 + 2) && !*((_BYTE *)a1[4] + 49))
    {
      if (_sync_log_facilities_pred != -1)
        _os_once();
      v13 = qword_253D84AC0;
      if (os_log_type_enabled((os_log_t)qword_253D84AC0, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_211704000, v13, OS_LOG_TYPE_DEFAULT, "Incoming data is all response data", buf, 2u);
      }
      objc_msgSend(a1[4], "_cancelResponses");
    }
    v14 = (void *)WeakRetained[11];
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __46__SYFileTransferSyncEngine__readNextProtobuf___block_invoke_107;
    v15[3] = &unk_24CC66D60;
    objc_copyWeak(&v17, a1 + 6);
    v16 = a1[5];
    v18 = v10;
    v19 = v11;
    objc_msgSend(v14, "readDataOfLength:completion:", v12, v15);

    objc_destroyWeak(&v17);
    os_activity_scope_leave(&state);
  }
  else
  {
    (*((void (**)(void))a1[5] + 2))();
  }

}

void __46__SYFileTransferSyncEngine__readNextProtobuf___block_invoke_107(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  NSObject *v9;
  objc_class *v10;
  objc_class *v11;
  void *v12;
  void *v13;
  void *v14;
  _BOOL4 v15;
  unint64_t v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  NSObject *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  int v24;
  NSObject *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  int v29;
  void *v30;
  os_activity_scope_state_s v31;
  uint8_t buf[4];
  void *v33;
  _BYTE v34[24];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v8 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "transportActivity", 0, 0);
    v9 = objc_claimAutoreleasedReturnValue();
    os_activity_scope_enter(v9, &v31);

    if (v5)
    {
      v10 = (objc_class *)SYMessageClassForID(*(unsigned __int16 *)(a1 + 48));
      v11 = v10;
      if (v10)
      {
        v12 = (void *)objc_msgSend([v10 alloc], "initWithData:", v5);
        v13 = v12;
        if (*(_WORD *)(a1 + 48) == 106)
        {
          objc_msgSend(v12, "payload");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = v14 == 0;

          if (v15)
          {
            v16 = objc_msgSend(v5, "length");
            if (v16 >= 0x14)
              v17 = 20;
            else
              v17 = v16;
            objc_msgSend(v5, "subdataWithRange:", 0, v17);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            if (_sync_log_facilities_pred != -1)
              _os_once();
            v19 = (id)qword_253D84AC0;
            if (os_log_type_enabled(v19, (os_log_type_t)0x90u))
              __46__SYFileTransferSyncEngine__readNextProtobuf___block_invoke_107_cold_2((uint64_t)v18, (uint64_t)v34, objc_msgSend(v5, "length"), v19);

          }
        }
        if (v13)
        {
          if (_sync_log_facilities_pred != -1)
            _os_once();
          v20 = (id)qword_253D84AC0;
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            NSStringFromClass(v11);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v33 = v21;
            _os_log_impl(&dword_211704000, v20, OS_LOG_TYPE_DEFAULT, "File-transfer engine decoded incoming %{public}@ message", buf, 0xCu);

          }
          (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
        }
        else
        {
          if (_sync_log_facilities_pred != -1)
            _os_once();
          v25 = (id)qword_253D84AC0;
          if (os_log_type_enabled(v25, (os_log_type_t)0x90u))
          {
            NSStringFromClass(v11);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            __46__SYFileTransferSyncEngine__readNextProtobuf___block_invoke_107_cold_1(v26, (uint64_t)buf, v25);
          }

          v27 = *(_QWORD *)(a1 + 32);
          v28 = *(unsigned __int16 *)(a1 + 48);
          v29 = *(unsigned __int8 *)(a1 + 50);
          v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithSYError:userInfo:", 2016, 0);
          (*(void (**)(uint64_t, _QWORD, uint64_t, BOOL, void *))(v27 + 16))(v27, 0, v28, v29 != 0, v30);

        }
      }
      else
      {
        v22 = *(_QWORD *)(a1 + 32);
        v23 = *(unsigned __int16 *)(a1 + 48);
        v24 = *(unsigned __int8 *)(a1 + 50);
        v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithSYError:userInfo:", 2015, 0);
        (*(void (**)(uint64_t, _QWORD, uint64_t, BOOL, void *))(v22 + 16))(v22, 0, v23, v24 != 0, v13);
      }

    }
    else
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    }
    os_activity_scope_leave(&v31);
  }

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
  id v11;
  id v12;

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
  v12 = 0;
  LOBYTE(v8) = objc_msgSend(v7, "setLastSequenceNumber:fromPeer:error:", v8, v10, &v12);
  v11 = v12;

  if ((v8 & 1) == 0)
  {
    if (_sync_log_facilities_pred != -1)
      _os_once();
    if (os_log_type_enabled((os_log_t)qword_253D84AC0, OS_LOG_TYPE_ERROR))
      -[SYFileTransferSyncEngine _recordLastSeqNo:].cold.1();
  }

}

- (BOOL)_shouldTreatAsSessionEnd:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isMemberOfClass:", objc_opt_class()) & 1) != 0
    || (objc_msgSend(v3, "isMemberOfClass:", objc_opt_class()) & 1) != 0)
  {
    LOBYTE(v4) = 1;
  }
  else if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v4 = objc_msgSend(v3, "accepted") ^ 1;
  }
  else if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    LOBYTE(v4) = objc_msgSend(v3, "hasError");
  }
  else
  {
    LOBYTE(v4) = 0;
  }

  return v4;
}

- (void)_consumeRemainingStreamDataWithIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __81__SYFileTransferSyncEngine__consumeRemainingStreamDataWithIdentifier_completion___block_invoke;
  v10[3] = &unk_24CC66DB0;
  objc_copyWeak(&v13, &location);
  v8 = v7;
  v12 = v8;
  v9 = v6;
  v11 = v9;
  -[SYFileTransferSyncEngine _readNextProtobuf:](self, "_readNextProtobuf:", v10);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

}

void __81__SYFileTransferSyncEngine__consumeRemainingStreamDataWithIdentifier_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  unint64_t v7;
  unint64_t v8;
  id WeakRetained;
  NSObject *v10;
  void *v11;
  uint8_t v12[16];

  v7 = a2;
  v8 = a5;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained && v7 | v8)
  {
    if (!v8)
    {
      objc_msgSend((id)v7, "header");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "_recordLastSeqNo:", v11);

      objc_msgSend(WeakRetained, "_consumeRemainingStreamDataWithIdentifier:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
      goto LABEL_13;
    }
    if (_sync_log_facilities_pred != -1)
      _os_once();
    if (os_log_type_enabled((os_log_t)qword_253D84AC0, OS_LOG_TYPE_ERROR))
      __81__SYFileTransferSyncEngine__consumeRemainingStreamDataWithIdentifier_completion___block_invoke_cold_1();
    if (_sync_log_facilities_pred != -1)
      _os_once();
    v10 = qword_253D84AC0;
    if (os_log_type_enabled((os_log_t)qword_253D84AC0, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_211704000, v10, OS_LOG_TYPE_DEFAULT, "Canceling attempt to consume remaining messages. Sequence numbers will likely be out of sync now.", v12, 2u);
    }
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
LABEL_13:

}

- (void)_handleProtobuf:(id)a3 ofType:(unsigned __int16)a4 identifier:(id)a5 isResponse:(BOOL)a6 withCompletion:(id)a7
{
  _BOOL4 v8;
  uint64_t v10;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  _QWORD v30[4];
  id v31;
  SYFileTransferSyncEngine *v32;
  id v33;
  id v34;
  __int16 v35;
  id buf[2];
  _QWORD v37[5];
  id v38;
  id v39;
  id v40;
  _QWORD v41[4];
  id v42;

  v8 = a6;
  v10 = a4;
  v12 = a3;
  v13 = a5;
  v14 = a7;
  -[SYSyncEngine service](self, "service");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[SYSyncEngine responder](self, "responder");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if ((_DWORD)v10 == 106)
  {
    v17 = v12;
    objc_msgSend(v17, "payload");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v41[0] = MEMORY[0x24BDAC760];
    v41[1] = 3221225472;
    v41[2] = __88__SYFileTransferSyncEngine__handleProtobuf_ofType_identifier_isResponse_withCompletion___block_invoke;
    v41[3] = &unk_24CC66DD8;
    v42 = v14;
    objc_msgSend(v16, "handleOutOfBandData:completion:", v18, v41);

  }
  else
  {
    objc_msgSend(v12, "header");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v16, "willAcceptMessageWithHeader:messageID:", v19, v13);

    objc_msgSend(v12, "header");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[SYFileTransferSyncEngine _recordLastSeqNo:](self, "_recordLastSeqNo:", v21);

    if ((v20 & 1) != 0)
    {
      if (v8)
      {
        -[SYFileTransferSyncEngine _wrapIncomingResponse:ofType:identifier:](self, "_wrapIncomingResponse:ofType:identifier:", v12, v10, v13);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        +[SYStatisticStore sharedInstance](SYStatisticStore, "sharedInstance");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "name");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "recordIncomingMessage:forService:", v22, v24);

        v37[0] = MEMORY[0x24BDAC760];
        v37[1] = 3221225472;
        v37[2] = __88__SYFileTransferSyncEngine__handleProtobuf_ofType_identifier_isResponse_withCompletion___block_invoke_115;
        v37[3] = &unk_24CC66E00;
        v40 = v14;
        v37[4] = self;
        v38 = v12;
        v39 = v22;
        v25 = v22;
        objc_msgSend(v16, "handleSyncResponse:ofType:completion:", v38, v10, v37);

      }
      else
      {
        -[SYFileTransferSyncEngine _wrapIncomingMessage:ofType:identifier:](self, "_wrapIncomingMessage:ofType:identifier:", v12, v10, v13);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        +[SYStatisticStore sharedInstance](SYStatisticStore, "sharedInstance");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "name");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "recordIncomingMessage:forService:", v27, v29);

        objc_msgSend(v27, "setExpectsResponse:", 0);
        objc_initWeak(buf, self);
        v30[0] = MEMORY[0x24BDAC760];
        v30[1] = 3221225472;
        v30[2] = __88__SYFileTransferSyncEngine__handleProtobuf_ofType_identifier_isResponse_withCompletion___block_invoke_116;
        v30[3] = &unk_24CC66E50;
        objc_copyWeak(&v34, buf);
        v25 = v27;
        v35 = v10;
        v31 = v25;
        v32 = self;
        v33 = v14;
        objc_msgSend(v16, "handleSyncRequest:ofType:response:", v12, v10, v30);

        objc_destroyWeak(&v34);
        objc_destroyWeak(buf);
      }

    }
    else
    {
      if (_sync_log_facilities_pred != -1)
        _os_once();
      v26 = qword_253D84AC0;
      if (os_log_type_enabled((os_log_t)qword_253D84AC0, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf[0]) = 0;
        _os_log_impl(&dword_211704000, v26, OS_LOG_TYPE_DEFAULT, "Rejection/error somewhere caused remaining session messages to be ignored. Pulling them all out of the file to keep sequence numbers contiguous.", (uint8_t *)buf, 2u);
      }
      (*((void (**)(id, uint64_t))v14 + 2))(v14, 1);
    }
  }

}

void __88__SYFileTransferSyncEngine__handleProtobuf_ofType_identifier_isResponse_withCompletion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;

  v5 = a3;
  if ((a2 & 1) == 0)
  {
    if (_sync_log_facilities_pred != -1)
      _os_once();
    if (os_log_type_enabled((os_log_t)qword_253D84AC0, OS_LOG_TYPE_ERROR))
      __88__SYFileTransferSyncEngine__handleProtobuf_ofType_identifier_isResponse_withCompletion___block_invoke_cold_1();
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __88__SYFileTransferSyncEngine__handleProtobuf_ofType_identifier_isResponse_withCompletion___block_invoke_115(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  objc_class *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  void (*v12)(void);
  int v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if ((a2 & 1) != 0)
  {
    if ((objc_msgSend(*(id *)(a1 + 32), "_shouldTreatAsSessionEnd:", *(_QWORD *)(a1 + 40)) & 1) == 0)
    {
      v12 = *(void (**)(void))(*(_QWORD *)(a1 + 56) + 16);
      goto LABEL_17;
    }
    if (_sync_log_facilities_pred != -1)
      _os_once();
    v6 = (void *)qword_253D84AC0;
    if (os_log_type_enabled((os_log_t)qword_253D84AC0, OS_LOG_TYPE_DEFAULT))
    {
      v7 = v6;
      v8 = (objc_class *)objc_opt_class();
      NSStringFromClass(v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543362;
      v14 = v9;
      _os_log_impl(&dword_211704000, v7, OS_LOG_TYPE_DEFAULT, "File-transfer engine ending session on %{public}@ message", (uint8_t *)&v13, 0xCu);

    }
  }
  else
  {
    if (_sync_log_facilities_pred != -1)
      _os_once();
    v10 = qword_253D84AC0;
    if (os_log_type_enabled((os_log_t)qword_253D84AC0, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 138412290;
      v14 = v5;
      _os_log_impl(&dword_211704000, v10, OS_LOG_TYPE_DEFAULT, "Response handler failure reported: %@", (uint8_t *)&v13, 0xCu);
    }
    if (_sync_log_facilities_pred != -1)
      _os_once();
    v11 = qword_253D84AC0;
    if (os_log_type_enabled((os_log_t)qword_253D84AC0, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v13) = 0;
      _os_log_impl(&dword_211704000, v11, OS_LOG_TYPE_DEFAULT, "Rejection/error somewhere caused remaining session messages to be ignored. Pulling them all out of the file to keep sequence numbers contiguous.", (uint8_t *)&v13, 2u);
    }
  }
  v12 = *(void (**)(void))(*(_QWORD *)(a1 + 56) + 16);
LABEL_17:
  v12();

}

void __88__SYFileTransferSyncEngine__handleProtobuf_ofType_identifier_isResponse_withCompletion___block_invoke_116(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  _QWORD *WeakRetained;
  _QWORD *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  __int16 v23;
  uint64_t v24;

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v8 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "service");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_wrapResponse:toRequest:ofType:", v5, *(_QWORD *)(a1 + 32), *(unsigned __int16 *)(a1 + 64));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setPersistentUserInfo:", v6);
    +[SYStatisticStore sharedInstance](SYStatisticStore, "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v9;
    objc_msgSend(v9, "name");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "recordOutgoingMessage:forService:", v10, v12);

    +[SYStatisticStore sharedInstance](SYStatisticStore, "sharedInstance");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "rowIDForPartialMessage:", v10);

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 192), "addIndex:", v14);
    objc_msgSend(v5, "data");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 0x10000;
    LOWORD(v24) = *(_WORD *)(a1 + 64);
    HIDWORD(v24) = objc_msgSend(v15, "length");
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEC8]), "initWithBytes:length:", &v24, 8);
    objc_msgSend(v16, "appendData:", v15);
    v17 = (void *)v8[14];
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __88__SYFileTransferSyncEngine__handleProtobuf_ofType_identifier_isResponse_withCompletion___block_invoke_2;
    v19[3] = &unk_24CC66E28;
    objc_copyWeak(&v22, (id *)(a1 + 56));
    v23 = *(_WORD *)(a1 + 64);
    v20 = v5;
    v21 = *(id *)(a1 + 48);
    objc_msgSend(v17, "writeData:completion:", v16, v19);

    objc_destroyWeak(&v22);
  }

}

void __88__SYFileTransferSyncEngine__handleProtobuf_ofType_identifier_isResponse_withCompletion___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  objc_class *v10;
  void *v11;
  NSObject *v12;
  os_activity_scope_state_s v13;
  uint8_t buf[4];
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v7 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "transportActivity", 0, 0);
    v8 = objc_claimAutoreleasedReturnValue();
    os_activity_scope_enter(v8, &v13);

    if ((a2 & 1) == 0)
    {
      if (_sync_log_facilities_pred != -1)
        _os_once();
      if (os_log_type_enabled((os_log_t)qword_253D84AC0, OS_LOG_TYPE_ERROR))
        __88__SYFileTransferSyncEngine__handleProtobuf_ofType_identifier_isResponse_withCompletion___block_invoke_2_cold_1();
    }
    if (objc_msgSend(v7, "_shouldTreatAsSessionEnd:", *(_QWORD *)(a1 + 32)))
    {
      if (_sync_log_facilities_pred != -1)
        _os_once();
      v9 = (id)qword_253D84AC0;
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v10 = (objc_class *)objc_opt_class();
        NSStringFromClass(v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v15 = v11;
        _os_log_impl(&dword_211704000, v9, OS_LOG_TYPE_DEFAULT, "File-transfer engine ending session on %{public}@ message", buf, 0xCu);

      }
      if (_sync_log_facilities_pred != -1)
        _os_once();
      v12 = qword_253D84AC0;
      if (os_log_type_enabled((os_log_t)qword_253D84AC0, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_211704000, v12, OS_LOG_TYPE_INFO, "Pulling remaining messages from the file to keep sequence numbers contiguous, in case this was an early return.", buf, 2u);
      }
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    os_activity_scope_leave(&v13);
  }

}

- (void)_handleIncomingStreamDataWithIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  SYFileTransferSyncEngine *v12;
  id v13;
  id v14;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __79__SYFileTransferSyncEngine__handleIncomingStreamDataWithIdentifier_completion___block_invoke;
  v10[3] = &unk_24CC66EA0;
  objc_copyWeak(&v14, &location);
  v8 = v7;
  v13 = v8;
  v9 = v6;
  v11 = v9;
  v12 = self;
  -[SYFileTransferSyncEngine _readNextProtobuf:](self, "_readNextProtobuf:", v10);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

}

void __79__SYFileTransferSyncEngine__handleIncomingStreamDataWithIdentifier_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  unint64_t v9;
  unint64_t v10;
  id WeakRetained;
  void *v12;
  uint64_t v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;

  v9 = a2;
  v10 = a5;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained && v9 | v10)
  {
    if (!v10)
    {
      v13 = *(_QWORD *)(a1 + 32);
      v12 = *(void **)(a1 + 40);
      v14[0] = MEMORY[0x24BDAC760];
      v14[1] = 3221225472;
      v14[2] = __79__SYFileTransferSyncEngine__handleIncomingStreamDataWithIdentifier_completion___block_invoke_118;
      v14[3] = &unk_24CC66E78;
      objc_copyWeak(&v17, (id *)(a1 + 56));
      v15 = *(id *)(a1 + 32);
      v16 = *(id *)(a1 + 48);
      objc_msgSend(v12, "_handleProtobuf:ofType:identifier:isResponse:withCompletion:", v9, a3, v13, a4, v14);

      objc_destroyWeak(&v17);
      goto LABEL_10;
    }
    if (_sync_log_facilities_pred != -1)
      _os_once();
    if (os_log_type_enabled((os_log_t)qword_253D84AC0, OS_LOG_TYPE_ERROR))
      __81__SYFileTransferSyncEngine__consumeRemainingStreamDataWithIdentifier_completion___block_invoke_cold_1();
    objc_msgSend(WeakRetained, "_handleError:messageID:streamer:", v10, *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(a1 + 40) + 88));
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
LABEL_10:

}

void __79__SYFileTransferSyncEngine__handleIncomingStreamDataWithIdentifier_completion___block_invoke_118(uint64_t a1, int a2)
{
  id WeakRetained;
  uint64_t v5;
  uint64_t v6;
  id v7;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(_QWORD *)(a1 + 40);
    v7 = WeakRetained;
    if (a2)
      objc_msgSend(WeakRetained, "_consumeRemainingStreamDataWithIdentifier:completion:", v5, v6);
    else
      objc_msgSend(WeakRetained, "_handleIncomingStreamDataWithIdentifier:completion:", v5, v6);
    WeakRetained = v7;
  }

}

- (void)_handleIncomingSessionFileAtOwnedURL:(id)a3 metadata:(id)a4 identifier:(id)a5 idsContext:(id)a6
{
  id v11;
  id v12;
  _SYInputStreamer *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  _SYInputStreamer *v18;
  NSURL *inputFileURL;
  void *v20;
  _SYInputStreamer *v21;
  _SYInputStreamer *inputStream;
  NSObject *v23;
  _SYInputStreamer *v24;
  void *v25;
  id v26;
  _QWORD v27[5];
  id v28;
  uint8_t buf[4];
  _SYInputStreamer *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v11 = a3;
  v12 = a4;
  v13 = (_SYInputStreamer *)a5;
  v26 = a6;
  if (self->_inputStream)
  {
    if (_sync_log_facilities_pred != -1)
      _os_once();
    v14 = qword_253D84AC0;
    if (os_log_type_enabled((os_log_t)qword_253D84AC0, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v30 = v13;
      _os_log_impl(&dword_211704000, v14, OS_LOG_TYPE_DEFAULT, "Deferring incoming file-transfer with identifier %{public}@ because I'm already within a file-transfer session", buf, 0xCu);
    }
    v15 = (void *)objc_opt_new();
    objc_msgSend(v15, "setResourceURL:", v11);
    objc_msgSend(v15, "setIdentifier:", v13);
    objc_msgSend(v15, "setMetadata:", v12);
    objc_msgSend(v15, "setIdsContext:", v26);
    -[NSMutableArray addObject:](self->_deferredIncomingSessions, "addObject:", v15);
  }
  else
  {
    -[SYSyncEngine service](self, "service");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("SessionID"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    +[SYStatisticStore sharedInstance](SYStatisticStore, "sharedInstance");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "name");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "recordIncomingFileTransferAtURL:metadata:identifier:forService:", v11, v12, v13, v17);

    -[SYFileTransferSyncEngine beginResponseSession](self, "beginResponseSession");
    -[_SYOutputStreamer setStreamProperty:forKey:](self->_outputStream, "setStreamProperty:forKey:", v25, SYAssociatedSessionIdentifierPropertyKey);
    objc_storeStrong((id *)&self->_inputFileURL, a3);
    v18 = [_SYInputStreamer alloc];
    inputFileURL = self->_inputFileURL;
    -[SYSyncEngine queue](self, "queue");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = -[_SYInputStreamer initWithCompressedFileURL:callbackQueue:](v18, "initWithCompressedFileURL:callbackQueue:", inputFileURL, v20);
    inputStream = self->_inputStream;
    self->_inputStream = v21;

    objc_storeStrong((id *)&self->_inputPriorityBoostContext, a6);
    if (_sync_log_facilities_pred != -1)
      _os_once();
    v23 = qword_253D84AC0;
    if (os_log_type_enabled((os_log_t)qword_253D84AC0, OS_LOG_TYPE_DEFAULT))
    {
      v24 = self->_inputStream;
      *(_DWORD *)buf = 138543618;
      v30 = v24;
      v31 = 2114;
      v32 = v25;
      _os_log_impl(&dword_211704000, v23, OS_LOG_TYPE_DEFAULT, "Incoming session stream: %{public}@, associated session ID: %{public}@", buf, 0x16u);
    }
    -[SYFileTransferSyncEngine _suspendIdsQueue](self, "_suspendIdsQueue");
    objc_initWeak((id *)buf, self);
    v27[0] = MEMORY[0x24BDAC760];
    v27[1] = 3221225472;
    v27[2] = __96__SYFileTransferSyncEngine__handleIncomingSessionFileAtOwnedURL_metadata_identifier_idsContext___block_invoke;
    v27[3] = &unk_24CC66EC8;
    v27[4] = self;
    objc_copyWeak(&v28, (id *)buf);
    -[SYFileTransferSyncEngine _handleIncomingStreamDataWithIdentifier:completion:](self, "_handleIncomingStreamDataWithIdentifier:completion:", v13, v27);
    objc_destroyWeak(&v28);
    objc_destroyWeak((id *)buf);

  }
}

void __96__SYFileTransferSyncEngine__handleIncomingSessionFileAtOwnedURL_metadata_identifier_idsContext___block_invoke(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  os_activity_scope_state_s v11;
  uint8_t buf[4];
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "transportActivity", 0, 0);
  v2 = objc_claimAutoreleasedReturnValue();
  os_activity_scope_enter(v2, &v11);

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if (_sync_log_facilities_pred != -1)
      _os_once();
    v4 = qword_253D84AC0;
    if (os_log_type_enabled((os_log_t)qword_253D84AC0, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *((_QWORD *)WeakRetained + 11);
      *(_DWORD *)buf = 138543362;
      v13 = v5;
      _os_log_impl(&dword_211704000, v4, OS_LOG_TYPE_DEFAULT, "Finished handling session stream: %{public}@", buf, 0xCu);
    }
    objc_msgSend(WeakRetained, "endResponseSession");
    objc_msgSend(*((id *)WeakRetained + 11), "close");
    v6 = (void *)*((_QWORD *)WeakRetained + 11);
    *((_QWORD *)WeakRetained + 11) = 0;

    v7 = (void *)*((_QWORD *)WeakRetained + 12);
    *((_QWORD *)WeakRetained + 12) = 0;

    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*((id *)WeakRetained + 10), "URLByDeletingLastPathComponent");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeItemAtURL:error:", v9, 0);

    v10 = (void *)*((_QWORD *)WeakRetained + 10);
    *((_QWORD *)WeakRetained + 10) = 0;

    objc_msgSend(WeakRetained, "_resumeIdsQueue");
  }

  os_activity_scope_leave(&v11);
}

- (void)_handleIncomingSessionFileAtURL:(id)a3 metadata:(id)a4 identifier:(id)a5 idsContext:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  double v18;
  double v19;
  NSObject *v20;
  uint64_t v21;
  void *v22;
  _QWORD v23[4];
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  uint8_t buf[4];
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v29 = 0;
  -[SYFileTransferSyncEngine _assumeOwnershipOfURL:error:](self, "_assumeOwnershipOfURL:error:", v10, &v29);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v29;
  if (v14)
  {
    if (_sync_log_facilities_pred != -1)
      _os_once();
    v16 = qword_253D84AC0;
    if (os_log_type_enabled((os_log_t)qword_253D84AC0, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v31 = v14;
      _os_log_impl(&dword_211704000, v16, OS_LOG_TYPE_DEFAULT, "Keeping track of incoming file at URL %@", buf, 0xCu);
    }
    if (_sync_log_facilities_pred != -1)
      _os_once();
    if (os_log_type_enabled((os_log_t)qword_253D84AF0, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("EnqueuedAt"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "timeIntervalSinceNow");
      v19 = v18;
      if (_sync_log_facilities_pred != -1)
        _os_once();
      v20 = qword_253D84AF0;
      if (os_log_type_enabled((os_log_t)qword_253D84AF0, OS_LOG_TYPE_DEBUG))
        -[SYFileTransferSyncEngine _handleIncomingSessionFileAtURL:metadata:identifier:idsContext:].cold.2((uint64_t)v12, v20, v21, v19);

    }
    objc_initWeak((id *)buf, self);
    -[SYSyncEngine responder](self, "responder");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = __91__SYFileTransferSyncEngine__handleIncomingSessionFileAtURL_metadata_identifier_idsContext___block_invoke;
    v23[3] = &unk_24CC66EF0;
    objc_copyWeak(&v28, (id *)buf);
    v24 = v14;
    v25 = v11;
    v26 = v12;
    v27 = v13;
    objc_msgSend(v22, "serializeForIncomingSession:", v23);

    objc_destroyWeak(&v28);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    if (_sync_log_facilities_pred != -1)
      _os_once();
    if (os_log_type_enabled((os_log_t)qword_253D84AC0, OS_LOG_TYPE_ERROR))
      -[SYFileTransferSyncEngine _handleIncomingSessionFileAtURL:metadata:identifier:idsContext:].cold.1();
  }

}

void __91__SYFileTransferSyncEngine__handleIncomingSessionFileAtURL_metadata_identifier_idsContext___block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  char v7;
  id v8;
  id v9;
  uint8_t buf[4];
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (!WeakRetained)
  {
    if (_sync_log_facilities_pred != -1)
      _os_once();
    v3 = qword_253D84AC0;
    if (os_log_type_enabled((os_log_t)qword_253D84AC0, OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      v11 = v4;
      _os_log_impl(&dword_211704000, v3, OS_LOG_TYPE_DEFAULT, "Engine deallocated while waiting to process incoming file at URL: %@", buf, 0xCu);
    }
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "URLByDeletingLastPathComponent");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 0;
    v7 = objc_msgSend(v5, "removeItemAtURL:error:", v6, &v9);
    v8 = v9;

    if ((v7 & 1) == 0)
    {
      if (_sync_log_facilities_pred != -1)
        _os_once();
      if (os_log_type_enabled((os_log_t)qword_253D84AC0, OS_LOG_TYPE_ERROR))
        __91__SYFileTransferSyncEngine__handleIncomingSessionFileAtURL_metadata_identifier_idsContext___block_invoke_cold_1();
    }

  }
  objc_msgSend(WeakRetained, "_handleIncomingSessionFileAtOwnedURL:metadata:identifier:idsContext:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

}

- (void)_processNMSMessageData:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  objc_class *v13;
  objc_class *v14;
  void *v15;
  void *v16;
  void *v17;
  unint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  _QWORD v28[5];
  uint8_t buf[4];
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = objc_retainAutorelease(a3);
  v8 = *(unsigned __int16 *)objc_msgSend(v7, "bytes");
  objc_msgSend(v6, "storageGuid");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "incomingResponseIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v7, "length");
  if (v10)
  {
    objc_msgSend(v7, "subdataWithRange:", 2, v11 - 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "incomingResponseIdentifier");
    v7 = v9;
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v7, "subdataWithRange:", 3, v11 - 3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }

  v13 = (objc_class *)SYMessageClassForID(v8);
  if (v13)
  {
    v14 = v13;
    v15 = (void *)objc_msgSend([v13 alloc], "initWithData:", v12);
    v16 = v15;
    if ((_DWORD)v8 == 106)
    {
      objc_msgSend(v15, "payload");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v17)
      {
        v18 = objc_msgSend(v12, "length");
        if (v18 >= 0x14)
          v19 = 20;
        else
          v19 = v18;
        objc_msgSend(v12, "subdataWithRange:", 0, v19);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        if (_sync_log_facilities_pred != -1)
          _os_once();
        v20 = (void *)qword_253D84AC0;
        if (os_log_type_enabled((os_log_t)qword_253D84AC0, (os_log_type_t)0x90u))
          -[SYFileTransferSyncEngine _processNMSMessageData:context:].cold.3(v20, v12, (uint64_t)v27);

      }
    }
    if (v16)
    {
      if (_sync_log_facilities_pred != -1)
        _os_once();
      v21 = (void *)qword_253D84AC0;
      if (os_log_type_enabled((os_log_t)qword_253D84AC0, OS_LOG_TYPE_DEFAULT))
      {
        v22 = v21;
        NSStringFromClass(v14);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v30 = v23;
        _os_log_impl(&dword_211704000, v22, OS_LOG_TYPE_DEFAULT, "File-transfer engine decoded incoming %{public}@ message", buf, 0xCu);

      }
      -[SYFileTransferSyncEngine _suspendIdsQueue](self, "_suspendIdsQueue");
      v28[0] = MEMORY[0x24BDAC760];
      v28[1] = 3221225472;
      v28[2] = __59__SYFileTransferSyncEngine__processNMSMessageData_context___block_invoke;
      v28[3] = &unk_24CC66F18;
      v28[4] = self;
      -[SYFileTransferSyncEngine _handleProtobuf:ofType:identifier:isResponse:withCompletion:](self, "_handleProtobuf:ofType:identifier:isResponse:withCompletion:", v16, v8, v9, v10 != 0, v28);
    }
    else
    {
      if (_sync_log_facilities_pred != -1)
        _os_once();
      v25 = (void *)qword_253D84AC0;
      if (os_log_type_enabled((os_log_t)qword_253D84AC0, OS_LOG_TYPE_ERROR))
        -[SYFileTransferSyncEngine _processNMSMessageData:context:].cold.2(v25, v14);
      v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithSYError:userInfo:", 2016, 0);
      -[SYFileTransferSyncEngine _handleError:messageID:streamer:](self, "_handleError:messageID:streamer:", v26, v9, 0);

    }
  }
  else
  {
    if (_sync_log_facilities_pred != -1)
      _os_once();
    v24 = qword_253D84AC0;
    if (os_log_type_enabled((os_log_t)qword_253D84AC0, OS_LOG_TYPE_ERROR))
      -[SYFileTransferSyncEngine _processNMSMessageData:context:].cold.1(v8, v24);
  }

}

uint64_t __59__SYFileTransferSyncEngine__processNMSMessageData_context___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_resumeIdsQueue");
}

- (void)service:(id)a3 account:(id)a4 incomingResourceAtURL:(id)a5 metadata:(id)a6 fromID:(id)a7 context:(id)a8
{
  id v14;
  id v15;
  id v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  BOOL v22;
  int v23;
  unint64_t v24;
  void *v25;
  char v26;
  NSObject *v27;
  NSObject *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  int v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  id v39;
  id v40;
  id v41;
  os_activity_scope_state_s state;
  uint8_t buf[32];
  uint8_t v44[24];
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v39 = a3;
  v40 = a4;
  v14 = a5;
  v15 = a6;
  v41 = a7;
  v16 = a8;
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  -[SYSyncEngine transportActivity](self, "transportActivity");
  v17 = objc_claimAutoreleasedReturnValue();
  os_activity_scope_enter(v17, &state);

  objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("CRC"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[SYSyncEngine service](self, "service");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "options");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("SYServiceOptionEnableCRC"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v21, "integerValue"))
    v22 = v18 == 0;
  else
    v22 = 1;
  v23 = !v22;

  if (v23)
  {
    v24 = -[SYFileTransferSyncEngine _crcChecksum:](self, "_crcChecksum:", v14);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v18, "isEqual:", v25);

    if ((v26 & 1) != 0)
    {
      if (_sync_log_facilities_pred != -1)
        _os_once();
      v27 = qword_253D84AC0;
      if (os_log_type_enabled((os_log_t)qword_253D84AC0, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_211704000, v27, OS_LOG_TYPE_DEFAULT, "CRC validated.", buf, 2u);
      }
    }
    else
    {
      if (_sync_log_facilities_pred != -1)
        _os_once();
      v28 = (id)qword_253D84AC0;
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        -[SYFileTransferSyncEngine service:account:incomingResourceAtURL:metadata:fromID:context:].cold.2(objc_msgSend(v18, "integerValue"), v24, v44, v28);

    }
  }
  if (_sync_log_facilities_pred != -1)
    _os_once();
  v29 = (id)qword_253D84AF0;
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v16, "outgoingResponseIdentifier");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "incomingResponseIdentifier");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[SYFileTransferSyncEngine service:account:incomingResourceAtURL:metadata:fromID:context:].cold.1(v30, v31, (uint64_t)buf, v29);
  }

  objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("ContainsSession"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend(v32, "BOOLValue");

  if (v33)
  {
    objc_msgSend(v16, "incomingResponseIdentifier");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = v34;
    if (v34)
    {
      v36 = v34;
    }
    else
    {
      objc_msgSend(v16, "outgoingResponseIdentifier");
      v36 = (id)objc_claimAutoreleasedReturnValue();
    }
    v37 = v36;

    -[SYFileTransferSyncEngine _handleIncomingSessionFileAtURL:metadata:identifier:idsContext:](self, "_handleIncomingSessionFileAtURL:metadata:identifier:idsContext:", v14, v15, v37, v16);
  }
  else
  {
    objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("UserMetadata"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[SYSyncEngine responder](self, "responder");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "handleFileTransfer:metadata:completion:", v14, v37, &__block_literal_global_13);

  }
  os_activity_scope_leave(&state);

}

void __90__SYFileTransferSyncEngine_service_account_incomingResourceAtURL_metadata_fromID_context___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v4;

  v4 = a3;
  if ((a2 & 1) == 0)
  {
    if (_sync_log_facilities_pred != -1)
      _os_once();
    if (os_log_type_enabled((os_log_t)qword_253D84AC0, OS_LOG_TYPE_ERROR))
      __90__SYFileTransferSyncEngine_service_account_incomingResourceAtURL_metadata_fromID_context___block_invoke_cold_1();
  }

}

- (void)service:(id)a3 account:(id)a4 incomingData:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v12;
  id v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  NSObject *v19;
  id v20;
  id v21;
  id v22;
  unint64_t v23;
  int v24;
  NSObject *v25;
  uint64_t v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  objc_class *v30;
  objc_class *v31;
  void *v32;
  NSObject *v33;
  void *v34;
  NSObject *v35;
  void *v36;
  char v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  NSObject *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  NSObject *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  double Current;
  void *v54;
  double v55;
  int v56;
  void *v57;
  void *v58;
  int v59;
  unsigned int v60;
  SYFileTransferSyncEngine *val;
  id v62;
  id v63;
  id v64;
  _QWORD v65[4];
  id v66;
  SYFileTransferSyncEngine *v67;
  id v68;
  id v69;
  id v70;
  __int16 v71;
  __int16 v72;
  int v73;
  _QWORD v74[4];
  id v75;
  SYFileTransferSyncEngine *v76;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  uint64_t v79;
  __int16 v80;
  _BYTE v81[10];
  void *v82;
  uint64_t v83;
  __int16 v84;
  int v85;
  __int16 v86;
  uint64_t v87;
  uint64_t v88;

  v88 = *MEMORY[0x24BDAC8D0];
  v62 = a3;
  v63 = a4;
  v12 = a5;
  v64 = a6;
  v13 = a7;
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  val = self;
  -[SYSyncEngine transportActivity](self, "transportActivity");
  v14 = objc_claimAutoreleasedReturnValue();
  os_activity_scope_enter(v14, &state);

  if (_sync_log_facilities_pred != -1)
    _os_once();
  v15 = (id)qword_253D84AF0;
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    v45 = objc_msgSend(v12, "length");
    objc_msgSend(v13, "outgoingResponseIdentifier");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "incomingResponseIdentifier");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218498;
    v79 = v45;
    v80 = 2114;
    *(_QWORD *)v81 = v46;
    *(_WORD *)&v81[8] = 2114;
    v82 = v47;
    _os_log_debug_impl(&dword_211704000, v15, OS_LOG_TYPE_DEBUG, "Receiving: %zu bytes, %{public}@, replying to %{public}@", buf, 0x20u);

  }
  objc_msgSend(v13, "storageGuid");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v16)
  {
    objc_msgSend(v13, "outgoingResponseIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (_sync_log_facilities_pred != -1)
    _os_once();
  v17 = (id)qword_253D84AC0;
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v18 = objc_msgSend(v12, "length");
    *(_DWORD *)buf = 138543618;
    v79 = (uint64_t)v16;
    v80 = 2048;
    *(_QWORD *)v81 = v18;
    _os_log_impl(&dword_211704000, v17, OS_LOG_TYPE_DEFAULT, "File-transfer engine receiving single message with GUID %{public}@, %ld bytes", buf, 0x16u);
  }

  if ((unint64_t)objc_msgSend(v12, "length") > 7)
  {
    v20 = objc_retainAutorelease(v12);
    v60 = *(unsigned __int16 *)objc_msgSend(v20, "bytes");
    v21 = objc_retainAutorelease(v20);
    v59 = *(unsigned __int16 *)(objc_msgSend(v21, "bytes") + 2);
    v22 = objc_retainAutorelease(v21);
    v23 = *(unsigned int *)(objc_msgSend(v22, "bytes") + 4);
    if (objc_msgSend(v22, "length") - 8 >= v23)
    {
      objc_msgSend(v22, "subdataWithRange:", 8, v23);
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      v56 = v23;
      -[SYSyncEngine responder](val, "responder");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = (objc_class *)SYMessageClassForID(v60);
      v31 = v30;
      if (v30)
      {
        v32 = (void *)objc_msgSend([v30 alloc], "initWithData:", v57);
        if (v32)
        {
          if (_sync_log_facilities_pred != -1)
            _os_once();
          v33 = (id)qword_253D84AC0;
          if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
          {
            NSStringFromClass(v31);
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v79 = (uint64_t)v34;
            _os_log_impl(&dword_211704000, v33, OS_LOG_TYPE_DEFAULT, "File-transfer engine decoded incoming %{public}@ message", buf, 0xCu);

          }
          if (_sync_log_facilities_pred != -1)
            _os_once();
          v35 = (id)qword_253D84AF0;
          if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
          {
            Current = CFAbsoluteTimeGetCurrent();
            objc_msgSend(v32, "header");
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v54, "timestamp");
            *(_DWORD *)buf = 138543618;
            v79 = (uint64_t)v16;
            v80 = 2048;
            *(double *)v81 = Current - v55;
            _os_log_debug_impl(&dword_211704000, v35, OS_LOG_TYPE_DEBUG, "Transit time for %{public}@: %.04f seconds", buf, 0x16u);

          }
          objc_msgSend(v32, "header");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = objc_msgSend(v58, "willAcceptMessageWithHeader:messageID:", v36, v16);

          if ((v37 & 1) != 0)
          {
            objc_msgSend(v32, "header");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            -[SYFileTransferSyncEngine _recordLastSeqNo:](val, "_recordLastSeqNo:", v38);

            -[SYFileTransferSyncEngine _suspendIdsQueue](val, "_suspendIdsQueue");
            -[SYSyncEngine service](val, "service");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            if (v59)
            {
              -[SYFileTransferSyncEngine _wrapIncomingResponse:ofType:identifier:](val, "_wrapIncomingResponse:ofType:identifier:", v32, v60, v16);
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v40, "setIdsContext:", v13);
              +[SYStatisticStore sharedInstance](SYStatisticStore, "sharedInstance");
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v39, "name");
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v41, "recordIncomingMessage:forService:", v40, v42);

              v74[0] = MEMORY[0x24BDAC760];
              v74[1] = 3221225472;
              v74[2] = __72__SYFileTransferSyncEngine_service_account_incomingData_fromID_context___block_invoke;
              v74[3] = &unk_24CC66F60;
              v43 = v40;
              v75 = v43;
              v76 = val;
              objc_msgSend(v58, "handleSyncResponse:ofType:completion:", v32, v60, v74);

            }
            else
            {
              -[SYFileTransferSyncEngine _wrapIncomingMessage:ofType:identifier:](val, "_wrapIncomingMessage:ofType:identifier:", v32, v60, v16);
              v50 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v50, "setIdsContext:", v13);
              +[SYStatisticStore sharedInstance](SYStatisticStore, "sharedInstance");
              v51 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v39, "name");
              v52 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v51, "recordIncomingMessage:forService:", v50, v52);

              objc_msgSend(v50, "setExpectsResponse:", 0);
              objc_initWeak((id *)buf, val);
              v65[0] = MEMORY[0x24BDAC760];
              v65[1] = 3221225472;
              v65[2] = __72__SYFileTransferSyncEngine_service_account_incomingData_fromID_context___block_invoke_122;
              v65[3] = &unk_24CC66F88;
              objc_copyWeak(&v70, (id *)buf);
              v43 = v50;
              v71 = v60;
              v72 = 0;
              v73 = v56;
              v66 = v43;
              v67 = val;
              v68 = v13;
              v69 = v58;
              objc_msgSend(v69, "handleSyncRequest:ofType:response:", v32, v60, v65);

              objc_destroyWeak(&v70);
              objc_destroyWeak((id *)buf);
            }

          }
          else
          {
            objc_msgSend(v32, "header");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            -[SYFileTransferSyncEngine _recordLastSeqNo:](val, "_recordLastSeqNo:", v39);
          }
        }
        else
        {
          if (_sync_log_facilities_pred != -1)
            _os_once();
          v48 = (id)qword_253D84AC0;
          if (os_log_type_enabled(v48, (os_log_type_t)0x90u))
          {
            NSStringFromClass(v31);
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            __46__SYFileTransferSyncEngine__readNextProtobuf___block_invoke_107_cold_1(v49, (uint64_t)buf, v48);
          }

          v39 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithSYError:userInfo:", 2016, 0);
          objc_msgSend(v58, "handleSyncError:forMessageWithIdentifier:", v39, v16);
        }

      }
      else
      {
        if (_sync_log_facilities_pred != -1)
          _os_once();
        v44 = qword_253D84AC0;
        if (os_log_type_enabled((os_log_t)qword_253D84AC0, (os_log_type_t)0x90u))
          -[SYFileTransferSyncEngine service:account:incomingData:fromID:context:].cold.2(v60, v44);
        v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithSYError:userInfo:", 2015, 0);
        objc_msgSend(v58, "handleSyncError:forMessageWithIdentifier:", v32, v16);
      }

    }
    else
    {
      v24 = v23;
      if (_sync_log_facilities_pred != -1)
        _os_once();
      v25 = (id)qword_253D84AC0;
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        v26 = objc_msgSend(v22, "length");
        v27 = objc_retainAutorelease(v22);
        v28 = objc_msgSend(v27, "bytes");
        v29 = objc_msgSend(objc_retainAutorelease(v27), "bytes");
        *(_DWORD *)buf = 134219522;
        v79 = v26;
        v80 = 1024;
        *(_DWORD *)v81 = v60;
        *(_WORD *)&v81[4] = 1024;
        *(_DWORD *)&v81[6] = v59;
        LOWORD(v82) = 1024;
        *(_DWORD *)((char *)&v82 + 2) = v24;
        HIWORD(v82) = 2048;
        v83 = v28;
        v84 = 1040;
        v85 = 8;
        v86 = 2096;
        v87 = v29;
        _os_log_impl(&dword_211704000, v25, OS_LOG_TYPE_DEFAULT, "Received a protobuf encoded by NMSMessageCenter? I have %lu bytes of data, and a header saying { msgID %hu, isResponse %hu, msgLen %u }. Header bytes (%p) = %.*P", buf, 0x38u);
      }

      -[SYFileTransferSyncEngine _processNMSMessageData:context:](val, "_processNMSMessageData:context:", v22, v13);
    }
  }
  else
  {
    if (_sync_log_facilities_pred != -1)
      _os_once();
    v19 = qword_253D84AC0;
    if (os_log_type_enabled((os_log_t)qword_253D84AC0, (os_log_type_t)0x90u))
      -[SYFileTransferSyncEngine service:account:incomingData:fromID:context:].cold.1(v19);
  }

  os_activity_scope_leave(&state);
}

void __72__SYFileTransferSyncEngine_service_account_incomingData_fromID_context___block_invoke(uint64_t a1, char a2, void *a3)
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
  objc_msgSend(*(id *)(a1 + 32), "setIdsContext:", 0);
  objc_msgSend(*(id *)(a1 + 40), "_resumeIdsQueue");

}

void __72__SYFileTransferSyncEngine_service_account_incomingData_fromID_context___block_invoke_122(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  unsigned __int16 *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  NSObject *v30;
  void *v31;
  int v32;
  id v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  id v40;
  id v41;
  uint64_t v42;
  uint8_t buf[4];
  int v44;
  __int16 v45;
  id v46;
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  v8 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "service");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (unsigned __int16 *)(a1 + 72);
    objc_msgSend(v8, "_wrapResponse:toRequest:ofType:", v5, *(_QWORD *)(a1 + 32), *(unsigned __int16 *)(a1 + 72));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = v6;
    objc_msgSend(v11, "setPersistentUserInfo:", v6);
    +[SYStatisticStore sharedInstance](SYStatisticStore, "sharedInstance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = v9;
    objc_msgSend(v9, "name");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = v11;
    objc_msgSend(v12, "recordOutgoingMessage:forService:", v11, v13);

    v33 = v5;
    objc_msgSend(v5, "data");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = 0x10000;
    LOWORD(v42) = *(_WORD *)(a1 + 72);
    HIDWORD(v42) = objc_msgSend(v14, "length");
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEC8]), "initWithBytes:length:", &v42, 8);
    v37 = v14;
    objc_msgSend(v15, "appendData:", v14);
    v16 = *(_QWORD *)(a1 + 40);
    v17 = *(void **)(v16 + 136);
    objc_msgSend(*(id *)(v16 + 128), "devices");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "findMatchingIDSDeviceFromList:", v18);
    v19 = objc_claimAutoreleasedReturnValue();

    v36 = (void *)v19;
    v20 = (id)IDSCopyIDForDevice();
    if (!v20)
      v20 = (id)*MEMORY[0x24BE4FD60];
    objc_msgSend(*(id *)(a1 + 48), "priority");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "integerValue");

    objc_msgSend(*(id *)(a1 + 56), "extraTransportOptions");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    IDSOptionsFromSYServiceOptions(v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    v25 = *(void **)(*(_QWORD *)(a1 + 40) + 128);
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", v20);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "idsOptions:", v24);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = 0;
    v41 = 0;
    LODWORD(v25) = objc_msgSend(v25, "sendData:toDestinations:priority:options:identifier:error:", v15, v26, v22, v27, &v41, &v40);
    v28 = v41;
    v38 = v40;

    if ((_DWORD)v25)
    {
      +[SYStatisticStore sharedInstance](SYStatisticStore, "sharedInstance");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "assignIdentifier:toOutgoingMessage:", v28, v39);

      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 208), "addObject:", v28);
      if (_sync_log_facilities_pred != -1)
        _os_once();
      v30 = qword_253D84AC0;
      v31 = v34;
      if (os_log_type_enabled((os_log_t)qword_253D84AC0, OS_LOG_TYPE_INFO))
      {
        v32 = *v10;
        *(_DWORD *)buf = 67109378;
        v44 = v32;
        v45 = 2114;
        v46 = v28;
        _os_log_impl(&dword_211704000, v30, OS_LOG_TYPE_INFO, "Enqueued response to %{companionsync:SYMessageID}hu, got identifier %{public}@", buf, 0x12u);
      }
      if (_sync_log_facilities_pred != -1)
        _os_once();
      v5 = v33;
      v6 = v35;
      if (os_log_type_enabled((os_log_t)qword_253D84AF0, OS_LOG_TYPE_DEBUG))
        __72__SYFileTransferSyncEngine_service_account_incomingData_fromID_context___block_invoke_122_cold_1();
    }
    else
    {
      if (_sync_log_facilities_pred != -1)
        _os_once();
      v5 = v33;
      v31 = v34;
      v6 = v35;
      if (os_log_type_enabled((os_log_t)qword_253D84AC0, OS_LOG_TYPE_ERROR))
        __72__SYFileTransferSyncEngine_service_account_incomingData_fromID_context___block_invoke_122_cold_2();
    }
    objc_msgSend(v8, "_resumeIdsQueue");

  }
}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7 context:(id)a8
{
  _BOOL8 v10;
  id v14;
  id v15;
  id v16;
  NSObject *v17;
  NSObject *v18;
  const char *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  id v31;
  void *v32;
  id v33;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  id v36;
  __int16 v37;
  const char *v38;
  __int16 v39;
  uint64_t v40;
  uint64_t v41;

  v10 = a6;
  v41 = *MEMORY[0x24BDAC8D0];
  v31 = a3;
  v33 = a4;
  v14 = a5;
  v15 = a7;
  v16 = a8;
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  -[SYSyncEngine transportActivity](self, "transportActivity");
  v17 = objc_claimAutoreleasedReturnValue();
  os_activity_scope_enter(v17, &state);

  if (v15 && !v10)
  {
    if (_sync_log_facilities_pred != -1)
      _os_once();
    if (os_log_type_enabled((os_log_t)qword_253D84AC0, OS_LOG_TYPE_ERROR))
      -[SYFileTransferSyncEngine service:account:identifier:didSendWithSuccess:error:context:].cold.1();
    -[SYFileTransferSyncEngine _handleError:messageID:streamer:](self, "_handleError:messageID:streamer:", v15, v14, 0, v31, v33);
  }
  if (_sync_log_facilities_pred != -1)
    _os_once();
  v18 = qword_253D84AC0;
  if (os_log_type_enabled((os_log_t)qword_253D84AC0, OS_LOG_TYPE_DEFAULT))
  {
    v19 = "NO";
    *(_DWORD *)buf = 138543874;
    v36 = v14;
    if (v10)
      v19 = "YES";
    v37 = 2080;
    v38 = v19;
    v39 = 2114;
    v40 = (uint64_t)v15;
    _os_log_impl(&dword_211704000, v18, OS_LOG_TYPE_DEFAULT, "Send confirmation for message %{public}@: success=%s, error=%{public}@", buf, 0x20u);
  }
  -[SYSyncEngine service](self, "service", v31);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSMutableSet containsObject:](self->_singleMessageUUIDs, "containsObject:", v14))
  {
    +[SYStatisticStore sharedInstance](SYStatisticStore, "sharedInstance");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "name");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "updateOutgoingMessageWithIdentifier:forService:sentSuccessfully:sendError:", v14, v22, v10, v15);

    if (_sync_log_facilities_pred != -1)
      _os_once();
    v23 = (id)qword_253D84AF0;
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    {
      _SYObfuscate(v15);
      v24 = objc_claimAutoreleasedReturnValue();
      v25 = (void *)v24;
      v26 = "NO";
      *(_DWORD *)buf = 138543874;
      v36 = v14;
      if (v10)
        v26 = "YES";
      v37 = 2080;
      v38 = v26;
      v39 = 2114;
      v40 = v24;
      _os_log_debug_impl(&dword_211704000, v23, OS_LOG_TYPE_DEBUG, "Device-level ACK: single message, %{public}@ (success=%s, error=%{public}@)", buf, 0x20u);

    }
  }
  else
  {
    +[SYStatisticStore sharedInstance](SYStatisticStore, "sharedInstance");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "updateOutgoingFileTransferWithIdentifier:sentSuccessfully:error:", v14, v10, v15);

    if (_sync_log_facilities_pred != -1)
      _os_once();
    v23 = (id)qword_253D84AF0;
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    {
      _SYObfuscate(v15);
      v28 = objc_claimAutoreleasedReturnValue();
      v29 = (void *)v28;
      v30 = "NO";
      *(_DWORD *)buf = 138543874;
      v36 = v14;
      if (v10)
        v30 = "YES";
      v37 = 2080;
      v38 = v30;
      v39 = 2114;
      v40 = v28;
      _os_log_debug_impl(&dword_211704000, v23, OS_LOG_TYPE_DEBUG, "Device-level ACK: file transfer, %{public}@ (success=%s, error=%{public}@)", buf, 0x20u);

    }
  }

  if (v15)
  {
    os_unfair_lock_lock(&self->_messageMapLock);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_messageIDsToSessionIDs, "setObject:forKeyedSubscript:", 0, v14);
    os_unfair_lock_unlock(&self->_messageMapLock);
  }

  os_activity_scope_leave(&state);
}

- (void)_handleError:(id)a3 messageID:(id)a4 streamer:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;
  void *v19;
  __CFString *v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v10;
  if (v10)
  {
    objc_msgSend(v10, "streamPropertyForKey:", SYAssociatedSessionIdentifierPropertyKey);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v12)
      goto LABEL_9;
  }
  else
  {
    os_unfair_lock_lock(&self->_messageMapLock);
    -[NSMutableDictionary objectForKeyedSubscript:](self->_messageIDsToSessionIDs, "objectForKeyedSubscript:", v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_unlock(&self->_messageMapLock);
    if (!v12)
      goto LABEL_9;
  }
  objc_msgSend(v8, "userInfo");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = v13;
    v15 = (void *)objc_msgSend(v13, "mutableCopy");
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v12, 0x24CC69840);

  }
  else
  {
    v20 = CFSTR("AssociatedSessionIdentifier");
    v21[0] = v12;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v16 = objc_alloc(MEMORY[0x24BDD1540]);
  objc_msgSend(v8, "domain");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v16, "initWithDomain:code:userInfo:", v17, objc_msgSend(v8, "code"), v15);

  v8 = (id)v18;
LABEL_9:
  -[SYSyncEngine responder](self, "responder");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "handleSyncError:forMessageWithIdentifier:", v8, v9);

}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 hasBeenDeliveredWithContext:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  os_activity_scope_state_s v20;
  __CFString *v21;
  void *v22;
  uint8_t buf[4];
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  -[SYSyncEngine transportActivity](self, "transportActivity", 0, 0);
  v14 = objc_claimAutoreleasedReturnValue();
  os_activity_scope_enter(v14, &v20);

  if (_sync_log_facilities_pred != -1)
    _os_once();
  v15 = qword_253D84AC0;
  if (os_log_type_enabled((os_log_t)qword_253D84AC0, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v24 = v12;
    _os_log_impl(&dword_211704000, v15, OS_LOG_TYPE_DEFAULT, "Delivery confirmation for message %{public}@", buf, 0xCu);
  }
  if (_sync_log_facilities_pred != -1)
    _os_once();
  if (os_log_type_enabled((os_log_t)qword_253D84AF0, OS_LOG_TYPE_DEBUG))
    -[SYFileTransferSyncEngine service:account:identifier:hasBeenDeliveredWithContext:].cold.1();
  if (-[NSMutableSet containsObject:](self->_singleMessageUUIDs, "containsObject:", v12))
  {
    +[SYStatisticStore sharedInstance](SYStatisticStore, "sharedInstance");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "confirmDeliveryOfOutgoingMessage:", v12);

  }
  os_unfair_lock_lock(&self->_messageMapLock);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_messageIDsToSessionIDs, "objectForKeyedSubscript:", v12);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_messageIDsToSessionIDs, "setObject:forKeyedSubscript:", 0, v12);
  os_unfair_lock_unlock(&self->_messageMapLock);
  if (v17)
  {
    v21 = CFSTR("AssociatedSessionIdentifier");
    v22 = v17;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v18 = 0;
  }
  -[SYSyncEngine responder](self, "responder");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "sentMessageWithID:context:", v12, v18);

  os_activity_scope_leave(&v20);
}

- (void)service:(id)a3 didSwitchActivePairedDevice:(id)a4 acknowledgementBlock:(id)a5
{
  IDSService *v8;
  id v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  _QWORD block[4];
  id v14;
  SYFileTransferSyncEngine *v15;
  id v16;
  os_activity_scope_state_s state;

  v8 = (IDSService *)a3;
  v9 = a4;
  v10 = a5;
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  -[SYSyncEngine transportActivity](self, "transportActivity");
  v11 = objc_claimAutoreleasedReturnValue();
  os_activity_scope_enter(v11, &state);

  if (self->_idsService == v8)
  {
    -[SYSyncEngine queue](self, "queue");
    v12 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __85__SYFileTransferSyncEngine_service_didSwitchActivePairedDevice_acknowledgementBlock___block_invoke;
    block[3] = &unk_24CC66858;
    v14 = v9;
    v15 = self;
    v16 = v10;
    dispatch_async(v12, block);

  }
  os_activity_scope_leave(&state);

}

uint64_t __85__SYFileTransferSyncEngine_service_didSwitchActivePairedDevice_acknowledgementBlock___block_invoke(_QWORD *a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  if (_sync_log_facilities_pred != -1)
    _os_once();
  v2 = qword_253D84AC0;
  if (os_log_type_enabled((os_log_t)qword_253D84AC0, OS_LOG_TYPE_DEFAULT))
  {
    v3 = a1[4];
    v8 = 138412290;
    v9 = v3;
    _os_log_impl(&dword_211704000, v2, OS_LOG_TYPE_DEFAULT, "Active IDS device changed to: %@", (uint8_t *)&v8, 0xCu);
  }
  +[SYDevice deviceForIDSDevice:](SYDevice, "deviceForIDSDevice:", a1[4]);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = a1[5];
  v6 = *(void **)(v5 + 136);
  *(_QWORD *)(v5 + 136) = v4;

  return (*(uint64_t (**)(void))(a1[6] + 16))();
}

- (void)service:(id)a3 nearbyDevicesChanged:(id)a4
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

- (void)service:(id)a3 connectedDevicesChanged:(id)a4
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

- (unint64_t)_crcChecksum:(id)a3
{
  int v3;
  uLong v4;
  ssize_t v5;
  uInt v6;
  ssize_t v7;
  Bytef buf[4096];
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = open((const char *)objc_msgSend(objc_retainAutorelease(a3), "fileSystemRepresentation"), 0);
  v4 = crc32(0, 0, 0);
  v5 = read(v3, buf, 0x1000uLL);
  if (v5 >= 1)
  {
    v6 = v5;
    do
    {
      v4 = crc32(v4, buf, v6);
      v7 = read(v3, buf, 0x1000uLL);
      v6 = v7;
    }
    while (v7 > 0);
  }
  close(v3);
  return v4;
}

- (NSDictionary)customIDSOptions
{
  return self->_customIDSOptions;
}

- (void)setCustomIDSOptions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 248);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customIDSOptions, 0);
  objc_storeStrong((id *)&self->_responseSessionTransaction, 0);
  objc_storeStrong((id *)&self->_closureTransaction, 0);
  objc_storeStrong((id *)&self->_messageIDsToSessionIDs, 0);
  objc_storeStrong((id *)&self->_singleMessageUUIDs, 0);
  objc_storeStrong((id *)&self->_deferredIncomingSessions, 0);
  objc_storeStrong((id *)&self->_responseMessageRows, 0);
  objc_storeStrong((id *)&self->_messageRows, 0);
  objc_storeStrong((id *)&self->_idsQueue, 0);
  objc_storeStrong((id *)&self->_responseDevice, 0);
  objc_storeStrong((id *)&self->_sessionDevice, 0);
  objc_storeStrong((id *)&self->_activeDevice, 0);
  objc_storeStrong((id *)&self->_idsService, 0);
  objc_storeStrong((id *)&self->_responseStream, 0);
  objc_storeStrong((id *)&self->_responseFileURL, 0);
  objc_storeStrong((id *)&self->_inputPriorityBoostContext, 0);
  objc_storeStrong((id *)&self->_inputStream, 0);
  objc_storeStrong((id *)&self->_inputFileURL, 0);
  objc_storeStrong((id *)&self->_outputStream, 0);
  objc_storeStrong((id *)&self->_outputFileURL, 0);
  objc_storeStrong((id *)&self->_sessionStartMessage, 0);
}

void __91__SYFileTransferSyncEngine_endFileTransferForStream_atURL_target_wasCancelled_messageRows___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_9(&dword_211704000, a2, a3, "Closing output stream %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

void __91__SYFileTransferSyncEngine_endFileTransferForStream_atURL_target_wasCancelled_messageRows___block_invoke_53_cold_2(uint64_t a1, void *a2, NSObject *a3)
{
  void *v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  _SYObfuscate(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_10_1();
  OUTLINED_FUNCTION_7_0(&dword_211704000, a3, (os_log_type_t)0x90u, "Failed to send file at %@ via IDS: %{public}@", v5);

  OUTLINED_FUNCTION_12();
}

void __102__SYFileTransferSyncEngine__enqueueSingleMessage_withMessageID_priority_options_userContext_callback___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0_1(&dword_211704000, v0, v1, "IDS message send failed: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)enqueueSyncRequest:withMessageID:priority:options:userContext:callback:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_9(&dword_211704000, v0, v1, "File-transfer engine caching start request %p", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __99__SYFileTransferSyncEngine_enqueueSyncRequest_withMessageID_priority_options_userContext_callback___block_invoke_82_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0_1(&dword_211704000, v0, v1, "Error writing data to output file stream: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __84__SYFileTransferSyncEngine_outputStreamWithMetadata_priority_options_context_error___block_invoke_cold_1(uint64_t *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = *a1;
  v4 = 138412546;
  v5 = v3;
  v6 = 2114;
  v7 = a2;
  OUTLINED_FUNCTION_7_0(&dword_211704000, a3, OS_LOG_TYPE_ERROR, "Failed to delete unused file-transfer file '%@' : %{public}@", (uint8_t *)&v4);
  OUTLINED_FUNCTION_2();
}

void __84__SYFileTransferSyncEngine_outputStreamWithMetadata_priority_options_context_error___block_invoke_cold_2(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];

  v3 = OUTLINED_FUNCTION_4_1(a1);
  objc_msgSend(a2, "streamError");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_1(&dword_211704000, v3, v5, "Error writing to URL for file transfer: %{public}@", v6);

  OUTLINED_FUNCTION_4_0();
}

void __84__SYFileTransferSyncEngine_outputStreamWithMetadata_priority_options_context_error___block_invoke_cold_3(uint64_t a1, void *a2, void *a3)
{
  NSObject *v4;
  void *v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v4 = a2;
  _SYObfuscate(a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_10_1();
  OUTLINED_FUNCTION_7_0(&dword_211704000, v4, OS_LOG_TYPE_ERROR, "Failed to delete file-transfer file '%@' : %{public}@", v6);

  OUTLINED_FUNCTION_12();
}

void __84__SYFileTransferSyncEngine_outputStreamWithMetadata_priority_options_context_error___block_invoke_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_9(&dword_211704000, v0, v1, "Sent OOB file: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __46__SYFileTransferSyncEngine__readNextProtobuf___block_invoke_107_cold_1(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138543362;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_18_0(&dword_211704000, a2, a3, "File-transfer engine failed to decode incoming %{public}@ message", (uint8_t *)a2);

  OUTLINED_FUNCTION_12_0();
}

void __46__SYFileTransferSyncEngine__readNextProtobuf___block_invoke_107_cold_2(uint64_t a1, uint64_t a2, uint64_t a3, NSObject *a4)
{
  *(_DWORD *)a2 = 134218242;
  *(_QWORD *)(a2 + 4) = a3;
  *(_WORD *)(a2 + 12) = 2114;
  *(_QWORD *)(a2 + 14) = a1;
  OUTLINED_FUNCTION_7_0(&dword_211704000, a4, (os_log_type_t)0x90u, "Out of band message with nil payload found! Request data has size %lu. First 20 bytes = %{public}@", (uint8_t *)a2);
}

- (void)_recordLastSeqNo:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0_1(&dword_211704000, v0, v1, "Failed to store incoming sequence number: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __81__SYFileTransferSyncEngine__consumeRemainingStreamDataWithIdentifier_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0_1(&dword_211704000, v0, v1, "Error reading from incoming file-transfer stream: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __88__SYFileTransferSyncEngine__handleProtobuf_ofType_identifier_isResponse_withCompletion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0_1(&dword_211704000, v0, v1, "Failure dealing with OOB data: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __88__SYFileTransferSyncEngine__handleProtobuf_ofType_identifier_isResponse_withCompletion___block_invoke_2_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_5_2();
  OUTLINED_FUNCTION_0(&dword_211704000, v0, v1, "Failed to write %{companionsync:SYMessageID}hd response to stream, error = %{public}@");
  OUTLINED_FUNCTION_2();
}

- (void)_handleIncomingSessionFileAtURL:metadata:identifier:idsContext:.cold.1()
{
  uint64_t v0;
  NSObject *v1;
  uint8_t v2[14];
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_8_0();
  v3 = v0;
  OUTLINED_FUNCTION_7_0(&dword_211704000, v1, OS_LOG_TYPE_ERROR, "Failed to take ownership of incoming resource at URL '%@': %{public}@", v2);
  OUTLINED_FUNCTION_2();
}

- (void)_handleIncomingSessionFileAtURL:(uint64_t)a1 metadata:(NSObject *)a2 identifier:(uint64_t)a3 idsContext:(double)a4 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, double a4)
{
  int v4;
  uint64_t v5;
  __int16 v6;
  double v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v4 = 138543618;
  v5 = a1;
  v6 = 2048;
  v7 = fabs(a4);
  OUTLINED_FUNCTION_11(&dword_211704000, a2, a3, "Transfer time for %{public}@: %.02f seconds", (uint8_t *)&v4);
  OUTLINED_FUNCTION_2();
}

void __91__SYFileTransferSyncEngine__handleIncomingSessionFileAtURL_metadata_identifier_idsContext___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0_1(&dword_211704000, v0, v1, "Failed to remove incoming file: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_processNMSMessageData:(unsigned __int16)a1 context:(NSObject *)a2 .cold.1(unsigned __int16 a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_211704000, a2, OS_LOG_TYPE_ERROR, "No protobuf class mapping found for message ID %{companionsync:SYMessageID}hu", (uint8_t *)v2, 8u);
  OUTLINED_FUNCTION_3_1();
}

- (void)_processNMSMessageData:(void *)a1 context:(objc_class *)a2 .cold.2(void *a1, objc_class *a2)
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];

  v3 = OUTLINED_FUNCTION_4_1(a1);
  NSStringFromClass(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_1(&dword_211704000, v3, v5, "File-transfer engine failed to decode incoming %{public}@ message", v6);

  OUTLINED_FUNCTION_4_0();
}

- (void)_processNMSMessageData:(uint64_t)a3 context:.cold.3(void *a1, void *a2, uint64_t a3)
{
  NSObject *v5;
  uint8_t v6[14];
  uint64_t v7;

  v5 = OUTLINED_FUNCTION_4_1(a1);
  objc_msgSend(a2, "length");
  OUTLINED_FUNCTION_8_0();
  v7 = a3;
  OUTLINED_FUNCTION_7_0(&dword_211704000, v5, (os_log_type_t)0x90u, "Out of band message with nil payload found! Request data has size %lu. First 20 bytes = %{public}@", v6);

  OUTLINED_FUNCTION_12();
}

- (void)service:(uint64_t)a3 account:(NSObject *)a4 incomingResourceAtURL:metadata:fromID:context:.cold.1(void *a1, void *a2, uint64_t a3, NSObject *a4)
{
  *(_DWORD *)a3 = 138543618;
  *(_QWORD *)(a3 + 4) = a1;
  *(_WORD *)(a3 + 12) = 2114;
  *(_QWORD *)(a3 + 14) = a2;
  OUTLINED_FUNCTION_11(&dword_211704000, a4, a3, "Incoming resource: %{public}@, replying to %{public}@", (uint8_t *)a3);

  OUTLINED_FUNCTION_12_0();
}

- (void)service:(uint8_t *)buf account:(os_log_t)log incomingResourceAtURL:metadata:fromID:context:.cold.2(int a1, int a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 67109376;
  *((_DWORD *)buf + 1) = a1;
  *((_WORD *)buf + 4) = 1024;
  *(_DWORD *)(buf + 10) = a2;
  _os_log_error_impl(&dword_211704000, log, OS_LOG_TYPE_ERROR, "Incoming message CRC failure (0x%08x vs 0x%08x). Terrible things are about to happen.", buf, 0xEu);
}

void __90__SYFileTransferSyncEngine_service_account_incomingResourceAtURL_metadata_fromID_context___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0_1(&dword_211704000, v0, v1, "Failed to process incoming file transfer: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)service:(os_log_t)log account:incomingData:fromID:context:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_211704000, log, (os_log_type_t)0x90u, "Incoming message data too small to contain protobuf header", v1, 2u);
  OUTLINED_FUNCTION_3_1();
}

- (void)service:(unsigned __int16)a1 account:(NSObject *)a2 incomingData:fromID:context:.cold.2(unsigned __int16 a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_211704000, a2, (os_log_type_t)0x90u, "Unknown message ID: %hu", (uint8_t *)v2, 8u);
  OUTLINED_FUNCTION_3_1();
}

void __72__SYFileTransferSyncEngine_service_account_incomingData_fromID_context___block_invoke_122_cold_1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_5_2();
  _os_log_debug_impl(&dword_211704000, v0, OS_LOG_TYPE_DEBUG, "Sent response to %{companionsync:SYMessageID}hu: %{public}@", v1, 0x12u);
  OUTLINED_FUNCTION_2();
}

void __72__SYFileTransferSyncEngine_service_account_incomingData_fromID_context___block_invoke_122_cold_2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_5_2();
  OUTLINED_FUNCTION_0(&dword_211704000, v0, v1, "IDS send failed for response to %{companionsync:SYMessageID}hu, error: %{public}@");
  OUTLINED_FUNCTION_2();
}

- (void)service:account:identifier:didSendWithSuccess:error:context:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0_1(&dword_211704000, v0, v1, "Error sending session via file-transfer: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)service:account:identifier:hasBeenDeliveredWithContext:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_9(&dword_211704000, v0, v1, "App-level ACK: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

@end
