@implementation BKSTouchAnnotationController

- (void)postTouchAnnotations:(id)a3
{
  _BKSHIDServicesPostTouchAnnotations(a3);
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_4669 != -1)
    dispatch_once(&sharedInstance_onceToken_4669, &__block_literal_global_4670);
  return (id)sharedInstance_controller;
}

void __46__BKSTouchAnnotationController_sharedInstance__block_invoke()
{
  BKSTouchAnnotationController *v0;
  void *v1;

  v0 = objc_alloc_init(BKSTouchAnnotationController);
  v1 = (void *)sharedInstance_controller;
  sharedInstance_controller = (uint64_t)v0;

}

@end
