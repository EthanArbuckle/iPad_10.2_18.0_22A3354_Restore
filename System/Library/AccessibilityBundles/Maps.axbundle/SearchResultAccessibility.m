@implementation SearchResultAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SearchResult");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v12;
  const __CFString *v13;

  -[SearchResultAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("infoCardTitle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SearchResultAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("locationTitle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isEqualToString:", v4))
  {
    v5 = v3;
  }
  else
  {
    v12 = v4;
    v13 = CFSTR("__AXStringForVariablesSentinel");
    __UIAXStringForVariables();
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;
  -[SearchResultAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("appearance"), v12, v13);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "integerValue");

  if (v8 == 2)
  {
    AXMapsLocString(CFSTR("ROUTE_ORIGIN"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAXStringForVariables();
    v10 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v10;
  }

  return v6;
}

@end
