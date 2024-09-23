@implementation NSData

BOOL __40__NSData_GKAdditions__imageDebugEnabled__block_invoke()
{
  _BOOL8 result;

  result = os_log_is_debug_enabled((os_log_t)os_log_GKHTTP);
  imageDebugEnabled_enabled = result;
  return result;
}

void __74__NSData_GKAdditions___gkRequestClientsRemoteImageDataForURL_queue_reply___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, void *, void *, void *);
  void *v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;

  v3 = a2;
  GKGetRuntimeStrategy();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "instrumentedURLSession");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB39E0], "requestWithURL:", *(_QWORD *)(a1 + 32));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v10 = 3221225472;
  v11 = __74__NSData_GKAdditions___gkRequestClientsRemoteImageDataForURL_queue_reply___block_invoke_2;
  v12 = &unk_1E75B6698;
  v16 = *(_QWORD *)(a1 + 48);
  v13 = *(id *)(a1 + 32);
  v14 = *(id *)(a1 + 40);
  v15 = v3;
  v7 = v3;
  objc_msgSend(v5, "dataTaskWithRequest:completionHandler:", v6, &v9);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "resume", v9, v10, v11, v12);

}

void __74__NSData_GKAdditions___gkRequestClientsRemoteImageDataForURL_queue_reply___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  void *v18;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (v9)
  {
    if (!os_log_GKGeneral)
      v10 = GKOSLoggers();
    v11 = (void *)os_log_GKError;
    if (os_log_type_enabled((os_log_t)os_log_GKError, OS_LOG_TYPE_ERROR))
    {
      __74__NSData_GKAdditions___gkRequestClientsRemoteImageDataForURL_queue_reply___block_invoke_2_cold_4(a1, v11, (uint64_t)v9);
      if (!v7)
        goto LABEL_15;
    }
    else if (!v7)
    {
      goto LABEL_15;
    }
    v12 = os_log_GKGeneral;
    if (!os_log_GKGeneral)
    {
      v13 = GKOSLoggers();
      v12 = os_log_GKGeneral;
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      __74__NSData_GKAdditions___gkRequestClientsRemoteImageDataForURL_queue_reply___block_invoke_2_cold_3(v12);
  }
  else if (!v7)
  {
    if (!os_log_GKGeneral)
      v14 = GKOSLoggers();
    v15 = (void *)os_log_GKError;
    if (os_log_type_enabled((os_log_t)os_log_GKError, OS_LOG_TYPE_ERROR))
      __74__NSData_GKAdditions___gkRequestClientsRemoteImageDataForURL_queue_reply___block_invoke_2_cold_2(a1, v15);
  }
LABEL_15:
  v16 = v8;
  if (objc_msgSend(v16, "statusCode") == 200)
  {
    objc_msgSend(*(id *)(a1 + 40), "setResult:", v7);
  }
  else
  {
    if (!os_log_GKGeneral)
      v17 = GKOSLoggers();
    v18 = (void *)os_log_GKError;
    if (os_log_type_enabled((os_log_t)os_log_GKError, OS_LOG_TYPE_ERROR))
      __74__NSData_GKAdditions___gkRequestClientsRemoteImageDataForURL_queue_reply___block_invoke_2_cold_1(a1, v18, v16);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

void __74__NSData_GKAdditions___gkRequestClientsRemoteImageDataForURL_queue_reply___block_invoke_9(uint64_t a1)
{
  id v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  _DWORD v7[2];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(MEMORY[0x1E0C99D50], "imageDebugEnabled"))
  {
    if (!os_log_GKGeneral)
      v2 = GKOSLoggers();
    v3 = (void *)os_log_GKHTTP;
    if (os_log_type_enabled((os_log_t)os_log_GKHTTP, OS_LOG_TYPE_INFO))
    {
      v4 = v3;
      v7[0] = 67109120;
      v7[1] = GKAtomicDecrement32((unsigned int *)&imageLoadCount);
      _os_log_impl(&dword_1BCDE3000, v4, OS_LOG_TYPE_INFO, "END image load: (%d)", (uint8_t *)v7, 8u);

    }
  }
  v5 = *(_QWORD *)(a1 + 40);
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "result");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);

  }
}

uint64_t __88__NSData_GKAdditions___gkLoadRemoteImageDataForURL_subdirectory_filename_queue_handler___block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3828]);
  v1 = (void *)_gkLoadRemoteImageDataForURL_subdirectory_filename_queue_handler__imageQueue;
  _gkLoadRemoteImageDataForURL_subdirectory_filename_queue_handler__imageQueue = (uint64_t)v0;

  return objc_msgSend((id)_gkLoadRemoteImageDataForURL_subdirectory_filename_queue_handler__imageQueue, "setMaxConcurrentOperationCount:", 20);
}

void __99__NSData_GKAdditions___gkLoadRemoteImageDataForUrl_subdirectory_filename_queue_imageQueue_handler___block_invoke()
{
  void *v0;
  id v1;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v1, "_gkIsGameCenter") & 1) != 0
    || (objc_msgSend(v1, "_gkIsGameCenterExtension") & 1) != 0
    || objc_msgSend(v1, "_gkIsDaemon"))
  {
    v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3990]), "initWithMemoryCapacity:diskCapacity:diskPath:", 0, 0, &stru_1E75BB5A8);
    objc_msgSend(MEMORY[0x1E0CB3990], "setSharedURLCache:", v0);

  }
}

void __99__NSData_GKAdditions___gkLoadRemoteImageDataForUrl_subdirectory_filename_queue_imageQueue_handler___block_invoke_23(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  void *v13;
  NSObject *v14;
  void *v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  uint8_t buf[4];
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (!os_log_GKGeneral)
    v4 = GKOSLoggers();
  v5 = os_log_GKCache;
  if (os_log_type_enabled((os_log_t)os_log_GKCache, OS_LOG_TYPE_DEBUG))
    __99__NSData_GKAdditions___gkLoadRemoteImageDataForUrl_subdirectory_filename_queue_imageQueue_handler___block_invoke_23_cold_1(a1, v5, v6, v7, v8, v9, v10, v11);
  if (objc_msgSend(MEMORY[0x1E0C99D50], "imageDebugEnabled"))
  {
    if (!os_log_GKGeneral)
      v12 = GKOSLoggers();
    v13 = (void *)os_log_GKHTTP;
    if (os_log_type_enabled((os_log_t)os_log_GKHTTP, OS_LOG_TYPE_INFO))
    {
      v14 = v13;
      *(_DWORD *)buf = 67109120;
      v24 = GKAtomicIncrement32((unsigned int *)&imageLoadCount);
      _os_log_impl(&dword_1BCDE3000, v14, OS_LOG_TYPE_INFO, "BEGIN image load: (%d)", buf, 8u);

    }
  }
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __99__NSData_GKAdditions___gkLoadRemoteImageDataForUrl_subdirectory_filename_queue_imageQueue_handler___block_invoke_24;
  v17[3] = &unk_1E75B6728;
  v15 = *(void **)(a1 + 40);
  v18 = *(id *)(a1 + 48);
  v19 = *(id *)(a1 + 32);
  v22 = v3;
  v20 = *(id *)(a1 + 56);
  v21 = *(id *)(a1 + 64);
  v16 = v3;
  objc_msgSend(v15, "addOperationWithBlock:", v17);

}

void __99__NSData_GKAdditions___gkLoadRemoteImageDataForUrl_subdirectory_filename_queue_imageQueue_handler___block_invoke_24(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD aBlock[4];
  id v5;
  id v6;
  id v7;

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __99__NSData_GKAdditions___gkLoadRemoteImageDataForUrl_subdirectory_filename_queue_imageQueue_handler___block_invoke_2;
  aBlock[3] = &unk_1E75B6700;
  v5 = *(id *)(a1 + 32);
  v6 = *(id *)(a1 + 40);
  v7 = *(id *)(a1 + 64);
  v2 = _Block_copy(aBlock);
  GKGetRuntimeStrategy();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "requestClientsRemoteImageDataForURL:queue:reply:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), v2);

}

void __99__NSData_GKAdditions___gkLoadRemoteImageDataForUrl_subdirectory_filename_queue_imageQueue_handler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  NSObject *v6;
  void **v7;
  void *v8;
  void *v9;
  char v10;
  id v11;
  id v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  id v21;
  id v22;
  NSObject *v23;
  id v24;
  NSObject *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  id v33;
  uint8_t buf[4];
  int v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (objc_msgSend(MEMORY[0x1E0C99D50], "imageDebugEnabled"))
  {
    if (!os_log_GKGeneral)
      v4 = GKOSLoggers();
    v5 = (void *)os_log_GKHTTP;
    if (os_log_type_enabled((os_log_t)os_log_GKHTTP, OS_LOG_TYPE_INFO))
    {
      v6 = v5;
      *(_DWORD *)buf = 67109120;
      v35 = GKAtomicDecrement32((unsigned int *)&imageLoadCount);
      _os_log_impl(&dword_1BCDE3000, v6, OS_LOG_TYPE_INFO, "END image load: (%d)", buf, 8u);

    }
  }
  objc_msgSend(*(id *)(a1 + 32), "setResult:", v3);
  if (v3)
  {
    v7 = (void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 40), "stringByDeletingLastPathComponent");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = 0;
    v10 = objc_msgSend(v9, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v8, 1, 0, &v33);
    v11 = v33;

    if ((v10 & 1) == 0)
    {
      if (!os_log_GKGeneral)
        v12 = GKOSLoggers();
      v13 = os_log_GKError;
      if (os_log_type_enabled((os_log_t)os_log_GKError, OS_LOG_TYPE_ERROR))
        __99__NSData_GKAdditions___gkLoadRemoteImageDataForUrl_subdirectory_filename_queue_imageQueue_handler___block_invoke_2_cold_3((uint64_t)v11, v13, v14, v15, v16, v17, v18, v19);
    }
    v20 = *v7;
    v32 = 0;
    objc_msgSend(v3, "writeToFile:options:error:", v20, 1, &v32);
    v21 = v32;
    if (v21)
    {
      if (!os_log_GKGeneral)
        v22 = GKOSLoggers();
      v23 = os_log_GKError;
      if (os_log_type_enabled((os_log_t)os_log_GKError, OS_LOG_TYPE_ERROR))
        __99__NSData_GKAdditions___gkLoadRemoteImageDataForUrl_subdirectory_filename_queue_imageQueue_handler___block_invoke_2_cold_2((uint64_t *)(a1 + 40), (uint64_t)v21, v23);
    }
    else
    {
      if (!os_log_GKGeneral)
        v24 = GKOSLoggers();
      v25 = os_log_GKCache;
      if (os_log_type_enabled((os_log_t)os_log_GKCache, OS_LOG_TYPE_DEBUG))
        __99__NSData_GKAdditions___gkLoadRemoteImageDataForUrl_subdirectory_filename_queue_imageQueue_handler___block_invoke_2_cold_1(a1 + 40, v25, v26, v27, v28, v29, v30, v31);
      _gkMarkFileAsPurgeable(*v7);
    }

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

void __99__NSData_GKAdditions___gkLoadRemoteImageDataForUrl_subdirectory_filename_queue_imageQueue_handler___block_invoke_27(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  if (v1)
  {
    objc_msgSend(*(id *)(a1 + 32), "result");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

  }
}

void __74__NSData_GKAdditions___gkRequestClientsRemoteImageDataForURL_queue_reply___block_invoke_2_cold_1(uint64_t a1, void *a2, void *a3)
{
  const char *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = *(const char **)(a1 + 56);
  v6 = a2;
  NSStringFromSelector(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(a3, "statusCode"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *(_QWORD *)(a1 + 32);
  v11 = 138412802;
  v12 = v7;
  v13 = 2112;
  v14 = v8;
  v15 = 2112;
  v16 = v9;
  OUTLINED_FUNCTION_4_2(&dword_1BCDE3000, v6, v10, "%@: Did not receive http status OK (received %@) for url: %@", (uint8_t *)&v11);

}

void __74__NSData_GKAdditions___gkRequestClientsRemoteImageDataForURL_queue_reply___block_invoke_2_cold_2(uint64_t a1, void *a2)
{
  const char *v2;
  NSObject *v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = *(const char **)(a1 + 56);
  v3 = a2;
  NSStringFromSelector(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_4(&dword_1BCDE3000, v3, v5, "%@:%@: no image data received, but no error received either", v6);

}

void __74__NSData_GKAdditions___gkRequestClientsRemoteImageDataForURL_queue_reply___block_invoke_2_cold_3(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1BCDE3000, log, OS_LOG_TYPE_DEBUG, "   but we received image data anyway", v1, 2u);
}

void __74__NSData_GKAdditions___gkRequestClientsRemoteImageDataForURL_queue_reply___block_invoke_2_cold_4(uint64_t a1, void *a2, uint64_t a3)
{
  const char *v4;
  NSObject *v5;
  void *v6;
  __int16 v7;
  uint64_t v8;
  uint8_t v9[22];
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = *(const char **)(a1 + 56);
  v5 = a2;
  NSStringFromSelector(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  v10 = v7;
  v11 = a3;
  OUTLINED_FUNCTION_4_2(&dword_1BCDE3000, v5, v8, "%@:%@: error loading image data:%@", v9);

}

void __99__NSData_GKAdditions___gkLoadRemoteImageDataForUrl_subdirectory_filename_queue_imageQueue_handler___block_invoke_23_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_5(&dword_1BCDE3000, a2, a3, "Did not find image at cache path %@, will load from server.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

void __99__NSData_GKAdditions___gkLoadRemoteImageDataForUrl_subdirectory_filename_queue_imageQueue_handler___block_invoke_2_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_5(&dword_1BCDE3000, a2, a3, "Loaded and cached image data from server: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

void __99__NSData_GKAdditions___gkLoadRemoteImageDataForUrl_subdirectory_filename_queue_imageQueue_handler___block_invoke_2_cold_2(uint64_t *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *a1;
  v4 = 138412546;
  v5 = v3;
  v6 = 2112;
  v7 = a2;
  OUTLINED_FUNCTION_0_4(&dword_1BCDE3000, a3, (uint64_t)a3, "Error writing image data to image cache %@: %@", (uint8_t *)&v4);
  OUTLINED_FUNCTION_2();
}

void __99__NSData_GKAdditions___gkLoadRemoteImageDataForUrl_subdirectory_filename_queue_imageQueue_handler___block_invoke_2_cold_3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1BCDE3000, a2, a3, "_gkLoadRemoteImageDataForUrl:subdirectory:filename:queue:imageQueue:handler: error creating directory:%@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

@end
