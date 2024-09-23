@implementation MCMXPCMessageWithContainerClassBase

- (MCMXPCMessageWithContainerClassBase)initWithXPCObject:(id)a3 context:(id)a4 error:(unint64_t *)a5
{
  id v8;
  MCMXPCMessageWithContainerClassBase *v9;
  MCMXPCMessageWithContainerClassBase *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  MCMContainerConfiguration *containerConfig;
  MCMContainerConfiguration *v17;
  unint64_t v18;
  objc_super v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v20.receiver = self;
  v20.super_class = (Class)MCMXPCMessageWithContainerClassBase;
  v9 = -[MCMXPCMessageBase initWithXPCObject:context:error:](&v20, sel_initWithXPCObject_context_error_, v8, a4, a5);
  if (v9)
  {
    v10 = v9;
    xpc_dictionary_get_uint64(v8, "ContainerClass");
    v11 = container_class_normalized();
    -[MCMXPCMessageBase context](v10, "context");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "globalConfiguration");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "staticConfig");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "configForContainerClass:", v11);
    v15 = objc_claimAutoreleasedReturnValue();
    containerConfig = v10->_containerConfig;
    v10->_containerConfig = (MCMContainerConfiguration *)v15;

    v17 = v10->_containerConfig;
    if (v17)
    {
      if (-[MCMContainerConfiguration supportedOnPlatform](v17, "supportedOnPlatform"))
        goto LABEL_10;
      v18 = 72;
    }
    else
    {
      v18 = 20;
    }

  }
  else
  {
    v18 = 1;
  }
  v10 = 0;
  if (a5)
    *a5 = v18;
LABEL_10:

  return v10;
}

- (unsigned)disposition
{
  unsigned int v3;
  void *v4;
  objc_super v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v6.receiver = self;
  v6.super_class = (Class)MCMXPCMessageWithContainerClassBase;
  v3 = -[MCMXPCMessageBase disposition](&v6, sel_disposition);
  if (v3 == 1)
  {
    -[MCMXPCMessageWithContainerClassBase containerConfig](self, "containerConfig");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v4, "disposition");

  }
  return v3;
}

- (MCMContainerConfiguration)containerConfig
{
  return self->_containerConfig;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_containerConfig, 0);
}

@end
