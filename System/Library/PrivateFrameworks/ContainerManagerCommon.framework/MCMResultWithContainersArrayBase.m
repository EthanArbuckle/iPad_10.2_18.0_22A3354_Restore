@implementation MCMResultWithContainersArrayBase

- (BOOL)encodeResultOntoReply:(id)a3
{
  id v4;
  _BOOL4 v5;
  void *v6;
  xpc_object_t v7;
  objc_super v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MCMResultWithContainersArrayBase;
  v5 = -[MCMResultBase encodeResultOntoReply:](&v9, sel_encodeResultOntoReply_, v4);
  if (v5)
  {
    -[MCMResultBase error](self, "error");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      v7 = xpc_array_create(0, 0);
      -[MCMResultWithContainersArrayBase _encodeContainersOnXPCContainers:](self, "_encodeContainersOnXPCContainers:", v7);
      -[MCMResultWithContainersArrayBase _encodeContainerIdentitiesAndPathsOnXPCContainers:](self, "_encodeContainerIdentitiesAndPathsOnXPCContainers:", v7);
      xpc_dictionary_set_value(v4, "ReplyContainersArray", v7);

    }
  }

  return v5;
}

- (MCMResultWithContainersArrayBase)initWithContainerPaths:(id)a3 containerIdentities:(id)a4 includePath:(BOOL)a5 clientIdentity:(id)a6 skipSandboxExtensions:(BOOL)a7
{
  id v13;
  id v14;
  id v15;
  MCMResultWithContainersArrayBase *v16;
  MCMResultWithContainersArrayBase *v17;
  NSArray *containers;
  objc_super v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v15 = a6;
  v20.receiver = self;
  v20.super_class = (Class)MCMResultWithContainersArrayBase;
  v16 = -[MCMResultBase init](&v20, sel_init);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_containerPaths, a3);
    objc_storeStrong((id *)&v17->_containerIdentities, a4);
    containers = v17->_containers;
    v17->_containers = 0;

    v17->_includePath = a5;
    v17->_includeInfo = 0;
    v17->_includeUserManagedAssetsRelPath = 0;
    v17->_includeCreator = 0;
    objc_storeStrong((id *)&v17->_clientIdentity, a6);
    v17->_skipSandboxExtensions = a7;
  }

  return v17;
}

- (MCMResultWithContainersArrayBase)initWithContainers:(id)a3 includePath:(BOOL)a4 includeInfo:(BOOL)a5 includeUserManagedAssetsRelPath:(BOOL)a6 includeCreator:(BOOL)a7 clientIdentity:(id)a8 skipSandboxExtensions:(BOOL)a9
{
  id v16;
  id v17;
  MCMResultWithContainersArrayBase *v18;
  MCMResultWithContainersArrayBase *v19;
  NSArray *containerPaths;
  NSArray *containerIdentities;
  objc_super v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v16 = a3;
  v17 = a8;
  v23.receiver = self;
  v23.super_class = (Class)MCMResultWithContainersArrayBase;
  v18 = -[MCMResultBase init](&v23, sel_init);
  v19 = v18;
  if (v18)
  {
    containerPaths = v18->_containerPaths;
    v18->_containerPaths = 0;

    containerIdentities = v19->_containerIdentities;
    v19->_containerIdentities = 0;

    objc_storeStrong((id *)&v19->_containers, a3);
    v19->_includePath = a4;
    v19->_includeInfo = a5;
    v19->_includeUserManagedAssetsRelPath = a6;
    v19->_includeCreator = a7;
    objc_storeStrong((id *)&v19->_clientIdentity, a8);
    v19->_skipSandboxExtensions = a9;
  }

  return v19;
}

- (void)_encodeContainersOnXPCContainers:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  unint64_t v8;
  void *v9;
  void *v10;
  xpc_object_t v11;
  void *v12;
  void *v13;
  void *v14;
  MCMResultWithContainerBase *v15;
  MCMResultWithContainerBase *v16;
  void *v17;
  unint64_t v18;
  void *v19[2];

  v19[1] = *(void **)MEMORY[0x1E0C80C00];
  v4 = a3;
  -[MCMResultWithContainersArrayBase containers](self, "containers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[MCMResultWithContainersArrayBase containers](self, "containers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count");

    if (v7)
    {
      v8 = 0;
      do
      {
        -[MCMResultWithContainersArrayBase containers](self, "containers");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectAtIndexedSubscript:", v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        v11 = xpc_dictionary_create(0, 0, 0);
        v19[0] = 0;
        if (!-[MCMResultWithContainersArrayBase skipSandboxExtensions](self, "skipSandboxExtensions"))
        {
          -[MCMResultWithContainersArrayBase clientIdentity](self, "clientIdentity");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "containerIdentity");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "containerPath");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v19[0] = (void *)objc_msgSend(v12, "issueSandboxExtensionWithIdentity:containerPath:legacyExtensionPolicy:extensionsUseProxiedClient:extensionsPolicyUsesProxiedClient:error:", v13, v14, 1, 1, 1, 0);

        }
        v15 = [MCMResultWithContainerBase alloc];
        v16 = -[MCMResultWithContainerBase initWithMetadata:sandboxToken:includePath:includeInfo:includeUserManagedAssetsRelPath:includeCreator:](v15, "initWithMetadata:sandboxToken:includePath:includeInfo:includeUserManagedAssetsRelPath:includeCreator:", v10, v19[0], -[MCMResultWithContainersArrayBase includePath](self, "includePath"), -[MCMResultWithContainersArrayBase includeInfo](self, "includeInfo"), -[MCMResultWithContainersArrayBase includeUserManagedAssetsRelPath](self, "includeUserManagedAssetsRelPath"), -[MCMResultWithContainersArrayBase includeCreator](self, "includeCreator"));
        -[MCMResultWithContainerBase encodeResultOntoReply:](v16, "encodeResultOntoReply:", v11);
        xpc_array_append_value(v4, v11);
        if (v19[0])
        {
          free(v19[0]);
          memset_s(v19, 8uLL, 0, 8uLL);
        }

        ++v8;
        -[MCMResultWithContainersArrayBase containers](self, "containers");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "count");

      }
      while (v8 < v18);
    }
  }

}

- (void)_encodeContainerIdentitiesAndPathsOnXPCContainers:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  xpc_object_t v13;
  void *v14;
  MCMResultWithContainerBase *v15;
  void *v16;
  MCMResultWithContainerBase *v17;
  void *v18;
  unint64_t v19;
  void *v20[2];

  v20[1] = *(void **)MEMORY[0x1E0C80C00];
  v4 = a3;
  -[MCMResultWithContainersArrayBase containerIdentities](self, "containerIdentities");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[MCMResultWithContainersArrayBase containerIdentities](self, "containerIdentities");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count");

    if (v7)
    {
      v8 = 0;
      do
      {
        -[MCMResultWithContainersArrayBase containerIdentities](self, "containerIdentities");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectAtIndexedSubscript:", v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        -[MCMResultWithContainersArrayBase containerPaths](self, "containerPaths");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectAtIndexedSubscript:", v8);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        v13 = xpc_dictionary_create(0, 0, 0);
        v20[0] = 0;
        if (!-[MCMResultWithContainersArrayBase skipSandboxExtensions](self, "skipSandboxExtensions"))
        {
          -[MCMResultWithContainersArrayBase clientIdentity](self, "clientIdentity");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v20[0] = (void *)objc_msgSend(v14, "issueSandboxExtensionWithIdentity:containerPath:legacyExtensionPolicy:extensionsUseProxiedClient:extensionsPolicyUsesProxiedClient:error:", v10, v12, 1, 1, 1, 0);

        }
        v15 = [MCMResultWithContainerBase alloc];
        objc_msgSend(v10, "uuid");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = -[MCMResultWithContainerBase initWithContainerPath:containerIdentity:uuid:sandboxToken:includePath:](v15, "initWithContainerPath:containerIdentity:uuid:sandboxToken:includePath:", v12, v10, v16, v20[0], -[MCMResultWithContainersArrayBase includePath](self, "includePath"));

        -[MCMResultWithContainerBase encodeResultOntoReply:](v17, "encodeResultOntoReply:", v13);
        xpc_array_append_value(v4, v13);
        if (v20[0])
        {
          free(v20[0]);
          memset_s(v20, 8uLL, 0, 8uLL);
        }

        ++v8;
        -[MCMResultWithContainersArrayBase containerIdentities](self, "containerIdentities");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "count");

      }
      while (v8 < v19);
    }
  }

}

- (NSArray)containerPaths
{
  return self->_containerPaths;
}

- (NSArray)containerIdentities
{
  return self->_containerIdentities;
}

- (NSArray)containers
{
  return self->_containers;
}

- (BOOL)includePath
{
  return self->_includePath;
}

- (BOOL)includeInfo
{
  return self->_includeInfo;
}

- (BOOL)includeUserManagedAssetsRelPath
{
  return self->_includeUserManagedAssetsRelPath;
}

- (BOOL)includeCreator
{
  return self->_includeCreator;
}

- (MCMClientIdentity)clientIdentity
{
  return self->_clientIdentity;
}

- (BOOL)skipSandboxExtensions
{
  return self->_skipSandboxExtensions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientIdentity, 0);
  objc_storeStrong((id *)&self->_containers, 0);
  objc_storeStrong((id *)&self->_containerIdentities, 0);
  objc_storeStrong((id *)&self->_containerPaths, 0);
}

@end
