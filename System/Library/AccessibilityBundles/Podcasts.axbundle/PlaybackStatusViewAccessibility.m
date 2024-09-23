@implementation PlaybackStatusViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("ShelfKitCollectionViews.PlaybackStatusView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ShelfKitCollectionViews.PlaybackStatusView"), CFSTR("accessibilityTimeRemainingString"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ShelfKitCollectionViews.PlaybackStatusView"), CFSTR("accessibilityPlayedDateString"), "@", 0);

}

- (id)accessibilityLabel
{
  return (id)-[PlaybackStatusViewAccessibility _accessibilityStringForLabelKeyValues:](self, "_accessibilityStringForLabelKeyValues:", CFSTR("accessibilityTimeRemainingString, accessibilityPlayedDateString"));
}

- (BOOL)_accessibilityViewIsVisible
{
  void *v3;
  BOOL v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, void *);
  void *v9;
  id v10;
  id location;

  objc_initWeak(&location, self);
  v6 = MEMORY[0x24BDAC760];
  v7 = 3221225472;
  v8 = __62__PlaybackStatusViewAccessibility__accessibilityViewIsVisible__block_invoke;
  v9 = &unk_2502FD0F8;
  objc_copyWeak(&v10, &location);
  -[PlaybackStatusViewAccessibility _accessibilityFindSubviewDescendantsPassingTest:](self, "_accessibilityFindSubviewDescendantsPassingTest:", &v6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count", v6, v7, v8, v9) != 0;

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
  return v4;
}

uint64_t __62__PlaybackStatusViewAccessibility__accessibilityViewIsVisible__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  uint64_t v5;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained == v3)
    v5 = 0;
  else
    v5 = objc_msgSend(v3, "_accessibilityViewIsVisible");

  return v5;
}

@end
