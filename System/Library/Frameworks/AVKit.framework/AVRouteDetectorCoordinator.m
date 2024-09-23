@implementation AVRouteDetectorCoordinator

- (void)setRouteDetectionEnabled:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;

  if (self->_routeDetectionEnabled != a3)
  {
    v3 = a3;
    self->_routeDetectionEnabled = a3;
    v4 = (void *)objc_opt_class();
    if (v3)
      objc_msgSend(v4, "beginDetectingRoutes");
    else
      objc_msgSend(v4, "endDetectingRoutes");
  }
}

- (BOOL)multipleRoutesDetected
{
  return objc_msgSend((id)objc_opt_class(), "multipleRoutesDetected");
}

+ (BOOL)multipleRoutesDetected
{
  NSObject *v2;
  uint8_t v4[16];

  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    _AVLog();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v4 = 0;
      _os_log_error_impl(&dword_1AC4B1000, v2, OS_LOG_TYPE_ERROR, "Only access this property on the main queue!", v4, 2u);
    }

  }
  return AVRouteDetectorCoordinatorMultipleRoutesDetected;
}

+ (void)beginDetectingRoutes
{
  NSObject *v3;
  _QWORD block[5];

  objc_msgSend(a1, "routeDetectorCoordinatorQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__AVRouteDetectorCoordinator_beginDetectingRoutes__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  dispatch_async(v3, block);

}

+ (id)routeDetectorCoordinatorQueue
{
  if (routeDetectorCoordinatorQueue_onceToken != -1)
    dispatch_once(&routeDetectorCoordinatorQueue_onceToken, &__block_literal_global_107);
  return (id)routeDetectorCoordinatorQueue_routeDetectorCoordinatorQueue;
}

void __50__AVRouteDetectorCoordinator_beginDetectingRoutes__block_invoke(uint64_t a1)
{
  id v2;

  if (!AVRouteDetectorCoordinatorBeginDetectingRoutesCount++)
  {
    objc_msgSend(*(id *)(a1 + 32), "sharedSystemRouteDetector");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setRouteDetectionEnabled:", 1);

  }
}

+ (id)sharedSystemRouteDetector
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__AVRouteDetectorCoordinator_sharedSystemRouteDetector__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedSystemRouteDetector_onceToken != -1)
    dispatch_once(&sharedSystemRouteDetector_onceToken, block);
  return (id)sharedSystemRouteDetector_sharedSystemRouteDetector;
}

void __59__AVRouteDetectorCoordinator_routeDetectorCoordinatorQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("com.apple.avkit.routeDetectorCoordinatorQueue", v2);
  v1 = (void *)routeDetectorCoordinatorQueue_routeDetectorCoordinatorQueue;
  routeDetectorCoordinatorQueue_routeDetectorCoordinatorQueue = (uint64_t)v0;

}

void __55__AVRouteDetectorCoordinator_sharedSystemRouteDetector__block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  _QWORD v7[5];

  v2 = objc_alloc_init(MEMORY[0x1E0C8B358]);
  v3 = (void *)sharedSystemRouteDetector_sharedSystemRouteDetector;
  sharedSystemRouteDetector_sharedSystemRouteDetector = (uint64_t)v2;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *MEMORY[0x1E0C8ACC8];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __55__AVRouteDetectorCoordinator_sharedSystemRouteDetector__block_invoke_2;
  v7[3] = &__block_descriptor_40_e24_v16__0__NSNotification_8l;
  v7[4] = *(_QWORD *)(a1 + 32);
  v6 = (id)objc_msgSend(v4, "addObserverForName:object:queue:usingBlock:", v5, sharedSystemRouteDetector_sharedSystemRouteDetector, 0, v7);

}

- (void)dealloc
{
  objc_super v3;

  -[AVRouteDetectorCoordinator setRouteDetectionEnabled:](self, "setRouteDetectionEnabled:", 0);
  v3.receiver = self;
  v3.super_class = (Class)AVRouteDetectorCoordinator;
  -[AVRouteDetectorCoordinator dealloc](&v3, sel_dealloc);
}

- (BOOL)isRouteDetectionEnabled
{
  return self->_routeDetectionEnabled;
}

+ (void)endDetectingRoutes
{
  NSObject *v3;
  _QWORD block[5];

  objc_msgSend(a1, "routeDetectorCoordinatorQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__AVRouteDetectorCoordinator_endDetectingRoutes__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  dispatch_async(v3, block);

}

+ (void)updateMultipleRoutesDetected
{
  NSObject *v3;
  _QWORD block[5];

  objc_msgSend(a1, "routeDetectorCoordinatorQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__AVRouteDetectorCoordinator_updateMultipleRoutesDetected__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  dispatch_async(v3, block);

}

+ (void)setMultipleRoutesDetected:(BOOL)a3
{
  _QWORD block[4];
  BOOL v4;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__AVRouteDetectorCoordinator_setMultipleRoutesDetected___block_invoke;
  block[3] = &__block_descriptor_33_e5_v8__0l;
  v4 = a3;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __56__AVRouteDetectorCoordinator_setMultipleRoutesDetected___block_invoke(uint64_t a1)
{
  id v1;

  if (*(unsigned __int8 *)(a1 + 32) != AVRouteDetectorCoordinatorMultipleRoutesDetected)
  {
    AVRouteDetectorCoordinatorMultipleRoutesDetected = *(_BYTE *)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v1 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "postNotificationName:object:", CFSTR("AVRouteDetectorCoordinatorMultipleRoutesDetectedDidChangeNotification"), 0);

  }
}

void __58__AVRouteDetectorCoordinator_updateMultipleRoutesDetected__block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  if (AVRouteDetectorCoordinatorBeginDetectingRoutesCount >= 1)
  {
    v1 = *(void **)(a1 + 32);
    objc_msgSend(v1, "sharedSystemRouteDetector");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "setMultipleRoutesDetected:", objc_msgSend(v2, "multipleRoutesDetected"));

  }
}

void __48__AVRouteDetectorCoordinator_endDetectingRoutes__block_invoke(uint64_t a1)
{
  id v1;

  if (!--AVRouteDetectorCoordinatorBeginDetectingRoutesCount)
  {
    objc_msgSend(*(id *)(a1 + 32), "sharedSystemRouteDetector");
    v1 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "setRouteDetectionEnabled:", 0);

  }
}

uint64_t __55__AVRouteDetectorCoordinator_sharedSystemRouteDetector__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateMultipleRoutesDetected");
}

@end
