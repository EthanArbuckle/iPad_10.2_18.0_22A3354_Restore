@implementation MFWebMessageDocument

- (id)preferredCharacterSet
{
  id result;

  if (-[MFWebMessageDocument preferredEncoding](self, "preferredEncoding") == -1)
    return (id)-[MFMimePart bodyParameterForKey:](-[MFWebMessageDocument mimePart](self, "mimePart"), "bodyParameterForKey:", CFSTR("charset"));
  result = (id)MFCharsetForEncoding();
  if (!result)
    return (id)-[MFMimePart bodyParameterForKey:](-[MFWebMessageDocument mimePart](self, "mimePart"), "bodyParameterForKey:", CFSTR("charset"));
  return result;
}

- (unsigned)preferredEncoding
{
  return self->_preferredEncoding;
}

- (MFMimePart)mimePart
{
  return self->_htmlPart;
}

- (MFWebMessageDocument)init
{
  MFWebMessageDocument *v2;
  MFWebMessageDocument *v3;
  unsigned int v4;
  unsigned int v5;
  id v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MFWebMessageDocument;
  v2 = -[MFWebAttachmentSource init](&v9, sel_init);
  v3 = v2;
  if (v2)
  {
    do
    {
      v4 = __ldxr(&init_lastUniqueId);
      v5 = v4 + 1;
    }
    while (__stxr(v5, &init_lastUniqueId));
    v2->_uniqueId = v5;
    v6 = objc_allocWithZone(MEMORY[0x1E0C99E98]);
    v3->_baseURL = (NSURL *)objc_msgSend(v6, "initWithString:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("x-msg://%ul/"), v3->_uniqueId));
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("MFWebMessageDocument/%ul"), v3->_uniqueId);
    v3->_lock = (MFLock *)objc_msgSend(objc_alloc(MEMORY[0x1E0D460A8]), "initWithName:andDelegate:", v7, v3);

    v3->_preferredEncoding = -1;
  }
  return v3;
}

- (MFWebMessageDocument)initWithMimeBody:(id)a3
{
  if (a3 && objc_msgSend(a3, "isHTML"))
    return -[MFWebMessageDocument initWithMimePart:](self, "initWithMimePart:", objc_msgSend(a3, "textHtmlPart"));
  -[MFWebMessageDocument dealloc](self, "dealloc");
  return 0;
}

- (id)_initWithMimePart:(id)a3 htmlData:(id)a4
{
  uint64_t v7;
  void *v8;
  MFWebMessageDocument *v9;

  v7 = objc_msgSend(a3, "mimeBody");
  if (a4 && a3 && (v8 = (void *)v7) != 0)
  {
    v9 = -[MFWebMessageDocument init](self, "init");
    if (v9)
    {
      v9->_htmlPart = (MFMimePart *)a3;
      v9->_mimeBody = (MFMimeBody *)v8;
      v9->_htmlData = (NSData *)a4;
    }
  }
  else
  {
    -[MFWebMessageDocument dealloc](self, "dealloc");
    return 0;
  }
  return v9;
}

- (MFWebMessageDocument)initWithMimePart:(id)a3
{
  return (MFWebMessageDocument *)-[MFWebMessageDocument _initWithMimePart:htmlData:](self, "_initWithMimePart:htmlData:", a3, objc_msgSend(a3, "bodyData"));
}

- (MFWebMessageDocument)initWithMimePart:(id)a3 htmlData:(id)a4 encoding:(unsigned int)a5
{
  uint64_t v5;
  MFWebMessageDocument *v6;
  MFWebMessageDocument *v7;

  v5 = *(_QWORD *)&a5;
  v6 = -[MFWebMessageDocument _initWithMimePart:htmlData:](self, "_initWithMimePart:htmlData:", a3, a4);
  v7 = v6;
  if (v6)
    -[MFWebMessageDocument setPreferredEncoding:](v6, "setPreferredEncoding:", v5);
  return v7;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MFWebMessageDocument;
  -[MFWebAttachmentSource dealloc](&v3, sel_dealloc);
}

- (id)mimePartForURL:(id)a3
{
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  id v15;
  id v17;

  -[MFLock lock](self->_lock, "lock");
  if (!self->_partsByURL)
  {
    v17 = a3;
    self->_partsByURL = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    self->_partsByFilename = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v5 = (void *)objc_msgSend(objc_allocWithZone(MEMORY[0x1E0C99DE8]), "initWithObjects:", -[MFMimeBody topLevelPart](-[MFWebMessageDocument mimeBody](self, "mimeBody"), "topLevelPart"), 0);
    while (objc_msgSend(v5, "count"))
    {
      v6 = (id)objc_msgSend(v5, "lastObject");
      v7 = (void *)MFCreateURLForContentID((__CFString *)objc_msgSend(v6, "contentID"));
      v8 = objc_msgSend(v6, "contentLocation");
      v9 = objc_msgSend(v6, "attachmentFilename");
      if (v7)
      {
        -[NSMutableDictionary setObject:forKey:](self->_partsByURL, "setObject:forKey:", v6, v7);

      }
      if (v8)
      {
        v10 = (void *)objc_msgSend(objc_allocWithZone(MEMORY[0x1E0C99E98]), "initWithString:relativeToURL:", v8, self->_baseURL);
        if (v10)
        {
          v11 = v10;
          -[NSMutableDictionary setObject:forKey:](self->_partsByURL, "setObject:forKey:", v6, objc_msgSend(v10, "absoluteURL"));

        }
      }
      if (v9)
        -[NSMutableDictionary setObject:forKey:](self->_partsByFilename, "setObject:forKey:", v6, v9);
      objc_msgSend(v5, "removeLastObject");
      v12 = objc_msgSend(v6, "subparts");
      if (v12)
        objc_msgSend(v5, "addObjectsFromArray:", v12);

    }
    a3 = v17;
    if (!v17)
      goto LABEL_17;
LABEL_16:
    v13 = (void *)-[NSMutableDictionary objectForKey:](self->_partsByURL, "objectForKey:", a3);
    if (v13)
      goto LABEL_20;
    goto LABEL_17;
  }
  if (a3)
    goto LABEL_16;
LABEL_17:
  v14 = objc_msgSend((id)objc_msgSend(a3, "path"), "lastPathComponent");
  if (v14)
    v13 = (void *)-[NSMutableDictionary objectForKey:](self->_partsByFilename, "objectForKey:", v14);
  else
    v13 = 0;
LABEL_20:
  v15 = v13;
  -[MFLock unlock](self->_lock, "unlock");
  return v13;
}

- (id)attachmentForURL:(id)a3
{
  id v5;
  id v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MFWebMessageDocument;
  v5 = -[MFWebAttachmentSource attachmentForURL:](&v9, sel_attachmentForURL_);
  if (!v5)
  {
    v6 = -[MFWebMessageDocument mimePartForURL:](self, "mimePartForURL:", a3);
    if (v6 && (v7 = (void *)objc_msgSend(v6, "attachments"), objc_msgSend(v7, "count")))
    {
      v5 = (id)objc_msgSend(v7, "objectAtIndex:", 0);
      -[MFWebAttachmentSource setAttachment:forURL:](self, "setAttachment:forURL:", v5, a3);
    }
    else
    {
      return 0;
    }
  }
  return v5;
}

- (id)attachmentsInDocument
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  id v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  -[MFWebMessageDocument mimePartForURL:](self, "mimePartForURL:", 0);
  -[MFLock lock](self->_lock, "lock");
  v3 = (void *)-[NSMutableDictionary allKeys](self->_partsByURL, "allKeys");
  -[MFLock unlock](self->_lock, "unlock");
  if (!objc_msgSend(v3, "count"))
    return 0;
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v3);
        v9 = -[MFWebMessageDocument attachmentForURL:](self, "attachmentForURL:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v8));
        if (v9)
          objc_msgSend(v4, "addObject:", v9);
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }
  v10 = v4;
  return v4;
}

- (id)fileWrapper
{
  id v3;

  v3 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D460C0]), "initRegularFileWithContents:", -[MFWebMessageDocument htmlData](self, "htmlData"));
  -[MFMimePart configureFileWrapper:](-[MFWebMessageDocument mimePart](self, "mimePart"), "configureFileWrapper:", v3);
  return v3;
}

- (NSURL)baseURL
{
  return self->_baseURL;
}

- (MFMimeBody)mimeBody
{
  return self->_mimeBody;
}

- (NSData)htmlData
{
  return self->_htmlData;
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
  objc_setProperty_nonatomic(self, a2, a3, 96);
}

@end
