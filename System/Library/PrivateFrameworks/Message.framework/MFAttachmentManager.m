@implementation MFAttachmentManager

- (void)addProvider:(id)a3 forBaseURL:(id)a4
{
  id v6;
  NSMutableDictionary *v7;
  NSMutableDictionary *providers;
  void *v9;
  uint64_t v10;
  id v11;

  v11 = a3;
  v6 = a4;
  os_unfair_lock_lock(&self->_providersLock);
  if (!self->_providers)
  {
    v7 = (NSMutableDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 1);
    providers = self->_providers;
    self->_providers = v7;

  }
  os_unfair_lock_unlock(&self->_providersLock);
  objc_msgSend(v6, "absoluteString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "hasSuffix:", CFSTR("/")))
  {
    objc_msgSend(v9, "substringToIndex:", objc_msgSend(v9, "length") - 1);
    v10 = objc_claimAutoreleasedReturnValue();

    v9 = (void *)v10;
  }
  os_unfair_lock_lock(&self->_providersLock);
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_providers, "setObject:forKeyedSubscript:", v11, v9);
  os_unfair_lock_unlock(&self->_providersLock);

}

- (MFAttachmentManager)init
{
  MFAttachmentManager *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *attachments;
  dispatch_queue_t v5;
  OS_dispatch_queue *arrayAccessQueue;
  NSLock *v7;
  NSLock *metaDataLock;
  NSObject *v9;
  dispatch_queue_t v10;
  OS_dispatch_queue *imageScalingQueue;
  void *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)MFAttachmentManager;
  v2 = -[MFAttachmentManager init](&v14, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    attachments = v2->_attachments;
    v2->_attachments = v3;

    v5 = dispatch_queue_create("com.apple.mail.attachmentManagerAttachmentArray", 0);
    arrayAccessQueue = v2->_arrayAccessQueue;
    v2->_arrayAccessQueue = (OS_dispatch_queue *)v5;

    v7 = (NSLock *)objc_alloc_init(MEMORY[0x1E0CB3740]);
    metaDataLock = v2->_metaDataLock;
    v2->_metaDataLock = v7;

    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = dispatch_queue_create("com.apple.message.attachmentManager.imagescaling", v9);
    imageScalingQueue = v2->_imageScalingQueue;
    v2->_imageScalingQueue = (OS_dispatch_queue *)v10;

    v2->_providersLock._os_unfair_lock_opaque = 0;
    objc_msgSend((id)objc_opt_class(), "allManagers");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObject:", v2);

  }
  return v2;
}

+ (id)allManagers
{
  if (allManagers_onceToken != -1)
    dispatch_once(&allManagers_onceToken, &__block_literal_global_24);
  return (id)allManagers_sAllManagers;
}

void __34__MFAttachmentManager_allManagers__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0D46160]);
  v1 = (void *)allManagers_sAllManagers;
  allManagers_sAllManagers = (uint64_t)v0;

}

+ (OS_os_log)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __26__MFAttachmentManager_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_9 != -1)
    dispatch_once(&log_onceToken_9, block);
  return (OS_os_log *)(id)log_log_9;
}

void __26__MFAttachmentManager_log__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)log_log_9;
  log_log_9 = (uint64_t)v1;

}

+ (id)defaultManager
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a1, "allManagers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)supportedDocumentUTIs
{
  if (supportedDocumentUTIs_onceToken != -1)
    dispatch_once(&supportedDocumentUTIs_onceToken, &__block_literal_global_29);
  return (id)sSupportedUTIs;
}

void __44__MFAttachmentManager_supportedDocumentUTIs__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[3];

  v4[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)*MEMORY[0x1E0CEC498], "identifier");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = v0;
  objc_msgSend((id)*MEMORY[0x1E0CEC528], "identifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v4[1] = v1;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 2);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)sSupportedUTIs;
  sSupportedUTIs = v2;

}

- (void)removeProviderForBaseURL:(id)a3
{
  uint64_t v4;
  id v5;

  objc_msgSend(a3, "absoluteString");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "hasSuffix:", CFSTR("/")))
  {
    objc_msgSend(v5, "substringToIndex:", objc_msgSend(v5, "length") - 1);
    v4 = objc_claimAutoreleasedReturnValue();

    v5 = (id)v4;
  }
  os_unfair_lock_lock(&self->_providersLock);
  if (v5)
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_providers, "setObject:forKeyedSubscript:", 0, v5);
  os_unfair_lock_unlock(&self->_providersLock);

}

- (void)removeProvider:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  os_unfair_lock_lock(&self->_providersLock);
  -[NSMutableDictionary allKeysForObject:](self->_providers, "allKeysForObject:", v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(&self->_providersLock);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFAttachmentManager removeProviderForBaseURL:](self, "removeProviderForBaseURL:", v6);

  }
}

- (id)imageScalingQueue
{
  return self->_imageScalingQueue;
}

- (EDAttachmentPersistenceManager)persistenceManager
{
  EDAttachmentPersistenceManager *persistenceManager;
  void *v4;
  void *v5;
  EDAttachmentPersistenceManager *v6;
  EDAttachmentPersistenceManager *v7;

  persistenceManager = self->_persistenceManager;
  if (!persistenceManager)
  {
    +[MFMailMessageLibrary defaultInstance](MFMailMessageLibrary, "defaultInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "persistence");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "attachmentPersistenceManager");
    v6 = (EDAttachmentPersistenceManager *)objc_claimAutoreleasedReturnValue();
    v7 = self->_persistenceManager;
    self->_persistenceManager = v6;

    persistenceManager = self->_persistenceManager;
  }
  return persistenceManager;
}

- (BOOL)_setupAttachment:(id)a3 withMimeBody:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  BOOL v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  int v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  NSObject *v40;
  void *v41;
  void *v42;
  uint8_t buf[4];
  void *v45;
  __int16 v46;
  void *v47;
  __int16 v48;
  id v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  objc_msgSend(v8, "url");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "mf_isValidAttachmentURL");

  if ((v11 & 1) == 0)
  {
    if (a5)
    {
      +[MFError errorWithDomain:code:localizedDescription:title:userInfo:](MFError, "errorWithDomain:code:localizedDescription:title:userInfo:", CFSTR("MFMessageErrorDomain"), 1030, CFSTR("Invalid attachment URL."), CFSTR("Invalid Attachment URL"), 0);
      v14 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v14 = 0;
    }
    goto LABEL_25;
  }
  objc_msgSend(v8, "url");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFAttachmentManager _dataProviderForAttachmentURL:error:](self, "_dataProviderForAttachmentURL:error:", v12, a5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = v13 != 0;
  if (v13)
  {
    if (v9
      || (objc_msgSend(v13, "messageForAttachment:", v8),
          v15 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v15, "messageBody"),
          v9 = (id)objc_claimAutoreleasedReturnValue(),
          v15,
          v9))
    {
      objc_msgSend(v8, "url");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "mf_lastPartNumber");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "partWithNumber:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v8, "setPart:", v18);
      objc_msgSend(v8, "fileName");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (v19)
      {
        if (!v18)
          goto LABEL_18;
LABEL_12:
        v22 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v18, "type");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "subtype");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "stringWithFormat:", CFSTR("%@/%@"), v23, v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setMimeType:", v25);

        objc_msgSend(v8, "setEncodedFileSize:", objc_msgSend(v18, "approximateRawSize"));
        objc_msgSend(v18, "disposition");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setDisposition:", v26);

        objc_msgSend(v18, "dispositionParameterForKey:", CFSTR("remote-image"));
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        if (v27)
          objc_msgSend(v8, "setRemoteImageFileName:", v27);
        objc_msgSend(v8, "url");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "scheme");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = objc_msgSend(v29, "isEqualToString:", CFSTR("x-attach-maildrop-image"));

        if (v30)
        {
          objc_msgSend(v8, "remoteImageFileName");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "setFileName:", v31);

          objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "path");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "attributesOfItemAtPath:error:", v33, 0);
          v34 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v8, "setEncodedFileSize:", objc_msgSend(v34, "fileSize"));
        }

        goto LABEL_18;
      }
      objc_msgSend(v18, "attachmentFilename");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "ef_sanitizedFileName");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setFileName:", v21);

      if (v18)
        goto LABEL_12;
    }
    else
    {
      v18 = 0;
    }
LABEL_18:
    -[MFAttachmentManager metadataForAttachment:forKey:](self, "metadataForAttachment:forKey:", v8, CFSTR("MFAttachmentContentIDKey"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v35)
    {
      objc_msgSend(v18, "contentID");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v35)
      {
        objc_msgSend(v18, "bodyParameterForKey:", *MEMORY[0x1E0D45F28]);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v35)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "mf_messageIDStringWithDomainHint:", 0);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
        }
      }
      -[MFAttachmentManager setContentID:forAttachment:](self, "setContentID:forAttachment:", v35, v8);
    }

  }
LABEL_25:
  objc_msgSend(v8, "mimePartNumber");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = v36;
  if (v36)
  {
    v38 = v36;
  }
  else
  {
    objc_msgSend(v8, "part");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "partNumber");
    v38 = (id)objc_claimAutoreleasedReturnValue();

  }
  EDAttachmentsLog();
  v40 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v8, "ef_publicDescription");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "fileName");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v45 = v41;
    v46 = 2112;
    v47 = v42;
    v48 = 2114;
    v49 = v38;
    _os_log_impl(&dword_1A4F90000, v40, OS_LOG_TYPE_DEFAULT, "Setup attachment %{public}@, name = %@, part number = %{public}@", buf, 0x20u);

  }
  return v14;
}

- (id)_filePathForAttachment:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  _QWORD v14[4];

  v14[3] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "url");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFAttachmentManager _dataProviderForAttachmentURL:error:](self, "_dataProviderForAttachmentURL:error:", v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v6, "messageForAttachment:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "url");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFAttachmentManager _dataProviderForAttachmentURL:error:](self, "_dataProviderForAttachmentURL:error:", v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "storageLocationForAttachment:withMessage:", v4, v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    EDAttachmentsLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v4, "url");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[MFAttachmentManager _filePathForAttachment:].cold.1(v12, (uint64_t)v14, v11);
    }

    v10 = 0;
  }

  return v10;
}

- (id)_dataProviderForAttachmentURL:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;

  v5 = a3;
  objc_msgSend(v5, "mf_partNumbers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count"))
  {
    objc_msgSend(v5, "URLByDeletingLastPathComponent");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "count");
    if (v8 == -1)
    {
LABEL_8:
      if (a4)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MFMessageErrorDomain"), 1030, &unk_1E4F6A4A0);
        v13 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v13 = 0;
      }
      v10 = (void *)v7;
    }
    else
    {
      v9 = v8 + 1;
      v10 = (void *)v7;
      while (1)
      {
        objc_msgSend(v10, "absoluteString");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v11, "hasSuffix:", CFSTR("/")))
        {
          objc_msgSend(v11, "substringToIndex:", objc_msgSend(v11, "length") - 1);
          v12 = objc_claimAutoreleasedReturnValue();

          v11 = (void *)v12;
        }
        os_unfair_lock_lock(&self->_providersLock);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_providers, "objectForKeyedSubscript:", v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        os_unfair_lock_unlock(&self->_providersLock);
        if (v13)
          break;
        objc_msgSend(v10, "URLByDeletingLastPathComponent");
        v7 = objc_claimAutoreleasedReturnValue();

        v10 = (void *)v7;
        if (!--v9)
          goto LABEL_8;
      }

    }
  }
  else if (a4)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MFMessageErrorDomain"), 1030, &unk_1E4F6A478);
    v13 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)attachmentForURL:(id)a3 error:(id *)a4
{
  -[MFAttachmentManager attachmentForURL:withMimeBody:error:](self, "attachmentForURL:withMimeBody:error:", a3, 0, a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)attachmentForURL:(id)a3 withMimeBody:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  MFAttachment *v10;
  MFAttachment *v11;

  v8 = a3;
  v9 = a4;
  if (!v8)
  {
    v10 = 0;
    goto LABEL_5;
  }
  v10 = -[MFAttachment initWithURL:attachmentManager:]([MFAttachment alloc], "initWithURL:attachmentManager:", v8, self);
  if (-[MFAttachmentManager _setupAttachment:withMimeBody:error:](self, "_setupAttachment:withMimeBody:error:", v10, v9, a5))
  {
LABEL_5:
    v10 = v10;
    v11 = v10;
    goto LABEL_6;
  }
  v11 = 0;
LABEL_6:

  return v11;
}

- (id)attachmentsForURLs:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v6, "count"));
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v8);
        -[MFAttachmentManager attachmentForURL:error:](self, "attachmentForURL:error:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i), a4, (_QWORD)v14);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v12)
        {

          v7 = 0;
          goto LABEL_11;
        }
        objc_msgSend(v7, "addObject:", v12);

      }
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v9)
        continue;
      break;
    }
  }
LABEL_11:

  return v7;
}

- (id)attachmentForTextAttachment:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = a3;
  objc_msgSend(v6, "mimePart");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "partURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "mimePart");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "mimeBody");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[MFAttachmentManager attachmentForURL:withMimeBody:error:](self, "attachmentForURL:withMimeBody:error:", v8, v10, a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
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
  -[MFAttachmentManager attachmentForContentID:preferredSchemes:](self, "attachmentForContentID:preferredSchemes:", v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)attachmentForContentID:(id)a3
{
  -[MFAttachmentManager attachmentForContentID:preferredSchemes:](self, "attachmentForContentID:preferredSchemes:", a3, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)attachmentForContentID:(id)a3 preferredSchemes:(id)a4
{
  id v6;
  id v7;
  NSMutableDictionary *metadata;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _QWORD v25[4];
  id v26;
  id v27;
  id v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "length"))
  {
    v20 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    -[NSLock lock](self->_metaDataLock, "lock");
    metadata = self->_metadata;
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __63__MFAttachmentManager_attachmentForContentID_preferredSchemes___block_invoke;
    v25[3] = &unk_1E4E8B9E0;
    v26 = v6;
    v9 = v20;
    v27 = v9;
    v10 = v7;
    v28 = v10;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](metadata, "enumerateKeysAndObjectsUsingBlock:", v25);
    -[NSLock unlock](self->_metaDataLock, "unlock");
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v11 = v10;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
    if (v12)
    {
      v13 = *(_QWORD *)v22;
      while (2)
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v22 != v13)
            objc_enumerationMutation(v11);
          objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * v14), "lowercaseString");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "objectForKeyedSubscript:", v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          if (v16)
          {

            goto LABEL_13;
          }
          ++v14;
        }
        while (v12 != v14);
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
        if (v12)
          continue;
        break;
      }
    }

    objc_msgSend(v9, "allValues");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "firstObject");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
LABEL_13:
      -[MFAttachmentManager attachmentForURL:error:](self, "attachmentForURL:error:", v16, 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v18 = 0;
    }

  }
  else
  {
    v18 = 0;
  }

  return v18;
}

void __63__MFAttachmentManager_attachmentForContentID_preferredSchemes___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;

  v14 = a2;
  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("MFAttachmentContentIDKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(*(id *)(a1 + 32), "caseInsensitiveCompare:", v7))
  {
    v8 = *(void **)(a1 + 40);
    objc_msgSend(v14, "scheme");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "lowercaseString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v14, v10);

    if (!objc_msgSend(*(id *)(a1 + 48), "count")
      || (objc_msgSend(v14, "scheme"),
          v11 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(*(id *)(a1 + 48), "firstObject"),
          v12 = (void *)objc_claimAutoreleasedReturnValue(),
          v13 = objc_msgSend(v11, "caseInsensitiveCompare:", v12),
          v12,
          v11,
          !v13))
    {
      *a4 = 1;
    }
  }

}

- (id)attachmentsForContext:(id)a3
{
  return 0;
}

- (void)insertMessageAttachmentMetadataToPersistence:(id)a3 forMessage:(id)a4
{
  NSObject *v5;
  uint64_t v6;
  int v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  const __CFString *v21;
  NSObject *v22;
  uint64_t v23;
  __CFString *v24;
  __CFString *obj;
  uint64_t v27;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t buf[4];
  const __CFString *v34;
  __int16 v35;
  __CFString *v36;
  __int16 v37;
  uint64_t v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v24 = (__CFString *)a3;
  v28 = a4;
  EDAttachmentsLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v34 = v24;
    _os_log_impl(&dword_1A4F90000, v5, OS_LOG_TYPE_DEFAULT, "Inserting message attachment metadata for attachments %{public}@ into the persistence", buf, 0xCu);
  }

  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  obj = v24;
  v6 = -[__CFString countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v29, v39, 16);
  if (v6)
  {
    v27 = *(_QWORD *)v30;
    LOBYTE(v7) = 1;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v30 != v27)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
        objc_msgSend(v9, "mimePartNumber");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = v10;
        if (v10)
        {
          v12 = v10;
        }
        else
        {
          objc_msgSend(v9, "part");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "partNumber");
          v12 = (id)objc_claimAutoreleasedReturnValue();

        }
        v14 = objc_alloc(MEMORY[0x1E0D1EB10]);
        v15 = objc_msgSend(v28, "globalMessageID");
        objc_msgSend(v9, "fileName");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "mailDropMetadata");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "directUrl");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = (void *)objc_msgSend(v14, "initWithGlobalMessageID:name:mimePart:attachmentID:remoteURL:", v15, v16, v12, 0, v18);

        if ((v7 & 1) != 0)
        {
          -[MFAttachmentManager persistenceManager](self, "persistenceManager");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v7 = objc_msgSend(v20, "persistAttachmentMetadata:", v19);

        }
        else
        {
          v7 = 0;
        }

      }
      v6 = -[__CFString countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v29, v39, 16);
    }
    while (v6);

    if (!v7)
    {
      v21 = CFSTR("Failed");
      goto LABEL_20;
    }
  }
  else
  {

  }
  v21 = CFSTR("Succeeded");
LABEL_20:
  EDAttachmentsLog();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    v23 = objc_msgSend(v28, "globalMessageID");
    *(_DWORD *)buf = 138412802;
    v34 = v21;
    v35 = 2114;
    v36 = obj;
    v37 = 2048;
    v38 = v23;
    _os_log_impl(&dword_1A4F90000, v22, OS_LOG_TYPE_DEFAULT, "%@ at inserting message attachment metadata for attachments %{public}@ for message %lld", buf, 0x20u);
  }

}

- (id)_fetchDataForAttachment:(id)a3 withProvider:(id)a4 request:(id)a5 syncLock:(id *)a6
{
  id v10;
  id v11;
  id v12;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  -[MFAttachmentManager doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __assert_rtn("-[MFAttachmentManager _fetchDataForAttachment:withProvider:request:syncLock:]", "MFAttachmentManager.m", 401, "0");
}

- (id)fetchDataForAttachment:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  _MFAttachmentActiveRequest *v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  NSObject *arrayAccessQueue;
  id v18;
  _MFAttachmentActiveRequest *v19;
  void *v20;
  _MFAttachmentActiveRequest *v21;
  NSObject *v22;
  void *v23;
  _QWORD v25[5];
  id v26;
  _QWORD block[5];
  id v28;
  id v29;
  _MFAttachmentActiveRequest *v30;
  _QWORD v31[4];
  id v32;
  _MFAttachmentActiveRequest *v33;
  id v34;
  uint8_t buf[4];
  id v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "updatePath");
  objc_msgSend(v4, "fileURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5 && objc_msgSend(v5, "checkResourceIsReachableAndReturnError:", 0))
  {
    EDAttachmentsLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v4, "url");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v36 = v6;
      v37 = 2114;
      v38 = v8;
      _os_log_impl(&dword_1A4F90000, v7, OS_LOG_TYPE_DEFAULT, "Passing attachment data URL off disk for file %@ '%{public}@'.", buf, 0x16u);

    }
    objc_msgSend(v4, "fetchCompletionBlock");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    if (v9)
      (*(void (**)(uint64_t, id, _QWORD, _QWORD))(v9 + 16))(v9, v6, 0, 0);
    objc_msgSend(MEMORY[0x1E0CB38A8], "discreteProgressWithTotalUnitCount:", 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setCompletedUnitCount:", 1);
  }
  else
  {

    objc_msgSend(v4, "url");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = 0;
    -[MFAttachmentManager _dataProviderForAttachmentURL:error:](self, "_dataProviderForAttachmentURL:error:", v12, &v34);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v34;

    if (v10)
    {
      v13 = -[_MFAttachmentActiveRequest initWithAttachment:]([_MFAttachmentActiveRequest alloc], "initWithAttachment:", v4);
      EDAttachmentsLog();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v4, "url");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v36 = v15;
        _os_log_impl(&dword_1A4F90000, v14, OS_LOG_TYPE_DEFAULT, "Fetch data for attachment url: %@", buf, 0xCu);

      }
      v16 = MEMORY[0x1E0C809B0];
      arrayAccessQueue = self->_arrayAccessQueue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __46__MFAttachmentManager_fetchDataForAttachment___block_invoke_76;
      block[3] = &unk_1E4E8BA30;
      block[4] = self;
      v18 = v4;
      v28 = v18;
      v29 = v10;
      v19 = v13;
      v30 = v19;
      dispatch_async(arrayAccessQueue, block);
      objc_msgSend(MEMORY[0x1E0CB38A8], "discreteProgressWithTotalUnitCount:", 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[_MFAttachmentActiveRequest downloadProgress](v19, "downloadProgress");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addChild:withPendingUnitCount:", v20, 1);

      v25[0] = v16;
      v25[1] = 3221225472;
      v25[2] = __46__MFAttachmentManager_fetchDataForAttachment___block_invoke_2;
      v25[3] = &unk_1E4E88EE8;
      v25[4] = self;
      v26 = v18;
      objc_msgSend(v11, "setCancellationHandler:", v25);

    }
    else
    {
      objc_msgSend(v4, "fetchCompletionBlock");
      v21 = (_MFAttachmentActiveRequest *)objc_claimAutoreleasedReturnValue();
      v19 = v21;
      if (v21)
      {
        v31[0] = MEMORY[0x1E0C809B0];
        v31[1] = 3221225472;
        v31[2] = __46__MFAttachmentManager_fetchDataForAttachment___block_invoke;
        v31[3] = &unk_1E4E8BA08;
        v33 = v21;
        v32 = v6;
        dispatch_async(MEMORY[0x1E0C80D38], v31);

      }
      EDAttachmentsLog();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v4, "url");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[MFAttachmentManager fetchDataForAttachment:].cold.1(v23, (uint64_t)buf, v22);
      }

      v11 = 0;
    }

  }
  return v11;
}

uint64_t __46__MFAttachmentManager_fetchDataForAttachment___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, 0, *(_QWORD *)(a1 + 32));
}

id __46__MFAttachmentManager_fetchDataForAttachment___block_invoke_76(uint64_t a1)
{
  return (id)objc_msgSend(*(id *)(a1 + 32), "_fetchDataForAttachment:withProvider:request:syncLock:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), 0);
}

uint64_t __46__MFAttachmentManager_fetchDataForAttachment___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_cancelFetchForAttachment:", *(_QWORD *)(a1 + 40));
}

- (void)fetchDataSynchronouslyForAttachment:(id)a3
{
  id v4;
  void (**v5)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v6;
  void *v7;
  id v8;
  NSObject *arrayAccessQueue;
  id v10;
  void *v11;
  int v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(_QWORD *);
  void *v20;
  id v21;
  MFAttachmentManager *v22;
  id v23;
  uint64_t *v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;
  id v38;

  v4 = a3;
  objc_msgSend(v4, "fetchCompletionBlock");
  v5 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFetchCompletionBlock:", 0);
  objc_msgSend(v4, "url");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = 0;
  -[MFAttachmentManager _dataProviderForAttachmentURL:error:](self, "_dataProviderForAttachmentURL:error:", v6, &v38);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v38;

  if (v7)
  {
    v32 = 0;
    v33 = &v32;
    v34 = 0x3032000000;
    v35 = __Block_byref_object_copy__8;
    v36 = __Block_byref_object_dispose__8;
    v37 = 0;
    v26 = 0;
    v27 = &v26;
    v28 = 0x3032000000;
    v29 = __Block_byref_object_copy__8;
    v30 = __Block_byref_object_dispose__8;
    v31 = 0;
    arrayAccessQueue = self->_arrayAccessQueue;
    v17 = MEMORY[0x1E0C809B0];
    v18 = 3221225472;
    v19 = __59__MFAttachmentManager_fetchDataSynchronouslyForAttachment___block_invoke;
    v20 = &unk_1E4E8BA58;
    v10 = v4;
    v24 = &v32;
    v21 = v10;
    v22 = self;
    v23 = v7;
    v25 = &v26;
    dispatch_sync(arrayAccessQueue, &v17);
    if (!objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread", v17, v18, v19, v20)
      || (EFIsRunningUnitTests() & 1) != 0)
    {
      objc_msgSend((id)v27[5], "lockWhenCondition:", 1);
    }
    else if ((objc_msgSend((id)v27[5], "tryLockWhenCondition:", 1) & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0D1EEA8], "currentDevice");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "isInternal");

      if (v12)
      {
        MFLogGeneral();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          -[MFAttachmentManager fetchDataSynchronouslyForAttachment:].cold.1(v13);

      }
      v14 = (void *)v33[5];
      v33[5] = 0;

      goto LABEL_14;
    }
    objc_msgSend((id)v27[5], "unlock");
LABEL_14:
    if (v5)
    {
      objc_msgSend(v10, "fileURL");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v33[5], "data");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *, void *, _QWORD))v5)[2](v5, v15, v16, 0);

    }
    _Block_object_dispose(&v26, 8);

    _Block_object_dispose(&v32, 8);
    goto LABEL_17;
  }
  if (v5)
    ((void (**)(_QWORD, _QWORD, _QWORD, id))v5)[2](v5, 0, 0, v8);
LABEL_17:

}

void __59__MFAttachmentManager_fetchDataSynchronouslyForAttachment___block_invoke(_QWORD *a1)
{
  _MFAttachmentActiveRequest *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id obj;

  v2 = -[_MFAttachmentActiveRequest initWithAttachment:]([_MFAttachmentActiveRequest alloc], "initWithAttachment:", a1[4]);
  v4 = a1[4];
  v3 = (void *)a1[5];
  v5 = a1[6];
  v6 = *(_QWORD *)(a1[8] + 8);
  obj = *(id *)(v6 + 40);
  objc_msgSend(v3, "_fetchDataForAttachment:withProvider:request:syncLock:", v4, v5, v2, &obj);
  v7 = objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v6 + 40), obj);
  v8 = *(_QWORD *)(a1[7] + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

}

- (void)_fetchCompletedForAttachment:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  NSObject *arrayAccessQueue;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void (**v16)(void *, _QWORD);
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  BOOL v22;
  void *v23;
  _QWORD v24[4];
  id v25;
  void (**v26)(void *, _QWORD);
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _QWORD aBlock[4];
  id v32;
  id v33;
  _QWORD block[5];
  id v35;
  uint64_t *v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t (*v41)(uint64_t, uint64_t);
  void (*v42)(uint64_t);
  id v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t (*v47)(uint64_t, uint64_t);
  void (*v48)(uint64_t);
  id v49;
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v44 = 0;
  v45 = &v44;
  v46 = 0x3032000000;
  v47 = __Block_byref_object_copy__8;
  v48 = __Block_byref_object_dispose__8;
  v49 = 0;
  v38 = 0;
  v39 = &v38;
  v40 = 0x3032000000;
  v41 = __Block_byref_object_copy__8;
  v42 = __Block_byref_object_dispose__8;
  v43 = 0;
  objc_msgSend(v6, "updatePathIfNeeded", v6, v7);
  arrayAccessQueue = self->_arrayAccessQueue;
  v9 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__MFAttachmentManager__fetchCompletedForAttachment_error___block_invoke;
  block[3] = &unk_1E4E8BA80;
  v36 = &v44;
  block[4] = self;
  v10 = v6;
  v35 = v10;
  v37 = &v38;
  dispatch_sync(arrayAccessQueue, block);
  objc_msgSend((id)v45[5], "objectForKey:", CFSTR("MFAttachmentPrimaryConsumerKey"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v11;
  if (v7)
  {
    v12 = 0;
  }
  else
  {
    objc_msgSend(v11, "data");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend((id)v39[5], "ef_partition:", &__block_literal_global_81);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  aBlock[0] = v9;
  aBlock[1] = 3221225472;
  aBlock[2] = __58__MFAttachmentManager__fetchCompletedForAttachment_error___block_invoke_2;
  aBlock[3] = &unk_1E4E8BAE8;
  v14 = v7;
  v32 = v14;
  v15 = v12;
  v33 = v15;
  v16 = (void (**)(void *, _QWORD))_Block_copy(aBlock);
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  objc_msgSend(v13, "first");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v27, v50, 16);
  if (v18)
  {
    v19 = *(_QWORD *)v28;
    do
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v28 != v19)
          objc_enumerationMutation(v17);
        v16[2](v16, *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * v20++));
      }
      while (v18 != v20);
      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v27, v50, 16);
    }
    while (v18);
  }

  objc_msgSend(v13, "second");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "count") == 0;

  if (!v22)
  {
    v24[0] = v9;
    v24[1] = 3221225472;
    v24[2] = __58__MFAttachmentManager__fetchCompletedForAttachment_error___block_invoke_3;
    v24[3] = &unk_1E4E8BB10;
    v25 = v13;
    v26 = v16;
    dispatch_async(MEMORY[0x1E0C80D38], v24);

  }
  _Block_object_dispose(&v38, 8);

  _Block_object_dispose(&v44, 8);
}

void __58__MFAttachmentManager__fetchCompletedForAttachment_error___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  int v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  objc_msgSend(*(id *)(a1 + 40), "url");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "copy");
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  objc_msgSend(*(id *)(a1 + 40), "url");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    MFLogGeneral();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v10 = *(_QWORD *)(a1 + 40);
      v16 = 138412290;
      v17 = v10;
      _os_log_impl(&dword_1A4F90000, v9, OS_LOG_TYPE_INFO, "#Attachments removing attachment %@", (uint8_t *)&v16, 0xCu);
    }

    v11 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
    objc_msgSend(*(id *)(a1 + 40), "url");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "removeObjectForKey:", v12);

  }
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "objectForKey:", CFSTR("MFAttachmentAttachmentKey"));
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v15 = *(void **)(v14 + 40);
  *(_QWORD *)(v14 + 40) = v13;

}

uint64_t __58__MFAttachmentManager__fetchCompletedForAttachment_error___block_invoke_79(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "wantsCompletionBlockOffMainThread");
}

void __58__MFAttachmentManager__fetchCompletedForAttachment_error___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  objc_msgSend(v5, "downloadProgress");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (*(_QWORD *)(a1 + 32))
    objc_msgSend(v3, "cancel");
  else
    objc_msgSend(v3, "setCompletedUnitCount:", objc_msgSend(v3, "totalUnitCount"));
  objc_msgSend(v5, "completeWithData:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));

}

void __58__MFAttachmentManager__fetchCompletedForAttachment_error___block_invoke_3(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  _BYTE v10[128];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v6 = 0u;
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "second", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v7;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v7 != v4)
          objc_enumerationMutation(v2);
        (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
        ++v5;
      }
      while (v3 != v5);
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
    }
    while (v3);
  }

}

- (void)_cancelFetchForAttachment:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *arrayAccessQueue;
  id v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[MFAttachmentManager log](MFAttachmentManager, "log");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v11 = v4;
    _os_log_impl(&dword_1A4F90000, v5, OS_LOG_TYPE_DEFAULT, "Canceling download for attachment %@", buf, 0xCu);
  }

  arrayAccessQueue = self->_arrayAccessQueue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __49__MFAttachmentManager__cancelFetchForAttachment___block_invoke;
  v8[3] = &unk_1E4E88EE8;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_async(arrayAccessQueue, v8);

}

void __49__MFAttachmentManager__cancelFetchForAttachment___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t);
  void *v19;
  id v20;
  _QWORD v21[4];
  id v22;
  uint8_t buf[4];
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  objc_msgSend(*(id *)(a1 + 40), "url");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("MFAttachmentAttachmentKey"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = MEMORY[0x1E0C809B0];
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __49__MFAttachmentManager__cancelFetchForAttachment___block_invoke_2;
    v21[3] = &unk_1E4E8BB38;
    v22 = *(id *)(a1 + 40);
    objc_msgSend(v5, "indexesOfObjectsPassingTest:", v21);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectsAtIndexes:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeObjectsAtIndexes:", v7);
    v16 = v6;
    v17 = 3221225472;
    v18 = __49__MFAttachmentManager__cancelFetchForAttachment___block_invoke_3;
    v19 = &unk_1E4E88DC8;
    v9 = v8;
    v20 = v9;
    dispatch_sync(MEMORY[0x1E0C80D38], &v16);
    if (!objc_msgSend(v5, "count", v16, v17, v18, v19))
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("MFAttachmentMonitorKey"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "cancel");

      MFLogGeneral();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        v12 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)buf = 138412290;
        v24 = v12;
        _os_log_impl(&dword_1A4F90000, v11, OS_LOG_TYPE_INFO, "removing attachment %@", buf, 0xCu);
      }

      v13 = *(void **)(a1 + 40);
      v14 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
      objc_msgSend(v13, "url");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "removeObjectForKey:", v15);

    }
  }

}

BOOL __49__MFAttachmentManager__cancelFetchForAttachment___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  _BOOL8 v4;

  objc_msgSend(a2, "attachment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 == *(void **)(a1 + 32);

  return v4;
}

void __49__MFAttachmentManager__cancelFetchForAttachment___block_invoke_3(uint64_t a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v1 = *(id *)(a1 + 32);
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v2)
  {
    v3 = *(_QWORD *)v8;
    do
    {
      v4 = 0;
      do
      {
        if (*(_QWORD *)v8 != v3)
          objc_enumerationMutation(v1);
        v5 = *(void **)(*((_QWORD *)&v7 + 1) + 8 * v4);
        +[MFError errorWithDomain:code:localizedDescription:title:userInfo:](MFError, "errorWithDomain:code:localizedDescription:title:userInfo:", CFSTR("MFMessageErrorDomain"), 1028, CFSTR("Download Canceled."), CFSTR("Download Canceled"), 0, (_QWORD)v7);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "completeWithData:error:", 0, v6);

        ++v4;
      }
      while (v2 != v4);
      v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v2);
  }

}

- (id)attachmentForData:(id)a3 mimeType:(id)a4 fileName:(id)a5 contentID:(id)a6 context:(id)a7
{
  return 0;
}

- (id)attachmentForItemProvider:(id)a3 mimeType:(id)a4 fileName:(id)a5 contentID:(id)a6 context:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  -[MFAttachmentManager doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __assert_rtn("-[MFAttachmentManager attachmentForItemProvider:mimeType:fileName:contentID:context:]", "MFAttachmentManager.m", 591, "0");
}

- (BOOL)updateAttachment:(id)a3 withNewData:(id)a4
{
  return 0;
}

- (void)setContentID:(id)a3 forAttachment:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  int v9;
  id v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;

  v12 = a3;
  v6 = a4;
  if (objc_msgSend(v12, "hasPrefix:", CFSTR("<")))
  {
    objc_msgSend(v12, "substringFromIndex:", 1);
    v7 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v7;
  }
  else
  {
    v8 = v12;
  }
  v13 = v8;
  v9 = objc_msgSend(v8, "hasSuffix:", CFSTR(">"));
  v10 = v13;
  if (v9)
  {
    objc_msgSend(v13, "substringToIndex:", objc_msgSend(v13, "length") - 1);
    v11 = objc_claimAutoreleasedReturnValue();

    v10 = (id)v11;
  }
  v14 = v10;
  -[MFAttachmentManager setMetadataForAttachment:toValue:forKey:](self, "setMetadataForAttachment:toValue:forKey:", v6, v10, CFSTR("MFAttachmentContentIDKey"));

}

- (id)_contentIDForAttachment:(id)a3
{
  -[MFAttachmentManager metadataForAttachment:forKey:](self, "metadataForAttachment:forKey:", a3, CFSTR("MFAttachmentContentIDKey"));
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)setMetadataForAttachment:(id)a3 toValue:(id)a4 forKey:(id)a5
{
  id v8;
  id v9;
  void *v10;
  NSMutableDictionary *metadata;
  NSMutableDictionary *v12;
  NSMutableDictionary *v13;
  void *v14;
  void *v15;
  id v16;
  NSMutableDictionary *v17;
  void *v18;
  id v19;

  v19 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(v19, "url");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[NSLock lock](self->_metaDataLock, "lock");
    metadata = self->_metadata;
    if (!metadata)
    {
      v12 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      v13 = self->_metadata;
      self->_metadata = v12;

      metadata = self->_metadata;
    }
    objc_msgSend(v19, "url");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](metadata, "objectForKeyedSubscript:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v15)
    {
      v16 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v17 = self->_metadata;
      objc_msgSend(v19, "url");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](v17, "setObject:forKeyedSubscript:", v16, v18);

      v15 = v16;
    }
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v8, v9);
    -[NSLock unlock](self->_metaDataLock, "unlock");

  }
}

- (id)metadataForAttachment:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  NSMutableDictionary *metadata;
  void *v9;
  void *v10;
  void *v11;

  v6 = a3;
  v7 = a4;
  -[NSLock lock](self->_metaDataLock, "lock");
  metadata = self->_metadata;
  objc_msgSend(v6, "url");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](metadata, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSLock unlock](self->_metaDataLock, "unlock");
  return v11;
}

- (void)clearMetadataForAttachment:(id)a3
{
  void *v4;
  NSMutableDictionary *metadata;
  void *v6;
  id v7;

  v7 = a3;
  objc_msgSend(v7, "url");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[NSLock lock](self->_metaDataLock, "lock");
    metadata = self->_metadata;
    objc_msgSend(v7, "url");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary removeObjectForKey:](metadata, "removeObjectForKey:", v6);

    -[NSLock unlock](self->_metaDataLock, "unlock");
  }

}

- (id)prepareAttachmentForDisplay:(id)a3 fileURL:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  _QWORD v17[5];
  id v18;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v7)
  {
    v9 = v7;
  }
  else
  {
    objc_msgSend(v6, "fileURL");
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  v10 = v9;
  objc_msgSend(v6, "fileUTType");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithIdentifier:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = 0;
  }
  -[MFAttachmentManager persistenceManager](self, "persistenceManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __59__MFAttachmentManager_prepareAttachmentForDisplay_fileURL___block_invoke;
  v17[3] = &unk_1E4E8BB60;
  v17[4] = self;
  v14 = v6;
  v18 = v14;
  objc_msgSend(v13, "addSynapseAttributesToAttachmentWithURL:contentType:usingGenerator:", v10, v12, v17);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

uint64_t __59__MFAttachmentManager_prepareAttachmentForDisplay_fileURL___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_createSynapseAttributesForAttachment:", *(_QWORD *)(a1 + 40));
}

- (id)_createSynapseAttributesForAttachment:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v18;
  uint8_t buf[24];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "url");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  -[MFAttachmentManager _dataProviderForAttachmentURL:error:](self, "_dataProviderForAttachmentURL:error:", v5, &v18);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v18;

  if (v6)
  {
    objc_msgSend(v6, "messageForAttachment:", v4);
    v8 = objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = objc_alloc(MEMORY[0x1E0D1EC68]);
      -[NSObject senderAddressComment](v8, "senderAddressComment");
      v10 = objc_claimAutoreleasedReturnValue();
      -[NSObject firstSender](v8, "firstSender");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject persistentID](v8, "persistentID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject dateReceived](v8, "dateReceived");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)objc_msgSend(v9, "initWithSenderAddressComment:senderAddress:messagePersistentID:receivedDate:", v10, v11, v12, v13);

    }
    else
    {
      EDAttachmentsLog();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v4, "url");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[MFAttachmentManager _createSynapseAttributesForAttachment:].cold.2(v16, (uint64_t)buf, v10);
      }
      v14 = 0;
    }

  }
  else
  {
    EDAttachmentsLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v4, "url");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[MFAttachmentManager _createSynapseAttributesForAttachment:].cold.1(v15, (uint64_t)v7, buf, v8);
    }
    v14 = 0;
  }

  return v14;
}

- (void)setPersistenceManager:(id)a3
{
  objc_storeStrong((id *)&self->_persistenceManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_persistenceManager, 0);
  objc_storeStrong((id *)&self->_imageScalingQueue, 0);
  objc_storeStrong((id *)&self->_metaDataLock, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_attachments, 0);
  objc_storeStrong((id *)&self->_providers, 0);
  objc_storeStrong((id *)&self->_arrayAccessQueue, 0);
}

- (void)_filePathForAttachment:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138412290;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_0_2(&dword_1A4F90000, a2, a3, "Failed to create a data provider that generates attachment file path for attachment url: %@", (uint8_t *)a2);

  OUTLINED_FUNCTION_1();
}

- (void)fetchDataForAttachment:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138412290;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_0_2(&dword_1A4F90000, a2, a3, "Failed to create MFAttachmentDataProvider for attachment url: %@", (uint8_t *)a2);

  OUTLINED_FUNCTION_1();
}

- (void)fetchDataSynchronouslyForAttachment:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1A4F90000, log, OS_LOG_TYPE_ERROR, "#Attachments FIXME: Blocking call requested on the main thread", v1, 2u);
}

- (void)_createSynapseAttributesForAttachment:(uint8_t *)buf .cold.1(void *a1, uint64_t a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543618;
  *(_QWORD *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2112;
  *(_QWORD *)(buf + 14) = a2;
  _os_log_error_impl(&dword_1A4F90000, log, OS_LOG_TYPE_ERROR, "Not adding Synapse attributes - unable to find provider for attachment %{public}@ error %@", buf, 0x16u);

  OUTLINED_FUNCTION_1();
}

- (void)_createSynapseAttributesForAttachment:(NSObject *)a3 .cold.2(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138543362;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_0_2(&dword_1A4F90000, a2, a3, "Not adding Synapse attributes - unable to find message for attachment %{public}@", (uint8_t *)a2);

  OUTLINED_FUNCTION_1();
}

@end
