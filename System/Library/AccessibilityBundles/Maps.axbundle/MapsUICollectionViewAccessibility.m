@implementation MapsUICollectionViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UICollectionView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:", CFSTR("SteppingPageViewController"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UICollectionView"), CFSTR("accessibilityCollectionViewBehavesLikeUIViewAccessibility"), "B", 0);

}

- (BOOL)accessibilityCollectionViewBehavesLikeUIViewAccessibility
{
  void *v3;
  char isKindOfClass;
  objc_super v6;

  -[MapsUICollectionViewAccessibility delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x2349135AC](CFSTR("SteppingPageViewController"));
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
    return 1;
  v6.receiver = self;
  v6.super_class = (Class)MapsUICollectionViewAccessibility;
  return -[MapsUICollectionViewAccessibility accessibilityCollectionViewBehavesLikeUIViewAccessibility](&v6, sel_accessibilityCollectionViewBehavesLikeUIViewAccessibility);
}

@end
