@implementation DKSystemEventStreams

Class __init_DKSystemEventStreams_block_invoke()
{
  Class result;

  if (CoreDuetLibrary_sOnce != -1)
    dispatch_once(&CoreDuetLibrary_sOnce, &__block_literal_global_9);
  result = objc_getClass("_DKSystemEventStreams");
  class_DKSystemEventStreams = (uint64_t)result;
  get_DKSystemEventStreamsClass = _DKSystemEventStreamsFunction;
  return result;
}

Class __init_DKSystemEventStreams_block_invoke_18980()
{
  Class result;

  CoreDuetLibrary();
  result = objc_getClass("_DKSystemEventStreams");
  class_DKSystemEventStreams_18979 = (uint64_t)result;
  if (!result)
    __assert_rtn("init_DKSystemEventStreams_block_invoke", "AFOpportuneSpeakingModelFeedback.m", 24, "class_DKSystemEventStreams");
  get_DKSystemEventStreamsClass_18937 = _DKSystemEventStreamsFunction_18938;
  return result;
}

@end
