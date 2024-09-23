@implementation _AXUIPassiveRootWindow

- (BOOL)accessibilityElementsHidden
{
  return 1;
}

- (BOOL)_ignoresHitTest
{
  return 1;
}

- (BOOL)_allowsOcclusionDetectionOverride
{
  return 1;
}

@end
