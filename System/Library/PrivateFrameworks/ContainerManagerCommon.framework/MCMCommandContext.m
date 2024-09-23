@implementation MCMCommandContext

- (MCMContainerFactory)containerFactory
{
  return self->_containerFactory;
}

- (MCMClientIdentity)clientIdentity
{
  return self->_clientIdentity;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_classIterator, 0);
  objc_storeStrong((id *)&self->_globalConfiguration, 0);
  objc_storeStrong((id *)&self->_userIdentityCache, 0);
  objc_storeStrong((id *)&self->_containerFactory, 0);
  objc_storeStrong((id *)&self->_containerCache, 0);
  objc_storeStrong((id *)&self->_clientIdentity, 0);
}

- (MCMUserIdentityCache)userIdentityCache
{
  return self->_userIdentityCache;
}

- (MCMContainerCache)containerCache
{
  return self->_containerCache;
}

- (MCMCommandContext)initWithClientIdentity:(id)a3 containerCache:(id)a4 containerFactory:(id)a5 userIdentityCache:(id)a6 kernelPersonaID:(unsigned int)a7 globalConfiguration:(id)a8
{
  uint64_t v8;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  MCMContainerClassIterator *v19;
  void *v20;
  MCMContainerClassIterator *v21;
  MCMCommandContext *v22;

  v8 = *(_QWORD *)&a7;
  v14 = a8;
  v15 = a6;
  v16 = a5;
  v17 = a4;
  v18 = a3;
  v19 = [MCMContainerClassIterator alloc];
  objc_msgSend(v14, "staticConfig");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = -[MCMContainerClassIterator initWithStaticConfig:userIdentityCache:](v19, "initWithStaticConfig:userIdentityCache:", v20, v15);

  v22 = -[MCMCommandContext initWithClientIdentity:containerCache:containerFactory:userIdentityCache:kernelPersonaID:globalConfiguration:classIterator:](self, "initWithClientIdentity:containerCache:containerFactory:userIdentityCache:kernelPersonaID:globalConfiguration:classIterator:", v18, v17, v16, v15, v8, v14, v21);
  return v22;
}

- (MCMCommandContext)initWithClientIdentity:(id)a3 containerCache:(id)a4 containerFactory:(id)a5 userIdentityCache:(id)a6 kernelPersonaID:(unsigned int)a7 globalConfiguration:(id)a8 classIterator:(id)a9
{
  id v15;
  id v16;
  id v17;
  MCMCommandContext *v18;
  MCMCommandContext *v19;
  id v22;
  id v23;
  id v24;
  objc_super v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v24 = a3;
  v23 = a4;
  v22 = a5;
  v15 = a6;
  v16 = a8;
  v17 = a9;
  v25.receiver = self;
  v25.super_class = (Class)MCMCommandContext;
  v18 = -[MCMCommandContext init](&v25, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_clientIdentity, a3);
    objc_storeStrong((id *)&v19->_containerCache, a4);
    objc_storeStrong((id *)&v19->_containerFactory, a5);
    objc_storeStrong((id *)&v19->_userIdentityCache, a6);
    v19->_kernelPersonaID = a7;
    objc_storeStrong((id *)&v19->_globalConfiguration, a8);
    objc_storeStrong((id *)&v19->_classIterator, a9);
  }

  return v19;
}

- (unsigned)kernelPersonaID
{
  return self->_kernelPersonaID;
}

- (MCMGlobalConfiguration)globalConfiguration
{
  return self->_globalConfiguration;
}

- (MCMContainerClassUserIdentityIterator)classIterator
{
  return self->_classIterator;
}

+ (id)privileged
{
  _QWORD v3[6];

  v3[5] = *MEMORY[0x1E0C80C00];
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __31__MCMCommandContext_privileged__block_invoke;
  v3[3] = &__block_descriptor_40_e5_v8__0l;
  v3[4] = a1;
  if (privileged_token != -1)
    dispatch_once(&privileged_token, v3);
  return (id)privileged_privilegedContext;
}

+ (id)privilegedWithUserIdentity:(id)a3 userIdentityCache:(id)a4
{
  id v5;
  void *v6;
  MCMContainerFactory *v7;
  MCMContainerFactory *v8;
  MCMContainerClassIterator *v9;
  id v10;
  void *v11;
  MCMContainerClassIterator *v12;
  MCMCommandContext *v13;
  uint64_t v14;
  id v15;
  MCMCommandContext *v16;

  v5 = a4;
  +[MCMClientIdentity anonymousPrivilegedClientIdentityWithUserIdentity:](MCMClientIdentity, "anonymousPrivilegedClientIdentityWithUserIdentity:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = [MCMContainerFactory alloc];
  v8 = -[MCMContainerFactory initWithContainerCache:clientIdentity:userIdentityCache:](v7, "initWithContainerCache:clientIdentity:userIdentityCache:", gContainerCache, v6, v5);
  v9 = [MCMContainerClassIterator alloc];
  v10 = containermanager_copy_global_configuration();
  objc_msgSend(v10, "staticConfig");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[MCMContainerClassIterator initWithStaticConfig:userIdentityCache:](v9, "initWithStaticConfig:userIdentityCache:", v11, v5);

  v13 = [MCMCommandContext alloc];
  v14 = gContainerCache;
  v15 = containermanager_copy_global_configuration();
  v16 = -[MCMCommandContext initWithClientIdentity:containerCache:containerFactory:userIdentityCache:kernelPersonaID:globalConfiguration:classIterator:](v13, "initWithClientIdentity:containerCache:containerFactory:userIdentityCache:kernelPersonaID:globalConfiguration:classIterator:", v6, v14, v8, v5, 0, v15, v12);

  return v16;
}

void __31__MCMCommandContext_privileged__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  +[MCMUserIdentitySharedCache sharedInstance](MCMUserIdentitySharedCache, "sharedInstance");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *(void **)(a1 + 32);
  objc_msgSend(v6, "defaultUserIdentity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "privilegedWithUserIdentity:userIdentityCache:", v3, v6);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)privileged_privilegedContext;
  privileged_privilegedContext = v4;

}

@end
