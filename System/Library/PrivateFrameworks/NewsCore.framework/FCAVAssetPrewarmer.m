@implementation FCAVAssetPrewarmer

- (FCAVAssetPrewarmer)init
{
  FCAVAssetPrewarmer *v2;
  FCKeyedOperationQueue *v3;
  FCKeyedOperationQueue *prefetchQueue;
  NSCountedSet *v5;
  NSCountedSet *interestedAssets;
  NSMutableDictionary *v7;
  NSMutableDictionary *interestModificationDates;
  NSMutableDictionary *v9;
  NSMutableDictionary *interestTokensByAsset;
  void *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)FCAVAssetPrewarmer;
  v2 = -[FCAVAssetPrewarmer init](&v13, sel_init);
  if (v2)
  {
    v3 = -[FCKeyedOperationQueue initWithDelegate:maxConcurrentOperationCount:]([FCKeyedOperationQueue alloc], "initWithDelegate:maxConcurrentOperationCount:", v2, 1);
    prefetchQueue = v2->_prefetchQueue;
    v2->_prefetchQueue = v3;

    -[FCKeyedOperationQueue setExecutionQueue:](v2->_prefetchQueue, "setExecutionQueue:", MEMORY[0x1E0C80D38]);
    v5 = (NSCountedSet *)objc_alloc_init(MEMORY[0x1E0CB3550]);
    interestedAssets = v2->_interestedAssets;
    v2->_interestedAssets = v5;

    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    interestModificationDates = v2->_interestModificationDates;
    v2->_interestModificationDates = v7;

    v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    interestTokensByAsset = v2->_interestTokensByAsset;
    v2->_interestTokensByAsset = v9;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObserver:selector:name:object:", v2, sel__revisitSuspendedState, *MEMORY[0x1E0CB3048], 0);

    -[FCAVAssetPrewarmer _revisitSuspendedState](v2, "_revisitSuspendedState");
  }
  return v2;
}

- (void)_revisitSuspendedState
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __44__FCAVAssetPrewarmer__revisitSuspendedState__block_invoke;
  v2[3] = &unk_1E463AB18;
  v2[4] = self;
  FCPerformBlockOnMainThread(v2);
}

void __44__FCAVAssetPrewarmer__revisitSuspendedState__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isLowPowerModeEnabled"))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setSuspended:", 1);
  }
  else
  {
    +[FCNetworkReachability sharedNetworkReachability](FCNetworkReachability, "sharedNetworkReachability");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setSuspended:", objc_msgSend(v2, "isLowDataModeEnabled"));

  }
}

- (void)addInterestInAsset:(id)a3
{
  id v4;
  NSCountedSet *interestedAssets;
  uint64_t v6;
  NSMutableDictionary *interestModificationDates;
  void *v8;
  NSMutableDictionary *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
  if (self)
    interestedAssets = self->_interestedAssets;
  else
    interestedAssets = 0;
  v6 = -[NSCountedSet countForObject:](interestedAssets, "countForObject:", v4);
  if (self)
  {
    -[NSCountedSet addObject:](self->_interestedAssets, "addObject:", v4);
    interestModificationDates = self->_interestModificationDates;
  }
  else
  {
    objc_msgSend(0, "addObject:", v4);
    interestModificationDates = 0;
  }
  v8 = (void *)MEMORY[0x1E0C99D68];
  v9 = interestModificationDates;
  objc_msgSend(v8, "date");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](v9, "setObject:forKey:", v10, v4);

  if (!v6)
  {
    v11 = (void *)FCAVAssetLog;
    if (os_log_type_enabled((os_log_t)FCAVAssetLog, OS_LOG_TYPE_DEFAULT))
    {
      v12 = v11;
      objc_msgSend(v4, "identifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543362;
      v15 = v13;
      _os_log_impl(&dword_1A1B90000, v12, OS_LOG_TYPE_DEFAULT, "added prewarm interest in AV asset %{public}@", (uint8_t *)&v14, 0xCu);

    }
    -[FCAVAssetPrewarmer _didChangeInterestedAssets]((uint64_t)self);
  }

}

- (void)_didChangeInterestedAssets
{
  uint64_t v2;
  void *v3;

  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
    if (!*(_QWORD *)(a1 + 56))
    {
      objc_msgSend(MEMORY[0x1E0C99E88], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", a1, sel__reprocessInterestedAssets, 0, 0, 0.01);
      v2 = objc_claimAutoreleasedReturnValue();
      v3 = *(void **)(a1 + 56);
      *(_QWORD *)(a1 + 56) = v2;

    }
  }
}

- (void)removeInterestInAsset:(id)a3
{
  id v4;
  NSCountedSet *interestedAssets;
  uint64_t v6;
  NSMutableDictionary *interestModificationDates;
  void *v8;
  NSMutableDictionary *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
  if (self)
    interestedAssets = self->_interestedAssets;
  else
    interestedAssets = 0;
  v6 = -[NSCountedSet countForObject:](interestedAssets, "countForObject:", v4);
  if (self)
  {
    -[NSCountedSet removeObject:](self->_interestedAssets, "removeObject:", v4);
    interestModificationDates = self->_interestModificationDates;
  }
  else
  {
    objc_msgSend(0, "removeObject:", v4);
    interestModificationDates = 0;
  }
  v8 = (void *)MEMORY[0x1E0C99D68];
  v9 = interestModificationDates;
  objc_msgSend(v8, "date");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](v9, "setObject:forKey:", v10, v4);

  if (v6 == 1)
  {
    v11 = (void *)FCAVAssetLog;
    if (os_log_type_enabled((os_log_t)FCAVAssetLog, OS_LOG_TYPE_DEFAULT))
    {
      v12 = v11;
      objc_msgSend(v4, "identifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543362;
      v15 = v13;
      _os_log_impl(&dword_1A1B90000, v12, OS_LOG_TYPE_DEFAULT, "removed prewarm interest in AV asset %{public}@", (uint8_t *)&v14, 0xCu);

    }
    -[FCAVAssetPrewarmer _didChangeInterestedAssets]((uint64_t)self);
  }

}

- (id)keyedOperationQueue:(id)a3 performAsyncOperationForKey:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  FCOnce *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  FCOnce *v14;
  id v15;
  id *v16;
  _QWORD *v17;
  id WeakRetained;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  int v23;
  id v24;
  id v25;
  id v26;
  id v27;
  FCOnce *v28;
  void *v29;
  _QWORD v31[4];
  FCOnce *v32;
  id v33;
  _QWORD v34[2];
  void (*v35)(uint64_t, void *);
  void *v36;
  id v37;
  FCAVAssetPrewarmer *v38;
  FCOnce *v39;
  id v40;
  __int128 buf;
  void (*v42)(uint64_t, uint64_t, void *, uint64_t);
  void *v43;
  id *v44;
  _QWORD *v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a5;
  objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
  v9 = -[FCOnce initWithOptions:]([FCOnce alloc], "initWithOptions:", 1);
  v10 = (void *)FCAVAssetLog;
  if (os_log_type_enabled((os_log_t)FCAVAssetLog, OS_LOG_TYPE_DEFAULT))
  {
    v11 = v10;
    objc_msgSend(v7, "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138543362;
    *(_QWORD *)((char *)&buf + 4) = v12;
    _os_log_impl(&dword_1A1B90000, v11, OS_LOG_TYPE_DEFAULT, "will prewarm AV asset %{public}@", (uint8_t *)&buf, 0xCu);

  }
  v13 = MEMORY[0x1E0C809B0];
  v34[0] = MEMORY[0x1E0C809B0];
  v34[1] = 3221225472;
  v35 = __81__FCAVAssetPrewarmer_keyedOperationQueue_performAsyncOperationForKey_completion___block_invoke;
  v36 = &unk_1E4643F78;
  v37 = v7;
  v38 = self;
  v14 = v9;
  v39 = v14;
  v15 = v8;
  v40 = v15;
  v16 = (id *)v7;
  v17 = v34;
  if (self)
  {
    if (v16)
      WeakRetained = objc_loadWeakRetained(v16 + 5);
    else
      WeakRetained = 0;
    objc_msgSend(v16, "identifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "interestTokenForAssetIdentifier:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
      v21 = objc_loadWeakRetained(v16 + 5);
    else
      v21 = 0;
    objc_msgSend(v16, "identifier");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v21, "containsAssetWithIdentifier:", v22);

    if (v23)
    {
      ((void (*)(_QWORD *, void *, _QWORD))v35)(v17, v20, 0);
    }
    else
    {
      if (v16)
      {
        v24 = objc_loadWeakRetained(v16 + 7);
        v25 = v16[9];
      }
      else
      {
        v24 = 0;
        v25 = 0;
      }
      v26 = v25;
      *(_QWORD *)&buf = v13;
      *((_QWORD *)&buf + 1) = 3221225472;
      v42 = __54__FCAVAssetPrewarmer__prewarmAsset_completionHandler___block_invoke_2;
      v43 = &unk_1E4643FA0;
      v45 = v17;
      v44 = v16;
      objc_msgSend(v24, "prefetchMasterPlaylistForAssetURL:completionHandler:", v26, &buf);

    }
  }

  v31[0] = v13;
  v31[1] = 3221225472;
  v31[2] = __81__FCAVAssetPrewarmer_keyedOperationQueue_performAsyncOperationForKey_completion___block_invoke_2_12;
  v31[3] = &unk_1E463B790;
  v32 = v14;
  v33 = v15;
  v27 = v15;
  v28 = v14;
  +[FCCancelHandler cancelHandlerWithBlock:](FCCancelHandler, "cancelHandlerWithBlock:", v31);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  return v29;
}

void __81__FCAVAssetPrewarmer_keyedOperationQueue_performAsyncOperationForKey_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  id v13;

  v3 = a2;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __81__FCAVAssetPrewarmer_keyedOperationQueue_performAsyncOperationForKey_completion___block_invoke_2;
  v8[3] = &unk_1E4643F50;
  v9 = v3;
  v4 = *(id *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v6 = *(void **)(a1 + 48);
  v10 = v4;
  v11 = v5;
  v12 = v6;
  v13 = *(id *)(a1 + 56);
  v7 = v3;
  FCPerformBlockOnMainThread(v8);

}

void __81__FCAVAssetPrewarmer_keyedOperationQueue_performAsyncOperationForKey_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  _BOOL4 v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  id v12;
  unint64_t v13;
  unint64_t v14;
  NSObject *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  uint64_t v21;
  id v22;
  unint64_t v23;
  unint64_t v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  _QWORD v30[4];
  id v31;
  _QWORD v32[5];
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint8_t buf[4];
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = (void *)FCAVAssetLog;
  v4 = os_log_type_enabled((os_log_t)FCAVAssetLog, OS_LOG_TYPE_DEFAULT);
  v5 = MEMORY[0x1E0C809B0];
  if (v2)
  {
    if (v4)
    {
      v6 = *(void **)(a1 + 40);
      v7 = v3;
      objc_msgSend(v6, "identifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v38 = v8;
      _os_log_impl(&dword_1A1B90000, v7, OS_LOG_TYPE_DEFAULT, "successfully prewarmed AV asset %{public}@", buf, 0xCu);

    }
    v9 = *(_QWORD *)(a1 + 48);
    if (v9)
      v10 = *(void **)(v9 + 40);
    else
      v10 = 0;
    objc_msgSend(v10, "setObject:forKey:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
    v11 = *(_QWORD *)(a1 + 48);
    if (v11)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
      v12 = *(id *)(v11 + 40);
      v13 = objc_msgSend(v12, "count");
      v14 = *(_QWORD *)(v11 + 48);

      if (v13 > v14)
      {
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v15 = objc_claimAutoreleasedReturnValue();
        v35 = 0u;
        v36 = 0u;
        v33 = 0u;
        v34 = 0u;
        v16 = *(id *)(v11 + 40);
        v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v33, buf, 16);
        if (v17)
        {
          v18 = v17;
          v19 = *(_QWORD *)v34;
          do
          {
            for (i = 0; i != v18; ++i)
            {
              if (*(_QWORD *)v34 != v19)
                objc_enumerationMutation(v16);
              v21 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * i);
              if (!objc_msgSend(*(id *)(v11 + 24), "countForObject:", v21))
                -[NSObject addObject:](v15, "addObject:", v21);
            }
            v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v33, buf, 16);
          }
          while (v18);
        }

        v32[0] = v5;
        v32[1] = 3221225472;
        v32[2] = __36__FCAVAssetPrewarmer__flushIfNeeded__block_invoke;
        v32[3] = &unk_1E4643FC8;
        v32[4] = v11;
        -[NSObject sortUsingComparator:](v15, "sortUsingComparator:", v32);
        while (-[NSObject count](v15, "count"))
        {
          v22 = *(id *)(v11 + 40);
          v23 = objc_msgSend(v22, "count");
          v24 = *(_QWORD *)(v11 + 48);

          if (v23 <= v24)
            break;
          v25 = *(id *)(v11 + 40);
          -[NSObject firstObject](v15, "firstObject");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "removeObjectForKey:", v26);

          -[NSObject fc_removeFirstObject](v15, "fc_removeFirstObject");
        }
        goto LABEL_23;
      }
    }
  }
  else if (v4)
  {
    v27 = *(void **)(a1 + 40);
    v15 = v3;
    objc_msgSend(v27, "identifier");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v38 = v28;
    _os_log_impl(&dword_1A1B90000, v15, OS_LOG_TYPE_DEFAULT, "failed to prewarm AV asset %{public}@", buf, 0xCu);

LABEL_23:
  }
  v30[0] = v5;
  v30[1] = 3221225472;
  v30[2] = __81__FCAVAssetPrewarmer_keyedOperationQueue_performAsyncOperationForKey_completion___block_invoke_9;
  v30[3] = &unk_1E463B598;
  v29 = *(void **)(a1 + 56);
  v31 = *(id *)(a1 + 64);
  objc_msgSend(v29, "executeOnce:", v30);

}

uint64_t __81__FCAVAssetPrewarmer_keyedOperationQueue_performAsyncOperationForKey_completion___block_invoke_9(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __81__FCAVAssetPrewarmer_keyedOperationQueue_performAsyncOperationForKey_completion___block_invoke_2_12(uint64_t a1)
{
  void *v1;
  _QWORD v2[4];
  id v3;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __81__FCAVAssetPrewarmer_keyedOperationQueue_performAsyncOperationForKey_completion___block_invoke_3;
  v2[3] = &unk_1E463B598;
  v1 = *(void **)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  objc_msgSend(v1, "executeOnce:", v2);

}

uint64_t __81__FCAVAssetPrewarmer_keyedOperationQueue_performAsyncOperationForKey_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __54__FCAVAssetPrewarmer__prewarmAsset_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  id v7;
  void (**v8)(id, _QWORD, uint64_t);
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  id WeakRetained;
  void (**v14)(id, id, _QWORD);
  _QWORD v15[4];
  id v16;
  void (**v17)(id, id, _QWORD);

  v7 = a3;
  if (a4)
  {
    v8 = (void (**)(id, _QWORD, uint64_t))*(id *)(a1 + 40);
    v8[2](v8, 0, a4);
  }
  else
  {
    if (a2)
      v9 = *(void **)(a2 + 40);
    else
      v9 = 0;
    v10 = v9;
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("com.apple.hls.keys"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    FCKeyIdentifiersFromHLSMetadata(v11);
    v8 = (void (**)(id, _QWORD, uint64_t))objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v8, "count"))
    {
      v12 = *(_QWORD *)(a1 + 32);
      if (v12)
        WeakRetained = objc_loadWeakRetained((id *)(v12 + 64));
      else
        WeakRetained = 0;
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __54__FCAVAssetPrewarmer__prewarmAsset_completionHandler___block_invoke_5;
      v15[3] = &unk_1E463D3F8;
      v17 = (void (**)(id, id, _QWORD))*(id *)(a1 + 40);
      v16 = v7;
      objc_msgSend(WeakRetained, "fetchKeysWithIdentifiers:completionHandler:", v8, v15);

      v14 = v17;
    }
    else
    {
      v14 = (void (**)(id, id, _QWORD))*(id *)(a1 + 40);
      v14[2](v14, v7, 0);
    }

  }
}

uint64_t __54__FCAVAssetPrewarmer__prewarmAsset_completionHandler___block_invoke_5(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), a2);
}

- (void)_reprocessInterestedAssets
{
  unint64_t highWaterMark;
  unint64_t v4;
  unint64_t v5;
  NSCountedSet *interestedAssets;
  void *v7;
  NSCountedSet *v8;
  void *v9;
  void *v10;

  objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
  if (self)
  {
    highWaterMark = self->_highWaterMark;
    v4 = -[NSCountedSet count](self->_interestedAssets, "count");
    if (highWaterMark <= v4)
      v5 = v4;
    else
      v5 = highWaterMark;
    self->_highWaterMark = v5;
    interestedAssets = self->_interestedAssets;
  }
  else
  {
    objc_msgSend(0, "count");
    interestedAssets = 0;
  }
  v7 = (void *)MEMORY[0x1E0C99E40];
  v8 = interestedAssets;
  -[NSCountedSet allObjects](v8, "allObjects");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "orderedSetWithArray:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (self)
  {
    -[FCKeyedOperationQueue setKeyQueue:](self->_prefetchQueue, "setKeyQueue:", v10);

    -[NSTimer invalidate](self->_reprocessTimer, "invalidate");
    objc_storeStrong((id *)&self->_reprocessTimer, 0);
  }
  else
  {
    objc_msgSend(0, "setKeyQueue:", v10);

    objc_msgSend(0, "invalidate");
  }
}

uint64_t __36__FCAVAssetPrewarmer__flushIfNeeded__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  _QWORD *v6;
  _QWORD *v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;

  v6 = *(_QWORD **)(a1 + 32);
  if (v6)
    v6 = (_QWORD *)v6[4];
  v7 = v6;
  v8 = a3;
  objc_msgSend(v7, "objectForKey:", a2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *(_QWORD *)(a1 + 32);
  if (v10)
    v11 = *(void **)(v10 + 32);
  else
    v11 = 0;
  objc_msgSend(v11, "objectForKey:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_msgSend(v9, "compare:", v12);
  return v13;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reprocessTimer, 0);
  objc_storeStrong((id *)&self->_interestTokensByAsset, 0);
  objc_storeStrong((id *)&self->_interestModificationDates, 0);
  objc_storeStrong((id *)&self->_interestedAssets, 0);
  objc_storeStrong((id *)&self->_prefetchQueue, 0);
  objc_storeStrong((id *)&self->_assetResourceLoader, 0);
}

@end
