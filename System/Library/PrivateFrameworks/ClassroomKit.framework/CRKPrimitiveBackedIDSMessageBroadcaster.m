@implementation CRKPrimitiveBackedIDSMessageBroadcaster

- (CRKPrimitiveBackedIDSMessageBroadcaster)initWithIDSPrimitives:(id)a3
{
  id v5;
  CRKPrimitiveBackedIDSMessageBroadcaster *v6;
  CRKPrimitiveBackedIDSMessageBroadcaster *v7;
  uint64_t v8;
  NSHashTable *broadcastHandlers;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CRKPrimitiveBackedIDSMessageBroadcaster;
  v6 = -[CRKPrimitiveBackedIDSMessageBroadcaster init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_IDSPrimitives, a3);
    objc_msgSend(MEMORY[0x24BDD15C0], "weakObjectsHashTable");
    v8 = objc_claimAutoreleasedReturnValue();
    broadcastHandlers = v7->_broadcastHandlers;
    v7->_broadcastHandlers = (NSHashTable *)v8;

  }
  return v7;
}

+ (id)broadcasterWithIDSPrimitives:(id)a3
{
  id v4;
  void *v5;
  _QWORD v7[5];

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithIDSPrimitives:", v4);

  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __72__CRKPrimitiveBackedIDSMessageBroadcaster_broadcasterWithIDSPrimitives___block_invoke;
  v7[3] = &__block_descriptor_40_e17_v16__0__NSError_8l;
  v7[4] = a1;
  objc_msgSend(v5, "beginListeningForMessagesWithCompletion:", v7);
  return v5;
}

void __72__CRKPrimitiveBackedIDSMessageBroadcaster_broadcasterWithIDSPrimitives___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  if (v3)
  {
    _CRKLogASM_15();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __72__CRKPrimitiveBackedIDSMessageBroadcaster_broadcasterWithIDSPrimitives___block_invoke_cold_1(a1, v3);

  }
}

- (void)addBroadcastHandler:(id)a3
{
  id v4;
  NSObject *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  CRKPrimitiveBackedIDSMessageBroadcaster *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  _CRKLogASM_15();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543874;
    v10 = v7;
    v11 = 2048;
    v12 = self;
    v13 = 2114;
    v14 = v4;
    _os_log_impl(&dword_218C99000, v5, OS_LOG_TYPE_INFO, "%{public}@ - %p: Adding broadcast handler (%{public}@)", (uint8_t *)&v9, 0x20u);

  }
  -[CRKPrimitiveBackedIDSMessageBroadcaster broadcastHandlers](self, "broadcastHandlers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObject:", v4);

}

- (void)beginListeningForMessagesWithCompletion:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  -[CRKPrimitiveBackedIDSMessageBroadcaster IDSPrimitives](self, "IDSPrimitives");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x24BDAC760];
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __83__CRKPrimitiveBackedIDSMessageBroadcaster_beginListeningForMessagesWithCompletion___block_invoke;
  v11[3] = &unk_24D9C9A88;
  objc_copyWeak(&v12, &location);
  v8[0] = v6;
  v8[1] = 3221225472;
  v8[2] = __83__CRKPrimitiveBackedIDSMessageBroadcaster_beginListeningForMessagesWithCompletion___block_invoke_2;
  v8[3] = &unk_24D9C9AB0;
  objc_copyWeak(&v10, &location);
  v7 = v4;
  v9 = v7;
  objc_msgSend(v5, "subscribeToMessagesWithHandler:completion:", v11, v8);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

}

void __83__CRKPrimitiveBackedIDSMessageBroadcaster_beginListeningForMessagesWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id *v6;
  id v7;
  id v8;
  id v9;
  id WeakRetained;

  v6 = (id *)(a1 + 32);
  v7 = a4;
  v8 = a3;
  v9 = a2;
  WeakRetained = objc_loadWeakRetained(v6);
  objc_msgSend(WeakRetained, "broadcastMessage:senderAppleID:senderAddress:", v9, v8, v7);

}

void __83__CRKPrimitiveBackedIDSMessageBroadcaster_beginListeningForMessagesWithCompletion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  NSObject *v8;
  NSObject *v9;
  void (*v10)(void);
  uint64_t v11;
  void *v12;
  objc_class *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    _CRKLogASM_15();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v6)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        __83__CRKPrimitiveBackedIDSMessageBroadcaster_beginListeningForMessagesWithCompletion___block_invoke_2_cold_1((uint64_t)WeakRetained, v6);

      v10 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
    }
    else
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        v13 = (objc_class *)objc_opt_class();
        NSStringFromClass(v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = 138543618;
        v16 = v14;
        v17 = 2048;
        v18 = WeakRetained;
        _os_log_impl(&dword_218C99000, v9, OS_LOG_TYPE_INFO, "%{public}@ - %p: Established IDS message listener", (uint8_t *)&v15, 0x16u);

      }
      objc_msgSend(WeakRetained, "setMessageSubscription:", v5);
      v10 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
    }
    v10();
  }
  else
  {
    v11 = *(_QWORD *)(a1 + 32);
    CRKErrorWithCodeAndUserInfo(2, &unk_24DA07C88);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v11 + 16))(v11, v12);

  }
}

- (void)broadcastMessage:(id)a3 senderAppleID:(id)a4 senderAddress:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  objc_class *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t v23[128];
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  CRKPrimitiveBackedIDSMessageBroadcaster *v27;
  __int16 v28;
  id v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  _CRKLogASM_15();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v25 = v13;
    v26 = 2048;
    v27 = self;
    v28 = 2114;
    v29 = v8;
    v30 = 2114;
    v31 = v9;
    _os_log_impl(&dword_218C99000, v11, OS_LOG_TYPE_INFO, "%{public}@ - %p: Broadcasting IDS message. message=%{public}@, sender=%{public}@", buf, 0x2Au);

  }
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[CRKPrimitiveBackedIDSMessageBroadcaster broadcastHandlers](self, "broadcastHandlers", 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v20;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v20 != v17)
          objc_enumerationMutation(v14);
        objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v18++), "processMessage:senderAppleID:senderAddress:", v8, v9, v10);
      }
      while (v16 != v18);
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v16);
  }

}

- (CRKIDSPrimitives)IDSPrimitives
{
  return self->_IDSPrimitives;
}

- (NSHashTable)broadcastHandlers
{
  return self->_broadcastHandlers;
}

- (CRKCancelable)messageSubscription
{
  return self->_messageSubscription;
}

- (void)setMessageSubscription:(id)a3
{
  objc_storeStrong((id *)&self->_messageSubscription, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageSubscription, 0);
  objc_storeStrong((id *)&self->_broadcastHandlers, 0);
  objc_storeStrong((id *)&self->_IDSPrimitives, 0);
}

void __72__CRKPrimitiveBackedIDSMessageBroadcaster_broadcasterWithIDSPrimitives___block_invoke_cold_1(uint64_t a1, void *a2)
{
  objc_class *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "verboseDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_218C99000, v6, v7, "%{public}@ - %p: Failed to create message broadcaster. Error: %{public}@", v8, v9, v10, v11, v12);

  OUTLINED_FUNCTION_2();
}

void __83__CRKPrimitiveBackedIDSMessageBroadcaster_beginListeningForMessagesWithCompletion___block_invoke_2_cold_1(uint64_t a1, void *a2)
{
  objc_class *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "verboseDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_218C99000, v6, v7, "%{public}@ - %p: Failed to begin listening for IDS messages. Error = %{public}@", v8, v9, v10, v11, v12);

  OUTLINED_FUNCTION_2();
}

@end
