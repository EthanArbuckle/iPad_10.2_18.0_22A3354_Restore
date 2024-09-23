@implementation BuddyAppleIDTableHeaderViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("BuddyAppleIDTableHeaderView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BuddyAppleIDTableHeaderViewAccessibility)initWithFrame:(CGRect)a3
{
  BuddyAppleIDTableHeaderViewAccessibility *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)BuddyAppleIDTableHeaderViewAccessibility;
  v3 = -[BuddyAppleIDTableHeaderViewAccessibility initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[BuddyAppleIDTableHeaderViewAccessibility safeValueForKey:](v3, "safeValueForKey:", CFSTR("_textLabel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BuddyAppleIDTableHeaderViewAccessibility safeValueForKey:](v3, "safeValueForKey:", CFSTR("_textLabel"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "accessibilityTraits");
  objc_msgSend(v4, "setAccessibilityTraits:", *MEMORY[0x24BDF73C0] | v6);

  return v3;
}

@end
