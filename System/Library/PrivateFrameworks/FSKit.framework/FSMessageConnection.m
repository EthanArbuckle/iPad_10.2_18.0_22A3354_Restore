@implementation FSMessageConnection

- (void)logMessage:(id)a3
{
  NSXPCConnection *connection;
  id v4;
  id v5;

  connection = self->_connection;
  v4 = a3;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](connection, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_10);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "logMessage:", v4);

}

void __34__FSMessageConnection_logMessage___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  fskit_std_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __34__FSMessageConnection_logMessage___block_invoke_cold_1(v2);

}

- (void)completed:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v6 = a4;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __39__FSMessageConnection_completed_reply___block_invoke;
  v8[3] = &unk_250C31D38;
  v9 = v6;
  v7 = v6;
  -[FSMessageConnection completed:replyHandler:](self, "completed:replyHandler:", a3, v8);

}

uint64_t __39__FSMessageConnection_completed_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)didCompleteWithError:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v6 = a4;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __62__FSMessageConnection_didCompleteWithError_completionHandler___block_invoke;
  v8[3] = &unk_250C31D38;
  v9 = v6;
  v7 = v6;
  -[FSMessageConnection completed:replyHandler:](self, "completed:replyHandler:", a3, v8);

}

uint64_t __62__FSMessageConnection_didCompleteWithError_completionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a3);
  return result;
}

- (void)getLocalizationSetup:(id)a3
{
  id v4;
  NSXPCConnection *connection;
  id v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  connection = self->_connection;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __44__FSMessageConnection_getLocalizationSetup___block_invoke;
  v8[3] = &unk_250C31EC8;
  v9 = v4;
  v6 = v4;
  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](connection, "synchronousRemoteObjectProxyWithErrorHandler:", v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "getLocalizationSetup:", v6);

}

void __44__FSMessageConnection_getLocalizationSetup___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  fskit_std_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __34__FSMessageConnection_logMessage___block_invoke_cold_1(v3);

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)earlyCompletedBlock
{
  return objc_getProperty(self, a2, 16, 1);
}

- (void)setEarlyCompletedBlock:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (NSXPCConnection)connection
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 24, 1);
}

- (NSXPCListenerEndpoint)endpoint
{
  return (NSXPCListenerEndpoint *)objc_getProperty(self, a2, 32, 1);
}

- (BOOL)hasCompleted
{
  return self->_hasCompleted;
}

- (NSArray)preferredLanguages
{
  return (NSArray *)objc_getProperty(self, a2, 40, 1);
}

- (FSMessageReceiver)receiver
{
  return (FSMessageReceiver *)objc_getProperty(self, a2, 48, 1);
}

- (void)setReceiver:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (NSLocale)locale
{
  return (NSLocale *)objc_getProperty(self, a2, 56, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_receiver, 0);
  objc_storeStrong((id *)&self->_preferredLanguages, 0);
  objc_storeStrong((id *)&self->_endpoint, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong(&self->_earlyCompletedBlock, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB8], CFSTR("This object may only be encoded by an NSXPCCoder."), 0);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v4);
  }
  objc_msgSend(v5, "encodeObject:forKey:", self->_endpoint, CFSTR("FSMessageConnection.Endpoint"));

}

- (FSMessageConnection)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  FSMessageConnection *v6;
  id v8;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB8], CFSTR("This object may only be decoded by an NSXPCCoder."), 0);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v8);
  }
  if (objc_msgSend(v4, "containsValueForKey:", CFSTR("FSMessageConnection.Endpoint")))
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("FSMessageConnection.Endpoint"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    self = -[FSMessageConnection initWithEndpoint:](self, "initWithEndpoint:", v5);

    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)connect:(id)a3
{
  void (**v4)(id, void *);
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  NSXPCConnection *v22;
  NSXPCConnection *connection;
  void *v24;
  uint64_t v25;
  NSObject *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  _QWORD v34[6];
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  id v40;
  id location;
  id *p_location;
  uint64_t v43;
  uint64_t (*v44)(uint64_t, uint64_t);
  void (*v45)(uint64_t);
  id v46;
  _QWORD v47[4];
  id v48;

  v4 = (void (**)(id, void *))a3;
  fskit_std_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[FSMessageConnection(Private) connect:].cold.3(v5, v6, v7, v8, v9, v10, v11, v12);

  if (self->_connection)
  {
    fskit_std_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      -[FSMessageConnection(Private) connect:].cold.2(v13, v14, v15, v16, v17, v18, v19, v20);

    fs_errorForPOSIXError(17);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v4[2](v4, v21);

  }
  else
  {
    objc_initWeak(&location, self);
    v22 = (NSXPCConnection *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithListenerEndpoint:", self->_endpoint);
    connection = self->_connection;
    self->_connection = v22;

    +[FSKitConstants FSTaskOperations](FSKitConstants, "FSTaskOperations");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](self->_connection, "setRemoteObjectInterface:", v24);

    v25 = MEMORY[0x24BDAC760];
    v47[0] = MEMORY[0x24BDAC760];
    v47[1] = 3221225472;
    v47[2] = __40__FSMessageConnection_Private__connect___block_invoke;
    v47[3] = &unk_250C31E00;
    objc_copyWeak(&v48, &location);
    -[NSXPCConnection setInterruptionHandler:](self->_connection, "setInterruptionHandler:", v47);
    -[NSXPCConnection resume](self->_connection, "resume");
    objc_destroyWeak(&v48);
    objc_destroyWeak(&location);
    location = 0;
    p_location = &location;
    v43 = 0x3032000000;
    v44 = __Block_byref_object_copy__3;
    v45 = __Block_byref_object_dispose__3;
    v46 = 0;
    v35 = 0;
    v36 = &v35;
    v37 = 0x3032000000;
    v38 = __Block_byref_object_copy__3;
    v39 = __Block_byref_object_dispose__3;
    v40 = 0;
    v34[0] = v25;
    v34[1] = 3221225472;
    v34[2] = __40__FSMessageConnection_Private__connect___block_invoke_64;
    v34[3] = &unk_250C32A40;
    v34[4] = &location;
    v34[5] = &v35;
    -[FSMessageConnection getLocalizationSetup:](self, "getLocalizationSetup:", v34);
    objc_storeStrong((id *)&self->_locale, p_location[5]);
    objc_storeStrong((id *)&self->_preferredLanguages, (id)v36[5]);
    fskit_std_log();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
      -[FSMessageConnection(Private) connect:].cold.1(v26, v27, v28, v29, v30, v31, v32, v33);

    v4[2](v4, 0);
    _Block_object_dispose(&v35, 8);

    _Block_object_dispose(&location, 8);
  }

}

void __40__FSMessageConnection_Private__connect___block_invoke(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    fs_errorForCocoaError(4097);
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "completed:replyHandler:", v1, &__block_literal_global_62);

  }
}

void __40__FSMessageConnection_Private__connect___block_invoke_64(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;

  v8 = a2;
  v9 = a3;
  v10 = a4;
  if (v10)
  {
    fskit_std_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      __40__FSMessageConnection_Private__connect___block_invoke_64_cold_1(v10, v11);

  }
  else
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
  }

}

- (void)logLocalizedMessage:(id)a3 table:(id)a4 bundle:(id)a5 array:(id)a6
{
  id v7;

  -[FSMessageConnection localizedMessage:table:bundle:array:](self, "localizedMessage:table:bundle:array:", a3, a4, a5, a6);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[FSMessageConnection logMessage:](self, "logMessage:", v7);

}

- (void)logLocalizedMessage:(id)a3 table:(id)a4 bundle:(id)a5 arguments:(char *)a6
{
  id v7;

  -[FSMessageConnection localizedMessage:table:bundle:arguments:](self, "localizedMessage:table:bundle:arguments:", a3, a4, a5, a6);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[FSMessageConnection logMessage:](self, "logMessage:", v7);

}

- (void)completed:(id)a3 replyHandler:(id)a4
{
  id v6;
  id v7;
  FSMessageConnection *v8;
  _BOOL4 hasCompleted;
  void (**v10)(void *, id);
  id earlyCompletedBlock;
  NSXPCConnection *connection;
  id v13;
  void *v14;
  _QWORD v15[4];
  id v16;

  v6 = a3;
  v7 = a4;
  v8 = self;
  objc_sync_enter(v8);
  hasCompleted = v8->_hasCompleted;
  v10 = (void (**)(void *, id))_Block_copy(v8->_earlyCompletedBlock);
  earlyCompletedBlock = v8->_earlyCompletedBlock;
  v8->_earlyCompletedBlock = 0;

  if (!v8->_hasCompleted)
    v8->_hasCompleted = 1;
  objc_sync_exit(v8);

  if (hasCompleted)
  {
    (*((void (**)(id, _QWORD, _QWORD))v7 + 2))(v7, 0, 0);
  }
  else
  {
    if (v10)
      v10[2](v10, v6);
    connection = v8->_connection;
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __55__FSMessageConnection_Private__completed_replyHandler___block_invoke;
    v15[3] = &unk_250C31EC8;
    v13 = v7;
    v16 = v13;
    -[NSXPCConnection remoteObjectProxyWithErrorHandler:](connection, "remoteObjectProxyWithErrorHandler:", v15);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "completed:replyHandler:", v6, v13);

  }
}

void __55__FSMessageConnection_Private__completed_replyHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  fskit_std_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __34__FSMessageConnection_logMessage___block_invoke_cold_1(v3);

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)prompt:(id)a3 replyHandler:(id)a4
{
  id v6;
  NSXPCConnection *connection;
  id v8;
  id v9;
  void *v10;
  _QWORD v11[4];
  id v12;

  v6 = a4;
  connection = self->_connection;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __52__FSMessageConnection_Private__prompt_replyHandler___block_invoke;
  v11[3] = &unk_250C31EC8;
  v12 = v6;
  v8 = v6;
  v9 = a3;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](connection, "remoteObjectProxyWithErrorHandler:", v11);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "prompt:replyHandler:", v9, v8);

}

void __52__FSMessageConnection_Private__prompt_replyHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  fskit_std_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __34__FSMessageConnection_logMessage___block_invoke_cold_1(v3);

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)promptTrueFalse:(id)a3 replyHandler:(id)a4
{
  id v6;
  NSXPCConnection *connection;
  id v8;
  id v9;
  void *v10;
  _QWORD v11[4];
  id v12;

  v6 = a4;
  connection = self->_connection;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __61__FSMessageConnection_Private__promptTrueFalse_replyHandler___block_invoke;
  v11[3] = &unk_250C31EC8;
  v12 = v6;
  v8 = v6;
  v9 = a3;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](connection, "remoteObjectProxyWithErrorHandler:", v11);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "promptTrueFalse:replyHandler:", v9, v8);

}

void __61__FSMessageConnection_Private__promptTrueFalse_replyHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  fskit_std_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __34__FSMessageConnection_logMessage___block_invoke_cold_1(v3);

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)logLocalizedMessage:(id)a3 table:(id)a4 bundle:(id)a5
{
  uint64_t v5;

  -[FSMessageConnection logLocalizedMessage:table:bundle:arguments:](self, "logLocalizedMessage:table:bundle:arguments:", a3, a4, a5, &v5);
}

- (id)localizedMessage:(id)a3 table:(id)a4 bundle:(id)a5
{
  uint64_t v6;

  -[FSMessageConnection localizedMessage:table:bundle:arguments:](self, "localizedMessage:table:bundle:arguments:", a3, a4, a5, &v6);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (FSMessageConnection)initWithEndpoint:(id)a3
{
  id v5;
  FSMessageConnection *v6;
  FSMessageConnection *v7;
  NSXPCConnection *connection;
  uint64_t v9;
  NSLocale *locale;
  uint64_t v11;
  NSArray *preferredLanguages;
  FSMessageReceiver *receiver;
  objc_super v15;

  v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)FSMessageConnection;
  v6 = -[FSMessageConnection init](&v15, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_endpoint, a3);
    connection = v7->_connection;
    v7->_connection = 0;

    v7->_hasCompleted = 0;
    objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
    v9 = objc_claimAutoreleasedReturnValue();
    locale = v7->_locale;
    v7->_locale = (NSLocale *)v9;

    objc_msgSend(MEMORY[0x24BDBCEA0], "preferredLanguages");
    v11 = objc_claimAutoreleasedReturnValue();
    preferredLanguages = v7->_preferredLanguages;
    v7->_preferredLanguages = (NSArray *)v11;

    receiver = v7->_receiver;
    v7->_receiver = 0;

  }
  return v7;
}

- (void)didStart
{
  FSMessageReceiver *receiver;

  receiver = self->_receiver;
  if (receiver)
    -[FSMessageReceiver didStart](receiver, "didStart");
}

- (id)localizedMessage:(id)a3 table:(id)a4 bundle:(id)a5 array:(id)a6
{
  NSLocale *locale;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;

  locale = self->_locale;
  v11 = a6;
  v12 = a5;
  v13 = a4;
  v14 = a3;
  -[NSLocale languageCode](locale, "languageCode");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "localizedStringForKey:value:table:localization:", v14, 0, v13, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  +[FSKitUtils stringWithFormatString:locale:arguments:](FSKitUtils, "stringWithFormatString:locale:arguments:", v16, self->_locale, v11);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (id)localizedMessage:(id)a3 table:(id)a4 bundle:(id)a5 arguments:(char *)a6
{
  NSLocale *locale;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;

  locale = self->_locale;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  -[NSLocale languageCode](locale, "languageCode");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "localizedStringForKey:value:table:localization:", v13, 0, v12, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:locale:arguments:", v15, self->_locale, a6);
  return v16;
}

void __34__FSMessageConnection_logMessage___block_invoke_cold_1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "description");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_3(&dword_23B2A6000, v2, v3, "Can't get proxy object error: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_7();
}

void __40__FSMessageConnection_Private__connect___block_invoke_64_cold_1(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  const char *v5;
  __int16 v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 136315394;
  v5 = "-[FSMessageConnection(Private) connect:]_block_invoke";
  v6 = 2112;
  v7 = v3;
  _os_log_error_impl(&dword_23B2A6000, a2, OS_LOG_TYPE_ERROR, "%s: Can't get localization setup from client (%@), using current locale", (uint8_t *)&v4, 0x16u);

  OUTLINED_FUNCTION_7();
}

@end
