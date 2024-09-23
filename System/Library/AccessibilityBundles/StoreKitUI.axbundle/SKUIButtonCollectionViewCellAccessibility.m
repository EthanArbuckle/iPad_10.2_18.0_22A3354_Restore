@implementation SKUIButtonCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SKUIButtonCollectionViewCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SKUIButtonCollectionViewCell"), CFSTR("_button"), "UIControl");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIView"), CFSTR("isUserInteractionEnabled"), "B", 0);

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;

  -[SKUIButtonCollectionViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_button"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (unint64_t)accessibilityTraits
{
  void *v3;
  void *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;

  objc_opt_class();
  -[SKUIButtonCollectionViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_button"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "safeBoolForKey:", CFSTR("isUserInteractionEnabled"));
  v6 = objc_msgSend(v4, "accessibilityTraits");
  v7 = *MEMORY[0x24BDF73B0];
  if (!v5)
    v7 = 0;
  v8 = v6 | v7;

  return v8;
}

@end
