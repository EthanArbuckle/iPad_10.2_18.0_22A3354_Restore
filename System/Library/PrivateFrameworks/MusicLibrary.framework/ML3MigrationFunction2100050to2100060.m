@implementation ML3MigrationFunction2100050to2100060

void __ML3MigrationFunction2100050to2100060_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  int v15;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  int v19;
  NSObject *v20;
  const char *v21;
  NSObject *v22;
  os_log_type_t v23;
  uint32_t v24;
  NSObject *v25;
  const char *v26;
  NSObject *v27;
  os_log_type_t v28;
  void *v29;
  char v30;
  NSObject *v31;
  void *v32;
  int v33;
  id v34;
  id v35;
  id v36;
  uint8_t buf[4];
  NSObject *v38;
  __int16 v39;
  NSObject *v40;
  __int16 v41;
  uint64_t v42;
  _QWORD v43[4];

  v43[3] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "integerValue");

  objc_msgSend(v3, "objectAtIndexedSubscript:", 1);
  v6 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectAtIndexedSubscript:", 2);
  v7 = objc_claimAutoreleasedReturnValue();

  if (-[NSObject hasPrefix:](v6, "hasPrefix:", *(_QWORD *)(a1 + 32)))
  {
    v8 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(*(id *)(a1 + 40), "mediaFolderPath");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v43[0] = v9;
    v43[1] = v6;
    v43[2] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v43, 3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "pathWithComponents:", v10);
    v11 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 40), "pathForBaseLocationPath:", v5);
    v12 = objc_claimAutoreleasedReturnValue();
    -[NSObject stringByAppendingPathComponent:](v12, "stringByAppendingPathComponent:", v7);
    v13 = objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(*(id *)(a1 + 48), "fileExistsAtPath:", v13))
    {
      v14 = *(void **)(a1 + 48);
      v36 = 0;
      v15 = objc_msgSend(v14, "removeItemAtPath:error:", v13, &v36);
      v16 = v36;
      v17 = v16;
      if (v15)
      {
        v18 = os_log_create("com.apple.amp.medialibrary", "Migration");
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v38 = v13;
          _os_log_impl(&dword_1AC149000, v18, OS_LOG_TYPE_ERROR, "SyncLocationRollback: Removed existing file at path=%@", buf, 0xCu);
        }

        if (v17)
          goto LABEL_28;
      }
      else if (v16)
      {
        v25 = os_log_create("com.apple.amp.medialibrary", "Migration");
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          v38 = v13;
          v39 = 2112;
          v40 = v17;
          v26 = "SyncLocationRollback: Failed to remove existing file at path=%@ error=%@";
          v27 = v25;
          v28 = OS_LOG_TYPE_ERROR;
LABEL_26:
          _os_log_impl(&dword_1AC149000, v27, v28, v26, buf, 0x16u);
        }
LABEL_27:

LABEL_28:
        goto LABEL_29;
      }
    }
    if ((objc_msgSend(*(id *)(a1 + 48), "fileExistsAtPath:", v12) & 1) == 0)
    {
      v29 = *(void **)(a1 + 48);
      v35 = 0;
      v30 = objc_msgSend(v29, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v12, 1, 0, &v35);
      v17 = v35;
      if ((v30 & 1) == 0)
      {
        v31 = os_log_create("com.apple.amp.medialibrary", "Migration");
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          v38 = v12;
          v39 = 2112;
          v40 = v17;
          _os_log_impl(&dword_1AC149000, v31, OS_LOG_TYPE_ERROR, "SyncLocationRollback: Encountered error creating directory at path: %@ error=%@", buf, 0x16u);
        }

      }
      if (v17)
        goto LABEL_28;
    }
    v32 = *(void **)(a1 + 48);
    v34 = 0;
    v33 = objc_msgSend(v32, "moveItemAtPath:toPath:error:", v11, v13, &v34);
    v17 = v34;
    if (!v33)
      goto LABEL_28;
    v25 = os_log_create("com.apple.amp.medialibrary", "Migration");
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v38 = v11;
      v39 = 2112;
      v40 = v13;
      v26 = "SyncLocationRollback: Successfully moved item from %@ to %@";
      v27 = v25;
      v28 = OS_LOG_TYPE_DEFAULT;
      goto LABEL_26;
    }
    goto LABEL_27;
  }
  v19 = -[NSObject hasPrefix:](v6, "hasPrefix:", *(_QWORD *)(a1 + 56));
  v20 = os_log_create("com.apple.amp.medialibrary", "Migration");
  v17 = v20;
  if (v19)
  {
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v38 = v6;
      v39 = 2112;
      v40 = v7;
      v21 = "SyncLocationRollback: Asset location is %@/%@. Nothing to do";
      v22 = v17;
      v23 = OS_LOG_TYPE_DEFAULT;
      v24 = 22;
LABEL_13:
      _os_log_impl(&dword_1AC149000, v22, v23, v21, buf, v24);
    }
  }
  else if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412802;
    v38 = v6;
    v39 = 2112;
    v40 = v7;
    v41 = 2048;
    v42 = v5;
    v21 = "SyncLocationRollback: encountered unexpected path %@/%@ for item with base_location %llu";
    v22 = v17;
    v23 = OS_LOG_TYPE_ERROR;
    v24 = 32;
    goto LABEL_13;
  }
LABEL_29:

}

void __ML3MigrationFunction2100050to2100060_block_invoke_2205(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "objectAtIndexedSubscript:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "longLongValue");

  v5 = *(void **)(a1 + 32);
  objc_msgSend(v5, "pathForBaseLocationPath:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "mediaFolderRelativePath:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = *(void **)(a1 + 40);
  v11[0] = v7;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "executeUpdate:withParameters:error:", CFSTR("UPDATE base_location SET path = ? WHERE base_location_id = ?"), v10, 0);

}

void __ML3MigrationFunction2100050to2100060_block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "longLongValue");

  objc_msgSend(v3, "objectAtIndexedSubscript:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "longLongValue");
  v8 = os_log_create("com.apple.amp.medialibrary", "Migration");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 134218240;
    v12 = v5;
    v13 = 2048;
    v14 = v7;
    _os_log_impl(&dword_1AC149000, v8, OS_LOG_TYPE_DEFAULT, "SyncLocationRollback: Clearing location for pid=%lld with base_location_id %lld", (uint8_t *)&v11, 0x16u);
  }

  v9 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObject:", v10);

}

@end
