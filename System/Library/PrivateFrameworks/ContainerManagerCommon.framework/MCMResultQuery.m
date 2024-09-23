@implementation MCMResultQuery

- (BOOL)encodeResultOntoReply:(id)a3
{
  id v4;
  _BOOL4 v5;
  void *v6;
  _BOOL4 v7;
  void *v8;
  unint64_t v9;
  size_t v10;
  char *v11;
  xpc_object_t v12;
  xpc_object_t v13;
  uint64_t v14;
  char *v15;
  const void *v16;
  size_t v17;
  NSObject *v18;
  xpc_object_t v19;
  _BOOL4 v20;
  _BOOL4 v21;
  _BOOL4 v22;
  _BOOL4 v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t v32;
  objc_super v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v33.receiver = self;
  v33.super_class = (Class)MCMResultQuery;
  v5 = -[MCMResultBase encodeResultOntoReply:](&v33, sel_encodeResultOntoReply_, v4);
  if (v5)
  {
    -[MCMResultBase error](self, "error");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6 == 0;

    if (v7)
    {
      -[MCMResultQuery containers](self, "containers");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "count");

      if (v9 <= 1)
        v10 = 1;
      else
        v10 = v9;
      v11 = (char *)malloc_type_calloc(v10, 8uLL, 0x2004093837F09uLL);
      if (-[MCMResultQuery includeInfo](self, "includeInfo"))
        v12 = xpc_array_create(0, 0);
      else
        v12 = 0;
      v13 = xpc_array_create(0, 0);
      if (v9)
      {
        v14 = 0;
        v15 = v11;
        do
        {
          -[MCMResultQuery _compileContainerDataForIndex:container:infos:tokens:](self, "_compileContainerDataForIndex:container:infos:tokens:", v14++, v15, v12, v13);
          v15 += 8;
        }
        while (v9 != v14);
      }
      if (v12)
        xpc_dictionary_set_value(v4, "ReplyContainerInfos", v12);
      if (v13)
        xpc_dictionary_set_value(v4, "ReplyContainerTokens", v13);
      v29 = 0;
      v30 = &v29;
      v31 = 0x2020000000;
      v32 = 0;
      -[MCMResultQuery includePath](self, "includePath");
      -[MCMResultQuery includeUserManagedAssetsRelPath](self, "includeUserManagedAssetsRelPath");
      -[MCMResultQuery includeCreator](self, "includeCreator");
      v28 = MEMORY[0x1E0C809B0];
      v16 = (const void *)container_frozenset_create();
      v17 = v30[3];
      if (v17)
      {
        v18 = dispatch_data_create(v16, v17, 0, (dispatch_block_t)*MEMORY[0x1E0C80CF8]);
        v19 = xpc_data_create_with_dispatch_data(v18);
        xpc_dictionary_set_value(v4, "ReplyContainerSet", v19);

      }
      container_frozenset_destroy();
      container_free_array_of_containers();
      v20 = -[MCMResultQuery includeInfo](self, "includeInfo", v28, 3221225472, __40__MCMResultQuery_encodeResultOntoReply___block_invoke, &unk_1E8CB5380, &v29);
      v21 = -[MCMResultQuery includePath](self, "includePath");
      v22 = -[MCMResultQuery includeUserManagedAssetsRelPath](self, "includeUserManagedAssetsRelPath");
      v23 = -[MCMResultQuery includeCreator](self, "includeCreator");
      v24 = 2;
      if (!v20)
        v24 = 0;
      v25 = v24 | v21;
      if (v22)
        v25 |= 4uLL;
      if (v23)
        v26 = v25 | 0x20;
      else
        v26 = v25;
      if (-[MCMResultQuery issuedAnyExtensions](self, "issuedAnyExtensions"))
      {
        if (-[MCMResultQuery extensionsUseProxiedClient](self, "extensionsUseProxiedClient"))
          v26 |= 0x10uLL;
        else
          v26 |= 8uLL;
      }
      xpc_dictionary_set_uint64(v4, "ReplyFlags", v26);
      _Block_object_dispose(&v29, 8);

    }
  }

  return v5;
}

- (void)_compileContainerDataForIndex:(unint64_t)a3 container:(container_object_s *)a4 infos:(id)a5 tokens:(id)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  container_object_s *v14;
  id v15;
  char **v16;
  void *v17;
  void *v18;
  char *v19;
  void *v20;
  void *v21;
  void *v22;
  xpc_object_t v23;
  void *v24;
  NSObject *v25;
  xpc_object_t v26;
  void *v27;
  id v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  _BYTE buf[12];
  __int16 v36;
  id v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v10 = a5;
  v11 = a6;
  -[MCMResultQuery containers](self, "containers");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectAtIndexedSubscript:", a3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v34 = 0;
  v14 = (container_object_s *)objc_msgSend(v13, "createLibsystemContainerWithError:", &v34);
  v15 = v34;
  *a4 = v14;
  if (!v14)
  {
    container_log_handle_for_category();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "-[MCMResultQuery _compileContainerDataForIndex:container:infos:tokens:]";
      v36 = 2112;
      v37 = v15;
      _os_log_fault_impl(&dword_1CF807000, v25, OS_LOG_TYPE_FAULT, "%s: failed to create container: %@", buf, 0x16u);
    }
    goto LABEL_26;
  }
  v16 = &selRef_removeNodeAndAddToTail_;
  if (v10)
  {
    if (!objc_msgSend(v13, "conformsToProtocol:", &unk_1EFBC2D68)
      || (objc_msgSend(v13, "info"),
          v17 = (void *)objc_claimAutoreleasedReturnValue(),
          v18 = (void *)_CFXPCCreateXPCObjectFromCFObject(),
          v17,
          !v18))
    {
      v18 = xpc_null_create();
    }
    xpc_array_append_value(v10, v18);

  }
  if (v11)
  {
    *(_QWORD *)buf = 0;
    v19 = 0;
    if (-[MCMResultQuery issueSandboxExtensions](self, "issueSandboxExtensions"))
    {
      v33 = v15;
      -[MCMResultQuery clientIdentity](self, "clientIdentity");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "containerIdentity");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "containerPath");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (char *)objc_msgSend(v20, "issueSandboxExtensionWithIdentity:containerPath:legacyExtensionPolicy:extensionsUseProxiedClient:extensionsPolicyUsesProxiedClient:error:", v21, v22, -[MCMResultQuery legacyExtensionPolicy](self, "legacyExtensionPolicy"), -[MCMResultQuery extensionsUseProxiedClient](self, "extensionsUseProxiedClient"), -[MCMResultQuery extensionsPolicyUsesProxiedClient](self, "extensionsPolicyUsesProxiedClient"), 0);
      *(_QWORD *)buf = v19;

      if (v19)
      {
        -[MCMResultQuery setIssuedAnyExtensions:](self, "setIssuedAnyExtensions:", 1);
        v23 = xpc_string_create(v19);
        if (v23)
        {
          v24 = v23;
          xpc_array_append_value(v11, v23);

          v15 = v33;
          v16 = &selRef_removeNodeAndAddToTail_;
LABEL_16:
          free(v19);
          memset_s(buf, 8uLL, 0, 8uLL);
          goto LABEL_17;
        }
      }
      v15 = v33;
      v16 = &selRef_removeNodeAndAddToTail_;
    }
    v26 = xpc_null_create();
    xpc_array_append_value(v11, v26);

    if (!v19)
      goto LABEL_17;
    goto LABEL_16;
  }
LABEL_17:
  objc_msgSend(v13, "containerPath");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "containerDataURL");
  v28 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v28, "fileSystemRepresentation");
  container_object_set_path();

  if (objc_msgSend(v13, "conformsToProtocol:", v16[419]))
  {
    v25 = v13;
    if (-[MCMResultQuery includeUserManagedAssetsRelPath](self, "includeUserManagedAssetsRelPath"))
    {
      -[NSObject userManagedAssetsDirName](v25, "userManagedAssetsDirName");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      if (v29)
      {
        objc_msgSend(CFSTR("Library"), "stringByAppendingPathComponent:", v29);
        v30 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        objc_msgSend(v30, "fileSystemRepresentation");
        container_object_set_user_managed_assets_relative_path();

      }
    }
    if (-[MCMResultQuery includeCreator](self, "includeCreator"))
    {
      -[NSObject creator](v25, "creator");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = v31;
      if (v31)
      {
        objc_msgSend(objc_retainAutorelease(v31), "UTF8String");
        container_object_set_creator_codesign_identifier();
      }

    }
LABEL_26:

  }
}

- (BOOL)includeUserManagedAssetsRelPath
{
  return self->_includeUserManagedAssetsRelPath;
}

- (NSArray)containers
{
  return self->_containers;
}

- (BOOL)issueSandboxExtensions
{
  return self->_issueSandboxExtensions;
}

- (BOOL)includePath
{
  return self->_includePath;
}

- (BOOL)includeInfo
{
  return self->_includeInfo;
}

- (BOOL)legacyExtensionPolicy
{
  return self->_legacyExtensionPolicy;
}

- (MCMClientIdentity)clientIdentity
{
  return self->_clientIdentity;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientIdentity, 0);
  objc_storeStrong((id *)&self->_containers, 0);
}

mach_vm_address_t __40__MCMResultQuery_encodeResultOntoReply___block_invoke(uint64_t a1, uint64_t a2)
{
  mach_vm_size_t v3;
  kern_return_t v4;
  kern_return_t v5;
  NSObject *v6;
  mach_vm_address_t address;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  mach_vm_size_t v12;
  __int16 v13;
  kern_return_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  address = 0;
  v3 = (a2 + *MEMORY[0x1E0C85AD8] - 1) & -*MEMORY[0x1E0C85AD8];
  v4 = mach_vm_allocate(*MEMORY[0x1E0C83DA0], &address, v3, 1);
  if (v4)
  {
    v5 = v4;
    container_log_handle_for_category();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315650;
      v10 = "-[MCMResultQuery encodeResultOntoReply:]_block_invoke";
      v11 = 2048;
      v12 = v3 >> 10;
      v13 = 1024;
      v14 = v5;
      _os_log_fault_impl(&dword_1CF807000, v6, OS_LOG_TYPE_FAULT, "%s: mach_vm_allocate() failed to allocate %llu KB: %d", buf, 0x1Cu);
    }

    return 0;
  }
  else
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v3;
    return address;
  }
}

- (MCMResultQuery)initWithContainers:(id)a3 clientIdentity:(id)a4 issueSandboxExtensions:(BOOL)a5 includePath:(BOOL)a6 includeInfo:(BOOL)a7 legacyPersonaPolicy:(BOOL)a8 legacyExtensionPolicy:(BOOL)a9 includeUserManagedAssetsRelPath:(BOOL)a10 includeCreator:(BOOL)a11 extensionsUseProxiedClient:(BOOL)a12 extensionsPolicyUsesProxiedClient:(BOOL)a13
{
  id v20;
  id v21;
  MCMResultQuery *v22;
  MCMResultQuery *v23;
  objc_super v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v20 = a3;
  v21 = a4;
  v25.receiver = self;
  v25.super_class = (Class)MCMResultQuery;
  v22 = -[MCMResultBase init](&v25, sel_init);
  v23 = v22;
  if (v22)
  {
    objc_storeStrong((id *)&v22->_containers, a3);
    objc_storeStrong((id *)&v23->_clientIdentity, a4);
    v23->_issueSandboxExtensions = a5;
    v23->_includePath = a6;
    v23->_includeInfo = a7;
    v23->_legacyPersonaPolicy = a8;
    v23->_legacyExtensionPolicy = a9;
    v23->_includeUserManagedAssetsRelPath = a10;
    v23->_includeCreator = a11;
    v23->_extensionsUseProxiedClient = a12;
    *(_WORD *)&v23->_extensionsPolicyUsesProxiedClient = a13;
  }

  return v23;
}

- (BOOL)legacyPersonaPolicy
{
  return self->_legacyPersonaPolicy;
}

- (BOOL)includeCreator
{
  return self->_includeCreator;
}

- (BOOL)extensionsUseProxiedClient
{
  return self->_extensionsUseProxiedClient;
}

- (BOOL)extensionsPolicyUsesProxiedClient
{
  return self->_extensionsPolicyUsesProxiedClient;
}

- (BOOL)issuedAnyExtensions
{
  return self->_issuedAnyExtensions;
}

- (void)setIssuedAnyExtensions:(BOOL)a3
{
  self->_issuedAnyExtensions = a3;
}

@end
