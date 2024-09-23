@implementation IPXPCEventStateUpdateStreamSubscriber

- (IPXPCEventStateUpdateStreamSubscriber)initWithToken:(unint64_t)a3
{
  IPXPCEventStateUpdateStreamSubscriber *v4;
  IPXPCEventStateUpdateStreamSubscriber *v5;
  NSMutableArray *v6;
  NSMutableArray *queuedMessages;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)IPXPCEventStateUpdateStreamSubscriber;
  v4 = -[IPXPCEventStateUpdateStreamSubscriber init](&v9, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_token = a3;
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    queuedMessages = v5->_queuedMessages;
    v5->_queuedMessages = v6;

  }
  return v5;
}

- (void)beginHandshake
{
  xpc_object_t v3;
  NSObject *v4;
  unint64_t token;
  id WeakRetained;
  _QWORD v7[5];
  xpc_object_t values;
  char *keys;
  uint8_t buf[4];
  unint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  keys = (char *)objc_msgSend(CFSTR("type"), "UTF8String");
  values = xpc_uint64_create(0xFFFFFFFFFFFFFFFFLL);
  v3 = xpc_dictionary_create((const char *const *)&keys, &values, 1uLL);
  _IPServerLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    token = self->_token;
    *(_DWORD *)buf = 134217984;
    v11 = token;
    _os_log_impl(&dword_23F108000, v4, OS_LOG_TYPE_DEFAULT, "beginning handshake for subscriber %llu", buf, 0xCu);
  }

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __55__IPXPCEventStateUpdateStreamSubscriber_beginHandshake__block_invoke;
  v7[3] = &unk_250FA3DE8;
  v7[4] = self;
  objc_msgSend(WeakRetained, "subscriber:firePayload:withReply:", self, v3, v7);

}

void __55__IPXPCEventStateUpdateStreamSubscriber_beginHandshake__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id WeakRetained;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  id v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t v30[128];
  uint8_t buf[16];
  __int128 v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  _IPServerLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (void *)IPXPCCopyDescription((uint64_t)v3);
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)&buf[4] = v5;
    _os_log_impl(&dword_23F108000, v4, OS_LOG_TYPE_DEFAULT, "ping reply! %@", buf, 0xCu);

  }
  *(_OWORD *)buf = 0u;
  v32 = 0u;
  xpc_dictionary_get_audit_token();
  v6 = xpc_copy_entitlement_for_token();
  v7 = (void *)v6;
  if (v6 && MEMORY[0x242665FDC](v6) == MEMORY[0x24BDACF80] && xpc_BOOL_get_value(v7))
  {
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v8 = *(id *)(*(_QWORD *)(a1 + 32) + 8);
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v27;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v27 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * v12);
          WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 32));
          v15 = *(_QWORD *)(a1 + 32);
          objc_msgSend(v13, "XPCDictionaryRepresentation", (_QWORD)v26);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(WeakRetained, "subscriber:firePayload:", v15, v16);

          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      }
      while (v10);
    }

    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 16) = 1;
    v17 = *(_QWORD *)(a1 + 32);
    v18 = *(id *)(v17 + 8);
    *(_QWORD *)(v17 + 8) = 0;
  }
  else
  {
    _IPServerLog();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      __55__IPXPCEventStateUpdateStreamSubscriber_beginHandshake__block_invoke_cold_1(a1, v19, v20, v21, v22, v23, v24, v25);

    v18 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 32));
    objc_msgSend(v18, "subscriberFailedHandshake:", *(_QWORD *)(a1 + 32));
  }

}

- (void)sendOrEnqueueUpdateMessage:(id)a3
{
  id v4;
  void *v5;
  NSMutableArray *queuedMessages;
  id WeakRetained;

  if (self->_completedHandshake)
  {
    v4 = a3;
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v4, "XPCDictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(WeakRetained, "subscriber:firePayload:", self, v5);
  }
  else
  {
    queuedMessages = self->_queuedMessages;
    WeakRetained = a3;
    -[NSMutableArray addObject:](queuedMessages, "addObject:");
  }

}

- (unint64_t)token
{
  return self->_token;
}

- (IPXPCEventStateUpdateStreamSubscriberDelegate)delegate
{
  return (IPXPCEventStateUpdateStreamSubscriberDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_queuedMessages, 0);
}

void __55__IPXPCEventStateUpdateStreamSubscriber_beginHandshake__block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_23F108000, a2, a3, "event subscriber with token %llu is NOT entitled", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

@end
