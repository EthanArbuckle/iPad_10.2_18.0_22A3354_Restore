@implementation BMAccessServer

- (void)requestAccessToResource:(id)a3 withMode:(unint64_t)a4 reply:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  id v13;
  void (*v14)(uint64_t);
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  char v21;
  uint64_t *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  int v47;
  const char *v48;
  NSObject *v49;
  void *v50;
  NSObject *v51;
  NSObject *v52;
  id v53;
  uint64_t v54;
  void *v55;
  int *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  int *v62;
  char *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  int v68;
  __int128 v69;
  __int128 v70;
  uint64_t v71;
  void *v72;
  _BYTE buf[40];
  char *v74;
  uint64_t v75;
  const __CFString *v76;
  uint64_t v77;
  const __CFString *v78;
  uint64_t v79;
  const __CFString *v80;
  uint64_t v81;
  const __CFString *v82;
  uint64_t v83;
  const __CFString *v84;
  uint64_t v85;
  const __CFString *v86;
  uint64_t v87;
  _QWORD v88[3];

  v88[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  objc_msgSend(MEMORY[0x1E0CB3B38], "currentConnection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSXPCConnection bm_accessControlPolicy](v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  __biome_log_for_category(6);
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v11, "process");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "identifier");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    BMAccessModePrintableDescription(a4);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    *(_QWORD *)&buf[4] = v38;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v39;
    *(_WORD *)&buf[22] = 2114;
    *(_QWORD *)&buf[24] = v8;
    _os_log_debug_impl(&dword_1AEB31000, v12, OS_LOG_TYPE_DEBUG, "Evaluating %{public}@ request for %{public}@ access to %{public}@", buf, 0x20u);

  }
  if (v8)
  {
    if ((a4 | 2) == 3)
    {
      if ((objc_msgSend(v11, "allowsAccessToResource:withMode:", v8, a4) & 1) != 0)
      {
        +[BMPaths pathForResource:](BMPaths, "pathForResource:", v8);
        v13 = (id)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v13, "length"))
        {
          if (objc_msgSend(v8, "type") == 1)
          {
            if (a4 != 1)
            {
              v40 = (void *)MEMORY[0x1E0CB35C8];
              v79 = *MEMORY[0x1E0CB2D50];
              v80 = CFSTR("Invalid mode for stream resource");
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v80, &v79, 1);
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v40, "errorWithDomain:code:userInfo:", CFSTR("BMAccessErrorDomain"), 7, v41);
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              (*((void (**)(id, _QWORD, _QWORD, void *))v9 + 2))(v9, 0, 0, v42);

              goto LABEL_44;
            }
            *(_QWORD *)&v69 = 0;
            *((_QWORD *)&v69 + 1) = &v69;
            *(_QWORD *)&v70 = 0x2020000000;
            v14 = (void (*)(uint64_t))getBiomeLibraryAndInternalLibraryNodeSymbolLoc_ptr_1;
            *((_QWORD *)&v70 + 1) = getBiomeLibraryAndInternalLibraryNodeSymbolLoc_ptr_1;
            if (!getBiomeLibraryAndInternalLibraryNodeSymbolLoc_ptr_1)
            {
              *(_QWORD *)buf = MEMORY[0x1E0C809B0];
              *(_QWORD *)&buf[8] = 3221225472;
              *(_QWORD *)&buf[16] = __getBiomeLibraryAndInternalLibraryNodeSymbolLoc_block_invoke_0;
              *(_QWORD *)&buf[24] = &unk_1E5E3C680;
              *(_QWORD *)&buf[32] = &v69;
              __getBiomeLibraryAndInternalLibraryNodeSymbolLoc_block_invoke_0((uint64_t)buf);
              v14 = *(void (**)(uint64_t))(*((_QWORD *)&v69 + 1) + 24);
            }
            _Block_object_dispose(&v69, 8);
            if (!v14)
              -[BMAccessServer requestAccessToResource:withMode:reply:].cold.2();
            v14(v15);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "name", (_QWORD)v69);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "streamWithIdentifier:error:", v17, 0);
            v18 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v18)
            {
              v59 = (void *)MEMORY[0x1E0CB35C8];
              v77 = *MEMORY[0x1E0CB2D50];
              v78 = CFSTR("Failed to look up stream resource");
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v78, &v77, 1);
              v60 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v59, "errorWithDomain:code:userInfo:", CFSTR("BMAccessErrorDomain"), 10, v60);
              v61 = (void *)objc_claimAutoreleasedReturnValue();
              (*((void (**)(id, _QWORD, _QWORD, void *))v9 + 2))(v9, 0, 0, v61);

              goto LABEL_44;
            }

          }
          if (v13 && !-[BMAccessServer _hasDirectoryAtPath:](self, "_hasDirectoryAtPath:", v13))
            -[BMAccessServer _createDirectoryAtPath:](self, "_createDirectoryAtPath:", v13);
          -[BMAccessServer delegate](self, "delegate");
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          if (v19
            && (-[BMAccessServer delegate](self, "delegate"),
                v20 = (void *)objc_claimAutoreleasedReturnValue(),
                v21 = objc_msgSend(v20, "prepareResource:withMode:", v8, a4),
                v20,
                (v21 & 1) == 0))
          {
            v43 = (void *)MEMORY[0x1E0CB35C8];
            v75 = *MEMORY[0x1E0CB2D50];
            v76 = CFSTR("Failed to prepare resource");
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v76, &v75, 1);
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v43, "errorWithDomain:code:userInfo:", CFSTR("BMAccessErrorDomain"), 11, v44);
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            (*((void (**)(id, _QWORD, _QWORD, void *))v9 + 2))(v9, 0, 0, v45);

          }
          else
          {
            if (a4 == 3)
              v22 = (uint64_t *)MEMORY[0x1E0C80008];
            else
              v22 = (uint64_t *)MEMORY[0x1E0C80000];
            v13 = objc_retainAutorelease(v13);
            v23 = objc_msgSend(v13, "UTF8String");
            v69 = 0u;
            v70 = 0u;
            objc_msgSend(v11, "process");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v25 = v24;
            if (v24)
            {
              objc_msgSend(v24, "auditToken");
            }
            else
            {
              v69 = 0u;
              v70 = 0u;
            }

            v46 = *v22;
            v47 = *MEMORY[0x1E0C806D0];
            *(_OWORD *)buf = v69;
            *(_OWORD *)&buf[16] = v70;
            v48 = (const char *)sandbox_extension_issue_file_to_process();
            __biome_log_for_category(6);
            v49 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG))
            {
              if (v48)
              {
                v63 = "no error";
              }
              else
              {
                v62 = __error();
                v63 = strerror(*v62);
              }
              *(_DWORD *)buf = 136447235;
              *(_QWORD *)&buf[4] = v46;
              *(_WORD *)&buf[12] = 2081;
              *(_QWORD *)&buf[14] = v23;
              *(_WORD *)&buf[22] = 1024;
              *(_DWORD *)&buf[24] = v47;
              *(_WORD *)&buf[28] = 2048;
              *(_QWORD *)&buf[30] = v48;
              *(_WORD *)&buf[38] = 2082;
              v74 = v63;
              _os_log_debug_impl(&dword_1AEB31000, v49, OS_LOG_TYPE_DEBUG, "sandbox_extension_issue_file_to_process(%{public}s, %{private}s, 0x%X, <audit token>) = %p, %{public}s", buf, 0x30u);
            }

            if (v48)
            {
              v50 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytesNoCopy:length:freeWhenDone:", v48, strlen(v48) + 1, 1);
              __biome_log_for_category(6);
              v51 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG))
              {
                objc_msgSend(v11, "process");
                v64 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v64, "identifier");
                v65 = (void *)objc_claimAutoreleasedReturnValue();
                BMAccessModePrintableDescription(a4);
                v66 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543875;
                *(_QWORD *)&buf[4] = v65;
                *(_WORD *)&buf[12] = 2114;
                *(_QWORD *)&buf[14] = v66;
                *(_WORD *)&buf[22] = 2113;
                *(_QWORD *)&buf[24] = v8;
                _os_log_debug_impl(&dword_1AEB31000, v51, OS_LOG_TYPE_DEBUG, "Granted %{public}@ request for %{public}@ access to %{private}@", buf, 0x20u);

              }
              (*((void (**)(id, void *, id, _QWORD))v9 + 2))(v9, v50, v13, 0);
            }
            else
            {
              __biome_log_for_category(6);
              v52 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
              {
                BMAccessModePrintableDescription(a4);
                v67 = (void *)objc_claimAutoreleasedReturnValue();
                v68 = *__error();
                *(_DWORD *)buf = 138544131;
                *(_QWORD *)&buf[4] = v67;
                *(_WORD *)&buf[12] = 2114;
                *(_QWORD *)&buf[14] = v8;
                *(_WORD *)&buf[22] = 2113;
                *(_QWORD *)&buf[24] = v13;
                *(_WORD *)&buf[32] = 1026;
                *(_DWORD *)&buf[34] = v68;
                _os_log_error_impl(&dword_1AEB31000, v52, OS_LOG_TYPE_ERROR, "Unable to issue %{public}@ extension token to %{public}@ path %{private}@, error %{public, darwin.errno}d", buf, 0x26u);

              }
              v53 = objc_alloc(MEMORY[0x1E0CB35C8]);
              v54 = *__error();
              v71 = *MEMORY[0x1E0CB2D50];
              v55 = (void *)MEMORY[0x1E0CB3940];
              v56 = __error();
              objc_msgSend(v55, "stringWithUTF8String:", strerror(*v56));
              v57 = (void *)objc_claimAutoreleasedReturnValue();
              v72 = v57;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v72, &v71, 1);
              v58 = (void *)objc_claimAutoreleasedReturnValue();
              v50 = (void *)objc_msgSend(v53, "initWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], v54, v58);

              (*((void (**)(id, _QWORD, _QWORD, void *))v9 + 2))(v9, 0, 0, v50);
            }

          }
        }
        else
        {
          __biome_log_for_category(6);
          v33 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
            -[BMAccessServer requestAccessToResource:withMode:reply:].cold.1();

          v34 = (void *)MEMORY[0x1E0CB35C8];
          v81 = *MEMORY[0x1E0CB2D50];
          v82 = CFSTR("Failed to determine path for resource");
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v82, &v81, 1);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "errorWithDomain:code:userInfo:", CFSTR("BMAccessErrorDomain"), 10, v35);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          (*((void (**)(id, _QWORD, _QWORD, void *))v9 + 2))(v9, 0, 0, v36);

        }
      }
      else
      {
        __biome_log_for_category(6);
        v30 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
          -[BMAccessServer requestAccessToResource:withMode:reply:].cold.3();

        v31 = (void *)MEMORY[0x1E0CB35C8];
        v83 = *MEMORY[0x1E0CB2D50];
        v84 = CFSTR("Not entitled");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v84, &v83, 1);
        v13 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "errorWithDomain:code:userInfo:", CFSTR("BMAccessErrorDomain"), 3, v13);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        (*((void (**)(id, _QWORD, _QWORD, void *))v9 + 2))(v9, 0, 0, v32);

      }
    }
    else
    {
      v28 = (void *)MEMORY[0x1E0CB35C8];
      v85 = *MEMORY[0x1E0CB2D50];
      v86 = CFSTR("Unsupported access mode");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v86, &v85, 1);
      v13 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "errorWithDomain:code:userInfo:", CFSTR("BMAccessErrorDomain"), 7, v13);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, _QWORD, void *))v9 + 2))(v9, 0, 0, v29);

    }
  }
  else
  {
    v26 = (void *)MEMORY[0x1E0CB35C8];
    v87 = *MEMORY[0x1E0CB2D50];
    v88[0] = CFSTR("Nil resource specifier");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v88, &v87, 1);
    v13 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "errorWithDomain:code:userInfo:", CFSTR("BMAccessErrorDomain"), 7, v13);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, _QWORD, void *))v9 + 2))(v9, 0, 0, v27);

  }
LABEL_44:

}

- (BMAccessDelegate)delegate
{
  return self->_delegate;
}

- (BOOL)_hasDirectoryAtPath:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  char v6;

  v3 = (void *)MEMORY[0x1E0CB3620];
  v4 = a3;
  objc_msgSend(v3, "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "fileExistsAtPath:", v4);

  return v6;
}

- (BMAccessServer)initWithListener:(id)a3
{
  id v5;
  BMAccessServer *v6;
  BMAccessServer *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BMAccessServer;
  v6 = -[BMAccessServer init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_listener, a3);

  return v7;
}

- (BOOL)_createDirectoryAtPath:(id)a3
{
  id v3;
  void *v4;
  char v5;
  id v6;
  NSObject *v7;
  id v9;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  v5 = objc_msgSend(v4, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v3, 1, 0, &v9);
  v6 = v9;

  if ((v5 & 1) == 0)
  {
    __biome_log_for_category(6);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[BMAccessServer _createDirectoryAtPath:].cold.1();

  }
  return v5;
}

- (BOOL)_removeDirectoryAtPath:(id)a3
{
  id v3;
  void *v4;
  char v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  id v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  v5 = objc_msgSend(v4, "removeItemAtPath:error:", v3, &v10);
  v6 = v10;

  __biome_log_for_category(6);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if ((v5 & 1) != 0)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v12 = v3;
      _os_log_impl(&dword_1AEB31000, v8, OS_LOG_TYPE_DEFAULT, "Successfully removed folder at %@", buf, 0xCu);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    -[BMAccessServer _removeDirectoryAtPath:].cold.1();
  }

  return v5;
}

- (void)removeResource:(id)a3 reply:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, void *);
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  const __CFString **v17;
  uint64_t *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  NSObject *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  int v31;
  void *v32;
  __int16 v33;
  id v34;
  uint64_t v35;
  const __CFString *v36;
  uint64_t v37;
  const __CFString *v38;
  uint64_t v39;
  const __CFString *v40;
  uint64_t v41;
  const __CFString *v42;
  uint64_t v43;
  const __CFString *v44;
  uint64_t v45;
  _QWORD v46[2];

  v46[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, _QWORD, void *))a4;
  objc_msgSend(MEMORY[0x1E0CB3B38], "currentConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSXPCConnection bm_accessControlPolicy](v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  __biome_log_for_category(6);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    -[BMAccessServer removeResource:reply:].cold.3(v9, (uint64_t)v6, v10);

  if (!v6)
  {
    v15 = (void *)MEMORY[0x1E0CB35C8];
    v45 = *MEMORY[0x1E0CB2D50];
    v46[0] = CFSTR("Nil resource specifier");
    v16 = (void *)MEMORY[0x1E0C99D80];
    v17 = (const __CFString **)v46;
    v18 = &v45;
LABEL_17:
    objc_msgSend(v16, "dictionaryWithObjects:forKeys:count:", v17, v18, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v15;
    v20 = 7;
LABEL_18:
    objc_msgSend(v19, "errorWithDomain:code:userInfo:", CFSTR("BMAccessErrorDomain"), v20, v13);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, 0, v21);

    goto LABEL_19;
  }
  if (objc_msgSend(v6, "type") != 4)
  {
    v15 = (void *)MEMORY[0x1E0CB35C8];
    v43 = *MEMORY[0x1E0CB2D50];
    v44 = CFSTR("Invalid resource type");
    v16 = (void *)MEMORY[0x1E0C99D80];
    v17 = &v44;
    v18 = &v43;
    goto LABEL_17;
  }
  objc_msgSend(v9, "process");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "processType");

  if (v12 != 5)
  {
    v15 = (void *)MEMORY[0x1E0CB35C8];
    v41 = *MEMORY[0x1E0CB2D50];
    v42 = CFSTR("Invalid process type");
    v16 = (void *)MEMORY[0x1E0C99D80];
    v17 = &v42;
    v18 = &v41;
    goto LABEL_17;
  }
  if ((objc_msgSend(v9, "allowsAccessToResource:withMode:", v6, 2) & 1) == 0)
  {
    __biome_log_for_category(6);
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      -[BMAccessServer removeResource:reply:].cold.2();

    v23 = (void *)MEMORY[0x1E0CB35C8];
    v39 = *MEMORY[0x1E0CB2D50];
    v40 = CFSTR("Not entitled");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v40, &v39, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v23;
    v20 = 3;
    goto LABEL_18;
  }
  +[BMPaths pathForResource:](BMPaths, "pathForResource:", v6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v13, "length"))
  {
    __biome_log_for_category(6);
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      -[BMAccessServer removeResource:reply:].cold.1();

    v25 = (void *)MEMORY[0x1E0CB35C8];
    v37 = *MEMORY[0x1E0CB2D50];
    v38 = CFSTR("Failed to determine path for resource");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v38, &v37, 1);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v25;
    v28 = 10;
    goto LABEL_27;
  }
  if (v13
    && -[BMAccessServer _hasDirectoryAtPath:](self, "_hasDirectoryAtPath:", v13)
    && !-[BMAccessServer _removeDirectoryAtPath:](self, "_removeDirectoryAtPath:", v13))
  {
    v29 = (void *)MEMORY[0x1E0CB35C8];
    v35 = *MEMORY[0x1E0CB2D50];
    v36 = CFSTR("Failed to clean up directory");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v36, &v35, 1);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v29;
    v28 = 0;
LABEL_27:
    objc_msgSend(v27, "errorWithDomain:code:userInfo:", CFSTR("BMAccessErrorDomain"), v28, v26);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, 0, v30);

    goto LABEL_19;
  }
  __biome_log_for_category(6);
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v31 = 138412546;
    v32 = v13;
    v33 = 2112;
    v34 = v6;
    _os_log_impl(&dword_1AEB31000, v14, OS_LOG_TYPE_DEFAULT, "Successfully removed path: %@ for resource: %@", (uint8_t *)&v31, 0x16u);
  }

  v7[2](v7, 1, 0);
LABEL_19:

}

- (void)requestBiomeEndpoint:(BOOL)a3 reply:(id)a4
{
  _BOOL4 v4;
  void (**v6)(id, _QWORD, void *);
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  const __CFString *v19;
  uint64_t v20;
  const __CFString *v21;
  uint64_t v22;
  _QWORD v23[2];

  v4 = a3;
  v23[1] = *MEMORY[0x1E0C80C00];
  v6 = (void (**)(id, _QWORD, void *))a4;
  objc_msgSend(MEMORY[0x1E0CB3B38], "currentConnection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSXPCConnection bm_accessControlPolicy](v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v8, "allowsProxyingBiomeEndpoint") & 1) == 0)
  {
    v10 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v22 = *MEMORY[0x1E0CB2D50];
    v23[0] = CFSTR("Not entitled");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, &v22, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    v12 = 3;
LABEL_7:
    v14 = (void *)objc_msgSend(v11, "initWithDomain:code:userInfo:", CFSTR("BMAccessErrorDomain"), v12, v9);
    v6[2](v6, 0, v14);

    goto LABEL_8;
  }
  if ((((-[BMAccessServiceListener domain](self->_listener, "domain") != 1) ^ v4) & 1) == 0)
  {
    v13 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v20 = *MEMORY[0x1E0CB2D50];
    v21 = CFSTR("Wrong domain");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v13;
    v12 = 7;
    goto LABEL_7;
  }
  -[BMAccessServiceListener endpointForCoreDuetUseCases](self->_listener, "endpointForCoreDuetUseCases");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    ((void (**)(id, void *, void *))v6)[2](v6, v9, 0);
  }
  else
  {
    v15 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v18 = *MEMORY[0x1E0CB2D50];
    v19 = CFSTR("Failed to get endpoint");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v15, "initWithDomain:code:userInfo:", CFSTR("BMAccessErrorDomain"), 0, v16);
    v6[2](v6, 0, v17);

  }
LABEL_8:

}

- (void)requestBiomeEndpointForAppScopedService:(unint64_t)a3 user:(unsigned int)a4 reply:(id)a5
{
  void (**v7)(id, _QWORD, void *);
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  const __CFString *v20;
  uint64_t v21;
  const __CFString *v22;
  uint64_t v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v7 = (void (**)(id, _QWORD, void *))a5;
  objc_msgSend(MEMORY[0x1E0CB3B38], "currentConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSXPCConnection bm_accessControlPolicy](v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v9, "allowsConnectionToWriteService") & 1) == 0
    && (objc_msgSend(v9, "allowsConnectionToSetStoreUpdateService") & 1) == 0)
  {
    v14 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v23 = *MEMORY[0x1E0CB2D50];
    v24[0] = CFSTR("Not entitled");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, &v23, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v14;
    v13 = 3;
    goto LABEL_8;
  }
  if (-[BMAccessServiceListener domain](self->_listener, "domain") != a3)
  {
    v11 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v21 = *MEMORY[0x1E0CB2D50];
    v22 = CFSTR("Wrong domain");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    v13 = 7;
LABEL_8:
    v15 = (void *)objc_msgSend(v12, "initWithDomain:code:userInfo:", CFSTR("BMAccessErrorDomain"), v13, v10);
    v7[2](v7, 0, v15);

    goto LABEL_9;
  }
  -[BMAccessServiceListener uniqueEndpointForAppScopedServicesActingOnBehalfOfClientWithAccessControlPolicy:](self->_listener, "uniqueEndpointForAppScopedServicesActingOnBehalfOfClientWithAccessControlPolicy:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    ((void (**)(id, void *, void *))v7)[2](v7, v10, 0);
  }
  else
  {
    v16 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v19 = *MEMORY[0x1E0CB2D50];
    v20 = CFSTR("Failed to get endpoint");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(v16, "initWithDomain:code:userInfo:", CFSTR("BMAccessErrorDomain"), 0, v17);
    v7[2](v7, 0, v18);

  }
LABEL_9:

}

- (void)setDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_listener, 0);
}

- (void)_createDirectoryAtPath:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  objc_msgSend(MEMORY[0x1E0D81590], "isUnlocked");
  OUTLINED_FUNCTION_1_6();
  OUTLINED_FUNCTION_2_4(&dword_1AEB31000, v0, v1, "Can't create folder at %@ with error %@, isUnlocked: %hhd", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)_removeDirectoryAtPath:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  objc_msgSend(MEMORY[0x1E0D81590], "isUnlocked");
  OUTLINED_FUNCTION_1_6();
  OUTLINED_FUNCTION_2_4(&dword_1AEB31000, v0, v1, "Can't remove folder at %@ with error %@, isUnlocked: %hhd", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)requestAccessToResource:withMode:reply:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_0(&dword_1AEB31000, v0, v1, "Failed to determine path, will not issue sandbox extension", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)requestAccessToResource:withMode:reply:.cold.2()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "id<_BMRootLibrary> __softlink__BiomeLibraryAndInternalLibraryNode(void)");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("BMAccessServer.m"), 29, CFSTR("%s"), dlerror());

  __break(1u);
}

- (void)requestAccessToResource:withMode:reply:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_0(&dword_1AEB31000, v0, v1, "Failed entitlement check, will not issue sandbox extension", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)removeResource:reply:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_0(&dword_1AEB31000, v0, v1, "Failed to determine path, will not perform deletion", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)removeResource:reply:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_0(&dword_1AEB31000, v0, v1, "Failed entitlement check, will not perform deletion", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)removeResource:(NSObject *)a3 reply:.cold.3(void *a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "process");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138543618;
  v8 = v6;
  v9 = 2114;
  v10 = a2;
  _os_log_debug_impl(&dword_1AEB31000, a3, OS_LOG_TYPE_DEBUG, "Evaluating %{public}@ request for removal of %{public}@", (uint8_t *)&v7, 0x16u);

}

@end
