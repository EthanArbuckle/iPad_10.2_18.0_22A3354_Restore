@implementation C2Multipeer

- (C2Multipeer)initWithChunkDelegate:(id)a3 createListener:(BOOL)a4
{
  _BOOL4 v4;
  id v7;
  C2Multipeer *v8;
  NSObject *v9;
  dispatch_queue_t v10;
  OS_dispatch_queue *queue;
  C2MultipeerDiscovery *v12;
  C2MultipeerDiscovery *listener;
  NSMutableDictionary *v14;
  NSMutableDictionary *clientConnectionByPeer;
  NSMutableDictionary *v16;
  NSMutableDictionary *serverConnectionByPeer;
  NSObject *v18;
  dispatch_queue_t v19;
  OS_dispatch_queue *chunkDelegateQueue;
  NSMutableDictionary *v21;
  NSMutableDictionary *clientContextByRequestUUID;
  NSObject *v23;
  objc_super v25;
  uint8_t buf[4];
  C2Multipeer *v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v4 = a4;
  v30 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v25.receiver = self;
  v25.super_class = (Class)C2Multipeer;
  v8 = -[C2Multipeer init](&v25, sel_init);
  if (v8)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = dispatch_queue_create("c2.multipeer", v9);
    queue = v8->_queue;
    v8->_queue = (OS_dispatch_queue *)v10;

    if (v4)
    {
      v12 = -[C2MultipeerDiscovery initWithParent:]([C2MultipeerDiscovery alloc], "initWithParent:", v8);
      listener = v8->_listener;
      v8->_listener = v12;

    }
    v14 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    clientConnectionByPeer = v8->_clientConnectionByPeer;
    v8->_clientConnectionByPeer = v14;

    v16 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    serverConnectionByPeer = v8->_serverConnectionByPeer;
    v8->_serverConnectionByPeer = v16;

    objc_storeStrong((id *)&v8->_chunkDelegate, a3);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = dispatch_queue_create("c2.multipeer.delegateQueue", v18);
    chunkDelegateQueue = v8->_chunkDelegateQueue;
    v8->_chunkDelegateQueue = (OS_dispatch_queue *)v19;

    v21 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    clientContextByRequestUUID = v8->_clientContextByRequestUUID;
    v8->_clientContextByRequestUUID = v21;

  }
  if (C2_MULTIPEER_LOG_BLOCK_2 != -1)
    dispatch_once(&C2_MULTIPEER_LOG_BLOCK_2, &__block_literal_global_10);
  v23 = C2_MULTIPEER_LOG_INTERNAL_2;
  if (os_log_type_enabled((os_log_t)C2_MULTIPEER_LOG_INTERNAL_2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v27 = v8;
    v28 = 2112;
    v29 = v7;
    _os_log_impl(&dword_1D4DC3000, v23, OS_LOG_TYPE_DEFAULT, "[%@ initWithChunkDelegate:%@]", buf, 0x16u);
  }

  return v8;
}

void __52__C2Multipeer_initWithChunkDelegate_createListener___block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.c2", "multipeer");
  v1 = (void *)C2_MULTIPEER_LOG_INTERNAL_2;
  C2_MULTIPEER_LOG_INTERNAL_2 = (uint64_t)v0;

}

- (C2Multipeer)initWithChunkDelegate:(id)a3
{
  return -[C2Multipeer initWithChunkDelegate:createListener:](self, "initWithChunkDelegate:createListener:", a3, 1);
}

- (void)addClientConnection:(id)a3 peerID:(id)a4
{
  NSMutableDictionary *clientConnectionByPeer;
  id v6;

  clientConnectionByPeer = self->_clientConnectionByPeer;
  v6 = a3;
  -[NSMutableDictionary setObject:forKeyedSubscript:](clientConnectionByPeer, "setObject:forKeyedSubscript:", v6, a4);
  objc_msgSend(v6, "startConnection");

}

- (void)addServerConnection:(id)a3 peerID:(id)a4
{
  NSMutableDictionary *serverConnectionByPeer;
  id v6;

  serverConnectionByPeer = self->_serverConnectionByPeer;
  v6 = a3;
  -[NSMutableDictionary setObject:forKeyedSubscript:](serverConnectionByPeer, "setObject:forKeyedSubscript:", v6, a4);
  objc_msgSend(v6, "startConnection");

}

- (void)discoverChunkSignature:(id)a3 forContainerIdentifier:(id)a4 chunkDataCallback:(id)a5
{
  id v8;
  id v9;
  id v10;
  C2MultipeerClientContext *v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  NSObject *queue;
  id v17;
  C2MultipeerClientContext *v18;
  id v19;
  id v20;
  _QWORD block[5];
  id v22;
  id v23;
  C2MultipeerClientContext *v24;
  id v25;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  C2Multipeer *v28;
  __int16 v29;
  id v30;
  __int16 v31;
  id v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_alloc_init(C2MultipeerClientContext);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  -[C2MultipeerClientContext osActivity](v11, "osActivity");
  v12 = objc_claimAutoreleasedReturnValue();
  os_activity_scope_enter(v12, &state);

  if (C2_MULTIPEER_LOG_BLOCK_2 != -1)
    dispatch_once(&C2_MULTIPEER_LOG_BLOCK_2, &__block_literal_global_8);
  v13 = (void *)C2_MULTIPEER_LOG_INTERNAL_2;
  if (os_log_type_enabled((os_log_t)C2_MULTIPEER_LOG_INTERNAL_2, OS_LOG_TYPE_DEFAULT))
  {
    v14 = v13;
    v15 = _Block_copy(v10);
    *(_DWORD *)buf = 138413058;
    v28 = self;
    v29 = 2112;
    v30 = v8;
    v31 = 2112;
    v32 = v9;
    v33 = 2048;
    v34 = v15;
    _os_log_impl(&dword_1D4DC3000, v14, OS_LOG_TYPE_DEFAULT, "[%@ discoverChunkSignature:%@ forContainerIdentifier:%@ chunkDataCallback:%p]", buf, 0x2Au);

  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __79__C2Multipeer_discoverChunkSignature_forContainerIdentifier_chunkDataCallback___block_invoke_9;
  block[3] = &unk_1E9898EF8;
  block[4] = self;
  v22 = v8;
  v23 = v9;
  v24 = v11;
  v25 = v10;
  v17 = v10;
  v18 = v11;
  v19 = v9;
  v20 = v8;
  dispatch_async(queue, block);

  os_activity_scope_leave(&state);
}

void __79__C2Multipeer_discoverChunkSignature_forContainerIdentifier_chunkDataCallback___block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.c2", "multipeer");
  v1 = (void *)C2_MULTIPEER_LOG_INTERNAL_2;
  C2_MULTIPEER_LOG_INTERNAL_2 = (uint64_t)v0;

}

void __79__C2Multipeer_discoverChunkSignature_forContainerIdentifier_chunkDataCallback___block_invoke_9(uint64_t a1)
{
  _QWORD *v2;
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  void (**v14)(_QWORD, _QWORD, _QWORD);
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void (**v25)(_QWORD, _QWORD, _QWORD);
  NSObject *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id *v34;
  void (**v35)(_QWORD, _QWORD, _QWORD);
  id obj;
  uint64_t v37;
  void *v38;
  C2MultipeerDiscoveryRequest *v39;
  _QWORD v40[5];
  id v41;
  id v42;
  C2MultipeerDiscoveryRequest *v43;
  void *v44;
  id v45;
  id v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  id v51;
  _QWORD v52[5];
  id v53;
  id v54;
  id v55;
  id v56;
  id v57;
  id location;
  uint8_t buf[4];
  void (**v60)(_QWORD, _QWORD, _QWORD);
  __int16 v61;
  uint64_t v62;
  __int16 v63;
  uint64_t v64;
  __int16 v65;
  void *v66;
  __int16 v67;
  C2MultipeerDiscoveryRequest *v68;
  __int16 v69;
  void *v70;
  _BYTE v71[128];
  uint64_t v72;
  const __CFString *v73;
  uint64_t v74;
  _QWORD v75[4];

  v75[1] = *MEMORY[0x1E0C80C00];
  v2 = (_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "touch");
  v39 = objc_alloc_init(C2MultipeerDiscoveryRequest);
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[C2MultipeerDiscoveryRequest setRequestUUID:](v39, "setRequestUUID:", v3);

  -[C2MultipeerDiscoveryRequest setChunkSignature:](v39, "setChunkSignature:", *(_QWORD *)(a1 + 40));
  -[C2MultipeerDiscoveryRequest setContainerIdentifier:](v39, "setContainerIdentifier:", *(_QWORD *)(a1 + 48));
  v4 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  objc_msgSend(*(id *)(a1 + 56), "setDiscoveryPeers:", v4);

  location = 0;
  objc_initWeak(&location, *(id *)(a1 + 56));
  v52[0] = MEMORY[0x1E0C809B0];
  v52[1] = 3221225472;
  v52[2] = __79__C2Multipeer_discoverChunkSignature_forContainerIdentifier_chunkDataCallback___block_invoke_2;
  v52[3] = &unk_1E9898EA8;
  v52[4] = *v2;
  objc_copyWeak(&v57, &location);
  v53 = *(id *)(a1 + 40);
  v54 = *(id *)(a1 + 48);
  v56 = *(id *)(a1 + 64);
  v55 = *(id *)(a1 + 56);
  objc_msgSend(*(id *)(a1 + 56), "setChunkDataCallback:", v52);
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "count"))
  {
    v51 = 0;
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v39, 1, &v51, &v57);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v51;
    v35 = (void (**)(_QWORD, _QWORD, _QWORD))v5;
    if (!v38 || v5)
    {
      if (C2_MULTIPEER_LOG_BLOCK_2 != -1)
        dispatch_once(&C2_MULTIPEER_LOG_BLOCK_2, &__block_literal_global_28_0);
      v29 = C2_MULTIPEER_LOG_INTERNAL_2;
      if (os_log_type_enabled((os_log_t)C2_MULTIPEER_LOG_INTERNAL_2, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v60 = v35;
        _os_log_impl(&dword_1D4DC3000, v29, OS_LOG_TYPE_DEFAULT, "Unable to serialize request with error %@", buf, 0xCu);
      }
      objc_msgSend(*(id *)(a1 + 56), "chunkDataCallback");
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v30)
        goto LABEL_30;
      objc_msgSend(*(id *)(a1 + 56), "chunkDataCallback");
      v25 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v31 = (void *)MEMORY[0x1E0CB35C8];
      v72 = *MEMORY[0x1E0CB2D50];
      v73 = CFSTR("failed to encode request");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v73, &v72, 1);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "errorWithDomain:code:userInfo:", CFSTR("C2MultipeerErrorDomain"), 401, v32);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, _QWORD, void *))v25)[2](v25, 0, v33);

    }
    else
    {
      v6 = *(_QWORD *)(a1 + 56);
      v7 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
      -[C2MultipeerDiscoveryRequest requestUUID](v39, "requestUUID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v6, v8);

      objc_msgSend(*(id *)(a1 + 56), "startTimerOnQueue:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
      objc_msgSend(*(id *)(a1 + 56), "resetTimerForDiscovery");
      v50 = 0u;
      v48 = 0u;
      v49 = 0u;
      v47 = 0u;
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "objectEnumerator");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v47, v71, 16);
      if (v10)
      {
        v37 = *(_QWORD *)v48;
        obj = v9;
        do
        {
          v11 = 0;
          do
          {
            if (*(_QWORD *)v48 != v37)
              objc_enumerationMutation(obj);
            v12 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * v11);
            if (C2_MULTIPEER_LOG_BLOCK_2 != -1)
              dispatch_once(&C2_MULTIPEER_LOG_BLOCK_2, &__block_literal_global_32_1);
            v13 = (id)C2_MULTIPEER_LOG_INTERNAL_2;
            if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
            {
              v14 = *(void (***)(_QWORD, _QWORD, _QWORD))(a1 + 32);
              v15 = *(_QWORD *)(a1 + 40);
              v16 = *(_QWORD *)(a1 + 48);
              v17 = _Block_copy(*(const void **)(a1 + 64));
              objc_msgSend(v12, "peerID");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138413570;
              v60 = v14;
              v61 = 2112;
              v62 = v15;
              v63 = 2112;
              v64 = v16;
              v65 = 2048;
              v66 = v17;
              v67 = 2112;
              v68 = v39;
              v69 = 2112;
              v70 = v18;
              _os_log_impl(&dword_1D4DC3000, v13, OS_LOG_TYPE_DEFAULT, "[%@ discoverChunkSignature:%@ forContainerIdentifier:%@ chunkDataCallback:%p] - Sending %@ to peer %@", buf, 0x3Eu);

            }
            objc_msgSend(*(id *)(a1 + 56), "discoveryPeers");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "peerID");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "addObject:", v20);

            objc_msgSend(v12, "oustandingDiscoveryRequestsByRequestUUID");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            -[C2MultipeerDiscoveryRequest requestUUID](v39, "requestUUID");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "addObject:", v22);

            v40[0] = MEMORY[0x1E0C809B0];
            v40[1] = 3221225472;
            v40[2] = __79__C2Multipeer_discoverChunkSignature_forContainerIdentifier_chunkDataCallback___block_invoke_33;
            v40[3] = &unk_1E9898ED0;
            v23 = *(void **)(a1 + 40);
            v40[4] = *(_QWORD *)(a1 + 32);
            v41 = v23;
            v42 = *(id *)(a1 + 48);
            v46 = *(id *)(a1 + 64);
            v43 = v39;
            v44 = v12;
            v45 = *(id *)(a1 + 56);
            objc_msgSend(v12, "sendMessageWithData:completionHandler:", v38, v40);

            ++v11;
          }
          while (v10 != v11);
          v9 = obj;
          v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v71, 16);
        }
        while (v10);
      }

      if (!objc_msgSend(*(id *)(a1 + 56), "hadFailedToDiscover"))
        goto LABEL_30;
      v24 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
      -[C2MultipeerDiscoveryRequest requestUUID](v39, "requestUUID");
      v25 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setObject:forKeyedSubscript:", 0, v25);
    }
LABEL_29:

LABEL_30:
    goto LABEL_31;
  }
  if (C2_MULTIPEER_LOG_BLOCK_2 != -1)
    dispatch_once(&C2_MULTIPEER_LOG_BLOCK_2, &__block_literal_global_21_0);
  v26 = C2_MULTIPEER_LOG_INTERNAL_2;
  if (os_log_type_enabled((os_log_t)C2_MULTIPEER_LOG_INTERNAL_2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D4DC3000, v26, OS_LOG_TYPE_DEFAULT, "No peers to ask for chunks.", buf, 2u);
  }
  objc_msgSend(*(id *)(a1 + 56), "chunkDataCallback", &v57);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (v27)
  {
    objc_msgSend(*(id *)(a1 + 56), "chunkDataCallback");
    v35 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v28 = (void *)MEMORY[0x1E0CB35C8];
    v74 = *MEMORY[0x1E0CB2D50];
    v75[0] = CFSTR("no peers to ask for chunks");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v75, &v74, 1);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "errorWithDomain:code:userInfo:", CFSTR("C2MultipeerErrorDomain"), 100, v38);
    v25 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v35[2](v35, 0, v25);
    goto LABEL_29;
  }
LABEL_31:

  objc_destroyWeak(v34);
  objc_destroyWeak(&location);

}

void __79__C2Multipeer_discoverChunkSignature_forContainerIdentifier_chunkDataCallback___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const void *v21;
  NSObject *v22;
  void *v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  NSObject *v30;
  _QWORD block[4];
  id v32;
  id v33;
  id v34;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  uint64_t v37;
  __int16 v38;
  uint64_t v39;
  __int16 v40;
  uint64_t v41;
  __int16 v42;
  void *v43;
  __int16 v44;
  id v45;
  __int16 v46;
  id v47;
  __int16 v48;
  uint64_t v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(*(_QWORD *)(a1 + 32) + 8));
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  v8 = WeakRetained;
  if (WeakRetained)
  {
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    objc_msgSend(WeakRetained, "osActivity");
    v9 = objc_claimAutoreleasedReturnValue();
    os_activity_scope_enter(v9, &state);

    if (objc_msgSend(v8, "hasReplied"))
    {
      if (C2_MULTIPEER_LOG_BLOCK_2 != -1)
        dispatch_once(&C2_MULTIPEER_LOG_BLOCK_2, &__block_literal_global_15_2);
      v10 = (void *)C2_MULTIPEER_LOG_INTERNAL_2;
      if (os_log_type_enabled((os_log_t)C2_MULTIPEER_LOG_INTERNAL_2, OS_LOG_TYPE_DEBUG))
      {
        v12 = *(_QWORD *)(a1 + 32);
        v11 = *(_QWORD *)(a1 + 40);
        v13 = *(_QWORD *)(a1 + 48);
        v14 = *(const void **)(a1 + 64);
        v15 = v10;
        v16 = _Block_copy(v14);
        *(_DWORD *)buf = 138413570;
        v37 = v12;
        v38 = 2112;
        v39 = v11;
        v40 = 2112;
        v41 = v13;
        v42 = 2048;
        v43 = v16;
        v44 = 2112;
        v45 = v5;
        v46 = 2112;
        v47 = v6;
        _os_log_impl(&dword_1D4DC3000, v15, OS_LOG_TYPE_DEBUG, "[%@ discoverChunkSignature:%@ forContainerIdentifier:%@ chunkDataCallback:%p] - already replied to chunkDataCallback, ignoring chunkData(%@), error(%@)", buf, 0x3Eu);

      }
    }
    else
    {
      if (C2_MULTIPEER_LOG_BLOCK_2 != -1)
        dispatch_once(&C2_MULTIPEER_LOG_BLOCK_2, &__block_literal_global_17_0);
      v24 = (id)C2_MULTIPEER_LOG_INTERNAL_2;
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        v26 = *(_QWORD *)(a1 + 32);
        v25 = *(_QWORD *)(a1 + 40);
        v27 = *(_QWORD *)(a1 + 48);
        v28 = _Block_copy(*(const void **)(a1 + 64));
        mach_continuous_time();
        objc_msgSend(*(id *)(a1 + 56), "startTimestamp");
        TMConvertTicksToSeconds();
        *(_DWORD *)buf = 138413826;
        v37 = v26;
        v38 = 2112;
        v39 = v25;
        v40 = 2112;
        v41 = v27;
        v42 = 2048;
        v43 = v28;
        v44 = 2112;
        v45 = v5;
        v46 = 2112;
        v47 = v6;
        v48 = 2048;
        v49 = v29;
        _os_log_impl(&dword_1D4DC3000, v24, OS_LOG_TYPE_DEFAULT, "[%@ discoverChunkSignature:%@ forContainerIdentifier:%@ chunkDataCallback:%p] - chunkDataCallback(%@, %@) after %.3f seconds", buf, 0x48u);

      }
      objc_msgSend(v8, "setHasReplied:", 1);
      objc_msgSend(v8, "stopTimer");
      dispatch_get_global_queue(21, 0);
      v30 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __79__C2Multipeer_discoverChunkSignature_forContainerIdentifier_chunkDataCallback___block_invoke_18;
      block[3] = &unk_1E9898C10;
      v34 = *(id *)(a1 + 64);
      v32 = v5;
      v33 = v6;
      dispatch_async(v30, block);

    }
    os_activity_scope_leave(&state);
  }
  else
  {
    if (C2_MULTIPEER_LOG_BLOCK_2 != -1)
      dispatch_once(&C2_MULTIPEER_LOG_BLOCK_2, &__block_literal_global_13);
    v17 = (void *)C2_MULTIPEER_LOG_INTERNAL_2;
    if (os_log_type_enabled((os_log_t)C2_MULTIPEER_LOG_INTERNAL_2, OS_LOG_TYPE_ERROR))
    {
      v18 = *(_QWORD *)(a1 + 32);
      v19 = *(_QWORD *)(a1 + 40);
      v20 = *(_QWORD *)(a1 + 48);
      v21 = *(const void **)(a1 + 64);
      v22 = v17;
      v23 = _Block_copy(v21);
      *(_DWORD *)buf = 138413570;
      v37 = v18;
      v38 = 2112;
      v39 = v19;
      v40 = 2112;
      v41 = v20;
      v42 = 2048;
      v43 = v23;
      v44 = 2112;
      v45 = v5;
      v46 = 2112;
      v47 = v6;
      _os_log_impl(&dword_1D4DC3000, v22, OS_LOG_TYPE_ERROR, "[%@ discoverChunkSignature:%@ forContainerIdentifier:%@ chunkDataCallback:%p] - blockSafeClientContext unexpctedly nil, ignoring chunkData(%@), error(%@)", buf, 0x3Eu);

    }
  }

}

void __79__C2Multipeer_discoverChunkSignature_forContainerIdentifier_chunkDataCallback___block_invoke_3()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.c2", "multipeer");
  v1 = (void *)C2_MULTIPEER_LOG_INTERNAL_2;
  C2_MULTIPEER_LOG_INTERNAL_2 = (uint64_t)v0;

}

void __79__C2Multipeer_discoverChunkSignature_forContainerIdentifier_chunkDataCallback___block_invoke_14()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.c2", "multipeer");
  v1 = (void *)C2_MULTIPEER_LOG_INTERNAL_2;
  C2_MULTIPEER_LOG_INTERNAL_2 = (uint64_t)v0;

}

void __79__C2Multipeer_discoverChunkSignature_forContainerIdentifier_chunkDataCallback___block_invoke_16()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.c2", "multipeer");
  v1 = (void *)C2_MULTIPEER_LOG_INTERNAL_2;
  C2_MULTIPEER_LOG_INTERNAL_2 = (uint64_t)v0;

}

uint64_t __79__C2Multipeer_discoverChunkSignature_forContainerIdentifier_chunkDataCallback___block_invoke_18(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __79__C2Multipeer_discoverChunkSignature_forContainerIdentifier_chunkDataCallback___block_invoke_2_20()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.c2", "multipeer");
  v1 = (void *)C2_MULTIPEER_LOG_INTERNAL_2;
  C2_MULTIPEER_LOG_INTERNAL_2 = (uint64_t)v0;

}

void __79__C2Multipeer_discoverChunkSignature_forContainerIdentifier_chunkDataCallback___block_invoke_27()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.c2", "multipeer");
  v1 = (void *)C2_MULTIPEER_LOG_INTERNAL_2;
  C2_MULTIPEER_LOG_INTERNAL_2 = (uint64_t)v0;

}

void __79__C2Multipeer_discoverChunkSignature_forContainerIdentifier_chunkDataCallback___block_invoke_31()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.c2", "multipeer");
  v1 = (void *)C2_MULTIPEER_LOG_INTERNAL_2;
  C2_MULTIPEER_LOG_INTERNAL_2 = (uint64_t)v0;

}

void __79__C2Multipeer_discoverChunkSignature_forContainerIdentifier_chunkDataCallback___block_invoke_33(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const void *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  uint64_t v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    if (C2_MULTIPEER_LOG_BLOCK_2 != -1)
      dispatch_once(&C2_MULTIPEER_LOG_BLOCK_2, &__block_literal_global_35);
    v4 = (void *)C2_MULTIPEER_LOG_INTERNAL_2;
    if (os_log_type_enabled((os_log_t)C2_MULTIPEER_LOG_INTERNAL_2, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v6 = *(_QWORD *)(a1 + 40);
      v7 = *(_QWORD *)(a1 + 48);
      v8 = *(const void **)(a1 + 80);
      v9 = v4;
      v10 = _Block_copy(v8);
      v11 = *(_QWORD *)(a1 + 56);
      objc_msgSend(*(id *)(a1 + 64), "peerID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138413826;
      v20 = v5;
      v21 = 2112;
      v22 = v6;
      v23 = 2112;
      v24 = v7;
      v25 = 2048;
      v26 = v10;
      v27 = 2112;
      v28 = v11;
      v29 = 2112;
      v30 = v12;
      v31 = 2112;
      v32 = v3;
      _os_log_impl(&dword_1D4DC3000, v9, OS_LOG_TYPE_DEFAULT, "[%@ discoverChunkSignature:%@ forContainerIdentifier:%@ chunkDataCallback:%p] - Sending %@ to peer %@ encountered error %@", (uint8_t *)&v19, 0x48u);

    }
    objc_msgSend(*(id *)(a1 + 72), "discoveryPeers");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 64), "peerID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "removeObject:", v14);

    objc_msgSend(*(id *)(a1 + 64), "oustandingDiscoveryRequestsByRequestUUID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 56), "requestUUID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "removeObject:", v16);

    if (objc_msgSend(*(id *)(a1 + 72), "hadFailedToDiscover"))
    {
      v17 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
      objc_msgSend(*(id *)(a1 + 56), "requestUUID");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setObject:forKeyedSubscript:", 0, v18);

    }
  }

}

void __79__C2Multipeer_discoverChunkSignature_forContainerIdentifier_chunkDataCallback___block_invoke_2_34()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.c2", "multipeer");
  v1 = (void *)C2_MULTIPEER_LOG_INTERNAL_2;
  C2_MULTIPEER_LOG_INTERNAL_2 = (uint64_t)v0;

}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (C2MultipeerDiscovery)listener
{
  return self->_listener;
}

- (void)setListener:(id)a3
{
  objc_storeStrong((id *)&self->_listener, a3);
}

- (NSMutableDictionary)clientConnectionByPeer
{
  return self->_clientConnectionByPeer;
}

- (void)setClientConnectionByPeer:(id)a3
{
  objc_storeStrong((id *)&self->_clientConnectionByPeer, a3);
}

- (NSMutableDictionary)serverConnectionByPeer
{
  return self->_serverConnectionByPeer;
}

- (void)setServerConnectionByPeer:(id)a3
{
  objc_storeStrong((id *)&self->_serverConnectionByPeer, a3);
}

- (NSMutableDictionary)clientContextByRequestUUID
{
  return self->_clientContextByRequestUUID;
}

- (void)setClientContextByRequestUUID:(id)a3
{
  objc_storeStrong((id *)&self->_clientContextByRequestUUID, a3);
}

- (C2MultipeerChunkDelegate)chunkDelegate
{
  return self->_chunkDelegate;
}

- (void)setChunkDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_chunkDelegate, a3);
}

- (OS_dispatch_queue)chunkDelegateQueue
{
  return self->_chunkDelegateQueue;
}

- (void)setChunkDelegateQueue:(id)a3
{
  objc_storeStrong((id *)&self->_chunkDelegateQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_chunkDelegateQueue, 0);
  objc_storeStrong((id *)&self->_chunkDelegate, 0);
  objc_storeStrong((id *)&self->_clientContextByRequestUUID, 0);
  objc_storeStrong((id *)&self->_serverConnectionByPeer, 0);
  objc_storeStrong((id *)&self->_clientConnectionByPeer, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
