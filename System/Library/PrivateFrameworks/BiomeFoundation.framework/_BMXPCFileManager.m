@implementation _BMXPCFileManager

- (id)temporaryFileHandleWithProtection:(int)a3 error:(id *)a4
{
  uint64_t v4;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v12;
  _QWORD v13[6];
  _QWORD v14[5];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  unint64_t v27;
  os_activity_scope_state_s state;

  v4 = *(_QWORD *)&a3;
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  v12 = _os_activity_create(&dword_1AEB31000, "_BMXPCFileManager.temporaryFileHandleWithProtection:error:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v12, &state);
  v27 = 0;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__2;
  v25 = __Block_byref_object_dispose__2;
  v26 = 0;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__2;
  v19 = __Block_byref_object_dispose__2;
  v20 = 0;
  v6 = MEMORY[0x1E0C809B0];
  do
  {
    v14[0] = v6;
    v14[1] = 3221225472;
    v14[2] = __61___BMXPCFileManager_temporaryFileHandleWithProtection_error___block_invoke;
    v14[3] = &unk_1E5E3CAE8;
    v14[4] = &v15;
    -[_BMXPCFileManager _synchronousRemoteObjectProxyWithErrorHandler:](self, "_synchronousRemoteObjectProxyWithErrorHandler:", v14);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v6;
    v13[1] = 3221225472;
    v13[2] = __61___BMXPCFileManager_temporaryFileHandleWithProtection_error___block_invoke_2;
    v13[3] = &unk_1E5E3CF50;
    v13[4] = &v21;
    v13[5] = &v15;
    objc_msgSend(v7, "temporaryFileHandleWithProtection:reply:", v4, v13);

  }
  while ((BMShouldRetry((void *)v16[5], &v27, 2uLL, 1) & 1) != 0);
  v8 = (void *)v16[5];
  if (v8)
  {
    v9 = 0;
    if (a4)
      *a4 = objc_retainAutorelease(v8);
  }
  else
  {
    v9 = (id)v22[5];
  }
  _Block_object_dispose(&v15, 8);

  _Block_object_dispose(&v21, 8);
  os_activity_scope_leave(&state);

  return v9;
}

- (id)replaceFileAtPath:(id)a3 withFileHandle:(id)a4 protection:(int)a5 error:(id *)a6
{
  uint64_t v6;
  id v10;
  _BOOL4 v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  id v26;
  id v27;
  _QWORD v28[6];
  _QWORD v29[5];
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  id v41;
  unint64_t v42;
  id v43;
  uint64_t v44;
  os_activity_scope_state_s state;
  uint64_t v46;
  const __CFString *v47;
  uint64_t v48;
  _QWORD v49[3];

  v6 = *(_QWORD *)&a5;
  v49[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v27 = a4;
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  v24 = _os_activity_create(&dword_1AEB31000, "_BMXPCFileManager.replaceFileAtPath:withFileHandle:error:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v24, &state);
  v23 = v10;
  if (v10)
  {
    v43 = 0;
    v44 = 0;
    v11 = +[BMPaths getServiceDomain:subpath:forPath:](BMPaths, "getServiceDomain:subpath:forPath:", &v44, &v43, v10);
    v26 = v43;
    if (v11 && -[_BMXPCFileManager supportsPathWithDomain:](self, "supportsPathWithDomain:", v44))
    {
      v42 = 0;
      v36 = 0;
      v37 = &v36;
      v38 = 0x3032000000;
      v39 = __Block_byref_object_copy__2;
      v40 = __Block_byref_object_dispose__2;
      v41 = 0;
      v30 = 0;
      v31 = &v30;
      v32 = 0x3032000000;
      v33 = __Block_byref_object_copy__2;
      v34 = __Block_byref_object_dispose__2;
      v35 = 0;
      v12 = MEMORY[0x1E0C809B0];
      do
      {
        v29[0] = v12;
        v29[1] = 3221225472;
        v29[2] = __71___BMXPCFileManager_replaceFileAtPath_withFileHandle_protection_error___block_invoke;
        v29[3] = &unk_1E5E3CAE8;
        v29[4] = &v36;
        -[_BMXPCFileManager _synchronousRemoteObjectProxyWithErrorHandler:](self, "_synchronousRemoteObjectProxyWithErrorHandler:", v29);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v28[0] = v12;
        v28[1] = 3221225472;
        v28[2] = __71___BMXPCFileManager_replaceFileAtPath_withFileHandle_protection_error___block_invoke_2;
        v28[3] = &unk_1E5E3CF50;
        v28[4] = &v30;
        v28[5] = &v36;
        objc_msgSend(v13, "replaceFileAtPath:withFileHandle:protection:reply:", v26, v27, v6, v28);

      }
      while ((BMShouldRetry((void *)v37[5], &v42, 2uLL, 1) & 1) != 0);
      v14 = (void *)v37[5];
      if (v14)
      {
        v15 = 0;
        if (a6)
          *a6 = objc_retainAutorelease(v14);
      }
      else
      {
        v15 = (id)v31[5];
      }
      _Block_object_dispose(&v30, 8);

      _Block_object_dispose(&v36, 8);
    }
    else
    {
      if (a6)
      {
        v16 = (void *)MEMORY[0x1E0CB35C8];
        v46 = *MEMORY[0x1E0CB2D50];
        v47 = CFSTR("Unsupported path");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v47, &v46, 1);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "errorWithDomain:code:userInfo:", CFSTR("BiomeStorageError"), 2, v17);
        *a6 = (id)objc_claimAutoreleasedReturnValue();

      }
      v15 = 0;
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_BMXPCFileManager.m"), 331, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("path"), 0, v24);

    __biome_log_for_category(2);
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      -[BMFileManager fileExistsAtPath:error:].cold.1();

    if (a6)
    {
      v21 = (void *)MEMORY[0x1E0CB35C8];
      v48 = *MEMORY[0x1E0CB2D50];
      v49[0] = CFSTR("Invalid path");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v49, &v48, 1);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "errorWithDomain:code:userInfo:", CFSTR("BiomeStorageError"), 2, v22);
      *a6 = (id)objc_claimAutoreleasedReturnValue();

    }
    v15 = 0;
  }
  os_activity_scope_leave(&state);

  return v15;
}

- (id)_fileHandleForFileAtPath:(id)a3 flags:(int)a4 protection:(int)a5 error:(id *)a6
{
  uint64_t v6;
  uint64_t v7;
  id v10;
  _BOOL4 v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  id v25;
  _QWORD v26[6];
  _QWORD v27[5];
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;
  unint64_t v40;
  id v41;
  uint64_t v42;
  os_activity_scope_state_s state;
  uint64_t v44;
  const __CFString *v45;
  uint64_t v46;
  _QWORD v47[3];

  v6 = *(_QWORD *)&a5;
  v7 = *(_QWORD *)&a4;
  v47[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  v23 = _os_activity_create(&dword_1AEB31000, "_BMXPCFileManager._fileHandleForFileAtPath:flags:protection:error:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v23, &state);
  if (v10)
  {
    v41 = 0;
    v42 = 0;
    v11 = +[BMPaths getServiceDomain:subpath:forPath:](BMPaths, "getServiceDomain:subpath:forPath:", &v42, &v41, v10);
    v25 = v41;
    if (v11 && -[_BMXPCFileManager supportsPathWithDomain:](self, "supportsPathWithDomain:", v42))
    {
      v40 = 0;
      v34 = 0;
      v35 = &v34;
      v36 = 0x3032000000;
      v37 = __Block_byref_object_copy__2;
      v38 = __Block_byref_object_dispose__2;
      v39 = 0;
      v28 = 0;
      v29 = &v28;
      v30 = 0x3032000000;
      v31 = __Block_byref_object_copy__2;
      v32 = __Block_byref_object_dispose__2;
      v33 = 0;
      v12 = MEMORY[0x1E0C809B0];
      do
      {
        v27[0] = v12;
        v27[1] = 3221225472;
        v27[2] = __69___BMXPCFileManager__fileHandleForFileAtPath_flags_protection_error___block_invoke;
        v27[3] = &unk_1E5E3CAE8;
        v27[4] = &v28;
        -[_BMXPCFileManager _synchronousRemoteObjectProxyWithErrorHandler:](self, "_synchronousRemoteObjectProxyWithErrorHandler:", v27);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v26[0] = v12;
        v26[1] = 3221225472;
        v26[2] = __69___BMXPCFileManager__fileHandleForFileAtPath_flags_protection_error___block_invoke_2;
        v26[3] = &unk_1E5E3CF50;
        v26[4] = &v34;
        v26[5] = &v28;
        objc_msgSend(v13, "fileHandleForFileAtPath:flags:protection:reply:", v25, v7, v6, v26);

      }
      while ((BMShouldRetry((void *)v29[5], &v40, 2uLL, 1) & 1) != 0);
      v14 = (void *)v29[5];
      if (v14)
      {
        v15 = 0;
        if (a6)
          *a6 = objc_retainAutorelease(v14);
      }
      else
      {
        v15 = (id)v35[5];
      }
      _Block_object_dispose(&v28, 8);

      _Block_object_dispose(&v34, 8);
    }
    else
    {
      if (a6)
      {
        v16 = (void *)MEMORY[0x1E0CB35C8];
        v44 = *MEMORY[0x1E0CB2D50];
        v45 = CFSTR("Unsupported path");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v45, &v44, 1);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "errorWithDomain:code:userInfo:", CFSTR("BiomeStorageError"), 2, v17);
        *a6 = (id)objc_claimAutoreleasedReturnValue();

      }
      v15 = 0;
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_BMXPCFileManager.m"), 138, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("path"));

    __biome_log_for_category(2);
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      -[BMFileManager fileExistsAtPath:error:].cold.1();

    if (a6)
    {
      v21 = (void *)MEMORY[0x1E0CB35C8];
      v46 = *MEMORY[0x1E0CB2D50];
      v47[0] = CFSTR("Invalid path");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v47, &v46, 1);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "errorWithDomain:code:userInfo:", CFSTR("BiomeStorageError"), 2, v22);
      *a6 = (id)objc_claimAutoreleasedReturnValue();

    }
    v15 = 0;
  }
  os_activity_scope_leave(&state);

  return v15;
}

- (id)_synchronousRemoteObjectProxyWithErrorHandler:(id)a3
{
  void (**v4)(id, void *);
  BMXPCConnectionWrapper **p_connectionWrapper;
  BMXPCConnectionWrapper *v6;
  BMXPCConnectionWrapper *v7;
  void *v8;
  void (**v9)(id, void *);
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v19[4];
  BMXPCConnectionWrapper *v20;
  void (**v21)(id, void *);
  uint64_t v22;
  const __CFString *v23;
  uint64_t v24;
  const __CFString *v25;
  uint64_t v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, void *))a3;
  p_connectionWrapper = &self->_connectionWrapper;
  v6 = self->_connectionWrapper;
  if (!-[BMXPCConnectionWrapper isValid](v6, "isValid"))
  {
    v7 = -[_BMXPCFileManager _newConnection](self, "_newConnection");

    objc_storeStrong((id *)p_connectionWrapper, v7);
    v6 = v7;
  }
  if (!v6)
  {
    v15 = (void *)MEMORY[0x1E0CB35C8];
    v26 = *MEMORY[0x1E0CB2D50];
    v27[0] = CFSTR("Failed to get or create BMXPCConnectionWrapper");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, &v26, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "errorWithDomain:code:userInfo:", CFSTR("BiomeStorageError"), 7, v8);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v4[2](v4, v14);
LABEL_10:
    v10 = 0;
    goto LABEL_11;
  }
  -[BMXPCConnectionWrapper connection](v6, "connection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    v16 = (void *)MEMORY[0x1E0CB35C8];
    v24 = *MEMORY[0x1E0CB2D50];
    v25 = CFSTR("Failed to get connection from BMXPCConnectionWrapper");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "errorWithDomain:code:userInfo:", CFSTR("BiomeStorageError"), 7, v14);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v4[2](v4, v17);

    goto LABEL_10;
  }
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __67___BMXPCFileManager__synchronousRemoteObjectProxyWithErrorHandler___block_invoke;
  v19[3] = &unk_1E5E3CAC0;
  v20 = v6;
  v9 = v4;
  v21 = v9;
  objc_msgSend(v8, "synchronousRemoteObjectProxyWithErrorHandler:", v19);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    v11 = (void *)MEMORY[0x1E0CB35C8];
    v22 = *MEMORY[0x1E0CB2D50];
    v23 = CFSTR("Failed to create remote object proxy");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "errorWithDomain:code:userInfo:", CFSTR("BiomeStorageError"), 7, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v9[2](v9, v13);

  }
  v14 = v20;
LABEL_11:

  return v10;
}

- (_BMXPCFileManager)initWithDirectory:(id)a3 cachingOptions:(int64_t)a4 useCase:(id)a5 domain:(unint64_t)a6 user:(unsigned int)a7
{
  id v12;
  _BMXPCFileManager *v13;
  uint64_t v14;
  NSString *useCase;
  objc_super v17;

  v12 = a5;
  v17.receiver = self;
  v17.super_class = (Class)_BMXPCFileManager;
  v13 = -[BMFileManager initWithDirectory:cachingOptions:](&v17, sel_initWithDirectory_cachingOptions_, a3, a4);
  if (v13)
  {
    v14 = objc_msgSend(v12, "copy");
    useCase = v13->_useCase;
    v13->_useCase = (NSString *)v14;

    v13->_domain = a6;
    v13->_user = a7;
  }

  return v13;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_useCase, 0);
  objc_storeStrong((id *)&self->_connectionWrapper, 0);
}

- (BOOL)supportsPathWithDomain:(unint64_t)a3
{
  return self->_domain == a3;
}

- (id)_newConnection
{
  +[BMAccessConnectionFactory connectionToFileServerInDomain:user:useCase:](BMAccessConnectionFactory, "connectionToFileServerInDomain:user:useCase:", self->_domain, self->_user, self->_useCase);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)_removeFileAtPath:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  _BOOL4 v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  BOOL v13;
  void *v14;
  void *v15;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  _QWORD v22[5];
  _QWORD v23[5];
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  unint64_t v30;
  id v31;
  uint64_t v32;
  os_activity_scope_state_s state;
  uint64_t v34;
  const __CFString *v35;
  uint64_t v36;
  _QWORD v37[3];

  v37[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = _os_activity_create(&dword_1AEB31000, "_BMXPCFileManager._removeFileAtPath:error:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v7, &state);
  if (v6)
  {
    v31 = 0;
    v32 = 0;
    v8 = +[BMPaths getServiceDomain:subpath:forPath:](BMPaths, "getServiceDomain:subpath:forPath:", &v32, &v31, v6);
    v9 = v31;
    if (v8 && -[_BMXPCFileManager supportsPathWithDomain:](self, "supportsPathWithDomain:", v32))
    {
      v29 = 0;
      v30 = 0;
      v24 = 0;
      v25 = &v24;
      v26 = 0x3032000000;
      v27 = __Block_byref_object_copy__2;
      v28 = __Block_byref_object_dispose__2;
      v10 = MEMORY[0x1E0C809B0];
      do
      {
        v23[0] = v10;
        v23[1] = 3221225472;
        v23[2] = __45___BMXPCFileManager__removeFileAtPath_error___block_invoke;
        v23[3] = &unk_1E5E3CAE8;
        v23[4] = &v24;
        -[_BMXPCFileManager _synchronousRemoteObjectProxyWithErrorHandler:](self, "_synchronousRemoteObjectProxyWithErrorHandler:", v23);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v22[0] = v10;
        v22[1] = 3221225472;
        v22[2] = __45___BMXPCFileManager__removeFileAtPath_error___block_invoke_2;
        v22[3] = &unk_1E5E3CAE8;
        v22[4] = &v24;
        objc_msgSend(v11, "removeFileAtPath:reply:", v9, v22);

      }
      while ((BMShouldRetry((void *)v25[5], &v30, 2uLL, 1) & 1) != 0);
      v12 = (void *)v25[5];
      v13 = v12 == 0;
      if (a4 && v12)
        *a4 = objc_retainAutorelease(v12);
      _Block_object_dispose(&v24, 8);

    }
    else
    {
      if (a4)
      {
        v14 = (void *)MEMORY[0x1E0CB35C8];
        v34 = *MEMORY[0x1E0CB2D50];
        v35 = CFSTR("Unsupported path");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v35, &v34, 1);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "errorWithDomain:code:userInfo:", CFSTR("BiomeStorageError"), 2, v15);
        *a4 = (id)objc_claimAutoreleasedReturnValue();

      }
      v13 = 0;
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_BMXPCFileManager.m"), 184, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("path"));

    __biome_log_for_category(2);
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      -[BMFileManager fileExistsAtPath:error:].cold.1();

    if (a4)
    {
      v19 = (void *)MEMORY[0x1E0CB35C8];
      v36 = *MEMORY[0x1E0CB2D50];
      v37[0] = CFSTR("Invalid path");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v37, &v36, 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "errorWithDomain:code:userInfo:", CFSTR("BiomeStorageError"), 2, v20);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
    v13 = 0;
  }
  os_activity_scope_leave(&state);

  return v13;
}

- (BOOL)_removeDirectoryAtPath:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  _BOOL4 v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  BOOL v13;
  void *v14;
  void *v15;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  _QWORD v22[5];
  _QWORD v23[5];
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  unint64_t v30;
  id v31;
  uint64_t v32;
  os_activity_scope_state_s state;
  uint64_t v34;
  const __CFString *v35;
  uint64_t v36;
  _QWORD v37[3];

  v37[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = _os_activity_create(&dword_1AEB31000, "_BMXPCFileManager._removeDirectoryAtPath:error:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v7, &state);
  if (v6)
  {
    v31 = 0;
    v32 = 0;
    v8 = +[BMPaths getServiceDomain:subpath:forPath:](BMPaths, "getServiceDomain:subpath:forPath:", &v32, &v31, v6);
    v9 = v31;
    if (v8 && -[_BMXPCFileManager supportsPathWithDomain:](self, "supportsPathWithDomain:", v32))
    {
      v29 = 0;
      v30 = 0;
      v24 = 0;
      v25 = &v24;
      v26 = 0x3032000000;
      v27 = __Block_byref_object_copy__2;
      v28 = __Block_byref_object_dispose__2;
      v10 = MEMORY[0x1E0C809B0];
      do
      {
        v23[0] = v10;
        v23[1] = 3221225472;
        v23[2] = __50___BMXPCFileManager__removeDirectoryAtPath_error___block_invoke;
        v23[3] = &unk_1E5E3CAE8;
        v23[4] = &v24;
        -[_BMXPCFileManager _synchronousRemoteObjectProxyWithErrorHandler:](self, "_synchronousRemoteObjectProxyWithErrorHandler:", v23);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v22[0] = v10;
        v22[1] = 3221225472;
        v22[2] = __50___BMXPCFileManager__removeDirectoryAtPath_error___block_invoke_2;
        v22[3] = &unk_1E5E3CAE8;
        v22[4] = &v24;
        objc_msgSend(v11, "removeDirectoryAtPath:reply:", v9, v22);

      }
      while ((BMShouldRetry((void *)v25[5], &v30, 2uLL, 1) & 1) != 0);
      v12 = (void *)v25[5];
      v13 = v12 == 0;
      if (a4 && v12)
        *a4 = objc_retainAutorelease(v12);
      _Block_object_dispose(&v24, 8);

    }
    else
    {
      if (a4)
      {
        v14 = (void *)MEMORY[0x1E0CB35C8];
        v34 = *MEMORY[0x1E0CB2D50];
        v35 = CFSTR("Unsupported path");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v35, &v34, 1);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "errorWithDomain:code:userInfo:", CFSTR("BiomeStorageError"), 2, v15);
        *a4 = (id)objc_claimAutoreleasedReturnValue();

      }
      v13 = 0;
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_BMXPCFileManager.m"), 228, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("path"));

    __biome_log_for_category(2);
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      -[BMFileManager fileExistsAtPath:error:].cold.1();

    if (a4)
    {
      v19 = (void *)MEMORY[0x1E0CB35C8];
      v36 = *MEMORY[0x1E0CB2D50];
      v37[0] = CFSTR("Invalid path");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v37, &v36, 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "errorWithDomain:code:userInfo:", CFSTR("BiomeStorageError"), 2, v20);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
    v13 = 0;
  }
  os_activity_scope_leave(&state);

  return v13;
}

- (BOOL)replaceFileAtPath:(id)a3 withData:(id)a4 protection:(int)a5 error:(id *)a6
{
  uint64_t v7;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  _QWORD v22[2];

  v7 = *(_QWORD *)&a5;
  v22[1] = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  if (v11)
  {
    -[_BMXPCFileManager temporaryFileHandleWithProtection:error:](self, "temporaryFileHandleWithProtection:error:", v7, a6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13 && objc_msgSend(v13, "overwriteWithData:error:", v12, a6))
    {
      -[_BMXPCFileManager replaceFileAtPath:withFileHandle:protection:error:](self, "replaceFileAtPath:withFileHandle:protection:error:", v11, v14, v7, a6);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(a6) = v15 != 0;

    }
    else
    {
      LOBYTE(a6) = 0;
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_BMXPCFileManager.m"), 296, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("path"));

    __biome_log_for_category(2);
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      -[BMFileManager fileExistsAtPath:error:].cold.1();

    if (a6)
    {
      v19 = (void *)MEMORY[0x1E0CB35C8];
      v21 = *MEMORY[0x1E0CB2D50];
      v22[0] = CFSTR("Invalid path");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "errorWithDomain:code:userInfo:", CFSTR("BiomeStorageError"), 2, v20);
      *a6 = (id)objc_claimAutoreleasedReturnValue();

      LOBYTE(a6) = 0;
    }
  }

  return (char)a6;
}

@end
