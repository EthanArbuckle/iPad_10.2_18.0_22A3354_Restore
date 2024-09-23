@implementation SFDownloadManager

void __55___SFDownloadManager__loadDownloadHistoryAsynchronous___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "count")
    && objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "count"))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  }
  if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "count"))
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "addObjectsFromArray:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
  objc_msgSend(*(id *)(a1 + 32), "_removeDeletedDownloads");
  objc_msgSend(*(id *)(a1 + 32), "_removeOldDownloadsAndUpdateTimerIfNeeded");
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "scheduleWrite");
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 8);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v11;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "regenerateIconForSource:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v6++), (_QWORD)v10);
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v4);
  }

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 32) = 1;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40);
  if (v7)
  {
    (*(void (**)(void))(v7 + 16))();
    v8 = *(_QWORD *)(a1 + 32);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = 0;

  }
}

void __35___SFDownloadManager_sharedManager__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[_SFDownloadManager initAsReadonly:]([_SFDownloadManager alloc], "initAsReadonly:", 0);
  v1 = (void *)sharedManager_manager;
  sharedManager_manager = (uint64_t)v0;

}

void __55___SFDownloadManager__loadDownloadHistoryAsynchronous___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void (**v11)(_QWORD);
  _QWORD v12[6];

  objc_msgSend((id)objc_opt_class(), "downloadRepresentationsAtURL:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  v5 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __55___SFDownloadManager__loadDownloadHistoryAsynchronous___block_invoke_3;
  v12[3] = &unk_1E4AC75A8;
  v6 = *(_QWORD *)(a1 + 72);
  v12[4] = *(_QWORD *)(a1 + 32);
  v12[5] = v6;
  objc_msgSend(v5, "safari_mapObjectsUsingBlock:", v12);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

  v10 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "count");
  if (v10 != objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "count"))
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 1;
  v11 = *(void (***)(_QWORD))(a1 + 48);
  if (*(_BYTE *)(a1 + 80))
    dispatch_async(MEMORY[0x1E0C80D38], v11);
  else
    v11[2](*(_QWORD *)(a1 + 48));
}

id __37___SFDownloadManager_initAsReadonly___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_dataForPersistingToHistory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

void __69___SFDownloadManager_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  _QWORD v3[4];
  id v4;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __69___SFDownloadManager_observeValueForKeyPath_ofObject_change_context___block_invoke_2;
  v3[3] = &unk_1E4ABFF20;
  objc_copyWeak(&v4, v1);
  objc_msgSend(WeakRetained, "getDownloadsWithCompletionHandler:", v3);

  objc_destroyWeak(&v4);
}

void __69___SFDownloadManager_observeValueForKeyPath_ofObject_change_context___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_removeOldDownloadsAndUpdateTimerIfNeeded");

}

uint64_t __49___SFDownloadManager__dataForPersistingToHistory__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "dictionaryRepresentation");
}

uint64_t __43___SFDownloadManager_runningDownloadsCount__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isIdle") ^ 1;
}

_SFDownload *__55___SFDownloadManager__loadDownloadHistoryAsynchronous___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  _SFDownload *v4;
  unsigned __int8 v6;

  v6 = 0;
  v3 = a2;
  v4 = -[_SFDownload initWithDictionaryRepresentation:didUpdateRepresentation:]([_SFDownload alloc], "initWithDictionaryRepresentation:didUpdateRepresentation:", v3, &v6);

  -[_SFDownload setDelegate:](v4, "setDelegate:", *(_QWORD *)(a1 + 32));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = (*(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 40)
                                                                                               + 8)
                                                                                   + 24) | v6) != 0;
  return v4;
}

uint64_t __56___SFDownloadManager_getDownloadsWithCompletionHandler___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

BOOL __54___SFDownloadManager_removeDownloadsStartedAfterDate___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  _BOOL8 v4;

  objc_msgSend(a2, "dateAdded");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "compare:", *(_QWORD *)(a1 + 32)) == 1;

  return v4;
}

BOOL __45___SFDownloadManager__removeDeletedDownloads__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  _BOOL8 v4;

  v2 = a2;
  if (objc_msgSend(v2, "state") == 4)
  {
    objc_msgSend(v2, "completedFileURL");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3 == 0;

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

BOOL __63___SFDownloadManager__removeOldDownloadsAndUpdateTimerIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  double v4;
  _BOOL8 v5;

  objc_msgSend(a2, "dateFinished");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "timeIntervalSinceDate:", v3);
    v5 = v4 >= *(double *)(a1 + 40);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

void __63___SFDownloadManager__removeOldDownloadsAndUpdateTimerIfNeeded__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_removeOldDownloadsAndUpdateTimerIfNeeded");

}

BOOL __36___SFDownloadManager__busyDownloads__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "state") == 1;
}

void __61___SFDownloadManager_downloadDidImportFileToDownloadsFolder___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t *v3;
  uint64_t v4;
  id v5;
  NSObject *v6;
  id v7;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 32);
  v3 = (uint64_t *)(a1 + 32);
  v7 = 0;
  objc_msgSend(v2, "removeItemAtURL:error:", v4, &v7);
  v5 = v7;

  if (v5)
  {
    v6 = WBS_LOG_CHANNEL_PREFIXDownloads();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __61___SFDownloadManager_downloadDidImportFileToDownloadsFolder___block_invoke_cold_1(v3, v6, v5);
  }

}

void __67___SFDownloadManager_createDirectoryForDownload_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", *(_QWORD *)(a1 + 32), 1, 0, 0);

  v3 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "path");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v3 + 16))(v3, v4);

}

uint64_t __83___SFDownloadManager_downloadShouldContinueAfterReceivingResponse_decisionHandler___block_invoke(uint64_t a1, int a2)
{
  if (a2)
    objc_msgSend(*(id *)(a1 + 32), "_addDownload:", *(_QWORD *)(a1 + 40));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

void __61___SFDownloadManager_downloadDidImportFileToDownloadsFolder___block_invoke_cold_1(uint64_t *a1, void *a2, void *a3)
{
  uint64_t v4;
  NSObject *v5;
  void *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = *a1;
  v5 = a2;
  objc_msgSend(a3, "safari_privacyPreservingDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138478083;
  v8 = v4;
  v9 = 2114;
  v10 = v6;
  _os_log_error_impl(&dword_1A3B2D000, v5, OS_LOG_TYPE_ERROR, "Failed to remove download container (%{private}@): %{public}@", (uint8_t *)&v7, 0x16u);

}

@end
