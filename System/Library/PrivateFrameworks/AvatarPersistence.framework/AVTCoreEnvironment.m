@implementation AVTCoreEnvironment

+ (void)resetFlushCacheValuesIfNeeded
{
  uint64_t v2;

  v2 = AVTAvatarKitSnapshotVersionNumber();
  if (AVTUILastCacheVersion() != v2)
  {
    AVTUISetLastCacheVersion(v2);
    AVTUISetFlushStickersCache(1);
    AVTUISetFlushThumbnailCache(1);
  }
}

- (AVTCoreEnvironment)init
{
  AVTCoreEnvironment *v2;
  AVTUILogger *v3;
  AVTUILogger *logger;
  AVTBlockScheduler *v5;
  AVTBlockScheduler *scheduler;
  void *v7;
  uint64_t v8;
  id serialQueueProvider;
  void *v10;
  uint64_t v11;
  id lockProvider;
  uint64_t v13;
  NSNotificationCenter *notificationCenter;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)AVTCoreEnvironment;
  v2 = -[AVTCoreEnvironment init](&v16, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(AVTUILogger);
    logger = v2->_logger;
    v2->_logger = v3;

    v5 = objc_alloc_init(AVTBlockScheduler);
    scheduler = v2->_scheduler;
    v2->_scheduler = v5;

    objc_msgSend((id)objc_opt_class(), "serialQueueProvider");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "copy");
    serialQueueProvider = v2->_serialQueueProvider;
    v2->_serialQueueProvider = (id)v8;

    objc_msgSend((id)objc_opt_class(), "serialQueueProvider");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "copy");
    lockProvider = v2->_lockProvider;
    v2->_lockProvider = (id)v11;

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v13 = objc_claimAutoreleasedReturnValue();
    notificationCenter = v2->_notificationCenter;
    v2->_notificationCenter = (NSNotificationCenter *)v13;

    objc_msgSend((id)objc_opt_class(), "resetFlushCacheValuesIfNeeded");
  }
  return v2;
}

+ (id)defaultEnvironment
{
  if (defaultEnvironment_onceToken != -1)
    dispatch_once(&defaultEnvironment_onceToken, &__block_literal_global_4);
  return (id)defaultEnvironment_sInstance;
}

void __40__AVTCoreEnvironment_defaultEnvironment__block_invoke()
{
  AVTCoreEnvironment *v0;
  void *v1;

  v0 = objc_alloc_init(AVTCoreEnvironment);
  v1 = (void *)defaultEnvironment_sInstance;
  defaultEnvironment_sInstance = (uint64_t)v0;

}

+ (id)serialQueueProvider
{
  return (id)objc_msgSend(&__block_literal_global_5, "copy");
}

dispatch_queue_t __41__AVTCoreEnvironment_serialQueueProvider__block_invoke(uint64_t a1, const char *a2)
{
  NSObject *v3;
  dispatch_queue_t v4;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = dispatch_queue_create(a2, v3);

  return v4;
}

+ (id)storeLocation
{
  return (id)objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", CFSTR("/var/mobile/Library/Avatar"));
}

+ (id)imageStoreLocation
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "storeLocation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByAppendingPathComponent:", CFSTR("Images"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)imageCacheStoreLocationWithError:(id *)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v8;

  v3 = objc_alloc_init(MEMORY[0x24BDD1580]);
  v8 = 0;
  objc_msgSend(v3, "URLForDirectory:inDomain:appropriateForURL:create:error:", 13, 1, 0, 1, &v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = v4;
    objc_msgSend(v4, "URLByAppendingPathComponent:", CFSTR("Animoji"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)stickerImageStoreLocation
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "storeLocation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByAppendingPathComponent:", CFSTR("Stickers"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSURL)storeLocation
{
  AVTCoreEnvironment *v2;
  NSURL *storeLocation;
  void *v4;
  uint64_t v5;
  NSURL *v6;
  NSURL *v7;

  v2 = self;
  objc_sync_enter(v2);
  storeLocation = v2->_storeLocation;
  if (!storeLocation)
  {
    objc_msgSend((id)objc_opt_class(), "storeLocation");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "copy");
    v6 = v2->_storeLocation;
    v2->_storeLocation = (NSURL *)v5;

    storeLocation = v2->_storeLocation;
  }
  v7 = storeLocation;
  objc_sync_exit(v2);

  return v7;
}

- (NSURL)imageStoreLocation
{
  AVTCoreEnvironment *v2;
  NSURL *imageStoreLocation;
  void *v4;
  uint64_t v5;
  NSURL *v6;
  NSURL *v7;

  v2 = self;
  objc_sync_enter(v2);
  imageStoreLocation = v2->_imageStoreLocation;
  if (!imageStoreLocation)
  {
    objc_msgSend((id)objc_opt_class(), "imageStoreLocation");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "copy");
    v6 = v2->_imageStoreLocation;
    v2->_imageStoreLocation = (NSURL *)v5;

    imageStoreLocation = v2->_imageStoreLocation;
  }
  v7 = imageStoreLocation;
  objc_sync_exit(v2);

  return v7;
}

- (NSURL)imageCacheStoreLocation
{
  void *v3;
  AVTCoreEnvironment *v4;
  NSURL *imageCacheStoreLocation;
  void *v6;
  id v7;
  uint64_t v8;
  NSURL *v9;
  void *v10;
  NSURL *v11;
  id v13;

  -[AVTCoreEnvironment logger](self, "logger");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = self;
  objc_sync_enter(v4);
  imageCacheStoreLocation = v4->_imageCacheStoreLocation;
  if (!imageCacheStoreLocation)
  {
    v13 = 0;
    objc_msgSend((id)objc_opt_class(), "imageCacheStoreLocationWithError:", &v13);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v13;
    v8 = objc_msgSend(v6, "copy");
    v9 = v4->_imageCacheStoreLocation;
    v4->_imageCacheStoreLocation = (NSURL *)v8;

    if (!v4->_imageCacheStoreLocation)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Can't get image cache location %@"), v7);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "logFileSystemError:", v10);

    }
    imageCacheStoreLocation = v4->_imageCacheStoreLocation;
  }
  v11 = imageCacheStoreLocation;
  objc_sync_exit(v4);

  return v11;
}

- (NSURL)stickerImageStoreLocation
{
  AVTCoreEnvironment *v2;
  NSURL *stickerImageStoreLocation;
  void *v4;
  uint64_t v5;
  NSURL *v6;
  NSURL *v7;

  v2 = self;
  objc_sync_enter(v2);
  stickerImageStoreLocation = v2->_stickerImageStoreLocation;
  if (!stickerImageStoreLocation)
  {
    objc_msgSend((id)objc_opt_class(), "stickerImageStoreLocation");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "copy");
    v6 = v2->_stickerImageStoreLocation;
    v2->_stickerImageStoreLocation = (NSURL *)v5;

    stickerImageStoreLocation = v2->_stickerImageStoreLocation;
  }
  v7 = stickerImageStoreLocation;
  objc_sync_exit(v2);

  return v7;
}

- (AVTUILogger)logger
{
  return self->_logger;
}

- (AVTBlockScheduler)scheduler
{
  return self->_scheduler;
}

- (id)serialQueueProvider
{
  return self->_serialQueueProvider;
}

- (id)lockProvider
{
  return self->_lockProvider;
}

- (OS_dispatch_queue)backgroundQueue
{
  return self->_backgroundQueue;
}

- (NSNotificationCenter)notificationCenter
{
  return self->_notificationCenter;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_storeStrong((id *)&self->_backgroundQueue, 0);
  objc_storeStrong(&self->_lockProvider, 0);
  objc_storeStrong(&self->_serialQueueProvider, 0);
  objc_storeStrong((id *)&self->_scheduler, 0);
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_imageCacheStoreLocation, 0);
  objc_storeStrong((id *)&self->_stickerImageStoreLocation, 0);
  objc_storeStrong((id *)&self->_imageStoreLocation, 0);
  objc_storeStrong((id *)&self->_storeLocation, 0);
}

@end
