@implementation MFAttachmentDataProvider

+ (id)dataProviderWithURL:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithURL:", v4);

  return v5;
}

+ (id)dataProviderWithPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint8_t v9[16];

  v4 = a3;
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithURL:", v5);

  }
  else
  {
    MFLogGeneral();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_1A4F90000, v7, OS_LOG_TYPE_INFO, "#Attachments nil path detected in initializer", v9, 2u);
    }

    v6 = 0;
  }

  return v6;
}

- (MFAttachmentDataProvider)initWithURL:(id)a3
{
  id v5;
  MFAttachmentDataProvider *v6;
  MFAttachmentDataProvider *v7;

  v5 = a3;
  v6 = -[MFAttachmentDataProvider init](self, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_url, a3);

  return v7;
}

- (id)errorWithMessage:(id)a3 code:(int64_t)a4
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1E0CB35C8];
  v9 = *MEMORY[0x1E0CB2D50];
  v10[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "errorWithDomain:code:userInfo:", CFSTR("MFAttachmentDataProviderErrorDomain"), 0, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
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
  void *v3;
  void *v4;
  char v5;

  if (!-[MFAttachmentDataProvider _isFileURL](self, "_isFileURL"))
    return 0;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFAttachmentDataProvider _path](self, "_path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "fileExistsAtPath:", v4);

  return v5;
}

- (id)_fileAttributes:(id)a3
{
  id v3;
  void *v4;
  unint64_t v5;
  void *v6;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v5 = strtoul((const char *)objc_msgSend(objc_retainAutorelease(v3), "ef_lossyDefaultCStringBytes"), 0, 8) & 0x1FF;
    if (v5)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v6, *MEMORY[0x1E0CB2AA8]);

    }
  }

  return v4;
}

- (BOOL)save:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  id v10;
  void *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  id v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[MFAttachmentDataProvider _path](self, "_path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");

  objc_msgSend(v6, "stringByDeletingLastPathComponent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0;
    v9 = objc_msgSend(v8, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v7, 1, 0, &v16);
    v10 = v16;
    if (v9)
    {
      v11 = (void *)MEMORY[0x1E0C99E08];
      -[MFAttachmentDataProvider _fileAttributes:](self, "_fileAttributes:", 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "dictionaryWithDictionary:", v12);
      v13 = objc_claimAutoreleasedReturnValue();

      -[NSObject setObject:forKey:](v13, "setObject:forKey:", *MEMORY[0x1E0CB2AB8], *MEMORY[0x1E0CB2AD8]);
      if ((objc_msgSend(v8, "createFileAtPath:contents:attributes:", v6, v4, v13) & 1) == 0)
      {
        MFLogGeneral();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          v18 = v6;
          v19 = 2112;
          v20 = v10;
          _os_log_impl(&dword_1A4F90000, v14, OS_LOG_TYPE_INFO, "#Attachments Failed to create file for attachment %@: %@", buf, 0x16u);
        }

      }
    }
    else
    {
      MFLogGeneral();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        v18 = v7;
        v19 = 2112;
        v20 = v10;
        _os_log_impl(&dword_1A4F90000, v13, OS_LOG_TYPE_INFO, "#Attachments Failed to create directory for attachment %@: %@", buf, 0x16u);
      }
    }

  }
  return 0;
}

- (id)data
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0D46080];
  -[MFAttachmentDataProvider _path](self, "_path");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dataWithContentsOfFile:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (NSURL)url
{
  return (NSURL *)objc_getProperty(self, a2, 8, 1);
}

- (void)setUrl:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
}

@end
