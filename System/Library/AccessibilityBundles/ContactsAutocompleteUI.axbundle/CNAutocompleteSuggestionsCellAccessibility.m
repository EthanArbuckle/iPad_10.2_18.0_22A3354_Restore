@implementation CNAutocompleteSuggestionsCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CNAutocompleteSuggestionsCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CNAutocompleteSuggestionsCell"), CFSTR("displayString"), "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return (id)-[CNAutocompleteSuggestionsCellAccessibility safeStringForKey:](self, "safeStringForKey:", CFSTR("displayString"));
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CNAutocompleteSuggestionsCellAccessibility;
  return *MEMORY[0x24BDF73B0] | -[CNAutocompleteSuggestionsCellAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
}

@end
