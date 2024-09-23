@implementation ZL25LoadCoreMediaFunctionPtrsv

void *___ZL25LoadCoreMediaFunctionPtrsv_block_invoke()
{
  void *result;
  void *v1;

  result = dlopen("/System/Library/Frameworks/CoreMedia.framework/CoreMedia", 1);
  if (result)
  {
    v1 = result;
    sCMAudioFormatDescriptionGetStreamBasicDescription = dlsym(result, "CMAudioFormatDescriptionGetStreamBasicDescription");
    sCMAudioFormatDescriptionCreate = dlsym(v1, "CMAudioFormatDescriptionCreate");
    sCMAudioFormatDescriptionGetChannelLayout = dlsym(v1, "CMAudioFormatDescriptionGetChannelLayout");
    result = dlsym(v1, "CMAudioFormatDescriptionGetMagicCookie");
    sCMAudioFormatDescriptionGetMagicCookie = result;
  }
  return result;
}

@end
