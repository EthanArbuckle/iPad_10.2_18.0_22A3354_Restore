@implementation GetAssetQueryClass

void *__GetAssetQueryClass_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/MobileAsset.framework/MobileAsset", 1);
  if (result)
  {
    result = NSClassFromString(CFSTR("MAAssetQuery"));
    GetAssetQueryClass_maAssetQueryClass = (uint64_t)result;
  }
  return result;
}

@end
