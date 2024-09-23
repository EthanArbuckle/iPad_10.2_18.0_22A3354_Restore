@implementation MTATimeViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MTATimeView");
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
  void *v4;

  -[MTATimeViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_timeLabel"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  AXLocalizeDurationTime();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BDF7430];
}

@end
