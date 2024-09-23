@implementation MCMContainerSchemaActionMoveContents

- (MCMContainerSchemaActionMoveContents)initWithSourcePathArgument:(id)a3 destinationPathArgument:(id)a4 destFinalPathArgument:(id)a5 context:(id)a6
{
  id v9;
  id v10;
  MCMContainerSchemaActionMoveContents *v11;
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
  v17.super_class = (Class)MCMContainerSchemaActionMoveContents;
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
  BOOL v9;
  NSURL *v10;
  NSURL *destURL;
  NSURL *v12;
  _QWORD v14[5];
  NSURL *v15;
  id v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
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
      v18 = v5;
      v19 = 2112;
      v20 = 0;
      _os_log_error_impl(&dword_1CF807000, v7, OS_LOG_TYPE_ERROR, "ignoring attempt to move [%@] to itself: %@", buf, 0x16u);
    }

    v8 = 0;
    v9 = 1;
  }
  else
  {
    v10 = self->_sourceURL;
    destURL = self->_destURL;
    v16 = 0;
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __57__MCMContainerSchemaActionMoveContents_performWithError___block_invoke;
    v14[3] = &unk_1E8CB6790;
    v14[4] = self;
    v15 = v10;
    v12 = v10;
    v9 = -[MCMContainerSchemaActionBase fixAndRetryIfPermissionsErrorWithURL:error:duringBlock:](self, "fixAndRetryIfPermissionsErrorWithURL:error:duringBlock:", destURL, &v16, v14);
    v8 = v16;

    if (a3 && !v9)
    {
      v8 = objc_retainAutorelease(v8);
      v9 = 0;
      *a3 = v8;
    }
  }

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_destURL, 0);
  objc_storeStrong((id *)&self->_sourceURL, 0);
}

BOOL __57__MCMContainerSchemaActionMoveContents_performWithError___block_invoke(uint64_t a1, void *a2, _QWORD *a3)
{
  void *v4;
  uint64_t v5;
  char v6;
  id v7;
  void *v8;
  void *v9;
  int v10;
  id v11;
  id v12;
  uint64_t v13;
  _BOOL4 v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  int v25;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v30;
  void *v31;
  id obj;
  uint64_t v33;
  id v35;
  _QWORD v36[4];
  id v37;
  id v38;
  id v39;
  id v40;
  char v41;
  id v42;
  _QWORD v43[5];
  id v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t (*v48)(uint64_t, uint64_t);
  void (*v49)(uint64_t);
  id v50;
  uint8_t buf[4];
  void *v52;
  __int16 v53;
  void *v54;
  __int16 v55;
  id v56;
  _BYTE v57[128];
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v35 = a2;
  v45 = 0;
  v46 = &v45;
  v47 = 0x3032000000;
  v48 = __Block_byref_object_copy__6405;
  v49 = __Block_byref_object_dispose__6406;
  v50 = 0;
  v4 = *(void **)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v43[4] = &v45;
  v44 = 0;
  v43[0] = MEMORY[0x1E0C809B0];
  v43[1] = 3221225472;
  v43[2] = __57__MCMContainerSchemaActionMoveContents_performWithError___block_invoke_1;
  v43[3] = &unk_1E8CB6740;
  v6 = objc_msgSend(v4, "fixAndRetryIfPermissionsErrorWithURL:error:duringBlock:", v5, &v44, v43);
  v7 = v44;
  v8 = v7;
  if ((v6 & 1) != 0)
  {
    v9 = *(void **)(a1 + 32);
    v42 = v8;
    v10 = objc_msgSend(v9, "makedirAtURL:followTerminalSymlink:error:", v35, 1, &v42);
    v11 = v42;

    if (v10)
    {
      v60 = 0u;
      v61 = 0u;
      v58 = 0u;
      v59 = 0u;
      v12 = (id)v46[5];
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v58, v57, 16);
      if (v13)
      {
        LOBYTE(v14) = 0;
        obj = v12;
        v33 = *(_QWORD *)v59;
        while (2)
        {
          for (i = 0; i != v13; ++i)
          {
            if (*(_QWORD *)v59 != v33)
              objc_enumerationMutation(obj);
            v16 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * i);
            v17 = *(void **)(a1 + 40);
            objc_msgSend(v16, "lastPathComponent", obj);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "URLByAppendingPathComponent:isDirectory:", v18, 0);
            v19 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v16, "lastPathComponent");
            v20 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v35, "URLByAppendingPathComponent:isDirectory:", v20, 0);
            v21 = (id)objc_claimAutoreleasedReturnValue();

            v41 = 0;
            +[MCMFileManager defaultManager](MCMFileManager, "defaultManager");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v40 = v11;
            LOBYTE(v20) = objc_msgSend(v22, "itemAtURL:followSymlinks:exists:isDirectory:error:", v21, 1, &v41, 0, &v40);
            v23 = v40;

            if ((v20 & 1) == 0)
            {
              v11 = v23;
LABEL_25:

              v8 = v11;
              v27 = obj;
              goto LABEL_26;
            }
            if (v41)
            {
              v24 = *(void **)(a1 + 32);
              v39 = v23;
              v25 = objc_msgSend(v24, "backupFileURL:error:", v21, &v39);
              v11 = v39;

              v23 = v11;
              if (!v25)
                goto LABEL_25;
            }
            v26 = *(void **)(a1 + 32);
            v38 = v23;
            v36[0] = MEMORY[0x1E0C809B0];
            v36[1] = 3221225472;
            v36[2] = __57__MCMContainerSchemaActionMoveContents_performWithError___block_invoke_2;
            v36[3] = &unk_1E8CB6768;
            v21 = v21;
            v37 = v21;
            LOBYTE(v26) = objc_msgSend(v26, "fixAndRetryIfPermissionsErrorWithURL:error:duringBlock:", v19, &v38, v36);
            v11 = v38;

            if ((v26 & 1) == 0)
            {
              container_log_handle_for_category();
              v28 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
              {
                objc_msgSend(v19, "path");
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v21, "path");
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412802;
                v52 = v30;
                v53 = 2112;
                v54 = v31;
                v55 = 2112;
                v56 = v11;
                _os_log_error_impl(&dword_1CF807000, v28, OS_LOG_TYPE_ERROR, "failed to move [%@] to [%@]: %@", buf, 0x20u);

              }
              LOBYTE(v14) = 0;
              goto LABEL_25;
            }

            LOBYTE(v14) = 1;
          }
          v12 = obj;
          v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v58, v57, 16);
          if (v13)
            continue;
          break;
        }
      }

      goto LABEL_18;
    }
    LOBYTE(v14) = 0;
    v8 = v11;
  }
  else
  {
    objc_msgSend(v7, "domain");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v27, "isEqualToString:", *MEMORY[0x1E0CB2FE0]))
    {
      v14 = objc_msgSend(v8, "code") == 2;

      if (v14)
      {

        v11 = 0;
LABEL_18:
        LOBYTE(v14) = 1;
        goto LABEL_31;
      }
    }
    else
    {
      LOBYTE(v14) = 0;
LABEL_26:

    }
  }
  if (!a3 || v14)
  {
    v11 = v8;
  }
  else
  {
    v11 = objc_retainAutorelease(v8);
    LOBYTE(v14) = 0;
    *a3 = v11;
  }
LABEL_31:
  _Block_object_dispose(&v45, 8);

  return v14;
}

BOOL __57__MCMContainerSchemaActionMoveContents_performWithError___block_invoke_1(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v5 = a2;
  +[MCMFileManager defaultManager](MCMFileManager, "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "urlsForItemsInDirectoryAtURL:error:", v5, a3);
  v7 = objc_claimAutoreleasedReturnValue();

  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

  return *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) != 0;
}

uint64_t __57__MCMContainerSchemaActionMoveContents_performWithError___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
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

  v2 = CFSTR("move-contents");
  return CFSTR("move-contents");
}

@end
