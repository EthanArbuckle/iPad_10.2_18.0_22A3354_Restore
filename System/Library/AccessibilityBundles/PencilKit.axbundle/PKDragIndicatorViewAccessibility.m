@implementation PKDragIndicatorViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PKDragIndicatorView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return accessibilityPencilKitLocalizedString(CFSTR("tool.palette.drag.indicator.label"));
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BEBB110];
}

- (id)accessibilityHint
{
  return accessibilityPencilKitLocalizedString(CFSTR("tool.palette.drag.indicator.hint"));
}

@end
