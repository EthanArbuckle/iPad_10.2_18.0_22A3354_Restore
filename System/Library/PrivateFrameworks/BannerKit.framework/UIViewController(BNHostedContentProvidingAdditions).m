@implementation UIViewController(BNHostedContentProvidingAdditions)

- (double)bannerContentOutsets
{
  return *MEMORY[0x1E0CEB4B0];
}

- (uint64_t)bannerSizeTransitionAnimationSettings
{
  return 0;
}

- (uint64_t)bn_shouldAnimateViewTransitionToSize:()BNHostedContentProvidingAdditions
{
  return 1;
}

- (uint64_t)isClippingEnabled
{
  return 1;
}

@end
