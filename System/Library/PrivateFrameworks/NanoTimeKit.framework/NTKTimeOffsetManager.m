@implementation NTKTimeOffsetManager

+ (id)sharedManager
{
  if (sharedManager_onceToken_3 != -1)
    dispatch_once(&sharedManager_onceToken_3, &__block_literal_global_170);
  return (id)sharedManager_manager_2;
}

void __37__NTKTimeOffsetManager_sharedManager__block_invoke()
{
  NTKTimeOffsetManager *v0;
  void *v1;

  v0 = objc_alloc_init(NTKTimeOffsetManager);
  v1 = (void *)sharedManager_manager_2;
  sharedManager_manager_2 = (uint64_t)v0;

}

- (NTKTimeOffsetManager)init
{
  NTKTimeOffsetManager *v2;
  NTKTimeOffsetManager *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)NTKTimeOffsetManager;
  v2 = -[NTKTimeOffsetManager init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    -[NTKTimeOffsetManager _loadTimeOffset](v2, "_loadTimeOffset");
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObserver:selector:name:object:", v3, sel__handleFaceDefaultsChanged, CFSTR("NTKFaceDefaultsChangedNotification"), 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:selector:name:object:", v3, sel__handleFaceLibraryReloaded, CFSTR("NTKFaceLibraryReloadedNotification"), 0);

  }
  return v3;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)NTKTimeOffsetManager;
  -[NTKTimeOffsetManager dealloc](&v4, sel_dealloc);
}

- (id)faceDisplayTime
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0C94130], "now");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKTimeOffsetManager displayTimeForRealTime:](self, "displayTimeForRealTime:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)displayTimeForRealTime:(id)a3
{
  return (id)objc_msgSend(a3, "dateByAddingTimeInterval:", self->_timeOffset);
}

- (void)_handleFaceDefaultsChanged
{
  -[NTKTimeOffsetManager _updateTimeOffset:](self, "_updateTimeOffset:", 0);
}

- (void)_handleFaceLibraryReloaded
{
  -[NTKTimeOffsetManager _updateTimeOffset:](self, "_updateTimeOffset:", 1);
}

- (void)forceUpdateTimeOffset
{
  -[NTKTimeOffsetManager _updateTimeOffset:](self, "_updateTimeOffset:", 0);
}

- (void)_loadTimeOffset
{
  self->_timeOffset = 0.0;
}

- (double)timeOffset
{
  return self->_timeOffset;
}

- (void)setTimeOffset:(double)a3
{
  self->_timeOffset = a3;
}

@end
