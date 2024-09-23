@implementation MFSwipableCollectionViewLayoutAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MFSwipableCollectionViewLayout");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("MFSwipableCollectionViewLayout"), CFSTR("UICollectionViewLayout"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UICollectionViewLayout"), CFSTR("initialLayoutAttributesForAppearingItemAtIndexPath:"), "@", 0);

}

- (id)initialLayoutAttributesForAppearingItemAtIndexPath:(id)a3
{
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MFSwipableCollectionViewLayoutAccessibility;
  -[MFSwipableCollectionViewLayoutAccessibility initialLayoutAttributesForAppearingItemAtIndexPath:](&v5, sel_initialLayoutAttributesForAppearingItemAtIndexPath_, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (UIAccessibilityIsVoiceOverRunning())
    objc_msgSend(v3, "setAlpha:", 1.0);
  return v3;
}

@end
