@implementation MCMXPCMessageWithConcreteContainerBase

- (MCMXPCMessageWithConcreteContainerBase)initWithConcreteContainer:(id)a3 context:(id)a4
{
  id v7;
  MCMXPCMessageWithConcreteContainerBase *v8;
  MCMXPCMessageWithConcreteContainerBase *v9;
  objc_super v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MCMXPCMessageWithConcreteContainerBase;
  v8 = -[MCMXPCMessageBase initWithContext:](&v11, sel_initWithContext_, a4);
  v9 = v8;
  if (v8)
    objc_storeStrong((id *)&v8->_concreteContainerIdentity, a3);

  return v9;
}

- (MCMXPCMessageWithConcreteContainerBase)initWithXPCObject:(id)a3 context:(id)a4 error:(unint64_t *)a5
{
  id v8;
  id v9;
  MCMXPCMessageWithConcreteContainerBase *v10;
  void *v11;
  uint64_t v12;
  MCMConcreteContainerIdentityForLibsystem *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  MCMConcreteContainerIdentity *concreteContainerIdentity;
  unint64_t v20;
  objc_super v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v21.receiver = self;
  v21.super_class = (Class)MCMXPCMessageWithConcreteContainerBase;
  v10 = -[MCMXPCMessageBase initWithXPCObject:context:error:](&v21, sel_initWithXPCObject_context_error_, v8, v9, a5);
  if (v10)
  {
    v20 = 1;
    xpc_dictionary_get_dictionary(v8, "Container");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = container_xpc_decode_container_object();
    if (!v12)
      goto LABEL_4;
    v13 = [MCMConcreteContainerIdentityForLibsystem alloc];
    objc_msgSend(v9, "clientIdentity");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "userIdentity");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "userIdentityCache");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[MCMConcreteContainerIdentityForLibsystem initWithLibsystemContainer:defaultUserIdentity:userIdentityCache:error:](v13, "initWithLibsystemContainer:defaultUserIdentity:userIdentityCache:error:", v12, v15, v16, &v20);
    concreteContainerIdentity = v10->_concreteContainerIdentity;
    v10->_concreteContainerIdentity = (MCMConcreteContainerIdentity *)v17;

    if (!v10->_concreteContainerIdentity)
    {
LABEL_4:

      v10 = 0;
    }
    if (a5 && v20 != 1)
      *a5 = v20;

  }
  else
  {
    v12 = 0;
  }
  MEMORY[0x1D17D69E0](v12);

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
  v6.super_class = (Class)MCMXPCMessageWithConcreteContainerBase;
  v3 = -[MCMXPCMessageBase disposition](&v6, sel_disposition);
  if (v3 == 1)
  {
    -[MCMXPCMessageWithConcreteContainerBase concreteContainerIdentity](self, "concreteContainerIdentity");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v4, "disposition");

  }
  return v3;
}

- (MCMConcreteContainerIdentity)concreteContainerIdentity
{
  return self->_concreteContainerIdentity;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_concreteContainerIdentity, 0);
}

@end
