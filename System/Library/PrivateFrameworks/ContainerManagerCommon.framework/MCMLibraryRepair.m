@implementation MCMLibraryRepair

- (BOOL)fixAndRetryIfPermissionsErrorWithURL:(id)a3 error:(id *)a4 duringBlock:(id)a5
{
  id v7;
  id v8;
  void *v9;
  char v10;
  id v12[2];

  v12[1] = *(id *)MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a5;
  v9 = v8;
  if (v8)
  {
    v12[0] = 0;
    v10 = (*((uint64_t (**)(id, id, id *))v8 + 2))(v8, v7, v12);
    v8 = v12[0];
    if (a4 && (v10 & 1) == 0)
    {
      v8 = objc_retainAutorelease(v8);
      v10 = 0;
      *a4 = v8;
    }
  }
  else
  {
    v10 = 1;
  }

  return v10;
}

- (MCMLibraryRepair)initWithManagedPathRegistry:(id)a3 fileManager:(id)a4 classIterator:(id)a5
{
  id v9;
  id v10;
  id v11;
  MCMLibraryRepair *v12;
  MCMLibraryRepair *v13;
  objc_super v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)MCMLibraryRepair;
  v12 = -[MCMLibraryRepair init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_registry, a3);
    v13->_pathsCreated = 0;
    objc_storeStrong((id *)&v13->_fileManager, a4);
    objc_storeStrong((id *)&v13->_classIterator, a5);
  }

  return v13;
}

- (BOOL)fixPermissionsWithManagedPath:(id)a3 uid:(unsigned int)a4 gid:(unsigned int)a5 error:(id *)a6
{
  uint64_t v7;
  uint64_t v8;
  id v10;
  char v11;
  uint64_t v12;
  unint64_t v13;
  void *v14;
  void *v15;
  char v16;
  id v17;
  id v19[2];

  v7 = *(_QWORD *)&a5;
  v8 = *(_QWORD *)&a4;
  v19[1] = *(id *)MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = objc_msgSend(v10, "ACLConfig");
  v12 = objc_msgSend(v10, "ACLConfig") & 2 | v11 & 1;
  v13 = v12 & 0xFFFFFFFFFFFFFEFFLL | ((((unint64_t)objc_msgSend(v10, "flags") >> 2) & 1) << 8);
  -[MCMLibraryRepair fileManager](self, "fileManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "url");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v19[0] = 0;
  v16 = objc_msgSend(v14, "repairPermissionsAtURL:uid:gid:options:error:", v15, v8, v7, v13, v19);
  v17 = v19[0];

  if (a6)
    *a6 = objc_retainAutorelease(v17);

  return v16;
}

- (BOOL)performGenericRepairWithError:(id *)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  BOOL v18;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  void *v22;
  BOOL v23;
  void *v24;
  void *v25;
  NSObject *v26;
  id *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  id obj;
  id v33;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  id v37;
  _BYTE v38[128];
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  -[MCMLibraryRepair registry](self, "registry");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCMLibraryRepair _managedPathsForGenericRepair](self, "_managedPathsForGenericRepair");
  v29 = objc_claimAutoreleasedReturnValue();
  v30 = v5;
  objc_msgSend(v5, "orderedPathsFromPaths:");
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v38, 16);
  if (v6)
  {
    v7 = v6;
    v28 = a3;
    v8 = 0;
    v9 = *(_QWORD *)v40;
    v31 = *MEMORY[0x1E0CB2FE0];
    while (2)
    {
      v10 = 0;
      v11 = v8;
      do
      {
        if (*(_QWORD *)v40 != v9)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * v10);
        container_log_handle_for_category();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v35 = v12;
          _os_log_impl(&dword_1CF807000, v13, OS_LOG_TYPE_DEFAULT, "Examining %@ for repair.", buf, 0xCu);
        }

        objc_msgSend(v12, "owner");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "UID");
        objc_msgSend(v12, "owner");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "primaryGID");
        v33 = v11;
        v18 = -[MCMLibraryRepair fixPermissionsWithManagedPath:uid:gid:error:](self, "fixPermissionsWithManagedPath:uid:gid:error:", v12, v15, v17, &v33);
        v8 = v33;

        if (!v18)
        {
          objc_msgSend(v8, "domain");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          if (!objc_msgSend(v19, "isEqualToString:", v31))
          {

LABEL_20:
            container_log_handle_for_category();
            v26 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412546;
              v35 = v12;
              v36 = 2112;
              v37 = v8;
              _os_log_error_impl(&dword_1CF807000, v26, OS_LOG_TYPE_ERROR, "Failed to repair [%@]: %@", buf, 0x16u);
            }

            v22 = obj;
            v25 = (void *)v29;
            v24 = v30;
            if (v28)
            {
              v8 = objc_retainAutorelease(v8);
              v23 = 0;
              *v28 = v8;
            }
            else
            {
              v23 = 0;
            }
            goto LABEL_25;
          }
          v20 = objc_msgSend(v8, "code");

          if (v20 != 2)
            goto LABEL_20;
          container_log_handle_for_category();
          v21 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v35 = v12;
            _os_log_impl(&dword_1CF807000, v21, OS_LOG_TYPE_DEFAULT, "Expected path [%@] does not exist, moving on", buf, 0xCu);
          }

        }
        ++v10;
        v11 = v8;
      }
      while (v7 != v10);
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v38, 16);
      if (v7)
        continue;
      break;
    }
  }
  else
  {
    v8 = 0;
  }
  v22 = obj;

  v23 = 1;
  v25 = (void *)v29;
  v24 = v30;
LABEL_25:

  return v23;
}

- (BOOL)createPathsIfNecessaryWithError:(id *)a3
{
  MCMLibraryRepair *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  BOOL v15;
  id v16;
  BOOL v17;
  id *v19;
  void *v20;
  _QWORD v21[5];
  id v22;
  _BYTE v23[128];
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = self;
  objc_sync_enter(v4);
  if (-[MCMLibraryRepair pathsCreated](v4, "pathsCreated"))
  {
    v5 = 0;
  }
  else
  {
    -[MCMLibraryRepair _managedPathsForGenericRepair](v4, "_managedPathsForGenericRepair");
    v6 = objc_claimAutoreleasedReturnValue();
    -[MCMLibraryRepair registry](v4, "registry");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "orderedPathsFromPaths:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v9 = v8;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v23, 16);
    v20 = (void *)v6;
    if (v10)
    {
      v19 = a3;
      v5 = 0;
      v11 = *(_QWORD *)v25;
      while (2)
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v25 != v11)
            objc_enumerationMutation(v9);
          v13 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
          if ((objc_msgSend(v13, "flags", v19) & 2) != 0)
          {
            objc_msgSend(v13, "url");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = v5;
            v21[0] = MEMORY[0x1E0C809B0];
            v21[1] = 3221225472;
            v21[2] = __52__MCMLibraryRepair_createPathsIfNecessaryWithError___block_invoke;
            v21[3] = &unk_1E8CB6768;
            v21[4] = v13;
            v15 = -[MCMLibraryRepair fixAndRetryIfPermissionsErrorWithURL:error:duringBlock:](v4, "fixAndRetryIfPermissionsErrorWithURL:error:duringBlock:", v14, &v22, v21);
            v16 = v22;

            if (!v15)
            {

              objc_sync_exit(v4);
              if (v19)
              {
                v16 = objc_retainAutorelease(v16);
                v17 = 0;
                *v19 = v16;
              }
              else
              {
                v17 = 0;
              }
              goto LABEL_19;
            }
            v5 = v16;
          }
        }
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v23, 16);
        if (v10)
          continue;
        break;
      }
    }
    else
    {
      v5 = 0;
    }

    -[MCMLibraryRepair setPathsCreated:](v4, "setPathsCreated:", 1);
  }
  objc_sync_exit(v4);

  v17 = 1;
  v16 = v5;
LABEL_19:

  return v17;
}

- (BOOL)managedPathsHaveChanged
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  char v18;
  BOOL v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  id v32;
  __int16 v33;
  void *v34;
  _BYTE v35[128];
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  -[MCMLibraryRepair _managedPathsForGenericRepair](self, "_managedPathsForGenericRepair");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCMLibraryRepair registry](self, "registry");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "orderedPathsFromPaths:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v36, v35, 16);
  if (!v7)
  {
    v19 = 0;
    goto LABEL_20;
  }
  v8 = v7;
  v27 = v3;
  v9 = *(_QWORD *)v37;
  while (2)
  {
    for (i = 0; i != v8; ++i)
    {
      if (*(_QWORD *)v37 != v9)
        objc_enumerationMutation(v6);
      v11 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
      objc_msgSend(v11, "fsNode", v27);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
      {
        +[MCMFileManager defaultManager](MCMFileManager, "defaultManager");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "url");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = 0;
        objc_msgSend(v13, "fsNodeOfURL:followSymlinks:error:", v14, 1, &v28);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = v28;

        if (v15)
        {
          objc_msgSend(v11, "fsNode");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v17, "isEqual:", v15);

          if ((v18 & 1) != 0)
          {

            continue;
          }
          container_log_handle_for_category();
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v11, "url");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "path");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "fsNode");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v30 = v22;
            v31 = 2114;
            v32 = v23;
            v33 = 2114;
            v34 = v15;
            _os_log_impl(&dword_1CF807000, v20, OS_LOG_TYPE_DEFAULT, "Path [%{public}@] changed: old = %{public}@, new = %{public}@", buf, 0x20u);

          }
        }
        else
        {
          container_log_handle_for_category();
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v11, "url");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "path");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v30 = v26;
            v31 = 2114;
            v32 = v16;
            _os_log_error_impl(&dword_1CF807000, v20, OS_LOG_TYPE_ERROR, "Failed to get fsNode for [%{public}@] when checking for file system changes: %{public}@", buf, 0x16u);

          }
          v15 = 0;
        }
        v3 = v27;

        v19 = 1;
        goto LABEL_20;
      }
    }
    v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v36, v35, 16);
    if (v8)
      continue;
    break;
  }
  v19 = 0;
  v3 = v27;
LABEL_20:

  return v19;
}

- (id)_managedPathsForGenericRepair
{
  void *v2;
  void *v3;

  -[MCMLibraryRepair registry](self, "registry");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "paths");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)_canRepairLocally
{
  if (_canRepairLocally_onceToken != -1)
    dispatch_once(&_canRepairLocally_onceToken, &__block_literal_global_11612);
  return _canRepairLocally_canRepairLocally;
}

- (MCMManagedPathRegistry)registry
{
  return self->_registry;
}

- (BOOL)pathsCreated
{
  return self->_pathsCreated;
}

- (void)setPathsCreated:(BOOL)a3
{
  self->_pathsCreated = a3;
}

- (MCMFileManager)fileManager
{
  return self->_fileManager;
}

- (MCMContainerClassIterator)classIterator
{
  return self->_classIterator;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_classIterator, 0);
  objc_storeStrong((id *)&self->_fileManager, 0);
  objc_storeStrong((id *)&self->_registry, 0);
}

void __37__MCMLibraryRepair__canRepairLocally__block_invoke()
{
  id v0;

  +[MCMPOSIXUser currentPOSIXUser](MCMPOSIXUser, "currentPOSIXUser");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  _canRepairLocally_canRepairLocally = objc_msgSend(v0, "isRoot");

}

uint64_t __52__MCMLibraryRepair_createPathsIfNecessaryWithError___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;

  v5 = a2;
  +[MCMFileManager defaultManager](MCMFileManager, "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(*(id *)(a1 + 32), "mode");
  objc_msgSend(*(id *)(a1 + 32), "owner");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "createDirectoryAtURL:withIntermediateDirectories:mode:owner:dataProtectionClass:error:", v5, 0, v7, v8, objc_msgSend(*(id *)(a1 + 32), "dpClass"), a3);

  return v9;
}

@end
