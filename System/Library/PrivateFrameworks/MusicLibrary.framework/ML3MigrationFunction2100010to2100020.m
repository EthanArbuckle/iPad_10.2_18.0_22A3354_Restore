@implementation ML3MigrationFunction2100010to2100020

void __ML3MigrationFunction2100010to2100020_block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  char v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  NSObject *v24;
  void *v25;
  char v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  id v35;
  id v36;
  _QWORD v37[3];
  _QWORD v38[2];
  _QWORD v39[2];
  uint8_t buf[4];
  uint64_t v41;
  __int16 v42;
  id v43;
  _QWORD v44[3];

  v44[2] = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  if (!v8)
  {
    objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "longLongValue");

    objc_msgSend(v7, "objectAtIndexedSubscript:", 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "integerValue");

    objc_msgSend(v7, "objectAtIndexedSubscript:", 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "integerValue");

    objc_msgSend(v7, "objectAtIndexedSubscript:", 3);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectAtIndexedSubscript:", 4);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if ((MSVDeviceSupportsMultipleLibraries() & 1) != 0 || v15 == 100)
      goto LABEL_9;
    if (v15 != 300)
    {
      if (v15 != 200)
      {
LABEL_10:

        goto LABEL_11;
      }
LABEL_9:
      v18 = *(void **)(a1 + 32);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v11);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "addObject:", v19);

      goto LABEL_10;
    }
    if ((v13 & 8) == 0)
      goto LABEL_10;
    v20 = *(void **)(a1 + 40);
    v44[0] = &unk_1E5BAAC08;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v11);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v44[1] = v21;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v44, 2);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = 0;
    objc_msgSend(v20, "executeUpdate:withParameters:error:", CFSTR("UPDATE item SET base_location_id = ? WHERE item_pid = ?"), v22, &v36);
    v23 = v36;

    if (v23)
    {
      _ML3LogCategoryMigration();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134218242;
        v41 = v11;
        v42 = 2112;
        v43 = v23;
        _os_log_impl(&dword_1AC149000, v24, OS_LOG_TYPE_ERROR, "Encountered error updating item.base_location_id to 250 for item_pid=%lld. error=%@", buf, 0x16u);
      }
    }
    else
    {
      +[ML3MusicLibrary pathForBaseLocationPath:](ML3MusicLibrary, "pathForBaseLocationPath:", 250);
      v24 = objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(*(id *)(a1 + 48), "fileExistsAtPath:", v24) & 1) != 0)
      {
        v23 = 0;
      }
      else
      {
        v25 = *(void **)(a1 + 48);
        v35 = 0;
        v26 = objc_msgSend(v25, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v24, 1, 0, &v35);
        v23 = v35;
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = v26;
        if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24))
        {
          _ML3LogCategoryMigration();
          v32 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            v41 = (uint64_t)v24;
            v42 = 2112;
            v43 = v23;
            _os_log_impl(&dword_1AC149000, v32, OS_LOG_TYPE_ERROR, "Encountered error creating directory at path %@. error=%@", buf, 0x16u);
          }

          *a4 = 1;
          goto LABEL_20;
        }
      }
      v33 = *(void **)(a1 + 56);
      v38[0] = *(_QWORD *)(a1 + 64);
      -[NSObject stringByAppendingPathComponent:](v24, "stringByAppendingPathComponent:", v17);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v38[1] = *(_QWORD *)(a1 + 72);
      v39[0] = v34;
      v27 = (void *)MEMORY[0x1E0CB3940];
      +[ML3MusicLibrary mediaFolderPath](ML3MusicLibrary, "mediaFolderPath");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v37[0] = v28;
      v37[1] = v16;
      v37[2] = v17;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 3);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "pathWithComponents:", v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v39[1] = v30;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v39, v38, 2);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "addObject:", v31);

    }
LABEL_20:

    goto LABEL_10;
  }
  v9 = os_log_create("com.apple.amp.medialibrary", "Migration");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v41 = (uint64_t)v8;
    _os_log_impl(&dword_1AC149000, v9, OS_LOG_TYPE_ERROR, "Encountered error with initial query. error=%@", buf, 0xCu);
  }

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = 0;
  *a4 = 1;
LABEL_11:

}

void __ML3MigrationFunction2100010to2100020_block_invoke_2150(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  NSObject *v17;
  void *v18;
  id v19;
  uint8_t buf[4];
  uint64_t v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  NSObject *v25;
  _QWORD v26[3];

  v26[2] = *MEMORY[0x1E0C80C00];
  v6 = a2;
  objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "integerValue");

  if (v8)
  {
    objc_msgSend(*(id *)(a1 + 32), "pathForBaseLocationPath:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "mediaFolderRelativePath:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = os_log_create("com.apple.amp.medialibrary", "Migration");
    v12 = v11;
    if (v10)
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134218242;
        v21 = v8;
        v22 = 2112;
        v23 = v10;
        _os_log_impl(&dword_1AC149000, v12, OS_LOG_TYPE_DEBUG, "Updating base_location table. base_location_id=%lld path=%@", buf, 0x16u);
      }

      v13 = *(void **)(a1 + 40);
      v26[0] = v10;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v8);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v26[1] = v14;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 2);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 0;
      v16 = objc_msgSend(v13, "executeUpdate:withParameters:error:", CFSTR("UPDATE base_location SET path = ? where base_location_id = ?"), v15, &v19);
      v12 = v19;
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v16;

      if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
      {
        v17 = os_log_create("com.apple.amp.medialibrary", "Migration");
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134218498;
          v21 = v8;
          v22 = 2112;
          v23 = v10;
          v24 = 2112;
          v25 = v12;
          _os_log_impl(&dword_1AC149000, v17, OS_LOG_TYPE_ERROR, "Encountered error updating base_location table. base_location_id=%lld path=%@ error=%@", buf, 0x20u);
        }

        *a4 = 1;
      }
    }
    else if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v6, "stringForColumnIndex:", 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218242;
      v21 = v8;
      v22 = 2114;
      v23 = v18;
      _os_log_impl(&dword_1AC149000, v12, OS_LOG_TYPE_ERROR, "Failed to form a base for base_location %lld, path=%{public}@", buf, 0x16u);

    }
  }

}

void __ML3MigrationFunction2100010to2100020_block_invoke_2154(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  char v11;
  id v12;
  int v13;
  NSObject *v14;
  NSObject *v15;
  id v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  objc_msgSend(v6, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(a1 + 48), "fileExistsAtPath:", v7))
  {
    v9 = os_log_create("com.apple.amp.medialibrary", "Migration");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412546;
      v18 = v7;
      v19 = 2112;
      v20 = v8;
      _os_log_impl(&dword_1AC149000, v9, OS_LOG_TYPE_DEBUG, "Moving %@ to %@", buf, 0x16u);
    }

    v10 = *(void **)(a1 + 48);
    v16 = 0;
    v11 = objc_msgSend(v10, "moveItemAtPath:toPath:error:", v7, v8, &v16);
    v12 = v16;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = v11;
    v13 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
    v14 = os_log_create("com.apple.amp.medialibrary", "Migration");
    v15 = v14;
    if (v13)
    {
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v18 = v7;
        v19 = 2112;
        v20 = v8;
        _os_log_impl(&dword_1AC149000, v15, OS_LOG_TYPE_DEFAULT, "Moved asset from %@ to %@", buf, 0x16u);
      }

      objc_msgSend(*(id *)(a1 + 56), "addObject:", v6);
    }
    else
    {
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412802;
        v18 = v7;
        v19 = 2112;
        v20 = v8;
        v21 = 2112;
        v22 = v12;
        _os_log_impl(&dword_1AC149000, v15, OS_LOG_TYPE_ERROR, "Encountered error moving file from %@ to %@. error=%@", buf, 0x20u);
      }

      *a4 = 1;
    }

  }
}

@end
