@implementation ML3MigrationFunctionPatchUpIncorrectDateDownloaded

void ___ML3MigrationFunctionPatchUpIncorrectDateDownloaded_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  NSObject *v16;
  double v17;
  void *v18;
  NSObject *v19;
  id v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  id v24;
  _QWORD v25[4];

  v25[3] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = objc_msgSend(v3, "int64ForColumnIndex:", 0);
  objc_msgSend(v3, "stringForColumnIndex:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringForColumnIndex:", 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "doubleForColumnIndex:", 3);
  v8 = v7;

  v9 = (void *)MEMORY[0x1E0CB3940];
  v25[0] = *(_QWORD *)(a1 + 32);
  v25[1] = v5;
  v25[2] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "pathWithComponents:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "fileExistsAtPath:", v11))
  {
    v20 = 0;
    objc_msgSend(v12, "attributesOfItemAtPath:error:", v11, &v20);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v20;
    if (v14 || !v13)
    {
      v16 = os_log_create("com.apple.amp.medialibrary", "Default");
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        v22 = v11;
        v23 = 2114;
        v24 = v14;
        _os_log_impl(&dword_1AC149000, v16, OS_LOG_TYPE_ERROR, "Could not get attributes for item at %{public}@, error=%{public}@", buf, 0x16u);
      }
      goto LABEL_12;
    }
    objc_msgSend(v13, "objectForKey:", *MEMORY[0x1E0CB2A38]);
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v15)
    {
      -[NSObject timeIntervalSince1970](v15, "timeIntervalSince1970");
      if (vabdd_f64(v17, v8) >= 0.00000011920929)
      {
LABEL_12:

        goto LABEL_13;
      }
      v18 = *(void **)(a1 + 40);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v4);
      v19 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setObject:forKey:", v16, v19);
    }
    else
    {
      v19 = os_log_create("com.apple.amp.medialibrary", "Default");
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v22 = v11;
        _os_log_impl(&dword_1AC149000, v19, OS_LOG_TYPE_ERROR, "Could not get creation date from file attributes for item at %{public}@", buf, 0xCu);
      }
    }

    goto LABEL_12;
  }
LABEL_13:

}

void ___ML3MigrationFunctionPatchUpIncorrectDateDownloaded_block_invoke_1806(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  char v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  id v13;
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  id v17;
  _QWORD v18[3];

  v18[2] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 32);
  v18[0] = v6;
  v18[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  v9 = objc_msgSend(v7, "executeUpdate:withParameters:error:", CFSTR("UPDATE item SET date_downloaded = ? WHERE item_pid = ?"), v8, &v13);
  v10 = v13;

  if ((v9 & 1) == 0)
  {
    v11 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = objc_msgSend(v5, "longLongValue");
      *(_DWORD *)buf = 134218242;
      v15 = v12;
      v16 = 2114;
      v17 = v10;
      _os_log_impl(&dword_1AC149000, v11, OS_LOG_TYPE_ERROR, "Could not update date downloaded for item_pid %lld, error=%{public}@", buf, 0x16u);
    }

  }
}

@end
