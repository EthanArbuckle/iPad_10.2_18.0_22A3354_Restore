@implementation SpaceAttributionLibrary

void *__SpaceAttributionLibrary_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/SpaceAttribution.framework/SpaceAttribution", 2);
  SpaceAttributionLibrary_sLib = (uint64_t)result;
  return result;
}

@end
