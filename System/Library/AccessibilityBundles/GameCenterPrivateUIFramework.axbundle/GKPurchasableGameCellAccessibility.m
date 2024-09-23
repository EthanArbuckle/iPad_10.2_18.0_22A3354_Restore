@implementation GKPurchasableGameCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("GKPurchasableGameCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("GKPurchasableGameCell"), CFSTR("developerLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("GKPurchasableGameCell"), CFSTR("priceLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("GKBaseGameCell"), CFSTR("nameLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("GKPurchasableGameCell"), CFSTR("GKBaseGameCell"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("GKPurchasableGameCell"), CFSTR("ratingStarsView"), "@", 0);

}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v12;
  void *v13;
  const __CFString *v14;
  const __CFString *v15;

  -[GKPurchasableGameCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("nameLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessibilityLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[GKPurchasableGameCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("developerLabel"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "_accessibilityViewIsVisible"))
  {
    objc_msgSend(v5, "accessibilityLabel");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = CFSTR("__AXStringForVariablesSentinel");
    __UIAXStringForVariables();
    v6 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v6;
  }
  -[GKPurchasableGameCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("ratingStarsView"), v12, v14);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "_accessibilityViewIsVisible"))
  {
    objc_msgSend(v7, "accessibilityLabel");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = CFSTR("__AXStringForVariablesSentinel");
    __UIAXStringForVariables();
    v8 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v8;
  }
  -[GKPurchasableGameCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("priceLabel"), v13, v15);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "_accessibilityViewIsVisible"))
  {
    __UIAXStringForVariables();
    v10 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v10;
  }

  return v4;
}

@end
