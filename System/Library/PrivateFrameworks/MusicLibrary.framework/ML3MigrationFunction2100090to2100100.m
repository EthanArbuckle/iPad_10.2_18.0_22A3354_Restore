@implementation ML3MigrationFunction2100090to2100100

void __ML3MigrationFunction2100090to2100100_block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  id v16;
  NSObject *v17;
  NSObject *v18;
  id v19;
  void *v20;
  uint8_t buf[4];
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  if (v8)
  {
    v9 = os_log_create("com.apple.amp.medialibrary", "Migration");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v22 = v8;
      _os_log_impl(&dword_1AC149000, v9, OS_LOG_TYPE_ERROR, "Encountered error enumerating mismatched tracks. error=%{public}@", buf, 0xCu);
    }

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 0;
    *a4 = 1;
  }
  objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndexedSubscript:", 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "stringByAppendingPathComponent:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(a1 + 40), "fileExistsAtPath:", v12))
  {
    v13 = *(void **)(a1 + 48);
    v20 = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v20, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 0;
    v15 = objc_msgSend(v13, "executeUpdate:withParameters:error:", CFSTR("UPDATE item SET base_location_id = 250 WHERE item_pid = ?"), v14, &v19);
    v16 = v19;

    v17 = os_log_create("com.apple.amp.medialibrary", "Migration");
    v18 = v17;
    if (v15)
    {
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v22 = v10;
        _os_log_impl(&dword_1AC149000, v18, OS_LOG_TYPE_DEFAULT, "Updated base_location_id for mismatched pid %{public}@", buf, 0xCu);
      }

    }
    else
    {
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v22 = v16;
        _os_log_impl(&dword_1AC149000, v18, OS_LOG_TYPE_ERROR, "Encountered error updating mismatched tracks. error=%{public}@", buf, 0xCu);
      }

      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 0;
      *a4 = 1;
    }

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 56), "addObject:", v10);
  }

}

@end
