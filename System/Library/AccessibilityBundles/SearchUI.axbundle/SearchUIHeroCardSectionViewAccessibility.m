@implementation SearchUIHeroCardSectionViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SearchUIHeroCardSectionView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)_axCachedBundleIdentifiers
{
  JUMPOUT(0x23491CE00);
}

- (void)_axSetCachedBundleIdentifiers:(id)a3
{
  __UIAccessibilitySetAssociatedObject();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SearchUIHeroCardSectionView"), CFSTR("titleLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SearchUIHeroCardSectionView"), CFSTR("subtitleLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SearchUIHeroCardSectionView"), CFSTR("buttonPressed:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SearchUIHeroCardSectionView"), CFSTR("punchoutIndicatorImageView"), "@", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("SearchUIImageView"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SearchUIImageView"), CFSTR("currentImage"), "@", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("SearchUIAppIconImage"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SearchUIAppIconImage"), CFSTR("bundleIdentifier"), "@", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("SearchUIHeroButton"));
  objc_msgSend(v3, "validateClass:", CFSTR("SearchUICommandButton"));
  objc_msgSend(v3, "validateProtocol:hasRequiredInstanceMethod:", CFSTR("SearchUICommandButton"), CFSTR("buttonItem"));
  objc_msgSend(v3, "validateProtocol:hasRequiredInstanceMethod:", CFSTR("SFCommandButtonItem"), CFSTR("command"));
  objc_msgSend(v3, "validateClass:conformsToProtocol:", CFSTR("SearchUIHeroButton"), CFSTR("SearchUICommandButton"));
  objc_msgSend(v3, "validateClass:conformsToProtocol:", CFSTR("SearchUICommandButton"), CFSTR("SearchUICommandButton"));
  objc_msgSend(v3, "validateClass:", CFSTR("SFToggleWatchListStatusCommand"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SearchUICommandButton"), CFSTR("watchListState"), "@", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("SearchUIWatchListState"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SearchUIWatchListState"), CFSTR("isWatchListed"), "B", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("SearchUIUtilities"));
  objc_msgSend(v3, "validateClass:hasClassMethod:withFullSignature:", CFSTR("SearchUIUtilities"), CFSTR("bundleIdentifierForApp:"), "@", "Q", 0);

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return (id)-[SearchUIHeroCardSectionViewAccessibility _accessibilityStringForLabelKeyValues:](self, "_accessibilityStringForLabelKeyValues:", CFSTR("titleLabel, subtitleLabel"));
}

- (id)accessibilityValue
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  -[SearchUIHeroCardSectionViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("punchoutIndicatorImageView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeValueForKey:", CFSTR("currentImage"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safeValueForKey:", CFSTR("bundleIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[SearchUIHeroCardSectionViewAccessibility _axLocalizedKeyForBundleID:](self, "_axLocalizedKeyForBundleID:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    accessibilityLocalizedString(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)SearchUIHeroCardSectionViewAccessibility;
    -[SearchUIHeroCardSectionViewAccessibility accessibilityValue](&v9, sel_accessibilityValue);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

- (id)accessibilityCustomActions
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  const __CFString *v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  __CFString *v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  id v16;
  id obj;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  -[SearchUIHeroCardSectionViewAccessibility _axCommandButtons](self, "_axCommandButtons");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v3, "count"));
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  obj = v3;
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v4)
  {
    v5 = v4;
    v6 = CFSTR("buttonItem.command");
    v7 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v19 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v9, "safeValueForKeyPath:", v6);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        NSClassFromString(CFSTR("SFToggleWatchListStatusCommand"));
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          if (-[SearchUIHeroCardSectionViewAccessibility _axWatchListStateForButton:](self, "_axWatchListStateForButton:", v9))
          {
            v11 = CFSTR("watchlist.remove");
          }
          else
          {
            v11 = CFSTR("watchlist.add");
          }
          accessibilityLocalizedString(v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = v6;
          v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6788]), "initWithName:target:selector:", v12, self, sel__axPerformCustomAction_);
          objc_msgSend(v14, "_accessibilitySetRetainedValue:forKey:", v9, CFSTR("AXHeroCommandButtonKey"));
          objc_msgSend(v16, "axSafelyAddObject:", v14);

          v6 = v13;
        }

      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v5);
  }

  return v16;
}

- (BOOL)_axPerformCustomAction:(id)a3
{
  id v3;
  char v4;
  id v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v3 = a3;
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  objc_msgSend(v3, "_accessibilityValueForKey:", CFSTR("AXHeroCommandButtonKey"));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  AXPerformSafeBlock();
  v4 = *((_BYTE *)v8 + 24);

  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __67__SearchUIHeroCardSectionViewAccessibility__axPerformCustomAction___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "buttonPressed:", *(_QWORD *)(a1 + 40));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  return result;
}

- (void)buttonPressed:(id)a3
{
  id v4;
  void *v5;
  char isKindOfClass;
  __CFString *v7;
  void *v8;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SearchUIHeroCardSectionViewAccessibility;
  -[SearchUIHeroCardSectionViewAccessibility buttonPressed:](&v9, sel_buttonPressed_, v4);
  objc_msgSend(v4, "safeValueForKey:", CFSTR("command"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSClassFromString(CFSTR("SFToggleWatchListStatusCommand"));
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    if (-[SearchUIHeroCardSectionViewAccessibility _axWatchListStateForButton:](self, "_axWatchListStateForButton:", v4))
    {
      v7 = CFSTR("watchlist.did.remove");
    }
    else
    {
      v7 = CFSTR("watchlist.did.add");
    }
    accessibilityLocalizedString(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    UIAccessibilitySpeak();

  }
}

- (id)_axCommandButtons
{
  if (_axCommandButtons_onceToken != -1)
    dispatch_once(&_axCommandButtons_onceToken, &__block_literal_global_4);
  return (id)-[SearchUIHeroCardSectionViewAccessibility _accessibilityFindSubviewDescendantsPassingTest:](self, "_accessibilityFindSubviewDescendantsPassingTest:", &__block_literal_global_245);
}

Class __61__SearchUIHeroCardSectionViewAccessibility__axCommandButtons__block_invoke()
{
  Class result;

  _axCommandButtons_heroButton = (uint64_t)NSClassFromString(CFSTR("SearchUIHeroButton"));
  result = NSClassFromString(CFSTR("SearchUICommandButton"));
  _axCommandButtons_commandButton = (uint64_t)result;
  return result;
}

uint64_t __61__SearchUIHeroCardSectionViewAccessibility__axCommandButtons__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;

  v2 = a2;
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_isKindOfClass() & 1) != 0)
    v3 = objc_msgSend(v2, "_accessibilityViewIsVisible");
  else
    v3 = 0;

  return v3;
}

- (BOOL)_axWatchListStateForButton:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  char v6;

  v3 = a3;
  objc_msgSend(v3, "safeValueForKey:", CFSTR("command"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSClassFromString(CFSTR("SFToggleWatchListStatusCommand"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "safeValueForKey:", CFSTR("watchListState"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "safeBoolForKey:", CFSTR("isWatchListed"));

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)_axLocalizedKeyForBundleID:(id)a3
{
  unint64_t v3;

  v3 = -[SearchUIHeroCardSectionViewAccessibility _axApplicationForBundleIdentifier:](self, "_axApplicationForBundleIdentifier:", a3);
  if (v3 - 1 > 0x15)
    return CFSTR("app.generic");
  else
    return off_25033DEA8[v3 - 1];
}

- (unint64_t)_axApplicationForBundleIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  char v21;

  v4 = a3;
  -[SearchUIHeroCardSectionViewAccessibility _axCachedBundleIdentifiers](self, "_axCachedBundleIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (int)objc_msgSend(v7, "intValue");

    goto LABEL_12;
  }
  if (_axApplicationForBundleIdentifier__onceToken == -1)
  {
    if (v5)
      goto LABEL_6;
    goto LABEL_5;
  }
  dispatch_once(&_axApplicationForBundleIdentifier__onceToken, &__block_literal_global_292);
  if (!v5)
  {
LABEL_5:
    v9 = (void *)objc_opt_new();
    -[SearchUIHeroCardSectionViewAccessibility _axSetCachedBundleIdentifiers:](self, "_axSetCachedBundleIdentifiers:", v9);

  }
LABEL_6:
  v10 = 0;
  do
  {
    v21 = 0;
    objc_opt_class();
    v15 = 0;
    v16 = &v15;
    v17 = 0x3032000000;
    v18 = __Block_byref_object_copy__0;
    v19 = __Block_byref_object_dispose__0;
    v20 = 0;
    AXPerformSafeBlock();
    v11 = (id)v16[5];
    _Block_object_dispose(&v15, 8);

    __UIAccessibilityCastAsClass();
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21)
      abort();
    if (objc_msgSend(v12, "isEqualToString:", v4))
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v10);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v13, v4);

    }
    v10 = (v10 + 1);
  }
  while ((_DWORD)v10 != 23);
  v8 = 0;
LABEL_12:

  return v8;
}

Class __78__SearchUIHeroCardSectionViewAccessibility__axApplicationForBundleIdentifier___block_invoke()
{
  Class result;

  result = NSClassFromString(CFSTR("SearchUIUtilities"));
  _axApplicationForBundleIdentifier__searchUIUtilities = (uint64_t)result;
  return result;
}

void __78__SearchUIHeroCardSectionViewAccessibility__axApplicationForBundleIdentifier___block_invoke_295(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend((id)_axApplicationForBundleIdentifier__searchUIUtilities, "bundleIdentifierForApp:", *(int *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

@end
