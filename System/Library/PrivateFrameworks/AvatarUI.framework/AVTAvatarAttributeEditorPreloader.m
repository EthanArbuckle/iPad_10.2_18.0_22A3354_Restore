@implementation AVTAvatarAttributeEditorPreloader

- (AVTAvatarAttributeEditorPreloader)initWithResourceLoader:(id)a3 logger:(id)a4
{
  id v7;
  id v8;
  AVTAvatarAttributeEditorPreloader *v9;
  AVTAvatarAttributeEditorPreloader *v10;
  uint64_t v11;
  NSMutableDictionary *cancelationTokens;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)AVTAvatarAttributeEditorPreloader;
  v9 = -[AVTAvatarAttributeEditorPreloader init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_resourceLoader, a3);
    objc_storeStrong((id *)&v10->_logger, a4);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v11 = objc_claimAutoreleasedReturnValue();
    cancelationTokens = v10->_cancelationTokens;
    v10->_cancelationTokens = (NSMutableDictionary *)v11;

  }
  return v10;
}

- (void)cancelAllPreloading
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[AVTAvatarAttributeEditorPreloader cancelationTokens](self, "cancelationTokens", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v8);
        -[AVTAvatarAttributeEditorPreloader logger](self, "logger");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "description");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "logCancelingPreLoadingTask:", v11);

        objc_msgSend(v9, "cancel");
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

  -[AVTAvatarAttributeEditorPreloader cancelationTokens](self, "cancelationTokens");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "removeAllObjects");

}

- (void)dealloc
{
  objc_super v3;

  -[AVTAvatarAttributeEditorPreloader cancelAllPreloading](self, "cancelAllPreloading");
  v3.receiver = self;
  v3.super_class = (Class)AVTAvatarAttributeEditorPreloader;
  -[AVTAvatarAttributeEditorPreloader dealloc](&v3, sel_dealloc);
}

- (void)preloadSectionItem:(id)a3 atIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id location;

  v6 = a3;
  v7 = a4;
  -[AVTAvatarAttributeEditorPreloader logger](self, "logger");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "logPreLoadingNeededForIndex:section:", objc_msgSend(v7, "item"), objc_msgSend(v7, "section"));

  -[AVTAvatarAttributeEditorPreloader cancelationTokens](self, "cancelationTokens");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    objc_initWeak(&location, self);
    -[AVTAvatarAttributeEditorPreloader resourceLoader](self, "resourceLoader");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __68__AVTAvatarAttributeEditorPreloader_preloadSectionItem_atIndexPath___block_invoke;
    v16[3] = &unk_1EA51D008;
    objc_copyWeak(&v18, &location);
    v12 = v7;
    v17 = v12;
    objc_msgSend(v11, "preLoadResourcesForSectionItem:completionHandler:", v6, v16);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[AVTAvatarAttributeEditorPreloader cancelationTokens](self, "cancelationTokens");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v10, v12);

    -[AVTAvatarAttributeEditorPreloader logger](self, "logger");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "description");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "logRequestingPreLoadingTask:forIndex:section:", v15, objc_msgSend(v12, "item"), objc_msgSend(v12, "section"));

    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }

}

void __68__AVTAvatarAttributeEditorPreloader_preloadSectionItem_atIndexPath___block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  id WeakRetained;

  v3 = (id *)(a1 + 40);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "cancelationTokens");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 == v4)
  {
    objc_msgSend(WeakRetained, "cancelationTokens");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", 0, *(_QWORD *)(a1 + 32));

  }
}

- (void)cancelPreloadForSectionItemIndexPath:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  -[AVTAvatarAttributeEditorPreloader cancelationTokens](self, "cancelationTokens");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[AVTAvatarAttributeEditorPreloader cancelationTokens](self, "cancelationTokens");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", 0, v9);

    -[AVTAvatarAttributeEditorPreloader logger](self, "logger");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "description");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "logCancelingPreLoadingTask:", v8);

    objc_msgSend(v5, "cancel");
  }

}

- (void)preloadCategory:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, void *);
  void *v11;
  id v12;
  id location;

  v4 = a3;
  -[AVTAvatarAttributeEditorPreloader cancelAllPreloading](self, "cancelAllPreloading");
  objc_initWeak(&location, self);
  -[AVTAvatarAttributeEditorPreloader resourceLoader](self, "resourceLoader");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __53__AVTAvatarAttributeEditorPreloader_preloadCategory___block_invoke;
  v11 = &unk_1EA51D030;
  objc_copyWeak(&v12, &location);
  objc_msgSend(v5, "preLoadResourcesForPresetResourcesProvider:completionHandler:", v4, &v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[AVTAvatarAttributeEditorPreloader cancelationTokens](self, "cancelationTokens", v8, v9, v10, v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v6, CFSTR("categoryPreload"));

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

}

void __53__AVTAvatarAttributeEditorPreloader_preloadCategory___block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  void *v4;
  id v5;
  void *v6;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "cancelationTokens");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("categoryPreload"));
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v3)
  {
    objc_msgSend(WeakRetained, "cancelationTokens");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", 0, CFSTR("categoryPreload"));

  }
}

- (AVTPresetResourceLoader)resourceLoader
{
  return self->_resourceLoader;
}

- (void)setResourceLoader:(id)a3
{
  objc_storeStrong((id *)&self->_resourceLoader, a3);
}

- (NSMutableDictionary)cancelationTokens
{
  return self->_cancelationTokens;
}

- (void)setCancelationTokens:(id)a3
{
  objc_storeStrong((id *)&self->_cancelationTokens, a3);
}

- (AVTUILogger)logger
{
  return self->_logger;
}

- (void)setLogger:(id)a3
{
  objc_storeStrong((id *)&self->_logger, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_cancelationTokens, 0);
  objc_storeStrong((id *)&self->_resourceLoader, 0);
}

@end
