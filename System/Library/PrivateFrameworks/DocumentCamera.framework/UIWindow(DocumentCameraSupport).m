@implementation UIWindow(DocumentCameraSupport)

- (BOOL)dc_requiresCompactLandscapeIcons
{
  void *v1;
  _BOOL8 v2;

  objc_msgSend(a1, "traitCollection");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "horizontalSizeClass") == 1;

  return v2;
}

@end
