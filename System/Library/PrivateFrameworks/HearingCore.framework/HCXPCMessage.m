@implementation HCXPCMessage

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_payload, 0);
  objc_storeStrong((id *)&self->_xpcMessage, 0);
  objc_destroyWeak((id *)&self->_client);
}

- (id)replyMessageWithPayload:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[HCXPCMessage xpcMessage](self, "xpcMessage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HCXPCMessage client](self, "client");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[HCXPCMessage messageWithPayload:xpcMessage:andClient:](HCXPCMessage, "messageWithPayload:xpcMessage:andClient:", v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)messageWithPayload:(id)a3 xpcMessage:(id)a4 andClient:(id)a5
{
  id v7;
  id v8;
  id v9;
  HCXPCMessage *v10;

  if (a5)
  {
    v7 = a5;
    v8 = a4;
    v9 = a3;
    v10 = -[HCXPCMessage initWithPayload:]([HCXPCMessage alloc], "initWithPayload:", v9);

    -[HCXPCMessage setXpcMessage:](v10, "setXpcMessage:", v8);
    -[HCXPCMessage setClient:](v10, "setClient:", v7);

  }
  else
  {
    v10 = 0;
  }
  return v10;
}

- (void)setClient:(id)a3
{
  objc_storeWeak((id *)&self->_client, a3);
}

- (HCXPCMessage)initWithPayload:(id)a3
{
  id v4;
  HCXPCMessage *v5;
  objc_super v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7.receiver = self;
    v7.super_class = (Class)HCXPCMessage;
    v5 = -[HCXPCMessage init](&v7, sel_init);
    self = v5;
    if (v5)
      -[HCXPCMessage setPayload:](v5, "setPayload:", v4);
  }

  return self;
}

- (void)dealloc
{
  objc_super v3;

  -[HCXPCMessage setPayload:](self, "setPayload:", 0);
  -[HCXPCMessage setError:](self, "setError:", 0);
  -[HCXPCMessage setXpcMessage:](self, "setXpcMessage:", 0);
  v3.receiver = self;
  v3.super_class = (Class)HCXPCMessage;
  -[HCXPCMessage dealloc](&v3, sel_dealloc);
}

- (void)setXpcMessage:(id)a3
{
  objc_storeStrong((id *)&self->_xpcMessage, a3);
}

- (void)setPayload:(id)a3
{
  objc_storeStrong((id *)&self->_payload, a3);
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v11.receiver = self;
  v11.super_class = (Class)HCXPCMessage;
  -[HCXPCMessage description](&v11, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HCXPCMessage error](self, "error");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HCXPCMessage payload](self, "payload");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HCXPCMessage error](self, "error");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HCXPCMessage client](self, "client");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ [%d | %@] {%@} - Client: %@"), v4, v5 == 0, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (NSError)error
{
  return self->_error;
}

- (HCXPCClient)client
{
  return (HCXPCClient *)objc_loadWeakRetained((id *)&self->_client);
}

- (NSDictionary)payload
{
  return self->_payload;
}

- (OS_xpc_object)xpcMessage
{
  return self->_xpcMessage;
}

+ (id)messageWithPayload:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithPayload:", v3);

  return v4;
}

- (BOOL)hasEntitlement:(id)a3
{
  __CFString *v4;
  void *v5;
  void *v6;
  __SecTask *v7;
  __SecTask *v8;
  CFTypeRef v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  uint64_t v15;
  CFTypeID v16;
  BOOL v17;
  CFErrorRef error;
  __int128 v20;
  __int128 v21;
  audit_token_t token;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = (__CFString *)a3;
  -[HCXPCMessage client](self, "client");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "xpcConnection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6
    && (v20 = 0u,
        v21 = 0u,
        xpc_connection_get_audit_token(),
        memset(&token, 0, sizeof(token)),
        (v7 = SecTaskCreateWithAuditToken(0, &token)) != 0))
  {
    v8 = v7;
    error = 0;
    v9 = SecTaskCopyValueForEntitlement(v7, v4, &error);
    if (error)
    {
      HAInitializeLogging();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unable to get entitlements for client task. Error: %@"), error);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[HCXPCMessage hasEntitlement:]", 80, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)HAEngineeringLog;
      if (os_log_type_enabled((os_log_t)HAEngineeringLog, OS_LOG_TYPE_DEFAULT))
      {
        v13 = objc_retainAutorelease(v11);
        v14 = v12;
        v15 = objc_msgSend(v13, "UTF8String");
        token.val[0] = 136446210;
        *(_QWORD *)&token.val[1] = v15;
        _os_log_impl(&dword_1B3CA7000, v14, OS_LOG_TYPE_DEFAULT, "%{public}s", (uint8_t *)&token, 0xCu);

      }
      CFRelease(error);
    }
    if (v9)
    {
      v16 = CFGetTypeID(v9);
      v17 = v16 == CFBooleanGetTypeID() && CFBooleanGetValue((CFBooleanRef)v9) != 0;
      CFRelease(v9);
    }
    else
    {
      v17 = 0;
    }
    CFRelease(v8);
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

@end
