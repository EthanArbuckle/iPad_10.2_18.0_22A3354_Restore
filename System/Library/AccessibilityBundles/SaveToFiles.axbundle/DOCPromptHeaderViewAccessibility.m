@implementation DOCPromptHeaderViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("Files.DOCPromptHeaderView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SaveToFiles.DOCPromptHeaderView"), CFSTR("promptText"), "@", 0);
}

- (id)accessibilityLabel
{
  return (id)-[DOCPromptHeaderViewAccessibility safeStringForKey:](self, "safeStringForKey:", CFSTR("promptText"));
}

@end
