@implementation CIContext(IconServicesAdditions)

+ (uint64_t)_MI_sharedIconCompositorContext
{
  if (_MI_sharedIconCompositorContext_onceToken != -1)
    dispatch_once(&_MI_sharedIconCompositorContext_onceToken, &__block_literal_global_0);
  return objc_msgSend((id)_MI_sharedIconCompositorContext_contextCacheClearScheduler, "object");
}

@end
