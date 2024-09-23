@implementation ASDAccountStatusTask

- (ASDAccountStatusTask)init
{
  ASDAccountStatusTask *v2;
  uint64_t v3;
  ASDClipServiceBroker *broker;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ASDAccountStatusTask;
  v2 = -[ASDAccountStatusTask init](&v6, sel_init);
  if (v2)
  {
    +[ASDServiceBroker defaultBroker](ASDServiceBroker, "defaultBroker");
    v3 = objc_claimAutoreleasedReturnValue();
    broker = v2->_broker;
    v2->_broker = (ASDClipServiceBroker *)v3;

  }
  return v2;
}

- (void)statusWithCompletion:(id)a3
{
  id v4;
  ASDClipServiceBroker *broker;
  void *v6;
  id v7;
  uint64_t v8;
  id v9;
  void *v10;
  NSObject *v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  uint8_t buf[4];
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  broker = self->_broker;
  v16 = 0;
  -[ASDClipServiceBroker getClipServiceWithError:](broker, "getClipServiceWithError:", &v16);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v16;
  if (v6)
  {
    v8 = MEMORY[0x1E0C809B0];
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __45__ASDAccountStatusTask_statusWithCompletion___block_invoke;
    v14[3] = &unk_1E37BDB60;
    v9 = v4;
    v15 = v9;
    objc_msgSend(v6, "synchronousRemoteObjectProxyWithErrorHandler:", v14);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = v8;
    v12[1] = 3221225472;
    v12[2] = __45__ASDAccountStatusTask_statusWithCompletion___block_invoke_1;
    v12[3] = &unk_1E37BE908;
    v13 = v9;
    objc_msgSend(v10, "accountStatusUsingRequest:withReplyHandler:", self, v12);

  }
  else
  {
    ASDLogHandleForCategory(12);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v18 = v7;
      _os_log_error_impl(&dword_19A03B000, v11, OS_LOG_TYPE_ERROR, "Request to service failed with error: %@", buf, 0xCu);
    }

    (*((void (**)(id, _QWORD, id))v4 + 2))(v4, 0, v7);
  }

}

void __45__ASDAccountStatusTask_statusWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  ASDLogHandleForCategory(12);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = 138412290;
    v6 = v3;
    _os_log_error_impl(&dword_19A03B000, v4, OS_LOG_TYPE_ERROR, "Request to make a connection with error: %@", (uint8_t *)&v5, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __45__ASDAccountStatusTask_statusWithCompletion___block_invoke_1(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASDAccountStatusTask)initWithCoder:(id)a3
{
  id v4;
  ASDAccountStatusTask *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)ASDAccountStatusTask;
  v5 = -[ASDAccountStatusTask init](&v7, sel_init);
  if (v5)
    v5->_lookupFamilyInfoIfNecessary = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_lookupFamilyInfoIfNecessary"));

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeBool:forKey:", self->_lookupFamilyInfoIfNecessary, CFSTR("_lookupFamilyInfoIfNecessary"));
}

- (BOOL)lookupFamilyInfoIfNecessary
{
  return self->_lookupFamilyInfoIfNecessary;
}

- (void)setLookupFamilyInfoIfNecessary:(BOOL)a3
{
  self->_lookupFamilyInfoIfNecessary = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_broker, 0);
}

@end
