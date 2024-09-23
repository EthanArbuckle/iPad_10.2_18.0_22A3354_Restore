@implementation MCMContainerSchemaActionCopy

- (MCMContainerSchemaActionCopy)initWithSourcePathArgument:(id)a3 destinationPathArgument:(id)a4 destFinalPathArgument:(id)a5 context:(id)a6
{
  id v9;
  id v10;
  MCMContainerSchemaActionCopy *v11;
  uint64_t v12;
  NSURL *sourceURL;
  uint64_t v14;
  NSURL *destURL;
  objc_super v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v17.receiver = self;
  v17.super_class = (Class)MCMContainerSchemaActionCopy;
  v11 = -[MCMContainerSchemaActionBase initWithContext:](&v17, sel_initWithContext_, a6);
  if (v11)
  {
    objc_msgSend(v9, "fileURL");
    v12 = objc_claimAutoreleasedReturnValue();
    sourceURL = v11->_sourceURL;
    v11->_sourceURL = (NSURL *)v12;

    objc_msgSend(v10, "fileURL");
    v14 = objc_claimAutoreleasedReturnValue();
    destURL = v11->_destURL;
    v11->_destURL = (NSURL *)v14;

    if (!v11->_sourceURL || !v11->_destURL)
    {

      v11 = 0;
    }
  }

  return v11;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend((id)objc_opt_class(), "actionIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSURL path](self->_sourceURL, "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSURL path](self->_destURL, "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" [%@] → [%@]"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)performWithError:(id *)a3
{
  void *v5;
  void *v6;
  NSObject *v7;
  id v8;
  NSURL *v9;
  NSURL *destURL;
  NSURL *v11;
  BOOL v12;
  NSObject *v14;
  _QWORD v15[5];
  NSURL *v16;
  id v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  -[NSURL path](self->_sourceURL, "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSURL path](self->_destURL, "path");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToString:", v6))
  {
    container_log_handle_for_category();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v19 = v5;
      v20 = 2114;
      v21 = 0;
      _os_log_error_impl(&dword_1CF807000, v7, OS_LOG_TYPE_ERROR, "ignoring attempt to copy [%@] to itself: %{public}@", buf, 0x16u);
    }

    v8 = 0;
    goto LABEL_6;
  }
  v9 = self->_sourceURL;
  destURL = self->_destURL;
  v17 = 0;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __49__MCMContainerSchemaActionCopy_performWithError___block_invoke;
  v15[3] = &unk_1E8CB6790;
  v15[4] = self;
  v16 = v9;
  v11 = v9;
  LOBYTE(destURL) = -[MCMContainerSchemaActionBase fixAndRetryIfPermissionsErrorWithURL:error:duringBlock:](self, "fixAndRetryIfPermissionsErrorWithURL:error:duringBlock:", destURL, &v17, v15);
  v8 = v17;

  if ((destURL & 1) != 0)
  {
LABEL_6:
    v12 = 1;
    goto LABEL_7;
  }
  container_log_handle_for_category();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412802;
    v19 = v5;
    v20 = 2112;
    v21 = v6;
    v22 = 2114;
    v23 = v8;
    _os_log_error_impl(&dword_1CF807000, v14, OS_LOG_TYPE_ERROR, "failed to copy [%@] to [%@]: %{public}@", buf, 0x20u);
  }

  if (a3)
  {
    v8 = objc_retainAutorelease(v8);
    v12 = 0;
    *a3 = v8;
  }
  else
  {
    v12 = 0;
  }
LABEL_7:

  return v12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_destURL, 0);
  objc_storeStrong((id *)&self->_sourceURL, 0);
}

uint64_t __49__MCMContainerSchemaActionCopy_performWithError___block_invoke(uint64_t a1, void *a2, _QWORD *a3)
{
  id v5;
  void *v6;
  void *v7;
  int v8;
  id v9;
  void *v10;
  int v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  id v22;
  char v23;
  id v24[2];

  v24[1] = *(id *)MEMORY[0x1E0C80C00];
  v5 = a2;
  objc_msgSend(v5, "URLByDeletingLastPathComponent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(void **)(a1 + 32);
  v24[0] = 0;
  v8 = objc_msgSend(v7, "makedirAtURL:followTerminalSymlink:error:", v6, 1, v24);
  v9 = v24[0];
  if (v8)
  {
    v23 = 0;
    +[MCMFileManager defaultManager](MCMFileManager, "defaultManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v9;
    v11 = objc_msgSend(v10, "itemAtURL:followSymlinks:exists:isDirectory:error:", v5, 1, &v23, 0, &v22);
    v12 = v22;

    if (!v11)
    {
      v14 = 0;
      v9 = v12;
      if (!a3)
        goto LABEL_14;
      goto LABEL_12;
    }
    if (!v23)
      goto LABEL_6;
    v13 = *(void **)(a1 + 32);
    v21 = v12;
    v14 = objc_msgSend(v13, "backupFileURL:error:", v5, &v21);
    v9 = v21;

    if ((_DWORD)v14)
    {
      v12 = v9;
LABEL_6:
      v16 = *(void **)(a1 + 32);
      v15 = *(_QWORD *)(a1 + 40);
      v20 = v12;
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __49__MCMContainerSchemaActionCopy_performWithError___block_invoke_2;
      v18[3] = &unk_1E8CB6768;
      v19 = v5;
      v14 = objc_msgSend(v16, "fixAndRetryIfPermissionsErrorWithURL:error:duringBlock:", v15, &v20, v18);
      v9 = v20;

      if (!a3)
        goto LABEL_14;
      goto LABEL_12;
    }
  }
  else
  {
    v14 = 0;
  }
  if (!a3)
    goto LABEL_14;
LABEL_12:
  if ((v14 & 1) == 0)
    *a3 = objc_retainAutorelease(v9);
LABEL_14:

  return v14;
}

uint64_t __49__MCMContainerSchemaActionCopy_performWithError___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  uint64_t v7;

  v5 = a2;
  +[MCMFileManager defaultManager](MCMFileManager, "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "copyItemIfExistsAtURL:toURL:error:", v5, *(_QWORD *)(a1 + 32), a3);

  return v7;
}

+ (id)actionIdentifier
{
  __CFString *v2;

  v2 = CFSTR("copy");
  return CFSTR("copy");
}

@end
