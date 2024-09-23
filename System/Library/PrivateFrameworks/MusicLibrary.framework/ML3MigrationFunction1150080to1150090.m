@implementation ML3MigrationFunction1150080to1150090

void __ML3MigrationFunction1150080to1150090_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  _QWORD v19[4];

  v19[3] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = objc_msgSend(v3, "int64ForColumnIndex:", 0);
  objc_msgSend(v3, "stringForColumnIndex:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringForColumnIndex:", 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = os_log_create("com.apple.amp.medialibrary", "Migration");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134217984;
    v16 = v4;
    _os_log_impl(&dword_1AC149000, v7, OS_LOG_TYPE_ERROR, "Found an item (%lld) that has a location in the database, but no file size.", buf, 0xCu);
  }

  v8 = (void *)MEMORY[0x1E0CB3940];
  v19[0] = *(_QWORD *)(a1 + 32);
  v19[1] = v5;
  v19[2] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "pathWithComponents:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(*(id *)(a1 + 40), "fileExistsAtPath:isDirectory:", v10, 0))
  {
    objc_msgSend(*(id *)(a1 + 40), "attributesOfItemAtPath:error:", v10, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "fileSize");

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("UPDATE item_extra SET file_size = %zu WHERE item_pid = %lld"), v12, v4);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = os_log_create("com.apple.amp.medialibrary", "Migration");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      v16 = v12;
      v17 = 2048;
      v18 = v4;
      _os_log_impl(&dword_1AC149000, v14, OS_LOG_TYPE_ERROR, "Computed %zu file size for item %lld.", buf, 0x16u);
    }

    objc_msgSend(*(id *)(a1 + 48), "addObject:", v13);
  }
  else
  {
    v13 = os_log_create("com.apple.amp.medialibrary", "Migration");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      v16 = v4;
      _os_log_impl(&dword_1AC149000, v13, OS_LOG_TYPE_ERROR, "WARNING: item with pid %lld has a location in the database but no file on disk.", buf, 0xCu);
    }
  }

}

@end
