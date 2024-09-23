@implementation MUPlaceholderGridCache

+ (id)unretainedInstance
{
  MUPlaceholderGridCache *WeakRetained;

  WeakRetained = (MUPlaceholderGridCache *)objc_loadWeakRetained(unretainedInstance__sharedInstance);
  if (!WeakRetained)
  {
    WeakRetained = objc_alloc_init(MUPlaceholderGridCache);
    objc_storeWeak(unretainedInstance__sharedInstance, WeakRetained);
  }
  return WeakRetained;
}

- (MUPlaceholderGridCache)init
{
  MUPlaceholderGridCache *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MUPlaceholderGridCache;
  result = -[MUPlaceholderGridCache init](&v3, sel_init);
  if (result)
    *(_QWORD *)&result->_lock._os_unfair_lock_opaque = 0;
  return result;
}

- (void)loadPlaceholderGridImages
{
  NSObject *v3;
  os_unfair_lock_s *p_snapshotterLock;
  id v5;
  void *v6;
  MKMapSnapshotter *v7;
  MKMapSnapshotter *lightSnapshotter;
  MKMapSnapshotter *v9;
  id v10;
  void *v11;
  MKMapSnapshotter *v12;
  MKMapSnapshotter *darkSnapshotter;
  MKMapSnapshotter *v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;
  id buf[2];

  if (self->_lightGrid && self->_darkGrid)
  {
    MUGetShareSheetLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_191DB8000, v3, OS_LOG_TYPE_INFO, "Cache hit for both light and dark grid.", (uint8_t *)buf, 2u);
    }
  }
  else
  {
    p_snapshotterLock = &self->_snapshotterLock;
    os_unfair_lock_lock(&self->_snapshotterLock);
    -[MUPlaceholderGridCache _cancelSnapshots](self, "_cancelSnapshots");
    if (qword_1ED01B638 != -1)
      dispatch_once(&qword_1ED01B638, &__block_literal_global_36);
    v3 = (id)_MergedGlobals_128;
    objc_initWeak(buf, self);
    if (!self->_lightGrid)
    {
      v5 = objc_alloc(MEMORY[0x1E0CC1868]);
      createPlaceholderSnapshotOptions(1, 300.0, 300.0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (MKMapSnapshotter *)objc_msgSend(v5, "initWithOptions:", v6);
      lightSnapshotter = self->_lightSnapshotter;
      self->_lightSnapshotter = v7;

      v9 = self->_lightSnapshotter;
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __51__MUPlaceholderGridCache_loadPlaceholderGridImages__block_invoke;
      v17[3] = &unk_1E2E03828;
      objc_copyWeak(&v18, buf);
      -[MKMapSnapshotter startWithQueue:completionHandler:](v9, "startWithQueue:completionHandler:", v3, v17);
      objc_destroyWeak(&v18);
    }
    if (!self->_darkGrid)
    {
      v10 = objc_alloc(MEMORY[0x1E0CC1868]);
      createPlaceholderSnapshotOptions(0, 300.0, 300.0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (MKMapSnapshotter *)objc_msgSend(v10, "initWithOptions:", v11);
      darkSnapshotter = self->_darkSnapshotter;
      self->_darkSnapshotter = v12;

      v14 = self->_darkSnapshotter;
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __51__MUPlaceholderGridCache_loadPlaceholderGridImages__block_invoke_13;
      v15[3] = &unk_1E2E03828;
      objc_copyWeak(&v16, buf);
      -[MKMapSnapshotter startWithQueue:completionHandler:](v14, "startWithQueue:completionHandler:", v3, v15);
      objc_destroyWeak(&v16);
    }
    os_unfair_lock_unlock(p_snapshotterLock);
    objc_destroyWeak(buf);
  }

}

void __51__MUPlaceholderGridCache_loadPlaceholderGridImages__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  id WeakRetained;
  NSObject *v7;
  NSObject *v8;
  uint8_t v9[16];
  uint8_t buf[16];

  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    MUGetShareSheetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (a3)
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_191DB8000, v8, OS_LOG_TYPE_ERROR, "Failed to render light placeholder grid", buf, 2u);
      }
    }
    else
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v9 = 0;
        _os_log_impl(&dword_191DB8000, v8, OS_LOG_TYPE_INFO, "Loaded and saving light grid", v9, 2u);
      }

      objc_msgSend(v5, "image");
      v8 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "_saveLightGrid:", v8);
    }

  }
}

void __51__MUPlaceholderGridCache_loadPlaceholderGridImages__block_invoke_13(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  id WeakRetained;
  NSObject *v7;
  NSObject *v8;
  uint8_t v9[16];
  uint8_t buf[16];

  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    MUGetShareSheetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (a3)
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_191DB8000, v8, OS_LOG_TYPE_ERROR, "Failed to render dark placeholder grid", buf, 2u);
      }
    }
    else
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v9 = 0;
        _os_log_impl(&dword_191DB8000, v8, OS_LOG_TYPE_INFO, "Loaded and saving dark grid", v9, 2u);
      }

      objc_msgSend(v5, "image");
      v8 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "_saveDarkGrid:", v8);
    }

  }
}

- (void)_saveLightGrid:(id)a3
{
  id v5;

  v5 = a3;
  os_unfair_lock_lock(&self->_lock);
  if (v5)
    objc_storeStrong((id *)&self->_lightGrid, a3);
  os_unfair_lock_unlock(&self->_lock);

}

- (void)_saveDarkGrid:(id)a3
{
  id v5;

  v5 = a3;
  os_unfair_lock_lock(&self->_lock);
  if (v5)
    objc_storeStrong((id *)&self->_darkGrid, a3);
  os_unfair_lock_unlock(&self->_lock);

}

- (void)_cancelSnapshots
{
  -[MKMapSnapshotter cancel](self->_lightSnapshotter, "cancel");
  -[MKMapSnapshotter cancel](self->_darkSnapshotter, "cancel");
}

- (UIImage)lightGrid
{
  os_unfair_lock_s *p_lock;
  NSObject *v4;
  UIImage *v5;
  UIImage *lightGrid;
  UIImage *v7;
  uint8_t v9[16];

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_lightGrid)
  {
    MUGetShareSheetLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_191DB8000, v4, OS_LOG_TYPE_INFO, "Loaded cached light grid", v9, 2u);
    }

  }
  else
  {
    -[MUPlaceholderGridCache _cancelSnapshots](self, "_cancelSnapshots");
    createMapPlaceholderGrid(1, 300.0, 300.0);
    v5 = (UIImage *)objc_claimAutoreleasedReturnValue();
    lightGrid = self->_lightGrid;
    self->_lightGrid = v5;

  }
  v7 = self->_lightGrid;
  os_unfair_lock_unlock(p_lock);
  return v7;
}

- (UIImage)darkGrid
{
  os_unfair_lock_s *p_lock;
  NSObject *v4;
  UIImage *v5;
  UIImage *darkGrid;
  UIImage *v7;
  uint8_t v9[16];

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_darkGrid)
  {
    MUGetShareSheetLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_191DB8000, v4, OS_LOG_TYPE_INFO, "Loaded cached dark grid", v9, 2u);
    }

  }
  else
  {
    -[MUPlaceholderGridCache _cancelSnapshots](self, "_cancelSnapshots");
    createMapPlaceholderGrid(0, 300.0, 300.0);
    v5 = (UIImage *)objc_claimAutoreleasedReturnValue();
    darkGrid = self->_darkGrid;
    self->_darkGrid = v5;

  }
  v7 = self->_darkGrid;
  os_unfair_lock_unlock(p_lock);
  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_darkGrid, 0);
  objc_storeStrong((id *)&self->_lightGrid, 0);
  objc_storeStrong((id *)&self->_darkSnapshotter, 0);
  objc_storeStrong((id *)&self->_lightSnapshotter, 0);
}

@end
