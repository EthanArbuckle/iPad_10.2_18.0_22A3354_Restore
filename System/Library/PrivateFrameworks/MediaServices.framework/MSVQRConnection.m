@implementation MSVQRConnection

- (MSVQRConnection)initWithDataSource:(id)a3 messageCoder:(id)a4
{
  id v8;
  id v9;
  MSVQRConnection *v10;
  NSObject *v11;
  dispatch_queue_t v12;
  OS_dispatch_queue *queue;
  NSObject *v14;
  dispatch_queue_t v15;
  OS_dispatch_queue *delegateQueue;
  void *v17;
  uint64_t v18;
  OS_nw_protocol_definition *framerDefinition;
  void *v21;
  void *v22;
  objc_super v23;

  v8 = a3;
  v9 = a4;
  v23.receiver = self;
  v23.super_class = (Class)MSVQRConnection;
  v10 = -[MSVQRConnection init](&v23, sel_init);
  if (v10)
  {
    if (v8)
    {
      if (v9)
      {
LABEL_4:
        dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
        v11 = objc_claimAutoreleasedReturnValue();
        v12 = dispatch_queue_create("com.apple.amp.mediaservices.MSVQRConnection.serialQueue", v11);
        queue = v10->_queue;
        v10->_queue = (OS_dispatch_queue *)v12;

        dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
        v14 = objc_claimAutoreleasedReturnValue();
        v15 = dispatch_queue_create("com.apple.amp.mediaservices.MSVQRConnection.delegateQueue", v14);
        delegateQueue = v10->_delegateQueue;
        v10->_delegateQueue = (OS_dispatch_queue *)v15;

        v10->_state = 0;
        v10->_shouldTerminate = 0;
        objc_storeStrong((id *)&v10->_dataSource, a3);
        objc_storeStrong((id *)&v10->_messageCoder, a4);
        -[MSVQRConnectionSessionDataSource applicationProtocol](v10->_dataSource, "applicationProtocol");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        +[MSVQRConnection createFramerDefinitionWithIdentifier:](MSVQRConnection, "createFramerDefinitionWithIdentifier:", v17);
        v18 = objc_claimAutoreleasedReturnValue();
        framerDefinition = v10->_framerDefinition;
        v10->_framerDefinition = (OS_nw_protocol_definition *)v18;

        goto LABEL_5;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, v10, CFSTR("MSVQRConnection.m"), 135, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("dataSource"));

      if (v9)
        goto LABEL_4;
    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, v10, CFSTR("MSVQRConnection.m"), 136, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("coder"));

    goto LABEL_4;
  }
LABEL_5:

  return v10;
}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[4];
  MSVQRConnection *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = os_log_create("com.apple.amp.MediaServices", "QuickRelay");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v6 = self;
    _os_log_impl(&dword_1A077D000, v3, OS_LOG_TYPE_DEFAULT, "[MSVQRConnection] <%p> Deallocating.", buf, 0xCu);
  }

  -[MSVQRConnection _clearState](self, "_clearState");
  v4.receiver = self;
  v4.super_class = (Class)MSVQRConnection;
  -[MSVQRConnection dealloc](&v4, sel_dealloc);
}

- (void)start
{
  NSObject *v2;
  void *v3;
  void *v4;
  MSVQRConnection *obj;
  uint8_t buf[4];
  MSVQRConnection *v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  obj = self;
  objc_sync_enter(obj);
  if (-[MSVQRConnection state](obj, "state"))
  {
    objc_sync_exit(obj);

  }
  else
  {
    -[MSVQRConnection setState:](obj, "setState:", 2);
    objc_sync_exit(obj);

    v2 = os_log_create("com.apple.amp.MediaServices", "QuickRelay");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      -[MSVQRConnection dataSource](obj, "dataSource");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218242;
      v7 = obj;
      v8 = 2112;
      v9 = v3;
      _os_log_impl(&dword_1A077D000, v2, OS_LOG_TYPE_DEFAULT, "[MSVQRConnection] <%p> Starting with data source: %@.", buf, 0x16u);

    }
    -[MSVQRConnection report](obj, "report");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "startEvent:", CFSTR("Connection"));

    -[MSVQRConnection _createGroupSession](obj, "_createGroupSession");
  }
}

- (void)stop
{
  MSVQRConnection *obj;

  obj = self;
  objc_sync_enter(obj);
  if (-[MSVQRConnection state](obj, "state"))
  {
    if (-[MSVQRConnection state](obj, "state") == 3)
      -[MSVQRConnection _terminateWithError:](obj, "_terminateWithError:", 0);
    else
      -[MSVQRConnection setShouldTerminate:](obj, "setShouldTerminate:", 1);
  }
  objc_sync_exit(obj);

}

- (void)sendMessage:(id)a3
{
  id v5;
  MSVQRConnection *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  __CFString *v11;
  __CFString *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  id v16;
  const void *v17;
  size_t v18;
  NSObject *v19;
  NSObject *v20;
  NSObject *v21;
  NSObject *v22;
  NSObject *message;
  void *v24;
  NSObject *v25;
  unint64_t v26;
  __CFString *v27;
  void *v28;
  _QWORD completion[4];
  id v30;
  const __CFString *v31;
  const __CFString *v32;
  uint8_t buf[4];
  MSVQRConnection *v34;
  __int16 v35;
  __CFString *v36;
  __int16 v37;
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MSVQRConnection.m"), 182, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("message"));

  }
  v6 = self;
  objc_sync_enter(v6);
  if (-[MSVQRConnection state](v6, "state") == 3)
  {
    -[MSVQRConnection connection](v6, "connection");
    v7 = objc_claimAutoreleasedReturnValue();
    objc_sync_exit(v6);

    -[MSVQRConnection messageCoder](v6, "messageCoder");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "traceIdentifierForMessage:", v5);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    v11 = CFSTR("no-trace");
    if (v9)
      v11 = (__CFString *)v9;
    v12 = v11;

    v13 = os_log_create("com.apple.amp.MediaServices", "QuickRelay_Oversize");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218499;
      v34 = v6;
      v35 = 2114;
      v36 = v12;
      v37 = 2113;
      v38 = v5;
      _os_log_impl(&dword_1A077D000, v13, OS_LOG_TYPE_DEFAULT, "[MSVQRConnection] <%p> Sending message: [%{public}@]%{private}@", buf, 0x20u);
    }

    -[MSVQRConnection messageCoder](v6, "messageCoder");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "dataFromMessage:", v5);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = objc_retainAutorelease(v15);
    v17 = (const void *)objc_msgSend(v16, "bytes");
    v18 = objc_msgSend(v16, "length");
    -[MSVQRConnection queue](v6, "queue");
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = dispatch_data_create(v17, v18, v19, 0);

    v21 = nw_content_context_create("MessageContext");
    -[MSVQRConnection framerDefinition](v6, "framerDefinition");
    v22 = objc_claimAutoreleasedReturnValue();
    message = nw_framer_protocol_create_message(v22);

    v31 = CFSTR("MessageTypeKey");
    v32 = CFSTR("Proto");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v32, &v31, 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    nw_framer_message_set_object_value(message, "Header", v24);

    nw_content_context_set_metadata_for_protocol(v21, message);
    objc_initWeak((id *)buf, v6);
    completion[0] = MEMORY[0x1E0C809B0];
    completion[1] = 3221225472;
    completion[2] = __31__MSVQRConnection_sendMessage___block_invoke;
    completion[3] = &unk_1E43E9768;
    objc_copyWeak(&v30, (id *)buf);
    nw_connection_send(v7, v20, v21, 1, completion);
    objc_destroyWeak(&v30);
    objc_destroyWeak((id *)buf);

    v6 = (MSVQRConnection *)v7;
  }
  else
  {
    v25 = os_log_create("com.apple.amp.MediaServices", "QuickRelay_Oversize");
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      v26 = -[MSVQRConnection state](v6, "state");
      if (v26 >= 4)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("UnexpectedState-%ld"), v26);
        v27 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v27 = off_1E43E9A60[v26];
      }
      *(_DWORD *)buf = 134218498;
      v34 = v6;
      v35 = 2114;
      v36 = v27;
      v37 = 2114;
      v38 = v5;
      _os_log_impl(&dword_1A077D000, v25, OS_LOG_TYPE_ERROR, "[MSVQRConnection] <%p> Connection in state %{public}@ cannot send message: %{public}@", buf, 0x20u);

    }
    objc_sync_exit(v6);
  }

}

- (void)_terminateWithError:(id)a3
{
  id v4;
  MSVQRConnection *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  id v9;
  void *v10;
  NSObject *v11;
  _QWORD block[4];
  id v13;
  MSVQRConnection *v14;
  id v15;
  uint8_t buf[4];
  MSVQRConnection *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  if (-[MSVQRConnection state](v5, "state") == 1 || !-[MSVQRConnection state](v5, "state"))
  {
    objc_sync_exit(v5);

  }
  else
  {
    if (-[MSVQRConnection state](v5, "state") == 2)
    {
      -[MSVQRConnection report](v5, "report");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "endEvent:withError:", CFSTR("Connection"), v4);

    }
    -[MSVQRConnection setState:](v5, "setState:", 1);
    objc_sync_exit(v5);

    v7 = os_log_create("com.apple.amp.MediaServices", "QuickRelay");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      v17 = v5;
      v18 = 2114;
      v19 = v4;
      _os_log_impl(&dword_1A077D000, v7, OS_LOG_TYPE_DEFAULT, "[MSVQRConnection] <%p> Terminating with error %{public}@", buf, 0x16u);
    }

    if (-[MSVQRConnection shouldTerminate](v5, "shouldTerminate"))
      v8 = 0;
    else
      v8 = v4;
    v9 = v8;
    -[MSVQRConnection _clearState](v5, "_clearState");
    -[MSVQRConnection setState:](v5, "setState:", 0);
    -[MSVQRConnection delegate](v5, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      -[MSVQRConnection delegateQueue](v5, "delegateQueue");
      v11 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __39__MSVQRConnection__terminateWithError___block_invoke;
      block[3] = &unk_1E43E9790;
      v13 = v10;
      v14 = v5;
      v15 = v9;
      dispatch_async(v11, block);

    }
  }

}

- (void)_clearState
{
  void *v3;
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  MSVQRConnection *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  -[MSVQRConnection setGuard:](self, "setGuard:", 0);
  -[MSVQRConnection connection](self, "connection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = os_log_create("com.apple.amp.MediaServices", "QuickRelay");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 134217984;
      v12 = self;
      _os_log_impl(&dword_1A077D000, v4, OS_LOG_TYPE_DEFAULT, "[MSVQRConnection] <%p> Clear connection.", (uint8_t *)&v11, 0xCu);
    }

    -[MSVQRConnection connection](self, "connection");
    v5 = objc_claimAutoreleasedReturnValue();
    nw_connection_set_state_changed_handler(v5, &__block_literal_global_4117);

    -[MSVQRConnection connection](self, "connection");
    v6 = objc_claimAutoreleasedReturnValue();
    nw_connection_cancel(v6);

    -[MSVQRConnection setConnection:](self, "setConnection:", 0);
  }
  -[MSVQRConnection session](self, "session");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = os_log_create("com.apple.amp.MediaServices", "QuickRelay");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 134217984;
      v12 = self;
      _os_log_impl(&dword_1A077D000, v8, OS_LOG_TYPE_DEFAULT, "[MSVQRConnection] <%p> Clear group session.", (uint8_t *)&v11, 0xCu);
    }

    -[MSVQRConnection session](self, "session");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "leaveGroupSession");

    -[MSVQRConnection session](self, "session");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "invalidate");

    -[MSVQRConnection setSession:](self, "setSession:", 0);
  }
  -[MSVQRConnection setShouldTerminate:](self, "setShouldTerminate:", 0);
}

- (void)_createGroupSession
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  MSVBlockGuard *v13;
  MSVBlockGuard *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  _QWORD v23[5];
  id v24;
  id location;
  uint64_t v26;
  void *v27;
  uint8_t buf[4];
  MSVQRConnection *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  -[MSVQRConnection dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "account");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = objc_alloc(MEMORY[0x1E0D342F8]);
    -[MSVQRConnection dataSource](self, "dataSource");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "account");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSVQRConnection dataSource](self, "dataSource");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "groupSessionOptions");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v5, "initWithAccount:options:", v7, v9);
    -[MSVQRConnection setSession:](self, "setSession:", v10);

    -[MSVQRConnection session](self, "session");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSVQRConnection queue](self, "queue");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setDelegate:queue:", self, v12);

    objc_initWeak(&location, self);
    v13 = [MSVBlockGuard alloc];
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __38__MSVQRConnection__createGroupSession__block_invoke;
    v23[3] = &unk_1E43E97F8;
    v23[4] = self;
    objc_copyWeak(&v24, &location);
    v14 = -[MSVBlockGuard initWithTimeout:interruptionHandler:](v13, "initWithTimeout:interruptionHandler:", v23, 20.0);
    -[MSVQRConnection setGuard:](self, "setGuard:", v14);

    v15 = os_log_create("com.apple.amp.MediaServices", "QuickRelay");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      -[MSVQRConnection dataSource](self, "dataSource");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "groupSessionIdentifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218242;
      v29 = self;
      v30 = 2114;
      v31 = v17;
      _os_log_impl(&dword_1A077D000, v15, OS_LOG_TYPE_DEFAULT, "[MSVQRConnection] <%p> Joining group session with sessionID: %{public}@.", buf, 0x16u);

    }
    -[MSVQRConnection report](self, "report");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "startEvent:withParentEvent:", CFSTR("Join Group Session"), CFSTR("Connection"));

    -[MSVQRConnection session](self, "session");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = *MEMORY[0x1E0D34268];
    objc_msgSend(MEMORY[0x1E0C99D50], "data");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v20;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "joinWithOptions:", v21);

    objc_destroyWeak(&v24);
    objc_destroyWeak(&location);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "msv_errorWithDomain:code:debugDescription:", CFSTR("MSVQRConnectionError"), 100, CFSTR("No account in data source, cannot create group session."));
    v22 = (id)objc_claimAutoreleasedReturnValue();
    -[MSVQRConnection _terminateWithError:](self, "_terminateWithError:", v22);

  }
}

- (void)session:(id)a3 didRegisterPluginAllocationInfo:(id)a4
{
  void *v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  int v11;
  MSVQRConnection *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E0D34048]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = os_log_create("com.apple.amp.MediaServices", "QuickRelay");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 134218242;
    v12 = self;
    v13 = 2114;
    v14 = v5;
    _os_log_impl(&dword_1A077D000, v6, OS_LOG_TYPE_DEFAULT, "[MSVQRConnection] <%p> Registered plugin allocation info. Participant ID: %{public}@", (uint8_t *)&v11, 0x16u);
  }

  -[MSVQRConnection guard](self, "guard");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "disarm");

  if (v8)
  {
    -[MSVQRConnection report](self, "report");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "endEvent:withError:", CFSTR("Register Plugin"), 0);

    -[MSVQRConnection setGuard:](self, "setGuard:", 0);
    if (v5)
    {
      -[MSVQRConnection setParticipantIdentifier:](self, "setParticipantIdentifier:", v5);
      -[MSVQRConnection _createQuicConnection](self, "_createQuicConnection");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "msv_errorWithDomain:code:debugDescription:", CFSTR("MSVQRConnectionError"), 102, CFSTR("Plugin info had no participant identifier."));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[MSVQRConnection _terminateWithError:](self, "_terminateWithError:", v10);

    }
  }

}

- (void)sessionDidJoinGroup:(id)a3 participantUpdate:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  MSVBlockGuard *v16;
  MSVBlockGuard *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[5];
  id v23;
  id location;
  uint64_t v25;
  void *v26;
  uint8_t buf[4];
  MSVQRConnection *v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = os_log_create("com.apple.amp.MediaServices", "QuickRelay");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    v28 = self;
    v29 = 2114;
    v30 = v10;
    _os_log_impl(&dword_1A077D000, v11, OS_LOG_TYPE_DEFAULT, "[MSVQRConnection] <%p> Session did join group with error %{public}@", buf, 0x16u);
  }

  -[MSVQRConnection guard](self, "guard");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "disarm");

  if (v13)
  {
    -[MSVQRConnection report](self, "report");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "endEvent:withError:", CFSTR("Join Group Session"), v10);
    -[MSVQRConnection setGuard:](self, "setGuard:", 0);
    if (v10)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "msv_errorWithDomain:code:underlyingError:debugDescription:", CFSTR("MSVQRConnectionError"), 102, v10, CFSTR("GroupSession join failed with error."));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[MSVQRConnection _terminateWithError:](self, "_terminateWithError:", v15);

    }
    else
    {
      objc_initWeak(&location, self);
      v16 = [MSVBlockGuard alloc];
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __63__MSVQRConnection_sessionDidJoinGroup_participantUpdate_error___block_invoke;
      v22[3] = &unk_1E43E97F8;
      v22[4] = self;
      objc_copyWeak(&v23, &location);
      v17 = -[MSVBlockGuard initWithTimeout:interruptionHandler:](v16, "initWithTimeout:interruptionHandler:", v22, 20.0);
      -[MSVQRConnection setGuard:](self, "setGuard:", v17);

      objc_msgSend(v14, "startEvent:withParentEvent:", CFSTR("Register Plugin"), CFSTR("Connection"));
      v18 = os_log_create("com.apple.amp.MediaServices", "QuickRelay");
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        v28 = self;
        _os_log_impl(&dword_1A077D000, v18, OS_LOG_TYPE_DEFAULT, "[MSVQRConnection] <%p> Register plugin.", buf, 0xCu);
      }

      v25 = *MEMORY[0x1E0D34050];
      -[MSVQRConnection dataSource](self, "dataSource");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "pluginIdentifier");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = v20;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v26, &v25, 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "registerPluginWithOptions:", v21);

      objc_destroyWeak(&v23);
      objc_destroyWeak(&location);
    }

  }
}

- (void)_sendPathWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  const void *v14;
  size_t v15;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  NSObject *v19;
  NSObject *message;
  void *v21;
  NSObject *v22;
  id v23;
  _QWORD completion[4];
  id v25;
  _QWORD v26[2];
  _QWORD v27[2];
  uint8_t buf[4];
  MSVQRConnection *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = os_log_create("com.apple.amp.MediaServices", "QuickRelay");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    -[MSVQRConnection dataSource](self, "dataSource");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "rpcPath");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218498;
    v29 = self;
    v30 = 2114;
    v31 = v9;
    v32 = 2114;
    v33 = v6;
    _os_log_impl(&dword_1A077D000, v7, OS_LOG_TYPE_DEBUG, "[MSVQRConnection] <%p> Sending path %{public}@ with traceID: %{public}@", buf, 0x20u);

  }
  -[MSVQRConnection dataSource](self, "dataSource");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "rpcPath");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "dataUsingEncoding:", 4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_retainAutorelease(v12);
  v14 = (const void *)objc_msgSend(v13, "bytes");
  v15 = objc_msgSend(v13, "length");
  -[MSVQRConnection queue](self, "queue");
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = dispatch_data_create(v14, v15, v16, 0);

  v18 = nw_content_context_create("PathContext");
  -[MSVQRConnection framerDefinition](self, "framerDefinition");
  v19 = objc_claimAutoreleasedReturnValue();
  message = nw_framer_protocol_create_message(v19);

  v26[0] = CFSTR("MessageTypeKey");
  v26[1] = CFSTR("TraceIdKey");
  v27[0] = CFSTR("Path");
  v27[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, v26, 2);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  nw_framer_message_set_object_value(message, "Header", v21);

  nw_content_context_set_metadata_for_protocol(v18, message);
  -[MSVQRConnection connection](self, "connection");
  v22 = objc_claimAutoreleasedReturnValue();
  completion[0] = MEMORY[0x1E0C809B0];
  completion[1] = 3221225472;
  completion[2] = __43__MSVQRConnection__sendPathWithCompletion___block_invoke;
  completion[3] = &unk_1E43E9820;
  v25 = v4;
  v23 = v4;
  nw_connection_send(v22, v17, v18, 1, completion);

}

- (void)_connectionStateDidChangeWithError:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t (**v6)(_QWORD, _QWORD);
  void *v7;
  MSVQRConnection *v8;
  _QWORD v9[4];
  id v10;
  MSVQRConnection *v11;
  uint64_t (**v12)(_QWORD, _QWORD);
  _QWORD v13[5];

  v4 = a3;
  v5 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __54__MSVQRConnection__connectionStateDidChangeWithError___block_invoke;
  v13[3] = &unk_1E43E9848;
  v13[4] = self;
  v6 = (uint64_t (**)(_QWORD, _QWORD))MEMORY[0x1A1AFBD28](v13);
  -[MSVQRConnection report](self, "report");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = self;
  objc_sync_enter(v8);
  if (-[MSVQRConnection state](v8, "state") == 2)
    objc_msgSend(v7, "endEvent:withError:", CFSTR("Start QUIC"), v4);
  objc_sync_exit(v8);

  if ((((uint64_t (**)(_QWORD, id))v6)[2](v6, v4) & 1) == 0)
  {
    objc_msgSend(v7, "startEvent:withParentEvent:", CFSTR("Send Path"), CFSTR("Connection"));
    v9[0] = v5;
    v9[1] = 3221225472;
    v9[2] = __54__MSVQRConnection__connectionStateDidChangeWithError___block_invoke_2;
    v9[3] = &unk_1E43E9870;
    v10 = v7;
    v11 = v8;
    v12 = v6;
    -[MSVQRConnection _sendPathWithCompletion:](v8, "_sendPathWithCompletion:", v9);

  }
}

- (void)_receiveNextMessage
{
  MSVQRConnection *v2;
  NSObject *v3;
  NSObject *v4;
  _QWORD completion[4];
  id v6;
  id location[4];

  location[3] = *(id *)MEMORY[0x1E0C80C00];
  v2 = self;
  objc_sync_enter(v2);
  if (-[MSVQRConnection state](v2, "state") == 3)
  {
    -[MSVQRConnection connection](v2, "connection");
    v3 = objc_claimAutoreleasedReturnValue();
    objc_sync_exit(v2);

    objc_initWeak(location, v2);
    completion[0] = MEMORY[0x1E0C809B0];
    completion[1] = 3221225472;
    completion[2] = __38__MSVQRConnection__receiveNextMessage__block_invoke;
    completion[3] = &unk_1E43E9898;
    objc_copyWeak(&v6, location);
    nw_connection_receive_message(v3, completion);
    objc_destroyWeak(&v6);
    objc_destroyWeak(location);
    v2 = (MSVQRConnection *)v3;
  }
  else
  {
    v4 = os_log_create("com.apple.amp.MediaServices", "QuickRelay");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      LODWORD(location[0]) = 134217984;
      *(id *)((char *)location + 4) = v2;
      _os_log_impl(&dword_1A077D000, v4, OS_LOG_TYPE_ERROR, "[MSVQRConnection] <%p> Cannot receive message because connection is not started.", (uint8_t *)location, 0xCu);
    }

    objc_sync_exit(v2);
  }

}

- (void)_createQuicConnection
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  NSObject *quic_stream;
  NSObject *v13;
  NSObject *v14;
  NSObject *options;
  NSObject *v16;
  nw_connection_t v17;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  NSObject *v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  _QWORD handler[4];
  NSObject *v27;
  id v28[5];
  id v29;
  id v30;
  id v31;
  id v32;
  id location;
  uint8_t buf[4];
  MSVQRConnection *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  -[MSVQRConnection dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "groupSessionIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUIDString");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  -[MSVQRConnection participantIdentifier](self, "participantIdentifier");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSVQRConnection queue](self, "queue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSVQRConnection dataSource](self, "dataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applicationProtocol");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[MSVQRConnection dataSource](self, "dataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "trustHandler");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak(&location, self);
  v10 = MEMORY[0x1E0C809B0];
  v28[1] = (id)MEMORY[0x1E0C809B0];
  v28[2] = (id)3221225472;
  v28[3] = __40__MSVQRConnection__createQuicConnection__block_invoke;
  v28[4] = &unk_1E43E9910;
  v23 = v7;
  v29 = v23;
  v11 = v9;
  v31 = v11;
  v22 = v5;
  v30 = v22;
  objc_copyWeak(&v32, &location);
  quic_stream = nw_parameters_create_quic_stream();
  v13 = nw_parameters_copy_default_protocol_stack(quic_stream);
  nw_protocol_stack_clear_application_protocols(v13);
  -[MSVQRConnection framerDefinition](self, "framerDefinition");
  v14 = objc_claimAutoreleasedReturnValue();
  options = nw_framer_create_options(v14);

  nw_protocol_stack_prepend_application_protocol(v13, options);
  objc_msgSend(MEMORY[0x1E0D342F8], "augmentNetworkParametersForSession:participantID:parameters:", v24, objc_msgSend(v25, "integerValue"), quic_stream);
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = nw_connection_create(v16, quic_stream);
  -[MSVQRConnection setConnection:](self, "setConnection:", v17);
  handler[0] = v10;
  handler[1] = 3221225472;
  handler[2] = __40__MSVQRConnection__createQuicConnection__block_invoke_4;
  handler[3] = &unk_1E43E9938;
  objc_copyWeak(v28, &location);
  v18 = v17;
  v27 = v18;
  nw_connection_set_state_changed_handler(v18, handler);
  v19 = os_log_create("com.apple.amp.MediaServices", "QuickRelay");
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v35 = self;
    _os_log_impl(&dword_1A077D000, v19, OS_LOG_TYPE_DEFAULT, "[MSVQRConnection] <%p> Starting QUIC connection.", buf, 0xCu);
  }

  -[MSVQRConnection report](self, "report");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "startEvent:withParentEvent:", CFSTR("Start QUIC"), CFSTR("Connection"));

  -[MSVQRConnection queue](self, "queue");
  v21 = objc_claimAutoreleasedReturnValue();
  nw_connection_set_queue(v18, v21);

  nw_connection_start(v18);
  objc_destroyWeak(v28);

  objc_destroyWeak(&v32);
  objc_destroyWeak(&location);

}

- (MSVQRConnectionDelegate)delegate
{
  return (MSVQRConnectionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (MSVQRConnectionSessionDataSource)dataSource
{
  return self->_dataSource;
}

- (MSVQRConnectionReportProtocol)report
{
  return (MSVQRConnectionReportProtocol *)objc_loadWeakRetained((id *)&self->_report);
}

- (void)setReport:(id)a3
{
  objc_storeWeak((id *)&self->_report, a3);
}

- (OS_nw_protocol_definition)framerDefinition
{
  return self->_framerDefinition;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (OS_dispatch_queue)delegateQueue
{
  return self->_delegateQueue;
}

- (MSVQRConnectionMessageCoder)messageCoder
{
  return self->_messageCoder;
}

- (IDSGroupSession)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
  objc_storeStrong((id *)&self->_session, a3);
}

- (NSNumber)participantIdentifier
{
  return self->_participantIdentifier;
}

- (void)setParticipantIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (OS_nw_connection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_connection, a3);
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

- (BOOL)shouldTerminate
{
  return self->_shouldTerminate;
}

- (void)setShouldTerminate:(BOOL)a3
{
  self->_shouldTerminate = a3;
}

- (MSVBlockGuard)guard
{
  return self->_guard;
}

- (void)setGuard:(id)a3
{
  objc_storeStrong((id *)&self->_guard, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_guard, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_participantIdentifier, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_messageCoder, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_framerDefinition, 0);
  objc_destroyWeak((id *)&self->_report);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __40__MSVQRConnection__createQuicConnection__block_invoke(id *a1, void *a2)
{
  id v3;
  NSObject *v4;
  _QWORD verify_block[4];
  id v6;
  id v7;
  id v8;

  v3 = a2;
  nw_quic_connection_set_max_datagram_frame_size();
  nw_quic_connection_set_initial_max_streams_bidirectional();
  nw_quic_connection_set_initial_max_streams_unidirectional();
  v4 = nw_quic_connection_copy_sec_protocol_options();
  sec_protocol_options_add_tls_application_protocol(v4, (const char *)objc_msgSend(objc_retainAutorelease(a1[4]), "cStringUsingEncoding:", 4));
  verify_block[0] = MEMORY[0x1E0C809B0];
  verify_block[1] = 3221225472;
  verify_block[2] = __40__MSVQRConnection__createQuicConnection__block_invoke_2;
  verify_block[3] = &unk_1E43E98E8;
  v7 = a1[6];
  v6 = a1[5];
  objc_copyWeak(&v8, a1 + 7);
  sec_protocol_options_set_verify_block(v4, verify_block, (dispatch_queue_t)a1[5]);
  objc_destroyWeak(&v8);

}

void __40__MSVQRConnection__createQuicConnection__block_invoke_4(uint64_t a1, int a2, void *a3)
{
  NSObject *v5;
  id WeakRetained;
  NSObject *v7;
  const char *v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  const __CFString *v15;
  NSObject *v16;
  void *v17;
  int v18;
  id v19;
  __int16 v20;
  NSObject *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    switch(a2)
    {
      case 1:
        if (v5)
          v7 = nw_error_copy_cf_error(v5);
        else
          v7 = 0;
        v13 = os_log_create("com.apple.amp.MediaServices", "QuickRelay");
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          v18 = 134218242;
          v19 = WeakRetained;
          v20 = 2114;
          v21 = v7;
          _os_log_impl(&dword_1A077D000, v13, OS_LOG_TYPE_DEFAULT, "[MSVQRConnection] <%p> Connection state .waiting. Error %{public}@", (uint8_t *)&v18, 0x16u);
        }

        v14 = (void *)MEMORY[0x1E0CB35C8];
        v15 = CFSTR("NWConnection in waiting state.");
        goto LABEL_27;
      case 2:
        v7 = os_log_create("com.apple.amp.MediaServices", "QuickRelay");
        if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
          goto LABEL_28;
        v18 = 134217984;
        v19 = WeakRetained;
        v8 = "[MSVQRConnection] <%p> Connection state .preparing";
        break;
      case 3:
        v9 = *(NSObject **)(a1 + 32);
        v10 = nw_protocol_copy_quic_connection_definition();
        v7 = nw_connection_copy_protocol_metadata(v9, v10);

        if (v7)
        {
          v11 = os_log_create("com.apple.amp.MediaServices", "QuickRelay");
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
          {
            v18 = 134217984;
            v19 = WeakRetained;
            _os_log_impl(&dword_1A077D000, v11, OS_LOG_TYPE_DEFAULT, "[MSVQRConnection] <%p> Setting keep alive interval", (uint8_t *)&v18, 0xCu);
          }

          nw_quic_connection_set_keepalive();
        }
        v12 = os_log_create("com.apple.amp.MediaServices", "QuickRelay");
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          v18 = 134217984;
          v19 = WeakRetained;
          _os_log_impl(&dword_1A077D000, v12, OS_LOG_TYPE_DEFAULT, "[MSVQRConnection] <%p> Connection state .ready", (uint8_t *)&v18, 0xCu);
        }

        objc_msgSend(WeakRetained, "_connectionStateDidChangeWithError:", 0);
        goto LABEL_28;
      case 4:
        if (v5)
          v7 = nw_error_copy_cf_error(v5);
        else
          v7 = 0;
        v16 = os_log_create("com.apple.amp.MediaServices", "QuickRelay");
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          v18 = 134218242;
          v19 = WeakRetained;
          v20 = 2114;
          v21 = v7;
          _os_log_impl(&dword_1A077D000, v16, OS_LOG_TYPE_DEFAULT, "[MSVQRConnection] <%p> Connection state .failed. Error %{public}@", (uint8_t *)&v18, 0x16u);
        }

        v14 = (void *)MEMORY[0x1E0CB35C8];
        v15 = CFSTR("NWConnection in failed state.");
LABEL_27:
        objc_msgSend(v14, "msv_errorWithDomain:code:underlyingError:debugDescription:", CFSTR("MSVQRConnectionError"), 102, v7, v15);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(WeakRetained, "_connectionStateDidChangeWithError:", v17);

        goto LABEL_28;
      case 5:
        v7 = os_log_create("com.apple.amp.MediaServices", "QuickRelay");
        if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
          goto LABEL_28;
        v18 = 134217984;
        v19 = WeakRetained;
        v8 = "[MSVQRConnection] <%p> Connection state .cancelled";
        break;
      default:
        goto LABEL_29;
    }
    _os_log_impl(&dword_1A077D000, v7, OS_LOG_TYPE_DEBUG, v8, (uint8_t *)&v18, 0xCu);
LABEL_28:

  }
LABEL_29:

}

void __40__MSVQRConnection__createQuicConnection__block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v11 = *(_QWORD *)(a1 + 32);
  v10 = *(_QWORD *)(a1 + 40);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __40__MSVQRConnection__createQuicConnection__block_invoke_3;
  v13[3] = &unk_1E43E98C0;
  v12 = v9;
  v14 = v12;
  objc_copyWeak(&v15, (id *)(a1 + 48));
  (*(void (**)(uint64_t, id, id, uint64_t, _QWORD *))(v10 + 16))(v10, v7, v8, v11, v13);
  objc_destroyWeak(&v15);

}

void __40__MSVQRConnection__createQuicConnection__block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id WeakRetained;
  id v5;

  v5 = a3;
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  if (v5)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(WeakRetained, "_terminateWithError:", v5);

  }
}

void __38__MSVQRConnection__receiveNextMessage__block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4, void *a5)
{
  __CFString *v8;
  NSObject *v9;
  NSObject *v10;
  id WeakRetained;
  CFErrorRef v12;
  NSObject *v13;
  NSObject *v14;
  id v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  __CFString *v23;
  __CFString *v24;
  NSObject *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  int v31;
  void *v32;
  unsigned int v33;
  uint64_t v34;
  NSObject *v35;
  __CFString *v36;
  __CFString *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  __CFString *v42;
  __CFString *v43;
  _QWORD block[4];
  id v45;
  id v46;
  id v47;
  uint8_t buf[4];
  id v49;
  __int16 v50;
  __CFString *v51;
  __int16 v52;
  void *v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v8 = a2;
  v9 = a3;
  v10 = a5;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (v10 && (v12 = nw_error_copy_cf_error(v10)) != 0)
    {
      v13 = v12;
      objc_msgSend(WeakRetained, "_terminateWithError:", v12);
    }
    else
    {
      objc_msgSend(WeakRetained, "framerDefinition");
      v14 = objc_claimAutoreleasedReturnValue();
      v13 = nw_content_context_copy_protocol_metadata(v9, v14);

      if (v13)
      {
        v15 = nw_framer_message_copy_object_value(v13, "Header");
        if (v15 && (_NSIsNSDictionary() & 1) != 0)
        {
          objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("MessageTypeKey"));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v16, "isEqualToString:", CFSTR("Proto"));

          if (v17)
          {
            v42 = v8;
            objc_msgSend(WeakRetained, "messageCoder");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "messageFromData:", v42);
            v19 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(WeakRetained, "messageCoder");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "traceIdentifierForMessage:", v19);
            v21 = objc_claimAutoreleasedReturnValue();
            v22 = (void *)v21;
            v23 = CFSTR("no-trace");
            if (v21)
              v23 = (__CFString *)v21;
            v24 = v23;

            v25 = os_log_create("com.apple.amp.MediaServices", "QuickRelay_Oversize");
            if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 134218498;
              v49 = WeakRetained;
              v50 = 2112;
              v51 = v24;
              v52 = 2114;
              v53 = v19;
              _os_log_impl(&dword_1A077D000, v25, OS_LOG_TYPE_DEFAULT, "[MSVQRConnection] <%p> Received message: [%@]%{public}@", buf, 0x20u);
            }

            objc_msgSend(WeakRetained, "delegate");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_opt_respondsToSelector() & 1) != 0)
            {
              objc_msgSend(WeakRetained, "delegateQueue");
              v27 = objc_claimAutoreleasedReturnValue();
              block[0] = MEMORY[0x1E0C809B0];
              block[1] = 3221225472;
              block[2] = __38__MSVQRConnection__receiveNextMessage__block_invoke_80;
              block[3] = &unk_1E43E9790;
              v45 = v26;
              v46 = WeakRetained;
              v47 = v19;
              dispatch_async(v27, block);

            }
            objc_msgSend(WeakRetained, "_receiveNextMessage");

          }
          else
          {
            objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("MessageTypeKey"));
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            v31 = objc_msgSend(v30, "isEqualToString:", CFSTR("Status"));

            if (v31)
            {
              objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("StatusCodeKey"));
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              v33 = objc_msgSend(v32, "unsignedIntValue");
              v34 = v33;

              if (v33 >= 0x11)
              {
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("UnexpectedRpcStatusCode-%ld"), v33);
                v43 = (__CFString *)objc_claimAutoreleasedReturnValue();
              }
              else
              {
                v43 = off_1E43E9A80[v33];
              }
              _MSVLogCategoryQuickRelay();
              v35 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 134218242;
                v49 = WeakRetained;
                v50 = 2114;
                v51 = v43;
                _os_log_impl(&dword_1A077D000, v35, OS_LOG_TYPE_DEFAULT, "[MSVQRConnection] <%p> Received status %{public}@.", buf, 0x16u);
              }

              v36 = v8;
              v37 = v36;
              if (v36)
              {
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", -[__CFString bytes](objc_retainAutorelease(v36), "bytes"), 1);
                v38 = (void *)objc_claimAutoreleasedReturnValue();
                if (v38)
                {
                  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ - %@"), v43, v38);
                  v39 = objc_claimAutoreleasedReturnValue();

                  v43 = (__CFString *)v39;
                }

              }
              objc_msgSend(MEMORY[0x1E0CB35C8], "msv_errorWithDomain:code:debugDescription:", CFSTR("MSVQRConnectionRPCError"), v34, CFSTR("%@"), v43);
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0CB35C8], "msv_errorWithDomain:code:underlyingError:debugDescription:", CFSTR("MSVQRConnectionError"), 200, v40, CFSTR("Received status code from QR server."));
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(WeakRetained, "_terminateWithError:", v41);

            }
          }
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB35C8], "msv_errorWithDomain:code:debugDescription:", CFSTR("MSVQRConnectionError"), 200, CFSTR("Message has no header."));
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(WeakRetained, "_terminateWithError:", v28);

        }
      }
      else
      {
        v29 = os_log_create("com.apple.amp.MediaServices", "QuickRelay_Oversize");
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218243;
          v49 = WeakRetained;
          v50 = 2113;
          v51 = v8;
          _os_log_impl(&dword_1A077D000, v29, OS_LOG_TYPE_DEFAULT, "[MSVQRConnection] <%p> Ignoring message from unknown protocol. Content: %{private}@", buf, 0x16u);
        }

        objc_msgSend(WeakRetained, "_receiveNextMessage");
        v13 = 0;
      }
    }

  }
}

uint64_t __38__MSVQRConnection__receiveNextMessage__block_invoke_80(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "connection:didReceiveMessage:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __54__MSVQRConnection__connectionStateDidChangeWithError___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;

  v3 = a2;
  v4 = *(id *)(a1 + 32);
  objc_sync_enter(v4);
  if (objc_msgSend(*(id *)(a1 + 32), "shouldTerminate"))
  {
    objc_msgSend(*(id *)(a1 + 32), "_terminateWithError:", 0);
  }
  else
  {
    if (!v3)
    {
      v5 = 0;
      goto LABEL_6;
    }
    objc_msgSend(*(id *)(a1 + 32), "_terminateWithError:", v3);
  }
  v5 = 1;
LABEL_6:
  objc_sync_exit(v4);

  return v5;
}

void __54__MSVQRConnection__connectionStateDidChangeWithError___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  id v9;
  uint64_t v10;
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  uint8_t buf[4];
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "endEvent:withError:", CFSTR("Send Path"), v3);
  v4 = *(id *)(a1 + 40);
  objc_sync_enter(v4);
  if (((*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))() & 1) != 0)
  {
    objc_sync_exit(v4);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "setState:", 3);
    objc_sync_exit(v4);

    objc_msgSend(*(id *)(a1 + 32), "endEvent:", CFSTR("Connection"));
    objc_msgSend(*(id *)(a1 + 40), "_receiveNextMessage");
    v5 = os_log_create("com.apple.amp.MediaServices", "QuickRelay");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 134217984;
      v15 = v6;
      _os_log_impl(&dword_1A077D000, v5, OS_LOG_TYPE_DEFAULT, "[MSVQRConnection] <%p> Started QR connection and registered for message handling.", buf, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 40), "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 40), "delegateQueue");
      v8 = objc_claimAutoreleasedReturnValue();
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __54__MSVQRConnection__connectionStateDidChangeWithError___block_invoke_74;
      v11[3] = &unk_1E43E9F20;
      v9 = v7;
      v10 = *(_QWORD *)(a1 + 40);
      v12 = v9;
      v13 = v10;
      dispatch_async(v8, v11);

    }
  }

}

uint64_t __54__MSVQRConnection__connectionStateDidChangeWithError___block_invoke_74(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "connectionDidStart:", *(_QWORD *)(a1 + 40));
}

void __43__MSVQRConnection__sendPathWithCompletion___block_invoke(uint64_t a1, nw_error_t error)
{
  nw_error_t v3;

  if (error)
    error = (nw_error_t)nw_error_copy_cf_error(error);
  v3 = error;
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __63__MSVQRConnection_sessionDidJoinGroup_participantUpdate_error___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  id WeakRetained;
  id v5;

  if (!a2)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "msv_errorWithDomain:code:debugDescription:", CFSTR("MSVQRConnectionError"), 102, CFSTR("Timed out waiting for plugin allocation."));
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "report");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "endEvent:withError:", CFSTR("Register Plugin"), v5);

    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(WeakRetained, "_terminateWithError:", v5);

  }
}

void __38__MSVQRConnection__createGroupSession__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  id WeakRetained;
  id v5;

  if (!a2)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "msv_errorWithDomain:code:debugDescription:", CFSTR("MSVQRConnectionError"), 102, CFSTR("Timed out waiting to join group session."));
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "report");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "endEvent:withError:", CFSTR("Join Group Session"), v5);

    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(WeakRetained, "_terminateWithError:", v5);

  }
}

uint64_t __39__MSVQRConnection__terminateWithError___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "connection:didEndWithError:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void __31__MSVQRConnection_sendMessage___block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  CFErrorRef v4;
  CFErrorRef v5;
  NSObject *error;

  error = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (error)
    {
      v4 = nw_error_copy_cf_error(error);
      if (v4)
      {
        v5 = v4;
        objc_msgSend(WeakRetained, "_terminateWithError:", v4);

      }
    }
  }

}

+ (id)connectionWithDataSource:(id)a3 messageCoder:(id)a4
{
  id v5;
  id v6;
  MSVQRConnection *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[MSVQRConnection initWithDataSource:messageCoder:]([MSVQRConnection alloc], "initWithDataSource:messageCoder:", v6, v5);

  return v7;
}

+ (id)createFramerDefinitionWithIdentifier:(id)a3
{
  id v3;
  void *v4;
  id v5;
  const char *v6;
  nw_protocol_definition_t definition;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, void *);
  void *v12;
  uint64_t v13;
  id v14;

  v9 = MEMORY[0x1E0C809B0];
  v10 = 3221225472;
  v11 = __56__MSVQRConnection_createFramerDefinitionWithIdentifier___block_invoke;
  v12 = &__block_descriptor_48_e32_i16__0__NSObject_OS_nw_framer__8l;
  v13 = 4;
  v14 = a1;
  v3 = a3;
  v4 = (void *)MEMORY[0x1A1AFBD28](&v9);
  v5 = objc_retainAutorelease(v3);
  v6 = (const char *)objc_msgSend(v5, "cStringUsingEncoding:", 4, v9, v10, v11, v12, v13, v14);

  definition = nw_framer_create_definition(v6, 0, v4);
  return definition;
}

uint64_t __56__MSVQRConnection_createFramerDefinitionWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v8[6];
  _QWORD input_handler[6];

  v3 = a2;
  nw_framer_set_cleanup_handler(v3, &__block_literal_global_97);
  nw_framer_set_wakeup_handler(v3, &__block_literal_global_98_4149);
  nw_framer_set_stop_handler(v3, &__block_literal_global_100);
  v4 = MEMORY[0x1E0C809B0];
  input_handler[0] = MEMORY[0x1E0C809B0];
  input_handler[1] = 3221225472;
  input_handler[2] = __56__MSVQRConnection_createFramerDefinitionWithIdentifier___block_invoke_5;
  input_handler[3] = &__block_descriptor_48_e32_Q16__0__NSObject_OS_nw_framer__8l;
  v5 = *(_QWORD *)(a1 + 40);
  input_handler[4] = *(_QWORD *)(a1 + 32);
  input_handler[5] = v5;
  nw_framer_set_input_handler(v3, input_handler);
  v8[0] = v4;
  v8[1] = 3221225472;
  v8[2] = __56__MSVQRConnection_createFramerDefinitionWithIdentifier___block_invoke_105;
  v8[3] = &__block_descriptor_48_e76_v36__0__NSObject_OS_nw_framer__8__NSObject_OS_nw_protocol_metadata__16Q24B32l;
  v6 = *(_QWORD *)(a1 + 32);
  v8[4] = *(_QWORD *)(a1 + 40);
  v8[5] = v6;
  nw_framer_set_output_handler(v3, v8);

  return 1;
}

uint64_t __56__MSVQRConnection_createFramerDefinitionWithIdentifier___block_invoke_5(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v4;
  size_t v5;
  NSObject *v6;
  uint64_t v7;
  NSObject *v8;
  _BOOL4 v9;
  _QWORD v11[4];
  NSObject *v12;
  uint64_t *v13;
  uint64_t *v14;
  size_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  int v26;

  v4 = a2;
  do
  {
    v23 = 0;
    v24 = &v23;
    v25 = 0x2020000000;
    v26 = 0;
    v17 = 0;
    v18 = &v17;
    v19 = 0x3032000000;
    v20 = __Block_byref_object_copy__4153;
    v21 = __Block_byref_object_dispose__4154;
    v22 = 0;
    v5 = *(_QWORD *)(a1 + 32);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __56__MSVQRConnection_createFramerDefinitionWithIdentifier___block_invoke_101;
    v11[3] = &unk_1E43E99E0;
    v15 = v5;
    v6 = v4;
    v12 = v6;
    v13 = &v17;
    v7 = *(_QWORD *)(a1 + 40);
    v14 = &v23;
    v16 = v7;
    if (nw_framer_parse_input(v6, v5, v5, 0, v11) && v18[5])
    {
      v8 = nw_framer_message_create(v6);
      nw_framer_message_set_object_value(v8, "Header", (id)v18[5]);
      v9 = nw_framer_deliver_input_no_copy(v6, *((int *)v24 + 6), v8, 1);

      if (!v9)
        v2 = 0;
    }
    else
    {
      LOBYTE(v9) = 0;
      v2 = *(_QWORD *)(a1 + 32);
    }

    _Block_object_dispose(&v17, 8);
    _Block_object_dispose(&v23, 8);
  }
  while (v9);

  return v2;
}

void __56__MSVQRConnection_createFramerDefinitionWithIdentifier___block_invoke_105(uint64_t a1, void *a2, NSObject *a3, size_t a4)
{
  NSObject *v7;
  id v8;
  void *v9;
  void *v10;
  int v11;
  unsigned int v12;
  NSObject *v13;
  uint64_t v14;
  const char *v15;
  NSObject *v16;
  uint32_t v17;
  void *v18;
  int v19;
  NSObject *v20;
  uint64_t v21;
  void *v22;
  int v23;
  void *v24;
  int v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint8_t output_buffer[2];
  _BYTE buf[22];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = nw_framer_message_copy_object_value(a3, "Header");
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("MessageTypeKey"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("Proto"));

    if (v11)
    {
      v12 = bswap32(a4);
LABEL_12:
      *(_DWORD *)buf = v12;
      nw_framer_write_output(v7, buf, *(_QWORD *)(a1 + 40));
LABEL_13:
      nw_framer_write_output_no_copy(v7, a4);
      goto LABEL_14;
    }
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("MessageTypeKey"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "isEqualToString:", CFSTR("Status"));

    if (v19)
    {
      v20 = os_log_create("com.apple.amp.MediaServices", "QuickRelay");
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        v21 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 134217984;
        *(_QWORD *)&buf[4] = v21;
        _os_log_impl(&dword_1A077D000, v20, OS_LOG_TYPE_ERROR, "[MSVQRConnection] <%p> Should not be sending status codes to server.", buf, 0xCu);
      }

      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("StatusCodeKey"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "unsignedIntValue");

      v12 = bswap32(a4 | (v23 << 16) | 0x80000000);
      goto LABEL_12;
    }
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("MessageTypeKey"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "isEqualToString:", CFSTR("Path"));

    if (v25)
    {
      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("TraceIdKey"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_WORD *)output_buffer = bswap32(a4 + ((v26 != 0) << 15)) >> 16;
      nw_framer_write_output(v7, output_buffer, 2uLL);
      if (v26)
      {
        *(_QWORD *)buf = 0;
        *(_QWORD *)&buf[8] = 0;
        v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v26);
        objc_msgSend(v27, "getUUIDBytes:", buf);

        nw_framer_write_output(v7, buf, 0x10uLL);
      }

      goto LABEL_13;
    }
    v13 = os_log_create("com.apple.amp.MediaServices", "QuickRelay");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v28 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 134218242;
      *(_QWORD *)&buf[4] = v28;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v9;
      v15 = "[MSVQRConnection] <%p> Header did not contain valid message type %{public}@";
      v16 = v13;
      v17 = 22;
      goto LABEL_6;
    }
  }
  else
  {
    v13 = os_log_create("com.apple.amp.MediaServices", "QuickRelay");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 134217984;
      *(_QWORD *)&buf[4] = v14;
      v15 = "[MSVQRConnection] <%p> No header found on output message.";
      v16 = v13;
      v17 = 12;
LABEL_6:
      _os_log_impl(&dword_1A077D000, v16, OS_LOG_TYPE_ERROR, v15, buf, v17);
    }
  }

LABEL_14:
}

uint64_t __56__MSVQRConnection_createFramerDefinitionWithIdentifier___block_invoke_101(uint64_t a1, uint64_t a2, unint64_t a3)
{
  unsigned int v4;
  unsigned int v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  int v13;
  const char *v14;
  NSObject *v15;
  uint32_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  unsigned int v21;
  uint8_t buf[4];
  uint64_t v23;
  __int16 v24;
  unsigned int v25;
  __int16 v26;
  int v27;
  _QWORD v28[2];
  _QWORD v29[2];
  const __CFString *v30;
  _QWORD v31[2];

  v31[1] = *MEMORY[0x1E0C80C00];
  if (!a2 || *(_QWORD *)(a1 + 56) > a3)
    return 0;
  __memcpy_chk();
  v4 = bswap32(0);
  if ((v4 & 0x80000000) != 0)
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = (unsigned __int16)v4;
    v28[0] = CFSTR("MessageTypeKey");
    v28[1] = CFSTR("StatusCodeKey");
    v29[0] = CFSTR("Status");
    v6 = HIWORD(v4) & 0x7FFF;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v29[1] = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, v28, 2);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;

    v11 = os_log_create("com.apple.amp.MediaServices", "QuickRelay");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      v12 = *(_QWORD *)(a1 + 64);
      v13 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
      *(_DWORD *)buf = 134218496;
      v23 = v12;
      v24 = 1024;
      v25 = v6;
      v26 = 1024;
      v27 = v13;
      v14 = "[MSVQRConnection] <%p> Parsed status - code: %d, len: %d";
      v15 = v11;
      v16 = 24;
LABEL_11:
      _os_log_impl(&dword_1A077D000, v15, OS_LOG_TYPE_DEBUG, v14, buf, v16);
    }
  }
  else
  {
    if (v4 >= 0xF4241)
    {
      nw_framer_mark_failed_with_error(*(nw_framer_t *)(a1 + 32), 22);
      return 0;
    }
    v30 = CFSTR("MessageTypeKey");
    v31[0] = CFSTR("Proto");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, &v30, 1);
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v19 = *(void **)(v18 + 40);
    *(_QWORD *)(v18 + 40) = v17;

    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v4;
    v11 = os_log_create("com.apple.amp.MediaServices", "QuickRelay");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      v20 = *(_QWORD *)(a1 + 64);
      v21 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
      *(_DWORD *)buf = 134218240;
      v23 = v20;
      v24 = 1024;
      v25 = v21;
      v14 = "[MSVQRConnection] <%p> Parsed proto - len: %d";
      v15 = v11;
      v16 = 18;
      goto LABEL_11;
    }
  }

  return *(_QWORD *)(a1 + 56);
}

uint64_t __56__MSVQRConnection_createFramerDefinitionWithIdentifier___block_invoke_4()
{
  return 1;
}

@end
