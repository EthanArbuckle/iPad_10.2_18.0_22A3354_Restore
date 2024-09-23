@implementation BucketCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MobileMail.BucketCollectionViewCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("BucketCollectionViewCell"), CFSTR("UICollectionViewCell"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("BucketCollectionViewCell"), CFSTR("accessibilityBucketCollectConfiguration"), "@", 0);

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  id v9;

  -[BucketCollectionViewCellAccessibility safeArrayForKey:](self, "safeArrayForKey:", CFSTR("accessibilityBucketCollectConfiguration"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  objc_msgSend(v2, "axSafeObjectAtIndex:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "length"))
    goto LABEL_5;
  objc_opt_class();
  objc_msgSend(v2, "axSafeObjectAtIndex:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "lowercaseString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("clock"));

  if (!v8)
  {

LABEL_5:
    v9 = v4;
    goto LABEL_6;
  }
  accessibilityLocalizedString(CFSTR("mail.filter.button.later"));
  v9 = (id)objc_claimAutoreleasedReturnValue();

LABEL_6:
  return v9;
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BucketCollectionViewCellAccessibility;
  return *MEMORY[0x24BDF73B0] | -[BucketCollectionViewCellAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
}

- (id)accessibilityHint
{
  return accessibilityLocalizedString(CFSTR("mail.filter.button.hint"));
}

@end
