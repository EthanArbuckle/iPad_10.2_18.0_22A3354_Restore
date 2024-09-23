@implementation PKEnhancedMerchantCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PKEnhancedMerchantCollectionViewCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PKEnhancedMerchantCollectionViewCell"), CFSTR("enhancedMerchant"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PKAccountEnhancedMerchant"), CFSTR("name"), "@", 0);

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;

  -[PKEnhancedMerchantCollectionViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("enhancedMerchant"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeStringForKey:", CFSTR("name"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BDF73B0];
}

@end
