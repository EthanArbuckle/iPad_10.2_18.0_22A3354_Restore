@implementation _AXDyldImageMonitor

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_0 != -1)
    dispatch_once(&sharedInstance_onceToken_0, &__block_literal_global_13);
  return (id)_Shared;
}

- (_AXDyldImageMonitor)init
{
  _AXDyldImageMonitor *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *queue;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_AXDyldImageMonitor;
  v2 = -[_AXDyldImageMonitor init](&v7, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("_AXDyldImageMonitor", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

  }
  return v2;
}

- (void)_dyldDidAddImage:(id)a3
{
  id v4;
  NSHashTable *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = self->_imageMonitorObservers;
  v6 = -[NSHashTable countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "imageMonitor:didAddImage:", self, v4, (_QWORD)v10);
      }
      while (v7 != v9);
      v7 = -[NSHashTable countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (void)enumerateLoadedImagePaths:(id)a3
{
  uint32_t v3;
  uint32_t v4;
  uint32_t i;
  const char *image_name;
  const char *v7;
  id v8;
  void *v9;
  void (**v10)(id, void *);

  v10 = (void (**)(id, void *))a3;
  v3 = _dyld_image_count();
  if (v3)
  {
    v4 = v3;
    for (i = 0; i != v4; ++i)
    {
      image_name = _dyld_get_image_name(i);
      if (image_name)
      {
        v7 = image_name;
        v8 = objc_alloc(MEMORY[0x1E0CB3940]);
        v9 = (void *)objc_msgSend(v8, "initWithCString:encoding:", v7, objc_msgSend(MEMORY[0x1E0CB3940], "defaultCStringEncoding"));
        v10[2](v10, v9);

      }
    }
  }

}

- (id)loadedImagePaths
{
  void *v3;
  id v4;
  _QWORD v6[4];
  id v7;

  objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", _dyld_image_count());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __39___AXDyldImageMonitor_loadedImagePaths__block_invoke;
  v6[3] = &unk_1E28C3338;
  v4 = v3;
  v7 = v4;
  -[_AXDyldImageMonitor enumerateLoadedImagePaths:](self, "enumerateLoadedImagePaths:", v6);

  return v4;
}

- (void)addImageMonitorObserver:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __47___AXDyldImageMonitor_addImageMonitorObserver___block_invoke;
  v7[3] = &unk_1E28C2E80;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)removeImageMonitorObserver:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __50___AXDyldImageMonitor_removeImageMonitorObserver___block_invoke;
  v7[3] = &unk_1E28C2E80;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_imageMonitorObservers, 0);
}

@end
