@implementation CIContext(IconServicesAdditions)

+ (id)_IS_sharedIconCompositorContext
{
  if (_IS_sharedIconCompositorContext_onceToken != -1)
    dispatch_once(&_IS_sharedIconCompositorContext_onceToken, &__block_literal_global_12);
  return (id)_IS_sharedIconCompositorContext_sharedContext;
}

@end
