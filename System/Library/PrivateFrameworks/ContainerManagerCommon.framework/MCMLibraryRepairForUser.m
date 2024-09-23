@implementation MCMLibraryRepairForUser

- (BOOL)fixAndRetryIfPermissionsErrorWithURL:(id)a3 containerPath:(id)a4 containerIdentifier:(id)a5 error:(id *)a6 duringBlock:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  char v16;
  id v18[2];

  v18[1] = *(id *)MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a7;
  v15 = v14;
  if (v14)
  {
    v18[0] = 0;
    v16 = (*((uint64_t (**)(id, id, id *))v14 + 2))(v14, v11, v18);
    v14 = v18[0];
    if (a6 && (v16 & 1) == 0)
    {
      v14 = objc_retainAutorelease(v14);
      v16 = 0;
      *a6 = v14;
    }
  }
  else
  {
    v16 = 1;
  }

  return v16;
}

- (MCMLibraryRepairForUser)initWithManagedUserPathRegistry:(id)a3 fileManager:(id)a4 classIterator:(id)a5
{
  id v9;
  MCMLibraryRepairForUser *v10;
  MCMLibraryRepairForUser *v11;
  objc_super v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MCMLibraryRepairForUser;
  v10 = -[MCMLibraryRepair initWithManagedPathRegistry:fileManager:classIterator:](&v13, sel_initWithManagedPathRegistry_fileManager_classIterator_, v9, a4, a5);
  v11 = v10;
  if (v10)
    objc_storeStrong((id *)&v10->_userRegistry, a3);

  return v11;
}

- (BOOL)fixAndRetryIfPermissionsErrorWithURL:(id)a3 containerRootURL:(id)a4 error:(id *)a5 duringBlock:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  char v13;
  id v15[2];

  v15[1] = *(id *)MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a6;
  v12 = v11;
  if (v11)
  {
    v15[0] = 0;
    v13 = (*((uint64_t (**)(id, id, id *))v11 + 2))(v11, v9, v15);
    v11 = v15[0];
    if (a5 && (v13 & 1) == 0)
    {
      v11 = objc_retainAutorelease(v11);
      v13 = 0;
      *a5 = v11;
    }
  }
  else
  {
    v13 = 1;
  }

  return v13;
}

- (BOOL)performRepairForContainerPath:(id)a3 containerIdentifier:(id)a4 error:(id *)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  BOOL v19;
  id v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  BOOL v33;
  void *v34;
  uint64_t v35;
  NSObject *v36;
  BOOL v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  NSObject *v45;
  void *v46;
  void *v47;
  NSObject *v48;
  NSObject *v49;
  void *v51;
  id *v52;
  void *v53;
  id v54;
  void *v55;
  void *v56;
  void *v57;
  uint64_t v58;
  id obj;
  id v60;
  id v61;
  uint8_t buf[4];
  id v63;
  __int16 v64;
  id v65;
  _BYTE v66[128];
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  uint64_t v71;

  v71 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCMLibraryRepairForUser userRegistry](self, "userRegistry");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "userIdentity");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "posixUser");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "containerClassPath");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCMLibraryRepairForUser _managedPathFromContainerClassPath:registry:](self, "_managedPathFromContainerClassPath:registry:", v12, v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "containerPathIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = v13;
  objc_msgSend(v13, "managedPathByAppendingPathComponent:flags:ACLConfig:mode:dpClass:owner:", v14, 5, 1, 493, 0xFFFFFFFFLL, v11);
  v15 = objc_claimAutoreleasedReturnValue();

  v57 = (void *)v15;
  objc_msgSend(v8, "addObject:", v15);
  objc_msgSend(v9, "userIdentity");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "homeDirectoryURL");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "path");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v18)
  {
    objc_msgSend(v9, "userIdentity");
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v38)
    {
      container_log_handle_for_category();
      v45 = objc_claimAutoreleasedReturnValue();
      v41 = v56;
      if (os_log_type_enabled(v45, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1CF807000, v45, OS_LOG_TYPE_FAULT, "User path registry has no user identity", buf, 2u);
      }
      goto LABEL_39;
    }
    objc_msgSend(v9, "userIdentity");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "homeDirectoryURL");
    v40 = (void *)objc_claimAutoreleasedReturnValue();

    v41 = v56;
    if (v40)
    {
      objc_msgSend(v9, "userIdentity");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "homeDirectoryURL");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "path");
      v44 = (void *)objc_claimAutoreleasedReturnValue();

      if (v44)
        goto LABEL_40;
      container_log_handle_for_category();
      v45 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_FAULT))
      {
        objc_msgSend(v9, "userIdentity");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "homeDirectoryURL");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v63 = v47;
        _os_log_fault_impl(&dword_1CF807000, v45, OS_LOG_TYPE_FAULT, "User identity has no home directory path cannot be computed (%@)", buf, 0xCu);

LABEL_45:
      }
    }
    else
    {
      container_log_handle_for_category();
      v45 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_FAULT))
      {
        objc_msgSend(v9, "userIdentity");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v63 = v46;
        _os_log_fault_impl(&dword_1CF807000, v45, OS_LOG_TYPE_FAULT, "User identity has no home directory URL (%@)", buf, 0xCu);
        goto LABEL_45;
      }
    }
LABEL_39:

LABEL_40:
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MCMErrorDomain"), 75, 0);
    v20 = (id)objc_claimAutoreleasedReturnValue();
    v37 = 0;
    if (!a5)
      goto LABEL_43;
    goto LABEL_41;
  }
  v61 = 0;
  v19 = -[MCMLibraryRepair performGenericRepairWithError:](self, "performGenericRepairWithError:", &v61);
  v20 = v61;
  if (!v19)
  {
    container_log_handle_for_category();
    v48 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v63 = v20;
      _os_log_error_impl(&dword_1CF807000, v48, OS_LOG_TYPE_ERROR, "Failed to repair generic paths: %@", buf, 0xCu);
    }

    v37 = 0;
    v41 = v56;
    if (!a5)
      goto LABEL_43;
LABEL_41:
    if (!v37)
      *a5 = objc_retainAutorelease(v20);
    goto LABEL_43;
  }
  v55 = v11;
  objc_msgSend(v9, "orderedPathsFromPaths:", v8);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v67 = 0u;
  v68 = 0u;
  v69 = 0u;
  v70 = 0u;
  obj = v21;
  v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v67, v66, 16);
  if (v22)
  {
    v23 = v22;
    v51 = v9;
    v52 = a5;
    v53 = v8;
    v54 = v7;
    v24 = *(_QWORD *)v68;
    v58 = *MEMORY[0x1E0CB2FE0];
    while (2)
    {
      v25 = 0;
      v26 = v20;
      do
      {
        if (*(_QWORD *)v68 != v24)
          objc_enumerationMutation(obj);
        v27 = *(void **)(*((_QWORD *)&v67 + 1) + 8 * v25);
        container_log_handle_for_category();
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v63 = v27;
          _os_log_impl(&dword_1CF807000, v28, OS_LOG_TYPE_DEFAULT, "Examining %@ for repair.", buf, 0xCu);
        }

        objc_msgSend(v27, "owner");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = objc_msgSend(v29, "UID");
        objc_msgSend(v27, "owner");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = objc_msgSend(v31, "primaryGID");
        v60 = v26;
        v33 = -[MCMLibraryRepair fixPermissionsWithManagedPath:uid:gid:error:](self, "fixPermissionsWithManagedPath:uid:gid:error:", v27, v30, v32, &v60);
        v20 = v60;

        if (!v33)
        {
          objc_msgSend(v20, "domain");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          if (!objc_msgSend(v34, "isEqualToString:", v58))
          {

LABEL_32:
            container_log_handle_for_category();
            v49 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412546;
              v63 = v27;
              v64 = 2112;
              v65 = v20;
              _os_log_error_impl(&dword_1CF807000, v49, OS_LOG_TYPE_ERROR, "Failed to repair [%@]: %@", buf, 0x16u);
            }

            v37 = 0;
            goto LABEL_35;
          }
          v35 = objc_msgSend(v20, "code");

          if (v35 != 2)
            goto LABEL_32;
          container_log_handle_for_category();
          v36 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v63 = v27;
            _os_log_impl(&dword_1CF807000, v36, OS_LOG_TYPE_DEFAULT, "Expected path [%@] does not exist, moving on", buf, 0xCu);
          }

        }
        ++v25;
        v26 = v20;
      }
      while (v23 != v25);
      v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v67, v66, 16);
      if (v23)
        continue;
      break;
    }
    v37 = 1;
LABEL_35:
    v8 = v53;
    v7 = v54;
    v9 = v51;
    a5 = v52;
  }
  else
  {
    v37 = 1;
  }
  v11 = v55;
  v41 = v56;

  if (a5)
    goto LABEL_41;
LABEL_43:

  return v37;
}

- (id)_managedPathsForGenericRepair
{
  void *v3;
  void *v4;
  void *v5;

  -[MCMLibraryRepairForUser userRegistry](self, "userRegistry");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "paths");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCMLibraryRepairForUser _setByAddingContainerClassPathsToSet:registry:](self, "_setByAddingContainerClassPathsToSet:registry:", v4, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_setByAddingContainerClassPathsToSet:(id)a3 registry:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t, void *);
  void *v20;
  id v21;
  id v22;
  MCMLibraryRepairForUser *v23;
  id v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = (void *)objc_msgSend(a3, "mutableCopy");
  objc_msgSend(v6, "userIdentity");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[MCMContainerClassPath containerPathTypeClasses](MCMContainerClassPath, "containerPathTypeClasses");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCMLibraryRepair classIterator](self, "classIterator");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = MEMORY[0x1E0C809B0];
  v18 = 3221225472;
  v19 = __73__MCMLibraryRepairForUser__setByAddingContainerClassPathsToSet_registry___block_invoke;
  v20 = &unk_1E8CB62F0;
  v21 = v9;
  v22 = v8;
  v23 = self;
  v24 = v6;
  v25 = v7;
  v11 = v7;
  v12 = v6;
  v13 = v8;
  v14 = v9;
  objc_msgSend(v10, "selectUserWithIterator:", &v17);

  v15 = (void *)objc_msgSend(v11, "copy", v17, v18, v19, v20);
  return v15;
}

- (id)_managedPathFromContainerClassPath:(id)a3 registry:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  MCMManagedPath *v11;
  void *v12;
  MCMManagedPath *v13;
  MCMManagedPath *v14;
  void *v15;
  uint64_t v16;
  MCMManagedPath *v17;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v5, "userIdentity");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "posixUser");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "baseURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "managedPathForURL:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = [MCMManagedPath alloc];
  objc_msgSend(v6, "categoryURL");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[MCMManagedPath initWithURL:flags:ACLConfig:mode:dpClass:owner:parent:](v11, "initWithURL:flags:ACLConfig:mode:dpClass:owner:parent:", v12, 1, 1, objc_msgSend(v6, "posixMode"), 0xFFFFFFFFLL, v8, v10);

  v14 = [MCMManagedPath alloc];
  objc_msgSend(v6, "classURL");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v6, "posixMode");

  v17 = -[MCMManagedPath initWithURL:flags:ACLConfig:mode:dpClass:owner:parent:](v14, "initWithURL:flags:ACLConfig:mode:dpClass:owner:parent:", v15, 1, 1, v16, 0xFFFFFFFFLL, v8, v13);
  return v17;
}

- (BOOL)_canRepairLocally
{
  BOOL v3;
  void *v4;
  void *v5;
  id v6;
  int v7;
  objc_super v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v9.receiver = self;
  v9.super_class = (Class)MCMLibraryRepairForUser;
  v3 = -[MCMLibraryRepair _canRepairLocally](&v9, sel__canRepairLocally);
  getpid();
  -[MCMLibraryRepairForUser userRegistry](self, "userRegistry");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "userIdentity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "homeDirectoryURL");
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v6, "fileSystemRepresentation");
  v7 = sandbox_check();

  return v7 && v3;
}

- (MCMManagedUserPathRegistry)userRegistry
{
  return self->_userRegistry;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userRegistry, 0);
}

void __73__MCMLibraryRepairForUser__setByAddingContainerClassPathsToSet_registry___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  __int128 v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  NSObject *v14;
  _BOOL4 v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  __int128 v31;
  id obj;
  uint64_t v33;
  id v34;
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  void *v40;
  _BYTE v41[128];
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v34 = a2;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  obj = *(id *)(a1 + 32);
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v41, 16);
  if (v3)
  {
    v5 = v3;
    v33 = *(_QWORD *)v43;
    *(_QWORD *)&v4 = 138412802;
    v31 = v4;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v43 != v33)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
        objc_msgSend(v7, "containerPathForUserIdentity:containerClass:", *(_QWORD *)(a1 + 40), objc_msgSend(v34, "containerClass", v31));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "baseURL");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "path");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "homeDirectoryURL");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "path");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v10, "hasPrefix:", v12);

        container_log_handle_for_category();
        v14 = objc_claimAutoreleasedReturnValue();
        v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG);

        if (v13)
        {
          if (v15)
          {
            container_log_handle_for_category();
            v16 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
            {
              NSStringFromClass((Class)v7);
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v8, "baseURL");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v22, "path");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(*(id *)(a1 + 40), "homeDirectoryURL");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v24, "path");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = v31;
              v36 = v21;
              v37 = 2112;
              v38 = v23;
              v39 = 2112;
              v40 = v25;
              _os_log_debug_impl(&dword_1CF807000, v16, OS_LOG_TYPE_DEBUG, "Including [%@:%@] since it is under [%@]", buf, 0x20u);

            }
          }
          objc_msgSend(*(id *)(a1 + 48), "_managedPathFromContainerClassPath:registry:", v8, *(_QWORD *)(a1 + 56));
          v17 = objc_claimAutoreleasedReturnValue();
          if (v17)
          {
            v18 = (void *)v17;
            do
            {
              objc_msgSend(*(id *)(a1 + 64), "addObject:", v18);
              objc_msgSend(v18, "parent");
              v19 = objc_claimAutoreleasedReturnValue();

              v18 = (void *)v19;
            }
            while (v19);
          }
        }
        else if (v15)
        {
          container_log_handle_for_category();
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
          {
            NSStringFromClass((Class)v7);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "baseURL");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "path");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(a1 + 40), "homeDirectoryURL");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "path");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v31;
            v36 = v26;
            v37 = 2112;
            v38 = v28;
            v39 = 2112;
            v40 = v30;
            _os_log_debug_impl(&dword_1CF807000, v20, OS_LOG_TYPE_DEBUG, "Skipping [%@:%@] since it isn't under [%@]", buf, 0x20u);

          }
        }

      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v41, 16);
    }
    while (v5);
  }

}

@end
