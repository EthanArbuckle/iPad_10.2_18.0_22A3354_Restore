@implementation FPDClaimKnownFolderOperation

- (FPDClaimKnownFolderOperation)initWithKnownFolderLocations:(id)a3 domain:(id)a4 server:(id)a5 localizedReason:(id)a6 request:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  FPDClaimKnownFolderOperation *v16;
  FPDClaimKnownFolderOperation *v17;
  objc_super v19;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a7;
  v19.receiver = self;
  v19.super_class = (Class)FPDClaimKnownFolderOperation;
  v16 = -[FPOperation init](&v19, sel_init);
  v17 = v16;
  if (v16)
  {
    v16->_isProviderInitiated = 1;
    v16->_knownFolders = objc_msgSend(v12, "providedKnownFolders");
    objc_storeStrong((id *)&v17->_locations, a3);
    objc_storeStrong((id *)&v17->_domain, a4);
    objc_storeStrong((id *)&v17->_server, a5);
    objc_storeStrong((id *)&v17->_request, a7);
    v17->_skipSystemAlerts = 0;
  }

  return v17;
}

- (FPDClaimKnownFolderOperation)initWithKnownFolders:(unint64_t)a3 domain:(id)a4 server:(id)a5 request:(id)a6
{
  id v11;
  id v12;
  id v13;
  FPDClaimKnownFolderOperation *v14;
  FPDClaimKnownFolderOperation *v15;
  objc_super v17;

  v11 = a4;
  v12 = a5;
  v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)FPDClaimKnownFolderOperation;
  v14 = -[FPOperation init](&v17, sel_init);
  v15 = v14;
  if (v14)
  {
    v14->_isProviderInitiated = 0;
    v14->_knownFolders = a3;
    objc_storeStrong((id *)&v14->_domain, a4);
    objc_storeStrong((id *)&v15->_server, a5);
    objc_storeStrong((id *)&v15->_request, a6);
    v15->_skipSystemAlerts = 0;
  }

  return v15;
}

- (FPDClaimKnownFolderOperation)initWithDescriptors:(id)a3 server:(id)a4 request:(id)a5
{
  id v9;
  id v10;
  id v11;
  FPDClaimKnownFolderOperation *v12;
  FPDClaimKnownFolderOperation *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  id v28;
  id obj;
  id v30;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  objc_super v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v36.receiver = self;
  v36.super_class = (Class)FPDClaimKnownFolderOperation;
  v12 = -[FPOperation init](&v36, sel_init);
  v13 = v12;
  if (v12)
  {
    v28 = v11;
    obj = a4;
    v30 = v10;
    v12->_isProviderInitiated = 0;
    objc_storeStrong((id *)&v12->_descriptors, a3);
    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    v31 = v9;
    v14 = v9;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
    if (!v15)
      goto LABEL_14;
    v16 = v15;
    v17 = *(_QWORD *)v33;
    while (1)
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v33 != v17)
          objc_enumerationMutation(v14);
        v19 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
        objc_msgSend(v19, "knownFolder");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        +[FPDKnownFolderArbiter desktopURL](FPDKnownFolderArbiter, "desktopURL");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v20, "fp_relationshipToItemAtURL:", v21);

        if (v22 == 1)
        {
          v23 = 1;
        }
        else
        {
          objc_msgSend(v19, "knownFolder");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          +[FPDKnownFolderArbiter documentsURL](FPDKnownFolderArbiter, "documentsURL");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = objc_msgSend(v24, "fp_relationshipToItemAtURL:", v25);

          if (v26 != 1)
            continue;
          v23 = 2;
        }
        v13->_knownFolders |= v23;
      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
      if (!v16)
      {
LABEL_14:

        objc_storeStrong((id *)&v13->_server, obj);
        objc_storeStrong((id *)&v13->_request, a5);
        v13->_skipSystemAlerts = 0;
        v9 = v31;
        v10 = v30;
        v11 = v28;
        break;
      }
    }
  }

  return v13;
}

- (void)getKnownFolderLocationsWithCompletionHandler:(id)a3
{
  id v4;
  void (**v5)(_QWORD, _QWORD, _QWORD);
  void (*v6)(void);
  void *v7;
  char v8;
  void *v9;
  unint64_t knownFolders;
  FPDRequest *request;
  void *v12;
  _QWORD v13[5];
  void (**v14)(_QWORD, _QWORD, _QWORD);

  v4 = a3;
  v5 = (void (**)(_QWORD, _QWORD, _QWORD))v4;
  if (self->_descriptors)
  {
    v6 = (void (*)(void))*((_QWORD *)v4 + 2);
LABEL_5:
    v6();
    goto LABEL_6;
  }
  if (self->_isProviderInitiated)
  {
    v6 = (void (*)(void))*((_QWORD *)v4 + 2);
    goto LABEL_5;
  }
  -[FPDDomain defaultBackend](self->_domain, "defaultBackend");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    -[FPDDomain defaultBackend](self->_domain, "defaultBackend");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    knownFolders = self->_knownFolders;
    request = self->_request;
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __77__FPDClaimKnownFolderOperation_getKnownFolderLocationsWithCompletionHandler___block_invoke;
    v13[3] = &unk_1E8C78F30;
    v13[4] = self;
    v14 = v5;
    objc_msgSend(v9, "getKnownFolderLocations:request:completionHandler:", knownFolders, request, v13);

  }
  else
  {
    FPNotSupportedError();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, void *))v5)[2](v5, 0, v12);

  }
LABEL_6:

}

void __77__FPDClaimKnownFolderOperation_getKnownFolderLocationsWithCompletionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void (*v7)(void);
  NSObject *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  int v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = v5;
  if (a3)
  {
    v7 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
LABEL_5:
    v7();
    goto LABEL_6;
  }
  if ((*(_QWORD *)(*(_QWORD *)(a1 + 32) + 312) & ~objc_msgSend(v5, "providedKnownFolders")) == 0)
  {
    v7 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
    goto LABEL_5;
  }
  fp_current_or_default_log();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    v11 = *(_QWORD *)(a1 + 32);
    v12 = *(_QWORD *)(v11 + 312);
    v13 = 138412802;
    v14 = v11;
    v15 = 1024;
    v16 = v12;
    v17 = 2114;
    v18 = v6;
    _os_log_error_impl(&dword_1CF55F000, v8, OS_LOG_TYPE_ERROR, "[ERROR] %@: we asked for locations for %x, got %{public}@", (uint8_t *)&v13, 0x1Cu);
  }

  v9 = *(_QWORD *)(a1 + 40);
  FPNotSupportedError();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, void *))(v9 + 16))(v9, 0, v10);

LABEL_6:
}

- (void)resolveKnownFolder:(id)a3 location:(id)a4 options:(unint64_t)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  const __CFString *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  const __CFString *v34;
  void *v35;
  void *v36;
  FPDRequest *request;
  FPDClaimKnownFolderOperation *v38;
  unint64_t v39;
  _QWORD v40[4];
  id v41;
  id v42;
  id v43;
  id v44;
  unint64_t v45;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  objc_msgSend(v11, "asExistingLocation");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (!v13)
  {
    v39 = a5;
    v19 = 0;
    goto LABEL_9;
  }
  objc_msgSend(v13, "itemIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "isEqualToString:", *MEMORY[0x1E0CAABA0]);

  if (!v16)
  {
    objc_msgSend(v14, "itemIdentifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "isEqualToString:", *MEMORY[0x1E0CAABD0]);

    if (v21)
    {
      v17 = (void *)MEMORY[0x1E0CB35C8];
      v18 = CFSTR("the trash item cannot be used as the location of a known folder");
      goto LABEL_7;
    }
    v39 = a5;
    v23 = objc_alloc(MEMORY[0x1E0CAAC70]);
    -[FPDDomain identifier](self->_domain, "identifier");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "itemIdentifier");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_msgSend(v23, "initWithProviderDomainID:itemIdentifier:", v24, v25);

LABEL_9:
    objc_msgSend(v11, "asPathMatchingLocation");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = self;
    if (v26)
    {
      v27 = objc_alloc(MEMORY[0x1E0CAAC70]);
      -[FPDDomain identifier](self->_domain, "identifier");
      v28 = v10;
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "parentItemIdentifier");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_msgSend(v27, "initWithProviderDomainID:itemIdentifier:", v29, v30);

      v10 = v28;
      objc_msgSend(v26, "filename");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (void *)v31;
      if (v31)
        goto LABEL_11;
    }
    else
    {
      v32 = 0;
      if (v19)
      {
LABEL_11:
        if ((objc_msgSend(v32, "containsString:", CFSTR("/")) & 1) == 0
          && (objc_msgSend(v32, "isEqualToString:", CFSTR(".")) & 1) == 0
          && !objc_msgSend(v32, "isEqualToString:", CFSTR("..")))
        {
          -[FPDDomain defaultBackend](v38->_domain, "defaultBackend");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          request = v38->_request;
          v40[0] = MEMORY[0x1E0C809B0];
          v40[1] = 3221225472;
          v40[2] = __86__FPDClaimKnownFolderOperation_resolveKnownFolder_location_options_completionHandler___block_invoke;
          v40[3] = &unk_1E8C78F58;
          v44 = v12;
          v41 = v19;
          v42 = v32;
          v43 = v10;
          v45 = v39;
          objc_msgSend(v36, "itemForItemID:creatingPlaceholderIfMissing:ignoreAlternateContentsURL:request:completionHandler:", v41, 1, 1, request, v40);

          goto LABEL_18;
        }
        v33 = (void *)MEMORY[0x1E0CB35C8];
        v34 = CFSTR("invalid folder name");
LABEL_17:
        objc_msgSend(v33, "fp_invalidArgumentError:", v34);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        (*((void (**)(id, _QWORD, void *))v12 + 2))(v12, 0, v35);

LABEL_18:
        goto LABEL_19;
      }
    }
    v33 = (void *)MEMORY[0x1E0CB35C8];
    v34 = CFSTR("invalid known folder location");
    goto LABEL_17;
  }
  v17 = (void *)MEMORY[0x1E0CB35C8];
  v18 = CFSTR("the root item cannot be used as the location of a known folder");
LABEL_7:
  objc_msgSend(v17, "fp_invalidArgumentError:", v18);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, _QWORD, void *))v12 + 2))(v12, 0, v22);

LABEL_19:
}

void __86__FPDClaimKnownFolderOperation_resolveKnownFolder_location_options_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  int v21;
  mode_t st_mode;
  uint64_t v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  stat v32;

  v5 = a2;
  v6 = v5;
  if (a3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
  else
  {
    objc_msgSend(v5, "fileURL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      if ((objc_msgSend(v6, "isFolder") & 1) != 0)
      {
        objc_msgSend(v6, "detachedRootLogicalURL");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v8;
        if (v8)
        {
          v10 = v8;
        }
        else
        {
          objc_msgSend(v6, "fileURL");
          v10 = (id)objc_claimAutoreleasedReturnValue();
        }
        v16 = v10;

        v17 = *(_QWORD *)(a1 + 40);
        if (v17)
        {
          objc_msgSend(v16, "URLByAppendingPathComponent:isDirectory:", v17, 1);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v6, "fileURL");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "URLByAppendingPathComponent:isDirectory:", *(_QWORD *)(a1 + 40), 1);
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v19, "path", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0);
          v20 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          v21 = lstat((const char *)objc_msgSend(v20, "fileSystemRepresentation"), &v32);
          st_mode = v32.st_mode;

          if (v21 < 0 || (st_mode & 0xF000) == 0x4000)
          {
            v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CAAD10]), "initWithKnownFolder:logicalLocation:detachOptions:", *(_QWORD *)(a1 + 48), v15, *(_QWORD *)(a1 + 64));
            v29 = objc_alloc(MEMORY[0x1E0CAAD18]);
            objc_msgSend(v6, "itemIdentifier");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            v31 = (void *)objc_msgSend(v29, "initWithParentItemIdentifier:filename:", v30, *(_QWORD *)(a1 + 40));
            objc_msgSend(v25, "setLocation:", v31);

            (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
          }
          else
          {
            v23 = *(_QWORD *)(a1 + 56);
            objc_msgSend(MEMORY[0x1E0CB35C8], "fp_invalidArgumentError:", CFSTR("resolved item location is not a directory"));
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            (*(void (**)(uint64_t, _QWORD, void *))(v23 + 16))(v23, 0, v24);

            v25 = 0;
          }

        }
        else
        {
          v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CAAD10]), "initWithKnownFolder:logicalLocation:detachOptions:", *(_QWORD *)(a1 + 48), v16, *(_QWORD *)(a1 + 64));
          v26 = objc_alloc(MEMORY[0x1E0CAAD18]);
          objc_msgSend(v6, "itemIdentifier");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = (void *)objc_msgSend(v26, "initWithExistingItemIdentifier:", v27);
          objc_msgSend(v25, "setLocation:", v28);

          (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
          v15 = v16;
        }

      }
      else
      {
        v14 = *(_QWORD *)(a1 + 56);
        objc_msgSend(MEMORY[0x1E0CB35C8], "fp_invalidArgumentError:", CFSTR("resolved item location is not a directory"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, _QWORD, void *))(v14 + 16))(v14, 0, v15);
      }

    }
    else
    {
      v11 = *(_QWORD *)(a1 + 56);
      objc_msgSend(*(id *)(a1 + 32), "identifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      FPItemNotFoundError();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v11 + 16))(v11, 0, v13);

    }
  }

}

- (void)resolveLogicalURLsOfLocations:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSArray *descriptors;
  NSObject *v10;
  void *v11;
  unsigned int v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  id v20;
  NSObject *v21;
  _QWORD v22[4];
  NSObject *v23;
  FPDClaimKnownFolderOperation *v24;
  id v25;
  id v26;
  _QWORD *v27;
  _QWORD v28[4];
  NSObject *v29;
  id v30;
  _QWORD *v31;
  _QWORD v32[4];
  NSObject *v33;
  id v34;
  _QWORD *v35;
  _QWORD v36[5];
  id v37;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  descriptors = self->_descriptors;
  if (descriptors)
  {
    (*((void (**)(id, NSArray *, _QWORD))v7 + 2))(v7, descriptors, 0);
  }
  else
  {
    v10 = dispatch_group_create();
    v36[0] = 0;
    v36[1] = v36;
    v36[2] = 0x3032000000;
    v36[3] = __Block_byref_object_copy__17;
    v36[4] = __Block_byref_object_dispose__17;
    v37 = 0;
    v11 = (void *)objc_opt_new();
    v12 = objc_msgSend(v6, "shouldCreateBinaryCompatibilitySymlink");
    objc_msgSend(v6, "desktopLocation");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      dispatch_group_enter(v10);
      +[FPDKnownFolderArbiter desktopURL](FPDKnownFolderArbiter, "desktopURL");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "desktopLocation");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v32[0] = MEMORY[0x1E0C809B0];
      v32[1] = 3221225472;
      v32[2] = __80__FPDClaimKnownFolderOperation_resolveLogicalURLsOfLocations_completionHandler___block_invoke;
      v32[3] = &unk_1E8C78F80;
      v33 = v10;
      v35 = v36;
      v34 = v11;
      -[FPDClaimKnownFolderOperation resolveKnownFolder:location:options:completionHandler:](self, "resolveKnownFolder:location:options:completionHandler:", v14, v15, v12, v32);

    }
    objc_msgSend(v6, "documentsLocation");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      dispatch_group_enter(v10);
      +[FPDKnownFolderArbiter documentsURL](FPDKnownFolderArbiter, "documentsURL");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "documentsLocation");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v28[0] = MEMORY[0x1E0C809B0];
      v28[1] = 3221225472;
      v28[2] = __80__FPDClaimKnownFolderOperation_resolveLogicalURLsOfLocations_completionHandler___block_invoke_2;
      v28[3] = &unk_1E8C78F80;
      v29 = v10;
      v31 = v36;
      v30 = v11;
      -[FPDClaimKnownFolderOperation resolveKnownFolder:location:options:completionHandler:](self, "resolveKnownFolder:location:options:completionHandler:", v17, v18, v12, v28);

    }
    -[FPOperation callbackQueue](self, "callbackQueue");
    v19 = objc_claimAutoreleasedReturnValue();
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __80__FPDClaimKnownFolderOperation_resolveLogicalURLsOfLocations_completionHandler___block_invoke_3;
    v22[3] = &unk_1E8C78FA8;
    v23 = v10;
    v27 = v36;
    v25 = v11;
    v26 = v8;
    v24 = self;
    v20 = v11;
    v21 = v10;
    dispatch_group_notify(v21, v19, v22);

    _Block_object_dispose(v36, 8);
  }

}

void __80__FPDClaimKnownFolderOperation_resolveLogicalURLsOfLocations_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  id *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a2;
  v5 = a3;
  v6 = *(id *)(a1 + 32);
  objc_sync_enter(v6);
  if (v5)
  {
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v10 = *(void **)(v7 + 40);
    v8 = (id *)(v7 + 40);
    v9 = v10;
    if (v10)
      v11 = v9;
    else
      v11 = v5;
    objc_storeStrong(v8, v11);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v12);
  }
  objc_sync_exit(v6);

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __80__FPDClaimKnownFolderOperation_resolveLogicalURLsOfLocations_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  id *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a2;
  v5 = a3;
  v6 = *(id *)(a1 + 32);
  objc_sync_enter(v6);
  if (v5)
  {
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v10 = *(void **)(v7 + 40);
    v8 = (id *)(v7 + 40);
    v9 = v10;
    if (v10)
      v11 = v9;
    else
      v11 = v5;
    objc_storeStrong(v8, v11);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v12);
  }
  objc_sync_exit(v6);

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __80__FPDClaimKnownFolderOperation_resolveLogicalURLsOfLocations_completionHandler___block_invoke_3(uint64_t a1)
{
  __int128 v2;
  unint64_t v3;
  void *v4;
  void *v5;
  id v6;
  BOOL v7;
  int v8;
  id v9;
  id v10;
  unint64_t i;
  void *v12;
  void *v13;
  void *v14;
  BOOL v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  BOOL v20;
  BOOL v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  __int128 v27;
  id obj;
  stat v29;
  stat v30;
  stat v31;
  uint8_t buf[4];
  unint64_t v33;
  __int16 v34;
  uint64_t v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  obj = *(id *)(a1 + 32);
  objc_sync_enter(obj);
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40))
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    goto LABEL_31;
  }
  v3 = 0;
  *(_BYTE *)(*(_QWORD *)(a1 + 40) + 368) = 1;
  *(_QWORD *)&v2 = 134218240;
  v27 = v2;
LABEL_4:
  if (v3 >= objc_msgSend(*(id *)(a1 + 48), "count", v27))
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    goto LABEL_31;
  }
  objc_msgSend(*(id *)(a1 + 48), "objectAtIndexedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (*(_BYTE *)(*(_QWORD *)(a1 + 40) + 368))
  {
    memset(&v31, 0, sizeof(v31));
    objc_msgSend(v4, "knownFolder");
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    if (lstat((const char *)objc_msgSend(v6, "fileSystemRepresentation"), &v31))
      v7 = 0;
    else
      v7 = (v31.st_mode & 0xF000) == 40960;
    v8 = v7;

    if (!v8)
      goto LABEL_17;
    memset(&v30, 0, sizeof(v30));
    memset(&v29, 0, sizeof(v29));
    objc_msgSend(v5, "knownFolder");
    v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    if (stat((const char *)objc_msgSend(v9, "fileSystemRepresentation"), &v29))
      goto LABEL_16;
    objc_msgSend(v5, "logicalLocation");
    v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    if (stat((const char *)objc_msgSend(v10, "fileSystemRepresentation"), &v30))
    {

LABEL_16:
LABEL_17:
      *(_BYTE *)(*(_QWORD *)(a1 + 40) + 368) = 0;
      goto LABEL_18;
    }
    v21 = v29.st_ino == v30.st_ino;

    if (v21)
      goto LABEL_17;
    fp_current_or_default_log();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    {
      v23 = objc_msgSend(*(id *)(a1 + 48), "count");
      *(_DWORD *)buf = v27;
      v33 = v3;
      v34 = 2048;
      v35 = v23;
      _os_log_debug_impl(&dword_1CF55F000, v22, OS_LOG_TYPE_DEBUG, "[DEBUG] known folder %lu out of %lu is a symlink to the logical location", buf, 0x16u);
    }

  }
LABEL_18:
  for (i = ++v3; ; ++i)
  {
    if (i >= objc_msgSend(*(id *)(a1 + 48), "count"))
    {

      goto LABEL_4;
    }
    objc_msgSend(*(id *)(a1 + 48), "objectAtIndexedSubscript:", i);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "logicalLocation");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "logicalLocation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v13, "fp_relationshipToItemAtURL:", v14) == 2;

    if (!v15)
    {
      v24 = *(_QWORD *)(a1 + 56);
      objc_msgSend(MEMORY[0x1E0CB35C8], "fp_invalidArgumentError:", CFSTR("claimed locations are related to each other"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v24 + 16))(v24, 0, v25);
      goto LABEL_30;
    }
    objc_msgSend(v5, "logicalLocation");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "URLByDeletingLastPathComponent");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "logicalLocation");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "URLByDeletingLastPathComponent");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v17, "fp_relationshipToItemAtURL:", v19) == 1;

    if (!v20)
      break;

  }
  v26 = *(_QWORD *)(a1 + 56);
  objc_msgSend(MEMORY[0x1E0CB35C8], "fp_invalidArgumentError:", CFSTR("claimed locations should have the same parent directory"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, void *))(v26 + 16))(v26, 0, v25);
LABEL_30:

LABEL_31:
  objc_sync_exit(obj);

}

- (void)notifyUserWithCompletionHandler:(id)a3
{
  id v4;
  void (**v5)(_QWORD, _QWORD);
  NSObject *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v4 = a3;
  v5 = (void (**)(_QWORD, _QWORD))v4;
  if (self->_isProviderInitiated && !self->_skipSystemAlerts)
  {
    fp_current_or_default_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      -[FPDClaimKnownFolderOperation notifyUserWithCompletionHandler:].cold.3();

    if (os_variant_has_internal_content())
    {
      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.fileproviderd"));
      objc_msgSend(v7, "stringForKey:", CFSTR("forceClaimPromptResult"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v8, "isEqualToString:", CFSTR("approve")))
      {
        fp_current_or_default_log();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
          -[FPDClaimKnownFolderOperation notifyUserWithCompletionHandler:].cold.1();

        objc_msgSend(MEMORY[0x1E0C99D68], "now");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "timeIntervalSince1970");
        objc_msgSend(v7, "setDouble:forKey:", CFSTR("forceClaimPromptLastInterception"));

        goto LABEL_17;
      }
      if (objc_msgSend(v8, "isEqualToString:", CFSTR("decline")))
      {
        fp_current_or_default_log();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
          -[FPDClaimKnownFolderOperation notifyUserWithCompletionHandler:].cold.2();

        objc_msgSend(MEMORY[0x1E0C99D68], "now");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "timeIntervalSince1970");
        objc_msgSend(v7, "setDouble:forKey:", CFSTR("forceClaimPromptLastInterception"));

        goto LABEL_18;
      }

    }
    -[FPDDomain provider](self->_domain, "provider");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "providerDomainForDomain:", self->_domain);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[FPDDomain provider](self->_domain, "provider");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setShouldHideDomainDisplayName:", objc_msgSend(v14, "shouldHideDomainDisplayName"));

    v8 = (void *)objc_msgSend((id)objc_opt_new(), "initWithProviderDomain:", v7);
    if ((objc_msgSend(v8, "presentAlertWithUserAprovalToContinue") & 1) != 0)
    {
LABEL_17:
      v5[2](v5, 0);
LABEL_19:

      goto LABEL_20;
    }
LABEL_18:
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 3072, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v5)[2](v5, v15);

    goto LABEL_19;
  }
  (*((void (**)(id, _QWORD))v4 + 2))(v4, 0);
LABEL_20:

}

- (void)attachClaimedKnownFoldersWithCompletionHandler:(id)a3
{
  id v4;
  NSArray *descriptors;
  void *v6;
  FPDAttachKnownFolderOperation *v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  descriptors = self->_descriptors;
  if (descriptors)
  {
    -[NSArray fp_map:](descriptors, "fp_map:", &__block_literal_global_24);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[FPDAttachKnownFolderOperation initWithKnownFolderURLs:onlyForDomain:server:options:request:]([FPDAttachKnownFolderOperation alloc], "initWithKnownFolderURLs:onlyForDomain:server:options:request:", v6, 0, self->_server, 2, self->_request);

  }
  else
  {
    v7 = -[FPDAttachKnownFolderOperation initWithKnownFolders:onlyForDomain:server:options:request:]([FPDAttachKnownFolderOperation alloc], "initWithKnownFolders:onlyForDomain:server:options:request:", self->_knownFolders, 0, self->_server, 2, self->_request);
  }
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __79__FPDClaimKnownFolderOperation_attachClaimedKnownFoldersWithCompletionHandler___block_invoke_2;
  v9[3] = &unk_1E8C78FF0;
  v10 = v4;
  v8 = v4;
  -[FPOperation setFinishedBlock:](v7, "setFinishedBlock:", v9);
  -[FPOperation start](v7, "start");

}

uint64_t __79__FPDClaimKnownFolderOperation_attachClaimedKnownFoldersWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "knownFolder");
}

uint64_t __79__FPDClaimKnownFolderOperation_attachClaimedKnownFoldersWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)detachKnownFolders:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  FPDDetachKnownFolderOperation *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  v7 = a3;
  v8 = -[FPDDetachKnownFolderOperation initWithKnownFolder:server:request:]([FPDDetachKnownFolderOperation alloc], "initWithKnownFolder:server:request:", v7, self->_server, self->_request);

  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __69__FPDClaimKnownFolderOperation_detachKnownFolders_completionHandler___block_invoke;
  v10[3] = &unk_1E8C78FF0;
  v11 = v6;
  v9 = v6;
  -[FPOperation setFinishedBlock:](v8, "setFinishedBlock:", v10);
  -[FPOperation start](v8, "start");

}

uint64_t __69__FPDClaimKnownFolderOperation_detachKnownFolders_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)main
{
  FPDDomain *domain;
  void *v4;
  int v5;
  FPDDomain *v6;
  void *v7;
  unint64_t v8;
  NSObject *v9;
  unint64_t knownFolders;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  unint64_t v24;
  NSObject *v25;
  void *v26;
  void *v27;
  unint64_t v28;
  NSObject *v29;
  void *v30;
  _QWORD v31[5];
  uint8_t buf[4];
  FPDClaimKnownFolderOperation *v33;
  __int16 v34;
  _BYTE v35[14];
  uint64_t v36;
  _QWORD v37[2];

  v37[1] = *MEMORY[0x1E0C80C00];
  domain = self->_domain;
  if (!domain)
    goto LABEL_22;
  -[FPDDomain volume](domain, "volume");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "role");

  if (v5 != 1)
  {
    fp_current_or_default_log();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      -[FPDDomain identifier](self->_domain, "identifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "fp_obfuscatedProviderDomainID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v33 = self;
      v34 = 2114;
      *(_QWORD *)v35 = v16;
      _os_log_impl(&dword_1CF55F000, v14, OS_LOG_TYPE_DEFAULT, "[NOTICE] %@: %{public}@ is not on the home volume", buf, 0x16u);

    }
    -[FPDDomain provider](self->_domain, "provider");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "providerDomainForDomain:", self->_domain);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v13, "isiCloudDriveProvider"))
    {
      FPLoc();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v13, "domainFullDisplayName");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      FPLoc();
      v18 = (void *)objc_claimAutoreleasedReturnValue();

    }
    v19 = (void *)MEMORY[0x1E0CB35C8];
    v20 = *MEMORY[0x1E0CB2FE0];
    v36 = *MEMORY[0x1E0CB2D50];
    v37[0] = v18;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v37, &v36, 1, v30);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "errorWithDomain:code:userInfo:", v20, 18, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[FPOperation finishWithResult:error:](self, "finishWithResult:error:", 0, v22);

    goto LABEL_15;
  }
  v6 = self->_domain;
  if (self->_isProviderInitiated)
  {
    if (v6)
      goto LABEL_5;
    goto LABEL_22;
  }
  if (!v6)
    goto LABEL_22;
  -[FPDDomain nsDomain](v6, "nsDomain");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = self->_knownFolders & ~objc_msgSend(v23, "replicatedKnownFolders");

  if (v24)
  {
    v6 = self->_domain;
    if (v6)
    {
LABEL_5:
      -[FPDDomain nsDomain](v6, "nsDomain");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = self->_knownFolders & ~objc_msgSend(v7, "supportedKnownFolders");

      if (v8)
      {
        fp_current_or_default_log();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          knownFolders = self->_knownFolders;
          -[FPDDomain identifier](self->_domain, "identifier");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "fp_obfuscatedProviderDomainID");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v33 = self;
          v34 = 1024;
          *(_DWORD *)v35 = knownFolders;
          *(_WORD *)&v35[4] = 2114;
          *(_QWORD *)&v35[6] = v12;
          _os_log_impl(&dword_1CF55F000, v9, OS_LOG_TYPE_DEFAULT, "[NOTICE] %@: attempting to switch %x to %{public}@ that doesn't support those folders", buf, 0x1Cu);

        }
        FPNotSupportedError();
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[FPOperation finishWithResult:error:](self, "finishWithResult:error:", 0, v13);
LABEL_15:

        return;
      }
    }
LABEL_22:
    fp_current_or_default_log();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v33 = self;
      _os_log_impl(&dword_1CF55F000, v29, OS_LOG_TYPE_DEFAULT, "[NOTICE] %@: resolving locations", buf, 0xCu);
    }

    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = __36__FPDClaimKnownFolderOperation_main__block_invoke;
    v31[3] = &unk_1E8C79018;
    v31[4] = self;
    -[FPDClaimKnownFolderOperation getKnownFolderLocationsWithCompletionHandler:](self, "getKnownFolderLocationsWithCompletionHandler:", v31);
    return;
  }
  fp_current_or_default_log();
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    -[FPDDomain identifier](self->_domain, "identifier");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "fp_obfuscatedProviderDomainID");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = self->_knownFolders;
    *(_DWORD *)buf = 138412802;
    v33 = self;
    v34 = 2114;
    *(_QWORD *)v35 = v27;
    *(_WORD *)&v35[8] = 1024;
    *(_DWORD *)&v35[10] = v28;
    _os_log_impl(&dword_1CF55F000, v25, OS_LOG_TYPE_DEFAULT, "[NOTICE] %@: %{public}@ is already syncing the requested folders %x", buf, 0x1Cu);

  }
  -[FPOperation finishWithResult:error:](self, "finishWithResult:error:", 0, 0);
}

void __36__FPDClaimKnownFolderOperation_main__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[5];
  uint8_t buf[4];
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (a3)
  {
    objc_msgSend(*(id *)(a1 + 32), "completedWithResult:error:", 0, a3);
  }
  else
  {
    fp_current_or_default_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      v11 = v7;
      _os_log_impl(&dword_1CF55F000, v6, OS_LOG_TYPE_DEFAULT, "[NOTICE] %@: resolving logical URLs", buf, 0xCu);
    }

    v8 = *(void **)(a1 + 32);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __36__FPDClaimKnownFolderOperation_main__block_invoke_93;
    v9[3] = &unk_1E8C787A8;
    v9[4] = v8;
    objc_msgSend(v8, "resolveLogicalURLsOfLocations:completionHandler:", v5, v9);
  }

}

void __36__FPDClaimKnownFolderOperation_main__block_invoke_93(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[5];
  id v11;
  uint8_t buf[4];
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6 || objc_msgSend(*(id *)(a1 + 32), "isCancelled"))
  {
    objc_msgSend(*(id *)(a1 + 32), "completedWithResult:error:", 0, v6);
  }
  else
  {
    fp_current_or_default_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      v13 = v8;
      _os_log_impl(&dword_1CF55F000, v7, OS_LOG_TYPE_DEFAULT, "[NOTICE] %@: notify user", buf, 0xCu);
    }

    v9 = *(void **)(a1 + 32);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __36__FPDClaimKnownFolderOperation_main__block_invoke_94;
    v10[3] = &unk_1E8C75AC0;
    v10[4] = v9;
    v11 = v5;
    objc_msgSend(v9, "notifyUserWithCompletionHandler:", v10);

  }
}

void __36__FPDClaimKnownFolderOperation_main__block_invoke_94(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  id v9;
  uint8_t buf[4];
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3 || objc_msgSend(*(id *)(a1 + 32), "isCancelled"))
  {
    objc_msgSend(*(id *)(a1 + 32), "completedWithResult:error:", 0, v3);
  }
  else
  {
    fp_current_or_default_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      v11 = v5;
      _os_log_impl(&dword_1CF55F000, v4, OS_LOG_TYPE_DEFAULT, "[NOTICE] %@: attach folders", buf, 0xCu);
    }

    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __36__FPDClaimKnownFolderOperation_main__block_invoke_95;
    v7[3] = &unk_1E8C75AC0;
    v6 = *(void **)(a1 + 40);
    v8 = *(id *)(a1 + 32);
    v9 = v6;
    objc_msgSend(v8, "attachClaimedKnownFoldersWithCompletionHandler:", v7);

  }
}

void __36__FPDClaimKnownFolderOperation_main__block_invoke_95(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  _QWORD v8[5];
  uint8_t buf[4];
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3 || objc_msgSend(*(id *)(a1 + 32), "isCancelled"))
  {
    objc_msgSend(*(id *)(a1 + 32), "completedWithResult:error:", 0, v3);
  }
  else
  {
    fp_current_or_default_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      v10 = v5;
      _os_log_impl(&dword_1CF55F000, v4, OS_LOG_TYPE_DEFAULT, "[NOTICE] %@: detach folders", buf, 0xCu);
    }

    v6 = *(void **)(a1 + 32);
    v7 = *(_QWORD *)(a1 + 40);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __36__FPDClaimKnownFolderOperation_main__block_invoke_96;
    v8[3] = &unk_1E8C753A8;
    v8[4] = v6;
    objc_msgSend(v6, "detachKnownFolders:completionHandler:", v7, v8);
  }

}

uint64_t __36__FPDClaimKnownFolderOperation_main__block_invoke_96(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "completedWithResult:error:", 0, a2);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_localizedReason, 0);
  objc_storeStrong((id *)&self->_server, 0);
  objc_storeStrong((id *)&self->_domain, 0);
  objc_storeStrong((id *)&self->_descriptors, 0);
  objc_storeStrong((id *)&self->_locations, 0);
}

- (void)notifyUserWithCompletionHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_0(&dword_1CF55F000, v0, v1, "[DEBUG] 🖥️  forcing approval of claim", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)notifyUserWithCompletionHandler:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_0(&dword_1CF55F000, v0, v1, "[DEBUG] 🖥️  forcing decline of claim", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)notifyUserWithCompletionHandler:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_0(&dword_1CF55F000, v0, v1, "[DEBUG] 🖥️  asking the user whether we should allow claim", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

@end
