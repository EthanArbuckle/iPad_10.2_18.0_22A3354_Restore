@implementation ZoomUI_SpringBoardOverride

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SpringBoard");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (double)_accessibilityActivationAnimationStartDelay
{
  void *v3;
  double v4;
  double v5;
  double v6;
  objc_super v8;

  objc_msgSend(getZoomServicesClass(), "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appActivationAnimationStartDelay");
  v5 = v4;

  if (v5 < 0.0)
  {
    v8.receiver = self;
    v8.super_class = (Class)ZoomUI_SpringBoardOverride;
    -[ZoomUI_SpringBoardOverride _accessibilityActivationAnimationStartDelay](&v8, sel__accessibilityActivationAnimationStartDelay);
    return v6;
  }
  return v5;
}

- (double)_accessibilityDeactivationAnimationStartDelay
{
  void *v3;
  double v4;
  double v5;
  double v6;
  objc_super v8;

  objc_msgSend(getZoomServicesClass(), "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appDeactivationAnimationStartDelay");
  v5 = v4;

  if (v5 < 0.0)
  {
    v8.receiver = self;
    v8.super_class = (Class)ZoomUI_SpringBoardOverride;
    -[ZoomUI_SpringBoardOverride _accessibilityDeactivationAnimationStartDelay](&v8, sel__accessibilityDeactivationAnimationStartDelay);
    return v6;
  }
  return v5;
}

- (void)_accessibilityActivationAnimationWillBegin
{
  void *v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ZoomUI_SpringBoardOverride;
  -[ZoomUI_SpringBoardOverride _accessibilityActivationAnimationWillBegin](&v3, sel__accessibilityActivationAnimationWillBegin);
  objc_msgSend(getZoomServicesClass(), "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "notifyZoomAppActivationAnimationWillBegin");

}

- (void)_accessibilityDeactivationAnimationWillBegin
{
  void *v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ZoomUI_SpringBoardOverride;
  -[ZoomUI_SpringBoardOverride _accessibilityDeactivationAnimationWillBegin](&v3, sel__accessibilityDeactivationAnimationWillBegin);
  objc_msgSend(getZoomServicesClass(), "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "notifyZoomAppDeactivationAnimationWillBegin");

}

@end
