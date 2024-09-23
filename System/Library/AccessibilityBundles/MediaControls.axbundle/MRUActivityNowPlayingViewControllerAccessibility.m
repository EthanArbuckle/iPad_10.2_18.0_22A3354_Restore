@implementation MRUActivityNowPlayingViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MRUActivityNowPlayingViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MRUActivityNowPlayingViewController"), CFSTR("updateNowPlayingInfo"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIWindowScene"), CFSTR("systemApertureElementContext"), "@", 0);
  objc_msgSend(v3, "validateProtocol:hasRequiredInstanceMethod:", CFSTR("SBUISystemApertureElementContext"), CFSTR("setElementNeedsUpdate"));
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("MRUActivityNowPlayingViewController"), CFSTR("UIViewController"));

}

- (void)updateNowPlayingInfo
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MRUActivityNowPlayingViewControllerAccessibility;
  -[MRUActivityNowPlayingViewControllerAccessibility updateNowPlayingInfo](&v4, sel_updateNowPlayingInfo);
  -[MRUActivityNowPlayingViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("systemApertureElementContext"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setElementNeedsUpdate");

}

@end
