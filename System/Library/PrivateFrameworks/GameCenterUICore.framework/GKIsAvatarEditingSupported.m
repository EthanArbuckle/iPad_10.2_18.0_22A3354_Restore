@implementation GKIsAvatarEditingSupported

uint64_t __GKIsAvatarEditingSupported_block_invoke()
{
  uint64_t result;

  result = AVTUIAreAvatarsSupported();
  GKIsAvatarEditingSupported_sIsSupported = result;
  return result;
}

@end
