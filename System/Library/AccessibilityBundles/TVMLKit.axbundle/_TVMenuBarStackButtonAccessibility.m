@implementation _TVMenuBarStackButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_TVMenuBarStackButton");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:", CFSTR("_TVMenuBarStackView"));
}

- (_NSRange)accessibilityRowRange
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  NSUInteger v9;
  NSUInteger v10;
  _NSRange result;

  objc_opt_class();
  -[_TVMenuBarStackButtonAccessibility _accessibilityAncestorIsKindOf:](self, "_accessibilityAncestorIsKindOf:", NSClassFromString(CFSTR("_TVMenuBarStackView")));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "subviews");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "indexOfObject:", self);
  objc_msgSend(v4, "subviews");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  v9 = v6;
  v10 = v8;
  result.length = v10;
  result.location = v9;
  return result;
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_TVMenuBarStackButtonAccessibility;
  return *MEMORY[0x24BEBB188] | -[_TVMenuBarStackButtonAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
}

@end
