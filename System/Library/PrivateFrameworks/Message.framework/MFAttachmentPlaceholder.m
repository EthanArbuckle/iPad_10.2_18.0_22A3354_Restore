@implementation MFAttachmentPlaceholder

+ (id)placeholder
{
  return objc_alloc_init((Class)a1);
}

- (MFAttachmentPlaceholder)init
{
  MFAttachmentPlaceholder *v2;
  uint64_t v3;
  NSMutableDictionary *jsonDictionary;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MFAttachmentPlaceholder;
  v2 = -[MFAttachmentPlaceholder init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 3);
    jsonDictionary = v2->_jsonDictionary;
    v2->_jsonDictionary = (NSMutableDictionary *)v3;

  }
  return v2;
}

+ (id)attachmentPlaceholderForFileURL:(id)a3 fileName:(id)a4 fileSize:(int64_t)a5 type:(id)a6 contentID:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v11 = a3;
  v12 = a4;
  v13 = a6;
  v14 = a7;
  +[MFAttachmentUtilities makeAttachmentPlaceholder:fileSize:mimeType:contentID:](MFAttachmentUtilities, "makeAttachmentPlaceholder:fileSize:mimeType:contentID:", v12, a5, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "fileURL");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[MFAttachmentUtilities securityScopeForFileURL:](MFAttachmentUtilities, "securityScopeForFileURL:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "startWriteAccess");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  +[MFAttachmentPlaceholder cloneFileAtURL:toPlaceholderURL:](MFAttachmentPlaceholder, "cloneFileAtURL:toPlaceholderURL:", v11, v18);

  objc_msgSend(v17, "stopAccess");
  return v15;
}

+ (id)attachmentPlaceholderForData:(id)a3 fileName:(id)a4 type:(id)a5 contentID:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  +[MFAttachmentUtilities makeAttachmentPlaceholder:fileSize:mimeType:contentID:](MFAttachmentUtilities, "makeAttachmentPlaceholder:fileSize:mimeType:contentID:", v10, objc_msgSend(v9, "length"), v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "fileURL");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[MFAttachmentUtilities securityScopeForFileURL:](MFAttachmentUtilities, "securityScopeForFileURL:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "startWriteAccess");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[MFAttachmentPlaceholder writeData:forURL:](MFAttachmentPlaceholder, "writeData:forURL:", v9, v16);

  objc_msgSend(v15, "stopAccess");
  return v13;
}

- (id)description
{
  void *v3;
  void *v4;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  _BOOL4 v9;
  const char *v10;
  void *v11;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[MFAttachmentPlaceholder fileName](self, "fileName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[MFAttachmentPlaceholder fileSize](self, "fileSize");
  -[MFAttachmentPlaceholder mimeType](self, "mimeType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFAttachmentPlaceholder fileURLString](self, "fileURLString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFAttachmentPlaceholder contentID](self, "contentID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[MFAttachmentPlaceholder useMailDrop](self, "useMailDrop");
  v10 = "SMTP";
  if (v9)
    v10 = "MailDrop";
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %lu [%@] @ %@ : %@ [%s]"), v4, v5, v6, v7, v8, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)_setJSONDictionary:(id)a3
{
  objc_storeStrong((id *)&self->_jsonDictionary, a3);
}

- (id)fileName
{
  return (id)-[NSMutableDictionary objectForKeyedSubscript:](self->_jsonDictionary, "objectForKeyedSubscript:", CFSTR("fileName"));
}

- (void)setFileName:(id)a3
{
  -[NSMutableDictionary setValue:forKey:](self->_jsonDictionary, "setValue:forKey:", a3, CFSTR("fileName"));
}

- (unint64_t)fileSize
{
  void *v2;
  unint64_t v3;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_jsonDictionary, "objectForKeyedSubscript:", CFSTR("fileSize"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "unsignedIntegerValue");

  return v3;
}

- (void)setFileSize:(unint64_t)a3
{
  NSMutableDictionary *jsonDictionary;
  id v4;

  jsonDictionary = self->_jsonDictionary;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setValue:forKey:](jsonDictionary, "setValue:forKey:");

}

- (id)mimeType
{
  return (id)-[NSMutableDictionary objectForKeyedSubscript:](self->_jsonDictionary, "objectForKeyedSubscript:", CFSTR("mimeType"));
}

- (void)setMimeType:(id)a3
{
  -[NSMutableDictionary setValue:forKey:](self->_jsonDictionary, "setValue:forKey:", a3, CFSTR("mimeType"));
}

- (id)fileURLString
{
  return (id)-[NSMutableDictionary objectForKeyedSubscript:](self->_jsonDictionary, "objectForKeyedSubscript:", CFSTR("fileURL"));
}

- (void)setFileURLString:(id)a3
{
  -[NSMutableDictionary setValue:forKey:](self->_jsonDictionary, "setValue:forKey:", a3, CFSTR("fileURL"));
}

- (id)fileURL
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C99E98];
  -[MFAttachmentPlaceholder fileURLString](self, "fileURLString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLWithString:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)contentID
{
  return (id)-[NSMutableDictionary objectForKeyedSubscript:](self->_jsonDictionary, "objectForKeyedSubscript:", CFSTR("contentID"));
}

- (void)setContentID:(id)a3
{
  -[NSMutableDictionary setValue:forKey:](self->_jsonDictionary, "setValue:forKey:", a3, CFSTR("contentID"));
}

- (BOOL)useMailDrop
{
  void *v2;
  char v3;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_jsonDictionary, "objectForKeyedSubscript:", CFSTR("mailDrop"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (void)setUseMailDrop:(BOOL)a3
{
  NSMutableDictionary *jsonDictionary;
  id v4;

  jsonDictionary = self->_jsonDictionary;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setValue:forKey:](jsonDictionary, "setValue:forKey:");

}

+ (id)_localStoreURLForFileData:(id)a3 contentID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a3;
  v7 = a4;
  objc_msgSend((id)objc_opt_class(), "placeholderDirectory");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringByAppendingPathComponent:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "length"))
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "length"))
      objc_msgSend(a1, "writeData:forURL:", v6, v10);
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (id)placeholderFromSerializedRepresentation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v11;

  v4 = a3;
  if (objc_msgSend(a1, "isPlaceholderSerializedRepresentation:", v4))
  {
    objc_msgSend(v4, "subdataWithRange:", 4, objc_msgSend(v4, "length") - 4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v11 = 0;
      objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v5, 0, &v11);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v11;
      v8 = 0;
      if (!v7 && v6)
      {
        +[MFAttachmentPlaceholder placeholder](MFAttachmentPlaceholder, "placeholder");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = (void *)objc_msgSend(v6, "mutableCopy");
        objc_msgSend(v8, "_setJSONDictionary:", v9);

      }
    }
    else
    {
      MFLogGeneral();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        +[MFAttachmentPlaceholder placeholderFromSerializedRepresentation:].cold.1();
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)_placeholderMagic
{
  if (_placeholderMagic_onceToken != -1)
    dispatch_once(&_placeholderMagic_onceToken, &__block_literal_global_25);
  return (id)_placeholderMagic_placeholderMagic;
}

void __44__MFAttachmentPlaceholder__placeholderMagic__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", &MFAttachmentPlaceholderMagic, 4);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_placeholderMagic_placeholderMagic;
  _placeholderMagic_placeholderMagic = v0;

}

+ (BOOL)isPlaceholderSerializedRepresentation:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  BOOL v7;

  v4 = a3;
  if ((unint64_t)objc_msgSend(v4, "length") < 0x35 || (unint64_t)objc_msgSend(v4, "length") > 0x833)
  {
    v7 = 0;
  }
  else
  {
    objc_msgSend(a1, "_placeholderMagic");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "rangeOfData:options:range:", v5, 2, 0, 4);

    v7 = v6 != 0x7FFFFFFFFFFFFFFFLL;
  }

  return v7;
}

- (id)serializedRepresentation
{
  NSMutableDictionary *jsonDictionary;
  void *v3;
  id v4;
  void *v5;
  NSObject *v7;
  id v8;

  jsonDictionary = self->_jsonDictionary;
  if (!jsonDictionary)
    return 0;
  v8 = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", jsonDictionary, 0, &v8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v8;
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithBytes:length:", &MFAttachmentPlaceholderMagic, 4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendData:", v3);
  }
  else
  {
    MFLogGeneral();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[MFAttachmentPlaceholder serializedRepresentation].cold.1();

    v5 = 0;
  }

  return v5;
}

+ (BOOL)hasPlaceholderRepresentation:(id)a3
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  BOOL v8;

  objc_msgSend(a3, "messageBody");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "rawData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "length"))
  {
    v5 = objc_msgSend(v4, "length");
    objc_msgSend(CFSTR("=FA=CA=DE{"), "dataUsingEncoding:", 4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v4, "rangeOfData:options:range:", v6, 0, 0, v5);

    v8 = v7 != 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)placeholderRepresentations:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v22 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v24 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "messageBody");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rawData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = v5;
  if (objc_msgSend(v5, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", objc_msgSend(objc_retainAutorelease(v5), "bytes"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "componentsSeparatedByString:", CFSTR("=FA=CA=DE{"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v21, "count"))
    {
      v27 = 0u;
      v28 = 0u;
      v25 = 0u;
      v26 = 0u;
      v6 = v21;
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      if (v7)
      {
        v8 = *(_QWORD *)v26;
        do
        {
          for (i = 0; i != v7; ++i)
          {
            if (*(_QWORD *)v26 != v8)
              objc_enumerationMutation(v6);
            v10 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
            v11 = objc_msgSend(v10, "rangeOfString:", CFSTR("}"));
            if (v11 != 0x7FFFFFFFFFFFFFFFLL)
            {
              objc_msgSend(v10, "substringToIndex:", v11 + 1);
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v12, "stringByReplacingOccurrencesOfString:withString:", CFSTR("=\n"), &stru_1E4F1C8F8);
              v13 = (void *)objc_claimAutoreleasedReturnValue();

              v14 = (void *)MEMORY[0x1E0C99DF0];
              objc_msgSend(a1, "_placeholderMagic");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v14, "dataWithData:", v15);
              v16 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v13, "dataUsingEncoding:", 4);
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v16, "appendData:", v17);

              objc_msgSend(a1, "placeholderFromSerializedRepresentation:", v16);
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              if (v18)
                objc_msgSend(v24, "addObject:", v18);

            }
          }
          v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
        }
        while (v7);
      }

    }
  }

  return v24;
}

+ (id)dataForPlaceholder:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  NSObject *v8;
  void (**v9)(void *, _QWORD);
  void *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  _QWORD aBlock[4];
  NSObject *v22;

  v3 = a3;
  objc_msgSend(v3, "fileURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "path");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "fileExistsAtPath:", v6);

  if (v7)
  {
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __46__MFAttachmentPlaceholder_dataForPlaceholder___block_invoke;
    aBlock[3] = &unk_1E4E8BBC8;
    v8 = v4;
    v22 = v8;
    v9 = (void (**)(void *, _QWORD))_Block_copy(aBlock);
    if ((MFIsMobileMail() & 1) != 0)
    {
      v9[2](v9, 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D1EF60], "promise");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (void *)MEMORY[0x1E0D46AD0];
      objc_msgSend(v14, "completionHandlerAdapter");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "securityScopeForPlaceholderURL:completionBlock:", v8, v16);

      objc_msgSend(v14, "future");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "then:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(v10, "result:", 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "data");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v13)
    {
      MFLogGeneral();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        +[MFAttachmentPlaceholder dataForPlaceholder:].cold.1();

    }
    v11 = v22;
  }
  else
  {
    MFLogGeneral();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      +[MFAttachmentPlaceholder dataForPlaceholder:].cold.2((uint64_t)v4, v11, v12);
    v10 = 0;
    v13 = 0;
  }

  return v13;
}

id __46__MFAttachmentPlaceholder_dataForPlaceholder___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;

  +[MFAttachmentSecurityScope securityScopedURL:withToken:](MFAttachmentSecurityScope, "securityScopedURL:withToken:", *(_QWORD *)(a1 + 32), a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D1EEC0], "futureWithResult:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (BOOL)writeData:(id)a3 forURL:(id)a4
{
  char v4;
  id v5;
  NSObject *v6;
  void *v7;
  id v9;
  _BYTE v10[24];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v9 = 0;
  v4 = objc_msgSend(a3, "writeToURL:options:error:", a4, 0x40000000, &v9);
  v5 = v9;
  if ((v4 & 1) == 0)
  {
    MFLogGeneral();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v5, "ef_publicDescription");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      +[MFAttachmentPlaceholder writeData:forURL:].cold.1(v7, (uint64_t)v10, v6);
    }

  }
  return v4;
}

+ (void)cloneFileAtURL:(id)a3 toPlaceholderURL:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  void *v10;
  uint64_t v11;
  void *v12;
  char v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  id v18;
  _BYTE v19[24];
  _QWORD v20[3];
  _QWORD v21[4];

  v21[3] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "copyItemAtURL:toURL:error:", v6, v7, 0);

  if ((v9 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *MEMORY[0x1E0C998D8];
    v20[0] = *MEMORY[0x1E0C998E8];
    v20[1] = v11;
    v21[0] = v10;
    v21[1] = v10;
    v20[2] = *MEMORY[0x1E0C99938];
    v21[2] = *MEMORY[0x1E0C99928];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0;
    v13 = objc_msgSend(v7, "setResourceValues:error:", v12, &v18);
    v14 = v18;
    if ((v13 & 1) == 0)
    {
      MFLogGeneral();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v14, "ef_publicDescription");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        +[MFAttachmentPlaceholder cloneFileAtURL:toPlaceholderURL:].cold.1(v16, (uint64_t)v19, v15);
      }

    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D46080], "dataWithContentsOfURL:", v6);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "writeData:forURL:", v17, v7);

  }
}

+ (BOOL)setFileProtectionForFileAt:(id)a3 error:(id *)a4
{
  return objc_msgSend(a3, "setResourceValue:forKey:error:", *MEMORY[0x1E0C99928], *MEMORY[0x1E0C99938], a4);
}

+ (void)removePlaceholderForFileURL:(id)a3
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  id v7;

  v3 = a3;
  if (MFIsMobileMail())
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 0;
    objc_msgSend(v4, "removeItemAtURL:error:", v3, &v7);
    v5 = v7;

    if (v5)
    {
      MFLogGeneral();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        +[MFAttachmentPlaceholder removePlaceholderForFileURL:].cold.1();

    }
  }

}

+ (void)removePlaceholder:(id)a3
{
  id v4;

  objc_msgSend(a3, "fileURL");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "removePlaceholderForFileURL:");

}

+ (id)placeholderDirectory
{
  void *v2;
  void *v3;
  void *v4;
  char v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  id v11;

  +[MailAccount defaultAccountDirectory](MailAccount, "defaultAccountDirectory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("AttachmentPlaceholders"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "fileExistsAtPath:", v3) & 1) == 0)
  {
    v11 = 0;
    v5 = objc_msgSend(v4, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v3, 1, 0, &v11);
    v6 = v11;
    if ((v5 & 1) == 0)
    {
      MFLogGeneral();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        +[MFAttachmentPlaceholder placeholderDirectory].cold.1((uint64_t)v3, v7, v8);

      v3 = 0;
    }

  }
  objc_msgSend(v3, "mf_canonicalizedAbsolutePath");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)serializedPlaceholderForFileName:(id)a3 fileSize:(int64_t)a4 mimeType:(id)a5 contentID:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  if (!objc_msgSend(v12, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "UUIDString");
    v14 = objc_claimAutoreleasedReturnValue();

    v12 = (id)v14;
  }
  objc_msgSend(MEMORY[0x1E0C99D50], "data");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_localStoreURLForFileData:contentID:", v15, v12);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    +[MFAttachmentPlaceholder placeholder](MFAttachmentPlaceholder, "placeholder");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setFileName:", v10);
    objc_msgSend(v17, "setFileSize:", a4);
    objc_msgSend(v17, "setMimeType:", v11);
    objc_msgSend(v16, "absoluteString");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setFileURLString:", v18);

    objc_msgSend(v17, "setContentID:", v12);
    objc_msgSend(v17, "serializedRepresentation");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_jsonDictionary, 0);
}

+ (void)attachmentPlaceholderForFileURL:fileName:fileSize:type:contentID:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_4(&dword_1A4F90000, v0, v1, "#Attachments Exception thrown when writing file: %@ : %@");
  OUTLINED_FUNCTION_5();
}

+ (void)attachmentPlaceholderForData:fileName:type:contentID:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_4(&dword_1A4F90000, v0, v1, "#Attachments Exception thrown when writing data: %@ : %@");
  OUTLINED_FUNCTION_5();
}

+ (void)placeholderFromSerializedRepresentation:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_3(&dword_1A4F90000, v0, v1, "#Attachments Failed to deserialize placeholder", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

- (void)serializedRepresentation
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_3(&dword_1A4F90000, v0, v1, "#Attachments Failed to serialize placeholder", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

+ (void)dataForPlaceholder:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_3(&dword_1A4F90000, v0, v1, "#Attachments Failed obtain data for temporary file", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

+ (void)dataForPlaceholder:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_0_1(&dword_1A4F90000, a2, a3, "#Attachments Attempted to resolve placeholder for non-existant file: %@", (uint8_t *)&v3);
  OUTLINED_FUNCTION_5();
}

+ (void)writeData:(NSObject *)a3 forURL:.cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138543362;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_0_1(&dword_1A4F90000, a3, (uint64_t)a3, "#Attachments Placeholder attachment data write error %{public}@", (uint8_t *)a2);

}

+ (void)cloneFileAtURL:(NSObject *)a3 toPlaceholderURL:.cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138543362;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_0_1(&dword_1A4F90000, a3, (uint64_t)a3, "#Attachments Unable to set resource values on placeholder attachment data: %{public}@", (uint8_t *)a2);

}

+ (void)removePlaceholderForFileURL:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_3(&dword_1A4F90000, v0, v1, "#Attachments Failed to remove temporary file", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

+ (void)placeholderDirectory
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_0_1(&dword_1A4F90000, a2, a3, "#Attachments Failed to create placeholder directory %@", (uint8_t *)&v3);
  OUTLINED_FUNCTION_5();
}

@end
