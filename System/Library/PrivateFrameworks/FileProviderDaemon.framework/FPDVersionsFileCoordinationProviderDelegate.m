@implementation FPDVersionsFileCoordinationProviderDelegate

- (FPDVersionsFileCoordinationProviderDelegate)initWithExtensionManager:(id)a3
{
  id v5;
  FPDVersionsFileCoordinationProviderDelegate *v6;
  FPDVersionsFileCoordinationProviderDelegate *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FPDVersionsFileCoordinationProviderDelegate;
  v6 = -[FPDVersionsFileCoordinationProviderDelegate init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_extensionManager, a3);

  return v7;
}

- (id)_fileReactorID
{
  return CFSTR("com.apple.fileproviderd.versions");
}

- (id)_providedItemsOperationQueue
{
  if (_providedItemsOperationQueue_onceToken != -1)
    dispatch_once(&_providedItemsOperationQueue_onceToken, &__block_literal_global_5);
  return (id)_providedItemsOperationQueue_operationQueue;
}

uint64_t __75__FPDVersionsFileCoordinationProviderDelegate__providedItemsOperationQueue__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)_providedItemsOperationQueue_operationQueue;
  _providedItemsOperationQueue_operationQueue = v0;

  objc_msgSend((id)_providedItemsOperationQueue_operationQueue, "setMaxConcurrentOperationCount:", 1);
  return objc_msgSend((id)_providedItemsOperationQueue_operationQueue, "setName:", CFSTR("com.apple.FileProvider.Versions"));
}

- (id)_physicalURLForURL:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  FPDVersionsFileCoordinationProviderDelegate *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  NSObject *v28;
  NSObject *v29;
  id v31;
  id v32;
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  id v38;
  id v39;
  id v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  fp_current_or_default_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[FPDVersionsFileCoordinationProviderDelegate _physicalURLForURL:].cold.3();

  v39 = 0;
  v40 = 0;
  v38 = 0;
  v6 = (id)objc_msgSend(MEMORY[0x1E0CAAC48], "parseInfoFromVersionURL:domainIdentifier:fpItemIdentifier:etag:", v4, &v40, &v39, &v38);
  v7 = v40;
  v8 = v39;
  v9 = v38;
  v10 = v9;
  if (v7 && v8)
  {
    v32 = v9;
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    v11 = self;
    -[FPDExtensionManager providerDomainsByID](self->_extensionManager, "providerDomainsByID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "allKeys");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v34, v41, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v35;
LABEL_7:
      v17 = 0;
      while (1)
      {
        if (*(_QWORD *)v35 != v16)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * v17);
        objc_msgSend(v18, "fp_toDomainIdentifier");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v19, "isEqualToString:", v7) & 1) != 0)
          break;

        if (v15 == ++v17)
        {
          v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v34, v41, 16);
          if (v15)
            goto LABEL_7;
          goto LABEL_13;
        }
      }
      -[FPDExtensionManager domainWithID:reason:](v11->_extensionManager, "domainWithID:reason:", v18, 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v21)
        goto LABEL_19;
      objc_msgSend(v21, "versionsCache");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v32;
      objc_msgSend(v22, "objectForKey:", v32);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      if (v23)
      {
        objc_msgSend(MEMORY[0x1E0D25D48], "manager");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "originalURL");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = 0;
        objc_msgSend(v24, "permanentStorageForItemAtURL:allocateIfNone:error:", v25, 1, &v33);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = v33;

        if (v26)
        {
          objc_msgSend(v23, "physicalURL");
          v27 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          fp_current_or_default_log();
          v29 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
            -[FPDVersionsFileCoordinationProviderDelegate _physicalURLForURL:].cold.2();

          v27 = v4;
        }
        v20 = v27;

      }
      else
      {
        fp_current_or_default_log();
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
          -[FPDVersionsFileCoordinationProviderDelegate _physicalURLForURL:].cold.1();

        v20 = v4;
      }

    }
    else
    {
LABEL_13:

LABEL_19:
      v20 = v4;
      v10 = v32;
    }
  }
  else
  {
    v20 = v4;
  }

  return v20;
}

- (id)_siblingDelegateForURL:(id)a3
{
  return 0;
}

- (void)_provideItemAtURL:(id)a3 withInfo:(id)a4 completionHandler:(id)a5
{
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  id v31;
  void *v32;
  void *v33;
  id v35;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  id v41;
  _QWORD v42[4];
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;
  FPDVersionsFileCoordinationProviderDelegate *v51;
  id v52;
  SEL v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  id v58;
  id v59;
  id v60;
  uint64_t section;
  _BYTE v62[32];
  uint8_t v63[128];
  uint8_t buf[4];
  uint64_t v65;
  __int16 v66;
  FPDVersionsFileCoordinationProviderDelegate *v67;
  __int16 v68;
  void *v69;
  __int16 v70;
  void *v71;
  __int16 v72;
  void *v73;
  uint64_t v74;

  v74 = *MEMORY[0x1E0C80C00];
  v41 = a3;
  v7 = a4;
  v39 = a5;
  objc_msgSend(v7, "readerID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3600], "_processIdentifierForID:", v8);
  if (v8)
    v9 = objc_msgSend(MEMORY[0x1E0CB3600], "_processIdentifierForID:", v8);
  else
    v9 = 0;
  if (v7)
    objc_msgSend(v7, "readerAuditToken");
  else
    memset(v62, 0, sizeof(v62));
  objc_msgSend(v7, "kernelMaterializationInfo");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "fileMaterializationInfo");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[FPDRequest requestForPID:auditToken:fromPOSIX:kernelFileInfo:](FPDRequest, "requestForPID:auditToken:fromPOSIX:kernelFileInfo:", v9, v62, 0, v11);
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  if (v40)
  {
    v12 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v40, "processName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringWithFormat:", CFSTR("%@ (on behalf of %@)"), 0, v13);
    v38 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v38 = 0;
  }
  section = __fp_create_section();
  fp_current_or_default_log();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v41, "fp_shortDescription");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134219010;
    v65 = section;
    v66 = 2112;
    v67 = self;
    v68 = 2112;
    v69 = v15;
    v70 = 2112;
    v71 = v38;
    v72 = 2114;
    v73 = v8;
    _os_log_impl(&dword_1CF55F000, v14, OS_LOG_TYPE_DEFAULT, "[NOTICE] ┏%llx ⭕️ NSFileCoordinator requested %@ to provide item version at %@ (consumer: %@, readerID: %{public}@)", buf, 0x34u);

  }
  v59 = 0;
  v60 = 0;
  v58 = 0;
  objc_msgSend(MEMORY[0x1E0CAAC48], "parseInfoFromVersionURL:domainIdentifier:fpItemIdentifier:etag:", v41, &v60, &v59, &v58);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v60;
  v17 = v59;
  v35 = v58;
  if (v16 && v17)
  {
    v56 = 0u;
    v57 = 0u;
    v55 = 0u;
    v54 = 0u;
    -[FPDExtensionManager providerDomainsByID](self->_extensionManager, "providerDomainsByID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "allKeys");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v54, v63, 16);
    if (v20)
    {
      v21 = *(_QWORD *)v55;
LABEL_16:
      v22 = 0;
      while (1)
      {
        if (*(_QWORD *)v55 != v21)
          objc_enumerationMutation(v19);
        v23 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * v22);
        objc_msgSend(v23, "fp_toDomainIdentifier");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v24, "isEqualToString:", v16))
          break;

        if (v20 == ++v22)
        {
          v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v54, v63, 16);
          if (v20)
            goto LABEL_16;
          goto LABEL_22;
        }
      }
      -[FPDExtensionManager domainWithID:reason:](self->_extensionManager, "domainWithID:reason:", v23, 0);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v27)
        goto LABEL_28;
      v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CAAC70]), "initWithProviderDomainID:itemIdentifier:", v16, v17);
      objc_msgSend(v27, "defaultBackend");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v42[0] = MEMORY[0x1E0C809B0];
      v42[1] = 3221225472;
      v42[2] = __92__FPDVersionsFileCoordinationProviderDelegate__provideItemAtURL_withInfo_completionHandler___block_invoke;
      v42[3] = &unk_1E8C76260;
      v43 = v41;
      v44 = v38;
      v45 = v8;
      v52 = v39;
      v30 = v27;
      v46 = v30;
      v31 = v28;
      v47 = v31;
      v48 = v35;
      v49 = v40;
      v53 = a2;
      v50 = v17;
      v51 = self;
      objc_msgSend(v29, "URLForItemID:creatingPlaceholderIfMissing:ignoreAlternateContentsURL:forBookmarkResolution:request:completionHandler:", v31, 1, 1, 0, v49, v42);

    }
    else
    {
LABEL_22:

LABEL_28:
      v32 = (void *)MEMORY[0x1E0CB3640];
      FPProviderNotFoundErrorForURL();
      v30 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "responseWithError:", v30);
      v31 = (id)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, id))v39 + 2))(v39, v31);
    }

  }
  else
  {
    if (objc_msgSend(v37, "isEqual:", *MEMORY[0x1E0D25D30]))
    {
      fp_current_or_default_log();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(v41, "fp_shortDescription");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        -[FPDVersionsFileCoordinationProviderDelegate _provideItemAtURL:withInfo:completionHandler:].cold.1(v26, (uint64_t)v8, (uint64_t)buf);
      }
    }
    else
    {
      fp_current_or_default_log();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(v41, "fp_shortDescription");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        -[FPDVersionsFileCoordinationProviderDelegate _provideItemAtURL:withInfo:completionHandler:].cold.2(v33, (uint64_t)v8, (uint64_t)buf);
      }
    }

    objc_msgSend(MEMORY[0x1E0CB3640], "responseWithError:", 0);
    v30 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, id))v39 + 2))(v39, v30);
  }

  __fp_leave_section_Notice();
}

void __92__FPDVersionsFileCoordinationProviderDelegate__provideItemAtURL_withInfo_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  NSObject *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  id v30;
  uint64_t v31;
  _QWORD v32[4];
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  uint64_t v39;
  id v40;
  id v41;
  uint64_t v42;
  id v43;
  id v44;
  uint8_t buf[4];
  void *v46;
  __int16 v47;
  uint64_t v48;
  __int16 v49;
  uint64_t v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (!v8)
  {
    v24 = *(_QWORD *)(a1 + 104);
    objc_msgSend(MEMORY[0x1E0CB3640], "responseWithError:", v7);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v24 + 16))(v24, v25);

    goto LABEL_10;
  }
  objc_msgSend(v8, "url");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D25D48], "manager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = 0;
  objc_msgSend(v11, "permanentStorageForItemAtURL:allocateIfNone:error:", v10, 0, &v44);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v44;

  if (!v12)
  {
LABEL_9:

    v26 = *(void **)(a1 + 56);
    v27 = *(_QWORD *)(a1 + 64);
    v28 = *(void **)(a1 + 72);
    v29 = *(_QWORD *)(a1 + 80);
    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 3221225472;
    v32[2] = __92__FPDVersionsFileCoordinationProviderDelegate__provideItemAtURL_withInfo_completionHandler___block_invoke_13;
    v32[3] = &unk_1E8C76238;
    v33 = v28;
    v34 = *(id *)(a1 + 64);
    v35 = *(id *)(a1 + 48);
    v41 = *(id *)(a1 + 104);
    v36 = *(id *)(a1 + 32);
    v37 = *(id *)(a1 + 56);
    v30 = *(id *)(a1 + 88);
    v42 = *(_QWORD *)(a1 + 112);
    v31 = *(_QWORD *)(a1 + 96);
    v38 = v30;
    v39 = v31;
    v40 = *(id *)(a1 + 40);
    objc_msgSend(v26, "downloadVersionWithItemID:etag:request:completionHandler:", v27, v33, v29, v32);

    goto LABEL_10;
  }
  objc_msgSend(*(id *)(a1 + 32), "lastPathComponent");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = *MEMORY[0x1E0D25D00];
  v43 = v13;
  objc_msgSend(v12, "additionWithName:inNameSpace:error:", v14, v15, &v43);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v43;

  if (!v16)
  {
    v13 = v17;
    goto LABEL_9;
  }
  fp_current_or_default_log();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "fp_shortDescription");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = *(_QWORD *)(a1 + 40);
    v21 = *(_QWORD *)(a1 + 48);
    *(_DWORD *)buf = 138412802;
    v46 = v19;
    v47 = 2112;
    v48 = v20;
    v49 = 2114;
    v50 = v21;
    _os_log_impl(&dword_1CF55F000, v18, OS_LOG_TYPE_DEFAULT, "[NOTICE] ✅ NSFileCoordinator: item exist on disk %@ (consumer: %@, readerID: %{public}@)", buf, 0x20u);

  }
  v22 = *(_QWORD *)(a1 + 104);
  objc_msgSend(MEMORY[0x1E0CB3640], "responseWithError:", 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v22 + 16))(v22, v23);

LABEL_10:
}

void __92__FPDVersionsFileCoordinationProviderDelegate__provideItemAtURL_withInfo_completionHandler___block_invoke_13(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  NSObject *v38;
  uint64_t v39;
  void *v40;
  NSObject *v41;
  uint64_t v42;
  NSObject *v43;
  uint64_t v44;
  id v45;
  uint64_t v46;
  id v47;
  uint64_t v48;
  __int128 v49;
  void *v50;
  id v51;
  void *v52;
  id v53;
  id v54;
  _QWORD v55[4];
  id v56;
  id v57;
  id v58;
  id v59;
  id v60;
  id v61;
  id v62;
  uint64_t v63;
  id v64;
  id v65;
  __int128 v66;
  id v67;
  id v68;
  uint8_t buf[4];
  void *v70;
  __int16 v71;
  id v72;
  __int16 v73;
  uint64_t v74;
  _QWORD v75[7];
  _QWORD v76[10];

  v76[7] = *MEMORY[0x1E0C80C00];
  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (v10)
  {
    v54 = v9;
    v13 = (void *)objc_opt_new();
    objc_msgSend(v10, "lastEditorDeviceName");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      objc_msgSend(v10, "lastEditorDeviceName");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setObject:forKeyedSubscript:", v15, CFSTR("fpVersionLastEditorDeviceName"));

    }
    v53 = v12;
    objc_msgSend(v10, "lastEditorNameComponents");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      v17 = (void *)MEMORY[0x1E0CB36F8];
      objc_msgSend(v10, "lastEditorNameComponents");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "archivedDataWithRootObject:requiringSecureCoding:error:", v18, 1, 0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setObject:forKeyedSubscript:", v19, CFSTR("fpVersionLastEditorNameComponents"));

    }
    v75[0] = *MEMORY[0x1E0D25CF0];
    objc_msgSend(v10, "originalURL");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "lastPathComponent");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v76[0] = v21;
    v75[1] = *MEMORY[0x1E0D25CC0];
    objc_msgSend(v10, "displayName");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = *MEMORY[0x1E0D25CD8];
    v24 = *MEMORY[0x1E0D25D00];
    v76[1] = v22;
    v76[2] = v24;
    v25 = *MEMORY[0x1E0D25CD0];
    v75[2] = v23;
    v75[3] = v25;
    objc_msgSend(*(id *)(a1 + 56), "lastPathComponent");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = *MEMORY[0x1E0D25CE8];
    v76[3] = v26;
    v76[4] = &unk_1E8C95DD8;
    v28 = *MEMORY[0x1E0D25CE0];
    v75[4] = v27;
    v75[5] = v28;
    v75[6] = *MEMORY[0x1E0D25CF8];
    v76[5] = &unk_1E8C95DF0;
    v76[6] = v13;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v76, v75, 7);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D25D48], "manager");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "originalURL");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v68 = 0;
    objc_msgSend(v30, "permanentStorageForItemAtURL:allocateIfNone:error:", v31, 1, &v68);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = v68;

    if (v32)
    {
      v51 = v33;
      v67 = 0;
      objc_msgSend(v32, "prepareAdditionCreationWithItemAtURL:byMoving:creationInfo:error:", v11, 0, v29, &v67);
      v34 = v11;
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = v67;
      v52 = v29;
      if (v36)
      {
        v37 = v34;
        fp_current_or_default_log();
        v38 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
        {
          v48 = *(_QWORD *)(a1 + 48);
          *(_DWORD *)buf = 138412802;
          v70 = v34;
          v71 = 2112;
          v72 = v36;
          v73 = 2114;
          v74 = v48;
          _os_log_error_impl(&dword_1CF55F000, v38, OS_LOG_TYPE_ERROR, "[ERROR] ❌ NSFileCoordinator: Failed to prepare addition for item version %@: %@ (readerID: %{public}@)", buf, 0x20u);
        }

        v39 = *(_QWORD *)(a1 + 96);
        objc_msgSend(MEMORY[0x1E0CB3640], "responseWithError:", v36);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, void *))(v39 + 16))(v39, v40);
      }
      else
      {
        v50 = *(void **)(a1 + 64);
        v55[0] = MEMORY[0x1E0C809B0];
        v55[1] = 3221225472;
        v55[2] = __92__FPDVersionsFileCoordinationProviderDelegate__provideItemAtURL_withInfo_completionHandler___block_invoke_23;
        v55[3] = &unk_1E8C76210;
        v56 = v10;
        v57 = *(id *)(a1 + 48);
        v58 = v35;
        v59 = *(id *)(a1 + 72);
        v60 = v32;
        v61 = v29;
        v45 = *(id *)(a1 + 56);
        v46 = *(_QWORD *)(a1 + 80);
        v62 = v45;
        v63 = v46;
        v49 = *(_OWORD *)(a1 + 96);
        v47 = (id)v49;
        v66 = v49;
        v64 = *(id *)(a1 + 88);
        v37 = v34;
        v65 = v34;
        objc_msgSend(v50, "downloadVersionThumbnail:version:completionHandler:", v54, v56, v55);

        v40 = v56;
      }
      v33 = v51;

      v11 = v37;
      v29 = v52;
    }
    else
    {
      fp_current_or_default_log();
      v43 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
        __92__FPDVersionsFileCoordinationProviderDelegate__provideItemAtURL_withInfo_completionHandler___block_invoke_13_cold_2(v10);

      v44 = *(_QWORD *)(a1 + 96);
      objc_msgSend(MEMORY[0x1E0CB3640], "responseWithError:", v33);
      v36 = (id)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, id))(v44 + 16))(v44, v36);
    }

    v12 = v53;
    v9 = v54;
  }
  else
  {
    fp_current_or_default_log();
    v41 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
      __92__FPDVersionsFileCoordinationProviderDelegate__provideItemAtURL_withInfo_completionHandler___block_invoke_13_cold_1();

    v42 = *(_QWORD *)(a1 + 96);
    objc_msgSend(MEMORY[0x1E0CB3640], "responseWithError:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v42 + 16))(v42, v13);
  }

}

void __92__FPDVersionsFileCoordinationProviderDelegate__provideItemAtURL_withInfo_completionHandler___block_invoke_23(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  id v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  NSObject *v36;
  uint64_t v37;
  _QWORD v38[4];
  id v39;
  uint64_t v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  uint64_t v46;
  id v47;
  uint8_t buf[4];
  void *v49;
  __int16 v50;
  NSObject *v51;
  __int16 v52;
  uint64_t v53;
  __int16 v54;
  void *v55;
  __int16 v56;
  void *v57;
  __int16 v58;
  uint64_t v59;
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (v7 && !v9)
  {
    v11 = *(void **)(a1 + 48);
    objc_msgSend(v7, "url");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = 0;
    v13 = objc_msgSend(v11, "fp_associateThumbnailToVersionAtURL:thumbnailMetadata:error:", v12, v8, &v47);
    v14 = v47;

    fp_current_or_default_log();
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v13)
    {
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(*(id *)(a1 + 48), "fp_shortDescription");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = *(NSObject **)(a1 + 56);
        v19 = *(_QWORD *)(a1 + 32);
        v20 = *(void **)(a1 + 40);
        *(_DWORD *)buf = 138544130;
        v49 = v17;
        v50 = 2112;
        v51 = v18;
        v52 = 2112;
        v53 = v19;
        v54 = 2114;
        v55 = v20;
        _os_log_impl(&dword_1CF55F000, v16, OS_LOG_TYPE_INFO, "[INFO] Associated thumbnail data for %{public}@ for identifier: %@, version: %@ (readerID: %{public}@)", buf, 0x2Au);

      }
      v21 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(*(id *)(a1 + 48), "path");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "stringWithFormat:", CFSTR("com.apple.fileprovider.thumbnail-available.%@"), v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "fp_libnotifyPerUserNotificationName");
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      v16 = objc_retainAutorelease(v24);
      notify_post((const char *)-[NSObject UTF8String](v16, "UTF8String"));
    }
    else if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v32 = *(void **)(a1 + 48);
      v36 = *(NSObject **)(a1 + 56);
      v37 = *(_QWORD *)(a1 + 32);
      objc_msgSend(v7, "url");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject fp_prettyDescription](v14, "fp_prettyDescription");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138413570;
      v49 = v32;
      v50 = 2112;
      v51 = v36;
      v52 = 2112;
      v53 = v37;
      v54 = 2112;
      v55 = v33;
      v56 = 2114;
      v57 = v34;
      v58 = 2114;
      v59 = v35;
      _os_log_error_impl(&dword_1CF55F000, v16, OS_LOG_TYPE_ERROR, "[ERROR] Failed to associate thumbnail data to promised URL %@ for identifier: %@, version: %@, thumbnailDataURL: %@, error: %{public}@ (readerID: %{public}@)", buf, 0x3Eu);

    }
    goto LABEL_11;
  }
  fp_current_or_default_log();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    v25 = *(void **)(a1 + 32);
    objc_msgSend(v10, "fp_prettyDescription");
    v16 = objc_claimAutoreleasedReturnValue();
    v26 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138412802;
    v49 = v25;
    v50 = 2114;
    v51 = v16;
    v52 = 2114;
    v53 = v26;
    _os_log_impl(&dword_1CF55F000, v14, OS_LOG_TYPE_INFO, "[INFO] failed to download thumbnail for version %@: %{public}@ (readerID: %{public}@)", buf, 0x20u);
LABEL_11:

  }
  v27 = *(_QWORD *)(a1 + 48);
  v29 = *(void **)(a1 + 64);
  v28 = *(_QWORD *)(a1 + 72);
  v38[0] = MEMORY[0x1E0C809B0];
  v38[1] = 3221225472;
  v38[2] = __92__FPDVersionsFileCoordinationProviderDelegate__provideItemAtURL_withInfo_completionHandler___block_invoke_26;
  v38[3] = &unk_1E8C761E8;
  v30 = *(id *)(a1 + 80);
  v46 = *(_QWORD *)(a1 + 120);
  v31 = *(_QWORD *)(a1 + 88);
  v39 = v30;
  v40 = v31;
  v41 = *(id *)(a1 + 48);
  v42 = *(id *)(a1 + 40);
  v45 = *(id *)(a1 + 112);
  v43 = *(id *)(a1 + 96);
  v44 = *(id *)(a1 + 104);
  objc_msgSend(v29, "createAdditionStagedAtURL:creationInfo:completionHandler:", v27, v28, v38);

}

void __92__FPDVersionsFileCoordinationProviderDelegate__provideItemAtURL_withInfo_completionHandler___block_invoke_26(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  NSObject *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  uint64_t v34;
  __int16 v35;
  uint64_t v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(v5, "url");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "path");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "path");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "isEqual:", v9);

  if ((v10 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = *(_QWORD *)(a1 + 88);
    v26 = *(_QWORD *)(a1 + 40);
    objc_msgSend(v5, "url");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "fp_shortDescription");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "fp_shortDescription");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "fp_shortDescription");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", v25, v26, CFSTR("FPDVersionsFileCoordinationProviderDelegate.m"), 244, CFSTR("Result URL %@ differs from requested URL %@ (staged was %@)"), v28, v29, v30);

  }
  fp_current_or_default_log();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v6)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      __92__FPDVersionsFileCoordinationProviderDelegate__provideItemAtURL_withInfo_completionHandler___block_invoke_26_cold_1(a1);

    v13 = *(_QWORD *)(a1 + 80);
    v14 = (void *)MEMORY[0x1E0CB3640];
    v15 = v6;
  }
  else
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "fp_shortDescription");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = *(_QWORD *)(a1 + 56);
      v17 = *(_QWORD *)(a1 + 64);
      *(_DWORD *)buf = 138412802;
      v32 = v16;
      v33 = 2112;
      v34 = v17;
      v35 = 2114;
      v36 = v18;
      _os_log_impl(&dword_1CF55F000, v12, OS_LOG_TYPE_DEFAULT, "[NOTICE] ✅ NSFileCoordinator: providing item version at %@ (consumer: %@, readerID: %{public}@)", buf, 0x20u);

    }
    v19 = (void *)MEMORY[0x1E0CB3600];
    v20 = *(_QWORD *)(a1 + 72);
    v21 = *MEMORY[0x1E0D25D00];
    objc_msgSend(v5, "name");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "__itemAtURL:didGainVersionWithClientID:name:purposeID:", v20, v21, v22, 0);

    v13 = *(_QWORD *)(a1 + 80);
    v14 = (void *)MEMORY[0x1E0CB3640];
    v15 = 0;
  }
  objc_msgSend(v14, "responseWithError:", v15);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v13 + 16))(v13, v23);

}

- (void)_movingItemAtURL:(id)a3 withInfo:(id)a4 completionHandler:(id)a5
{
  void *v6;
  id v7;
  id v8;

  v6 = (void *)MEMORY[0x1E0CB3628];
  v7 = a5;
  objc_msgSend(v6, "providingRequiredResponse");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id))a5 + 2))(v7, v8);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extensionManager, 0);
}

- (void)_physicalURLForURL:.cold.1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_6(&dword_1CF55F000, v0, (uint64_t)v0, "[DEBUG] %@ failed to find version for %@", v1);
  OUTLINED_FUNCTION_8_0();
}

- (void)_physicalURLForURL:.cold.2()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_6(&dword_1CF55F000, v0, (uint64_t)v0, "[DEBUG] %@ failed to find storage for %@", v1);
  OUTLINED_FUNCTION_8_0();
}

- (void)_physicalURLForURL:.cold.3()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_6(&dword_1CF55F000, v0, (uint64_t)v0, "[DEBUG] %@ called for %@", v1);
  OUTLINED_FUNCTION_8_0();
}

- (void)_provideItemAtURL:(void *)a1 withInfo:(uint64_t)a2 completionHandler:(uint64_t)a3 .cold.1(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint8_t *v5;
  NSObject *v6;

  OUTLINED_FUNCTION_3_2((uint64_t)a1, a2, a3, 5.778e-34);
  OUTLINED_FUNCTION_6(&dword_1CF55F000, v6, v4, "[DEBUG] ⛔️ NSFileCoordinator: Item URL %@ belongs to a conflict version and should already be present (readerID: %{public}@)", v5);

}

- (void)_provideItemAtURL:(void *)a1 withInfo:(uint64_t)a2 completionHandler:(uint64_t)a3 .cold.2(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint8_t *v5;
  NSObject *v6;

  OUTLINED_FUNCTION_3_2((uint64_t)a1, a2, a3, 5.778e-34);
  OUTLINED_FUNCTION_6(&dword_1CF55F000, v6, v4, "[DEBUG] ❌ NSFileCoordinator: Item URL %@ could not be parsed (readerID: %{public}@)", v5);

}

void __92__FPDVersionsFileCoordinationProviderDelegate__provideItemAtURL_withInfo_completionHandler___block_invoke_13_cold_1()
{
  void *v0;
  void *v1;
  os_log_t v2;
  os_log_type_t v3;
  const char *v4;
  uint8_t *v5;
  void *v6;

  objc_msgSend(0, "originalURL");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "fp_shortDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_2();
  _os_log_error_impl(v1, v2, v3, v4, v5, 0x34u);

}

void __92__FPDVersionsFileCoordinationProviderDelegate__provideItemAtURL_withInfo_completionHandler___block_invoke_13_cold_2(void *a1)
{
  void *v1;
  void *v2;
  os_log_t v3;
  os_log_type_t v4;
  const char *v5;
  uint8_t *v6;
  void *v7;

  objc_msgSend(a1, "originalURL");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "fp_shortDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_2();
  _os_log_error_impl(v2, v3, v4, v5, v6, 0x16u);

}

void __92__FPDVersionsFileCoordinationProviderDelegate__provideItemAtURL_withInfo_completionHandler___block_invoke_26_cold_1(uint64_t a1)
{
  void *v1;
  os_log_t v2;
  os_log_type_t v3;
  const char *v4;
  uint8_t *v5;
  void *v6;

  objc_msgSend(*(id *)(a1 + 48), "fp_shortDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_2();
  _os_log_error_impl(v1, v2, v3, v4, v5, 0x20u);

}

@end
