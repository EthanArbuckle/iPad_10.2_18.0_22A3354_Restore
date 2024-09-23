@implementation BRListNonLocalVersionsOperation

- (NSError)error
{
  return 0;
}

- (BRListNonLocalVersionsOperation)initWithDocumentURL:(id)a3
{
  id v5;
  BRListNonLocalVersionsOperation *v6;
  BRListNonLocalVersionsOperation *v7;
  NSMutableArray *v8;
  NSMutableArray *versions;
  NSMutableDictionary *v10;
  NSMutableDictionary *versionsByEtag;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)BRListNonLocalVersionsOperation;
  v6 = -[BRListNonLocalVersionsOperation init](&v13, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_documentURL, a3);
    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    versions = v7->_versions;
    v7->_versions = v8;

    v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    versionsByEtag = v7->_versionsByEtag;
    v7->_versionsByEtag = v10;

  }
  return v7;
}

- (void)dealloc
{
  objc_super v3;

  -[BRListNonLocalVersionsOperation _senderInvalidate](self, "_senderInvalidate");
  v3.receiver = self;
  v3.super_class = (Class)BRListNonLocalVersionsOperation;
  -[BRListNonLocalVersionsOperation dealloc](&v3, sel_dealloc);
}

- (BOOL)isConcurrent
{
  return 1;
}

- (void)setExecuting:(BOOL)a3
{
  -[BRListNonLocalVersionsOperation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("isExecuting"));
  self->_executing = a3;
  -[BRListNonLocalVersionsOperation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("isExecuting"));
}

- (void)setFinished:(BOOL)a3
{
  -[BRListNonLocalVersionsOperation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("isFinished"));
  self->_finished = a3;
  -[BRListNonLocalVersionsOperation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("isFinished"));
}

- (void)_senderInvalidate
{
  BRNonLocalVersionSending *sender;

  -[BRNonLocalVersionSending invalidate](self->_sender, "invalidate");
  sender = self->_sender;
  self->_sender = 0;

}

- (void)cancel
{
  BRListNonLocalVersionsOperation *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)BRListNonLocalVersionsOperation;
  -[BRListNonLocalVersionsOperation cancel](&v4, sel_cancel);
  v3 = self;
  objc_sync_enter(v3);
  if (-[BRListNonLocalVersionsOperation isExecuting](v3, "isExecuting"))
    -[BRListNonLocalVersionsOperation __finishIfCancelled](v3, "__finishIfCancelled");
  objc_sync_exit(v3);

}

- (BOOL)__finishIfCancelled
{
  int v3;
  void *v4;
  BOOL v5;

  if (-[BRListNonLocalVersionsOperation isFinished](self, "isFinished"))
  {
    LOBYTE(v3) = 1;
  }
  else
  {
    v3 = -[BRListNonLocalVersionsOperation isCancelled](self, "isCancelled");
    if (v3)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 3072, 0);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = -[BRListNonLocalVersionsOperation __advanceToState:result:error:](self, "__advanceToState:result:error:", 2, 0, v4);

      LOBYTE(v3) = v5;
    }
  }
  return v3;
}

- (BOOL)__advanceToState:(char)a3 result:(id)a4 error:(id)a5
{
  int v6;
  id v8;
  id v9;
  int state;
  void (**fetchingVersionsDoneBlock)(id, id, id);
  void *v12;
  NSObject *v13;
  BOOL v14;
  int v16;
  BRListNonLocalVersionsOperation *v17;
  __int16 v18;
  id v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v6 = a3;
  v22 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  if (!-[BRListNonLocalVersionsOperation isFinished](self, "isFinished"))
  {
    state = self->_state;
    if (state < v6)
    {
      while (state != 1)
      {
        if (!(_BYTE)state)
        {
          fetchingVersionsDoneBlock = (void (**)(id, id, id))self->_fetchingVersionsDoneBlock;
          if (fetchingVersionsDoneBlock)
          {
            fetchingVersionsDoneBlock[2](fetchingVersionsDoneBlock, v8, v9);
            -[BRListNonLocalVersionsOperation setFetchingVersionsDoneBlock:](self, "setFetchingVersionsDoneBlock:", 0);
          }
          LOBYTE(state) = 1;
          goto LABEL_9;
        }
LABEL_10:
        if (v6 <= (char)state)
          goto LABEL_11;
      }
      LOBYTE(state) = 2;
LABEL_9:
      self->_state = state;
      goto LABEL_10;
    }
LABEL_11:
    if (state != 2)
    {
      v14 = 0;
      goto LABEL_17;
    }
    -[BRListNonLocalVersionsOperation setExecuting:](self, "setExecuting:", 0);
    -[BRListNonLocalVersionsOperation setFinished:](self, "setFinished:", 1);
    brc_bread_crumbs((uint64_t)"-[BRListNonLocalVersionsOperation __advanceToState:result:error:]", 233);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(1);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      v16 = 138412802;
      v17 = self;
      v18 = 2112;
      v19 = v9;
      v20 = 2112;
      v21 = v12;
      _os_log_debug_impl(&dword_19CBF0000, v13, OS_LOG_TYPE_DEBUG, "[DEBUG] %@ did finish with error %@%@", (uint8_t *)&v16, 0x20u);
    }

    -[BRListNonLocalVersionsOperation _senderInvalidate](self, "_senderInvalidate");
  }
  v14 = 1;
LABEL_17:

  return v14;
}

- (BOOL)_advanceToState:(char)a3 result:(id)a4 error:(id)a5
{
  uint64_t v6;
  id v8;
  id v9;
  BRListNonLocalVersionsOperation *v10;
  char v11;

  v6 = a3;
  v8 = a4;
  v9 = a5;
  v10 = self;
  objc_sync_enter(v10);
  if (-[BRListNonLocalVersionsOperation __finishIfCancelled](v10, "__finishIfCancelled"))
    v11 = 1;
  else
    v11 = -[BRListNonLocalVersionsOperation __advanceToState:result:error:](v10, "__advanceToState:result:error:", v6, v8, v9);
  objc_sync_exit(v10);

  return v11;
}

- (BOOL)_setVersionStoreForDocumentAtURL:(id)a3 error:(id *)a4
{
  void *v6;
  id v7;
  void *v8;
  GSPermanentStorage *v9;
  GSPermanentStorage *versionsStore;

  v6 = (void *)MEMORY[0x1E0D25D48];
  v7 = a3;
  objc_msgSend(v6, "manager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "permanentStorageForItemAtURL:allocateIfNone:error:", v7, 0, a4);
  v9 = (GSPermanentStorage *)objc_claimAutoreleasedReturnValue();

  versionsStore = self->_versionsStore;
  self->_versionsStore = v9;

  LOBYTE(v9) = self->_versionsStore != 0;
  return (char)v9;
}

- (void)start
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3_0(&dword_19CBF0000, v0, v1, "[DEBUG] not starting %@%@");
  OUTLINED_FUNCTION_1();
}

void __40__BRListNonLocalVersionsOperation_start__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  __int16 v17;
  id v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  brc_bread_crumbs((uint64_t)"-[BRListNonLocalVersionsOperation start]_block_invoke", 278);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log(0);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, (os_log_type_t)0x90u))
  {
    v6 = *(_QWORD *)(a1 + 32);
    v15 = 138412802;
    v16 = v6;
    v17 = 2112;
    v18 = v3;
    v19 = 2112;
    v20 = v4;
    _os_log_error_impl(&dword_19CBF0000, v5, (os_log_type_t)0x90u, "[ERROR] failed getting a sender for '%@' - %@%@", (uint8_t *)&v15, 0x20u);
  }

  if (!v3)
  {
    brc_bread_crumbs((uint64_t)"-[BRListNonLocalVersionsOperation start]_block_invoke", 279);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(0);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      __40__BRListNonLocalVersionsOperation_start__block_invoke_cold_1((uint64_t)v7, v8, v9, v10, v11, v12, v13, v14);

  }
  objc_msgSend(*(id *)(a1 + 40), "_advanceToState:result:error:", 2, 0, v3);

}

void __40__BRListNonLocalVersionsOperation_start__block_invoke_88(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  char v15;
  uint64_t v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  NSObject *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  _QWORD v39[5];
  id v40;
  _QWORD v41[4];
  id v42;
  id v43;
  uint64_t v44;
  uint8_t buf[4];
  id v46;
  __int16 v47;
  id v48;
  __int16 v49;
  void *v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (a2)
  {
    v9 = MEMORY[0x1E0C809B0];
    v41[0] = MEMORY[0x1E0C809B0];
    v41[1] = 3221225472;
    v41[2] = __40__BRListNonLocalVersionsOperation_start__block_invoke_89;
    v41[3] = &unk_1E3DA57A8;
    v42 = *(id *)(a1 + 32);
    v43 = v8;
    v44 = *(_QWORD *)(a1 + 40);
    v10 = v8;
    objc_msgSend(a2, "remoteObjectProxyWithErrorHandler:", v41);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = *(_QWORD *)(a1 + 40);
    v13 = *(void **)(v12 + 280);
    *(_QWORD *)(v12 + 280) = v11;

    v14 = *(void **)(a1 + 40);
    v40 = v10;
    v15 = objc_msgSend(v14, "_setVersionStoreForDocumentAtURL:error:", v7, &v40);
    v8 = v40;

    if ((v15 & 1) != 0)
    {
      v16 = *(_QWORD *)(a1 + 40);
      v17 = *(void **)(v16 + 280);
      v39[0] = v9;
      v39[1] = 3221225472;
      v39[2] = __40__BRListNonLocalVersionsOperation_start__block_invoke_90;
      v39[3] = &unk_1E3DA47F0;
      v39[4] = v16;
      objc_msgSend(v17, "listNonLocalVersionsWithReply:", v39);
    }
    else
    {
      brc_bread_crumbs((uint64_t)"-[BRListNonLocalVersionsOperation start]_block_invoke", 298);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log(0);
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, (os_log_type_t)0x90u))
      {
        *(_DWORD *)buf = 138412802;
        v46 = v7;
        v47 = 2112;
        v48 = v8;
        v49 = 2112;
        v50 = v20;
        _os_log_error_impl(&dword_19CBF0000, v21, (os_log_type_t)0x90u, "[ERROR] failed setting the version store for '%@' - %@%@", buf, 0x20u);
      }

      if (!v8)
      {
        brc_bread_crumbs((uint64_t)"-[BRListNonLocalVersionsOperation start]_block_invoke", 299);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log(0);
        v32 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_FAULT))
          __40__BRListNonLocalVersionsOperation_start__block_invoke_cold_1((uint64_t)v31, v32, v33, v34, v35, v36, v37, v38);

      }
      objc_msgSend(*(id *)(a1 + 40), "_advanceToState:result:error:", 2, 0, v8);
    }

  }
  else
  {
    brc_bread_crumbs((uint64_t)"-[BRListNonLocalVersionsOperation start]_block_invoke", 286);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(0);
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, (os_log_type_t)0x90u))
    {
      v22 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 138412802;
      v46 = v22;
      v47 = 2112;
      v48 = v8;
      v49 = 2112;
      v50 = v18;
      _os_log_error_impl(&dword_19CBF0000, v19, (os_log_type_t)0x90u, "[ERROR] failed getting a sender for '%@' - %@%@", buf, 0x20u);
    }

    if (!v8)
    {
      brc_bread_crumbs((uint64_t)"-[BRListNonLocalVersionsOperation start]_block_invoke", 287);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log(0);
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
        __40__BRListNonLocalVersionsOperation_start__block_invoke_cold_1((uint64_t)v23, v24, v25, v26, v27, v28, v29, v30);

    }
    objc_msgSend(*(id *)(a1 + 40), "_advanceToState:result:error:", 2, 0, v8);
  }

}

void __40__BRListNonLocalVersionsOperation_start__block_invoke_89(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;

  v3 = a2;
  brc_bread_crumbs((uint64_t)"-[BRListNonLocalVersionsOperation start]_block_invoke", 293);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log(0);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, (os_log_type_t)0x90u))
    __40__BRListNonLocalVersionsOperation_start__block_invoke_89_cold_1(a1, (uint64_t)v4, v5);

  objc_msgSend(*(id *)(a1 + 48), "_advanceToState:result:error:", 2, 0, v3);
}

uint64_t __40__BRListNonLocalVersionsOperation_start__block_invoke_90(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v3;

  v2 = *(_QWORD **)(a1 + 32);
  if (a2)
    v3 = 0;
  else
    v3 = v2[32];
  return objc_msgSend(v2, "_advanceToState:result:error:", 2, v3, a2);
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  const char *v7;
  int v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[NSURL path](self->_documentURL, "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[NSMutableArray count](self->_versions, "count");
  if ((-[BRListNonLocalVersionsOperation isCancelled](self, "isCancelled") & 1) != 0)
  {
    v7 = "cancelled";
  }
  else if (-[BRListNonLocalVersionsOperation isExecuting](self, "isExecuting"))
  {
    v7 = "executing";
  }
  else if (-[BRListNonLocalVersionsOperation isFinished](self, "isFinished"))
  {
    v7 = "finished";
  }
  else
  {
    v8 = -[BRListNonLocalVersionsOperation isReady](self, "isReady");
    v7 = "not ready";
    if (v8)
      v7 = "ready";
  }
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ url:'%@' versions:%u %s>"), v4, v5, v6, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v9;
}

- (void)_addVersion:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  NSMutableDictionary *versionsByEtag;
  void *v8;

  v4 = a3;
  brc_bread_crumbs((uint64_t)"-[BRListNonLocalVersionsOperation _addVersion:]", 321);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log(1);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[BRListNonLocalVersionsOperation _addVersion:].cold.1();

  versionsByEtag = self->_versionsByEtag;
  objc_msgSend(v4, "etag");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](versionsByEtag, "setObject:forKey:", v4, v8);

  -[NSMutableArray addObject:](self->_versions, "addObject:", v4);
}

- (void)newFaultVersionAtURL:(id)a3 faultURL:(id)a4 faultExtension:(id)a5 etag:(id)a6 hasThumbnail:(BOOL)a7 displayName:(id)a8 lastEditorDeviceName:(id)a9 lastEditorNameComponents:(id)a10 modificationDate:(id)a11
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  BRNonLocalVersion *v24;
  id v25;
  id v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  int v31;
  id v32;
  BRListNonLocalVersionsOperation *v33;
  _BOOL4 v34;
  uint8_t buf[4];
  id v36;
  __int16 v37;
  int v38;
  __int16 v39;
  void *v40;
  uint64_t v41;

  v34 = a7;
  v41 = *MEMORY[0x1E0C80C00];
  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a6;
  v20 = a8;
  v21 = a9;
  v22 = a10;
  v23 = a11;
  -[NSMutableDictionary objectForKey:](self->_versionsByEtag, "objectForKey:", v19);
  v24 = (BRNonLocalVersion *)objc_claimAutoreleasedReturnValue();
  if (v24)
    goto LABEL_13;
  v33 = self;
  _CFURLPromiseSetPhysicalURL();
  v32 = v16;
  v25 = v20;
  if (!objc_msgSend(v18, "length"))
    goto LABEL_8;
  MEMORY[0x1A1AD7D20](v17, v18);
  v26 = objc_retainAutorelease(v18);
  objc_msgSend(v26, "bytes");
  if (sandbox_extension_consume() < 0)
  {
    v31 = *__error();
    brc_bread_crumbs((uint64_t)"-[BRListNonLocalVersionsOperation newFaultVersionAtURL:faultURL:faultExtension:etag:hasThumbnail:displayName:lastEditorDeviceName:lastEditorNameComponents:modificationDate:]", 346);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(0);
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, (os_log_type_t)0x90u))
    {
      *(_DWORD *)buf = 138412802;
      v36 = v26;
      v37 = 1024;
      v38 = v31;
      v39 = 2112;
      v40 = v28;
      _os_log_error_impl(&dword_19CBF0000, v29, (os_log_type_t)0x90u, "[ERROR] Failed to consume extension %@ %{errno}d%@", buf, 0x1Cu);
    }

    *__error() = v31;
LABEL_8:
    v27 = (void *)_CFURLCopyPropertiesOfPromiseAtURL();
    goto LABEL_9;
  }
  v27 = (void *)_CFURLCopyPropertiesOfPromiseAtURL();
  sandbox_extension_release();
LABEL_9:
  if (v27)
  {
    objc_msgSend(v27, "objectForKey:", *MEMORY[0x1E0C99998]);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    CFRelease(v27);
  }
  else
  {
    v30 = 0;
  }
  v16 = v32;
  v24 = -[BRNonLocalVersion initWithURL:physicalURL:size:extension:etag:hasThumbnail:displayName:lastEditorDeviceName:lastEditorNameComponents:modificationDate:versionsStore:]([BRNonLocalVersion alloc], "initWithURL:physicalURL:size:extension:etag:hasThumbnail:displayName:lastEditorDeviceName:lastEditorNameComponents:modificationDate:versionsStore:", v32, v17, v30, v18, v19, v34, v25, v21, v22, v23, v33->_versionsStore);
  -[BRListNonLocalVersionsOperation _addVersion:](v33, "_addVersion:", v24);

  v20 = v25;
LABEL_13:

}

- (void)newCachedVersionAtURL:(id)a3 size:(id)a4 etag:(id)a5 hasThumbnail:(BOOL)a6 displayName:(id)a7 lastEditorDeviceName:(id)a8 lastEditorNameComponents:(id)a9 modificationDate:(id)a10
{
  _BOOL8 v12;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  BRNonLocalVersion *v22;
  id v23;

  v12 = a6;
  v23 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a7;
  v19 = a8;
  v20 = a9;
  v21 = a10;
  -[NSMutableDictionary objectForKey:](self->_versionsByEtag, "objectForKey:", v17);
  v22 = (BRNonLocalVersion *)objc_claimAutoreleasedReturnValue();
  if (!v22)
  {
    v22 = -[BRNonLocalVersion initWithURL:physicalURL:size:extension:etag:hasThumbnail:displayName:lastEditorDeviceName:lastEditorNameComponents:modificationDate:versionsStore:]([BRNonLocalVersion alloc], "initWithURL:physicalURL:size:extension:etag:hasThumbnail:displayName:lastEditorDeviceName:lastEditorNameComponents:modificationDate:versionsStore:", v23, v23, v16, 0, v17, v12, v18, v19, v20, v21, self->_versionsStore);
    -[BRListNonLocalVersionsOperation _addVersion:](self, "_addVersion:", v22);
  }

}

- (void)versionsDone
{
  -[BRListNonLocalVersionsOperation _advanceToState:result:error:](self, "_advanceToState:result:error:", 1, self->_versions, 0);
}

- (void)newThumbnailForVersionWithEtag:(id)a3
{
  void *v3;
  void *v4;
  NSObject *v5;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_versionsByEtag, "objectForKeyedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    brc_bread_crumbs((uint64_t)"-[BRListNonLocalVersionsOperation newThumbnailForVersionWithEtag:]", 414);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(1);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      -[BRListNonLocalVersionsOperation newThumbnailForVersionWithEtag:].cold.1();

    objc_msgSend(v3, "setHasThumbnail:", 1);
  }

}

- (BOOL)isFinished
{
  return self->_finished;
}

- (BOOL)isExecuting
{
  return self->_executing;
}

- (NSMutableArray)versions
{
  return self->_versions;
}

- (BOOL)includeCachedVersions
{
  return self->_includeCachedVersions;
}

- (void)setIncludeCachedVersions:(BOOL)a3
{
  self->_includeCachedVersions = a3;
}

- (id)fetchingVersionsDoneBlock
{
  return self->_fetchingVersionsDoneBlock;
}

- (void)setFetchingVersionsDoneBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 296);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_fetchingVersionsDoneBlock, 0);
  objc_storeStrong((id *)&self->_sender, 0);
  objc_storeStrong((id *)&self->_versionsStore, 0);
  objc_storeStrong((id *)&self->_versionsByEtag, 0);
  objc_storeStrong((id *)&self->_versions, 0);
  objc_storeStrong((id *)&self->_documentURL, 0);
}

void __40__BRListNonLocalVersionsOperation_start__block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_10(&dword_19CBF0000, a2, a3, "[CRIT] Assertion failed: error != nil%@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __40__BRListNonLocalVersionsOperation_start__block_invoke_89_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5 = 138412802;
  v6 = v3;
  v7 = 2112;
  v8 = v4;
  v9 = 2112;
  v10 = a2;
  _os_log_error_impl(&dword_19CBF0000, log, (os_log_type_t)0x90u, "[ERROR] failed receiving versions for '%@' - %@%@", (uint8_t *)&v5, 0x20u);
}

- (void)_addVersion:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3_0(&dword_19CBF0000, v0, v1, "[DEBUG] adding version: %@%@");
  OUTLINED_FUNCTION_1();
}

- (void)newThumbnailForVersionWithEtag:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3_0(&dword_19CBF0000, v0, v1, "[DEBUG] %@ now has a thumbnail%@");
  OUTLINED_FUNCTION_1();
}

@end
