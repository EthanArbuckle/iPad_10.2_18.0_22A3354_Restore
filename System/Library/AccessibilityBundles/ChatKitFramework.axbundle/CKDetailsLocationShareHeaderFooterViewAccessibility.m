@implementation CKDetailsLocationShareHeaderFooterViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CKDetailsLocationShareHeaderFooterView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  objc_super v4;

  if (AXRequestingClient() == 4 || AXRequestingClient() == 5)
    return 1;
  v4.receiver = self;
  v4.super_class = (Class)CKDetailsLocationShareHeaderFooterViewAccessibility;
  return -[CKDetailsLocationShareHeaderFooterViewAccessibility isAccessibilityElement](&v4, sel_isAccessibilityElement);
}

- (BOOL)accessibilityRespondsToUserInteraction
{
  return 1;
}

@end
