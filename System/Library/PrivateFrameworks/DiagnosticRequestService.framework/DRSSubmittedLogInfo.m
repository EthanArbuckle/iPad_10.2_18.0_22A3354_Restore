@implementation DRSSubmittedLogInfo

- (DRSSubmittedLogInfo)initWithPath:(const char *)a3 sandboxExtension:(const char *)a4 transferOwnership:(BOOL)a5
{
  DRSSubmittedLogInfo *v5;
  DRSSubmittedLogInfo *v9;
  uint64_t v10;
  NSString *path;
  uint64_t v12;
  NSString *sandboxExtension;
  objc_super v15;

  v5 = 0;
  if (a3 && a4)
  {
    v15.receiver = self;
    v15.super_class = (Class)DRSSubmittedLogInfo;
    v9 = -[DRSSubmittedLogInfo init](&v15, sel_init);
    if (v9)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a3);
      v10 = objc_claimAutoreleasedReturnValue();
      path = v9->_path;
      v9->_path = (NSString *)v10;

      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a4);
      v12 = objc_claimAutoreleasedReturnValue();
      sandboxExtension = v9->_sandboxExtension;
      v9->_sandboxExtension = (NSString *)v12;

      v9->_transferOwnership = a5;
    }
    self = v9;
    v5 = self;
  }

  return v5;
}

- (id)debugDescription
{
  void *v3;
  void *v4;
  void *v5;
  _BOOL4 v6;
  const __CFString *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[DRSSubmittedLogInfo path](self, "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[DRSSubmittedLogInfo sandboxExtension](self, "sandboxExtension");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[DRSSubmittedLogInfo transferOwnership](self, "transferOwnership");
  v7 = CFSTR("Copy");
  if (v6)
    v7 = CFSTR("Transfer");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@ %@"), v4, v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)submittedLogInfosFromPaths:(id)a3 sandboxExtensions:(id)a4 transferOwnerships:(id)a5 successOut:(BOOL *)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  const char *v16;
  const char *v17;
  id v18;
  const __CFString *v19;
  const __CFString *v20;
  const __CFString *v21;
  NSObject *v22;
  uint32_t v23;
  size_t count;
  size_t v26;
  size_t v27;
  size_t v28;
  void *v29;
  size_t v30;
  DRSSubmittedLogInfo *v31;
  const char *string;
  const char *v33;
  uint64_t v34;
  void *v35;
  NSObject *v36;
  int v37;
  size_t v38;
  __int16 v39;
  size_t v40;
  __int16 v41;
  const __CFString *v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = v11;
  *a6 = 1;
  if (v9 && v10 && v11)
  {
    v13 = MEMORY[0x1DF0B73D0](v9);
    v14 = MEMORY[0x1E0C812C8];
    if (v13 != MEMORY[0x1E0C812C8])
    {
      DPLogHandle_RequestError();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_signpost_enabled(v15))
      {
        LOWORD(v37) = 0;
        v16 = "SubmittedLogInfoFailureUnexpected xpcPathArray type";
        v17 = (const char *)&unk_1DBC04191;
LABEL_28:
        v22 = v15;
        v23 = 2;
        goto LABEL_29;
      }
      goto LABEL_30;
    }
    if (MEMORY[0x1DF0B73D0](v10) != v14)
    {
      DPLogHandle_RequestError();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_signpost_enabled(v15))
      {
        LOWORD(v37) = 0;
        v16 = "SubmittedLogInfoFailureUnexpected xpcSandboxExtensionsArray type";
        v17 = (const char *)&unk_1DBC04191;
        goto LABEL_28;
      }
LABEL_30:

      v18 = 0;
      *a6 = 0;
      goto LABEL_31;
    }
    if (MEMORY[0x1DF0B73D0](v12) != v14)
    {
      DPLogHandle_RequestError();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_signpost_enabled(v15))
      {
        LOWORD(v37) = 0;
        v16 = "SubmittedLogInfoFailureUnexpected xpcTransferBoolArray type";
        v17 = (const char *)&unk_1DBC04191;
        goto LABEL_28;
      }
      goto LABEL_30;
    }
    count = xpc_array_get_count(v9);
    v26 = xpc_array_get_count(v10);
    v27 = xpc_array_get_count(v12);
    v28 = v27;
    if (count == v26 && count == v27)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      if (count)
      {
        v30 = 0;
        while (1)
        {
          v31 = [DRSSubmittedLogInfo alloc];
          string = xpc_array_get_string(v9, v30);
          v33 = xpc_array_get_string(v10, v30);
          v34 = -[DRSSubmittedLogInfo initWithPath:sandboxExtension:transferOwnership:](v31, "initWithPath:sandboxExtension:transferOwnership:", string, v33, xpc_array_get_BOOL(v12, v30));
          if (!v34)
            break;
          v35 = (void *)v34;
          objc_msgSend(v29, "addObject:", v34);

          if (count == ++v30)
            goto LABEL_38;
        }
        DPLogHandle_RequestError();
        v36 = objc_claimAutoreleasedReturnValue();
        if (os_signpost_enabled(v36))
        {
          LOWORD(v37) = 0;
          _os_signpost_emit_with_name_impl(&dword_1DBB92000, v36, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "SubmittedLogInfoFailure", "Could not create new submitted log info\n", (uint8_t *)&v37, 2u);
        }

      }
      else
      {
LABEL_38:
        if (objc_msgSend(v29, "count"))
        {
          v18 = v29;
LABEL_46:

          goto LABEL_31;
        }
      }
      v18 = 0;
      *a6 = 0;
      goto LABEL_46;
    }
    DPLogHandle_RequestError();
    v15 = objc_claimAutoreleasedReturnValue();
    if (!os_signpost_enabled(v15))
      goto LABEL_30;
    v37 = 134349568;
    v38 = count;
    v39 = 2050;
    v40 = v26;
    v41 = 2050;
    v42 = (const __CFString *)v28;
    v16 = "SubmittedLogInfoFailure";
    v17 = "Inconsisted info counts:\nPaths: %{public}zu\nSandbox extensions: %{public}zu\nTransfer BOOLs: %{public}zu\n";
LABEL_21:
    v22 = v15;
    v23 = 32;
LABEL_29:
    _os_signpost_emit_with_name_impl(&dword_1DBB92000, v22, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, v16, v17, (uint8_t *)&v37, v23);
    goto LABEL_30;
  }
  if (v9 || v10 || v11)
  {
    DPLogHandle_RequestError();
    v15 = objc_claimAutoreleasedReturnValue();
    if (!os_signpost_enabled(v15))
      goto LABEL_30;
    v19 = CFSTR("Available");
    if (v9)
      v20 = CFSTR("Available");
    else
      v20 = CFSTR("Missing");
    if (v10)
      v21 = CFSTR("Available");
    else
      v21 = CFSTR("Missing");
    v37 = 138543874;
    v38 = (size_t)v20;
    v39 = 2114;
    v40 = (size_t)v21;
    if (!v12)
      v19 = CFSTR("Missing");
    v41 = 2114;
    v42 = v19;
    v16 = "SubmittedLogInfoFailure";
    v17 = "Could not generate submitted log info array due to missing input.\n"
          "Paths: %{public}@\n"
          "SandboxExtensions:%{public}@\n"
          "TransferBools:%{public}@";
    goto LABEL_21;
  }
  v18 = 0;
LABEL_31:

  return v18;
}

- (NSString)path
{
  return self->_path;
}

- (NSString)sandboxExtension
{
  return self->_sandboxExtension;
}

- (BOOL)transferOwnership
{
  return self->_transferOwnership;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sandboxExtension, 0);
  objc_storeStrong((id *)&self->_path, 0);
}

@end
