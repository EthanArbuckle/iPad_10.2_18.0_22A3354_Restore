@implementation DKQuery

Class __init_DKQuery_block_invoke()
{
  Class result;

  if (CoreDuetLibrary_sOnce != -1)
    dispatch_once(&CoreDuetLibrary_sOnce, &__block_literal_global_9);
  result = objc_getClass("_DKQuery");
  class_DKQuery = (uint64_t)result;
  get_DKQueryClass = _DKQueryFunction;
  return result;
}

Class __init_DKQuery_block_invoke_18975()
{
  Class result;

  CoreDuetLibrary();
  result = objc_getClass("_DKQuery");
  class_DKQuery_18974 = (uint64_t)result;
  if (!result)
    __assert_rtn("init_DKQuery_block_invoke", "AFOpportuneSpeakingModelFeedback.m", 25, "class_DKQuery");
  get_DKQueryClass_18941 = _DKQueryFunction_18942;
  return result;
}

@end
