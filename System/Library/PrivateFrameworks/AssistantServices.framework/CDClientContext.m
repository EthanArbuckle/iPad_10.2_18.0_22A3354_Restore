@implementation CDClientContext

Class __init_CDClientContext_block_invoke()
{
  Class result;

  if (CoreDuetContextLibrary_sOnce != -1)
    dispatch_once(&CoreDuetContextLibrary_sOnce, &__block_literal_global_13);
  result = objc_getClass("_CDClientContext");
  class_CDClientContext = (uint64_t)result;
  get_CDClientContextClass = _CDClientContextFunction;
  return result;
}

@end
