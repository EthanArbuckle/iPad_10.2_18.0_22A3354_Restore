@implementation BCBatteryWidgetViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("BCBatteryWidgetViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("BCBatteryWidgetViewController"), CFSTR("_updateRowView:withDevice:animated:"), "v", "@", "@", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("BCBatteryWidgetRowView"), CFSTR("glyphImage"), "@", 0);

}

- (void)_updateRowView:(id)a3 withDevice:(id)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  __CFString *v12;
  void *v13;
  void *v14;
  objc_super v15;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  v15.receiver = self;
  v15.super_class = (Class)BCBatteryWidgetViewControllerAccessibility;
  -[BCBatteryWidgetViewControllerAccessibility _updateRowView:withDevice:animated:](&v15, sel__updateRowView_withDevice_animated_, v8, v9, v5);
  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "parts");
  if (v11)
  {
    if ((v11 & 3) == 1)
    {
      v12 = CFSTR("battery.center.left.airpod");
      goto LABEL_9;
    }
    if ((v11 & 3) == 2)
    {
      v12 = CFSTR("battery.center.right.airpod");
LABEL_9:
      accessibilityLocalizedString(v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    }
    if ((v11 & 4) != 0)
    {
      v12 = CFSTR("battery.center.case.airpod");
      goto LABEL_9;
    }
  }
  v13 = 0;
LABEL_10:
  objc_msgSend(v8, "safeValueForKey:", CFSTR("glyphImage"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setAccessibilityLabel:", v13);

}

@end
