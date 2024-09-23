@implementation NUANFFontLoader

void __52__NUANFFontLoader_asyncLoadFontsOnceWithCompletion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  id v9;
  uint64_t v10;
  id v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  uint64_t v25;
  void *v26;
  void *v27;
  NSObject *v28;
  _BOOL4 v29;
  uint64_t v30;
  void *v31;
  _QWORD block[4];
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _QWORD v38[6];
  uint8_t v39[128];
  uint8_t buf[4];
  uint64_t v41;
  __int16 v42;
  id v43;
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v8 = WeakRetained;
  if (WeakRetained)
  {
    v9 = WeakRetained;
    if (v6)
    {
      v38[0] = MEMORY[0x24BDAC760];
      v38[1] = 3221225472;
      v38[2] = __52__NUANFFontLoader_asyncLoadFontsOnceWithCompletion___block_invoke_4;
      v38[3] = &unk_24D5A2158;
      v10 = *(_QWORD *)(a1 + 40);
      v38[4] = v6;
      v38[5] = v10;
      v11 = v6;
      __52__NUANFFontLoader_asyncLoadFontsOnceWithCompletion___block_invoke_4((uint64_t)v38);
    }
    else
    {
      NUSharedLog();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218242;
        v41 = objc_msgSend(v5, "count");
        v42 = 2114;
        v43 = v9;
        _os_log_impl(&dword_216817000, v12, OS_LOG_TYPE_DEFAULT, "Finished loading %lu fonts for loader %{public}@", buf, 0x16u);
      }

      objc_msgSend(v9, "fontResourcesToRegister");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "removeAllObjects");

      v14 = objc_msgSend(v5, "count");
      if (v14 != objc_msgSend(*(id *)(a1 + 32), "count"))
      {
        v15 = (void *)objc_msgSend(*(id *)(a1 + 32), "mutableCopy");
        objc_msgSend(v5, "allKeys");
        v16 = objc_claimAutoreleasedReturnValue();
        v17 = (void *)v16;
        if (v16)
          v18 = v16;
        else
          v18 = MEMORY[0x24BDBD1A8];
        objc_msgSend(v15, "removeObjectsInArray:", v18);

        NUSharedLog();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v41 = (uint64_t)v15;
          _os_log_impl(&dword_216817000, v19, OS_LOG_TYPE_DEFAULT, "Missing font resources %{public}@", buf, 0xCu);
        }

      }
      v30 = a1;
      v31 = v8;
      v36 = 0u;
      v37 = 0u;
      v34 = 0u;
      v35 = 0u;
      v20 = *(id *)(a1 + 32);
      v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
      if (v21)
      {
        v22 = v21;
        v23 = *(_QWORD *)v35;
        do
        {
          for (i = 0; i != v22; ++i)
          {
            if (*(_QWORD *)v35 != v23)
              objc_enumerationMutation(v20);
            v25 = *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * i);
            objc_msgSend(v5, "objectForKey:", v25);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "fileURL");
            v27 = (void *)objc_claimAutoreleasedReturnValue();

            NUSharedLog();
            v28 = objc_claimAutoreleasedReturnValue();
            v29 = os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT);
            if (v27)
            {
              if (v29)
              {
                *(_DWORD *)buf = 138543362;
                v41 = v25;
                _os_log_impl(&dword_216817000, v28, OS_LOG_TYPE_DEFAULT, "Tracking font resource to register %{public}@", buf, 0xCu);
              }

              objc_msgSend(v9, "fontResourcesToRegister");
              v28 = objc_claimAutoreleasedReturnValue();
              -[NSObject addObject:](v28, "addObject:", v26);
            }
            else if (v29)
            {
              *(_DWORD *)buf = 138543362;
              v41 = v25;
              _os_log_impl(&dword_216817000, v28, OS_LOG_TYPE_DEFAULT, "Failed to load font resource with identifier %{public}@", buf, 0xCu);
            }

          }
          v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
        }
        while (v22);
      }

      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __52__NUANFFontLoader_asyncLoadFontsOnceWithCompletion___block_invoke_7;
      block[3] = &unk_24D5A2108;
      v33 = *(id *)(v30 + 40);
      dispatch_async(MEMORY[0x24BDAC9B8], block);
      v11 = v33;
      v8 = v31;
      v6 = 0;
    }

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

- (NSMutableArray)fontResourcesToRegister
{
  return self->_fontResourcesToRegister;
}

uint64_t __52__NUANFFontLoader_asyncLoadFontsOnceWithCompletion___block_invoke_7(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)setRelativePriority:(int64_t)a3
{
  id v4;

  self->_relativePriority = a3;
  -[NUANFFontLoader asyncOnceOperation](self, "asyncOnceOperation");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setRelativePriority:", a3);

}

- (FCAsyncOnceOperation)asyncOnceOperation
{
  return self->_asyncOnceOperation;
}

- (id)loadFontsWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[NUANFFontLoader asyncOnceOperation](self, "asyncOnceOperation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "executeWithCompletionHandler:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NUANFFontLoader)initWithANFContent:(id)a3 flintResourceManager:(id)a4 fontRegistration:(id)a5
{
  id v9;
  id v10;
  id v11;
  NUANFFontLoader *v12;
  NUANFFontLoader *v13;
  uint64_t v14;
  NSMutableArray *fontResourcesToRegister;
  uint64_t v16;
  NSMutableArray *fontResourcesRegistered;
  uint64_t v18;
  FCAsyncOnceOperation *asyncOnceOperation;
  objc_super v21;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v21.receiver = self;
  v21.super_class = (Class)NUANFFontLoader;
  v12 = -[NUANFFontLoader init](&v21, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_anfContent, a3);
    objc_storeStrong((id *)&v13->_flintResourceManager, a4);
    objc_storeStrong((id *)&v13->_fontRegistration, a5);
    v14 = objc_opt_new();
    fontResourcesToRegister = v13->_fontResourcesToRegister;
    v13->_fontResourcesToRegister = (NSMutableArray *)v14;

    v16 = objc_opt_new();
    fontResourcesRegistered = v13->_fontResourcesRegistered;
    v13->_fontResourcesRegistered = (NSMutableArray *)v16;

    v13->_relativePriority = 0;
    v18 = objc_msgSend(objc_alloc(MEMORY[0x24BE6CAD8]), "initWithTarget:selector:", v13, sel_asyncLoadFontsOnceWithCompletion_);
    asyncOnceOperation = v13->_asyncOnceOperation;
    v13->_asyncOnceOperation = (FCAsyncOnceOperation *)v18;

  }
  return v13;
}

- (id)asyncLoadFontsOnceWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  int64_t v9;
  void *v10;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  uint8_t buf[4];
  NUANFFontLoader *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  NUSharedLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v19 = self;
    _os_log_impl(&dword_216817000, v5, OS_LOG_TYPE_DEFAULT, "Loading font resources for loader %{public}@", buf, 0xCu);
  }

  -[NUANFFontLoader anfContent](self, "anfContent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fontResourceIDs");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "count"))
  {
    objc_initWeak((id *)buf, self);
    -[NUANFFontLoader flintResourceManager](self, "flintResourceManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[NUANFFontLoader relativePriority](self, "relativePriority");
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __52__NUANFFontLoader_asyncLoadFontsOnceWithCompletion___block_invoke_2;
    v12[3] = &unk_24D5A2180;
    objc_copyWeak(&v15, (id *)buf);
    v14 = v4;
    v13 = v7;
    objc_msgSend(v8, "fetchFontResourcesWithIdentifiers:downloadAssets:relativePriority:completionBlock:", v13, 1, v9, v12);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_destroyWeak(&v15);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __52__NUANFFontLoader_asyncLoadFontsOnceWithCompletion___block_invoke;
    v16[3] = &unk_24D5A2130;
    v16[4] = self;
    v17 = v4;
    __52__NUANFFontLoader_asyncLoadFontsOnceWithCompletion___block_invoke((uint64_t)v16);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v10;
}

- (int64_t)relativePriority
{
  return self->_relativePriority;
}

- (FCFlintResourceManager)flintResourceManager
{
  return self->_flintResourceManager;
}

- (FCANFContent)anfContent
{
  return self->_anfContent;
}

- (void)registerFontsWithCompletion:(id)a3
{
  NSObject *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  NSObject *v13;
  _BOOL4 v14;
  NUANFFontLoader *v15;
  NUANFFontLoader *v16;
  void *v17;
  void *v18;
  void *v19;
  void (**v20)(_QWORD);
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t v25[128];
  uint8_t buf[4];
  NUANFFontLoader *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v20 = (void (**)(_QWORD))a3;
  NUSharedLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v27 = self;
    _os_log_impl(&dword_216817000, v4, OS_LOG_TYPE_DEFAULT, "Registering font resource for loader %{public}@", buf, 0xCu);
  }

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  -[NUANFFontLoader fontResourcesToRegister](self, "fontResourcesToRegister");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v22 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        objc_msgSend(v11, "fileURL");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        NUSharedLog();
        v13 = objc_claimAutoreleasedReturnValue();
        v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
        if (v12)
        {
          if (v14)
          {
            objc_msgSend(v11, "resourceID");
            v15 = (NUANFFontLoader *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v27 = v15;
            _os_log_impl(&dword_216817000, v13, OS_LOG_TYPE_DEFAULT, "Registering font resource %{public}@", buf, 0xCu);

          }
          -[NUANFFontLoader fontRegistration](self, "fontRegistration");
          v13 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "fileURL");
          v16 = (NUANFFontLoader *)objc_claimAutoreleasedReturnValue();
          -[NSObject registerFontWithURL:error:](v13, "registerFontWithURL:error:", v16, 0);
        }
        else
        {
          if (!v14)
            goto LABEL_15;
          objc_msgSend(v11, "resourceID");
          v16 = (NUANFFontLoader *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v27 = v16;
          _os_log_impl(&dword_216817000, v13, OS_LOG_TYPE_DEFAULT, "Unable to register font resource %{public}@", buf, 0xCu);
        }

LABEL_15:
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v8);
  }

  -[NUANFFontLoader fontResourcesRegistered](self, "fontResourcesRegistered");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[NUANFFontLoader fontResourcesToRegister](self, "fontResourcesToRegister");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addObjectsFromArray:", v18);

  -[NUANFFontLoader fontResourcesToRegister](self, "fontResourcesToRegister");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "removeAllObjects");

  if (v20)
    v20[2](v20);

}

- (void)unregisterFontsWithCompletion:(id)a3
{
  NSObject *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  NSObject *v12;
  NUANFFontLoader *v13;
  void *v14;
  void *v15;
  void *v16;
  void (**v17)(_QWORD);
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t v22[128];
  uint8_t buf[4];
  NUANFFontLoader *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v17 = (void (**)(_QWORD))a3;
  NUSharedLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v24 = self;
    _os_log_impl(&dword_216817000, v4, OS_LOG_TYPE_DEFAULT, "Unregistering font resource for loader %{public}@", buf, 0xCu);
  }

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[NUANFFontLoader fontResourcesRegistered](self, "fontResourcesRegistered");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v19 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        NUSharedLog();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v11, "resourceID");
          v13 = (NUANFFontLoader *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v24 = v13;
          _os_log_impl(&dword_216817000, v12, OS_LOG_TYPE_DEFAULT, "Unregistering font resource %{public}@", buf, 0xCu);

        }
        objc_msgSend(v11, "fileURL");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v14)
        {
          -[NUANFFontLoader fontRegistration](self, "fontRegistration");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "fileURL");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "unregisterFontWithURL:", v16);

        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v8);
  }

  if (v17)
    v17[2](v17);

}

uint64_t __52__NUANFFontLoader_asyncLoadFontsOnceWithCompletion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  _QWORD block[4];
  id v6;
  uint8_t buf[4];
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  NUSharedLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    v8 = v3;
    _os_log_impl(&dword_216817000, v2, OS_LOG_TYPE_DEFAULT, "No font resources required for loader %{public}@", buf, 0xCu);
  }

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __52__NUANFFontLoader_asyncLoadFontsOnceWithCompletion___block_invoke_4;
  block[3] = &unk_24D5A2108;
  v6 = *(id *)(a1 + 40);
  dispatch_async(MEMORY[0x24BDAC9B8], block);

  return 0;
}

uint64_t __52__NUANFFontLoader_asyncLoadFontsOnceWithCompletion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

{
  NSObject *v2;
  uint64_t v3;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  NUSharedLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v5 = 138543362;
    v6 = v3;
    _os_log_impl(&dword_216817000, v2, OS_LOG_TYPE_DEFAULT, "Font loading failed with error %{public}@", (uint8_t *)&v5, 0xCu);
  }

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (BOOL)hasLoaded
{
  return self->_hasLoaded;
}

- (NSMutableArray)fontResourcesRegistered
{
  return self->_fontResourcesRegistered;
}

- (NUFontRegistration)fontRegistration
{
  return self->_fontRegistration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fontRegistration, 0);
  objc_storeStrong((id *)&self->_asyncOnceOperation, 0);
  objc_storeStrong((id *)&self->_fontResourcesRegistered, 0);
  objc_storeStrong((id *)&self->_fontResourcesToRegister, 0);
  objc_storeStrong((id *)&self->_flintResourceManager, 0);
  objc_storeStrong((id *)&self->_anfContent, 0);
}

@end
