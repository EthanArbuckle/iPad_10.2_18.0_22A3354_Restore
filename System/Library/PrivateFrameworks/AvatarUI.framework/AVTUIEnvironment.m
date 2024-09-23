@implementation AVTUIEnvironment

+ (id)createQueueWithQoSClass:(unsigned int)a3 label:(const char *)a4
{
  NSObject *v6;
  NSObject *v7;
  dispatch_queue_t v8;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_queue_attr_make_with_qos_class(v6, (dispatch_qos_class_t)a3, 0);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = dispatch_queue_create(a4, v7);

  return v8;
}

- (NSURL)imageCacheStoreLocation
{
  void *v2;
  void *v3;

  -[AVTUIEnvironment coreEnvironment](self, "coreEnvironment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "imageCacheStoreLocation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v3;
}

+ (id)defaultEnvironment
{
  if (defaultEnvironment_onceToken != -1)
    dispatch_once(&defaultEnvironment_onceToken, &__block_literal_global_5);
  return (id)defaultEnvironment_sInstance;
}

- (AVTUIEnvironment)initWithCoreEnvironment:(id)a3
{
  return -[AVTUIEnvironment initWithCoreEnvironment:platform:](self, "initWithCoreEnvironment:platform:", a3, 0);
}

- (AVTUIEnvironment)initWithCoreEnvironment:(id)a3 platform:(unint64_t)a4
{
  id v7;
  AVTUIEnvironment *v8;
  AVTUIEnvironment *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  CGFloat v14;
  CGFloat v15;
  void *v16;
  double v17;
  void *v18;
  AVTDeviceResourceManager *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  AVTDeviceResourceManager *deviceResourceManager;
  uint64_t v24;
  OS_dispatch_queue *backgroundQueue;
  uint64_t v26;
  OS_dispatch_queue *backgroundRenderingQueue;
  uint64_t v28;
  OS_dispatch_queue *backgroundEncodingQueue;
  objc_super v31;

  v7 = a3;
  v31.receiver = self;
  v31.super_class = (Class)AVTUIEnvironment;
  v8 = -[AVTUIEnvironment init](&v31, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_coreEnvironment, a3);
    v9->_platform = a4;
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v9->_deviceIsPad = objc_msgSend(v10, "userInterfaceIdiom") == 1;

    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v9->_deviceIsMac = objc_msgSend(v11, "userInterfaceIdiom") == 5;

    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v9->_deviceIsVision = objc_msgSend(v12, "userInterfaceIdiom") == 6;

    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "bounds");
    v9->_mainScreenSize.width = v14;
    v9->_mainScreenSize.height = v15;

    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "scale");
    v9->_mainScreenScale = v17;

    objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v9->_userInterfaceLayoutDirection = objc_msgSend(v18, "userInterfaceLayoutDirection");

    v19 = [AVTDeviceResourceManager alloc];
    objc_msgSend(v7, "logger");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "lockProvider");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = -[AVTDeviceResourceManager initWithLogger:lockProvider:](v19, "initWithLogger:lockProvider:", v20, v21);
    deviceResourceManager = v9->_deviceResourceManager;
    v9->_deviceResourceManager = (AVTDeviceResourceManager *)v22;

    v9->_actionAnimationsMultiplier = 1.0;
    objc_msgSend((id)objc_opt_class(), "createQueueWithQoSClass:label:", 21, "com.apple.AvatarUI.AVTUIEnvironment.backgroundQueue");
    v24 = objc_claimAutoreleasedReturnValue();
    backgroundQueue = v9->_backgroundQueue;
    v9->_backgroundQueue = (OS_dispatch_queue *)v24;

    objc_msgSend((id)objc_opt_class(), "createQueueWithQoSClass:label:", 21, "com.apple.AvatarUI.AVTUIEnvironment.backgroundRenderingQueue");
    v26 = objc_claimAutoreleasedReturnValue();
    backgroundRenderingQueue = v9->_backgroundRenderingQueue;
    v9->_backgroundRenderingQueue = (OS_dispatch_queue *)v26;

    objc_msgSend((id)objc_opt_class(), "createQueueWithQoSClass:label:", 21, "com.apple.AvatarUI.AVTUIEnvironment.backgroundEncodingQueue");
    v28 = objc_claimAutoreleasedReturnValue();
    backgroundEncodingQueue = v9->_backgroundEncodingQueue;
    v9->_backgroundEncodingQueue = (OS_dispatch_queue *)v28;

  }
  return v9;
}

void __38__AVTUIEnvironment_defaultEnvironment__block_invoke()
{
  AVTUIEnvironment *v0;
  uint64_t v1;
  void *v2;
  id v3;

  v0 = [AVTUIEnvironment alloc];
  objc_msgSend(MEMORY[0x1E0D00860], "defaultEnvironment");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v1 = -[AVTUIEnvironment initWithCoreEnvironment:](v0, "initWithCoreEnvironment:", v3);
  v2 = (void *)defaultEnvironment_sInstance;
  defaultEnvironment_sInstance = v1;

}

+ (id)createFunCamEnvironment
{
  AVTUIEnvironment *v2;
  void *v3;
  AVTUIEnvironment *v4;

  v2 = [AVTUIEnvironment alloc];
  objc_msgSend(MEMORY[0x1E0D00860], "defaultEnvironment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[AVTUIEnvironment initWithCoreEnvironment:](v2, "initWithCoreEnvironment:", v3);

  return v4;
}

- (void)flushResourcesForEnteringBackground
{
  AVTImageCache *inMemoryImageCache;

  inMemoryImageCache = self->_inMemoryImageCache;
  self->_inMemoryImageCache = 0;

}

- (AVTCoreModel)editorCoreModel
{
  AVTUIEnvironment *v2;
  AVTCoreModel *editorCoreModel;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  AVTCoreModel *v8;
  AVTCoreModel *v9;

  v2 = self;
  objc_sync_enter(v2);
  editorCoreModel = v2->_editorCoreModel;
  if (!editorCoreModel)
  {
    v4 = (void *)objc_opt_class();
    v5 = -[AVTUIEnvironment platform](v2, "platform");
    -[AVTUIEnvironment logger](v2, "logger");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "createEditorCoreModelForPlatform:withLogger:", v5, v6);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = v2->_editorCoreModel;
    v2->_editorCoreModel = (AVTCoreModel *)v7;

    editorCoreModel = v2->_editorCoreModel;
  }
  v9 = editorCoreModel;
  objc_sync_exit(v2);

  return v9;
}

- (AVTAvatarConfigurationImageRenderer)renderer
{
  AVTUIEnvironment *v2;
  AVTAvatarConfigurationImageRenderer *renderer;
  AVTAvatarConfigurationImageRenderer *v4;
  void *v5;
  uint64_t v6;
  AVTAvatarConfigurationImageRenderer *v7;
  AVTAvatarConfigurationImageRenderer *v8;

  v2 = self;
  objc_sync_enter(v2);
  renderer = v2->_renderer;
  if (!renderer)
  {
    v4 = [AVTAvatarConfigurationImageRenderer alloc];
    -[AVTUIEnvironment editorThumbnailAvatar](v2, "editorThumbnailAvatar");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[AVTAvatarConfigurationImageRenderer initWithEnvironment:avatar:](v4, "initWithEnvironment:avatar:", v2, v5);
    v7 = v2->_renderer;
    v2->_renderer = (AVTAvatarConfigurationImageRenderer *)v6;

    renderer = v2->_renderer;
  }
  v8 = renderer;
  objc_sync_exit(v2);

  return v8;
}

- (AVTAvatarRemoteImageRenderer)remoteRenderer
{
  AVTUIEnvironment *v2;
  AVTAvatarRemoteImageRenderer *remoteRenderer;
  AVTAvatarRemoteImageRenderer *v4;
  AVTAvatarRemoteImageRenderer *v5;
  AVTAvatarRemoteImageRenderer *v6;

  v2 = self;
  objc_sync_enter(v2);
  remoteRenderer = v2->_remoteRenderer;
  if (!remoteRenderer)
  {
    v4 = -[AVTAvatarRemoteImageRenderer initWithEnvironment:]([AVTAvatarRemoteImageRenderer alloc], "initWithEnvironment:", v2);
    v5 = v2->_remoteRenderer;
    v2->_remoteRenderer = v4;

    remoteRenderer = v2->_remoteRenderer;
  }
  v6 = remoteRenderer;
  objc_sync_exit(v2);

  return v6;
}

- (AVTMemoji)editorThumbnailAvatar
{
  AVTUIEnvironment *v2;
  AVTMemoji *editorThumbnailAvatar;
  uint64_t v4;
  AVTMemoji *v5;
  AVTMemoji *v6;

  v2 = self;
  objc_sync_enter(v2);
  editorThumbnailAvatar = v2->_editorThumbnailAvatar;
  if (!editorThumbnailAvatar)
  {
    objc_msgSend(MEMORY[0x1E0D00670], "memoji");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = v2->_editorThumbnailAvatar;
    v2->_editorThumbnailAvatar = (AVTMemoji *)v4;

    editorThumbnailAvatar = v2->_editorThumbnailAvatar;
  }
  v6 = editorThumbnailAvatar;
  objc_sync_exit(v2);

  return v6;
}

- (AVTImageCache)inMemoryImageCache
{
  AVTUIEnvironment *v2;
  AVTImageCache *inMemoryImageCache;
  AVTInMemoryImageCache *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  AVTImageCache *v8;
  AVTImageCache *v9;

  v2 = self;
  objc_sync_enter(v2);
  inMemoryImageCache = v2->_inMemoryImageCache;
  if (!inMemoryImageCache)
  {
    v4 = [AVTInMemoryImageCache alloc];
    -[AVTUIEnvironment lockProvider](v2, "lockProvider");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTUIEnvironment logger](v2, "logger");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[AVTInMemoryImageCache initWithLockProvider:logger:](v4, "initWithLockProvider:logger:", v5, v6);
    v8 = v2->_inMemoryImageCache;
    v2->_inMemoryImageCache = (AVTImageCache *)v7;

    inMemoryImageCache = v2->_inMemoryImageCache;
  }
  v9 = inMemoryImageCache;
  objc_sync_exit(v2);

  return v9;
}

- (AVTUsageTrackingSession)usageTrackingSession
{
  void *v3;
  void *v4;
  void *v5;
  AVTUIEnvironment *v6;
  AVTUsageTrackingSession *usageTrackingSession;
  uint64_t v8;
  AVTUsageTrackingSession *v9;
  AVTUsageTrackingSession *v10;

  -[AVTUIEnvironment editorCoreModel](self, "editorCoreModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTUIEnvironment serialQueueProvider](self, "serialQueueProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTUIEnvironment logger](self, "logger");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = self;
  objc_sync_enter(v6);
  usageTrackingSession = v6->_usageTrackingSession;
  if (!usageTrackingSession)
  {
    objc_msgSend((id)objc_opt_class(), "createUsageTrackingSessionWithCoreModel:serialQueueProvider:logger:", v3, v4, v5);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = v6->_usageTrackingSession;
    v6->_usageTrackingSession = (AVTUsageTrackingSession *)v8;

    usageTrackingSession = v6->_usageTrackingSession;
  }
  v10 = usageTrackingSession;
  objc_sync_exit(v6);

  return v10;
}

- (NSUserDefaults)userDefaults
{
  return (NSUserDefaults *)objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
}

+ (id)createEditorCoreModelForPlatform:(unint64_t)a3 withLogger:(id)a4
{
  return +[AVTEditingModelBuilder buildCoreModelFromPlistForPlatform:withLogger:](AVTEditingModelBuilder, "buildCoreModelFromPlistForPlatform:withLogger:", a3, a4);
}

+ (id)createUsageTrackingSessionWithCoreModel:(id)a3 serialQueueProvider:(id)a4 logger:(id)a5
{
  id v7;
  id v8;
  id v9;
  AVTUsageTrackingSession *v10;
  void *v11;
  AVTUsageTrackingSession *v12;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = [AVTUsageTrackingSession alloc];
  +[AVTUsageTrackingSession defaultRecordTransformerForCoreModel:](AVTUsageTrackingSession, "defaultRecordTransformerForCoreModel:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = -[AVTUsageTrackingSession initWithSerialQueueProvider:recordTransformer:logger:](v10, "initWithSerialQueueProvider:recordTransformer:logger:", v8, v11, v7);
  return v12;
}

- (AVTUILogger)logger
{
  void *v2;
  void *v3;

  -[AVTUIEnvironment coreEnvironment](self, "coreEnvironment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "logger");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (AVTUILogger *)v3;
}

- (id)serialQueueProvider
{
  void *v2;
  void *v3;

  -[AVTUIEnvironment coreEnvironment](self, "coreEnvironment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "serialQueueProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)lockProvider
{
  void *v2;
  void *v3;

  -[AVTUIEnvironment coreEnvironment](self, "coreEnvironment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lockProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSURL)storeLocation
{
  void *v2;
  void *v3;

  -[AVTUIEnvironment coreEnvironment](self, "coreEnvironment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "storeLocation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v3;
}

- (NSURL)imageStoreLocation
{
  void *v2;
  void *v3;

  -[AVTUIEnvironment coreEnvironment](self, "coreEnvironment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "imageStoreLocation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v3;
}

- (NSURL)stickerImageStoreLocation
{
  void *v2;
  void *v3;

  -[AVTUIEnvironment coreEnvironment](self, "coreEnvironment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stickerImageStoreLocation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v3;
}

- (NSNotificationCenter)notificationCenter
{
  void *v2;
  void *v3;

  -[AVTUIEnvironment coreEnvironment](self, "coreEnvironment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "notificationCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNotificationCenter *)v3;
}

- (AVTCoreEnvironment)coreEnvironment
{
  return self->_coreEnvironment;
}

- (unint64_t)platform
{
  return self->_platform;
}

- (double)mainScreenScale
{
  return self->_mainScreenScale;
}

- (CGSize)mainScreenSize
{
  double width;
  double height;
  CGSize result;

  width = self->_mainScreenSize.width;
  height = self->_mainScreenSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (int64_t)userInterfaceLayoutDirection
{
  return self->_userInterfaceLayoutDirection;
}

- (BOOL)deviceIsPad
{
  return self->_deviceIsPad;
}

- (BOOL)deviceIsMac
{
  return self->_deviceIsMac;
}

- (BOOL)deviceIsVision
{
  return self->_deviceIsVision;
}

- (OS_dispatch_queue)backgroundQueue
{
  return self->_backgroundQueue;
}

- (OS_dispatch_queue)backgroundRenderingQueue
{
  return self->_backgroundRenderingQueue;
}

- (OS_dispatch_queue)backgroundEncodingQueue
{
  return self->_backgroundEncodingQueue;
}

- (AVTDeviceResourceManager)deviceResourceManager
{
  return self->_deviceResourceManager;
}

- (double)actionAnimationsMultiplier
{
  return self->_actionAnimationsMultiplier;
}

- (void)setActionAnimationsMultiplier:(double)a3
{
  self->_actionAnimationsMultiplier = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceResourceManager, 0);
  objc_storeStrong((id *)&self->_backgroundEncodingQueue, 0);
  objc_storeStrong((id *)&self->_backgroundRenderingQueue, 0);
  objc_storeStrong((id *)&self->_backgroundQueue, 0);
  objc_storeStrong((id *)&self->_coreEnvironment, 0);
  objc_storeStrong((id *)&self->_usageTrackingSession, 0);
  objc_storeStrong((id *)&self->_inMemoryImageCache, 0);
  objc_storeStrong((id *)&self->_editorThumbnailAvatar, 0);
  objc_storeStrong((id *)&self->_remoteRenderer, 0);
  objc_storeStrong((id *)&self->_renderer, 0);
  objc_storeStrong((id *)&self->_editorCoreModel, 0);
}

@end
