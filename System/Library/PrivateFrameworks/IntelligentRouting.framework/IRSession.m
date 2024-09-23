@implementation IRSession

- (void)_didUpdateContext:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint8_t v7[16];

  v4 = a3;
  v5 = IRLogObject;
  if (os_log_type_enabled((os_log_t)IRLogObject, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_23FFAB000, v5, OS_LOG_TYPE_DEFAULT, "[IRSession]: contexts were updated", v7, 2u);
  }
  -[IRSession delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v6, "session:didUpdateContext:", self, v4);

}

- (IRSessionDelegate)delegate
{
  return (IRSessionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)runWithConfiguration:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[IRSession connection](self, "connection");
  v5 = objc_claimAutoreleasedReturnValue();
  if (!v5)
    goto LABEL_4;
  v6 = (void *)v5;
  -[IRSession configuration](self, "configuration");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[IRSession configuration](self, "configuration");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "serviceToken");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "serviceToken");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqual:", v11);

    if ((v12 & 1) == 0)
    {
LABEL_4:
      v13 = (void *)IRLogObject;
      if (os_log_type_enabled((os_log_t)IRLogObject, OS_LOG_TYPE_ERROR))
        -[IRSession runWithConfiguration:].cold.1(v13, self, v4);
      -[IRSession _notifySessionHasFailed:desc:](self, "_notifySessionHasFailed:desc:", -12889, CFSTR("couldn't run with configuration"));
      goto LABEL_11;
    }
  }
  else
  {

  }
  v14 = IRLogObject;
  if (os_log_type_enabled((os_log_t)IRLogObject, OS_LOG_TYPE_DEFAULT))
  {
    v18 = 138412290;
    v19 = v4;
    _os_log_impl(&dword_23FFAB000, v14, OS_LOG_TYPE_DEFAULT, "[IRSession]: running with configuration: %@", (uint8_t *)&v18, 0xCu);
  }
  v15 = (void *)objc_msgSend(v4, "copy");
  -[IRSession setConfiguration:](self, "setConfiguration:", v15);

  -[IRSession connection](self, "connection");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "remoteObjectProxy");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "_runWithConfiguration:", v4);

LABEL_11:
}

- (IRConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (IRSession)init
{
  IRSession *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  void *v5;
  IRXPCSessionClient *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint8_t v15[8];
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  id location;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)IRSession;
  v2 = -[IRSession init](&v21, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.IntelligentRouting", v3);
    -[IRSession setQueue:](v2, "setQueue:", v4);

    v5 = (void *)objc_opt_class();
    v6 = -[IRXPCSessionClient initWithDelegate:]([IRXPCSessionClient alloc], "initWithDelegate:", v2);
    -[IRSession queue](v2, "queue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_createNSXPCConnectionWithExportedObject:queue:", v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[IRSession setConnection:](v2, "setConnection:", v8);

    objc_initWeak(&location, v2);
    -[IRSession connection](v2, "connection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = MEMORY[0x24BDAC760];
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __17__IRSession_init__block_invoke;
    v18[3] = &unk_25103FA60;
    objc_copyWeak(&v19, &location);
    objc_msgSend(v9, "setInterruptionHandler:", v18);

    -[IRSession connection](v2, "connection");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v10;
    v16[1] = 3221225472;
    v16[2] = __17__IRSession_init__block_invoke_2;
    v16[3] = &unk_25103FA60;
    objc_copyWeak(&v17, &location);
    objc_msgSend(v11, "setInvalidationHandler:", v16);

    -[IRSession connection](v2, "connection");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "resume");

    IRSetupLogging();
    -[IRSession _manageSessionAvailableNotificationObservation:](v2, "_manageSessionAvailableNotificationObservation:", 1);
    v13 = IRLogObject;
    if (os_log_type_enabled((os_log_t)IRLogObject, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl(&dword_23FFAB000, v13, OS_LOG_TYPE_DEFAULT, "[IRSession]: new session created", v15, 2u);
    }
    objc_destroyWeak(&v17);
    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }
  return v2;
}

void __17__IRSession_init__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_serverConnectionInterrupted");

}

void __17__IRSession_init__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_serverConnectionInvalidated");

}

- (void)dealloc
{
  objc_super v3;

  -[IRSession invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)IRSession;
  -[IRSession dealloc](&v3, sel_dealloc);
}

+ (void)createServiceWithParameters:(id)a3 reply:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  uint8_t buf[16];

  v5 = a4;
  v6 = a3;
  IRSetupLogging();
  v7 = IRLogObject;
  if (os_log_type_enabled((os_log_t)IRLogObject, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_23FFAB000, v7, OS_LOG_TYPE_DEFAULT, "[IRSession]: creating service", buf, 2u);
  }
  +[IRSession _createResumedTemporaryNSXPCConnection](IRSession, "_createResumedTemporaryNSXPCConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "remoteObjectProxy");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __47__IRSession_createServiceWithParameters_reply___block_invoke;
  v12[3] = &unk_25103FA88;
  v13 = v8;
  v14 = v5;
  v10 = v8;
  v11 = v5;
  objc_msgSend(v9, "_createServiceWithParameters:reply:", v6, v12);

}

void __47__IRSession_createServiceWithParameters_reply___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  const __CFString *v8;
  int v9;
  const __CFString *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = IRLogObject;
  if (os_log_type_enabled((os_log_t)IRLogObject, OS_LOG_TYPE_DEFAULT))
  {
    v8 = CFSTR("No");
    if (!v6)
      v8 = CFSTR("Yes");
    v9 = 138412290;
    v10 = v8;
    _os_log_impl(&dword_23FFAB000, v7, OS_LOG_TYPE_DEFAULT, "[IRSession]: service created: %@", (uint8_t *)&v9, 0xCu);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  objc_msgSend(*(id *)(a1 + 32), "invalidate");

}

+ (void)deleteService:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint8_t v7[16];

  v3 = a3;
  IRSetupLogging();
  v4 = IRLogObject;
  if (os_log_type_enabled((os_log_t)IRLogObject, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_23FFAB000, v4, OS_LOG_TYPE_DEFAULT, "[IRSession]: deleting service", v7, 2u);
  }
  +[IRSession _createResumedTemporaryNSXPCConnection](IRSession, "_createResumedTemporaryNSXPCConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "remoteObjectProxy");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_deleteService:", v3);

}

+ (void)databaseExportwithReply:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  uint8_t buf[16];

  v3 = a3;
  IRSetupLogging();
  v4 = IRLogObject;
  if (os_log_type_enabled((os_log_t)IRLogObject, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_23FFAB000, v4, OS_LOG_TYPE_DEFAULT, "[IRSession]: exporting DB", buf, 2u);
  }
  +[IRSession _createResumedTemporaryNSXPCConnection](IRSession, "_createResumedTemporaryNSXPCConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "remoteObjectProxy");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __37__IRSession_databaseExportwithReply___block_invoke;
  v9[3] = &unk_25103FAB0;
  v10 = v5;
  v11 = v3;
  v7 = v5;
  v8 = v3;
  objc_msgSend(v6, "_databaseExportwithReply:", v9);

}

void __37__IRSession_databaseExportwithReply___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  const __CFString *v8;
  int v9;
  const __CFString *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = IRLogObject;
  if (os_log_type_enabled((os_log_t)IRLogObject, OS_LOG_TYPE_DEFAULT))
  {
    v8 = CFSTR("No");
    if (!v6)
      v8 = CFSTR("Yes");
    v9 = 138412290;
    v10 = v8;
    _os_log_impl(&dword_23FFAB000, v7, OS_LOG_TYPE_DEFAULT, "[IRSession]: DB exported: %@", (uint8_t *)&v9, 0xCu);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  objc_msgSend(*(id *)(a1 + 32), "invalidate");

}

+ (void)deleteDatabaseWithReply:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  uint8_t buf[16];

  v3 = a3;
  IRSetupLogging();
  v4 = IRLogObject;
  if (os_log_type_enabled((os_log_t)IRLogObject, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_23FFAB000, v4, OS_LOG_TYPE_DEFAULT, "[IRSession]: deleting DB", buf, 2u);
  }
  +[IRSession _createResumedTemporaryNSXPCConnection](IRSession, "_createResumedTemporaryNSXPCConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "remoteObjectProxy");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __37__IRSession_deleteDatabaseWithReply___block_invoke;
  v9[3] = &unk_25103FAD8;
  v10 = v5;
  v11 = v3;
  v7 = v5;
  v8 = v3;
  objc_msgSend(v6, "_deleteDatabaseWithReply:", v9);

}

void __37__IRSession_deleteDatabaseWithReply___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  const __CFString *v5;
  int v6;
  const __CFString *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = IRLogObject;
  if (os_log_type_enabled((os_log_t)IRLogObject, OS_LOG_TYPE_DEFAULT))
  {
    v5 = CFSTR("No");
    if (!v3)
      v5 = CFSTR("Yes");
    v6 = 138412290;
    v7 = v5;
    _os_log_impl(&dword_23FFAB000, v4, OS_LOG_TYPE_DEFAULT, "[IRSession]: DB deleted: %@", (uint8_t *)&v6, 0xCu);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  objc_msgSend(*(id *)(a1 + 32), "invalidate");

}

+ (void)getServiceTokensWithReply:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  uint8_t buf[16];

  v3 = a3;
  IRSetupLogging();
  v4 = IRLogObject;
  if (os_log_type_enabled((os_log_t)IRLogObject, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_23FFAB000, v4, OS_LOG_TYPE_DEFAULT, "[IRSession]: getting all service tokens", buf, 2u);
  }
  +[IRSession _createResumedTemporaryNSXPCConnection](IRSession, "_createResumedTemporaryNSXPCConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "remoteObjectProxy");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __39__IRSession_getServiceTokensWithReply___block_invoke;
  v9[3] = &unk_25103FAB0;
  v10 = v5;
  v11 = v3;
  v7 = v5;
  v8 = v3;
  objc_msgSend(v6, "_getServiceTokensWithReply:", v9);

}

void __39__IRSession_getServiceTokensWithReply___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  const __CFString *v8;
  int v9;
  const __CFString *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = IRLogObject;
  if (os_log_type_enabled((os_log_t)IRLogObject, OS_LOG_TYPE_DEFAULT))
  {
    v8 = CFSTR("No");
    if (!v6)
      v8 = CFSTR("Yes");
    v9 = 138412290;
    v10 = v8;
    _os_log_impl(&dword_23FFAB000, v7, OS_LOG_TYPE_DEFAULT, "[IRSession]: got tokens: %@", (uint8_t *)&v9, 0xCu);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  objc_msgSend(*(id *)(a1 + 32), "invalidate");

}

- (void)updateCandidate:(id)a3
{
  id v4;

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[IRSession updateCandidates:](self, "updateCandidates:", v4);

}

- (void)updateCandidates:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t buf[4];
  id v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[IRSession configuration](self, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 && v5)
  {
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v18;
      while (2)
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v18 != v9)
            objc_enumerationMutation(v6);
          v11 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
          if (!-[IRSession _isCandidateValid:](self, "_isCandidateValid:", v11, (_QWORD)v17))
          {
            v16 = (void *)IRLogObject;
            if (os_log_type_enabled((os_log_t)IRLogObject, OS_LOG_TYPE_ERROR))
              -[IRSession updateCandidates:].cold.2(v11, v16, self);

            goto LABEL_20;
          }
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
        if (v8)
          continue;
        break;
      }
    }

    v12 = IRLogObject;
    if (os_log_type_enabled((os_log_t)IRLogObject, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v22 = v6;
      _os_log_impl(&dword_23FFAB000, v12, OS_LOG_TYPE_DEFAULT, "[IRSession]: updating candidates: %@", buf, 0xCu);
    }
    -[IRSession _checkAndRecoverIfNeeded](self, "_checkAndRecoverIfNeeded", (_QWORD)v17);
    -[IRSession connection](self, "connection");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "remoteObjectProxy");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "_updateCandidates:", v6);

  }
  else
  {
    v15 = (void *)IRLogObject;
    if (os_log_type_enabled((os_log_t)IRLogObject, OS_LOG_TYPE_ERROR))
      -[IRSession updateCandidates:].cold.1((uint64_t)v4, v15, self);
    -[IRSession _notifySessionHasFailed:desc:](self, "_notifySessionHasFailed:desc:", -12891, CFSTR("Updating candidate has failed"));
  }
LABEL_20:

}

- (void)deleteCandidate:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[IRSession configuration](self, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = IRLogObject;
  if (v4 && v5)
  {
    if (os_log_type_enabled((os_log_t)IRLogObject, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 138412290;
      v10 = v4;
      _os_log_impl(&dword_23FFAB000, v6, OS_LOG_TYPE_DEFAULT, "[IRSession]: deleting candidate: %@", (uint8_t *)&v9, 0xCu);
    }
    -[IRSession _checkAndRecoverIfNeeded](self, "_checkAndRecoverIfNeeded");
    -[IRSession connection](self, "connection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "remoteObjectProxy");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_deleteCandidate:", v4);

  }
  else
  {
    if (os_log_type_enabled((os_log_t)IRLogObject, OS_LOG_TYPE_ERROR))
      -[IRSession deleteCandidate:].cold.1((uint64_t)v4, v6, self);
    -[IRSession _notifySessionHasFailed:desc:](self, "_notifySessionHasFailed:desc:", -12892, CFSTR("Deleting candidate has failed"));
  }

}

- (void)addEvent:(id)a3 forCandidate:(id)a4
{
  id v6;
  id v7;
  void *v8;
  BOOL v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  const __CFString *v17;
  NSObject *v18;
  void *v19;
  const __CFString *v20;
  _BYTE v21[22];
  __int16 v22;
  const __CFString *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[IRSession configuration](self, "configuration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 && v8)
  {

    if (v7)
    {
      v9 = -[IRSession _isCandidateValid:](self, "_isCandidateValid:", v7);
      v10 = IRLogObject;
      if (v9)
      {
        if (os_log_type_enabled((os_log_t)IRLogObject, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v21 = 138412546;
          *(_QWORD *)&v21[4] = v6;
          *(_WORD *)&v21[12] = 2112;
          *(_QWORD *)&v21[14] = v7;
          _os_log_impl(&dword_23FFAB000, v10, OS_LOG_TYPE_DEFAULT, "[IRSession]: adding event: %@, for candidate: %@", v21, 0x16u);
        }
        -[IRSession _checkAndRecoverIfNeeded](self, "_checkAndRecoverIfNeeded");
        -[IRSession connection](self, "connection");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "remoteObjectProxy");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "candidateIdentifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "_addEvent:forCandidateIdentifier:", v6, v13);

      }
      else if (os_log_type_enabled((os_log_t)IRLogObject, OS_LOG_TYPE_ERROR))
      {
        v15 = v10;
        -[IRSession connection](self, "connection");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = CFSTR("NO");
        *(_DWORD *)v21 = 138412802;
        *(_QWORD *)&v21[4] = v6;
        *(_WORD *)&v21[12] = 2112;
        if (!v16)
          v17 = CFSTR("YES");
        *(_QWORD *)&v21[14] = v7;
        v22 = 2112;
        v23 = v17;
        _os_log_error_impl(&dword_23FFAB000, v15, OS_LOG_TYPE_ERROR, "[ErrorId - IRSession add event error] [IRSession]: cant add event %@ for corrupted candidate %@, isSessionInvalidated: %@", v21, 0x20u);

      }
      goto LABEL_11;
    }
  }
  else
  {

  }
  v14 = (void *)IRLogObject;
  if (os_log_type_enabled((os_log_t)IRLogObject, OS_LOG_TYPE_ERROR))
  {
    v18 = v14;
    -[IRSession connection](self, "connection");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = CFSTR("NO");
    *(_DWORD *)v21 = 138412802;
    *(_QWORD *)&v21[4] = v6;
    *(_WORD *)&v21[12] = 2112;
    if (!v19)
      v20 = CFSTR("YES");
    *(_QWORD *)&v21[14] = v7;
    v22 = 2112;
    v23 = v20;
    _os_log_error_impl(&dword_23FFAB000, v18, OS_LOG_TYPE_ERROR, "[ErrorId - IRSession add event error] [IRSession]: cant add event: %@ for candidate: %@, session was never run, isSessionInvalidated: %@", v21, 0x20u);

  }
  -[IRSession _notifySessionHasFailed:desc:](self, "_notifySessionHasFailed:desc:", -12893, CFSTR("Add event for candidate has failed"), *(_OWORD *)v21);
LABEL_11:

}

- (void)requestCurrentContext
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = OUTLINED_FUNCTION_5(a1);
  objc_msgSend(a2, "connection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2(&dword_23FFAB000, v5, v6, "[ErrorId - IRSession request context error] [IRSession]: cant request current context, session was never run, isSessionInvalidated: %@", v7, v8, v9, v10, 2u);

  OUTLINED_FUNCTION_4();
}

- (void)requestCurrentContextWithBundleID:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[IRSession configuration](self, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v9 = (void *)IRLogObject;
    if (os_log_type_enabled((os_log_t)IRLogObject, OS_LOG_TYPE_ERROR))
      -[IRSession requestCurrentContextWithBundleID:].cold.1(v9, self);
    v10 = CFSTR("Requesting current context with bundleID has failed");
    goto LABEL_12;
  }
  v6 = IRLogObject;
  if (!v4)
  {
    if (os_log_type_enabled((os_log_t)IRLogObject, OS_LOG_TYPE_ERROR))
      -[IRSession requestCurrentContextWithBundleID:].cold.2(v6);
    v10 = CFSTR("requestCurrentContextWithBundleID has failed");
LABEL_12:
    -[IRSession _notifySessionHasFailed:desc:](self, "_notifySessionHasFailed:desc:", -12900, v10);
    goto LABEL_13;
  }
  if (os_log_type_enabled((os_log_t)IRLogObject, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 138412290;
    v12 = v4;
    _os_log_impl(&dword_23FFAB000, v6, OS_LOG_TYPE_DEFAULT, "[IRSession]: requesting current context with bundleID: %@", (uint8_t *)&v11, 0xCu);
  }
  -[IRSession _checkAndRecoverIfNeeded](self, "_checkAndRecoverIfNeeded");
  -[IRSession connection](self, "connection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "remoteObjectProxy");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_requestCurrentContextWithBundleID:", v4);

LABEL_13:
}

- (void)setSpotOnLocationWithParameters:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint8_t v9[16];

  v4 = a3;
  -[IRSession configuration](self, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = IRLogObject;
  if (v4 && v5)
  {
    if (os_log_type_enabled((os_log_t)IRLogObject, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_23FFAB000, v6, OS_LOG_TYPE_DEFAULT, "[IRSession]: setting current location spotOnLocation", v9, 2u);
    }
    -[IRSession _checkAndRecoverIfNeeded](self, "_checkAndRecoverIfNeeded");
    -[IRSession connection](self, "connection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "remoteObjectProxy");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_setSpotOnLocationWithParameters:", v4);

  }
  else
  {
    if (os_log_type_enabled((os_log_t)IRLogObject, OS_LOG_TYPE_ERROR))
      -[IRSession setSpotOnLocationWithParameters:].cold.1(v6, self);
    -[IRSession _notifySessionHasFailed:desc:](self, "_notifySessionHasFailed:desc:", -12891, CFSTR("set spotOnLocation has failed"));
  }

}

- (void)invalidate
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  uint8_t v8[16];

  -[IRSession connection](self, "connection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = IRLogObject;
    if (os_log_type_enabled((os_log_t)IRLogObject, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_23FFAB000, v4, OS_LOG_TYPE_DEFAULT, "[IRSession]: invalidating", v8, 2u);
    }
    -[IRSession connection](self, "connection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setInterruptionHandler:", 0);

    -[IRSession connection](self, "connection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setInvalidationHandler:", 0);

    -[IRSession connection](self, "connection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "invalidate");

    -[IRSession setConnection:](self, "setConnection:", 0);
    -[IRSession setConfiguration:](self, "setConfiguration:", 0);
    -[IRSession setInterrupted:](self, "setInterrupted:", 0);
    -[IRSession _manageSessionAvailableNotificationObservation:](self, "_manageSessionAvailableNotificationObservation:", 0);
  }
}

- (void)_sessionDidFailWithError:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = IRLogObject;
  if (os_log_type_enabled((os_log_t)IRLogObject, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412290;
    v8 = v4;
    _os_log_impl(&dword_23FFAB000, v5, OS_LOG_TYPE_DEFAULT, "[IRSession]: connection the IR Daemon has failed with error: %@", (uint8_t *)&v7, 0xCu);
  }
  -[IRSession invalidate](self, "invalidate");
  -[IRSession delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v6, "session:didFailWithError:", self, v4);

}

- (void)_didUpdateBundlesWithSignificantInteractionPattern:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint8_t v7[16];

  v4 = a3;
  v5 = IRLogObject;
  if (os_log_type_enabled((os_log_t)IRLogObject, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_23FFAB000, v5, OS_LOG_TYPE_DEFAULT, "[IRSession]: bundles were updated", v7, 2u);
  }
  -[IRSession delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v6, "session:didUpdateBundlesWithSignificantInteractionPattern:", self, v4);

}

- (void)_didSpotOnLocationComplete:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  const char *v8;
  uint8_t *v9;
  __int16 v10;
  __int16 v11;
  uint8_t buf[16];

  v4 = a3;
  v5 = IRLogObject;
  if (os_log_type_enabled((os_log_t)IRLogObject, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_23FFAB000, v5, OS_LOG_TYPE_DEFAULT, "[IRSession]: didSpotOnLocationComplete", buf, 2u);
  }
  -[IRSession delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    v7 = IRLogObject;
    if (!os_log_type_enabled((os_log_t)IRLogObject, OS_LOG_TYPE_DEFAULT))
      goto LABEL_11;
    v11 = 0;
    v8 = "[IRSession]: spotOnDelegate is nil";
    v9 = (uint8_t *)&v11;
LABEL_10:
    _os_log_impl(&dword_23FFAB000, v7, OS_LOG_TYPE_DEFAULT, v8, v9, 2u);
    goto LABEL_11;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    v7 = IRLogObject;
    if (!os_log_type_enabled((os_log_t)IRLogObject, OS_LOG_TYPE_DEFAULT))
      goto LABEL_11;
    v10 = 0;
    v8 = "[IRSession]: spotOnDelegate does not respond to session:didSpotOnLocationComplete:";
    v9 = (uint8_t *)&v10;
    goto LABEL_10;
  }
  objc_msgSend(v6, "session:didSpotOnLocationComplete:", self, v4);
LABEL_11:

}

+ (id)_createNSXPCConnectionWithExportedObject:(id)a3 queue:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithMachServiceName:options:", CFSTR("com.apple.intelligentroutingd.xpc.media"), 4096);
  IRMakeXPCClientInterface();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setExportedInterface:", v8);

  if (v5)
    objc_msgSend(v7, "setExportedObject:", v5);
  IRMakeXPCServerInterface();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setRemoteObjectInterface:", v9);

  if (v6)
    objc_msgSend(v7, "_setQueue:", v6);

  return v7;
}

+ (id)_createResumedTemporaryNSXPCConnection
{
  void *v2;

  objc_msgSend(a1, "_createNSXPCConnectionWithExportedObject:queue:", 0, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resume");
  return v2;
}

- (BOOL)_isCandidateValid:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "candidateIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      objc_msgSend(v4, "nodes");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v5) = (unint64_t)objc_msgSend(v6, "count") < 0x21;

    }
  }
  else
  {
    LOBYTE(v5) = 0;
  }

  return (char)v5;
}

- (void)_serverConnectionInvalidated
{
  NSObject *v3;

  -[IRSession queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[IRSession _notifySessionHasFailed:desc:](self, "_notifySessionHasFailed:desc:", -12887, CFSTR("This session object is invalidated. Dispose of it and create a new one instead."));
}

- (void)_serverConnectionInterrupted
{
  NSObject *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  -[IRSession queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[IRSession setInterrupted:](self, "setInterrupted:", 1);
  v4 = (void *)IRLogObject;
  if (os_log_type_enabled((os_log_t)IRLogObject, OS_LOG_TYPE_DEFAULT))
  {
    v5 = v4;
    -[IRSession configuration](self, "configuration");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412290;
    v8 = v6;
    _os_log_impl(&dword_23FFAB000, v5, OS_LOG_TYPE_DEFAULT, "[IRSession]: interrupted with configuration: %@", (uint8_t *)&v7, 0xCu);

  }
}

- (void)_notifySessionHasFailed:(int64_t)a3 desc:(id)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  v10 = *MEMORY[0x24BDD0FD8];
  v11[0] = a4;
  v6 = (void *)MEMORY[0x24BDBCE70];
  v7 = a4;
  objc_msgSend(v6, "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  IRErrorWithCodeAndUserInfo(a3, (uint64_t)v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[IRSession _sessionDidFailWithError:](self, "_sessionDidFailWithError:", v9);
}

- (void)_checkAndRecoverIfNeeded
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  if (-[IRSession interrupted](self, "interrupted"))
  {
    v3 = (void *)IRLogObject;
    if (os_log_type_enabled((os_log_t)IRLogObject, OS_LOG_TYPE_DEFAULT))
    {
      v4 = v3;
      -[IRSession configuration](self, "configuration");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138412290;
      v10 = v5;
      _os_log_impl(&dword_23FFAB000, v4, OS_LOG_TYPE_DEFAULT, "[IRSession]: Recovering with configuration: %@", (uint8_t *)&v9, 0xCu);

    }
    -[IRSession connection](self, "connection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "remoteObjectProxy");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[IRSession configuration](self, "configuration");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_runWithConfiguration:", v8);

    -[IRSession setInterrupted:](self, "setInterrupted:", 0);
  }
}

- (void)_manageSessionAvailableNotificationObservation:(BOOL)a3
{
  _BOOL4 v3;
  const char *v5;
  NSObject *v6;
  NSObject *v7;
  const __CFString *v8;
  _QWORD handler[4];
  id v10;
  _BYTE location[12];
  __int16 v12;
  const __CFString *v13;
  uint64_t v14;

  v3 = a3;
  v14 = *MEMORY[0x24BDAC8D0];
  if (a3)
  {
    objc_initWeak((id *)location, self);
    v5 = (const char *)objc_msgSend(CFSTR("IRSessionAvailableNotification"), "UTF8String");
    -[IRSession queue](self, "queue");
    v6 = objc_claimAutoreleasedReturnValue();
    handler[0] = MEMORY[0x24BDAC760];
    handler[1] = 3221225472;
    handler[2] = __60__IRSession__manageSessionAvailableNotificationObservation___block_invoke;
    handler[3] = &unk_25103FB00;
    objc_copyWeak(&v10, (id *)location);
    notify_register_dispatch(v5, &self->_token, v6, handler);

    objc_destroyWeak(&v10);
    objc_destroyWeak((id *)location);
  }
  else
  {
    notify_cancel(self->_token);
  }
  v7 = IRLogObject;
  if (os_log_type_enabled((os_log_t)IRLogObject, OS_LOG_TYPE_DEFAULT))
  {
    v8 = CFSTR("unregistered");
    if (v3)
      v8 = CFSTR("registered");
    *(_DWORD *)location = 138412546;
    *(_QWORD *)&location[4] = v8;
    v12 = 2112;
    v13 = CFSTR("IRSessionAvailableNotification");
    _os_log_impl(&dword_23FFAB000, v7, OS_LOG_TYPE_DEFAULT, "[IRSession]: %@ to %@", location, 0x16u);
  }
}

void __60__IRSession__manageSessionAvailableNotificationObservation___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  NSObject *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "queue");
    v3 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v3);

    v4 = (void *)IRLogObject;
    if (os_log_type_enabled((os_log_t)IRLogObject, OS_LOG_TYPE_DEFAULT))
    {
      v5 = (void *)MEMORY[0x24BDD16E0];
      v6 = v4;
      objc_msgSend(v5, "numberWithBool:", objc_msgSend(v2, "interrupted"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138412290;
      v9 = v7;
      _os_log_impl(&dword_23FFAB000, v6, OS_LOG_TYPE_DEFAULT, "[IRSession]: handling connection available notification, interrupted: %@", (uint8_t *)&v8, 0xCu);

    }
    objc_msgSend(v2, "_checkAndRecoverIfNeeded");
  }

}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_connection, a3);
}

- (BOOL)interrupted
{
  return self->_interrupted;
}

- (void)setInterrupted:(BOOL)a3
{
  self->_interrupted = a3;
}

- (int)token
{
  return self->_token;
}

- (void)setToken:(int)a3
{
  self->_token = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)runWithConfiguration:(void *)a3 .cold.1(void *a1, void *a2, void *a3)
{
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  const __CFString *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v5 = a1;
  objc_msgSend(a2, "configuration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "serviceToken");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a3, "serviceToken");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "connection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = CFSTR("NO");
  v11 = 138412802;
  v12 = v7;
  v13 = 2112;
  if (!v9)
    v10 = CFSTR("YES");
  v14 = v8;
  v15 = 2112;
  v16 = v10;
  _os_log_error_impl(&dword_23FFAB000, v5, OS_LOG_TYPE_ERROR, "[ErrorId - IRSession run error] [IRSession]: couldn't run with configuration. current configuration: %@, provided configuration: %@, isSessionInvalidated: %@", (uint8_t *)&v11, 0x20u);

}

- (void)updateCandidates:(void *)a3 .cold.1(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  v4 = OUTLINED_FUNCTION_6(a1, a2);
  objc_msgSend(a3, "connection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_23FFAB000, v6, v7, "[ErrorId - IRSession update error] [IRSession]: candidates cant be updated, session was never run: %@, isSessionInvalidated: %@", v8, v9, v10, v11, v12);

  OUTLINED_FUNCTION_3();
}

- (void)updateCandidates:(void *)a3 .cold.2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  v4 = OUTLINED_FUNCTION_6(a1, a2);
  objc_msgSend(a3, "connection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_23FFAB000, v6, v7, "[ErrorId - IRSession update error] [IRSession]: candidate cant be updated, its corrupted: %@, isSessionInvalidated: %@", v8, v9, v10, v11, v12);

  OUTLINED_FUNCTION_3();
}

- (void)deleteCandidate:(void *)a3 .cold.1(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  v4 = OUTLINED_FUNCTION_6(a1, a2);
  objc_msgSend(a3, "connection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_23FFAB000, v6, v7, "[ErrorId - IRSession delete error] [IRSession]: candidate cant be deleted, session was never run: %@, isSessionInvalidated: %@", v8, v9, v10, v11, v12);

  OUTLINED_FUNCTION_3();
}

- (void)requestCurrentContextWithBundleID:(void *)a1 .cold.1(void *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = OUTLINED_FUNCTION_5(a1);
  objc_msgSend(a2, "connection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2(&dword_23FFAB000, v5, v6, "[ErrorId - IRSession request context with bundleID error] [IRSession]: cant request current context, session was never run, isSessionInvalidated: %@", v7, v8, v9, v10, 2u);

  OUTLINED_FUNCTION_4();
}

- (void)requestCurrentContextWithBundleID:(os_log_t)log .cold.2(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_23FFAB000, log, OS_LOG_TYPE_ERROR, "[ErrorId - IRSession requestCurrentContextWithBundleID error] [IRSession]: bundleID must not be nil", v1, 2u);
}

- (void)setSpotOnLocationWithParameters:(void *)a1 .cold.1(void *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = OUTLINED_FUNCTION_5(a1);
  objc_msgSend(a2, "connection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2(&dword_23FFAB000, v5, v6, "[ErrorId - IRSession setSpotOnLocationWithParameters error] [IRSession]: session was never run: isSessionInvalidated: %@", v7, v8, v9, v10, 2u);

  OUTLINED_FUNCTION_4();
}

@end
