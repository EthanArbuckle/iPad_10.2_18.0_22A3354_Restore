@implementation CKLocationSearchResultCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CKLocationSearchResultCell");
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
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKLocationSearchResultCell"), CFSTR("placeLabel"), "@", 0);
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
  void *v7;
  void *v8;
  void *v10;

  -[CKLocationSearchResultCellAccessibility _axContact](self, "_axContact");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  AXCKLocalizedFromStringWithContact(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  -[CKLocationSearchResultCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("placeLabel"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "accessibilityLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  accessibilityLocalizedString(CFSTR("map.attachment"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BDF73B0];
}

@end
