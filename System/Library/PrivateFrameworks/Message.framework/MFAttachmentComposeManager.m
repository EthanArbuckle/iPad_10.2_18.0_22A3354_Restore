@implementation MFAttachmentComposeManager

- (MFAttachmentComposeManager)init
{
  MFAttachmentComposeManager *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *composeAttachmentsQueue;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MFAttachmentComposeManager;
  v2 = -[MFAttachmentManager init](&v6, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.mail.attachmentComposeManagerAttachmentURLArray", 0);
    composeAttachmentsQueue = v2->_composeAttachmentsQueue;
    v2->_composeAttachmentsQueue = (OS_dispatch_queue *)v3;

  }
  return v2;
}

- (id)_queueForAttachment:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  MFInvocationQueue *v9;
  MFInvocationQueue *defaultDownloadQueue;
  MFInvocationQueue *v11;
  MFInvocationQueue *v12;

  v4 = a3;
  if ((objc_msgSend(v4, "isDataAvailableLocally") & 1) == 0)
  {
    objc_msgSend(v4, "url");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFAttachmentManager _dataProviderForAttachmentURL:error:](self, "_dataProviderForAttachmentURL:error:", v5, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "messageForAttachment:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v7, "mailbox");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "attachmentDownloadQueue");
      v9 = (MFInvocationQueue *)objc_claimAutoreleasedReturnValue();

      if (v9)
        goto LABEL_9;
    }
    else
    {

    }
  }
  defaultDownloadQueue = self->_defaultDownloadQueue;
  if (!defaultDownloadQueue)
  {
    v11 = objc_alloc_init(MFInvocationQueue);
    v12 = self->_defaultDownloadQueue;
    self->_defaultDownloadQueue = v11;

    defaultDownloadQueue = self->_defaultDownloadQueue;
  }
  v9 = defaultDownloadQueue;
LABEL_9:

  return v9;
}

- (id)_fetchDataForAttachment:(id)a3 withProvider:(id)a4 request:(id)a5 syncLock:(id *)a6
{
  id v9;
  void *v10;
  NSObject *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  char v17;
  Class *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  id v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  void *v41;
  id v42;
  void *v43;
  _QWORD aBlock[4];
  id v45;
  MFAttachmentComposeManager *v46;
  id v47;
  id v48;
  id v49;
  id v50;
  id v51;
  uint8_t buf[4];
  id v53;
  __int16 v54;
  void *v55;
  __int16 v56;
  id v57;
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v37 = a4;
  v41 = v9;
  v42 = a5;
  objc_msgSend(v9, "url");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = v10;
  -[NSMutableDictionary objectForKeyedSubscript:](self->super._attachments, "objectForKeyedSubscript:", v10);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  if (v43)
  {
    EDAttachmentsLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      v53 = v9;
      v54 = 2112;
      v55 = v10;
      _os_log_impl(&dword_1A4F90000, v11, OS_LOG_TYPE_DEFAULT, "Attachment %p with url %@ already exists in the dictionary of attachment compose manager", buf, 0x16u);
    }

    objc_msgSend(v9, "customConsumer");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    if (v38)
    {
      objc_msgSend(v43, "objectForKeyedSubscript:", CFSTR("MFAttachmentCollectionFilterKey"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addDataConsumer:", v38);

    }
    objc_msgSend(v43, "objectForKeyedSubscript:", CFSTR("MFAttachmentAttachmentKey"));
    v13 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObject:", v42);
    objc_msgSend(v43, "objectForKeyedSubscript:", CFSTR("MFAttachmentPrimaryConsumerKey"));
    v14 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "objectForKeyedSubscript:", CFSTR("MFAttachmentSyncLockKey"));
    v15 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v9, "path");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    if (v38
      && (objc_msgSend(v9, "isContainedInRFC822") & 1) == 0
      && (objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"),
          v16 = (void *)objc_claimAutoreleasedReturnValue(),
          v17 = objc_msgSend(v16, "isReadableFileAtPath:", v38),
          v16,
          (v17 & 1) != 0))
    {
      v18 = (Class *)0x1E0D46168;
    }
    else
    {
      v18 = (Class *)0x1E0D46068;
    }
    v14 = objc_alloc_init(*v18);
    v19 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3538]), "initWithCondition:", 0);
    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D46108]), "initWithMainConsumer:", v14);
    v35 = (void *)v19;
    v36 = v20;
    objc_msgSend(v9, "customConsumer");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21)
    {
      objc_msgSend(v9, "customConsumer");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "addDataConsumer:", v22);

    }
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", v42);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setObject:forKeyedSubscript:", v24, CFSTR("MFAttachmentAttachmentKey"));

    objc_msgSend(v23, "setObject:forKeyedSubscript:", v14, CFSTR("MFAttachmentPrimaryConsumerKey"));
    objc_msgSend(v23, "setObject:forKeyedSubscript:", v20, CFSTR("MFAttachmentCollectionFilterKey"));
    objc_msgSend(v23, "setObject:forKeyedSubscript:", v19, CFSTR("MFAttachmentSyncLockKey"));
    EDAttachmentsLog();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v9, "ef_publicDescription");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v53 = v26;
      v54 = 2112;
      v55 = v10;
      v56 = 2114;
      v57 = v14;
      _os_log_impl(&dword_1A4F90000, v25, OS_LOG_TYPE_DEFAULT, "requesting download of attachment %{public}@ with URL %@ (primaryConsumer: %{public}@)", buf, 0x20u);

    }
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __84__MFAttachmentComposeManager__fetchDataForAttachment_withProvider_request_syncLock___block_invoke;
    aBlock[3] = &unk_1E4E8B920;
    v45 = v42;
    v46 = self;
    v27 = v10;
    v47 = v27;
    v48 = v37;
    v28 = v9;
    v49 = v28;
    v13 = v36;
    v50 = v13;
    v15 = v35;
    v51 = v15;
    v29 = _Block_copy(aBlock);
    v30 = _Block_copy(v29);
    +[MFMonitoredInvocation invocationWithSelector:target:object:taskName:priority:canBeCancelled:](MFMonitoredInvocation, "invocationWithSelector:target:object:taskName:priority:canBeCancelled:", sel__fetchInvocationCallUsingBlock_, self, v30, CFSTR("FetchDataForURL"), 4, 1);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v31, "setPowerAssertionId:", CFSTR("com.apple.message.MFAttachmentComposeManager"));
    objc_msgSend(v31, "retainArguments");
    objc_msgSend(v31, "monitor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setObject:forKeyedSubscript:", v32, CFSTR("MFAttachmentMonitorKey"));

    -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._attachments, "setObject:forKeyedSubscript:", v23, v27);
    -[MFAttachmentComposeManager _queueForAttachment:](self, "_queueForAttachment:", v28);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "addInvocation:", v31);

  }
  if (a6)
    *a6 = objc_retainAutorelease(v15);

  return v14;
}

void __84__MFAttachmentComposeManager__fetchDataForAttachment_withProvider_request_syncLock___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  uint64_t v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  _QWORD v22[5];
  id v23;
  id v24;

  objc_msgSend(*(id *)(a1 + 32), "downloadProgress");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __84__MFAttachmentComposeManager__fetchDataForAttachment_withProvider_request_syncLock___block_invoke_2;
  v22[3] = &unk_1E4E8B8D0;
  v4 = *(void **)(a1 + 48);
  v22[4] = *(_QWORD *)(a1 + 40);
  v23 = v4;
  v5 = v2;
  v24 = v5;
  objc_msgSend(v5, "ef_observeKeyPath:options:usingBlock:", CFSTR("fractionCompleted"), 1, v22);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(void **)(a1 + 56);
  v8 = *(_QWORD *)(a1 + 64);
  v9 = *(void **)(a1 + 72);
  v14[0] = v3;
  v14[1] = 3221225472;
  v14[2] = __84__MFAttachmentComposeManager__fetchDataForAttachment_withProvider_request_syncLock___block_invoke_3;
  v14[3] = &unk_1E4E8B8F8;
  v10 = v9;
  v11 = *(_QWORD *)(a1 + 40);
  v12 = *(void **)(a1 + 48);
  v15 = v10;
  v16 = v11;
  v17 = v12;
  v18 = *(id *)(a1 + 64);
  v19 = *(id *)(a1 + 56);
  v20 = *(id *)(a1 + 80);
  v21 = v6;
  v13 = v6;
  objc_msgSend(v7, "fetchDataForAttachment:consumer:progress:completion:", v8, v10, v5, v14);

}

uint64_t __84__MFAttachmentComposeManager__fetchDataForAttachment_withProvider_request_syncLock___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_callProgressBlockForAttachmentURL:withBytes:expectedSize:", *(_QWORD *)(a1 + 40), objc_msgSend(*(id *)(a1 + 48), "completedUnitCount"), objc_msgSend(*(id *)(a1 + 48), "totalUnitCount"));
}

void __84__MFAttachmentComposeManager__fetchDataForAttachment_withProvider_request_syncLock___block_invoke_3(uint64_t a1, int a2, void *a3, int a4)
{
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD block[5];
  id v20;
  id v21;
  id v22;
  id v23;
  uint8_t buf[4];
  uint64_t v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  int v29;
  __int16 v30;
  int v31;
  __int16 v32;
  uint64_t v33;
  __int16 v34;
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  objc_msgSend(*(id *)(a1 + 32), "data");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (a2
    && a4
    && (v10 = objc_msgSend(v8, "length"), !v7)
    && v10
    && +[MFMailMessageLibrary canUsePersistence](MFMailMessageLibrary, "canUsePersistence"))
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[2] = __84__MFAttachmentComposeManager__fetchDataForAttachment_withProvider_request_syncLock___block_invoke_4;
    block[3] = &unk_1E4E8AA30;
    v11 = *(_QWORD *)(a1 + 40);
    v12 = *(void **)(a1 + 48);
    v13 = *(NSObject **)(v11 + 8);
    block[1] = 3221225472;
    block[4] = v11;
    v20 = v12;
    v21 = *(id *)(a1 + 56);
    v22 = v9;
    v23 = *(id *)(a1 + 64);
    dispatch_sync(v13, block);

  }
  else
  {
    EDAttachmentsLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v17 = *(_QWORD *)(a1 + 48);
      v18 = *(_QWORD *)(a1 + 56);
      *(_DWORD *)buf = 134219266;
      v25 = v18;
      v26 = 2112;
      v27 = v17;
      v28 = 1024;
      v29 = a4;
      v30 = 1024;
      v31 = a2;
      v32 = 2048;
      v33 = objc_msgSend(v9, "length");
      v34 = 2112;
      v35 = v7;
      _os_log_error_impl(&dword_1A4F90000, v14, OS_LOG_TYPE_ERROR, "not writing attachment %p %@ to disk (shouldWriteToDisk=%d, success=%d, data.length=%lu, error=%@)", buf, 0x36u);
    }

  }
  objc_msgSend(*(id *)(a1 + 72), "lock");
  objc_msgSend(*(id *)(a1 + 72), "unlockWithCondition:", 1);
  v15 = objc_msgSend(v9, "length");
  v16 = v7;
  if (!v7 && !v15)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "ef_connectionInterruptedError");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(*(id *)(a1 + 40), "_fetchCompletedForAttachment:error:", *(_QWORD *)(a1 + 56), v16);
  objc_msgSend(*(id *)(a1 + 80), "cancel");

}

void __84__MFAttachmentComposeManager__fetchDataForAttachment_withProvider_request_syncLock___block_invoke_4(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  const __CFString *v27;
  NSObject *v28;
  void *v29;
  id v30;
  id v31;
  void *v32;
  uint64_t v33;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  const __CFString *v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v2 = _os_activity_create(&dword_1A4F90000, "Write attachment to database", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v2, &state);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 48), "fileName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0D1EEB8]), "initRegularFileWithContents:", *(_QWORD *)(a1 + 56));
      objc_msgSend(*(id *)(a1 + 48), "fileName");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject setPreferredFilename:](v5, "setPreferredFilename:", v6);

      -[NSObject fileAttributes](v5, "fileAttributes");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = (void *)objc_msgSend(v7, "mutableCopy");

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 56), "length"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "setObject:forKeyedSubscript:", v8, *MEMORY[0x1E0CB2AF0]);

      -[NSObject setFileAttributes:](v5, "setFileAttributes:", v32);
      objc_msgSend(*(id *)(a1 + 48), "mimePartNumber");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v9;
      if (v9)
      {
        v31 = v9;
      }
      else
      {
        objc_msgSend(*(id *)(a1 + 48), "part");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "partNumber");
        v31 = (id)objc_claimAutoreleasedReturnValue();

      }
      objc_msgSend(*(id *)(a1 + 64), "messageForAttachment:", *(_QWORD *)(a1 + 48));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_13;
      v30 = v13;
      v14 = objc_alloc(MEMORY[0x1E0D1EB10]);
      v15 = objc_msgSend(v30, "globalMessageID");
      objc_msgSend(*(id *)(a1 + 48), "fileName");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 48), "mailDropMetadata");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "directUrl");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (void *)objc_msgSend(v14, "initWithGlobalMessageID:name:mimePart:attachmentID:remoteURL:", v15, v16, v31, 0, v18);

      v20 = (void *)MEMORY[0x1E0C99E98];
      +[MFMailMessageLibrary defaultInstance](MFMailMessageLibrary, "defaultInstance");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "account");
      v22 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "messageBasePathForAccount:", v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "fileURLWithPath:isDirectory:", v23, 1);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(*(id *)(a1 + 32), "persistenceManager");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = 0;
      LOBYTE(v22) = objc_msgSend(v25, "persistAttachment:attachmentMetadata:basePath:error:", v5, v19, v24, &v33);

      if ((v22 & 1) != 0)
      {
        objc_msgSend(*(id *)(a1 + 48), "updatePath");
        objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "postNotificationName:object:", CFSTR("LibraryMessageAttachmentDataBecameAvailableNotification"), v30);

        v27 = CFSTR("Success");
      }
      else
      {
LABEL_13:
        v27 = CFSTR("Failed");
      }
      EDAttachmentsLog();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(*(id *)(a1 + 48), "ef_publicDescription");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v36 = v27;
        v37 = 2114;
        v38 = v29;
        _os_log_impl(&dword_1A4F90000, v28, OS_LOG_TYPE_DEFAULT, "%@ attachment %{public}@ write to persistence", buf, 0x16u);

      }
    }
    else
    {
      EDAttachmentsLog();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(*(id *)(a1 + 48), "ef_publicDescription");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        __84__MFAttachmentComposeManager__fetchDataForAttachment_withProvider_request_syncLock___block_invoke_4_cold_2(v11, buf, v5);
      }
    }
  }
  else
  {
    EDAttachmentsLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __84__MFAttachmentComposeManager__fetchDataForAttachment_withProvider_request_syncLock___block_invoke_4_cold_1(a1, (_QWORD *)(a1 + 40), v5);
  }

  os_activity_scope_leave(&state);
}

- (void)_callProgressBlockForAttachmentURL:(id)a3 withBytes:(int64_t)a4 expectedSize:(int64_t)a5
{
  id v7;
  double v8;
  double v9;
  NSObject *arrayAccessQueue;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  uint64_t v16;
  double v17;
  NSObject *v19;
  void (**v20)(_QWORD);
  void *v21;
  void *v22;
  id v23;
  _QWORD aBlock[6];
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _QWORD block[5];
  id v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;
  uint8_t buf[4];
  void *v40;
  __int16 v41;
  int64_t v42;
  __int16 v43;
  int64_t v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate", v7);
  v9 = v8;
  v33 = 0;
  v34 = &v33;
  v35 = 0x3032000000;
  v36 = __Block_byref_object_copy__7;
  v37 = __Block_byref_object_dispose__7;
  v38 = 0;
  arrayAccessQueue = self->super._arrayAccessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __88__MFAttachmentComposeManager__callProgressBlockForAttachmentURL_withBytes_expectedSize___block_invoke;
  block[3] = &unk_1E4E8B948;
  v32 = &v33;
  block[4] = self;
  v23 = v7;
  v31 = v23;
  dispatch_sync(arrayAccessQueue, block);
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v11 = (id)v34[5];
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v26, v45, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v27 != v13)
          objc_enumerationMutation(v11);
        v15 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        v16 = objc_msgSend(v15, "lastProgressBytes");
        objc_msgSend(v15, "lastProgressTime");
        if (v9 - v17 >= 0.0333333333 || (double)a5 * 0.02 <= (double)(a4 - v16))
        {
          MFLogGeneral();
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(v15, "attachment");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "fileName");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412802;
            v40 = v22;
            v41 = 2048;
            v42 = a4;
            v43 = 2048;
            v44 = a5;
            _os_log_debug_impl(&dword_1A4F90000, v19, OS_LOG_TYPE_DEBUG, "Calling progress block for %@.  %lu/%lu", buf, 0x20u);

          }
          objc_msgSend(v15, "setLastProgressBytes:", a4);
          objc_msgSend(v15, "setLastProgressTime:", v9);
          aBlock[0] = MEMORY[0x1E0C809B0];
          aBlock[1] = 3221225472;
          aBlock[2] = __88__MFAttachmentComposeManager__callProgressBlockForAttachmentURL_withBytes_expectedSize___block_invoke_41;
          aBlock[3] = &unk_1E4E89DD0;
          aBlock[4] = v15;
          aBlock[5] = a4;
          v20 = (void (**)(_QWORD))_Block_copy(aBlock);
          if (objc_msgSend(v15, "wantsCompletionBlockOffMainThread"))
            v20[2](v20);
          else
            dispatch_async(MEMORY[0x1E0C80D38], v20);

        }
      }
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v26, v45, 16);
    }
    while (v12);
  }

  _Block_object_dispose(&v33, 8);
}

void __88__MFAttachmentComposeManager__callProgressBlockForAttachmentURL_withBytes_expectedSize___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1[4] + 32), "objectForKeyedSubscript:", a1[5]);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("MFAttachmentAttachmentKey"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "copy");
  v4 = *(_QWORD *)(a1[6] + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __88__MFAttachmentComposeManager__callProgressBlockForAttachmentURL_withBytes_expectedSize___block_invoke_41(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "downloadProgress");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setCompletedUnitCount:", v1);

}

- (void)_fetchInvocationCallUsingBlock:(id)a3
{
  (*((void (**)(id))a3 + 2))(a3);
}

- (id)attachmentsForContext:(id)a3
{
  id v4;
  NSObject *composeAttachmentsQueue;
  id v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__7;
  v16 = __Block_byref_object_dispose__7;
  v17 = 0;
  composeAttachmentsQueue = self->_composeAttachmentsQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__MFAttachmentComposeManager_attachmentsForContext___block_invoke;
  block[3] = &unk_1E4E8B948;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(composeAttachmentsQueue, block);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __52__MFAttachmentComposeManager_attachmentsForContext___block_invoke(_QWORD *a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v2 = a1 + 4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(*(id *)(a1[4] + 80), "count"));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1[6] + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = *(id *)(*v2 + 80);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        if (objc_msgSend(v10, "rangeOfString:", a1[5], (_QWORD)v14) != 0x7FFFFFFFFFFFFFFFLL)
        {
          v11 = (void *)a1[4];
          objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v10);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "attachmentForURL:error:", v12, 0);
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          if (v13)
            objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "addObject:", v13);

        }
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

}

- (id)attachmentForCID:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3998], "componentsWithURL:resolvingAgainstBaseURL:", a3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setQuery:", 0);
  objc_msgSend(v4, "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFAttachmentManager attachmentForContentID:preferredSchemes:](self, "attachmentForContentID:preferredSchemes:", v5, &unk_1E4F68F68);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_providerForURL:(id)a3
{
  id v4;
  os_unfair_lock_s *p_providersLock;
  NSMutableDictionary *providers;
  void *v7;
  void *v8;

  v4 = a3;
  p_providersLock = &self->super._providersLock;
  os_unfair_lock_lock(&self->super._providersLock);
  providers = self->super._providers;
  objc_msgSend(v4, "absoluteString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](providers, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_providersLock);
  return v8;
}

- (id)_composeAttachmentDataProviderForContext:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("x-attach-compose://%@"), a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "URLWithString:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[MFAttachmentComposeManager _providerForURL:](self, "_providerForURL:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)attachmentForData:(id)a3 mimeType:(id)a4 fileName:(id)a5 contentID:(id)a6 context:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  MFComposeAttachmentDataProvider *v24;
  MFAttachment *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  id v32;
  NSObject *v33;
  void *v34;
  MFAttachment *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  NSMutableArray *v42;
  NSMutableArray *composeAttachmentURLs;
  void *v44;
  void *v45;
  NSObject *composeAttachmentsQueue;
  id v47;
  void *v49;
  void *v50;
  MFComposeAttachmentDataProvider *v51;
  void *v52;
  void *v53;
  id v54;
  _QWORD block[5];
  id v56;
  uint8_t buf[24];
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v54 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  if ((unint64_t)objc_msgSend(v12, "length") < 0x834
    && +[MFAttachmentPlaceholder isPlaceholderSerializedRepresentation:](MFAttachmentPlaceholder, "isPlaceholderSerializedRepresentation:", v12))
  {
    +[MFAttachmentPlaceholder placeholderFromSerializedRepresentation:](MFAttachmentPlaceholder, "placeholderFromSerializedRepresentation:", v12);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (!v14)
    {
      objc_msgSend(v16, "contentID");
      v14 = (id)objc_claimAutoreleasedReturnValue();
    }
    v18 = v17;
    if (!v15)
      goto LABEL_6;
  }
  else
  {
    v18 = 0;
    if (!v15)
    {
LABEL_6:
      MFLogGeneral();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        -[MFAttachmentComposeManager attachmentForData:mimeType:fileName:contentID:context:].cold.1();
LABEL_16:
      v25 = 0;
      goto LABEL_39;
    }
  }
  if (!objc_msgSend(v12, "length"))
  {
    MFLogGeneral();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      -[MFAttachmentComposeManager attachmentForData:mimeType:fileName:contentID:context:].cold.2();
    goto LABEL_16;
  }
  -[MFAttachmentComposeManager _contentIDWithoutBracket:](self, "_contentIDWithoutBracket:", v14);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v13, "length"))
  {
    v21 = v20;

    v13 = v21;
  }
  v22 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("x-attach-compose://%@"), v15);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "URLWithString:", v23);
  v19 = objc_claimAutoreleasedReturnValue();

  -[MFAttachmentComposeManager _providerForURL:](self, "_providerForURL:", v19);
  v24 = (MFComposeAttachmentDataProvider *)objc_claimAutoreleasedReturnValue();
  if (v24)
  {
    v51 = v24;
    -[MFComposeAttachmentDataProvider addData:forContentID:](v24, "addData:forContentID:", v12, v20);
  }
  else
  {
    v51 = -[MFComposeAttachmentDataProvider initWithData:forContentID:]([MFComposeAttachmentDataProvider alloc], "initWithData:forContentID:", v12, v20);
    -[MFAttachmentManager addProvider:forBaseURL:](self, "addProvider:forBaseURL:", v51, v19);
  }
  objc_msgSend(v13, "pathExtension");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "lowercaseString");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  v50 = v27;
  if (objc_msgSend(v27, "isEqualToString:", CFSTR("zip")))
  {
    objc_msgSend(v13, "stringByDeletingPathExtension");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "pathExtension");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v28;
    if (v28 && objc_msgSend(v28, "length"))
    {
      objc_msgSend(v29, "ef_declaredUTTypeFromExtension");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "identifier");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_msgSend(v30, "ef_conformsToIWorkUTType");

      if (v31)
      {
        v32 = v52;

        EDAttachmentsLog();
        v33 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(v49, "identifier");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          -[MFAttachmentComposeManager attachmentForData:mimeType:fileName:contentID:context:].cold.3(v34, buf, v33);
        }

      }
      else
      {
        v32 = v13;
      }

    }
    else
    {
      v32 = v13;
    }

    v13 = v32;
  }
  objc_msgSend(v13, "ef_filenameWithExtensionForMimeType:", v54);
  v53 = (void *)objc_claimAutoreleasedReturnValue();

  v35 = [MFAttachment alloc];
  -[NSObject URLByAppendingPathComponent:](v19, "URLByAppendingPathComponent:", v20);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = -[MFAttachment initWithURL:attachmentManager:](v35, "initWithURL:attachmentManager:", v36, self);

  objc_msgSend(v53, "ef_sanitizedFileName");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFAttachment setFileName:](v25, "setFileName:", v37);

  -[MFAttachment setContentID:](v25, "setContentID:", v20);
  if (v54)
  {
    -[MFAttachment setMimeType:](v25, "setMimeType:");
  }
  else
  {
    objc_msgSend(v53, "pathExtension");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "lowercaseString");
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB39C0], "sharedMappings");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "MIMETypeForExtension:", v39);
    v41 = (void *)objc_claimAutoreleasedReturnValue();

    -[MFAttachment setMimeType:](v25, "setMimeType:", v41);
  }
  if (v18)
  {
    -[MFAttachment setPlaceholder:](v25, "setPlaceholder:", v18);
    -[MFAttachment setIsPlaceholder:](v25, "setIsPlaceholder:", 1);
  }
  -[MFAttachmentManager setContentID:forAttachment:](self, "setContentID:forAttachment:", v20, v25);
  -[MFAttachment setDecodedFileSize:](v25, "setDecodedFileSize:", objc_msgSend(v12, "length"));
  if (v25)
  {
    if (!self->_composeAttachmentURLs)
    {
      v42 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      composeAttachmentURLs = self->_composeAttachmentURLs;
      self->_composeAttachmentURLs = v42;

    }
    -[MFAttachment url](v25, "url");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "absoluteString");
    v45 = (void *)objc_claimAutoreleasedReturnValue();

    composeAttachmentsQueue = self->_composeAttachmentsQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __84__MFAttachmentComposeManager_attachmentForData_mimeType_fileName_contentID_context___block_invoke;
    block[3] = &unk_1E4E88EE8;
    block[4] = self;
    v56 = v45;
    v47 = v45;
    dispatch_async(composeAttachmentsQueue, block);

  }
  v13 = v53;
  v14 = v20;
LABEL_39:

  return v25;
}

uint64_t __84__MFAttachmentComposeManager_attachmentForData_mimeType_fileName_contentID_context___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "containsObject:", *(_QWORD *)(a1 + 40));
  if ((result & 1) == 0)
    return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "addObject:", *(_QWORD *)(a1 + 40));
  return result;
}

- (id)attachmentForItemProvider:(id)a3 mimeType:(id)a4 fileName:(id)a5 contentID:(id)a6 context:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  MFComposeAttachmentDataProvider *v23;
  MFComposeAttachmentDataProvider *v24;
  MFAttachment *v25;
  void *v26;
  MFAttachment *v27;
  NSMutableArray *v28;
  NSMutableArray *composeAttachmentURLs;
  void *v30;
  void *v31;
  NSObject *composeAttachmentsQueue;
  id v33;
  void *v35;
  id v36;
  _QWORD block[5];
  id v38;

  v36 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  if (!v13 && !objc_msgSend(0, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MFAttachmentComposeManager.m"), 392, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("mimeType || mimeType.length > 0"));

  }
  -[MFAttachmentComposeManager _contentIDWithoutBracket:](self, "_contentIDWithoutBracket:", v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v14, "length"))
  {
    v18 = v17;

    v14 = v18;
  }
  objc_msgSend(v14, "ef_filenameWithExtensionForMimeType:", v13);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("x-attach-compose://%@"), v16);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "URLWithString:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  -[MFAttachmentComposeManager _providerForURL:](self, "_providerForURL:", v22);
  v23 = (MFComposeAttachmentDataProvider *)objc_claimAutoreleasedReturnValue();
  v24 = v23;
  if (v23)
  {
    -[MFComposeAttachmentDataProvider addDataItemProvider:forContentID:](v23, "addDataItemProvider:forContentID:", v36, v17);
  }
  else
  {
    v24 = -[MFComposeAttachmentDataProvider initWithAttachmentDataItemProvider:forContentID:]([MFComposeAttachmentDataProvider alloc], "initWithAttachmentDataItemProvider:forContentID:", v36, v17);
    -[MFAttachmentManager addProvider:forBaseURL:](self, "addProvider:forBaseURL:", v24, v22);
  }
  v25 = [MFAttachment alloc];
  objc_msgSend(v22, "URLByAppendingPathComponent:", v17);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = -[MFAttachment initWithURL:attachmentManager:](v25, "initWithURL:attachmentManager:", v26, self);

  -[MFAttachment setFileName:](v27, "setFileName:", v19);
  -[MFAttachment setContentID:](v27, "setContentID:", v17);
  -[MFAttachment setMimeType:](v27, "setMimeType:", v13);
  -[MFAttachmentManager setContentID:forAttachment:](self, "setContentID:forAttachment:", v17, v27);
  if (v27)
  {
    if (!self->_composeAttachmentURLs)
    {
      v28 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      composeAttachmentURLs = self->_composeAttachmentURLs;
      self->_composeAttachmentURLs = v28;

    }
    -[MFAttachment url](v27, "url");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "absoluteString");
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    composeAttachmentsQueue = self->_composeAttachmentsQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __92__MFAttachmentComposeManager_attachmentForItemProvider_mimeType_fileName_contentID_context___block_invoke;
    block[3] = &unk_1E4E88EE8;
    block[4] = self;
    v38 = v31;
    v33 = v31;
    dispatch_async(composeAttachmentsQueue, block);

  }
  return v27;
}

uint64_t __92__MFAttachmentComposeManager_attachmentForItemProvider_mimeType_fileName_contentID_context___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "containsObject:", *(_QWORD *)(a1 + 40));
  if ((result & 1) == 0)
    return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "addObject:", *(_QWORD *)(a1 + 40));
  return result;
}

- (id)_contentIDWithoutBracket:(id)a3
{
  id v3;
  uint64_t v4;

  v3 = a3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "mf_messageIDStringWithDomainHint:", 0);
    v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (objc_msgSend(v3, "hasPrefix:", CFSTR("<")))
  {
    objc_msgSend(v3, "substringWithRange:", 1, objc_msgSend(v3, "length") - 2);
    v4 = objc_claimAutoreleasedReturnValue();

    v3 = (id)v4;
  }
  return v3;
}

- (void)loadAttachmentURL:(id)a3 forContextID:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;

  v12 = a4;
  -[MFAttachmentComposeManager attachmentForCID:](self, "attachmentForCID:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fetchLocalData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "mimeType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fileName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "contentID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[MFAttachmentComposeManager attachmentForData:mimeType:fileName:contentID:context:](self, "attachmentForData:mimeType:fileName:contentID:context:", v7, v8, v9, v10, v12);

}

- (BOOL)updateAttachment:(id)a3 withNewData:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  char isKindOfClass;
  id v11;
  void *v12;
  void *v13;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "url");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFAttachmentManager _dataProviderForAttachmentURL:error:](self, "_dataProviderForAttachmentURL:error:", v8, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  if ((isKindOfClass & 1) != 0)
  {
    v11 = v9;
    objc_msgSend(v6, "url");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "removeDataForAttachment:", v12);

    objc_msgSend(v6, "contentID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addData:forContentID:", v7, v13);

  }
  return isKindOfClass & 1;
}

- (void)removeAttachmentForURL:(id)a3
{
  id v4;
  NSObject *composeAttachmentsQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  composeAttachmentsQueue = self->_composeAttachmentsQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__MFAttachmentComposeManager_removeAttachmentForURL___block_invoke;
  block[3] = &unk_1E4E88EE8;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(composeAttachmentsQueue, block);

}

void __53__MFAttachmentComposeManager_removeAttachmentForURL___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  id v5;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 80);
  objc_msgSend(*(id *)(a1 + 40), "absoluteString");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "indexOfObject:");

  if (v3 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "removeObjectAtIndex:", v3);
    objc_msgSend(*(id *)(a1 + 32), "_dataProviderForAttachmentURL:error:", *(_QWORD *)(a1 + 40), 0);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(v5, "removeDataForAttachment:", *(_QWORD *)(a1 + 40));

  }
}

- (void)recordPasteboardAttachmentsForURLs:(id)a3 forContextID:(id)a4
{
  void *v6;
  id v7;

  v7 = a3;
  -[MFAttachmentComposeManager _composeAttachmentDataProviderForContext:](self, "_composeAttachmentDataProviderForContext:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v6, "recordPasteboardDataForAttachments:", v7);

}

- (void)recordUndoAttachmentsForURLs:(id)a3 forContextID:(id)a4
{
  void *v6;
  id v7;

  v7 = a3;
  -[MFAttachmentComposeManager _composeAttachmentDataProviderForContext:](self, "_composeAttachmentDataProviderForContext:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v6, "recordUndoDataForAttachments:", v7);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_composeAttachmentsQueue, 0);
  objc_storeStrong((id *)&self->_composeAttachmentURLs, 0);
  objc_storeStrong((id *)&self->_defaultDownloadQueue, 0);
}

void __84__MFAttachmentComposeManager__fetchDataForAttachment_withProvider_request_syncLock___block_invoke_4_cold_1(uint64_t a1, _QWORD *a2, NSObject *a3)
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 134218242;
  *(_QWORD *)&v3[4] = *(_QWORD *)(a1 + 48);
  *(_WORD *)&v3[12] = 2112;
  *(_QWORD *)&v3[14] = *a2;
  OUTLINED_FUNCTION_0_4(&dword_1A4F90000, (uint64_t)a2, a3, "not writing attachment %p %@ to disk (no-existing-attachment-dictionary)", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16]);
  OUTLINED_FUNCTION_5();
}

void __84__MFAttachmentComposeManager__fetchDataForAttachment_withProvider_request_syncLock___block_invoke_4_cold_2(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543362;
  *(_QWORD *)(buf + 4) = a1;
  _os_log_error_impl(&dword_1A4F90000, log, OS_LOG_TYPE_ERROR, "not writing attachment. Missing filename: %{public}@", buf, 0xCu);

}

- (void)attachmentForData:mimeType:fileName:contentID:context:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_4(&dword_1A4F90000, v0, v1, "#Attachments ContextID was nil for filename:%@ contentID:%@");
  OUTLINED_FUNCTION_5();
}

- (void)attachmentForData:mimeType:fileName:contentID:context:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_4(&dword_1A4F90000, v0, v1, "#Attachments Data was nil for filename:%@ contentID:%@");
  OUTLINED_FUNCTION_5();
}

- (void)attachmentForData:(os_log_t)log mimeType:fileName:contentID:context:.cold.3(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543362;
  *(_QWORD *)(buf + 4) = a1;
  _os_log_debug_impl(&dword_1A4F90000, log, OS_LOG_TYPE_DEBUG, "Stripping .zip extension from attachment with type: %{public}@", buf, 0xCu);

}

@end
