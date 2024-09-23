@implementation HeadphoneImageBatteryViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SharingViewService.HeadphoneImageBatteryView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:", CFSTR("SharingViewService.HeadphoneImageBatteryView"));
  objc_msgSend(v3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("SharingViewService.HeadphoneImageBatteryView"), CFSTR("batteryView"), "LabelledBatteryView");
  objc_msgSend(v3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("SharingViewService.HeadphoneImageBatteryView"), CFSTR("imageViews"), "Array<SFAdjustedImageView>");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SharingViewService.HeadphoneImageBatteryView"), CFSTR("updateWithBattery:"), "v", "@", 0);

}

- (void)updateWithBattery:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HeadphoneImageBatteryViewAccessibility;
  -[HeadphoneImageBatteryViewAccessibility updateWithBattery:](&v11, sel_updateWithBattery_, v4);
  v5 = objc_msgSend(v4, "safeIntegerForKey:", CFSTR("batteryType"));
  objc_opt_class();
  -[HeadphoneImageBatteryViewAccessibility safeSwiftValueForKey:](self, "safeSwiftValueForKey:", CFSTR("batteryView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsSafeCategory();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[HeadphoneImageBatteryViewAccessibility safeSwiftArrayForKey:](self, "safeSwiftArrayForKey:", CFSTR("imageViews"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v5 == 1)
  {
    v10 = CFSTR("battery.case");
LABEL_9:
    objc_msgSend(v7, "setAXBatteryType:", v10);
    goto LABEL_10;
  }
  if ((unint64_t)objc_msgSend(v8, "count") > 1)
  {
    v10 = CFSTR("battery.combined.earbuds");
    goto LABEL_9;
  }
  if (v5 == 2)
  {
    v10 = CFSTR("battery.left.earbud");
    goto LABEL_9;
  }
  if (v5 == 3)
  {
    v10 = CFSTR("battery.right.earbud");
    goto LABEL_9;
  }
LABEL_10:

}

@end
