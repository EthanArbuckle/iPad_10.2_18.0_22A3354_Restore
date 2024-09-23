@implementation MNSaveRouteWithSubpath

void __MNSaveRouteWithSubpath_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  id v20;
  id obj;
  uint64_t v22;
  NSObject *v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  MNRouteStorageDirectory(*(void **)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "uniqueRouteID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[MNFilePaths routeHandleExtension](MNFilePaths, "routeHandleExtension");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByAppendingPathExtension:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "fileExistsAtPath:", v7))
  {
    v9 = *(unsigned __int8 *)(a1 + 64);

    if (!v9)
    {
LABEL_14:
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = *MEMORY[0x1E0CB2A88];
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v12 = objc_claimAutoreleasedReturnValue();
      v23 = v12;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setAttributes:ofItemAtPath:error:", v17, v7, 0);
      goto LABEL_15;
    }
  }
  else
  {

  }
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36F8]), "initRequiringSecureCoding:", 1);
  objc_msgSend(v10, "encodeObject:forKey:", *(_QWORD *)(a1 + 40), CFSTR("_route"));
  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  obj = *(id *)(v11 + 40);
  +[MNFilePaths createFolderIfNotPresent:error:](MNFilePaths, "createFolderIfNotPresent:error:", v2, &obj);
  objc_storeStrong((id *)(v11 + 40), obj);
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    GEOFindOrCreateLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
      *(_DWORD *)buf = 138412290;
      v25 = v13;
      _os_log_impl(&dword_1B0AD7000, v12, OS_LOG_TYPE_ERROR, "Encountered error <%@> when creating tmp folder", buf, 0xCu);
    }
  }
  else
  {
    objc_msgSend(v10, "encodedData");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v20 = *(id *)(v15 + 40);
    objc_msgSend(v14, "writeToFile:options:error:", v7, 1073741825, &v20);
    objc_storeStrong((id *)(v15 + 40), v20);

    if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
      GEOFindOrCreateLog();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v25 = v7;
        _os_log_impl(&dword_1B0AD7000, v19, OS_LOG_TYPE_DEFAULT, "Saved %@", buf, 0xCu);
      }

      goto LABEL_14;
    }
    GEOFindOrCreateLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v16 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
      objc_msgSend(*(id *)(a1 + 40), "uniqueRouteID");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "UUIDString");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v25 = v16;
      v26 = 2112;
      v27 = v18;
      _os_log_impl(&dword_1B0AD7000, v12, OS_LOG_TYPE_ERROR, "Encountered error <%@> when saving route %@", buf, 0x16u);

LABEL_15:
    }
  }

}

@end
