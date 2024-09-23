@implementation MTUITimeViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MTUITimeView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MTUITimeViewAccessibility;
  -[MTUITimeViewAccessibility accessibilityLabel](&v5, sel_accessibilityLabel);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  AXLocalizeDurationTime();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BDF7430];
}

@end
