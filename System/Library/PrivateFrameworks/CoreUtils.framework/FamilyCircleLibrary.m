@implementation FamilyCircleLibrary

void *__FamilyCircleLibrary_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/FamilyCircle.framework/FamilyCircle", 2);
  FamilyCircleLibrary_sLib = (uint64_t)result;
  return result;
}

@end
