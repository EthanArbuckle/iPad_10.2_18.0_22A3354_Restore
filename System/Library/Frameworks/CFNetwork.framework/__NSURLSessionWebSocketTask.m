@implementation __NSURLSessionWebSocketTask

- (BOOL)isKindOfClass:(Class)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)__NSURLSessionWebSocketTask;
  if (-[__NSURLSessionWebSocketTask isKindOfClass:](&v5, sel_isKindOfClass_))
    return 1;
  else
    return -[objc_class isEqual:](a3, "isEqual:", objc_opt_class());
}

- (__NSURLSessionWebSocketTask)initWithOriginalRequest:(id)a3 ident:(unint64_t)a4 taskGroup:(id)a5
{
  id v8;
  id v9;
  __NSURLSessionWebSocketTask *v10;
  NSMutableArray *v11;
  NSMutableArray *pendingReceiveWork;
  NSMutableArray *v13;
  NSMutableArray *delegateWork;
  NSError *v15;
  NSError *webSocketError;
  NSMutableArray *v17;
  NSMutableArray *highPriorityPendingWork;
  objc_super v20;

  v8 = a3;
  v9 = a5;
  if (self)
  {
    v20.receiver = self;
    v20.super_class = (Class)__NSURLSessionWebSocketTask;
    v10 = -[__NSCFLocalSessionTask initWithOriginalRequest:ident:taskGroup:](&v20, sel_initWithOriginalRequest_ident_taskGroup_, v8, a4, v9);
    v11 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    pendingReceiveWork = v10->_pendingReceiveWork;
    v10->_pendingReceiveWork = v11;

    v13 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    delegateWork = v10->_delegateWork;
    v10->_delegateWork = v13;

    v15 = (NSError *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    webSocketError = v10->_webSocketError;
    v10->_webSocketError = v15;

    v17 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    highPriorityPendingWork = v10->_highPriorityPendingWork;
    v10->_highPriorityPendingWork = v17;

    *(&v10->_readInProgress + 2) = 0;
    v10->_closeReason = 0;
    v10->_closeCode = 0x100000;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)sendMessage:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  NSObject *v11;
  id v12;
  id v13;
  _QWORD block[5];
  id v15;
  id v16;

  v6 = a3;
  v7 = a4;
  -[NSURLSessionTask session](self, "session");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v8)
    v10 = *(void **)(v8 + 120);
  else
    v10 = 0;
  v11 = v10;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61____NSURLSessionWebSocketTask_sendMessage_completionHandler___block_invoke;
  block[3] = &unk_1E14FE070;
  block[4] = self;
  v15 = v6;
  v16 = v7;
  v12 = v7;
  v13 = v6;
  dispatch_async(v11, block);

}

- (void)receiveMessageWithCompletionHandler:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  NSObject *v8;
  id v9;
  _QWORD v10[5];
  id v11;

  v4 = a3;
  -[NSURLSessionTask session](self, "session");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v5)
    v7 = *(void **)(v5 + 120);
  else
    v7 = 0;
  v8 = v7;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __67____NSURLSessionWebSocketTask_receiveMessageWithCompletionHandler___block_invoke;
  v10[3] = &unk_1E14FDF00;
  v10[4] = self;
  v11 = v4;
  v9 = v4;
  dispatch_async(v8, v10);

}

- (void)sendPingWithPongReceiveHandler:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[NSURLSessionTask workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __62____NSURLSessionWebSocketTask_sendPingWithPongReceiveHandler___block_invoke;
  v7[3] = &unk_1E14FDF00;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)_sendCloseCode:(int64_t)a3 reason:(id)a4
{
  id v6;
  NSObject *v7;
  id v8;
  _QWORD block[5];
  id v10;
  int64_t v11;

  v6 = a4;
  -[NSURLSessionTask workQueue](self, "workQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53____NSURLSessionWebSocketTask__sendCloseCode_reason___block_invoke;
  block[3] = &unk_1E14FD950;
  v10 = v6;
  v11 = a3;
  block[4] = self;
  v8 = v6;
  dispatch_async(v7, block);

}

- (void)cancelWithCloseCode:(int64_t)a3 reason:(id)a4
{
  id v6;
  NSObject *v7;
  id v8;
  _QWORD block[5];
  id v10;
  int64_t v11;

  v6 = a4;
  -[NSURLSessionTask workQueue](self, "workQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58____NSURLSessionWebSocketTask_cancelWithCloseCode_reason___block_invoke;
  block[3] = &unk_1E14FD950;
  v10 = v6;
  v11 = a3;
  block[4] = self;
  v8 = v6;
  dispatch_async(v7, block);

}

- (void)cancel
{
  NSObject *v3;
  _QWORD block[5];

  -[NSURLSessionTask workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37____NSURLSessionWebSocketTask_cancel__block_invoke;
  block[3] = &unk_1E14FE118;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)dealloc
{
  NSObject *v3;
  void *v4;
  objc_super v5;
  uint8_t buf[4];
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  webSocketLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    -[NSURLSessionTask _loggableDescription](self, "_loggableDescription");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v7 = v4;
    _os_log_debug_impl(&dword_183ECA000, v3, OS_LOG_TYPE_DEBUG, "%{public}@ Deallocating", buf, 0xCu);

  }
  v5.receiver = self;
  v5.super_class = (Class)__NSURLSessionWebSocketTask;
  -[__NSCFLocalSessionTask dealloc](&v5, sel_dealloc);
}

- (void)_onqueue_resume
{
  NSObject *v3;
  NSObject *v4;
  objc_super v5;
  uint8_t buf[16];

  -[NSURLSessionTask workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  if (self && *(&self->_readInProgress + 2))
  {
    if (-[NSURLSessionTask state](self, "state") == NSURLSessionTaskStateCompleted
      || -[NSURLSessionTask state](self, "state") == NSURLSessionTaskStateCanceling)
    {
      if (__CFNAPIMisuseFaultLogHandle::onceToken != -1)
        dispatch_once(&__CFNAPIMisuseFaultLogHandle::onceToken, &__block_literal_global_7_4765);
      v4 = (id)__CFNAPIMisuseFaultLogHandle::logger;
      if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_183ECA000, v4, OS_LOG_TYPE_FAULT, "[API MISUSE]: Resuming WebSocket task after task has completed", buf, 2u);
      }

    }
    else
    {
      -[NSURLSessionTask setState:](self, "setState:", 0);
      -[__NSURLSessionWebSocketTask _onqueue_ioTick]((uint64_t)self);
    }
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)__NSURLSessionWebSocketTask;
    -[__NSCFLocalSessionTask _onqueue_resume](&v5, sel__onqueue_resume);
  }
}

- (void)_onqueue_cancel
{
  -[__NSURLSessionWebSocketTask _onqueue_sendCloseCode:reason:cancel:]((uint64_t)self, 0, 0, 1);
}

- (void)_onqueue_didReceiveResponse:(id)a3 completion:(id)a4
{
  NSObject *v6;
  void *v7;
  void *v8;
  char isKindOfClass;
  void *v10;
  nw_protocol_options_t options;
  SEL v12;
  SEL v13;
  NSObject *Property;
  SEL v15;
  NSObject *v16;
  SEL v17;
  SEL v18;
  NSObject *v19;
  void *v20;
  SEL v21;
  SEL v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  void *v31;
  NSObject *v32;
  void *v33;
  id v34;
  void *v35;
  SEL v36;
  NSObject *v37;
  void *v38;
  SEL v39;
  const char *v40;
  NSURLSessionTaskMetrics *v41;
  void *v42;
  id *v43;
  __NSCFURLSessionDelegateWrapper *internalDelegateWrapper;
  __NSCFURLSessionDelegateWrapper *v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  NSString *v51;
  NSString *protocolPicked;
  NSObject *v53;
  id v54;
  void *v55;
  void *v56;
  id v57;
  void (**v58)(id, __int128 *);
  _QWORD v59[5];
  __int128 v60;
  uint64_t v61;
  uint8_t buf[16];
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  uint8_t v67[128];
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  v57 = a3;
  v58 = (void (**)(id, __int128 *))a4;
  -[NSURLSessionTask workQueue](self, "workQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  v61 = 0;
  v60 = xmmword_18411E378;
  v58[2](v58, &v60);
  -[NSURLSessionTask setResponse:](self, "setResponse:", v57);
  if (self)
  {
    -[NSURLSessionTask response](self, "response");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7
      && (-[NSURLSessionTask response](self, "response"),
          v8 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_opt_class(),
          isKindOfClass = objc_opt_isKindOfClass(),
          v8,
          v7,
          (isKindOfClass & 1) != 0))
    {
      -[NSURLSessionTask response](self, "response");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSURLSessionTask currentRequest](self, "currentRequest");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "valueForHTTPHeaderField:", 0x1EDCFD580);
      v56 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v56)
        __assert_rtn("-[__NSURLSessionWebSocketTask _onqueue_validateWebSocketHandshake]", "LocalWebSocketTask.mm", 654, "clientKey");
      options = nw_ws_create_options(nw_ws_version_13);
      objc_setProperty_atomic(self, v12, options, 1024);

      Property = objc_getProperty(self, v13, 1024, 1);
      nw_ws_options_set_auto_reply_ping(Property, 1);
      v16 = objc_getProperty(self, v15, 1024, 1);
      nw_ws_options_set_skip_handshake(v16, 1);
      objc_getProperty(self, v17, 1024, 1);
      nw_ws_options_set_prepend_data();
      v19 = objc_getProperty(self, v18, 1024, 1);
      nw_ws_options_set_maximum_message_size(v19, self->_closeCode);
      objc_msgSend(v55, "valueForHTTPHeaderField:", 0x1EDCFD5B8);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_setProperty_atomic(self, v21, v20, 1016);

      if (objc_getProperty(self, v22, 1016, 1))
      {
        -[NSURLSessionTask currentRequest](self, "currentRequest");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "valueForHTTPHeaderField:", 0x1EDCFD5B8);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "componentsSeparatedByString:", CFSTR(","));
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        v65 = 0u;
        v66 = 0u;
        v63 = 0u;
        v64 = 0u;
        v26 = v25;
        v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v63, v67, 16);
        if (v28)
        {
          v29 = *(_QWORD *)v64;
          do
          {
            for (i = 0; i != v28; ++i)
            {
              if (*(_QWORD *)v64 != v29)
                objc_enumerationMutation(v26);
              v31 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * i);
              v32 = objc_getProperty(self, v27, 1024, 1);
              objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v31, "stringByTrimmingCharactersInSet:", v33);
              v34 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
              nw_ws_options_add_subprotocol(v32, (const char *)objc_msgSend(v34, "UTF8String"));

            }
            v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v63, v67, 16);
          }
          while (v28);
        }

      }
      -[NSURLSessionTask currentRequest](self, "currentRequest");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "valueForHTTPHeaderField:", 0x1EDCFD548);

      objc_getProperty(self, v36, 1024, 1);
      nw_ws_options_set_permessage_deflate();
      -[NSURLSessionTask response](self, "response");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "_inner");

      *(_QWORD *)buf = 0;
      objc_getProperty(self, v39, 1024, 1);
      if ((nw_ws_validate_server_response_with_protocol_options() & 1) != 0)
      {

        if (self->super._connectionForUpgrade.__ptr_)
        {
          if (-[__NSCFLocalSessionTask _needSendingMetrics](self, "_needSendingMetrics"))
          {
            -[__NSCFLocalSessionTask _didSendMetrics](self, "_didSendMetrics");
            v41 = [NSURLSessionTaskMetrics alloc];
            -[NSURLSessionTask _metrics](self, "_metrics");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            v43 = -[NSURLSessionTaskMetrics initWithMetrics:]((id *)&v41->super.isa, v42);

            internalDelegateWrapper = self->super.super._internalDelegateWrapper;
            if (!internalDelegateWrapper)
              internalDelegateWrapper = self->super.super._publicDelegateWrapper;
            v45 = internalDelegateWrapper;
            v59[0] = MEMORY[0x1E0C809B0];
            v59[1] = 3221225472;
            v59[2] = __70____NSURLSessionWebSocketTask__onqueue_didReceiveResponse_completion___block_invoke;
            v59[3] = &unk_1E14FE118;
            v59[4] = self;
            -[__NSCFURLSessionDelegateWrapper task:didFinishCollectingMetrics:completionHandler:]((uint64_t)v45, self, v43, v59);

          }
          else
          {
            v54 = objc_getProperty(self, v40, 1016, 1);
            -[__NSURLSessionWebSocketTask _onqueue_enableWebSocketFraming:]((uint64_t)self, v54);
          }
        }
        else
        {
          if (CFNLog::onceToken != -1)
            dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
          v53 = (id)CFNLog::logger;
          if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)v67 = 0;
            _os_log_error_impl(&dword_183ECA000, v53, OS_LOG_TYPE_ERROR, "Connection not set before response is received, failing task", v67, 2u);
          }

          -[__NSURLSessionWebSocketTask _onqueue_cancelWebSocketTaskWithError:](self, -1005);
        }
      }
      else
      {
        v46 = *(_QWORD *)buf;
        v47 = *MEMORY[0x1E0CB32E8];
        objc_storeStrong((id *)&self->_protocolPicked, -[__NSCFLocalSessionTask error:code:](self, "error:code:", *MEMORY[0x1E0CB32E8], -1011));
        -[NSString userInfo](self->_protocolPicked, "userInfo");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        v49 = (void *)objc_msgSend(v48, "mutableCopy");

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v46);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "setObject:forKeyedSubscript:", v50, CFSTR("_NSURLErrorWebSocketHandshakeFailureReasonKey"));

        objc_msgSend(MEMORY[0x1E0CB39B8], "errorWithDomain:code:userInfo:", v47, -1011, v49);
        v51 = (NSString *)objc_claimAutoreleasedReturnValue();
        protocolPicked = self->_protocolPicked;
        self->_protocolPicked = v51;

        -[__NSURLSessionWebSocketTask _onqueue_ioTick]((uint64_t)self);
      }
    }
    else
    {
      if (CFNLog::onceToken != -1)
        dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
      v37 = (id)CFNLog::logger;
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_183ECA000, v37, OS_LOG_TYPE_ERROR, "No response for Web-Socket Handshake, failing task", buf, 2u);
      }

      -[__NSURLSessionWebSocketTask _onqueue_cancelWebSocketTaskWithError:](self, -1011);
    }
  }

}

- (void)connection:(id)a3 didFinishLoadingWithError:(id)a4
{
  id v5;

  v5 = a4;
  -[__NSURLSessionWebSocketTask _onqueue_cancelWebSocketTaskWithError:](self, objc_msgSend(v5, "code"));

}

- (int64_t)maximumMessageSize
{
  return self->_closeCode;
}

- (void)setMaximumMessageSize:(int64_t)a3
{
  self->_closeCode = a3;
}

- (int64_t)closeCode
{
  return (int64_t)self->_closeReason;
}

- (NSData)closeReason
{
  return (NSData *)objc_getProperty(self, a2, 968, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self[1].super.super.super.isa, 0);
  objc_storeStrong((id *)&self->_wsOptions, 0);
  objc_storeStrong((id *)&self->_protocolPicked, 0);
  objc_storeStrong((id *)&self->_webSocketError, 0);
  objc_storeStrong((id *)&self->_delegateWork, 0);
  objc_storeStrong((id *)&self->_highPriorityPendingWork, 0);
  objc_storeStrong((id *)&self->_pendingReceiveWork, 0);
  objc_storeStrong((id *)&self->_pendingSendWork, 0);
}

- (void)_onqueue_cancelWebSocketTaskWithError:(_QWORD *)a1
{
  id v3;
  void *v4;

  if (a1)
  {
    v3 = (id)objc_msgSend(a1, "error:code:", *MEMORY[0x1E0CB32E8], a2);
    v4 = (void *)a1[126];
    a1[126] = v3;

    -[__NSURLSessionWebSocketTask _onqueue_ioTick]((uint64_t)a1);
  }
}

- (void)_onqueue_ioTick
{
  NSObject *v2;
  int v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void (**v9)(void);
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  void (**v15)(void);
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t k;
  void (**v21)(void);
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t n;
  void (**v26)(void);
  void *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t ii;
  void (**v32)(void);
  void (**v33)(_QWORD);
  void *v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t jj;
  void (**v39)(void);
  NSObject *v40;
  uint64_t v41;
  std::__shared_weak_count *v42;
  unint64_t *p_shared_owners;
  unint64_t v44;
  NSObject *v45;
  unint64_t *v46;
  unint64_t v47;
  std::__shared_weak_count *v48;
  unint64_t *v49;
  unint64_t v50;
  unint64_t *v51;
  unint64_t v52;
  void *v53;
  id v54;
  uint64_t v55;
  void *v56;
  uint64_t v57;
  int v58;
  void *v59;
  void *v60;
  id v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t m;
  void (**v65)(void);
  NSObject *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  _BYTE v99[128];
  _BYTE v100[128];
  _BYTE v101[128];
  _BYTE v102[128];
  _BYTE v103[128];
  _BYTE v104[128];
  _BYTE v105[128];
  __int128 block;
  uint64_t (*v107)(uint64_t);
  void *v108;
  uint64_t v109;
  std::__shared_weak_count *v110;
  uint64_t v111;

  v111 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return;
  objc_msgSend((id)a1, "workQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v2);

  if (objc_msgSend((id)a1, "state") == 3)
  {
    v3 = dyld_program_sdk_at_least();
    v4 = *(void **)(a1 + 992);
    if (v3)
    {
      v69 = (void *)objc_msgSend(v4, "copy");
      objc_msgSend(*(id *)(a1 + 992), "removeAllObjects");
      v97 = 0u;
      v98 = 0u;
      v95 = 0u;
      v96 = 0u;
      v5 = v69;
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v95, v105, 16);
      if (v6)
      {
        v7 = *(_QWORD *)v96;
        do
        {
          for (i = 0; i != v6; ++i)
          {
            if (*(_QWORD *)v96 != v7)
              objc_enumerationMutation(v5);
            v9 = (void (**)(void))_Block_copy(*(const void **)(*((_QWORD *)&v95 + 1) + 8 * i));
            v9[2]();

          }
          v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v95, v105, 16);
        }
        while (v6);
      }

      v10 = (void *)objc_msgSend(*(id *)(a1 + 976), "copy");
      objc_msgSend(*(id *)(a1 + 976), "removeAllObjects");
      v93 = 0u;
      v94 = 0u;
      v91 = 0u;
      v92 = 0u;
      v11 = v10;
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v91, v104, 16);
      if (v12)
      {
        v13 = *(_QWORD *)v92;
        do
        {
          for (j = 0; j != v12; ++j)
          {
            if (*(_QWORD *)v92 != v13)
              objc_enumerationMutation(v11);
            v15 = (void (**)(void))_Block_copy(*(const void **)(*((_QWORD *)&v91 + 1) + 8 * j));
            v15[2]();

          }
          v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v91, v104, 16);
        }
        while (v12);
      }

      v16 = (void *)objc_msgSend(*(id *)(a1 + 984), "copy");
      objc_msgSend(*(id *)(a1 + 984), "removeAllObjects");
      v89 = 0u;
      v90 = 0u;
      v87 = 0u;
      v88 = 0u;
      v17 = v16;
      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v87, v103, 16);
      if (v18)
      {
        v19 = *(_QWORD *)v88;
        do
        {
          for (k = 0; k != v18; ++k)
          {
            if (*(_QWORD *)v88 != v19)
              objc_enumerationMutation(v17);
            v21 = (void (**)(void))_Block_copy(*(const void **)(*((_QWORD *)&v87 + 1) + 8 * k));
            v21[2]();

          }
          v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v87, v103, 16);
        }
        while (v18);
      }

    }
    else
    {
      objc_msgSend(v4, "removeAllObjects");
      objc_msgSend(*(id *)(a1 + 976), "removeAllObjects");
      objc_msgSend(*(id *)(a1 + 984), "removeAllObjects");
    }
    v58 = dyld_program_sdk_at_least();
    v59 = *(void **)(a1 + 1000);
    if (v58)
    {
      v60 = (void *)objc_msgSend(v59, "copy");
      objc_msgSend(*(id *)(a1 + 1000), "removeAllObjects");
      v85 = 0u;
      v86 = 0u;
      v83 = 0u;
      v84 = 0u;
      v61 = v60;
      v62 = objc_msgSend(v61, "countByEnumeratingWithState:objects:count:", &v83, v102, 16);
      if (v62)
      {
        v63 = *(_QWORD *)v84;
        do
        {
          for (m = 0; m != v62; ++m)
          {
            if (*(_QWORD *)v84 != v63)
              objc_enumerationMutation(v61);
            v65 = (void (**)(void))_Block_copy(*(const void **)(*((_QWORD *)&v83 + 1) + 8 * m));
            v65[2]();

          }
          v62 = objc_msgSend(v61, "countByEnumeratingWithState:objects:count:", &v83, v102, 16);
        }
        while (v62);
      }

    }
    else
    {
      objc_msgSend(v59, "removeAllObjects");
    }
    return;
  }
  if (objc_msgSend((id)a1, "state") && objc_msgSend((id)a1, "state") != 2)
  {
    webSocketLog();
    v66 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v66, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend((id)a1, "_loggableDescription");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(block) = 138412290;
      *(_QWORD *)((char *)&block + 4) = v67;
      _os_log_debug_impl(&dword_183ECA000, v66, OS_LOG_TYPE_DEBUG, "%@ is not yet connected or suspended. Deferring work", (uint8_t *)&block, 0xCu);

    }
    goto LABEL_100;
  }
  if (!*(_BYTE *)(a1 + 939) && !*(_QWORD *)(a1 + 1008))
  {
    webSocketLog();
    v66 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v66, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend((id)a1, "_loggableDescription");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(block) = 138412290;
      *(_QWORD *)((char *)&block + 4) = v68;
      _os_log_debug_impl(&dword_183ECA000, v66, OS_LOG_TYPE_DEBUG, "%@ handshake not yet complete. Deferring work", (uint8_t *)&block, 0xCu);

    }
LABEL_100:

    return;
  }
  v70 = (void *)objc_msgSend(*(id *)(a1 + 992), "copy");
  objc_msgSend(*(id *)(a1 + 992), "removeAllObjects");
  v81 = 0u;
  v82 = 0u;
  v79 = 0u;
  v80 = 0u;
  v22 = v70;
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v79, v101, 16);
  if (v23)
  {
    v24 = *(_QWORD *)v80;
    do
    {
      for (n = 0; n != v23; ++n)
      {
        if (*(_QWORD *)v80 != v24)
          objc_enumerationMutation(v22);
        v26 = (void (**)(void))_Block_copy(*(const void **)(*((_QWORD *)&v79 + 1) + 8 * n));
        v26[2]();

      }
      v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v79, v101, 16);
    }
    while (v23);
  }

  v27 = (void *)objc_msgSend(*(id *)(a1 + 1000), "copy");
  objc_msgSend(*(id *)(a1 + 1000), "removeAllObjects");
  v77 = 0u;
  v78 = 0u;
  v75 = 0u;
  v76 = 0u;
  v28 = v27;
  v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v75, v100, 16);
  if (v29)
  {
    v30 = *(_QWORD *)v76;
    do
    {
      for (ii = 0; ii != v29; ++ii)
      {
        if (*(_QWORD *)v76 != v30)
          objc_enumerationMutation(v28);
        v32 = (void (**)(void))_Block_copy(*(const void **)(*((_QWORD *)&v75 + 1) + 8 * ii));
        v32[2]();

      }
      v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v75, v100, 16);
    }
    while (v29);
  }

  if (!*(_BYTE *)(a1 + 940))
  {
    objc_msgSend(*(id *)(a1 + 984), "firstObject");
    v33 = (void (**)(_QWORD))objc_claimAutoreleasedReturnValue();
    if (v33)
    {
      objc_msgSend(*(id *)(a1 + 984), "removeObjectAtIndex:", 0);
      v33[2](v33);
    }

  }
  v34 = (void *)objc_msgSend(*(id *)(a1 + 976), "copy");
  objc_msgSend(*(id *)(a1 + 976), "removeAllObjects");
  v73 = 0u;
  v74 = 0u;
  v71 = 0u;
  v72 = 0u;
  v35 = v34;
  v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v71, v99, 16);
  if (v36)
  {
    v37 = *(_QWORD *)v72;
    do
    {
      for (jj = 0; jj != v36; ++jj)
      {
        if (*(_QWORD *)v72 != v37)
          objc_enumerationMutation(v35);
        v39 = (void (**)(void))_Block_copy(*(const void **)(*((_QWORD *)&v71 + 1) + 8 * jj));
        v39[2]();

      }
      v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v71, v99, 16);
    }
    while (v36);
  }

  objc_msgSend((id)a1, "workQueue");
  v40 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v40);

  if (*(_QWORD *)(a1 + 1008) || objc_msgSend((id)a1, "closeCode"))
  {
    v41 = *(_QWORD *)(a1 + 888);
    v42 = *(std::__shared_weak_count **)(a1 + 896);
    if (v42)
    {
      p_shared_owners = (unint64_t *)&v42->__shared_owners_;
      do
        v44 = __ldxr(p_shared_owners);
      while (__stxr(v44 + 1, p_shared_owners));
    }
    if (v41)
    {
      v45 = *(NSObject **)(v41 + 120);
      if (v45)
        dispatch_retain(*(dispatch_object_t *)(v41 + 120));
      *(_QWORD *)&block = MEMORY[0x1E0C809B0];
      *((_QWORD *)&block + 1) = 3321888768;
      v107 = __58____NSURLSessionWebSocketTask__onqueue_checkForCompletion__block_invoke;
      v108 = &__block_descriptor_48_ea8_32c47_ZTSNSt3__110shared_ptrI19TransportConnectionEE_e5_v8__0l;
      v109 = v41;
      v110 = v42;
      if (v42)
      {
        v46 = (unint64_t *)&v42->__shared_owners_;
        do
          v47 = __ldxr(v46);
        while (__stxr(v47 + 1, v46));
      }
      dispatch_async(v45, &block);

      v48 = v110;
      if (v110)
      {
        v49 = (unint64_t *)&v110->__shared_owners_;
        do
          v50 = __ldaxr(v49);
        while (__stlxr(v50 - 1, v49));
        if (!v50)
        {
          ((void (*)(std::__shared_weak_count *))v48->__on_zero_shared)(v48);
          std::__shared_weak_count::__release_weak(v48);
        }
      }
    }
    if (v42)
    {
      v51 = (unint64_t *)&v42->__shared_owners_;
      do
        v52 = __ldaxr(v51);
      while (__stlxr(v52 - 1, v51));
      if (!v52)
      {
        ((void (*)(std::__shared_weak_count *))v42->__on_zero_shared)(v42);
        std::__shared_weak_count::__release_weak(v42);
      }
    }
    if (*(_QWORD *)(a1 + 960))
    {
      v53 = *(void **)(a1 + 704);
      if (!v53)
        v53 = *(void **)(a1 + 696);
      v54 = v53;
      v55 = objc_msgSend((id)a1, "closeCode");
      objc_msgSend((id)a1, "closeReason");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      -[__NSCFURLSessionDelegateWrapper webSocketTask:didCloseWithCode:reason:]((uint64_t)v54, (void *)a1, v55, v56);

      v57 = 0;
    }
    else
    {
      v57 = *(_QWORD *)(a1 + 1008);
    }
    objc_msgSend((id)a1, "_onqueue_cancel_with_error:", v57);
  }

}

- (void)_onqueue_enableWebSocketFraming:(uint64_t)a1
{
  id v3;
  NSObject *v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  id location[7];
  __int128 buf;
  uint64_t v16;
  char v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1)
  {
    objc_msgSend((id)a1, "workQueue");
    v4 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v4);

    v5 = *(void **)(a1 + 704);
    if (!v5)
      v5 = *(void **)(a1 + 696);
    v6 = v5;
    -[__NSCFURLSessionDelegateWrapper webSocketTask:didOpenWithProtocol:]((uint64_t)v6, (void *)a1, v3);

    webSocketLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend((id)a1, "_loggableDescription");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf) = 138543362;
      *(_QWORD *)((char *)&buf + 4) = v11;
      _os_log_debug_impl(&dword_183ECA000, v7, OS_LOG_TYPE_DEBUG, "%{public}@ handshake successful", (uint8_t *)&buf, 0xCu);

    }
    v8 = (void *)(*(uint64_t (**)(_QWORD))(**(_QWORD **)(a1 + 888) + 424))(*(_QWORD *)(a1 + 888));
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v16 = 0x2020000000;
    v17 = 0;
    v9 = MEMORY[0x1E0C809B0];
    location[1] = (id)MEMORY[0x1E0C809B0];
    location[2] = (id)3221225472;
    location[3] = __63____NSURLSessionWebSocketTask__onqueue_enableWebSocketFraming___block_invoke;
    location[4] = &unk_1E14FC8A0;
    location[5] = (id)a1;
    location[6] = &buf;
    nw_connection_modify_connected_protocol_stack();
    objc_initWeak(location, (id)a1);
    v10 = *(_QWORD *)(a1 + 888);
    v12[0] = v9;
    v12[1] = 3221225472;
    v12[2] = __63____NSURLSessionWebSocketTask__onqueue_enableWebSocketFraming___block_invoke_2;
    v12[3] = &unk_1E14FC8C8;
    objc_copyWeak(&v13, location);
    (*(void (**)(uint64_t, uint64_t, _QWORD *))(*(_QWORD *)v10 + 200))(v10, 0x1EDCFA2C0, v12);
    *(_BYTE *)(a1 + 939) = 1;
    -[__NSURLSessionWebSocketTask _onqueue_ioTick](a1);
    objc_destroyWeak(&v13);
    objc_destroyWeak(location);
    _Block_object_dispose(&buf, 8);

  }
}

- (void)_onqueue_sendCloseCode:(void *)a3 reason:(int)a4 cancel:
{
  id v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *metadata;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  id v15;
  _QWORD v16[6];

  v8 = a3;
  if (a1)
  {
    objc_msgSend((id)a1, "workQueue");
    v9 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v9);

    if (!*(_QWORD *)(a1 + 1008))
    {
      if (a4)
      {
        *(_QWORD *)(a1 + 960) = a2;
        objc_storeStrong((id *)(a1 + 968), a3);
        objc_storeStrong((id *)(a1 + 1008), (id)objc_msgSend((id)a1, "error:code:", *MEMORY[0x1E0CB32E8], -999));
      }
      v10 = nw_content_context_create("websocketCloseWithCodeAndReason");
      nw_content_context_set_is_final(v10, 1);
      metadata = nw_ws_create_metadata(nw_ws_opcode_close);
      v12 = metadata;
      if (a2)
        nw_ws_metadata_set_close_code(metadata, (nw_ws_close_code_t)a2);
      nw_content_context_set_metadata_for_protocol(v10, v12);
      v13 = (*(uint64_t (**)(_QWORD))(**(_QWORD **)(a1 + 888) + 424))(*(_QWORD *)(a1 + 888));
      if (v8)
      {
        v14 = objc_msgSend(v8, "_createDispatchData");
      }
      else
      {
        v14 = MEMORY[0x1E0C80D00];
        v15 = MEMORY[0x1E0C80D00];
      }
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __68____NSURLSessionWebSocketTask__onqueue_sendCloseCode_reason_cancel___block_invoke;
      v16[3] = &unk_1E14FC990;
      v16[4] = a1;
      v16[5] = a2;
      nw_connection_send(v13, v14, v10, 1, v16);

    }
  }

}

- (void)_onqueue_receiveMessageWithCompletionHandler:(uint64_t)a1
{
  id v3;
  NSObject *v4;
  SEL v5;
  id v6;
  void *v7;
  NSObject *v8;
  _QWORD v9[5];
  id v10;
  _QWORD v11[4];
  id v12;
  NSObject *v13;

  v3 = a2;
  if (a1)
  {
    objc_msgSend((id)a1, "workQueue");
    v4 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v4);

    v6 = objc_getProperty((id)a1, v5, 1008, 1);
    if (v6)
    {
      objc_msgSend((id)a1, "session");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __76____NSURLSessionWebSocketTask__onqueue_receiveMessageWithCompletionHandler___block_invoke;
      v11[3] = &unk_1E14FDF00;
      v13 = v3;
      v12 = v6;
      -[NSURLSession runDelegateBlock:]((uint64_t)v7, v11);

      v8 = v13;
    }
    else
    {
      *(_BYTE *)(a1 + 940) = 1;
      v8 = (*(uint64_t (**)(_QWORD))(**(_QWORD **)(a1 + 888) + 424))(*(_QWORD *)(a1 + 888));
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __76____NSURLSessionWebSocketTask__onqueue_receiveMessageWithCompletionHandler___block_invoke_2;
      v9[3] = &unk_1E14FC968;
      v9[4] = a1;
      v10 = v3;
      nw_connection_receive_message(v8, v9);

    }
  }

}

@end
