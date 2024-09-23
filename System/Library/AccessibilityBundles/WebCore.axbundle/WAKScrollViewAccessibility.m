@implementation WAKScrollViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("WAKScrollView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  return 0;
}

- (BOOL)accessibilityIsIgnored
{
  return 0;
}

- (int64_t)accessibilityElementCount
{
  return 1;
}

- (id)accessibilityElementAtIndex:(int64_t)a3
{
  void *v3;
  void *v4;
  void *v5;

  -[WAKScrollViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("contentView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeValueForKey:", CFSTR("documentView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safeValueForKey:", CFSTR("accessibilityRootElement"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (int64_t)indexOfAccessibilityElement:(id)a3
{
  return 0;
}

- (id)accessibilityContainer
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v6;
  const __CFString *v7;

  -[WAKScrollViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("superview"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeValueForKey:", CFSTR("superview"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  NSClassFromString(CFSTR("WebHTMLView"));
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v7 = CFSTR("******** AX: ScrollView cannot find its WebHTMLView");
    LOBYTE(v6) = 1;
    _AXLogWithFacility();
  }
  objc_msgSend(v3, "_accessibilityParentForSubview:", v2, v6, v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)accessibilityObject
{
  return 0;
}

@end
