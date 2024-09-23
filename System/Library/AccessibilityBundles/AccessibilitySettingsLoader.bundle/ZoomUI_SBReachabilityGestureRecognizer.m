@implementation ZoomUI_SBReachabilityGestureRecognizer

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SBReachabilityGestureRecognizer");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  void *v8;
  objc_super v9;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "anyObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAccessibilityIdentifier:", CFSTR("AXSBReachabilityTouch"));

  v9.receiver = self;
  v9.super_class = (Class)ZoomUI_SBReachabilityGestureRecognizer;
  -[ZoomUI_SBReachabilityGestureRecognizer touchesBegan:withEvent:](&v9, sel_touchesBegan_withEvent_, v7, v6);

}

@end
