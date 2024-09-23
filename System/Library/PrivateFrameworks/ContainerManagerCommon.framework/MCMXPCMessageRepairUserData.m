@implementation MCMXPCMessageRepairUserData

- (MCMXPCMessageRepairUserData)initWithXPCObject:(id)a3 context:(id)a4 error:(unint64_t *)a5
{
  id v8;
  MCMXPCMessageRepairUserData *v9;
  const char *string;
  NSURL *url;
  void *v12;
  uint64_t v13;
  NSURL *v14;
  objc_super v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v16.receiver = self;
  v16.super_class = (Class)MCMXPCMessageRepairUserData;
  v9 = -[MCMXPCMessageBase initWithXPCObject:context:error:](&v16, sel_initWithXPCObject_context_error_, v8, a4, a5);
  if (v9)
  {
    string = xpc_dictionary_get_string(v8, "SandboxToken");
    if (string)
      string = strndup(string, 0x800uLL);
    v9->_sandboxToken = (char *)string;
    url = v9->_url;
    v9->_url = 0;

    -[MCMXPCMessageBase nsStringValueFromXPCObject:key:](v9, "nsStringValueFromXPCObject:key:", v8, "Path");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:relativeToURL:", v12, 1, 0);
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = v9->_url;
      v9->_url = (NSURL *)v13;

    }
  }

  return v9;
}

- (unsigned)disposition
{
  unsigned int v2;
  id v3;
  objc_super v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v5.receiver = self;
  v5.super_class = (Class)MCMXPCMessageRepairUserData;
  v2 = -[MCMXPCMessageBase disposition](&v5, sel_disposition);
  if (v2 == 1)
  {
    v3 = containermanager_copy_global_configuration();
    v2 = objc_msgSend(v3, "runmode") == 0;

  }
  return v2;
}

- (void)dealloc
{
  char **p_sandboxToken;
  char *sandboxToken;
  objc_super v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  p_sandboxToken = &self->_sandboxToken;
  sandboxToken = self->_sandboxToken;
  if (sandboxToken)
  {
    free(sandboxToken);
    memset_s(p_sandboxToken, 8uLL, 0, 8uLL);
  }
  v5.receiver = self;
  v5.super_class = (Class)MCMXPCMessageRepairUserData;
  -[MCMXPCMessageBase dealloc](&v5, sel_dealloc);
}

- (NSURL)url
{
  return self->_url;
}

- (char)sandboxToken
{
  return self->_sandboxToken;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
}

@end
