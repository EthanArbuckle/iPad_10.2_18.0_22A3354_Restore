@implementation MFAttachmentLibraryManager

- (MFAttachmentLibraryManager)initWithPrimaryLibrary:(id)a3
{
  id v4;
  MFAttachmentLibraryManager *v5;
  void *v6;
  void *v7;
  MFMailDropAttachmentDataProvider *v8;
  void *v9;
  MFMailDropAttachmentPreviewDataProvider *v10;
  void *v11;

  v4 = a3;
  v5 = -[MFAttachmentComposeManager init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "dataProvider");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("x-attach"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[MFMailDropAttachmentDataProvider initWithLibrary:]([MFMailDropAttachmentDataProvider alloc], "initWithLibrary:", v4);
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("x-attach-maildrop"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[MFAttachmentLibraryDataProvider initWithLibrary:]([MFMailDropAttachmentPreviewDataProvider alloc], "initWithLibrary:", v4);
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("x-attach-maildrop-image"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFAttachmentManager addProvider:forBaseURL:](v5, "addProvider:forBaseURL:", v6, v7);
    -[MFAttachmentManager addProvider:forBaseURL:](v5, "addProvider:forBaseURL:", v8, v9);
    -[MFAttachmentManager addProvider:forBaseURL:](v5, "addProvider:forBaseURL:", v10, v11);

  }
  return v5;
}

- (id)_dataProviderForAttachmentURL:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  id v8;
  NSMutableDictionary *providers;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __CFString *v18;
  __CFString *v19;
  __CFString *v20;
  void *v22;
  id v23;
  objc_super v24;
  id v25;

  v6 = a3;
  v24.receiver = self;
  v24.super_class = (Class)MFAttachmentLibraryManager;
  v25 = 0;
  -[MFAttachmentManager _dataProviderForAttachmentURL:error:](&v24, sel__dataProviderForAttachmentURL_error_, v6, &v25);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v8 = v25;
  if (!v7)
  {
    providers = self->super.super._providers;
    objc_msgSend(v6, "scheme");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](providers, "objectForKeyedSubscript:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      v7 = v11;
    }
    else
    {
      -[NSMutableDictionary objectForKeyedSubscript:](self->super.super._providers, "objectForKeyedSubscript:", CFSTR("x-attach"));
      v12 = objc_claimAutoreleasedReturnValue();
      v7 = (id)v12;
      if (a4 && !v12)
      {
        if (v8)
        {
          objc_msgSend(v8, "userInfo", 0);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = (void *)objc_msgSend(v13, "mutableCopy");

          v22 = v14;
          objc_msgSend(v14, "objectForKey:", CFSTR("MFLocalizedDescriptionKey"));
          v15 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "objectForKey:", CFSTR("MFErrorTitleKey"));
          v16 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "domain");
          v17 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "removeObjectForKey:", CFSTR("MFLocalizedDescriptionKey"));
          v18 = (__CFString *)v15;
          v19 = (__CFString *)v16;
          v20 = (__CFString *)v17;
          objc_msgSend(v22, "removeObjectForKey:", CFSTR("MFErrorTitleKey"));
        }
        else
        {
          v20 = CFSTR("MFMessageErrorDomain");
          v22 = 0;
          v19 = CFSTR("No Provider Found");
          v18 = CFSTR("Could not find a provider for the given URL.");
        }
        +[MFError errorWithDomain:code:localizedDescription:title:userInfo:](MFError, "errorWithDomain:code:localizedDescription:title:userInfo:", v20, 1030, v18, v19, v22, v22);
        *a4 = (id)objc_claimAutoreleasedReturnValue();

        v7 = 0;
      }
    }

  }
  return v7;
}

- (void)removeProviderForBaseURL:(id)a3
{
  id v4;
  void *v5;
  char v6;
  objc_super v7;

  v4 = a3;
  objc_msgSend(v4, "absoluteString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("x-attach://"));

  if ((v6 & 1) == 0)
  {
    v7.receiver = self;
    v7.super_class = (Class)MFAttachmentLibraryManager;
    -[MFAttachmentManager removeProviderForBaseURL:](&v7, sel_removeProviderForBaseURL_, v4);
  }

}

- (id)attachmentsForMessage:(id)a3 withSchemes:(id)a4
{
  -[MFAttachmentLibraryManager attachmentsForMessage:withSchemes:updatingFlags:](self, "attachmentsForMessage:withSchemes:updatingFlags:", a3, a4, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)attachmentsForMessage:(id)a3 withSchemes:(id)a4 updatingFlags:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  char v18;
  void *v19;
  void *v21;
  id v22;
  id obj;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v5 = a5;
  v29 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v22 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "messageBodyIfAvailableUpdatingFlags:", v5);
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "attachments");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v25;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v25 != v11)
          objc_enumerationMutation(obj);
        objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * v12), "mimePart");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "partURL");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if ((objc_msgSend(v8, "messageFlags") & 8) != 0)
        {
          v16 = 0;
        }
        else
        {
          -[MFAttachmentLibraryManager _dataProviderForAttachmentURL:error:](self, "_dataProviderForAttachmentURL:error:", v14, 0);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v16 = 0;
          else
            v16 = v21;

        }
        if (!v9
          || (objc_msgSend(v14, "scheme"),
              v17 = (void *)objc_claimAutoreleasedReturnValue(),
              v18 = objc_msgSend(v9, "containsObject:", v17),
              v17,
              (v18 & 1) != 0))
        {
          -[MFAttachmentManager attachmentForURL:withMimeBody:error:](self, "attachmentForURL:withMimeBody:error:", v14, v16, 0);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          if (v19)
            objc_msgSend(v22, "addObject:", v19);

        }
        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v10);
  }

  return v22;
}

@end
