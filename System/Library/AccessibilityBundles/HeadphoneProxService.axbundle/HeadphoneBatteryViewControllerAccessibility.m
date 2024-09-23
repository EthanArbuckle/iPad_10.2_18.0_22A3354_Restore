@implementation HeadphoneBatteryViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("HeadphoneProxService.HeadphoneBatteryViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:", CFSTR("HeadphoneProxService.HeadphoneBatteryViewController"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HeadphoneProxService.HeadphoneBatteryViewController"), CFSTR("updateBatteryLevels"), "v", 0);
  objc_msgSend(v3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("HeadphoneProxService.HeadphoneBatteryViewController"), CFSTR("movieBatteryView"), "HeadphoneMovieBatteryView");
  objc_msgSend(v3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("HeadphoneProxService.HeadphoneMovieBatteryView"), CFSTR("batteryViews"), "Array<LabelledBatteryView>");

}

- (void)updateBatteryLevels
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)HeadphoneBatteryViewControllerAccessibility;
  -[HeadphoneBatteryViewControllerAccessibility updateBatteryLevels](&v9, sel_updateBatteryLevels);
  -[HeadphoneBatteryViewControllerAccessibility safeSwiftValueForKey:](self, "safeSwiftValueForKey:", CFSTR("movieBatteryView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeSwiftArrayForKey:", CFSTR("batteryViews"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    objc_opt_class();
    objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAccessibilityCastAsSafeCategory();
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "setAXBatteryType:", CFSTR("battery.combined.earbuds"));
  }
  if ((unint64_t)objc_msgSend(v4, "count") >= 2)
  {
    objc_opt_class();
    objc_msgSend(v4, "objectAtIndexedSubscript:", 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAccessibilityCastAsSafeCategory();
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "setAXBatteryType:", CFSTR("battery.case"));
  }

}

@end
