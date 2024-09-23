@implementation MCMXPCMessageSetDataProtection

- (MCMXPCMessageSetDataProtection)initWithXPCObject:(id)a3 context:(id)a4 error:(unint64_t *)a5
{
  id v8;
  MCMXPCMessageSetDataProtection *v9;
  objc_super v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MCMXPCMessageSetDataProtection;
  v9 = -[MCMXPCMessageWithContainerBase initWithXPCObject:context:error:](&v11, sel_initWithXPCObject_context_error_, v8, a4, a5);
  if (v9)
  {
    v9->_thirdParty = xpc_dictionary_get_BOOL(v8, "IsThirdParty");
    v9->_dataProtectionClass = xpc_dictionary_get_int64(v8, "DataProtectionClass");
    v9->_retryIfLocked = xpc_dictionary_get_BOOL(v8, "RetryIfLocked");
  }

  return v9;
}

- (BOOL)isThirdParty
{
  return self->_thirdParty;
}

- (int)dataProtectionClass
{
  return self->_dataProtectionClass;
}

- (BOOL)retryIfLocked
{
  return self->_retryIfLocked;
}

@end
