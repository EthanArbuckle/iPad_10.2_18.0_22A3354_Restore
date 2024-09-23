@implementation UGCPhotoThumbnailCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UGCPhotoThumbnailCollectionViewCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BDF73C8] | *MEMORY[0x24BDF73B0];
}

@end
