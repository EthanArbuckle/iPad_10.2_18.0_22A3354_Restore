@implementation MomentsIndicatorBubbleAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("ConversationKit.MomentsIndicatorBubble");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("ConversationKit.MomentsIndicatorBubble"), CFSTR("indicator"), "UILabel");
}

- (void)start
{
  UIAccessibilityNotifications v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MomentsIndicatorBubbleAccessibility;
  -[MomentsIndicatorBubbleAccessibility start](&v6, sel_start);
  v3 = *MEMORY[0x24BDF71E8];
  -[MomentsIndicatorBubbleAccessibility safeSwiftValueForKey:](self, "safeSwiftValueForKey:", CFSTR("indicator"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accessibilityLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  UIAccessibilityPostNotification(v3, v5);

}

@end
