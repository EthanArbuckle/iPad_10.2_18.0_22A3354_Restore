@implementation QLURLHandler

- (QLURLHandler)initWithURL:(id)a3 sandboxType:(const char *)a4
{
  id v6;
  QLURLHandler *v7;
  QLURLHandler *v8;
  QLURLHandler *v9;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)QLURLHandler;
  v7 = -[QLURLHandler init](&v11, sel_init);
  v8 = v7;
  if (v7)
  {
    -[QLURLHandler setFileURL:](v7, "setFileURL:", v6);
    v8->_sandboxType = a4;
    v8->_isAccessingSecurityScope = objc_msgSend(v6, "startAccessingSecurityScopedResource");
    v9 = v8;
  }

  return v8;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  if (self->_fileExtensionHandle)
    -[QLURLHandler sandboxExtensionRelease:](self, "sandboxExtensionRelease:");
  if (self->_isAccessingSecurityScope)
  {
    -[QLURLHandler fileURL](self, "fileURL");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stopAccessingSecurityScopedResource");

  }
  if (self->_physicalFileExtensionHandle)
    -[QLURLHandler sandboxExtensionRelease:](self, "sandboxExtensionRelease:");
  if (self->_externalResourcesHandle)
    -[QLURLHandler sandboxExtensionRelease:](self, "sandboxExtensionRelease:");
  v4.receiver = self;
  v4.super_class = (Class)QLURLHandler;
  -[QLURLHandler dealloc](&v4, sel_dealloc);
}

- (void)_issueFileExtension
{
  void *v3;
  void *v4;
  NSString *v5;
  NSString *fileExtensionToken;
  void *v7;
  NSString *v8;
  NSString *physicalFileExtensionToken;
  void *v10;
  id v11;

  -[QLURLHandler fileURL](self, "fileURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[QLURLHandler fileURL](self, "fileURL");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[QLURLHandler _issueFileExtensionForURL:](self, "_issueFileExtensionForURL:", v4);
    v5 = (NSString *)objc_claimAutoreleasedReturnValue();
    fileExtensionToken = self->_fileExtensionToken;
    self->_fileExtensionToken = v5;

    -[QLURLHandler fileURL](self, "fileURL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (id)_CFURLPromiseCopyPhysicalURL();

    if (v11)
    {
      -[QLURLHandler _issueFileExtensionForURL:](self, "_issueFileExtensionForURL:", v11);
      v8 = (NSString *)objc_claimAutoreleasedReturnValue();
      physicalFileExtensionToken = self->_physicalFileExtensionToken;
      self->_physicalFileExtensionToken = v8;

    }
    if (-[QLURLHandler needsAccessToExternalResources](self, "needsAccessToExternalResources"))
    {
      -[QLURLHandler fileURL](self, "fileURL");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[QLURLHandler _issueExternalResourcesExtensionForURL:](self, "_issueExternalResourcesExtensionForURL:", v10);

    }
  }
}

- (void)_issueExternalResourcesExtensionForURL:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSString *v15;
  NSString *externalResourcesToken;
  id v17;
  id v18;

  v4 = a3;
  if (-[QLURLHandler needsAccessToExternalResources](self, "needsAccessToExternalResources")
    && objc_msgSend(v4, "isFileURL"))
  {
    v18 = 0;
    v5 = *MEMORY[0x1E0C99AA0];
    v17 = 0;
    objc_msgSend(v4, "getResourceValue:forKey:error:", &v18, v5, &v17);
    v6 = v18;
    v7 = v17;
    if (v7)
    {
      _log_0();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        -[QLURLHandler _issueExternalResourcesExtensionForURL:].cold.1((uint64_t)v4, v8, v9, v10, v11, v12, v13, v14);

      v15 = 0;
    }
    else
    {
      -[QLURLHandler _issueFileExtensionForURL:](self, "_issueFileExtensionForURL:", v6);
      v15 = (NSString *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    v15 = 0;
  }
  externalResourcesToken = self->_externalResourcesToken;
  self->_externalResourcesToken = v15;

}

- (void)_consumeFileExtension
{
  NSString *fileExtensionToken;
  int64_t v4;
  NSString *v5;
  NSString *physicalFileExtensionToken;
  int64_t v7;
  NSString *v8;
  NSString *externalResourcesToken;

  fileExtensionToken = self->_fileExtensionToken;
  if (fileExtensionToken)
  {
    v4 = -[QLURLHandler sandboxExtensionConsume:](self, "sandboxExtensionConsume:", -[NSString UTF8String](fileExtensionToken, "UTF8String"));
    v5 = self->_fileExtensionToken;
    self->_fileExtensionToken = 0;
    self->_fileExtensionHandle = v4;

  }
  physicalFileExtensionToken = self->_physicalFileExtensionToken;
  if (physicalFileExtensionToken)
  {
    v7 = -[QLURLHandler sandboxExtensionConsume:](self, "sandboxExtensionConsume:", -[NSString UTF8String](physicalFileExtensionToken, "UTF8String"));
    v8 = self->_physicalFileExtensionToken;
    self->_physicalFileExtensionToken = 0;
    self->_physicalFileExtensionHandle = v7;

  }
  externalResourcesToken = self->_externalResourcesToken;
  if (externalResourcesToken)
  {
    -[QLURLHandler setExternalResourcesHandle:](self, "setExternalResourcesHandle:", -[QLURLHandler sandboxExtensionConsume:](self, "sandboxExtensionConsume:", -[NSString UTF8String](externalResourcesToken, "UTF8String")));
    -[QLURLHandler setExternalResourcesToken:](self, "setExternalResourcesToken:", 0);
  }
}

- (id)_issueFileExtensionForURL:(id)a3
{
  id v4;
  void *v5;
  id v6;
  char *v7;
  char *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v4 = a3;
  v5 = v4;
  if (!v4)
  {
    _log_0();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[QLURLHandler _issueFileExtensionForURL:].cold.1(v10);

    goto LABEL_10;
  }
  v6 = objc_retainAutorelease(v4);
  v7 = -[QLURLHandler sandboxExtensionIssueFileWithClass:path:flags:](self, "sandboxExtensionIssueFileWithClass:path:flags:", self->_sandboxType, objc_msgSend(v6, "fileSystemRepresentation"), 0);
  if (!v7)
  {
    _log_0();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[QLURLHandler _issueFileExtensionForURL:].cold.2((uint64_t)v6, v11, v12, v13, v14, v15, v16, v17);

LABEL_10:
    v9 = 0;
    goto LABEL_11;
  }
  v8 = v7;
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithCString:encoding:", v7, 4);
  free(v8);
LABEL_11:

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  NSString *fileExtensionToken;
  NSString *physicalFileExtensionToken;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  -[QLURLHandler _issueFileExtension](self, "_issueFileExtension");
  -[QLURLHandler fileURL](self, "fileURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "encodeObject:forKey:", v4, CFSTR("url"));

  -[QLURLHandler fileURL](self, "fileURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)_CFURLPromiseCopyPhysicalURL();

  if (v6)
    objc_msgSend(v11, "encodeObject:forKey:", v6, CFSTR("promiseSetPhysicalURL"));
  fileExtensionToken = self->_fileExtensionToken;
  if (fileExtensionToken)
    objc_msgSend(v11, "encodeObject:forKey:", fileExtensionToken, CFSTR("fileExtensionToken"));
  physicalFileExtensionToken = self->_physicalFileExtensionToken;
  if (physicalFileExtensionToken)
    objc_msgSend(v11, "encodeObject:forKey:", physicalFileExtensionToken, CFSTR("physicalFileExtensionToken"));
  -[QLURLHandler externalResourcesToken](self, "externalResourcesToken");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[QLURLHandler externalResourcesToken](self, "externalResourcesToken");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "encodeObject:forKey:", v10, CFSTR("externalResourcesToken"));

  }
}

- (QLURLHandler)initWithCoder:(id)a3
{
  id v4;
  QLURLHandler *v5;
  uint64_t v6;
  NSURL *fileURL;
  void *v8;
  uint64_t v9;
  NSString *fileExtensionToken;
  uint64_t v11;
  NSString *physicalFileExtensionToken;
  uint64_t v13;
  NSString *externalResourcesToken;
  QLURLHandler *v15;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)QLURLHandler;
  v5 = -[QLURLHandler init](&v17, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("url"));
    v6 = objc_claimAutoreleasedReturnValue();
    fileURL = v5->_fileURL;
    v5->_fileURL = (NSURL *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("promiseSetPhysicalURL"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
      _CFURLPromiseSetPhysicalURL();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("fileExtensionToken"));
    v9 = objc_claimAutoreleasedReturnValue();
    fileExtensionToken = v5->_fileExtensionToken;
    v5->_fileExtensionToken = (NSString *)v9;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("physicalFileExtensionToken"));
    v11 = objc_claimAutoreleasedReturnValue();
    physicalFileExtensionToken = v5->_physicalFileExtensionToken;
    v5->_physicalFileExtensionToken = (NSString *)v11;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("externalResourcesToken"));
    v13 = objc_claimAutoreleasedReturnValue();
    externalResourcesToken = v5->_externalResourcesToken;
    v5->_externalResourcesToken = (NSString *)v13;

    -[QLURLHandler _consumeFileExtension](v5, "_consumeFileExtension");
    v15 = v5;

  }
  return v5;
}

- (void)sandboxExtensionRelease:(int64_t)a3
{
  sandbox_extension_release();
}

- (int64_t)sandboxExtensionConsume:(const char *)a3
{
  return sandbox_extension_consume();
}

- (char)sandboxExtensionIssueFileWithClass:(const char *)a3 path:(const char *)a4 flags:(unsigned int)a5
{
  return (char *)sandbox_extension_issue_file();
}

- (int64_t)fileExtensionHandle
{
  return self->_fileExtensionHandle;
}

- (void)setFileExtensionHandle:(int64_t)a3
{
  self->_fileExtensionHandle = a3;
}

- (int64_t)physicalFileExtensionHandle
{
  return self->_physicalFileExtensionHandle;
}

- (void)setPhysicalFileExtensionHandle:(int64_t)a3
{
  self->_physicalFileExtensionHandle = a3;
}

- (NSString)fileExtensionToken
{
  return self->_fileExtensionToken;
}

- (void)setFileExtensionToken:(id)a3
{
  objc_storeStrong((id *)&self->_fileExtensionToken, a3);
}

- (NSString)physicalFileExtensionToken
{
  return self->_physicalFileExtensionToken;
}

- (void)setPhysicalFileExtensionToken:(id)a3
{
  objc_storeStrong((id *)&self->_physicalFileExtensionToken, a3);
}

- (NSURL)fileURL
{
  return (NSURL *)objc_getProperty(self, a2, 72, 1);
}

- (void)setFileURL:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (NSString)externalResourcesToken
{
  return self->_externalResourcesToken;
}

- (void)setExternalResourcesToken:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (int64_t)externalResourcesHandle
{
  return self->_externalResourcesHandle;
}

- (void)setExternalResourcesHandle:(int64_t)a3
{
  self->_externalResourcesHandle = a3;
}

- (BOOL)needsAccessToExternalResources
{
  return self->_needsAccessToExternalResources;
}

- (void)setNeedsAccessToExternalResources:(BOOL)a3
{
  self->_needsAccessToExternalResources = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileURL, 0);
  objc_storeStrong((id *)&self->_externalResourcesToken, 0);
  objc_storeStrong((id *)&self->_physicalFileExtensionToken, 0);
  objc_storeStrong((id *)&self->_fileExtensionToken, 0);
}

- (void)_issueExternalResourcesExtensionForURL:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1AE3F5000, a2, a3, "Couldn't obtain directory for additional resources for %@", a5, a6, a7, a8, 2u);
}

- (void)_issueFileExtensionForURL:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1AE3F5000, log, OS_LOG_TYPE_ERROR, "Can't issue a file extension token for a nil path.", v1, 2u);
}

- (void)_issueFileExtensionForURL:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1AE3F5000, a2, a3, "Couldn't issue file extension for url: %@", a5, a6, a7, a8, 2u);
}

@end
