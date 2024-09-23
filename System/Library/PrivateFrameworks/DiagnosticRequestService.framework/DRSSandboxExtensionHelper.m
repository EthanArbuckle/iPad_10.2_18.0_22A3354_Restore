@implementation DRSSandboxExtensionHelper

- (DRSSandboxExtensionHelper)initWithSandboxExtensionToken:(id)a3 logPath:(id)a4 errorOut:(id *)a5
{
  id v8;
  id v9;
  DRSSandboxExtensionHelper *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  int *v16;
  char *v17;
  const char *v18;
  void *v19;
  void *v20;
  void *v21;
  objc_super v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (!v8)
  {
    v11 = (void *)MEMORY[0x1E0CB35C8];
    v26 = *MEMORY[0x1E0CB2D50];
    v27[0] = CFSTR("nil sandbox extension token");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, &v26, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "errorWithDomain:code:userInfo:", CFSTR("DRSSandboxExtensionHelper"), 0, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (a5)
      *a5 = objc_retainAutorelease(v13);
    goto LABEL_13;
  }
  v23.receiver = self;
  v23.super_class = (Class)DRSSandboxExtensionHelper;
  self = -[DRSSandboxExtensionHelper init](&v23, sel_init);
  if (self)
  {
    objc_msgSend(objc_retainAutorelease(v8), "UTF8String");
    self->_sandboxExtensionHandle = sandbox_extension_consume();
    objc_storeStrong((id *)&self->_logPath, a4);
    if (-[DRSSandboxExtensionHelper sandboxExtensionHandle](self, "sandboxExtensionHandle") != -1)
    {
      self->_didInit = 1;
      goto LABEL_5;
    }
    v14 = objc_alloc(MEMORY[0x1E0CB3940]);
    -[DRSSandboxExtensionHelper logPath](self, "logPath");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = __error();
    v17 = strerror(*v16);
    v18 = "Unknown";
    if (v17)
      v18 = v17;
    v13 = (void *)objc_msgSend(v14, "initWithFormat:", CFSTR("Failed to consume extension token for '%@' due to error: %s"), v15, v18);

    v19 = (void *)MEMORY[0x1E0CB35C8];
    v24 = *MEMORY[0x1E0CB2D50];
    v25 = v13;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "errorWithDomain:code:userInfo:", CFSTR("DRSSandboxExtensionHelper"), 0, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (a5)
      *a5 = objc_retainAutorelease(v21);

LABEL_13:
    v10 = 0;
    goto LABEL_14;
  }
LABEL_5:
  self = self;
  v10 = self;
LABEL_14:

  return v10;
}

- (void)dealloc
{
  NSObject *v3;
  void *v4;
  int *v5;
  char *v6;
  const char *v7;
  objc_super v8;
  uint8_t buf[4];
  void *v10;
  __int16 v11;
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (-[DRSSandboxExtensionHelper didInit](self, "didInit"))
  {
    -[DRSSandboxExtensionHelper sandboxExtensionHandle](self, "sandboxExtensionHandle");
    if (sandbox_extension_release() == -1)
    {
      DPLogHandle_SubmitLogError();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_signpost_enabled(v3))
      {
        -[DRSSandboxExtensionHelper logPath](self, "logPath");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = __error();
        v6 = strerror(*v5);
        v7 = "Unknown";
        if (v6)
          v7 = v6;
        *(_DWORD *)buf = 138543618;
        v10 = v4;
        v11 = 2082;
        v12 = v7;
        _os_signpost_emit_with_name_impl(&dword_1DBB92000, v3, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "SandboxExtensionReleaseFailure", "Failed to release sandbox extension for file '%{public}@' due to error: %{public}s", buf, 0x16u);

      }
    }
  }
  v8.receiver = self;
  v8.super_class = (Class)DRSSandboxExtensionHelper;
  -[DRSSandboxExtensionHelper dealloc](&v8, sel_dealloc);
}

- (int64_t)sandboxExtensionHandle
{
  return self->_sandboxExtensionHandle;
}

- (void)setSandboxExtensionHandle:(int64_t)a3
{
  self->_sandboxExtensionHandle = a3;
}

- (BOOL)didInit
{
  return self->_didInit;
}

- (NSString)logPath
{
  return self->_logPath;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logPath, 0);
}

@end
