@implementation CKMentionSuggestionCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CKMentionSuggestionCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKMentionSuggestionCell"), CFSTR("handleLabel"), "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;

  -[CKMentionSuggestionCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("handleLabel"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)_accessibilityShouldIncludeRowRangeInElementDescription
{
  return 1;
}

@end
