@implementation NowPlayingQueueCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("Music.NowPlayingQueueCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("Music.NowPlayingQueueCell"), CFSTR("title"), "Optional<String>");
  objc_msgSend(v3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("Music.NowPlayingQueueCell"), CFSTR("subtitle"), "Optional<String>");
  objc_msgSend(v3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("Music.NowPlayingQueueCell"), CFSTR("explicitBadgeLabel"), "UILabel");
  objc_msgSend(v3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("Music.NowPlayingQueueCell"), CFSTR("isExplicit"), "Bool");

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v9;

  objc_opt_class();
  -[NowPlayingQueueCellAccessibility safeSwiftValueForKey:](self, "safeSwiftValueForKey:", CFSTR("explicitBadgeLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[NowPlayingQueueCellAccessibility safeSwiftStringForKey:](self, "safeSwiftStringForKey:", CFSTR("title"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NowPlayingQueueCellAccessibility safeSwiftStringForKey:](self, "safeSwiftStringForKey:", CFSTR("subtitle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((-[NowPlayingQueueCellAccessibility safeSwiftBoolForKey:](self, "safeSwiftBoolForKey:", CFSTR("isExplicit")) & 1) != 0)
  {
    objc_msgSend(v4, "accessibilityLabel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    __AXStringForVariables();
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    __AXStringForVariables();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

@end
