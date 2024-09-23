@implementation CoreGraphicsLibrary

void *__CoreGraphicsLibrary_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/Frameworks/CoreGraphics.framework/CoreGraphics", 2);
  CoreGraphicsLibrary_sLib = (uint64_t)result;
  return result;
}

void *__CoreGraphicsLibrary_block_invoke_409()
{
  void *result;

  result = dlopen("/System/Library/Frameworks/CoreGraphics.framework/CoreGraphics", 2);
  CoreGraphicsLibrary_sLib_407 = (uint64_t)result;
  return result;
}

@end
