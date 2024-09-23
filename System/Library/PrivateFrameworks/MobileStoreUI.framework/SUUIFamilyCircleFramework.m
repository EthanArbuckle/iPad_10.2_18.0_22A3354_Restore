@implementation SUUIFamilyCircleFramework

void *__SUUIFamilyCircleFramework_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/FamilyCircle.framework/FamilyCircle", 1);
  SUUIFamilyCircleFramework_sHandle = (uint64_t)result;
  return result;
}

@end
