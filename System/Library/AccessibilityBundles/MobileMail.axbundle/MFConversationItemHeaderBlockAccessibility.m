@implementation MFConversationItemHeaderBlockAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MFConversationItemHeaderBlock");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MFConversationItemHeaderBlock"), CFSTR("horizontalStatusIndicatorContentView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MFConversationItemHeaderBlock"), CFSTR("createPrimaryViews"), "v", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MFConversationItemHeaderBlockAccessibility;
  -[MFConversationItemHeaderBlockAccessibility _accessibilityLoadAccessibilityInformation](&v4, sel__accessibilityLoadAccessibilityInformation);
  -[MFConversationItemHeaderBlockAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("horizontalStatusIndicatorContentView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessibilitySetIdentification:", CFSTR("AXAccessibilityStatusIndicatorView"));

}

- (void)createPrimaryViews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MFConversationItemHeaderBlockAccessibility;
  -[MFConversationItemHeaderBlockAccessibility createPrimaryViews](&v3, sel_createPrimaryViews);
  -[MFConversationItemHeaderBlockAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

@end
