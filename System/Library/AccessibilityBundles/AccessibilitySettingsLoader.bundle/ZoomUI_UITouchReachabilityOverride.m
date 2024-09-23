@implementation ZoomUI_UITouchReachabilityOverride

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UITouch");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (CGPoint)locationInView:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  _BOOL4 v12;
  double v13;
  double v14;
  objc_super v15;
  CGPoint result;

  v15.receiver = self;
  v15.super_class = (Class)ZoomUI_UITouchReachabilityOverride;
  -[ZoomUI_UITouchReachabilityOverride locationInView:](&v15, sel_locationInView_, a3);
  v5 = v4;
  v7 = v6;
  -[ZoomUI_UITouchReachabilityOverride accessibilityIdentifier](self, "accessibilityIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v8, "isEqualToString:", CFSTR("AXSBReachabilityTouch"))
    || !+[ZoomServicesUI _shouldUnmapPointsForFluidGestures](ZoomServicesUI, "_shouldUnmapPointsForFluidGestures"))
  {
    goto LABEL_5;
  }
  objc_msgSend(getAXSettingsClass(), "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "zoomInStandby"))
  {

LABEL_5:
    goto LABEL_6;
  }
  v12 = +[ZoomServicesUI _deviceIsPortrait](ZoomServicesUI, "_deviceIsPortrait");

  if (v12)
  {
    +[ZoomServicesUI _unMappedZoomPoint:](ZoomServicesUI, "_unMappedZoomPoint:", v5, v7);
    v5 = v13;
    v7 = v14;
  }
LABEL_6:
  v10 = v5;
  v11 = v7;
  result.y = v11;
  result.x = v10;
  return result;
}

@end
