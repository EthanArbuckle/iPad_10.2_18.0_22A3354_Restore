@implementation MRUActivityTrailingAccessoryViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MRUActivityTrailingAccessoryView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MRUActivityTrailingAccessoryView"), CFSTR("setRouteImage:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("MRUActivityNowPlayingView"));

}

- (void)setRouteImage:(id)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MRUActivityTrailingAccessoryViewAccessibility;
  -[MRUActivityTrailingAccessoryViewAccessibility setRouteImage:](&v6, sel_setRouteImage_, a3);
  -[MRUActivityTrailingAccessoryViewAccessibility _accessibilityAncestorIsKindOf:](self, "_accessibilityAncestorIsKindOf:", NSClassFromString(CFSTR("MRUActivityNowPlayingView")));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
    objc_msgSend(v4, "_accessibilityLoadAccessibilityInformation");

}

@end
