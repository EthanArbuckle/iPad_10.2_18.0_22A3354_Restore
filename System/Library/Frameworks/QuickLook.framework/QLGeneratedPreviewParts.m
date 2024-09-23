@implementation QLGeneratedPreviewParts

- (QLGeneratedPreviewParts)initWithData:(id)a3 encoding:(unint64_t)a4 mimeType:(id)a5 attachments:(id)a6
{
  id v11;
  id v12;
  id v13;
  QLGeneratedPreviewParts *v14;
  QLGeneratedPreviewParts *v15;
  objc_super v17;

  v11 = a3;
  v12 = a5;
  v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)QLGeneratedPreviewParts;
  v14 = -[QLGeneratedPreviewParts init](&v17, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_data, a3);
    objc_storeStrong((id *)&v15->_attachments, a6);
    objc_storeStrong((id *)&v15->_mimeType, a5);
    v15->_stringEncoding = a4;
  }

  return v15;
}

- (void)computePreview:(id)a3
{
  unint64_t stringEncoding;
  void (**v5)(_QWORD);
  CFStringEncoding v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  __CFString *v11;
  _QWORD v12[5];

  stringEncoding = self->_stringEncoding;
  v5 = (void (**)(_QWORD))a3;
  v6 = CFStringConvertNSStringEncodingToEncoding(stringEncoding);
  v11 = (__CFString *)CFStringConvertEncodingToIANACharSetName(v6);
  -[QLGeneratedPreviewParts mimeType](self, "mimeType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[QLPreviewParts startDataRepresentationWithMimeType:textEncoding:](self, "startDataRepresentationWithMimeType:textEncoding:", v7, v11);

  -[QLGeneratedPreviewParts attachments](self, "attachments");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __42__QLGeneratedPreviewParts_computePreview___block_invoke;
  v12[3] = &unk_24C725EB8;
  v12[4] = self;
  objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v12);

  -[QLGeneratedPreviewParts data](self, "data");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[QLPreviewParts previewURL](self, "previewURL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[QLPreviewParts appendData:forURL:lastChunk:](self, "appendData:forURL:lastChunk:", v9, v10, 1);

  v5[2](v5);
}

uint64_t __42__QLGeneratedPreviewParts_computePreview___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_processAttachment:withID:", a3, a2);
}

- (void)_processAttachment:(id)a3 withID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  NSObject **v15;
  NSObject *v16;
  NSObject *v17;
  NSObject **v18;
  int v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "contentType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "preferredMIMEType");
  v9 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    objc_msgSend(v7, "pathExtension");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10
      || (objc_msgSend(MEMORY[0x24BDF8238], "typeWithFilenameExtension:", v10),
          (v11 = (void *)objc_claimAutoreleasedReturnValue()) == 0)
      || (v12 = v11,
          objc_msgSend(v11, "preferredMIMEType"),
          v9 = (__CFString *)objc_claimAutoreleasedReturnValue(),
          v12,
          !v9))
    {
      v9 = CFSTR("text/html");
    }

  }
  objc_msgSend(v6, "data");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = -[QLGeneratedPreviewParts newAttachmentURLWithID:mimeType:encoding:](self, "newAttachmentURLWithID:mimeType:encoding:", v7, v9, -[QLGeneratedPreviewParts stringEncoding](self, "stringEncoding"));
    if (v14)
    {
      -[QLPreviewParts appendData:forURL:lastChunk:](self, "appendData:forURL:lastChunk:", v13, v14, 1);
    }
    else
    {
      v17 = *MEMORY[0x24BE7BF48];
      if (!*MEMORY[0x24BE7BF48])
      {
        v18 = (NSObject **)MEMORY[0x24BE7BF48];
        QLSInitLogging();
        v17 = *v18;
      }
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        v19 = 138412290;
        v20 = v7;
        _os_log_impl(&dword_20D4F5000, v17, OS_LOG_TYPE_ERROR, "Unable to create attachment for id %@ #Conversion", (uint8_t *)&v19, 0xCu);
      }
    }

  }
  else
  {
    v15 = (NSObject **)MEMORY[0x24BE7BF48];
    v16 = *MEMORY[0x24BE7BF48];
    if (!*MEMORY[0x24BE7BF48])
    {
      QLSInitLogging();
      v16 = *v15;
    }
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v19 = 138412290;
      v20 = v7;
      _os_log_impl(&dword_20D4F5000, v16, OS_LOG_TYPE_ERROR, "No data for attachement with id %@ #Conversion", (uint8_t *)&v19, 0xCu);
    }
  }

}

- (id)newAttachmentURLWithID:(id)a3 mimeType:(id)a4 encoding:(unint64_t)a5
{
  id v8;
  id v9;
  CFStringEncoding v10;
  __CFString *v11;
  id v12;

  v8 = a3;
  v9 = a4;
  v10 = CFStringConvertNSStringEncodingToEncoding(a5);
  v11 = (__CFString *)CFStringConvertEncodingToIANACharSetName(v10);
  v12 = -[QLPreviewParts newSafeAttachmentURLWithID:mimeType:textEncoding:](self, "newSafeAttachmentURLWithID:mimeType:textEncoding:", v8, v9, v11);

  if (v12)
    -[QLGeneratedPreviewParts _registerURL:forContentID:](self, "_registerURL:forContentID:", v12, v8);

  return v12;
}

- (void)_registerURL:(id)a3 forContentID:(id)a4
{
  id v6;
  QLGeneratedPreviewParts *v7;
  NSMutableDictionary *idToURL;
  NSMutableDictionary *v9;
  NSMutableDictionary *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  v7 = self;
  objc_sync_enter(v7);
  idToURL = v7->_idToURL;
  if (!idToURL)
  {
    v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    v10 = v7->_idToURL;
    v7->_idToURL = v9;

    idToURL = v7->_idToURL;
  }
  -[NSMutableDictionary setObject:forKey:](idToURL, "setObject:forKey:", v11, v6);
  objc_sync_exit(v7);

}

- (id)URLRequestForContentID:(id)a3
{
  id v4;
  void *v5;
  QLGeneratedPreviewParts *v6;
  void *v7;
  NSObject **v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  int v13;
  id v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "stringByRemovingPercentEncoding");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = self;
  objc_sync_enter(v6);
  -[NSMutableDictionary objectForKey:](v6->_idToURL, "objectForKey:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (NSObject **)MEMORY[0x24BE7BF48];
  if (!v7)
  {
    -[NSMutableDictionary objectForKey:](v6->_idToURL, "objectForKey:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v11 = *v8;
      if (!*v8)
      {
        QLSInitLogging();
        v11 = *v8;
      }
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        v13 = 138412546;
        v14 = v4;
        v15 = 2112;
        v16 = v5;
        _os_log_impl(&dword_20D4F5000, v11, OS_LOG_TYPE_INFO, "Preview generator uses escaped content ID as key (%@) in attachments dictionary (kQLPreviewPropertyAttachmentsKey). It should use the unescaped content ID (%@) #Conversion", (uint8_t *)&v13, 0x16u);
      }
    }
  }
  v9 = *v8;
  if (!*v8)
  {
    QLSInitLogging();
    v9 = *v8;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    v13 = 138412546;
    v14 = v7;
    v15 = 2112;
    v16 = v5;
    _os_log_impl(&dword_20D4F5000, v9, OS_LOG_TYPE_DEBUG, "Returning url %@ for contentID %@ #Conversion", (uint8_t *)&v13, 0x16u);
  }
  objc_sync_exit(v6);

  if (v7)
  {
    -[QLPreviewParts requestForURL:](v6, "requestForURL:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (NSData)data
{
  return (NSData *)objc_getProperty(self, a2, 40, 1);
}

- (void)setData:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (NSDictionary)attachments
{
  return (NSDictionary *)objc_getProperty(self, a2, 48, 1);
}

- (void)setAttachments:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (unint64_t)stringEncoding
{
  return self->_stringEncoding;
}

- (void)setStringEncoding:(unint64_t)a3
{
  self->_stringEncoding = a3;
}

- (NSString)mimeType
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void)setMimeType:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (NSMutableDictionary)idToURL
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 72, 1);
}

- (void)setIdToURL:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_idToURL, 0);
  objc_storeStrong((id *)&self->_mimeType, 0);
  objc_storeStrong((id *)&self->_attachments, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

@end
