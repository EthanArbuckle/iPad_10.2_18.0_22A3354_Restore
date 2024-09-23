@implementation ZoomUI_SBBacklightController

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SBBacklightController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)_undimFromSource:(int64_t)a3
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ZoomUI_SBBacklightController;
  -[ZoomUI_SBBacklightController _undimFromSource:](&v4, sel__undimFromSource_, a3);
  objc_msgSend(getZoomServicesClass(), "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "notifyZoomDeviceWillWake");

}

@end
