@implementation GCAdaptiveTriggersXPCProxyClientEndpointDescription

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GCAdaptiveTriggersXPCProxyClientEndpointDescription)initWithIdentifier:(id)a3 initialStatuses:(id)a4
{
  id v6;
  id v7;
  GCAdaptiveTriggersXPCProxyClientEndpointDescription *v8;
  uint64_t v9;
  NSObject *identifier;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)GCAdaptiveTriggersXPCProxyClientEndpointDescription;
  v8 = -[GCAdaptiveTriggersXPCProxyClientEndpointDescription init](&v12, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copyWithZone:", 0);
    identifier = v8->_identifier;
    v8->_identifier = v9;

    objc_storeStrong((id *)&v8->_initialStatuses, a4);
  }

  return v8;
}

- (GCAdaptiveTriggersXPCProxyClientEndpointDescription)init
{
  -[GCAdaptiveTriggersXPCProxyClientEndpointDescription doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return self;
}

- (GCAdaptiveTriggersXPCProxyClientEndpointDescription)initWithCoder:(id)a3
{
  id v4;
  GCAdaptiveTriggersXPCProxyClientEndpointDescription *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  NSArray *initialStatuses;
  void *v10;
  uint64_t v11;
  NSObject *identifier;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)GCAdaptiveTriggersXPCProxyClientEndpointDescription;
  v5 = -[GCAdaptiveTriggersXPCProxyClientEndpointDescription init](&v14, sel_init);
  if (v5)
  {
    v6 = objc_opt_class();
    +[NSSet setWithObjects:](&off_254DEBEC0, "setWithObjects:", v6, objc_opt_class(), 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v7, CFSTR("initialStatuses"));
    v8 = objc_claimAutoreleasedReturnValue();
    initialStatuses = v5->_initialStatuses;
    v5->_initialStatuses = (NSArray *)v8;

    GCIPCObjectIdentifier_Classes();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("identifier"));
    v11 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = v11;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSArray *initialStatuses;
  id v5;

  initialStatuses = self->_initialStatuses;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", initialStatuses, CFSTR("initialStatuses"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_identifier, CFSTR("identifier"));

}

- (id)materializeWithContext:(id)a3
{
  id v4;
  void *v5;
  GCAdaptiveTriggersXPCProxyClientEndpoint *materializedObject;
  void *v7;
  void *v8;
  void *v9;
  GCAdaptiveTriggersXPCProxyClientEndpoint *v10;
  void *v11;
  dispatch_semaphore_t v12;
  GCAdaptiveTriggersXPCProxyClientEndpoint *v13;
  NSObject *v14;
  id v15;
  dispatch_time_t v16;
  GCAdaptiveTriggersXPCProxyClientEndpoint *v17;
  GCAdaptiveTriggersXPCProxyClientEndpoint *v18;
  GCAdaptiveTriggersXPCProxyClientEndpoint *v19;
  NSObject *v21;
  _QWORD v22[4];
  GCAdaptiveTriggersXPCProxyClientEndpoint *v23;
  id v24;
  dispatch_semaphore_t v25;

  v4 = a3;
  v5 = v4;
  materializedObject = self->_materializedObject;
  if (materializedObject)
    goto LABEL_4;
  objc_msgSend(v4, "IPCServiceRegistry");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "serviceClientForIPCService:", &unk_254DEB6B8);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v8, "adaptiveTriggersXPCProxyServiceRemoteServer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[GCAdaptiveTriggersXPCProxyClientEndpoint initWithIdentifier:initialStatuses:]([GCAdaptiveTriggersXPCProxyClientEndpoint alloc], "initWithIdentifier:initialStatuses:", self->_identifier, self->_initialStatuses);
    objc_msgSend(v5, "IPCObjectRegistry");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "registerIPCObject:", v10);

    v12 = dispatch_semaphore_create(0);
    v22[0] = MEMORY[0x24BDAC760];
    v22[1] = 3221225472;
    v22[2] = __78__GCAdaptiveTriggersXPCProxyClientEndpointDescription_materializeWithContext___block_invoke;
    v22[3] = &unk_24D2B5630;
    v13 = v10;
    v23 = v13;
    v24 = v8;
    v25 = v12;
    v14 = v12;
    v15 = v8;
    objc_msgSend(v9, "adaptiveTriggersXPCProxyServiceClientEndpointConnect:reply:", v13, v22);
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
      -[GCAdaptiveTriggersXPCProxyClientEndpointDescription materializeWithContext:].cold.1();

  }
  v19 = 0;
LABEL_5:

  return v19;
}

intptr_t __78__GCAdaptiveTriggersXPCProxyClientEndpointDescription_materializeWithContext___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  v3 = *(void **)(a1 + 32);
  v4 = *(void **)(a1 + 40);
  v5 = a2;
  objc_msgSend(v4, "adaptiveTriggersXPCProxyServiceConnection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setRemoteEndpoint:connection:", v5, v6);

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

- (NSObject)identifier
{
  return objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_materializedObject, 0);
  objc_storeStrong((id *)&self->_initialStatuses, 0);
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

  OUTLINED_FUNCTION_2_19();
  OUTLINED_FUNCTION_0_22(&dword_215181000, v0, v1, "Materialization failure - Service not present: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_21();
}

@end
