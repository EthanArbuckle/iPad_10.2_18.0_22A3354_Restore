@implementation CKFullScreenBalloonViewControllerSocialLayer

- (BOOL)wantsWindowedPresentation
{
  return 0;
}

- (BOOL)preserveModalPresentationStyle
{
  return 1;
}

- (BOOL)constrainToPresentingVCBounds
{
  return 1;
}

- (BOOL)forceWindowedPresentation
{
  return 0;
}

@end
