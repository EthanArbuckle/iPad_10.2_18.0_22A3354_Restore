@implementation MRUIBacklight

+ (BOOL)shouldUseTimelinesForTraitCollection:(id)a3
{
  return _objc_msgSend(a3, "mr_shouldDim");
}

+ (double)defaultAnimationDuration
{
  double result;

  +[_UIBacklightEnvironment _defaultAnimationDuration](_UIBacklightEnvironment, "_defaultAnimationDuration");
  return result;
}

@end
