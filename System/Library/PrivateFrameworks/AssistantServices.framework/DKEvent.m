@implementation DKEvent

Class __init_DKEvent_block_invoke()
{
  Class result;

  if (CoreDuetLibrary_sOnce != -1)
    dispatch_once(&CoreDuetLibrary_sOnce, &__block_literal_global_9);
  result = objc_getClass("_DKEvent");
  class_DKEvent = (uint64_t)result;
  get_DKEventClass = _DKEventFunction;
  return result;
}

@end
