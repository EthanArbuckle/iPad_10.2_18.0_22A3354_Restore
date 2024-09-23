@implementation CKDefaultPluginEntryViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CKDefaultPluginEntryViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKDefaultPluginEntryViewController"), CFSTR("balloonView"), "@", 0);
}

- (void)_axSetCloseActionProviderOnBubbleView:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CKDefaultPluginEntryViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("balloonView"));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_accessibilitySetRetainedValue:forKey:", v4, CFSTR("AXPluginClearActionProvider"));

}

@end
