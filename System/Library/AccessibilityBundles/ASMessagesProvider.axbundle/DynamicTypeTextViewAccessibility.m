@implementation DynamicTypeTextViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("ASMessagesProvider.DynamicTypeTextView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

@end
