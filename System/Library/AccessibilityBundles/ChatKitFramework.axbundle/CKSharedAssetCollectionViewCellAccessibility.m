@implementation CKSharedAssetCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CKSharedAssetCollectionViewCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKSharedAssetCollectionViewCell"), CFSTR("previewTitleLabel"), "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;

  -[CKSharedAssetCollectionViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("previewTitleLabel"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
