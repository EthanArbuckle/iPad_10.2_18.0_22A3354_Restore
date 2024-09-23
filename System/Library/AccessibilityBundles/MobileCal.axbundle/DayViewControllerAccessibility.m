@implementation DayViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("DayViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)_accessibilitySpeakThisElementsAndStrings
{
  void *v2;
  void *v3;
  uint64_t v4;
  objc_super v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  v6.receiver = self;
  v6.super_class = (Class)DayViewControllerAccessibility;
  -[DayViewControllerAccessibility _accessibilitySpeakThisElementsAndStrings](&v6, sel__accessibilitySpeakThisElementsAndStrings);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v2, "count"))
  {
    accessibilityLocalizedString(CFSTR("event.count.none"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = v3;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v7, 1);
    v4 = objc_claimAutoreleasedReturnValue();

    v2 = (void *)v4;
  }
  return v2;
}

@end
