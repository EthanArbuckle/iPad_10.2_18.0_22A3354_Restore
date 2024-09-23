@implementation TabOverviewDisplayItemAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MobileSafari.TabOverviewDisplayItem");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("MobileSafari.TabOverviewDisplayItem"), CFSTR("barManager"), "BarManager");
  objc_msgSend(v3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("MobileSafari.TabOverviewDisplayItem[class].BarManager"), CFSTR("registrations"), "Array<TabOverviewDisplayItemBarRegistration>");

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  objc_super v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v14.receiver = self;
  v14.super_class = (Class)TabOverviewDisplayItemAccessibility;
  -[TabOverviewDisplayItemAccessibility _accessibilityLoadAccessibilityInformation](&v14, sel__accessibilityLoadAccessibilityInformation);
  -[TabOverviewDisplayItemAccessibility safeSwiftValueForKey:](self, "safeSwiftValueForKey:", CFSTR("$__lazy_storage_$_barManager"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeSwiftArrayForKey:", CFSTR("registrations"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v8), "safeSwiftDictionaryForKey:", CFSTR("barButtonItems"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_2);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
    }
    while (v6);
  }

}

void __81__TabOverviewDisplayItemAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  __CFString *v5;
  void *v6;
  id v7;

  v7 = a3;
  objc_msgSend(a2, "safeSwiftEnumCase");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("add")) & 1) != 0)
  {
    v5 = CFSTR("new.tab.button");
LABEL_7:
    accessibilityMobileSafariLocalizedString(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setAccessibilityLabel:", v6);

    goto LABEL_8;
  }
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("tabGroups")) & 1) != 0)
  {
    v5 = CFSTR("tab.groups.button");
    goto LABEL_7;
  }
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("sidebar")))
  {
    v5 = CFSTR("show.sidebar.button");
    goto LABEL_7;
  }
LABEL_8:

}

@end
