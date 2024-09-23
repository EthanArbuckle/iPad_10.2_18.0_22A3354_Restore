@implementation SUUIMobileCoreServicesFramework

void *__SUUIMobileCoreServicesFramework_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/Frameworks/MobileCoreServices.framework/MobileCoreServices", 1);
  SUUIMobileCoreServicesFramework_sHandle = (uint64_t)result;
  return result;
}

@end
