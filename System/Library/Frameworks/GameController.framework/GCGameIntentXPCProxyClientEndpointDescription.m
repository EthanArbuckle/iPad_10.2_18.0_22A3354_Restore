@implementation GCGameIntentXPCProxyClientEndpointDescription

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GCGameIntentXPCProxyClientEndpointDescription)initWithIdentifier:(id)a3
{
  id v4;
  GCGameIntentXPCProxyClientEndpointDescription *v5;
  uint64_t v6;
  NSObject *identifier;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GCGameIntentXPCProxyClientEndpointDescription;
  v5 = -[GCGameIntentXPCProxyClientEndpointDescription init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copyWithZone:", 0);
    identifier = v5->_identifier;
    v5->_identifier = v6;

  }
  return v5;
}

- (GCGameIntentXPCProxyClientEndpointDescription)init
{
  -[GCGameIntentXPCProxyClientEndpointDescription doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return self;
}

- (GCGameIntentXPCProxyClientEndpointDescription)initWithCoder:(id)a3
{
  id v4;
  GCGameIntentXPCProxyClientEndpointDescription *v5;
  void *v6;
  uint64_t v7;
  NSObject *identifier;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)GCGameIntentXPCProxyClientEndpointDescription;
  v5 = -[GCGameIntentXPCProxyClientEndpointDescription init](&v10, sel_init);
  if (v5)
  {
    GCIPCObjectIdentifier_Classes();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("identifier"));
    v7 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = v7;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_identifier, CFSTR("identifier"));
}

- (id)materializeWithContext:(id)a3
{
  id v4;
  void *v5;
  GCGameIntentXPCProxyClientEndpoint *materializedObject;
  void *v7;
  void *v8;
  void *v9;
  GCGameIntentXPCProxyClientEndpoint *v10;
  void *v11;
  dispatch_semaphore_t v12;
  GCGameIntentXPCProxyClientEndpoint *v13;
  NSObject *v14;
  id v15;
  dispatch_time_t v16;
  GCGameIntentXPCProxyClientEndpoint *v17;
  GCGameIntentXPCProxyClientEndpoint *v18;
  GCGameIntentXPCProxyClientEndpoint *v19;
  NSObject *v21;
  _QWORD v22[4];
  GCGameIntentXPCProxyClientEndpoint *v23;
  id v24;
  dispatch_semaphore_t v25;

  v4 = a3;
  v5 = v4;
  materializedObject = self->_materializedObject;
  if (materializedObject)
    goto LABEL_4;
  objc_msgSend(v4, "IPCServiceRegistry");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "serviceClientForIPCService:", &unk_254DEAEA8);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v8, "gameIntentXPCProxyServiceRemoteServer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[GCGameIntentXPCProxyClientEndpoint initWithIdentifier:]([GCGameIntentXPCProxyClientEndpoint alloc], "initWithIdentifier:", self->_identifier);
    objc_msgSend(v5, "IPCObjectRegistry");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "registerIPCObject:", v10);

    v12 = dispatch_semaphore_create(0);
    v22[0] = MEMORY[0x24BDAC760];
    v22[1] = 3221225472;
    v22[2] = __72__GCGameIntentXPCProxyClientEndpointDescription_materializeWithContext___block_invoke;
    v22[3] = &unk_24D2B3F58;
    v13 = v10;
    v23 = v13;
    v24 = v8;
    v25 = v12;
    v14 = v12;
    v15 = v8;
    objc_msgSend(v9, "gameIntentXPCProxyServiceClientEndpointConnect:reply:", v13, v22);
    v16 = dispatch_time(0, 1000000000);
    dispatch_semaphore_wait(v14, v16);
    v17 = self->_materializedObject;
    self->_materializedObject = v13;
    v18 = v13;

    materializedObject = self->_materializedObject;
LABEL_4:
    v19 = materializedObject;
    goto LABEL_5;
  }
  if (gc_isInternalBuild())
  {
    getGCLogger();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      -[GCGameIntentXPCProxyClientEndpointDescription materializeWithContext:].cold.1();

  }
  v19 = 0;
LABEL_5:

  return v19;
}

intptr_t __72__GCGameIntentXPCProxyClientEndpointDescription_materializeWithContext___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  v3 = *(void **)(a1 + 32);
  v4 = *(void **)(a1 + 40);
  v5 = a2;
  objc_msgSend(v4, "gameIntentXPCProxyServiceConnection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setRemoteEndpoint:connection:", v5, v6);

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

- (NSObject)identifier
{
  return objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_materializedObject, 0);
}

- (void)materializeWithContext:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_8();
  OUTLINED_FUNCTION_0_9(&dword_215181000, v0, v1, "Materialization failure - Service not present: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_8();
}

@end
