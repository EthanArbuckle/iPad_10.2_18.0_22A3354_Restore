@implementation PersonHeightViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("Measure.PersonHeightView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("Measure.PersonHeightView"), CFSTR("toggleViewVisibilityWithIsVisible:"), "v", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("Measure.PersonHeightView"), CFSTR("_accessibilitySpeakableHeight"), "@", 0);

}

- (void)toggleViewVisibilityWithIsVisible:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v3 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PersonHeightViewAccessibility;
  -[PersonHeightViewAccessibility toggleViewVisibilityWithIsVisible:](&v9, sel_toggleViewVisibilityWithIsVisible_);
  if (v3)
  {
    -[PersonHeightViewAccessibility safeStringForKey:](self, "safeStringForKey:", CFSTR("_accessibilitySpeakableHeight"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)MEMORY[0x24BDD17C8];
    accessibilityLocalizedString(CFSTR("HEIGHT_ANNOUNCEMENT"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringWithFormat:", v7, v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    AXMeasureSpeakMeasurementAnnouncement(v8);
  }
}

@end
