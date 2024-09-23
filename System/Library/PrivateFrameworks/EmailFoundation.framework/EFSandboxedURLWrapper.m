@implementation EFSandboxedURLWrapper

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  _BOOL4 v10;
  id v11;
  uint64_t v12;
  uint64_t *v13;
  id v14;
  BOOL v15;
  id v16;
  uint64_t v17;
  void *v18;
  void *v19;
  int v20;
  int *v21;
  char *v22;
  NSObject *v23;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  _OWORD v27[2];
  __int128 v28;
  __int128 v29;
  uint8_t buf[40];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[EFSandboxedURLWrapper url](self, "url");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("EFPropertyKey_url"));

  objc_msgSend(v4, "encodeBool:forKey:", -[EFSandboxedURLWrapper isReadOnly](self, "isReadOnly"), CFSTR("EFPropertyKey_readOnly"));
  v28 = 0u;
  v29 = 0u;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "connection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
      objc_msgSend(v6, "auditToken");
    else
      memset(buf, 0, 32);
    v28 = *(_OWORD *)buf;
    v29 = *(_OWORD *)&buf[16];

  }
  -[EFSandboxedURLWrapper url](self, "url");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "startAccessingSecurityScopedResource");
  v10 = -[EFSandboxedURLWrapper isReadOnly](self, "isReadOnly");
  v11 = v8;
  if (v11
    && (getpid(),
        v24 = objc_msgSend(objc_retainAutorelease(v11), "fileSystemRepresentation"),
        !sandbox_check()))
  {
    v13 = (uint64_t *)MEMORY[0x1E0C80000];
    if (!v10)
      v13 = (uint64_t *)MEMORY[0x1E0C80008];
    v12 = *v13;
  }
  else
  {
    v12 = 0;
  }

  v25 = v28;
  v26 = v29;
  v14 = v11;
  if (!v12)
  {
LABEL_24:

    v19 = 0;
    if (!v9)
      goto LABEL_26;
LABEL_25:
    objc_msgSend(v14, "stopAccessingSecurityScopedResource", v24);
    goto LABEL_26;
  }
  memset(v27, 0, sizeof(v27));
  v15 = bcmp(&v25, v27, 0x20uLL) == 0;
  v16 = objc_retainAutorelease(v14);
  objc_msgSend(v16, "fileSystemRepresentation");
  if (v15)
  {
    v17 = sandbox_extension_issue_file();
  }
  else
  {
    *(_OWORD *)buf = v25;
    *(_OWORD *)&buf[16] = v26;
    v17 = sandbox_extension_issue_file_to_process();
  }
  v18 = (void *)v17;
  if (!v17)
  {
    v20 = *__error();
    v21 = __error();
    v22 = strerror(*v21);
    +[EFSandboxedURLWrapper log](EFSandboxedURLWrapper, "log");
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      *(_QWORD *)&buf[4] = v12;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v16;
      *(_WORD *)&buf[22] = 1024;
      *(_DWORD *)&buf[24] = v20;
      *(_WORD *)&buf[28] = 2082;
      *(_QWORD *)&buf[30] = v22;
      _os_log_error_impl(&dword_1B106E000, v23, OS_LOG_TYPE_ERROR, "unable to issue sandbox extension %{public}s for URL %@: (%d) %{public}s", buf, 0x26u);
    }

    goto LABEL_24;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  free(v18);

  if (v19)
    objc_msgSend(v4, "encodeObject:forKey:", v19, CFSTR("kEFSandboxExtensionToken"));
  if (v9)
    goto LABEL_25;
LABEL_26:

}

- (NSURL)url
{
  return (NSURL *)objc_getProperty(self, a2, 16, 1);
}

- (BOOL)isReadOnly
{
  return self->_readOnly;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sandboxToken, 0);
  objc_storeStrong((id *)&self->_invocable, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

- (EFSandboxedURLWrapper)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  EFSandboxedURLWrapper *v6;
  uint64_t v7;
  NSString *sandboxToken;
  NSString *v9;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EFPropertyKey_url"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[EFSandboxedURLWrapper initWithFileURL:readOnly:](self, "initWithFileURL:readOnly:", v5, objc_msgSend(v4, "decodeBoolForKey:", CFSTR("EFPropertyKey_readOnly")));
  if (v6)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kEFSandboxExtensionToken"));
    v7 = objc_claimAutoreleasedReturnValue();
    sandboxToken = v6->_sandboxToken;
    v6->_sandboxToken = (NSString *)v7;

    v9 = v6->_sandboxToken;
    if (v9)
      MEMORY[0x1B5E155D4](v6->_url, -[NSString dataUsingEncoding:](v9, "dataUsingEncoding:", 4));
  }

  return v6;
}

- (EFSandboxedURLWrapper)initWithFileURL:(id)a3 readOnly:(BOOL)a4
{
  id v6;
  EFSandboxedURLWrapper *v7;
  EFDeallocInvocationToken *v8;
  EFDeallocInvocationToken *invocable;
  uint64_t v10;
  NSURL *url;
  EFSandboxedURLWrapper *v12;
  objc_super v14;

  v6 = a3;
  if ((objc_msgSend(v6, "isFileURL") & 1) != 0)
  {
    v14.receiver = self;
    v14.super_class = (Class)EFSandboxedURLWrapper;
    v7 = -[EFSandboxedURLWrapper init](&v14, sel_init);
    if (v7)
    {
      v8 = objc_alloc_init(EFDeallocInvocationToken);
      invocable = v7->_invocable;
      v7->_invocable = v8;

      v10 = objc_msgSend(v6, "copy");
      url = v7->_url;
      v7->_url = (NSURL *)v10;

      v7->_readOnly = a4;
      objc_setAssociatedObject(v7->_url, v7, v7->_invocable, (void *)0x301);
    }
    self = v7;
    v12 = self;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

+ (OS_os_log)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __28__EFSandboxedURLWrapper_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_5 != -1)
    dispatch_once(&log_onceToken_5, block);
  return (OS_os_log *)(id)log_log_5;
}

void __28__EFSandboxedURLWrapper_log__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)log_log_5;
  log_log_5 = (uint64_t)v1;

}

- (NSString)debugDescription
{
  void *v3;
  uint64_t v4;
  void *v5;
  _BOOL4 v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[EFSandboxedURLWrapper url](self, "url");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[EFSandboxedURLWrapper isReadOnly](self, "isReadOnly");
  -[EFSandboxedURLWrapper sandboxToken](self, "sandboxToken");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p> url=%@, readOnly=%d, token=%@, invocable=%@"), v4, self, v5, v6, v7, self->_invocable);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (NSString)ef_publicDescription
{
  void *v3;
  int v4;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  objc_super v10;

  +[EFDevice currentDevice](EFDevice, "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isInternal");

  if (v4)
  {
    -[EFSandboxedURLWrapper debugDescription](self, "debugDescription");
    return (NSString *)(id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)EFSandboxedURLWrapper;
    -[EFSandboxedURLWrapper description](&v10, sel_description);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[EFSandboxedURLWrapper sandboxToken](self, "sandboxToken");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = CFSTR("YES");
    if (!v7)
      v8 = CFSTR("NO");
    objc_msgSend(v6, "stringByAppendingFormat:", CFSTR(" has-token=%@"), v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    return (NSString *)v9;
  }
}

- (void)addInvalidationHandler:(id)a3
{
  -[EFInvocationToken addInvocationBlock:](self->_invocable, "addInvocationBlock:", a3);
}

- (EFDeallocInvocationToken)invocable
{
  return self->_invocable;
}

- (NSString)sandboxToken
{
  return self->_sandboxToken;
}

@end
