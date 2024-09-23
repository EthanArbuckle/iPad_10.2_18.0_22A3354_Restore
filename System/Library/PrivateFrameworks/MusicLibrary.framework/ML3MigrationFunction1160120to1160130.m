@implementation ML3MigrationFunction1160120to1160130

void __ML3MigrationFunction1160120to1160130_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;

  v3 = a2;
  objc_msgSend(v3, "stringForColumnIndex:", 0);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringForColumnIndex:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v4, v5);
}

void __ML3MigrationFunction1160120to1160130_block_invoke_808(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  id v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  NSObject *v37;
  void *v38;
  id v39;
  NSObject *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  id obj;
  id v47;
  id v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  id v53;
  id v54;
  uint8_t v55[128];
  uint8_t buf[4];
  void *v57;
  __int16 v58;
  id v59;
  __int16 v60;
  id v61;
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v43 = v5;
  ML3MigrationRelativePathFromArtworkTokenAsOf1160130(v5);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "URLByAppendingPathComponent:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *(void **)(a1 + 40);
  objc_msgSend(v7, "path");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v8) = objc_msgSend(v8, "fileExistsAtPath:", v9);

  if ((_DWORD)v8)
  {
    objc_msgSend(*(id *)(a1 + 48), "URLByAppendingPathComponent:", v44);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "URLByDeletingLastPathComponent");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(*(id *)(a1 + 56), "containsObject:", v11) & 1) == 0)
    {
      v12 = *(void **)(a1 + 40);
      objc_msgSend(v11, "path");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v12) = objc_msgSend(v12, "fileExistsAtPath:", v13);

      if ((v12 & 1) == 0)
      {
        v14 = *(void **)(a1 + 40);
        v54 = 0;
        objc_msgSend(v14, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v11, 1, 0, &v54);
        v15 = v54;
        if (v15)
        {
          v16 = os_log_create("com.apple.amp.medialibrary", "Default");
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543618;
            v57 = v11;
            v58 = 2114;
            v59 = v15;
            _os_log_impl(&dword_1AC149000, v16, OS_LOG_TYPE_ERROR, "Failed to create artwork directory '%{public}@' with error: %{public}@", buf, 0x16u);
          }

        }
        else
        {
          objc_msgSend(*(id *)(a1 + 56), "addObject:", v11);
        }

      }
    }
    v17 = *(void **)(a1 + 40);
    v53 = 0;
    objc_msgSend(v17, "moveItemAtURL:toURL:error:", v7, v10, &v53);
    v18 = v53;
    if (v18)
    {
      v19 = os_log_create("com.apple.amp.medialibrary", "Default");
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543874;
        v57 = v7;
        v58 = 2114;
        v59 = v10;
        v60 = 2114;
        v61 = v18;
        _os_log_impl(&dword_1AC149000, v19, OS_LOG_TYPE_ERROR, "Failed to move original artwork from '%{public}@' to '%{public}@' with error: %{public}@", buf, 0x20u);
      }

    }
  }
  v42 = v7;
  v51 = 0u;
  v52 = 0u;
  v49 = 0u;
  v50 = 0u;
  obj = *(id *)(a1 + 64);
  v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v55, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v50;
    do
    {
      v23 = 0;
      v45 = v21;
      do
      {
        if (*(_QWORD *)v50 != v22)
          objc_enumerationMutation(obj);
        v24 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * v23);
        objc_msgSend(v24, "lastPathComponent");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "URLByAppendingPathComponent:", v6);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = *(void **)(a1 + 40);
        objc_msgSend(v26, "path");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v27) = objc_msgSend(v27, "fileExistsAtPath:", v28);

        if ((_DWORD)v27)
        {
          v29 = v6;
          objc_msgSend(*(id *)(a1 + 72), "URLByAppendingPathComponent:", v25);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "URLByAppendingPathComponent:", v44);
          v31 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v31, "URLByDeletingLastPathComponent");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(*(id *)(a1 + 56), "containsObject:", v32) & 1) == 0)
          {
            v33 = *(void **)(a1 + 40);
            objc_msgSend(v32, "path");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            LOBYTE(v33) = objc_msgSend(v33, "fileExistsAtPath:", v34);

            if ((v33 & 1) == 0)
            {
              v35 = *(void **)(a1 + 40);
              v48 = 0;
              objc_msgSend(v35, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v32, 1, 0, &v48);
              v36 = v48;
              if (v36)
              {
                v37 = os_log_create("com.apple.amp.medialibrary", "Default");
                if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138543618;
                  v57 = v32;
                  v58 = 2114;
                  v59 = v36;
                  _os_log_impl(&dword_1AC149000, v37, OS_LOG_TYPE_ERROR, "Failed to create artwork cache directory '%{public}@' with error: %{public}@", buf, 0x16u);
                }

              }
              else
              {
                objc_msgSend(*(id *)(a1 + 56), "addObject:", v32);
              }

            }
          }
          v38 = *(void **)(a1 + 40);
          v47 = 0;
          objc_msgSend(v38, "moveItemAtURL:toURL:error:", v26, v31, &v47);
          v39 = v47;
          if (v39)
          {
            v40 = os_log_create("com.apple.amp.medialibrary", "Default");
            if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543874;
              v57 = v26;
              v58 = 2114;
              v59 = v31;
              v60 = 2114;
              v61 = v39;
              _os_log_impl(&dword_1AC149000, v40, OS_LOG_TYPE_ERROR, "Failed to move cached artwork from '%{public}@' to '%{public}@' with error: %{public}@", buf, 0x20u);
            }

          }
          v6 = v29;
          v21 = v45;
        }

        ++v23;
      }
      while (v21 != v23);
      v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v55, 16);
    }
    while (v21);
  }

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("UPDATE artwork SET relative_path = '%@' WHERE artwork_token = '%@'"), v44, v43);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 80), "addObject:", v41);

}

@end
