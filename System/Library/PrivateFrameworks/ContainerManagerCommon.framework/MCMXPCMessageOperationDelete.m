@implementation MCMXPCMessageOperationDelete

- (MCMXPCMessageOperationDelete)initWithXPCObject:(id)a3 context:(id)a4 error:(unint64_t *)a5
{
  id v8;
  MCMXPCMessageOperationDelete *v9;
  objc_super v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MCMXPCMessageOperationDelete;
  v9 = -[MCMXPCMessageWithConcreteContainersArrayBase initWithXPCObject:context:error:](&v11, sel_initWithXPCObject_context_error_, v8, a4, a5);
  if (v9)
    v9->_waitForDiskSpaceReclaim = xpc_dictionary_get_uint64(v8, "Flags") & 1;

  return v9;
}

- (BOOL)waitForDiskSpaceReclaim
{
  return self->_waitForDiskSpaceReclaim;
}

@end
