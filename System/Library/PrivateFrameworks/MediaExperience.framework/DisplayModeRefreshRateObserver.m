@implementation DisplayModeRefreshRateObserver

- (DisplayModeRefreshRateObserver)init
{
  DisplayModeRefreshRateObserver *v2;
  NSObject *v3;
  CADisplay *v4;
  NSObject *accessQueue;
  _QWORD v7[5];
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)DisplayModeRefreshRateObserver;
  v2 = -[DisplayModeRefreshRateObserver init](&v8, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v2->_accessQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.coremedia.displaymoderefreshrateobserver", v3);
    v4 = (CADisplay *)objc_msgSend(MEMORY[0x1E0CD2728], "TVOutDisplay");
    v2->_tvOutDisplay = v4;
    -[CADisplay addObserver:forKeyPath:options:context:](v4, "addObserver:forKeyPath:options:context:", v2, CFSTR("currentMode"), 7, 0);
    accessQueue = v2->_accessQueue;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __38__DisplayModeRefreshRateObserver_init__block_invoke;
    v7[3] = &unk_1E3099900;
    v7[4] = v2;
    MXDispatchAsync((uint64_t)"-[DisplayModeRefreshRateObserver init]", (uint64_t)"DisplayModeRefreshRateObserver.m", 48, 0, 0, accessQueue, (uint64_t)v7);
  }
  return v2;
}

uint64_t __38__DisplayModeRefreshRateObserver_init__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t result;
  uint64_t v4;

  v2 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "currentMode");
  result = objc_msgSend(v2, "width");
  if ((_DWORD)result)
  {
    result = objc_msgSend(v2, "height");
    if ((_DWORD)result)
    {
      objc_msgSend(v2, "refreshRate");
      *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) = v4;
      return HDMILatencyMgr_UpdateCurrentRefreshRate(*(double *)(*(_QWORD *)(a1 + 32) + 16));
    }
  }
  return result;
}

- (void)dealloc
{
  NSObject *accessQueue;
  objc_super v4;

  accessQueue = self->_accessQueue;
  if (accessQueue)
    dispatch_release(accessQueue);
  v4.receiver = self;
  v4.super_class = (Class)DisplayModeRefreshRateObserver;
  -[DisplayModeRefreshRateObserver dealloc](&v4, sel_dealloc);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  NSObject *accessQueue;
  objc_super v12;
  _QWORD v13[5];

  if (objc_msgSend(a3, "isEqualToString:", CFSTR("currentMode")))
  {
    accessQueue = self->_accessQueue;
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __81__DisplayModeRefreshRateObserver_observeValueForKeyPath_ofObject_change_context___block_invoke;
    v13[3] = &unk_1E3099900;
    v13[4] = self;
    MXDispatchAsync((uint64_t)"-[DisplayModeRefreshRateObserver observeValueForKeyPath:ofObject:change:context:]", (uint64_t)"DisplayModeRefreshRateObserver.m", 76, 0, 0, accessQueue, (uint64_t)v13);
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)DisplayModeRefreshRateObserver;
    -[DisplayModeRefreshRateObserver observeValueForKeyPath:ofObject:change:context:](&v12, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, a5, a6);
  }
}

uint64_t __81__DisplayModeRefreshRateObserver_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t result;
  uint64_t v4;

  v2 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "currentMode");
  result = objc_msgSend(v2, "width");
  if ((_DWORD)result)
  {
    result = objc_msgSend(v2, "height");
    if ((_DWORD)result)
    {
      objc_msgSend(v2, "refreshRate");
      *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) = v4;
      return HDMILatencyMgr_UpdateCurrentRefreshRate(*(double *)(*(_QWORD *)(a1 + 32) + 16));
    }
  }
  return result;
}

- (int)updateHDMILatencyOnCoreAnimation:(double)a3
{
  void *v3;

  v3 = (void *)-[CADisplay currentMode](self->_tvOutDisplay, "currentMode", a3);
  if (objc_msgSend(v3, "width") && objc_msgSend(v3, "height"))
    return 0;
  else
    return -12782;
}

- (double)readHDMILatencyFromCoreAnimation
{
  void *v2;

  v2 = (void *)-[CADisplay currentMode](self->_tvOutDisplay, "currentMode");
  if (objc_msgSend(v2, "width"))
    objc_msgSend(v2, "height");
  return 0.0;
}

@end
