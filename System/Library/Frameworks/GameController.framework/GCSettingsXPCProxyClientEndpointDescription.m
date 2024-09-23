@implementation GCSettingsXPCProxyClientEndpointDescription

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GCSettingsXPCProxyClientEndpointDescription)initWithIdentifier:(id)a3 initialValueForProfile:(id)a4
{
  id v6;
  id v7;
  GCSettingsXPCProxyClientEndpointDescription *v8;
  uint64_t v9;
  NSObject *identifier;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)GCSettingsXPCProxyClientEndpointDescription;
  v8 = -[GCSettingsXPCProxyClientEndpointDescription init](&v12, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copyWithZone:", 0);
    identifier = v8->_identifier;
    v8->_identifier = v9;

    objc_storeStrong((id *)&v8->_initialProfile, a4);
  }

  return v8;
}

- (GCSettingsXPCProxyClientEndpointDescription)init
{
  -[GCSettingsXPCProxyClientEndpointDescription doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return self;
}

- (GCSettingsXPCProxyClientEndpointDescription)initWithCoder:(id)a3
{
  id v4;
  GCSettingsXPCProxyClientEndpointDescription *v5;
  void *v6;
  uint64_t v7;
  NSObject *identifier;
  uint64_t v9;
  GCSProfile *initialProfile;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)GCSettingsXPCProxyClientEndpointDescription;
  v5 = -[GCSettingsXPCProxyClientEndpointDescription init](&v12, sel_init);
  if (v5)
  {
    GCIPCObjectIdentifier_Classes();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("identifier"));
    v7 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = v7;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_initialProfile"));
    v9 = objc_claimAutoreleasedReturnValue();
    initialProfile = v5->_initialProfile;
    v5->_initialProfile = (GCSProfile *)v9;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSObject *identifier;
  id v5;

  identifier = self->_identifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", identifier, CFSTR("identifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_initialProfile, CFSTR("_initialProfile"));

}

- (id)materializeWithContext:(id)a3
{
  id v4;
  void *v5;
  GCSettingsXPCProxyClientEndpoint *materializedObject;
  void *v7;
  void *v8;
  void *v9;
  GCSettingsXPCProxyClientEndpoint *v10;
  void *v11;
  dispatch_semaphore_t v12;
  GCSettingsXPCProxyClientEndpoint *v13;
  NSObject *v14;
  id v15;
  dispatch_time_t v16;
  GCSettingsXPCProxyClientEndpoint *v17;
  GCSettingsXPCProxyClientEndpoint *v18;
  GCSettingsXPCProxyClientEndpoint *v19;
  NSObject *v21;
  _QWORD v22[4];
  GCSettingsXPCProxyClientEndpoint *v23;
  id v24;
  dispatch_semaphore_t v25;

  v4 = a3;
  v5 = v4;
  materializedObject = self->_materializedObject;
  if (materializedObject)
    goto LABEL_4;
  objc_msgSend(v4, "IPCServiceRegistry");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "serviceClientForIPCService:", &unk_254DEB598);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v8, "settingsXPCProxyServiceRemoteServer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[GCSettingsXPCProxyClientEndpoint initWithIdentifier:initialValueForProfile:]([GCSettingsXPCProxyClientEndpoint alloc], "initWithIdentifier:initialValueForProfile:", self->_identifier, self->_initialProfile);
    objc_msgSend(v5, "IPCObjectRegistry");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "registerIPCObject:", v10);

    v12 = dispatch_semaphore_create(0);
    v22[0] = MEMORY[0x24BDAC760];
    v22[1] = 3221225472;
    v22[2] = __70__GCSettingsXPCProxyClientEndpointDescription_materializeWithContext___block_invoke;
    v22[3] = &unk_24D2B4F50;
    v13 = v10;
    v23 = v13;
    v24 = v8;
    v25 = v12;
    v14 = v12;
    v15 = v8;
    objc_msgSend(v9, "settingsXPCProxyServiceClientEndpointConnect:reply:", v13, v22);
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
      -[GCSettingsXPCProxyClientEndpointDescription materializeWithContext:].cold.1();

  }
  v19 = 0;
LABEL_5:

  return v19;
}

intptr_t __70__GCSettingsXPCProxyClientEndpointDescription_materializeWithContext___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  v3 = *(void **)(a1 + 32);
  v4 = *(void **)(a1 + 40);
  v5 = a2;
  objc_msgSend(v4, "settingsXPCProxyServiceConnection");
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
  objc_storeStrong((id *)&self->_initialProfile, 0);
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

  OUTLINED_FUNCTION_2_15();
  OUTLINED_FUNCTION_0_17(&dword_215181000, v0, v1, "Materialization failure - Service not present: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_16();
}

@end
