@implementation MobileSafariUIToolbarButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIToolbarButton");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:", CFSTR("NavigationBar"));
  objc_msgSend(v3, "validateClass:", CFSTR("BrowserToolbar"));

}

- (id)_accessibilityContainingParentForOrdering
{
  void *v3;
  void *v4;
  objc_super v6;

  -[MobileSafariUIToolbarButtonAccessibility _accessibilityViewAncestorIsKindOf:](self, "_accessibilityViewAncestorIsKindOf:", NSClassFromString(CFSTR("BrowserToolbar")));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3
    || (-[MobileSafariUIToolbarButtonAccessibility _accessibilityViewAncestorIsKindOf:](self, "_accessibilityViewAncestorIsKindOf:", NSClassFromString(CFSTR("NavigationBar"))), (v4 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    v6.receiver = self;
    v6.super_class = (Class)MobileSafariUIToolbarButtonAccessibility;
    -[MobileSafariUIToolbarButtonAccessibility _accessibilityContainingParentForOrdering](&v6, sel__accessibilityContainingParentForOrdering);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

@end
