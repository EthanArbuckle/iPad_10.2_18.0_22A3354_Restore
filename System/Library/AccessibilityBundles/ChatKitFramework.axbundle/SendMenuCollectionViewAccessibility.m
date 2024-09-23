@implementation SendMenuCollectionViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("ChatKit.SendMenuCollectionView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)_accessibilitySubviewsForGettingElementsWithOptions:(id)a3
{
  id v4;
  void *v5;
  objc_super v7;

  v4 = a3;
  objc_msgSend(v4, "setShouldIncludeKeyboardObscuredElements:", 1);
  v7.receiver = self;
  v7.super_class = (Class)SendMenuCollectionViewAccessibility;
  -[SendMenuCollectionViewAccessibility _accessibilitySubviewsForGettingElementsWithOptions:](&v7, sel__accessibilitySubviewsForGettingElementsWithOptions_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
