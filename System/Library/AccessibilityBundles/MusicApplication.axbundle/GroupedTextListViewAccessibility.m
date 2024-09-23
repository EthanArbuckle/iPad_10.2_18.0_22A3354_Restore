@implementation GroupedTextListViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MusicApplication.GroupedTextListView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MusicApplication.GroupedTextListView"), CFSTR("accessibilityListGroupStrings"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MusicApplication.GroupedTextListView"), CFSTR("accessibilityStackViews"), "@", 0);

}

- (BOOL)isAccessibilityElement
{
  return 0;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  char v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)GroupedTextListViewAccessibility;
  -[GroupedTextListViewAccessibility _accessibilityLoadAccessibilityInformation](&v11, sel__accessibilityLoadAccessibilityInformation);
  objc_opt_class();
  -[GroupedTextListViewAccessibility safeArrayForKey:](self, "safeArrayForKey:", CFSTR("accessibilityListGroupStrings"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = 0;
  objc_opt_class();
  -[GroupedTextListViewAccessibility safeArrayForKey:](self, "safeArrayForKey:", CFSTR("accessibilityStackViews"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v4, "count");
  if (v7 == objc_msgSend(v6, "count"))
  {
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __78__GroupedTextListViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
    v8[3] = &unk_2502C9338;
    v9 = v4;
    objc_msgSend(v6, "enumerateObjectsUsingBlock:", v8);

  }
}

void __78__GroupedTextListViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  id v6;

  v5 = a2;
  objc_msgSend(v5, "setIsAccessibilityElement:", 1);
  objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAccessibilityLabel:", v6);

}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)GroupedTextListViewAccessibility;
  -[GroupedTextListViewAccessibility layoutSubviews](&v3, sel_layoutSubviews);
  -[GroupedTextListViewAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

@end
