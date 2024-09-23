@implementation UNSecurityScopedURL

- (id)initFileURLWithPath:(id)a3 sandboxExtensionClass:(id)a4
{
  id v6;
  _QWORD *v7;
  uint64_t v8;
  void *v9;
  objc_super v11;

  v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)UNSecurityScopedURL;
  v7 = -[UNSecurityScopedURL initFileURLWithPath:](&v11, sel_initFileURLWithPath_, a3);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    v9 = (void *)v7[5];
    v7[5] = v8;

  }
  return v7;
}

- (BOOL)_allowsDirectEncoding
{
  return 0;
}

- (id)_issueSandboxExtension
{
  void *v3;
  void *v4;
  int v5;
  const char *v6;
  uint64_t v7;
  BOOL v8;
  const char *v9;
  void *v10;
  size_t v11;

  if (!-[NSString length](self->_sandboxExtensionClass, "length"))
  {
    v10 = 0;
    return v10;
  }
  -[UNSecurityScopedURL path](self, "path");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "fileExistsAtPath:", v3);

  if (!v5
    || ((v6 = -[NSString cStringUsingEncoding:](self->_sandboxExtensionClass, "cStringUsingEncoding:", 1),
         v7 = -[UNSecurityScopedURL fileSystemRepresentation](objc_retainAutorelease(self), "fileSystemRepresentation"),
         v6)
      ? (v8 = v7 == 0)
      : (v8 = 1),
        v8))
  {
LABEL_9:
    v10 = 0;
    goto LABEL_10;
  }
  v9 = (const char *)sandbox_extension_issue_file();
  v10 = (void *)v9;
  if (v9)
  {
    v11 = strnlen(v9, 0x400uLL);
    if (v11 <= 0x3FF)
    {
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:", v10, v11 + 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    }
    goto LABEL_9;
  }
LABEL_10:

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)UNSecurityScopedURL;
  -[UNSecurityScopedURL encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  -[UNSecurityScopedURL _issueSandboxExtension](self, "_issueSandboxExtension");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
    v5 = (void *)MEMORY[0x1AF42279C](self);
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("sandboxExtension"));

}

- (UNSecurityScopedURL)initWithCoder:(id)a3
{
  id v4;
  UNSecurityScopedURL *v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)UNSecurityScopedURL;
  v5 = -[UNSecurityScopedURL initWithCoder:](&v8, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sandboxExtension"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    MEMORY[0x1AF422790](v5, v6);

  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sandboxExtensionClass, 0);
}

@end
