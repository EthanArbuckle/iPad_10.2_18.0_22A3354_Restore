@implementation ATXWebClipDataStore

- (ATXWebClipDataStore)init
{
  void *v3;
  void *v4;
  ATXWebClipDataStore *v5;

  +[_ATXDataStore sharedInstance](_ATXDataStore, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_opt_new();
  v5 = -[ATXWebClipDataStore initWithDataStore:contextUpdateListener:](self, "initWithDataStore:contextUpdateListener:", v3, v4);

  return v5;
}

- (ATXWebClipDataStore)initWithDataStore:(id)a3
{
  id v4;
  void *v5;
  ATXWebClipDataStore *v6;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  v6 = -[ATXWebClipDataStore initWithDataStore:contextUpdateListener:](self, "initWithDataStore:contextUpdateListener:", v4, v5);

  return v6;
}

- (ATXWebClipDataStore)initWithDataStore:(id)a3 contextUpdateListener:(id)a4
{
  id v7;
  id v8;
  ATXWebClipDataStore *v9;
  ATXWebClipDataStore *v10;
  _QWORD v12[4];
  id v13;
  id location;
  objc_super v15;

  v7 = a3;
  v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)ATXWebClipDataStore;
  v9 = -[ATXWebClipDataStore init](&v15, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_dataStore, a3);
    objc_storeStrong((id *)&v10->_appClipUsageUpdateListener, a4);
    objc_initWeak(&location, v10);
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __63__ATXWebClipDataStore_initWithDataStore_contextUpdateListener___block_invoke;
    v12[3] = &unk_1E82DC4B0;
    objc_copyWeak(&v13, &location);
    objc_msgSend(v8, "startListeningWithCallback:clientId:", v12, CFSTR("ATXWebClipDataStore"));
    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }

  return v10;
}

void __63__ATXWebClipDataStore_initWithDataStore_contextUpdateListener___block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "updateWithUsageEvent:", v3);

}

- (void)updateWithUsageEvent:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "clipBundleId");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    objc_msgSend(v4, "webClipBundleId");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      __atxlog_handle_hero();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v4, "webClipBundleId");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "clipBundleId");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = 138412546;
        v15 = v9;
        v16 = 2112;
        v17 = v10;
        _os_log_impl(&dword_1C9A3B000, v8, OS_LOG_TYPE_DEFAULT, "Recording usage event for %@:%@", (uint8_t *)&v14, 0x16u);

      }
      -[ATXWebClipDataStore dataStore](self, "dataStore");
      v11 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "webClipBundleId");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "clipBundleId");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject writeWebClip:appClip:](v11, "writeWebClip:appClip:", v12, v13);

      goto LABEL_8;
    }
  }
  __atxlog_handle_hero();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "parentAppBundleId");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138412290;
    v15 = v12;
    _os_log_impl(&dword_1C9A3B000, v11, OS_LOG_TYPE_DEFAULT, "Not recording usage event for %@", (uint8_t *)&v14, 0xCu);
LABEL_8:

  }
}

- (id)webClipBundleIdsForAppClip:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[ATXWebClipDataStore dataStore](self, "dataStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "webClipsForAppClipBundleId:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (_ATXDataStore)dataStore
{
  return self->_dataStore;
}

- (ATXAppClipLaunchListenerProtocol)appClipUsageUpdateListener
{
  return self->_appClipUsageUpdateListener;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appClipUsageUpdateListener, 0);
  objc_storeStrong((id *)&self->_dataStore, 0);
}

@end
