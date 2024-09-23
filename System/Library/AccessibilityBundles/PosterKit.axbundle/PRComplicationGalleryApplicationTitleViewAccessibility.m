@implementation PRComplicationGalleryApplicationTitleViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PRComplicationGalleryApplicationTitleView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PRComplicationGalleryApplicationTitleView"), CFSTR("textLabel"), "@", 0);
}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;

  -[PRComplicationGalleryApplicationTitleViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("textLabel"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (unint64_t)accessibilityTraits
{
  void *v3;
  unint64_t v4;
  objc_super v6;
  objc_super v7;

  -[PRComplicationGalleryApplicationTitleViewAccessibility accessibilityLabel](self, "accessibilityLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v7.receiver = self;
    v7.super_class = (Class)PRComplicationGalleryApplicationTitleViewAccessibility;
    v4 = *MEMORY[0x24BDF73C0] | -[PRComplicationGalleryApplicationTitleViewAccessibility accessibilityTraits](&v7, sel_accessibilityTraits);
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)PRComplicationGalleryApplicationTitleViewAccessibility;
    v4 = -[PRComplicationGalleryApplicationTitleViewAccessibility accessibilityTraits](&v6, sel_accessibilityTraits);
  }

  return v4;
}

- (BOOL)isAccessibilityElement
{
  void *v2;
  BOOL v3;

  -[PRComplicationGalleryApplicationTitleViewAccessibility accessibilityLabel](self, "accessibilityLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

@end
