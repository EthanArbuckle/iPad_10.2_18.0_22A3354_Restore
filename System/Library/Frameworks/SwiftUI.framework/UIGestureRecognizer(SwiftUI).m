@implementation UIGestureRecognizer(SwiftUI)

- (double)_swiftui_globalVelocity
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  objc_msgSend(a1, "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "velocityInView:", v3);
  v5 = v4;

  return v5;
}

- (double)_swiftui_globalTranslation
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  objc_msgSend(a1, "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "translationInView:", v3);
  v5 = v4;

  return v5;
}

@end
