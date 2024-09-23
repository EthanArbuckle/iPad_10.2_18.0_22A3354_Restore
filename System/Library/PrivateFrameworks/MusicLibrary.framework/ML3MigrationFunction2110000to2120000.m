@implementation ML3MigrationFunction2110000to2120000

void __ML3MigrationFunction2110000to2120000_block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
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
  void *v19;
  int v20;
  NSObject *v21;
  NSObject *v22;
  void *v23;
  uint64_t v24;
  int v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  id *v31;
  NSObject *v32;
  void *v33;
  NSObject *v34;
  void *v35;
  uint64_t v36;
  int v37;
  NSObject *v38;
  const char *v39;
  NSObject *v40;
  os_log_type_t v41;
  uint32_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  id v50;
  id obj;
  uint8_t buf[4];
  uint64_t v53;
  __int16 v54;
  void *v55;
  __int16 v56;
  uint64_t v57;
  _QWORD v58[2];
  _QWORD v59[4];

  v59[3] = *MEMORY[0x1E0C80C00];
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
      goto LABEL_33;
    v14 = (void *)MEMORY[0x1E0CB3940];
    +[ML3MusicLibrary mediaFolderPath](ML3MusicLibrary, "mediaFolderPath");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v59[0] = v15;
    v59[1] = v12;
    v59[2] = v13;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v59, 3);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "pathWithComponents:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "stringByAppendingPathComponent:", v13);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "fileExistsAtPath:", v17);

    v21 = os_log_create("com.apple.amp.medialibrary", "Migration");
    v22 = v21;
    if (!v20)
    {
      if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
LABEL_31:

LABEL_32:
LABEL_33:
        v45 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
        v46 = *(void **)(v45 + 40);
        *(_QWORD *)(v45 + 40) = 0;

        goto LABEL_34;
      }
      *(_DWORD *)buf = 138412290;
      v53 = (uint64_t)v17;
      v39 = "Unable to move audiobook download at %@ because it does not exist";
      v40 = v22;
      v41 = OS_LOG_TYPE_ERROR;
      v42 = 12;
LABEL_28:
      _os_log_impl(&dword_1AC149000, v40, v41, v39, buf, v42);
      goto LABEL_31;
    }
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v53 = (uint64_t)v17;
      v54 = 2112;
      v55 = v18;
      _os_log_impl(&dword_1AC149000, v22, OS_LOG_TYPE_DEFAULT, "Moving audiobook download %@ to %@", buf, 0x16u);
    }

    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    obj = *(id *)(v24 + 40);
    v48 = v18;
    v25 = objc_msgSend(v23, "moveItemAtPath:toPath:error:", v17, v18, &obj);
    objc_storeStrong((id *)(v24 + 40), obj);

    v26 = os_log_create("com.apple.amp.medialibrary", "Migration");
    v22 = v26;
    if (v25)
    {
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v53 = (uint64_t)v17;
        v54 = 2112;
        v55 = v48;
        _os_log_impl(&dword_1AC149000, v22, OS_LOG_TYPE_DEFAULT, "Successfully moved audiobook download from %@ to %@", buf, 0x16u);
      }

      v27 = *(void **)(a1 + 40);
      v58[0] = &unk_1E5BAACB0;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v11);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v58[1] = v28;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v58, 2);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = v17;
      v30 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v50 = *(id *)(v30 + 40);
      objc_msgSend(v27, "executeUpdate:withParameters:error:", CFSTR("UPDATE item SET base_location_id = ? WHERE item_pid = ?"), v29, &v50);
      v31 = (id *)(v30 + 40);
      v17 = v47;
      objc_storeStrong(v31, v50);

      v18 = v48;
      if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
        goto LABEL_32;
      v32 = os_log_create("com.apple.amp.medialibrary", "Migration");
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        v33 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
        *(_DWORD *)buf = 134218242;
        v53 = v11;
        v54 = 2112;
        v55 = v33;
        _os_log_impl(&dword_1AC149000, v32, OS_LOG_TYPE_ERROR, "Encountered error updating item.base_location_id to 600 for item_pid=%lld. error=%@", buf, 0x16u);
      }

      v34 = os_log_create("com.apple.amp.medialibrary", "Migration");
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v53 = (uint64_t)v48;
        v54 = 2112;
        v55 = v47;
        _os_log_impl(&dword_1AC149000, v34, OS_LOG_TYPE_DEFAULT, "Moving audiobook download back from %@ to %@", buf, 0x16u);
      }

      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v49 = *(id *)(v36 + 40);
      v37 = objc_msgSend(v35, "moveItemAtPath:toPath:error:", v48, v47, &v49);
      objc_storeStrong((id *)(v36 + 40), v49);

      v38 = os_log_create("com.apple.amp.medialibrary", "Migration");
      v22 = v38;
      if (v37)
      {
        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          v17 = v47;
          v18 = v48;
          v53 = (uint64_t)v48;
          v54 = 2112;
          v55 = v47;
          v39 = "Successfully moved audiobook download back from %@ to %@";
          v40 = v22;
          v41 = OS_LOG_TYPE_DEFAULT;
          v42 = 22;
          goto LABEL_28;
        }
        goto LABEL_29;
      }
      if (!os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      {
LABEL_29:
        v17 = v47;
        goto LABEL_30;
      }
      v44 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
      *(_DWORD *)buf = 138412802;
      v17 = v47;
      v18 = v48;
      v53 = (uint64_t)v48;
      v54 = 2112;
      v55 = v47;
      v56 = 2112;
      v57 = v44;
      v39 = "Encountered error moving file back from %@ to %@. error=%@";
    }
    else
    {
      if (!os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
LABEL_30:
        v18 = v48;
        goto LABEL_31;
      }
      v43 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
      *(_DWORD *)buf = 138412802;
      v53 = (uint64_t)v17;
      v54 = 2112;
      v18 = v48;
      v55 = v48;
      v56 = 2112;
      v57 = v43;
      v39 = "Encountered error moving file from %@ to %@. error=%@";
    }
    v40 = v22;
    v41 = OS_LOG_TYPE_ERROR;
    v42 = 32;
    goto LABEL_28;
  }
  v9 = os_log_create("com.apple.amp.medialibrary", "Migration");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v53 = (uint64_t)v8;
    _os_log_impl(&dword_1AC149000, v9, OS_LOG_TYPE_ERROR, "Encountered error with local purchase tracks query. error=%@", buf, 0xCu);
  }

  *a4 = 1;
LABEL_34:

}

@end
