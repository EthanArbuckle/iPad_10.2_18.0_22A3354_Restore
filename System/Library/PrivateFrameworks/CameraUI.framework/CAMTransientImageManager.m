@implementation CAMTransientImageManager

- (CAMTransientImageManager)init
{
  CAMTransientImageManager *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *pairedVideosByPairedUUID;
  NSMutableDictionary *v5;
  NSMutableDictionary *activeRequestsByPairedUUID;
  CAMTransientImageManager *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CAMTransientImageManager;
  v2 = -[CAMTransientImageManager init](&v9, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    pairedVideosByPairedUUID = v2->__pairedVideosByPairedUUID;
    v2->__pairedVideosByPairedUUID = v3;

    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    activeRequestsByPairedUUID = v2->__activeRequestsByPairedUUID;
    v2->__activeRequestsByPairedUUID = v5;

    v7 = v2;
  }

  return v2;
}

- (BOOL)isEmpty
{
  void *v2;
  BOOL v3;

  -[CAMTransientImageManager _pairedVideosByPairedUUID](self, "_pairedVideosByPairedUUID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") == 0;

  return v3;
}

- (id)existingPairedVideoUUIDs
{
  void *v2;
  void *v3;

  -[CAMTransientImageManager _pairedVideosByPairedUUID](self, "_pairedVideosByPairedUUID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)existingPairedVideoForUUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[CAMTransientImageManager _pairedVideosByPairedUUID](self, "_pairedVideosByPairedUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)insertPairedVideoWithConvertible:(id)a3 filterType:(int64_t)a4
{
  id v5;
  void *v6;
  void *v7;
  const __CFAllocator *v8;
  __CFString *v9;
  NSObject *v10;
  CAMTransientPairedVideo *v11;
  void *v12;
  CAMTransientPairedVideo *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void (**v23)(_QWORD, _QWORD, _QWORD);
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  dispatch_time_t v33;
  void *v35;
  void *v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  _QWORD block[4];
  id v44;
  id v45;
  _BYTE v46[24];
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  CMTime v51;
  uint64_t v52;
  const __CFString *v53;
  uint64_t v54;
  void *v55;
  _BYTE v56[128];
  CMTime time;
  __CFString *v58;
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "irisStillImageUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "persistenceURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  memset(&v51, 0, sizeof(v51));
  if (v5)
    objc_msgSend(v5, "irisStillDisplayTime");
  if (v6 && v7 && (v51.flags & 1) != 0)
  {
    -[CAMTransientImageManager _pairedVideosByPairedUUID](self, "_pairedVideosByPairedUUID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = [CAMTransientPairedVideo alloc];
    time = v51;
    v11 = -[CAMTransientPairedVideo initWithURL:stillDisplayTime:filterType:](v13, "initWithURL:stillDisplayTime:filterType:", v7, &time, a4);
    objc_msgSend(v12, "setObject:forKey:", v11, v6);

LABEL_11:
    v35 = v7;
    v37 = v5;
    -[CAMTransientImageManager _activeRequestsByPairedUUID](self, "_activeRequestsByPairedUUID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKeyedSubscript:", v6);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    -[CAMTransientImageManager _activeRequestsByPairedUUID](self, "_activeRequestsByPairedUUID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = v6;
    objc_msgSend(v16, "setObject:forKeyedSubscript:", 0, v6);

    v49 = 0u;
    v50 = 0u;
    v47 = 0u;
    v48 = 0u;
    v17 = v15;
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v47, v56, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v48;
      v41 = *MEMORY[0x1E0D7D278];
      v40 = *MEMORY[0x1E0D7D270];
      v39 = *MEMORY[0x1E0D7D268];
      v38 = *MEMORY[0x1E0CB2D50];
      do
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v48 != v20)
            objc_enumerationMutation(v17);
          v22 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * i);
          objc_msgSend(v22, "setIsFinished:", 1);
          objc_msgSend(v22, "resultHandler");
          v23 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
          if (v23)
          {
            objc_msgSend(v22, "setResultHandler:", 0);
            if (v11)
            {
              v24 = (void *)MEMORY[0x1E0C99E08];
              v25 = (void *)MEMORY[0x1E0CB3B18];
              -[CAMTransientPairedVideo stillDisplayTime](v11, "stillDisplayTime");
              objc_msgSend(v25, "valueWithCMTime:", v46);
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v24, "dictionaryWithObject:forKey:", v26, v41);
              v27 = (void *)objc_claimAutoreleasedReturnValue();

              +[CAMEffectFilterManager ciFilterNameForFilterType:](CAMEffectFilterManager, "ciFilterNameForFilterType:", a4);
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              if (v28)
                objc_msgSend(v27, "setObject:forKeyedSubscript:", v28, v40);
              -[CAMTransientPairedVideo url](v11, "url");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              ((void (**)(_QWORD, void *, void *))v23)[2](v23, v29, v27);

            }
            else
            {
              v30 = (void *)MEMORY[0x1E0CB35C8];
              v52 = v38;
              v53 = CFSTR("Invalid transient asset, unable to service the request.");
              v54 = v39;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v53, &v52, 1);
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v30, "errorWithDomain:code:userInfo:", CFSTR("com.apple.CAMTransientImageManagerErrorDomain"), -1, v31);
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              v55 = v32;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v55, &v54, 1);
              v27 = (void *)objc_claimAutoreleasedReturnValue();

              ((void (**)(_QWORD, _QWORD, void *))v23)[2](v23, 0, v27);
            }

          }
        }
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v47, v56, 16);
      }
      while (v19);
    }

    objc_initWeak((id *)&time, self);
    v33 = dispatch_time(0, 60000000000);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __72__CAMTransientImageManager_insertPairedVideoWithConvertible_filterType___block_invoke;
    block[3] = &unk_1EA328F00;
    objc_copyWeak(&v45, (id *)&time);
    v6 = v36;
    v44 = v36;
    dispatch_after(v33, MEMORY[0x1E0C80D38], block);

    objc_destroyWeak(&v45);
    objc_destroyWeak((id *)&time);

    v5 = v37;
    v7 = v35;
    goto LABEL_26;
  }
  v8 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  time = v51;
  v9 = (__CFString *)CMTimeCopyDescription(v8, &time);
  v10 = os_log_create("com.apple.camera", "Camera");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    LODWORD(time.value) = 138543874;
    *(CMTimeValue *)((char *)&time.value + 4) = (CMTimeValue)v6;
    LOWORD(time.flags) = 2114;
    *(_QWORD *)((char *)&time.flags + 2) = v7;
    HIWORD(time.epoch) = 2114;
    v58 = v9;
    _os_log_error_impl(&dword_1DB760000, v10, OS_LOG_TYPE_ERROR, "Unable to insert a paired video for an invalid UUID (%{public}@), invalid URL (%{public}@), or invalid still display time (%{public}@)", (uint8_t *)&time, 0x20u);
  }

  v11 = 0;
  if (v6)
    goto LABEL_11;
LABEL_26:

  return v11;
}

void __72__CAMTransientImageManager_insertPairedVideoWithConvertible_filterType___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "removePairedVideoForUUID:", *(_QWORD *)(a1 + 32));

}

- (void)removePairedVideoForUUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void (**v15)(_QWORD, _QWORD, _QWORD);
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id obj;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint64_t v27;
  const __CFString *v28;
  uint64_t v29;
  void *v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[CAMTransientImageManager _pairedVideosByPairedUUID](self, "_pairedVideosByPairedUUID");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "removeObjectForKey:", v4);
  -[CAMTransientImageManager _activeRequestsByPairedUUID](self, "_activeRequestsByPairedUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[CAMTransientImageManager _activeRequestsByPairedUUID](self, "_activeRequestsByPairedUUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v4;
  objc_msgSend(v7, "setObject:forKeyedSubscript:", 0, v4);

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  obj = v6;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v24;
    v11 = *MEMORY[0x1E0D7D268];
    v12 = *MEMORY[0x1E0CB2D50];
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v24 != v10)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        objc_msgSend(v14, "setIsCanceled:", 1);
        objc_msgSend(v14, "resultHandler");
        v15 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        if (v15)
        {
          objc_msgSend(v14, "setResultHandler:", 0);
          v16 = (void *)MEMORY[0x1E0CB35C8];
          v27 = v12;
          v28 = CFSTR("Transient paired video was removed so player request was canceled.");
          v29 = v11;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v28, &v27, 1);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "errorWithDomain:code:userInfo:", CFSTR("com.apple.CAMTransientImageManagerErrorDomain"), -1, v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = v18;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v30, &v29, 1);
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          ((void (**)(_QWORD, _QWORD, void *))v15)[2](v15, 0, v19);
        }

      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
    }
    while (v9);
  }

}

- (void)requestPairedVideoURLForUUID:(id)a3 resultHandler:(id)a4
{
  id v6;
  void (**v7)(id, void *, id);
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  CAMTransientImageManagerRequest *v18;
  dispatch_time_t v19;
  CAMTransientImageManagerRequest *v20;
  _QWORD v21[4];
  CAMTransientImageManagerRequest *v22;
  id v23;
  id location;
  _BYTE v25[24];

  v6 = a3;
  v7 = (void (**)(id, void *, id))a4;
  -[CAMTransientImageManager _pairedVideosByPairedUUID](self, "_pairedVideosByPairedUUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = (void *)MEMORY[0x1E0C99E08];
    v11 = (void *)MEMORY[0x1E0CB3B18];
    objc_msgSend(v9, "stillDisplayTime");
    objc_msgSend(v11, "valueWithCMTime:", v25);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dictionaryWithObject:forKey:", v12, *MEMORY[0x1E0D7D278]);
    v13 = (id)objc_claimAutoreleasedReturnValue();

    +[CAMEffectFilterManager ciFilterNameForFilterType:](CAMEffectFilterManager, "ciFilterNameForFilterType:", objc_msgSend(v9, "filterType"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
      objc_msgSend(v13, "setObject:forKeyedSubscript:", v14, *MEMORY[0x1E0D7D270]);
    objc_msgSend(v9, "url");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, v15, v13);

  }
  else
  {
    -[CAMTransientImageManager _activeRequestsByPairedUUID](self, "_activeRequestsByPairedUUID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectForKeyedSubscript:", v6);
    v13 = (id)objc_claimAutoreleasedReturnValue();

    if (!v13)
    {
      v13 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      -[CAMTransientImageManager _activeRequestsByPairedUUID](self, "_activeRequestsByPairedUUID");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setObject:forKeyedSubscript:", v13, v6);

    }
    v18 = objc_alloc_init(CAMTransientImageManagerRequest);
    -[CAMTransientImageManagerRequest setUuid:](v18, "setUuid:", v6);
    -[CAMTransientImageManagerRequest setResultHandler:](v18, "setResultHandler:", v7);

    objc_msgSend(v13, "addObject:", v18);
    objc_initWeak(&location, self);
    v19 = dispatch_time(0, 30000000000);
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __71__CAMTransientImageManager_requestPairedVideoURLForUUID_resultHandler___block_invoke;
    v21[3] = &unk_1EA328F00;
    objc_copyWeak(&v23, &location);
    v22 = v18;
    v20 = v18;
    dispatch_after(v19, MEMORY[0x1E0C80D38], v21);

    objc_destroyWeak(&v23);
    objc_destroyWeak(&location);
  }

}

void __71__CAMTransientImageManager_requestPairedVideoURLForUUID_resultHandler___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_handleRequestTimeout:", *(_QWORD *)(a1 + 32));

}

- (void)_handleRequestTimeout:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void (**v8)(_QWORD, _QWORD, _QWORD);
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  const __CFString *v14;
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((objc_msgSend(v4, "isCanceled") & 1) == 0 && (objc_msgSend(v4, "isFinished") & 1) == 0)
  {
    objc_msgSend(v4, "setIsFinished:", 1);
    -[CAMTransientImageManager _activeRequestsByPairedUUID](self, "_activeRequestsByPairedUUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "uuid");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "removeObject:", v4);
    objc_msgSend(v4, "resultHandler");
    v8 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v4, "setResultHandler:", 0);
      v15 = *MEMORY[0x1E0D7D268];
      v9 = (void *)MEMORY[0x1E0CB35C8];
      v13 = *MEMORY[0x1E0CB2D50];
      v14 = CFSTR("Transient player item request timed out.");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "errorWithDomain:code:userInfo:", CFSTR("com.apple.CAMTransientImageManagerErrorDomain"), -1, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v16[0] = v11;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      ((void (**)(_QWORD, _QWORD, void *))v8)[2](v8, 0, v12);
    }

  }
}

- (NSMutableDictionary)_pairedVideosByPairedUUID
{
  return self->__pairedVideosByPairedUUID;
}

- (NSMutableDictionary)_activeRequestsByPairedUUID
{
  return self->__activeRequestsByPairedUUID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__activeRequestsByPairedUUID, 0);
  objc_storeStrong((id *)&self->__pairedVideosByPairedUUID, 0);
}

@end
