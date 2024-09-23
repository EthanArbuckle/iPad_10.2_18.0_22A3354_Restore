@implementation FPXDomainContext

- (NSFileProviderReplicatedExtension)vendorInstance
{
  return self->_vendorInstance;
}

- (BOOL)usesFPFS
{
  return self->_usesFPFS;
}

- (OS_os_log)log
{
  return self->_log;
}

- (FPXExtensionContext)extensionContext
{
  return (FPXExtensionContext *)objc_loadWeakRetained((id *)&self->_extensionContext);
}

- (NSFileProviderDomain)domain
{
  return self->_domain;
}

- (FPXDomainContext)initWithVendorInstance:(id)a3 domain:(id)a4 extensionContext:(id)a5 providerDomain:(id)a6 domainVersion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  FPXDomainContext *v17;
  FPXDomainContext *v18;
  FPExceptionToErrorProxy *v19;
  NSFileProviderReplicatedExtension *vendorInstance;
  void *v21;
  id v22;
  uint64_t v23;
  OS_os_log *log;
  FPSpotlightIndexer *v25;
  FPSpotlightIndexer *spotlightIndexer;
  objc_super v28;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v28.receiver = self;
  v28.super_class = (Class)FPXDomainContext;
  v17 = -[FPXDomainContext init](&v28, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_domain, a4);
    objc_storeStrong((id *)&v18->_providerDomain, a6);
    v19 = -[FPExceptionToErrorProxy initWithTarget:]([FPExceptionToErrorProxy alloc], "initWithTarget:", v12);
    vendorInstance = v18->_vendorInstance;
    v18->_vendorInstance = (NSFileProviderReplicatedExtension *)v19;

    objc_storeWeak((id *)&v18->_extensionContext, v14);
    v18->_usesFPFS = objc_msgSend(v15, "isUsingFPFS");
    objc_storeStrong((id *)&v18->_lastKnownDomainVersion, a7);
    v18->_selfPid = getpid();
    objc_msgSend(v15, "identifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "fp_obfuscatedProviderDomainID");
    v22 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    fpfs_create_log_for_provider((char *)objc_msgSend(v22, "UTF8String"));
    v23 = objc_claimAutoreleasedReturnValue();
    log = v18->_log;
    v18->_log = (OS_os_log *)v23;

    -[FPXDomainContext updateCapabilities](v18, "updateCapabilities");
    if ((v18->_extensionCapabilities & 1) != 0 && (objc_msgSend(v15, "isUsingFPFS") & 1) == 0)
    {
      v25 = -[FPSpotlightIndexer initWithDomain:providerDomain:log:supportURL:dropIndexDelegate:]([FPSpotlightIndexer alloc], "initWithDomain:providerDomain:log:supportURL:dropIndexDelegate:", v13, v15, v18->_log, 0, 0);
      spotlightIndexer = v18->_spotlightIndexer;
      v18->_spotlightIndexer = v25;

      -[FPSpotlightIndexer setDomainContext:](v18->_spotlightIndexer, "setDomainContext:", v18);
    }
  }

  return v18;
}

- (void)updateCapabilities
{
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  id v15;

  objc_msgSend(MEMORY[0x1E0CA5848], "bundleRecordForCurrentProcess");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  if (!v15)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("FPXExtensionContext could not get the bundle record for the current process."));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    fp_current_or_default_log();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      -[NSXPCConnection(FPAdditions) fp_userInfo].cold.1((uint64_t)v13, v14);

    __assert_rtn("-[FPXDomainContext updateCapabilities]", "/Library/Caches/com.apple.xbs/Sources/FileProvider/extension/FPXDomainContext.m", 80, (const char *)objc_msgSend(objc_retainAutorelease(v13), "UTF8String"));
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("FPXDomainContext.m"), 82, CFSTR("FPXExtensionContext initialized from a bundle that is not a plugin. Bundle proxy is %@ instead"), v15);

    }
  }
  objc_msgSend(v15, "infoDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:ofClass:", CFSTR("NSExtension"), objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  objectForKeyOfClass(v5, (uint64_t)CFSTR("NSExtensionFileProviderSupportsEnumeration"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "BOOLValue");

  objc_opt_class();
  objectForKeyOfClass(v5, (uint64_t)CFSTR("NSExtensionPointVersion"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v8, "isEqualToString:", CFSTR("2.0")) & 1) != 0 || v7)
    self->_extensionCapabilities |= 1uLL;
  -[FPXDomainContext instanceWithPrivateSelector:](self, "instanceWithPrivateSelector:", sel_evictItemWithIdentifier_completionHandler_);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    self->_extensionCapabilities |= 2uLL;
  objc_opt_class();
  objectForKeyOfClass(v5, (uint64_t)CFSTR("NSExtensionFileProviderSupportsTagging"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (!v10 || objc_msgSend(v10, "BOOLValue"))
    self->_extensionCapabilities |= 4uLL;

}

- (void)prepareForDomainRemovalWithCompletionHandler:(id)a3
{
  id v4;
  FPSpotlightIndexer *spotlightIndexer;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  spotlightIndexer = self->_spotlightIndexer;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __65__FPXDomainContext_prepareForDomainRemovalWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E4449A88;
  v8 = v4;
  v6 = v4;
  -[FPSpotlightIndexer dropIndexAndInvalidateWithDropReason:completionHandler:](spotlightIndexer, "dropIndexAndInvalidateWithDropReason:completionHandler:", 1, v7);

}

uint64_t __65__FPXDomainContext_prepareForDomainRemovalWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)internalErrorFromVendorError:(id)a3 callerDescription:(id)a4
{
  _QWORD v5[5];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __67__FPXDomainContext_internalErrorFromVendorError_callerDescription___block_invoke;
  v5[3] = &unk_1E444F938;
  v5[4] = self;
  objc_msgSend(a3, "fp_internalErrorForVendorErrorWithCallerDescription:itemCreationBlock:", a4, v5);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t __67__FPXDomainContext_internalErrorFromVendorError_callerDescription___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "itemFromVendorItem:", a2);
}

- (id)itemFromVendorItem:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  FPItem *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  void *v18;
  unint64_t v19;
  void *v20;
  FPItem *v21;
  void *v23;
  void *v24;
  void *v25;
  id v26;

  if (a3)
  {
    v26 = a3;
    -[FPXDomainContext extensionContext](self, "extensionContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      -[FPXDomainContext extensionContext](self, "extensionContext");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v6)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("FPXDomainContext.m"), 133, CFSTR("there should be an extension context"));

      }
    }
    -[FPXDomainContext extensionContext](self, "extensionContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "providerIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
      -[FPXDomainContext extensionContext](self, "extensionContext");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "providerIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v10)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("FPXDomainContext.m"), 134, CFSTR("there should be a provider identifier"));

      }
    }
    v11 = [FPItem alloc];
    -[FPXDomainContext extensionContext](self, "extensionContext");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "providerIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[FPXDomainContext domain](self, "domain");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "identifier");
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = (void *)v14;
    if (v14)
      v16 = (const __CFString *)v14;
    else
      v16 = CFSTR("NSFileProviderDomainDefaultIdentifier");
    -[FPXDomainContext domain](self, "domain");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "spotlightDomainIdentifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = -[FPXDomainContext extensionCapabilities](self, "extensionCapabilities");
    -[FPXDomainContext extensionContext](self, "extensionContext");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = -[FPItem initWithVendorItem:provider:domain:spotlightDomainIdentifier:extensionCapabilities:useFPFS:](v11, "initWithVendorItem:provider:domain:spotlightDomainIdentifier:extensionCapabilities:useFPFS:", v26, v12, v16, v18, v19, objc_msgSend(v20, "usesFPFS"));

    -[FPItem setEnumerationOrigin:](v21, "setEnumerationOrigin:", 1);
  }
  else
  {
    v21 = 0;
  }
  return v21;
}

- (id)itemIDFromVendorItemID:(id)a3
{
  id v4;
  FPItemID *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  const __CFString *v11;
  FPItemID *v12;

  if (a3)
  {
    v4 = a3;
    v5 = [FPItemID alloc];
    -[FPXDomainContext extensionContext](self, "extensionContext");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "providerIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[FPXDomainContext domain](self, "domain");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "identifier");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    if (v9)
      v11 = (const __CFString *)v9;
    else
      v11 = CFSTR("NSFileProviderDomainDefaultIdentifier");
    v12 = -[FPItemID initWithProviderID:domainIdentifier:itemIdentifier:](v5, "initWithProviderID:domainIdentifier:itemIdentifier:", v7, v11, v4);

  }
  else
  {
    v12 = 0;
  }
  return v12;
}

- (id)itemsFromVendorItems:(id)a3
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __41__FPXDomainContext_itemsFromVendorItems___block_invoke;
  v4[3] = &unk_1E444F960;
  v4[4] = self;
  objc_msgSend(a3, "fp_map:", v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t __41__FPXDomainContext_itemsFromVendorItems___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "itemFromVendorItem:", a2);
}

- (id)itemIDsFromVendorItemIDs:(id)a3
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __45__FPXDomainContext_itemIDsFromVendorItemIDs___block_invoke;
  v4[3] = &unk_1E4449C38;
  v4[4] = self;
  objc_msgSend(a3, "fp_map:", v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t __45__FPXDomainContext_itemIDsFromVendorItemIDs___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "itemIDFromVendorItemID:", a2);
}

- (void)invalidate
{
  id v2;

  -[FPXDomainContext vendorInstance](self, "vendorInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "invalidate");

}

- (NSFileProviderExtension)v2Instance
{
  NSFileProviderReplicatedExtension *v3;

  if (-[FPXDomainContext usesFPFS](self, "usesFPFS"))
    goto LABEL_6;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[NSFileProviderReplicatedExtension extension](self->_vendorInstance, "extension");
      v3 = (NSFileProviderReplicatedExtension *)objc_claimAutoreleasedReturnValue();
      return (NSFileProviderExtension *)v3;
    }
LABEL_6:
    v3 = 0;
    return (NSFileProviderExtension *)v3;
  }
  v3 = self->_vendorInstance;
  return (NSFileProviderExtension *)v3;
}

- (id)instanceWithPrivateSelector:(SEL)a3
{
  NSFileProviderReplicatedExtension *v4;

  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[NSFileProviderReplicatedExtension extension](self->_vendorInstance, "extension");
      v4 = (NSFileProviderReplicatedExtension *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
        return v4;

    }
    v4 = 0;
    return v4;
  }
  v4 = self->_vendorInstance;
  return v4;
}

- (NSFileProviderDomainVersion)domainVersion
{
  void *v3;
  NSFileProviderDomainVersion *lastKnownDomainVersion;
  NSObject *v5;
  id v6;
  void *v7;
  void *v8;

  if (-[FPXDomainContext usesFPFS](self, "usesFPFS")
    && -[NSFileProviderReplicatedExtension conformsToProtocol:](self->_vendorInstance, "conformsToProtocol:", &unk_1EE5F83A0))
  {
    -[NSFileProviderReplicatedExtension domainVersion](self->_vendorInstance, "domainVersion");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      lastKnownDomainVersion = self->_lastKnownDomainVersion;
      if (!lastKnownDomainVersion)
      {
LABEL_7:
        if ((objc_msgSend(v3, "isEqual:", lastKnownDomainVersion) & 1) == 0)
        {
          fp_current_or_default_log();
          v5 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
            -[FPXDomainContext domainVersion].cold.1((uint64_t *)&self->_lastKnownDomainVersion, (uint64_t)v3, v5);

          objc_storeStrong((id *)&self->_lastKnownDomainVersion, v3);
          -[FPXDomainContext retrieveUserInfoFromExtension](self, "retrieveUserInfoFromExtension");
        }
        v6 = v3;
        goto LABEL_14;
      }
      if ((objc_msgSend(v3, "compare:") & 0x8000000000000000) == 0)
      {
        lastKnownDomainVersion = self->_lastKnownDomainVersion;
        goto LABEL_7;
      }
    }
    -[FPXDomainContext domain](self, "domain");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    __FILEPROVIDER_BAD_DOMAIN_VERSION__(v8, self->_lastKnownDomainVersion, v3);

    v6 = 0;
LABEL_14:

    return (NSFileProviderDomainVersion *)v6;
  }
  v6 = 0;
  return (NSFileProviderDomainVersion *)v6;
}

- (NSDictionary)userInfo
{
  NSDictionary *lastKnownUserInfo;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSDictionary *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  if (!-[FPXDomainContext usesFPFS](self, "usesFPFS"))
  {
LABEL_10:
    v12 = 0;
    return v12;
  }
  lastKnownUserInfo = self->_lastKnownUserInfo;
  if (!lastKnownUserInfo)
  {
    fp_current_or_default_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      -[FPXDomainContext userInfo].cold.2(v4, v5, v6, v7, v8, v9, v10, v11);

    -[FPXDomainContext retrieveUserInfoFromExtension](self, "retrieveUserInfoFromExtension");
    lastKnownUserInfo = self->_lastKnownUserInfo;
    if (!lastKnownUserInfo)
    {
      fp_current_or_default_log();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        -[FPXDomainContext userInfo].cold.1(v13, v14, v15, v16, v17, v18, v19, v20);

      goto LABEL_10;
    }
  }
  v12 = lastKnownUserInfo;
  return v12;
}

- (void)retrieveUserInfoFromExtension
{
  OUTLINED_FUNCTION_8(&dword_1A0A34000, a2, a3, "[DEBUG] Updating user info from extension, was previously %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

- (id)currentResponseWithRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  if (-[FPXDomainContext usesFPFS](self, "usesFPFS"))
  {
    v5 = (void *)objc_opt_new();
    -[FPXDomainContext domainVersion](self, "domainVersion");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setDomainVersion:", v6);
    if (v4)
    {
      objc_msgSend(v4, "domainVersion");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[FPXDomainContext shouldIngestDomainUserInfoUpdateWithOldVersion:newVersion:](self, "shouldIngestDomainUserInfoUpdateWithOldVersion:newVersion:", v7, v6))
      {
        -[FPXDomainContext userInfo](self, "userInfo");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setDomainUserInfo:", v8);

      }
    }
    if (-[FPProviderDomain appliesChangesAtomically](self->_providerDomain, "appliesChangesAtomically"))
    {
      objc_msgSend(v5, "setExtensionPid:", self->_selfPid);
      ++self->_sequenceNumber;
      objc_msgSend(v5, "setSequenceNumber:");
    }

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)shouldIngestDomainUserInfoUpdateWithOldVersion:(id)a3 newVersion:(id)a4
{
  unint64_t v5;
  unint64_t v6;
  void *v7;
  BOOL v8;
  BOOL v9;
  BOOL v10;

  v5 = (unint64_t)a3;
  v6 = (unint64_t)a4;
  v7 = (void *)v6;
  if (v5 | v6)
  {
    if (v6)
      v9 = v5 == 0;
    else
      v9 = 0;
    if (v6)
      v10 = 1;
    else
      v10 = v5 == 0;
    v8 = 1;
    if (v10 && !v9)
      v8 = (unint64_t)objc_msgSend((id)v5, "compare:", v6) > 1;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)extensionCapabilities
{
  return self->_extensionCapabilities;
}

- (FPProviderDomain)providerDomain
{
  return self->_providerDomain;
}

- (void)setLog:(id)a3
{
  objc_storeStrong((id *)&self->_log, a3);
}

- (FPSpotlightIndexer)spotlightIndexer
{
  return self->_spotlightIndexer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spotlightIndexer, 0);
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_providerDomain, 0);
  objc_storeStrong((id *)&self->_domain, 0);
  objc_storeStrong((id *)&self->_vendorInstance, 0);
  objc_destroyWeak((id *)&self->_extensionContext);
  objc_storeStrong((id *)&self->_lastKnownUserInfo, 0);
  objc_storeStrong((id *)&self->_lastKnownDomainVersion, 0);
}

- (void)domainVersion
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *a1;
  v4 = 138412546;
  v5 = v3;
  v6 = 2112;
  v7 = a2;
  _os_log_debug_impl(&dword_1A0A34000, log, OS_LOG_TYPE_DEBUG, "[DEBUG] Domain version updated from %@ to %@", (uint8_t *)&v4, 0x16u);
  OUTLINED_FUNCTION_3();
}

- (void)userInfo
{
  OUTLINED_FUNCTION_0(&dword_1A0A34000, a1, a3, "[DEBUG] Updating user info from extension in userInfo", a5, a6, a7, a8, 0);
}

@end
