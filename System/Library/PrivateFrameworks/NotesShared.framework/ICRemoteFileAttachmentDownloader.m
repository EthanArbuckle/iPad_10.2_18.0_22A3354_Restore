@implementation ICRemoteFileAttachmentDownloader

+ (void)initializeDownloaderAfterDelayIfNecessary
{
  void *v3;
  void *v4;
  _QWORD v5[5];

  objc_msgSend(MEMORY[0x1E0D641E8], "appLifeCycleHandler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancelBlocksWithStringIdentifier:", CFSTR("ICRemoteFileAttachmentDownloaderDispatchAfterIdentifier"));

  objc_msgSend(MEMORY[0x1E0D641E8], "appLifeCycleHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __77__ICRemoteFileAttachmentDownloader_initializeDownloaderAfterDelayIfNecessary__block_invoke;
  v5[3] = &__block_descriptor_40_e5_v8__0l;
  v5[4] = a1;
  objc_msgSend(v4, "dispatchAfter:stringIdentifier:withBlock:", CFSTR("ICRemoteFileAttachmentDownloaderDispatchAfterIdentifier"), v5, 5.0);

}

+ (id)sharedDownloader
{
  id v2;
  void *v3;
  ICRemoteFileAttachmentDownloader *v4;
  void *v5;
  id v6;

  v2 = a1;
  objc_sync_enter(v2);
  v3 = (void *)sSharedDownloader;
  if (!sSharedDownloader)
  {
    v4 = objc_alloc_init(ICRemoteFileAttachmentDownloader);
    v5 = (void *)sSharedDownloader;
    sSharedDownloader = (uint64_t)v4;

    v3 = (void *)sSharedDownloader;
  }
  v6 = v3;
  objc_sync_exit(v2);

  return v6;
}

void __77__ICRemoteFileAttachmentDownloader_initializeDownloaderAfterDelayIfNecessary__block_invoke(uint64_t a1)
{
  NSObject *v2;
  _QWORD block[5];

  dispatch_get_global_queue(-2, 0);
  v2 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __77__ICRemoteFileAttachmentDownloader_initializeDownloaderAfterDelayIfNecessary__block_invoke_2;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(v2, block);

}

id __77__ICRemoteFileAttachmentDownloader_initializeDownloaderAfterDelayIfNecessary__block_invoke_2(uint64_t a1)
{
  id result;

  result = (id)objc_msgSend(*(id *)(a1 + 32), "needsToDownloadRemoteFileAttachments");
  if ((_DWORD)result)
    return (id)objc_msgSend(*(id *)(a1 + 32), "sharedDownloader");
  return result;
}

+ (void)releaseSharedDownloaderIfPossible
{
  OUTLINED_FUNCTION_2_1(&dword_1BD918000, a1, a3, "Releasing the shared remote file attachment downloader", a5, a6, a7, a8, 0);
}

+ (BOOL)needsToDownloadRemoteFileAttachments
{
  void *v3;
  void *v4;
  id v5;
  _QWORD v7[4];
  id v8;
  uint64_t *v9;
  id v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  +[ICNoteContext sharedContext](ICNoteContext, "sharedContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "workerManagedObjectContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __72__ICRemoteFileAttachmentDownloader_needsToDownloadRemoteFileAttachments__block_invoke;
  v7[3] = &unk_1E76C9E70;
  v10 = a1;
  v5 = v4;
  v8 = v5;
  v9 = &v11;
  objc_msgSend(v5, "performBlockAndWait:", v7);
  LOBYTE(v4) = *((_BYTE *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)v4;
}

void __72__ICRemoteFileAttachmentDownloader_needsToDownloadRemoteFileAttachments__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 48), "allUndownloadedLegacyAttachmentsInContext:", *(_QWORD *)(a1 + 32));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v2, "count") != 0;

}

+ (id)allUndownloadedLegacyAttachmentsInContext:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB3880];
  v4 = a3;
  objc_msgSend(v3, "predicateWithFormat:", CFSTR("%K != nil"), CFSTR("remoteFileURLString"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v5;
  +[ICBaseAttachment predicateForVisibleAttachmentsInContext:](ICAttachment, "predicateForVisibleAttachmentsInContext:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3528], "andPredicateWithSubpredicates:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[ICBaseAttachment attachmentsMatchingPredicate:context:](ICAttachment, "attachmentsMatchingPredicate:context:", v8, v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (ICRemoteFileAttachmentDownloader)init
{
  ICRemoteFileAttachmentDownloader *v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)ICRemoteFileAttachmentDownloader;
  v2 = -[ICRemoteFileAttachmentDownloader init](&v19, sel_init);
  if (v2)
  {
    v3 = os_log_create("com.apple.notes", "Media");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      -[ICRemoteFileAttachmentDownloader init].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICRemoteFileAttachmentDownloader setOperationsByAttachmentIdentifier:](v2, "setOperationsByAttachmentIdentifier:", v11);

    v12 = objc_alloc_init(MEMORY[0x1E0CB3828]);
    -[ICRemoteFileAttachmentDownloader setOperationQueue:](v2, "setOperationQueue:", v12);

    -[ICRemoteFileAttachmentDownloader operationQueue](v2, "operationQueue");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setMaxConcurrentOperationCount:", 2);

    -[ICRemoteFileAttachmentDownloader operationQueue](v2, "operationQueue");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setName:", CFSTR("RemoteFileAttachmentDownloader"));

    -[ICRemoteFileAttachmentDownloader resumeDownloadsAfterDelay](v2, "resumeDownloadsAfterDelay");
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = *MEMORY[0x1E0D64498];
    objc_msgSend(MEMORY[0x1E0D64250], "sharedReachabilityForInternetConnection");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObserver:selector:name:object:", v2, sel_reachabilityChanged_, v16, v17);

  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t);
  void *v8;
  ICRemoteFileAttachmentDownloader *v9;

  v5 = MEMORY[0x1E0C809B0];
  v6 = 3221225472;
  v7 = __43__ICRemoteFileAttachmentDownloader_dealloc__block_invoke;
  v8 = &unk_1E76C73F8;
  v9 = self;
  performBlockOnMainThreadAndWait();
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)ICRemoteFileAttachmentDownloader;
  -[ICRemoteFileAttachmentDownloader dealloc](&v4, sel_dealloc);
}

uint64_t __43__ICRemoteFileAttachmentDownloader_dealloc__block_invoke(uint64_t a1)
{
  return objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:", *(_QWORD *)(a1 + 32));
}

- (void)resumeDownloadsAfterDelay
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61__ICRemoteFileAttachmentDownloader_resumeDownloadsAfterDelay__block_invoke;
  block[3] = &unk_1E76C73F8;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __61__ICRemoteFileAttachmentDownloader_resumeDownloadsAfterDelay__block_invoke(uint64_t a1)
{
  objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", *(_QWORD *)(a1 + 32), sel_downloadUndownloadedLegacyAttachments, 0);
  return objc_msgSend(*(id *)(a1 + 32), "performSelector:withObject:afterDelay:", sel_downloadUndownloadedLegacyAttachments, 0, 5.0);
}

- (void)downloadUndownloadedLegacyAttachments
{
  void *v3;
  _QWORD v4[5];

  +[ICNoteContext sharedContext](ICNoteContext, "sharedContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __73__ICRemoteFileAttachmentDownloader_downloadUndownloadedLegacyAttachments__block_invoke;
  v4[3] = &unk_1E76CB6C8;
  v4[4] = self;
  objc_msgSend(v3, "performBackgroundTask:", v4);

}

void __73__ICRemoteFileAttachmentDownloader_downloadUndownloadedLegacyAttachments__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend((id)objc_opt_class(), "allUndownloadedLegacyAttachmentsInContext:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = (void *)objc_msgSend(v4, "copy", 0);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(a1 + 32), "downloadRemoteFileForAttachment:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9++));
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

  objc_msgSend((id)objc_opt_class(), "releaseSharedDownloaderIfPossible");
}

- (void)downloadRemoteFileForAttachment:(id)a3
{
  id v4;

  objc_msgSend(a3, "objectID");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[ICRemoteFileAttachmentDownloader downloadRemoteFileForAttachmentObjectID:](self, "downloadRemoteFileForAttachmentObjectID:", v4);

}

- (void)downloadRemoteFileForAttachmentObjectID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  ICRemoteFileAttachmentDownloader *v17;
  uint64_t *v18;
  uint64_t *v19;
  _QWORD v20[4];
  id v21;
  id v22;
  ICRemoteFileAttachmentDownloader *v23;
  uint64_t *v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;

  v4 = a3;
  v32 = 0;
  v33 = &v32;
  v34 = 0x3032000000;
  v35 = __Block_byref_object_copy__49;
  v36 = __Block_byref_object_dispose__49;
  v37 = 0;
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__49;
  v30 = __Block_byref_object_dispose__49;
  v31 = 0;
  +[ICNoteContext sharedContext](ICNoteContext, "sharedContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "workerManagedObjectContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __76__ICRemoteFileAttachmentDownloader_downloadRemoteFileForAttachmentObjectID___block_invoke;
  v20[3] = &unk_1E76CF088;
  v8 = v4;
  v21 = v8;
  v9 = v6;
  v22 = v9;
  v23 = self;
  v24 = &v26;
  v25 = &v32;
  objc_msgSend(v9, "performBlockAndWait:", v20);
  if (v27[5])
  {
    v10 = os_log_create("com.apple.notes", "Media");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      -[ICRemoteFileAttachmentDownloader downloadRemoteFileForAttachmentObjectID:].cold.1();

    v11 = (void *)MEMORY[0x1E0CB34C8];
    v15[0] = v7;
    v15[1] = 3221225472;
    v15[2] = __76__ICRemoteFileAttachmentDownloader_downloadRemoteFileForAttachmentObjectID___block_invoke_29;
    v15[3] = &unk_1E76CF100;
    v18 = &v26;
    v19 = &v32;
    v16 = v8;
    v17 = self;
    objc_msgSend(v11, "blockOperationWithBlock:", v15);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICRemoteFileAttachmentDownloader operationsByAttachmentIdentifier](self, "operationsByAttachmentIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v12, v33[5]);

    -[ICRemoteFileAttachmentDownloader operationQueue](self, "operationQueue");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addOperation:", v12);

  }
  _Block_object_dispose(&v26, 8);

  _Block_object_dispose(&v32, 8);
}

void __76__ICRemoteFileAttachmentDownloader_downloadRemoteFileForAttachmentObjectID___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;

  +[ICAttachment ic_existingObjectWithID:context:](ICAttachment, "ic_existingObjectWithID:context:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  v12 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v12, "isDeleted") & 1) == 0 && (objc_msgSend(v12, "isSharedViaICloud") & 1) == 0)
  {
    if (objc_msgSend(v12, "isVisible"))
    {
      objc_msgSend(v12, "remoteFileURL");
      v2 = (void *)objc_claimAutoreleasedReturnValue();

      if (v2)
      {
        objc_msgSend(*(id *)(a1 + 48), "operationsByAttachmentIdentifier");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "identifier");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "objectForKeyedSubscript:", v4);
        v5 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v5 || objc_msgSend(v5, "isFinished"))
        {
          objc_msgSend(v12, "remoteFileURL");
          v6 = objc_claimAutoreleasedReturnValue();
          v7 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
          v8 = *(void **)(v7 + 40);
          *(_QWORD *)(v7 + 40) = v6;

          objc_msgSend(v12, "identifier");
          v9 = objc_claimAutoreleasedReturnValue();
          v10 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
          v11 = *(void **)(v10 + 40);
          *(_QWORD *)(v10 + 40) = v9;

        }
      }
    }
  }

}

void __76__ICRemoteFileAttachmentDownloader_downloadRemoteFileForAttachmentObjectID___block_invoke_29(uint64_t a1)
{
  dispatch_semaphore_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  dispatch_time_t v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  os_log_t v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  id v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  _QWORD *v25;
  uint64_t *v26;
  _QWORD v27[4];
  NSObject *v28;
  _QWORD *v29;
  uint64_t *v30;
  uint64_t *v31;
  _QWORD v32[3];
  char v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t (*v43)(uint64_t, uint64_t);
  void (*v44)(uint64_t);
  id v45;
  uint8_t buf[24];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v40 = 0;
  v41 = &v40;
  v42 = 0x3032000000;
  v43 = __Block_byref_object_copy__49;
  v44 = __Block_byref_object_dispose__49;
  v45 = 0;
  v34 = 0;
  v35 = &v34;
  v36 = 0x3032000000;
  v37 = __Block_byref_object_copy__49;
  v38 = __Block_byref_object_dispose__49;
  v39 = 0;
  v32[0] = 0;
  v32[1] = v32;
  v32[2] = 0x2020000000;
  v33 = 0;
  v2 = dispatch_semaphore_create(0);
  objc_msgSend(MEMORY[0x1E0CB39F0], "sharedSession");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  v5 = MEMORY[0x1E0C809B0];
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __76__ICRemoteFileAttachmentDownloader_downloadRemoteFileForAttachmentObjectID___block_invoke_2;
  v27[3] = &unk_1E76CF0B0;
  v29 = v32;
  v30 = &v34;
  v31 = &v40;
  v6 = v2;
  v28 = v6;
  objc_msgSend(v3, "dataTaskWithURL:completionHandler:", v4, v27);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "resume");
  v8 = dispatch_time(0, 20000000000);
  dispatch_semaphore_wait(v6, v8);
  v9 = (void *)v41[5];
  if (!v9)
    goto LABEL_8;
  if (objc_msgSend(v9, "code") == -1009)
  {
    v10 = os_log_create("com.apple.notes", "Media");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      __76__ICRemoteFileAttachmentDownloader_downloadRemoteFileForAttachmentObjectID___block_invoke_29_cold_3();
    goto LABEL_14;
  }
  if (v41[5])
  {
    v10 = os_log_create("com.apple.notes", "Media");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      __76__ICRemoteFileAttachmentDownloader_downloadRemoteFileForAttachmentObjectID___block_invoke_29_cold_4();
  }
  else
  {
LABEL_8:
    v11 = v35[5];
    v12 = os_log_create("com.apple.notes", "Media");
    v10 = v12;
    if (v11)
    {
      v10 = v12;
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        __76__ICRemoteFileAttachmentDownloader_downloadRemoteFileForAttachmentObjectID___block_invoke_29_cold_2(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), objc_msgSend((id)v35[5], "length"), buf, v10);

    }
    else if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      __76__ICRemoteFileAttachmentDownloader_downloadRemoteFileForAttachmentObjectID___block_invoke_29_cold_1();
    }
  }
LABEL_14:

  +[ICNoteContext sharedContext](ICNoteContext, "sharedContext");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "workerManagedObjectContext");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v19[0] = v5;
  v19[1] = 3221225472;
  v19[2] = __76__ICRemoteFileAttachmentDownloader_downloadRemoteFileForAttachmentObjectID___block_invoke_33;
  v19[3] = &unk_1E76CF0D8;
  v20 = *(id *)(a1 + 32);
  v15 = v14;
  v17 = *(_QWORD *)(a1 + 48);
  v16 = *(_QWORD *)(a1 + 56);
  v21 = v15;
  v22 = v16;
  v23 = &v34;
  v24 = v17;
  v25 = v32;
  v26 = &v40;
  objc_msgSend(v15, "performBlockAndWait:", v19);
  objc_msgSend(*(id *)(a1 + 40), "operationsByAttachmentIdentifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "removeObjectForKey:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));

  objc_msgSend((id)objc_opt_class(), "releaseSharedDownloaderIfPossible");
  _Block_object_dispose(v32, 8);
  _Block_object_dispose(&v34, 8);

  _Block_object_dispose(&v40, 8);
}

void __76__ICRemoteFileAttachmentDownloader_downloadRemoteFileForAttachmentObjectID___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;

  v13 = a2;
  v8 = a3;
  v9 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v8, "statusCode") != 200)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  else
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a2);
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v9;
  v12 = v9;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __76__ICRemoteFileAttachmentDownloader_downloadRemoteFileForAttachmentObjectID___block_invoke_33(_QWORD *a1)
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  char v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  void *v19;
  const __CFString *v20;
  void *v21;
  id v22;

  +[ICAttachment ic_existingObjectWithID:context:](ICAttachment, "ic_existingObjectWithID:context:", a1[4], a1[5]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2 || (objc_msgSend(v2, "isVisible") & 1) == 0)
  {
    v5 = os_log_create("com.apple.notes", "Media");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      __76__ICRemoteFileAttachmentDownloader_downloadRemoteFileForAttachmentObjectID___block_invoke_33_cold_2();
    goto LABEL_9;
  }
  objc_msgSend(v3, "media");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = os_log_create("com.apple.notes", "Media");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      __76__ICRemoteFileAttachmentDownloader_downloadRemoteFileForAttachmentObjectID___block_invoke_33_cold_3(v3, v5);

LABEL_9:
    goto LABEL_10;
  }
  v16 = *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40);
  if (v16)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1[8] + 8) + 40), "lastPathComponent");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = +[ICMedia newMediaWithAttachment:forData:filename:error:](ICMedia, "newMediaWithAttachment:forData:filename:error:", v3, v16, v17, 0);
    objc_msgSend(v3, "setMedia:", v18);

    objc_msgSend(v3, "setRemoteFileURL:", 0);
    objc_msgSend(v3, "attachmentModel");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "updateFileBasedAttributes");

    v20 = CFSTR("Downloaded remote file");
LABEL_19:
    objc_msgSend(v3, "updateChangeCountWithReason:", v20);
    goto LABEL_10;
  }
  if (*(_BYTE *)(*(_QWORD *)(a1[9] + 8) + 24)
    || (v21 = *(void **)(*(_QWORD *)(a1[10] + 8) + 40)) != 0 && objc_msgSend(v21, "code") != -1009)
  {
    objc_msgSend(v3, "setRemoteFileURL:", 0);
    v20 = CFSTR("Failed downloading remote file");
    goto LABEL_19;
  }
LABEL_10:
  v6 = (void *)a1[5];
  v22 = 0;
  v7 = objc_msgSend(v6, "save:", &v22);
  v8 = v22;
  if ((v7 & 1) == 0)
  {
    v9 = os_log_create("com.apple.notes", "Media");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      __76__ICRemoteFileAttachmentDownloader_downloadRemoteFileForAttachmentObjectID___block_invoke_33_cold_1((uint64_t)v8, v9, v10, v11, v12, v13, v14, v15);

  }
}

- (void)reachabilityChanged:(id)a3
{
  void *v4;
  uint64_t v5;

  objc_msgSend(MEMORY[0x1E0D64250], "sharedReachabilityForInternetConnection", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "currentReachabilityStatus");

  if ((unint64_t)(v5 - 1) <= 1)
    -[ICRemoteFileAttachmentDownloader resumeDownloadsAfterDelay](self, "resumeDownloadsAfterDelay");
}

- (NSMutableDictionary)operationsByAttachmentIdentifier
{
  return self->_operationsByAttachmentIdentifier;
}

- (void)setOperationsByAttachmentIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_operationsByAttachmentIdentifier, a3);
}

- (NSOperationQueue)operationQueue
{
  return self->_operationQueue;
}

- (void)setOperationQueue:(id)a3
{
  objc_storeStrong((id *)&self->_operationQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_operationsByAttachmentIdentifier, 0);
}

- (void)init
{
  OUTLINED_FUNCTION_2_1(&dword_1BD918000, a1, a3, "Creating the shared remote file attachment downloader", a5, a6, a7, a8, 0);
}

- (void)downloadRemoteFileForAttachmentObjectID:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3_7();
  OUTLINED_FUNCTION_1_2(&dword_1BD918000, v0, v1, "Adding operation to download remote URL for attachment %@", v2);
  OUTLINED_FUNCTION_1_0();
}

void __76__ICRemoteFileAttachmentDownloader_downloadRemoteFileForAttachmentObjectID___block_invoke_29_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_8(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_3_7();
  OUTLINED_FUNCTION_0_1(&dword_1BD918000, v0, v1, "Unknown error downloading remote URL for attachment (%@)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __76__ICRemoteFileAttachmentDownloader_downloadRemoteFileForAttachmentObjectID___block_invoke_29_cold_2(uint64_t a1, unint64_t a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412546;
  *(_QWORD *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2048;
  *(double *)(buf + 14) = (double)a2 * 0.0009765625;
  _os_log_debug_impl(&dword_1BD918000, log, OS_LOG_TYPE_DEBUG, "Downloaded remote URL for attachment (%@). Size=%.2fkb", buf, 0x16u);
}

void __76__ICRemoteFileAttachmentDownloader_downloadRemoteFileForAttachmentObjectID___block_invoke_29_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  OUTLINED_FUNCTION_2_8(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_3_7();
  OUTLINED_FUNCTION_1_2(&dword_1BD918000, v0, v1, "No internet connection while downloading remote URL for attachment (%@)", v2);
  OUTLINED_FUNCTION_1_0();
}

void __76__ICRemoteFileAttachmentDownloader_downloadRemoteFileForAttachmentObjectID___block_invoke_29_cold_4()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;

  OUTLINED_FUNCTION_2_8(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_3_7();
  v3 = 2112;
  v4 = v0;
  _os_log_error_impl(&dword_1BD918000, v1, OS_LOG_TYPE_ERROR, "Error downloading remote URL for attachment (%@): %@", v2, 0x16u);
  OUTLINED_FUNCTION_1_0();
}

void __76__ICRemoteFileAttachmentDownloader_downloadRemoteFileForAttachmentObjectID___block_invoke_33_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_1BD918000, a2, a3, "Error saving after downloading remote file attachment: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

void __76__ICRemoteFileAttachmentDownloader_downloadRemoteFileForAttachmentObjectID___block_invoke_33_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3_7();
  OUTLINED_FUNCTION_1_2(&dword_1BD918000, v0, v1, "Finished downloading a file for a deleted attachment (%@)", v2);
  OUTLINED_FUNCTION_1_0();
}

void __76__ICRemoteFileAttachmentDownloader_downloadRemoteFileForAttachmentObjectID___block_invoke_33_cold_3(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v3;
  OUTLINED_FUNCTION_1_2(&dword_1BD918000, a2, v4, "Trying to set a media for a downloaded attachment (%@), but it already has a media.", (uint8_t *)&v5);

}

@end
