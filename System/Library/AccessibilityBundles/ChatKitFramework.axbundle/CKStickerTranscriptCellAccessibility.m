@implementation CKStickerTranscriptCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CKStickerTranscriptCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  return AXDoesRequestingClientDeserveAutomation() != 0;
}

- (id)accessibilityIdentifier
{
  return CFSTR("dragged.and.dropped.sticker.cell");
}

- (BOOL)accessibilityElementsHidden
{
  return AXDoesRequestingClientDeserveAutomation() == 0;
}

@end
