@implementation PRComplicationGalleryApplicationCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PRComplicationGalleryApplicationCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PRComplicationGalleryApplicationCell"), CFSTR("titleView"), "@", 0);
}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;

  -[PRComplicationGalleryApplicationCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("titleView"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PRComplicationGalleryApplicationCellAccessibility;
  return *MEMORY[0x24BDF73B0] | -[PRComplicationGalleryApplicationCellAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
}

@end
