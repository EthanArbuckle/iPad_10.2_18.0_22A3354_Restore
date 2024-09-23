@implementation _TVStackViewFlowLayoutAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_TVStackViewFlowLayout");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_TVStackViewFlowLayout"), CFSTR("supplementaryCellSection"), "q", 0);
}

- (BOOL)_accessibilitySortCollectionViewLogically
{
  objc_super v4;

  if (-[_TVStackViewFlowLayoutAccessibility safeIntegerForKey:](self, "safeIntegerForKey:", CFSTR("supplementaryCellSection")) > 0)return 0;
  v4.receiver = self;
  v4.super_class = (Class)_TVStackViewFlowLayoutAccessibility;
  return -[_TVStackViewFlowLayoutAccessibility _accessibilitySortCollectionViewLogically](&v4, sel__accessibilitySortCollectionViewLogically);
}

@end
