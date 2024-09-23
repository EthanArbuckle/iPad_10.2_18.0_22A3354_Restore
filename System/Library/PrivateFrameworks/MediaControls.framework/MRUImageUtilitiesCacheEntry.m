@implementation MRUImageUtilitiesCacheEntry

- (void)startEvictionTimer
{
  void *v3;
  int v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  uint8_t buf[4];
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D4C638], "currentSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "verboseImageLoadingLogging");

  if (v4)
  {
    MCLogCategoryDefault();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      -[MRUImageUtilitiesCacheEntry identifier](self, "identifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v13 = v6;
      _os_log_impl(&dword_1AA991000, v5, OS_LOG_TYPE_DEFAULT, "[MRUImageUtilities] Start eviction timer for entry with id: %@", buf, 0xCu);

    }
  }
  objc_initWeak((id *)buf, self);
  v7 = (void *)MEMORY[0x1E0D4D110];
  v8 = MEMORY[0x1E0C80D38];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __49__MRUImageUtilitiesCacheEntry_startEvictionTimer__block_invoke;
  v10[3] = &unk_1E5818E18;
  objc_copyWeak(&v11, (id *)buf);
  objc_msgSend(v7, "timerWithInterval:repeats:queue:block:", 0, MEMORY[0x1E0C80D38], v10, 300.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRUImageUtilitiesCacheEntry setEvictionTimer:](self, "setEvictionTimer:", v9);

  objc_destroyWeak(&v11);
  objc_destroyWeak((id *)buf);
}

void __49__MRUImageUtilitiesCacheEntry_startEvictionTimer__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  void *v4;
  char v5;
  void *v6;
  int v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    +[MRUImageLoaderCoordinator sharedCoordinator](MRUImageLoaderCoordinator, "sharedCoordinator");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "registeredLoaderArtworkIdentifiers");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "identifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v3, "containsObject:", v4);

    if ((v5 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0D4C638], "currentSettings");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "verboseImageLoadingLogging");

      if (v7)
      {
        MCLogCategoryDefault();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(WeakRetained, "identifier");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = 138412290;
          v13 = v9;
          _os_log_impl(&dword_1AA991000, v8, OS_LOG_TYPE_DEFAULT, "[MRUImageUtilities] Evicting entry with id: %@", (uint8_t *)&v12, 0xCu);

        }
      }
      +[MRUImageUtilities cache](MRUImageUtilities, "cache");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "identifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "removeObjectForKey:", v11);

    }
  }

}

- (void)dealloc
{
  void *v3;
  int v4;
  NSObject *v5;
  void *v6;
  objc_super v7;
  uint8_t buf[4];
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D4C638], "currentSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "verboseImageLoadingLogging");

  if (v4)
  {
    MCLogCategoryDefault();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      -[MRUImageUtilitiesCacheEntry identifier](self, "identifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v9 = v6;
      _os_log_impl(&dword_1AA991000, v5, OS_LOG_TYPE_DEFAULT, "[MRUImageUtilities] Dealloc entry with id: %@", buf, 0xCu);

    }
  }
  v7.receiver = self;
  v7.super_class = (Class)MRUImageUtilitiesCacheEntry;
  -[MRUImageUtilitiesCacheEntry dealloc](&v7, sel_dealloc);
}

- (void)cancelEvictionTimer
{
  void *v3;
  void *v4;
  int v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  -[MRUImageUtilitiesCacheEntry evictionTimer](self, "evictionTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0D4C638], "currentSettings");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "verboseImageLoadingLogging");

    if (v5)
    {
      MCLogCategoryDefault();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        -[MRUImageUtilitiesCacheEntry identifier](self, "identifier");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = 138412290;
        v10 = v7;
        _os_log_impl(&dword_1AA991000, v6, OS_LOG_TYPE_DEFAULT, "[MRUImageUtilities] Cancel eviction timer for entry with id: %@", (uint8_t *)&v9, 0xCu);

      }
    }
    -[MRUImageUtilitiesCacheEntry evictionTimer](self, "evictionTimer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "invalidate");

    -[MRUImageUtilitiesCacheEntry setEvictionTimer:](self, "setEvictionTimer:", 0);
  }
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (UIImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
  objc_storeStrong((id *)&self->_image, a3);
}

- (CGSize)fittingSize
{
  double width;
  double height;
  CGSize result;

  width = self->_fittingSize.width;
  height = self->_fittingSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setFittingSize:(CGSize)a3
{
  self->_fittingSize = a3;
}

- (MSVTimer)evictionTimer
{
  return self->_evictionTimer;
}

- (void)setEvictionTimer:(id)a3
{
  objc_storeStrong((id *)&self->_evictionTimer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_evictionTimer, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
