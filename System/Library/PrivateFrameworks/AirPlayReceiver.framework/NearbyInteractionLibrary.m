@implementation NearbyInteractionLibrary

void *__NearbyInteractionLibrary_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/NearbyInteraction.framework/NearbyInteraction", 2);
  NearbyInteractionLibrary_sLib = (uint64_t)result;
  return result;
}

@end
