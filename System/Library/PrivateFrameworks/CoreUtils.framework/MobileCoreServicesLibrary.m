@implementation MobileCoreServicesLibrary

void *__MobileCoreServicesLibrary_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/Frameworks/MobileCoreServices.framework/MobileCoreServices", 2);
  MobileCoreServicesLibrary_sLib = (uint64_t)result;
  return result;
}

void *__MobileCoreServicesLibrary_block_invoke_879()
{
  void *result;

  result = dlopen("/System/Library/Frameworks/MobileCoreServices.framework/MobileCoreServices", 2);
  MobileCoreServicesLibrary_sLib_877 = (uint64_t)result;
  return result;
}

void *__MobileCoreServicesLibrary_block_invoke_13129()
{
  void *result;

  result = dlopen("/System/Library/Frameworks/MobileCoreServices.framework/MobileCoreServices", 2);
  MobileCoreServicesLibrary_sLib_13127 = (uint64_t)result;
  return result;
}

@end
