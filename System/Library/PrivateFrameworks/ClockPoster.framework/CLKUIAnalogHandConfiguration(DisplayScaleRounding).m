@implementation CLKUIAnalogHandConfiguration(DisplayScaleRounding)

- (id)cp_handConfigurationRoundedToScaleOfView:()DisplayScaleRounding
{
  id v4;
  void *v5;
  double v6;
  double v7;

  v4 = a3;
  v5 = (void *)objc_msgSend(a1, "copy");
  objc_msgSend(v5, "handLength");
  UIRoundToViewScale();
  objc_msgSend(v5, "setHandLength:");
  objc_msgSend(v5, "handWidth");
  UIRoundToViewScale();
  objc_msgSend(v5, "setHandWidth:");
  objc_msgSend(v5, "armLength");
  UIRoundToViewScale();
  objc_msgSend(v5, "setArmLength:");
  objc_msgSend(v5, "armWidth");
  UIRoundToViewScale();
  objc_msgSend(v5, "setArmWidth:");
  objc_msgSend(v5, "pegStrokeWidth");
  UIRoundToViewScale();
  objc_msgSend(v5, "setPegStrokeWidth:");
  objc_msgSend(v5, "pegRadius");
  UIRoundToViewScale();
  objc_msgSend(v5, "setPegRadius:");
  objc_msgSend(v5, "tailLength");
  UIRoundToViewScale();
  v7 = v6;

  objc_msgSend(v5, "setTailLength:", v7);
  return v5;
}

@end
