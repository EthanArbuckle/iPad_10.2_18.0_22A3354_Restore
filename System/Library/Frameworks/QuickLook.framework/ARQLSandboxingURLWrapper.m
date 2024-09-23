@implementation ARQLSandboxingURLWrapper

+ (id)wrapperWithURL:(id)a3 readonly:(BOOL)a4 error:(id *)a5
{
  _QWORD *v5;

  v5 = (_QWORD *)MEMORY[0x24BDAC000];
  if (!a4)
    v5 = (_QWORD *)MEMORY[0x24BDAC008];
  return (id)objc_msgSend(a1, "wrapperWithURL:extensionClass:error:", a3, *v5, a5);
}

+ (id)wrapperWithURL:(id)a3 extensionClass:(const char *)a4 error:(id *)a5
{
  return (id)objc_msgSend(a1, "wrapperWithURL:extensionClass:report:error:", a3, a4, 1, a5);
}

+ (id)wrapperWithURL:(id)a3 extensionClass:(const char *)a4 report:(BOOL)a5 error:(id *)a6
{
  _BOOL8 v7;
  id v10;
  void *v11;

  v7 = a5;
  v10 = a3;
  v11 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithURL:extensionClass:report:error:", v10, a4, v7, a6);

  return v11;
}

- (ARQLSandboxingURLWrapper)initWithURL:(id)a3 extensionClass:(const char *)a4 report:(BOOL)a5 error:(id *)a6
{
  _BOOL8 v7;
  id v11;
  ARQLSandboxingURLWrapper *v12;
  ARQLSandboxingURLWrapper *v13;
  void *v14;
  int v15;
  int v16;
  uint64_t v17;
  id v18;
  NSData *scope;
  uint64_t v20;
  id v21;
  NSData *promiseScope;
  ARQLSandboxingURLWrapper *v23;
  id v25;
  id v26;
  objc_super v27;

  v7 = a5;
  v11 = a3;
  v27.receiver = self;
  v27.super_class = (Class)ARQLSandboxingURLWrapper;
  v12 = -[ARQLSandboxingURLWrapper init](&v27, sel_init);
  v13 = v12;
  if (!v12)
  {
    v18 = 0;
LABEL_14:
    v23 = v13;
    goto LABEL_19;
  }
  objc_storeStrong((id *)&v12->_url, a3);
  v14 = (void *)_CFURLPromiseCopyPhysicalURL();
  if ((objc_msgSend(v11, "isEqual:", v14) & 1) == 0)
    objc_storeStrong((id *)&v13->_promiseURL, v14);
  v15 = objc_msgSend(v11, "startAccessingSecurityScopedResource");
  v16 = objc_msgSend(v14, "startAccessingSecurityScopedResource");
  v26 = 0;
  -[ARQLSandboxingURLWrapper issueSandboxExtensionForURL:extensionClass:report:error:](v13, "issueSandboxExtensionForURL:extensionClass:report:error:", v11, a4, v7, &v26);
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = v26;
  scope = v13->_scope;
  v13->_scope = (NSData *)v17;

  if (v13->_scope)
  {
    if (!v14)
    {
LABEL_8:
      if (v15)
        objc_msgSend(v11, "stopAccessingSecurityScopedResource");
      if (v16)
        objc_msgSend(v14, "stopAccessingSecurityScopedResource");

      goto LABEL_14;
    }
    v25 = v18;
    -[ARQLSandboxingURLWrapper issueSandboxExtensionForURL:extensionClass:report:error:](v13, "issueSandboxExtensionForURL:extensionClass:report:error:", v14, a4, v7, &v25);
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = v25;

    promiseScope = v13->_promiseScope;
    v13->_promiseScope = (NSData *)v20;

    if (v13->_promiseScope)
    {
      v18 = v21;
      goto LABEL_8;
    }
    v18 = v21;
  }
  if (a6)
  {
    v18 = objc_retainAutorelease(v18);
    *a6 = v18;
  }

  v23 = 0;
LABEL_19:

  return v23;
}

- (id)issueSandboxExtensionForURL:(id)a3 extensionClass:(const char *)a4 report:(BOOL)a5 error:(id *)a6
{
  id v7;
  void *v8;
  int v9;
  uint64_t v10;
  id v11;
  const char *v12;
  void *v13;

  v7 = a3;
  objc_msgSend(v7, "path");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "hasDirectoryPath");

  if (v9)
  {
    objc_msgSend(v8, "stringByAppendingString:", CFSTR("/"));
    v10 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v10;
  }
  v11 = objc_retainAutorelease(v8);
  objc_msgSend(v11, "fileSystemRepresentation");
  v12 = (const char *)sandbox_extension_issue_file();
  if (v12)
  {
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytesNoCopy:length:freeWhenDone:", v12, strlen(v12) + 1, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (a6)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.AssetViewer.ARQLSandboxingURLWrapper"), 1, 0);
    v13 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSURL *promiseURL;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", self->_url, CFSTR("NSURL"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_scope, CFSTR("NSURLScope"));
  promiseURL = self->_promiseURL;
  if (promiseURL)
  {
    objc_msgSend(v5, "encodeObject:forKey:", promiseURL, CFSTR("NSPromise"));
    objc_msgSend(v5, "encodeObject:forKey:", self->_promiseScope, CFSTR("NSPromiseScope"));
  }

}

+ (void)assembleURL:(id)a3 sandbox:(id)a4 physicalURL:(id)a5 physicalSandbox:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;

  v12 = a3;
  v9 = a4;
  v10 = a5;
  v11 = a6;
  if (v12)
  {
    if (v9)
      MEMORY[0x212BA3DE8](v12, v9);
    if (v10 && v11)
      MEMORY[0x212BA3DE8](v10, v11);
    _CFURLPromiseSetPhysicalURL();
  }

}

- (ARQLSandboxingURLWrapper)initWithCoder:(id)a3
{
  id v4;
  ARQLSandboxingURLWrapper *v5;
  NSURL *v6;
  NSURL *v7;
  NSData *v8;
  uint64_t v9;
  NSURL *url;
  NSURL *v11;
  NSData *scope;
  NSData *v13;
  NSURL *promiseURL;
  NSURL *v15;
  NSData *promiseScope;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)ARQLSandboxingURLWrapper;
  v5 = -[ARQLSandboxingURLWrapper init](&v18, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("NSURL"));
    v6 = (NSURL *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("NSPromise"));
    v7 = (NSURL *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("NSURLScope"));
    v8 = (NSData *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("NSPromiseScope"));
    v9 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "assembleURL:sandbox:physicalURL:physicalSandbox:", v6, v8, v7, v9);
    url = v5->_url;
    v5->_url = v6;
    v11 = v6;

    scope = v5->_scope;
    v5->_scope = v8;
    v13 = v8;

    promiseURL = v5->_promiseURL;
    v5->_promiseURL = v7;
    v15 = v7;

    promiseScope = v5->_promiseScope;
    v5->_promiseScope = (NSData *)v9;

  }
  return v5;
}

- (NSURL)url
{
  return self->_url;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_promiseScope, 0);
  objc_storeStrong((id *)&self->_scope, 0);
  objc_storeStrong((id *)&self->_promiseURL, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

@end
