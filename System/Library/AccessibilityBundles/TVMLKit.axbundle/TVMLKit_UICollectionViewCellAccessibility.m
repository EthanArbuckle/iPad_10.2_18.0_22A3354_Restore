@implementation TVMLKit_UICollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UICollectionViewCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:", CFSTR("TVCarouselView"));
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("TVCarouselView"), CFSTR("_numberOfRealItemsForDataSource"), "Q");

}

- (_NSRange)accessibilityRowRange
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  NSUInteger v11;
  NSUInteger v12;
  objc_super v13;
  _NSRange result;

  if (accessibilityRowRange_onceToken != -1)
    dispatch_once(&accessibilityRowRange_onceToken, &__block_literal_global_0);
  v13.receiver = self;
  v13.super_class = (Class)TVMLKit_UICollectionViewCellAccessibility;
  v3 = (NSUInteger)-[TVMLKit_UICollectionViewCellAccessibility accessibilityRowRange](&v13, sel_accessibilityRowRange);
  v5 = v4;
  objc_opt_class();
  -[TVMLKit_UICollectionViewCellAccessibility _accessibilityAncestorIsKindOf:](self, "_accessibilityAncestorIsKindOf:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "_accessibilityAncestorIsKindOf:", accessibilityRowRange_TVCarouselViewClass);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    v10 = objc_msgSend(v8, "safeUnsignedIntegerForKey:", CFSTR("_numberOfRealItemsForDataSource"));
    if (v10)
    {
      v3 %= v10;
      v5 = v10;
    }
  }

  v11 = v3;
  v12 = v5;
  result.length = v12;
  result.location = v11;
  return result;
}

@end
