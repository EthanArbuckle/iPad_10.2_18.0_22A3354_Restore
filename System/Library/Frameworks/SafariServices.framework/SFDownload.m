@implementation SFDownload

void __27___SFDownload__sharedQueue__block_invoke()
{
  NSObject *v0;
  dispatch_queue_t v1;
  void *v2;
  NSObject *v3;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_USER_INITIATED, 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = dispatch_queue_create("com.apple.mobilesafari.SFDownloadFileQueue", v0);
  v2 = (void *)_sharedQueue_queue;
  _sharedQueue_queue = (uint64_t)v1;

}

void __29___SFDownload_removeFromDisk__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "endBackgroundTask:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24));

}

void __29___SFDownload_removeFromDisk__block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  char v4;
  id v5;
  NSObject *v6;
  id v7;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v7 = 0;
  v4 = objc_msgSend(v2, "removeItemAtPath:error:", v3, &v7);
  v5 = v7;

  if ((v4 & 1) == 0 && (objc_msgSend(v5, "safari_matchesErrorDomain:andCode:", *MEMORY[0x1E0CB28A8], 4) & 1) == 0)
  {
    v6 = WBS_LOG_CHANNEL_PREFIXDownloads();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      __29___SFDownload_removeFromDisk__block_invoke_2_cold_1(a1, v6);
  }
  objc_msgSend(*(id *)(a1 + 48), "endBackgroundTask:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24));

}

void __47___SFDownload_removeDataAndPlaceholderFromDisk__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "endBackgroundTask:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24));

}

void __47___SFDownload_removeDataAndPlaceholderFromDisk__block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t);
  void *v8;
  id v9;
  uint64_t v10;

  v2 = *(void **)(a1 + 32);
  v5 = MEMORY[0x1E0C809B0];
  v6 = 3221225472;
  v7 = __47___SFDownload_removeDataAndPlaceholderFromDisk__block_invoke_3;
  v8 = &unk_1E4ABFB20;
  v3 = v2;
  v4 = *(_QWORD *)(a1 + 40);
  v9 = v3;
  v10 = v4;
  objc_msgSend(v3, "safari_accessingSecurityScopedResource:", &v5);
  objc_msgSend(*(id *)(a1 + 48), "endBackgroundTask:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24), v5, v6, v7, v8);

}

void __47___SFDownload_removeDataAndPlaceholderFromDisk__block_invoke_3(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  char v4;
  id v5;
  NSObject *v6;
  id v7;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v7 = 0;
  v4 = objc_msgSend(v2, "removeItemAtURL:error:", v3, &v7);
  v5 = v7;

  if ((v4 & 1) == 0)
  {
    v6 = WBS_LOG_CHANNEL_PREFIXDownloads();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __47___SFDownload_removeDataAndPlaceholderFromDisk__block_invoke_3_cold_1(a1, v6);
  }

}

uint64_t __35___SFDownload_resumeInProcessPool___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_validateSandboxAccessToURL:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "publishProgressAtURL:", *(_QWORD *)(a1 + 40));
}

void __42___SFDownload__importPlaceholderIfNeeded___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  char v4;
  id v5;
  void *v6;
  uint64_t v7;
  char v8;
  id v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  uint64_t v14;
  id v15;
  id v16;
  int8x16_t v17;
  _QWORD v18[4];
  int8x16_t v19;
  id v20;
  _QWORD block[5];
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  uint8_t buf[4];
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v26 = 0;
  v4 = objc_msgSend(v2, "writeToURL:options:error:", v3, 1, &v26);
  v5 = v26;
  if ((v4 & 1) != 0)
  {
    v6 = *(void **)(a1 + 40);
    v7 = *MEMORY[0x1E0C99B28];
    v25 = v5;
    v8 = objc_msgSend(v6, "setResourceValue:forKey:error:", MEMORY[0x1E0C9AAB0], v7, &v25);
    v9 = v25;

    if ((v8 & 1) == 0)
    {
      v10 = WBS_LOG_CHANNEL_PREFIXDownloads();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        __42___SFDownload__importPlaceholderIfNeeded___block_invoke_cold_1(a1, v10);
    }
    if (*(_QWORD *)(a1 + 56))
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __42___SFDownload__importPlaceholderIfNeeded___block_invoke_100;
      block[3] = &unk_1E4AC48B0;
      v11 = *(void **)(a1 + 56);
      block[4] = *(_QWORD *)(a1 + 48);
      v22 = v11;
      v23 = *(id *)(a1 + 40);
      v24 = *(id *)(a1 + 64);
      dispatch_async(MEMORY[0x1E0C80D38], block);

    }
    else
    {
      v13 = WBS_LOG_CHANNEL_PREFIXDownloads();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        v14 = *(_QWORD *)(a1 + 48);
        *(_DWORD *)buf = 138543362;
        v28 = v14;
        _os_log_impl(&dword_1A3B2D000, v13, OS_LOG_TYPE_INFO, "%{public}@: using DOCDownloadImportManager", buf, 0xCu);
      }
      v15 = objc_alloc_init(MEMORY[0x1E0D1D890]);
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __42___SFDownload__importPlaceholderIfNeeded___block_invoke_105;
      v18[3] = &unk_1E4AC7FB8;
      v17 = *(int8x16_t *)(a1 + 40);
      v16 = (id)v17.i64[0];
      v19 = vextq_s8(v17, v17, 8uLL);
      v20 = *(id *)(a1 + 64);
      objc_msgSend(v15, "importPlaceholderAtURLToDownloadsDirectory:completion:", v16, v18);

    }
    v5 = v9;
  }
  else
  {
    v12 = WBS_LOG_CHANNEL_PREFIXDownloads();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      __42___SFDownload__importPlaceholderIfNeeded___block_invoke_cold_2(a1, v12);
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  }

}

void __42___SFDownload__importPlaceholderIfNeeded___block_invoke_100(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  uint64_t v10;
  id v11;
  uint8_t buf[4];
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v2 = WBS_LOG_CHANNEL_PREFIXDownloads();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    v13 = v3;
    _os_log_impl(&dword_1A3B2D000, v2, OS_LOG_TYPE_INFO, "%{public}@: using custom placeholder importer", buf, 0xCu);
  }
  v5 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(a1 + 40);
  v6 = *(void **)(a1 + 48);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __42___SFDownload__importPlaceholderIfNeeded___block_invoke_101;
  v8[3] = &unk_1E4AC7F90;
  v9 = v6;
  v7 = *(id *)(a1 + 56);
  v10 = *(_QWORD *)(a1 + 32);
  v11 = v7;
  objc_msgSend(v4, "importPlaceholderForDownload:fromURL:completionHandler:", v5, v9, v8);

}

void __42___SFDownload__importPlaceholderIfNeeded___block_invoke_101(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  char v7;
  id v8;
  NSObject *v9;
  _QWORD v10[5];
  id v11;
  id v12;
  id v13;

  v3 = a2;
  if (v3)
  {
    +[_SFDownload _sharedQueue](_SFDownload, "_sharedQueue");
    v4 = objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __42___SFDownload__importPlaceholderIfNeeded___block_invoke_102;
    v10[3] = &unk_1E4AC5CB0;
    v10[4] = *(_QWORD *)(a1 + 40);
    v11 = v3;
    v12 = *(id *)(a1 + 48);
    dispatch_async(v4, v10);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 32);
    v13 = 0;
    v7 = objc_msgSend(v5, "removeItemAtURL:error:", v6, &v13);
    v8 = v13;

    if ((v7 & 1) == 0)
    {
      v9 = WBS_LOG_CHANNEL_PREFIXDownloads();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        __42___SFDownload__importPlaceholderIfNeeded___block_invoke_101_cold_1(v9);
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

  }
}

uint64_t __42___SFDownload__importPlaceholderIfNeeded___block_invoke_102(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_didImportPlaceholderAtURL:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void __42___SFDownload__importPlaceholderIfNeeded___block_invoke_105(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;

  v5 = a3;
  v6 = v5;
  if (!a2 || v5)
  {
    v7 = WBS_LOG_CHANNEL_PREFIXDownloads();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __42___SFDownload__importPlaceholderIfNeeded___block_invoke_105_cold_1(a1, v7);
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeItemAtURL:error:", *(_QWORD *)(a1 + 40), 0);

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_didImportPlaceholderAtURL:completionHandler:", a2, *(_QWORD *)(a1 + 48));
  }

}

void __60___SFDownload__didImportPlaceholderAtURL_completionHandler___block_invoke(uint64_t a1)
{
  SFDownloadFile *v2;
  uint64_t v3;
  void *v4;

  v2 = -[SFDownloadFile initWithURL:]([SFDownloadFile alloc], "initWithURL:", *(_QWORD *)(a1 + 32));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

uint64_t __60___SFDownload__didImportPlaceholderAtURL_completionHandler___block_invoke_107(_QWORD *a1)
{
  objc_storeStrong((id *)(a1[4] + 72), *(id *)(*(_QWORD *)(a1[6] + 8) + 40));
  objc_msgSend(*(id *)(a1[4] + 72), "setDelegate:");
  return (*(uint64_t (**)(void))(a1[5] + 16))();
}

void __46___SFDownload__importCompleteDownloadIfNeeded__block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;

  v2 = WBS_LOG_CHANNEL_PREFIXDownloads();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT))
    __46___SFDownload__importCompleteDownloadIfNeeded__block_invoke_cold_1(a1, v2);
  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "endBackgroundTask:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));

}

void __46___SFDownload__importCompleteDownloadIfNeeded__block_invoke_110(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[4];
  __int128 v6;

  v2 = objc_alloc_init(MEMORY[0x1E0D1D890]);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __46___SFDownload__importCompleteDownloadIfNeeded__block_invoke_2;
  v5[3] = &unk_1E4AC8030;
  v6 = *(_OWORD *)(a1 + 48);
  objc_msgSend(v2, "replacePlaceholder:withFinalFileURL:completionHandler:", v3, v4, v5);

}

void __46___SFDownload__importCompleteDownloadIfNeeded__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  _QWORD v9[4];
  __int128 v10;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (!v5 || v6)
  {
    v8 = WBS_LOG_CHANNEL_PREFIXDownloads();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __46___SFDownload__importCompleteDownloadIfNeeded__block_invoke_2_cold_1(a1, v8);
  }
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __46___SFDownload__importCompleteDownloadIfNeeded__block_invoke_111;
  v9[3] = &unk_1E4AC0D98;
  v10 = *(_OWORD *)(a1 + 32);
  objc_msgSend((id)v10, "_didImportFileAtURL:completionHandler:", v5, v9);

}

void __46___SFDownload__importCompleteDownloadIfNeeded__block_invoke_111(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = WBS_LOG_CHANNEL_PREFIXDownloads();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
    v6 = 138543618;
    v7 = v3;
    v8 = 1024;
    v9 = v4;
    _os_log_impl(&dword_1A3B2D000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@: ending background task %u", (uint8_t *)&v6, 0x12u);
  }
  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "endBackgroundTask:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));

}

uint64_t __53___SFDownload__didImportFileAtURL_completionHandler___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_notifyDelegateOfFinishedDownload");
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __53___SFDownload__didImportFileAtURL_completionHandler___block_invoke_2(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  char v4;
  id v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id obj;
  id v13;

  v2 = (void *)a1[4];
  v3 = *MEMORY[0x1E0C99B28];
  v13 = 0;
  v4 = objc_msgSend(v2, "setResourceValue:forKey:error:", MEMORY[0x1E0C9AAA0], v3, &v13);
  v5 = v13;
  if ((v4 & 1) == 0)
  {
    v6 = WBS_LOG_CHANNEL_PREFIXDownloads();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __53___SFDownload__didImportFileAtURL_completionHandler___block_invoke_2_cold_1((uint64_t)a1, v6);
  }
  v7 = (void *)a1[4];
  v8 = *(_QWORD *)(a1[7] + 8);
  obj = *(id *)(v8 + 40);
  objc_msgSend(v7, "bookmarkDataWithOptions:includingResourceValuesForKeys:relativeToURL:error:", 0, 0, 0, &obj);
  v9 = objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v8 + 40), obj);
  v10 = *(_QWORD *)(a1[6] + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v9;

}

uint64_t __53___SFDownload__didImportFileAtURL_completionHandler___block_invoke_112(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_notifyDelegateOfFinishedDownload");
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __53___SFDownload__didImportFileAtURL_completionHandler___block_invoke_2_113(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  SFDownloadFile *v6;
  uint64_t v7;
  void *v8;
  id WeakRetained;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 120);
  *(_QWORD *)(v2 + 120) = 0;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "invalidate");
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 72);
  *(_QWORD *)(v4 + 72) = 0;

  v6 = -[SFDownloadFile initWithURL:]([SFDownloadFile alloc], "initWithURL:", *(_QWORD *)(a1 + 40));
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(v7 + 80);
  *(_QWORD *)(v7 + 80) = v6;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "setDelegate:");
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 216));
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "downloadDidImportFileToDownloadsFolder:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 32), "_notifyDelegateOfFinishedDownload");
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

void __82___SFDownload__download_decideDestinationWithSuggestedFilename_completionHandler___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  __CFString *v10;
  __CFString *v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  __CFString *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = WBS_LOG_CHANNEL_PREFIXDownloads();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v7 = *(_QWORD *)(a1 + 32);
    v8 = v6;
    objc_msgSend(v5, "stringByDeletingLastPathComponent");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = CFSTR("NO");
    if (a2)
      v10 = CFSTR("YES");
    v11 = v10;
    v12 = 138543874;
    v13 = v7;
    v14 = 2114;
    v15 = v9;
    v16 = 2114;
    v17 = v11;
    _os_log_debug_impl(&dword_1A3B2D000, v8, OS_LOG_TYPE_DEBUG, "%{public}@: decided destination. directory=%{public}@, allowOverwrite=%{public}@", (uint8_t *)&v12, 0x20u);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

uint64_t __82___SFDownload__download_decideDestinationWithSuggestedFilename_completionHandler___block_invoke_169(uint64_t a1, uint64_t a2)
{
  NSObject *v4;

  v4 = WBS_LOG_CHANNEL_PREFIXDownloads();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    __82___SFDownload__download_decideDestinationWithSuggestedFilename_completionHandler___block_invoke_169_cold_1(a1, a2, v4);
  return objc_msgSend(*(id *)(a1 + 32), "_continueAfterDownloadConfirmation:destinationCompletionHandler:", a2, *(_QWORD *)(a1 + 40));
}

void __79___SFDownload__continueAfterDownloadConfirmation_destinationCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  _QWORD block[4];
  id v8;
  uint64_t v9;
  id v10;

  v3 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __79___SFDownload__continueAfterDownloadConfirmation_destinationCompletionHandler___block_invoke_2;
  block[3] = &unk_1E4AC5CB0;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  v8 = v3;
  v9 = v4;
  v10 = v5;
  v6 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __79___SFDownload__continueAfterDownloadConfirmation_destinationCompletionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = *(void **)(a1 + 32);
  if (v2)
    objc_msgSend(v2, "stringByAppendingPathComponent:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 88));
  else
    objc_msgSend((id)objc_opt_class(), "downloadDestinationPathWithFilename:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 88));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 40);
  v5 = *(void **)(v4 + 120);
  *(_QWORD *)(v4 + 120) = v3;

  return objc_msgSend(*(id *)(a1 + 40), "_continueAfterDecidingFileDownloadPath:", *(_QWORD *)(a1 + 48));
}

void __54___SFDownload__continueAfterDecidingFileDownloadPath___block_invoke(uint64_t a1, char a2)
{
  void *v2;
  _QWORD block[5];
  id v4;
  char v5;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54___SFDownload__continueAfterDecidingFileDownloadPath___block_invoke_2;
  block[3] = &unk_1E4AC8080;
  v5 = a2;
  v2 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v4 = v2;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __54___SFDownload__continueAfterDecidingFileDownloadPath___block_invoke_2(uint64_t a1)
{
  id v2;
  _QWORD v3[5];
  id v4;

  if (*(_BYTE *)(a1 + 48))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "URL");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    if (v2)
    {
      v3[0] = MEMORY[0x1E0C809B0];
      v3[1] = 3221225472;
      v3[2] = __54___SFDownload__continueAfterDecidingFileDownloadPath___block_invoke_3;
      v3[3] = &unk_1E4ABFB20;
      v3[4] = *(_QWORD *)(a1 + 32);
      v4 = v2;
      objc_msgSend(v4, "safari_accessingSecurityScopedResource:", v3);

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
}

uint64_t __54___SFDownload__continueAfterDecidingFileDownloadPath___block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_validateSandboxAccessToURL:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "publishProgressAtURL:", *(_QWORD *)(a1 + 40));
}

void __29___SFDownload_removeFromDisk__block_invoke_2_cold_1(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_13(a1, a2);
  objc_msgSend((id)OUTLINED_FUNCTION_4_0(), "safari_privacyPreservingDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_12_0(&dword_1A3B2D000, v4, v5, "%{public}@: failed to remove file: %{public}@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_0_1();
}

void __47___SFDownload_removeDataAndPlaceholderFromDisk__block_invoke_3_cold_1(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_13(a1, a2);
  objc_msgSend((id)OUTLINED_FUNCTION_4_0(), "safari_privacyPreservingDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_0_3(&dword_1A3B2D000, v4, v5, "%{public}@: failed to remove placeholder: %{public}@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_0_1();
}

void __42___SFDownload__importPlaceholderIfNeeded___block_invoke_cold_1(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_15_0(a1, a2);
  objc_msgSend((id)OUTLINED_FUNCTION_4_0(), "safari_privacyPreservingDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_0_3(&dword_1A3B2D000, v4, v5, "%{public}@: failed to mark placeholder non-syncable: %{public}@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_0_1();
}

void __42___SFDownload__importPlaceholderIfNeeded___block_invoke_cold_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_15_0(a1, a2);
  objc_msgSend((id)OUTLINED_FUNCTION_4_0(), "safari_privacyPreservingDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_0_3(&dword_1A3B2D000, v4, v5, "%{public}@: failed to create placeholder: %{public}@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_0_1();
}

void __42___SFDownload__importPlaceholderIfNeeded___block_invoke_101_cold_1(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_7(a1);
  objc_msgSend((id)OUTLINED_FUNCTION_4_0(), "safari_privacyPreservingDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_2(&dword_1A3B2D000, v3, v4, "Failed to delete placeholder that couldn't be imported: %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_6();
}

void __42___SFDownload__importPlaceholderIfNeeded___block_invoke_105_cold_1(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_16(a1, a2);
  objc_msgSend((id)OUTLINED_FUNCTION_4_0(), "safari_privacyPreservingDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_0_3(&dword_1A3B2D000, v4, v5, "%{public}@: failed to import placeholder: %{public}@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_0_1();
}

void __46___SFDownload__importCompleteDownloadIfNeeded__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  v4 = 138543618;
  v5 = v2;
  v6 = 1024;
  v7 = v3;
  _os_log_fault_impl(&dword_1A3B2D000, a2, OS_LOG_TYPE_FAULT, "%{public}@: import background task ran past expiration: %u", (uint8_t *)&v4, 0x12u);
  OUTLINED_FUNCTION_3_2();
}

void __46___SFDownload__importCompleteDownloadIfNeeded__block_invoke_2_cold_1(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_16(a1, a2);
  objc_msgSend((id)OUTLINED_FUNCTION_4_0(), "safari_privacyPreservingDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_0_3(&dword_1A3B2D000, v4, v5, "%{public}@: failed to import finished download: %{public}@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_0_1();
}

void __53___SFDownload__didImportFileAtURL_completionHandler___block_invoke_2_cold_1(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_13(a1, a2);
  objc_msgSend((id)OUTLINED_FUNCTION_4_0(), "safari_privacyPreservingDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_0_3(&dword_1A3B2D000, v4, v5, "%{public}@: failed to mark completed download as syncable: %{public}@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_0_1();
}

void __82___SFDownload__download_decideDestinationWithSuggestedFilename_completionHandler___block_invoke_169_cold_1(uint64_t a1, char a2, NSObject *a3)
{
  __CFString *v4;
  __CFString *v5;
  uint64_t v6;
  uint8_t v7[24];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = CFSTR("NO");
  if ((a2 & 1) != 0)
    v4 = CFSTR("YES");
  v5 = v4;
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_2_3(&dword_1A3B2D000, a3, v6, "%{public}@: delegate decided to continue: %{public}@", v7);

  OUTLINED_FUNCTION_0_1();
}

@end
