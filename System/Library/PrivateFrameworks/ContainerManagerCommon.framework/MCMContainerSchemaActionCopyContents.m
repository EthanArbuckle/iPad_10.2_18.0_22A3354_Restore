@implementation MCMContainerSchemaActionCopyContents

- (MCMContainerSchemaActionCopyContents)initWithSourcePathArgument:(id)a3 destinationPathArgument:(id)a4 destFinalPathArgument:(id)a5 context:(id)a6
{
  id v9;
  id v10;
  MCMContainerSchemaActionCopyContents *v11;
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
  v17.super_class = (Class)MCMContainerSchemaActionCopyContents;
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
      _os_log_error_impl(&dword_1CF807000, v7, OS_LOG_TYPE_ERROR, "ignoring attempt to copy [%@] to itself: %@", buf, 0x16u);
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
    v14[2] = __57__MCMContainerSchemaActionCopyContents_performWithError___block_invoke;
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

uint64_t __57__MCMContainerSchemaActionCopyContents_performWithError___block_invoke(uint64_t a1, void *a2, _QWORD *a3)
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
  __int128 v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  int v25;
  void *v26;
  id v27;
  id v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  _BOOL4 v33;
  uint64_t v34;
  __int128 v36;
  id obj;
  uint64_t v39;
  id v40;
  _QWORD v41[4];
  id v42;
  id v43;
  id v44;
  id v45;
  char v46;
  id v47;
  _QWORD v48[5];
  id v49;
  uint64_t v50;
  uint64_t *v51;
  uint64_t v52;
  uint64_t (*v53)(uint64_t, uint64_t);
  void (*v54)(uint64_t);
  id v55;
  uint8_t buf[4];
  void *v57;
  __int16 v58;
  void *v59;
  __int16 v60;
  id v61;
  _BYTE v62[128];
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  v40 = a2;
  v50 = 0;
  v51 = &v50;
  v52 = 0x3032000000;
  v53 = __Block_byref_object_copy__12541;
  v54 = __Block_byref_object_dispose__12542;
  v55 = 0;
  v4 = *(void **)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v48[4] = &v50;
  v49 = 0;
  v48[0] = MEMORY[0x1E0C809B0];
  v48[1] = 3221225472;
  v48[2] = __57__MCMContainerSchemaActionCopyContents_performWithError___block_invoke_1;
  v48[3] = &unk_1E8CB6740;
  v6 = objc_msgSend(v4, "fixAndRetryIfPermissionsErrorWithURL:error:duringBlock:", v5, &v49, v48);
  v7 = v49;
  v8 = v7;
  if ((v6 & 1) != 0)
  {
    v9 = *(void **)(a1 + 32);
    v47 = v8;
    v10 = objc_msgSend(v9, "makedirAtURL:followTerminalSymlink:error:", v40, 1, &v47);
    v11 = v47;

    if (v10)
    {
      v65 = 0u;
      v66 = 0u;
      v63 = 0u;
      v64 = 0u;
      v12 = (id)v51[5];
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v63, v62, 16);
      if (v13)
      {
        v39 = *(_QWORD *)v64;
        *(_QWORD *)&v14 = 138412802;
        v36 = v14;
        obj = v12;
        while (2)
        {
          for (i = 0; i != v13; ++i)
          {
            if (*(_QWORD *)v64 != v39)
              objc_enumerationMutation(obj);
            v16 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * i);
            v17 = *(void **)(a1 + 40);
            objc_msgSend(v16, "lastPathComponent", v36);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "URLByAppendingPathComponent:isDirectory:", v18, 0);
            v19 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v16, "lastPathComponent");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v40, "URLByAppendingPathComponent:isDirectory:", v20, 0);
            v21 = (void *)objc_claimAutoreleasedReturnValue();

            v46 = 0;
            +[MCMFileManager defaultManager](MCMFileManager, "defaultManager");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v45 = v11;
            LOBYTE(v17) = objc_msgSend(v22, "itemAtURL:followSymlinks:exists:isDirectory:error:", v21, 1, &v46, 0, &v45);
            v23 = v45;

            if ((v17 & 1) == 0)
            {
              v11 = v23;
LABEL_27:

              v32 = obj;
              goto LABEL_28;
            }
            if (v46)
            {
              v24 = *(void **)(a1 + 32);
              v44 = v23;
              v25 = objc_msgSend(v24, "backupFileURL:error:", v21, &v44);
              v11 = v44;

              if (!v25)
                goto LABEL_27;
            }
            else
            {
              v11 = v23;
            }
            v26 = *(void **)(a1 + 32);
            v43 = 0;
            v41[0] = MEMORY[0x1E0C809B0];
            v41[1] = 3221225472;
            v41[2] = __57__MCMContainerSchemaActionCopyContents_performWithError___block_invoke_2;
            v41[3] = &unk_1E8CB6768;
            v27 = v21;
            v42 = v27;
            LOBYTE(v26) = objc_msgSend(v26, "fixAndRetryIfPermissionsErrorWithURL:error:duringBlock:", v19, &v43, v41);
            v28 = v43;
            if ((v26 & 1) == 0)
            {
              container_log_handle_for_category();
              v29 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
              {
                objc_msgSend(v19, "path");
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v27, "path");
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = v36;
                v57 = v30;
                v58 = 2112;
                v59 = v31;
                v60 = 2112;
                v61 = v28;
                _os_log_error_impl(&dword_1CF807000, v29, OS_LOG_TYPE_ERROR, "failed to copy [%@] to [%@]: %@", buf, 0x20u);

              }
            }

          }
          v12 = obj;
          v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v63, v62, 16);
          if (v13)
            continue;
          break;
        }
      }

      goto LABEL_23;
    }
  }
  else
  {
    objc_msgSend(v7, "domain");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v32, "isEqualToString:", *MEMORY[0x1E0CB2FE0]))
    {
      v33 = objc_msgSend(v8, "code") == 2;

      if (v33)
      {

        v11 = 0;
LABEL_23:
        v34 = 1;
        goto LABEL_32;
      }
      v11 = v8;
    }
    else
    {
      v11 = v8;
LABEL_28:

    }
  }
  if (a3)
  {
    v11 = objc_retainAutorelease(v11);
    v34 = 0;
    *a3 = v11;
  }
  else
  {
    v34 = 0;
  }
LABEL_32:

  _Block_object_dispose(&v50, 8);
  return v34;
}

BOOL __57__MCMContainerSchemaActionCopyContents_performWithError___block_invoke_1(uint64_t a1, void *a2, uint64_t a3)
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

uint64_t __57__MCMContainerSchemaActionCopyContents_performWithError___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
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

  v2 = CFSTR("copy-contents");
  return CFSTR("copy-contents");
}

@end
