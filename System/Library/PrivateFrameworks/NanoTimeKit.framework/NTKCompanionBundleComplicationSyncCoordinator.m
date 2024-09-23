@implementation NTKCompanionBundleComplicationSyncCoordinator

- (BOOL)loaded
{
  return self->_loaded;
}

void __63__NTKCompanionBundleComplicationSyncCoordinator_sharedInstance__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedInstance_instance_2;
  sharedInstance_instance_2 = (uint64_t)v1;

}

- (NTKCompanionBundleComplicationSyncCoordinator)init
{
  NTKCompanionBundleComplicationSyncCoordinator *v2;
  NTKCompanionBundleComplicationSyncCoordinator *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NTKCompanionBundleComplicationSyncCoordinator;
  v2 = -[NTKCompanionBundleComplicationSyncCoordinator init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObserver:selector:name:object:", v3, sel_activeDeviceChanged, *MEMORY[0x1E0C93E48], 0);

    -[NTKCompanionBundleComplicationSyncCoordinator activeDeviceChanged](v3, "activeDeviceChanged");
  }
  return v3;
}

- (void)activeDeviceChanged
{
  os_unfair_lock_s *p_lock;
  NTKComplicationCollection *complicationCollection;
  void *v5;
  NTKComplicationCollection *v6;
  NTKComplicationCollection *v7;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  complicationCollection = self->_complicationCollection;
  if (complicationCollection)
    -[NTKComplicationCollection removeObserver:](complicationCollection, "removeObserver:", self);
  objc_msgSend(MEMORY[0x1E0C944B0], "currentDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[NTKCompanionComplicationCollectionManager sharedBundleComplicationCollectionForDevice:](NTKCompanionComplicationCollectionManager, "sharedBundleComplicationCollectionForDevice:", v5);
  v6 = (NTKComplicationCollection *)objc_claimAutoreleasedReturnValue();
  v7 = self->_complicationCollection;
  self->_complicationCollection = v6;

  -[NTKComplicationCollection addObserver:](self->_complicationCollection, "addObserver:", self);
  self->_loaded = 0;
  -[NTKCompanionBundleComplicationSyncCoordinator _lock_updateLoaded](self, "_lock_updateLoaded");
  os_unfair_lock_unlock(p_lock);
}

- (void)_lock_updateLoaded
{
  _BOOL4 loaded;
  _BOOL4 v4;
  _QWORD block[5];

  loaded = self->_loaded;
  v4 = -[NTKComplicationCollection hasLoaded](self->_complicationCollection, "hasLoaded");
  self->_loaded = v4;
  if (!loaded && v4)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __67__NTKCompanionBundleComplicationSyncCoordinator__lock_updateLoaded__block_invoke;
    block[3] = &unk_1E6BCD5F0;
    block[4] = self;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }
}

+ (NTKCompanionBundleComplicationSyncCoordinator)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63__NTKCompanionBundleComplicationSyncCoordinator_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_20 != -1)
    dispatch_once(&sharedInstance_onceToken_20, block);
  return (NTKCompanionBundleComplicationSyncCoordinator *)(id)sharedInstance_instance_2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0C93E48], 0);

  v4.receiver = self;
  v4.super_class = (Class)NTKCompanionBundleComplicationSyncCoordinator;
  -[NTKCompanionBundleComplicationSyncCoordinator dealloc](&v4, sel_dealloc);
}

- (id)descriptorsForBundleIdentifier:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  void *v6;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[NTKComplicationCollection complicationDescriptorsForClientIdentifier:](self->_complicationCollection, "complicationDescriptorsForClientIdentifier:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_lock);
  return v6;
}

- (void)complicationCollectionDidLoad:(id)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[NTKCompanionBundleComplicationSyncCoordinator _lock_updateLoaded](self, "_lock_updateLoaded");
  os_unfair_lock_unlock(p_lock);
}

- (void)complicationCollectionDidReload:(id)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[NTKCompanionBundleComplicationSyncCoordinator _lock_updateLoaded](self, "_lock_updateLoaded");
  os_unfair_lock_unlock(p_lock);
}

void __67__NTKCompanionBundleComplicationSyncCoordinator__lock_updateLoaded__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("NTKCompanionBundleComplicationManagerDidLoadNotification"), *(_QWORD *)(a1 + 32));

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_complicationCollection, 0);
}

@end
