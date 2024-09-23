@implementation HighlightTextViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SequoiaTranslator.HighlightTextView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_accessibilityCanDrag
{
  return 0;
}

@end
