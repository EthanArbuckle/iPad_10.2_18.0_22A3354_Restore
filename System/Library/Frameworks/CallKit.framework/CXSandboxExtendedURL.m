@implementation CXSandboxExtendedURL

- (CXSandboxExtendedURL)initWithURL:(id)a3
{
  id v5;
  CXSandboxExtendedURL *v6;
  CXSandboxExtendedURL *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CXSandboxExtendedURL;
  v6 = -[CXSandboxExtendedURL init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_URL, a3);

  return v7;
}

- (CXSandboxExtendedURL)init
{

  return 0;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  NSURL *URL;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  URL = self->_URL;
  -[CXSandboxExtendedURL sandboxExtensionToken](self, "sandboxExtensionToken");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p URL=%@ sandboxExtensionToken=%@ sandboxExtensionHandle=%lld>"), v4, self, URL, v6, -[CXSandboxExtendedURL sandboxExtensionHandle](self, "sandboxExtensionHandle"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSURL)URL
{
  uint64_t v3;
  void *v4;
  int64_t v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;
  NSURL *URL;
  int v12;
  NSURL *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  -[CXSandboxExtendedURL sandboxExtensionToken](self, "sandboxExtensionToken");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    v5 = -[CXSandboxExtendedURL sandboxExtensionHandle](self, "sandboxExtensionHandle");

    if (!v5)
    {
      -[CXSandboxExtendedURL sandboxExtensionToken](self, "sandboxExtensionToken");
      v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      objc_msgSend(v6, "UTF8String");
      -[CXSandboxExtendedURL setSandboxExtensionHandle:](self, "setSandboxExtensionHandle:", sandbox_extension_consume());

      v7 = -[CXSandboxExtendedURL sandboxExtensionHandle](self, "sandboxExtensionHandle");
      CXDefaultLog();
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = v8;
      if (v7 < 1)
      {
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
          -[CXSandboxExtendedURL URL].cold.1(self, v9);
      }
      else if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        URL = self->_URL;
        v12 = 138412290;
        v13 = URL;
        _os_log_impl(&dword_1A402D000, v9, OS_LOG_TYPE_DEFAULT, "Successfully consumed sandbox extension for URL %@", (uint8_t *)&v12, 0xCu);
      }

      -[CXSandboxExtendedURL setSandboxExtensionToken:](self, "setSandboxExtensionToken:", 0);
    }
  }
  return self->_URL;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0
    && -[CXSandboxExtendedURL isEqualToSandboxExtendedURL:](self, "isEqualToSandboxExtendedURL:", v4);

  return v5;
}

- (BOOL)isEqualToSandboxExtendedURL:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  int64_t v9;
  BOOL v10;

  v4 = a3;
  -[CXSandboxExtendedURL URL](self, "URL");
  v5 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "URL");
  v6 = objc_claimAutoreleasedReturnValue();
  if (v5 | v6 && !objc_msgSend((id)v5, "isEqual:", v6))
  {
    v10 = 0;
    goto LABEL_10;
  }
  -[CXSandboxExtendedURL sandboxExtensionToken](self, "sandboxExtensionToken");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sandboxExtensionToken");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    if (!v7)
      goto LABEL_5;
LABEL_7:
    v10 = 0;
    goto LABEL_8;
  }
  if ((objc_msgSend(v7, "isEqualToString:", v8) & 1) == 0)
    goto LABEL_7;
LABEL_5:
  v9 = -[CXSandboxExtendedURL sandboxExtensionHandle](self, "sandboxExtensionHandle");
  v10 = v9 == objc_msgSend(v4, "sandboxExtensionHandle");
LABEL_8:

LABEL_10:
  return v10;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;

  -[CXSandboxExtendedURL URL](self, "URL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[CXSandboxExtendedURL sandboxExtensionToken](self, "sandboxExtensionToken");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  v7 = v6 ^ -[CXSandboxExtendedURL sandboxExtensionHandle](self, "sandboxExtensionHandle");

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  -[CXSandboxExtendedURL URL](self, "URL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithURL:", v5);

  -[CXSandboxExtendedURL sandboxExtensionToken](self, "sandboxExtensionToken");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setSandboxExtensionToken:", v7);

  objc_msgSend(v6, "setSandboxExtensionHandle:", -[CXSandboxExtendedURL sandboxExtensionHandle](self, "sandboxExtensionHandle"));
  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CXSandboxExtendedURL)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  CXSandboxExtendedURL *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSString *sandboxExtensionToken;

  v4 = a3;
  v5 = objc_opt_class();
  NSStringFromSelector("URL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[CXSandboxExtendedURL initWithURL:](self, "initWithURL:", v7);

  if (v8)
  {
    v9 = objc_opt_class();
    NSStringFromSelector(sel_sandboxExtensionToken);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v9, v10);
    v11 = objc_claimAutoreleasedReturnValue();
    sandboxExtensionToken = v8->_sandboxExtensionToken;
    v8->_sandboxExtensionToken = (NSString *)v11;

  }
  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;

  v4 = a3;
  -[CXSandboxExtendedURL URL](self, "URL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector("URL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, v6);

  -[CXSandboxExtendedURL URL](self, "URL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "path");
  v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v8, "fileSystemRepresentation");
  v9 = (void *)sandbox_extension_issue_file();

  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_sandboxExtensionToken);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeObject:forKey:", v10, v11);

    free(v9);
  }
  else
  {
    CXDefaultLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[CXSandboxExtendedURL encodeWithCoder:].cold.1(self, v12);

  }
}

- (void)setURL:(id)a3
{
  objc_storeStrong((id *)&self->_URL, a3);
}

- (int64_t)sandboxExtensionHandle
{
  return self->_sandboxExtensionHandle;
}

- (void)setSandboxExtensionHandle:(int64_t)a3
{
  self->_sandboxExtensionHandle = a3;
}

- (NSString)sandboxExtensionToken
{
  return self->_sandboxExtensionToken;
}

- (void)setSandboxExtensionToken:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sandboxExtensionToken, 0);
  objc_storeStrong((id *)&self->_URL, 0);
}

- (void)URL
{
  void *v4;
  int v5;
  void *v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "sandboxExtensionToken");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412546;
  v6 = v4;
  v7 = 2048;
  v8 = objc_msgSend(a1, "sandboxExtensionHandle");
  _os_log_error_impl(&dword_1A402D000, a2, OS_LOG_TYPE_ERROR, "Unable to consume sandbox extension with token %@, received handle %lld", (uint8_t *)&v5, 0x16u);

}

- (void)encodeWithCoder:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "URL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = v3;
  _os_log_error_impl(&dword_1A402D000, a2, OS_LOG_TYPE_ERROR, "Unable to issue sandbox extension for URL %@", (uint8_t *)&v4, 0xCu);

}

@end
