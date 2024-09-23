@implementation NWURLSessionWebSocketTask

- (BOOL)isKindOfClass:(Class)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NWURLSessionWebSocketTask;
  if (-[NWURLSessionTask isKindOfClass:](&v5, sel_isKindOfClass_))
    return 1;
  else
    return -[objc_class isEqual:](a3, "isEqual:", objc_opt_class());
}

- (id)response
{
  if (self)
    self = (NWURLSessionWebSocketTask *)self->_closeReason;
  return self;
}

- (void)startNextLoad:(BOOL)a3
{
  _BOOL4 v3;
  NWURLSessionTaskConfiguration *configuration;
  id *v6;
  void *v7;
  id v8;
  NWURLSessionTaskConfiguration *v9;
  id *p_isa;
  double v11;
  NWURLLoaderHTTP *v12;
  void *v13;
  NWURLSessionTaskConfiguration *v14;
  OS_dispatch_queue *v15;
  NWURLLoader *v16;
  NWURLLoader *loader;
  NWURLLoader *v18;
  _QWORD v19[5];

  v3 = a3;
  if (self)
  {
    nw_context_assert_queue(self->super._sessionContext);
    configuration = self->super._configuration;
  }
  else
  {
    nw_context_assert_queue(0);
    configuration = 0;
  }
  v6 = configuration;
  -[NWURLSessionTask currentRequest](self, "currentRequest");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
    objc_storeStrong(v6 + 4, v7);

  if (self)
  {
    v9 = self->super._configuration;
    p_isa = (id *)&v9->super.isa;
    if (v9)
    {
      if (-[NSURLRequest _explicitlySetTimeoutInterval](v9->_request, "_explicitlySetTimeoutInterval"))
        objc_msgSend(p_isa[4], "timeoutInterval");
      else
        objc_msgSend(p_isa[2], "timeoutIntervalForRequest");
    }
    else
    {
      v11 = 0.0;
    }
    self->super._timeoutIntervalForRequest = v11;

    if (v3)
      goto LABEL_11;
  }
  else
  {

    if (v3)
    {
LABEL_11:
      -[NWURLSessionTask startStartTimer]((uint64_t)self);
      -[NWURLSessionTask startResourceTimer](self);
    }
  }
  v12 = [NWURLLoaderHTTP alloc];
  -[NWURLSessionTask currentRequest](self, "currentRequest");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (self)
  {
    v14 = self->super._configuration;
    v15 = self->super._queue;
    v16 = (NWURLLoader *)-[NWURLLoaderHTTP initWithRequest:bodyKnownSize:configuration:queue:client:]((id *)&v12->super.isa, v13, 0, v14, v15, self);
    loader = self->super._loader;
    self->super._loader = v16;

    v18 = self->super._loader;
  }
  else
  {

    v18 = 0;
  }
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __43__NWURLSessionWebSocketTask_startNextLoad___block_invoke;
  v19[3] = &unk_1E14ACFD0;
  v19[4] = self;
  -[NWURLLoader start:](v18, "start:", v19);
}

- (void)sendMessage:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  NSObject *queue;
  id v13;
  _QWORD block[5];
  id v15;
  _QWORD aBlock[5];
  id v17;
  id v18;

  v6 = a3;
  v7 = a4;
  v8 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __59__NWURLSessionWebSocketTask_sendMessage_completionHandler___block_invoke;
  aBlock[3] = &unk_1E14A8D98;
  v17 = v6;
  v18 = v7;
  aBlock[4] = self;
  v9 = v6;
  v10 = v7;
  v11 = _Block_copy(aBlock);
  if (self)
    queue = self->super._queue;
  else
    queue = 0;
  block[0] = v8;
  block[1] = 3221225472;
  block[2] = __59__NWURLSessionWebSocketTask_sendMessage_completionHandler___block_invoke_5;
  block[3] = &unk_1E14ACE18;
  block[4] = self;
  v15 = v11;
  v13 = v11;
  dispatch_async(queue, block);

}

- (void)receiveMessageWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  if (self)
    queue = self->super._queue;
  else
    queue = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __65__NWURLSessionWebSocketTask_receiveMessageWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E14ACE18;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)sendPingWithPongReceiveHandler:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  NSObject *queue;
  id v9;
  _QWORD v10[5];
  id v11;
  _QWORD aBlock[5];
  id v13;

  v4 = a3;
  v5 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __60__NWURLSessionWebSocketTask_sendPingWithPongReceiveHandler___block_invoke;
  aBlock[3] = &unk_1E14ACE18;
  aBlock[4] = self;
  v13 = v4;
  v6 = v4;
  v7 = _Block_copy(aBlock);
  if (self)
    queue = self->super._queue;
  else
    queue = 0;
  v10[0] = v5;
  v10[1] = 3221225472;
  v10[2] = __60__NWURLSessionWebSocketTask_sendPingWithPongReceiveHandler___block_invoke_6;
  v10[3] = &unk_1E14ACE18;
  v10[4] = self;
  v11 = v7;
  v9 = v7;
  dispatch_async(queue, v10);

}

- (void)_sendCloseCode:(int64_t)a3 reason:(id)a4
{
  id v6;
  uint64_t v7;
  id v8;
  void *v9;
  NSObject *queue;
  id v11;
  _QWORD block[5];
  id v13;
  _QWORD aBlock[5];
  id v15;
  int64_t v16;

  v6 = a4;
  v7 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __51__NWURLSessionWebSocketTask__sendCloseCode_reason___block_invoke;
  aBlock[3] = &unk_1E14AB278;
  v15 = v6;
  v16 = a3;
  aBlock[4] = self;
  v8 = v6;
  v9 = _Block_copy(aBlock);
  if (self)
    queue = self->super._queue;
  else
    queue = 0;
  block[0] = v7;
  block[1] = 3221225472;
  block[2] = __51__NWURLSessionWebSocketTask__sendCloseCode_reason___block_invoke_3;
  block[3] = &unk_1E14ACE18;
  block[4] = self;
  v13 = v9;
  v11 = v9;
  dispatch_async(queue, block);

}

- (void)cancelWithCloseCode:(int64_t)a3 reason:(id)a4
{
  -[NWURLSessionWebSocketTask _sendCloseCode:reason:](self, "_sendCloseCode:reason:", a3, a4);
  -[NWURLSessionTask cancel](self, "cancel");
}

- (void)completeTaskWithError:(id)a3
{
  const char *v4;
  NWURLError *v5;
  NWURLLoader *v6;
  NWURLSessionWebSocketTask *v7;
  uint64_t v8;
  NWURLSessionWebSocketTask *v9;
  SEL v10;
  uint64_t v11;
  id v12;
  id newValue;
  objc_super v14;

  newValue = a3;
  if (!self)
  {
    nw_context_assert_queue(0);
    v12 = 0;
LABEL_11:
    -[NWURLSessionDelegateWrapper task:didCompleteWithError:metrics:]((uint64_t)v12, self, newValue, 0);

    -[NWURLSessionTask complete]((uint64_t)self);
    goto LABEL_12;
  }
  nw_context_assert_queue(self->super._sessionContext);
  if (self->super._internalState != 2)
  {
    if (newValue)
    {
      objc_setProperty_atomic_copy(self, v4, newValue, 136);
    }
    else
    {
      v5 = [NWURLError alloc];
      v6 = self->super._loader;
      v7 = self;
      if (v5)
      {
        v8 = *MEMORY[0x1E0CB32E8];
        v14.receiver = v5;
        v14.super_class = (Class)NWURLError;
        v9 = -[NWURLSessionWebSocketTask initWithDomain:code:userInfo:](&v14, sel_initWithDomain_code_userInfo_, v8, -1005, 0);
        v5 = (NWURLError *)v9;
        if (v9)
          -[NWURLSessionWebSocketTask fillErrorForLoader:andTask:](v9, "fillErrorForLoader:andTask:", v6, v7);
      }

      objc_setProperty_atomic_copy(v7, v10, v5, 136);
    }
    -[NWURLSessionWebSocketTask processWork]((uint64_t)self);
    v11 = 240;
    if (!self->super._internalDelegateWrapper)
      v11 = 232;
    v12 = *(id *)((char *)&self->super.super.isa + v11);
    goto LABEL_11;
  }
LABEL_12:

}

- (int64_t)maximumMessageSize
{
  return *(_QWORD *)&self->_receiving;
}

- (void)setMaximumMessageSize:(int64_t)a3
{
  *(_QWORD *)&self->_receiving = a3;
}

- (int64_t)closeCode
{
  return self->_maximumMessageSize;
}

- (NSData)closeReason
{
  return (NSData *)self->_closeCode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingError, 0);
  objc_storeStrong((id *)&self->_pendingWork, 0);
  objc_storeStrong((id *)&self->_upgradedConnection, 0);
  objc_storeStrong((id *)&self->_storedResponse, 0);
  objc_storeStrong((id *)&self->_closeReason, 0);
  objc_storeStrong((id *)&self->_closeCode, 0);
}

- (void)processWork
{
  id v2;
  void *v3;
  id v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    nw_context_assert_queue(*(void **)(a1 + 304));
    v2 = *(id *)(a1 + 496);
    if (v2)
    {

    }
    else
    {
      objc_msgSend((id)a1, "error");
      v3 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v3)
        return;
    }
    v4 = *(id *)(a1 + 504);
    v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v6 = *(void **)(a1 + 504);
    *(_QWORD *)(a1 + 504) = v5;

    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v7 = v4;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v13;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v13 != v10)
            objc_enumerationMutation(v7);
          (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v11) + 16))(*(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v11));
          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v9);
    }

    if (!*(_BYTE *)(a1 + 460))
    {
      if (objc_msgSend(*(id *)(a1 + 520), "count", (_QWORD)v12))
        -[NWURLSessionWebSocketTask receiveMessage](a1);
    }

  }
}

- (void)receiveMessage
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  _QWORD v9[4];
  id v10;
  uint64_t v11;

  if (a1)
  {
    nw_context_assert_queue(*(void **)(a1 + 304));
    objc_msgSend((id)a1, "error");
    v2 = (void *)objc_claimAutoreleasedReturnValue();

    if (v2)
    {
      v4 = *(id *)(a1 + 520);
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      -[NWURLSessionWebSocketTask setPendingReceiveCompletionHandlers:](a1, v5);

      -[NWURLSessionTask delegateWrapper]((_QWORD *)a1);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __43__NWURLSessionWebSocketTask_receiveMessage__block_invoke;
      v9[3] = &unk_1E14ACE68;
      v10 = v4;
      v11 = a1;
      v7 = v4;
      -[NWURLSessionDelegateWrapper runDelegateBlock:]((uint64_t)v6, v9);

    }
    else
    {
      *(_BYTE *)(a1 + 460) = 1;
      v3 = *(void **)(a1 + 496);
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __43__NWURLSessionWebSocketTask_receiveMessage__block_invoke_2;
      v8[3] = &unk_1E14A3048;
      v8[4] = a1;
      nw_connection_receive_internal(v3, 0, 0xFFFFFFFF, 0xFFFFFFFF, v8);
    }
  }
}

- (void)setPendingReceiveCompletionHandlers:(uint64_t)a1
{
  objc_storeStrong((id *)(a1 + 520), a2);
}

void __43__NWURLSessionWebSocketTask_receiveMessage__block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v2);
        v7 = *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v6);
        objc_msgSend(*(id *)(a1 + 40), "error", (_QWORD)v9);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, _QWORD, void *))(v7 + 16))(v7, 0, v8);

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }

}

void __43__NWURLSessionWebSocketTask_receiveMessage__block_invoke_2(uint64_t a1, void *a2, void *a3, int a4, void *a5)
{
  NSObject *v9;
  id v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  nw_ws_opcode_t opcode;
  NSObject *v15;
  NSObject *v16;
  int v17;
  void *v18;
  id v19;
  NSObject *v20;
  NSObject *v21;
  id v22;
  NSObject *v23;
  void *v24;
  void **v25;
  id v26;
  nw_ws_close_code_t close_code;
  const char *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  id *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  id v38;
  void *v39;
  id v40;
  _QWORD *v41;
  id v42;
  _QWORD *v43;
  _QWORD *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  _QWORD **v50;
  id v51;
  id *v52;
  NSObject *v53;
  void *v54;
  void *v55;
  int v56;
  NSObject *size;
  id v58;
  id v59;
  NSObject *newValue;
  _QWORD v61[4];
  id v62;
  id v63;
  uint64_t v64;
  uint64_t v65;
  int v66;
  _QWORD v67[2];
  int v68;
  _BYTE buf[40];
  __int128 v70;
  __int128 v71;
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  newValue = a2;
  v9 = a3;
  v10 = a5;
  v11 = *(_QWORD *)(a1 + 32);
  if (v11)
  {
    *(_BYTE *)(v11 + 460) = 0;
    v12 = *(void **)(a1 + 32);
  }
  else
  {
    v12 = 0;
  }
  objc_msgSend(v12, "error");
  v13 = objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[NWURLSessionWebSocketTask processWork](*(_QWORD *)(a1 + 32));
    goto LABEL_76;
  }
  opcode = nw_ws_opcode_invalid;
  if (v9 && a4)
  {
    if (nw_protocol_copy_ws_definition::onceToken != -1)
      dispatch_once(&nw_protocol_copy_ws_definition::onceToken, &__block_literal_global_3588);
    v15 = (id)nw_protocol_copy_ws_definition::definition;
    v13 = nw_content_context_copy_protocol_metadata(v9, v15);

    if (v13)
      opcode = nw_ws_metadata_get_opcode(v13);
    else
      opcode = nw_ws_opcode_invalid;
  }
  if (gLogDatapath)
  {
    if (__nwlog_url_log::onceToken != -1)
      dispatch_once(&__nwlog_url_log::onceToken, &__block_literal_global_54_44225);
    v53 = (id)gurlLogObj;
    if (!os_log_type_enabled(v53, OS_LOG_TYPE_DEBUG))
      goto LABEL_94;
    v54 = *(void **)(a1 + 32);
    if (v54)
    {
      objc_msgSend(v54, "logDescription");
      v55 = *(void **)(a1 + 32);
      if (v55)
      {
        objc_msgSend(v55, "logDescription");
        v56 = v66;
        size = newValue;
LABEL_91:
        if (size)
          size = dispatch_data_get_size(size);
        *(_DWORD *)buf = 136448002;
        *(_QWORD *)&buf[4] = "-[NWURLSessionWebSocketTask receiveMessage]_block_invoke_2";
        *(_WORD *)&buf[12] = 1042;
        *(_DWORD *)&buf[14] = 16;
        *(_WORD *)&buf[18] = 2098;
        *(_QWORD *)&buf[20] = v67;
        *(_WORD *)&buf[28] = 1024;
        *(_DWORD *)&buf[30] = v56;
        *(_WORD *)&buf[34] = 1024;
        *(_DWORD *)&buf[36] = opcode;
        LOWORD(v70) = 2048;
        *(_QWORD *)((char *)&v70 + 2) = size;
        WORD5(v70) = 1024;
        HIDWORD(v70) = a4;
        LOWORD(v71) = 2112;
        *(_QWORD *)((char *)&v71 + 2) = v10;
        _os_log_impl(&dword_182FBE000, v53, OS_LOG_TYPE_DEBUG, "%{public}s Task <%{public,uuid_t}.16P>.<%u> received message: %d, size: %zu, complete: %{BOOL}d, error: %@", buf, 0x42u);
LABEL_94:

        goto LABEL_12;
      }
    }
    else
    {
      v67[0] = 0;
      v67[1] = 0;
      v68 = 0;
    }
    size = newValue;
    v56 = 0;
    v64 = 0;
    v65 = 0;
    v66 = 0;
    goto LABEL_91;
  }
LABEL_12:
  if (v9)
  {
    v16 = v9;
    v17 = 0;
    if (v16 != &__block_literal_global_41718 && v16 != &__block_literal_global_5_41741)
    {
      v17 = 1;
      if (v16 != &__block_literal_global_3_41726 && v16 != &__block_literal_global_4)
        v17 = BYTE6(v16[14].isa) & 1;
    }

  }
  else
  {
    v17 = 1;
  }
  v18 = 0;
  switch(opcode)
  {
    case nw_ws_opcode_cont:
      if (__nwlog_url_log::onceToken != -1)
        dispatch_once(&__nwlog_url_log::onceToken, &__block_literal_global_54_44225);
      v21 = (id)gurlLogObj;
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_182FBE000, v21, OS_LOG_TYPE_ERROR, "WebSocket cont frame should not be received", buf, 2u);
      }

      v18 = 0;
      if (v10)
        goto LABEL_38;
      goto LABEL_53;
    case nw_ws_opcode_text:
      v22 = objc_alloc(MEMORY[0x1E0CB3940]);
      if (newValue)
        v23 = newValue;
      else
        v23 = MEMORY[0x1E0C80D00];
      v24 = (void *)objc_msgSend(v22, "initWithData:encoding:", v23, 4);
      v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C92CF0]), "initWithString:", v24);

      goto LABEL_37;
    case nw_ws_opcode_binary:
      v19 = objc_alloc(MEMORY[0x1E0C92CF0]);
      if (newValue)
        v20 = newValue;
      else
        v20 = MEMORY[0x1E0C80D00];
      v18 = (void *)objc_msgSend(v19, "initWithData:", v20);
      if (!v10)
        goto LABEL_53;
      goto LABEL_38;
    case nw_ws_opcode_close:
      close_code = nw_ws_metadata_get_close_code(v13);
      v29 = *(_QWORD *)(a1 + 32);
      if (v29
        && (*(_QWORD *)(v29 + 472) = close_code, (v30 = *(void **)(a1 + 32)) != 0)
        && (objc_setProperty_nonatomic_copy(v30, v28, newValue, 480), (v31 = *(_QWORD *)(a1 + 32)) != 0))
      {
        v32 = 240;
        if (!*(_QWORD *)(v31 + 240))
          v32 = 232;
        v33 = (id *)*(id *)(v31 + v32);
        v34 = *(void **)(a1 + 32);
      }
      else
      {
        v34 = 0;
        v33 = 0;
      }
      v35 = objc_msgSend(v34, "closeCode");
      objc_msgSend(*(id *)(a1 + 32), "closeReason");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v59 = v34;
      v38 = v36;
      if (v33)
      {
        -[NWURLSessionDelegateWrapper delegateFor_didCloseWithCode](v33, v37);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        if (v39)
        {
          v40 = v33[4];
          *(_QWORD *)buf = MEMORY[0x1E0C809B0];
          *(_QWORD *)&buf[8] = 3221225472;
          *(_QWORD *)&buf[16] = __69__NWURLSessionDelegateWrapper_webSocketTask_didCloseWithCode_reason___block_invoke;
          *(_QWORD *)&buf[24] = &unk_1E14AAD20;
          *(_QWORD *)&buf[32] = v39;
          *(_QWORD *)&v70 = v40;
          *((_QWORD *)&v70 + 1) = v59;
          *((_QWORD *)&v71 + 1) = v35;
          *(_QWORD *)&v71 = v38;
          v41 = v33[6];
          v42 = v40;
          -[NWURLSessionDelegateQueue runDelegateBlock:](v41, buf);

        }
      }

      v18 = 0;
      v17 = 1;
      if (!v10)
        goto LABEL_53;
      goto LABEL_38;
    case nw_ws_opcode_ping:
    case nw_ws_opcode_pong:
      -[NWURLSessionWebSocketTask receiveMessage](*(_QWORD *)(a1 + 32));
      goto LABEL_75;
    default:
LABEL_37:
      if (v10)
      {
LABEL_38:
        v25 = *(void ***)(a1 + 32);
        if (v25)
        {
          v26 = v10;
          v25 = (void **)-[NWURLError initWithNWError:forLoader:andTask:]([NWURLError alloc], v26, v25[32], v25);

        }
        if (v18)
          goto LABEL_56;
      }
      else
      {
LABEL_53:
        v25 = 0;
        if (v18)
          goto LABEL_56;
      }
      if (v17 != 1 && !v25)
      {
        -[NWURLSessionTask errorForErrorCode:](*(id **)(a1 + 32), -1005);
        v25 = (void **)objc_claimAutoreleasedReturnValue();
        LOBYTE(v17) = 1;
        v52 = *(id **)(a1 + 32);
        if (!v25)
          goto LABEL_72;
        goto LABEL_69;
      }
LABEL_56:
      if (v18)
      {
        v43 = *(_QWORD **)(a1 + 32);
        if (v43)
          v43 = (_QWORD *)v43[65];
        v44 = v43;
        objc_msgSend(v44, "firstObject");
        v45 = (void *)objc_claimAutoreleasedReturnValue();

        v46 = *(_QWORD *)(a1 + 32);
        if (v46)
          v47 = *(void **)(v46 + 520);
        else
          v47 = 0;
        objc_msgSend(v47, "removeObjectAtIndex:", 0, v59);
        v48 = *(_QWORD *)(a1 + 32);
        if (v48)
        {
          v49 = 240;
          if (!*(_QWORD *)(v48 + 240))
            v49 = 232;
          v50 = (_QWORD **)*(id *)(v48 + v49);
        }
        else
        {
          v50 = 0;
        }
        v61[0] = MEMORY[0x1E0C809B0];
        v61[1] = 3221225472;
        v61[2] = __43__NWURLSessionWebSocketTask_receiveMessage__block_invoke_506;
        v61[3] = &unk_1E14ACE18;
        v63 = v45;
        v62 = v18;
        v51 = v45;
        if (v50)
          -[NWURLSessionDelegateQueue runDelegateBlock:](v50[6], v61);

      }
      v52 = *(id **)(a1 + 32);
      if (!v25)
        goto LABEL_72;
LABEL_69:
      if (!v52)
      {
        v58 = 0;
        if ((v17 & 1) == 0)
          goto LABEL_73;
        goto LABEL_86;
      }
      if (!v52[64])
      {
        objc_storeStrong(v52 + 64, v25);
        v52 = *(id **)(a1 + 32);
      }
LABEL_72:
      if ((v17 & 1) == 0)
      {
LABEL_73:
        -[NWURLSessionWebSocketTask processWork](v52);
        goto LABEL_74;
      }
      if (v52)
        v58 = v52[64];
      else
        v58 = 0;
LABEL_86:
      objc_msgSend(v52, "completeTaskWithError:", v58, v59);
LABEL_74:

LABEL_75:
      break;
  }
LABEL_76:

}

uint64_t __43__NWURLSessionWebSocketTask_receiveMessage__block_invoke_506(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

void __51__NWURLSessionWebSocketTask__sendCloseCode_reason___block_invoke(uint64_t a1)
{
  void *v2;
  const char *v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  NSObject *metadata;
  NSObject *v8;
  uint64_t v9;
  _QWORD *v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  _QWORD completion[5];

  objc_msgSend(*(id *)(a1 + 32), "error");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2)
  {
    v4 = *(_QWORD *)(a1 + 32);
    if (v4)
    {
      *(_QWORD *)(v4 + 472) = *(_QWORD *)(a1 + 48);
      v5 = *(void **)(a1 + 32);
      if (v5)
        objc_setProperty_nonatomic_copy(v5, v3, *(id *)(a1 + 40), 480);
    }
    v6 = nw_content_context_create("close");
    nw_content_context_set_is_final(v6, 1);
    metadata = nw_ws_create_metadata(nw_ws_opcode_close);
    v8 = metadata;
    v9 = *(_QWORD *)(a1 + 48);
    if (v9)
      nw_ws_metadata_set_close_code(metadata, (nw_ws_close_code_t)v9);
    nw_content_context_set_metadata_for_protocol(v6, v8);
    v10 = *(_QWORD **)(a1 + 32);
    if (v10)
      v10 = (_QWORD *)v10[62];
    v11 = *(void **)(a1 + 40);
    v12 = v10;
    v13 = objc_msgSend(v11, "_createDispatchData");
    completion[0] = MEMORY[0x1E0C809B0];
    completion[1] = 3221225472;
    completion[2] = __51__NWURLSessionWebSocketTask__sendCloseCode_reason___block_invoke_2;
    completion[3] = &unk_1E14A9B48;
    completion[4] = *(_QWORD *)(a1 + 32);
    nw_connection_send(v12, v13, v6, 1, completion);

  }
}

void __51__NWURLSessionWebSocketTask__sendCloseCode_reason___block_invoke_3(uint64_t a1)
{
  _QWORD *v2;
  const void *v3;
  _QWORD *v4;
  void *v5;

  v2 = *(_QWORD **)(a1 + 32);
  if (v2)
    v2 = (_QWORD *)v2[63];
  v3 = *(const void **)(a1 + 40);
  v4 = v2;
  v5 = _Block_copy(v3);
  objc_msgSend(v4, "addObject:", v5);

  -[NWURLSessionWebSocketTask processWork](*(_QWORD *)(a1 + 32));
}

void __51__NWURLSessionWebSocketTask__sendCloseCode_reason___block_invoke_2(uint64_t a1, void *a2)
{
  void **v3;
  void *v4;
  const char *v5;
  void *v6;
  BOOL v7;
  id v8;

  v8 = a2;
  if (v8)
  {
    v3 = *(void ***)(a1 + 32);
    if (v3)
      v3 = (void **)-[NWURLError initWithNWError:forLoader:andTask:]([NWURLError alloc], v8, v3[32], v3);
  }
  else
  {
    v3 = 0;
  }
  objc_msgSend(*(id *)(a1 + 32), "error");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = *(void **)(a1 + 32);
  if (v4)
    v7 = 1;
  else
    v7 = v3 == 0;
  if (!v7 && v6)
  {
    objc_setProperty_atomic_copy(v6, v5, v3, 136);
    v6 = *(void **)(a1 + 32);
  }
  -[NWURLSessionWebSocketTask checkForCompletion]((uint64_t)v6);

}

- (void)checkForCompletion
{
  void *v2;
  id v3;

  if (a1)
  {
    nw_context_assert_queue(*(void **)(a1 + 304));
    if (*(_QWORD *)(a1 + 280) == 1)
    {
      objc_msgSend((id)a1, "error");
      v2 = (void *)objc_claimAutoreleasedReturnValue();

      if (v2)
      {
        objc_msgSend((id)a1, "error");
        v3 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)a1, "completeTaskWithError:", v3);

      }
    }
  }
}

void __60__NWURLSessionWebSocketTask_sendPingWithPongReceiveHandler___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  NSObject *metadata;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  unsigned int v9;
  NSObject *v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  _QWORD v15[5];
  __int16 buffer;
  _QWORD pong_handler[5];
  id v18;
  _QWORD v19[5];
  NSObject *v20;

  objc_msgSend(*(id *)(a1 + 32), "error");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    -[NWURLSessionTask delegateWrapper](*(_QWORD **)(a1 + 32));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __60__NWURLSessionWebSocketTask_sendPingWithPongReceiveHandler___block_invoke_2;
    v19[3] = &unk_1E14ACE18;
    v14 = *(id *)(a1 + 40);
    v19[4] = *(_QWORD *)(a1 + 32);
    v20 = v14;
    -[NWURLSessionDelegateWrapper runDelegateBlock:]((uint64_t)v13, v19);

    v3 = v20;
  }
  else
  {
    v3 = nw_content_context_create("ping");
    metadata = nw_ws_create_metadata(nw_ws_opcode_ping);
    v5 = *(_QWORD *)(a1 + 32);
    if (v5)
      v6 = *(NSObject **)(v5 + 224);
    else
      v6 = 0;
    v7 = MEMORY[0x1E0C809B0];
    pong_handler[0] = MEMORY[0x1E0C809B0];
    pong_handler[1] = 3221225472;
    pong_handler[2] = __60__NWURLSessionWebSocketTask_sendPingWithPongReceiveHandler___block_invoke_3;
    pong_handler[3] = &unk_1E14A3020;
    pong_handler[4] = v5;
    v18 = *(id *)(a1 + 40);
    nw_ws_metadata_set_pong_handler(metadata, v6, pong_handler);
    nw_content_context_set_metadata_for_protocol(v3, metadata);
    v8 = *(_QWORD *)(a1 + 32);
    if (v8)
    {
      v9 = *(unsigned __int16 *)(v8 + 462);
      *(_WORD *)(v8 + 462) = v9 + 1;
    }
    else
    {
      v9 = 0;
    }
    buffer = __rev16(v9);
    v10 = dispatch_data_create(&buffer, 2uLL, 0, 0);
    v11 = *(_QWORD *)(a1 + 32);
    if (v11)
      v12 = *(NSObject **)(v11 + 496);
    else
      v12 = 0;
    v15[0] = v7;
    v15[1] = 3221225472;
    v15[2] = __60__NWURLSessionWebSocketTask_sendPingWithPongReceiveHandler___block_invoke_5;
    v15[3] = &unk_1E14A9B48;
    v15[4] = v11;
    nw_connection_send(v12, v10, v3, 1, v15);

  }
}

void __60__NWURLSessionWebSocketTask_sendPingWithPongReceiveHandler___block_invoke_6(uint64_t a1)
{
  _QWORD *v2;
  const void *v3;
  _QWORD *v4;
  void *v5;

  v2 = *(_QWORD **)(a1 + 32);
  if (v2)
    v2 = (_QWORD *)v2[63];
  v3 = *(const void **)(a1 + 40);
  v4 = v2;
  v5 = _Block_copy(v3);
  objc_msgSend(v4, "addObject:", v5);

  -[NWURLSessionWebSocketTask processWork](*(_QWORD *)(a1 + 32));
}

void __60__NWURLSessionWebSocketTask_sendPingWithPongReceiveHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "error");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

void __60__NWURLSessionWebSocketTask_sendPingWithPongReceiveHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void **v4;
  void *v5;
  const char *v6;
  BOOL v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD **v10;
  id v11;
  void *v12;
  _QWORD v13[5];
  id v14;

  v3 = a2;
  if (v3)
  {
    v4 = *(void ***)(a1 + 32);
    if (v4)
      v4 = (void **)-[NWURLError initWithNWError:forLoader:andTask:]([NWURLError alloc], v3, v4[32], v4);
  }
  else
  {
    v4 = 0;
  }
  objc_msgSend(*(id *)(a1 + 32), "error");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    v7 = 1;
  else
    v7 = v4 == 0;
  if (v7)
  {
    v8 = *(_QWORD *)(a1 + 32);
    if (!v8)
    {
LABEL_19:
      v10 = 0;
      goto LABEL_14;
    }
  }
  else
  {
    v12 = *(void **)(a1 + 32);
    if (!v12)
      goto LABEL_19;
    objc_setProperty_atomic_copy(v12, v6, v4, 136);
    v8 = *(_QWORD *)(a1 + 32);
    if (!v8)
      goto LABEL_19;
  }
  v9 = 240;
  if (!*(_QWORD *)(v8 + 240))
    v9 = 232;
  v10 = (_QWORD **)*(id *)(v8 + v9);
LABEL_14:
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __60__NWURLSessionWebSocketTask_sendPingWithPongReceiveHandler___block_invoke_4;
  v13[3] = &unk_1E14ACE18;
  v11 = *(id *)(a1 + 40);
  v13[4] = *(_QWORD *)(a1 + 32);
  v14 = v11;
  if (v10)
    -[NWURLSessionDelegateQueue runDelegateBlock:](v10[6], v13);

  -[NWURLSessionWebSocketTask checkForCompletion](*(_QWORD *)(a1 + 32));
}

void __60__NWURLSessionWebSocketTask_sendPingWithPongReceiveHandler___block_invoke_5(uint64_t a1, void *a2)
{
  void **v3;
  void *v4;
  const char *v5;
  void *v6;
  BOOL v7;
  id v8;

  v8 = a2;
  if (v8)
  {
    v3 = *(void ***)(a1 + 32);
    if (v3)
      v3 = (void **)-[NWURLError initWithNWError:forLoader:andTask:]([NWURLError alloc], v8, v3[32], v3);
  }
  else
  {
    v3 = 0;
  }
  objc_msgSend(*(id *)(a1 + 32), "error");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = *(void **)(a1 + 32);
  if (v4)
    v7 = 1;
  else
    v7 = v3 == 0;
  if (!v7 && v6)
  {
    objc_setProperty_atomic_copy(v6, v5, v3, 136);
    v6 = *(void **)(a1 + 32);
  }
  -[NWURLSessionWebSocketTask checkForCompletion]((uint64_t)v6);

}

void __60__NWURLSessionWebSocketTask_sendPingWithPongReceiveHandler___block_invoke_4(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "error");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

void __65__NWURLSessionWebSocketTask_receiveMessageWithCompletionHandler___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  const void *v3;
  _QWORD *v4;
  void *v5;

  v2 = *(_QWORD **)(a1 + 32);
  if (v2)
    v2 = (_QWORD *)v2[65];
  v3 = *(const void **)(a1 + 40);
  v4 = v2;
  v5 = _Block_copy(v3);
  objc_msgSend(v4, "addObject:", v5);

  -[NWURLSessionWebSocketTask processWork](*(_QWORD *)(a1 + 32));
}

void __59__NWURLSessionWebSocketTask_sendMessage_completionHandler___block_invoke(id *a1)
{
  void *v2;
  NSObject *v3;
  NSObject *metadata;
  void *v5;
  void *v6;
  _QWORD *v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  _QWORD v12[5];
  id v13;
  _QWORD v14[5];
  NSObject *v15;

  objc_msgSend(a1[4], "error");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    -[NWURLSessionTask delegateWrapper](a1[4]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __59__NWURLSessionWebSocketTask_sendMessage_completionHandler___block_invoke_2;
    v14[3] = &unk_1E14ACE18;
    v11 = a1[6];
    v14[4] = a1[4];
    v15 = v11;
    -[NWURLSessionDelegateWrapper runDelegateBlock:]((uint64_t)v10, v14);

    v3 = v15;
  }
  else
  {
    v3 = nw_content_context_create("send");
    if (objc_msgSend(a1[5], "type"))
    {
      metadata = nw_ws_create_metadata(nw_ws_opcode_text);
      objc_msgSend(a1[5], "string");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "dataUsingEncoding:", 4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      metadata = nw_ws_create_metadata(nw_ws_opcode_binary);
      objc_msgSend(a1[5], "data");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    nw_content_context_set_metadata_for_protocol(v3, metadata);
    v7 = a1[4];
    if (v7)
      v7 = (_QWORD *)v7[62];
    v8 = v7;
    v9 = objc_msgSend(v6, "_createDispatchData");
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __59__NWURLSessionWebSocketTask_sendMessage_completionHandler___block_invoke_3;
    v12[3] = &unk_1E14A3020;
    v12[4] = a1[4];
    v13 = a1[6];
    nw_connection_send(v8, v9, v3, 1, v12);

  }
}

void __59__NWURLSessionWebSocketTask_sendMessage_completionHandler___block_invoke_5(uint64_t a1)
{
  _QWORD *v2;
  const void *v3;
  _QWORD *v4;
  void *v5;

  v2 = *(_QWORD **)(a1 + 32);
  if (v2)
    v2 = (_QWORD *)v2[63];
  v3 = *(const void **)(a1 + 40);
  v4 = v2;
  v5 = _Block_copy(v3);
  objc_msgSend(v4, "addObject:", v5);

  -[NWURLSessionWebSocketTask processWork](*(_QWORD *)(a1 + 32));
}

void __59__NWURLSessionWebSocketTask_sendMessage_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "error");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

void __59__NWURLSessionWebSocketTask_sendMessage_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void **v4;
  void *v5;
  const char *v6;
  BOOL v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD **v10;
  id v11;
  void *v12;
  _QWORD v13[5];
  id v14;

  v3 = a2;
  if (v3)
  {
    v4 = *(void ***)(a1 + 32);
    if (v4)
      v4 = (void **)-[NWURLError initWithNWError:forLoader:andTask:]([NWURLError alloc], v3, v4[32], v4);
  }
  else
  {
    v4 = 0;
  }
  objc_msgSend(*(id *)(a1 + 32), "error");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    v7 = 1;
  else
    v7 = v4 == 0;
  if (v7)
  {
    v8 = *(_QWORD *)(a1 + 32);
    if (!v8)
    {
LABEL_19:
      v10 = 0;
      goto LABEL_14;
    }
  }
  else
  {
    v12 = *(void **)(a1 + 32);
    if (!v12)
      goto LABEL_19;
    objc_setProperty_atomic_copy(v12, v6, v4, 136);
    v8 = *(_QWORD *)(a1 + 32);
    if (!v8)
      goto LABEL_19;
  }
  v9 = 240;
  if (!*(_QWORD *)(v8 + 240))
    v9 = 232;
  v10 = (_QWORD **)*(id *)(v8 + v9);
LABEL_14:
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __59__NWURLSessionWebSocketTask_sendMessage_completionHandler___block_invoke_4;
  v13[3] = &unk_1E14ACE18;
  v11 = *(id *)(a1 + 40);
  v13[4] = *(_QWORD *)(a1 + 32);
  v14 = v11;
  if (v10)
    -[NWURLSessionDelegateQueue runDelegateBlock:](v10[6], v13);

  -[NWURLSessionWebSocketTask checkForCompletion](*(_QWORD *)(a1 + 32));
}

void __59__NWURLSessionWebSocketTask_sendMessage_completionHandler___block_invoke_4(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "error");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

void __43__NWURLSessionWebSocketTask_startNextLoad___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  _QWORD *v3;
  _QWORD *v4;
  _QWORD v5[5];
  id v6;

  v2 = *(_QWORD **)(a1 + 32);
  if (v2)
    v2 = (_QWORD *)v2[32];
  v3 = v2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __43__NWURLSessionWebSocketTask_startNextLoad___block_invoke_2;
  v5[3] = &unk_1E14A2D48;
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v3;
  v4 = v3;
  objc_msgSend(v4, "readResponse:", v5);

}

void __43__NWURLSessionWebSocketTask_startNextLoad___block_invoke_2(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  _QWORD *v6;
  uint64_t i;
  void *v8;
  const char *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  SEL v16;
  void *v17;
  nw_protocol_options_t options;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  void *v26;
  void *v27;
  void *v28;
  uint64_t HTTPResponse;
  uint64_t v30;
  uint64_t v31;
  id *v32;
  const char *v33;
  id v34;
  void *v35;
  void *v36;
  _QWORD *v37;
  _QWORD *v38;
  _QWORD *v39;
  id v40;
  id v41;
  uint64_t v42;
  id v43;
  id v44;
  NWURLError *v45;
  id v46;
  id v47;
  uint64_t v48;
  NWURLError *v49;
  NWURLError *v50;
  id v51;
  id v52;
  uint64_t v53;
  NWURLError *v54;
  void *v55;
  _BOOL4 v56;
  void *v57;
  void *v58;
  void *v59;
  _QWORD *v60;
  void *v61;
  id newValue;
  id v63;
  _QWORD v64[3];
  char v65;
  unsigned int v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  objc_super v71;
  void *v72;
  void *v73;
  nw_protocol_options_t v74;
  _QWORD *v75;
  id *v76;
  id v77;
  objc_super v78;
  uint64_t v79;

  v79 = *MEMORY[0x1E0C80C00];
  v63 = a2;
  v5 = a3;
  v6 = (_QWORD *)a1[4];
  if (!v6)
    goto LABEL_51;
  for (i = v6[32]; i == a1[5]; i = 0)
  {
    newValue = v5;
    if (v5)
    {
      objc_msgSend(v6, "error");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      v6 = (_QWORD *)a1[4];
      if (!v8)
      {
        if (v6)
        {
          objc_setProperty_atomic_copy(v6, v9, newValue, 136);
          v6 = (_QWORD *)a1[4];
        }
      }
    }
    objc_msgSend(v6, "error");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = a1[4];
    if (v10)
    {
      objc_msgSend((id)a1[4], "error");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v11, "completeTaskWithError:", v58);

      -[NWURLSessionWebSocketTask processWork](a1[4]);
      goto LABEL_47;
    }
    a1 = v63;
    if (!v11)
      goto LABEL_46;
    nw_context_assert_queue(*(void **)(v11 + 304));
    v13 = *(_QWORD *)(v11 + 328);
    if (v13)
    {
      *(_QWORD *)(v11 + 328) = 0;
      nw_queue_cancel_source(v13, v12);
    }
    v14 = *(_QWORD *)(v11 + 312);
    if (v14)
    {
      *(_QWORD *)(v11 + 312) = 0;
      nw_queue_cancel_source(v14, v12);
    }
    v15 = *(_QWORD *)(v11 + 344);
    if (v15)
    {
      *(_QWORD *)(v11 + 344) = 0;
      nw_queue_cancel_source(v15, v12);
    }
    -[NWURLSessionTask updateResponse:](v11, a1);
    objc_setProperty_nonatomic_copy((id)v11, v16, a1, 488);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v45 = [NWURLError alloc];
      v46 = *(id *)(v11 + 256);
      v47 = (id)v11;
      if (v45)
      {
        v48 = *MEMORY[0x1E0CB32E8];
        v78.receiver = v45;
        v78.super_class = (Class)NWURLError;
        v49 = (NWURLError *)objc_msgSendSuper2(&v78, sel_initWithDomain_code_userInfo_, v48, -1011, 0);
        v45 = v49;
        if (v49)
          -[NWURLError fillErrorForLoader:andTask:](v49, "fillErrorForLoader:andTask:", v46, v47);
      }

      objc_msgSend(v47, "completeTaskWithError:", v45);
      -[NWURLSessionWebSocketTask processWork]((uint64_t)v47);
LABEL_46:

LABEL_47:
      v5 = newValue;
      break;
    }
    v60 = a1;
    objc_msgSend((id)v11, "currentRequest");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "valueForHTTPHeaderField:", CFSTR("Sec-WebSocket-Key"));
    v61 = (void *)objc_claimAutoreleasedReturnValue();

    if (v61)
    {
      options = nw_ws_create_options(nw_ws_version_13);
      nw_ws_options_set_permessage_deflate(options, 1);
      nw_ws_options_set_auto_reply_ping(options, 1);
      nw_ws_options_set_skip_handshake(options, 1);
      nw_ws_options_set_maximum_message_size(options, objc_msgSend((id)v11, "maximumMessageSize"));
      objc_msgSend(v60, "valueForHTTPHeaderField:", CFSTR("Sec-WebSocket-Protocol"));
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      if (v59)
      {
        objc_msgSend((id)v11, "currentRequest", v59);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "valueForHTTPHeaderField:", CFSTR("Sec-WebSocket-Protocol"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "componentsSeparatedByString:", CFSTR(","));
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        v69 = 0u;
        v70 = 0u;
        v67 = 0u;
        v68 = 0u;
        v22 = v21;
        v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v67, &v78, 16);
        if (v23)
        {
          v24 = *(_QWORD *)v68;
          do
          {
            for (j = 0; j != v23; ++j)
            {
              if (*(_QWORD *)v68 != v24)
                objc_enumerationMutation(v22);
              v26 = *(void **)(*((_QWORD *)&v67 + 1) + 8 * j);
              objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v26, "stringByTrimmingCharactersInSet:", v27);
              v28 = (void *)objc_claimAutoreleasedReturnValue();

              nw_ws_options_add_subprotocol(options, (const char *)objc_msgSend(v28, "cStringUsingEncoding:", 5));
            }
            v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v67, &v78, 16);
          }
          while (v23);
        }

      }
      HTTPResponse = CFURLResponseGetHTTPResponse();
      v66 = 0;
      if ((nw_ws_validate_server_response_with_protocol_options(HTTPResponse, (uint64_t)v61, options, &v66) & 1) != 0)
      {
        v30 = 240;
        if (!*(_QWORD *)(v11 + 240))
          v30 = 232;
        v31 = *(_QWORD *)(v11 + v30);
        v32 = (id *)(id)v11;
        v34 = v59;
        v35 = (void *)MEMORY[0x1E0C809B0];
        if (v31)
        {
          -[NWURLSessionDelegateWrapper delegateFor_didOpenWithProtocol]((_BYTE *)v31, v33);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          if (v36)
          {
            v37 = *(id *)(v31 + 32);
            v71.receiver = (id)MEMORY[0x1E0C809B0];
            v71.super_class = (Class)3221225472;
            v72 = __65__NWURLSessionDelegateWrapper_webSocketTask_didOpenWithProtocol___block_invoke;
            v73 = &unk_1E14AB4D8;
            v74 = v36;
            v75 = v37;
            v76 = v32;
            v77 = v34;
            v38 = *(_QWORD **)(v31 + 48);
            v39 = v37;
            v35 = (void *)MEMORY[0x1E0C809B0];
            v40 = v39;
            -[NWURLSessionDelegateQueue runDelegateBlock:](v38, &v71);

          }
        }

        v41 = v32[32];
        objc_msgSend(v41, "underlyingConnection");
        v42 = objc_claimAutoreleasedReturnValue();
        v43 = v32[62];
        v32[62] = (id)v42;

        v64[0] = 0;
        v64[1] = v64;
        v64[2] = 0x2020000000;
        v65 = 0;
        v44 = v32[62];
        v71.receiver = v35;
        v71.super_class = (Class)3221225472;
        v72 = __44__NWURLSessionWebSocketTask_handleResponse___block_invoke;
        v73 = &unk_1E14A2FF8;
        v75 = v64;
        v74 = options;
        nw_connection_modify_connected_protocol_stack_internal(v44, &v71, 1);

        -[NWURLSessionWebSocketTask processWork]((uint64_t)v32);
        _Block_object_dispose(v64, 8);
      }
      else
      {
        v50 = [NWURLError alloc];
        v51 = *(id *)(v11 + 256);
        v52 = (id)v11;
        if (v50)
        {
          v53 = *MEMORY[0x1E0CB32E8];
          v71.receiver = v50;
          v71.super_class = (Class)NWURLError;
          v54 = (NWURLError *)objc_msgSendSuper2(&v71, sel_initWithDomain_code_userInfo_, v53, -1011, 0);
          v50 = v54;
          if (v54)
            -[NWURLError fillErrorForLoader:andTask:](v54, "fillErrorForLoader:andTask:", v51, v52);
        }

        -[NWURLError webSocketHandshakeFailureReason](v50, "webSocketHandshakeFailureReason");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        v56 = v55 == 0;

        if (v56)
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v66);
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          -[NWURLError setWebSocketHandshakeFailureReason:](v50, "setWebSocketHandshakeFailureReason:", v57);

        }
        objc_msgSend(v52, "completeTaskWithError:", v50, v59);
        -[NWURLSessionWebSocketTask processWork]((uint64_t)v52);

      }
      goto LABEL_46;
    }
    _os_assert_log();
    v6 = (_QWORD *)_os_crash();
    __break(1u);
LABEL_51:
    ;
  }

}

id __44__NWURLSessionWebSocketTask_handleResponse___block_invoke(uint64_t a1, int a2, uint64_t a3, _DWORD *a4)
{
  uint64_t v4;
  id v5;

  if (a2 || (v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8), *(_BYTE *)(v4 + 24)))
  {
    v5 = 0;
    *a4 = 0;
  }
  else
  {
    *(_BYTE *)(v4 + 24) = 1;
    *a4 = 2;
    v5 = *(id *)(a1 + 32);
  }
  return v5;
}

+ (void)addWebSocketHeadersToRequest:(uint64_t)a1
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _BYTE __buf[16];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  objc_opt_self();
  objc_msgSend(v2, "valueForHTTPHeaderField:", CFSTR("Connection"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    objc_msgSend(v2, "setValue:forHTTPHeaderField:", CFSTR("Upgrade"), CFSTR("Connection"));
  objc_msgSend(v2, "valueForHTTPHeaderField:", CFSTR("Upgrade"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    objc_msgSend(v2, "setValue:forHTTPHeaderField:", CFSTR("websocket"), CFSTR("Upgrade"));
  objc_msgSend(v2, "valueForHTTPHeaderField:", CFSTR("Sec-WebSocket-Version"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    objc_msgSend(v2, "setValue:forHTTPHeaderField:", CFSTR("13"), CFSTR("Sec-WebSocket-Version"));
  objc_msgSend(v2, "valueForHTTPHeaderField:", CFSTR("Sec-WebSocket-Key"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    arc4random_buf(__buf, 0x10uLL);
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", __buf, 16);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "base64EncodedStringWithOptions:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setValue:forHTTPHeaderField:", v8, CFSTR("Sec-WebSocket-Key"));

  }
  objc_msgSend(v2, "valueForHTTPHeaderField:", CFSTR("Sec-WebSocket-Extensions"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
    objc_msgSend(v2, "setValue:forHTTPHeaderField:", CFSTR("permessage-deflate"), CFSTR("Sec-WebSocket-Extensions"));

}

@end
