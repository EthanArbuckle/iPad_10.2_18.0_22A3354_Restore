@implementation FPDExtension

- (BOOL)isAppExtensionReachable
{
  return 1;
}

- (LSApplicationExtensionRecord)extensionRecord
{
  LSApplicationExtensionRecord *extensionRecord;
  LSApplicationExtensionRecord *v3;
  id v5;
  void *v6;
  void *v7;

  extensionRecord = self->_extensionRecord;
  if (extensionRecord)
  {
    v3 = extensionRecord;
  }
  else
  {
    v5 = objc_alloc(MEMORY[0x1E0CA5848]);
    -[FPDProvider descriptor](self, "descriptor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "extensionBundleURL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = (LSApplicationExtensionRecord *)objc_msgSend(v5, "initWithURL:error:", v7, 0);

  }
  return v3;
}

+ (id)allocForIdentifier:(id)a3
{
  id v4;
  __objc2_class *v5;
  id v6;

  v4 = a3;
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.FileProvider.LocalStorage")))
  {
    v5 = FPDLocalStorageExtension;
  }
  else if (objc_msgSend(v4, "fp_isiCloudDriveOrCloudDocsIdentifier"))
  {
    v5 = FPDCloudDocsExtension;
  }
  else
  {
    v5 = (__objc2_class *)a1;
  }
  v6 = [v5 alloc];

  return v6;
}

+ (id)instanceWithExtension:(id)a3 queue:(id)a4 server:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  objc_msgSend(v10, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend((id)objc_msgSend(a1, "allocForIdentifier:", v11), "initWithExtension:extensionRecord:queue:server:volumeManager:", v10, 0, v9, v8, 0);

  return v12;
}

+ (id)instanceWithExtension:(id)a3 queue:(id)a4 volumeManager:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  objc_msgSend(v10, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend((id)objc_msgSend(a1, "allocForIdentifier:", v11), "initWithExtension:extensionRecord:queue:server:volumeManager:", v10, 0, v9, 0, v8);

  return v12;
}

+ (id)instanceWithExtensionRecord:(id)a3 queue:(id)a4 server:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  objc_msgSend(v10, "bundleIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend((id)objc_msgSend(a1, "allocForIdentifier:", v11), "initWithExtension:extensionRecord:queue:server:volumeManager:", 0, v10, v9, v8, 0);

  return v12;
}

+ (id)instanceWithExtensionRecord:(id)a3 queue:(id)a4 volumeManager:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  objc_msgSend(v10, "bundleIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend((id)objc_msgSend(a1, "allocForIdentifier:", v11), "initWithExtension:extensionRecord:queue:server:volumeManager:", 0, v10, v9, 0, v8);

  return v12;
}

- (FPDExtension)initWithExtension:(id)a3 extensionRecord:(id)a4 queue:(id)a5 server:(id)a6 volumeManager:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  FPDProviderDescriptor *v34;
  uint64_t v35;
  FPDExtension *v36;
  void *v37;
  uint64_t v38;
  _BOOL4 v39;
  NSObject *v40;
  NSObject *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  id v46;
  void *v47;
  FPDExtension *v48;
  NSObject *v49;
  id v50;
  NSObject *v52;
  id v53;
  id v54;
  _QWORD v55[4];
  FPDExtension *v56;
  objc_super v57;
  uint8_t buf[4];
  void *v59;
  __int16 v60;
  const __CFString *v61;
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v18 = v17;
  if (v16 && v17)
  {
    fp_current_or_default_log();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      -[FPDExtension initWithExtension:extensionRecord:queue:server:volumeManager:].cold.1(v19, v20, v21, v22, v23, v24, v25, v26);
LABEL_30:
    v48 = 0;
    goto LABEL_31;
  }
  if (v13 && v14)
  {
    fp_current_or_default_log();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      -[FPDExtension initWithExtension:extensionRecord:queue:server:volumeManager:].cold.2(v19, v27, v28, v29, v30, v31, v32, v33);
    goto LABEL_30;
  }
  v34 = [FPDProviderDescriptor alloc];
  if (v13)
    v35 = -[FPDProviderDescriptor initWithExtension:](v34, "initWithExtension:", v13);
  else
    v35 = -[FPDProviderDescriptor initWithExtensionRecord:](v34, "initWithExtensionRecord:", v14);
  v19 = v35;
  if (!v35)
  {
    fp_current_or_default_log();
    v49 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
    {
      if (v13)
        v50 = v13;
      else
        v50 = v14;
      *(_DWORD *)buf = 138412290;
      v59 = v50;
      _os_log_impl(&dword_1CF55F000, v49, OS_LOG_TYPE_DEFAULT, "[WARNING] Failed to create descriptor for extension %@", buf, 0xCu);
    }

    goto LABEL_30;
  }
  v57.receiver = self;
  v57.super_class = (Class)FPDExtension;
  v36 = -[FPDProvider initWithDescriptor:server:](&v57, sel_initWithDescriptor_server_, v35, v16);
  self = v36;
  if (!v36)
    goto LABEL_23;
  v53 = v15;
  v54 = v14;
  -[FPDProvider extensionStorageURLs](v36, "extensionStorageURLs");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = objc_msgSend(v37, "count");

  if (v38)
  {
LABEL_19:
    objc_storeStrong((id *)&self->_sharedSessionQueue, a5);
    objc_storeStrong((id *)&self->_extension, a3);
    objc_storeStrong((id *)&self->_extensionRecord, a4);
    objc_msgSend(v16, "volumeManager");
    v43 = objc_claimAutoreleasedReturnValue();
    v44 = (void *)v43;
    if (v43)
      v45 = (void *)v43;
    else
      v45 = v18;
    v46 = v45;

    -[NSObject personaIdentifier](v19, "personaIdentifier");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v55[0] = MEMORY[0x1E0C809B0];
    v55[1] = 3221225472;
    v55[2] = __77__FPDExtension_initWithExtension_extensionRecord_queue_server_volumeManager___block_invoke;
    v55[3] = &unk_1E8C75330;
    v56 = self;
    objc_msgSend(v46, "enumerateLibrariesForPersona:withBlock:", v47, v55);

    v15 = v53;
    v14 = v54;
LABEL_23:
    self = self;
    v48 = self;
    goto LABEL_31;
  }
  v39 = -[FPDProvider supportsFPFS](self, "supportsFPFS");
  fp_current_or_default_log();
  v40 = objc_claimAutoreleasedReturnValue();
  v41 = v40;
  if (v39)
  {
    if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v13, "identifier");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v59 = v42;
      v60 = 2112;
      v61 = CFSTR("NSExtensionFileProviderDocumentGroup");
      _os_log_impl(&dword_1CF55F000, v41, OS_LOG_TYPE_INFO, "[INFO] \"%@\" key not found in Info.plist of %@. The documentStorageURL property on NSFileProviderManager will not be available.", buf, 0x16u);

    }
    goto LABEL_19;
  }
  v52 = v40;
  v15 = v53;
  if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
    -[FPDExtension initWithExtension:extensionRecord:queue:server:volumeManager:].cold.3(v13);

  v48 = 0;
  v14 = v54;
LABEL_31:

  return v48;
}

uint64_t __77__FPDExtension_initWithExtension_extensionRecord_queue_server_volumeManager___block_invoke(uint64_t a1, uint64_t a2)
{
  id v2;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "importDomainsFromLibrary:updatePlist:", a2, 1);
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  FPDExtension *v4;
  uint64_t v5;
  char v6;
  void *v7;
  void *v8;

  v4 = (FPDExtension *)a3;
  if (self == v4)
  {
    v6 = 1;
  }
  else
  {
    v5 = objc_opt_class();
    if (v5 == objc_opt_class())
    {
      -[FPDProvider descriptor](self, "descriptor");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[FPDProvider descriptor](v4, "descriptor");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v7, "isEqual:", v8);

    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

- (void)removeTrashedItemsOlderThanDate:(id)a3 request:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  dispatch_group_t v14;
  void *v15;
  id v16;
  id v17;
  NSObject *v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t, void *, void *);
  void *v23;
  dispatch_group_t v24;
  id v25;
  id v26;
  FPDExtension *v27;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  fp_current_or_default_log();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    -[FPDExtension removeTrashedItemsOlderThanDate:request:completionHandler:].cold.1(v11, v12, v13);

  v14 = dispatch_group_create();
  -[FPDProvider relevantDomainsByID](self, "relevantDomainsByID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = MEMORY[0x1E0C809B0];
  v21 = 3221225472;
  v22 = __74__FPDExtension_removeTrashedItemsOlderThanDate_request_completionHandler___block_invoke;
  v23 = &unk_1E8C75380;
  v24 = v14;
  v25 = v9;
  v26 = v8;
  v27 = self;
  v16 = v8;
  v17 = v9;
  v18 = v14;
  objc_msgSend(v15, "enumerateKeysAndObjectsUsingBlock:", &v20);

  -[FPDProvider queue](self, "queue", v20, v21, v22, v23);
  v19 = objc_claimAutoreleasedReturnValue();
  dispatch_group_notify(v18, v19, v10);

}

void __74__FPDExtension_removeTrashedItemsOlderThanDate_request_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  NSObject *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  int8x16_t v11;
  _QWORD v12[4];
  int8x16_t v13;
  id v14;

  v5 = *(NSObject **)(a1 + 32);
  v6 = a3;
  v7 = a2;
  dispatch_group_enter(v5);
  objc_msgSend(v6, "session");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)objc_msgSend(v8, "newFileProviderProxyWithTimeout:pid:", objc_msgSend(*(id *)(a1 + 40), "pid"), 180.0);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __74__FPDExtension_removeTrashedItemsOlderThanDate_request_completionHandler___block_invoke_2;
  v12[3] = &unk_1E8C75358;
  v11 = *(int8x16_t *)(a1 + 48);
  v10 = (id)v11.i64[0];
  v13 = vextq_s8(v11, v11, 8uLL);
  v14 = *(id *)(a1 + 32);
  objc_msgSend(v9, "removeTrashedItemsOlderThanDate:domainIdentifier:completionHandler:", v10, v7, v12);

}

void __74__FPDExtension_removeTrashedItemsOlderThanDate_request_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  NSObject *v3;

  if (a2)
  {
    fp_current_or_default_log();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __74__FPDExtension_removeTrashedItemsOlderThanDate_request_completionHandler___block_invoke_2_cold_1(a1);

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

- (void)didReceiveMessage:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  NSObject *v19;
  _QWORD v20[4];
  id v21;
  id v22;
  FPDExtension *v23;
  id v24;
  id v25;
  void (**v26)(_QWORD);

  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  objc_msgSend(v6, "userInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", CFSTR("container-identifier"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "userInfo");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKey:", CFSTR("domain"));
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  v13 = (void *)*MEMORY[0x1E0CAAB38];
  if (v11)
    v13 = (void *)v11;
  v14 = v13;

  if (!v14)
  {
    fp_current_or_default_log();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      -[FPDExtension didReceiveMessage:completionHandler:].cold.1(v6);
    goto LABEL_11;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    fp_current_or_default_log();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      -[FPDExtension didReceiveMessage:completionHandler:].cold.3(v6);
LABEL_11:

    v7[2](v7);
    goto LABEL_16;
  }
  -[FPDProvider domainForIdentifier:reason:](self, "domainForIdentifier:reason:", v14, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v15)
  {
    objc_msgSend(v15, "defaultBackend");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __52__FPDExtension_didReceiveMessage_completionHandler___block_invoke;
    v20[3] = &unk_1E8C753D0;
    v21 = v9;
    v26 = v7;
    v22 = v6;
    v23 = self;
    v24 = v14;
    v25 = v16;
    objc_msgSend(v17, "wakeForPushWithCompletionHandler:", v20);

  }
  else
  {
    fp_current_or_default_log();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      -[FPDExtension didReceiveMessage:completionHandler:].cold.2();

    v7[2](v7);
  }

LABEL_16:
}

void __52__FPDExtension_didReceiveMessage_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  char isKindOfClass;
  NSObject *v6;
  NSObject *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;

  v3 = a2;
  if (v3)
  {
    fp_current_or_default_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __52__FPDExtension_didReceiveMessage_completionHandler___block_invoke_cold_3(v3);

  }
  if (!*(_QWORD *)(a1 + 32))
    goto LABEL_13;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  fp_current_or_default_log();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if ((isKindOfClass & 1) == 0)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __52__FPDExtension_didReceiveMessage_completionHandler___block_invoke_cold_2(a1);

LABEL_13:
    (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
    goto LABEL_14;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    __52__FPDExtension_didReceiveMessage_completionHandler___block_invoke_cold_1((uint64_t *)(a1 + 32), a1, v7);

  v8 = objc_alloc(MEMORY[0x1E0CAAC70]);
  objc_msgSend(*(id *)(a1 + 48), "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithProviderID:domainIdentifier:itemIdentifier:", v9, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32));

  v11 = *(void **)(a1 + 64);
  +[FPDRequest requestForSelf](FPDRequest, "requestForSelf");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __52__FPDExtension_didReceiveMessage_completionHandler___block_invoke_17;
  v13[3] = &unk_1E8C753A8;
  v14 = v3;
  objc_msgSend(v11, "didChangeItemID:request:completionHandler:", v10, v12, v13);

  (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
LABEL_14:

}

void __52__FPDExtension_didReceiveMessage_completionHandler___block_invoke_17(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  if (*(_QWORD *)(a1 + 32))
  {
    fp_current_or_default_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __52__FPDExtension_didReceiveMessage_completionHandler___block_invoke_17_cold_1(v3);

  }
}

- (id)customPushTopics
{
  FPDExtension *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id obj;
  _QWORD v17[5];
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v2 = self;
  objc_sync_enter(v2);
  -[FPDProvider domainsByID](v2, "domainsByID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  objc_sync_exit(v2);
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  obj = v5;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v20 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(v10, "session");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = (void *)objc_msgSend(v11, "newFileProviderProxyWithTimeout:pid:", 0, 180.0);
        objc_msgSend(v12, "synchronousRemoteObjectProxy");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        v17[0] = MEMORY[0x1E0C809B0];
        v17[1] = 3221225472;
        v17[2] = __32__FPDExtension_customPushTopics__block_invoke;
        v17[3] = &unk_1E8C753F8;
        v17[4] = v10;
        v18 = v6;
        objc_msgSend(v13, "fetchCustomPushTopicsWithCompletionHandler:", v17);

      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v7);
  }

  objc_msgSend(v6, "allObjects");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

void __32__FPDExtension_customPushTopics__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    fp_current_or_default_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __32__FPDExtension_customPushTopics__block_invoke_cold_2(a1, v6);
  }
  else
  {
    if (v5)
    {
      objc_msgSend(*(id *)(a1 + 40), "addObjectsFromArray:", v5);
      goto LABEL_7;
    }
    fp_current_or_default_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      __32__FPDExtension_customPushTopics__block_invoke_cold_1(a1, v7);
  }

LABEL_7:
}

- (void)_test_callFileProviderManagerAPIs:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;

  v4 = a3;
  fp_current_or_default_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[FPDExtension _test_callFileProviderManagerAPIs:].cold.1(v5, v6, v7);

  -[FPDProvider domainForIdentifier:reason:](self, "domainForIdentifier:reason:", *MEMORY[0x1E0CAAB38], 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "session");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)objc_msgSend(v9, "newFileProviderProxyWithTimeout:pid:", 0, 180.0);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __50__FPDExtension__test_callFileProviderManagerAPIs___block_invoke;
  v12[3] = &unk_1E8C75420;
  v13 = v4;
  v11 = v4;
  objc_msgSend(v10, "_test_callFileProviderManagerAPIs:", v12);

}

void __50__FPDExtension__test_callFileProviderManagerAPIs___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  if (v3)
  {
    fp_current_or_default_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __50__FPDExtension__test_callFileProviderManagerAPIs___block_invoke_cold_1(v3);

  }
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);

}

- (NSExtension)extension
{
  return self->_extension;
}

- (void)setExtension:(id)a3
{
  objc_storeStrong((id *)&self->_extension, a3);
}

- (OS_dispatch_queue)sharedSessionQueue
{
  return self->_sharedSessionQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharedSessionQueue, 0);
  objc_storeStrong((id *)&self->_extensionRecord, 0);
  objc_storeStrong((id *)&self->_extension, 0);
}

- (void)initWithExtension:(uint64_t)a3 extensionRecord:(uint64_t)a4 queue:(uint64_t)a5 server:(uint64_t)a6 volumeManager:(uint64_t)a7 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_7_0(&dword_1CF55F000, a1, a3, "[ERROR] Inconsistent call with both a server and a volumeManager. Pick one", a5, a6, a7, a8, 0);
}

- (void)initWithExtension:(uint64_t)a3 extensionRecord:(uint64_t)a4 queue:(uint64_t)a5 server:(uint64_t)a6 volumeManager:(uint64_t)a7 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_7_0(&dword_1CF55F000, a1, a3, "[ERROR] Inconsistent call with both a extension and a extensionRecord. Pick one", a5, a6, a7, a8, 0);
}

- (void)initWithExtension:(void *)a1 extensionRecord:queue:server:volumeManager:.cold.3(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "identifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2_0(&dword_1CF55F000, v2, v3, "[ERROR] \"%@\" key not found in Info.plist. Skipping provider %@.", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_1_0();
}

- (void)removeTrashedItemsOlderThanDate:(NSObject *)a1 request:(uint64_t)a2 completionHandler:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 136315138;
  v4 = "-[FPDExtension removeTrashedItemsOlderThanDate:request:completionHandler:]";
  OUTLINED_FUNCTION_5_0(&dword_1CF55F000, a1, a3, "[DEBUG] %s", (uint8_t *)&v3);
  OUTLINED_FUNCTION_8_0();
}

void __74__FPDExtension_removeTrashedItemsOlderThanDate_request_completionHandler___block_invoke_2_cold_1(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1CF55F000, v2, v3, "[ERROR] can't ask extension %@ to remove trashed items older than %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2();
}

- (void)didReceiveMessage:(void *)a1 completionHandler:.cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "userInfo");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_0(&dword_1CF55F000, v2, v3, "[ERROR] received malformed file provider push (null container-identifier key), payload was %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

- (void)didReceiveMessage:completionHandler:.cold.2()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3_0();
  _os_log_error_impl(&dword_1CF55F000, v0, OS_LOG_TYPE_ERROR, "[ERROR] received file provider push for unknown domain %@", v1, 0xCu);
  OUTLINED_FUNCTION_8_0();
}

- (void)didReceiveMessage:(void *)a1 completionHandler:.cold.3(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "userInfo");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_0(&dword_1CF55F000, v2, v3, "[ERROR] received malformed file provider push (bad container-identifier key), payload was %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

void __52__FPDExtension_didReceiveMessage_completionHandler___block_invoke_cold_1(uint64_t *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v4;
  void *v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = *a1;
  objc_msgSend(*(id *)(a2 + 48), "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412546;
  v7 = v4;
  OUTLINED_FUNCTION_4();
  _os_log_debug_impl(&dword_1CF55F000, a3, OS_LOG_TYPE_DEBUG, "[DEBUG] Received push on container %@ for provider %@", (uint8_t *)&v6, 0x16u);

  OUTLINED_FUNCTION_2();
}

void __52__FPDExtension_didReceiveMessage_completionHandler___block_invoke_cold_2(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(*(id *)(a1 + 40), "userInfo");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_0(&dword_1CF55F000, v2, v3, "[ERROR] received malformed file provider push (bad container-identifier key), payload was %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

void __52__FPDExtension_didReceiveMessage_completionHandler___block_invoke_cold_3(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "fp_prettyDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_0(&dword_1CF55F000, v2, v3, "[ERROR] Error while waking up provider to handle push; %@",
    v4,
    v5,
    v6,
    v7,
    v8);

  OUTLINED_FUNCTION_1_0();
}

void __52__FPDExtension_didReceiveMessage_completionHandler___block_invoke_17_cold_1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "fp_prettyDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_0(&dword_1CF55F000, v2, v3, "[ERROR] Error registering item change; %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

void __32__FPDExtension_customPushTopics__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "fp_prettyDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_5_0(&dword_1CF55F000, a2, v4, "[DEBUG] No custom topics received for %@", v5);

  OUTLINED_FUNCTION_1_0();
}

void __32__FPDExtension_customPushTopics__block_invoke_cold_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  objc_msgSend(*(id *)(a1 + 32), "fp_prettyDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "fp_prettyDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2_0(&dword_1CF55F000, v5, v6, "[ERROR] Could not fetch custom push topics for %@; %@",
    v7,
    v8,
    v9,
    v10,
    2u);

  OUTLINED_FUNCTION_2();
}

- (void)_test_callFileProviderManagerAPIs:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 136315138;
  v4 = "-[FPDExtension _test_callFileProviderManagerAPIs:]";
  OUTLINED_FUNCTION_5_0(&dword_1CF55F000, a1, a3, "[DEBUG] %s", (uint8_t *)&v3);
  OUTLINED_FUNCTION_8_0();
}

void __50__FPDExtension__test_callFileProviderManagerAPIs___block_invoke_cold_1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "fp_prettyDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_0(&dword_1CF55F000, v2, v3, "[ERROR] _test_callFileProviderManagerAPIs failed: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

@end
