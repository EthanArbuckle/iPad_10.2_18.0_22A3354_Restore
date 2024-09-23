@implementation ML3MigrationFunction2100100to2100110

void __ML3MigrationFunction2100100to2100110_block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  NSObject *v20;
  NSObject *v21;
  void *v22;
  uint64_t v23;
  int v24;
  NSObject *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  NSObject *v31;
  uint32_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  id v36;
  id obj;
  uint8_t buf[4];
  uint64_t v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  uint64_t v43;
  _QWORD v44[2];
  _QWORD v45[4];

  v45[3] = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  if (!v8)
  {
    objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "longLongValue");

    objc_msgSend(v7, "objectAtIndexedSubscript:", 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectAtIndexedSubscript:", 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v12, "length") || !objc_msgSend(v13, "length"))
      goto LABEL_23;
    v14 = (void *)MEMORY[0x1E0CB3940];
    +[ML3MusicLibrary mediaFolderPath](ML3MusicLibrary, "mediaFolderPath");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v45[0] = v15;
    v45[1] = v12;
    v45[2] = v13;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v45, 3);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "pathWithComponents:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "stringByAppendingPathComponent:", v13);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "fileExistsAtPath:", v17);

    v20 = os_log_create("com.apple.amp.medialibrary", "Migration");
    v21 = v20;
    if (v19)
    {
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v39 = (uint64_t)v17;
        v40 = 2112;
        v41 = v35;
        _os_log_impl(&dword_1AC149000, v21, OS_LOG_TYPE_DEFAULT, "Moving TV App download %@ to %@", buf, 0x16u);
      }

      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      obj = *(id *)(v23 + 40);
      v24 = objc_msgSend(v22, "moveItemAtPath:toPath:error:", v17, v35, &obj);
      objc_storeStrong((id *)(v23 + 40), obj);

      v25 = os_log_create("com.apple.amp.medialibrary", "Migration");
      v21 = v25;
      if (v24)
      {
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          v39 = (uint64_t)v17;
          v40 = 2112;
          v41 = v35;
          _os_log_impl(&dword_1AC149000, v21, OS_LOG_TYPE_DEFAULT, "Successfully moved TV App download from %@ to %@", buf, 0x16u);
        }

        v34 = *(void **)(a1 + 40);
        v44[0] = &unk_1E5BAAC50;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v11);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v44[1] = v26;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v44, 2);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
        v36 = *(id *)(v28 + 40);
        objc_msgSend(v34, "executeUpdate:withParameters:error:", CFSTR("UPDATE item SET base_location_id = ? WHERE item_pid = ?"), v27, &v36);
        objc_storeStrong((id *)(v28 + 40), v36);

        if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
          goto LABEL_22;
        v21 = os_log_create("com.apple.amp.medialibrary", "Migration");
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          v29 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
          *(_DWORD *)buf = 134218242;
          v39 = v11;
          v40 = 2112;
          v41 = v29;
          v30 = "Encountered error updating item.base_location_id to 500 for item_pid=%lld. error=%@";
          v31 = v21;
          v32 = 22;
LABEL_20:
          _os_log_impl(&dword_1AC149000, v31, OS_LOG_TYPE_ERROR, v30, buf, v32);
        }
      }
      else if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        v33 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
        *(_DWORD *)buf = 138412802;
        v39 = (uint64_t)v17;
        v40 = 2112;
        v41 = v35;
        v42 = 2112;
        v43 = v33;
        v30 = "Encountered error moving file from %@ to %@. error=%@";
        v31 = v21;
        v32 = 32;
        goto LABEL_20;
      }
    }
    else if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v39 = (uint64_t)v17;
      v30 = "Unable to move TV App download at %@ because it does not exist";
      v31 = v21;
      v32 = 12;
      goto LABEL_20;
    }

LABEL_22:
LABEL_23:

    goto LABEL_24;
  }
  v9 = os_log_create("com.apple.amp.medialibrary", "Migration");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v39 = (uint64_t)v8;
    _os_log_impl(&dword_1AC149000, v9, OS_LOG_TYPE_ERROR, "Encountered error with local purchase tracks query. error=%@", buf, 0xCu);
  }

  *a4 = 1;
LABEL_24:

}

@end
