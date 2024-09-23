@implementation TUISuggestionCandidateCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("TUISuggestionCandidateCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("TUISuggestionCandidateCell"), CFSTR("textLabel"), "@", 0);
}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;

  -[TUISuggestionCandidateCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("textLabel"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BEBAEA8];
}

- (BOOL)isAccessibilityElement
{
  BOOL v3;
  void *v4;

  if (AXRequestingClient() == 4)
    return 1;
  -[TUISuggestionCandidateCellAccessibility accessibilityLabel](self, "accessibilityLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v4, "length") != 0;

  return v3;
}

@end
