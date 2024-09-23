@implementation CKMentionsUtilitiesAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CKMentionsUtilities");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasClassMethod:withFullSignature:", CFSTR("CKMentionsUtilities"), CFSTR("range:containsEmptySelectedRange:"), "B", "{_NSRange=QQ}", "{_NSRange=QQ}", 0);
}

+ (BOOL)range:(_NSRange)a3 containsEmptySelectedRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  NSUInteger v6;
  NSUInteger v7;
  objc_super v10;

  length = a4.length;
  location = a4.location;
  v6 = a3.length;
  v7 = a3.location;
  if (UIAccessibilityIsVoiceOverRunning() && !length && v6)
    return 1;
  v10.receiver = a1;
  v10.super_class = (Class)&OBJC_METACLASS___CKMentionsUtilitiesAccessibility;
  return objc_msgSendSuper2(&v10, sel_range_containsEmptySelectedRange_, v7, v6, location, length);
}

@end
