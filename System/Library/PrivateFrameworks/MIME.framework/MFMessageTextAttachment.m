@implementation MFMessageTextAttachment

- (MFMessageTextAttachment)init
{
  id v3;
  MFMessageTextAttachment *v4;

  v3 = -[MFMessageFileWrapper initRegularFileWithContents:]([MFPlaceholderFileWrapper alloc], "initRegularFileWithContents:", 0);
  v4 = -[MFMessageTextAttachment initWithWrapper:](self, "initWithWrapper:", v3);

  return v4;
}

- (MFMessageTextAttachment)initWithWrapper:(id)a3
{
  id v4;
  MFMessageTextAttachment *v5;
  NSMutableDictionary *v6;
  NSMutableDictionary *cache;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MFMessageTextAttachment;
  v5 = -[MFMessageTextAttachment init](&v9, sel_init);
  if (v5)
  {
    v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    cache = v5->_cache;
    v5->_cache = v6;

    -[MFMessageTextAttachment setCachedValue:forKey:](v5, "setCachedValue:forKey:", v4, CFSTR("kMessageTextAttachmentFileWrapper"));
  }

  return v5;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v7.receiver = self;
  v7.super_class = (Class)MFMessageTextAttachment;
  -[MFMessageTextAttachment description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@\n\tcache: %@"), v4, self->_cache);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)cachedValueForKey:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[NSMutableDictionary mf_lock](self->_cache, "mf_lock");
  -[NSMutableDictionary objectForKey:](self->_cache, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary mf_unlock](self->_cache, "mf_unlock");

  return v5;
}

- (void)setCachedValue:(id)a3 forKey:(id)a4
{
  id v6;
  NSMutableDictionary *cache;
  id v8;

  v8 = a3;
  v6 = a4;
  -[NSMutableDictionary mf_lock](self->_cache, "mf_lock");
  cache = self->_cache;
  if (v8)
    -[NSMutableDictionary setObject:forKey:](cache, "setObject:forKey:", v8, v6);
  else
    -[NSMutableDictionary removeObjectForKey:](cache, "removeObjectForKey:", v6);
  -[NSMutableDictionary mf_unlock](self->_cache, "mf_unlock");

}

- (MFMessageFileWrapper)fileWrapper
{
  return (MFMessageFileWrapper *)-[MFMessageTextAttachment cachedValueForKey:](self, "cachedValueForKey:", CFSTR("kMessageTextAttachmentFileWrapper"));
}

- (void)setFileWrapper:(id)a3
{
  -[MFMessageTextAttachment setCachedValue:forKey:](self, "setCachedValue:forKey:", a3, CFSTR("kMessageTextAttachmentFileWrapper"));
}

- (unsigned)approximateSize
{
  void *v2;
  unsigned int v3;
  void *v4;
  void *v5;
  void *v6;
  id v8;

  -[MFMessageTextAttachment fileWrapper](self, "fileWrapper");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (!v8)
    return 0;
  v2 = (void *)objc_msgSend(objc_allocWithZone(MEMORY[0x1E0C99DE8]), "initWithObjects:count:", &v8, 1);
  v3 = 0;
  while (objc_msgSend(v2, "count"))
  {
    objc_msgSend(v2, "lastObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "removeLastObject");
    if (objc_msgSend(v4, "isSymbolicLink"))
    {
      v3 += 1024;
      goto LABEL_12;
    }
    if (objc_msgSend(v4, "isDirectory"))
    {
      objc_msgSend(v4, "fileWrappers");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "allValues");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6)
        objc_msgSend(v2, "addObjectsFromArray:", v6);
    }
    else
    {
      if (!objc_msgSend(v4, "isRegularFile"))
        goto LABEL_12;
      objc_msgSend(v4, "regularFileContents");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v3 += objc_msgSend(v6, "length");
    }

LABEL_12:
  }

  return v3;
}

- (BOOL)hasBeenDownloaded
{
  return !-[MFMessageTextAttachment isPlaceholder](self, "isPlaceholder");
}

- (BOOL)needsRedownload
{
  return 0;
}

- (BOOL)isPlaceholder
{
  void *v2;
  char v3;

  -[MFMessageTextAttachment fileWrapperForcingDownload:](self, "fileWrapperForcingDownload:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isPlaceholder");

  return v3;
}

- (void)inlineDisplayData:(id *)a3 mimeType:(id *)a4
{
  void *v6;
  id v7;

  -[MFMessageTextAttachment fileWrapperForcingDownload:](self, "fileWrapperForcingDownload:", a3 != 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (a3)
  {
    objc_msgSend(v6, "regularFileContents");
    *a3 = (id)objc_claimAutoreleasedReturnValue();
    v6 = v7;
  }
  if (a4)
  {
    objc_msgSend(v6, "mimeType");
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    v6 = v7;
  }

}

- (id)fileWrapperForcingDownload:(BOOL)a3
{
  if (a3 && -[MFMessageTextAttachment isPlaceholder](self, "isPlaceholder"))
    -[MFMessageTextAttachment download](self, "download");
  return -[MFMessageTextAttachment fileWrapper](self, "fileWrapper");
}

+ (unint64_t)precedenceLevel
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cache, 0);
}

- (id)mimePart
{
  return -[MFMessageTextAttachment cachedValueForKey:](self, "cachedValueForKey:", CFSTR("kMimeTextAttachmentMimePart"));
}

- (void)setMimePart:(id)a3
{
  -[MFMessageTextAttachment setCachedValue:forKey:](self, "setCachedValue:forKey:", a3, CFSTR("kMimeTextAttachmentMimePart"));
}

- (BOOL)shouldDownloadAttachmentOnDisplay
{
  return 0;
}

- (id)textEncodingGuess
{
  return 0;
}

- (id)textEncodingNameForData:(id)a3 mimeType:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  __CFString *v12;
  __CFString *v13;
  const __CFAllocator *Default;
  const __CFAllocator *v15;
  id v16;
  CFStringRef v17;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (!v7)
    goto LABEL_9;
  v9 = objc_retainAutorelease(v7);
  if (!strcmp("text/html", (const char *)objc_msgSend(v9, "UTF8String")))
  {
    Default = CFAllocatorGetDefault();
    v15 = (const __CFAllocator *)MFGetMappedAllocator();
    CFAllocatorSetDefault(v15);
    v16 = objc_retainAutorelease(v6);
    v17 = CFStringCreateWithBytes(v15, (const UInt8 *)objc_msgSend(v16, "bytes"), objc_msgSend(v16, "length"), 0x8000100u, 0);
    CFAllocatorSetDefault(Default);
    if (v17)
    {
      CFRelease(v17);
      v13 = CFSTR("UTF-8");
      goto LABEL_10;
    }
LABEL_9:
    v13 = 0;
    goto LABEL_10;
  }
  if (!objc_msgSend(v9, "hasPrefix:", CFSTR("text/")))
    goto LABEL_9;
  -[MFMessageTextAttachment textEncodingGuess](self, "textEncodingGuess");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  v12 = CFSTR("UTF-8");
  if (v10)
    v12 = (__CFString *)v10;
  v13 = v12;

LABEL_10:
  return v13;
}

@end
