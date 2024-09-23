@implementation CDContextualKeyPath

Class __init_CDContextualKeyPath_block_invoke()
{
  Class result;

  if (CoreDuetContextLibrary_sOnce != -1)
    dispatch_once(&CoreDuetContextLibrary_sOnce, &__block_literal_global_13);
  result = objc_getClass("_CDContextualKeyPath");
  class_CDContextualKeyPath = (uint64_t)result;
  get_CDContextualKeyPathClass = _CDContextualKeyPathFunction;
  return result;
}

@end
