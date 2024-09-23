@implementation MCMXPCMessageDeletePluginDataContainerContents

- (MCMXPCMessageDeletePluginDataContainerContents)initWithXPCObject:(id)a3 context:(id)a4 error:(unint64_t *)a5
{
  id v8;
  id v9;
  MCMXPCMessageDeletePluginDataContainerContents *v10;
  objc_super v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a3;
  xpc_dictionary_set_uint64(v9, "ContainerClass", 4uLL);
  v12.receiver = self;
  v12.super_class = (Class)MCMXPCMessageDeletePluginDataContainerContents;
  v10 = -[MCMXPCMessageWithContainerBase initWithXPCObject:context:error:](&v12, sel_initWithXPCObject_context_error_, v9, v8, a5);

  return v10;
}

- (unsigned)disposition
{
  unsigned int v2;
  id v3;
  objc_super v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v5.receiver = self;
  v5.super_class = (Class)MCMXPCMessageDeletePluginDataContainerContents;
  v2 = -[MCMXPCMessageWithContainerBase disposition](&v5, sel_disposition);
  if (v2 == 1)
  {
    v3 = containermanager_copy_global_configuration();
    v2 = objc_msgSend(v3, "dispositionForContainerClass:", 4);

  }
  return v2;
}

@end
