@implementation MCMContainerSchemaActionMove

- (MCMContainerSchemaActionMove)initWithSourcePathArgument:(id)a3 destinationPathArgument:(id)a4 destFinalPathArgument:(id)a5 context:(id)a6
{
  id v9;
  id v10;
  MCMContainerSchemaActionMove *v11;
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
  v17.super_class = (Class)MCMContainerSchemaActionMove;
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
  id v11;
  id v12;
  NSURL *v13;
  BOOL v14;
  NSObject *v16;
  _QWORD v17[5];
  NSURL *v18;
  id v19;
  id v20;
  id v21;
  uint8_t buf[4];
  id v23;
  __int16 v24;
  id v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  -[NSURL path](self->_sourceURL, "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSURL path](self->_destURL, "path");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isEqualToString:", v6) & 1) != 0)
  {
    container_log_handle_for_category();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v23 = v5;
      _os_log_error_impl(&dword_1CF807000, v7, OS_LOG_TYPE_ERROR, "ignoring attempt to move [%@] to itself", buf, 0xCu);
    }

    v8 = 0;
    goto LABEL_6;
  }
  v9 = self->_sourceURL;
  destURL = self->_destURL;
  v21 = 0;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __49__MCMContainerSchemaActionMove_performWithError___block_invoke;
  v17[3] = &unk_1E8CB5C40;
  v17[4] = self;
  v18 = v9;
  v11 = v6;
  v19 = v11;
  v12 = v5;
  v20 = v12;
  v13 = v9;
  LOBYTE(destURL) = -[MCMContainerSchemaActionBase fixAndRetryIfPermissionsErrorWithURL:error:duringBlock:](self, "fixAndRetryIfPermissionsErrorWithURL:error:duringBlock:", destURL, &v21, v17);
  v8 = v21;

  if ((destURL & 1) != 0)
  {
LABEL_6:
    v14 = 1;
    goto LABEL_7;
  }
  container_log_handle_for_category();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412802;
    v23 = v12;
    v24 = 2112;
    v25 = v11;
    v26 = 2112;
    v27 = v8;
    _os_log_error_impl(&dword_1CF807000, v16, OS_LOG_TYPE_ERROR, "failed to move [%@] to [%@]: %@", buf, 0x20u);
  }

  if (a3)
  {
    v8 = objc_retainAutorelease(v8);
    v14 = 0;
    *a3 = v8;
  }
  else
  {
    v14 = 0;
  }
LABEL_7:

  return v14;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_destURL, 0);
  objc_storeStrong((id *)&self->_sourceURL, 0);
}

uint64_t __49__MCMContainerSchemaActionMove_performWithError___block_invoke(_QWORD *a1, void *a2, _QWORD *a3)
{
  id v5;
  void *v6;
  void *v7;
  char v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  _BOOL4 v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  int v25;
  void *v26;
  char v27;
  uint64_t v28;
  void *v29;
  _QWORD v31[4];
  id v32;
  id v33;
  id v34;
  _QWORD v35[5];
  id v36;
  id v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t (*v41)(uint64_t, uint64_t);
  void (*v42)(uint64_t);
  id v43;
  uint8_t buf[4];
  uint64_t v45;
  __int16 v46;
  uint64_t v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v38 = 0;
  v39 = &v38;
  v40 = 0x3032000000;
  v41 = __Block_byref_object_copy__7872;
  v42 = __Block_byref_object_dispose__7873;
  v43 = 0;
  objc_msgSend(v5, "URLByDeletingLastPathComponent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)a1[4];
  v37 = 0;
  v8 = objc_msgSend(v7, "makedirAtURL:followTerminalSymlink:error:", v6, 1, &v37);
  v9 = v37;
  if ((v8 & 1) == 0)
    goto LABEL_19;
  v10 = (void *)a1[4];
  v11 = a1[5];
  v36 = v9;
  v12 = MEMORY[0x1E0C809B0];
  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v35[2] = __49__MCMContainerSchemaActionMove_performWithError___block_invoke_1;
  v35[3] = &unk_1E8CB6740;
  v35[4] = &v38;
  objc_msgSend(v10, "fixAndRetryIfPermissionsErrorWithURL:error:duringBlock:", v11, &v36, v35);
  v13 = v36;

  v14 = (void *)v39[5];
  if (!v14)
  {
    objc_msgSend(v13, "domain");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v18, "isEqualToString:", *MEMORY[0x1E0CB2FE0]))
    {
      v19 = objc_msgSend(v13, "code") == 2;

      if (v19)
      {

        container_log_handle_for_category();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          v22 = a1[6];
          v21 = a1[7];
          *(_DWORD *)buf = 138412546;
          v45 = v21;
          v46 = 2112;
          v47 = v22;
          _os_log_impl(&dword_1CF807000, v20, OS_LOG_TYPE_INFO, "not moving: [%@] because it does not exist; leaving destination [%@]",
            buf,
            0x16u);
        }

        v13 = 0;
        goto LABEL_12;
      }
    }
    else
    {

    }
    goto LABEL_14;
  }
  if (!objc_msgSend(v14, "isEqualToString:", a1[6]))
  {
LABEL_14:
    +[MCMFileManager defaultManager](MCMFileManager, "defaultManager");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "itemExistsAtURL:", v5);

    if (!v25)
      goto LABEL_17;
    v26 = (void *)a1[4];
    v34 = v13;
    v27 = objc_msgSend(v26, "backupFileURL:error:", v5, &v34);
    v9 = v34;

    if ((v27 & 1) != 0)
    {
      v13 = v9;
LABEL_17:
      v29 = (void *)a1[4];
      v28 = a1[5];
      v33 = v13;
      v31[0] = v12;
      v31[1] = 3221225472;
      v31[2] = __49__MCMContainerSchemaActionMove_performWithError___block_invoke_3;
      v31[3] = &unk_1E8CB6768;
      v32 = v5;
      v23 = objc_msgSend(v29, "fixAndRetryIfPermissionsErrorWithURL:error:duringBlock:", v28, &v33, v31);
      v9 = v33;

      if (!a3)
        goto LABEL_22;
LABEL_20:
      if ((v23 & 1) == 0)
      {
        v13 = objc_retainAutorelease(v9);
        v23 = 0;
        *a3 = v13;
        goto LABEL_23;
      }
LABEL_22:
      v13 = v9;
      goto LABEL_23;
    }
LABEL_19:
    v23 = 0;
    if (!a3)
      goto LABEL_22;
    goto LABEL_20;
  }
  container_log_handle_for_category();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    v17 = a1[6];
    v16 = a1[7];
    *(_DWORD *)buf = 138412546;
    v45 = v16;
    v46 = 2112;
    v47 = v17;
    _os_log_impl(&dword_1CF807000, v15, OS_LOG_TYPE_INFO, "not moving: [%@] because it is a symlink to [%@]", buf, 0x16u);
  }

LABEL_12:
  v23 = 1;
LABEL_23:
  _Block_object_dispose(&v38, 8);

  return v23;
}

BOOL __49__MCMContainerSchemaActionMove_performWithError___block_invoke_1(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v5 = a2;
  +[MCMFileManager defaultManager](MCMFileManager, "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "targetOfSymbolicLinkAtURL:error:", v5, a3);
  v7 = objc_claimAutoreleasedReturnValue();

  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

  return *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) != 0;
}

uint64_t __49__MCMContainerSchemaActionMove_performWithError___block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  uint64_t v7;

  v5 = a2;
  +[MCMFileManager defaultManager](MCMFileManager, "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "moveItemIfExistsAtURL:toURL:error:", v5, *(_QWORD *)(a1 + 32), a3);

  return v7;
}

+ (id)actionIdentifier
{
  __CFString *v2;

  v2 = CFSTR("move");
  return CFSTR("move");
}

@end
