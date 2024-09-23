@implementation MRUMediaSuggestionsViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MRUMediaSuggestionsView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (int64_t)accessibilityContainerType
{
  return 4;
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(CFSTR("media.suggestions.label"));
}

@end
