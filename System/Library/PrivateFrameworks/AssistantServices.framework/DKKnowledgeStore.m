@implementation DKKnowledgeStore

Class __init_DKKnowledgeStore_block_invoke()
{
  Class result;

  if (CoreDuetLibrary_sOnce != -1)
    dispatch_once(&CoreDuetLibrary_sOnce, &__block_literal_global_9);
  result = objc_getClass("_DKKnowledgeStore");
  class_DKKnowledgeStore = (uint64_t)result;
  get_DKKnowledgeStoreClass = _DKKnowledgeStoreFunction;
  return result;
}

Class __init_DKKnowledgeStore_block_invoke_18993()
{
  Class result;

  CoreDuetLibrary();
  result = objc_getClass("_DKKnowledgeStore");
  class_DKKnowledgeStore_18992 = (uint64_t)result;
  if (!result)
    __assert_rtn("init_DKKnowledgeStore_block_invoke", "AFOpportuneSpeakingModelFeedback.m", 22, "class_DKKnowledgeStore");
  get_DKKnowledgeStoreClass_18986 = _DKKnowledgeStoreFunction_18987;
  return result;
}

@end
