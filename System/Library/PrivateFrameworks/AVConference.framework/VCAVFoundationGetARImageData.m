@implementation VCAVFoundationGetARImageData

Class __VCAVFoundationGetARImageData_block_invoke()
{
  Class result;

  if (VCAVFoundationLoadARKit_loadPredicate != -1)
    dispatch_once(&VCAVFoundationLoadARKit_loadPredicate, &__block_literal_global_50);
  result = objc_getClass("ARImageData");
  VCAVFoundationGetARImageData_cls = (uint64_t)result;
  return result;
}

@end
