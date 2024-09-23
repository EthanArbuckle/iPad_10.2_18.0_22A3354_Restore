@implementation CoreImageLibrary

void *__CoreImageLibrary_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/Frameworks/CoreImage.framework/CoreImage", 2);
  CoreImageLibrary_sLib = (uint64_t)result;
  return result;
}

void *__CoreImageLibrary_block_invoke_0()
{
  void *result;

  result = dlopen("/System/Library/Frameworks/CoreImage.framework/CoreImage", 2);
  CoreImageLibrary_sLib_0 = (uint64_t)result;
  return result;
}

@end
