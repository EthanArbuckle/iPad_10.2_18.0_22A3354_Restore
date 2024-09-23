@implementation UGCAddPhotoCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UGCAddPhotoCollectionViewCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("UGCAddPhotoCollectionViewCell"), CFSTR("_cameraLabel"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UGCAddPhotoCollectionViewCell"), CFSTR("isDimmed"), "B", 0);

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;

  -[UGCAddPhotoCollectionViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_cameraLabel"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (unint64_t)accessibilityTraits
{
  uint64_t v2;
  int v3;
  uint64_t v4;

  v2 = *MEMORY[0x24BDF73B0];
  v3 = -[UGCAddPhotoCollectionViewCellAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("isDimmed"));
  v4 = *MEMORY[0x24BDF73E8];
  if (!v3)
    v4 = 0;
  return v4 | v2;
}

@end
