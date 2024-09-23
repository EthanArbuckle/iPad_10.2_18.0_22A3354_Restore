@implementation CKLocationAttachmentItemAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CKLocationAttachmentItem");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(CFSTR("map.attachment"));
}

@end
