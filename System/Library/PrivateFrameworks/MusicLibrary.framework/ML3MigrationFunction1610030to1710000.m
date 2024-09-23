@implementation ML3MigrationFunction1610030to1710000

void __ML3MigrationFunction1610030to1710000_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  id v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  id v20;
  _QWORD v21[4];

  v21[3] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = objc_msgSend(v3, "int64ForColumnIndex:", 0);
  objc_msgSend(v3, "stringForColumnIndex:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringForColumnIndex:", 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x1E0CB3940];
  v21[0] = *(_QWORD *)(a1 + 32);
  v21[1] = v5;
  v21[2] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "pathWithComponents:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "fileExistsAtPath:", v9))
  {
    v16 = 0;
    objc_msgSend(v10, "attributesOfItemAtPath:error:", v9, &v16);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v16;
    if (v12 || !v11)
    {
      v13 = os_log_create("com.apple.amp.medialibrary", "Default");
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        v18 = v9;
        v19 = 2114;
        v20 = v12;
        _os_log_impl(&dword_1AC149000, v13, OS_LOG_TYPE_ERROR, "Could not get attributes for item at %{public}@, error=%{public}@", buf, 0x16u);
      }
    }
    else
    {
      objc_msgSend(v11, "objectForKey:", *MEMORY[0x1E0CB2A38]);
      v13 = objc_claimAutoreleasedReturnValue();
      if (v13)
      {
        v14 = *(void **)(a1 + 40);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v4);
        v15 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setObject:forKey:", v13, v15);
      }
      else
      {
        v15 = os_log_create("com.apple.amp.medialibrary", "Default");
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          v18 = v9;
          _os_log_impl(&dword_1AC149000, v15, OS_LOG_TYPE_ERROR, "Could not get creation date for item at %{public}@", buf, 0xCu);
        }
      }

    }
  }

}

void __ML3MigrationFunction1610030to1710000_block_invoke_1761(uint64_t a1, void *a2, void *a3)
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
