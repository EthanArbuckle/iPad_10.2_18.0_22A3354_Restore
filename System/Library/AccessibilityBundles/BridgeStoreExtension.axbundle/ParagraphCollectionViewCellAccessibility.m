@implementation ParagraphCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("BridgeStoreExtension.ParagraphCollectionViewCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("BridgeStoreExtension.ParagraphCollectionViewCell"), CFSTR("accessibilityExpandableTextView"), "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return (id)-[ParagraphCollectionViewCellAccessibility _accessibilityStringForLabelKeyValues:](self, "_accessibilityStringForLabelKeyValues:", CFSTR("accessibilityExpandableTextView"));
}

@end
