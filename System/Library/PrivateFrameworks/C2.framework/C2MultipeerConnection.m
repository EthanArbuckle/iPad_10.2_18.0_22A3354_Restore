@implementation C2MultipeerConnection

- (C2MultipeerConnection)initWithParent:(id)a3 queue:(id)a4 peerID:(id)a5 isClientConnection:(BOOL)a6
{
  id v10;
  id v11;
  id v12;
  C2MultipeerConnection *v13;
  C2MultipeerConnection *v14;
  uint64_t v15;
  NSMutableSet *oustandingDiscoveryRequestsByRequestUUID;
  uint64_t v17;
  NSMutableDictionary *serverContextByRequestUUID;
  objc_super v20;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v20.receiver = self;
  v20.super_class = (Class)C2MultipeerConnection;
  v13 = -[C2MultipeerConnection init](&v20, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeWeak((id *)&v13->_parent, v10);
    objc_storeStrong((id *)&v14->_queue, a4);
    objc_storeStrong((id *)&v14->_peerID, a5);
    v15 = objc_opt_new();
    oustandingDiscoveryRequestsByRequestUUID = v14->_oustandingDiscoveryRequestsByRequestUUID;
    v14->_oustandingDiscoveryRequestsByRequestUUID = (NSMutableSet *)v15;

    v17 = objc_opt_new();
    serverContextByRequestUUID = v14->_serverContextByRequestUUID;
    v14->_serverContextByRequestUUID = (NSMutableDictionary *)v17;

    v14->_isClientConnection = a6;
  }

  return v14;
}

- (void)stopConnection
{
  NSMutableSet *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  BOOL v16;
  void *v17;
  void *v18;
  void *v19;
  uint8_t v20[16];
  os_activity_scope_state_s state;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v3 = self->_oustandingDiscoveryRequestsByRequestUUID;
  v4 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v23;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v23 != v5)
          objc_enumerationMutation(v3);
        v7 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v6);
        -[C2MultipeerConnection parent](self, "parent");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "clientContextByRequestUUID");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectForKeyedSubscript:", v7);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        state.opaque[0] = 0;
        state.opaque[1] = 0;
        objc_msgSend(v10, "osActivity");
        v11 = objc_claimAutoreleasedReturnValue();
        os_activity_scope_enter(v11, &state);

        if (C2_MULTIPEER_LOG_BLOCK_0 != -1)
          dispatch_once(&C2_MULTIPEER_LOG_BLOCK_0, &__block_literal_global_2);
        v12 = C2_MULTIPEER_LOG_INTERNAL_0;
        if (os_log_type_enabled((os_log_t)C2_MULTIPEER_LOG_INTERNAL_0, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v20 = 0;
          _os_log_impl(&dword_1D4DC3000, v12, OS_LOG_TYPE_DEFAULT, "_stopConnection", v20, 2u);
        }
        objc_msgSend(v10, "discoveryPeers");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "removeObject:", self->_peerID);

        if (objc_msgSend(v10, "hadFailedToDiscover"))
        {
          -[C2MultipeerConnection parent](self, "parent");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "clientContextByRequestUUID");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "setObject:forKeyedSubscript:", 0, v7);

        }
        os_activity_scope_leave(&state);

        ++v6;
      }
      while (v4 != v6);
      v4 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v4);
  }

  -[NSMutableSet removeAllObjects](self->_oustandingDiscoveryRequestsByRequestUUID, "removeAllObjects");
  v16 = !self->_isClientConnection;
  -[C2MultipeerConnection parent](self, "parent");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v16)
    objc_msgSend(v17, "serverConnectionByPeer");
  else
    objc_msgSend(v17, "clientConnectionByPeer");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setObject:forKeyedSubscript:", 0, self->_peerID);

}

void __39__C2MultipeerConnection_stopConnection__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.c2", "multipeer");
  v1 = (void *)C2_MULTIPEER_LOG_INTERNAL_0;
  C2_MULTIPEER_LOG_INTERNAL_0 = (uint64_t)v0;

}

- (void)sendMessageWithData:(id)a3 completionHandler:(id)a4
{
  NSObject *v6;
  id v7;

  -[C2MultipeerConnection queue](self, "queue", a3, a4);
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("C2MultipeerConnection.m"), 49, CFSTR("Subclass Implementation Required."));

}

- (void)handleDiscoveryRequest:(id)a3
{
  id v4;
  C2MultipeerServerContext *v5;
  NSObject *v6;
  C2MultipeerDiscoveryResponse *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  C2MultipeerDiscoveryResponse *v13;
  C2MultipeerServerContext *v14;
  id v15;
  _QWORD v16[5];
  id v17;
  C2MultipeerServerContext *v18;
  C2MultipeerDiscoveryResponse *v19;
  os_activity_scope_state_s state;

  v4 = a3;
  v5 = objc_alloc_init(C2MultipeerServerContext);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  -[C2MultipeerServerContext osActivity](v5, "osActivity");
  v6 = objc_claimAutoreleasedReturnValue();
  os_activity_scope_enter(v6, &state);

  v7 = objc_alloc_init(C2MultipeerDiscoveryResponse);
  objc_msgSend(v4, "requestUUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[C2MultipeerDiscoveryResponse setRequestUUID:](v7, "setRequestUUID:", v8);

  objc_msgSend(v4, "chunkSignature");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[C2MultipeerDiscoveryResponse setChunkSignature:](v7, "setChunkSignature:", v9);

  -[C2MultipeerConnection queue](self, "queue");
  v10 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v10);

  -[C2MultipeerConnection parent](self, "parent");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "chunkDelegateQueue");
  v12 = objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __48__C2MultipeerConnection_handleDiscoveryRequest___block_invoke;
  v16[3] = &unk_1E98987D0;
  v16[4] = self;
  v17 = v4;
  v18 = v5;
  v19 = v7;
  v13 = v7;
  v14 = v5;
  v15 = v4;
  dispatch_async(v12, v16);

  os_activity_scope_leave(&state);
}

void __48__C2MultipeerConnection_handleDiscoveryRequest___block_invoke(id *a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  id v8;
  id v9;
  _QWORD block[4];
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;

  objc_msgSend(a1[4], "parent");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "chunkDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[5], "chunkSignature");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[5], "containerIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "chunkDataFromSignature:forContainerIdentifier:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1[4], "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__C2MultipeerConnection_handleDiscoveryRequest___block_invoke_2;
  block[3] = &unk_1E98987A8;
  v11 = a1[6];
  v12 = v6;
  v8 = a1[5];
  v13 = a1[4];
  v14 = v8;
  v15 = a1[7];
  v9 = v6;
  dispatch_async(v7, block);

}

void __48__C2MultipeerConnection_handleDiscoveryRequest___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  uint64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "setChunkData:", *(_QWORD *)(a1 + 40));
  if (C2_MULTIPEER_LOG_BLOCK_0 != -1)
    dispatch_once(&C2_MULTIPEER_LOG_BLOCK_0, &__block_literal_global_12);
  v2 = (void *)C2_MULTIPEER_LOG_INTERNAL_0;
  if (os_log_type_enabled((os_log_t)C2_MULTIPEER_LOG_INTERNAL_0, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(void **)(a1 + 48);
    v4 = v2;
    objc_msgSend(v3, "parent");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "parent");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "chunkDelegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 56), "chunkSignature");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 56), "containerIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138413314;
    v25 = v5;
    v26 = 2112;
    v27 = v7;
    v28 = 2112;
    v29 = v8;
    v30 = 2112;
    v31 = v9;
    v32 = 2112;
    v33 = v10;
    _os_log_impl(&dword_1D4DC3000, v4, OS_LOG_TYPE_DEFAULT, "[[%@ %@] chunkDataFromSignature:%@ forContainerIdentifier:%@] - returned %@", buf, 0x34u);

  }
  objc_msgSend(*(id *)(a1 + 64), "setChunkAvailable:", *(_QWORD *)(a1 + 40) != 0);
  v11 = *(_QWORD *)(a1 + 64);
  v23 = 0;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v11, 1, &v23);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v23;
  v14 = v13;
  if (!v12 || v13)
  {
    if (C2_MULTIPEER_LOG_BLOCK_0 != -1)
      dispatch_once(&C2_MULTIPEER_LOG_BLOCK_0, &__block_literal_global_15);
    v19 = C2_MULTIPEER_LOG_INTERNAL_0;
    if (os_log_type_enabled((os_log_t)C2_MULTIPEER_LOG_INTERNAL_0, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v25 = v14;
      _os_log_impl(&dword_1D4DC3000, v19, OS_LOG_TYPE_DEFAULT, "Unable to serialize request with error %@", buf, 0xCu);
    }
  }
  else
  {
    v15 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 48), "serverContextByRequestUUID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 56), "requestUUID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v15, v17);

    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __48__C2MultipeerConnection_handleDiscoveryRequest___block_invoke_16;
    v20[3] = &unk_1E9898780;
    v18 = *(void **)(a1 + 56);
    v21 = *(id *)(a1 + 48);
    v22 = v18;
    objc_msgSend(v21, "sendMessageWithData:completionHandler:", v12, v20);

  }
}

void __48__C2MultipeerConnection_handleDiscoveryRequest___block_invoke_3()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.c2", "multipeer");
  v1 = (void *)C2_MULTIPEER_LOG_INTERNAL_0;
  C2_MULTIPEER_LOG_INTERNAL_0 = (uint64_t)v0;

}

void __48__C2MultipeerConnection_handleDiscoveryRequest___block_invoke_14()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.c2", "multipeer");
  v1 = (void *)C2_MULTIPEER_LOG_INTERNAL_0;
  C2_MULTIPEER_LOG_INTERNAL_0 = (uint64_t)v0;

}

void __48__C2MultipeerConnection_handleDiscoveryRequest___block_invoke_16(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    if (C2_MULTIPEER_LOG_BLOCK_0 != -1)
      dispatch_once(&C2_MULTIPEER_LOG_BLOCK_0, &__block_literal_global_18);
    v4 = C2_MULTIPEER_LOG_INTERNAL_0;
    if (os_log_type_enabled((os_log_t)C2_MULTIPEER_LOG_INTERNAL_0, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 138412290;
      v8 = v3;
      _os_log_impl(&dword_1D4DC3000, v4, OS_LOG_TYPE_DEFAULT, "Unable to send response with error %@", (uint8_t *)&v7, 0xCu);
    }
    objc_msgSend(*(id *)(a1 + 32), "serverContextByRequestUUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "requestUUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", 0, v6);

  }
}

void __48__C2MultipeerConnection_handleDiscoveryRequest___block_invoke_2_17()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.c2", "multipeer");
  v1 = (void *)C2_MULTIPEER_LOG_INTERNAL_0;
  C2_MULTIPEER_LOG_INTERNAL_0 = (uint64_t)v0;

}

- (void)handleData:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  C2MultipeerConnection *v11;
  NSObject *v12;
  NSObject *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  NSObject *v19;
  uint64_t v20;
  C2MultipeerChunkDataRequest *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  C2MultipeerConnection *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  _BOOL4 v33;
  uint64_t v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  NSObject *v39;
  NSObject *v40;
  C2MultipeerChunkDataResponse *v41;
  void *v42;
  void *v43;
  void *v44;
  C2MultipeerConnection *v45;
  id v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  NSObject *v51;
  NSObject *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void (**v57)(_QWORD, _QWORD, _QWORD);
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  C2MultipeerConnection *v62;
  void *v63;
  NSObject *v64;
  C2MultipeerConnection *v65;
  void *v66;
  NSObject *v67;
  NSObject *v68;
  void *v69;
  void *v70;
  void *v71;
  NSObject *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  id v77;
  _QWORD v78[4];
  id v79;
  C2MultipeerConnection *v80;
  id v81;
  id v82;
  os_activity_scope_state_s state;
  id v84;
  uint64_t v85;
  const __CFString *v86;
  uint8_t buf[4];
  C2MultipeerConnection *v88;
  __int16 v89;
  id v90;
  __int16 v91;
  uint64_t v92;
  __int16 v93;
  C2MultipeerConnection *v94;
  __int16 v95;
  uint64_t v96;
  _QWORD v97[7];

  v97[4] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[C2MultipeerConnection queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v6 = (void *)MEMORY[0x1E0CB3710];
  v7 = (void *)MEMORY[0x1E0C99E60];
  v97[0] = objc_opt_class();
  v97[1] = objc_opt_class();
  v97[2] = objc_opt_class();
  v97[3] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v97, 4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWithArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v84 = 0;
  objc_msgSend(v6, "unarchivedObjectOfClasses:fromData:error:", v9, v4, &v84);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (C2MultipeerConnection *)v84;

  if (!v10 || v11)
  {
    if (C2_MULTIPEER_LOG_BLOCK_0 != -1)
      dispatch_once(&C2_MULTIPEER_LOG_BLOCK_0, &__block_literal_global_26);
    v13 = C2_MULTIPEER_LOG_INTERNAL_0;
    if (os_log_type_enabled((os_log_t)C2_MULTIPEER_LOG_INTERNAL_0, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138413058;
      v88 = self;
      v89 = 2112;
      v90 = v4;
      v91 = 2112;
      v92 = (uint64_t)v10;
      v93 = 2112;
      v94 = v11;
      _os_log_impl(&dword_1D4DC3000, v13, OS_LOG_TYPE_DEFAULT, "[%@ handleData:%@] - Ignoring response %@ due to error %@", buf, 0x2Au);
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (C2_MULTIPEER_LOG_BLOCK_0 != -1)
        dispatch_once(&C2_MULTIPEER_LOG_BLOCK_0, &__block_literal_global_28);
      v12 = C2_MULTIPEER_LOG_INTERNAL_0;
      if (os_log_type_enabled((os_log_t)C2_MULTIPEER_LOG_INTERNAL_0, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138413058;
        v88 = self;
        v89 = 2112;
        v90 = v4;
        v91 = 2112;
        v92 = (uint64_t)v10;
        v93 = 2112;
        v94 = 0;
        _os_log_impl(&dword_1D4DC3000, v12, OS_LOG_TYPE_DEFAULT, "[%@ handleData:%@] - received message %@ with error %@", buf, 0x2Au);
      }
      -[C2MultipeerConnection handleDiscoveryRequest:](self, "handleDiscoveryRequest:", v10);
LABEL_9:
      v11 = 0;
      goto LABEL_73;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v14 = v10;
      -[C2MultipeerConnection parent](self, "parent");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "clientContextByRequestUUID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "requestUUID");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "objectForKeyedSubscript:", v17);
      v76 = (void *)objc_claimAutoreleasedReturnValue();

      state.opaque[0] = 0;
      state.opaque[1] = 0;
      objc_msgSend(v76, "osActivity");
      v18 = objc_claimAutoreleasedReturnValue();
      os_activity_scope_enter(v18, &state);

      if (C2_MULTIPEER_LOG_BLOCK_0 != -1)
        dispatch_once(&C2_MULTIPEER_LOG_BLOCK_0, &__block_literal_global_30);
      v19 = (id)C2_MULTIPEER_LOG_INTERNAL_0;
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        mach_continuous_time();
        objc_msgSend(v76, "startTimestamp");
        TMConvertTicksToSeconds();
        *(_DWORD *)buf = 138413314;
        v88 = self;
        v89 = 2112;
        v90 = v4;
        v91 = 2112;
        v92 = (uint64_t)v14;
        v93 = 2112;
        v94 = 0;
        v95 = 2048;
        v96 = v20;
        _os_log_impl(&dword_1D4DC3000, v19, OS_LOG_TYPE_DEFAULT, "[%@ handleData:%@] - received message %@ with error %@ after %.3f seconds.", buf, 0x34u);
      }

      v21 = objc_alloc_init(C2MultipeerChunkDataRequest);
      objc_msgSend(v14, "requestUUID");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[C2MultipeerChunkDataRequest setRequestUUID:](v21, "setRequestUUID:", v22);

      objc_msgSend(v76, "discoveryPeers");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[C2MultipeerConnection peerID](self, "peerID");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "removeObject:", v24);

      -[C2MultipeerConnection oustandingDiscoveryRequestsByRequestUUID](self, "oustandingDiscoveryRequestsByRequestUUID");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "requestUUID");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "removeObject:", v26);

      if (C2_MULTIPEER_LOG_BLOCK_0 != -1)
        dispatch_once(&C2_MULTIPEER_LOG_BLOCK_0, &__block_literal_global_32);
      v27 = (id)C2_MULTIPEER_LOG_INTERNAL_0;
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        -[C2MultipeerConnection peerID](self, "peerID");
        v28 = (C2MultipeerConnection *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "requestUUID");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v76, "discoveryPeers");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = objc_msgSend(v30, "count");
        *(_DWORD *)buf = 138412802;
        v88 = v28;
        v89 = 2112;
        v90 = v29;
        v91 = 2048;
        v92 = v31;
        _os_log_impl(&dword_1D4DC3000, v27, OS_LOG_TYPE_DEFAULT, "Received discovery response from %@ for %@, %llu peers remaining.", buf, 0x20u);

      }
      objc_msgSend(v76, "chunkDataRequestedFromPeer");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = v32 == 0;

      if (v33)
        v34 = objc_msgSend(v14, "chunkAvailable");
      else
        v34 = 0;
      -[C2MultipeerChunkDataRequest setChunkDataRequested:](v21, "setChunkDataRequested:", v34);
      if (objc_msgSend(v14, "chunkAvailable"))
      {
        v82 = 0;
        objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v21, 1, &v82);
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        v62 = (C2MultipeerConnection *)v82;
        v11 = v62;
        if (!v61 || v62)
        {
          if (C2_MULTIPEER_LOG_BLOCK_0 != -1)
            dispatch_once(&C2_MULTIPEER_LOG_BLOCK_0, &__block_literal_global_34);
          v68 = C2_MULTIPEER_LOG_INTERNAL_0;
          if (os_log_type_enabled((os_log_t)C2_MULTIPEER_LOG_INTERNAL_0, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v88 = v11;
            _os_log_impl(&dword_1D4DC3000, v68, OS_LOG_TYPE_DEFAULT, "Unable to serialize request with error %@", buf, 0xCu);
          }
        }
        else
        {
          if ((_DWORD)v34)
          {
            -[C2MultipeerConnection peerID](self, "peerID");
            v63 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v76, "setChunkDataRequestedFromPeer:", v63);

            objc_msgSend(v76, "resetTimerForChunkData");
            if (C2_MULTIPEER_LOG_BLOCK_0 != -1)
              dispatch_once(&C2_MULTIPEER_LOG_BLOCK_0, &__block_literal_global_36);
            v64 = (id)C2_MULTIPEER_LOG_INTERNAL_0;
            if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
            {
              -[C2MultipeerConnection peerID](self, "peerID");
              v65 = (C2MultipeerConnection *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v14, "requestUUID");
              v66 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              v88 = v65;
              v89 = 2112;
              v90 = v66;
              _os_log_impl(&dword_1D4DC3000, v64, OS_LOG_TYPE_DEFAULT, "Requested data from %@ for %@", buf, 0x16u);

            }
          }
          v78[0] = MEMORY[0x1E0C809B0];
          v78[1] = 3221225472;
          v78[2] = __36__C2MultipeerConnection_handleData___block_invoke_37;
          v78[3] = &unk_1E98987F8;
          v79 = v76;
          v80 = self;
          v81 = v14;
          -[C2MultipeerConnection sendMessageWithData:completionHandler:](self, "sendMessageWithData:completionHandler:", v61, v78);

        }
      }
      else
      {
        v11 = 0;
      }
      if (objc_msgSend(v76, "hadFailedToDiscover"))
      {
        -[C2MultipeerConnection parent](self, "parent");
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v69, "clientContextByRequestUUID");
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "requestUUID");
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v70, "setObject:forKeyedSubscript:", 0, v71);

      }
      os_activity_scope_leave(&state);

    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v46 = v10;
          -[C2MultipeerConnection parent](self, "parent");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v47, "clientContextByRequestUUID");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v46, "requestUUID");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "objectForKeyedSubscript:", v49);
          v50 = (void *)objc_claimAutoreleasedReturnValue();

          state.opaque[0] = 0;
          state.opaque[1] = 0;
          objc_msgSend(v50, "osActivity");
          v51 = objc_claimAutoreleasedReturnValue();
          os_activity_scope_enter(v51, &state);

          if (C2_MULTIPEER_LOG_BLOCK_0 != -1)
            dispatch_once(&C2_MULTIPEER_LOG_BLOCK_0, &__block_literal_global_48);
          v52 = C2_MULTIPEER_LOG_INTERNAL_0;
          if (os_log_type_enabled((os_log_t)C2_MULTIPEER_LOG_INTERNAL_0, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138413058;
            v88 = self;
            v89 = 2112;
            v90 = v4;
            v91 = 2112;
            v92 = (uint64_t)v46;
            v93 = 2112;
            v94 = 0;
            _os_log_impl(&dword_1D4DC3000, v52, OS_LOG_TYPE_DEFAULT, "[%@ handleData:%@] - received message %@ with error %@", buf, 0x2Au);
          }
          -[C2MultipeerConnection parent](self, "parent");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v53, "clientContextByRequestUUID");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v46, "requestUUID");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v54, "setObject:forKeyedSubscript:", 0, v55);

          objc_msgSend(v50, "chunkDataCallback");
          v56 = (void *)objc_claimAutoreleasedReturnValue();

          if (v56)
          {
            objc_msgSend(v50, "chunkDataCallback");
            v57 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
            objc_msgSend(v46, "chunkData");
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v46, "chunkData");
            v59 = (void *)objc_claimAutoreleasedReturnValue();
            if (v59)
            {
              v60 = 0;
            }
            else
            {
              v75 = (void *)MEMORY[0x1E0CB35C8];
              v85 = *MEMORY[0x1E0CB2D50];
              v86 = CFSTR("chunk data response missing data.");
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v86, &v85, 1);
              v49 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v75, "errorWithDomain:code:userInfo:", CFSTR("C2MultipeerErrorDomain"), 400, v49);
              v60 = (void *)objc_claimAutoreleasedReturnValue();
            }
            ((void (**)(_QWORD, void *, void *))v57)[2](v57, v58, v60);
            if (!v59)
            {

            }
          }
          os_activity_scope_leave(&state);

        }
        else
        {
          if (C2_MULTIPEER_LOG_BLOCK_0 != -1)
            dispatch_once(&C2_MULTIPEER_LOG_BLOCK_0, &__block_literal_global_54);
          v67 = C2_MULTIPEER_LOG_INTERNAL_0;
          if (os_log_type_enabled((os_log_t)C2_MULTIPEER_LOG_INTERNAL_0, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138413058;
            v88 = self;
            v89 = 2112;
            v90 = v4;
            v91 = 2112;
            v92 = (uint64_t)v10;
            v93 = 2112;
            v94 = 0;
            _os_log_impl(&dword_1D4DC3000, v67, OS_LOG_TYPE_DEFAULT, "[%@ handleData:%@] - received Unknown object %@ with error %@", buf, 0x2Au);
          }
        }
        goto LABEL_9;
      }
      v35 = v10;
      -[C2MultipeerConnection serverContextByRequestUUID](self, "serverContextByRequestUUID");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "requestUUID");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "objectForKeyedSubscript:", v37);
      v38 = (void *)objc_claimAutoreleasedReturnValue();

      state.opaque[0] = 0;
      state.opaque[1] = 0;
      objc_msgSend(v38, "osActivity");
      v39 = objc_claimAutoreleasedReturnValue();
      os_activity_scope_enter(v39, &state);

      if (C2_MULTIPEER_LOG_BLOCK_0 != -1)
        dispatch_once(&C2_MULTIPEER_LOG_BLOCK_0, &__block_literal_global_40);
      v40 = C2_MULTIPEER_LOG_INTERNAL_0;
      if (os_log_type_enabled((os_log_t)C2_MULTIPEER_LOG_INTERNAL_0, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138413058;
        v88 = self;
        v89 = 2112;
        v90 = v4;
        v91 = 2112;
        v92 = (uint64_t)v35;
        v93 = 2112;
        v94 = 0;
        _os_log_impl(&dword_1D4DC3000, v40, OS_LOG_TYPE_DEFAULT, "[%@ handleData:%@] - received message %@ with error %@", buf, 0x2Au);
      }
      if (objc_msgSend(v35, "chunkDataRequested"))
      {
        v41 = objc_alloc_init(C2MultipeerChunkDataResponse);
        objc_msgSend(v35, "requestUUID");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        -[C2MultipeerChunkDataResponse setRequestUUID:](v41, "setRequestUUID:", v42);

        objc_msgSend(v38, "chunkData");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        -[C2MultipeerChunkDataResponse setChunkData:](v41, "setChunkData:", v43);

        v77 = 0;
        objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v41, 1, &v77);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = (C2MultipeerConnection *)v77;
        v11 = v45;
        if (!v44 || v45)
        {
          if (C2_MULTIPEER_LOG_BLOCK_0 != -1)
            dispatch_once(&C2_MULTIPEER_LOG_BLOCK_0, &__block_literal_global_42);
          v72 = C2_MULTIPEER_LOG_INTERNAL_0;
          if (os_log_type_enabled((os_log_t)C2_MULTIPEER_LOG_INTERNAL_0, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v88 = v11;
            _os_log_impl(&dword_1D4DC3000, v72, OS_LOG_TYPE_DEFAULT, "Unable to serialize request with error %@", buf, 0xCu);
          }
        }
        else
        {
          -[C2MultipeerConnection sendMessageWithData:completionHandler:](self, "sendMessageWithData:completionHandler:", v44, &__block_literal_global_44);
        }

      }
      else
      {
        v11 = 0;
      }
      -[C2MultipeerConnection serverContextByRequestUUID](self, "serverContextByRequestUUID");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "requestUUID");
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v73, "setObject:forKeyedSubscript:", 0, v74);

      os_activity_scope_leave(&state);
    }
  }
LABEL_73:

}

void __36__C2MultipeerConnection_handleData___block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.c2", "multipeer");
  v1 = (void *)C2_MULTIPEER_LOG_INTERNAL_0;
  C2_MULTIPEER_LOG_INTERNAL_0 = (uint64_t)v0;

}

void __36__C2MultipeerConnection_handleData___block_invoke_27()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.c2", "multipeer");
  v1 = (void *)C2_MULTIPEER_LOG_INTERNAL_0;
  C2_MULTIPEER_LOG_INTERNAL_0 = (uint64_t)v0;

}

void __36__C2MultipeerConnection_handleData___block_invoke_29()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.c2", "multipeer");
  v1 = (void *)C2_MULTIPEER_LOG_INTERNAL_0;
  C2_MULTIPEER_LOG_INTERNAL_0 = (uint64_t)v0;

}

void __36__C2MultipeerConnection_handleData___block_invoke_31()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.c2", "multipeer");
  v1 = (void *)C2_MULTIPEER_LOG_INTERNAL_0;
  C2_MULTIPEER_LOG_INTERNAL_0 = (uint64_t)v0;

}

void __36__C2MultipeerConnection_handleData___block_invoke_33()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.c2", "multipeer");
  v1 = (void *)C2_MULTIPEER_LOG_INTERNAL_0;
  C2_MULTIPEER_LOG_INTERNAL_0 = (uint64_t)v0;

}

void __36__C2MultipeerConnection_handleData___block_invoke_35()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.c2", "multipeer");
  v1 = (void *)C2_MULTIPEER_LOG_INTERNAL_0;
  C2_MULTIPEER_LOG_INTERNAL_0 = (uint64_t)v0;

}

void __36__C2MultipeerConnection_handleData___block_invoke_37(id *a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    if (C2_MULTIPEER_LOG_BLOCK_0 != -1)
      dispatch_once(&C2_MULTIPEER_LOG_BLOCK_0, &__block_literal_global_38);
    v4 = C2_MULTIPEER_LOG_INTERNAL_0;
    if (os_log_type_enabled((os_log_t)C2_MULTIPEER_LOG_INTERNAL_0, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 138412290;
      v9 = v3;
      _os_log_impl(&dword_1D4DC3000, v4, OS_LOG_TYPE_DEFAULT, "Unable to send request with error %@", (uint8_t *)&v8, 0xCu);
    }
    objc_msgSend(a1[4], "setChunkDataRequestedFromPeer:", 0);
    if (objc_msgSend(a1[4], "hadFailedToDiscover"))
    {
      objc_msgSend(a1[5], "parent");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "clientContextByRequestUUID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[6], "requestUUID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKeyedSubscript:", 0, v7);

    }
  }

}

void __36__C2MultipeerConnection_handleData___block_invoke_2()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.c2", "multipeer");
  v1 = (void *)C2_MULTIPEER_LOG_INTERNAL_0;
  C2_MULTIPEER_LOG_INTERNAL_0 = (uint64_t)v0;

}

void __36__C2MultipeerConnection_handleData___block_invoke_39()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.c2", "multipeer");
  v1 = (void *)C2_MULTIPEER_LOG_INTERNAL_0;
  C2_MULTIPEER_LOG_INTERNAL_0 = (uint64_t)v0;

}

void __36__C2MultipeerConnection_handleData___block_invoke_41()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.c2", "multipeer");
  v1 = (void *)C2_MULTIPEER_LOG_INTERNAL_0;
  C2_MULTIPEER_LOG_INTERNAL_0 = (uint64_t)v0;

}

void __36__C2MultipeerConnection_handleData___block_invoke_43(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  if (v2)
  {
    if (C2_MULTIPEER_LOG_BLOCK_0 != -1)
      dispatch_once(&C2_MULTIPEER_LOG_BLOCK_0, &__block_literal_global_46);
    v3 = C2_MULTIPEER_LOG_INTERNAL_0;
    if (os_log_type_enabled((os_log_t)C2_MULTIPEER_LOG_INTERNAL_0, OS_LOG_TYPE_DEFAULT))
    {
      v4 = 138412290;
      v5 = v2;
      _os_log_impl(&dword_1D4DC3000, v3, OS_LOG_TYPE_DEFAULT, "Unable to send response with error %@", (uint8_t *)&v4, 0xCu);
    }
  }

}

void __36__C2MultipeerConnection_handleData___block_invoke_2_45()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.c2", "multipeer");
  v1 = (void *)C2_MULTIPEER_LOG_INTERNAL_0;
  C2_MULTIPEER_LOG_INTERNAL_0 = (uint64_t)v0;

}

void __36__C2MultipeerConnection_handleData___block_invoke_47()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.c2", "multipeer");
  v1 = (void *)C2_MULTIPEER_LOG_INTERNAL_0;
  C2_MULTIPEER_LOG_INTERNAL_0 = (uint64_t)v0;

}

void __36__C2MultipeerConnection_handleData___block_invoke_53()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.c2", "multipeer");
  v1 = (void *)C2_MULTIPEER_LOG_INTERNAL_0;
  C2_MULTIPEER_LOG_INTERNAL_0 = (uint64_t)v0;

}

- (C2Multipeer)parent
{
  return (C2Multipeer *)objc_loadWeakRetained((id *)&self->_parent);
}

- (void)setParent:(id)a3
{
  objc_storeWeak((id *)&self->_parent, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (NSString)peerID
{
  return self->_peerID;
}

- (void)setPeerID:(id)a3
{
  objc_storeStrong((id *)&self->_peerID, a3);
}

- (NSMutableSet)oustandingDiscoveryRequestsByRequestUUID
{
  return self->_oustandingDiscoveryRequestsByRequestUUID;
}

- (void)setOustandingDiscoveryRequestsByRequestUUID:(id)a3
{
  objc_storeStrong((id *)&self->_oustandingDiscoveryRequestsByRequestUUID, a3);
}

- (NSMutableDictionary)serverContextByRequestUUID
{
  return self->_serverContextByRequestUUID;
}

- (void)setServerContextByRequestUUID:(id)a3
{
  objc_storeStrong((id *)&self->_serverContextByRequestUUID, a3);
}

- (BOOL)isClientConnection
{
  return self->_isClientConnection;
}

- (void)setIsClientConnection:(BOOL)a3
{
  self->_isClientConnection = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverContextByRequestUUID, 0);
  objc_storeStrong((id *)&self->_oustandingDiscoveryRequestsByRequestUUID, 0);
  objc_storeStrong((id *)&self->_peerID, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_parent);
}

@end
