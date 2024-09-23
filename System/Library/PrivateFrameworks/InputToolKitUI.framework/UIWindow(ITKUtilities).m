@implementation UIWindow(ITKUtilities)

- (double)itk_backingScaleFactor
{
  void *v1;
  double v2;
  double v3;

  objc_msgSend(a1, "screen");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "nativeScale");
  v3 = v2;

  return v3;
}

@end
