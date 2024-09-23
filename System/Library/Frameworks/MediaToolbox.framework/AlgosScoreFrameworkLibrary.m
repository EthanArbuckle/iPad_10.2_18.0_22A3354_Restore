@implementation AlgosScoreFrameworkLibrary

void *__AlgosScoreFrameworkLibrary_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/AlgosScoreFramework.framework/AlgosScoreFramework", 2);
  AlgosScoreFrameworkLibrary_sLib = (uint64_t)result;
  return result;
}

@end
