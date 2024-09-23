@implementation MFAttachmentLibraryManager

- (void)dealloc
{
  objc_super v3;

  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "removeObserver:", self);
  v3.receiver = self;
  v3.super_class = (Class)MFAttachmentLibraryManager;
  -[MFAttachmentComposeManager dealloc](&v3, sel_dealloc);
}

- (MFAttachmentLibraryManager)initWithPrimaryLibrary:(id)a3
{
  MFAttachmentLibraryManager *v4;
  uint64_t v5;

  v4 = -[MFAttachmentManager init](self, "init");
  if (v4)
  {
    v5 = objc_msgSend(a3, "dataProvider");
    -[MFAttachmentManager addProvider:forBaseURL:](v4, "addProvider:forBaseURL:", v5, objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("x-attach")));
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "addObserver:selector:name:object:", v4, sel__messageAttachmentStorageLocationsDidChangeNotification_, CFSTR("MailMessageStoreMessagesAttachmentStorageLocationChanged"), 0);
  }
  return v4;
}

- (void)_messageAttachmentStorageLocationsDidChangeNotification:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  int v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t j;
  void *v13;
  id obj;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  obj = (id)objc_msgSend((id)objc_msgSend(a3, "userInfo"), "objectForKey:", CFSTR("messages"));
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v4)
  {
    v5 = v4;
    v15 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v21 != v15)
          objc_enumerationMutation(obj);
        v7 = objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * i), "libraryID");
        v16 = 0u;
        v17 = 0u;
        v18 = 0u;
        v19 = 0u;
        v8 = (void *)-[NSMutableDictionary allKeys](self->super.super._metadata, "allKeys");
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
        if (v9)
        {
          v10 = v9;
          v11 = *(_QWORD *)v17;
          do
          {
            for (j = 0; j != v10; ++j)
            {
              if (*(_QWORD *)v17 != v11)
                objc_enumerationMutation(v8);
              v13 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * j);
              if (objc_msgSend(v13, "mf_rowID") == v7)
                -[NSMutableDictionary removeObjectForKey:](self->super.super._metadata, "removeObjectForKey:", v13);
            }
            v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
          }
          while (v10);
        }
      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    }
    while (v5);
  }
}

- (id)_dataProviderForAttachmentURL:(id)a3 error:(id *)a4
{
  id result;
  void *v8;
  void *v9;
  const __CFString *v10;
  const __CFString *v11;
  const __CFString *v12;
  objc_super v13;
  id v14;

  v13.receiver = self;
  v13.super_class = (Class)MFAttachmentLibraryManager;
  v14 = 0;
  result = -[MFAttachmentManager _dataProviderForAttachmentURL:error:](&v13, sel__dataProviderForAttachmentURL_error_, a3, &v14);
  if (!result)
  {
    v8 = (void *)-[NSMutableDictionary objectForKeyedSubscript:](self->super.super._providers, "objectForKeyedSubscript:", objc_msgSend(a3, "scheme"));
    if (!v8)
      v8 = (void *)-[NSMutableDictionary objectForKeyedSubscript:](self->super.super._providers, "objectForKeyedSubscript:", CFSTR("x-attach"));
    result = v8;
    if (a4 && !result)
    {
      if (v14)
      {
        v9 = (void *)objc_msgSend((id)objc_msgSend(v14, "userInfo"), "mutableCopy");
        v10 = (const __CFString *)objc_msgSend(v9, "objectForKey:", CFSTR("MFLocalizedDescriptionKey"));
        v11 = (const __CFString *)objc_msgSend(v9, "objectForKey:", CFSTR("MFErrorTitleKey"));
        v12 = (const __CFString *)objc_msgSend(v14, "domain");
        objc_msgSend(v9, "removeObjectForKey:", CFSTR("MFLocalizedDescriptionKey"));
        objc_msgSend(v9, "removeObjectForKey:", CFSTR("MFErrorTitleKey"));
      }
      else
      {
        v9 = 0;
        v12 = CFSTR("MFMessageErrorDomain");
        v11 = CFSTR("No Provider Found");
        v10 = CFSTR("Could not find a provider for the given URL.");
      }
      *a4 = +[MFError errorWithDomain:code:localizedDescription:title:userInfo:](MFError, "errorWithDomain:code:localizedDescription:title:userInfo:", v12, 1030, v10, v11, v9);

      return 0;
    }
  }
  return result;
}

- (void)removeProviderForBaseURL:(id)a3
{
  objc_super v5;

  if ((objc_msgSend((id)objc_msgSend(a3, "absoluteString"), "isEqualToString:", CFSTR("x-attach://")) & 1) == 0)
  {
    v5.receiver = self;
    v5.super_class = (Class)MFAttachmentLibraryManager;
    -[MFAttachmentManager removeProviderForBaseURL:](&v5, sel_removeProviderForBaseURL_, a3);
  }
}

- (id)attachmentsForMessage:(id)a3 withSchemes:(id)a4
{
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v17 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_msgSend(a3, "messageBodyIfAvailable");
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v8 = (void *)objc_msgSend(v7, "attachments");
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v19;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v19 != v11)
          objc_enumerationMutation(v8);
        v13 = (void *)objc_msgSend((id)objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v12), "mimePart"), "partURL");
        if ((objc_msgSend(a3, "messageFlags") & 8) != 0)
        {
          v14 = 0;
          if (a4)
            goto LABEL_13;
        }
        else
        {
          -[MFAttachmentLibraryManager _dataProviderForAttachmentURL:error:](self, "_dataProviderForAttachmentURL:error:", v13, 0);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v14 = 0;
          else
            v14 = v7;
          if (a4)
          {
LABEL_13:
            if (!objc_msgSend(a4, "containsObject:", objc_msgSend(v13, "scheme")))
              goto LABEL_16;
          }
        }
        v15 = -[MFAttachmentManager attachmentForURL:withMimeBody:error:](self, "attachmentForURL:withMimeBody:error:", v13, v14, 0);
        if (v15)
          objc_msgSend(v17, "addObject:", v15);
LABEL_16:
        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v10);
  }
  return v17;
}

@end
