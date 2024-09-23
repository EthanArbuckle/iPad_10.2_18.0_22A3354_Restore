@implementation CKDetailsChatOptionsCheckboxCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CKDetailsChatOptionsCheckboxCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("CKDetailsChatOptionsCheckboxCell"), CFSTR("UITableViewCell"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKDetailsChatOptionsCheckboxCell"), CFSTR("controlSwitch"), "@", 0);

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;

  -[CKDetailsChatOptionsCheckboxCellAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("controlSwitch"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)accessibilityValue
{
  void *v2;
  void *v3;

  -[CKDetailsChatOptionsCheckboxCellAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("controlSwitch"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (unint64_t)accessibilityTraits
{
  void *v2;
  unint64_t v3;

  -[CKDetailsChatOptionsCheckboxCellAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("controlSwitch"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "accessibilityTraits");

  return v3;
}

- (CGPoint)accessibilityActivationPoint
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGPoint result;

  -[CKDetailsChatOptionsCheckboxCellAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("controlSwitch"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityActivationPoint");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.y = v8;
  result.x = v7;
  return result;
}

@end
