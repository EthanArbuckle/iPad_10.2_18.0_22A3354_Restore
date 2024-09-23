@implementation DKEventQuery

Class __init_DKEventQuery_block_invoke()
{
  Class result;

  if (CoreDuetLibrary_sOnce != -1)
    dispatch_once(&CoreDuetLibrary_sOnce, &__block_literal_global_9);
  result = objc_getClass("_DKEventQuery");
  class_DKEventQuery = (uint64_t)result;
  get_DKEventQueryClass = _DKEventQueryFunction;
  return result;
}

Class __init_DKEventQuery_block_invoke_18969()
{
  Class result;

  CoreDuetLibrary();
  result = objc_getClass("_DKEventQuery");
  class_DKEventQuery_18968 = (uint64_t)result;
  if (!result)
    __assert_rtn("init_DKEventQuery_block_invoke", "AFOpportuneSpeakingModelFeedback.m", 20, "class_DKEventQuery");
  get_DKEventQueryClass_18946 = _DKEventQueryFunction_18947;
  return result;
}

@end
