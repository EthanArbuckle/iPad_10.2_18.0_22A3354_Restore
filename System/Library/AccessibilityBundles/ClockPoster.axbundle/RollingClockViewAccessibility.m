@implementation RollingClockViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("ClockPoster.RollingClockView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  AXClockTimeStringForDate();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
