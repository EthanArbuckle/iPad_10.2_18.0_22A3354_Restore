@implementation BCSCoachingMessageViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("BCSCoachingMessageView");
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

  -[BCSCoachingMessageViewAccessibility _accessibilityDescendantOfType:](self, "_accessibilityDescendantOfType:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BCSCoachingMessageViewAccessibility;
  return *MEMORY[0x24BDF7410] | -[BCSCoachingMessageViewAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
}

@end
