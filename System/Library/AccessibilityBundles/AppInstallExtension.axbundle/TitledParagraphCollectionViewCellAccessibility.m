@implementation TitledParagraphCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("AppInstallExtension.TitledParagraphCollectionViewCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AppInstallExtension.TitledParagraphCollectionViewCell"), CFSTR("accessibilitytPrimarySubtitleLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AppInstallExtension.TitledParagraphCollectionViewCell"), CFSTR("accessibilitySecondarySubtitleLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AppInstallExtension.TitledParagraphCollectionViewCell"), CFSTR("accessibilityExpandableTextView"), "@", 0);

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return (id)-[TitledParagraphCollectionViewCellAccessibility _accessibilityStringForLabelKeyValues:](self, "_accessibilityStringForLabelKeyValues:", CFSTR("accessibilitytPrimarySubtitleLabel, accessibilitySecondarySubtitleLabel, accessibilityExpandableTextView"));
}

@end
