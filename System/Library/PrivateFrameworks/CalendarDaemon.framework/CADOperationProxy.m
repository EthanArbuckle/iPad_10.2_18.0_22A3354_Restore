@implementation CADOperationProxy

- (id)forwardingTargetForSelector:(SEL)a3
{
  CADOperationProxy *v4;
  NSObject *v5;

  v4 = self;
  if (sel_CADDatabaseSetInitializationOptions_reply_ == a3
    || -[ClientConnection initializationOptionsSet](self->_conn, "initializationOptionsSet"))
  {
    if (-[CADXPCImplementation accessGrantedToPerformSelector:](v4->_implementation, "accessGrantedToPerformSelector:", a3))
    {
      return v4->_implementation;
    }
    else
    {
      v5 = CADOperationProxyLogHandle;
      if (os_log_type_enabled((os_log_t)CADOperationProxyLogHandle, OS_LOG_TYPE_ERROR))
        -[CADOperationProxy forwardingTargetForSelector:].cold.1(a3, (uint64_t)v4, v5);
    }
  }
  return v4;
}

- (CADOperationProxy)initWithClientConnection:(id)a3
{
  CADOperationProxy *v5;
  objc_super v7;

  if (initWithClientConnection__onceToken != -1)
    dispatch_once(&initWithClientConnection__onceToken, &__block_literal_global_16);
  v7.receiver = self;
  v7.super_class = (Class)CADOperationProxy;
  v5 = -[CADOperationProxy init](&v7, sel_init);
  if (v5)
  {
    v5->_conn = (ClientConnection *)a3;
    v5->_implementation = (CADXPCImplementation *)-[CADOperationProxy _newImplementation](v5, "_newImplementation");
  }
  return v5;
}

- (id)_newImplementation
{
  return -[CADXPCImplementation initWithClientConnection:]([CADXPCImplementation alloc], "initWithClientConnection:", self->_conn);
}

- (void)forwardInvocation:(id)a3
{
  NSObject *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  NSObject *v12;
  NSObject *v13;

  if ((objc_msgSend((id)objc_opt_class(), "_selectorMayBeCalledBeforeInitialization:", objc_msgSend(a3, "selector")) & 1) != 0
    || -[ClientConnection initializationOptionsSet](self->_conn, "initializationOptionsSet"))
  {
    if (-[CADXPCImplementation accessGrantedToPerformSelector:](self->_implementation, "accessGrantedToPerformSelector:", objc_msgSend(a3, "selector")))
    {
      objc_msgSend(a3, "invokeWithTarget:", self->_implementation);
      return;
    }
    v5 = CADOperationProxyLogHandle;
    if (os_log_type_enabled((os_log_t)CADOperationProxyLogHandle, OS_LOG_TYPE_ERROR))
      -[CADOperationProxy forwardInvocation:].cold.3(a3, (uint64_t)self, v5);
    if (MGGetBoolAnswer())
    {
      v6 = CADOperationProxyLogHandle;
      if (os_log_type_enabled((os_log_t)CADOperationProxyLogHandle, OS_LOG_TYPE_ERROR))
      {
        -[CADOperationProxy forwardInvocation:].cold.2((uint64_t)self, v6, &v13);
        v6 = v13;
      }
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        -[CADOperationProxy forwardInvocation:].cold.1(v6);
    }
    v7 = (void *)objc_msgSend(MEMORY[0x1E0D0C370], "copyReplyBlockFromInvocation:", a3);
    v8 = (void *)MEMORY[0x1E0D0C370];
    v9 = v7;
    v10 = a3;
    v11 = 1013;
  }
  else
  {
    v7 = (void *)objc_msgSend(MEMORY[0x1E0D0C370], "copyReplyBlockFromInvocation:", a3);
    v12 = CADOperationProxyLogHandle;
    if (os_log_type_enabled((os_log_t)CADOperationProxyLogHandle, OS_LOG_TYPE_DEBUG))
      -[CADOperationProxy forwardInvocation:].cold.4(a3, v12);
    v8 = (void *)MEMORY[0x1E0D0C370];
    v9 = v7;
    v10 = a3;
    v11 = 1019;
  }
  objc_msgSend(v8, "callReplyHandler:ofInvocation:withErrorCode:", v9, v10, v11);

}

+ (BOOL)_selectorMayBeCalledBeforeInitialization:(SEL)a3
{
  return sel_CADDatabaseSetInitializationOptions_reply_ == a3 || sel_CADMigrateDatabaseIfNeeded_ == a3;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CADOperationProxy;
  -[CADOperationProxy dealloc](&v3, sel_dealloc);
}

- (id)methodSignatureForSelector:(SEL)a3
{
  char *types;
  objc_method_description MethodDescription;
  objc_method_description v6;

  MethodDescription = protocol_getMethodDescription((Protocol *)&unk_1EF159B90, a3, 1, 1);
  types = MethodDescription.types;
  if (MethodDescription.name)
    return (id)objc_msgSend(MEMORY[0x1E0C99DD8], "signatureWithObjCTypes:", types);
  v6 = protocol_getMethodDescription((Protocol *)&unk_1EF159B90, a3, 0, 1);
  types = v6.types;
  if (v6.name)
    return (id)objc_msgSend(MEMORY[0x1E0C99DD8], "signatureWithObjCTypes:", types);
  else
    return (id)objc_msgSend(MEMORY[0x1E0C99DD8], "methodSignatureForSelector:", sel__emptyMethod);
}

os_log_t __46__CADOperationProxy_initWithClientConnection___block_invoke()
{
  const char *v0;
  objc_class *v1;
  const char *v2;
  os_log_t result;

  v0 = CADCalendarLogSubsystem;
  v1 = (objc_class *)objc_opt_class();
  v2 = -[NSString UTF8String](NSStringFromClass(v1), "UTF8String");
  result = os_log_create(v0, v2);
  CADOperationProxyLogHandle = (uint64_t)result;
  return result;
}

- (void)clearCachedAuthorizationStatus
{
  -[CADXPCImplementation clearCachedAuthorizationStatus](self->_implementation, "clearCachedAuthorizationStatus");
}

- (void)forwardingTargetForSelector:(NSObject *)a3 .cold.1(const char *a1, uint64_t a2, NSObject *a3)
{
  NSString *v5;
  uint64_t v6;
  int v7;
  NSString *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = NSStringFromSelector(a1);
  v6 = objc_msgSend(*(id *)(a2 + 8), "identity");
  v7 = 138412546;
  v8 = v5;
  v9 = 2112;
  v10 = v6;
  _os_log_error_impl(&dword_1B6A18000, a3, OS_LOG_TYPE_ERROR, "A client attempted to call [%@] and was denied due to insufficient privileges.  Client identity: [%@]", (uint8_t *)&v7, 0x16u);
  OUTLINED_FUNCTION_0_3();
}

- (void)forwardInvocation:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1B6A18000, log, OS_LOG_TYPE_ERROR, "ERROR: If this is unexpected please file a bug and if possible identify the above process via bundle id, name, or pid", v1, 2u);
}

- (void)forwardInvocation:(_QWORD *)a3 .cold.2(uint64_t a1, NSObject *a2, _QWORD *a3)
{
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend(*(id *)(a1 + 8), "identity");
  v6 = 138412290;
  v7 = v5;
  _os_log_error_impl(&dword_1B6A18000, a2, OS_LOG_TYPE_ERROR, "ERROR: Refused for connection from %@", (uint8_t *)&v6, 0xCu);
  *a3 = CADOperationProxyLogHandle;
  OUTLINED_FUNCTION_10();
}

- (void)forwardInvocation:(NSObject *)a3 .cold.3(void *a1, uint64_t a2, NSObject *a3)
{
  NSString *v5;
  int v6;
  int v7;
  int v8;
  NSString *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = NSStringFromSelector((SEL)objc_msgSend(a1, "selector"));
  v6 = objc_msgSend(*(id *)(a2 + 8), "reminderAccessGranted");
  v7 = objc_msgSend(*(id *)(a2 + 8), "eventAccessLevel");
  v8 = 138412802;
  v9 = v5;
  v10 = 1024;
  v11 = v6;
  v12 = 1024;
  v13 = v7;
  _os_log_error_impl(&dword_1B6A18000, a3, OS_LOG_TYPE_ERROR, "ERROR: access denied to perform invocation %@. The CADXPCImplementation has the following TCC status: Reminders %{BOOL}i, Events %d.", (uint8_t *)&v8, 0x18u);
  OUTLINED_FUNCTION_0_3();
}

- (void)forwardInvocation:(void *)a1 .cold.4(void *a1, NSObject *a2)
{
  int v3;
  NSString *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138412290;
  v4 = NSStringFromSelector((SEL)objc_msgSend(a1, "selector"));
  _os_log_debug_impl(&dword_1B6A18000, a2, OS_LOG_TYPE_DEBUG, "Received message %@ before initialization. Dropping this message.", (uint8_t *)&v3, 0xCu);
  OUTLINED_FUNCTION_10();
}

@end
