@implementation GKLeaderboardMetadataViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("GKLeaderboardMetadataView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("GKLeaderboardMetadataView"), CFSTR("rank"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("GKLeaderboardMetadataView"), CFSTR("title"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("GKLeaderboardMetadataView"), CFSTR("footnote"), "@", 0);

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  const __CFString *v5;
  void *v6;

  objc_opt_class();
  -[GKLeaderboardMetadataViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("rank"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "_accessibilityViewIsVisible"))
    v5 = CFSTR("rank, title, footnote");
  else
    v5 = CFSTR("title, footnote");
  -[GKLeaderboardMetadataViewAccessibility _accessibilityStringForLabelKeyValues:](self, "_accessibilityStringForLabelKeyValues:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
