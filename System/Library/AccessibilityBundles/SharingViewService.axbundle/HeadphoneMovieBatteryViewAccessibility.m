@implementation HeadphoneMovieBatteryViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SharingViewService.HeadphoneMovieBatteryView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:", CFSTR("SharingViewService.HeadphoneMovieBatteryView"));
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("SharingViewService.HeadphoneMovieBatteryView"), CFSTR("UIView"));
  objc_msgSend(v3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("SharingViewService.HeadphoneMovieBatteryView"), CFSTR("batteryViews"), "Array<LabelledBatteryView>");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SharingViewService.HeadphoneMovieBatteryView"), CFSTR("updateWithBatteries:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("SFBatteryInfo"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SFBatteryInfo"), CFSTR("batteryType"), "q", 0);

}

- (BOOL)_accessibilityOverridesInvalidFrames
{
  double v3;
  double v4;
  BOOL result;
  objc_super v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HeadphoneMovieBatteryViewAccessibility;
  -[HeadphoneMovieBatteryViewAccessibility accessibilityFrame](&v7, sel_accessibilityFrame);
  result = 1;
  if (fabs(v3) >= 0.001 && fabs(v4) >= 0.001 && v3 > 0.0 && v4 > 0.0)
  {
    v6.receiver = self;
    v6.super_class = (Class)HeadphoneMovieBatteryViewAccessibility;
    return -[HeadphoneMovieBatteryViewAccessibility _accessibilityOverridesInvalidFrames](&v6, sel__accessibilityOverridesInvalidFrames);
  }
  return result;
}

- (CGRect)accessibilityFrame
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  objc_super v21;
  CGRect result;

  v21.receiver = self;
  v21.super_class = (Class)HeadphoneMovieBatteryViewAccessibility;
  -[HeadphoneMovieBatteryViewAccessibility accessibilityFrame](&v21, sel_accessibilityFrame);
  v5 = v4;
  v7 = v6;
  v8 = v2;
  v9 = v3;
  if (fabs(v2) < 0.001 || fabs(v3) < 0.001 || v2 <= 0.0 || v3 <= 0.0)
  {
    objc_opt_class();
    __UIAccessibilityCastAsClass();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "superview");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11)
    {
      objc_msgSend(v11, "accessibilityFrame");
      v5 = v13;
      v7 = v14;
      v8 = v15;
      v9 = v16;
    }

  }
  v17 = v5;
  v18 = v7;
  v19 = v8;
  v20 = v9;
  result.size.height = v20;
  result.size.width = v19;
  result.origin.y = v18;
  result.origin.x = v17;
  return result;
}

- (void)updateWithBatteries:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)HeadphoneMovieBatteryViewAccessibility;
  v4 = a3;
  -[HeadphoneMovieBatteryViewAccessibility updateWithBatteries:](&v9, sel_updateWithBatteries_, v4);
  -[HeadphoneMovieBatteryViewAccessibility safeSwiftArrayForKey:](self, "safeSwiftArrayForKey:", CFSTR("batteryViews"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __62__HeadphoneMovieBatteryViewAccessibility_updateWithBatteries___block_invoke;
  v7[3] = &unk_2503551C8;
  v8 = v5;
  v6 = v5;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v7);

}

void __62__HeadphoneMovieBatteryViewAccessibility_updateWithBatteries___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  const __CFString *v9;

  v5 = a2;
  v6 = objc_msgSend(v5, "safeIntegerForKey:", CFSTR("batteryType"));
  objc_opt_class();
  objc_msgSend(*(id *)(a1 + 32), "axSafeObjectAtIndex:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsSafeCategory();
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 == 1)
  {
    v9 = CFSTR("battery.case");
    goto LABEL_5;
  }
  if (v6 == 2)
  {
    v9 = CFSTR("battery.combined.earbuds");
LABEL_5:
    objc_msgSend(v8, "setAXBatteryType:", v9);
  }

}

@end
