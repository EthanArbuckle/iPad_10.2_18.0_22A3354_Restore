@implementation FollowNavButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("ShelfKitCollectionViews.FollowNavButton");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityPath
{
  void *v2;

  v2 = (void *)MEMORY[0x24BDF6870];
  -[FollowNavButtonAccessibility accessibilityFrame](self, "accessibilityFrame");
  return (id)objc_msgSend(v2, "_bezierPathWithArcRoundedRect:cornerRadius:");
}

@end
