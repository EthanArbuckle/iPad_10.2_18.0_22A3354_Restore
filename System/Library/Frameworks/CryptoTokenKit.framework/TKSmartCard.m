@implementation TKSmartCard

+ (id)_localizedString:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB34D0];
  v4 = a3;
  objc_msgSend(v3, "bundleWithIdentifier:", CFSTR("com.apple.CryptoTokenKit"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", v4, &stru_1E708AD68, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (TKSmartCard)initWithSlot:(id)a3
{
  id v5;
  TKSmartCard *v6;
  TKSmartCard *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  dispatch_queue_t v16;
  OS_dispatch_queue *beginSessionQueue;
  NSObject *v18;
  NSObject *v19;
  NSObject *v20;
  NSObject *syncObject;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  objc_super v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v27.receiver = self;
  v27.super_class = (Class)TKSmartCard;
  v6 = -[TKSmartCard init](&v27, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_slot, a3);
    v7->_valid = 1;
    NSStringFromSelector(sel_state);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:forKeyPath:options:context:", v7, v8, 1, 0);

    TK_LOG_smartcard();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      -[TKSmartCard initWithSlot:].cold.1((uint64_t)v7);

    v7->_allowedProtocols = 0;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    -[TKSmartCardSlot ATR](v7->_slot, "ATR", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "protocols");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v24;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v24 != v14)
            objc_enumerationMutation(v11);
          v7->_allowedProtocols |= objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * v15++), "unsignedIntegerValue");
        }
        while (v13 != v15);
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
      }
      while (v13);
    }

    v7->_currentProtocol = 0;
    v7->_sensitive = 0;
    v16 = dispatch_queue_create("beginSessionQueue", 0);
    beginSessionQueue = v7->_beginSessionQueue;
    v7->_beginSessionQueue = (OS_dispatch_queue *)v16;

    v18 = v7->_beginSessionQueue;
    -[TKSmartCardSlot queue](v7->_slot, "queue");
    v19 = objc_claimAutoreleasedReturnValue();
    dispatch_set_target_queue(v18, v19);

    v20 = objc_alloc_init(MEMORY[0x1E0DE7910]);
    syncObject = v7->_syncObject;
    v7->_syncObject = v20;

  }
  return v7;
}

- (id)remoteSessionWithErrorHandler:(id)a3
{
  _BOOL4 synchronous;
  id session;

  synchronous = self->_synchronous;
  session = self->_session;
  if (synchronous)
    objc_msgSend(session, "synchronousRemoteObjectProxyWithErrorHandler:", a3);
  else
    objc_msgSend(session, "remoteObjectProxyWithErrorHandler:", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;
  NSObject *v17;
  NSObject *v18;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (self->_valid)
  {
    NSStringFromSelector(sel_state);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v9, "isEqualToString:", v12);

    if (v13)
    {
      objc_msgSend(v11, "objectForKey:", *MEMORY[0x1E0CB2CB8]);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "integerValue");

      if (v15 != 2 && v15 != 4)
      {
        TK_LOG_smartcard();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
          -[TKSmartCard observeValueForKeyPath:ofObject:change:context:].cold.1();

        -[TKSmartCard setContext:forKey:](self, "setContext:forKey:", 0, 0);
        v18 = self->_syncObject;
        objc_sync_enter(v18);
        -[TKSmartCard setValid:](self, "setValid:", 0);
        -[TKSmartCard setCurrentProtocol:](self, "setCurrentProtocol:", 0);
        objc_sync_exit(v18);

      }
    }
  }

}

- (void)setSensitive:(BOOL)sensitive
{
  self->_sensitive = sensitive;
}

- (BOOL)sensitive
{
  return self->_sensitive;
}

- (void)setSynchronous:(BOOL)a3
{
  self->_synchronous = a3;
}

- (BOOL)synchronous
{
  return self->_synchronous;
}

- (void)releaseSessionWithReply:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  id session;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[5];
  id v18;

  v4 = a3;
  TK_LOG_smartcard();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[TKSmartCard releaseSessionWithReply:].cold.1();

  -[TKSmartCard setContext:forKey:](self, "setContext:forKey:", 0, 0);
  if (self->_sensitiveRequired)
  {
    -[TKSmartCard setSessionEndPolicy:](self, "setSessionEndPolicy:", 1);
    self->_sensitiveRequired = 0;
  }
  v6 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __39__TKSmartCard_releaseSessionWithReply___block_invoke;
  v17[3] = &unk_1E70894A8;
  v17[4] = self;
  v18 = v4;
  v7 = v4;
  v8 = (void *)MEMORY[0x1BCCC4AEC](v17);
  dispatch_suspend((dispatch_object_t)self->_beginSessionQueue);
  v15[0] = v6;
  v15[1] = 3221225472;
  v15[2] = __39__TKSmartCard_releaseSessionWithReply___block_invoke_2_200;
  v15[3] = &unk_1E70893A0;
  v9 = v8;
  v16 = v9;
  -[TKSmartCard remoteSessionWithErrorHandler:](self, "remoteSessionWithErrorHandler:", v15);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v6;
  v13[1] = 3221225472;
  v13[2] = __39__TKSmartCard_releaseSessionWithReply___block_invoke_3_201;
  v13[3] = &unk_1E7089480;
  v14 = v9;
  v11 = v9;
  objc_msgSend(v10, "terminateWithReply:", v13);

  session = self->_session;
  self->_session = 0;

}

void __39__TKSmartCard_releaseSessionWithReply___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  _QWORD v4[5];
  id v5;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "queue");
  v2 = objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __39__TKSmartCard_releaseSessionWithReply___block_invoke_2;
  v4[3] = &unk_1E70894A8;
  v3 = *(void **)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  dispatch_async(v2, v4);

}

void __39__TKSmartCard_releaseSessionWithReply___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[5];
  id v13;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "proxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cards");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObject:", *(_QWORD *)(a1 + 32));

  dispatch_resume(*(dispatch_object_t *)(*(_QWORD *)(a1 + 32) + 16));
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  v6 = *(void **)(v4 + 8);
  v7 = MEMORY[0x1E0C809B0];
  v8 = *(unsigned __int8 *)(v4 + 26);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __39__TKSmartCard_releaseSessionWithReply___block_invoke_3;
  v12[3] = &unk_1E7089458;
  v12[4] = v4;
  v13 = v5;
  objc_msgSend(v6, "synchronous:remoteSlotWithErrorHandler:", v8, v12);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v7;
  v10[1] = 3221225472;
  v10[2] = __39__TKSmartCard_releaseSessionWithReply___block_invoke_199;
  v10[3] = &unk_1E7089480;
  v11 = *(id *)(a1 + 40);
  objc_msgSend(v9, "waitForStateFlushedWithReply:", v10);

}

void __39__TKSmartCard_releaseSessionWithReply___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  TK_LOG_smartcard();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __39__TKSmartCard_releaseSessionWithReply___block_invoke_3_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __39__TKSmartCard_releaseSessionWithReply___block_invoke_199(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __39__TKSmartCard_releaseSessionWithReply___block_invoke_2_200(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __39__TKSmartCard_releaseSessionWithReply___block_invoke_3_201(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)sessionRequested
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_1B9768000, v0, v1, "%{public}@: got request for unused session, releasing it", v2);
  OUTLINED_FUNCTION_4();
}

- (void)inSlotQueueExecuteBlock:(id)a3
{
  TKSmartCardSlot *slot;
  id v4;
  void (*v5)(void);
  NSObject *v6;

  if (self->_synchronous)
  {
    slot = self->_slot;
    v4 = a3;
    -[TKSmartCardSlot queue](slot, "queue");
    v6 = objc_claimAutoreleasedReturnValue();
    dispatch_sync(v6, v4);

  }
  else
  {
    v5 = (void (*)(void))*((_QWORD *)a3 + 2);
    v6 = a3;
    v5();
  }

}

- (void)querySessionWithReply:(id)a3
{
  id v4;
  unint64_t allowedProtocols;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  TKSmartCardSlot *slot;
  _BOOL8 synchronous;
  id v14;
  void *v15;
  id v16;
  _QWORD v17[5];
  id v18;
  _QWORD v19[5];
  id v20;
  _QWORD v21[5];
  _QWORD v22[3];
  _QWORD v23[4];

  v23[3] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  allowedProtocols = self->_allowedProtocols;
  self->_sessionEndPolicy = 0;
  self->_someoneWantsSession = 0;
  v22[0] = CFSTR("protocol");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", allowedProtocols);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v6;
  v22[1] = CFSTR("sensitive");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_sensitive);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v23[1] = v7;
  v22[2] = CFSTR("endpolicy");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_sessionEndPolicy);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v23[2] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  TK_LOG_smartcard();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    -[TKSmartCard querySessionWithReply:].cold.1();

  v11 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __37__TKSmartCard_querySessionWithReply___block_invoke;
  v21[3] = &unk_1E70891E8;
  v21[4] = self;
  -[TKSmartCard inSlotQueueExecuteBlock:](self, "inSlotQueueExecuteBlock:", v21);
  slot = self->_slot;
  synchronous = self->_synchronous;
  v19[0] = v11;
  v19[1] = 3221225472;
  v19[2] = __37__TKSmartCard_querySessionWithReply___block_invoke_2;
  v19[3] = &unk_1E7089458;
  v19[4] = self;
  v14 = v4;
  v20 = v14;
  -[TKSmartCardSlot synchronous:remoteSlotWithErrorHandler:](slot, "synchronous:remoteSlotWithErrorHandler:", synchronous, v19);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v11;
  v17[1] = 3221225472;
  v17[2] = __37__TKSmartCard_querySessionWithReply___block_invoke_2_207;
  v17[3] = &unk_1E7089538;
  v17[4] = self;
  v18 = v14;
  v16 = v14;
  objc_msgSend(v15, "sessionWithParameters:reply:", v9, v17);

}

void __37__TKSmartCard_querySessionWithReply___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "proxy");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cards");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", *(_QWORD *)(a1 + 32));

}

void __37__TKSmartCard_querySessionWithReply___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[5];

  v3 = a2;
  TK_LOG_smartcard();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __37__TKSmartCard_querySessionWithReply___block_invoke_2_cold_1();

  v5 = *(void **)(a1 + 32);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __37__TKSmartCard_querySessionWithReply___block_invoke_205;
  v8[3] = &unk_1E70891E8;
  v8[4] = v5;
  objc_msgSend(v5, "inSlotQueueExecuteBlock:", v8);
  v6 = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("CryptoTokenKit"), -7, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, void *))(v6 + 16))(v6, 0, v7);

}

void __37__TKSmartCard_querySessionWithReply___block_invoke_205(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "proxy");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cards");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObject:", *(_QWORD *)(a1 + 32));

}

void __37__TKSmartCard_querySessionWithReply___block_invoke_2_207(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[5];
  id v22;
  _QWORD v23[5];
  id v24;
  id v25;
  _QWORD v26[5];

  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (v7)
  {
    v10 = MEMORY[0x1E0C809B0];
    v11 = *(void **)(a1 + 32);
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __37__TKSmartCard_querySessionWithReply___block_invoke_2_209;
    v23[3] = &unk_1E7089510;
    v23[4] = v11;
    v24 = v7;
    v25 = v8;
    objc_msgSend(v11, "inSlotQueueExecuteBlock:", v23);
    v12 = *(_QWORD *)(a1 + 32);
    v13 = *(void **)(a1 + 40);
    v14 = *(void **)(v12 + 8);
    v15 = *(unsigned __int8 *)(v12 + 26);
    v21[0] = v10;
    v21[1] = 3221225472;
    v21[2] = __37__TKSmartCard_querySessionWithReply___block_invoke_2_213;
    v21[3] = &unk_1E7089458;
    v21[4] = v12;
    v22 = v13;
    objc_msgSend(v14, "synchronous:remoteSlotWithErrorHandler:", v15, v21);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v10;
    v19[1] = 3221225472;
    v19[2] = __37__TKSmartCard_querySessionWithReply___block_invoke_214;
    v19[3] = &unk_1E7089480;
    v20 = *(id *)(a1 + 40);
    objc_msgSend(v16, "waitForStateFlushedWithReply:", v19);

  }
  else
  {
    TK_LOG_smartcard();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      __37__TKSmartCard_querySessionWithReply___block_invoke_2_207_cold_1(a1, v17);

    v18 = *(void **)(a1 + 32);
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __37__TKSmartCard_querySessionWithReply___block_invoke_208;
    v26[3] = &unk_1E70891E8;
    v26[4] = v18;
    objc_msgSend(v18, "inSlotQueueExecuteBlock:", v26);
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

void __37__TKSmartCard_querySessionWithReply___block_invoke_208(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "proxy");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cards");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObject:", *(_QWORD *)(a1 + 32));

}

void __37__TKSmartCard_querySessionWithReply___block_invoke_2_209(uint64_t a1)
{
  uint64_t v1;
  id *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  _BOOL8 v13;
  uint64_t v14;

  v1 = a1 + 40;
  v2 = (id *)(a1 + 32);
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 32), *(id *)(a1 + 40));
  objc_msgSend(*(id *)(v1 + 8), "objectForKey:", CFSTR("protocol"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  *((_QWORD *)*v2 + 14) = objc_msgSend(v3, "unsignedIntegerValue");

  ++*((_QWORD *)*v2 + 5);
  TK_LOG_smartcard();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    __37__TKSmartCard_querySessionWithReply___block_invoke_2_209_cold_1();

  objc_msgSend(*((id *)*v2 + 1), "ATR");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "historicalRecords");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "indexOfObjectPassingTest:", &__block_literal_global_212);
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v8 = 0;
  }
  else
  {
    objc_msgSend(v6, "objectAtIndexedSubscript:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v8, "value");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "length");

  if (v10 != 3)
  {
    v13 = 0;
LABEL_11:
    v14 = 0;
    goto LABEL_12;
  }
  objc_msgSend(v8, "value");
  v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v12 = objc_msgSend(v11, "bytes");

  v13 = *(char *)(v12 + 2) < 0;
  if (*((_QWORD *)*v2 + 14) != 2 || objc_msgSend(*((id *)*v2 + 1), "maxInputLength") < 262)
    goto LABEL_11;
  v14 = (*(unsigned __int8 *)(v12 + 2) >> 6) & 1;
LABEL_12:
  objc_msgSend(*v2, "setUseExtendedLength:", v14);
  objc_msgSend(*v2, "setUseCommandChaining:", v13);

}

BOOL __37__TKSmartCard_querySessionWithReply___block_invoke_210(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "tag") == 7;
}

void __37__TKSmartCard_querySessionWithReply___block_invoke_2_213(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  TK_LOG_smartcard();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __39__TKSmartCard_releaseSessionWithReply___block_invoke_3_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __37__TKSmartCard_querySessionWithReply___block_invoke_214(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)beginSessionWithReply:(void *)reply
{
  void *v4;
  NSObject *v5;
  NSObject *beginSessionQueue;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[5];
  id v12;
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = reply;
  TK_LOG_smartcard();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[TKSmartCard beginSessionWithReply:].cold.1(self, v5);

  if (-[TKSmartCard valid](self, "valid"))
  {
    beginSessionQueue = self->_beginSessionQueue;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __37__TKSmartCard_beginSessionWithReply___block_invoke;
    v11[3] = &unk_1E70894A8;
    v11[4] = self;
    v12 = v4;
    dispatch_async(beginSessionQueue, v11);

  }
  else
  {
    TK_LOG_smartcard();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      -[TKSmartCard slot](self, "slot");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "name");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v14 = v9;
      _os_log_impl(&dword_1B9768000, v7, OS_LOG_TYPE_INFO, "%{public}@: an attempt to begin session with invalidated (removed) card", buf, 0xCu);

    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("CryptoTokenKit"), -7, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(void *, _QWORD, void *))v4 + 2))(v4, 0, v10);

  }
}

void __37__TKSmartCard_beginSessionWithReply___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  _QWORD v4[4];
  id v5;
  id v6;

  v2 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v2 + 32))
  {
    ++*(_QWORD *)(v2 + 40);
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    dispatch_suspend(*(dispatch_object_t *)(v2 + 16));
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __37__TKSmartCard_beginSessionWithReply___block_invoke_2;
    v4[3] = &unk_1E7089198;
    v3 = *(void **)(a1 + 40);
    v5 = *(id *)(a1 + 32);
    v6 = v3;
    objc_msgSend(v5, "querySessionWithReply:", v4);

  }
}

void __37__TKSmartCard_beginSessionWithReply___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  NSObject *v4;
  id v5;

  v4 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
  v5 = a3;
  dispatch_resume(v4);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (BOOL)beginSessionWithError:(id *)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  NSObject *beginSessionQueue;
  uint64_t v9;
  int v10;
  BOOL v11;
  NSObject *v12;
  void *v13;
  void *v14;
  _QWORD v16[7];
  _QWORD block[6];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  char v27;
  __int128 buf;
  uint64_t v29;
  char v30;
  _BYTE v31[24];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v27 = 1;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__0;
  v22 = __Block_byref_object_dispose__0;
  v23 = 0;
  TK_LOG_smartcard();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    -[TKSmartCard slot](self, "slot");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[TKSmartCard beginSessionWithError:].cold.1(v7, (uint64_t)v31, v5, v6);
  }

  if (-[TKSmartCard valid](self, "valid"))
  {
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v29 = 0x2020000000;
    v30 = 0;
    beginSessionQueue = self->_beginSessionQueue;
    v9 = MEMORY[0x1E0C809B0];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __37__TKSmartCard_beginSessionWithError___block_invoke;
    block[3] = &unk_1E70892D8;
    block[4] = self;
    block[5] = &buf;
    dispatch_sync(beginSessionQueue, block);
    if (*(_BYTE *)(*((_QWORD *)&buf + 1) + 24))
    {
      self->_synchronous = 1;
      v16[0] = v9;
      v16[1] = 3221225472;
      v16[2] = __37__TKSmartCard_beginSessionWithError___block_invoke_2;
      v16[3] = &unk_1E7089560;
      v16[4] = self;
      v16[5] = &v24;
      v16[6] = &v18;
      -[TKSmartCard querySessionWithReply:](self, "querySessionWithReply:", v16);
      self->_synchronous = 0;
    }
    v10 = *((unsigned __int8 *)v25 + 24);
    if (a3 && !*((_BYTE *)v25 + 24))
    {
      *a3 = objc_retainAutorelease((id)v19[5]);
      v10 = *((unsigned __int8 *)v25 + 24);
    }
    v11 = v10 != 0;
    _Block_object_dispose(&buf, 8);
  }
  else
  {
    TK_LOG_smartcard();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      -[TKSmartCard slot](self, "slot");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "name");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf) = 138543362;
      *(_QWORD *)((char *)&buf + 4) = v14;
      _os_log_impl(&dword_1B9768000, v12, OS_LOG_TYPE_INFO, "%{public}@: an attempt to begin session with invalidated (removed) card", (uint8_t *)&buf, 0xCu);

    }
    if (a3)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("CryptoTokenKit"), -7, 0);
      v11 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = 0;
    }
  }
  _Block_object_dispose(&v18, 8);

  _Block_object_dispose(&v24, 8);
  return v11;
}

void __37__TKSmartCard_beginSessionWithError___block_invoke(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v1 + 32))
  {
    ++*(_QWORD *)(v1 + 40);
  }
  else
  {
    dispatch_suspend(*(dispatch_object_t *)(v1 + 16));
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  }
}

void __37__TKSmartCard_beginSessionWithError___block_invoke_2(_QWORD *a1, char a2, void *a3)
{
  id v6;

  v6 = a3;
  dispatch_resume(*(dispatch_object_t *)(a1[4] + 16));
  *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = a2;
  if ((a2 & 1) == 0)
    objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), a3);

}

- (BOOL)inSessionWithError:(NSError *)error executeBlock:(void *)block
{
  uint64_t (**v6)(void *, NSError **);
  char v7;

  v6 = block;
  if (-[TKSmartCard beginSessionWithError:](self, "beginSessionWithError:", error))
  {
    v7 = v6[2](v6, error);
    -[TKSmartCard endSession](self, "endSession");
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (int64_t)sessionEndPolicy
{
  return 0;
}

- (void)setSessionEndPolicy:(int64_t)a3
{
  id session;

  self->_sessionEndPolicy = a3;
  session = self->_session;
  if (session)
    objc_msgSend(session, "setEndPolicy:");
}

- (void)endSessionWithReply:(id)a3
{
  id v5;
  NSObject *v6;
  NSObject *beginSessionQueue;
  id v8;
  _QWORD block[5];
  id v10;
  SEL v11;

  v5 = a3;
  TK_LOG_smartcard();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[TKSmartCard endSessionWithReply:].cold.1();

  beginSessionQueue = self->_beginSessionQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35__TKSmartCard_endSessionWithReply___block_invoke;
  block[3] = &unk_1E7089588;
  v10 = v5;
  v11 = a2;
  block[4] = self;
  v8 = v5;
  dispatch_async(beginSessionQueue, block);

}

uint64_t __35__TKSmartCard_endSessionWithReply___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  BOOL v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;
  void *v9;

  v2 = a1[4];
  if (*(_BYTE *)(v2 + 25))
    v3 = 1;
  else
    v3 = *(_BYTE *)(v2 + 24) != 0;
  *(_BYTE *)(v2 + 25) = v3;
  v4 = a1[4];
  if (!*(_QWORD *)(v4 + 32) || (v5 = *(_QWORD *)(v4 + 40), v5 <= 0))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a1[6], a1[4], CFSTR("TKSmartCard.m"), 794, CFSTR("bad endSession"));

    v4 = a1[4];
    v5 = *(_QWORD *)(v4 + 40);
  }
  v6 = v5 - 1;
  *(_QWORD *)(v4 + 40) = v6;
  if (!v6 && ((v8 = a1[4], *(_BYTE *)(v8 + 48)) || *(_QWORD *)(v8 + 56)))
    return objc_msgSend((id)v8, "releaseSessionWithReply:", a1[5]);
  else
    return (*(uint64_t (**)(void))(a1[5] + 16))();
}

- (void)endSession
{
  -[TKSmartCard endSessionWithReply:](self, "endSessionWithReply:", &__block_literal_global_222);
}

- (void)transmitRequest:(NSData *)request reply:(void *)reply
{
  NSData *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  id v11;
  void *v12;
  NSObject *v13;
  void *v14;
  _QWORD v15[5];
  id v16;
  _QWORD v17[5];
  id v18;

  v6 = request;
  v7 = reply;
  if (-[TKSmartCard valid](self, "valid"))
  {
    if (!self->_sessionCounter)
    {
      TK_LOG_smartcard();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        -[TKSmartCard transmitRequest:reply:].cold.2(self, v8);

      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("attempt to transmitRequest out of card session"));
    }
    TK_LOG_smartcard();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      -[TKSmartCard transmitRequest:reply:].cold.1();

    v10 = MEMORY[0x1E0C809B0];
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __37__TKSmartCard_transmitRequest_reply___block_invoke;
    v17[3] = &unk_1E7089458;
    v17[4] = self;
    v11 = v7;
    v18 = v11;
    -[TKSmartCard remoteSessionWithErrorHandler:](self, "remoteSessionWithErrorHandler:", v17);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = v10;
    v15[1] = 3221225472;
    v15[2] = __37__TKSmartCard_transmitRequest_reply___block_invoke_226;
    v15[3] = &unk_1E70895B0;
    v15[4] = self;
    v16 = v11;
    objc_msgSend(v12, "transmit:reply:", v6, v15);

  }
  else
  {
    TK_LOG_smartcard();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[TKSmartCard transmitRequest:reply:].cold.3(self, v13);

    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("CryptoTokenKit"), -7, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(void *, _QWORD, void *))v7 + 2))(v7, 0, v14);

  }
}

void __37__TKSmartCard_transmitRequest_reply___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;

  TK_LOG_smartcard();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __37__TKSmartCard_transmitRequest_reply___block_invoke_cold_1(a1, v2);

  v3 = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("CryptoTokenKit"), -7, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, void *))(v3 + 16))(v3, 0, v4);

}

void __37__TKSmartCard_transmitRequest_reply___block_invoke_226(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  id v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  TK_LOG_smartcard();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = *(_QWORD *)(a1 + 32);
    v9 = 138543874;
    v10 = v8;
    v11 = 2112;
    v12 = v5;
    v13 = 2114;
    v14 = v6;
    _os_log_debug_impl(&dword_1B9768000, v7, OS_LOG_TYPE_DEBUG, "%{public}@: transmitRequest got reply %@ (err=%{public}@)", (uint8_t *)&v9, 0x20u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (id)context
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TKSmartCard contextForKey:](self, "contextForKey:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)setContext:(id)context
{
  void *v4;
  id v5;
  id v6;

  v4 = (void *)MEMORY[0x1E0C99E38];
  v5 = context;
  objc_msgSend(v4, "null");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[TKSmartCard setContext:forKey:](self, "setContext:forKey:", v5, v6);

}

- (id)contextForKey:(id)a3
{
  return (id)-[NSMutableDictionary objectForKey:](self->_contexts, "objectForKey:", a3);
}

- (void)setContext:(id)a3 forKey:(id)a4
{
  id v6;
  void *v7;
  int v8;
  void *v9;
  NSMutableDictionary *v10;
  NSMutableDictionary *v11;
  NSMutableDictionary *v12;
  void *v13;
  NSMutableDictionary *contexts;
  void *v15;
  id v16;

  v16 = a3;
  v6 = a4;
  if (!v6)
  {
    NSStringFromSelector(sel_context);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[TKSmartCard willChangeValueForKey:](self, "willChangeValueForKey:", v13);

    contexts = self->_contexts;
    self->_contexts = 0;

    goto LABEL_10;
  }
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isEqual:", v7);

  if (v8)
  {
    NSStringFromSelector(sel_context);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[TKSmartCard willChangeValueForKey:](self, "willChangeValueForKey:", v9);

  }
  v10 = self->_contexts;
  if (!v16 || v10)
  {
    if (!v16)
    {
      -[NSMutableDictionary removeObjectForKey:](v10, "removeObjectForKey:", v6);
      if (!v8)
        goto LABEL_11;
      goto LABEL_10;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v11 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    v12 = self->_contexts;
    self->_contexts = v11;

    v10 = self->_contexts;
  }
  -[NSMutableDictionary setObject:forKey:](v10, "setObject:forKey:", v16, v6);
  if ((v8 & 1) != 0)
  {
LABEL_10:
    NSStringFromSelector(sel_context);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[TKSmartCard didChangeValueForKey:](self, "didChangeValueForKey:", v15);

  }
LABEL_11:

}

- (TKSmartCardUserInteractionForSecurePINVerification)userInteractionForSecurePINVerificationWithPINFormat:(TKSmartCardPINFormat *)PINFormat APDU:(NSData *)APDU PINByteOffset:(NSInteger)PINByteOffset
{
  TKSmartCardPINFormat *v8;
  NSData *v9;
  void *v10;
  void *v11;
  int v12;
  TKSmartCardUserInteractionForSecurePINVerification *v13;
  void *v14;

  v8 = PINFormat;
  v9 = APDU;
  -[TKSmartCard slot](self, "slot");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "slotParameters");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "securePINVerificationSupported");

  if (v12)
  {
    v13 = objc_alloc_init(TKSmartCardUserInteractionForSecurePINVerification);
    -[TKSmartCard slot](self, "slot");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[TKSmartCardUserInteractionForSecurePINVerification setSlot:PINFormat:APDU:PINByteOffset:](v13, "setSlot:PINFormat:APDU:PINByteOffset:", v14, v8, v9, PINByteOffset);

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (TKSmartCardUserInteractionForSecurePINChange)userInteractionForSecurePINChangeWithPINFormat:(TKSmartCardPINFormat *)PINFormat APDU:(NSData *)APDU currentPINByteOffset:(NSInteger)currentPINByteOffset newPINByteOffset:(NSInteger)newPINByteOffset
{
  TKSmartCardPINFormat *v10;
  NSData *v11;
  void *v12;
  void *v13;
  int v14;
  TKSmartCardUserInteractionForSecurePINChange *v15;
  void *v16;

  v10 = PINFormat;
  v11 = APDU;
  -[TKSmartCard slot](self, "slot");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "slotParameters");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "securePINChangeSupported");

  if (v14)
  {
    v15 = objc_alloc_init(TKSmartCardUserInteractionForSecurePINChange);
    -[TKSmartCard slot](self, "slot");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[TKSmartCardUserInteractionForSecurePINChange setSlot:PINFormat:APDU:currentPINByteOffset:newPINByteOffset:](v15, "setSlot:PINFormat:APDU:currentPINByteOffset:newPINByteOffset:", v16, v10, v11, currentPINByteOffset, newPINByteOffset);

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (void)dealloc
{
  id session;
  TKSmartCardSlot *v4;
  TKSmartCardSlot *slot;
  void *v6;
  objc_super v7;

  session = self->_session;
  if (session)
  {
    if (self->_sensitiveRequired || self->_sensitive)
    {
      -[TKSmartCard setSessionEndPolicy:](self, "setSessionEndPolicy:", 1);
      self->_sensitiveRequired = 0;
      session = self->_session;
    }
    objc_msgSend(session, "terminateWithReply:", &__block_literal_global_233);
  }
  -[TKSmartCard unreserve](self, "unreserve");
  v4 = self->_slot;
  objc_sync_enter(v4);
  slot = self->_slot;
  NSStringFromSelector(sel_state);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[TKSmartCardSlot removeObserver:forKeyPath:](slot, "removeObserver:forKeyPath:", self, v6);

  objc_sync_exit(v4);
  v7.receiver = self;
  v7.super_class = (Class)TKSmartCard;
  -[TKSmartCard dealloc](&v7, sel_dealloc);
}

- (void)reserveExclusive:(BOOL)a3 reply:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  TKSmartCardSlot *slot;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  NSNumber *reservationId;
  _QWORD v14[5];
  id v15;
  _QWORD v16[4];
  id v17;

  v4 = a3;
  v6 = a4;
  v7 = v6;
  if (self->_allowedProtocols)
  {
    slot = self->_slot;
    v9 = MEMORY[0x1E0C809B0];
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __38__TKSmartCard_reserveExclusive_reply___block_invoke;
    v16[3] = &unk_1E70893A0;
    v10 = v6;
    v17 = v10;
    -[TKSmartCardSlot synchronous:remoteSlotWithErrorHandler:](slot, "synchronous:remoteSlotWithErrorHandler:", 0, v16);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_allowedProtocols);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    reservationId = self->_reservationId;
    v14[0] = v9;
    v14[1] = 3221225472;
    v14[2] = __38__TKSmartCard_reserveExclusive_reply___block_invoke_2;
    v14[3] = &unk_1E70895D8;
    v14[4] = self;
    v15 = v10;
    objc_msgSend(v11, "reserveProtocols:reservationId:exclusive:reply:", v12, reservationId, v4, v14);

  }
  else
  {
    (*((void (**)(id, _QWORD))v6 + 2))(v6, 0);
  }

}

uint64_t __38__TKSmartCard_reserveExclusive_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __38__TKSmartCard_reserveExclusive_reply___block_invoke_2(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v7;
  id v8;

  v8 = a2;
  v7 = a3;
  if (!a4)
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 72), a3);
    if (objc_msgSend(v8, "unsignedIntegerValue"))
      objc_msgSend(*(id *)(a1 + 32), "setAllowedProtocols:", objc_msgSend(v8, "unsignedIntegerValue"));
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)unreserve
{
  void *v3;
  NSNumber *reservationId;

  if (self->_reservationId)
  {
    -[TKSmartCardSlot synchronous:remoteSlotWithErrorHandler:](self->_slot, "synchronous:remoteSlotWithErrorHandler:", 0, &__block_literal_global_235);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "reserveProtocols:reservationId:exclusive:reply:", 0, self->_reservationId, 0, &__block_literal_global_236);

    reservationId = self->_reservationId;
    self->_reservationId = 0;

  }
}

- (BOOL)revalidate
{
  if (-[TKSmartCardSlot state](self->_slot, "state") == TKSmartCardSlotStateValidCard)
    -[TKSmartCard setValid:](self, "setValid:", 1);
  return -[TKSmartCard valid](self, "valid");
}

- (UInt8)cla
{
  return self->_cla;
}

- (void)setCla:(UInt8)cla
{
  self->_cla = cla;
}

- (BOOL)useExtendedLength
{
  return self->_useExtendedLength;
}

- (void)setUseExtendedLength:(BOOL)useExtendedLength
{
  self->_useExtendedLength = useExtendedLength;
}

- (BOOL)useCommandChaining
{
  return self->_useCommandChaining;
}

- (void)setUseCommandChaining:(BOOL)useCommandChaining
{
  self->_useCommandChaining = useCommandChaining;
}

+ (BOOL)decodeResponse:(id)a3 sw:(unsigned __int16 *)a4 appendTo:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  BOOL v11;
  id v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  int v17;
  unsigned int v18;
  unsigned int v19;
  uint64_t v20;
  NSObject *v21;
  NSObject *v22;
  int v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  _QWORD v35[2];
  _QWORD v36[2];
  uint8_t buf[4];
  int v38;
  __int16 v39;
  int v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a5;
  *a4 = 0;
  if (!v9)
    goto LABEL_5;
  if ((unint64_t)objc_msgSend(v9, "length") <= 1)
  {
    if (a6)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("CryptoTokenKit"), -3, 0);
      v11 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    }
LABEL_5:
    v11 = 0;
    goto LABEL_6;
  }
  v13 = objc_retainAutorelease(v9);
  v14 = objc_msgSend(v13, "bytes");
  v15 = objc_msgSend(v13, "length");
  *a4 = bswap32(*(unsigned __int16 *)(v14 + v15 - 2)) >> 16;
  objc_msgSend(v10, "appendBytes:length:", v14, v15 - 2);
  v16 = *a4;
  v11 = 1;
  if (v16 != 36864 && (v16 & 0xFF00) != 0x6100)
  {
    v17 = v16 & 0xFFC0;
    v18 = v16 & 0x3F;
    if (v16 == 27011)
      v19 = 0;
    else
      v19 = -1;
    if (v17 == 25536)
      v20 = v18;
    else
      v20 = v19;
    TK_LOG_smartcard();
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = v21;
    if ((v20 & 0x80000000) != 0)
    {
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
        +[TKSmartCard decodeResponse:sw:appendTo:error:].cold.1(a4, v22);

      if (a6)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SmartCard returned error %04hx"), *a4);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = (void *)MEMORY[0x1E0CB35C8];
        v33 = *MEMORY[0x1E0CB2D50];
        v34 = v30;
        v11 = 1;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v34, &v33, 1);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "errorWithDomain:code:userInfo:", CFSTR("CryptoTokenKit"), -3, v32);
        *a6 = (id)objc_claimAutoreleasedReturnValue();

        goto LABEL_6;
      }
    }
    else
    {
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        v23 = *a4;
        *(_DWORD *)buf = 67109376;
        v38 = v23;
        v39 = 1024;
        v40 = v20;
        _os_log_impl(&dword_1B9768000, v22, OS_LOG_TYPE_INFO, "Failed to verify PIN. sw=0x%04hx, retries: %d", buf, 0xEu);
      }

      if (a6)
      {
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.CryptoTokenKit"));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "localizedStringForKey:value:table:", CFSTR("VERIFY_TRY_LEFT"), &stru_1E708AD68, 0);
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0CB3940], "localizedStringWithFormat:", v25, v20);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = (void *)MEMORY[0x1E0CB35C8];
        v35[0] = *MEMORY[0x1E0CB2D50];
        v35[1] = CFSTR("userSecretTriesLeft");
        v36[0] = v26;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v20);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v36[1] = v28;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v36, v35, 2);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "errorWithDomain:code:userInfo:", CFSTR("CryptoTokenKit"), -5, v29);
        *a6 = (id)objc_claimAutoreleasedReturnValue();

      }
    }
    v11 = 1;
  }
LABEL_6:

  return v11;
}

- (BOOL)checkAPDUResponse:(id)a3 error:(id *)a4
{
  id v5;
  char v6;
  __int16 v8;

  v8 = 0;
  v5 = a3;
  v6 = objc_msgSend((id)objc_opt_class(), "decodeResponse:sw:appendTo:error:", v5, &v8, 0, a4);

  if (v8 == -28672)
    return v6;
  else
    return 0;
}

- (void)handleApduResponse:(id)a3 body:(id)a4 le:(unint64_t)a5 isCase4:(BOOL)a6 error:(id)a7 reply:(id)a8
{
  _BOOL4 v10;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  unsigned __int16 v19;
  unint64_t v20;
  void *v21;
  _QWORD v22[5];
  id v23;
  id v24;
  unint64_t v25;
  unsigned __int8 cla;
  __int16 v27;
  char v28;
  char v29;
  id v30;
  unsigned __int16 v31;

  v10 = a6;
  v14 = a4;
  v15 = a8;
  v31 = 0;
  v16 = a7;
  v17 = a3;
  v30 = v16;
  LOBYTE(a3) = objc_msgSend((id)objc_opt_class(), "decodeResponse:sw:appendTo:error:", v17, &v31, v14, &v30);

  v18 = v30;
  if ((a3 & 1) == 0)
  {
    (*((void (**)(id, _QWORD, _QWORD, id))v15 + 2))(v15, 0, 0, v18);
    goto LABEL_25;
  }
  v19 = v31;
  if (v31 == 36864 && v10)
  {
    if (self->_currentProtocol != 1)
      goto LABEL_13;
    if (!objc_msgSend(v14, "length"))
    {
      v31 = 24832;
LABEL_11:
      if (objc_msgSend(v14, "length") >= a5)
      {
        v31 = -28672;

        v18 = 0;
      }
      goto LABEL_13;
    }
    v19 = v31;
  }
  if ((v19 & 0xFF00) == 0x6100)
    goto LABEL_11;
LABEL_13:
  if ((v31 & 0xFF00) == 0x6100)
  {
    if ((_BYTE)v31)
      v20 = v31;
    else
      v20 = 256;
    if (objc_msgSend(v14, "length") + v20 > a5)
      v20 = a5 - objc_msgSend(v14, "length");
    if (v20 > -[TKSmartCardSlot maxOutputLength](self->_slot, "maxOutputLength") - 2)
      LOBYTE(v20) = -[TKSmartCardSlot maxOutputLength](self->_slot, "maxOutputLength") - 2;
    cla = self->_cla;
    v27 = 192;
    v28 = 0;
    v29 = v20;
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", &cla, 5);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __62__TKSmartCard_handleApduResponse_body_le_isCase4_error_reply___block_invoke;
    v22[3] = &unk_1E7089660;
    v22[4] = self;
    v23 = v14;
    v25 = a5;
    v24 = v15;
    -[TKSmartCard transmitRequest:reply:](self, "transmitRequest:reply:", v21, v22);

  }
  else
  {
    if (objc_msgSend(v14, "length") > a5)
      objc_msgSend(v14, "setLength:", a5);
    (*((void (**)(id, id, _QWORD, id))v15 + 2))(v15, v14, v31, v18);
  }
LABEL_25:

}

uint64_t __62__TKSmartCard_handleApduResponse_body_le_isCase4_error_reply___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleApduResponse:body:le:isCase4:error:reply:", a2, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56), 0, a3, *(_QWORD *)(a1 + 48));
}

- (void)encodeLength:(unint64_t)a3 into:(id)a4 sized:(int64_t)a5
{
  id v7;
  void *v8;
  char v9;
  __int16 *v10;
  uint64_t v11;
  _BYTE v12[3];
  __int16 v13;
  char v14;

  v7 = a4;
  v8 = v7;
  switch(a5)
  {
    case 3:
      v12[0] = 0;
      v12[1] = BYTE1(a3);
      v12[2] = a3;
      v10 = (__int16 *)v12;
      v11 = 3;
LABEL_9:
      objc_msgSend(v7, "appendBytes:length:", v10, v11);
      break;
    case 2:
      v13 = bswap32(a3) >> 16;
      v10 = &v13;
      v11 = 2;
      goto LABEL_9;
    case 1:
      v9 = 0;
      if (a3 < 0x100)
        v9 = a3;
      v14 = v9;
      v10 = (__int16 *)&v14;
      v11 = 1;
      goto LABEL_9;
  }

}

- (id)buildIns:(unsigned __int8)a3 p1:(unsigned __int8)a4 p2:(unsigned __int8)a5 data:(id)a6 range:(_NSRange)a7 le:(id)a8 protocol:(unint64_t)a9 chained:(BOOL)a10 extended:(BOOL *)a11 realLe:(unint64_t *)a12
{
  NSUInteger length;
  id v17;
  id v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  unsigned __int8 cla;
  _BOOL4 v24;
  uint64_t v25;
  unint64_t v26;
  BOOL *v27;
  int v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  TKSmartCard *v33;
  void *v34;
  uint64_t v35;
  NSUInteger location;
  _BYTE v38[4];

  length = a7.length;
  location = a7.location;
  v17 = a6;
  v18 = a8;
  v19 = (void *)MEMORY[0x1E0C99DF0];
  if (v17)
    v20 = objc_msgSend(v17, "length") + 10;
  else
    v20 = 10;
  objc_msgSend(v19, "dataWithCapacity:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v21;
  cla = self->_cla;
  v38[0] = cla;
  v38[1] = a3;
  v38[2] = a4;
  v38[3] = a5;
  if (a10)
    v38[0] = cla | 0x10;
  objc_msgSend(v21, "appendBytes:length:", v38, 4);
  if (v17)
  {
    if (length >= 0x10000)
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Attempt to send APDU with Lc=%lu"), length);
    v24 = length > 0xFF;
  }
  else
  {
    v24 = 0;
  }
  *a12 = 0;
  if (!v18)
  {
    v27 = a11;
    if (!v17)
      goto LABEL_26;
    goto LABEL_22;
  }
  if ((unint64_t)objc_msgSend(v18, "unsignedIntegerValue") > 0x10000)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Attempt to send APDU with Le=%@"), v18);
  v25 = objc_msgSend(v18, "unsignedIntegerValue");
  v26 = 0x10000;
  if (v25)
    v26 = v25;
  *a12 = v26;
  v27 = a11;
  v28 = v26 > 0x100 || v24;
  if (*a11)
    v24 = v28;
  if (v17)
  {
LABEL_22:
    if (v24)
      v29 = 3;
    else
      v29 = 1;
    -[TKSmartCard encodeLength:into:sized:](self, "encodeLength:into:sized:", length, v22, v29);
    objc_msgSend(v22, "appendBytes:length:", objc_msgSend(objc_retainAutorelease(v17), "bytes") + location, length);
  }
LABEL_26:
  if (v18)
  {
    if (!v17 || a9 == 2)
    {
      v30 = 2;
      if (!v17)
        v30 = 3;
      if (v24)
        v31 = v30;
      else
        v31 = 1;
      v32 = objc_msgSend(v18, "unsignedIntegerValue");
      v33 = self;
      v34 = v22;
      v35 = v31;
      goto LABEL_40;
    }
  }
  else if (!v17 && a9 == 1)
  {
    v33 = self;
    v32 = 0;
    v34 = v22;
    v35 = 1;
LABEL_40:
    -[TKSmartCard encodeLength:into:sized:](v33, "encodeLength:into:sized:", v32, v34, v35);
  }
  *v27 = v24;

  return v22;
}

- (void)transmitChunkedIns:(unsigned __int8)a3 p1:(unsigned __int8)a4 p2:(unsigned __int8)a5 data:(id)a6 fromOffset:(unint64_t)a7 realLe:(unint64_t)a8 chained:(BOOL)a9 isCase4:(BOOL)a10 reply:(id)a11
{
  unsigned int v13;
  id v15;
  id v16;
  uint64_t v17;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  int v23;
  uint64_t v24;
  uint64_t v26;
  char v27;
  uint64_t v28;
  void *v29;
  void *v30;
  id v31;
  id v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  id v37;
  unint64_t v38;
  unsigned int v39;
  unsigned int v40;
  unsigned int v41;
  _QWORD v42[5];
  id v43;
  unint64_t v44;
  BOOL v45;
  _QWORD v46[5];
  id v47;
  id v48;
  uint64_t *v49;
  unint64_t v50;
  unint64_t v51;
  unint64_t v52;
  char v53;
  BOOL v54;
  char v55;
  char v56;
  char v57;
  BOOL v58;
  uint64_t v59;
  uint64_t *v60;
  uint64_t v61;
  char v62;
  uint64_t v63;
  _BYTE v64[9];

  v13 = a5;
  v39 = a3;
  v40 = a4;
  v15 = a6;
  v16 = a11;
  v17 = objc_msgSend(v15, "length");
  if (v17 - a7 > 0xFF && !self->_useExtendedLength)
    v19 = 255;
  else
    v19 = v17 - a7;
  if (v19 <= 0xFF)
    v20 = 5;
  else
    v20 = 7;
  v41 = v13;
  if (a9 && v19 + a7 == objc_msgSend(v15, "length"))
  {
    v21 = 6;
    if (v19 > 0xFF)
      v21 = 9;
    if (self->_currentProtocol == 2 || v15 == 0)
      v20 = v21;
    v23 = 1;
  }
  else
  {
    v23 = 0;
  }
  if (v20 + v19 > -[TKSmartCardSlot maxInputLength](self->_slot, "maxInputLength"))
  {
    if (v23)
    {
      v24 = -2;
      if (v19 <= 0xFF)
        v24 = -1;
      if (self->_currentProtocol == 2 || v15 == 0)
        v26 = v24;
      else
        v26 = 0;
      v20 += v26;
    }
    LOBYTE(v23) = 0;
    v19 = -[TKSmartCardSlot maxInputLength](self->_slot, "maxInputLength") - v20;
  }
  v64[0] = self->_useExtendedLength;
  v63 = 0;
  if (v19)
  {
    v27 = v23 ^ 1;
    if ((v23 & a10) == 1)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a8);
      v28 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v28 = 0;
    }
    LOBYTE(v35) = v27 & a9;
    v36 = (void *)v28;
    -[TKSmartCard buildIns:p1:p2:data:range:le:protocol:chained:extended:realLe:](self, "buildIns:p1:p2:data:range:le:protocol:chained:extended:realLe:", v39, v40, v13, v15, a7, v19, v28, self->_currentProtocol, v35, v64, &v63);
    v38 = a7;
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = 0;
    v60 = &v59;
    v61 = 0x2020000000;
    v62 = 0;
    v46[0] = MEMORY[0x1E0C809B0];
    v46[1] = 3221225472;
    v46[2] = __85__TKSmartCard_transmitChunkedIns_p1_p2_data_fromOffset_realLe_chained_isCase4_reply___block_invoke;
    v46[3] = &unk_1E7089688;
    v53 = v23;
    v46[4] = self;
    v50 = a8;
    v54 = a10;
    v31 = v16;
    v48 = v31;
    v55 = v39;
    v56 = v40;
    v57 = v13;
    v37 = v15;
    v32 = v15;
    v51 = v38;
    v52 = v19;
    v58 = a9;
    v47 = v32;
    v49 = &v59;
    -[TKSmartCard transmitRequest:reply:](self, "transmitRequest:reply:", v30, v46);
    if (*((_BYTE *)v60 + 24))
    {
      BYTE1(v34) = a10;
      LOBYTE(v34) = v27 & a9;
      -[TKSmartCard transmitChunkedIns:p1:p2:data:fromOffset:realLe:chained:isCase4:reply:](self, "transmitChunkedIns:p1:p2:data:fromOffset:realLe:chained:isCase4:reply:", v39, v40, v13, v32, v19 + v38, a8, v34, v31);
    }

    _Block_object_dispose(&v59, 8);
    v33 = v36;
    v15 = v37;
  }
  else
  {
    if (a10)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a8);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v29 = 0;
    }
    LOBYTE(v35) = a9 & ~(_BYTE)v23;
    -[TKSmartCard buildIns:p1:p2:data:range:le:protocol:chained:extended:realLe:](self, "buildIns:p1:p2:data:range:le:protocol:chained:extended:realLe:", v39, v40, v41, 0, 0, 0, v29, self->_currentProtocol, v35, v64, &v63);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    if (a10)

    v42[0] = MEMORY[0x1E0C809B0];
    v42[1] = 3221225472;
    v42[2] = __85__TKSmartCard_transmitChunkedIns_p1_p2_data_fromOffset_realLe_chained_isCase4_reply___block_invoke_2;
    v42[3] = &unk_1E70896B0;
    v42[4] = self;
    v44 = a8;
    v45 = a10;
    v43 = v16;
    -[TKSmartCard transmitRequest:reply:](self, "transmitRequest:reply:", v33, v42);

  }
}

void __85__TKSmartCard_transmitChunkedIns_p1_p2_data_fromOffset_realLe_chained_isCase4_reply___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  int v12;
  uint64_t v13;
  void *v14;
  char v15;
  uint64_t v16;
  id v17;
  unsigned __int16 v18;

  v5 = a3;
  if (*(_BYTE *)(a1 + 88))
  {
    v6 = *(void **)(a1 + 32);
    v7 = (void *)MEMORY[0x1E0C99DF0];
    v8 = a2;
    objc_msgSend(v7, "data");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleApduResponse:body:le:isCase4:error:reply:", v8, v9, *(_QWORD *)(a1 + 64), *(unsigned __int8 *)(a1 + 89), v5, *(_QWORD *)(a1 + 48));

    v10 = v5;
  }
  else
  {
    v18 = 0;
    v11 = a2;
    v17 = v5;
    v12 = objc_msgSend((id)objc_opt_class(), "decodeResponse:sw:appendTo:error:", v11, &v18, 0, &v17);

    v10 = v17;
    if (v12 && v18 == 36864)
    {
      if ((objc_msgSend(*(id *)(a1 + 32), "synchronous") & 1) != 0)
      {
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
      }
      else
      {
        v15 = *(_BYTE *)(a1 + 93);
        if (v15)
          v15 = *(_BYTE *)(a1 + 88) == 0;
        BYTE1(v16) = *(_BYTE *)(a1 + 89);
        LOBYTE(v16) = v15;
        objc_msgSend(*(id *)(a1 + 32), "transmitChunkedIns:p1:p2:data:fromOffset:realLe:chained:isCase4:reply:", *(unsigned __int8 *)(a1 + 90), *(unsigned __int8 *)(a1 + 91), *(unsigned __int8 *)(a1 + 92), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 80) + *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 64), v16, *(_QWORD *)(a1 + 48));
      }
    }
    else
    {
      v13 = *(_QWORD *)(a1 + 48);
      if ((v12 & 1) != 0)
      {
        objc_msgSend(MEMORY[0x1E0C99D50], "data", v18);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, void *, _QWORD, id))(v13 + 16))(v13, v14, v18, v10);

      }
      else
      {
        (*(void (**)(uint64_t, _QWORD, _QWORD, id))(v13 + 16))(v13, 0, v18, v10);
      }
    }
  }

}

void __85__TKSmartCard_transmitChunkedIns_p1_p2_data_fromOffset_realLe_chained_isCase4_reply___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;

  v5 = *(void **)(a1 + 32);
  v6 = (void *)MEMORY[0x1E0C99DF0];
  v7 = a3;
  v8 = a2;
  objc_msgSend(v6, "data");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleApduResponse:body:le:isCase4:error:reply:", v8, v9, *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 56), v7, *(_QWORD *)(a1 + 40));

}

- (void)sendIns:(UInt8)ins p1:(UInt8)p1 p2:(UInt8)p2 data:(NSData *)requestData le:(NSNumber *)le reply:(void *)reply
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSData *v14;
  NSNumber *v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  BOOL v20;
  char v21;
  void *v22;
  unint64_t v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char v32;
  _QWORD v33[5];
  id v34;
  uint64_t v35;
  char v36;
  BOOL useExtendedLength;
  _QWORD v38[4];
  NSObject *v39;
  uint8_t buf[8];
  __int16 v41;
  int v42;
  __int16 v43;
  int v44;
  __int16 v45;
  NSData *v46;
  __int16 v47;
  NSNumber *v48;
  uint64_t v49;

  v10 = p2;
  v11 = p1;
  v12 = ins;
  v49 = *MEMORY[0x1E0C80C00];
  v14 = requestData;
  v15 = le;
  v16 = reply;
  if (!self->_sessionCounter)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("sendIns: not in active card session"));
  v17 = self->_syncObject;
  objc_sync_enter(v17);
  if (-[TKSmartCard valid](self, "valid"))
  {
    if (self->_currentProtocol - 1 >= 2)
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("sendIns: found protocol 0x%04lx, but only T=0 or T=1 protocols are supported"), self->_currentProtocol);
    objc_sync_exit(v17);

    TK_LOG_smartcard();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 67110146;
      *(_DWORD *)&buf[4] = v12;
      v41 = 1024;
      v42 = v11;
      v43 = 1024;
      v44 = v10;
      v45 = 2112;
      v46 = v14;
      v47 = 2112;
      v48 = v15;
      _os_log_debug_impl(&dword_1B9768000, v18, OS_LOG_TYPE_DEBUG, "req: %02x %02x%02x %@ le:%@", buf, 0x28u);
    }

    v38[0] = MEMORY[0x1E0C809B0];
    v38[1] = 3221225472;
    v38[2] = __43__TKSmartCard_sendIns_p1_p2_data_le_reply___block_invoke;
    v38[3] = &unk_1E70896D8;
    v39 = v16;
    v19 = (void *)MEMORY[0x1BCCC4AEC](v38);
    if (v14)
      v20 = v15 == 0;
    else
      v20 = 1;
    v21 = !v20;
    v32 = v21;
    useExtendedLength = self->_useExtendedLength;
    *(_QWORD *)buf = 0;
    LOBYTE(v30) = 0;
    -[TKSmartCard buildIns:p1:p2:data:range:le:protocol:chained:extended:realLe:](self, "buildIns:p1:p2:data:range:le:protocol:chained:extended:realLe:", v12, v11, v10, v14, 0, -[NSData length](v14, "length"), v15, self->_currentProtocol, v30, &useExtendedLength, buf);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "length");
    if (v23 > -[TKSmartCardSlot maxInputLength](self->_slot, "maxInputLength")
      || useExtendedLength && !self->_useExtendedLength)
    {
      if (self->_useCommandChaining)
      {
        BYTE1(v29) = v32;
        LOBYTE(v29) = 1;
        -[TKSmartCard transmitChunkedIns:p1:p2:data:fromOffset:realLe:chained:isCase4:reply:](self, "transmitChunkedIns:p1:p2:data:fromOffset:realLe:chained:isCase4:reply:", v12, v11, v10, v14, 0, *(_QWORD *)buf, v29, v19);
      }
      else
      {
        if (self->_currentProtocol != 2 || !self->_useExtendedLength)
        {
          useExtendedLength = 1;
          LOBYTE(v31) = 0;
          -[TKSmartCard buildIns:p1:p2:data:range:le:protocol:chained:extended:realLe:](self, "buildIns:p1:p2:data:range:le:protocol:chained:extended:realLe:", v12, v11, v10, v14, 0, -[NSData length](v14, "length"), v15, 2, v31, &useExtendedLength, buf);
          v28 = objc_claimAutoreleasedReturnValue();

          v22 = (void *)v28;
        }
        BYTE1(v29) = v32;
        LOBYTE(v29) = 0;
        -[TKSmartCard transmitChunkedIns:p1:p2:data:fromOffset:realLe:chained:isCase4:reply:](self, "transmitChunkedIns:p1:p2:data:fromOffset:realLe:chained:isCase4:reply:", 194, 0, 0, v22, 0, *(_QWORD *)buf, v29, v19);
      }
    }
    else
    {
      v33[0] = MEMORY[0x1E0C809B0];
      v33[1] = 3221225472;
      v33[2] = __43__TKSmartCard_sendIns_p1_p2_data_le_reply___block_invoke_252;
      v33[3] = &unk_1E70896B0;
      v33[4] = self;
      v35 = *(_QWORD *)buf;
      v36 = v32;
      v34 = v19;
      -[TKSmartCard transmitRequest:reply:](self, "transmitRequest:reply:", v22, v33);

    }
    v17 = v39;
  }
  else
  {
    TK_LOG_smartcard();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      -[TKSmartCard slot](self, "slot");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "name");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[TKSmartCard sendIns:p1:p2:data:le:reply:].cold.1(v26, (uint64_t)buf, v24, v25);
    }

    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("CryptoTokenKit"), -7, 0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(void *, _QWORD, _QWORD, void *))v16 + 2))(v16, 0, 0, v27);

    objc_sync_exit(v17);
  }

}

void __43__TKSmartCard_sendIns_p1_p2_data_le_reply___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  NSObject *v8;

  v6 = a2;
  v7 = a4;
  if (v6)
  {
    TK_LOG_smartcard();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      __43__TKSmartCard_sendIns_p1_p2_data_le_reply___block_invoke_cold_1();

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __43__TKSmartCard_sendIns_p1_p2_data_le_reply___block_invoke_252(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;

  v5 = *(void **)(a1 + 32);
  v6 = (void *)MEMORY[0x1E0C99DF0];
  v7 = a3;
  v8 = a2;
  objc_msgSend(v6, "data");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleApduResponse:body:le:isCase4:error:reply:", v8, v9, *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 56), v7, *(_QWORD *)(a1 + 40));

}

- (NSData)sendIns:(UInt8)ins p1:(UInt8)p1 p2:(UInt8)p2 data:(NSData *)requestData le:(NSNumber *)le sw:(UInt16 *)sw error:(NSError *)error
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSData *v15;
  NSNumber *v16;
  void *v17;
  id v18;
  _QWORD v20[7];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;

  v11 = p2;
  v12 = p1;
  v13 = ins;
  v15 = requestData;
  v16 = le;
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__0;
  v31 = __Block_byref_object_dispose__0;
  v32 = 0;
  self->_synchronous = 1;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__0;
  v25 = __Block_byref_object_dispose__0;
  v26 = 0;
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __46__TKSmartCard_sendIns_p1_p2_data_le_sw_error___block_invoke;
  v20[3] = &unk_1E7089700;
  v20[5] = &v21;
  v20[6] = sw;
  v20[4] = &v27;
  -[TKSmartCard sendIns:p1:p2:data:le:reply:](self, "sendIns:p1:p2:data:le:reply:", v13, v12, v11, v15, v16, v20);
  self->_synchronous = 0;
  if (error)
  {
    v17 = (void *)v22[5];
    if (v17)
      *error = (NSError *)objc_retainAutorelease(v17);
  }
  v18 = (id)v28[5];
  _Block_object_dispose(&v21, 8);

  _Block_object_dispose(&v27, 8);
  return (NSData *)v18;
}

void __46__TKSmartCard_sendIns_p1_p2_data_le_sw_error___block_invoke(uint64_t a1, void *a2, __int16 a3, void *a4)
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;

  v7 = a2;
  v8 = a4;
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v7;
  v13 = v7;

  **(_WORD **)(a1 + 48) = a3;
  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v12 = *(void **)(v11 + 40);
  *(_QWORD *)(v11 + 40) = v8;

}

- (BOOL)selectApplication:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  char v8;
  void *v9;
  int v10;
  BOOL v11;
  void *v12;
  void *v13;
  void *v14;
  unsigned __int16 v16;
  uint64_t v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[TKSmartCard contextForKey:](self, "contextForKey:", CFSTR("AID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isEqual:", v7);

  if ((v8 & 1) != 0)
    goto LABEL_5;
  v16 = 0;
  -[TKSmartCard sendIns:p1:p2:data:le:sw:error:](self, "sendIns:p1:p2:data:le:sw:error:", 164, 4, 0, v6, 0, &v16, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v16;

  if (v9 && v10 == 36864)
  {
    -[TKSmartCard setContext:forKey:](self, "setContext:forKey:", v6, CFSTR("AID"));
LABEL_5:
    v11 = 1;
    goto LABEL_11;
  }
  if (a4)
  {
    v17 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unable to select card application AID %@"), v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v12;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v13, "mutableCopy");

    if (*a4)
      objc_msgSend(v14, "setObject:forKeyedSubscript:", *a4, *MEMORY[0x1E0CB3388]);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("CryptoTokenKit"), -7, v14);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

  }
  v11 = 0;
LABEL_11:

  return v11;
}

- (TKSmartCardSlot)slot
{
  return self->_slot;
}

- (BOOL)valid
{
  return self->_valid;
}

- (void)setValid:(BOOL)a3
{
  self->_valid = a3;
}

- (TKSmartCardProtocol)allowedProtocols
{
  return self->_allowedProtocols;
}

- (void)setAllowedProtocols:(TKSmartCardProtocol)allowedProtocols
{
  self->_allowedProtocols = allowedProtocols;
}

- (TKSmartCardProtocol)currentProtocol
{
  return self->_currentProtocol;
}

- (void)setCurrentProtocol:(unint64_t)a3
{
  self->_currentProtocol = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syncObject, 0);
  objc_storeStrong((id *)&self->_reservationId, 0);
  objc_storeStrong((id *)&self->_contexts, 0);
  objc_storeStrong(&self->_session, 0);
  objc_storeStrong((id *)&self->_beginSessionQueue, 0);
  objc_storeStrong((id *)&self->_slot, 0);
}

- (void)initWithSlot:(uint64_t)a1 .cold.1(uint64_t a1)
{
  NSObject *v1;
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138543618;
  v3 = a1;
  OUTLINED_FUNCTION_10_1();
  OUTLINED_FUNCTION_6_0(&dword_1B9768000, v1, (uint64_t)v1, "%{public}@: connected to slot %{public}@", (uint8_t *)&v2);
  OUTLINED_FUNCTION_4();
}

- (void)observeValueForKeyPath:ofObject:change:context:.cold.1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_10_1();
  OUTLINED_FUNCTION_6_0(&dword_1B9768000, v0, (uint64_t)v0, "%{public}@: invalidating because of state changed to %ld", v1);
  OUTLINED_FUNCTION_4();
}

- (void)releaseSessionWithReply:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_6_0(&dword_1B9768000, v0, v1, "%{public}@: releasing card session %{public}@", v2);
  OUTLINED_FUNCTION_4();
}

void __39__TKSmartCard_releaseSessionWithReply___block_invoke_3_cold_1()
{
  uint64_t v0;
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_16();
  objc_msgSend((id)OUTLINED_FUNCTION_9_0(v0), "slot");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "name");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_6(&dword_1B9768000, v3, v4, "%{public}@: failed to waitForStateFlushedWithReply: %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)querySessionWithReply:.cold.1()
{
  __int16 v0;
  uint64_t v1;
  os_log_t v2;
  uint8_t v3[22];
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_12();
  v4 = v0;
  v5 = v1;
  _os_log_debug_impl(&dword_1B9768000, v2, OS_LOG_TYPE_DEBUG, "%{public}@: querying slot for the session, proto=%04lx, counter=%ld", v3, 0x20u);
}

void __37__TKSmartCard_querySessionWithReply___block_invoke_2_cold_1()
{
  uint64_t v0;
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_16();
  objc_msgSend((id)OUTLINED_FUNCTION_9_0(v0), "slot");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "name");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_6(&dword_1B9768000, v3, v4, "%{public}@: failed to call slot to allocate exclusive session for the card: %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

void __37__TKSmartCard_querySessionWithReply___block_invoke_2_207_cold_1(uint64_t a1, NSObject *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];

  objc_msgSend((id)OUTLINED_FUNCTION_9_0(a1), "slot");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0(&dword_1B9768000, a2, v5, "%{public}@: slot refused to allocate exclusive session for the card", v6);

  OUTLINED_FUNCTION_2();
}

void __37__TKSmartCard_querySessionWithReply___block_invoke_2_209_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  os_log_t v2;
  uint8_t v3[22];
  __int16 v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_11();
  v4 = 2048;
  v5 = v0;
  v6 = 2048;
  v7 = v1;
  _os_log_debug_impl(&dword_1B9768000, v2, OS_LOG_TYPE_DEBUG, "%{public}@: slot answered session %{public}@ (protocol=0x%04lx, counter=%ld)", v3, 0x2Au);
}

- (void)beginSessionWithReply:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "slot");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_1B9768000, a2, v5, "%{public}@: begin exclusive SmartCard session", v6);

  OUTLINED_FUNCTION_2();
}

- (void)beginSessionWithError:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3, void *a4)
{
  *(_DWORD *)a2 = 138543362;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_1(&dword_1B9768000, a3, (uint64_t)a3, "%{public}@: begin exclusive SmartCard session", (uint8_t *)a2);

}

- (void)endSessionWithReply:.cold.1()
{
  int v0;
  NSObject *v1;
  uint64_t v2;
  uint8_t v3[22];
  __int16 v4;
  int v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_12();
  v4 = 1024;
  v5 = v0;
  OUTLINED_FUNCTION_15(&dword_1B9768000, v1, v2, "%{public}@: endSession: counter=%ld, someoneWantsSession=%d", v3);
}

- (void)transmitRequest:reply:.cold.1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_10_1();
  OUTLINED_FUNCTION_6_0(&dword_1B9768000, v0, (uint64_t)v0, "%{public}@: transmitRequest:%@", v1);
  OUTLINED_FUNCTION_4();
}

- (void)transmitRequest:(void *)a1 reply:(NSObject *)a2 .cold.2(void *a1, NSObject *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "slot");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0(&dword_1B9768000, a2, v5, "%{public}@: attempted to transmit APDU when no session is opened", v6);

  OUTLINED_FUNCTION_2();
}

- (void)transmitRequest:(void *)a1 reply:(NSObject *)a2 .cold.3(void *a1, NSObject *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "slot");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0(&dword_1B9768000, a2, v5, "%{public}@: transmitRequest invoked on card invalid (removed) card", v6);

  OUTLINED_FUNCTION_2();
}

void __37__TKSmartCard_transmitRequest_reply___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];

  objc_msgSend((id)OUTLINED_FUNCTION_9_0(a1), "slot");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0(&dword_1B9768000, a2, v5, "%{public}@: token disappeared while transmitting request", v6);

  OUTLINED_FUNCTION_2();
}

+ (void)decodeResponse:(unsigned __int16 *)a1 sw:(NSObject *)a2 appendTo:error:.cold.1(unsigned __int16 *a1, NSObject *a2)
{
  int v2;
  _DWORD v3[2];
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = *a1;
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_debug_impl(&dword_1B9768000, a2, OS_LOG_TYPE_DEBUG, "SmartCard returned error sw: 0x%04hx", (uint8_t *)v3, 8u);
  OUTLINED_FUNCTION_8();
}

- (void)sendIns:(NSObject *)a3 p1:(void *)a4 p2:data:le:reply:.cold.1(void *a1, uint64_t a2, NSObject *a3, void *a4)
{
  *(_DWORD *)a2 = 138543362;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_3_0(&dword_1B9768000, a3, (uint64_t)a3, "%{public}@: sendIns invoked on invalid (removed) card", (uint8_t *)a2);

}

void __43__TKSmartCard_sendIns_p1_p2_data_le_reply___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  id v2;
  unsigned __int16 v3;
  uint64_t v4;
  _DWORD v5[2];
  __int16 v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  OUTLINED_FUNCTION_16();
  v10 = *MEMORY[0x1E0C80C00];
  v5[0] = 67109634;
  v5[1] = v3;
  v6 = 2048;
  v7 = objc_msgSend(v2, "length");
  v8 = 2112;
  v9 = v1;
  OUTLINED_FUNCTION_15(&dword_1B9768000, v0, v4, "rsp: %04x len:%lu:%@", (uint8_t *)v5);
}

@end
