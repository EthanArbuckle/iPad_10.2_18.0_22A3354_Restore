@implementation MCMXPCMessageFlushContainerCache

- (MCMXPCMessageFlushContainerCache)initWithXPCObject:(id)a3 context:(id)a4 error:(unint64_t *)a5
{
  id v8;
  MCMXPCMessageFlushContainerCache *v9;
  objc_super v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MCMXPCMessageFlushContainerCache;
  v9 = -[MCMXPCMessageWithContainerClassBase initWithXPCObject:context:error:](&v11, sel_initWithXPCObject_context_error_, v8, a4, a5);
  if (v9)
    v9->_transient = xpc_dictionary_get_BOOL(v8, "Transient");

  return v9;
}

- (BOOL)transient
{
  return self->_transient;
}

@end
