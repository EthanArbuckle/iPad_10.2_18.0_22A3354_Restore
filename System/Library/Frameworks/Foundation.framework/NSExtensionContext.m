@implementation NSExtensionContext

- (void)___nsx_pingHost:(id)a3
{
  (*((void (**)(id))a3 + 2))(a3);
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)NSExtensionContext;
  -[NSExtensionContext dealloc](&v3, sel_dealloc);
}

- (NSArray)inputItems
{
  return (NSArray *)objc_msgSend(-[NSExtensionContext internalImplementation](self, "internalImplementation"), "inputItems");
}

- (NSXPCConnection)_auxiliaryConnection
{
  return (NSXPCConnection *)objc_msgSend(-[NSExtensionContext internalImplementation](self, "internalImplementation"), "_auxiliaryConnection");
}

- (NSUUID)_UUID
{
  return (NSUUID *)objc_msgSend(-[NSExtensionContext internalImplementation](self, "internalImplementation"), "_UUID");
}

- (id)internalImplementation
{
  return objc_getProperty(self, a2, 16, 1);
}

- (NSExtensionContext)initWithInputItems:(id)a3
{
  return -[NSExtensionContext initWithInputItems:contextUUID:](self, "initWithInputItems:contextUUID:", a3, 0);
}

+ (id)_allowedErrorClasses
{
  return 0;
}

- (NSExtensionContext)initWithInputItems:(id)a3 contextUUID:(id)a4
{
  return -[NSExtensionContext initWithInputItems:listenerEndpoint:contextUUID:](self, "initWithInputItems:listenerEndpoint:contextUUID:", a3, 0, a4);
}

- (NSExtensionContext)initWithInputItems:(id)a3 listenerEndpoint:(id)a4 contextUUID:(id)a5
{
  NSExtensionContext *v8;
  objc_super v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v10.receiver = self;
  v10.super_class = (Class)NSExtensionContext;
  v8 = -[NSExtensionContext init](&v10, sel_init);
  if (v8)
  {
    if (qword_1ECD09D58 != -1)
      dispatch_once(&qword_1ECD09D58, &__block_literal_global_1_0);
    v8->_internalImplementation = (id)objc_msgSend(objc_alloc((Class)qword_1ECD09D50), "initWithInputItems:listenerEndpoint:contextUUID:extensionContext:", a3, a4, a5, v8);
  }
  return v8;
}

+ (id)_extensionContextForIdentifier:(id)a3
{
  return (id)objc_msgSend(+[_NSExtensionContextVendor _sharedExtensionContextVendor](_NSExtensionContextVendor, "_sharedExtensionContextVendor"), "_extensionContextForUUID:", a3);
}

- (void)setInputItems:(id)a3
{
  objc_msgSend(-[NSExtensionContext internalImplementation](self, "internalImplementation"), "_setInputItems:", a3);
}

- (void)completeRequestReturningItems:(NSArray *)items completionHandler:(void *)completionHandler
{
  objc_msgSend(-[NSExtensionContext internalImplementation](self, "internalImplementation"), "completeRequestReturningItems:completionHandler:", items, completionHandler);
}

- (void)cancelRequestWithError:(NSError *)error
{
  objc_msgSend(-[NSExtensionContext internalImplementation](self, "internalImplementation"), "cancelRequestWithError:", error);
}

- (void)openURL:(NSURL *)URL completionHandler:(void *)completionHandler
{
  objc_msgSend(-[NSExtensionContext internalImplementation](self, "internalImplementation"), "openURL:completionHandler:", URL, completionHandler);
}

+ (id)_extensionAuxiliaryHostProtocol
{
  return 0;
}

+ (id)_extensionAuxiliaryVendorProtocol
{
  return 0;
}

- (NSExtensionContext)init
{
  return -[NSExtensionContext initWithInputItems:](self, "initWithInputItems:", MEMORY[0x1E0C9AA60]);
}

+ (id)_extensionContextHostProtocolAllowedClassesForItems
{
  if (qword_1ECD09D58 != -1)
    dispatch_once(&qword_1ECD09D58, &__block_literal_global_1_0);
  return (id)objc_msgSend((id)qword_1ECD09D50, "_extensionContextHostProtocolAllowedClassesForItems");
}

+ (id)_defaultExtensionContextProtocol
{
  if (qword_1ECD09D58 != -1)
    dispatch_once(&qword_1ECD09D58, &__block_literal_global_1_0);
  return (id)objc_msgSend((id)qword_1ECD09D50, "_defaultExtensionContextProtocol");
}

+ (id)_extensionContextHostProtocolWithAllowedErrorClasses:(id)a3
{
  if (qword_1ECD09D58 != -1)
    dispatch_once(&qword_1ECD09D58, &__block_literal_global_1_0);
  return (id)objc_msgSend((id)qword_1ECD09D50, "_extensionContextHostProtocolWithAllowedErrorClasses:", a3);
}

+ (id)_defaultExtensionContextVendorProtocol
{
  if (qword_1ECD09D58 != -1)
    dispatch_once(&qword_1ECD09D58, &__block_literal_global_1_0);
  return (id)objc_msgSend((id)qword_1ECD09D50, "_defaultExtensionContextVendorProtocol");
}

+ (id)_extensionContextVendorProtocolWithAllowedErrorClasses:(id)a3
{
  if (qword_1ECD09D58 != -1)
    dispatch_once(&qword_1ECD09D58, &__block_literal_global_1_0);
  return (id)objc_msgSend((id)qword_1ECD09D50, "_extensionContextVendorProtocolWithAllowedErrorClasses:", a3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSExtensionContext)initWithCoder:(id)a3
{
  void *v5;
  NSExtensionContext *v6;
  objc_super v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (qword_1ECD09D58 != -1)
    dispatch_once(&qword_1ECD09D58, &__block_literal_global_1_0);
  v5 = (void *)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("self.internalExtensionContext"));
  v8.receiver = self;
  v8.super_class = (Class)NSExtensionContext;
  v6 = -[NSExtensionContext init](&v8, sel_init);
  if (v6)
    v6->_internalImplementation = v5;
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", -[NSExtensionContext internalImplementation](self, "internalImplementation"), CFSTR("self.internalExtensionContext"));
}

- (void)completeRequestReturningItems:(id)a3 expirationHandler:(id)a4 completion:(id)a5
{
  (*((void (**)(id))a5 + 2))(a5);
}

- (void)openURL:(id)a3 completion:(id)a4
{
  (*((void (**)(id, _QWORD))a4 + 2))(a4, 0);
}

- (void)set_UUID:(id)a3
{
  objc_msgSend(-[NSExtensionContext internalImplementation](self, "internalImplementation"), "set_UUID:", a3);
}

- (void)_setAuxiliaryConnection:(id)a3
{
  objc_msgSend(-[NSExtensionContext internalImplementation](self, "internalImplementation"), "_setAuxiliaryConnection:", a3);
}

- (NSXPCListener)_auxiliaryListener
{
  return (NSXPCListener *)objc_msgSend(-[NSExtensionContext internalImplementation](self, "internalImplementation"), "_auxiliaryListener");
}

- (void)_setAuxiliaryListener:(id)a3
{
  objc_msgSend(-[NSExtensionContext internalImplementation](self, "internalImplementation"), "_setAuxiliaryListener:", a3);
}

- (_NSExtensionContextHosting)_extensionHostProxy
{
  return (_NSExtensionContextHosting *)objc_msgSend(-[NSExtensionContext internalImplementation](self, "internalImplementation"), "_extensionHostProxy");
}

- (void)_setExtensionHostProxy:(id)a3
{
  objc_msgSend(-[NSExtensionContext internalImplementation](self, "internalImplementation"), "_setExtensionHostProxy:", a3);
}

- (BOOL)_isHost
{
  return objc_msgSend(-[NSExtensionContext internalImplementation](self, "internalImplementation"), "_isHost");
}

- (_NSExtensionContextVending)_extensionVendorProxy
{
  return (_NSExtensionContextVending *)objc_msgSend(-[NSExtensionContext internalImplementation](self, "internalImplementation"), "_extensionVendorProxy");
}

- (void)_setExtensionVendorProxy:(id)a3
{
  objc_msgSend(-[NSExtensionContext internalImplementation](self, "internalImplementation"), "_setExtensionVendorProxy:", a3);
}

- (id)_processAssertion
{
  return (id)objc_msgSend(-[NSExtensionContext internalImplementation](self, "internalImplementation"), "_processAssertion");
}

- (void)_setProcessAssertion:(id)a3
{
  objc_msgSend(-[NSExtensionContext internalImplementation](self, "internalImplementation"), "_setProcessAssertion:", a3);
}

- (OS_os_transaction)_transaction
{
  return (OS_os_transaction *)objc_msgSend(-[NSExtensionContext internalImplementation](self, "internalImplementation"), "_transaction");
}

- (void)_setTransaction:(id)a3
{
  objc_msgSend(-[NSExtensionContext internalImplementation](self, "internalImplementation"), "_setTransaction:", a3);
}

- ($115C4C562B26FF47E01F9F4EA65B5887)_extensionHostAuditToken
{
  $115C4C562B26FF47E01F9F4EA65B5887 *result;

  result = -[NSExtensionContext internalImplementation](self, "internalImplementation");
  if (result)
    return ($115C4C562B26FF47E01F9F4EA65B5887 *)-[$115C4C562B26FF47E01F9F4EA65B5887 _extensionHostAuditToken](result, "_extensionHostAuditToken");
  *(_OWORD *)retstr->var0 = 0u;
  *(_OWORD *)&retstr->var0[4] = 0u;
  return result;
}

- (void)_setExtensionHostAuditToken:(id *)a3
{
  id v4;
  __int128 v5;
  _OWORD v6[2];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v4 = -[NSExtensionContext internalImplementation](self, "internalImplementation");
  v5 = *(_OWORD *)&a3->var0[4];
  v6[0] = *(_OWORD *)a3->var0;
  v6[1] = v5;
  objc_msgSend(v4, "_setExtensionHostAuditToken:", v6);
}

- (id)_requestCleanUpBlock
{
  return (id)objc_msgSend(-[NSExtensionContext internalImplementation](self, "internalImplementation"), "_requestCleanUpBlock");
}

- (void)_setRequestCleanUpBlock:(id)a3
{
  objc_msgSend(-[NSExtensionContext internalImplementation](self, "internalImplementation"), "_setRequestCleanUpBlock:", a3);
}

- (id)_principalObject
{
  return (id)objc_msgSend(-[NSExtensionContext internalImplementation](self, "internalImplementation"), "_principalObject");
}

- (void)_setPrincipalObject:(id)a3
{
  objc_msgSend(-[NSExtensionContext internalImplementation](self, "internalImplementation"), "_setPrincipalObject:", a3);
}

- (void)invalidate
{
  objc_msgSend(-[NSExtensionContext internalImplementation](self, "internalImplementation"), "invalidate");
}

- (void)_willPerformHostCallback:(id)a3
{
  objc_msgSend(-[NSExtensionContext internalImplementation](self, "internalImplementation"), "_willPerformHostCallback:", a3);
}

- (void)_loadItemForPayload:(id)a3 completionHandler:(id)a4
{
  objc_msgSend(-[NSExtensionContext internalImplementation](self, "internalImplementation"), "_loadItemForPayload:completionHandler:", a3, a4);
}

- (void)_loadPreviewImageForPayload:(id)a3 completionHandler:(id)a4
{
  objc_msgSend(-[NSExtensionContext internalImplementation](self, "internalImplementation"), "_loadPreviewImageForPayload:completionHandler:", a3, a4);
}

- (void)_openURL:(id)a3 completion:(id)a4
{
  objc_msgSend(-[NSExtensionContext internalImplementation](self, "internalImplementation"), "_openURL:completion:", a3, a4);
}

- (NSString)description
{
  return (NSString *)objc_msgSend(-[NSExtensionContext internalImplementation](self, "internalImplementation"), "description");
}

- (BOOL)_isDummyExtension
{
  return self->__dummyExtension;
}

- (void)_setDummyExtension:(BOOL)a3
{
  self->__dummyExtension = a3;
}

@end
