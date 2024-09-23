@implementation OnBoardingKitLibrary

void *__OnBoardingKitLibrary_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/OnBoardingKit.framework/OnBoardingKit", 2);
  OnBoardingKitLibrary_sLib = (uint64_t)result;
  return result;
}

@end
