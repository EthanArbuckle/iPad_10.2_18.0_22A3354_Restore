@implementation _EXItemProviderSandboxedResource

- (_EXItemProviderSandboxedResource)initWithContentsOfURL:(id)a3 auditToken:(id *)a4 error:(id *)a5
{
  id v8;
  _EXItemProviderSandboxedResource *v9;
  _EXItemProviderSandboxedResource *v10;
  void *v11;
  __int128 v12;
  id v13;
  NSObject *v14;
  int v15;
  id v16;
  const char *v17;
  void *v18;
  id v19;
  _EXItemProviderSandboxedResource *v20;
  void *v21;
  void *v22;
  int *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  id v29;
  NSObject *v30;
  objc_super v32;
  audit_token_t v33;
  pid_t pidp[2];
  audit_token_t atoken;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v32.receiver = self;
  v32.super_class = (Class)_EXItemProviderSandboxedResource;
  v9 = -[_EXItemProviderSandboxedResource init](&v32, sel_init);
  v10 = v9;
  if (v9)
  {
    -[_EXItemProviderSandboxedResource setResourceURL:](v9, "setResourceURL:", v8);
    -[_EXItemProviderSandboxedResource resourceURL](v10, "resourceURL");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = *(_OWORD *)&a4->var0[4];
    *(_OWORD *)v33.val = *(_OWORD *)a4->var0;
    *(_OWORD *)&v33.val[4] = v12;
    v13 = v11;
    _EXLegacyLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      pidp[0] = 0;
      atoken = v33;
      audit_token_to_au32(&atoken, 0, 0, 0, 0, 0, pidp, 0, 0);
      atoken.val[0] = 138412546;
      *(_QWORD *)&atoken.val[1] = v13;
      LOWORD(atoken.val[3]) = 1024;
      *(unsigned int *)((char *)&atoken.val[3] + 2) = pidp[0];
    }

    v15 = objc_msgSend(v13, "startAccessingSecurityScopedResource");
    v16 = objc_retainAutorelease(v13);
    objc_msgSend(v16, "fileSystemRepresentation");
    atoken = v33;
    v17 = (const char *)sandbox_extension_issue_file_to_process();
    if (v15)
      objc_msgSend(v16, "stopAccessingSecurityScopedResource");
    if (v17)
    {
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", v17, strlen(v17) + 1, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 0;
    }
    else
    {
      v21 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v16, "path");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = __error();
      objc_msgSend(v21, "stringWithFormat:", CFSTR("Cannot issue a sandbox extension for file \"%@\": %s"), v22, strerror(*v23));
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      v25 = (void *)MEMORY[0x1E0CB35C8];
      v26 = *MEMORY[0x1E0CB2FE0];
      v27 = *__error();
      *(_QWORD *)pidp = *MEMORY[0x1E0CB2D50];
      *(_QWORD *)atoken.val = v24;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &atoken, pidp, 1);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "errorWithDomain:code:userInfo:", v26, v27, v28);
      v19 = (id)objc_claimAutoreleasedReturnValue();

      v18 = 0;
    }

    v29 = v19;
    if (v18)
    {
      -[_EXItemProviderSandboxedResource setSandboxExtensionToken:](v10, "setSandboxExtensionToken:", v18);
      v20 = v10;
    }
    else
    {
      _EXLegacyLog();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        -[_EXItemProviderSandboxedResource initWithContentsOfURL:auditToken:error:].cold.1(v10, (uint64_t)v29, v30);

      v20 = 0;
      if (a5)
        *a5 = objc_retainAutorelease(v29);
    }

  }
  else
  {
    v20 = 0;
  }

  return v20;
}

- (void)dealloc
{
  objc_super v3;

  if (-[_EXItemProviderSandboxedResource isAccessingSecurityScopedResource](self, "isAccessingSecurityScopedResource"))
    -[NSURL stopAccessingSecurityScopedResource](self->_resourceURL, "stopAccessingSecurityScopedResource");
  -[_EXItemProviderSandboxedResource setResourceURL:](self, "setResourceURL:", 0);
  -[_EXItemProviderSandboxedResource setSandboxExtensionToken:](self, "setSandboxExtensionToken:", 0);
  v3.receiver = self;
  v3.super_class = (Class)_EXItemProviderSandboxedResource;
  -[_EXItemProviderSandboxedResource dealloc](&v3, sel_dealloc);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_EXItemProviderSandboxedResource)initWithCoder:(id)a3
{
  id v4;
  _EXItemProviderSandboxedResource *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  BOOL v9;
  void *v10;
  NSObject *v11;
  _EXItemProviderSandboxedResource *v12;

  v4 = a3;
  v5 = -[_EXItemProviderSandboxedResource init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("resourceURL"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sandboxExtensionToken"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    _EXLegacyLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      -[_EXItemProviderSandboxedResource initWithCoder:].cold.2();

    MEMORY[0x194017CF0](v6, v7);
    -[_EXItemProviderSandboxedResource setAccessingSecurityScopedResource:](v5, "setAccessingSecurityScopedResource:", objc_msgSend(v6, "startAccessingSecurityScopedResource"));
    v9 = -[_EXItemProviderSandboxedResource isAccessingSecurityScopedResource](v5, "isAccessingSecurityScopedResource");
    v10 = v6;
    if (!v9)
    {
      _EXLegacyLog();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        -[_EXItemProviderSandboxedResource initWithCoder:].cold.1((uint64_t)v6, v11);

      v10 = 0;
    }
    -[_EXItemProviderSandboxedResource setResourceURL:](v5, "setResourceURL:", v10);
    v12 = v5;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;

  v4 = a3;
  -[_EXItemProviderSandboxedResource resourceURL](self, "resourceURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_EXItemProviderSandboxedResource sandboxExtensionToken](self, "sandboxExtensionToken");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  _EXLegacyLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[_EXItemProviderSandboxedResource encodeWithCoder:].cold.1();

  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("resourceURL"));
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("sandboxExtensionToken"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v3;
  void *v4;

  -[_EXItemProviderSandboxedResource resourceURL](self, "resourceURL", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithContentsOfURL:", v3);

  return v4;
}

- (id)resolveURLAndReturnError:(id *)a3
{
  void *v3;
  id v4;

  -[_EXItemProviderSandboxedResource resourceURL](self, "resourceURL", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "startAccessingSecurityScopedResource"))
    v4 = v3;
  else
    v4 = 0;

  return v4;
}

- (NSURL)resourceURL
{
  return self->_resourceURL;
}

- (void)setResourceURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSData)sandboxExtensionToken
{
  return self->_sandboxExtensionToken;
}

- (void)setSandboxExtensionToken:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (BOOL)isAccessingSecurityScopedResource
{
  return self->_accessingSecurityScopedResource;
}

- (void)setAccessingSecurityScopedResource:(BOOL)a3
{
  self->_accessingSecurityScopedResource = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sandboxExtensionToken, 0);
  objc_storeStrong((id *)&self->_resourceURL, 0);
}

- (void)initWithContentsOfURL:(void *)a1 auditToken:(uint64_t)a2 error:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "resourceURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412546;
  v7 = v5;
  v8 = 2112;
  v9 = a2;
  _os_log_error_impl(&dword_190C25000, a3, OS_LOG_TYPE_ERROR, "Failed to issue sandbox token for URL: '%@' with error: '%@'", (uint8_t *)&v6, 0x16u);

}

- (void)initWithCoder:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_190C25000, a2, OS_LOG_TYPE_ERROR, "Failed to attach sandbox extension to URL: '%@'", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_6();
}

- (void)initWithCoder:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_6();
}

- (void)encodeWithCoder:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_6();
}

@end
