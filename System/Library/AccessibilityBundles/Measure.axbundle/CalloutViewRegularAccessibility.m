@implementation CalloutViewRegularAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("Measure.CalloutViewRegular");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("Measure.CalloutViewRegular"), CFSTR("updateText:"), "v", "q", 0);
}

- (void)updateText:(int64_t)a3
{
  void *v5;
  objc_super v6;

  -[CalloutViewAccessibility axCalloutText](self, "axCalloutText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6.receiver = self;
  v6.super_class = (Class)CalloutViewRegularAccessibility;
  -[CalloutViewRegularAccessibility updateText:](&v6, sel_updateText_, a3);
  -[CalloutViewAccessibility axDidUpdateFromPreviousCalloutText:](self, "axDidUpdateFromPreviousCalloutText:", v5);

}

@end
