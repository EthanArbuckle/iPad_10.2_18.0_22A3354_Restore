@implementation NTKVideoAssetScrubbingOperation

- (id)supportedExtensions
{
  return &unk_1E6CAA588;
}

- (BOOL)scrubAssetAtURL:(id)a3 toDestinationURL:(id)a4 error:(id *)a5
{
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  _BOOL4 v16;
  void *v17;
  void *v18;
  dispatch_semaphore_t v19;
  id v20;
  dispatch_time_t v21;
  unint64_t v22;
  NSObject *v23;
  void *v24;
  _QWORD v26[4];
  id v27;
  id v28;
  NSObject *v29;
  uint8_t buf[4];
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = (void *)MEMORY[0x1E0C8B3C0];
  v9 = a4;
  objc_msgSend(v8, "URLAssetWithURL:options:", v7, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x1E0C8B220];
  objc_msgSend(v10, "metadata");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "metadataItemsFromArray:filteredByIdentifier:", v12, *MEMORY[0x1E0C8A850]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_msgSend(v13, "count");
  _NTKLoggingObjectForDomain(6, (uint64_t)"NTKLoggingDomainPhoto");
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = os_log_type_enabled(v15, OS_LOG_TYPE_INFO);
  if (v14)
  {
    if (v16)
    {
      *(_DWORD *)buf = 138412290;
      v31 = v7;
      _os_log_impl(&dword_1B72A3000, v15, OS_LOG_TYPE_INFO, "[Resource Scrubber]: Found location data in asset: '%@'. Will scrub.", buf, 0xCu);
    }

    objc_msgSend(MEMORY[0x1E0C8AFC0], "exportSessionWithAsset:presetName:", v10, *MEMORY[0x1E0C89E98]);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setOutputFileType:", *MEMORY[0x1E0C8A2E8]);
    objc_msgSend(MEMORY[0x1E0C8B228], "metadataItemFilterForSharing");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setMetadataItemFilter:", v18);

    objc_msgSend(v17, "setOutputURL:", v9);
    v19 = dispatch_semaphore_create(0);
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __74__NTKVideoAssetScrubbingOperation_scrubAssetAtURL_toDestinationURL_error___block_invoke;
    v26[3] = &unk_1E6BCDCB8;
    v27 = v7;
    v20 = v17;
    v28 = v20;
    v9 = v19;
    v29 = v9;
    objc_msgSend(v20, "exportAsynchronouslyWithCompletionHandler:", v26);
    v21 = dispatch_time(0, 180000000000);
    dispatch_semaphore_wait(v9, v21);
    v22 = objc_msgSend(v20, "status");
    if (v22 >= 3)
    {
      if (v22 == 4)
      {
        if (a5)
        {
          objc_msgSend(v20, "error");
          v24 = (void *)objc_claimAutoreleasedReturnValue();

          if (v24)
          {
            objc_msgSend(v20, "error");
            LOBYTE(v24) = 0;
            *a5 = (id)objc_claimAutoreleasedReturnValue();
          }
          goto LABEL_18;
        }
      }
      else if (v22 != 5)
      {
        LOBYTE(v24) = 1;
LABEL_18:

        goto LABEL_19;
      }
    }
    else
    {
      _NTKLoggingObjectForDomain(6, (uint64_t)"NTKLoggingDomainPhoto");
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B72A3000, v23, OS_LOG_TYPE_INFO, "[Resource Scrubber]: AVAssetExportSession timed out.", buf, 2u);
      }

      objc_msgSend(v20, "cancelExport");
    }
    LOBYTE(v24) = 0;
    goto LABEL_18;
  }
  if (v16)
  {
    *(_DWORD *)buf = 138412290;
    v31 = v7;
    _os_log_impl(&dword_1B72A3000, v15, OS_LOG_TYPE_INFO, "[Resource Scrubber]: Location data not found in asset: '%@'. Passing through", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v20 = (id)objc_claimAutoreleasedReturnValue();
  LOBYTE(v24) = objc_msgSend(v20, "copyItemAtURL:toURL:error:", v7, v9, a5);
LABEL_19:

  return (char)v24;
}

intptr_t __74__NTKVideoAssetScrubbingOperation_scrubAssetAtURL_toDestinationURL_error___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  _NTKLoggingObjectForDomain(6, (uint64_t)"NTKLoggingDomainPhoto");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = objc_msgSend(*(id *)(a1 + 40), "status");
    v6 = 138412546;
    v7 = v3;
    v8 = 2048;
    v9 = v4;
    _os_log_impl(&dword_1B72A3000, v2, OS_LOG_TYPE_INFO, "[Resource Scrubber]: AVAssetExportSession finished running on asset: '%@'. Status: %li", (uint8_t *)&v6, 0x16u);
  }

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

@end
