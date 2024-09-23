@implementation NSFileManager

- (uint64_t)_hd_removeDatabaseFilesAtDatabaseURL:(void *)a3 extensionSuffixes:(int)a4 preserveCopy:
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  void *v23;
  uint64_t v24;
  void *v25;
  id v26;
  void *v27;
  NSObject *v28;
  char v29;
  id v30;
  void *v31;
  NSObject *v32;
  NSObject *v33;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  char v39;
  id obj;
  id v42;
  id v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  uint8_t buf[4];
  void *v53;
  __int16 v54;
  void *v55;
  _BYTE v56[128];
  _BYTE v57[128];
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a3;
  v37 = v7;
  v38 = v6;
  if (a1)
  {
    v8 = v7;
    if (!v6)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "handleFailureInMethod:object:file:lineNumber:description:", sel__hd_removeDatabaseFilesAtDatabaseURL_extensionSuffixes_preserveCopy_, a1, CFSTR("NSFileManager+HealthDaemon.m"), 29, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("databaseURL != nil"));

    }
    if (!objc_msgSend(v8, "count"))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "handleFailureInMethod:object:file:lineNumber:description:", sel__hd_removeDatabaseFilesAtDatabaseURL_extensionSuffixes_preserveCopy_, a1, CFSTR("NSFileManager+HealthDaemon.m"), 30, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[extensionsSuffixes count] > 0"));

    }
    objc_msgSend(v6, "lastPathComponent");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "URLByDeletingLastPathComponent");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = 0u;
    v49 = 0u;
    v50 = 0u;
    v51 = 0u;
    v12 = v8;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v48, v57, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v49;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v49 != v15)
            objc_enumerationMutation(v12);
          objc_msgSend(v9, "stringByAppendingString:", *(_QWORD *)(*((_QWORD *)&v48 + 1) + 8 * i));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "URLByAppendingPathComponent:", v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "addObject:", v18);

        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v48, v57, 16);
      }
      while (v14);
    }

    v46 = 0u;
    v47 = 0u;
    v44 = 0u;
    v45 = 0u;
    obj = v11;
    v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v56, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v45;
      v39 = 1;
      do
      {
        for (j = 0; j != v20; ++j)
        {
          if (*(_QWORD *)v45 != v21)
            objc_enumerationMutation(obj);
          v23 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * j);
          if (a4)
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lf.moved-aside"), CFAbsoluteTimeGetCurrent());
            v24 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "URLByAppendingPathExtension:", v24);
            v25 = (void *)objc_claimAutoreleasedReturnValue();

            v43 = 0;
            LOBYTE(v24) = objc_msgSend(a1, "copyItemAtURL:toURL:error:", v23, v25, &v43);
            v26 = v43;
            v27 = v26;
            if ((v24 & 1) == 0 && (objc_msgSend(v26, "hk_isCocoaNoSuchFileError") & 1) == 0)
            {
              _HKInitializeLogging();
              v28 = *MEMORY[0x1E0CB52B0];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138543362;
                v53 = v27;
                _os_log_error_impl(&dword_1B7802000, v28, OS_LOG_TYPE_ERROR, "Failed to preserve copy of database file: %{public}@", buf, 0xCu);
              }
            }

          }
          v42 = 0;
          v29 = objc_msgSend(a1, "removeItemAtURL:error:", v23, &v42);
          v30 = v42;
          v31 = v30;
          if ((v29 & 1) != 0)
          {
            _HKInitializeLogging();
            v32 = *MEMORY[0x1E0CB52B0];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543362;
              v53 = v23;
              _os_log_impl(&dword_1B7802000, v32, OS_LOG_TYPE_DEFAULT, "Deleted database file at URL \"%{public}@\", buf, 0xCu);
            }
          }
          else if ((objc_msgSend(v30, "hk_isCocoaNoSuchFileError") & 1) == 0)
          {
            _HKInitializeLogging();
            v33 = *MEMORY[0x1E0CB52B0];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543618;
              v53 = v23;
              v54 = 2114;
              v55 = v31;
              _os_log_error_impl(&dword_1B7802000, v33, OS_LOG_TYPE_ERROR, "Failed to delete file at URL \"%{public}@\": %{public}@", buf, 0x16u);
            }
            v39 = 0;
          }

        }
        v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v56, 16);
      }
      while (v20);
    }
    else
    {
      v39 = 1;
    }

  }
  else
  {
    v39 = 0;
  }

  return v39 & 1;
}

@end
