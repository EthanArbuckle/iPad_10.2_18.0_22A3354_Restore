@implementation DataCollectionServicesLibrary

void *__DataCollectionServicesLibrary_block_invoke()
{
  void *result;

  result = dlopen("/AppleInternal/Library/Frameworks/DataCollectionServices.framework/DataCollectionServices", 2);
  DataCollectionServicesLibrary_sLib = (uint64_t)result;
  return result;
}

void *__DataCollectionServicesLibrary_block_invoke_40556()
{
  void *result;

  result = dlopen("/AppleInternal/Library/Frameworks/DataCollectionServices.framework/DataCollectionServices", 2);
  DataCollectionServicesLibrary_sLib_40554 = (uint64_t)result;
  return result;
}

@end
