@implementation CAMShutterButtonAccessibility__ChatKit__CameraKit

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CAMShutterButton");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMShutterButton"), CFSTR("mode"), "q", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("CKActionMenuView"));

}

- (id)accessibilityLabel
{
  void *v3;
  char isKindOfClass;
  void *v5;
  objc_super v7;

  -[CAMShutterButtonAccessibility__ChatKit__CameraKit accessibilityContainer](self, "accessibilityContainer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  NSClassFromString(CFSTR("CKActionMenuView"));
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0
    && -[CAMShutterButtonAccessibility__ChatKit__CameraKit safeIntegerForKey:](self, "safeIntegerForKey:", CFSTR("mode")) == 4)
  {
    accessibilityLocalizedString(CFSTR("audio.button.stop.label"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)CAMShutterButtonAccessibility__ChatKit__CameraKit;
    -[CAMShutterButtonAccessibility__ChatKit__CameraKit accessibilityLabel](&v7, sel_accessibilityLabel);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (BOOL)accessibilityActivate
{
  objc_super v4;

  if ((-[CAMShutterButtonAccessibility__ChatKit__CameraKit _accessibilityBoolValueForKey:](self, "_accessibilityBoolValueForKey:", CFSTR("AXShouldBypassAXActivate")) & 1) != 0)return 0;
  v4.receiver = self;
  v4.super_class = (Class)CAMShutterButtonAccessibility__ChatKit__CameraKit;
  return -[CAMShutterButtonAccessibility__ChatKit__CameraKit accessibilityActivate](&v4, sel_accessibilityActivate);
}

@end
