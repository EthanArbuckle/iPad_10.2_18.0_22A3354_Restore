@implementation CommunicationsFilterBlockList

CommunicationsFilterBlockList *__47__CommunicationsFilterBlockList_sharedInstance__block_invoke()
{
  CommunicationsFilterBlockList *result;

  result = objc_alloc_init(CommunicationsFilterBlockList);
  sharedInstance_sInstance = (uint64_t)result;
  return result;
}

- (CommunicationsFilterBlockList)init
{
  CommunicationsFilterBlockList *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CommunicationsFilterBlockList;
  v2 = -[CommunicationsFilterBlockList init](&v4, sel_init);
  if (v2)
  {
    v2->_cache = objc_alloc_init(CommunicationsFilterBlockListCache);
    v2->_queue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.cmfblocklist", 0);
  }
  return v2;
}

+ (id)sharedInstance
{
  if (sharedInstance_creation != -1)
    dispatch_once(&sharedInstance_creation, &__block_literal_global_0);
  return (id)sharedInstance_sInstance;
}

uint64_t __65__CommunicationsFilterBlockList__sendXPCRequest_completionBlock___block_invoke(uint64_t a1)
{
  xpc_object_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  uint64_t result;
  int v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  if (!objc_msgSend(*(id *)(a1 + 32), "_connect"))
  {
    v4 = objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BE507B0], -1, 0);
    v5 = 0;
    goto LABEL_21;
  }
  v2 = xpc_connection_send_message_with_reply_sync(*(xpc_connection_t *)(*(_QWORD *)(a1 + 32) + 8), *(xpc_object_t *)(a1 + 40));
  v3 = MEMORY[0x20BD09C68]();
  if (v3 == MEMORY[0x24BDACFB8])
  {
    if (v2 == (xpc_object_t)MEMORY[0x24BDACF38])
    {
      v12 = CMFDefaultLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        __65__CommunicationsFilterBlockList__sendXPCRequest_completionBlock___block_invoke_cold_1();
    }
    else if (v2 == (xpc_object_t)MEMORY[0x24BDACF30])
    {
      v6 = CMFDefaultLog();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        __65__CommunicationsFilterBlockList__sendXPCRequest_completionBlock___block_invoke_cold_2();
    }
    v4 = objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BE507B0], -1, 0);
  }
  else
  {
    if (v3 == MEMORY[0x24BDACFA0])
    {
      v7 = CMFDefaultLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v8 = *(_QWORD *)(a1 + 32);
        v14 = 134217984;
        v15 = v8;
        _os_log_impl(&dword_20849D000, v7, OS_LOG_TYPE_DEFAULT, "Result back for request (%p)", (uint8_t *)&v14, 0xCu);
      }
      v4 = IMGetXPCCodableFromDictionaryWithStandardAllowlist();
      v5 = (void *)IMGetXPCDictionaryFromDictionary();
      v9 = CMFDefaultLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v10 = objc_msgSend(v5, "allKeys");
        v14 = 138412290;
        v15 = v10;
        _os_log_impl(&dword_20849D000, v9, OS_LOG_TYPE_DEFAULT, "Response: %@", (uint8_t *)&v14, 0xCu);
      }
      v11 = CMFDefaultLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v14 = 134217984;
        v15 = v4;
        _os_log_impl(&dword_20849D000, v11, OS_LOG_TYPE_DEFAULT, "Error: %p", (uint8_t *)&v14, 0xCu);
      }
      goto LABEL_20;
    }
    v4 = 0;
  }
  v5 = 0;
LABEL_20:
  xpc_release(v2);
LABEL_21:
  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, void *, uint64_t))(result + 16))(result, v5, v4);
  return result;
}

id __60__CommunicationsFilterBlockList__sendSynchronousXPCRequest___block_invoke(uint64_t a1, void *a2)
{
  id result;

  result = a2;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = result;
  return result;
}

- (BOOL)_connect
{
  OS_xpc_object *connection;
  NSObject *v4;
  uint8_t buf[16];

  connection = self->_connection;
  if (!connection)
  {
    v4 = CMFDefaultLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20849D000, v4, OS_LOG_TYPE_DEFAULT, "Connecting to CMFSync Agent", buf, 2u);
    }
    self->_connection = (OS_xpc_object *)IMXPCCreateConnectionForServiceWithQueue();
    IMXPCConfigureConnection();
    connection = self->_connection;
  }
  return connection != 0;
}

- (BOOL)isItemInList:(id)a3
{
  int64_t v5;
  NSObject *v6;
  _BOOL4 v7;
  uint64_t v8;
  xpc_object_t v9;
  id v10;
  void *v11;
  uint64_t v13;
  uint8_t buf[16];
  uint8_t v15[16];

  v5 = -[CommunicationsFilterBlockListCache cachedResponseForItem:](self->_cache, "cachedResponseForItem:");
  v6 = CMFDefaultLog();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5 == -1)
  {
    if (v7)
    {
      *(_WORD *)v15 = 0;
      _os_log_impl(&dword_20849D000, v6, OS_LOG_TYPE_DEFAULT, "Item not in the cache.", v15, 2u);
    }
    v9 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v9, (const char *)CMFXPCEventCode, 3);
    v13 = objc_msgSend(a3, "dictionaryRepresentation");
    IMInsertDictionariesToXPCDictionary();
    v10 = -[CommunicationsFilterBlockList _sendSynchronousXPCRequest:](self, "_sendSynchronousXPCRequest:", v9, v13, 0);
    xpc_release(v9);
    v8 = objc_msgSend(v10, "objectForKey:", CMFDictionaryResultKey);
    if (v8)
    {
      v11 = (void *)v8;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        -[CommunicationsFilterBlockListCache setResponse:forItem:](self->_cache, "setResponse:forItem:", objc_msgSend(v11, "BOOLValue"), a3);
        LOBYTE(v8) = objc_msgSend(v11, "BOOLValue");
      }
      else
      {
        LOBYTE(v8) = 0;
      }
    }
  }
  else
  {
    if (v7)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20849D000, v6, OS_LOG_TYPE_DEFAULT, "Item in the cache.", buf, 2u);
    }
    LOBYTE(v8) = v5 == 1;
  }
  return v8;
}

- (id)_sendSynchronousXPCRequest:(id)a3
{
  id v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  uint64_t v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3052000000;
  v9 = __Block_byref_object_copy_;
  v10 = __Block_byref_object_dispose_;
  v11 = 0;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __60__CommunicationsFilterBlockList__sendSynchronousXPCRequest___block_invoke;
  v5[3] = &unk_24C0A72A8;
  v5[4] = &v6;
  self->_retries = 0;
  -[CommunicationsFilterBlockList _sendXPCRequest:completionBlock:](self, "_sendXPCRequest:completionBlock:", a3, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)_sendXPCRequest:(id)a3 completionBlock:(id)a4
{
  NSObject *queue;
  _QWORD block[7];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __65__CommunicationsFilterBlockList__sendXPCRequest_completionBlock___block_invoke;
  block[3] = &unk_24C0A72D0;
  block[4] = self;
  block[5] = a3;
  block[6] = a4;
  dispatch_sync(queue, block);
}

- (id)copyAllItems
{
  xpc_object_t v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  CommunicationFilterItem *v12;
  CommunicationFilterItem *v13;
  NSObject *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v3, (const char *)CMFXPCEventCode, 2);
  v4 = -[CommunicationsFilterBlockList _sendSynchronousXPCRequest:](self, "_sendSynchronousXPCRequest:", v3);
  xpc_release(v3);
  v5 = objc_msgSend(v4, "objectForKey:", CMFDictionaryResultKey);
  if (v5 && (v6 = (void *)v5, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v6, "count"));
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v17 != v10)
            objc_enumerationMutation(v6);
          v12 = -[CommunicationFilterItem initWithDictionaryRepresentation:]([CommunicationFilterItem alloc], "initWithDictionaryRepresentation:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i));
          if (v12)
          {
            v13 = v12;
            objc_msgSend(v7, "addObject:", v12);

          }
        }
        v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v9);
    }
  }
  else
  {
    v14 = CMFDefaultLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[CommunicationsFilterBlockList copyAllItems].cold.1();
    return 0;
  }
  return v7;
}

- (void)dealloc
{
  objc_super v3;

  dispatch_release((dispatch_object_t)self->_queue);
  self->_queue = 0;
  v3.receiver = self;
  v3.super_class = (Class)CommunicationsFilterBlockList;
  -[CommunicationsFilterBlockList dealloc](&v3, sel_dealloc);
}

- (void)addItemForAllServices:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  xpc_object_t v7;
  NSObject *v8;

  v5 = objc_msgSend(a3, "dictionaryRepresentation");
  if (v5)
  {
    v6 = v5;
    v7 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v7, (const char *)CMFXPCEventCode, 0);
    IMInsertDictionariesToXPCDictionary();
    -[CommunicationsFilterBlockList _sendSynchronousXPCRequest:](self, "_sendSynchronousXPCRequest:", v7, v6, 0);
    xpc_release(v7);
    -[CommunicationsFilterBlockListCache removeItemFromCache:](self->_cache, "removeItemFromCache:", a3);
  }
  else
  {
    v8 = CMFDefaultLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      -[CommunicationsFilterBlockList addItemForAllServices:].cold.1();
  }
}

- (void)removeItemForAllServices:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  xpc_object_t v7;
  NSObject *v8;

  v5 = objc_msgSend(a3, "dictionaryRepresentation");
  if (v5)
  {
    v6 = v5;
    v7 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v7, (const char *)CMFXPCEventCode, 1);
    IMInsertDictionariesToXPCDictionary();
    -[CommunicationsFilterBlockList _sendSynchronousXPCRequest:](self, "_sendSynchronousXPCRequest:", v7, v6, 0);
    xpc_release(v7);
    -[CommunicationsFilterBlockListCache removeItemFromCache:](self->_cache, "removeItemFromCache:", a3);
  }
  else
  {
    v8 = CMFDefaultLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      -[CommunicationsFilterBlockList removeItemForAllServices:].cold.1();
  }
}

uint64_t __41__CommunicationsFilterBlockList__connect__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  v2 = CMFDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_20849D000, v2, OS_LOG_TYPE_DEFAULT, "com.apple.cmfsyncagent", v4, 2u);
  }
  return objc_msgSend(*(id *)(a1 + 32), "_disconnected");
}

- (BOOL)_disconnect
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __44__CommunicationsFilterBlockList__disconnect__block_invoke;
  block[3] = &unk_24C0A72F8;
  block[4] = self;
  dispatch_async(queue, block);
  return 1;
}

void __44__CommunicationsFilterBlockList__disconnect__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint8_t v3[16];

  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8))
  {
    v2 = CMFDefaultLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v3 = 0;
      _os_log_impl(&dword_20849D000, v2, OS_LOG_TYPE_DEFAULT, "Forcing a disconnect, terminating connection", v3, 2u);
    }
    xpc_connection_cancel(*(xpc_connection_t *)(*(_QWORD *)(a1 + 32) + 8));
    xpc_release(*(xpc_object_t *)(*(_QWORD *)(a1 + 32) + 8));
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) = 0;
  }
}

- (void)_disconnected
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __46__CommunicationsFilterBlockList__disconnected__block_invoke;
  block[3] = &unk_24C0A72F8;
  block[4] = self;
  dispatch_async(queue, block);
}

void __46__CommunicationsFilterBlockList__disconnected__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint8_t v3[16];

  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8))
  {
    v2 = CMFDefaultLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v3 = 0;
      _os_log_impl(&dword_20849D000, v2, OS_LOG_TYPE_DEFAULT, "Clearing out _connection, we're disconnected", v3, 2u);
    }
    xpc_connection_cancel(*(xpc_connection_t *)(*(_QWORD *)(a1 + 32) + 8));
    xpc_release(*(xpc_object_t *)(*(_QWORD *)(a1 + 32) + 8));
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) = 0;
  }
}

- (void)addItemForAllServices:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20849D000, v0, v1, "Client is requesting to add an invalid item to the block list - will not notify server of any changes", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)removeItemForAllServices:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20849D000, v0, v1, "Client is requesting to remove an invalid item from the block list - will not notify server of any changes", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)copyAllItems
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_20849D000, v0, v1, "XPC service didn't give us an array", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __65__CommunicationsFilterBlockList__sendXPCRequest_completionBlock___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_20849D000, v0, v1, "Received an XPC_ERROR_CONNECTION_INVALID error.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __65__CommunicationsFilterBlockList__sendXPCRequest_completionBlock___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_20849D000, v0, v1, "Received an XPC_ERROR_CONNECTION_INTERRUPTED error.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
