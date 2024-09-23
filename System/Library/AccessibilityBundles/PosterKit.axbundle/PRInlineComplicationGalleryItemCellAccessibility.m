@implementation PRInlineComplicationGalleryItemCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PRInlineComplicationGalleryItemCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PRInlineComplicationGalleryItemCell"), CFSTR("title"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PRInlineComplicationGalleryItemCell"), CFSTR("contentViewController"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("CHUISWidgetHostViewController"), CFSTR("_descriptor"), "CHSWidgetDescriptor");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PRInlineComplicationGalleryItemCell"), CFSTR("showsCheckmark"), "B", 0);

}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;

  -[PRInlineComplicationGalleryItemCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("contentViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  NSClassFromString(CFSTR("CHUISWidgetHostViewController"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[PRInlineComplicationGalleryItemCellAccessibility safeValueForKeyPath:](self, "safeValueForKeyPath:", CFSTR("contentViewController._descriptor"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    AXWidgetAndAppName(v4, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[PRInlineComplicationGalleryItemCellAccessibility safeStringForKey:](self, "safeStringForKey:", CFSTR("title"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

- (id)accessibilityCustomContent
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  objc_super v10;

  -[PRInlineComplicationGalleryItemCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("contentViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  NSClassFromString(CFSTR("CHUISWidgetHostViewController"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[PRInlineComplicationGalleryItemCellAccessibility safeValueForKeyPath:](self, "safeValueForKeyPath:", CFSTR("contentViewController._descriptor"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  AXWidgetDescription(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)PRInlineComplicationGalleryItemCellAccessibility;
    -[PRInlineComplicationGalleryItemCellAccessibility accessibilityCustomContent](&v10, sel_accessibilityCustomContent);
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;

  return v8;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  unint64_t v3;
  int v4;
  uint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PRInlineComplicationGalleryItemCellAccessibility;
  v3 = *MEMORY[0x24BDF73B0] | -[PRInlineComplicationGalleryItemCellAccessibility accessibilityTraits](&v7, sel_accessibilityTraits);
  v4 = -[PRInlineComplicationGalleryItemCellAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("showsCheckmark"));
  v5 = *MEMORY[0x24BDF7400];
  if (!v4)
    v5 = 0;
  return v3 | v5;
}

@end
