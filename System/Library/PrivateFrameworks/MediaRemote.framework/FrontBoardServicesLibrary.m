@implementation FrontBoardServicesLibrary

void *__FrontBoardServicesLibrary_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/FrontBoardServices.framework/FrontBoardServices", 2);
  FrontBoardServicesLibrary_sLib = (uint64_t)result;
  return result;
}

@end
