@implementation CNXPCContactsSupport

+ (id)os_log
{
  if (os_log_cn_once_token_1_4 != -1)
    dispatch_once(&os_log_cn_once_token_1_4, &__block_literal_global_135);
  return (id)os_log_cn_once_object_1_4;
}

void __30__CNXPCContactsSupport_os_log__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.contacts", "CNXPCContactsSupport");
  v1 = (void *)os_log_cn_once_object_1_4;
  os_log_cn_once_object_1_4 = (uint64_t)v0;

}

+ (CNXPCContactsSupport)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__CNXPCContactsSupport_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_cn_once_token_2 != -1)
    dispatch_once(&sharedInstance_cn_once_token_2, block);
  return (CNXPCContactsSupport *)(id)sharedInstance_cn_once_object_2;
}

void __38__CNXPCContactsSupport_sharedInstance__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedInstance_cn_once_object_2;
  sharedInstance_cn_once_object_2 = (uint64_t)v1;

}

- (CNXPCContactsSupport)init
{
  void *v3;
  CNXPCContactsSupport *v4;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.contactsd.support"), 0);
  v4 = -[CNXPCContactsSupport initWithConnection:](self, "initWithConnection:", v3);

  return v4;
}

- (CNXPCContactsSupport)initWithConnection:(id)a3
{
  id v4;
  CNXPCContactsSupport *v5;
  void *v6;
  void *v7;
  CNContactsLogger *v8;
  CNContactsLogger *logger;
  CNContactsLogger *v10;
  void *v11;
  CNXPCConnection *v12;
  CNXPCConnection *serviceConnection;
  uint64_t v14;
  CNXPCContactsSupportService *serviceProxy;
  CNXPCContactsSupport *v16;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)CNXPCContactsSupport;
  v5 = -[CNXPCContactsSupport init](&v18, sel_init);
  if (v5)
  {
    +[CNContactsEnvironment currentEnvironment](CNContactsEnvironment, "currentEnvironment");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "loggerProvider");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "contactsLogger");
    v8 = (CNContactsLogger *)objc_claimAutoreleasedReturnValue();

    logger = v5->_logger;
    v5->_logger = v8;
    v10 = v8;

    +[CNXPCContactsSupport serviceProtocolInterface](CNXPCContactsSupport, "serviceProtocolInterface");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[CNXPCConnection initWithConnection:interface:logger:]([CNXPCConnection alloc], "initWithConnection:interface:logger:", v4, v11, v10);
    serviceConnection = v5->_serviceConnection;
    v5->_serviceConnection = v12;

    -[CNXPCConnection serviceProxy](v5->_serviceConnection, "serviceProxy");
    v14 = objc_claimAutoreleasedReturnValue();
    serviceProxy = v5->_serviceProxy;
    v5->_serviceProxy = (CNXPCContactsSupportService *)v14;

    v16 = v5;
  }

  return v5;
}

+ (id)serviceProtocolInterface
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE1B1F60);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v3, sel_requestProviderDomainCommand_withReply_, 0, 0);

  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  objc_msgSend(v4, "setWithObjects:", v5, v6, v7, objc_opt_class(), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v8, sel_requestProviderDomainCommand_withReply_, 0, 1);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v9, sel_requestProviderDomainCommand_withReply_, 1, 1);

  return v2;
}

- (id)requestProviderDomainCommand:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v13[5];
  id v14;
  uint64_t *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;

  v6 = a3;
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__34;
  v27 = __Block_byref_object_dispose__34;
  v28 = 0;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__34;
  v21 = __Block_byref_object_dispose__34;
  v22 = 0;
  -[CNXPCContactsSupport logger](self, "logger");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __59__CNXPCContactsSupport_requestProviderDomainCommand_error___block_invoke;
  v13[3] = &unk_1E29FDD48;
  v15 = &v23;
  v13[4] = self;
  v8 = v6;
  v14 = v8;
  v16 = &v17;
  objc_msgSend(v7, "requestingProviderDomainCommand:", v13);

  v9 = (void *)v18[5];
  v10 = (id)v24[5];
  v11 = v10;
  if (a4 && !v10)
    *a4 = objc_retainAutorelease(v9);

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v23, 8);

  return v11;
}

void __59__CNXPCContactsSupport_requestProviderDomainCommand_error___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id obj;

  objc_msgSend(*(id *)(a1 + 32), "serviceConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  obj = *(id *)(v4 + 40);
  objc_msgSend(v2, "remoteResultForSelector:param1:error:", sel_requestProviderDomainCommand_withReply_, v3, &obj);
  v5 = objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v4 + 40), obj);
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

- (CNXPCConnection)serviceConnection
{
  return self->_serviceConnection;
}

- (CNXPCContactsSupportService)serviceProxy
{
  return self->_serviceProxy;
}

- (CNContactsLogger)logger
{
  return self->_logger;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_serviceProxy, 0);
  objc_storeStrong((id *)&self->_serviceConnection, 0);
}

@end
