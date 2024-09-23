@implementation MFWebMessageDocument

- (MFWebMessageDocument)init
{
  MFWebMessageDocument *v2;
  MFWebMessageDocument *v3;
  unsigned int v4;
  unsigned int v5;
  id v6;
  void *v7;
  uint64_t v8;
  NSURL *baseURL;
  void *v10;
  uint64_t v11;
  MFLock *lock;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)MFWebMessageDocument;
  v2 = -[MFWebAttachmentSource init](&v14, sel_init);
  v3 = v2;
  if (v2)
  {
    do
    {
      v4 = __ldxr((unsigned int *)&init_lastUniqueId);
      v5 = v4 + 1;
    }
    while (__stxr(v5, (unsigned int *)&init_lastUniqueId));
    v2->_uniqueId = v5;
    v6 = objc_allocWithZone(MEMORY[0x1E0C99E98]);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("x-msg://%ul/"), v3->_uniqueId);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "initWithString:", v7);
    baseURL = v3->_baseURL;
    v3->_baseURL = (NSURL *)v8;

    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("MFWebMessageDocument/%ul"), v3->_uniqueId);
    v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0D460A8]), "initWithName:andDelegate:", v10, v3);
    lock = v3->_lock;
    v3->_lock = (MFLock *)v11;

    v3->_preferredEncoding = -1;
  }
  return v3;
}

- (MFWebMessageDocument)initWithMimeBody:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  MFWebMessageDocument *v7;

  v4 = a3;
  v5 = v4;
  if (v4 && objc_msgSend(v4, "isHTML"))
  {
    objc_msgSend(v5, "textHtmlPart");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    self = -[MFWebMessageDocument initWithMimePart:](self, "initWithMimePart:", v6);

    v7 = self;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)_initWithMimePart:(id)a3 htmlData:(id)a4
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  MFWebMessageDocument *v11;
  MFWebMessageDocument *v12;
  NSData *v13;

  v7 = a3;
  v8 = a4;
  objc_msgSend(v7, "mimeBody");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  v11 = 0;
  if (!v8 || !v7 || !v9)
    goto LABEL_6;
  v12 = -[MFWebMessageDocument init](self, "init");
  v11 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_htmlPart, a3);
    objc_storeStrong((id *)&v11->_mimeBody, v10);
    v13 = (NSData *)v8;
    self = (MFWebMessageDocument *)v11->_htmlData;
    v11->_htmlData = v13;
LABEL_6:

  }
  return v11;
}

- (MFWebMessageDocument)initWithMimePart:(id)a3
{
  id v4;
  void *v5;
  MFWebMessageDocument *v6;

  v4 = a3;
  objc_msgSend(v4, "bodyData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[MFWebMessageDocument _initWithMimePart:htmlData:](self, "_initWithMimePart:htmlData:", v4, v5);

  return v6;
}

- (MFWebMessageDocument)initWithMimePart:(id)a3 htmlData:(id)a4 encoding:(unsigned int)a5
{
  uint64_t v5;
  id v8;
  id v9;
  MFWebMessageDocument *v10;
  MFWebMessageDocument *v11;

  v5 = *(_QWORD *)&a5;
  v8 = a3;
  v9 = a4;
  v10 = -[MFWebMessageDocument _initWithMimePart:htmlData:](self, "_initWithMimePart:htmlData:", v8, v9);
  v11 = v10;
  if (v10)
    -[MFWebMessageDocument setPreferredEncoding:](v10, "setPreferredEncoding:", v5);

  return v11;
}

- (id)mimePartForURL:(id)a3
{
  NSMutableDictionary *v4;
  NSMutableDictionary *partsByURL;
  NSMutableDictionary *v6;
  NSMutableDictionary *partsByFilename;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSMutableDictionary *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v24;

  v24 = a3;
  -[MFLock lock](self->_lock, "lock");
  if (!self->_partsByURL)
  {
    v4 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    partsByURL = self->_partsByURL;
    self->_partsByURL = v4;

    v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    partsByFilename = self->_partsByFilename;
    self->_partsByFilename = v6;

    v8 = objc_allocWithZone(MEMORY[0x1E0C99DE8]);
    -[MFWebMessageDocument mimeBody](self, "mimeBody");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "topLevelPart");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v8, "initWithObjects:", v10, 0);
    while (1)
    {

      if (!objc_msgSend(v11, "count"))
        break;
      objc_msgSend(v11, "lastObject");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "contentID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)MFCreateURLForContentID(v12);

      objc_msgSend(v9, "contentLocation");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "attachmentFilename");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
        -[NSMutableDictionary setObject:forKey:](self->_partsByURL, "setObject:forKey:", v9, v10);
      if (v13)
      {
        v15 = (void *)objc_msgSend(objc_allocWithZone(MEMORY[0x1E0C99E98]), "initWithString:relativeToURL:", v13, self->_baseURL);
        v16 = v15;
        if (v15)
        {
          v17 = self->_partsByURL;
          objc_msgSend(v15, "absoluteURL");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary setObject:forKey:](v17, "setObject:forKey:", v9, v18);

        }
      }
      if (v14)
        -[NSMutableDictionary setObject:forKey:](self->_partsByFilename, "setObject:forKey:", v9, v14);
      objc_msgSend(v11, "removeLastObject");
      objc_msgSend(v9, "subparts");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (v19)
        objc_msgSend(v11, "addObjectsFromArray:", v19);

    }
  }
  if (!v24
    || (-[NSMutableDictionary objectForKey:](self->_partsByURL, "objectForKey:", v24),
        (v20 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    objc_msgSend(v24, "path");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "lastPathComponent");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      -[NSMutableDictionary objectForKey:](self->_partsByFilename, "objectForKey:", v22);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v20 = 0;
    }

  }
  -[MFLock unlock](self->_lock, "unlock");

  return v20;
}

- (id)attachmentForURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MFWebMessageDocument;
  -[MFWebAttachmentSource attachmentForURL:](&v10, sel_attachmentForURL_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    -[MFWebMessageDocument mimePartForURL:](self, "mimePartForURL:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      objc_msgSend(v6, "attachments");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v8, "count"))
      {
        objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        -[MFWebAttachmentSource setAttachment:forURL:](self, "setAttachment:forURL:", v5, v4);
      }
      else
      {
        v5 = 0;
      }

    }
    else
    {
      v5 = 0;
    }

  }
  return v5;
}

- (id)attachmentsInDocument
{
  id v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = -[MFWebMessageDocument mimePartForURL:](self, "mimePartForURL:", 0);
  -[MFLock lock](self->_lock, "lock");
  -[NSMutableDictionary allKeys](self->_partsByURL, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFLock unlock](self->_lock, "unlock");
  if (objc_msgSend(v4, "count"))
  {
    v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v13;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(v6);
          -[MFWebMessageDocument attachmentForURL:](self, "attachmentForURL:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9), (_QWORD)v12);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          if (v10)
            objc_msgSend(v5, "addObject:", v10);

          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v7);
    }

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)preferredCharacterSet
{
  void *v3;
  void *v4;

  if (-[MFWebMessageDocument preferredEncoding](self, "preferredEncoding") == -1
    || (MFCharsetForEncoding(), (v3 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    -[MFWebMessageDocument mimePart](self, "mimePart");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bodyParameterForKey:", CFSTR("charset"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (id)fileWrapper
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc(MEMORY[0x1E0D460C0]);
  -[MFWebMessageDocument htmlData](self, "htmlData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initRegularFileWithContents:", v4);

  -[MFWebMessageDocument mimePart](self, "mimePart");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "configureFileWrapper:", v5);

  return v5;
}

- (NSURL)baseURL
{
  return (NSURL *)objc_getProperty(self, a2, 32, 1);
}

- (MFMimeBody)mimeBody
{
  return (MFMimeBody *)objc_getProperty(self, a2, 40, 1);
}

- (MFMimePart)mimePart
{
  return (MFMimePart *)objc_getProperty(self, a2, 48, 1);
}

- (NSData)htmlData
{
  return (NSData *)objc_getProperty(self, a2, 56, 1);
}

- (unsigned)preferredEncoding
{
  return self->_preferredEncoding;
}

- (void)setPreferredEncoding:(unsigned int)a3
{
  self->_preferredEncoding = a3;
}

- (BOOL)isVisuallyEmpty
{
  return self->_visuallyEmpty;
}

- (void)setVisuallyEmpty:(BOOL)a3
{
  self->_visuallyEmpty = a3;
}

- (MFAttachmentManager)attachmentManager
{
  return self->_attachmentManager;
}

- (void)setAttachmentManager:(id)a3
{
  objc_storeStrong((id *)&self->_attachmentManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attachmentManager, 0);
  objc_storeStrong((id *)&self->_partsByFilename, 0);
  objc_storeStrong((id *)&self->_partsByURL, 0);
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_htmlData, 0);
  objc_storeStrong((id *)&self->_htmlPart, 0);
  objc_storeStrong((id *)&self->_mimeBody, 0);
  objc_storeStrong((id *)&self->_baseURL, 0);
}

@end
