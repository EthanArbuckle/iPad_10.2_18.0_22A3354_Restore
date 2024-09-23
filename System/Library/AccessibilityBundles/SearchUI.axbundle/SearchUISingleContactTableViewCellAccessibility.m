@implementation SearchUISingleContactTableViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SearchUISingleContactTableViewCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SearchUISingleContactTableViewCell"), CFSTR("textAreaView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SearchUISingleContactTableViewCell"), CFSTR("accessoryViewControllerForResult"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SearchUIContactActionButton"), CFSTR("actions"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SearchUIAccessoryViewController"), CFSTR("view"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CNQuickAction"), CFSTR("perform"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CNQuickAction"), CFSTR("category"), "@", 0);

}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SearchUISingleContactTableViewCellAccessibility;
  -[SearchUISingleContactTableViewCellAccessibility accessibilityLabel](&v6, sel_accessibilityLabel);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilityLocalizedString(CFSTR("suggestion.contact"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)accessibilityCustomActions
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v14;
  const __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  id obj;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  char v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  -[SearchUISingleContactTableViewCellAccessibility _axActionButton](self, "_axActionButton");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0;
  objc_opt_class();
  objc_msgSend(v2, "safeValueForKey:", CFSTR("actions"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 && objc_msgSend(v4, "count"))
  {
    v18 = v2;
    v21 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v4, "count"));
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    obj = v4;
    v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v23;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v23 != v7)
            objc_enumerationMutation(obj);
          v9 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v8);
          objc_msgSend(v9, "safeValueForKey:", CFSTR("category"), v14, v15, v16, v17);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          if (AXLocalizedStringFromQuickActionCategory_onceToken != -1)
            dispatch_once(&AXLocalizedStringFromQuickActionCategory_onceToken, &__block_literal_global_12);
          objc_msgSend((id)AXLocalizedStringFromQuickActionCategory_AXQuickActionCategoryTable, "objectForKeyedSubscript:", v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (v11)
          {
            v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6788]), "initWithName:target:selector:", v11, self, sel__axPerformCustomAction_);
            objc_msgSend(v12, "_accessibilitySetRetainedValue:forKey:", v9, CFSTR("AXCNActionKey"));
            objc_msgSend(v21, "addObject:", v12);

          }
          else
          {
            v16 = v9;
            v17 = v10;
            v15 = CFSTR("Could not create title for action %@ with category %@");
            LOBYTE(v14) = 1;
            _AXLogWithFacility();
          }

          ++v8;
        }
        while (v6 != v8);
        v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
      }
      while (v6);
    }

    v2 = v18;
  }
  else
  {
    _AXLogWithFacility();
    v21 = 0;
  }

  return v21;
}

- (void)_axPerformCustomAction:(id)a3
{
  id v3;
  void *v4;

  objc_msgSend(a3, "_accessibilityValueForKey:", CFSTR("AXCNActionKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v4;
  AXPerformSafeBlock();

}

uint64_t __74__SearchUISingleContactTableViewCellAccessibility__axPerformCustomAction___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "perform");
}

- (void)updateThumbnailViewForResult:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SearchUISingleContactTableViewCellAccessibility;
  -[SearchUISingleContactTableViewCellAccessibility updateThumbnailViewForResult:](&v3, sel_updateThumbnailViewForResult_, a3);
}

- (id)_axActionButton
{
  void *v2;
  void *v3;

  -[SearchUISingleContactTableViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessoryViewControllerForResult"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeValueForKey:", CFSTR("_view"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
