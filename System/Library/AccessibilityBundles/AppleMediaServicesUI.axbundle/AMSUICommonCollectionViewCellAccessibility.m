@implementation AMSUICommonCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("AMSUICommonCollectionViewCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AMSUICommonCollectionViewCell"), CFSTR("underlyingContentView"), "@", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("AMSUICommonCollectionViewCell"), CFSTR("UICollectionViewCell"));

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  void *v2;
  unint64_t v3;

  -[AMSUICommonCollectionViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("underlyingContentView"));
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

  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "center");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.y = v8;
  result.x = v7;
  return result;
}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;

  -[AMSUICommonCollectionViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("underlyingContentView"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
