@implementation MUAMSResultProvider

- (MUAMSResultProvider)initWithCache:(id)a3
{
  id v5;
  MUAMSResultProvider *v6;
  MUAMSResultProvider *v7;
  uint64_t v8;
  OS_dispatch_queue *queue;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MUAMSResultProvider;
  v6 = -[MUAMSResultProvider init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_amsResultCache, a3);
    geo_dispatch_queue_create_with_qos();
    v8 = objc_claimAutoreleasedReturnValue();
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v8;

  }
  return v7;
}

- (void)fetchResultsForAdamIds:(id)a3 options:(id)a4 callbackQueue:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *queue;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id location;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  objc_initWeak(&location, self);
  queue = self->_queue;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __79__MUAMSResultProvider_fetchResultsForAdamIds_options_callbackQueue_completion___block_invoke;
  v19[3] = &unk_1E2E04348;
  objc_copyWeak(&v24, &location);
  v20 = v10;
  v21 = v12;
  v22 = v11;
  v23 = v13;
  v15 = v11;
  v16 = v13;
  v17 = v12;
  v18 = v10;
  dispatch_async(queue, v19);

  objc_destroyWeak(&v24);
  objc_destroyWeak(&location);
}

void __79__MUAMSResultProvider_fetchResultsForAdamIds_options_callbackQueue_completion___block_invoke(id *a1)
{
  id *v2;
  id *WeakRetained;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  _BOOL4 v14;
  id v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  uint64_t v24;
  id v25;
  void *v26;
  id *from;
  _QWORD v28[5];
  id v29;
  id v30;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint8_t buf[4];
  id v37;
  __int16 v38;
  id v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v2 = a1 + 8;
  WeakRetained = (id *)objc_loadWeakRetained(a1 + 8);
  if (WeakRetained)
  {
    from = v2;
    v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v6 = a1[4];
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v33;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v33 != v8)
            objc_enumerationMutation(v6);
          v10 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * i);
          objc_msgSend(WeakRetained[1], "amsResultForAdamId:", v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (v11)
            objc_msgSend(v5, "addObject:", v11);
          else
            objc_msgSend(v4, "addObject:", v10);

        }
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
      }
      while (v7);
    }

    v12 = objc_msgSend(v4, "count");
    MUGetMUAMSResultProviderLog();
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = os_log_type_enabled(v13, OS_LOG_TYPE_INFO);
    if (v12)
    {
      if (v14)
      {
        v15 = a1[4];
        *(_DWORD *)buf = 138412546;
        v37 = v4;
        v38 = 2112;
        v39 = v15;
        _os_log_impl(&dword_191DB8000, v13, OS_LOG_TYPE_INFO, "These adam ids are not present %@. Requesting the service for adam ids %@.", buf, 0x16u);
      }

      objc_msgSend(MEMORY[0x1E0CC1760], "sharedInstance");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (void *)objc_msgSend(a1[4], "copy");
      objc_msgSend(a1[6], "artworkSize");
      v19 = v18;
      v21 = v20;
      objc_msgSend(a1[6], "displayScale");
      v23 = v22;
      v24 = objc_msgSend(a1[6], "source");
      v28[0] = MEMORY[0x1E0C809B0];
      v28[1] = 3221225472;
      v28[2] = __79__MUAMSResultProvider_fetchResultsForAdamIds_options_callbackQueue_completion___block_invoke_47;
      v28[3] = &unk_1E2E04320;
      objc_copyWeak(&v31, from);
      v28[4] = WeakRetained;
      v29 = a1[5];
      v30 = a1[7];
      objc_msgSend(v16, "appleMediaServicesResultsWithIdentifiers:artworkSize:screenScale:type:source:completion:", v17, 1, v24, v28, v19, v21, v23);

      objc_destroyWeak(&v31);
    }
    else
    {
      if (v14)
      {
        v25 = a1[4];
        *(_DWORD *)buf = 138412290;
        v37 = v25;
        _os_log_impl(&dword_191DB8000, v13, OS_LOG_TYPE_INFO, "There is a cache hit for all requested adam ids %@.  Early return.", buf, 0xCu);
      }

      v26 = (void *)objc_msgSend(v5, "copy");
      objc_msgSend(WeakRetained, "_finishWithResults:error:onCallbackQueue:completion:", v26, 0, a1[5], a1[7]);

    }
  }

}

void __79__MUAMSResultProvider_fetchResultsForAdamIds_options_callbackQueue_completion___block_invoke_47(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject **WeakRetained;
  NSObject **v8;
  NSObject *v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  id v13;
  NSObject **v14;
  uint64_t v15;
  id v16;
  id v17;

  v5 = a2;
  v6 = a3;
  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 56));
  v8 = WeakRetained;
  if (WeakRetained)
  {
    v9 = WeakRetained[2];
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __79__MUAMSResultProvider_fetchResultsForAdamIds_options_callbackQueue_completion___block_invoke_2;
    v11[3] = &unk_1E2E042F8;
    v12 = v6;
    v13 = v5;
    v14 = v8;
    v10 = *(void **)(a1 + 40);
    v15 = *(_QWORD *)(a1 + 32);
    v16 = v10;
    v17 = *(id *)(a1 + 48);
    dispatch_async(v9, v11);

  }
}

void __79__MUAMSResultProvider_fetchResultsForAdamIds_options_callbackQueue_completion___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t v20[128];
  uint8_t buf[4];
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 32))
  {
    MUGetMUAMSResultProviderLog();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      v3 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      v22 = v3;
      _os_log_impl(&dword_191DB8000, v2, OS_LOG_TYPE_ERROR, "Error with fetching adam ids %@", buf, 0xCu);
    }

  }
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v4 = *(id *)(a1 + 40);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v17 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        MUGetMUAMSResultProviderLog();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v9, "identifier");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v22 = v11;
          _os_log_impl(&dword_191DB8000, v10, OS_LOG_TYPE_INFO, "Updating cache with adam id %@", buf, 0xCu);

        }
        v12 = *(void **)(*(_QWORD *)(a1 + 48) + 8);
        objc_msgSend(v9, "identifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setAMSResult:forAdamId:", v9, v13);

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v6);
  }

  v14 = *(void **)(a1 + 56);
  v15 = (void *)objc_msgSend(*(id *)(a1 + 40), "copy");
  objc_msgSend(v14, "_finishWithResults:error:onCallbackQueue:completion:", v15, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72));

}

- (void)fetchResultsForBundleIds:(id)a3 options:(id)a4 callbackQueue:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *queue;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id location;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  objc_initWeak(&location, self);
  queue = self->_queue;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __81__MUAMSResultProvider_fetchResultsForBundleIds_options_callbackQueue_completion___block_invoke;
  v19[3] = &unk_1E2E04348;
  objc_copyWeak(&v24, &location);
  v20 = v10;
  v21 = v12;
  v22 = v11;
  v23 = v13;
  v15 = v11;
  v16 = v13;
  v17 = v12;
  v18 = v10;
  dispatch_async(queue, v19);

  objc_destroyWeak(&v24);
  objc_destroyWeak(&location);
}

void __81__MUAMSResultProvider_fetchResultsForBundleIds_options_callbackQueue_completion___block_invoke(id *a1)
{
  id *v2;
  id *WeakRetained;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  _BOOL4 v14;
  id v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  uint64_t v24;
  id v25;
  void *v26;
  id *from;
  _QWORD v28[4];
  id v29;
  id v30;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint8_t buf[4];
  id v37;
  __int16 v38;
  id v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v2 = a1 + 8;
  WeakRetained = (id *)objc_loadWeakRetained(a1 + 8);
  if (WeakRetained)
  {
    from = v2;
    v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v6 = a1[4];
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v33;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v33 != v8)
            objc_enumerationMutation(v6);
          v10 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * i);
          objc_msgSend(WeakRetained[1], "amsResultForBundleId:", v10, from);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (v11)
            objc_msgSend(v5, "addObject:", v11);
          else
            objc_msgSend(v4, "addObject:", v10);

        }
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
      }
      while (v7);
    }

    v12 = objc_msgSend(v4, "count");
    MUGetMUAMSResultProviderLog();
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = os_log_type_enabled(v13, OS_LOG_TYPE_INFO);
    if (v12)
    {
      if (v14)
      {
        v15 = a1[4];
        *(_DWORD *)buf = 138412546;
        v37 = v4;
        v38 = 2112;
        v39 = v15;
        _os_log_impl(&dword_191DB8000, v13, OS_LOG_TYPE_INFO, "These bundle ids are not present %@. Requesting the service for bundle ids %@.", buf, 0x16u);
      }

      objc_msgSend(MEMORY[0x1E0CC1760], "sharedInstance");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (void *)objc_msgSend(a1[4], "copy");
      objc_msgSend(a1[6], "artworkSize");
      v19 = v18;
      v21 = v20;
      objc_msgSend(a1[6], "displayScale");
      v23 = v22;
      v24 = objc_msgSend(a1[6], "source");
      v28[0] = MEMORY[0x1E0C809B0];
      v28[1] = 3221225472;
      v28[2] = __81__MUAMSResultProvider_fetchResultsForBundleIds_options_callbackQueue_completion___block_invoke_50;
      v28[3] = &unk_1E2E04398;
      objc_copyWeak(&v31, from);
      v29 = a1[5];
      v30 = a1[7];
      objc_msgSend(v16, "appleMediaServicesResultsWithBundleIdentifiers:artworkSize:screenScale:source:completion:", v17, v24, v28, v19, v21, v23);

      objc_destroyWeak(&v31);
    }
    else
    {
      if (v14)
      {
        v25 = a1[4];
        *(_DWORD *)buf = 138412290;
        v37 = v25;
        _os_log_impl(&dword_191DB8000, v13, OS_LOG_TYPE_INFO, "There is a cache hit for all requested bundle ids %@.  Early return.", buf, 0xCu);
      }

      v26 = (void *)objc_msgSend(v5, "copy");
      objc_msgSend(WeakRetained, "_finishWithResults:error:onCallbackQueue:completion:", v26, 0, a1[5], a1[7]);

    }
  }

}

void __81__MUAMSResultProvider_fetchResultsForBundleIds_options_callbackQueue_completion___block_invoke_50(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject **WeakRetained;
  NSObject **v8;
  NSObject *v9;
  _QWORD block[4];
  id v11;
  id v12;
  NSObject **v13;
  id v14;
  id v15;

  v5 = a2;
  v6 = a3;
  WeakRetained = (NSObject **)objc_loadWeakRetained(a1 + 6);
  v8 = WeakRetained;
  if (WeakRetained)
  {
    v9 = WeakRetained[2];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __81__MUAMSResultProvider_fetchResultsForBundleIds_options_callbackQueue_completion___block_invoke_2;
    block[3] = &unk_1E2E04370;
    v11 = v6;
    v12 = v5;
    v13 = v8;
    v14 = a1[4];
    v15 = a1[5];
    dispatch_async(v9, block);

  }
}

void __81__MUAMSResultProvider_fetchResultsForBundleIds_options_callbackQueue_completion___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t v20[128];
  uint8_t buf[4];
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 32))
  {
    MUGetMUAMSResultProviderLog();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      v3 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      v22 = v3;
      _os_log_impl(&dword_191DB8000, v2, OS_LOG_TYPE_ERROR, "Error with fetching bundle ids %@", buf, 0xCu);
    }

  }
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v4 = *(id *)(a1 + 40);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v17 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        MUGetMUAMSResultProviderLog();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v9, "identifier");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v22 = v11;
          _os_log_impl(&dword_191DB8000, v10, OS_LOG_TYPE_INFO, "Updating cache with bundle id %@", buf, 0xCu);

        }
        v12 = *(void **)(*(_QWORD *)(a1 + 48) + 8);
        objc_msgSend(v9, "iOSBundleIdentifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setAMSResult:forBundleId:", v9, v13);

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v6);
  }

  v14 = *(void **)(a1 + 48);
  v15 = (void *)objc_msgSend(*(id *)(a1 + 40), "copy");
  objc_msgSend(v14, "_finishWithResults:error:onCallbackQueue:completion:", v15, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));

}

- (void)_finishWithResults:(id)a3 error:(id)a4 onCallbackQueue:(id)a5 completion:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  _QWORD block[4];
  id v16;
  id v17;
  id v18;

  v9 = a3;
  v10 = a4;
  v11 = a6;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __75__MUAMSResultProvider__finishWithResults_error_onCallbackQueue_completion___block_invoke;
  block[3] = &unk_1E2E02558;
  v17 = v10;
  v18 = v11;
  v16 = v9;
  v12 = v10;
  v13 = v9;
  v14 = v11;
  dispatch_async((dispatch_queue_t)a5, block);

}

uint64_t __75__MUAMSResultProvider__finishWithResults_error_onCallbackQueue_completion___block_invoke(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_amsResultCache, 0);
}

@end
