@implementation MFAttachmentComposeManager

- (id)attachmentsForContext:(id)a3
{
  void *v5;
  NSMutableArray *composeAttachmentURLs;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  id v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[NSMutableArray count](self->_composeAttachmentURLs, "count"));
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  composeAttachmentURLs = self->_composeAttachmentURLs;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](composeAttachmentURLs, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(composeAttachmentURLs);
        v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        if (objc_msgSend(v11, "rangeOfString:", a3) != 0x7FFFFFFFFFFFFFFFLL)
        {
          v12 = -[MFAttachmentManager attachmentForURL:error:](self, "attachmentForURL:error:", objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v11), 0);
          if (v12)
            objc_msgSend(v5, "addObject:", v12);
        }
      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](composeAttachmentURLs, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MFAttachmentComposeManager;
  -[MFAttachmentManager dealloc](&v3, sel_dealloc);
}

- (id)_queueForAttachment:(id)a3
{
  void *v5;
  id result;

  if ((objc_msgSend(a3, "isDataAvailableLocally") & 1) != 0
    || (v5 = (void *)objc_msgSend(-[MFAttachmentManager _dataProviderForAttachmentURL:error:](self, "_dataProviderForAttachmentURL:error:", objc_msgSend(a3, "url"), 0), "messageForAttachment:", a3), objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)|| (result = (id)objc_msgSend((id)objc_msgSend(v5, "mailbox"), "attachmentDownloadQueue")) == 0)
  {
    result = self->_defaultDownloadQueue;
    if (!result)
    {
      result = objc_alloc_init(MFInvocationQueue);
      self->_defaultDownloadQueue = (MFInvocationQueue *)result;
    }
  }
  return result;
}

- (id)_fetchDataForAttachment:(id)a3 withProvider:(id)a4 syncLock:(id *)a5
{
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  id v16;
  id v18;
  void *v19;
  NSObject *v20;
  MFMonitoredInvocation *v21;
  id *v22;
  _QWORD v23[10];
  uint8_t buf[4];
  id v25;
  __int16 v26;
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v10 = objc_msgSend(a3, "url");
  v11 = -[NSMutableDictionary objectForKeyedSubscript:](self->super._attachments, "objectForKeyedSubscript:", v10);
  if (v11)
  {
    v12 = (void *)v11;
    v13 = objc_msgSend(a3, "customConsumer");
    if (v13)
      objc_msgSend((id)objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("MFAttachmentCollectionFilterKey")), "addDataConsumer:", v13);
    v14 = (void *)objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("MFAttachmentAttachmentKey"));
    if (objc_msgSend((id)objc_msgSend(MEMORY[0x1E0D1EEA8], "currentDevice"), "isInternal")
      && objc_msgSend(v14, "indexOfObjectIdenticalTo:", a3) != 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MFAttachmentComposeManager.m"), 98, CFSTR("attachments already contains %@"), a3);
    }
    objc_msgSend(v14, "addObject:", a3);
    v15 = (id)objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("MFAttachmentPrimaryConsumerKey"));
    v16 = (id)objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("MFAttachmentSyncLockKey"));
    if (a5)
LABEL_8:
      *a5 = v16;
  }
  else
  {
    v22 = a5;
    v15 = objc_alloc_init(MEMORY[0x1E0D46068]);
    v16 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3538]), "initWithCondition:", 0);
    v18 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D46108]), "initWithMainConsumer:", v15);
    if (objc_msgSend(a3, "customConsumer"))
      objc_msgSend(v18, "addDataConsumer:", objc_msgSend(a3, "customConsumer"));
    v19 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    objc_msgSend(v19, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", a3), CFSTR("MFAttachmentAttachmentKey"));
    objc_msgSend(v19, "setObject:forKeyedSubscript:", v15, CFSTR("MFAttachmentPrimaryConsumerKey"));
    objc_msgSend(v19, "setObject:forKeyedSubscript:", v18, CFSTR("MFAttachmentCollectionFilterKey"));
    objc_msgSend(v19, "setObject:forKeyedSubscript:", v16, CFSTR("MFAttachmentSyncLockKey"));
    v20 = MFLogGeneral();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      v25 = a3;
      v26 = 2112;
      v27 = v10;
      _os_log_impl(&dword_1C8839000, v20, OS_LOG_TYPE_DEFAULT, "#Attachments requesting download of attachment %p with URL %@", buf, 0x16u);
    }
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __76__MFAttachmentComposeManager__fetchDataForAttachment_withProvider_syncLock___block_invoke;
    v23[3] = &unk_1E81CAC60;
    v23[4] = a3;
    v23[5] = self;
    v23[6] = v10;
    v23[7] = a4;
    v23[8] = v18;
    v23[9] = v16;
    v21 = +[MFMonitoredInvocation invocationWithSelector:target:object:taskName:priority:canBeCancelled:](MFMonitoredInvocation, "invocationWithSelector:target:object:taskName:priority:canBeCancelled:", sel__fetchInvocationCallUsingBlock_, self, (id)objc_msgSend(v23, "copy"), CFSTR("FetchDataForURL"), 4, 1);
    -[MFMonitoredInvocation setPowerAssertionId:](v21, "setPowerAssertionId:", CFSTR("com.apple.message.MFAttachmentComposeManager"));
    -[MFMonitoredInvocation retainArguments](v21, "retainArguments");
    objc_msgSend(v19, "setObject:forKeyedSubscript:", -[MFMonitoredInvocation monitor](v21, "monitor"), CFSTR("MFAttachmentMonitorKey"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._attachments, "setObject:forKeyedSubscript:", v19, v10);
    objc_msgSend(-[MFAttachmentComposeManager _queueForAttachment:](self, "_queueForAttachment:", a3), "addInvocation:", v21);
    a5 = v22;
    if (v22)
      goto LABEL_8;
  }
  return v15;
}

void __76__MFAttachmentComposeManager__fetchDataForAttachment_withProvider_syncLock___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  __int128 v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  uint64_t v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3052000000;
  v9 = __Block_byref_object_copy_;
  v10 = __Block_byref_object_dispose_;
  v11 = 0;
  v11 = objc_msgSend(MEMORY[0x1E0CB38A8], "discreteProgressWithTotalUnitCount:", objc_msgSend(*(id *)(a1 + 32), "encodedFileSize"));
  v2 = (void *)v7[5];
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __76__MFAttachmentComposeManager__fetchDataForAttachment_withProvider_syncLock___block_invoke_16;
  v3[3] = &unk_1E81CABE8;
  v4 = *(_OWORD *)(a1 + 40);
  v5 = &v6;
  objc_msgSend(v2, "ef_observeKeyPath:options:usingBlock:", CFSTR("fractionCompleted"), 1, v3);
  objc_msgSend(*(id *)(a1 + 56), "fetchDataForAttachment:consumer:progress:completion:");
  _Block_object_dispose(&v6, 8);
}

uint64_t __76__MFAttachmentComposeManager__fetchDataForAttachment_withProvider_syncLock___block_invoke_16(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_callProgressBlockForAttachmentURL:withBytes:expectedSize:", *(_QWORD *)(a1 + 40), objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "completedUnitCount"), objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "totalUnitCount"));
}

uint64_t __76__MFAttachmentComposeManager__fetchDataForAttachment_withProvider_syncLock___block_invoke_2(uint64_t a1, int a2, uint64_t a3, int a4)
{
  void *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD v16[4];
  __int128 v17;
  uint64_t v18;
  void *v19;
  uint8_t buf[4];
  uint64_t v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  int v25;
  __int16 v26;
  int v27;
  __int16 v28;
  uint64_t v29;
  __int16 v30;
  uint64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v8 = (void *)objc_msgSend(*(id *)(a1 + 32), "data");
  v9 = v8;
  if (a2 && a4 && (v10 = objc_msgSend(v8, "length"), !a3) && v10)
  {
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __76__MFAttachmentComposeManager__fetchDataForAttachment_withProvider_syncLock___block_invoke_3;
    v16[3] = &unk_1E81CAC10;
    v11 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 8);
    v17 = *(_OWORD *)(a1 + 40);
    v18 = *(_QWORD *)(a1 + 56);
    v19 = v9;
    dispatch_sync(v11, v16);
  }
  else
  {
    v12 = MFLogGeneral();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v14 = *(_QWORD *)(a1 + 48);
      v13 = *(_QWORD *)(a1 + 56);
      *(_DWORD *)buf = 134219266;
      v21 = v13;
      v22 = 2112;
      v23 = v14;
      v24 = 1024;
      v25 = a4;
      v26 = 1024;
      v27 = a2;
      v28 = 2048;
      v29 = objc_msgSend(v9, "length");
      v30 = 2112;
      v31 = a3;
      _os_log_impl(&dword_1C8839000, v12, OS_LOG_TYPE_DEFAULT, "#Attachments not writing attachment %p %@ to disk (shouldWriteToDisk=%d, success=%d, data.length=%lu, error=%@)", buf, 0x36u);
    }
  }
  objc_msgSend(*(id *)(a1 + 64), "lock");
  objc_msgSend(*(id *)(a1 + 64), "unlockWithCondition:", 1);
  objc_msgSend(*(id *)(a1 + 40), "_fetchCompletedForAttachment:error:", *(_QWORD *)(a1 + 56), a3);
  return objc_msgSend(*(id *)(a1 + 72), "cancel");
}

void __76__MFAttachmentComposeManager__fetchDataForAttachment_withProvider_syncLock___block_invoke_3(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40)))
  {
    objc_msgSend(*(id *)(a1 + 48), "writeToDiskWithData:", *(_QWORD *)(a1 + 56));
  }
  else
  {
    v2 = MFLogGeneral();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(_QWORD *)(a1 + 40);
      v3 = *(_QWORD *)(a1 + 48);
      v5 = 134218242;
      v6 = v3;
      v7 = 2112;
      v8 = v4;
      _os_log_impl(&dword_1C8839000, v2, OS_LOG_TYPE_DEFAULT, "#Attachments not writing attachment %p %@ to disk (no-existing-attachment-dictionary)", (uint8_t *)&v5, 0x16u);
    }
  }
}

- (void)_callProgressBlockForAttachmentURL:(id)a3 withBytes:(unint64_t)a4 expectedSize:(unint64_t)a5
{
  double v8;
  double v9;
  NSObject *arrayAccessQueue;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  __int128 v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  uint64_t v18;
  double v19;
  NSObject *v21;
  uint64_t v22;
  __int128 v23;
  _QWORD v25[2];
  uint64_t (*v26)(uint64_t);
  void *v27;
  void *v28;
  unint64_t v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _QWORD block[7];
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  void (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  uint64_t v40;
  uint8_t buf[4];
  uint64_t v42;
  __int16 v43;
  unint64_t v44;
  __int16 v45;
  unint64_t v46;
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  v9 = v8;
  v35 = 0;
  v36 = &v35;
  v37 = 0x3052000000;
  v38 = __Block_byref_object_copy_;
  v39 = __Block_byref_object_dispose_;
  v40 = 0;
  arrayAccessQueue = self->super._arrayAccessQueue;
  v11 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __88__MFAttachmentComposeManager__callProgressBlockForAttachmentURL_withBytes_expectedSize___block_invoke;
  block[3] = &unk_1E81CAC88;
  block[5] = a3;
  block[6] = &v35;
  block[4] = self;
  dispatch_sync(arrayAccessQueue, block);
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v12 = (void *)v36[5];
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v30, v47, 16);
  if (v13)
  {
    v15 = *(_QWORD *)v31;
    *(_QWORD *)&v14 = 138412802;
    v23 = v14;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v31 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
        v18 = objc_msgSend(v17, "lastProgressBytes", v23);
        objc_msgSend(v17, "lastProgressTime");
        if (v9 - v19 >= 0.0333333333 || (double)a5 * 0.02 <= (double)(uint64_t)(a4 - v18))
        {
          v21 = MFLogGeneral();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
          {
            v22 = objc_msgSend(v17, "fileName");
            *(_DWORD *)buf = v23;
            v42 = v22;
            v43 = 2048;
            v44 = a4;
            v45 = 2048;
            v46 = a5;
            _os_log_debug_impl(&dword_1C8839000, v21, OS_LOG_TYPE_DEBUG, "Calling progress block for %@.  %lu/%lu", buf, 0x20u);
          }
          objc_msgSend(v17, "setLastProgressBytes:", a4);
          objc_msgSend(v17, "setLastProgressTime:", v9);
          v25[0] = v11;
          v25[1] = 3221225472;
          v26 = __88__MFAttachmentComposeManager__callProgressBlockForAttachmentURL_withBytes_expectedSize___block_invoke_28;
          v27 = &unk_1E81CACB0;
          v28 = v17;
          v29 = a4;
          if (objc_msgSend(v17, "wantsCompletionBlockOffMainThread"))
            v26((uint64_t)v25);
          else
            dispatch_async(MEMORY[0x1E0C80D38], v25);
        }
      }
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v30, v47, 16);
    }
    while (v13);
  }

  _Block_object_dispose(&v35, 8);
}

uint64_t __88__MFAttachmentComposeManager__callProgressBlockForAttachmentURL_withBytes_expectedSize___block_invoke(_QWORD *a1)
{
  uint64_t result;

  result = objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1[4] + 24), "objectForKeyedSubscript:", a1[5]), "objectForKeyedSubscript:", CFSTR("MFAttachmentAttachmentKey")), "copy");
  *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40) = result;
  return result;
}

uint64_t __88__MFAttachmentComposeManager__callProgressBlockForAttachmentURL_withBytes_expectedSize___block_invoke_28(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateProgressWithCurrentBytes:", *(_QWORD *)(a1 + 40));
}

- (void)_fetchInvocationCallUsingBlock:(id)a3
{
  (*((void (**)(id))a3 + 2))(a3);
}

- (id)_composeAttachmentDataProviderForContext:(id)a3
{
  return (id)-[NSMutableDictionary valueForKey:](self->super._providers, "valueForKey:", objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("x-attach-compose://%@"), a3)), "absoluteString"));
}

- (id)attachmentForData:(id)a3 mimeType:(id)a4 fileName:(id)a5 contentID:(id)a6 context:(id)a7
{
  id v13;
  NSObject *v14;
  id v15;
  void *v16;
  void *v17;
  NSObject *v18;
  MFAttachment *v19;
  MFAttachment *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;

  if ((unint64_t)objc_msgSend(a3, "length") < 0x834
    && +[MFAttachmentPlaceholder isPlaceholderSerializedRepresentation:](MFAttachmentPlaceholder, "isPlaceholderSerializedRepresentation:", a3))
  {
    v13 = +[MFAttachmentPlaceholder placeholderFromSerializedRepresentation:](MFAttachmentPlaceholder, "placeholderFromSerializedRepresentation:", a3);
    a6 = (id)objc_msgSend(v13, "contentID");
    if (!a7)
      goto LABEL_4;
  }
  else
  {
    v13 = 0;
    if (!a7)
    {
LABEL_4:
      v14 = MFLogGeneral();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        -[MFAttachmentComposeManager attachmentForData:mimeType:fileName:contentID:context:].cold.1();
      return 0;
    }
  }
  if (!objc_msgSend(a3, "length"))
  {
    v18 = MFLogGeneral();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      -[MFAttachmentComposeManager attachmentForData:mimeType:fileName:contentID:context:].cold.2();
    return 0;
  }
  if (!a6)
    a6 = (id)objc_msgSend(MEMORY[0x1E0CB3940], "mf_messageIDStringWithDomainHint:", 0);
  if (objc_msgSend(a6, "hasPrefix:", CFSTR("<")))
    a6 = (id)objc_msgSend(a6, "substringWithRange:", 1, objc_msgSend(a6, "length") - 2);
  if (objc_msgSend(a5, "length"))
    v15 = a5;
  else
    v15 = a6;
  v16 = (void *)objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("x-attach-compose://%@"), a7));
  v17 = (void *)-[NSMutableDictionary valueForKey:](self->super._providers, "valueForKey:", objc_msgSend(v16, "absoluteString"));
  if (v17)
    objc_msgSend(v17, "addData:forContentID:", a3, a6);
  else
    -[MFAttachmentManager addProvider:forBaseURL:](self, "addProvider:forBaseURL:", -[MFComposeAttachmentDataProvider initWithData:forContentID:]([MFComposeAttachmentDataProvider alloc], "initWithData:forContentID:", a3, a6), v16);
  v19 = -[MFAttachment initWithURL:attachmentManager:]([MFAttachment alloc], "initWithURL:attachmentManager:", objc_msgSend(v16, "URLByAppendingPathComponent:", a6), self);
  -[MFAttachment setFileName:](v19, "setFileName:", v15);
  -[MFAttachment setContentID:](v19, "setContentID:", a6);
  if (a4)
  {
    v21 = v19;
    v22 = a4;
  }
  else
  {
    v23 = objc_msgSend((id)objc_msgSend(v15, "pathExtension"), "lowercaseString");
    v22 = (id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB39C0], "sharedMappings"), "MIMETypeForExtension:", v23);
    v21 = v19;
  }
  -[MFAttachment setMimeType:](v21, "setMimeType:", v22);
  if (v13)
  {
    -[MFAttachment setPlaceholder:](v19, "setPlaceholder:", v13);
    -[MFAttachment setIsPlaceholder:](v19, "setIsPlaceholder:", 1);
  }
  -[MFAttachmentManager setContentID:forAttachment:](self, "setContentID:forAttachment:", a6, v19);
  -[MFAttachment setDecodedFileSize:](v19, "setDecodedFileSize:", objc_msgSend(a3, "length"));
  if (v19)
  {
    if (!self->_composeAttachmentURLs)
      self->_composeAttachmentURLs = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v24 = -[NSURL absoluteString](-[MFAttachment url](v19, "url"), "absoluteString");
    if ((-[NSMutableArray containsObject:](self->_composeAttachmentURLs, "containsObject:", v24) & 1) == 0)
      -[NSMutableArray addObject:](self->_composeAttachmentURLs, "addObject:", v24);
  }
  return v19;
}

- (void)loadAttachmentURL:(id)a3 forContextID:(id)a4
{
  id v6;

  v6 = -[MFAttachmentManager attachmentForCID:](self, "attachmentForCID:", a3);
  -[MFAttachmentComposeManager attachmentForData:mimeType:fileName:contentID:context:](self, "attachmentForData:mimeType:fileName:contentID:context:", objc_msgSend(v6, "fetchLocalData"), objc_msgSend(v6, "mimeType"), objc_msgSend(v6, "fileName"), objc_msgSend(v6, "contentID"), a4);
}

- (BOOL)updateAttachment:(id)a3 withNewData:(id)a4
{
  id v6;
  char isKindOfClass;

  v6 = -[MFAttachmentManager _dataProviderForAttachmentURL:error:](self, "_dataProviderForAttachmentURL:error:", objc_msgSend(a3, "url"), 0);
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v6, "removeDataForAttachment:", objc_msgSend(a3, "url"));
    objc_msgSend(v6, "addData:forContentID:", a4, objc_msgSend(a3, "contentID"));
  }
  return isKindOfClass & 1;
}

- (void)removeAttachmentForURL:(id)a3
{
  uint64_t v5;

  v5 = -[NSMutableArray indexOfObject:](self->_composeAttachmentURLs, "indexOfObject:", objc_msgSend(a3, "absoluteString"));
  if (v5 != 0x7FFFFFFFFFFFFFFFLL)
  {
    -[NSMutableArray removeObjectAtIndex:](self->_composeAttachmentURLs, "removeObjectAtIndex:", v5);
    objc_msgSend(-[MFAttachmentManager _dataProviderForAttachmentURL:error:](self, "_dataProviderForAttachmentURL:error:", a3, 0), "removeDataForAttachment:", a3);
  }
}

- (void)recordPasteboardAttachmentsForURLs:(id)a3 forContextID:(id)a4
{
  id v5;

  v5 = -[MFAttachmentComposeManager _composeAttachmentDataProviderForContext:](self, "_composeAttachmentDataProviderForContext:", a4);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v5, "recordPasteboardDataForAttachments:", a3);
}

- (void)recordUndoAttachmentsForURLs:(id)a3 forContextID:(id)a4
{
  id v5;

  v5 = -[MFAttachmentComposeManager _composeAttachmentDataProviderForContext:](self, "_composeAttachmentDataProviderForContext:", a4);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v5, "recordUndoDataForAttachments:", a3);
}

- (void)attachmentForData:mimeType:fileName:contentID:context:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_3(&dword_1C8839000, v0, v1, "#Attachments ContextID was nil for filename:%@ contentID:%@");
}

- (void)attachmentForData:mimeType:fileName:contentID:context:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_3(&dword_1C8839000, v0, v1, "#Attachments Data was nil for filename:%@ contentID:%@");
}

@end
