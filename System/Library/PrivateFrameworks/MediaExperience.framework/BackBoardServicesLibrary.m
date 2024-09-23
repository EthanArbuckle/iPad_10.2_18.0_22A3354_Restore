@implementation BackBoardServicesLibrary

void *__BackBoardServicesLibrary_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/BackBoardServices.framework/BackBoardServices", 2);
  BackBoardServicesLibrary_sLib = (uint64_t)result;
  return result;
}

void *__BackBoardServicesLibrary_block_invoke_0()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/BackBoardServices.framework/BackBoardServices", 2);
  BackBoardServicesLibrary_sLib_0 = (uint64_t)result;
  return result;
}

@end
