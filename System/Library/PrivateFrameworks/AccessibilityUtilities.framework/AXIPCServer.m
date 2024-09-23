@implementation AXIPCServer

- (void)_handleIncomingMessage:(id)a3 securityToken:(id)a4 auditToken:(id *)a5 clientPort:(unsigned int)a6 completion:(id)a7
{
  uint64_t v7;
  void (**v11)(void *, _QWORD);
  void (**v12)(void *, _QWORD);
  void *v13;
  void *v14;
  id v15;
  void (**v16)(void *, uint64_t);
  __int128 v17;
  NSObject *v18;
  NSObject *v19;
  __int128 v20;
  _OWORD v21[2];
  uint8_t buf[16];
  __int128 v23;
  _QWORD aBlock[5];
  id v25;

  v7 = *(_QWORD *)&a6;
  v11 = (void (**)(void *, _QWORD))a7;
  if (v11)
    v12 = v11;
  else
    v12 = (void (**)(void *, _QWORD))&__block_literal_global_130;
  +[AXIPCMessage archivedMessageFromData:](AXIPCMessage, "archivedMessageFromData:", a3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13)
  {
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __85__AXIPCServer__handleIncomingMessage_securityToken_auditToken_clientPort_completion___block_invoke_132;
    aBlock[3] = &unk_1E24C7098;
    aBlock[4] = self;
    v15 = v13;
    v25 = v15;
    v16 = (void (**)(void *, uint64_t))_Block_copy(aBlock);
    v17 = *(_OWORD *)&a5->var0[4];
    *(_OWORD *)buf = *(_OWORD *)a5->var0;
    v23 = v17;
    if (-[AXIPCServer _clientHasEntitlementWithPort:auditToken:message:completion:](self, "_clientHasEntitlementWithPort:auditToken:message:completion:", v7, buf, v15, v12))
    {
      if (objc_msgSend(v15, "processedMessage"))
      {
        v16[2](v16, 1);
      }
      else
      {
        v20 = *(_OWORD *)&a5->var0[4];
        v21[0] = *(_OWORD *)a5->var0;
        v21[1] = v20;
        objc_msgSend(v15, "setAuditToken:", v21);
        objc_msgSend(v15, "setClientPort:", v7);
        if ((((uint64_t (*)(void *, _QWORD))v16[2])(v16, 0) & 1) == 0)
          -[AXIPCServer _processValidatedMessage:completion:](self, "_processValidatedMessage:completion:", v15, v12);
      }
    }
    else
    {
      v16[2](v16, 1);
      AXLogIPC();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18C62B000, v19, OS_LOG_TYPE_DEFAULT, "Not privileged to communicate", buf, 2u);
      }

      v12[2](v12, 0);
    }

  }
  else
  {
    AXLogIPC();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18C62B000, v18, OS_LOG_TYPE_DEFAULT, "Server could not handle received message.  inData could not be unarchived to a message object", buf, 2u);
    }

    v12[2](v12, 0);
  }

}

- (NSMutableArray)delayedMessages
{
  return self->_delayedMessages;
}

- (BOOL)_clientHasEntitlementWithPort:(unsigned int)a3 auditToken:(id *)a4 message:(id)a5 completion:(id)a6
{
  uint64_t v8;
  id v10;
  id v11;
  uint64_t v12;
  NSMutableDictionary *entitlements;
  void *v14;
  void *v15;
  void *v16;
  NSMutableSet *connectedClients;
  void *v18;
  void *v19;
  __int128 v20;
  BOOL v21;
  NSObject *v22;
  __int128 v24;
  void *v25;
  void *v26;
  void *v27;
  _QWORD v28[4];
  int v29;
  _BYTE buf[32];
  uint64_t v31;

  v8 = *(_QWORD *)&a3;
  v31 = *MEMORY[0x1E0C80C00];
  v10 = a5;
  v11 = a6;
  v12 = objc_msgSend(v10, "key");
  entitlements = self->_entitlements;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](entitlements, "objectForKey:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v15, "copy");

  if (objc_msgSend(v16, "count"))
  {
    connectedClients = self->_connectedClients;
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __75__AXIPCServer__clientHasEntitlementWithPort_auditToken_message_completion___block_invoke;
    v28[3] = &__block_descriptor_36_e12_B24__0_8_B16l;
    v29 = v8;
    -[NSMutableSet objectsPassingTest:](connectedClients, "objectsPassingTest:", v28);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "anyObject");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = *(_OWORD *)&a4->var0[4];
    *(_OWORD *)buf = *(_OWORD *)a4->var0;
    *(_OWORD *)&buf[16] = v20;
    v21 = -[AXIPCServer _hasEntitlement:entitlements:clientPort:auditToken:message:completion:](self, "_hasEntitlement:entitlements:clientPort:auditToken:message:completion:", v19, v16, v8, buf, v10, v11);
    if (!v21)
    {
      AXLogIPC();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        v24 = *(_OWORD *)&a4->var0[4];
        *(_OWORD *)buf = *(_OWORD *)a4->var0;
        *(_OWORD *)&buf[16] = v24;
        -[AXIPCServer _clientIdentificationForAuditToken:](self, "_clientIdentificationForAuditToken:", buf);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "description");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), CFSTR(" "));
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        *(_QWORD *)&buf[4] = v25;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v10;
        *(_WORD *)&buf[22] = 2114;
        *(_QWORD *)&buf[24] = v27;
        _os_log_error_impl(&dword_18C62B000, v22, OS_LOG_TYPE_ERROR, "Client (%{public}@) does not have required entitlement for message: %{public}@. \nNeeds one of:%{public}@", buf, 0x20u);

      }
    }

  }
  else
  {
    v21 = 1;
  }

  return v21;
}

- (void)_processValidatedMessage:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD);
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  const char *v15;
  int v16;
  uint64_t (*v17)(void *, const char *, id, NSObject *);
  NSObject *v18;
  id v19;
  void (**v20)(_QWORD, _QWORD);
  NSObject *v21;
  int v22;
  _QWORD aBlock[4];
  void (**v24)(id, _QWORD);
  uint8_t buf[4];
  int v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, _QWORD))a4;
  objc_msgSend(v6, "setProcessedMessage:", 1);
  v8 = objc_msgSend(v6, "key");
  if (v8 == AXIPCRegisterClientWithServer)
  {
    -[AXIPCServer _handleClientRegistration:](self, "_handleClientRegistration:", v6);
    v7[2](v7, 0);
  }
  else
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithInt:", objc_msgSend(v6, "key"));
    -[AXIPCServer handlers](self, "handlers");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKey:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __51__AXIPCServer__processValidatedMessage_completion___block_invoke;
    aBlock[3] = &unk_1E24C70C0;
    v24 = v7;
    v12 = _Block_copy(aBlock);
    objc_msgSend(v11, "target");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v11, "selector");
    if (v13 && (v15 = (const char *)v14) != 0)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        v16 = objc_msgSend(v11, "async");
        v17 = (uint64_t (*)(void *, const char *, id, NSObject *))objc_msgSend(v13, "methodForSelector:", v15);
        if (v16)
        {
          v18 = _Block_copy(v12);
          v19 = (id)v17(v13, v15, v6, v18);
        }
        else
        {
          ((void (*)(void *, const char *, id))v17)(v13, v15, v6);
          v18 = objc_claimAutoreleasedReturnValue();
          (*((void (**)(void *, NSObject *))v12 + 2))(v12, v18);
        }
      }
      else
      {
        AXLogIPC();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          -[AXIPCServer _processValidatedMessage:completion:].cold.1(v15, v18);
      }
    }
    else
    {
      objc_msgSend(v11, "handler");
      v20 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      if (!v20)
      {
        AXLogIPC();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          v22 = objc_msgSend(v6, "key");
          *(_DWORD *)buf = 67109120;
          v26 = v22;
          _os_log_impl(&dword_18C62B000, v21, OS_LOG_TYPE_DEFAULT, "Warning: no handler was for message key: (%d). Falling back to default handler", buf, 8u);
        }

        -[AXIPCServer defaultHandler](self, "defaultHandler");
        v20 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      }
      ((void (**)(_QWORD, id))v20)[2](v20, v6);
      v18 = objc_claimAutoreleasedReturnValue();
      (*((void (**)(void *, NSObject *))v12 + 2))(v12, v18);

    }
  }

}

void __51__AXIPCServer__processValidatedMessage_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  id v4;
  void *v5;
  char v6;
  void *v7;
  NSObject *v8;
  os_log_type_t v9;
  void *v10;
  void *v11;
  id v12;
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    v12 = 0;
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", a2, 1, &v12);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v12;
    if (v4)
    {
      objc_msgSend(MEMORY[0x1E0CF39F8], "sharedInstance");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "ignoreLogging");

      if ((v6 & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CF39F8], "identifier");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        AXLoggerForFacility();
        v8 = objc_claimAutoreleasedReturnValue();

        v9 = AXOSLogLevelFromAXLogLevel();
        if (os_log_type_enabled(v8, v9))
        {
          AXColorizeFormatLog();
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          _AXStringForArgs();
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v8, v9))
          {
            *(_DWORD *)buf = 138543362;
            v14 = v11;
            _os_log_impl(&dword_18C62B000, v8, v9, "%{public}@", buf, 0xCu);
          }

        }
      }
    }

  }
  else
  {
    v3 = 0;
  }
  (*(void (**)(_QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32));

}

- (NSMutableDictionary)handlers
{
  return self->_handlers;
}

- (AXIPCServer)initWithServiceName:(id)a3 perPidService:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  AXIPCServer *v7;
  AXIPCServer *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v4 = a4;
  v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)AXIPCServer;
  v7 = -[AXIPCServer init](&v12, sel_init);
  v8 = v7;
  if (v7)
  {
    -[AXIPCServer setServiceName:](v7, "setServiceName:", v6);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXIPCServer setHandlers:](v8, "setHandlers:", v9);

    -[AXIPCServer setPerPidService:](v8, "setPerPidService:", v4);
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXIPCServer setDelayedMessages:](v8, "setDelayedMessages:", v10);

  }
  return v8;
}

- (AXIPCServer)initWithPort:(unsigned int)a3 serviceRunLoopSource:(__CFRunLoopSource *)a4
{
  AXIPCServer *v6;
  AXIPCServer *v7;

  v6 = -[AXIPCServer initWithServiceName:perPidService:](self, "initWithServiceName:perPidService:", 0, 0);
  v7 = v6;
  if (v6)
  {
    v6->_assignedServerPort = a3;
    if (a4)
      v6->_serverRunLoopSource = (__CFRunLoopSource *)CFRetain(a4);
  }
  return v7;
}

- (void)dealloc
{
  objc_super v3;

  if (-[AXIPCServer isRunning](self, "isRunning"))
    -[AXIPCServer stopServerWithError:](self, "stopServerWithError:", 0);
  v3.receiver = self;
  v3.super_class = (Class)AXIPCServer;
  -[AXIPCServer dealloc](&v3, sel_dealloc);
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  _BOOL4 v6;
  const __CFString *v7;
  void *v8;
  objc_super v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v10.receiver = self;
  v10.super_class = (Class)AXIPCServer;
  -[AXIPCServer description](&v10, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXIPCServer serviceName](self, "serviceName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[AXIPCServer isRunning](self, "isRunning");
  v7 = CFSTR("NO");
  if (v6)
    v7 = CFSTR("YES");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@. Serivce Name:%@. Running:%@ Server Port:%d. Clients:%@. Entitlements:%@. RunLoopSource:%p"), v4, v5, v7, self->_serverPort, self->_connectedClients, self->_entitlements, self->_serverRunLoopSource);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (void)setServiceRunLoopSource:(__CFRunLoopSource *)a3
{
  if (self->_serverRunLoopSource)
    _AXAssert();
  if (a3)
    CFRetain(a3);
  self->_serverRunLoopSource = a3;
}

- (id)defaultHandler
{
  id defaultHandler;
  void *v4;
  id v5;

  defaultHandler = self->_defaultHandler;
  if (!defaultHandler)
  {
    v4 = (void *)objc_msgSend(&__block_literal_global_14, "copy");
    v5 = self->_defaultHandler;
    self->_defaultHandler = v4;

    defaultHandler = self->_defaultHandler;
  }
  return _Block_copy(defaultHandler);
}

uint64_t __29__AXIPCServer_defaultHandler__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  NSObject *v4;
  uint8_t buf[4];
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("A message was received that could not be understood: %@"), a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", CFSTR("AXIPCMessageHandlerException"), v2, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    AXLogIPC();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v7 = v3;
      _os_log_impl(&dword_18C62B000, v4, OS_LOG_TYPE_DEFAULT, "AX: %{public}@", buf, 0xCu);
    }

  }
  return 0;
}

- (void)setDefaultHandler:(id)a3
{
  id v4;
  id defaultHandler;
  void *v6;
  id v7;
  id v8;

  v4 = a3;
  defaultHandler = self->_defaultHandler;
  if (defaultHandler != v4)
  {
    v8 = v4;
    if (defaultHandler)
    {
      self->_defaultHandler = 0;

      v4 = v8;
    }
    if (v4)
    {
      v6 = (void *)objc_msgSend(v8, "copy");
      v7 = self->_defaultHandler;
      self->_defaultHandler = v6;

      v4 = v8;
    }
  }

}

- (id)clientInvalidationCallback
{
  return _Block_copy(self->_clientInvalidationHandler);
}

- (void)setClientInvalidationCallback:(id)a3
{
  id v4;
  id clientInvalidationHandler;
  void *v6;
  id v7;
  id v8;

  v4 = a3;
  clientInvalidationHandler = self->_clientInvalidationHandler;
  if (clientInvalidationHandler != v4)
  {
    v8 = v4;
    if (clientInvalidationHandler)
    {
      self->_clientInvalidationHandler = 0;

      v4 = v8;
    }
    if (v4)
    {
      v6 = (void *)objc_msgSend(v8, "copy");
      v7 = self->_clientInvalidationHandler;
      self->_clientInvalidationHandler = v6;

      v4 = v8;
    }
  }

}

- (BOOL)startServerWithError:(id *)a3
{
  void *v5;
  unsigned int assignedServerPort;
  const __CFString *v7;

  -[AXIPCServer serviceName](self, "serviceName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "length"))
  {

  }
  else
  {
    assignedServerPort = self->_assignedServerPort;

    if (!assignedServerPort)
    {
      v7 = CFSTR("Cannot start server. Service name was empty");
      return !-[AXIPCServer _handleErrorWithMessage:outError:](self, "_handleErrorWithMessage:outError:", v7, a3);
    }
  }
  if (-[AXIPCServer isRunning](self, "isRunning"))
  {
    v7 = CFSTR("Cannot start server. It is already running.");
  }
  else
  {
    -[AXIPCServer _startServerThread](self, "_startServerThread");
    v7 = 0;
  }
  return !-[AXIPCServer _handleErrorWithMessage:outError:](self, "_handleErrorWithMessage:outError:", v7, a3);
}

- (BOOL)stopServerWithError:(id *)a3
{
  __CFRunLoopSource *serverRunLoopSource;
  const __CFString *v6;

  if (-[AXIPCServer isRunning](self, "isRunning"))
  {
    serverRunLoopSource = self->_serverRunLoopSource;
    if (serverRunLoopSource)
    {
      CFRunLoopSourceInvalidate(serverRunLoopSource);
      CFRelease(self->_serverRunLoopSource);
      self->_serverRunLoopSource = 0;
    }
    -[AXIPCServer setRunning:](self, "setRunning:", 0);
    AXIPCServerSetServerPort(self->_serverPort, 0);
    v6 = 0;
  }
  else
  {
    v6 = CFSTR("Cannot stop server. It is not running.");
  }
  return !-[AXIPCServer _handleErrorWithMessage:outError:](self, "_handleErrorWithMessage:outError:", v6, a3);
}

- (void)setHandler:(id)a3 forKey:(int)a4
{
  uint64_t v4;
  void *v6;
  AXIPCServerMessageHandlerContext *v7;
  void *v8;
  id v9;

  v4 = *(_QWORD *)&a4;
  v9 = a3;
  if (v9)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithInt:", v4);
    v7 = -[AXIPCServerMessageHandlerContext initWithHandler:]([AXIPCServerMessageHandlerContext alloc], "initWithHandler:", v9);
    -[AXIPCServer handlers](self, "handlers");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKey:", v7, v6);

  }
  else
  {
    -[AXIPCServer removeHandlerForKey:](self, "removeHandlerForKey:", v4);
  }

}

- (void)removeHandlerForKey:(int)a3
{
  void *v4;
  id v5;

  v5 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithInt:", *(_QWORD *)&a3);
  -[AXIPCServer handlers](self, "handlers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObjectForKey:", v5);

}

- (void)_registerContext:(id)a3 forKey:(int)a4
{
  uint64_t v4;
  objc_class *v6;
  id v7;
  void *v8;
  id v9;

  v4 = *(_QWORD *)&a4;
  v6 = (objc_class *)MEMORY[0x1E0CB37E8];
  v7 = a3;
  v9 = (id)objc_msgSend([v6 alloc], "initWithInt:", v4);
  -[AXIPCServer handlers](self, "handlers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKey:", v7, v9);

}

- (void)_addPossibleRequiredEntitlementsToMessageWithKey:(int)a3 first:(id)a4 vothers:(char *)a5
{
  uint64_t v6;
  id v8;
  id v9;
  id v10;
  id *v11;
  char *v12;

  v6 = *(_QWORD *)&a3;
  v8 = a4;
  -[AXIPCServer addPossibleRequiredEntitlement:forMessageWithKey:](self, "addPossibleRequiredEntitlement:forMessageWithKey:", v8, v6);
  v12 = a5 + 8;
  v9 = *(id *)a5;
  if (v9)
  {
    v10 = v9;
    do
    {
      -[AXIPCServer addPossibleRequiredEntitlement:forMessageWithKey:](self, "addPossibleRequiredEntitlement:forMessageWithKey:", v10, v6);

      v11 = (id *)v12;
      v12 += 8;
      v10 = *v11;
    }
    while (v10);
  }

}

- (void)setHandlerWithTarget:(id)a3 selector:(SEL)a4 forKey:(int)a5
{
  -[AXIPCServer setHandlerWithTarget:selector:async:forKey:](self, "setHandlerWithTarget:selector:async:forKey:", a3, a4, 0, *(_QWORD *)&a5);
}

- (void)setHandlerWithTarget:(id)a3 selector:(SEL)a4 async:(BOOL)a5 forKey:(int)a6
{
  uint64_t v6;
  _BOOL8 v7;
  AXIPCServerMessageHandlerContext *v10;
  id v11;

  v6 = *(_QWORD *)&a6;
  v7 = a5;
  v11 = a3;
  if (v11 && a4)
  {
    v10 = -[AXIPCServerMessageHandlerContext initWithTarget:selector:async:]([AXIPCServerMessageHandlerContext alloc], "initWithTarget:selector:async:", v11, a4, v7);
    -[AXIPCServer _registerContext:forKey:](self, "_registerContext:forKey:", v10, v6);

  }
  else
  {
    -[AXIPCServer removeHandlerForKey:](self, "removeHandlerForKey:", v6);
  }

}

- (void)setHandlerWithTarget:(id)a3 selector:(SEL)a4 forKey:(int)a5 possibleRequiredEntitlements:(id)a6
{
  uint64_t v6;
  id v10;
  uint64_t v11;

  v6 = *(_QWORD *)&a5;
  v10 = a6;
  -[AXIPCServer setHandlerWithTarget:selector:forKey:](self, "setHandlerWithTarget:selector:forKey:", a3, a4, v6);
  if (v10)
    -[AXIPCServer _addPossibleRequiredEntitlementsToMessageWithKey:first:vothers:](self, "_addPossibleRequiredEntitlementsToMessageWithKey:first:vothers:", v6, v10, &v11);

}

- (void)setHandlerWithTarget:(id)a3 selector:(SEL)a4 async:(BOOL)a5 forKey:(int)a6 possibleRequiredEntitlements:(id)a7
{
  uint64_t v7;
  _BOOL8 v8;
  id v12;
  uint64_t v13;

  v7 = *(_QWORD *)&a6;
  v8 = a5;
  v12 = a7;
  -[AXIPCServer setHandlerWithTarget:selector:async:forKey:](self, "setHandlerWithTarget:selector:async:forKey:", a3, a4, v8, v7);
  if (v12)
    -[AXIPCServer _addPossibleRequiredEntitlementsToMessageWithKey:first:vothers:](self, "_addPossibleRequiredEntitlementsToMessageWithKey:first:vothers:", v7, v12, &v13);

}

- (void)removeAllHandlersForTarget:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _QWORD v15[4];
  id v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__6;
  v22 = __Block_byref_object_dispose__6;
  v23 = 0;
  -[AXIPCServer handlers](self, "handlers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __42__AXIPCServer_removeAllHandlersForTarget___block_invoke;
  v15[3] = &unk_1E24C6F70;
  v6 = v4;
  v16 = v6;
  v17 = &v18;
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v15);
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v7 = (id)v19[5];
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v11, v24, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v7);
        objc_msgSend(v5, "removeObjectForKey:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v10++), (_QWORD)v11);
      }
      while (v8 != v10);
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v11, v24, 16);
    }
    while (v8);
  }

  _Block_object_dispose(&v18, 8);
}

void __42__AXIPCServer_removeAllHandlersForTarget___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;

  v11 = a2;
  objc_msgSend(a3, "target");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(void **)(a1 + 32);

  if (v5 == v6)
  {
    v7 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    if (!v7)
    {
      v8 = objc_opt_new();
      v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v10 = *(void **)(v9 + 40);
      *(_QWORD *)(v9 + 40) = v8;

      v7 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    }
    objc_msgSend(v7, "addObject:", v11);
  }

}

- (void)addPossibleRequiredEntitlement:(id)a3 forMessageWithKey:(int)a4
{
  uint64_t v4;
  NSMutableDictionary *v6;
  NSMutableDictionary *entitlements;
  void *v8;
  void *v9;
  id v10;

  v4 = *(_QWORD *)&a4;
  v10 = a3;
  if (!self->_entitlements)
  {
    v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    entitlements = self->_entitlements;
    self->_entitlements = v6;

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](self->_entitlements, "objectForKey:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    v9 = (void *)objc_opt_new();
    -[NSMutableDictionary setObject:forKey:](self->_entitlements, "setObject:forKey:", v9, v8);
  }
  objc_msgSend(v9, "addObject:", v10);

}

- (void)removePossibleRequiredEntitlement:(id)a3 forMessageWithKey:(int)a4
{
  uint64_t v4;
  void *v6;
  void *v7;
  void *v8;
  NSMutableDictionary *entitlements;
  id v10;

  v4 = *(_QWORD *)&a4;
  v10 = a3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](self->_entitlements, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "removeObject:", v10);
    if (!objc_msgSend(v8, "count"))
    {
      -[NSMutableDictionary removeObjectForKey:](self->_entitlements, "removeObjectForKey:", v6);
      if (!-[NSMutableDictionary count](self->_entitlements, "count"))
      {
        entitlements = self->_entitlements;
        self->_entitlements = 0;

      }
    }
  }

}

BOOL __75__AXIPCServer__clientHasEntitlementWithPort_auditToken_message_completion___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  int v5;
  int v6;

  v5 = objc_msgSend(a2, "port");
  v6 = *(_DWORD *)(a1 + 32);
  if (v5 == v6)
    *a3 = 1;
  return v5 == v6;
}

- (BOOL)_hasEntitlement:(id)a3 entitlements:(id)a4 clientPort:(unsigned int)a5 auditToken:(id *)a6 message:(id)a7 completion:(id)a8
{
  uint64_t v10;
  id v13;
  id v14;
  NSMutableDictionary *v15;
  NSMutableDictionary *validSecurityTokens;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  char v23;
  __int128 v24;
  void *v25;
  AXIPCDelayedMessage *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  CFRunLoopRef Current;
  NSObject *v32;
  id v33;
  BOOL v34;
  NSObject *v35;
  __int128 v36;
  void *v37;
  __int128 v38;
  id v39;
  void *v40;
  NSObject *v41;
  void *v43;
  id v44;
  id v45;
  void *v46;
  id obj;
  void *v49;
  _QWORD block[5];
  id v51;
  __int128 *p_buf;
  uint64_t *v53;
  CFRunLoopRef v54;
  _QWORD v55[6];
  uint64_t v56;
  uint64_t *v57;
  uint64_t v58;
  char v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  _QWORD aBlock[5];
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  uint8_t v71[4];
  uint64_t v72;
  _BYTE v73[128];
  __int128 buf;
  __int128 v75;
  _BYTE v76[128];
  uint64_t v77;

  v10 = *(_QWORD *)&a5;
  v77 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v44 = a7;
  v45 = a8;
  v46 = v14;
  v43 = v13;
  if (v13)
  {
    if (!self->_validSecurityTokens)
    {
      v15 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      validSecurityTokens = self->_validSecurityTokens;
      self->_validSecurityTokens = v15;

    }
    v69 = 0u;
    v70 = 0u;
    v67 = 0u;
    v68 = 0u;
    v17 = v14;
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v67, v76, 16);
    if (v18)
    {
      v19 = *(_QWORD *)v68;
      while (2)
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v68 != v19)
            objc_enumerationMutation(v17);
          -[NSMutableDictionary objectForKey:](self->_validSecurityTokens, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v67 + 1) + 8 * i));
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v10);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = objc_msgSend(v21, "containsObject:", v22);

          if ((v23 & 1) != 0)
          {

            v34 = 1;
            goto LABEL_36;
          }
        }
        v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v67, v76, 16);
        if (v18)
          continue;
        break;
      }
    }

    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __85__AXIPCServer__hasEntitlement_entitlements_clientPort_auditToken_message_completion___block_invoke;
    aBlock[3] = &unk_1E24C6FB8;
    v24 = *(_OWORD *)&a6->var0[4];
    v65 = *(_OWORD *)a6->var0;
    v66 = v24;
    aBlock[4] = self;
    v49 = _Block_copy(aBlock);
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    *(_QWORD *)&v75 = 0x2020000000;
    BYTE8(v75) = 0;
    -[AXIPCServer delayedMessages](self, "delayedMessages");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = -[AXIPCDelayedMessage initWithMessage:completion:]([AXIPCDelayedMessage alloc], "initWithMessage:completion:", v44, v45);
    objc_msgSend(v25, "addObject:", v26);

    v62 = 0u;
    v63 = 0u;
    v60 = 0u;
    v61 = 0u;
    obj = v17;
    v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v60, v73, 16);
    if (v27)
    {
      v28 = *(_QWORD *)v61;
      while (2)
      {
        v29 = 0;
        do
        {
          if (*(_QWORD *)v61 != v28)
            objc_enumerationMutation(obj);
          v30 = *(_QWORD *)(*((_QWORD *)&v60 + 1) + 8 * v29);
          Current = CFRunLoopGetCurrent();
          v56 = 0;
          v57 = &v56;
          v58 = 0x2020000000;
          v59 = 0;
          v55[0] = MEMORY[0x1E0C809B0];
          v55[1] = 3221225472;
          v55[2] = __85__AXIPCServer__hasEntitlement_entitlements_clientPort_auditToken_message_completion___block_invoke_124;
          v55[3] = &unk_1E24C6FE0;
          v55[4] = self;
          v55[5] = Current;
          if (_hasEntitlement_entitlements_clientPort_auditToken_message_completion__onceToken != -1)
            dispatch_once(&_hasEntitlement_entitlements_clientPort_auditToken_message_completion__onceToken, v55);
          v32 = _hasEntitlement_entitlements_clientPort_auditToken_message_completion__SecurityCheckQueue;
          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = __85__AXIPCServer__hasEntitlement_entitlements_clientPort_auditToken_message_completion___block_invoke_2;
          block[3] = &unk_1E24C7008;
          p_buf = &buf;
          v33 = v49;
          block[4] = v30;
          v51 = v33;
          v53 = &v56;
          v54 = Current;
          dispatch_async(v32, block);
          while (!*((_BYTE *)v57 + 24))
            CFRunLoopRunSpecific();
          if (*(_BYTE *)(*((_QWORD *)&buf + 1) + 24))
          {
            -[NSMutableDictionary objectForKey:](self->_validSecurityTokens, "objectForKey:", v30);
            v39 = (id)objc_claimAutoreleasedReturnValue();
            if (!v39)
            {
              v39 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
              -[NSMutableDictionary setObject:forKey:](self->_validSecurityTokens, "setObject:forKey:", v39, v30);
            }
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v10);
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v39, "addObject:", v40);

            AXLogIPC();
            v41 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)v71 = 138412290;
              v72 = v30;
              _os_log_debug_impl(&dword_18C62B000, v41, OS_LOG_TYPE_DEBUG, "Client does have entitlement: %@", v71, 0xCu);
            }

            _Block_object_dispose(&v56, 8);
            goto LABEL_35;
          }

          _Block_object_dispose(&v56, 8);
          ++v29;
        }
        while (v29 != v27);
        v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v60, v73, 16);
        if (v27)
          continue;
        break;
      }
    }
LABEL_35:

    v34 = *(_BYTE *)(*((_QWORD *)&buf + 1) + 24) != 0;
    _Block_object_dispose(&buf, 8);

  }
  else
  {
    AXLogIPC();
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
    {
      v36 = *(_OWORD *)&a6->var0[4];
      buf = *(_OWORD *)a6->var0;
      v75 = v36;
      -[AXIPCServer _clientIdentificationForAuditToken:](self, "_clientIdentificationForAuditToken:", &buf);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf) = 138543362;
      *(_QWORD *)((char *)&buf + 4) = v37;
      _os_log_impl(&dword_18C62B000, v35, OS_LOG_TYPE_INFO, "taking entitlement slowpath for %{public}@", (uint8_t *)&buf, 0xCu);

    }
    v38 = *(_OWORD *)&a6->var0[4];
    buf = *(_OWORD *)a6->var0;
    v75 = v38;
    v34 = -[AXIPCServer __slowpath__clientWithAuditToken:hasRequiredEntitlementFromSet:](self, "__slowpath__clientWithAuditToken:hasRequiredEntitlementFromSet:", &buf, v14);
  }
LABEL_36:

  return v34;
}

BOOL __85__AXIPCServer__hasEntitlement_entitlements_clientPort_auditToken_message_completion___block_invoke(uint64_t a1, void *a2)
{
  __CFString *v3;
  const __CFAllocator *v4;
  __int128 v5;
  __SecTask *v6;
  __SecTask *v7;
  CFTypeRef v8;
  NSObject *v9;
  CFTypeID v10;
  _BOOL8 v11;
  void *v13;
  __int128 v14;
  void *v15;
  CFErrorRef error;
  audit_token_t token;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  v5 = *(_OWORD *)(a1 + 56);
  *(_OWORD *)token.val = *(_OWORD *)(a1 + 40);
  *(_OWORD *)&token.val[4] = v5;
  v6 = SecTaskCreateWithAuditToken(v4, &token);
  if (v6)
  {
    v7 = v6;
    error = 0;
    v8 = SecTaskCopyValueForEntitlement(v6, v3, &error);
    if (error)
    {
      AXLogIPC();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        v13 = *(void **)(a1 + 32);
        v14 = *(_OWORD *)(a1 + 56);
        *(_OWORD *)token.val = *(_OWORD *)(a1 + 40);
        *(_OWORD *)&token.val[4] = v14;
        objc_msgSend(v13, "_clientIdentificationForAuditToken:", &token);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        token.val[0] = 138543618;
        *(_QWORD *)&token.val[1] = v15;
        LOWORD(token.val[3]) = 2112;
        *(_QWORD *)((char *)&token.val[3] + 2) = error;
        _os_log_error_impl(&dword_18C62B000, v9, OS_LOG_TYPE_ERROR, "(fast path) error getting entitlements for task %{public}@: %@", (uint8_t *)&token, 0x16u);

      }
    }
    if (v8)
    {
      v10 = CFGetTypeID(v8);
      v11 = v10 == CFBooleanGetTypeID() && CFBooleanGetValue((CFBooleanRef)v8) != 0;
      CFRelease(v8);
    }
    else
    {
      v11 = 0;
    }
    if (error)
    {
      CFRelease(error);
      error = 0;
    }
    CFRelease(v7);
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

void __85__AXIPCServer__hasEntitlement_entitlements_clientPort_auditToken_message_completion___block_invoke_124(uint64_t a1)
{
  NSObject *v2;
  dispatch_queue_t v3;
  void *v4;
  CFRunLoopSourceContext v5;

  dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = dispatch_queue_create("AccessibilitySecurityCheckQueue", v2);
  v4 = (void *)_hasEntitlement_entitlements_clientPort_auditToken_message_completion__SecurityCheckQueue;
  _hasEntitlement_entitlements_clientPort_auditToken_message_completion__SecurityCheckQueue = (uint64_t)v3;

  memset(&v5, 0, 72);
  v5.info = *(void **)(a1 + 32);
  v5.perform = (void (__cdecl *)(void *))_passiveEventHandler;
  _hasEntitlement_entitlements_clientPort_auditToken_message_completion__SourceRef = (uint64_t)CFRunLoopSourceCreate(0, 0, &v5);
  CFRunLoopAddSource(*(CFRunLoopRef *)(a1 + 40), (CFRunLoopSourceRef)_hasEntitlement_entitlements_clientPort_auditToken_message_completion__SourceRef, (CFRunLoopMode)*MEMORY[0x1E0C9B280]);
}

void __85__AXIPCServer__hasEntitlement_entitlements_clientPort_auditToken_message_completion___block_invoke_2(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  CFRunLoopSourceSignal((CFRunLoopSourceRef)_hasEntitlement_entitlements_clientPort_auditToken_message_completion__SourceRef);
  CFRunLoopWakeUp(*(CFRunLoopRef *)(a1 + 64));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
}

- (BOOL)__slowpath__clientWithAuditToken:(id *)a3 hasRequiredEntitlementFromSet:(id)a4
{
  id v5;
  const __CFAllocator *v6;
  __int128 v7;
  __SecTask *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const __CFString *v14;
  const __CFBoolean *v15;
  const __CFBoolean *v16;
  CFTypeID v17;
  BOOL v18;
  NSObject *v19;
  __int128 v20;
  void *v21;
  BOOL v22;
  CFErrorRef error;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  audit_token_t token;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  v7 = *(_OWORD *)&a3->var0[4];
  *(_OWORD *)token.val = *(_OWORD *)a3->var0;
  *(_OWORD *)&token.val[4] = v7;
  v8 = SecTaskCreateWithAuditToken(v6, &token);
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v9 = v5;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v27;
    while (2)
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v27 != v12)
          objc_enumerationMutation(v9);
        v14 = *(const __CFString **)(*((_QWORD *)&v26 + 1) + 8 * v13);
        error = 0;
        v15 = (const __CFBoolean *)SecTaskCopyValueForEntitlement(v8, v14, &error);
        if (v15)
        {
          v16 = v15;
          v17 = CFGetTypeID(v15);
          v18 = v17 == CFBooleanGetTypeID() && CFBooleanGetValue(v16) != 0;
          CFRelease(v16);
        }
        else
        {
          v18 = 0;
        }
        if (error)
        {
          AXLogIPC();
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          {
            v20 = *(_OWORD *)&a3->var0[4];
            *(_OWORD *)token.val = *(_OWORD *)a3->var0;
            *(_OWORD *)&token.val[4] = v20;
            -[AXIPCServer _clientIdentificationForAuditToken:](self, "_clientIdentificationForAuditToken:", &token);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            token.val[0] = 138543618;
            *(_QWORD *)&token.val[1] = v21;
            LOWORD(token.val[3]) = 2112;
            *(_QWORD *)((char *)&token.val[3] + 2) = error;
            _os_log_error_impl(&dword_18C62B000, v19, OS_LOG_TYPE_ERROR, "(slow path) error getting entitlements for task %{public}@: %@", (uint8_t *)&token, 0x16u);

          }
          if (error)
            CFRelease(error);
        }
        if (v18)
        {
          v22 = 1;
          goto LABEL_22;
        }
        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      if (v11)
        continue;
      break;
    }
  }
  v22 = 0;
LABEL_22:

  if (v8)
    CFRelease(v8);

  return v22;
}

- (void)setQueueSize:(unsigned int)a3
{
  self->_customQueueSize = a3;
  -[AXIPCServer _applyCustomQueueSize](self, "_applyCustomQueueSize");
}

- (void)_handleClientInvalidation:(unsigned int)a3
{
  NSMutableSet *connectedClients;
  void *v5;
  void *v6;
  void (**clientInvalidationHandler)(id, uint64_t, void *);
  uint64_t v8;
  void *v9;
  uint64_t v10;
  __int128 v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  NSObject *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  NSObject *v24;
  __int128 v25;
  NSMutableDictionary *obj;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _QWORD v31[4];
  unsigned int v32;
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  void *v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  connectedClients = self->_connectedClients;
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __41__AXIPCServer__handleClientInvalidation___block_invoke;
  v31[3] = &__block_descriptor_36_e12_B24__0_8_B16l;
  v32 = a3;
  -[NSMutableSet objectsPassingTest:](connectedClients, "objectsPassingTest:", v31);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "anyObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    clientInvalidationHandler = (void (**)(id, uint64_t, void *))self->_clientInvalidationHandler;
    if (clientInvalidationHandler)
    {
      v8 = objc_msgSend(v6, "port");
      objc_msgSend(v6, "identifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      clientInvalidationHandler[2](clientInvalidationHandler, v8, v9);

    }
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    obj = self->_validSecurityTokens;
    v10 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v27, v37, 16);
    if (v10)
    {
      v12 = v10;
      v13 = *(_QWORD *)v28;
      *(_QWORD *)&v11 = 138543618;
      v25 = v11;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v28 != v13)
            objc_enumerationMutation(obj);
          v15 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
          -[NSMutableDictionary objectForKey:](self->_validSecurityTokens, "objectForKey:", v15, v25);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v6, "port"));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v16, "containsObject:", v17);

          if (v18)
          {
            AXLogIPC();
            v19 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
            {
              objc_msgSend(v6, "identifier");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = v25;
              v34 = v15;
              v35 = 2114;
              v36 = v20;
              _os_log_impl(&dword_18C62B000, v19, OS_LOG_TYPE_INFO, "Cleaned up cached validation entitlement for %{public}@ = %{public}@", buf, 0x16u);

            }
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v6, "port"));
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "removeObject:", v21);

          }
        }
        v12 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v27, v37, 16);
      }
      while (v12);
    }

    AXLogIPC();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v6, "identifier");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v34 = v23;
      _os_log_impl(&dword_18C62B000, v22, OS_LOG_TYPE_INFO, "Client disconnected %{public}@", buf, 0xCu);

    }
    -[NSMutableSet removeObject:](self->_connectedClients, "removeObject:", v6);
  }
  else
  {
    AXLogIPC();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18C62B000, v24, OS_LOG_TYPE_INFO, "We don't have a record of this client being registered. Strange that we got an invalidation.", buf, 2u);
    }

  }
}

BOOL __41__AXIPCServer__handleClientInvalidation___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  int v5;
  int v6;

  v5 = objc_msgSend(a2, "port");
  v6 = *(_DWORD *)(a1 + 32);
  if (v5 == v6)
    *a3 = 1;
  return v5 == v6;
}

- (void)_applyCustomQueueSize
{
  int v3;
  _DWORD v4[2];
  __int16 v5;
  int v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = *a1;
  v4[0] = 67109376;
  v4[1] = v3;
  v5 = 1024;
  v6 = a2;
  _os_log_error_impl(&dword_18C62B000, log, OS_LOG_TYPE_ERROR, "could not set custom queue size to %u: 0x%08x", (uint8_t *)v4, 0xEu);
  OUTLINED_FUNCTION_5();
}

- (void)_startServerThread
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_0_5(&dword_18C62B000, v0, v1, "Could not start server thread. Could not allocate mach port. self:%{public}@", v2);
  OUTLINED_FUNCTION_5();
}

- (void)serverClientRegistrationInvalidated:(id)a3
{
  -[AXIPCServer _handleClientInvalidation:](self, "_handleClientInvalidation:", objc_msgSend(a3, "port"));
}

- (void)_handleClientRegistration:(id)a3
{
  id v4;
  NSMutableSet *v5;
  NSMutableSet *connectedClients;
  uint64_t v7;
  void *v8;
  void *v9;
  AXIPCServerClientRegistration *v10;
  NSObject *v11;
  uint8_t v12[16];

  v4 = a3;
  if (!self->_connectedClients)
  {
    v5 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    connectedClients = self->_connectedClients;
    self->_connectedClients = v5;

  }
  v7 = objc_msgSend(v4, "clientPort");
  objc_msgSend(v4, "payload");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", CFSTR("identifier"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v4, "clientPort") || objc_msgSend(v4, "clientPort") == -1)
  {
    AXLogIPC();
    v10 = (AXIPCServerClientRegistration *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v10->super, OS_LOG_TYPE_ERROR))
      -[AXIPCServer _handleClientRegistration:].cold.1(v4, &v10->super);
  }
  else
  {
    v10 = -[AXIPCServerClientRegistration initWithPort:identifier:]([AXIPCServerClientRegistration alloc], "initWithPort:identifier:", v7, v9);
    if (-[NSMutableSet containsObject:](self->_connectedClients, "containsObject:", v10))
    {
      AXLogIPC();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v12 = 0;
        _os_log_impl(&dword_18C62B000, v11, OS_LOG_TYPE_DEFAULT, "Clients only need to register once!", v12, 2u);
      }

    }
    else
    {
      -[AXIPCServerClientRegistration setDelegate:](v10, "setDelegate:", self);
      -[NSMutableSet addObject:](self->_connectedClients, "addObject:", v10);
    }
  }

}

BOOL __85__AXIPCServer__handleIncomingMessage_securityToken_auditToken_clientPort_completion___block_invoke_132(uint64_t a1, int a2)
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _QWORD v22[4];
  id v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "delayedMessages");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __85__AXIPCServer__handleIncomingMessage_securityToken_auditToken_clientPort_completion___block_invoke_2;
  v22[3] = &unk_1E24C7070;
  v23 = *(id *)(a1 + 40);
  v5 = objc_msgSend(v4, "indexOfObjectPassingTest:", v22);

  if (v5 != 0x7FFFFFFFFFFFFFFFLL)
  {
    if (a2)
    {
      objc_msgSend(*(id *)(a1 + 32), "delayedMessages");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "removeObjectAtIndex:", v5);

    }
    if (!v5)
    {
      v20 = 0u;
      v21 = 0u;
      v18 = 0u;
      v19 = 0u;
      objc_msgSend(*(id *)(a1 + 32), "delayedMessages", 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v19;
        do
        {
          for (i = 0; i != v9; ++i)
          {
            if (*(_QWORD *)v19 != v10)
              objc_enumerationMutation(v7);
            v12 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
            v13 = *(void **)(a1 + 32);
            objc_msgSend(v12, "message");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "completion");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "_processValidatedMessage:completion:", v14, v15);

          }
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
        }
        while (v9);
      }

      objc_msgSend(*(id *)(a1 + 32), "delayedMessages");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "removeAllObjects");

    }
  }

  return v5 != 0x7FFFFFFFFFFFFFFFLL;
}

BOOL __85__AXIPCServer__handleIncomingMessage_securityToken_auditToken_clientPort_completion___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  _BOOL8 v5;

  objc_msgSend(a2, "message");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "uniqueID");
  v5 = v4 == objc_msgSend(*(id *)(a1 + 32), "uniqueID");

  return v5;
}

- (BOOL)_handleErrorWithMessage:(id)a3 outError:(id *)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  id v8;

  v5 = a3;
  if (v5)
  {
    AXLogIPC();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[AXIPCServer _handleErrorWithMessage:outError:].cold.1();

    if (a4)
    {
      objc_msgSend(MEMORY[0x1E0CF39C0], "errorWithDescription:", CFSTR("%@"), v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_8:
      v8 = objc_retainAutorelease(v7);
      *a4 = v8;

    }
  }
  else if (a4)
  {
    v7 = 0;
    goto LABEL_8;
  }

  return v5 != 0;
}

- (id)_clientIdentificationForAuditToken:(id *)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a3->var0[5]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("PID:%@"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)isRunning
{
  return self->_running;
}

- (void)setRunning:(BOOL)a3
{
  self->_running = a3;
}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (void)setServiceName:(id)a3
{
  objc_storeStrong((id *)&self->_serviceName, a3);
}

- (void)setHandlers:(id)a3
{
  objc_storeStrong((id *)&self->_handlers, a3);
}

- (unsigned)machPort
{
  return self->_serverPort;
}

- (void)setDelayedMessages:(id)a3
{
  objc_storeStrong((id *)&self->_delayedMessages, a3);
}

- (BOOL)perPidService
{
  return self->_perPidService;
}

- (void)setPerPidService:(BOOL)a3
{
  self->_perPidService = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delayedMessages, 0);
  objc_storeStrong((id *)&self->_handlers, 0);
  objc_storeStrong((id *)&self->_serviceName, 0);
  objc_storeStrong((id *)&self->_validSecurityTokens, 0);
  objc_storeStrong((id *)&self->_entitlements, 0);
  objc_storeStrong(&self->_clientInvalidationHandler, 0);
  objc_storeStrong((id *)&self->_connectedClients, 0);
  objc_storeStrong(&self->_defaultHandler, 0);
}

- (void)_handleClientRegistration:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v4 = 134217984;
  v5 = objc_msgSend(a1, "clientPort");
  OUTLINED_FUNCTION_0_5(&dword_18C62B000, a2, v3, "someone tried to register with a bogus client port (%llx)", (uint8_t *)&v4);
  OUTLINED_FUNCTION_1_2();
}

- (void)_processValidatedMessage:(const char *)a1 completion:(NSObject *)a2 .cold.1(const char *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  NSStringFromSelector(a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_0_5(&dword_18C62B000, a2, v4, "target does not respond to selector: %@", v5);

  OUTLINED_FUNCTION_1_2();
}

- (void)_handleErrorWithMessage:outError:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_0_5(&dword_18C62B000, v0, v1, "ERROR: %{public}@", v2);
  OUTLINED_FUNCTION_5();
}

@end
