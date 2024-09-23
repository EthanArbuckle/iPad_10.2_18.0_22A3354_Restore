@implementation DUXPCServer

- (DUXPCServer)init
{
  DUXPCServer *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *documentUpdateQueue;
  NSObject *v5;
  xpc_connection_t mach_service;
  OS_xpc_object *listener;
  DUXPCServer *v8;
  _BOOL8 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _BOOL8 v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint8_t v26[16];
  objc_super v27;

  v27.receiver = self;
  v27.super_class = (Class)DUXPCServer;
  v2 = -[DUXPCServer init](&v27, sel_init);
  if (!v2)
    goto LABEL_6;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v26 = 0;
    _os_log_impl(&dword_2282CC000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "DocumentUnderstanding: Initializing DUXPCServer for DocumentUpdateHandler", v26, 2u);
  }
  v3 = dispatch_queue_create("com.apple.TextUnderstanding.DocumentUpdateHandler.queue", 0);
  documentUpdateQueue = v2->_documentUpdateQueue;
  v2->_documentUpdateQueue = (OS_dispatch_queue *)v3;

  v5 = v2->_documentUpdateQueue;
  if (!v5)
  {
    v9 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v9)
      -[DUXPCServer init].cold.1(v9, v10, v11, v12, v13, v14, v15, v16);
    goto LABEL_11;
  }
  mach_service = xpc_connection_create_mach_service("com.apple.TextUnderstanding.DocumentUpdateHandler", v5, 1uLL);
  listener = v2->_listener;
  v2->_listener = mach_service;

  if (!v2->_listener)
  {
    v17 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v17)
      -[DUXPCServer init].cold.2(v17, v18, v19, v20, v21, v22, v23, v24);
LABEL_11:
    v8 = 0;
    goto LABEL_12;
  }
LABEL_6:
  v8 = v2;
LABEL_12:

  return v8;
}

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __29__DUXPCServer_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance__pasOnceToken9 != -1)
    dispatch_once(&sharedInstance__pasOnceToken9, block);
  return (id)sharedInstance__pasExprOnceResult;
}

void __29__DUXPCServer_sharedInstance__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x22E2B0AD4]();
  v1 = objc_opt_new();
  v2 = (void *)sharedInstance__pasExprOnceResult;
  sharedInstance__pasExprOnceResult = v1;

  objc_autoreleasePoolPop(v0);
}

+ (void)registerDUXPCListenersWithManager:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  id v8;
  _QWORD block[4];
  id v10;
  _QWORD aBlock[4];
  id v12;
  id v13;

  v4 = a3;
  v5 = MEMORY[0x24BDAC760];
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __49__DUXPCServer_registerDUXPCListenersWithManager___block_invoke;
  aBlock[3] = &unk_24F0F3CF8;
  v12 = v4;
  v13 = a1;
  v6 = v4;
  block[0] = v5;
  block[1] = 3221225472;
  block[2] = __49__DUXPCServer_registerDUXPCListenersWithManager___block_invoke_2;
  block[3] = &unk_24F0F3D20;
  v10 = _Block_copy(aBlock);
  v7 = registerDUXPCListenersWithManager___pasOnceToken10;
  v8 = v10;
  if (v7 != -1)
    dispatch_once(&registerDUXPCListenersWithManager___pasOnceToken10, block);

}

uint64_t __49__DUXPCServer_registerDUXPCListenersWithManager___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 40), "_registerDocumentUnderstandingListenerWithTextUnderstandingManager:", *(_QWORD *)(a1 + 32));
  return 1;
}

void __49__DUXPCServer_registerDUXPCListenersWithManager___block_invoke_2(uint64_t a1)
{
  void *v2;

  v2 = (void *)MEMORY[0x22E2B0AD4]();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  objc_autoreleasePoolPop(v2);
}

+ (void)_registerDocumentUnderstandingListenerWithTextUnderstandingManager:(id)a3
{
  id v3;
  DUXPCServerDelegate *v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v3 = a3;
  v4 = -[DUXPCServerDelegate initWithManager:]([DUXPCServerDelegate alloc], "initWithManager:", v3);

  v5 = (void *)_registerDocumentUnderstandingListenerWithTextUnderstandingManager__delegate;
  _registerDocumentUnderstandingListenerWithTextUnderstandingManager__delegate = (uint64_t)v4;

  v6 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1998]), "initWithMachServiceName:", CFSTR("com.apple.TextUnderstanding.DocumentUnderstandingHarvesting"));
  v7 = (void *)_registerDocumentUnderstandingListenerWithTextUnderstandingManager__listener;
  _registerDocumentUnderstandingListenerWithTextUnderstandingManager__listener = v6;

  objc_msgSend((id)_registerDocumentUnderstandingListenerWithTextUnderstandingManager__listener, "setDelegate:", _registerDocumentUnderstandingListenerWithTextUnderstandingManager__delegate);
  objc_msgSend((id)_registerDocumentUnderstandingListenerWithTextUnderstandingManager__listener, "resume");
}

- (void)_registerDocumentUpdateHandlerListenerWithTextUnderstandingManager:(id)a3
{
  id v4;
  OS_xpc_object *listener;
  id v6;
  _QWORD v7[5];
  id v8;
  uint8_t buf[16];

  v4 = a3;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2282CC000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "DocumentUnderstanding: Registering DocumentUpdateHandler", buf, 2u);
  }
  listener = self->_listener;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __82__DUXPCServer__registerDocumentUpdateHandlerListenerWithTextUnderstandingManager___block_invoke;
  v7[3] = &unk_24F0F3D48;
  v7[4] = self;
  v6 = v4;
  v8 = v6;
  xpc_connection_set_event_handler(listener, v7);
  xpc_connection_resume(self->_listener);
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2282CC000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "DocumentUnderstanding: Registered DocumentUpdateHandler", buf, 2u);
  }

}

void __82__DUXPCServer__registerDocumentUpdateHandlerListenerWithTextUnderstandingManager___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BOOL8 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = MEMORY[0x22E2B12F0]();
  if (v4 == MEMORY[0x24BDACF88])
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      v15 = 134217984;
      v16 = v3;
      _os_log_impl(&dword_2282CC000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "DocumentUnderstanding: DocumentUpdateHandler connection %p event from client", (uint8_t *)&v15, 0xCu);
    }
    objc_msgSend(*(id *)(a1 + 32), "_newClientConnection:withTextUnderstandingManager:", v3, *(_QWORD *)(a1 + 40));
  }
  else
  {
    v5 = v4;
    v6 = MEMORY[0x24BDACFB8];
    v7 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v5 == v6)
    {
      if (v7)
        __82__DUXPCServer__registerDocumentUpdateHandlerListenerWithTextUnderstandingManager___block_invoke_cold_1(v3);
    }
    else if (v7)
    {
      __82__DUXPCServer__registerDocumentUpdateHandlerListenerWithTextUnderstandingManager___block_invoke_cold_2(v7, v8, v9, v10, v11, v12, v13, v14);
    }
  }

}

- (void)_newClientConnection:(id)a3 withTextUnderstandingManager:(id)a4
{
  _xpc_connection_s *v6;
  id v7;
  _QWORD handler[4];
  id v9;

  v6 = (_xpc_connection_s *)a3;
  v7 = a4;
  if (+[DUXPCServerHelper checkForAndLogTrueCStringEntitlement:connection:](DUXPCServerHelper, "checkForAndLogTrueCStringEntitlement:connection:", "com.apple.TextUnderstanding.DocumentUpdateHandler", v6))
  {
    xpc_connection_set_target_queue(v6, (dispatch_queue_t)self->_documentUpdateQueue);
    handler[0] = MEMORY[0x24BDAC760];
    handler[1] = 3221225472;
    handler[2] = __65__DUXPCServer__newClientConnection_withTextUnderstandingManager___block_invoke;
    handler[3] = &unk_24F0F3DB0;
    v9 = v7;
    xpc_connection_set_event_handler(v6, handler);
    xpc_connection_resume(v6);

  }
}

void __65__DUXPCServer__newClientConnection_withTextUnderstandingManager___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BOOL8 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *string;
  _BOOL8 v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  int uint64;
  int v25;
  const char *v26;
  __int16 v27;
  int v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = MEMORY[0x22E2B12F0]();
  if (v4 == MEMORY[0x24BDACFA0])
  {
    string = xpc_dictionary_get_string(v3, "event_type");
    if (strcmp(string, "mds_index_updated"))
    {
      v16 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
      if (v16)
        __65__DUXPCServer__newClientConnection_withTextUnderstandingManager___block_invoke_cold_1(v16, v17, v18, v19, v20, v21, v22, v23);
    }
    uint64 = xpc_dictionary_get_uint64(v3, "num_updates");
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      v25 = 136315394;
      v26 = string;
      v27 = 1024;
      v28 = uint64;
      _os_log_impl(&dword_2282CC000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "DocumentUnderstanding: DocumentUpdateHandler received event %s with number of updates %d", (uint8_t *)&v25, 0x12u);
    }
    objc_msgSend(*(id *)(a1 + 32), "triggerSpotlightFileUpdateNoArgsWithReply:", &__block_literal_global);
  }
  else
  {
    v5 = v4;
    v6 = MEMORY[0x24BDACFB8];
    v7 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v5 == v6)
    {
      if (v7)
        __65__DUXPCServer__newClientConnection_withTextUnderstandingManager___block_invoke_cold_2(v3);
    }
    else if (v7)
    {
      __65__DUXPCServer__newClientConnection_withTextUnderstandingManager___block_invoke_cold_3(v7, v8, v9, v10, v11, v12, v13, v14);
    }
  }

}

void __65__DUXPCServer__newClientConnection_withTextUnderstandingManager___block_invoke_6()
{
  uint8_t v0[16];

  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v0 = 0;
    _os_log_impl(&dword_2282CC000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "DocumentUnderstanding: DocumentUpdateHandler completed call to triggerSpotlightFileUpdateNoArgsWithReply", v0, 2u);
  }
}

+ (void)_registerPoemWeeklyActivityWithTextUnderstandingManager:(id)a3
{
  id v3;
  void *v4;
  id v5;
  _QWORD handler[4];
  id v7;

  v3 = a3;
  v4 = (void *)*MEMORY[0x24BDAC5A0];
  handler[0] = MEMORY[0x24BDAC760];
  handler[1] = 3221225472;
  handler[2] = __71__DUXPCServer__registerPoemWeeklyActivityWithTextUnderstandingManager___block_invoke;
  handler[3] = &unk_24F0F3DB0;
  v7 = v3;
  v5 = v3;
  xpc_activity_register("com.apple.TextUnderstanding.Poem.RunWeekly", v4, handler);

}

void __71__DUXPCServer__registerPoemWeeklyActivityWithTextUnderstandingManager___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _BOOL8 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12[16];

  v3 = a2;
  if (xpc_activity_get_state((xpc_activity_t)v3) == 2)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_2282CC000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Running Poem RunWeekly", v12, 2u);
    }
    dispatchDeferChecking(v3);
    objc_msgSend(*(id *)(a1 + 32), "incrementallyUpdatePoem");
    if (!xpc_activity_set_state((xpc_activity_t)v3, 5))
    {
      v4 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
      if (v4)
        __71__DUXPCServer__registerPoemWeeklyActivityWithTextUnderstandingManager___block_invoke_cold_1(v4, v5, v6, v7, v8, v9, v10, v11);
    }
  }

}

+ (void)_registerPoemMonthlyActivityWithTextUnderstandingManager:(id)a3
{
  id v3;
  void *v4;
  id v5;
  _QWORD handler[4];
  id v7;

  v3 = a3;
  v4 = (void *)*MEMORY[0x24BDAC5A0];
  handler[0] = MEMORY[0x24BDAC760];
  handler[1] = 3221225472;
  handler[2] = __72__DUXPCServer__registerPoemMonthlyActivityWithTextUnderstandingManager___block_invoke;
  handler[3] = &unk_24F0F3DB0;
  v7 = v3;
  v5 = v3;
  xpc_activity_register("com.apple.TextUnderstanding.Poem.RunMonthly", v4, handler);

}

void __72__DUXPCServer__registerPoemMonthlyActivityWithTextUnderstandingManager___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _BOOL8 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12[16];

  v3 = a2;
  if (xpc_activity_get_state((xpc_activity_t)v3) == 2)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_2282CC000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Running Poem RunMonthly", v12, 2u);
    }
    dispatchDeferChecking(v3);
    objc_msgSend(*(id *)(a1 + 32), "onBoardPoem");
    if (!xpc_activity_set_state((xpc_activity_t)v3, 5))
    {
      v4 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
      if (v4)
        __71__DUXPCServer__registerPoemWeeklyActivityWithTextUnderstandingManager___block_invoke_cold_1(v4, v5, v6, v7, v8, v9, v10, v11);
    }
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_documentUpdateQueue, 0);
}

- (void)init
{
  OUTLINED_FUNCTION_0_0(&dword_2282CC000, MEMORY[0x24BDACB70], a3, "DocumentUnderstanding: could not start DocumentUpdateHandler xpc listener", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

void __82__DUXPCServer__registerDocumentUpdateHandlerListenerWithTextUnderstandingManager___block_invoke_cold_1(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  xpc_dictionary_get_string(a1, (const char *)*MEMORY[0x24BDACF40]);
  OUTLINED_FUNCTION_1(&dword_2282CC000, MEMORY[0x24BDACB70], v1, "DocumentUnderstanding: DocumentUpdateHandler xpc connection error: %s", v2, v3, v4, v5, 2u);
}

void __82__DUXPCServer__registerDocumentUpdateHandlerListenerWithTextUnderstandingManager___block_invoke_cold_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_2282CC000, MEMORY[0x24BDACB70], a3, "DocumentUnderstanding: DocumentUpdateHandler unknown message type", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

void __65__DUXPCServer__newClientConnection_withTextUnderstandingManager___block_invoke_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_2282CC000, MEMORY[0x24BDACB70], a3, "DocumentUnderstanding: DocumentUpdateHandler unknown event name", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

void __65__DUXPCServer__newClientConnection_withTextUnderstandingManager___block_invoke_cold_2(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  xpc_dictionary_get_string(a1, (const char *)*MEMORY[0x24BDACF40]);
  OUTLINED_FUNCTION_1(&dword_2282CC000, MEMORY[0x24BDACB70], v1, "DocumentUnderstanding: received DocumentUpdateHandler connection error %s", v2, v3, v4, v5, 2u);
}

void __65__DUXPCServer__newClientConnection_withTextUnderstandingManager___block_invoke_cold_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_2282CC000, MEMORY[0x24BDACB70], a3, "DocumentUnderstanding: DocumentUpdateHandler XPC connction unknown message type", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

void __71__DUXPCServer__registerPoemWeeklyActivityWithTextUnderstandingManager___block_invoke_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_2282CC000, MEMORY[0x24BDACB70], a3, "Error setting XPC activity state to DONE", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

@end
