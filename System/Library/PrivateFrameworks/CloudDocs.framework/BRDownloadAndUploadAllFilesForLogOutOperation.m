@implementation BRDownloadAndUploadAllFilesForLogOutOperation

- (BRDownloadAndUploadAllFilesForLogOutOperation)init
{
  BRDownloadAndUploadAllFilesForLogOutOperation *v2;
  BRGlobalProgressProxy *v3;
  BRGlobalProgressProxy *progress;
  NSOperationQueue *v5;
  NSOperationQueue *internalQueue;
  NSMutableArray *v7;
  NSMutableArray *fileCoordinators;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)BRDownloadAndUploadAllFilesForLogOutOperation;
  v2 = -[BROperation init](&v10, sel_init);
  if (v2)
  {
    v3 = -[BRGlobalProgressProxy initWithGlobalProgressKind:]([BRGlobalProgressProxy alloc], "initWithGlobalProgressKind:", 0);
    progress = v2->_progress;
    v2->_progress = v3;

    v5 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E0CB3828]);
    internalQueue = v2->_internalQueue;
    v2->_internalQueue = v5;

    -[NSOperationQueue setMaxConcurrentOperationCount:](v2->_internalQueue, "setMaxConcurrentOperationCount:", 1);
    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    fileCoordinators = v2->_fileCoordinators;
    v2->_fileCoordinators = v7;

  }
  return v2;
}

- (void)cancel
{
  BRDownloadAndUploadAllFilesForLogOutOperation *v3;
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  NSObject *v10;
  id *p_isa;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  objc_super v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  void *v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v16.receiver = self;
  v16.super_class = (Class)BRDownloadAndUploadAllFilesForLogOutOperation;
  -[BROperation cancel](&v16, sel_cancel);
  v3 = self;
  objc_sync_enter(v3);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  p_isa = (id *)&v3->super.super.super.isa;
  v4 = v3->_fileCoordinators;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v21, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v13;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v4);
        v8 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v7);
        brc_bread_crumbs((uint64_t)"-[BRDownloadAndUploadAllFilesForLogOutOperation cancel]", 49);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log(1);
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412546;
          v18 = v8;
          v19 = 2112;
          v20 = v9;
          _os_log_debug_impl(&dword_19CBF0000, v10, OS_LOG_TYPE_DEBUG, "[DEBUG] Cancelling %@%@", buf, 0x16u);
        }

        objc_msgSend(v8, "cancel");
        ++v7;
      }
      while (v5 != v7);
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v21, 16);
    }
    while (v5);
  }

  objc_msgSend(p_isa[41], "cancel");
  objc_sync_exit(p_isa);

}

- (void)main
{
  void *v3;
  NSObject *v4;
  NSObject *v5;
  BRDownloadAndUploadAllFilesForLogOutOperation *v6;
  BRUploadAllFilesForLogOutOperation *v7;
  BRUploadAllFilesForLogOutOperation *uploadOp;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  BRDownloadAndUploadAllFilesForLogOutOperation *v15;
  NSObject *v16;
  _QWORD block[7];
  _QWORD v18[5];
  NSObject *v19;
  BRDownloadAndUploadAllFilesForLogOutOperation *v20;
  _QWORD *v21;
  _QWORD v22[4];
  NSObject *v23;
  __int128 *p_buf;
  _QWORD v25[5];
  id v26;
  uint8_t v27[4];
  void *v28;
  __int16 v29;
  void *v30;
  __int128 buf;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  -[BRProgressProxy start](self->_progress, "start");
  brc_bread_crumbs((uint64_t)"-[BRDownloadAndUploadAllFilesForLogOutOperation main]", 65);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log(1);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_19CBF0000, v4, OS_LOG_TYPE_DEFAULT, "[NOTICE] downloading and uploading all files because we're logging out%@", (uint8_t *)&buf, 0xCu);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__10;
  v34 = __Block_byref_object_dispose__10;
  v35 = 0;
  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x3032000000;
  v25[3] = __Block_byref_object_copy__10;
  v25[4] = __Block_byref_object_dispose__10;
  v26 = 0;
  v5 = dispatch_group_create();
  v6 = self;
  objc_sync_enter(v6);
  v7 = objc_alloc_init(BRUploadAllFilesForLogOutOperation);
  uploadOp = v6->_uploadOp;
  v6->_uploadOp = v7;

  -[BRUploadAllFilesForLogOutOperation setShouldKeepDataLocal:](v6->_uploadOp, "setShouldKeepDataLocal:", 1);
  if (-[BROperation finishIfCancelled](v6, "finishIfCancelled"))
  {
    objc_sync_exit(v6);
  }
  else
  {
    dispatch_group_enter(v5);
    v9 = MEMORY[0x1E0C809B0];
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __53__BRDownloadAndUploadAllFilesForLogOutOperation_main__block_invoke;
    v22[3] = &unk_1E3DA63F0;
    p_buf = &buf;
    v10 = v5;
    v23 = v10;
    -[BRUploadAllFilesForLogOutOperation setUploadAllFilesCompletionBlock:](v6->_uploadOp, "setUploadAllFilesCompletionBlock:", v22);
    -[NSOperationQueue addOperation:](v6->_internalQueue, "addOperation:", v6->_uploadOp);

    objc_sync_exit(v6);
    dispatch_group_enter(v10);
    +[BRContainer documentContainers](BRContainer, "documentContainers");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    brc_bread_crumbs((uint64_t)"-[BRDownloadAndUploadAllFilesForLogOutOperation main]", 93);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(1);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v27 = 138412546;
      v28 = v11;
      v29 = 2112;
      v30 = v12;
      _os_log_impl(&dword_19CBF0000, v13, OS_LOG_TYPE_DEFAULT, "[NOTICE] forcing a sync down on containers: %@%@", v27, 0x16u);
    }

    v18[0] = v9;
    v18[1] = 3221225472;
    v18[2] = __53__BRDownloadAndUploadAllFilesForLogOutOperation_main__block_invoke_8;
    v18[3] = &unk_1E3DA71A0;
    v18[4] = v6;
    v14 = v10;
    v19 = v14;
    v15 = v11;
    v20 = v15;
    v21 = v25;
    +[BRContainer forceRefreshContainers:completion:](BRContainer, "forceRefreshContainers:completion:", v15, v18);
    -[BROperation callbackQueue](v6, "callbackQueue");
    v16 = objc_claimAutoreleasedReturnValue();
    block[0] = v9;
    block[1] = 3221225472;
    block[2] = __53__BRDownloadAndUploadAllFilesForLogOutOperation_main__block_invoke_15;
    block[3] = &unk_1E3DA71C8;
    block[4] = v6;
    block[5] = &buf;
    block[6] = v25;
    dispatch_group_notify(v14, v16, block);

    v6 = v15;
  }

  _Block_object_dispose(v25, 8);
  _Block_object_dispose(&buf, 8);

}

void __53__BRDownloadAndUploadAllFilesForLogOutOperation_main__block_invoke(uint64_t a1, void *a2)
{
  __CFString *v4;
  void *v5;
  NSObject *v6;
  const __CFString *v7;
  int v8;
  const __CFString *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  brc_bread_crumbs((uint64_t)"-[BRDownloadAndUploadAllFilesForLogOutOperation main]_block_invoke", 82);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log(1);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = CFSTR("success");
    if (v4)
      v7 = v4;
    v8 = 138412546;
    v9 = v7;
    v10 = 2112;
    v11 = v5;
    _os_log_impl(&dword_19CBF0000, v6, OS_LOG_TYPE_DEFAULT, "[NOTICE] done uploading\n status: %@%@", (uint8_t *)&v8, 0x16u);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __53__BRDownloadAndUploadAllFilesForLogOutOperation_main__block_invoke_8(uint64_t a1, void *a2)
{
  void *v3;
  NSObject *v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  id v23;
  uint64_t v24;
  __int128 v25;
  id v26;
  id obj;
  void *v28;
  _QWORD v29[4];
  id v30;
  uint64_t v31;
  id v32;
  id v33;
  uint64_t v34;
  __int128 v35;
  uint64_t v36;
  __int128 v37;
  uint64_t v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  void *v43;
  _BYTE buf[24];
  id v45;
  __int16 v46;
  void *v47;
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v26 = a2;
  brc_bread_crumbs((uint64_t)"-[BRDownloadAndUploadAllFilesForLogOutOperation main]_block_invoke", 95);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log(1);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    __53__BRDownloadAndUploadAllFilesForLogOutOperation_main__block_invoke_8_cold_1((uint64_t)v26, (uint64_t)v3, v4);

  if ((objc_msgSend(*(id *)(a1 + 32), "finishIfCancelled") & 1) == 0)
  {
    v41 = 0u;
    v42 = 0u;
    v40 = 0u;
    v39 = 0u;
    obj = *(id *)(a1 + 48);
    v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v48, 16);
    if (v5)
    {
      v7 = *(_QWORD *)v40;
      *(_QWORD *)&v6 = 134218754;
      v25 = v6;
      while (2)
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v40 != v7)
            objc_enumerationMutation(obj);
          v9 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
          objc_msgSend(v9, "documentsURL", v25);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          if (v10 && objc_msgSend(v9, "isDocumentScopePublic"))
          {
            v11 = objc_alloc_init(MEMORY[0x1E0CB3600]);
            objc_msgSend(v9, "registerCurrentProcessAsPriorityHintWithError:", 0);
            objc_msgSend(MEMORY[0x1E0CB35F8], "readingIntentWithURL:options:", v10, 131073);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            v12 = *(id *)(a1 + 32);
            objc_sync_enter(v12);
            objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 304), "addObject:", v11);
            if (objc_msgSend(*(id *)(a1 + 32), "isCancelled"))
            {
              objc_msgSend(v11, "cancel");
              objc_sync_exit(v12);

              goto LABEL_19;
            }
            objc_sync_exit(v12);

            objc_msgSend(v9, "identifier");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v37 = 0uLL;
            v38 = 0;
            __brc_create_section(0, (uint64_t)"-[BRDownloadAndUploadAllFilesForLogOutOperation main]_block_invoke", 123, &v37);
            brc_bread_crumbs((uint64_t)"-[BRDownloadAndUploadAllFilesForLogOutOperation main]_block_invoke", 123);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            brc_default_log(1);
            v15 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = v25;
              *(_QWORD *)&buf[4] = v37;
              *(_WORD *)&buf[12] = 2112;
              *(_QWORD *)&buf[14] = v13;
              *(_WORD *)&buf[22] = 2112;
              v45 = v11;
              v46 = 2112;
              v47 = v14;
              _os_log_debug_impl(&dword_19CBF0000, v15, OS_LOG_TYPE_DEBUG, "[DEBUG] ┣%llx taking a coordinated read recursive on %@ using %@%@", buf, 0x2Au);
            }

            *(_OWORD *)buf = v37;
            *(_QWORD *)&buf[16] = v38;
            dispatch_group_enter(*(dispatch_group_t *)(a1 + 40));
            v43 = v28;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v43, 1);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = *(_QWORD *)(a1 + 32);
            v18 = v5;
            v19 = v7;
            v20 = *(_QWORD *)(v17 + 320);
            v29[0] = MEMORY[0x1E0C809B0];
            v29[1] = 3221225472;
            v29[2] = __53__BRDownloadAndUploadAllFilesForLogOutOperation_main__block_invoke_12;
            v29[3] = &unk_1E3DA7178;
            v35 = *(_OWORD *)buf;
            v36 = *(_QWORD *)&buf[16];
            v21 = *(_QWORD *)(a1 + 56);
            v30 = v13;
            v31 = v17;
            v34 = v21;
            v32 = v11;
            v33 = *(id *)(a1 + 40);
            v22 = v11;
            v23 = v13;
            v24 = v20;
            v7 = v19;
            v5 = v18;
            objc_msgSend(v22, "coordinateAccessWithIntents:queue:byAccessor:", v16, v24, v29);

          }
        }
        v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v48, 16);
        if (v5)
          continue;
        break;
      }
    }
LABEL_19:

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));

}

void __53__BRDownloadAndUploadAllFilesForLogOutOperation_main__block_invoke_12(uint64_t a1, void *a2)
{
  __CFString *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  const __CFString *v15;
  __int128 v16;
  uint64_t v17;
  uint64_t v18;
  __CFString *v19;
  uint8_t buf[4];
  uint64_t v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  const __CFString *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v16 = *(_OWORD *)(a1 + 72);
  v17 = *(_QWORD *)(a1 + 88);
  brc_bread_crumbs((uint64_t)"-[BRDownloadAndUploadAllFilesForLogOutOperation main]_block_invoke", 128);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log(1);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v14 = *(_QWORD *)(a1 + 32);
    v15 = CFSTR("success");
    if (v3)
      v15 = v3;
    *(_DWORD *)buf = 134218754;
    v21 = v16;
    v22 = 2112;
    v23 = v14;
    v24 = 2112;
    v25 = v15;
    v26 = 2112;
    v27 = v4;
    _os_log_debug_impl(&dword_19CBF0000, v5, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx obtained a coordinated read on %@: %@%@", buf, 0x2Au);
  }

  if (v3)
  {
    v6 = (void *)MEMORY[0x1E0CB35C8];
    v18 = *MEMORY[0x1E0CB3388];
    v19 = v3;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "errorWithDomain:code:userInfo:", CFSTR("BRCloudDocsErrorDomain"), 1001, v7);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;

  }
  v11 = *(id *)(a1 + 40);
  objc_sync_enter(v11);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 304), "removeObject:", *(_QWORD *)(a1 + 48));
  brc_bread_crumbs((uint64_t)"-[BRDownloadAndUploadAllFilesForLogOutOperation main]_block_invoke", 135);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log(1);
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    __53__BRDownloadAndUploadAllFilesForLogOutOperation_main__block_invoke_12_cold_1((uint64_t)v12, (uint64_t)buf, objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 304), "count"), v13);

  objc_sync_exit(v11);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
  __brc_leave_section((uint64_t)&v16);

}

void __53__BRDownloadAndUploadAllFilesForLogOutOperation_main__block_invoke_15(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  id v5;

  brc_bread_crumbs((uint64_t)"-[BRDownloadAndUploadAllFilesForLogOutOperation main]_block_invoke", 148);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log(1);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    __53__BRDownloadAndUploadAllFilesForLogOutOperation_main__block_invoke_15_cold_1((uint64_t)v2, v3);

  if ((objc_msgSend(*(id *)(a1 + 32), "finishIfCancelled") & 1) == 0)
  {
    v4 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    if (!v4)
      v4 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    v5 = v4;
    objc_msgSend(*(id *)(a1 + 32), "completedWithResult:error:", 0, v5);

  }
}

- (void)finishWithResult:(id)a3 error:(id)a4
{
  __CFString *v6;
  id v7;
  void *v8;
  NSObject *v9;
  const __CFString *v10;
  uint64_t v11;
  void *v12;
  objc_super v13;
  uint8_t buf[4];
  const __CFString *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = (__CFString *)a4;
  v7 = a3;
  brc_bread_crumbs((uint64_t)"-[BRDownloadAndUploadAllFilesForLogOutOperation finishWithResult:error:]", 166);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log(1);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = CFSTR("success");
    if (v6)
      v10 = v6;
    *(_DWORD *)buf = 138412546;
    v15 = v10;
    v16 = 2112;
    v17 = v8;
    _os_log_impl(&dword_19CBF0000, v9, OS_LOG_TYPE_DEFAULT, "[NOTICE] uploading and downloading all files for logout finished\n status: %@%@", buf, 0x16u);
  }

  -[BRDownloadAndUploadAllFilesForLogOutOperation downloadAllFilesCompletionBlock](self, "downloadAllFilesCompletionBlock");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  if (v11)
  {
    (*(void (**)(uint64_t, __CFString *))(v11 + 16))(v11, v6);
    -[BRDownloadAndUploadAllFilesForLogOutOperation setDownloadAllFilesCompletionBlock:](self, "setDownloadAllFilesCompletionBlock:", 0);
  }

  -[BRProgressProxy stop](self->_progress, "stop");
  +[BRContainer unregisterCurrentProcessAsPriorityHint](BRContainer, "unregisterCurrentProcessAsPriorityHint");
  v13.receiver = self;
  v13.super_class = (Class)BRDownloadAndUploadAllFilesForLogOutOperation;
  -[BROperation finishWithResult:error:](&v13, sel_finishWithResult_error_, v7, v6);

}

- (id)downloadAllFilesCompletionBlock
{
  return objc_getProperty(self, a2, 312, 1);
}

- (void)setDownloadAllFilesCompletionBlock:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 312);
}

- (BRGlobalProgressProxy)progress
{
  return (BRGlobalProgressProxy *)objc_getProperty(self, a2, 296, 1);
}

- (void)setProgress:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 296);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uploadOp, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
  objc_storeStrong(&self->_downloadAllFilesCompletionBlock, 0);
  objc_storeStrong((id *)&self->_fileCoordinators, 0);
  objc_storeStrong((id *)&self->_progress, 0);
}

void __53__BRDownloadAndUploadAllFilesForLogOutOperation_main__block_invoke_8_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  OUTLINED_FUNCTION_7(&dword_19CBF0000, a3, (uint64_t)a3, "[DEBUG] done forcing sync down: %@%@", (uint8_t *)&v3);
}

void __53__BRDownloadAndUploadAllFilesForLogOutOperation_main__block_invoke_12_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, NSObject *a4)
{
  *(_DWORD *)a2 = 134218242;
  *(_QWORD *)(a2 + 4) = a3;
  *(_WORD *)(a2 + 12) = 2112;
  *(_QWORD *)(a2 + 14) = a1;
  OUTLINED_FUNCTION_7(&dword_19CBF0000, a4, a3, "[DEBUG] still waiting for %ld container(s) to download%@", (uint8_t *)a2);
}

void __53__BRDownloadAndUploadAllFilesForLogOutOperation_main__block_invoke_15_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_19CBF0000, a2, OS_LOG_TYPE_DEBUG, "[DEBUG] completed download and upload%@", (uint8_t *)&v2, 0xCu);
}

@end
