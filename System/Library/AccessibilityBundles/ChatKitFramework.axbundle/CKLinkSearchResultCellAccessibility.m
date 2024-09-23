@implementation CKLinkSearchResultCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CKLinkSearchResultCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)_axContact
{
  JUMPOUT(0x23490A888);
}

- (void)_axSetContact:(id)a3
{
  __UIAccessibilitySetAssociatedObject();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKLinkSearchResultCell"), CFSTR("linkView"), "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v8;

  -[CKLinkSearchResultCellAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("linkView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKLinkSearchResultCellAccessibility _axContact](self, "_axContact");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  AXCKLocalizedFromStringWithContact(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "accessibilityLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BDF73B0];
}

@end
