@implementation SUUIPhysicsKitFramework

void *__SUUIPhysicsKitFramework_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/PhysicsKit.framework/PhysicsKit", 1);
  SUUIPhysicsKitFramework_sHandle = (uint64_t)result;
  return result;
}

@end
