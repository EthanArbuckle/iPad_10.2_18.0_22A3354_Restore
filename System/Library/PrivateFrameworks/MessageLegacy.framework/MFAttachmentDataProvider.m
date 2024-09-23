@implementation MFAttachmentDataProvider

+ (id)dataProviderWithURL:(id)a3
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithURL:", a3);
}

+ (id)dataProviderWithPath:(id)a3
{
  NSObject *v4;
  uint8_t v5[16];

  if (a3)
    return (id)objc_msgSend(objc_alloc((Class)a1), "initWithURL:", objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:"));
  v4 = MFLogGeneral();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1C8839000, v4, OS_LOG_TYPE_INFO, "#Attachments nil path detected in initializer", v5, 2u);
  }
  return 0;
}

- (MFAttachmentDataProvider)initWithURL:(id)a3
{
  MFAttachmentDataProvider *v4;

  v4 = -[MFAttachmentDataProvider init](self, "init");
  if (v4)
    v4->_url = (NSURL *)a3;
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MFAttachmentDataProvider;
  -[MFAttachmentDataProvider dealloc](&v3, sel_dealloc);
}

- (id)errorWithMessage:(id)a3 code:(int64_t)a4
{
  uint64_t v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v5 = *MEMORY[0x1E0CB2D50];
  v6[0] = a3;
  return (id)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MFAttachmentDataProviderErrorDomain"), 0, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1));
}

- (id)_path
{
  return -[NSURL path](self->_url, "path");
}

- (BOOL)_isFileURL
{
  return -[NSURL isFileURL](self->_url, "isFileURL");
}

- (BOOL)exists
{
  int v3;

  v3 = -[MFAttachmentDataProvider _isFileURL](self, "_isFileURL");
  if (v3)
    LOBYTE(v3) = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "fileExistsAtPath:", -[MFAttachmentDataProvider _path](self, "_path"));
  return v3;
}

- (id)_fileAttributes:(id)a3
{
  void *v4;
  unint64_t v5;
  uint64_t v6;

  v4 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 1);
  if (a3)
  {
    v5 = strtoul((const char *)objc_msgSend(a3, "ef_lossyDefaultCStringBytes"), 0, 8) & 0x1FF;
    if (v5)
    {
      v6 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", v5);
      objc_msgSend(v4, "setObject:forKey:", v6, *MEMORY[0x1E0CB2AA8]);
    }
  }
  return v4;
}

- (BOOL)save:(id)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  NSObject *v10;
  const char *v11;
  uint64_t v13;
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_msgSend(-[MFAttachmentDataProvider _path](self, "_path"), "copy");
  v6 = objc_msgSend(v5, "stringByDeletingLastPathComponent");
  if (v6)
  {
    v7 = v6;
    v8 = (void *)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v13 = 0;
    if (objc_msgSend(v8, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v7, 1, 0, &v13))
    {
      v9 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", -[MFAttachmentDataProvider _fileAttributes:](self, "_fileAttributes:", 0));
      objc_msgSend(v9, "setObject:forKey:", *MEMORY[0x1E0CB2AB8], *MEMORY[0x1E0CB2AD8]);
      if ((objc_msgSend(v8, "createFileAtPath:contents:attributes:", v5, a3, v9) & 1) == 0)
      {
        v10 = MFLogGeneral();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          v15 = (uint64_t)v5;
          v16 = 2112;
          v17 = v13;
          v11 = "#Attachments Failed to create file for attachment %@: %@";
LABEL_8:
          _os_log_impl(&dword_1C8839000, v10, OS_LOG_TYPE_INFO, v11, buf, 0x16u);
        }
      }
    }
    else
    {
      v10 = MFLogGeneral();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        v15 = v7;
        v16 = 2112;
        v17 = v13;
        v11 = "#Attachments Failed to create directory for attachment %@: %@";
        goto LABEL_8;
      }
    }
  }

  return 0;
}

- (id)data
{
  return (id)objc_msgSend(MEMORY[0x1E0D46080], "dataWithContentsOfFile:", -[MFAttachmentDataProvider _path](self, "_path"));
}

- (NSURL)url
{
  return (NSURL *)objc_getProperty(self, a2, 8, 1);
}

- (void)setUrl:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

@end
