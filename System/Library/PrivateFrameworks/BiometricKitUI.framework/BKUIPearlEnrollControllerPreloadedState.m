@implementation BKUIPearlEnrollControllerPreloadedState

- (void)cacheEntryAnimationImages:(id)a3
{
  NSArray *v4;
  NSArray *cachedEntryAnimationImages;
  BKUIPearlEnrollControllerPreloadedState *obj;

  v4 = (NSArray *)a3;
  obj = self;
  objc_sync_enter(obj);
  cachedEntryAnimationImages = obj->_cachedEntryAnimationImages;
  obj->_cachedEntryAnimationImages = v4;

  objc_sync_exit(obj);
}

- (id)acquireCachedEntryAnimationImages
{
  BKUIPearlEnrollControllerPreloadedState *v2;
  NSArray *v3;
  NSArray *cachedEntryAnimationImages;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_cachedEntryAnimationImages;
  cachedEntryAnimationImages = v2->_cachedEntryAnimationImages;
  v2->_cachedEntryAnimationImages = 0;

  objc_sync_exit(v2);
  return v3;
}

- (void)cacheVideoCaptureSession:(id)a3
{
  BKUIPearlVideoCaptureSession *v4;
  BKUIPearlVideoCaptureSession *cachedVideoCaptureSession;
  BKUIPearlEnrollControllerPreloadedState *obj;

  v4 = (BKUIPearlVideoCaptureSession *)a3;
  obj = self;
  objc_sync_enter(obj);
  cachedVideoCaptureSession = obj->_cachedVideoCaptureSession;
  obj->_cachedVideoCaptureSession = v4;

  objc_sync_exit(obj);
}

- (id)acquireCachedVideoCaptureSession
{
  BKUIPearlEnrollControllerPreloadedState *v2;
  BKUIPearlVideoCaptureSession *v3;
  BKUIPearlVideoCaptureSession *cachedVideoCaptureSession;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_cachedVideoCaptureSession;
  cachedVideoCaptureSession = v2->_cachedVideoCaptureSession;
  v2->_cachedVideoCaptureSession = 0;

  objc_sync_exit(v2);
  return v3;
}

- (void)cacheAudioSession:(id)a3
{
  BKUIPearlAudioSession *v4;
  BKUIPearlAudioSession *cachedAudioSession;
  BKUIPearlEnrollControllerPreloadedState *obj;

  v4 = (BKUIPearlAudioSession *)a3;
  obj = self;
  objc_sync_enter(obj);
  cachedAudioSession = obj->_cachedAudioSession;
  obj->_cachedAudioSession = v4;

  objc_sync_exit(obj);
}

- (id)acquireCachedAudioSession
{
  BKUIPearlEnrollControllerPreloadedState *v2;
  BKUIPearlAudioSession *v3;
  BKUIPearlAudioSession *cachedAudioSession;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_cachedAudioSession;
  cachedAudioSession = v2->_cachedAudioSession;
  v2->_cachedAudioSession = 0;

  objc_sync_exit(v2);
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedVideoCaptureSession, 0);
  objc_storeStrong((id *)&self->_cachedAudioSession, 0);
  objc_storeStrong((id *)&self->_cachedEntryAnimationImages, 0);
}

@end
