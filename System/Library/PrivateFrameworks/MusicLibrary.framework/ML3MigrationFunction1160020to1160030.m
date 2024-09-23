@implementation ML3MigrationFunction1160020to1160030

void __ML3MigrationFunction1160020to1160030_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  id v25;
  _QWORD v26[5];

  v26[4] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "stringForColumnIndex:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "intForColumnIndex:", 1);

  ML3MigrationPathFromArtworkCacheIDAsOf1160030(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(a1 + 32), "fileExistsAtPath:", v6))
  {
    v7 = v5;
    ML3MigrationRelativePathFromArtworkComponentsAsOf1160030((uint64_t)v4, 1, v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "stringByAppendingPathComponent:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringByDeletingLastPathComponent");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(*(id *)(a1 + 32), "fileExistsAtPath:", v10) & 1) == 0)
      objc_msgSend(*(id *)(a1 + 32), "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v10, 1, 0, 0);
    v11 = *(void **)(a1 + 32);
    v19 = 0;
    objc_msgSend(v11, "moveItemAtPath:toPath:error:", v6, v9, &v19);
    v12 = v19;
    if (v12)
    {
      v13 = v12;
      v14 = os_log_create("com.apple.amp.medialibrary", "Migration");
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543874;
        v21 = v6;
        v22 = 2114;
        v23 = v9;
        v24 = 2114;
        v25 = v13;
        _os_log_impl(&dword_1AC149000, v14, OS_LOG_TYPE_ERROR, "Failed to migrate artwork from '%{public}@' to '%{public}@' with error: %{public}@", buf, 0x20u);
      }
    }
    else
    {
      v15 = *(void **)(a1 + 48);
      v26[0] = v4;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v7);
      v14 = objc_claimAutoreleasedReturnValue();
      v26[1] = v14;
      v26[2] = v8;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v26[3] = v16;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 4);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 0;
      objc_msgSend(v15, "executeUpdate:withParameters:error:", CFSTR("INSERT INTO artwork (artwork_token, artwork_source_type, relative_path, artwork_type) VALUES (?,?,?,?)"), v17, &v18);
      v13 = v18;

    }
  }

}

void __ML3MigrationFunction1160020to1160030_block_invoke_666(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  id v25;
  _QWORD v26[5];

  v26[4] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "stringForColumnIndex:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "intForColumnIndex:", 1);

  ML3MigrationPathFromArtworkCacheIDAsOf1160030(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(a1 + 32), "fileExistsAtPath:", v6))
  {
    v7 = v5;
    ML3MigrationRelativePathFromArtworkComponentsAsOf1160030((uint64_t)v4, 2, v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "stringByAppendingPathComponent:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringByDeletingLastPathComponent");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(*(id *)(a1 + 32), "fileExistsAtPath:", v10) & 1) == 0)
      objc_msgSend(*(id *)(a1 + 32), "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v10, 1, 0, 0);
    v11 = *(void **)(a1 + 32);
    v19 = 0;
    objc_msgSend(v11, "moveItemAtPath:toPath:error:", v6, v9, &v19);
    v12 = v19;
    if (v12)
    {
      v13 = v12;
      v14 = os_log_create("com.apple.amp.medialibrary", "Migration");
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543874;
        v21 = v6;
        v22 = 2114;
        v23 = v9;
        v24 = 2114;
        v25 = v13;
        _os_log_impl(&dword_1AC149000, v14, OS_LOG_TYPE_ERROR, "Failed to migrate screenshot from '%{public}@' to '%{public}@' with error: %{public}@", buf, 0x20u);
      }
    }
    else
    {
      v15 = *(void **)(a1 + 48);
      v26[0] = v4;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v7);
      v14 = objc_claimAutoreleasedReturnValue();
      v26[1] = v14;
      v26[2] = v8;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 2);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v26[3] = v16;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 4);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 0;
      objc_msgSend(v15, "executeUpdate:withParameters:error:", CFSTR("INSERT INTO artwork (artwork_token, artwork_source_type, relative_path, artwork_type) VALUES (?,?,?,?)"), v17, &v18);
      v13 = v18;

    }
  }

}

void __ML3MigrationFunction1160020to1160030_block_invoke_669(id *a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id v9;
  uint64_t v10;

  v3 = a2;
  v4 = objc_msgSend(v3, "int64ForColumnIndex:", 0);
  objc_msgSend(v3, "dataForColumnIndex:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __ML3MigrationFunction1160020to1160030_block_invoke_2;
  v6[3] = &unk_1E5B5C710;
  v7 = a1[4];
  v10 = v4;
  v8 = a1[5];
  v9 = a1[6];
  +[MLITChapterTOC enumerateArtworkCacheIDsInFlattenedChapterData:usingBlock:](MLITChapterTOC, "enumerateArtworkCacheIDsInFlattenedChapterData:usingBlock:", v5, v6);

}

void __ML3MigrationFunction1160020to1160030_block_invoke_678(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  id v22;
  _QWORD v23[5];

  v23[4] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "stringForColumnIndex:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  ML3MigrationPathFromArtworkCacheIDAsOf1160030(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(a1 + 32), "fileExistsAtPath:", v4))
  {
    ML3MigrationRelativePathFromArtworkComponentsAsOf1160030((uint64_t)v3, 4, 500);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "stringByAppendingPathComponent:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringByDeletingLastPathComponent");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(*(id *)(a1 + 32), "fileExistsAtPath:", v7) & 1) == 0)
      objc_msgSend(*(id *)(a1 + 32), "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v7, 1, 0, 0);
    v8 = *(void **)(a1 + 32);
    v16 = 0;
    objc_msgSend(v8, "moveItemAtPath:toPath:error:", v4, v6, &v16);
    v9 = v16;
    if (v9)
    {
      v10 = v9;
      v11 = os_log_create("com.apple.amp.medialibrary", "Migration");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543874;
        v18 = v4;
        v19 = 2114;
        v20 = v6;
        v21 = 2114;
        v22 = v10;
        _os_log_impl(&dword_1AC149000, v11, OS_LOG_TYPE_ERROR, "Failed to migrate artist hero artwork from '%{public}@' to '%{public}@' with error: %{public}@", buf, 0x20u);
      }
    }
    else
    {
      v12 = *(void **)(a1 + 48);
      v23[0] = v3;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 500);
      v11 = objc_claimAutoreleasedReturnValue();
      v23[1] = v11;
      v23[2] = v5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 4);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v23[3] = v13;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 4);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 0;
      objc_msgSend(v12, "executeUpdate:withParameters:error:", CFSTR("INSERT INTO artwork (artwork_token, artwork_source_type, relative_path, artwork_type) VALUES (?,?,?,?)"), v14, &v15);
      v10 = v15;

    }
  }

}

void __ML3MigrationFunction1160020to1160030_block_invoke_2(uint64_t a1, void *a2)
{
  NSObject *v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  uint8_t buf[4];
  NSObject *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  id v26;
  _QWORD v27[5];

  v27[4] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (-[NSObject length](v3, "length"))
  {
    ML3MigrationPathFromArtworkCacheIDAsOf1160030(v3);
    v4 = objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(*(id *)(a1 + 32), "fileExistsAtPath:", v4))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("chapter=%llu"), *(_QWORD *)(a1 + 56));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = -[NSObject rangeOfString:](v3, "rangeOfString:", CFSTR("-"));
      if (v6 == 0x7FFFFFFFFFFFFFFFLL)
      {
        v7 = os_log_create("com.apple.amp.medialibrary", "Migration");
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          v22 = v3;
          _os_log_impl(&dword_1AC149000, v7, OS_LOG_TYPE_ERROR, "Encountered invalid chapter artwork_cache_id '%{public}@', skipping...", buf, 0xCu);
        }
      }
      else
      {
        -[NSObject stringByReplacingCharactersInRange:withString:](v3, "stringByReplacingCharactersInRange:withString:", 0, v6, v5);
        v7 = objc_claimAutoreleasedReturnValue();
        ML3MigrationRelativePathFromArtworkComponentsAsOf1160030((uint64_t)v7, 3, 0);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "stringByAppendingPathComponent:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "stringByDeletingLastPathComponent");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(*(id *)(a1 + 32), "fileExistsAtPath:", v10) & 1) == 0)
          objc_msgSend(*(id *)(a1 + 32), "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v10, 1, 0, 0);
        v11 = *(void **)(a1 + 32);
        v20 = 0;
        objc_msgSend(v11, "moveItemAtPath:toPath:error:", v4, v9, &v20);
        v12 = v20;
        if (v12)
        {
          v13 = v12;
          v14 = os_log_create("com.apple.amp.medialibrary", "Migration");
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543874;
            v22 = v4;
            v23 = 2114;
            v24 = v9;
            v25 = 2114;
            v26 = v13;
            _os_log_impl(&dword_1AC149000, v14, OS_LOG_TYPE_ERROR, "Failed to migrate chapter artwork from '%{public}@' to '%{public}@' with error: %{public}@", buf, 0x20u);
          }
        }
        else
        {
          v15 = *(void **)(a1 + 48);
          v27[0] = v7;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 0);
          v14 = objc_claimAutoreleasedReturnValue();
          v27[1] = v14;
          v27[2] = v8;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 3);
          v18 = v8;
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v27[3] = v16;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 4);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = 0;
          objc_msgSend(v15, "executeUpdate:withParameters:error:", CFSTR("INSERT INTO artwork (artwork_token, artwork_source_type, relative_path, artwork_type) VALUES (?,?,?,?)"), v17, &v19);
          v13 = v19;

          v8 = v18;
        }

      }
    }
  }
  else
  {
    v4 = os_log_create("com.apple.amp.medialibrary", "Migration");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AC149000, v4, OS_LOG_TYPE_ERROR, "Encountered missing chapter artwork_cache_id, skipping...", buf, 2u);
    }
  }

}

@end
