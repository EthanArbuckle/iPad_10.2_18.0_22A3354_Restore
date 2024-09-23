@implementation MCMXPCMessageCreateOrLookupWithBundle

- (MCMXPCMessageCreateOrLookupWithBundle)initWithXPCObject:(id)a3 context:(id)a4 error:(unint64_t *)a5
{
  id v8;
  MCMXPCMessageCreateOrLookupWithBundle *v9;
  char uint64;
  void *v11;
  uint64_t v12;
  NSURL *bundleURL;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  NSURL *executableURL;
  void *v18;
  void *v19;
  char v20;
  NSObject *v21;
  void *v23;
  void *v24;
  objc_super v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v25.receiver = self;
  v25.super_class = (Class)MCMXPCMessageCreateOrLookupWithBundle;
  v9 = -[MCMXPCMessageBase initWithXPCObject:context:error:](&v25, sel_initWithXPCObject_context_error_, v8, a4, a5);
  if (v9)
  {
    uint64 = xpc_dictionary_get_uint64(v8, "Flags");
    v9->_createIfNecessary = uint64 & 1;
    v9->_transient = (uint64 & 2) != 0;
    v9->_issueSandboxExtension = (uint64 & 8) != 0;
    v9->_sandboxToken = xpc_dictionary_get_string(v8, "SandboxToken");
    -[MCMXPCMessageBase nsStringValueFromXPCObject:key:](v9, "nsStringValueFromXPCObject:key:", v8, "BundlePath");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:relativeToURL:", v11, 1, 0);
      v12 = objc_claimAutoreleasedReturnValue();
      bundleURL = v9->_bundleURL;
      v9->_bundleURL = (NSURL *)v12;

      -[MCMXPCMessageBase nsStringValueFromXPCObject:key:](v9, "nsStringValueFromXPCObject:key:", v8, "ExecutablePath");
      v14 = objc_claimAutoreleasedReturnValue();
      if (v14)
      {
        v15 = (void *)v14;
        objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:relativeToURL:", v14, 0, 0);
        v16 = objc_claimAutoreleasedReturnValue();
        executableURL = v9->_executableURL;
        v9->_executableURL = (NSURL *)v16;

        -[NSURL path](v9->_executableURL, "path");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSURL path](v9->_bundleURL, "path");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v18, "hasPrefix:", v19);

        if ((v20 & 1) != 0)
        {

          goto LABEL_11;
        }
        container_log_handle_for_category();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          -[NSURL path](v9->_executableURL, "path");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSURL path](v9->_bundleURL, "path");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v27 = v23;
          v28 = 2112;
          v29 = v24;
          _os_log_error_impl(&dword_1CF807000, v21, OS_LOG_TYPE_ERROR, "Executable path [%@] is not inside bundle path [%@]", buf, 0x16u);

        }
      }
    }

    v9 = 0;
    if (a5)
      *a5 = 10;
  }
LABEL_11:

  return v9;
}

- (BOOL)createIfNecessary
{
  return self->_createIfNecessary;
}

- (BOOL)transient
{
  return self->_transient;
}

- (BOOL)issueSandboxExtension
{
  return self->_issueSandboxExtension;
}

- (const)sandboxToken
{
  return self->_sandboxToken;
}

- (NSURL)bundleURL
{
  return self->_bundleURL;
}

- (NSURL)executableURL
{
  return self->_executableURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_executableURL, 0);
  objc_storeStrong((id *)&self->_bundleURL, 0);
}

@end
