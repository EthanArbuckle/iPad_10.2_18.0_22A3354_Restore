@implementation DKEventStream

Class __init_DKEventStream_block_invoke()
{
  Class result;

  if (CoreDuetLibrary_sOnce != -1)
    dispatch_once(&CoreDuetLibrary_sOnce, &__block_literal_global_9);
  result = objc_getClass("_DKEventStream");
  class_DKEventStream = (uint64_t)result;
  get_DKEventStreamClass = _DKEventStreamFunction;
  return result;
}

@end
