@implementation MFAttachmentManager

- (void)removeProviderForBaseURL:(id)a3
{
  void *v4;

  v4 = (void *)objc_msgSend(a3, "absoluteString");
  if (objc_msgSend(v4, "hasSuffix:", CFSTR("/")))
    v4 = (void *)objc_msgSend(v4, "substringToIndex:", objc_msgSend(v4, "length") - 1);
  if (v4)
    -[NSMutableDictionary removeObjectForKey:](self->_providers, "removeObjectForKey:", v4);
}

+ (id)allManagers
{
  if (allManagers_onceToken != -1)
    dispatch_once(&allManagers_onceToken, &__block_literal_global_10);
  return (id)allManagers_sAllManagers;
}

id __34__MFAttachmentManager_allManagers__block_invoke()
{
  id result;

  result = objc_alloc_init(MEMORY[0x1E0D46160]);
  allManagers_sAllManagers = (uint64_t)result;
  return result;
}

+ (id)defaultManager
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1, "allManagers"), "allObjects"), "firstObject");
}

- (MFAttachmentManager)init
{
  MFAttachmentManager *v2;
  NSObject *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MFAttachmentManager;
  v2 = -[MFAttachmentManager init](&v5, sel_init);
  if (v2)
  {
    v2->_attachments = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v2->_arrayAccessQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.mail.attachmentManagerAttachmentArray", 0);
    v2->_metaDataLock = (NSLock *)objc_alloc_init(MEMORY[0x1E0CB3740]);
    v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    v2->_imageScalingQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.message.attachmentManager.imagescaling", v3);
    objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allManagers"), "addObject:", v2);
  }
  return v2;
}

- (void)dealloc
{
  NSObject *arrayAccessQueue;
  objc_super v4;

  arrayAccessQueue = self->_arrayAccessQueue;
  if (arrayAccessQueue)
    dispatch_release(arrayAccessQueue);
  objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allManagers"), "removeObject:", self);

  v4.receiver = self;
  v4.super_class = (Class)MFAttachmentManager;
  -[MFAttachmentManager dealloc](&v4, sel_dealloc);
}

+ (id)supportedDocumentUTIs
{
  if (supportedDocumentUTIs_onceToken != -1)
    dispatch_once(&supportedDocumentUTIs_onceToken, &__block_literal_global_24);
  return (id)_supportedUTIs;
}

id __44__MFAttachmentManager_supportedDocumentUTIs__block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v13[26];

  v13[25] = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0CA5C18];
  v13[0] = *MEMORY[0x1E0CA5B18];
  v13[1] = v0;
  v1 = *MEMORY[0x1E0CA5C88];
  v13[2] = *MEMORY[0x1E0CA5AE8];
  v13[3] = v1;
  v2 = *MEMORY[0x1E0CA5B78];
  v13[4] = *MEMORY[0x1E0CA5B20];
  v13[5] = v2;
  v3 = *MEMORY[0x1E0CA5C68];
  v13[6] = *MEMORY[0x1E0CA5CD8];
  v13[7] = v3;
  v4 = *MEMORY[0x1E0CA5BB8];
  v13[8] = *MEMORY[0x1E0CA5C60];
  v13[9] = v4;
  v5 = *MEMORY[0x1E0CA5B90];
  v13[10] = *MEMORY[0x1E0CA5C30];
  v13[11] = v5;
  v6 = *MEMORY[0x1E0CA5B70];
  v13[12] = *MEMORY[0x1E0CA5AD8];
  v13[13] = v6;
  v7 = *MEMORY[0x1E0CA5CE0];
  v13[14] = *MEMORY[0x1E0CA5AF0];
  v13[15] = v7;
  v8 = *MEMORY[0x1E0CA5C28];
  v13[16] = *MEMORY[0x1E0CA5C70];
  v13[17] = v8;
  v9 = *MEMORY[0x1E0CA5B98];
  v13[18] = *MEMORY[0x1E0CA5CB0];
  v13[19] = v9;
  v10 = *MEMORY[0x1E0CA5A98];
  v13[20] = *MEMORY[0x1E0CA5B60];
  v13[21] = v10;
  v11 = *MEMORY[0x1E0CA5CD0];
  v13[22] = *MEMORY[0x1E0CA5C08];
  v13[23] = v11;
  v13[24] = *MEMORY[0x1E0CA5B38];
  _supportedUTIs = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 25);
  return (id)_supportedUTIs;
}

- (void)addProvider:(id)a3 forBaseURL:(id)a4
{
  void *v7;

  if (!self->_providers)
    self->_providers = (NSMutableDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 1);
  v7 = (void *)objc_msgSend(a4, "absoluteString");
  if (objc_msgSend(v7, "hasSuffix:", CFSTR("/")))
    v7 = (void *)objc_msgSend(v7, "substringToIndex:", objc_msgSend(v7, "length") - 1);
  -[NSMutableDictionary setObject:forKey:](self->_providers, "setObject:forKey:", a3, v7);
}

- (void)removeProvider:(id)a3
{
  NSMutableDictionary *providers;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  providers = self->_providers;
  v6 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](providers, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(providers);
        v10 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i);
        if ((id)-[NSMutableDictionary objectForKey:](self->_providers, "objectForKey:", v10) == a3)
        {
          if (v10)
            -[MFAttachmentManager removeProviderForBaseURL:](self, "removeProviderForBaseURL:", objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v10));
          return;
        }
      }
      v7 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](providers, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v7)
        continue;
      break;
    }
  }
}

- (id)imageScalingQueue
{
  return self->_imageScalingQueue;
}

- (BOOL)_setupAttachment:(id)a3 withMimeBody:(id)a4 error:(id *)a5
{
  id v9;
  uint64_t v10;
  uint64_t v11;
  MFError *v12;

  if ((objc_msgSend((id)objc_msgSend(a3, "url"), "mf_isValidAttachmentURL") & 1) != 0)
  {
    v9 = -[MFAttachmentManager _dataProviderForAttachmentURL:error:](self, "_dataProviderForAttachmentURL:error:", objc_msgSend(a3, "url"), a5);
    if (v9)
    {
      if (a4 || (a4 = (id)objc_msgSend((id)objc_msgSend(v9, "messageForAttachment:", a3), "messageBody")) != 0)
      {
        a4 = (id)objc_msgSend(a4, "partWithNumber:", objc_msgSend((id)objc_msgSend(a3, "url"), "mf_lastPartNumber"));
        objc_msgSend(a3, "setPart:", a4);
        if (!objc_msgSend(a3, "fileName"))
          objc_msgSend(a3, "setFileName:", objc_msgSend(a4, "attachmentFilename"));
        if (a4)
        {
          objc_msgSend(a3, "setMimeType:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@/%@"), objc_msgSend(a4, "type"), objc_msgSend(a4, "subtype")));
          objc_msgSend(a3, "setEncodedFileSize:", objc_msgSend(a4, "approximateRawSize"));
          objc_msgSend(a3, "setDisposition:", objc_msgSend(a4, "disposition"));
          v10 = objc_msgSend(a4, "dispositionParameterForKey:", CFSTR("remote-image"));
          if (v10)
            objc_msgSend(a3, "setRemoteImageFileName:", v10);
        }
      }
      if (!-[MFAttachmentManager metadataForAttachment:forKey:](self, "metadataForAttachment:forKey:", a3, CFSTR("MFAttachmentContentIDKey")))
      {
        v11 = objc_msgSend(a4, "contentID");
        if (!v11)
        {
          v11 = objc_msgSend(a4, "bodyParameterForKey:", *MEMORY[0x1E0D45F28]);
          if (!v11)
            v11 = objc_msgSend(MEMORY[0x1E0CB3940], "mf_messageIDStringWithDomainHint:");
        }
        -[MFAttachmentManager setContentID:forAttachment:](self, "setContentID:forAttachment:", v11, a3);
      }
      LOBYTE(v9) = 1;
    }
  }
  else if (a5)
  {
    v12 = +[MFError errorWithDomain:code:localizedDescription:title:userInfo:](MFError, "errorWithDomain:code:localizedDescription:title:userInfo:", CFSTR("MFMessageErrorDomain"), 1030, CFSTR("Invalid attachment URL."), CFSTR("Invalid Attachment URL"), 0);
    LOBYTE(v9) = 0;
    *a5 = v12;
  }
  else
  {
    LOBYTE(v9) = 0;
  }
  return (char)v9;
}

- (id)_filePathForAttachment:(id)a3
{
  id result;
  void *v6;

  result = -[MFAttachmentManager _dataProviderForAttachmentURL:error:](self, "_dataProviderForAttachmentURL:error:", objc_msgSend(a3, "url"), 0);
  if (result)
  {
    v6 = (void *)objc_msgSend(result, "messageForAttachment:", a3);
    result = (id)objc_msgSend(-[MFAttachmentManager _dataProviderForAttachmentURL:error:](self, "_dataProviderForAttachmentURL:error:", objc_msgSend(a3, "url"), 0), "storageLocationForAttachment:withMessage:", a3, v6);
    if (!result)
      return (id)objc_msgSend((id)objc_msgSend(v6, "messageStore"), "storagePath");
  }
  return result;
}

- (id)_dataProviderForAttachmentURL:(id)a3 error:(id *)a4
{
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v7 = (void *)objc_msgSend(a3, "mf_partNumbers");
  if (!objc_msgSend(v7, "count"))
  {
    if (a4)
    {
      v13 = &unk_1E81EA248;
      goto LABEL_12;
    }
LABEL_13:
    v12 = 0;
    return v12;
  }
  v8 = (void *)objc_msgSend(a3, "URLByDeletingLastPathComponent");
  v9 = objc_msgSend(v7, "count");
  if (v9 == -1)
  {
LABEL_8:
    if (a4)
    {
      v13 = &unk_1E81EA270;
LABEL_12:
      v14 = (void *)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MFMessageErrorDomain"), 1030, v13);
      v12 = 0;
      *a4 = v14;
      return v12;
    }
    goto LABEL_13;
  }
  v10 = v9 + 1;
  while (1)
  {
    v11 = (void *)objc_msgSend(v8, "absoluteString");
    if (objc_msgSend(v11, "hasSuffix:", CFSTR("/")))
      v11 = (void *)objc_msgSend(v11, "substringToIndex:", objc_msgSend(v11, "length") - 1);
    v12 = (void *)-[NSMutableDictionary objectForKey:](self->_providers, "objectForKey:", v11);
    if (v12)
      return v12;
    v8 = (void *)objc_msgSend(v8, "URLByDeletingLastPathComponent");
    if (!--v10)
      goto LABEL_8;
  }
}

- (id)attachmentForURL:(id)a3 error:(id *)a4
{
  return -[MFAttachmentManager attachmentForURL:withMimeBody:error:](self, "attachmentForURL:withMimeBody:error:", a3, 0, a4);
}

- (id)attachmentForURL:(id)a3 withMimeBody:(id)a4 error:(id *)a5
{
  MFAttachment *v5;

  v5 = (MFAttachment *)a3;
  if (a3)
  {
    v5 = -[MFAttachment initWithURL:attachmentManager:]([MFAttachment alloc], "initWithURL:attachmentManager:", a3, self);
    if (!-[MFAttachmentManager _setupAttachment:withMimeBody:error:](self, "_setupAttachment:withMimeBody:error:", v5, a4, a5))
    {

      v5 = 0;
    }
  }
  return v5;
}

- (id)attachmentsForURLs:(id)a3 error:(id *)a4
{
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  id v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v7 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(a3, "count"));
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v8 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(a3);
        v12 = -[MFAttachmentManager attachmentForURL:error:](self, "attachmentForURL:error:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i), a4);
        if (!v12)
          return 0;
        objc_msgSend(v7, "addObject:", v12);
      }
      v9 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v9)
        continue;
      break;
    }
  }
  return v7;
}

- (id)attachmentForTextAttachment:(id)a3 error:(id *)a4
{
  return -[MFAttachmentManager attachmentForURL:withMimeBody:error:](self, "attachmentForURL:withMimeBody:error:", objc_msgSend((id)objc_msgSend(a3, "mimePart"), "partURL"), objc_msgSend((id)objc_msgSend(a3, "mimePart"), "mimeBody"), a4);
}

- (id)attachmentForCID:(id)a3
{
  void *v4;

  v4 = (void *)objc_msgSend(MEMORY[0x1E0CB3998], "componentsWithURL:resolvingAgainstBaseURL:", a3, 0);
  objc_msgSend(v4, "setQuery:", 0);
  return -[MFAttachmentManager attachmentForContentID:preferredSchemes:](self, "attachmentForContentID:preferredSchemes:", objc_msgSend(v4, "path"), 0);
}

- (id)attachmentForContentID:(id)a3
{
  return -[MFAttachmentManager attachmentForContentID:preferredSchemes:](self, "attachmentForContentID:preferredSchemes:", a3, 0);
}

- (id)attachmentForContentID:(id)a3 preferredSchemes:(id)a4
{
  id v7;
  NSMutableDictionary *metadata;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  uint64_t v14;
  id v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _QWORD v21[7];
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend(a3, "length"))
    return 0;
  v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[NSLock lock](self->_metaDataLock, "lock");
  metadata = self->_metadata;
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __63__MFAttachmentManager_attachmentForContentID_preferredSchemes___block_invoke;
  v21[3] = &unk_1E81CAD88;
  v21[4] = a3;
  v21[5] = v7;
  v21[6] = a4;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](metadata, "enumerateKeysAndObjectsUsingBlock:", v21);
  -[NSLock unlock](self->_metaDataLock, "unlock");
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v9 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v18;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v18 != v11)
          objc_enumerationMutation(a4);
        v13 = objc_msgSend(v7, "objectForKeyedSubscript:", objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * i), "lowercaseString"));
        if (v13)
        {
          v14 = v13;
          goto LABEL_13;
        }
      }
      v10 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
      if (v10)
        continue;
      break;
    }
  }
  v14 = objc_msgSend((id)objc_msgSend(v7, "allValues"), "firstObject");
  if (v14)
LABEL_13:
    v15 = -[MFAttachmentManager attachmentForURL:error:](self, "attachmentForURL:error:", v14, 0);
  else
    v15 = 0;

  return v15;
}

uint64_t __63__MFAttachmentManager_attachmentForContentID_preferredSchemes___block_invoke(id *a1, void *a2, void *a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(a1[4], "caseInsensitiveCompare:", objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("MFAttachmentContentIDKey")));
  if (!result)
  {
    objc_msgSend(a1[5], "setObject:forKeyedSubscript:", a2, objc_msgSend((id)objc_msgSend(a2, "scheme"), "lowercaseString"));
    result = objc_msgSend(a1[6], "count");
    if (!result
      || (result = objc_msgSend((id)objc_msgSend(a2, "scheme"), "caseInsensitiveCompare:", objc_msgSend(a1[6], "firstObject"))) == 0)
    {
      *a4 = 1;
    }
  }
  return result;
}

- (id)attachmentsForContext:(id)a3
{
  return 0;
}

- (id)_fetchDataForAttachment:(id)a3 withProvider:(id)a4 syncLock:(id *)a5
{
  -[MFAttachmentManager doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4, a5);
  __assert_rtn("-[MFAttachmentManager _fetchDataForAttachment:withProvider:syncLock:]", "MFAttachmentManager.m", 400, "0");
}

- (void)fetchDataForAttachment:(id)a3
{
  id v5;
  OS_dispatch_queue *arrayAccessQueue;
  _QWORD *v7;
  NSObject *v8;
  uint64_t v9;
  _QWORD v10[7];
  _QWORD block[6];
  uint64_t v12;

  v12 = 0;
  v5 = -[MFAttachmentManager _dataProviderForAttachmentURL:error:](self, "_dataProviderForAttachmentURL:error:", objc_msgSend(a3, "url"), &v12);
  if (v5)
  {
    arrayAccessQueue = self->_arrayAccessQueue;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __46__MFAttachmentManager_fetchDataForAttachment___block_invoke_2;
    v10[3] = &unk_1E81CADD8;
    v10[4] = self;
    v10[5] = a3;
    v10[6] = v5;
    v7 = v10;
    v8 = arrayAccessQueue;
  }
  else
  {
    v9 = objc_msgSend(a3, "fetchCompletionBlock");
    if (!v9)
      return;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __46__MFAttachmentManager_fetchDataForAttachment___block_invoke;
    block[3] = &unk_1E81CADB0;
    block[4] = v12;
    block[5] = v9;
    v8 = MEMORY[0x1E0C80D38];
    v7 = block;
  }
  dispatch_async(v8, v7);
}

uint64_t __46__MFAttachmentManager_fetchDataForAttachment___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

uint64_t __46__MFAttachmentManager_fetchDataForAttachment___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchDataForAttachment:withProvider:syncLock:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 0);
}

- (void)fetchDataSynchronouslyForAttachment:(id)a3
{
  void (**v5)(id, uint64_t, _QWORD);
  id v6;
  NSObject *arrayAccessQueue;
  int v8;
  void *v9;
  NSObject *v10;
  _QWORD v11[9];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  void (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  uint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  void (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  uint64_t v23;
  uint64_t v24;

  v5 = (void (**)(id, uint64_t, _QWORD))(id)objc_msgSend(a3, "fetchCompletionBlock");
  objc_msgSend(a3, "setFetchCompletionBlock:", 0);
  v24 = 0;
  v6 = -[MFAttachmentManager _dataProviderForAttachmentURL:error:](self, "_dataProviderForAttachmentURL:error:", objc_msgSend(a3, "url"), &v24);
  if (v6)
  {
    v18 = 0;
    v19 = &v18;
    v20 = 0x3052000000;
    v21 = __Block_byref_object_copy__0;
    v22 = __Block_byref_object_dispose__0;
    v23 = 0;
    v12 = 0;
    v13 = &v12;
    v14 = 0x3052000000;
    v15 = __Block_byref_object_copy__0;
    v16 = __Block_byref_object_dispose__0;
    v17 = 0;
    arrayAccessQueue = self->_arrayAccessQueue;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __59__MFAttachmentManager_fetchDataSynchronouslyForAttachment___block_invoke;
    v11[3] = &unk_1E81CAE00;
    v11[4] = self;
    v11[5] = a3;
    v11[6] = v6;
    v11[7] = &v18;
    v11[8] = &v12;
    dispatch_sync(arrayAccessQueue, v11);
    v8 = objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
    v9 = (void *)v13[5];
    if (v8)
    {
      if ((objc_msgSend(v9, "tryLockWhenCondition:", 1) & 1) == 0)
      {
        if (objc_msgSend((id)objc_msgSend(MEMORY[0x1E0D1EEA8], "currentDevice"), "isInternal"))
        {
          v10 = MFLogGeneral();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
            -[MFAttachmentManager fetchDataSynchronouslyForAttachment:].cold.1(v10);
        }
        v19[5] = 0;
        goto LABEL_12;
      }
    }
    else
    {
      objc_msgSend(v9, "lockWhenCondition:", 1);
    }
    objc_msgSend((id)v13[5], "unlock");
LABEL_12:
    if (v5)
      v5[2](v5, objc_msgSend((id)v19[5], "data"), 0);
    _Block_object_dispose(&v12, 8);
    _Block_object_dispose(&v18, 8);
    goto LABEL_15;
  }
  if (v5)
    v5[2](v5, 0, v24);
LABEL_15:

}

uint64_t __59__MFAttachmentManager_fetchDataSynchronouslyForAttachment___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_fetchDataForAttachment:withProvider:syncLock:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40) = result;
  return result;
}

- (void)_fetchCompletedForAttachment:(id)a3 error:(id)a4
{
  NSObject *arrayAccessQueue;
  _QWORD block[7];

  arrayAccessQueue = self->_arrayAccessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__MFAttachmentManager__fetchCompletedForAttachment_error___block_invoke;
  block[3] = &unk_1E81CADD8;
  block[4] = self;
  block[5] = a3;
  block[6] = a4;
  dispatch_sync(arrayAccessQueue, block);
}

void __58__MFAttachmentManager__fetchCompletedForAttachment_error___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD v15[6];
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _QWORD v20[2];
  uint64_t (*v21)(uint64_t, void *);
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint8_t v25[128];
  uint8_t buf[4];
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "objectForKey:", objc_msgSend(*(id *)(a1 + 40), "url")), "copy");
  if (objc_msgSend(*(id *)(a1 + 40), "url"))
  {
    v3 = MFLogGeneral();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      v4 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      v27 = v4;
      _os_log_impl(&dword_1C8839000, v3, OS_LOG_TYPE_INFO, "removing attachment %@", buf, 0xCu);
    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "removeObjectForKey:", objc_msgSend(*(id *)(a1 + 40), "url"));
  }
  v5 = (void *)objc_msgSend(v2, "objectForKey:", CFSTR("MFAttachmentAttachmentKey"));
  v6 = (void *)objc_msgSend(v2, "objectForKey:", CFSTR("MFAttachmentPrimaryConsumerKey"));
  if (*(_QWORD *)(a1 + 48))
    v7 = 0;
  else
    v7 = objc_msgSend(v6, "data");
  v8 = (void *)objc_msgSend(v5, "ef_partition:", &__block_literal_global_64);
  v9 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v21 = __58__MFAttachmentManager__fetchCompletedForAttachment_error___block_invoke_2;
  v22 = &unk_1E81CAE68;
  v23 = *(_QWORD *)(a1 + 48);
  v24 = v7;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v10 = (void *)objc_msgSend(v8, "first");
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v25, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v17;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v17 != v13)
          objc_enumerationMutation(v10);
        v21((uint64_t)v20, *(void **)(*((_QWORD *)&v16 + 1) + 8 * v14++));
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v25, 16);
    }
    while (v12);
  }
  if (objc_msgSend((id)objc_msgSend(v8, "second"), "count"))
  {
    v15[0] = v9;
    v15[1] = 3221225472;
    v15[2] = __58__MFAttachmentManager__fetchCompletedForAttachment_error___block_invoke_3;
    v15[3] = &unk_1E81CAE90;
    v15[4] = v8;
    v15[5] = v20;
    dispatch_async(MEMORY[0x1E0C80D38], v15);
  }

}

uint64_t __58__MFAttachmentManager__fetchCompletedForAttachment_error___block_invoke_62(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "wantsCompletionBlockOffMainThread");
}

uint64_t __58__MFAttachmentManager__fetchCompletedForAttachment_error___block_invoke_2(uint64_t a1, void *a2)
{
  void *v4;
  uint64_t v5;

  v4 = (void *)objc_msgSend(a2, "downloadProgress");
  if (*(_QWORD *)(a1 + 32))
    objc_msgSend(v4, "cancel");
  else
    objc_msgSend(v4, "setCompletedUnitCount:", objc_msgSend(v4, "totalUnitCount"));
  if (objc_msgSend(a2, "fetchCompletionBlock"))
  {
    v5 = objc_msgSend(a2, "fetchCompletionBlock");
    (*(void (**)(uint64_t, _QWORD, _QWORD))(v5 + 16))(v5, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
    objc_msgSend(a2, "setFetchCompletionBlock:", 0);
  }
  return objc_msgSend(a2, "resetProgress");
}

uint64_t __58__MFAttachmentManager__fetchCompletedForAttachment_error___block_invoke_3(uint64_t a1)
{
  void *v2;
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
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
  v2 = (void *)objc_msgSend(*(id *)(a1 + 32), "second", 0);
  result = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (result)
  {
    v4 = result;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
        ++v6;
      }
      while (v4 != v6);
      result = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
      v4 = result;
    }
    while (result);
  }
  return result;
}

- (void)cancelFetchForAttachment:(id)a3
{
  NSObject *arrayAccessQueue;
  _QWORD v4[6];

  arrayAccessQueue = self->_arrayAccessQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __48__MFAttachmentManager_cancelFetchForAttachment___block_invoke;
  v4[3] = &unk_1E81C9BC0;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(arrayAccessQueue, v4);
}

uint64_t __48__MFAttachmentManager_cancelFetchForAttachment___block_invoke(uint64_t a1)
{
  uint64_t result;
  void *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  _QWORD block[5];
  uint8_t buf[4];
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "objectForKey:", objc_msgSend(*(id *)(a1 + 40), "url"));
  if (result)
  {
    v3 = (void *)result;
    if (objc_msgSend(*(id *)(a1 + 40), "fetchCompletionBlock"))
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __48__MFAttachmentManager_cancelFetchForAttachment___block_invoke_2;
      block[3] = &unk_1E81C9B98;
      block[4] = *(_QWORD *)(a1 + 40);
      dispatch_sync(MEMORY[0x1E0C80D38], block);
    }
    objc_msgSend(*(id *)(a1 + 40), "resetProgress");
    v4 = (void *)objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("MFAttachmentAttachmentKey"));
    objc_msgSend(v4, "removeObjectIdenticalTo:", *(_QWORD *)(a1 + 40));
    result = objc_msgSend(v4, "count");
    if (!result)
    {
      objc_msgSend((id)objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("MFAttachmentMonitorKey")), "cancel");
      v5 = MFLogGeneral();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        v6 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)buf = 138412290;
        v9 = v6;
        _os_log_impl(&dword_1C8839000, v5, OS_LOG_TYPE_INFO, "removing attachment %@", buf, 0xCu);
      }
      return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "removeObjectForKey:", objc_msgSend(*(id *)(a1 + 40), "url"));
    }
  }
  return result;
}

uint64_t __48__MFAttachmentManager_cancelFetchForAttachment___block_invoke_2(uint64_t a1)
{
  uint64_t v2;

  v2 = objc_msgSend(*(id *)(a1 + 32), "fetchCompletionBlock");
  (*(void (**)(uint64_t, _QWORD, MFError *))(v2 + 16))(v2, 0, +[MFError errorWithDomain:code:localizedDescription:title:userInfo:](MFError, "errorWithDomain:code:localizedDescription:title:userInfo:", CFSTR("MFMessageErrorDomain"), 1028, CFSTR("Download Canceled."), CFSTR("Download Canceled"), 0));
  return objc_msgSend(*(id *)(a1 + 32), "setFetchCompletionBlock:", 0);
}

- (id)attachmentForData:(id)a3 mimeType:(id)a4 fileName:(id)a5 contentID:(id)a6 context:(id)a7
{
  return 0;
}

- (BOOL)updateAttachment:(id)a3 withNewData:(id)a4
{
  return 0;
}

- (void)setContentID:(id)a3 forAttachment:(id)a4
{
  id v5;

  v5 = a3;
  if (objc_msgSend(a3, "hasPrefix:", CFSTR("<")))
    v5 = (id)objc_msgSend(v5, "substringFromIndex:", 1);
  if (objc_msgSend(v5, "hasSuffix:", CFSTR(">")))
    v5 = (id)objc_msgSend(v5, "substringToIndex:", objc_msgSend(v5, "length") - 1);
  -[MFAttachmentManager setMetadataForAttachment:toValue:forKey:](self, "setMetadataForAttachment:toValue:forKey:", a4, v5, CFSTR("MFAttachmentContentIDKey"));
}

- (id)_contentIDForAttachment:(id)a3
{
  return -[MFAttachmentManager metadataForAttachment:forKey:](self, "metadataForAttachment:forKey:", a3, CFSTR("MFAttachmentContentIDKey"));
}

- (void)setMetadataForAttachment:(id)a3 toValue:(id)a4 forKey:(id)a5
{
  NSMutableDictionary *metadata;
  id v10;

  if (objc_msgSend(a3, "url"))
  {
    -[NSLock lock](self->_metaDataLock, "lock");
    metadata = self->_metadata;
    if (!metadata)
    {
      metadata = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      self->_metadata = metadata;
    }
    v10 = (id)-[NSMutableDictionary objectForKeyedSubscript:](metadata, "objectForKeyedSubscript:", objc_msgSend(a3, "url"));
    if (!v10)
    {
      v10 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_metadata, "setObject:forKeyedSubscript:", v10, objc_msgSend(a3, "url"));
    }
    objc_msgSend(v10, "setObject:forKeyedSubscript:", a4, a5);
    -[NSLock unlock](self->_metaDataLock, "unlock");
  }
}

- (id)metadataForAttachment:(id)a3 forKey:(id)a4
{
  id v7;

  -[NSLock lock](self->_metaDataLock, "lock");
  v7 = (id)objc_msgSend((id)-[NSMutableDictionary objectForKey:](self->_metadata, "objectForKey:", objc_msgSend(a3, "url")), "objectForKey:", a4);
  -[NSLock unlock](self->_metaDataLock, "unlock");
  return v7;
}

- (void)clearMetadataForAttachment:(id)a3
{
  if (objc_msgSend(a3, "url"))
  {
    -[NSLock lock](self->_metaDataLock, "lock");
    -[NSMutableDictionary removeObjectForKey:](self->_metadata, "removeObjectForKey:", objc_msgSend(a3, "url"));
    -[NSLock unlock](self->_metaDataLock, "unlock");
  }
}

- (void)fetchDataSynchronouslyForAttachment:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1C8839000, log, OS_LOG_TYPE_ERROR, "#Attachments FIXME: Blocking call requested on the main thread", v1, 2u);
}

@end
