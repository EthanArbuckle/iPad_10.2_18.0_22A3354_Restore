@implementation GCSystemGestureXPCProxyClientEndpointDescription

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GCSystemGestureXPCProxyClientEndpointDescription)initWithIdentifier:(id)a3 initialSystemGesture:(id)a4 isSystemGestureObserver:(BOOL)a5
{
  id v8;
  id v9;
  GCSystemGestureXPCProxyClientEndpointDescription *v10;
  uint64_t v11;
  NSObject *identifier;
  objc_super v14;

  v8 = a3;
  v9 = a4;
  v14.receiver = self;
  v14.super_class = (Class)GCSystemGestureXPCProxyClientEndpointDescription;
  v10 = -[GCSystemGestureXPCProxyClientEndpointDescription init](&v14, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(v8, "copyWithZone:", 0);
    identifier = v10->_identifier;
    v10->_identifier = v11;

    objc_storeStrong((id *)&v10->_initialSystemGesture, a4);
    v10->_isSystemGestureObserver = a5;
  }

  return v10;
}

- (GCSystemGestureXPCProxyClientEndpointDescription)init
{
  -[GCSystemGestureXPCProxyClientEndpointDescription doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return self;
}

- (GCSystemGestureXPCProxyClientEndpointDescription)initWithCoder:(id)a3
{
  id v4;
  GCSystemGestureXPCProxyClientEndpointDescription *v5;
  void *v6;
  uint64_t v7;
  NSObject *identifier;
  uint64_t v9;
  GCSystemGesturesState *initialSystemGesture;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)GCSystemGestureXPCProxyClientEndpointDescription;
  v5 = -[GCSystemGestureXPCProxyClientEndpointDescription init](&v12, sel_init);
  if (v5)
  {
    GCIPCObjectIdentifier_Classes();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("identifier"));
    v7 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = v7;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("initialSystemGesture"));
    v9 = objc_claimAutoreleasedReturnValue();
    initialSystemGesture = v5->_initialSystemGesture;
    v5->_initialSystemGesture = (GCSystemGesturesState *)v9;

    v5->_isSystemGestureObserver = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_isSystemGestureObserver"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  GCSystemGesturesState *initialSystemGesture;
  id v5;

  initialSystemGesture = self->_initialSystemGesture;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", initialSystemGesture, CFSTR("initialSystemGesture"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_identifier, CFSTR("identifier"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isSystemGestureObserver, CFSTR("_isSystemGestureObserver"));

}

- (id)materializeWithContext:(id)a3
{
  id v4;
  void *v5;
  GCSystemGestureXPCProxyClientEndpoint *materializedObject;
  void *v7;
  void *v8;
  void *v9;
  GCSystemGestureXPCProxyClientEndpoint *v10;
  void *v11;
  dispatch_semaphore_t v12;
  GCSystemGestureXPCProxyClientEndpoint *v13;
  NSObject *v14;
  id v15;
  dispatch_time_t v16;
  GCSystemGestureXPCProxyClientEndpoint *v17;
  GCSystemGestureXPCProxyClientEndpoint *v18;
  GCSystemGestureXPCProxyClientEndpoint *v19;
  NSObject *v21;
  _QWORD v22[4];
  GCSystemGestureXPCProxyClientEndpoint *v23;
  id v24;
  dispatch_semaphore_t v25;

  v4 = a3;
  v5 = v4;
  materializedObject = self->_materializedObject;
  if (materializedObject)
    goto LABEL_4;
  objc_msgSend(v4, "IPCServiceRegistry");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "serviceClientForIPCService:", &unk_254DEB718);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v8, "systemGestureXPCProxyServiceRemoteServer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[GCSystemGestureXPCProxyClientEndpoint initWithIdentifier:initialSystemGesture:isSystemGestureObserver:]([GCSystemGestureXPCProxyClientEndpoint alloc], "initWithIdentifier:initialSystemGesture:isSystemGestureObserver:", self->_identifier, self->_initialSystemGesture, self->_isSystemGestureObserver);
    objc_msgSend(v5, "IPCObjectRegistry");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "registerIPCObject:", v10);

    v12 = dispatch_semaphore_create(0);
    v22[0] = MEMORY[0x24BDAC760];
    v22[1] = 3221225472;
    v22[2] = __75__GCSystemGestureXPCProxyClientEndpointDescription_materializeWithContext___block_invoke;
    v22[3] = &unk_24D2B5BB8;
    v13 = v10;
    v23 = v13;
    v24 = v8;
    v25 = v12;
    v14 = v12;
    v15 = v8;
    objc_msgSend(v9, "systemGestureXPCProxyServiceClientEndpointConnect:reply:", v13, v22);
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
      -[GCSystemGestureXPCProxyClientEndpointDescription materializeWithContext:].cold.1();

  }
  v19 = 0;
LABEL_5:

  return v19;
}

intptr_t __75__GCSystemGestureXPCProxyClientEndpointDescription_materializeWithContext___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  v3 = *(void **)(a1 + 32);
  v4 = *(void **)(a1 + 40);
  v5 = a2;
  objc_msgSend(v4, "systemGestureXPCProxyServiceConnection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setRemoteEndpoint:connection:", v5, v6);

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

- (NSObject)identifier
{
  return objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_materializedObject, 0);
  objc_storeStrong((id *)&self->_initialSystemGesture, 0);
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

  OUTLINED_FUNCTION_2_22();
  OUTLINED_FUNCTION_0_25(&dword_215181000, v0, v1, "Materialization failure - Service not present: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_24();
}

@end
