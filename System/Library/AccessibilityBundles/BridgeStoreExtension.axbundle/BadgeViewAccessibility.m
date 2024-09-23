@implementation BadgeViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("BridgeStoreExtension.BadgeView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("BridgeStoreExtension.BadgeView"), CFSTR("accessibilityValueLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("BridgeStoreExtension.BadgeView"), CFSTR("accessibilityCaptionLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("BridgeStoreExtension.BadgeView"), CFSTR("accessibilityHeadingLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("BridgeStoreExtension.BadgeView"), CFSTR("accessibilityValueView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("BridgeStoreExtension.BadgeView"), CFSTR("valueView"), "Optional<UIView>");
  objc_msgSend(v3, "validateClass:", CFSTR("AppStoreKit.ArtworkView"));

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
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  __CFString *v19;
  void *v20;
  void *v21;
  void *v22;
  char isKindOfClass;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;

  -[BadgeViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessibilityValueLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessibilityLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "length"))
  {
    v33 = 0;
    objc_msgSend(MEMORY[0x24BDD1798], "regularExpressionWithPattern:options:error:", CFSTR("(\\d*\\.\\d*)"), 1, &v33);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "matchesInString:options:range:", v4, 0, 0, objc_msgSend(v4, "length"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "count"))
    {
      objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "range");
      objc_msgSend(v4, "substringWithRange:", v8, v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "doubleValue");

      UIAXStarRatingStringForRatingWithGranularity();
      v11 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = v4;
    }
    v32 = v11;

  }
  else
  {
    v32 = 0;
  }
  -[BadgeViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessibilityValueView"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilityAppStorePrefixForTarget();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  -[BadgeViewAccessibility safeSwiftValueForKey:](self, "safeSwiftValueForKey:", CFSTR("valueView"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v30 = v15;
  if (v15)
  {
    objc_msgSend(v15, "image");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "imageAsset");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v17, "safeStringForKey:", CFSTR("assetName"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v18, "isEqualToString:", CFSTR("AgeRating10")) & 1) != 0
      || (objc_msgSend(v18, "isEqualToString:", CFSTR("AgeRating10-Official")) & 1) != 0)
    {
      v19 = CFSTR("age.rating.10");
    }
    else if ((objc_msgSend(v18, "isEqualToString:", CFSTR("AgeRating12")) & 1) != 0
           || (objc_msgSend(v18, "isEqualToString:", CFSTR("AgeRating12-Official")) & 1) != 0)
    {
      v19 = CFSTR("age.rating.12");
    }
    else if ((objc_msgSend(v18, "isEqualToString:", CFSTR("AgeRating14")) & 1) != 0
           || (objc_msgSend(v18, "isEqualToString:", CFSTR("AgeRating14-Official")) & 1) != 0)
    {
      v19 = CFSTR("age.rating.14");
    }
    else if ((objc_msgSend(v18, "isEqualToString:", CFSTR("AgeRating16")) & 1) != 0
           || (objc_msgSend(v18, "isEqualToString:", CFSTR("AgeRating16-Official")) & 1) != 0)
    {
      v19 = CFSTR("age.rating.16");
    }
    else if ((objc_msgSend(v18, "isEqualToString:", CFSTR("AgeRating18")) & 1) != 0
           || (objc_msgSend(v18, "isEqualToString:", CFSTR("AgeRating18-Official")) & 1) != 0)
    {
      v19 = CFSTR("age.rating.18");
    }
    else
    {
      if ((objc_msgSend(v18, "isEqualToString:", CFSTR("AgeRatingL")) & 1) == 0
        && !objc_msgSend(v18, "isEqualToString:", CFSTR("AgeRatingL-Official")))
      {
        v15 = 0;
        goto LABEL_27;
      }
      v19 = CFSTR("age.rating.L");
    }
    accessibilityAppStoreLocalizedString(v19);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_27:

  }
  -[BadgeViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessibilityHeadingLabel"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "accessibilityLabel");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = v13;
  objc_msgSend(v13, "stringByAppendingString:", CFSTR(".ArtworkView"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x23490950C]();
  isKindOfClass = objc_opt_isKindOfClass();
  v24 = v12;
  if ((isKindOfClass & 1) != 0)
  {
    v25 = 0;
  }
  else
  {
    objc_msgSend(v12, "accessibilityLabel");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[BadgeViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessibilityCaptionLabel"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "accessibilityLabel");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if ((isKindOfClass & 1) == 0)
  return v27;
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BadgeViewAccessibility;
  return *MEMORY[0x24BDF73B0] | -[BadgeViewAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
}

@end
