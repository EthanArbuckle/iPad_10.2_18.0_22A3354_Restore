@implementation PosterSectionRemovalViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PosterBoard.PosterSectionRemovalView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasProperty:withType:", CFSTR("PosterBoard.PosterSectionRemovalView"), CFSTR("deleteButton"), "@");
}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PosterSectionRemovalViewAccessibility;
  -[PosterSectionRemovalViewAccessibility _accessibilityLoadAccessibilityInformation](&v5, sel__accessibilityLoadAccessibilityInformation);
  -[PosterSectionRemovalViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("deleteButton"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilityLocalizedString(CFSTR("lock.screen.poster.cell.delete.label"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityLabel:", v4);

}

- (BOOL)accessibilityViewIsModal
{
  return 1;
}

@end
