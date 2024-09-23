@implementation IMSandboxedResource

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[IMSandboxedResource resource](self, "resource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMSandboxedResource sandboxExtension](self, "sandboxExtension");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = CFSTR("YES");
  if (!v5)
    v6 = CFSTR("NO");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<IMSandboxedResource resource: %@ hasSandboxExtension: %@>"), v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)dealloc
{
  objc_super v3;

  if (self->_sandboxExtensionHandle >= 1)
  {
    sandbox_extension_release();
    self->_sandboxExtensionHandle = 0;
  }
  v3.receiver = self;
  v3.super_class = (Class)IMSandboxedResource;
  -[IMSandboxedResource dealloc](&v3, sel_dealloc);
}

- (void)authorizeForPID:(int)a3
{
  char *v5;
  char *v6;
  NSString *v7;
  NSString *sandboxExtension;
  NSObject *v9;
  int v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = -[IMSandboxedResource _sandboxExtensionForPID:](self, "_sandboxExtensionForPID:");
  if (v5)
  {
    v6 = v5;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v5);
    v7 = (NSString *)objc_claimAutoreleasedReturnValue();
    sandboxExtension = self->_sandboxExtension;
    self->_sandboxExtension = v7;

    free(v6);
  }
  else if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v10 = 134217984;
      v11 = a3;
      _os_log_impl(&dword_19E239000, v9, OS_LOG_TYPE_INFO, "Unable to obtain sandbox extension for PID: %llu", (uint8_t *)&v10, 0xCu);
    }

  }
}

- (void)authorizeForAuditToken:(id *)a3
{
  __int128 v4;
  char *v5;
  char *v6;
  NSString *v7;
  NSString *sandboxExtension;
  NSObject *v9;
  _OWORD v10[2];

  v4 = *(_OWORD *)&a3->var0[4];
  v10[0] = *(_OWORD *)a3->var0;
  v10[1] = v4;
  v5 = -[IMSandboxedResource _sandboxExtensionForAuditToken:](self, "_sandboxExtensionForAuditToken:", v10);
  if (v5)
  {
    v6 = v5;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v5);
    v7 = (NSString *)objc_claimAutoreleasedReturnValue();
    sandboxExtension = self->_sandboxExtension;
    self->_sandboxExtension = v7;

    free(v6);
  }
  else if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      LOWORD(v10[0]) = 0;
      _os_log_impl(&dword_19E239000, v9, OS_LOG_TYPE_INFO, "Unable to obtain sandbox extension for auditToken", (uint8_t *)v10, 2u);
    }

  }
}

- (BOOL)accessResourceByConsumingSandboxExtensionWithBlock:(id)a3
{
  void (**v4)(id, void *);
  void *v5;
  uint64_t v6;
  int64_t v7;
  void *v8;
  BOOL v9;
  NSObject *v10;
  void *v11;
  NSString *sandboxExtension;
  int v14;
  void *v15;
  int v16;
  _DWORD v17[7];

  *(_QWORD *)&v17[5] = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, void *))a3;
  -[IMSandboxedResource sandboxExtension](self, "sandboxExtension");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length");

  if (!v6)
  {
    if (!IMOSLoggingEnabled())
    {
LABEL_11:
      v9 = 0;
      goto LABEL_12;
    }
    OSLogHandleForIMFoundationCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      -[IMSandboxedResource resource](self, "resource");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138412290;
      *(_QWORD *)v17 = v11;
      _os_log_impl(&dword_19E239000, v10, OS_LOG_TYPE_INFO, "Unable to access protected resource (missing sandbox extension): %@", (uint8_t *)&v16, 0xCu);

    }
LABEL_10:

    goto LABEL_11;
  }
  if (!self->_sandboxExtensionHandle)
  {
    -[NSString UTF8String](self->_sandboxExtension, "UTF8String");
    v7 = sandbox_extension_consume();
    self->_sandboxExtensionHandle = v7;
    if (v7 == -1)
    {
      sandboxExtension = self->_sandboxExtension;
      self->_sandboxExtension = 0;

      self->_sandboxExtensionHandle = 0;
      if (!IMOSLoggingEnabled())
        goto LABEL_11;
      OSLogHandleForIMFoundationCategory();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        v14 = *__error();
        -[IMSandboxedResource resource](self, "resource");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = 67109378;
        v17[0] = v14;
        LOWORD(v17[1]) = 2112;
        *(_QWORD *)((char *)&v17[1] + 2) = v15;
        _os_log_impl(&dword_19E239000, v10, OS_LOG_TYPE_INFO, "Unable to access protected resource, error: %d resource: %@", (uint8_t *)&v16, 0x12u);

      }
      goto LABEL_10;
    }
  }
  if (v4)
  {
    -[IMSandboxedResource resource](self, "resource");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v4[2](v4, v8);

  }
  v9 = 1;
LABEL_12:

  return v9;
}

+ (Class)resourceClass
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99768];
  v4 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ is not implemented"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v6, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v7);
}

- (char)_sandboxExtensionForPID:(int)a3
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  v5 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@ is not implemented"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v7, 0);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v8);
}

- (char)_sandboxExtensionForAuditToken:(id *)a3
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  v5 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@ is not implemented"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v7, 0);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v8);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t);
  void *v14;
  IMSandboxedResource *v15;
  id v16;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[IMSandboxedResource sandboxExtension](self, "sandboxExtension");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "length");

    if (v7)
    {
      v11 = MEMORY[0x1E0C809B0];
      v12 = 3221225472;
      v13 = sub_19E260058;
      v14 = &unk_1E3FB4FD8;
      v15 = self;
      v16 = v5;
      -[IMSandboxedResource accessResourceByConsumingSandboxExtensionWithBlock:](self, "accessResourceByConsumingSandboxExtensionWithBlock:", &v11);

    }
    else
    {
      objc_msgSend(v5, "connection");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMSandboxedResource authorizeForPID:](self, "authorizeForPID:", objc_msgSend(v8, "processIdentifier"));

    }
  }
  -[IMSandboxedResource sandboxExtension](self, "sandboxExtension", v11, v12, v13, v14, v15);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("sandboxExtension"));

  -[IMSandboxedResource resource](self, "resource");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("resource"));

}

- (IMSandboxedResource)initWithCoder:(id)a3
{
  id v4;
  IMSandboxedResource *v5;
  uint64_t v6;
  NSString *sandboxExtension;
  uint64_t v8;
  id resource;

  v4 = a3;
  v5 = -[IMSandboxedResource init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sandboxExtension"));
    v6 = objc_claimAutoreleasedReturnValue();
    sandboxExtension = v5->_sandboxExtension;
    v5->_sandboxExtension = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_msgSend((id)objc_opt_class(), "resourceClass"), CFSTR("resource"));
    v8 = objc_claimAutoreleasedReturnValue();
    resource = v5->_resource;
    v5->_resource = (id)v8;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (int64_t)sandboxExtensionHandle
{
  return self->_sandboxExtensionHandle;
}

- (void)setSandboxExtensionHandle:(int64_t)a3
{
  self->_sandboxExtensionHandle = a3;
}

- (id)resource
{
  return self->_resource;
}

- (void)setResource:(id)a3
{
  objc_storeStrong(&self->_resource, a3);
}

- (NSString)sandboxExtension
{
  return self->_sandboxExtension;
}

- (void)setSandboxExtension:(id)a3
{
  objc_storeStrong((id *)&self->_sandboxExtension, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sandboxExtension, 0);
  objc_storeStrong(&self->_resource, 0);
}

@end
