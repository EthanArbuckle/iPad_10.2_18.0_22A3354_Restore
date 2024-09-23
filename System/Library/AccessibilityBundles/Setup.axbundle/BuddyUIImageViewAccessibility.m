@implementation BuddyUIImageViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIImageView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  void *v3;
  char v4;
  objc_super v6;

  -[BuddyUIImageViewAccessibility accessibilityIdentifier](self, "accessibilityIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasPrefix:", CFSTR("LockScreenTitle"));

  if ((v4 & 1) != 0)
    return 1;
  v6.receiver = self;
  v6.super_class = (Class)BuddyUIImageViewAccessibility;
  return -[BuddyUIImageViewAccessibility isAccessibilityElement](&v6, sel_isAccessibilityElement);
}

- (id)accessibilityLabel
{
  void *v3;
  int v4;
  void *v5;
  objc_super v7;

  -[BuddyUIImageViewAccessibility accessibilityIdentifier](self, "accessibilityIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasPrefix:", CFSTR("LockScreenTitle"));

  if (v4)
  {
    AXDeviceGetLocalizedShortModelName();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)BuddyUIImageViewAccessibility;
    -[BuddyUIImageViewAccessibility accessibilityLabel](&v7, sel_accessibilityLabel);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

@end
