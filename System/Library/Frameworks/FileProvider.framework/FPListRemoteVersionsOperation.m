@implementation FPListRemoteVersionsOperation

- (FPListRemoteVersionsOperation)initWithDocumentURL:(id)a3
{
  id v6;
  FPListRemoteVersionsOperation *v7;
  FPListRemoteVersionsOperation *v8;
  uint64_t v9;
  NSOperationQueue *queue;
  void *v12;
  objc_super v13;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("FPListRemoteVersionsOperation.m"), 34, CFSTR("url can not be nil: %@"), 0);

  }
  v13.receiver = self;
  v13.super_class = (Class)FPListRemoteVersionsOperation;
  v7 = -[FPOperation init](&v13, sel_init);
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_documentURL, a3);
    v9 = objc_opt_new();
    queue = v8->_queue;
    v8->_queue = (NSOperationQueue *)v9;

    -[NSOperationQueue setMaxConcurrentOperationCount:](v8->_queue, "setMaxConcurrentOperationCount:", 1);
  }

  return v8;
}

- (void)main
{
  void *v3;
  NSURL *documentURL;
  _BOOL8 v5;
  _QWORD v6[5];

  +[FPDaemonConnection sharedConnectionProxy](FPDaemonConnection, "sharedConnectionProxy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  documentURL = self->_documentURL;
  v5 = -[FPListRemoteVersionsOperation includeCachedVersions](self, "includeCachedVersions");
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __37__FPListRemoteVersionsOperation_main__block_invoke;
  v6[3] = &unk_1E444EA90;
  v6[4] = self;
  objc_msgSend(v3, "listRemoteVersionsOfItemAtURL:includeCachedVersions:completionHandler:", documentURL, v5, v6);

}

void __37__FPListRemoteVersionsOperation_main__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  id v30;
  id v31;
  _QWORD v32[5];
  _QWORD v33[4];
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (v9)
  {
    objc_msgSend(*(id *)(a1 + 32), "finishedBlock");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v10;
    if (v10)
    {
      (*(void (**)(uint64_t, id, id))(v10 + 16))(v10, v8, v9);
      objc_msgSend(*(id *)(a1 + 32), "setFinishedBlock:", 0);
    }
LABEL_24:

    goto LABEL_25;
  }
  v12 = *(void **)(a1 + 32);
  if (v7)
  {
    if (objc_msgSend(v12, "isSandboxExtensionConsumed"))
    {
      v31 = v7;
      v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v8, "count"));
      v35 = 0u;
      v36 = 0u;
      v37 = 0u;
      v38 = 0u;
      v30 = v8;
      v13 = v8;
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
      if (v14)
      {
        v15 = v14;
        v16 = *(_QWORD *)v36;
        do
        {
          for (i = 0; i != v15; ++i)
          {
            if (*(_QWORD *)v36 != v16)
              objc_enumerationMutation(v13);
            v18 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
            if ((objc_msgSend(v18, "hasThumbnail", v30) & 1) == 0)
            {
              objc_msgSend(v18, "version");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v19, "contentVersion");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v11, "setObject:forKey:", v18, v20);

            }
          }
          v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
        }
        while (v15);
      }

      if (objc_msgSend(v11, "count"))
      {
        +[FPItemManager defaultManager](FPItemManager, "defaultManager");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "allValues");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "fp_map:", &__block_literal_global_45);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "thumbnailsFetchOperationForItem:withVersions:withSize:scale:", v31, v23, 1024.0, 1024.0, 2.0);
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        v25 = MEMORY[0x1E0C809B0];
        v33[0] = MEMORY[0x1E0C809B0];
        v33[1] = 3221225472;
        v33[2] = __37__FPListRemoteVersionsOperation_main__block_invoke_3;
        v33[3] = &unk_1E444EA68;
        v34 = v11;
        objc_msgSend(v24, "setPerThumbnailWithVersionCompletionBlock:", v33);
        v32[0] = v25;
        v32[1] = 3221225472;
        v32[2] = __37__FPListRemoteVersionsOperation_main__block_invoke_12;
        v32[3] = &unk_1E444A598;
        v32[4] = *(_QWORD *)(a1 + 32);
        objc_msgSend(v24, "setThumbnailsFetchCompletionBlock:", v32);
        objc_msgSend(*(id *)(a1 + 32), "addDependency:", v24);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 312), "addOperation:", v24);
        objc_msgSend(*(id *)(a1 + 32), "finishedBlock");
        v26 = objc_claimAutoreleasedReturnValue();
        v27 = (void *)v26;
        if (v26)
        {
          (*(void (**)(uint64_t, id, _QWORD))(v26 + 16))(v26, v13, 0);
          objc_msgSend(*(id *)(a1 + 32), "setFinishedBlock:", 0);
        }

        v7 = v31;
      }
      else
      {
        objc_msgSend(*(id *)(a1 + 32), "finishedBlock");
        v28 = objc_claimAutoreleasedReturnValue();
        v29 = (void *)v28;
        v7 = v31;
        if (v28)
        {
          (*(void (**)(uint64_t, id, _QWORD))(v28 + 16))(v28, v13, 0);
          objc_msgSend(*(id *)(a1 + 32), "setFinishedBlock:", 0);
        }

        objc_msgSend(*(id *)(a1 + 32), "completedWithResult:error:", 0, 0);
      }
      v8 = v30;
      goto LABEL_24;
    }
  }
  else
  {
    objc_msgSend(v12, "completedWithResult:error:", MEMORY[0x1E0C9AA60], 0);
  }
LABEL_25:

}

uint64_t __37__FPListRemoteVersionsOperation_main__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "version");
}

void __37__FPListRemoteVersionsOperation_main__block_invoke_3(uint64_t a1, void *a2, void *a3, void *a4, uint64_t a5, void *a6, void *a7)
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  NSObject *v22;
  NSObject *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  uint64_t v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  id v37;
  id v38;
  uint8_t buf[4];
  id v40;
  __int16 v41;
  id v42;
  __int16 v43;
  id v44;
  __int16 v45;
  id v46;
  __int16 v47;
  id v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v12 = a2;
  v13 = a3;
  v14 = a4;
  v15 = a6;
  v16 = a7;
  if (v14)
  {
    v17 = *(void **)(a1 + 32);
    objc_msgSend(v13, "contentVersion");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectForKey:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v19, "physicalURL");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = 0;
    v21 = objc_msgSend(v20, "fp_associateThumbnailToVersionAtURL:thumbnailMetadata:error:", v14, v15, &v38);
    v22 = v38;

    fp_current_or_default_log();
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = v23;
    if (v21)
    {
      v37 = v16;
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v19, "url");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "physicalURL");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138413314;
        v40 = v14;
        v41 = 2112;
        v42 = v25;
        v43 = 2112;
        v44 = v26;
        v45 = 2112;
        v46 = v12;
        v47 = 2112;
        v48 = v13;
        _os_log_impl(&dword_1A0A34000, v24, OS_LOG_TYPE_INFO, "[INFO] Associated thumbnail %@ for %@ on the promised URL %@ for identifier: %@, version: %@", buf, 0x34u);

      }
      v27 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v19, "url");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "path");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "stringWithFormat:", CFSTR("com.apple.fileprovider.thumbnail-available.%@"), v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "fp_libnotifyPerUserNotificationName");
      v31 = v12;
      v32 = objc_claimAutoreleasedReturnValue();

      v33 = (void *)v32;
      v12 = v31;
      v24 = objc_retainAutorelease(v33);
      notify_post((const char *)-[NSObject UTF8String](v24, "UTF8String"));
      v16 = v37;
    }
    else if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v19, "physicalURL");
      v34 = v12;
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject fp_prettyDescription](v22, "fp_prettyDescription");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413314;
      v40 = v35;
      v41 = 2112;
      v42 = v34;
      v43 = 2112;
      v44 = v13;
      v45 = 2112;
      v46 = v14;
      v47 = 2114;
      v48 = v36;
      _os_log_error_impl(&dword_1A0A34000, v24, OS_LOG_TYPE_ERROR, "[ERROR] Failed to associate thumbnail data to promised URL %@ for identifier: %@, version: %@, thumbnailDataURL: %@, error: %{public}@", buf, 0x34u);

      v12 = v34;
    }

    goto LABEL_11;
  }
  fp_current_or_default_log();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v16, "fp_prettyDescription");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v40 = v12;
    v41 = 2112;
    v42 = v13;
    v43 = 2112;
    v44 = v19;
    _os_log_error_impl(&dword_1A0A34000, v22, OS_LOG_TYPE_ERROR, "[ERROR] No data for thumbnail with identifier: %@, version: %@, error: %@", buf, 0x20u);
LABEL_11:

  }
}

uint64_t __37__FPListRemoteVersionsOperation_main__block_invoke_12(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  fp_current_or_default_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 304);
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_1A0A34000, v2, OS_LOG_TYPE_INFO, "[INFO] finished fetching all thumbnails for: %@", (uint8_t *)&v5, 0xCu);
  }

  return objc_msgSend(*(id *)(a1 + 32), "completedWithResult:error:", 0, 0);
}

- (BOOL)isSandboxExtensionConsumed
{
  void *v3;
  uint64_t *p_documentURL;
  uint64_t v5;
  id v6;
  id v7;
  NSObject *v8;
  id v10;

  objc_msgSend(MEMORY[0x1E0D25D48], "manager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  p_documentURL = (uint64_t *)&self->_documentURL;
  v5 = *p_documentURL;
  v10 = 0;
  v6 = (id)objc_msgSend(v3, "permanentStorageForItemAtURL:allocateIfNone:error:", v5, 0, &v10);
  v7 = v10;

  if (v7)
  {
    fp_current_or_default_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[FPListRemoteVersionsOperation isSandboxExtensionConsumed].cold.1(p_documentURL, v7, v8);

  }
  return v7 == 0;
}

- (id)fp_prettyDescription
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3940];
  -[NSURL fp_shortDescription](self->_documentURL, "fp_shortDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("list remote versions for URL (%@)"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)includeCachedVersions
{
  return self->_includeCachedVersions;
}

- (void)setIncludeCachedVersions:(BOOL)a3
{
  self->_includeCachedVersions = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_documentURL, 0);
}

- (void)isSandboxExtensionConsumed
{
  uint64_t v4;
  void *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = *a1;
  objc_msgSend(a2, "fp_prettyDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412546;
  v7 = v4;
  v8 = 2112;
  v9 = v5;
  _os_log_error_impl(&dword_1A0A34000, a3, OS_LOG_TYPE_ERROR, "[ERROR] Failed to consume sandbox extension for URL %@. Error: %@", (uint8_t *)&v6, 0x16u);

}

@end
