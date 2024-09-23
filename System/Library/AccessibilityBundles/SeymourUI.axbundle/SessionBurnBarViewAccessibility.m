@implementation SessionBurnBarViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SeymourUI.SessionBurnBarView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SeymourUI.SessionBurnBarView"), CFSTR("accessibilityUpdateBurnBar:"), "v", "q", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SessionBurnBarViewAccessibility;
  -[SessionBurnBarViewAccessibility _accessibilityLoadAccessibilityInformation](&v4, sel__accessibilityLoadAccessibilityInformation);
  _accessibilityStringForBurnBarPosition(0, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SessionBurnBarViewAccessibility setAccessibilityLabel:](self, "setAccessibilityLabel:", v3);

}

- (void)accessibilityUpdateBurnBar:(int64_t)a3
{
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SessionBurnBarViewAccessibility;
  -[SessionBurnBarViewAccessibility accessibilityUpdateBurnBar:](&v6, sel_accessibilityUpdateBurnBar_);
  _accessibilityStringForBurnBarPosition(a3, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SessionBurnBarViewAccessibility setAccessibilityLabel:](self, "setAccessibilityLabel:", v5);

}

@end
