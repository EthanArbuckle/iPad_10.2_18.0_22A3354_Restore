@implementation QLThumbnailItem

- (UTType)contentType
{
  return self->_contentType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_temporaryURL, 0);
  objc_storeStrong((id *)&self->_parentDirectoryWrapper, 0);
  objc_storeStrong((id *)&self->_urlWrapper, 0);
  objc_storeStrong((id *)&self->_attachments, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_contentType, 0);
}

- (QLThumbnailItem)initWithURL:(id)a3
{
  id v4;
  void *v5;
  QLThumbnailItem *v6;

  v4 = a3;
  +[QLUTIAnalyzer contentTypeForURL:](QLUTIAnalyzer, "contentTypeForURL:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[QLThumbnailItem initWithURL:contentType:](self, "initWithURL:contentType:", v4, v5);

  return v6;
}

- (QLThumbnailItem)initWithURL:(id)a3 contentType:(id)a4
{
  id v6;
  id v7;
  void *v8;
  QLThumbnailItem *v9;

  v6 = a4;
  v7 = a3;
  objc_msgSend(getFPSandboxingURLWrapperClass(), "wrapperWithURL:readonly:error:", v7, 1, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[QLThumbnailItem initWithURLWrapper:parentDirectoryWrapper:contentType:](self, "initWithURLWrapper:parentDirectoryWrapper:contentType:", v8, 0, v6);
  return v9;
}

- (QLThumbnailItem)initWithURLWrapper:(id)a3 parentDirectoryWrapper:(id)a4 contentType:(id)a5
{
  FPSandboxingURLWrapper *v8;
  FPSandboxingURLWrapper *v9;
  UTType *v10;
  QLThumbnailItem *v11;
  UTType *contentType;
  UTType *v13;
  FPSandboxingURLWrapper *urlWrapper;
  FPSandboxingURLWrapper *v15;
  FPSandboxingURLWrapper *parentDirectoryWrapper;
  objc_super v18;

  v8 = (FPSandboxingURLWrapper *)a3;
  v9 = (FPSandboxingURLWrapper *)a4;
  v10 = (UTType *)a5;
  v18.receiver = self;
  v18.super_class = (Class)QLThumbnailItem;
  v11 = -[QLThumbnailItem init](&v18, sel_init);
  contentType = v11->_contentType;
  v11->_contentType = v10;
  v13 = v10;

  urlWrapper = v11->_urlWrapper;
  v11->_urlWrapper = v8;
  v15 = v8;

  parentDirectoryWrapper = v11->_parentDirectoryWrapper;
  v11->_parentDirectoryWrapper = v9;

  return v11;
}

- (QLThumbnailItem)initWithData:(id)a3 contentType:(id)a4
{
  NSData *v6;
  UTType *v7;
  QLThumbnailItem *v8;
  NSData *data;
  NSData *v10;
  UTType *contentType;
  objc_super v13;

  v6 = (NSData *)a3;
  v7 = (UTType *)a4;
  v13.receiver = self;
  v13.super_class = (Class)QLThumbnailItem;
  v8 = -[QLThumbnailItem init](&v13, sel_init);
  data = v8->_data;
  v8->_data = v6;
  v10 = v6;

  contentType = v8->_contentType;
  v8->_contentType = v7;

  return v8;
}

- (void)startAccessingIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  if (!-[QLThumbnailItem needStopAccessing](self, "needStopAccessing"))
  {
    -[QLThumbnailItem urlWrapper](self, "urlWrapper");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "url");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[QLThumbnailItem setNeedStopAccessing:](self, "setNeedStopAccessing:", objc_msgSend(v4, "startAccessingSecurityScopedResource"));

  }
  if (!-[QLThumbnailItem needStopAccessingParent](self, "needStopAccessingParent"))
  {
    -[QLThumbnailItem parentDirectoryWrapper](self, "parentDirectoryWrapper");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "url");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[QLThumbnailItem setNeedStopAccessingParent:](self, "setNeedStopAccessingParent:", objc_msgSend(v5, "startAccessingSecurityScopedResource"));

  }
}

- (void)cleanup
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  if (-[QLThumbnailItem needStopAccessing](self, "needStopAccessing"))
  {
    -[QLThumbnailItem urlWrapper](self, "urlWrapper");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "url");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stopAccessingSecurityScopedResource");

    -[QLThumbnailItem setNeedStopAccessing:](self, "setNeedStopAccessing:", 0);
  }
  if (-[QLThumbnailItem needStopAccessingParent](self, "needStopAccessingParent"))
  {
    -[QLThumbnailItem parentDirectoryWrapper](self, "parentDirectoryWrapper");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "url");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stopAccessingSecurityScopedResource");

    -[QLThumbnailItem setNeedStopAccessingParent:](self, "setNeedStopAccessingParent:", 0);
  }
  -[QLThumbnailItem temporaryURL](self, "temporaryURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[QLThumbnailItem temporaryURL](self, "temporaryURL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeItemAtURL:error:", v9, 0);

    -[QLThumbnailItem setTemporaryURL:](self, "setTemporaryURL:", 0);
  }
}

- (id)fileURL
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  -[QLThumbnailItem temporaryURL](self, "temporaryURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    -[QLThumbnailItem urlWrapper](self, "urlWrapper");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[QLThumbnailItem urlWrapper](self, "urlWrapper");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "url");
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      return v4;
    }
    -[QLThumbnailItem data](self, "data");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
      v4 = 0;
      return v4;
    }
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "temporaryDirectory");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "UUIDString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[QLThumbnailItem contentType](self, "contentType");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "URLByAppendingPathComponent:conformingToType:", v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[QLThumbnailItem setTemporaryURL:](self, "setTemporaryURL:", v14);

    -[QLThumbnailItem data](self, "data");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[QLThumbnailItem temporaryURL](self, "temporaryURL");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "writeToURL:atomically:", v16, 1);

    -[QLThumbnailItem temporaryURL](self, "temporaryURL");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("Writing temporary file to %@"), v17);

  }
  -[QLThumbnailItem temporaryURL](self, "temporaryURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  return v4;
}

- (id)fileData
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[QLThumbnailItem data](self, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[QLThumbnailItem data](self, "data");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[QLThumbnailItem urlWrapper](self, "urlWrapper");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      v6 = (void *)MEMORY[0x1E0C99D50];
      -[QLThumbnailItem urlWrapper](self, "urlWrapper");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "url");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "dataWithContentsOfURL:options:error:", v8, 1, 0);
      v4 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v4 = 0;
    }
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSData *data;
  id v5;

  data = self->_data;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", data, CFSTR("d"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_urlWrapper, CFSTR("u"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_parentDirectoryWrapper, CFSTR("p"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_contentType, CFSTR("c"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_attachments, CFSTR("a"));

}

- (QLThumbnailItem)initWithCoder:(id)a3
{
  id v3;
  QLThumbnailItem *v4;
  uint64_t v5;
  NSData *data;
  uint64_t v7;
  FPSandboxingURLWrapper *urlWrapper;
  uint64_t v9;
  FPSandboxingURLWrapper *parentDirectoryWrapper;
  uint64_t v11;
  UTType *contentType;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  NSDictionary *attachments;
  objc_super v22;
  uint64_t v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v22.receiver = self;
  v22.super_class = (Class)QLThumbnailItem;
  v3 = a3;
  v4 = -[QLThumbnailItem init](&v22, sel_init);
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("d"));
  v5 = objc_claimAutoreleasedReturnValue();
  data = v4->_data;
  v4->_data = (NSData *)v5;

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", getFPSandboxingURLWrapperClass(), CFSTR("u"));
  v7 = objc_claimAutoreleasedReturnValue();
  urlWrapper = v4->_urlWrapper;
  v4->_urlWrapper = (FPSandboxingURLWrapper *)v7;

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", getFPSandboxingURLWrapperClass(), CFSTR("p"));
  v9 = objc_claimAutoreleasedReturnValue();
  parentDirectoryWrapper = v4->_parentDirectoryWrapper;
  v4->_parentDirectoryWrapper = (FPSandboxingURLWrapper *)v9;

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("c"));
  v11 = objc_claimAutoreleasedReturnValue();
  contentType = v4->_contentType;
  v4->_contentType = (UTType *)v11;

  v13 = (void *)MEMORY[0x1E0C99E60];
  v24[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setWithArray:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)MEMORY[0x1E0C99E60];
  v23 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v23, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setWithArray:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeDictionaryWithKeysOfClasses:objectsOfClasses:forKey:", v15, v18, CFSTR("a"));
  v19 = objc_claimAutoreleasedReturnValue();

  attachments = v4->_attachments;
  v4->_attachments = (NSDictionary *)v19;

  return v4;
}

- (void)setContentType:(id)a3
{
  objc_storeStrong((id *)&self->_contentType, a3);
}

- (NSData)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
  objc_storeStrong((id *)&self->_data, a3);
}

- (NSDictionary)attachments
{
  return (NSDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (void)setAttachments:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 32);
}

- (FPSandboxingURLWrapper)urlWrapper
{
  return self->_urlWrapper;
}

- (void)setUrlWrapper:(id)a3
{
  objc_storeStrong((id *)&self->_urlWrapper, a3);
}

- (FPSandboxingURLWrapper)parentDirectoryWrapper
{
  return self->_parentDirectoryWrapper;
}

- (void)setParentDirectoryWrapper:(id)a3
{
  objc_storeStrong((id *)&self->_parentDirectoryWrapper, a3);
}

- (NSURL)temporaryURL
{
  return self->_temporaryURL;
}

- (void)setTemporaryURL:(id)a3
{
  objc_storeStrong((id *)&self->_temporaryURL, a3);
}

- (BOOL)needStopAccessing
{
  return self->_needStopAccessing;
}

- (void)setNeedStopAccessing:(BOOL)a3
{
  self->_needStopAccessing = a3;
}

- (BOOL)needStopAccessingParent
{
  return self->_needStopAccessingParent;
}

- (void)setNeedStopAccessingParent:(BOOL)a3
{
  self->_needStopAccessingParent = a3;
}

@end
