@implementation __NSHostExtraIvars

- (__NSHostExtraIvars)init
{
  __NSHostExtraIvars *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)__NSHostExtraIvars;
  v2 = -[__NSHostExtraIvars init](&v4, sel_init);
  if (v2)
  {
    v2->cacheAccessQueue = (OS_dispatch_queue *)dispatch_queue_create(0, 0);
    v2->resolveQueue = (OS_dispatch_queue *)dispatch_queue_create(0, 0);
    v2->callbackQueue = (OS_dispatch_queue *)dispatch_queue_create(0, 0);
    v2->startedResolving = 0;
  }
  return v2;
}

- (void)dealloc
{
  NSObject *cacheAccessQueue;
  NSObject *resolveQueue;
  NSObject *callbackQueue;
  objc_super v6;

  cacheAccessQueue = self->cacheAccessQueue;
  if (cacheAccessQueue)
  {
    dispatch_release(cacheAccessQueue);
    self->cacheAccessQueue = 0;
  }
  resolveQueue = self->resolveQueue;
  if (resolveQueue)
  {
    dispatch_release(resolveQueue);
    self->resolveQueue = 0;
  }
  callbackQueue = self->callbackQueue;
  if (callbackQueue)
  {
    dispatch_release(callbackQueue);
    self->callbackQueue = 0;
  }
  v6.receiver = self;
  v6.super_class = (Class)__NSHostExtraIvars;
  -[__NSHostExtraIvars dealloc](&v6, sel_dealloc);
}

@end
