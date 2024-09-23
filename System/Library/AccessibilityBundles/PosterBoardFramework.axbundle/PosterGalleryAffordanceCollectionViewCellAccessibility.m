@implementation PosterGalleryAffordanceCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PosterBoard.PosterGalleryAffordanceCollectionViewCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(CFSTR("poster.gallery.affordance.cell.label"));
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BDF73B0];
}

- (id)accessibilityIdentifier
{
  return CFSTR("posterboard-affordance-cell-add-button");
}

@end
