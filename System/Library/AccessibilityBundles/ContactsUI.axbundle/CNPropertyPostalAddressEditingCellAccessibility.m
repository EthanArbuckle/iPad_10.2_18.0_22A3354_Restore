@implementation CNPropertyPostalAddressEditingCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CNPropertyPostalAddressEditingCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:", CFSTR("CNPropertyEditingCell"));
  objc_msgSend(v3, "validateClass:", CFSTR("CNAddressComponentTextFieldCell"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CNAddressComponentTextFieldCell"), CFSTR("textFields"), "@", 0);
  objc_msgSend(v3, "validateClass:hasProperty:withType:", CFSTR("CNPropertyEditingCell"), CFSTR("labelButton"), "@");

}

- (id)accessibilityElements
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  char v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v17 = 0;
  objc_opt_class();
  -[CNPropertyPostalAddressEditingCellAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("labelButton"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)objc_opt_new();
  objc_msgSend(v5, "axSafelyAddObject:", v4);
  -[CNPropertyPostalAddressEditingCellAccessibility _accessibilityFindSubviewDescendantsPassingTest:](self, "_accessibilityFindSubviewDescendantsPassingTest:", &__block_literal_global_3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "safeArrayForKey:", CFSTR("textFields"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "axSafelyAddObjectsFromArray:", v11);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
    }
    while (v8);
  }

  return v5;
}

uint64_t __72__CNPropertyPostalAddressEditingCellAccessibility_accessibilityElements__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  MEMORY[0x23490B8B0](CFSTR("CNAddressComponentTextFieldCell"));
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

@end
