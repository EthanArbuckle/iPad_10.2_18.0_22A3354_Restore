@implementation PHAssetResourceManager

void __87__PHAssetResourceManager_MediaAnalysis__vcp_inMemoryDownload_withTaskID_toData_cancel___block_invoke(uint64_t a1, double a2)
{
  void *v4;
  int v5;
  void *v6;
  __int16 v7;
  double v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(*(id *)(a1 + 32), "assetLocalIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138412546;
    v6 = v4;
    v7 = 2048;
    v8 = a2;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[%@] Download progress: %.2f", (uint8_t *)&v5, 0x16u);

  }
}

void __87__PHAssetResourceManager_MediaAnalysis__vcp_inMemoryDownload_withTaskID_toData_cancel___block_invoke_133(uint64_t a1, void *a2)
{
  id v3;
  int v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = MediaAnalysisLogLevel();
  if (v3)
  {
    if (v4 >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v3, "description");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = 138412290;
      v7 = v5;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to download asset resource (%@)", (uint8_t *)&v6, 0xCu);

    }
  }
  else
  {
    if (v4 >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v6) = 0;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "Successfully downloaded asset resource", (uint8_t *)&v6, 2u);
    }
    objc_msgSend(*(id *)(a1 + 48), "vcp_reportDownload:withTaskID:", objc_msgSend(*(id *)(a1 + 32), "length"), *(_QWORD *)(a1 + 56));
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));

}

uint64_t __87__PHAssetResourceManager_MediaAnalysis__vcp_inMemoryDownload_withTaskID_toData_cancel___block_invoke_135(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "appendData:", a2);
}

void __108__PHAssetResourceManager_MediaAnalysis__vcp_requestFileURLForAssetResource_withTaskID_toResourceURL_cancel___block_invoke(uint64_t a1, double a2)
{
  void *v4;
  int v5;
  void *v6;
  __int16 v7;
  double v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(*(id *)(a1 + 32), "assetLocalIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138412546;
    v6 = v4;
    v7 = 2048;
    v8 = a2;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[FileBasedDownload][%@] Download progress: %.2f", (uint8_t *)&v5, 0x16u);

  }
}

void __108__PHAssetResourceManager_MediaAnalysis__vcp_requestFileURLForAssetResource_withTaskID_toResourceURL_cancel___block_invoke_138(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  int v7;
  void *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    objc_msgSend(*(id *)(a1 + 32), "assetLocalIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "absoluteString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412546;
    v8 = v4;
    v9 = 2112;
    v10 = v5;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[FileBasedDownload][%@] Downloaded resource to file url: %@", (uint8_t *)&v7, 0x16u);

  }
  v6 = objc_retainAutorelease(v3);
  **(_QWORD **)(a1 + 40) = v6;

}

void __108__PHAssetResourceManager_MediaAnalysis__vcp_requestFileURLForAssetResource_withTaskID_toResourceURL_cancel___block_invoke_140(uint64_t a1, void *a2)
{
  id v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = MediaAnalysisLogLevel();
  if (v3)
  {
    if (v4 >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 32), "assetLocalIdentifier");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "description");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138412546;
      v9 = v5;
      v10 = 2112;
      v11 = v6;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[FileBasedDownload][%@] Failed to download asset resource (%@)", (uint8_t *)&v8, 0x16u);

    }
  }
  else
  {
    if (v4 >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(*(id *)(a1 + 32), "assetLocalIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138412290;
      v9 = v7;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[FileBasedDownload][%@] Successfully downloaded asset resource", (uint8_t *)&v8, 0xCu);

    }
    objc_msgSend(*(id *)(a1 + 48), "vcp_reportDownload:withTaskID:", 0, *(_QWORD *)(a1 + 56));
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));

}

uint64_t __134__PHAssetResourceManager_MediaAnalysis__vcp_requestFileURLForAssetResource_withTaskID_timeoutHandler_urlHandler_andCompletionHandler___block_invoke(uint64_t a1, double a2)
{
  void *v4;
  int v6;
  void *v7;
  __int16 v8;
  double v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(*(id *)(a1 + 32), "assetLocalIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138412546;
    v7 = v4;
    v8 = 2048;
    v9 = a2;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[FileBasedDownload][%@] Progress: %.2f", (uint8_t *)&v6, 0x16u);

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __134__PHAssetResourceManager_MediaAnalysis__vcp_requestFileURLForAssetResource_withTaskID_timeoutHandler_urlHandler_andCompletionHandler___block_invoke_141(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  os_signpost_id_t v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    objc_msgSend(*(id *)(a1 + 32), "assetLocalIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "absoluteString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138412546;
    v10 = v4;
    v11 = 2112;
    v12 = v5;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[FileBasedDownload][%@] URL: %@", (uint8_t *)&v9, 0x16u);

  }
  VCPSignPostLog();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  v8 = *(_QWORD *)(a1 + 48);
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    LOWORD(v9) = 0;
    _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v7, OS_SIGNPOST_INTERVAL_END, v8, "VCPDownloadResource", ", (uint8_t *)&v9, 2u);
  }

  if (*(_QWORD *)(a1 + 56))
  {
    mach_absolute_time();
    VCPPerformance_LogMeasurement();
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __134__PHAssetResourceManager_MediaAnalysis__vcp_requestFileURLForAssetResource_withTaskID_timeoutHandler_urlHandler_andCompletionHandler___block_invoke_143(uint64_t a1, void *a2)
{
  id v3;
  int v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = MediaAnalysisLogLevel();
  if (v3)
  {
    if (v4 >= 4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "assetLocalIdentifier");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = *(_QWORD *)(a1 + 32);
      objc_msgSend(v3, "description");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138412802;
      v10 = v5;
      v11 = 2112;
      v12 = v6;
      v13 = 2112;
      v14 = v7;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[FileBasedDownload][%@] Failed on resource %@ - %@", (uint8_t *)&v9, 0x20u);

    }
  }
  else
  {
    if (v4 >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      objc_msgSend(*(id *)(a1 + 32), "assetLocalIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138412290;
      v10 = v8;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[FileBasedDownload][%@] Success!", (uint8_t *)&v9, 0xCu);

    }
    objc_msgSend(*(id *)(a1 + 48), "vcp_reportDownload:withTaskID:", 0, *(_QWORD *)(a1 + 56));
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

@end
