@implementation _CNAtomTextAttachmentAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_CNAtomTextAttachment");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_CNAtomTextAttachment"), CFSTR("atomView"), "@", 0);
}

- (id)accessibilityLabel
{
  return (id)-[_CNAtomTextAttachmentAccessibility _accessibilityStringForLabelKeyValues:](self, "_accessibilityStringForLabelKeyValues:", CFSTR("atomView"));
}

@end
