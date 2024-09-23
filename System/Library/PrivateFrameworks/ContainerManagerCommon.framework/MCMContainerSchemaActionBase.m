@implementation MCMContainerSchemaActionBase

- (MCMContainerSchemaActionBase)initWithContext:(id)a3
{
  id v5;
  MCMContainerSchemaActionBase *v6;
  MCMContainerSchemaActionBase *v7;
  objc_super v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MCMContainerSchemaActionBase;
  v6 = -[MCMContainerSchemaActionBase init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_context, a3);

  return v7;
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<undefined action>"));
}

- (BOOL)backupFileURL:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  id v16;
  uint64_t v17;
  id v18;
  void *v19;
  id v20;
  BOOL v21;
  void *v22;
  int v23;
  void *v24;
  int v25;
  void *v26;
  void *v27;
  char v28;
  id v29;
  uint64_t v31;
  id v32;
  void *v33;
  id v34;
  _QWORD v35[4];
  id v36;
  id v37;
  _QWORD v38[4];
  id v39;
  id v40;
  _QWORD v41[4];
  id v42;
  _QWORD v43[4];
  id v44;
  MCMContainerSchemaActionBase *v45;
  _QWORD v46[4];
  id v47;
  stat v48;
  stat v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[MCMContainerSchemaActionBase context](self, "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "containerPath");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "containerDataURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "path");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "path");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCMContainerSchemaActionBase context](self, "context");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "homeDirectoryURL");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "path");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v11, "hasPrefix:", v14);

  if ((v15 & 1) == 0)
  {
    v43[0] = MEMORY[0x1E0C809B0];
    v43[1] = 3221225472;
    v43[2] = __52__MCMContainerSchemaActionBase_backupFileURL_error___block_invoke;
    v43[3] = &unk_1E8CB61F8;
    v44 = v6;
    v45 = self;
    __52__MCMContainerSchemaActionBase_backupFileURL_error___block_invoke((uint64_t)v43);
    v20 = (id)objc_claimAutoreleasedReturnValue();
    v21 = 0;
    v22 = v44;
    goto LABEL_5;
  }
  memset(&v49, 0, sizeof(v49));
  v16 = objc_retainAutorelease(v6);
  if (lstat((const char *)objc_msgSend(v16, "fileSystemRepresentation"), &v49))
  {
    v17 = MEMORY[0x1E0C809B0];
    v41[0] = MEMORY[0x1E0C809B0];
    v41[1] = 3221225472;
    v41[2] = __52__MCMContainerSchemaActionBase_backupFileURL_error___block_invoke_88;
    v41[3] = &unk_1E8CB67B8;
    v18 = v16;
    v42 = v18;
    __52__MCMContainerSchemaActionBase_backupFileURL_error___block_invoke_88((uint64_t)v41);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v38[0] = v17;
    v38[1] = 3221225472;
    v38[2] = __52__MCMContainerSchemaActionBase_backupFileURL_error___block_invoke_92;
    v38[3] = &unk_1E8CB61F8;
    v39 = v18;
    v40 = v19;
    __52__MCMContainerSchemaActionBase_backupFileURL_error___block_invoke_92((uint64_t)v38);
    v20 = (id)objc_claimAutoreleasedReturnValue();

    v21 = 0;
    v22 = v42;
    goto LABEL_5;
  }
  v23 = v49.st_mode & 0xF000;
  if (v23 != 0x4000 && v23 != 0x8000)
  {
    v29 = objc_retainAutorelease(v16);
    if (unlink((const char *)objc_msgSend(v29, "fileSystemRepresentation")) && *__error() != 2)
    {
      v31 = MEMORY[0x1E0C809B0];
      v46[0] = MEMORY[0x1E0C809B0];
      v46[1] = 3221225472;
      v46[2] = __52__MCMContainerSchemaActionBase_backupFileURL_error___block_invoke_96;
      v46[3] = &unk_1E8CB5998;
      v32 = v29;
      v48 = v49;
      v47 = v32;
      __52__MCMContainerSchemaActionBase_backupFileURL_error___block_invoke_96((uint64_t)v46);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v35[0] = v31;
      v35[1] = 3221225472;
      v35[2] = __52__MCMContainerSchemaActionBase_backupFileURL_error___block_invoke_100;
      v35[3] = &unk_1E8CB61F8;
      v36 = v32;
      v37 = v33;
      __52__MCMContainerSchemaActionBase_backupFileURL_error___block_invoke_100((uint64_t)v35);
      v20 = (id)objc_claimAutoreleasedReturnValue();

      v21 = 0;
      v22 = v47;
      goto LABEL_5;
    }
    goto LABEL_16;
  }
  objc_msgSend(v16, "path");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "hasPrefix:", v10);

  if (!v25)
  {
LABEL_16:
    v20 = 0;
    goto LABEL_17;
  }
  +[MCMFileManager defaultManager](MCMFileManager, "defaultManager");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "stripACLFromURL:error:", v16, 0);

  +[MCMFileManager defaultManager](MCMFileManager, "defaultManager");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = 0;
  v28 = objc_msgSend(v27, "removeItemAtURL:error:", v16, &v34);
  v20 = v34;

  if ((v28 & 1) != 0)
  {
LABEL_17:
    v21 = 1;
    goto LABEL_18;
  }
  objc_msgSend(v20, "domain");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v22, "isEqualToString:", *MEMORY[0x1E0CB2FE0]))
    v21 = objc_msgSend(v20, "code") == 2;
  else
    v21 = 0;
LABEL_5:

  if (a4 && !v21)
  {
    v20 = objc_retainAutorelease(v20);
    v21 = 0;
    *a4 = v20;
  }
LABEL_18:

  return v21;
}

- (BOOL)makedirAtURL:(id)a3 followTerminalSymlink:(BOOL)a4 error:(id *)a5
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  id v12;
  unint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  char v21;
  id v22;
  int v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  int v32;
  _BOOL4 v33;
  uint64_t v34;
  BOOL v35;
  id v37;
  void *v38;
  void *v40;
  void *v41;
  _BOOL4 v42;
  _QWORD v43[4];
  id v44;
  id v45;
  id v46;
  _QWORD v47[4];
  id v48;
  _QWORD v49[4];
  id v50;
  MCMContainerSchemaActionBase *v51;
  id v52;
  id v53;
  stat v54;
  uint64_t v55;

  v42 = a4;
  v55 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[MCMContainerSchemaActionBase context](self, "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "containerPath");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "containerDataURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "path");
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = v6;
  memset(&v54, 0, sizeof(v54));
  v11 = sysconf(120);
  v40 = v10;
  if (v11 < 1)
  {
    v22 = 0;
LABEL_17:
    v43[0] = MEMORY[0x1E0C809B0];
    v43[1] = 3221225472;
    v43[2] = __73__MCMContainerSchemaActionBase_makedirAtURL_followTerminalSymlink_error___block_invoke_112;
    v43[3] = &unk_1E8CB67B8;
    v44 = v40;
    __73__MCMContainerSchemaActionBase_makedirAtURL_followTerminalSymlink_error___block_invoke_112((uint64_t)v43);
    v34 = objc_claimAutoreleasedReturnValue();

    v38 = v44;
    v22 = (id)v34;
    goto LABEL_18;
  }
  v12 = 0;
  v13 = v11 + 1;
  while (1)
  {
    v10 = objc_retainAutorelease(v10);
    if (lstat((const char *)objc_msgSend(v10, "fileSystemRepresentation"), &v54))
    {
      if (*__error() != 2)
      {
        v47[0] = MEMORY[0x1E0C809B0];
        v47[1] = 3221225472;
        v47[2] = __73__MCMContainerSchemaActionBase_makedirAtURL_followTerminalSymlink_error___block_invoke_106;
        v47[3] = &unk_1E8CB67B8;
        v10 = v10;
        v48 = v10;
        __73__MCMContainerSchemaActionBase_makedirAtURL_followTerminalSymlink_error___block_invoke_106((uint64_t)v47);
        v22 = (id)objc_claimAutoreleasedReturnValue();

        v38 = v48;
        goto LABEL_18;
      }

      +[MCMFileManager defaultManager](MCMFileManager, "defaultManager");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[MCMContainerSchemaActionBase context](self, "context");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "posixMode");
      -[MCMContainerSchemaActionBase context](self, "context");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "posixOwner");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[MCMContainerSchemaActionBase context](self, "context");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "dataProtectionClass");
      v53 = 0;
      v21 = objc_msgSend(v14, "createDirectoryAtURL:withIntermediateDirectories:mode:owner:dataProtectionClass:error:", v10, 1, v16, v18, v20, &v53);
      v22 = v53;

      if ((v21 & 1) == 0)
      {
        v49[0] = MEMORY[0x1E0C809B0];
        v49[1] = 3221225472;
        v49[2] = __73__MCMContainerSchemaActionBase_makedirAtURL_followTerminalSymlink_error___block_invoke;
        v49[3] = &unk_1E8CB5A50;
        v10 = v10;
        v50 = v10;
        v51 = self;
        v52 = v22;
        v37 = v22;
        __73__MCMContainerSchemaActionBase_makedirAtURL_followTerminalSymlink_error___block_invoke((uint64_t)v49);
        v22 = (id)objc_claimAutoreleasedReturnValue();

        v38 = v50;
        goto LABEL_18;
      }
      goto LABEL_14;
    }
    v23 = v54.st_mode & 0xF000;
    if (v42 && v23 == 40960)
      break;
    if (v23 == 0x4000
      || (objc_msgSend(v10, "path"),
          v31 = (void *)objc_claimAutoreleasedReturnValue(),
          v32 = objc_msgSend(v31, "hasPrefix:", v41),
          v31,
          !v32))
    {
      v35 = 1;
      goto LABEL_22;
    }
    v45 = v12;
    v33 = -[MCMContainerSchemaActionBase backupFileURL:error:](self, "backupFileURL:error:", v10, &v45);
    v22 = v45;

    if (!v33)
      goto LABEL_19;
LABEL_14:
    --v13;
    v12 = v22;
    if (v13 <= 1)
      goto LABEL_17;
  }
  +[MCMFileManager defaultManager](MCMFileManager, "defaultManager");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = v12;
  objc_msgSend(v24, "targetOfSymbolicLinkAtURL:error:", v10, &v46);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v46;

  if (v25)
  {
    objc_msgSend(MEMORY[0x1E0CB3500], "URLPathAllowedCharacterSet");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "stringByAddingPercentEncodingWithAllowedCharacters:", v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    v28 = (void *)MEMORY[0x1E0C99E98];
    objc_msgSend(v10, "URLByDeletingLastPathComponent");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "URLWithString:relativeToURL:", v27, v29);
    v30 = objc_claimAutoreleasedReturnValue();

    v10 = (id)v30;
    goto LABEL_14;
  }
  v38 = 0;
LABEL_18:

LABEL_19:
  if (a5)
  {
    v12 = objc_retainAutorelease(v22);
    v35 = 0;
    *a5 = v12;
  }
  else
  {
    v35 = 0;
    v12 = v22;
  }
LABEL_22:

  return v35;
}

- (BOOL)fixAndRetryIfPermissionsErrorWithURL:(id)a3 error:(id *)a4 duringBlock:(id)a5
{
  id v8;
  uint64_t (**v9)(id, id, id *);
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  void *v22;
  char v23;
  char v24;

  v8 = a3;
  v9 = (uint64_t (**)(id, id, id *))a5;
  -[MCMContainerSchemaActionBase context](self, "context");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "containerPath");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[MCMContainerSchemaActionBase context](self, "context");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "identifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[MCMContainerSchemaActionBase context](self, "context");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "libraryRepair");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    objc_msgSend(v8, "path");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "containerRootURL");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "path");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v16, "hasPrefix:", v18);

    -[MCMContainerSchemaActionBase context](self, "context");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "libraryRepair");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v21;
    if (v19)
      v23 = objc_msgSend(v21, "fixAndRetryIfPermissionsErrorWithURL:containerPath:containerIdentifier:error:duringBlock:", v8, v11, v13, a4, v9);
    else
      v23 = objc_msgSend(v21, "fixAndRetryIfPermissionsErrorWithURL:error:duringBlock:", v8, a4, v9);
    v24 = v23;

  }
  else
  {
    v24 = v9[2](v9, v8, a4);
  }

  return v24;
}

- (BOOL)performWithError:(id *)a3
{
  void *v3;
  uint64_t v4;
  void *v5;
  objc_class *v6;
  void *v7;
  BOOL result;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("%@ was called on the base class %@"), v5, v7);

  __break(1u);
  return result;
}

- (MCMContainerSchemaContext)context
{
  return self->_context;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
}

id __73__MCMContainerSchemaActionBase_makedirAtURL_followTerminalSymlink_error___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  const char *v13;
  NSObject *v14;
  uint32_t v15;
  void *v16;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  uint64_t v21;
  _QWORD v22[3];
  _QWORD v23[4];

  v23[3] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0CB3940]);
  v3 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "context");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v2, "initWithFormat:", CFSTR("Failed to create sub-dir at %@ (protClass: %d)"), v3, objc_msgSend(v4, "dataProtectionClass"));

  v22[0] = CFSTR("FunctionName");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MCMContainerSchemaActionBase makedirAtURL:followTerminalSymlink:error:]_block_invoke");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v6;
  v23[1] = &unk_1E8CD6138;
  v7 = *MEMORY[0x1E0CB2D50];
  v22[1] = CFSTR("SourceFileLine");
  v22[2] = v7;
  v23[2] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (*(_QWORD *)(a1 + 48))
  {
    v9 = (void *)objc_msgSend(v8, "mutableCopy");
    objc_msgSend(v9, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 48), *MEMORY[0x1E0CB3388]);
    v10 = (void *)objc_msgSend(v9, "copy");

    if (*(_QWORD *)(a1 + 48))
    {
      container_log_handle_for_category();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        v12 = *(_QWORD *)(a1 + 48);
        *(_DWORD *)buf = 138543618;
        v19 = v5;
        v20 = 2114;
        v21 = v12;
        v13 = "%{public}@ (%{public}@)";
        v14 = v11;
        v15 = 22;
LABEL_9:
        _os_log_error_impl(&dword_1CF807000, v14, OS_LOG_TYPE_ERROR, v13, buf, v15);
        goto LABEL_7;
      }
      goto LABEL_7;
    }
  }
  else
  {
    v10 = v8;
  }
  container_log_handle_for_category();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v19 = v5;
    v13 = "%{public}@";
    v14 = v11;
    v15 = 12;
    goto LABEL_9;
  }
LABEL_7:

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MCMErrorDomain"), 6, v10);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

id __73__MCMContainerSchemaActionBase_makedirAtURL_followTerminalSymlink_error___block_invoke_106(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  _QWORD v10[3];
  _QWORD v11[4];

  v11[3] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(*(id *)(a1 + 32), "path");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithFormat:", CFSTR("Failed to stat [%@] when creating directories"), v3);

  v10[0] = CFSTR("FunctionName");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MCMContainerSchemaActionBase makedirAtURL:followTerminalSymlink:error:]_block_invoke");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v5;
  v11[1] = &unk_1E8CD6150;
  v6 = *MEMORY[0x1E0CB2D50];
  v10[1] = CFSTR("SourceFileLine");
  v10[2] = v6;
  v11[2] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], *__error(), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id __73__MCMContainerSchemaActionBase_makedirAtURL_followTerminalSymlink_error___block_invoke_112(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  _QWORD v10[3];
  _QWORD v11[4];

  v11[3] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(*(id *)(a1 + 32), "path");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithFormat:", CFSTR("failed to resolve [%@] after %ld tries"), v3, sysconf(120));

  v10[0] = CFSTR("FunctionName");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MCMContainerSchemaActionBase makedirAtURL:followTerminalSymlink:error:]_block_invoke");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v5;
  v11[1] = &unk_1E8CD6168;
  v6 = *MEMORY[0x1E0CB2D50];
  v10[1] = CFSTR("SourceFileLine");
  v10[2] = v6;
  v11[2] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 62, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id __52__MCMContainerSchemaActionBase_backupFileURL_error___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  _QWORD v13[3];
  _QWORD v14[4];

  v14[3] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(*(id *)(a1 + 32), "path");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "context");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "homeDirectoryURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "path");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v2, "initWithFormat:", CFSTR("Request to backup file [%@] not in user's home directory: [%@]"), v3, v6);

  v13[0] = CFSTR("FunctionName");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MCMContainerSchemaActionBase backupFileURL:error:]_block_invoke");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v8;
  v14[1] = &unk_1E8CD60C0;
  v9 = *MEMORY[0x1E0CB2D50];
  v13[1] = CFSTR("SourceFileLine");
  v13[2] = v9;
  v14[2] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MCMErrorDomain"), 82, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

id __52__MCMContainerSchemaActionBase_backupFileURL_error___block_invoke_88(uint64_t a1)
{
  id v2;
  void *v3;
  int *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  _QWORD v11[3];
  _QWORD v12[4];

  v12[3] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(*(id *)(a1 + 32), "path");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = __error();
  v5 = (void *)objc_msgSend(v2, "initWithFormat:", CFSTR("Could not read file to back up: [%@]: %s"), v3, strerror(*v4));

  v11[0] = CFSTR("FunctionName");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MCMContainerSchemaActionBase backupFileURL:error:]_block_invoke");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v6;
  v12[1] = &unk_1E8CD60D8;
  v7 = *MEMORY[0x1E0CB2D50];
  v11[1] = CFSTR("SourceFileLine");
  v11[2] = v7;
  v12[2] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], *__error(), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

id __52__MCMContainerSchemaActionBase_backupFileURL_error___block_invoke_92(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  _QWORD v12[3];
  _QWORD v13[4];

  v13[3] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(*(id *)(a1 + 32), "path");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithFormat:", CFSTR("Could not backup file: [%@]"), v3);

  v12[0] = CFSTR("FunctionName");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MCMContainerSchemaActionBase backupFileURL:error:]_block_invoke");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v5;
  v13[1] = &unk_1E8CD60F0;
  v6 = *MEMORY[0x1E0CB2D50];
  v12[1] = CFSTR("SourceFileLine");
  v12[2] = v6;
  v13[2] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (*(_QWORD *)(a1 + 40))
  {
    v8 = (void *)objc_msgSend(v7, "mutableCopy");
    objc_msgSend(v8, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 40), *MEMORY[0x1E0CB3388]);
    v9 = objc_msgSend(v8, "copy");

    v7 = (void *)v9;
  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MCMErrorDomain"), 82, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

id __52__MCMContainerSchemaActionBase_backupFileURL_error___block_invoke_96(uint64_t a1)
{
  id v2;
  void *v3;
  uint64_t v4;
  int *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  _QWORD v12[3];
  _QWORD v13[4];

  v13[3] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(*(id *)(a1 + 32), "path");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(unsigned __int16 *)(a1 + 44);
  v5 = __error();
  v6 = (void *)objc_msgSend(v2, "initWithFormat:", CFSTR("Could not unlink path to back up [%@], mode = 0x%x: %s"), v3, v4, strerror(*v5));

  v12[0] = CFSTR("FunctionName");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MCMContainerSchemaActionBase backupFileURL:error:]_block_invoke");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v7;
  v13[1] = &unk_1E8CD6108;
  v8 = *MEMORY[0x1E0CB2D50];
  v12[1] = CFSTR("SourceFileLine");
  v12[2] = v8;
  v13[2] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], *__error(), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

id __52__MCMContainerSchemaActionBase_backupFileURL_error___block_invoke_100(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  _QWORD v12[3];
  _QWORD v13[4];

  v13[3] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(*(id *)(a1 + 32), "path");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithFormat:", CFSTR("Could not backup file: [%@]"), v3);

  v12[0] = CFSTR("FunctionName");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MCMContainerSchemaActionBase backupFileURL:error:]_block_invoke");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v5;
  v13[1] = &unk_1E8CD6120;
  v6 = *MEMORY[0x1E0CB2D50];
  v12[1] = CFSTR("SourceFileLine");
  v12[2] = v6;
  v13[2] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (*(_QWORD *)(a1 + 40))
  {
    v8 = (void *)objc_msgSend(v7, "mutableCopy");
    objc_msgSend(v8, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 40), *MEMORY[0x1E0CB3388]);
    v9 = objc_msgSend(v8, "copy");

    v7 = (void *)v9;
  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MCMErrorDomain"), 82, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)actionWithName:(id)a3 arguments:(id)a4 context:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  objc_class *v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  _QWORD v23[4];
  id v24;
  _QWORD v25[4];
  id v26;
  _QWORD v27[4];
  id v28;
  id v29;
  id v30;
  id v31;
  id v32[2];

  v32[1] = *(id *)MEMORY[0x1E0C80C00];
  v10 = a5;
  v11 = a3;
  v12 = (void *)objc_msgSend(a4, "mutableCopy");
  if (actionWithName_arguments_context_error__onceToken != -1)
    dispatch_once(&actionWithName_arguments_context_error__onceToken, &__block_literal_global_5788);
  objc_msgSend(v11, "lowercaseString");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (objc_class *)objc_msgSend((id)actionWithName_arguments_context_error__classLookup, "objectForKeyedSubscript:", v13);
  if (v14)
  {
    v15 = [v14 alloc];
    if (v15)
    {
      v16 = v15;
      if (objc_msgSend(v15, "conformsToProtocol:", &unk_1EFBC4A70))
      {
        v31 = 0;
        v32[0] = 0;
        v30 = 0;
        objc_msgSend(a1, "_resolveArguments:toSourcePathArgument:destPathArgument:destFinalPathArgument:context:", v12, v32, &v31, &v30, v10);
        v17 = v32[0];
        v18 = v31;
        v19 = v30;
        v20 = (void *)objc_msgSend(v16, "initWithSourcePathArgument:destinationPathArgument:destFinalPathArgument:context:", v17, v18, v19, v10);

      }
      else
      {
        if (!objc_msgSend(v16, "conformsToProtocol:", &unk_1EFBBDFB0))
        {

          v27[0] = MEMORY[0x1E0C809B0];
          v27[1] = 3221225472;
          v27[2] = __71__MCMContainerSchemaActionBase_actionWithName_arguments_context_error___block_invoke_2;
          v27[3] = &unk_1E8CB67B8;
          v28 = v13;
          __71__MCMContainerSchemaActionBase_actionWithName_arguments_context_error___block_invoke_2((uint64_t)v27);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = 0;
          v17 = v28;
          goto LABEL_13;
        }
        v29 = 0;
        objc_msgSend(a1, "_resolveArguments:toPathArgument:context:", v12, &v29, v10);
        v17 = v29;
        v20 = (void *)objc_msgSend(v16, "initWithPathArgument:context:", v17, v10);
      }
      v21 = 0;
    }
    else
    {
      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = __71__MCMContainerSchemaActionBase_actionWithName_arguments_context_error___block_invoke_79;
      v23[3] = &unk_1E8CB67B8;
      v24 = v13;
      __71__MCMContainerSchemaActionBase_actionWithName_arguments_context_error___block_invoke_79((uint64_t)v23);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 0;
      v17 = v24;
    }
  }
  else
  {
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __71__MCMContainerSchemaActionBase_actionWithName_arguments_context_error___block_invoke_75;
    v25[3] = &unk_1E8CB67B8;
    v26 = v13;
    __71__MCMContainerSchemaActionBase_actionWithName_arguments_context_error___block_invoke_75((uint64_t)v25);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 0;
    v17 = v26;
  }
LABEL_13:

  if (a6 && !v20)
    *a6 = objc_retainAutorelease(v21);

  return v20;
}

+ (id)actionIdentifier
{
  return CFSTR("<unknown action>");
}

+ (void)_resolveArguments:(id)a3 toSourcePathArgument:(id *)a4 destPathArgument:(id *)a5 destFinalPathArgument:(id *)a6 context:(id)a7
{
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  char v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  char v26;
  id v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  id *v42;
  id v43;

  v43 = a3;
  v11 = a7;
  objc_msgSend(v43, "firstObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
    objc_msgSend(v43, "removeObjectAtIndex:", 0);
  objc_msgSend(v43, "firstObject");
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)v13;
  if (v13)
    v15 = (void *)v13;
  else
    v15 = v12;
  v16 = v15;

  v17 = v16;
  if (v12)
  {
    objc_msgSend(v12, "string");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "hasPrefix:", CFSTR("/"));

    if ((v19 & 1) == 0)
    {
      objc_msgSend(v11, "homeDirectoryURL");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "path");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "string");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "stringByAppendingPathComponent:", v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      v24 = objc_alloc((Class)objc_opt_class());
      v12 = (void *)objc_msgSend(v24, "initWithString:", v23);

    }
  }
  if (!v17)
  {
    v27 = 0;
    if (!a4)
      goto LABEL_15;
    goto LABEL_14;
  }
  objc_msgSend(v17, "string");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "hasPrefix:", CFSTR("/"));

  if ((v26 & 1) != 0)
  {
    v27 = v17;
    if (!a4)
      goto LABEL_15;
LABEL_14:
    *a4 = objc_retainAutorelease(v12);
    goto LABEL_15;
  }
  v42 = a6;
  objc_msgSend(v17, "string");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "containerPath");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "containerDataURL");
  v30 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v30, "path");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "stringByAppendingPathComponent:", v28);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  v33 = objc_alloc((Class)objc_opt_class());
  v27 = (id)objc_msgSend(v33, "initWithString:", v32);

  objc_msgSend(v11, "containerPath");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "finalContainerPath");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v30) = objc_msgSend(v34, "isEqual:", v35);

  v17 = v27;
  if ((v30 & 1) == 0)
  {
    objc_msgSend(v11, "finalContainerPath");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "containerDataURL");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "path");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "stringByAppendingPathComponent:", v28);
    v41 = v28;
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    v40 = objc_alloc((Class)objc_opt_class());
    v17 = (id)objc_msgSend(v40, "initWithString:", v39);

    v28 = v41;
  }

  a6 = v42;
  if (a4)
    goto LABEL_14;
LABEL_15:
  if (a5)
    *a5 = objc_retainAutorelease(v27);
  if (a6)
    *a6 = objc_retainAutorelease(v17);

}

+ (void)_resolveArguments:(id)a3 toPathArgument:(id *)a4 context:(id)a5
{
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;

  v16 = a5;
  objc_msgSend(a3, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "string");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "hasPrefix:", CFSTR("/"));

  if ((v9 & 1) == 0)
  {
    objc_msgSend(v16, "containerPath");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "containerDataURL");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "path");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "string");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringByAppendingPathComponent:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = objc_alloc((Class)objc_opt_class());
    v7 = (void *)objc_msgSend(v15, "initWithString:", v14);

  }
  if (a4)
    *a4 = objc_retainAutorelease(v7);

}

id __71__MCMContainerSchemaActionBase_actionWithName_arguments_context_error___block_invoke_2(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  void *v6;
  uint8_t buf[4];
  void *v9;
  _QWORD v10[3];
  _QWORD v11[4];

  v11[3] = *MEMORY[0x1E0C80C00];
  v1 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("unknown initializer for action [%@]"), *(_QWORD *)(a1 + 32));
  v10[0] = CFSTR("FunctionName");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "+[MCMContainerSchemaActionBase actionWithName:arguments:context:error:]_block_invoke_2");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v2;
  v11[1] = &unk_1E8CD6078;
  v3 = *MEMORY[0x1E0CB2D50];
  v10[1] = CFSTR("SourceFileLine");
  v10[2] = v3;
  v11[2] = v1;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  container_log_handle_for_category();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v9 = v1;
    _os_log_error_impl(&dword_1CF807000, v5, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MCMErrorDomain"), 81, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id __71__MCMContainerSchemaActionBase_actionWithName_arguments_context_error___block_invoke_75(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  void *v6;
  uint8_t buf[4];
  void *v9;
  _QWORD v10[3];
  _QWORD v11[4];

  v11[3] = *MEMORY[0x1E0C80C00];
  v1 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("unknown action [%@]"), *(_QWORD *)(a1 + 32));
  v10[0] = CFSTR("FunctionName");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "+[MCMContainerSchemaActionBase actionWithName:arguments:context:error:]_block_invoke");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v2;
  v11[1] = &unk_1E8CD6090;
  v3 = *MEMORY[0x1E0CB2D50];
  v10[1] = CFSTR("SourceFileLine");
  v10[2] = v3;
  v11[2] = v1;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  container_log_handle_for_category();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v9 = v1;
    _os_log_error_impl(&dword_1CF807000, v5, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MCMErrorDomain"), 81, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id __71__MCMContainerSchemaActionBase_actionWithName_arguments_context_error___block_invoke_79(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  void *v6;
  uint8_t buf[4];
  void *v9;
  _QWORD v10[3];
  _QWORD v11[4];

  v11[3] = *MEMORY[0x1E0C80C00];
  v1 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("action [%@] missing argument"), *(_QWORD *)(a1 + 32));
  v10[0] = CFSTR("FunctionName");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "+[MCMContainerSchemaActionBase actionWithName:arguments:context:error:]_block_invoke");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v2;
  v11[1] = &unk_1E8CD60A8;
  v3 = *MEMORY[0x1E0CB2D50];
  v10[1] = CFSTR("SourceFileLine");
  v10[2] = v3;
  v11[2] = v1;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  container_log_handle_for_category();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v9 = v1;
    _os_log_error_impl(&dword_1CF807000, v5, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MCMErrorDomain"), 81, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

void __71__MCMContainerSchemaActionBase_actionWithName_arguments_context_error___block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[8];
  _QWORD v11[9];

  v11[8] = *MEMORY[0x1E0C80C00];
  +[MCMContainerSchemaActionMove actionIdentifier](MCMContainerSchemaActionMove, "actionIdentifier");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v0;
  v11[0] = objc_opt_class();
  +[MCMContainerSchemaActionMoveContents actionIdentifier](MCMContainerSchemaActionMoveContents, "actionIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v1;
  v11[1] = objc_opt_class();
  +[MCMContainerSchemaActionCopy actionIdentifier](MCMContainerSchemaActionCopy, "actionIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v10[2] = v2;
  v11[2] = objc_opt_class();
  +[MCMContainerSchemaActionCopyContents actionIdentifier](MCMContainerSchemaActionCopyContents, "actionIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10[3] = v3;
  v11[3] = objc_opt_class();
  +[MCMContainerSchemaActionSymlink actionIdentifier](MCMContainerSchemaActionSymlink, "actionIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[4] = v4;
  v11[4] = objc_opt_class();
  +[MCMContainerSchemaActionUnlink actionIdentifier](MCMContainerSchemaActionUnlink, "actionIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[5] = v5;
  v11[5] = objc_opt_class();
  +[MCMContainerSchemaActionMkdir actionIdentifier](MCMContainerSchemaActionMkdir, "actionIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[6] = v6;
  v11[6] = objc_opt_class();
  +[MCMContainerSchemaActionStopBackupExclude actionIdentifier](MCMContainerSchemaActionStopBackupExclude, "actionIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[7] = v7;
  v11[7] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 8);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)actionWithName_arguments_context_error__classLookup;
  actionWithName_arguments_context_error__classLookup = v8;

}

@end
