@implementation HomeCuratedCollectionsTableViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("HomeCuratedCollectionsTableViewCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceVariable:withType:", CFSTR("HomeCuratedCollectionsTableViewCell"), CFSTR("_carouselView"), "MKCollectionsCarouselView");
}

- (id)accessibilityElements
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDBCE30];
  -[HomeCuratedCollectionsTableViewCellAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_carouselView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "axArrayByIgnoringNilElementsWithCount:", 1, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
