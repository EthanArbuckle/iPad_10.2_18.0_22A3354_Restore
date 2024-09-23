@implementation RapportLibrary

void *__RapportLibrary_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/Rapport.framework/Rapport", 2);
  RapportLibrary_sLib = (uint64_t)result;
  return result;
}

void *__RapportLibrary_block_invoke_5722()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/Rapport.framework/Rapport", 2);
  RapportLibrary_sLib_5723 = (uint64_t)result;
  return result;
}

@end
