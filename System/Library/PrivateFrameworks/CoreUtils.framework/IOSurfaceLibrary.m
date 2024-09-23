@implementation IOSurfaceLibrary

void *__IOSurfaceLibrary_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/IOSurface.framework/IOSurface", 2);
  IOSurfaceLibrary_sLib = (uint64_t)result;
  return result;
}

void *__IOSurfaceLibrary_block_invoke_458()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/IOSurface.framework/IOSurface", 2);
  IOSurfaceLibrary_sLib_456 = (uint64_t)result;
  return result;
}

@end
