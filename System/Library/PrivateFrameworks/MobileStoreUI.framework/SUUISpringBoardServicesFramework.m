@implementation SUUISpringBoardServicesFramework

void *__SUUISpringBoardServicesFramework_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/SpringBoardServices.framework/SpringBoardServices", 1);
  SUUISpringBoardServicesFramework_sHandle = (uint64_t)result;
  return result;
}

@end
