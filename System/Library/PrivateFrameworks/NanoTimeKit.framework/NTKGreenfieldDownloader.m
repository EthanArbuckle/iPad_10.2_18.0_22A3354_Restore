@implementation NTKGreenfieldDownloader

- (NTKGreenfieldDownloader)initWithWatchFaceURL:(id)a3
{
  id v5;
  NTKGreenfieldDownloader *v6;
  NTKGreenfieldDownloader *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSURL *downloadedFileURL;
  objc_super v15;

  v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)NTKGreenfieldDownloader;
  v6 = -[NTKGreenfieldDownloader init](&v15, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_remoteWatchFaceURL, a3);
    v8 = objc_alloc(MEMORY[0x1E0CB3940]);
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v8, "initWithFormat:", CFSTR("%@.watchface"), v9);

    -[NTKGreenfieldDownloader _downloadedFolderURL](v7, "_downloadedFolderURL");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "URLByAppendingPathComponent:", v10);
    v12 = objc_claimAutoreleasedReturnValue();
    downloadedFileURL = v7->_downloadedFileURL;
    v7->_downloadedFileURL = (NSURL *)v12;

  }
  return v7;
}

- (id)_downloadedFolderURL
{
  if (_downloadedFolderURL_onceToken != -1)
    dispatch_once(&_downloadedFolderURL_onceToken, &__block_literal_global_86);
  return (id)_downloadedFolderURL_downloadedFolderURL;
}

void __47__NTKGreenfieldDownloader__downloadedFolderURL__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  v0 = (void *)MEMORY[0x1E0C99E98];
  NSTemporaryDirectory();
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "fileURLWithPath:", v4);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "URLByAppendingPathComponent:", CFSTR("watchfacesDownload"));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)_downloadedFolderURL_downloadedFolderURL;
  _downloadedFolderURL_downloadedFolderURL = v2;

}

- (id)_downloadURL
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[NSURL lastPathComponent](self->_remoteWatchFaceURL, "lastPathComponent");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("https://watch-app.cdn-apple.com/A/com.apple.watchfaces/production/_defaultZone"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "URLByAppendingPathComponent:", v2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "URLByAppendingPathComponent:", CFSTR("WatchFaceFile"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)downloadWithCompletionBlock:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  NSURLSessionDownloadTask *v8;
  NSURLSessionDownloadTask *downloadTask;
  NSObject *v10;
  uint64_t v11;
  _QWORD v12[4];
  id v13;
  NTKGreenfieldDownloader *v14;
  id v15;
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[NTKGreenfieldDownloader _downloadURL](self, "_downloadURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v17 = v5;
    _os_log_impl(&dword_1B72A3000, v6, OS_LOG_TYPE_DEFAULT, "Downloading file from url: %@", buf, 0xCu);
  }

  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB39F0], "sharedSession");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __55__NTKGreenfieldDownloader_downloadWithCompletionBlock___block_invoke;
    v12[3] = &unk_1E6BD3E18;
    v13 = v5;
    v14 = self;
    v15 = v4;
    objc_msgSend(v7, "downloadTaskWithURL:completionHandler:", v13, v12);
    v8 = (NSURLSessionDownloadTask *)objc_claimAutoreleasedReturnValue();
    downloadTask = self->_downloadTask;
    self->_downloadTask = v8;

    -[NSURLSessionDownloadTask resume](self->_downloadTask, "resume");
  }
  else
  {
    _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[NTKGreenfieldDownloader downloadWithCompletionBlock:].cold.1((uint64_t)self, v10, v11);

    objc_msgSend(MEMORY[0x1E0CB35C8], "greenfield_addWatchFaceErrorWithCode:", 10);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v4 + 2))(v4, 0, v7);
  }

}

void __55__NTKGreenfieldDownloader_downloadWithCompletionBlock___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  uint64_t v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  uint64_t v20;
  id v21;
  id v22;
  id v23;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  dispatch_get_global_queue(0, 0);
  v10 = objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __55__NTKGreenfieldDownloader_downloadWithCompletionBlock___block_invoke_2;
  v17[3] = &unk_1E6BD3DF0;
  v18 = v9;
  v11 = *(id *)(a1 + 32);
  v12 = *(_QWORD *)(a1 + 40);
  v13 = *(void **)(a1 + 48);
  v19 = v11;
  v20 = v12;
  v22 = v7;
  v23 = v13;
  v21 = v8;
  v14 = v7;
  v15 = v8;
  v16 = v9;
  dispatch_async(v10, v17);

}

void __55__NTKGreenfieldDownloader_downloadWithCompletionBlock___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  id *v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  _QWORD v9[5];
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD block[5];
  id v16;
  id v17;

  if (*(_QWORD *)(a1 + 32))
  {
    _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      __55__NTKGreenfieldDownloader_downloadWithCompletionBlock___block_invoke_2_cold_3(a1, v2, v3);

    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __55__NTKGreenfieldDownloader_downloadWithCompletionBlock___block_invoke_12;
    block[3] = &unk_1E6BCD820;
    block[4] = *(_QWORD *)(a1 + 48);
    v16 = *(id *)(a1 + 32);
    v17 = *(id *)(a1 + 72);
    dispatch_async(MEMORY[0x1E0C80D38], block);

    v4 = v16;
  }
  else
  {
    v5 = (id *)(a1 + 56);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(*v5, "statusCode") != 200)
    {
      _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        __55__NTKGreenfieldDownloader_downloadWithCompletionBlock___block_invoke_2_cold_2(a1, (id *)(a1 + 56), v8);

      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __55__NTKGreenfieldDownloader_downloadWithCompletionBlock___block_invoke_15;
      v13[3] = &unk_1E6BCDF60;
      v14 = *(id *)(a1 + 72);
      dispatch_async(MEMORY[0x1E0C80D38], v13);
      v4 = v14;
    }
    else if ((objc_msgSend(*(id *)(a1 + 48), "_copyFileFromURL:", *(_QWORD *)(a1 + 64)) & 1) != 0)
    {
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __55__NTKGreenfieldDownloader_downloadWithCompletionBlock___block_invoke_2_17;
      v9[3] = &unk_1E6BCE3C8;
      v6 = *(id *)(a1 + 72);
      v9[4] = *(_QWORD *)(a1 + 48);
      v10 = v6;
      dispatch_async(MEMORY[0x1E0C80D38], v9);
      v4 = v10;
    }
    else
    {
      _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        __55__NTKGreenfieldDownloader_downloadWithCompletionBlock___block_invoke_2_cold_1(v7);

      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __55__NTKGreenfieldDownloader_downloadWithCompletionBlock___block_invoke_16;
      v11[3] = &unk_1E6BCDF60;
      v12 = *(id *)(a1 + 72);
      dispatch_async(MEMORY[0x1E0C80D38], v11);
      v4 = v12;
    }
  }

}

void __55__NTKGreenfieldDownloader_downloadWithCompletionBlock___block_invoke_12(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB35C8], "greenfield_addWatchFaceErrorWithCode:", objc_msgSend(*(id *)(a1 + 32), "_greenfieldErrorFromURLSessionError:", objc_msgSend(*(id *)(a1 + 40), "code")));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

void __55__NTKGreenfieldDownloader_downloadWithCompletionBlock___block_invoke_15(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB35C8], "greenfield_addWatchFaceErrorWithCode:", 4);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __55__NTKGreenfieldDownloader_downloadWithCompletionBlock___block_invoke_16(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB35C8], "greenfield_addWatchFaceErrorWithCode:", 4);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __55__NTKGreenfieldDownloader_downloadWithCompletionBlock___block_invoke_2_17(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "path");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, _QWORD))(v1 + 16))(v1, v2, 0);

}

- (void)cancelDownload
{
  NSURLSessionDownloadTask *downloadTask;
  NSURLSessionDownloadTask *v4;

  downloadTask = self->_downloadTask;
  if (downloadTask)
  {
    -[NSURLSessionDownloadTask cancel](downloadTask, "cancel");
    v4 = self->_downloadTask;
    self->_downloadTask = 0;

  }
}

- (void)downloadCleanUp
{
  NSObject *v3;
  _QWORD block[5];

  dispatch_get_global_queue(0, 0);
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__NTKGreenfieldDownloader_downloadCleanUp__block_invoke;
  block[3] = &unk_1E6BCD5F0;
  block[4] = self;
  dispatch_async(v3, block);

}

void __42__NTKGreenfieldDownloader_downloadCleanUp__block_invoke(uint64_t a1)
{
  void *v2;
  id *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  NSObject *v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 32);
  v3 = (id *)(a1 + 32);
  objc_msgSend(v4, "_downloadedFolderURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "path");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v2, "removeItemAtPath:error:", v6, 0);

  if ((v7 & 1) == 0)
  {
    _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __42__NTKGreenfieldDownloader_downloadCleanUp__block_invoke_cold_1(v3, v8);

  }
  v9 = (void *)*((_QWORD *)*v3 + 2);
  *((_QWORD *)*v3 + 2) = 0;

}

- (int64_t)_greenfieldErrorFromURLSessionError:(int64_t)a3
{
  if ((unint64_t)(a3 + 1010) >= 0xB)
    return 4;
  else
    return 10;
}

- (BOOL)_copyFileFromURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  BOOL v8;
  NSObject *v9;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKGreenfieldDownloader _downloadedFolderURL](self, "_downloadedFolderURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v6, 1, 0, 0);

  if ((v7 & 1) == 0)
  {
    _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[NTKGreenfieldDownloader _copyFileFromURL:].cold.3(self, v9);
    goto LABEL_11;
  }
  if ((objc_msgSend(v5, "copyItemAtURL:toURL:error:", v4, self->_downloadedFileURL, 0) & 1) == 0)
  {
    _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[NTKGreenfieldDownloader _copyFileFromURL:].cold.2();
    goto LABEL_11;
  }
  if ((objc_msgSend(v5, "removeItemAtURL:error:", v4, 0) & 1) == 0)
  {
    _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[NTKGreenfieldDownloader _copyFileFromURL:].cold.1();
LABEL_11:

    v8 = 0;
    goto LABEL_12;
  }
  v8 = 1;
LABEL_12:

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_downloadedFileURL, 0);
  objc_storeStrong((id *)&self->_downloadTask, 0);
  objc_storeStrong((id *)&self->_remoteWatchFaceURL, 0);
}

- (void)downloadWithCompletionBlock:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 8);
  v4 = 138412290;
  v5 = v3;
  OUTLINED_FUNCTION_0_4(&dword_1B72A3000, a2, a3, "No valid remote url for: %@", (uint8_t *)&v4);
  OUTLINED_FUNCTION_1();
}

void __55__NTKGreenfieldDownloader_downloadWithCompletionBlock___block_invoke_2_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1B72A3000, log, OS_LOG_TYPE_ERROR, "File IO Error", v1, 2u);
}

void __55__NTKGreenfieldDownloader_downloadWithCompletionBlock___block_invoke_2_cold_2(uint64_t a1, id *a2, NSObject *a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = *(_QWORD *)(a1 + 40);
  v5 = objc_msgSend(*a2, "statusCode");
  v7 = 138412546;
  v8 = v4;
  v9 = 2048;
  v10 = v5;
  OUTLINED_FUNCTION_2(&dword_1B72A3000, a3, v6, "Download failed for url:%@ with status code:%ld", (uint8_t *)&v7);
  OUTLINED_FUNCTION_4();
}

void __55__NTKGreenfieldDownloader_downloadWithCompletionBlock___block_invoke_2_cold_3(uint64_t a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 40);
  v4 = 138412290;
  v5 = v3;
  OUTLINED_FUNCTION_0_4(&dword_1B72A3000, a2, a3, "Download failed for: %@", (uint8_t *)&v4);
  OUTLINED_FUNCTION_1();
}

void __42__NTKGreenfieldDownloader_downloadCleanUp__block_invoke_cold_1(id *a1, NSObject *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*a1, "_downloadedFolderURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_4(&dword_1B72A3000, a2, v5, "File IO Error Could not remove file at: %@", v6);

}

- (void)_copyFileFromURL:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_4(&dword_1B72A3000, v0, v1, "File IO Error Could not remove file at: %@", v2);
  OUTLINED_FUNCTION_1();
}

- (void)_copyFileFromURL:.cold.2()
{
  uint64_t v0;
  NSObject *v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3_0();
  v3 = 2112;
  v4 = v0;
  OUTLINED_FUNCTION_2(&dword_1B72A3000, v1, (uint64_t)v1, "File IO Error copying: %@ to %@", v2);
  OUTLINED_FUNCTION_1();
}

- (void)_copyFileFromURL:(void *)a1 .cold.3(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "_downloadedFolderURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_4(&dword_1B72A3000, a2, v4, "File IO Error Could not create folder: %@", v5);

  OUTLINED_FUNCTION_4();
}

@end
