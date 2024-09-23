@implementation CNAssistantSnippetViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CNAssistantSnippetView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  return 0;
}

@end
