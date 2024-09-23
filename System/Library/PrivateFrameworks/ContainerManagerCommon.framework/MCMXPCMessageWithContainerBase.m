@implementation MCMXPCMessageWithContainerBase

- (unsigned)disposition
{
  unsigned int v3;
  void *v4;
  objc_super v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v6.receiver = self;
  v6.super_class = (Class)MCMXPCMessageWithContainerBase;
  v3 = -[MCMXPCMessageBase disposition](&v6, sel_disposition);
  if (v3 == 1)
  {
    -[MCMXPCMessageWithContainerBase containerIdentity](self, "containerIdentity");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v4, "disposition");

  }
  return v3;
}

- (MCMXPCMessageWithContainerBase)initWithXPCObject:(id)a3 context:(id)a4 error:(unint64_t *)a5
{
  id v8;
  id v9;
  MCMXPCMessageWithContainerBase *v10;
  MCMXPCMessageWithContainerBase *v11;
  uint64_t v12;
  MCMContainerIdentity *containerIdentity;
  objc_super v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v15.receiver = self;
  v15.super_class = (Class)MCMXPCMessageWithContainerBase;
  v10 = -[MCMXPCMessageBase initWithXPCObject:context:error:](&v15, sel_initWithXPCObject_context_error_, v8, v9, a5);
  v11 = v10;
  if (v10)
  {
    -[MCMXPCMessageWithContainerBase containerIdentityFromXPCObject:context:error:](v10, "containerIdentityFromXPCObject:context:error:", v8, v9, a5);
    v12 = objc_claimAutoreleasedReturnValue();
    containerIdentity = v11->_containerIdentity;
    v11->_containerIdentity = (MCMContainerIdentity *)v12;

    if (!v11->_containerIdentity)
    {

      v11 = 0;
    }
  }

  return v11;
}

- (id)containerIdentityFromXPCObject:(id)a3 context:(id)a4 error:(unint64_t *)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t uint64;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  _BOOL8 v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  id v24;
  uint64_t v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v27[0] = 1;
  objc_msgSend(v9, "clientIdentity");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  uint64 = xpc_dictionary_get_uint64(v8, "Platform");
  objc_msgSend(v10, "codeSignInfo");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "identifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCMXPCMessageBase identifierFromXPCObject:elseClientIdentifier:](self, "identifierFromXPCObject:elseClientIdentifier:", v8, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
  {
    v22 = 0;
    v20 = 0;
    v18 = 0;
    v23 = 18;
    goto LABEL_10;
  }
  v26 = uint64;
  v15 = xpc_dictionary_get_uint64(v8, "ContainerClass");
  objc_msgSend(v9, "globalConfiguration");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "staticConfig");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "configForContainerClass:", v15);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v18)
  {
    v22 = 0;
    v20 = 0;
    v23 = 20;
    goto LABEL_10;
  }
  if ((objc_msgSend(v18, "supportedOnPlatform") & 1) == 0)
  {
    v22 = 0;
    v20 = 0;
    v23 = 72;
LABEL_10:
    v27[0] = v23;
    if (!a5)
      goto LABEL_13;
    goto LABEL_11;
  }
  v19 = xpc_dictionary_get_BOOL(v8, "Transient");
  objc_msgSend((id)objc_opt_class(), "userIdentityForContainerIdentifier:clientIdentity:containerClass:error:", v14, v10, v15, v27);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20)
  {
    objc_msgSend(v9, "userIdentityCache");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    +[MCMContainerIdentity containerIdentityWithUserIdentity:identifier:containerConfig:platform:transient:userIdentityCache:error:](MCMContainerIdentity, "containerIdentityWithUserIdentity:identifier:containerConfig:platform:transient:userIdentityCache:error:", v20, v14, v18, v26, v19, v21, v27);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (!a5)
      goto LABEL_13;
  }
  else
  {
    v22 = 0;
    if (!a5)
      goto LABEL_13;
  }
LABEL_11:
  if (!v22)
    *a5 = v27[0];
LABEL_13:
  v24 = v22;

  return v24;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_containerIdentity, 0);
}

- (MCMContainerIdentity)containerIdentity
{
  return self->_containerIdentity;
}

@end
