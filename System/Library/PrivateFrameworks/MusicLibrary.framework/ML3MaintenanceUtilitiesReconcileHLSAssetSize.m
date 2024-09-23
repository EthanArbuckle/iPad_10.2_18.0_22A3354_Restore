@implementation ML3MaintenanceUtilitiesReconcileHLSAssetSize

void __ML3MaintenanceUtilitiesReconcileHLSAssetSize_block_invoke(uint64_t a1, NSObject *a2, id *a3)
{
  NSObject *v6;
  id v7;
  id v8;
  void *v9;
  BOOL v10;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  char v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  NSObject *v21;
  NSObject *v22;
  const char *v23;
  NSObject *v24;
  id v25;
  char v26;
  _QWORD v27[3];
  uint8_t buf[4];
  NSObject *v29;
  __int16 v30;
  NSObject *v31;
  __int16 v32;
  id v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v6 = *a3;
  v7 = a3[1];
  v8 = a3[2];
  v9 = v8;
  if (v6)
    v10 = v7 == 0;
  else
    v10 = 1;
  if (!v10 && v8 != 0)
  {
    v12 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(*(id *)(a1 + 32), "libraryContainerPath");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = v13;
    v27[1] = v6;
    v27[2] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "pathWithComponents:", v14);
    v15 = objc_claimAutoreleasedReturnValue();

    v26 = 0;
    v16 = objc_msgSend(*(id *)(a1 + 40), "fileExistsAtPath:isDirectory:", v15, &v26);
    if ((v16 & 1) != 0)
    {
      if (v26)
      {
        v17 = MSVGetDiskUsageForPath();
        if (v17)
        {
          v18 = v17;
          v19 = objc_msgSend(v9, "longValue");
          v20 = os_log_create("com.apple.amp.medialibrary", "Default");
          v21 = v20;
          if (v18 == v19)
          {
            if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 134217984;
              v29 = a2;
              _os_log_impl(&dword_1AC149000, v21, OS_LOG_TYPE_DEBUG, "ML3MaintenanceUtilitiesReconcileHLSAssetSize: found correct file size for pid=%lld.", buf, 0xCu);
            }

          }
          else
          {
            if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 134218498;
              v29 = a2;
              v30 = 2048;
              v31 = v18;
              v32 = 2114;
              v33 = v9;
              _os_log_impl(&dword_1AC149000, v21, OS_LOG_TYPE_DEFAULT, "ML3MaintenanceUtilitiesReconcileHLSAssetSize: updating file size for pid=%lld. found: %ld expected: %{public}@", buf, 0x20u);
            }

            v25 = +[ML3Entity newWithPersistentID:inLibrary:](ML3Track, "newWithPersistentID:inLibrary:", a2, *(_QWORD *)(a1 + 32));
            objc_msgSend(v25, "populateLocationPropertiesWithPath:", v15);

            *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) += v18 - objc_msgSend(v9, "longValue");
            ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
          }
        }
        else
        {
          v24 = os_log_create("com.apple.amp.medialibrary", "Default");
          if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 134218243;
            v29 = a2;
            v30 = 2113;
            v31 = v15;
            _os_log_impl(&dword_1AC149000, v24, OS_LOG_TYPE_ERROR, "ML3MaintenanceUtilitiesReconcileHLSAssetSize found unexpected diskSize of 0 for item pid=%lld at path=%{private}@", buf, 0x16u);
          }

        }
        goto LABEL_24;
      }
      v22 = os_log_create("com.apple.amp.medialibrary", "Default");
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138477827;
        v29 = v15;
        v23 = "ML3MaintenanceUtilitiesReconcileHLSAssetSize expected directory at path=%{private}@";
        goto LABEL_22;
      }
    }
    else
    {
      v22 = os_log_create("com.apple.amp.medialibrary", "Default");
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v29 = v15;
        v23 = "ML3MaintenanceUtilitiesReconcileHLSAssetSize failed to find file at path=%{public}@";
LABEL_22:
        _os_log_impl(&dword_1AC149000, v22, OS_LOG_TYPE_ERROR, v23, buf, 0xCu);
      }
    }

    goto LABEL_24;
  }
  v15 = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134218755;
    v29 = a2;
    v30 = 2113;
    v31 = v6;
    v32 = 2113;
    v33 = v7;
    v34 = 2114;
    v35 = v9;
    _os_log_impl(&dword_1AC149000, v15, OS_LOG_TYPE_ERROR, "ML3MaintenanceUtilitiesReconcileHLSAssetSize: failed to lookup values for pid=%lld, path=%{private}@, fileName=%{private}@, size=%{public}@", buf, 0x2Au);
  }
LABEL_24:

}

@end
