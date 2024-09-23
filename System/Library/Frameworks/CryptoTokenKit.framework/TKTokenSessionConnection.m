@implementation TKTokenSessionConnection

- (TKTokenSessionConnection)initWithTokenConnection:(id)a3
{
  id v5;
  TKTokenSessionConnection *v6;
  TKTokenSessionConnection *v7;
  void *v8;
  uint64_t v9;
  NSMutableDictionary *sessions;
  uint64_t v11;
  NSMutableDictionary *initialKeepAlives;
  objc_super v14;

  v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)TKTokenSessionConnection;
  v6 = -[TKTokenSessionConnection init](&v14, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_tokenConnection, a3);
    v8 = (void *)MEMORY[0x1E0C9AA70];
    v9 = objc_msgSend(MEMORY[0x1E0C9AA70], "mutableCopy");
    sessions = v7->_sessions;
    v7->_sessions = (NSMutableDictionary *)v9;

    v11 = objc_msgSend(v8, "mutableCopy");
    initialKeepAlives = v7->_initialKeepAlives;
    v7->_initialKeepAlives = (NSMutableDictionary *)v11;

  }
  return v7;
}

- (void)startSessionWithLAContext:(id)a3 parameters:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  id v52;
  id obj;
  id v54;
  _OWORD v55[2];
  __int128 v56;
  __int128 v57;
  id v58;

  v8 = a3;
  v9 = a4;
  v54 = a5;
  if (v8)
  {
    -[TKTokenSessionConnection tokenConnection](self, "tokenConnection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "sessions");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_sync_enter(v11);
    -[TKTokenSessionConnection tokenConnection](self, "tokenConnection");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "sessions");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKey:", v8);
    v14 = (id)objc_claimAutoreleasedReturnValue();

    objc_sync_exit(v11);
    v15 = (void *)objc_msgSend(v9, "mutableCopy");
    if (v14)
    {
LABEL_24:
      v41 = v9;
      if (objc_msgSend(v15, "count"))
      {
        objc_msgSend(v15, "removeObjectForKey:", CFSTR("PIN"));
        objc_msgSend(v15, "removeObjectForKey:", CFSTR("callerPID"));
        objc_msgSend(v14, "parameters");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "addEntriesFromDictionary:", v42);

        objc_msgSend(v14, "setParameters:", v15);
      }
      v43 = (void *)MEMORY[0x1E0CB37E8];
      ++self->_sessionIDCounter;
      objc_msgSend(v43, "numberWithInteger:");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[TKTokenSessionConnection sessions](self, "sessions");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "setObject:forKey:", v14, v17);

      -[TKTokenSessionConnection initialKeepAlives](self, "initialKeepAlives");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_sync_enter(v45);
      -[TKTokenSessionConnection initialKeepAlives](self, "initialKeepAlives");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "token");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "tokenDriver");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "keepAlive");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "setObject:forKey:", v49, v17);

      objc_sync_exit(v45);
      v23 = v54;
      (*((void (**)(id, void *, _QWORD))v54 + 2))(v54, v17, 0);
      v19 = v14;
      v9 = v41;
      goto LABEL_27;
    }
  }
  else
  {
    v15 = (void *)objc_msgSend(v9, "mutableCopy");
  }
  -[TKTokenSessionConnection tokenConnection](self, "tokenConnection");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "token");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "delegate");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = 0;
  objc_msgSend(v18, "token:createSessionWithError:", v17, &v58);
  v14 = (id)objc_claimAutoreleasedReturnValue();
  v19 = v58;

  if (v14)
  {
    objc_msgSend(v14, "setLAContext:", v8);
    objc_msgSend(MEMORY[0x1E0CB3B38], "currentConnection");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v20;
    if (v20)
    {
      objc_msgSend(v20, "auditToken");
    }
    else
    {
      v56 = 0u;
      v57 = 0u;
    }
    v55[0] = v56;
    v55[1] = v57;
    objc_msgSend(v14, "setCreatorAuditToken:", v55);

    objc_msgSend(v9, "objectForKey:", CFSTR("PIN"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "removeObjectForKey:", CFSTR("PIN"));
    if (v24)
    {
      TK_LOG_token_3();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
        -[TKTokenSessionConnection startSessionWithLAContext:parameters:reply:].cold.2(v25);

      objc_msgSend(v24, "dataUsingEncoding:", 4);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setCredential:type:", v26, -3);

    }
    objc_msgSend(v9, "objectForKey:", CFSTR("callerPID"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setCallerPID:", v27);

    objc_msgSend(v15, "removeObjectForKey:", CFSTR("callerPID"));
    if (objc_msgSend(v15, "count"))
    {
      objc_msgSend(v14, "parameters");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "addEntriesFromDictionary:", v28);

      objc_msgSend(v14, "setParameters:", v15);
    }
    if (v8)
    {
      v52 = v9;
      -[TKTokenSessionConnection tokenConnection](self, "tokenConnection");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "sessions");
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      obj = v30;
      objc_sync_enter(v30);
      -[TKTokenSessionConnection tokenConnection](self, "tokenConnection");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "sessions");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "objectForKey:", v8);
      v33 = (void *)objc_claimAutoreleasedReturnValue();

      if (v33)
      {
        v34 = v14;
        v14 = v33;
      }
      else
      {
        -[TKTokenSessionConnection tokenConnection](self, "tokenConnection");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "sessions");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "setObject:forKey:", v14, v8);

        -[TKTokenSessionConnection tokenConnection](self, "tokenConnection");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "token");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "tokenDriver");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "keepAlive");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setKeepAlive:", v37);

      }
      objc_sync_exit(obj);

      v9 = v52;
    }
    -[TKTokenSessionConnection tokenConnection](self, "tokenConnection");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "sessions");
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    objc_sync_enter(v39);
    -[TKTokenSessionConnection tokenConnection](self, "tokenConnection");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "setInitialKeepAlive:", 0);

    objc_sync_exit(v39);
    goto LABEL_24;
  }
  TK_LOG_token_3();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    -[TKTokenSessionConnection startSessionWithLAContext:parameters:reply:].cold.1(v17, (uint64_t)v19, v22);

  v23 = v54;
  (*((void (**)(id, _QWORD, id))v54 + 2))(v54, 0, v19);
LABEL_27:

}

- (void)endSession:(id)a3 reply:(id)a4
{
  id v6;
  void *v7;
  void (**v8)(void);

  v8 = (void (**)(void))a4;
  v6 = a3;
  -[TKTokenSessionConnection sessions](self, "sessions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeObjectForKey:", v6);

  v8[2]();
}

- (void)withSessionID:(id)a3 invoke:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD block[4];
  id v26;
  id v27;
  TKTokenSessionConnection *v28;
  id v29;
  id v30;
  _QWORD *v31;
  _QWORD v32[5];
  id v33;

  v7 = a3;
  v8 = a4;
  TK_LOG_token_3();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    -[TKTokenSessionConnection withSessionID:invoke:].cold.1((uint64_t)v7, self, v9);

  -[TKTokenSessionConnection sessions](self, "sessions");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKey:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[TKTokenSessionConnection tokenConnection](self, "tokenConnection");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "token");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "tokenID");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TKTokenConnection.m"), 114, CFSTR("An attempt to reference nonexistent session %@ on token %@"), v7, v24);

  }
  objc_msgSend(MEMORY[0x1E0CB3B38], "currentConnection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = 0;
  v32[1] = v32;
  v32[2] = 0x3032000000;
  v32[3] = __Block_byref_object_copy__5;
  v32[4] = __Block_byref_object_dispose__5;
  -[TKTokenSessionConnection tokenConnection](self, "tokenConnection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "token");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "tokenDriver");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "keepAlive");
  v33 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "queue");
  v16 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__TKTokenSessionConnection_withSessionID_invoke___block_invoke;
  block[3] = &unk_1E708A300;
  v26 = v11;
  v27 = v12;
  v30 = v8;
  v31 = v32;
  v28 = self;
  v29 = v7;
  v17 = v7;
  v18 = v8;
  v19 = v12;
  v20 = v11;
  dispatch_async(v16, block);

  _Block_object_dispose(v32, 8);
}

void __49__TKTokenSessionConnection_withSessionID_invoke___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;
  id v10;
  uint64_t v11;

  objc_msgSend(*(id *)(a1 + 32), "setCaller:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "beginRequest");
  v2 = *(_QWORD *)(a1 + 64);
  v3 = *(void **)(a1 + 32);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __49__TKTokenSessionConnection_withSessionID_invoke___block_invoke_2;
  v7[3] = &unk_1E708A2D8;
  v4 = v3;
  v11 = *(_QWORD *)(a1 + 72);
  v5 = *(_QWORD *)(a1 + 48);
  v6 = *(void **)(a1 + 56);
  v8 = v4;
  v9 = v5;
  v10 = v6;
  (*(void (**)(uint64_t, id, _QWORD *))(v2 + 16))(v2, v4, v7);

}

void __49__TKTokenSessionConnection_withSessionID_invoke___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)MEMORY[0x1BCCC4960]();
  objc_msgSend(*(id *)(a1 + 32), "endRequest");
  objc_msgSend(*(id *)(a1 + 32), "setCaller:", 0);
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = 0;

  objc_msgSend(*(id *)(a1 + 40), "initialKeepAlives");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v5);
  objc_msgSend(*(id *)(a1 + 40), "initialKeepAlives");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObjectForKey:", *(_QWORD *)(a1 + 48));

  objc_sync_exit(v5);
  objc_autoreleasePoolPop(v2);
}

- (void)session:(id)a3 getAdvertisedItemsWithReply:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v6 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __64__TKTokenSessionConnection_session_getAdvertisedItemsWithReply___block_invoke;
  v8[3] = &unk_1E708A350;
  v9 = v6;
  v7 = v6;
  -[TKTokenSessionConnection withSessionID:invoke:](self, "withSessionID:invoke:", a3, v8);

}

void __64__TKTokenSessionConnection_session_getAdvertisedItemsWithReply___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v5 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __64__TKTokenSessionConnection_session_getAdvertisedItemsWithReply___block_invoke_2;
  v7[3] = &unk_1E708A328;
  v8 = *(id *)(a1 + 32);
  v9 = v5;
  v6 = v5;
  objc_msgSend(a2, "getAdvertisedItemsWithReply:", v7);

}

uint64_t __64__TKTokenSessionConnection_session_getAdvertisedItemsWithReply___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)session:(id)a3 evaluateAccessControl:(id)a4 forOperation:(id)a5 reply:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __77__TKTokenSessionConnection_session_evaluateAccessControl_forOperation_reply___block_invoke;
  v16[3] = &unk_1E708A3A0;
  v17 = v10;
  v18 = v11;
  v19 = v12;
  v13 = v12;
  v14 = v11;
  v15 = v10;
  -[TKTokenSessionConnection withSessionID:invoke:](self, "withSessionID:invoke:", a3, v16);

}

void __77__TKTokenSessionConnection_session_evaluateAccessControl_forOperation_reply___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v5 = a3;
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(_QWORD *)(a1 + 40);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __77__TKTokenSessionConnection_session_evaluateAccessControl_forOperation_reply___block_invoke_2;
  v9[3] = &unk_1E708A378;
  v10 = *(id *)(a1 + 48);
  v11 = v5;
  v8 = v5;
  objc_msgSend(a2, "evaluateAccessControl:forOperation:reply:", v6, v7, v9);

}

uint64_t __77__TKTokenSessionConnection_session_evaluateAccessControl_forOperation_reply___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)session:(id)a3 getAttributesOfObjectID:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  char v19;
  id v20;
  char v21;

  v8 = a3;
  v9 = a5;
  v21 = 0;
  v10 = a4;
  -[TKTokenSessionConnection tokenConnection](self, "tokenConnection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "token");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "tokenID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0;
  objc_msgSend(v13, "decodedObjectID:isCertificate:error:", v10, &v21, &v20);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = v20;
  if (v14)
  {
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __66__TKTokenSessionConnection_session_getAttributesOfObjectID_reply___block_invoke;
    v16[3] = &unk_1E708A3F0;
    v17 = v14;
    v19 = v21;
    v18 = v9;
    -[TKTokenSessionConnection withSessionID:invoke:](self, "withSessionID:invoke:", v8, v16);

  }
  else
  {
    (*((void (**)(id, _QWORD, id))v9 + 2))(v9, 0, v15);
  }

}

void __66__TKTokenSessionConnection_session_getAttributesOfObjectID_reply___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v5 = a3;
  v6 = *(unsigned __int8 *)(a1 + 48);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __66__TKTokenSessionConnection_session_getAttributesOfObjectID_reply___block_invoke_2;
  v9[3] = &unk_1E708A3C8;
  v7 = *(_QWORD *)(a1 + 32);
  v10 = *(id *)(a1 + 40);
  v11 = v5;
  v8 = v5;
  objc_msgSend(a2, "getAttributesOfObject:isCertificate:reply:", v7, v6, v9);

}

uint64_t __66__TKTokenSessionConnection_session_getAttributesOfObjectID_reply___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)session:(id)a3 objectID:(id)a4 operation:(int64_t)a5 data:(id)a6 algorithms:(id)a7 parameters:(id)a8 reply:(id)a9
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  id v26;
  _QWORD v27[4];
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  int64_t v33;
  id v34;

  v26 = a3;
  v14 = a6;
  v15 = a7;
  v16 = a8;
  v17 = a9;
  v18 = a4;
  -[TKTokenSessionConnection tokenConnection](self, "tokenConnection");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "token");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "tokenID");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = 0;
  objc_msgSend(v21, "decodedKeyID:error:", v18, &v34);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = v34;
  if (v22)
  {
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __88__TKTokenSessionConnection_session_objectID_operation_data_algorithms_parameters_reply___block_invoke;
    v27[3] = &unk_1E708A440;
    v28 = v22;
    v33 = a5;
    v29 = v14;
    v30 = v15;
    v31 = v16;
    v32 = v17;
    v24 = v26;
    -[TKTokenSessionConnection withSessionID:invoke:](self, "withSessionID:invoke:", v26, v27);

  }
  else
  {
    (*((void (**)(id, _QWORD, id))v17 + 2))(v17, 0, v23);
    v24 = v26;
  }

}

void __88__TKTokenSessionConnection_session_objectID_operation_data_algorithms_parameters_reply___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v5 = a3;
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(_QWORD *)(a1 + 40);
  v8 = *(_QWORD *)(a1 + 48);
  v9 = *(_QWORD *)(a1 + 56);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __88__TKTokenSessionConnection_session_objectID_operation_data_algorithms_parameters_reply___block_invoke_2;
  v12[3] = &unk_1E708A418;
  v10 = *(_QWORD *)(a1 + 72);
  v13 = *(id *)(a1 + 64);
  v14 = v5;
  v11 = v5;
  objc_msgSend(a2, "objectID:operation:inputData:algorithms:parameters:reply:", v6, v10, v7, v8, v9, v12);

}

uint64_t __88__TKTokenSessionConnection_session_objectID_operation_data_algorithms_parameters_reply___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)session:(id)a3 createObjectWithAttributes:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v8 = a4;
  v9 = a5;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __69__TKTokenSessionConnection_session_createObjectWithAttributes_reply___block_invoke;
  v12[3] = &unk_1E708A468;
  v13 = v8;
  v14 = v9;
  v10 = v9;
  v11 = v8;
  -[TKTokenSessionConnection withSessionID:invoke:](self, "withSessionID:invoke:", a3, v12);

}

void __69__TKTokenSessionConnection_session_createObjectWithAttributes_reply___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v5 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __69__TKTokenSessionConnection_session_createObjectWithAttributes_reply___block_invoke_2;
  v8[3] = &unk_1E708A3C8;
  v6 = *(_QWORD *)(a1 + 32);
  v9 = *(id *)(a1 + 40);
  v10 = v5;
  v7 = v5;
  objc_msgSend(a2, "createObjectWithAttributes:reply:", v6, v8);

}

void __69__TKTokenSessionConnection_session_createObjectWithAttributes_reply___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;

  v13 = a2;
  v5 = a3;
  v6 = *MEMORY[0x1E0CD6BB8];
  objc_msgSend(v13, "objectForKeyedSubscript:", *MEMORY[0x1E0CD6BB8]);
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    +[TKTokenID encodedKeyID:](TKTokenID, "encodedKeyID:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = (void *)objc_msgSend(v13, "mutableCopy");
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v9, v6);
    v11 = objc_msgSend(v10, "copy");

    v12 = (id)v11;
  }
  else
  {
    v9 = 0;
    v12 = v13;
  }
  v14 = v12;
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)session:(id)a3 deleteObjectWithObjectID:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;

  v8 = a3;
  v9 = a5;
  v10 = a4;
  -[TKTokenSessionConnection tokenConnection](self, "tokenConnection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "token");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "tokenID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0;
  objc_msgSend(v13, "decodedKeyID:error:", v10, &v19);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = v19;
  if (v14)
  {
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __67__TKTokenSessionConnection_session_deleteObjectWithObjectID_reply___block_invoke;
    v16[3] = &unk_1E708A468;
    v17 = v14;
    v18 = v9;
    -[TKTokenSessionConnection withSessionID:invoke:](self, "withSessionID:invoke:", v8, v16);

  }
  else
  {
    (*((void (**)(id, _QWORD, id))v9 + 2))(v9, 0, v15);
  }

}

void __67__TKTokenSessionConnection_session_deleteObjectWithObjectID_reply___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v5 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __67__TKTokenSessionConnection_session_deleteObjectWithObjectID_reply___block_invoke_2;
  v8[3] = &unk_1E708A378;
  v6 = *(_QWORD *)(a1 + 32);
  v9 = *(id *)(a1 + 40);
  v10 = v5;
  v7 = v5;
  objc_msgSend(a2, "deleteObject:reply:", v6, v8);

}

uint64_t __67__TKTokenSessionConnection_session_deleteObjectWithObjectID_reply___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)session:(id)a3 slotNameWithReply:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v6 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __54__TKTokenSessionConnection_session_slotNameWithReply___block_invoke;
  v8[3] = &unk_1E708A350;
  v9 = v6;
  v7 = v6;
  -[TKTokenSessionConnection withSessionID:invoke:](self, "withSessionID:invoke:", a3, v8);

}

void __54__TKTokenSessionConnection_session_slotNameWithReply___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4;
  void *v5;
  void (**v6)(void);

  v4 = *(_QWORD *)(a1 + 32);
  v6 = a3;
  objc_msgSend(a2, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);

  v6[2]();
}

- (TKTokenConnection)tokenConnection
{
  return self->_tokenConnection;
}

- (NSMutableDictionary)sessions
{
  return self->_sessions;
}

- (NSMutableDictionary)initialKeepAlives
{
  return self->_initialKeepAlives;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_initialKeepAlives, 0);
  objc_storeStrong((id *)&self->_sessions, 0);
  objc_storeStrong((id *)&self->_tokenConnection, 0);
}

- (void)startSessionWithLAContext:(void *)a1 parameters:(uint64_t)a2 reply:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "tokenID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138543618;
  v7 = v5;
  v8 = 2114;
  v9 = a2;
  _os_log_error_impl(&dword_1B9768000, a3, OS_LOG_TYPE_ERROR, "Token %{public}@ failed to create new session, error %{public}@", (uint8_t *)&v6, 0x16u);

}

- (void)startSessionWithLAContext:(os_log_t)log parameters:reply:.cold.2(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1B9768000, log, OS_LOG_TYPE_DEBUG, "setting PIN sent in creation attributes into LAContext", v1, 2u);
}

- (void)withSessionID:(NSObject *)a3 invoke:.cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  void *v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "tokenConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "token");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "tokenID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138543618;
  v9 = a1;
  v10 = 2114;
  v11 = v7;
  _os_log_debug_impl(&dword_1B9768000, a3, OS_LOG_TYPE_DEBUG, "with session %{public}@ on token %{public}@", (uint8_t *)&v8, 0x16u);

}

@end
