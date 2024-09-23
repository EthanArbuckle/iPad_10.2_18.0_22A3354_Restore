@implementation NMSMediaSyncService

- (NMSMediaSyncService)init
{
  NMSMediaSyncService *v2;
  uint64_t v3;
  IDSService *service;
  void *v5;
  void *v6;
  void *v7;
  objc_class *v8;
  void *v9;
  id v10;
  const char *v11;
  NSObject *v12;
  NSObject *v13;
  dispatch_queue_t v14;
  OS_dispatch_queue *idsActionHandlerQueue;
  NSMutableDictionary *v16;
  NSMutableDictionary *keepLocalCompletionsByIDSMsgID;
  NSObject *v18;
  objc_super v20;
  uint8_t buf[4];
  NMSMediaSyncService *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v20.receiver = self;
  v20.super_class = (Class)NMSMediaSyncService;
  v2 = -[NMSMediaSyncService init](&v20, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x24BE4FCB8]), "initWithService:", CFSTR("com.apple.private.alloy.nanomediasync"));
    service = v2->_service;
    v2->_service = (IDSService *)v3;

    -[NMSMediaSyncService _setProtobufHandlers](v2, "_setProtobufHandlers");
    v5 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bundleIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", CFSTR("%@.%@.idsActionHandlerQueue"), v7, v9);
    v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v11 = (const char *)objc_msgSend(v10, "UTF8String");

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v12 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v12, QOS_CLASS_USER_INITIATED, 0);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = dispatch_queue_create(v11, v13);
    idsActionHandlerQueue = v2->_idsActionHandlerQueue;
    v2->_idsActionHandlerQueue = (OS_dispatch_queue *)v14;

    -[IDSService addDelegate:queue:](v2->_service, "addDelegate:queue:", v2, v2->_idsActionHandlerQueue);
    v16 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    keepLocalCompletionsByIDSMsgID = v2->_keepLocalCompletionsByIDSMsgID;
    v2->_keepLocalCompletionsByIDSMsgID = v16;

  }
  NMLogForCategory(5);
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v22 = v2;
    _os_log_impl(&dword_216E27000, v18, OS_LOG_TYPE_DEFAULT, "NMSMediaSyncService - init: %p", buf, 0xCu);
  }

  return v2;
}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[4];
  NMSMediaSyncService *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  NMLogForCategory(5);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v6 = self;
    _os_log_impl(&dword_216E27000, v3, OS_LOG_TYPE_DEFAULT, "NMSMediaSyncService - dealloc: %p", buf, 0xCu);
  }

  v4.receiver = self;
  v4.super_class = (Class)NMSMediaSyncService;
  -[NMSMediaSyncService dealloc](&v4, sel_dealloc);
}

- (void)performKeepLocalRequestWithEnableState:(int64_t)a3 modelObject:(id)a4 options:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  NMSMediaSyncServiceKeepLocalRequest *v12;
  NMSMediaSyncServiceModelObject *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  NMSMediaSyncServiceKeepLocalOptions *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  uint64_t v22;
  void *v23;
  id v24;

  v24 = a5;
  v10 = a6;
  v11 = a4;
  v12 = objc_alloc_init(NMSMediaSyncServiceKeepLocalRequest);
  -[NMSMediaSyncServiceKeepLocalRequest setEnableState:](v12, "setEnableState:", -[NMSMediaSyncService _convertMPModelObjectKeepLocalEnableState:](self, "_convertMPModelObjectKeepLocalEnableState:", a3));
  v13 = objc_alloc_init(NMSMediaSyncServiceModelObject);
  -[NMSMediaSyncService _midDataFromModelObject:](self, "_midDataFromModelObject:", v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[NMSMediaSyncServiceModelObject setDataMultiverseID:](v13, "setDataMultiverseID:", v14);

  v15 = -[NMSMediaSyncService _containerTypeForModelObject:](self, "_containerTypeForModelObject:", v11);
  -[NMSMediaSyncServiceModelObject setContainerType:](v13, "setContainerType:", v15);
  -[NMSMediaSyncServiceKeepLocalRequest setModelObject:](v12, "setModelObject:", v13);
  v16 = v24;
  if (v24)
  {
    v17 = objc_alloc_init(NMSMediaSyncServiceKeepLocalOptions);
    -[NMSMediaSyncServiceKeepLocalOptions setRequiresValidation:](v17, "setRequiresValidation:", objc_msgSend(v24, "requiresValidation"));
    objc_msgSend(v24, "cellularBundleIdentifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[NMSMediaSyncServiceKeepLocalOptions setCellularBundleIdentifier:](v17, "setCellularBundleIdentifier:", v18);

    -[NMSMediaSyncServiceKeepLocalOptions setDownloadOnCellularPolicy:](v17, "setDownloadOnCellularPolicy:", -[NMSMediaSyncService _convertNMSKeepLocalRequestCellularPolicy:](self, "_convertNMSKeepLocalRequestCellularPolicy:", objc_msgSend(v24, "cellularPolicy")));
    -[NMSMediaSyncServiceKeepLocalOptions setDownloadOffPowerPolicy:](v17, "setDownloadOffPowerPolicy:", -[NMSMediaSyncService _convertNMSKeepLocalRequestPowerPolicy:](self, "_convertNMSKeepLocalRequestPowerPolicy:", objc_msgSend(v24, "powerPolicy")));
    -[NMSMediaSyncServiceKeepLocalOptions setQualityOfService:](v17, "setQualityOfService:", -[NMSMediaSyncService _nmsQOSFromNSQOS:](self, "_nmsQOSFromNSQOS:", objc_msgSend(v24, "qualityOfService")));
    objc_msgSend(v24, "timeout");
    -[NMSMediaSyncServiceKeepLocalOptions setTimeout:](v17, "setTimeout:");
    -[NMSMediaSyncServiceKeepLocalRequest setOptions:](v12, "setOptions:", v17);

    v16 = v24;
  }
  objc_msgSend(v16, "timeout");
  if (v19 <= 0.0)
  {
    v21 = *MEMORY[0x24BE4FA10];
  }
  else
  {
    objc_msgSend(v24, "timeout");
    v21 = v20;
  }
  -[NMSMediaSyncService _sendUrgentMessage:messageType:timeout:completion:](self, "_sendUrgentMessage:messageType:timeout:completion:", v12, 1, v10, v21);
  v22 = objc_claimAutoreleasedReturnValue();
  v23 = (void *)v22;
  if (v10 && v22)
    -[NMSMediaSyncService _performFailSafeWithIDSMessageIdentifier:timeout:](self, "_performFailSafeWithIDSMessageIdentifier:timeout:", v22, v21);

}

- (int)_containerTypeForModelObject:(id)a3
{
  id v3;
  int v4;
  id v6;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = 0;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB0], CFSTR("Unsupported model type. Not allowed."), 0);
      v6 = (id)objc_claimAutoreleasedReturnValue();
      objc_exception_throw(v6);
    }
    v4 = 1;
  }

  return v4;
}

- (id)_midDataFromModelObject:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v14;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = (void *)MEMORY[0x24BE6B170];
    v5 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v3, "identifiers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "library");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "numberWithLongLong:", objc_msgSend(v7, "persistentID"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "midDataFromAlbumPID:", v8);
    v9 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB0], CFSTR("Unsupported model type. Not allowed."), 0);
      v14 = (id)objc_claimAutoreleasedReturnValue();
      objc_exception_throw(v14);
    }
    v10 = (void *)MEMORY[0x24BE6B170];
    v11 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v3, "identifiers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "library");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "numberWithLongLong:", objc_msgSend(v7, "persistentID"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "midDataFromPlaylistPID:", v8);
    v9 = objc_claimAutoreleasedReturnValue();
  }
  v12 = (void *)v9;

  return v12;
}

- (void)_performFailSafeWithIDSMessageIdentifier:(id)a3 timeout:(double)a4
{
  id v6;
  dispatch_time_t v7;
  NSObject *idsActionHandlerQueue;
  id v9;
  _QWORD v10[5];
  id v11;

  v6 = a3;
  v7 = dispatch_time(0, (uint64_t)(a4 * 1000000000.0));
  idsActionHandlerQueue = self->_idsActionHandlerQueue;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __72__NMSMediaSyncService__performFailSafeWithIDSMessageIdentifier_timeout___block_invoke;
  v10[3] = &unk_24D647838;
  v10[4] = self;
  v11 = v6;
  v9 = v6;
  dispatch_after(v7, idsActionHandlerQueue, v10);

}

uint64_t __72__NMSMediaSyncService__performFailSafeWithIDSMessageIdentifier_timeout___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_cleanupKeepLocalCompletionWithID:", *(_QWORD *)(a1 + 40));
}

- (void)_cleanupKeepLocalCompletionWithID:(id)a3
{
  id v4;
  void (**v5)(_QWORD, _QWORD);
  NSObject *v6;
  void *v7;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_idsActionHandlerQueue);
  -[NSMutableDictionary objectForKey:](self->_keepLocalCompletionsByIDSMsgID, "objectForKey:", v4);
  v5 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    NMLogForCategory(5);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[NMSMediaSyncService _cleanupKeepLocalCompletionWithID:].cold.1();

    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("NMSKeepLocalRequestErrorDomain"), 2, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v5)[2](v5, v7);
    -[NSMutableDictionary removeObjectForKey:](self->_keepLocalCompletionsByIDSMsgID, "removeObjectForKey:", v4);

  }
}

- (id)_sendUrgentMessage:(id)a3 messageType:(int64_t)a4 timeout:(double)a5 completion:(id)a6
{
  id v10;
  void *v11;
  id v12;
  void *v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  NSObject *idsActionHandlerQueue;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  _QWORD v23[5];
  id v24;
  id v25;
  id v26;
  uint64_t v27;
  id v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  uint64_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v10 = a6;
  v26 = 0;
  -[NMSMediaSyncService _sendUrgentProtoBufForMessage:messageType:timeout:error:](self, "_sendUrgentProtoBufForMessage:messageType:timeout:error:", a3, a4, &v26, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v26;
  v13 = v12;
  if (v10)
  {
    if (v11)
    {
      NMLogForCategory(5);
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v15 = (void *)MEMORY[0x219A03B50](v10);
        v16 = -[NSMutableDictionary count](self->_keepLocalCompletionsByIDSMsgID, "count");
        *(_DWORD *)buf = 134218498;
        v30 = v15;
        v31 = 2112;
        v32 = v11;
        v33 = 2048;
        v34 = v16;
        _os_log_impl(&dword_216E27000, v14, OS_LOG_TYPE_DEFAULT, "Adding completion-handler %p for ID=%@. Total-pending: %lu", buf, 0x20u);

      }
      idsActionHandlerQueue = self->_idsActionHandlerQueue;
      v23[0] = MEMORY[0x24BDAC760];
      v23[1] = 3221225472;
      v23[2] = __73__NMSMediaSyncService__sendUrgentMessage_messageType_timeout_completion___block_invoke;
      v23[3] = &unk_24D647C30;
      v23[4] = self;
      v25 = v10;
      v24 = v11;
      dispatch_async(idsActionHandlerQueue, v23);

    }
    else
    {
      v18 = (void *)MEMORY[0x24BDD1540];
      v27 = *MEMORY[0x24BDD1398];
      v28 = v12;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v28, &v27, 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "errorWithDomain:code:userInfo:", CFSTR("NMSKeepLocalRequestErrorDomain"), 0, v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      (*((void (**)(id, void *))v10 + 2))(v10, v20);
      NMLogForCategory(5);
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        -[NMSMediaSyncService _sendUrgentMessage:messageType:timeout:completion:].cold.1(v21);

    }
  }

  return v11;
}

void __73__NMSMediaSyncService__sendUrgentMessage_messageType_timeout_completion___block_invoke(_QWORD *a1)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1[4] + 24);
  v3 = (id)MEMORY[0x219A03B50](a1[6]);
  objc_msgSend(v2, "setObject:forKey:", v3, a1[5]);

}

- (id)_sendUrgentProtoBufForMessage:(id)a3 messageType:(int64_t)a4 timeout:(double)a5 error:(id *)a6
{
  unsigned __int16 v8;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  IDSService *service;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  id v21;
  NSObject *v22;
  NSObject *v23;
  id v25;
  id v26;
  uint8_t buf[4];
  id v28;
  __int16 v29;
  id v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v8 = a4;
  v33 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = objc_alloc(MEMORY[0x24BE4FC88]);
  objc_msgSend(v10, "data");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v11, "initWithProtobufData:type:isResponse:", v12, v8, 0);

  -[NMSMediaSyncService _defaultPairedDevice](self, "_defaultPairedDevice");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  service = self->_service;
  v16 = (void *)MEMORY[0x24BDBCF20];
  v17 = (void *)IDSCopyIDForDevice();
  objc_msgSend(v16, "setWithObject:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[NMSMediaSyncService _idsMessageOptionsWithTimeout:](self, "_idsMessageOptionsWithTimeout:", a5);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0;
  v20 = -[IDSService sendProtobuf:toDestinations:priority:options:identifier:error:](service, "sendProtobuf:toDestinations:priority:options:identifier:error:", v13, v18, 300, v19, &v26, a6);
  v21 = v26;

  NMLogForCategory(5);
  v22 = objc_claimAutoreleasedReturnValue();
  v23 = v22;
  if ((v20 & 1) != 0)
  {
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v28 = v10;
      v29 = 2112;
      v30 = v21;
      _os_log_impl(&dword_216E27000, v23, OS_LOG_TYPE_DEFAULT, "Successfully requested send of IDS message (%@) with ID: %@.", buf, 0x16u);
    }
  }
  else if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
  {
    if (a6)
      v25 = *a6;
    else
      v25 = 0;
    *(_DWORD *)buf = 138412802;
    v28 = v10;
    v29 = 2112;
    v30 = v21;
    v31 = 2112;
    v32 = v25;
    _os_log_error_impl(&dword_216E27000, v23, OS_LOG_TYPE_ERROR, "Failed to request send of IDS message (%@) with ID: %@. Error: %@", buf, 0x20u);
  }

  return v21;
}

- (id)_idsMessageOptionsWithTimeout:(double)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  _QWORD v8[3];
  _QWORD v9[4];

  v9[3] = *MEMORY[0x24BDAC8D0];
  v8[0] = *MEMORY[0x24BE4FB30];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x24BE4FAC0];
  v9[0] = v3;
  v9[1] = MEMORY[0x24BDBD1C8];
  v5 = *MEMORY[0x24BE4FAA0];
  v8[1] = v4;
  v8[2] = v5;
  v9[2] = MEMORY[0x24BDBD1C8];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, v8, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_defaultPairedDevice
{
  void *v2;
  id v3;
  uint64_t v4;
  void *i;
  void *v6;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[IDSService devices](self->_service, "devices", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (id)objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v9;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(_QWORD *)v9 != v4)
          objc_enumerationMutation(v2);
        v6 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v6, "isDefaultPairedDevice"))
        {
          v3 = v6;
          goto LABEL_11;
        }
      }
      v3 = (id)objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
}

- (void)_setProtobufHandlers
{
  -[IDSService setProtobufAction:forIncomingRequestsOfType:](self->_service, "setProtobufAction:forIncomingRequestsOfType:", sel__handleMediaSyncServiceKeepLocalRequest_service_account_fromID_context_, 1);
  -[IDSService setProtobufAction:forIncomingRequestsOfType:](self->_service, "setProtobufAction:forIncomingRequestsOfType:", sel__handleMediaSyncServiceKeepLocalResponse_service_account_fromID_context_, 2);
}

- (BOOL)_sendUrgentServiceResultMessage:(id)a3 idsMessageID:(id)a4 timeout:(double)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  IDSService *service;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  id v19;
  id v20;
  NSObject *v21;
  NSObject *v22;
  id v24;
  id v25;
  uint8_t buf[4];
  id v27;
  __int16 v28;
  id v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  -[NMSMediaSyncService _defaultPairedDevice](self, "_defaultPairedDevice");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NMSMediaSyncService _idsMessageOptionsWithTimeout:](self, "_idsMessageOptionsWithTimeout:", a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithDictionary:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKey:", v9, *MEMORY[0x24BE4FAF0]);

  NMLogForCategory(5);
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v27 = v10;
    _os_log_impl(&dword_216E27000, v13, OS_LOG_TYPE_DEFAULT, "Sending validation result IDS message to default paired device: %@", buf, 0xCu);
  }

  service = self->_service;
  v15 = (void *)MEMORY[0x24BDBCF20];
  v16 = (void *)IDSCopyIDForDevice();
  objc_msgSend(v15, "setWithObject:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0;
  v25 = 0;
  v18 = -[IDSService sendProtobuf:toDestinations:priority:options:identifier:error:](service, "sendProtobuf:toDestinations:priority:options:identifier:error:", v8, v17, 300, v12, &v25, &v24);
  v19 = v25;
  v20 = v24;

  NMLogForCategory(5);
  v21 = objc_claimAutoreleasedReturnValue();
  v22 = v21;
  if ((v18 & 1) != 0)
  {
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v27 = v8;
      v28 = 2112;
      v29 = v19;
      _os_log_impl(&dword_216E27000, v22, OS_LOG_TYPE_DEFAULT, "Successfully requested send of IDS message (%@) with ID: %@.", buf, 0x16u);
    }
  }
  else if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412802;
    v27 = v8;
    v28 = 2112;
    v29 = v19;
    v30 = 2112;
    v31 = v20;
    _os_log_error_impl(&dword_216E27000, v22, OS_LOG_TYPE_ERROR, "Failed to request send of IDS message (%@) with ID: %@. Error: %@", buf, 0x20u);
  }

  return v18;
}

- (BOOL)_sendUrgentServiceResponseWithError:(id)a3 idsMessageID:(id)a4 timeout:(double)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  NSObject *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  BOOL v19;

  v8 = a3;
  v9 = a4;
  v10 = (void *)objc_opt_new();
  v11 = v10;
  if (v8)
  {
    objc_msgSend(v10, "setErrorCode:", 0);
    objc_msgSend(v8, "domain");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("NMSKeepLocalRequestErrorDomain"));

    if (!v13)
    {
      NMLogForCategory(5);
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        -[NMSMediaSyncService _sendUrgentServiceResponseWithError:idsMessageID:timeout:].cold.1();
      goto LABEL_7;
    }
    if (objc_msgSend(v8, "code") == 1)
    {
      objc_msgSend(v11, "setErrorCode:", 1);
      objc_msgSend(v8, "userInfo");
      v14 = objc_claimAutoreleasedReturnValue();
      -[NSObject objectForKey:](v14, "objectForKey:", CFSTR("NMSKeepLocalRequestErrorValidatorExceptionKey"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[NMSMediaSyncService _setMessage:withValidatorException:](self, "_setMessage:withValidatorException:", v11, objc_msgSend(v15, "unsignedIntegerValue"));

LABEL_7:
    }
  }
  v16 = objc_alloc(MEMORY[0x24BE4FC88]);
  objc_msgSend(v11, "data");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v16, "initWithProtobufData:type:isResponse:", v17, 2, 0);

  v19 = -[NMSMediaSyncService _sendUrgentServiceResultMessage:idsMessageID:timeout:](self, "_sendUrgentServiceResultMessage:idsMessageID:timeout:", v18, v9, a5);
  return v19;
}

- (void)_setMessage:(id)a3 withValidatorException:(unint64_t)a4
{
  id v5;
  id v6;

  v5 = a3;
  if (!a4)
    goto LABEL_9;
  v6 = v5;
  if ((a4 & 2) != 0)
  {
    objc_msgSend(v5, "addValidatorException:", 1);
    v5 = v6;
    if ((a4 & 4) == 0)
    {
LABEL_4:
      if ((a4 & 0x40) == 0)
        goto LABEL_5;
      goto LABEL_12;
    }
  }
  else if ((a4 & 4) == 0)
  {
    goto LABEL_4;
  }
  objc_msgSend(v6, "addValidatorException:", 2);
  v5 = v6;
  if ((a4 & 0x40) == 0)
  {
LABEL_5:
    if ((a4 & 8) == 0)
      goto LABEL_6;
    goto LABEL_13;
  }
LABEL_12:
  objc_msgSend(v6, "addValidatorException:", 6);
  v5 = v6;
  if ((a4 & 8) == 0)
  {
LABEL_6:
    if ((a4 & 0x10) == 0)
      goto LABEL_7;
LABEL_14:
    objc_msgSend(v6, "addValidatorException:", 4);
    v5 = v6;
    if ((a4 & 0x20) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
LABEL_13:
  objc_msgSend(v6, "addValidatorException:", 3);
  v5 = v6;
  if ((a4 & 0x10) != 0)
    goto LABEL_14;
LABEL_7:
  if ((a4 & 0x20) != 0)
  {
LABEL_8:
    objc_msgSend(v6, "addValidatorException:", 5);
    v5 = v6;
  }
LABEL_9:

}

- (Class)_modelClassForContainerType:(int)a3
{
  id v4;

  if (a3 > 1)
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB0], CFSTR("Unsupported container type specified."), 0);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v4);
  }
  objc_opt_class();
  return (Class)(id)objc_claimAutoreleasedReturnValue();
}

- (void)_callAndRemoveKeepLocalCompletionWithIDSMessageID:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  id v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_idsActionHandlerQueue);
  -[NSMutableDictionary objectForKey:](self->_keepLocalCompletionsByIDSMsgID, "objectForKey:", v6);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v8)
  {
    (*(void (**)(uint64_t, id))(v8 + 16))(v8, v7);
    -[NSMutableDictionary removeObjectForKey:](self->_keepLocalCompletionsByIDSMsgID, "removeObjectForKey:", v6);
    NMLogForCategory(5);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = (void *)MEMORY[0x219A03B50](v9);
      v12 = -[NSMutableDictionary count](self->_keepLocalCompletionsByIDSMsgID, "count");
      v14 = 134218498;
      v15 = v11;
      v16 = 2114;
      v17 = (uint64_t)v6;
      v18 = 2048;
      v19 = v12;
      _os_log_impl(&dword_216E27000, v10, OS_LOG_TYPE_DEFAULT, "Called and removed completion-handler %p for ID=<%{public}@>. Total-pending: %lu", (uint8_t *)&v14, 0x20u);

    }
  }
  else
  {
    NMLogForCategory(5);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v13 = -[NSMutableDictionary count](self->_keepLocalCompletionsByIDSMsgID, "count");
      v14 = 138543618;
      v15 = v6;
      v16 = 2048;
      v17 = v13;
      _os_log_impl(&dword_216E27000, v10, OS_LOG_TYPE_DEFAULT, "Unable to find completion-handler for ID=<%{public}@>. Total-pending: %lu", (uint8_t *)&v14, 0x16u);
    }
  }

}

- (void)service:(id)a3 account:(id)a4 incomingUnhandledProtobuf:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v8;
  id v9;
  NSObject *v10;

  v8 = a3;
  v9 = a5;
  NMLogForCategory(5);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    -[NMSMediaSyncService service:account:incomingUnhandledProtobuf:fromID:context:].cold.1();

}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7 context:(id)a8
{
  _BOOL4 v9;
  id v11;
  id v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  id v27;
  uint64_t v28;
  id v29;
  uint64_t v30;
  id v31;
  uint8_t buf[4];
  id v33;
  uint64_t v34;

  v9 = a6;
  v34 = *MEMORY[0x24BDAC8D0];
  v11 = a5;
  v12 = a7;
  NMLogForCategory(5);
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (!v9)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[NMSMediaSyncService service:account:identifier:didSendWithSuccess:error:context:].cold.1();

    objc_msgSend(v12, "domain");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = *MEMORY[0x24BE4F9D0];
    if (objc_msgSend(v15, "isEqualToString:", *MEMORY[0x24BE4F9D0]))
    {
      v17 = objc_msgSend(v12, "code");

      if (v17 == 43)
      {
        v18 = (void *)MEMORY[0x24BDD1540];
        v30 = *MEMORY[0x24BDD1398];
        v31 = v12;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v31, &v30, 1);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = v18;
        v21 = 3;
LABEL_15:
        objc_msgSend(v20, "errorWithDomain:code:userInfo:", CFSTR("NMSKeepLocalRequestErrorDomain"), v21, v19);
        v14 = objc_claimAutoreleasedReturnValue();

        -[NMSMediaSyncService _callAndRemoveKeepLocalCompletionWithIDSMessageID:error:](self, "_callAndRemoveKeepLocalCompletionWithIDSMessageID:error:", v11, v14);
        goto LABEL_16;
      }
    }
    else
    {

    }
    objc_msgSend(v12, "domain");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v22, "isEqualToString:", v16))
    {
      v23 = objc_msgSend(v12, "code");

      if (v23 == 23)
      {
        v24 = (void *)MEMORY[0x24BDD1540];
        v28 = *MEMORY[0x24BDD1398];
        v29 = v12;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v29, &v28, 1);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = v24;
        v21 = 2;
        goto LABEL_15;
      }
    }
    else
    {

    }
    v25 = (void *)MEMORY[0x24BDD1540];
    v26 = *MEMORY[0x24BDD1398];
    v27 = v12;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v25;
    v21 = 0;
    goto LABEL_15;
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v33 = v11;
    _os_log_impl(&dword_216E27000, v14, OS_LOG_TYPE_DEFAULT, "Successfully sent message (ID: %@).", buf, 0xCu);
  }
LABEL_16:

}

- (void)_handleMediaSyncServiceKeepLocalRequest:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v9;
  NSObject *idsActionHandlerQueue;
  id v11;
  NMSMediaSyncServiceKeepLocalRequest *v12;
  void *v13;
  NMSMediaSyncServiceKeepLocalRequest *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  objc_class *v22;
  void *v23;
  int64_t v24;
  NMSKeepLocalRequestOptions *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  NMSKeepLocalRequestLocal *v34;
  id v35;
  NMSKeepLocalRequestOptions *v36;
  _QWORD v37[4];
  NMSKeepLocalRequestOptions *v38;
  NMSMediaSyncService *v39;
  id v40;
  uint8_t buf[4];
  NMSMediaSyncServiceKeepLocalRequest *v42;
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v9 = a7;
  idsActionHandlerQueue = self->_idsActionHandlerQueue;
  v11 = a3;
  dispatch_assert_queue_V2(idsActionHandlerQueue);
  v12 = [NMSMediaSyncServiceKeepLocalRequest alloc];
  objc_msgSend(v11, "data");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = -[NMSMediaSyncServiceKeepLocalRequest initWithData:](v12, "initWithData:", v13);
  NMLogForCategory(5);
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v42 = v14;
    _os_log_impl(&dword_216E27000, v15, OS_LOG_TYPE_DEFAULT, "NMSMediaSyncService - _handleMediaSyncServiceKeepLocalRequest: %@", buf, 0xCu);
  }

  v16 = (void *)MEMORY[0x24BE6B170];
  -[NMSMediaSyncServiceKeepLocalRequest modelObject](v14, "modelObject");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "dataMultiverseID");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "pidFromMIDData:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "longLongValue");

  -[NMSMediaSyncServiceKeepLocalRequest modelObject](v14, "modelObject");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = -[NMSMediaSyncService _modelClassForContainerType:](self, "_modelClassForContainerType:", objc_msgSend(v21, "containerType"));

  -[objc_class nms_modelObjectWithLibraryPersistentID:](v22, "nms_modelObjectWithLibraryPersistentID:", v20);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = -[NMSMediaSyncService _convertMediaSyncServiceKeepLocalEnableState:](self, "_convertMediaSyncServiceKeepLocalEnableState:", -[NMSMediaSyncServiceKeepLocalRequest enableState](v14, "enableState"));
  v25 = objc_alloc_init(NMSKeepLocalRequestOptions);
  -[NMSMediaSyncServiceKeepLocalRequest options](v14, "options");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[NMSKeepLocalRequestOptions setRequiresValidation:](v25, "setRequiresValidation:", objc_msgSend(v26, "requiresValidation"));

  -[NMSMediaSyncServiceKeepLocalRequest options](v14, "options");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "cellularBundleIdentifier");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[NMSKeepLocalRequestOptions setCellularBundleIdentifier:](v25, "setCellularBundleIdentifier:", v28);

  -[NMSMediaSyncServiceKeepLocalRequest options](v14, "options");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[NMSKeepLocalRequestOptions setPowerPolicy:](v25, "setPowerPolicy:", -[NMSMediaSyncService _convertMediaSyncServiceKeepLocalPowerPolicy:](self, "_convertMediaSyncServiceKeepLocalPowerPolicy:", objc_msgSend(v29, "downloadOffPowerPolicy")));

  -[NMSMediaSyncServiceKeepLocalRequest options](v14, "options");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[NMSKeepLocalRequestOptions setCellularPolicy:](v25, "setCellularPolicy:", -[NMSMediaSyncService _convertMediaSyncServiceKeepLocalCellularPolicy:](self, "_convertMediaSyncServiceKeepLocalCellularPolicy:", objc_msgSend(v30, "downloadOnCellularPolicy")));

  -[NMSMediaSyncServiceKeepLocalRequest options](v14, "options");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[NMSKeepLocalRequestOptions setQualityOfService:](v25, "setQualityOfService:", -[NMSMediaSyncService _nsQOSFromNMSQOS:](self, "_nsQOSFromNMSQOS:", objc_msgSend(v31, "qualityOfService")));

  -[NMSMediaSyncServiceKeepLocalRequest options](v14, "options");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v28) = objc_msgSend(v32, "hasTimeout");

  if ((_DWORD)v28)
  {
    -[NMSMediaSyncServiceKeepLocalRequest options](v14, "options");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "timeout");
    -[NMSKeepLocalRequestOptions setTimeout:](v25, "setTimeout:");

  }
  v34 = -[NMSKeepLocalRequest initWithModelObject:enableState:]([NMSKeepLocalRequestLocal alloc], "initWithModelObject:enableState:", v23, v24);
  v37[0] = MEMORY[0x24BDAC760];
  v37[1] = 3221225472;
  v37[2] = __94__NMSMediaSyncService__handleMediaSyncServiceKeepLocalRequest_service_account_fromID_context___block_invoke;
  v37[3] = &unk_24D647C58;
  v38 = v25;
  v39 = self;
  v40 = v9;
  v35 = v9;
  v36 = v25;
  -[NMSKeepLocalRequestLocal performWithOptions:completion:](v34, "performWithOptions:completion:", v36, v37);

}

void __94__NMSMediaSyncService__handleMediaSyncServiceKeepLocalRequest_service_account_fromID_context___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  NMLogForCategory(5);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138412290;
    v11 = v3;
    _os_log_impl(&dword_216E27000, v4, OS_LOG_TYPE_DEFAULT, "Result of perform KeepLocal task. Error: %@", (uint8_t *)&v10, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "timeout");
  if (v5 <= 0.0)
  {
    v7 = *MEMORY[0x24BE4FA10];
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "timeout");
    v7 = v6;
  }
  v8 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 48), "outgoingResponseIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_sendUrgentServiceResponseWithError:idsMessageID:timeout:", v3, v9, v7);

}

- (void)_handleMediaSyncServiceKeepLocalResponse:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v9;
  id v10;
  NMSMediaSyncServiceKeepLocalResponse *v11;
  void *v12;
  NMSMediaSyncServiceKeepLocalResponse *v13;
  NSObject *v14;
  int v15;
  uint64_t v16;
  unint64_t v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  uint64_t v24;
  NSObject *v25;
  uint8_t buf[4];
  NMSMediaSyncServiceKeepLocalResponse *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a7;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_idsActionHandlerQueue);
  v11 = [NMSMediaSyncServiceKeepLocalResponse alloc];
  objc_msgSend(v9, "data");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[NMSMediaSyncServiceKeepLocalResponse initWithData:](v11, "initWithData:", v12);

  NMLogForCategory(5);
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v27 = v13;
    _os_log_impl(&dword_216E27000, v14, OS_LOG_TYPE_DEFAULT, "NMSMediaSyncService - _handleMediaSyncServiceKeepLocalResponse: %@", buf, 0xCu);
  }

  if (-[NMSMediaSyncServiceKeepLocalResponse hasErrorCode](v13, "hasErrorCode"))
  {
    v15 = -[NMSMediaSyncServiceKeepLocalResponse errorCode](v13, "errorCode");
    if (v15)
    {
      if (v15 == 1)
      {
        v16 = 0;
        if (-[NMSMediaSyncServiceKeepLocalResponse validatorExceptionsCount](v13, "validatorExceptionsCount"))
        {
          v17 = 0;
          do
            v16 |= -[NMSMediaSyncService _nmsKeepLocalExceptionFromNMSSyncServiceException:](self, "_nmsKeepLocalExceptionFromNMSSyncServiceException:", -[NMSMediaSyncServiceKeepLocalResponse validatorExceptionAtIndex:](v13, "validatorExceptionAtIndex:", v17++));
          while (v17 < -[NMSMediaSyncServiceKeepLocalResponse validatorExceptionsCount](v13, "validatorExceptionsCount"));
        }
        v18 = (void *)MEMORY[0x24BDD1540];
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v16, CFSTR("NMSKeepLocalRequestErrorValidatorExceptionKey"));
        v19 = objc_claimAutoreleasedReturnValue();
        v25 = v19;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "errorWithDomain:code:userInfo:", CFSTR("NMSKeepLocalRequestErrorDomain"), 1, v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_17:
        goto LABEL_18;
      }
    }
    else
    {
      NMLogForCategory(5);
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        -[NMSMediaSyncService _handleMediaSyncServiceKeepLocalResponse:service:account:fromID:context:].cold.2();

    }
    NMLogForCategory(5);
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      -[NMSMediaSyncService _handleMediaSyncServiceKeepLocalResponse:service:account:fromID:context:].cold.1();
    v21 = 0;
    goto LABEL_17;
  }
  v21 = 0;
LABEL_18:
  objc_msgSend(v10, "incomingResponseIdentifier");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[NMSMediaSyncService _callAndRemoveKeepLocalCompletionWithIDSMessageID:error:](self, "_callAndRemoveKeepLocalCompletionWithIDSMessageID:error:", v23, v21);

}

- (unint64_t)_convertMediaSyncServiceKeepLocalCellularPolicy:(int)a3
{
  uint64_t v3;
  uint64_t v4;
  id v6;

  if (a3 >= 3)
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB0], CFSTR("Unsupported Media Sync Service cellular policy specified."), 0, v3, v4);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v6);
  }
  return a3;
}

- (int)_convertNMSKeepLocalRequestCellularPolicy:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  id v6;

  if (a3 >= 3)
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB0], CFSTR("Unsupported NMS cellular policy specified."), 0, v3, v4);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v6);
  }
  return a3;
}

- (unint64_t)_convertMediaSyncServiceKeepLocalPowerPolicy:(int)a3
{
  uint64_t v3;
  uint64_t v4;
  id v6;

  if (a3 >= 3)
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB0], CFSTR("Unsupported Media Sync Service power policy specified."), 0, v3, v4);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v6);
  }
  return a3;
}

- (int)_convertNMSKeepLocalRequestPowerPolicy:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  id v6;

  if (a3 >= 3)
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB0], CFSTR("Unsupported NMS power policy specified."), 0, v3, v4);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v6);
  }
  return a3;
}

- (int)_convertMPModelObjectKeepLocalEnableState:(int64_t)a3
{
  id v4;

  if ((unint64_t)(a3 + 1) >= 5)
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB0], CFSTR("Unknown KeepLocalEnableState specified."), 0);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v4);
  }
  return dword_216E74610[a3 + 1];
}

- (int64_t)_convertMediaSyncServiceKeepLocalEnableState:(int)a3
{
  id v4;

  if (a3 >= 5)
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB0], CFSTR("Unknown NMS KeepLocalEnableState specified."), 0);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v4);
  }
  return qword_216E74628[a3];
}

- (int)_nmsQOSFromNSQOS:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  id v6;

  if (a3 <= 16)
  {
    if (a3 == -1)
    {
      return 0;
    }
    else
    {
      if (a3 != 9)
        goto LABEL_12;
      return 1;
    }
  }
  else
  {
    switch(a3)
    {
      case 17:
        return 2;
      case 33:
        return 4;
      case 25:
        return 3;
      default:
LABEL_12:
        objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB0], CFSTR("Unsupported NS-QOS specified."), 0, v3, v4);
        v6 = (id)objc_claimAutoreleasedReturnValue();
        objc_exception_throw(v6);
    }
  }
}

- (int64_t)_nsQOSFromNMSQOS:(int)a3
{
  id v4;

  if (a3 >= 5)
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB0], CFSTR("Unsupported NMS-QOS specified."), 0);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v4);
  }
  return qword_216E74650[a3];
}

- (unint64_t)_nmsKeepLocalExceptionFromNMSSyncServiceException:(int)a3
{
  id v4;

  if ((a3 - 1) >= 6)
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB0], CFSTR("Unsupported KeepLocal validator exception specified."), 0);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v4);
  }
  return qword_216E74678[a3 - 1];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keepLocalCompletionsByIDSMsgID, 0);
  objc_storeStrong((id *)&self->_idsActionHandlerQueue, 0);
  objc_storeStrong((id *)&self->_service, 0);
}

- (void)_cleanupKeepLocalCompletionWithID:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_0(&dword_216E27000, v0, v1, "_cleanupKeepLocalCompletionWithID - FAIL-SAFE: Found orphaned completion-handler for message ID: %@. Calling completion-handler and removing from pending list.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_sendUrgentMessage:(os_log_t)log messageType:timeout:completion:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_216E27000, log, OS_LOG_TYPE_ERROR, "Failed to receive an IDS message ID. Completion handler called with error result.", v1, 2u);
}

- (void)_sendUrgentServiceResponseWithError:idsMessageID:timeout:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_0(&dword_216E27000, v0, v1, "Unknown error domain specified. error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)service:account:incomingUnhandledProtobuf:fromID:context:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0(&dword_216E27000, v0, v1, "UNHANDLED IDS Protobuf %@ for service %@ has been received. This should have a setProtobufAction assigned.");
  OUTLINED_FUNCTION_1();
}

- (void)service:account:identifier:didSendWithSuccess:error:context:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0(&dword_216E27000, v0, v1, "Failed to send IDS message (ID: %@) with error \"%@\".");
  OUTLINED_FUNCTION_1();
}

- (void)_handleMediaSyncServiceKeepLocalResponse:service:account:fromID:context:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_0(&dword_216E27000, v0, v1, "NMSMediaSyncService - _handleMediaSyncServiceKeepLocalResponse: received a unknown error code from the remote device.  message: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_handleMediaSyncServiceKeepLocalResponse:service:account:fromID:context:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_0(&dword_216E27000, v0, v1, "NMSMediaSyncService - _handleMediaSyncServiceKeepLocalResponse: received a Generic error code from the remote device.  message: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
