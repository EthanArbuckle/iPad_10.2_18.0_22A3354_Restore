@implementation FPSandboxingURLWrapper

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originalDocumentURLWrapper, 0);
  objc_storeStrong((id *)&self->_promiseURL, 0);
  objc_storeStrong((id *)&self->_promiseScope, 0);
  objc_storeStrong((id *)&self->_scope, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

- (FPSandboxingURLWrapper)initWithCoder:(id)a3
{
  id v5;
  FPSandboxingURLWrapper *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v16;

  v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)FPSandboxingURLWrapper;
  v6 = -[FPSandboxingURLWrapper init](&v16, sel_init);
  if (v6)
  {
    objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("NSURL"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("NSPromise"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("FPOriginalDocumentURL"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("NSURLScope"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("NSPromiseScope"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "assembleURL:sandbox:physicalURL:physicalSandbox:", v7, v10, v8, v11);
    if (!v7)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, CFSTR("FPSandboxingURLWrapper.m"), 207, CFSTR("tried to unarchive a wrapper with nil url"));

    }
    -[FPSandboxingURLWrapper setUrl:](v6, "setUrl:", v7);
    -[FPSandboxingURLWrapper setScope:](v6, "setScope:", v10);
    -[FPSandboxingURLWrapper setPromiseURL:](v6, "setPromiseURL:", v8);
    -[FPSandboxingURLWrapper setPromiseScope:](v6, "setPromiseScope:", v11);
    -[FPSandboxingURLWrapper setOriginalDocumentURLWrapper:](v6, "setOriginalDocumentURLWrapper:", v9);
    if (v9)
    {
      -[FPSandboxingURLWrapper url](v6, "url");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "url");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setTemporaryResourceValue:forKey:", v14, CFSTR("FPOriginalDocumentURL"));

    }
  }

  return v6;
}

- (void)setOriginalDocumentURLWrapper:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (void)setUrl:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void)setScope:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void)setPromiseURL:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (void)setPromiseScope:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
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
      MEMORY[0x1A1AFFD4C](v12, v9);
    if (v10 && v11)
      MEMORY[0x1A1AFFD4C](v10, v11);
    _CFURLPromiseSetPhysicalURL();
  }

}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  id v21;

  v4 = a3;
  -[FPSandboxingURLWrapper url](self, "url");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("NSURL"));

  -[FPSandboxingURLWrapper scope](self, "scope");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("NSURLScope"));

  -[FPSandboxingURLWrapper promiseURL](self, "promiseURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[FPSandboxingURLWrapper promiseURL](self, "promiseURL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("NSPromise"));

    -[FPSandboxingURLWrapper promiseScope](self, "promiseScope");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("NSPromiseScope"));

  }
  -[FPSandboxingURLWrapper originalDocumentURLWrapper](self, "originalDocumentURLWrapper");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    -[FPSandboxingURLWrapper url](self, "url");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 0;
    v21 = 0;
    v12 = objc_msgSend(v11, "getResourceValue:forKey:error:", &v21, CFSTR("FPOriginalDocumentURL"), &v20);
    v13 = v21;
    v14 = v20;

    if (v12 && v13)
    {
      v19 = v14;
      +[FPSandboxingURLWrapper wrapperWithURL:readonly:error:](FPSandboxingURLWrapper, "wrapperWithURL:readonly:error:", v13, 0, &v19);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v19;

      -[FPSandboxingURLWrapper setOriginalDocumentURLWrapper:](self, "setOriginalDocumentURLWrapper:", v15);
      v14 = v16;
    }

  }
  -[FPSandboxingURLWrapper originalDocumentURLWrapper](self, "originalDocumentURLWrapper");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    -[FPSandboxingURLWrapper originalDocumentURLWrapper](self, "originalDocumentURLWrapper");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeObject:forKey:", v18, CFSTR("FPOriginalDocumentURL"));

  }
}

- (NSURL)url
{
  return self->_url;
}

- (FPSandboxingURLWrapper)originalDocumentURLWrapper
{
  return (FPSandboxingURLWrapper *)objc_getProperty(self, a2, 40, 1);
}

- (NSData)scope
{
  return (NSData *)objc_getProperty(self, a2, 16, 1);
}

- (NSURL)promiseURL
{
  return (NSURL *)objc_getProperty(self, a2, 32, 1);
}

+ (FPSandboxingURLWrapper)wrapperWithURL:(id)a3 extensionClass:(const char *)a4 report:(BOOL)a5 error:(id *)a6
{
  _BOOL8 v7;
  id v10;
  void *v11;

  v7 = a5;
  v10 = a3;
  v11 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithURL:extensionClass:report:error:", v10, a4, v7, a6);

  return (FPSandboxingURLWrapper *)v11;
}

- (FPSandboxingURLWrapper)initWithURL:(id)a3 extensionClass:(const char *)a4 report:(BOOL)a5 error:(id *)a6
{
  _BOOL8 v7;
  id v12;
  void *v13;
  FPSandboxingURLWrapper *v14;
  FPSandboxingURLWrapper *v15;
  void *v16;
  int v17;
  uint64_t v18;
  id v19;
  NSData *scope;
  uint64_t v21;
  id v22;
  NSData *promiseScope;
  NSURL *url;
  _BOOL4 v25;
  id v26;
  id v27;
  uint64_t v28;
  id v29;
  FPSandboxingURLWrapper *originalDocumentURLWrapper;
  FPSandboxingURLWrapper *v31;
  NSObject *v32;
  NSObject *v34;
  int v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  objc_super v41;

  v7 = a5;
  v12 = a3;
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("FPSandboxingURLWrapper.m"), 78, CFSTR("tried to create wrapper with nil url"));

  }
  v41.receiver = self;
  v41.super_class = (Class)FPSandboxingURLWrapper;
  v14 = -[FPSandboxingURLWrapper init](&v41, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_url, a3);
    v16 = (void *)_CFURLPromiseCopyPhysicalURL();
    if ((objc_msgSend(v12, "isEqual:", v16) & 1) == 0)
      objc_storeStrong((id *)&v15->_promiseURL, v16);
    v17 = objc_msgSend(v12, "startAccessingSecurityScopedResource");
    v35 = objc_msgSend(v16, "startAccessingSecurityScopedResource");
    v40 = 0;
    objc_msgSend(v12, "fp_issueSandboxExtensionOfClass:report:error:", a4, v7, &v40);
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = v40;
    scope = v15->_scope;
    v15->_scope = (NSData *)v18;

    if (v15->_scope)
    {
      if (!v16)
        goto LABEL_10;
      v39 = v19;
      objc_msgSend(v16, "fp_issueSandboxExtensionOfClass:report:error:", a4, v7, &v39);
      v21 = objc_claimAutoreleasedReturnValue();
      v22 = v39;

      promiseScope = v15->_promiseScope;
      v15->_promiseScope = (NSData *)v21;

      if (v15->_promiseScope)
      {
        v19 = v22;
LABEL_10:
        url = v15->_url;
        v38 = 0;
        v37 = 0;
        v25 = -[NSURL getResourceValue:forKey:error:](url, "getResourceValue:forKey:error:", &v38, CFSTR("FPOriginalDocumentURL"), &v37);
        v26 = v38;
        v27 = v37;
        if (v25 && v26)
        {
          v36 = v27;
          +[FPSandboxingURLWrapper wrapperWithURL:readonly:error:](FPSandboxingURLWrapper, "wrapperWithURL:readonly:error:", v26, 0, &v36);
          v28 = objc_claimAutoreleasedReturnValue();
          v29 = v36;

          originalDocumentURLWrapper = v15->_originalDocumentURLWrapper;
          v15->_originalDocumentURLWrapper = (FPSandboxingURLWrapper *)v28;

          v27 = v29;
        }
        if (v17)
          objc_msgSend(v12, "stopAccessingSecurityScopedResource");
        if (v35)
          objc_msgSend(v16, "stopAccessingSecurityScopedResource");

        goto LABEL_19;
      }
      fp_current_or_default_log();
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
        -[FPSandboxingURLWrapper initWithURL:extensionClass:report:error:].cold.1();

      v19 = v22;
      if (!a6)
      {
LABEL_24:

        v31 = 0;
        goto LABEL_25;
      }
    }
    else
    {
      fp_current_or_default_log();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
        -[FPSandboxingURLWrapper initWithURL:extensionClass:report:error:].cold.1();

      if (!a6)
        goto LABEL_24;
    }
    v19 = objc_retainAutorelease(v19);
    *a6 = v19;
    goto LABEL_24;
  }
  v19 = 0;
LABEL_19:
  v31 = v15;
LABEL_25:

  return v31;
}

+ (FPSandboxingURLWrapper)wrapperWithURL:(id)a3 extensionClass:(const char *)a4 error:(id *)a5
{
  return (FPSandboxingURLWrapper *)objc_msgSend(a1, "wrapperWithURL:extensionClass:report:error:", a3, a4, 1, a5);
}

+ (FPSandboxingURLWrapper)wrapperWithURL:(id)a3 readonly:(BOOL)a4 error:(id *)a5
{
  _QWORD *v5;

  v5 = (_QWORD *)MEMORY[0x1E0C80000];
  if (!a4)
    v5 = (_QWORD *)MEMORY[0x1E0C80008];
  return (FPSandboxingURLWrapper *)objc_msgSend(a1, "wrapperWithURL:extensionClass:error:", a3, *v5, a5);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (FPSandboxingURLWrapper)init
{
  NSObject *v3;
  objc_super v5;

  fp_current_or_default_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    -[FPSandboxingURLWrapper init].cold.1(v3);

  v5.receiver = self;
  v5.super_class = (Class)FPSandboxingURLWrapper;
  return -[FPSandboxingURLWrapper init](&v5, sel_init);
}

- (id)_init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FPSandboxingURLWrapper;
  return -[FPSandboxingURLWrapper init](&v3, sel_init);
}

+ (FPSandboxingURLWrapper)wrapperWithURL:(id)a3
{
  return (FPSandboxingURLWrapper *)objc_msgSend(a1, "wrapperWithURL:readonly:", a3, 0);
}

+ (FPSandboxingURLWrapper)wrapperWithURL:(id)a3 readonly:(BOOL)a4
{
  _BOOL8 v4;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v13;

  v4 = a4;
  v7 = a3;
  v13 = 0;
  objc_msgSend(a1, "wrapperWithURL:readonly:error:", v7, v4, &v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v13;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "fp_shortDescription");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("FPSandboxingURLWrapper.m"), 55, CFSTR("nil wrapper returned for url %@: %@"), v11, v9);

  }
  return (FPSandboxingURLWrapper *)v8;
}

+ (FPSandboxingURLWrapper)wrapperWithSecurityScopedURL:(id)a3
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  int v9;
  id v10;
  id v11;
  BOOL v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v18;
  id v19;
  id v20;
  id v21;

  v5 = a3;
  v6 = -[FPSandboxingURLWrapper _init]([FPSandboxingURLWrapper alloc], "_init");
  objc_msgSend(v6, "setUrl:", v5);
  v7 = (void *)MEMORY[0x1A1AFFD7C](v5);

  objc_msgSend(v6, "setScope:", v7);
  objc_msgSend(v6, "url");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0;
  v20 = 0;
  v9 = objc_msgSend(v8, "getResourceValue:forKey:error:", &v21, CFSTR("FPOriginalDocumentURL"), &v20);
  v10 = v21;
  v11 = v20;

  if (v9)
    v12 = v10 == 0;
  else
    v12 = 1;
  if (!v12)
  {
    v19 = v11;
    +[FPSandboxingURLWrapper wrapperWithURL:readonly:error:](FPSandboxingURLWrapper, "wrapperWithURL:readonly:error:", v10, 0, &v19);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v19;

    objc_msgSend(v6, "setOriginalDocumentURLWrapper:", v13);
    v11 = v14;
  }
  objc_msgSend(v6, "scope");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15)
  {
    objc_msgSend(v6, "scope");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v16)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("FPSandboxingURLWrapper.m"), 136, CFSTR("missing security scope"));

    }
  }

  return (FPSandboxingURLWrapper *)v6;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[FPSandboxingURLWrapper url](self, "url");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fp_shortDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[FPSandboxingURLWrapper promiseURL](self, "promiseURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "fp_shortDescription");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p url: %@ promiseURL: %@>"), v4, self, v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (NSData)promiseScope
{
  return (NSData *)objc_getProperty(self, a2, 24, 1);
}

- (void)init
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1A0A34000, log, OS_LOG_TYPE_ERROR, "[ERROR] -init called on FPSandboxingURLWrapper. This will result in a partially uninitialized object.", v1, 2u);
}

- (void)initWithURL:extensionClass:report:error:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_8_3();
  OUTLINED_FUNCTION_0_5(&dword_1A0A34000, v0, v1, "[DEBUG] Could not issue %s sandbox extension (%@).");
}

@end
