@implementation ZoomUI_SBReachabilitySettingsOverride

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SBReachabilitySettings");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (double)yOffsetFactor
{
  double v2;
  double v3;
  void *v4;
  double v5;
  double v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)ZoomUI_SBReachabilitySettingsOverride;
  -[ZoomUI_SBReachabilitySettingsOverride yOffsetFactor](&v8, sel_yOffsetFactor);
  v3 = v2;
  objc_msgSend(getZoomServicesClass(), "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reachabilityScaleFactor");
  v6 = v3 * v5;

  return v6;
}

@end
