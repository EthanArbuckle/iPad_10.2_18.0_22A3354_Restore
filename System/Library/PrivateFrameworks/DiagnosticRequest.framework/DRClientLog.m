@implementation DRClientLog

- (id)_checkPath
{
  void *v3;
  void *v4;
  void *v5;
  char v6;
  NSObject *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void **v14;
  uint64_t *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  char v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  int v32;
  void *v33;
  uint64_t v34;
  _QWORD v35[2];

  v35[1] = *MEMORY[0x1E0C80C00];
  -[DRClientLog path](self, "path");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v27 = 0;
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[DRClientLog path](self, "path");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "fileExistsAtPath:isDirectory:", v5, &v27);

    if ((v6 & 1) != 0)
    {
      if (!v27)
        return 0;
      DPLogHandle_ClientError();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_signpost_enabled(v7))
      {
        -[DRClientLog path](self, "path");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = 138543362;
        v33 = v8;
        _os_signpost_emit_unreliably_with_name_impl();

      }
      v9 = objc_alloc(MEMORY[0x1E0CB3940]);
      -[DRClientLog path](self, "path");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)objc_msgSend(v9, "initWithFormat:", CFSTR("Log file '%@' is a directory"), v10);

      v12 = (void *)MEMORY[0x1E0CB35C8];
      v28 = *MEMORY[0x1E0CB2D50];
      v29 = v11;
      v13 = (void *)MEMORY[0x1E0C99D80];
      v14 = &v29;
      v15 = &v28;
    }
    else
    {
      DPLogHandle_ClientError();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_signpost_enabled(v21))
      {
        -[DRClientLog path](self, "path");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = 138543362;
        v33 = v22;
        _os_signpost_emit_unreliably_with_name_impl();

      }
      v23 = objc_alloc(MEMORY[0x1E0CB3940]);
      -[DRClientLog path](self, "path");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)objc_msgSend(v23, "initWithFormat:", CFSTR("Log file '%@' does not exist"), v24);

      v12 = (void *)MEMORY[0x1E0CB35C8];
      v30 = *MEMORY[0x1E0CB2D50];
      v31 = v11;
      v13 = (void *)MEMORY[0x1E0C99D80];
      v14 = &v31;
      v15 = &v30;
    }
    objc_msgSend(v13, "dictionaryWithObjects:forKeys:count:", v14, v15, 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "errorWithDomain:code:userInfo:", CFSTR("DRClientLogError"), 0, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    return v26;
  }
  else
  {
    DPLogHandle_ClientError();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v16))
    {
      LOWORD(v32) = 0;
      _os_signpost_emit_unreliably_with_name_impl();
    }

    v17 = (void *)MEMORY[0x1E0CB35C8];
    v34 = *MEMORY[0x1E0CB2D50];
    v35[0] = CFSTR("Log path not provided by client");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v35, &v34, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "errorWithDomain:code:userInfo:", CFSTR("DRClientLogError"), 0, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    return v19;
  }
}

+ (id)sandboxExtensionForLog:(id)a3 transferOwnership:(BOOL)a4
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  NSObject *v8;

  v4 = objc_retainAutorelease(a3);
  objc_msgSend(v4, "UTF8String");
  v5 = sandbox_extension_issue_file();
  if (v5)
  {
    v6 = (void *)v5;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    free(v6);
  }
  else
  {
    DPLogHandle_ClientError();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v8))
      _os_signpost_emit_unreliably_with_name_impl();

    v7 = 0;
  }

  return v7;
}

- (DRClientLog)initWithPath:(id)a3 transferOwnership:(BOOL)a4 errorOut:(id *)a5
{
  id v9;
  DRClientLog *v10;
  DRClientLog *v11;
  void *v12;
  void *v13;
  DRClientLog *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSString *sandboxExtension;
  void *v19;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  objc_super v26;
  uint64_t v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v26.receiver = self;
  v26.super_class = (Class)DRClientLog;
  v10 = -[DRClientLog init](&v26, sel_init);
  v11 = v10;
  if (!v10)
    goto LABEL_7;
  objc_storeStrong((id *)&v10->_path, a3);
  -[DRClientLog _checkPath](v11, "_checkPath");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (!v12)
  {
    v11->_transferOwnership = a4;
    v15 = (void *)objc_opt_class();
    -[DRClientLog path](v11, "path");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "sandboxExtensionForLog:transferOwnership:", v16, -[DRClientLog transferOwnership](v11, "transferOwnership"));
    v17 = objc_claimAutoreleasedReturnValue();
    sandboxExtension = v11->_sandboxExtension;
    v11->_sandboxExtension = (NSString *)v17;

    -[DRClientLog sandboxExtension](v11, "sandboxExtension");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v19)
    {
      if (a5)
      {
        v21 = (void *)MEMORY[0x1E0CB3940];
        -[DRClientLog path](v11, "path");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "stringWithFormat:", CFSTR("Could not create sandbox extension for '%@'. This may be due to lack of sufficient permissions to access the file."), v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        v24 = (void *)MEMORY[0x1E0CB35C8];
        v27 = *MEMORY[0x1E0CB2D50];
        v28[0] = v23;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, &v27, 1);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "errorWithDomain:code:userInfo:", CFSTR("DRClientLogError"), 0, v25);
        *a5 = (id)objc_claimAutoreleasedReturnValue();

      }
      goto LABEL_5;
    }
LABEL_7:
    v14 = v11;
    goto LABEL_8;
  }
  if (a5)
    *a5 = objc_retainAutorelease(v12);
LABEL_5:

  v14 = 0;
LABEL_8:

  return v14;
}

- (id)description
{
  id v3;
  uint64_t v4;
  const char *v5;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v4 = objc_opt_class();
  if (self->_transferOwnership)
    v5 = "Y";
  else
    v5 = "N";
  return (id)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@: %@, transfer=%s >"), v4, self->_path, v5);
}

- (NSString)path
{
  return self->_path;
}

- (BOOL)transferOwnership
{
  return self->_transferOwnership;
}

- (NSString)sandboxExtension
{
  return self->_sandboxExtension;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sandboxExtension, 0);
  objc_storeStrong((id *)&self->_path, 0);
}

@end
