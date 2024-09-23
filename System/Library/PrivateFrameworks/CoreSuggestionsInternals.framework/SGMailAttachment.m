@implementation SGMailAttachment

- (SGMailAttachment)initWithType:(id)a3 filename:(id)a4 path:(id)a5
{
  id v9;
  id v10;
  id v11;
  SGMailAttachment *v12;
  SGMailAttachment *v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  NSString *path;
  void *v20;
  id v21;
  objc_super v22;
  uint8_t buf[4];
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v22.receiver = self;
  v22.super_class = (Class)SGMailAttachment;
  v12 = -[SGMailAttachment init](&v22, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_type, a3);
    objc_storeStrong((id *)&v13->_filename, a4);
    if (objc_msgSend(v11, "length"))
    {
      objc_storeStrong((id *)&v13->_path, a5);
      v13->_isDownloadedLocally = 1;
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 0;
      objc_msgSend(v14, "attributesOfItemAtPath:error:", v11, &v21);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v21;
      v13->_size = objc_msgSend(v15, "fileSize");

      if (v16)
      {
        sgLogHandle();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v16, "localizedDescription");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v24 = v20;
          _os_log_error_impl(&dword_1C3607000, v17, OS_LOG_TYPE_ERROR, "Error getting file size from path: %@", buf, 0xCu);

        }
        v13->_size = 0;
      }

    }
    else
    {
      path = v13->_path;
      v13->_path = 0;

      v13->_isDownloadedLocally = 0;
      v13->_size = 0;
    }
  }

  return v13;
}

- (BOOL)isCalendarMimeType
{
  return -[NSString isEqualToString:](self->_type, "isEqualToString:", CFSTR("text/calendar"));
}

- (BOOL)isApplicationMimeType
{
  void *v2;
  char v3;

  -[SGMailAttachment mimeCategory](self, "mimeCategory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("application"));

  return v3;
}

- (BOOL)isWalletPassMimeType
{
  return -[NSString isEqualToString:](self->_type, "isEqualToString:", CFSTR("application/com.apple.pkpass"))
      || -[NSString isEqualToString:](self->_type, "isEqualToString:", CFSTR("application/vnd.apple.pkpass"));
}

- (BOOL)isMediaMimeType
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1C3BD4F6C](self, a2);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", CFSTR("image"), CFSTR("audio"), CFSTR("video"), 0);
  objc_autoreleasePoolPop(v3);
  -[SGMailAttachment mimeCategory](self, "mimeCategory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend(v4, "containsObject:", v5);

  return (char)v3;
}

- (BOOL)isWalletOrderMimeType
{
  return -[NSString isEqualToString:](self->_type, "isEqualToString:", CFSTR("application/com.apple.finance.order"))
      || -[NSString isEqualToString:](self->_type, "isEqualToString:", CFSTR("application/vnd.apple.finance.order"))
      || -[NSString isEqualToString:](self->_type, "isEqualToString:", CFSTR("com.apple.finance.order-data"))
      || -[NSString isEqualToString:](self->_type, "isEqualToString:", CFSTR("vnd.apple.finance.order-data"))
      || -[NSString containsString:](self->_type, "containsString:", CFSTR("octet-stream"));
}

- (BOOL)isOthersMimeType
{
  if (-[SGMailAttachment isApplicationMimeType](self, "isApplicationMimeType"))
    return 0;
  else
    return !-[SGMailAttachment isMediaMimeType](self, "isMediaMimeType");
}

- (id)mimeCategory
{
  void *v2;
  void *v3;

  -[NSString componentsSeparatedByString:](self->_type, "componentsSeparatedByString:", CFSTR("/"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)description
{
  id v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@ type:%@ path:%@>"), v5, self->_type, self->_path);

  return v6;
}

- (void)setSize:(unint64_t)a3
{
  self->_size = a3;
}

- (NSString)type
{
  return self->_type;
}

- (NSString)filename
{
  return self->_filename;
}

- (unint64_t)size
{
  return self->_size;
}

- (NSString)path
{
  return self->_path;
}

- (BOOL)isDownloadedLocally
{
  return self->_isDownloadedLocally;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_filename, 0);
  objc_storeStrong((id *)&self->_type, 0);
}

+ (id)attachmentWithType:(id)a3 filename:(id)a4 path:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithType:filename:path:", v10, v9, v8);

  return v11;
}

+ (id)attachmentsFromBiomeAttachments:(id)a3
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __52__SGMailAttachment_attachmentsFromBiomeAttachments___block_invoke;
  v4[3] = &__block_descriptor_40_e29__16__0__BMContentAttachment_8l;
  v4[4] = a1;
  objc_msgSend(a3, "_pas_mappedArrayWithTransform:", v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)attachmentsFromSearchableItem:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  NSObject *v22;
  id v24;
  void *v25;
  uint8_t buf[4];
  uint64_t v27;
  __int16 v28;
  uint64_t v29;
  __int16 v30;
  uint64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "attributeSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "attachmentTypes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  objc_msgSend(v4, "attachmentNames");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  objc_msgSend(v4, "attachmentPaths");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  if (v6 == v8 && v6 == v10)
  {
    v11 = objc_opt_new();
    v12 = (void *)v11;
    if (v6)
    {
      v13 = 0;
      v24 = a1;
      v25 = (void *)v11;
      do
      {
        objc_msgSend(v4, "attachmentTypes", v24);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "objectAtIndexedSubscript:", v13);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "attachmentNames");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "objectAtIndexedSubscript:", v13);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "attachmentPaths");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "objectAtIndexedSubscript:", v13);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "attachmentWithType:filename:path:", v15, v17, v19);
        v20 = v6;
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "addObject:", v21);

        v6 = v20;
        ++v13;
      }
      while (v20 != v13);
      v12 = v25;
    }
  }
  else
  {
    sgLogHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218496;
      v27 = v6;
      v28 = 2048;
      v29 = v8;
      v30 = 2048;
      v31 = v10;
      _os_log_error_impl(&dword_1C3607000, v22, OS_LOG_TYPE_ERROR, "Attachment info length mismatch: %lu types, %lu names, %lu paths", buf, 0x20u);
    }

    v12 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v12;
}

+ (id)testAttachmentWithType:(id)a3 size:(unint64_t)a4
{
  id v6;
  void *v7;

  v6 = a3;
  v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithType:filename:path:", v6, CFSTR("test"), CFSTR("testpath"));

  objc_msgSend(v7, "setSize:", a4);
  return v7;
}

id __52__SGMailAttachment_attachmentsFromBiomeAttachments___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "type");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "filename");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "path");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "attachmentWithType:filename:path:", v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

@end
