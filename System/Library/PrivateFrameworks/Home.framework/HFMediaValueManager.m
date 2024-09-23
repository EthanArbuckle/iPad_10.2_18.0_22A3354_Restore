@implementation HFMediaValueManager

- (HFMediaValueManager)initWithMediaProfileContainer:(id)a3
{
  id v5;
  HFMediaValueManager *v6;
  HFMediaValueManager *v7;
  uint64_t v8;
  NSMutableArray *transactionStack;
  void *v10;
  void *v11;
  void *v13;
  objc_super v14;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFMediaValueManager.m"), 64, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("mediaProfileContainer"));

  }
  v14.receiver = self;
  v14.super_class = (Class)HFMediaValueManager;
  v6 = -[HFMediaValueManager init](&v14, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeWeak((id *)&v6->_mediaProfileContainer, v5);
    v8 = objc_opt_new();
    transactionStack = v7->_transactionStack;
    v7->_transactionStack = (NSMutableArray *)v8;

    +[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addMediaSessionObserver:", v7);

    +[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addMediaObjectObserver:", v7);

  }
  return v7;
}

- (HFMediaValueManager)init
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithMediaProfileContainer_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFMediaValueManager.m"), 79, CFSTR("%s is unavailable; use %@ instead"),
    "-[HFMediaValueManager init]",
    v5);

  return 0;
}

- (BOOL)hasPendingWritesForRouteID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;

  if (!a3)
    return 0;
  v4 = a3;
  -[HFMediaValueManager mediaProfileContainer](self, "mediaProfileContainer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hf_mediaRouteIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", v4);

  if (v7)
  {
    if (objc_msgSend(v5, "isContainedWithinItemGroup"))
    {
      objc_msgSend(v5, "hf_home");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "hf_backingAccessory");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "hf_mediaSystemForAccessory:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v10, "hf_mediaValueSource");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "hf_mediaRouteIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v11, "hasPendingWritesForRouteID:", v12);

    }
    else
    {
      -[HFMediaValueManager transactionStack](self, "transactionStack");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v10, "count") != 0;
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (int64_t)lastPlaybackStateForProfileForRouteID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  void *v16;
  int v18;
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (!a3)
    return 0;
  v4 = a3;
  -[HFMediaValueManager mediaProfileContainer](self, "mediaProfileContainer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hf_mediaRouteIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", v4);

  if (v7)
  {
    if (objc_msgSend(v5, "isContainedWithinItemGroup"))
    {
      objc_msgSend(v5, "hf_home");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "hf_backingAccessory");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "hf_mediaSystemForAccessory:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v10, "hf_mediaValueSource");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "hf_mediaRouteIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v11, "lastPlaybackStateForProfileForRouteID:", v12);

    }
    else
    {
      objc_msgSend(v5, "mediaSession");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v14, "playbackState");
      HFLogForCategory(0x39uLL);
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        NSStringFromHMMediaPlaybackState(v13);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = 138412802;
        v19 = v5;
        v20 = 2112;
        v21 = v14;
        v22 = 2112;
        v23 = v16;
        _os_log_impl(&dword_1DD34E000, v15, OS_LOG_TYPE_DEFAULT, "--> Reading Last Known Media Playback Value for %@/%@ (%@)", (uint8_t *)&v18, 0x20u);

      }
    }
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)writePlaybackState:(int64_t)a3 playbackArchive:(id)a4 forRouteID:(id)a5
{
  id v9;
  void *v10;
  __CFString **v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  NSObject *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  id v31;
  void *v32;
  void *v34;
  SEL v35;
  void *v36;
  __CFString *v37;
  id v38;
  _QWORD v39[5];
  id v40;
  id v41;
  id v42[4];
  _BYTE location[12];
  __int16 v44;
  id v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v38 = a4;
  v9 = a5;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_26;
  }
  v35 = a2;
  -[HFMediaValueManager mediaProfileContainer](self, "mediaProfileContainer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "mediaSession");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = HFOperationMediaAccessoryPlay;
  if (a3 != 1)
    v11 = HFOperationMediaAccessoryPause;
  v37 = *v11;
  if (v10)
  {
    objc_msgSend(v10, "hf_mediaRouteIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "isEqualToString:", v9);

    if ((v13 & 1) != 0)
    {
      if (v36)
      {
        -[HFMediaValueManager mediaProfileContainer](self, "mediaProfileContainer");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "accessories");
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v15, "na_any:", &__block_literal_global_67))
        {
          HFLogForCategory(0x39uLL);
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)location = 0;
            _os_log_error_impl(&dword_1DD34E000, v16, OS_LOG_TYPE_ERROR, "isUpdatingSoftware is true", location, 2u);
          }

          objc_msgSend(MEMORY[0x1E0CB35C8], "hf_errorWithCode:operation:options:", 23, v37, 0);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v17 = 0;
        }

        goto LABEL_22;
      }
      HFLogForCategory(0x39uLL);
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)location = 0;
        _os_log_error_impl(&dword_1DD34E000, v22, OS_LOG_TYPE_ERROR, "mediaSession is nil", location, 2u);
      }

      objc_msgSend(MEMORY[0x1E0CB35C8], "hf_errorWithCode:operation:options:", 24, v37, 0);
      v20 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      HFLogForCategory(0x39uLL);
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v10, "hf_mediaRouteIdentifier");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)location = 138412546;
        *(_QWORD *)&location[4] = v34;
        v44 = 2112;
        v45 = v9;
        _os_log_error_impl(&dword_1DD34E000, v21, OS_LOG_TYPE_ERROR, "route identifier mismatch: mediaProfileContainer.hf_mediaRouteIdentifier: %@ routeID: %@", location, 0x16u);

      }
      objc_msgSend(MEMORY[0x1E0CB35C8], "hf_errorWithCode:operation:options:", 23, v37, 0);
      v20 = objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    HFLogForCategory(0x39uLL);
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)location = 0;
      _os_log_error_impl(&dword_1DD34E000, v19, OS_LOG_TYPE_ERROR, "mediaProfileContainer is nil", location, 2u);
    }

    objc_msgSend(MEMORY[0x1E0CB35C8], "hf_errorWithCode:operation:options:", 23, v37, 0);
    v20 = objc_claimAutoreleasedReturnValue();
  }
  v17 = (void *)v20;
LABEL_22:
  if (v17)
  {
    -[HFMediaValueManager _updateCachedPlaybackStateWriteError:operationType:notifyDelegates:](self, "_updateCachedPlaybackStateWriteError:operationType:notifyDelegates:", v17, CFSTR("HFMediaValueManager.writePlaybackState.preflight"), 1);
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithError:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v23 = (void *)objc_opt_new();
    objc_msgSend(v23, "setPlaybackState:", a3);
    -[HFMediaValueManager transactionStack](self, "transactionStack");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "addObject:", v23);

    v25 = -[HFMediaValueManager lastPlaybackStateForProfileForRouteID:](self, "lastPlaybackStateForProfileForRouteID:", v9);
    -[HFMediaValueManager _notifyDelegatesWillUpdatePlaybackState:mediaSession:](self, "_notifyDelegatesWillUpdatePlaybackState:mediaSession:", v25, v36);
    objc_initWeak((id *)location, self);
    -[HFMediaValueManager mediaProfileContainer](self, "mediaProfileContainer");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "hf_home");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "hf_characteristicValueManager");
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    v29 = (void *)MEMORY[0x1E0D519C0];
    v39[0] = MEMORY[0x1E0C809B0];
    v39[1] = 3221225472;
    v39[2] = __69__HFMediaValueManager_writePlaybackState_playbackArchive_forRouteID___block_invoke_48;
    v39[3] = &unk_1EA72FCB0;
    v39[4] = self;
    v42[1] = (id)a3;
    v42[2] = v25;
    v30 = v23;
    v40 = v30;
    v31 = v28;
    v41 = v31;
    objc_copyWeak(v42, (id *)location);
    v42[3] = (id)v35;
    objc_msgSend(v29, "futureWithBlock:", v39);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setWriteFuture:", v32);

    objc_msgSend(v30, "writeFuture");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_destroyWeak(v42);

    objc_destroyWeak((id *)location);
  }

LABEL_26:
  return v18;
}

uint64_t __69__HFMediaValueManager_writePlaybackState_playbackArchive_forRouteID___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_isSoftwareUpdateInProgress");
}

void __69__HFMediaValueManager_writePlaybackState_playbackArchive_forRouteID___block_invoke_48(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  id v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t, void *, void *);
  void *v23;
  id v24;
  id v25;
  id v26;
  int8x16_t v27;
  uint64_t v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = objc_alloc(MEMORY[0x1E0CBA648]);
  objc_msgSend(*(id *)(a1 + 32), "mediaProfileContainer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "mediaProfiles");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "initWithMediaProfiles:playbackState:volume:playbackArchive:", v6, *(_QWORD *)(a1 + 64), 0, 0);

  HFLogForCategory(0x39uLL);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "mediaProfileContainer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromHMMediaPlaybackState(*(_QWORD *)(a1 + 72));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromHMMediaPlaybackState(*(_QWORD *)(a1 + 64));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "transactionNumber");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v30 = v9;
    v31 = 2112;
    v32 = v10;
    v33 = 2112;
    v34 = v11;
    v35 = 2112;
    v36 = v12;
    _os_log_impl(&dword_1DD34E000, v8, OS_LOG_TYPE_DEFAULT, "--> Starting media value write transaction session %@: from %@ -> %@  (Transaction ID %@)", buf, 0x2Au);

  }
  objc_msgSend(*(id *)(a1 + 48), "beginTransactionWithReason:", CFSTR("HFMediaValueManagerTransactionReasonActionExecution"));
  v13 = *(void **)(a1 + 48);
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v7);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "executeActions:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = MEMORY[0x1E0C809B0];
  v21 = 3221225472;
  v22 = __69__HFMediaValueManager_writePlaybackState_playbackArchive_forRouteID___block_invoke_51;
  v23 = &unk_1EA72FC88;
  objc_copyWeak(&v26, (id *)(a1 + 56));
  v27 = vextq_s8(*(int8x16_t *)(a1 + 64), *(int8x16_t *)(a1 + 64), 8uLL);
  v16 = *(id *)(a1 + 40);
  v17 = *(_QWORD *)(a1 + 80);
  v24 = v16;
  v28 = v17;
  v18 = v3;
  v25 = v18;
  v19 = (id)objc_msgSend(v15, "addCompletionBlock:", &v20);

  objc_msgSend(*(id *)(a1 + 48), "commitTransactionWithReason:", CFSTR("HFMediaValueManagerTransactionReasonActionExecution"), v20, v21, v22, v23);
  objc_destroyWeak(&v26);

}

void __69__HFMediaValueManager_writePlaybackState_playbackArchive_forRouteID___block_invoke_51(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v8 = WeakRetained;
  if (v5)
  {
    HFLogForCategory(0x39uLL);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v8, "mediaProfileContainer");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromHMMediaPlaybackState(*(_QWORD *)(a1 + 56));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromHMMediaPlaybackState(*(_QWORD *)(a1 + 64));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "transactionNumber");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138413058;
      v21 = v10;
      v22 = 2112;
      v23 = v11;
      v24 = 2112;
      v25 = v12;
      v26 = 2112;
      v27 = v13;
      _os_log_impl(&dword_1DD34E000, v9, OS_LOG_TYPE_DEFAULT, "--> Failed media write transaction for session %@: %@ -> %@  (Transaction ID %@)", (uint8_t *)&v20, 0x2Au);

    }
    objc_msgSend(v8, "_updateCachedPlaybackStateWriteError:operationType:notifyDelegates:", v5, CFSTR("HFMediaValueManager.writePlaybackState"), 1);
  }
  else
  {
    objc_msgSend(WeakRetained, "clearCachedPlaybackStateWriteErrorWithReason:notifyDelegates:", CFSTR("Successfully changed playback state"), 0);
    objc_msgSend(v8, "_updateLastPlaybackState:sender:notifyWillUpdate:notifyDidUpdate:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), 0, 1);
  }
  HFLogForCategory(0x39uLL);
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v8, "mediaProfileContainer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromHMMediaPlaybackState(*(_QWORD *)(a1 + 56));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromHMMediaPlaybackState(*(_QWORD *)(a1 + 64));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "transactionNumber");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 138413058;
    v21 = v15;
    v22 = 2112;
    v23 = v16;
    v24 = 2112;
    v25 = v17;
    v26 = 2112;
    v27 = v18;
    _os_log_impl(&dword_1DD34E000, v14, OS_LOG_TYPE_DEFAULT, "--> Finished media write transaction for session %@: %@ -> %@  (Transaction ID %@)", (uint8_t *)&v20, 0x2Au);

  }
  objc_msgSend(v8, "transactionStack");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "removeObject:", *(_QWORD *)(a1 + 32));

  objc_msgSend(*(id *)(a1 + 40), "finishWithResult:error:", v6, v5);
}

- (id)cachedPlaybackStateWriteErrorForRouteID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;

  if (a3)
  {
    v4 = a3;
    -[HFMediaValueManager mediaProfileContainer](self, "mediaProfileContainer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "hf_mediaRouteIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqualToString:", v4);

    if (v7)
    {
      -[HFMediaValueManager cachedPlaybackStateWriteError](self, "cachedPlaybackStateWriteError");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (id)mediaProfileContainerForRouteID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  id v8;

  if (a3)
  {
    v4 = a3;
    -[HFMediaValueManager mediaProfileContainer](self, "mediaProfileContainer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "hf_mediaRouteIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqualToString:", v4);

    if (v7)
      v8 = v5;
    else
      v8 = 0;

  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (void)clearCachedPlaybackStateWriteErrorWithReason:(id)a3 notifyDelegates:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  NSObject *v7;
  void *v8;
  NSError *cachedPlaybackStateWriteError;
  void *v10;
  void *v11;
  int64_t v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v4 = a4;
  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (self->_cachedPlaybackStateWriteError)
  {
    HFLogForCategory(0x39uLL);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      -[HFMediaValueManager mediaProfileContainer](self, "mediaProfileContainer");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138412546;
      v16 = v8;
      v17 = 2112;
      v18 = v6;
      _os_log_impl(&dword_1DD34E000, v7, OS_LOG_TYPE_DEFAULT, "Clearing cachedPlaybackStateWriteError for profile '%@'; Reason: '%@'",
        (uint8_t *)&v15,
        0x16u);

    }
    cachedPlaybackStateWriteError = self->_cachedPlaybackStateWriteError;
    self->_cachedPlaybackStateWriteError = 0;

    if (v4)
    {
      -[HFMediaValueManager mediaProfileContainer](self, "mediaProfileContainer");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "hf_mediaRouteIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = -[HFMediaValueManager lastPlaybackStateForProfileForRouteID:](self, "lastPlaybackStateForProfileForRouteID:", v11);

      -[HFMediaValueManager mediaProfileContainer](self, "mediaProfileContainer");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "mediaSession");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[HFMediaValueManager _notifyDelegatesDidUpdatePlaybackState:mediaSession:](self, "_notifyDelegatesDidUpdatePlaybackState:mediaSession:", v12, v14);

    }
  }

}

- (void)mediaSession:(id)a3 didUpdatePlaybackState:(int64_t)a4
{
  id v7;
  void *v8;
  void *v9;
  int v10;

  v7 = a3;
  -[HFMediaValueManager mediaProfileContainer](self, "mediaProfileContainer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "mediaSession");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v7, "isEqual:", v9);

  if (v10)
  {
    -[HFMediaValueManager _updateLastPlaybackState:sender:notifyWillUpdate:notifyDidUpdate:](self, "_updateLastPlaybackState:sender:notifyWillUpdate:notifyDidUpdate:", a4, a2, 0, 0);
    -[HFMediaValueManager clearCachedPlaybackStateWriteErrorWithReason:notifyDelegates:](self, "clearCachedPlaybackStateWriteErrorWithReason:notifyDelegates:", CFSTR("Playback State update"), 1);
  }
}

- (void)mediaObject:(id)a3 didUpdateMediaSession:(id)a4
{
  void *v6;
  int v7;
  void *v8;
  id v9;

  v9 = a3;
  -[HFMediaValueManager mediaProfileContainer](self, "mediaProfileContainer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v9, "isEqual:", v6);

  if (v7)
  {
    objc_msgSend(v9, "mediaSession");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFMediaValueManager _updateLastPlaybackState:sender:notifyWillUpdate:notifyDidUpdate:](self, "_updateLastPlaybackState:sender:notifyWillUpdate:notifyDidUpdate:", objc_msgSend(v8, "playbackState"), a2, 0, 0);

    -[HFMediaValueManager clearCachedPlaybackStateWriteErrorWithReason:notifyDelegates:](self, "clearCachedPlaybackStateWriteErrorWithReason:notifyDelegates:", CFSTR("Media Session update"), 1);
  }

}

- (void)_updateCachedPlaybackStateWriteError:(id)a3 operationType:(id)a4 notifyDelegates:(BOOL)a5
{
  _BOOL4 v5;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v5 = a5;
  v13 = a3;
  objc_storeStrong((id *)&self->_cachedPlaybackStateWriteError, a3);
  v9 = a4;
  +[HFErrorHandler sharedHandler](HFErrorHandler, "sharedHandler");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "logError:operationDescription:", v13, v9);

  if (v5)
  {
    -[HFMediaValueManager mediaProfileContainer](self, "mediaProfileContainer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "mediaSession");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFMediaValueManager _notifyDelegatesFailedToUpdatePlaybackStateWithError:mediaSession:](self, "_notifyDelegatesFailedToUpdatePlaybackStateWithError:mediaSession:", v13, v12);

  }
}

- (void)_updateLastPlaybackState:(int64_t)a3 sender:(SEL)a4 notifyWillUpdate:(BOOL)a5 notifyDidUpdate:(BOOL)a6
{
  _BOOL4 v6;
  _BOOL4 v7;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v6 = a6;
  v7 = a5;
  v23 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  if (!-[HFMediaValueManager hasPendingWrites](self, "hasPendingWrites"))
  {
    -[HFMediaValueManager mediaProfileContainer](self, "mediaProfileContainer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "mediaSession");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
      -[HFMediaValueManager _notifyDelegatesWillUpdatePlaybackState:mediaSession:](self, "_notifyDelegatesWillUpdatePlaybackState:mediaSession:", a3, v12);
    HFLogForCategory(0x39uLL);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      -[HFMediaValueManager mediaProfileContainer](self, "mediaProfileContainer");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromHMMediaPlaybackState(a3);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a4);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138412802;
      v18 = v14;
      v19 = 2112;
      v20 = v15;
      v21 = 2112;
      v22 = v16;
      _os_log_impl(&dword_1DD34E000, v13, OS_LOG_TYPE_DEFAULT, "--> Updating last playback state for profile %@ --> %@ (Update sent from %@)", (uint8_t *)&v17, 0x20u);

    }
    if (v6)
      -[HFMediaValueManager _notifyDelegatesDidUpdatePlaybackState:mediaSession:](self, "_notifyDelegatesDidUpdatePlaybackState:mediaSession:", a3, v12);

  }
}

- (void)_notifyDelegatesDidUpdatePlaybackState:(int64_t)a3 mediaSession:(id)a4
{
  id v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  int64_t v11;

  v6 = a4;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  +[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __75__HFMediaValueManager__notifyDelegatesDidUpdatePlaybackState_mediaSession___block_invoke;
  v9[3] = &unk_1EA72FCD8;
  v10 = v6;
  v11 = a3;
  v8 = v6;
  objc_msgSend(v7, "dispatchMediaSessionObserverMessage:sender:", v9, self);

}

void __75__HFMediaValueManager__notifyDelegatesDidUpdatePlaybackState_mediaSession___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "mediaSession:didUpdatePlaybackState:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)_notifyDelegatesWillUpdatePlaybackState:(int64_t)a3 mediaSession:(id)a4
{
  id v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  int64_t v11;

  v6 = a4;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  +[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __76__HFMediaValueManager__notifyDelegatesWillUpdatePlaybackState_mediaSession___block_invoke;
  v9[3] = &unk_1EA72FCD8;
  v10 = v6;
  v11 = a3;
  v8 = v6;
  objc_msgSend(v7, "dispatchMediaSessionObserverMessage:sender:", v9, self);

}

void __76__HFMediaValueManager__notifyDelegatesWillUpdatePlaybackState_mediaSession___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "mediaSession:willUpdatePlaybackState:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)_notifyDelegatesFailedToUpdatePlaybackStateWithError:(id)a3 mediaSession:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  +[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __89__HFMediaValueManager__notifyDelegatesFailedToUpdatePlaybackStateWithError_mediaSession___block_invoke;
  v11[3] = &unk_1EA72FD00;
  v12 = v7;
  v13 = v6;
  v9 = v6;
  v10 = v7;
  objc_msgSend(v8, "dispatchMediaSessionObserverMessage:sender:", v11, self);

}

void __89__HFMediaValueManager__notifyDelegatesFailedToUpdatePlaybackStateWithError_mediaSession___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "mediaSession:failedToUpdatePlaybackStateWithError:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (HFMediaProfileContainer)mediaProfileContainer
{
  return (HFMediaProfileContainer *)objc_loadWeakRetained((id *)&self->_mediaProfileContainer);
}

- (BOOL)hasPendingWrites
{
  return self->_hasPendingWrites;
}

- (NSMutableArray)transactionStack
{
  return self->_transactionStack;
}

- (void)setTransactionStack:(id)a3
{
  objc_storeStrong((id *)&self->_transactionStack, a3);
}

- (NSError)cachedPlaybackStateWriteError
{
  return self->_cachedPlaybackStateWriteError;
}

- (void)setCachedPlaybackStateWriteError:(id)a3
{
  objc_storeStrong((id *)&self->_cachedPlaybackStateWriteError, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedPlaybackStateWriteError, 0);
  objc_storeStrong((id *)&self->_transactionStack, 0);
  objc_destroyWeak((id *)&self->_mediaProfileContainer);
}

@end
