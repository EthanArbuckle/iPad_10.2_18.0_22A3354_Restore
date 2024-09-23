@implementation MOSuggestionSheetInterstitialViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MomentsUIService.MOSuggestionSheetInterstitialView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)accessibilityViewIsModal
{
  return 1;
}

@end
