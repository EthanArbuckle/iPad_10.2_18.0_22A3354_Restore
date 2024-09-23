@implementation FailureBarViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("FailureBarView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)setFailureCount:(int)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)FailureBarViewAccessibility;
  -[FailureBarViewAccessibility setFailureCount:](&v6, sel_setFailureCount_, *(_QWORD *)&a3);
  -[FailureBarViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_titleLabel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accessibilityLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  UIAccessibilityPostNotification(*MEMORY[0x24BDF71E8], v5);
}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;

  -[FailureBarViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_titleLabel"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

@end
