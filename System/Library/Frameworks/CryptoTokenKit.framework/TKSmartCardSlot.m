@implementation TKSmartCardSlot

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<TKSmartCardSlot: %p '%@'>"), self, self->_name);
}

- (id)synchronous:(BOOL)a3 remoteSlotWithErrorHandler:(id)a4
{
  NSXPCConnection *connection;

  connection = self->_connection;
  if (a3)
    -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](connection, "synchronousRemoteObjectProxyWithErrorHandler:", a4);
  else
    -[NSXPCConnection remoteObjectProxyWithErrorHandler:](connection, "remoteObjectProxyWithErrorHandler:", a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)connectToEndpoint:(id)a3 synchronous:(BOOL)a4 reply:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  NSXPCConnection *v10;
  NSXPCConnection *connection;
  void *v12;
  void *v13;
  void *v14;
  TKSmartCardSlotProxy *v15;
  TKSmartCardSlotProxy *proxy;
  uint64_t v17;
  id v18;
  void *v19;
  id v20;
  _QWORD v21[5];
  id v22;
  _QWORD v23[4];
  id v24;
  _QWORD v25[4];
  id v26;
  _QWORD v27[4];
  id v28;
  id location;

  v6 = a4;
  v8 = a3;
  v9 = a5;
  v10 = (NSXPCConnection *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithListenerEndpoint:", v8);
  connection = self->_connection;
  self->_connection = v10;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EF232E10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EF233260);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setInterface:forSelector:argumentIndex:ofReply:", v13, sel_sessionWithParameters_reply_, 0, 1);

  -[NSXPCConnection setRemoteObjectInterface:](self->_connection, "setRemoteObjectInterface:", v12);
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EF230988);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSXPCConnection setExportedInterface:](self->_connection, "setExportedInterface:", v14);

  v15 = -[TKSmartCardSlotProxy initWithSlot:]([TKSmartCardSlotProxy alloc], "initWithSlot:", self);
  proxy = self->_proxy;
  self->_proxy = v15;

  -[NSXPCConnection setExportedObject:](self->_connection, "setExportedObject:", self->_proxy);
  objc_initWeak(&location, self);
  v17 = MEMORY[0x1E0C809B0];
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __55__TKSmartCardSlot_connectToEndpoint_synchronous_reply___block_invoke;
  v27[3] = &unk_1E7089378;
  objc_copyWeak(&v28, &location);
  -[NSXPCConnection setInvalidationHandler:](self->_connection, "setInvalidationHandler:", v27);
  v25[0] = v17;
  v25[1] = 3221225472;
  v25[2] = __55__TKSmartCardSlot_connectToEndpoint_synchronous_reply___block_invoke_113;
  v25[3] = &unk_1E7089378;
  objc_copyWeak(&v26, &location);
  -[NSXPCConnection setInterruptionHandler:](self->_connection, "setInterruptionHandler:", v25);
  -[NSXPCConnection resume](self->_connection, "resume");
  self->_state = 1;
  self->_previousState = 1;
  v23[0] = v17;
  v23[1] = 3221225472;
  v23[2] = __55__TKSmartCardSlot_connectToEndpoint_synchronous_reply___block_invoke_114;
  v23[3] = &unk_1E70893A0;
  v18 = v9;
  v24 = v18;
  -[TKSmartCardSlot synchronous:remoteSlotWithErrorHandler:](self, "synchronous:remoteSlotWithErrorHandler:", v6, v23);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v17;
  v21[1] = 3221225472;
  v21[2] = __55__TKSmartCardSlot_connectToEndpoint_synchronous_reply___block_invoke_115;
  v21[3] = &unk_1E70893C8;
  v21[4] = self;
  v20 = v18;
  v22 = v20;
  objc_msgSend(v19, "setupSlotWithReply:", v21);

  objc_destroyWeak(&v26);
  objc_destroyWeak(&v28);
  objc_destroyWeak(&location);

}

void __55__TKSmartCardSlot_connectToEndpoint_synchronous_reply___block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    TK_LOG_smartcard();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
      __55__TKSmartCardSlot_connectToEndpoint_synchronous_reply___block_invoke_cold_1();

    v3 = WeakRetained;
    objc_sync_enter(v3);
    objc_msgSend(v3, "setState:", 0);
    objc_sync_exit(v3);

    objc_msgSend(v3, "setPreviousState:", 0);
    objc_msgSend(v3, "setATR:", 0);
  }

}

void __55__TKSmartCardSlot_connectToEndpoint_synchronous_reply___block_invoke_113(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    TK_LOG_smartcard();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
      __55__TKSmartCardSlot_connectToEndpoint_synchronous_reply___block_invoke_113_cold_1();

    objc_msgSend(WeakRetained, "invalidate");
  }

}

void __55__TKSmartCardSlot_connectToEndpoint_synchronous_reply___block_invoke_114(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  TK_LOG_smartcard();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __55__TKSmartCardSlot_connectToEndpoint_synchronous_reply___block_invoke_114_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __55__TKSmartCardSlot_connectToEndpoint_synchronous_reply___block_invoke_115(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  TKSmartCardATR *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  TKSlotParameters *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  NSObject *v20;

  v3 = a2;
  objc_msgSend(v3, "objectForKey:", CFSTR("name"));
  v4 = objc_claimAutoreleasedReturnValue();
  v6 = a1 + 32;
  v5 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v4;

  objc_msgSend(v3, "objectForKey:", CFSTR("state"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)v6 + 40) = objc_msgSend(v8, "integerValue");

  objc_msgSend(v3, "objectForKey:", CFSTR("prevstate"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)v6 + 72) = objc_msgSend(v9, "integerValue");

  v10 = [TKSmartCardATR alloc];
  objc_msgSend(v3, "objectForKey:", CFSTR("atr"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[TKSmartCardATR initWithBytes:](v10, "initWithBytes:", v11);
  v13 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
  *(_QWORD *)(*(_QWORD *)v6 + 48) = v12;

  objc_msgSend(v3, "objectForKey:", CFSTR("power"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)v6 + 16) = objc_msgSend(v14, "integerValue");

  objc_msgSend(v3, "objectForKey:", CFSTR("share"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)v6 + 24) = objc_msgSend(v15, "integerValue");

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "slotInitialized");
  v16 = [TKSlotParameters alloc];
  objc_msgSend(v3, "objectForKey:", CFSTR("params"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = -[TKSlotParameters initWithEntriesFromDictionary:](v16, "initWithEntriesFromDictionary:", v17);
  v19 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  *(_QWORD *)(*(_QWORD *)v6 + 32) = v18;

  TK_LOG_smartcard();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    __55__TKSmartCardSlot_connectToEndpoint_synchronous_reply___block_invoke_115_cold_1();

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (id)slotParameters
{
  return self->_slotParameters;
}

- (NSInteger)maxInputLength
{
  return -[TKSlotParameters maxInputLength](self->_slotParameters, "maxInputLength");
}

- (NSInteger)maxOutputLength
{
  return -[TKSlotParameters maxOutputLength](self->_slotParameters, "maxOutputLength");
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)-[NSXPCConnection _queue](self->_connection, "_queue");
}

- (TKSmartCard)makeSmartCard
{
  void *v3;

  if (-[TKSmartCardSlot state](self, "state") != TKSmartCardSlotStateValidCard
    && -[TKSmartCardSlot state](self, "state") != TKSmartCardSlotStateProbing)
  {
    return (TKSmartCard *)0;
  }
  if (-[TKSmartCardSlot state](self, "state") == TKSmartCardSlotStateProbing)
  {
    -[TKSmartCardSlot synchronous:remoteSlotWithErrorHandler:](self, "synchronous:remoteSlotWithErrorHandler:", 1, &__block_literal_global_118);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "waitForNextState:reply:", -[TKSmartCardSlot state](self, "state"), &__block_literal_global_121);

  }
  if (-[TKSmartCardSlot state](self, "state") == TKSmartCardSlotStateValidCard)
    return -[TKSmartCard initWithSlot:]([TKSmartCard alloc], "initWithSlot:", self);
  else
    return (TKSmartCard *)0;
}

void __32__TKSmartCardSlot_makeSmartCard__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  TK_LOG_smartcard();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __55__TKSmartCardSlot_connectToEndpoint_synchronous_reply___block_invoke_114_cold_1();

}

- (void)invalidate
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_6_0(&dword_1B9768000, v0, v1, "%{public}@: invalidating slot and connection %{public}@", v2);
  OUTLINED_FUNCTION_4();
}

- (void)dealloc
{
  objc_super v3;

  -[TKSmartCardSlot invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)TKSmartCardSlot;
  -[TKSmartCardSlot dealloc](&v3, sel_dealloc);
}

- (TKSmartCardSlot)initWithEndpoint:(id)a3 error:(id *)a4
{
  id v6;
  TKSmartCardSlot *v7;
  TKSmartCardSlot *v8;
  _QWORD v10[6];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;
  objc_super v21;

  v6 = a3;
  v21.receiver = self;
  v21.super_class = (Class)TKSmartCardSlot;
  v7 = -[TKSmartCardSlot init](&v21, sel_init);
  v8 = v7;
  if (v7)
  {
    v17 = 0;
    v18 = &v17;
    v19 = 0x2020000000;
    v20 = 1;
    v11 = 0;
    v12 = &v11;
    v13 = 0x3032000000;
    v14 = __Block_byref_object_copy__0;
    v15 = __Block_byref_object_dispose__0;
    v16 = 0;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __42__TKSmartCardSlot_initWithEndpoint_error___block_invoke;
    v10[3] = &unk_1E7089430;
    v10[4] = &v17;
    v10[5] = &v11;
    -[TKSmartCardSlot connectToEndpoint:synchronous:reply:](v7, "connectToEndpoint:synchronous:reply:", v6, 1, v10);
    if (!*((_BYTE *)v18 + 24))
    {

      v8 = 0;
      if (a4)
        *a4 = objc_retainAutorelease((id)v12[5]);
    }
    _Block_object_dispose(&v11, 8);

    _Block_object_dispose(&v17, 8);
  }

  return v8;
}

void __42__TKSmartCardSlot_initWithEndpoint_error___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  id v5;

  v4 = a2;
  if (v4)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
    v5 = v4;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    v4 = v5;
  }

}

- (void)control:(id)a3 data:(id)a4 expectedLength:(unsigned int)a5 reply:(id)a6
{
  uint64_t v6;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  _QWORD v15[4];
  id v16;

  v6 = *(_QWORD *)&a5;
  v10 = a6;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __53__TKSmartCardSlot_control_data_expectedLength_reply___block_invoke;
  v15[3] = &unk_1E70893A0;
  v16 = v10;
  v11 = v10;
  v12 = a4;
  v13 = a3;
  -[TKSmartCardSlot synchronous:remoteSlotWithErrorHandler:](self, "synchronous:remoteSlotWithErrorHandler:", 0, v15);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "sendControl:data:expectedLength:reply:", v13, v12, v6, v11);

}

uint64_t __53__TKSmartCardSlot_control_data_expectedLength_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)getAttrib:(unsigned int)a3 reply:(id)a4
{
  uint64_t v4;
  id v6;
  id v7;
  void *v8;
  _QWORD v9[4];
  id v10;

  v4 = *(_QWORD *)&a3;
  v6 = a4;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __35__TKSmartCardSlot_getAttrib_reply___block_invoke;
  v9[3] = &unk_1E70893A0;
  v10 = v6;
  v7 = v6;
  -[TKSmartCardSlot synchronous:remoteSlotWithErrorHandler:](self, "synchronous:remoteSlotWithErrorHandler:", 0, v9);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "getAttrib:reply:", v4, v7);

}

uint64_t __35__TKSmartCardSlot_getAttrib_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)setAttrib:(unsigned int)a3 data:(id)a4 reply:(id)a5
{
  uint64_t v6;
  id v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v12[4];
  id v13;

  v6 = *(_QWORD *)&a3;
  v8 = a5;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __40__TKSmartCardSlot_setAttrib_data_reply___block_invoke;
  v12[3] = &unk_1E70893A0;
  v13 = v8;
  v9 = v8;
  v10 = a4;
  -[TKSmartCardSlot synchronous:remoteSlotWithErrorHandler:](self, "synchronous:remoteSlotWithErrorHandler:", 0, v12);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setAttrib:data:reply:", v6, v10, v9);

}

uint64_t __40__TKSmartCardSlot_setAttrib_data_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)screen
{
  return 0;
}

- (id)userInteractionForConfirmation
{
  return 0;
}

- (id)userInteractionForStringEntry
{
  return 0;
}

- (TKSmartCardSlotState)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (TKSmartCardATR)ATR
{
  return (TKSmartCardATR *)objc_getProperty(self, a2, 48, 1);
}

- (void)setATR:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (NSString)name
{
  return self->_name;
}

- (TKSmartCardSlotProxy)proxy
{
  return self->_proxy;
}

- (int64_t)previousState
{
  return self->_previousState;
}

- (void)setPreviousState:(int64_t)a3
{
  self->_previousState = a3;
}

- (int64_t)shareState
{
  return self->_shareState;
}

- (void)setShareState:(int64_t)a3
{
  self->_shareState = a3;
}

- (int64_t)powerState
{
  return self->_powerState;
}

- (void)setPowerState:(int64_t)a3
{
  self->_powerState = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_proxy, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_ATR, 0);
  objc_storeStrong((id *)&self->_slotParameters, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

void __55__TKSmartCardSlot_connectToEndpoint_synchronous_reply___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_1B9768000, v0, v1, "%{public}@: connection invalidated", v2);
  OUTLINED_FUNCTION_4();
}

void __55__TKSmartCardSlot_connectToEndpoint_synchronous_reply___block_invoke_113_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_1B9768000, v0, v1, "%{public}@: connection interrupted, invalidating", v2);
  OUTLINED_FUNCTION_4();
}

void __55__TKSmartCardSlot_connectToEndpoint_synchronous_reply___block_invoke_114_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0(&dword_1B9768000, v0, v1, "SmartCard slot connection failed (%{public}@)", v2);
  OUTLINED_FUNCTION_4();
}

void __55__TKSmartCardSlot_connectToEndpoint_synchronous_reply___block_invoke_115_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_6_0(&dword_1B9768000, v0, v1, "%{public}@: slot connected with parameters: %{public}@", v2);
  OUTLINED_FUNCTION_4();
}

@end
