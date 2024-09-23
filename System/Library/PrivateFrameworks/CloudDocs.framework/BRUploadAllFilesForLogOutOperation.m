@implementation BRUploadAllFilesForLogOutOperation

- (BRUploadAllFilesForLogOutOperation)init
{
  BRUploadAllFilesForLogOutOperation *v2;
  BRGlobalProgressProxy *v3;
  uint64_t v4;
  BRGlobalProgressProxy *progress;
  NSMutableDictionary *v6;
  NSMutableDictionary *errorsByContainerID;
  NSOperationQueue *v8;
  NSOperationQueue *opQueue;
  NSMutableArray *v10;
  NSMutableArray *hiddenContainersWithError;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)BRUploadAllFilesForLogOutOperation;
  v2 = -[BROperation init](&v13, sel_init);
  if (v2)
  {
    v3 = [BRGlobalProgressProxy alloc];
    v4 = -[BRGlobalProgressProxy initWithGlobalProgressKind:](v3, "initWithGlobalProgressKind:", *MEMORY[0x1E0CB30E0]);
    progress = v2->_progress;
    v2->_progress = (BRGlobalProgressProxy *)v4;

    v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    errorsByContainerID = v2->_errorsByContainerID;
    v2->_errorsByContainerID = v6;

    v8 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E0CB3828]);
    opQueue = v2->_opQueue;
    v2->_opQueue = v8;

    -[NSOperationQueue setMaxConcurrentOperationCount:](v2->_opQueue, "setMaxConcurrentOperationCount:", 8);
    v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    hiddenContainersWithError = v2->_hiddenContainersWithError;
    v2->_hiddenContainersWithError = v10;

  }
  return v2;
}

- (void)cancel
{
  BRUploadAllFilesForLogOutOperation *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)BRUploadAllFilesForLogOutOperation;
  -[BROperation cancel](&v4, sel_cancel);
  v3 = self;
  objc_sync_enter(v3);
  -[NSOperationQueue cancelAllOperations](v3->_opQueue, "cancelAllOperations");
  objc_sync_exit(v3);

}

- (NSString)description
{
  BRUploadAllFilesForLogOutOperation *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v2 = self;
  objc_sync_enter(v2);
  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = v2;
  v8.super_class = (Class)BRUploadAllFilesForLogOutOperation;
  -[BROperation description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSOperationQueue operations](v2->_opQueue, "operations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ sub=%@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v2);
  return (NSString *)v6;
}

- (void)evictAllFilesInGroup:(id)a3
{
  NSObject *v3;
  void *v4;
  NSObject *v5;
  uint64_t *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  NSObject *v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  NSObject *v36;
  BREvictItemOperation *v37;
  uint64_t *v38;
  NSObject *v39;
  id v40;
  void *v41;
  void *v42;
  const __CFString *v43;
  id obj;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  _QWORD v51[5];
  NSObject *v52;
  uint64_t v53;
  __int128 v54;
  uint64_t v55;
  __int128 v56;
  uint64_t v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  id v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  _QWORD v71[3];
  uint8_t buf[4];
  void *v73;
  __int16 v74;
  void *v75;
  __int16 v76;
  void *v77;
  _BYTE v78[128];
  _BYTE v79[128];
  void *v80;
  _BYTE v81[128];
  uint64_t v82;

  v82 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  memset(v71, 0, sizeof(v71));
  __brc_create_section(0, (uint64_t)"-[BRUploadAllFilesForLogOutOperation evictAllFilesInGroup:]", 70, v71);
  brc_bread_crumbs((uint64_t)"-[BRUploadAllFilesForLogOutOperation evictAllFilesInGroup:]", 70);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log(1);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[BRUploadAllFilesForLogOutOperation evictAllFilesInGroup:].cold.1();

  v69 = 0u;
  v70 = 0u;
  v67 = 0u;
  v68 = 0u;
  +[BRContainer documentContainers](BRContainer, "documentContainers");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v46 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v67, v81, 16);
  if (v46)
  {
    v6 = &v53;
    v45 = *(_QWORD *)v68;
    v43 = CFSTR("com.apple.CloudDocs");
    do
    {
      v47 = 0;
      do
      {
        if (*(_QWORD *)v68 != v45)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v67 + 1) + 8 * v47);
        brc_bread_crumbs((uint64_t)"-[BRUploadAllFilesForLogOutOperation evictAllFilesInGroup:]", 73);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log(1);
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v7, "identifier");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v73 = v10;
          v74 = 2112;
          v75 = v8;
          _os_log_impl(&dword_19CBF0000, v9, OS_LOG_TYPE_DEFAULT, "[NOTICE] evicting files in %@%@", buf, 0x16u);

        }
        objc_msgSend(v7, "documentsURL");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v80 = v11;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v80, 1);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = (void *)objc_msgSend(v12, "mutableCopy");

        if ((BRIsFPFSEnabled(v14, v15) & 1) == 0)
        {
          objc_msgSend(v7, "identifier");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v16, "isEqualToString:", v43);

          if (v17)
          {
            objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "removeAllObjects");
            objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            v65 = 0u;
            v66 = 0u;
            v63 = 0u;
            v64 = 0u;
            objc_msgSend(v18, "path");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v62 = 0;
            objc_msgSend(v48, "contentsOfDirectoryAtPath:error:", v19, &v62);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = v62;

            v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v63, v79, 16);
            if (v22)
            {
              v23 = *(_QWORD *)v64;
              do
              {
                for (i = 0; i != v22; ++i)
                {
                  if (*(_QWORD *)v64 != v23)
                    objc_enumerationMutation(v20);
                  objc_msgSend(v18, "URLByAppendingPathComponent:", *(_QWORD *)(*((_QWORD *)&v63 + 1) + 8 * i), v43);
                  v25 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v13, "addObject:", v25);

                }
                v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v63, v79, 16);
              }
              while (v22);
            }

            if (v21)
            {
              brc_bread_crumbs((uint64_t)"-[BRUploadAllFilesForLogOutOperation evictAllFilesInGroup:]", 91);
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              brc_default_log(0);
              v27 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v27, (os_log_type_t)0x90u))
              {
                *(_DWORD *)buf = 138412546;
                v73 = v18;
                v74 = 2112;
                v75 = v26;
                _os_log_error_impl(&dword_19CBF0000, v27, (os_log_type_t)0x90u, "[ERROR] couldn't enumerate %@%@", buf, 0x16u);
              }

            }
          }
        }
        brc_bread_crumbs((uint64_t)"-[BRUploadAllFilesForLogOutOperation evictAllFilesInGroup:]", 96);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log(1);
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412546;
          v73 = v13;
          v74 = 2112;
          v75 = v28;
          _os_log_debug_impl(&dword_19CBF0000, v29, OS_LOG_TYPE_DEBUG, "[DEBUG] evicting urls: %@%@", buf, 0x16u);
        }

        v60 = 0u;
        v61 = 0u;
        v58 = 0u;
        v59 = 0u;
        v30 = v13;
        v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v58, v78, 16);
        if (v31)
        {
          v32 = *(_QWORD *)v59;
          v49 = *(_QWORD *)v59;
          do
          {
            v33 = 0;
            do
            {
              if (*(_QWORD *)v59 != v32)
                objc_enumerationMutation(v30);
              v34 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * v33);
              dispatch_group_enter(v3);
              v54 = 0uLL;
              v55 = 0;
              __brc_create_section(0, (uint64_t)"-[BRUploadAllFilesForLogOutOperation evictAllFilesInGroup:]", 101, &v54);
              brc_bread_crumbs((uint64_t)"-[BRUploadAllFilesForLogOutOperation evictAllFilesInGroup:]", 101);
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              brc_default_log(1);
              v36 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
              {
                v38 = v6;
                v39 = v3;
                v40 = v30;
                v41 = (void *)v54;
                objc_msgSend(v34, "path");
                v42 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 134218498;
                v73 = v41;
                v74 = 2112;
                v75 = v42;
                v76 = 2112;
                v77 = v35;
                _os_log_debug_impl(&dword_19CBF0000, v36, OS_LOG_TYPE_DEBUG, "[DEBUG] ┣%llx evicting %@%@", buf, 0x20u);

                v30 = v40;
                v3 = v39;
                v6 = v38;
                v32 = v49;
              }

              v56 = v54;
              v57 = v55;
              v37 = -[BREvictItemOperation initWithURL:]([BREvictItemOperation alloc], "initWithURL:", v34);
              v51[0] = MEMORY[0x1E0C809B0];
              v51[1] = 3221225472;
              v51[2] = __59__BRUploadAllFilesForLogOutOperation_evictAllFilesInGroup___block_invoke;
              v51[3] = &unk_1E3DA63A0;
              *(_OWORD *)v6 = v56;
              v6[2] = v57;
              v51[4] = v34;
              v52 = v3;
              -[BREvictItemOperation setEvictionCompletionBlock:](v37, "setEvictionCompletionBlock:", v51);
              -[NSOperationQueue addOperation:](self->_opQueue, "addOperation:", v37);

              ++v33;
            }
            while (v31 != v33);
            v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v58, v78, 16);
          }
          while (v31);
        }

        ++v47;
      }
      while (v47 != v46);
      v46 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v67, v81, 16);
    }
    while (v46);
  }

  __brc_leave_section((uint64_t)v71);
}

void __59__BRUploadAllFilesForLogOutOperation_evictAllFilesInGroup___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  __int128 v9;
  uint64_t v10;
  uint8_t buf[4];
  uint64_t v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v9 = *(_OWORD *)(a1 + 48);
  v10 = *(_QWORD *)(a1 + 64);
  brc_bread_crumbs((uint64_t)"-[BRUploadAllFilesForLogOutOperation evictAllFilesInGroup:]_block_invoke", 104);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log(1);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(*(id *)(a1 + 32), "path");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218498;
    v12 = v9;
    v13 = 2112;
    v14 = v8;
    v15 = 2112;
    v16 = v4;
    _os_log_debug_impl(&dword_19CBF0000, v5, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx finished evicting data under %@%@", buf, 0x20u);

  }
  if (v3)
  {
    brc_bread_crumbs((uint64_t)"-[BRUploadAllFilesForLogOutOperation evictAllFilesInGroup:]_block_invoke", 105);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(0);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, (os_log_type_t)0x90u))
      __59__BRUploadAllFilesForLogOutOperation_evictAllFilesInGroup___block_invoke_cold_1();

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
  __brc_leave_section((uint64_t)&v9);

}

- (void)main
{
  const char *v4;

  v4 = "NO";
  if ((a1 & 1) != 0)
    v4 = "YES";
  *(_DWORD *)buf = 136315394;
  *(_QWORD *)(buf + 4) = v4;
  *((_WORD *)buf + 6) = 2112;
  *(_QWORD *)(buf + 14) = a2;
  _os_log_debug_impl(&dword_19CBF0000, log, OS_LOG_TYPE_DEBUG, "[DEBUG] Request to set should keep local data on Sign Out to [%s]%@", buf, 0x16u);
}

void __42__BRUploadAllFilesForLogOutOperation_main__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;

  v3 = a2;
  brc_bread_crumbs((uint64_t)"-[BRUploadAllFilesForLogOutOperation main]_block_invoke", 127);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log(1);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    __42__BRUploadAllFilesForLogOutOperation_main__block_invoke_cold_1();

  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v3;

}

void __42__BRUploadAllFilesForLogOutOperation_main__block_invoke_18(uint64_t a1, void *a2)
{
  id v4;
  void *v5;
  NSObject *v6;

  v4 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  brc_bread_crumbs((uint64_t)"-[BRUploadAllFilesForLogOutOperation main]_block_invoke", 140);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log(1);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    __42__BRUploadAllFilesForLogOutOperation_main__block_invoke_18_cold_1();

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __42__BRUploadAllFilesForLogOutOperation_main__block_invoke_19(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  _QWORD v13[4];
  id v14;
  id v15;
  _QWORD v16[3];
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  memset(v16, 0, sizeof(v16));
  __brc_create_section(0, (uint64_t)"-[BRUploadAllFilesForLogOutOperation main]_block_invoke", 152, v16);
  brc_bread_crumbs((uint64_t)"-[BRUploadAllFilesForLogOutOperation main]_block_invoke", 152);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log(1);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    __42__BRUploadAllFilesForLogOutOperation_main__block_invoke_19_cold_1();

  +[BRRemoteUserDefaults sharedDefaults](BRRemoteUserDefaults, "sharedDefaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "excludedFilenamesWorthWarningAtLogout");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  +[BRRemoteUserDefaults sharedDefaults](BRRemoteUserDefaults, "sharedDefaults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "excludedExtensionsWorthPreserving");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  +[BRContainer allContainers](BRContainer, "allContainers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __42__BRUploadAllFilesForLogOutOperation_main__block_invoke_21;
  v13[3] = &unk_1E3DA6418;
  v9 = v5;
  v14 = v9;
  v10 = v7;
  v15 = v10;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(v8, "br_any_of:", v13);

  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    brc_bread_crumbs((uint64_t)"-[BRUploadAllFilesForLogOutOperation main]_block_invoke", 160);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(1);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v18 = v11;
      _os_log_impl(&dword_19CBF0000, v12, OS_LOG_TYPE_DEFAULT, "[NOTICE] there are files that we're never going to upload on the file system%@", buf, 0xCu);
    }

  }
  __brc_leave_section((uint64_t)v16);
}

uint64_t __42__BRUploadAllFilesForLogOutOperation_main__block_invoke_21(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  brc_bread_crumbs((uint64_t)"-[BRUploadAllFilesForLogOutOperation main]_block_invoke", 156);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log(1);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v3, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138412546;
    v10 = v6;
    v11 = 2112;
    v12 = v4;
    _os_log_impl(&dword_19CBF0000, v5, OS_LOG_TYPE_DEFAULT, "[NOTICE] checking for excluded files in %@%@", (uint8_t *)&v9, 0x16u);

  }
  if (objc_msgSend(v3, "isDocumentScopePublic"))
    v7 = objc_msgSend(v3, "containsExcludedDocumentsOnTheFSWithExcludedButPreservedFilename:excludedButPreservedExtensions:andStampUploadedAppWithXattr:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), 1);
  else
    v7 = 0;

  return v7;
}

void __42__BRUploadAllFilesForLogOutOperation_main__block_invoke_26()
{
  void *v0;
  NSObject *v1;

  brc_bread_crumbs((uint64_t)"-[BRUploadAllFilesForLogOutOperation main]_block_invoke", 167);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log(1);
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEBUG))
    __42__BRUploadAllFilesForLogOutOperation_main__block_invoke_26_cold_1();

}

void __42__BRUploadAllFilesForLogOutOperation_main__block_invoke_27(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  __int128 v9;
  _QWORD block[4];
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint64_t v14;
  __int128 v15;
  uint64_t v16;

  v15 = *(_OWORD *)(a1 + 64);
  v16 = *(_QWORD *)(a1 + 80);
  brc_bread_crumbs((uint64_t)"-[BRUploadAllFilesForLogOutOperation main]_block_invoke", 172);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log(1);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    __42__BRUploadAllFilesForLogOutOperation_main__block_invoke_27_cold_2();

  v4 = dispatch_group_create();
  if ((BRIsFPFSEnabled(v4, v5) & 1) != 0 || (objc_msgSend(*(id *)(a1 + 32), "shouldKeepDataLocal") & 1) != 0)
  {
    brc_bread_crumbs((uint64_t)"-[BRUploadAllFilesForLogOutOperation main]_block_invoke", 178);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(1);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      __42__BRUploadAllFilesForLogOutOperation_main__block_invoke_27_cold_1();

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "evictAllFilesInGroup:", v4);
  }
  objc_msgSend(*(id *)(a1 + 32), "callbackQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__BRUploadAllFilesForLogOutOperation_main__block_invoke_28;
  block[3] = &unk_1E3DA6460;
  v13 = *(_OWORD *)(a1 + 64);
  v14 = *(_QWORD *)(a1 + 80);
  v9 = *(_OWORD *)(a1 + 32);
  v12 = *(_OWORD *)(a1 + 48);
  v11 = v9;
  dispatch_group_notify(v4, v8, block);

  __brc_leave_section((uint64_t)&v15);
}

void __42__BRUploadAllFilesForLogOutOperation_main__block_invoke_28(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  id v5;
  void *v6;
  __int128 v7;
  uint64_t v8;

  v7 = *(_OWORD *)(a1 + 64);
  v8 = *(_QWORD *)(a1 + 80);
  brc_bread_crumbs((uint64_t)"-[BRUploadAllFilesForLogOutOperation main]_block_invoke", 182);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log(1);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    __42__BRUploadAllFilesForLogOutOperation_main__block_invoke_28_cold_1();

  v4 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  if (v4 || (v4 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40)) != 0)
  {
    v5 = v4;
  }
  else
  {
    if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
    {
      v6 = 0;
      goto LABEL_7;
    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("BRCloudDocsErrorDomain"), 1000, 0, v7, v8);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;
LABEL_7:
  objc_msgSend(*(id *)(a1 + 32), "completedWithResult:error:", 0, v6, v7, v8);

  __brc_leave_section((uint64_t)&v7);
}

- (void)finishWithResult:(id)a3 error:(id)a4
{
  __CFString *v6;
  id v7;
  void *v8;
  NSObject *v9;
  const __CFString *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  NSObject *v16;
  objc_super v17;
  uint8_t buf[4];
  const __CFString *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = (__CFString *)a4;
  v7 = a3;
  brc_bread_crumbs((uint64_t)"-[BRUploadAllFilesForLogOutOperation finishWithResult:error:]", 199);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log(1);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = CFSTR("success");
    if (v6)
      v10 = v6;
    *(_DWORD *)buf = 138412546;
    v19 = v10;
    v20 = 2112;
    v21 = v8;
    _os_log_impl(&dword_19CBF0000, v9, OS_LOG_TYPE_DEFAULT, "[NOTICE] uploading all files for logout finished\n  status: %@%@", buf, 0x16u);
  }

  -[BRProgressProxy stop](self->_progress, "stop");
  brc_bread_crumbs((uint64_t)"-[BRUploadAllFilesForLogOutOperation finishWithResult:error:]", 203);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log(1);
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    -[BRUploadAllFilesForLogOutOperation finishWithResult:error:].cold.2();

  -[BRUploadAllFilesForLogOutOperation uploadAllFilesCompletionBlock](self, "uploadAllFilesCompletionBlock");
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)v13;
  if (v13)
  {
    (*(void (**)(uint64_t, __CFString *))(v13 + 16))(v13, v6);
    -[BRUploadAllFilesForLogOutOperation setUploadAllFilesCompletionBlock:](self, "setUploadAllFilesCompletionBlock:", 0);
  }

  brc_bread_crumbs((uint64_t)"-[BRUploadAllFilesForLogOutOperation finishWithResult:error:]", 206);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log(1);
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    -[BRUploadAllFilesForLogOutOperation finishWithResult:error:].cold.1();

  v17.receiver = self;
  v17.super_class = (Class)BRUploadAllFilesForLogOutOperation;
  -[BROperation finishWithResult:error:](&v17, sel_finishWithResult_error_, v7, v6);

}

- (id)uploadAllFilesCompletionBlock
{
  return objc_getProperty(self, a2, 304, 1);
}

- (void)setUploadAllFilesCompletionBlock:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 304);
}

- (BRGlobalProgressProxy)progress
{
  return (BRGlobalProgressProxy *)objc_getProperty(self, a2, 296, 1);
}

- (void)setProgress:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 296);
}

- (BOOL)shouldKeepDataLocal
{
  return self->_shouldKeepDataLocal;
}

- (void)setShouldKeepDataLocal:(BOOL)a3
{
  self->_shouldKeepDataLocal = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_opQueue, 0);
  objc_storeStrong((id *)&self->_hiddenContainersWithError, 0);
  objc_storeStrong((id *)&self->_errorsByContainerID, 0);
  objc_storeStrong(&self->_uploadAllFilesCompletionBlock, 0);
  objc_storeStrong((id *)&self->_progress, 0);
}

- (void)evictAllFilesInGroup:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_9_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_0(&dword_19CBF0000, v0, v1, "[DEBUG] ┏%llx evicting data%@");
  OUTLINED_FUNCTION_1();
}

void __59__BRUploadAllFilesForLogOutOperation_evictAllFilesInGroup___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_6();
  v3 = 2112;
  v4 = v0;
  _os_log_error_impl(&dword_19CBF0000, v1, (os_log_type_t)0x90u, "[ERROR] eviction error: %@%@", v2, 0x16u);
  OUTLINED_FUNCTION_1();
}

void __42__BRUploadAllFilesForLogOutOperation_main__block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_0(&dword_19CBF0000, v0, v1, "[DEBUG] Waiting for FPFS migration: %@%@");
  OUTLINED_FUNCTION_1();
}

void __42__BRUploadAllFilesForLogOutOperation_main__block_invoke_18_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_0(&dword_19CBF0000, v0, v1, "[DEBUG] uploading all files: %@%@");
  OUTLINED_FUNCTION_1();
}

void __42__BRUploadAllFilesForLogOutOperation_main__block_invoke_19_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_9_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_0(&dword_19CBF0000, v0, v1, "[DEBUG] ┏%llx checking for excluded files%@");
  OUTLINED_FUNCTION_1();
}

void __42__BRUploadAllFilesForLogOutOperation_main__block_invoke_26_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_3(&dword_19CBF0000, v0, v1, "[DEBUG] Request to set should keep local data on Sign Out done%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __42__BRUploadAllFilesForLogOutOperation_main__block_invoke_27_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_3(&dword_19CBF0000, v0, v1, "[DEBUG] Skip evicting all files%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __42__BRUploadAllFilesForLogOutOperation_main__block_invoke_27_cold_2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_9_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_0(&dword_19CBF0000, v0, v1, "[DEBUG] ┳%llx operations finished%@");
  OUTLINED_FUNCTION_1();
}

void __42__BRUploadAllFilesForLogOutOperation_main__block_invoke_28_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_9_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_0(&dword_19CBF0000, v0, v1, "[DEBUG] ┳%llx container eviction finished%@");
  OUTLINED_FUNCTION_1();
}

- (void)finishWithResult:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_3(&dword_19CBF0000, v0, v1, "[DEBUG] calling super%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)finishWithResult:error:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_3(&dword_19CBF0000, v0, v1, "[DEBUG] calling callback%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
