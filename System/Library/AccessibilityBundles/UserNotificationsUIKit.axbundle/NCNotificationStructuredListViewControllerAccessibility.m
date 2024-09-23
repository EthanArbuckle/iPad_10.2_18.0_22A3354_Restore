@implementation NCNotificationStructuredListViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("NCNotificationStructuredListViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("NCNotificationStructuredListViewController"), CFSTR("listModel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("NCNotificationStructuredListViewController"), CFSTR("dismissModalFullScreenAnimated:"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("NCNotificationStructuredSectionList"), CFSTR("listView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("NCNotificationStructuredSectionList"), CFSTR("allNotificationRequests"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("NCNotificationRootList"), CFSTR("incomingSectionList"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("NCNotificationListView"), CFSTR("visibleViews"), "@", 0);

}

- (BOOL)accessibilityPerformEscape
{
  int v2;
  void *v3;
  uint64_t v5;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  v5 = MEMORY[0x24BDAC760];
  AXPerformSafeBlock();
  v2 = *((unsigned __int8 *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  if (!v2)
  {
    objc_msgSend(MEMORY[0x24BE006F0], "server", v5, 3221225472, __85__NCNotificationStructuredListViewControllerAccessibility_accessibilityPerformEscape__block_invoke, &unk_2503BE008, self, &v7);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "hideNotificationCenter");

  }
  return 1;
}

uint64_t __85__NCNotificationStructuredListViewControllerAccessibility_accessibilityPerformEscape__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "dismissModalFullScreenAnimated:", 1);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (id)_accessibilityNotificationSummary:(unint64_t)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  _QWORD v17[4];
  id v18;
  id v19;
  unint64_t v20;

  v5 = objc_alloc_init(MEMORY[0x24BDD16A8]);
  -[NCNotificationStructuredListViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("listModel"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "safeValueForKey:", CFSTR("incomingSectionList"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "safeValueForKey:", CFSTR("listView"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "safeDictionaryForKey:", CFSTR("visibleViews"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "allKeys");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "sortedArrayUsingComparator:", &__block_literal_global_8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __93__NCNotificationStructuredListViewControllerAccessibility__accessibilityNotificationSummary___block_invoke_2;
  v17[3] = &unk_2503BE228;
  v18 = v9;
  v12 = v5;
  v19 = v12;
  v20 = a3;
  v13 = v9;
  objc_msgSend(v11, "enumerateObjectsUsingBlock:", v17);
  v14 = v19;
  v15 = v12;

  return v15;
}

uint64_t __93__NCNotificationStructuredListViewControllerAccessibility__accessibilityNotificationSummary___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

void __93__NCNotificationStructuredListViewControllerAccessibility__accessibilityNotificationSummary___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;

  v7 = a2;
  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(a1 + 40), "length"))
    objc_msgSend(*(id *)(a1 + 40), "appendString:", CFSTR(", "));
  objc_msgSend(v8, "accessibilityLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    MEMORY[0x2349233D4](CFSTR("NCNotificationListView"));
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_opt_class();
      __UIAccessibilityCastAsSafeCategory();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "_accessibilityListCell");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "accessibilityLabel");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v9 = 0;
    }
  }
  if (objc_msgSend(v9, "length"))
    objc_msgSend(*(id *)(a1 + 40), "appendString:", v9);
  v12 = *(_QWORD *)(a1 + 48);
  if (v12 && a3 + 1 == v12)
    *a4 = 1;

}

- (unint64_t)_accessibilityNotificationCount
{
  void *v2;
  unint64_t v3;

  -[NCNotificationStructuredListViewControllerAccessibility _axRequests](self, "_axRequests");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (id)_axRequests
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[NCNotificationStructuredListViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("listModel"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeValueForKey:", CFSTR("incomingSectionList"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeArrayForKey:", CFSTR("allNotificationRequests"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "ax_filteredArrayUsingBlock:", &__block_literal_global_209);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t __70__NCNotificationStructuredListViewControllerAccessibility__axRequests__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  int v5;

  v2 = a2;
  __UIAccessibilitySafeClass();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sectionIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.donotdisturb"));

  return v5 ^ 1u;
}

@end
