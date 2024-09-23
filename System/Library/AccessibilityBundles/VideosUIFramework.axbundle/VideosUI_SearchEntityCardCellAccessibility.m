@implementation VideosUI_SearchEntityCardCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("VideosUI.SearchEntityCardCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasProperty:withType:", CFSTR("VideosUI.SearchEntityCardCell"), CFSTR("accessibilityTitleLabel"), "@");
  objc_msgSend(v3, "validateClass:hasProperty:withType:", CFSTR("VideosUI.SearchEntityCardCell"), CFSTR("accessibilitySubitleLabel"), "@");
  objc_msgSend(v3, "validateClass:hasProperty:withType:", CFSTR("VideosUI.SearchEntityCardCell"), CFSTR("accessibilityCaptionLabel"), "@");

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return (id)-[VideosUI_SearchEntityCardCellAccessibility _accessibilityStringForLabelKeyValues:](self, "_accessibilityStringForLabelKeyValues:", CFSTR("accessibilityTitleLabel, accessibilitySubitleLabel, accessibilityCaptionLabel"));
}

@end
