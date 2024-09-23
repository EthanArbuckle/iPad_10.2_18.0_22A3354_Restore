@implementation WDAddDataManualEntryItemAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("WDAddDataManualEntryItem");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WDAddDataManualEntryItem"), CFSTR("_createWDManualDataEntryTableViewCellWithDisplayName: unitName: entryType: highlightWhenEditing:"), "@", "@", "Q", "B", 0);
}

- (id)_createWDManualDataEntryTableViewCellWithDisplayName:(id)a3 unitName:(id)a4 entryType:(unint64_t)a5 highlightWhenEditing:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v16;
  char v17;

  v6 = a6;
  v10 = a3;
  v11 = a4;
  v17 = 0;
  v16.receiver = self;
  v16.super_class = (Class)WDAddDataManualEntryItemAccessibility;
  -[WDAddDataManualEntryItemAccessibility _createWDManualDataEntryTableViewCellWithDisplayName:unitName:entryType:highlightWhenEditing:](&v16, sel__createWDManualDataEntryTableViewCellWithDisplayName_unitName_entryType_highlightWhenEditing_, v10, v11, a5, v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilitySafeClass();
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
    abort();
  -[WDAddDataManualEntryItemAccessibility accessibilityLabel](self, "accessibilityLabel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "_accessibilitySetRetainedValue:forKey:", v14, CFSTR("AXDisplayLabelOverrideKey"));

  objc_msgSend(v13, "_accessibilityLoadAccessibilityInformation");
  return v13;
}

@end
