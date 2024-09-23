@implementation HKAudiogramChartViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("HKAudiogramChartViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HKAudiogramChartViewController"), CFSTR("_resetCurrentGraph"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HKAudiogramChartViewController"), CFSTR("_updateHeaderState"), "v", 0);

}

@end
