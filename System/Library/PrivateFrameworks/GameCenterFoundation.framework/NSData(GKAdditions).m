@implementation NSData(GKAdditions)

+ (uint64_t)imageDebugEnabled
{
  if (imageDebugEnabled_onceToken != -1)
    dispatch_once(&imageDebugEnabled_onceToken, &__block_literal_global_51);
  return imageDebugEnabled_enabled;
}

+ (void)_gkRequestClientsRemoteImageDataForURL:()GKAdditions queue:reply:
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;
  id v25;
  uint64_t v26;
  uint8_t buf[4];
  int v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!v9)
  {
    v9 = (id)MEMORY[0x1E0C80D38];
    v11 = MEMORY[0x1E0C80D38];
  }
  if (objc_msgSend(MEMORY[0x1E0C99D50], "imageDebugEnabled"))
  {
    if (!os_log_GKGeneral)
      v12 = GKOSLoggers();
    v13 = (void *)os_log_GKHTTP;
    if (os_log_type_enabled((os_log_t)os_log_GKHTTP, OS_LOG_TYPE_INFO))
    {
      v14 = v13;
      *(_DWORD *)buf = 67109120;
      v28 = GKAtomicIncrement32((unsigned int *)&imageLoadCount);
      _os_log_impl(&dword_1BCDE3000, v14, OS_LOG_TYPE_INFO, "BEGIN daemon image load: (%d)", buf, 8u);

    }
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/NSData+GKAdditions.m", 43, "+[NSData(GKAdditions) _gkRequestClientsRemoteImageDataForURL:queue:reply:]");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[GKDispatchGroup dispatchGroupWithName:](GKDispatchGroup, "dispatchGroupWithName:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = MEMORY[0x1E0C809B0];
  if (v8)
  {
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __74__NSData_GKAdditions___gkRequestClientsRemoteImageDataForURL_queue_reply___block_invoke;
    v23[3] = &unk_1E75B2E50;
    v24 = v8;
    v26 = a2;
    v25 = v16;
    objc_msgSend(v25, "perform:", v23);

  }
  v20[0] = v17;
  v20[1] = 3221225472;
  v20[2] = __74__NSData_GKAdditions___gkRequestClientsRemoteImageDataForURL_queue_reply___block_invoke_9;
  v20[3] = &unk_1E75B1BF0;
  v21 = v16;
  v22 = v10;
  v18 = v16;
  v19 = v10;
  objc_msgSend(v18, "notifyOnQueue:block:", v9, v20);

}

+ (void)_gkLoadRemoteImageDataForURL:()GKAdditions subdirectory:filename:queue:handler:
{
  id v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;

  v18 = a6;
  if (!v18)
  {
    v18 = (id)MEMORY[0x1E0C80D38];
    v12 = MEMORY[0x1E0C80D38];
  }
  v13 = _gkLoadRemoteImageDataForURL_subdirectory_filename_queue_handler__onceToken;
  v14 = a7;
  v15 = a5;
  v16 = a4;
  v17 = a3;
  if (v13 != -1)
    dispatch_once(&_gkLoadRemoteImageDataForURL_subdirectory_filename_queue_handler__onceToken, &__block_literal_global_10_1);
  objc_msgSend(a1, "_gkLoadRemoteImageDataForUrl:subdirectory:filename:queue:imageQueue:handler:", v17, v16, v15, v18, _gkLoadRemoteImageDataForURL_subdirectory_filename_queue_handler__imageQueue, v14);

}

+ (void)_gkLoadRemoteImageDataForUrl:()GKAdditions subdirectory:filename:queue:imageQueue:handler:
{
  id v13;
  id v14;
  id v15;
  id v16;
  NSObject *v17;
  id v18;
  NSObject *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  uint64_t v30;
  void *v31;
  void *v32;
  id v33;
  NSObject *v34;
  _BOOL4 v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  NSObject *v43;
  id v44;
  void *v45;
  id v46;
  NSObject *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  id v54;
  id v55;
  id v56;
  id v57;
  _QWORD v58[4];
  id v59;
  id v60;
  _QWORD v61[4];
  id v62;
  id v63;
  id v64;
  id v65;
  id v66;
  uint8_t buf[4];
  id v68;
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v57 = a5;
  v15 = a6;
  v56 = a7;
  v16 = a8;
  v17 = os_log_GKGeneral;
  if (!os_log_GKGeneral)
  {
    v18 = GKOSLoggers();
    v17 = os_log_GKGeneral;
  }
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    v19 = v17;
    objc_msgSend(v13, "absoluteString");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v68 = v20;
    _os_log_impl(&dword_1BCDE3000, v19, OS_LOG_TYPE_INFO, "_gkLoadRemoteImageDataForUrl: %@", buf, 0xCu);

  }
  if (_gkLoadRemoteImageDataForUrl_subdirectory_filename_queue_imageQueue_handler__onceToken != -1)
    dispatch_once(&_gkLoadRemoteImageDataForUrl_subdirectory_filename_queue_imageQueue_handler__onceToken, &__block_literal_global_12_0);
  v21 = v14;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/NSData+GKAdditions.m", 121, "+[NSData(GKAdditions) _gkLoadRemoteImageDataForUrl:subdirectory:filename:queue:imageQueue:handler:]");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  +[GKDispatchGroup dispatchGroupWithName:](GKDispatchGroup, "dispatchGroupWithName:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "scheme");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v24, "isEqualToString:", CFSTR("https")) & 1) != 0)
  {
    v25 = 1;
  }
  else
  {
    objc_msgSend(v13, "scheme");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v26, "isEqualToString:", CFSTR("http"));

  }
  objc_msgSend(v13, "path");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  GKImageCacheRoot(&stru_1E75BB5A8);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v27, "hasPrefix:", v28);

  v30 = MEMORY[0x1E0C809B0];
  if (v13 && v25 | v29)
  {
    v31 = v21;
    objc_msgSend(MEMORY[0x1E0C99D50], "_gkImageCachePathForURL:subdirectory:filename:", v13, v21, v57);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v32, "containsString:", CFSTR("../")))
    {
      if (!os_log_GKGeneral)
        v33 = GKOSLoggers();
      v34 = os_log_GKError;
      v35 = os_log_type_enabled((os_log_t)os_log_GKError, OS_LOG_TYPE_ERROR);
      v42 = v56;
      v30 = MEMORY[0x1E0C809B0];
      if (v35)
        +[NSData(GKAdditions) _gkLoadRemoteImageDataForUrl:subdirectory:filename:queue:imageQueue:handler:].cold.1((uint64_t)v32, v34, v36, v37, v38, v39, v40, v41);
    }
    else
    {
      v45 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithContentsOfFile:", v32);
      if (objc_msgSend(v45, "length"))
      {
        objc_msgSend(v23, "setResult:", v45);
        if (!os_log_GKGeneral)
          v46 = GKOSLoggers();
        v47 = os_log_GKCache;
        v42 = v56;
        if (os_log_type_enabled((os_log_t)os_log_GKCache, OS_LOG_TYPE_DEBUG))
          +[NSData(GKAdditions) _gkLoadRemoteImageDataForUrl:subdirectory:filename:queue:imageQueue:handler:].cold.2((uint64_t)v32, v47, v48, v49, v50, v51, v52, v53);
      }
      else
      {
        v61[0] = MEMORY[0x1E0C809B0];
        v61[1] = 3221225472;
        v61[2] = __99__NSData_GKAdditions___gkLoadRemoteImageDataForUrl_subdirectory_filename_queue_imageQueue_handler___block_invoke_23;
        v61[3] = &unk_1E75B4198;
        v62 = v32;
        v42 = v56;
        v63 = v56;
        v64 = v23;
        v65 = v13;
        v66 = v15;
        objc_msgSend(v64, "perform:", v61);

      }
      v31 = v21;
      v30 = MEMORY[0x1E0C809B0];
    }

  }
  else
  {
    v43 = os_log_GKGeneral;
    v31 = v21;
    if (!os_log_GKGeneral)
    {
      v44 = GKOSLoggers();
      v43 = os_log_GKGeneral;
    }
    v42 = v56;
    if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v68 = v13;
      _os_log_impl(&dword_1BCDE3000, v43, OS_LOG_TYPE_INFO, "Image URL not HTTPS compliant, and not ImageCacheRoot for: %@", buf, 0xCu);
    }
  }
  v58[0] = v30;
  v58[1] = 3221225472;
  v58[2] = __99__NSData_GKAdditions___gkLoadRemoteImageDataForUrl_subdirectory_filename_queue_imageQueue_handler___block_invoke_27;
  v58[3] = &unk_1E75B1BF0;
  v59 = v23;
  v60 = v16;
  v54 = v23;
  v55 = v16;
  objc_msgSend(v54, "notifyOnQueue:block:", v15, v58);

}

+ (id)_gkImageCachePathForURL:()GKAdditions subdirectory:filename:
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v7 = a3;
  v8 = v7;
  if (a4 && a5)
  {
    GKImageCachePathForSubdirectoryAndFilename(a4, a5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v7, "absoluteString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    GKImageCacheRoot(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "lastPathComponent");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringByAppendingPathComponent:", v12);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v9;
}

- (id)_gkAsHexString
{
  void *v2;
  id v3;
  uint64_t v4;
  unint64_t v5;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithCapacity:", 2 * objc_msgSend(a1, "length"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_retainAutorelease(a1);
  v4 = objc_msgSend(v3, "bytes");
  if (objc_msgSend(v3, "length"))
  {
    v5 = 0;
    do
      objc_msgSend(v2, "appendFormat:", CFSTR("%02X"), *(unsigned __int8 *)(v4 + v5++));
    while (objc_msgSend(v3, "length") > v5);
  }
  return v2;
}

+ (void)_gkLoadRemoteImageDataForUrl:()GKAdditions subdirectory:filename:queue:imageQueue:handler:.cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1BCDE3000, a2, a3, "Illegal file cache path: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

+ (void)_gkLoadRemoteImageDataForUrl:()GKAdditions subdirectory:filename:queue:imageQueue:handler:.cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_5(&dword_1BCDE3000, a2, a3, "Loaded cached image from file cache path: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

@end
