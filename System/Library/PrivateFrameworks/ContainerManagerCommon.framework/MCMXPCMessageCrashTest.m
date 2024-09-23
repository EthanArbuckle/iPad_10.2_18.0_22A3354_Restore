@implementation MCMXPCMessageCrashTest

- (MCMXPCMessageCrashTest)initWithXPCObject:(id)a3 context:(id)a4 error:(unint64_t *)a5
{
  id v8;
  MCMXPCMessageCrashTest *v9;
  objc_super v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MCMXPCMessageCrashTest;
  v9 = -[MCMXPCMessageBase initWithXPCObject:context:error:](&v11, sel_initWithXPCObject_context_error_, v8, a4, a5);
  if (v9)
  {
    v9->_crashCount = xpc_dictionary_get_uint64(v8, "NumRetryCrashes");
    v9->_setTestLocks = xpc_dictionary_get_uint64(v8, "TestLock");
  }

  return v9;
}

- (unint64_t)crashCount
{
  return self->_crashCount;
}

- (unint64_t)setTestLocks
{
  return self->_setTestLocks;
}

@end
