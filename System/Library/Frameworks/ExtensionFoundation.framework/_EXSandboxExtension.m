@implementation _EXSandboxExtension

- (_EXSandboxExtension)initWithCoder:(id)a3
{
  id v4;
  _EXSandboxExtension *v5;
  _EXSandboxExtension *v6;
  uint64_t v7;
  NSString *sandboxExtensionToken;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_EXSandboxExtension;
  v5 = -[_EXSandboxExtension init](&v10, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->_consumedSandboxExtension = -1;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sandboxExtensionToken"));
    v7 = objc_claimAutoreleasedReturnValue();
    sandboxExtensionToken = v6->_sandboxExtensionToken;
    v6->_sandboxExtensionToken = (NSString *)v7;

  }
  return v6;
}

- (BOOL)consume
{
  uint64_t *p_consumedSandboxExtension;
  BOOL v3;
  NSString **p_sandboxExtensionToken;
  uint64_t v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  int v9;
  int v11;
  uint64_t v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  p_consumedSandboxExtension = (uint64_t *)&self->_consumedSandboxExtension;
  if (self->_consumedSandboxExtension == -1)
  {
    p_sandboxExtensionToken = &self->_sandboxExtensionToken;
    if (-[NSString UTF8String](self->_sandboxExtensionToken, "UTF8String"))
    {
      -[NSString UTF8String](*p_sandboxExtensionToken, "UTF8String");
      v5 = sandbox_extension_consume();
      *p_consumedSandboxExtension = v5;
      if (v5 != -1)
      {
        _EXDefaultLog();
        v6 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
          -[_EXSandboxExtension consume].cold.2((id *)p_sandboxExtensionToken, p_consumedSandboxExtension, v6);
        v3 = 1;
LABEL_14:

        return v3;
      }
    }
    else
    {
      _EXDefaultLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
        -[_EXSandboxExtension consume].cold.1(v7);

      *p_consumedSandboxExtension = -1;
    }
    _EXDefaultLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v8 = -[NSString UTF8String](*p_sandboxExtensionToken, "UTF8String");
      v9 = *__error();
      v11 = 136446466;
      v12 = v8;
      v13 = 1024;
      v14 = v9;
    }
    v3 = 0;
    goto LABEL_14;
  }
  return 1;
}

- (_EXSandboxExtension)initWithExtensionClass:(id)a3 machServiceName:(id)a4 process:(id *)a5
{
  id v8;
  id v9;
  _EXSandboxExtension *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  NSString *sandboxExtensionToken;
  __int128 v16;
  __int128 v17;

  v8 = a3;
  v9 = a4;
  v10 = -[_EXSandboxExtension init](self, "init");
  if (v10)
  {
    objc_msgSend(objc_retainAutorelease(v8), "UTF8String");
    objc_msgSend(objc_retainAutorelease(v9), "UTF8String");
    v16 = *(_OWORD *)a5->var0;
    v17 = *(_OWORD *)&a5->var0[4];
    v11 = sandbox_extension_issue_mach_to_process();
    if (v11)
    {
      v12 = (void *)v11;
      v10->_consumedSandboxExtension = -1;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v11, v16, v17);
      v13 = objc_claimAutoreleasedReturnValue();
      sandboxExtensionToken = v10->_sandboxExtensionToken;
      v10->_sandboxExtensionToken = (NSString *)v13;

      free(v12);
    }
  }

  return v10;
}

- (_EXSandboxExtension)init
{
  _EXSandboxExtension *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_EXSandboxExtension;
  result = -[_EXSandboxExtension init](&v3, sel_init);
  if (result)
    result->_consumedSandboxExtension = -1;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sandboxExtensionToken, 0);
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_sandboxExtensionToken, CFSTR("sandboxExtensionToken"));
}

- (void)dealloc
{
  objc_super v3;

  if (self->_consumedSandboxExtension != -1)
    sandbox_extension_release();
  v3.receiver = self;
  v3.super_class = (Class)_EXSandboxExtension;
  -[_EXSandboxExtension dealloc](&v3, sel_dealloc);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (BOOL)sandboxed
{
  if (sandboxed_onceToken != -1)
    dispatch_once(&sandboxed_onceToken, &__block_literal_global_11);
  return sandboxed__sandboxed;
}

- (_EXSandboxExtension)initWithURL:(id)a3 readonly:(BOOL)a4
{
  id v5;
  _EXSandboxExtension *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSString *sandboxExtensionToken;

  v5 = a3;
  v6 = -[_EXSandboxExtension init](self, "init");
  if (v6)
  {
    objc_msgSend(objc_retainAutorelease(v5), "fileSystemRepresentation");
    v7 = sandbox_extension_issue_file();
    if (v7)
    {
      v8 = (void *)v7;
      v6->_consumedSandboxExtension = -1;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v7);
      v9 = objc_claimAutoreleasedReturnValue();
      sandboxExtensionToken = v6->_sandboxExtensionToken;
      v6->_sandboxExtensionToken = (NSString *)v9;

      free(v8);
    }
  }

  return v6;
}

- (unint64_t)consumedSandboxExtension
{
  return self->_consumedSandboxExtension;
}

- (void)setConsumedSandboxExtension:(unint64_t)a3
{
  self->_consumedSandboxExtension = a3;
}

- (NSString)sandboxExtensionToken
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setSandboxExtensionToken:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void)consume
{
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend(*a1, "UTF8String");
  v6 = *a2;
  v7 = 136446466;
  v8 = v5;
  v9 = 2048;
  v10 = v6;
}

@end
