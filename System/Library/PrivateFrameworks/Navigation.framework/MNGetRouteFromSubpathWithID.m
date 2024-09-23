@implementation MNGetRouteFromSubpathWithID

void __MNGetRouteFromSubpathWithID_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  id v29;
  id v30;
  id obj;
  uint64_t v32;
  void *v33;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  MNRouteStorageDirectory(*(void **)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", v3);
  v4 = objc_claimAutoreleasedReturnValue();
  +[MNFilePaths routeHandleExtension](MNFilePaths, "routeHandleExtension");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v4, "stringByAppendingPathExtension:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = objc_msgSend(v7, "fileExistsAtPath:", v6);

  if ((v4 & 1) != 0)
  {
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    obj = *(id *)(v8 + 40);
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:options:error:", v6, 0, &obj);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)(v8 + 40), obj);
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
    {
      GEOFindOrCreateLog();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v11 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
        *(_DWORD *)buf = 138412546;
        v35 = v11;
        v36 = 2112;
        v37 = v6;
        _os_log_impl(&dword_1B0AD7000, v10, OS_LOG_TYPE_ERROR, "Encountered error <%@> while reading route %@", buf, 0x16u);
      }
      goto LABEL_15;
    }
    v16 = objc_alloc(MEMORY[0x1E0CB3710]);
    v17 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v30 = *(id *)(v17 + 40);
    v10 = objc_msgSend(v16, "initForReadingFromData:error:", v9, &v30);
    objc_storeStrong((id *)(v17 + 40), v30);
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
    {
      GEOFindOrCreateLog();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        v19 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
        *(_DWORD *)buf = 138412546;
        v35 = v19;
        v36 = 2112;
        v37 = v6;
        _os_log_impl(&dword_1B0AD7000, v18, OS_LOG_TYPE_ERROR, "Encountered error <%@> while reading route %@", buf, 0x16u);
      }
    }
    else
    {
      -[NSObject decodeObjectOfClass:forKey:](v10, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_route"));
      v20 = objc_claimAutoreleasedReturnValue();
      v21 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v22 = *(void **)(v21 + 40);
      *(_QWORD *)(v21 + 40) = v20;

      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = *MEMORY[0x1E0CB2A88];
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = v24;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v33, &v32, 1);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v29 = *(id *)(v26 + 40);
      objc_msgSend(v23, "setAttributes:ofItemAtPath:error:", v25, v6, &v29);
      objc_storeStrong((id *)(v26 + 40), v29);

      if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
      {
LABEL_15:

        goto LABEL_16;
      }
      GEOFindOrCreateLog();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        v27 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
        objc_msgSend(*(id *)(a1 + 40), "UUIDString");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v35 = v27;
        v36 = 2112;
        v37 = v28;
        _os_log_impl(&dword_1B0AD7000, v18, OS_LOG_TYPE_ERROR, "Encountered error <%@> when touching route %@", buf, 0x16u);

      }
    }

    goto LABEL_15;
  }
  GEOFindOrCreateLog();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(*(id *)(a1 + 40), "UUIDString");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v35 = v13;
    _os_log_impl(&dword_1B0AD7000, v12, OS_LOG_TYPE_ERROR, "Route file for ID %@ could not be found on disk.", buf, 0xCu);

  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 4, 0);
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v9 = *(void **)(v15 + 40);
  *(_QWORD *)(v15 + 40) = v14;
LABEL_16:

}

@end
